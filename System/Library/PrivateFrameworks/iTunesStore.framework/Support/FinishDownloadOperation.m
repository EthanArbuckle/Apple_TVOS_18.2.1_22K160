@interface FinishDownloadOperation
- (BOOL)_needsDRMOperationForDownloadKind:(id)a3;
- (FinishDownloadOperation)initWithDownloadIdentifier:(int64_t)a3 databaseSession:(id)a4;
- (NSNumber)rentalIdentifier;
- (NSNumber)storeItemIdentifier;
- (NSString)handlerReleasedDownloadPhase;
- (NSString)initialDownloadPhase;
- (id)_downloadSessionPropertiesWithDownloadPhase:(id)a3;
- (id)_finishResult:(int64_t)a3;
- (id)_stepOperations;
- (id)outputBlock;
- (int64_t)downloadIdentifier;
- (void)_sendProgressToDelegate:(id)a3;
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)run;
- (void)setHandlerReleasedDownloadPhase:(id)a3;
- (void)setInitialDownloadPhase:(id)a3;
- (void)setOutputBlock:(id)a3;
- (void)stopWithFinishResult:(int64_t)a3;
@end

@implementation FinishDownloadOperation

- (FinishDownloadOperation)initWithDownloadIdentifier:(int64_t)a3 databaseSession:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___FinishDownloadOperation;
  v7 = -[FinishDownloadOperation init](&v20, "init");
  if (v7)
  {
    v8 = objc_alloc(&OBJC_CLASS___DownloadEntity);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 database]);
    v10 = -[DownloadEntity initWithPersistentID:inDatabase:](v8, "initWithPersistentID:inDatabase:", a3, v9);

    v11 = objc_alloc(&OBJC_CLASS___FinishDownloadMemoryEntity);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[FinishDownloadMemoryEntity defaultProperties]( &OBJC_CLASS___FinishDownloadMemoryEntity,  "defaultProperties"));
    v13 = -[FinishDownloadMemoryEntity initWithDatabaseEntity:properties:]( v11,  "initWithDatabaseEntity:properties:",  v10,  v12);
    download = v7->_download;
    v7->_download = v13;

    -[FinishDownloadMemoryEntity loadAssetsUsingSession:](v7->_download, "loadAssetsUsingSession:", v6);
    id v15 = -[DownloadEntity copyStoreDownloadMetadata](v10, "copyStoreDownloadMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sinfs]);

    if (!v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity mediaAsset](v7->_download, "mediaAsset"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 SINFs]);
      [v15 setSinfs:v18];
    }

    -[FinishDownloadMemoryEntity setStoreMetadata:](v7->_download, "setStoreMetadata:", v15);
    v7->_stopResult = -1LL;
  }

  return v7;
}

- (int64_t)downloadIdentifier
{
  return (int64_t)-[FinishDownloadMemoryEntity databaseID](self->_download, "databaseID");
}

- (NSNumber)storeItemIdentifier
{
  return (NSNumber *)-[FinishDownloadMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"store_item_id");
}

- (NSNumber)rentalIdentifier
{
  return (NSNumber *)-[FinishDownloadMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"rental_id");
}

