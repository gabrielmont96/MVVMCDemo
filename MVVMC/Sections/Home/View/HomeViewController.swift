//
//  HomeViewController.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel!
    @IBOutlet weak var amountTextField: UITextField!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(viewModel: HomeViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        title = viewModel.title
    }
    
    @IBAction func transfer(_ sender: Any) {
        guard let doubleValue = Double(self.amountTextField.text ?? "0.0"), doubleValue != 0.0 else {
            print("Invalid value!")
            return
        }
        viewModel.doTransfer(value: doubleValue)
    }
}
