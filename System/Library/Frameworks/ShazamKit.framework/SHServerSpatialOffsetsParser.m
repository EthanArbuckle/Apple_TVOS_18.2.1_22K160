@interface SHServerSpatialOffsetsParser
+ (id)offsetsFromResponse:(id)a3;
@end

@implementation SHServerSpatialOffsetsParser

+ (id)offsetsFromResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sh_log_object(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Parsing spatial offsets from response %@",  buf,  0xCu);
  }

  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"offsets"]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        v13 = v9;
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v13);
          }
          v15 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"timeStampInMilliseconds"]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"offsetInMilliseconds"]);
          [v16 doubleValue];
          double v19 = v18 / 1000.0;
          [v17 doubleValue];
          id v21 = [[SHHapticSpatialOffset alloc] initWithTimestamp:v19 offset:v20 / 1000.0];
          [v8 addObject:v21];
        }

        id v9 = v13;
        id v11 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v11);
    }

    uint64_t v23 = sh_log_object(v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = [v8 count];
      *(_DWORD *)buf = 134217984;
      id v35 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Returning spatial offsets with count %ld",  buf,  0xCu);
    }

    id v26 = [v8 copy];
  }

  else
  {
    uint64_t v27 = sh_log_object(v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_INFO,  "No offset in response, returning empty spatial offsets",  buf,  2u);
    }

    id v26 = &__NSArray0__struct;
  }

  return v26;
}

@end