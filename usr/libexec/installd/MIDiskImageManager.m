@interface MIDiskImageManager
+ (id)sharedInstance;
- (BOOL)URLIsOnKnownImageMount:(id)a3;
- (BOOL)_isKnownPath:(id)a3;
- (BOOL)_removeMountPath:(id)a3;
- (BOOL)bundleIDIsOnKnownImageMount:(id)a3;
- (MIDiskImageManager)init;
- (NSMutableDictionary)mountInfo;
- (NSSet)diskImageAppBundleIDs;
- (NSSet)diskMountPaths;
- (NSString)pendingMountPath;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)lsRegisterQueue;
- (OS_dispatch_queue)mountInfoAccessQueue;
- (id)_mountInfoForPath:(id)a3;
- (id)_onQueue_scanApps:(id)a3 returnMapInfo:(id *)a4;
- (id)diskImageAppInfoForBundleID:(id)a3;
- (void)_addMountPath:(id)a3 withInfo:(id)a4;
- (void)_clearPendingMountPath;
- (void)_initializeMountInfoFromStorage;
- (void)_onQueue_configureMountInfoForPaths:(id)a3;
- (void)_onQueue_registerDiscoveredAppEntries:(id)a3 onMountPoint:(id)a4 completion:(id)a5;
- (void)_onQueue_saveMountPaths;
- (void)_setPendingMountPath:(id)a3;
- (void)registerContentsAtMountPoint:(id)a3 completion:(id)a4;
- (void)reregisterContentsAtMountPoint:(id)a3;
- (void)resetMountPaths;
- (void)setMountInfo:(id)a3;
- (void)setPendingMountPath:(id)a3;
- (void)unregisterContentsAtMountPoint:(id)a3 completion:(id)a4;
@end

@implementation MIDiskImageManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010388;
  block[3] = &unk_100080BC0;
  block[4] = a1;
  if (qword_100095AE8 != -1) {
    dispatch_once(&qword_100095AE8, block);
  }
  return (id)qword_100095AE0;
}

- (void)_initializeMountInfoFromStorage
{
  id v3 = sub_1000105E8();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v18 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v4,  &v18));
  id v6 = v18;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"DiskImageMountPaths"]);
    objc_opt_class(&OBJC_CLASS___NSArray);
    id v9 = v8;
    if ((objc_opt_isKindOfClass(v9) & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0LL;
    }

    if (v10)
    {
      objc_opt_class(&OBJC_CLASS___NSString);
      if (sub_100013434(v10))
      {
        v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10001064C;
        block[3] = &unk_100080ED0;
        block[4] = self;
        id v10 = v10;
        id v17 = v10;
        dispatch_sync(v13, block);

LABEL_19:
        goto LABEL_20;
      }
    }

    uint64_t v14 = qword_100095BF8;
LABEL_18:
    MOLogWrite(v14);
    goto LABEL_19;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
  if ([v11 isEqualToString:NSCocoaErrorDomain])
  {
    id v12 = [v7 code];

    if (v12 == (id)260) {
      goto LABEL_20;
    }
  }

  else
  {
  }

  uint64_t v15 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v4 path]);
    uint64_t v14 = v15;
    goto LABEL_18;
  }

- (MIDiskImageManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MIDiskImageManager;
  v2 = -[MIDiskImageManager init](&v16, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MobileInstallation.MIDiskImageManager.internal", v4);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MobileInstallation.DiskImageManager.lsregister", v8);
    lsRegisterQueue = v2->_lsRegisterQueue;
    v2->_lsRegisterQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MobileInstallation.MIDiskImageManager.mountInfo", v12);
    mountInfoAccessQueue = v2->_mountInfoAccessQueue;
    v2->_mountInfoAccessQueue = (OS_dispatch_queue *)v13;

    -[MIDiskImageManager _initializeMountInfoFromStorage](v2, "_initializeMountInfoFromStorage");
  }

  return v2;
}

- (void)resetMountPaths
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000107B0;
  block[3] = &unk_100080BE8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onQueue_saveMountPaths
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfo](self, "mountInfo"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);

  id v6 = sub_1000105E8();
  dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if ([v5 count])
  {
    id v17 = @"DiskImageMountPaths";
    id v18 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    id v15 = 0LL;
    unsigned __int8 v9 = objc_msgSend(v8, "MI_writeToURL:format:options:error:", v7, 200, 268435457, &v15);
    id v10 = v15;
    if ((v9 & 1) == 0)
    {
      uint64_t v11 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
        MOLogWrite(v11);
      }
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    id v16 = 0LL;
    unsigned __int8 v13 = [v12 removeItemAtURL:v7 error:&v16];
    id v10 = v16;
  }
}

