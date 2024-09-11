//
//  CalculatorView.swift
//  Calculator
//
//  Created by Gustavo Guedes on 23/08/24.
//

import UIKit

class CalculatorView: UIView {
	private lazy var result: UILabel = {
		let label = UILabel()
		
		label.text = "0"
		label.font = UIFont.systemFont(ofSize: 80)
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .right
		
		return label
	}()
	
	weak var buttonsDelegate: CalculatorButtonViewDelegate? {
		willSet {
			one.delegate = newValue
			two.delegate = newValue
			three.delegate = newValue
			plus.delegate = newValue
			four.delegate = newValue
			five.delegate = newValue
			six.delegate = newValue
			minus.delegate = newValue
			seven.delegate = newValue
			eight.delegate = newValue
			nine.delegate = newValue
			multiply.delegate = newValue
			clear.delegate = newValue
			positiveNegative.delegate = newValue
			percent.delegate = newValue
			divide.delegate = newValue
			zero.delegate = newValue
			comma.delegate = newValue
			equal.delegate = newValue
		}
	}
	
	private lazy var one: CalculatorButtonView = {
		let one = CalculatorButtonView()
		one.setup(text: "1")
		return one
	}()
	
	private lazy var two: CalculatorButtonView = {
		let two = CalculatorButtonView()
		two.setup(text: "2")
		return two
	}()
	
	private lazy var three: CalculatorButtonView = {
		let three = CalculatorButtonView()
		three.setup(text: "3")
		return three
	}()
	
	private lazy var plus: CalculatorButtonView = {
		let plus = CalculatorButtonView()
		plus.setup(text: "+", buttonColor: .orange)
		return plus
	}()
	
	private lazy var four: CalculatorButtonView = {
		let four = CalculatorButtonView()
		four.setup(text: "4")
		return four
	}()
	
	private lazy var five: CalculatorButtonView = {
		let five = CalculatorButtonView()
		five.setup(text: "5")
		return five
	}()
	
	private lazy var six: CalculatorButtonView = {
		let six = CalculatorButtonView()
		six.setup(text: "6")
		return six
	}()
	
	private lazy var minus: CalculatorButtonView = {
		let minus = CalculatorButtonView()
		minus.setup(text: "-", buttonColor: .orange)
		return minus
	}()
	
	private lazy var seven: CalculatorButtonView = {
		let seven = CalculatorButtonView()
		seven.setup(text: "7")
		return seven
	}()
	
	private lazy var eight: CalculatorButtonView = {
		let eight = CalculatorButtonView()
		eight.setup(text: "8")
		return eight
	}()
	
	private lazy var nine: CalculatorButtonView = {
		let nine = CalculatorButtonView()
		nine.setup(text: "9")
		return nine
	}()
	
	private lazy var multiply: CalculatorButtonView = {
		let multiply = CalculatorButtonView()
		multiply.setup(text: "x", buttonColor: .orange)
		return multiply
	}()
	
	private lazy var clear: CalculatorButtonView = {
		let clear = CalculatorButtonView()
		clear.setup(text: "AC", textColor: .black, buttonColor: .lightGray)
		return clear
	}()
	
	private lazy var positiveNegative: CalculatorButtonView = {
		let positiveNegative = CalculatorButtonView()
		positiveNegative.setup(text: "+/-", textColor: .black, buttonColor: .lightGray)
		return positiveNegative
	}()
	
	private lazy var percent: CalculatorButtonView = {
		let percent = CalculatorButtonView()
		percent.setup(text: "%", textColor: .black, buttonColor: .lightGray)
		return percent
	}()
	
	private lazy var divide: CalculatorButtonView = {
		let divide = CalculatorButtonView()
		divide.setup(text: "/", buttonColor: .orange)
		return divide
	}()
	
	private lazy var zero: CalculatorButtonView = {
		let zero = CalculatorButtonView()
		zero.setup(text: "0", alignLeft: true, width: CalculatorButtonView.elementWidth * 2 + 16)
		return zero
	}()
	
