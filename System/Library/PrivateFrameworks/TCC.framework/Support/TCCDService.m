@interface TCCDService
+ (id)allServices;
+ (id)defaultLocalizedResourcesBundlePath;
+ (id)localizationKeyName:(id)a3 forServiceName:(id)a4;
+ (id)localizationKeyNameWithFeatureFlagEnabled:(id)a3;
+ (id)reminderRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)reminderRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)reminderTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestAdditionalTextAfterV2UpgradeLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestAdditionalTextExtensionLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestAdditionalTextForSubsequentRequestsKeyNameForServiceName:(id)a3;
+ (id)requestAdditionalTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestAlternateTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestDenyNotificationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestDenyNotificationTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestTitleTextAfterV2UpgradeLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestTitleTextForSubsequentRequestsLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)serviceAll;
+ (id)serviceDescriptionsForPlatformName:(id)a3;
+ (id)subsequentRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)subsequentRequestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)subsequentRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)tccdPlatformNameForDYLDPlatformName:(id)a3;
+ (id)versionStringFromDYLDVersionNumber:(id)a3;
- (BOOL)allowPromptForPlatformBinaries;
- (BOOL)allowedForAvocadoWidget;
- (BOOL)applyDevelopmentAuthorizationPolicy;
- (BOOL)checkAllowEntitlementOnResponsibleProcess;
- (BOOL)doNotStoreDefaultAllowAccess;
- (BOOL)expireOnlyAllowedEntries;
- (BOOL)getUsesTwoStagePrompting;
- (BOOL)hasParanoidSecurityPolicy;
- (BOOL)ios_allowPromptFromAppClip;
- (BOOL)ios_allowRegionalPrompt;
- (BOOL)ios_useGenericSandboxExtension;
- (BOOL)isAccessAllowedByDefault;
- (BOOL)isAccessDeniedByDefault;
- (BOOL)isAuthorizationValue:(unint64_t)a3 equalToRight:(unint64_t)a4;
- (BOOL)isRevocable;
- (BOOL)macos_compositionPromoteChildAuthorizationToParent;
- (BOOL)macos_hasIndirectObject;
- (BOOL)macos_isPerSystem;
- (BOOL)macos_pardonMissingUsage;
- (BOOL)macos_shouldAllowSameTeam;
- (BOOL)mdm_allowStandardUserToSetSystemService;
- (BOOL)mdm_isAuthorizationDenyOnly;
- (BOOL)mdm_macos_allowedInPayloadDefition;
- (BOOL)pardonMissingUsage;
- (BOOL)saveExpiredEntries;
- (BOOL)shouldAllowUnrestrictedCheckAuditToken;
- (BOOL)shouldIssueSandboxExtension;
- (BOOL)shouldTreatAsDeprecated;
- (BOOL)shouldUseADefaultDescriptionString;
- (BOOL)supportsStagedPrompting;
- (BOOL)upgradeV1AuthorizationValue;
- (BOOL)usesTwoStagePrompting;
- (NSArray)defaultAllowedPlatformIdentifiersList;
- (NSArray)disallowedOnPlatformSubtypeNameList;
- (NSBundle)defaultLocalizedResourcesBundle;
- (NSBundle)localizedResourcesBundle;
- (NSDictionary)authSpecificNotificationExtensionBundleIdentifier;
- (NSDictionary)iOS_minimumSDKVersionNumberAuthSpecific;
- (NSDictionary)macos_minimumSDKVersionNumberAuthSpecific;
- (NSDictionary)platformAvailability;
- (NSDictionary)tvOS_minimumSDKVersionNumberAuthSpecific;
- (NSDictionary)vOS_minimumSDKVersionNumberAuthSpecific;
- (NSDictionary)watchOS_minimumSDKVersionNumberAuthSpecific;
- (NSNumber)expirySeconds;
- (NSNumber)iOS_minimumSDKVersionNumber;
- (NSNumber)ios_watchKitUserNotificationNumber;
- (NSNumber)macos_minimumSDKVersionNumber;
- (NSNumber)tvOS_minimumSDKVersionNumber;
- (NSNumber)vOS_minimumSDKVersionNumber;
- (NSNumber)watchOS_minimumSDKVersionNumber;
- (NSSet)validOnPlatformNames;
- (NSString)addAccessUsageDescriptionKeyName;
- (NSString)addModifyAddedAuthorizationButtonTitleLocalizationKey;
- (NSString)allowAuthorizationButtonTitleLocalizationKey;
- (NSString)alternatePromptTitleEntitlement;
- (NSString)cancelButtontitleLocalizationKey;
- (NSString)denyAuthorizationButtonTitleLocalizationKey;
- (NSString)externalName;
- (NSString)firstStagePromptHeaderAssetCatalogPath;
- (NSString)firstStagePromptHeaderAssetName;
- (NSString)fullAccessUsageDescriptionKeyName;
- (NSString)limitedAuthorizationButtonTitleLocalizationKey;
- (NSString)localizedResourcesBundlePath;
- (NSString)macos_hardenedRuntimeEntitlementName;
- (NSString)macos_helpAnchor;
- (NSString)moreAuthorizationOptionsButtonTitleLocalizationKey;
- (NSString)name;
- (NSString)notificationButtonTitleLocalizationKey;
- (NSString)notificationTitleTextLocalizationKey;
- (NSString)reminderAllowButtonTitleTextLocalizationKey;
- (NSString)reminderLimitedButtonTitleTextLocalizationKey;
- (NSString)reminderTitleTextLocalizationKey;
- (NSString)requestAddTitleTextLocalizationKey;
- (NSString)requestAdditionalTextAfterV2UpgradeLocalizationKey;
- (NSString)requestAdditionalTextForSubsequentRequestsLocalizationKey;
- (NSString)requestAdditionalTextLocalizationKey;
- (NSString)requestEntitlementTitleTextLocalizationKey;
- (NSString)requestFullTitleTextLocalizationKey;
- (NSString)requestLimitedTitleTextLocalizationKey;
- (NSString)requestNotificationExtensionTextLocalizationKey;
- (NSString)requestTitleTextAfterV2UpgradeLocalizationKey;
- (NSString)requestTitleTextForSubsequentRequestsKey;
- (NSString)requestTitleTextLocalizationKey;
- (NSString)requestUpgradeTitleTextLocalizationKey;
- (NSString)sandboxOperationForDelegation;
- (NSString)secondaryUsageDescriptionKeyName;
- (NSString)sessionPidAuthorizationButtonTitleLocalizationKey;
- (NSString)settingsRequestFullTitleTextLocalizationKey;
- (NSString)subsequentRequestAllowAuthorizationButtonTitleLocalizationKey;
- (NSString)subsequentRequestDenyAuthorizationButtonTitleLocalizationKey;
- (NSString)subsequentRequestLimitedAuthorizationButtonTitleLocalizationKey;
- (NSString)usageDescriptionKeyName;
- (NSURL)notificationActionURL;
- (TCCDAlertManager)alertManager;
- (TCCDService)initWithName:(id)a3 availability:(id)a4;
- (TCCDService)macos_compositionChildService;
- (TCCDService)macos_compositionParentService;
- (TCCDService)subsequentRequestStringsRelatedService;
- (id)authorizationRightStateForValue:(unint64_t)a3 reason:(unint64_t)a4;
- (id)buttonTitleLocalizationKeyForAuthorization:(unint64_t)a3 desiredAuth:(unint64_t)a4;
- (id)descriptionDictionary;
- (id)descriptionForAuthorizationValue:(unint64_t)a3 reason:(unint64_t)a4;
- (id)localizationKeyForButtonAuth:(unint64_t)a3 desiredAuth:(unint64_t)a4;
- (id)localizedTextWithKey:(id)a3;
- (id)populateRecordMetricWithFields:(id)a3;
- (id)promptAuthorizationChoiceBlock;
- (id)promptButtonLocalizationKeyBlock;
- (id)recordAnalyticsPopulationBlock;
- (id)requestTitleTextLocalizationKeyForAuthorization:(unint64_t)a3;
- (id)syncAuthorizationTranslationBlock;
- (id)usageDescriptionKeyForAuthorization:(unint64_t)a3;
- (int)authorizationChoicesForCurrentAuth:(unint64_t)a3 desiredAuth:(unint64_t)a4 aButtonAuth:(unint64_t *)a5 bButtonAuth:(unint64_t *)a6 cButtonAuth:(unint64_t *)a7;
- (int64_t)alertStyle;
- (int64_t)compare:(id)a3;
- (int64_t)defaultDevelopmentAuthorizationValue;
- (int64_t)developmentAuthorizationValue;
- (int64_t)macos_AXControlComputerAccessType;
- (unint64_t)authorizationPromptRightsMask;
- (unint64_t)authorizationRightsMask;
- (unint64_t)authorizationValueType;
- (unint64_t)authorizationVersionNumber;
- (unint64_t)defaultDesiredAuth;
- (unint64_t)downgradeAuthRight;
- (unint64_t)translateAuth:(unint64_t)a3 versionUpgrade:(BOOL)a4;
- (void)setAddAccessUsageDescriptionKeyName:(id)a3;
- (void)setAddModifyAddedAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setAlertManager:(id)a3;
- (void)setAlertStyle:(int64_t)a3;
- (void)setAllowAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setAllowPromptForPlatformBinaries:(BOOL)a3;
- (void)setAllowedForAvocadoWidget:(BOOL)a3;
- (void)setAlternatePromptTitleEntitlement:(id)a3;
- (void)setApplyDevelopmentAuthorizationPolicy:(BOOL)a3;
- (void)setAuthSpecificNotificationExtensionBundleIdentifier:(id)a3;
- (void)setAuthorizationRightsMask:(unint64_t)a3;
- (void)setAuthorizationValueType:(unint64_t)a3;
- (void)setAuthorizationVersionNumber:(unint64_t)a3;
- (void)setCancelButtontitleLocalizationKey:(id)a3;
- (void)setCheckAllowEntitlementOnResponsibleProcess:(BOOL)a3;
- (void)setDefaultAllowedPlatformIdentifiersList:(id)a3;
- (void)setDefaultDesiredAuth:(unint64_t)a3;
- (void)setDefaultDevelopmentAuthorizationValue:(int64_t)a3;
- (void)setDefaultLocalizedResourcesBundle:(id)a3;
- (void)setDenyAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setDisallowedOnPlatformSubtypeNameList:(id)a3;
- (void)setDoNotStoreDefaultAllowAccess:(BOOL)a3;
- (void)setDowngradeAuthRight:(unint64_t)a3;
- (void)setExpireOnlyAllowedEntries:(BOOL)a3;
- (void)setExpirySeconds:(id)a3;
- (void)setExternalName:(id)a3;
- (void)setFirstStagePromptHeaderAssetCatalogPath:(id)a3;
- (void)setFirstStagePromptHeaderAssetName:(id)a3;
- (void)setFullAccessUsageDescriptionKeyName:(id)a3;
- (void)setHasParanoidSecurityPolicy:(BOOL)a3;
- (void)setIOS_minimumSDKVersionNumber:(id)a3;
- (void)setIOS_minimumSDKVersionNumberAuthSpecific:(id)a3;
- (void)setIos_allowPromptFromAppClip:(BOOL)a3;
- (void)setIos_allowRegionalPrompt:(BOOL)a3;
- (void)setIos_useGenericSandboxExtension:(BOOL)a3;
- (void)setIos_watchKitUserNotificationNumber:(id)a3;
- (void)setIsAccessAllowedByDefault:(BOOL)a3;
- (void)setIsAccessDeniedByDefault:(BOOL)a3;
- (void)setIsRevocable:(BOOL)a3;
- (void)setLimitedAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setLocalizedResourcesBundle:(id)a3;
- (void)setLocalizedResourcesBundlePath:(id)a3;
- (void)setMacos_AXControlComputerAccessType:(int64_t)a3;
- (void)setMacos_compositionChildService:(id)a3;
- (void)setMacos_compositionParentService:(id)a3;
- (void)setMacos_compositionPromoteChildAuthorizationToParent:(BOOL)a3;
- (void)setMacos_hardenedRuntimeEntitlementName:(id)a3;
- (void)setMacos_hasIndirectObject:(BOOL)a3;
- (void)setMacos_helpAnchor:(id)a3;
- (void)setMacos_isPerSystem:(BOOL)a3;
- (void)setMacos_minimumSDKVersionNumber:(id)a3;
- (void)setMacos_minimumSDKVersionNumberAuthSpecific:(id)a3;
- (void)setMacos_pardonMissingUsage:(BOOL)a3;
- (void)setMacos_shouldAllowSameTeam:(BOOL)a3;
- (void)setMdm_allowStandardUserToSetSystemService:(BOOL)a3;
- (void)setMdm_isAuthorizationDenyOnly:(BOOL)a3;
- (void)setMdm_macos_allowedInPayloadDefition:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNotificationActionURL:(id)a3;
- (void)setNotificationButtonTitleLocalizationKey:(id)a3;
- (void)setNotificationTitleTextLocalizationKey:(id)a3;
- (void)setPlatformAvailability:(id)a3;
- (void)setPromptAuthorizationChoiceBlock:(id)a3;
- (void)setPromptButtonLocalizationKeyBlock:(id)a3;
- (void)setRecordAnalyticsPopulationBlock:(id)a3;
- (void)setReminderAllowButtonTitleTextLocalizationKey:(id)a3;
- (void)setReminderLimitedButtonTitleTextLocalizationKey:(id)a3;
- (void)setReminderTitleTextLocalizationKey:(id)a3;
- (void)setRequestAddTitleTextLocalizationKey:(id)a3;
- (void)setRequestAdditionalTextAfterV2UpgradeLocalizationKey:(id)a3;
- (void)setRequestAdditionalTextForSubsequentRequestsLocalizationKey:(id)a3;
- (void)setRequestAdditionalTextLocalizationKey:(id)a3;
- (void)setRequestEntitlementTitleTextLocalizationKey:(id)a3;
- (void)setRequestFullTitleTextLocalizationKey:(id)a3;
- (void)setRequestLimitedTitleTextLocalizationKey:(id)a3;
- (void)setRequestNotificationExtensionTextLocalizationKey:(id)a3;
- (void)setRequestTitleTextAfterV2UpgradeLocalizationKey:(id)a3;
- (void)setRequestTitleTextForSubsequentRequestsKey:(id)a3;
- (void)setRequestTitleTextLocalizationKey:(id)a3;
- (void)setRequestUpgradeTitleTextLocalizationKey:(id)a3;
- (void)setSandboxOperationForDelegation:(id)a3;
- (void)setSaveExpiredEntries:(BOOL)a3;
- (void)setSecondaryUsageDescriptionKeyName:(id)a3;
- (void)setSessionPidAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setSettingsRequestFullTitleTextLocalizationKey:(id)a3;
- (void)setShouldAllowUnrestrictedCheckAuditToken:(BOOL)a3;
- (void)setShouldIssueSandboxExtension:(BOOL)a3;
- (void)setShouldTreatAsDeprecated:(BOOL)a3;
- (void)setShouldUseADefaultDescriptionString:(BOOL)a3;
- (void)setSubsequentRequestAllowAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setSubsequentRequestDenyAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setSubsequentRequestLimitedAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setSubsequentRequestStringsRelatedService:(id)a3;
- (void)setSupportsStagedPrompting:(BOOL)a3;
- (void)setSyncAuthorizationTranslationBlock:(id)a3;
- (void)setTvOS_minimumSDKVersionNumber:(id)a3;
- (void)setTvOS_minimumSDKVersionNumberAuthSpecific:(id)a3;
- (void)setUpgradeV1AuthorizationValue:(BOOL)a3;
- (void)setUsageDescriptionKeyName:(id)a3;
- (void)setUsesTwoStagePrompting:(BOOL)a3;
- (void)setVOS_minimumSDKVersionNumber:(id)a3;
- (void)setVOS_minimumSDKVersionNumberAuthSpecific:(id)a3;
- (void)setValidOnPlatformNames:(id)a3;
- (void)setWatchOS_minimumSDKVersionNumber:(id)a3;
- (void)setWatchOS_minimumSDKVersionNumberAuthSpecific:(id)a3;
@end