- (id)_mountInfoForPath:(id)a3
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", a3, 1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _bundleIDMapForAppsInDirectory:v3]);

  return v5;
}

- (void)_onQueue_configureMountInfoForPaths:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", @"Applications", (void)v15));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager _mountInfoForPath:](self, "_mountInfoForPath:", v13));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, v12);
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  -[MIDiskImageManager setMountInfo:](self, "setMountInfo:", v6);
}

- (BOOL)_isKnownPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010E5C;
  block[3] = &unk_100080EF8;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)_addMountPath:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010F78;
  block[3] = &unk_100080F20;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (BOOL)_removeMountPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000110A8;
  block[3] = &unk_100080EF8;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)_setPendingMountPath:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000111C4;
  block[3] = &unk_100080ED0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)_clearPendingMountPath
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001123C;
  block[3] = &unk_100080BE8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)URLIsOnKnownImageMount:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 realPathForURL:v4 allowNonExistentPathComponents:0 isDirectory:1 error:0]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    uint64_t v15 = 0LL;
    __int128 v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    char v18 = 0;
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100011398;
    block[3] = &unk_100080EF8;
    block[4] = self;
    id v13 = v7;
    char v14 = &v15;
    id v9 = v7;
    dispatch_sync(v8, block);

    BOOL v10 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSSet)diskMountPaths
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  BOOL v10 = sub_1000115D4;
  uint64_t v11 = sub_1000115E4;
  id v12 = 0LL;
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000115EC;
  v6[3] = &unk_100080F48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (id)diskImageAppInfoForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_1000115D4;
  __int128 v16 = sub_1000115E4;
  id v17 = 0LL;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011770;
  block[3] = &unk_100080EF8;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)bundleIDIsOnKnownImageMount:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011948;
  block[3] = &unk_100080EF8;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (NSSet)diskImageAppBundleIDs
{
  dispatch_queue_attr_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_100011AE0;
  uint64_t v11 = &unk_100080ED0;
  uint64_t v12 = self;
  uint64_t v13 = v3;
  dispatch_queue_t v5 = v3;
  dispatch_sync(v4, &v8);

  id v6 = -[NSMutableSet copy](v5, "copy", v8, v9, v10, v11, v12);
  return (NSSet *)v6;
}

- (id)_onQueue_scanApps:(id)a3 returnMapInfo:(id *)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 standardInfoMapInfoPlistKeys]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100011D74;
  v22[3] = &unk_100080FE8;
  uint64_t v13 = v8;
  v23 = v13;
  id v14 = v11;
  id v24 = v14;
  uint64_t v15 = v9;
  v25 = v15;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v22]);

  if (v16)
  {
    uint64_t v17 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
      v21 = v16;
      MOLogWrite(v17);
    }
  }

  if (a4) {
    *a4 = -[NSMutableDictionary copy](v15, "copy");
  }
  id v18 = -[NSMutableDictionary copy](v13, "copy", v20, v21);

  return v18;
}

- (void)_onQueue_registerDiscoveredAppEntries:(id)a3 onMountPoint:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager lsRegisterQueue](self, "lsRegisterQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100012390;
  v15[3] = &unk_100081038;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  MIRunTransactionalTask(v11, "com.apple.installd.register-content-diskImage", v15);
}

- (void)registerContentsAtMountPoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001260C;
  block[3] = &unk_100081060;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)reregisterContentsAtMountPoint:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012928;
  block[3] = &unk_100080ED0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)unregisterContentsAtMountPoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012BFC;
  block[3] = &unk_100081060;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)lsRegisterQueue
{
  return self->_lsRegisterQueue;
}

- (OS_dispatch_queue)mountInfoAccessQueue
{
  return self->_mountInfoAccessQueue;
}

- (NSMutableDictionary)mountInfo
{
  return self->_mountInfo;
}

- (void)setMountInfo:(id)a3
{
}

- (NSString)pendingMountPath
{
  return self->_pendingMountPath;
}

- (void)setPendingMountPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end