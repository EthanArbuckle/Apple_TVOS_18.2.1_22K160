@interface PrepareDownloadOperation
+ (BOOL)_isDTServiceHubIssuedRequest:(id)a3;
+ (id)_mediaAssetsForDownloadIdentifier:(int64_t)a3 session:(id)a4;
+ (int64_t)_URLSessionTaskPriorityForDownload:(id)a3;
+ (int64_t)_URLSessionTaskPriorityForDownloadPriority:(int64_t)a3;
+ (void)enumerateOperationsWithDownloadQuery:(id)a3 session:(id)a4 usingBlock:(id)a5;
- (BOOL)_allowsCellularAccessForAsset:(id)a3;
- (BOOL)_assetNeedsDecryption:(id)a3;
- (BOOL)_isPodcast;
- (BOOL)_isPodcastRestore;
- (BOOL)_itemIsInMediaLibrary;
- (BOOL)_itemIsInSoftwareLibrary;
- (BOOL)_requiresPoweredPluggedIn;
- (BOOL)_sendsStoreHeadersForAsset:(id)a3;
- (BOOL)_shouldCancelAsDuplicate;
- (BOOL)_shouldCancelAutomaticDownload;
- (BOOL)_shouldFailForDiskSpaceWithAsset:(id)a3 dataConsumer:(id)a4;
- (BOOL)_shouldFailForFinishedDownload;
- (BOOL)_usesStreamingZipDataConsumerForAsset:(id)a3;
- (BOOL)ignoresDownloadHandler;
- (double)_transferProgressFractionWithAsset:(id)a3;
- (id)_bestMediaAsset;
- (id)_clientIdentifier;
- (id)_initWithDownload:(id)a3 mediaAssets:(id)a4 policy:(id)a5;
- (id)_newAVAssetDownloadSessionOptionsWithAsset:(id)a3 URLRequest:(id)a4;
- (id)_newAVContentInfoDictionary;
- (id)_newDataConsumerWithAsset:(id)a3 destinationPath:(id)a4;
- (id)_newURLRequestWithAsset:(id)a3;
- (id)outputBlock;
- (int64_t)_assetSizeFromURLResponse:(id)a3;
- (int64_t)_loadSizeForAsset:(id)a3 error:(id *)a4;
- (int64_t)_loadSizeIfNecessaryForAsset:(id)a3;
- (int64_t)downloadIdentifier;
- (int64_t)operation:(id)a3 dispositionForAuthenticationChallenge:(id)a4;
- (void)_recordCoreAnalyticsEventForClient:(id)a3 downloadKind:(id)a4 url:(id)a5;
- (void)operation:(id)a3 didReceiveResponse:(id)a4;
- (void)run;
- (void)setIgnoresDownloadHandler:(BOOL)a3;
- (void)setOutputBlock:(id)a3;
@end

@implementation PrepareDownloadOperation

- (id)_initWithDownload:(id)a3 mediaAssets:(id)a4 policy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PrepareDownloadOperation;
  v12 = -[PrepareDownloadOperation init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_download, a3);
    v14 = (NSArray *)[v10 copy];
    mediaAssets = v13->_mediaAssets;
    v13->_mediaAssets = v14;

    objc_storeStrong((id *)&v13->_policy, a5);
  }

  return v13;
}

+ (void)enumerateOperationsWithDownloadQuery:(id)a3 session:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22[0] = @"airplay_content_type";
  v22[1] = @"is_automatic";
  v22[2] = @"bundle_id";
  v22[3] = @"client.audit_token_data";
  v22[4] = @"client_id";
  v22[5] = @"download_permalink";
  v22[6] = @"application_id.bundle_id";
  v22[7] = @"is_restore";
  v22[8] = @"is_shared";
  v22[9] = @"is_from_store";
  v22[10] = @"kind";
  v22[11] = @"loading_priority";
  v22[12] = @"override_audit_token_data";
  v22[13] = @"policy_id";
  v22[14] = @"priority";
  v22[15] = @"rate_limit";
  v22[16] = @"rental_id";
  v22[17] = @"resource_timeout_interval";
  v22[18] = @"IFNULL(download_state.restore_data_size, 0)";
  v22[19] = @"IFNULL(download_state.restore_state, 0)";
  v22[20] = @"cancel_if_duplicate";
  v22[21] = @"store_account_id";
  v22[22] = @"store_download_key";
  v22[23] = @"store_item_id";
  v22[24] = @"store_publication_version";
  v22[25] = @"store_redownload_parameters";
  v22[26] = @"store_saga_id";
  v22[27] = @"title";
  v22[28] = @"thumbnail_url";
  v22[29] = @"timeout_interval";
  v22[30] = @"transaction_id";
  id v11 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", v22, 31LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 policyManager]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100126588;
  v17[3] = &unk_10034F588;
  id v21 = a1;
  id v13 = v9;
  id v18 = v13;
  id v19 = v12;
  id v14 = v10;
  id v20 = v14;
  id v15 = v12;
  [v8 enumerateMemoryEntitiesWithProperties:v11 usingBlock:v17];

  for (uint64_t i = 30LL; i != -1; --i)
}

- (int64_t)downloadIdentifier
{
  return (int64_t)-[SSMemoryEntity databaseID](self->_download, "databaseID");
}

- (BOOL)ignoresDownloadHandler
{
  BOOL ignoresDownloadHandler = self->_ignoresDownloadHandler;
  -[PrepareDownloadOperation unlock](self, "unlock");
  return ignoresDownloadHandler;
}

- (id)outputBlock
{
  id v3 = [self->_outputBlock copy];
  -[PrepareDownloadOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setIgnoresDownloadHandler:(BOOL)a3
{
  self->_BOOL ignoresDownloadHandler = a3;
  -[PrepareDownloadOperation unlock](self, "unlock");
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  -[PrepareDownloadOperation lock](self, "lock");
  if (self->_outputBlock != v6)
  {
    id v4 = [v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }

  -[PrepareDownloadOperation unlock](self, "unlock");
}

- (void)run
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PrepareDownloadResponse);
  -[PrepareDownloadResponse setIgnoresDownloadHandler:]( v3,  "setIgnoresDownloadHandler:",  -[PrepareDownloadOperation ignoresDownloadHandler](self, "ignoresDownloadHandler"));
  -[PrepareDownloadResponse setResult:](v3, "setResult:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:"));
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 copy];
    -[PrepareDownloadResponse setKind:](v3, "setKind:", v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:"));
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 copy];
    -[PrepareDownloadResponse setBundleIdentifier:](v3, "setBundleIdentifier:", v9);
  }

  v231 = v8;
  id v10 = -[SSMemoryEntity databaseID](self->_download, "databaseID");
  -[PrepareDownloadResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"transaction_id"));
  id v12 = [v11 longLongValue];

  v230 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]( objc_alloc(&OBJC_CLASS___DownloadHandle),  "initWithTransactionIdentifier:downloadIdentifier:",  v12,  v10);
  -[PrepareDownloadResponse setDownloadHandle:](v3, "setDownloadHandle:");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"rental_id"));
  id v14 = [v13 longLongValue];

  -[PrepareDownloadResponse setRentalIdentifier:](v3, "setRentalIdentifier:", v14);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"store_item_id"));
  id v16 = [v15 longLongValue];

  -[PrepareDownloadResponse setStoreItemIdentifier:](v3, "setStoreItemIdentifier:", v16);
  v229 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"title"));
  -[PrepareDownloadResponse setTitle:](v3, "setTitle:");
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v17) {
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v18) = [v17 shouldLog];
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
    uint64_t v18 = v18;
  }
  else {
    v18 &= 2u;
  }
  id v226 = v10;
  if ((_DWORD)v18)
  {
    id v20 = (id)objc_opt_class(self);
    int v234 = 138412546;
    id v235 = v20;
    __int16 v236 = 2048;
    id v237 = v10;
    id v21 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Preparing download: %lld",  &v234,  22);

    if (!v21) {
      goto LABEL_17;
    }
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
    free(v21);
    v209 = v19;
    SSFileLog(v17, @"%@");
  }

