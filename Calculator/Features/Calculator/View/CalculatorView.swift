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
		
		return label
	}()
	
	private lazy var one = CalculatorButtonView(text: "1")
	private lazy var two = CalculatorButtonView(text: "2")
	private lazy var three = CalculatorButtonView(text: "3")
	private lazy var plus = CalculatorButtonView(text: "+", buttonColor: .orange)
	private lazy var four = CalculatorButtonView(text: "4")
	private lazy var five = CalculatorButtonView(text: "5")
	private lazy var six = CalculatorButtonView(text: "6")
	private lazy var minus = CalculatorButtonView(text: "-", buttonColor: .orange)
	private lazy var seven = CalculatorButtonView(text: "7")
	private lazy var eight = CalculatorButtonView(text: "8")
	private lazy var nine = CalculatorButtonView(text: "9")
	private lazy var multiply = CalculatorButtonView(text: "x", buttonColor: .orange)
	private lazy var clear = CalculatorButtonView(text: "AC", textColor: .black, buttonColor: .lightGray)
	private lazy var positiveNegative = CalculatorButtonView(text: "+/-", textColor: .black, buttonColor: .lightGray)
	private lazy var percent = CalculatorButtonView(text: "%", textColor: .black, buttonColor: .lightGray)
	private lazy var divide = CalculatorButtonView(text: "/", buttonColor: .orange)
	private lazy var zero = CalculatorButtonView(text: "0", ignoreWidthConstraints: true, alignLeft: true)
	private lazy var dot = CalculatorButtonView(text: ",")
	private lazy var equal = CalculatorButtonView(text: "=", buttonColor: .orange)
	
	init() {
		super.init(frame: .zero)
		
		backgroundColor = .black
		
		addSubviews()
		putConstrains()
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
	
	private func addSubviews() {
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
		addSubview(dot)
		addSubview(equal)
		addSubview(result)
	}
	
	private func putConstrains() {
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
		dotConstraints()
		equalConstraints()
		resultConstraints()
	}
	
	private func zeroConstraints() {
		NSLayoutConstraint.activate([
			zero.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			zero.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
			zero.widthAnchor.constraint(equalToConstant: CalculatorButtonView.elementWidth * 2 + 16)
		])
	}

	private func dotConstraints() {
		NSLayoutConstraint.activate([
			dot.leadingAnchor.constraint(equalTo: zero.trailingAnchor, constant: 16),
			dot.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
		])
	}

	private func equalConstraints() {
		NSLayoutConstraint.activate([
			equal.leadingAnchor.constraint(equalTo: dot.trailingAnchor, constant: 16),
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
			result.trailingAnchor.constraint(equalTo: divide.trailingAnchor, constant: -16)
		])
	}
}
