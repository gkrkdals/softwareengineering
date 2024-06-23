import 'package:flutter/material.dart';

class VPad extends StatelessWidget {
  const VPad({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.symmetric(vertical: 10));
  }
}

class HPad extends StatelessWidget {
  const HPad({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.symmetric(horizontal: 10));
  }
}

class FieldName extends StatelessWidget {
  const FieldName({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
  }
}

class Input extends StatelessWidget {
  const Input({super.key,
    required this.controller,
    this.keyboardType = TextInputType.text
  });

  final TextEditingController? controller;
  final TextInputType keyboardType;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: const InputDecoration(
        hintText: 'Enter your details here',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          )
        )
      )
    );
  }
}

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<StatefulWidget> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {

  TextEditingController? _ageController, _avgGlucoseController, _bmiController;
  String _genderSelection = 'male', _workType = 'private';
  bool? _hypertension, _heartDisease, _everMarried;
  int? _residenceType;

  @override
  void initState() {
    super.initState();
    _ageController = TextEditingController();
    _avgGlucoseController = TextEditingController();
    _bmiController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Stroke Prediction'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15,),
                child: Text('User Information', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              ),
              const FieldName(text: 'Age'),
              const VPad(),
              Input(controller: _ageController),
              const VPad(),
              const FieldName(text: 'Gender'),
              DropdownButton(
                value: _genderSelection,
                items: const [
                  DropdownMenuItem(
                    value: 'male',
                    child: Text('Male')
                  ),
                  DropdownMenuItem(
                    value: 'female',
                    child: Text('Female')
                  ),
                  DropdownMenuItem(
                    value: 'other',
                    child: Text('Other')
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    _genderSelection = value!;
                  });
                }
              ),
              const VPad(),
              const FieldName(text: 'Hypertension'),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(_hypertension == true ? Colors.black12 : Colors.transparent)
                        ),
                      onPressed: () {
                        setState(() {
                          _hypertension = true;
                        });
                      },
                      child: const Text('Yes')
                    ),
                  ),
                  const HPad(),
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(_hypertension == false ? Colors.black12 : Colors.transparent)
                      ),
                      onPressed: () {
                        setState(() {
                          _hypertension = false;
                        });
                      },
                      child: const Text('No')
                    ),
                  ),
                ],
              ),
              const VPad(),
              const FieldName(text: 'Heart Disease'),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(_heartDisease == true ? Colors.black12 : Colors.transparent)
                        ),
                        onPressed: () {
                          setState(() {
                            _heartDisease = true;
                          });
                        },
                        child: const Text('Yes')
                    ),
                  ),
                  const HPad(),
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(_heartDisease == false ? Colors.black12 : Colors.transparent)
                        ),
                        onPressed: () {
                          setState(() {
                            _heartDisease = false;
                          });
                        },
                        child: const Text('No')
                    ),
                  ),
                ],
              ),
              const VPad(),
              const FieldName(text: 'Ever Married'),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(_everMarried == true ? Colors.black12 : Colors.transparent)
                        ),
                        onPressed: () {
                          setState(() {
                            _everMarried = true;
                          });
                        },
                        child: const Text('Yes')
                    ),
                  ),
                  const HPad(),
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(_everMarried == false ? Colors.black12 : Colors.transparent)
                        ),
                        onPressed: () {
                          setState(() {
                            _everMarried = false;
                          });
                        },
                        child: const Text('No')
                    ),
                  ),
                ],
              ),
              const VPad(),
              const FieldName(text: 'Residence Type'),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(_residenceType == 1 ? Colors.black12 : Colors.transparent)
                        ),
                        onPressed: () {
                          setState(() {
                            _residenceType = 1;
                          });
                        },
                        child: const Text('Urban')
                    ),
                  ),
                  const HPad(),
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(_residenceType == 2 ? Colors.black12 : Colors.transparent)
                        ),
                        onPressed: () {
                          setState(() {
                            _residenceType = 2;
                          });
                        },
                        child: const Text('Rural')
                    ),
                  ),
                ],
              ),
              const VPad(),
              const FieldName(text: 'Work Type'),
              DropdownButton(
                  value: _workType,
                  items: const [
                    DropdownMenuItem(
                      value: 'private',
                      child: Text('Private')
                    ),
                    DropdownMenuItem(
                      value: 'self-employed',
                      child: Text('Self-employed')
                    ),
                    DropdownMenuItem(
                        value: 'govt-job',
                        child: Text('Govt-job')
                    ),
                    DropdownMenuItem(
                      value: 'other',
                      child: Text('Other')
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _workType = value!;
                    });
                  }
              ),
              const VPad(),
              const FieldName(text: 'Average Glucose Level (mg/dL)'),
              const VPad(),
              Input(controller: _avgGlucoseController, keyboardType: TextInputType.number,),
              const VPad(),
              const FieldName(text: 'BMI'),
              const VPad(),
              Input(controller: _bmiController, keyboardType: TextInputType.number,),
              const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (dContext) {
                        return AlertDialog(
                          content: const Text('Are you sure you want to submit these informations?'),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.of(dContext).pop();
                              showDialog(
                                context: context,
                                builder: (ddContext) {
                                  return AlertDialog(
                                    content: const Text('The information is successfully saved.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ddContext).pop();
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close')
                                      )
                                    ],
                                  );
                                }
                              );
                            }, child: const Text('Yes')),
                            TextButton(onPressed: () => Navigator.of(dContext).pop(), child: const Text('No'))
                          ],
                        );
                      }
                    );
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            ],
          ),
        )
      ),
    );
  }
}
