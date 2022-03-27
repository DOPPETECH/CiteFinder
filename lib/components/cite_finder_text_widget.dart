import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CiteFinderTextWidget extends StatefulWidget {
  const CiteFinderTextWidget({
    Key key,
    this.fontSize,
  }) : super(key: key);

  final double fontSize;

  @override
  _CiteFinderTextWidgetState createState() => _CiteFinderTextWidgetState();
}

class _CiteFinderTextWidgetState extends State<CiteFinderTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Cité',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 20,
              ),
        ),
        Text(
          'Finder',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                fontSize: 20,
              ),
        ),
      ],
    );
  }
}
