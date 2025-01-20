@interface RequestStore
- (NSString)fileName;
- (OS_dispatch_queue)fileAccessQueue;
- (RequestStore)initWithFileName:(id)a3;
- (id)_filePath;
- (id)_pathWithFileName:(id)a3;
- (id)_retrieveFile;
- (id)items;
- (void)_deleteFile;
- (void)_storeFileWithItems:(id)a3;
- (void)clearCache;
- (void)setFileName:(id)a3;
- (void)storeItems:(id)a3;
@end

@implementation RequestStore

- (RequestStore)initWithFileName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RequestStore;
  v6 = -[RequestStore init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileName, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.AskPermission.RequestStore", 0LL);
    fileAccessQueue = v7->_fileAccessQueue;
    v7->_fileAccessQueue = (OS_dispatch_queue *)v8;
  }

  return v7;
}

- (void)clearCache
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class(self);
    id v5 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Clearing cache", buf, 0xCu);
  }

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RequestStore fileAccessQueue](self, "fileAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014CB8;
  block[3] = &unk_100030588;
  block[4] = self;
  dispatch_async(v6, block);
}

- (id)items
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_100014E8C;
  v15 = sub_100014E9C;
  id v16 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RequestStore fileAccessQueue](self, "fileAccessQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100014EA4;
  v10[3] = &unk_1000305B0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v3, v10);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v4) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (id)objc_opt_class(self);
    id v7 = [(id)v12[5] count];
    *(_DWORD *)buf = 138543618;
    id v18 = v6;
    __int16 v19 = 2048;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Fetching items. Count: %lu",  buf,  0x16u);
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)storeItems:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class(self);
    id v7 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Storing items to disk.", buf, 0xCu);
  }

  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RequestStore fileAccessQueue](self, "fileAccessQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001503C;
  v10[3] = &unk_1000305D8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)_deleteFile
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RequestStore fileAccessQueue](self, "fileAccessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStore fileName](self, "fileName"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStore _pathWithFileName:](self, "_pathWithFileName:", v4));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStore _filePath](self, "_filePath"));
    id v20 = 0LL;
    [v6 removeItemAtPath:v7 error:&v20];
    id v8 = v20;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    v10 = (void *)v9;
    if (v8)
    {
      if (!v9) {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      v12 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      id v22 = v12;
      __int16 v23 = 2114;
      id v24 = v8;
      id v13 = v12;
      v14 = "%{public}@: Error deleting file. Error: %{public}@";
      v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 22;
    }

    else
    {
      if (!v9) {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      __int16 v19 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v22 = v19;
      id v13 = v19;
      v14 = "%{public}@: Deleted file succesfully";
      v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 12;
    }

    _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);

LABEL_16:
    goto LABEL_17;
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = (id)objc_opt_class(self);
    id v18 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to get file path. File already deleted.",  buf,  0xCu);
  }

- (id)_filePath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStore fileName](self, "fileName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStore _pathWithFileName:](self, "_pathWithFileName:", v3));

  return v4;
}

- (id)_pathWithFileName:(id)a3
{
  id v4 = a3;
  id v5 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"AskPermission"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v10 = [v9 fileExistsAtPath:v8];

  if ((v10 & 1) != 0) {
    goto LABEL_12;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v11) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = (id)objc_opt_class(self);
    id v13 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Directory path doesn't exist",  buf,  0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v22 = 0LL;
  [v14 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v15 = v22;

  if (!v15)
  {
LABEL_12:
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v4]);
  }

  else
  {
    os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint32_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      id v24 = v18;
      __int16 v25 = 2114;
      id v26 = v15;
      id v19 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to create directory path. Error: %{public}@",  buf,  0x16u);
    }

    id v20 = 0LL;
  }

  return v20;
}

- (void)_storeFileWithItems:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RequestStore fileAccessQueue](self, "fileAccessQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStore _filePath](self, "_filePath"));
  if (v6)
  {
    id v26 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v4,  0LL,  &v26));
    id v8 = v26;
    if (!v7)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v13) {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v22 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543618;
        id v28 = v22;
        __int16 v29 = 2114;
        id v30 = v8;
        id v23 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@: Error serializing items. Error: %{public}@",  buf,  0x16u);
      }

      goto LABEL_22;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStore _filePath](self, "_filePath"));
    id v25 = v8;
    unsigned __int8 v10 = [v7 writeToFile:v9 options:1 error:&v25];
    id v11 = v25;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    id v13 = (void *)v12;
    if ((v10 & 1) != 0)
    {
      if (!v12) {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      id v15 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v28 = v15;
      id v16 = v15;
      uint32_t v17 = "%{public}@: Stored file succesfully";
      id v18 = v14;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      uint32_t v20 = 12;
    }

    else
    {
      if (!v12) {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      id v24 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      id v28 = v24;
      __int16 v29 = 2114;
      id v30 = v11;
      id v16 = v24;
      uint32_t v17 = "%{public}@: Error storing file. Error: %{public}@";
      id v18 = v14;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      uint32_t v20 = 22;
    }

    _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);

LABEL_21:
    id v8 = v11;
LABEL_22:

    goto LABEL_23;
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = (id)objc_opt_class(self);
    id v21 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to get file path",  buf,  0xCu);
  }

- (id)_retrieveFile
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RequestStore fileAccessQueue](self, "fileAccessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStore _filePath](self, "_filePath"));
  if (v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___NSData);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStore _filePath](self, "_filePath"));
    id v26 = 0LL;
    id v7 = -[NSData initWithContentsOfFile:options:error:](v5, "initWithContentsOfFile:options:error:", v6, 0LL, &v26);
    id v8 = v26;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    id v10 = (id)v9;
    if (v7)
    {
      if (!v9) {
        id v10 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        id v28 = v12;
        id v13 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Retrieved file succesfully",  buf,  0xCu);
      }

      id v25 = v8;
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v25));
      id v14 = v25;

      if (v14)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
        if (!v15) {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
        }
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint32_t v17 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138543362;
          id v28 = v17;
          id v18 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@: Error decoding file",  buf,  0xCu);
        }

        os_log_type_t v19 = 0LL;
        id v8 = v14;
      }

      else
      {
        id v10 = v10;
        id v8 = 0LL;
        os_log_type_t v19 = v10;
      }
    }

    else
    {
      if (!v9) {
        id v10 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543618;
        id v28 = v22;
        __int16 v29 = 2114;
        id v30 = v8;
        id v23 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}@: Error retrieving file. Error: %{public}@",  buf,  0x16u);
      }

      os_log_type_t v19 = 0LL;
    }
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      id v8 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = (id)objc_opt_class(self);
      id v20 = v28;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get file path", buf, 0xCu);
    }

    os_log_type_t v19 = 0LL;
  }

  return v19;
}

- (OS_dispatch_queue)fileAccessQueue
{
  return self->_fileAccessQueue;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end