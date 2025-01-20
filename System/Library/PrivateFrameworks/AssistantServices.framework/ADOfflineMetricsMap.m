@interface ADOfflineMetricsMap
- (ADOfflineMetricsMap)initWithPath:(id)a3;
- (id)_offlineIdentifiers;
- (void)deleteAllMetrics;
- (void)deleteMetricsWithOfflineIdentifier:(id)a3;
- (void)fetchNextMetricsUsingBlock:(id)a3;
- (void)insertMetrics:(id)a3 withOfflineIdentifier:(id)a4;
@end

@implementation ADOfflineMetricsMap

- (ADOfflineMetricsMap)initWithPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADOfflineMetricsMap;
  v5 = -[ADOfflineMetricsMap init](&v9, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 stringByStandardizingPath]);
    path = v5->_path;
    v5->_path = (NSString *)v6;
  }

  return v5;
}

- (void)fetchNextMetricsUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADOfflineMetricsMap _offlineIdentifiers](self, "_offlineIdentifiers"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

    if (!v6)
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
LABEL_24:

      goto LABEL_25;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    path = self->_path;
    objc_super v9 = sub_100248DE4(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](path, "stringByAppendingPathComponent:", v10));

    if (([v7 fileExistsAtPath:v11] & 1) == 0)
    {
      v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "-[ADOfflineMetricsMap fetchNextMetricsUsingBlock:]";
        __int16 v33 = 2112;
        v34 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Unable to find offline metrics plist path at path %@.",  buf,  0x16u);
      }

      offlineIdentifiers = self->_offlineIdentifiers;
      self->_offlineIdentifiers = 0LL;

      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
      goto LABEL_23;
    }

    v12 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v11);
    if (!v12)
    {
      v18 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "-[ADOfflineMetricsMap fetchNextMetricsUsingBlock:]";
        __int16 v33 = 2112;
        v34 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Unable to read offline metrics plist file at path %@.",  buf,  0x16u);
      }

      [v7 removeItemAtPath:v11 error:0];
      v19 = self->_offlineIdentifiers;
      self->_offlineIdentifiers = 0LL;

      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
      goto LABEL_22;
    }

    id v30 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v12,  0LL,  0LL,  &v30));
    id v14 = v30;
    if (v14)
    {
      v15 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v32 = "-[ADOfflineMetricsMap fetchNextMetricsUsingBlock:]";
        __int16 v33 = 2112;
        v34 = v11;
        __int16 v35 = 2112;
        id v36 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Unable to initialize offline metrics plist from file at path %@ due to error %@",  buf,  0x20u);
      }
    }

    else
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v13, v20) & 1) != 0)
      {
        v21 = -[SAMetrics initWithDictionary:](objc_alloc(&OBJC_CLASS___SAMetrics), "initWithDictionary:", v13);
        if (v21)
        {
          (*((void (**)(id, SAMetrics *, void *))v4 + 2))(v4, v21, v6);
        }

        else
        {
          v24 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v32 = "-[ADOfflineMetricsMap fetchNextMetricsUsingBlock:]";
            __int16 v33 = 2112;
            v34 = v13;
            _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Unable to create SAMetrics object from offline metrics plist %@.",  buf,  0x16u);
          }

          [v7 removeItemAtPath:v11 error:0];
          v25 = self->_offlineIdentifiers;
          self->_offlineIdentifiers = 0LL;

          (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
        }

        goto LABEL_21;
      }

      v22 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v26 = v22;
        v27 = (objc_class *)objc_opt_class(v13);
        v28 = NSStringFromClass(v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)buf = 136315394;
        v32 = "-[ADOfflineMetricsMap fetchNextMetricsUsingBlock:]";
        __int16 v33 = 2112;
        v34 = v29;
        _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s Unexpected type of initialized offline metrics plist %@.",  buf,  0x16u);
      }
    }

    [v7 removeItemAtPath:v11 error:0];
    v23 = self->_offlineIdentifiers;
    self->_offlineIdentifiers = 0LL;

    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
LABEL_21:

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }

