import 'package:cached_network_image/cached_network_image.dart';
import 'package:cite_finder/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserPhotoWidget extends StatelessWidget {
  final String imageUrl;
  final String heroTag;
  final double radius;

  const UserPhotoWidget(
      {Key key, this.imageUrl, this.heroTag, this.radius = 70})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: imageUrl != null && imageUrl.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              width: radius,
              height: radius,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (ctx, str, progress) {
                return Center(
                    child: CircularProgressIndicator(
                  value: progress.totalSize != null
                      ? progress.downloaded / progress.totalSize
                      : null,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                ));
              },
              errorWidget: (ctx, s, d) {
                return Container(
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: radius,
                    ));
              },
            )
          : Icon(FontAwesomeIcons.solidUserCircle,
              size: radius - 20,
              color: FlutterFlowTheme.of(context).secondaryColor),
    );
  }
}
