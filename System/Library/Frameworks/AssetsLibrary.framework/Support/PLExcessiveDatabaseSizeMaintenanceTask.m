@interface PLExcessiveDatabaseSizeMaintenanceTask
- (BOOL)isHistorySizeExcessiveWithPathManager:(id)a3;
- (BOOL)isOrphanedSceneClassificationsCountExcessiveWithPathManager:(id)a3;
- (BOOL)runTaskWithTransaction:(id)a3;
- (id)isHistorySizeExcessiveWithPathManager:(id)a3 error:(id *)a4;
- (void)_forceRebuildWithReason:(int64_t)a3 pathManager:(id)a4 transaction:(id)a5;
@end

@implementation PLExcessiveDatabaseSizeMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pathManager]);

  if (v6)
  {
    if (([v6 sqliteErrorIndicatorFileExists] & 1) == 0)
    {
      if (-[PLExcessiveDatabaseSizeMaintenanceTask isHistorySizeExcessiveWithPathManager:]( self,  "isHistorySizeExcessiveWithPathManager:",  v6))
      {
        v9 = self;
        uint64_t v10 = 16LL;
LABEL_10:
        -[PLExcessiveDatabaseSizeMaintenanceTask _forceRebuildWithReason:pathManager:transaction:]( v9,  "_forceRebuildWithReason:pathManager:transaction:",  v10,  v6,  v4);
        goto LABEL_11;
      }

      if (-[PLExcessiveDatabaseSizeMaintenanceTask isOrphanedSceneClassificationsCountExcessiveWithPathManager:]( self,  "isOrphanedSceneClassificationsCountExcessiveWithPathManager:",  v6))
      {
        v9 = self;
        uint64_t v10 = 20LL;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t Log = PLBackendGetLog(v7, v8);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Maintenance task: Failed to get path manager",  v14,  2u);
    }
  }

- (void)_forceRebuildWithReason:(int64_t)a3 pathManager:(id)a4 transaction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (+[PLRebuildJournalManager isEnabledWithPathManager:error:]( &OBJC_CLASS___PLRebuildJournalManager,  "isEnabledWithPathManager:error:",  v8,  0LL))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryServicesManager](self, "libraryServicesManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rebuildJournalManager]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000DFA8;
    v18[3] = &unk_100020F58;
    v19 = (os_log_s *)v8;
    int64_t v21 = a3;
    id v20 = v9;
    [v11 snapshotJournalsForPayloadClassIDs:0 withCompletionHandler:v18];

    v12 = v19;
  }

  else
  {
    id v13 = [v8 setSqliteErrorForRebuildReason:a3 allowsExit:0];
    uint64_t Log = PLBackendGetLog(v13, v14);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v8 libraryURL]);
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[PLFilePathDescription descriptionWithFileURL:]( &OBJC_CLASS___PLFilePathDescription,  "descriptionWithFileURL:",  v16));
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Maintenance task: Added rebuild flag for excessive persistent history size for library URL: %@",  buf,  0xCu);
    }
  }
}

