import 'package:flutter/material.dart';

class CostumButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const CostumButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
          ),
          padding: EdgeInsetsGeometry.all(17),

          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
