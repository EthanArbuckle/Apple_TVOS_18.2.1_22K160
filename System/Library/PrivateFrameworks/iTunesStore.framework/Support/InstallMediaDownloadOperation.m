@interface InstallMediaDownloadOperation
- (BOOL)_areSourceAndDestinationEqual;
- (BOOL)_installExternalDownload:(id *)a3;
- (BOOL)_isDaemonOwned;
- (id)_installDaemonOwnedDownload:(id *)a3;
- (id)_newIPodLibraryItem;
- (void)_updateRentalsPlist;
- (void)run;
@end

@implementation InstallMediaDownloadOperation

- (void)run
{
  v3 = objc_alloc_init(&OBJC_CLASS___FinishDownloadResponse);
  -[FinishDownloadResponse setResult:](v3, "setResult:", 4LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  -[FinishDownloadResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", [v4 databaseID]);
  v5 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]( [DownloadHandle alloc],  "initWithTransactionIdentifier:downloadIdentifier:",  [v4 transactionID],  objc_msgSend(v4, "databaseID"));
  -[FinishDownloadResponse setDownloadHandle:](v3, "setDownloadHandle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaAsset]);
  -[FinishDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v6 databaseID]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 secondaryAssetForType:SSDownloadAssetTypeArtwork]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 secondaryAssetForType:SSDownloadAssetTypeXMLFeed]);
  if (v7)
  {
    id v34 = 0LL;
    unsigned __int8 v9 = -[FinishDownloadStepOperation downloadAndInstallAsset:error:](self, "downloadAndInstallAsset:error:", v7, &v34);
    id v10 = v34;
    if ((v9 & 1) == 0)
    {
      unsigned int v11 = [v4 isPodcastDownload];
      if (!v11) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  unsigned int v11 = 1;
LABEL_7:
  if (v8) {
    -[FinishDownloadStepOperation downloadAndInstallAsset:error:](self, "downloadAndInstallAsset:error:", v8, 0LL);
  }
LABEL_9:
  unsigned __int8 v12 = -[InstallMediaDownloadOperation _areSourceAndDestinationEqual](self, "_areSourceAndDestinationEqual");
  if (!v11 || (v12 & 1) != 0)
  {
    if (!v11) {
      goto LABEL_19;
    }
  }

  else
  {
    id v33 = v10;
    unsigned __int8 v13 = -[FinishDownloadStepOperation installAsset:error:](self, "installAsset:error:", v6, &v33);
    id v14 = v33;

    id v10 = v14;
    if ((v13 & 1) == 0) {
      goto LABEL_19;
    }
  }

  if (!-[InstallMediaDownloadOperation _isDaemonOwned](self, "_isDaemonOwned"))
  {
    id v32 = v10;
    unsigned __int8 v19 = -[InstallMediaDownloadOperation _installExternalDownload:](self, "_installExternalDownload:", &v32);
    id v16 = v32;

    id v10 = v16;
    if ((v19 & 1) != 0) {
      goto LABEL_26;
    }
LABEL_19:
    if (!v7)
    {
LABEL_21:
      if (v8) {
        -[FinishDownloadStepOperation rollbackAsset:error:](self, "rollbackAsset:error:", v8, 0LL);
      }
      if (v6) {
        -[FinishDownloadStepOperation rollbackAsset:error:](self, "rollbackAsset:error:", v6, 0LL);
      }
      -[FinishDownloadResponse setError:](v3, "setError:", v10);
      -[FinishDownloadResponse setResult:](v3, "setResult:", 0LL);
      id v16 = v10;
      goto LABEL_26;
    }

- (BOOL)_areSourceAndDestinationEqual
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaAsset]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localPath]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v2 destinationDirectoryPathForAsset:v3]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 destinationFileName]);
  v7 = (void *)v6;
  unsigned __int8 v8 = 0;
  unsigned __int8 v9 = 0LL;
  if (v5)
  {
    if (v6)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v6]);
      unsigned __int8 v9 = (void *)v10;
      unsigned __int8 v8 = 0;
      if (v4)
      {
        if (v10) {
          unsigned __int8 v8 = [v4 isEqualToString:v10];
        }
      }
    }
  }

  return v8;
}

