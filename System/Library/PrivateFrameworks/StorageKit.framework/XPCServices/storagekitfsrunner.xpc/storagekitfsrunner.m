void tagQueue(void *a1, const void *a2)
{
  void *v3;
  dispatch_queue_s *queue;
  queue = a1;
  v3 = calloc(8uLL, 1uLL);
  *v3 = 1LL;
  dispatch_queue_set_specific(queue, a2, v3, (dispatch_function_t)&free);
}

void *currentQueueIsMainQueue()
{
  if (qword_10000DBC8 != -1) {
    dispatch_once(&qword_10000DBC8, &stru_1000082C8);
  }
  result = dispatch_get_specific("isMainQueue");
  if (result) {
    return (void *)(*result != 0LL);
  }
  return result;
}

void sub_100001DA0(id a1)
{
}

uint64_t isValidNSNumber(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

BOOL isValidNSString(void *a1)
{
  id v1 = a1;
  BOOL v3 = v1
    && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)
    && [v1 length] != 0;

  return v3;
}

uint64_t isValidNSDictionary(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t isValidNSArray(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t isValidNSData(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSData);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

id NSNumberToBool(void *a1)
{
  id v1 = a1;
  else {
    id v2 = 0LL;
  }

  return v2;
}

id NSNumberToULongLong(void *a1)
{
  id v1 = a1;
  else {
    id v2 = 0LL;
  }

  return v2;
}

__CFString *NSStringOrEmpty(void *a1)
{
  id v1 = a1;
  if (isValidNSString(v1)) {
    id v2 = v1;
  }
  else {
    id v2 = &stru_100008530;
  }
  BOOL v3 = v2;

  return v3;
}

BOOL isStringValidUUID(void *a1)
{
  id v1 = a1;
  if (isValidNSString(v1))
  {
    id v2 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v1);
    BOOL v3 = v2 != 0LL;
  }

  else
  {
    BOOL v3 = 0LL;
  }

  return v3;
}

uint64_t isOptionalString(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t isOptionalArray(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t isOptionalDict(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t isOptionalData(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSData);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t isOptionalNumber(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t isEqualOrBothNil(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return (uint64_t)[(id)a1 isEqual:a2];
  }
  else {
    return 1LL;
  }
}

id base64Encode(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s:%d", a1, a2));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataUsingEncoding:4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 base64EncodedStringWithOptions:0]);

  return v4;
}

id SKGetOSLog()
{
  if (qword_10000DBD0 != -1) {
    dispatch_once(&qword_10000DBD0, &stru_1000082E8);
  }
  if (byte_10000DBD8) {
    v0 = (id *)&off_10000D908;
  }
  else {
    v0 = (id *)&off_10000D900;
  }
  return *v0;
}

void sub_100002318(id a1)
{
  os_log_t v1 = os_log_create("com.apple.storagekit", "general");
  uint64_t v2 = off_10000D900;
  off_10000D900 = v1;

  os_log_t v3 = os_log_create("com.apple.storagekit", "storagekit-install");
  v4 = off_10000D908;
  off_10000D908 = v3;
}

void SKLogSetLogsToConsole()
{
  id v0 = SKGetOSLog();
  os_log_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "SKLogSetLogsToConsole/Std is deprecated. Please remove this call",  v2,  2u);
  }
}

void SKLogSetLogsToStd()
{
  id v0 = SKGetOSLog();
  os_log_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "SKLogSetLogsToStd is deprecated. Please remove this call",  v2,  2u);
  }
}

uint64_t SKLogSetLogsToSys(uint64_t result)
{
  byte_10000DBD8 = result;
  return result;
}

void SKLogArrayRedacted(os_log_type_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = SKGetOSLog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, a1))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = a2;
    _os_log_impl((void *)&_mh_execute_header, v7, a1, "%s", buf, 0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v14 = SKGetOSLog();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, a1))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, a1, "%@", buf, 0xCu);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }
}

