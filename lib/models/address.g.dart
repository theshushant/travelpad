// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address()
    ..address1 = json['subThoroughfare'] as String
    ..address2 = json['thoroughfare'] as String
    ..region = json['subLocality'] as String
    ..city = json['locality'] as String
    ..district = json['subAdministrativeArea'] as String
    ..state = json['administrativeArea'] as String
    ..postalCode = json['postalCode'] as String
    ..country = json['country'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..latitude = (json['latitude'] as num)?.toDouble()
    ..longitude = (json['longitude'] as num)?.toDouble();
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'subThoroughfare': instance.address1,
      'thoroughfare': instance.address2,
      'subLocality': instance.region,
      'locality': instance.city,
      'subAdministrativeArea': instance.district,
      'administrativeArea': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'phoneNumber': instance.phoneNumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Address on _Address, Store {
  Computed<String> _$addressStringComputed;

  @override
  String get addressString =>
      (_$addressStringComputed ??= Computed<String>(() => super.addressString,
              name: '_Address.addressString'))
          .value;

  final _$address1Atom = Atom(name: '_Address.address1');

  @override
  String get address1 {
    _$address1Atom.reportRead();
    return super.address1;
  }

  @override
  set address1(String value) {
    _$address1Atom.reportWrite(value, super.address1, () {
      super.address1 = value;
    });
  }

  final _$address2Atom = Atom(name: '_Address.address2');

  @override
  String get address2 {
    _$address2Atom.reportRead();
    return super.address2;
  }

  @override
  set address2(String value) {
    _$address2Atom.reportWrite(value, super.address2, () {
      super.address2 = value;
    });
  }

  final _$regionAtom = Atom(name: '_Address.region');

  @override
  String get region {
    _$regionAtom.reportRead();
    return super.region;
  }

  @override
  set region(String value) {
    _$regionAtom.reportWrite(value, super.region, () {
      super.region = value;
    });
  }

  final _$cityAtom = Atom(name: '_Address.city');

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$districtAtom = Atom(name: '_Address.district');

  @override
  String get district {
    _$districtAtom.reportRead();
    return super.district;
  }

  @override
  set district(String value) {
    _$districtAtom.reportWrite(value, super.district, () {
      super.district = value;
    });
  }

  final _$stateAtom = Atom(name: '_Address.state');

  @override
  String get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$postalCodeAtom = Atom(name: '_Address.postalCode');

  @override
  String get postalCode {
    _$postalCodeAtom.reportRead();
    return super.postalCode;
  }

  @override
  set postalCode(String value) {
    _$postalCodeAtom.reportWrite(value, super.postalCode, () {
      super.postalCode = value;
    });
  }

  final _$countryAtom = Atom(name: '_Address.country');

  @override
  String get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(String value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_Address.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$latitudeAtom = Atom(name: '_Address.latitude');

  @override
  double get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(double value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  final _$longitudeAtom = Atom(name: '_Address.longitude');

  @override
  double get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(double value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  @override
  String toString() {
    return '''
address1: ${address1},
address2: ${address2},
region: ${region},
city: ${city},
district: ${district},
state: ${state},
postalCode: ${postalCode},
country: ${country},
phoneNumber: ${phoneNumber},
latitude: ${latitude},
longitude: ${longitude},
addressString: ${addressString}
    ''';
  }
}
