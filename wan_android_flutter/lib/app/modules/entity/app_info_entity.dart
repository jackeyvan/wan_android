import 'dart:convert';

import 'package:flutter_wan_android/generated/json/app_info_entity.g.dart';
import 'package:flutter_wan_android/generated/json/base/json_field.dart';

export 'package:flutter_wan_android/generated/json/app_info_entity.g.dart';

@JsonSerializable()
class AppInfoEntity {
  String? buildKey;
  String? buildType;
  int? buildIsFirst;
  String? buildIsLastest;
  String? buildFileSize;
  String? buildName;
  String? buildPassword;
  String? buildVersion;
  String? buildVersionNo;
  String? buildQrcodeShowAppIcon;
  String? buildVersionType;
  String? buildBuildVersion;
  String? buildIdentifier;
  String? buildIcon;
  String? buildDescription;
  String? buildUpdateDescription;
  String? buildScreenshots;
  String? buildShortcutUrl;
  String? buildSignatureType;
  String? buildIsAcceptFeedback;
  String? buildIsUploadCrashlog;
  String? buildIsOriginalBuildInHouse;
  String? buildAdhocUuids;
  String? buildTemplate;
  String? buildInstallType;
  String? buildManuallyBlocked;
  String? buildIsPlaceholder;
  String? buildCates;
  String? buildCreated;
  String? buildUpdated;
  String? buildQRCodeURL;
  int? isOwner;
  int? isJoin;
  String? buildFollowed;
  String? appExpiredDate;
  bool? isImmediatelyExpired;
  int? appExpiredStatus;
  List<dynamic>? otherApps;
  String? otherAppsCount;
  String? todayDownloadCount;
  String? todayBuildDownloadCount;
  String? appKey;
  String? appAutoSync;
  String? appShowPgyerCopyright;
  String? appDownloadPay;
  String? appDownloadDescription;
  String? appGameLicenseStatus;
  String? appLang;
  String? appIsTestFlight;
  String? appIsInstallDate;
  String? appInstallStartDate;
  String? appInstallEndDate;
  String? appInstallQuestion;
  String? appInstallAnswer;
  String? appFeedbackStatus;
  int? isMerged;
  dynamic mergeAppInfo;
  int? canPayDownload;
  String? iconUrl;
  List<dynamic>? buildScreenshotsUrl;

  AppInfoEntity();

  factory AppInfoEntity.fromJson(Map<String, dynamic> json) =>
      $AppInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
