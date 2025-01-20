@interface sysdiagnose_DEExtension
- (OS_xpc_object)connection;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4;
- (id)getRemoteArchives;
- (id)tryReusingSysdiagnoseForParameters:(id)a3;
- (void)dealloc;
- (void)setConnection:(id)a3;
@end

@implementation sysdiagnose_DEExtension

- (id)getRemoteArchives
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "REQUEST_TYPE", 9uLL);
  id v3 = sub_1000013AC(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
  {
    xpc_object_t value = xpc_dictionary_get_value(v4, "archive_list");
    v7 = (void *)objc_claimAutoreleasedReturnValue(value);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v9 = (void *)v8;
    if (v7)
    {
      size_t count = xpc_array_get_count(v7);
      if (count)
      {
        size_t v11 = count;
        for (size_t i = 0LL; i != v11; ++i)
        {
          string = xpc_array_get_string(v7, i);
          if (string)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
            [v9 addObject:v14];
          }
        }
      }
    }

    else
    {
      v7 = (void *)v8;
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (id)attachmentList
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Called attachmentList",  buf,  2u);
  }

  char v27 = 0;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 pathSubmission]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v4 stringByAppendingPathComponent:@"DiagnosticLogs/sysdiagnose"]);
  id v6 = sub_1000018D8(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LOBYTE(v4) = [v8 fileExistsAtPath:v7 isDirectory:&v27];

  if ((v4 & 1) != 0)
  {
    if (v27)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose dir exists",  buf,  2u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"sysdiagnose_.*.tar*",  1LL,  0LL));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"IN_PROGRESS_",  1LL,  0LL));
      size_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v7,  1LL));
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[sysdiagnose_DEExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v11,  v9,  v10));
    }

    else
    {
      v12 = 0LL;
    }

    *(void *)buf = 0LL;
    v22 = buf;
    uint64_t v23 = 0x3032000000LL;
    v24 = sub_100001A98;
    v25 = sub_100001AA8;
    id v26 = 0LL;
    if (v12 && [v12 count]) {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v12));
    }
    else {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    }
    v15 = (void *)*((void *)v22 + 5);
    *((void *)v22 + 5) = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[sysdiagnose_DEExtension getRemoteArchives](self, "getRemoteArchives"));
    v17 = v16;
    if ((!v16 || ![v16 count]) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Didn't receive a non-zero list of archives from the watch",  v28,  2u);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100001AB0;
    v20[3] = &unk_1000042B0;
    v20[4] = buf;
    [v17 enumerateObjectsUsingBlock:v20];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *((void *)v22 + 5);
      *(_DWORD *)v28 = 138412290;
      uint64_t v29 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Returning list of paths: %@",  v28,  0xCu);
    }

    id v13 = *((id *)v22 + 5);

    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "error: sysdiagnose directory missing.",  buf,  2u);
    }

    id v13 = &__NSArray0__struct;
  }

  return v13;
}

- (id)tryReusingSysdiagnoseForParameters:(id)a3
{
  id v3 = a3;
  unsigned __int8 v50 = 0;
  unsigned __int8 v49 = 1;
  unsigned __int8 v48 = 0;
  sub_100002204((uint64_t)@"forceDiagnostic", v3, &v50);
  sub_100002204((uint64_t)@"shouldCreateTarBall", v3, &v49);
  sub_100002204((uint64_t)@"fbaKeychord", v3, &v48);
  if (v50)
  {
    uint64_t v4 = 0LL;
    goto LABEL_56;
  }

  unsigned __int8 v5 = v49;
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "REQUEST_TYPE", 0xBuLL);
  xpc_dictionary_set_BOOL(v6, "compress", v5);
  id v7 = sub_1000013AC(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "xpc request to SD server gave nil reply",  buf,  2u);
    }

    goto LABEL_8;
  }

  string = xpc_dictionary_get_string(v8, "path");
  if (!string)
  {
LABEL_8:
    size_t v11 = 0LL;
    goto LABEL_9;
  }

  size_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
