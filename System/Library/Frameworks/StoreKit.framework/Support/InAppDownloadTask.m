@interface InAppDownloadTask
- (InAppDownloadStatus)status;
- (InAppDownloadTask)initWithDownloadID:(id)a3 info:(id)a4 bundleID:(id)a5 containerID:(id)a6;
- (NSNumber)downloadID;
- (NSString)bundleID;
- (NSString)logKey;
- (id)_bomInstallFromPath:(id)a3 withError:(id *)a4;
- (id)statusBlock;
- (void)_bomInstall;
- (void)_downloadedBytes:(int64_t)a3 expectedBytes:(int64_t)a4;
- (void)_finalizeTaskWithError:(id)a3;
- (void)_install;
- (void)_sendDownloadStatus;
- (void)_updateDownloadStatus:(id)a3;
- (void)cancel;
- (void)main;
- (void)pause;
- (void)setBundleID:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setStatus:(id)a3;
- (void)setStatusBlock:(id)a3;
@end

@implementation InAppDownloadTask

- (InAppDownloadTask)initWithDownloadID:(id)a3 info:(id)a4 bundleID:(id)a5 containerID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___InAppDownloadTask;
  v13 = -[Task init](&v19, "init");
  if (v13)
  {
    if ([v11 count])
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
      v15 = *(void **)(v13 + 138);
      *(void *)(v13 + 138) = v14;

      objc_storeStrong((id *)(v13 + 162), a5);
      objc_storeStrong((id *)(v13 + 50), a4);
      objc_storeStrong((id *)(v13 + 130), a3);
      v16 = -[InAppDownloadStatus initWithDownloadID:]( objc_alloc(&OBJC_CLASS___InAppDownloadStatus),  "initWithDownloadID:",  *(void *)(v13 + 130));
      v17 = *(void **)(v13 + 154);
      *(void *)(v13 + 154) = v16;
    }

    else
    {
      v17 = v13;
      v13 = 0LL;
    }
  }

  return (InAppDownloadTask *)v13;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask logKey](self, "logKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super._error + 2), "tcr_urlForKey:", @"URL"));
  if (!v4)
  {
    uint64_t v38 = ASDErrorWithDescription(ASDErrorDomain, 302LL, @"No URL for download");
    id v13 = (id)objc_claimAutoreleasedReturnValue(v38);
    if (qword_10032EF50 != -1) {
      dispatch_once(&qword_10032EF50, &stru_1002E9F70);
    }
    if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_ERROR)) {
      sub_10026383C();
    }
    goto LABEL_19;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super._error + 2), "tcr_numberForKey:", @"file-size"));
  id v6 = [v5 unsignedLongLongValue];

  v7 = NSOpenStepRootDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned __int8 v9 = +[DiskSpaceManager ensureAvailableDiskSpace:atPath:]( &OBJC_CLASS___DiskSpaceManager,  "ensureAvailableDiskSpace:atPath:",  v6,  v8);

  if ((v9 & 1) == 0)
  {
    uint64_t v39 = ASDErrorWithDescription(ASDErrorDomain, 706LL, @"Not enough space to download asset");
    id v13 = (id)objc_claimAutoreleasedReturnValue(v39);
    if (qword_10032EF50 != -1) {
      dispatch_once(&qword_10032EF50, &stru_1002E9F70);
    }
    if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_ERROR)) {
      sub_10026383C();
    }
