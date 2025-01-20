@interface PBIssueDataReporter
- (id)_latestSysdiagnoseFilePath;
- (void)_reportLatestIssueDataWithRemainingAttempts:(int64_t)a3;
- (void)_uploadSysdiagnoseAtPath:(id)a3 toURL:(id)a4 deleteAfterUpload:(BOOL)a5;
- (void)reportIssueDataAtPath:(id)a3;
- (void)reportLatestIssueData;
@end

@implementation PBIssueDataReporter

- (void)reportLatestIssueData
{
}

- (void)_reportLatestIssueDataWithRemainingAttempts:(int64_t)a3
{
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBIssueDataReporter _latestSysdiagnoseFilePath](self, "_latestSysdiagnoseFilePath"));
    if ([v5 length])
    {
      -[PBIssueDataReporter reportIssueDataAtPath:](self, "reportIssueDataAtPath:", v5);
    }

    else
    {
      BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v14) {
        sub_100285040(v14, v15, v16, v17, v18, v19, v20, v21);
      }
      dispatch_time_t v22 = dispatch_time(0LL, 500000000LL);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1001382EC;
      v25[3] = &unk_1003D05A8;
      v25[4] = self;
      v25[5] = a3;
      dispatch_after(v22, v24, v25);
    }
  }

  else
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_10028500C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    -[PBIssueDataReporter reportIssueDataAtPath:](self, "reportIssueDataAtPath:", &stru_1003E2910);
  }

- (void)reportIssueDataAtPath:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection")),
        unsigned int v6 = objc_msgSend(v5, "pb_usesManagedDiagnostics"),
        v5,
        v6))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pb_diagnosticsUploadURLString"));
    uint64_t v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));

    if (v9) {
      -[PBIssueDataReporter _uploadSysdiagnoseAtPath:toURL:deleteAfterUpload:]( self,  "_uploadSysdiagnoseAtPath:toURL:deleteAfterUpload:",  v4,  v9,  1LL);
    }
  }

  else
  {
    uint64_t v9 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  4LL);
    id v10 = sub_1001C307C(@"IssueDataConfirmationTitle", @"comment");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v11) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v11, kCFUserNotificationAlertHeaderKey);
    }
    id v12 = sub_1001C307C(@"IssueDataConfirmationMessage", @"comment");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v13) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v13, kCFUserNotificationAlertMessageKey);
    }
    id v14 = sub_1001C307C(@"IssueDataConfirmationExportItem", @"comment");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v15) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v15, kCFUserNotificationDefaultButtonTitleKey);
    }
    id v16 = sub_1001C307C(@"IssueDataConfirmationCancelItem", @"comment");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    if (v17) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v17, kCFUserNotificationOtherButtonTitleKey);
    }
    uint64_t v18 = CFUserNotificationCreate(0LL, 240.0, 0LL, 0LL, (CFDictionaryRef)v9);
    if (v18)
    {
      uint64_t v19 = v18;
      CFOptionFlags responseFlags = 3LL;
      CFUserNotificationReceiveResponse(v18, 240.0, &responseFlags);
      CFOptionFlags v20 = responseFlags;
      CFRelease(v19);
      if (!v20)
      {
        if ([v4 length])
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
          dispatch_time_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"prefs:root=DiagnosticLogExport&logfile=%@&activate=true",  v21));
        }

        else
        {
          sub_1001C90F8(0LL);
          dispatch_time_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"prefs:root=DiagnosticLogExport&activate=true"));
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v22));
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100138618;
        block[3] = &unk_1003CFF08;
        id v28 = v23;
        id v26 = v23;
        dispatch_async(v25, block);
      }
    }
  }
}

