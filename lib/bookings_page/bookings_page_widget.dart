import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingsPageWidget extends StatefulWidget {
  const BookingsPageWidget({Key key}) : super(key: key);

  @override
  _BookingsPageWidgetState createState() => _BookingsPageWidgetState();
}

class _BookingsPageWidgetState extends State<BookingsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                  child: Text(
                    'Bookings Validations',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor),
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: FlutterFlowTheme.of(context).themeText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).themeText,
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                          indicator: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: theme.secondaryColor, width: 4))),
                          labelPadding: EdgeInsets.only(bottom: 0),
                          tabs: [
                            Tab(text: "Pending"),
                            Tab(
                              text: 'Approved',
                            ),
                            Tab(
                              text: 'Declined',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              StreamBuilder<List<BookingsRecord>>(
                                stream: queryBookingsRecord(
                                  queryBuilder: (bookingsRecord) =>
                                      bookingsRecord
                                          .where('user',
                                              isEqualTo: currentUserReference)
                                          .where('status', isEqualTo: 'pending')
                                          .orderBy('date_booked',
                                              descending: true),
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
                                  if (snapshot.data.isEmpty) {
                                    return Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "You have no Pending Bookings",
                                          textAlign: TextAlign.center,
                                          style: theme.title2.copyWith(
                                              color: Color(0XFFC4C4C4))),
                                    ));
                                  }
                                  List<BookingsRecord>
                                      listViewBookingsRecordList =
                                      snapshot.data;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewBookingsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewBookingsRecord =
                                          listViewBookingsRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: StreamBuilder<HostelRoomsRecord>(
                                          stream: HostelRoomsRecord.getDocument(
                                              listViewBookingsRecord.room),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitDualRing(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowHostelRoomsRecord =
                                                snapshot.data;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                StreamBuilder<HostelsRecord>(
                                                  stream:
                                                      HostelsRecord.getDocument(
                                                          rowHostelRoomsRecord
                                                              .hostel),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              SpinKitDualRing(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final rowHostelsRecord =
                                                        snapshot.data;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .addOne(
                                                                  listViewIndex)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          '. ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            rowHostelsRecord
                                                                .name,
                                                            'Some Hostel',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  text: 'Pending',
                                                  options: FFButtonOptions(
                                                    width: 100,
                                                    height: 30,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .pending,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 12,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              StreamBuilder<List<BookingsRecord>>(
                                stream: queryBookingsRecord(
                                  queryBuilder: (bookingsRecord) =>
                                      bookingsRecord
                                          .where('user',
                                              isEqualTo: currentUserReference)
                                          .where('status',
                                              isEqualTo: 'approved')
                                          .orderBy('date_booked',
                                              descending: true),
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
                                  if (snapshot.data.isEmpty) {
                                    return Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "You have no Approved Bookings",
                                          textAlign: TextAlign.center,
                                          style: theme.title2.copyWith(
                                              color: Color(0XFFC4C4C4))),
                                    ));
                                  }
                                  List<BookingsRecord>
                                      listViewBookingsRecordList =
                                      snapshot.data;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewBookingsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewBookingsRecord =
                                          listViewBookingsRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: StreamBuilder<HostelRoomsRecord>(
                                          stream: HostelRoomsRecord.getDocument(
                                              listViewBookingsRecord.room),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitDualRing(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowHostelRoomsRecord =
                                                snapshot.data;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                StreamBuilder<HostelsRecord>(
                                                  stream:
                                                      HostelsRecord.getDocument(
                                                          rowHostelRoomsRecord
                                                              .hostel),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              SpinKitDualRing(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final rowHostelsRecord =
                                                        snapshot.data;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .addOne(
                                                                  listViewIndex)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          '. ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            rowHostelsRecord
                                                                .name,
                                                            'Some Hostel',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  text: 'Approved',
                                                  options: FFButtonOptions(
                                                    width: 100,
                                                    height: 30,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 12,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              StreamBuilder<List<BookingsRecord>>(
                                stream: queryBookingsRecord(
                                  queryBuilder: (bookingsRecord) =>
                                      bookingsRecord
                                          .where('user',
                                              isEqualTo: currentUserReference)
                                          .where('status',
                                              isEqualTo: 'declined')
                                          .orderBy('date_booked',
                                              descending: true),
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

                                  if (snapshot.data.isEmpty) {
                                    return Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "You have no Declined Bookings",
                                          textAlign: TextAlign.center,
                                          style: theme.title2.copyWith(
                                              color: Color(0XFFC4C4C4))),
                                    ));
                                  }
                                  List<BookingsRecord>
                                      listViewBookingsRecordList =
                                      snapshot.data;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewBookingsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewBookingsRecord =
                                          listViewBookingsRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: StreamBuilder<HostelRoomsRecord>(
                                          stream: HostelRoomsRecord.getDocument(
                                              listViewBookingsRecord.room),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitDualRing(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowHostelRoomsRecord =
                                                snapshot.data;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                StreamBuilder<HostelsRecord>(
                                                  stream:
                                                      HostelsRecord.getDocument(
                                                          rowHostelRoomsRecord
                                                              .hostel),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              SpinKitDualRing(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final rowHostelsRecord =
                                                        snapshot.data;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .addOne(
                                                                  listViewIndex)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          '. ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            rowHostelsRecord
                                                                .name,
                                                            'Some Hostel',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  text: 'Declined',
                                                  options: FFButtonOptions(
                                                    width: 100,
                                                    height: 30,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .danger,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 12,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
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
