import 'package:flutter/material.dart';
import 'package:modernlogintute/Login/Bloc/login_bloc.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}


  //External vars
  LoginBloc bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {


    // COMANDO PARA HACER RESPONSIVO EL FORMULARIO
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      
      body: Center(
        child: Container(
          width: size.width * 1,
          height: double.infinity,
          color: Color.fromARGB(255, 124, 143, 226),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.01),
                  // logo
                  const Icon(
                    Icons.local_airport_rounded,
                    size: 50,
                  ),

                  SizedBox(height:size.height * 0.01),

                  // welcome back, you've been missed!
                  const Center(
                    child: Text(
                      '¡Bienvenido de nuevo',
                      style: TextStyle(
                        color: Color.fromARGB(255, 253, 253, 253),
                        fontSize: 25,
                        
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.01),

                  // username textfield
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Nombre de usuario',
                    obscureText: false,
                  ),

                  SizedBox(height: size.height * 0.01),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),

                  SizedBox(height: size.height * 0.01),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Has olvidado tu contraseña?',
                          style: TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: size.height * 0.01),

                  // sign in button
                  // MyButton(
                  //   onTap: signUserIn,
                  // ),
                  buttonLoging(), 





                  SizedBox(height: size.height * 0.01),

                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'o continuar con',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: size.height * 0.01),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      // google button
                      SquareTile(imagePath: 'lib/images/google.png'),

                      SizedBox(width: size.height * 0.01),

                      // apple button
                      SquareTile(imagePath: 'lib/images/apple.png')
                    ],
                  ),

                  SizedBox(height: size.height * 0.01),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'No es miembro?',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      SizedBox(width: size.height * 0.01),
                      Text(
                        'Registrese ahora',
                        style: TextStyle(
                          color: Color.fromARGB(255, 208, 255, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  imputLogings({required TextEditingController controller}) {
                      return TextFormField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(
                            color: Color(0xFF6200EE),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6200EE)),
                          ),
                        ),
                      );
                    }
  buttonLoging() {
    return ElevatedButton(
      onPressed: () {
        // Respond to button press
        bloc.requestLogin(user: usernameController.text, password: passwordController.text);
      },
      child: Text('Iniciar Sesion'),
    );
  }


}