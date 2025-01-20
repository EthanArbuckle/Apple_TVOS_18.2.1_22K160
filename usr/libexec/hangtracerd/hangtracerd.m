id sub_10000421C()
{
  return +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:]( &OBJC_CLASS___UNNotificationCategory,  "categoryWithIdentifier:actions:intentIdentifiers:options:",  @"com.apple.hangtracerd.usernotifications.hang-log",  &__NSArray0__struct,  &__NSArray0__struct,  0LL);
}

void sub_100004240(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v8 = [v7 shouldUpdateHangsHUD];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned int v10 = [v9 isInternal];

    if (!v10)
    {
      v13 = @"settings-navigation://com.apple.Settings.Developer/HANGTRACER_EXTERNAL_CONFIGURE/";
      goto LABEL_6;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    double v12 = (double)[v11 hudThresholdMSec];

    if (v12 <= a3)
    {
      v13 = @"settings-navigation://com.apple.Settings.Internal.Classic/HANGTRACER/";
LABEL_6:
      v14 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
      id v15 = v5;
      v16 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      -[NSNumberFormatter setNumberStyle:](v16, "setNumberStyle:", 0LL);
      id v17 = sub_10000455C(@"HANG_LOG_NOTIFICATION_SUMMARY_MILLISECONDS%@%@");
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v16, "stringFromNumber:", v19));
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v18,  v20,  v15));

      -[UNMutableNotificationContent setBody:](v14, "setBody:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](&OBJC_CLASS___UNNotificationSound, "defaultSound"));
      -[UNMutableNotificationContent setSound:](v14, "setSound:", v22);

      -[UNMutableNotificationContent setThreadIdentifier:]( v14,  "setThreadIdentifier:",  @"com.apple.hangtracerd.usernotifications.hang-log");
      -[UNMutableNotificationContent setCategoryIdentifier:]( v14,  "setCategoryIdentifier:",  @"com.apple.hangtracerd.usernotifications.hang-log");
      -[UNMutableNotificationContent setInterruptionLevel:](v14, "setInterruptionLevel:", 0LL);
      id v23 = sub_10000455C(@"HANG_DETECTED");
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      -[UNMutableNotificationContent setTitle:](v14, "setTitle:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v6));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v25));
      -[UNMutableNotificationContent setDefaultActionURL:](v14, "setDefaultActionURL:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.hangtracerd.usernotifications.hang-log",  v15));
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  v27,  v14,  0LL));

      v29 = (void *)objc_claimAutoreleasedReturnValue( +[HTUserNotificationHelper sharedHelperWithCategories:]( &OBJC_CLASS___HTUserNotificationHelper,  "sharedHelperWithCategories:",  0LL));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 notificationCenter]);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_100004760;
      v32[3] = &unk_100048B90;
      id v33 = v28;
      id v31 = v28;
      [v30 getNotificationSettingsWithCompletionHandler:v32];
    }
  }
}

id sub_10000455C(void *a1)
{
  id v1 = a1;
  if (qword_10005B1F8 != -1) {
    dispatch_once(&qword_10005B1F8, &stru_100048BD0);
  }
  id v2 = (id)qword_10005B1F0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 thirdPartyDevPreferredLanguages]);
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 thirdPartyDevPreferredLanguages]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v8));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 languageCode]);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v2 localizations]);
    id v17 = v10;
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v11,  v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:v1 value:&stru_10004A8D0 table:@"InfoPlist" localization:v14]);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:v1 value:&stru_10004A8D0 table:@"InfoPlist"]);
  }

  return v15;
}

void sub_100004760(uint64_t a1, void *a2)
{
  id v3 = [a2 authorizationStatus];
  if (v3 == (id)2)
  {
    id v6 = sub_1000233A4();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "postHangLogNotification_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s notification previously authorized",  buf,  0xCu);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[HTUserNotificationHelper sharedHelperWithCategories:]( &OBJC_CLASS___HTUserNotificationHelper,  "sharedHelperWithCategories:",  0LL));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 notificationCenter]);
    [v8 addNotificationRequest:*(void *)(a1 + 32) withCompletionHandler:&stru_100048B20];
  }

  else if (v3 == (id)1)
  {
    id v4 = sub_1000233A4();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "postHangLogNotification_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "%s notification previously denied, will not post",  buf,  0xCu);
    }
  }

  else
  {
    id v9 = sub_1000233A4();
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "postHangLogNotification_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s requesting provisional notification authorization",  buf,  0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[HTUserNotificationHelper sharedHelperWithCategories:]( &OBJC_CLASS___HTUserNotificationHelper,  "sharedHelperWithCategories:",  0LL));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 notificationCenter]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100004A70;
    v13[3] = &unk_100048B68;
    id v14 = *(id *)(a1 + 32);
    [v12 requestAuthorizationWithOptions:68 completionHandler:v13];

    id v5 = v14;
  }
}

void sub_100004990(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_1000233A4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v2;
      id v6 = "Notification dispatch failed: %@";
      v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    id v6 = "Notification dispatched";
    v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
    uint32_t v9 = 2;
    goto LABEL_6;
  }
}

void sub_100004A70(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v10 = sub_1000233A4();
    os_log_type_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v11 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v11) {
        goto LABEL_11;
      }
      int v15 = 138412290;
      id v16 = v5;
      double v12 = "Notification authorization error: %@";
      v13 = v8;
      uint32_t v14 = 12;
    }

    else
    {
      if (!v11) {
        goto LABEL_11;
      }
      LOWORD(v15) = 0;
      double v12 = "Notification newly denied";
      v13 = v8;
      uint32_t v14 = 2;
    }

    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
    goto LABEL_11;
  }

  id v6 = sub_1000233A4();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notification granted", (uint8_t *)&v15, 2u);
  }

  os_log_type_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[HTUserNotificationHelper sharedHelperWithCategories:]( &OBJC_CLASS___HTUserNotificationHelper,  "sharedHelperWithCategories:",  0LL));
  uint32_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s notificationCenter](v8, "notificationCenter"));
  [v9 addNotificationRequest:*(void *)(a1 + 32) withCompletionHandler:&stru_100048B40];

LABEL_11:
}

void sub_100004BDC(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_1000233A4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      BOOL v11 = v2;
      id v6 = "Notification dispatch failed: %@";
      v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    id v6 = "Notification dispatched";
    v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
    uint32_t v9 = 2;
    goto LABEL_6;
  }
}

void sub_100004CBC(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:relativeToURL:",  @"/System/Library/UserNotifications/Bundles/com.apple.hangtracerd.usernotifications.bundle",  0LL));
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v3));
  id v2 = (void *)qword_10005B1F0;
  qword_10005B1F0 = v1;
}

void sub_100004DF4()
{
  id v0 = sub_1000233A4();
  uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "marking hangreporter as clean to exit", v3, 2u);
  }

  id v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005B208 transaction]);
  if (v2) {
    [(id)qword_10005B208 setTransaction:0];
  }
}

void sub_100005758( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_1000057AC(id a1)
{
  uint64_t v1 = -[HTFixedSizeQueue initWithSize:](objc_alloc(&OBJC_CLASS___HTFixedSizeQueue), "initWithSize:", 128LL);
  id v2 = (void *)qword_10005B208;
  qword_10005B208 = (uint64_t)v1;

  if (!qword_10005B208)
  {
    id v3 = sub_1000233A4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unable to instantiate queue to hold process launch and exit records, exiting",  v5,  2u);
    }

    exit(12);
  }
}

void sub_100005EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = sub_1000233A4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v70 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handling notification: %@", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v7 = [v6 memoryLoggingEnabled];

  id v8 = sub_1000233A4();
  uint32_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Memory Logging Enabled", buf, 2u);
    }

    if (!qword_10005B220)
    {
      dispatch_source_t v11 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_10005BD48);
      double v12 = (void *)qword_10005B220;
      qword_10005B220 = (uint64_t)v11;

      dispatch_source_set_event_handler((dispatch_source_t)qword_10005B220, &stru_100048CB8);
      sub_100008670();
      dispatch_resume((dispatch_object_t)qword_10005B220);
    }
  }

  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Memory Logging Disabled", buf, 2u);
    }

    if (qword_10005B220)
    {
      dispatch_source_cancel((dispatch_source_t)qword_10005B220);
      v13 = (void *)qword_10005B220;
      qword_10005B220 = 0LL;
    }
  }

  uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v15 = [v14 hangtracerDaemonEnabled];

  id v16 = sub_1000233A4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Hang Tracer Daemon Enabled", buf, 2u);
    }

    if (!launch_service_stats_enable("com.apple.hangtracerd", 128LL))
    {
      id v19 = sub_1000233A4();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_10002BBFC();
      }
    }

    if (!qword_10005B228)
    {
      dispatch_source_t v21 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_10005BD48);
      v22 = (void *)qword_10005B228;
      qword_10005B228 = (uint64_t)v21;

      dispatch_time_t v23 = dispatch_time(0LL, 1000000000LL);
      dispatch_source_set_timer((dispatch_source_t)qword_10005B228, v23, 0x3B9ACA00uLL, 0x3B9ACA00uLL);
      dispatch_source_set_event_handler((dispatch_source_t)qword_10005B228, &stru_100048CD8);
      dispatch_resume((dispatch_object_t)qword_10005B228);
    }

    if (qword_10005B250 != -1) {
      dispatch_once(&qword_10005B250, &stru_100048CF8);
    }
  }

  else
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Hang Tracer Daemon Disabled", buf, 2u);
    }

    +[HTProcessInfo stopWatchingAllPids](&OBJC_CLASS___HTProcessInfo, "stopWatchingAllPids");
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[HTUserNotificationHelper sharedHelperWithCategories:]( &OBJC_CLASS___HTUserNotificationHelper,  "sharedHelperWithCategories:",  0LL));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 notificationCenter]);

    [v25 removeAllPendingNotificationRequests];
    [v25 removeAllDeliveredNotifications];

    if (!launch_service_stats_disable("com.apple.hangtracerd"))
    {
      id v26 = sub_1000233A4();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_10002BC28();
      }
    }

    if (qword_10005B228)
    {
      dispatch_source_cancel((dispatch_source_t)qword_10005B228);
      v28 = (void *)qword_10005B228;
      qword_10005B228 = 0LL;
    }
  }

  id v29 = sub_1000233A4();
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "hangtracerd compiled without App Activation Logging",  buf,  2u);
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v32 = [v31 slowAppActivationTailspinEnabled];

  if (v32)
  {
    id v33 = sub_1000233A4();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Slow App Activation Tailspins Enabled", buf, 2u);
    }

    +[HTTailspin resetDailyActivationTailspinCounts](&OBJC_CLASS___HTTailspin, "resetDailyActivationTailspinCounts");
    +[HTTailspin resetAppActivationTailspinCounts](&OBJC_CLASS___HTTailspin, "resetAppActivationTailspinCounts");
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v36 = [v35 eplEnabledProfile];

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v38 = [v37 eplEnabled];

  id v39 = sub_1000233A4();
  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  v41 = v40;
  if (v36)
  {
    if (v38)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        sub_10002BBA4();
      }
LABEL_45:

      goto LABEL_53;
    }

    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "EPL is not enabled by PLDE, but enabled by profile, attempting to persist and unredact logs",  buf,  2u);
    }

    int v42 = 1;
  }

  else
  {
    if (v38)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        sub_10002BBD0();
      }
      goto LABEL_45;
    }

    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "EPL is not enabled by PLDE, and not enabled by profile, attempting to restore os_log state",  buf,  2u);
    }

    int v42 = 0;
  }

  sub_100018268(v42);
LABEL_53:
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v44 = [v43 shouldUpdateHangsHUD];

  if (v44)
  {
    if ((byte_10005B218 & 1) == 0)
    {
      if (!qword_10005B230)
      {
        dispatch_source_t v45 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_10005BD50);
        v46 = (void *)qword_10005B230;
        qword_10005B230 = (uint64_t)v45;

        dispatch_time_t v47 = dispatch_time(0LL, 50000000LL);
        dispatch_source_set_timer((dispatch_source_t)qword_10005B230, v47, 0x2FAF080uLL, 0x2FAF080uLL);
        dispatch_source_set_event_handler((dispatch_source_t)qword_10005B230, &stru_100048D18);
        dispatch_resume((dispatch_object_t)qword_10005B230);
      }

      byte_10005B218 = 1;
    }

    goto LABEL_59;
  }

  if (byte_10005B218)
  {
LABEL_59:
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned __int8 v49 = [v48 shouldUpdateHangsHUD];

    if ((v49 & 1) == 0)
    {
      byte_10005B218 = 0;
      if (qword_10005B230)
      {
        dispatch_source_cancel((dispatch_source_t)qword_10005B230);
        v50 = (void *)qword_10005B230;
        qword_10005B230 = 0LL;
      }

      sub_1000230EC(0LL);
    }
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  if ([v51 hangtracerDaemonEnabled])
  {
LABEL_72:

    return;
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  if ([v52 memoryLoggingEnabled])
  {
LABEL_71:

    goto LABEL_72;
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  if ([v53 appActivationLoggingEnabled])
  {
LABEL_70:

    goto LABEL_71;
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  if ([v54 signpostMonitoringEnabled])
  {
LABEL_69:

    goto LABEL_70;
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  if ([v55 workflowResponsivenessEnabled])
  {

    goto LABEL_69;
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned __int8 v57 = [v56 appLaunchMonitoringEnabled];

  if ((v57 & 1) == 0)
  {
    id v58 = sub_1000233A4();
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_INFO,  "Triggering cleanup of the spool directory on exit",  buf,  2u);
    }

    sub_1000067BC(1);
    id v60 = sub_1000233A4();
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "hangtracerd will exit. All sources turned off",  buf,  2u);
    }

    if ((byte_10005B219 & 1) == 0)
    {
      id v62 = sub_1000233A4();
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "hangtracerd is setting up xpc connection and handler before exiting",  buf,  2u);
      }

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100006DE0;
      handler[3] = &unk_100048C18;
      xpc_connection_t mach_service = xpc_connection_create_mach_service( "com.apple.hangtracerd",  (dispatch_queue_t)qword_10005BD48,  1uLL);
      v64 = mach_service;
      xpc_connection_set_event_handler(v64, handler);
      xpc_connection_resume(v64);
    }

    id v65 = sub_1000233A4();
    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "hangtracerd is exiting", buf, 2u);
    }

    exit(0);
  }

void sub_1000067BC(int a1)
{
  id v2 = sub_1000233A4();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cleaning up", buf, 2u);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v4, "addObject:", @"/var/root/Library/Caches/hangtracerd/tmp");
  if (a1) {
    -[NSMutableArray addObject:](v4, "addObject:", @"/var/root/Library/Caches/hangtracerd/spool");
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  obj = v4;
  id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v56,  v67,  16LL);
  if (v40)
  {
    uint64_t v39 = *(void *)v57;
    id v6 = @"/var/root/Library/Caches/hangtracerd/tmp";
    NSURLResourceKey v7 = NSURLTotalFileSizeKey;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v57 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v8;
        uint32_t v9 = *(void **)(*((void *)&v56 + 1) + 8 * v8);
        id v10 = sub_1000233A4();
        dispatch_source_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cleaning up %@", buf, 0xCu);
        }

        double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  NSURLPathKey,  NSURLCreationDateKey,  v7,  0LL));
        uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v5 enumeratorAtURL:v12 includingPropertiesForKeys:v13 options:0 errorHandler:&stru_100048D58]);

        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        id v43 = v14;
        id v45 = [v43 countByEnumeratingWithState:&v52 objects:v66 count:16];
        if (v45)
        {
          uint64_t v44 = *(void *)v53;
          int v42 = v9;
          do
          {
            unsigned int v15 = 0LL;
            do
            {
              if (*(void *)v53 != v44) {
                objc_enumerationMutation(v43);
              }
              id v16 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v15);
              id v50 = 0LL;
              id v51 = 0LL;
              unsigned __int8 v17 = [v16 getResourceValue:&v51 forKey:v7 error:&v50];
              id v18 = v51;
              id v19 = v50;
              if ((v17 & 1) == 0)
              {
                id v20 = sub_1000233A4();
                dispatch_source_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
                  *(_DWORD *)buf = 138412546;
                  v61 = v16;
                  __int16 v62 = 2112;
                  id v63 = v22;
                  _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Error getting file size for %@: %@",  buf,  0x16u);
                }
              }

              id v49 = v19;
              unsigned int v23 = [v5 removeItemAtURL:v16 error:&v49];
              id v24 = v49;

              id v25 = sub_1000233A4();
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
              BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
              if ((v23 & 1) != 0)
              {
                if (!v27) {
                  goto LABEL_27;
                }
                *(_DWORD *)buf = 138412290;
                v61 = v16;
                v28 = v26;
                id v29 = "Successfully deleted file at %@";
                uint32_t v30 = 12;
              }

              else
              {
                if (!v27) {
                  goto LABEL_27;
                }
                *(_DWORD *)buf = 138412802;
                v61 = v16;
                __int16 v62 = 2112;
                id v63 = v18;
                __int16 v64 = 2112;
                id v65 = v24;
                v28 = v26;
                id v29 = "Failed to delete file at file path: %@ size: %@ error: %@";
                uint32_t v30 = 32;
              }

              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
LABEL_27:

              if ([v9 isEqualToString:v6])
              {
                id v31 = v7;
                unsigned int v32 = v6;
                id v33 = v5;
                unsigned int v34 = [v18 unsignedIntValue];
                id v35 = sub_1000233A4();
                unsigned int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
                v37 = v36;
                if (v34 < 0xC800001)
                {
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    v61 = v16;
                    __int16 v62 = 2112;
                    id v63 = v18;
                    __int16 v64 = 1024;
                    LODWORD(v65) = v23;
                    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Detected file abandoned in the tmp directory, file path: %@ size: %@  deleted: %{BOOL}d",  buf,  0x1Cu);
                  }
                }

                else
                {
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    v61 = v16;
                    __int16 v62 = 2112;
                    id v63 = v18;
                    __int16 v64 = 1024;
                    LODWORD(v65) = v23;
                    _os_log_fault_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_FAULT,  "Detected large file abandoned in the tmp directory, file path: %@ size: %@ deleted: %{BOOL}d",  buf,  0x1Cu);
                  }

                  v46[0] = _NSConcreteStackBlock;
                  v46[1] = 3221225472LL;
                  v46[2] = sub_100009048;
                  v46[3] = &unk_100048D80;
                  char v48 = v23;
                  dispatch_time_t v47 = (os_log_s *)v18;
                  AnalyticsSendEventLazy(@"com.apple.hangtracerd.large_tailspins", v46);
                  v37 = v47;
                }

                id v5 = v33;

                id v6 = v32;
                NSURLResourceKey v7 = v31;
                uint32_t v9 = v42;
              }

              unsigned int v15 = (char *)v15 + 1;
            }

            while (v45 != v15);
            id v45 = [v43 countByEnumeratingWithState:&v52 objects:v66 count:16];
          }

          while (v45);
        }

        uint64_t v8 = v41 + 1;
      }

      while ((id)(v41 + 1) != v40);
      id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v56,  v67,  16LL);
    }

    while (v40);
  }
}

void sub_100006DE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    id v12 = sub_1000233A4();
    NSURLResourceKey v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v18 = 67109120;
      LODWORD(v19) = xpc_connection_get_pid((xpc_connection_t)v3);
      uint64_t v8 = "XPC: Client started new connection: pid %d";
      uint32_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
      uint32_t v11 = 8;
      goto LABEL_8;
    }
  }

  else
  {
    xpc_type_t v5 = type;
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      if (v3 == &_xpc_error_connection_invalid)
      {
        id v16 = sub_1000233A4();
        NSURLResourceKey v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
          goto LABEL_9;
        }
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
        int v18 = 136315394;
        id v19 = string;
        __int16 v20 = 1024;
        LODWORD(v21) = pid;
        uint64_t v8 = "xpc_error_connection_invalid %s - from pid %d";
        uint32_t v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_INFO;
        uint32_t v11 = 18;
        goto LABEL_8;
      }

      id v14 = sub_1000233A4();
      NSURLResourceKey v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      BOOL v15 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v3 != &_xpc_error_connection_interrupted)
      {
        if (!v15) {
          goto LABEL_9;
        }
        int v18 = 134218242;
        id v19 = (const char *)v3;
        __int16 v20 = 2080;
        dispatch_source_t v21 = string;
        uint64_t v8 = "hangtracerd: Connection error: %p : %s";
        uint32_t v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
        uint32_t v11 = 22;
        goto LABEL_8;
      }

      if (!v15) {
        goto LABEL_9;
      }
      int v18 = 136315138;
      id v19 = string;
      uint64_t v8 = "xpc_error_connection_interrupted: %s";
      goto LABEL_5;
    }

    id v6 = sub_1000233A4();
    NSURLResourceKey v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      id v19 = (const char *)v5;
      uint64_t v8 = "hangtracerd: unknown event type : %p";
LABEL_5:
      uint32_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v18, v11);
    }
  }

LABEL_9:
}

  sub_1000228C0();
}

void sub_100007028(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  unsigned __int8 v6 = [a3 isEqualToString:off_10005B070];
  id v7 = sub_1000233A4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint32_t v9 = v8;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v79 = "handleSentryTailspinRequest";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s: received problem detected notification",  buf,  0xCu);
    }

    os_log_type_t v10 = off_10005B080;
    id v11 = a5;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:off_10005B098]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:off_10005B088]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:off_10005B090]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:off_10005B0A0]);
    v73 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:off_10005B0A8]);
    v74 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:off_10005B0B0]);
    v72 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:off_10005B0B8]);
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:off_10005B0C0]);

    v71 = (void *)v15;
    if (!v12)
    {
      id v21 = sub_1000233A4();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v79 = "handleSentryTailspinRequest";
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: reportRef is nil, this is REALLY bad",  buf,  0xCu);
      }

      id v23 = sub_100017C70(0LL, (uint64_t)@"reportRef is nil, this is REALLY bad");
      uint32_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      v102 = off_10005B0E0;
      v103 = v9;
      id v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v103,  &v102,  1LL));
      goto LABEL_56;
    }

    uint64_t v70 = v14;
    if (v13)
    {
      if (v14)
      {
        if (v15)
        {
          if (v17)
          {
            int v18 = 0LL;
            int v19 = 0;
            __int16 v20 = 0LL;
LABEL_28:
            unsigned int v39 = [v17 isEqualToString:off_10005B0C8];
            if (!v39 || v16)
            {
              if (v74) {
                unsigned int v45 = 0;
              }
              else {
                unsigned int v45 = v39;
              }
              if (v45 == 1)
              {
                id v46 = sub_1000233A4();
                dispatch_time_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v79 = "handleSentryTailspinRequest";
                  _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%s: duration is nil for App launch request type",  buf,  0xCu);
                }

                id v48 = sub_100017C70(0LL, (uint64_t)@"duration is nil for App launch request type");
                uint32_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);

                v90[0] = off_10005B080;
                v90[1] = off_10005B0E0;
                v91[0] = v12;
                v91[1] = v9;
                id v43 = v91;
                uint64_t v44 = v90;
              }

              else
              {
                if (v73) {
                  unsigned int v49 = 0;
                }
                else {
                  unsigned int v49 = v39;
                }
                if (v49 == 1)
                {
                  id v50 = sub_1000233A4();
                  id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v79 = "handleSentryTailspinRequest";
                    _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "%s: reason is nil for App launch request type",  buf,  0xCu);
                  }

                  id v52 = sub_100017C70(0LL, (uint64_t)@"reason is nil for App launch request type");
                  uint32_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);

                  v88[0] = off_10005B080;
                  v88[1] = off_10005B0E0;
                  v89[0] = v12;
                  v89[1] = v9;
                  id v43 = v89;
                  uint64_t v44 = v88;
                }

                else
                {
                  if (v72) {
                    unsigned int v53 = 0;
                  }
                  else {
                    unsigned int v53 = v39;
                  }
                  if (v53 != 1)
                  {
                    if (!v19)
                    {
                      if (v39)
                      {
                        v84[0] = off_10005B080;
                        v84[1] = off_10005B0A8;
                        v85[0] = v12;
                        v85[1] = v73;
                        v84[2] = @"PID";
                        v84[3] = @"StartTime";
                        id v14 = v70;
                        v85[2] = v16;
                        v85[3] = v70;
                        v85[4] = v71;
                        v84[4] = @"EndTime";
                        v84[5] = off_10005B0D8;
                        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
                        uint64_t v62 = objc_claimAutoreleasedReturnValue([v61 UUIDString]);
                        v84[6] = off_10005B0C0;
                        v85[5] = v62;
                        v85[6] = off_10005B0C8;
                        id v63 = (void *)v62;
                        __int128 v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v85,  v84,  7LL));
                      }

                      else
                      {
                        v82[0] = off_10005B080;
                        v82[1] = off_10005B0C0;
                        v83[0] = v12;
                        v83[1] = off_10005B0D0;
                        __int128 v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v83,  v82,  2LL));
                        id v14 = v70;
                      }

                      id v64 = sub_1000233A4();
                      id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
                      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
                        sub_10002BC54(v14, v71, v65);
                      }

                      id v75 = v20;
                      +[HTTailspin saveSentryTailspin:infoDict:startTime:endTime:error:]( HTTailspin,  "saveSentryTailspin:infoDict:startTime:endTime:error:",  v13,  v59,  [v14 unsignedLongLongValue],  objc_msgSend(v71, "unsignedLongLongValue"),  &v75);
                      uint32_t v9 = (os_log_s *)v75;

                      if (!v9) {
                        goto LABEL_60;
                      }
                      id v66 = sub_1000233A4();
                      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
                      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                      {
                        v68 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s localizedDescription](v9, "localizedDescription"));
                        *(_DWORD *)buf = 136315394;
                        v79 = "handleSentryTailspinRequest";
                        __int16 v80 = 2112;
                        v81 = v68;
                        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
                      }

                      v76[0] = off_10005B080;
                      v76[1] = off_10005B0E0;
                      v77[0] = v12;
                      v77[1] = v9;
                      id v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v77,  v76,  2LL));

                      id v69 = sub_1000233A4();
                      __int128 v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
                      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315138;
                        v79 = "handleSentryTailspinRequest";
                        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_INFO,  "%s: Posting notification to Sentry due to failure to dump tailspin",  buf,  0xCu);
                      }

LABEL_59:
                      LocalCenter = CFNotificationCenterGetLocalCenter();
                      CFNotificationCenterPostNotification(LocalCenter, off_10005B078, 0LL, v24, 1u);
                      int v18 = v24;
LABEL_60:

                      goto LABEL_61;
                    }

                    uint32_t v9 = (os_log_s *)v20;
                    id v24 = v18;
                    goto LABEL_55;
                  }

                  id v54 = sub_1000233A4();
                  __int128 v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v79 = "handleSentryTailspinRequest";
                    _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%s: threshold is nil for App launch request type",  buf,  0xCu);
                  }

                  id v56 = sub_100017C70(0LL, (uint64_t)@"threshold is nil for App launch request type");
                  uint32_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);

                  v86[0] = off_10005B080;
                  v86[1] = off_10005B0E0;
                  v87[0] = v12;
                  v87[1] = v9;
                  id v43 = v87;
                  uint64_t v44 = v86;
                }
              }
            }

            else
            {
              id v40 = sub_1000233A4();
              uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v79 = "handleSentryTailspinRequest";
                _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%s: pid is nil for App launch request type",  buf,  0xCu);
              }

              id v42 = sub_100017C70(0LL, (uint64_t)@"pid is nil for App launch request type");
              uint32_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);

              v92[0] = off_10005B080;
              v92[1] = off_10005B0E0;
              v93[0] = v12;
              v93[1] = v9;
              id v43 = v93;
              uint64_t v44 = v92;
            }

            id v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v44,  2LL));

LABEL_55:
            id v14 = v70;
LABEL_56:
            id v57 = sub_1000233A4();
            __int128 v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v79 = "handleSentryTailspinRequest";
              _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "%s: infoDict does not contain all necessary info, posting failure notification",  buf,  0xCu);
            }

            __int128 v59 = 0LL;
            goto LABEL_59;
          }

          id v36 = sub_1000233A4();
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v79 = "handleSentryTailspinRequest";
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s: reportType is nil", buf, 0xCu);
          }

          id v38 = sub_100017C70(0LL, (uint64_t)@"reportType is nil");
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(v38);
          v94[0] = off_10005B080;
          v94[1] = off_10005B0E0;
          v95[0] = v12;
          v95[1] = v20;
          v28 = v95;
          id v29 = v94;
        }

        else
        {
          id v33 = sub_1000233A4();
          unsigned int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v79 = "handleSentryTailspinRequest";
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s: endTime is nil", buf, 0xCu);
          }

          id v35 = sub_100017C70(0LL, (uint64_t)@"endTime is nil");
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(v35);
          v96[0] = off_10005B080;
          v96[1] = off_10005B0E0;
          v97[0] = v12;
          v97[1] = v20;
          v28 = v97;
          id v29 = v96;
        }
      }

      else
      {
        id v30 = sub_1000233A4();
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v79 = "handleSentryTailspinRequest";
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: startTime is nil", buf, 0xCu);
        }

        id v32 = sub_100017C70(0LL, (uint64_t)@"startTime is nil");
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v98[0] = off_10005B080;
        v98[1] = off_10005B0E0;
        v99[0] = v12;
        v99[1] = v20;
        v28 = v99;
        id v29 = v98;
      }
    }

    else
    {
      id v25 = sub_1000233A4();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v79 = "handleSentryTailspinRequest";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: fileName is nil", buf, 0xCu);
      }

      id v27 = sub_100017C70(0LL, (uint64_t)@"fileName is nil");
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v100[0] = off_10005B080;
      v100[1] = off_10005B0E0;
      v101[0] = v12;
      v101[1] = v20;
      v28 = v101;
      id v29 = v100;
    }

    int v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v29,  2LL));
    int v19 = 1;
    goto LABEL_28;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v79 = "handleSentryTailspinRequest";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: notification is not a Sentry problem detected notification, returning early",  buf,  0xCu);
  }

  id v69 = archive_write_close(v18);
  uint64_t v70 = archive_write_free(v18);
  if (v69)
  {
    close(v17);
    v71 = sub_1000233A4();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
    id v3 = v105;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v72 = archive_errno(v18);
      v73 = archive_error_string(v18);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v128 = v69;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)&v128[6] = v72;
      *(_WORD *)&v128[10] = 2080;
      *(void *)&v128[12] = v73;
      id v23 = "Error creating compressed file (archive_write_close): %i err_num: %i, err_string: %s";
      goto LABEL_16;
    }

    goto LABEL_17;
  }

  v83 = v70;
  close(v17);
  id v3 = v105;
  if (!v83)
  {

    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v105,  v10));
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v114 = 0LL;
    v93 = [v92 moveItemAtPath:v13 toPath:v37 error:&v114];
    v94 = v114;

    if ((v93 & 1) != 0)
    {
      v95 = v37;
      v96 = chmod((const char *)[v95 UTF8String], 0x1B6u);
      v97 = sub_1000233A4();
      v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
      v99 = v98;
      id v30 = v111;
      id v29 = v112;
      if (v96)
      {
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v128 = v95;
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "Failed to chmod file: %@", buf, 0xCu);
        }

        id v35 = 0LL;
      }

      else
      {
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG)) {
          sub_10002C968((uint64_t)v95, v99);
        }
        id v35 = 1LL;
      }

      os_log_type_t v10 = v108;
    }

    else
    {
      v100 = sub_1000233A4();
      v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
      id v30 = v111;
      id v29 = v112;
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v128 = v13;
        *(_WORD *)&v128[8] = 2112;
        *(void *)&v128[10] = v37;
        *(_WORD *)&v128[18] = 2112;
        v129 = v94;
        _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_DEFAULT,  "Unable to move file %@ to final path %@: %@",  buf,  0x20u);
      }

      v102 = v13;
      if ((unlink((const char *)[v102 UTF8String]) & 0x80000000) == 0)
      {
        id v35 = 0LL;
LABEL_91:
        id v31 = v113;

        id v4 = v110;
LABEL_27:

        goto LABEL_28;
      }

      v103 = sub_1000233A4();
      v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        v104 = *__error();
        *(_DWORD *)buf = 138412546;
        *(void *)v128 = v102;
        *(_WORD *)&v128[8] = 1024;
        *(_DWORD *)&v128[10] = v104;
        _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_DEFAULT,  "Unable to unlink temp archive file %@ due to error %{darwin.errno}d",  buf,  0x12u);
      }

      id v35 = 0LL;
    }

    goto LABEL_91;
  }

  v84 = sub_1000233A4();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v85 = archive_errno(v18);
    v86 = archive_error_string(v18);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v128 = v83;
    *(_WORD *)&v128[4] = 1024;
    *(_DWORD *)&v128[6] = v85;
    *(_WORD *)&v128[10] = 2080;
    *(void *)&v128[12] = v86;
    id v23 = "Error creating compressed file (archive_write_free): %i err_num: %i, err_string: %s";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0x18u);
  }

LABEL_61:
}

void start()
{
  id v0 = objc_autoreleasePoolPush();
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.hangtracer", v2);
  id v4 = (void *)qword_10005BD48;
  qword_10005BD48 = (uint64_t)v3;

  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  unsigned __int8 v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.hangtracer.hud.timer", v6);
  uint64_t v8 = (void *)qword_10005BD50;
  qword_10005BD50 = (uint64_t)v7;

  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)qword_10005BD48, &stru_100048C58);
  sub_1000067BC(0);
  uint64_t v9 = 0LL;
  while (1)
  {
    os_log_type_t v10 = off_100048DA0[v9];
    if (!stat(v10, &v40))
    {
      if ((v40.st_mode & 0xF000) == 0x4000) {
        goto LABEL_10;
      }
      if (unlink(v10) < 0)
      {
        id v17 = sub_1000233A4();
        int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Unable to remove previous non-directory at %s",  buf,  0xCu);
        }
      }
    }

    id v11 = sub_1000233A4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v37 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Create log directory: %s", buf, 0xCu);
    }

    if (mkdir(v10, 0x1EDu))
    {
      id v13 = sub_1000233A4();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = __error();
        id v16 = strerror(*v15);
        *(_DWORD *)buf = 136315394;
        v37 = v10;
        __int16 v38 = 2080;
        unsigned int v39 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Cannot create spool directory - %s failed with %s - continuing anyway.",  buf,  0x16u);
      }
    }

