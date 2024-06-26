import 'package:json_annotation/json_annotation.dart';

part 'top_stories.g.dart';

@JsonSerializable()
class TopStories {
  String? status;
  String? copyright;
  String? section;
  String? lastUpdated;
  int? numResults;
  List<Results>? results;

  TopStories(
      {this.status,
      this.copyright,
      this.section,
      this.lastUpdated,
      this.numResults,
      this.results});

  factory TopStories.fromJson(Map<String, dynamic> json) =>
      _$ArtsFromJson(json);
  Map<String, dynamic> toJson() => _$ArtsToJson(this);
}

@JsonSerializable()
class Results {
  String? section;
  String? subsection;
  String? title;
  String? abstract;
  String? url;
  String? uri;
  String? byline;
  String? itemType;
  String? updatedDate;
  String? createdDate;
  String? publishedDate;
  String? materialTypeFacet;
  String? kicker;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Multimedia>? multimedia;
  String? shortUrl;

  Results(
      {this.section,
      this.subsection,
      this.title,
      this.abstract,
      this.url,
      this.uri,
      this.byline,
      this.itemType,
      this.updatedDate,
      this.createdDate,
      this.publishedDate,
      this.materialTypeFacet,
      this.kicker,
      this.desFacet,
      this.orgFacet,
      this.perFacet,
      this.geoFacet,
      this.multimedia,
      this.shortUrl});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class Multimedia {
  String? url;
  String? format;
  int? height;
  int? width;
  String? type;
  String? subtype;
  String? caption;
  String? copyright;

  Multimedia(
      {this.url,
      this.format,
      this.height,
      this.width,
      this.type,
      this.subtype,
      this.caption,
      this.copyright});

  factory Multimedia.fromJson(Map<String, dynamic> json) =>
      _$MultimediaFromJson(json);
  Map<String, dynamic> toJson() => _$MultimediaToJson(this);
}
