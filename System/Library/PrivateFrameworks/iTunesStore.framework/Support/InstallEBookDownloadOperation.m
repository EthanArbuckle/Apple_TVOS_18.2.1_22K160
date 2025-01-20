@interface InstallEBookDownloadOperation
+ (id)sharedBookContainerCachesPath;
+ (id)sharedBookContainerPath;
- (BOOL)_installMediaAsset:(id)a3 assetInstalledPath:(id *)a4 fileName:(id *)a5 drmPath:(id *)a6 error:(id *)a7;
- (id)_bookManifest;
- (id)_existingManifestEntry;
- (id)_newManifestEntry:(BOOL)a3 withFileName:(id)a4;
- (id)_newManifestEntry:(id)a3;
- (id)_storeFrontIdentifier;
- (id)_syncedBooksPath;
- (void)_addPurchaseManifestItem:(BOOL)a3;
- (void)_removeDuplicateEntry:(id)a3;
- (void)run;
@end

@implementation InstallEBookDownloadOperation

- (void)run
{
  v3 = objc_alloc_init(&OBJC_CLASS___FinishDownloadResponse);
  -[FinishDownloadResponse setResult:](v3, "setResult:", 4LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  -[FinishDownloadResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", [v4 databaseID]);
  v146 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]( [DownloadHandle alloc],  "initWithTransactionIdentifier:downloadIdentifier:",  [v4 transactionID],  objc_msgSend(v4, "databaseID"));
  -[FinishDownloadResponse setDownloadHandle:](v3, "setDownloadHandle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaAsset]);
  -[FinishDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v5 databaseID]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
  unsigned int v7 = [v6 isMultiUser];
  if (v7) {
    LOBYTE(v7) = [v4 isSharedDownload];
  }
  self->_isSharedDownload = v7;

  v144 = v3;
  v8 = &ACSLocateCachingServer_ptr;
  if (!self->_isSharedDownload)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      unsigned int v18 = v17;
    }
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = v18 & 2;
    }
    if ((_DWORD)v20)
    {
      v21 = (void *)objc_opt_class(self);
      id v22 = v21;
      int v155 = 138412546;
      v156 = v21;
      __int16 v157 = 2048;
      int64_t v158 = -[DownloadHandle downloadID](v146, "downloadID");
      v23 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: We have a normal download: %lld",  &v155,  22);

      v8 = &ACSLocateCachingServer_ptr;
      if (!v23)
      {
LABEL_18:

        v24 = 0LL;
        goto LABEL_64;
      }

      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      v129 = v19;
      SSFileLog(v16, @"%@");
    }

    goto LABEL_18;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[EBookManifest sharedPurchasedBookManifest]( &OBJC_CLASS___EBookManifest,  "sharedPurchasedBookManifest"));
  v139 = (void *)objc_claimAutoreleasedReturnValue([v4 storeMetadata]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v139 valueForMetadataKey:SSDownloadMetadataKeyPublicationVersion]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 storeItemIdentifier]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 downloadPermalink]);

  v137 = (void *)v10;
  v133 = v14;
  if ([v4 isStoreDownload])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v9 bookPathForAdamID:v12 withPublicationVersion:v10]);
LABEL_21:
    v25 = *(void **)(&self->_isSharedDownload + 5);
    *(void *)(&self->_isSharedDownload + 5) = v15;

    goto LABEL_22;
  }

  if ([v14 length])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v9 bookPathPermalink:v14]);
    goto LABEL_21;
  }

+ (id)sharedBookContainerCachesPath
{
  return 0LL;
}

+ (id)sharedBookContainerPath
{
  return 0LL;
}

