@interface MigratorConfigurationStore
- (MigratorConfigurationStore)init;
@end

@implementation MigratorConfigurationStore

- (MigratorConfigurationStore)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MigratorConfigurationStore;
  v2 = -[MigratorConfigurationStore init](&v20, "init");
  if (v2)
  {
    CFPropertyListRef v3 = sub_1002FA9F4((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (v5 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    {
      id v7 = v5;
      v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          v13 = 0LL;
          do
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = sub_10023B704( (id *)objc_alloc(&OBJC_CLASS___MigratorConfiguration),  *(void **)(*((void *)&v21 + 1) + 8LL * (void)v13));
            v15 = v14;
            if (v14)
            {
              id v16 = v14[1];
              -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v15, v16);
            }

            v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }

        while (v11);
      }

      configuration = v2->_configuration;
      v2->_configuration = v8;
    }

    else
    {
      v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      configuration = v2->_configuration;
      v2->_configuration = v18;
    }
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end