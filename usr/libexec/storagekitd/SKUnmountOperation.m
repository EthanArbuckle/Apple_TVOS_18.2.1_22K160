@interface SKUnmountOperation
+ (BOOL)unmountWithDisk:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)_unmountWithDADisk:(id)a3;
- (BOOL)_unmountWithDisk:(id)a3 error:(id *)a4;
- (BOOL)unmountSnapshotsWithDisk:(id)a3 error:(id *)a4;
- (NSSet)disksToUnmount;
- (SKUnmountOperation)initWithDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5;
- (id)description;
- (id)newPerformOperation;
- (int64_t)defaultErrorCode;
- (void)setDisksToUnmount:(id)a3;
@end

@implementation SKUnmountOperation

- (SKUnmountOperation)initWithDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SKUnmountOperation;
  v9 = -[SKBaseDiskArbOperation initWithTarget:options:callbackBlock:]( &v20,  "initWithTarget:options:callbackBlock:",  v8,  a4,  a5);
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](v9, "options"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kSKAPFSDiskUnmountIgnoreGroup]);
    id v13 = -[SKBaseDiskArbOperation disksForOperationWithTarget:ignoreGroup:]( v10,  "disksForOperationWithTarget:ignoreGroup:",  v8,  sub_100012488(v12));
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    disksToUnmount = v10->_disksToUnmount;
    v10->_disksToUnmount = (NSSet *)v14;

    if (!-[SKBaseDiskArbOperation recursive](v10, "recursive"))
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___SKAPFSContainerDisk);
      if ((objc_opt_isKindOfClass(v8, v16) & 1) != 0)
      {
        if ([v8 isLiveFSAPFSDisk])
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](v10, "disksToUnmount"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 setByAddingObject:v8]);
          -[SKUnmountOperation setDisksToUnmount:](v10, "setDisksToUnmount:", v18);
        }
      }
    }
  }

  return v10;
}

+ (BOOL)unmountWithDisk:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v21 = v7;
  v9 = -[SKUnmountOperation initWithDisk:options:withCompletionBlock:]( objc_alloc(&OBJC_CLASS___SKUnmountOperation),  "initWithDisk:options:withCompletionBlock:",  v7,  v8,  0LL);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](v9, "disksToUnmount"));
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
    char v14 = 1;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v22 = 0LL;
        unsigned __int8 v17 = -[SKUnmountOperation _unmountWithDisk:error:](v9, "_unmountWithDisk:error:", v16, &v22);
        id v18 = v22;
        v19 = v18;
        v14 &= v17;
        if ((v17 & 1) == 0)
        {
          if (a5)
          {
            char v14 = 0;
            if (!*a5) {
              *a5 = v18;
            }
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v12);
  }

  else
  {
    char v14 = 1;
  }

  return v14;
}

- (BOOL)_unmountWithDADisk:(id)a3
{
  v4 = (__DADisk *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSKDiskUnmountOptionForce]);
  if ((sub_100012488(v6) & 1) != 0)
  {
    unsigned int v7 = 1;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSKAPFSDiskUnmountForce]);
    unsigned int v7 = sub_100012488(v9);
  }

  id v10 = sub_10000E2BC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    uint64_t v16 = v4;
    __int16 v17 = 1024;
    unsigned int v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Calling DADiskUnmount for %@, force=%d",  (uint8_t *)&v15,  0x12u);
  }

  if (v7) {
    DADiskUnmountOptions v12 = 0x80000;
  }
  else {
    DADiskUnmountOptions v12 = 0;
  }
  DADiskUnmount(v4, v12, (DADiskUnmountCallback)sub_1000196D4, self);
  BOOL v13 = -[SKBaseDiskArbOperation completeDiskArbOp](self, "completeDiskArbOp");

  return v13;
}

- (BOOL)unmountSnapshotsWithDisk:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v33 = 0LL;
  int v6 = getmntinfo_r_np(&v33, 2);
  if (v6 < 0)
  {
    if (a4)
    {
      NSErrorUserInfoKey v40 = NSDebugDescriptionErrorKey;
      v41 = @"getmntinfo failed";
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:userInfo:",  102LL));
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  else
  {
    unsigned int v7 = v6;
    v28 = a4;
    id v29 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 diskIdentifier]);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"@/dev/%@", v8));

    if (v7)
    {
      uint64_t v9 = 0LL;
      BOOL v10 = 0;
      unint64_t v11 = v7;
      uint64_t v12 = 1112LL;
      BOOL v13 = &APFSCancelContainerResize_ptr;
      while (1)
      {
        char v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  (char *)v33 + v12));
        if ([v14 hasSuffix:v31])
        {
          int v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue( [v13[112] fileURLWithFileSystemRepresentation:(char *)v33 + v12 - 1024 isDirectory:1 relativeToURL:0]);
          if (v15)
          {
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
            DADiskRef v17 = DADiskCreateFromVolumePath( kCFAllocatorDefault,  (DASessionRef)[v16 diskArbSession],  v15);

            if (v17)
            {
              unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v15, "path"));
              v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unmount of snapshot %@ from %@",  v14,  v18));
              -[SKBaseDiskArbOperation setCurrentOperationName:](self, "setCurrentOperationName:", v19);

              BOOL v13 = &APFSCancelContainerResize_ptr;
              if (!-[SKUnmountOperation _unmountWithDADisk:](self, "_unmountWithDADisk:", v17))
              {
                id v24 = sub_10000E2BC();
                __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v15, "path"));
                  *(_DWORD *)buf = 136315650;
                  v35 = "-[SKUnmountOperation unmountSnapshotsWithDisk:error:]";
                  __int16 v36 = 2112;
                  v37 = v14;
                  __int16 v38 = 2112;
                  v39 = v27;
                  _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s: Failed to unmount snapshot %@ from %@",  buf,  0x20u);
                }

                id v5 = v29;
                if (v28) {
                  id *v28 = -[SKBaseDiskArbOperation newDAError](self, "newDAError");
                }
                free(v33);

                goto LABEL_20;
              }
            }

            else
            {
              id v20 = sub_10000E2BC();
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                id v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v15, "path"));
                *(_DWORD *)buf = 136315394;
                v35 = "-[SKUnmountOperation unmountSnapshotsWithDisk:error:]";
                __int16 v36 = 2112;
                v37 = v22;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s: Failed to create DADisk from %@",  buf,  0x16u);

                BOOL v13 = &APFSCancelContainerResize_ptr;
              }
            }
          }
        }

        BOOL v10 = ++v9 >= v11;
        v12 += 2168LL;
        if (v11 == v9) {
          goto LABEL_19;
        }
      }
    }

    BOOL v10 = 1;
