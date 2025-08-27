import 'package:easy_localization/easy_localization.dart' as vi;

extension StringNonNullExt on String {
  String translate() {
    return vi.tr(this);
  }
}
