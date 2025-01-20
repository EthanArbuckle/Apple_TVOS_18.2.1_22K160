@interface SAAppSubscriptions
- (id)_pssSiriSync_anchorValue;
@end

@implementation SAAppSubscriptions

- (id)_pssSiriSync_anchorValue
{
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppSubscriptions activeSubscriptions](self, "activeSubscriptions"));
  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleId]);
        v10 = v9;
        if (v9)
        {
          v11 = (const char *)[v9 UTF8String];
          if (v11)
          {
            v12 = v11;
            CC_LONG v13 = strlen(v11);
            CC_SHA1_Update(&c, v12, v13);
          }
        }

        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subscriptionTiers", 0));
        id v15 = [v14 countByEnumeratingWithState:&v24 objects:v36 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (j = 0LL; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)j);
              if (v19)
              {
                v20 = (const char *)[v19 UTF8String];
                if (v20)
                {
                  v21 = v20;
                  CC_LONG v22 = strlen(v20);
                  CC_SHA1_Update(&c, v21, v22);
                }
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v24 objects:v36 count:16];
          }

          while (v16);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }

    while (v5);
  }

  *(void *)md = 0LL;
  uint64_t v34 = 0LL;
  int v35 = 0;
  CC_SHA1_Final(md, &c);
  return (id)objc_claimAutoreleasedReturnValue( +[NSString hexStringFromBytes:length:]( &OBJC_CLASS___NSString,  "hexStringFromBytes:length:",  md,  20LL));
}

@end