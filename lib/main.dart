import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:cite_finder/on_boarding_page/on_boarding_page_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page/home_page_widget.dart';
import 'profile_page/profile_page_widget.dart';
import 'bookings_page/bookings_page_widget.dart';
import 'chats_page/chats_page_widget.dart';
import 'all_chats_page/all_chats_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  Stream<CiteFinderFirebaseUser> userStream;
  CiteFinderFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  void initState() {
    super.initState();
    userStream = citeFinderFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CiteFinder',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
      ],
      theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor:
              FlutterFlowTheme.of(context).primaryBackground),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor:
              FlutterFlowTheme.of(context).primaryBackground),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Container(
              color: FlutterFlowTheme.of(context).primaryBackground,
              child: Center(
                child: Builder(
                  builder: (context) => Image.asset(
                    'assets/images/Group_1.png',
                    width: 235,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : OnBoardingPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'ProfilePage': ProfilePageWidget(),
      'BookingsPage': BookingsPageWidget(),
      'AllChatsPage': AllChatsPageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        selectedItemColor: FlutterFlowTheme.of(context).secondaryBackground,
        unselectedItemColor: FlutterFlowTheme.of(context).grayButton,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
              size: 25,
            ),
            label: FFLocalizations.of(context).getText(
              '541pqjia' /* Home */,
            ),
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.userCircle,
              size: 28,
            ),
            label: 'Profile',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.bootstrap,
              size: 25,
            ),
            label:
                FFLocalizations.of(context).getText('xirm5px3') /*Bookings */,
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble,
              size: 25,
            ),
            label: FFLocalizations.of(context).getText('de3n345h') /*Chats */,
            tooltip: '',
          ),
        ],
      ),
    );
  }
}
