@interface NRLinkDirectorMessageManager
- (id)description;
@end

@implementation NRLinkDirectorMessageManager

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v20 = v3;
  if (self) {
    latestMessageDictionary = self->_latestMessageDictionary;
  }
  else {
    latestMessageDictionary = 0LL;
  }
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](latestMessageDictionary, "allKeys"));
  id v25 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v25)
  {
    uint64_t v22 = *(void *)v33;
    v23 = self;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v5;
        if (self) {
          v6 = self->_latestMessageDictionary;
        }
        else {
          v6 = 0LL;
        }
        uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:"));
        v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
        id v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v29;
          do
          {
            for (i = 0LL; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v29 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
              uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
              if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v14]);
                uint64_t v17 = objc_opt_class(&OBJC_CLASS___NRLinkDirectorMessageState);
                if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
                {
                  v18 = sub_100020934([v14 unsignedCharValue]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v16, v18);
                }
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }

          while (v11);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v8, v26);
        uint64_t v5 = v27 + 1;
        self = v23;
      }

      while ((id)(v27 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v25);
  }

  -[NSMutableString appendFormat:](v20, "appendFormat:", @"%@", v24);
  return v20;
}

- (void).cxx_destruct
{
}

@end