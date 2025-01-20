@interface MetricsHandler
- (BOOL)includeClipDetails;
- (BOOL)isCandidateAppMetadata:(id)a3;
- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4;
- (BOOL)shouldCollectMetrics;
- (BOOL)shouldEnableSystemAppsForAppUsageType:(int64_t)a3;
- (Class)appEventEntityClass;
- (NSString)deviceID;
- (NSString)topic;
- (_TtC9appstored6LogKey)logKey;
- (id)createAppEventsForBundleIDs:(id)a3 eventType:(unsigned __int8)a4 installType:(unsigned __int8)a5 connection:(id)a6;
- (id)createAppEventsWithLaunchEvents:(id)a3;
- (id)getAppEventsWithError:(id *)a3;
- (id)getAppUsageSessionForBundleID:(id)a3;
- (id)getCrashEventsSinceDate:(id)a3;
- (int64_t)appUsageType;
- (void)recordAppEventsForBundleIDs:(id)a3 eventType:(unsigned __int8)a4 installType:(unsigned __int8)a5;
- (void)recordLaunches:(id)a3;
@end

@implementation MetricsHandler

- (Class)appEventEntityClass
{
  unint64_t v3 = (unint64_t)-[MetricsHandler appUsageType](self, "appUsageType") - 1;
  if (v3 <= 4 && ((0x1Du >> v3) & 1) != 0) {
    return (Class)(id)objc_opt_class(*off_1003EF518[v3], v2);
  }
  else {
    return (Class)0LL;
  }
}

- (id)createAppEventsForBundleIDs:(id)a3 eventType:(unsigned __int8)a4 installType:(unsigned __int8)a5 connection:(id)a6
{
  unsigned int v58 = a5;
  uint64_t v7 = a4;
  id v9 = a3;
  id v56 = a6;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[LSDatabaseContext sharedDatabaseContext](&OBJC_CLASS___LSDatabaseContext, "sharedDatabaseContext"));
  unsigned int v54 = [v55 startAccessingReturningError:0];
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id v10 = v9;
  id v64 = [v10 countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (v64)
  {
    uint64_t v63 = *(void *)v66;
    unsigned int v59 = v7;
    v60 = self;
    id v62 = v10;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v66 != v63) {
          objc_enumerationMutation(v10);
        }
        v12 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)v11);
        v13 = objc_autoreleasePoolPush();
        if ((_DWORD)v7 == 3)
        {
          if (self) {
            currentApps = self->_currentApps;
          }
          else {
            currentApps = 0LL;
          }
          v15 = currentApps;
          v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v12));
LABEL_13:
          v17 = v16;