- (void)insertMetrics:(id)a3 withOfflineIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___SAMetrics);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  if (v7 && (isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    char v54 = 0;
    if ([v10 fileExistsAtPath:self->_path isDirectory:&v54])
    {
      if (v54)
      {
        v11 = 0LL;
        goto LABEL_7;
      }

      path = self->_path;
      id v53 = 0LL;
      unsigned int v31 = [v10 removeItemAtPath:path error:&v53];
      v32 = (NSString *)v53;
      __int16 v33 = v32;
      if (!v31)
      {
        v44 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          v47 = self->_path;
          *(_DWORD *)buf = 136315650;
          v56 = "-[ADOfflineMetricsMap insertMetrics:withOfflineIdentifier:]";
          __int16 v57 = 2112;
          v58 = v47;
          __int16 v59 = 2112;
          v60 = v33;
          _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%s Unable to remove file at path %@ due to error %@.",  buf,  0x20u);
        }

        v11 = v33;
        goto LABEL_34;
      }

      v34 = self->_path;
      v52 = v32;
      unsigned __int8 v35 = [v10 createDirectoryAtPath:v34 withIntermediateDirectories:1 attributes:0 error:&v52];
      v11 = v52;

      if ((v35 & 1) == 0)
      {
        v28 = (os_log_s *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        goto LABEL_14;
      }
    }

    else
    {
      v12 = self->_path;
      id v51 = 0LL;
      unsigned __int8 v13 = [v10 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v51];
      v11 = (NSString *)v51;
      if ((v13 & 1) == 0)
      {
        v28 = (os_log_s *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
LABEL_34:

          goto LABEL_35;
        }

- (void)deleteMetricsWithOfflineIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    path = self->_path;
    uint64_t v8 = sub_100248DE4(v4);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](path, "stringByAppendingPathComponent:", v9));

    if ([v6 fileExistsAtPath:v10])
    {
      id v20 = 0LL;
      unsigned __int8 v11 = [v6 removeItemAtPath:v10 error:&v20];
      id v12 = v20;
      id v13 = v12;
      if ((v11 & 1) == 0)
      {
        v18 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v22 = "-[ADOfflineMetricsMap deleteMetricsWithOfflineIdentifier:]";
          __int16 v23 = 2112;
          id v24 = v10;
          __int16 v25 = 2112;
          id v26 = v13;
          _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Unable to remove metrics plist file at path %@ due to error %@.",  buf,  0x20u);
        }

        offlineIdentifiers = self->_offlineIdentifiers;
        self->_offlineIdentifiers = 0LL;

        goto LABEL_11;
      }
    }

    id v14 = self->_offlineIdentifiers;
    if (!v14)
    {
LABEL_12:

      goto LABEL_13;
    }

    id v13 = -[NSOrderedSet mutableCopy](v14, "mutableCopy");
    [v13 removeObject:v4];
    v15 = (NSOrderedSet *)[v13 copy];
    v16 = self->_offlineIdentifiers;
    self->_offlineIdentifiers = v15;

    v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[ADOfflineMetricsMap deleteMetricsWithOfflineIdentifier:]";
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s offlineIdentifiers -= %@", buf, 0x16u);
    }

- (void)deleteAllMetrics
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  path = self->_path;
  id v10 = 0LL;
  unsigned __int8 v5 = [v3 removeItemAtPath:path error:&v10];
  id v6 = (NSOrderedSet *)v10;
  offlineIdentifiers = v6;
  if ((v5 & 1) != 0)
  {

LABEL_4:
    offlineIdentifiers = self->_offlineIdentifiers;
    self->_offlineIdentifiers = 0LL;
    goto LABEL_7;
  }

  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    objc_super v9 = self->_path;
    *(_DWORD *)buf = 136315650;
    id v12 = "-[ADOfflineMetricsMap deleteAllMetrics]";
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    v16 = offlineIdentifiers;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Unable to remove directory at path %@ due to error %@.",  buf,  0x20u);
  }

