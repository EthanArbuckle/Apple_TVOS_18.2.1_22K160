@interface MZUppSyncProcessor
- (MZUppSyncProcessor)initWithStorageProviderDelegate:(id)a3;
- (MZUppSyncProcessorStorageProviding)storageProvider;
- (NSMutableDictionary)metadataItemsFromDataSource;
- (NSMutableDictionary)metadataItemsFromKVSStorage;
- (NSMutableDictionary)metadataItemsToCommitToDataSource;
- (NSMutableDictionary)metadataItemsToCommitToKVSStorage;
- (NSMutableDictionary)reportedItemVersionForIdentifier;
- (NSString)responseDomainVersion;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int)mergeMetadataItemFromSetResponse:(id)a3;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)mergeMetadataItemsFromGetResponse;
- (void)setMetadataItemsFromDataSource:(id)a3;
- (void)setMetadataItemsFromKVSStorage:(id)a3;
- (void)setMetadataItemsToCommitToDataSource:(id)a3;
- (void)setMetadataItemsToCommitToKVSStorage:(id)a3;
- (void)setReportedItemVersionForIdentifier:(id)a3;
- (void)setResponseDomainVersion:(id)a3;
- (void)setStorageProvider:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 willProcessResponseWithDomainVersion:(id)a4;
@end

@implementation MZUppSyncProcessor

- (MZUppSyncProcessor)initWithStorageProviderDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MZUppSyncProcessor;
  v5 = -[MZUppSyncProcessor init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    -[MZUppSyncProcessor setStorageProvider:](v5, "setStorageProvider:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[MZUppSyncProcessor setMetadataItemsFromDataSource:](v6, "setMetadataItemsFromDataSource:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[MZUppSyncProcessor setMetadataItemsFromKVSStorage:](v6, "setMetadataItemsFromKVSStorage:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[MZUppSyncProcessor setMetadataItemsToCommitToDataSource:](v6, "setMetadataItemsToCommitToDataSource:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[MZUppSyncProcessor setMetadataItemsToCommitToKVSStorage:](v6, "setMetadataItemsToCommitToKVSStorage:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[MZUppSyncProcessor setReportedItemVersionForIdentifier:](v6, "setReportedItemVersionForIdentifier:", v11);
  }

  return v6;
}

- (int)mergeMetadataItemFromSetResponse:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromKVSStorage](self, "metadataItemsFromKVSStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 itemIdentifier]);
  [v5 setObject:v4 forKey:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](self, "storageProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromKVSStorage](self, "metadataItemsFromKVSStorage"));
  objc_msgSend(v7, "setNumMetadataItemsFromKVSStorage:", objc_msgSend(v8, "count"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromDataSource](self, "metadataItemsFromDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 itemIdentifier]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10011D4F0;
  v27[3] = &unk_100245428;
  v27[4] = self;
  id v12 = v4;
  id v28 = v12;
  id v13 = v11;
  id v29 = v13;
  v14 = objc_retainBlock(v27);
  if (!v13) {
    goto LABEL_5;
  }
  [v13 timestamp];
  double v16 = v15;
  [v12 timestamp];
  if (v16 > v17)
  {
    v18 = (uint64_t (*)(void *, uint64_t))v14[2];
LABEL_8:
    v22 = v14;
    uint64_t v23 = 1LL;
    goto LABEL_9;
  }

  [v13 timestamp];
  double v20 = v19;
  [v12 timestamp];
  if (v20 >= v21)
  {
    unsigned int v24 = [v13 isEqual:v12];
    v18 = (uint64_t (*)(void *, uint64_t))v14[2];
    if (!v24) {
      goto LABEL_8;
    }
  }

  else
  {
LABEL_5:
    v18 = (uint64_t (*)(void *, uint64_t))v14[2];
  }

  v22 = v14;
  uint64_t v23 = 2LL;
LABEL_9:
  int v25 = v18(v22, v23);

  return v25;
}

- (void)mergeMetadataItemsFromGetResponse
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromDataSource](self, "metadataItemsFromDataSource"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromKVSStorage](self, "metadataItemsFromKVSStorage"));
  v46 = self;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToDataSource](self, "metadataItemsToCommitToDataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToKVSStorage](self, "metadataItemsToCommitToKVSStorage"));
  uint64_t v6 = _MTLogCategoryUPPSync(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v59 = v3;
    __int16 v60 = 2114;
    v61 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Merging local and remote items\nlocal items = %{public}@\nremote items = %{public}@",  buf,  0x16u);
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
  id v9 = [v8 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v53;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 itemIdentifier]);
        double v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v14]);

        if (!v15
          || ([v13 timestamp], double v17 = v16, objc_msgSend(v15, "timestamp"), v17 > v18)
          || ([v13 timestamp], double v20 = v19, objc_msgSend(v15, "timestamp"), v20 == v21)
          && ([v13 isEqual:v15] & 1) == 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v13 itemIdentifier]);
          [v5 setObject:v13 forKey:v22];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }

    while (v10);
  }

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  id v24 = [v23 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v49;
    do
    {
      for (j = 0LL; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)j);
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 itemIdentifier]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v29]);

        if (!v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([v28 itemIdentifier]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v31]);

          if (!v32 || ([v28 timestamp], double v34 = v33, objc_msgSend(v32, "timestamp"), v34 > v35))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue([v28 itemIdentifier]);
            [v47 setObject:v28 forKey:v36];
          }
        }
      }

      id v25 = [v23 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }

    while (v25);
  }

  uint64_t v38 = _MTLogCategoryUPPSync(v37);
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToDataSource](v46, "metadataItemsToCommitToDataSource"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToKVSStorage](v46, "metadataItemsToCommitToKVSStorage"));
    *(_DWORD *)buf = 138543618;
    v59 = v40;
    __int16 v60 = 2114;
    v61 = v41;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Merge result:\nmetadataItemsToCommitToDataSource = %{public}@\nmetadataItemsToCommitToKVSStorage = %{public}@",  buf,  0x16u);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](v46, "storageProvider"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToDataSource](v46, "metadataItemsToCommitToDataSource"));
  objc_msgSend(v42, "setNumMetadataItemsToCommitToDataSource:", objc_msgSend(v43, "count"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](v46, "storageProvider"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToKVSStorage](v46, "metadataItemsToCommitToKVSStorage"));
  objc_msgSend(v44, "setNumMetadataItemsToCommitToKVSStorage:", objc_msgSend(v45, "count"));
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  return 0LL;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor reportedItemVersionForIdentifier](self, "reportedItemVersionForIdentifier"));
  *a5 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToKVSStorage](self, "metadataItemsToCommitToKVSStorage"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v7]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 keyValueStorePayload]);
  return v11;
}