LABEL_15:

          if (v17 && -[MetricsHandler isCandidateAppMetadata:](self, "isCandidateAppMetadata:", v17))
          {
            id v18 = sub_1001AAC98(objc_alloc(&OBJC_CLASS___AppEvent), v17);
            if (v18)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v7));
              [v18 setValue:v19 forProperty:@"event_type"];

              if ((_DWORD)v7 == 1)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v58));
                [v18 setValue:v20 forProperty:@"event_subtype"];
              }

              if (sub_1001ABF70(v18) && (id)-[MetricsHandler appUsageType](self, "appUsageType") == (id)1)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue( -[MetricsHandler getAppUsageSessionForBundleID:]( self,  "getAppUsageSessionForBundleID:",  v12));
                id v22 = sub_1001D2DC4(v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

                if (v23)
                {
                  id v24 = sub_1001D2DC4(v21);
                  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
                  [v18 setValue:v25 forProperty:@"device_vendor_id"];

                  uint64_t v26 = ASDLogHandleForCategory(3LL);
                  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                  {
                    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MetricsHandler logKey](self, "logKey"));
                    v29 = sub_1001AB5CC((uint64_t)&OBJC_CLASS___AppEvent, v7);
                    v57 = (void *)objc_claimAutoreleasedReturnValue(v29);
                    id v30 = sub_1001D2DC4(v21);
                    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
                    *(_DWORD *)buf = 138413058;
                    v70 = v28;
                    __int16 v71 = 2114;
                    v72 = v57;
                    __int16 v73 = 2114;
                    v74 = v12;
                    __int16 v75 = 2114;
                    uint64_t v76 = v31;
                    v32 = (void *)v31;
                    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "[%@] [%{public}@] [%{public}@] Using generated deviceVendorID: %{public}@",  buf,  0x2Au);

                    uint64_t v7 = v59;
                  }
                }

                id v10 = v62;
              }

              [v61 addObject:v18];
              uint64_t v33 = ASDLogHandleForCategory(3LL);
              v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[MetricsHandler logKey](self, "logKey"));
                v36 = sub_1001AB5CC((uint64_t)&OBJC_CLASS___AppEvent, v7);
                v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
                id v38 = sub_1002C860C(v17);
                v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
                v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForProperty:](v17, "valueForProperty:", @"short_version"));
                id v41 = sub_1002C8BAC(v17);
                v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
                *(_DWORD *)buf = 138413314;
                v70 = v35;
                __int16 v71 = 2114;
                v72 = v37;
                __int16 v73 = 2114;
                v74 = v39;
                __int16 v75 = 2114;
                uint64_t v76 = (uint64_t)v40;
                __int16 v77 = 2114;
                v78 = v42;
                _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] [%{public}@] Created app event with version: %{public}@ bundleVersion: %{public}@",  buf,  0x34u);

                self = v60;
                uint64_t v7 = v59;

                id v10 = v62;
              }
            }
          }

          else
          {
            uint64_t v43 = ASDLogHandleForCategory(3LL);
            id v18 = (id)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(-[MetricsHandler logKey](v60, "logKey"));
              v45 = sub_1001AB5CC((uint64_t)&OBJC_CLASS___AppEvent, v7);
              v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
              *(_DWORD *)buf = 138413058;
              v70 = v44;
              __int16 v71 = 2114;
              v72 = v46;
              __int16 v73 = 2114;
              v74 = v12;
              __int16 v75 = 1024;
              LODWORD(v76) = v17 == 0LL;
              self = v60;
              _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEBUG,  "[%@] [%{public}@] [%{public}@] Not creating event for non-candidate app hasMetadata: %{BOOL}d",  buf,  0x26u);

              id v10 = v62;
            }
          }

          goto LABEL_35;
        }

        v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[ApplicationProxy proxyForBundleID:]( &OBJC_CLASS___ApplicationProxy,  "proxyForBundleID:",  v12));
        if (!v15)
        {
          v17 = 0LL;
          goto LABEL_15;
        }

        if (-[MetricsHandler isCandidateAppProxy:isMetadataLookup:]( self,  "isCandidateAppProxy:isMetadataLookup:",  v15,  0LL))
        {
          v16 = (NSDictionary *)sub_1002C8134(objc_alloc(&OBJC_CLASS___AppMetadata), v15);
          goto LABEL_13;
        }

        uint64_t v47 = ASDLogHandleForCategory(3LL);
        id v18 = (id)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[MetricsHandler logKey](self, "logKey"));
          v49 = sub_1001AB5CC((uint64_t)&OBJC_CLASS___AppEvent, v7);
          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
          *(_DWORD *)buf = 138412802;
          v70 = v48;
          __int16 v71 = 2114;
          v72 = v50;
          __int16 v73 = 2114;
          v74 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] [%{public}@] Not creating app event for non-candidate",  buf,  0x20u);

          id v10 = v62;
        }

        v17 = v15;
LABEL_35:

        objc_autoreleasePoolPop(v13);
        v11 = (char *)v11 + 1;
      }

      while (v64 != v11);
      id v51 = [v10 countByEnumeratingWithState:&v65 objects:v79 count:16];
      id v64 = v51;
    }

    while (v51);
  }

  if (v54) {
    [v55 stopAccessing];
  }
  id v52 = [v61 copy];

  return v52;
}

