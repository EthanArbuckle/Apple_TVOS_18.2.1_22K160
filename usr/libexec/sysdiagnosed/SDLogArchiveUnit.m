@interface SDLogArchiveUnit
+ (id)logArchiveUnitWithDictionary:(id)a3;
- (NSMutableDictionary)archive_arguments;
- (void)logArchiveOverride:(id)a3;
- (void)setArchive_arguments:(id)a3;
@end

@implementation SDLogArchiveUnit

+ (id)logArchiveUnitWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SDLogArchiveUnit;
  id v5 = objc_msgSend(objc_msgSendSuper2(&v9, "alloc"), "init");
  v6 = v5;
  if (v4 && v5)
  {
    id v7 = [v4 mutableCopy];
    objc_msgSend(v6, "setArchive_arguments:", v7);
  }

  return v6;
}

- (void)logArchiveOverride:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveUnit archive_arguments](self, "archive_arguments"));

  if (v5)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v19 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveUnit archive_arguments](self, "archive_arguments"));
          v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v11]);
          [v12 setValue:v13 forKey:v11];

          v14 = sub_1000241E4();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v11]);
            *(_DWORD *)buf = 138412546;
            uint64_t v25 = v11;
            __int16 v26 = 2112;
            v27 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updated %@ to %@", buf, 0x16u);
          }

          v17 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v11]);
          [v17 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Updated %@ to %@", v11, v18 category msg];
        }

        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }

      while (v8);
    }

    id v4 = v19;
  }
}

- (NSMutableDictionary)archive_arguments
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setArchive_arguments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end