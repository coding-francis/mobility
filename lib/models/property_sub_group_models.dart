import 'package:pmc_main/models/property_model.dart';

class IndustrialPropertyModel extends PropertyModel {
  final String zoningType;
  final String industrialPropertyType;
  final double ceilingHeight;
  final int loadingDocks;
  final String powerSupply;
  final double craneCapacity;
  final double officeSpaceSquareFootage;
  final bool hasFireSprinklers;

  IndustrialPropertyModel({
    required super.propertyType,
    required super.id,
    required super.ownerId,
    required super.listedUserId,
    required super.address,
    required super.propertyCode,
    required super.propertyName,
    required super.description,
    required super.status,
    required super.featured,
    required super.amenityIds,
    required super.images,
    required super.price,
    required this.zoningType,
    required this.industrialPropertyType,
    required this.ceilingHeight,
    required this.loadingDocks,
    required this.powerSupply,
    required this.craneCapacity,
    required this.officeSpaceSquareFootage,
    required this.hasFireSprinklers,
  });

  factory IndustrialPropertyModel.fromJson(Map<String, dynamic> json) {
    return IndustrialPropertyModel(
      propertyType: json['propertyType'],
      id: json['id'],
      ownerId: json['ownerId'],
      listedUserId: json['listedUserId'],
      address: Address.fromJson(json['address']),
      propertyCode: json['propertyCode'],
      propertyName: json['propertyName'],
      description: json['description'],
      status: json['status'],
      featured: json['featured'],
      amenityIds: List<int>.from(json['amenityIds']),
      images: List<String>.from(json['images']),
      price: json['price'],
      zoningType: json['zoningType'],
      industrialPropertyType: json['industrialPropertyType'],
      ceilingHeight: json['ceilingHeight'],
      loadingDocks: json['loadingDocks'],
      powerSupply: json['powerSupply'],
      craneCapacity: json['craneCapacity'],
      officeSpaceSquareFootage: json['officeSpaceSquareFootage'],
      hasFireSprinklers: json['hasFireSprinklers'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({
      'zoningType': zoningType,
      'industrialPropertyType': industrialPropertyType,
      'ceilingHeight': ceilingHeight,
      'loadingDocks': loadingDocks,
      'powerSupply': powerSupply,
      'craneCapacity': craneCapacity,
      'officeSpaceSquareFootage': officeSpaceSquareFootage,
      'hasFireSprinklers': hasFireSprinklers,
    });
    return json;
  }
}

class ResidentialPropertyModel extends PropertyModel {
  final String residentialPropertyType;
  final int bedrooms;
  final double bathrooms;
  final int kitchen;
  final int livingRoom;
  final int diningRoom;
  final int balcony;
  final int floor;
  final int totalFloors;
  final double pricePerSquareFoot;
  final bool hasGarage;
  final bool hasPool;
  final bool hasFireplace;
  final bool hasBackyard;
  final bool hasBasement;
  final bool hasAttic;
  final bool hasHeating;
  final bool hasCooling;

  ResidentialPropertyModel({
    required super.propertyType,
    required super.id,
    required super.ownerId,
    required super.listedUserId,
    required super.address,
    required super.propertyCode,
    required super.propertyName,
    required super.description,
    required super.status,
    required super.featured,
    required super.amenityIds,
    required super.images,
    required super.price,
    required this.residentialPropertyType,
    required this.bedrooms,
    required this.bathrooms,
    required this.kitchen,
    required this.livingRoom,
    required this.diningRoom,
    required this.balcony,
    required this.floor,
    required this.totalFloors,
    required this.pricePerSquareFoot,
    required this.hasGarage,
    required this.hasPool,
    required this.hasFireplace,
    required this.hasBackyard,
    required this.hasBasement,
    required this.hasAttic,
    required this.hasHeating,
    required this.hasCooling,
  });

  factory ResidentialPropertyModel.fromJson(Map<String, dynamic> json) {
    return ResidentialPropertyModel(
      propertyType: json['propertyType'],
      id: json['id'],
      ownerId: json['ownerId'],
      listedUserId: json['listedUserId'],
      address: Address.fromJson(json['address']),
      propertyCode: json['propertyCode'],
      propertyName: json['propertyName'],
      description: json['description'],
      status: json['status'],
      featured: json['featured'],
      amenityIds: List<int>.from(json['amenityIds']),
      images: List<String>.from(json['images']),
      price: json['price'],
      residentialPropertyType: json['residentialPropertyType'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      kitchen: json['kitchen'],
      livingRoom: json['livingRoom'],
      diningRoom: json['diningRoom'],
      balcony: json['balcony'],
      floor: json['floor'],
      totalFloors: json['totalFloors'],
      pricePerSquareFoot: json['pricePerSquareFoot'],
      hasGarage: json['hasGarage'],
      hasPool: json['hasPool'],
      hasFireplace: json['hasFireplace'],
      hasBackyard: json['hasBackyard'],
      hasBasement: json['hasBasement'],
      hasAttic: json['hasAttic'],
      hasHeating: json['hasHeating'],
      hasCooling: json['hasCooling'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({
      'residentialPropertyType': residentialPropertyType,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'kitchen': kitchen,
      'livingRoom': livingRoom,
      'diningRoom': diningRoom,
      'balcony': balcony,
      'floor': floor,
      'totalFloors': totalFloors,
      'pricePerSquareFoot': pricePerSquareFoot,
      'hasGarage': hasGarage,
      'hasPool': hasPool,
      'hasFireplace': hasFireplace,
      'hasBackyard': hasBackyard,
      'hasBasement': hasBasement,
      'hasAttic': hasAttic,
      'hasHeating': hasHeating,
      'hasCooling': hasCooling,
    });
    return json;
  }
}

class LandPropertyModel extends PropertyModel {
  final String zoningType;
  final String landPropertyType;
  final double area;
  final String permittedUse;
  final String terrainType;
  final String soilType;
  final bool hasWaterAccess;
  final bool hasElectricityAccess;
  final bool hasSewageAccess;
  final bool hasRoadAccess;
  final bool isSubdivided;
  final bool isCornerLot;

  LandPropertyModel({
    required super.propertyType,
    required super.id,
    required super.ownerId,
    required super.listedUserId,
    required super.address,
    required super.propertyCode,
    required super.propertyName,
    required super.description,
    required super.status,
    required super.featured,
    required super.amenityIds,
    required super.images,
    required super.price,
    required this.zoningType,
    required this.landPropertyType,
    required this.area,
    required this.permittedUse,
    required this.terrainType,
    required this.soilType,
    required this.hasWaterAccess,
    required this.hasElectricityAccess,
    required this.hasSewageAccess,
    required this.hasRoadAccess,
    required this.isSubdivided,
    required this.isCornerLot,
  });

  factory LandPropertyModel.fromJson(Map<String, dynamic> json) {
    return LandPropertyModel(
      propertyType: json['propertyType'],
      id: json['id'],
      ownerId: json['ownerId'],
      listedUserId: json['listedUserId'],
      address: Address.fromJson(json['address']),
      propertyCode: json['propertyCode'],
      propertyName: json['propertyName'],
      description: json['description'],
      status: json['status'],
      featured: json['featured'],
      amenityIds: List<int>.from(json['amenityIds']),
      images: List<String>.from(json['images']),
      price: json['price'],
      zoningType: json['zoningType'],
      landPropertyType: json['landPropertyType'],
      area: json['area'],
      permittedUse: json['permittedUse'],
      terrainType: json['terrainType'],
      soilType: json['soilType'],
      hasWaterAccess: json['hasWaterAccess'],
      hasElectricityAccess: json['hasElectricityAccess'],
      hasSewageAccess: json['hasSewageAccess'],
      hasRoadAccess: json['hasRoadAccess'],
      isSubdivided: json['isSubdivided'],
      isCornerLot: json['isCornerLot'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({
      'zoningType': zoningType,
      'landPropertyType': landPropertyType,
      'area': area,
      'permittedUse': permittedUse,
      'terrainType': terrainType,
      'soilType': soilType,
      'hasWaterAccess': hasWaterAccess,
      'hasElectricityAccess': hasElectricityAccess,
      'hasSewageAccess': hasSewageAccess,
      'hasRoadAccess': hasRoadAccess,
      'isSubdivided': isSubdivided,
      'isCornerLot': isCornerLot,
    });
    return json;
  }
}

class CommercialPropertyModel extends PropertyModel {
  final double squareFootage;
  final int parkingSpaces;
  final bool hasHVACSystem;
  final bool hasSecuritySystem;
  final String commercialPropertyType;
  final int totalUnits;
  final int availableUnits;
  final String currency;
  final int yearBuilt;
  final bool hasElevator;
  final bool hasLoadingDock;
  final bool hasReception;
  final bool hasKitchen;
  final bool hasConferenceRoom;
  final bool hasFireSafetySystem;

  CommercialPropertyModel({
    required super.propertyType,
    required super.id,
    required super.ownerId,
    required super.listedUserId,
    required super.address,
    required super.propertyCode,
    required super.propertyName,
    required super.description,
    required super.status,
    required super.featured,
    required super.amenityIds,
    required super.images,
    required super.price,
    required this.squareFootage,
    required this.parkingSpaces,
    required this.hasHVACSystem,
    required this.hasSecuritySystem,
    required this.commercialPropertyType,
    required this.totalUnits,
    required this.availableUnits,
    required this.currency,
    required this.yearBuilt,
    required this.hasElevator,
    required this.hasLoadingDock,
    required this.hasReception,
    required this.hasKitchen,
    required this.hasConferenceRoom,
    required this.hasFireSafetySystem,
  });

  factory CommercialPropertyModel.fromJson(Map<String, dynamic> json) {
    return CommercialPropertyModel(
      propertyType: json['propertyType'],
      id: json['id'],
      ownerId: json['ownerId'],
      listedUserId: json['listedUserId'],
      address: Address.fromJson(json['address']),
      propertyCode: json['propertyCode'],
      propertyName: json['propertyName'],
      description: json['description'],
      status: json['status'],
      featured: json['featured'],
      amenityIds: List<int>.from(json['amenityIds']),
      images: List<String>.from(json['images']),
      price: json['price'],
      squareFootage: json['squareFootage'],
      parkingSpaces: json['parkingSpaces'],
      hasHVACSystem: json['hasHVACSystem'],
      hasSecuritySystem: json['hasSecuritySystem'],
      commercialPropertyType: json['commercialPropertyType'],
      totalUnits: json['totalUnits'],
      availableUnits: json['availableUnits'],
      currency: json['currency'],
      yearBuilt: json['yearBuilt'],
      hasElevator: json['hasElevator'],
      hasLoadingDock: json['hasLoadingDock'],
      hasReception: json['hasReception'],
      hasKitchen: json['hasKitchen'],
      hasConferenceRoom: json['hasConferenceRoom'],
      hasFireSafetySystem: json['hasFireSafetySystem'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({
      'squareFootage': squareFootage,
      'parkingSpaces': parkingSpaces,
      'hasHVACSystem': hasHVACSystem,
      'hasSecuritySystem': hasSecuritySystem,
      'commercialPropertyType': commercialPropertyType,
      'totalUnits': totalUnits,
      'availableUnits': availableUnits,
      'currency': currency,
      'yearBuilt': yearBuilt,
      'hasElevator': hasElevator,
      'hasLoadingDock': hasLoadingDock,
      'hasReception': hasReception,
      'hasKitchen': hasKitchen,
      'hasConferenceRoom': hasConferenceRoom,
      'hasFireSafetySystem': hasFireSafetySystem,
    });
    return json;
  }
}

class SpecialPurposePropertyModel extends PropertyModel {
  final String zoningType;
  final String specialPurposePropertyType;
  final String seatingType;
  final int seatingCapacity;
  final int numberOfRooms;
  final bool hasKitchenFacilities;
  final bool hasAudioVisualEquipment;
  final bool hasParkingFacilities;
  final bool hasHandicapAccess;
  final bool hasBackupPower;
  final String operatingHours;
  final List<String> emergencySystems;

  SpecialPurposePropertyModel({
    required super.propertyType,
    required super.id,
    required super.ownerId,
    required super.listedUserId,
    required super.address,
    required super.propertyCode,
    required super.propertyName,
    required super.description,
    required super.status,
    required super.featured,
    required super.amenityIds,
    required super.images,
    required super.price,
    required this.zoningType,
    required this.specialPurposePropertyType,
    required this.seatingType,
    required this.seatingCapacity,
    required this.numberOfRooms,
    required this.hasKitchenFacilities,
    required this.hasAudioVisualEquipment,
    required this.hasParkingFacilities,
    required this.hasHandicapAccess,
    required this.hasBackupPower,
    required this.operatingHours,
    required this.emergencySystems,
  });

  factory SpecialPurposePropertyModel.fromJson(Map<String, dynamic> json) {
    return SpecialPurposePropertyModel(
      propertyType: json['propertyType'],
      id: json['id'],
      ownerId: json['ownerId'],
      listedUserId: json['listedUserId'],
      address: Address.fromJson(json['address']),
      propertyCode: json['propertyCode'],
      propertyName: json['propertyName'],
      description: json['description'],
      status: json['status'],
      featured: json['featured'],
      amenityIds: List<int>.from(json['amenityIds']),
      images: List<String>.from(json['images']),
      price: json['price'],
      zoningType: json['zoningType'],
      specialPurposePropertyType: json['specialPurposePropertyType'],
      seatingType: json['seatingType'],
      seatingCapacity: json['seatingCapacity'],
      numberOfRooms: json['numberOfRooms'],
      hasKitchenFacilities: json['hasKitchenFacilities'],
      hasAudioVisualEquipment: json['hasAudioVisualEquipment'],
      hasParkingFacilities: json['hasParkingFacilities'],
      hasHandicapAccess: json['hasHandicapAccess'],
      hasBackupPower: json['hasBackupPower'],
      operatingHours: json['operatingHours'],
      emergencySystems: List<String>.from(json['emergencySystems']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({
      'zoningType': zoningType,
      'specialPurposePropertyType': specialPurposePropertyType,
      'seatingType': seatingType,
      'seatingCapacity': seatingCapacity,
      'numberOfRooms': numberOfRooms,
      'hasKitchenFacilities': hasKitchenFacilities,
      'hasAudioVisualEquipment': hasAudioVisualEquipment,
      'hasParkingFacilities': hasParkingFacilities,
      'hasHandicapAccess': hasHandicapAccess,
      'hasBackupPower': hasBackupPower,
      'operatingHours': operatingHours,
      'emergencySystems': emergencySystems,
    });
    return json;
  }
}
