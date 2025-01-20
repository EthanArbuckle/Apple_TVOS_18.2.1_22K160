@interface SRFullScreenEffects
- (id)_fullscreenEffectMap;
- (id)effectForAceObject:(id)a3;
@end

@implementation SRFullScreenEffects

- (id)effectForAceObject:(id)a3
{
  return 0LL;
}

- (id)_fullscreenEffectMap
{
  fullscreenEffectMapInternal = self->_fullscreenEffectMapInternal;
  if (!fullscreenEffectMapInternal)
  {
    v18 = self;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/System/Library/Messages/iMessageEffects"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 enumeratorAtURL:v6 includingPropertiesForKeys:0 options:7 errorHandler:&stru_1000BA238]);

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = -[NSBundle initWithURL:]( objc_alloc(&OBJC_CLASS___NSBundle),  "initWithURL:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle bundleIdentifier](v13, "bundleIdentifier"));
          if (v14)
          {
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v13, v14);
          }

          else
          {
            v15 = (os_log_s *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v24 = "-[SRFullScreenEffects _fullscreenEffectMap]";
              __int16 v25 = 2112;
              v26 = v13;
              _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Failed to get bundle identifier for %@",  buf,  0x16u);
            }
          }

          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }

      while (v10);
    }

    v16 = v18->_fullscreenEffectMapInternal;
    v18->_fullscreenEffectMapInternal = &v4->super;

    fullscreenEffectMapInternal = v18->_fullscreenEffectMapInternal;
  }

  return fullscreenEffectMapInternal;
}

- (void).cxx_destruct
{
}

@end