@interface MTEpisodeUnavailableUtil
+ (id)alertTitleForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4;
+ (id)longReasonTextForNoInternet;
+ (id)longStringForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4;
+ (id)stringForUnavailableReason:(int64_t)a3;
+ (int64_t)unavailableReasonForEpisode:(id)a3;
+ (int64_t)unavailableReasonForServerEpisode:(id)a3;
+ (void)promptBeforePerformingIntentAsBufferedAirPlayForRoute:(id)a3 provider:(id)a4 queueStatus:(unint64_t)a5 completion:(id)a6;
- (BOOL)showDialogForReason:(int64_t)a3 podcastTitle:(id)a4 completion:(id)a5;
- (void)_presentErrorDialogWithTitle:(id)a3 message:(id)a4 handler:(id)a5;
@end

@implementation MTEpisodeUnavailableUtil

+ (int64_t)unavailableReasonForEpisode:(id)a3
{
  id v3 = a3;
  if ([v3 isRestricted])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 feedDeleted] && !objc_msgSend(v3, "isDownloaded"))
  {
    int64_t v4 = 3LL;
  }

  else if (([v3 isDownloaded] & 1) != 0 {
         || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance")),
  }
             unsigned int v6 = [v5 isReachable],
             v5,
             v6))
  {
    else {
      int64_t v4 = 7LL;
    }
  }

  else
  {
    int64_t v4 = 2LL;
  }

  return v4;
}

+ (int64_t)unavailableReasonForServerEpisode:(id)a3
{
  id v3 = a3;
  if ([v3 isRestricted])
  {
    int64_t v4 = 1LL;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
    unsigned int v6 = [v5 isReachable];

    if (v6)
    {
      else {
        int64_t v4 = 0LL;
      }
    }

    else
    {
      int64_t v4 = 2LL;
    }
  }

  return v4;
}

+ (id)alertTitleForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4
{
  id v5 = a4;
  unsigned int v6 = v5;
  switch(a3)
  {
    case 3LL:
      if ([v5 length])
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v8 = v7;
        v9 = @"EPISODE_FEEDDELETED_TITLE";
        goto LABEL_7;
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v10;
      v11 = @"EPISODE_FEEDDELETED_TITLE_NO_PODCAST";
      goto LABEL_17;
    case 4LL:
      if ([v5 length])
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v8 = v7;
        v9 = @"EPISODE_UNAVAILABLE_TITLE";
LABEL_7:
        v12 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v9 value:&stru_100248948 table:0]);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v6));
      }

      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v8 = v10;
        v11 = @"EPISODE_UNAVAILABLE_TITLE_NO_PODCAST";
LABEL_17:
        v13 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:v11 value:&stru_100248948 table:0]);
      }

      return v13;
    case 5LL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v10;
      v11 = @"CANNOT_BE_PLAYED_TITLE";
      goto LABEL_17;
    case 6LL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v10;
      v11 = @"CANT_BE_PLAYED_ON_DEVICE";
      goto LABEL_17;
    case 7LL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v10;
      v11 = @"SUBSCRIBE_TO_LISTEN";
      goto LABEL_17;
    case 8LL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v10;
      v11 = @"SUBSCRIPTION_IS_REQUIRED";
      goto LABEL_17;
    case 9LL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v10;
      v11 = @"LICENSE_SLOT_ERROR_TITLE";
      goto LABEL_17;
    case 10LL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v10;
      v11 = @"LICENSE_DEVICES_ERROR_TITLE";
      goto LABEL_17;
    case 11LL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v10;
      v11 = @"WATCH_CANNOT_PLAY_VIDEOS_TITLE";
      goto LABEL_17;
    default:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v10;
      v11 = @"EPISODE_UNAVAILABLE";
      goto LABEL_17;
  }

+ (id)stringForUnavailableReason:(int64_t)a3
{
  if (a3 == 1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    int64_t v4 = v3;
    id v5 = @"Restricted";
    goto LABEL_3;
  }

  if (a3 == 13)
  {
LABEL_2:
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    int64_t v4 = v3;
    id v5 = @"Unavailable";
LABEL_3:
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v5 value:&stru_100248948 table:0]);
    goto LABEL_4;
  }

  if (a3 != 2)
  {
    v7 = 0LL;
    return v7;
  }

  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 reasonTextForNoInternet]);