LABEL_10:
    if (++v9 == 3)
    {
      int v19 = objc_alloc_init(&OBJC_CLASS___HTPrefsObserver_hangtracerd);
      __int16 v20 = (void *)qword_10005B210;
      qword_10005B210 = (uint64_t)v19;

      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      uint64_t v22 = qword_10005B210;
      id v23 = NSStringFromSelector("memoryLoggingIntervalSec");
      id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      [v21 addObserver:v22 forKeyPath:v24 options:3 context:off_10005AE38];

      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver( LocalCenter,  0LL,  (CFNotificationCallback)sub_100005EC8,  @"com.apple.hangtracer.htprefs.refreshed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      [v26 setupPrefsWithQueue:qword_10005BD48];

      id v27 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      v28 = (void *)qword_10005BD40;
      qword_10005BD40 = (uint64_t)v27;

      [(id)qword_10005BD40 setDateFormat:@"yyyy-MM-dd-HHmmss.SSS"];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100008124;
      handler[3] = &unk_100048C18;
      id v29 = xpc_connection_create_mach_service("com.apple.hangtracerd", (dispatch_queue_t)qword_10005BD48, 1uLL);
      void handler[4] = v29;
      xpc_connection_set_event_handler(v29, handler);
      xpc_connection_resume(v29);
      byte_10005B219 = 1;
      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      unsigned int v31 = [v30 shouldIncludeDisplayData];

      if (v31)
      {
        +[HTProcessInfo addDisplayStateChangeEvent:]( &OBJC_CLASS___HTProcessInfo,  "addDisplayStateChangeEvent:",  mach_absolute_time(),  0xFFFFFFFFLL);
        notify_register_dispatch( "com.apple.iokit.hid.displayStatus",  &v40.st_dev,  (dispatch_queue_t)qword_10005BD48,  &stru_100048C98);
      }

      id v32 = sub_1000233A4();
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v40.st_dev = 138412290;
        *(void *)&v40.st_mode = off_10005B070;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "Adding %@ notification observer",  (uint8_t *)&v40,  0xCu);
      }

      unsigned int v34 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver( v34,  0LL,  (CFNotificationCallback)sub_100007028,  off_10005B070,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
      dispatch_main();
    }
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v8]);
  [v26 update:v9 options:a5];
}

    ++v9;
    shmem_region = self->shmem_region;
    v11 += 376LL;
    if (v9 >= shmem_region->var1) {
      goto LABEL_11;
    }
  }

  *(void *)((char *)shmem_region + v11 - 372) = -1LL;
  if (*((_BYTE *)&shmem_region->var0 + v11))
  {
    *((_BYTE *)&shmem_region->var0 + v11) = 0;
    int v19 = sub_1000233A4();
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = sub_100018A78(a4);
      uint64_t v22 = (NSString *)objc_claimAutoreleasedReturnValue(v21);
      processBundleID = self->processBundleID;
      *(_DWORD *)buf = 138543874;
      __int16 v80 = v22;
      v81 = 2114;
      v82 = *(double *)&processBundleID;
      v83 = 2048;
      v84 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Hang %{public}@ detected for bundleid %{public}@ for already reported user switched away hang, startTime %llu",  buf,  0x20u);
    }

    goto LABEL_11;
  }

  id v24 = strncmp((const char *)shmem_region + v11 - 256, "com.apple.HangTracer.HangTracerTests.testbundleid", 0x100uLL);
  id v25 = sub_1000233A4();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v25);
  id v26 = os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT);
  if (!v24)
  {
    if (v26)
    {
      id v36 = sub_100018A78(a4);
      v37 = (NSString *)objc_claimAutoreleasedReturnValue(v36);
      *(_DWORD *)buf = 138543362;
      __int16 v80 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Hang %{public}@ detected: xctest with debugger attached will still be tracked as non-debugger hang",  buf,  0xCu);
    }

LABEL_25:
    if (a4 == 2)
    {
      __int16 v38 = (char *)shmem_region + v11;
      kdebug_trace(606208012LL, v13, a3, *(void *)(v38 - 332), 0LL);
      unsigned int v39 = v38 - 320;
      j__ADClientPushValueForDistributionKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.ht_always_on.%s.%@",  v38 - 320,  self->processBundleID),  v15);
      stat v40 = self->processBundleID;
      uint64_t v41 = sub_100018604();
      id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      sub_100018674(@"Timed Out Runloop Hang", v40, v13, a3, v42);

      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472LL;
      void v77[2] = sub_10001A794;
      v77[3] = &unk_1000499C8;
      v77[4] = self;
      v77[5] = 2LL;
      *(double *)&v77[6] = v15;
      AnalyticsSendEventLazy(off_10005B0E8, v77);
      id v43 = sub_1000233A4();
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v45 = sub_100018A78(2uLL);
        id v46 = (NSString *)objc_claimAutoreleasedReturnValue(v45);
        dispatch_time_t v47 = self->processBundleID;
        id v48 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        unsigned int v49 = [v48 runloopHangTimeoutDurationMSec];
        *(_DWORD *)buf = 138543874;
        __int16 v80 = v46;
        v81 = 2114;
        v82 = *(double *)&v47;
        unsigned int v39 = v38 - 320;
        v83 = 2048;
        v84 = (unint64_t)v49;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Hang %{public}@ detected, %{public}@ hang is over timeout threshold of %llu exceeded => capturing hang log",  buf,  0x20u);
      }

      id v50 = objc_alloc(&OBJC_CLASS___HTTimeoutHangInfo);
      id v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v39));
      id v52 = *(void *)(v38 - 332);
      unsigned int v53 = *(v38 - 344) != 0;
      LOBYTE(v73) = 0;
      LOBYTE(v71) = -[HTProcessInfo isThirdPartyDevSupportModeHang](self, "isThirdPartyDevSupportModeHang");
      id v17 = -[HTTimeoutHangInfo initWithServiceName:threadID:startTime:endTime:saveTailspin:subType:userActionData:isThirdPartyDevSupportModeHang:processInfo:captureMicroHang:]( v50,  "initWithServiceName:threadID:startTime:endTime:saveTailspin:subType:userActionData:isThirdPartyDevSupportM odeHang:processInfo:captureMicroHang:",  v51,  v52,  v13,  a3,  v53,  2LL,  0LL,  v71,  self,  v73);

      id v54 = @"com.apple.hangtracer.DaemonTimeout.HangCount";
      goto LABEL_48;
    }

    j__ADClientPushValueForDistributionKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.ht_app_exit_hang.%s.%s",  (char *)shmem_region + v11 - 320,  (char *)shmem_region + v11 - 256),  v15);
    __int128 v55 = (char *)shmem_region + v11 - 342;
    id v56 = *v55;
    if (!*v55) {
      goto LABEL_35;
    }
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    if (v15 > (double)(unint64_t)[v4 runloopHangDurationThresholdMSec])
    {

LABEL_38:
      __int128 v59 = sub_1000233A4();
      id v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = @"first party";
        isFirstPartyApp = self->isFirstPartyApp;
        if (!self->isFirstPartyApp) {
          v61 = @"third party";
        }
        v74 = *(double *)&v61;
        id v75 = self->processBundleID;
        id v63 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        id v64 = v63;
        if (isFirstPartyApp) {
          id v65 = [v63 runloopHangDurationThresholdMSec];
        }
        else {
          id v65 = [v63 runloopHangThirdPartyDurationThresholdMSec];
        }
        *(_DWORD *)buf = 138543874;
        __int16 v80 = v75;
        v81 = 2112;
        v82 = v74;
        v83 = 2048;
        v84 = (unint64_t)v65;
        _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Hang on App Exit detected, %{public}@ hang is over %@ log threshold of %llu exceeded => capturing hang log",  buf,  0x20u);
      }

      id v66 = objc_alloc(&OBJC_CLASS___HTTimeoutHangInfo);
      v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  (char *)shmem_region + v11 - 320));
      v68 = (char *)shmem_region + v11;
      id v69 = *(void *)((char *)shmem_region + v11 - 332);
      uint64_t v70 = *(v68 - 344) != 0;
      LOBYTE(v73) = 0;
      LOBYTE(v72) = -[HTProcessInfo isThirdPartyDevSupportModeHang](self, "isThirdPartyDevSupportModeHang");
      id v17 = -[HTTimeoutHangInfo initWithServiceName:threadID:startTime:endTime:saveTailspin:subType:userActionData:isThirdPartyDevSupportModeHang:processInfo:captureMicroHang:]( v66,  "initWithServiceName:threadID:startTime:endTime:saveTailspin:subType:userActionData:isThirdPartyDevSupportM odeHang:processInfo:captureMicroHang:",  v67,  v69,  v13,  a3,  v70,  8LL,  0LL,  v72,  self,  v73);

      j__ADClientAddValueForScalarKey(@"com.apple.ht_app_exit_hang.log_capture", 1LL);
      goto LABEL_47;
    }

    if (*v55)
    {
    }

    else
    {
LABEL_35:
      id v57 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      __int128 v58 = (double)(unint64_t)[v57 runloopHangThirdPartyDurationThresholdMSec];

      if (v56) {
      if (v15 > v58)
      }
        goto LABEL_38;
    }

    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    void v76[2] = sub_10001A898;
    v76[3] = &unk_1000499C8;
    v76[4] = self;
    v76[5] = 8LL;
    *(double *)&v76[6] = v15;
    AnalyticsSendEventLazy(off_10005B0E8, v76);
    id v17 = 0LL;
LABEL_47:
    id v54 = @"com.apple.ht_app_exit_hang.count";
LABEL_48:
    j__ADClientAddValueForScalarKey(v54, 1LL);
    return v17;
  }

  if (v26)
  {
    id v27 = sub_100018A78(a4);
    v28 = (NSString *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138543618;
    __int16 v80 = v28;
    v81 = 2048;
    v82 = v15 / 1000.0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Hang %{public}@ detected: %.2fs (debugger attached, not reporting)",  buf,  0x16u);
  }

  id v29 = sub_100018A78(a4);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  j__ADClientPushValueForDistributionKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.ht_debugger_attached.%@.%s",  v30,  (char *)shmem_region + v11 - 256),  v15);

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_10001A690;
  v78[3] = &unk_1000499C8;
  v78[4] = self;
  v78[5] = a4;
  *(double *)&v78[6] = v15;
  AnalyticsSendEventLazy(off_10005B0E8, v78);
  unsigned int v31 = sub_100018A78(a4);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  id v33 = self->processBundleID;
  unsigned int v34 = sub_100018604();
  id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  sub_100018674(v32, v33, v13, a3, v35);

LABEL_11:
  id v17 = 0LL;
  return v17;
}

    uint64_t v15 = 0LL;
    id v16 = 0LL;
LABEL_28:
    v28 = 0;
    goto LABEL_29;
  }

  v28 = 0;
LABEL_30:

  return v28;
}

void sub_100008054(id a1, OS_xpc_object *a2)
{
  id v2 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(a2, _xpc_event_key_name));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_1000233A4();
  dispatch_queue_attr_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    dispatch_queue_t v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "hangtracerd: Received XPC Event via notifyd: notification name = %{public}@",  (uint8_t *)&v6,  0xCu);
  }
}

void sub_100008124(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    id v8 = sub_1000233A4();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v21 = 67109120;
      *(_DWORD *)&v21[4] = xpc_connection_get_pid((xpc_connection_t)v3);
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "XPC: Client started new connection: pid %d",  v21,  8u);
    }

    os_log_type_t v10 = (_xpc_connection_s *)v3;
    xpc_connection_set_target_queue(v10, (dispatch_queue_t)qword_10005BD48);
    *(void *)id v21 = _NSConcreteStackBlock;
    *(void *)&v21[8] = 3221225472LL;
    *(void *)&v21[16] = sub_1000090F8;
    uint64_t v22 = &unk_100048C18;
    id v23 = v10;
    dispatch_queue_t v7 = v10;
    xpc_connection_set_event_handler(v7, v21);
    xpc_connection_resume(v7);

    goto LABEL_8;
  }

  xpc_type_t v5 = type;
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    if (v3 == &_xpc_error_connection_invalid)
    {
      pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      id v20 = sub_1000233A4();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v21 = 136315394;
        *(void *)&v21[4] = string;
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = pid;
        uint64_t v15 = "xpc_error_connection_invalid %s - pid %d";
        id v16 = v13;
        os_log_type_t v17 = OS_LOG_TYPE_INFO;
        uint32_t v18 = 18;
        goto LABEL_17;
      }
    }

    else
    {
      id v12 = sub_1000233A4();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v3 == &_xpc_error_connection_interrupted)
      {
        if (v14)
        {
          *(_DWORD *)id v21 = 136315138;
          *(void *)&v21[4] = string;
          uint64_t v15 = "xpc_error_connection_interrupted: %s";
          id v16 = v13;
          os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
          uint32_t v18 = 12;
          goto LABEL_17;
        }
      }

      else if (v14)
      {
        *(_DWORD *)id v21 = 134218242;
        *(void *)&v21[4] = v3;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = string;
        uint64_t v15 = "hangtracerd: Connection error: %p : %s";
        id v16 = v13;
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        uint32_t v18 = 22;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, v21, v18);
      }
    }

    goto LABEL_19;
  }

  id v6 = sub_1000233A4();
  dispatch_queue_t v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v21 = 134217984;
    *(void *)&v21[4] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "hangtracerd: unknown event type : %p",  v21,  0xCu);
  }

LABEL_8:
LABEL_19:
}

      v4 += 3LL;
      if (v4 == 15) {
        goto LABEL_9;
      }
    }

    dispatch_queue_t v7 = sub_100025798(v6);
LABEL_7:
    id v8 = sub_100025798(v5);
    sub_1000222FC((uint64_t)"Fence Hang", v1, v5, v6, 0, 0, v7 - v8);
    goto LABEL_8;
  }

    id v2 = sub_1000247F4(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    dispatch_queue_attr_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);

    return v1;
  }

  if (a1 == 439025681)
  {
    dispatch_queue_attr_t v1 = @"InputUI Scene";
    return v1;
  }

  if (a1 != 1539435076) {
    goto LABEL_8;
  }
  dispatch_queue_attr_t v1 = @"Clear the Board";
  return v1;
}

    uint64_t v9 = 0LL;
    goto LABEL_9;
  }

  os_log_type_t v10 = sub_100025798(a2 - (void)[v5 hangEndTime]);
  uint64_t v9 = 1LL;
  if (v10 >= 200.0 && v6 > a3) {
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

void sub_1000083F4(id a1, int a2)
{
  uint64_t state64 = 0LL;
  if (!notify_get_state(a2, &state64))
  {
    uint64_t v2 = mach_absolute_time();
    +[HTProcessInfo addDisplayStateChangeEvent:]( &OBJC_CLASS___HTProcessInfo,  "addDisplayStateChangeEvent:",  v2,  state64 != 0);
    id v3 = sub_1000233A4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      BOOL v7 = state64 == 0;
      __int16 v8 = 2048;
      uint64_t v9 = state64;
      __int16 v10 = 2048;
      uint64_t v11 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Display state changed %d -> %llu,  time: %llu",  buf,  0x1Cu);
    }
  }

void sub_100008670()
{
  if (qword_10005B220)
  {
    id v0 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    dispatch_time_t v1 = dispatch_time(0, 1000000000 * [v0 memoryLoggingIntervalSec]);

    uint64_t v2 = (dispatch_source_s *)qword_10005B220;
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    dispatch_source_set_timer( v2,  v1,  1000000000 * [v3 memoryLoggingIntervalSec],  0x3B9ACA00uLL);
  }

void sub_100008730(id a1)
{
  uint64_t v1 = mach_absolute_time();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  int v3 = [v2 runLoopHangPerPeriodLogLimit];

  if (v3 >= 1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unint64_t v5 = (unint64_t)[v4 reportPeriodMATU];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unint64_t v7 = v5 / (int)[v6 runLoopHangPerPeriodLogLimit];

    if (v1 - qword_10005B238 > v7)
    {
      +[HTTailspin refreshAppGeneratedLogsCount](&OBJC_CLASS___HTTailspin, "refreshAppGeneratedLogsCount");
      qword_10005B238 = v1;
    }
  }

  if (qword_10005B240)
  {
    if (v1 - qword_10005B240 < 0x1E2CC310001LL) {
      goto LABEL_8;
    }
    +[HTTailspin resetLogCountsForDailyRollover](&OBJC_CLASS___HTTailspin, "resetLogCountsForDailyRollover");
  }

  qword_10005B240 = v1;
LABEL_8:
  if (v1 - qword_10005B248 >= 0x141DD76001LL)
  {
    id v8 = sub_1000233A4();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10002BD10();
    }

    qword_10005B248 = v1;
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v10 timeIntervalSinceReferenceDate];
    double v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    [v13 eplTimeoutTimestampSec];
    double v15 = v14;

    if (v12 < v15) {
      goto LABEL_46;
    }
    id v50 = v10;
    id v16 = sub_1000233A4();
    os_log_type_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "PLDE failed to turn EPL off properly, turning off hangtracerd",  buf,  2u);
    }

    uint64_t v51 = v1;

    uint32_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[RMECacheEnumerator getEPLProfilePath](&OBJC_CLASS___RMECacheEnumerator, "getEPLProfilePath"));
    if (v18)
    {
      int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v61 = 0LL;
      unsigned int v20 = [v19 removeItemAtPath:v18 error:&v61];
      id v21 = v61;

      id v22 = sub_1000233A4();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v24)
        {
          *(_DWORD *)buf = 138412290;
          v67 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Deleted ReportMemoryException plist at %@",  buf,  0xCu);
        }
      }

      else if (v24)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedDescription]);
        *(_DWORD *)buf = 138412546;
        v67 = v18;
        __int16 v68 = 2112;
        id v69 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Failed to delete ReportMemoryException plist at %@ with error: %@",  buf,  0x16u);
      }
    }

    id v26 = sub_100027AD0(@"com.apple.da", @"mobile", (uint64_t)@"HTEPL");
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = sub_100027AD0(@"com.apple.hangtracer", @"mobile", (uint64_t)@"HTEPL");
    unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue(v28);
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id obj = v27;
    id v29 = [obj countByEnumeratingWithState:&v57 objects:buf count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v58;
      do
      {
        for (i = 0LL; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v58 != v31) {
            objc_enumerationMutation(obj);
          }
          id v33 = *(const __CFString **)(*((void *)&v57 + 1) + 8LL * (void)i);
          id v34 = sub_1000233A4();
          id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v64 = 138412290;
            id v65 = v33;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Removing OTA Key: %@", v64, 0xCu);
          }

          CFPreferencesSetValue(v33, 0LL, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
        }

        id v30 = [obj countByEnumeratingWithState:&v57 objects:buf count:16];
      }

      while (v30);
    }

    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v36 = v49;
    id v37 = [v36 countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v54;
      do
      {
        for (j = 0LL; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v54 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(const __CFString **)(*((void *)&v53 + 1) + 8LL * (void)j);
          id v42 = sub_1000233A4();
          id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v62 = 138412290;
            id v63 = v41;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Removing HT Key: %@", v62, 0xCu);
          }

          CFPreferencesSetValue(v41, 0LL, @"com.apple.hangtracer", @"mobile", kCFPreferencesAnyHost);
        }

        id v38 = [v36 countByEnumeratingWithState:&v53 objects:v64 count:16];
      }

      while (v38);
    }

    int v44 = sub_100011B4C(0);
    id v45 = sub_1000233A4();
    id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
    if (v44)
    {
      uint64_t v1 = v51;
      if (v47)
      {
        *(_WORD *)uint64_t v62 = 0;
        id v48 = "Successfully reset tailspin to default system configuration";
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, v48, v62, 2u);
      }
    }

    else
    {
      uint64_t v1 = v51;
      if (v47)
      {
        *(_WORD *)uint64_t v62 = 0;
        id v48 = "Failed to reset tailspin to default system configuration, tailspin will likely remain enabled on this device";
        goto LABEL_44;
      }
    }

    sub_100017F30(@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/HangTracer/");
    sub_100018268(0);
    notify_post(off_10005B040[0]);
    notify_post(off_10005B038[0]);

    __int16 v10 = v50;
LABEL_46:
  }

  +[HTProcessInfo checkForHangTimeouts:](&OBJC_CLASS___HTProcessInfo, "checkForHangTimeouts:", v1);
}

void sub_100008D90(id a1)
{
  id v1 = sub_10000421C();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  unint64_t v7 = v2;
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  id v4 =  +[HTUserNotificationHelper sharedHelperWithCategories:]( &OBJC_CLASS___HTUserNotificationHelper,  "sharedHelperWithCategories:",  v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[HTUserNotificationHelper sharedHelperWithCategories:]( &OBJC_CLASS___HTUserNotificationHelper,  "sharedHelperWithCategories:",  0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  [v5 associatePrefix:v6 withHandler:0];
}

void sub_100008E6C(id a1)
{
  uint64_t v1 = mach_absolute_time();
  +[HTProcessInfo checkForHUDTimeouts:](&OBJC_CLASS___HTProcessInfo, "checkForHUDTimeouts:", v1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v3 = [v2 shouldDisplayFenceHangToHUD];

  if (v3)
  {
    uint64_t v4 = 0LL;
    while (1)
    {
      uint64_t v5 = qword_10005B258[v4 + 1];
      if (v5)
      {
        uint64_t v6 = qword_10005B258[v4 + 2];
        double v7 = sub_100025798(v1);
        if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_7;
        }
        if (v7 - sub_100025798(v6) < 1000.0) {
          break;
        }
      }

BOOL sub_100008F78(id a1, NSURL *a2, NSError *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  id v6 = sub_1000233A4();
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    __int16 v10 = v4;
    __int16 v11 = 2112;
    double v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to enumerate file at %@ : %@",  (uint8_t *)&v9,  0x16u);
  }

  return 1;
}

id sub_100009048(uint64_t a1)
{
  v5[0] = @"DeletionSucceeded";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  v5[1] = @"FileSizeBytes";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  2LL));

  return v3;
}

void sub_1000090F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    double v8 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v9 = v3;
    int64_t pid = xpc_connection_get_pid(v8);
    if ((int)pid <= 0)
    {
      id v25 = sub_1000233A4();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v183 = pid;
        id v27 = "%d is not a valid pid to watch";
        v28 = v26;
        os_log_type_t v29 = OS_LOG_TYPE_INFO;
        uint32_t v30 = 8;
LABEL_49:
        _os_log_impl((void *)&_mh_execute_header, v28, v29, v27, buf, v30);
      }

      goto LABEL_102;
    }

    int64_t int64 = xpc_dictionary_get_int64(v9, "command");
    switch(int64)
    {
      case 1LL:
        xpc_object_t value = xpc_dictionary_get_value(v9, "shmem");
        id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(value);
        id v26 = v35;
        if (!v35)
        {
          id v99 = sub_1000233A4();
          uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_101;
          }
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v183 = pid;
          v97 = "Didn't get shmem from no longer watching %d";
          goto LABEL_97;
        }

        region[0] = 0LL;
        size_t v36 = xpc_shmem_map(v35, region);
        if (region[0])
        {
          size_t v37 = v36;
          if (v36)
          {
            string = xpc_dictionary_get_string(v9, "bundle-id");
            uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[HTProcessInfo startWatchingPid:sharedMem:length:bundleID:]( &OBJC_CLASS___HTProcessInfo,  "startWatchingPid:sharedMem:length:bundleID:",  pid,  region[0],  v37,  string));
            if (v39)
            {
              id v40 = sub_1000233A4();
              uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                id v42 = xpc_dictionary_get_string(v9, "name");
                *(_DWORD *)buf = 138543618;
                *(void *)v183 = v39;
                *(_WORD *)&v183[8] = 2082;
                *(void *)&v183[10] = v42;
                _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Initialization complete now watching hangs for %{public}@ | %{public}s",  buf,  0x16u);
              }
            }

            goto LABEL_101;
          }
        }

        region[0] = 0LL;
        id v102 = sub_1000233A4();
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_101;
        }
        *(_WORD *)buf = 0;
        v97 = "Something wrong w/shmem";
        v100 = v39;
        uint32_t v101 = 2;
        goto LABEL_100;
      case 2LL:
        +[HTProcessInfo stopWatchingPid:](&OBJC_CLASS___HTProcessInfo, "stopWatchingPid:", pid);
        goto LABEL_103;
      case 3LL:
        goto LABEL_67;
      case 4LL:
        id v43 = sub_1000233A4();
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_102;
        }
        *(_WORD *)buf = 0;
        id v27 = "HTActivationStats: Received an app activation event but hangtracerd was compiled without app activation logging";
        goto LABEL_35;
      case 5LL:
        id v44 = sub_1000233A4();
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_102;
        }
        *(_WORD *)buf = 0;
        id v27 = "HTActivationStats: Received an app activation event but hangtracerd was compiled without app activation logging";
LABEL_35:
        v28 = v26;
        os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
        uint32_t v30 = 2;
        goto LABEL_49;
      case 6LL:
        id v45 = sub_1000233A4();
        id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          sub_10002BD3C();
        }

        uint64_t int64 = xpc_dictionary_get_uint64(v9, "name");
        uint64_t v48 = xpc_dictionary_get_uint64(v9, "startTime");
        uint64_t v49 = v48;
        int v50 = dword_10005B2D0 % 5;
        else {
          int v51 = 0;
        }
        dword_10005B2D0 = v51;
        id v52 = &qword_10005B258[3 * v50];
        uint64_t *v52 = uint64;
        v52[1] = v48;
        v52[2] = 0x7FFFFFFFFFFFFFFFLL;
        dword_10005B2D4 = v50;
        id v53 = sub_1000233A4();
        __int128 v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218496;
          *(void *)v183 = uint64;
          *(_WORD *)&v183[8] = 2048;
          *(void *)&v183[10] = v49;
          *(_WORD *)&v183[18] = 1024;
          *(_DWORD *)&v183[20] = v50;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEBUG,  "saveFenceStartTime: name=%llu, start=%llu, arr_index=%d",  buf,  0x1Cu);
        }

        goto LABEL_103;
      case 7LL:
        id v55 = sub_1000233A4();
        __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
          sub_10002BD68();
        }

        uint64_t v57 = xpc_dictionary_get_uint64(v9, "name");
        uint64_t v58 = xpc_dictionary_get_uint64(v9, "endTime");
        sub_10000A474(v57, v58);
        goto LABEL_103;
      case 8LL:
      case 10LL:
        int64_t v12 = int64;
        uint64_t v13 = xpc_dictionary_get_uint64(v9, "name");
        uint64_t v14 = xpc_dictionary_get_uint64(v9, "startTime");
        uint64_t v15 = xpc_dictionary_get_uint64(v9, "endTime");
        id v16 = sub_1000233A4();
        os_log_type_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        v169 = v8;
        if (v12 == 10)
        {
          if (v18)
          {
            *(_DWORD *)buf = 134218496;
            *(void *)v183 = v13;
            *(_WORD *)&v183[8] = 2048;
            *(void *)&v183[10] = v14;
            *(_WORD *)&v183[18] = 2048;
            *(void *)&v183[20] = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Got CA Fence Blown message (fenceName:%llu, startTime:%llu, endTime:%llu)",  buf,  0x20u);
          }

          uint64_t v19 = 5LL;
        }

        else
        {
          if (v18)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "HTFenceTracking: Fence blown", buf, 2u);
          }

          sub_10000A474(v13, v15);
          uint64_t v13 = 0LL;
          uint64_t v19 = 4LL;
        }

        v93 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        LOWORD(v154) = 0;
        +[HTProcessInfo recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:]( HTProcessInfo,  "recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHan g:captureMicroHang:",  @"Fence-hang",  v14 - 12000000,  v15 + 12000000,  v15,  v13,  [v93 htTailspinEnabled],  v19,  v154);

        double v8 = v169;
        goto LABEL_103;
      case 11LL:
        __int128 v60 = (os_log_s *)xpc_connection_copy_entitlement_value(v8, "com.apple.hangtracer.collect-logs");
        id v26 = v60;
        if (!v60 || xpc_get_type(v60) != (xpc_type_t)&_xpc_type_BOOL || !xpc_BOOL_get_value(v26))
        {
          id v94 = sub_10000A5EC(pid);
          uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
          id v95 = sub_1000233A4();
          id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)v183 = v39;
            *(_WORD *)&v183[8] = 1024;
            *(_DWORD *)&v183[10] = pid;
            *(_WORD *)&v183[14] = 2080;
            *(void *)&v183[16] = "com.apple.hangtracer.collect-logs";
            v67 = "client %{public}@ [%d] does not bear entitlement %s; refusing HANGTRACER_XPC_CMD_COLLECT_LOGS command";
            __int16 v68 = v66;
            uint32_t v69 = 28;
            goto LABEL_88;
          }

LABEL_89:
          goto LABEL_101;
        }

        id v61 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v9, "archiveSaveDirectory"));
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        BOOL v62 = xpc_dictionary_get_BOOL(v9, "archiveCompressionBypass");
        id v63 = sub_1000233A4();
        id v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
          sub_10002BD94((uint64_t)v39, v64);
        }

        if (!v39 || (sub_10001675C(v39, v62) & 1) == 0)
        {
          id v65 = sub_1000233A4();
          id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v183 = v39;
            v67 = "HT command HANGTRACER_XPC_CMD_COLLECT_LOGS failed to save the archive in directory %@";
            __int16 v68 = v66;
            uint32_t v69 = 12;
LABEL_88:
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, v67, buf, v69);
            goto LABEL_89;
          }

          goto LABEL_89;
        }

LABEL_101:
        goto LABEL_102;
      case 12LL:
        uint64_t v70 = (os_log_s *)xpc_connection_copy_entitlement_value(v8, "com.apple.hangtracer.logs-processed");
        id v26 = v70;
        if (!v70 || xpc_get_type(v70) != (xpc_type_t)&_xpc_type_BOOL)
        {
          id v71 = sub_10000A5EC(pid);
          v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
          goto LABEL_62;
        }

        BOOL v103 = xpc_BOOL_get_value(v26);
        id v104 = sub_10000A5EC(pid);
        v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
        v72 = v105;
        if (!v103)
        {
LABEL_62:
          id v73 = sub_1000233A4();
          v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)v183 = v72;
            *(_WORD *)&v183[8] = 1024;
            *(_DWORD *)&v183[10] = pid;
            *(_WORD *)&v183[14] = 2080;
            *(void *)&v183[16] = "com.apple.hangtracer.logs-processed";
            _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "client %{public}@ [%d] does not bear entitlement %s; refusing HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED command",
              buf,
              0x1Cu);
          }

LABEL_65:
LABEL_102:

LABEL_103:
          goto LABEL_104;
        }

        if ([v105 isEqualToString:@"hangreporter"])
        {
          size_t length = 0LL;
          data = xpc_dictionary_get_data(v9, "hangLogInfo", &length);
          if (data)
          {
            if (length)
            {
              uint64_t v107 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  data,  length,  0LL));
              if (v107)
              {
                v108 = (os_log_s *)v107;
                v170 = v8;
                v109 = objc_alloc(&OBJC_CLASS___NSSet);
                v184[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
                v184[1] = objc_opt_class(&OBJC_CLASS___NSArray);
                v184[2] = objc_opt_class(&OBJC_CLASS___NSString);
                v184[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
                v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v184,  4LL));
                v111 = -[NSSet initWithArray:](v109, "initWithArray:", v110);

                id v176 = 0LL;
                v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v111,  v108,  &v176));
                id v113 = v176;
                id v114 = sub_1000233A4();
                v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
                if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG)) {
                  sub_10002BE08((uint64_t)v112, (uint64_t)v113, v115);
                }

                v164 = v113;
                v166 = v72;
                if (!v112 || v113)
                {
                  id v147 = sub_1000233A4();
                  v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);
                  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v183 = v113;
                    _os_log_impl( (void *)&_mh_execute_header,  v130,  OS_LOG_TYPE_DEFAULT,  "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED failed to unarchive the data dictionary with error: %@",  buf,  0xCu);
                  }

                  double v8 = v170;
                  goto LABEL_144;
                }

                __int128 v174 = 0u;
                __int128 v175 = 0u;
                *(_OWORD *)region = 0u;
                __int128 v173 = 0u;
                v116 = (char *)[&off_100050968 countByEnumeratingWithState:region objects:buf count:16];
                double v8 = v170;
                v162 = v26;
                v157 = v111;
                v159 = v108;
                if (v116)
                {
                  v117 = v116;
                  uint64_t v118 = *(void *)v173;
                  char v119 = 1;
                  do
                  {
                    for (i = 0LL; i != v117; ++i)
                    {
                      if (*(void *)v173 != v118) {
                        objc_enumerationMutation(&off_100050968);
                      }
                      v121 = (void *)*((void *)region[1] + (void)i);
                      v122 = (void *)objc_claimAutoreleasedReturnValue([v112 objectForKey:v121]);

                      if (!v122)
                      {
                        id v123 = sub_1000233A4();
                        v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
                        if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v178 = 138412290;
                          v179 = v121;
                          _os_log_impl( (void *)&_mh_execute_header,  v124,  OS_LOG_TYPE_DEFAULT,  "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED dictionary will not post a notification du e to missing key: %@",  v178,  0xCu);
                        }

                        char v119 = 0;
                      }
                    }

                    v117 = (char *)[&off_100050968 countByEnumeratingWithState:region objects:buf count:16];
                  }

                  while (v117);
                  id v26 = v162;
                  v111 = v157;
                  v108 = v159;
                  if ((v119 & 1) == 0) {
                    goto LABEL_145;
                  }
                }

                v125 = (void *)objc_claimAutoreleasedReturnValue([v112 objectForKeyedSubscript:@"displayedInHUD"]);
                unsigned int v126 = [v125 BOOLValue];

                if (!v126) {
                  goto LABEL_145;
                }
                id v161 = v9;
                v127 = (void *)objc_claimAutoreleasedReturnValue([v112 objectForKeyedSubscript:@"startWallTime"]);
                [v127 doubleValue];
                double v129 = v128;

                v130 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v129));
                v131 = (void *)objc_claimAutoreleasedReturnValue([v112 objectForKeyedSubscript:@"durationMS"]);
                [v131 doubleValue];
                double v133 = v132;

                v134 = (void *)objc_claimAutoreleasedReturnValue([v112 objectForKeyedSubscript:@"processPath"]);
                v135 = sub_100017BD0(v134);
                id v171 = 0LL;
                v136 = (void *)objc_claimAutoreleasedReturnValue(v135);
                id v168 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v136 allowPlaceholder:0 error:&v171];
                id v137 = v171;
                if (v137)
                {
                  id v138 = sub_1000233A4();
                  v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
                  if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v178 = 138543618;
                    v179 = v136;
                    __int16 v180 = 2112;
                    id v181 = v137;
                    _os_log_impl( (void *)&_mh_execute_header,  v139,  OS_LOG_TYPE_DEFAULT,  "Unable to create an LS application record from bundle id %{public}@: %@",  v178,  0x16u);
                  }

                  uint64_t v140 = objc_claimAutoreleasedReturnValue([v134 lastPathComponent]);
                }

                else
                {
                  v148 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
                  v149 = (void *)objc_claimAutoreleasedReturnValue([v148 thirdPartyDevPreferredLanguages]);
                  id v150 = [v149 count];

                  if (v150)
                  {
                    v151 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
                    v152 = (void *)objc_claimAutoreleasedReturnValue([v151 thirdPartyDevPreferredLanguages]);
                    v141 = (void *)objc_claimAutoreleasedReturnValue([v168 localizedNameWithPreferredLocalizations:v152]);

                    goto LABEL_143;
                  }

                  uint64_t v140 = objc_claimAutoreleasedReturnValue([v168 localizedName]);
                }

                v141 = (void *)v140;
LABEL_143:
                v153 = (void *)objc_claimAutoreleasedReturnValue([v112 objectForKeyedSubscript:@"hangUUID"]);
                sub_100004240(v141, v153, v133);

                double v8 = v170;
                id v9 = v161;
                id v26 = v162;
                v111 = v157;
                v108 = v159;
LABEL_144:

LABEL_145:
                v72 = v166;
                goto LABEL_146;
              }
            }
          }

          id v146 = sub_1000233A4();
          v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v146);
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v143 = "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED failed to retrieve the hang log info NSData";
            v144 = v108;
            uint32_t v145 = 2;
            goto LABEL_137;
          }
        }

        else
        {
          id v142 = sub_1000233A4();
          v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v142);
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)v183 = v72;
            *(_WORD *)&v183[8] = 1024;
            *(_DWORD *)&v183[10] = pid;
            v143 = "client %{public}@ [%d] is not expected to issue this command; refusing HANGTRACER_XPC_CMD_HANG_LOGS_P"
                   "ROCESSED command";
            v144 = v108;
            uint32_t v145 = 18;
LABEL_137:
            _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, v143, buf, v145);
          }
        }

LABEL_146:
        goto LABEL_65;
      case 13LL:
        int64_t pid = xpc_dictionary_get_int64(v9, "pid");
