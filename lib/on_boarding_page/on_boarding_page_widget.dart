import '../components/cite_finder_text_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../signup_page/signup_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPageWidget extends StatefulWidget {
  const OnBoardingPageWidget({Key key}) : super(key: key);

  @override
  _OnBoardingPageWidgetState createState() => _OnBoardingPageWidgetState();
}

class _OnBoardingPageWidgetState extends State<OnBoardingPageWidget> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 70),
                  child: Container(
                    width: double.infinity,
                    height: 450,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                          child: PageView(
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 25),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'd9f5p75d' /* Welcome To  */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .title3,
                                        ),
                                        CiteFinderTextWidget(
                                          fontSize: 12.0,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'no83fzby' /*  Bambili */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .title3,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 35),
                                    child: Image.asset(
                                      'assets/images/undraw_location_review_dmxd_1.png',
                                      width: 245,
                                      height: 234,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'bnm7nt9h' /* Locate and book your hostel ro... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 20),
                                    child: Text(
                                      'Locate your room with a search',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Poppins',
                                            lineHeight: 1,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 35),
                                    child: Image.asset(
                                      'assets/images/undraw_house_searching_re_stk8_1.png',
                                      width: 245,
                                      height: 234,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'd49rxh1f' /* Search and locate quality room... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 20),
                                    child: Text(
                                      'Register and book for rooms',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Poppins',
                                            lineHeight: 1,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 35),
                                    child: Image.asset(
                                      'assets/images/undraw_account_re_o7id_1.png',
                                      width: 245,
                                      height: 234,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'jf789pxy' /* Proceed to create your account... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: SmoothPageIndicator(
                              controller: pageViewController ??=
                                  PageController(initialPage: 0),
                              count: 3,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) {
                                pageViewController.animateToPage(
                                  i,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: ExpandingDotsEffect(
                                expansionFactor: 2,
                                spacing: 8,
                                radius: 16,
                                dotWidth: 16,
                                dotHeight: 16,
                                dotColor: Color(0xFF9790D3),
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (pageViewController.page < 2) {
                        pageViewController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      } else
                        await Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: SignupPageWidget(),
                          ),
                        );
                    },
                    text: FFLocalizations.of(context)
                        .getText('nz61ngpf') /*Continue */,
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 55,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 20,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.pushReplacement(
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
                      FFLocalizations.of(context).getText('qv4lb65i'),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12,
                          ),
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