- (void)_addPurchaseManifestItem:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InstallEBookDownloadOperation _bookManifest](self, "_bookManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  BOOL isSharedDownload = self->_isSharedDownload;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  v9 = (void *)v8;
  if (!isSharedDownload)
  {
    if (!v8) {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v18 = [v9 shouldLog];
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = v18 & 2;
    }
    if ((_DWORD)v20)
    {
      v21 = (void *)objc_opt_class(self);
      id v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue([v5 manifestPath]);
      int v45 = 138412546;
      v46 = v21;
      __int16 v47 = 2112;
      v48 = v23;
      v24 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Updating purchase manifest: %@",  &v45,  22);

      if (v24)
      {
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
        free(v24);
        v42 = v25;
        SSFileLog(v9, @"%@");
      }
    }

    else
    {
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaAsset]);
    id v26 = (id)objc_claimAutoreleasedReturnValue([v39 destinationFileName]);

    v38 = (void *)objc_claimAutoreleasedReturnValue([v5 manifestEntriesWithProperty:@"Path" equalToValue:v26 limitCount:1]);
    if ([v38 count]) {
      goto LABEL_48;
    }
    unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue(-[InstallEBookDownloadOperation _existingManifestEntry](self, "_existingManifestEntry"));
    id v37 = v40;
    if (v40)
    {
      [v40 setObject:v26 forKey:@"Path"];
    }

    else
    {
      id v41 = -[InstallEBookDownloadOperation _newManifestEntry:](self, "_newManifestEntry:", 0LL);
      [v5 addManifestEntry:v41];
    }

    v27 = v5;
LABEL_47:
    objc_msgSend(v27, "synchronizeData", v42);

LABEL_48:
    goto LABEL_49;
  }

  if (!v8) {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  v44 = v6;
  unsigned int v10 = [v9 shouldLog];
  else {
    LODWORD(v11) = v10;
  }
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    uint64_t v11 = v11;
  }
  else {
    v11 &= 2u;
  }
  if ((_DWORD)v11)
  {
    v13 = (void *)objc_opt_class(self);
    id v14 = v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 manifestPath]);
    int v45 = 138412546;
    v46 = v13;
    __int16 v47 = 2112;
    v48 = v15;
    v16 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Updating purchase manifest at shared path: %@",  &v45,  22);

    if (!v16) {
      goto LABEL_14;
    }
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
    free(v16);
    v42 = v12;
    SSFileLog(v9, @"%@");
  }

LABEL_14:
  -[InstallEBookDownloadOperation _removeDuplicateEntry:](self, "_removeDuplicateEntry:", v5);
  if (v3) {
    uint64_t v17 = *(void *)(&self->_isSharedDownload + 5);
  }
  else {
    uint64_t v17 = 0LL;
  }
  v6 = v44;
  id v26 = -[InstallEBookDownloadOperation _newManifestEntry:](self, "_newManifestEntry:", v17, v42);
  [v5 addManifestEntry:v26];
  [v5 synchronizeData];
  if (!v3)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[EBookManifest sharedPurchasedBookManifest]( &OBJC_CLASS___EBookManifest,  "sharedPurchasedBookManifest"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v28) {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v29 = [v28 shouldLog];
    else {
      unsigned int v30 = v29;
    }
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      uint64_t v32 = v30;
    }
    else {
      uint64_t v32 = v30 & 2;
    }
    if ((_DWORD)v32)
    {
      unsigned int v33 = (void *)objc_opt_class(self);
      id v34 = v33;
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v27 manifestPath]);
      int v45 = 138412546;
      v46 = v33;
      v6 = v44;
      __int16 v47 = 2112;
      v48 = v35;
      LODWORD(v43) = 22;
      v36 = (void *)_os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  1LL,  "%@: Updating shared manifest at path: %@",  &v45,  v43);

      if (!v36)
      {
LABEL_40:

        -[InstallEBookDownloadOperation _removeDuplicateEntry:](self, "_removeDuplicateEntry:", v27);
        id v37 = -[InstallEBookDownloadOperation _newManifestEntry:withFileName:]( self,  "_newManifestEntry:withFileName:",  1LL,  0LL);
        [v27 addManifestEntry:v37];
        v38 = v27;
        goto LABEL_47;
      }

      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v36,  4LL));
      free(v36);
      v42 = v31;
      SSFileLog(v28, @"%@");
    }

    goto LABEL_40;
  }

