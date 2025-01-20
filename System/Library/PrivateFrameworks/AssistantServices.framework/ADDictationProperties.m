@interface ADDictationProperties
- (BOOL)_getIsAutoPunctuationEnabled;
- (BOOL)_getIsDictationEnabled;
- (id)_getEnabledDictationLocales;
- (id)getODDDictationProperties;
@end

@implementation ADDictationProperties

- (id)getODDDictationProperties
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    v8 = "-[ADDictationProperties getODDDictationProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v7, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDDictationProperties);
  objc_msgSend( v4,  "setIsDictationEnabled:",  -[ADDictationProperties _getIsDictationEnabled](self, "_getIsDictationEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADDictationProperties _getEnabledDictationLocales](self, "_getEnabledDictationLocales"));
  [v4 setEnabledDictationLocales:v5];

  objc_msgSend( v4,  "setIsAutoPunctuationEnabled:",  -[ADDictationProperties _getIsAutoPunctuationEnabled](self, "_getIsAutoPunctuationEnabled"));
  return v4;
}

- (BOOL)_getIsDictationEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 dictationIsEnabled];

  return v3;
}

- (id)_getEnabledDictationLocales
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 enabledDictationLocales]);

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys", 0));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v10]);
        unsigned int v12 = [v11 BOOLValue];

        if (v12)
        {
          id v13 = objc_alloc_init(&OBJC_CLASS___SISchemaLocaleIdentifier);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@"_"]);
          if ([v14 count] == (id)2)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
            [v13 setLanguageCode:v15];

            v16 = (void *)objc_claimAutoreleasedReturnValue([v14 lastObject]);
            [v13 setCountryCode:v16];
          }

          -[NSMutableArray addObject:](v4, "addObject:", v13);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  return v4;
}

- (BOOL)_getIsAutoPunctuationEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 dictationAutoPunctuationEnabled];

  return v3;
}

@end