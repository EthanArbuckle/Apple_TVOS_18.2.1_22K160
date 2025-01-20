@interface CloudPendingChangesCoordinator
- (BOOL)_savePendingChanges:(id)a3;
- (CloudPendingChangesCoordinator)initWithConfiguration:(id)a3 prefix:(id)a4 loggable:(Class)a5;
- (ICConnectionConfiguration)configuration;
- (id)_pendingChanges;
- (void)addPendingChange:(id)a3;
- (void)processPendingChangesUsingLibrary:(id)a3;
- (void)removeAllPendingChanges;
- (void)removeAllPendingChangesWithCompletion:(id)a3;
@end

@implementation CloudPendingChangesCoordinator

- (CloudPendingChangesCoordinator)initWithConfiguration:(id)a3 prefix:(id)a4 loggable:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___CloudPendingChangesCoordinator;
  v10 = -[CloudPendingChangesCoordinator init](&v33, "init");
  if (v10)
  {
    v11 = (ICConnectionConfiguration *)[v8 copy];
    configuration = v10->_configuration;
    v10->_configuration = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-CloudPendingChanges",  v9));
    name = v10->_name;
    v10->_name = (NSString *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 userIdentity]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 accountDSID]);
    v17 = (void *)v16;
    v18 = @"noDSID";
    if (v16) {
      v18 = (__CFString *)v16;
    }
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.itunescloudd.pendingchanges.%@.%@",  v9,  v19));
    id v21 = v20;
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue([v8 userIdentity]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v24));

    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 pathForResourceFileOrFolder:25]);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.plist",  v10->_name));
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v26 stringByAppendingPathComponent:v27]);
    pendingChangesPath = v10->_pendingChangesPath;
    v10->_pendingChangesPath = (NSString *)v28;

    v10->_loggable = a5;
    v30 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = v10->_pendingChangesPath;
      *(_DWORD *)buf = 134218242;
      v35 = v10;
      __int16 v36 = 2112;
      v37 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "CloudPendingChangesCoordinator %p - Creating new coordinator - path=%@",  buf,  0x16u);
    }
  }

  return v10;
}

- (void)addPendingChange:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 134218242;
    v15 = self;
    __int16 v16 = 2112;
    v17 = pendingChangesPath;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CloudPendingChangesCoordinator %p - addPendingChange: - path=%@",  buf,  0x16u);
  }

  id v7 = objc_alloc(&OBJC_CLASS___MSVXPCTransaction);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-AddPendingChange",  self->_name));
  id v9 = [v7 initWithName:v8];

  [v9 beginTransaction];
  if ([v4 isPersistent])
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C0E94;
    block[3] = &unk_1001A5F78;
    block[4] = self;
    id v12 = v4;
    id v13 = v9;
    dispatch_async(queue, block);
  }

  else
  {
    [v9 endTransaction];
  }
}

- (void)processPendingChangesUsingLibrary:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryIdentifier]);
    *(_DWORD *)buf = 138543874;
    v18 = self;
    __int16 v19 = 2112;
    v20 = pendingChangesPath;
    __int16 v21 = 2112;
    dispatch_queue_t v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - processPendingChangesUsingLibrary - path=%@ - libraryIdentifier=%@",  buf,  0x20u);
  }

  id v8 = objc_alloc(&OBJC_CLASS___MSVXPCTransaction);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-ProcessPendingChanges",  self->_name));
  id v10 = [v8 initWithName:v9];

  [v10 beginTransaction];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C09A4;
  block[3] = &unk_1001A5F78;
  block[4] = self;
  id v15 = v4;
  id v16 = v10;
  id v12 = v10;
  id v13 = v4;
  dispatch_sync(queue, block);
}

- (void)removeAllPendingChangesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 134218242;
    v17 = self;
    __int16 v18 = 2112;
    __int16 v19 = pendingChangesPath;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CloudPendingChangesCoordinator %p - removeAllPendingChangesWithCompletion - path=%@",  buf,  0x16u);
  }

  id v7 = objc_alloc(&OBJC_CLASS___MSVXPCTransaction);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-RemoveAllPendingChanges",  self->_name));
  id v9 = [v7 initWithName:v8];

  [v9 beginTransaction];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C08F0;
  block[3] = &unk_1001A6C08;
  id v14 = v9;
  id v15 = v4;
  block[4] = self;
  id v11 = v9;
  id v12 = v4;
  dispatch_async(queue, block);
}

- (void)removeAllPendingChanges
{
}

- (id)_pendingChanges
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 134218242;
    __int16 v21 = self;
    __int16 v22 = 2112;
    v23 = pendingChangesPath;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CloudPendingChangesCoordinator %p - Retrieving pending changes - path=%@",  buf,  0x16u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v6 = [v5 fileExistsAtPath:self->_pendingChangesPath];

  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:",  self->_pendingChangesPath));
    if (v8)
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray, v7);
      id v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  objc_opt_class(&OBJC_CLASS___CloudLibraryOperation, v10),  0LL);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v19 = 0LL;
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v12,  v8,  &v19));
      id v14 = (CloudPendingChangesCoordinator *)v19;

      if (!v13)
      {
        id v16 = objc_msgSend((id)objc_opt_class(self->_loggable, v15), "logCategory");
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v21 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to decode pending changes. err=%{public}@",  buf,  0xCu);
        }
      }
    }

    else
    {
      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (BOOL)_savePendingChanges:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 count];
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 134218498;
    v17 = self;
    __int16 v18 = 2048;
    id v19 = v6;
    __int16 v20 = 2112;
    __int16 v21 = pendingChangesPath;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CloudPendingChangesCoordinator %p - Saving pending changes [%lu] - path=%@",  buf,  0x20u);
  }

  if ([v4 count])
  {
    id v15 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v15));
    uint64_t v10 = (CloudPendingChangesCoordinator *)v15;
    if (v8)
    {
      unsigned __int8 v11 = [v8 writeToFile:self->_pendingChangesPath atomically:1];
    }

    else
    {
      id v12 = objc_msgSend((id)objc_opt_class(self->_loggable, v9), "logCategory");
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to encode pending changes. err=%{public}@",  buf,  0xCu);
      }

      unsigned __int8 v11 = 0;
    }
  }

  else
  {
    uint64_t v10 = (CloudPendingChangesCoordinator *)objc_claimAutoreleasedReturnValue( +[NSFileManager defaultManager]( &OBJC_CLASS___NSFileManager,  "defaultManager"));
    unsigned __int8 v11 = -[CloudPendingChangesCoordinator removeItemAtPath:error:]( v10,  "removeItemAtPath:error:",  self->_pendingChangesPath,  0LL);
  }

  return v11;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end