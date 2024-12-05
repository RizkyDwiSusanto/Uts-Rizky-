import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = '';  // The input string where numbers and operators are stored
  String result = '0'; // The result display on the screen
  String operator = ''; // The current operator selected
  double num1 = 0; // First operand
  double num2 = 0; // Second operand

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        input = ''; // Reset the input string
        result = '0'; // Reset the result
        num1 = 0;
        num2 = 0;
        operator = ''; // Reset operator
      } else if (value == '=' && operator.isNotEmpty) {
        num2 = double.parse(input); // Get second number
        // Perform the operation based on the operator
        if (operator == '+') result = (num1 + num2).toString();
        if (operator == '-') result = (num1 - num2).toString();
        if (operator == '×') result = (num1 * num2).toString();
        if (operator == '÷' && num2 != 0) result = (num1 / num2).toString();
        if (num2 == 0 && operator == '÷') result = 'Error'; // Handle division by zero
        input = ''; // Reset input for the next operation
        operator = ''; // Clear operator for new operations
      } else if ('+−×÷'.contains(value)) {
        if (input.isNotEmpty) {
          num1 = double.parse(input); // Store the first number when an operator is pressed
        }
        operator = value; // Store the selected operator
        input = ''; // Clear input to receive the next number
      } else {
        input += value; // Append the pressed value to the input string
        result = input; // Update the result with the current input
      }
    });
  }

  // Create a calculator button with stylish design
  Widget calculatorButton(String label,
      {Color bgColor = Colors.white, Color textColor = Colors.black}) {
    return GestureDetector(
      onTap: () => buttonPressed(label),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(4, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Kalkulator',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Result Display
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              alignment: Alignment.bottomRight,
              color: Colors.white,
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Buttons Grid
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  calculatorButton('C', bgColor: Colors.red, textColor: Colors.white),
                  calculatorButton('÷', bgColor: Colors.orange, textColor: Colors.white),
                  calculatorButton('×', bgColor: Colors.orange, textColor: Colors.white),
                  calculatorButton('−', bgColor: Colors.orange, textColor: Colors.white),
                  calculatorButton('7'),
                  calculatorButton('8'),
                  calculatorButton('9'),
                  calculatorButton('+', bgColor: Colors.orange, textColor: Colors.white),
                  calculatorButton('4'),
                  calculatorButton('5'),
                  calculatorButton('6'),
                  calculatorButton('=', bgColor: Colors.green, textColor: Colors.white),
                  calculatorButton('1'),
                  calculatorButton('2'),
                  calculatorButton('3'),
                  calculatorButton('0', bgColor: Colors.grey[300]!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