LABEL_67:
        uint64_t v75 = objc_claimAutoreleasedReturnValue(+[HTProcessInfo processForPid:](&OBJC_CLASS___HTProcessInfo, "processForPid:", pid));
        id v26 = (os_log_s *)v75;
        if (v75)
        {
          v167 = (os_log_s *)v75;
          unint64_t v76 = xpc_dictionary_get_int64(v9, "startTime");
          unint64_t v77 = xpc_dictionary_get_int64(v9, "endTime");
          int64_t v158 = xpc_dictionary_get_int64(v9, "threadID");
          v156 = xpc_dictionary_get_string(v9, "name");
          BOOL v165 = xpc_dictionary_get_BOOL(v9, "saveReport");
          int v155 = xpc_dictionary_get_int64(v9, "hangSubtype");
          BOOL v163 = xpc_dictionary_get_BOOL(v9, "saveMicroHang");
          xpc_dictionary_get_data(v9, "userActionData", (size_t *)region);
          uint64_t v78 = 0LL;
          unint64_t v79 = 0LL;
          __int16 v80 = (unint64_t *)&unk_10005B268;
          do
          {
            unint64_t v81 = *(v80 - 1);
            unint64_t v82 = *v80;
            if (v81 <= v76) {
              unint64_t v81 = v76;
            }
            if (v82 >= v77) {
              unint64_t v82 = v77;
            }
            unint64_t v83 = v82 - v81;
            if (v82 > v81)
            {
              double v84 = sub_100025798(v82 - v81);
              id v85 = sub_1000233A4();
              v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
              {
                id v160 = v9;
                v87 = v8;
                uint64_t v88 = *(v80 - 2);
                double v89 = sub_100025798(v83);
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v183 = v78;
                *(_WORD *)&v183[4] = 2048;
                *(void *)&v183[6] = v88;
                double v8 = v87;
                id v9 = v160;
                *(_WORD *)&v183[14] = 2048;
                *(double *)&v183[16] = v89;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEBUG,  "CheckForFence: fenceIdx=%i, fenceName= %llu, overlap = %f ",  buf,  0x1Cu);
              }

              unint64_t v79 = (unint64_t)(v84 + (double)v79);
            }

            v80 += 3;
            ++v78;
          }

          while (v78 != 5);
          id v90 = sub_1000233A4();
          v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
          BOOL v92 = os_log_type_enabled(v91, OS_LOG_TYPE_INFO);
          if (v79 <= 0x190)
          {
            id v26 = v167;
            if (v92)
            {
              *(_DWORD *)buf = 134217984;
              *(void *)v183 = v79;
              _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_INFO,  "CheckForFence: total fence overlap time = %llu ms, not fence-hang",  buf,  0xCu);
            }

            v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v156));
            BYTE1(v154) = v163;
            LOBYTE(v154) = -[os_log_s isThirdPartyDevSupportModeHang]( v167,  "isThirdPartyDevSupportModeHang");
            -[os_log_s recordHang:threadID:startTime:endTime:saveTailspin:subtype:userActionData:isThirdPartyDevSupportModeHang:captureMicroHang:]( v167,  "recordHang:threadID:startTime:endTime:saveTailspin:subtype:userActionData:isThirdPartyDevSupportModeHang:c aptureMicroHang:",  v98,  v158,  v76,  v77,  v165,  v155,  0LL,  v154);
          }

          else
          {
            id v26 = v167;
            if (v92)
            {
              *(_DWORD *)buf = 134217984;
              *(void *)v183 = v79;
              _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_INFO,  "CheckForFence: total fence overlap time = %llu ms => treating as Fence-hang",  buf,  0xCu);
            }

            BYTE1(v154) = v163;
            LOBYTE(v154) = -[os_log_s isThirdPartyDevSupportModeHang]( v167,  "isThirdPartyDevSupportModeHang");
            +[HTProcessInfo recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:]( &OBJC_CLASS___HTProcessInfo,  "recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportMod eHang:captureMicroHang:",  @"Fence-hang",  v76 - 12000000,  v77 + 12000000,  v77,  0LL,  v165,  3LL,  v154);
          }

          goto LABEL_102;
        }

        id v96 = sub_1000233A4();
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v183 = pid;
          v97 = "Got hang detected message for a pid we're not monitoring: %d";
LABEL_97:
          v100 = v39;
          uint32_t v101 = 8;
LABEL_100:
          _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, v97, buf, v101);
        }

        goto LABEL_101;
      default:
        id v59 = sub_1000233A4();
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_102;
        }
        *(_DWORD *)buf = 134217984;
        *(void *)v183 = v9;
        id v27 = "Don't know how to handle %p";
        v28 = v26;
        os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
        uint32_t v30 = 12;
        goto LABEL_49;
    }
  }

  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_invalid)
    {
      pid_t v31 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      id v32 = sub_1000233A4();
      double v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v183 = v31;
        id v22 = "Client disconnected: %d";
        id v23 = v8;
        uint32_t v24 = 8;
        goto LABEL_22;
      }
    }

    else if (v3 == &_xpc_error_termination_imminent)
    {
      id v33 = sub_1000233A4();
      double v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v22 = "Termination imminent!";
        id v23 = v8;
        uint32_t v24 = 2;
        goto LABEL_22;
      }
    }

    else
    {
      unsigned int v20 = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      id v21 = sub_1000233A4();
      double v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)v183 = v20;
        id v22 = "Unexpected error: %s";
        id v23 = v8;
        uint32_t v24 = 12;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }

LABEL_104:
    goto LABEL_105;
  }

  uint64_t v5 = xpc_copy_description(v3);
  id v6 = sub_1000233A4();
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)v183 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We got a non-dictionary event: %s", buf, 0xCu);
  }

  free(v5);
LABEL_105:
}

void sub_10000A474(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = dword_10005B2D4;
  if (qword_10005B258[3 * dword_10005B2D4] != a1)
  {
    uint64_t v5 = 0LL;
    unsigned int v4 = -1;
    id v6 = qword_10005B258;
    do
    {
      uint64_t v7 = *v6;
      v6 += 3;
      if (v7 == a1) {
        unsigned int v4 = v5;
      }
      ++v5;
    }

    while (v5 != 5);
  }

  if ((v4 & 0x80000000) != 0)
  {
    id v8 = sub_1000233A4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "HTFenceTracking: Fence end, failed to find corresponding fence(%llu)",  (uint8_t *)&v12,  0xCu);
    }
  }

  else
  {
    qword_10005B258[3 * v4 + 2] = a2;
  }

  id v10 = sub_1000233A4();
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134218496;
    uint64_t v13 = a1;
    __int16 v14 = 2048;
    uint64_t v15 = a2;
    __int16 v16 = 1024;
    unsigned int v17 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "saveFenceEndTime: name=%llu, end=%llu, arr_index=%d",  (uint8_t *)&v12,  0x1Cu);
  }
}

id sub_10000A5EC(int a1)
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  buffer));
}

void sub_10000A650( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

__CFString *sub_10000A904(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return *(&off_100048E68)[a1];
  }
}

id sub_10000A93C(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = sub_100018A40(a1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = sub_100018A40(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = sub_10000A904(a3);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  v6,  v8,  v10));

  return v11;
}

double sub_10000A9D0(unint64_t a1, unint64_t a2)
{
  if (a1 >= a2) {
    return sub_100025798(a1 - a2);
  }
  double v2 = -sub_100025798(a2 - a1);
  id v3 = sub_1000233A4();
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002BE8C(v4, v2);
  }

  return v2;
}

void sub_10000AA3C( unint64_t a1, unint64_t a2, const __CFString *a3, unint64_t a4, char a5)
{
  p_inst_props = &OBJC_PROTOCOL___CAAnimationDelegate.inst_props;
  qword_10005B2E0 = (qword_10005B2E0 + 1) % 0xAuLL;
  id v9 = (unint64_t *)((char *)&unk_10005B2E8 + 32 * qword_10005B2E0);
  unint64_t *v9 = a1;
  v9[1] = a2;
  v9[2] = (unint64_t)a3;
  v9[3] = a4;
  id v10 = sub_100018A40(a1);
  __int16 v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = sub_1000233A4();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v131 = v11;
    __int16 v132 = 2048;
    double v133 = (const __CFString *)a2;
    __int16 v134 = 2048;
    v135 = a3;
    __int16 v136 = 2048;
    *(void *)id v137 = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "reportTailspinRequestStats( type=%@, start=%llu, end=%llu, tailspin=%llu)",  buf,  0x2Au);
  }

  unint64_t v114 = (unint64_t)a3;

  j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  off_10005AE40,  @"Tailspin_Requests"),  1LL);
  id v14 = sub_1000233A4();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10002BFC4(v15);
  }

  __int16 v16 = off_10005AE40;
  unsigned int v17 = sub_100018A40(a1);
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  v16,  @"Tailspin_Requests_By_Type",  v18),  1LL);

  id v19 = sub_1000233A4();
  unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_10002BF04(a1, v20);
  }

  id v21 = off_10005AE40;
  id v22 = sub_100018A40(a1);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint32_t v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  v21,  @"EndTime_To_TailspinTime",  v23);
  double v25 = sub_10000A9D0(a4, v114);
  j__ADClientPushValueForDistributionKey(v24, v25);

  id v26 = sub_1000233A4();
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v108 = off_10005AE40;
    v109 = sub_100018A40(a1);
    v110 = (__CFString *)objc_claimAutoreleasedReturnValue(v109);
    double v111 = sub_10000A9D0(a4, v114);
    *(_DWORD *)buf = 138413058;
    v131 = v108;
    __int16 v132 = 2112;
    double v133 = v110;
    __int16 v134 = 2112;
    v135 = @"EndTime_To_TailspinTime";
    __int16 v136 = 2048;
    *(double *)id v137 = v111;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@.%@.%@ value=%f", buf, 0x2Au);
  }

  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472LL;
  v128[2] = sub_10000BAE0;
  v128[3] = &unk_100048DC0;
  unint64_t v113 = a1;
  v128[4] = a1;
  v128[5] = a2;
  v128[6] = v114;
  v128[7] = a4;
  char v129 = a5;
  AnalyticsSendEventLazy(@"com.apple.hangtracer.tailspins", v128);
  v28 = 0LL;
  do
  {
    os_log_type_t v29 = (unint64_t *)((char *)&unk_10005B2E8 + 32 * (void)v28);
    unint64_t v30 = *v29;
    unint64_t v31 = v29[1];
    unint64_t v32 = v29[2];
    unint64_t v117 = v29[3];
    id v33 = sub_100018A40(*v29);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    BOOL v35 = p_inst_props[92] == v28 || v31 == 0;
    if (!v35 && v32 != 0)
    {
      uint64_t v37 = 0LL;
      do
      {
        uint64_t v38 = dword_100034850[v37];
        double v39 = (double)(1000 * (int)v38);
        if (sub_10000A9D0(a4, v32) >= v39) {
          break;
        }
        j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@%02i.%@.%@",  off_10005AE40,  @"Tailspin_Requests_End_Within_Threshold",  @"Threshold=",  v38,  v34,  v11),  1LL);
        id v40 = sub_1000233A4();
        uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413570;
          v131 = off_10005AE40;
          __int16 v132 = 2112;
          double v133 = @"Tailspin_Requests_End_Within_Threshold";
          __int16 v134 = 2112;
          v135 = @"Threshold=";
          __int16 v136 = 1024;
          *(_DWORD *)id v137 = v38;
          *(_WORD *)&v137[4] = 2112;
          *(void *)&v137[6] = v34;
          *(_WORD *)&v137[14] = 2112;
          *(void *)&v137[16] = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "%@.%@.%@%02i.%@.%@", buf, 0x3Au);
        }

        double v42 = sub_10000A9D0(a4, v31);
        if (v42 < v39)
        {
          j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@%02i.%@.%@",  off_10005AE40,  @"Tailspin_Requests_Start_Within_Threshold",  @"Threshold=",  v38,  v34,  v11),  1LL);
          id v43 = sub_1000233A4();
          id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413570;
            v131 = off_10005AE40;
            __int16 v132 = 2112;
            double v133 = @"Tailspin_Requests_Start_Within_Threshold";
            __int16 v134 = 2112;
            v135 = @"Threshold=";
            __int16 v136 = 1024;
            *(_DWORD *)id v137 = v38;
            *(_WORD *)&v137[4] = 2112;
            *(void *)&v137[6] = v34;
            *(_WORD *)&v137[14] = 2112;
            *(void *)&v137[16] = v11;
            _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%@.%@.%@%02i.%@.%@", buf, 0x3Au);
          }
        }

        ++v37;
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472LL;
        v122[2] = sub_10000BBDC;
        v122[3] = &unk_100048DE8;
        int v125 = v38;
        BOOL v126 = v42 < v39;
        id v123 = v34;
        v124 = v11;
        char v127 = a5;
        AnalyticsSendEventLazy(@"com.apple.hangtracer.tailspins.Tailspin_Requests_Within_Threshold", v122);
      }

      while (v37 != 5);
      unint64_t v45 = v114;
      p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___CAAnimationDelegate + 56);
      if (sub_10000A9D0(v114, v32) < 60000.0)
      {
        id v46 = 0LL;
        int v47 = 0;
        uint64_t v48 = &qword_10005B2F8;
        do
        {
          if (v28 != v46 && *v48 > v32 && *v48 < v114) {
            ++v47;
          }
          id v46 = (__objc2_prop_list *)((char *)v46 + 1);
          v48 += 4;
        }

        while (v46 != (__objc2_prop_list *)10);
        BOOL v50 = v31 < a2;
        BOOL v51 = v32 >= a2 && v31 < a2;
        if (v32 < a2) {
          BOOL v50 = 1;
        }
        BOOL v35 = !v50;
        uint64_t v52 = 2LL;
        if (!v35) {
          uint64_t v52 = v51;
        }
        if (v32 <= v114) {
          unint64_t v53 = v52;
        }
        else {
          unint64_t v53 = 3LL;
        }
        unint64_t v112 = v53;
        id v54 = sub_10000A93C(v113, v30, v53);
        v116 = (__CFString *)objc_claimAutoreleasedReturnValue(v54);
        j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  off_10005AE40,  @"Overlap_Counts",  v116),  1LL);
        id v55 = sub_1000233A4();
        __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v131 = off_10005AE40;
          __int16 v132 = 2112;
          double v133 = @"Overlap_Counts";
          __int16 v134 = 2112;
          v135 = v116;
          _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "%@.%@.%@ += 1", buf, 0x20u);
        }

        j__ADClientSetValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  off_10005AE40,  @"Intermediate_Hangs_For_Overlap_Type",  v116),  v47);
        id v57 = sub_1000233A4();
        uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v131 = off_10005AE40;
          __int16 v132 = 2112;
          double v133 = @"Intermediate_Hangs_For_Overlap_Type";
          __int16 v134 = 2112;
          v135 = v116;
          __int16 v136 = 1024;
          *(_DWORD *)id v137 = v47;
          _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "%@.%@.%@ == %i", buf, 0x26u);
        }

        id v59 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@.%@",  off_10005AE40,  @"All_Request_Intervals",  v116,  @"Intervals_S1toS2");
        double v60 = sub_10000A9D0(a2, v31);
        j__ADClientPushValueForDistributionKey(v59, v60);
        id v61 = sub_1000233A4();
        BOOL v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          BOOL v92 = off_10005AE40;
          double v93 = sub_10000A9D0(a2, v31);
          *(_DWORD *)buf = 138413314;
          v131 = v92;
          unint64_t v45 = v114;
          __int16 v132 = 2112;
          double v133 = @"All_Request_Intervals";
          __int16 v134 = 2112;
          v135 = v116;
          __int16 v136 = 2112;
          *(void *)id v137 = @"Intervals_S1toS2";
          *(_WORD *)&v137[8] = 2048;
          *(double *)&v137[10] = v93;
          _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        id v63 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@.%@",  off_10005AE40,  @"All_Request_Intervals",  v116,  @"Intervals_S1toE2");
        double v64 = sub_10000A9D0(v45, v31);
        j__ADClientPushValueForDistributionKey(v63, v64);
        id v65 = sub_1000233A4();
        id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          id v94 = off_10005AE40;
          double v95 = sub_10000A9D0(v114, v31);
          *(_DWORD *)buf = 138413314;
          v131 = v94;
          unint64_t v45 = v114;
          __int16 v132 = 2112;
          double v133 = @"All_Request_Intervals";
          __int16 v134 = 2112;
          v135 = v116;
          __int16 v136 = 2112;
          *(void *)id v137 = @"Intervals_S1toE2";
          *(_WORD *)&v137[8] = 2048;
          *(double *)&v137[10] = v95;
          _os_log_debug_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        v67 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@.%@",  off_10005AE40,  @"All_Request_Intervals",  v116,  @"Intervals_E1toS2");
        double v68 = sub_10000A9D0(a2, v32);
        j__ADClientPushValueForDistributionKey(v67, v68);
        id v69 = sub_1000233A4();
        uint64_t v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          id v96 = off_10005AE40;
          double v97 = sub_10000A9D0(a2, v32);
          *(_DWORD *)buf = 138413314;
          v131 = v96;
          unint64_t v45 = v114;
          __int16 v132 = 2112;
          double v133 = @"All_Request_Intervals";
          __int16 v134 = 2112;
          v135 = v116;
          __int16 v136 = 2112;
          *(void *)id v137 = @"Intervals_E1toS2";
          *(_WORD *)&v137[8] = 2048;
          *(double *)&v137[10] = v97;
          _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        id v71 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@.%@",  off_10005AE40,  @"All_Request_Intervals",  v116,  @"Intervals_E1toE2");
        double v72 = sub_10000A9D0(v45, v32);
        j__ADClientPushValueForDistributionKey(v71, v72);
        id v73 = sub_1000233A4();
        v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
        {
          v98 = off_10005AE40;
          double v99 = sub_10000A9D0(v114, v32);
          *(_DWORD *)buf = 138413314;
          v131 = v98;
          unint64_t v45 = v114;
          __int16 v132 = 2112;
          double v133 = @"All_Request_Intervals";
          __int16 v134 = 2112;
          v135 = v116;
          __int16 v136 = 2112;
          *(void *)id v137 = @"Intervals_E1toE2";
          *(_WORD *)&v137[8] = 2048;
          *(double *)&v137[10] = v99;
          _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        v119[0] = _NSConcreteStackBlock;
        v119[1] = 3221225472LL;
        v119[2] = sub_10000BD00;
        v119[3] = &unk_100048E08;
        v119[4] = v30;
        v119[5] = v31;
        v119[6] = v32;
        v119[7] = v117;
        v119[8] = v113;
        v119[9] = a2;
        v119[10] = v45;
        v119[11] = a4;
        v119[12] = v112;
        int v120 = v47;
        char v121 = a5;
        *(void *)&double v75 = AnalyticsSendEventLazy(@"com.apple.hangtracer.tailspins.Overlap_Counts", v119).n128_u64[0];
        p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___CAAnimationDelegate + 56);
        if (!v47)
        {
          unint64_t v76 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@.%@",  v75,  off_10005AE40,  @"Adjacent_Request_Intervals",  v116,  @"Intervals_S1toS2");
          double v77 = sub_10000A9D0(a2, v31);
          j__ADClientPushValueForDistributionKey(v76, v77);
          id v78 = sub_1000233A4();
          unint64_t v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            v100 = off_10005AE40;
            double v101 = sub_10000A9D0(a2, v31);
            *(_DWORD *)buf = 138413314;
            v131 = v100;
            unint64_t v45 = v114;
            __int16 v132 = 2112;
            double v133 = @"Adjacent_Request_Intervals";
            __int16 v134 = 2112;
            v135 = v116;
            __int16 v136 = 2112;
            *(void *)id v137 = @"Intervals_S1toS2";
            *(_WORD *)&v137[8] = 2048;
            *(double *)&v137[10] = v101;
            _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }

          __int16 v80 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@.%@",  off_10005AE40,  @"Adjacent_Request_Intervals",  v116,  @"Intervals_S1toE2");
          double v81 = sub_10000A9D0(v45, v31);
          j__ADClientPushValueForDistributionKey(v80, v81);
          id v82 = sub_1000233A4();
          unint64_t v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
          {
            id v102 = off_10005AE40;
            double v103 = sub_10000A9D0(v114, v31);
            *(_DWORD *)buf = 138413314;
            v131 = v102;
            unint64_t v45 = v114;
            __int16 v132 = 2112;
            double v133 = @"Adjacent_Request_Intervals";
            __int16 v134 = 2112;
            v135 = v116;
            __int16 v136 = 2112;
            *(void *)id v137 = @"Intervals_S1toE2";
            *(_WORD *)&v137[8] = 2048;
            *(double *)&v137[10] = v103;
            _os_log_debug_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }

          double v84 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@.%@",  off_10005AE40,  @"Adjacent_Request_Intervals",  v116,  @"Intervals_E1toS2");
          double v85 = sub_10000A9D0(a2, v32);
          j__ADClientPushValueForDistributionKey(v84, v85);
          id v86 = sub_1000233A4();
          v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
          {
            id v104 = off_10005AE40;
            double v105 = sub_10000A9D0(a2, v32);
            *(_DWORD *)buf = 138413314;
            v131 = v104;
            unint64_t v45 = v114;
            __int16 v132 = 2112;
            double v133 = @"Adjacent_Request_Intervals";
            __int16 v134 = 2112;
            v135 = v116;
            __int16 v136 = 2112;
            *(void *)id v137 = @"Intervals_E1toS2";
            *(_WORD *)&v137[8] = 2048;
            *(double *)&v137[10] = v105;
            _os_log_debug_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }

          uint64_t v88 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@.%@",  off_10005AE40,  @"Adjacent_Request_Intervals",  v116,  @"Intervals_E1toE2");
          double v89 = sub_10000A9D0(v45, v32);
          j__ADClientPushValueForDistributionKey(v88, v89);
          id v90 = sub_1000233A4();
          v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            v106 = off_10005AE40;
            double v107 = sub_10000A9D0(v114, v32);
            *(_DWORD *)buf = 138413314;
            v131 = v106;
            __int16 v132 = 2112;
            double v133 = @"Adjacent_Request_Intervals";
            __int16 v134 = 2112;
            v135 = v116;
            __int16 v136 = 2112;
            *(void *)id v137 = @"Intervals_E1toE2";
            *(_WORD *)&v137[8] = 2048;
            *(double *)&v137[10] = v107;
            _os_log_debug_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }
        }
      }
    }

    v28 = (__objc2_prop_list *)((char *)v28 + 1);
  }

  while (v28 != (__objc2_prop_list *)10);
}

id sub_10000BAE0(uint64_t a1)
{
  v9[0] = @"Type";
  double v2 = sub_100018A40(*(void *)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v10[0] = v3;
  v9[1] = @"EndTime_To_TailspinTime";
  unsigned int v4 = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  sub_10000A9D0(*(void *)(a1 + 56), *(void *)(a1 + 48)));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v10[1] = v5;
  v9[2] = @"Tailspin_Request_Denied";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 64)));
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

id sub_10000BBDC(uint64_t a1)
{
  v9[0] = @"Threshold";
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
  v10[0] = v2;
  v10[1] = &__kCFBooleanTrue;
  v9[1] = @"EndWithinThreshold";
  v9[2] = @"BeginWithinThreshold";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 52)));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v10[2] = v3;
  void v10[3] = v4;
  void v9[3] = @"RequestType";
  v9[4] = @"LatestRequestType";
  v10[4] = v5;
  v9[5] = @"Tailspin_Request_Denied";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 53)));
  v10[5] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  6LL));

  return v7;
}

id sub_10000BD00(uint64_t a1)
{
  v20[0] = @"RequestType";
  double v2 = sub_100018A40(*(void *)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v21[0] = v3;
  v20[1] = @"LatestRequestType";
  uint64_t v4 = sub_100018A40(*(void *)(a1 + 64));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v21[1] = v5;
  v20[2] = @"OverlapType";
  id v6 = sub_10000A904(*(void *)(a1 + 96));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v21[2] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *(unsigned int *)(a1 + 104),  @"RequestType",  @"LatestRequestType",  @"OverlapType",  @"NumberRequestsBetween"));
  v21[3] = v8;
  v20[4] = @"Intervals_S1toS2";
  id v9 = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  sub_10000A9D0(*(void *)(a1 + 72), *(void *)(a1 + 40)));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v21[4] = v10;
  v20[5] = @"Intervals_S1toE2";
  __int16 v11 = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  sub_10000A9D0(*(void *)(a1 + 80), *(void *)(a1 + 40)));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v21[5] = v12;
  v20[6] = @"Intervals_E1toS2";
  uint64_t v13 = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  sub_10000A9D0(*(void *)(a1 + 72), *(void *)(a1 + 48)));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v21[6] = v14;
  v20[7] = @"Intervals_E1toE2";
  uint64_t v15 = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  sub_10000A9D0(*(void *)(a1 + 80), *(void *)(a1 + 48)));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v21[7] = v16;
  v20[8] = @"Tailspin_Request_Denied";
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 108)));
  v21[8] = v17;
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  9LL));

  return v18;
}

void sub_10000BF24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (qword_10005B428 != -1) {
    dispatch_once(&qword_10005B428, &stru_100048E28);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C020;
  block[3] = &unk_100048E48;
  block[4] = a1;
  block[5] = a2;
  block[6] = a3;
  block[7] = a4;
  char v12 = a5;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, QOS_CLASS_BACKGROUND, 0, block);
  dispatch_async((dispatch_queue_t)qword_10005B2D8, v10);
}

void sub_10000BFF4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("HT_Tailspin_Request_Reporting_Queue", 0LL);
  double v2 = (void *)qword_10005B2D8;
  qword_10005B2D8 = (uint64_t)v1;
}

void sub_10000C020(uint64_t a1)
{
}

void sub_10000C034(double a1)
{
  if (!qword_10005B430)
  {
    dispatch_source_t v2 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_10005BD48);
    id v3 = (void *)qword_10005B430;
    qword_10005B430 = (uint64_t)v2;

    dispatch_source_set_event_handler_f((dispatch_source_t)qword_10005B430, (dispatch_function_t)sub_10000C0D4);
    dispatch_activate((dispatch_object_t)qword_10005B430);
  }

  dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(a1 * 1000000.0));
  dispatch_source_set_timer((dispatch_source_t)qword_10005B430, v4, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

id sub_10000C0D4()
{
  id v0 = +[HTHangInfo getHangWaitTimeout](&OBJC_CLASS___HTHangInfo, "getHangWaitTimeout");
  else {
    return +[HTTailspin collectTailspinAndUpdateTelemtry](&OBJC_CLASS___HTTailspin, "collectTailspinAndUpdateTelemtry");
  }
}

void sub_10000C354(id a1)
{
  double v1 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  dispatch_source_t v2 = (void *)qword_10005B448;
  qword_10005B448 = (uint64_t)v1;

  qword_10005B438 = 0LL;
  qword_10005B458 = -1LL;
  qword_10005B460 = 0LL;
  id v3 = (void *)qword_10005B430;
  qword_10005B430 = 0LL;
}

LABEL_11:
  }

  return v3;
}

    return 0LL;
  }

  id v8 = v7;
  if (a1) {
    tailspin_enabled_set(v7, 1LL);
  }
  id v9 = sub_1000119E8(v8);
  tailspin_config_free(v8);
  return v9;
}

  os_unfair_lock_unlock(&stru_10005BB4C);
}

void sub_10000CFAC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_10000D5DC(id a1)
{
  double v1 = objc_alloc_init(&OBJC_CLASS___NSCache);
  dispatch_source_t v2 = (void *)qword_10005B470;
  qword_10005B470 = (uint64_t)v1;

  _[(id)qword_10005B470 setCountLimit:20];
}

void sub_10000DC04(uint64_t a1)
{
  dispatch_source_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) valueLayer]);
  [v2 preferredFrameSize];
  objc_msgSend(*(id *)(a1 + 32), "setMinimumValueLayerWidth:");

  id v3 = *(void **)(a1 + 32);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 hudLines]);
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"some-id"]);
  [v3 updateCornerRadiusAndSidePaddingIfNecessary:v4];
}

void sub_10000DEA8(uint64_t a1)
{
  dispatch_source_t v2 = *(void **)(a1 + 32);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 hudLines]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  [v2 updateCornerRadiusAndSidePaddingIfNecessary:v4];
}

LABEL_6:
}

id sub_10000E188(uint64_t a1)
{
  id v2 = sub_1000233A4();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeOldKey]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeNewKey]);
    *(_DWORD *)buf = 138412546;
    dispatch_block_t v10 = v4;
    __int16 v11 = 2112;
    char v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "HangTracer HUD new orientation %@ → %@",  buf,  0x16u);
  }

  sub_100026234();
  id v6 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000E2BC;
  v8[3] = &unk_100048EF8;
  v8[4] = v6;
  return [v6 performHUDUpdate:v8];
}

void sub_10000E2BC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", objc_msgSend(v5, "count"), v5);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", objc_msgSend(v5, "count"), v3, v4);
}

id sub_10000E350(uint64_t a1)
{
  id v2 = sub_1000233A4();
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeOldKey]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeNewKey]);
    *(_DWORD *)buf = 138412546;
    dispatch_block_t v10 = v4;
    __int16 v11 = 2112;
    char v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HangTracer HUD new bounds %@ → %@", buf, 0x16u);
  }

  sub_100026250();
  [*(id *)(a1 + 40) setDisplayScaleDependentPropertiesOnLayers];
  id v6 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000E48C;
  v8[3] = &unk_100048EF8;
  v8[4] = v6;
  return [v6 performHUDUpdate:v8];
}

void sub_10000E48C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v8);
        dispatch_block_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines", (void)v14));
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);
        sub_100025C2C();
        objc_msgSend(v11, "setFontSize:");

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", objc_msgSend(v4, "count"), v4);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", objc_msgSend(v4, "count"), v12, v13);
}

void sub_10000E828(uint64_t a1)
{
  double v2 = -[HUDLine contentScaleForTexts]_0();
  CATransform3DMakeScale(&v12, v2, v2, v2);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rootLayer]);
  CATransform3D v11 = v12;
  [v3 setTransform:&v11];

  else {
    double v4 = 2.0 / v2;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  [v5 setBorderWidth:v4];

  unsigned int v6 = [*(id *)(a1 + 32) accessibilityReducesTransparency];
  double v7 = 4.0;
  if (v6) {
    double v7 = 10.0;
  }
  double v8 = v7 / v2;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  objc_msgSend(v9, "setShadowOffset:", 0.0, v8);

  dispatch_block_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  [v10 setShadowRadius:25.0 / v2];
}

void sub_10000EC94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000ECC0(id a1, NSString *a2, HUDLine *a3, BOOL *a4)
{
  double v4 = a3;
  -[HUDLine removeFromSuperlayer](v4, "removeFromSuperlayer");
  -[HUDLine nilifyCALayers](v4, "nilifyCALayers");
}

void sub_10000ECF0(uint64_t a1, uint64_t a2)
{
}

void sub_10000ECFC(uint64_t a1)
{
}

void sub_10000ED04(uint64_t a1)
{
  WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    double v4 = WeakRetained[1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_10000ED84;
    v6[3] = &unk_100048F20;
    uint64_t v5 = *(void *)(a1 + 32);
    v6[4] = v3;
    v6[5] = v5;
    dispatch_async(v4, v6);
  }
}

void sub_10000ED84(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);

  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16LL));
    double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
    [v3 enumerateKeysAndObjectsUsingBlock:&stru_100048F80];

    double v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
    [v4 removeAllObjects];

    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    double v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
    objc_msgSend(v8, "setFrame:", CGRectZero.origin.x, y, width, height);

    [*(id *)(a1 + 40) recreateContainerLayerIfNecessary];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rootLayer]);
    [v9 setHidden:1];

    [*(id *)(a1 + 32) invalidate];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16LL));
  }

  else
  {
    id v10 = sub_1000233A4();
    CATransform3D v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10002C398(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

void sub_10000EEB4(id a1, NSString *a2, HUDLine *a3, BOOL *a4)
{
  double v4 = a3;
  -[HUDLine removeFromSuperlayer](v4, "removeFromSuperlayer");
  -[HUDLine nilifyCALayers](v4, "nilifyCALayers");
}

void sub_10000F0F8(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10000F46C;
  v42[3] = &unk_100048FD0;
  id v43 = *(id *)(a1 + 40);
  id v44 = *(id *)(a1 + 48);
  id v4 = v2;
  id v45 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v42];

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
        CATransform3D v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines", (void)v38));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);
        [v12 removeFromSuperlayer];

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
        [v13 removeObjectForKey:v10];

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudContentWithPendingAnimations]);
        [v14 removeObject:v10];
      }

      id v7 = [v5 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }

    while (v7);
  }

  id v15 = sub_1000233A4();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10002C3CC(a1, v16, v17, v18, v19, v20, v21, v22);
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  [v23 removeAllAnimations];

  if (*(void *)(a1 + 56))
  {
    unint64_t v24 = 0LL;
    do
    {
      double v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v24, (void)v38));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v25]);
      objc_msgSend(*(id *)(a1 + 32), "HangHUD_updater_latency_in_ms");
      uint64_t v28 = sub_100026294(v26, *(void *)(a1 + 64), v27 + 50.0);
      else {
        uint64_t v29 = v28;
      }
      [*(id *)(a1 + 32) updateHUDLineWithId:v25 content:v26 options:v29];

      ++v24;
      unint64_t v30 = *(void *)(a1 + 56);
    }

    while (v24 < v30);
  }

  else
  {
    unint64_t v30 = 0LL;
  }

  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", v30, *(void *)(a1 + 48), (void)v38);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", *(int *)(a1 + 56));
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 sublayers]);
  id v33 = [v32 count];

  if (v33)
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rootLayer]);
    [v34 setHidden:0];

    BOOL v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
    [v35 setHidden:0];

    size_t v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
    LODWORD(v37) = 1.0;
    [v36 setOpacity:v37];
  }
}

void sub_10000F46C(id *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKeyedSubscript:"));
  if (!v3
    || (v4 = (void *)v3, id v5 = [a1[5] indexOfObject:v6],
                         v4,
                         v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [a1[6] addObject:v6];
  }
}

uint64_t sub_10000F4E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000F698(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10000FAAC;
  v50[3] = &unk_100048FD0;
  id v51 = *(id *)(a1 + 40);
  id v52 = *(id *)(a1 + 48);
  id v4 = v2;
  id v53 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v50];

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v47;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v45 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines", v45, (void)v46));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);
        [v13 removeFromSuperlayer];

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v11]);
        [v15 nilifyCALayers];

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
        [v16 removeObjectForKey:v11];

        id v17 = sub_1000233A4();
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v45;
          uint64_t v55 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Removed hudLines item %@", buf, 0xCu);
        }

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudContentWithPendingAnimations]);
        [v19 removeObject:v11];
      }

      id v8 = [v5 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }

    while (v8);
  }

  id v20 = sub_1000233A4();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_10002C434(a1, v21, v22, v23, v24, v25, v26, v27);
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  [v28 removeAllAnimations];

  if (*(void *)(a1 + 56))
  {
    unint64_t v29 = 0LL;
    do
    {
      unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectAtIndexedSubscript:v29]);
      unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v30]);
      objc_msgSend(*(id *)(a1 + 32), "HangHUD_updater_latency_in_ms");
      uint64_t v33 = [v31 isCurrent:*(void *)(a1 + 64) withHUDUpdateInterval:v32 + 50.0];
      else {
        uint64_t v34 = v33;
      }
      [*(id *)(a1 + 32) updateHUDLineWithId:v30 content:v31 options:v34];

      ++v29;
      unint64_t v35 = *(void *)(a1 + 56);
    }

    while (v29 < v35);
  }

  else
  {
    unint64_t v35 = 0LL;
  }

  [*(id *)(a1 + 32) layoutHUDLines:v35 ids:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", *(int *)(a1 + 56));
  size_t v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  double v37 = (void *)objc_claimAutoreleasedReturnValue([v36 sublayers]);
  id v38 = [v37 count];

  if (v38)
  {
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rootLayer]);
    [v39 setHidden:0];

    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
    [v40 setHidden:0];

    objc_msgSend(*(id *)(a1 + 32), "HUD_background_opacity");
    float v42 = v41;
    id v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
    *(float *)&double v44 = v42;
    [v43 setOpacity:v44];
  }
}

