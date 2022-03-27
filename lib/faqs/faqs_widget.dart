import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqsWidget extends StatefulWidget {
  const FaqsWidget({Key key}) : super(key: key);

  @override
  _FaqsWidgetState createState() => _FaqsWidgetState();
}

class _FaqsWidgetState extends State<FaqsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                child: Container(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 25, 15, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 45,
                              fillColor: Color(0xFFF5F4FB),
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 25,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                            Container(
                              width: 0,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'FAQS',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFF5F5F5),
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      Text(
                        'Frequently Asked Questions',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                child: Container(
                  width: double.infinity,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: ExpandableNotifier(
                    initialExpanded: false,
                    child: ExpandablePanel(
                      header: Text(
                        'Can I book more than one room?',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      collapsed: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 0,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                        ),
                      ),
                      expanded: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'You can book up to three rooms in one hostel',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).themeText,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                        expandIcon: Icons.keyboard_arrow_down,
                        collapseIcon: Icons.keyboard_arrow_up,
                        iconSize: 30,
                        iconColor: FlutterFlowTheme.of(context).themeText,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                child: Container(
                  width: double.infinity,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: ExpandableNotifier(
                    initialExpanded: false,
                    child: ExpandablePanel(
                      header: Text(
                        'How can I communicate with the owners?',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      collapsed: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 0,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                        ),
                      ),
                      expanded: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Our policy does not allow you to directly communicate with the owners but you can use the discussion section to chat with admins if you have any worry.',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).themeText,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                        expandIcon: Icons.keyboard_arrow_down,
                        collapseIcon: Icons.keyboard_arrow_up,
                        iconSize: 30,
                        iconColor: FlutterFlowTheme.of(context).themeText,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                child: Container(
                  width: double.infinity,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: ExpandableNotifier(
                    initialExpanded: false,
                    child: ExpandablePanel(
                      header: Text(
                        'How long does it take to verify my booking?',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      collapsed: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 0,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                        ),
                      ),
                      expanded: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Our team works 24/7 to make sure  that your bookings are verified in as little time as possible. Generally a few hours depending on the location of the hostel.',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).themeText,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                        expandIcon: Icons.keyboard_arrow_down,
                        collapseIcon: Icons.keyboard_arrow_up,
                        iconSize: 30,
                        iconColor: FlutterFlowTheme.of(context).themeText,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                child: Container(
                  width: double.infinity,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: ExpandableNotifier(
                    initialExpanded: false,
                    child: ExpandablePanel(
                      header: Text(
                        'How am I notified when it is approved?',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      collapsed: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 0,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                        ),
                      ),
                      expanded: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'We will send you a notification on the CiteFinder app and also we will notify you through email and sms if possible.',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).themeText,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                        expandIcon: Icons.keyboard_arrow_down,
                        collapseIcon: Icons.keyboard_arrow_up,
                        iconSize: 30,
                        iconColor: FlutterFlowTheme.of(context).themeText,
                      ),
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
