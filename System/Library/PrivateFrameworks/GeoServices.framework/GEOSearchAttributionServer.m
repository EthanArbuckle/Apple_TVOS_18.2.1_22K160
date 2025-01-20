@interface GEOSearchAttributionServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)loadAttributionWithMessage:(id)a3;
@end

@implementation GEOSearchAttributionServer

+ (id)identifier
{
  return @"searchattribution";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  if (sub_100011D18(a3) == 1589)
  {
    id v12 = [[GEOMessage alloc] initWithXPCMessage:v10 peer:v11];
    v13 = v12;
    BOOL v14 = v12 != 0LL;
    if (v12)
    {
      [v12 setSignpostId:a6];
      -[GEOSearchAttributionServer loadAttributionWithMessage:](self, "loadAttributionWithMessage:", v13);
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)loadAttributionWithMessage:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"identifiers"]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray, v6, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[GEOSearchAttributionManifestManager sharedManager]( &OBJC_CLASS___GEOSearchAttributionManifestManager,  "sharedManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serverProxy]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100016EB4;
    v11[3] = &unk_100059888;
    id v12 = v3;
    [v10 loadAttributionInfoForIdentifiers:v5 completionHandler:v11];
  }

  else
  {
    NSLog(@"GEOSearchAttributionServer: Unexpected parameters. Ignoring.");
  }
}

@end