LABEL_19:
    -[InAppDownloadTask _finalizeTaskWithError:](self, "_finalizeTaskWithError:", v13);
    goto LABEL_37;
  }

  id v10 = -[InAppDownloadTimeEstimator initWithMaxValue:]( objc_alloc(&OBJC_CLASS___InAppDownloadTimeEstimator),  "initWithMaxValue:",  v6);
  id v11 = *(NSString **)((char *)&self->_installPath + 2);
  *(NSString **)((char *)&self->_installPath + 2) = (NSString *)&v10->super.isa;

  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super._error + 2), "tcr_arrayForKey:", @"sinfs"));
  v51 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "tcr_dataForKey:", @"dpInfo"));
  id v59 = 0LL;
  v53 = -[DecryptDataConsumer initWithDPInfo:error:]( objc_alloc(&OBJC_CLASS___DecryptDataConsumer),  "initWithDPInfo:error:",  v50,  &v59);
  id v13 = v59;
  if (v53)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)((char *)&self->super.super._error + 2),  "tcr_dictionaryForKey:",  @"chunks"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "tcr_arrayForKey:", @"hashes"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "tcr_arrayForKey:", @"clearHashes"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "tcr_numberForKey:", @"chunkSize"));
    id v15 = [v14 unsignedIntValue];

    if (v48 && v47)
    {
      v49 = objc_alloc_init(&OBJC_CLASS___ChunkedDigest);
      -[ChunkedDigest setChunkDigests:](v49, "setChunkDigests:", v48);
      -[ChunkedDigest setChunkSize:](v49, "setChunkSize:", v15);
      -[ChunkedDigest setChunkType:](v49, "setChunkType:", 0LL);
      -[DecryptDataConsumer setDigest:](v53, "setDigest:", v49);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "sk_downloadURL"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask downloadID](self, "downloadID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringValue]);
      objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v16 URLByAppendingPathComponent:v18 isDirectory:1]);

      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
      id v21 = objc_msgSend(v43, "lib_ensureDirectoryExistsAtPath:", v20);

      v41 = (void *)objc_claimAutoreleasedReturnValue([v19 URLByAppendingPathComponent:v42 isDirectory:0]);
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v41 path]);
      v23 = *(void **)(&self->super._finished + 1);
      *(void *)(&self->super._finished + 1) = v22;

      if (qword_10032EF50 != -1) {
        dispatch_once(&qword_10032EF50, &stru_1002E9F70);
      }
      v24 = (os_log_s *)off_100328930;
      if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(AssetRequest **)(&self->super._finished + 1);
        *(_DWORD *)buf = 138543618;
        v61 = v3;
        __int16 v62 = 2114;
        v63 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Downloading payload to: %{public}@",  buf,  0x16u);
      }

      v46 = objc_alloc_init(&OBJC_CLASS___ChunkedDigest);
      -[ChunkedDigest setChunkDigests:](v46, "setChunkDigests:", v47);
      -[ChunkedDigest setChunkSize:](v46, "setChunkSize:", v15);
      -[ChunkedDigest setChunkType:](v46, "setChunkType:", 0LL);
      v45 = -[FileWriteStreamAdapter initWithDownloadPath:]( objc_alloc(&OBJC_CLASS___FileWriteStreamAdapter),  "initWithDownloadPath:",  *(void *)(&self->super._finished + 1));
      -[FileWriteStreamAdapter setLogKey:](v45, "setLogKey:", v3);
      -[FileWriteStreamAdapter setDigest:](v45, "setDigest:", v46);
      -[DecryptDataConsumer setStreamAdapter:](v53, "setStreamAdapter:", v45);
      v26 = objc_alloc_init(&OBJC_CLASS___AssetRequestProperties);
      -[AssetRequestProperties setDataConsumer:](v26, "setDataConsumer:", v53);
      -[AssetRequestProperties setLogKey:](v26, "setLogKey:", v3);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask bundleID](self, "bundleID"));
      -[AssetRequestProperties setNetworkBudgetingIdentifier:](v26, "setNetworkBudgetingIdentifier:", v27);

      -[AssetRequestProperties setTaskPriority:](v26, "setTaskPriority:", &off_100302918);
      -[AssetRequestProperties setQosClass:](v26, "setQosClass:", 25LL);
      -[AssetRequestProperties setRequestReason:](v26, "setRequestReason:", 5LL);
      v44 = -[AssetRequest initWithURL:properties:]( objc_alloc(&OBJC_CLASS___AssetRequest),  "initWithURL:properties:",  v4,  v26);
      -[AssetRequest setCachePolicy:](v44, "setCachePolicy:", 1LL);
      if (qword_10032EF50 != -1) {
        dispatch_once(&qword_10032EF50, &stru_1002E9F70);
      }
      v28 = (os_log_s *)off_100328930;
      if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v61 = v3;
        __int16 v62 = 2114;
        v63 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Downloading asset for request: %{public}@",  buf,  0x16u);
      }

      v29 = self;
      objc_sync_enter(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[AssetSession defaultSession](&OBJC_CLASS___AssetSession, "defaultSession"));
      uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 assetPromiseWithRequest:v44]);
      v32 = *(void **)(&v29->super.super._success + 2);
      *(void *)(&v29->super.super._success + 2) = v31;

      objc_sync_exit(v29);
      uint64_t v33 = objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  v29,  "_sendDownloadStatus",  0LL,  1LL,  1.0));
      v34 = *(NSDictionary **)((char *)&v29->_downloadInfo + 2);
      *(NSDictionary **)((char *)&v29->_downloadInfo + 2) = (NSDictionary *)v33;

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
      [v35 addTimer:*(NSDictionary **)((char *)&v29->_downloadInfo + 2) forMode:NSRunLoopCommonModes];

      objc_initWeak((id *)buf, v29);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_1000748B8;
      v57[3] = &unk_1002E9F28;
      objc_copyWeak(&v58, (id *)buf);
      [*(id *)(&v29->super.super._success + 2) setProgress:v57];
      v36 = *(void **)(&v29->super.super._success + 2);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_1000748FC;
      v54[3] = &unk_1002E9F50;
      objc_copyWeak(&v56, (id *)buf);
      id v55 = v3;
      [v36 addFinishBlock:v54];

      objc_destroyWeak(&v56);
      objc_destroyWeak(&v58);
      objc_destroyWeak((id *)buf);

      uint64_t v37 = (uint64_t)v13;
    }

    else
    {
      v49 = (ChunkedDigest *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No hashes in download info"));
      uint64_t v40 = ASDErrorWithDescription(ASDErrorDomain, 709LL, v49);
      uint64_t v37 = objc_claimAutoreleasedReturnValue(v40);

      if (qword_10032EF50 != -1) {
        dispatch_once(&qword_10032EF50, &stru_1002E9F70);
      }
      if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_ERROR)) {
        sub_10026383C();
      }
      -[InAppDownloadTask _finalizeTaskWithError:](self, "_finalizeTaskWithError:", v37);
    }

    id v13 = (id)v37;
  }

  else
  {
    if (qword_10032EF50 != -1) {
      dispatch_once(&qword_10032EF50, &stru_1002E9F70);
    }
    if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_ERROR)) {
      sub_1002638A4();
    }
    -[InAppDownloadTask _finalizeTaskWithError:](self, "_finalizeTaskWithError:", v13);
  }