- (id)_offlineIdentifiers
{
  v2 = self;
  offlineIdentifiers = self->_offlineIdentifiers;
  if (!offlineIdentifiers)
  {
    id v4 = v2->_path;
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    char v54 = 0;
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      id v7 = 0LL;
    }

    else
    {
      id v53 = 0LL;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtPath:v4 error:&v53]);
      objc_super v9 = (NSOrderedSet *)v53;
      if (v9)
      {
        id v10 = v9;
        unsigned __int8 v11 = (os_log_s *)AFSiriLogContextAnalytics;
        if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int16 v59 = 136315394;
          v60 = "_ADOfflineMetricsMapGetOfflineIdentifiers";
          __int16 v61 = 2112;
          v62 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s %@", v59, 0x16u);
        }

        id v7 = 0LL;
      }

      else
      {
        v42 = v5;
        v43 = v4;
        id v12 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v8 count]);
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        v39 = v8;
        id obj = v8;
        id v13 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
        v40 = v2;
        if (v13)
        {
          id v14 = v13;
          id v10 = 0LL;
          uint64_t v15 = *(void *)v50;
          do
          {
            v16 = 0LL;
            v17 = v10;
            do
            {
              if (*(void *)v50 != v15) {
                objc_enumerationMutation(obj);
              }
              id v18 = *(id *)(*((void *)&v49 + 1) + 8LL * (void)v16);
              v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pathExtension]);
              else {
                id v20 = 0LL;
              }

              if (v20)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v43, "stringByAppendingPathComponent:", v18));
                v48 = v17;
                v22 = (void *)objc_claimAutoreleasedReturnValue([v42 attributesOfItemAtPath:v21 error:&v48]);
                id v10 = v48;

                if (v10)
                {
                  __int16 v23 = (os_log_s *)AFSiriLogContextAnalytics;
                  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v56 = "_ADOfflineMetricsMapGetOfflineIdentifiers";
                    __int16 v57 = 2112;
                    v58 = v10;
                    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
                  }
                }

                else
                {
                  id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:NSFileCreationDate]);
                  if (v24)
                  {
                    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v20, v24);
                  }

                  else
                  {
                    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v20, v25);
                  }
                }

                v17 = v10;
              }

              else
              {
                id v10 = v17;
              }

              v16 = (char *)v16 + 1;
            }

            while (v14 != v16);
            id v14 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
          }

          while (v14);
        }

        else
        {
          id v10 = 0LL;
        }

        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v12, "allKeys"));
        uint32_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 sortedArrayUsingSelector:"compare:"]);

        v28 = -[NSMutableOrderedSet initWithCapacity:]( [NSMutableOrderedSet alloc],  "initWithCapacity:",  [obj count]);
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        id v29 = v27;
        id v30 = [v29 countByEnumeratingWithState:&v44 objects:buf count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v45;
          do
          {
            for (i = 0LL; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v45 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v12,  "objectForKey:",  *(void *)(*((void *)&v44 + 1) + 8LL * (void)i),  v39));
              if (v34) {
                -[NSMutableOrderedSet addObject:](v28, "addObject:", v34);
              }
            }

            id v31 = [v29 countByEnumeratingWithState:&v44 objects:buf count:16];
          }

          while (v31);
        }

        id v7 = (NSOrderedSet *)-[NSMutableOrderedSet copy](v28, "copy");
        uint64_t v8 = v39;
        v2 = v40;
        unsigned __int8 v5 = v42;
        id v4 = v43;
      }
    }

    unsigned __int8 v35 = v2->_offlineIdentifiers;
    v2->_offlineIdentifiers = v7;

    unsigned __int8 v36 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v37 = v2->_offlineIdentifiers;
      *(_DWORD *)__int16 v59 = 136315394;
      v60 = "-[ADOfflineMetricsMap _offlineIdentifiers]";
      __int16 v61 = 2112;
      v62 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s offlineIdentifiers = %@", v59, 0x16u);
    }

    offlineIdentifiers = v2->_offlineIdentifiers;
  }

  return offlineIdentifiers;
}

- (void).cxx_destruct
{
}

@end