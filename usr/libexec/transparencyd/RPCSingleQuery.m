@interface RPCSingleQuery
+ (id)fetchRequest;
- (id)getQueryRequest:(id *)a3;
- (id)getQueryResponse:(id *)a3;
@end

@implementation RPCSingleQuery

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"RPCSingleQuery");
}

- (id)getQueryRequest:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery request](self, "request"));

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery request](self, "request"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___QueryRequest,  "parseFromData:error:",  v6,  a3));
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDatabase,  -133LL,  @"No query request saved for RPC"));
    id v6 = v7;
    if (a3 && v7)
    {
      id v6 = v7;
      v5 = 0LL;
      *a3 = v6;
    }
  }

  return v5;
}

- (id)getQueryResponse:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery response](self, "response"));

  if (!v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDatabase,  -341LL,  @"No query response saved for RPC"));
    id v10 = v12;
    if (a3 && v12)
    {
      id v10 = v12;
      v5 = 0LL;
      *a3 = v10;
    }

    goto LABEL_12;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery response](self, "response"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___QueryResponse,  "parseFromData:error:",  v6,  a3));

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery serverHint](self, "serverHint"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery serverHint](self, "serverHint"));
      [v5 setMetadataValue:v8 key:kTransparencyResponseMetadataKeyServerHint];
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery responseTime](self, "responseTime"));

    if (v9)
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery responseTime](self, "responseTime"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "kt_dateToString"));
      [v5 setMetadataValue:v11 key:@"ResponseTime"];

LABEL_12:
    }
  }

  return v5;
}

@end