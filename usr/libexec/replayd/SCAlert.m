@interface SCAlert
+ (BOOL)showAlertWithTitle:(id)a3 bodyText:(id)a4 defaultButtonText:(id)a5 secondaryButtonText:(id)a6 url:(id)a7 requireReponse:(BOOL)a8 imageURL:(id)a9;
+ (BOOL)showLegacyAPIAlertWithBundleID:(id)a3;
+ (BOOL)showPresenterOverlayPrivacyAlertWithBundleID:(id)a3;
+ (id)privacyHintUserInfoForBundleID:(id)a3 identifier:(id)a4 count:(int64_t)a5 days:(int64_t)a6;
+ (void)userAcknowledgementAlertWithBundleID:(id)a3;
@end

@implementation SCAlert

+ (void)userAcknowledgementAlertWithBundleID:(id)a3
{
  id v3 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "+[SCAlert userAcknowledgementAlertWithBundleID:]";
    __int16 v17 = 1024;
    int v18 = 31;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"SCREENCAPTUREKIT_USER_ALERT_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedAppNameFromBundleID:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedAppNameFromBundleID:",  v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"SCREENCAPTUREKIT_USER_ALERT_BODY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedAppNameFromBundleID:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedAppNameFromBundleID:",  v3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpFrameworkBundle](&OBJC_CLASS___NSBundle, "_rpFrameworkBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleURL]);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"SCREENCAPTUREKIT_USER_ALERT_OPEN_SYSTEM_PREFERENCES"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"SCREENCAPTUREKIT_USER_ALERT_ALLOW"));
  v14 = -[NSURL initFileURLWithPath:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:",  @"/System/Library/Frameworks/ReplayKit.framework/Resources/PrivacyScreenRecording.png");
  +[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]( &OBJC_CLASS___SCAlert,  "showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:",  v6,  v9,  v13,  v12,  v11,  1LL,  v14);
}

+ (BOOL)showPresenterOverlayPrivacyAlertWithBundleID:(id)a3
{
  id v3 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "+[SCAlert showPresenterOverlayPrivacyAlertWithBundleID:]";
    __int16 v16 = 1024;
    int v17 = 53;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  if (+[RPConnectionManager hasUnitTestEntitlement](&OBJC_CLASS___RPConnectionManager, "hasUnitTestEntitlement"))
  {
    BOOL v4 = 1;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"ACKNOWLEDGEMENT_PRESENTER_OVERLAY_ALERT_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedAppNameFromBundleID:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedAppNameFromBundleID:",  v3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"ACKNOWLEDGEMENT_PRESENTER_OVERLAY_ALERT_BODY"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpFrameworkBundle](&OBJC_CLASS___NSBundle, "_rpFrameworkBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleURL]);

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"ACKNOWLEDGEMENT_ALERT_DECLINE_BUTTON"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"BROADCAST_ACTIVITIES_PREFERRED_ACCEPT_BUTTON"));
    BOOL v4 = +[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]( &OBJC_CLASS___SCAlert,  "showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:",  v7,  v8,  v11,  v12,  v10,  1LL,  0LL);
  }

  return v4;
}

+ (BOOL)showLegacyAPIAlertWithBundleID:(id)a3
{
  id v3 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "+[SCAlert showLegacyAPIAlertWithBundleID:]";
    __int16 v16 = 1024;
    int v17 = 74;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"LEGACY_API_ALERT_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedAppNameFromBundleID:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedAppNameFromBundleID:",  v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"LEGACY_API_ALERT_BODY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedAppNameFromBundleID:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedAppNameFromBundleID:",  v3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpFrameworkBundle](&OBJC_CLASS___NSBundle, "_rpFrameworkBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleURL]);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"LEGACY_API_ALERT_OK_BUTTON"));
  LOBYTE(v10) = +[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]( &OBJC_CLASS___SCAlert,  "showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:",  v6,  v9,  v12,  0LL,  v11,  0LL,  0LL);

  return (char)v10;
}

+ (BOOL)showAlertWithTitle:(id)a3 bodyText:(id)a4 defaultButtonText:(id)a5 secondaryButtonText:(id)a6 url:(id)a7 requireReponse:(BOOL)a8 imageURL:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v29 = "+[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]";
    __int16 v30 = 1024;
    int v31 = 87;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  Mutable = CFDictionaryCreateMutable(0LL, 0LL, 0LL, 0LL);
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v14);
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v15);
  if (v17) {
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v17);
  }
  if (v16) {
    CFDictionaryAddValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v16);
  }
  if (v18) {
    CFDictionaryAddValue(Mutable, kCFUserNotificationLocalizationURLKey, v18);
  }
  if (v19) {
    CFDictionaryAddValue(Mutable, kCFUserNotificationIconURLKey, v19);
  }
  v21 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0LL, 0LL, Mutable);
  v22 = v21;
  if (v21 && v9)
  {
    CFUserNotificationReceiveResponse(v21, 0.0, &responseFlags);
    BOOL v23 = responseFlags == 1;
    if (responseFlags == 1)
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v29 = "+[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]";
        __int16 v30 = 1024;
        int v31 = 121;
        v24 = " [INFO] %{public}s:%d user acknowledgement accepted";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v24, buf, 0x12u);
      }
    }

    else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v29 = "+[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]";
      __int16 v30 = 1024;
      int v31 = 124;
      v24 = " [INFO] %{public}s:%d user acknowledgement refused";
      goto LABEL_25;
    }

+ (id)privacyHintUserInfoForBundleID:(id)a3 identifier:(id)a4 count:(int64_t)a5 days:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "+[SCAlert privacyHintUserInfoForBundleID:identifier:count:days:]";
    __int16 v25 = 1024;
    int v26 = 133;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"PRIVACY_INDICATOR_APPNAME_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedAppNameFromBundleID:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedAppNameFromBundleID:",  v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"PRIVACY_INDICATOR_APPNAME_BODY"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedAppNameFromBundleID:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedAppNameFromBundleID:",  v9));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v15, v16, v17));

  v21[0] = @"PrivacyHintBundleIdentifier";
  v21[1] = @"PrivacyHintTitle";
  v22[0] = v9;
  v22[1] = v13;
  v21[2] = @"PrivacyHintDescription";
  v21[3] = @"PrivacyHintAppIdentifier";
  v22[2] = v18;
  v22[3] = v10;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  4LL));

  return v19;
}

@end