import 'package:flutter_wan_android/app/modules/entity/app_info_entity.dart';
import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';

AppInfoEntity $AppInfoEntityFromJson(Map<String, dynamic> json) {
  final AppInfoEntity appInfoEntity = AppInfoEntity();
  final String? buildKey = jsonConvert.convert<String>(json['buildKey']);
  if (buildKey != null) {
    appInfoEntity.buildKey = buildKey;
  }
  final String? buildType = jsonConvert.convert<String>(json['buildType']);
  if (buildType != null) {
    appInfoEntity.buildType = buildType;
  }
  final int? buildIsFirst = jsonConvert.convert<int>(json['buildIsFirst']);
  if (buildIsFirst != null) {
    appInfoEntity.buildIsFirst = buildIsFirst;
  }
  final String? buildIsLastest =
      jsonConvert.convert<String>(json['buildIsLastest']);
  if (buildIsLastest != null) {
    appInfoEntity.buildIsLastest = buildIsLastest;
  }
  final String? buildFileSize =
      jsonConvert.convert<String>(json['buildFileSize']);
  if (buildFileSize != null) {
    appInfoEntity.buildFileSize = buildFileSize;
  }
  final String? buildName = jsonConvert.convert<String>(json['buildName']);
  if (buildName != null) {
    appInfoEntity.buildName = buildName;
  }
  final String? buildPassword =
      jsonConvert.convert<String>(json['buildPassword']);
  if (buildPassword != null) {
    appInfoEntity.buildPassword = buildPassword;
  }
  final String? buildVersion =
      jsonConvert.convert<String>(json['buildVersion']);
  if (buildVersion != null) {
    appInfoEntity.buildVersion = buildVersion;
  }
  final String? buildVersionNo =
      jsonConvert.convert<String>(json['buildVersionNo']);
  if (buildVersionNo != null) {
    appInfoEntity.buildVersionNo = buildVersionNo;
  }
  final String? buildQrcodeShowAppIcon =
      jsonConvert.convert<String>(json['buildQrcodeShowAppIcon']);
  if (buildQrcodeShowAppIcon != null) {
    appInfoEntity.buildQrcodeShowAppIcon = buildQrcodeShowAppIcon;
  }
  final String? buildVersionType =
      jsonConvert.convert<String>(json['buildVersionType']);
  if (buildVersionType != null) {
    appInfoEntity.buildVersionType = buildVersionType;
  }
  final String? buildBuildVersion =
      jsonConvert.convert<String>(json['buildBuildVersion']);
  if (buildBuildVersion != null) {
    appInfoEntity.buildBuildVersion = buildBuildVersion;
  }
  final String? buildIdentifier =
      jsonConvert.convert<String>(json['buildIdentifier']);
  if (buildIdentifier != null) {
    appInfoEntity.buildIdentifier = buildIdentifier;
  }
  final String? buildIcon = jsonConvert.convert<String>(json['buildIcon']);
  if (buildIcon != null) {
    appInfoEntity.buildIcon = buildIcon;
  }
  final String? buildDescription =
      jsonConvert.convert<String>(json['buildDescription']);
  if (buildDescription != null) {
    appInfoEntity.buildDescription = buildDescription;
  }
  final String? buildUpdateDescription =
      jsonConvert.convert<String>(json['buildUpdateDescription']);
  if (buildUpdateDescription != null) {
    appInfoEntity.buildUpdateDescription = buildUpdateDescription;
  }
  final String? buildScreenshots =
      jsonConvert.convert<String>(json['buildScreenshots']);
  if (buildScreenshots != null) {
    appInfoEntity.buildScreenshots = buildScreenshots;
  }
  final String? buildShortcutUrl =
      jsonConvert.convert<String>(json['buildShortcutUrl']);
  if (buildShortcutUrl != null) {
    appInfoEntity.buildShortcutUrl = buildShortcutUrl;
  }
  final String? buildSignatureType =
      jsonConvert.convert<String>(json['buildSignatureType']);
  if (buildSignatureType != null) {
    appInfoEntity.buildSignatureType = buildSignatureType;
  }
  final String? buildIsAcceptFeedback =
      jsonConvert.convert<String>(json['buildIsAcceptFeedback']);
  if (buildIsAcceptFeedback != null) {
    appInfoEntity.buildIsAcceptFeedback = buildIsAcceptFeedback;
  }
  final String? buildIsUploadCrashlog =
      jsonConvert.convert<String>(json['buildIsUploadCrashlog']);
  if (buildIsUploadCrashlog != null) {
    appInfoEntity.buildIsUploadCrashlog = buildIsUploadCrashlog;
  }
  final String? buildIsOriginalBuildInHouse =
      jsonConvert.convert<String>(json['buildIsOriginalBuildInHouse']);
  if (buildIsOriginalBuildInHouse != null) {
    appInfoEntity.buildIsOriginalBuildInHouse = buildIsOriginalBuildInHouse;
  }
  final String? buildAdhocUuids =
      jsonConvert.convert<String>(json['buildAdhocUuids']);
  if (buildAdhocUuids != null) {
    appInfoEntity.buildAdhocUuids = buildAdhocUuids;
  }
  final String? buildTemplate =
      jsonConvert.convert<String>(json['buildTemplate']);
  if (buildTemplate != null) {
    appInfoEntity.buildTemplate = buildTemplate;
  }
  final String? buildInstallType =
      jsonConvert.convert<String>(json['buildInstallType']);
  if (buildInstallType != null) {
    appInfoEntity.buildInstallType = buildInstallType;
  }
  final String? buildManuallyBlocked =
      jsonConvert.convert<String>(json['buildManuallyBlocked']);
  if (buildManuallyBlocked != null) {
    appInfoEntity.buildManuallyBlocked = buildManuallyBlocked;
  }
  final String? buildIsPlaceholder =
      jsonConvert.convert<String>(json['buildIsPlaceholder']);
  if (buildIsPlaceholder != null) {
    appInfoEntity.buildIsPlaceholder = buildIsPlaceholder;
  }
  final String? buildCates = jsonConvert.convert<String>(json['buildCates']);
  if (buildCates != null) {
    appInfoEntity.buildCates = buildCates;
  }
  final String? buildCreated =
      jsonConvert.convert<String>(json['buildCreated']);
  if (buildCreated != null) {
    appInfoEntity.buildCreated = buildCreated;
  }
  final String? buildUpdated =
      jsonConvert.convert<String>(json['buildUpdated']);
  if (buildUpdated != null) {
    appInfoEntity.buildUpdated = buildUpdated;
  }
  final String? buildQRCodeURL =
      jsonConvert.convert<String>(json['buildQRCodeURL']);
  if (buildQRCodeURL != null) {
    appInfoEntity.buildQRCodeURL = buildQRCodeURL;
  }
  final int? isOwner = jsonConvert.convert<int>(json['isOwner']);
  if (isOwner != null) {
    appInfoEntity.isOwner = isOwner;
  }
  final int? isJoin = jsonConvert.convert<int>(json['isJoin']);
  if (isJoin != null) {
    appInfoEntity.isJoin = isJoin;
  }
  final String? buildFollowed =
      jsonConvert.convert<String>(json['buildFollowed']);
  if (buildFollowed != null) {
    appInfoEntity.buildFollowed = buildFollowed;
  }
  final String? appExpiredDate =
      jsonConvert.convert<String>(json['appExpiredDate']);
  if (appExpiredDate != null) {
    appInfoEntity.appExpiredDate = appExpiredDate;
  }
  final bool? isImmediatelyExpired =
      jsonConvert.convert<bool>(json['isImmediatelyExpired']);
  if (isImmediatelyExpired != null) {
    appInfoEntity.isImmediatelyExpired = isImmediatelyExpired;
  }
  final int? appExpiredStatus =
      jsonConvert.convert<int>(json['appExpiredStatus']);
  if (appExpiredStatus != null) {
    appInfoEntity.appExpiredStatus = appExpiredStatus;
  }
  final List<dynamic>? otherApps =
      (json['otherApps'] as List<dynamic>?)?.map((e) => e).toList();
  if (otherApps != null) {
    appInfoEntity.otherApps = otherApps;
  }
  final String? otherAppsCount =
      jsonConvert.convert<String>(json['otherAppsCount']);
  if (otherAppsCount != null) {
    appInfoEntity.otherAppsCount = otherAppsCount;
  }
  final String? todayDownloadCount =
      jsonConvert.convert<String>(json['todayDownloadCount']);
  if (todayDownloadCount != null) {
    appInfoEntity.todayDownloadCount = todayDownloadCount;
  }
  final String? todayBuildDownloadCount =
      jsonConvert.convert<String>(json['todayBuildDownloadCount']);
  if (todayBuildDownloadCount != null) {
    appInfoEntity.todayBuildDownloadCount = todayBuildDownloadCount;
  }
  final String? appKey = jsonConvert.convert<String>(json['appKey']);
  if (appKey != null) {
    appInfoEntity.appKey = appKey;
  }
  final String? appAutoSync = jsonConvert.convert<String>(json['appAutoSync']);
  if (appAutoSync != null) {
    appInfoEntity.appAutoSync = appAutoSync;
  }
  final String? appShowPgyerCopyright =
      jsonConvert.convert<String>(json['appShowPgyerCopyright']);
  if (appShowPgyerCopyright != null) {
    appInfoEntity.appShowPgyerCopyright = appShowPgyerCopyright;
  }
  final String? appDownloadPay =
      jsonConvert.convert<String>(json['appDownloadPay']);
  if (appDownloadPay != null) {
    appInfoEntity.appDownloadPay = appDownloadPay;
  }
  final String? appDownloadDescription =
      jsonConvert.convert<String>(json['appDownloadDescription']);
  if (appDownloadDescription != null) {
    appInfoEntity.appDownloadDescription = appDownloadDescription;
  }
  final String? appGameLicenseStatus =
      jsonConvert.convert<String>(json['appGameLicenseStatus']);
  if (appGameLicenseStatus != null) {
    appInfoEntity.appGameLicenseStatus = appGameLicenseStatus;
  }
  final String? appLang = jsonConvert.convert<String>(json['appLang']);
  if (appLang != null) {
    appInfoEntity.appLang = appLang;
  }
  final String? appIsTestFlight =
      jsonConvert.convert<String>(json['appIsTestFlight']);
  if (appIsTestFlight != null) {
    appInfoEntity.appIsTestFlight = appIsTestFlight;
  }
  final String? appIsInstallDate =
      jsonConvert.convert<String>(json['appIsInstallDate']);
  if (appIsInstallDate != null) {
    appInfoEntity.appIsInstallDate = appIsInstallDate;
  }
  final String? appInstallStartDate =
      jsonConvert.convert<String>(json['appInstallStartDate']);
  if (appInstallStartDate != null) {
    appInfoEntity.appInstallStartDate = appInstallStartDate;
  }
  final String? appInstallEndDate =
      jsonConvert.convert<String>(json['appInstallEndDate']);
  if (appInstallEndDate != null) {
    appInfoEntity.appInstallEndDate = appInstallEndDate;
  }
  final String? appInstallQuestion =
      jsonConvert.convert<String>(json['appInstallQuestion']);
  if (appInstallQuestion != null) {
    appInfoEntity.appInstallQuestion = appInstallQuestion;
  }
  final String? appInstallAnswer =
      jsonConvert.convert<String>(json['appInstallAnswer']);
  if (appInstallAnswer != null) {
    appInfoEntity.appInstallAnswer = appInstallAnswer;
  }
  final String? appFeedbackStatus =
      jsonConvert.convert<String>(json['appFeedbackStatus']);
  if (appFeedbackStatus != null) {
    appInfoEntity.appFeedbackStatus = appFeedbackStatus;
  }
  final int? isMerged = jsonConvert.convert<int>(json['isMerged']);
  if (isMerged != null) {
    appInfoEntity.isMerged = isMerged;
  }
  final dynamic mergeAppInfo = json['mergeAppInfo'];
  if (mergeAppInfo != null) {
    appInfoEntity.mergeAppInfo = mergeAppInfo;
  }
  final int? canPayDownload = jsonConvert.convert<int>(json['canPayDownload']);
  if (canPayDownload != null) {
    appInfoEntity.canPayDownload = canPayDownload;
  }
  final String? iconUrl = jsonConvert.convert<String>(json['iconUrl']);
  if (iconUrl != null) {
    appInfoEntity.iconUrl = iconUrl;
  }
  final List<dynamic>? buildScreenshotsUrl =
      (json['buildScreenshotsUrl'] as List<dynamic>?)?.map((e) => e).toList();
  if (buildScreenshotsUrl != null) {
    appInfoEntity.buildScreenshotsUrl = buildScreenshotsUrl;
  }
  return appInfoEntity;
}

