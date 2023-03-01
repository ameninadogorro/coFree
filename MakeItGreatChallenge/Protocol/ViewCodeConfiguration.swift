//
//  ViewCodeConfiguration.swift
//  MakeItGreatChallenge
//
//  Created by Israel Carvalho on 14/02/23.
//

import Foundation
protocol ViewCodeConfiguration {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCodeConfiguration {
    func applyViewCode() {
        buildHierarchy()
        setupConstraints( )
        configureViews()
    }
}
