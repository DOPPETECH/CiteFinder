import 'package:cite_finder/components/user_photo_widget.dart';

import '../auth/auth_util.dart';
import '../pages/faqs/faqs_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawerWidget extends StatefulWidget {
  const AppDrawerWidget({Key key}) : super(key: key);

  @override
  _AppDrawerWidgetState createState() => _AppDrawerWidgetState();
}

class _AppDrawerWidgetState extends State<AppDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 9),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: AuthUserStreamWidget(
                        child: Hero(
                          tag: currentUserPhoto,
                          transitionOnUserGestures: true,
                          child: UserPhotoWidget(
                            imageUrl: currentUserPhoto,
                            radius: 100,
                          ),
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 40,
                      fillColor: Color(0x005C7CDF),
                      icon: Icon(
                        Icons.more_vert,
                        color: FlutterFlowTheme.of(context).themeText,
                        size: 24,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                child: AuthUserStreamWidget(
                  child: Text(
                    valueOrDefault<String>(
                        currentUserDisplayName,
                        FFLocalizations.of(context).getVariableText(
                            enText: "User", frText: "Utilisateur")),
                    style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                        color: FlutterFlowTheme.of(context).themeText,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: NavBarPage(initialPage: 'ProfilePage'),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.account_circle_outlined,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 35,
                            ),
                            title: Text(
                              'Profile',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20,
                            ),
                            tileColor: Color(0x00F5F5F5),
                            dense: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(52, 0, 7, 5),
                          child: Container(
                            width: double.infinity,
                            height: 0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFFC1C4C8),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.privacy_tip,
                            color: Color(0xFFFFE01E),
                            size: 35,
                          ),
                          title: Text(
                            'Privacy Policy',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20,
                          ),
                          tileColor: Color(0x00F5F5F5),
                          dense: false,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(52, 0, 7, 5),
                          child: Container(
                            width: double.infinity,
                            height: 0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFFC1C4C8),
                                width: 1,
                              ),
                            ),
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
                                child: FaqsWidget(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.help_outlined,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 35,
                            ),
                            title: Text(
                              'FAQS',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20,
                            ),
                            tileColor: Color(0x00F5F5F5),
                            dense: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(52, 0, 7, 15),
                          child: Container(
                            width: double.infinity,
                            height: 0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFFC1C4C8),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.teamspeak,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            size: 35,
                          ),
                          title: Text(
                            'Contact Us',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20,
                          ),
                          tileColor: Color(0x00F5F5F5),
                          dense: false,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(52, 0, 7, 5),
                          child: Container(
                            width: double.infinity,
                            height: 0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFFC1C4C8),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.solidAddressCard,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            size: 35,
                          ),
                          title: Text(
                            'Terms and Conditions',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20,
                          ),
                          tileColor: Color(0x00F5F5F5),
                          dense: false,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(52, 0, 7, 5),
                          child: Container(
                            width: double.infinity,
                            height: 0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFFC1C4C8),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            setDarkModeSetting(context, ThemeMode.dark);
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.photo_camera_front,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 35,
                            ),
                            title: Text(
                              'Appearance',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20,
                            ),
                            tileColor: Color(0x00F5F5F5),
                            dense: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(52, 0, 7, 15),
                          child: Container(
                            width: double.infinity,
                            height: 0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFFC1C4C8),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
