@interface FinishDownloadStepOperation
- (BOOL)downloadAndInstallAsset:(id)a3 error:(id *)a4;
- (BOOL)downloadAsset:(id)a3 error:(id *)a4;
- (BOOL)installAsset:(id)a3 error:(id *)a4;
- (BOOL)moveAsset:(id)a3 toPath:(id *)a4 installBehavior:(int64_t)a5 error:(id *)a6;
- (BOOL)moveFile:(id)a3 toPath:(id *)a4 installBehavior:(int64_t)a5 error:(id *)a6;
- (BOOL)removeInstalledAsset:(id)a3 error:(id *)a4;
- (BOOL)rollbackAsset:(id)a3 error:(id *)a4;
- (BOOL)unzipAsset:(id)a3 unzippedPath:(id *)a4 error:(id *)a5;
- (BOOL)writeBinaryPropertyList:(id)a3 toPath:(id)a4 error:(id *)a5;
- (FinishDownloadMemoryEntity)download;
- (FinishDownloadStepOperation)initWithDownload:(id)a3;
- (NSString)downloadPhase;
- (double)progressFraction;
- (id)_newURLOperationWithAsset:(id)a3;
- (id)documentsDirectoryPathWithClientIdentifier:(id)a3 downloadKind:(id)a4;
- (id)outputBlock;
- (void)addPurchaseManifestItem;
- (void)addPurchaseManifestItemWithLibraryIdentifier:(id)a3;
- (void)finishWithDownloadResponse:(id)a3;
- (void)setDownloadPhase:(id)a3;
- (void)setOutputBlock:(id)a3;
- (void)setProgressFraction:(double)a3;
@end

@implementation FinishDownloadStepOperation

- (FinishDownloadStepOperation)initWithDownload:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FinishDownloadStepOperation;
  v6 = -[FinishDownloadStepOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_download, a3);
  }

  return v7;
}

- (void)addPurchaseManifestItem
{
}

- (void)addPurchaseManifestItemWithLibraryIdentifier:(id)a3
{
  id v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadKind]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[PurchaseManifest sharedManifestForDownloadKind:]( &OBJC_CLASS___PurchaseManifest,  "sharedManifestForDownloadKind:",  v5));

  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___PurchaseManifestItem);
    -[PurchaseManifestItem setLibraryPersistentIdentifier:](v7, "setLibraryPersistentIdentifier:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaAsset]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 destinationFileName]);
    -[PurchaseManifestItem setRelativeMediaAssetPath:](v7, "setRelativeMediaAssetPath:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 ITunesMetadataDestinationPath]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
    -[PurchaseManifestItem setRelativeMetadataPath:](v7, "setRelativeMetadataPath:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 secondaryAssetForType:SSDownloadAssetTypeArtwork]);
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v12 destinationFileName]);
      -[PurchaseManifestItem setRelativeArtworkPath:](v7, "setRelativeArtworkPath:", v14);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 secondaryAssetForType:SSDownloadAssetTypeXMLFeed]);

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 destinationFileName]);
      -[PurchaseManifestItem setRelativeFeedAssetPath:](v7, "setRelativeFeedAssetPath:", v16);
    }

    [v6 addCompletedItem:v7];
  }
}

- (NSString)downloadPhase
{
  id v3 = -[NSString copy](self->_downloadPhase, "copy");
  -[FinishDownloadStepOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (id)documentsDirectoryPathWithClientIdentifier:(id)a3 downloadKind:(id)a4
{
  id v5 = a3;
  LODWORD(a4) = SSDownloadKindIsThirdPartyKind(a4);
  v6 = objc_alloc(&OBJC_CLASS___NSArray);
  if ((_DWORD)a4) {
    v7 = -[NSArray initWithObjects:](v6, "initWithObjects:", @"Library", @"Caches", 0LL);
  }
  else {
    v7 = -[NSArray initWithObjects:](v6, "initWithObjects:", @"Documents", 0LL, v22);
  }
  v8 = v7;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v5));
  v10 = v9;
  if (v9
    && (v11 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationType]),
        unsigned int v12 = [v11 isEqualToString:LSUserApplicationType],
        v11,
        v12))
  {
    v13 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 dataContainerURL]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
    v16 = -[NSMutableArray initWithObjects:](v13, "initWithObjects:", v15, 0LL);

    -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:", v8);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v16));
  }

  else
  {
    v18 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v19 lastObject]);

    v20 = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  v16,  @"Containers",  v5,  0LL);
    -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v8);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v20));
  }

  return v17;
}

