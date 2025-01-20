@interface NSTask
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 error:(id *)a5;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 launchHandler:(id)a5 didLaunch:(BOOL *)a6 error:(id *)a7;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 error:(id *)a6;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 error:(id *)a6;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 error:(id *)a6;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputData:(id)a6 errorData:(id)a7 launchHandler:(id)a8 didLaunch:(BOOL *)a9 error:(id *)a10;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFileHandle:(id)a6 errorFileHandle:(id)a7 launchHandler:(id)a8 didLaunch:(BOOL *)a9 error:(id *)a10;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFilePath:(id)a6 errorFilePath:(id)a7 redirectErrorToOutput:(BOOL)a8 launchHandler:(id)a9 didLaunch:(BOOL *)a10 error:(id *)a11;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 launchHandler:(id)a5 reply:(id)a6;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 launchHandler:(id)a6 reply:(id)a7;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 reply:(id)a6;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 launchHandler:(id)a6 reply:(id)a7;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 reply:(id)a6;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 launchHandler:(id)a6 reply:(id)a7;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 reply:(id)a6;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 reply:(id)a5;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputData:(id)a6 errorData:(id)a7 launchHandler:(id)a8 reply:(id)a9;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFileHandle:(id)a6 errorFileHandle:(id)a7 launchHandler:(id)a8 reply:(id)a9;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFilePath:(id)a6 errorFilePath:(id)a7 redirectErrorToOutput:(BOOL)a8 launchHandler:(id)a9 reply:(id)a10;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 startBlock:(id)a6 updateBlock:(id)a7 endBlock:(id)a8;
@end

@implementation NSTask

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 reply:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000183A8;
  v5[3] = &unk_1000D1740;
  v5[4] = a5;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:",  a3,  a4,  0LL,  0LL,  0LL,  v5,  10.0);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 launchHandler:(id)a5 reply:(id)a6
{
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 reply:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100018440;
  v6[3] = &unk_1000D1740;
  v6[4] = a6;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:",  a3,  a4,  a5,  0LL,  0LL,  v6,  10.0);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 launchHandler:(id)a6 reply:(id)a7
{
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputData:(id)a6 errorData:(id)a7 launchHandler:(id)a8 reply:(id)a9
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001850C;
  v11[3] = &unk_1000D1768;
  v11[4] = a9;
  v11[5] = a8;
  v9[4] = a9;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001853C;
  v10[3] = &unk_1000D1790;
  v10[4] = a6;
  v10[5] = a7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100018580;
  v9[3] = &unk_1000D17B8;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:",  a3,  a4,  v11,  v10,  v9,  a5);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 reply:(id)a6
{
  v6[1] = 3221225472LL;
  v6[2] = sub_100018604;
  v6[3] = &unk_1000D1740;
  v6[4] = a6;
  v6[0] = _NSConcreteStackBlock;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:",  a3,  a4,  a5,  0LL,  0LL,  0LL,  10.0,  v6);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 launchHandler:(id)a6 reply:(id)a7
{
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFilePath:(id)a6 errorFilePath:(id)a7 redirectErrorToOutput:(BOOL)a8 launchHandler:(id)a9 reply:(id)a10
{
  if (!((unint64_t)a6 | (unint64_t)a7))
  {
    +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:",  a3,  a4,  0LL,  0LL,  a9,  a10,  a5);
    return;
  }

  BOOL v14 = a8;
  v16 = (NSError *)a6;
  if (!a6)
  {
LABEL_10:
    v18 = 0LL;
    if (!a7) {
      goto LABEL_18;
    }
    goto LABEL_11;
  }

  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  a6,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v16,  0LL,  0LL);
  v17 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v16);
  if (!v17)
  {
    v19 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136316162;
      v31 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToO"
            "utput:launchHandler:reply:]";
      __int16 v32 = 2080;
      v33 = "W5TaskUtil.m";
      __int16 v34 = 1024;
      int v35 = 146;
      __int16 v36 = 2114;
      id v37 = [a3 lastPathComponent];
      __int16 v38 = 2114;
      id v39 = v16;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) <%{public}@> FAILED to create file handle for output path '%{public}@'",  &v30,  48);
    }

    NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
    v29 = @"W5ResourceErr";
    v16 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  7LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    goto LABEL_10;
  }

  v18 = v17;
  v16 = 0LL;
  if (!a7) {
    goto LABEL_18;
  }
LABEL_11:
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  a7,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  a7,  0LL,  0LL);
  v20 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", a7);
  if (!v20)
  {
    v21 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [a3 lastPathComponent];
      int v30 = 136316162;
      v31 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToO"
            "utput:launchHandler:reply:]";
      __int16 v32 = 2080;
      v33 = "W5TaskUtil.m";
      __int16 v34 = 1024;
      int v35 = 160;
      __int16 v36 = 2114;
      id v37 = v22;
      __int16 v38 = 2114;
      id v39 = a7;
      LODWORD(v24) = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[wifivelocity] %s (%s:%u) <%{public}@> FAILED to create file handle for error path '%{public}@'",  &v30,  v24);
    }

    NSErrorUserInfoKey v26 = NSLocalizedFailureReasonErrorKey;
    v27 = @"W5ResourceErr";
    v16 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  7LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
