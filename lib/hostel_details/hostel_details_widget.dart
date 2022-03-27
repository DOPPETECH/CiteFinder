import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cite_finder/auth/auth_util.dart';
import 'package:cite_finder/bookings_page/bookings_page_widget.dart';
import 'package:cite_finder/flutter_flow/flutter_flow_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../backend/backend.dart' hide LatLng;
import '../components/options_dialog_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart' as utils;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

enum RoomType {
  ///Represents a single room
  Single,

  ///Represents a modern room with kitchen and/or toilet
  Modern,

  ///Represents a full apparment which can have parlor or multiple bedrooms
  Appartment
}

class HostelDetailsWidget extends StatefulWidget {
  const HostelDetailsWidget({
    Key key,
    this.hostel,
  }) : super(key: key);

  final HostelsRecord hostel;

  @override
  _HostelDetailsWidgetState createState() => _HostelDetailsWidgetState();
}

class _HostelDetailsWidgetState extends State<HostelDetailsWidget>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  GoogleMapController mapController;
  LatLng mapCenter;
  LatLng universityLocation = LatLng(6.011559361192787, 10.259347515194026);
  String selectedRoomType = "single_room";

  Map<String, Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    print("map is ready!");
    mapController = controller;
    setState(() {
      markers.addAll({
        "${widget.hostel.name}_location": Marker(
          markerId: MarkerId("${widget.hostel.name}_location"),
          position: universityLocation,
          infoWindow: InfoWindow(
            title: "The University of Bamenda",
            snippet:
                "${utils.getDistanceFromLatLonInKm(mapCenter, universityLocation)}km from ${widget.hostel.name}",
          ),
        ),
        "University_location": Marker(
          markerId: MarkerId("University_location"),
          position: mapCenter,
          infoWindow: InfoWindow(
            title: widget.hostel.name,
            snippet: widget.hostel.zone,
          ),
        )
      });
    });
  }

  @override
  void initState() {
    super.initState();
    mapCenter = LatLng(
        widget.hostel.location.latitude ?? universityLocation.latitude,
        widget.hostel.location.longitude ?? universityLocation.longitude);

    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<HostelsRecord>(
              stream: HostelsRecord.getDocument(widget.hostel.reference),
              initialData: widget.hostel,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: SpinKitDualRing(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    ),
                  );
                }

                final HostelsRecord hostel = snapshot.data;

                return StreamBuilder<List<HostelRoomsRecord>>(
                    stream: queryHostelRoomsRecord(
                        queryBuilder: (hostelRoom) => hostelRoom.where('hostel',
                            isEqualTo: hostel.reference)),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitDualRing(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          ),
                        );
                      }

                      final List<HostelRoomsRecord> hostelRooms = snapshot.data;
                      List<Widget> sliderImages = [];
                      hostelRooms.forEach((room) {
                        sliderImages.addAll(
                            room.images.map<Widget>((im) => CachedNetworkImage(
                                  imageUrl: im,
                                  fit: BoxFit.cover,
                                  placeholder: (context, str) {
                                    return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Icon(Icons.image, size: 60));
                                  },
                                )));
                      });
                      return Stack(
                        children: [
                          hostelRooms.length > 0
                              ? CarouselSlider(
                                  items: sliderImages,
                                  options: CarouselOptions(viewportFraction: 1))
                              : CachedNetworkImage(
                                  imageUrl: hostel.mainImage,
                                  fit: BoxFit.cover,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  placeholder: (context, str) {
                                    return Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.35,
                                        child: Icon(Icons.image, size: 60));
                                  },
                                ),

                          //bottom sheet with hostel information

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.66,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(42),
                                    topRight: Radius.circular(42)),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            left: 10,
                                            right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(hostel.name ?? "",
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title2
                                                    .copyWith(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .themeText))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 7, 0),
                                              child: FaIcon(
                                                FontAwesomeIcons.mapMarkerAlt,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .danger,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              utils.valueOrDefault<String>(
                                                widget.hostel.zone,
                                                'Up quarters',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 17,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .themeText),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 15, bottom: 5),
                                        child: SizedBox(
                                          height: 170,
                                          child: ListView(
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                HostelPropWidget(
                                                    image: "Sheets.png",
                                                    number: 10,
                                                    title: "BedRooms",
                                                    width: 200,
                                                    height: 169),
                                                HostelPropWidget(
                                                    image: "Hotel Building.png",
                                                    number: 10,
                                                    title: "Buildings",
                                                    width: 200,
                                                    height: 169),
                                                HostelPropWidget(
                                                    image: "Dining Room.png",
                                                    number: 10,
                                                    title: "Kitchen",
                                                    width: 200,
                                                    height: 169),
                                              ]),
                                        ),
                                      ),

                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 10),
                                          child: Text("Description",
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle1
                                                  .copyWith(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .themeText))),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 18),
                                          child: Text(hostel.description ?? "",
                                              textAlign: TextAlign.left,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .copyWith(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .themeText))),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 6),
                                          child: Text("Characteristics",
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle1
                                                  .copyWith(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .themeText))),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                              "Water Availability" +
                                                  ": " +
                                                  hostel.waterAvailability,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .copyWith(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .themeText))),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 15),
                                          child: Text(
                                              "Security Level" +
                                                  ": " +
                                                  hostel.security,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .copyWith(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .themeText))),

                                      //google map containing location of Hostel
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text("Precise Location")),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: mapCenter != null
                                            ? SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.24,
                                                width: double.infinity,
                                                child: GoogleMap(
                                                    onMapCreated: _onMapCreated,
                                                    initialCameraPosition:
                                                        CameraPosition(
                                                      target:
                                                          universityLocation,
                                                      zoom: 15.0,
                                                    ),
                                                    markers:
                                                        markers.values.toSet()))
                                            : Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child: SpinKitDualRing(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 50,
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      Text("Loading map...",
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .copyWith(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .themeText))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                      ),

                                      FFButtonWidget(
                                          text: "Book Now",
                                          onPressed: () {
                                            //bottom sheet which appears on which user can select room type
                                            showModalBottomSheet(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 16,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                context: context,
                                                builder: (context) {
                                                  return ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      maxHeight:
                                                          size.height * 0.8,
                                                      minHeight:
                                                          size.height * 0.3,
                                                    ),
                                                    child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15,
                                                                vertical: 15),
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                  "Select Room Type",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2),
                                                              Divider(),
                                                              TabBar(
                                                                tabs: [
                                                                  Tab(
                                                                      text:
                                                                          "Single Room"),
                                                                  Tab(
                                                                      text:
                                                                          "Modern Room"),
                                                                  Tab(
                                                                      text:
                                                                          "Appartment")
                                                                ],
                                                                controller:
                                                                    tabController,
                                                                indicatorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    TabBarView(
                                                                  controller:
                                                                      tabController,
                                                                  children: [
                                                                    TabViewContent(
                                                                        hostelRoom: hostelRooms?.firstWhere(
                                                                            (element) =>
                                                                                element.type ==
                                                                                'single',
                                                                            orElse: () =>
                                                                                null),
                                                                        hostel:
                                                                            hostel),
                                                                    TabViewContent(
                                                                        hostelRoom: hostelRooms?.firstWhere(
                                                                            (element) =>
                                                                                element.type ==
                                                                                'modern',
                                                                            orElse: () =>
                                                                                null),
                                                                        hostel:
                                                                            hostel),
                                                                    TabViewContent(
                                                                        hostelRoom: hostelRooms?.firstWhere(
                                                                            (element) =>
                                                                                element.type ==
                                                                                'appartment',
                                                                            orElse: () =>
                                                                                null),
                                                                        hostel:
                                                                            hostel),
                                                                  ],
                                                                ),
                                                              )
                                                            ])),
                                                  );
                                                });
                                          },
                                          options: FFButtonOptions(
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 20),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .copyWith(
                                                          color: Colors.white),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor))
                                    ]),
                              ),
                            ),
                          ),

                          //navigation and like and rating at the top
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.arrow_back_outlined,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 25,
                                            borderWidth: 1,
                                            buttonSize: 40,
                                            fillColor: Color(0XFFFFFFFF),
                                            icon: FaIcon(
                                              FontAwesomeIcons.solidHeart,
                                              size: 23,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .danger,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            margin: EdgeInsets.only(right: 15),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 4, 9, 4),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 4, 0),
                                                    child: Icon(
                                                      Icons.star_rate,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    utils
                                                        .valueOrDefault<String>(
                                                      utils.formatNumber(
                                                        hostel.rating,
                                                        formatType: utils
                                                            .FormatType.decimal,
                                                        decimalType: utils
                                                            .DecimalType
                                                            .automatic,
                                                      ),
                                                      '4.8',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ])),
                          ),
                        ],
                      );
                    });
              }),
        ),
      ),
    );
  }
}

