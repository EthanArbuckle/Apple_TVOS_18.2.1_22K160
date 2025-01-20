@interface ICContentTastePendingChangesCoordinator
- (BOOL)_savePendingChanges:(id)a3;
- (ICContentTastePendingChangesCoordinator)initWithConfiguration:(id)a3;
- (NSArray)pendingChanges;
- (id)_pendingChanges;
- (id)description;
- (void)_addPendingChangesForContentTasteUpdateOperation:(id)a3 invalidateLocalCache:(BOOL)a4;
- (void)_removePendingChangesForContentTasteUpdateOperation:(id)a3;
- (void)contentTasteUpdateOperation:(id)a3 finishedByInvalidatingCache:(BOOL)a4 error:(id)a5;
- (void)removePendingChanges;
@end

@implementation ICContentTastePendingChangesCoordinator

- (ICContentTastePendingChangesCoordinator)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___ICContentTastePendingChangesCoordinator;
  v5 = -[ICContentTastePendingChangesCoordinator init](&v28, "init");
  if (v5)
  {
    v6 = (ICConnectionConfiguration *)[v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentity]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 accountDSID]);
    v10 = (void *)v9;
    v11 = @"noDSID";
    if (v9) {
      v11 = (__CFString *)v9;
    }
    v12 = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu-ContentTastePendingChanges",  -[__CFString hash](v12, "hash")));
    name = v5->_name;
    v5->_name = (NSString *)v13;

    id v15 = -[__CFString hash](v12, "hash");
    id v16 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.itunescloudd.contenttastependingchanges.%ld", v15));
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentity]);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v19));

    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 pathForResourceFileOrFolder:25]);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.plist",  v5->_name));
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathComponent:v22]);
    pendingChangesPath = v5->_pendingChangesPath;
    v5->_pendingChangesPath = (NSString *)v23;

    v25 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v5->_pendingChangesPath;
      *(_DWORD *)buf = 138543618;
      v30 = v5;
      __int16 v31 = 2112;
      v32 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Creating new pending changes coordinator - path=%@",  buf,  0x16u);
    }
  }

  return v5;
}

- (void)contentTasteUpdateOperation:(id)a3 finishedByInvalidatingCache:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 138543618;
    v21 = self;
    __int16 v22 = 2112;
    uint64_t v23 = pendingChangesPath;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ addOrRemovePendingChange: - path=%@",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100066718;
  v15[3] = &unk_1001A3D28;
  id v16 = v9;
  dispatch_queue_t v17 = self;
  id v18 = v8;
  BOOL v19 = a4;
  id v13 = v8;
  id v14 = v9;
  dispatch_sync(queue, v15);
}

- (NSArray)pendingChanges
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000666C8;
  v10 = sub_1000666D8;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000666E0;
  v5[3] = &unk_1001A65D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)removePendingChanges
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000666BC;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountDSID]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %p [dsid=%@]",  v5,  self,  v7));

  return v8;
}

- (void)_addPendingChangesForContentTasteUpdateOperation:(id)a3 invalidateLocalCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requestItem]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 operationIdentifier]);
  id v9 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v44 = self;
    __int16 v45 = 2114;
    v46 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Adding pending changes for operation with operationIdentifier=%{public}@",  buf,  0x16u);
  }

  if (v7)
  {
    v41[0] = @"ContentTastePendingChangesCoordinatorContentTasteItemKey";
    v41[1] = @"ContentTastePendingChangesCoordinatorInvalidateCacheKey";
    v42[0] = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    v42[1] = v10;
    id v11 = (void **)v42;
    v12 = (const __CFString **)v41;
    uint64_t v13 = 2LL;
  }

  else
  {
    v39 = @"ContentTastePendingChangesCoordinatorInvalidateCacheKey";
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    v40 = v10;
    id v11 = &v40;
    v12 = &v39;
    uint64_t v13 = 1LL;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v12,  v13));

  v37[0] = @"ContentTastePendingChangesCoordinatorOperationIdentifierKey";
  v37[1] = @"ContentTastePendingChangesCoordinatorPendingChangesKey";
  v38[0] = v8;
  v38[1] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  2LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICContentTastePendingChangesCoordinator _pendingChanges](self, "_pendingChanges"));
  id v17 = [v16 mutableCopy];

  if (!v17)
  {
    id v18 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
LABEL_22:
    -[NSMutableArray addObject:](v18, "addObject:", v15, v28, v29);
    -[ICContentTastePendingChangesCoordinator _savePendingChanges:](self, "_savePendingChanges:", v18);
    goto LABEL_23;
  }

  objc_super v28 = v15;
  v29 = v14;
  v30 = v7;
  id v31 = v6;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v18 = (NSMutableArray *)v17;
  id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
  if (!v19)
  {
LABEL_15:

LABEL_20:
    v7 = v30;
    id v6 = v31;
    id v15 = v28;
    id v14 = v29;
    goto LABEL_22;
  }

  id v20 = v19;
  uint64_t v21 = *(void *)v33;
