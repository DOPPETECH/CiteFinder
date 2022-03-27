import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../forgot_password_page/forgot_password_page_widget.dart';
import '../main.dart';
import '../signup_page/signup_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    Key key,
    this.emailAddress,
  }) : super(key: key);

  final String emailAddress;

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  List<String> checkboxGroupValues;
  TextEditingController emailFieldController;
  TextEditingController passwordFieldController;
  bool passwordFieldVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailFieldController = TextEditingController(text: widget.emailAddress);
    passwordFieldController = TextEditingController();
    passwordFieldVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'lribh65l' /* Log In */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'ichhm9il' /* Welcome back to  */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .copyWith(
                                    color:
                                        FlutterFlowTheme.of(context).themeText),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'tyx2ircy' /* Cité */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '5wkpsb2g' /* Finder */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .copyWith(
                                    color:
                                        FlutterFlowTheme.of(context).themeText),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 45),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: emailFieldController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'ufrptrf0' /* Enter your email address here */,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).themeText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).themeText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              suffixIcon: Icon(
                                Icons.alternate_email_rounded,
                                color: Color(0xFFEF1A1A),
                                size: 22,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).themeText,
                                  fontWeight: FontWeight.w500,
                                ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Field is required';
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 13),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: passwordFieldController,
                            obscureText: !passwordFieldVisibility,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'f1u5g6la' /* Enter your password here */,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).themeText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).themeText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => passwordFieldVisibility =
                                      !passwordFieldVisibility,
                                ),
                                child: Icon(
                                  passwordFieldVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: FlutterFlowTheme.of(context).themeText,
                                  size: 22,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).themeText,
                                  fontWeight: FontWeight.w500,
                                ),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Field is required';
                              }
                              if (val.length < 4) {
                                return 'Password should be at least 4 characters';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 45),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: FlutterFlowCheckboxGroup(
                              initiallySelected: checkboxGroupValues != null
                                  ? checkboxGroupValues
                                  : [
                                      FFLocalizations.of(context).getText(
                                        'a2ccbna3' /* Remember Me */,
                                      )
                                    ],
                              options: [
                                FFLocalizations.of(context).getText(
                                  'd064fau6' /* Remember Me */,
                                )
                              ],
                              onChanged: (val) =>
                                  setState(() => checkboxGroupValues = val),
                              activeColor:
                                  FlutterFlowTheme.of(context).themeText,
                              checkColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              checkboxBorderColor:
                                  FlutterFlowTheme.of(context).themeText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    color:
                                        FlutterFlowTheme.of(context).themeText,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 2, 0),
                                child: Icon(
                                  Icons.info_rounded,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 300),
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                      child: ForgotPasswordPageWidget(),
                                    ),
                                  );
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '4bakxhph' /* Forgotten Password */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: FlutterFlowTheme.of(context)
                                              .themeText),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 35),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final user = await signInWithEmail(
                            context,
                            emailFieldController.text,
                            passwordFieldController.text,
                          );
                          if (user == null) {
                            return;
                          }

                          await Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: NavBarPage(initialPage: 'HomePage'),
                            ),
                            (r) => false,
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'wdpba46c' /* Login */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 55,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 60,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).grayButton,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15, 15, 15, 15),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '6bzyt09z' /* OR Login with */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: InkWell(
                              onTap: () async {
                                final user = await signInWithGoogle(context);
                                if (user == null) {
                                  return;
                                }
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: NavBarPage(initialPage: 'HomePage'),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/flat-color-icons_google.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                final user = await signInWithFacebook(context);
                                if (user == null) {
                                  return;
                                }
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: NavBarPage(initialPage: 'HomePage'),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/facebook-Vector.png',
                                width: 43,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 2, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'nqbzzbqj' /* Don't have an account yet? */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      color: FlutterFlowTheme.of(context)
                                          .themeText),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: SignupPageWidget(),
                                ),
                              );
                            },
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'mtznnb4o' /* Create one */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF5C7CDF),
                                    fontSize: 12,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
