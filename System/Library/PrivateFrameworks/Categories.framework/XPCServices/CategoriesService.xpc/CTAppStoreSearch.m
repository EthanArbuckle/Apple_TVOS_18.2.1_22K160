@interface CTAppStoreSearch
+ (NSCache)resultByBundleID;
- (CTAppStoreSearch)initWithCallingProcess:(id)a3;
- (void)handleSearchResultsWithTaskData:(id)a3 platform:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)lookupAppWithBundleIDs:(id)a3 deviceFamily:(unint64_t)a4 completionHandler:(id)a5;
- (void)performiTunesQueryWithURLComponents:(id)a3 queryItems:(id)a4 deviceFamily:(unint64_t)a5 completionHandler:(id)a6;
@end

@implementation CTAppStoreSearch

- (CTAppStoreSearch)initWithCallingProcess:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CTAppStoreSearch;
  v6 = -[CTAppStoreSearch init](&v10, "init");
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.ctcategories.service", "appstorelookup");
    log = v6->_log;
    v6->_log = v7;

    objc_storeStrong((id *)&v6->_callingProcessBundleID, a3);
  }

  return v6;
}

+ (NSCache)resultByBundleID
{
  if (qword_10000CE38 != -1) {
    dispatch_once(&qword_10000CE38, &stru_100008530);
  }
  return (NSCache *)(id)qword_10000CE30;
}

- (void)lookupAppWithBundleIDs:(id)a3 deviceFamily:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v38 = a5;
  v40 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v39 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByString:@","]);
  id v10 = [v9 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v47;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
        id v15 = [(id)objc_opt_class(self) resultByBundleID];
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v14]);

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 platform]);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v18));
          v20 = v19;
          if (v19) {
            v21 = v19;
          }
          else {
            v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          }
          v22 = v21;

          -[NSMutableArray addObject:](v22, "addObject:", v17);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v22, v18);
        }

        else
        {
          -[NSMutableArray addObject:](v40, "addObject:", v14);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }

    while (v11);
  }

  id v23 = -[NSMutableArray count](v40, "count");
  BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v24)
    {
      callingProcessBundleID = self->_callingProcessBundleID;
      *(_DWORD *)buf = 138543618;
      v52 = callingProcessBundleID;
      __int16 v53 = 2114;
      v54 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Performing iTunes lookup on behalf of %{public}@: %{public}@",  buf,  0x16u);
    }

    v26 = -[NSURLComponents initWithString:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithString:",  @"https://itunes.apple.com/lookup");
    v27 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v40, "componentsJoinedByString:", @","));
    v29 = -[NSURLQueryItem initWithName:value:](v27, "initWithName:value:", @"bundleId", v28);

    v30 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 countryCode]);
    v33 = -[NSURLQueryItem initWithName:value:](v30, "initWithName:value:", @"country", v32);

    v50[0] = v29;
    v50[1] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 2LL));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100004318;
    v41[3] = &unk_1000085D0;
    v42 = v40;
    v43 = v8;
    v44 = self;
    v35 = v38;
    id v45 = v38;
    -[CTAppStoreSearch performiTunesQueryWithURLComponents:queryItems:deviceFamily:completionHandler:]( self,  "performiTunesQueryWithURLComponents:queryItems:deviceFamily:completionHandler:",  v26,  v34,  a4,  v41);

    v36 = v39;
  }

  else
  {
    v36 = v39;
    if (v24)
    {
      *(_DWORD *)buf = 138543362;
      v52 = (NSString *)v39;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Not performing iTunes lookup for cached bundle IDs: %{public}@",  buf,  0xCu);
    }

    v35 = v38;
    (*((void (**)(id, NSMutableDictionary *, void))v38 + 2))(v38, v8, 0LL);
  }
}

