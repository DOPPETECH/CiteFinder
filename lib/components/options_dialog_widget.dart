import 'package:cite_finder/flutter_flow/flutter_flow_theme.dart';
import 'package:cite_finder/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class OptionDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  const OptionDialog(
      {Key key,
      this.content = "",
      this.title = "",
      this.onCancel,
      this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: FlutterFlowTheme.of(context).title3.copyWith(
              color: FlutterFlowTheme.of(context).themeText,
            ),
      ),
      content: Text(content,
          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
              fontSize: 18, color: FlutterFlowTheme.of(context).themeText)),
      actions: [
        FFButtonWidget(
          text: "Cancel",
          onPressed: onCancel,
          options: FFButtonOptions(
            width: 90,
            height: 50,
            color: Colors.red,
            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Lexend Deca',
                  color: Colors.white,
                ),
            elevation: 2,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: 8,
          ),
        ),
        FFButtonWidget(
          text: "OK",
          onPressed: onConfirm,
          options: FFButtonOptions(
            width: 90,
            height: 50,
            color: FlutterFlowTheme.of(context).primaryText,
            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Lexend Deca',
                  color: Colors.white,
                ),
            elevation: 2,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: 8,
          ),
        )
      ],
    );
  }
}
