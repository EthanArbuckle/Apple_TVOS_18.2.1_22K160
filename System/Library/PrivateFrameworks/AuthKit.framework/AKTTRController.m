@interface AKTTRController
+ (id)generateRadarRequestFor:(unint64_t)a3;
+ (id)sharedController;
- (AKTTRController)init;
- (BOOL)shouldSuppressPushMessage:(id)a3;
- (void)_performSilentTTRForRequest:(id)a3 completion:(id)a4;
- (void)performSilentTTRFor:(unint64_t)a3 completion:(id)a4;
- (void)processPushMessage:(id)a3;
- (void)requestSilentTTRWithTitle:(id)a3 message:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywords:(id)a8 completion:(id)a9;
- (void)requestSilentTTRWithTitle:(id)a3 message:(id)a4 keywords:(id)a5 completion:(id)a6;
- (void)requestTapToRadarWithTitle:(id)a3 message:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywords:(id)a8;
- (void)requestTapToRadarWithTitle:(id)a3 message:(id)a4 keywords:(id)a5;
@end

@implementation AKTTRController

+ (id)sharedController
{
  if (qword_10020F710[0] != -1) {
    dispatch_once(qword_10020F710, &stru_1001CAC08);
  }
  return (id)qword_10020F708;
}

- (AKTTRController)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AKTTRController;
  return -[AKTTRController init](&v3, "init");
}

- (BOOL)shouldSuppressPushMessage:(id)a3
{
  if ([a3 command] != (id)1700) {
    return 0;
  }
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v4 = [v3 isInternalBuild];

  if ((v4 & 1) != 0) {
    return 0;
  }
  uint64_t v7 = _AKLogSystem(v5);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100141798();
  }

  return 1;
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)1700)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ttrinfo"]);

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"m"]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"cn"]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"cv"]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"cid"]);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"d"]);
      uint64_t v37 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IDMS has triggered TTR for a failure in %@ | %@ (%@) \n Title: %@ \n Message: %@",  v10,  v11,  v12,  v9,  v38));
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray, v13);
      id v15 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"k"]);
      if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0) {
        id v16 = v15;
      }
      else {
        id v16 = 0LL;
      }

      if (v16 && (v17 = (__CFString *)[v16 count]) != 0)
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 componentsJoinedByString:@","]);
        v18 = v17;
      }

      else
      {
        v18 = &stru_1001D1450;
      }

      uint64_t v19 = _AKLogSystem(v17);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10014182C((uint64_t)v9, v20, v21, v22, v23, v24, v25, v26);
      }

      if (v9 && v10 && v11 && v12)
      {
        v28 = (void *)v37;
        -[AKTTRController requestTapToRadarWithTitle:message:componentName:componentVersion:componentID:keywords:]( self,  "requestTapToRadarWithTitle:message:componentName:componentVersion:componentID:keywords:",  v9,  v37,  v10,  v11,  v12,  v18);
      }

      else if (v9)
      {
        v28 = (void *)v37;
        -[AKTTRController requestTapToRadarWithTitle:message:keywords:]( self,  "requestTapToRadarWithTitle:message:keywords:",  v9,  v37,  v18);
      }

      else
      {
        uint64_t v29 = _AKLogSystem(v27);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        v28 = (void *)v37;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_1001417C4(v37, v30, v31, v32, v33, v34, v35, v36);
        }
      }
    }
  }
}

- (void)requestTapToRadarWithTitle:(id)a3 message:(id)a4 keywords:(id)a5
{
}

- (void)requestTapToRadarWithTitle:(id)a3 message:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywords:(id)a8
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice", a3, a4, a5, a6, a7, a8));
  unsigned __int8 v9 = [v8 isInternalBuild];

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = _AKLogSystem(v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100141894();
    }
  }

+ (id)generateRadarRequestFor:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_super v3 = (void *)objc_opt_new(&OBJC_CLASS___AAFTapToRadarRequest);
    [v3 setRadarTitle:@"Silent authentication issue detected"];
    [v3 setRadarDescription:@"An issue was encountered while performing silent authentication for your device. Filing this radar will help determine what went wrong."];
    [v3 setComponentName:@"AuthKit"];
    [v3 setComponentID:@"621449"];
    [v3 setComponentVersion:@"All"];
  }

  else
  {
    objc_super v3 = 0LL;
  }

  return v3;
}

- (void)performSilentTTRFor:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v8 = [v7 isInternalBuild];

  if ((v8 & 1) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AKTTRController generateRadarRequestFor:]( &OBJC_CLASS___AKTTRController,  "generateRadarRequestFor:",  a3));
    -[AKTTRController _performSilentTTRForRequest:completion:](self, "_performSilentTTRForRequest:completion:", v10, v6);
  }

  else
  {
    uint64_t v11 = _AKLogSystem(v9);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100141894();
    }

    if (v6) {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
    }
  }
}

- (void)requestSilentTTRWithTitle:(id)a3 message:(id)a4 keywords:(id)a5 completion:(id)a6
{
}

- (void)requestSilentTTRWithTitle:(id)a3 message:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywords:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v23 = [v22 isInternalBuild];

  if ((v23 & 1) != 0)
  {
    uint64_t v25 = (void *)objc_opt_new(&OBJC_CLASS___AAFTapToRadarRequest);
    [v25 setRadarTitle:v15];
    [v25 setRadarDescription:v16];
    [v25 setComponentName:v17];
    [v25 setComponentID:v19];
    [v25 setComponentVersion:v18];
    [v25 setKeywords:v20];
    -[AKTTRController _performSilentTTRForRequest:completion:]( self,  "_performSilentTTRForRequest:completion:",  v25,  v21);
  }

  else
  {
    uint64_t v26 = _AKLogSystem(v24);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100141894();
    }

    if (v21) {
      (*((void (**)(id, void, void))v21 + 2))(v21, 0LL, 0LL);
    }
  }
}

- (void)_performSilentTTRForRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void (**)(void, void, void))v6;
  if (v5)
  {
    unsigned __int8 v8 = (void *)objc_opt_new(&OBJC_CLASS___AAFTapToRadarHelper);
    if ((objc_opt_respondsToSelector(v8, "silentTapToRadarWithRequest:completion:") & 1) != 0)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1000B3960;
      v10[3] = &unk_1001C8648;
      uint64_t v11 = v7;
      [v8 silentTapToRadarWithRequest:v5 completion:v10];
    }

    else if (v7)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKSilentTTRErrorDomain,  4LL,  0LL));
      ((void (**)(void, void, void *))v7)[2](v7, 0LL, v9);
    }

    goto LABEL_8;
  }

  if (v6)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKSilentTTRErrorDomain,  3LL,  0LL));
    ((void (**)(void, void, void *))v7)[2](v7, 0LL, v8);
LABEL_8:
  }
}

@end