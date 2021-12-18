//
//  StyleButton.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 18/12/21.
//

import UIKit

class StyleButton: UIButton {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        backgroundColor = .black
        layer.cornerRadius = frame.height / 2
        setupText()
    }
    
    func setupText() {
        titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .highlighted)
        setTitleColor(.white, for: .focused)
        setTitleColor(.white, for: .disabled)
    }
}
