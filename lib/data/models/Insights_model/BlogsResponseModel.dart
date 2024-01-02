class BlogsResponseModel {
  bool? status;
  List<Blogs>? blogs;
  List<BlogCategory>? category;

  BlogsResponseModel({this.status, this.blogs, this.category});

  BlogsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(new Blogs.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <BlogCategory>[];
      json['category'].forEach((v) {
        category!.add(new BlogCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blogs {
  int? id;
  String? categoryId;
  String? stockId;
  String? slugs;
  String? title;
  String? description;
  String? image;
  String? tags;
  String? userApp;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Blogs(
      {this.id,
        this.categoryId,
        this.stockId,
        this.slugs,
        this.title,
        this.description,
        this.image,
        this.tags,
        this.userApp,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.imageUrl});

  Blogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    stockId = json['stock_id'];
    slugs = json['slugs'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    tags = json['tags'];
    userApp = json['user_app'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['stock_id'] = this.stockId;
    data['slugs'] = this.slugs;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['tags'] = this.tags;
    data['user_app'] = this.userApp;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class BlogCategory {
  int? id;
  String? categoryName;
  int? status;
  String? createdAt;
  String? updatedAt;

  BlogCategory(
      {this.id,
        this.categoryName,
        this.status,
        this.createdAt,
        this.updatedAt});

  BlogCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
