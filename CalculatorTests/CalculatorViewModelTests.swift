//
//  CalculatorViewControllerTests.swift
//  CalculatorViewControllerTests
//
//  Created by Gustavo Guedes on 23/08/24.
//

import XCTest
@testable import Calculator

final class CalculatorViewControllerTests: XCTestCase {
	private var viewModel: CalculatorViewModel!
	
	override func setUpWithError() throws {
		viewModel = CalculatorViewModel()
	}
	
	override func tearDownWithError() throws {
		viewModel = nil
	}
	
	//MARK: - Actions
	
	func testToggleSignAction() {
		let leftValue = viewModel.didTapButton(buttonValue: "2")
		
		XCTAssertEqual(leftValue, 2)
		
		let toggleSign = viewModel.didTapButton(buttonValue: "+/-")
		
		XCTAssertEqual(toggleSign, -2)
	}
	
	func testPercentAction() {
		let leftValue = viewModel.didTapButton(buttonValue: "2")
		
		XCTAssertEqual(leftValue, 2)
		
		let percent = viewModel.didTapButton(buttonValue: "%")
		
		XCTAssertEqual(percent, 0.02)
	}
	
	func testClearAction() {
		let leftValue = viewModel.didTapButton(buttonValue: "2")
		
		XCTAssertEqual(leftValue, 2)
		
		let clear = viewModel.didTapButton(buttonValue: "AC")
		
		XCTAssertEqual(clear, 0)
	}
	
	func testCommaAction() {
		var leftValue = viewModel.didTapButton(buttonValue: "2")
		
		XCTAssertEqual(leftValue, 2)
		
		let comma = viewModel.didTapButton(buttonValue: ",")
		
		XCTAssertEqual(comma, 2)
		
		leftValue = viewModel.didTapButton(buttonValue: "5")
		
		XCTAssertEqual(leftValue, 2.5)
		
		leftValue = viewModel.didTapButton(buttonValue: "6")
		
		XCTAssertEqual(leftValue, 2.56)
	}
	
	//MARK: - Unknow values
	
	func testUnknowValue() {
		let leftValue = viewModel.didTapButton(buttonValue: "some-unknow-value")
		
		XCTAssertEqual(leftValue, 0)
	}
	
	//MARK: - Operations
	
	func testDivideOperation() {
		let leftValue = viewModel.didTapButton(buttonValue: "2")
		
		XCTAssertEqual(leftValue, 2)
		
		let divide = viewModel.didTapButton(buttonValue: "/")
		
		XCTAssertEqual(divide, 2)
		
		let rightValue = viewModel.didTapButton(buttonValue: "2")
		
		XCTAssertEqual(rightValue, 2)
		
		let equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 1)
	}
	
	func testMultiplyOperation() {
		let leftValue = viewModel.didTapButton(buttonValue: "2")
		
		XCTAssertEqual(leftValue, 2)
		
		let multiply = viewModel.didTapButton(buttonValue: "x")
		
		XCTAssertEqual(multiply, 2)
		
		let rightValue = viewModel.didTapButton(buttonValue: "5")
		
		XCTAssertEqual(rightValue, 5)
		
		let equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 10)
	}
	
	func testMinusOperationSimple() {
		let leftValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(leftValue, 1)
		
		let minus = viewModel.didTapButton(buttonValue: "-")
		
		XCTAssertEqual(minus, 1)
		
		let rightValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(rightValue, 1)
		
		let equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 0)
	}
	
	func testMinusOperationDecimal() {
		let leftValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(leftValue, 1)
		
		let comma = viewModel.didTapButton(buttonValue: ",")
		
		XCTAssertEqual(comma, 1.0)
		
		let updatedLeftValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(updatedLeftValue, 1.1)
		
		let minus = viewModel.didTapButton(buttonValue: "-")
		
		XCTAssertEqual(minus, 1.1)
		
		var rightValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(rightValue, 1)
		
		rightValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(rightValue, 11)
		
		let equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, -9.9)
	}
	
	func testPlusOperationSimple() {
		let leftValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(leftValue, 1)
		
		let plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 1)
		
		let rightValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(rightValue, 1)
		
		let equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 2)
	}
	
	func testPlusOperationDecimal() {
		let leftValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(leftValue, 1)
		
		let comma = viewModel.didTapButton(buttonValue: ",")
		
		XCTAssertEqual(comma, 1.0)
		
		let updatedLeftValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(updatedLeftValue, 1.1)
		
		var plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 1.1)
		
		var rightValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(rightValue, 1)
		
		let equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 2.1)
		
		plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(equals, 2.1)
		
		rightValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(rightValue, 1)
	}
	
	func testSameOperation() {
		let leftValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(leftValue, 1)
		
		var plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 1)
		
		plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 1)
		
		let rightValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(rightValue, 1)
		
		plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 2)
		
		plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 2)
	}
	
	func testCascadeOperations() {
		let leftValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(leftValue, 1)
		
		let plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 1)
		
		let rightValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(rightValue, 1)
		
		var equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 2)
		
		equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 3)
		
		equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 4)
	}
	
	func testChangeOperation() {
		_ = viewModel.didTapButton(buttonValue: "1")
		let leftValue = viewModel.didTapButton(buttonValue: "0")
		
		XCTAssertEqual(leftValue, 10)
		
		let plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 10)
		
		let divide = viewModel.didTapButton(buttonValue: "/")
		
		XCTAssertEqual(divide, 10)
		
		let rightValue = viewModel.didTapButton(buttonValue: "2")
		
		XCTAssertEqual(rightValue, 2)
		
		let equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 5)
	}
	
	func testInitingWithOperation() {
		var leftValue = viewModel.didTapButton(buttonValue: "/")
		
		XCTAssertEqual(leftValue, 0)
		
		leftValue = viewModel.didTapButton(buttonValue: "/")
		
		XCTAssertEqual(leftValue, 0)
	}
	
	
	func testCascadeAfterClearOperations() {
		let leftValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(leftValue, 1)
		
		let plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 1)
		
		let rightValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(rightValue, 1)
		
		var equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 2)
		
		equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 3)
		
		let clear = viewModel.didTapButton(buttonValue: "C")
		
		XCTAssertEqual(clear, 0)
		
		equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 0)
		
		equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 0)
	}
	
	func testMultiplesOperations() {
		_ = viewModel.didTapButton(buttonValue: "1")
		let leftValue = viewModel.didTapButton(buttonValue: "0")
		
		XCTAssertEqual(leftValue, 10)
		
		var plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 10)
		
		var rightValue = viewModel.didTapButton(buttonValue: "5")
		
		XCTAssertEqual(rightValue, 5)
		
		let minus = viewModel.didTapButton(buttonValue: "-")
		
		XCTAssertEqual(minus, 15)
		
		rightValue = viewModel.didTapButton(buttonValue: "2")
		
		XCTAssertEqual(rightValue, 2)
		
		plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 13)
		
		rightValue = viewModel.didTapButton(buttonValue: "5")
		
		XCTAssertEqual(rightValue, 5)
		
		let equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 18)
	}
}
