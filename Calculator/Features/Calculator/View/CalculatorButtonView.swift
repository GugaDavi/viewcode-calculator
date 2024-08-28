//
//  CalculatorButtonView.swift
//  Calculator
//
//  Created by Gustavo Guedes on 24/08/24.
//

import UIKit

class CalculatorButtonView: UIView {
	private lazy var button: UILabel = {
		let label = UILabel()
		
		label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
		label.adjustsFontSizeToFitWidth = true
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	static var elementWidth = (UIScreen.main.bounds.width - 5 * 16) / 4
	
	init(text: String, textColor: UIColor? = .white, buttonColor: UIColor? = .darkGray, ignoreWidthConstraints: Bool = false, alignLeft: Bool = false) {
		super.init(frame: .zero)
		
		backgroundColor = buttonColor
		button.text = text
		button.textColor = textColor
		
		addSubview(button)
		
		NSLayoutConstraint.activate([
			button.centerYAnchor.constraint(equalTo: centerYAnchor),
			heightAnchor.constraint(equalToConstant: CalculatorButtonView.elementWidth)
		])
		
		if (!alignLeft) {
			NSLayoutConstraint.activate([
				button.centerXAnchor.constraint(equalTo: centerXAnchor),
			])
	
		} else {
			NSLayoutConstraint.activate([
				button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
			])
		}
		
		if (!ignoreWidthConstraints) {
			NSLayoutConstraint.activate([
				widthAnchor.constraint(equalToConstant: CalculatorButtonView.elementWidth)
			])
		}
		layer.cornerRadius = CalculatorButtonView.elementWidth / 2
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
}
