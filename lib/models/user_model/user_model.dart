// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.data,
    });

    Data? data;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.name,
        this.email,
        this.cvFile,
        this.expertise,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? email;
    CvFile? cvFile;
    Expertise? expertise;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        cvFile: json["cv_file"] == null ? null : CvFile.fromJson(json["cv_file"]),
        expertise: json["expertise"] == null ? null : Expertise.fromJson(json["expertise"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "cv_file": cvFile == null ? null : cvFile!.toJson(),
        "expertise": expertise == null ? null : expertise!.toJson(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}

class CvFile {
    CvFile({
        this.id,
        this.userId,
        this.filePath,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    int? userId;
    String? filePath;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory CvFile.fromJson(Map<String, dynamic> json) => CvFile(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        filePath: json["file_path"] == null ? null : json["file_path"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "file_path": filePath == null ? null : filePath,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}

class Expertise {
    Expertise({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Expertise.fromJson(Map<String, dynamic> json) => Expertise(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}