LABEL_17:
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PrepareDownloadOperation _bestMediaAsset](self, "_bestMediaAsset"));
  -[PrepareDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v22 databaseID]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 valueForProperty:@"url_session_task_id"]);
  -[PrepareDownloadResponse setTaskIdentifier:](v3, "setTaskIdentifier:", v23);

  uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 valueForProperty:@"url"]);
  v228 = (void *)v24;
  if (!v24)
  {
    unsigned int v29 = 0;
    v232 = 0LL;
    goto LABEL_45;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PrepareDownloadOperation _clientIdentifier](self, "_clientIdentifier"));
  -[PrepareDownloadOperation _recordCoreAnalyticsEventForClient:downloadKind:url:]( self,  "_recordCoreAnalyticsEventForClient:downloadKind:url:",  v25,  v5,  v24);

  v232 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v22 valueForProperty:@"is_downloaded"]);
  unsigned int v27 = [v26 BOOLValue];

  if (!v27)
  {
    unsigned int v29 = 0;
    LODWORD(v24) = 0;
    goto LABEL_45;
  }

  v218 = v5;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v29 = [v28 fileExistsAtPath:v24];
  v223 = v22;
  if ((v29 & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v30) {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v31) = objc_msgSend(v30, "shouldLog", v209);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
      uint64_t v31 = v31;
    }
    else {
      v31 &= 2u;
    }
    if (!(_DWORD)v31) {
      goto LABEL_42;
    }
    v33 = v3;
    id v34 = (id)objc_opt_class(self);
    id v35 = [v223 databaseID];
    int v234 = 138412802;
    id v235 = v34;
    __int16 v236 = 2048;
    id v237 = v226;
    __int16 v238 = 2048;
    id v239 = v35;
    LODWORD(v212) = 32;
    uint64_t v36 = _os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  1LL,  "%@: Download %lld asset: %lld is already downloaded",  &v234,  v212);
  }

  else
  {
    [v22 setValue:&__kCFBooleanFalse forProperty:@"is_downloaded"];
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v30) {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v37) = objc_msgSend(v30, "shouldLog", v209);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
      uint64_t v37 = v37;
    }
    else {
      v37 &= 2u;
    }
    if (!(_DWORD)v37) {
      goto LABEL_42;
    }
    v33 = v3;
    id v34 = (id)objc_opt_class(self);
    id v38 = [v223 databaseID];
    int v234 = 138412802;
    id v235 = v34;
    __int16 v236 = 2048;
    id v237 = v226;
    __int16 v238 = 2048;
    id v239 = v38;
    LODWORD(v212) = 32;
    uint64_t v36 = _os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  1LL,  "%@: Flagging download %lld asset: %lld as not downloaded",  &v234,  v212);
  }

  v39 = (void *)v36;

  if (!v39)
  {
    id v3 = v33;
    goto LABEL_44;
  }

  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v39,  4LL));
  free(v39);
  v209 = v32;
  SSFileLog(v30, @"%@");
  id v3 = v33;
LABEL_42:

LABEL_44:
  LODWORD(v24) = 1;
  v5 = v218;
  v22 = v223;
LABEL_45:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace", v209));
  if (![v40 isMultiUser])
  {
LABEL_56:

    goto LABEL_57;
  }

  int IsEBookKind = SSDownloadKindIsEBookKind(v5);

  if (IsEBookKind)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_shared"));
    unsigned int v43 = [v42 BOOLValue];

    if (v43)
    {
      v224 = v22;
      v216 = v3;
      v219 = v5;
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[EBookManifest sharedPurchasedBookManifest]( &OBJC_CLASS___EBookManifest,  "sharedPurchasedBookManifest"));
      v44 = (void *)objc_claimAutoreleasedReturnValue( -[SSMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"store_publication_version"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"store_item_id"));
      v46 = (void *)objc_claimAutoreleasedReturnValue( -[SSMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"download_permalink"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_from_store"));
      unsigned int v48 = [v47 BOOLValue];

      if (v48)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue([v40 bookPathForAdamID:v45 withPublicationVersion:v44]);
      }

      else
      {
        if (![v46 length])
        {
          v50 = 0LL;
          id v3 = v216;
          goto LABEL_53;
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue([v40 bookPathPermalink:v46]);
      }

      v50 = v49;
      id v3 = v216;

LABEL_53:
      if (v50)
      {
        unsigned int v29 = 1;
        LODWORD(v24) = 1;
      }

      v5 = v219;
      v22 = v224;
      goto LABEL_56;
    }
  }

- (int64_t)operation:(id)a3 dispositionForAuthenticationChallenge:(id)a4
{
  return 1LL;
}

- (void)operation:(id)a3 didReceiveResponse:(id)a4
{
}

+ (BOOL)_isDTServiceHubIssuedRequest:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 URL]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSURL);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 host]);
    unsigned __int8 v6 = [v5 isEqualToString:@"localhost"];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (id)_mediaAssetsForDownloadIdentifier:(int64_t)a3 session:(id)a4
{
  id v5 = a4;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v28[0] = @"avfoundation_blocked";
  v28[1] = @"bytes_total";
  v28[2] = @"download_token";
  v28[3] = @"dpinfo_data";
  v28[4] = @"uncompressed_size";
  v28[5] = @"hash_array";
  v28[6] = @"hash_type";
  v28[7] = @"body_data";
  v28[8] = @"http_headers";
  v28[9] = @"http_method";
  v28[10] = @"initial_odr_size";
  v28[11] = @"is_discretionary";
  v28[12] = @"is_downloaded";
  v28[13] = @"is_drm_free";
  v28[14] = @"is_external";
  v28[15] = @"is_hls";
  v28[16] = @"is_local_cache_server";
  v28[17] = @"is_zip_streamable";
  v28[18] = @"local_path";
  v28[19] = @"bytes_to_hash";
  v28[20] = @"sinfs_data";
  v28[21] = @"store_download_key";
  v28[22] = @"timeout_interval";
  v28[23] = @"asset_type";
  v28[24] = @"url";
  v28[25] = @"url_session_task_id";
  v7 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", v28, 26LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"download_id",  a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"IFNULL(asset.blocked_reason, 0)",  0LL));
  v27[0] = v8;
  v27[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  v22 = v5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 database]);
  v26 = @"asset_order";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadAssetEntity queryWithDatabase:predicate:orderingProperties:]( &OBJC_CLASS___DownloadAssetEntity,  "queryWithDatabase:predicate:orderingProperties:",  v12,  v11,  v13));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100128EF0;
  v23[3] = &unk_10034F5B0;
  id v15 = v6;
  id v24 = v15;
  id v16 = v21;
  id v25 = v16;
  [v14 enumerateMemoryEntitiesWithProperties:v7 usingBlock:v23];
  if ([v16 count]) {
    objc_super v17 = v16;
  }
  else {
    objc_super v17 = v15;
  }
  id v18 = v17;

  for (uint64_t i = 25LL; i != -1; --i)
  return v18;
}