void sub_10000FAAC(id *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKeyedSubscript:"));
  if (!v3
    || (v4 = (void *)v3, id v5 = [a1[5] indexOfObject:v6],
                         v4,
                         v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [a1[6] addObject:v6];
  }
}

uint64_t sub_10000FB28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100010358( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100010390(uint64_t a1, uint64_t a2, void *a3)
{
  id v20 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v20 keyLayer]);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v20 keyLayer]);
    [v6 preferredFrameSize];
    double v8 = v7;
    double v9 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);

    if (v8 > v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v20 keyLayer]);
      [v10 preferredFrameSize];
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v11;
    }
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v20 valueLayer]);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v20 valueLayer]);
    [v14 preferredFrameSize];
    double v16 = v15;
    double v17 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);

    if (v16 > v17)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v20 valueLayer]);
      [v18 preferredFrameSize];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v19;
    }
  }
}

void sub_100010698(_Unwind_Exception *a1)
{
}

void sub_1000106BC(uint64_t a1, uint64_t a2)
{
  WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_100010730;
    v6[3] = &unk_100049070;
    v6[4] = v4;
    v6[5] = a2;
    dispatch_async(v5, v6);
  }
}

id sub_100010730(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    uint64_t v2 = objc_claimAutoreleasedReturnValue(+[HUDTheme darkModeTheme](&OBJC_CLASS___HUDTheme, "darkModeTheme"));
  }
  else {
    uint64_t v2 = objc_claimAutoreleasedReturnValue(+[HUDTheme lightModeTheme](&OBJC_CLASS___HUDTheme, "lightModeTheme"));
  }
  uint64_t v3 = (void *)v2;
  [*(id *)(a1 + 32) setCurrentTheme:v2];

  return _[*(id *)(a1 + 32) applyThemeColors];
}

void sub_100010818(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadThemeColors];
}

void sub_1000108B8(uint64_t a1)
{
  int v2 = sub_100026938();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentTheme]);
  uint64_t v4 = v3;
  if (v2) {
    id v5 = [v3 translucentBackgroundColor];
  }
  else {
    id v5 = [v3 backgroundColor];
  }
  id v6 = v5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  [v7 setBackgroundColor:v6];

  double v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000109C4;
  v12[3] = &unk_1000490E8;
  v12[4] = *(void *)(a1 + 32);
  [v8 enumerateKeysAndObjectsUsingBlock:v12];

  double v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastKnownHangs]);
  if (v9)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastKnownHangs]);
    [v10 updateHangs:v11 withCompletion:&stru_100049108];
  }

void sub_1000109C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___HangHUDLine);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentTheme]);
    [v6 setCurrentTheme:v5];
  }
}

void sub_100010C34(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getKeyForLine:*(void *)(a1 + 40)]);
  if (v2)
  {
    id v3 = sub_1000233A4();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10002C49C((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudContentWithPendingAnimations]);
    [v11 removeObject:v2];
  }
}

void sub_100010D38(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getKeyForLine:*(void *)(a1 + 40)]);
  if (v2)
  {
    id v3 = sub_1000233A4();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10002C500((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudContentWithPendingAnimations]);
    [v11 addObject:v2];
  }
}

void sub_100010FC0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000111FC(id a1)
{
  CGColorRef SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  cf = CGColorCreateSRGB(0.996078431, 0.992156863, 1.0, 1.0);
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(cf, 0.67);
  uint64_t v2 = kCAFilterVibrantColorMatrix;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterVibrantColorMatrix));
  [v3 setName:@"vibrantColorLightOrange"];
  __int128 v22 = xmmword_100034980;
  __int128 v23 = xmmword_100034990;
  __int128 v24 = xmmword_1000349A0;
  __int128 v25 = xmmword_1000349B0;
  __int128 v26 = xmmword_1000349C0;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCAColorMatrix:](&OBJC_CLASS___NSValue, "valueWithCAColorMatrix:", &v22));
  uint64_t v4 = kCAFilterInputColorMatrix;
  [v3 setValue:v21 forKey:kCAFilterInputColorMatrix];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v2));
  [v5 setName:@"vibrantColorLightRed"];
  __int128 v22 = xmmword_100034980;
  __int128 v23 = xmmword_1000349D0;
  __int128 v24 = xmmword_1000349E0;
  __int128 v25 = xmmword_1000349F0;
  __int128 v26 = xmmword_1000349C0;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCAColorMatrix:](&OBJC_CLASS___NSValue, "valueWithCAColorMatrix:", &v22));
  uint64_t v6 = v5;
  double v16 = v5;
  [v5 setValue:v18 forKey:v4];
  CGColorRef v17 = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGColorRef v7 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  uint64_t v8 = CGColorCreateSRGB(0.921568627, 0.537254902, 0.0, 1.0);
  CGColorRef v9 = CGColorCreateCopyWithAlpha(v8, 0.67);
  uint64_t v10 = CGColorCreateSRGB(0.949019608, 0.219607843, 0.180392157, 1.0);
  CGColorRef v11 = CGColorCreateCopyWithAlpha(v10, 0.67);
  CGColorRef v12 = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGColorRef v13 = CGColorCreateSRGB(0.396078431, 0.396078431, 0.396078431, 1.0);
  uint64_t v14 = -[HUDTheme initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:currentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:translucentBackgroundColor:textColorSevereVibrantFilter:textColorCriticalVibrantFilter:currentProcessExitTextColor:processExitReasonNamespaceTextColor:]( objc_alloc(&OBJC_CLASS___HUDTheme),  "initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:curr entHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:translucentBackgroundColor:textColorSev ereVibrantFilter:textColorCriticalVibrantFilter:currentProcessExitTextColor:processExitReasonNamespaceTextColor:",  v7,  v17,  v8,  v9,  v10,  v11,  SRGB,  CopyWithAlpha,  v3,  v6,  v12,  v13);
  double v15 = (void *)qword_10005B480;
  qword_10005B480 = (uint64_t)v14;

  CFRelease(SRGB);
  CFRelease(cf);
  CFRelease(CopyWithAlpha);
  CFRelease(v17);
  CFRelease(v8);
  CFRelease(v9);
  CFRelease(v7);
  CFRelease(v10);
  CFRelease(v11);
  CFRelease(v12);
  CFRelease(v13);
}

void sub_10001157C(id a1)
{
  CGColorRef SRGB = CGColorCreateSRGB(0.141176471, 0.141176471, 0.156862745, 1.0);
  cf = CGColorCreateSRGB(0.117647059, 0.117647059, 0.117647059, 1.0);
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(cf, 0.5);
  uint64_t v2 = kCAFilterVibrantColorMatrix;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterVibrantColorMatrix));
  [v3 setName:@"vibrantColorDarkOrange"];
  __int128 v22 = xmmword_100034980;
  __int128 v23 = xmmword_100034A00;
  __int128 v24 = xmmword_100034A10;
  __int128 v25 = xmmword_100034A20;
  __int128 v26 = xmmword_1000349C0;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCAColorMatrix:](&OBJC_CLASS___NSValue, "valueWithCAColorMatrix:", &v22));
  uint64_t v4 = kCAFilterInputColorMatrix;
  [v3 setValue:v21 forKey:kCAFilterInputColorMatrix];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v2));
  [v5 setName:@"vibrantColorDarkRed"];
  __int128 v22 = xmmword_100034A30;
  __int128 v23 = xmmword_100034A40;
  __int128 v24 = xmmword_100034A50;
  __int128 v25 = xmmword_100034A60;
  __int128 v26 = xmmword_1000349C0;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCAColorMatrix:](&OBJC_CLASS___NSValue, "valueWithCAColorMatrix:", &v22));
  uint64_t v6 = v5;
  double v16 = v5;
  [v5 setValue:v18 forKey:v4];
  CGColorRef v17 = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGColorRef v7 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  uint64_t v8 = CGColorCreateSRGB(1.0, 0.584313725, 0.0392156863, 1.0);
  CGColorRef v9 = CGColorCreateCopyWithAlpha(v8, 0.67);
  uint64_t v10 = CGColorCreateSRGB(1.0, 0.270588235, 0.22745098, 1.0);
  CGColorRef v11 = CGColorCreateCopyWithAlpha(v10, 0.67);
  CGColorRef v12 = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGColorRef v13 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  uint64_t v14 = -[HUDTheme initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:currentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:translucentBackgroundColor:textColorSevereVibrantFilter:textColorCriticalVibrantFilter:currentProcessExitTextColor:processExitReasonNamespaceTextColor:]( objc_alloc(&OBJC_CLASS___HUDTheme),  "initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:curr entHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:translucentBackgroundColor:textColorSev ereVibrantFilter:textColorCriticalVibrantFilter:currentProcessExitTextColor:processExitReasonNamespaceTextColor:",  v7,  v17,  v8,  v9,  v10,  v11,  SRGB,  CopyWithAlpha,  v3,  v6,  v12,  v13);
  double v15 = (void *)qword_10005B490;
  qword_10005B490 = (uint64_t)v14;

  CFRelease(SRGB);
  CFRelease(cf);
  CFRelease(CopyWithAlpha);
  CFRelease(v17);
  CFRelease(v8);
  CFRelease(v9);
  CFRelease(v7);
  CFRelease(v10);
  CFRelease(v11);
  CFRelease(v12);
  CFRelease(v13);
}

uint64_t sub_1000119E8(uint64_t a1)
{
  id v2 = sub_1000233A4();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "ApplyTailspinConfig: change tailspin config",  buf,  2u);
    }

    return tailspin_config_apply_sync(a1);
  }

  else
  {
    if (v4)
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "ApplyTailspinConfig: provided desiredConfig is null",  v6,  2u);
    }

    return 0LL;
  }

BOOL sub_100011A94()
{
  id v0 = sub_100027AD0(@"com.apple.da", @"mobile", (uint64_t)@"HTEPL");
  double v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  BOOL v2 = [v1 count] != 0;

  return v2;
}

BOOL sub_100011AF0()
{
  id v0 = sub_100027AD0(@"com.apple.da", @"mobile", (uint64_t)@"HTThirdPartyDevSupport");
  double v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  BOOL v2 = [v1 count] != 0;

  return v2;
}

uint64_t sub_100011B4C(int a1)
{
  unsigned __int8 v2 = +[PerfDiagsSelfEnablementController isAnyModeActive]( &OBJC_CLASS___PerfDiagsSelfEnablementController,  "isAnyModeActive");
  BOOL v3 = sub_100011AF0();
  id v4 = sub_1000233A4();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if ((v2 & 1) != 0 || v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      uint64_t v10 = "ConfigureTailspinForEPL: A different HangTracer enablement mode is ACTIVE, do not attempt to configure tailspin";
      CGColorRef v11 = (uint8_t *)&v14;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }

LABEL_14:
    return 0LL;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "ConfigureTailspinForEPL: Other HangTracer enablement modes are NOT active, attempt to configure tailspin",  buf,  2u);
  }

  uint64_t v7 = tailspin_config_create_with_default_config();
  if (!v7)
  {
    id v12 = sub_1000233A4();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v15 = 0;
      uint64_t v10 = "ConfigureTailspinForEPL: Failed to create tailspin config object";
      CGColorRef v11 = v15;
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  uint64_t v8 = v7;
  if (a1) {
    tailspin_enabled_set(v7, 1LL);
  }
  uint64_t v9 = sub_1000119E8(v8);
  tailspin_config_free(v8);
  return v9;
}

    os_unfair_lock_unlock(&stru_10005BB4C);
  }

  return (char)v4;
}

uint64_t sub_100011C8C(int a1)
{
  if (sub_100011A94())
  {
    id v2 = sub_1000233A4();
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      CGColorRef v13 = "configureTailspinForThirdPartyDevelopment";
      id v4 = "%s: Not configuring tailspin since EPL is active";
      uint64_t v5 = v3;
      os_log_type_t v6 = OS_LOG_TYPE_INFO;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, v6, v4, (uint8_t *)&v12, 0xCu);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  uint64_t v7 = tailspin_config_create_with_default_config();
  if (!v7)
  {
    id v11 = sub_1000233A4();
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      CGColorRef v13 = "configureTailspinForThirdPartyDevelopment";
      id v4 = "%s: Failed to create tailspin config object";
      uint64_t v5 = v3;
      os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }

void sub_100011E54(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 processName]);
  id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%i) : %p",  v3,  getpid(),  *(void *)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue(v4);

  id v5 = [objc_alloc(*(Class *)(a1 + 32)) initWithIdentifier:v7];
  os_log_type_t v6 = (void *)qword_10005B498;
  qword_10005B498 = (uint64_t)v5;
}

void sub_10001211C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[HangHUDServiceSpecification clientContextIdentifierKey]( &OBJC_CLASS___HangHUDServiceSpecification,  "clientContextIdentifierKey"));
  [v3 encodeObject:v2 forKey:v4];
}

void sub_100012180(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification interface](&OBJC_CLASS___HangHUDServiceSpecification, "interface"));
  [v3 setInterface:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[HangHUDServiceSpecification serviceQuality]( &OBJC_CLASS___HangHUDServiceSpecification,  "serviceQuality"));
  [v3 setServiceQuality:v5];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000122BC;
  void v10[3] = &unk_1000491B8;
  id v11 = *(id *)(a1 + 32);
  [v3 setActivationHandler:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000122FC;
  v8[3] = &unk_1000491B8;
  id v9 = *(id *)(a1 + 32);
  [v3 setInterruptionHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_100012354;
  v6[3] = &unk_1000491B8;
  id v7 = *(id *)(a1 + 32);
  [v3 setInvalidationHandler:v6];
}

void sub_1000122BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24LL));
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];
}

void sub_1000122FC(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 24LL);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];

  [v5 activate];
}

void sub_100012354(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24LL));
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];
}

void sub_100012C94(id a1)
{
  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0LL);
  uint64_t v2 = CTFontCopyFontDescriptor(UIFontForLanguage);
  CFStringRef v7 = kCTFontOpticalSizeAttribute;
  id v3 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_100025990());
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v8 = v4;
  id v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(v2, v5);

  qword_10005B4B0 = (uint64_t)CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0LL);
  CFRelease(UIFontForLanguage);
  CFRelease(v2);
  CFRelease(CopyWithAttributes);
}

void sub_100012DA4(id a1)
{
  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0LL);
  uint64_t v2 = CTFontCopyFontDescriptor(UIFontForLanguage);
  CopyWithFeature = CTFontDescriptorCreateCopyWithFeature(v2, (CFNumberRef)&off_1000509B0, (CFNumberRef)&off_1000509C8);
  CFStringRef v8 = kCTFontOpticalSizeAttribute;
  id v4 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_100025990());
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v9 = v5;
  os_log_type_t v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(CopyWithFeature, v6);

  qword_10005B4C0 = (uint64_t)CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0LL);
  CFRelease(UIFontForLanguage);
  CFRelease(v2);
  CFRelease(CopyWithFeature);
  CFRelease(CopyWithAttributes);
}

void sub_100012ED4(id a1)
{
  qword_10005B4D0 = (uint64_t)CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0LL);
}

void sub_100013B14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100013B2C(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  [v9 preferredFrameSize];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL) = v5
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  [v9 preferredFrameSize];
  if (v6 < v7)
  {
    [v9 preferredFrameSize];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = v8;
  }

  if (a3) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL) = *(double *)(*(void *)(a1 + 32) + 8LL)
  }
}

LABEL_21:
      goto LABEL_22;
    }

    currentTheme = self->_currentTheme;
    [v8 hangDurationMS];
    __int16 v14 = v13;
    -[HUDTheme hangDuration](self->_currentTheme, "hangDuration");
    -[HUDTheme setHangDuration:animated:](currentTheme, "setHangDuration:animated:", v15 > 0.0, v14);
    [v8 hangDurationMS];
    double v16 = -[HangHUDLine statusForHangWithDuration:timedOut:](self, "statusForHangWithDuration:timedOut:", (a4 >> 1) & 1);
    CGColorRef v17 = -[HUDLineDelegate currentHangTextColorForStatus:]( self->super._lineDelegate,  "currentHangTextColorForStatus:",  v16);
    [*(id *)&self->super._spacing setForegroundColor:v17];
    -[HUDTheme setForegroundColor:](self->_currentTheme, "setForegroundColor:", v17);
    unint64_t v29 = v16;
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[HUDLineDelegate textColorVibrantFilterForStatus:]( self->super._lineDelegate,  "textColorVibrantFilterForStatus:",  v16));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[HangHUDLine filters](self, "filters"));
    if (!v18 && v11) {
      goto LABEL_9;
    }
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[HangHUDLine filters](self, "filters"));
    uint64_t v21 = v20;
    if (!v20 || v11)
    {
      if (v11)
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[HangHUDLine filters](self, "filters"));
        double v32 = v11;
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
        uint64_t v27 = [v28 isEqualToArray:v26];

        if ((v27 & 1) == 0)
        {
LABEL_9:
          unint64_t v31 = v11;
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v31,  1LL));
          -[HangHUDLine setFilters:](self, "setFilters:", v19);
        }
      }

      else
      {
      }
    }

    else
    {

      -[HangHUDLine setFilters:](self, "setFilters:", 0LL);
    }

    if ((a4 & 1) == 0)
    {
      __int128 v22 = sub_1000233A4();
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_10002C878(v8);
      }

      -[HUDLine setUpdatesComplete:](self, "setUpdatesComplete:", 1LL);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"foregroundColor"));
      [v24 setRemovedOnCompletion:0];
      [v24 setFillMode:kCAFillModeForwards];
      objc_msgSend( v24,  "setToValue:",  -[HUDLineDelegate previousHangTextColorForStatus:]( self->super._lineDelegate,  "previousHangTextColorForStatus:",  v29));
      [v24 setDuration:0.5];
      __int128 v25 = objc_alloc_init(&OBJC_CLASS___HUDLineAnimationDelegate);
      -[HUDLineAnimationDelegate setHudLine:](v25, "setHudLine:", self);
      [v24 setDelegate:v25];
      [*(id *)&self->super._spacing addAnimation:v24 forKey:@"foreground-color-fade-animation"];
      -[HUDTheme addAnimation:forKey:]( self->_currentTheme,  "addAnimation:forKey:",  v24,  @"foreground-color-fade-animation");
    }

    goto LABEL_21;
  }

  double v7 = sub_1000233A4();
  uint64_t v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002C804((uint64_t)self, (os_log_s *)v8);
  }
LABEL_22:
}

void sub_1000145C8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_1000145E8(void *a1)
{
  if ([a1 isEqualToString:@"HTThirdPartyDevSupport"])
  {
    v3[0] = @"HangTracerHUDThresholdMSec";
    v3[1] = @"HangTracerThirdPartyHangThreshold";
    double v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 2LL));
  }

  else
  {
    double v1 = &__NSArray0__struct;
  }

  return v1;
}

void sub_100014B84()
{
  context = objc_autoreleasePoolPush();
  v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithCapacity:]( &OBJC_CLASS___NSMutableString,  "stringWithCapacity:",  52428800LL));
  if (v106
    && (id v0 = (void *)qword_10005BD40,
        double v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
        uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v0 stringFromDate:v1]),
        double v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"memory-snapshot-%@.ips",  v2)),  v2,  v1,  v105))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/var/root/Library/Caches/hangtracerd//%@",  v105));
    if (v3)
    {
      id v4 = v3;
      int __fd = open_dprotected_np((const char *)[v4 UTF8String], 514, 4, 0, 420);
      if (__fd < 0)
      {
        id v11 = v4;
        id v12 = [v11 UTF8String];
        CGColorRef v13 = __error();
        __int16 v14 = strerror(*v13);
        NSLog(@"Could not create file - won't take a memory snapshot: %s %s", v12, v14);
        goto LABEL_13;
      }

      id v103 = v4;
      id v5 = v106;
      if (!qword_10005B4D8)
      {
        double v6 = (void *)_CFCopyServerVersionDictionary();
        if (!v6) {
          double v6 = (void *)_CFCopySupplementalVersionDictionary();
        }
        double v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:_kCFSystemVersionProductVersionKey]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:_kCFSystemVersionProductNameKey]);
        id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:_kCFSystemVersionBuildVersionKey]);
        if (v8) {
          uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue( [v8 stringByReplacingOccurrencesOfString:@"iPhone OS" withString:@"iOS"]);
        }
        else {
          uint64_t v10 = @"???";
        }
        double v15 = @"???";
        if (v7) {
          double v16 = v7;
        }
        else {
          double v16 = @"???";
        }
        if (v9) {
          double v15 = v9;
        }
        uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ (%@)",  v10,  v16,  v15));
        if (v8) {

        }
        uint64_t v18 = (void *)qword_10005B4D8;
        qword_10005B4D8 = v17;

        __strlcpy_chk(&unk_10005B9E0, "{bug_type:152,os_version:", 100LL, 100LL);
        __strlcat_chk(&unk_10005B9E0, [(id)qword_10005B4D8 UTF8String], 100, 100);
        __strlcat_chk(&unk_10005B9E0, "}\n", 100LL, 100LL);
        uname((utsname *)&unk_10005B4E0);
      }

      objc_msgSend(v5, "appendFormat:", @"%s", &unk_10005B9E0);
      uint64_t v19 = (void *)qword_10005BD40;
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 stringFromDate:v20]);
      [v5 appendFormat:@"{\nModel : %s,\nTimestamp : %@,\nOSVersion : %@\n}\n", &unk_10005B8E0, v21, qword_10005B4D8];

      [v5 appendString:@"{\n"];
      id v22 = v5;
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  22LL));
      HIDWORD(namesCnt) = 38;
      mach_port_t v24 = mach_host_self();
      *(void *)x = 0LL;
      v108 = x;
      uint64_t v109 = 0x2020000000LL;
      uint64_t v110 = 0LL;
      if (host_statistics64(v24, 4, host_info64_out, (mach_msg_type_number_t *)&namesCnt + 1))
      {
        [v23 setObject:@"host_statistics64 failed" forKeyedSubscript:@"error"];
      }

      else
      {
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  vm_kernel_page_size));
        [v23 setObject:v25 forKeyedSubscript:@"page_size"];

        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  host_info64_out[0]));
        [v23 setObject:v26 forKeyedSubscript:@"free_count"];

        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  host_info64_out[1]));
        [v23 setObject:v27 forKeyedSubscript:@"active_count"];

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v114));
        [v23 setObject:v28 forKeyedSubscript:@"inactive_count"];

        unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v115));
        [v23 setObject:v29 forKeyedSubscript:@"wire_count"];

        unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v116));
        [v23 setObject:v30 forKeyedSubscript:@"zero_fill_count"];

        unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v117));
        [v23 setObject:v31 forKeyedSubscript:@"reactivations"];

        double v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v118));
        [v23 setObject:v32 forKeyedSubscript:@"pageins"];

        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v119));
        [v23 setObject:v33 forKeyedSubscript:@"pageouts"];

        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v120));
        [v23 setObject:v34 forKeyedSubscript:@"faults"];

        unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v121));
        [v23 setObject:v35 forKeyedSubscript:@"cow_faults"];

        size_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v122));
        [v23 setObject:v36 forKeyedSubscript:@"lookups"];

        double v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v123));
        [v23 setObject:v37 forKeyedSubscript:@"hits"];

        id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v124));
        [v23 setObject:v38 forKeyedSubscript:@"purges"];

        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v125));
        [v23 setObject:v39 forKeyedSubscript:@"purgeable_count"];

        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v126));
        [v23 setObject:v40 forKeyedSubscript:@"speculative_count"];

        double v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v127));
        [v23 setObject:v41 forKeyedSubscript:@"decompressions"];

        float v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v128));
        [v23 setObject:v42 forKeyedSubscript:@"compressions"];

        id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v129));
        [v23 setObject:v43 forKeyedSubscript:@"swapins"];

        double v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v130));
        [v23 setObject:v44 forKeyedSubscript:@"swapouts"];

        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v131));
        [v23 setObject:v45 forKeyedSubscript:@"compressor_page_count"];

        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v132));
        [v23 setObject:v46 forKeyedSubscript:@"throttled_count"];

        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v133));
        [v23 setObject:v47 forKeyedSubscript:@"external_page_count"];

        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v134));
        [v23 setObject:v48 forKeyedSubscript:@"internal_page_count"];

        __int128 v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v135));
        [v23 setObject:v49 forKeyedSubscript:@"total_uncompressed_pages_in_compressor"];
      }

      id v50 = [v23 count];
      *((void *)v108 + 3) = v50;
      *(void *)&__int128 info = _NSConcreteStackBlock;
      *((void *)&info + 1) = 3221225472LL;
      *(void *)&__int128 v137 = sub_100015BB0;
      *((void *)&v137 + 1) = &unk_1000497B8;
      id v51 = v22;
      *(void *)&__int128 v138 = v51;
      *((void *)&v138 + 1) = x;
      [v23 enumerateKeysAndObjectsUsingBlock:&info];
      mach_port_deallocate(mach_task_self_, v24);

      _Block_object_dispose(x, 8);
      id v52 = v51;
      __s = 0LL;
      __int128 v137 = 0u;
      __int128 v138 = 0u;
      __int128 info = 0u;
      *(void *)x = 0LL;
      if (dword_10005BA44) {
        goto LABEL_28;
      }
      pid_for_task(mach_task_self_, x);
      if ((ledger(0LL, *(void *)x, &info, 0LL) & 0x80000000) != 0
        || (v79 = DWORD2(v138), (__int16 v80 = (char *)malloc(96LL * *((void *)&v138 + 1))) == 0LL))
      {

        goto LABEL_109;
      }

      dword_10005BA48 = v79;
      __s = v80;
      if ((ledger(2LL, v80, &dword_10005BA48, 0LL) & 0x80000000) != 0)
      {
        uint64_t v55 = 0LL;
        id v57 = 0LL;
        int v78 = 0;
        double v85 = __s;
        goto LABEL_84;
      }

      uint64_t v81 = dword_10005BA48;
      if (dword_10005BA48)
      {
        uint64_t v82 = 0LL;
        unint64_t v83 = __s;
        do
        {
          size_t v84 = strlen(v83);
          ++v82;
          v83 += 96;
        }

        while (v81 != v82);
        int v78 = 0;
        id v57 = 0LL;
        uint64_t v55 = 0LL;
        dword_10005BA44 = v81;
        goto LABEL_83;
      }

      LODWORD(v82) = 0;
LABEL_81:
      dword_10005BA44 = v82;
      if ((_DWORD)v82 != (_DWORD)v81)
      {
LABEL_28:
        int v53 = memorystatus_control(1LL, 0LL, 0LL, 0LL, 0LL);
        if (v53)
        {
          size_t v54 = 2LL * v53;
          uint64_t v55 = (char *)malloc(v54);
          if (v55 && (unsigned int v56 = memorystatus_control(1LL, 0LL, 0LL, v55, v54)) != 0)
          {
            id v57 = (unsigned int *)malloc(48LL * dword_10005BA48);
            if (v57)
            {
              [v52 appendString:@"Processes :\n[\n"];
              if (v56 >= 0x18)
              {
                uint64_t v58 = 0LL;
                LODWORD(v59) = v56 / 0x18;
                if (v56 / 0x18 <= 1) {
                  uint64_t v59 = 1LL;
                }
                else {
                  uint64_t v59 = v59;
                }
                uint64_t v98 = v56 / 0x18;
                uint64_t v99 = v59;
                while (1)
                {
                  double v60 = (int *)&v55[24 * v58];
                  if ((ledger(1LL, *v60, v57, &dword_10005BA48) & 0x80000000) == 0) {
                    break;
                  }
                  id v65 = 0LL;
                  ++v58;
LABEL_66:

                  if (v58 == v99) {
                    goto LABEL_67;
                  }
                }

                unint64_t v61 = v57[12 * dword_10005BA44];
                vm_size_t v62 = vm_kernel_page_size;
                if ((proc_pidpath(*v60, host_info64_out, 0x1000u) & 0x80000000) == 0)
                {
                  id v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  host_info64_out));
                  double v64 = (char *)[v63 rangeOfString:@"/" options:4];
                  if (v64 != (char *)0x7FFFFFFFFFFFFFFFLL
                    && (id v65 = (__CFString *)objc_claimAutoreleasedReturnValue([v63 substringFromIndex:v64 + 1])) != 0
                    || (id v65 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UnknownProcess_%d",  *v60))) != 0LL)
                  {
                    BOOL v66 = -[__CFString length](v65, "length") == 0LL;

                    v67 = @"No_Name";
                    if (!v66) {
                      v67 = v65;
                    }
                    goto LABEL_48;
                  }
                }

                id v65 = 0LL;
                v67 = @"No_Name";
LABEL_48:
                double v68 = &v55[24 * v58];
                id v69 = "Y";
                if ((*((_DWORD *)v68 + 5) & 0x20) == 0) {
                  id v69 = "N";
                }
                uint64_t v70 = "-";
                if ((*((_DWORD *)v68 + 5) & 8) != 0) {
                  uint64_t v70 = v69;
                }
                [v52 appendFormat:@"{ProcessName:%@, Priority:%d, Footprint:%d, Dirty:%s", v67, *((unsigned int *)v68 + 1), v61 / v62, v70];
                id v71 = &v55[24 * v58];
                uint64_t v73 = *((void *)v71 + 1);
                double v72 = (unint64_t *)(v71 + 8);
                if (v73)
                {
                  v74 = objc_opt_new(&OBJC_CLASS___NSMutableString);
                  unint64_t v75 = *v72;
                  objc_msgSend(v52, "appendString:", @", Assertions:[");
                  if (v75)
                  {
                    unint64_t v76 = 0LL;
                    do
                    {
                      if ((v75 & 1) != 0)
                      {
                        if (v76 > 0x1A) {
                          -[NSMutableString appendFormat:](v74, "appendFormat:", @"UnknownAssertion_%d", v76);
                        }
                        else {
                          -[NSMutableString appendString:](v74, "appendString:", off_1000496D8[v76]);
                        }
                        if (v75 < 2) {
                          break;
                        }
                        -[NSMutableString appendString:](v74, "appendString:", @",");
                      }

                      ++v76;
                      BOOL v77 = v75 >= 2;
                      v75 >>= 1;
                    }

                    while (v77);
                  }

                  [v52 appendFormat:@"%@]", v74];
                }

                [v52 appendString:@"}"];
                if (++v58 == v98) {
                  uint64_t v58 = v98;
                }
                else {
                  [v52 appendString:@",\n"];
                }
                goto LABEL_66;
              }

LABEL_67:
              [v52 appendString:@"],\n"];
              int v78 = 1;
            }

            else
            {
              int v78 = 0;
            }
          }

          else
          {
            int v78 = 0;
            id v57 = 0LL;
          }

LABEL_83:
          double v85 = __s;
          if (!__s)
          {
LABEL_85:
            if (v55) {
              free(v55);
            }
            if (v57)
            {
              free(v57);

              if ((v78 & 1) == 0) {
                goto LABEL_109;
              }
LABEL_91:
              __sa = (char *)v52;
              uint64_t namesCnt = 0LL;
              *(void *)host_info64_out = 0LL;
              *(void *)&__int128 info = 0LL;
              *(void *)x = 0LL;
              mach_msg_type_number_t infoCnt = 0;
              mach_port_t v86 = mach_host_self();
              if (mach_memory_info( v86,  (mach_zone_name_array_t *)x,  (mach_msg_type_number_t *)&namesCnt,  (mach_zone_info_array_t *)&info,  &infoCnt,  (mach_memory_info_array_t *)host_info64_out,  (mach_msg_type_number_t *)&namesCnt + 1) < 0)
              {
                BOOL v94 = 0;
              }

              else
              {
                [__sa appendString:@"Zones :\n[\n"];
                uint64_t v87 = *(void *)x;
                mach_msg_type_number_t v89 = infoCnt;
                uint64_t v88 = namesCnt;
                uint64_t v90 = info;
                v91 = __sa;
                if ((_DWORD)v88 && (_DWORD)v88 == v89)
                {
                  uint64_t v92 = v88 - 1;
                  for (i = (void *)(v90 + 8); ; i += 8)
                  {
                    objc_msgSend( v91,  "appendFormat:",  @"{ Name : %s, Pages : %llu }",  v87,  *i / vm_kernel_page_size);
                    if (!v92) {
                      break;
                    }
                    [v91 appendString:@","];
                    [v91 appendString:@"\n"];
                    --v92;
                    v87 += 80LL;
                  }

                  [v91 appendString:@"\n"];
                }

                BOOL v94 = v88 == v89;

                if (v94)
                {
                  [v91 appendString:@"]\n"];
                  BOOL v94 = 1;
                }
              }

              if (*(void *)x) {
                vm_deallocate(mach_task_self_, *(vm_address_t *)x, 80LL * namesCnt);
              }
              if ((void)info) {
                vm_deallocate(mach_task_self_, info, (unint64_t)infoCnt << 6);
              }
              if (*(void *)host_info64_out) {
                vm_deallocate(mach_task_self_, *(vm_address_t *)host_info64_out, 176LL * HIDWORD(namesCnt));
              }

              if (v94)
              {
                [__sa appendString:@"}\n"];
                double v95 = __sa;
                write( __fd,  [v95 UTF8String],  (size_t)objc_msgSend(v95, "lengthOfBytesUsingEncoding:", 4));
                close(__fd);
                id v11 = v103;
                id v96 = (const char *)[v11 UTF8String];
                id v97 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/Library/Logs/CrashReporter//%@",  v105)));
                rename(v96, (const char *)[v97 UTF8String]);

                goto LABEL_13;
              }

              goto LABEL_109;
            }

            if (v78) {
              goto LABEL_91;
            }
LABEL_109:
            LODWORD(v3) = __fd;
            goto LABEL_12;
          }

LABEL_84:
          free(v85);
          goto LABEL_85;
        }
      }

      int v78 = 0;
      id v57 = 0LL;
      uint64_t v55 = 0LL;
      goto LABEL_83;
    }
  }

  else
  {
    LODWORD(v3) = 0;
    double v105 = 0LL;
  }

  id v103 = 0LL;
LABEL_12:
  close((int)v3);
  id v11 = v103;
  unlink((const char *)[v11 UTF8String]);
LABEL_13:
  objc_autoreleasePoolPop(context);
}

void sub_100015B90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

id sub_100015BB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 appendFormat:@"%@ : %lu", v6, objc_msgSend(a3, "unsignedIntegerValue")];

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    [*(id *)(a1 + 32) appendString:@","];
  }
  id result = [*(id *)(a1 + 32) appendString:@"\n"];
  --*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  return result;
}

void sub_100015CC4(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_10005BA50;
  qword_10005BA50 = (uint64_t)v1;
}

void sub_100015E18(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_10005BA60;
  qword_10005BA60 = (uint64_t)v1;
}

void sub_1000160EC(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[BSMutableServiceInterface interfaceWithIdentifier:]( &OBJC_CLASS___BSMutableServiceInterface,  "interfaceWithIdentifier:",  v1));

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[BSObjCProtocol protocolForProtocol:]( &OBJC_CLASS___BSObjCProtocol,  "protocolForProtocol:",  &OBJC_PROTOCOL___HangHUDServerProtocol));
  [v5 setServer:v2];

  id v3 = [v5 copy];
  id v4 = (void *)qword_10005BA70;
  qword_10005BA70 = (uint64_t)v3;
}

