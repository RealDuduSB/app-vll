import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  final service = FirebaseFirestore.instance.collection('services');

  Stream<QuerySnapshot> get carsStream => service.snapshots();
}
