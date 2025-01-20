@interface PBApplicationInfo
+ (id)_appsPinnedToFullDisplay;
+ (id)_defaultAppsSupportingExtendedAspectRatios;
+ (id)_entitlementKeys;
+ (id)_infoPlistKeys;
- (BOOL)hasAllowIconVisibilityChangesEntitlement;
- (BOOL)hasGetCurrentUserEntitlement;
- (BOOL)hasModeSwitchEntitlement;
- (BOOL)hasRunAsCurrentUserEntitlement;
- (BOOL)hasTemplateLaunchImage;
- (BOOL)iconVisibilitySetByPreference;
- (BOOL)isAlwaysAvailable;
- (BOOL)isAppleApplication;
- (BOOL)isArcadeApplication;
- (BOOL)isArcherLinked;
- (BOOL)isCloudDemoted;
- (BOOL)isDisabledByPlist;
- (BOOL)isGameCenterEnabled;
- (BOOL)isInstalledByMagellan;
- (BOOL)isLaunchableDuringSetup;
- (BOOL)isLegacyContentPartnerApp;
- (BOOL)isLicensedToDevice;
- (BOOL)isPinnedToFullDisplay;
- (BOOL)isSystemApplication;
- (BOOL)isUsingCloudKit;
- (BOOL)isViewService;
- (BOOL)isXcodeApp;
- (BOOL)receivesLongPressPlayPause;
- (BOOL)shouldIgnoreSupportedPlaybackRates;
- (BOOL)supportsActiveRouteNowPlaying;
- (BOOL)supportsBrowsingChannelGuideUserActivityType;
- (BOOL)supportsExtendedAspectRatiosForContentPlayback;
- (BOOL)supportsHDR;
- (BOOL)supportsSharePlay;
- (BOOL)supportsSharedQueue;
- (NSNumber)genreID;
- (NSSet)iconVisibilityDefaultVisibleInstallTypes;
- (NSString)alternateIconName;
- (NSString)iconFile;
- (NSString)launchImageName;
- (NSString)liveIconName;
- (NSString)localizedName;
- (NSString)managedApplicationPersona;
- (NSString)nowPlayingViewControllerClassName;
- (NSString)primaryIconName;
- (NSString)topShelfStaticImageName;
- (id)getEntitlementValueUncached:(id)a3 ofClass:(Class)a4;
- (id)getInfoPlistValueUncached:(id)a3;
- (unsigned)iconVisibilityDefaultVisible;
- (void)_loadFromProxy:(id)a3;
- (void)_refreshLocalizedName;
- (void)_refreshRunsAsCurrentUser;
- (void)pb_reportUntrustedLaunchAttempt;
- (void)setAlternateIconName:(id)a3;
@end

@implementation PBApplicationInfo

- (void)_loadFromProxy:(id)a3
{
  id v4 = a3;
  v96.receiver = self;
  v96.super_class = (Class)&OBJC_CLASS___PBApplicationInfo;
  -[PBApplicationInfo _loadFromProxy:](&v96, "_loadFromProxy:", v4);
  id v5 = [(id)objc_opt_class(self) _entitlementKeys];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 entitlementValuesForKeys:v6]);

  Unique = (__CFBundle *)_CFBundleCreateUnique(kCFAllocatorDefault, [v4 bundleURL]);
  if (Unique)
  {
    v9 = Unique;
    CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(Unique);
    v11 = (void *)objc_claimAutoreleasedReturnValue(InfoDictionary);
    id v12 = objc_alloc(&OBJC_CLASS___LSBundleInfoCachedValues);
    id v13 = [(id)objc_opt_class(self) _infoPlistKeys];
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = [v12 _initWithKeys:v14 forDictionary:v11];

    CFRelease(v9);
  }

  else
  {
    id v15 = 0LL;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 appState]);
  self->_alwaysAvailable = [v16 isAlwaysAvailable];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 numberForKey:@"SBIconVisibilitySetByAppPreference"]);
  self->_iconVisibilitySetByPreference = [v17 BOOLValue];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 numberForKey:@"SBIconVisibilityDefaultVisible"]);
  v90 = v18;
  if (v18)
  {
    else {
      unsigned __int8 v19 = 2;
    }
  }

  else
  {
    unsigned __int8 v19 = 0;
  }

  self->_iconVisibilityDefaultVisible = v19;
  id v20 = [v15 arrayForKey:@"SBIconVisibilityDefaultVisibleInstallTypes" withValuesOfClass:objc_opt_class(NSString)];
  id v21 = (id)objc_claimAutoreleasedReturnValue(v20);
  v91 = v4;
  if (v21) {
    v22 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v21);
  }
  else {
    v22 = 0LL;
  }
  objc_storeStrong((id *)&self->_iconVisibilityDefaultVisibleInstallTypes, v22);
  v89 = v21;
  if (v21) {

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue([v15 numberForKey:@"disabled"]);
  self->_disabledByPlist = [v23 BOOLValue];

  id v24 = [v15 arrayForKey:@"UILaunchImages" withValuesOfClass:objc_opt_class(NSDictionary)];
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  id v25 = (id)objc_claimAutoreleasedReturnValue(v24);
  id v26 = [v25 countByEnumeratingWithState:&v92 objects:v97 count:16];
  if (v26)
  {
    id v21 = v26;
    uint64_t v27 = *(void *)v93;
    while (2)
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v93 != v27) {
          objc_enumerationMutation(v25);
        }
        v29 = *(void **)(*((void *)&v92 + 1) + 8LL * (void)i);
        v30 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tvs_stringForKey:", @"UILaunchImageSize"));
        v31 = v30;
        if (v30)
        {
          CGSize v32 = CGSizeFromString(v30);
          if (v32.width + -1920.0 < 0.00000011920929 && v32.height + -1080.0 < 0.00000011920929)
          {
            v34 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tvs_stringForKey:", @"UILaunchImageName"));
            launchImageName = self->_launchImageName;
            self->_launchImageName = v34;

            goto LABEL_28;
          }
        }
      }

      id v21 = [v25 countByEnumeratingWithState:&v92 objects:v97 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

- (BOOL)isSystemApplication
{
  return (unint64_t)-[PBApplicationInfo type](self, "type") < 2;
}

- (BOOL)isAppleApplication
{
  if (-[PBApplicationInfo isSystemApplication](self, "isSystemApplication")) {
    return 1;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationInfo bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v4 hasPrefix:@"com.apple."];

  return v3;
}

- (void)setAlternateIconName:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000A1600;
  v4[3] = &unk_1003CFEB8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[PBApplicationInfo _synchronize:](v5, "_synchronize:", v4);
}

