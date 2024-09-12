# iOS Calculator App - ViewCode

This project demonstrates how to build a fully functional calculator app using ViewCode in iOS. The main goal is to replicate the native iOS calculator's look and feel while highlighting key concepts such as componentization, dynamic layout handling, and responsiveness without using storyboards.

## Features

- Full UI created programmatically using ViewCode
- Componentized buttons and responsive layout
- Delegate pattern used for button interactions
- Custom styling and constraints for dynamic element positioning

## Getting Started

### Prerequisites
- Xcode 11 or higher
- iOS 13.0+
- Swift 5.0+

## Installation

1. Clone the repository:

```bash
git clone https://github.com/GugaDavi/viewcode-calculator
```
2. Open the project in Xcode:

```bash
cd ios-calculator-viewcode
open CalculatorApp.xcodeproj
```

3. Build and run the app using the iOS simulator or a physical device.

## Project Structure

- `CalculatorView.swift`: Handles the main view of the calculator, placing the buttons and result label.
- `CalculatorButtonView.swift`: Componentized button logic, including constraints and styles.
- `ViewCode.swift`: Protocol used to standardize the creation of components programmatically.
- `CalculatorViewModel.swift`: Place where every logic it is processing when a button it is tapped

## How It Works

The calculator interface is designed by dividing the screen into responsive grids where each button adjusts its size based on the screen's width. The buttons are componentized, allowing for easy reuse and customization. The CalculatorView is the container for all the buttons and the result display, while CalculatorButtonView is responsible for individual button creation.

Button interactions are managed through a delegate pattern, allowing the controller to respond to button presses and update the result display accordingly.

![Gravação de Tela 2024-09-11 às 22 33 36](https://github.com/user-attachments/assets/7f66a68a-fb54-49fb-8d1c-a12343e74b89)

## Further Reading
For a detailed breakdown of the project and how it was built, check out the article on Dev.to.

## License
This project is licensed under the MIT License.
