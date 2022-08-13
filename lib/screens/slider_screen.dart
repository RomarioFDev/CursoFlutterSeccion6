import 'package:flutter/material.dart';
import 'package:flutter_seccion6/Theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderCheckValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slider & Check'),
        ),
        body: Column(
          children: [
            Slider.adaptive(
              activeColor: AppTheme.primary,
              min: 100,
              max: 400,
              value: _sliderValue,

              //Todo: Indicamos que entonces si el valor de sliderCheckValue tiene un valor true que es su valor incial se hara
              //Todo: todo lo que esta en el setState, en dado caso sea false el sliderCheckValue, el Slider quedar en valor null
              onChanged: (value) => _sliderCheckValue
                  ? setState(() {
                      print(value);
                      _sliderValue = value;
                    })
                  : null,
            ),

            /* Cuando utilizamos el check, le mandamos un valor por defecto en true o false en el value, dentro del onChange
               declaramos que si la variable declarada en true es igual al valor selecionado o no del check que es el value,
               pero como el value puede recibir un valor nulo entonces el valor por defecto quedara en true.
               Esto aplica para los check como los swiches, pero en los swiches no pueden dar nulor es asi que no se necesita
               indicar que el si es nulo se quedara en true.
            */
            Checkbox(
              value: _sliderCheckValue,
              onChanged: (value) {
                setState(() => _sliderCheckValue = value ?? true);
              },
            ),
            CheckboxListTile(
              title: Text('Select check'),
              value: _sliderCheckValue,
              onChanged: (value) =>
                  setState(() => _sliderCheckValue = value ?? true),
            ),
            Switch(
              value: _sliderCheckValue,
              onChanged: (value) => setState(() => _sliderCheckValue = value),
            ),
            SwitchListTile(
              title: Text('Select check'),
              value: _sliderCheckValue,
              onChanged: (value) => setState(() => _sliderCheckValue = value),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Image(
                    width: _sliderValue,
                    fit: BoxFit.contain,
                    image: const NetworkImage(
                        'https://i.pinimg.com/originals/df/a7/74/dfa774307d774ee1fc1b7c176d1c1793.jpg')),
              ),
            )
          ],
        ));
  }
}
