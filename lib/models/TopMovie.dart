class TopMovie {
  int count;
  int start;
  int total;
  List<Subjects> subjects;
  String title;

  TopMovie(
      {this.count, this.start, this.total, this.subjects, this.title});

  TopMovie.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    start = json['start'];
    total = json['total'];
    if (json['subjects'] != null) {
      subjects = new List<Subjects>();
      json['subjects'].forEach((v) {
        subjects.add(new Subjects.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['start'] = this.start;
    data['total'] = this.total;
    if (this.subjects != null) {
      data['subjects'] = this.subjects.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    return data;
  }
}

class Subjects {
  Rating rating;
  List<String> genres;
  String title;
  List<Casts> casts;
  List<String> durations;
  int collectCount;
  String mainlandPubdate;
  bool hasVideo;
  String originalTitle;
  String subtype;
  List<Directors> directors;
  List<String> pubdates;
  String year;
  Images images;
  String alt;
  String id;

  Subjects(
      {this.rating,
      this.genres,
      this.title,
      this.casts,
      this.durations,
      this.collectCount,
      this.mainlandPubdate,
      this.hasVideo,
      this.originalTitle,
      this.subtype,
      this.directors,
      this.pubdates,
      this.year,
      this.images,
      this.alt,
      this.id});

  Subjects.fromJson(Map<String, dynamic> json) {
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    genres = json['genres'].cast<String>();
    title = json['title'];
    if (json['casts'] != null) {
      casts = new List<Casts>();
      json['casts'].forEach((v) {
        casts.add(new Casts.fromJson(v));
      });
    }
    durations = json['durations'].cast<String>();
    collectCount = json['collect_count'];
    mainlandPubdate = json['mainland_pubdate'];
    hasVideo = json['has_video'];
    originalTitle = json['original_title'];
    subtype = json['subtype'];
    if (json['directors'] != null) {
      directors = new List<Directors>();
      json['directors'].forEach((v) {
        directors.add(new Directors.fromJson(v));
      });
    }
    pubdates = json['pubdates'].cast<String>();
    year = json['year'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    alt = json['alt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['genres'] = this.genres;
    data['title'] = this.title;
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['durations'] = this.durations;
    data['collect_count'] = this.collectCount;
    data['mainland_pubdate'] = this.mainlandPubdate;
    data['has_video'] = this.hasVideo;
    data['original_title'] = this.originalTitle;
    data['subtype'] = this.subtype;
    if (this.directors != null) {
      data['directors'] = this.directors.map((v) => v.toJson()).toList();
    }
    data['pubdates'] = this.pubdates;
    data['year'] = this.year;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['alt'] = this.alt;
    data['id'] = this.id;
    return data;
  }
}

class Rating {
  int max;
  double average;
  Details details;
  String stars;
  int min;

  Rating({this.max, this.average, this.details, this.stars, this.min});

  Rating.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    average = json['average'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
    stars = json['stars'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this.max;
    data['average'] = this.average;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    data['stars'] = this.stars;
    data['min'] = this.min;
    return data;
  }
}

class Details {
  double i1;
  double i2;
  double i3;
  double i4;
  double i5;

  Details({this.i1, this.i2, this.i3, this.i4, this.i5});

  Details.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    i4 = json['4'];
    i5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.i1;
    data['2'] = this.i2;
    data['3'] = this.i3;
    data['4'] = this.i4;
    data['5'] = this.i5;
    return data;
  }
}

class Casts {
  Avatars avatars;
  String nameEn;
  String name;
  String alt;
  String id;

  Casts({this.avatars, this.nameEn, this.name, this.alt, this.id});

  Casts.fromJson(Map<String, dynamic> json) {
    avatars =
        json['avatars'] != null ? new Avatars.fromJson(json['avatars']) : null;
    nameEn = json['name_en'];
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name_en'] = this.nameEn;
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    return data;
  }
}

class Avatars {
  String small;
  String large;
  String medium;

  Avatars({this.small, this.large, this.medium});

  Avatars.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class Directors {
  Avatars avatars;
  String nameEn;
  String name;
  String alt;
  String id;

  Directors({this.avatars, this.nameEn, this.name, this.alt, this.id});

  Directors.fromJson(Map<String, dynamic> json) {
    avatars =
        json['avatars'] != null ? new Avatars.fromJson(json['avatars']) : null;
    nameEn = json['name_en'];
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name_en'] = this.nameEn;
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    return data;
  }
}

class Images {
  String small;
  String large;
  String medium;

  Images({this.small, this.large, this.medium});

  Images.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}
