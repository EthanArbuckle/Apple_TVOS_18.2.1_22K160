@interface WriteReceipt
+ (BOOL)writeReceiptData:(id)a3 forBundleURL:(id)a4 logKey:(id)a5 error:(id *)a6;
+ (BOOL)writeReceiptData:(id)a3 toURL:(id)a4 logKey:(id)a5 error:(id *)a6;
@end

@implementation WriteReceipt

+ (BOOL)writeReceiptData:(id)a3 forBundleURL:(id)a4 logKey:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v45 = 0LL;
  id v13 = [[LSApplicationRecord alloc] initWithURL:v11 allowPlaceholder:0 error:&v45];
  id v14 = v45;
  uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lib_receiptURL"));
  v16 = (void *)v15;
  if (v13) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid container for application: %@",  v11));
    uint64_t v19 = ASDErrorWithDescription(ASDErrorDomain, 507LL, v18);
    id v23 = (id)objc_claimAutoreleasedReturnValue(v19);

    BOOL v20 = 0;
  }

  else
  {
    id v36 = v11;
    v37 = a6;
    id v44 = v14;
    id v21 = a1;
    v34 = (void *)v15;
    id v38 = v12;
    unsigned __int8 v22 = [a1 writeReceiptData:v10 toURL:v15 logKey:v12 error:&v44];
    id v23 = v44;

    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v35 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v13 applicationExtensionRecords]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 allObjects]);

    id v26 = [v25 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v41;
      do
      {
        for (i = 0LL; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v41 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * (void)i), "lib_receiptURL"));
          if (v30)
          {
            if ((v22 & 1) != 0)
            {
              id v39 = v23;
              unsigned __int8 v22 = [v21 writeReceiptData:v10 toURL:v30 logKey:v38 error:&v39];
              id v31 = v10;
              id v32 = v39;

              id v23 = v32;
              id v10 = v31;
            }

            else
            {
              unsigned __int8 v22 = 0;
            }
          }
        }

        id v27 = [v25 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }

      while (v27);
    }

    BOOL v20 = v22 & 1;
    id v11 = v36;
    a6 = v37;
    id v12 = v38;
    v16 = v34;
    id v13 = v35;
  }

  if (a6 && !v20) {
    *a6 = v23;
  }

  return v20;
}

+ (BOOL)writeReceiptData:(id)a3 toURL:(id)a4 logKey:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v43[0] = NSFileOwnerAccountName;
  v43[1] = NSFileGroupOwnerAccountName;
  v44[0] = @"mobile";
  v44[1] = @"mobile";
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));
  if (qword_10032EDA8 != -1) {
    dispatch_once(&qword_10032EDA8, &stru_1002E9D10);
  }
  id v12 = (void *)qword_10032ED88;
  if (os_log_type_enabled((os_log_t)qword_10032ED88, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    *(_DWORD *)buf = 138543874;
    id v36 = v32;
    __int16 v37 = 2048;
    id v38 = [v8 length];
    __int16 v39 = 2114;
    id v40 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Writing receipt (%ld bytes) to %{public}@",  buf,  0x20u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByDeletingLastPathComponent]);
  if (!v14)
  {
    id v21 = 0LL;
LABEL_11:
    unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid container: %@",  v14));
    uint64_t v23 = ASDErrorWithDescription(ASDErrorDomain, 507LL, v22);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);

    id v19 = (id)v24;
    goto LABEL_12;
  }

  id v34 = 0LL;
  unsigned int v15 = [v10 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:v11 error:&v34];
  id v16 = v34;
  BOOL v17 = v16;
  if (!v15)
  {
    id v21 = v16;
    goto LABEL_11;
  }

  id v33 = v16;
  unsigned __int8 v18 = [v8 writeToURL:v9 options:1 error:&v33];
  id v19 = v33;

  if ((v18 & 1) != 0)
  {
    BOOL v20 = 1;
    goto LABEL_19;
  }

@end