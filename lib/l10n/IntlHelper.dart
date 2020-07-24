import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:testflutter/l10n/messages_all.dart';

//flutter pub pub run intl_translation:extract_to_arb --output-dir=l10n-arb \ lib/l10n/IntlHelper.dart
//flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/IntlHelper.dart l10n-arb/intl_*.arb

class IntlLocalizations {
  static Future<IntlLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localName = Intl.canonicalizedLocale(name);

    return initializeMessages(localName).then((value) {
      Intl.defaultLocale = localName;
      return IntlLocalizations();
    });
  }

  static IntlLocalizations of(BuildContext context) {
    return Localizations.of<IntlLocalizations>(context, IntlLocalizations);
  }

  String get title {
    return Intl.message("应用标题", name: 'title', desc: "msg for demo");
  }

  greetingMessage(name) => Intl.message(
      'Hello $name!',
      name: 'greetingMessage',
      args: [name],
      desc: 'Greet the user as they first open the application',
      examples: const {'name': 'Emily'});

  remainingEmailsMessage(int howMany, String userName) =>
      Intl.plural(
          howMany,
          zero: 'There are no emails left for $userName.',
          one: 'There is $howMany email left for $userName.',
          other: 'There are $howMany emails left for $userName.',
          name: 'remainingEmailsMessage',
          args: [howMany, userName],
          desc: 'How many emails remain after archiving.',
          examples: const {'howMany': 42, 'userName': 'Fred'});

  notOnlineMessage(String userName, String userGender) =>
      Intl.gender(
          userGender,
          male: '$userName is unavailable because he is not online.',
          female: '$userName is unavailable because she is not online.',
          other: '$userName is unavailable because they are not online',
          name: 'notOnlineMessage',
          args: [userName, userGender],
          desc: 'The user is not available to hangout.',
          examples: const {'userGender': 'male', 'userName': 'Fred'});
}

class IntlLocalizationsDelegate
    extends LocalizationsDelegate<IntlLocalizations> {
  const IntlLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en', 'zh', 'en_US'].contains(locale.languageCode);
  }

  @override
  Future<IntlLocalizations> load(Locale locale) {
    // TODO: implement load
    return IntlLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<IntlLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}
