uint64_t start()
{
  void *v0;
  dispatch_semaphore_t v1;
  id v2;
  dispatch_semaphore_s *v3;
  dispatch_time_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  FILE *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSString *v13;
  NSString *v14;
  NSString *v16;
  void v17[4];
  dispatch_semaphore_s *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  v0 = objc_autoreleasePoolPush();
  v1 = dispatch_semaphore_create(0LL);
  v20 = 0LL;
  v21 = &v20;
  v22 = 0x3032000000LL;
  v23 = sub_100002368;
  v24 = sub_100002378;
  v25 = 0LL;
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v2 = objc_alloc_init(&OBJC_CLASS___TransparencyDaemon);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100002380;
  v17[3] = &unk_100004208;
  v19 = &v20;
  v3 = v1;
  v18 = v3;
  [v2 transparencySysDiagnose:v17];
  v4 = dispatch_time(0LL, 2500000000LL);
  if (dispatch_semaphore_wait(v3, v4))
  {
    fwrite("tool timed out waiting for transparencyd, using fallback\n", 0x39uLL, 1uLL, __stderrp);
    v26 = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport transparencyFilesPath:]( &OBJC_CLASS___TransparencyFileSupport,  "transparencyFilesPath:",  &v26));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"transparency_start.log" isDirectory:0]);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 relativePath]);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v7,  4LL,  0LL));

    if (v8)
    {
      v9 = __stdoutp;
      v8 = v8;
      fprintf(v9, "%s\n", -[NSString UTF8String](v8, "UTF8String"));
      v10 = 0LL;
    }

    else
    {
      fwrite("Cant make JSON\n", 0xFuLL, 1uLL, __stderrp);
      v10 = 74LL;
    }

    goto LABEL_16;
  }

  v11 = (void *)v21[5];
  v16 = 0LL;
  v12 = v11;
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v12))
  {
    v13 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v12,  3LL,  &v16));
    if (v13) {
      v14 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v13, 4LL);
    }
    else {
      v14 = 0LL;
    }
    goto LABEL_11;
  }

  v14 = (NSString *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -26275LL,  @"auditor report is not valid JSON"));
  NSLog(@"Bad report: %@", v12);
  if (v14)
  {
    v13 = v14;
    v14 = 0LL;
    v16 = v13;
LABEL_11:
  }

  v8 = v16;
  if (v14)
  {
    fprintf(__stdoutp, "%s\n", -[NSString UTF8String](v14, "UTF8String"));
    v10 = 0LL;
  }

  else
  {
    fwrite("Cant make JSON\n", 0xFuLL, 1uLL, __stderrp);
    v10 = 74LL;
  }

LABEL_16:
  _Block_object_dispose(&v20, 8);

  objc_autoreleasePoolPop(v0);
  return v10;
}

void sub_100002348( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

uint64_t sub_100002368(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100002378(uint64_t a1)
{
}

uint64_t sub_100002380(uint64_t a1, uint64_t a2)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000026B8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_100008680;
  qword_100008680 = (uint64_t)v1;
}

void sub_1000026E8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_100008680;
  qword_100008680 = (uint64_t)v1;
}

void sub_100002914(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_100008680;
  qword_100008680 = (uint64_t)v1;
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}