- (NSString)handlerReleasedDownloadPhase
{
  id v3 = -[NSString copy](self->_handlerReleasedDownloadPhase, "copy");
  -[FinishDownloadOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (NSString)initialDownloadPhase
{
  id v3 = -[NSString copy](self->_initialDownloadPhase, "copy");
  -[FinishDownloadOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (id)outputBlock
{
  id v3 = [self->_outputBlock copy];
  -[FinishDownloadOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setHandlerReleasedDownloadPhase:(id)a3
{
  id v6 = (NSString *)a3;
  -[FinishDownloadOperation lock](self, "lock");
  if (self->_handlerReleasedDownloadPhase != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    handlerReleasedDownloadPhase = self->_handlerReleasedDownloadPhase;
    self->_handlerReleasedDownloadPhase = v4;
  }

  -[FinishDownloadOperation unlock](self, "unlock");
}

- (void)setInitialDownloadPhase:(id)a3
{
  id v6 = (NSString *)a3;
  -[FinishDownloadOperation lock](self, "lock");
  if (self->_initialDownloadPhase != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    initialDownloadPhase = self->_initialDownloadPhase;
    self->_initialDownloadPhase = v4;
  }

  -[FinishDownloadOperation unlock](self, "unlock");
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  -[FinishDownloadOperation lock](self, "lock");
  if (self->_outputBlock != v6)
  {
    id v4 = [v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }

  -[FinishDownloadOperation unlock](self, "unlock");
}

- (void)stopWithFinishResult:(int64_t)a3
{
  self->_stopResult = a3;
  -[FinishDownloadOperation unlock](self, "unlock");
  -[FinishDownloadOperation cancel](self, "cancel");
}

- (void)run
{
  id v32 = -[FinishDownloadMemoryEntity databaseID](self->_download, "databaseID");
  int64_t v3 = -[FinishDownloadMemoryEntity transactionID](self->_download, "transactionID");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadOperation _stepOperations](self, "_stepOperations"));
  id v4 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]( objc_alloc(&OBJC_CLASS___DownloadHandle),  "initWithTransactionIdentifier:downloadIdentifier:",  v3,  v32);
  v5 = objc_alloc_init(&OBJC_CLASS___SSOperationProgress);
  uint64_t v6 = OBJC_IVAR___ISOperation__progress;
  v7 = *(void **)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress];
  *(void *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] = v5;

  [*(id *)&self->ISOperation_opaque[v6] setCurrentValue:0];
  [*(id *)&self->ISOperation_opaque[v6] setMaxValue:1000000];
  v55[0] = SSDownloadPhaseProcessing;
  v55[1] = SSDownloadPhaseDataRestore;
  v55[2] = SSDownloadPhaseInstalling;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 3LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadOperation handlerReleasedDownloadPhase](self, "handlerReleasedDownloadPhase"));
  if (v9) {
    uint64_t v10 = (uint64_t)[v8 indexOfObject:v9];
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadOperation initialDownloadPhase](self, "initialDownloadPhase"));
  if (v31) {
    id v11 = objc_msgSend(v8, "indexOfObject:");
  }
  else {
    id v11 = 0LL;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
  v50[0] = 0LL;
  v50[1] = v50;
  v50[2] = 0x2020000000LL;
  v50[3] = 0LL;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  v47 = sub_10013C1F0;
  v48 = sub_10013C200;
  id v49 = 0LL;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10013C208;
  v33[3] = &unk_10034F858;
  id v41 = v11;
  uint64_t v42 = v10;
  id v29 = v8;
  id v34 = v29;
  v35 = self;
  v39 = &v44;
  v28 = v4;
  v36 = v28;
  id v43 = v32;
  id v14 = v12;
  id v37 = v14;
  id v15 = v13;
  id v38 = v15;
  v40 = v50;
  [v30 enumerateObjectsUsingBlock:v33];
  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[FinishDownloadOperation outputBlock](self, "outputBlock"));
  v17 = (void *)v16;
  if (v16)
  {
    (*(void (**)(uint64_t, FinishDownloadOperation *, uint64_t))(v16 + 16))(v16, self, v45[5]);
    -[FinishDownloadOperation setOutputBlock:](self, "setOutputBlock:", 0LL);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v18) {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v19 = [v18 shouldLog];
  unsigned int v20 = [v18 shouldLogToDisk];
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
  v22 = v21;
  if (v20) {
    unsigned int v23 = v19 | 2;
  }
  else {
    unsigned int v23 = v19;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = v23 & 2;
  }
  if (!(_DWORD)v24) {
    goto LABEL_20;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadOperation _finishResult:](self, "_finishResult:", [(id)v45[5] result]));
  int v51 = 134218242;
  id v52 = v32;
  __int16 v53 = 2112;
  v54 = v25;
  v26 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[ApplicationWorkspace] Install complete for download: %lld result: %@",  &v51,  22);

  if (v26)
  {
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
    free(v26);
    SSFileLog(v18, @"%@");
LABEL_20:
  }

  objc_opt_class(self);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadOperation _finishResult:](self, "_finishResult:", [(id)v45[5] result]));
  SSDebugLog(1LL, @"[%@]: Download complete for download: %lld result: %@");

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(v50, 8);
}

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  id v12 = a4;
  [a3 progressFraction];
  double v7 = v6;
  if (v6 > 2.22044605e-16)
  {
    double v8 = (double)(uint64_t)[v12 currentValue];
    double v9 = v8 / (double)(uint64_t)[v12 maxValue];
    uint64_t v10 = OBJC_IVAR___ISOperation__progress;
    id v11 = [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] copy];
    objc_msgSend( v11,  "setCurrentValue:",  (uint64_t)((double)(uint64_t)objc_msgSend(*(id *)&self->ISOperation_opaque[v10], "currentValue")
              + v7 * v9 * (double)(uint64_t)[*(id *)&self->ISOperation_opaque[v10] maxValue]));
    -[FinishDownloadOperation _sendProgressToDelegate:](self, "_sendProgressToDelegate:", v11);
  }
}

- (id)_downloadSessionPropertiesWithDownloadPhase:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___DownloadSessionProperties);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity clientIdentifier](self->_download, "clientIdentifier"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity handlerIdentifier](self->_download, "handlerIdentifier"));
  double v8 = -[DownloadSessionProperties initWithClientIdentifier:handlerIdentifier:]( v5,  "initWithClientIdentifier:handlerIdentifier:",  v6,  [v7 longLongValue]);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity mediaAsset](self->_download, "mediaAsset"));
  -[DownloadSessionProperties setAssetIdentifier:](v8, "setAssetIdentifier:", [v9 databaseID]);

  -[DownloadSessionProperties setDownloadIdentifier:]( v8,  "setDownloadIdentifier:",  -[FinishDownloadMemoryEntity databaseID](self->_download, "databaseID"));
  -[DownloadSessionProperties setDownloadPhase:](v8, "setDownloadPhase:", v4);

  return v8;
}