LABEL_19:
    free(v33);
    id v5 = v29;
LABEL_20:
  }

  return v10;
}

- (BOOL)_unmountWithDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mountPoint]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
  if ([v8 isEqualToString:kSKDiskTypeAPFSLV])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSKDiskMountOptionRecursive]);
    unsigned int v11 = sub_100012488(v10);

    if (v11 && !-[SKUnmountOperation unmountSnapshotsWithDisk:error:](self, "unmountSnapshotsWithDisk:error:", v6, a4)) {
      goto LABEL_17;
    }
    if (!v7) {
      goto LABEL_19;
    }
  }

  else
  {

    if (!v7)
    {
LABEL_19:
      BOOL v19 = 1;
      goto LABEL_20;
    }
  }

  [(id)objc_opt_class(self) storeMountState:v6];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
  if ([v12 isEqualToString:kSKDiskTypeAPFSLV]
    && [v6 isEncrypted]
    && ![v6 defaultEffaceable])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:kSKAPFSDiskUnmountDoNotLock]);
    unsigned int v23 = [v22 BOOLValue];

    if (!v23) {
      goto LABEL_11;
    }
    char v25 = 1;
    if (!fsctl( (const char *)[v7 fileSystemRepresentation], 0x80014A22uLL, &v25, 0)) {
      goto LABEL_11;
    }
    id v24 = sub_10000E2BC();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[SKUnmountOperation _unmountWithDisk:error:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "%s: Failed to stash crypto key for APFS LV, remount may fail.",  buf,  0xCu);
    }
  }

LABEL_11:
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Unmount of %@", v6));
  -[SKBaseDiskArbOperation setCurrentOperationName:](self, "setCurrentOperationName:", v13);

  char v14 = (void *)objc_claimAutoreleasedReturnValue([v6 daDisk]);
  unsigned int v15 = -[SKUnmountOperation _unmountWithDADisk:](self, "_unmountWithDADisk:", v14);

  if (v15)
  {
    -[SKBaseDiskArbOperation removeWithMountPoint:](self, "removeWithMountPoint:", v7);
    goto LABEL_19;
  }

  uint64_t v16 = (__DADisk *)objc_claimAutoreleasedReturnValue([v6 daDisk]);
  CFDictionaryRef v17 = DADiskCopyDescription(v16);

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v17,  "objectForKeyedSubscript:",  kDADiskDescriptionVolumePathKey));
  if (!v18)
  {

    goto LABEL_19;
  }

  if (a4) {
    *a4 = -[SKBaseDiskArbOperation newDAError](self, "newDAError");
  }

LABEL_17:
  BOOL v19 = 0;
LABEL_20:

  return v19;
}

- (id)newPerformOperation
{
  v3 = dispatch_group_create();
  if (-[SKBaseDiskArbOperation recursive](self, "recursive")
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](self, "disksToUnmount")),
        id v5 = [v4 count],
        v4,
        v5))
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v35 = 0u;
    __int128 v34 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](self, "disksToUnmount"));
    id v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v7)
    {
      id v8 = v7;
      id v9 = 0LL;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
          id v33 = 0LL;
          unsigned __int8 v13 = -[SKUnmountOperation _unmountWithDisk:error:](self, "_unmountWithDisk:error:", v12, &v33);
          id v14 = v33;
          unsigned int v15 = v14;
          if ((v13 & 1) == 0 && !v9) {
            id v9 = v14;
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }

      while (v8);
    }

    else
    {
      id v9 = 0LL;
    }

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](self, "disksToUnmount"));
    id v16 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          id v20 = v3;
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)j);
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
          unsigned int v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10001AEA0;
          block[3] = &unk_100044B50;
          block[4] = v21;
          v3 = v20;
          dispatch_group_async(v20, v23, block);
        }

        id v17 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
      }

      while (v17);
    }

    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    id v24 = v9;
    char v25 = v24;
  }

  else
  {
    char v25 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 119LL, 0LL));
    id v24 = 0LL;
  }

  return v25;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](self, "disksToUnmount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unmount Operation for %@ with %@",  v3,  v4));

  return v5;
}

- (int64_t)defaultErrorCode
{
  return 401LL;
}

- (NSSet)disksToUnmount
{
  return (NSSet *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDisksToUnmount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end