Map<String, dynamic> $AppInfoEntityToJson(AppInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['buildKey'] = entity.buildKey;
  data['buildType'] = entity.buildType;
  data['buildIsFirst'] = entity.buildIsFirst;
  data['buildIsLastest'] = entity.buildIsLastest;
  data['buildFileSize'] = entity.buildFileSize;
  data['buildName'] = entity.buildName;
  data['buildPassword'] = entity.buildPassword;
  data['buildVersion'] = entity.buildVersion;
  data['buildVersionNo'] = entity.buildVersionNo;
  data['buildQrcodeShowAppIcon'] = entity.buildQrcodeShowAppIcon;
  data['buildVersionType'] = entity.buildVersionType;
  data['buildBuildVersion'] = entity.buildBuildVersion;
  data['buildIdentifier'] = entity.buildIdentifier;
  data['buildIcon'] = entity.buildIcon;
  data['buildDescription'] = entity.buildDescription;
  data['buildUpdateDescription'] = entity.buildUpdateDescription;
  data['buildScreenshots'] = entity.buildScreenshots;
  data['buildShortcutUrl'] = entity.buildShortcutUrl;
  data['buildSignatureType'] = entity.buildSignatureType;
  data['buildIsAcceptFeedback'] = entity.buildIsAcceptFeedback;
  data['buildIsUploadCrashlog'] = entity.buildIsUploadCrashlog;
  data['buildIsOriginalBuildInHouse'] = entity.buildIsOriginalBuildInHouse;
  data['buildAdhocUuids'] = entity.buildAdhocUuids;
  data['buildTemplate'] = entity.buildTemplate;
  data['buildInstallType'] = entity.buildInstallType;
  data['buildManuallyBlocked'] = entity.buildManuallyBlocked;
  data['buildIsPlaceholder'] = entity.buildIsPlaceholder;
  data['buildCates'] = entity.buildCates;
  data['buildCreated'] = entity.buildCreated;
  data['buildUpdated'] = entity.buildUpdated;
  data['buildQRCodeURL'] = entity.buildQRCodeURL;
  data['isOwner'] = entity.isOwner;
  data['isJoin'] = entity.isJoin;
  data['buildFollowed'] = entity.buildFollowed;
  data['appExpiredDate'] = entity.appExpiredDate;
  data['isImmediatelyExpired'] = entity.isImmediatelyExpired;
  data['appExpiredStatus'] = entity.appExpiredStatus;
  data['otherApps'] = entity.otherApps;
  data['otherAppsCount'] = entity.otherAppsCount;
  data['todayDownloadCount'] = entity.todayDownloadCount;
  data['todayBuildDownloadCount'] = entity.todayBuildDownloadCount;
  data['appKey'] = entity.appKey;
  data['appAutoSync'] = entity.appAutoSync;
  data['appShowPgyerCopyright'] = entity.appShowPgyerCopyright;
  data['appDownloadPay'] = entity.appDownloadPay;
  data['appDownloadDescription'] = entity.appDownloadDescription;
  data['appGameLicenseStatus'] = entity.appGameLicenseStatus;
  data['appLang'] = entity.appLang;
  data['appIsTestFlight'] = entity.appIsTestFlight;
  data['appIsInstallDate'] = entity.appIsInstallDate;
  data['appInstallStartDate'] = entity.appInstallStartDate;
  data['appInstallEndDate'] = entity.appInstallEndDate;
  data['appInstallQuestion'] = entity.appInstallQuestion;
  data['appInstallAnswer'] = entity.appInstallAnswer;
  data['appFeedbackStatus'] = entity.appFeedbackStatus;
  data['isMerged'] = entity.isMerged;
  data['mergeAppInfo'] = entity.mergeAppInfo;
  data['canPayDownload'] = entity.canPayDownload;
  data['iconUrl'] = entity.iconUrl;
  data['buildScreenshotsUrl'] = entity.buildScreenshotsUrl;
  return data;
}