LABEL_37:
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask status](v2, "status"));
  if ([v3 state] == (id)1)
  {
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask status](v2, "status"));
    id v5 = [v4 state];

    if (v5 != (id)2) {
      goto LABEL_12;
    }
  }

  if (*(void *)(&v2->super.super._success + 2))
  {
    if (!BYTE2(v2->_statusTimer))
    {
      if (qword_10032EF50 != -1) {
        dispatch_once(&qword_10032EF50, &stru_1002E9F70);
      }
      id v6 = off_100328930;
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask logKey](v2, "logKey"));
        *(_DWORD *)buf = 138543362;
        id v10 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Cancelling download",  buf,  0xCu);
      }
    }

    v8.receiver = v2;
    v8.super_class = (Class)&OBJC_CLASS___InAppDownloadTask;
    -[InAppDownloadTask cancel](&v8, "cancel");
    [*(id *)(&v2->super.super._success + 2) cancel];
  }

- (void)pause
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask status](v2, "status"));
  id v4 = [v3 state];

  if (v4 == (id)1)
  {
    if (qword_10032EF50 != -1) {
      dispatch_once(&qword_10032EF50, &stru_1002E9F70);
    }
    id v5 = off_100328930;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask logKey](v2, "logKey"));
      int v7 = 138543362;
      objc_super v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Pausing download",  (uint8_t *)&v7,  0xCu);
    }

    BYTE2(v2->_statusTimer) = 1;
  }

  objc_sync_exit(v2);

  -[InAppDownloadTask cancel](v2, "cancel");
}

