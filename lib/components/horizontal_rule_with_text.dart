import 'package:flutter/material.dart';

class HorizontalRuleWithText extends StatelessWidget {
  final String centerText;

  const HorizontalRuleWithText({
    super.key,
    this.centerText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            centerText.isNotEmpty
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                centerText,
                style: const TextStyle(color: Colors.grey),
              ),
            )
                : SizedBox(), // Nếu rỗng thì sử dụng SizedBox thay vì Padding
            const Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