- (BOOL)_allowsCellularAccessForAsset:(id)a3
{
  id v4 = a3;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"AllowAutoDownloadOnCellular",  kSSUserDefaultsIdentifier,  0LL);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_automatic"));
  id v7 = [v6 integerValue];

  if (v7) {
    BOOL v8 = AppBooleanValue == 0;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = &ACSLocateCachingServer_ptr;
  id v66 = v4;
  if (v8)
  {
    LOBYTE(v13) = 0;
    goto LABEL_75;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"bytes_total"]);
  v69 = (char *)[v10 longLongValue];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"initial_odr_size"]);
  if ((objc_opt_respondsToSelector(v11, "unsignedLongLongValue") & 1) != 0) {
    v69 = &v69[(void)[v11 unsignedLongLongValue]];
  }
  uint64_t v64 = v11;
  v65 = self;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSDownloadPolicy policyRules](self->_policy, "policyRules"));
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  unsigned int v13 = [v12 count] == 0;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v76 objects:v88 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v77;
    v68 = (char *)SSDownloadSizeLimitDisabled;
    uint64_t v67 = (char *)SSDownloadSizeLimitNoLimit;
    int v70 = AppBooleanValue;
    while (2)
    {
      for (uint64_t i = 0LL; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v77 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
        if ([v19 cellularDataStates] == (id)2)
        {
          if (!AppBooleanValue) {
            goto LABEL_41;
          }
          v13 |= AppBooleanValue != 0;
        }

        else if ([v19 isCellularAllowed])
        {
          id v20 = v14;
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 userDefaultStates]);
          id v71 = [v21 count];
          __int128 v72 = 0u;
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          __int128 v75 = 0u;
          id v22 = v21;
          id v23 = [v22 countByEnumeratingWithState:&v72 objects:v87 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v73;
            while (2)
            {
              for (j = 0LL; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v73 != v25) {
                  objc_enumerationMutation(v22);
                }
                if ([*(id *)(*((void *)&v72 + 1) + 8 * (void)j) currentBoolValue])
                {

                  goto LABEL_27;
                }
              }

              id v24 = [v22 countByEnumeratingWithState:&v72 objects:v87 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }

          if (v71)
          {
            id v14 = v20;
          }

          else
          {
LABEL_27:
            unsigned int v27 = (char *)[v19 downloadSizeLimit];
            id v14 = v20;
            if (v27 == v68)
            {

LABEL_41:
              LOBYTE(v13) = 0;
              goto LABEL_42;
            }

            BOOL v29 = v27 == v67 || (uint64_t)v69 <= (uint64_t)v27;
            v13 |= v29;
          }

          int AppBooleanValue = v70;
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v76 objects:v88 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

- (BOOL)_isPodcastRestore
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_restore"));
  unsigned __int8 v4 = [v3 BOOLValue];

  return -[PrepareDownloadOperation _isPodcast](self, "_isPodcast") & v4;
}

- (BOOL)_isPodcast
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
  char IsPodcastKind = SSDownloadKindIsPodcastKind(v2);

  return IsPodcastKind;
}

- (BOOL)_assetNeedsDecryption:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForProperty:@"is_drm_free"]);
  if ([v4 BOOLValue])
  {
    BOOL v5 = 1;
  }

  else
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForProperty:@"dpinfo_data"]);
    BOOL v5 = v6 != 0LL;
  }

  return v5;
}

- (int64_t)_assetSizeFromURLResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = v3;
    unsigned __int8 v6 = (char *)[v5 statusCode];
    if (v6 == (char *)206)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allHeaderFields]);
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Content-Range"]);

      if (!v8
        || (id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( NSCharacterSet,  "characterSetWithCharactersInString:",  @"/")),  v10 = [v8 rangeOfCharacterFromSet:v9],  v9,  v10 == (id)0x7FFFFFFFFFFFFFFFLL)
        || (unint64_t v11 = (unint64_t)v10 + 1, v11 >= (unint64_t)[v8 length]))
      {
        int64_t v13 = -1LL;
      }

      else
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 substringFromIndex:v11]);
        int64_t v13 = (int64_t)[v12 longLongValue];
      }
    }

    else if ((unint64_t)(v6 - 200) > 0x63)
    {
      int64_t v13 = -1LL;
    }

    else
    {
      int64_t v13 = (int64_t)[v5 expectedContentLength];
    }
  }

  else
  {
    int64_t v13 = -1LL;
  }

  return v13;
}

- (id)_bestMediaAsset
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_from_store"));
  unsigned int v4 = [v3 BOOLValue];

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v5 = self->_mediaAssets;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v33,  v47,  16LL);
  if (v6)
  {
    id v7 = v6;
    unsigned int v30 = v4;
    uint64_t v8 = *(void *)v34;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v34 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:@"url"]);
      if (v11)
      {
        id v12 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v11);
        if (v12) {
          break;
        }
      }

      if (v7 == (id)++v9)
      {
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v33,  v47,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }

    id v14 = v12;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:@"is_local_cache_server"]);
    unsigned int v16 = [v15 BOOLValue];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v17) {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v18 = [v17 shouldLog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = v18 & 2;
    }
    if ((_DWORD)v20)
    {
      unsigned int v29 = v16;
      id v21 = (void *)objc_opt_class(self);
      id v28 = v21;
      id v22 = [v10 databaseID];
      id v23 = -[SSMemoryEntity databaseID](self->_download, "databaseID");
      int v37 = 138413314;
      id v38 = v21;
      unsigned int v16 = v29;
      __int16 v39 = 2048;
      id v40 = v22;
      __int16 v41 = 2048;
      id v42 = v23;
      __int16 v43 = 1024;
      unsigned int v44 = v29;
      __int16 v45 = 2112;
      v46 = v14;
      id v24 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Using media asset: %lld, for download: %lld, is local cache: %d, URL: %@",  &v37,  48);

      unsigned int v25 = v30;
      if (!v24)
      {
LABEL_23:

        if ((v25 & v16) == 1)
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472LL;
          v31[2] = sub_100129DE0;
          v31[3] = &unk_10034F5D8;
          v31[4] = self;
          v31[5] = v10;
          dispatch_semaphore_t v32 = dispatch_semaphore_create(0LL);
          v26 = v32;
          ACSLocateCachingServer(v14, 0LL, 0LL, v31, 30.0);
          dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
        }

        id v13 = v10;

        goto LABEL_26;
      }

      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
      free(v24);
      SSFileLog(v17, @"%@");
    }

    else
    {
      unsigned int v25 = v30;
    }

    goto LABEL_23;
  }

