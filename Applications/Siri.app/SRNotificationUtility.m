@interface SRNotificationUtility
+ (id)_deviceSpecificStringForDefaultString:(id)a3;
+ (id)_downloadAssetsNotificationRequest;
+ (id)_downloadSiriAdvancedFeaturesAssetsNotificationRequest;
+ (id)_siriUnvailableNotificationRequest;
+ (id)_userNotificationCenter;
+ (void)_postNotificationRequest:(id)a3 notificationCenter:(id)a4 destinations:(unint64_t)a5;
+ (void)postSiriAdvancedFeaturesAssetsDownloadNotification;
+ (void)postSiriUnavailableNotification:(unint64_t)a3;
+ (void)postStorageLowNotification;
@end

@implementation SRNotificationUtility

+ (id)_userNotificationCenter
{
  return  -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.siri");
}

+ (id)_siriUnvailableNotificationRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.siri"));
  v4 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 siriUILocalizedStringForKey:@"ASSISTANT_NOT_AVAILABLE_TITLE"]);
  -[UNMutableNotificationContent setTitle:](v4, "setTitle:", v5);

  -[UNMutableNotificationContent setShouldSuppressDefaultAction:](v4, "setShouldSuppressDefaultAction:", 1LL);
  -[UNMutableNotificationContent setShouldIgnoreDoNotDisturb:](v4, "setShouldIgnoreDoNotDisturb:", 1LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 _deviceSpecificStringForDefaultString:@"ASSISTANT_NO_NETWORK_SUBTITLE_NOTIFICATION"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFCachedPreferences sharedInstance](&OBJC_CLASS___SRUIFCachedPreferences, "sharedInstance"));
  unsigned int v8 = [v7 understandingOnDeviceAssetsAvailable];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  unsigned int v10 = objc_msgSend(v9, "sf_isChinaRegionCellularDevice");

  if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled]( &OBJC_CLASS___AFSystemAssistantExperienceStatusManager,  "isSAEEnabled")) {
    unsigned int v8 = +[GMSCompatabilityWrapper siriGMAssetsAvailable]( &OBJC_CLASS___GMSCompatabilityWrapper,  "siriGMAssetsAvailable");
  }
  if (!+[AFFeatureFlags isNLServerFallbackDisabled]( &OBJC_CLASS___AFFeatureFlags,  "isNLServerFallbackDisabled")
    || (v8 & 1) != 0)
  {
    if (+[AFConnection isAvailable](&OBJC_CLASS___AFConnection, "isAvailable")
      && ((+[AFConnection isNetworkAvailable](&OBJC_CLASS___AFConnection, "isNetworkAvailable") | v8) & 1) == 0)
    {
      if (v10) {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION" stringByAppendingString:@"_CHINA"]);
      }
      else {
        v14 = @"ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION";
      }
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v3 siriUILocalizedStringForKey:v14]);

      v6 = (void *)v18;
    }
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFCachedPreferences sharedInstance](&OBJC_CLASS___SRUIFCachedPreferences, "sharedInstance"));
    unsigned __int8 v12 = [v11 assetsDownloading];

    if ((v12 & 1) != 0)
    {
      v13 = @"ASSISTANT_NO_LOCAL_ASSETS_DOWNLOADING_SUBTITLE_NOTIFICATION";
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFCachedPreferences sharedInstance](&OBJC_CLASS___SRUIFCachedPreferences, "sharedInstance"));
      unsigned int v16 = [v15 assetsNeedSpace];

      if (v16) {
        v13 = @"ASSISTANT_NO_LOCAL_ASSETS_NO_SPACE_SUBTITLE_NOTIFICATION";
      }
      else {
        v13 = @"ASSISTANT_NO_LOCAL_ASSETS_NO_WIFI_SUBTITLE_NOTIFICATION_CHINA";
      }
      if (((v16 | v10) & 1) == 0)
      {
        if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled]( &OBJC_CLASS___AFSystemAssistantExperienceStatusManager,  "isSAEEnabled",  v13))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue([v3 siriUILocalizedStringForKey:@"ASSISTANT_NO_LOCAL_ASSETS_SAE_TITLE"]);
          -[UNMutableNotificationContent setTitle:](v4, "setTitle:", v17);

          v13 = @"ASSISTANT_NO_LOCAL_ASSETS_SAE_SUBTITLE_NOTIFICATION";
        }

        else
        {
          v13 = @"ASSISTANT_NO_LOCAL_ASSETS_NO_WIFI_SUBTITLE_NOTIFICATION";
        }
      }
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue([v3 siriUILocalizedStringForKey:v13]);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=SIRI"));
    -[UNMutableNotificationContent setDefaultActionURL:](v4, "setDefaultActionURL:", v20);

    -[UNMutableNotificationContent setHasDefaultAction:](v4, "setHasDefaultAction:", 1LL);
    v6 = (void *)v19;
  }

  -[UNMutableNotificationContent setBody:](v4, "setBody:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  @"com.apple.siri.notification.unavailablecontent",  v4,  0LL));

  return v21;
}