- (id)createAppEventsWithLaunchEvents:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v6 = v4;
  id v55 = [v6 countByEnumeratingWithState:&v56 objects:v72 count:16];
  if (v55)
  {
    uint64_t v8 = *(void *)v57;
    *(void *)&__int128 v7 = 138412546LL;
    __int128 v50 = v7;
    id v51 = v6;
    id v52 = v5;
    uint64_t v54 = *(void *)v57;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v57 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)v9);
        if (self) {
          currentApps = self->_currentApps;
        }
        else {
          currentApps = 0LL;
        }
        v12 = currentApps;
        if (v10) {
          v13 = (void *)v10[5];
        }
        else {
          v13 = 0LL;
        }
        id v14 = v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v14));

        if (!v15)
        {
          uint64_t v38 = ASDLogHandleForCategory(3LL);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_35;
          }
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MetricsHandler logKey](self, "logKey"));
          if (v10) {
            v40 = (void *)v10[5];
          }
          else {
            v40 = 0LL;
          }
          id v41 = v40;
          *(_DWORD *)buf = v50;
          v61 = v39;
          __int16 v62 = 2114;
          id v63 = v41;
          v42 = v17;
          uint64_t v43 = "[%@] [%{public}@] Could not find app metadata";
LABEL_40:
          _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, v43, buf, 0x16u);

          goto LABEL_35;
        }

        if (!-[MetricsHandler isCandidateAppMetadata:](self, "isCandidateAppMetadata:", v15))
        {
          uint64_t v44 = ASDLogHandleForCategory(3LL);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_35;
          }
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MetricsHandler logKey](self, "logKey"));
          if (v10) {
            v45 = (void *)v10[5];
          }
          else {
            v45 = 0LL;
          }
          id v41 = v45;
          *(_DWORD *)buf = v50;
          v61 = v39;
          __int16 v62 = 2114;
          id v63 = v41;
          v42 = v17;
          uint64_t v43 = "[%@] [%{public}@] Skipping non candidate app";
          goto LABEL_40;
        }

        v16 = (os_log_s *)sub_1001AAC98(objc_alloc(&OBJC_CLASS___AppEvent), v15);
        v17 = v16;
        if (v16)
        {
          -[os_log_s setValue:forProperty:](v16, "setValue:forProperty:", &off_10040CCB8, @"event_type");
          if (v10)
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v10[18]));
            -[os_log_s setValue:forProperty:](v17, "setValue:forProperty:", v18, @"usage_time");

            v19 = (void *)v10[3];
          }

          else
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 0LL));
            -[os_log_s setValue:forProperty:](v17, "setValue:forProperty:", v46, @"usage_time");

            v19 = 0LL;
          }

          id v20 = v19;

          if (v20)
          {
            if (v10) {
              v21 = (void *)v10[3];
            }
            else {
              v21 = 0LL;
            }
            id v22 = v21;
            -[os_log_s setValue:forProperty:](v17, "setValue:forProperty:", v22, @"launch_time");
          }

          if (v10) {
            v23 = (void *)v10[2];
          }
          else {
            v23 = 0LL;
          }
          id v24 = v23;

          if (v24)
          {
            if (v10) {
              v25 = (void *)v10[2];
            }
            else {
              v25 = 0LL;
            }
            id v26 = v25;
            -[os_log_s setValue:forProperty:](v17, "setValue:forProperty:", v26, @"launch_end_time");
          }

          -[MetricsHandler includeClipDetails](self, "includeClipDetails", v50);
          [v5 addObject:v17];
          uint64_t v27 = ASDLogHandleForCategory(3LL);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(-[MetricsHandler logKey](self, "logKey"));
            v29 = sub_1001AB5CC((uint64_t)&OBJC_CLASS___AppEvent, 2u);
            id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
            id v31 = sub_1002C860C(v15);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForProperty:@"short_version"]);
            id v34 = sub_1002C8BAC(v15);
            uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
            v36 = (void *)v35;
            if (v10) {
              uint64_t v37 = v10[18];
            }
            else {
              uint64_t v37 = 0LL;
            }
            *(_DWORD *)buf = 138413570;
            v61 = v53;
            __int16 v62 = 2114;
            id v63 = v30;
            __int16 v64 = 2114;
            __int128 v65 = v32;
            __int16 v66 = 2114;
            __int128 v67 = v33;
            __int16 v68 = 2114;
            uint64_t v69 = v35;
            __int16 v70 = 2048;
            uint64_t v71 = v37;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] [%{public}@] Created app event with version: %{public}@ bundleVersion: %{public}@ duration: %lld",  buf,  0x3Eu);

            id v6 = v51;
            v5 = v52;
          }

          uint64_t v8 = v54;
        }