- (id)_clientIdentifier
{
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue( -[SSMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"application_id.bundle_id"));
  if (!v3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( -[SSMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"override_audit_token_data"));
    if ([v4 length] != (id)32)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"client.audit_token_data"));

      unsigned int v4 = (void *)v5;
    }

    if ([v4 length] != (id)32
      || ([v4 getBytes:v12 length:32],
          unint64_t v11 = 0LL,
          v10[0] = v12[0],
          v10[1] = v12[1],
          !CPCopyBundleIdentifierAndTeamFromAuditToken(v10, &v11, 0LL))
      || (id v3 = v11) == 0LL)
    {
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"client_id"));
      if (!v3)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_automatic"));
        id v7 = [v6 integerValue];

        if (v7)
        {
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
          if ((SSDownloadKindIsSoftwareKind(v8) & 1) != 0)
          {
            id v3 = @"com.apple.AppStore";
          }

          else if ((SSDownloadKindIsMediaKind(v8) & 1) != 0)
          {
            id v3 = @"com.apple.MobileStore";
          }

          else if (SSDownloadKindIsEBookKind(v8))
          {
            id v3 = @"com.apple.iBooks";
          }

          else
          {
            id v3 = 0LL;
          }
        }

        else
        {
          id v3 = 0LL;
        }
      }
    }
  }

  return v3;
}

- (BOOL)_itemIsInMediaLibrary
{
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"store_item_id"));
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  ML3TrackPropertyStoreItemID,  v2));
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3TrackPropertyStoreFamilyAccountID,  0LL));
    v17[0] = v3;
    v17[1] = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v5));

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary sharedLibrary](&OBJC_CLASS___ML3MusicLibrary, "sharedLibrary"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track queryWithLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "queryWithLibrary:predicate:",  v7,  v6));

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  ML3TrackPropertyLocationFileName));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    _OWORD v12[2] = sub_10012A4DC;
    v12[3] = &unk_10034AE48;
    v12[4] = &v13;
    [v8 enumeratePersistentIDsAndProperties:v9 usingBlock:v12];
  }

  BOOL v10 = *((_BYTE *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (BOOL)_itemIsInSoftwareLibrary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"store_item_id"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"bundle_id"));
  uint64_t v5 = objc_autoreleasePoolPush();
  if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForItemID:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForItemID:",  v3));
  }

  else
  {
    if (!v4)
    {
      LOBYTE(v8) = 0;
      goto LABEL_9;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v4));
  }

  id v7 = v6;
  if (v6) {
    unsigned int v8 = [v6 isPlaceholder] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

LABEL_9:
  objc_autoreleasePoolPop(v5);

  return v8;
}

- (int64_t)_loadSizeIfNecessaryForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"bytes_total"]);
  id v6 = [v5 longLongValue];

  else {
    int64_t v7 = -[PrepareDownloadOperation _loadSizeForAsset:error:](self, "_loadSizeForAsset:error:", v4, 0LL);
  }

  return v7;
}

- (int64_t)_loadSizeForAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:@"url"]);
  if (v7)
  {
    id v53 = a4;
    unsigned int v8 = objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));
    BOOL v10 = -[SSMutableURLRequestProperties initWithURL:](v8, "initWithURL:", v9);

    -[SSMutableURLRequestProperties setAllowedRetryCount:](v10, "setAllowedRetryCount:", 0LL);
    -[SSMutableURLRequestProperties setCachePolicy:](v10, "setCachePolicy:", 1LL);
    -[SSMutableURLRequestProperties setTimeoutInterval:](v10, "setTimeoutInterval:", 30.0);
    -[SSMutableURLRequestProperties setHTTPMethod:](v10, "setHTTPMethod:", @"HEAD");
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 valueForProperty:@"http_headers"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v11,  0LL,  0LL,  0LL));
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472LL;
        v55[2] = sub_10012AD28;
        v55[3] = &unk_10034B178;
        id v56 = v10;
        [v13 enumerateKeysAndObjectsUsingBlock:v55];
      }
    }

    v51 = (void *)v11;
    uint64_t v52 = v7;
    id v15 = objc_alloc_init(&OBJC_CLASS___ISURLOperation);
    [v15 setRequestProperties:v10];
    [v15 setDelegate:self];
    char v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      char v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      uint64_t v20 = (void *)objc_opt_class(self);
      id v21 = v20;
      id v22 = [v6 databaseID];
      int v57 = 138412546;
      v58 = v20;
      __int16 v59 = 2048;
      int64_t v60 = (int64_t)v22;
      id v23 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Running HEAD operation to get size for asset: %lld",  &v57,  22);

      if (!v23) {
        goto LABEL_18;
      }
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      unsigned int v48 = v19;
      SSFileLog(v16, @"%@");
    }

LABEL_18:
    id v54 = 0LL;
    unsigned int v24 = -[PrepareDownloadOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v15,  &v54);
    id v25 = v54;
    unsigned int v50 = v24;
    if (v24)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v15 response]);
      int64_t v27 = (int64_t)[v26 expectedContentLength];

      if (v27 >= 1)
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v28) {
          id v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v29 = objc_msgSend(v28, "shouldLog", v48);
        else {
          unsigned int v30 = v29;
        }
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
          uint64_t v32 = v30;
        }
        else {
          uint64_t v32 = v30 & 2;
        }
        if ((_DWORD)v32)
        {
          __int128 v33 = (void *)objc_opt_class(self);
          id v34 = v33;
          id v35 = [v6 databaseID];
          int v57 = 138412802;
          v58 = v33;
          __int16 v59 = 2048;
          int64_t v60 = v27;
          __int16 v61 = 2048;
          id v62 = v35;
          LODWORD(v49) = 32;
          __int128 v36 = (void *)_os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  1LL,  "%@: Found size: %lld for asset: %lld",  &v57,  v49);

          int64_t v7 = v52;
          if (!v36)
          {
LABEL_49:

            id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v27));
            [v6 setValue:v38 forProperty:@"bytes_total"];