- (BOOL)downloadAndInstallAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[FinishDownloadStepOperation _newURLOperationWithAsset:](self, "_newURLOperationWithAsset:", v6);
  v46 = a4;
  if (!v7)
  {
    id v31 = 0LL;
    goto LABEL_31;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    unsigned int v10 = v9;
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v10 & 2;
  }
  if ((_DWORD)v12)
  {
    v13 = (void *)objc_opt_class(self);
    id v14 = v13;
    id v15 = [v6 databaseID];
    id v16 = -[FinishDownloadMemoryEntity databaseID](self->_download, "databaseID");
    int v49 = 138412802;
    v50 = v13;
    __int16 v51 = 2048;
    id v52 = v15;
    __int16 v53 = 2048;
    id v54 = v16;
    id v17 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Downloading asset: %lld for download: %lld",  &v49,  32);

    if (!v17) {
      goto LABEL_14;
    }
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
    free(v17);
    v43 = v11;
    SSFileLog(v8, @"%@");
  }

LABEL_14:
  id v48 = 0LL;
  unsigned int v18 = -[FinishDownloadStepOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  &v48);
  id v19 = v48;
  v20 = v19;
  if (!v18)
  {
    id v31 = v19;
    goto LABEL_31;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v21) {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v22 = objc_msgSend(v21, "shouldLog", v43);
  else {
    unsigned int v23 = v22;
  }
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = v23 & 2;
  }
  if ((_DWORD)v25)
  {
    v26 = (void *)objc_opt_class(self);
    id v45 = v26;
    id v27 = [v6 databaseID];
    id v28 = -[FinishDownloadMemoryEntity databaseID](self->_download, "databaseID");
    int v49 = 138412802;
    v50 = v26;
    __int16 v51 = 2048;
    id v52 = v27;
    __int16 v53 = 2048;
    id v54 = v28;
    LODWORD(v44) = 32;
    v29 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  1LL,  "%@: Installing asset: %lld for download: %lld",  &v49,  v44);

    if (!v29) {
      goto LABEL_27;
    }
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
    free(v29);
    v43 = v24;
    SSFileLog(v21, @"%@");
  }

LABEL_27:
  id v47 = v20;
  unsigned __int8 v30 = -[FinishDownloadStepOperation installAsset:error:](self, "installAsset:error:", v6, &v47);
  id v31 = v47;

  if ((v30 & 1) != 0)
  {
    BOOL v32 = 1;
    goto LABEL_45;
  }

- (BOOL)downloadAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[FinishDownloadStepOperation _newURLOperationWithAsset:](self, "_newURLOperationWithAsset:", v6);
  if (!v7)
  {
    id v19 = 0LL;
    unsigned __int8 v18 = 0;
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    unsigned int v10 = v9;
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v10 & 2;
  }
  if ((_DWORD)v12)
  {
    v13 = (void *)objc_opt_class(self);
    id v21 = v13;
    id v14 = [v6 databaseID];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 assetType]);
    id v16 = -[FinishDownloadMemoryEntity databaseID](self->_download, "databaseID");
    int v23 = 138413058;
    v24 = v13;
    __int16 v25 = 2048;
    id v26 = v14;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2048;
    id v30 = v16;
    id v17 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Downloading asset: %lld with type: %@ for download: %lld",  &v23,  42);

    if (!v17) {
      goto LABEL_14;
    }
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
    free(v17);
    SSFileLog(v8, @"%@");
  }

LABEL_14:
  id v22 = 0LL;
  unsigned __int8 v18 = -[FinishDownloadStepOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  &v22);
  id v19 = v22;
  if (!a4) {
    goto LABEL_19;
  }
