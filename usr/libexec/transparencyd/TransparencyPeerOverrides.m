@interface TransparencyPeerOverrides
- (NSMutableDictionary)storage;
- (TransparencyPeerOverrides)init;
- (id)listPeerOverrides;
- (void)applyPeerOverrides:(id)a3 peer:(id)a4;
- (void)clearPeerOverride:(id)a3 application:(id)a4;
- (void)setPeerOverride:(id)a3 application:(id)a4 state:(id)a5;
- (void)setStorage:(id)a3;
@end

@implementation TransparencyPeerOverrides

- (TransparencyPeerOverrides)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TransparencyPeerOverrides;
  v2 = -[TransparencyPeerOverrides init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[TransparencyPeerOverrides setStorage:](v2, "setStorage:", v3);
  }

  return v2;
}

- (void)setPeerOverride:(id)a3 application:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1002EEEB0 != -1) {
    dispatch_once(&qword_1002EEEB0, &stru_100289980);
  }
  v11 = (void *)qword_1002EEEB8;
  if (os_log_type_enabled((os_log_t)qword_1002EEEB8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2048;
    id v22 = [v10 uiStatus];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setPeerOverride %@ %@ %lu", buf, 0x20u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  objc_sync_enter(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  v16[0] = v8;
  v16[1] = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  [v14 setObject:v10 forKeyedSubscript:v15];

  objc_sync_exit(v13);
}

- (void)clearPeerOverride:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1002EEEB0 != -1) {
    dispatch_once(&qword_1002EEEB0, &stru_1002899A0);
  }
  id v8 = (os_log_s *)qword_1002EEEB8;
  if (os_log_type_enabled((os_log_t)qword_1002EEEB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "clearPeerOverride %@ %@", buf, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  objc_sync_enter(v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  v12[0] = v6;
  v12[1] = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  [v10 removeObjectForKey:v11];

  objc_sync_exit(v9);
}

- (id)listPeerOverrides
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  objc_sync_exit(v3);

  return v4;
}

- (void)applyPeerOverrides:(id)a3 peer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = os_variant_allows_internal_security_policies("com.apple.Transparency");
  if (v7)
  {
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uri]);
      if (v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 application]);

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue([v7 uri]);
          v30[0] = v11;
          v12 = (void *)objc_claimAutoreleasedReturnValue([v7 application]);
          v30[1] = v12;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));

          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
          objc_sync_enter(v14);
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v13]);
          BOOL v17 = v16 == 0LL;

          if (!v17)
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v13]);

            if (qword_1002EEEB0 != -1) {
              dispatch_once(&qword_1002EEEB0, &stru_1002899C0);
            }
            id v20 = (os_log_s *)(id)qword_1002EEEB8;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              id v21 = [v19 uiStatus];
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 uri]);
              v23 = (void *)objc_claimAutoreleasedReturnValue([v7 application]);
              int v24 = 134218498;
              id v25 = v21;
              __int16 v26 = 2112;
              v27 = v22;
              __int16 v28 = 2112;
              v29 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "applyPeerOverrides setting UI status %lu for %@, %@",  (uint8_t *)&v24,  0x20u);
            }

            objc_msgSend(v6, "setUiStatus:", objc_msgSend(v19, "uiStatus"));
          }

          objc_sync_exit(v14);
        }
      }
    }
  }
}

- (NSMutableDictionary)storage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end