LABEL_18:
    v20 = 0LL;
    if (!v16) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }

  if (!v16)
  {
LABEL_19:
    if (v14) {
      v23 = v18;
    }
    else {
      v23 = v20;
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100018A7C;
    v25[3] = &unk_1000D17E0;
    v25[4] = v18;
    v25[5] = v20;
    v25[6] = a10;
    +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:",  a3,  a4,  v18,  v23,  a9,  v25,  a5);
    return;
  }

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 reply:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100018B40;
  v6[3] = &unk_1000D1740;
  v6[4] = a6;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:",  a3,  a4,  a5,  0LL,  0LL,  v6,  10.0);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 launchHandler:(id)a6 reply:(id)a7
{
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFileHandle:(id)a6 errorFileHandle:(id)a7 launchHandler:(id)a8 reply:(id)a9
{
  if ((unint64_t)a6 | (unint64_t)a7)
  {
    [a6 seekToEndOfFile];
    [a7 seekToEndOfFile];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100018CAC;
    v18[3] = &unk_1000D1768;
    v18[4] = a9;
    v18[5] = a8;
    v16[4] = a9;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100018CDC;
    v17[3] = &unk_1000D1790;
    v17[4] = a6;
    v17[5] = a7;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100018EE0;
    v16[3] = &unk_1000D17B8;
    +[NSTask runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:",  a3,  a4,  v18,  v17,  v16,  a5);
  }

  else
  {
    +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:",  a3,  a4,  0LL,  0LL,  a8,  a9,  a5);
  }

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 startBlock:(id)a6 updateBlock:(id)a7 endBlock:(id)a8
{
  v11 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"com.apple.wifivelocity.task.%@",  [a3 lastPathComponent]);
  v74[0] = 0LL;
  v74[1] = v74;
  v74[2] = 0x3052000000LL;
  v74[3] = sub_100019A20;
  v74[4] = sub_100019A30;
  uint64_t v12 = os_transaction_create(-[NSString UTF8String](v11, "UTF8String"));
  objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  -[NSString UTF8String](v11, "UTF8String"),  v12);
  id v47 = a6;
  v74[5] = v12;
  v72[0] = 0LL;
  v72[1] = v72;
  v72[2] = 0x2020000000LL;
  char v73 = 0;
  v70[0] = 0LL;
  v70[1] = v70;
  v70[2] = 0x2020000000LL;
  char v71 = 0;
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x3052000000LL;
  v67 = sub_100019A20;
  v68 = sub_100019A30;
  uint64_t v69 = 0LL;
  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  BOOL v14 = &off_1000A4000;
  dispatch_queue_t identifier = dispatch_queue_create(0LL, v13);
  if (!identifier)
  {
    NSErrorUserInfoKey v96 = NSLocalizedFailureReasonErrorKey;
    v97 = @"W5NoMemErr";
    id v15 = a4;
    __int16 v36 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v97,  &v96,  1LL);
    uint64_t v35 = 2LL;
LABEL_32:
    id v37 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  v35,  v36);
    v27 = 0LL;
    v46 = 0LL;
    uint64_t v24 = 0LL;
    id v22 = 0LL;
    v31 = 0LL;
    v18 = 0LL;
    goto LABEL_33;
  }

  id v15 = a4;
  id v16 = a7;
  id v17 = a3;
  if ((([v17 hasPrefix:@"/usr/local/"] & 1) != 0
     || [v17 hasPrefix:@"/AppleInternal/"])
    && (os_variant_allows_internal_security_policies("com.apple.wifivelocity") & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v44 = (const char *)[v17 UTF8String];
      *(_DWORD *)buf = 136446210;
      v82 = v44;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] '%{public}s' not allowed on non-internal install variants, will not run task",  buf,  0xCu);
      id v15 = a4;
    }

    NSErrorUserInfoKey v94 = NSLocalizedFailureReasonErrorKey;
    v95 = @"W5NotPermittedErr";
    __int16 v36 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v95,  &v94,  1LL);
    uint64_t v35 = 5LL;
    goto LABEL_32;
  }

  if (!a3
    || !-[NSFileManager isExecutableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isExecutableFileAtPath:",  a3))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v43 = (const char *)[a3 UTF8String];
      *(_DWORD *)buf = 136446210;
      v82 = v43;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] '%{public}s' does not exist, will not run task",  buf,  0xCu);
      id v15 = a4;
    }

    NSErrorUserInfoKey v92 = NSLocalizedFailureReasonErrorKey;
    v93 = @"W5ParamErr";
    uint64_t v35 = 1LL;
    __int16 v36 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL);
    goto LABEL_32;
  }

  v18 = objc_alloc_init(&OBJC_CLASS___NSTask);
  -[NSTask setLaunchPath:](v18, "setLaunchPath:", a3);
  if (a4) {
    -[NSTask setArguments:](v18, "setArguments:", a4);
  }
  memset(&v91, 0, sizeof(v91));
  int v19 = openpty(&v63, (int *)&handle_4, 0LL, &v91, 0LL);
  if (v19)
  {
    NSErrorUserInfoKey v89 = NSLocalizedFailureReasonErrorKey;
    v90 = @"err";
    id v37 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v19,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v90,  &v89,  1LL));
    __int16 v38 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = *__error();
      *(_DWORD *)buf = 136315906;
      v82 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]";
      __int16 v83 = 2080;
      v84 = "W5TaskUtil.m";
      __int16 v85 = 1024;
      int v86 = 335;
      __int16 v87 = 1024;
      int v88 = v39;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  0LL,  "[wifivelocity] %s (%s:%u) Failed to open pseduo-terminal for stdout, returned error %d",  buf,  34);
    }

    goto LABEL_25;
  }

  memset(&v91, 0, sizeof(v91));
  int v20 = openpty((int *)&handle, &v60, 0LL, &v91, 0LL);
  if (v20)
  {
    NSErrorUserInfoKey v79 = NSLocalizedFailureReasonErrorKey;
    v80 = @"err";
    id v37 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v20,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v80,  &v79,  1LL));
    v40 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = *__error();
      *(_DWORD *)buf = 136315906;
      v82 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]";
      __int16 v83 = 2080;
      v84 = "W5TaskUtil.m";
      __int16 v85 = 1024;
      int v86 = 339;
      __int16 v87 = 1024;
      int v88 = v41;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v40,  0LL,  "[wifivelocity] %s (%s:%u) Failed to open pseduo-terminal for stderr, returned error %d",  buf,  34);
    }

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 error:(id *)a5
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:",  a3,  a4,  0LL,  0LL,  0LL,  0LL,  0.0,  a5);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 launchHandler:(id)a5 didLaunch:(BOOL *)a6 error:(id *)a7
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:",  a3,  a4,  0LL,  0LL,  a5,  a6,  0.0,  a7);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 error:(id *)a6
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:",  a3,  a4,  a5,  0LL,  0LL,  0LL,  0.0,  a6);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:",  a3,  a4,  a5,  0LL,  a6,  a7,  0.0,  a8);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputData:(id)a6 errorData:(id)a7 launchHandler:(id)a8 didLaunch:(BOOL *)a9 error:(id *)a10
{
  uint64_t v29 = 0LL;
  int v30 = &v29;
  uint64_t v31 = 0x3052000000LL;
  __int16 v32 = sub_100019A20;
  v33 = sub_100019A30;
  uint64_t v34 = 0LL;
  uint64_t v25 = 0LL;
  NSErrorUserInfoKey v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  id v17 = dispatch_semaphore_create(0LL);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001ACF8;
  v24[3] = &unk_1000D1948;
  v24[5] = &v29;
  v24[6] = &v25;
  v24[4] = v17;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:",  a3,  a4,  a6,  a7,  a8,  v24,  a5);
  dispatch_time_t v18 = dispatch_time(0LL, 600000000000LL);
  if (dispatch_semaphore_wait(v17, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v36 = 0x4082C00000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  id v19 = (id)v30[5];
  if (a9) {
    *a9 = *((_BYTE *)v26 + 24);
  }
  int v20 = v30;
  if (a10)
  {
    v21 = (void *)v30[5];
    if (v21) {
      *a10 = v21;
    }
  }

  BOOL v22 = v20[5] == 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v22;
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 error:(id *)a6
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:",  a3,  a4,  a5,  0LL,  0LL,  0LL,  0.0,  0LL,  a6);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:",  a3,  a4,  a5,  0LL,  0LL,  a6,  0.0,  a7,  a8);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFilePath:(id)a6 errorFilePath:(id)a7 redirectErrorToOutput:(BOOL)a8 launchHandler:(id)a9 didLaunch:(BOOL *)a10 error:(id *)a11
{
  BOOL v12 = a8;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3052000000LL;
  v33 = sub_100019A20;
  uint64_t v34 = sub_100019A30;
  uint64_t v35 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  dispatch_time_t v18 = dispatch_semaphore_create(0LL);
  v25[1] = 3221225472LL;
  v25[2] = sub_10001AFF0;
  v25[3] = &unk_1000D1948;
  v25[5] = &v30;
  v25[6] = &v26;
  v25[4] = v18;
  v25[0] = _NSConcreteStackBlock;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:",  a3,  a4,  a6,  a7,  v12,  a9,  a5,  v25);
  dispatch_time_t v19 = dispatch_time(0LL, 600000000000LL);
  if (dispatch_semaphore_wait(v18, v19) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v37 = 0x4082C00000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  id v20 = (id)v31[5];
  if (a10) {
    *a10 = *((_BYTE *)v27 + 24);
  }
  v21 = v31;
  if (a11)
  {
    BOOL v22 = (void *)v31[5];
    if (v22) {
      *a11 = v22;
    }
  }

  BOOL v23 = v21[5] == 0;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  return v23;
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 error:(id *)a6
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:",  a3,  a4,  a5,  0LL,  0LL,  0LL,  0.0,  a6);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:",  a3,  a4,  a5,  0LL,  a6,  a7,  0.0,  a8);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFileHandle:(id)a6 errorFileHandle:(id)a7 launchHandler:(id)a8 didLaunch:(BOOL *)a9 error:(id *)a10
{
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3052000000LL;
  uint64_t v32 = sub_100019A20;
  v33 = sub_100019A30;
  uint64_t v34 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  id v17 = dispatch_semaphore_create(0LL);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001B2E8;
  v24[3] = &unk_1000D1948;
  v24[5] = &v29;
  v24[6] = &v25;
  v24[4] = v17;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:",  a3,  a4,  a6,  a7,  a8,  v24,  a5);
  dispatch_time_t v18 = dispatch_time(0LL, 600000000000LL);
  if (dispatch_semaphore_wait(v17, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v36 = 0x4082C00000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  id v19 = (id)v30[5];
  if (a9) {
    *a9 = *((_BYTE *)v26 + 24);
  }
  id v20 = v30;
  if (a10)
  {
    v21 = (void *)v30[5];
    if (v21) {
      *a10 = v21;
    }
  }

  BOOL v22 = v20[5] == 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v22;
}

@end