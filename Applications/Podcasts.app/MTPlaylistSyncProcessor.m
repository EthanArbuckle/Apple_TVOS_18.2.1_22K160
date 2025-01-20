@interface MTPlaylistSyncProcessor
- (BOOL)hasLocalChanges;
- (BOOL)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6 isGetTransaction:(BOOL)a7;
- (BOOL)requiresNextGetTransaction;
- (MTPlaylistSyncProcessor)initWithStorageProvider:(id)a3;
- (MTPlaylistSyncStorageProviding)storageProvider;
- (NSMutableSet)addedPlaylists;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (void)completeTransactionWithNewVersion:(id)a3 isGetTransaction:(BOOL)a4 mismatch:(BOOL)a5 finishedBlock:(id)a6;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)setAddedPlaylists:(id)a3;
- (void)setStorageProvider:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
@end

@implementation MTPlaylistSyncProcessor

- (MTPlaylistSyncProcessor)initWithStorageProvider:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MTPlaylistSyncProcessor;
  v5 = -[MTPlaylistSyncProcessor init](&v16, "init");
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = _MTLogCategoryCloudSync(-[MTPlaylistSyncProcessor setStorageProvider:](v5, "setStorageProvider:", v4));
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    v6->_os_signpost_id_t signpostID = os_signpost_id_generate(v8);

    uint64_t v10 = _MTLogCategoryCloudSync(v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    os_signpost_id_t signpostID = v6->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  signpostID,  "MTPlaylistSyncProcessor.created",  "",  v15,  2u);
    }
  }

  return v6;
}

- (int64_t)operationTypeForSET
{
  return 3LL;
}

- (BOOL)hasLocalChanges
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  unsigned __int8 v3 = [v2 playlistSyncDirtyFlag];

  return v3;
}

- (BOOL)requiresNextGetTransaction
{
  return 1;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _MTLogCategoryCloudSync(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  signpostID,  "MTPlaylistSyncProcessor.GET",  "key: %@",  (uint8_t *)&v13,  0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playlistSyncVersion]);

  return v11;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = _MTLogCategoryCloudSync(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v7;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  signpostID,  "MTPlaylistSyncProcessor.SET",  "key: %@",  buf,  0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  if ([v12 playlistSyncDirtyFlag])
  {
  }

  else
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playlistSyncVersion]);

    if (v14)
    {
      v15 = 0LL;
      goto LABEL_12;
    }
  }

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  *a5 = (id)objc_claimAutoreleasedReturnValue([v16 playlistSyncVersion]);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 importContext]);

  v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10011C4A8;
  v24[3] = &unk_100240980;
  id v20 = v18;
  id v25 = v20;
  v26 = self;
  v21 = v19;
  v27 = v21;
  [v20 performBlockAndWait:v24];
  if (v21)
  {
    v22 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreNode);
    -[MZKeyValueStoreNode setArrayValue:](v22, "setArrayValue:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](v22, "value"));
  }

  else
  {
    v15 = 0LL;
  }

LABEL_12:
  return v15;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  [v6 setPodcastsDomainVersion:v5];
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  -[MTPlaylistSyncProcessor completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:]( self,  "completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:",  v12,  1LL,  -[MTPlaylistSyncProcessor mergeData:forKey:version:mismatch:isGetTransaction:]( self,  "mergeData:forKey:version:mismatch:isGetTransaction:",  a4,  a5,  v12,  0LL,  1LL),  v11);
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  -[MTPlaylistSyncProcessor completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:]( self,  "completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:",  v12,  0LL,  -[MTPlaylistSyncProcessor mergeData:forKey:version:mismatch:isGetTransaction:]( self,  "mergeData:forKey:version:mismatch:isGetTransaction:",  a4,  a5,  v12,  1LL,  0LL),  v11);
}

- (BOOL)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6 isGetTransaction:(BOOL)a7
{
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 playlistSyncVersion]);

  if (!v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
    [v14 setPlaylistSyncDirtyFlag:1];
  }

  v15 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setKey:](v15, "setKey:", v10);

  -[MZKeyValueStoreNode setValue:](v15, "setValue:", v11);
  if (-[MZKeyValueStoreNode hasData](v15, "hasData"))
  {
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode arrayValue](v15, "arrayValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 importContext]);

    v19 = objc_alloc(&OBJC_CLASS___MTPlaylistSyncDictionaryMerge);
    uint64_t v20 = _MTLogCategoryCloudSync(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = -[MTPlaylistSyncDictionaryMerge initWithLoggingCategory:dictionariesToMerge:]( v19,  "initWithLoggingCategory:dictionariesToMerge:",  v21,  v16);

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10011D00C;
    v24[3] = &unk_100243A08;
    void v24[4] = self;
    -[MTPlaylistSyncDictionaryMerge setCanDeletePlaylistUUIDBlock:](v22, "setCanDeletePlaylistUUIDBlock:", v24);
    -[MTPlaylistSyncDictionaryMerge performAndWaitWithContext:save:](v22, "performAndWaitWithContext:save:", v18, 1LL);
  }

  return a6;
}

- (void)completeTransactionWithNewVersion:(id)a3 isGetTransaction:(BOOL)a4 mismatch:(BOOL)a5 finishedBlock:(id)a6
{
  BOOL v6 = a5;
  uint64_t v9 = (void (**)(id, BOOL))a6;
  id v10 = a3;
  uint64_t v11 = _MTLogCategoryCloudSync(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  int v13 = v12;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v15 = @"NO";
    if (v6) {
      v15 = @"YES";
    }
    int v18 = 138412290;
    v19 = v15;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_END,  signpostID,  "MTPlaylistSyncProcessor.completed",  "mismatch %@",  (uint8_t *)&v18,  0xCu);
  }

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  [v16 setPlaylistSyncDirtyFlag:v6];

  v9[2](v9, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  [v17 setPlaylistSyncVersion:v10];
}

- (NSMutableSet)addedPlaylists
{
  return self->_addedPlaylists;
}

- (void)setAddedPlaylists:(id)a3
{
}

- (MTPlaylistSyncStorageProviding)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end