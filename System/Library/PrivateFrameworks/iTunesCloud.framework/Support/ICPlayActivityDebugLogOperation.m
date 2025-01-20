@interface ICPlayActivityDebugLogOperation
- (NSArray)playActivityEvents;
- (void)main;
- (void)setPlayActivityEvents:(id)a3;
@end

@implementation ICPlayActivityDebugLogOperation

- (void)main
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICPlayActivityDebugLogOperation playActivityEvents](self, "playActivityEvents"));
  if ([v2 count])
  {
    v3 = NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"com.apple.PlayActivityFeed"]);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v19 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];
    v20 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"PlayActivityEvents.log"]);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSOutputStream outputStreamToFileAtPath:append:]( &OBJC_CLASS___NSOutputStream,  "outputStreamToFileAtPath:append:"));
    [v6 open];
    id v21 = (id)objc_claimAutoreleasedReturnValue([@"\n-----------------------------------------\n" dataUsingEncoding:4]);
    v7 = objc_alloc_init(&OBJC_CLASS___ICPlayActivityFeedSerialization);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentityStore defaultIdentityStore]( &OBJC_CLASS___ICUserIdentityStore,  "defaultIdentityStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localStoreAccountProperties]);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 storefrontIdentifier]);
    -[ICPlayActivityFeedSerialization setCurrentStoreFrontID:](v7, "setCurrentStoreFrontID:", v10);

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v11 = v2;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue( -[ICPlayActivityFeedSerialization propertyListObjectWithPlayActivityEvent:]( v7,  "propertyListObjectWithPlayActivityEvent:",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)i)));
          if (v16
            && +[NSPropertyListSerialization writePropertyList:toStream:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "writePropertyList:toStream:format:options:error:",  v16,  v6,  100LL,  0LL,  0LL) >= 1)
          {
            id v17 = v21;
            objc_msgSend(v6, "write:maxLength:", objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v13);
    }

    [v6 close];
  }
}

- (NSArray)playActivityEvents
{
  return (NSArray *)self->super._private;
}

- (void)setPlayActivityEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end