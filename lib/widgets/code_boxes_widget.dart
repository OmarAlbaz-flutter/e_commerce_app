import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeBoxesWidget extends StatefulWidget {
  const CodeBoxesWidget({super.key});

  @override
  State<CodeBoxesWidget> createState() => _CodeBoxesWidgetState();
}

class _CodeBoxesWidgetState extends State<CodeBoxesWidget> {
  final int boxCount = 4;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(boxCount, (_) => TextEditingController());
    focusNodes = List.generate(boxCount, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double boxSize = 60;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(boxCount, (index) {
          return Container(
            width: boxSize,
            height: boxSize,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                ),
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                if (value.isNotEmpty && index < boxCount - 1) {
                  focusNodes[index + 1].requestFocus();
                } else if (value.isEmpty && index > 0) {
                  focusNodes[index - 1].requestFocus();
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