extension AppInfoEntityExtension on AppInfoEntity {
  AppInfoEntity copyWith({
    String? buildKey,
    String? buildType,
    int? buildIsFirst,
    String? buildIsLastest,
    String? buildFileSize,
    String? buildName,
    String? buildPassword,
    String? buildVersion,
    String? buildVersionNo,
    String? buildQrcodeShowAppIcon,
    String? buildVersionType,
    String? buildBuildVersion,
    String? buildIdentifier,
    String? buildIcon,
    String? buildDescription,
    String? buildUpdateDescription,
    String? buildScreenshots,
    String? buildShortcutUrl,
    String? buildSignatureType,
    String? buildIsAcceptFeedback,
    String? buildIsUploadCrashlog,
    String? buildIsOriginalBuildInHouse,
    String? buildAdhocUuids,
    String? buildTemplate,
    String? buildInstallType,
    String? buildManuallyBlocked,
    String? buildIsPlaceholder,
    String? buildCates,
    String? buildCreated,
    String? buildUpdated,
    String? buildQRCodeURL,
    int? isOwner,
    int? isJoin,
    String? buildFollowed,
    String? appExpiredDate,
    bool? isImmediatelyExpired,
    int? appExpiredStatus,
    List<dynamic>? otherApps,
    String? otherAppsCount,
    String? todayDownloadCount,
    String? todayBuildDownloadCount,
    String? appKey,
    String? appAutoSync,
    String? appShowPgyerCopyright,
    String? appDownloadPay,
    String? appDownloadDescription,
    String? appGameLicenseStatus,
    String? appLang,
    String? appIsTestFlight,
    String? appIsInstallDate,
    String? appInstallStartDate,
    String? appInstallEndDate,
    String? appInstallQuestion,
    String? appInstallAnswer,
    String? appFeedbackStatus,
    int? isMerged,
    dynamic mergeAppInfo,
    int? canPayDownload,
    String? iconUrl,
    List<dynamic>? buildScreenshotsUrl,
  }) {
    return AppInfoEntity()
      ..buildKey = buildKey ?? this.buildKey
      ..buildType = buildType ?? this.buildType
      ..buildIsFirst = buildIsFirst ?? this.buildIsFirst
      ..buildIsLastest = buildIsLastest ?? this.buildIsLastest
      ..buildFileSize = buildFileSize ?? this.buildFileSize
      ..buildName = buildName ?? this.buildName
      ..buildPassword = buildPassword ?? this.buildPassword
      ..buildVersion = buildVersion ?? this.buildVersion
      ..buildVersionNo = buildVersionNo ?? this.buildVersionNo
      ..buildQrcodeShowAppIcon =
          buildQrcodeShowAppIcon ?? this.buildQrcodeShowAppIcon
      ..buildVersionType = buildVersionType ?? this.buildVersionType
      ..buildBuildVersion = buildBuildVersion ?? this.buildBuildVersion
      ..buildIdentifier = buildIdentifier ?? this.buildIdentifier
      ..buildIcon = buildIcon ?? this.buildIcon
      ..buildDescription = buildDescription ?? this.buildDescription
      ..buildUpdateDescription =
          buildUpdateDescription ?? this.buildUpdateDescription
      ..buildScreenshots = buildScreenshots ?? this.buildScreenshots
      ..buildShortcutUrl = buildShortcutUrl ?? this.buildShortcutUrl
      ..buildSignatureType = buildSignatureType ?? this.buildSignatureType
      ..buildIsAcceptFeedback =
          buildIsAcceptFeedback ?? this.buildIsAcceptFeedback
      ..buildIsUploadCrashlog =
          buildIsUploadCrashlog ?? this.buildIsUploadCrashlog
      ..buildIsOriginalBuildInHouse =
          buildIsOriginalBuildInHouse ?? this.buildIsOriginalBuildInHouse
      ..buildAdhocUuids = buildAdhocUuids ?? this.buildAdhocUuids
      ..buildTemplate = buildTemplate ?? this.buildTemplate
      ..buildInstallType = buildInstallType ?? this.buildInstallType
      ..buildManuallyBlocked = buildManuallyBlocked ?? this.buildManuallyBlocked
      ..buildIsPlaceholder = buildIsPlaceholder ?? this.buildIsPlaceholder
      ..buildCates = buildCates ?? this.buildCates
      ..buildCreated = buildCreated ?? this.buildCreated
      ..buildUpdated = buildUpdated ?? this.buildUpdated
      ..buildQRCodeURL = buildQRCodeURL ?? this.buildQRCodeURL
      ..isOwner = isOwner ?? this.isOwner
      ..isJoin = isJoin ?? this.isJoin
      ..buildFollowed = buildFollowed ?? this.buildFollowed
      ..appExpiredDate = appExpiredDate ?? this.appExpiredDate
      ..isImmediatelyExpired = isImmediatelyExpired ?? this.isImmediatelyExpired
      ..appExpiredStatus = appExpiredStatus ?? this.appExpiredStatus
      ..otherApps = otherApps ?? this.otherApps
      ..otherAppsCount = otherAppsCount ?? this.otherAppsCount
      ..todayDownloadCount = todayDownloadCount ?? this.todayDownloadCount
      ..todayBuildDownloadCount =
          todayBuildDownloadCount ?? this.todayBuildDownloadCount
      ..appKey = appKey ?? this.appKey
      ..appAutoSync = appAutoSync ?? this.appAutoSync
      ..appShowPgyerCopyright =
          appShowPgyerCopyright ?? this.appShowPgyerCopyright
      ..appDownloadPay = appDownloadPay ?? this.appDownloadPay
      ..appDownloadDescription =
          appDownloadDescription ?? this.appDownloadDescription
      ..appGameLicenseStatus = appGameLicenseStatus ?? this.appGameLicenseStatus
      ..appLang = appLang ?? this.appLang
      ..appIsTestFlight = appIsTestFlight ?? this.appIsTestFlight
      ..appIsInstallDate = appIsInstallDate ?? this.appIsInstallDate
      ..appInstallStartDate = appInstallStartDate ?? this.appInstallStartDate
      ..appInstallEndDate = appInstallEndDate ?? this.appInstallEndDate
      ..appInstallQuestion = appInstallQuestion ?? this.appInstallQuestion
      ..appInstallAnswer = appInstallAnswer ?? this.appInstallAnswer
      ..appFeedbackStatus = appFeedbackStatus ?? this.appFeedbackStatus
      ..isMerged = isMerged ?? this.isMerged
      ..mergeAppInfo = mergeAppInfo ?? this.mergeAppInfo
      ..canPayDownload = canPayDownload ?? this.canPayDownload
      ..iconUrl = iconUrl ?? this.iconUrl
      ..buildScreenshotsUrl = buildScreenshotsUrl ?? this.buildScreenshotsUrl;
  }
}
