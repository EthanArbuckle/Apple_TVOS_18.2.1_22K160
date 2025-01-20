@interface GEOAnalyticDataServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOAnalyticDataServer)initWithDaemon:(id)a3;
- (void)readNetEventDataWithMessage:(id)a3;
- (void)readReqRespMetadataWithMessage:(id)a3;
@end

@implementation GEOAnalyticDataServer

+ (id)identifier
{
  return @"analyticdata";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  if (v13 != 1919)
  {
    if (v13 != 1599)
    {
      BOOL v16 = 0;
      goto LABEL_13;
    }

    if (sub_100012B28(v12, v11, @"analyticdata", v10, &off_10005E880, 0LL))
    {
      id v14 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
      v15 = v14;
      BOOL v16 = v14 != 0LL;
      if (v14)
      {
        [v14 setSignpostId:a6];
        -[GEOAnalyticDataServer readNetEventDataWithMessage:](self, "readNetEventDataWithMessage:", v15);
LABEL_9:
        BOOL v16 = 1;
        goto LABEL_10;
      }

      goto LABEL_10;
    }

- (GEOAnalyticDataServer)initWithDaemon:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GEOAnalyticDataServer;
  return -[GEOAnalyticDataServer initWithDaemon:](&v4, "initWithDaemon:", a3);
}

- (void)readNetEventDataWithMessage:(id)a3
{
  id v10 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"day"]);

  if (!v4)
  {
    uint64_t v8 = -10LL;
LABEL_6:
    xpc_object_t empty = (xpc_object_t)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  empty,  @"err"));
    [v10 sendReply:v9];

    goto LABEL_7;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAnalyticsDataService sharedService](&OBJC_CLASS___GEOAnalyticsDataService, "sharedService"));
  int v6 = [v5 networkEventFileDescriptorForRepresentativeDate:v4];

  if (v6 < 0)
  {
    uint64_t v8 = -8LL;
    goto LABEL_6;
  }

  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_fd(empty, "fd", v6);
  [v10 sendReplyWithXPCUserInfo:empty];
  close(v6);
LABEL_7:
}

- (void)readReqRespMetadataWithMessage:(id)a3
{
  id v11 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"bid"]);

  if (!v4)
  {
    uint64_t v9 = -10LL;
LABEL_6:
    xpc_object_t empty = (xpc_object_t)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", v9));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  empty,  @"err"));
    [v11 sendReply:v10];

    goto LABEL_7;
  }

  id v5 = [v4 longLongValue];
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAnalyticsDataService sharedService](&OBJC_CLASS___GEOAnalyticsDataService, "sharedService"));
  int v7 = [v6 requestResponseMetadataFileDescriptorForBatchID:v5];

  if (v7 < 0)
  {
    uint64_t v9 = -8LL;
    goto LABEL_6;
  }

  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_fd(empty, "fd", v7);
  [v11 sendReplyWithXPCUserInfo:empty];
  close(v7);
LABEL_7:
}

@end