- (id)_bookManifest
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[EBookManifest purchasedBookManifest](&OBJC_CLASS___EBookManifest, "purchasedBookManifest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EBookManifest syncedBookManifest](&OBJC_CLASS___EBookManifest, "syncedBookManifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 libraryItemIdentifier]);
  if (v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( [v4 manifestEntriesWithProperty:@"Persistent ID" equalToValue:v6 limitCount:1]);
    if ([v7 count] == (id)1)
    {
      uint64_t v8 = v4;
      goto LABEL_6;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue( [v3 manifestEntriesWithProperty:@"Persistent ID" equalToValue:v6 limitCount:1]);

    if ([v9 count] == (id)1)
    {
      uint64_t v8 = v3;
      unsigned int v7 = v9;
LABEL_6:
      id v10 = v8;

      if (v10) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }

- (id)_existingManifestEntry
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 libraryItemIdentifier]);

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[EBookManifest syncedBookManifest](&OBJC_CLASS___EBookManifest, "syncedBookManifest"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 manifestEntriesWithProperty:@"Persistent ID" equalToValue:v3 limitCount:1]);

    if ([v5 count] == (id)1)
    {
      v6 = v5;
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[EBookManifest purchasedBookManifest](&OBJC_CLASS___EBookManifest, "purchasedBookManifest"));
      v6 = (void *)objc_claimAutoreleasedReturnValue( [v8 manifestEntriesWithProperty:@"Persistent ID" equalToValue:v3 limitCount:1]);

      if ([v6 count] != (id)1)
      {
        unsigned int v7 = 0LL;
        goto LABEL_9;
      }

      v5 = v6;
    }

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
LABEL_9:

    goto LABEL_10;
  }

  unsigned int v7 = 0LL;
LABEL_10:

  return v7;
}

- (BOOL)_installMediaAsset:(id)a3 assetInstalledPath:(id *)a4 fileName:(id *)a5 drmPath:(id *)a6 error:(id *)a7
{
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 localPath]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 sourceURLString]);
  char v143 = 0;
  if (!-[NSFileManager fileExistsAtPath:](v11, "fileExistsAtPath:", v12) && v13)
  {
    id v14 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v13);
    if (!-[NSURL isFileURL](v14, "isFileURL"))
    {
LABEL_17:

      goto LABEL_18;
    }

    v125 = a4;
    v127 = a5;
    id v129 = v10;
    unsigned int v132 = v11;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v14, "path"));
    id v142 = v12;
    -[FinishDownloadStepOperation moveFile:toPath:installBehavior:error:]( self,  "moveFile:toPath:installBehavior:error:",  v15,  &v142,  0LL,  0LL);
    id v16 = v142;

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v17) {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v18 = [v17 shouldLog];
    else {
      unsigned int v19 = v18;
    }
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = v19 & 2;
    }
    if ((_DWORD)v21)
    {
      id v22 = (void *)objc_opt_class(self);
      v23 = v13;
      id v24 = v22;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v14, "path"));
      int v144 = 138412802;
      v145 = v22;
      __int16 v146 = 2112;
      id v147 = v25;
      __int16 v148 = 2112;
      id v149 = v16;
      id v26 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  1LL,  "%@: Moved file URL: %@ to downloads directory: %@",  &v144,  32);

      v13 = v23;
      uint64_t v11 = v132;
      id v10 = v129;
      if (!v26)
      {
LABEL_16:

        uint64_t v12 = v16;
        a4 = v125;
        a5 = v127;
        goto LABEL_17;
      }

      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
      free(v26);
      v113 = v20;
      SSFileLog(v17, @"%@");
    }

    goto LABEL_16;
  }

- (id)_newManifestEntry:(id)a3
{
  return -[InstallEBookDownloadOperation _newManifestEntry:withFileName:]( self,  "_newManifestEntry:withFileName:",  0LL,  a3);
}

