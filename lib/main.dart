import 'package:bmi_calculator/result_screen.dart';
import 'package:bmi_calculator/widgets/male_or_female_widget.dart';
import 'package:bmi_calculator/widgets/weight_and_age_widget.dart';
import 'package:flutter/material.dart';

import 'bmi_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isMale = false;
  double height = 100;
  int weightValue = 60;
  int ageValue = 30;


//


  @override

  // Builder(
  // builder: (BuildContext context) {
  //   return 



  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
      builder: (BuildContext context) {
        return Scaffold(
        backgroundColor: BmiColors.bgColor,
        appBar: AppBar(
          title: Text("Bmi Calculator"),
          centerTitle: true,
          backgroundColor: BmiColors.bgColor,
          foregroundColor: BmiColors.textColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 15,
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    spacing: 15,
                    children: [
                      MaleORFemaleWidget(
                        gender: "male",
                        genderIcon: Icons.male,
                        genderCardColor: (isMale)
                            ? BmiColors.selectedMaleColor
                            : BmiColors.cardColor,
                        onTap: () {
                          setState(() {
                            isMale = true;
                            print("$isMale");
                          });
                        },
                      ),
                      MaleORFemaleWidget(
                        gender: "female",
                        genderIcon: Icons.female,
                        genderCardColor: (!isMale)
                            ? BmiColors.selectedFemaleColor
                            : BmiColors.cardColor,
                        onTap: () {
                          setState(() {
                            isMale = false;
                            print("$isMale");
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: BmiColors.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(
                          color: BmiColors.textColor,
                          fontSize: 20,
                        ),
                      ),

                      Text(
                        "${height.toInt()}",
                        style: TextStyle(
                          color: BmiColors.textColor,
                          fontSize: 30,
                        ),
                      ),

                      Slider(
                        thumbColor: (isMale)
                            ? BmiColors.selectedMaleColor
                            : BmiColors.selectedFemaleColor,
                        inactiveColor: BmiColors.greyColor,
                        activeColor: (isMale)
                            ? BmiColors.selectedMaleColor
                            : BmiColors.selectedFemaleColor,
                        value: height.toDouble(),
                        min: 1,
                        max: 300,
                        onChanged: (double value) {
                          setState(() {
                            height = value.toDouble();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Row(
                  spacing: 15,
                  children: [
                    WeightAndAgeWidget(
                      name: "Weight",
                      value: weightValue,
                      add: () {
                        setState(() {
                          weightValue++;
                        });
                      },
                      remove: () {
                        setState(() {
                          if (weightValue > 1) {
                            weightValue--;
                          }
                        });
                      },
                    ),
                    WeightAndAgeWidget(
                      name: "Age",
                      value: ageValue,

                      add: () {
                        setState(() {
                          ageValue++;
                        });
                      },
                      remove: () {
                        setState(() {
                          if (ageValue > 1) {
                            ageValue--;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (isMale)
                        ? BmiColors.selectedMaleColor
                        : BmiColors.selectedFemaleColor,
                  ),
                  onPressed: ()  async {
                    double bmiFormula = weightValue / ((height/100) * (height/100)); 
                    String range;

                    print(bmiFormula);


                    if (bmiFormula < 16.0) {
                      range = "Severely Underweight";
                    } else if (bmiFormula >= 16.0 && bmiFormula <= 18.4) {
                      range = "Underweight";
                    } else if (bmiFormula >= 18.5 && bmiFormula <= 24.9) {
                      range = "Normal";
                    } else if (bmiFormula >= 25.0 && bmiFormula <= 29.9) {
                      range = "Overweight";
                    } else if (bmiFormula >= 30.0 && bmiFormula <= 34.9) {
                      range = "Moderately Obese";
                    } else if (bmiFormula >= 35.0 && bmiFormula <= 39.9) {
                      range = "Severely Obese";
                    } else {
                      range = "Morbidly Obese";
                    }
                    

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ResultScreen(bmiValue : bmiFormula, bmiRange: range,),
                    //   ),
                                            
                                           
                      final shouldReset = await Navigator.push( // wait 
                          context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            bmiValue: bmiFormula,
                            bmiRange: range,
                            age: ageValue,
                            weight: weightValue,
                            height: height.toInt(),
                            gender: (isMale) ? "Male" : "Female",
                          ),
                        ),
                      );

                      if (shouldReset == true) { // reset when you go to results screen after sending the data
                        setState(() {
                          // Reset all variables
                          isMale = true;
                          height = 100;
                          weightValue = 60;
                          ageValue = 30;
                        });
                        
                      }

                    
                    
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: BmiColors.textColor, fontSize: 24),
                  ),
                ),
              ),
            
            
            ],
          ),
        ),
      );
    
    
  }
      )  );
    
  }





}
// ---

// **WHO Adult BMI Categories**

// | BMI | Category |
// | :--- | :--- |
// | < 16.0 | Severely Underweight |
// | 16.0 - 18.4 | Underweight |
// | 18.5 - 24.9 | Normal |
// | 25.0 - 29.9 | Overweight |
// | 30.0 - 34.9 | Moderately Obese |
// | 35.0 - 39.9 | Severely Obese |
// | ≥ 40.0 | Morbidly Obese |

// ---

// That is the standard WHO classification. You can use this in your BMI app.
