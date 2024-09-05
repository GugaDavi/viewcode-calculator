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
	
	func testPlusOperations() throws {
		testPlusOperationSimple()
		testPlusOperationSimple2()
	}
	
	func testPlusOperationSimple() {
		viewModel = CalculatorViewModel()
		
		let leftValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(leftValue, 1)
		
		let plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 1)
		
		let rightValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(rightValue, 1)
		
		let equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 2)
	}
	
	func testPlusOperationSimple2() {
		viewModel = CalculatorViewModel()
		
		let leftValue = viewModel.didTapButton(buttonValue: "1")
		
		XCTAssertEqual(leftValue, 1)
		
		let plus = viewModel.didTapButton(buttonValue: "+")
		
		XCTAssertEqual(plus, 1)
		
		let rightValue = viewModel.didTapButton(buttonValue: "2")
		
		XCTAssertEqual(rightValue, 2)
		
		let equals = viewModel.didTapButton(buttonValue: "=")
		
		XCTAssertEqual(equals, 3)
	}
}