- (BOOL)shouldIgnoreSupportedPlaybackRates
{
  return -[PBApplicationInfo builtOnOrAfterSDKVersion:]( self,  "builtOnOrAfterSDKVersion:",  @"15.1") ^ 1;
}

- (id)getInfoPlistValueUncached:(id)a3
{
  id v4 = a3;
  Unique = (__CFBundle *)_CFBundleCreateUnique(kCFAllocatorDefault, -[PBApplicationInfo bundleURL](self, "bundleURL"));
  if (Unique)
  {
    id v6 = Unique;
    CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(Unique);
    v8 = (void *)objc_claimAutoreleasedReturnValue(InfoDictionary);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v4]);
    CFRelease(v6);
  }

  else
  {
    id v10 = sub_100082574();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_100279E90(self, (os_log_s *)v8);
    }
    v9 = 0LL;
  }

  return v9;
}

- (id)getEntitlementValueUncached:(id)a3 ofClass:(Class)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationInfo bundleURL](self, "bundleURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForBundleURL:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForBundleURL:",  v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 entitlementValueForKey:v6 ofClass:a4]);
  return v9;
}

- (void)_refreshLocalizedName
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000A17EC;
  v2[3] = &unk_1003CFF08;
  v2[4] = self;
  -[PBApplicationInfo _synchronize:](self, "_synchronize:", v2);
}

- (void)_refreshRunsAsCurrentUser
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000A18BC;
  v2[3] = &unk_1003CFF08;
  v2[4] = self;
  -[PBApplicationInfo _synchronize:](self, "_synchronize:", v2);
}

+ (id)_entitlementKeys
{
  if (qword_100470888 != -1) {
    dispatch_once(&qword_100470888, &stru_1003D49F0);
  }
  return (id)qword_100470880;
}

+ (id)_infoPlistKeys
{
  if (qword_100470898 != -1) {
    dispatch_once(&qword_100470898, &stru_1003D4A10);
  }
  return (id)qword_100470890;
}

+ (id)_defaultAppsSupportingExtendedAspectRatios
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A1BFC;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004708A8 != -1) {
    dispatch_once(&qword_1004708A8, block);
  }
  return (id)qword_1004708A0;
}

