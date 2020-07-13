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
    return Intl.message("test app", name: 'title', desc: "msg for demo");
  }

  String get Increment {
    return Intl.message("Increment", name: 'Increment', desc: "test Increment");
  }

  String remainingEmailsMessage(int howMany) {
    return Intl.plural(howMany,
        zero: 'There are no emails left',
        one: 'There is $howMany email left',
        other: 'There are $howMany emails left',
        name: 'remainingEmailsMessage',
        args: [howMany],
        desc: 'How many emails remain after archiving',
        examples: const {'howMany': 42, 'userName': 'Fred'});
  }
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
    throw false;
  }
}
