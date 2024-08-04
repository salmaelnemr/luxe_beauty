import 'package:flutter/material.dart';
import '../../dio/api_provider.dart';
import '../login/view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool visible = true;
  var formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: usernameController,
                  cursorColor: Colors.brown,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username must not be empty";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: const InputDecoration(
                    focusColor: Colors.brown,
                    labelText: "Username",
                    labelStyle: TextStyle(
                      color: Colors.brown,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: firstNameController,
                  cursorColor: Colors.brown,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "First Name must not be empty";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: const InputDecoration(
                    focusColor: Colors.brown,
                    labelText: "First Name",
                    labelStyle: TextStyle(
                      color: Colors.brown,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: lastNameController,
                  cursorColor: Colors.brown,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Last Name must not be empty";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: const InputDecoration(
                    focusColor: Colors.brown,
                    labelText: "Last Name",
                    labelStyle: TextStyle(
                      color: Colors.brown,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  cursorColor: Colors.brown,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email address must not be empty";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: const InputDecoration(
                    focusColor: Colors.brown,
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.brown,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneNumberController,
                  cursorColor: Colors.brown,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone Number must not be empty";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: const InputDecoration(
                    focusColor: Colors.brown,
                    labelText: "Phone Number",
                    labelStyle: TextStyle(
                      color: Colors.brown,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    prefixIcon: Icon(Icons.call),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                  obscureText: visible,
                  cursorColor: Colors.brown,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      color: Colors.brown,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                      icon: Icon(
                          visible ? Icons.visibility_off : Icons.visibility),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        String message = await ApiProvider().registerUser(
                          username: usernameController.text,
                          password: passwordController.text,
                          email: emailController.text,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          phone: phoneNumberController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,),),);

                        if (message == "Register Success") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginView(),),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have an account?",
                    ),
                    TextButton(
                      onPressed: () async{
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
