@interface MSDIPAInstallOperation
- (BOOL)_IXInstallAppIPA;
- (BOOL)_fulfillIXSZTransferPromise:(id)a3 withFile:(id)a4 outError:(id *)a5;
- (BOOL)_verifyInstalledApp;
- (BOOL)rollback;
- (BOOL)runInstallInParallel;
- (MSDContentCacheManagerProtocol)contentCacheProtocol;
- (MSDIPAInstallOperation)initWithContext:(id)a3;
- (MSDIPAInstallOperation)initWithContext:(id)a3 andContentCacheManager:(id)a4;
- (NSError)installError;
- (OS_dispatch_semaphore)semaphore;
- (id)methodSelectors;
- (int64_t)type;
- (void)_createFullIPAInstallOperationsAsFallback;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidCompleteSuccessfully:(id)a3;
- (void)setContentCacheProtocol:(id)a3;
- (void)setInstallError:(id)a3;
- (void)setSemaphore:(id)a3;
@end

@implementation MSDIPAInstallOperation

- (MSDIPAInstallOperation)initWithContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](&OBJC_CLASS___MSDContentCacheManager, "sharedInstance"));
  v6 = -[MSDIPAInstallOperation initWithContext:andContentCacheManager:]( self,  "initWithContext:andContentCacheManager:",  v4,  v5);

  return v6;
}

- (MSDIPAInstallOperation)initWithContext:(id)a3 andContentCacheManager:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MSDIPAInstallOperation;
  v7 = -[MSDOperation initWithContext:](&v11, "initWithContext:", a3);
  v8 = v7;
  if (v7)
  {
    -[MSDIPAInstallOperation setContentCacheProtocol:](v7, "setContentCacheProtocol:", v6);
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    -[MSDIPAInstallOperation setSemaphore:](v8, "setSemaphore:", v9);

    -[MSDIPAInstallOperation setInstallError:](v8, "setInstallError:", 0LL);
  }

  return v8;
}

- (id)methodSelectors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_IXInstallAppIPA"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_verifyInstalledApp"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, v3, 0LL));

  return v4;
}

- (BOOL)rollback
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MSDOperationRepository createOperationFromIdentifier:withContext:]( &OBJC_CLASS___MSDOperationRepository,  "createOperationFromIdentifier:withContext:",  @"MSDIPAUninstallOperation",  v3));

  -[MSDOperation produceNewDependentOperation:forRollback:](self, "produceNewDependentOperation:forRollback:", v4, 1LL);
  return 1;
}

- (int64_t)type
{
  return 3LL;
}

- (BOOL)runInstallInParallel
{
  return 1;
}

- (BOOL)_IXInstallAppIPA
{
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stagingRootPath]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);

  dispatch_semaphore_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 currentUniqueIdentifier]);

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  unsigned int v12 = [v11 alreadyInstalled];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  unsigned int v14 = [v13 useDiffPatch];

  id v15 = sub_10003A95C();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v111 = v6;
    __int16 v112 = 2114;
    *(void *)v113 = v8;
    *(_WORD *)&v113[8] = 2114;
    uint64_t v114 = v10;
    __int16 v115 = 1026;
    unsigned int v116 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Installing IPA for app: %{public}@ <UID %{public}@, CurrentUID: %{public}@, DiffPatch: %{public, BOOL}d>",  buf,  0x26u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](&OBJC_CLASS___MSDAppHelper, "sharedInstance"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 acquireAppTerminationAssertionForApp:v6]);

  if (v14)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation contentCacheProtocol](self, "contentCacheProtocol"));
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 appDiffPatchFileForSourceAppUID:v10 targetAppUID:v8]);
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 fileHash]);
  }

  v96 = (void *)v20;

  v21 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathExtension:@"ipa"]);
  v97 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v21]);

  id v22 = sub_10003A95C();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v111 = v96;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "IPA/Patch file hash to use: %{public}@",  buf,  0xCu);
  }

  v92 = v4;
  v93 = (void *)v10;
  v94 = (void *)v8;
  v91 = (void *)v18;
  if (v12)
  {
    id v109 = 0LL;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[IXUpdatingAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:]( &OBJC_CLASS___IXUpdatingAppInstallCoordinator,  "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:",  v6,  9LL,  1LL,  0LL,  &v109));
    id v25 = v109;
    if (!v24)
    {
      id v26 = sub_10003A95C();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10009A400(v25, v27);
      }
