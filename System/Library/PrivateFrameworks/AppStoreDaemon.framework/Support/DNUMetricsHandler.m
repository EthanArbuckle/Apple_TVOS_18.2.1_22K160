@interface DNUMetricsHandler
- (BOOL)isCandidateAppMetadata:(id)a3;
- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4;
- (BOOL)shouldCollectMetrics;
- (id)logKey;
- (int64_t)appUsageType;
- (void)_recordCrashEventsSinceDate:(id)a3;
- (void)recordDeletedBundleIDs:(id)a3;
- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4;
- (void)recordSupplementalAppMetricsEvents;
@end

@implementation DNUMetricsHandler

- (int64_t)appUsageType
{
  return 2LL;
}

- (BOOL)isCandidateAppMetadata:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (sub_1002C8BF4(v4) & 1) == 0)
  {
    if (sub_1002C8CB4(v5))
    {
      id v8 = sub_1002613EC((uint64_t)&OBJC_CLASS___LaunchServicesCatalog);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v22 = 0LL;
      id v10 = sub_1002616E4((uint64_t)v9, &v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = v22;

      if (v12)
      {
        uint64_t v13 = ASDLogHandleForCategory(3LL);
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[DNUMetricsHandler logKey](self, "logKey"));
          *(_DWORD *)buf = 138412546;
          v24 = v18;
          __int16 v25 = 2114;
          id v26 = v12;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "[%@] Error looking up system apps. Error: %{public}@",  buf,  0x16u);
        }

        unsigned __int8 v6 = 0;
      }

      else
      {
        id v15 = sub_1002C860C(v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        unsigned __int8 v6 = [v11 containsObject:v16];

        uint64_t v17 = ASDLogHandleForCategory(3LL);
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[DNUMetricsHandler logKey](self, "logKey"));
          id v20 = sub_1002C860C(v5);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          *(_DWORD *)buf = 138412546;
          v24 = v19;
          __int16 v25 = 2114;
          id v26 = v21;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "[%@] [%{public}@] We have an eligible system app",  buf,  0x16u);
        }
      }
    }

    else
    {
      unsigned __int8 v6 = 1;
    }
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 isArcade];
  if (v7)
  {
    uint64_t v8 = ASDLogHandleForCategory(3LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_3;
    }
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[DNUMetricsHandler logKey](self, "logKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
    *(_DWORD *)buf = 138412546;
    v27 = v20;
    __int16 v28 = 2114;
    id v29 = v21;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[%@] [%{public}@] Skipping non candidate app",  buf,  0x16u);
LABEL_24:

    goto LABEL_3;
  }

  if (a4)
  {
    unsigned int v11 = 0;
  }

  else
  {
    id v12 = sub_1002613EC((uint64_t)&OBJC_CLASS___LaunchServicesCatalog);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v25 = 0LL;
    id v14 = sub_1002616E4((uint64_t)v13, &v25);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v25;

    if (v16)
    {
      uint64_t v17 = ASDLogHandleForCategory(3LL);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[DNUMetricsHandler logKey](self, "logKey"));
        *(_DWORD *)buf = 138412546;
        v27 = v24;
        __int16 v28 = 2114;
        id v29 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "[%@] Error looking up system apps. Error: %{public}@",  buf,  0x16u);
      }

      unsigned int v11 = 0;
    }

    else
    {
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
      unsigned int v11 = [v15 containsObject:v18];
    }
  }

  if (([v6 isStoreOriginated] & 1) == 0 && !v11
    || ([v6 isProfileValidated] & 1) != 0
    || [v6 hasMIDBasedSINF] && !objc_msgSend(v6, "isAppClip")
    || ([v6 isInstalled] & 1) == 0 && !objc_msgSend(v6, "isOffloaded"))
  {
    char v10 = 0;
    goto LABEL_22;
  }

  uint64_t v19 = ASDLogHandleForCategory(3LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[DNUMetricsHandler logKey](self, "logKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 shortVersionString]);
    *(_DWORD *)buf = 138412802;
    v27 = v20;
    __int16 v28 = 2114;
    id v29 = v21;
    __int16 v30 = 2114;
    v31 = v22;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[%@] [%{public}@] We have an eligible app with version: %{public}@",  buf,  0x20u);

    goto LABEL_24;
  }

- (id)logKey
{
  logKey = self->_logKey;
  if (!logKey)
  {
    id v4 = self->super._baseLogKey;
    v5 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(-[LogKey prependingCategory:](v4, "prependingCategory:", @"DNU"));
    id v6 = self->_logKey;
    self->_logKey = v5;

    logKey = self->_logKey;
  }

  return logKey;
}

- (void)recordSupplementalAppMetricsEvents
{
  v3 = sub_100233450((uint64_t)&OBJC_CLASS___MetricsCoordinator, 2LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    -[DNUMetricsHandler _recordCrashEventsSinceDate:](self, "_recordCrashEventsSinceDate:", v4);
  }

  else
  {
    uint64_t v5 = ASDLogHandleForCategory(3LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[DNUMetricsHandler logKey](self, "logKey"));
      int v15 = 138412290;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] Skipping due to lack of supplemental date",  (uint8_t *)&v15,  0xCu);
    }
  }

  sub_1002335E4((uint64_t)&OBJC_CLASS___MetricsCoordinator, 2LL);
  uint64_t v8 = sub_100233450((uint64_t)&OBJC_CLASS___MetricsCoordinator, 2LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  uint64_t v10 = ASDLogHandleForCategory(3LL);
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DNUMetricsHandler logKey](self, "logKey"));
    if (v9)
    {
      [v9 timeIntervalSince1970];
      uint64_t v14 = (uint64_t)v13;
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    int v15 = 138412546;
    id v16 = v12;
    __int16 v17 = 2048;
    uint64_t v18 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "[%@] Updated supplemental date to: %{time_t}ld",  (uint8_t *)&v15,  0x16u);
  }
}

- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  objc_opt_self(&OBJC_CLASS___MetricsHandler);
  if (v4 <= 0x13 && ((1 << v4) & 0xF17FE) != 0)
  {
    -[MetricsHandler recordAppEventsForBundleIDs:eventType:installType:]( self,  "recordAppEventsForBundleIDs:eventType:installType:",  v6,  1LL,  v4);
  }

  else
  {
    uint64_t v7 = ASDLogHandleForCategory(3LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DNUMetricsHandler logKey](self, "logKey"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] Skipping unsupported installType apps: [%{public}@]",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)recordDeletedBundleIDs:(id)a3
{
}

- (BOOL)shouldCollectMetrics
{
  return 0;
}

- (void)_recordCrashEventsSinceDate:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MetricsHandler getCrashEventsSinceDate:](self, "getCrashEventsSinceDate:", a3));
  id v5 = sub_1002B61EC((uint64_t)&OBJC_CLASS___AppUsageDatabaseStore);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001EFC5C;
  v8[3] = &unk_1003EC538;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  [v6 modifyUsingTransaction:v8];
}

- (void).cxx_destruct
{
}

@end