@implementation TCCDService

+ (id)allServices
{
  if (qword_100078370 != -1) {
    dispatch_once(&qword_100078370, &stru_1000659E8);
  }
  return (id)qword_100078368;
}

+ (id)serviceAll
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B770;
  block[3] = &unk_100065BB0;
  block[4] = a1;
  if (qword_100078380 != -1) {
    dispatch_once(&qword_100078380, block);
  }
  return (id)qword_100078378;
}

+ (id)serviceDescriptionsForPlatformName:(id)a3
{
  id v4 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue([a1 allServices]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v20 allObjects]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingSelector:"compare:"]);

  v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 validOnPlatformNames]);
        unsigned __int8 v14 = [v13 containsObject:v4];

        if ((v14 & 1) != 0 || [v4 isEqualToString:@"all"])
        {
          uint64_t v15 = objc_claimAutoreleasedReturnValue([a1 serviceAll]);
          if (v12 != (void *)v15)
          {
            v16 = (void *)v15;
            unsigned __int8 v17 = [v12 shouldTreatAsDeprecated];

            if ((v17 & 1) != 0) {
              continue;
            }
            v12 = (void *)objc_claimAutoreleasedReturnValue([v12 descriptionDictionary]);
            -[NSMutableArray addObject:](v21, "addObject:", v12);
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v9);
  }

  id v18 = -[NSMutableArray copy](v21, "copy");
  return v18;
}

