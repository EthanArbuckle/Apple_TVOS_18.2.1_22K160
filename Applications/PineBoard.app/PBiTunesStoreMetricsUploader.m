@interface PBiTunesStoreMetricsUploader
+ (id)uploaderLog;
+ (void)uploadData:(id)a3 withSubtopic:(id)a4 toURL:(id)a5 withCompletion:(id)a6;
@end

@implementation PBiTunesStoreMetricsUploader

+ (id)uploaderLog
{
  if (qword_100471488 != -1) {
    dispatch_once(&qword_100471488, &stru_1003DC9B0);
  }
  return (id)qword_100471480;
}

+ (void)uploadData:(id)a3 withSubtopic:(id)a4 toURL:(id)a5 withCompletion:(id)a6
{
  id v9 = a4;
  id v52 = a5;
  id v50 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3));
  if ([v9 length]) {
    [v10 setObject:v9 forKey:@"subtopic"];
  }
  id v51 = v9;
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectEnumerator]);

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 nextObject]);
  if (v13)
  {
    v14 = (void *)v13;
    do
    {
      v15 = v10;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v14]);
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAddingPercentEncodingWithAllowedCharacters:v17]);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v16));
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAddingPercentEncodingWithAllowedCharacters:v20]);

      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  v18,  v21));
      [v53 addObject:v22];

      v10 = v15;
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v12 nextObject]);

      v14 = (void *)v23;
    }

    while (v23);
  }

  v24 = v12;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v53 componentsJoinedByString:@"&"]);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@?%@", v52, v25));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v26));
  if (v27)
  {
    v49 = v10;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v27));
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[PBiTunesStoreMetricsUploader uploaderLog]( &OBJC_CLASS___PBiTunesStoreMetricsUploader,  "uploaderLog"));
    v30 = v29;
    if (v28)
    {
      v32 = v50;
      v31 = v51;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        sub_100291FE0((uint64_t)v28, v30);
      }

      [v28 setValue:@"en" forHTTPHeaderField:@"Accept-Language"];
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemVersion](&OBJC_CLASS___TVSDevice, "systemVersion"));
      [v28 setValue:v33 forHTTPHeaderField:@"X-Apple-TV-Version"];

      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
      -[os_log_s setRequestCachePolicy:](v30, "setRequestCachePolicy:", 1LL);
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v30));
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_1001F6C38;
      v54[3] = &unk_1003DC9D8;
      id v55 = v50;
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 dataTaskWithRequest:v28 completionHandler:v54]);
      [v35 resume];
    }

    else
    {
      v32 = v50;
      v31 = v51;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100291F7C((uint64_t)v26, v30, v43, v44, v45, v46, v47, v48);
      }
    }

    v10 = v49;
    v36 = v53;
  }

  else
  {
    v36 = v53;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[PBiTunesStoreMetricsUploader uploaderLog]( &OBJC_CLASS___PBiTunesStoreMetricsUploader,  "uploaderLog"));
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
      sub_100291F18((uint64_t)v26, (os_log_s *)v28, v37, v38, v39, v40, v41, v42);
    }
    v32 = v50;
    v31 = v51;
  }
}

@end