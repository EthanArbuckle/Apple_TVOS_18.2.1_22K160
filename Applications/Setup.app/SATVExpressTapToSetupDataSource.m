@interface SATVExpressTapToSetupDataSource
- (NSArray)items;
- (NSString)deviceClass;
- (NSString)deviceName;
- (SATVExpressTapToSetupDataSource)initWithTapToSetupDeviceInfo:(id)a3 expressTapToSetupItemProviderClasses:(id)a4;
- (TVSKTapToSetupDeviceInfo)tapToSetupDeviceInfo;
- (id)itemAtIndex:(unint64_t)a3;
- (unint64_t)itemTypes;
- (void)_updateItemsWithTapToSetupDeviceInfo:(id)a3 expressTapToSetupItemProviderClasses:(id)a4;
- (void)setItems:(id)a3;
@end

@implementation SATVExpressTapToSetupDataSource

- (SATVExpressTapToSetupDataSource)initWithTapToSetupDeviceInfo:(id)a3 expressTapToSetupItemProviderClasses:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SATVExpressTapToSetupDataSource;
  v9 = -[SATVExpressTapToSetupDataSource init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tapToSetupDeviceInfo, a3);
    -[SATVExpressTapToSetupDataSource _updateItemsWithTapToSetupDeviceInfo:expressTapToSetupItemProviderClasses:]( v10,  "_updateItemsWithTapToSetupDeviceInfo:expressTapToSetupItemProviderClasses:",  v10->_tapToSetupDeviceInfo,  v8);
  }

  return v10;
}

- (NSString)deviceName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupDataSource tapToSetupDeviceInfo](self, "tapToSetupDeviceInfo"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 deviceName]);
  v4 = v3;
  if (!v3) {
    v3 = &stru_1000CB560;
  }
  v5 = v3;

  return v5;
}

- (NSString)deviceClass
{
  if (!self->_deviceClass)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupDataSource tapToSetupDeviceInfo](self, "tapToSetupDeviceInfo"));
    unsigned int v4 = [v3 deviceClass];

    v5 = @"EXPRESS_SETUP_DEVICE_CLASS_IPHONE";
    if (v4 == 3) {
      v5 = @"EXPRESS_SETUP_DEVICE_CLASS_IPAD";
    }
    if (v4 == 2) {
      v6 = @"EXPRESS_SETUP_DEVICE_CLASS_IPOD";
    }
    else {
      v6 = (__CFString *)v5;
    }
    id v7 = sub_10000D7CC(v6, @"Localizable");
    id v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
    deviceClass = self->_deviceClass;
    self->_deviceClass = v8;
  }

  return self->_deviceClass;
}

- (id)itemAtIndex:(unint64_t)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupDataSource items](self, "items"));
  else {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a3]);
  }

  return v5;
}

- (unint64_t)itemTypes
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupDataSource items](self, "items", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * (void)i) types];
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (void)_updateItemsWithTapToSetupDeviceInfo:(id)a3 expressTapToSetupItemProviderClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceName]);
  if ([v8 length])
  {
    unsigned int v9 = [v6 deviceClass];

    if (v9 != -1)
    {
      v26 = self;
      __int128 v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v12 = v7;
      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue([v17 expressTapToSetupItemWithTapToSetupDeviceInfo:v6]);
            v19 = (void *)objc_claimAutoreleasedReturnValue([v17 stableIdentifier]);
            -[NSMutableDictionary bs_setSafeObject:forKey:](v11, "bs_setSafeObject:forKey:", v18, v19);

            -[NSMutableArray bs_safeAddObject:](v10, "bs_safeAddObject:", v18);
          }

          id v14 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }

        while (v14);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue( +[SATVSiriAndDictationStep stableIdentifier]( &OBJC_CLASS___SATVSiriAndDictationStep,  "stableIdentifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", v20));

      v22 = (void *)objc_claimAutoreleasedReturnValue( +[SATVSiriAndDictationStep stableIdentifier]( &OBJC_CLASS___SATVSiriAndDictationStep,  "stableIdentifier"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", v22));

      if (!v21 && v23) {
        -[NSMutableArray removeObjectIdenticalTo:](v10, "removeObjectIdenticalTo:", v23);
      }
      -[SATVExpressTapToSetupDataSource setItems:](v26, "setItems:", v10);

      goto LABEL_18;
    }
  }

  else
  {
  }

  id v24 = sub_10002B0E4();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "No device name or class was found in the device info. No express setting items will be set.",  buf,  2u);
  }

  -[SATVExpressTapToSetupDataSource setItems:](self, "setItems:", &__NSArray0__struct);
LABEL_18:
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (TVSKTapToSetupDeviceInfo)tapToSetupDeviceInfo
{
  return self->_tapToSetupDeviceInfo;
}

- (void).cxx_destruct
{
}

@end