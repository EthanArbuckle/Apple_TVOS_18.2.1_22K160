@interface GEOUtilityServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)currentServicesStateWithMessage:(id)a3;
- (void)getGeoServicesCacheDirectoryWithMessage:(id)a3;
- (void)getHomeDirectoryWithMessage:(id)a3;
- (void)heartbeatWithMessage:(id)a3;
@end

@implementation GEOUtilityServer

+ (id)identifier
{
  return @"utility";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  BOOL v14 = 0;
  if (v13 > 2119)
  {
    if (v13 == 2120)
    {
      if (!sub_100012B28(v12, v11, @"utility", v10, &off_10005E808, 0LL))
      {
        BOOL v14 = 1;
        goto LABEL_17;
      }

      id v19 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
      v16 = v19;
      BOOL v14 = v19 != 0LL;
      if (!v19) {
        goto LABEL_16;
      }
      [v19 setSignpostId:a6];
      -[GEOUtilityServer currentServicesStateWithMessage:](self, "currentServicesStateWithMessage:", v16);
      goto LABEL_15;
    }

    if (v13 == 2856)
    {
      id v17 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
      v16 = v17;
      BOOL v14 = v17 != 0LL;
      if (v17)
      {
        [v17 setSignpostId:a6];
        -[GEOUtilityServer getGeoServicesCacheDirectoryWithMessage:]( self,  "getGeoServicesCacheDirectoryWithMessage:",  v16);
        goto LABEL_15;
      }

- (void)heartbeatWithMessage:(id)a3
{
  id v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = GEOPeerHeartbeatNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 peer]);

  [v6 postNotificationName:v4 object:v5];
}

- (void)getHomeDirectoryWithMessage:(id)a3
{
  id v6 = @"path";
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths _internal_homeDirectory](&OBJC_CLASS___GEOFilePaths, "_internal_homeDirectory"));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));

  [v3 sendReply:v5];
}

- (void)getGeoServicesCacheDirectoryWithMessage:(id)a3
{
  id v6 = @"path";
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[GEOFilePaths _internal_geoServicesCacheDirectoryPath]( &OBJC_CLASS___GEOFilePaths,  "_internal_geoServicesCacheDirectoryPath"));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));

  [v3 sendReply:v5];
}

- (void)currentServicesStateWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___GEOServicesState);
  [v4 setBogusFieldForTestingPurposes:@"Valid looking state field"];
  v7 = @"state";
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
  v8 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  [v3 sendReply:v6];
}

@end