LABEL_9:
  uint64_t v22 = 0LL;
  while (1)
  {
    if (*(void *)v33 != v21) {
      objc_enumerationMutation(v18);
    }
    uint64_t v23 = *(void **)(*((void *)&v32 + 1) + 8 * v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v23,  "objectForKey:",  @"ContentTastePendingChangesCoordinatorOperationIdentifierKey",  v28,  v29));
    unsigned __int8 v25 = [v24 isEqualToString:v8];

    if ((v25 & 1) != 0) {
      break;
    }
    if (v20 == (id)++v22)
    {
      id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
      if (v20) {
        goto LABEL_9;
      }
      goto LABEL_15;
    }
  }

  id v26 = v23;

  if (!v26) {
    goto LABEL_20;
  }
  v27 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  id v6 = v31;
  id v15 = v28;
  id v14 = v29;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v44 = self;
    __int16 v45 = 2048;
    v46 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ we already have a pending change for this operation=%p",  buf,  0x16u);
  }

  v7 = v30;
LABEL_23:
}

- (void)_removePendingChangesForContentTasteUpdateOperation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 operationIdentifier]);
  id v6 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543618;
      unsigned __int8 v25 = self;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Removing pending changes for operation with operationIdentifier=%{public}@",  buf,  0x16u);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICContentTastePendingChangesCoordinator _pendingChanges](self, "_pendingChanges"));
    id v9 = [v8 mutableCopy];

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v6 = (os_log_s *)v9;
    id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    id v11 = v6;
    if (v10)
    {
      id v12 = v10;
      id v18 = v4;
      uint64_t v13 = *(void *)v20;
LABEL_6:
      uint64_t v14 = 0LL;
      while (1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v6);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
        id v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 objectForKey:@"ContentTastePendingChangesCoordinatorOperationIdentifierKey"]);
        unsigned __int8 v17 = [v16 isEqualToString:v5];

        if ((v17 & 1) != 0) {
          break;
        }
        if (v12 == (id)++v14)
        {
          id v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
          if (v12) {
            goto LABEL_6;
          }
          id v11 = v6;
          goto LABEL_15;
        }
      }

      id v11 = v15;

      if (v11)
      {
        -[os_log_s removeObject:](v6, "removeObject:", v11);
        -[ICContentTastePendingChangesCoordinator _savePendingChanges:](self, "_savePendingChanges:", v6);
LABEL_15:
        id v4 = v18;
        goto LABEL_16;
      }

      id v4 = v18;
    }

    else
    {
LABEL_16:
    }
  }

  else if (v7)
  {
    *(_DWORD *)buf = 138543618;
    unsigned __int8 v25 = self;
    __int16 v26 = 2048;
    id v27 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Not removing pending changes for operation %p as is no retry identifier",  buf,  0x16u);
  }
}

- (id)_pendingChanges
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 138543618;
    v30 = self;
    __int16 v31 = 2112;
    __int128 v32 = pendingChangesPath;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Retrieving pending changes - path=%@",  buf,  0x16u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v7 = [v6 fileExistsAtPath:self->_pendingChangesPath];

  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:",  self->_pendingChangesPath));
    if (v9)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v8);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v11);
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___ICCloudContentTasteUpdateItem, v15);
      id v18 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  v12,  v14,  v16,  objc_opt_class(&OBJC_CLASS___NSString, v17),  0LL);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v28 = 0LL;
      uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v19,  v9,  &v28));
      __int128 v21 = (NSString *)v28;

      if (!v20)
      {
        __int128 v22 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v30 = self;
          __int16 v31 = 2114;
          __int128 v32 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%{public}@ Failed to decode pending changes. err=%{public}@",  buf,  0x16u);
        }
      }
    }

    else
    {
      uint64_t v20 = (uint64_t)v5;
    }

    v5 = (void *)v20;
    if (!v20)
    {
      uint64_t v23 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = self->_pendingChangesPath;
        *(_DWORD *)buf = 138543618;
        v30 = self;
        __int16 v31 = 2114;
        __int128 v32 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}@ File exists at %{public}@ but we are unable to decode the changes. Clearing all pending changes",  buf,  0x16u);
      }

      -[ICContentTastePendingChangesCoordinator _savePendingChanges:](self, "_savePendingChanges:", 0LL);
      v5 = 0LL;
    }
  }

  if (v5) {
    unsigned __int8 v25 = v5;
  }
  else {
    unsigned __int8 v25 = &__NSArray0__struct;
  }
  id v26 = v25;

  return v26;
}

- (BOOL)_savePendingChanges:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 count];
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 138544130;
    uint64_t v15 = self;
    __int16 v16 = 2048;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v4;
    __int16 v20 = 2112;
    __int128 v21 = pendingChangesPath;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Saving pending changes [%lu], [%{public}@] - path=%@",  buf,  0x2Au);
  }

  if ([v4 count])
  {
    id v13 = 0LL;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v13));
    id v9 = v13;
    if (v8)
    {
      unsigned __int8 v10 = [v8 writeToFile:self->_pendingChangesPath atomically:1];
    }

    else
    {
      uint64_t v11 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = self;
        __int16 v16 = 2114;
        id v17 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@ Failed to encode pending changes. err=%{public}@",  buf,  0x16u);
      }

      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v10 = [v9 removeItemAtPath:self->_pendingChangesPath error:0];
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end