- (void)_downloadedBytes:(int64_t)a3 expectedBytes:(int64_t)a4
{
  double v5 = (double)a4;
  double v6 = (double)a3 / v5 * 0.8;
  [*(id *)((char *)&self->_installPath + 2) setCurrentValue:a3];
  int v7 = objc_alloc(&OBJC_CLASS___InAppDownloadStatus);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask downloadID](self, "downloadID"));
  unsigned __int8 v9 = -[InAppDownloadStatus initWithDownloadID:](v7, "initWithDownloadID:", v8);

  -[InAppDownloadStatus setState:](v9, "setState:", 1LL);
  -[InAppDownloadStatus setProgress:](v9, "setProgress:", v6);
  [*(id *)((char *)&self->_installPath + 2) estimatedTimeRemaining];
  -[InAppDownloadStatus setTimeRemaining:](v9, "setTimeRemaining:");
  -[InAppDownloadTask _updateDownloadStatus:](self, "_updateDownloadStatus:", v9);
}

- (void)_finalizeTaskWithError:(id)a3
{
  id v4 = a3;
  if (qword_10032EF50 != -1) {
    dispatch_once(&qword_10032EF50, &stru_1002E9F70);
  }
  double v5 = off_100328930;
  if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask logKey](self, "logKey"));
    *(_DWORD *)buf = 138543362;
    v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Finalizing download task",  buf,  0xCu);
  }

  [*(id *)((char *)&self->_downloadInfo + 2) invalidate];
  if (BYTE2(self->_statusTimer)) {
    goto LABEL_15;
  }
  if (*(void *)(&self->super._finished + 1))
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v9 = [v8 fileExistsAtPath:*(void *)(&self->super._finished + 1)];

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v11 = *(void *)(&self->super._finished + 1);
      id v16 = 0LL;
      [v10 removeItemAtPath:v11 error:&v16];
      id v12 = v16;

      if (v12)
      {
        if (qword_10032EF50 != -1) {
          dispatch_once(&qword_10032EF50, &stru_1002E9F70);
        }
        if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_ERROR)) {
          sub_100263A5C();
        }
      }
    }
  }

  if (BYTE2(self->_statusTimer))
  {
LABEL_15:
    id v13 = (InAppDownloadStatus *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask status](self, "status"));
    -[InAppDownloadStatus setState:](v13, "setState:", 2LL);
  }

  else
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___InAppDownloadStatus);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask downloadID](self, "downloadID"));
    id v13 = -[InAppDownloadStatus initWithDownloadID:](v14, "initWithDownloadID:", v15);

    -[InAppDownloadStatus setProgress:](v13, "setProgress:", 1.0);
    -[InAppDownloadStatus setTimeRemaining:](v13, "setTimeRemaining:", 0.0);
    if (v4)
    {
      -[InAppDownloadStatus setState:](v13, "setState:", 4LL);
      -[InAppDownloadStatus setError:](v13, "setError:", v4);
    }

    else
    {
      -[InAppDownloadStatus setState:](v13, "setState:", 3LL);
      -[InAppDownloadStatus setInstallPath:]( v13,  "setInstallPath:",  *(AssetPromise **)((char *)&self->_assetPromise + 2));
    }
  }

  -[InAppDownloadTask _updateDownloadStatus:](self, "_updateDownloadStatus:", v13);
  -[InAppDownloadTask _sendDownloadStatus](self, "_sendDownloadStatus");
  -[InAppDownloadTask setStatusBlock:](self, "setStatusBlock:", 0LL);
  if (v4) {
    -[AsyncTask completeWithError:](self, "completeWithError:", v4);
  }
  else {
    -[AsyncTask completeWithSuccess](self, "completeWithSuccess");
  }
}

- (void)_install
{
}

