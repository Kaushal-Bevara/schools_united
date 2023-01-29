import 'package:awesome_dropdown/awesome_dropdown.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as Provider;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'assets/button.dart';
import 'assets/textField.dart';

/*final userProvider = StreamProvider<User?>(
  (ref) => FirebaseAuth.instance.authStateChanges(),
);*/

final supabase = Supabase.instance.client;


myValue() {}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://fedbhwmfuultkrkztweo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZlZGJod21mdXVsdGtya3p0d2VvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQ4Nzg2OTAsImV4cCI6MTk5MDQ1NDY5MH0.eBbj9oaEyvuNnDDRnPo6vQaLw6Qq2NZmSmqnDRI0z4Y',
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
//    final String value = ref.watch(userProvider as ProviderListenable<String>);

    return MaterialApp(
      title: 'Schools United',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthPage(),
    );
  }
}

//riverpod providers for auth



class AuthPage extends ConsumerWidget {
  //Users login here
  AuthPage({
    super.key,
  });

  //sign user in
  Future<void> signUserIn(email, password) async {
    final AuthResponse res = await supabase.auth.signUp(email: email,password: password,);
    final Session? session = res.session;
    final User? user = res.user;  
  }

  //callback type of user

  //Text Editing Controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Schools United"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: "Student",
                  child: Text("Student"),
                ),
                DropdownMenuItem(
                  value: "Parent",
                  child: Text("Parent"),
                ),
                DropdownMenuItem(
                  value: "Teacher",
                  child: Text("Teacher"),
                ),
              ],
              onChanged: (value) {

              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: MyTextField(
                controller: usernameController,
                hintText: "Username",
                obscureText: false,
              ),
            ),

            // email input

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
            ),

            //password input

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
            ),

            //sign in button

           /* Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Button(
                onTap: /*signUserIn(emailController.text,passwordController.text)*/,
                text: "Confirm",
              ),
            ),*/

            // divider

            Row(
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Continue With',
                  style: TextStyle(
                    color: (Colors.blue),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            //divider end
          ],
        ),
      ),
    );
  }
}


Future<void> login(BuildContext context,email,password,) async {
  


}
  Future<void> register(BuildContext context, email, password,) async {

}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