LABEL_9:

  if (v11) {
    goto LABEL_38;
  }
  id v43 = v3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v60 = v49;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No in progress archive found for compress: %d. Checking for recent archive",  buf,  8u);
  }

  int v45 = v49;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pathSubmission]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:@"DiagnosticLogs/sysdiagnose"]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v15, 1LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  NSURLNameKey,  NSURLPathKey,  NSURLCreationDateKey,  0LL));
  v42 = v12;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [v12 enumeratorAtURL:v16 includingPropertiesForKeys:v17 options:7 errorHandler:&stru_1000043B8]);

  uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v20 = v18;
  id v21 = [v20 countByEnumeratingWithState:&v53 objects:buf count:16];
  if (!v21)
  {
    v47 = 0LL;
    id v25 = (id)v19;
    goto LABEL_34;
  }

  id v22 = v21;
  v47 = 0LL;
  uint64_t v23 = *(void *)v54;
  v24 = @"temp";
  id v25 = (id)v19;
  id v44 = v20;
  do
  {
    for (size_t i = 0LL; i != v22; size_t i = (char *)i + 1)
    {
      if (*(void *)v54 != v23) {
        objc_enumerationMutation(v20);
      }
      char v27 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
      v28 = objc_autoreleasePoolPush();
      id v29 = (id)objc_claimAutoreleasedReturnValue([v27 lastPathComponent]);
      if ([v29 hasPrefix:@"sysdiagnose_"]
        && ([v29 containsString:v24] & 1) == 0)
      {
        v30 = v24;
        unsigned __int8 v31 = [v29 containsString:@"IN_PROGRESS_"];

        if ((v31 & 1) != 0)
        {
          v24 = v30;
          goto LABEL_30;
        }

        id v52 = 0LL;
        [v27 getResourceValue:&v52 forKey:NSURLCreationDateKey error:0];
        id v29 = v52;
        id v51 = 0LL;
        [v27 getResourceValue:&v51 forKey:NSURLIsDirectoryKey error:0];
        id v32 = v51;
        if ([v29 compare:v25] == (id)1)
        {
          v46 = v25;
          if ((v45 != 0) == [v32 BOOLValue])
          {
            id v33 = v47;
          }

          else
          {
            id v25 = v29;

            id v33 = v27;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v57 = 138412290;
              id v58 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "DE found matching file %@",  v57,  0xCu);
            }
          }

          id v20 = v44;
        }

        else
        {
          id v33 = v47;
        }

        v47 = v33;
        v24 = v30;
      }

LABEL_30:
      objc_autoreleasePoolPop(v28);
    }

    id v22 = [v20 countByEnumeratingWithState:&v53 objects:buf count:16];
  }

  while (v22);
LABEL_34:

  v34 = -[NSDate initWithTimeIntervalSinceNow:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceNow:",  -600.0);
  if ([v25 compare:v34] == (id)1)
  {
    v35 = v47;
    size_t v11 = (void *)objc_claimAutoreleasedReturnValue([v47 path]);
  }

  else
  {
    size_t v11 = 0LL;
    v35 = v47;
  }

  id v3 = v43;
  if (v11)
  {
LABEL_38:
    id v36 = sub_1000018D8(v11);
    id v37 = (id)objc_claimAutoreleasedReturnValue(v36);

    else {
      unsigned int v38 = [v37 hasSuffix:@".tar"];
    }
    if (v49) {
      unsigned int v39 = v38;
    }
    else {
      unsigned int v39 = 0;
    }
    if (v49) {
      int v40 = 1;
    }
    else {
      int v40 = v38;
    }
    if (v48 || !v40 || v39)
    {
      id v37 = v37;
      uint64_t v4 = v37;
      goto LABEL_55;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No recent archive found. Continuing to invoke new sysdiagnose",  buf,  2u);
    }

    id v37 = 0LL;
  }

  uint64_t v4 = 0LL;
LABEL_55:

LABEL_56:
  return v4;
}

- (id)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = "yes";
    id v33 = "-[sysdiagnose_DEExtension attachmentsForParameters:withProgressHandler:]";
    *(_DWORD *)buf = 136315650;
    if (!v7) {
      uint64_t v8 = "no";
    }
    __int16 v34 = 2080;
    v35 = v8;
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Called %s. Progress handler passed: %s, parameters: %@",  buf,  0x20u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[sysdiagnose_DEExtension tryReusingSysdiagnoseForParameters:]( self,  "tryReusingSysdiagnoseForParameters:",  v6));
  if (v9
    && (uint64_t v10 = objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](&OBJC_CLASS___DEAttachmentItem, "attachmentWithPath:", v9))) != 0)
  {
    id v11 = (id)v10;
    uint64_t v31 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  }

  else
  {
    id v13 = [v6 copy];
    id v29 = 0LL;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100002628;
    v27[3] = &unk_1000042D8;
    id v28 = v7;
    uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue( +[Libsysdiagnose sysdiagnoseWithMetadata:withError:withProgressHandler:]( &OBJC_CLASS___Libsysdiagnose,  "sysdiagnoseWithMetadata:withError:withProgressHandler:",  v13,  &v29,  v27));
    id v11 = v29;

    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Returning %@ as attachment",  buf,  0xCu);
      }

      unsigned __int8 v26 = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned int v17 = [v16 fileExistsAtPath:v14 isDirectory:&v26];
      int v18 = v26;

      if (v17 && v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v20 = (char *)objc_claimAutoreleasedReturnValue([v19 contentsOfDirectoryAtPath:v14 error:0]);
        *(_DWORD *)buf = 138412290;
        id v33 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Contents of dir %@",  buf,  0xCu);
      }

      id v21 = sub_1000018D8(v14);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v22));

      v30 = v23;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    }

    else
    {
      if (v15)
      {
        v24 = (char *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
        *(_DWORD *)buf = 138543362;
        id v33 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Libsysdiagnose returned error %{public}@",  buf,  0xCu);
      }

      v12 = &__NSArray0__struct;
    }
  }

  return v12;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___sysdiagnose_DEExtension;
  -[sysdiagnose_DEExtension dealloc](&v2, "dealloc");
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end