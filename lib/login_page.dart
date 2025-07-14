import 'package:flutter/material.dart';
import 'package:login_app/home_page.dart';
import 'package:login_app/registro.dart';
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //LoginPage({super.key});
  final userController = TextEditingController(text: "ejemplo@unah.hn");
  final passwordController = TextEditingController(text: "1234");
  bool isPasswordVisible = false;
   /*bool caracterpecial(String texto) {
    return texto.contains(RegExp(r'[!@#/^\<>*%$&]'));
  }*/
  bool soloNumeros(String texto) {
  return RegExp(r'^\d+$').hasMatch(texto);
}


  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body:
      Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/moon.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      SafeArea(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Login",
            style: TextStyle(
              fontSize: 45, //fontsize es para determinar el tamanño de letra que deseemos de nuestro texto
              fontWeight: FontWeight.bold, //fontweight es como negrita en word,
              
            ),
            ),
            SizedBox(
              height: 90,
              width: 150,
              child: Image.asset("assets/moon.jpg"),
            ),
            Text("Ingrese su coreo institucional y su numero de cuenta como contraseña",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.blueAccent,
            ),
            ),
            SizedBox(height: 50),

            TextField(
              controller: userController,
              style: TextStyle(
                color: Colors.amber,//color del texto interior de nuestro textfield
              ),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.redAccent,
                  )
                ),
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                contentPadding: EdgeInsets.all(24),
                
                label: Text("Ingrese su correo", 
                style: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                ),
                prefixIcon: Icon(Icons.email_rounded, 
                color: Colors.white,)
              ),
            ),

            SizedBox(height: 50),

            TextField(
              controller: passwordController,
              maxLength: 11,
              style: TextStyle(
                color: Colors.amber,
              ),
              obscureText: !isPasswordVisible,
              
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.redAccent,
                  )
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                contentPadding: EdgeInsets.all(24),
                label: Text("Ingrese la contraseña",
                style: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                
                hintText: "Ingrese su contraseña",
                prefix: Icon(Icons.password_outlined,
                color: Colors.white,),
                suffixIcon: IconButton(onPressed: (){
                  setState((){
                    isPasswordVisible =!  isPasswordVisible;
                  });
                },
                 icon: isPasswordVisible ? const Icon(Icons.visibility, color: Colors.white,): const Icon(Icons.visibility_off,color: Colors.white,))///color del ojito de password

              ),
            ),


            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroPage()),);
              },
              child: Text(
                "¿No tienes una cuenta? Crear una aqui.",
                style: TextStyle(color: Colors.white),
              ),
            ),

            
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.grey[200],
                  padding: EdgeInsets.all(16),
                ),
                onPressed: () {
                  String correo = userController.text.trim();
                  String contra = passwordController.text.trim();
                

                  if (userController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Oops!'),
                          content: Text('Ningun espacio debe quedar vacio'),
                          actions: [
                            TextButton(
                              onPressed: (
                              
                              ) {
                                Navigator.of(context).pop();
                              },
                              child: Text('Entiendo'),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }
                  

                    if (
                      (correo == "josue.v@unah.hn"  &&   contra == "12345678910") ||
                      (correo == "marvip@unah.hn"  &&  contra =="20201234567" )) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),
                     // Navigator.pushReplacement(context,MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Acceso denegado'),
                          content: Text('Correo o contraseña incorrectos.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Intentar de nuevo'),
                            ),
                          ],
                        ),
                      );
                    }
                  
                  if (!correo.endsWith('@unah.hn')) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Oops!'),
                          content: Text(
                            'correo no valido, su correo debe terminar en @unah.hn',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Entiendo'),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }
                  if (contra.length < 11) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Oops!'),
                          content: Text(
                            'la contraseña debe ser su numero de cuenta',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Entiendo'),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (!soloNumeros(contra)) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Oops!'),
                          content: Text(
                            "su contraseña solo debe de incluir numeros",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Entiendo'),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  };
                
                },
                child: const Text('INGRESAR'),
              ),
            ),
          ],
        ),
        ))
       ],
    ),
    );
  }
}
