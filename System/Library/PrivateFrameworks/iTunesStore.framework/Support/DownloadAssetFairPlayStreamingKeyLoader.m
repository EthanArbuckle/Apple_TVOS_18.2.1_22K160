@interface DownloadAssetFairPlayStreamingKeyLoader
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (DownloadAssetFairPlayStreamingKeyLoader)initWithDownloadEntity:(id)a3;
- (DownloadAssetFairPlayStreamingKeyLoaderDelegate)delegate;
- (IPodLibraryItem)libraryItem;
- (id)_pastisCertificateURL;
- (id)_pastisKeyServerURL;
- (id)_track;
- (int64_t)downloadIdentifier;
- (int64_t)rentalIdentifier;
- (int64_t)storeItemIdentifier;
- (void)applyResourceLoaderDelegate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DownloadAssetFairPlayStreamingKeyLoader

- (DownloadAssetFairPlayStreamingKeyLoader)initWithDownloadEntity:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DownloadAssetFairPlayStreamingKeyLoader;
  v5 = -[DownloadAssetFairPlayStreamingKeyLoader init](&v17, "init");
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.itunesstore.PipelineDownloadTaskState", 0LL);
    resourceLoaderQueue = v5->_resourceLoaderQueue;
    v5->_resourceLoaderQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.itunesstore.PipelineDownloadTaskState.persistKeys", 0LL);
    persistenceQueue = v5->_persistenceQueue;
    v5->_persistenceQueue = (OS_dispatch_queue *)v8;

    v10 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  3LL);
    mutableCachedKeys = v5->_mutableCachedKeys;
    v5->_mutableCachedKeys = v10;

    if (v4)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"rental_id"]);
      v5->_rentalIdentifier = (int64_t)[v12 integerValue];

      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"store_item_id"]);
      v5->_storeItemIdentifier = (int64_t)[v13 integerValue];

      v5->_downloadIdentifier = (int64_t)[v4 persistentID];
      v14 = (IPodLibraryItem *)[v4 copyDownloadingIPodLibraryItem];
      libraryItem = v5->_libraryItem;
      v5->_libraryItem = v14;
    }
  }

  return v5;
}

- (void)applyResourceLoaderDelegate:(id)a3
{
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  return 0;
}

- (id)_pastisCertificateURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBag URLBagForContext:](&OBJC_CLASS___SSURLBag, "URLBagForContext:", v2));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"fps-cert" error:0]);
  if (v4) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (id)_pastisKeyServerURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBag URLBagForContext:](&OBJC_CLASS___SSURLBag, "URLBagForContext:", v2));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"fps-request" error:0]);
  if (v4) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (id)_track
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3TrackPropertyStoreItemID,  self->_storeItemIdentifier));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary sharedLibrary](&OBJC_CLASS___ML3MusicLibrary, "sharedLibrary"));
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ML3Track anyInLibrary:predicate:](&OBJC_CLASS___ML3Track, "anyInLibrary:predicate:", v4, v3));

  if (!v5)
  {
    dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAssetFairPlayStreamingKeyLoader libraryItem](self, "libraryItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      v11 = (void *)objc_opt_class(self);
      id v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v6 itemMediaPath]);
      int v21 = 138412546;
      v22 = v11;
      __int16 v23 = 2112;
      v24 = v13;
      v14 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Adding media item to iPod library: %@",  &v21,  22);

      if (!v14) {
        goto LABEL_14;
      }
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      SSFileLog(v7, @"%@");
    }

LABEL_14:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[IPodLibrary deviceIPodLibrary](&OBJC_CLASS___IPodLibrary, "deviceIPodLibrary"));
    uint64_t v20 = 0LL;
    id v16 = [v15 addLibraryItem:v6 error:&v20];

    if (v16)
    {
      id v17 = objc_alloc(&OBJC_CLASS___ML3Track);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary sharedLibrary](&OBJC_CLASS___ML3MusicLibrary, "sharedLibrary"));
      id v5 = [v17 initWithPersistentID:v16 inLibrary:v18];
    }

    else
    {
      id v5 = 0LL;
    }
  }

  return v5;
}

- (DownloadAssetFairPlayStreamingKeyLoaderDelegate)delegate
{
  return (DownloadAssetFairPlayStreamingKeyLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (IPodLibraryItem)libraryItem
{
  return self->_libraryItem;
}

- (int64_t)rentalIdentifier
{
  return self->_rentalIdentifier;
}

- (int64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void).cxx_destruct
{
}

@end