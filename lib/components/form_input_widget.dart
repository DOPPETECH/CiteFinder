import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInputWidget extends StatefulWidget {
  const FormInputWidget({
    Key key,
    this.labelText,
    this.hintText,
    this.trailingIcon,
    this.leadingIcon,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final Widget trailingIcon;
  final Widget leadingIcon;

  @override
  _FormInputWidgetState createState() => _FormInputWidgetState();
}

class _FormInputWidgetState extends State<FormInputWidget> {
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
          child: Text(
            valueOrDefault<String>(
              widget.labelText,
              'First Name',
            ),
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        TextFormField(
          controller: textController,
          obscureText: false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primaryText,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primaryText,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).primaryBackground,
          ),
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
