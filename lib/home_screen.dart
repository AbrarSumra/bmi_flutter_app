import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double bmi = 0;
  double heightInFoot = 0;
  double heightInInch = 0;
  double weight = 0;
  String warningText = "";
  bool color = true;
  bool text = true;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "BMI Calculator",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.orange,
                    ),
                  ),
                  const Text(
                    "Enter Your Weight (KG)",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the Weight";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        weight = double.parse(value);
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      suffixText: "KGs",
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Enter Your Height (Foot)",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the Height in Foot";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        heightInFoot = double.parse(value);
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      suffixText: "FOOT",
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Enter Your Height (Inch)",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the Height in Inches";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        heightInInch = double.parse(value);
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      suffixText: "Inch",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            double heightMeter = ((heightInFoot / 3.2808) +
                                (heightInInch / 39.3701));

                            bmi = weight / (heightMeter * heightMeter);
                          });
                        } else {
                          return;
                        }
                      },
                      child: const Text(
                        "Calculate",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        bmi == 0
                            ? Container()
                            : Text(
                                "Your BMI is ${bmi.toStringAsFixed(2)}",
                                style: const TextStyle(fontSize: 25),
                              ),
                        bmi == 0
                            ? Container()
                            : Text(
                                getText(text),
                                style: getTextColor(color),
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getText(bool text) {
    if (bmi > 18.5 && bmi < 24.9) {
      return "Your are Healthy";
    } else if (bmi > 25 && bmi < 29.9) {
      return "Your are OverWeight";
    } else if (bmi > 30.0) {
      return "Your are Obese";
    } else {
      return "You are UnderWight";
    }
  }

  TextStyle getTextColor(bool color) {
    if (bmi > 18.5 && bmi < 24.9) {
      return const TextStyle(color: Colors.green, fontSize: 25);
    } else if (bmi > 25 && bmi < 29.9) {
      return const TextStyle(color: Colors.blue, fontSize: 25);
    } else {
      return const TextStyle(color: Colors.red, fontSize: 25);
    }
  }
}
