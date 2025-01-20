@interface TransparencyRPCRequestBuilder
+ (id)buildBatchQueryRequest:(id)a3 application:(id)a4 error:(id *)a5;
+ (id)buildBatchQueryRequests:(id)a3 application:(id)a4 maxURIsPerBatch:(unint64_t)a5 error:(id *)a6;
+ (id)buildConsistencyProofRequest:(id)a3 revisions:(id)a4 error:(id *)a5;
+ (id)buildPublicKeysRequest:(id)a3 error:(id *)a4;
+ (id)buildQueryRequest:(id)a3 application:(id)a4 error:(id *)a5;
+ (id)buildRevisionLogInclusionProofRequest:(id)a3 logType:(int)a4 revisions:(id)a5 error:(id *)a6;
@end

@implementation TransparencyRPCRequestBuilder

+ (id)buildPublicKeysRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___PublicKeysRequest);
  -[PublicKeysRequest setVersion:](v6, "setVersion:", kTransparencyProtocolVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationValueForIdentifier:]( &OBJC_CLASS___TransparencyApplication,  "applicationValueForIdentifier:",  v5));
  v8 = v7;
  if (v7)
  {
    -[PublicKeysRequest setApplication:](v6, "setApplication:", [v7 intValue]);
    v9 = v6;
  }

  else
  {
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInterface,  -42LL,  @"Unknown application %@",  v5));
    }
    if (qword_1002EEFC0 != -1) {
      dispatch_once(&qword_1002EEFC0, &stru_10028AB08);
    }
    v10 = (os_log_s *)qword_1002EEFC8;
    if (os_log_type_enabled((os_log_t)qword_1002EEFC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unknown application %@", buf, 0xCu);
    }

    v9 = 0LL;
  }

  return v9;
}

+ (id)buildQueryRequest:(id)a3 application:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___QueryRequest);
  -[QueryRequest setVersion:](v8, "setVersion:", kTransparencyProtocolVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationValueForIdentifier:]( &OBJC_CLASS___TransparencyApplication,  "applicationValueForIdentifier:",  v6));

  -[QueryRequest setApplication:](v8, "setApplication:", [v9 intValue]);
  -[QueryRequest setUri:](v8, "setUri:", v7);

  return v8;
}

+ (id)buildBatchQueryRequest:(id)a3 application:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(&OBJC_CLASS___BatchQueryRequest);
  -[BatchQueryRequest setVersion:](v8, "setVersion:", kTransparencyProtocolVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationValueForIdentifier:]( &OBJC_CLASS___TransparencyApplication,  "applicationValueForIdentifier:",  v7));
  -[BatchQueryRequest setApplication:](v8, "setApplication:", [v9 intValue]);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryRequest uriArray](v8, "uriArray", (void)v18));
        [v16 addObject:v15];

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  return v8;
}

+ (id)buildBatchQueryRequests:(id)a3 application:(id)a4 maxURIsPerBatch:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v12, "addObject:", *(void *)(*((void *)&v22 + 1) + 8 * (void)v17), (void)v22);
        if ((unint64_t)[v12 count] >= a5)
        {
          uint64_t v18 = objc_claimAutoreleasedReturnValue( +[TransparencyRPCRequestBuilder buildBatchQueryRequest:application:error:]( &OBJC_CLASS___TransparencyRPCRequestBuilder,  "buildBatchQueryRequest:application:error:",  v12,  v10,  a6));
          if (!v18)
          {

            id v20 = 0LL;
            goto LABEL_16;
          }

          __int128 v19 = (void *)v18;
          [v11 addObject:v18];
          [v12 removeAllObjects];
        }

        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  if (![v12 count]) {
    goto LABEL_14;
  }
  id v20 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyRPCRequestBuilder buildBatchQueryRequest:application:error:]( &OBJC_CLASS___TransparencyRPCRequestBuilder,  "buildBatchQueryRequest:application:error:",  v12,  v10,  a6));
  if (v20)
  {
    [v11 addObject:v20];

LABEL_14:
    id v20 = v11;
  }

+ (id)buildConsistencyProofRequest:(id)a3 revisions:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 count] >= 2)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___ConsistencyProofRequest);
    -[ConsistencyProofRequest setVersion:](v8, "setVersion:", kTransparencyProtocolVersion);
    id v9 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  (char *)[v7 count] - 1);
    -[ConsistencyProofRequest setRequestsArray:](v8, "setRequestsArray:", v9);

    else {
      uint64_t v10 = 2LL;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationValueForIdentifier:]( &OBJC_CLASS___TransparencyApplication,  "applicationValueForIdentifier:",  v6));
    id v12 = [v11 intValue];

    -[ConsistencyProofRequest setLogType:](v8, "setLogType:", v10);
    if ((_DWORD)v12) {
      -[ConsistencyProofRequest setApplication:](v8, "setApplication:", v12);
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
    id v14 = [v13 unsignedLongLongValue];

    if ([v7 count] != (id)1)
    {
      id v15 = 0LL;
      do
      {
        uint64_t v16 = objc_alloc_init(&OBJC_CLASS___ConsistencyProofRequest_LogConsistencyRequest);
        -[ConsistencyProofRequest_LogConsistencyRequest setStartRevision:](v16, "setStartRevision:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:++v15]);
        -[ConsistencyProofRequest_LogConsistencyRequest setEndRevision:]( v16,  "setEndRevision:",  [v17 unsignedLongLongValue]);

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v15]);
        id v14 = [v18 unsignedLongLongValue];

        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofRequest requestsArray](v8, "requestsArray"));
        [v19 addObject:v16];
      }

      while (v15 < (char *)[v7 count] - 1);
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

+ (id)buildRevisionLogInclusionProofRequest:(id)a3 logType:(int)a4 revisions:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___RevisionLogInclusionProofRequest);
  -[RevisionLogInclusionProofRequest setVersion:](v10, "setVersion:", kTransparencyProtocolVersion);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationValueForIdentifier:]( &OBJC_CLASS___TransparencyApplication,  "applicationValueForIdentifier:",  v8));
  -[RevisionLogInclusionProofRequest setApplication:](v10, "setApplication:", [v11 intValue]);

  -[RevisionLogInclusionProofRequest setLogType:](v10, "setLogType:", v7);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v16);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[RevisionLogInclusionProofRequest revisionArray](v10, "revisionArray", (void)v20));
        objc_msgSend(v18, "addValue:", objc_msgSend(v17, "unsignedLongLongValue"));

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v14);
  }

  return v10;
}

@end