import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast(String message) {
  return Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.TOP,
    fontSize: 18.0,
  );
}
