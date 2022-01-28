import 'package:grocery_template/_shared/utils/firebase_utils.dart';
import 'package:intl/intl.dart';

extension SharedDateUtils on DateTime {
  // static final DateFormat server = DateFormat.yMd();
  static final DateFormat server = DateFormat("MM/dd/yyyy");
  static final DateFormat general = DateFormat("dd/MM/yyyy");
  static final DateFormat generalDateTime = DateFormat('dd/MM/yyyy HH:mm');
  static final DateFormat generalTime = DateFormat('HH:mm');
  static final DateFormat generalTimeWithSeconds = DateFormat('HH:mm:ss');

  String get generalDisplayDate => general.format(this);

  String get serverDate => server.format(this);

  String get generalDisplayDateTime => generalDateTime.format(this);

  String get generalDisplayTime => generalTime.format(this);

  String get generalDisplayTimeWithSeconds => generalTimeWithSeconds.format(this);

  get serverTimeStamp => this.fbTimeStamp;
}

extension StringDateUtils on String {
  DateTime get asGeneralDisplayDate => SharedDateUtils.general.parse(this);

  DateTime get asServerDate => SharedDateUtils.server.parse(this);

  DateTime get asGeneralDisplayTime => SharedDateUtils.generalTime.parse(this);

  String? get serverToGeneralDisplayDate =>
      this.asServerDate.generalDisplayDate;
}
