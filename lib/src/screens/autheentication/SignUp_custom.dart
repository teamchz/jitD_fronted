import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_state.dart';
import 'package:jitd_client/src/constant.dart';

import '../../blocs/authentication/authen_event.dart';
import '../../ui/DialogMessage.dart';

class SignUpCustom extends StatefulWidget {
  const SignUpCustom({Key? key}) : super(key: key);

  @override
  SignUpCustomState createState() => SignUpCustomState();
}

class SignUpCustomState extends State<SignUpCustom> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  late bool passwordVisibility1;
  TextEditingController? passwordConfirmController;
  late bool passwordVisibility2;
  TextEditingController? phoneController;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility1 = false;
    passwordConfirmController = TextEditingController();
    passwordVisibility2 = false;
    phoneController = TextEditingController();
    // emailController = TextEditingController()
    //   ..addListener(() {
    //     setState(() {});
    //   });
    // passwordController = TextEditingController()
    //   ..addListener(() {
    //     setState(() {});
    //   });
    // passwordVisibility1 = false;
    // passwordConfirmController = TextEditingController()
    //   ..addListener(() {
    //     setState(() {});
    //   });
    // passwordVisibility2 = false;
    // phoneController = TextEditingController()
    //   ..addListener(() {
    //     setState(() {});
    //   });
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    passwordConfirmController?.dispose();
    phoneController?.dispose();
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
          create: (_) => AuthenticationBloc(),
          child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
              child: Stack(
                children: [
                  /// Background
                  Center(
                    child: Image.asset(
                      'assets/images/background.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// ALL CONTENT
                  BlocListener<AuthenticationBloc, AuthenticationState>(
                    listener: (BuildContext context, state) {
                      if (state is SignUpLoadedState) {
                        var title = "สร้างบัญชีผู้ใช้สำเร็จ";
                        var desc = "กดเพื่อดพพเนินไปขั้นต่อไป";
                        showDialog(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (context) {
                              return DialogMessage(title: title, desc: desc);
                              // return DialogMessage(message: message);
                            });
                      } else if (state is SignUpError) {
                        var desc = "กดเพื่อดพพเนินไปขั้นต่อไป";
                        showDialog(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (context) {
                              return DialogMessage(
                                  title: state.err_msg, desc: desc);
                              // return DialogMessage(message: message);
                            });
                      }
                    },
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 160),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Text(
                                'Sign',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  // color: Color(0xFFAAD4CC),
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '  Up',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF7AAAAF),
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Form(
                          child: Expanded(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //   // FORM
                              _formAuth(
                                  emailController, "Email", Icons.email, null),
                              _formAuth(
                                  passwordController,
                                  "Password",
                                  Icons.lock,
                                  _suffixIcon("passwordVisibility1",
                                      passwordVisibility1)),
                              _formAuth(
                                  passwordConfirmController,
                                  "Password Confirm",
                                  Icons.lock,
                                  _suffixIcon("passwordVisibility2",
                                      passwordVisibility2)),

                              ///  Button
                              _buttonSubmit(context),
                            ],
                          ),
                        ),
                      )),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text("or"),
                          ),

                          // Show Sign up using
                          const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 15.0),
                              child: Text(
                                'Sign up using social networks',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF818181),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),

                          // 3 party
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: BlocBuilder<AuthenticationBloc,
                                      AuthenticationState>(
                                  builder: (context, state) {
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<AuthenticationBloc>()
                                            .add(SignIngoogle());
                                      },
                                      child: _button_3Party(
                                          'assets/images/facebook_icon.png',
                                          context),
                                    ),
                                    _button_3Party(
                                        'assets/images/twitter_icon.png',
                                        context),
                                    _button_3Party(
                                        'assets/images/google_icon.png',
                                        context),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ],
                      ))
                    ]),
                  ),

                  /// Button to navigate
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account ?',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Color(0xFF818181),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5, 0, 0, 0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Sign in here',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: thirterydColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ))
          // ),
          ),
    );
  }

  Padding _buttonSubmit(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 120),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state is SignUpCheckingState) {
            return ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 24),
                    minimumSize: const Size.fromHeight(52),
                    primary: thirterydColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
                child: const CircularProgressIndicator(color: Colors.white70));
          } else {
            return ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _checkFormFill() == true) {
                    Map<String, dynamic> dataSignIn = {
                      "Email": emailController?.text,
                      "Password": passwordController?.text,
                      "PasswordCF": passwordConfirmController?.text,
                      "Phone": phoneController?.text
                    };

                    context
                        .read<AuthenticationBloc>()
                        .add(SignUpEvent(dataSignIn));
                  }
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    minimumSize: const Size.fromHeight(52),
                    elevation: (_checkFormFill() == true) ? 5 : 0,
                    primary: (_checkFormFill() == true)
                        ? thirterydColor
                        : thirteryColorSubtle,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
                child: const Text("Sign In"));
          }
        }));
  }

  Padding _formAuth(TextEditingController? controller, String hint,
      IconData iconData, InkWell? inkwell) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty == false && hint == "Email") {
              final emailPattern = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if (emailPattern.hasMatch(value)) {
                return null;
              } else {
                return "Email not format";
              }
            } else if (value.isEmpty == false && hint == "Password") {
              if (value.length >= 6) {
                return null;
              } else {
                return "Password must more 6";
              }
            } else if (value.isEmpty == false && hint == "Password Confirm") {
              if (value.length >= 6) {
                return null;
              } else {
                return "Password must more 6";
              }
            }
            return null;
          },
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
              isDense: true,
              label: Text(hint, style: const TextStyle(color: textColor3)),
              hintText: hint,
              enabledBorder: statusBorder(primaryColor),
              focusedBorder: statusBorder(primaryColorDark),
              errorBorder: statusBorder(statusColorError),
              focusedErrorBorder: statusBorder(primaryColorDark),
              prefixIcon: Icon(
                iconData,
                color: const Color(0xFF3F4247),
              ),
              suffixIcon: inkwell),
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
          ),
        ));
  }

  Padding _button_3Party(String imgURL, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
      child: Image.asset(
        imgURL,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
    );
  }

  OutlineInputBorder statusBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  bool? _checkFormFill() {
    if (emailController?.text.toString().trim().isEmpty == true ||
            passwordController?.text.toString().trim().isEmpty == true ||
            passwordConfirmController?.text.toString().trim().isEmpty == true
        // phoneController?.text.toString().trim().isEmpty == false
        ) {
      return false;
    } else {
      return true;
    }
  }

  InkWell _suffixIcon(String fag, bool passwordVisibility) {
    return InkWell(
      onTap: () => setState(() => {
            if (fag == "passwordVisibility1")
              {passwordVisibility1 = !passwordVisibility1}
            else if (fag == "passwordVisibility2")
              {passwordVisibility2 = !passwordVisibility2}
          }),
      focusNode: FocusNode(skipTraversal: true),
      child: Icon(
        passwordVisibility == passwordVisibility1
            ? passwordVisibility1
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined
            : passwordVisibility2
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
        color: const Color(0xFF757575),
        size: 22,
      ),
    );
  }
}
