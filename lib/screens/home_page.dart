import 'package:bmi/components/custom_card.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/screens/result_page.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Gender gender_selected = Gender.male;

  int height = 0;
  int weight = 0;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: GenderCard(
                    gender: "Male",
                    icon: Icons.male,
                    isSelected: gender_selected == Gender.male ? true : false,
                    onTap: () {
                      setState(() {
                        gender_selected = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    gender: "Female",
                    icon: Icons.female,
                    isSelected: gender_selected == Gender.female ? true : false,
                    onTap: () {
                      setState(() {
                        gender_selected = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SliderCard(
              value: height,
              title: 'HEIGHT',
              unit: 'cm',
              onChanged: (val) {
                setState(() {
                  height = val.toInt();
                  print(height);
                });
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: AWCard(
                    title: "Age",
                    value: age,
                    onPressedMinus: () {
                      setState(() {
                        age--;
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: AWCard(
                    title: "weight(KG)",
                    value: weight,
                    onPressedMinus: () {
                      setState(() {
                        weight--;
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              title: 'Calculate',
              onTap: () {
                print('calculate');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        gender: gender_selected,
                        height: height,
                        age: age,
                        weight: weight,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
