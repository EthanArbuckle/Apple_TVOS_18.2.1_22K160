@interface DiskSpaceManager
+ (BOOL)ensureAvailableDiskSpace:(int64_t)a3 atPath:(id)a4;
+ (int64_t)availableDiskSpaceAtPath:(id)a3;
+ (int64_t)recoverableDiskSpaceAtPath:(id)a3;
@end

@implementation DiskSpaceManager

+ (int64_t)availableDiskSpaceAtPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (([v5 fileExistsAtPath:v4] & 1) == 0)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 stringByDeletingLastPathComponent]);

    id v4 = (id)v6;
  }

  id v18 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesOfFileSystemForPath:v4 error:&v18]);
  id v8 = v18;
  v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0LL;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:NSFileSystemFreeSize]);
    int64_t v12 = (int64_t)[v13 unsignedLongLongValue];
  }

  else
  {
    if (qword_10032E150 != -1) {
      dispatch_once(&qword_10032E150, &stru_1002E7EC0);
    }
    v11 = (void *)qword_10032E108;
    if (os_log_type_enabled((os_log_t)qword_10032E108, OS_LOG_TYPE_ERROR))
    {
      v15 = v11;
      v16 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138543874;
      v20 = v16;
      __int16 v21 = 2114;
      id v22 = v4;
      __int16 v23 = 2114;
      v24 = v9;
      id v17 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[%{public}@] availableSpaceOnDiskAtPath:%{public}@ failed: %{public}@",  buf,  0x20u);
    }

    int64_t v12 = -1LL;
  }

  return v12;
}

+ (BOOL)ensureAvailableDiskSpace:(int64_t)a3 atPath:(id)a4
{
  id v6 = a4;
  id v7 = [a1 availableDiskSpaceAtPath:v6];
  if ((uint64_t)v7 < a3)
  {
    id v8 = v7;
    if (qword_10032E150 != -1) {
      dispatch_once(&qword_10032E150, &stru_1002E7EC0);
    }
    v9 = (void *)qword_10032E108;
    if (os_log_type_enabled((os_log_t)qword_10032E108, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = v9;
      *(_DWORD *)buf = 138543874;
      id v40 = (id)objc_opt_class(a1);
      __int16 v41 = 2048;
      v42 = v8;
      __int16 v43 = 2048;
      int64_t v44 = a3;
      id v11 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Free space (%lld) is less than required (%lld). Checking cache delete.",  buf,  0x20u);
    }

    v38[0] = v6;
    v37[0] = @"CACHE_DELETE_VOLUME";
    v37[1] = @"CACHE_DELETE_AMOUNT";
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    v37[2] = @"CACHE_DELETE_URGENCY";
    v38[1] = v12;
    v38[2] = &off_100302768;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));

    v14 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
    if ((uint64_t)v8 + (uint64_t)[v15 longLongValue] < a3)
    {
      if (qword_10032E150 != -1) {
        dispatch_once(&qword_10032E150, &stru_1002E7EC0);
      }
      v16 = (void *)qword_10032E108;
      if (os_log_type_enabled((os_log_t)qword_10032E108, OS_LOG_TYPE_ERROR)) {
        sub_10025D2EC(v16, (uint64_t)a1, (uint64_t)v15);
      }
      BOOL v17 = 0;
      goto LABEL_30;
    }

    if (qword_10032E150 != -1) {
      dispatch_once(&qword_10032E150, &stru_1002E7EC0);
    }
    id v18 = (void *)qword_10032E108;
    if (os_log_type_enabled((os_log_t)qword_10032E108, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138543618;
      id v40 = v20;
      __int16 v41 = 2114;
      v42 = v15;
      id v21 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Cache delete has %{public}@ recoverable bytes",  buf,  0x16u);
    }

    dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100027814;
    v33[3] = &unk_1002E7EA0;
    id v34 = v14;
    id v36 = a1;
    __int16 v23 = v22;
    v35 = v23;
    CacheDeletePurgeSpaceWithInfo(v13, v33);
    dispatch_time_t v24 = dispatch_time(0LL, 60000000000LL);
    if (dispatch_semaphore_wait(v23, v24) >= 1)
    {
      if (qword_10032E150 != -1) {
        dispatch_once(&qword_10032E150, &stru_1002E7EC0);
      }
      v25 = (void *)qword_10032E108;
      if (os_log_type_enabled((os_log_t)qword_10032E108, OS_LOG_TYPE_ERROR)) {
        sub_10025D3A8(v25, (uint64_t)a1);
      }
      id v26 = [a1 availableDiskSpaceAtPath:v6];
      if ((uint64_t)v26 <= a3)
      {
        BOOL v17 = 0;
        goto LABEL_29;
      }

      id v27 = v26;
      if (qword_10032E150 != -1) {
        dispatch_once(&qword_10032E150, &stru_1002E7EC0);
      }
      v28 = (void *)qword_10032E108;
      if (os_log_type_enabled((os_log_t)qword_10032E108, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        v30 = (void *)objc_opt_class(a1);
        *(_DWORD *)buf = 138543618;
        id v40 = v30;
        __int16 v41 = 2048;
        v42 = v27;
        id v31 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Enough space was recovered to proceed (now available: %lld)",  buf,  0x16u);
      }
    }

    BOOL v17 = 1;
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }

  BOOL v17 = 1;
LABEL_31:

  return v17;
}

+ (int64_t)recoverableDiskSpaceAtPath:(id)a3
{
  v9[0] = @"CACHE_DELETE_VOLUME";
  v9[1] = @"CACHE_DELETE_URGENCY";
  v10[0] = a3;
  v10[1] = &off_100302768;
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));

  v5 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
  id v7 = [v6 unsignedLongLongValue];

  return (int64_t)v7;
}

@end