LABEL_79:

      BOOL v47 = 0;
      id v43 = 0LL;
      id v89 = 0LL;
      id v33 = 0LL;
      v24 = 0LL;
      goto LABEL_29;
    }
  }

  else
  {
    id v108 = 0LL;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[IXInitiatingAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:]( &OBJC_CLASS___IXInitiatingAppInstallCoordinator,  "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:",  v6,  9LL,  1LL,  0LL,  &v108));
    id v25 = v108;
    if (!v24)
    {
      id v88 = sub_10003A95C();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10009A480(v25, v27);
      }
      goto LABEL_79;
    }
  }

  v28 = v25;
  [v24 setObserver:self];
  id v107 = v25;
  unsigned __int8 v29 = [v24 setImportance:3 error:&v107];
  id v25 = v107;

  if ((v29 & 1) == 0)
  {
    id v69 = sub_10003A95C();
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedDescription]);
      *(_DWORD *)buf = 138543362;
      v111 = v71;
      _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "Could not set coordinator importance with error - %{public}@",  buf,  0xCu);
    }

    BOOL v47 = 0;
    id v43 = 0LL;
    id v89 = 0LL;
    id v33 = 0LL;
    goto LABEL_29;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  id v106 = v25;
  unsigned __int8 v31 = [v24 setInitialODRAssetPromises:v30 error:&v106];
  id v32 = v106;

  if ((v31 & 1) == 0)
  {
    id v72 = sub_10003A95C();
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue([v32 localizedDescription]);
      *(_DWORD *)buf = 138543362;
      v111 = v74;
      _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "Could not setInitialODRAssetPromises with error - %{public}@",  buf,  0xCu);
    }

    BOOL v47 = 0;
    id v43 = 0LL;
    id v89 = 0LL;
    id v33 = 0LL;
    goto LABEL_76;
  }

  if (v14)
  {
    id v33 = [[IXPromisedStreamingZipTransfer alloc] initWithName:@"IPAPromise" client:9 streamingZipOptions:&__NSDictionary0__struct archiveSize:0 diskSpaceNeeded:0];
  }

  else
  {
    id v34 = objc_alloc(&OBJC_CLASS___IXPromisedTransferToPath);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithString:](&OBJC_CLASS___NSURL, "fileURLWithString:", v97));
    id v33 = [v34 initWithName:@"IPAPromise" client:9 transferPath:v35 diskSpaceNeeded:0];
  }

  id v36 = [[IXPlaceholder alloc] initAppPlaceholderWithBundleName:@"TempApp" bundleID:v6 installType:1 client:9];
  id v105 = v32;
  unsigned __int8 v37 = [v24 setPlaceholderPromise:v36 error:&v105];
  id v25 = v105;

  id v89 = v36;
  if ((v37 & 1) == 0)
  {
    id v75 = sub_10003A95C();
    v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedDescription", v89));
      *(_DWORD *)buf = 138543362;
      v111 = v77;
      v78 = "Could not set place holder promise with error - %{public}@";
LABEL_67:
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, v78, buf, 0xCu);
    }

- (BOOL)_verifyInstalledApp
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](&OBJC_CLASS___MSDAppHelper, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundlePathForInstalledApp:v4]);

  dispatch_semaphore_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDiOSApp appWithPath:](&OBJC_CLASS___MSDiOSApp, "appWithPath:", v8));
  uint64_t v10 = v9;
  if (!v9)
  {
    id v14 = sub_10003A95C();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      uint64_t v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Cannot create MSDiOSApp from bundle path %{public}@",  (uint8_t *)&v17,  0xCu);
    }

    objc_super v11 = 0LL;
    goto LABEL_10;
  }

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
  if (([v11 isEqualToString:v6] & 1) == 0)
  {
    id v16 = sub_10003A95C();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "The installed app has UID %{public}@ but the expected UID is %{public}@",  (uint8_t *)&v17,  0x16u);
    }

- (BOOL)_fulfillIXSZTransferPromise:(id)a3 withFile:(id)a4 outError:(id *)a5
{
  id v31 = a3;
  id v7 = a4;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  id v43 = sub_100059B74;
  unsigned __int8 v44 = sub_100059B84;
  id v45 = 0LL;
  uint64_t v36 = 0LL;
  unsigned __int8 v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  id v8 = sub_10003A95C();
  dispatch_semaphore_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v47 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending bytes to IXPromisedStreamingZipTransfer from file: %{public}@",  buf,  0xCu);
  }

  id v29 = v7;
  int v10 = open((const char *)[v29 fileSystemRepresentation], 0);
  int v30 = v10;
  if (v10 < 0)
  {
    id v25 = sub_10003A95C();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = __error();
      sub_10009A580((uint64_t)v29, v27, buf, v26);
    }