uint64_t sub_100016190(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned __int8 v3 = [v2 enableLoggingForWidgetRenderer];

  if ((v3 & 1) != 0 || ([v1 containsString:@"WidgetRenderer-Default"] & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned __int8 v6 = [v5 enableLoggingForPoster];

    if (v6 & 1) != 0 || ([v1 containsString:@"PosterBoard"])
    {
      LOBYTE(v4) = 0;
    }

    else
    {
      id v7 = [[LSApplicationExtensionRecord alloc] initWithBundleIdentifier:v1 error:0];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 extensionPointRecord]);
        id v4 = v9;
        if (v9)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
          unsigned int v11 = [v10 isEqualToString:@"com.apple.posterkit.provider"];

          LODWORD(v4) = (int)(v11 << 31) >> 31;
        }
      }

      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }

  else
  {
    LOBYTE(v4) = 1;
  }

  return v4 & 1;
}

id sub_1000162B0()
{
  v6[0] = @"/var/root/Library/Caches/hangtracerd/spool";
  v6[1] = @"/var/mobile/Library/Logs/CrashReporter/";
  id v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));
  v5[0] = @"UIKit-runloop";
  v5[1] = @"Fence-hang";
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  id v2 = sub_100016390(v0, v1, 1);
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

  return v3;
}

id sub_100016390(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v36 = a2;
  uint64_t v34 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v5;
  id v31 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v31)
  {
    uint64_t v30 = a3 ^ 1u;
    uint64_t v29 = *(void *)v50;
    NSURLResourceKey v6 = NSURLIsDirectoryKey;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v50 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v7;
        uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  *(void *)(*((void *)&v49 + 1) + 8 * v7)));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v55[0] = v6;
        v55[1] = NSURLNameKey;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 2LL));
        double v32 = (void *)v8;
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( [v9 enumeratorAtURL:v8 includingPropertiesForKeys:v10 options:v30 errorHandler:&stru_1000497D8]);

        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v38 = v11;
        id v12 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v46;
          uint64_t v35 = *(void *)v46;
          do
          {
            double v15 = 0LL;
            id v37 = v13;
            do
            {
              if (*(void *)v46 != v14) {
                objc_enumerationMutation(v38);
              }
              double v16 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)v15);
              uint64_t v17 = objc_autoreleasePoolPush();
              id v44 = 0LL;
              [v16 getResourceValue:&v44 forKey:v6 error:0];
              id v18 = v44;
              if (([v18 BOOLValue] & 1) == 0)
              {
                id v43 = 0LL;
                [v16 getResourceValue:&v43 forKey:NSURLNameKey error:0];
                id v19 = v43;
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastPathComponent]);
                __int128 v39 = 0u;
                __int128 v40 = 0u;
                __int128 v41 = 0u;
                __int128 v42 = 0u;
                id v21 = v36;
                id v22 = [v21 countByEnumeratingWithState:&v39 objects:v53 count:16];
                if (v22)
                {
                  id v23 = v22;
                  uint64_t v24 = *(void *)v40;
                  while (2)
                  {
                    for (i = 0LL; i != v23; i = (char *)i + 1)
                    {
                      if (*(void *)v40 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      if ([v20 hasPrefix:*(void *)(*((void *)&v39 + 1) + 8 * (void)i)])
                      {

                        id v21 = (id)objc_claimAutoreleasedReturnValue([v16 path]);
                        -[NSMutableArray addObject:](v34, "addObject:", v21);
                        goto LABEL_22;
                      }
                    }

                    id v23 = [v21 countByEnumeratingWithState:&v39 objects:v53 count:16];
                    if (v23) {
                      continue;
                    }
                    break;
                  }

LABEL_22:
                  NSURLResourceKey v6 = NSURLIsDirectoryKey;
                  uint64_t v14 = v35;
                }

                id v13 = v37;
              }

              objc_autoreleasePoolPop(v17);
              double v15 = (char *)v15 + 1;
            }

            while (v15 != v13);
            id v13 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
          }

          while (v13);
        }

        uint64_t v7 = v33 + 1;
      }

      while ((id)(v33 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    }

    while (v31);
  }

  id v26 = -[NSMutableArray copy](v34, "copy");
  return v26;
}

uint64_t sub_10001675C(void *a1, int a2)
{
  id v3 = a1;
  id v4 = (void *)MGCopyAnswer(@"HWModelStr", 0LL);
  uint64_t v5 = MGCopyAnswer(@"SupplementalBuildVersion", 0LL);
  NSURLResourceKey v6 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v6, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v111 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v6, "stringFromDate:", v7));
  unint64_t v112 = (void *)v5;
  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@-%@.%@",  @"ArchivedHangs",  v4,  v5,  v8,  @"tgz"));

  uint64_t v10 = (void *)v9;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/%@",  "/var/root/Library/Caches/hangtracerd/tmp",  v9));
  id v12 = sub_1000162B0();
  id v113 = (id)objc_claimAutoreleasedReturnValue(v12);
  id v13 = v11;
  uint64_t v14 = (const char *)[v13 UTF8String];
  else {
    int v15 = 2;
  }
  uint64_t v16 = open_dprotected_np(v14, 514, v15, 0, 416LL);
  if ((v16 & 0x80000000) != 0)
  {
    id v24 = sub_1000233A4();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v128 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Error getting file descriptor for %s due to protection classes",  buf,  0xCu);
    }

    goto LABEL_18;
  }

  uint64_t v17 = v16;
  uint64_t v110 = v4;
  uint64_t v18 = archive_write_new();
  int v19 = archive_write_add_filter_gzip();
  if (v19)
  {
    int v20 = v19;
    archive_write_free(v18);
    close(v17);
    id v21 = sub_1000233A4();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v128 = v20;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)&v128[6] = archive_errno(v18);
      *(_WORD *)&v128[10] = 2080;
      *(void *)&v128[12] = archive_error_string(v18);
      id v23 = "Error creating compressed file (archive_write_add_filter_gzip): %i err_num: %i, err_string: %s";
      goto LABEL_16;
    }

    goto LABEL_17;
  }

  if (a2) {
    __int128 v25 = "compression-level=0";
  }
  else {
    __int128 v25 = "compression-level=1";
  }
  int v26 = archive_write_set_options(v18, v25);
  if (v26)
  {
    int v27 = v26;
    archive_write_free(v18);
    close(v17);
    id v28 = sub_1000233A4();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v128 = v27;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)&v128[6] = archive_errno(v18);
      *(_WORD *)&v128[10] = 2080;
      *(void *)&v128[12] = archive_error_string(v18);
      id v23 = "Error creating compressed file (archive_write_set_options): %i err_num: %i, err_string: %s";
      goto LABEL_16;
    }

    goto LABEL_17;
  }

  int v40 = archive_write_set_format_pax(v18);
  id v31 = v113;
  if (v40)
  {
    int v41 = v40;
    archive_write_free(v18);
    close(v17);
    id v42 = sub_1000233A4();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v128 = v41;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)&v128[6] = archive_errno(v18);
      id v31 = v113;
      *(_WORD *)&v128[10] = 2080;
      *(void *)&v128[12] = archive_error_string(v18);
      id v43 = "Error creating compressed file (archive_write_set_format_pax): %i err_num: %i, err_string: %s";
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v43, buf, 0x18u);
      goto LABEL_36;
    }

    goto LABEL_36;
  }

  int v44 = archive_write_open_fd(v18, v17);
  if (v44)
  {
    int v45 = v44;
    archive_write_free(v18);
    close(v17);
    id v46 = sub_1000233A4();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v128 = v45;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)&v128[6] = archive_errno(v18);
      id v31 = v113;
      *(_WORD *)&v128[10] = 2080;
      *(void *)&v128[12] = archive_error_string(v18);
      id v43 = "Error creating compressed file (archive_write_open_fd): %i err_num: %i, err_string: %s";
      goto LABEL_35;
    }

LABEL_36:
    id v4 = v110;
    uint64_t v30 = v111;
    uint64_t v29 = v112;
    goto LABEL_20;
  }

  id v105 = v3;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  id v22 = (os_log_s *)v113;
  v108 = v10;
  id v106 = -[os_log_s countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v115,  v120,  16LL);
  if (!v106) {
    goto LABEL_59;
  }
  uint64_t v107 = *(void *)v116;
  while (2)
  {
    __int128 v47 = 0LL;
    do
    {
      if (*(void *)v116 != v107) {
        objc_enumerationMutation(v22);
      }
      id v48 = *(id *)(*((void *)&v115 + 1) + 8LL * (void)v47);
      __int128 v49 = (const char *)[v48 UTF8String];
      id v109 = objc_claimAutoreleasedReturnValue([v48 lastPathComponent]);
      id v50 = [v109 UTF8String];
      uint64_t v51 = archive_entry_new();
      int v52 = stat(v49, &v119);
      if (v52)
      {
        int v53 = v52;
        archive_entry_free(v51);
        id v54 = sub_1000233A4();
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
        if (!os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_DEFAULT))
        {
LABEL_46:
          uint64_t v10 = v108;
          uint64_t v59 = v109;

          goto LABEL_47;
        }

        *(_DWORD *)buf = 136315394;
        *(void *)uint64_t v128 = v49;
        *(_WORD *)&void v128[8] = 1024;
        *(_DWORD *)&v128[10] = v53;
        unsigned int v56 = (os_log_s *)v55;
        id v57 = "Error stat-ing original file: %s with error: %i. Will skip.";
        uint32_t v58 = 18;
LABEL_45:
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, v57, buf, v58);
        goto LABEL_46;
      }

      uint64_t v60 = v51;
      int v61 = open(v49, 0);
      if (v61 < 0)
      {
        archive_entry_free(v51);
        id v67 = sub_1000233A4();
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(v67);
        if (!os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_46;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)uint64_t v128 = v49;
        unsigned int v56 = (os_log_s *)v55;
        id v57 = "Error getting fd for file: %s. Will skip.";
        uint32_t v58 = 12;
        goto LABEL_45;
      }

      int v62 = v61;
      archive_entry_copy_stat(v60, &v119);
      archive_entry_set_pathname(v60, v50);
      archive_entry_set_filetype(v60, 0x8000LL);
      archive_entry_set_perm(v60, 420LL);
      int v63 = archive_write_header(v18, v60);
      if (v63)
      {
        int v87 = v63;
        archive_entry_free(v60);
        id v88 = sub_1000233A4();
        mach_msg_type_number_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          int v90 = archive_errno(v18);
          uint64_t v91 = archive_error_string(v18);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)uint64_t v128 = v87;
          *(_WORD *)&v128[4] = 1024;
          *(_DWORD *)&v128[6] = v90;
          *(_WORD *)&v128[10] = 2080;
          *(void *)&v128[12] = v91;
          _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "Error creating compressed file (archive_write_header): %i err_num: %i, err_string: %s",  buf,  0x18u);
        }

LABEL_65:
        id v3 = v105;
        uint64_t v30 = v111;
        uint64_t v29 = v112;
        archive_write_free(v18);
        close(v17);
        id v79 = sub_1000233A4();
        __int16 v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
        uint64_t v10 = v108;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          int v81 = archive_errno(v18);
          uint64_t v82 = archive_error_string(v18);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)uint64_t v128 = v81;
          *(_WORD *)&v128[4] = 2080;
          *(void *)&v128[6] = v82;
          _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "Error creating compressed file (addFileToZippingArchive) err_num: %i, err_string: %s",  buf,  0x12u);
        }

        id v4 = v110;
        goto LABEL_19;
      }

      ssize_t v64 = read(v62, buf, 0x2000uLL);
      if (v64 >= 1)
      {
        ssize_t v65 = v64;
        while (1)
        {
          uint64_t v66 = archive_write_data(v18, buf, v65);
          if (v66 != v65) {
            break;
          }
          ssize_t v65 = read(v62, buf, 0x2000uLL);
          if (v65 < 1) {
            goto LABEL_55;
          }
        }

        uint64_t v74 = v66;
        id v75 = sub_1000233A4();
        unint64_t v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          int v77 = archive_errno(v18);
          uint64_t v78 = archive_error_string(v18);
          *(_DWORD *)uint64_t v121 = 134218498;
          uint64_t v122 = v74;
          __int16 v123 = 1024;
          int v124 = v77;
          __int16 v125 = 2080;
          uint64_t v126 = v78;
          _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "Error writing data to archive: %zd byte written with err_num: %i, err_string: %s",  v121,  0x1Cu);
        }

        archive_entry_free(v60);
        close(v62);
        goto LABEL_65;
      }

LABEL_55:
      archive_entry_free(v60);
      close(v62);
      uint64_t v10 = v108;
      uint64_t v59 = v109;
LABEL_47:

      __int128 v47 = (char *)v47 + 1;
    }

    while (v47 != v106);
    id v68 = -[os_log_s countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v115,  v120,  16LL);
    id v106 = v68;
    if (v68) {
      continue;
    }
    break;
  }

LABEL_17:
  id v4 = v110;
LABEL_18:
  uint64_t v30 = v111;
  uint64_t v29 = v112;
LABEL_19:
  id v31 = v113;
LABEL_20:

  id v32 = sub_1000233A4();
  uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v128 = v13;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Failed to createZippedArchive: %@", buf, 0xCu);
  }

  id v34 = v13;
  if (unlink((const char *)[v34 UTF8String]) < 0)
  {
    id v36 = sub_1000233A4();
    id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = *__error();
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v128 = v34;
      *(_WORD *)&void v128[8] = 1024;
      *(_DWORD *)&v128[10] = v38;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  OS_LOG_TYPE_DEFAULT,  "Unable to unlink temp archive file %@ due to error %{darwin.errno}d",  buf,  0x12u);
    }

    uint64_t v35 = 0LL;
    goto LABEL_27;
  }

  uint64_t v35 = 0LL;
LABEL_28:

  return v35;
}

BOOL sub_100017474(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  id v6 = sub_1000233A4();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Error handling url %@: %@",  (uint8_t *)&v9,  0x16u);
  }

  return 1;
}

id sub_100017544(double a1)
{
  if ((sub_100026710() & 1) != 0) {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[HUDConfiguration sharedInstance](&OBJC_CLASS___HUDConfiguration, "sharedInstance"));
  }
  else {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  }
  id v3 = v2;
  id v4 = [v2 runloopHangTimeoutDurationMSec];

  double v5 = (double)(unint64_t)v4;
  if ((double)(unint64_t)v4 <= a1) {
    id v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.f+ ms",  v5,  (double)(unint64_t)v4);
  }
  else {
    id v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.f ms", v5, *(void *)&a1);
  }
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

void sub_1000178D0(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100017934;
  v4[3] = &unk_100049070;
  v4[4] = v2;
  *(double *)&v4[5] = a2;
  dispatch_sync(v3, v4);
}

void sub_100017934(uint64_t a1)
{
  id v2 = sub_100017544(*(double *)(a1 + 40));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  double v5 = *(void **)(a1 + 32);
  id v4 = (id *)(a1 + 32);
  [v5 setString:v3];

  id v6 = sub_1000233A4();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002CBCC(v4, v7);
  }
}

void sub_1000179AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(dispatch_queue_s **)(v1 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017A0C;
  block[3] = &unk_100048EF8;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void sub_100017A0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0LL;
}

void sub_100017AC8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id sub_100017AD4(int a1)
{
  if (proc_pidpath(a1, buffer, 0x1000u))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
    if (!v2)
    {
      id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buffer,  1LL));
      id v3 = sub_1000233A4();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        sub_10002CC5C((uint64_t)v2, v4);
      }
    }
  }

  else
  {
    id v2 = 0LL;
  }

  return v2;
}

__CFString *sub_100017BD0(void *a1)
{
  uint64_t v1 = a1;
  if (v1 && (CFURLRef v2 = CFURLCreateWithFileSystemPath(0LL, v1, kCFURLPOSIXPathStyle, 1u)) != 0LL)
  {
    CFURLRef v3 = v2;
    id v4 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle(kCFAllocatorDefault, v2);
    if (v4)
    {
      double v5 = v4;
      CFStringRef Identifier = CFBundleGetIdentifier(v4);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue(Identifier);
      CFRelease(v5);
    }

    else
    {
      uint64_t v7 = &stru_10004A8D0;
    }

    CFRelease(v3);
  }

  else
  {
    uint64_t v7 = &stru_10004A8D0;
  }

  return v7;
}

id sub_100017C70(uint64_t a1, uint64_t a2)
{
  CFURLRef v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  a2,  NSLocalizedDescriptionKey));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SentryTailspinError",  a1,  v3));

  return v4;
}

uint64_t sub_100017CE8(void *a1, int a2)
{
  id v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v21 = 0;
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v6 = sub_1000233A4();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Directory doesn't exist -> trying to create directory at path: %@",  buf,  0xCu);
    }

    if (a2)
    {
      NSFileAttributeKey v26 = NSFileOwnerAccountName;
      int v27 = @"mobile";
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    id v20 = 0LL;
    [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:v8 error:&v20];
    id v10 = v20;
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v12 = [v11 fileExistsAtPath:v3 isDirectory:&v21];

    if (v21) {
      uint64_t v9 = v12;
    }
    else {
      uint64_t v9 = 0LL;
    }
    id v13 = sub_1000233A4();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v9 == 1)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v3;
        uint64_t v16 = "Successfully created directory at path %@";
        uint64_t v17 = v14;
        uint32_t v18 = 12;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }

    else if (v15)
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v3;
      __int16 v24 = 2112;
      id v25 = v10;
      uint64_t v16 = "Error: error creating directory at path %@ %@";
      uint64_t v17 = v14;
      uint32_t v18 = 22;
      goto LABEL_19;
    }

    goto LABEL_21;
  }

  uint64_t v9 = 1LL;
LABEL_21:

  return v9;
}

void sub_100017F30(void *a1)
{
  id v1 = a1;
  CFURLRef v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = sub_1000233A4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002CCD0((uint64_t)v1, v4);
  }

  uint32_t v18 = v1;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v1));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v2 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:0 errorHandler:&stru_100049848]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v19 = 0LL;
        unsigned __int8 v13 = [v2 removeItemAtURL:v12 error:&v19];
        id v14 = v19;
        id v15 = sub_1000233A4();
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        uint64_t v17 = v16;
        if ((v13 & 1) != 0)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v12;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Successfully deleted file at %@",  buf,  0xCu);
          }
        }

        else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v25 = v12;
          __int16 v26 = 2112;
          id v27 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to delete file at %@ : %@",  buf,  0x16u);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v9);
  }
}

BOOL sub_100018198(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  BOOL v5 = a3;
  id v6 = sub_1000233A4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to enumerate file at %@ : %@",  (uint8_t *)&v9,  0x16u);
  }

  return 1;
}

void sub_100018268(int a1)
{
  uint64_t v33 = @"Subsystems";
  v31[0] = @"com.apple.hangtracer";
  v31[1] = @"com.apple.performancelogging";
  v32[0] = &off_100050A70;
  v32[1] = &off_100050A70;
  v31[2] = @"com.apple.Sentry.Framework";
  v32[2] = &off_100050A70;
  CFURLRef v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));
  id v34 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));

  id v28 = 0LL;
  int v4 = OSLogValidateProfilePayload(v3, &v28);
  id v5 = v28;
  id v6 = v5;
  if (v4)
  {
    id v7 = sub_1000233A4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Successfully validated profile payload", buf, 2u);
    }

    if (a1)
    {
      id v27 = 0LL;
      int v9 = OSLogInstallProfilePayload(v3, &v27);
      id v10 = v27;
      __int16 v11 = v10;
      if (v9)
      {
        id v12 = sub_1000233A4();
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v14 = "Successfully installed profile payload";
LABEL_14:
          uint64_t v16 = v13;
          os_log_type_t v17 = OS_LOG_TYPE_INFO;
          uint32_t v18 = 2;
          goto LABEL_15;
        }

        goto LABEL_23;
      }

      if (v10)
      {
        id v22 = sub_1000233A4();
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v23;
        __int16 v24 = "Failed to install os log profile payload with error: %@";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);

        goto LABEL_23;
      }
    }

    else
    {
      id v26 = 0LL;
      int v19 = OSLogRemoveProfilePayload(v3, &v26);
      id v20 = v26;
      __int16 v11 = v20;
      if (v19)
      {
        id v21 = sub_1000233A4();
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v14 = "Successfully removed profile payload";
          goto LABEL_14;
        }

LABEL_23:
        goto LABEL_24;
      }

      if (v20)
      {
        id v25 = sub_1000233A4();
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v23;
        __int16 v24 = "Failed to remove os log profile payload with error: %@";
        goto LABEL_22;
      }
    }

            goto LABEL_30;
          }

          __int16 v24 = sub_100025798(v51);
          id v25 = sub_1000233A4();
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          int v19 = v26;
          if (v24 >= 1000.0)
          {
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
              goto LABEL_23;
            }
            id v27 = sub_100025798(v51);
            *(_DWORD *)buf = 134217984;
            uint64_t v60 = v27;
            id v20 = v19;
            id v21 = "HTAssertion: checkOverlap: not ignoring hang during screen off with duration %.0fms";
            __int128 v23 = 12;
            goto LABEL_22;
          }

          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            sub_10002D708(v57, v51, &v58, v19);
          }
        }

        v54 += v12 - v11;
        if (a4)
        {
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472LL;
          v56[2] = sub_100027270;
          v56[3] = &unk_10004A760;
          v56[4] = v12;
          v56[5] = v11;
          v56[6] = v9 + 32;
          AnalyticsSendEventLazy(@"com.apple.hangtracer.assertion_overlap", v56);
        }
      }
    }

LABEL_24:
    goto LABEL_25;
  }

  if (v5)
  {
    id v15 = sub_1000233A4();
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v13;
      id v14 = "Failed to validate os log profile payload with error: %@";
      uint64_t v16 = (os_log_s *)v11;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      uint32_t v18 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v14, buf, v18);
      goto LABEL_23;
    }

    goto LABEL_24;
  }

LABEL_25:
}

    munmap(a4, a5);
LABEL_26:
    uint64_t v33 = 0LL;
    goto LABEL_27;
  }

  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___HTProcessInfo;
  id v20 = -[HTProcessInfo init](&v47, "init");
  id v21 = v20;
  if (v20)
  {
    v20->int64_t pid = a3;
    v20->shmem_size_t length = a5;
    v20->shmem_region = ($FD34E87E51AB49513A5D5AF0173BC9E4 *)a4;
    objc_storeStrong((id *)&v20->processPath, v12);
    id v22 = objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v21->processPath, "lastPathComponent"));
    __int128 v23 = (void *)v22;
    if (v22) {
      __int16 v24 = (__CFString *)v22;
    }
    else {
      __int16 v24 = @"[Unknown]";
    }
    objc_storeStrong((id *)&v21->processName, v24);

    id v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a6));
    processBundleID = v21->processBundleID;
    v21->processBundleID = (NSString *)v25;

    id v27 = -[NSString rangeOfString:options:](v21->processBundleID, "rangeOfString:options:", @"com.apple.", 1LL);
    if (v28) {
      uint64_t v29 = v27 == 0LL;
    }
    else {
      uint64_t v29 = 0;
    }
    uint64_t v30 = v29;
    v21->isFirstPartyApp = v30;
    if (v29) {
      uint64_t v35 = sub_100016190(v21->processBundleID);
    }
    else {
      uint64_t v35 = 0;
    }
    v21->shouldDisableProcess = v35;
    v21->shouldSaveHangLogs = -[HTProcessInfo checkShouldSaveHangLogs](v21, "checkShouldSaveHangLogs");
    id v36 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_proc,  a3,  0x80000000uLL,  (dispatch_queue_t)qword_10005BD48);
    appExitSource = v21->appExitSource;
    v21->appExitSource = (OS_dispatch_source *)v36;

    int v38 = (dispatch_source_s *)v21->appExitSource;
    if (v38)
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_100019D34;
      v45[3] = &unk_1000499A0;
      id v46 = a3;
      v45[4] = v21;
      dispatch_source_set_event_handler(v38, v45);
      dispatch_resume((dispatch_object_t)v21->appExitSource);
    }

    else
    {
      __int128 v39 = sub_1000233A4();
      int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Unable to setup up dispatch source to monitor PROC_EXIT for new proc %u",  buf,  8u);
      }
    }

    int v41 = sub_1000233A4();
    id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      processPath = (unint64_t)v21->processPath;
      int64_t pid = v21->pid;
      *(_DWORD *)buf = 138543618;
      __int128 v49 = processPath;
      id v50 = 1024;
      LODWORD(v51) = pid;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "New proc: %{public}@(%u)", buf, 0x12u);
    }
  }

  self = v21;
  uint64_t v33 = self;
LABEL_27:

  return v33;
}

id sub_100018594()
{
  if (qword_10005BA88 != -1) {
    dispatch_once(&qword_10005BA88, &stru_100049868);
  }
  return (id)qword_10005BA80;
}

void sub_1000185D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "signpost_hang");
  CFURLRef v2 = (void *)qword_10005BA80;
  qword_10005BA80 = (uint64_t)v1;
}

id sub_100018604()
{
  if (qword_10005BA98 != -1) {
    dispatch_once(&qword_10005BA98, &stru_100049888);
  }
  return (id)qword_10005BA90;
}

void sub_100018644(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "always_on_hang");
  CFURLRef v2 = (void *)qword_10005BA90;
  qword_10005BA90 = (uint64_t)v1;
}

void sub_100018674(void *a1, void *a2, os_signpost_id_t a3, uint64_t a4, void *a5)
{
  int v9 = a1;
  id v10 = a2;
  id v11 = a5;
  mach_get_times(buf, &v18, 0LL);
  uint64_t v12 = v18;
  uint64_t v13 = *(void *)buf;
  if (os_signpost_enabled((os_log_t)v11))
  {
    id v14 = (os_log_s *)v11;
    id v15 = v14;
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      uint64_t v16 = @"Unknown";
      *(_DWORD *)buf = 134349826;
      *(void *)&uint8_t buf[4] = v12 - v13 + a3;
      if (v10) {
        os_log_type_t v17 = v10;
      }
      else {
        os_log_type_t v17 = @"Unknown";
      }
      __int16 v20 = 2050;
      uint64_t v21 = v12 - v13 + a4;
      __int16 v22 = 2114;
      if (v9) {
        uint64_t v16 = v9;
      }
      __int128 v23 = v17;
      __int16 v24 = 2114;
      id v25 = v16;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  a3,  "HangInterval",  "%{public, signpost.description:begin_time}llu, %{public, signpost.description:end_time}llu, BundleIdOverride=%{p ublic, signpost.description:attribute}@ type=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ",  buf,  0x2Au);
    }
  }
}

uint64_t sub_1000187D4(int a1)
{
  CFURLRef v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 environment]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"HT_DISABLE_DEBUGGER_CHECK"]);
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = sub_1000233A4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Check for app is being debugged is disabled",  buf,  2u);
    }

    return 0LL;
  }

  if (!proc_pidinfo(a1, 13, 1uLL, buf, 64))
  {
    id v9 = sub_1000233A4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Failed to check if app is being debugged",  (uint8_t *)&v15,  2u);
    }

    uint64_t v8 = 0LL;
    goto LABEL_18;
  }

  if ((v20[16] & 2) != 0)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
    if ((-[os_log_s isEqualToString:](v10, "isEqualToString:", @"xctest") & 1) != 0
      || (-[os_log_s isEqualToString:](v10, "isEqualToString:", @"hangman") & 1) != 0
      || -[os_log_s hasSuffix:](v10, "hasSuffix:", @"-Runner"))
    {
      id v11 = sub_1000233A4();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543618;
        uint64_t v16 = v10;
        __int16 v17 = 1024;
        int v18 = a1;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [%d] is a test process, isAppBeingDebugged returning NO",  (uint8_t *)&v15,  0x12u);
      }

      uint64_t v8 = 0LL;
    }

    else
    {
      id v14 = sub_1000233A4();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "App is being debugged, do not track this hang",  (uint8_t *)&v15,  2u);
      }

      uint64_t v8 = 1LL;
    }

LABEL_18:
    return v8;
  }

  return 0LL;
}

__CFString *sub_100018A40(unint64_t a1)
{
  if (a1 > 4) {
    return @"Unknown";
  }
  else {
    return *off_1000498A8[a1];
  }
}

__CFString *sub_100018A78(unint64_t a1)
{
  if (a1 <= 0xA) {
    a1 = *off_1000498D0[a1];
  }
  return (__CFString *)(id)a1;
}

BOOL sub_100018AA8(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 3;
}

CFStringRef sub_100018AB8(unint64_t a1)
{
  if (a1 > 0xE) {
    return @"tailspin capture failed for unknown reason";
  }
  else {
    return off_100049928[a1];
  }
}

uint64_t sub_100018ADC(int a1, int a2, double a3)
{
  if (a1)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    double v5 = (double)(unint64_t)[v4 runloopLongHangDurationThresholdMSec];

    if (v5 <= a3)
    {
      return 222LL;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      double v7 = (double)(unint64_t)[v6 runloopHangDurationThresholdMSec];

      if (v7 <= a3) {
        return 223LL;
      }
      else {
        return 310LL;
      }
    }
  }

  else if (a2)
  {
    return 328LL;
  }

  else
  {
    return 228LL;
  }

uint64_t sub_100018B74(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"UIKit-runloop"])
  {
    uint64_t v2 = 0LL;
  }

  else if ([v1 containsString:@"Fence-hang"])
  {
    uint64_t v2 = 1LL;
  }

  else if ([v1 containsString:@"Slow-Launch"])
  {
    uint64_t v2 = 2LL;
  }

  else if ([v1 containsString:@"Sentry"])
  {
    uint64_t v2 = 3LL;
  }

  else if ([v1 containsString:@"Force-Quit"])
  {
    uint64_t v2 = 4LL;
  }

  else
  {
    uint64_t v2 = 5LL;
  }

  return v2;
}

NSDate *sub_100018C38(uint64_t a1, void *a2, unint64_t a3)
{
  double v6 = sub_10002584C((unint64_t)(v5 * 1000.0));
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  sub_1000257EC((unint64_t)(v6 - (double)a3) + a1));
}

BOOL sub_100018C90(unint64_t a1, uint64_t a2, double *a3)
{
  unsigned int v3 = atomic_load((unsigned int *)(a2 + 24));
  BOOL result = 0;
  if (!v3)
  {
    unint64_t v5 = *(void *)a2;
    double v6 = sub_100025798(a1);
    double v7 = v6 - sub_100025798(v5);
    *a3 = v7;
    if (v7 > 100.0) {
      return 1;
    }
  }

  return result;
}

LABEL_12:
  os_unfair_lock_unlock(&stru_10005BB4C);
  return (char)v3;
}

    uint64_t v2 = sub_100024E24(a1);
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);

    return v1;
  }

  if (a1 == 2970405393LL)
  {
    id v1 = @"Maximum States Violation";
    return v1;
  }

  if (a1 == 3490524077LL)
  {
    id v1 = @"Maximum Assertions Violation";
    return v1;
  }

  if (a1 != 3735943697LL) {
    goto LABEL_12;
  }
  id v1 = @"User-Initiated Quit";
  return v1;
}

id sub_100019D34(uint64_t a1)
{
  id v2 = sub_1000233A4();
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 40);
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "HangTracer: Detected app exit (pid=%u), check for hangs",  (uint8_t *)v8,  8u);
  }

  id v5 = [*(id *)(a1 + 32) checkEventsForTimeouts:mach_absolute_time() withType:8];
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v6 recordHang];

  return +[HTProcessInfo stopWatchingPid:](&OBJC_CLASS___HTProcessInfo, "stopWatchingPid:", *(unsigned int *)(a1 + 40));
}

id sub_10001A690(uint64_t a1)
{
  v9[0] = off_10005B108;
  v8[0] = off_10005B0F0;
  v8[1] = off_10005B110;
  id v2 = sub_100018A78(*(void *)(a1 + 40));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40LL);
  v9[1] = v3;
  v9[2] = v4;
  _DWORD v8[2] = off_10005B120;
  v8[3] = off_10005B118;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  void v9[3] = v5;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));

  return v6;
}

id sub_10001A794(uint64_t a1)
{
  v9[0] = off_10005B100;
  v8[0] = off_10005B0F0;
  v8[1] = off_10005B110;
  id v2 = sub_100018A78(*(void *)(a1 + 40));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40LL);
  v9[1] = v3;
  v9[2] = v4;
  _DWORD v8[2] = off_10005B120;
  v8[3] = off_10005B118;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  void v9[3] = v5;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));

  return v6;
}

id sub_10001A898(uint64_t a1)
{
  v9[0] = off_10005B0F8;
  v8[0] = off_10005B0F0;
  v8[1] = off_10005B110;
  id v2 = sub_100018A78(*(void *)(a1 + 40));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40LL);
  v9[1] = v3;
  v9[2] = v4;
  _DWORD v8[2] = off_10005B120;
  v8[3] = off_10005B118;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  void v9[3] = v5;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));

  return v6;
}

id sub_10001B6A0(uint64_t a1)
{
  v9[0] = off_10005B0F8;
  v8[0] = off_10005B0F0;
  v8[1] = off_10005B110;
  id v2 = sub_100018A78(*(void *)(a1 + 40));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40LL);
  v9[1] = v3;
  v9[2] = v4;
  _DWORD v8[2] = off_10005B120;
  v8[3] = off_10005B118;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  void v9[3] = v5;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));

  return v6;
}

void sub_10001C17C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_10005BB50;
  qword_10005BB50 = (uint64_t)v1;
}

void sub_10001C4B0(id a1)
{
  v3[0] = @"HTProfile";
  v3[1] = @"HTEPL";
  void v3[2] = @"HTThirdPartyDevSupport";
  v3[3] = @"PLTasking";
  v3[4] = &stru_10004A8D0;
  v3[5] = @"PDSEHangTracer";
  v3[6] = @"PDSEHTThirdParty";
  v3[7] = @"PDSEWorkflowResponsiveness";
  v3[8] = @"PDSEHTRateOnly";
  v3[9] = @"PDSESentry";
  v3[10] = @"PDSEAppLaunch";
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 11LL));
  id v2 = (void *)qword_10005BB68;
  qword_10005BB68 = v1;
}

void sub_10001E750(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___HTPrefs);
  id v2 = (void *)qword_10005BB70;
  qword_10005BB70 = (uint64_t)v1;
}

void sub_10002004C(id a1)
{
  size_t v3 = 37LL;
  if (!sysctlbyname("kern.bootsessionuuid", v4, &v3, 0LL, 0LL))
  {
    uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
    id v2 = (void *)qword_10005BB88;
    qword_10005BB88 = v1;
  }

void sub_100021110( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51)
{
}

void sub_100021184(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == a2)
  {
    id v3 = sub_1000233A4();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Tasking Changed";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
      goto LABEL_18;
    }

    goto LABEL_18;
  }

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) == a2)
  {
    id v6 = sub_1000233A4();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Telemetry Changed";
      goto LABEL_17;
    }

LABEL_18:
    goto LABEL_19;
  }

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) == a2)
  {
    id v7 = sub_1000233A4();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Profile List Changed";
      goto LABEL_17;
    }

    goto LABEL_18;
  }

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) != a2)
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) != a2) {
      goto LABEL_19;
    }
    id v10 = sub_1000233A4();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    id v5 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
    goto LABEL_17;
  }

  id v8 = sub_1000233A4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HTPrefs: EPL State Changed", buf, 2u);
  }

  +[HTTailspin resetLogCountsForEPL](&OBJC_CLASS___HTTailspin, "resetLogCountsForEPL");
