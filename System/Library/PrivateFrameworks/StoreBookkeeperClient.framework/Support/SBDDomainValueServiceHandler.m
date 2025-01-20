@interface SBDDomainValueServiceHandler
- (SBDDomainValueServiceHandler)initWithDomain:(id)a3;
- (SBKUniversalPlaybackPositionStore)cloudStore;
- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
@end

@implementation SBDDomainValueServiceHandler

- (SBDDomainValueServiceHandler)initWithDomain:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SBDDomainValueServiceHandler;
  v5 = -[SBDDomainServiceHandler initWithDomain:](&v17, "initWithDomain:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 foreignDatabasePath]);

    if (!v6) {
      goto LABEL_5;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 foreignDatabasePath]);
    uint64_t v8 = SBKStoreAccountIdentifierFromDatabasePath();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    v10 = objc_alloc(&OBJC_CLASS___SBKUniversalPlaybackPositionStore);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 domainIdentifier]);
    v12 = -[SBKUniversalPlaybackPositionStore initWithDomain:dataSource:automaticSynchronizeOptions:accountIdentifier:isActive:]( v10,  "initWithDomain:dataSource:automaticSynchronizeOptions:accountIdentifier:isActive:",  v11,  0LL,  0LL,  v9,  0LL);

    if (v12)
    {
      int v13 = 0;
      v14 = v12;
    }

    else
    {
LABEL_5:
      v15 = objc_alloc(&OBJC_CLASS___SBKUniversalPlaybackPositionStore);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 domainIdentifier]);
      v14 = -[SBKUniversalPlaybackPositionStore initWithDomain:dataSource:automaticSynchronizeOptions:isActive:]( v15,  "initWithDomain:dataSource:automaticSynchronizeOptions:isActive:",  v9,  0LL,  0LL,  0LL);
      v12 = 0LL;
      int v13 = 1;
    }

    objc_storeStrong((id *)&v5->_cloudStore, v14);
    if (v13)
    {
    }
  }

  return v5;
}

- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  cloudStore = self->_cloudStore;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 ubiquitousIdentifier]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100010060;
  v12[3] = &unk_10001D228;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  -[SBKUniversalPlaybackPositionStore pullMetadataItemWithItemIdentifier:completionBlock:]( cloudStore,  "pullMetadataItemWithItemIdentifier:completionBlock:",  v9,  v12);
}

- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 bookmarkTime];
  double v9 = v8;
  [v6 bookmarkTimestamp];
  double v11 = v10;
  id v12 = [v6 hasBeenPlayed];
  id v13 = [v6 userPlayCount];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 ubiquitousIdentifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SBKUniversalPlaybackPositionMetadata metadataWithItemIdentifier:bookmarkTime:bookmarkTimestamp:hasBeenPlayed:playCount:]( &OBJC_CLASS___SBKUniversalPlaybackPositionMetadata,  "metadataWithItemIdentifier:bookmarkTime:bookmarkTimestamp:hasBeenPlayed:playCount:",  v14,  v12,  v13,  v9,  v11));

  cloudStore = self->_cloudStore;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000FFE4;
  v19[3] = &unk_10001D228;
  id v20 = v6;
  id v21 = v7;
  id v17 = v7;
  id v18 = v6;
  -[SBKUniversalPlaybackPositionStore pushMetadataItem:completionBlock:]( cloudStore,  "pushMetadataItem:completionBlock:",  v15,  v19);
}

- (SBKUniversalPlaybackPositionStore)cloudStore
{
  return self->_cloudStore;
}

- (void).cxx_destruct
{
}

@end