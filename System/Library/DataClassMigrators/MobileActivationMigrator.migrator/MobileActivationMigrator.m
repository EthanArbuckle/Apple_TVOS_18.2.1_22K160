NSError *createMobileActivationError(uint64_t a1, uint64_t a2, id a3, uint64_t a4, void *a5, void *a6, ...)
{
  id v11;
  id v12;
  id v13;
  NSMutableString *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSString *v17;
  NSNumber *v18;
  NSError *v19;
  va_list va;
  va_start(va, a6);
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = -[NSMutableString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:arguments:",  v13,  va);

  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v16 = v15;
  if (v14) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v14,  NSLocalizedDescriptionKey);
  }
  if (v12) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v12, NSUnderlyingErrorKey);
  }
  if (os_variant_allows_internal_security_policies(0LL))
  {
    if (a1)
    {
      v17 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v17,  @"FunctionName");
    }

    if ((_DWORD)a2)
    {
      v18 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a2);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v18, @"SourceLine");
    }
  }

  v19 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  a4,  v16);

  return v19;
}

uint64_t isRunningInRecovery()
{
  return 0LL;
}

uint64_t isRunningInRootLaunchdContext()
{
  return 0LL;
}

uint64_t isRunningInDiagnosticsMode()
{
  if (isRunningInDiagnosticsMode_onceToken != -1) {
    dispatch_once(&isRunningInDiagnosticsMode_onceToken, &__block_literal_global_0);
  }
  return isRunningInDiagnosticsMode_retval;
}

void __isRunningInDiagnosticsMode_block_invoke(id a1)
{
  v1 = (void *)MGCopyAnswer(@"3kmXfug8VcxLI5yEmsqQKw", 0LL);
  id v2 = isNSNumber(v1);

  if (v2) {
    isRunningInDiagnosticsMode_retval = [v1 BOOLValue];
  }
}

