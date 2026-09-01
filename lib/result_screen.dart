import 'package:bmi_calculator/bmi_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.bmiRange,
    required this.bmiValue,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });

  final String bmiRange;
  final double bmiValue;
  final String gender;
  final int height;
  final int weight;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BmiColors.bgColor,
      appBar: AppBar(
        title: Text("Your results"),
        centerTitle: true,
        backgroundColor: BmiColors.bgColor,
        foregroundColor: BmiColors.textColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: BmiColors.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  spacing: 20,
                  children: [
                    


                    Spacer(),

                    Text(
                      bmiRange,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: rangeColor(), fontSize: 24),
                    ),

                    Text(
                      "${bmiValue.toStringAsFixed(2)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: BmiColors.textColor,
                        fontSize: 70,
                      ),
                    ),



                    
                    /// details
                    Container(

                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender: ${gender}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: BmiColors.textColor,
                            fontSize: 24,
                          ),
                        ),

                        Text(
                          "Age: ${age} years old",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: BmiColors.textColor,
                            fontSize: 24,
                          ),
                        ),

                        Text(
                          "Height: ${height} cm",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: BmiColors.textColor,
                            fontSize: 24,
                          ),
                        ),
                      
                        Text(
                          "Weight: ${weight}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: BmiColors.textColor,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
              

                    Spacer(),

                  ],
                ),
              ),
            ),

  
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: (gender == "Male")
                        ? BmiColors.selectedMaleColor
                        : BmiColors.selectedFemaleColor,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  "Recalculate",
                  style: TextStyle(color: BmiColors.textColor, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color? rangeColor() {
    if (bmiRange == "Severely Underweight") {
      return BmiColors.severelyUnderweight;
    } else if (bmiRange == "Underweight") {
      return BmiColors.underweight;
    } else if (bmiRange == "Normal") {
      return BmiColors.normal;
    } else if (bmiRange == "Overweight") {
      return BmiColors.overweight;
    } else if (bmiRange == "Moderately Obese") {
      return BmiColors.moderatelyObese;
    } else if (bmiRange == "Severely Obese") {
      return BmiColors.severelyObese;
    } else {
      //Morbidly Obese
      return BmiColors.morbidlyObese;
    }
  }
}
//"you are ${bmiRange} and the result is ${bmiValue}",
