//
//  TransferViewController.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import UIKit

class TransferViewController: UIViewController {
    
    var viewModel: TransferViewModel!
    @IBOutlet weak var ammoumtLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(viewModel: TransferViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        title = viewModel.title
        ammoumtLabel.text = String(viewModel.value)
    }
    
    @IBAction func showExtract(_ sender: Any) {
        viewModel.extract()
    }
}