class HostelPropWidget extends StatelessWidget {
  const HostelPropWidget(
      {Key key,
      @required this.image,
      @required this.number,
      @required this.title,
      @required this.width,
      @required this.height,
      this.margin = 10})
      : super(key: key);

  final String image;
  final double number;
  final String title;
  final double width;
  final double height;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 3),
        margin: EdgeInsets.only(right: margin),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Color(0XFFDFEBF1), borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Color(0XFFC4C4C4),
                radius: height / 2.8,
                child: Image.asset(
                  'assets/images/$image',
                ),
              ),
            ),
            SizedBox(height: 7),
            Text("${number.toStringAsFixed(0)} $title",
                style: FlutterFlowTheme.of(context)
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.bold))
          ],
        ));
  }
}

class TabViewContent extends StatelessWidget {
  const TabViewContent({
    Key key,
    @required this.hostelRoom,
    @required this.hostel,
  }) : super(key: key);

  final HostelRoomsRecord hostelRoom;
  final HostelsRecord hostel;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: hostelRoom != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    hostelRoom != null && hostelRoom.images.length > 0
                        ? CarouselSlider(
                            items: hostelRoom.images
                                .map<Widget>((image) => CachedNetworkImage(
                                      imageUrl: image,
                                      fit: BoxFit.cover,
                                      height: 200,
                                      placeholder: (context, str) {
                                        return Container(
                                            width: double.infinity,
                                            height: 170,
                                            child: Icon(Icons.image, size: 60));
                                      },
                                    )),
                            options: CarouselOptions(
                                viewportFraction: 0.7, height: 170))
                        : CachedNetworkImage(
                            imageUrl: hostel.mainImage,
                            fit: BoxFit.cover,
                            height: 200,
                            placeholder: (context, str) {
                              return Container(
                                  width: double.infinity,
                                  height: 170,
                                  child: Icon(Icons.image, size: 60));
                            },
                          ),

