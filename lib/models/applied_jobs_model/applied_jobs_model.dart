// To parse this JSON data, do
//
//     final appliedJobsModel = appliedJobsModelFromJson(jsonString);

import 'dart:convert';

AppliedJobsModel appliedJobsModelFromJson(String str) => AppliedJobsModel.fromJson(json.decode(str));

String appliedJobsModelToJson(AppliedJobsModel data) => json.encode(data.toJson());

class AppliedJobsModel {
    AppliedJobsModel({
        this.success,
        this.applications,
    });

    bool? success;
    List<Application>? applications;

    factory AppliedJobsModel.fromJson(Map<String, dynamic> json) => AppliedJobsModel(
        success: json["success"] == null ? null : json["success"],
        applications: json["applications"] == null ? null : List<Application>.from(json["applications"].map((x) => Application.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "applications": applications == null ? null : List<dynamic>.from(applications!.map((x) => x.toJson())),
    };
}

class Application {
    Application({
        this.job,
        this.user,
    });

    Job? job;
    User? user;

    factory Application.fromJson(Map<String, dynamic> json) => Application(
        job: json["job"] == null ? null : Job.fromJson(json["job"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "job": job == null ? null : job!.toJson(),
        "user": user == null ? null : user!.toJson(),
    };
}

class Job {
    Job({
        this.id,
        this.organisationId,
        this.name,
        this.type,
        this.expertisesId,
        this.description,
        this.tasks,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    int? organisationId;
    String? name;
    String? type;
    int? expertisesId;
    String? description;
    String? tasks;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"] == null ? null : json["id"],
        organisationId: json["organisation_id"] == null ? null : json["organisation_id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        expertisesId: json["expertises_id"] == null ? null : json["expertises_id"],
        description: json["description"] == null ? null : json["description"],
        tasks: json["tasks"] == null ? null : json["tasks"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "organisation_id": organisationId == null ? null : organisationId,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "expertises_id": expertisesId == null ? null : expertisesId,
        "description": description == null ? null : description,
        "tasks": tasks == null ? null : tasks,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.expertiesId,
        this.cvFile,
        this.expertise,
    });

    int? id;
    String? name;
    String? email;
    dynamic emailVerifiedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? expertiesId;
    CvFile? cvFile;
    dynamic expertise;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        expertiesId: json["experties_id"] == null ? null : json["experties_id"],
        cvFile: json["cv_file"] == null ? null : CvFile.fromJson(json["cv_file"]),
        expertise: json["expertise"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "experties_id": expertiesId == null ? null : expertiesId,
        "cv_file": cvFile == null ? null : cvFile!.toJson(),
        "expertise": expertise,
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
