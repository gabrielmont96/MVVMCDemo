//
//  Date+Extension.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import Foundation

extension Date {
    enum FormatDate: String {
        case longDateTimeDetailed = "MM/dd/yyyy 'at' HH:mm:SS"
    }

    func toString(with format: FormatDate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale.init(identifier: "pt_BR")
        return dateFormatter.string(from: self)
    }
}
