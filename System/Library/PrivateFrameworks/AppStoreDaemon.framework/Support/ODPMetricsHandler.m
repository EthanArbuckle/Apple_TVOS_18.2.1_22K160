@interface ODPMetricsHandler
- (BOOL)shouldCollectMetrics;
- (id)deviceID;
- (id)getAppEventsWithError:(id *)a3;
- (id)logKey;
- (id)topic;
- (int64_t)appUsageType;
- (void)postMetrics;
- (void)recordDeletedBundleIDs:(id)a3;
- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4;
- (void)recordLaunches:(id)a3;
- (void)recordSupplementalAppMetricsEvents;
- (void)resetMetrics;
@end

@implementation ODPMetricsHandler

- (int64_t)appUsageType
{
  return 5LL;
}

- (id)deviceID
{
  id v3 = sub_1002F8DEC((uint64_t)&OBJC_CLASS___AppDefaultsManager, @"ODPDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

    sub_1002F8D94((uint64_t)&OBJC_CLASS___AppDefaultsManager, v4, @"ODPDeviceID");
    uint64_t v6 = ASDLogHandleForCategory(3LL);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = (id)objc_opt_class(self, v8);
      id v9 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Setting initial deviceID",  (uint8_t *)&v11,  0xCu);
    }
  }

  return v4;
}

- (id)getAppEventsWithError:(id *)a3
{
  if (!self) {
    return 0LL;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = sub_1002D3508(self, 1, a3);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(v6);
  id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v10);
        id v12 = objc_alloc_init(&OBJC_CLASS___ASDAppMetricsEvent);
        if (v11)
        {
          unsigned __int8 v13 = sub_1001E2698(v11, (uint64_t)@"event_type");
          objc_msgSend(v12, "setEventType:", sub_1001B60DC((uint64_t)AppMetricsEvent, v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForProperty:@"payload"]);
          [v12 setPayload:v14];

          id v15 = sub_1001E2598(v11, (uint64_t)@"has_been_posted");
        }

        else
        {
          objc_opt_self(&OBJC_CLASS___AppMetricsEvent);
          [v12 setEventType:3];
          [v12 setPayload:0];
          id v15 = 0LL;
        }

        [v12 setPosted:v15];
        [v5 addObject:v12];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v16 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v8 = v16;
    }

    while (v16);
  }

  return v5;
}

- (id)logKey
{
  logKey = self->_logKey;
  if (!logKey)
  {
    v4 = self->super._baseLogKey;
    v5 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(-[LogKey prependingCategory:](v4, "prependingCategory:", @"ODP"));
    id v6 = self->_logKey;
    self->_logKey = v5;

    logKey = self->_logKey;
  }

  return logKey;
}

- (void)postMetrics
{
  id v10 = 0LL;
  id v3 = sub_1002D3508(self, 0, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v10;
  if ([v4 count])
  {
    sub_1002D3B60(self, v4);
    uint64_t v6 = ASDLogHandleForCategory(3LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ODPMetricsHandler logKey](self, "logKey"));
      id v9 = [v4 count];
      *(_DWORD *)buf = 138412546;
      id v12 = v8;
      __int16 v13 = 2048;
      id v14 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "[%@] Posted %ld event(s) to AMSEngagement",  buf,  0x16u);
    }
  }

  -[ODPMetricsHandler resetMetrics](self, "resetMetrics");
}

- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v40 = a3;
  -[ODPMetricsHandler recordSupplementalAppMetricsEvents](self, "recordSupplementalAppMetricsEvents");
  objc_opt_self(&OBJC_CLASS___MetricsHandler);
  if (v4 <= 0x13 && ((1 << v4) & 0xF17FE) != 0)
  {
    v47 = self;
    unsigned int v46 = v4;
    BOOL v7 = v4 != 4 && v4 != 19;
    BOOL v42 = v7;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id obj = v40;
    id v45 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v52;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v52 != v44) {
            objc_enumerationMutation(obj);
          }
          currentApps = v47;
          if (v47) {
            currentApps = v47->super._currentApps;
          }
          id v10 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)v8);
          id v11 = currentApps;
          id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

          if (v12
            || (v13 = (void *)objc_claimAutoreleasedReturnValue( +[ApplicationProxy proxyForBundleID:]( &OBJC_CLASS___ApplicationProxy,  "proxyForBundleID:",  v10)),  id v12 = sub_1002C8134(objc_alloc(&OBJC_CLASS___AppMetadata), v13),  v13,  v12))
          {
            id v14 = sub_1002D43E4((id *)&v47->super.super.isa, v10, v12);
            id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            [v15 setObject:@"installs" forKeyedSubscript:@"eventType"];
            id v16 = sub_100271A54((uint64_t)&OBJC_CLASS___MetricsHandler, v46);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            if (v17) {
              [v15 setObject:v17 forKeyedSubscript:@"installType"];
            }
            [v15 setObject:v10 forKeyedSubscript:@"bundleId"];
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            __int128 v19 = sub_100271AB0((uint64_t)&OBJC_CLASS___MetricsHandler, v18);
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            [v15 setObject:v20 forKeyedSubscript:@"eventTime"];

            __int128 v21 = objc_alloc_init(&OBJC_CLASS___AppMetricsEvent);
            sub_1001B6248(v21, 5LL);
            sub_1001B6190(v21, v46);
            sub_1001B6140(v21, v10);
            sub_1001B62A4(v21, v15);
            sub_1001B61EC(v21, 1LL);
            sub_1001B62F4(v21, v42);
            [v43 addObject:v21];
            uint64_t v22 = ASDLogHandleForCategory(3LL);
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[ODPMetricsHandler logKey](v47, "logKey"));
              v25 = sub_1001AB5CC((uint64_t)&OBJC_CLASS___AppEvent, 1u);
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForProperty:@"short_version"]);
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v24;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v26;
              *(_WORD *)&buf[22] = 2114;
              v60 = (uint64_t (*)(uint64_t, uint64_t))v10;
              LOWORD(v61) = 2114;
              *(void *)((char *)&v61 + 2) = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] [%{public}@] Created app event with version: %{public}@",  buf,  0x2Au);
            }
          }

          else
          {
            uint64_t v28 = ASDLogHandleForCategory(3LL);
            id v12 = (id)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[ODPMetricsHandler logKey](v47, "logKey"));
              v30 = sub_1001AB5CC((uint64_t)&OBJC_CLASS___AppEvent, 1u);
              v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v29;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v31;
              *(_WORD *)&buf[22] = 2114;
              v60 = (uint64_t (*)(uint64_t, uint64_t))v10;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "[%@] [%{public}@] [%{public}@] App metadata not found",  buf,  0x20u);
            }
          }

          id v8 = (char *)v8 + 1;
        }

        while (v45 != v8);
        id v32 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
        id v45 = v32;
      }

      while (v32);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v60 = sub_1002D4768;
    *(void *)&__int128 v61 = sub_1002D4778;
    *((void *)&v61 + 1) = 0LL;
    id v33 = sub_1002B61EC((uint64_t)&OBJC_CLASS___AppUsageDatabaseStore);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_1002D4780;
    v48[3] = &unk_1003EDB48;
    id v35 = v43;
    id v49 = v35;
    v50 = buf;
    [v34 modifyUsingTransaction:v48];

    if (*(void *)(*(void *)&buf[8] + 40LL))
    {
      uint64_t v36 = ASDLogHandleForCategory(3LL);
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[ODPMetricsHandler logKey](v47, "logKey"));
        uint64_t v39 = *(void *)(*(void *)&buf[8] + 40LL);
        *(_DWORD *)v55 = 138412546;
        v56 = v38;
        __int16 v57 = 2114;
        uint64_t v58 = v39;
        _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "[%@] App install metrics event import resulted in error: %{public}@",  v55,  0x16u);
      }
    }

    if (v46 != 4 && v46 != 19) {
      sub_1002D3B60(v47, v35);
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)recordDeletedBundleIDs:(id)a3
{
  id v4 = a3;
  -[ODPMetricsHandler recordSupplementalAppMetricsEvents](self, "recordSupplementalAppMetricsEvents");
  id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = v4;
  id v37 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v42;
    do
    {
      id v5 = 0LL;
      do
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(obj);
        }
        if (self) {
          currentApps = self->super._currentApps;
        }
        else {
          currentApps = 0LL;
        }
        BOOL v7 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v5);
        id v8 = currentApps;
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v7));

        if (v9)
        {
          id v10 = sub_1002D43E4((id *)&self->super.super.isa, v7, v9);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          [v11 setObject:@"uninstalls" forKeyedSubscript:@"eventType"];
          [v11 setObject:v7 forKeyedSubscript:@"bundleId"];
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          __int16 v13 = sub_100271AB0((uint64_t)&OBJC_CLASS___MetricsHandler, v12);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          [v11 setObject:v14 forKeyedSubscript:@"eventTime"];

          id v15 = objc_alloc_init(&OBJC_CLASS___AppMetricsEvent);
          sub_1001B6248(v15, 5LL);
          sub_1001B6140(v15, v7);
          sub_1001B62A4(v15, v11);
          sub_1001B61EC(v15, 3LL);
          sub_1001B62F4(v15, 1LL);
          [v35 addObject:v15];
          uint64_t v16 = ASDLogHandleForCategory(3LL);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[ODPMetricsHandler logKey](self, "logKey"));
            __int128 v19 = sub_1001AB5CC((uint64_t)&OBJC_CLASS___AppEvent, 3u);
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:@"short_version"]);
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v18;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2114;
            v50 = (uint64_t (*)(uint64_t, uint64_t))v7;
            LOWORD(v51) = 2114;
            *(void *)((char *)&v51 + 2) = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] [%{public}@] Created app event with version: %{public}@",  buf,  0x2Au);
          }
        }

        else
        {
          uint64_t v22 = ASDLogHandleForCategory(3LL);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[ODPMetricsHandler logKey](self, "logKey"));
            v24 = sub_1001AB5CC((uint64_t)&OBJC_CLASS___AppEvent, 3u);
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v23;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2114;
            v50 = (uint64_t (*)(uint64_t, uint64_t))v7;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "[%@] [%{public}@] [%{public}@] App metadata not found",  buf,  0x20u);
          }
        }

        id v5 = (char *)v5 + 1;
      }

      while (v37 != v5);
      id v26 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
      id v37 = v26;
    }

    while (v26);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v50 = sub_1002D4768;
  *(void *)&__int128 v51 = sub_1002D4778;
  *((void *)&v51 + 1) = 0LL;
  id v27 = sub_1002B61EC((uint64_t)&OBJC_CLASS___AppUsageDatabaseStore);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1002D4D28;
  v38[3] = &unk_1003EDB48;
  id v29 = v35;
  id v39 = v29;
  id v40 = buf;
  [v28 modifyUsingTransaction:v38];

  if (*(void *)(*(void *)&buf[8] + 40LL))
  {
    uint64_t v30 = ASDLogHandleForCategory(3LL);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[ODPMetricsHandler logKey](self, "logKey"));
      uint64_t v33 = *(void *)(*(void *)&buf[8] + 40LL);
      *(_DWORD *)id v45 = 138412546;
      unsigned int v46 = v32;
      __int16 v47 = 2114;
      uint64_t v48 = v33;
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "[%@] App uninstall metrics event import resulted in error: %{public}@",  v45,  0x16u);
    }
  }

  sub_1002D3B60(self, v29);

  _Block_object_dispose(buf, 8);
}