LABEL_4:
  v7 = (void *)v6;

  return v7;
}

+ (id)longStringForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4
{
  id v6 = a4;
  v7 = 0LL;
  switch(a3)
  {
    case 1LL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v9 = v8;
      v10 = @"ALERT_MESSAGE_RESTRICTED";
      goto LABEL_11;
    case 2LL:
      v7 = (void *)objc_claimAutoreleasedReturnValue([a1 longReasonTextForNoInternet]);
      break;
    case 7LL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v9 = v8;
      v10 = @"SUBSCRIPTION_REQUIRED";
      goto LABEL_11;
    case 9LL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v9 = v8;
      v10 = @"LICENSE_SLOT_ERROR";
      goto LABEL_11;
    case 10LL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v9 = v8;
      v10 = @"LICENSE_DEVICES_ERROR";
      goto LABEL_11;
    case 11LL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v9 = v8;
      v10 = @"WATCH_CANNOT_PLAY_VIDEOS_MESSAGE";
LABEL_11:
      v7 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:&stru_100248948 table:0]);

      break;
    case 13LL:
      int v11 = MGGetBoolAnswer(@"wapi");
      v12 = @"WIFI_LICENSE_CORRUPTION_ERROR";
      if (v11) {
        v12 = @"WLAN_LICENSE_CORRUPTION_ERROR";
      }
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:v13 value:&stru_100248948 table:0]);

      break;
    default:
      break;
  }

  return v7;
}

+ (id)longReasonTextForNoInternet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
  id v3 = [v2 reasonForNoInternet];

  if (v3 == (id)1)
  {
    int v6 = MGGetBoolAnswer(@"wapi");
    v7 = @"EPISODE_AIRPLANE_MODE_WIFI";
    v8 = @"EPISODE_AIRPLANE_MODE_WLAN";
LABEL_7:
    if (v6) {
      v7 = (__CFString *)v8;
    }
    v9 = v7;
    int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v9 value:&stru_100248948 table:0]);

    goto LABEL_10;
  }

  if (v3 == (id)2)
  {
    int v6 = MGGetBoolAnswer(@"wapi");
    v7 = @"EPISODE_SYSTEM_CELLULAR_DISABLED_WIFI";
    v8 = @"EPISODE_SYSTEM_CELLULAR_DISABLED_WLAN";
    goto LABEL_7;
  }

  if (v3 != (id)3)
  {
    id v5 = 0LL;
    return v5;
  }

  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"EPISODE_NO_INTERNET" value:&stru_100248948 table:0]);
LABEL_10:

  return v5;
}

- (BOOL)showDialogForReason:(int64_t)a3 podcastTitle:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100080C78;
  v31[3] = &unk_1002429C0;
  id v9 = a5;
  id v32 = v9;
  int64_t v33 = a3;
  v10 = objc_retainBlock(v31);
  v12 = v10;
  v13 = 0LL;
  BOOL v14 = 0;
  switch(a3)
  {
    case 0LL:
      goto LABEL_11;
    case 1LL:
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[PFRestrictionsController shared](&OBJC_CLASS___PFRestrictionsController, "shared"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100080C94;
      v29[3] = &unk_100240A30;
      id v30 = v12;
      [v23 presentAlertIfNeeded:0 presentationCompletion:0 actionCompletion:v29];

      v13 = 0LL;
      v16 = v30;
      goto LABEL_3;
    case 2LL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100080CA4;
      v26[3] = &unk_1002429E8;
      id v27 = v9;
      uint64_t v28 = 2LL;
      unsigned __int8 v25 = [v24 showInternetUnreachableDialogWithAcknowledmentBlock:v26];

      if ((v25 & 1) == 0) {
        goto LABEL_2;
      }
      v13 = 0LL;
      goto LABEL_4;
    case 3LL:
    case 4LL:
    case 5LL:
    case 6LL:
    case 7LL:
    case 8LL:
    case 9LL:
    case 10LL:
    case 11LL:
    case 13LL:
LABEL_2:
      id v15 = [(id)objc_opt_class(self) alertTitleForUnavailableReason:a3 podcastTitle:v8];
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v17 = [(id)objc_opt_class(self) longStringForUnavailableReason:a3 podcastTitle:v8];
      v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
      -[MTEpisodeUnavailableUtil _presentErrorDialogWithTitle:message:handler:]( self,  "_presentErrorDialogWithTitle:message:handler:",  v16,  v13,  v12);
LABEL_3:

LABEL_4:
      BOOL v14 = 1;
      break;
    default:
      break;
  }

  uint64_t v18 = _MTLogCategoryPlayback(v10, v11);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = v13;
    if (!v13)
    {
      id v21 = [(id)objc_opt_class(self) longStringForUnavailableReason:a3 podcastTitle:v8];
      v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
    }

    *(_DWORD *)buf = 138412290;
    v35 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Episode Unavailable (%@)", buf, 0xCu);
    if (!v13) {
  }
    }