	private lazy var comma: CalculatorButtonView = {
		let comma = CalculatorButtonView()
		comma.setup(text: ",")
		return comma
	}()
	
	private lazy var equal: CalculatorButtonView = {
		let equal = CalculatorButtonView()
		equal.setup(text: "=", buttonColor: .orange)
		return equal
	}()
	
	init() {
		super.init(frame: .zero)
		
		backgroundColor = .black
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
	
	func updateResult(_ newValue: Double) {
		let justInt = floor(newValue)
		let isInt = justInt == newValue
		
		if (isInt) {
			result.text = String(Int(justInt))
		} else {
			result.text = String(newValue)
		}
		
		clear.updateTitle(result.text == "0" ? "AC" : "C")
	}
	
	func selectOperationButton(_ actionType: ActionType?) {
		if actionType == ActionType.divide && !divide.isSelected {
			divide.runSelectButtonAnimation()
			unselectOtherButtons(divide)
		} else if  actionType == ActionType.multiply && !multiply.isSelected {
			multiply.runSelectButtonAnimation()
			unselectOtherButtons(multiply)
		} else if actionType == ActionType.minus && !minus.isSelected {
			minus.runSelectButtonAnimation()
			unselectOtherButtons(minus)
		} else if actionType == ActionType.plus && !plus.isSelected {
			plus.runSelectButtonAnimation()
			unselectOtherButtons(plus)
		} else {
			unselectOtherButtons()
		}
	}
	
	private func unselectOtherButtons(_ selectedButton: CalculatorButtonView? = nil) {
		var operationButtons = [divide, multiply, minus, plus]
		
		operationButtons.removeAll { item in
			return item == selectedButton
		}
		
		operationButtons.forEach { button in
			if button.isSelected {
				button.runSelectButtonAnimation()
			}
		}
	}
	
	//MARK: - Constraints
	
	private func zeroConstraints() {
		NSLayoutConstraint.activate([
			zero.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			zero.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
		])
	}
	
	private func commaConstraints() {
		NSLayoutConstraint.activate([
			comma.leadingAnchor.constraint(equalTo: zero.trailingAnchor, constant: 16),
			comma.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
		])
	}
	
	private func equalConstraints() {
		NSLayoutConstraint.activate([
			equal.leadingAnchor.constraint(equalTo: comma.trailingAnchor, constant: 16),
			equal.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
		])
	}
	
	private func oneConstraints() {
		NSLayoutConstraint.activate([
			one.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			one.bottomAnchor.constraint(equalTo: zero.topAnchor, constant: -16),
		])
	}
	
	private func twoConstraints() {
		NSLayoutConstraint.activate([
			two.leadingAnchor.constraint(equalTo: one.trailingAnchor, constant: 16),
			two.centerYAnchor.constraint(equalTo: one.centerYAnchor),
		])
	}
	
	private func threeConstraints() {
		NSLayoutConstraint.activate([
			three.leadingAnchor.constraint(equalTo: two.trailingAnchor, constant: 16),
			three.centerYAnchor.constraint(equalTo: two.centerYAnchor),
		])
	}
	
	
	private func plusConstraints() {
		NSLayoutConstraint.activate([
			plus.leadingAnchor.constraint(equalTo: three.trailingAnchor, constant: 16),
			plus.centerYAnchor.constraint(equalTo: three.centerYAnchor),
		])
	}
	
	private func fourConstraints() {
		NSLayoutConstraint.activate([
			four.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			four.bottomAnchor.constraint(equalTo: one.topAnchor, constant: -16),
		])
	}
	
	private func fiveConstraints() {
		NSLayoutConstraint.activate([
			five.leadingAnchor.constraint(equalTo: four.trailingAnchor, constant: 16),
			five.bottomAnchor.constraint(equalTo: two.topAnchor, constant: -16),
		])
	}
	
	private func sixConstraints() {
		NSLayoutConstraint.activate([
			six.leadingAnchor.constraint(equalTo: five.trailingAnchor, constant: 16),
			six.bottomAnchor.constraint(equalTo: three.topAnchor, constant: -16),
		])
	}
	private func minusConstraints() {
		NSLayoutConstraint.activate([
			minus.leadingAnchor.constraint(equalTo: six.trailingAnchor, constant: 16),
			minus.bottomAnchor.constraint(equalTo: plus.topAnchor, constant: -16),
		])
	}
	
	private func sevenConstraints() {
		NSLayoutConstraint.activate([
			seven.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			seven.bottomAnchor.constraint(equalTo: four.topAnchor, constant: -16),
		])
	}
	
	private func eightConstraints() {
		NSLayoutConstraint.activate([
			eight.leadingAnchor.constraint(equalTo: seven.trailingAnchor, constant: 16),
			eight.bottomAnchor.constraint(equalTo: five.topAnchor, constant: -16),
		])
	}
	
	private func nineConstraints() {
		NSLayoutConstraint.activate([
			nine.leadingAnchor.constraint(equalTo: eight.trailingAnchor, constant: 16),
			nine.bottomAnchor.constraint(equalTo: six.topAnchor, constant: -16),
		])
	}
	
	private func multiplyConstraints() {
		NSLayoutConstraint.activate([
			multiply.leadingAnchor.constraint(equalTo: nine.trailingAnchor, constant: 16),
			multiply.bottomAnchor.constraint(equalTo: minus.topAnchor, constant: -16),
		])
	}
	
	private func clearConstraints() {
		NSLayoutConstraint.activate([
			clear.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			clear.bottomAnchor.constraint(equalTo: seven.topAnchor, constant: -16),
		])
	}
	
	private func positiveNegativeConstraints() {
		NSLayoutConstraint.activate([
			positiveNegative.leadingAnchor.constraint(equalTo: clear.trailingAnchor, constant: 16),
			positiveNegative.bottomAnchor.constraint(equalTo: eight.topAnchor, constant: -16),
		])
	}
	
	private func percentConstraints() {
		NSLayoutConstraint.activate([
			percent.leadingAnchor.constraint(equalTo: positiveNegative.trailingAnchor, constant: 16),
			percent.bottomAnchor.constraint(equalTo: nine.topAnchor, constant: -16),
		])
	}
	
	private func devideConstraints() {
		NSLayoutConstraint.activate([
			divide.leadingAnchor.constraint(equalTo: percent.trailingAnchor, constant: 16),
			divide.bottomAnchor.constraint(equalTo: multiply.topAnchor, constant: -16),
		])
	}
	
	private func resultConstraints() {
		NSLayoutConstraint.activate([
			result.bottomAnchor.constraint(equalTo: divide.topAnchor, constant: -24),
			result.trailingAnchor.constraint(equalTo: divide.trailingAnchor, constant: -16),
			result.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
		])
	}
}

//MARK: - ViewCode

extension CalculatorView: ViewCode {
	func setupStyles() {}
	
	func setupConstrainsts() {
		oneConstraints()
		twoConstraints()
		threeConstraints()
		fourConstraints()
		plusConstraints()
		fiveConstraints()
		sixConstraints()
		minusConstraints()
		sevenConstraints()
		eightConstraints()
		nineConstraints()
		multiplyConstraints()
		clearConstraints()
		positiveNegativeConstraints()
		percentConstraints()
		devideConstraints()
		zeroConstraints()
		commaConstraints()
		equalConstraints()
		resultConstraints()
	}
	
	func addSubviews() {
		addSubview(one)
		addSubview(two)
		addSubview(three)
		addSubview(plus)
		addSubview(four)
		addSubview(five)
		addSubview(six)
		addSubview(minus)
		addSubview(seven)
		addSubview(eight)
		addSubview(nine)
		addSubview(multiply)
		addSubview(clear)
		addSubview(positiveNegative)
		addSubview(percent)
		addSubview(divide)
		addSubview(zero)
		addSubview(comma)
		addSubview(equal)
		addSubview(result)
	}
}