- (id)_installDaemonOwnedDownload:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  id v6 = -[InstallMediaDownloadOperation _newIPodLibraryItem](self, "_newIPodLibraryItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 storeMetadata]);
  [v6 setItemMetadata:v8];

  unsigned __int8 v9 = -[AddItemToIPodLibraryOperation initWithIPodLibraryItem:]( objc_alloc(&OBJC_CLASS___AddItemToIPodLibraryOperation),  "initWithIPodLibraryItem:",  v6);
  id v26 = 0LL;
  unsigned __int8 v10 = -[InstallMediaDownloadOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v9,  &v26);
  id v11 = v26;
  if ((v10 & 1) != 0)
  {
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddItemToIPodLibraryOperation IPodLibraryItem](v9, "IPodLibraryItem"));
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 itemMetadata]);
    [v5 setStoreMetadata:v13];

    id v14 = [v5 newITunesMetadataDictionary];
    uint64_t v15 = SSDownloadMetadataKeyAdditionalInfo;
    id v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v14 objectForKey:SSDownloadMetadataKeyAdditionalInfo]);
    if (!v16)
    {
      id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      [v14 setObject:v16 forKey:v15];
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue( -[AddItemToIPodLibraryOperation insertedItemPersistentIdentifier]( v9,  "insertedItemPersistentIdentifier"));
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v17, SSDownloadMetadataKeyTrackPersistentID);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v5 ITunesMetadataDestinationPath]);
    -[FinishDownloadStepOperation writeBinaryPropertyList:toPath:error:]( self,  "writeBinaryPropertyList:toPath:error:",  v14,  v18,  0LL);
  }

  else
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v14) {
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = [v14 shouldLog];
    else {
      LODWORD(v20) = v19;
    }
    id v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      uint64_t v21 = (void *)objc_opt_class(self);
      id v22 = v21;
      id v23 = [v5 databaseID];
      int v27 = 138412802;
      v28 = v21;
      __int16 v29 = 2048;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = v11;
      v24 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Could not install media download: %lld, error: %@",  &v27,  32);

      if (!v24)
      {
        v17 = 0LL;
        goto LABEL_18;
      }

      id v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
      free(v24);
      SSFileLog(v14, @"%@");
    }

    v17 = 0LL;
  }

LABEL_18:
  if (a3 && !v17) {
    *a3 = v11;
  }

  return v17;
}

- (BOOL)_installExternalDownload:(id *)a3
{
  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 libraryItemIdentifier]);
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___IPodLibraryItem);
    -[IPodLibraryItem setLibraryPersistentIdentifier:]( v7,  "setLibraryPersistentIdentifier:",  [v6 longLongValue]);
    -[IPodLibraryItem setUpdateType:](v7, "setUpdateType:", 1LL);
    id v23 = a3;
    uint64_t v8 = [v5 isHLS] ^ 1;
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaAsset]);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localPath]);
    -[IPodLibraryItem setItemMediaPath:](v7, "setItemMediaPath:", v10);
    -[IPodLibraryItem setProtectionType:](v7, "setProtectionType:", [v9 mediaLibraryProtectionType]);
    -[IPodLibraryItem loadPropertiesFromMediaPath:includeTracks:]( v7,  "loadPropertiesFromMediaPath:includeTracks:",  v10,  v8);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 secondaryAssetForType:SSDownloadAssetTypeArtwork]);
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localPath]);

    if (v12) {
      unsigned __int8 v13 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v12);
    }
    else {
      unsigned __int8 v13 = 0LL;
    }
    -[IPodLibraryItem setItemArtworkData:](v7, "setItemArtworkData:", v13);
    uint64_t v21 = -[AddItemToIPodLibraryOperation initWithIPodLibraryItem:]( objc_alloc(&OBJC_CLASS___AddItemToIPodLibraryOperation),  "initWithIPodLibraryItem:",  v7);
    id v24 = 0LL;
    LOBYTE(v4) = -[InstallMediaDownloadOperation runSubOperation:returningError:]( v4,  "runSubOperation:returningError:",  v21,  &v24);
    id v20 = v24;

    a3 = v23;
  }

  else
  {
    v7 = (IPodLibraryItem *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      v7 = (IPodLibraryItem *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v14 = -[IPodLibraryItem shouldLog](v7, "shouldLog");
    else {
      unsigned int v15 = v14;
    }
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IPodLibraryItem OSLogObject](v7, "OSLogObject"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = v15 & 2;
    }
    if ((_DWORD)v17)
    {
      v18 = (void *)objc_opt_class(v4);
      id v19 = v18;
      int v25 = 138412546;
      id v26 = v18;
      __int16 v27 = 2048;
      id v28 = [v5 databaseID];
      v4 = (InstallMediaDownloadOperation *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Missing library ID for download: %lld",  &v25,  22);

      if (!v4)
      {
        id v20 = 0LL;
        goto LABEL_20;
      }

      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v4,  4LL));
      free(v4);
      SSFileLog(v7, @"%@");
    }

    id v20 = 0LL;
    LOBYTE(v4) = 0;
  }

