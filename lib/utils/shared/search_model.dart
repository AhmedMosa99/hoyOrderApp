class SearchModel {
  SearchModel({
    required this.socialMediaId,
    required this.socialMediaName,
    required this.serviceId,
    required this.packageId,
    required this.packageName,
    this.packageDesc,
    required this.packageTypeLink,
    required this.packageImage,
    required this.packageIcon,
    required this.packagePrice,
    required this.serviceName,
  });
  late final int socialMediaId;
  late final String socialMediaName;
  late final int serviceId;
  late final int packageId;
  late final String packageName;
  late final String? packageDesc;
  late final String packageTypeLink;
  late final String packageImage;
  late final String packageIcon;
  late final int packagePrice;
  late final String serviceName;

  SearchModel.fromJson(Map<String, dynamic> json) {
    socialMediaId = json['social_media_id'];
    socialMediaName = json['social_media_name'];
    serviceId = json['service_id'];
    packageId = json['package_id'];
    packageName = json['package_name'];
    packageDesc = json['package_desc'];
    packageTypeLink = json['package_type_link'];
    packageImage = json['package_image'];
    packageIcon = json['package_icon'];
    packagePrice = json['package_price'];
    serviceName = json['service_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['social_media_id'] = socialMediaId;
    _data['social_media_name'] = socialMediaName;
    _data['service_id'] = serviceId;
    _data['package_id'] = packageId;
    _data['package_name'] = packageName.toString();
    _data['package_desc'] = packageDesc.toString();
    _data['package_type_link'] = packageTypeLink.toString();
    _data['package_image'] = packageImage.toString();
    _data['package_icon'] = packageIcon.toString();
    _data['package_price'] = packagePrice.toString();
    _data['service_name'] = serviceName.toString();
    return _data;
  }
}
