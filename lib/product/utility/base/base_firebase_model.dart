import 'package:cloud_firestore/cloud_firestore.dart';

/// IdModel
mixin IdModel {
  /// Returns the id of the model.
  String? get id;
}

/// BaseFireBaseModel
mixin BaseFireBaseModel<T extends IdModel> {
  /// Converts the [DocumentSnapshot] instance to a [T] instance.
  T fromJson(Map<String, dynamic> json);

  /// Converts the [DocumentSnapshot] instance to a [T] instance.
  T? fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      return null;
    }
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}