- (NSString)deviceID
{
  return 0LL;
}

- (id)getAppEventsWithError:(id *)a3
{
  return 0LL;
}

- (id)getAppUsageSessionForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0LL;
  v28 = (id *)&v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_100272A08;
  id v31 = sub_100272A18;
  id v32 = 0LL;
  id v5 = sub_1002B61EC((uint64_t)&OBJC_CLASS___AppUsageDatabaseStore);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100272A20;
  v24[3] = &unk_1003EF410;
  id v7 = v4;
  id v25 = v7;
  id v26 = &v27;
  [v6 readUsingSession:v24];

  id v8 = v28[5];
  if (!v8 || sub_1001D2E54(v8))
  {
    uint64_t v9 = ASDLogHandleForCategory(3LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MetricsHandler logKey](self, "logKey"));
      int v12 = sub_1001D2E54(v28[5]);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 1024;
      int v34 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] Creating fresh app usage session entity. Was expired: %d",  buf,  0x1Cu);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    LOBYTE(v34) = 0;
    v13 = sub_1001D2C28(objc_alloc(&OBJC_CLASS___AppUsageSession), v7);
    id v14 = sub_1002B61EC((uint64_t)&OBJC_CLASS___AppUsageDatabaseStore);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100272B54;
    v19[3] = &unk_1003EF438;
    v23 = buf;
    id v16 = v13;
    id v20 = v16;
    v21 = self;
    id v22 = v7;
    [v15 modifyUsingTransaction:v19];

    if (*(_BYTE *)(*(void *)&buf[8] + 24LL)) {
      objc_storeStrong(v28 + 5, v13);
    }

    _Block_object_dispose(buf, 8);
  }

  id v17 = v28[5];

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (id)getCrashEventsSinceDate:(id)a3
{
  if (a3)
  {
    unint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v4 = -[NSMutableArray copy](v3, "copy");
  }

  else
  {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

- (BOOL)includeClipDetails
{
  return 0;
}

- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4
{
  return 0;
}

- (BOOL)isCandidateAppMetadata:(id)a3
{
  return 0;
}

- (_TtC9appstored6LogKey)logKey
{
  return 0LL;
}

- (void)recordAppEventsForBundleIDs:(id)a3 eventType:(unsigned __int8)a4 installType:(unsigned __int8)a5
{
  id v12 = a3;
  id v8 = -[MetricsHandler appEventEntityClass](self, "appEventEntityClass");
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = sub_1002B61EC((uint64_t)&OBJC_CLASS___AppUsageDatabaseStore);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100272EF0;
    v13[3] = &unk_1003EF460;
    v13[4] = self;
    unsigned __int8 v16 = a4;
    unsigned __int8 v17 = a5;
    id v14 = v12;
    v15 = v9;
    [v11 modifyUsingTransaction:v13];
  }
}

- (void)recordLaunches:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MetricsHandler createAppEventsWithLaunchEvents:](self, "createAppEventsWithLaunchEvents:", a3));
  if ([v6 count])
  {
    id v4 = sub_1002B61EC((uint64_t)&OBJC_CLASS___AppUsageDatabaseStore);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100273138;
    v7[3] = &unk_1003EC538;
    id v8 = v6;
    uint64_t v9 = self;
    [v5 modifyUsingTransaction:v7];
  }
}

- (BOOL)shouldCollectMetrics
{
  return 0;
}

- (BOOL)shouldEnableSystemAppsForAppUsageType:(int64_t)a3
{
  if (a3 == 1)
  {
    id v8 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v5 = v4;
    if (v4)
    {
      id v6 = @"crossfire-deletable-system-apps-enabled";
      uint64_t v7 = 0LL;
      goto LABEL_7;
    }

- (NSString)topic
{
  return 0LL;
}

- (int64_t)appUsageType
{
  return self->_appUsageType;
}

- (void).cxx_destruct
{
}

@end