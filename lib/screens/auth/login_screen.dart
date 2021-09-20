import 'package:flutter/material.dart';
import 'package:futech_app/screens/home_screen.dart';
import 'package:futech_app/styles/styles.dart';
import 'package:futech_app/widgets/appbar/logo_animation.dart';
import 'package:futech_app/widgets/background/background_img_left_bottom.dart';
import 'package:futech_app/widgets/material/button/button_container_long.dart';
import 'package:futech_app/widgets/material/button/button_text.dart';
import 'package:futech_app/widgets/material/input/text_field_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _controllerJ;

  bool isLoading = false;
  // LoginBloc bloc = new LoginBloc();

  bool _showPass = false;
  // TextEditingController _userController = new TextEditingController();
  // TextEditingController _passController = new TextEditingController();

  late BuildContext scaffoldContext;

  @override
  void initState() {
    // TODO: implement initState
    _controllerJ = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controllerJ.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryLightBlue,
      resizeToAvoidBottomInset: false,
      body: BackgroundImgLeftBottom(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 70, bottom: 20),
                  margin:
                      EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 50),
                  alignment: Alignment.center,
                  height: size.height / 1.3,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: [
                          LogoRoundAnimation(controllerJ: _controllerJ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: primaryBlue,
                                  fontSize: 30,
                                  fontFamily: 'Righteous-Regular'),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  'Mobile phone',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                child: TextFieldContainer(
                                  child: StreamBuilder(
                                    // stream: bloc.userStream,
                                    builder: (context, snapshot) => TextField(
                                      // controller: _userController,
                                      cursorColor: primaryBlue,
                                      decoration: InputDecoration(
                                        hintText: "Mobile phone",
                                        hintStyle: TextStyle(color: grey),
                                        border: InputBorder.none,
                                        errorText: null,
                                        // errorText: snapshot.hasError
                                        //     ? snapshot.error
                                        //     : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  'Password',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                child: Stack(
                                  //chua doi tuong cung 1 dong
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: [
                                    TextFieldContainer(
                                      child: StreamBuilder(
                                        // stream: bloc.passStream,
                                        builder: (context, snapshot) =>
                                            TextField(
                                          obscureText: !_showPass,
                                          // controller: _passController,
                                          cursorColor: primaryBlue,
                                          decoration: InputDecoration(
                                            hintText: "Your Password",
                                            hintStyle: TextStyle(color: grey),
                                            suffixIcon: GestureDetector(
                                              onTap: onToggleShowPass,
                                              child: Icon(
                                                !_showPass
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: primaryBlue,
                                                size: 20,
                                              ),
                                            ),
                                            border: InputBorder.none,
                                            errorText: null, //snapshot.hasError
                                            // ? snapshot.error
                                            // : null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ButtonText(
                            text: "Forgot password?",
                            widget: Container(), //ForgotPassScreen(),
                            width: size.width,
                            margin: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonContainer(
                                text: "Login",
                                press: () => {onLogin()},
                                color: primaryBlue,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void onCancel() async {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => FullScreen()));
    // print('return home');
  }
  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onLogin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
    // print('return home');
  }
}