+ (id)tccdPlatformNameForDYLDPlatformName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"macos"])
  {
    id v4 = &TCCDPlatformNameMacOS;
  }

  else if ([v3 isEqualToString:@"ios"])
  {
    id v4 = &TCCDPlatformNameIOS;
  }

  else if ([v3 isEqualToString:@"watchos"])
  {
    id v4 = &TCCDPlatformNameWatchOS;
  }

  else
  {
    if (![v3 isEqualToString:@"tvos"])
    {
      v5 = 0LL;
      goto LABEL_10;
    }

    id v4 = &TCCDPlatformNameTVOS;
  }

  v5 = *v4;
LABEL_10:

  return v5;
}

+ (id)versionStringFromDYLDVersionNumber:(id)a3
{
  id v3 = [a3 unsignedIntValue];
  if ((_BYTE)v3) {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u.%u.%u",  BYTE2(v3),  BYTE1(v3),  v3);
  }
  else {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u.%u",  BYTE2(v3),  BYTE1(v3),  v6);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

+ (id)localizationKeyName:(id)a3 forServiceName:(id)a4
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", a3, a4);
}

+ (id)localizationKeyNameWithFeatureFlagEnabled:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  a3,  @"FEATURE_FLAG_ENABLED");
}

+ (id)reminderTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REMINDER_ACCESS_SERVICE" forServiceName:a3];
}

+ (id)requestTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SERVICE" forServiceName:a3];
}

+ (id)requestTitleTextAfterV2UpgradeLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_V2_UPGRADE_SERVICE" forServiceName:a3];
}

+ (id)requestTitleTextForSubsequentRequestsLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SUBSEQUENT_SERVICE" forServiceName:a3];
}

+ (id)requestAdditionalTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_INFO_SERVICE" forServiceName:a3];
}

+ (id)requestAdditionalTextAfterV2UpgradeLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_INFO_V2_UPGRADE_SERVICE" forServiceName:a3];
}

+ (id)requestAdditionalTextForSubsequentRequestsKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_INFO_SUBSEQUENT_SERVICE" forServiceName:a3];
}

+ (id)requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_ALLOW" forServiceName:a3];
}

+ (id)reminderRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REMINDER_REQUEST_ACCESS_ALLOW" forServiceName:a3];
}

+ (id)requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_DENY" forServiceName:a3];
}

+ (id)requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_LIMITED" forServiceName:a3];
}

+ (id)reminderRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REMINDER_REQUEST_ACCESS_LIMITED" forServiceName:a3];
}

+ (id)subsequentRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SUBSEQUENT_ALLOW" forServiceName:a3];
}

+ (id)subsequentRequestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SUBSEQUENT_DENY" forServiceName:a3];
}

+ (id)subsequentRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SUBSEQUENT_LIMITED" forServiceName:a3];
}

+ (id)requestDenyNotificationTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"NOTIFY_SERVICE" forServiceName:a3];
}

+ (id)requestDenyNotificationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"NOTIFY_BUTTON" forServiceName:a3];
}

+ (id)requestAdditionalTextExtensionLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_INFO_EXTENSION_SERVICE" forServiceName:a3];
}

+ (id)requestAlternateTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SERVICE_ENTITLEMENT" forServiceName:a3];
}