void SKLogSetRedacted(os_log_type_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = SKGetOSLog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, a1))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = a2;
    _os_log_impl((void *)&_mh_execute_header, v7, a1, "%s", buf, 0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v14 = SKGetOSLog();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, a1))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, a1, "%@", buf, 0xCu);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  os_log_t v3 = (void *)objc_opt_new(&OBJC_CLASS___ServiceDelegate, argv, envp);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

NSMutableString *commaSeparatedDiskListFromArray(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if ([v1 count])
  {
    os_log_t v3 = 0LL;
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue([v1 objectAtIndex:v3]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 volumeName]);

      if (v5) {
        uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 volumeName]);
      }
      else {
        uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 diskIdentifier]);
      }
      v7 = (void *)v6;
      -[NSMutableString appendString:](v2, "appendString:", v6);

      ++v3;
    }

    while ([v1 count] > v3);
  }

  return v2;
}

void sub_100002AFC(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/System/Library/PrivateFrameworks/StorageKit.framework"));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v1));
  os_log_t v3 = (void *)qword_10000DBE0;
  qword_10000DBE0 = v2;

  if (!qword_10000DBE0)
  {
    id v4 = SKGetOSLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      v7 = "+[SKError frameworkBundle]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "%s: FATAL ERROR: Failed to get the NSBundle of StorageKit framework",  (uint8_t *)&v6,  0xCu);
    }
  }
}

id sub_1000034B0(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  NSErrorUserInfoKey v4 = NSDebugDescriptionErrorKey;
  id v5 = a1;
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

void sub_100003A1C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([@"\n" dataUsingEncoding:4]);
  uint64_t v2 = (void *)qword_10000DBF0;
  qword_10000DBF0 = v1;
}

void sub_100003D78(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([@"<plist" dataUsingEncoding:4]);
  uint64_t v2 = (void *)qword_10000DC00;
  qword_10000DC00 = v1;
}

void sub_100003DE8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([@"</plist>" dataUsingEncoding:4]);
  uint64_t v2 = (void *)qword_10000DC10;
  qword_10000DC10 = v1;
}

void sub_1000049F4(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3, a4));
  [v4 launch];
}

BOOL sub_100004A24(id a1, SKTask *a2, NSDictionary *a3)
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3));
  unsigned __int8 v4 = [v3 isRunning];

  return v4;
}

void sub_100004A5C(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  v12 = a2;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutParser](v12, "stdoutParser"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutParser](v12, "stdoutParser"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutHandle](v12, "stdoutHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 readDataUpToLength:4096 error:0]);
    [v5 parseData:v7];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrHandle](v12, "stderrHandle"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 readDataUpToLength:4096 error:0]);
    [v9 parseData:v11];
  }
}

BOOL sub_100004B54(id a1, SKTask *a2, NSDictionary *a3)
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3));
  unsigned __int8 v4 = [v3 isRunning];

  return v4;
}

void sub_100004B8C(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3, a4));
  [v4 waitUntilExit];
}

void sub_100004BBC(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  v12 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutParser](v12, "stdoutParser"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutHandle](v12, "stdoutHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 readDataToEndOfFile]);
    [v5 parseData:v7];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrHandle](v12, "stderrHandle"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 readDataToEndOfFile]);
    [v9 parseData:v11];
  }
}

BOOL sub_100004CA4(id a1, SKTask *a2, NSDictionary *a3)
{
  return !-[SKTask endedSuccessfully](a2, "endedSuccessfully", a3);
}

void sub_1000050F4(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000518C;
  v5[3] = &unk_1000084C8;
  id v6 = a2;
  os_log_t v3 = *(dispatch_queue_s **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = v6;
  dispatch_async(v3, v5);
}

id sub_10000518C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) length];
  if (result) {
    return [*(id *)(a1 + 40) sendStdout:*(void *)(a1 + 32)];
  }
  return result;
}

void sub_1000051C4(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000525C;
  v5[3] = &unk_1000084C8;
  id v6 = a2;
  os_log_t v3 = *(dispatch_queue_s **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = v6;
  dispatch_async(v3, v5);
}

id sub_10000525C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) length];
  if (result) {
    return [*(id *)(a1 + 40) sendStderr:*(void *)(a1 + 32)];
  }
  return result;
}

id objc_msgSend_waitWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitWithError:");
}