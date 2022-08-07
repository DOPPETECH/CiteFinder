import 'package:cite_finder/pages/hostel_details/hostel_details_widget.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HostelCardWidget extends StatefulWidget {
  const HostelCardWidget({
    Key key,
    this.hostel,
  }) : super(key: key);

  final HostelsRecord hostel;

  @override
  _HostelCardWidgetState createState() => _HostelCardWidgetState();
}

class _HostelCardWidgetState extends State<HostelCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFFBFBFB),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x32000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(21),
          bottomRight: Radius.circular(21),
          topLeft: Radius.circular(21),
          topRight: Radius.circular(0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(21),
                bottomRight: Radius.circular(21),
                topLeft: Radius.circular(21),
                topRight: Radius.circular(0),
              ),
              child: CachedNetworkImage(
                imageUrl: valueOrDefault<String>(
                  widget.hostel.mainImage,
                  'https://images.pexels.com/photos/892618/pexels-photo-892618.jpeg',
                ),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 4, 9, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                            child: Icon(
                              Icons.star_rate,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                widget.hostel.rating,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                              ),
                              '4.8',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          valueOrDefault<String>(
                            widget.hostel.name,
                            'Mami Anna VIP',
                          ).maybeHandleOverflow(
                            maxChars: 17,
                            replacement: '…',
                          ),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: FaIcon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: FlutterFlowTheme.of(context).danger,
                          size: 20,
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.hostel.zone,
                          'Up quarters',
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              fontSize: 15,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          widget.hostel.description.maybeHandleOverflow(
                            maxChars: 60,
                            replacement: '…',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: TextButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: HostelDetailsWidget(hostel: widget.hostel),
                            ),
                          );
                        },
                        child: Text(
                            FFLocalizations.of(context).getVariableText(
                                enText: "view details",
                                frText: "voir les détails"),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .copyWith(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor))))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
