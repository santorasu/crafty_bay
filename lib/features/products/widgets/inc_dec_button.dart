import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key, required this.onChanged});

  final Function(int) onChanged;

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildIconButton(
          onTap: () {
            if (value <= 1) return;
              value--;
            setState(() {});
            widget.onChanged(value);
          },
          icon: Icons.remove,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text('$value', style: TextStyle(fontSize: 18)),
        ),
        buildIconButton(
          onTap: () {
            if (value >= 20) return;
            value++;
            setState(() {});
          },
          icon: Icons.add,
        ),
      ],
    );
  }

  Widget buildIconButton({
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColor.themeColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );
  }
}