LABEL_17:
  if ((v18 & 1) == 0) {
    *a4 = v19;
  }
LABEL_19:

  return v18;
}

- (void)finishWithDownloadResponse:(id)a3
{
  id v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);
  -[FinishDownloadStepOperation setError:](self, "setError:", v4);

  -[FinishDownloadStepOperation setSuccess:](self, "setSuccess:", [v8 result] == (id)4);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation outputBlock](self, "outputBlock"));
  id v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
    -[FinishDownloadStepOperation setOutputBlock:](self, "setOutputBlock:", 0LL);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kSSNotificationDownloadFinished, 0LL, 0LL, 1u);
}

- (BOOL)installAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 localPath]);
  if (!-[NSFileManager fileExistsAtPath:](v7, "fileExistsAtPath:", v8))
  {
    id v14 = 0LL;
    BOOL v12 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity destinationDirectoryPathForAsset:]( self->_download,  "destinationDirectoryPathForAsset:",  v6));
  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationFileName]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v10]);

    id v16 = 0LL;
    id v17 = v11;
    BOOL v12 = -[FinishDownloadStepOperation moveAsset:toPath:installBehavior:error:]( self,  "moveAsset:toPath:installBehavior:error:",  v6,  &v17,  0LL,  &v16);
    id v13 = v17;

    id v14 = v16;
  }

  else
  {
    id v14 = 0LL;
    BOOL v12 = 0;
  }

  if (a4)
  {
LABEL_8:
    if (!v12) {
      *a4 = v14;
    }
  }

- (BOOL)moveAsset:(id)a3 toPath:(id *)a4 installBehavior:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localPath]);
  BOOL v12 = -[FinishDownloadStepOperation moveFile:toPath:installBehavior:error:]( self,  "moveFile:toPath:installBehavior:error:",  v11,  a4,  a5,  a6);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 fileAttributes]);
    if ([v13 count])
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
      -[NSFileManager setAttributes:ofItemAtPath:error:](v14, "setAttributes:ofItemAtPath:error:", v13, *a4, 0LL);
    }
  }

  return v12;
}

- (BOOL)moveFile:(id)a3 toPath:(id *)a4 installBehavior:(int64_t)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([*a4 stringByDeletingLastPathComponent]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([*a4 lastPathComponent]);
  v68 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByDeletingPathExtension]);
  v66 = v11;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pathExtension]);
  id v13 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  id v14 = v13;
  v67 = (void *)v10;
  if (!v10)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v30) {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v31 = [v30 shouldLog];
    else {
      unsigned int v32 = v31;
    }
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      uint64_t v34 = v32;
    }
    else {
      uint64_t v34 = v32 & 2;
    }
    if ((_DWORD)v34)
    {
      LOWORD(v71) = 0;
      v35 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  16LL,  "DownloadInstaller: Missing destination path",  &v71,  2);

      __int16 v29 = v11;
      if (v35)
      {
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  4LL));
        free(v35);
        SSFileLog(v30, @"%@");
      }
    }

    else
    {

      __int16 v29 = v11;
    }

    uint64_t v54 = SSErrorDomain;
    NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
    v74 = @"DownloadInstaller: Missing destination path";
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v54,  137LL,  v55));

    char v39 = 0;
    id v40 = 0LL;
    goto LABEL_69;
  }

  v63 = a6;
  id v64 = v9;
  uint64_t v15 = 1LL;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v13,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v10,  1LL,  0LL,  0LL);
  v62 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v10,  1LL);
  unsigned int v61 = -[NSURL startAccessingSecurityScopedResource](v62, "startAccessingSecurityScopedResource");
  v65 = 0LL;
  uint64_t v60 = SSErrorDomain;
