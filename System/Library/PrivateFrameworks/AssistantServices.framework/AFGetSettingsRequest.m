@interface AFGetSettingsRequest
- (void)_ad_handleSettingsRequestWithCompletionHandler:(id)a3;
@end

@implementation AFGetSettingsRequest

- (void)_ad_handleSettingsRequestWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AFGetSettingsRequest settings](self, "settings", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v10) integerValue];
          v12 = objc_alloc_init(&OBJC_CLASS___STSetting);
          -[STSetting setType:](v12, "setType:", v11);
          sub_100107638((uint64_t)v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          -[STSetting setValue:](v12, "setValue:", v14);

          -[NSMutableArray addObject:](v5, "addObject:", v12);
          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AFGetSettingsRequest createResponse](self, "createResponse"));
    [v15 setSettings:v5];
    v4[2](v4, v15, 0LL);
  }
}

@end