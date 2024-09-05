//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Gustavo Guedes on 23/08/24.
//

import UIKit

final class CalculatorViewController: UIViewController {
	private var calculatorView: CalculatorView? = nil
	private var calculatorViewModel = CalculatorViewModel()
	
	var currentValue: Double = 0
	var leftValue: Double = 0
	var rightValue: Double = 0
	var action: ActionType? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		calculatorView?.buttonsDelegate = self
		calculatorViewModel = CalculatorViewModel()
	}
	
	override func loadView() {
		view = CalculatorView()
		calculatorView = view as? CalculatorView
		calculatorView?.setup()
	}
}

//MARK: - CalculatorButtonViewDelegate

extension CalculatorViewController: CalculatorButtonViewDelegate {
	func didTapButton(_ sender: UIButton) {
		if let buttonValue = sender.currentTitle {
			let newValue = calculatorViewModel.didTapButton(buttonValue: buttonValue)
			
			calculatorView?.updateResult(newValue)
		}
	}
}
