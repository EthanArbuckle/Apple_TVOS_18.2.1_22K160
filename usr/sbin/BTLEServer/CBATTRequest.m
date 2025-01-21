@interface CBATTRequest
+ (id)consolidatedDataForRequests:(id)a3;
@end

@implementation CBATTRequest

+ (id)consolidatedDataForRequests:(id)a3
{
  id v3 = a3;
  v4 = [NSMutableData data];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = objc_msgSend(v10, "offset", (void)v14);
        if (v11 != [v4 length])
        {

          v4 = 0LL;
          goto LABEL_11;
        }

        v12 = (void *)[v10 value];
        [v4 appendData:v12];
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

@end