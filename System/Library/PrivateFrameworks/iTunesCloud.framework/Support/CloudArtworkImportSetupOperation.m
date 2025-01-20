@interface CloudArtworkImportSetupOperation
+ (CloudArtworkImportSetupOperation)sharedSetupOperation;
- (void)start;
@end

@implementation CloudArtworkImportSetupOperation

- (void)start
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = sub_1000C1020();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting up artwork cache directory.", buf, 2u);
  }

  id v22 = 0LL;
  unsigned __int8 v6 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v7 = v22;
  if ((v6 & 1) == 0)
  {
    v8 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v24 = v4;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Error creating directory. path=%{public}@ error=%{public}@",  buf,  0x16u);
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v2 enumeratorAtPath:v4]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 nextObject]);
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v11]);
      id v21 = v7;
      unsigned __int8 v13 = [v2 removeItemAtPath:v12 error:&v21];
      id v14 = v21;

      if ((v13 & 1) == 0)
      {
        v15 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v11]);
          *(_DWORD *)buf = 138543362;
          v24 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Error removing item path=%{public}@",  buf,  0xCu);
        }
      }

      uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 nextObject]);

      v11 = (void *)v17;
      id v7 = v14;
    }

    while (v17);
  }

  else
  {
    id v14 = v7;
  }

  v18 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Artwork cache setup complete.", buf, 2u);
  }

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CloudArtworkImportSetupOperation;
  -[CloudArtworkImportSetupOperation finishWithError:](&v20, "finishWithError:", v14);
}

+ (CloudArtworkImportSetupOperation)sharedSetupOperation
{
  if (qword_1001DB8A0 != -1) {
    dispatch_once(&qword_1001DB8A0, &stru_1001A6DE0);
  }
  return (CloudArtworkImportSetupOperation *)(id)qword_1001DB8A8;
}

@end