- (TCCDService)initWithName:(id)a3 availability:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___TCCDService;
  id v8 = -[TCCDService init](&v32, "init");
  if (v8)
  {
    id v9 = [v6 copy];
    -[TCCDService setName:](v8, "setName:", v9);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v8, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringFromIndex:", objc_msgSend(@"kTCCService", "length")));
    -[TCCDService setExternalName:](v8, "setExternalName:", v11);

    -[TCCDService setMdm_macos_allowedInPayloadDefition:](v8, "setMdm_macos_allowedInPayloadDefition:", 1LL);
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472LL;
    v28 = sub_10002C01C;
    v29 = &unk_100065BD8;
    v13 = v8;
    v30 = v13;
    unsigned __int8 v14 = v12;
    v31 = v14;
    [v7 enumerateKeysAndObjectsUsingBlock:&v26];
    -[TCCDService setValidOnPlatformNames:](v13, "setValidOnPlatformNames:", v14, v26, v27, v28, v29);
    -[TCCDService setUsesTwoStagePrompting:](v13, "setUsesTwoStagePrompting:", 0LL);
    -[TCCDService setPlatformAvailability:](v13, "setPlatformAvailability:", v7);
    -[TCCDService setAuthorizationValueType:](v13, "setAuthorizationValueType:", 1LL);
    -[TCCDService setAuthorizationRightsMask:](v13, "setAuthorizationRightsMask:", 7LL);
    -[TCCDService setAuthorizationVersionNumber:](v13, "setAuthorizationVersionNumber:", 1LL);
    -[TCCDService setAllowedForAvocadoWidget:](v13, "setAllowedForAvocadoWidget:", 1LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService defaultLocalizedResourcesBundlePath]( &OBJC_CLASS___TCCDService,  "defaultLocalizedResourcesBundlePath"));
    -[TCCDService setLocalizedResourcesBundlePath:](v13, "setLocalizedResourcesBundlePath:", v15);

    -[TCCDService setAllowAuthorizationButtonTitleLocalizationKey:]( v13,  "setAllowAuthorizationButtonTitleLocalizationKey:",  @"REQUEST_ACCESS_ALLOW");
    -[TCCDService setDenyAuthorizationButtonTitleLocalizationKey:]( v13,  "setDenyAuthorizationButtonTitleLocalizationKey:",  @"REQUEST_ACCESS_DENY");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v13, "name"));
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestTitleTextLocalizationKeyNameForServiceName:",  v16));
    -[TCCDService setRequestTitleTextLocalizationKey:](v13, "setRequestTitleTextLocalizationKey:", v17);

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService requestTitleTextLocalizationKey](v13, "requestTitleTextLocalizationKey"));
    if (!v18) {
      sub_10002DAFC();
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v13, "name"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestDenyNotificationTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestDenyNotificationTitleTextLocalizationKeyNameForServiceName:",  v19));
    -[TCCDService setNotificationTitleTextLocalizationKey:](v13, "setNotificationTitleTextLocalizationKey:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService notificationTitleTextLocalizationKey](v13, "notificationTitleTextLocalizationKey"));
    if (!v21) {
      sub_10002DAFC();
    }
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v13, "name"));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestDenyNotificationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestDenyNotificationButtonTitleTextLocalizationKeyNameForServiceName:",  v22));
    -[TCCDService setNotificationButtonTitleLocalizationKey:](v13, "setNotificationButtonTitleLocalizationKey:", v23);

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService notificationButtonTitleLocalizationKey](v13, "notificationButtonTitleLocalizationKey"));
    if (!v24) {
      sub_10002DAFC();
    }
    -[TCCDService setLimitedAuthorizationButtonTitleLocalizationKey:]( v13,  "setLimitedAuthorizationButtonTitleLocalizationKey:",  0LL);
    -[TCCDService setRequestTitleTextAfterV2UpgradeLocalizationKey:]( v13,  "setRequestTitleTextAfterV2UpgradeLocalizationKey:",  0LL);
    -[TCCDService setRequestAdditionalTextLocalizationKey:](v13, "setRequestAdditionalTextLocalizationKey:", 0LL);
    -[TCCDService setRequestAdditionalTextAfterV2UpgradeLocalizationKey:]( v13,  "setRequestAdditionalTextAfterV2UpgradeLocalizationKey:",  0LL);
    -[TCCDService setRequestTitleTextForSubsequentRequestsKey:]( v13,  "setRequestTitleTextForSubsequentRequestsKey:",  0LL);
    -[TCCDService setRequestAdditionalTextForSubsequentRequestsLocalizationKey:]( v13,  "setRequestAdditionalTextForSubsequentRequestsLocalizationKey:",  0LL);
    -[TCCDService setRequestNotificationExtensionTextLocalizationKey:]( v13,  "setRequestNotificationExtensionTextLocalizationKey:",  0LL);
    -[TCCDService setReminderTitleTextLocalizationKey:](v13, "setReminderTitleTextLocalizationKey:", 0LL);
    -[TCCDService setReminderAllowButtonTitleTextLocalizationKey:]( v13,  "setReminderAllowButtonTitleTextLocalizationKey:",  0LL);
    -[TCCDService setReminderLimitedButtonTitleTextLocalizationKey:]( v13,  "setReminderLimitedButtonTitleTextLocalizationKey:",  0LL);
    -[TCCDService setCancelButtontitleLocalizationKey:]( v13,  "setCancelButtontitleLocalizationKey:",  @"REQUEST_ACCESS_CANCEL");
    -[TCCDService setAlternatePromptTitleEntitlement:](v13, "setAlternatePromptTitleEntitlement:", 0LL);
    -[TCCDService setRequestEntitlementTitleTextLocalizationKey:]( v13,  "setRequestEntitlementTitleTextLocalizationKey:",  0LL);
    -[TCCDService setPromptAuthorizationChoiceBlock:](v13, "setPromptAuthorizationChoiceBlock:", &stru_100065BF8);
    -[TCCDService setPromptButtonLocalizationKeyBlock:](v13, "setPromptButtonLocalizationKeyBlock:", &stru_100065C18);
    -[TCCDService setDefaultDesiredAuth:](v13, "setDefaultDesiredAuth:", 2LL);
    -[TCCDService setSyncAuthorizationTranslationBlock:](v13, "setSyncAuthorizationTranslationBlock:", &stru_100065C38);
    -[TCCDService setRecordAnalyticsPopulationBlock:](v13, "setRecordAnalyticsPopulationBlock:", &stru_100065C78);
  }

  return v8;
}

- (id)descriptionDictionary
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](self, "name"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"name");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService externalName](self, "externalName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"externalName");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService usageDescriptionKeyName](self, "usageDescriptionKeyName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"usageDescriptionKeyName");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService validOnPlatformNames](self, "validOnPlatformNames"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"platforms");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService platformAvailability](self, "platformAvailability"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  @"platformAvailibilityVersionNumbers");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService fullAccessUsageDescriptionKeyName](self, "fullAccessUsageDescriptionKeyName"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService fullAccessUsageDescriptionKeyName](self, "fullAccessUsageDescriptionKeyName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v11,  @"fullAccessUsageDescriptionKeyName");
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService addAccessUsageDescriptionKeyName](self, "addAccessUsageDescriptionKeyName"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService addAccessUsageDescriptionKeyName](self, "addAccessUsageDescriptionKeyName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v13,  @"addAccessUsageDescriptionKeyName");
  }

  if (-[TCCDService supportsStagedPrompting](self, "supportsStagedPrompting"))
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TCCDService supportsStagedPrompting](self, "supportsStagedPrompting")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  @"supportsStagedPrompting");
  }

  uint64_t v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService platformAvailability](self, "platformAvailability"));
  v52 = _NSConcreteStackBlock;
  uint64_t v53 = 3221225472LL;
  v54 = sub_10002C718;
  v55 = &unk_100065BD8;
  unsigned __int8 v17 = v15;
  v56 = v17;
  v57 = self;
  [v16 enumerateKeysAndObjectsUsingBlock:&v52];

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v17,  @"platformAvailibilityVersionStrings",  v52,  v53,  v54,  v55);
  if (-[TCCDService mdm_isAuthorizationDenyOnly](self, "mdm_isAuthorizationDenyOnly"))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TCCDService mdm_isAuthorizationDenyOnly](self, "mdm_isAuthorizationDenyOnly")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v18,  @"mdm_isAuthorizationDenyOnly");
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TCCDService mdm_macos_allowedInPayloadDefition](self, "mdm_macos_allowedInPayloadDefition")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v19,  @"mdm_macos_allowedInPayloadDefition");

  if (-[TCCDService mdm_allowStandardUserToSetSystemService](self, "mdm_allowStandardUserToSetSystemService"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TCCDService mdm_allowStandardUserToSetSystemService]( self,  "mdm_allowStandardUserToSetSystemService")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v20,  @"mdm_allowStandardUserToSetSystemService");
  }

  if (-[TCCDService macos_hasIndirectObject](self, "macos_hasIndirectObject"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TCCDService macos_hasIndirectObject](self, "macos_hasIndirectObject")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v21,  @"macos_hasIndirectObject");
  }

  if (-[TCCDService macos_isPerSystem](self, "macos_isPerSystem"))
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TCCDService macos_isPerSystem](self, "macos_isPerSystem")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v22,  @"macos_isPerSystem");
  }

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService macos_hardenedRuntimeEntitlementName](self, "macos_hardenedRuntimeEntitlementName"));

  if (v23)
  {
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService macos_hardenedRuntimeEntitlementName](self, "macos_hardenedRuntimeEntitlementName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v24,  @"macos_hardenedRuntimeEntitlementName");
  }

  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService macos_minimumSDKVersionNumber](self, "macos_minimumSDKVersionNumber"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService macos_minimumSDKVersionNumber](self, "macos_minimumSDKVersionNumber"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v26,  @"macos_minimumSDKVersionNumber");

    v28 = (void *)objc_opt_class(self, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService macos_minimumSDKVersionNumber](self, "macos_minimumSDKVersionNumber"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v28 versionStringFromDYLDVersionNumber:v29]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v30,  @"macos_minimumSDKVersionString");
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService macos_helpAnchor](self, "macos_helpAnchor"));

  if (v31)
  {
    objc_super v32 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService macos_helpAnchor](self, "macos_helpAnchor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v32,  @"macos_helpAnchor");
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService tvOS_minimumSDKVersionNumber](self, "tvOS_minimumSDKVersionNumber"));

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService tvOS_minimumSDKVersionNumber](self, "tvOS_minimumSDKVersionNumber"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v34,  @"tvOS_minimumSDKVersionNumber");

    v36 = (void *)objc_opt_class(self, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService tvOS_minimumSDKVersionNumber](self, "tvOS_minimumSDKVersionNumber"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v36 versionStringFromDYLDVersionNumber:v37]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v38,  @"tvOS_minimumSDKVersionString");
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService watchOS_minimumSDKVersionNumber](self, "watchOS_minimumSDKVersionNumber"));

  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService watchOS_minimumSDKVersionNumber](self, "watchOS_minimumSDKVersionNumber"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v40,  @"watchOS_minimumSDKVersionNumber");

    v42 = (void *)objc_opt_class(self, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService watchOS_minimumSDKVersionNumber](self, "watchOS_minimumSDKVersionNumber"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v42 versionStringFromDYLDVersionNumber:v43]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v44,  @"watchOS_minimumSDKVersionString");
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService iOS_minimumSDKVersionNumber](self, "iOS_minimumSDKVersionNumber"));

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService iOS_minimumSDKVersionNumber](self, "iOS_minimumSDKVersionNumber"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v46,  @"iOS_minimumSDKVersionNumber");

    v48 = (void *)objc_opt_class(self, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService iOS_minimumSDKVersionNumber](self, "iOS_minimumSDKVersionNumber"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v48 versionStringFromDYLDVersionNumber:v49]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v50,  @"iOS_minimumSDKVersionString");
  }

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](self, "name"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (BOOL)isAuthorizationValue:(unint64_t)a3 equalToRight:(unint64_t)a4
{
  unint64_t v6 = -[TCCDService authorizationValueType](self, "authorizationValueType");
  return a3 == a4 && v6 == 1;
}

- (id)authorizationRightStateForValue:(unint64_t)a3 reason:(unint64_t)a4
{
  if ((id)-[TCCDService authorizationValueType](self, "authorizationValueType") == (id)1)
  {
    unint64_t v6 = objc_alloc_init(&OBJC_CLASS___TCCDAuthorizationRightState);
    -[TCCDAuthorizationRightState setRight:](v6, "setRight:", a3);
    -[TCCDAuthorizationRightState setReason:](v6, "setReason:", a4);
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (id)descriptionForAuthorizationValue:(unint64_t)a3 reason:(unint64_t)a4
{
  if ((id)-[TCCDService authorizationValueType](self, "authorizationValueType") == (id)1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService authorizationRightStateForValue:reason:]( self,  "authorizationRightStateForValue:reason:",  a3,  a4));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"0x%llx", a3));
  }

  return v8;
}