LABEL_19:
  id v11 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unsigned int v13 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v14 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v14 hangtracerDaemonEnabled];

  if (v13 != (_DWORD)WeakRetained)
  {
    id v15 = sub_1000233A4();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      if (v13) {
        __int16 v17 = @"ON";
      }
      else {
        __int16 v17 = @"OFF";
      }
      id v18 = objc_loadWeakRetained(v11);
      else {
        int v19 = @"OFF";
      }
      *(_DWORD *)buf = 138412546;
      id v28 = v17;
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "HTPrefs: HangTracer Enabled State Changed: %@ -> %@",  buf,  0x16u);
    }

    id v20 = objc_loadWeakRetained(v11);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v20, "hangtracerDaemonEnabled", @"Enabled")));
    id v26 = v21;
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v24 = objc_loadWeakRetained(v11);
    [v23 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v24 userInfo:v22];
  }

  return 1;
}
}

void *sub_1000214F8(void *result, int a2)
{
  if (*(_DWORD *)(*(void *)(result[4] + 8LL) + 24LL) == a2)
  {
    id v2 = sub_1000233A4();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v4, 2u);
    }

    +[HTTailspin resetLogCountsForDailyRollover](&OBJC_CLASS___HTTailspin, "resetLogCountsForDailyRollover");
    +[HTTailspin resetDailySentryTailspinCounts](&OBJC_CLASS___HTTailspin, "resetDailySentryTailspinCounts");
    +[HTTailspin resetPerAppCounts](&OBJC_CLASS___HTTailspin, "resetPerAppCounts");
    return +[HTTailspin refreshPerPeriodSentryLogCount](&OBJC_CLASS___HTTailspin, "refreshPerPeriodSentryLogCount");
  }

  return result;
}

void *sub_100021594(void *result, int a2)
{
  if (*(_DWORD *)(*(void *)(result[5] + 8LL) + 24LL) == a2)
  {
    id v2 = result;
    id v3 = sub_1000233A4();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "HTPrefs: System Language Change Triggered Refresh",  v5,  2u);
    }

    sub_1000231C4();
    return [(id)v2[4] refreshHTPrefs];
  }

  return result;
}

void sub_10002161C(uint64_t a1)
{
  id v2 = sub_1000233A4();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "HTPrefs: Sentry Enablement Settings changed",  (uint8_t *)v11,  2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(v4 + 51);
  id v6 = (__CFString *)*(id *)(v4 + 368);
  id v7 = (void *)CFPreferencesCopyValue(@"allowSentryEnablement", v6, @"mobile", kCFPreferencesAnyHost);
  *(_BYTE *)(*(void *)(a1 + 32) + 5+[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1) = [v7 BOOLValue];
  id v8 = sub_1000233A4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 51LL);
    v11[0] = 67109376;
    v11[1] = v5;
    __int16 v12 = 1024;
    int v13 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "HTPrefs: Sentry Enablement Settings changed from %d -> %d",  (uint8_t *)v11,  0xEu);
  }
}

void sub_100021778(uint64_t a1)
{
  id v2 = sub_1000233A4();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "HTPrefs: Workflow Responsiveness Monitoring Enablement Settings changed",  (uint8_t *)v11,  2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(v4 + 52);
  id v6 = (__CFString *)*(id *)(v4 + 368);
  id v7 = (void *)CFPreferencesCopyValue( @"allowWorkflowResponsivenessEnablement",  v6,  @"mobile",  kCFPreferencesAnyHost);
  *(_BYTE *)(*(void *)(a1 + 32) + 52) = [v7 BOOLValue];
  id v8 = sub_1000233A4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 52LL);
    v11[0] = 67109376;
    v11[1] = v5;
    __int16 v12 = 1024;
    int v13 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "HTPrefs: Workflow Responsiveness Monitoring Enablement Settings changed from %d -> %d",  (uint8_t *)v11,  0xEu);
  }
}

void sub_1000222A4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_1000222B8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_1000222FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, double a7)
{
  if (qword_10005BBB8 != -1) {
    dispatch_once(&qword_10005BBB8, &stru_100049BA8);
  }
  id v14 = sub_1000233A4();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v20 = a1;
    __int16 v21 = 2048;
    uint64_t v22 = a3;
    __int16 v23 = 2048;
    uint64_t v24 = a4;
    __int16 v25 = 2048;
    double v26 = a7;
    __int16 v27 = 1024;
    int v28 = a6;
    __int16 v29 = 1024;
    BOOL v30 = a4 == 0x7FFFFFFFFFFFFFFFLL;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "sendHangToHUD: bundleID = %s, startTime=%llu, endTime=%llu, elapsedTimeMS=%f, timed out: %{BOOL}d (is over: %{BOOL}d)",  buf,  0x36u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100022488;
  v16[3] = &unk_100049AE8;
  *(double *)&v16[4] = a7;
  char v17 = a5;
  v16[5] = a1;
  v16[6] = a3;
  v16[7] = a4;
  v16[8] = a2;
  char v18 = a6;
  dispatch_async((dispatch_queue_t)qword_10005BB90, v16);
}

void sub_100022488(uint64_t a1)
{
  id v2 = (void *)(a1 + 32);
  double v3 = *(double *)(a1 + 32);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  double v5 = (double)[v4 hudThresholdMSec];

  if (v3 > v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(a1 + 40)));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@"."]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (char *)objc_msgSend(v7, "count") - 1));
    if ((sub_1000265D4() & 1) != 0)
    {
      id v9 = &stru_10004A8D0;
    }

    else
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.0f", *v2));
      if ((unint64_t)[v10 length] <= 3)
      {
        uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%*s%@",  4 - [v10 length],  "",  v10));

        int v10 = (void *)v11;
      }

      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "stringByPaddingToLength:withString:startingAtIndex:",  (int)(16 - objc_msgSend(v10, "length")),  @" ",  0));
      int v13 = v12;
      if (*(_BYTE *)(a1 + 72))
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "stringByReplacingCharactersInRange:withString:",  (char *)objc_msgSend(v12, "length") - 1,  1,  @"*"));

        int v13 = (void *)v14;
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"|"));
      double v16 = *(double *)v2 / 200.0;
      if (v16 > 100.0)
      {
        id v17 = sub_1000233A4();
        char v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          sub_10002D4CC((uint64_t *)(a1 + 32), v18, v16);
        }

        double v16 = 100.0;
      }

      int v19 = (int)v16;
      if ((int)v16 >= 1)
      {
        do
        {
          [v15 appendString:@"-"];
          --v19;
        }

        while (v19);
      }

      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ms%@",  v13,  v10,  v15));
    }

    uint64_t v20 = objc_alloc(&OBJC_CLASS___HTHangHUDInfo);
    LOBYTE(v27) = *(_BYTE *)(a1 + 73);
    __int16 v21 = -[HTHangHUDInfo initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:]( v20,  "initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:",  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  v9,  v8,  v6,  *(double *)(a1 + 32),  v27);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[HTHangHUDInfo getHangHUDInfoKey](v21, "getHangHUDInfoKey"));
    [(id)qword_10005BB98 setObject:v21 forKeyedSubscript:v22];
    dword_10005BBA0 = 0;
    id v23 = sub_1000233A4();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      __int16 v29 = v8;
      __int16 v30 = 2048;
      uint64_t v31 = v25;
      __int16 v32 = 2048;
      uint64_t v33 = v26;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "HTHUD: received updated hang info: bundle=%@, elapsedtime_ms=%f (so far), starttime_matu=%llu",  buf,  0x20u);
    }
  }

void sub_10002280C()
{
  if ((sub_100026710() & 1) == 0
    && sub_1000265D4()
    && (!qword_10005BBA8 || ([(id)qword_10005BBA8 isValid] & 1) == 0))
  {
    id v0 = sub_1000233A4();
    uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "Hud context is nil or no longer valid: re-creating",  v5,  2u);
    }

    [(id)qword_10005BBA8 invalidate];
    id v2 = objc_alloc(&OBJC_CLASS___HUDContext);
    double v3 = -[HUDContext initWithQueue:](v2, "initWithQueue:", qword_10005BB90);
    uint64_t v4 = (void *)qword_10005BBA8;
    qword_10005BBA8 = (uint64_t)v3;
  }

void sub_1000228C0()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v1 = [v0 shouldUpdateHangsHUD];

  if (v1)
  {
    if (qword_10005BBB8 != -1) {
      dispatch_once(&qword_10005BBB8, &stru_100049BA8);
    }
    dispatch_async((dispatch_queue_t)qword_10005BB90, &stru_100049B08);
  }

void sub_100022940(id a1)
{
  if ((sub_100026710() & 1) == 0 && sub_1000265D4() && byte_10005BBA4 == 1)
  {
    [(id)qword_10005BBA8 clearBundleNameCache];
    byte_10005BBA4 = 0;
  }

  if ([(id)qword_10005BB98 count])
  {
    uint64_t v1 = mach_absolute_time();
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BB98 allKeys]);
    id v3 = [v2 countByEnumeratingWithState:&v74 objects:v86 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v75;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v75 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)i);
          id v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BB98 objectForKeyedSubscript:v7]);
          id v9 = [v8 receivedTimestamp];

          int v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BB98 objectForKeyedSubscript:v7]);
          id v11 = [v10 hangEndTime];

          if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BB98 objectForKeyedSubscript:v7]);
            id v9 = [v12 hangEndTime];
          }

          double v13 = sub_100025798(v1 - (void)v9);
          if (v13 >= 5000.0)
          {
            double v14 = v13;
            else {
              unsigned int v15 = [(id)qword_10005BBA8 hangHasPendingAnimation:v7] ^ 1;
            }
            if ((sub_100026710() & 1) != 0 || (v15 | sub_1000265D4() ^ 1) == 1)
            {
              id v16 = sub_1000233A4();
              id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                ssize_t v64 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BB98 objectForKeyedSubscript:v7]);
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v64 shortenedBundle]);
                __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BB98 objectForKeyedSubscript:v7]);
                id v22 = [v21 hangStartTime];
                *(_DWORD *)buf = 138412802;
                int v81 = v20;
                __int16 v82 = 2048;
                id v83 = v22;
                __int16 v84 = 2048;
                double v85 = v14;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "HTHUD: hang removed from hud: bundle=%@, starttime_matu=%llu, age_ms=%f",  buf,  0x20u);
              }

              [(id)qword_10005BB98 removeObjectForKey:v7];
              dword_10005BBA0 = 0;
            }

            else
            {
              id v18 = sub_1000233A4();
              int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                int v81 = v7;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Not removing hang since an animation is in progress %@",  buf,  0xCu);
              }
            }
          }
        }

        id v4 = [v2 countByEnumeratingWithState:&v74 objects:v86 count:16];
      }

      while (v4);
    }

    if (sub_1000265D4())
    {
      int v23 = sub_100026710();
      sub_1000267A8(v23);
      if (v23)
      {
        id v24 = sub_1000233A4();
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_10002D55C(v25, v26, v27, v28, v29, v30, v31, v32);
        }

        uint64_t v33 = objc_alloc(&OBJC_CLASS___NSDictionary);
        id v34 = -[NSDictionary initWithDictionary:](v33, "initWithDictionary:", qword_10005BB98);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDClient sharedInstance](&OBJC_CLASS___HangHUDClient, "sharedInstance"));
        [v35 sendHangHUDInfo:v34 completion:&stru_100049B28];
      }

      else
      {
        [(id)qword_10005BBA8 updateHangs:qword_10005BB98 withCompletion:&stru_100049B48];
      }
    }

    else if (dword_10005BBA0 <= 2)
    {
      ++dword_10005BBA0;
      id v36 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BB98 allKeys]);
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 sortedArrayUsingSelector:"compare:"]);

      int v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      int v62 = v37;
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v37 reverseObjectEnumerator]);
      id v40 = [v39 countByEnumeratingWithState:&v70 objects:v79 count:16];
      if (v40)
      {
        id v41 = v40;
        int v42 = 0;
        uint64_t v43 = *(void *)v71;
        do
        {
          for (j = 0LL; j != v41; j = (char *)j + 1)
          {
            if (*(void *)v71 != v43) {
              objc_enumerationMutation(v39);
            }
            if (v42 <= 4)
            {
              -[NSMutableArray addObject:](v38, "addObject:", *(void *)(*((void *)&v70 + 1) + 8LL * (void)j));
              ++v42;
            }
          }

          id v41 = [v39 countByEnumeratingWithState:&v70 objects:v79 count:16];
        }

        while (v41);
      }

      int v45 = v38;
      if (byte_10005BBB0) {
        id v46 = @"\n\n";
      }
      else {
        id v46 = &stru_10004A8D0;
      }
      ssize_t v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      int v61 = v45;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      id obj = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v45, "sortedArrayUsingSelector:", "compare:"));
      id v47 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
      if (v47)
      {
        id v48 = v47;
        __int128 v49 = &ADClientAddValueForScalarKey_ptr;
        uint64_t v50 = *(void *)v67;
        do
        {
          for (k = 0LL; k != v48; k = (char *)k + 1)
          {
            if (*(void *)v67 != v50) {
              objc_enumerationMutation(obj);
            }
            uint64_t v52 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)k);
            if (-[__CFString length](v46, "length"))
            {
              int v53 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v46, "stringByAppendingString:", @"\n"));
            }

            else
            {
              int v53 = v46;
            }

            id v54 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BB98 objectForKeyedSubscript:v52]);
            uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v54 hudString]);
            unsigned int v56 = (void *)objc_claimAutoreleasedReturnValue([v49[94] stringWithUTF8String:">"]);
            double v57 = sub_100025798(v1 - (void)[v54 receivedTimestamp]);
            if ([v54 hangEndTime] != (id)0x7FFFFFFFFFFFFFFFLL || v57 > 50.0)
            {
              uint64_t v59 = objc_claimAutoreleasedReturnValue([v49[94] stringWithUTF8String:"|"]);

              unsigned int v56 = (void *)v59;
            }

            uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v55 stringByAppendingString:v56]);

            id v46 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v53, "stringByAppendingString:", v60));
            [v65 addObject:v54];

            __int128 v49 = &ADClientAddValueForScalarKey_ptr;
          }

          id v48 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
        }

        while (v48);
        id v46 = v46;
        id v47 = -[__CFString UTF8String](v46, "UTF8String");
      }

      sub_1000230EC((uint64_t)v47);
    }
  }

void sub_10002303C(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = sub_1000233A4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "sendHangData did not complete. Error: %@",  (uint8_t *)&v5,  0xCu);
    }
  }
}

void sub_1000230EC(uint64_t a1)
{
  mach_port_name_t ServerPort = CARenderServerGetServerPort(0LL);
  if (ServerPort)
  {
    mach_port_name_t v3 = ServerPort;
    if (!a1)
    {
      id v6 = sub_1000233A4();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_10002D58C(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }

    CARenderServerSetDebugMessage();
    mach_port_deallocate(mach_task_self_, v3);
  }

  else
  {
    id v4 = sub_1000233A4();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unable to get render server port!", v15, 2u);
    }
  }

void sub_1000231C4()
{
  if (qword_10005BB90) {
    dispatch_async((dispatch_queue_t)qword_10005BB90, &stru_100049B68);
  }
}

void sub_1000231E0(id a1)
{
  byte_10005BBA4 = 1;
}

void sub_1000231F0()
{
}

void sub_10002321C(id a1)
{
}

void sub_10002322C(id a1)
{
  id v1 = sub_1000233A4();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002D5BC(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
  uint64_t v11 = (void *)qword_10005BB98;
  qword_10005BB98 = (uint64_t)v10;

  dispatch_queue_t v12 = dispatch_queue_create("com.apple.hangtracer.hud_update_queue", 0LL);
  uint64_t v13 = (void *)qword_10005BB90;
  qword_10005BB90 = (uint64_t)v12;

  int v14 = MGGetBoolAnswer(@"8S7ydMJ4DlCUF38/hI/fJA");
  unsigned int v15 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
  id v16 = sub_1000233A4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18[0] = 67109634;
    v18[1] = v14;
    __int16 v19 = 2112;
    uint64_t v20 = v15;
    __int16 v21 = 1024;
    int v22 = byte_10005BBB0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "setupHangHUD: pearlDevice = %i and deviceClass = %@ => shouldLowerHUD = %i",  (uint8_t *)v18,  0x18u);
  }
}

id sub_1000233A4()
{
  if (qword_10005BBC8 != -1) {
    dispatch_once(&qword_10005BBC8, &stru_100049BC8);
  }
  return (id)qword_10005BBC0;
}

void sub_1000233E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "");
  id v2 = (void *)qword_10005BBC0;
  qword_10005BBC0 = (uint64_t)v1;
}

void sub_1000234F8(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___HUDAnimator);
  id v2 = (void *)qword_10005BBD0;
  qword_10005BBD0 = (uint64_t)v1;
}

void sub_100023634(uint64_t a1)
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___HUDAnimation);
  -[HUDAnimation setFromValue:](v3, "setFromValue:", *(double *)(a1 + 64));
  -[HUDAnimation setToValue:](v3, "setToValue:", *(double *)(a1 + 72));
  -[HUDAnimation setStartTime:](v3, "setStartTime:", CACurrentMediaTime());
  -[HUDAnimation startTime](v3, "startTime");
  -[HUDAnimation setEndTime:](v3, "setEndTime:", v2 + *(double *)(a1 + 80));
  -[HUDAnimation setUpdateBlock:](v3, "setUpdateBlock:", *(void *)(a1 + 48));
  -[HUDAnimation setCompletionBlock:](v3, "setCompletionBlock:", *(void *)(a1 + 56));
  -[HUDAnimation setIdentifier:](v3, "setIdentifier:", *(void *)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 8) addObject:v3];
}

void sub_100023770(uint64_t a1)
{
  double v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _DWORD v11[2] = sub_1000238E4;
  v11[3] = &unk_100049C38;
  id v12 = v2;
  id v4 = [v3 indexOfObjectPassingTest:v11];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:v4]);
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___HUDAnimation);
    double v8 = CACurrentMediaTime();
    objc_msgSend(v6, "valueAtTime:");
    -[HUDAnimation setFromValue:](v7, "setFromValue:");
    -[HUDAnimation setToValue:](v7, "setToValue:", *(double *)(a1 + 48));
    -[HUDAnimation setStartTime:](v7, "setStartTime:", v8);
    -[HUDAnimation setEndTime:](v7, "setEndTime:", v8 + *(double *)(a1 + 56));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 updateBlock]);
    -[HUDAnimation setUpdateBlock:](v7, "setUpdateBlock:", v9);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 completionBlock]);
    -[HUDAnimation setCompletionBlock:](v7, "setCompletionBlock:", v10);

    -[HUDAnimation setRetargeted:](v7, "setRetargeted:", 1LL);
    -[HUDAnimation setIdentifier:](v7, "setIdentifier:", *(void *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 8) replaceObjectAtIndex:v5 withObject:v7];
  }
}

id sub_1000238E4(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_1000239A0(uint64_t a1)
{
  double v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100023B0C;
  void v10[3] = &unk_100049C38;
  id v11 = v2;
  id v4 = [v3 indexOfObjectPassingTest:v10];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:v4]);
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___HUDAnimation);
    [v6 fromValue];
    -[HUDAnimation setFromValue:](v7, "setFromValue:");
    [v6 toValue];
    -[HUDAnimation setToValue:](v7, "setToValue:");
    [v6 startTime];
    -[HUDAnimation setStartTime:](v7, "setStartTime:");
    [v6 endTime];
    -[HUDAnimation setEndTime:](v7, "setEndTime:");
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 updateBlock]);
    -[HUDAnimation setUpdateBlock:](v7, "setUpdateBlock:", v8);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 completionBlock]);
    -[HUDAnimation setCompletionBlock:](v7, "setCompletionBlock:", v9);

    -[HUDAnimation setCanceled:](v7, "setCanceled:", 1LL);
    -[HUDAnimation setIdentifier:](v7, "setIdentifier:", *(void *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 8) replaceObjectAtIndex:v5 withObject:v7];
  }
}

id sub_100023B0C(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_100023BA4(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    if (!*(void *)(*(void *)(a1 + 32) + 24LL))
    {
      uint64_t v2 = objc_claimAutoreleasedReturnValue( +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:"));
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 24);
      *(void *)(v3 + 24) = v2;

      id v5 = objc_alloc(&OBJC_CLASS___NSThread);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100023C9C;
      v7[3] = &unk_100048EF8;
      v7[4] = *(void *)(a1 + 32);
      uint64_t v6 = -[NSThread initWithBlock:](v5, "initWithBlock:", v7);
      CAFrameRateRange v8 = CAFrameRateRangeMake(30.0, 30.0, 30.0);
      objc_msgSend( *(id *)(*(void *)(a1 + 32) + 24),  "setPreferredFrameRateRange:",  *(double *)&v8.minimum,  *(double *)&v8.maximum,  *(double *)&v8.preferred);
      -[NSThread setQualityOfService:](v6, "setQualityOfService:", 33LL);
      -[NSThread setName:](v6, "setName:", @"com.apple.hangtracerd.HUDAnimator");
      -[NSThread start](v6, "start");
    }
  }

void sub_100023C9C(uint64_t a1)
{
  os_log_t v1 = *(void **)(*(void *)(a1 + 32) + 24LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v1 addToRunLoop:v2 forMode:NSDefaultRunLoopMode];

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v3 run];
}

void sub_100023EA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t sub_100023ED4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100023EE4(uint64_t a1)
{
}

void sub_100023EEC(void *a1)
{
  id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) indexesOfObjectsPassingTest:&stru_100049CA0]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 8), "objectsAtIndexes:"));
  uint64_t v3 = *(void *)(a1[5] + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1[4] + 8LL);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _DWORD v11[2] = sub_100024024;
  v11[3] = &unk_100049CC0;
  void v11[4] = a1[8];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexesOfObjectsPassingTest:v11]);
  if ([v6 count])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) objectsAtIndexes:v6]);
    uint64_t v8 = *(void *)(a1[6] + 8LL);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(a1[4] + 8) removeObjectsAtIndexes:v6];
    if (![*(id *)(a1[4] + 8) count]) {
      *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
    }
  }
}

BOOL sub_100024008(id a1, HUDAnimation *a2, unint64_t a3, BOOL *a4)
{
  return !-[HUDAnimation canceled](a2, "canceled", a3, a4);
}

uint64_t sub_100024024(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 endTime];
  else {
    uint64_t v5 = (uint64_t)[v3 canceled];
  }

  return v5;
}

void sub_100024074(uint64_t a1)
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  id v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v8 = (void (**)(void))objc_claimAutoreleasedReturnValue([v7 updateBlock]);
        [v7 valueAtTime:*(double *)(a1 + 48)];
        v8[2](v8);
      }

      id v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v4);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)j);
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "completionBlock", (void)v17));

        if (v15)
        {
          id v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v14 completionBlock]);
          ((void (**)(void, void, id))v16)[2]( v16,  [v14 canceled] ^ 1,  objc_msgSend(v14, "retargeted"));
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v11);
  }
}

void sub_10002427C(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = 0LL;
  }

id sub_100024414()
{
  if (qword_10005BBE8 != -1) {
    dispatch_once(&qword_10005BBE8, &stru_100049D30);
  }
  return (id)qword_10005BBE0;
}

void sub_100024454(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HangHUD", "");
  uint64_t v2 = (void *)qword_10005BBE0;
  qword_10005BBE0 = (uint64_t)v1;
}

__CFString *sub_10002462C(unsigned int a1)
{
  if (a1 >= 0x2A) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_100049D50 + (char)a1);
  }
}

id sub_100024684(unsigned int a1)
{
  char v1 = a1 - 4;
  if (a1 - 4 < 0x26 && ((0x3789044BDDuLL >> v1) & 1) != 0)
  {
    id v4 = *(&off_100049EA0 + v1);
  }

  else
  {
    uint64_t v2 = sub_10002462C(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

__CFString *sub_1000246F0(uint64_t a1)
{
  if ((a1 - 1) >= 0x1F) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SIG%d",  a1));
  }
  else {
    return *(&off_100049FD0 + (int)a1 - 1);
  }
}

__CFString *sub_100024744(uint64_t a1)
{
  if (a1 >= 0x10) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_10004A0C8 + (int)a1);
  }
}

id sub_100024794(uint64_t a1)
{
  int v1 = a1 - 2;
  if ((a1 - 2) < 0xE && ((0x2655u >> v1) & 1) != 0)
  {
    id v4 = *(&off_10004A148 + v1);
  }

  else
  {
    uint64_t v2 = sub_100024744(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

__CFString *sub_1000247F4(uint64_t a1)
{
  if (a1 > 3221229822LL)
  {
    if (a1 <= 3306925314LL)
    {
      switch(a1)
      {
        case 3221229823LL:
          return @"thermal pressure";
        case 3306925313LL:
          return @"cpu violation";
        case 3306925314LL:
          return @"walltime violation";
      }
    }

    else if (a1 > 3735943696LL)
    {
      if (a1 == 3735943697LL) {
        return @"user quit";
      }
      if (a1 == 4227595259LL) {
        return @"force quit";
      }
    }

    else
    {
      if (a1 == 3306925315LL) {
        return @"system busy";
      }
      if (a1 == 3735883980LL) {
        return @"resource exclusion";
      }
    }

    goto LABEL_36;
  }

  if (a1 <= 1539435072)
  {
    switch(a1)
    {
      case 95805101LL:
        return @"application assertion";
      case 439025681LL:
        return @"input ui scene";
      case 732775916LL:
        return @"secure draw violation";
    }

    goto LABEL_36;
  }

  if (a1 > 1539435076)
  {
    if (a1 == 1539435077) {
      return @"legacy clear the board";
    }
    if (a1 == 2343432205LL) {
      return @"watchdog";
    }
    goto LABEL_36;
  }

  if (a1 == 1539435073) {
    return @"languages changed";
  }
  if (a1 != 1539435076)
  {
LABEL_36:
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%#llx", a1));
    return v1;
  }

  int v1 = @"clear the board";
  return v1;
}

__CFString *sub_100024A00(uint64_t a1)
{
  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
    {
      int v1 = @"Legacy Clear the Board";
      return v1;
    }

    if (a1 == 3306925313LL)
    {
      int v1 = @"CPU Violation";
      return v1;
    }

__CFString *sub_100024AB8(uint64_t a1)
{
  if ((a1 - 1) >= 4) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_10004A1B8 + (int)a1 - 1);
  }
}

id sub_100024B0C(uint64_t a1)
{
  int v1 = sub_100024AB8(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 capitalizedString]);

  return v3;
}

__CFString *sub_100024B44(uint64_t a1)
{
  if ((a1 - 1) >= 0x13) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_10004A1D8 + (int)a1 - 1);
  }
}

id sub_100024B98(uint64_t a1)
{
  int v1 = a1 - 1;
  if ((a1 - 1) < 0x13 && ((0x55F7Fu >> v1) & 1) != 0)
  {
    id v4 = *(&off_10004A270 + v1);
  }

  else
  {
    uint64_t v2 = sub_100024B44(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

__CFString *sub_100024BFC(uint64_t a1)
{
  if ((a1 - 1) >= 5) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_10004A308 + (int)a1 - 1);
  }
}

__CFString *sub_100024C50(uint64_t a1)
{
  if ((_DWORD)a1 == 5)
  {
    int v1 = @"JIT";
  }

  else
  {
    uint64_t v2 = sub_100024BFC(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v1;
}

__CFString *sub_100024C9C(uint64_t a1)
{
  if ((a1 - 1) >= 9) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  a1));
  }
  else {
    return *(&off_10004A330 + (int)a1 - 1);
  }
}

__CFString *sub_100024CF0(uint64_t a1)
{
  switch((_DWORD)a1)
  {
    case 2:
      int v1 = @"Unknown IPC";
      break;
    case 6:
      int v1 = @"Sandbox Filtered IPC";
      break;
    case 4:
      int v1 = @"SIGTERM Timeout";
      break;
    default:
      uint64_t v2 = sub_100024C9C(a1);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      int v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);

      break;
  }

  return v1;
}

id sub_100024D64(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  else {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
  }
  return v2;
}

id sub_100024DC4(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 7 && ((0x47u >> v1) & 1) != 0)
  {
    id v4 = *(&off_10004A3C0 + v1);
  }

  else
  {
    id v2 = sub_100024D64(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

__CFString *sub_100024E24(uint64_t a1)
{
  if (a1 <= 2343432204LL)
  {
    if (a1 <= 562215633)
    {
      if (a1)
      {
        if (a1 == 97132013)
        {
          return @"conditions changed";
        }

        else
        {
          if (a1 != 562215597) {
            goto LABEL_37;
          }
          return @"assertion timeout";
        }
      }

      else
      {
        return @"none";
      }
    }

    else if (a1 > 562215635)
    {
      if (a1 == 562215636)
      {
        return @"background fetch completion timeout";
      }

      else
      {
        if (a1 != 732775916) {
          goto LABEL_37;
        }
        return @"security violation";
      }
    }

    else if (a1 == 562215634)
    {
      return @"background task assertion timeout";
    }

    else
    {
      return @"background url session completion timeout";
    }
  }

  else if (a1 > 3490524076LL)
  {
    if (a1 > 3735905537LL)
    {
      if (a1 == 3735905538LL)
      {
        return @"termination assertion";
      }

      else
      {
        if (a1 != 3735943697LL) {
          goto LABEL_37;
        }
        return @"user initiated quit";
      }
    }

    else if (a1 == 3490524077LL)
    {
      return @"max assertions violation";
    }

    else
    {
      if (a1 != 3735883980LL) {
        goto LABEL_37;
      }
      return @"resource exclusion";
    }
  }

  else if (a1 > 2970726672LL)
  {
    if (a1 == 2970726673LL)
    {
      return @"process exited";
    }

    else
    {
      if (a1 != 3221229823LL) {
        goto LABEL_37;
      }
      return @"thermal pressure";
    }
  }

  else
  {
    if (a1 != 2343432205LL)
    {
      if (a1 == 2970405393LL)
      {
        uint64_t v1 = @"max states violation";
        return v1;
      }

LABEL_37:
      uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%#llx",  a1));
      return v1;
    }

    return @"watchdog violation";
  }

__CFString *sub_100025054(uint64_t a1)
{
  if (a1 <= 2970405392LL)
  {
    if (!a1)
    {
      uint64_t v1 = @"None Provided";
      return v1;
    }

    if (a1 == 562215635)
    {
      uint64_t v1 = @"Background URL Session Completion Timeout";
      return v1;
    }

__CFString *sub_10002511C(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 5) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  a1));
  }
  else {
    return *(&off_10004A3F8 + a1 - 1);
  }
}

id sub_100025170(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 5 && ((0x1Du >> v1) & 1) != 0)
  {
    id v4 = *(&off_10004A420 + v1);
  }

  else
  {
    id v2 = sub_10002511C(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

__CFString *sub_1000251D0(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  a1));
  }
  else {
    return *(&off_10004A448 + a1 - 1);
  }
}

id sub_100025224(uint64_t a1)
{
  uint64_t v1 = sub_1000251D0(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 capitalizedString]);

  return v3;
}

__CFString *sub_10002525C(uint64_t a1)
{
  switch(a1)
  {
    case 1LL:
      return @"service timeout";
    case 1001LL:
      return @"chronokit";
    case 2LL:
      uint64_t v1 = @"timeout no diags";
      break;
    default:
      uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
      break;
  }

  return v1;
}