+ (id)_deviceSpecificStringForDefaultString:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.siri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SiriUIUtilities deviceSpecificKeyForDefaultKey:]( &OBJC_CLASS___SiriUIUtilities,  "deviceSpecificKeyForDefaultKey:",  v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 siriUILocalizedStringForKey:v5]);
  return v6;
}

+ (void)postSiriUnavailableNotification:(unint64_t)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 _siriUnvailableNotificationRequest]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _userNotificationCenter]);
  [a1 _postNotificationRequest:v6 notificationCenter:v5 destinations:a3];
}

+ (void)_postNotificationRequest:(id)a3 notificationCenter:(id)a4 destinations:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  [v7 setDestinations:a5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100044348;
  v10[3] = &unk_1000BB1F0;
  id v11 = v7;
  id v9 = v7;
  [v8 addNotificationRequest:v9 withCompletionHandler:v10];
}

+ (id)_downloadAssetsNotificationRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.siri"));
  v4 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 siriUILocalizedStringForKey:@"DOWNLOAD_ASSETS_TITLE"]);
  -[UNMutableNotificationContent setTitle:](v4, "setTitle:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 _deviceSpecificStringForDefaultString:@"DOWNLOAD_ASSETS_SUBTITLE_NOTIFICATION"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 siriUILocalizedStringForKey:v6]);
  -[UNMutableNotificationContent setBody:](v4, "setBody:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=SIRI"));
  -[UNMutableNotificationContent setDefaultActionURL:](v4, "setDefaultActionURL:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  @"com.apple.siri.notification.downloadassets",  v4,  0LL));
  return v9;
}

+ (void)postStorageLowNotification
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a1 _downloadAssetsNotificationRequest]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _userNotificationCenter]);
  [a1 _postNotificationRequest:v4 notificationCenter:v3 destinations:7];
}

+ (id)_downloadSiriAdvancedFeaturesAssetsNotificationRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.siri"));
  id v3 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 siriUILocalizedStringForKey:@"DOWNLOAD_ASSETS_TITLE"]);
  -[UNMutableNotificationContent setTitle:](v3, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue( [v2 siriUILocalizedStringForKey:@"DOWNLOAD_ADVANCED_FEATURES_ASSETS_SUBTITLE_NOTIFICATION"]);
  -[UNMutableNotificationContent setBody:](v3, "setBody:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=SIRI"));
  -[UNMutableNotificationContent setDefaultActionURL:](v3, "setDefaultActionURL:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  @"com.apple.siri.notification.downloadassets",  v3,  0LL));
  return v7;
}

+ (void)postSiriAdvancedFeaturesAssetsDownloadNotification
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a1 _downloadSiriAdvancedFeaturesAssetsNotificationRequest]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _userNotificationCenter]);
  [a1 _postNotificationRequest:v4 notificationCenter:v3 destinations:7];
}

@end