LABEL_50:

            [v15 setDelegate:0];
            int v37 = v50 ^ 1;
            a4 = v53;
            if (!v53) {
              goto LABEL_53;
            }
            goto LABEL_51;
          }

          uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v36,  4LL));
          free(v36);
          SSFileLog(v28, @"%@");
        }

        else
        {
          int64_t v7 = v52;
        }

        goto LABEL_49;
      }
    }

    else
    {
      int64_t v27 = -1LL;
    }

    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v48));
    if (!v38) {
      id v38 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v39 = [v38 shouldLog];
    else {
      unsigned int v40 = v39;
    }
    __int16 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v38 OSLogObject]);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO)) {
      uint64_t v42 = v40;
    }
    else {
      uint64_t v42 = v40 & 2;
    }
    if ((_DWORD)v42)
    {
      __int16 v43 = (void *)objc_opt_class(self);
      id v44 = v43;
      id v45 = [v6 databaseID];
      int v57 = 138412802;
      v58 = v43;
      __int16 v59 = 2048;
      int64_t v60 = (int64_t)v45;
      __int16 v61 = 2112;
      id v62 = v25;
      LODWORD(v49) = 32;
      v46 = (void *)_os_log_send_and_compose_impl( v42,  0LL,  0LL,  0LL,  &_mh_execute_header,  v41,  1LL,  "%@: Failed to find size for asset: %lld error: %@",  &v57,  v49);

      if (!v46)
      {
        int64_t v7 = v52;
        goto LABEL_50;
      }

      __int16 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v46,  4LL));
      free(v46);
      SSFileLog(v38, @"%@");
    }

    int64_t v7 = v52;

    goto LABEL_50;
  }

  id v25 = 0LL;
  int v37 = 1;
  int64_t v27 = -1LL;
  if (!a4) {
    goto LABEL_53;
  }
LABEL_51:
  if (v37) {
    *a4 = v25;
  }
LABEL_53:

  return v27;
}

- (id)_newAVAssetDownloadSessionOptionsWithAsset:(id)a3 URLRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", &off_10036D8C0, AVAssetDownloadSessionPriorityKey);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"client_id"));
  if (v9) {
    -[NSMutableDictionary setObject:forKey:]( v8,  "setObject:forKey:",  v9,  AVAssetDownloadSessionClientBundleIdentifierKey);
  }
  if (-[PrepareDownloadOperation _sendsStoreHeadersForAsset:](self, "_sendsStoreHeadersForAsset:", v6))
  {
    id v10 = -[PrepareDownloadOperation _newAVContentInfoDictionary](self, "_newAVContentInfoDictionary");
    -[NSMutableDictionary setObject:forKey:]( v8,  "setObject:forKey:",  v10,  AVAssetDownloadSessioniTunesStoreContentInfoKey);
  }

  id v71 = (void *)v9;
  if (([v7 allowsCellularAccess] & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKey:]( v8,  "setObject:forKey:",  &off_10036D8D8,  AVAssetDownloadSessionMaxSizeAllowedForCellularAccessKey);
    goto LABEL_37;
  }

  if (!-[PrepareDownloadOperation _isPodcast](self, "_isPodcast")) {
    goto LABEL_37;
  }
  id v69 = v7;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v11) {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v12 = [v11 shouldLog];
  else {
    unsigned int v13 = v12;
  }
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v13 & 2;
  }
  if (!(_DWORD)v15) {
    goto LABEL_18;
  }
  id v16 = -[SSMemoryEntity databaseID](self->_download, "databaseID");
  int v77 = 134217984;
  id v78 = v16;
  unsigned int v17 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[Download]: Podcast Request allows cellular for %lld",  &v77);

  if (v17)
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
    free(v17);
    uint64_t v64 = v14;
    SSFileLog(v11, @"%@");
LABEL_18:
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[SSURLBagContext contextWithBagType:]( &OBJC_CLASS___SSURLBagContext,  "contextWithBagType:",  -[SSDownloadPolicy URLBagType](self->_policy, "URLBagType")));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[PrepareDownloadOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  v18,  0LL));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SSDownloadPolicy downloadKind](self->_policy, "downloadKind"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 networkConstraintsForDownloadKind:v20]);

  if (!v21) {
    goto LABEL_36;
  }
  id v22 = [v21 sizeLimitForNetworkType:1];
  if (v22 == (id)SSDownloadSizeLimitDisabled) {
    goto LABEL_36;
  }
  id v65 = v22;
  id v67 = v6;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v23) {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v24 = objc_msgSend(v23, "shouldLog", v64);
  else {
    unsigned int v25 = v24;
  }
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v27 = v25;
  }
  else {
    uint64_t v27 = v25 & 2;
  }
  if (!(_DWORD)v27)
  {
    id v29 = v65;
    goto LABEL_34;
  }

  id v28 = -[SSMemoryEntity databaseID](self->_download, "databaseID");
  int v77 = 134218240;
  id v29 = v65;
  id v78 = v65;
  __int16 v79 = 2048;
  id v80 = v28;
  unsigned int v30 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[Download]: Setting podcast request cellular size limit to %lld for %lld",  &v77,  22);

  if (v30)
  {
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
    free(v30);
    uint64_t v64 = v26;
    SSFileLog(v23, @"%@");
LABEL_34:
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v29));
  -[NSMutableDictionary setObject:forKey:]( v8,  "setObject:forKey:",  v31,  AVAssetDownloadSessionMaxSizeAllowedForCellularAccessKey);

  id v6 = v67;
LABEL_36:

  id v7 = v69;
LABEL_37:
  uint64_t v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:@"hash_array"]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:@"bytes_to_hash"]);
  uint64_t v35 = (uint64_t)[v34 integerValue];

  BOOL v36 = v35 < 1 || v33 == 0LL;
  int v37 = &ACSLocateCachingServer_ptr;
  if (!v36)
  {
    id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v33,  0LL,  0LL,  0LL));
    uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v38, v39) & 1) == 0)
    {
LABEL_55:

      goto LABEL_56;
    }

    id v68 = v6;
    id v70 = v7;
    id v66 = v8;
    unsigned int v40 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    id v41 = v38;
    id v42 = [v41 countByEnumeratingWithState:&v72 objects:v76 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v73;
      do
      {
        for (uint64_t i = 0LL; i != v43; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v73 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = (void *)ISCopyDigestFromString(*(void *)(*((void *)&v72 + 1) + 8LL * (void)i));
          -[NSMutableArray addObject:](v40, "addObject:", v46);
        }

        id v43 = [v41 countByEnumeratingWithState:&v72 objects:v76 count:16];
      }

      while (v43);
    }

    if (-[NSMutableArray count](v40, "count") == (id)1)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v40, "firstObject"));
      uint64_t v48 = sub_10001F750();
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v47, v49);

      unsigned int v8 = v66;
      id v6 = v68;
      id v7 = v70;
    }

    else
    {
      unsigned int v8 = v66;
      id v6 = v68;
      id v7 = v70;
      int v37 = &ACSLocateCachingServer_ptr;
      if ((unint64_t)-[NSMutableArray count](v40, "count") < 2)
      {
LABEL_54:

        goto LABEL_55;
      }

      unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v35));
      uint64_t v51 = sub_10001F760();
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v50, v52);

      uint64_t v53 = sub_10001F740();
      v47 = (void *)objc_claimAutoreleasedReturnValue(v53);
      -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v40, v47);
    }

    int v37 = &ACSLocateCachingServer_ptr;
    goto LABEL_54;
  }