- (void)recordLaunches:(id)a3
{
  id v5 = a3;
  id v49 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = v5;
  v55 = self;
  if (!self)
  {
    id v45 = 0LL;
    goto LABEL_40;
  }

  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id v48 = v6;
  id obj = v6;
  id v54 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (!v54) {
    goto LABEL_30;
  }
  uint64_t v53 = *(void *)v65;
  do
  {
    BOOL v7 = 0LL;
    do
    {
      if (*(void *)v65 != v53) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(id **)(*((void *)&v64 + 1) + 8LL * (void)v7);
      if (!v8)
      {
        uint64_t v22 = 0LL;
        goto LABEL_25;
      }

      id v9 = v8[5];
      if (v9)
      {
        id v10 = v55->super._currentApps;
        id v3 = v8[5];
        id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v3));
        if (v6)
        {
          BOOL v11 = 0;
          goto LABEL_19;
        }

        v56 = v10;
      }

      id v12 = v8[16];
      if (!v12)
      {
        if (!v9) {
          goto LABEL_26;
        }
        BOOL v11 = 1;
LABEL_18:
        id v10 = v56;
LABEL_19:

        v56 = v10;
        if (v11) {
          goto LABEL_26;
        }
LABEL_20:
        id v17 = v8[2];
        id v18 = v8[3];
        [v17 timeIntervalSinceDate:v18];
        double v20 = v19;

        if (v20 <= 1.0) {
          goto LABEL_26;
        }
        id v21 = v8[5];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:v21]);

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"foregroundEvents"]);
        }

        else
        {
          id v50 = v8[5];
          v24 = v55->super._currentApps;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v50));
          id v26 = sub_1002D43E4((id *)&v55->super.super.isa, v50, v25);
          id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

          [v27 setObject:@"launches" forKeyedSubscript:@"eventType"];
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          [v27 setObject:v23 forKeyedSubscript:@"foregroundEvents"];
          id v28 = v8[5];
          [v51 setObject:v27 forKeyedSubscript:v28];
        }

        id v29 = v8[3];
        uint64_t v30 = sub_100271AB0((uint64_t)&OBJC_CLASS___MetricsHandler, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

        id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 stringValue]);
        v69 = v32;
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
        v70 = v33;
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
        [v23 addObject:v34];

