//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Gustavo Guedes on 23/08/24.
//

import UIKit

final class CalculatorViewController: UIViewController {
	private var calculatorView: CalculatorView? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		buildView()
	}
	
	private func buildView() {
		view = CalculatorView()
		calculatorView = view as? CalculatorView
	}
}
