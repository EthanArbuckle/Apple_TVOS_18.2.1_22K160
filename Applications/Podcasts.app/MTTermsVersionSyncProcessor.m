@interface MTTermsVersionSyncProcessor
- (BOOL)hasLocalChanges;
- (BOOL)mergeData:(id)a3 mismatch:(BOOL)a4;
- (BOOL)requiresNextGetTransaction;
- (MTTermsVersionSyncProcessor)initWithStorage:(id)a3;
- (MTTermsVersionSyncStorageProviding)storageProvider;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (void)completeTransactionWithNewVersion:(id)a3 mismatch:(BOOL)a4 finishedBlock:(id)a5;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)setStorageProvider:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
@end

@implementation MTTermsVersionSyncProcessor

- (MTTermsVersionSyncProcessor)initWithStorage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTermsVersionSyncProcessor;
  v5 = -[MTTermsVersionSyncProcessor init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTTermsVersionSyncProcessor setStorageProvider:](v5, "setStorageProvider:", v4);
  }

  return v6;
}

- (int64_t)operationTypeForSET
{
  return 8LL;
}

- (BOOL)hasLocalChanges
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  unsigned __int8 v3 = [v2 cloudSyncIsDirty];

  return v3;
}

- (BOOL)requiresNextGetTransaction
{
  return !+[MTPrivacyUtil allowReporting](&OBJC_CLASS___MTPrivacyUtil, "allowReporting");
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudSyncVersion]);

  return v5;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  v7 = (MZKeyValueStoreNode *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider", a3, a4));
  if (-[MZKeyValueStoreNode cloudSyncIsDirty](v7, "cloudSyncIsDirty"))
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceAgreedTermsVersion]);

    if (!v9)
    {
      v18 = 0LL;
      return v18;
    }

    v7 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreNode);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceAgreedTermsVersion]);
    id v12 = [v11 integerValue];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountAgreedTermsVersion]);
    id v15 = [v14 integerValue];

    else {
      id v16 = v12;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
    -[MZKeyValueStoreNode setNumberValue:](v7, "setNumberValue:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](v7, "value"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
    *a5 = (id)objc_claimAutoreleasedReturnValue([v19 cloudSyncVersion]);
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  [v6 setPodcastsDomainVersion:v5];
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  -[MTTermsVersionSyncProcessor completeTransactionWithNewVersion:mismatch:finishedBlock:]( self,  "completeTransactionWithNewVersion:mismatch:finishedBlock:",  v11,  -[MTTermsVersionSyncProcessor mergeData:mismatch:](self, "mergeData:mismatch:", a4, 0LL),  v10);
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  -[MTTermsVersionSyncProcessor completeTransactionWithNewVersion:mismatch:finishedBlock:]( self,  "completeTransactionWithNewVersion:mismatch:finishedBlock:",  v11,  -[MTTermsVersionSyncProcessor mergeData:mismatch:](self, "mergeData:mismatch:", a4, 1LL),  v10);
}

- (BOOL)mergeData:(id)a3 mismatch:(BOOL)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setValue:](v7, "setValue:", v6);

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceAgreedTermsVersion]);
  if (v9)
  {
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountAgreedTermsVersion]);

    if (!v11)
    {
      v19 = 0LL;
      goto LABEL_8;
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceAgreedTermsVersion]);
  id v14 = [v13 integerValue];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accountAgreedTermsVersion]);
  id v17 = [v16 integerValue];

  else {
    id v18 = v14;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
LABEL_8:
  if (-[MZKeyValueStoreNode hasData](v7, "hasData"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode numberValue](v7, "numberValue"));
    id v21 = [v20 integerValue];
    if ((uint64_t)v21 >= (uint64_t)[v19 integerValue])
    {
      id v22 = [v20 integerValue];
      if ((uint64_t)v22 >= (uint64_t)[v19 integerValue])
      {
        id v23 = v20;

        a4 = 0;
        v19 = v23;
      }
    }

    else
    {
      a4 = 1;
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  [v24 setAccountAgreedTermsVersion:v19];

  return a4;
}

- (void)completeTransactionWithNewVersion:(id)a3 mismatch:(BOOL)a4 finishedBlock:(id)a5
{
  BOOL v5 = a4;
  id v11 = (void (**)(id, BOOL))a5;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  [v9 setCloudSyncVersion:v8];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  [v10 setCloudSyncIsDirty:v5];

  v11[2](v11, v5);
}

- (MTTermsVersionSyncStorageProviding)storageProvider
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