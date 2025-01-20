@interface NEHelperAppTrackerManager
- (NEHelperAppTrackerManager)initWithFirstMessage:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperAppTrackerManager

- (NEHelperAppTrackerManager)initWithFirstMessage:(id)a3
{
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
  objc_opt_self(&OBJC_CLASS___NEHelperAppTrackerManager);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEHelperAppTrackerManager;
  v6 = -[NEHelperAppTrackerManager init](&v8, "init");

  return v6;
}

- (void)handleMessage:(id)a3
{
  id v3 = a3;
  char uint64 = xpc_dictionary_get_uint64(v3, "app-tracker-check");
  v5 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "app-tracker-signing-identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v7)
  {
    if ((uint64 & 1) != 0)
    {
      id v25 = 0LL;
      id v8 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v25];
      id v9 = v25;
      if (v9 || !v8)
      {
        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v3, 22LL, 0LL);

        goto LABEL_18;
      }

      uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 privacyTrackingDomains]);
      if (v10)
      {
        v11 = (void *)v10;
        xpc_object_t v12 = xpc_array_create(0LL, 0LL);
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v13 = v11;
        id v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v22;
          do
          {
            for (i = 0LL; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              xpc_array_set_string( v12,  0xFFFFFFFFFFFFFFFFLL,  (const char *)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)i), "UTF8String", (void)v21));
            }

            id v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
          }

          while (v15);
        }

        xpc_dictionary_set_value(v7, "app-tracker-domains", v12);
      }
    }

    v18 = v3;
    int64_t v19 = 0LL;
    v20 = v7;
  }

  else
  {
    v18 = v3;
    int64_t v19 = 22LL;
    v20 = 0LL;
  }

  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v18, v19, v20);
LABEL_18:
}

@end