- (id)_newAVContentInfoDictionary
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"store_saga_id"));
  if ([v4 longLongValue])
  {
    uint64_t v5 = AVAssetDownloadSessioniTunesStoreContentTypeKey;
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  @"match",  AVAssetDownloadSessioniTunesStoreContentTypeKey);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"store_item_id"));

  uint64_t v5 = AVAssetDownloadSessioniTunesStoreContentTypeKey;
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  @"purchaseHistory",  AVAssetDownloadSessioniTunesStoreContentTypeKey);
  id v4 = (void *)v16;
  if (v16) {
LABEL_3:
  }
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, AVAssetDownloadSessioniTunesStoreContentIDKey);
LABEL_4:
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[SSMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"airplay_content_type"));
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, v5);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"store_account_id"));

  if (v7) {
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v7,  AVAssetDownloadSessioniTunesStoreContentDSIDKey);
  }
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[SSMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"store_redownload_parameters"));

  if (v8) {
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v8,  AVAssetDownloadSessioniTunesStoreContentDownloadParametersKey);
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"client_id"));
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userAgentWithBundleIdentifier:v9 version:@"1.0"]);

    if (v11) {
      -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v11,  AVAssetDownloadSessioniTunesStoreContentUserAgentKey);
    }
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
  unsigned int v13 = v12;
  if (v12)
  {
    uint64_t v14 = v12;
    if ((-[__CFString isEqualToString:](v14, "isEqualToString:", SSDownloadKindMovie) & 1) != 0)
    {
      uint64_t v15 = @"movie";
    }

    else if ((-[__CFString isEqualToString:](v14, "isEqualToString:", SSDownloadKindMusic) & 1) != 0)
    {
      uint64_t v15 = @"music";
    }

    else if ((-[__CFString isEqualToString:](v14, "isEqualToString:", SSDownloadKindMusicVideo) & 1) != 0)
    {
      uint64_t v15 = @"musicvideo";
    }

    else
    {
      if (!-[__CFString isEqualToString:](v14, "isEqualToString:", SSDownloadKindTelevisionEpisode))
      {
LABEL_26:
        -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v14,  AVAssetDownloadSessioniTunesStoreContentPurchasedMediaKindKey);

        goto LABEL_27;
      }

      uint64_t v15 = @"tvshow";
    }

    uint64_t v14 = (__CFString *)v15;
    goto LABEL_26;
  }

- (id)_newDataConsumerWithAsset:(id)a3 destinationPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:@"bytes_to_hash"]);
  uint64_t v9 = (uint64_t)[v8 integerValue];

  if (v9 < 1)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:@"hash_array"]);
    if (v10) {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v10,  0LL,  0LL,  0LL));
    }
    else {
      uint64_t v11 = 0LL;
    }
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0 || ![v11 count])
    {

      uint64_t v9 = 0LL;
      uint64_t v11 = 0LL;
    }
  }

  if (-[PrepareDownloadOperation _usesStreamingZipDataConsumerForAsset:]( self,  "_usesStreamingZipDataConsumerForAsset:",  v6))
  {
    unsigned int v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (!v11)
    {
LABEL_19:
      id v19 = -[StreamingZipDownloadDataConsumer initWithPath:options:]( objc_alloc(&OBJC_CLASS___StreamingZipDownloadDataConsumer),  "initWithPath:options:",  v7,  v13);

      goto LABEL_20;
    }

    uint64_t v14 = ISWeakLinkedStringConstantForString("SZExtractorOptionsHashType", 24LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:@"hash_type"]);
    id v17 = [v16 integerValue];

    if (v17)
    {
      if (v17 != (id)1)
      {
LABEL_18:
        uint64_t v22 = ISWeakLinkedStringConstantForString("SZExtractorOptionsHashesArray", 24LL);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

        -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v11, v23);
        uint64_t v24 = ISWeakLinkedStringConstantForString("SZExtractorOptionsHashedChunkSize", 24LL);
        unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
        -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v26, v25);

        uint64_t v27 = ISWeakLinkedStringConstantForString("SZExtractorOptionsDenyInvalidSymlinks", 24LL);
        id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

        -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", &__kCFBooleanTrue, v28);
        goto LABEL_19;
      }

      uint64_t v18 = "SZExtractorHashTypeSHA1";
    }

    else
    {
      uint64_t v18 = "SZExtractorHashTypeMD5";
    }

    uint64_t v20 = ISWeakLinkedStringConstantForString(v18, 24LL);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v21, v15);

    goto LABEL_18;
  }

  id v19 = -[FilesystemDownloadDataConsumer initWithPath:MD5Hashes:numberOfBytesToHash:]( objc_alloc(&OBJC_CLASS___FilesystemDownloadDataConsumer),  "initWithPath:MD5Hashes:numberOfBytesToHash:",  v7,  v11,  v9);
LABEL_20:

  return v19;
}

- (id)_newURLRequestWithAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"url"]);
  if (!v5)
  {
    id v7 = 0LL;
    goto LABEL_34;
  }

  id v6 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v5);
  id v7 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v6);
  -[NSMutableURLRequest setCachePolicy:](v7, "setCachePolicy:", 1LL);
  -[NSMutableURLRequest setAllowsCellularAccess:]( v7,  "setAllowsCellularAccess:",  -[PrepareDownloadOperation _allowsCellularAccessForAsset:](self, "_allowsCellularAccessForAsset:", v4));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"timeout_interval"]);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 doubleValue];
    -[NSMutableURLRequest setTimeoutInterval:](v7, "setTimeoutInterval:");
  }

  id v10 = &ACSLocateCachingServer_ptr;
  if (-[PrepareDownloadOperation _isPodcastRestore](self, "_isPodcastRestore"))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v11) {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v12 = [v11 shouldLog];
    else {
      LODWORD(v13) = v12;
    }
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      uint64_t v15 = (void *)objc_opt_class(self);
      id v16 = v15;
      int v36 = 138412802;
      int v37 = v15;
      __int16 v38 = 1024;
      int v39 = 172800;
      __int16 v40 = 2048;
      id v41 = [v4 databaseID];
      id v17 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%@: Setting timeout interval to %d for podcast restore: %lld",  &v36,  28);

      id v10 = &ACSLocateCachingServer_ptr;
      if (!v17)
      {
LABEL_17:

        -[NSMutableURLRequest setTimeoutInterval:](v7, "setTimeoutInterval:", 172800.0);
        goto LABEL_18;
      }

      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
      free(v17);
      __int128 v33 = v14;
      SSFileLog(v11, @"%@");
    }

    goto LABEL_17;
  }

