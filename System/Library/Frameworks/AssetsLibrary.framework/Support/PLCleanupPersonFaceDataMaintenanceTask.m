@interface PLCleanupPersonFaceDataMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLCleanupPersonFaceDataMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  unsigned __int8 v6 = [v5 isCloudPhotoLibraryEnabled];

  if ((v6 & 1) == 0)
  {
    uint64_t v29 = 0LL;
    v30 = &v29;
    uint64_t v31 = 0x3032000000LL;
    v32 = sub_10000A1A8;
    v33 = sub_10000A1B8;
    id v34 = 0LL;
    uint64_t v25 = 0LL;
    v26 = &v25;
    uint64_t v27 = 0x2020000000LL;
    uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10000A1C0;
    v24[3] = &unk_100020FA8;
    v24[4] = self;
    v24[5] = &v25;
    v24[6] = &v29;
    [v7 performBlockAndWait:v24];

    uint64_t v10 = v26[3];
    if (v10)
    {
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_13:
        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(&v29, 8);

        goto LABEL_14;
      }

      uint64_t Log = PLBackendGetLog(v8, v9);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (os_log_s *)v30[5];
        *(_DWORD *)buf = 138412290;
        v36 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Unable to fetch count of user library during periodic maintenance: %@",  buf,  0xCu);
      }
    }

    else
    {
      uint64_t v14 = PLBackendGetLog(v8, v9);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Deleting all person / face data due to user library contains 0 assets",  buf,  2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
      id v23 = 0LL;
      unsigned __int8 v17 = +[PLPerson resetAllInLibrary:error:]( &OBJC_CLASS___PLPerson,  "resetAllInLibrary:error:",  v16,  &v23);
      v12 = (os_log_s *)v23;

      if ((v17 & 1) == 0)
      {
        uint64_t v20 = PLBackendGetLog(v18, v19);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Maintenance task to reset persons failed with error: %@",  buf,  0xCu);
        }
      }
    }

    goto LABEL_13;
  }

@end