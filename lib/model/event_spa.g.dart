// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_spa.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventSpaAdapter extends TypeAdapter<EventSpa> {
  @override
  final int typeId = 0;

  @override
  EventSpa read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventSpa(
      latitude: fields[0] as String?,
      longitude: fields[1] as String?,
      libraryVersion: fields[2] as String?,
      ipAddress: fields[3] as String?,
      userId: fields[6] as String?,
      sessionId: fields[7] as String?,
      counterId: fields[8] as String?,
      appScreen: fields[4] as String?,
      appVersion: fields[5] as String?,
      eventType: fields[9] as String?,
      deviceId: fields[10] as String?,
      appName: fields[11] as String?,
      deviceName: fields[12] as String?,
      osVersion: fields[13] as String?,
      osName: fields[14] as String?,
      platform: fields[15] as String?,
      language: fields[16] as String?,
      resolutionWidth: fields[17] as String?,
      resolutionHeight: fields[18] as String?,
      customParam: (fields[19] as Map?)?.cast<String, dynamic>(),
      id: fields[21] as String?,
      uriSand: fields[22] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EventSpa obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.libraryVersion)
      ..writeByte(3)
      ..write(obj.ipAddress)
      ..writeByte(4)
      ..write(obj.appScreen)
      ..writeByte(5)
      ..write(obj.appVersion)
      ..writeByte(6)
      ..write(obj.userId)
      ..writeByte(7)
      ..write(obj.sessionId)
      ..writeByte(8)
      ..write(obj.counterId)
      ..writeByte(9)
      ..write(obj.eventType)
      ..writeByte(10)
      ..write(obj.deviceId)
      ..writeByte(11)
      ..write(obj.appName)
      ..writeByte(12)
      ..write(obj.deviceName)
      ..writeByte(13)
      ..write(obj.osVersion)
      ..writeByte(14)
      ..write(obj.osName)
      ..writeByte(15)
      ..write(obj.platform)
      ..writeByte(16)
      ..write(obj.language)
      ..writeByte(17)
      ..write(obj.resolutionWidth)
      ..writeByte(18)
      ..write(obj.resolutionHeight)
      ..writeByte(19)
      ..write(obj.customParam)
      ..writeByte(21)
      ..write(obj.id)
      ..writeByte(22)
      ..write(obj.uriSand);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventSpaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
