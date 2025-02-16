@interface UARPUpdaterServiceDynamicAssetSolicitationRecord
- (BOOL)addSolicitedResponse:(id)a3 modelNumber:(id)a4;
- (BOOL)isDynamicAssetSolicitationComplete;
- (NSXPCListenerEndpoint)solicitedAssetResponseEndpoint;
- (UARPUpdaterServiceDynamicAssetSolicitationRecord)initWithModelNumbers:(id)a3 endpoint:(id)a4;
- (id)allSolicitedResponses;
- (void)addExpectedSolicitationResponse;
@end

@implementation UARPUpdaterServiceDynamicAssetSolicitationRecord

- (UARPUpdaterServiceDynamicAssetSolicitationRecord)initWithModelNumbers:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___UARPUpdaterServiceDynamicAssetSolicitationRecord;
  v8 = -[UARPUpdaterServiceDynamicAssetSolicitationRecord init](&v24, "init");
  if (v8)
  {
    id v19 = v7;
    v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [[UARPStandaloneCommandReplyRecord alloc] initWithModelNumber:*(void *)(*((void *)&v20 + 1) + 8 * (void)v14)];
          -[NSMutableArray addObject:](v9, "addObject:", v15);

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }

      while (v12);
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v9));
    responseRecords = v8->_responseRecords;
    v8->_responseRecords = (NSArray *)v16;

    objc_storeStrong((id *)&v8->_solicitedAssetResponseEndpoint, a4);
    v8->_expectedSolicitedAssetResponseCount = 0LL;

    id v7 = v19;
  }

  return v8;
}

- (void)addExpectedSolicitationResponse
{
  obj = self;
  objc_sync_enter(obj);
  ++obj->_expectedSolicitedAssetResponseCount;
  objc_sync_exit(obj);
}

- (BOOL)addSolicitedResponse:(id)a3 modelNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v9 = v8->_responseRecords;
  id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelNumber", (void)v18));
        unsigned int v15 = [v14 isEqualToString:v7];

        if (v15)
        {
          if (v6)
          {
            [v13 addResponseURL:v6];
          }

          else
          {
            unint64_t expectedSolicitedAssetResponseCount = v8->_expectedSolicitedAssetResponseCount;
            if (expectedSolicitedAssetResponseCount) {
              v8->_unint64_t expectedSolicitedAssetResponseCount = expectedSolicitedAssetResponseCount - 1;
            }
          }

          LOBYTE(v10) = 1;
          goto LABEL_15;
        }
      }

      id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (id)allSolicitedResponses
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v2->_responseRecords));
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isDynamicAssetSolicitationComplete
{
  v2 = self;
  objc_sync_enter(v2);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v3 = v2->_responseRecords;
  uint64_t v4 = 0LL;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v7), "getResponseURLs", (void)v11));
        id v9 = [v8 count];

        v4 += (uint64_t)v9;
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v5);
  }

  objc_sync_exit(v2);
  return v4 == v2->_expectedSolicitedAssetResponseCount;
}

- (NSXPCListenerEndpoint)solicitedAssetResponseEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end