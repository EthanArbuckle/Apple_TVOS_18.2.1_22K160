@interface RepairApplicationTask
- (void)main;
- (void)repair:(id)a3 needsToReleaseBlockingCallerWithReason:(id)a4;
- (void)repair:(id)a3 wantsToRelaunchApplication:(id)a4;
@end

@implementation RepairApplicationTask

- (void)main
{
  v3 = -[KeepAlive initWithName:]( objc_alloc(&OBJC_CLASS___KeepAlive),  "initWithName:",  @"com.apple.appstored.RepairRequest");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError bundleID](self->super._error, "bundleID"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError bundleID](self->super._error, "bundleID"));
    v8 = (ApplicationProxy *)objc_claimAutoreleasedReturnValue( +[ApplicationProxy proxyForBundleID:]( &OBJC_CLASS___ApplicationProxy,  "proxyForBundleID:",  v7));
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError bundlePath](self->super._error, "bundlePath"));

    if (!v9) {
      goto LABEL_27;
    }
    v10 = objc_alloc(&OBJC_CLASS___ApplicationProxy);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError bundlePath](self->super._error, "bundlePath"));
    v8 = -[ApplicationProxy initWithBundlePath:](v10, "initWithBundlePath:", v7);
  }

  v11 = v8;

  if (v11)
  {
    v12 = objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](v11, "bundleID"));
    v14 = -[LogKey initWithCategory:](v12, "initWithCategory:", v13);

    v15 = *(void **)&self->super._success;
    v63 = v11;
    v64 = v3;
    v62 = v14;
    if (v15) {
      goto LABEL_19;
    }
    if (+[ArcadeRepair shouldAttemptToRepairApplication:options:logKey:]( &OBJC_CLASS___ArcadeRepair,  "shouldAttemptToRepairApplication:options:logKey:",  v11,  self->super._error,  v14))
    {
      v16 = sub_1001BBD78((id *)objc_alloc(&OBJC_CLASS___ArcadeRepair), v11, self->super._error);
      v17 = *(void **)&self->super._success;
      *(void *)&self->super._success = v16;
    }

    v15 = *(void **)&self->super._success;
    if (v15) {
      goto LABEL_19;
    }
    if (+[VPPRepair shouldAttemptToRepairApplication:options:logKey:]( &OBJC_CLASS___VPPRepair,  "shouldAttemptToRepairApplication:options:logKey:",  v11,  self->super._error,  v14))
    {
      v18 = sub_1001D42BC((id *)objc_alloc(&OBJC_CLASS___VPPRepair), v11, self->super._error);
      v19 = *(void **)&self->super._success;
      *(void *)&self->super._success = v18;
    }

    v15 = *(void **)&self->super._success;
    if (v15) {
      goto LABEL_19;
    }
    if (+[FairPlayRepair shouldAttemptToRepairApplication:options:logKey:]( &OBJC_CLASS___FairPlayRepair,  "shouldAttemptToRepairApplication:options:logKey:",  v11,  self->super._error,  v14))
    {
      v20 = sub_100192404((id *)objc_alloc(&OBJC_CLASS___FairPlayRepair), v11, self->super._error);
      v21 = *(void **)&self->super._success;
      *(void *)&self->super._success = v20;
    }

    v15 = *(void **)&self->super._success;
    if (v15) {
      goto LABEL_19;
    }
    if (+[CodeSignatureVersionRepair shouldAttemptToRepairApplication:options:logKey:]( &OBJC_CLASS___CodeSignatureVersionRepair,  "shouldAttemptToRepairApplication:options:logKey:",  v11,  self->super._error,  v14))
    {
      v22 = objc_alloc(&OBJC_CLASS___CodeSignatureVersionRepair);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](v11, "bundleID"));
      v24 = sub_100321E68((id *)&v22->super.isa, v23, self->_applicationRepair);
      v25 = *(void **)&self->super._success;
      *(void *)&self->super._success = v24;
    }

    v15 = *(void **)&self->super._success;
    if (v15)
    {
LABEL_19:
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 repairType]);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472LL;
      v66[2] = sub_1002069A0;
      v66[3] = &unk_1003ECB10;
      v66[4] = self;
      v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 addObserverForName:@"RequestPresenterWillPresentUINotification" object:0 queue:0 usingBlock:v66]);
      [*(id *)&self->super._success setDelegate:self];
      [*(id *)&self->super._success setLogKey:v14];
      v29 = *(void **)&self->super._success;
      id v65 = 0LL;
      id v30 = [v29 repairApplication:v11 error:&v65];
      id v31 = v65;
      unsigned int v61 = [*(id *)&self->super._success fairPlayStatus];
      id v32 = v31;
      [*(id *)&self->super._success setDelegate:0];
      if (objc_getProperty(self, v33, 64LL, 1))
      {
        id Property = objc_getProperty(self, v34, 64LL, 1);
        v36 = *(void **)&self->super._success;
        v37 = v26;
        id v38 = Property;
        v39 = (void *)objc_claimAutoreleasedReturnValue([v36 repairedBundleIDs]);
        uint64_t v40 = ASDErrorWithSafeUserInfo(v32);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        (*((void (**)(id, id, void *, void *))Property + 2))(v38, v30, v39, v41);

        v26 = v37;
      }

      [v27 removeObserver:v28];

      v42 = v32;
    }

    else
    {
      uint64_t v55 = ASDLogHandleForCategory(28LL);
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "[%@] Could not find handler to repair application",  buf,  0xCu);
      }

      if (objc_getProperty(self, v57, 64LL, 1))
      {
        id v59 = objc_getProperty(self, v58, 64LL, 1);
        (*((void (**)(id, void, void, void))v59 + 2))(v59, 0LL, 0LL, 0LL);
      }

      uint64_t v60 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 542LL, 0LL, 0LL);
      id v32 = (id)objc_claimAutoreleasedReturnValue(v60);
      unsigned int v61 = 0;
      id v30 = 0LL;
      v42 = 0LL;
      v26 = @"Unknown";
    }

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v44 = v43 - v5;
    id v45 = v32;
    v46 = v26;
    v47 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v46, @"repairType");

    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSError exitReason](self->super._error, "exitReason")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v48, @"exitReason");

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v44));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v49, @"duration");

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v30));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v50, @"result");

    if (v61)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  v51,  @"fairPlayStatus");
    }

    if (v45)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue([v45 domain]);
      v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@-%ld",  v52,  [v45 code]));

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  v53,  @"repairError");
    }

    sub_10030F080((uint64_t)&OBJC_CLASS___Analytics, v47, 1LL);

    v3 = v64;
    goto LABEL_29;
  }

- (void)repair:(id)a3 wantsToRelaunchApplication:(id)a4
{
  id v5 = a4;
  v6 = (void *)sub_1001BF610(objc_alloc(&OBJC_CLASS___ApplicationContext), v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError relaunchOptions](self->super._error, "relaunchOptions"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100206A6C;
  v8[3] = &unk_1003E9CA8;
  v8[4] = self;
  [v6 launchApplicationWithOptions:v7 completionHandler:v8];
}

- (void)repair:(id)a3 needsToReleaseBlockingCallerWithReason:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (self && objc_getProperty(self, v6, 64LL, 1))
  {
    id Property = objc_getProperty(self, v8, 64LL, 1);
    (*((void (**)(id, void, void, id))Property + 2))(Property, 0LL, 0LL, v7);
    options = self->_options;
    self->_options = 0LL;
  }
}

- (void).cxx_destruct
{
}

@end