- (BOOL)_isDaemonOwned
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  if ([v2 isStoreDownload])
  {
    unsigned __int8 v3 = 1;
  }

  else
  {
    id v4 = [v2 databaseID];
    v5 = (void *)objc_claimAutoreleasedReturnValue([v2 downloadKind]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:]( &OBJC_CLASS___ScratchManager,  "directoryPathForDownloadID:kind:createIfNeeded:",  v4,  v5,  1LL));

    v7 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaAsset]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localPath]);

    unsigned __int8 v3 = [v8 hasPrefix:v6];
  }

  return v3;
}

- (id)_newIPodLibraryItem
{
  unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___IPodLibraryItem);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lld",  [v4 databaseID]));
  -[IPodLibraryItem setItemDownloadIdentifier:](v3, "setItemDownloadIdentifier:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 storeAccountIdentifier]);
  -[IPodLibraryItem setValue:forAdditionalEntityProperty:]( v3,  "setValue:forAdditionalEntityProperty:",  v6,  ML3TrackPropertyStoreAccountID);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryItemIdentifier]);
  uint64_t v8 = v7;
  if (v7) {
    -[IPodLibraryItem setLibraryPersistentIdentifier:]( v3,  "setLibraryPersistentIdentifier:",  [v7 longLongValue]);
  }
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaAsset]);
  -[IPodLibraryItem setProtectionType:](v3, "setProtectionType:", [v9 mediaLibraryProtectionType]);
  unsigned int v10 = [v4 isHLS];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadKind]);
  id v12 = sub_10015AF78(v11);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 destinationFileName]);
  if (v14)
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:v14]);
    -[IPodLibraryItem setItemMediaPath:](v3, "setItemMediaPath:", v15);
    -[IPodLibraryItem loadPropertiesFromMediaPath:includeTracks:]( v3,  "loadPropertiesFromMediaPath:includeTracks:",  v15,  v10 ^ 1);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 secondaryAssetForType:SSDownloadAssetTypeArtwork]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 destinationFileName]);

  if (v17)
  {
    v18 = objc_alloc(&OBJC_CLASS___NSData);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:v17]);
    id v20 = -[NSData initWithContentsOfFile:](v18, "initWithContentsOfFile:", v19);

    -[IPodLibraryItem setItemArtworkData:](v3, "setItemArtworkData:", v20);
  }

  return v3;
}

- (void)_updateRentalsPlist
{
  id v3 = [(id)CPSharedResourcesDirectory(self) stringByAppendingPathComponent:@"Media"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  v4,  @"iTunes_Control",  @"iTunes",  @"Rentals.plist",  0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v5));
  v7 = -[NSMutableDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithContentsOfFile:",  v6);
  if (v7
    || (__int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByDeletingLastPathComponent]),
        unsigned int v28 = +[NSFileManager ensureDirectoryExists:]( &OBJC_CLASS___NSFileManager,  "ensureDirectoryExists:",  v27),  v27,  v28)
    && (v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary)) != 0LL)
  {
    id v32 = v5;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
    unsigned __int8 v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 title]);
    if (v10) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, @"Name");
    }
    id v30 = self;
    id v33 = (void *)v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadKind]);
    if (v11) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v11, @"Kind");
    }
    id v12 = sub_10015AF78(v11);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaAsset]);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 destinationFileName]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:v15]);

    if (v16)
    {
      uint64_t v17 = (char *)[v16 rangeOfString:v4 options:8];
      if (v17 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v16 substringFromIndex:&v17[v18]]);

        id v16 = (void *)v19;
      }

      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v16, @"Path");
    }

    id v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", @"Rentals"));
    if (!v20)
    {
      id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v20, @"Rentals");
    }

    -[NSMutableArray addObject:](v20, "addObject:", v9);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v21) {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v22) = [v21 shouldLog];
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      int v34 = 138412546;
      id v35 = (id)objc_opt_class(v30);
      __int16 v36 = 2112;
      v37 = v33;
      __int16 v31 = v4;
      id v24 = v35;
      LODWORD(v29) = 22;
      int v25 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  1LL,  "%@: Updated rental plist for \"%@\"",  &v34,  v29);

      id v4 = v31;
      if (!v25)
      {
LABEL_24:

        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[DistributedNotificationCenter defaultCenter]( &OBJC_CLASS___DistributedNotificationCenter,  "defaultCenter"));
        [v26 postNotificationName:@"com.apple.itunesstored.RentalAdded"];

LABEL_25:
        v5 = v32;
        goto LABEL_28;
      }

      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
      free(v25);
      SSFileLog(v21, @"%@");
    }

    goto LABEL_24;
  }

@end