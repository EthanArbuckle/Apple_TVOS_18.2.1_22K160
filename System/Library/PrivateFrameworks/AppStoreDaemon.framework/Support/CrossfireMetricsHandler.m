@interface CrossfireMetricsHandler
- (BOOL)includeClipDetails;
- (BOOL)isCandidateAppMetadata:(id)a3;
- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4;
- (BOOL)shouldCollectMetrics;
- (CrossfireMetricsHandler)init;
- (id)logKey;
- (int64_t)appUsageType;
- (void)_removeAppUsageSessionForBundleID:(id)a3;
- (void)recordDeletedBundleIDs:(id)a3;
- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4;
@end

@implementation CrossfireMetricsHandler

- (CrossfireMetricsHandler)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CrossfireMetricsHandler;
  v2 = -[CrossfireMetricsHandler init](&v4, "init");
  if (v2) {
    v2->_collectingMetrics = sub_10027356C((uint64_t)&OBJC_CLASS___Restrictions);
  }
  return v2;
}

- (int64_t)appUsageType
{
  return 1LL;
}

- (BOOL)includeClipDetails
{
  return 1;
}

- (BOOL)isCandidateAppMetadata:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[MetricsHandler shouldEnableSystemAppsForAppUsageType:](self, "shouldEnableSystemAppsForAppUsageType:", 1LL);
  if (((sub_1002C8C34(v4) & 1) != 0 || self->_collectingMetrics)
    && (sub_1002C8CB4(v4) ^ 1 | v5) == 1)
  {
    uint64_t v6 = ASDLogHandleForCategory(3LL);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CrossfireMetricsHandler logKey](self, "logKey"));
      id v11 = sub_1002C860C(v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = sub_1002C8CF4(v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      int v15 = 138412802;
      v16 = v10;
      __int16 v17 = 2114;
      v18 = v12;
      __int16 v19 = 2114;
      v20 = v14;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "[%@] We have eligible metadata: %{public}@ version: %{public}@",  (uint8_t *)&v15,  0x20u);
    }

    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4
{
  id v6 = a3;
  v7 = v6;
  if ((a4 || ([v6 isBeta] & 1) != 0 || self->_collectingMetrics)
    && [v7 isStoreOriginated]
    && (![v7 isProfileValidated] || objc_msgSend(v7, "isBeta"))
    && (![v7 hasMIDBasedSINF] || objc_msgSend(v7, "isAppClip"))
    && (([v7 isInstalled] & 1) != 0 || objc_msgSend(v7, "isOffloaded")))
  {
    uint64_t v8 = ASDLogHandleForCategory(3LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CrossfireMetricsHandler logKey](self, "logKey"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 shortVersionString]);
      int v15 = 138412802;
      v16 = v12;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2114;
      v20 = v14;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[%@] [%{public}@] We have an eligible app with version: %{public}@",  (uint8_t *)&v15,  0x20u);
    }

    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)logKey
{
  logKey = self->_logKey;
  if (!logKey)
  {
    id v4 = self->super._baseLogKey;
    unsigned int v5 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(-[LogKey prependingCategory:](v4, "prependingCategory:", @"Crossfire"));
    id v6 = self->_logKey;
    self->_logKey = v5;

    logKey = self->_logKey;
  }

  return logKey;
}

- (void)recordDeletedBundleIDs:(id)a3
{
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
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CrossfireMetricsHandler logKey](self, "logKey"));
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
      int v11 = 138412546;
      v12 = v9;
      __int16 v13 = 2114;
      v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] Skipping unsupported installType apps: [%{public}@]",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (BOOL)shouldCollectMetrics
{
  id v2 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  char v4 = [v3 isHRNMode] ^ 1;

  return v4;
}

- (void)_removeAppUsageSessionForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1002B61EC((uint64_t)&OBJC_CLASS___AppUsageDatabaseStore);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001EEB58;
  v8[3] = &unk_1003EC538;
  id v9 = v4;
  BOOL v10 = self;
  id v7 = v4;
  [v6 modifyUsingTransaction:v8];
}

- (void).cxx_destruct
{
}

@end