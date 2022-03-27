import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['en', 'fr'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String enText = '',
    String frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'nsfkxo01': {
      'en': 'Search for a hostel',
      'fr': 'Cherchez une mini cité',
    },
    '541pqjia': {
      'en': 'Home',
      'fr': 'Acceuil',
    },
  },
  // SignupPage
  {
    'rbnqnoi7': {
      'en': 'Sign Up',
      'fr': '',
    },
    'c2tq6jz0': {
      'en': 'Fill your information below to create your account',
      'fr': '',
    },
    '4u8i6l3y': {
      'en': 'First Name',
      'fr': '',
    },
    'bdpe030u': {
      'en': 'Enter your first name',
      'fr': '',
    },
    'e0n2gk9z': {
      'en': 'Last Name',
      'fr': '',
    },
    'zmjr223a': {
      'en': 'Enter your last name',
      'fr': '',
    },
    's3wb8u6f': {
      'en': 'E-Mail Address',
      'fr': '',
    },
    'v2ypetz0': {
      'en': 'Your email address here',
      'fr': '',
    },
    'c18jv3bh': {
      'en': 'Phone Number',
      'fr': '',
    },
    '9i02bn02': {
      'en': '+236 6******',
      'fr': '',
    },
    't14euwuo': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'th152z08': {
      'en': 'Enter your password here',
      'fr': 'Entrez votre mot de passe ici',
    },
    '9w0kosga': {
      'en': 'Confirm Password',
      'fr': 'Confirmez le mot de passe',
    },
    'guxu70ow': {
      'en': 'Re-enter your password here',
      'fr': 'Entrez à nouveau votre mot de passe ici',
    },
    '2atq8a5d': {
      'en': 'Sign Up',
      'fr': 'S\'inscrire',
    },
    '4s1k8c1a': {
      'en': 'OR Signup with',
      'fr': 'OU Inscrivez-vous avec',
    },
    'amj5xqmp': {
      'en': 'Already have and account?',
      'fr': 'Vous avez déjà un compte ?',
    },
    'i9eggk9t': {
      'en': 'Login',
      'fr': 'Connexion',
    },
    '7iu9cje2': {
      'en': 'The first name should not be empty',
      'fr': 'Le nom ne doit pas être vide ',
    },
    'f3b9lzje': {
      'en': 'Field is required',
      'fr': 'Ce champ est requis',
    },
    'c0ms487h': {
      'en': 'Field is required',
      'fr': 'Ce champ est requis',
    },
    'n8ixzyuf': {
      'en': 'Field is required',
      'fr': 'Ce champ est requis',
    },
    'o0sl4o00': {
      'en': 'Field is required',
      'fr': 'Ce champ est requis',
    },
    'ndrjwndl': {
      'en': 'Field is required',
      'fr': 'Ce champ est requis',
    },
    'dkcoh5de': {
      'en': 'Home',
      'fr': 'Acceuil',
    },
  },
  // LoginPage
  {
    'lribh65l': {
      'en': 'Log In',
      'fr': 'Se Connecter',
    },
    'ichhm9il': {
      'en': 'Welcome back to ',
      'fr': 'Bienvenu dans ',
    },
    'tyx2ircy': {
      'en': 'Cité',
      'fr': 'Cité',
    },
    '5wkpsb2g': {
      'en': 'Finder',
      'fr': 'Finder',
    },
    'ufrptrf0': {
      'en': 'Enter your email address here',
      'fr': 'Entrez votre adresse de messagerie ici',
    },
    'f1u5g6la': {
      'en': 'Enter your password here',
      'fr': '',
    },
    'd064fau6': {
      'en': 'Remember Me',
      'fr': '',
    },
    'a2ccbna3': {
      'en': 'Remember Me',
      'fr': '',
    },
    '4bakxhph': {
      'en': 'Forgotten Password',
      'fr': '',
    },
    'wdpba46c': {
      'en': 'Login',
      'fr': 'Connexion',
    },
    '6bzyt09z': {
      'en': 'OR Login with',
      'fr': '',
    },
    'nqbzzbqj': {
      'en': 'Don\'t have an account yet?',
      'fr': '',
    },
    'mtznnb4o': {
      'en': 'Create one',
      'fr': '',
    },
    '36ixkq2t': {
      'en': 'Field is required',
      'fr': '',
    },
    'zmr2ngkw': {
      'en': 'Field is required',
      'fr': '',
    },
    '52d9s4kx': {
      'en': 'Password should be at least 4 characters',
      'fr': '',
    },
    '613ovheo': {
      'en': 'Home',
      'fr': '',
    },
  },
  // OnBoardingPage
  {
    'd9f5p75d': {
      'en': 'Welcome To ',
      'fr': '',
    },
    'no83fzby': {
      'en': ' Bambili',
      'fr': '',
    },
    'bnm7nt9h': {
      'en': 'Locate and book your hostel rooms in bambili any day and any time',
      'fr':
          'Localisez et réservez vos chambres à bambili n\'importe quel jour et n\'importe quand',
    },
    'cg84vvss': {
      'en': 'Locate your room with a search',
      'fr': '',
    },
    'd49rxh1f': {
      'en': 'Search and locate quality rooms with classic facilities',
      'fr':
          'Localisez et réservez vos chambres à bambili n\'importe quel jour et n\'importe quand',
    },
    'n6dxjg8i': {
      'en': 'Register and book for rooms',
      'fr': '',
    },
    'jf789pxy': {
      'en': 'Proceed to create your account and book your room now',
      'fr':
          'Localisez et réservez vos chambres à bambili n\'importe quel jour et n\'importe quand',
    },
    'nz61ngpf': {
      'en': 'Continue',
      'fr': 'Continuer',
    },
    'qv4lb65i': {
      'en': 'Skip All >>',
      'fr': 'Tout Passer >>',
    },
    'yz1krayu': {
      'en': 'Home',
      'fr': '',
    },
  },
  // ProfilePage
  {
    'y7irajom': {
      'en': 'Update Profile!',
      'fr': '',
    },
    '1n01z52c': {
      'en': 'First Name',
      'fr': '',
    },
    'rw8wu1mr': {
      'en': 'Enter your first name',
      'fr': '',
    },
    '02pmv95y': {
      'en': 'Last Name',
      'fr': '',
    },
    '4llljvl4': {
      'en': 'Enter your last name',
      'fr': '',
    },
    '73pcinne': {
      'en': 'E-Mail Address',
      'fr': '',
    },
    'tnwgldxi': {
      'en': 'Your email address here',
      'fr': '',
    },
    'as5kdi0w': {
      'en': 'Phone Number',
      'fr': '',
    },
    'sdddum0u': {
      'en': '+236 6******',
      'fr': '',
    },
    'w0wx1ui1': {
      'en': 'Change Passoword',
      'fr': '',
    },
    'twkz23sb': {
      'en': 'Profile',
      'fr': '',
    },
    'user': {
      'en': 'User',
      'fr': 'Utilisateur',
    },
  },
  // BookingsPage
  {
    'l54i3qb9': {
      'en': 'Bookings Validations',
      'fr': '',
    },
    'jzklfn10': {
      'en': 'Pending',
      'fr': '',
    },
    '04hsg3bs': {
      'en': '. ',
      'fr': '',
    },
    'n70ru7bh': {
      'en': 'Pending',
      'fr': '',
    },
    '82gpwxvx': {
      'en': 'Approved',
      'fr': '',
    },
    '65pvqe0z': {
      'en': '. ',
      'fr': '',
    },
    'a8mdhmjt': {
      'en': 'Approved',
      'fr': '',
    },
    'y9o8itu1': {
      'en': 'Declined',
      'fr': '',
    },
    'hfin0van': {
      'en': '. ',
      'fr': '',
    },
    'idx05jp6': {
      'en': 'Declined',
      'fr': '',
    },
    'xirm5px3': {
      'en': 'Bookings',
      'fr': 'Réservations',
    },
  },
  // ChatsPage
  {
    'tokftav5': {
      'en': 'Page Title',
      'fr': '',
    },
    'de3n345h': {
      'en': 'Chats',
      'fr': 'Conversations',
    },
  },
  // ForgotPasswordPage
  {
    'sofbtyb1': {
      'en': 'Forgot Password',
      'fr': '',
    },
    'ucfljpli': {
      'en':
          'Input your email a link will be sent to your inbox to reset your password',
      'fr': '',
    },
    'zebjy4ay': {
      'en': 'johndoe@example.com',
      'fr': '',
    },
    '00klifd1': {
      'en': 'Send',
      'fr': '',
    },
    'cx0e4u2p': {
      'en': 'This field is required',
      'fr': '',
    },
    'b3lv4wad': {
      'en': 'Home',
      'fr': '',
    },
  },
  // ConfirmEmail
  {
    '78rcjd86': {
      'en': 'Success',
      'fr': '',
    },
    'dku6yszm': {
      'en':
          'A confirmation link has been sent to your e-mail please verify to continue',
      'fr': '',
    },
    'l5f1vhrr': {
      'en': 'Verified',
      'fr': '',
    },
    'ujj5r4jy': {
      'en': 'Home',
      'fr': '',
    },
  },
  // ChangePassword
  {
    '1j8h1dq0': {
      'en': 'Change Password',
      'fr': '',
    },
    'gqqej12q': {
      'en': 'E-Mail Address',
      'fr': '',
    },
    'cyj7wtq8': {
      'en': 'Your email address here',
      'fr': '',
    },
    'irskgir9': {
      'en': 'Old Password',
      'fr': '',
    },
    'p0ucbs4k': {
      'en': 'Enter your old password here',
      'fr': '',
    },
    '0zukmtmh': {
      'en': 'New Password',
      'fr': '',
    },
    'kejiuafa': {
      'en': 'Enter your new password here',
      'fr': '',
    },
    'bvhnfvgy': {
      'en': 'Change Password',
      'fr': '',
    },
    'ypjuwh91': {
      'en': 'Field is required',
      'fr': '',
    },
    'es03we03': {
      'en': 'Field is required',
      'fr': '',
    },
    '3azr7xbe': {
      'en': 'Field is required',
      'fr': '',
    },
    'pqjwljkw': {
      'en': 'Home',
      'fr': '',
    },
  },
  // FAQS
  {
    '0ebk7why': {
      'en': 'FAQS',
      'fr': '',
    },
    'fq3im42f': {
      'en': 'Frequently Asked Questions',
      'fr': '',
    },
    '2kjpj2qq': {
      'en': 'Can I book more than one room?',
      'fr': '',
    },
    'aue10rsx': {
      'en': 'You can book up to three rooms in one hostel',
      'fr': '',
    },
    'js27u7bh': {
      'en': 'How can I communicate with the owners?',
      'fr': '',
    },
    'mfaedg7y': {
      'en':
          'Our policy does not allow you to directly communicate with the owners but you can use the discussion section to chat with admins if you have any worry.',
      'fr': '',
    },
    '5mnz1kuy': {
      'en': 'How long does it take to verify my booking?',
      'fr': '',
    },
    'yzeyazml': {
      'en':
          'Our team works 24/7 to make sure  that your bookings are verified in as little time as possible. Generally a few hours depending on the location of the hostel.',
      'fr': '',
    },
    '2fh8dfod': {
      'en': 'How am I notified when it is approved?',
      'fr': '',
    },
    'mkbmof85': {
      'en':
          'We will send you a notification on the CiteFinder app and also we will notify you through email and sms if possible.',
      'fr': '',
    },
    'm2279jxc': {
      'en': 'Home',
      'fr': '',
    },
  },
  // BookingDetails
  {
    'f1nhtkiv': {
      'en': 'Page Title',
      'fr': '',
    },
    'eji37vio': {
      'en': 'Home',
      'fr': '',
    },
  },
  // HostelDetails
  {
    'tjxjj2xr': {
      'en': 'Home',
      'fr': '',
    },
  },
  // ChatDetails
  {
    'd5twpqgm': {
      'en': 'Group Chat',
      'fr': '',
    },
  },
  // AllChatsPage
  {
    '8qmmnfuy': {
      'en': 'All Chats',
      'fr': '',
    },
  },
  // CiteFinderText
  {
    'fn149fso': {
      'en': 'Cité',
      'fr': '',
    },
    'zwx4lbu2': {
      'en': 'Finder',
      'fr': '',
    },
  },
  // AppDrawer
  {
    'dtg7b0z4': {
      'en': 'Profile',
      'fr': '',
    },
    '0lex3m74': {
      'en': 'Privacy Policy',
      'fr': '',
    },
    'thu32t8z': {
      'en': 'FAQS',
      'fr': '',
    },
    'vaty1an4': {
      'en': 'Contact Us',
      'fr': '',
    },
    'rko25owb': {
      'en': 'Terms and Conditions',
      'fr': '',
    },
    'mesokwac': {
      'en': 'Appearance',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    '4utr4mu9': {
      'en': '',
      'fr': '',
    },
    'njdpqkjz': {
      'en': '',
      'fr': '',
    },
    'nou5tleg': {
      'en': '',
      'fr': '',
    },
    '8trv3hlz': {
      'en': '',
      'fr': '',
    },
    'n1nohy3z': {
      'en': '',
      'fr': '',
    },
    '9q9irkuj': {
      'en': '',
      'fr': '',
    },
    '8h65dvb7': {
      'en': '',
      'fr': '',
    },
    'wgjr1nx8': {
      'en': '',
      'fr': '',
    },
    'yhgxmml7': {
      'en': '',
      'fr': '',
    },
    '5k8ujw21': {
      'en': '',
      'fr': '',
    },
    'u5d2eqak': {
      'en': '',
      'fr': '',
    },
    'xjtgjy5m': {
      'en': '',
      'fr': '',
    },
    'tazilnhg': {
      'en': '',
      'fr': '',
    },
    'd6zmr0bw': {
      'en': '',
      'fr': '',
    },
    't7rye4u4': {
      'en': '',
      'fr': '',
    },
    'xtvxwlvv': {
      'en': '',
      'fr': '',
    },
    'er16mkfu': {
      'en': '',
      'fr': '',
    },
    'm5t1d69a': {
      'en': '',
      'fr': '',
    },
    'eefcd1ly': {
      'en': '',
      'fr': '',
    },
    'tb9ukd53': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
