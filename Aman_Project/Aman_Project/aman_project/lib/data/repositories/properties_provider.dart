import 'package:aman_project/models/property.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Search
final searchInputProivder = StateProvider<String>((ref) {
  return "";
});

final whishlistProvider = StateProvider<List<Property>>((ref) {
  return [Property.alternate()];
});

final filterPriceProivder = StateProvider<String>((ref) {
  return "";
});
final filterTypeProivder = StateProvider<String>((ref) {
  return "";
});
final filterRoomProivder = StateProvider<String>((ref) {
  return "";
});
final filterBathroomProivder = StateProvider<String>((ref) {
  return "";
});
//MainPage
final resultsCountProperty = StateProvider<int>((ref) {
  return 0;
});

final getPropertyData = StreamProvider.autoDispose((ref) {
  return FirebaseFirestore.instance.collection('properties').snapshots();
});
final getUserPropertyData = StreamProvider.autoDispose((ref) {
  return FirebaseFirestore.instance
      .collection('properties')
      .where("visible", isEqualTo: "Yes")
      .snapshots();
});
final searchedProperty = StreamProvider.autoDispose((ref) {
  return FirebaseFirestore.instance
      .collection('properties')
      .where("unitName",
          isGreaterThanOrEqualTo: ref.watch(searchInputProivder).toLowerCase())
      .snapshots();
});
final filteredProperty = StreamProvider.autoDispose((ref) {
  // ref.read(searchInputProivder.notifier).state = "";
  Query query = FirebaseFirestore.instance.collection('properties');
  if (ref.watch(filterTypeProivder) != "") {
    query = query.where("type", isEqualTo: ref.watch(filterTypeProivder));
  }
  if (ref.watch(filterRoomProivder) != "") {
    query = query.where("noRooms", isEqualTo: ref.watch(filterRoomProivder));
  }
  if (ref.watch(filterBathroomProivder) != "") {
    query = query.where("noBathrooms",
        isEqualTo: ref.watch(filterBathroomProivder));
  }
  // if (ref.watch(searchInputProivder) != "") {
  //   query = query.where("unitName",
  //       isEqualTo: ref.watch(searchInputProivder).toLowerCase());
  // }
  if (ref.watch(filterPriceProivder) != "") {
    if (ref.watch(filterPriceProivder) == "LTH") {
      query = query.orderBy("price", descending: false);
    } else {
      query = query.orderBy("price", descending: true);
    }
  }

  return query.snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>;
});
clearProivders(WidgetRef ref) {
  // ref.read(searchInputProivder.notifier).state = "";
  ref.read(filterTypeProivder.notifier).state = "";
  ref.read(filterRoomProivder.notifier).state = "";
  ref.read(filterBathroomProivder.notifier).state = "";
  ref.read(filterPriceProivder.notifier).state = "";
}