LABEL_11:
  return v14;
}

- (void)_presentErrorDialogWithTitle:(id)a3 message:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[MTAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___MTAlertController,  "alertControllerWithTitle:message:preferredStyle:",  a3,  a4,  1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"OK" value:&stru_100248948 table:0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  1LL,  v7));

  [v11 addAction:v10];
  [v11 presentAnimated:1 completion:0];
}

+ (void)promptBeforePerformingIntentAsBufferedAirPlayForRoute:(id)a3 provider:(id)a4 queueStatus:(unint64_t)a5 completion:(id)a6
{
  id v56 = a3;
  id v55 = a4;
  id v8 = a6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  0LL,  1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"Cancel" value:&stru_100248948 table:0]);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_10008153C;
  v59[3] = &unk_100242A10;
  id v12 = v8;
  id v60 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  1LL,  v59));

  [v9 addAction:v13];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:@"Play" value:&stru_100248948 table:0]);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_10008154C;
  v57[3] = &unk_100242A10;
  v16 = (void (**)(id, uint64_t))v12;
  id v17 = v9;
  uint64_t v18 = v16;
  v58 = v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  0LL,  v57));

  [v9 addAction:v19];
  if (isTV([v9 setPreferredAction:v19]))
  {
    v18[2](v18, 1LL);
    v20 = 0LL;
    id v21 = 0LL;
    v23 = v55;
    v22 = v56;
  }

  else
  {
    if (isPad())
    {
      v22 = v56;
      if ([v56 isHomePodRoute])
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        unsigned __int8 v25 = v24;
        v26 = @"SHARED_QUEUE_UNSUPPORTED_TITLE_HOMEPOD_IPAD";
      }

      else
      {
        unsigned int v32 = [v56 isAppleTVRoute];
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        unsigned __int8 v25 = v24;
        if (v32) {
          v26 = @"SHARED_QUEUE_UNSUPPORTED_TITLE_APPLETV_IPAD";
        }
        else {
          v26 = @"SHARED_QUEUE_UNSUPPORTED_TITLE_DEVICE_IPAD";
        }
      }

      id v21 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedStringForKey:v26 value:&stru_100248948 table:0]);
      v23 = v55;

      switch(a5)
      {
        case 0uLL:
          goto LABEL_59;
        case 1uLL:
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          if (v55)
          {
            v38 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPAD";
            goto LABEL_33;
          }

          v49 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPAD_NO_PROVIDER";
          break;
        case 2uLL:
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          v37 = v40;
          v41 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_SINGLE_QUEUE_ITEM_IPAD";
          goto LABEL_45;
        case 3uLL:
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          v37 = v40;
          v41 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_MULTIPLE_QUEUE_ITEMS_IPAD";
          goto LABEL_45;
        case 4uLL:
          if ([v56 isHomePodRoute])
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            v43 = v42;
            v44 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_HOMEPOD_IPAD";
          }

          else
          {
            unsigned int v48 = [v56 isAppleTVRoute];
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            v43 = v42;
            if (v48) {
              v44 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_APPLETV_IPAD";
            }
            else {
              v44 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_DEVICE_IPAD";
            }
          }

          uint64_t v50 = objc_claimAutoreleasedReturnValue([v42 localizedStringForKey:v44 value:&stru_100248948 table:0]);

          v20 = 0LL;
          id v21 = (void *)v50;
          goto LABEL_58;
        default:
          goto LABEL_34;
      }

@end