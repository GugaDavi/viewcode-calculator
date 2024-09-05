//
//  ViewCode.swift
//  Calculator
//
//  Created by Gustavo Guedes on 28/08/24.
//

import Foundation

protocol ViewCode {
	func addSubviews()
	func setupConstrainsts()
	func setupStyles()
}

extension ViewCode {
	func setup() {
		addSubviews()
		setupConstrainsts()
		setupStyles()
	}
}