LABEL_18:
    close(v30);
    goto LABEL_19;
  }

  fstat(v10, &v35);
  unint64_t st_size = v35.st_size;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100059B8C;
  v34[3] = &unk_1000FA3A0;
  v34[4] = self;
  v34[5] = &v40;
  [v31 prepareForExtraction:v34];
  BOOL v12 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  if (!v41[5])
  {
    if (st_size)
    {
      while (!*((_BYTE *)v37 + 24))
      {
        if (st_size >= 0x19000) {
          size_t v13 = 102400LL;
        }
        else {
          size_t v13 = st_size;
        }
        id v14 = malloc(v13);
        if (!v14)
        {
          id v21 = sub_10003A95C();
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_10009A5D8();
          }
          goto LABEL_16;
        }

        id v15 = v14;
        if (read(v30, v14, v13) != v13)
        {
          id v22 = sub_10003A95C();
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v23 = __error();
            sub_10009A67C(v23, buf, v16);
          }

          goto LABEL_16;
        }

        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v15,  v13,  1LL));
        if (!v16)
        {
          id v24 = sub_10003A95C();
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_10009A63C(v16);
          }
          goto LABEL_16;
        }

        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_100059C1C;
        v33[3] = &unk_1000FA3C8;
        v33[5] = &v40;
        v33[6] = &v36;
        v33[4] = self;
        [v31 supplyBytes:v16 withCompletionBlock:v33];
        int v17 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
        dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

        if (v41[5]) {
          goto LABEL_16;
        }

        st_size -= v13;
        if (!st_size) {
          break;
        }
      }
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100059CC4;
    v32[3] = &unk_1000F97B8;
    v32[4] = self;
    v32[5] = &v40;
    [v31 finishStreamWithCompletionBlock:v32];
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
    dispatch_semaphore_wait((dispatch_semaphore_t)v16, 0xFFFFFFFFFFFFFFFFLL);
LABEL_16:
  }

  if (v30) {
    goto LABEL_18;
  }
LABEL_19:
  if (a5)
  {
    uint64_t v18 = (void *)v41[5];
    if (v18) {
      *a5 = v18;
    }
  }

  BOOL v19 = *((_BYTE *)v37 + 24) != 0;
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v19;
}

- (void)_createFullIPAInstallOperationsAsFallback
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation dependents](self, "dependents"));
  id v6 = [v5 copy];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  unsigned int v8 = [v7 useDiffPatch];

  if (v8)
  {
    id v9 = sub_10003A95C();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Falling back to install full IPA for app: %{public}@",  buf,  0xCu);
    }

    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    id v12 = [v11 copy];

    [v12 setAlreadyInstalled:0];
    [v12 setCurrentUniqueIdentifier:0];
    [v12 setUseDiffPatch:0];
    size_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[MSDOperationRepository createOperationFromIdentifier:withContext:]( &OBJC_CLASS___MSDOperationRepository,  "createOperationFromIdentifier:withContext:",  @"MSDInstallableFileDownloadOperation",  v12));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MSDOperationRepository createOperationFromIdentifier:withContext:]( &OBJC_CLASS___MSDOperationRepository,  "createOperationFromIdentifier:withContext:",  @"MSDIPAInstallOperation",  v12));
    [v14 addDependency:v13];
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v15 = v6;
    id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        BOOL v19 = 0LL;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "addDependency:", v14, (void)v20);
          BOOL v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v17);
    }

    -[MSDOperation produceNewDependentOperation:forRollback:]( self,  "produceNewDependentOperation:forRollback:",  v13,  0LL);
    -[MSDOperation produceNewDependentOperation:forRollback:]( self,  "produceNewDependentOperation:forRollback:",  v14,  0LL);
    -[MSDOperation setSkipped:](self, "setSkipped:", 1LL);
  }
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "App %{public}@ successfully installed.",  (uint8_t *)&v9,  0xCu);
  }

  -[MSDIPAInstallOperation setInstallError:](self, "setInstallError:", 0LL);
  unsigned int v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
  dispatch_semaphore_signal(v8);
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_10003A95C();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
    int v14 = 138543618;
    id v15 = v11;
    __int16 v16 = 2114;
    id v17 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "App %{public}@ cannot be installed: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  -[MSDIPAInstallOperation setInstallError:](self, "setInstallError:", v8);
  size_t v13 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
  dispatch_semaphore_signal(v13);
}

- (MSDContentCacheManagerProtocol)contentCacheProtocol
{
  return (MSDContentCacheManagerProtocol *)self->super._checkpointBarrier;
}

- (void)setContentCacheProtocol:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->super._observer;
}

- (void)setSemaphore:(id)a3
{
}

- (NSError)installError
{
  return (NSError *)self->_contentCacheProtocol;
}

- (void)setInstallError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end