//
//  CalculatorButtonView.swift
//  Calculator
//
//  Created by Gustavo Guedes on 24/08/24.
//

import UIKit

protocol CalculatorButtonViewDelegate: AnyObject {
	func didTapButton(_ sender: UIButton)
}

class CalculatorButtonView: UIView {
	private lazy var button: UIButton = {
		let button = UIButton()
		
		button.titleLabel?.adjustsFontSizeToFitWidth = true
		button.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .medium)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
		
		return button
	}()
	
	static var elementWidth = (UIScreen.main.bounds.width - 5 * 16) / 4
	
	weak var delegate: CalculatorButtonViewDelegate?
	var isSelected = false
	
	init() {
		super.init(frame: .zero)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
	
	@objc
	private func onTap(sender: UIButton) {
		delegate?.didTapButton(sender)
		runAnimation()
	}
	
	func updateTitle(_ newTitle: String) {
		button.setTitle(newTitle, for: .normal)
	}
	
	func runSelectButtonAnimation() {
		isSelected = !isSelected
		let currentBackgroundColor = backgroundColor
		let currentButtonTextColor = button.currentTitleColor
		
		UIView.animate(withDuration: 0.2, animations:  {
			self.backgroundColor = currentButtonTextColor
			self.button.setTitleColor(currentBackgroundColor, for: .normal)
		})
	}
	
	private func runAnimation() {
		let currentBackgroundColor = backgroundColor
		if backgroundColor == .darkGray {
			UIView.animate(withDuration: 0.2, animations:  {
				self.backgroundColor = .white.withAlphaComponent(0.7)
			}, completion: { finished in
				UIView.animate(withDuration: 0.2) {
					self.backgroundColor = currentBackgroundColor
				}
			})
		} else if backgroundColor == .lightGray {
			UIView.animate(withDuration: 0.2, animations:  {
				self.backgroundColor = .white.withAlphaComponent(0.8)
			}, completion: { finished in
				UIView.animate(withDuration: 0.2) {
					self.backgroundColor = currentBackgroundColor
				}
			})
		}
	}
	
	func setup(
		text: String,
		textColor: UIColor? = .white,
		buttonColor: UIColor? = .darkGray,
		alignLeft: Bool = false,
		width: CGFloat? = nil,
		height: CGFloat? = nil
	) {
		backgroundColor = buttonColor
		button.setTitle(text, for: .normal)
		button.setTitleColor(textColor, for: .normal)
		
		if (!alignLeft) {
			NSLayoutConstraint.activate([
				button.centerXAnchor.constraint(equalTo: centerXAnchor),
			])
			
		} else {
			NSLayoutConstraint.activate([
				button.titleLabel!.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 24),
			])
		}
		
		NSLayoutConstraint.activate([
			widthAnchor.constraint(equalToConstant: width ?? CalculatorButtonView.elementWidth),
			button.widthAnchor.constraint(equalToConstant: width ?? CalculatorButtonView.elementWidth),
			button.heightAnchor.constraint(equalToConstant: height ?? CalculatorButtonView.elementWidth),
		])
	}
}

//MARK: - ViewCode

extension CalculatorButtonView: ViewCode {
	func addSubviews() {
		addSubview(button)
	}
	
	func setupConstrainsts() {
		NSLayoutConstraint.activate([
			button.centerYAnchor.constraint(equalTo: centerYAnchor),
			heightAnchor.constraint(equalToConstant: CalculatorButtonView.elementWidth)
		])
	}
	
	func setupStyles() {
		layer.cornerRadius = CalculatorButtonView.elementWidth / 2
		translatesAutoresizingMaskIntoConstraints = false
	}
	
}
