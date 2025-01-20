@interface AFSetSettingsRequest
- (void)_ad_handleSettingsRequestWithCompletionHandler:(id)a3;
@end

@implementation AFSetSettingsRequest

- (void)_ad_handleSettingsRequestWithCompletionHandler:(id)a3
{
  v29 = (void (**)(id, void *, void))a3;
  v30 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AFSetSettingsRequest settings](self, "settings"));
  v5 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        id v12 = [v11 type];
        sub_100107638((uint64_t)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = objc_alloc(&OBJC_CLASS___STSettingChange);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
        v17 = -[STSettingChange initWithSettingType:valueBeforeUpdate:valueAfterUpdate:]( v15,  "initWithSettingType:valueBeforeUpdate:valueAfterUpdate:",  v12,  v14,  v16);

        -[NSMutableArray addObject:](v5, "addObject:", v17);
      }

      id v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }

    while (v8);
  }

  if (-[AFSetSettingsRequest applyChanges](v30, "applyChanges"))
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    v18 = v5;
    id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (j = 0LL; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 valueAfterUpdate]);
          id v25 = [v24 BOOLValue];

          id v26 = [v23 settingType];
          if (v26 == (id)2)
          {
            _AXSVoiceOverTouchSetEnabled(v25);
          }

          else
          {
            if (v26 != (id)1) {
              objc_exception_throw(  -[NSException initWithName:reason:userInfo:]( objc_alloc(&OBJC_CLASS___NSException),  "initWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Unable to set setting with type \"Unknown\"",  &__NSDictionary0__struct));
            }
            id v27 = objc_alloc_init(&OBJC_CLASS___RadiosPreferences);
            [v27 setAirplaneMode:v25];
          }
        }

        id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
      }

      while (v20);
    }
  }

  if (v29)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( -[AFSetSettingsRequest createResponseWithSettingChanges:]( v30,  "createResponseWithSettingChanges:",  v5));
    v29[2](v29, v28, 0LL);
  }
}

@end