- (void)transaction:(id)a3 willProcessResponseWithDomainVersion:(id)a4
{
  if (a4)
  {
    -[MZUppSyncProcessor setResponseDomainVersion:](self, "setResponseDomainVersion:", a4);
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor responseDomainVersion](self, "responseDomainVersion", a3));
    -[MZUppSyncProcessor setResponseDomainVersion:](self, "setResponseDomainVersion:", v5);
  }

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v23 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void (**)(id, void))a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](self, "storageProvider"));
  unsigned int v15 = [v14 wasCanceled];

  if (v15)
  {
    v13[2](v13, 0LL);
  }

  else
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue( +[MZUniversalPlaybackPositionMetadata metadataWithValuesItemIdentifier:keyValueStorePayload:]( &OBJC_CLASS___MZUniversalPlaybackPositionMetadata,  "metadataWithValuesItemIdentifier:keyValueStorePayload:",  v11,  v23));
    if (v16)
    {
      double v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromKVSStorage](self, "metadataItemsFromKVSStorage"));
      double v18 = (void *)objc_claimAutoreleasedReturnValue([v16 itemIdentifier]);
      [v17 setObject:v16 forKey:v18];

      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor reportedItemVersionForIdentifier](self, "reportedItemVersionForIdentifier"));
      double v20 = (void *)objc_claimAutoreleasedReturnValue([v16 itemIdentifier]);
      [v19 setObject:v12 forKey:v20];

      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](self, "storageProvider"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromKVSStorage](self, "metadataItemsFromKVSStorage"));
      objc_msgSend(v21, "setNumMetadataItemsFromKVSStorage:", objc_msgSend(v22, "count"));
    }

    v13[2](v13, 0LL);
  }
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v9 = (void (**)(id, void))a7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](self, "storageProvider"));
  [v8 wasCanceled];

  v9[2](v9, 0LL);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v20 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void (**)(id, void))a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](self, "storageProvider"));
  unsigned int v15 = [v14 wasCanceled];

  if (v15)
  {
    v13[2](v13, 0LL);
  }

  else
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue( +[MZUniversalPlaybackPositionMetadata metadataWithValuesItemIdentifier:keyValueStorePayload:]( &OBJC_CLASS___MZUniversalPlaybackPositionMetadata,  "metadataWithValuesItemIdentifier:keyValueStorePayload:",  v11,  v20));
    if (v16)
    {
      double v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor reportedItemVersionForIdentifier](self, "reportedItemVersionForIdentifier"));
      double v18 = (void *)objc_claimAutoreleasedReturnValue([v16 itemIdentifier]);
      [v17 setObject:v12 forKey:v18];

      BOOL v19 = -[MZUppSyncProcessor mergeMetadataItemFromSetResponse:](self, "mergeMetadataItemFromSetResponse:", v16) == 1;
    }

    else
    {
      BOOL v19 = 0LL;
    }

    v13[2](v13, v19);
  }
}

- (NSString)responseDomainVersion
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setResponseDomainVersion:(id)a3
{
}

- (NSMutableDictionary)metadataItemsFromDataSource
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setMetadataItemsFromDataSource:(id)a3
{
}

- (NSMutableDictionary)metadataItemsToCommitToDataSource
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setMetadataItemsToCommitToDataSource:(id)a3
{
}

- (NSMutableDictionary)metadataItemsToCommitToKVSStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setMetadataItemsToCommitToKVSStorage:(id)a3
{
}

- (NSMutableDictionary)metadataItemsFromKVSStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMetadataItemsFromKVSStorage:(id)a3
{
}

- (NSMutableDictionary)reportedItemVersionForIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setReportedItemVersionForIdentifier:(id)a3
{
}

- (MZUppSyncProcessorStorageProviding)storageProvider
{
  return (MZUppSyncProcessorStorageProviding *)objc_loadWeakRetained((id *)&self->_storageProvider);
}

- (void)setStorageProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end