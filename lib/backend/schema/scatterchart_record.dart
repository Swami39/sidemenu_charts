import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'scatterchart_record.g.dart';

abstract class ScatterchartRecord
    implements Built<ScatterchartRecord, ScatterchartRecordBuilder> {
  static Serializer<ScatterchartRecord> get serializer =>
      _$scatterchartRecordSerializer;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ScatterchartRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scatterchart');

  static Stream<ScatterchartRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ScatterchartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ScatterchartRecord._();
  factory ScatterchartRecord(
          [void Function(ScatterchartRecordBuilder) updates]) =
      _$ScatterchartRecord;

  static ScatterchartRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createScatterchartRecordData() => serializers.toFirestore(
    ScatterchartRecord.serializer, ScatterchartRecord((s) => s));
