// To parse this JSON data, do
//
//     final jobsModel = jobsModelFromJson(jsonString);

import 'dart:convert';

JobsModel jobsModelFromJson(String str) => JobsModel.fromJson(json.decode(str));

String jobsModelToJson(JobsModel data) => json.encode(data.toJson());

class JobsModel {
    JobsModel({
        this.success,
        this.jobs,
    });

    bool? success;
    List<Job>? jobs;

    factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
        success: json["success"] == null ? null : json["success"],
        jobs: json["jobs"] == null ? null : List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "jobs": jobs == null ? null : List<dynamic>.from(jobs!.map((x) => x.toJson())),
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
