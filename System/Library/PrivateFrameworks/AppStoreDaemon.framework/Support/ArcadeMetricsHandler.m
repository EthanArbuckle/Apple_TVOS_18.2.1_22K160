@interface ArcadeMetricsHandler
- (BOOL)isCandidateAppMetadata:(id)a3;
- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4;
- (BOOL)shouldCollectMetrics;
- (id)logKey;
- (int64_t)_arcadeAppCount;
- (int64_t)appUsageType;
- (void)recordDeletedBundleIDs:(id)a3;
- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4;
@end

@implementation ArcadeMetricsHandler

- (int64_t)appUsageType
{
  return 3LL;
}

- (BOOL)isCandidateAppMetadata:(id)a3
{
  if (a3) {
    return sub_1002C8BF4(a3);
  }
  else {
    return 0;
  }
}

- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4
{
  id v4 = a3;
  BOOL v5 = [v4 isInstalled] && (objc_msgSend(v4, "isArcade") & 1) != 0;

  return v5;
}

- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4
{
  id v5 = a3;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v23 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSDatabaseContext sharedDatabaseContext](&OBJC_CLASS___LSDatabaseContext, "sharedDatabaseContext"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001DA1B4;
  v16[3] = &unk_1003EBCC8;
  id v7 = v5;
  id v17 = v7;
  v18 = self;
  v19 = &v20;
  [v6 accessUsingBlock:v16];

  if (v21[3] >= 1)
  {
    int64_t v8 = -[ArcadeMetricsHandler _arcadeAppCount](self, "_arcadeAppCount");
    uint64_t v9 = ASDLogHandleForCategory(3LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadeMetricsHandler logKey](self, "logKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", @", "));
      uint64_t v13 = v21[3];
      *(_DWORD *)buf = 138413058;
      v25 = v11;
      __int16 v26 = 2114;
      v27 = v12;
      __int16 v28 = 2048;
      uint64_t v29 = v13;
      __int16 v30 = 2048;
      int64_t v31 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%@] Apps installed [%{public}@] arcade install count: %ld arcade app count: %ld",  buf,  0x2Au);
    }

    if (v8 == v21[3])
    {
      id v14 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      sub_1002A8504((uint64_t)v15, @"Install", 1, &stru_1003EBD08);
    }
  }

  _Block_object_dispose(&v20, 8);
}

- (id)logKey
{
  logKey = self->_logKey;
  if (!logKey)
  {
    id v4 = self->super._baseLogKey;
    id v5 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(-[LogKey prependingCategory:](v4, "prependingCategory:", @"Arcade"));
    v6 = self->_logKey;
    self->_logKey = v5;

    logKey = self->_logKey;
  }

  return logKey;
}

- (void)recordDeletedBundleIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(3LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadeMetricsHandler logKey](self, "logKey"));
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", @", "));
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2114;
    v12 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[%@] Apps uninstalled: [%{public}@]",  (uint8_t *)&v9,  0x16u);
  }
}

- (BOOL)shouldCollectMetrics
{
  id v2 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  char v4 = [v3 isHRNMode] ^ 1;

  return v4;
}

- (int64_t)_arcadeAppCount
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001DA530;
  v4[3] = &unk_1003EBD30;
  v4[4] = self;
  v4[5] = &v5;
  +[ApplicationProxy enumerateApplicationsOfType:usingBlock:]( &OBJC_CLASS___ApplicationProxy,  "enumerateApplicationsOfType:usingBlock:",  0LL,  v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void).cxx_destruct
{
}

@end