- (BOOL)pardonMissingUsage
{
  return 0;
}

- (unint64_t)authorizationPromptRightsMask
{
  return -[TCCDService authorizationRightsMask](self, "authorizationRightsMask") & 0xFFFFFFFFFFFFFFFDLL;
}

- (int64_t)developmentAuthorizationValue
{
  if (!-[TCCDService applyDevelopmentAuthorizationPolicy](self, "applyDevelopmentAuthorizationPolicy")) {
    return 0LL;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](self, "name"));
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DevelopmentAuthorizationPolicy.%@",  v3));

  CFPropertyListRef v5 = CFPreferencesCopyValue(v4, @"com.apple.tccd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v5 && (v6 = (void *)v5, CFTypeID v7 = CFGetTypeID(v5), v7 == CFStringGetTypeID()))
  {
    if ([v6 caseInsensitiveCompare:@"allow"])
    {
      if ([v6 caseInsensitiveCompare:@"deny"])
      {
        [v6 caseInsensitiveCompare:@"none"];
        int64_t v8 = 0LL;
      }

      else
      {
        int64_t v8 = 2LL;
      }
    }

    else
    {
      int64_t v8 = 1LL;
    }
  }

  else
  {
    int64_t v8 = -[TCCDService defaultDevelopmentAuthorizationValue](self, "defaultDevelopmentAuthorizationValue");
  }

  return v8;
}

- (void)setLocalizedResourcesBundlePath:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  localizedResourcesBundlePath = self->_localizedResourcesBundlePath;
  self->_localizedResourcesBundlePath = v4;
}

- (NSBundle)localizedResourcesBundle
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localizedResourcesBundle)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v2->_localizedResourcesBundlePath));
    localizedResourcesBundle = v2->_localizedResourcesBundle;
    v2->_localizedResourcesBundle = (NSBundle *)v3;
  }

  objc_sync_exit(v2);

  CFPropertyListRef v5 = v2->_localizedResourcesBundle;
  if (!v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002CB68;
    block[3] = &unk_100064D50;
    block[4] = v2;
    if (qword_100078388 != -1) {
      dispatch_once(&qword_100078388, block);
    }
    CFPropertyListRef v5 = v2->_localizedResourcesBundle;
  }

  return v5;
}

+ (id)defaultLocalizedResourcesBundlePath
{
  return @"/System/Library/PrivateFrameworks/TCC.framework";
}

- (NSBundle)defaultLocalizedResourcesBundle
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_defaultLocalizedResourcesBundle)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService defaultLocalizedResourcesBundlePath]( &OBJC_CLASS___TCCDService,  "defaultLocalizedResourcesBundlePath"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v3));
    defaultLocalizedResourcesBundle = v2->_defaultLocalizedResourcesBundle;
    v2->_defaultLocalizedResourcesBundle = (NSBundle *)v4;
  }

  objc_sync_exit(v2);

  unint64_t v6 = v2->_defaultLocalizedResourcesBundle;
  if (!v6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002CCE8;
    block[3] = &unk_100064D50;
    block[4] = v2;
    if (qword_100078390 != -1) {
      dispatch_once(&qword_100078390, block);
    }
    unint64_t v6 = v2->_defaultLocalizedResourcesBundle;
  }

  return v6;
}

- (id)localizedTextWithKey:(id)a3
{
  id v4 = a3;
  CFPropertyListRef v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService localizedResourcesBundle](self, "localizedResourcesBundle"));
  unint64_t v6 = v5;
  if (v5)
  {
    CFTypeID v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v4 value:&stru_100066238 table:0]);
    if (!v7)
    {
      int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 server]);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 logHandle]);

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002DC44((uint64_t)self, (uint64_t)v4, v10);
      }
    }
  }

  else
  {
    CFTypeID v7 = 0LL;
  }

  return v7;
}

- (id)requestTitleTextLocalizationKeyForAuthorization:(unint64_t)a3
{
  switch(a3)
  {
    case 4uLL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService requestAddTitleTextLocalizationKey](self, "requestAddTitleTextLocalizationKey"));
      break;
    case 3uLL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService requestLimitedTitleTextLocalizationKey]( self,  "requestLimitedTitleTextLocalizationKey"));
      break;
    case 2uLL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService requestFullTitleTextLocalizationKey](self, "requestFullTitleTextLocalizationKey"));
      break;
    default:
      uint64_t v3 = 0LL;
      break;
  }

  return v3;
}

- (id)buttonTitleLocalizationKeyForAuthorization:(unint64_t)a3 desiredAuth:(unint64_t)a4
{
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService localizationKeyForButtonAuth:desiredAuth:]( self,  "localizationKeyForButtonAuth:desiredAuth:",  a3,  a4));
  if (!v6)
  {
    switch(a3)
    {
      case 0uLL:
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService denyAuthorizationButtonTitleLocalizationKey]( self,  "denyAuthorizationButtonTitleLocalizationKey"));
        break;
      case 2uLL:
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService allowAuthorizationButtonTitleLocalizationKey]( self,  "allowAuthorizationButtonTitleLocalizationKey"));
        break;
      case 3uLL:
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService limitedAuthorizationButtonTitleLocalizationKey]( self,  "limitedAuthorizationButtonTitleLocalizationKey"));
        break;
      case 4uLL:
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService addModifyAddedAuthorizationButtonTitleLocalizationKey]( self,  "addModifyAddedAuthorizationButtonTitleLocalizationKey"));
        break;
      case 5uLL:
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService sessionPidAuthorizationButtonTitleLocalizationKey]( self,  "sessionPidAuthorizationButtonTitleLocalizationKey"));
        break;
      case 6uLL:
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService moreAuthorizationOptionsButtonTitleLocalizationKey]( self,  "moreAuthorizationOptionsButtonTitleLocalizationKey"));
        break;
      default:
        return v6;
    }
  }

  return v6;
}