- (void)performiTunesQueryWithURLComponents:(id)a3 queryItems:(id)a4 deviceFamily:(unint64_t)a5 completionHandler:(id)a6
{
  char v7 = a5;
  id v42 = a3;
  id v38 = a4;
  id v37 = a6;
  v64[0] = 0LL;
  v64[1] = v64;
  v64[2] = 0x3032000000LL;
  v64[3] = sub_100004FCC;
  v64[4] = sub_100004FDC;
  id v65 = 0LL;
  uint64_t v60 = 0LL;
  v61 = &v60;
  uint64_t v62 = 0x2020000000LL;
  uint64_t v63 = 0LL;
  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x3032000000LL;
  v57 = sub_100004FCC;
  v58 = sub_100004FDC;
  id v59 = 0LL;
  v52[0] = 0LL;
  v52[1] = v52;
  v52[2] = 0x3032000000LL;
  v52[3] = sub_100004FCC;
  v52[4] = sub_100004FDC;
  id v53 = 0LL;
  context = objc_autoreleasePoolPush();
  if ((v7 & 6) != 0)
  {
    if ((v7 & 6) == 6LL)
    {
      v41 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@,%@",  @"software",  @"iPadSoftware");
    }

    else
    {
      id v10 = @"software";
      if ((v7 & 2) == 0) {
        id v10 = @"iPadSoftware";
      }
      v41 = (__CFString *)v10;
    }

    id v11 = &off_100008520;
  }

  else if ((v7 & 1) != 0)
  {
    v41 = @"macSoftware";
    id v11 = &off_100008518;
  }

  else
  {
    if ((v7 & 8) == 0)
    {
      v41 = 0LL;
      goto LABEL_14;
    }

    v41 = @"tvSoftware";
    id v11 = &off_100008528;
  }

  uint64_t v12 = v55;
  v13 = *v11;
  uint64_t v14 = (void *)v12[5];
  v12[5] = (uint64_t)v13;

LABEL_14:
  v40 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"entity",  v41);
  id v39 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"media",  @"software");
  v71[0] = v40;
  v71[1] = v39;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 2LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v38 arrayByAddingObjectsFromArray:v15]);
  [v42 setQueryItems:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v42 URL]);
  v18 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleIdentifier]);

  uint64_t v21 = MGCopyAnswer(@"marketing-name", 0LL);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = MGCopyAnswer(@"BuildVersion", 0LL);
  BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@/%@/%@/%@",  v20,  self->_callingProcessBundleID,  v22,  v24);
  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v18, "setValue:forHTTPHeaderField:", v25, @"User-Agent");
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "START: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v67 = 0x3032000000LL;
  v68 = sub_100004FCC;
  v69 = sub_100004FDC;
  v27 = self;
  v70 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](&OBJC_CLASS___NSURLSession, "sharedSession"));
  callingProcessBundleID = self->_callingProcessBundleID;
  v30 = (void *)objc_claimAutoreleasedReturnValue([v28 configuration]);
  objc_msgSend(v30, "set_sourceApplicationBundleIdentifier:", callingProcessBundleID);

  v31 = (void *)objc_claimAutoreleasedReturnValue([v28 configuration]);
  [v31 setTimeoutIntervalForResource:10.0];

  v32 = (void *)objc_claimAutoreleasedReturnValue([v28 configuration]);
  [v32 setTimeoutIntervalForRequest:10.0];

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100004FE4;
  v43[3] = &unk_1000085F8;
  id v33 = v17;
  __int128 v47 = v64;
  p___int128 buf = &buf;
  __int128 v49 = v52;
  v50 = &v60;
  id v44 = v33;
  id v45 = v27;
  v51 = &v54;
  id v34 = v37;
  id v46 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue([v28 dataTaskWithRequest:v18 completionHandler:v43]);
  ++v61[3];

  _Block_object_dispose(&buf, 8);
  objc_autoreleasePoolPop(context);
  if (v35) {
    [v35 resume];
  }
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(v64, 8);
}

- (void)handleSearchResultsWithTaskData:(id)a3 platform:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, NSMutableDictionary *, NSMutableDictionary *))a6;
  uint64_t v14 = objc_autoreleasePoolPush();
  if (!v10)
  {
    if (v12)
    {
      v19 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  v12,  v11,  0LL);
      v17 = 0LL;
    }

    else
    {
      v17 = 0LL;
      v19 = 0LL;
    }

    v18 = 0LL;
    goto LABEL_12;
  }

  id v21 = 0LL;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CTAppStoreSearchResult appStoreSearchResultsWithResultData:platform:error:]( &OBJC_CLASS___CTAppStoreSearchResult,  "appStoreSearchResultsWithResultData:platform:error:",  v10,  v11,  &v21));
  id v16 = v21;
  v17 = v16;
  if (!v15)
  {
    v18 = 0LL;
    if (v16) {
      goto LABEL_4;
    }
LABEL_8:
    v19 = 0LL;
    goto LABEL_9;
  }

  v18 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  v15,  v11,  0LL);
  if (!v17) {
    goto LABEL_8;
  }
LABEL_4:
  v19 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  v17,  v11,  0LL);
LABEL_9:

LABEL_12:
  objc_autoreleasePoolPop(v14);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412546;
    uint64_t v23 = v18;
    __int16 v24 = 2112;
    v25 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "appsByPlatform: %@ errorByPlatform: %@",  buf,  0x16u);
  }

  v13[2](v13, v18, v19);
}

- (void).cxx_destruct
{
}

@end