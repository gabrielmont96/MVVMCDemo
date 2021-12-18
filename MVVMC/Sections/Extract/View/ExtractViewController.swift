//
//  ExtractViewController.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import UIKit

class ExtractViewController: UIViewController {
    
    var viewModel: ExtractViewModel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(viewModel: ExtractViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        title = viewModel.title
        dateLabel.text = Date().toString(with: .longDateTimeDetailed)
        amountLabel.text = String(viewModel.value)
        
        let closeBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_close"), style: .plain, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    @objc func close() {
        viewModel.close()
    }
}
