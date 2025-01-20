@interface CTAppStoreSearchResult
+ (id)appStoreSearchResultsWithResultData:(id)a3 platform:(id)a4 error:(id *)a5;
- (CTAppStoreSearchResult)initWithBundleID:(id)a3 platform:(id)a4;
- (CTAppStoreSearchResult)initWithSearchResultRecord:(id)a3 platform:(id)a4;
- (NSArray)genreIDs;
- (NSString)bundleID;
- (NSString)platform;
- (id)description;
@end

@implementation CTAppStoreSearchResult

+ (id)appStoreSearchResultsWithResultData:(id)a3 platform:(id)a4 error:(id *)a5
{
  id v31 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  a5));
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000038A0((uint64_t)a5, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_31;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CTErrorDomain,  2002LL,  0LL));
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003A40();
    }
LABEL_31:
    v12 = 0LL;
    goto LABEL_38;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"results"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
  {
    v30 = v8;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v44 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "CTAppStoreSearchResult results: %{private}@",  buf,  0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    v29 = v10;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v17);
          uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
          {
            id v20 = [objc_alloc((Class)a1) initWithSearchResultRecord:v18 platform:v31];
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              id v44 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "CTAppStoreSearchResult searchResult: %{private}@",  buf,  0xCu);
            }

            if (v20)
            {
              [v12 addObject:v20];
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                sub_100003950(v40, (uint64_t)v20, &v41);
              }
            }

            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              sub_100003910(v38, v18, &v39);
            }
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_100003998(v36, v18, &v37);
          }

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }

      while (v15);
    }

    v10 = v29;
    v8 = v30;
  }

  else
  {
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CTErrorDomain,  2002LL,  0LL));
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000039D8();
    }
    v12 = 0LL;
  }

LABEL_38:
  return v12;
}

- (CTAppStoreSearchResult)initWithSearchResultRecord:(id)a3 platform:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bundleId"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"genreIds"]);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      uint64_t v26 = v10;
      id v27 = v7;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v30;
        while (2)
        {
          uint64_t v16 = 0LL;
          do
          {
            if (*(void *)v30 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v16);
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100003AA8();
              }

              uint64_t v24 = 0LL;
              goto LABEL_21;
            }

            uint64_t v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      v28.receiver = self;
      v28.super_class = (Class)&OBJC_CLASS___CTAppStoreSearchResult;
      uint64_t v19 = -[CTAppStoreSearchResult init](&v28, "init");
      id v20 = (NSString *)[v8 copy];
      bundleID = v19->_bundleID;
      v19->_bundleID = v20;

      uint64_t v22 = (NSArray *)[v12 copy];
      genreIDs = v19->_genreIDs;
      v19->_genreIDs = v22;

      objc_storeStrong((id *)&v19->_platform, a4);
      self = v19;
      uint64_t v24 = self;
LABEL_21:
      v10 = v26;
      id v7 = v27;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100003B10();
      }
      uint64_t v24 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003B78();
    }
    uint64_t v24 = 0LL;
  }

  return v24;
}

- (CTAppStoreSearchResult)initWithBundleID:(id)a3 platform:(id)a4
{
  id v6 = (NSString *)a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CTAppStoreSearchResult;
  id v7 = a3;
  v8 = -[CTAppStoreSearchResult init](&v14, "init");
  uint64_t v9 = (NSString *)objc_msgSend(v7, "copy", v14.receiver, v14.super_class);

  bundleID = v8->_bundleID;
  v8->_bundleID = v9;

  genreIDs = v8->_genreIDs;
  v8->_genreIDs = (NSArray *)&__NSArray0__struct;

  platform = v8->_platform;
  v8->_platform = v6;

  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@, %@",  self->_bundleID,  self->_genreIDs);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSArray)genreIDs
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end