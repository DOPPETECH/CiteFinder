// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

class HostelsSlider extends StatefulWidget {
  const HostelsSlider({
    Key key,
    this.width,
    this.height,
    this.hostels,
  }) : super(key: key);

  final double width;
  final double height;
  final List<HostelsRecord> hostels;

  @override
  _HostelsSliderState createState() => _HostelsSliderState();
}

class _HostelsSliderState extends State<HostelsSlider> {
  @override
  Widget build(BuildContext context) {
    return widget.hostels != null && widget.hostels.isNotEmpty
        ? CarouselSlider(
            items: widget.hostels
                .map((hostel) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: HostelCardWidget(hostel: hostel)))
                .toList(),
            options: CarouselOptions(
                height: widget.height,
                autoPlay: true,
                viewportFraction: 0.7,
                aspectRatio: 16 / 9))
        : Center(
            child: Text("No Hostels have been added for now",
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    )));
  }
}

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
      decoration: const BoxDecoration(
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
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
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.88, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(4, 3, 9, 3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                            child: Icon(
                              Icons.star_rate,
                              color: Colors.white,
                              size: 22,
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
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    valueOrDefault<String>(
                      widget.hostel.name,
                      'Mami Anna VIP',
                    ).maybeHandleOverflow(
                      maxChars: 36,
                      replacement: '…',
                    ),
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 6),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
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
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 6),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    widget.hostel.description.maybeHandleOverflow(
                      maxChars: 30,
                      replacement: '…',
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 6),
              child: TextButton(
                  onPressed: () {}, child: const Text("View Details")))
        ],
      ),
    );
  }
}
