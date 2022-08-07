import 'package:carousel_slider/carousel_slider.dart';
import 'package:cite_finder/components/hostel_card_widget.dart';

import '../../backend/backend.dart';
import '../../components/app_drawer_widget.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: AppDrawerWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Top app bar
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 35),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryColor,
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
                              height: 33,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                  'nsfkxo01') /**Search for a hostel */,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              filled: true,
                              fillColor: Color(0xFFCAC7C7),
                              prefixIcon: Icon(
                                Icons.search,
                                color: const Color(0xFF110E25),
                                size: 20,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF110E25)),
                          ),
                        ),
                      ),
                      // FlutterFlowIconButton(
                      //   borderColor: Colors.transparent,
                      //   borderRadius: 30,
                      //   borderWidth: 1,
                      //   buttonSize: 40,
                      //   icon: Icon(
                      //     Icons.language_rounded,
                      //     color: Colors.black,
                      //     size: 20,
                      //   ),
                      //   onPressed: () async {
                      //     setAppLanguage(context, 'fr');
                      //   },
                      // ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 45,
                        fillColor: FlutterFlowTheme.of(context).secondaryColor,
                        icon: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.bell,
                              color: const Color(0XFFFFFFFF),
                              size: 27,
                            ),
                            Positioned(
                              right: 1,
                              top: 8,
                              child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0XFFFFFFFF))),
                            )
                          ],
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ),

                //main body, cite list
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 15, left: 15),
                            child: Text(
                              FFLocalizations.of(context).getVariableText(
                                  enText: "Most Popular",
                                  frText: "Les Plus Popuplaires"),
                              style: FlutterFlowTheme.of(context)
                                  .title3
                                  .copyWith(
                                      color: FlutterFlowTheme.of(context)
                                          .themeText),
                            )),
                        StreamBuilder<List<HostelsRecord>>(
                            stream: queryHostelsRecord(
                              queryBuilder: (hostelsRecord) => hostelsRecord
                                  .orderBy('rating', descending: true)
                                  .limit(7),
                            ),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitDualRing(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<HostelsRecord> popularHostelRecordList =
                                  snapshot.data;

                              return CarouselSlider(
                                  items: popularHostelRecordList
                                      .map<Widget>((hostelRecord) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: HostelCardWidget(
                                                hostel: hostelRecord),
                                          ))
                                      .toList(),
                                  options:
                                      CarouselOptions(viewportFraction: 0.9));
                            }),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 30, left: 15, bottom: 0),
                            child: Text(
                              FFLocalizations.of(context).getVariableText(
                                  enText: "Other Hostels",
                                  frText: "Autres Mini-Citées"),
                              style: FlutterFlowTheme.of(context)
                                  .title3
                                  .copyWith(
                                      color: FlutterFlowTheme.of(context)
                                          .themeText),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: StreamBuilder<List<HostelsRecord>>(
                            stream: queryHostelsRecord(
                              queryBuilder: (hostelsRecord) => hostelsRecord
                                  .orderBy('date_added', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitDualRing(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<HostelsRecord> containerHostelsRecordList =
                                  snapshot.data;
                              return Column(
                                children: containerHostelsRecordList
                                    .map<Widget>((hostelRecord) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15),
                                          child: SizedBox(
                                            height: 220,
                                            child: HostelCardWidget(
                                                hostel: hostelRecord),
                                          ),
                                        ))
                                    .toList(),
                              );
                            },
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
