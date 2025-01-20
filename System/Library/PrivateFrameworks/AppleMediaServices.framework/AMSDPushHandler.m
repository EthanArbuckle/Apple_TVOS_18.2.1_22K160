@interface AMSDPushHandler
- (id)enabledParsables;
@end

@implementation AMSDPushHandler

- (id)enabledParsables
{
  v27[0] = @"24";
  v28[0] = objc_opt_class(&OBJC_CLASS___AMSDPushParsablePrivacyAcknowledgementUpdated, a2);
  v27[1] = @"26";
  v28[1] = objc_opt_class(&OBJC_CLASS___AMSDPushParsableAccountFlagsUpdated, v3);
  v27[2] = AMSPushActionTypeFetchDataCache;
  v28[2] = objc_opt_class(&OBJC_CLASS___AMSDPushParsableFetchDataCache, v4);
  v27[3] = AMSPushActionTypeDismissQRDialog;
  v28[3] = objc_opt_class(&OBJC_CLASS___AMSDPushParsableDismissQRDialog, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  4LL));
  id v7 = [v6 mutableCopy];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushHandler configuration](self, "configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 enabledActionTypes]);

  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v11 = v9;
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
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
          if ([v7 objectForKeyedSubscript:v16]) {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  [v7 objectForKeyedSubscript:v16],  v16);
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v13);
    }
  }

  else
  {
    v10 = (NSMutableDictionary *)[v7 mutableCopy];
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___AMSDPushHandler;
  id v17 = -[AMSDPushHandler enabledParsables](&v21, "enabledParsables");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ams_dictionaryByAddingEntriesFromDictionary:", v10));

  return v19;
}

@end