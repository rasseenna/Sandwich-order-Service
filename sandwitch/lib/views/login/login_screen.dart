import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandwitch/views/admin/add_product.dart';
import 'package:sandwitch/widgets/textfield.dart';

import '../../controller/login_controller.dart';
import '../../utils/colors.dart';
import '../../utils/myservices.dart';
import '../../utils/textStyles.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/validations.dart';
import '../admin/adminhome_main.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final loginController = Get.put(LoginController());

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    MyService serviceObj = MyService();
    double heightMultiplier = serviceObj.heightMultiplier;
    double widthMultiplier = serviceObj.widthMultiplier;
    print(heightMultiplier);
    print('--------Login in build=============');
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: bgColor,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text('Welcome', style: headingStyles),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18, top: 6, bottom: 18),
                    child: Text('Log in to continue', style: captionStyles),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18, right: 18),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: uidTFieldColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(11),
                            topLeft: Radius.circular(11),
                            bottomLeft: Radius.circular(11),
                            bottomRight: Radius.circular(11),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18.0, right: 18, top: 16),
                            child: Text("Username", style: tFieldLabels),
                          ),
                          // SizedBox(height:5*heightMultiplier),

                          TextFormFields(
                            controller: usernameController,
                            hint: "UserName",
                            validator: Validation.validateFullName,
                            prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                    height: 0,
                                    child: SvgPicture.asset(
                                        "assets/images/persons.svg"))),
                            onChange: (username) {
                              print("inside valie is ${usernameController.text}");
                            },
                          ),
                          SizedBox(
                            height: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18, right: 18, top: 18),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5 * heightMultiplier),
                      decoration: const BoxDecoration(
                          color: uidTFieldColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(11),
                            topLeft: Radius.circular(11),
                            bottomLeft: Radius.circular(11),
                            bottomRight: Radius.circular(11),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18.0, right: 18, top: 18),
                            child: Text("PASSWORD", style: tFieldLabels),
                          ),
                          TextFormFields(
                            validator: Validation.validateLoginPassword,
                            controller: passwordController,
                            hint: "Enter your Password",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset("assets/images/pass.svg"),
                            ),
                            onChange: (value) {},
                          ),
                          SizedBox(
                            height: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: GradientButton(
                        onPressed: () {
                        //  print("click");
                        //  Get.to(AddProductMainPageView());
                           loginController.signInWithEmailId(
                               usernameController.text.toString(),
                                passwordController.text.toString(),
                                context);
                        },
                        text: 'Log in'),
                  )
                  // Container(
                  //     alignment: Alignment.center,
                  //     padding: EdgeInsets.only(
                  //       left: 16 ,
                  //     ),
                  //     child: GradientButton(
                  //       onPressed: () {
                  //         loginController.signInWithEmailId(
                  //             mailIdController.text.toString(),
                  //             passwordController.text.toString(),
                  //             context);
                  //         // blocContext
                  //         //     .read<LoginBloc>()
                  //         //     .add(LoginSubmit(context));
                  //       },
                  //       text: 'Log in',
                  //     )),

                  //SizedBox(height: 17 * heightMultiplier),
                ],
              ),
            ), //     ),
            //   ],
            // ),
          )),
    );
  }

  // displayOTPDialog(BuildContext context, double heightMultiplier,
  //     double widthMultiplier) async {
  //   // var userDetails = Provider.of<UserDetailsProvider>(context, listen: false);
  //   return showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (_) => AlertDialog(
  //         insetPadding: EdgeInsets.all(0),
  //         backgroundColor: Colors.transparent,
  //         // elevation: 10,
  //         title: Text(''),
  //         content:
  //         SingleChildScrollView(
  //           child: Stack(children: [
  //             Container(
  //               width: MediaQuery.of(context).size.width,
  //               height: MediaQuery.of(context).size.height,
  //               color: Colors.transparent,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   GestureDetector(
  //                       onTap: () {
  //                         Navigator.pop(
  //                           context,
  //                         );
  //                       },
  //                       child:
  //                       Image.asset("assets/close.png", height: 24))
  //                 ],
  //               ),
  //             ),
  //             Center(
  //               child: Padding(
  //                 padding:
  //                 EdgeInsets.only(top: 175.0 * heightMultiplier),
  //                 child: Container(
  //                     width: 328 * widthMultiplier,
  //                     height: 180 * heightMultiplier,
  //                     color: Color.fromRGBO(56, 56, 56, 1),
  //                     child: Padding(
  //                       padding: EdgeInsets.symmetric(vertical: 0),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.symmetric(
  //                                 horizontal: 10 * heightMultiplier,
  //                                 vertical: 15 * heightMultiplier),
  //                             child: Text(
  //                                 'aaaaaaaaaaa',
  //                                 style: alertText1),
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.symmetric(
  //                               horizontal: 10 * heightMultiplier,
  //                             ),
  //                             child: Text(
  //                                 'aaaaaaaaaaa',
  //                                 style: alertText2),
  //                           ),
  //
  //                           Row(
  //                             children: [
  //                               Padding(
  //                                 padding: EdgeInsets.only(
  //                                     left: 10 * widthMultiplier,
  //                                     top: 10 * heightMultiplier),
  //                                 child: SizedBox(
  //                                   height: 38 * heightMultiplier,
  //                                   width: 38 * widthMultiplier,
  //                                   child: SquareTextField(
  //                                     focusNode: otpFocus1,
  //                                     showCursor: false,
  //                                     maxLength: 1,
  //                                     errorText:
  //                                     '',
  //                                     hint: "",
  //                                     inputType:
  //                                     TextInputType.number,
  //                                     onChanged: (String value) {
  //
  //                                       print("first field val is $value");
  //                                       // blocContext
  //                                       //     .read<LoginBloc>()
  //                                       //     .add(OTPChange(
  //                                       //     value, 0));
  //                                       if (value.isNotEmpty) {
  //                                         otpFocus1.nextFocus();
  //                                         // FocusScope.of(context)
  //                                         //     .requestFocus(
  //                                         //     otpFocus2);
  //                                       }
  //                                     },
  //                                   ),
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                   width: 10 * widthMultiplier),
  //                               Padding(
  //                                 padding: EdgeInsets.only(
  //                                     top: 10 * heightMultiplier),
  //                                 child: SizedBox(
  //                                   height: 38 * heightMultiplier,
  //                                   width: 38 * widthMultiplier,
  //                                   child: SquareTextField(
  //                                     focusNode: otpFocus2,
  //                                     errorText:
  //                                     '',
  //                                     maxLength: 1,
  //                                     inputType:
  //                                     TextInputType.number,
  //                                     showCursor: false,
  //                                     hint: "",
  //                                     onChanged: (String value) {
  //                                       // blocContext
  //                                       //     .read<LoginBloc>()
  //                                       //     .add(OTPChange(
  //                                       //     value, 1));
  //                                       if (value.isNotEmpty) {
  //                                         otpFocus2.nextFocus();
  //                                         // FocusScope.of(context)
  //                                         //     .requestFocus(
  //                                         //     otpFocus3);
  //                                       } else {
  //                                         FocusScope.of(context)
  //                                             .requestFocus(
  //                                             otpFocus1);
  //                                       }
  //                                     },
  //                                   ),
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                   width: 10 * widthMultiplier),
  //                               Padding(
  //                                 padding: EdgeInsets.only(
  //                                     top: 10 * heightMultiplier),
  //                                 child: SizedBox(
  //                                   height: 38 * heightMultiplier,
  //                                   width: 38 * widthMultiplier,
  //                                   child: SquareTextField(
  //                                     focusNode: otpFocus3,
  //                                     maxLength: 1,
  //                                     inputType:
  //                                     TextInputType.number,
  //                                     showCursor: false,
  //                                     errorText:
  //                                     '',
  //                                     hint: "",
  //                                     onChanged: (value) {
  //                                       // blocContext
  //                                       //     .read<LoginBloc>()
  //                                       //     .add(OTPChange(
  //                                       //     value, 2));
  //                                       if (value.isNotEmpty) {
  //                                         otpFocus3.nextFocus();
  //                                         // FocusScope.of(context)
  //                                         //     .requestFocus(
  //                                         //     otpFocus4);
  //                                       } else {
  //                                         FocusScope.of(context)
  //                                             .requestFocus(
  //                                             otpFocus2);
  //                                       }
  //                                     },
  //                                   ),
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                   width: 10 * widthMultiplier),
  //                               Padding(
  //                                 padding: EdgeInsets.only(
  //                                     top: 10 * heightMultiplier),
  //                                 child: SizedBox(
  //                                     height: 38 * heightMultiplier,
  //                                     width: 38 * widthMultiplier,
  //                                     child: SquareTextField(
  //                                       focusNode: otpFocus4,
  //                                       inputType:
  //                                       TextInputType.number,
  //                                       showCursor: false,
  //                                       errorText: '',
  //                                       maxLength: 1,
  //                                       hint: "",
  //                                       onChanged: (value) {
  //                                         // blocContext
  //                                         //     .read<LoginBloc>()
  //                                         //     .add(OTPChange(
  //                                         //     value, 3));
  //                                         if (value.isNotEmpty) {
  //                                           otpFocus4.nextFocus();
  //                                           // FocusScope.of(context)
  //                                           //     .requestFocus(
  //                                           //     otpFocus5);
  //                                         } else {
  //                                           FocusScope.of(context)
  //                                               .requestFocus(
  //                                               otpFocus3);
  //                                         }
  //                                       },
  //                                     )),
  //                               ),
  //                               SizedBox(
  //                                   width: 10 * widthMultiplier),
  //                               Padding(
  //                                 padding: EdgeInsets.only(
  //                                     top: 10 * heightMultiplier),
  //                                 child: SizedBox(
  //                                     height: 38 * heightMultiplier,
  //                                     width: 38 * widthMultiplier,
  //                                     child: SquareTextField(
  //                                       focusNode: otpFocus5,
  //                                       inputType:
  //                                       TextInputType.number,
  //                                       showCursor: false,
  //                                       errorText:'',
  //                                       maxLength: 1,
  //                                       hint: "",
  //                                       onChanged: (value) {
  //                                         // blocContext
  //                                         //     .read<LoginBloc>()
  //                                         //     .add(OTPChange(
  //                                         //     value, 4));
  //                                         if (value.isNotEmpty) {
  //                                           otpFocus5.nextFocus();
  //                                           // FocusScope.of(context)
  //                                           //     .requestFocus(
  //                                           //     otpFocus6);
  //                                         } else {
  //                                           FocusScope.of(context)
  //                                               .requestFocus(
  //                                               otpFocus4);
  //                                         }
  //                                       },
  //                                     )),
  //                               ),
  //                               SizedBox(
  //                                   width: 10 * widthMultiplier),
  //                               Padding(
  //                                 padding: EdgeInsets.only(
  //                                     top: 10 * heightMultiplier),
  //                                 child: SizedBox(
  //                                     height: 38 * heightMultiplier,
  //                                     width: 38 * widthMultiplier,
  //                                     child: SquareTextField(
  //                                       focusNode: otpFocus6,
  //                                       inputType:
  //                                       TextInputType.number,
  //                                       showCursor: false,
  //                                       errorText: '',
  //                                       maxLength: 1,
  //                                       hint: "",
  //                                       onChanged: (value) {
  //                                         // blocContext
  //                                         //     .read<LoginBloc>()
  //                                         //     .add(OTPChange(
  //                                         //     value, 5));
  //                                         if (value.isNotEmpty) {
  //                                           //otpFocus5.
  //                                           // FocusScope.of(context)
  //                                           //     .unfocus();
  //                                         } else {
  //
  //                                           FocusScope.of(context)
  //                                               .requestFocus(
  //                                               otpFocus5);
  //                                         }
  //                                       },
  //                                     )),
  //                               ),
  //                             ],
  //                           )
  //                           ,
  //                           // Divider(thickness: 2, color: borderClr),
  //                           SizedBox(height: 18 * heightMultiplier),
  //                           Row(
  //                             mainAxisAlignment:
  //                             MainAxisAlignment.spaceEvenly,
  //                             children: [
  //                               Container(
  //                                 decoration: BoxDecoration(
  //                                   border: Border(
  //                                     top: BorderSide(
  //                                         width: 1.0, color: borderClr),
  //                                     right: BorderSide(
  //                                         width: 1.0, color: borderClr),
  //                                   ),
  //                                   // color: Colors.red,
  //                                 ),
  //                                 width: 158 * widthMultiplier,
  //                                 height: 40 * heightMultiplier,
  //                                 child:
  //                                 TextButton(
  //                                     onPressed: () {
  //                                       // blocContext
  //                                       //     .read<LoginBloc>()
  //                                       //     .add(OTPResend());
  //                                     },
  //                                     child: Text(
  //                                       'Resend',
  //                                       style: alertText2,
  //                                     ))
  //
  //                                 ,
  //                               ),
  //                               Container(
  //                                 decoration: BoxDecoration(
  //                                   // color:Colors.red,
  //                                   border: Border(
  //                                     top: BorderSide(
  //                                         width: 1.0, color: borderClr),
  //                                   ),
  //                                   // color: Colors.red,
  //                                 ),
  //                                 width: 158 * widthMultiplier,
  //                                 height: 40 * heightMultiplier,
  //                                 child:
  //                                 TextButton(
  //                                     onPressed: () {
  //                                       // blocContext
  //                                       //     .read<LoginBloc>()
  //                                       //     .add(OTPSubmit());
  //                                     },
  //                                     child: Text(
  //                                         'Confirm',
  //                                         style: alertText2))
  //                                 ,
  //                               ),
  //
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                     )),
  //               ),
  //               //),
  //             )
  //           ]),
  //         ),
  //       ));
  // }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
