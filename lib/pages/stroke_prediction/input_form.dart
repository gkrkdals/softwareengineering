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
  const Input({super.key, required this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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

  TextEditingController? _ageController;
  String _genderSelection = 'male';
  bool? _hypertension, _heartDisease, _everMarried;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              const VPad(),
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
                      onPressed: () {
                        setState(() {
                          _hypertension = false;
                        });
                      },
                      child: const Text('No')
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
