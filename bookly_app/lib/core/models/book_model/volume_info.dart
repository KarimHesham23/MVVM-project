import 'package:equatable/equatable.dart';

import 'image_links.dart';
import 'reading_modes.dart';

class VolumeInfo extends Equatable {
  final String? title;
  final String? publishedDate;
  final String? description;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final num? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final ImageLinks imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;
  final List<dynamic>? authors;
  final List<dynamic>? categories;

  const VolumeInfo(
      {this.title,
      this.publishedDate,
      this.description,
      this.readingModes,
      this.pageCount,
      this.printType,
      this.averageRating,
      this.ratingsCount,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      required this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink,
      this.authors,
      this.categories});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'] as String?,
        publishedDate: json['publishedDate'] as String?,
        description: json['description'] as String?,
        readingModes: json['readingModes'] == null
            ? null
            : ReadingModes.fromJson(
                json['readingModes'] as Map<String, dynamic>),
        pageCount: json['pageCount'] as int?,
        printType: json['printType'] as String?,
        averageRating: json['averageRating'],
        ratingsCount: json['ratingsCount'] as int?,
        maturityRating: json['maturityRating'] as String?,
        allowAnonLogging: json['allowAnonLogging'] as bool?,
        contentVersion: json['contentVersion'] as String?,
        imageLinks:
            ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
        language: json['language'] as String?,
        previewLink: json['previewLink'] as String?,
        infoLink: json['infoLink'] as String?,
        canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
        authors: json["authors"],
        categories: json["categories"],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'publishedDate': publishedDate,
        'description': description,
        'readingModes': readingModes?.toJson(),
        'pageCount': pageCount,
        'printType': printType,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        'maturityRating': maturityRating,
        'allowAnonLogging': allowAnonLogging,
        'contentVersion': contentVersion,
        'imageLinks': imageLinks.toJson(),
        'language': language,
        'previewLink': previewLink,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink,
        "authors": authors,
        "categories": categories
      };

  @override
  List<Object?> get props {
    return [
      title,
      publishedDate,
      description,
      readingModes,
      pageCount,
      printType,
      averageRating,
      ratingsCount,
      maturityRating,
      allowAnonLogging,
      contentVersion,
      imageLinks,
      language,
      previewLink,
      infoLink,
      canonicalVolumeLink,
      authors,
      categories
    ];
  }
}
