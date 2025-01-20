void start()
{
  dispatch_queue_global_t global_queue;
  dispatch_queue_s *v1;
  dispatch_source_s *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  signal(15, (void (__cdecl *)(int))1);
  global_queue = dispatch_get_global_queue(21LL, 0LL);
  v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v1);
  dispatch_source_set_event_handler(v2, &stru_1000040F0);
  dispatch_activate(v2);
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"adprivacyd launched"));
  _ADLog(@"LATDLogging", v4, 0LL);

  if ((_set_user_dir_suffix("com.apple.adprivacyd") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: Unable to set the temp directory. Please file a radar..."));
    _ADLog(@"iAdInternalLogging", v5, 16LL);
  }

  v6 = +[ADAdTrackingSchedulingManager sharedInstance](&OBJC_CLASS___ADAdTrackingSchedulingManager, "sharedInstance");
  if (MGGetBoolAnswer(@"apple-internal-install"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCoreDefaults sharedInstance](&OBJC_CLASS___ADCoreDefaults, "sharedInstance"));
    v8 = [v7 BOOLForKey:@"ResetiAdIDs"];

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADIDManager sharedInstance](&OBJC_CLASS___ADIDManager, "sharedInstance"));
      [v9 clearDSIDRecords];

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADCoreDefaults sharedInstance](&OBJC_CLASS___ADCoreDefaults, "sharedInstance"));
      [v10 setBool:0 forKey:@"ResetiAdIDs"];

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Reset all iAd ID records."));
      _ADLog(@"iAdIDLogging", v11, 0LL);
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADIDManager sharedInstance](&OBJC_CLASS___ADIDManager, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 activeDSIDRecord]);

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADIDManager sharedInstance](&OBJC_CLASS___ADIDManager, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADCoreSettings sharedInstance](&OBJC_CLASS___ADCoreSettings, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 iTunesAccountDSID]);
    [v14 setDSID:v16 completionHandler:&stru_100004110];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"adprivacyd starting"));
  _ADLog(@"LATDLogging", v17, 0LL);

  objc_autoreleasePoolPop(v3);
  dispatch_main();
}

void sub_100003594(id a1)
{
}

void sub_1000035A4(id a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[ADIDManager sharedInstance](&OBJC_CLASS___ADIDManager, "sharedInstance"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v1 activeDSIDRecord]);

  if (v9)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue([v9 DSID]);
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Set DSID to %@",  v2));
    _ADLog(@"LATDLogging", v3, 0LL);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADIDManager sharedInstance](&OBJC_CLASS___ADIDManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeDSIDRecord]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v5));
    v7 = v6;
    uint64_t v8 = 0LL;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCoreSettings sharedInstance](&OBJC_CLASS___ADCoreSettings, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 iTunesAccountDSID]);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to set DSID to %@",  v5));
    v7 = v6;
    uint64_t v8 = 16LL;
  }

  _ADLog(@"LATDLogging", v7, v8);
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}