- (id)_newManifestEntry:(BOOL)a3 withFileName:(id)a4
{
  id v6 = a4;
  unsigned int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  if ([v6 length])
  {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v6, @"Path");
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaAsset]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 destinationFileName]);
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v10, @"Path");
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 isSampleDownload]));
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v11, @"isSample");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 collectionName]);
  if (v12) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v12, @"Album");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 artistName]);

  if (v13) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v13, @"Artist");
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 artworkTemplateName]);

  if (v14) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v14, @"artwork-template-name");
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 genreName]);

  if (v15) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v15, @"Genre");
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 libraryItemIdentifier]);

  if (v16) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v16, @"Persistent ID");
  }
  if (!a3)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 storeAccountIdentifier]);
    if (v17) {
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v17, @"DSID");
    }
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v8 storeAccountName]);
    id v19 = [v18 length];
    if (v17 && !v19)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountWithUniqueIdentifier:v16]);
      if (!v21) {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 activeAccount]);
      }
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 accountName]);

      unsigned int v18 = (void *)v22;
    }

    if (v18) {
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v18, @"AppleID");
    }
    if (self->_isSharedDownload)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
      unsigned int v24 = [v23 isMultiUser];

      if (v24) {
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", &__kCFBooleanTrue, @"usesSharedAsset");
      }
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadPermalink]);

  if (v25) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v25, @"iTunesU Permlink");
  }
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[InstallEBookDownloadOperation _storeFrontIdentifier](self, "_storeFrontIdentifier"));

  if (v26) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v26, @"Storefront ID");
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue([v8 storeXID]);

  if (v27) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v27, @"XID");
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);

  if (v28) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v28, @"Name");
  }
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v8 storeItemIdentifier]);
  uint64_t v30 = SSGetItemIdentifierFromValue(v29);

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v30));
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v31, @"s");
  }

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v8 storeCollectionIdentifier]);
  uint64_t v33 = SSGetItemIdentifierFromValue(v32);

  if (v28)
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v33));
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v34, @"PlaylistID");
  }

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v8 storeMetadata]);
  id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 copyright]);

  if (v36) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v36, @"Copyright");
  }
  if ([v35 isExplicitContent])
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v37, @"isExplicit");
  }

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v35 valueForMetadataKey:SSDownloadMetadataKeyHumanReadablePublicationVersion]);

  if (v38) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v38, @"Human Readable Publication Version");
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue([v35 valueForMetadataKey:SSDownloadMetadataKeyLanguages]);

  if (v39) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v39, @"Languages");
  }
  unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([v35 valueForMetadataKey:SSDownloadMetadataKeyPageProgression]);

  if (v40) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v40, @"PageProgression");
  }
  id v41 = (void *)objc_claimAutoreleasedReturnValue([v35 pageProgressionDirection]);

  if (v41) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v41, @"Page Progression Direction");
  }
  unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v35 valueForMetadataKey:SSDownloadMetadataKeyPublicationVersion]);

  if (v42) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v42, @"Publication Version");
  }
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v35 releaseDateString]);

  if (v43) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v43, @"Release Date");
  }
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v35 sortArtistName]);

  if (v44) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v44, @"Sort Artist");
  }
  int v45 = (void *)objc_claimAutoreleasedReturnValue([v35 sortCollectionName]);

  if (v45) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v45, @"Sort Album");
  }
  id v46 = (void *)objc_claimAutoreleasedReturnValue([v35 sortTitle]);

  if (v46) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v46, @"Sort Name");
  }
  __int16 v47 = (void *)objc_claimAutoreleasedReturnValue([v35 primaryAssetDictionary]);

  if (v47
    || (__int16 v47 = (void *)objc_claimAutoreleasedReturnValue([v35 valueForMetadataKey:SSDownloadMetadataKeyAssetInfo])) != 0)
  {
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKey:SSDownloadMetadataKeyAssetFlavor]);
    if (v48) {
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v48, @"Flavor");
    }
  }

  return v7;
}

- (void)_removeDuplicateEntry:(id)a3
{
  id v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 storeItemIdentifier]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v14 manifestEntriesWithProperty:@"s" equalToValue:v5 limitCount:1]);
    if ([v6 count] == (id)1) {
      [v14 removeManifestEntryWithStoreItemID:v5];
    }
LABEL_7:

    goto LABEL_8;
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadPermalink]);
  id v9 = [v8 length];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 downloadPermalink]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [v14 manifestEntriesWithProperty:@"iTunesU Permlink" equalToValue:v11 limitCount:1]);

    if ([v6 count] == (id)1)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 downloadPermalink]);
      [v14 removeManifestEntryWithDownloadPermalink:v13];
    }

    goto LABEL_7;
  }

- (id)_storeFrontIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 storeFrontIdentifier]);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 storeAccountIdentifier]);
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountWithUniqueIdentifier:v4]);

      if (v6)
      {
        BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v6 storeFrontIdentifier]);
        if (v3) {
          goto LABEL_8;
        }
      }
    }

    else
    {
      id v6 = 0LL;
    }

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v7 storeFrontIdentifier]);

LABEL_8:
  }

  return v3;
}

- (id)_syncedBooksPath
{
  v2 = objc_alloc(&OBJC_CLASS___NSArray);
  BOOL v3 = -[NSArray initWithObjects:]( v2,  "initWithObjects:",  CPSharedResourcesDirectory(v2),  @"Media",  @"Books",  0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v3));

  return v4;
}

- (void).cxx_destruct
{
}

@end