LABEL_3:
  id v16 = (void *)v10;
  do
  {
    unsigned int v17 = -[NSFileManager fileExistsAtPath:](v14, "fileExistsAtPath:", *a4);
    if (!v17)
    {
      id v37 = *a4;
      id v9 = v64;
      id v69 = v65;
      unsigned __int8 v38 = -[NSFileManager moveItemAtPath:toPath:error:](v14, "moveItemAtPath:toPath:error:", v64, v37, &v69);
      id v22 = v69;

      if ((v38 & 1) != 0)
      {
        __int16 v29 = v66;
        goto LABEL_35;
      }

      id v48 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v48) {
        id v48 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v49 = [v48 shouldLog];
      else {
        unsigned int v50 = v49;
      }
      __int16 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 OSLogObject]);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        uint64_t v52 = v50;
      }
      else {
        uint64_t v52 = v50 & 2;
      }
      a6 = v63;
      if ((_DWORD)v52)
      {
        int v71 = 138412290;
        id v72 = v22;
        LODWORD(v58) = 12;
        __int16 v53 = (void *)_os_log_send_and_compose_impl( v52,  0LL,  0LL,  0LL,  &_mh_execute_header,  v51,  16LL,  "DownloadInstaller: File move failed: %@",  &v71,  v58);

        __int16 v29 = v66;
        if (!v53)
        {
LABEL_66:

          goto LABEL_67;
        }

        __int16 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v53,  4LL));
        free(v53);
        v57 = v51;
        SSFileLog(v48, @"%@");
      }

      else
      {
        __int16 v29 = v66;
      }

      goto LABEL_66;
    }

    if (a5 != 1)
    {
      id v21 = *a4;
      id v70 = v65;
      unsigned __int8 v59 = -[NSFileManager removeItemAtPath:error:](v14, "removeItemAtPath:error:", v21, &v70);
      id v22 = v70;

      v65 = v22;
      if ((v59 & 1) != 0) {
        goto LABEL_3;
      }
      int v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v23) {
        int v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v24 = [v23 shouldLog];
      else {
        unsigned int v25 = v24;
      }
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v27 = v25;
      }
      else {
        uint64_t v27 = v25 & 2;
      }
      id v9 = v64;
      if ((_DWORD)v27)
      {
        int v71 = 138412290;
        id v72 = v22;
        LODWORD(v58) = 12;
        id v28 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "DownloadInstaller: File delete failed: %@",  &v71,  v58);

        __int16 v29 = v66;
        if (!v28)
        {
LABEL_75:

LABEL_35:
          char v39 = v17 ^ 1;
          id v40 = v62;
          a6 = v63;
          if (!v61) {
            goto LABEL_69;
          }
          goto LABEL_68;
        }

        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v28,  4LL));
        free(v28);
        v57 = v26;
        SSFileLog(v23, @"%@");
      }

      else
      {
        __int16 v29 = v66;
      }

      goto LABEL_75;
    }

    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%ld",  v68,  v15));
    if ([v12 length])
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathExtension:v12]);

      unsigned __int8 v18 = (void *)v19;
      id v16 = (void *)v10;
    }

    *a4 = (id)objc_claimAutoreleasedReturnValue([v16 stringByAppendingPathComponent:v18]);
  }

  while (v15++ < 10000);
  uint64_t v41 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  v42 = (void *)v41;
  if (!v41) {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v43 = [v42 shouldLog];
  else {
    unsigned int v44 = v43;
  }
  id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 OSLogObject]);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v46 = v44;
  }
  else {
    uint64_t v46 = v44 & 2;
  }
  a6 = v63;
  id v9 = v64;
  if ((_DWORD)v46)
  {
    int v71 = 138412290;
    __int16 v29 = v66;
    id v72 = v66;
    LODWORD(v58) = 12;
    id v47 = (void *)_os_log_send_and_compose_impl( v46,  0LL,  0LL,  0LL,  &_mh_execute_header,  v45,  0LL,  "DownloadInstaller: File rename failed after too many tries: %@",  &v71,  v58);

    if (v47)
    {
      id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v47,  4LL));
      free(v47);
      v57 = v45;
      SSFileLog(v42, @"%@");
      goto LABEL_62;
    }
  }

  else
  {
    __int16 v29 = v66;
LABEL_62:
  }

  id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v60,  100LL,  0LL));
