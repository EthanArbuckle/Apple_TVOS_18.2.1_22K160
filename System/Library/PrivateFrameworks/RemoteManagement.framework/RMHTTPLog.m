@interface RMHTTPLog
+ (id)_logDirectoryForEnrollmentToken:(id)a3;
+ (void)_writeRequestLogToURL:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7;
+ (void)logHTTPDetailsForEnrollmentToken:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7;
+ (void)logHTTPDetailsForEnrollmentToken:(id)a3 request:(id)a4 response:(id)a5 responseURL:(id)a6 responseError:(id)a7;
@end

@implementation RMHTTPLog

+ (void)logHTTPDetailsForEnrollmentToken:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (+[RMFeatureOverrides useHTTPLogging](&OBJC_CLASS___RMFeatureOverrides, "useHTTPLogging"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _logDirectoryForEnrollmentToken:v17]);
    if (v16) {
      [a1 _writeRequestLogToURL:v16 request:v12 response:v13 responseData:v14 responseError:v15];
    }
  }
}

+ (void)logHTTPDetailsForEnrollmentToken:(id)a3 request:(id)a4 response:(id)a5 responseURL:(id)a6 responseError:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (+[RMFeatureOverrides useHTTPLogging](&OBJC_CLASS___RMFeatureOverrides, "useHTTPLogging"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 absoluteString]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Downloaded data to file: %@",  v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataUsingEncoding:4]);
    [a1 logHTTPDetailsForEnrollmentToken:v19 request:v12 response:v13 responseData:v18 responseError:v15];
  }
}

