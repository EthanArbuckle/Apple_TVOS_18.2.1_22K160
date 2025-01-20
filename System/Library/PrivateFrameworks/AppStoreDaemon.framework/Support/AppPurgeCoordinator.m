@interface AppPurgeCoordinator
- (AppPurgeCoordinator)init;
- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5;
- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6;
- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5;
- (void)cacheInvalidated;
@end

@implementation AppPurgeCoordinator

- (AppPurgeCoordinator)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AppPurgeCoordinator;
  v2 = -[AppPurgeCoordinator init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[AppPurgeCoordinator cacheInvalidated](v2, "cacheInvalidated");
  }
  return v3;
}

- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  sub_10019FD84((uint64_t)self, v11);
  v12 = sub_1001A2B50((char *)self, v10, (char *)1, v9, v8);
  v13 = sub_1001A2B50((char *)self, v10, (char *)2, v9, v8);
  v14 = sub_1001A2B50((char *)self, v10, (char *)3, v9, v8);
  v15 = sub_1001A2B50((char *)self, v10, (char *)4, v9, v8);

  v22[0] = &off_10040BF20;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12));
  v23[0] = v16;
  v22[1] = &off_10040BF38;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v13));
  v23[1] = v17;
  v22[2] = &off_10040BF50;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v14));
  v23[2] = v18;
  v22[3] = &off_10040BF68;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15));
  v23[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  4LL));

  return v20;
}

- (void)cacheInvalidated
{
  v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v4 = ASDLogHandleForCategory(20LL);
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v72 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] cacheInvalidated ", buf, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  v50 = v3;
  v54 = v6;
  if (v6)
  {
    v51 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v7 = sub_10028EBEC((uint64_t)&OBJC_CLASS___LSEnumerator);
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(v7);
    id v8 = [obj countByEnumeratingWithState:&v60 objects:buf count:16];
    if (v8)
    {
      uint64_t v53 = *(void *)v61;
      *(void *)&__int128 v9 = 138412802LL;
      __int128 v49 = v9;
      do
      {
        id v55 = v8;
        for (i = 0LL; i != v55; i = (char *)i + 1)
        {
          if (*(void *)v61 != v53) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
          v12 = objc_autoreleasePoolPush();
          if (sub_10019FCA8((uint64_t)v54, v11))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue([v11 VPNPlugins]);
            BOOL v14 = [v13 count] == 0;

            if (v14)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue([v11 entitlements]);
              __int128 v58 = 0u;
              __int128 v59 = 0u;
              __int128 v56 = 0u;
              __int128 v57 = 0u;
              id v19 = [&off_10040DD20 countByEnumeratingWithState:&v56 objects:v70 count:16];
              if (v19)
              {
                uint64_t v20 = *(void *)v57;
                while (2)
                {
                  for (j = 0LL; j != v19; j = (char *)j + 1)
                  {
                    if (*(void *)v57 != v20) {
                      objc_enumerationMutation(&off_10040DD20);
                    }
                    uint64_t v22 = *(void *)(*((void *)&v56 + 1) + 8LL * (void)j);
                    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier", v49));
                    BOOL v24 = [v23 length] == 0;

                    if (!v24)
                    {
                      id v26 = objc_msgSend(v18, "objectForKey:ofClass:", v22, objc_opt_class(NSNumber, v25));
                      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
                      v29 = v27;
                      if (v27 && [v27 BOOLValue])
                      {
                        v33 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
                        -[NSArray addObject:](v51, "addObject:", v33);

                        uint64_t v34 = ASDLogHandleForCategory(20LL);
                        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                        {
                          v35 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
                          *(_DWORD *)v64 = v49;
                          v65 = v50;
                          __int16 v66 = 2114;
                          v67 = v35;
                          __int16 v68 = 2114;
                          uint64_t v69 = v22;
                          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "[%@] [%{public}@] Added to deny listed because of entitlement: %{public}@",  v64,  0x20u);
                        }

                        goto LABEL_33;
                      }

                      id v30 = objc_msgSend(v18, "objectForKey:ofClass:", v22, objc_opt_class(NSArray, v28));
                      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
                      v32 = v31;
                      if (v31 && -[os_log_s count](v31, "count"))
                      {
                        v36 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
                        -[NSArray addObject:](v51, "addObject:", v36);

                        uint64_t v37 = ASDLogHandleForCategory(20LL);
                        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
                        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                        {
                          v39 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
                          *(_DWORD *)v64 = v49;
                          v65 = v50;
                          __int16 v66 = 2114;
                          v67 = v39;
                          __int16 v68 = 2114;
                          uint64_t v69 = v22;
                          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "[%@] [%{public}@] Added to deny listed because of entitlement: %{public}@",  v64,  0x20u);
                        }

LABEL_33:
                        goto LABEL_34;
                      }
                    }
                  }

                  id v19 = [&off_10040DD20 countByEnumeratingWithState:&v56 objects:v70 count:16];
                  if (v19) {
                    continue;
                  }
                  break;
                }
              }
            }

            else
            {
              uint64_t v15 = ASDLogHandleForCategory(20LL);
              v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
                *(_DWORD *)v64 = 138412546;
                v65 = v50;
                __int16 v66 = 2114;
                v67 = v17;
                _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "[%@] [%{public}@] Added deny listed app with VPN plugin",  v64,  0x16u);
              }

              v18 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
              -[NSArray addObject:](v51, "addObject:", v18);
            }

- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5
{
  return (int64_t)-[AppPurgeCoordinator purgeableForVolume:urgency:override:client:]( self,  "purgeableForVolume:urgency:override:client:",  a3,  a4,  0LL,  a5);
}

- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v14 = objc_opt_class(self, v13);
  objc_opt_self(v14);
  if (sub_1002F8BE0((uint64_t)&OBJC_CLASS___AppDefaultsManager, @"OffloadUnusedApps", 0LL)
    && (id v15 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device),
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15),
        unsigned __int8 v17 = [v16 isHRNMode],
        v16,
        (v17 & 1) == 0))
  {
    id v19 = -[KeepAlive initWithName:]( objc_alloc(&OBJC_CLASS___KeepAlive),  "initWithName:",  @"com.apple.appstored.purge");
    uint64_t v20 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    id v21 = [v11 longLongValue];
    uint64_t v22 = ASDLogHandleForCategory(20LL);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v36 = v20;
      __int16 v37 = 2048;
      id v38 = v21;
      __int16 v39 = 2048;
      int64_t v40 = a4;
      __int16 v41 = 2114;
      id v42 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[%@] Offload started with desired purged: %{bytes}ld urgency: %ld for client: %{public}@",  buf,  0x2Au);
    }

    id v24 = [[ASDPurgeAppsRequestOptions alloc] initWithVolume:v10 urgency:a4];
    [v24 setPerformAvailablityCheck:0];
    [v24 setApps:0];
    [v24 setDesiredPurgeAmount:v11];
    [v24 setOffloadOnly:1];
    id v25 = sub_1001A2178(self, v24, v20, v12);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = ASDLogHandleForCategory(20LL);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v26 purgedApps]);
      id v29 = [v34 count];
      id v30 = v19;
      id v31 = [v11 longValue];
      id v32 = [v26 purgedSize];
      *(_DWORD *)buf = 138413314;
      v36 = v20;
      __int16 v37 = 2048;
      id v38 = v29;
      __int16 v39 = 2048;
      int64_t v40 = (int64_t)v31;
      id v19 = v30;
      __int16 v41 = 2048;
      id v42 = v32;
      __int16 v43 = 2114;
      id v44 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[%@] Offload complete with offloaded apps: %ld desired purged: %{bytes}ld total purged: %{bytes}ld for client: %{public}@",  buf,  0x34u);
    }

    id v18 = [v26 purgedSize];
  }

  else
  {
    id v18 = 0LL;
  }

  return (int64_t)v18;
}

- (void).cxx_destruct
{
}

@end