- (BOOL)_needsDRMOperationForDownloadKind:(id)a3
{
  id v3 = a3;
  if ((SSDownloadKindIsMediaKind(v3) & 1) != 0
    || (SSDownloadKindIsEBookKind(v3) & 1) != 0
    || (SSDownloadKindIsToneKind(v3) & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:SSDownloadKindInAppContent];
  }

  return v4;
}

- (void)_sendProgressToDelegate:(id)a3
{
  id v5 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadOperation delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "operation:updatedProgress:") & 1) != 0) {
    [v4 operation:self updatedProgress:v5];
  }
}

- (id)_finishResult:(int64_t)a3
{
  else {
    return off_10034F878[a3];
  }
}

- (id)_stepOperations
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity downloadKind](self->_download, "downloadKind"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity mediaAsset](self->_download, "mediaAsset"));
  if ([v5 isDRMFree])
  {
    BOOL v6 = 1;
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 DPInfoData]);
    BOOL v6 = v7 != 0LL;
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (-[FinishDownloadMemoryEntity isRestoreDownload](self->_download, "isRestoreDownload")
    && -[FinishDownloadMemoryEntity hasRestoreData](self->_download, "hasRestoreData")
    && SSDownloadKindIsSoftwareKind(v4))
  {
    double v9 = -[FinishDownloadStepOperation initWithDownload:]( objc_alloc(&OBJC_CLASS___RestoreDownloadDataOperation),  "initWithDownload:",  self->_download);
    -[FinishDownloadStepOperation setDownloadPhase:](v9, "setDownloadPhase:", SSDownloadPhaseDataRestore);
  }

  else
  {
    double v9 = 0LL;
  }

  v40 = (void *)v4;
  id v41 = v3;
  if ((id)-[FinishDownloadMemoryEntity restoreState](self->_download, "restoreState") == (id)1)
  {
    if (!v9)
    {
      uint64_t v10 = 0LL;
      id v11 = 0LL;
      goto LABEL_26;
    }

    [v3 addObject:v9];
    [v8 addObject:@"Restore Data Hard Fail"];
    uint64_t v10 = 0LL;
    id v11 = 0LL;
    goto LABEL_24;
  }

  if (v6
    || -[FinishDownloadMemoryEntity isStoreDownload](self->_download, "isStoreDownload")
    && -[FinishDownloadOperation _needsDRMOperationForDownloadKind:](self, "_needsDRMOperationForDownloadKind:", v4))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
    if (![v12 isMultiUser])
    {

      goto LABEL_21;
    }

    unsigned int v13 = -[FinishDownloadMemoryEntity isSharedDownload](self->_download, "isSharedDownload");

    if (!v13) {
      goto LABEL_21;
    }
    id v38 = (void *)objc_claimAutoreleasedReturnValue( +[EBookManifest sharedPurchasedBookManifest]( &OBJC_CLASS___EBookManifest,  "sharedPurchasedBookManifest"));
    uint64_t v37 = objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"store_publication_version"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"store_item_id"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"download_permalink"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"is_from_store"));
    unsigned int v17 = [v16 BOOLValue];

    v39 = v15;
    if (v17)
    {
      v18 = v38;
      unsigned int v19 = (void *)v14;
      uint64_t v20 = v14;
      v21 = (void *)v37;
      v22 = (void *)objc_claimAutoreleasedReturnValue([v38 bookPathForAdamID:v20 withPublicationVersion:v37]);
    }

    else
    {
      v36 = (void *)v14;
      v21 = (void *)v37;
      if (![v15 length])
      {
        v22 = 0LL;
        v18 = v38;
        unsigned int v19 = v36;
LABEL_48:

        id v3 = v41;
        if (v22) {
          goto LABEL_49;
        }
LABEL_21:
        uint64_t v10 = -[FinishDownloadStepOperation initWithDownload:]( objc_alloc(&OBJC_CLASS___DownloadDRMOperation),  "initWithDownload:",  self->_download);
        -[FinishDownloadStepOperation setDownloadPhase:](v10, "setDownloadPhase:", SSDownloadPhaseProcessing);
        [v3 addObject:v10];
        [v8 addObject:@"DRM"];
        if (!v9) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }

      v35 = v15;
      v18 = v38;
      v22 = (void *)objc_claimAutoreleasedReturnValue([v38 bookPathPermalink:v35]);
      unsigned int v19 = v36;
    }

    goto LABEL_48;
  }

- (void).cxx_destruct
{
}

@end