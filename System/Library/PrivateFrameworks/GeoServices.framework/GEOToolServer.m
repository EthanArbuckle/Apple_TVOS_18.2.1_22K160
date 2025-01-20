@interface GEOToolServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)calculatePurgableSpaceWithMessage:(id)a3;
- (void)checkProactiveTileDownloadPolicyEnabledWithMessage:(id)a3;
- (void)forceProactiveTileDownloaderRunWithMessage:(id)a3;
- (void)freePurgableSpaceWithMessage:(id)a3;
- (void)getDefaultWithMessage:(id)a3;
- (void)invalidateTileCacheWithMessage:(id)a3;
- (void)listFilePathsWithMessage:(id)a3;
- (void)lockDBsWithMessage:(id)a3;
- (void)notifyNetworkDefaultsChangedWithMessage:(id)a3;
- (void)pingWithMessage:(id)a3;
- (void)unlockDBsWithMessage:(id)a3;
@end

@implementation GEOToolServer

+ (id)identifier
{
  return @"geotool";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (sub_100012B28(v12, v11, @"geotool", v10, &off_10005E4D8, 0LL))
  {
    int v13 = sub_100011D18(v10);
    BOOL v14 = 0;
    if (v13 <= 1727)
    {
      if (v13 <= 900)
      {
        if (v13 == 430)
        {
          id v26 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          v16 = v26;
          BOOL v14 = v26 != 0LL;
          if (v26)
          {
            [v26 setSignpostId:a6];
            -[GEOToolServer pingWithMessage:](self, "pingWithMessage:", v16);
            goto LABEL_39;
          }

          goto LABEL_40;
        }

        if (v13 == 674)
        {
          id v19 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          v16 = v19;
          BOOL v14 = v19 != 0LL;
          if (v19)
          {
            [v19 setSignpostId:a6];
            -[GEOToolServer lockDBsWithMessage:](self, "lockDBsWithMessage:", v16);
            goto LABEL_39;
          }

          goto LABEL_40;
        }
      }

      else
      {
        switch(v13)
        {
          case 901:
            id v22 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
            v16 = v22;
            BOOL v14 = v22 != 0LL;
            if (v22)
            {
              [v22 setSignpostId:a6];
              -[GEOToolServer unlockDBsWithMessage:](self, "unlockDBsWithMessage:", v16);
              goto LABEL_39;
            }

            goto LABEL_40;
          case 1029:
            id v23 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
            v16 = v23;
            BOOL v14 = v23 != 0LL;
            if (v23)
            {
              [v23 setSignpostId:a6];
              -[GEOToolServer getDefaultWithMessage:](self, "getDefaultWithMessage:", v16);
              goto LABEL_39;
            }

            goto LABEL_40;
          case 1340:
            id v17 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
            v16 = v17;
            BOOL v14 = v17 != 0LL;
            if (v17)
            {
              [v17 setSignpostId:a6];
              -[GEOToolServer listFilePathsWithMessage:](self, "listFilePathsWithMessage:", v16);
              goto LABEL_39;
            }

- (void)pingWithMessage:(id)a3
{
}

- (void)unlockDBsWithMessage:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:GEOUnlockSQLiteDBNotificationName object:self];

  [v5 sendReply:0];
}

- (void)lockDBsWithMessage:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:GEOLockSQLiteDBNotificationName object:self];

  [v5 sendReply:0];
}

- (void)forceProactiveTileDownloaderRunWithMessage:(id)a3
{
}

- (void)checkProactiveTileDownloadPolicyEnabledWithMessage:(id)a3
{
  v6 = @"enabled";
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  v7 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  [v3 sendReply:v5];
}

- (void)getDefaultWithMessage:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"key"]);

  uint64_t v11 = 0LL;
  uint64_t v6 = GEOGetDefaultWithSource(v5, 0LL, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v12[0] = @"value";
  v8 = v7;
  if (!v7) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v12[1] = @"source";
  v13[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
  v13[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));

  if (!v7) {
  [v3 sendReply:v10];
  }
}

- (void)calculatePurgableSpaceWithMessage:(id)a3
{
  id v3 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001D750;
  block[3] = &unk_100059190;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

- (void)freePurgableSpaceWithMessage:(id)a3
{
  id v3 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001D96C;
  block[3] = &unk_100059190;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

- (void)invalidateTileCacheWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___GEOTileEditionUpdate);
  [v4 setInvalidateEverything:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v6 = GEOTileEditionUpdateNotification;
  uint64_t v8 = GEOTileEditionUpdateKey;
  id v9 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  [v5 postNotificationName:v6 object:0 userInfo:v7];

  [v3 sendReply:0];
}

- (void)listFilePathsWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GEOFilePaths dictionaryRepresentation](&OBJC_CLASS___GEOFilePaths, "dictionaryRepresentation"));
  [v3 sendReply:v4];
}

- (void)notifyNetworkDefaultsChangedWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths urlFor:](&OBJC_CLASS___GEOFilePaths, "urlFor:", 21LL));
  id v15 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v4,  1LL,  &v15));
  id v6 = v15;
  if (v5)
  {
    id v14 = 0LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  &v14));
    id v8 = v14;

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
    id v11 = 0LL;
    if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0) {
      id v11 = v7;
    }

    id v6 = v8;
  }

  else
  {
    id v11 = 0LL;
  }

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GEONetworkDefaults sharedNetworkDefaults]( &OBJC_CLASS___GEONetworkDefaults,  "sharedNetworkDefaults"));
    [v12 serverProxy:0 networkDefaultsDidChange:v11];

    notify_post("com.apple.GeoServices.internal.networkDefaultsChanged");
    int v13 = &off_10005E8F0;
  }

  else
  {
    int v13 = &off_10005E918;
  }

  [v3 sendReply:v13];
}

@end