- (void)_sendDownloadStatus
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (*(NSString **)((char *)&obj->_downloadPath + 2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask statusBlock](obj, "statusBlock"));

    v2 = obj;
    if (v3)
    {
      id v4 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[InAppDownloadTask statusBlock](obj, "statusBlock"));
      v4[2](v4, *(NSString **)((char *)&obj->_downloadPath + 2));

      v2 = obj;
    }
  }

  double v5 = *(NSString **)((char *)&v2->_downloadPath + 2);
  *(NSString **)((char *)&v2->_downloadPath + 2) = 0LL;

  objc_sync_exit(obj);
}

- (void)_updateDownloadStatus:(id)a3
{
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  -[InAppDownloadTask setStatus:](obj, "setStatus:", v4);
  double v5 = *(NSString **)((char *)&obj->_downloadPath + 2);
  *(NSString **)((char *)&obj->_downloadPath + 2) = v4;

  objc_sync_exit(obj);
}

- (void)_bomInstall
{
  v2 = self;
  uint64_t v3 = objc_sync_enter(v2);
  *(InAppDownloadStatus **)((char *)&v2->_pendingDownloadStatus + 2) = (InAppDownloadStatus *)BOMCopierNew(v3);
  BOMCopierSetUserData();
  BOMCopierSetCopyFileFinishedHandler(*(InAppDownloadStatus **)((char *)&v2->_pendingDownloadStatus + 2), sub_1000757A4);
  objc_sync_exit(v2);

  id v4 = [*(id *)(&v2->super._finished + 1) fileSystemRepresentation];
  id v5 = objc_claimAutoreleasedReturnValue([*(id *)(&v2->super._finished + 1) stringByDeletingPathExtension]);
  id v6 = [v5 fileSystemRepresentation];
  int v7 = (unint64_t *)((char *)&v2->_timeEstimator + 2);
  BOMCopierCountFilesInArchive( *(InAppDownloadStatus **)((char *)&v2->_pendingDownloadStatus + 2),  v4,  0LL,  (char *)&v2->_timeEstimator + 2);
  unint64_t v8 = *(unint64_t *)((char *)&v2->_timeEstimator + 2);
  if (v8 <= 1) {
    unint64_t v8 = 1LL;
  }
  unint64_t *v7 = v8;
  if (qword_10032EF50 != -1) {
    dispatch_once(&qword_10032EF50, &stru_1002E9F70);
  }
  unsigned int v9 = off_100328930;
  if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask logKey](v2, "logKey"));
    unint64_t v12 = *v7;
    *(_DWORD *)buf = 138544130;
    v25 = v11;
    __int16 v26 = 2048;
    unint64_t v27 = v12;
    __int16 v28 = 2082;
    id v29 = v4;
    __int16 v30 = 2082;
    id v31 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Extracting %lld bytes in archive %{public}s to %{public}s",  buf,  0x2Au);
  }

  uint64_t v22 = @"extractPKZip";
  v23 = &__kCFBooleanTrue;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  int v14 = BOMCopierCopyWithOptions(*(InAppDownloadStatus **)((char *)&v2->_pendingDownloadStatus + 2), v4, v6, v13);
  if (v14)
  {
    if (qword_10032EF50 != -1) {
      dispatch_once(&qword_10032EF50, &stru_1002E9F70);
    }
    id v15 = off_100328930;
    if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_ERROR)) {
      sub_100263B90(v15, v2, v14);
    }
    uint64_t v16 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 507LL, 0LL, 0LL);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
  }

  else
  {
    id v21 = 0LL;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask _bomInstallFromPath:withError:](v2, "_bomInstallFromPath:withError:", v5, &v21));
    id v17 = v21;
    if (v17)
    {
      if (qword_10032EF50 != -1) {
        dispatch_once(&qword_10032EF50, &stru_1002E9F70);
      }
      objc_super v19 = off_100328930;
      if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_ERROR)) {
        sub_100263AE8(v19, v2, (uint64_t)v17);
      }
    }

    else
    {
      objc_storeStrong((id *)((char *)&v2->_assetPromise + 2), v18);
    }
  }

  v20 = v2;
  objc_sync_enter(v20);
  BOMCopierFree(*(InAppDownloadStatus **)((char *)&v2->_pendingDownloadStatus + 2));
  *(InAppDownloadStatus **)((char *)&v2->_pendingDownloadStatus + 2) = 0LL;
  objc_sync_exit(v20);

  if (v17)
  {
    -[InAppDownloadTask _finalizeTaskWithError:](v20, "_finalizeTaskWithError:", v17);
  }

  else
  {
LABEL_23:
    -[InAppDownloadTask _finalizeTaskWithError:](v2, "_finalizeTaskWithError:", 0LL);
  }

