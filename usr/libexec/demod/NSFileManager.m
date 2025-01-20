@interface NSFileManager
- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5 correctOwnership:(BOOL)a6;
@end

@implementation NSFileManager

- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5 correctOwnership:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v10;
  v14 = (const char *)[v13 UTF8String];
  id v15 = v11;
  if (copyfile(v14, (const char *)[v15 UTF8String], 0, 0x1008000u))
  {
    id v23 = sub_10003A95C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100094C04((uint64_t)v13, (uint64_t)v15, v18);
    }
    id v20 = 0LL;
    v17 = 0LL;
    goto LABEL_20;
  }

  if (!v12)
  {
    v17 = 0LL;
    if (v6) {
      goto LABEL_5;
    }
LABEL_9:
    id v20 = 0LL;
    BOOL v21 = 1;
    goto LABEL_10;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithString:](&OBJC_CLASS___NSURL, "fileURLWithString:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 fileHash]);

  if (([v17 isEqualToData:v12] & 1) == 0)
  {
    id v24 = sub_10003A95C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v35 = v13;
      __int16 v36 = 2114;
      v37 = v17;
      __int16 v38 = 2114;
      id v39 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "File has been changed after device manifest generation: %{public}@ - Current hash:  %{public}@ - Expected hash:  %{public}@",  buf,  0x20u);
    }

    id v20 = 0LL;
    goto LABEL_20;
  }

  if (!v6) {
    goto LABEL_9;
  }
LABEL_5:
  v32[0] = NSFileOwnerAccountName;
  v32[1] = NSFileGroupOwnerAccountName;
  v33[0] = @"mobile";
  v33[1] = @"mobile";
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL));
  id v31 = 0LL;
  unsigned __int8 v19 = -[NSFileManager setAttributes:ofItemAtPath:error:](self, "setAttributes:ofItemAtPath:error:", v18, v15, &v31);
  id v20 = v31;
  if ((v19 & 1) == 0)
  {
    id v25 = sub_10003A95C();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100094B90((uint64_t)v13, v26);
    }

LABEL_20:
    if (!-[NSFileManager fileExistsAtPath:](self, "fileExistsAtPath:", v15))
    {
      BOOL v21 = 0;
      goto LABEL_10;
    }

    id v30 = v20;
    unsigned __int8 v27 = -[NSFileManager removeItemAtPath:error:](self, "removeItemAtPath:error:", v15, &v30);
    id v28 = v30;

    if ((v27 & 1) != 0)
    {
      BOOL v21 = 0;
      id v20 = v28;
      goto LABEL_10;
    }

    id v29 = sub_10003A95C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100094AE0((uint64_t)v15, v28, v18);
    }
    BOOL v21 = 0;
    id v20 = v28;
    goto LABEL_7;
  }

  BOOL v21 = 1;
LABEL_7:

LABEL_10:
  return v21;
}

@end