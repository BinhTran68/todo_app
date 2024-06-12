import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final double fontSize;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final BorderSide border;
  final dynamic icon; // Sử dụng kiểu dữ liệu động (dynamic) cho icon

  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.fontSize = 16.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.textColor = Colors.white,
    this.border = BorderSide.none,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: border,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildChildren(), // Sử dụng phương thức _buildChildren() để xây dựng danh sách các widget con
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [];
    // Kiểm tra kiểu dữ liệu của biến icon và thêm widget tương ứng vào danh sách children
    if (icon is IconData) {
      children.add(Icon(icon, color: textColor));
      children.add(const SizedBox(width: 8));
    } else if (icon is String) {
      // Nếu là một đường dẫn hình ảnh (Image)
      children.add(Image.asset(icon, width: 24, height:24 )); // Thay đổi kích thước tùy ý
      children.add(const SizedBox(width: 8));
    } else if (icon is Widget) {
      // Nếu là một widget tùy chỉnh khác
      children.add(icon);
      children.add(const SizedBox(width: 8));
    }

    // Thêm phần văn bản
    children.add(Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
      ),
    ));

    return children;
  }
}