__CFString *sub_1000252D0(uint64_t a1)
{
  if (a1 == 2)
  {
    uint64_t v1 = @"Service Timeout Diagnostics Unavailable";
  }

  else if (a1 == 1001)
  {
    uint64_t v1 = @"ChronoKit";
  }

  else
  {
    id v2 = sub_10002525C(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v1;
}

__CFString *sub_100025330(uint64_t a1)
{
  if (a1 == 1) {
    return @"api violation";
  }
  if (a1 == 2) {
    uint64_t v1 = @"internal error";
  }
  else {
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
  }
  return v1;
}

__CFString *sub_100025390(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v1 = @"API Violation";
  }

  else
  {
    id v2 = sub_100025330(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v1;
}

id sub_1000253DC(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  else {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
  }
  return v2;
}

id sub_100025440(uint64_t a1)
{
  uint64_t v1 = a1 - 11;
  if ((unint64_t)(a1 - 11) < 0xB && ((0x60Fu >> v1) & 1) != 0)
  {
    id v4 = *(&off_10004A508 + v1);
  }

  else
  {
    id v2 = sub_1000253DC(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

id sub_1000254A0(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      id v2 = sub_100024744(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      break;
    case 2:
      id v4 = sub_1000246F0(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
      break;
    case 3:
      uint64_t v5 = sub_100024AB8(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
      break;
    case 6:
      id v6 = sub_100024D64(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v6);
      break;
    case 7:
      uint64_t v7 = sub_100024C9C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      break;
    case 9:
      uint64_t v8 = sub_100024B44(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
      break;
    case 10:
      id v9 = sub_1000247F4(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
      break;
    case 15:
      id v10 = sub_100024E24(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      break;
    case 18:
      id v11 = sub_100025170(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v11);
      break;
    case 20:
      uint64_t v12 = sub_10002525C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      break;
    case 22:
      uint64_t v13 = sub_100025330(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v13);
      break;
    case 23:
      int v14 = sub_100024BFC(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v14);
      break;
    case 27:
      unsigned int v15 = sub_1000251D0(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v15);
      break;
    case 32:
      id v16 = sub_1000253DC(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v16);
      break;
    default:
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a2));
      break;
  }

  return v3;
}

id sub_1000255D8(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      id v2 = sub_100024794(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      break;
    case 2:
      id v4 = sub_1000246F0(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
      break;
    case 3:
      id v5 = sub_100024B0C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
      break;
    case 6:
      id v6 = sub_100024DC4(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v6);
      break;
    case 7:
      uint64_t v7 = sub_100024CF0(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      break;
    case 9:
      id v8 = sub_100024B98(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
      break;
    case 10:
      id v9 = sub_100024A00(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
      break;
    case 15:
      id v10 = sub_100025054(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      break;
    case 18:
      id v11 = sub_100025170(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v11);
      break;
    case 20:
      uint64_t v12 = sub_1000252D0(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      break;
    case 22:
      uint64_t v13 = sub_100025390(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v13);
      break;
    case 23:
      int v14 = sub_100024C50(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v14);
      break;
    case 27:
      id v15 = sub_100025224(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v15);
      break;
    case 32:
      id v16 = sub_100025440(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v16);
      break;
    default:
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%#llx", a2));
      break;
  }

  return v3;
}

double sub_100025710()
{
  if (qword_10005BBF8 != -1) {
    dispatch_once(&qword_10005BBF8, &stru_10004A560);
  }
  return *(double *)&qword_10005BBF0;
}

void sub_100025750(id a1)
{
  *(double *)&qword_10005BBF0 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

double sub_100025798(unint64_t a1)
{
  if (qword_10005BBF8 != -1) {
    dispatch_once(&qword_10005BBF8, &stru_10004A560);
  }
  return *(double *)&qword_10005BBF0 * (double)a1;
}

double sub_1000257EC(unint64_t a1)
{
  if (qword_10005BBF8 != -1) {
    dispatch_once(&qword_10005BBF8, &stru_10004A560);
  }
  return *(double *)&qword_10005BBF0 * (double)a1 / 1000.0;
}

double sub_10002584C(unint64_t a1)
{
  if (qword_10005BBF8 != -1) {
    dispatch_once(&qword_10005BBF8, &stru_10004A560);
  }
  return (double)a1 / *(double *)&qword_10005BBF0;
}

void sub_1000258AC(id a1)
{
  byte_10005BC08 = MGGetBoolAnswer(@"8S7ydMJ4DlCUF38/hI/fJA");
}

void sub_1000258D0(id a1)
{
  byte_10005BC18 = MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 3;
}

void sub_100025900(id a1)
{
  byte_10005BC28 = MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 6;
}

void sub_100025930(id a1)
{
  byte_10005BC38 = MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 4;
}

void sub_100025960(id a1)
{
  byte_10005BC48 = MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 11;
}

double sub_100025990()
{
  if (qword_10005BC30 != -1) {
    dispatch_once(&qword_10005BC30, &stru_10004A5E0);
  }
  if (byte_10005BC38)
  {
    id v0 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    [v0 bounds];
    if (v1 <= 1920.0) {
      double v2 = 28.0;
    }
    else {
      double v2 = 42.0;
    }
  }

  else
  {
    if (qword_10005BC20 != -1) {
      dispatch_once(&qword_10005BC20, &stru_10004A5C0);
    }
    if (byte_10005BC28)
    {
      double v3 = sub_100025AD4();
      if (v3 > 170.0 || v3 < 1.0) {
        return 24.0;
      }
      else {
        return 22.0;
      }
    }

    else
    {
      if (qword_10005BC40 != -1) {
        dispatch_once(&qword_10005BC40, &stru_10004A600);
      }
      double v2 = 22.0;
      if (!byte_10005BC48)
      {
        if (-[HUDLine contentScaleForTexts]_0() == 3.0) {
          return 40.0;
        }
        else {
          return 28.0;
        }
      }
    }
  }

  return v2;
}

double sub_100025AD4()
{
  double result = *(double *)&qword_10005BC70;
  if (*(double *)&qword_10005BC70 <= 0.0)
  {
    if (qword_10005BC30 != -1) {
      dispatch_once(&qword_10005BC30, &stru_10004A5E0);
    }
    int v1 = byte_10005BC38;
    double v2 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    [v2 bounds];
    double v4 = fmax(v3, 1920.0);
    if (!v1) {
      double v4 = v3;
    }
    qword_10005BC70 = *(void *)&v4;

    double result = *(double *)&qword_10005BC70 / -[HUDLine contentScaleForTexts]_0();
    qword_10005BC70 = *(void *)&result;
  }

  return result;
}

void sub_100025C2C()
{
  if (*(double *)&qword_10005BC50 <= 0.0)
  {
    double v0 = sub_100025990();
    *(double *)&qword_10005BC50 = v0 / -[HUDLine contentScaleForTexts]_0();
  }

double sub_100025C70()
{
  double v0 = *(double *)&qword_10005BC58;
  int v1 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  double v2 = (void *)objc_claimAutoreleasedReturnValue([v1 currentOrientation]);

  if (qword_10005BC20 != -1) {
    dispatch_once(&qword_10005BC20, &stru_10004A5C0);
  }
  double v3 = 20.0;
  if (!byte_10005BC28)
  {
    if (qword_10005BC10 != -1) {
      dispatch_once(&qword_10005BC10, &stru_10004A5A0);
    }
    double v3 = 50.0;
    if (!byte_10005BC18
      && v2 != (void *)kCADisplayOrientationRotation270
      && v2 != (void *)kCADisplayOrientationRotation90)
    {
      if (qword_10005BC00 != -1) {
        dispatch_once(&qword_10005BC00, &stru_10004A580);
      }
      if (byte_10005BC08)
      {
        if (-[HUDLine contentScaleForTexts]_0() == 2.0)
        {
          double v3 = 100.0;
          goto LABEL_5;
        }

        if (qword_10005BC00 != -1) {
          dispatch_once(&qword_10005BC00, &stru_10004A580);
        }
      }

      if (byte_10005BC08 && -[HUDLine contentScaleForTexts]_0() == 3.0)
      {
        double v3 = 150.0;
      }

      else
      {
        if (qword_10005BC30 != -1) {
          dispatch_once(&qword_10005BC30, &stru_10004A5E0);
        }
        int v7 = byte_10005BC38;
        double v8 = -[HUDLine contentScaleForTexts]_0();
        if (v7) {
          double v3 = dbl_100034B90[v8 > 1.0];
        }
        else {
          double v3 = v8 * 25.0;
        }
      }
    }
  }

LABEL_5:
  qword_10005BC58 = *(void *)&v3;
  *(double *)&qword_10005BC58 = v3 / -[HUDLine contentScaleForTexts]_0();
  id v4 = sub_1000233A4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002D5EC((uint64_t)v2, v5);
  }

  double v0 = *(double *)&qword_10005BC58;
  return v0;
}

void sub_100025EAC()
{
  if (*(double *)&qword_10005BC60 <= 0.0)
  {
    if (qword_10005BC00 != -1) {
      dispatch_once(&qword_10005BC00, &stru_10004A580);
    }
    double v0 = 25.0;
    if (!byte_10005BC08) {
      double v0 = sub_100025C70();
    }
    qword_10005BC60 = *(void *)&v0;
  }

double sub_100025F14()
{
  double result = *(double *)&qword_10005BC68;
  if (*(double *)&qword_10005BC68 <= 0.0)
  {
    if (qword_10005BC20 != -1) {
      dispatch_once(&qword_10005BC20, &stru_10004A5C0);
    }
    double v1 = 5.0;
    if (!byte_10005BC28)
    {
      double v2 = -[HUDLine contentScaleForTexts]_0();
      if (qword_10005BC10 != -1)
      {
        double v4 = v2;
        dispatch_once(&qword_10005BC10, &stru_10004A5A0);
        double v2 = v4;
      }

      double v3 = 10.0;
      if (!byte_10005BC18) {
        double v3 = 8.0;
      }
      double v1 = v2 * v3;
    }

    qword_10005BC68 = *(void *)&v1;
    double result = v1 / -[HUDLine contentScaleForTexts]_0();
    qword_10005BC68 = *(void *)&result;
  }

  return result;
}

double sub_100025FE0()
{
  double result = *(double *)&qword_10005BC78;
  if (*(double *)&qword_10005BC78 <= 0.0)
  {
    if (qword_10005BC30 != -1) {
      dispatch_once(&qword_10005BC30, &stru_10004A5E0);
    }
    int v1 = byte_10005BC38;
    double v2 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    [v2 bounds];
    double v4 = fmax(v3, 1080.0);
    if (!v1) {
      double v4 = v3;
    }
    qword_10005BC78 = *(void *)&v4;

    double result = *(double *)&qword_10005BC78 / -[HUDLine contentScaleForTexts]_0();
    qword_10005BC78 = *(void *)&result;
  }

  return result;
}

void sub_100026084()
{
  if (*(double *)&qword_10005BC88 <= 0.0)
  {
    double v0 = sub_100025AD4();
    double v1 = fmin(v0, sub_100025FE0());
    sub_100025EAC();
    *(double *)&qword_10005BC88 = v1 + v2 * -2.0;
  }

double sub_1000260D4()
{
  if (qword_10005BC90 != -1) {
    dispatch_once(&qword_10005BC90, &stru_10004A620);
  }
  return *(double *)&qword_10005BC98;
}

void sub_100026114(id a1)
{
  if (qword_10005BC20 != -1) {
    dispatch_once(&qword_10005BC20, &stru_10004A5C0);
  }
  double v1 = 2.0;
  if (!byte_10005BC28) {
    double v1 = 20.0;
  }
  qword_10005BC98 = *(void *)&v1;
  *(double *)&qword_10005BC98 = v1 / -[HUDLine contentScaleForTexts]_0();
}

double sub_100026184()
{
  if (qword_10005BCA0 != -1) {
    dispatch_once(&qword_10005BCA0, &stru_10004A640);
  }
  return *(double *)&qword_10005BCA8;
}

void sub_1000261C4(id a1)
{
  if (qword_10005BC20 != -1) {
    dispatch_once(&qword_10005BC20, &stru_10004A5C0);
  }
  double v1 = 2.0;
  if (!byte_10005BC28) {
    double v1 = 20.0;
  }
  qword_10005BCA8 = *(void *)&v1;
  *(double *)&qword_10005BCA8 = v1 / -[HUDLine contentScaleForTexts]_0();
}

void sub_100026234()
{
  qword_10005BC58 = 0LL;
  qword_10005BC60 = 0LL;
  qword_10005BC88 = 0LL;
}

void sub_100026250()
{
  qword_10005BC50 = 0LL;
  qword_10005BC58 = 0LL;
  qword_10005BC60 = 0LL;
  qword_10005BC68 = 0LL;
  qword_10005BC70 = 0LL;
  qword_10005BC78 = 0LL;
  qword_10005BC80 = 0LL;
  qword_10005BC88 = 0LL;
}

uint64_t sub_100026294(void *a1, uint64_t a2, double a3)
{
  id v5 = a1;
  double v6 = sub_100025798(a2 - (void)[v5 receivedTimestamp]);
  id v7 = sub_1000233A4();
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    double v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "durationSinceLastUpdateMs: %f",  (uint8_t *)&v12,  0xCu);
  }

  if ([v5 hangEndTime] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 <= a3)
    {
      uint64_t v9 = 1LL;
      goto LABEL_9;
    }

id sub_1000263BC(void *a1, unsigned int a2)
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue([a1 keysSortedByValueWithOptions:0 usingComparator:&stru_10004A680]);
  double v4 = 0LL;
  id v5 = [v3 count];
  else {
    unint64_t v6 = (unint64_t)v5;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subarrayWithRange:", v4, v6));

  return v7;
}

int64_t sub_100026444(id a1, HTHangHUDInfo *a2, HTHangHUDInfo *a3)
{
  double v4 = a2;
  id v5 = a3;
  id v6 = -[HTHangHUDInfo hangStartTime](v4, "hangStartTime");
  if (v6 == (id)-[HTHangHUDInfo hangStartTime](v5, "hangStartTime"))
  {
    int64_t v7 = 0LL;
  }

  else
  {
    id v8 = -[HTHangHUDInfo hangStartTime](v4, "hangStartTime");
    if (v8 > (id)-[HTHangHUDInfo hangStartTime](v5, "hangStartTime")) {
      int64_t v7 = 1LL;
    }
    else {
      int64_t v7 = -1LL;
    }
  }

  return v7;
}

NSArray *sub_1000264C8(void *a1, unsigned int a2)
{
  id v3 = a1;
  if ([v3 count])
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keysSortedByValueUsingComparator:&stru_10004A6C0]);
    unint64_t v5 = a2;
    else {
      id v6 = 0LL;
    }
    id v8 = [v4 count];
    else {
      id v9 = v8;
    }
    int64_t v7 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", v6, v9));
  }

  else
  {
    int64_t v7 = objc_alloc_init(&OBJC_CLASS___NSArray);
  }

  return v7;
}

int64_t sub_10002657C(id a1, HUDContentProtocol *a2, HUDContentProtocol *a3)
{
  double v4 = a3;
  id v5 = -[HUDContentProtocol compareValue](a2, "compareValue");
  id v6 = -[HUDContentProtocol compareValue](v4, "compareValue");

  int64_t v7 = 1LL;
  if (v5 <= v6) {
    int64_t v7 = -1LL;
  }
  if (v5 == v6) {
    return 0LL;
  }
  else {
    return v7;
  }
}

uint64_t sub_1000265D4()
{
  if (qword_10005BCB0 != -1) {
    dispatch_once(&qword_10005BCB0, &stru_10004A6E0);
  }
  return byte_10005BCB8;
}

void sub_100026614(id a1)
{
  byte_10005BCB8 = _os_feature_enabled_impl("HangTracer", "useCustomHUD");
}

uint64_t sub_100026640(void *a1, _BYTE *a2)
{
  id v3 = a1;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 persistentDomainForName:@"com.apple.HangHUD"]);
  id v6 = v5;
  if (v5)
  {
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v3]);
    if (v7 && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    {
      *a2 = [v7 isEqualToString:@"YES"];
      uint64_t v9 = 1LL;
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

uint64_t sub_100026710()
{
  double v0 = &v2;
  if ((sub_100026640(@"UseHangHUD", &v2) & 1) == 0)
  {
    if (qword_10005BCC0 != -1) {
      dispatch_once(&qword_10005BCC0, &stru_10004A700);
    }
    double v0 = &byte_10005BCC8;
  }

  return *v0;
}

void sub_10002677C(id a1)
{
  byte_10005BCC8 = _os_feature_enabled_impl("HangTracer", "useHangHUD");
}

void sub_1000267A8(int a1)
{
  char v1 = a1;
  if (byte_10005B188 != a1)
  {
    id v2 = sub_1000233A4();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if ((v1 & 1) != 0)
    {
      if (v4)
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "  =>  clearing HUD context on hangtracerd when enabling HangHUD",  v6,  2u);
      }

      sub_1000231F0();
    }

    else
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "  =>  clear HUD context on angle server when disabling HangHUD",  buf,  2u);
      }

      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDClient sharedInstance](&OBJC_CLASS___HangHUDClient, "sharedInstance"));
      [v5 clearHUDWithCompletion:&stru_10004A720];
    }
  }

  byte_10005B188 = v1;
}

void sub_10002688C(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = sub_1000233A4();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "clearHUDWithCompletionHandler did not complete. Error: %@",  (uint8_t *)&v5,  0xCu);
    }
  }
}

uint64_t sub_100026938()
{
  double v0 = (void *)CFPreferencesCopyValue( @"EnhancedBackgroundContrastEnabled",  @"com.apple.Accessibility",  @"mobile",  kCFPreferencesAnyHost);
  uint64_t v1 = [v0 BOOLValue] ^ 1;

  return v1;
}

BOOL sub_100026990()
{
  if (qword_10005BD18 != -1) {
    dispatch_once(&qword_10005BD18, &stru_10004A740);
  }
  return off_10005BCD0 != 0LL;
}

uint64_t sub_1000269D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v16 = objc_autoreleasePoolPush();
  if (qword_10005BD18 != -1) {
    dispatch_once(&qword_10005BD18, &stru_10004A740);
  }
  if (off_10005BCD0)
  {
    v23[0] = qword_10005BCD8;
    v23[1] = qword_10005BCE0;
    v24[0] = &__kCFBooleanTrue;
    v24[1] = a4;
    v23[2] = qword_10005BCE8;
    v24[2] = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a2);
    v23[3] = qword_10005BCF0;
    v24[3] = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3);
    v23[4] = qword_10005BCF8;
    v24[4] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a6);
    v23[5] = qword_10005BD00;
    v24[5] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a7);
    v23[6] = qword_10005BD08;
    v24[6] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a8);
    __int128 v17 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  7LL));
    if ((_DWORD)a5)
    {
      __int128 v18 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a5);
      -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v18, qword_10005BD10);
    }

    uint64_t v19 = off_10005BCD0(a1, v17);
  }

  else
  {
    __int128 v20 = (os_log_s *)sub_1000233A4();
    uint64_t v19 = 0LL;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Tailspin dump symbol is missing!", v22, 2u);
      uint64_t v19 = 0LL;
    }
  }

  objc_autoreleasePoolPop(v16);
  return v19;
}

void sub_100026C10(id a1)
{
  uint64_t v1 = dlopen("/usr/lib/libtailspin.dylib", 1);
  qword_10005BD20 = (uint64_t)v1;
  if (v1)
  {
    off_10005BCD0 = dlsym(v1, "tailspin_dump_output_with_options_sync");
    qword_10005BCE0 = *(void *)dlsym((void *)qword_10005BD20, "TSPDumpOptions_ReasonString");
    qword_10005BCD8 = *(void *)dlsym((void *)qword_10005BD20, "TSPDumpOptions_NoSymbolicate");
    qword_10005BCE8 = *(void *)dlsym((void *)qword_10005BD20, "TSPDumpOptions_MinTimestamp");
    qword_10005BCF0 = *(void *)dlsym((void *)qword_10005BD20, "TSPDumpOptions_MaxTimestamp");
    qword_10005BD10 = *(void *)dlsym((void *)qword_10005BD20, "TSPDumpOptions_TargetPID");
    qword_10005BCF8 = *(void *)dlsym((void *)qword_10005BD20, "TSPDumpOptions_CollectOsSignposts");
    qword_10005BD00 = *(void *)dlsym((void *)qword_10005BD20, "TSPDumpOptions_CollectTrials");
    qword_10005BD08 = *(void *)dlsym((void *)qword_10005BD20, "TSPDumpOptions_ScrubOutput");
  }

  else
  {
    id v2 = (os_log_s *)sub_1000233A4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "libtailspin.dylib is not present.", v3, 2u);
    }
  }

uint64_t sub_100026D80(unint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = 0LL;
  unint64_t v54 = 0LL;
  int v8 = 0;
  unint64_t v51 = a2 - a1;
  uint64_t v53 = a3 + 32;
  do
  {
    if (*(void *)(a3 + v7))
    {
      ++v8;
      uint64_t v9 = a3 + v7;
      unint64_t v10 = *(void *)(a3 + v7 + 24);
      if (v10 >= *(void *)(a3 + v7 + 16)) {
        unint64_t v10 = *(void *)(a3 + v7 + 16);
      }
      unint64_t v11 = *(void *)(a3 + v7 + 8) <= a1 ? a1 : *(void *)(a3 + v7 + 8);
      unint64_t v12 = v10 >= a2 ? a2 : v10;
      if (v12 > v11)
      {
        id v13 = sub_1000233A4();
        int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          double v15 = *(double *)(a3 + v7);
          double v16 = *(double *)(v9 + 8);
          uint64_t v17 = *(void *)(v9 + 24);
          *(_DWORD *)buf = 134219266;
          double v60 = v15;
          __int16 v61 = 2080;
          *(void *)&double v62 = v53 + v7;
          __int16 v63 = 2048;
          double v64 = v16;
          __int16 v65 = 2048;
          uint64_t v66 = v17;
          __int16 v67 = 2048;
          unint64_t v68 = a1;
          __int16 v69 = 2048;
          unint64_t v70 = a2;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "HTAssertion: checkOverlap: hang overlaps with assertion, assertionid=%llu assertionname=(%s) start=%llu end= %llu, hangstart=%llu, hangend=%llu)",  buf,  0x3Eu);
        }

        if (*(_BYTE *)(a3 + v7 + 96))
        {
          if (*(void *)(v9 + 24) < a2)
          {
            id v18 = sub_1000233A4();
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              __int128 v20 = v19;
              __int128 v21 = "HTAssertion: checkOverlap: not ignoring hang during screen turning on";
LABEL_21:
              uint32_t v23 = 2;
LABEL_22:
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, buf, v23);
              goto LABEL_23;
            }

            goto LABEL_23;
          }

          if (*(void *)(v9 + 8) > a1)
          {
            id v22 = sub_1000233A4();
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              __int128 v20 = v19;
              __int128 v21 = "HTAssertion: checkOverlap: not ignoring hang during screen turning off";
              goto LABEL_21;
            }

LABEL_30:
    v7 += 104LL;
  }

  while (v7 != 1040);
  if (!v8)
  {
    id v33 = sub_1000233A4();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      sub_10002D6A0(v34, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_48;
  }

  double v28 = sub_100025798(v54);
  double v29 = sub_100025798(v51) - v28;
  if (v29 >= 250.0)
  {
    id v42 = sub_1000233A4();
    uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    id v34 = v43;
    if (v54)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v60 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "HTAssertion: checkOverlap: hang partially overlaps assertions, since hangDurationWithoutOverlap=%fms does not qualify as assertion overlap",  buf,  0xCu);
      }
    }

    else if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      sub_10002D6D4(v34, v44, v45, v46, v47, v48, v49, v50);
    }

LABEL_48:
    return 0LL;
  }

  id v30 = sub_1000233A4();
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    double v60 = v28;
    __int16 v61 = 2048;
    double v62 = (double)v54 * 100.0 / (double)v51;
    __int16 v63 = 2048;
    double v64 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "HTAssertion: checkOverlap: hang overlaps assertion for %f ms (%f %%), hangDurationWithoutOverlap=%fms -> qualifies as assertion overlap",  buf,  0x20u);
  }

  if (a4)
  {
    j__ADClientPushValueForDistributionKey(@"com.apple.ht_assertion_stats.hang_overlap_ms", v28);
    j__ADClientPushValueForDistributionKey( @"com.apple.ht_assertion_stats.hang_overlap_percent",  (double)v54 * 100.0 / (double)v51);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    void v55[2] = sub_100027344;
    v55[3] = &unk_10004A780;
    *(double *)&v55[4] = v28;
    *(double *)&v55[5] = (double)v54 * 100.0 / (double)v51;
    AnalyticsSendEventLazy(@"com.apple.hangtracer.assertion_overlap", v55);
  }

  return 1LL;
}

id sub_100027270(void *a1)
{
  v6[0] = @"assertionOverlapMs";
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a1[4] - a1[5]));
  v6[1] = @"assertionOverlapName";
  v7[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1[6]));
  v7[1] = v3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

id sub_100027344(uint64_t a1)
{
  v6[0] = @"hangDurationOverlapMs";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 32)));
  v6[1] = @"hangDurationOverlapPercent";
  v7[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  v7[1] = v3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

LABEL_13:
      uint64_t v9 = 0LL;
      goto LABEL_14;
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100027590;
    block[3] = &unk_100048EF8;
    id v13 = v3;
    if (qword_10005BD30 != -1) {
      dispatch_once(&qword_10005BD30, block);
    }

    int v5 = (void *)qword_10005BD28;
  }

  uint64_t v9 = v5;
LABEL_14:

  return v9;
}

void sub_100027590(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___HTUserNotificationHelper);
  id v3 = (void *)qword_10005BD28;
  qword_10005BD28 = (uint64_t)v2;

  if (v2)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.hangtracerd.notification-queue", 0LL);
    [(id)qword_10005BD28 setNotificationQueue:v4];

    int v5 = objc_alloc(&OBJC_CLASS___UNUserNotificationCenter);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BD28 notificationQueue]);
    uint64_t v7 = -[UNUserNotificationCenter initWithBundleIdentifier:queue:]( v5,  "initWithBundleIdentifier:queue:",  @"com.apple.hangtracerd.usernotifications",  v6);
    [(id)qword_10005BD28 setNotificationCenter:v7];

    int v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BD28 notificationCenter]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", *(void *)(a1 + 32)));
    [v8 setNotificationCategories:v9];

    uint64_t v10 = qword_10005BD28;
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BD28 notificationCenter]);
    [v11 setDelegate:v10];

    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BD28 notificationCenter]);
    [v12 setWantsNotificationResponsesDelivered];

    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    [(id)qword_10005BD28 setResponseHandlers:v13];
  }

NSMutableArray *sub_100027AD0(const __CFString *a1, void *a2, uint64_t a3)
{
  int v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.", a3));
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  int v8 = CFPreferencesCopyKeyList(a1, v5, kCFPreferencesAnyHost);
  id v9 = -[__CFArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
      }

      id v10 = -[__CFArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v10);
  }

  return v7;
}

void sub_100027D40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100027D58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100027D68(uint64_t a1)
{
}

void sub_100027D70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 unsignedIntValue] - 1;
  id v8 = sub_1000233A4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412802;
    id v16 = v5;
    __int16 v17 = 1024;
    unsigned int v18 = [v6 unsignedIntValue];
    __int16 v19 = 1024;
    int v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@ Generated Logs count decreased %u -> %u",  (uint8_t *)&v15,  0x18u);
  }

  if ((_DWORD)v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
    [(id)qword_10005BD78 setObject:v10 forKeyedSubscript:v5];
  }

  else
  {
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    if (!v11)
    {
      unint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
      int v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    }

    [v11 addObject:v5];
  }
}

BOOL sub_10002903C(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BD80 objectForKeyedSubscript:a1]);
  id v2 = v1;
  if (v1)
  {
    unsigned int v3 = [v1 unsignedIntValue];
    dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    BOOL v5 = v3 > [v4 slowAppActivationPerAppMaxLogLimit];
  }

  else
  {
    BOOL v5 = 0LL;
  }

  return v5;
}

void sub_1000290B8(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BD80 objectForKeyedSubscript:v1]);
  unsigned int v3 = v2;
  if (v2) {
    unsigned int v4 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v6 = [v5 slowAppActivationPerAppMaxLogLimit];

  if (v4 >= v6)
  {
    id v10 = sub_1000233A4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412802;
      id v12 = v1;
      __int16 v13 = 1024;
      unsigned int v14 = v4;
      __int16 v15 = 1024;
      unsigned int v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@ Launch Generated Log count : %u -> %u",  (uint8_t *)&v11,  0x18u);
    }
  }

  else
  {
    id v7 = sub_1000233A4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412802;
      id v12 = v1;
      __int16 v13 = 1024;
      unsigned int v14 = v4;
      __int16 v15 = 1024;
      unsigned int v16 = v4 + 1;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%@ Launch Generated Log count: %u -> %u",  (uint8_t *)&v11,  0x18u);
    }

    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4 + 1));
    [(id)qword_10005BD80 setObject:v9 forKeyedSubscript:v1];
  }
}

id sub_10002944C(uint64_t a1)
{
  v9[0] = *(void *)(a1 + 32);
  v8[0] = @"EnablementType";
  v8[1] = @"CaptureSuccessful";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 64)));
  v9[1] = v2;
  _DWORD v8[2] = @"CaptureFailureReason";
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 40)));
  v9[2] = v3;
  v8[3] = @"HangSubType";
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 48)));
  void v9[3] = v4;
  void v8[4] = @"HTBugType";
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 56)));
  void v9[4] = v5;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  5LL));

  return v6;
}

LABEL_32:
    LOBYTE(v39) = 0;
    goto LABEL_33;
  }

  id v25 = dword_10005BD74;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  double v27 = [v26 signpostMonitoringPerPeriodLogLimit];

  if (v25 >= v27)
  {
    unsigned int v18 = v57;
    if (a7)
    {
      uint64_t v48 = @"Sentry has hit its per-period tailspin limit";
      goto LABEL_30;
    }

    goto LABEL_32;
  }

  double v28 = sub_1000233A4();
  double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    uint64_t v31 = [v30 shouldCollectOSSignposts];
    uint64_t v32 = @"NO";
    if (v31) {
      uint64_t v32 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    __int16 v65 = v32;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Collecting OS Signposts: %@", buf, 0xCu);
  }

  if (v13)
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:off_10005B0A0]);
    __int16 v13 = [v33 intValue];
  }

  id v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v34, "addObject:", v61);
  uint64_t v35 = (unint64_t)sub_10002584C(0x7D0uLL);
  if (v35 >= a5) {
    uint64_t v35 = 0LL;
  }
  uint64_t v36 = a5 - v35;
  uint64_t v37 = v34;
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  LOBYTE(v56) = [v38 shouldCollectOSSignposts];
  LODWORD(v55) = v13;
  uint64_t v39 = +[HTTailspin saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:]( &OBJC_CLASS___HTTailspin,  "saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:",  v17,  v57,  v37,  v36,  a6,  @"Sentry",  v55,  3LL,  v56,  &v63);

  if (v39)
  {
    ++dword_10005BD70;
    ++dword_10005BD74;
    uint64_t v40 = sub_1000233A4();
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v65 = @"Sentry";
      uint64_t v66 = 2112;
      __int16 v67 = (uint64_t)v19;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%@: Moving tailspin to spool: %@\n", buf, 0x16u);
    }

    id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    double v62 = 0LL;
    uint64_t v43 = [v42 moveItemAtPath:v20 toPath:v19 error:&v62];
    uint64_t v44 = v62;

    if ((v43 & 1) == 0)
    {
      uint64_t v45 = sub_1000233A4();
      uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v65 = @"Sentry";
        uint64_t v66 = 2114;
        __int16 v67 = (uint64_t)v44;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Unable to move tailspin to final path: %{public}@",  buf,  0x16u);
      }

      if (a7)
      {
        uint64_t v47 = sub_100017C70(3LL, (uint64_t)@"Failed to move tailspin to final path");
        *a7 = (id)objc_claimAutoreleasedReturnValue(v47);
      }

      unlink(v58);
    }
  }

  else
  {
    uint64_t v52 = sub_1000233A4();
    uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v65 = @"Sentry";
      uint64_t v66 = 2048;
      __int16 v67 = v63;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Unable to save tailspin data to file, reason: %ld\n",  buf,  0x16u);
    }

    unlink(v58);
    if (a7)
    {
      unint64_t v54 = sub_100017C70(3LL, (uint64_t)@"Failed to save tailspin data for Sentry");
      uint64_t v44 = 0LL;
      *a7 = (id)objc_claimAutoreleasedReturnValue(v54);
    }

    else
    {
      uint64_t v44 = 0LL;
    }
  }

  unsigned int v18 = v57;
LABEL_33:

  return v39;
}

LABEL_15:
    LOBYTE(v3_Block_object_dispose(va, 8) = 0;
    goto LABEL_16;
  }

  uint64_t v40 = (void *)qword_10005BD40;
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v42 = (void *)objc_claimAutoreleasedReturnValue([v40 stringFromDate:v41]);
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@.%@",  v15,  v16,  v42,  @"tailspin"));

  v60[0] = @"Reason";
  v60[1] = @"ServiceName";
  v61[0] = v15;
  v61[1] = v14;
  v61[2] = v16;
  v60[2] = @"ProcessPath";
  v60[3] = @"PID";
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
  v61[3] = v55;
  v60[4] = @"ThreadID";
  unint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 0LL));
  v61[4] = v54;
  v60[5] = @"StartTime";
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", (unint64_t)v22));
  v61[5] = v53;
  v60[6] = @"EndTime";
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", (unint64_t)v23));
  v61[6] = v52;
  v60[7] = @"DisplayData";
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessInfo displayStateArray](&OBJC_CLASS___HTProcessInfo, "displayStateArray"));
  v61[7] = v43;
  v60[8] = @"NetworkState";
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[HTNetworkInfo networkStateForTailSpin](&OBJC_CLASS___HTNetworkInfo, "networkStateForTailSpin"));
  uint64_t v45 = v44;
  if (!v44) {
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v61[8] = v45;
  v60[9] = @"IsThirdPartyDevSupportModeHang";
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a9));
  v61[9] = v46;
  uint64_t v47 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v60,  10LL));

  if (!v44) {
  unsigned int v56 = 11LL;
  }
  uint64_t v48 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v48, "addObject:", v47);
  uint64_t v38 = +[HTTailspin saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:]( &OBJC_CLASS___HTTailspin,  "saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:",  v26,  v48,  (unint64_t)v22,  (unint64_t)v23,  v16,  v11,  2LL,  &v56);
  uint64_t v49 = (void *)v47;
  if (v38)
  {
    ++dword_10005BD6C;
    uint64_t v50 = sub_1000233A4();
    unint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)double v58 = dword_10005BD6C - 1;
      *(_WORD *)&v58[4] = 1024;
      *(_DWORD *)&v58[6] = dword_10005BD6C;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_INFO,  "Daily Generated Launch Log count: %u -> %u",  buf,  0xEu);
    }

    sub_1000290B8(v16);
  }

LABEL_16:
  return v38;
}

id sub_10002BAA4(uint64_t a1)
{
  v10[0] = @"RequestType";
  id v2 = sub_100018A40(*(void *)(a1 + 32));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v11[0] = v3;
  v10[1] = @"PreviousDumpTime_To_RequestEndTime";
  LODWORD(v4) = *(_DWORD *)(a1 + 56);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v4));
  v11[1] = v5;
  v10[2] = @"RequestEndTime_To_CurrentTime";
  unsigned int v6 = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  sub_100025798(*(void *)(a1 + 40) - *(void *)(a1 + 48)));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  _DWORD v11[2] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

  return v8;
}

void sub_10002BBA4()
{
}

void sub_10002BBD0()
{
}

void sub_10002BBFC()
{
}

void sub_10002BC28()
{
}

void sub_10002BC54(void *a1, void *a2, os_log_s *a3)
{
  int v5 = 136315650;
  uint8_t v6 = "handleSentryTailspinRequest";
  __int16 v7 = 2048;
  id v8 = [a1 unsignedLongLongValue];
  __int16 v9 = 2048;
  id v10 = [a2 unsignedLongLongValue];
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "%s: Requested startTime = %llu, endTime = %llu",  (uint8_t *)&v5,  0x20u);
}

void sub_10002BD10()
{
}

void sub_10002BD3C()
{
}

void sub_10002BD68()
{
}

void sub_10002BD94(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Archive Save Directory specified as %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10002BE08(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED reporting data:%@ error:%@",  (uint8_t *)&v3,  0x16u);
}

void sub_10002BE8C(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "matuTimeDifferenceMS: negative distance = %f",  (uint8_t *)&v2,  0xCu);
}

void sub_10002BF04(unint64_t a1, os_log_s *a2)
{
  double v3 = off_10005AE40;
  uint64_t v4 = sub_100018A40(a1);
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = 138412802;
  __int16 v7 = v3;
  __int16 v8 = 2112;
  __int16 v9 = v5;
  __int16 v10 = 2112;
  int v11 = @"Tailspin_Requests_By_Type";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@.%@.%@ += 1 ", (uint8_t *)&v6, 0x20u);
}

void sub_10002BFC4(os_log_t log)
{
  int v1 = 138412546;
  int v2 = off_10005AE40;
  __int16 v3 = 2112;
  uint64_t v4 = @"Tailspin_Requests";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@.%@ += 1", (uint8_t *)&v1, 0x16u);
}

void sub_10002C058(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 134218240;
  uint64_t v4 = qword_10005B458;
  __int16 v5 = 2048;
  uint64_t v6 = qword_10005B460;
  sub_10000CFAC( (void *)&_mh_execute_header,  a1,  a3,  "getHangWaitTimeout: hangSequenceStartTime %llu, hangSequenceLastHangReportedTime %llu",  (uint8_t *)&v3);
  sub_10000CFB8();
}

void sub_10002C0DC()
{
}

void sub_10002C144(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = qword_10005B460;
  sub_10000CFAC( (void *)&_mh_execute_header,  a2,  a3,  "getHangWaitTimeout: now %llu < hangSequenceLastHangReportedTime %llu",  (uint8_t *)&v3);
  sub_10000CFB8();
}

void sub_10002C1C0()
{
}

void sub_10002C228(void *a1, int a2, os_log_s *a3)
{
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"Primary"]);
  int v6 = 138412546;
  __int16 v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "Acquired network state: interface xpc_type_t type = %@, time since primary = %u",  (uint8_t *)&v6,  0x12u);
}

void sub_10002C2DC(void *a1, os_log_s *a2)
{
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "HUD_background_opacity set to %f",  (uint8_t *)&v4,  0xCu);
}

