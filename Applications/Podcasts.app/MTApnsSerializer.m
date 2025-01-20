@interface MTApnsSerializer
+ (id)whitelistedClasses;
- (id)payload;
@end

@implementation MTApnsSerializer

- (id)payload
{
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer keys](self, "keys"));
  id v29 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(obj);
        }
        v4 = *(os_log_s **)(*((void *)&v32 + 1) + 8LL * (void)i);
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 processor]);

        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
        id v31 = 0LL;
        v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dataForSetTransaction:v7 key:v4 version:&v31]);
        id v9 = v31;

        if (v8)
        {
          id v11 = [(id)objc_opt_class(self) whitelistedClasses];
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          id v30 = 0LL;
          v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v12,  v8,  &v30));
          v14 = (os_log_s *)v30;

          if (v14 || !v13)
          {
            uint64_t v17 = _MTLogCategoryCloudSync(v15);
            v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Processor returned data for key %@ that isn't a valid archive. Skipping.",  buf,  0xCu);
            }

            if (v14)
            {
              uint64_t v20 = _MTLogCategoryCloudSync(v19);
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v37 = v14;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error = %@", buf, 0xCu);
              }
            }
          }

          else
          {
            [v26 setValue:v13 forKey:v4];
          }
        }

        else
        {
          uint64_t v16 = _MTLogCategoryCloudSync(v10);
          v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Processor returned nil data for key %@. Skipping.",  buf,  0xCu);
          }
        }
      }

      id v29 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }

    while (v29);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v26,  kMZKeyValueStorePlistFormatNetworkData,  0LL,  0LL));
  uint64_t v23 = _MTLogCategoryCloudSync(v22);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v37 = (os_log_s *)v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "APNS subscription payload: %@", buf, 0xCu);
  }

  return v22;
}

+ (id)whitelistedClasses
{
  if (qword_1002B6B28 != -1) {
    dispatch_once(&qword_1002B6B28, &stru_1002441D0);
  }
  return (id)qword_1002B6B30;
}

@end