- (void)_recordCoreAnalyticsEventForClient:(id)a3 downloadKind:(id)a4 url:(id)a5
{
  unsigned int v8 = (__CFString *)a3;
  uint64_t v9 = (__CFString *)a4;
  id v10 = (__CFString *)a5;
  if (+[SSDevice deviceIsInternalBuild](&OBJC_CLASS___SSDevice, "deviceIsInternalBuild"))
  {
    uint64_t v11 = @"No Client";
    if (v8) {
      uint64_t v11 = v8;
    }
    unsigned int v12 = v11;
    uint64_t v13 = @"No Download Kind";
    if (v9) {
      uint64_t v13 = v9;
    }
    uint64_t v14 = v13;
    uint64_t v15 = @"No Download URL";
    if (v10) {
      uint64_t v15 = v10;
    }
    id v16 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[SSMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  SSDownloadPropertyIsInStoreQueue));
    unsigned __int8 v18 = [v17 BOOLValue];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10012C0C4;
    v22[3] = &unk_10034F600;
    uint64_t v23 = v12;
    uint64_t v24 = v14;
    unsigned __int8 v26 = v18;
    uint64_t v25 = v16;
    uint64_t v19 = v16;
    uint64_t v20 = v14;
    uint64_t v21 = v12;
    AnalyticsSendEventLazy(@"com.apple.itunesstored.download-request", v22);
  }
}

- (BOOL)_requiresPoweredPluggedIn
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSDownloadPolicy policyRules](self->_policy, "policyRules"));
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0LL; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)i) powerStates] == (id)2) {
          ++v4;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v3);
    LOBYTE(v3) = v4 >= 1 && v4 == (void)[v2 count];
  }

  return (char)v3;
}

- (BOOL)_sendsStoreHeadersForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_from_store"));
  if ([v5 BOOLValue])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"is_external"]);
    unsigned int v7 = [v6 BOOLValue] ^ 1;
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_shouldCancelAsDuplicate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"cancel_if_duplicate"));
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
    if (SSDownloadKindIsMediaKind(v5))
    {
      unsigned __int8 v6 = -[PrepareDownloadOperation _itemIsInMediaLibrary](self, "_itemIsInMediaLibrary");
    }

    else
    {
      if (!SSDownloadKindIsSoftwareKind(v5))
      {
        BOOL v7 = 0;
        goto LABEL_9;
      }

      unsigned __int8 v6 = -[PrepareDownloadOperation _itemIsInSoftwareLibrary](self, "_itemIsInSoftwareLibrary");
    }

    BOOL v7 = v6;
LABEL_9:

    return v7;
  }

  return 0;
}

- (BOOL)_shouldCancelAutomaticDownload
{
  if (SSDeviceSupportsDownload(self, a2))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
    if (!SSDownloadKindIsSoftwareKind(v3)
      || (unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_restore")),
          unsigned __int8 v5 = [v4 BOOLValue],
          v4,
          (v5 & 1) == 0))
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_automatic"));
      id v7 = [v6 integerValue];

      if (v7 == (id)1)
      {
        __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[StoreDownloadQueue sharedDownloadQueue]( &OBJC_CLASS___StoreDownloadQueue,  "sharedDownloadQueue"));
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 automaticDownloadKinds]);
        unsigned int v10 = [v9 containsObject:v3];

        if (!v10)
        {
          LOBYTE(v13) = 1;
LABEL_19:

          return (char)v13;
        }

        if (SSDownloadKindIsSoftwareKind(v3))
        {
          id v11 = objc_msgSend((id)ISWeakLinkedClassForString(@"MCProfileConnection", 17), "sharedConnection");
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          else {
            LOBYTE(v13) = 1;
          }
          goto LABEL_17;
        }

        if (SSDownloadKindIsMediaKind(v3))
        {
          uint64_t v13 = (void *)ISWeakLinkedClassForString(@"MCProfileConnection", 17LL);
          uint64_t v14 = "MCFeatureITunesAllowed";
LABEL_16:
          uint64_t v15 = ISWeakLinkedStringConstantForString(v14, 17LL);
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 sharedConnection]);
          LOBYTE(v13) = [v16 effectiveBoolValueForSetting:v12] == 2;

LABEL_17:
          goto LABEL_19;
        }

        if (SSDownloadKindIsEBookKind(v3))
        {
          uint64_t v13 = (void *)ISWeakLinkedClassForString(@"MCProfileConnection", 17LL);
          uint64_t v14 = "MCFeatureBookstoreAllowed";
          goto LABEL_16;
        }
      }
    }

    LOBYTE(v13) = 0;
    goto LABEL_19;
  }

  LOBYTE(v13) = 1;
  return (char)v13;
}

- (BOOL)_shouldFailForFinishedDownload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SSMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)"));
  char IsFinishedPhase = SSDownloadPhaseIsFinishedPhase(v2);

  return IsFinishedPhase;
}

- (BOOL)_shouldFailForDiskSpaceWithAsset:(id)a3 dataConsumer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v70 = 0LL;
  id v71 = &v70;
  uint64_t v72 = 0x2020000000LL;
  char v73 = 0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForProperty:@"uncompressed_size"]);
  if ((objc_opt_respondsToSelector(v7, "unsignedLongLongValue") & 1) != 0) {
    __int128 v8 = (char *)[v7 unsignedLongLongValue];
  }
  else {
    __int128 v8 = 0LL;
  }
  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForProperty:@"bytes_total"]);
  uint64_t v63 = v6;

  if ((objc_opt_respondsToSelector(v64, "unsignedLongLongValue") & 1) != 0)
  {
    __int128 v9 = (char *)[v64 unsignedLongLongValue];
    if (v9 > v8) {
      __int128 v8 = v9;
    }
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v10) {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v11) = [v10 shouldLog];
  unsigned int v12 = [v10 shouldLogToDisk];
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  uint64_t v14 = v13;
  if (v12) {
    LODWORD(v11) = v11 | 2;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    uint64_t v11 = v11;
  }
  else {
    v11 &= 2u;
  }
  if ((_DWORD)v11)
  {
    uint64_t v15 = (void *)objc_opt_class(self);
    int v74 = 138412546;
    __int128 v75 = v15;
    __int16 v76 = 2048;
    int v77 = v8;
    id v16 = v15;
    id v17 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  2LL,  "%@: Determined asset size to be %llu bytes",  &v74,  22);

    if (!v17) {
      goto LABEL_18;
    }
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
    free(v17);
    int64_t v60 = v14;
    SSFileLog(v10, @"%@");
  }

