//
//  BookListViewController.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import UIKit

class BookListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    fileprivate var viewModel: BookViewModel = BookViewModel.shared
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureTableView()
        
        listBooks()
      
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    //MARK: - Private Methods
    
    private func configureTableView() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(BookTableViewCell.nib, forCellReuseIdentifier: BookTableViewCell.identifier)
    }

    private func listBooks() {
        
        let completionHandler: (Response<BookList?,Error>) -> Void = { (response) in
            
            DispatchQueue.main.async {
                
               // LoadingView.shared.stopLoading()
                
                switch response {
                case .Success(let providers):
                    
                    guard let _ = providers else { return }
                  
                    self.tableView.reloadData()
                    
                case .Failure(let error):
                    print("the error \(error)")
                    
                }
            }
        }
        
        //LoadingView.shared.startLoading(with:"")
        BookViewModel.listBooks(completion: completionHandler)
    }
}