LABEL_67:
  char v39 = 0;
  id v40 = v62;
  if ((v61 & 1) == 0) {
    goto LABEL_69;
  }
LABEL_68:
  -[NSURL stopAccessingSecurityScopedResource](v40, "stopAccessingSecurityScopedResource", v57);
LABEL_69:
  if (a6 && (v39 & 1) == 0) {
    *a6 = v22;
  }

  return v39;
}

- (BOOL)removeInstalledAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity destinationDirectoryPathForAsset:]( self->_download,  "destinationDirectoryPathForAsset:",  v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationFileName]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v9]);
  if (!-[NSFileManager fileExistsAtPath:](v7, "fileExistsAtPath:", v10))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v21) {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v22 = [v21 shouldLog];
    else {
      LODWORD(v23) = v22;
    }
    unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v23 = v23;
    }
    else {
      v23 &= 2u;
    }
    if ((_DWORD)v23)
    {
      int v36 = 138543618;
      id v37 = (id)objc_opt_class(self);
      __int16 v38 = 2114;
      char v39 = v10;
      id v25 = v37;
      id v26 = (void *)_os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "%{public}@: Installed asset couldn't be found at %{public}@. Reporting successful removal.",  &v36,  22);

      if (!v26)
      {
LABEL_28:

        id v12 = 0LL;
        goto LABEL_29;
      }

      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
      free(v26);
      SSFileLog(v21, @"%@");
    }

    goto LABEL_28;
  }

  id v35 = 0LL;
  unsigned int v11 = -[NSFileManager removeItemAtPath:error:](v7, "removeItemAtPath:error:", v10, &v35);
  id v12 = v35;
  uint64_t v13 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  id v14 = (void *)v13;
  if (v11)
  {
    if (!v13) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v15 = [v14 shouldLog];
    else {
      LODWORD(v16) = v15;
    }
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      unsigned __int8 v18 = (void *)objc_opt_class(self);
      int v36 = 138543618;
      id v37 = v18;
      __int16 v38 = 2114;
      char v39 = v10;
      id v19 = v18;
      v20 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "%{public}@: Removing installed file at: %{public}@.",  &v36,  22);

      if (!v20)
      {
LABEL_15:

LABEL_29:
        BOOL v27 = 1;
        goto LABEL_30;
      }

      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      SSFileLog(v14, @"%@");
    }

    goto LABEL_15;
  }

  if (!v13) {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v29 = [v14 shouldLog];
  else {
    LODWORD(v30) = v29;
  }
  unsigned int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    uint64_t v30 = v30;
  }
  else {
    v30 &= 2u;
  }
  if ((_DWORD)v30)
  {
    unsigned int v32 = (void *)objc_opt_class(self);
    int v36 = 138543874;
    id v37 = v32;
    __int16 v38 = 2114;
    char v39 = v10;
    __int16 v40 = 2114;
    id v41 = v12;
    id v33 = v32;
    uint64_t v34 = (void *)_os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  16LL,  "%{public}@: Installed asset removal at %{public}@ failed with error: %{public}@.",  &v36,  32);

    if (!v34) {
      goto LABEL_43;
    }
    unsigned int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v34,  4LL));
    free(v34);
    SSFileLog(v14, @"%@");
  }

LABEL_43:
  if (a4)
  {
    id v12 = v12;
    BOOL v27 = 0;
    *a4 = v12;
  }

  else
  {
    BOOL v27 = 0;
  }