void sub_10002C364( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C398( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C3CC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C434( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C49C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C500( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C564( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C5D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C644( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C6B4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C724( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C794(void *a1)
{
}

void sub_10002C804(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "No more update happens as it's completed for %@ @ HangHUDLine::update:",  (uint8_t *)&v2,  0xCu);
}

void sub_10002C878(void *a1)
{
}

void sub_10002C8E8(uint64_t a1, os_log_s *a2, double a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Checking if hang is current with hangID %@: durationSinceLastUpdateMs:%f",  (uint8_t *)&v3,  0x16u);
}

void sub_10002C968(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Saved file: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002C9DC(os_log_s *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4 = 134217984;
  double v5 = a2;
  sub_100017AC8( (void *)&_mh_execute_header,  a1,  a4,  "TextAnimation: no need to update duraton since _hangDuration is equal to the input %f.",  (uint8_t *)&v4);
  sub_10000CFB8();
}

void sub_10002CA48(os_log_s *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4 = 134217984;
  double v5 = a2;
  sub_100017AC8( (void *)&_mh_execute_header,  a1,  a4,  "TextAnimation: duration layer's animation object updated with toValue = %f",  (uint8_t *)&v4);
  sub_10000CFB8();
}

void sub_10002CAB4(void *a1, os_log_s *a2, double a3)
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue([a1 string]);
  int v6 = 138412546;
  __int16 v7 = v5;
  __int16 v8 = 2048;
  double v9 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "TextAnimation: duration layer's animation object initialized: text set as %@ for a given duration %f",  (uint8_t *)&v6,  0x16u);
}

void sub_10002CB60(os_log_s *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4 = 134217984;
  double v5 = a2;
  sub_100017AC8((void *)&_mh_execute_header, a1, a4, "TextAnimation: animation ended with duration %f", (uint8_t *)&v4);
  sub_10000CFB8();
}

void sub_10002CBCC(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 string]);
  int v5 = 138412290;
  int v6 = v3;
  sub_100017AC8((void *)&_mh_execute_header, a2, v4, "TextAnimation:  duration layer's text set as %@", (uint8_t *)&v5);
}

void sub_10002CC5C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "HangTracer: pathForPid was found invalid UTF8 string, trying ascii encoding = %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10002CCD0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Cleaning up %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002CD44(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Generate recentAppsDict with pids and paths of recently running apps",  v1,  2u);
}

void sub_10002CD84( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002CDF0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002CE5C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002CEC4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002CF2C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  sub_1000222B8( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement",  (uint8_t *)&v3);
  sub_10000CFB8();
}

void sub_10002CFA4(uint64_t a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&v3[4] = @"enablementPrefix";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_1000222A4( (void *)&_mh_execute_header,  (uint64_t)a2,  a3,  "HTPrefs: %@: %@ -> %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16],  *a2);
  sub_1000222E8();
}

void sub_10002D028()
{
}

void sub_10002D0BC()
{
}

void sub_10002D150(int a1, int a2, os_log_t log)
{
  int v3 = 138412802;
  uint64_t v4 = @"isCarryDevice";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %{BOOL}d -> %{BOOL}d",  (uint8_t *)&v3,  0x18u);
  sub_10000CFB8();
}

void sub_10002D1E0()
{
  v2[0] = 136315394;
  sub_1000222D4();
  sub_1000222B8( (void *)&_mh_execute_header,  v0,  v1,  "HTPrefs: %s is set to %@, treating as carry device",  (uint8_t *)v2);
  sub_10000CFB8();
}

void sub_10002D254()
{
  v2[0] = 136315394;
  sub_1000222D4();
  sub_1000222B8((void *)&_mh_execute_header, v0, v1, "HTPrefs: %s: %@", (uint8_t *)v2);
  sub_10000CFB8();
}

void sub_10002D2C8()
{
  v2[0] = 136315394;
  sub_1000222D4();
  sub_1000222B8((void *)&_mh_execute_header, v0, v1, "HTPrefs: %s: %@", (uint8_t *)v2);
  sub_10000CFB8();
}

void sub_10002D33C()
{
}

void sub_10002D3D0()
{
}

void sub_10002D464(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_10002D4A4()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_10002D4CC(uint64_t *a1, os_log_s *a2, double a3)
{
  uint64_t v3 = *a1;
  int v4 = 134218496;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  __int16 v8 = 2048;
  uint64_t v9 = 0x4059000000000000LL;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "HTHUD: numberOfDashes greater than maximum, elapsedTimeMS=%f, numberOfDashes=%f, capping to max_dash_count=%f",  (uint8_t *)&v4,  0x20u);
}

void sub_10002D55C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D58C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D5BC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D5EC(uint64_t a1, os_log_s *a2)
{
  int v4 = 134218498;
  uint64_t v5 = qword_10005BC58;
  __int16 v6 = 2048;
  double v7 = -[HUDLine contentScaleForTexts]_0();
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "cachedTopMargin is set to %f where DisplayScale is %f. The orientation is %@",  (uint8_t *)&v4,  0x20u);
}

void sub_10002D6A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D6D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D708(uint8_t *a1, unint64_t a2, double *a3, os_log_s *a4)
{
  double v7 = sub_100025798(a2);
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_DEBUG,  "HTAssertion: checkOverlap: ignoring hang during screen off with duration %.0fms",  a1,  0xCu);
}

void sub_10002D770(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%{public}@: Tailspins will include trial information",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_HUD_background_opacity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HUD_background_opacity");
}

id objc_msgSend_HangHUD_updater_latency_in_ms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HangHUD_updater_latency_in_ms");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__createInternalSettings");
}

id objc_msgSend_accessibilityReducesTransparency(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityReducesTransparency];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 actionIdentifier];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addCommitHandler_forPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCommitHandler:forPhase:");
}

id objc_msgSend_addDisplayStateChangeEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDisplayStateChangeEvent:");
}

id objc_msgSend_addHang_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHang:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_allHangs(void *a1, const char *a2, ...)
{
  return _[a1 allHangs];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_animationDidStartOnLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationDidStartOnLine:");
}

id objc_msgSend_animationDidStopOnLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationDidStopOnLine:");
}

id objc_msgSend_animationForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationForKey:");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_appActivationLoggingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 appActivationLoggingEnabled];
}

id objc_msgSend_appLaunchMonitoringEnabled(void *a1, const char *a2, ...)
{
  return _[a1 appLaunchMonitoringEnabled];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associatePrefix_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associatePrefix:withHandler:");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _[a1 authorizationStatus];
}

id objc_msgSend_automatedDeviceGroup(void *a1, const char *a2, ...)
{
  return _[a1 automatedDeviceGroup];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginAnimationFromValue_toValue_duration_updateBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAnimationFromValue:toValue:duration:updateBlock:completionBlock:");
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLProperty:contextPrefixOut:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundleIdToAppNameCache(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdToAppNameCache];
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return _[a1 canceled];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 capitalizedString];
}

id objc_msgSend_captureMicroHang(void *a1, const char *a2, ...)
{
  return _[a1 captureMicroHang];
}

id objc_msgSend_checkEventsForHUDUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkEventsForHUDUpdate:");
}

id objc_msgSend_checkEventsForTimeouts_withType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkEventsForTimeouts:withType:");
}

id objc_msgSend_checkForHUDTimeouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForHUDTimeouts:");
}

id objc_msgSend_checkForHangTimeouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForHangTimeouts:");
}

id objc_msgSend_checkShouldSaveHangLogs(void *a1, const char *a2, ...)
{
  return _[a1 checkShouldSaveHangLogs];
}

id objc_msgSend_cleanupAllHangs(void *a1, const char *a2, ...)
{
  return _[a1 cleanupAllHangs];
}

id objc_msgSend_clearBundleNameCache(void *a1, const char *a2, ...)
{
  return _[a1 clearBundleNameCache];
}

id objc_msgSend_clearHUDLinesAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDLinesAnimated:");
}

id objc_msgSend_clearHUDLinesAnimated_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDLinesAnimated:withCompletion:");
}

id objc_msgSend_clearHUDWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDWithCompletion:");
}

id objc_msgSend_clientContextIdentifierKey(void *a1, const char *a2, ...)
{
  return _[a1 clientContextIdentifierKey];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectTailspinAndUpdateTelemtry(void *a1, const char *a2, ...)
{
  return _[a1 collectTailspinAndUpdateTelemtry];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_compareBootSessionUUIDAndClearPreferencesWithDomain_prefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compareBootSessionUUIDAndClearPreferencesWithDomain:prefix:");
}

id objc_msgSend_compareValue(void *a1, const char *a2, ...)
{
  return _[a1 compareValue];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _[a1 completionBlock];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureConnection:");
}

id objc_msgSend_connectionWithEndpoint_clientContextBuilder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionWithEndpoint:clientContextBuilder:");
}

id objc_msgSend_containerLayer(void *a1, const char *a2, ...)
{
  return _[a1 containerLayer];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentScaleForTexts(void *a1, const char *a2, ...)
{
  return _[a1 contentScaleForTexts];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countsOfMeetingEndingConditions(void *a1, const char *a2, ...)
{
  return _[a1 countsOfMeetingEndingConditions];
}

id objc_msgSend_createContainerLayer(void *a1, const char *a2, ...)
{
  return _[a1 createContainerLayer];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentHangTextColorForStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHangTextColorForStatus:");
}

id objc_msgSend_currentOrientation(void *a1, const char *a2, ...)
{
  return _[a1 currentOrientation];
}

id objc_msgSend_currentProcessExitTextColor(void *a1, const char *a2, ...)
{
  return _[a1 currentProcessExitTextColor];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentTheme(void *a1, const char *a2, ...)
{
  return _[a1 currentTheme];
}

id objc_msgSend_darkModeTheme(void *a1, const char *a2, ...)
{
  return _[a1 darkModeTheme];
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 dateFormatter];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return _[a1 defaultSound];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_determineNewFrameForRootLayer_numberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineNewFrameForRootLayer:numberOfLines:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayId(void *a1, const char *a2, ...)
{
  return _[a1 displayId];
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_displayNameForHangInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForHangInfo:");
}

id objc_msgSend_displayStateArray(void *a1, const char *a2, ...)
{
  return _[a1 displayStateArray];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleProperty:contextPrefixOut:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _[a1 earlyInitNecessaryPrefs];
}

id objc_msgSend_enableLoggingForPoster(void *a1, const char *a2, ...)
{
  return _[a1 enableLoggingForPoster];
}

id objc_msgSend_enableLoggingForWidgetRenderer(void *a1, const char *a2, ...)
{
  return _[a1 enableLoggingForWidgetRenderer];
}

id objc_msgSend_enablementPrefix(void *a1, const char *a2, ...)
{
  return _[a1 enablementPrefix];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endAnimation:");
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return _[a1 endTime];
}

id objc_msgSend_endpointForMachName_service_instance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForMachName:service:instance:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_eplEnabled(void *a1, const char *a2, ...)
{
  return _[a1 eplEnabled];
}

id objc_msgSend_eplEnabledProfile(void *a1, const char *a2, ...)
{
  return _[a1 eplEnabledProfile];
}

id objc_msgSend_eplTimeoutTimestampSec(void *a1, const char *a2, ...)
{
  return _[a1 eplTimeoutTimestampSec];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exitReasonCode(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonCode];
}

id objc_msgSend_exitReasonCodeTextLayer(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonCodeTextLayer];
}

id objc_msgSend_exitReasonNamespace(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonNamespace];
}

id objc_msgSend_exitReasonNamespaceTextLayer(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonNamespaceTextLayer];
}

id objc_msgSend_exitTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 exitTimestamp];
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return _[a1 extensionPointRecord];
}

id objc_msgSend_failReason(void *a1, const char *a2, ...)
{
  return _[a1 failReason];
}

id objc_msgSend_fenceHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 fenceHangDailyLogLimit];
}

id objc_msgSend_fetchProcessRecords(void *a1, const char *a2, ...)
{
  return _[a1 fetchProcessRecords];
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:relativeToURL:");
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithType:");
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return _[a1 filters];
}

id objc_msgSend_firstHang(void *a1, const char *a2, ...)
{
  return _[a1 firstHang];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _[a1 flush];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fromValue(void *a1, const char *a2, ...)
{
  return _[a1 fromValue];
}

id objc_msgSend_getApplicationByBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getApplicationByBundleId:");
}

id objc_msgSend_getBootSessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 getBootSessionUUID];
}

id objc_msgSend_getDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDescription:");
}

id objc_msgSend_getEPLProfilePath(void *a1, const char *a2, ...)
{
  return _[a1 getEPLProfilePath];
}

id objc_msgSend_getEarliestPendingHangStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEarliestPendingHangStartTime:");
}

id objc_msgSend_getHangHUDInfoKey(void *a1, const char *a2, ...)
{
  return _[a1 getHangHUDInfoKey];
}

id objc_msgSend_getHangStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHangStartTime:");
}

id objc_msgSend_getHangWaitTimeout(void *a1, const char *a2, ...)
{
  return _[a1 getHangWaitTimeout];
}

id objc_msgSend_getHighestPrioritySettingValue_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHighestPrioritySettingValue:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_getKeyForLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getKeyForLine:");
}

id objc_msgSend_getNotificationSettingsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNotificationSettingsWithCompletionHandler:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_hangDescription(void *a1, const char *a2, ...)
{
  return _[a1 hangDescription];
}

id objc_msgSend_hangDuration(void *a1, const char *a2, ...)
{
  return _[a1 hangDuration];
}

id objc_msgSend_hangDurationMS(void *a1, const char *a2, ...)
{
  return _[a1 hangDurationMS];
}

id objc_msgSend_hangEndTime(void *a1, const char *a2, ...)
{
  return _[a1 hangEndTime];
}

id objc_msgSend_hangHasPendingAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangHasPendingAnimation:");
}

id objc_msgSend_hangSequenceEndTime(void *a1, const char *a2, ...)
{
  return _[a1 hangSequenceEndTime];
}

id objc_msgSend_hangSequenceStartTime(void *a1, const char *a2, ...)
{
  return _[a1 hangSequenceStartTime];
}

id objc_msgSend_hangStartTime(void *a1, const char *a2, ...)
{
  return _[a1 hangStartTime];
}

id objc_msgSend_hangSubType(void *a1, const char *a2, ...)
{
  return _[a1 hangSubType];
}

id objc_msgSend_hangWaitTimeoutDurationMSec(void *a1, const char *a2, ...)
{
  return _[a1 hangWaitTimeoutDurationMSec];
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hangtracerDaemonEnabled];
}

id objc_msgSend_hasAppExceededGeneratedLogsCountForDuration_procName_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAppExceededGeneratedLogsCountForDuration:procName:isFirstPartyApp:");
}

id objc_msgSend_hasExceededDailyFenceLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 hasExceededDailyFenceLogLimit];
}

id objc_msgSend_hasExceededDailyLimit_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasExceededDailyLimit:isFirstPartyApp:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_htTailspinEnabled(void *a1, const char *a2, ...)
{
  return _[a1 htTailspinEnabled];
}

id objc_msgSend_hudContentWithPendingAnimations(void *a1, const char *a2, ...)
{
  return _[a1 hudContentWithPendingAnimations];
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hudEnabled];
}

id objc_msgSend_hudLine(void *a1, const char *a2, ...)
{
  return _[a1 hudLine];
}

id objc_msgSend_hudLines(void *a1, const char *a2, ...)
{
  return _[a1 hudLines];
}

id objc_msgSend_hudRenderContext(void *a1, const char *a2, ...)
{
  return _[a1 hudRenderContext];
}

id objc_msgSend_hudString(void *a1, const char *a2, ...)
{
  return _[a1 hudString];
}

id objc_msgSend_hudThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 hudThresholdMSec];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityForAngelJobLabel:");
}

id objc_msgSend_incrementAppGeneratedLogsCountForDuration_procName_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementAppGeneratedLogsCountForDuration:procName:isFirstPartyApp:");
}

id objc_msgSend_incrementDailyFenceLogGenerationCount(void *a1, const char *a2, ...)
{
  return _[a1 incrementDailyFenceLogGenerationCount];
}

id objc_msgSend_incrementDailyLogGenerationCountForDuration_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementDailyLogGenerationCountForDuration:isFirstPartyApp:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_infoDict(void *a1, const char *a2, ...)
{
  return _[a1 infoDict];
}

id objc_msgSend_initStatus(void *a1, const char *a2, ...)
{
  return _[a1 initStatus];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:error:");
}

id objc_msgSend_initWithBundleIdentifier_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:queue:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithHangStartTime_hangEndTime_receivedTimestamp_hangDurationMS_hudString_shortenedBundle_bundleId_timedOut_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithInfo_pid_spawnTimestamp_exitTimestamp_exitReasonCode_exitReasonNamespace_jetsam_priority_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:");
}

id objc_msgSend_initWithNamespaceLayer_codeLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNamespaceLayer:codeLayer:");
}

id objc_msgSend_initWithPid_sharedMem_length_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPid:sharedMem:length:bundleID:");
}

id objc_msgSend_initWithPid_threadID_startTime_endTime_reportedTime_blownFenceID_hangSubtype_isFirstPartyApp_isThirdPartyDevSupportModeHang_displayedInHUD_serviceName_reason_processName_processPath_userActionData_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevS upportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:");
}

id objc_msgSend_initWithPreviousHangTextColor_currentHangTextColor_currentHangSevereTextColor_previousHangSevereTextColor_currentHangCriticalTextColor_previousHangCriticalTextColor_backgroundColor_translucentBackgroundColor_textColorSevereVibrantFilter_textColorCriticalVibrantFilter_currentProcessExitTextColor_processExitReasonNamespaceTextColor_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:cur rentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:translucentBackgroundColor:textColorS evereVibrantFilter:textColorCriticalVibrantFilter:currentProcessExitTextColor:processExitReasonNamespaceTextColor:");
}

id objc_msgSend_initWithProcExitRecord_theme_lineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProcExitRecord:theme:lineDelegate:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_processName_theme_fontSize_lineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:processName:theme:fontSize:lineDelegate:");
}

id objc_msgSend_initWithRenderContext_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRenderContext:queue:");
}

id objc_msgSend_initWithRunloopHangTimeoutDurationMSec_thirdPartyDevPreferredLanguages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRunloopHangTimeoutDurationMSec:thirdPartyDevPreferredLanguages:");
}

id objc_msgSend_initWithServiceName_threadID_startTime_endTime_saveTailspin_subType_userActionData_isThirdPartyDevSupportModeHang_processInfo_captureMicroHang_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithServiceName:threadID:startTime:endTime:saveTailspin:subType:userActionData:isThirdPartyDevSupportMode Hang:processInfo:captureMicroHang:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initializeStatus(void *a1, const char *a2, ...)
{
  return _[a1 initializeStatus];
}

id objc_msgSend_insert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insert:");
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intProperty:contextPrefixOut:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _[a1 interface];
}

id objc_msgSend_interfaceWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithIdentifier:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isAnyModeActive(void *a1, const char *a2, ...)
{
  return _[a1 isAnyModeActive];
}

id objc_msgSend_isCurrent_withHUDUpdateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrent:withHUDUpdateInterval:");
}

id objc_msgSend_isDeveloperApp(void *a1, const char *a2, ...)
{
  return _[a1 isDeveloperApp];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstPartyApp(void *a1, const char *a2, ...)
{
  return _[a1 isFirstPartyApp];
}

id objc_msgSend_isHangEndedWithDuration_updateInterval_hangID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHangEndedWithDuration:updateInterval:hangID:");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isImmersionLevelControllerPresentOnScreen(void *a1, const char *a2, ...)
{
  return _[a1 isImmersionLevelControllerPresentOnScreen];
}

id objc_msgSend_isInForeground(void *a1, const char *a2, ...)
{
  return _[a1 isInForeground];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _[a1 isInternal];
}

id objc_msgSend_isProfileValidated(void *a1, const char *a2, ...)
{
  return _[a1 isProfileValidated];
}

id objc_msgSend_isThirdPartyDevSupportModeHang(void *a1, const char *a2, ...)
{
  return _[a1 isThirdPartyDevSupportModeHang];
}

id objc_msgSend_isTimedOut(void *a1, const char *a2, ...)
{
  return _[a1 isTimedOut];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_jetsam_priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jetsam_priority");
}

id objc_msgSend_keyLayer(void *a1, const char *a2, ...)
{
  return _[a1 keyLayer];
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_keysSortedByValueWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueWithOptions:usingComparator:");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_lastKnownHangs(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownHangs];
}

id objc_msgSend_lastKnownMaxKeyLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownMaxKeyLayerWidth];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutHUDLines_ids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutHUDLines:ids:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_lightModeTheme(void *a1, const char *a2, ...)
{
  return _[a1 lightModeTheme];
}

id objc_msgSend_lineDelegate(void *a1, const char *a2, ...)
{
  return _[a1 lineDelegate];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _[a1 localizations];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedNameWithPreferredLocalizations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedNameWithPreferredLocalizations:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForKey_value_table_localization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:localization:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_machName(void *a1, const char *a2, ...)
{
  return _[a1 machName];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplay];
}

id objc_msgSend_memoryLoggingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 memoryLoggingEnabled];
}

id objc_msgSend_memoryLoggingIntervalSec(void *a1, const char *a2, ...)
{
  return _[a1 memoryLoggingIntervalSec];
}

id objc_msgSend_minimumValueLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 minimumValueLayerWidth];
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_networkStateForTailSpin(void *a1, const char *a2, ...)
{
  return _[a1 networkStateForTailSpin];
}

id objc_msgSend_nilifyCALayers(void *a1, const char *a2, ...)
{
  return _[a1 nilifyCALayers];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 notificationCenter];
}

id objc_msgSend_notificationQueue(void *a1, const char *a2, ...)
{
  return _[a1 notificationQueue];
}

id objc_msgSend_notifyHTTailSpinResult_failReason_hangSubType_htBugType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyHTTailSpinResult:failReason:hangSubType:htBugType:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfHangs(void *a1, const char *a2, ...)
{
  return _[a1 numberOfHangs];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectProperty:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performHUDUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHUDUpdate:");
}

id objc_msgSend_performHUDUpdate_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHUDUpdate:withCompletion:");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_prefContextPrefixPriorityOrder(void *a1, const char *a2, ...)
{
  return _[a1 prefContextPrefixPriorityOrder];
}

id objc_msgSend_prefInitList(void *a1, const char *a2, ...)
{
  return _[a1 prefInitList];
}

id objc_msgSend_prefNamed_domain_profile_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_preferredFrameSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredFrameSize];
}

id objc_msgSend_preferredKeyLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredKeyLayerWidth];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_preferredValueLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredValueLayerWidth];
}

id objc_msgSend_previousDurationSinceLastUpdateMs(void *a1, const char *a2, ...)
{
  return _[a1 previousDurationSinceLastUpdateMs];
}

id objc_msgSend_previousHangTextColorForStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousHangTextColorForStatus:");
}

id objc_msgSend_processExitReasonNamespaceTextColor(void *a1, const char *a2, ...)
{
  return _[a1 processExitReasonNamespaceTextColor];
}

id objc_msgSend_processForPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processForPid:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_protocolForProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protocolForProtocol:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_receiveHangHUDInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveHangHUDInfo:completion:");
}

id objc_msgSend_receiveHudConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveHudConfiguration:completion:");
}

id objc_msgSend_receiveMonitoredStates_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveMonitoredStates:completion:");
}

id objc_msgSend_receiveProcExitRecord_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveProcExitRecord:completion:");
}

id objc_msgSend_receivedTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 receivedTimestamp];
}

id objc_msgSend_recentAppsDict(void *a1, const char *a2, ...)
{
  return _[a1 recentAppsDict];
}

id objc_msgSend_recordFenceHang_startTime_endTime_reportedTime_blownFenceId_saveTailspin_subtype_isThirdPartyDevSupportModeHang_captureMicroHang_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHa ng:captureMicroHang:");
}

id objc_msgSend_recordHang(void *a1, const char *a2, ...)
{
  return _[a1 recordHang];
}

id objc_msgSend_recordHang_threadID_startTime_endTime_saveTailspin_subtype_userActionData_isThirdPartyDevSupportModeHang_captureMicroHang_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "recordHang:threadID:startTime:endTime:saveTailspin:subtype:userActionData:isThirdPartyDevSupportModeHang:captureMicroHang:");
}

id objc_msgSend_recreateContainerLayerIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 recreateContainerLayerIfNecessary];
}

id objc_msgSend_refreshAppGeneratedLogsCount(void *a1, const char *a2, ...)
{
  return _[a1 refreshAppGeneratedLogsCount];
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _[a1 refreshHTPrefs];
}

id objc_msgSend_refreshPerPeriodSentryLogCount(void *a1, const char *a2, ...)
{
  return _[a1 refreshPerPeriodSentryLogCount];
}

id objc_msgSend_reloadThemeColors(void *a1, const char *a2, ...)
{
  return _[a1 reloadThemeColors];
}

id objc_msgSend_remoteContextWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteContextWithOptions:");
}

id objc_msgSend_remoteTargetWithLaunchingAssertionAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteTargetWithLaunchingAssertionAttributes:");
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllDeliveredNotifications(void *a1, const char *a2, ...)
{
  return _[a1 removeAllDeliveredNotifications];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAllPendingNotificationRequests(void *a1, const char *a2, ...)
{
  return _[a1 removeAllPendingNotificationRequests];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_reportPeriodMATU(void *a1, const char *a2, ...)
{
  return _[a1 reportPeriodMATU];
}

id objc_msgSend_reportedTime(void *a1, const char *a2, ...)
{
  return _[a1 reportedTime];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestAuthorizationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAuthorizationWithOptions:completionHandler:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_resetAppActivationTailspinCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetAppActivationTailspinCounts];
}

id objc_msgSend_resetDailyActivationTailspinCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetDailyActivationTailspinCounts];
}

id objc_msgSend_resetDailyGeneratedLogsCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetDailyGeneratedLogsCounts];
}

id objc_msgSend_resetDailySentryTailspinCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetDailySentryTailspinCounts];
}

id objc_msgSend_resetLogCountsForDailyRollover(void *a1, const char *a2, ...)
{
  return _[a1 resetLogCountsForDailyRollover];
}

id objc_msgSend_resetLogCountsForEPL(void *a1, const char *a2, ...)
{
  return _[a1 resetLogCountsForEPL];
}

id objc_msgSend_resetPerAppCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetPerAppCounts];
}

id objc_msgSend_resetPerPeriodSentryTailspinCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetPerPeriodSentryTailspinCounts];
}

id objc_msgSend_responseHandlers(void *a1, const char *a2, ...)
{
  return _[a1 responseHandlers];
}

id objc_msgSend_retargeted(void *a1, const char *a2, ...)
{
  return _[a1 retargeted];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return _[a1 rootLayer];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runLoopHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 runLoopHangDailyLogLimit];
}

id objc_msgSend_runLoopHangPerPeriodLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 runLoopHangPerPeriodLogLimit];
}

id objc_msgSend_runLoopLongHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 runLoopLongHangDailyLogLimit];
}

id objc_msgSend_runLoopMicroHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 runLoopMicroHangDailyLogLimit];
}

id objc_msgSend_runloopHangDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangDurationThresholdMSec];
}

id objc_msgSend_runloopHangThirdPartyDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangThirdPartyDailyLogLimit];
}

id objc_msgSend_runloopHangThirdPartyDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangThirdPartyDurationThresholdMSec];
}

id objc_msgSend_runloopHangTimeoutDurationMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangTimeoutDurationMSec];
}

id objc_msgSend_runloopLongHangDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopLongHangDurationThresholdMSec];
}

id objc_msgSend_savePreferencesForRestoration_withDomain_prefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savePreferencesForRestoration:withDomain:prefix:");
}

id objc_msgSend_saveSentryTailspin_infoDict_startTime_endTime_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSentryTailspin:infoDict:startTime:endTime:error:");
}

id objc_msgSend_saveTailSpinWithFileName_infoDictArray_startTime_endTime_processString_pid_requestType_failReason_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:");
}

id objc_msgSend_saveTailspin(void *a1, const char *a2, ...)
{
  return _[a1 saveTailspin];
}

id objc_msgSend_saveTailspinForAllHangs(void *a1, const char *a2, ...)
{
  return _[a1 saveTailspinForAllHangs];
}

id objc_msgSend_saveTailspinWithFileName_path_infoDictArray_startTime_endTime_processString_pid_requestType_includeOSSignposts_failReason_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:");
}

id objc_msgSend_sendHangHUDInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHangHUDInfo:completion:");
}

id objc_msgSend_serverRunningDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverRunningDidChange:");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_serviceQuality(void *a1, const char *a2, ...)
{
  return _[a1 serviceQuality];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationHandler:");
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAffineTransform:");
}

id objc_msgSend_setAlignmentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignmentMode:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setCachesInputImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachesInputImage:");
}

id objc_msgSend_setCanceled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanceled:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setContainerLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerLayer:");
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsScale:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCountsOfMeetingEndingConditions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountsOfMeetingEndingConditions:");
}

id objc_msgSend_setCurrentTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTheme:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultActionURL:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDisplayScaleDependentPropertiesOnLayers(void *a1, const char *a2, ...)
{
  return _[a1 setDisplayScaleDependentPropertiesOnLayers];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndTime:");
}

id objc_msgSend_setFailReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailReason:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilters:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFontSize:");
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundColor:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setHUD_background_opacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHUD_background_opacity:");
}

id objc_msgSend_setHangDuration_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangDuration:animated:");
}

id objc_msgSend_setHangHUD_updater_latency_in_ms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangHUD_updater_latency_in_ms:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHudLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHudLine:");
}

id objc_msgSend_setHudRenderContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHudRenderContext:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInterruptionLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionLevel:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setKeyLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyLayer:");
}

id objc_msgSend_setLastKnownHangs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownHangs:");
}

id objc_msgSend_setLastKnownMaxKeyLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownMaxKeyLayerWidth:");
}

id objc_msgSend_setLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayer:");
}

id objc_msgSend_setLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevel:");
}

id objc_msgSend_setLineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineDelegate:");
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryLoggingIntervalSec:");
}

id objc_msgSend_setMinimumValueLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumValueLayerWidth:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCategories:");
}

id objc_msgSend_setNotificationCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCenter:");
}

id objc_msgSend_setNotificationQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationQueue:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setPreferredFrameRateRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFrameRateRange:");
}

id objc_msgSend_setPreferredKeyLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredKeyLayerWidth:");
}

id objc_msgSend_setPreferredValueLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredValueLayerWidth:");
}

id objc_msgSend_setPreviousDurationSinceLastUpdateMs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousDurationSinceLastUpdateMs:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setReducesCaptureBitDepth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReducesCaptureBitDepth:");
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovedOnCompletion:");
}

id objc_msgSend_setResponseHandlers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseHandlers:");
}

id objc_msgSend_setRetargeted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetargeted:");
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScale:");
}

id objc_msgSend_setSecure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecure:");
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServer:");
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceQuality:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowPathIsBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowPathIsBounds:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostHTPrefsChangedNotification:");
}

id objc_msgSend_setSidePadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSidePadding:");
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSound:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setSublayerTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSublayerTransform:");
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreadIdentifier:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTruncationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTruncationMode:");
}

id objc_msgSend_setUpdateBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateBlock:");
}

id objc_msgSend_setUpdatesComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatesComplete:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValueLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueLayer:");
}

id objc_msgSend_setVibrancyFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVibrancyFilter:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return _[a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupPrefsWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:");
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
}

id objc_msgSend_sharedAnimator(void *a1, const char *a2, ...)
{
  return _[a1 sharedAnimator];
}

id objc_msgSend_sharedHelperWithCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedHelperWithCategories:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrefs];
}

id objc_msgSend_shortenedBundle(void *a1, const char *a2, ...)
{
  return _[a1 shortenedBundle];
}

id objc_msgSend_shouldCollectOSSignposts(void *a1, const char *a2, ...)
{
  return _[a1 shouldCollectOSSignposts];
}

id objc_msgSend_shouldDisplayFenceHangToHUD(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisplayFenceHangToHUD];
}

id objc_msgSend_shouldDisplayNonFenceHangToHUD(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisplayNonFenceHangToHUD];
}

id objc_msgSend_shouldIncludeDisplayData(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeDisplayData];
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldPostHTPrefsChangedNotification];
}

id objc_msgSend_shouldSaveFenceHangLogs(void *a1, const char *a2, ...)
{
  return _[a1 shouldSaveFenceHangLogs];
}

id objc_msgSend_shouldUpdateHangsHUD(void *a1, const char *a2, ...)
{
  return _[a1 shouldUpdateHangsHUD];
}

id objc_msgSend_shouldUploadToDiagPipe(void *a1, const char *a2, ...)
{
  return _[a1 shouldUploadToDiagPipe];
}

id objc_msgSend_signpostMonitoringDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 signpostMonitoringDailyLogLimit];
}

id objc_msgSend_signpostMonitoringEnabled(void *a1, const char *a2, ...)
{
  return _[a1 signpostMonitoringEnabled];
}

id objc_msgSend_signpostMonitoringPerPeriodLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 signpostMonitoringPerPeriodLogLimit];
}

id objc_msgSend_slowAppActivationDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 slowAppActivationDailyLogLimit];
}

id objc_msgSend_slowAppActivationPerAppMaxLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 slowAppActivationPerAppMaxLogLimit];
}

id objc_msgSend_slowAppActivationTailspinEnabled(void *a1, const char *a2, ...)
{
  return _[a1 slowAppActivationTailspinEnabled];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_spawnTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 spawnTimestamp];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _[a1 startTime];
}

id objc_msgSend_startTimeWithinMS_ofCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimeWithinMS:ofCurrentTime:");
}

id objc_msgSend_startWatchingPid_sharedMem_length_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWatchingPid:sharedMem:length:bundleID:");
}

id objc_msgSend_statusForHangWithDuration_timedOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusForHangWithDuration:timedOut:");
}

id objc_msgSend_stopWatchingAllPids(void *a1, const char *a2, ...)
{
  return _[a1 stopWatchingAllPids];
}

id objc_msgSend_stopWatchingPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWatchingPid:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringProperty:contextPrefixOut:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _[a1 sublayers];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_subtype(void *a1, const char *a2, ...)
{
  return _[a1 subtype];
}

id objc_msgSend_systemAppearanceWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemAppearanceWithReply:");
}

id objc_msgSend_targetWithProcessIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithProcessIdentity:");
}

id objc_msgSend_textColorVibrantFilterForStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textColorVibrantFilterForStatus:");
}

id objc_msgSend_thirdPartyDevHangHUDEnabled(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyDevHangHUDEnabled];
}

id objc_msgSend_thirdPartyDevPreferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyDevPreferredLanguages];
}

id objc_msgSend_thirdPartyIncludeNonDevelopmentApps(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyIncludeNonDevelopmentApps];
}

id objc_msgSend_threadID(void *a1, const char *a2, ...)
{
  return _[a1 threadID];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timedOut(void *a1, const char *a2, ...)
{
  return _[a1 timedOut];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_toValue(void *a1, const char *a2, ...)
{
  return _[a1 toValue];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _[a1 transaction];
}

id objc_msgSend_translucentBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 translucentBackgroundColor];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unsignedIntProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_update_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "update:options:");
}

id objc_msgSend_updateAnimation_toValue_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAnimation:toValue:duration:");
}

id objc_msgSend_updateBlock(void *a1, const char *a2, ...)
{
  return _[a1 updateBlock];
}

id objc_msgSend_updateCornerRadiusAndSidePaddingIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCornerRadiusAndSidePaddingIfNecessary:");
}

id objc_msgSend_updateCurrentTheme(void *a1, const char *a2, ...)
{
  return _[a1 updateCurrentTheme];
}

id objc_msgSend_updateDisplayLink(void *a1, const char *a2, ...)
{
  return _[a1 updateDisplayLink];
}

id objc_msgSend_updateHUDLineWithId_content_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHUDLineWithId:content:options:");
}

id objc_msgSend_updateHangs_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHangs:withCompletion:");
}

id objc_msgSend_updatesComplete(void *a1, const char *a2, ...)
{
  return _[a1 updatesComplete];
}

id objc_msgSend_userActionData(void *a1, const char *a2, ...)
{
  return _[a1 userActionData];
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return _[a1 valid];
}

id objc_msgSend_valueAtTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueAtTime:");
}

id objc_msgSend_valueLayer(void *a1, const char *a2, ...)
{
  return _[a1 valueLayer];
}

id objc_msgSend_valueWithCAColorMatrix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCAColorMatrix:");
}

id objc_msgSend_workflowResponsivenessEnabled(void *a1, const char *a2, ...)
{
  return _[a1 workflowResponsivenessEnabled];
}