- (id)usageDescriptionKeyForAuthorization:(unint64_t)a3
{
  if (a3 == 4)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService addAccessUsageDescriptionKeyName](self, "addAccessUsageDescriptionKeyName"));
  }

  else if (a3 == 2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService fullAccessUsageDescriptionKeyName](self, "fullAccessUsageDescriptionKeyName"));
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (int)authorizationChoicesForCurrentAuth:(unint64_t)a3 desiredAuth:(unint64_t)a4 aButtonAuth:(unint64_t *)a5 bButtonAuth:(unint64_t *)a6 cButtonAuth:(unint64_t *)a7
{
  return (*((uint64_t (**)(void))self->_promptAuthorizationChoiceBlock + 2))();
}

- (id)localizationKeyForButtonAuth:(unint64_t)a3 desiredAuth:(unint64_t)a4
{
  return (id)(*((uint64_t (**)(void))self->_promptButtonLocalizationKeyBlock + 2))();
}

- (unint64_t)translateAuth:(unint64_t)a3 versionUpgrade:(BOOL)a4
{
  return (*((uint64_t (**)(void))self->_syncAuthorizationTranslationBlock + 2))();
}

- (id)populateRecordMetricWithFields:(id)a3
{
  return (id)(*((uint64_t (**)(void))self->_recordAnalyticsPopulationBlock + 2))();
}

- (BOOL)getUsesTwoStagePrompting
{
  return self->_usesTwoStagePrompting;
}

- (void)setUsesTwoStagePrompting:(BOOL)a3
{
  self->_usesTwoStagePrompting = a3;
}

- (NSDictionary)platformAvailability
{
  return self->_platformAvailability;
}

- (void)setPlatformAvailability:(id)a3
{
}

- (NSSet)validOnPlatformNames
{
  return self->_validOnPlatformNames;
}

- (void)setValidOnPlatformNames:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)externalName
{
  return self->_externalName;
}

- (void)setExternalName:(id)a3
{
}

- (BOOL)shouldTreatAsDeprecated
{
  return self->_shouldTreatAsDeprecated;
}

- (void)setShouldTreatAsDeprecated:(BOOL)a3
{
  self->_shouldTreatAsDeprecated = a3;
}

- (BOOL)mdm_isAuthorizationDenyOnly
{
  return self->_mdm_isAuthorizationDenyOnly;
}

- (void)setMdm_isAuthorizationDenyOnly:(BOOL)a3
{
  self->_mdm_isAuthorizationDenyOnly = a3;
}

- (BOOL)mdm_macos_allowedInPayloadDefition
{
  return self->_mdm_macos_allowedInPayloadDefition;
}

- (void)setMdm_macos_allowedInPayloadDefition:(BOOL)a3
{
  self->_mdm_macos_allowedInPayloadDefition = a3;
}

- (BOOL)mdm_allowStandardUserToSetSystemService
{
  return self->_mdm_allowStandardUserToSetSystemService;
}

- (void)setMdm_allowStandardUserToSetSystemService:(BOOL)a3
{
  self->_mdm_allowStandardUserToSetSystemService = a3;
}

- (NSString)usageDescriptionKeyName
{
  return self->_usageDescriptionKeyName;
}

- (void)setUsageDescriptionKeyName:(id)a3
{
}

- (NSString)secondaryUsageDescriptionKeyName
{
  return self->_secondaryUsageDescriptionKeyName;
}

- (void)setSecondaryUsageDescriptionKeyName:(id)a3
{
}

- (NSString)fullAccessUsageDescriptionKeyName
{
  return self->_fullAccessUsageDescriptionKeyName;
}

- (void)setFullAccessUsageDescriptionKeyName:(id)a3
{
}

- (NSString)addAccessUsageDescriptionKeyName
{
  return self->_addAccessUsageDescriptionKeyName;
}

- (void)setAddAccessUsageDescriptionKeyName:(id)a3
{
}

- (BOOL)shouldUseADefaultDescriptionString
{
  return self->_shouldUseADefaultDescriptionString;
}

- (void)setShouldUseADefaultDescriptionString:(BOOL)a3
{
  self->_shouldUseADefaultDescriptionString = a3;
}

- (NSArray)disallowedOnPlatformSubtypeNameList
{
  return self->_disallowedOnPlatformSubtypeNameList;
}

- (void)setDisallowedOnPlatformSubtypeNameList:(id)a3
{
}

- (BOOL)shouldIssueSandboxExtension
{
  return self->_shouldIssueSandboxExtension;
}

- (void)setShouldIssueSandboxExtension:(BOOL)a3
{
  self->_shouldIssueSandboxExtension = a3;
}

- (BOOL)ios_useGenericSandboxExtension
{
  return self->_ios_useGenericSandboxExtension;
}

- (void)setIos_useGenericSandboxExtension:(BOOL)a3
{
  self->_ios_useGenericSandboxExtension = a3;
}

- (BOOL)isRevocable
{
  return self->_isRevocable;
}

- (void)setIsRevocable:(BOOL)a3
{
  self->_isRevocable = a3;
}

- (int64_t)alertStyle
{
  return self->_alertStyle;
}

- (void)setAlertStyle:(int64_t)a3
{
  self->_alertStyle = a3;
}

- (BOOL)isAccessAllowedByDefault
{
  return self->_isAccessAllowedByDefault;
}

- (void)setIsAccessAllowedByDefault:(BOOL)a3
{
  self->_isAccessAllowedByDefault = a3;
}

- (BOOL)isAccessDeniedByDefault
{
  return self->_isAccessDeniedByDefault;
}

- (void)setIsAccessDeniedByDefault:(BOOL)a3
{
  self->_isAccessDeniedByDefault = a3;
}

- (BOOL)allowPromptForPlatformBinaries
{
  return self->_allowPromptForPlatformBinaries;
}

- (void)setAllowPromptForPlatformBinaries:(BOOL)a3
{
  self->_allowPromptForPlatformBinaries = a3;
}

- (BOOL)shouldAllowUnrestrictedCheckAuditToken
{
  return self->_shouldAllowUnrestrictedCheckAuditToken;
}

- (void)setShouldAllowUnrestrictedCheckAuditToken:(BOOL)a3
{
  self->_shouldAllowUnrestrictedCheckAuditToken = a3;
}

- (BOOL)hasParanoidSecurityPolicy
{
  return self->_hasParanoidSecurityPolicy;
}

- (void)setHasParanoidSecurityPolicy:(BOOL)a3
{
  self->_hasParanoidSecurityPolicy = a3;
}

- (NSURL)notificationActionURL
{
  return self->_notificationActionURL;
}

- (void)setNotificationActionURL:(id)a3
{
}

- (NSString)sandboxOperationForDelegation
{
  return self->_sandboxOperationForDelegation;
}

- (void)setSandboxOperationForDelegation:(id)a3
{
}

- (NSArray)defaultAllowedPlatformIdentifiersList
{
  return self->_defaultAllowedPlatformIdentifiersList;
}

- (void)setDefaultAllowedPlatformIdentifiersList:(id)a3
{
}

- (BOOL)doNotStoreDefaultAllowAccess
{
  return self->_doNotStoreDefaultAllowAccess;
}

- (void)setDoNotStoreDefaultAllowAccess:(BOOL)a3
{
  self->_doNotStoreDefaultAllowAccess = a3;
}

- (NSNumber)expirySeconds
{
  return self->_expirySeconds;
}

- (void)setExpirySeconds:(id)a3
{
}

- (BOOL)expireOnlyAllowedEntries
{
  return self->_expireOnlyAllowedEntries;
}

- (void)setExpireOnlyAllowedEntries:(BOOL)a3
{
  self->_expireOnlyAllowedEntries = a3;
}

- (BOOL)saveExpiredEntries
{
  return self->_saveExpiredEntries;
}

- (void)setSaveExpiredEntries:(BOOL)a3
{
  self->_saveExpiredEntries = a3;
}

