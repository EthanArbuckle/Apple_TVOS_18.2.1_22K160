@interface PLDeletePersistentHistoryMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
- (int64_t)daysOfHistoryToKeep;
- (int64_t)historyPercentThreshold;
- (void)deletePersistentHistoryWithContext:(id)a3;
@end

@implementation PLDeletePersistentHistoryMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000CCAC;
  v6[3] = &unk_1000211F0;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary", a3));
  v8 = self;
  id v4 = v7;
  [v4 performTransactionAndWait:v6];

  return 1;
}

- (void)deletePersistentHistoryWithContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[PLPersistentHistoryUtilities oldestTransactionWithContext:]( &OBJC_CLASS___PLPersistentHistoryUtilities,  "oldestTransactionWithContext:",  v4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PLPersistentHistoryUtilities newestTransactionWithContext:]( &OBJC_CLASS___PLPersistentHistoryUtilities,  "newestTransactionWithContext:",  v4));
  if (v7)
  {
    int64_t v8 = -[PLDeletePersistentHistoryMaintenanceTask daysOfHistoryToKeep](self, "daysOfHistoryToKeep");
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 timestamp]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v9,  (double)-v8 * 86400.0));

    int64_t v11 = -[PLDeletePersistentHistoryMaintenanceTask historyPercentThreshold](self, "historyPercentThreshold");
    uint64_t Log = PLBackendGetLog(v11, v12);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = PLDateToISO8160StringWithLocalTimeZone(v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      [v10 timeIntervalSinceNow];
      double v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_pl_prettyDescription"));
      v20 = v5;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_pl_prettyDescription"));
      *(_DWORD *)buf = 138413570;
      int64_t v42 = (int64_t)v16;
      __int16 v43 = 2048;
      double v44 = v18;
      __int16 v45 = 2048;
      int64_t v46 = v8;
      __int16 v47 = 2048;
      int64_t v48 = v11;
      __int16 v49 = 2112;
      v50 = v19;
      __int16 v51 = 2112;
      v52 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Delete Persistent History: Will delete before date %@ (%.1fs) (keeping %zd days before newest tx) when history p ercentage is > %zd%%, oldest and newest transactions:\n %@...\n %@",  buf,  0x3Eu);

      v5 = v20;
    }

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v23 = v22;
    id v40 = 0LL;
    unsigned int v24 = +[PLPersistentHistoryUtilities deleteHistoryBeforeDate:whenHistoryPercentageOfStoreIsGreaterThan:withContext:error:]( &OBJC_CLASS___PLPersistentHistoryUtilities,  "deleteHistoryBeforeDate:whenHistoryPercentageOfStoreIsGreaterThan:withContext:error:",  v10,  v11,  v4,  &v40);
    id v25 = v40;
    id v26 = +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    if (v24)
    {
      double v29 = v28;
      [v4 reset];
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[PLPersistentHistoryUtilities oldestTransactionWithContext:]( &OBJC_CLASS___PLPersistentHistoryUtilities,  "oldestTransactionWithContext:",  v4));
      v31 = [v30 transactionNumber];
      v32 = [v5 transactionNumber];
      uint64_t v34 = PLBackendGetLog(v32, v33);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        int64_t v36 = v31 - v32;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_pl_prettyDescription"));
        *(_DWORD *)buf = 134218498;
        int64_t v42 = v36;
        __int16 v43 = 2048;
        double v44 = v29 - v23;
        __int16 v45 = 2112;
        int64_t v46 = (int64_t)v37;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Delete Persistent History: Successfully deleted %llu transaction(s) in %.1fs. Current oldest transaction:\n %@",  buf,  0x20u);
      }
    }

    else
    {
      uint64_t v39 = PLBackendGetLog(v26, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v42 = (int64_t)v25;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v30,  OS_LOG_TYPE_ERROR,  "Delete Persistent History: Failed to delete persistent history: %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v38 = PLBackendGetLog(0LL, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_INFO,  "Delete Persistent History: Not deleting any history because there are no transactions",  buf,  2u);
    }
  }
}

- (int64_t)daysOfHistoryToKeep
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = [v2 integerForKey:@"persistentHistoryDaysToKeep"];

  if (!v3) {
    return 182LL;
  }
  uint64_t Log = PLBackendGetLog(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Delete Persistent History: Overriding persistent history days to keep from user defaults: %zd",  (uint8_t *)&v9,  0xCu);
  }

  return (int64_t)v3;
}

- (int64_t)historyPercentThreshold
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = [v2 integerForKey:@"persistentHistoryPercentThreshold"];

  if (!v3) {
    return 60LL;
  }
  uint64_t Log = PLBackendGetLog(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Delete Persistent History: Overriding persistent history percent threshold from user defaults: %zd",  (uint8_t *)&v9,  0xCu);
  }

  return (int64_t)v3;
}

@end