- (BOOL)isHistorySizeExcessiveWithPathManager:(id)a3
{
  id v4 = a3;
  id v15 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[PLExcessiveDatabaseSizeMaintenanceTask isHistorySizeExcessiveWithPathManager:error:]( self,  "isHistorySizeExcessiveWithPathManager:error:",  v4,  &v15));
  id v6 = v15;
  id v8 = v6;
  if (v5)
  {
    unsigned __int8 v9 = [v5 BOOLValue];
  }

  else
  {
    uint64_t Log = PLBackendGetLog(v6, v7);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryURL]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PLFilePathDescription descriptionWithFileURL:]( &OBJC_CLASS___PLFilePathDescription,  "descriptionWithFileURL:",  v12));
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Maintenance task: Failed to determine history size for library URL %@. Error: %@",  buf,  0x16u);
    }

    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)isHistorySizeExcessiveWithPathManager:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!PLHasInternalDiagnostics()
    || (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults")),
        unsigned __int8 v8 = [v7 BOOLForKey:@"PLTriggerExcessiveHistorySizeRebuild"],
        v7,
        (v8 & 1) == 0))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 photosDatabasePath]);
    if (!v10)
    {
      NSErrorUserInfoKey v56 = NSDebugDescriptionErrorKey;
      v57 = @"databasePath is nil while checking for excessive history size";
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
      id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PLPhotosErrorDomain,  46518LL,  v28));

      if (a4)
      {
        id v13 = v13;
        unsigned __int8 v9 = 0LL;
        *a4 = v13;
      }

      else
      {
        unsigned __int8 v9 = 0LL;
      }

      goto LABEL_26;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v10, 0LL));
    uint64_t v44 = 0LL;
    v45 = &v44;
    uint64_t v46 = 0x3032000000LL;
    v47 = sub_10000DEEC;
    v48 = sub_10000DEFC;
    id v49 = 0LL;
    id v43 = 0LL;
    id obj = 0LL;
    unsigned int v12 = [v11 getResourceValue:&v43 forKey:NSURLFileSizeKey error:&obj];
    id v13 = v43;
    objc_storeStrong(&v49, obj);
    if (v12)
    {
      if ((unint64_t)[v13 unsignedLongLongValue] <= 0x140000000)
      {
        id v29 = (id)v45[5];
        unsigned __int8 v9 = &__kCFBooleanFalse;
LABEL_25:

        _Block_object_dispose(&v44, 8);
LABEL_26:

        goto LABEL_27;
      }

      uint64_t v38 = 0LL;
      v39 = &v38;
      uint64_t v40 = 0x2020000000LL;
      uint64_t v41 = 0LL;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 managedObjectContext]);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10000DF04;
      v34[3] = &unk_100020FA8;
      id v17 = v15;
      id v35 = v17;
      v36 = &v38;
      v37 = &v44;
      [v16 performBlockAndWait:v34];

      unint64_t v18 = v39[3];
      if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_23;
      }
      if (v18 <= 1) {
        unint64_t v18 = 1LL;
      }
      v39[3] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
      id v20 = (id *)(v45 + 5);
      id v33 = (id)v45[5];
      uint64_t v21 = (uint64_t)+[PLPersistentHistoryUtilities fetchApproximateHistoryRecordCountInLibrary:error:]( &OBJC_CLASS___PLPersistentHistoryUtilities,  "fetchApproximateHistoryRecordCountInLibrary:error:",  v19,  &v33);
      objc_storeStrong(v20, v33);

      if (v21 < 1)
      {
LABEL_23:
        unsigned __int8 v9 = 0LL;
      }

      else
      {
        unint64_t v22 = 10000 * v39[3];
        uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v21 >= v22));
        unsigned __int8 v9 = (void *)v23;
        if (v21 >= v22)
        {
          uint64_t Log = PLBackendGetLog(v23, v24);
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = v39[3];
            v32 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryURL]);
            v27 = (void *)objc_claimAutoreleasedReturnValue( +[PLFilePathDescription descriptionWithFileURL:]( &OBJC_CLASS___PLFilePathDescription,  "descriptionWithFileURL:",  v32));
            *(_DWORD *)buf = 134218498;
            uint64_t v51 = v21;
            __int16 v52 = 2048;
            uint64_t v53 = v31;
            __int16 v54 = 2112;
            v55 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Maintenance task: Excessive history found with history count: %llu, asset count: %llu in library URL: %@",  buf,  0x20u);
          }
        }
      }

      _Block_object_dispose(&v38, 8);
      id v29 = (id)v45[5];
      if (v9) {
        goto LABEL_25;
      }
    }

    else
    {
      id v29 = (id)v45[5];
    }

    if (a4)
    {
      id v29 = v29;
      unsigned __int8 v9 = 0LL;
      *a4 = v29;
    }

    else
    {
      unsigned __int8 v9 = 0LL;
    }

    goto LABEL_25;
  }

  unsigned __int8 v9 = &__kCFBooleanTrue;
LABEL_27:

  return v9;
}

- (BOOL)isOrphanedSceneClassificationsCountExcessiveWithPathManager:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000DCE4;
  v9[3] = &unk_100020F80;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  id v10 = v5;
  unsigned int v12 = &v13;
  id v6 = v4;
  id v11 = v6;
  [v5 performBlockAndWait:v9];
  char v7 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

@end