import 'dart:js/js_wasm.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  addEmployeeDetails(Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .set(employeeInfoMap);
  }
}