LABEL_18:
  if (!v63) {
    goto LABEL_34;
  }
  unsigned __int8 v18 = (char *)[v63 diskUsage];
  uint64_t v19 = v18;
  if (v18 <= v8) {
    unint64_t v20 = (unint64_t)v18;
  }
  else {
    unint64_t v20 = 0LL;
  }
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v60));
  if (!v21) {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v22) = [v21 shouldLog];
  unsigned int v23 = [v21 shouldLogToDisk];
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
  uint64_t v25 = v24;
  if (v23) {
    LODWORD(v22) = v22 | 2;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    uint64_t v22 = v22;
  }
  else {
    v22 &= 2u;
  }
  if (!(_DWORD)v22) {
    goto LABEL_32;
  }
  unsigned __int8 v26 = (void *)objc_opt_class(self);
  int v74 = 138412546;
  __int128 v75 = v26;
  __int16 v76 = 2048;
  int v77 = v19;
  id v27 = v26;
  LODWORD(v62) = 22;
  id v28 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  2LL,  "%@: Discovered %llu bytes already transfered",  &v74,  v62);

  if (v28)
  {
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v28,  4LL));
    free(v28);
    int64_t v60 = v25;
    SSFileLog(v21, @"%@");
LABEL_32:
  }

  v8 -= v20;
LABEL_34:
  id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", @"initial_odr_size", v60));
  if ((objc_opt_respondsToSelector(v29, "unsignedLongLongValue") & 1) == 0) {
    goto LABEL_47;
  }
  id v30 = [v29 unsignedLongLongValue];
  unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v31) {
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v32) = [v31 shouldLog];
  unsigned int v33 = [v31 shouldLogToDisk];
  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
  uint64_t v35 = v34;
  if (v33) {
    LODWORD(v32) = v32 | 2;
  }
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    uint64_t v32 = v32;
  }
  else {
    v32 &= 2u;
  }
  if (!(_DWORD)v32) {
    goto LABEL_45;
  }
  int v36 = (void *)objc_opt_class(self);
  int v74 = 138412546;
  __int128 v75 = v36;
  __int16 v76 = 2048;
  int v77 = (char *)v30;
  id v37 = v36;
  LODWORD(v62) = 22;
  __int16 v38 = (void *)_os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  2LL,  "%@: Accounted for %llu bytes of initial ODR",  &v74,  v62);

  if (v38)
  {
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
    free(v38);
    uint64_t v61 = v35;
    SSFileLog(v31, @"%@");
LABEL_45:
  }

  __int128 v8 = &v8[(void)v30];
LABEL_47:
  int v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", @"local_path", v61));
  if (!v39)
  {
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForProperty:@"is_hls"]);
    if ((objc_opt_respondsToSelector(v40, "BOOLValue") & 1) != 0 && [v40 BOOLValue])
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
      id v42 = sub_10015AF78(v41);
      id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);

      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lld",  [v5 databaseID]));
      id v45 = (void *)objc_claimAutoreleasedReturnValue( [v44 stringByAppendingPathExtension:SSDownloadMetadataKeyFileExtensionMoviePackage]);

      int v39 = (void *)objc_claimAutoreleasedReturnValue([v43 stringByAppendingPathComponent:v45]);
    }

    else
    {
      id v46 = -[SSMemoryEntity databaseID](self->_download, "databaseID");
      id v47 = [v5 databaseID];
      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
      int v39 = (void *)objc_claimAutoreleasedReturnValue( +[ScratchManager directoryPathForDownloadID:assetID:kind:createIfNeeded:]( &OBJC_CLASS___ScratchManager,  "directoryPathForDownloadID:assetID:kind:createIfNeeded:",  v46,  v47,  v43,  1LL));
    }
  }

  if (v8 && v39)
  {
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
    if (((SSDownloadKindIsSoftwareKind(v48) & 1) != 0 || SSDownloadKindIsVideosAppKind(v48))
      && (uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_restore")),
          unsigned __int8 v50 = [v49 BOOLValue],
          v49,
          (v50 & 1) == 0))
    {
      uint64_t v52 = objc_alloc(&OBJC_CLASS___NSDictionary);
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL));
      uint64_t v51 = -[NSDictionary initWithObjectsAndKeys:]( v52,  "initWithObjectsAndKeys:",  v53,  kCPFreeSpaceEffortLevelKey,  0LL);
    }

    else
    {
      uint64_t v51 = 0LL;
    }

    id v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v39));
    dispatch_semaphore_t v55 = dispatch_semaphore_create(0LL);
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_10012CF04;
    v66[3] = &unk_10034F628;
    id v69 = &v70;
    v66[4] = self;
    id v67 = v5;
    uint64_t v57 = v55;
    id v68 = v57;
    [v56 requestFreeSpace:v8 atPath:v54 withOptions:v51 completionBlock:v66];

    dispatch_semaphore_wait(v57, 0xFFFFFFFFFFFFFFFFLL);
  }

  BOOL v58 = *((_BYTE *)v71 + 24) != 0;

  _Block_object_dispose(&v70, 8);
  return v58;
}

- (double)_transferProgressFractionWithAsset:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
  if (SSDownloadKindIsMediaKind(v5))
  {
    BOOL v6 = !-[PrepareDownloadOperation _assetNeedsDecryption:](self, "_assetNeedsDecryption:", v4);
    double v7 = 0.8;
    goto LABEL_7;
  }

  if (!SSDownloadKindIsEBookKind(v5))
  {
    BOOL v6 = [v5 isEqualToString:SSDownloadKindInAppContent] == 0;
    double v7 = 0.6;
LABEL_7:
    if (v6) {
      double v8 = 1.0;
    }
    else {
      double v8 = v7;
    }
    goto LABEL_10;
  }

  if (-[PrepareDownloadOperation _assetNeedsDecryption:](self, "_assetNeedsDecryption:", v4))
  {
    double v8 = 0.6;
  }

  else
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"is_zip_streamable"]);
    unsigned int v20 = [v19 BOOLValue];

    if (v20) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.8;
    }
  }

+ (int64_t)_URLSessionTaskPriorityForDownload:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"is_restore"]);
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) != 0)
  {
    uint64_t v7 = -2LL;
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"is_automatic"]);
    id v9 = [v8 integerValue];

    if (v9)
    {
      uint64_t v7 = -1LL;
    }

    else
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"priority"]);
      uint64_t v11 = (void *)v10;
      double v12 = &off_10036D8F0;
      if (v10) {
        double v12 = (_UNKNOWN **)v10;
      }
      double v13 = v12;

      uint64_t v7 = (uint64_t)[v13 integerValue];
    }
  }

  id v14 = [a1 _URLSessionTaskPriorityForDownloadPriority:v7];

  return (int64_t)v14;
}

+ (int64_t)_URLSessionTaskPriorityForDownloadPriority:(int64_t)a3
{
  else {
    return -100 * (a3 + 2) + 500;
  }
}

- (BOOL)_usesStreamingZipDataConsumerForAsset:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"is_zip_streamable"]);
  unsigned __int8 v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = [v5 BOOLValue];
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_from_store"));
    unsigned int v7 = [v8 BOOLValue];

    if (v7)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
      LOBYTE(v7) = (SSDownloadKindIsSoftwareKind(v9) & 1) != 0 || SSDownloadKindIsEBookKind(v9);
    }
  }

  char v10 = v7 & ~-[PrepareDownloadOperation _assetNeedsDecryption:](self, "_assetNeedsDecryption:", v4);

  return v10;
}

- (void).cxx_destruct
{
}

@end