id isNSNumber(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t isSupportedDeviceIdentityClient(int a1, NSError **a2)
{
  if (isSupportedDeviceIdentityClient_onceToken != -1) {
    dispatch_once(&isSupportedDeviceIdentityClient_onceToken, &__block_literal_global_2);
  }
  v4 = copy_process_name(a1);
  if (!v4)
  {
    v8 =  createMobileActivationError( (uint64_t)"isSupportedDeviceIdentityClient",  295LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to query process name.");
    id v7 = 0LL;
    if (a2)
    {
LABEL_12:
      v8 = v8;
      uint64_t v9 = 0LL;
      *a2 = v8;
      goto LABEL_15;
    }

LABEL_14:
    uint64_t v9 = 0LL;
    goto LABEL_15;
  }

  BOOL v5 = is_virtual_machine();
  v6 = &isSupportedDeviceIdentityClient_virtualDeviceSupportedList;
  if (!v5) {
    v6 = &isSupportedDeviceIdentityClient_physicalDeviceSupportedList;
  }
  id v7 = (id)*v6;
  if (([v7 containsObject:v4] & 1) == 0)
  {
    v8 =  createMobileActivationError( (uint64_t)"isSupportedDeviceIdentityClient",  302LL,  @"com.apple.MobileActivation.ErrorDomain",  -25LL,  0LL,  @"%@ is not allowed to use this API. File a radar with 'MobileActivation | all' for support.",  v4);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      isSupportedDeviceIdentityClient_cold_1(v8);
      if (a2) {
        goto LABEL_12;
      }
    }

    else if (a2)
    {
      goto LABEL_12;
    }

    goto LABEL_14;
  }

  v8 = 0LL;
  uint64_t v9 = 1LL;
LABEL_15:

  return v9;
}

void __isSupportedDeviceIdentityClient_block_invoke(id a1)
{
  id v1 = (void *)isSupportedDeviceIdentityClient_virtualDeviceSupportedList;
  isSupportedDeviceIdentityClient_virtualDeviceSupportedList = (uint64_t)&off_E068;

  uint64_t v2 = (void *)isSupportedDeviceIdentityClient_physicalDeviceSupportedList;
  isSupportedDeviceIdentityClient_physicalDeviceSupportedList = (uint64_t)&off_E080;
}

NSString *copy_calling_process_name()
{
  return copy_process_name(1);
}

NSString *copy_current_process_name()
{
  return copy_process_name(0);
}

id isSupportedRecoveryLogClient(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (isSupportedRecoveryLogClient_onceToken != -1)
  {
    dispatch_once(&isSupportedRecoveryLogClient_onceToken, &__block_literal_global_239);
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    id v3 = 0LL;
    goto LABEL_6;
  }

  if (!v1) {
    goto LABEL_5;
  }
LABEL_3:
  id v3 = [(id)isSupportedRecoveryLogClient_supportedList containsObject:v2];
LABEL_6:

  return v3;
}

void __isSupportedRecoveryLogClient_block_invoke(id a1)
{
  id v1 = (void *)isSupportedRecoveryLogClient_supportedList;
  isSupportedRecoveryLogClient_supportedList = (uint64_t)&off_E098;
}

uint64_t isSupportedActivationLockClient(int a1, NSError **a2)
{
  if (isSupportedActivationLockClient_onceToken != -1) {
    dispatch_once(&isSupportedActivationLockClient_onceToken, &__block_literal_global_260);
  }
  v4 = copy_process_name(a1);
  if (!v4)
  {
    BOOL v5 =  createMobileActivationError( (uint64_t)"isSupportedActivationLockClient",  372LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to query process name.");
    if (a2)
    {
LABEL_10:
      BOOL v5 = v5;
      uint64_t v6 = 0LL;
      *a2 = v5;
      goto LABEL_13;
    }

LABEL_12:
    uint64_t v6 = 0LL;
    goto LABEL_13;
  }

  if (([(id)isSupportedActivationLockClient_supportedList containsObject:v4] & 1) == 0)
  {
    BOOL v5 =  createMobileActivationError( (uint64_t)"isSupportedActivationLockClient",  377LL,  @"com.apple.MobileActivation.ErrorDomain",  -25LL,  0LL,  @"%@ is not allowed to use this API. File a radar with 'MobileActivation | all' for support.",  v4);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      isSupportedDeviceIdentityClient_cold_1(v5);
      if (a2) {
        goto LABEL_10;
      }
    }

    else if (a2)
    {
      goto LABEL_10;
    }

    goto LABEL_12;
  }

  BOOL v5 = 0LL;
  uint64_t v6 = 1LL;
LABEL_13:

  return v6;
}

void __isSupportedActivationLockClient_block_invoke(id a1)
{
  id v1 = (void *)isSupportedActivationLockClient_supportedList;
  isSupportedActivationLockClient_supportedList = (uint64_t)&off_E0B0;
}

NSArray *copy_sorted_file_list(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  id v3 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v1);

  v4 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", NSURLCreationDateKey);
  BOOL v5 =  -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( v2,  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  v3,  v4,  4LL,  0LL);

  if (v5 && -[NSArray count](v5, "count")) {
    uint64_t v6 = -[NSArray sortedArrayUsingComparator:](v5, "sortedArrayUsingComparator:", &__block_literal_global_266);
  }
  else {
    uint64_t v6 = 0LL;
  }

  return v6;
}

int64_t __copy_sorted_file_list_block_invoke(id a1, id a2, id a3)
{
  id v4 = a3;
  id v15 = 0LL;
  unsigned int v5 = [a2 getResourceValue:&v15 forKey:NSURLCreationDateKey error:0];
  id v6 = v15;
  if (v5)
  {
    id v14 = 0LL;
    unsigned int v7 = [v4 getResourceValue:&v14 forKey:NSURLCreationDateKey error:0];
    id v8 = v14;
    if (v7)
    {
      [v6 timeIntervalSince1970];
      double v10 = v9;
      [v8 timeIntervalSince1970];
      if (v10 < v11) {
        int64_t v12 = 1LL;
      }
      else {
        int64_t v12 = -1LL;
      }
    }

    else
    {
      int64_t v12 = 0LL;
    }
  }

  else
  {
    int64_t v12 = 0LL;
    id v8 = 0LL;
  }

  return v12;
}

