import 'package:bmi_calculator/bmi_colors.dart';
import 'package:flutter/material.dart';

class MaleORFemaleWidget extends StatelessWidget {
  const new({
    super.key,
    required this.gender,
    required this.genderIcon,
    required this.onTap,
    required this.genderCardColor,
  });

  final String gender;
  final IconData genderIcon;
  final Function() onTap;
  final Color genderCardColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: genderCardColor,
            borderRadius: BorderRadius.circular(20)
          ),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(genderIcon, size: 80, color: BmiColors.textColor),
              Text(
                "$gender",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20, color: BmiColors.textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
