@interface TVMusicRestrictionsUI
+ (BOOL)isVideoRestricted;
+ (id)_defaultsKeyForAlertType:(int64_t)a3;
+ (int64_t)_numberOfTimesShownForAlertType:(int64_t)a3;
+ (int64_t)explicitRestrictionAlertTypeForTypeString:(id)a3;
+ (void)_didShowAlertOfType:(int64_t)a3;
+ (void)_presentExplicitRestrictionAlertOfType:(int64_t)a3 completionBlock:(id)a4;
+ (void)_shouldPresentExplicitRestrictionAlertOfType:(int64_t)a3 completionBlock:(id)a4;
+ (void)presentExplicitRestrictionAlertIfNeededOfType:(int64_t)a3 completionBlock:(id)a4;
+ (void)presentRatingRestrictionAlertIfNeededOfType:(unint64_t)a3 forRating:(unint64_t)a4 completionBlock:(id)a5;
+ (void)presentVideoRestrictionAlertIfNeededWithCompletion:(id)a3;
@end

@implementation TVMusicRestrictionsUI

+ (void)presentExplicitRestrictionAlertIfNeededOfType:(int64_t)a3 completionBlock:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000163DC;
  v5[3] = &unk_1002695B8;
  id v7 = a1;
  int64_t v8 = a3;
  id v6 = a4;
  id v4 = v6;
  [v7 _shouldPresentExplicitRestrictionAlertOfType:v8 completionBlock:v5];
}

+ (void)_presentExplicitRestrictionAlertOfType:(int64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = +[SFRestrictionsPasscodeController settingEnabled]( &OBJC_CLASS___SFRestrictionsPasscodeController,  "settingEnabled");
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v9 = [v8 isSettingLockedDownByRestrictions:MCFeatureExplicitContentAllowed];

  id v29 = a1;
  switch(a3)
  {
    case 0LL:
      v10 = @"ON_LAUNCH_ALERT_TITLE";
      v11 = @"ON_LAUNCH_ALERT_MESSAGE";
      if ((v7 & 1) != 0) {
        goto LABEL_13;
      }
      goto LABEL_22;
    case 1LL:
      v14 = @"ON_CONTAINER_LOAD_ALERT_MESSAGE";
      if (v9) {
        v14 = @"EXPLICIT_CONTENT_DISABLED_ALERT_MESSAGE";
      }
      v11 = v14;
      v10 = @"ON_CONTAINER_LOAD_ALERT_TITLE";
      if ((v7 & 1) != 0) {
        goto LABEL_13;
      }
      goto LABEL_22;
    case 2LL:
      if ((v7 & 1) != 0)
      {
        v12 = @"RESTRICTIONS_BUTTON";
        v13 = @"NOT_NOW_BUTTON";
        v11 = @"ON_PLAY_PASSCODE_SET_ALERT_MESSAGE";
        v10 = @"ON_PLAY_PASSCODE_SET_ALERT_TITLE";
        goto LABEL_28;
      }

      v10 = @"ON_PLAY_ALERT_TITLE";
      v15 = @"ON_PLAY_ALERT_MESSAGE";
      goto LABEL_19;
    case 3LL:
      if ((v7 & 1) != 0)
      {
        v12 = @"RESTRICTIONS_BUTTON";
        v13 = @"NOT_NOW_BUTTON";
        v11 = @"ON_PURCHASE_PASSCODE_SET_ALERT_MESSAGE";
        v10 = @"ON_PURCHASE_PASSCODE_SET_ALERT_TITLE";
        goto LABEL_28;
      }

      v10 = @"ON_PURCHASE_ALERT_TITLE";
      v15 = @"ON_PURCHASE_ALERT_MESSAGE";
      goto LABEL_19;
    case 4LL:
      if ((v7 & 1) != 0)
      {
        v12 = @"RESTRICTIONS_BUTTON";
        v13 = @"NOT_NOW_BUTTON";
        v11 = @"ON_ADD_TO_LIBRARY_PASSCODE_SET_ALERT_MESSAGE";
        v10 = @"ON_ADD_TO_LIBRARY_PASSCODE_SET_ALERT_TITLE";
      }

      else
      {
        v10 = @"ON_ADD_TO_LIBRARY_ALERT_TITLE";
        v15 = @"ON_ADD_TO_LIBRARY_ALERT_MESSAGE";
LABEL_19:
        if (v9) {
          v15 = @"EXPLICIT_CONTENT_DISABLED_ALERT_MESSAGE";
        }
        v11 = v15;
LABEL_22:
        BOOL v16 = v9 == 0;
        if (v9) {
          v13 = @"MusicOK";
        }
        else {
          v13 = @"NOT_NOW_BUTTON";
        }
        if (v16) {
          v12 = @"ALLOW_EXPLICIT_BUTTON";
        }
        else {
          v12 = 0LL;
        }
      }

+ (void)_shouldPresentExplicitRestrictionAlertOfType:(int64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v8 = [v7 effectiveBoolValueForSetting:MCFeatureExplicitContentAllowed];

  if (v8 == 2)
  {
    unsigned int v9 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
    v11 = -[ICStoreRequestContext initWithIdentity:](v9, "initWithIdentity:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100016B94;
    v13[3] = &unk_100269650;
    int64_t v15 = a3;
    id v16 = a1;
    id v14 = v6;
    [v12 getBagForRequestContext:v11 withCompletionHandler:v13];
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

+ (int64_t)_numberOfTimesShownForAlertType:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _defaultsKeyForAlertType:a3]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v5 = [v4 integerForKey:v3];
  }

  else
  {
    id v5 = 0LL;
  }

  return (int64_t)v5;
}

+ (void)_didShowAlertOfType:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a1 _defaultsKeyForAlertType:a3]);
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "setInteger:forKey:", (char *)objc_msgSend(v3, "integerForKey:", v4) + 1, v4);
  }
}