- (id)_latestSysdiagnoseFilePath
{
  v2 = NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 stringByAppendingPathComponent:@"Library/Logs/CrashReporter/DiagnosticLogs/sysdiagnose/Latest"]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v62 = 0LL;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 destinationOfSymbolicLinkAtPath:v4 error:&v62]);
  id v7 = v62;

  if (!v7) {
    goto LABEL_53;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1002851D4((uint64_t)v7);
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v9 = NSHomeDirectory();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = objc_claimAutoreleasedReturnValue( [v10 stringByAppendingPathComponent:@"Library/Logs/CrashReporter/DiagnosticLogs/sysdiagnose"]);

  v54 = (void *)v11;
  v55 = v8;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v8 enumeratorAtPath:v11]);
  id v56 = [v12 countByEnumeratingWithState:&v58 objects:v79 count:16];
  if (!v56)
  {

    goto LABEL_49;
  }

  id v45 = v7;
  v46 = v6;
  v47 = v4;
  v51 = 0LL;
  uint64_t v53 = *(void *)v59;
  *(void *)&__int128 v13 = 138412802LL;
  __int128 v44 = v13;
  id v52 = v12;
  do
  {
    id v14 = 0LL;
    do
    {
      if (*(void *)v59 != v53) {
        objc_enumerationMutation(v12);
      }
      uint64_t v15 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stringByAppendingPathComponent:", v15, v44));
      id v57 = 0LL;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v55 attributesOfItemAtPath:v16 error:&v57]);
      id v18 = v57;
      if (!v17)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v66 = v16;
          __int16 v67 = 2112;
          id v68 = v18;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to get attributes for sysdiagnose %@. [%@]",  buf,  0x16u);
        }

        goto LABEL_34;
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 fileType]);
      unsigned int v20 = [v19 isEqualToString:NSFileTypeDirectory];

      if (v20) {
        [v12 skipDescendants];
      }
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 fileCreationDate]);
      dispatch_time_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v22 components:64 fromDate:v21 toDate:v23 options:0]);
      uint64_t v25 = (uint64_t)[v24 minute];
      if ([v15 hasPrefix:@"IN_PROGRESS_sysdiagnose"])
      {
        BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v25 <= 5)
        {
          if (v26) {
            sub_1002850A8(&v77, (uint64_t)v16, &v78);
          }

          char v27 = 0;
          v51 = 0LL;
          int v28 = 2;
          goto LABEL_32;
        }

        if (v26) {
          sub_1002850E4(&v75, (uint64_t)v16, &v76);
        }
LABEL_31:
        char v27 = 0;
        int v28 = 3;
        goto LABEL_32;
      }

      if (([v15 hasPrefix:@"sysdiagnose_"] & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100285198(&v73, (uint64_t)v16, &v74);
        }
        goto LABEL_31;
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue([v17 fileType]);
      unsigned __int8 v30 = [v29 isEqualToString:NSFileTypeRegular];

      if ((v30 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_10028515C(&v71, (uint64_t)v16, &v72);
        }
        goto LABEL_31;
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue([v21 laterDate:v49]);

      BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v31 == v21)
      {
        if (v32)
        {
          *(_DWORD *)buf = v44;
          v66 = v16;
          __int16 v67 = 2112;
          id v68 = v21;
          __int16 v69 = 2112;
          v70 = v49;
          _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Choosing %@ - %@ is newer than %@",  buf,  0x20u);
        }

        id v48 = v21;

        id v50 = v16;
        int v28 = 0;
        char v27 = 1;
        v51 = v50;
        v49 = v48;
      }

      else
      {
        if (v32) {
          sub_100285120(&v63, (uint64_t)v16, &v64);
        }
        int v28 = 0;
        char v27 = 1;
      }

- (void)_uploadSysdiagnoseAtPath:(id)a3 toURL:(id)a4 deleteAfterUpload:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));
  id v10 = -[NSMutableURLRequest initWithURL:cachePolicy:timeoutInterval:]( objc_alloc(&OBJC_CLASS___NSMutableURLRequest),  "initWithURL:cachePolicy:timeoutInterval:",  v8,  1LL,  120.0);
  -[NSMutableURLRequest setHTTPMethod:](v10, "setHTTPMethod:", @"POST");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v11));
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_100138E64;
  v24 = sub_100138E74;
  id v25 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100138E8C;
  v16[3] = &unk_1003D8B40;
  BOOL v19 = a5;
  id v13 = v9;
  id v17 = v13;
  id v18 = &v20;
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 uploadTaskWithRequest:v10 fromFile:v13 completionHandler:v16]);
  uint64_t v15 = (void *)v21[5];
  v21[5] = v14;

  [(id)v21[5] resume];
  _Block_object_dispose(&v20, 8);
}

@end