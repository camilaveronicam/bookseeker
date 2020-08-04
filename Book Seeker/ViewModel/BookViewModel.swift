//
//  BookViewModel.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import UIKit

class BookViewModel: NSObject {
    
    static let shared = BookViewModel()
    
    var bookList: BookList?
    
    static func listBooks(completion: @escaping (Response<BookList?, Error>) -> Void) {
           
           let successHandler: (BookList) -> Void = { (bookList) in
               BookViewModel.shared.bookList = bookList
               completion(.Success(bookList))
           }
           let errorHandler: (Error) -> Void = { (error) in
               print(error)
               completion(.Failure(error))
           }
           
           APIRequest().get(urlString: baseURL,
                              successHandler: successHandler,
                              errorHandler: errorHandler)
           
       }
}

extension BookViewModel: UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension BookViewModel: UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let book = BookViewModel.shared.bookList {
            return book.resultCount
        }
        return 1
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let bookDetails = BookViewModel.shared.bookList, bookDetails.resultCount > 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? BookTableViewCell {
                cell.selectionStyle = .none
                cell.book = bookDetails.results[indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }

}