                    //room type description
                    SizedBox(height: 20),
                    Text("Description",
                        style:
                            theme.subtitle1.copyWith(color: theme.themeText)),
                    SizedBox(height: 7),
                    Text(hostelRoom?.description ?? "A good room for you"),

                    // number of rooms available for this type
                    Divider(),
                    SizedBox(height: 15),
                    Text("Number Available",
                        style:
                            theme.subtitle1.copyWith(color: theme.themeText)),
                    SizedBox(height: 5),
                    Text("${hostelRoom?.numberAvailable ?? 10}"),

                    // price for this room type
                    Divider(),
                    SizedBox(height: 15),
                    Text("Price",
                        style:
                            theme.subtitle1.copyWith(color: theme.themeText)),
                    SizedBox(height: 5),
                    Text("${hostelRoom?.price ?? 150000}FCFA"),
                    SizedBox(height: 25),

                    //book button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: FFButtonWidget(
                          text: "Book",
                          onPressed: () async {
                            final res = await showDialog<bool>(
                                context: context,
                                builder: (context) => OptionDialog(
                                    title: "Confirm Booking",
                                    content:
                                        "Are you sure you want to book this room?",
                                    onConfirm: () =>
                                        Navigator.of(context).pop(true),
                                    onCancel: () =>
                                        Navigator.of(context).pop(false)));

                            if (res == true) {
                              final bookingData = createBookingsRecordData(
                                  user: currentUserReference,
                                  room: hostelRoom.reference,
                                  dateBooked: DateTime.now(),
                                  status: 'pending');

                              try {
                                await BookingsRecord.collection
                                    .doc()
                                    .set(bookingData);
                                Fluttertoast.showToast(
                                    msg: "Booking Successful",
                                    backgroundColor: theme.secondaryColor,
                                    textColor: Color(0XFFFFFFFF));

                                //on successful booking, we navigate to the bookings page
                                Navigator.of(context).push(utils.PageTransition(
                                    child: BookingsPageWidget(),
                                    type:
                                        utils.PageTransitionType.rightToLeft));
                              } catch (err) {
                                utils.showSnackbar(context,
                                    'Sorry, we were unable to process your booking request. please verify your internect connection and try again');
                                debugPrint(err);
                              }
                            }
                          },
                          options: FFButtonOptions(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              textStyle: FlutterFlowTheme.of(context)
                                  .title3
                                  .copyWith(color: Colors.white, fontSize: 25),
                              color:
                                  FlutterFlowTheme.of(context).primaryColor)),
                    )
                  ],
                ),
              )
            : Center(
                child: Text(
                  "This Room type is not Available",
                  textAlign: TextAlign.center,
                  style: theme.title2.copyWith(color: Color(0XFFC4C4C4)),
                ),
              ));
  }
}