+ (id)_appsPinnedToFullDisplay
{
  if (qword_1004708B8 != -1) {
    dispatch_once(&qword_1004708B8, &stru_1003D4A30);
  }
  return (id)qword_1004708B0;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isArcadeApplication
{
  return self->_arcadeApplication;
}

- (BOOL)isAlwaysAvailable
{
  return self->_alwaysAvailable;
}

- (BOOL)isDisabledByPlist
{
  return self->_disabledByPlist;
}

- (BOOL)isLegacyContentPartnerApp
{
  return self->_legacyContentPartnerApp;
}

- (BOOL)hasTemplateLaunchImage
{
  return self->_hasTemplateLaunchImage;
}

- (NSString)launchImageName
{
  return self->_launchImageName;
}

- (BOOL)receivesLongPressPlayPause
{
  return self->_receivesLongPressPlayPause;
}

- (BOOL)supportsSharedQueue
{
  return self->_supportsSharedQueue;
}

- (BOOL)supportsActiveRouteNowPlaying
{
  return self->_supportsActiveRouteNowPlaying;
}

- (NSString)nowPlayingViewControllerClassName
{
  return self->_nowPlayingViewControllerClassName;
}

- (NSString)iconFile
{
  return self->_iconFile;
}

- (NSString)primaryIconName
{
  return self->_primaryIconName;
}

- (NSString)alternateIconName
{
  return self->_alternateIconName;
}

- (NSString)liveIconName
{
  return self->_liveIconName;
}

- (BOOL)supportsHDR
{
  return self->_supportsHDR;
}

- (BOOL)supportsExtendedAspectRatiosForContentPlayback
{
  return self->_supportsExtendedAspectRatiosForContentPlayback;
}

- (BOOL)isPinnedToFullDisplay
{
  return self->_pinnedToFullDisplay;
}

- (BOOL)hasModeSwitchEntitlement
{
  return self->_hasModeSwitchEntitlement;
}

- (BOOL)isUsingCloudKit
{
  return self->_usingCloudKit;
}

- (BOOL)supportsSharePlay
{
  return self->_supportsSharePlay;
}

- (BOOL)isViewService
{
  return self->_viewService;
}

- (BOOL)isXcodeApp
{
  return self->_xcodeApp;
}

- (BOOL)isCloudDemoted
{
  return self->_cloudDemoted;
}

- (BOOL)isInstalledByMagellan
{
  return self->_installedByMagellan;
}

- (BOOL)iconVisibilitySetByPreference
{
  return self->_iconVisibilitySetByPreference;
}

- (unsigned)iconVisibilityDefaultVisible
{
  return self->_iconVisibilityDefaultVisible;
}

- (NSSet)iconVisibilityDefaultVisibleInstallTypes
{
  return self->_iconVisibilityDefaultVisibleInstallTypes;
}

- (NSString)topShelfStaticImageName
{
  return self->_topShelfStaticImageName;
}

- (BOOL)hasAllowIconVisibilityChangesEntitlement
{
  return self->_hasAllowIconVisibilityChangesEntitlement;
}

- (BOOL)hasRunAsCurrentUserEntitlement
{
  return self->_hasRunAsCurrentUserEntitlement;
}

- (NSString)managedApplicationPersona
{
  return self->_managedApplicationPersona;
}

- (BOOL)isGameCenterEnabled
{
  return self->_gameCenterEnabled;
}

- (BOOL)hasGetCurrentUserEntitlement
{
  return self->_hasGetCurrentUserEntitlement;
}

- (BOOL)isArcherLinked
{
  return self->_archerLinked;
}

- (BOOL)supportsBrowsingChannelGuideUserActivityType
{
  return self->_supportsBrowsingChannelGuideUserActivityType;
}

- (NSNumber)genreID
{
  return self->_genreID;
}

- (BOOL)isLicensedToDevice
{
  return self->_licensedToDevice;
}

- (BOOL)isLaunchableDuringSetup
{
  return self->_launchableDuringSetup;
}

- (void).cxx_destruct
{
}

- (void)pb_reportUntrustedLaunchAttempt
{
  id v3 = -[PBApplicationInfo getEntitlementValueUncached:ofClass:]( self,  "getEntitlementValueUncached:ofClass:",  @"beta-reports-active",  objc_opt_class(&OBJC_CLASS___NSNumber));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if ([v4 BOOLValue])
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v6, &stru_1003DC870);
  }

  else
  {
    if (-[PBApplicationInfo signatureState](self, "signatureState") == (id)1)
    {
      if ((-[PBApplicationInfo isUPPProvisioningProfileValidated]( self,  "isUPPProvisioningProfileValidated") & 1) != 0 || !-[PBApplicationInfo isFreeDeveloperProvisioningProfileValidated]( self,  "isFreeDeveloperProvisioningProfileValidated"))
      {
        id v15 = sub_1001C307C(@"AppProfileNotTrustedTitle", 0LL);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
        id v16 = sub_1001C307C(@"AppProfileNotTrustedBodyFormat", 0LL);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationInfo signerIdentity](self, "signerIdentity"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v11));
        id v13 = @"AppProfileNotTrustedCancel";
      }

      else
      {
        id v7 = sub_1001C307C(@"AppFreeDeveloperProfileNotTrustedTitle", 0LL);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        id v9 = sub_1001C307C(@"AppFreeDeveloperProfileNotTrustedBodyFormat", 0LL);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationInfo signerIdentity](self, "signerIdentity"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v11));
        id v13 = @"AppFreeDeveloperProfileNotTrustedCancel";
      }
    }

    else
    {
      id v14 = sub_1001C307C(@"AppProfileExpiredTitleWithNameFormat", 0LL);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationInfo displayName](self, "displayName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v11));
      id v12 = 0LL;
      id v13 = @"AppProfileExpiredOK";
    }

    id v17 = sub_1001C307C(v13, 0LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_global_t v19 = dispatch_get_global_queue(21LL, 0LL);
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v19);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001F2DF4;
    block[3] = &unk_1003D09B8;
    id v24 = v8;
    id v25 = v12;
    id v26 = v18;
    id v21 = v18;
    id v22 = v12;
    id v6 = v8;
    dispatch_async(v20, block);
  }
}

@end