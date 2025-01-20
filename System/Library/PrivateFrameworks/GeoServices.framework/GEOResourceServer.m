@interface GEOResourceServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)fetchWithRequest:(id)a3;
@end

@implementation GEOResourceServer

+ (id)identifier
{
  return @"resources";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (sub_100011D18(v10) == 522)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___GEOResourceFetchRequest, v13, v14);
    id v16 = sub_100012270(@"resources", v10, v11, v15, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    BOOL v19 = v17 != 0LL;
    if (v17)
    {
      [v17 setSignpostId:a6];
      -[GEOResourceServer fetchWithRequest:](self, "fetchWithRequest:", v18);
    }
  }

  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)fetchWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [[GEOResourceFetchReply alloc] initWithRequest:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 resources]);
  id v6 = [v5 count];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceRequester sharedRequester](&OBJC_CLASS___GEOResourceRequester, "sharedRequester"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 resources]);
    id v9 = [v3 force];
    id v10 = [v3 unpack];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 manifestConfiguration]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredAuditToken]);
    global_queue = (void *)geo_get_global_queue(21LL);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10001E328;
    v15[3] = &unk_100059D10;
    id v16 = v4;
    [v7 fetchResources:v8 force:v9 unpack:v10 manifestConfiguration:v11 auditToken:v12 queue:global_queue handler:v15];
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"No resources in request"));
    [v4 setError:v14];

    [v4 send];
  }
}

@end