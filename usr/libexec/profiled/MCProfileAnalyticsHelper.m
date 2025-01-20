@interface MCProfileAnalyticsHelper
+ (id)_containsPayloadsDictionary;
+ (id)_getBoolDictionaryFromKeySet:(id)a3;
+ (void)addContainsPayloadInfoWithProfile:(id)a3 eventPayload:(id)a4;
@end

@implementation MCProfileAnalyticsHelper

+ (void)addContainsPayloadInfoWithProfile:(id)a3 eventPayload:(id)a4
{
  id v5 = a3;
  id v19 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileAnalyticsHelper _containsPayloadsDictionary]( &OBJC_CLASS___MCProfileAnalyticsHelper,  "_containsPayloadsDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileAnalyticsHelper _getBoolDictionaryFromKeySet:]( &OBJC_CLASS___MCProfileAnalyticsHelper,  "_getBoolDictionaryFromKeySet:",  v8));

  [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"profile_containsPayload_other"];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v20 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 payloads]);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)v14) type]);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v15]);

        if (!v16
          || (v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v16]),
              v17,
              v18 = v16,
              !v17))
        {
          v18 = @"profile_containsPayload_other";
        }

        [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:v18];

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v12);
  }

  [v19 addEntriesFromDictionary:v9];
}

+ (id)_containsPayloadsDictionary
{
  if (qword_1000DC1E8 != -1) {
    dispatch_once(&qword_1000DC1E8, &stru_1000C3E38);
  }
  return (id)qword_1000DC1E0;
}

+ (id)_getBoolDictionaryFromKeySet:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v9),  (void)v11);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  return v4;
}

@end