- (BOOL)usesTwoStagePrompting
{
  return self->_usesTwoStagePrompting;
}

- (NSString)firstStagePromptHeaderAssetCatalogPath
{
  return self->_firstStagePromptHeaderAssetCatalogPath;
}

- (void)setFirstStagePromptHeaderAssetCatalogPath:(id)a3
{
}

- (NSString)firstStagePromptHeaderAssetName
{
  return self->_firstStagePromptHeaderAssetName;
}

- (void)setFirstStagePromptHeaderAssetName:(id)a3
{
}

- (BOOL)applyDevelopmentAuthorizationPolicy
{
  return self->_applyDevelopmentAuthorizationPolicy;
}

- (void)setApplyDevelopmentAuthorizationPolicy:(BOOL)a3
{
  self->_applyDevelopmentAuthorizationPolicy = a3;
}

- (int64_t)defaultDevelopmentAuthorizationValue
{
  return self->_defaultDevelopmentAuthorizationValue;
}

- (void)setDefaultDevelopmentAuthorizationValue:(int64_t)a3
{
  self->_defaultDevelopmentAuthorizationValue = a3;
}

- (BOOL)checkAllowEntitlementOnResponsibleProcess
{
  return self->_checkAllowEntitlementOnResponsibleProcess;
}

- (void)setCheckAllowEntitlementOnResponsibleProcess:(BOOL)a3
{
  self->_checkAllowEntitlementOnResponsibleProcess = a3;
}

- (TCCDAlertManager)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
}

- (unint64_t)authorizationValueType
{
  return self->_authorizationValueType;
}

- (void)setAuthorizationValueType:(unint64_t)a3
{
  self->_authorizationValueType = a3;
}

- (unint64_t)authorizationRightsMask
{
  return self->_authorizationRightsMask;
}

- (void)setAuthorizationRightsMask:(unint64_t)a3
{
  self->_authorizationRightsMask = a3;
}

- (BOOL)upgradeV1AuthorizationValue
{
  return self->_upgradeV1AuthorizationValue;
}

- (void)setUpgradeV1AuthorizationValue:(BOOL)a3
{
  self->_upgradeV1AuthorizationValue = a3;
}

- (unint64_t)authorizationVersionNumber
{
  return self->_authorizationVersionNumber;
}

- (void)setAuthorizationVersionNumber:(unint64_t)a3
{
  self->_authorizationVersionNumber = a3;
}

- (NSString)localizedResourcesBundlePath
{
  return self->_localizedResourcesBundlePath;
}

- (void)setLocalizedResourcesBundle:(id)a3
{
}

- (void)setDefaultLocalizedResourcesBundle:(id)a3
{
}

- (NSString)allowAuthorizationButtonTitleLocalizationKey
{
  return self->_allowAuthorizationButtonTitleLocalizationKey;
}

- (void)setAllowAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)denyAuthorizationButtonTitleLocalizationKey
{
  return self->_denyAuthorizationButtonTitleLocalizationKey;
}

- (void)setDenyAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)moreAuthorizationOptionsButtonTitleLocalizationKey
{
  return self->_moreAuthorizationOptionsButtonTitleLocalizationKey;
}

- (NSString)limitedAuthorizationButtonTitleLocalizationKey
{
  return self->_limitedAuthorizationButtonTitleLocalizationKey;
}

- (void)setLimitedAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)addModifyAddedAuthorizationButtonTitleLocalizationKey
{
  return self->_addModifyAddedAuthorizationButtonTitleLocalizationKey;
}

- (void)setAddModifyAddedAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)sessionPidAuthorizationButtonTitleLocalizationKey
{
  return self->_sessionPidAuthorizationButtonTitleLocalizationKey;
}

- (void)setSessionPidAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)cancelButtontitleLocalizationKey
{
  return self->_cancelButtontitleLocalizationKey;
}

- (void)setCancelButtontitleLocalizationKey:(id)a3
{
}

- (NSString)subsequentRequestAllowAuthorizationButtonTitleLocalizationKey
{
  return self->_subsequentRequestAllowAuthorizationButtonTitleLocalizationKey;
}

- (void)setSubsequentRequestAllowAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)subsequentRequestDenyAuthorizationButtonTitleLocalizationKey
{
  return self->_subsequentRequestDenyAuthorizationButtonTitleLocalizationKey;
}

- (void)setSubsequentRequestDenyAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)subsequentRequestLimitedAuthorizationButtonTitleLocalizationKey
{
  return self->_subsequentRequestLimitedAuthorizationButtonTitleLocalizationKey;
}

- (void)setSubsequentRequestLimitedAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)requestTitleTextLocalizationKey
{
  return self->_requestTitleTextLocalizationKey;
}

- (void)setRequestTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestTitleTextAfterV2UpgradeLocalizationKey
{
  return self->_requestTitleTextAfterV2UpgradeLocalizationKey;
}

- (void)setRequestTitleTextAfterV2UpgradeLocalizationKey:(id)a3
{
}

- (NSString)requestTitleTextForSubsequentRequestsKey
{
  return self->_requestTitleTextForSubsequentRequestsKey;
}

- (void)setRequestTitleTextForSubsequentRequestsKey:(id)a3
{
}

- (NSString)requestFullTitleTextLocalizationKey
{
  return self->_requestFullTitleTextLocalizationKey;
}

- (void)setRequestFullTitleTextLocalizationKey:(id)a3
{
}

- (NSString)settingsRequestFullTitleTextLocalizationKey
{
  return self->_settingsRequestFullTitleTextLocalizationKey;
}

- (void)setSettingsRequestFullTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestAddTitleTextLocalizationKey
{
  return self->_requestAddTitleTextLocalizationKey;
}

- (void)setRequestAddTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestLimitedTitleTextLocalizationKey
{
  return self->_requestLimitedTitleTextLocalizationKey;
}

- (void)setRequestLimitedTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestEntitlementTitleTextLocalizationKey
{
  return self->_requestEntitlementTitleTextLocalizationKey;
}

- (void)setRequestEntitlementTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestUpgradeTitleTextLocalizationKey
{
  return self->_requestUpgradeTitleTextLocalizationKey;
}

- (void)setRequestUpgradeTitleTextLocalizationKey:(id)a3
{
}

- (NSString)reminderTitleTextLocalizationKey
{
  return self->_reminderTitleTextLocalizationKey;
}

- (void)setReminderTitleTextLocalizationKey:(id)a3
{
}

- (NSString)reminderAllowButtonTitleTextLocalizationKey
{
  return self->_reminderAllowButtonTitleTextLocalizationKey;
}

- (void)setReminderAllowButtonTitleTextLocalizationKey:(id)a3
{
}

- (NSString)reminderLimitedButtonTitleTextLocalizationKey
{
  return self->_reminderLimitedButtonTitleTextLocalizationKey;
}

- (void)setReminderLimitedButtonTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestAdditionalTextLocalizationKey
{
  return self->_requestAdditionalTextLocalizationKey;
}

- (void)setRequestAdditionalTextLocalizationKey:(id)a3
{
}

- (NSString)requestAdditionalTextAfterV2UpgradeLocalizationKey
{
  return self->_requestAdditionalTextAfterV2UpgradeLocalizationKey;
}

- (void)setRequestAdditionalTextAfterV2UpgradeLocalizationKey:(id)a3
{
}

- (NSString)requestAdditionalTextForSubsequentRequestsLocalizationKey
{
  return self->_requestAdditionalTextForSubsequentRequestsLocalizationKey;
}

- (void)setRequestAdditionalTextForSubsequentRequestsLocalizationKey:(id)a3
{
}

- (NSString)requestNotificationExtensionTextLocalizationKey
{
  return self->_requestNotificationExtensionTextLocalizationKey;
}

- (void)setRequestNotificationExtensionTextLocalizationKey:(id)a3
{
}

- (TCCDService)subsequentRequestStringsRelatedService
{
  return (TCCDService *)objc_loadWeakRetained((id *)&self->_subsequentRequestStringsRelatedService);
}