- (id)_bomInstallFromPath:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask bundleID](self, "bundleID"));
  id v40 = 0LL;
  id v9 = [v7 initWithBundleIdentifier:v8 allowPlaceholder:0 error:&v40];
  id v10 = v40;

  if (v9)
  {
    v35 = a4;
    uint64_t v11 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 dataContainerURL]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
    int v14 = -[NSMutableArray initWithObjects:](v11, "initWithObjects:", v13, 0LL);

    -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", &off_100302948);
    v34 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v14));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask bundleID](self, "bundleID"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v16,  *(_BOMCopier **)((char *)&self->_copier + 2)));
    id v18 = [v17 hash];

    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v18));
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 stringValue]);

    uint64_t v33 = (void *)v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:v20]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v39 = 0LL;
    [v22 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v39];
    id v23 = v39;
    if (v23)
    {
      if (qword_10032EF50 != -1) {
        dispatch_once(&qword_10032EF50, &stru_1002E9F70);
      }
      if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_ERROR)) {
        sub_100263D58();
      }
    }

    if ([v22 fileExistsAtPath:v21])
    {
      id v38 = 0LL;
      [v22 removeItemAtPath:v6 error:&v38];
      id v24 = v38;
      if (v24)
      {
        if (qword_10032EF50 != -1) {
          dispatch_once(&qword_10032EF50, &stru_1002E9F70);
        }
        if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_ERROR)) {
          sub_100263C40();
        }
      }
    }

    if (qword_10032EF50 != -1) {
      dispatch_once(&qword_10032EF50, &stru_1002E9F70);
    }
    v25 = off_100328930;
    if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = v25;
      unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask logKey](self, "logKey"));
      *(_DWORD *)buf = 138543874;
      v42 = v27;
      __int16 v43 = 2114;
      id v44 = v6;
      __int16 v45 = 2114;
      v46 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Moving downloaded asset from %{public}@ to %{public}@",  buf,  0x20u);
    }

    id v37 = v10;
    [v22 moveItemAtPath:v6 toPath:v21 error:&v37];
    id v28 = v37;

    if (v28)
    {
      if (qword_10032EF50 != -1) {
        dispatch_once(&qword_10032EF50, &stru_1002E9F70);
      }
      if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_ERROR)) {
        sub_100263CCC();
      }
    }

    a4 = v35;
  }

  else
  {
    id v21 = 0LL;
    id v28 = v10;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v29 fileExistsAtPath:v6])
  {
    id v36 = 0LL;
    [v29 removeItemAtPath:v6 error:&v36];
    id v30 = v36;
    if (v30)
    {
      if (qword_10032EF50 != -1) {
        dispatch_once(&qword_10032EF50, &stru_1002E9F70);
      }
      if (os_log_type_enabled((os_log_t)off_100328930, OS_LOG_TYPE_ERROR)) {
        sub_100263C40();
      }
    }
  }

  if (a4) {
    *a4 = v28;
  }
  id v31 = v21;

  return v31;
}

- (NSNumber)downloadID
{
  return *(NSNumber **)((char *)&self->_copier + 2);
}

- (void)setDownloadID:(id)a3
{
}

- (NSString)logKey
{
  return *(NSString **)((char *)&self->_expectedInstallSize + 2);
}

- (void)setLogKey:(id)a3
{
}

- (id)statusBlock
{
  return *(id *)((char *)&self->_totalInstalledSize + 2);
}

- (void)setStatusBlock:(id)a3
{
}

- (InAppDownloadStatus)status
{
  return *(InAppDownloadStatus **)((char *)&self->_downloadID + 2);
}

- (void)setStatus:(id)a3
{
}

- (NSString)bundleID
{
  return *(NSString **)((char *)&self->_logKey + 2);
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end