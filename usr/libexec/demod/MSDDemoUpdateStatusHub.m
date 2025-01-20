@interface MSDDemoUpdateStatusHub
+ (id)sharedInstance;
- (BOOL)registerDemoUpdateStatusDelegate:(id)a3;
- (NSMutableSet)delegates;
- (void)demoUpdateCompleted:(id)a3;
- (void)demoUpdateFailed:(id)a3;
- (void)demoUpdateProgress:(int64_t)a3;
- (void)setDelegates:(id)a3;
- (void)unregisterDemoUpdateStatusDelegate:(id)a3;
@end

@implementation MSDDemoUpdateStatusHub

+ (id)sharedInstance
{
  if (qword_100125578 != -1) {
    dispatch_once(&qword_100125578, &stru_1000FA908);
  }
  return (id)qword_100125570;
}

- (BOOL)registerDemoUpdateStatusDelegate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v14 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10009F62C(v11, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_14;
  }

  if (([v4 conformsToProtocol:&OBJC_PROTOCOL___MSDDemoUpdateStatusDelegate] & 1) == 0)
  {
    id v22 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10009F660(v11, v23, v24, v25, v26, v27, v28, v29);
    }
LABEL_14:
    BOOL v8 = 0;
LABEL_8:

    goto LABEL_9;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](self, "delegates"));
  unsigned __int8 v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](self, "delegates"));
    [v9 addObject:v5];

    id v10 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](self, "delegates"));
      int v30 = 136315394;
      v31 = "-[MSDDemoUpdateStatusHub registerDemoUpdateStatusDelegate:]";
      __int16 v32 = 2048;
      id v33 = [v12 count];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Registed 1 delegate, delegate count = %tu",  (uint8_t *)&v30,  0x16u);
    }

    BOOL v8 = 1;
    goto LABEL_8;
  }

  BOOL v8 = 1;
LABEL_9:

  return v8;
}

- (void)unregisterDemoUpdateStatusDelegate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 conformsToProtocol:&OBJC_PROTOCOL___MSDDemoUpdateStatusDelegate])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](self, "delegates"));
    [v6 removeObject:v5];

    id v7 = sub_10003A95C();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](self, "delegates"));
      int v10 = 136315394;
      v11 = "-[MSDDemoUpdateStatusHub unregisterDemoUpdateStatusDelegate:]";
      __int16 v12 = 2048;
      id v13 = [v9 count];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Unregisted 1 delegate, delegate count = %tu",  (uint8_t *)&v10,  0x16u);
    }
  }
}

- (void)demoUpdateProgress:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "demoUpdateProgress: %td", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](v4, "delegates"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007FFAC;
  v8[3] = &unk_1000FA928;
  v8[4] = a3;
  [v7 enumerateObjectsUsingBlock:v8];

  objc_sync_exit(v4);
}

- (void)demoUpdateCompleted:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "demoUpdateCompleted.", buf, 2u);
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](v5, "delegates"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000800E4;
  v10[3] = &unk_1000FA950;
  id v9 = v4;
  id v11 = v9;
  [v8 enumerateObjectsUsingBlock:v10];

  objc_sync_exit(v5);
}

- (void)demoUpdateFailed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](v5, "delegates"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100080200;
  v9[3] = &unk_1000FA950;
  id v8 = v4;
  id v10 = v8;
  [v7 enumerateObjectsUsingBlock:v9];

  objc_sync_exit(v5);
}

- (NSMutableSet)delegates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDelegates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end