- (id)outputBlock
{
  id v3 = [self->_outputBlock copy];
  -[FinishDownloadStepOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (double)progressFraction
{
  double progressFraction = self->_progressFraction;
  -[FinishDownloadStepOperation unlock](self, "unlock");
  return progressFraction;
}

- (BOOL)rollbackAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity destinationDirectoryPathForAsset:]( self->_download,  "destinationDirectoryPathForAsset:",  v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationFileName]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v9]);

  if (!-[NSFileManager fileExistsAtPath:](v7, "fileExistsAtPath:", v10)) {
    goto LABEL_19;
  }
  id v35 = a4;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 localPath]);
  if (!-[NSFileManager fileExistsAtPath:](v7, "fileExistsAtPath:", v11))
  {
    id v13 = 0LL;
LABEL_6:
    uint64_t v34 = v8;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v15) {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v16) = [v15 shouldLog];
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      unsigned __int8 v18 = (void *)objc_opt_class(self);
      int v38 = 138412546;
      char v39 = v18;
      __int16 v40 = 2112;
      id v41 = v11;
      id v19 = v11;
      id v20 = v18;
      id v21 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "%@: Rolling file back to %@",  &v38,  22);

      unsigned int v11 = v19;
      id v8 = v34;
      if (!v21)
      {
LABEL_17:

        id v36 = v13;
        unsigned int v22 = -[NSFileManager moveItemAtPath:toPath:error:](v7, "moveItemAtPath:toPath:error:", v10, v11, &v36);
        id v14 = v36;

        if (!v22) {
          goto LABEL_20;
        }

LABEL_19:
        id v14 = 0LL;
        BOOL v23 = 1;
        goto LABEL_34;
      }

      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
      free(v21);
      unsigned int v31 = v17;
      SSFileLog(v15, @"%@");
    }

    goto LABEL_17;
  }

  id v37 = 0LL;
  unsigned int v12 = -[NSFileManager removeItemAtPath:error:](v7, "removeItemAtPath:error:", v11, &v37);
  id v13 = v37;
  id v14 = v13;
  if (v12) {
    goto LABEL_6;
  }
LABEL_20:
  id v33 = v11;
  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v31));
  if (!v24) {
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v25) = [v24 shouldLog];
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v25 = v25;
  }
  else {
    v25 &= 2u;
  }
  if ((_DWORD)v25)
  {
    BOOL v27 = (void *)objc_opt_class(self);
    int v38 = 138412546;
    char v39 = v27;
    __int16 v40 = 2112;
    id v41 = v14;
    id v28 = v27;
    LODWORD(v32) = 22;
    unsigned int v29 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "%@: File rollback failed: %@",  &v38,  v32);

    unsigned int v11 = v33;
    if (!v29) {
      goto LABEL_31;
    }
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
    free(v29);
    SSFileLog(v24, @"%@");
  }

LABEL_31:
  -[NSFileManager removeItemAtPath:error:](v7, "removeItemAtPath:error:", v10, 0LL);

  if (v35)
  {
    id v14 = v14;
    BOOL v23 = 0;
    id *v35 = v14;
  }

  else
  {
    BOOL v23 = 0;
  }

- (void)setDownloadPhase:(id)a3
{
  id v6 = (NSString *)a3;
  -[FinishDownloadStepOperation lock](self, "lock");
  if (self->_downloadPhase != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    downloadPhase = self->_downloadPhase;
    self->_downloadPhase = v4;
  }

  -[FinishDownloadStepOperation unlock](self, "unlock");
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  -[FinishDownloadStepOperation lock](self, "lock");
  if (self->_outputBlock != v6)
  {
    id v4 = [v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }

  -[FinishDownloadStepOperation unlock](self, "unlock");
}

- (void)setProgressFraction:(double)a3
{
  self->_double progressFraction = a3;
  -[FinishDownloadStepOperation unlock](self, "unlock");
}

- (BOOL)unzipAsset:(id)a3 unzippedPath:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localPath]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathExtension:@"ext"]);
  unsigned int v11 = objc_alloc_init(&OBJC_CLASS___ExtractFileOperation);
  -[ExtractFileOperation setDestinationFilePath:](v11, "setDestinationFilePath:", v10);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 fileAttributes]);

  -[ExtractFileOperation setFileAttributes:](v11, "setFileAttributes:", v12);
  -[ExtractFileOperation setShouldRunWithBackgroundPriority:](v11, "setShouldRunWithBackgroundPriority:", 1LL);
  -[ExtractFileOperation setSourceFilePath:](v11, "setSourceFilePath:", v9);
  -[ExtractFileOperation setSourceFileType:](v11, "setSourceFileType:", 0LL);
  id v17 = 0LL;
  unsigned int v13 = -[FinishDownloadStepOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v11,  &v17);
  id v14 = v17;
  unsigned int v15 = v14;
  if (v13)
  {
    id v14 = v10;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  a4 = a5;
  if (a5) {
LABEL_5:
  }
    *a4 = v14;
LABEL_6:

  return v13;
}

