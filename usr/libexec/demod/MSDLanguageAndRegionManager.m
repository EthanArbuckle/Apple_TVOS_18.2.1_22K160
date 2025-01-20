@interface MSDLanguageAndRegionManager
+ (id)sharedInstance;
- (BOOL)saveCurrentDeviceLanguageIdentifier;
- (BOOL)saveCuurentDeviceRegionCode;
- (BOOL)saveDeviceLanguageIdentifier:(id)a3;
- (BOOL)saveDeviceRegionCode:(id)a3;
- (BOOL)setDeviceLanguage:(id)a3 andRegion:(id)a4 sbRestartNeeded:(BOOL *)a5 sbRestartHandler:(id)a6;
- (MSDLanguageAndRegionManager)init;
- (OS_dispatch_queue)queue;
- (id)deviceLanguageIdentifier;
- (id)deviceRegionCode;
- (id)getCurrentDeviceLanguage;
- (id)getCurrentDeviceLocaleCode;
- (id)getCurrentDevicePreferredLanguage;
- (id)getCurrentDeviceRegion;
- (void)cancelNotifyToken:(int)a3;
- (void)restoreDeviceLanguageAndRegionIfNeeded;
- (void)setQueue:(id)a3;
@end

@implementation MSDLanguageAndRegionManager

+ (id)sharedInstance
{
  if (qword_1001254F8 != -1) {
    dispatch_once(&qword_1001254F8, &stru_1000FA4E8);
  }
  return (id)qword_1001254F0;
}

- (MSDLanguageAndRegionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDLanguageAndRegionManager;
  v2 = -[MSDLanguageAndRegionManager init](&v5, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.msd_language_and_region", 0LL);
    -[MSDLanguageAndRegionManager setQueue:](v2, "setQueue:", v3);
  }

  return v2;
}

- (BOOL)setDeviceLanguage:(id)a3 andRegion:(id)a4 sbRestartNeeded:(BOOL *)a5 sbRestartHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v38 = a6;
  uint64_t v45 = 0LL;
  v46 = (int *)&v45;
  uint64_t v47 = 0x2020000000LL;
  int v48 = -1;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionHelper sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionHelper,  "sharedInstance"));
  unsigned int v13 = [v12 setDeviceLanguage:v10 andRegion:v11];

  if (v13 != 2)
  {
    dispatch_time_t v14 = dispatch_time(0LL, 60000000000LL);
    v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006291C;
    block[3] = &unk_1000FA510;
    v44 = &v45;
    block[4] = self;
    id v16 = v38;
    id v43 = v16;
    dispatch_after(v14, v15, block);

    v17 = v46;
    v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager queue](self, "queue"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000629C0;
    handler[3] = &unk_1000FA538;
    handler[4] = self;
    v41 = &v45;
    id v40 = v16;
    notify_register_dispatch("com.apple.PineBoard.FinishedStartup", v17 + 6, v18, handler);
  }

  if (!-[MSDLanguageAndRegionManager saveDeviceLanguageIdentifier:](self, "saveDeviceLanguageIdentifier:", v10))
  {
    id v21 = sub_10003A95C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10009BA34(v22, v23, v24, v25, v26, v27, v28, v29);
    }
LABEL_12:

    -[MSDLanguageAndRegionManager cancelNotifyToken:](self, "cancelNotifyToken:", v46[6]);
    BOOL v19 = 0;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (!-[MSDLanguageAndRegionManager saveDeviceRegionCode:](self, "saveDeviceRegionCode:", v11))
  {
    id v30 = sub_10003A95C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10009BA04(v22, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_12;
  }

  BOOL v19 = 1;
  if (a5) {
LABEL_6:
  }
    *a5 = v13 != 2;
LABEL_7:
  _Block_object_dispose(&v45, 8);

  return v19;
}

- (void)restoreDeviceLanguageAndRegionIfNeeded
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager deviceLanguageIdentifier](self, "deviceLanguageIdentifier"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager deviceRegionCode](self, "deviceRegionCode"));
  objc_super v5 = (void *)v4;
  if (v3)
  {
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionHelper sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionHelper,  "sharedInstance"));
      unsigned int v7 = [v6 setDeviceLanguage:v3 andRegion:v5];

      if (v7 == 1)
      {
        id v8 = sub_10003A95C();
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10009BA64(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }
    }
  }
}

- (id)getCurrentDeviceLanguage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionHelper sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionHelper,  "sharedInstance"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getCurrentDeviceLanguage]);

  return v3;
}

- (id)getCurrentDevicePreferredLanguage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionHelper sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionHelper,  "sharedInstance"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getCurrentDevicePreferredLanguage]);

  return v3;
}

- (id)getCurrentDeviceRegion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionHelper sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionHelper,  "sharedInstance"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getCurrentDeviceRegion]);

  return v3;
}

- (id)getCurrentDeviceLocaleCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionHelper sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionHelper,  "sharedInstance"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getCurrentLocaleCode]);

  return v3;
}

- (BOOL)saveCurrentDeviceLanguageIdentifier
{
  v2 = self;
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager getCurrentDeviceLanguage](self, "getCurrentDeviceLanguage"));
  LOBYTE(v2) = -[MSDLanguageAndRegionManager saveDeviceLanguageIdentifier:](v2, "saveDeviceLanguageIdentifier:", v3);

  return (char)v2;
}

- (BOOL)saveCuurentDeviceRegionCode
{
  v2 = self;
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager getCurrentDeviceRegion](self, "getCurrentDeviceRegion"));
  LOBYTE(v2) = -[MSDLanguageAndRegionManager saveDeviceRegionCode:](v2, "saveDeviceRegionCode:", v3);

  return (char)v2;
}

- (BOOL)saveDeviceLanguageIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned __int8 v5 = [v4 setObject:v3 forKey:@"DeviceLanguageIdentifier"];

  return v5;
}

- (id)deviceLanguageIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"DeviceLanguageIdentifier"]);

  return v3;
}

- (BOOL)saveDeviceRegionCode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned __int8 v5 = [v4 setObject:v3 forKey:@"DeviceRegionCode"];

  return v5;
}

- (id)deviceRegionCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"DeviceRegionCode"]);

  return v3;
}

- (void)cancelNotifyToken:(int)a3
{
  if (a3 != -1) {
    notify_cancel(a3);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end