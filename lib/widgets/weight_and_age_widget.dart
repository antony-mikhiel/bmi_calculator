import 'package:bmi_calculator/bmi_colors.dart';
import 'package:flutter/material.dart';

class WeightAndAgeWidget extends StatelessWidget {
  const new({
    super.key,
    required this.name,
    required this.value,
    required this.add,
    required this.remove

  });


  final String name;
  final int value;
  final Function() add;
  final Function() remove;

  @override
  Widget build(BuildContext context){

    return Expanded(
      child: Container(
        child: Row(
          spacing: 15,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: BmiColors.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$name",
                      style: TextStyle(
                        color: BmiColors.textColor,
                        fontSize: 20,
                      ),
                    ),
    
                    Text(
                      "$value",
                      style: TextStyle(
                        color: BmiColors.textColor,
                        fontSize: 40,
                      ),
                    ),
    
                    Row(
                      spacing: 30,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            iconSize: 40.0,
                            backgroundColor: BmiColors.greyColor,
                            foregroundColor: BmiColors.textColor,
                          ),
    
                          onPressed: remove,
                          icon: Icon(Icons.remove),
                        ),
    
    
    
    
                        IconButton(
                          style: IconButton.styleFrom(
                            iconSize: 40.0,
                            backgroundColor: BmiColors.greyColor,
                            foregroundColor: BmiColors.textColor,
                          ),
    
                          onPressed: add,
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    
          ],
        ),
      ),
    );
  }
}