- (BOOL)writeBinaryPropertyList:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v30 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a3,  200LL,  0LL,  &v30));
  id v9 = v30;
  uint64_t v10 = v9;
  if (v8)
  {
    id v29 = v9;
    unsigned int v11 = [v8 writeToFile:v7 options:1 error:&v29];
    id v12 = v29;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    id v14 = (void *)v13;
    if (v11)
    {
      if (!v13) {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v15 = [v14 shouldLog];
      else {
        unsigned int v16 = v15;
      }
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = v16 & 2;
      }
      if ((_DWORD)v18)
      {
        int v31 = 138412290;
        id v32 = v7;
        id v19 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  1LL,  "DownloadInstaller: Wrote plist to: %@",  &v31,  12);

        if (!v19)
        {
LABEL_15:

          BOOL v20 = 1;
          goto LABEL_42;
        }

        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
        free(v19);
        SSFileLog(v14, @"%@");
      }

      goto LABEL_15;
    }

    if (!v13) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v25 = [v14 shouldLog];
    unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = v25 & 2;
    }
    if ((_DWORD)v26)
    {
      int v31 = 138412290;
      id v32 = v12;
      BOOL v27 = (void *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "DownloadInstaller: Could not write plist: %@",  &v31,  12);

      if (!v27) {
        goto LABEL_39;
      }
      unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v27,  4LL));
      free(v27);
      SSFileLog(v14, @"%@");
    }

    uint64_t v10 = v12;
    goto LABEL_37;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v14) {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v21 = [v14 shouldLog];
  unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = v21 & 2;
  }
  if (!(_DWORD)v23)
  {
LABEL_37:

    goto LABEL_38;
  }

  int v31 = 138412290;
  id v32 = v10;
  unsigned int v24 = (void *)_os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "DownloadInstaller: Could not serialize plist: %@",  &v31,  12);

  if (v24)
  {
    unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
    free(v24);
    SSFileLog(v14, @"%@");
    goto LABEL_37;
  }

- (id)_newURLOperationWithAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sourceURLString]);
  if (!v5)
  {
    id v6 = 0LL;
    goto LABEL_7;
  }

  id v6 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v5);
  if (!v6)
  {
LABEL_7:
    id v8 = 0LL;
    goto LABEL_10;
  }

  id v7 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  v6);
  -[SSMutableURLRequestProperties setAllowedRetryCount:](v7, "setAllowedRetryCount:", 0LL);
  -[SSMutableURLRequestProperties setRequiresExtendedValidationCertificates:]( v7,  "setRequiresExtendedValidationCertificates:",  0LL);
  if (([v4 isExternalAsset] & 1) != 0
    || !-[FinishDownloadMemoryEntity isStoreDownload](self->_download, "isStoreDownload"))
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___ISURLOperation);
    [v8 _setUsesPrivateCookieStore:0];
    uint64_t v9 = 0LL;
    uint64_t v10 = 2LL;
  }

  else
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    [v8 setCanSendGUIDParameter:0];
    uint64_t v9 = 1LL;
    [v8 setUrlKnownToBeTrusted:1];
    uint64_t v10 = 0LL;
  }

  -[SSMutableURLRequestProperties setITunesStoreRequest:](v7, "setITunesStoreRequest:", v9);
  -[SSMutableURLRequestProperties setURLBagType:](v7, "setURLBagType:", v10);
  [v8 setRequestProperties:v7];
  id v11 = objc_alloc_init(&OBJC_CLASS___ISHashedDownloadProvider);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 localPath]);
  [v11 setLocalFilePath:v12];

  [v8 setDataProvider:v11];
LABEL_10:

  return v8;
}

- (FinishDownloadMemoryEntity)download
{
  return self->_download;
}

- (void).cxx_destruct
{
}

@end