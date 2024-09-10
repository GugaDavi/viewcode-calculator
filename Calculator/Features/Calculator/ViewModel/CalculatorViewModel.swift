//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Gustavo Guedes on 03/09/24.
//

import Foundation

enum ActionType {
	case plus, multiply, minus, percent, toggleSign, comma, divide, clear, calc
}

class CalculatorViewModel {
	private let numbers: [String : Int] = ["0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9]
	private let actions = [
		"/": ActionType.divide,
		"x": ActionType.multiply,
		"+": ActionType.plus,
		"-": ActionType.minus,
		"%": ActionType.percent,
		"+/-": ActionType.toggleSign,
		",": ActionType.comma,
		"AC": ActionType.clear,
		"C": ActionType.clear,
		"=": ActionType.calc,
	]
	
	private var leftValue: Double = 0
	private var rightValue: Double = 0
	private var currentAction: ActionType? = nil
	private var lastOperation: (Double, ActionType)? = nil
	
	func didTapButton(buttonValue: String) -> Double {
		let currentValue = getCurrentValue()
		if let buttonNumber = numbers[buttonValue] {
			let isInt = floor(currentValue) == currentValue
			
			if (isInt) {
				if (currentAction == .comma) {
					let newValue: Double? = currentValue + (Double("\(0).\(buttonNumber)") ?? 0)
					
					return proccessCurrentValue(value: newValue ?? buttonNumber.toDouble(), action: nil)
				}
				
				let newValue = Int("\(Int(currentValue))\(buttonNumber)") ?? buttonNumber
				
				return proccessCurrentValue(value: newValue.toDouble(), action: nil)
			}
			
			let newValue: Double = Double("\(currentValue)\(buttonNumber)") ?? buttonNumber.toDouble()
			
			return proccessCurrentValue(value: newValue, action: nil)
		}
		
		if let buttonAction = actions[buttonValue] {
			let (newCurrentValue, newAction) = processAction(currentValue: currentValue, action: buttonAction)
			
			return proccessCurrentValue(value: newCurrentValue, action: newAction)
		}
		
		return proccessCurrentValue(value: 0, action: nil)
	}
	
	private func proccessCurrentValue(value: Double, action: ActionType?) -> Double {
		if (action == ActionType.clear) {
			currentAction = nil
			rightValue = 0
			leftValue = 0
			
			return leftValue
		} else if (action == ActionType.calc) {
			if let lastAction = lastOperation?.1, currentAction == nil {
				currentAction = lastAction
			}
			
			if let lastRightValue = lastOperation?.0, rightValue == 0 {
				rightValue = lastRightValue
			}
			
			guard let safeAction = currentAction else {
				return leftValue
			}
			
			let newValue = calcResult(leftNumber: leftValue, rightNumber: rightValue, action: safeAction)
			lastOperation = (rightValue, safeAction)
			leftValue = newValue
			currentAction = nil
			rightValue = 0
			
			return leftValue
		}
		
		if (currentAction == ActionType.divide || currentAction == ActionType.minus || currentAction == ActionType.multiply || currentAction == ActionType.plus) {
			if (action != nil) {
				let newValue = calcResult(leftNumber: leftValue, rightNumber: rightValue, action: action!)
				leftValue = newValue
				currentAction = action
				rightValue = 0
				
				return leftValue
			}
			
			rightValue = value
			return rightValue
		}
		
		leftValue = value
		currentAction = action
		
		return leftValue
	}
	
	private func processAction(currentValue: Double, action: ActionType) -> (Double, ActionType?) {
		var newValue = currentValue
		var newAction: ActionType? = nil
		
		switch action {
		case .clear:
			newAction = .clear
		case .toggleSign:
			newValue *= -1
		case .percent:
			newValue /= 100
		case .plus:
			newAction = .plus
		case .multiply:
			newAction = .multiply
		case .minus:
			newAction = .minus
		case .comma:
			newAction = .comma
		case .divide:
			newAction = .divide
		case .calc:
			newAction = .calc
		}
		
		return (newValue, newAction)
	}
	
	private func getCurrentValue() -> Double {
		return switch currentAction {
		case .plus:
			rightValue
		case .divide:
			rightValue
		case .minus:
			rightValue
		case .multiply:
			rightValue
		default:
			leftValue
		}
	}
	
	private func calcResult(leftNumber: Double, rightNumber: Double, action: ActionType) -> Double {
		return switch action {
		case .plus:
			leftNumber + rightNumber
		case .divide:
			leftNumber / rightNumber
		case .minus:
			leftNumber - rightNumber
		case .multiply:
			leftNumber * rightNumber
		default:
			fatalError("Does not be able to call calcResult with this actionType: \(action)")
		}
	}
}

extension Int {
	func toDouble() -> Double {
		return Double(self)
	}
}