+ (void)_writeRequestLogToURL:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v71 = a5;
  id v69 = a6;
  id v70 = a7;
  id v13 = objc_opt_new(&OBJC_CLASS___NSDate);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMDateFormat stringLocalTimeZoneFractionalSecondsWithDate:]( &OBJC_CLASS___RMDateFormat,  "stringLocalTimeZoneFractionalSecondsWithDate:",  v13));

  id v15 = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v12 HTTPMethod]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@.txt",  v14,  v16));

  v72 = v11;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v17 isDirectory:0]);
  for (uint64_t i = 1LL; ; ++i)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
    unsigned int v22 = [v20 fileExistsAtPath:v21];

    v23 = (void *)objc_claimAutoreleasedReturnValue([v12 HTTPMethod]);
    uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%lu.txt",  v14,  v23,  i));

    uint64_t v25 = objc_claimAutoreleasedReturnValue([v72 URLByAppendingPathComponent:v24 isDirectory:0]);
    v18 = (void *)v25;
    id v17 = (void *)v24;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
  unsigned __int8 v28 = [v26 createFileAtPath:v27 contents:0 attributes:0];

  if ((v28 & 1) != 0)
  {
    v81[0] = 0LL;
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingToURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingToURL:error:",  v18,  v81));
    id v30 = v81[0];
    v31 = v71;
    if (v29)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      [v32 addObject:@"<<<<< Request"];
      v66 = v30;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v15 HTTPMethod]);
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v15 URL]);
      v35 = v29;
      v36 = (void *)objc_claimAutoreleasedReturnValue([(id)v34 path]);
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ HTTP/1.1",  v33,  v36));
      [v32 addObject:v37];

      v38 = (void *)objc_claimAutoreleasedReturnValue([v15 allHTTPHeaderFields]);
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472LL;
      v79[2] = sub_10003A394;
      v79[3] = &unk_1000B9FC0;
      id v39 = v32;
      id v80 = v39;
      [v38 enumerateKeysAndObjectsUsingBlock:v79];

      [v39 addObject:@"\n"];
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 componentsJoinedByString:@"\n"]);
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 dataUsingEncoding:4]);
      id v78 = 0LL;
      v68 = v35;
      LOBYTE(v34) = [v35 writeData:v41 error:&v78];
      id v42 = v78;

      if ((v34 & 1) == 0)
      {
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpLogging](&OBJC_CLASS___RMLog, "httpLogging"));
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_10003A6DC();
        }
      }

      uint64_t v44 = objc_claimAutoreleasedReturnValue([v15 HTTPBody]);
      v31 = v71;
      v67 = (void *)v44;
      if (v44)
      {
        id v77 = 0LL;
        unsigned __int8 v45 = [v68 writeData:v44 error:&v77];
        id v46 = v77;
        v47 = v42;
        id v42 = v46;

        if ((v45 & 1) == 0)
        {
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpLogging](&OBJC_CLASS___RMLog, "httpLogging"));
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_10003A67C();
          }
        }
      }

      v65 = v42;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

      [v49 addObject:@"\n>>>>> Response"];
      if (v71)
      {
        id v50 = [v71 statusCode];
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSHTTPURLResponse localizedStringForStatusCode:]( NSHTTPURLResponse,  "localizedStringForStatusCode:",  [v71 statusCode]));
        v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"HTTP/1.1 %ld %@",  v50,  v51));
        [v49 addObject:v52];

        v53 = (void *)objc_claimAutoreleasedReturnValue([v71 allHeaderFields]);
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472LL;
        v75[2] = sub_10003A3E8;
        v75[3] = &unk_1000B9FC0;
        id v54 = v49;
        id v76 = v54;
        [v53 enumerateKeysAndObjectsUsingBlock:v75];

        [v54 addObject:@"\n"];
      }

      else if (v70)
      {
        [v49 addObject:@"--- Error ---"];
        v57 = (void *)objc_claimAutoreleasedReturnValue([v70 description]);
        [v49 addObject:v57];
      }

      else
      {
        [v49 addObject:@"--- Unknown Error ---"];
      }

      v58 = (void *)objc_claimAutoreleasedReturnValue([v49 componentsJoinedByString:@"\n"]);
      v59 = (void *)objc_claimAutoreleasedReturnValue([v58 dataUsingEncoding:4]);
      id v74 = 0LL;
      unsigned __int8 v60 = [v68 writeData:v59 error:&v74];
      id v30 = v74;

      v56 = v69;
      if ((v60 & 1) == 0)
      {
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpLogging](&OBJC_CLASS___RMLog, "httpLogging"));
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_10003A61C();
        }
      }

      if (v69)
      {
        id v73 = 0LL;
        v29 = v68;
        unsigned __int8 v62 = [v68 writeData:v69 error:&v73];
        id v63 = v73;

        if ((v62 & 1) == 0)
        {
          v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpLogging](&OBJC_CLASS___RMLog, "httpLogging"));
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
            sub_10003A5BC();
          }
        }

        id v30 = v63;
        v31 = v71;
      }

      else
      {
        v29 = v68;
      }

      [v29 closeFile];
    }

    else
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[RMLog httpLogging](&OBJC_CLASS___RMLog, "httpLogging"));
      if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR)) {
        sub_10003A55C();
      }
      v56 = v69;
    }

    v55 = v70;
  }

  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[RMLog httpLogging](&OBJC_CLASS___RMLog, "httpLogging"));
    v55 = v70;
    v31 = v71;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
      sub_10003A73C((uint64_t)v18, (os_log_s *)v29);
    }
    id v30 = 0LL;
    v56 = v69;
  }
}

+ (id)_logDirectoryForEnrollmentToken:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[RMLocations httpLoggingDirectoryURLCreateIfNeeded:]( &OBJC_CLASS___RMLocations,  "httpLoggingDirectoryURLCreateIfNeeded:",  1LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v3 isDirectory:1]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v12 = 0LL;
  unsigned int v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v8 = v12;

  if (v7)
  {
    id v9 = v5;
  }

  else
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpLogging](&OBJC_CLASS___RMLog, "httpLogging"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003A7AC();
    }

    id v9 = 0LL;
  }

  return v9;
}

  ;
}

@end