id isNSDictionary(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id isNSArray(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id isNSString(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id isNSData(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id isNSURL(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSURL), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id isNSDate(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

NSString *dictionary_to_xml(uint64_t a1)
{
  id v1 =  +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a1,  100LL,  0LL,  0LL);
  if (v1) {
    uint64_t v2 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v1, 4LL);
  }
  else {
    uint64_t v2 = 0LL;
  }

  return v2;
}

uint64_t store_data(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  unsigned int v7 = v6;
  if (!v5 || !v6)
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"store_data",  532LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid input(s).");
    goto LABEL_11;
  }

  id v8 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  unsigned __int8 v9 = -[NSFileManager fileExistsAtPath:](v8, "fileExistsAtPath:", v5);

  id v10 = v5;
  int v11 = open_dprotected_np((const char *)[v10 fileSystemRepresentation], 1794, 4, 0);
  if (v11 == -1)
  {
    v21 = __error();
    v26 = strerror(*v21);
    MobileActivationError = createMobileActivationError( (uint64_t)"store_data",  541LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create %@: %s",  v10,  v26);
LABEL_11:
    v19 = MobileActivationError;
    int v12 = -1;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  int v12 = v11;
  if ((v9 & 1) != 0
    || (id v13 = v10, !chmod((const char *)[v13 fileSystemRepresentation], 0x1B6u)))
  {
    id v17 = v7;
    id v18 = (id)write(v12, [v17 bytes], (size_t)objc_msgSend(v17, "length"));
    if (v18 == [v17 length])
    {
      v19 = 0LL;
      uint64_t v20 = 1LL;
LABEL_14:
      close(v12);
      uint64_t v22 = v20;
      goto LABEL_15;
    }

    v24 = __error();
    v27 = strerror(*v24);
    id v15 = createMobileActivationError( (uint64_t)"store_data",  554LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to write data to %@: %s",  v10,  v27);
  }

  else
  {
    id v14 = __error();
    v25 = strerror(*v14);
    id v15 = createMobileActivationError( (uint64_t)"store_data",  548LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to update file permissions for %@: %s",  v13,  v25);
  }

  v19 = v15;
  if (a3) {
LABEL_12:
  }
    *a3 = v19;
LABEL_13:
  uint64_t v20 = 0LL;
  uint64_t v22 = 0LL;
  if (v12 != -1) {
    goto LABEL_14;
  }
LABEL_15:

  return v22;
}

uint64_t store_dict(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  unsigned int v7 = v6;
  if (!v5 || !v6)
  {
    unsigned __int8 v9 =  createMobileActivationError( (uint64_t)"store_dict",  583LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid input(s).");
    id v8 = 0LL;
    int v14 = -1;
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  id v29 = 0LL;
  id v8 =  +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  200LL,  0LL,  &v29);
  unsigned __int8 v9 = (NSError *)v29;
  if (!v8)
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"store_dict",  591LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v9,  @"Failed to serialize dictionary.");
LABEL_17:
    v24 = MobileActivationError;

    int v14 = -1;
    goto LABEL_20;
  }

  id v10 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  unsigned __int8 v11 = -[NSFileManager fileExistsAtPath:](v10, "fileExistsAtPath:", v5);

  id v12 = v5;
  int v13 = open_dprotected_np((const char *)[v12 fileSystemRepresentation], 1794, 4, 0);
  if (v13 == -1)
  {
    v23 = __error();
    v27 = strerror(*v23);
    MobileActivationError = createMobileActivationError( (uint64_t)"store_dict",  600LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create %@: %s",  v12,  v27);
    goto LABEL_17;
  }

  int v14 = v13;
  if ((v11 & 1) != 0
    || (id v15 = v12, !chmod((const char *)[v15 fileSystemRepresentation], 0x1B6u)))
  {
    id v8 = v8;
    uint64_t v22 = (void *)write(v14, -[NSData bytes](v8, "bytes"), -[NSData length](v8, "length"));
    if (v22 == (void *)-[NSData length](v8, "length"))
    {
      uint64_t v18 = 1LL;
      goto LABEL_11;
    }

    v25 = __error();
    v28 = strerror(*v25);
    id v17 = createMobileActivationError( (uint64_t)"store_dict",  613LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to write data to %@: %s",  v12,  v28);
  }

  else
  {
    v16 = __error();
    v26 = strerror(*v16);
    id v17 = createMobileActivationError( (uint64_t)"store_dict",  607LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to update file permissions for %@: %s",  v15,  v26);
  }

  v24 = v17;

LABEL_20:
  unsigned __int8 v9 = v24;
  if (a3) {
LABEL_9:
  }
    *a3 = v9;
LABEL_10:
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  if (v14 != -1)
  {
LABEL_11:
    close(v14);
    uint64_t v19 = v18;
  }

  return v19;
}

NSMutableDictionary *load_dict(NSMutableDictionary *a1)
{
  if (a1) {
    a1 =  +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  a1);
  }
  return a1;
}

NSString *copy_process_name(int a1)
{
  if (a1
    && (uint64_t v2 = +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection")) != 0LL)
  {
    id v3 = v2;
    pid_t v4 = -[NSXPCConnection processIdentifier](v2, "processIdentifier");
  }

  else
  {
    pid_t v4 = getpid();
  }

  proc_pidpath(v4, buffer, 0x1000u);
  int v5 = strlen(buffer);
  if ((v5 & 0x80000000) == 0)
  {
    while (buffer[v5] != 47)
    {
      if (v5-- <= 0)
      {
        int v5 = -1;
        break;
      }
    }
  }

  __strlcpy_chk(v8, &buffer[v5 + 1], 256LL, 256LL);
  return -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%s", v8);
}

NSInteger numberOfDaysBetweenDates(void *a1, id a2)
{
  id v3 = a2;
  pid_t v4 = v3;
  id v5 = 0LL;
  id v6 = 0LL;
  unsigned int v7 = 0LL;
  NSInteger v8 = 0LL;
  if (a1 && v3)
  {
    id v9 = a1;
    unsigned int v7 = +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar");
    id v16 = 0LL;
    unsigned int v10 = -[NSCalendar rangeOfUnit:startDate:interval:forDate:]( v7,  "rangeOfUnit:startDate:interval:forDate:",  16LL,  &v16,  0LL,  v9);

    id v5 = v16;
    if (v10)
    {
      id v15 = 0LL;
      unsigned int v11 = -[NSCalendar rangeOfUnit:startDate:interval:forDate:]( v7,  "rangeOfUnit:startDate:interval:forDate:",  16LL,  &v15,  0LL,  v4);
      id v6 = v15;
      if (v11)
      {
        id v12 =  -[NSCalendar components:fromDate:toDate:options:]( v7,  "components:fromDate:toDate:options:",  16LL,  v5,  v6,  0LL);
        if (v12)
        {
          int v13 = v12;
          NSInteger v8 = -[NSDateComponents day](v12, "day");

          goto LABEL_9;
        }
      }
    }

    else
    {
      id v6 = 0LL;
    }

    NSInteger v8 = 0LL;
  }

LABEL_9:
  return v8;
}

  return v8;
}

NSMutableString *formatURLRequest(void *a1)
{
  id v1 = a1;
  uint64_t v2 =  +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"\n---------REQUEST START---------\n");
  id v3 = [v1 URL];
  id v4 = [v3 description];
  -[NSMutableString appendFormat:](v2, "appendFormat:", @"URL: %@\n", v4);

  id v5 = [v1 HTTPMethod];
  -[NSMutableString appendFormat:](v2, "appendFormat:", @"METHOD: %@\n", v5);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = [v1 allHTTPHeaderFields];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v12 = [v1 valueForHTTPHeaderField:v11];
        -[NSMutableString appendFormat:](v2, "appendFormat:", @"%@: %@\n", v11, v12);
      }

      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  int v13 = objc_alloc(&OBJC_CLASS___NSString);
  id v14 = [v1 HTTPBody];
  id v15 = -[NSString initWithData:encoding:](v13, "initWithData:encoding:", v14, 4LL);
  -[NSMutableString appendFormat:](v2, "appendFormat:", @"BODY: \n%@\n", v15);

  -[NSMutableString appendString:](v2, "appendString:", @"----------REQUEST END----------\n");
  return v2;
}

NSMutableString *formatURLResponse(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 =  +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"\n---------RESPONSE START---------\n");
  id v8 = +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse, "localizedStringForStatusCode:", a2);
  -[NSMutableString appendFormat:]( v7,  "appendFormat:",  @"HTTP Status Code: %ld (%s)\n",  a2,  -[NSString UTF8String](v8, "UTF8String"));

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v15 = [v9 objectForKeyedSubscript:v14];
        -[NSMutableString appendFormat:](v7, "appendFormat:", @"%@: %@\n", v14, v15, (void)v18);
      }

      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
  }

  id v16 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v5, 4LL);
  -[NSMutableString appendFormat:](v7, "appendFormat:", @"BODY: \n%@\n", v16);

  -[NSMutableString appendString:](v7, "appendString:", @"----------RESPONSE END----------\n");
  return v7;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t is_erase_installed_build()
{
  if (copyUserDataDisposition_onceToken != -1) {
    dispatch_once(&copyUserDataDisposition_onceToken, &__block_literal_global_1);
  }
  return copyUserDataDisposition_dataDisposition & 1;
}

uint64_t is_upgrade_installed_build()
{
  if (copyUserDataDisposition_onceToken != -1) {
    dispatch_once(&copyUserDataDisposition_onceToken, &__block_literal_global_1);
  }
  return (copyUserDataDisposition_dataDisposition >> 1) & 1;
}

id data_migration_supported()
{
  if (!_os_feature_enabled_impl("UserManagement", "LocalUserEnrollment")
    || (os_variant_is_darwinos([@"com.apple.mobileactivationd" UTF8String]) & 1) != 0
    || !xpc_user_sessions_enabled())
  {
    return 0LL;
  }

  if (copyUserDataDisposition_onceToken != -1) {
    dispatch_once(&copyUserDataDisposition_onceToken, &__block_literal_global_1);
  }
  if ((copyUserDataDisposition_dataDisposition & 2) == 0) {
    return 0LL;
  }
  id v1 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
  id v2 = [v1 getBoolAnswer:@"DeviceSupportsMultiUser"];

  return v2;
}

void __copyUserDataDisposition_block_invoke(id a1)
{
  if ((os_variant_is_darwinos([@"com.apple.mobileactivationd" UTF8String]) & 1) == 0) {
    copyUserDataDisposition_dataDisposition = DMGetUserDataDisposition();
  }
}

uint64_t mobileactivationErrorHasDomainAndErrorCode(void *a1, void *a2, id a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 0LL;
  if (v5 && v6)
  {
    do
    {
      id v9 = [v5 domain];
      if ([v9 isEqualToString:v7])
      {
        id v10 = [v5 code];

        if (v10 == a3)
        {
          uint64_t v8 = 1LL;
          goto LABEL_9;
        }
      }

      else
      {
      }

      id v11 = [v5 userInfo];
      id v12 = [v11 objectForKeyedSubscript:NSUnderlyingErrorKey];

      id v5 = v12;
    }

    while (v12);
    uint64_t v8 = 0LL;
  }

BOOL is_virtual_machine()
{
  int v3 = 0;
  size_t v2 = 4LL;
  return !sysctlbyname("kern.hv_vmm_present", &v3, &v2, 0LL, 0LL) && v3 == 1;
}

void sub_342C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

void isSupportedDeviceIdentityClient_cold_1(void *a1)
{
  id v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0(&dword_0, (os_log_s *)&_os_log_default, v2, "%@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1();
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForHTTPHeaderField:");
}