LABEL_25:
        goto LABEL_26;
      }

      __int16 v13 = v12;
      id v14 = v55->super._currentApps;
      id v15 = v8[16];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15));
      BOOL v11 = v16 == 0LL;

      if (v9) {
        goto LABEL_18;
      }
      if (v16) {
        goto LABEL_20;
      }
LABEL_26:
      BOOL v7 = (char *)v7 + 1;
    }

    while (v54 != v7);
    id v35 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
    id v54 = v35;
  }

  while (v35);
LABEL_30:

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v51 keyEnumerator]);
  id v38 = [v37 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v61;
    do
    {
      for (i = 0LL; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v61 != v40) {
          objc_enumerationMutation(v37);
        }
        __int128 v42 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
        __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v42, v48));
        if (v43)
        {
          __int128 v44 = objc_alloc_init(&OBJC_CLASS___AppMetricsEvent);
          sub_1001B6140(v44, v42);
          sub_1001B6248(v44, 5LL);
          sub_1001B61EC(v44, 2LL);
          sub_1001B62A4(v44, v43);
          [v36 addObject:v44];
        }
      }

      id v39 = [v37 countByEnumeratingWithState:&v60 objects:v68 count:16];
    }

    while (v39);
  }

  id v45 = [v36 copy];
  id v6 = v48;
LABEL_40:

  if ([v45 count])
  {
    [v49 addObjectsFromArray:v45];
    id v46 = sub_1002B61EC((uint64_t)&OBJC_CLASS___AppUsageDatabaseStore);
    __int16 v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_1002D5364;
    v57[3] = &unk_1003EC538;
    id v58 = v49;
    v59 = v55;
    [v47 modifyUsingTransaction:v57];
  }
}

- (void)recordSupplementalAppMetricsEvents
{
  id v3 = sub_100233450((uint64_t)&OBJC_CLASS___MetricsCoordinator, 5LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_1002D5620((uint64_t)self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ([v6 count])
  {
    id v7 = sub_1002B61EC((uint64_t)&OBJC_CLASS___AppUsageDatabaseStore);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1002D5668;
    v16[3] = &unk_1003EC538;
    id v17 = v6;
    id v18 = self;
    [v8 modifyUsingTransaction:v16];
  }

  sub_1002335E4((uint64_t)&OBJC_CLASS___MetricsCoordinator, 5LL);
  id v9 = sub_100233450((uint64_t)&OBJC_CLASS___MetricsCoordinator, 5LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  uint64_t v11 = ASDLogHandleForCategory(3LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ODPMetricsHandler logKey](self, "logKey"));
    if (v10)
    {
      [v10 timeIntervalSince1970];
      uint64_t v15 = (uint64_t)v14;
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    *(_DWORD *)buf = 138412546;
    double v20 = v13;
    __int16 v21 = 2048;
    uint64_t v22 = v15;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "[%@] Updated supplemental date to: %{time_t}ld",  buf,  0x16u);
  }
}

- (void)resetMetrics
{
  id v3 = sub_10023369C((uint64_t)&OBJC_CLASS___MetricsCoordinator, 5LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_100233450((uint64_t)&OBJC_CLASS___MetricsCoordinator, 5LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = ASDLogHandleForCategory(3LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ODPMetricsHandler logKey](self, "logKey"));
    if (v4)
    {
      [v4 timeIntervalSince1970];
      uint64_t v11 = (uint64_t)v10;
      if (v6)
      {
LABEL_4:
        [v6 timeIntervalSince1970];
        uint64_t v13 = (uint64_t)v12;
LABEL_5:
        *(_DWORD *)buf = 138412802;
        __int16 v21 = v9;
        __int16 v22 = 2048;
        uint64_t v23 = v11;
        __int16 v24 = 2048;
        uint64_t v25 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] Updated start date to: %{time_t}ld supplemental: %{time_t}ld",  buf,  0x20u);

        goto LABEL_6;
      }
    }

    else
    {
      uint64_t v11 = 0LL;
      if (v6) {
        goto LABEL_4;
      }
    }

    uint64_t v13 = 0LL;
    goto LABEL_5;
  }

- (BOOL)shouldCollectMetrics
{
  return 0;
}

- (id)topic
{
  return @"on_device_personalization";
}

- (void).cxx_destruct
{
}

@end