+ (id)_defaultsKeyForAlertType:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
      id v6 = 0LL;
      return v6;
    }

    v3 = @"onContainerLoad";
  }

  else
  {
    v3 = @"onLaunch";
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccountIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v3, v5));

  return v6;
}

+ (int64_t)explicitRestrictionAlertTypeForTypeString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"onLaunch"])
  {
    int64_t v4 = 0LL;
  }

  else if ([v3 isEqualToString:@"onContainerLoad"])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"onPlay"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:@"onPurchase"])
  {
    int64_t v4 = 3LL;
  }

  else if ([v3 isEqualToString:@"onAddToLibrary"])
  {
    int64_t v4 = 4LL;
  }

  else
  {
    int64_t v4 = -1LL;
  }

  return v4;
}

+ (void)presentRatingRestrictionAlertIfNeededOfType:(unint64_t)a3 forRating:(unint64_t)a4 completionBlock:(id)a5
{
  unsigned int v9 = (void (**)(id, uint64_t, id))a5;
  if (a3 - 7 > 1 || ![a1 isVideoRestricted])
  {
    v11 = (void (**)(id, uint64_t, id))objc_claimAutoreleasedReturnValue( +[PBSRestrictionsSettings sharedInstance]( &OBJC_CLASS___PBSRestrictionsSettings,  "sharedInstance"));
    v10 = v11;
    uint64_t v23 = 0LL;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000LL;
    id v26 = sub_100017228;
    v27 = sub_100017238;
    id v28 = 0LL;
    if (a3 == 7)
    {
      int64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 maximumEffectiveMovieRanking]);
      id v13 = [v15 integerValue];

      uint64_t v5 = 0LL;
      id v14 = (void *)v24[5];
      v24[5] = (uint64_t)@"CHANGE_ALLOWED_MOVIE_RATING";
    }

    else
    {
      if (a3 != 8)
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B59F0,  1001LL,  0LL));
        if (v13)
        {
          if (v9) {
            v9[2](v9, 1LL, v13);
          }
          goto LABEL_10;
        }

+ (BOOL)isVideoRestricted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureMusicVideosAllowed] == 2;

  return v3;
}

+ (void)presentVideoRestrictionAlertIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  if ([a1 isVideoRestricted])
  {
    unsigned int v5 = +[SFRestrictionsPasscodeController settingEnabled]( &OBJC_CLASS___SFRestrictionsPasscodeController,  "settingEnabled");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    unsigned int v7 = [v6 isSettingLockedDownByRestrictions:MCFeatureMusicVideosAllowed];

    if (v5 | v7 ^ 1) {
      unsigned int v8 = @"ON_PLAY_VIDEO_ALERT_MESSAGE";
    }
    else {
      unsigned int v8 = @"VIDEO_DISABLED_ALERT_MESSAGE";
    }
    unsigned int v9 = @"MusicOK";
    if (!v7) {
      unsigned int v9 = @"NOT_NOW_BUTTON";
    }
    v10 = @"ALLOW_VIDEOS_BUTTON";
    if (v7) {
      v10 = 0LL;
    }
    if (v5) {
      v11 = @"NOT_NOW_BUTTON";
    }
    else {
      v11 = v9;
    }
    v12 = @"RESTRICTIONS_BUTTON";
    if (!v5) {
      v12 = v10;
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", v12));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"ON_PLAY_VIDEO_ALERT_TITLE" value:&stru_100279068 table:0]);

    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:v8 value:&stru_100279068 table:0]);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedStringForKey:v11 value:&stru_100279068 table:0]);

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    uint64_t v25 = sub_100017954;
    id v26 = &unk_100269730;
    id v19 = v14;
    id v27 = v19;
    id v20 = v16;
    id v28 = v20;
    id v29 = v23;
    char v33 = v5;
    id v31 = v4;
    id v32 = a1;
    id v21 = v18;
    id v30 = v21;
    id v22 = v24;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
    {
      v25((uint64_t)v22);
    }

    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100017BEC;
      block[3] = &unk_100268D60;
      id v35 = v22;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1LL);
  }
}

@end