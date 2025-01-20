@interface DELowMemoryExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DELowMemoryExtension

- (id)attachmentList
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @".*(ExcResource|JetsamEvent|LowMemory).*",  1LL,  0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[DELowMemoryExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v4,  v3,  0LL));

  return v5;
}

- (id)attachmentsForParameters:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DELowMemoryExtension attachmentList](self, "attachmentList", a3));
  id v4 = [v3 mutableCopy];
  v5 = -[NSDate initWithTimeIntervalSinceNow:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceNow:",  -1800.0);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modificationDate", (void)v16));
        id v13 = [v12 compare:v5];

        if (v13 == (id)-1LL) {
          [v4 removeObject:v11];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  id v14 = [v4 copy];
  return v14;
}

@end