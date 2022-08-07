import 'dart:ui';

import 'package:cite_finder/backend/backend.dart';
import 'package:cite_finder/components/options_dialog_widget.dart';
import 'package:cite_finder/components/user_photo_widget.dart';
import 'package:cite_finder/pages/login_page/login_page_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../auth/auth_util.dart';
import '../change_password/change_password_widget.dart';
import '../../components/app_drawer_widget.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_toggle_icon.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  TextEditingController emailFieldController;
  TextEditingController firstNameController;
  TextEditingController lastNameFieldController;
  TextEditingController phoneNumberFieldController;

  String newPhotoUrl;

  bool canEditProfile = false;
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailFieldController = TextEditingController(text: currentUserEmail);
    firstNameController =
        TextEditingController(text: currentUserDocument?.firstName);
    lastNameFieldController =
        TextEditingController(text: currentUserDocument?.lastName);
    phoneNumberFieldController =
        TextEditingController(text: currentPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      resizeToAvoidBottomInset: true,
      drawer: Drawer(
        elevation: 16,
        child: AppDrawerWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 195,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 25, 15, 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () async {
                                if (scaffoldKey.currentState.isDrawerOpen ||
                                    scaffoldKey.currentState.isEndDrawerOpen) {
                                  Navigator.pop(context);
                                }

                                scaffoldKey.currentState.openDrawer();
                              },
                              child: Image.asset(
                                'assets/images/Group_(2).png',
                                width: 0,
                                height: 28,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: AuthUserStreamWidget(
                                  child: UserPhotoWidget(
                                      imageUrl: currentUserPhoto, radius: 90),
                                ),
                              ),
                              AuthUserStreamWidget(
                                child: Text(
                                  valueOrDefault<String>(
                                    currentUserDisplayName,
                                    FFLocalizations.of(context).getText('user'),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.logout,
                            color: Color(0xFFC71616),
                            size: 35,
                          ),
                          onPressed: () async {
                            bool shouldLogout = await showDialog<bool>(
                                context: context,
                                builder: (context) => OptionDialog(
                                    title: "Logout",
                                    content: "Do you really want to logout?",
                                    onConfirm: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    onCancel: () {
                                      Navigator.of(context).pop(false);
                                    }));

                            if (shouldLogout == true) {
                              await signOut();
                              await Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: LoginPageWidget(),
                                ),
                                (r) => false,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Update Profile!',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              ToggleIcon(
                                onPressed: () async {
                                  setState(
                                      () => canEditProfile = !canEditProfile);
                                },
                                value: canEditProfile,
                                onIcon: Icon(
                                  Icons.edit_off,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 25,
                                ),
                                offIcon: Icon(
                                  Icons.edit,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: AuthUserStreamWidget(
                            child: TextFormField(
                              readOnly: !canEditProfile,
                              controller: firstNameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                hintText: FFLocalizations.of(context).getText(
                                  'rw8wu1mr' /* Enter your first name */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).themeText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).themeText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xFFEF1A1A),
                                  size: 30,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color:
                                        FlutterFlowTheme.of(context).themeText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: AuthUserStreamWidget(
                            child: TextFormField(
                              readOnly: !canEditProfile,
                              controller: lastNameFieldController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                hintText: FFLocalizations.of(context).getText(
                                  '4llljvl4' /* Enter your last name */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).themeText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).themeText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: FlutterFlowTheme.of(context).themeText,
                                  size: 30,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color:
                                        FlutterFlowTheme.of(context).themeText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: TextFormField(
                            readOnly: true,
                            controller: emailFieldController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'E-Mail Address',
                              hintText: FFLocalizations.of(context).getText(
                                'tnwgldxi' /* Your email address here */,
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
                                Icons.mail,
                                color: Color(0xFF4C38DC),
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
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                          child: AuthUserStreamWidget(
                            child: TextFormField(
                              readOnly: !canEditProfile,
                              controller: phoneNumberFieldController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                hintText: FFLocalizations.of(context).getText(
                                  'sdddum0u' /* +236 6****** */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).themeText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).themeText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                suffixIcon: Icon(
                                  Icons.phone_sharp,
                                  color: Color(0xFFF1C11A),
                                  size: 24,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color:
                                        FlutterFlowTheme.of(context).themeText,
                                    fontWeight: FontWeight.w500,
                                  ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: canEditProfile,
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: ChangePasswordWidget(),
                                ),
                              );
                            },
                            text: 'Change Password',
                            options: FFButtonOptions(
                              // width: 175,
                              height: 30,
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: canEditProfile,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (formKey.currentState.validate()) {
                                    if (firstNameController.text !=
                                            currentUserDocument.firstName ||
                                        lastNameFieldController.text !=
                                            currentUserDocument.lastName ||
                                        phoneNumberFieldController.text !=
                                            currentUserDocument.phoneNumber) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      final updateUserData =
                                          createUsersRecordData(
                                              firstName:
                                                  firstNameController.text,
                                              lastName:
                                                  lastNameFieldController.text,
                                              displayName: firstNameController
                                                          .text.isNotEmpty ||
                                                      lastNameFieldController
                                                          .text.isNotEmpty
                                                  ? firstNameController.text +
                                                      " " +
                                                      lastNameFieldController
                                                          .text
                                                  : null,
                                              phoneNumber:
                                                  phoneNumberFieldController
                                                      .text,
                                              photoUrl: newPhotoUrl);

                                      try {
                                        await UsersRecord.collection
                                            .doc()
                                            .update(updateUserData);

                                        Fluttertoast.showToast(
                                            msg:
                                                "Profile updated successfully");
                                      } catch (err) {
                                        showSnackbar(context,
                                            "An error occured while updating user information ");
                                      } finally {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    }
                                  }
                                },
                                text: 'Save Changes',
                                options: FFButtonOptions(
                                  width: 175,
                                  height: 55,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
