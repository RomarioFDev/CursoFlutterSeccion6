import 'package:flutter/material.dart';
//Importaciones de widget
import '../widget/widget.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Todo: Las key nos ayudan a mantener las referencias de los datos
    //Todo: No es necesario colocar el primer 'GlobalKey<FormState' solo basta con el ultimo
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValue = {
      'firs_name': '',
      'last_name': '',
      'email': '',
      'password': '',
      'role': '',
    };
    String role = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs and Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            //Todo: Utilizamos la propiedad key y mandamos a llamar a myFormKey
            //Todo: Ahora bien ya todo quedara refenciado en el myFormKey
            /* Ya podemos ir al onPress del boton para imprimir los valores
            del formulario */
            key: myFormKey,
            child: Column(
              children: [
                const Text(
                  'Comprendiendo los TextFormField',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomInputField(
                  labelText: 'Nombre',
                  icon: Icons.supervised_user_circle_outlined,
                  hintText: 'Nombre del usuario',
                  helperText: 'Coloca solo letras',
                  formPropety: 'firs_name',
                  formValue: formValue,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInputField(
                  labelText: 'Apellido',
                  icon: Icons.supervised_user_circle_outlined,
                  hintText: 'Apellido del usuario',
                  helperText: 'Coloca solo letras',
                  formPropety: 'last_name',
                  formValue: formValue,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInputField(
                  labelText: 'Correo',
                  icon: Icons.supervised_user_circle_outlined,
                  hintText: 'Correo del usuario',
                  helperText: 'Escriba correo valido',
                  keyboardType: TextInputType.emailAddress,
                  formPropety: 'email',
                  formValue: formValue,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInputField(
                  labelText: 'Contraseña',
                  icon: Icons.supervised_user_circle_outlined,
                  hintText: 'Contraseña del usuario',
                  helperText: 'Escriba numeros y letras',
                  obscureText: true,
                  formPropety: 'password',
                  formValue: formValue,
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                      DropdownMenuItem(
                          value: 'Superuser', child: Text('Superuser')),
                      DropdownMenuItem(
                          value: 'Developer', child: Text('Developer')),
                      DropdownMenuItem(
                          value: 'Jr Developer', child: Text('Jr Developer')),
                    ],
                    onChanged: (value) {
                      formValue['role'] = value ?? 'Admin';
                      role = value ?? 'Admin';
                    }),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    //Todo: Mandamos a llamar el myFormKey y usamos el currentState, asi utilizamos metodos
                    //Todo: como Validate que nos arrojara un error en caso de sean nulos los campos de los inputs
                    if (!myFormKey.currentState!.validate()) {
                      return;
                    }
                    //Todo: Aqui se imprime el mapa, con los valores obtenidos de los inputs
                    print(formValue);
                    //Todo: Aqui se imprime el valor guardado en la variable role del input DropdownButton
                    print(role);

                    //Todo: El FocusScope nos ayuda a esconder el teclado cuando se presione el boton
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
