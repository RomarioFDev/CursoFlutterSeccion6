import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final TextInputType? keyboardType;
  final bool obscureText;
  //Todo: Se utilizara un formProperty, que sera la propiedad que estara buscando
  final String formPropety;
  //Todo: Se utiliza un mapa donde se guardaran los valores del formulario
  final Map<String, dynamic> formValue;

  const CustomInputField({
    Key? key,
    this.icon,
    this.hintText,
    this.labelText,
    this.helperText,
    this.keyboardType,
    this.obscureText = false,
    required this.formPropety,
    required this.formValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: (value) {
        //Todo: Se toma el formValue le pasamos al formPropetry y esto sera igual al valor
        formValue[formPropety] = value;
      },
      validator: (value) {
        if (value == null) return 'Este campo es requerido';
        return value.length < 3 ? 'Minimo 4 letras' : null;
      },
      decoration: InputDecoration(
        icon: icon == null ? null : Icon(icon),
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
      ),
    );
  }
}
