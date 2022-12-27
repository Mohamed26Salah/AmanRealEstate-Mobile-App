import 'package:cloud_firestore/cloud_firestore.dart';

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final int y;
}