- (void)setSubsequentRequestStringsRelatedService:(id)a3
{
}

- (NSString)notificationTitleTextLocalizationKey
{
  return self->_notificationTitleTextLocalizationKey;
}

- (void)setNotificationTitleTextLocalizationKey:(id)a3
{
}

- (NSString)notificationButtonTitleLocalizationKey
{
  return self->_notificationButtonTitleLocalizationKey;
}

- (void)setNotificationButtonTitleLocalizationKey:(id)a3
{
}

- (NSNumber)ios_watchKitUserNotificationNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 464LL, 1);
}

- (void)setIos_watchKitUserNotificationNumber:(id)a3
{
}

- (NSNumber)iOS_minimumSDKVersionNumber
{
  return self->_iOS_minimumSDKVersionNumber;
}

- (void)setIOS_minimumSDKVersionNumber:(id)a3
{
}

- (NSNumber)watchOS_minimumSDKVersionNumber
{
  return self->_watchOS_minimumSDKVersionNumber;
}

- (void)setWatchOS_minimumSDKVersionNumber:(id)a3
{
}

- (NSNumber)tvOS_minimumSDKVersionNumber
{
  return self->_tvOS_minimumSDKVersionNumber;
}

- (void)setTvOS_minimumSDKVersionNumber:(id)a3
{
}

- (NSNumber)vOS_minimumSDKVersionNumber
{
  return self->_vOS_minimumSDKVersionNumber;
}

- (void)setVOS_minimumSDKVersionNumber:(id)a3
{
}

- (NSDictionary)iOS_minimumSDKVersionNumberAuthSpecific
{
  return self->_iOS_minimumSDKVersionNumberAuthSpecific;
}

- (void)setIOS_minimumSDKVersionNumberAuthSpecific:(id)a3
{
}

- (NSDictionary)watchOS_minimumSDKVersionNumberAuthSpecific
{
  return self->_watchOS_minimumSDKVersionNumberAuthSpecific;
}

- (void)setWatchOS_minimumSDKVersionNumberAuthSpecific:(id)a3
{
}

- (NSDictionary)tvOS_minimumSDKVersionNumberAuthSpecific
{
  return self->_tvOS_minimumSDKVersionNumberAuthSpecific;
}

- (void)setTvOS_minimumSDKVersionNumberAuthSpecific:(id)a3
{
}

- (NSDictionary)vOS_minimumSDKVersionNumberAuthSpecific
{
  return self->_vOS_minimumSDKVersionNumberAuthSpecific;
}

- (void)setVOS_minimumSDKVersionNumberAuthSpecific:(id)a3
{
}

- (unint64_t)defaultDesiredAuth
{
  return self->_defaultDesiredAuth;
}

- (void)setDefaultDesiredAuth:(unint64_t)a3
{
  self->_defaultDesiredAuth = a3;
}

- (BOOL)ios_allowPromptFromAppClip
{
  return self->_ios_allowPromptFromAppClip;
}

- (void)setIos_allowPromptFromAppClip:(BOOL)a3
{
  self->_ios_allowPromptFromAppClip = a3;
}

- (BOOL)ios_allowRegionalPrompt
{
  return self->_ios_allowRegionalPrompt;
}

- (void)setIos_allowRegionalPrompt:(BOOL)a3
{
  self->_ios_allowRegionalPrompt = a3;
}

- (BOOL)allowedForAvocadoWidget
{
  return self->_allowedForAvocadoWidget;
}

- (void)setAllowedForAvocadoWidget:(BOOL)a3
{
  self->_allowedForAvocadoWidget = a3;
}

- (BOOL)supportsStagedPrompting
{
  return self->_supportsStagedPrompting;
}

- (void)setSupportsStagedPrompting:(BOOL)a3
{
  self->_supportsStagedPrompting = a3;
}

- (unint64_t)downgradeAuthRight
{
  return self->_downgradeAuthRight;
}

- (void)setDowngradeAuthRight:(unint64_t)a3
{
  self->_downgradeAuthRight = a3;
}

- (NSDictionary)authSpecificNotificationExtensionBundleIdentifier
{
  return self->_authSpecificNotificationExtensionBundleIdentifier;
}

- (void)setAuthSpecificNotificationExtensionBundleIdentifier:(id)a3
{
}

- (NSString)alternatePromptTitleEntitlement
{
  return self->_alternatePromptTitleEntitlement;
}

- (void)setAlternatePromptTitleEntitlement:(id)a3
{
}

- (NSNumber)macos_minimumSDKVersionNumber
{
  return self->_macos_minimumSDKVersionNumber;
}

- (void)setMacos_minimumSDKVersionNumber:(id)a3
{
}

- (NSDictionary)macos_minimumSDKVersionNumberAuthSpecific
{
  return self->_macos_minimumSDKVersionNumberAuthSpecific;
}

- (void)setMacos_minimumSDKVersionNumberAuthSpecific:(id)a3
{
}

- (BOOL)macos_pardonMissingUsage
{
  return self->_macos_pardonMissingUsage;
}

- (void)setMacos_pardonMissingUsage:(BOOL)a3
{
  self->_macos_pardonMissingUsage = a3;
}

- (NSString)macos_helpAnchor
{
  return self->_macos_helpAnchor;
}

- (void)setMacos_helpAnchor:(id)a3
{
}

- (BOOL)macos_isPerSystem
{
  return self->_macos_isPerSystem;
}

- (void)setMacos_isPerSystem:(BOOL)a3
{
  self->_macos_isPerSystem = a3;
}

- (TCCDService)macos_compositionChildService
{
  return (TCCDService *)objc_loadWeakRetained((id *)&self->_macos_compositionChildService);
}

- (void)setMacos_compositionChildService:(id)a3
{
}

- (BOOL)macos_compositionPromoteChildAuthorizationToParent
{
  return self->_macos_compositionPromoteChildAuthorizationToParent;
}

- (void)setMacos_compositionPromoteChildAuthorizationToParent:(BOOL)a3
{
  self->_macos_compositionPromoteChildAuthorizationToParent = a3;
}

- (TCCDService)macos_compositionParentService
{
  return (TCCDService *)objc_loadWeakRetained((id *)&self->_macos_compositionParentService);
}

- (void)setMacos_compositionParentService:(id)a3
{
}

- (BOOL)macos_hasIndirectObject
{
  return self->_macos_hasIndirectObject;
}

- (void)setMacos_hasIndirectObject:(BOOL)a3
{
  self->_macos_hasIndirectObject = a3;
}

- (BOOL)macos_shouldAllowSameTeam
{
  return self->_macos_shouldAllowSameTeam;
}

- (void)setMacos_shouldAllowSameTeam:(BOOL)a3
{
  self->_macos_shouldAllowSameTeam = a3;
}

- (NSString)macos_hardenedRuntimeEntitlementName
{
  return self->_macos_hardenedRuntimeEntitlementName;
}

- (void)setMacos_hardenedRuntimeEntitlementName:(id)a3
{
}

- (int64_t)macos_AXControlComputerAccessType
{
  return self->_macos_AXControlComputerAccessType;
}

- (void)setMacos_AXControlComputerAccessType:(int64_t)a3
{
  self->_macos_AXControlComputerAccessType = a3;
}

- (id)promptAuthorizationChoiceBlock
{
  return objc_getProperty(self, a2, 624LL, 1);
}

- (void)setPromptAuthorizationChoiceBlock:(id)a3
{
}

- (id)promptButtonLocalizationKeyBlock
{
  return objc_getProperty(self, a2, 632LL, 1);
}

- (void)setPromptButtonLocalizationKeyBlock:(id)a3
{
}

- (id)syncAuthorizationTranslationBlock
{
  return objc_getProperty(self, a2, 640LL, 1);
}

- (void)setSyncAuthorizationTranslationBlock:(id)a3
{
}

- (id)recordAnalyticsPopulationBlock
{
  return objc_getProperty(self, a2, 648LL, 1);
}

- (void)setRecordAnalyticsPopulationBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end