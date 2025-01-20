@interface DAAssetUploader
- (DAAssetUploader)init;
- (NSMapTable)completionMap;
- (void)ASTUploadClientDidCompleteFileUpload:(id)a3;
- (void)setCompletionMap:(id)a3;
- (void)uploadAssets:(id)a3 wtihDeviceIdentity:(id)a4 completion:(id)a5;
@end

@implementation DAAssetUploader

- (DAAssetUploader)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DAAssetUploader;
  v2 = -[DAAssetUploader init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithWeakToStrongObjects](&OBJC_CLASS___NSMapTable, "mapTableWithWeakToStrongObjects"));
    completionMap = v2->_completionMap;
    v2->_completionMap = (NSMapTable *)v3;
  }

  return v2;
}

- (void)uploadAssets:(id)a3 wtihDeviceIdentity:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v58 = a4;
  v51 = (void (**)(id, void *, void *))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
  id v9 = [v8 count];

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  DKErrorDomain,  0LL,  0LL));
    v51[2](v51, v10, v11);
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  v50 = v7;
  id obj = (id)objc_claimAutoreleasedReturnValue([v7 items]);
  id v12 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v65;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v65 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 extra]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"name"]);

        v19 = (void *)objc_claimAutoreleasedReturnValue([v16 extra]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"encryptionKey"]);

        v21 = (void *)objc_claimAutoreleasedReturnValue([v16 extra]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"token"]);

        v23 = (void *)objc_claimAutoreleasedReturnValue([v16 extra]);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"extraHeaders"]);
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v24));

        id v26 = objc_alloc(&OBJC_CLASS___RepairToolRequestItem);
        v27 = (void *)objc_claimAutoreleasedReturnValue( [@"https://genevaut-traffic.corp.apple.com/GenevaTrafficServer/PutAsset/171170.dev.asset.cosmeticInspection/" stringByAppendingString:v18]);
        id v28 = [v26 initWithDestination:v27 andEncryptionKey:v20 andToken:v22 andExtraHeaders:v25];
        [v57 addObject:v28];
      }

      id v13 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
    }

    while (v13);
  }

  uint64_t v29 = objc_claimAutoreleasedReturnValue( +[ASTUploadClientFactory repairToolUploadClientWithUploadRequests:andDelegate:]( &OBJC_CLASS___ASTUploadClientFactory,  "repairToolUploadClientWithUploadRequests:andDelegate:",  v57,  self));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[DAAssetUploader completionMap](self, "completionMap"));
  v31 = objc_retainBlock(v51);
  id obja = (id)v29;
  [v30 setObject:v31 forKey:v29];

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v33 = v58;
  if (v58)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v58 deviceIdentityCert]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v58 deviceIdentityPublicKeyDigest]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v34 base64EncodedStringWithOptions:0]);
    [v32 setObject:v36 forKeyedSubscript:@"certString"];

    v37 = (void *)objc_claimAutoreleasedReturnValue([v35 base64EncodedStringWithOptions:0]);
    [v32 setObject:v37 forKeyedSubscript:@"pubKeyDigest"];
  }

  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v52 = (id)objc_claimAutoreleasedReturnValue([v50 items]);
  id v38 = [v52 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v54 = *(void *)v61;
    do
    {
      for (j = 0LL; j != v39; j = (char *)j + 1)
      {
        if (*(void *)v61 != v54) {
          objc_enumerationMutation(v52);
        }
        v41 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)j);
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 extra]);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"name"]);

        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v44 setObject:v43 forKeyedSubscript:@"name"];
        if (v33)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue([v41 data]);
          uint64_t v59 = 0LL;
          v46 = (void *)objc_claimAutoreleasedReturnValue([v58 signPayload:v45 error:&v59]);

          [v44 setObject:v32 forKeyedSubscript:@"cert"];
          v47 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"pubKeyDigest"]);
          [v44 setObject:v47 forKeyedSubscript:@"pubKeyDigest"];

          v48 = (void *)objc_claimAutoreleasedReturnValue([v46 base64EncodedStringWithOptions:0]);
          [v44 setObject:v48 forKeyedSubscript:@"sig"];

          v33 = v58;
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue([v41 data]);
        [obja queueUploadWithSourceData:v49 andExtra:v44];
      }

      id v39 = [v52 countByEnumeratingWithState:&v60 objects:v68 count:16];
    }

    while (v39);
  }
}

- (void)ASTUploadClientDidCompleteFileUpload:(id)a3
{
  id v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAAssetUploader completionMap](self, "completionMap"));
  v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 objectForKey:v8]);

  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAAssetUploader completionMap](self, "completionMap"));
    [v6 removeObjectForKey:v8];

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uploadStatus]);
    ((void (**)(void, void *, void))v5)[2](v5, v7, 0LL);
  }
}

- (NSMapTable)completionMap
{
  return self->_completionMap;
}

- (void)setCompletionMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end