int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;
  v3 = (void *)objc_opt_new(&OBJC_CLASS___ServiceDelegate, argv, envp);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  v2 = "";
  if (*(_BYTE *)(a1 + 48))
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = 0LL;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(const char **)(v6 + v3);
      if (!v7)
      {
        v7 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v12) = v4;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)",  buf,  8u);
          uint64_t v6 = *(void *)(a1 + 32);
          v7 = "<Undefined>";
        }
      }

      v8 = *(const char **)(v6 + v3 + 8);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v15, v4, &v16);
          v8 = "<Undefined>";
        }
      }

      os_log_t v9 = os_log_create(v7, v8);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v9;
      if (v9)
      {
        ++v5;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v12 = v7;
          __int16 v13 = 2080;
          v14 = v8;
          _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Created log object %s: %s",  buf,  0x16u);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = v7;
        __int16 v13 = 2080;
        v14 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to create os_log_t object %s: %s!",  buf,  0x16u);
      }

      ++v4;
      unint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16LL;
    }

    while (v4 < v10);
    v2 = "setExportedInterface:" + 21;
  }

  else
  {
    LODWORD(v10) = 0;
    int v5 = 0;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 325);
    LODWORD(v12) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Created %d log object(s)!",  buf,  8u);
    LODWORD(v10) = *(unsigned __int8 *)(a1 + 48);
  }

  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v10;
}

uint64_t ascii_to_hex(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 >= 2)
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = a3 >> 1;
    do
    {
      uint64_t v5 = 0LL;
      __int16 v13 = -21846;
      char v6 = 1;
      do
      {
        char v7 = v6;
        int v8 = *(unsigned __int8 *)(a2 + (v5 | (2 * v3)));
        unsigned int v9 = v8 - 48;
        unsigned int v10 = v8 - 65;
        else {
          char v11 = v8 - 87;
        }
        char v12 = v8 - 55;
        if (v10 > 5) {
          char v12 = v11;
        }
        if (v9 < 0xA) {
          char v12 = v9;
        }
        *((_BYTE *)&v13 + v5) = v12;
        uint64_t v5 = 1LL;
        char v6 = 0;
      }

      while ((v7 & 1) != 0);
      *(_BYTE *)(result + v3++) = HIBYTE(v13) | (16 * v13);
    }

    while (v3 != v4);
  }

  return result;
}

unsigned __int8 *printBytes(unsigned __int8 *result, uint64_t a2, char *a3, int a4)
{
  if (result)
  {
    uint64_t v4 = a2;
    if (a2)
    {
      char v7 = result;
      do
      {
        unsigned int v8 = *v7++;
        result = (unsigned __int8 *)printf(a3, v8);
        --v4;
      }

      while (v4);
      if (a4) {
        return (unsigned __int8 *)putchar(10);
      }
    }
  }

  return result;
}

const char *removeNewline(const char *a1)
{
  size_t v2 = strlen(a1);
  if (v2 && a1[v2 - 1] == 10) {
    a1[v2 - 1] = 0;
  }
  return a1;
}

char *createHexString(uint64_t a1, unint64_t a2, int a3)
{
  if (a1 && a2)
  {
    if ((a2 & 0x8000000000000000LL) == 0)
    {
      if (!a3)
      {
        size_t v5 = (2 * a2) | 1;
LABEL_10:
        char v7 = (char *)malloc(v5);
        if (v7)
        {
          unint64_t v8 = 0LL;
          unsigned int v9 = v7;
          v14 = v7;
          unsigned int v10 = v7;
          size_t v11 = v5;
          while (a3)
          {
            if (v8 >= a2 - 1)
            {
              char v12 = v10;
              size_t v13 = v11;
              goto LABEL_17;
            }

            snprintf(v10, v11, "%02X ");
LABEL_18:
            ++v8;
            v11 -= 3LL;
            v10 += 3;
            v9 += 2;
            v5 -= 2LL;
            if (a2 == v8) {
              return v14;
            }
          }

          char v12 = v9;
          size_t v13 = v5;
LABEL_17:
          snprintf(v12, v13, "%02X");
          goto LABEL_18;
        }

        goto LABEL_21;
      }

      if (is_mul_ok(a2, 3uLL))
      {
        size_t v5 = 3 * a2;
        goto LABEL_10;
      }
    }

    do
LABEL_21:
      result = (char *)malloc(0xEuLL);
    while (!result);
    strcpy(result, "<print error>");
    return result;
  }

  result = (char *)malloc(7uLL);
  if (result) {
    strcpy(result, "(null)");
  }
  return result;
}

uint64_t obfuscatedPointer(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = obfuscatedPointer_salt;
    if (!obfuscatedPointer_salt)
    {
      uint64_t v2 = random();
      obfuscatedPointer_salt = v2;
    }

    return v1 + v2;
  }

  return result;
}

BOOL getMemoryUse(void *a1, void *a2, void *a3)
{
  kern_return_t v7;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;
  v33 = -1431655766;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31 = v6;
  v32 = v6;
  v29 = v6;
  v30 = v6;
  v27 = v6;
  v28 = v6;
  v25 = v6;
  v26 = v6;
  v23 = v6;
  v24 = v6;
  v21 = v6;
  v22 = v6;
  v19 = v6;
  v20 = v6;
  v18 = v6;
  int v16 = v6;
  v17 = v6;
  v14 = v6;
  v15 = v6;
  char v12 = v6;
  size_t v13 = v6;
  *(_OWORD *)task_info_out = v6;
  size_t v11 = v6;
  task_info_outCnt = 93;
  char v7 = task_info(mach_task_self_, 0x16u, task_info_out, &task_info_outCnt);
  if (!v7)
  {
    if (a1) {
      *a1 = v11;
    }
    if (a2) {
      *a2 = *(void *)task_info_out;
    }
    if (a3) {
      *a3 = v19;
    }
  }

  return v7 == 0;
}

void init_logging()
{
}

CFStringRef errorDescription(void *a1, unint64_t a2)
{
  id v3 = a1;
  if (![v3 isEqualToString:@"MFAACertificateManagerErrorDomain"]
    && ![v3 isEqualToString:@"MFAATokenManagerErrorDomain"])
  {
    if (![v3 isEqualToString:@"MFAAPairingManagerErrorDomain"])
    {
      size_t v5 = @"An unknown error has occurred.";
      goto LABEL_11;
    }

    if (a2 > 0xFFFFFFFFFFFFFFFBLL)
    {
      uint64_t v4 = &off_1000745F0 + a2 + 4;
      goto LABEL_5;
    }

LABEL_9:
    size_t v5 = 0LL;
    goto LABEL_11;
  }

  if (a2 <= 0xFFFFFFFFFFFFFFF9LL) {
    goto LABEL_9;
  }
  uint64_t v4 = &off_1000745C0 + a2 + 6;
LABEL_5:
  size_t v5 = *v4;
LABEL_11:

  return v5;
}

unint64_t systemInfo_getCurrentUnixTime()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0) {
    return 0LL;
  }
  else {
    return v3;
  }
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0) {
    return 0LL;
  }
  else {
    return v3;
  }
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global);
  }
  return systemInfo_isInternalBuild_internalBuild;
}

void __systemInfo_isInternalBuild_block_invoke(id a1)
{
  systemInfo_isInternalBuild_internalBuild = MGGetBoolAnswer(@"InternalBuild");
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_2);
  }
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke(id a1)
{
  double v1 = (const void *)MGCopyAnswer(@"ReleaseType", 0LL);
  if (v1)
  {
    double v2 = v1;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v1, @"Beta") != 0;
    CFRelease(v2);
  }

  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }
}

uint64_t systemInfo_systemSupportsPearl()
{
  return 0LL;
}

uint64_t systemInfo_systemSupportsWAPI()
{
  return 0LL;
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer(@"DeviceClass", 0LL);
}

uint64_t systemInfo_isHomePod()
{
  return 0LL;
}

uint64_t systemInfo_copyRegionCode()
{
  return 0LL;
}

uint64_t systemInfo_copyProductType()
{
  return 0LL;
}

uint64_t systemInfo_copyProductVersion()
{
  return 0LL;
}

id convertNSDataToNSString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    id v6 = v3;
    char v7 = (unsigned __int8 *)[v6 bytes];
    unint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    if ([v6 length])
    {
      unint64_t v9 = 0LL;
      do
        -[NSMutableString appendFormat:](v8, "appendFormat:", v4, v7[v9++]);
      while (v9 < (unint64_t)[v6 length]);
    }

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v8));
  }

  else
  {
    unsigned int v10 = 0LL;
  }

  return v10;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  id v1 = a1;
  double v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"\u202A\u202B\u202C\u202D"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 stringByTrimmingCharactersInSet:v2]);

  return v3;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  id v1 = a1;
  double v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"\u202A\u202B\u202C\u202D"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 componentsSeparatedByCharactersInSet:v2]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:&stru_100079E18]);
  return v4;
}

id convertNSStringToNSData(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    double v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet hexadecimalCharacterSet](&OBJC_CLASS___NSCharacterSet, "hexadecimalCharacterSet"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 invertedSet]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 componentsSeparatedByCharactersInSet:v3]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:&stru_100079E18]);

    id v1 = v5;
    id v6 = (const char *)[v1 UTF8String];
    size_t v7 = strlen(v6) >> 1;
    unint64_t v8 = malloc(v7);
    if (v6 && (unint64_t)[v1 length] >= 2)
    {
      unint64_t v9 = 0LL;
      int v10 = 0;
      do
      {
        uint64_t v11 = 0LL;
        __int16 v22 = -21846;
        char v12 = 1;
        do
        {
          char v13 = v12;
          int v14 = v6[v11 | (2 * v10)];
          unsigned int v15 = v14 - 48;
          unsigned int v16 = v14 - 65;
          else {
            char v17 = v14 - 87;
          }
          char v18 = v14 - 55;
          if (v16 > 5) {
            char v18 = v17;
          }
          if (v15 < 0xA) {
            char v18 = v15;
          }
          *((_BYTE *)&v22 + v11) = v18;
          uint64_t v11 = 1LL;
          char v12 = 0;
        }

        while ((v13 & 1) != 0);
        v8[v9] = HIBYTE(v22) | (16 * v22);
        unint64_t v9 = (v10 + 1);
        unint64_t v19 = (unint64_t)[v1 length];
        int v10 = v9;
      }

      while (v9 < v19 >> 1);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v8, v7));
    if (v8) {
      free(v8);
    }
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

uint64_t classImplementsMethodsInProtocol(void *a1, void *a2, BOOL a3, BOOL a4, void *a5)
{
  unint64_t v9 = a2;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  unsigned int outCount = 0;
  uint64_t v11 = protocol_copyMethodDescriptionList(v9, a3, a4, &outCount);
  char v12 = v11;
  if (outCount)
  {
    unint64_t v13 = 0LL;
    p_name = &v11->name;
    do
    {
      if (([a1 instancesRespondToSelector:*p_name] & 1) == 0)
      {
        unsigned int v15 = NSStringFromSelector(*p_name);
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        [v10 addObject:v16];
      }

      ++v13;
      p_name += 2;
    }

    while (v13 < outCount);
  }

  free(v12);
  if (outCount && [v10 count])
  {
    uint64_t v17 = 0LL;
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  uint64_t v17 = 1LL;
  if (a5) {
LABEL_11:
  }
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v10));
LABEL_12:

  return v17;
}

uint64_t isNSObjectNull(void *a1)
{
  if (!a1) {
    return 1LL;
  }
  id v1 = a1;
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v3 = [v1 isEqual:v2];

  return (uint64_t)v3;
}

id NSObjectIfNotNull(void *a1)
{
  id v1 = a1;
  if ((isNSObjectNull(v1) & 1) != 0) {
    id v2 = 0LL;
  }
  else {
    id v2 = v1;
  }

  return v2;
}

uint64_t isNSObjectEqual(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return (uint64_t)[(id)a1 isEqual:a2];
  }
  else {
    return 1LL;
  }
}

id castNSObjectToType(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3 && (objc_opt_isKindOfClass(v3, a2) & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

id readJSONFile(uint64_t a1)
{
  if (!a1)
  {
    id v3 = 0LL;
    return v3;
  }

  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", a1));
  if (!v1) {
    goto LABEL_5;
  }
  uint64_t v5 = 0LL;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v1,  0LL,  &v5));
  id v3 = v2;
  if (v5)
  {

LABEL_5:
    id v3 = 0LL;
  }

  return v3;
}

id writeJSONFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4) {
    goto LABEL_7;
  }
  if (!v3) {
    id v3 = &__NSDictionary0__struct;
  }
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v3))
  {
    uint64_t v9 = 0LL;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v3,  1LL,  &v9));
    id v6 = v5;
    if (v9) {
      id v7 = 0LL;
    }
    else {
      id v7 = [v5 writeToFile:v4 atomically:1];
    }
  }

  else
  {
LABEL_7:
    id v7 = 0LL;
  }

  return v7;
}

id base64EncodeArray(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)v7),  "base64EncodedStringWithOptions:",  0,  (void)v10));
        if (v8) {
          [v2 addObject:v8];
        }

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  return v2;
}

id base64DecodeArray(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v7);
        uint64_t v9 = objc_alloc(&OBJC_CLASS___NSData);
        __int128 v10 = -[NSData initWithBase64EncodedString:options:]( v9,  "initWithBase64EncodedString:options:",  v8,  0LL,  (void)v12);
        if (v10) {
          [v2 addObject:v10];
        }

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  return v2;
}

id logObjectForModule(int a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects <= a1;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      logObjectForModule_cold_1();
    }
    id v3 = &_os_log_default;
    id v2 = &_os_log_default;
  }

  else
  {
    id v3 = *(id *)(gLogObjects + 8LL * a1);
  }

  return v3;
}

void sub_100004624( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_100004A0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100004CE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id _splitASN1Tokens(void *a1)
{
  id v1 = a1;
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 3;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _init].cold.2();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _splitASN1Tokens_cold_13();
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    id v5 = (char *)*(id *)(gLogObjects + 16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _init].cold.2();
    }
    id v5 = (char *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG)) {
    _splitASN1Tokens_cold_11(v1, v5);
  }

  id v52 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = v1;
  uint64_t v8 = [v7 bytes];
  id v9 = v7;
  id v10 = [v9 bytes];
  id v51 = v9;
  __int128 v11 = (char *)[v9 length];
  if (gLogObjects && gNumLogObjects >= 3)
  {
    uint64_t v12 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _init].cold.2();
    }
    uint64_t v12 = (os_log_s *)&_os_log_default;
    id v13 = &_os_log_default;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    _splitASN1Tokens_cold_9((uint64_t)v8, v12);
  }
  uint64_t v14 = &v11[(void)v10];

  if (gLogObjects && gNumLogObjects >= 3)
  {
    uint64_t v15 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _init].cold.2();
    }
    uint64_t v15 = (os_log_s *)&_os_log_default;
    id v16 = &_os_log_default;
  }

  unint64_t v17 = (unint64_t)(v14 - 1);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    _splitASN1Tokens_cold_7((uint64_t)(v14 - 1), v15);
  }

  if ((unint64_t)v8 < v17)
  {
    char v18 = v14;
    while (1)
    {
      uint64_t v19 = gLogObjects;
      int v20 = gNumLogObjects;
      if (!gLogObjects || gNumLogObjects < 3)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v58 = 134218240;
          *(void *)&v58[4] = v19;
          *(_WORD *)&v58[12] = 1024;
          *(_DWORD *)&v58[14] = v20;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  v58,  0x12u);
        }

        id v22 = &_os_log_default;
        v23 = (os_log_s *)&_os_log_default;
      }

      else
      {
        v23 = (os_log_s *)*(id *)(gLogObjects + 16);
      }

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        _splitASN1Tokens_cold_3((uint64_t)v59, (uint64_t)v8);
      }

      v53[0] = v8;
      v53[1] = v18 - v8;
      memset(v58, 0, 24);
      uint64_t v24 = gLogObjects;
      int v25 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v26 = (os_log_s *)*(id *)(gLogObjects + 16);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v61 = v24;
          __int16 v62 = 1024;
          int v63 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
        }

        id v27 = &_os_log_default;
        v26 = (os_log_s *)&_os_log_default;
      }

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        _splitASN1Tokens_cold_5(v56, v57, v26);
      }

      uint64_t v29 = *(void *)&v58[8];
      uint64_t v28 = *(void *)&v58[16];
      uint64_t v30 = gLogObjects;
      int v31 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v32 = (os_log_s *)*(id *)(gLogObjects + 16);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v61 = v30;
          __int16 v62 = 1024;
          int v63 = v31;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
        }

        id v33 = &_os_log_default;
        v32 = (os_log_s *)&_os_log_default;
      }

      uint64_t v34 = v29 + v28 - 1;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        _splitASN1Tokens_cold_4((uint64_t)v55, v34);
      }

      uint64_t v35 = gLogObjects;
      int v36 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v37 = (os_log_s *)*(id *)(gLogObjects + 16);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v61 = v35;
          __int16 v62 = 1024;
          int v63 = v36;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
        }

        id v38 = &_os_log_default;
        v37 = (os_log_s *)&_os_log_default;
      }

      uint64_t v39 = v34 - (void)v8 + 1;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v61 = v39;
        _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "itemLength: %zu", buf, 0xCu);
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v8, v39));
      [v52 addObject:v40];

      uint64_t v42 = *(void *)&v58[8];
      uint64_t v41 = *(void *)&v58[16];
      uint64_t v43 = gLogObjects;
      int v44 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v45 = (os_log_s *)*(id *)(gLogObjects + 16);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v61 = v43;
          __int16 v62 = 1024;
          int v63 = v44;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
        }

        id v46 = &_os_log_default;
        v45 = (os_log_s *)&_os_log_default;
      }

      uint64_t v8 = (_BYTE *)(v42 + v41);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        _splitASN1Tokens_cold_3((uint64_t)v54, (uint64_t)v8);
      }
    }

    id v52 = 0LL;
  }

LABEL_83:
  if (gLogObjects && gNumLogObjects >= 3)
  {
    v47 = (os_log_s *)*(id *)(gLogObjects + 16);
    v48 = v51;
  }

  else
  {
    v48 = v51;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _init].cold.2();
    }
    v47 = (os_log_s *)&_os_log_default;
    id v49 = &_os_log_default;
  }

  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
    _splitASN1Tokens_cold_1();
  }

  return v52;
}

LABEL_60:
  if (v7 && [v7 length])
  {
    if (([*(id *)(a1 + 32) disableFairPlaySAP] & 1) != 0
      || ([*(id *)(a1 + 32) bypassFairPlaySAPSignatureVerification] & 1) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        uint64_t v29 = (os_log_s *)*(id *)(gLogObjects + 16);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[MFAANetwork _init].cold.2();
        }
        uint64_t v29 = (os_log_s *)&_os_log_default;
        id v38 = &_os_log_default;
      }

      v89 = v8;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Bypassing verification of FairPlay SAP signature from server...",  buf,  2u);
      }

  if (!v7 || ![v7 length])
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      uint64_t v29 = (os_log_s *)*(id *)(gLogObjects + 16);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _init].cold.2();
      }
      uint64_t v29 = (os_log_s *)&_os_log_default;
      id v33 = &_os_log_default;
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "responseData is empty!", buf, 2u);
    }

    id v27 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -6LL));
    if (gLogObjects && gNumLogObjects >= 3)
    {
      int v31 = (os_log_s *)*(id *)(gLogObjects + 16);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _init].cold.2();
      }
      int v31 = (os_log_s *)&_os_log_default;
      uint64_t v34 = &_os_log_default;
    }

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
    }
    goto LABEL_96;
  }

  if (([*(id *)(a1 + 32) disableFairPlaySAP] & 1) != 0
    || ([*(id *)(a1 + 32) bypassFairPlaySAPSignatureVerification] & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      id v27 = (NSData *)*(id *)(gLogObjects + 16);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _init].cold.2();
      }
      id v27 = (NSData *)&_os_log_default;
      uint64_t v35 = &_os_log_default;
    }

    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  OS_LOG_TYPE_DEFAULT,  "Bypassing verification of FairPlay SAP signature from server...",  buf,  2u);
    }

    goto LABEL_104;
  }

  if ([*(id *)(a1 + 32) forceFairPlaySAPFailure])
  {
    id v27 = (NSData *)objc_claimAutoreleasedReturnValue([@"1234" dataUsingEncoding:4]);
  }

  else
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue([v16 allHeaderFields]);
    v74 = (void *)objc_claimAutoreleasedReturnValue([v73 objectForKeyedSubscript:@"signature"]);

    if (v74) {
      id v27 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v74,  0LL);
    }
    else {
      id v27 = 0LL;
    }
  }

  buf[0] = 0;
  v79 = *(void **)(a1 + 32);
  v100 = 0LL;
  v80 = [v79 _verifyFairPlaySignatureSync:v27 forData:v7 timedOut:buf error:&v100];
  v81 = v100;
  v82 = v81;
  if (buf[0])
  {
    v83 = a1;
    v84 = logObjectForModule(2);
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _verifyFairPlaySignatureSync:forData:timedOut:error:].cold.1();
    }

    v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -4LL));
    v87 = logObjectForModule(2);
    v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      goto LABEL_181;
    }
    goto LABEL_180;
  }

  if ((v80 & 1) == 0)
  {
    v83 = a1;
    v89 = logObjectForModule(2);
    v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.14();
    }

    v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -6LL));
    v91 = logObjectForModule(2);
    v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
    if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      goto LABEL_181;
    }
LABEL_180:
    -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
LABEL_181:

    (*(void (**)(void))(*(void *)(v83 + 40) + 16LL))();
    goto LABEL_97;
  }

LABEL_104:
  v99 = 0LL;
  int v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v99));
  v37 = v99;
  if (gLogObjects) {
    id v38 = gNumLogObjects <= 2;
  }
  else {
    id v38 = 1;
  }
  uint64_t v39 = !v38;
  v94 = v37;
  if (v37)
  {
    if (v39)
    {
      v40 = (os_log_s *)*(id *)(gLogObjects + 16);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _init].cold.2();
      }
      v40 = (os_log_s *)&_os_log_default;
      uint64_t v42 = &_os_log_default;
    }

    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_12();
    }

    uint64_t v43 = objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -6LL));
    if (gLogObjects && gNumLogObjects >= 3)
    {
      int v44 = (os_log_s *)*(id *)(gLogObjects + 16);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _init].cold.2();
      }
      int v44 = (os_log_s *)&_os_log_default;
      v45 = &_os_log_default;
    }

    id v46 = (void *)v43;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    v92 = a1;
    if (v39)
    {
      uint64_t v41 = (os_log_s *)*(id *)(gLogObjects + 16);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _init].cold.2();
      }
      uint64_t v41 = (os_log_s *)&_os_log_default;
      v47 = &_os_log_default;
    }

    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_8();
    }

    v48 = objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"tokens"]);
    if (v48
      && (id v49 = (void *)v48,
          v50 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"tokens"]),
          id v51 = objc_opt_class(&OBJC_CLASS___NSArray),
          isKindOfClass = objc_opt_isKindOfClass(v50, v51),
          v50,
          v49,
          (isKindOfClass & 1) != 0))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"tokens"]);
      id v46 = v53;
      if (v53 && [v53 count] == (id)2)
      {
        v54 = logObjectForModule(2);
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
          __61__MFAANetwork__requestActivationForToken_withUUID_withReply___block_invoke_155_cold_10();
        }
        v93 = v36;

        v56 = v46;
        v57 = base64DecodeArray(v46);
        v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
        v59 = logObjectForModule(2);
        v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
          __61__MFAANetwork__requestActivationForToken_withUUID_withReply___block_invoke_155_cold_9();
        }

        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        __int16 v62 = v58;
        int v63 = [v62 countByEnumeratingWithState:&v95 objects:v102 count:16];
        if (v63)
        {
          v64 = v63;
          v65 = *(void *)v96;
          do
          {
            for (i = 0LL; i != v64; i = (char *)i + 1)
            {
              if (*(void *)v96 != v65) {
                objc_enumerationMutation(v62);
              }
              [v61 appendData:*(void *)(*((void *)&v95 + 1) + 8 * (void)i)];
            }

            v64 = [v62 countByEnumeratingWithState:&v95 objects:v102 count:16];
          }

          while (v64);
        }

        v67 = logObjectForModule(2);
        v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
          __61__MFAANetwork__requestActivationForToken_withUUID_withReply___block_invoke_155_cold_8();
        }

        (*(void (**)(void))(*(void *)(v92 + 40) + 16LL))();
        int v36 = v93;
        id v46 = v56;
      }

      else
      {
        v75 = logObjectForModule(2);
        v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
          __61__MFAANetwork__requestActivationForToken_withUUID_withReply___block_invoke_155_cold_7();
        }

        __int16 v62 = (id)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -6LL));
        v77 = logObjectForModule(2);
        v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
        }

        (*(void (**)(void))(*(void *)(v92 + 40) + 16LL))();
      }
    }

    else
    {
      v69 = logObjectForModule(2);
      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        __61__MFAANetwork__requestActivationForToken_withUUID_withReply___block_invoke_155_cold_5();
      }

      id v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -6LL));
      v71 = logObjectForModule(2);
      v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
      }

      (*(void (**)(void))(*(void *)(v92 + 40) + 16LL))();
    }
  }

LABEL_98:
}

  if (v7 && [v7 length])
  {
    if (([*(id *)(a1 + 32) disableFairPlaySAP] & 1) != 0
      || ([*(id *)(a1 + 32) bypassFairPlaySAPSignatureVerification] & 1) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        uint64_t v29 = (os_log_s *)*(id *)(gLogObjects + 8);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[MFAANetwork _init].cold.2();
        }
        uint64_t v29 = (os_log_s *)&_os_log_default;
        id v38 = &_os_log_default;
      }

      v93 = v8;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Bypassing verification of FairPlay SAP signature from server...",  buf,  2u);
      }

LABEL_103:
      v90 = 0LL;
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v90));
      v40 = v90;
      uint64_t v41 = v40;
      if (gLogObjects) {
        uint64_t v42 = gNumLogObjects <= 2;
      }
      else {
        uint64_t v42 = 1;
      }
      uint64_t v43 = !v42;
      if (v40)
      {
        if (v43)
        {
          int v44 = (os_log_s *)*(id *)(gLogObjects + 16);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[MFAANetwork _init].cold.2();
          }
          int v44 = (os_log_s *)&_os_log_default;
          id v46 = &_os_log_default;
        }

        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_12();
        }

        v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -6LL));
        if (gLogObjects && gNumLogObjects >= 3)
        {
          v48 = (os_log_s *)*(id *)(gLogObjects + 16);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[MFAANetwork _init].cold.2();
          }
          v48 = (os_log_s *)&_os_log_default;
          id v49 = &_os_log_default;
        }

        if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          goto LABEL_146;
        }
      }

      else
      {
        if (v43)
        {
          v45 = (os_log_s *)*(id *)(gLogObjects + 16);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[MFAANetwork _init].cold.2();
          }
          v45 = (os_log_s *)&_os_log_default;
          v50 = &_os_log_default;
        }

        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_8();
        }

        id v51 = objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"ppid"]);
        if (v51)
        {
          id v52 = (void *)v51;
          v53 = objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"locale"]);
          if (v53)
          {
            v54 = (void *)v53;
            v55 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"ppid_metadata"]);

            if (v55)
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"locale"]);
              if (v47)
              {
                v56 = *(void *)(a1 + 40);
                v57 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"ppid"]);
                v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  v47));
                v59 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"ppid_metadata"]);
                (*(void (**)(uint64_t, void *, void *, void *, void))(v56 + 16))(v56, v57, v58, v59, 0LL);
              }

              else
              {
                v78 = logObjectForModule(2);
                v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
                if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                  __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_7( v79,  v80,  v81,  v82,  v83,  v84,  v85,  v86);
                }

                v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -6LL));
                v87 = logObjectForModule(2);
                v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
                if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
                  -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
                }

                (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
              }

              uint64_t v8 = v89;

              goto LABEL_147;
            }
          }

          else
          {
          }
        }

        __int16 v62 = logObjectForModule(2);
        int v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_5();
        }

        v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -6LL));
        v64 = logObjectForModule(2);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
LABEL_146:

          (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
          uint64_t v8 = v89;
LABEL_147:

          goto LABEL_162;
        }
      }

      -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
      goto LABEL_146;
    }

    if ([*(id *)(a1 + 32) forceFairPlaySAPFailure])
    {
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([@"1234" dataUsingEncoding:4]);
    }

    else
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue([v16 allHeaderFields]);
      uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:@"signature"]);

      if (v61) {
        uint64_t v29 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v61,  0LL);
      }
      else {
        uint64_t v29 = 0LL;
      }
    }

    buf[0] = 0;
    v65 = *(void **)(a1 + 32);
    v91 = 0LL;
    v66 = [v65 _verifyFairPlaySignatureSync:v29 forData:v7 timedOut:buf error:&v91];
    v67 = v91;
    v68 = v67;
    if (buf[0])
    {
      v69 = v8;
      v70 = logObjectForModule(2);
      v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _verifyFairPlaySignatureSync:forData:timedOut:error:].cold.1();
      }

      v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -4LL));
      v73 = logObjectForModule(2);
      v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
      if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        goto LABEL_161;
      }
    }

    else
    {
      if ((v66 & 1) != 0)
      {
        v89 = v8;

        goto LABEL_103;
      }

      v69 = v8;
      v75 = logObjectForModule(2);
      v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.14();
      }

      v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -6LL));
      v77 = logObjectForModule(2);
      v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
LABEL_161:

        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        uint64_t v8 = v69;
        goto LABEL_162;
      }
    }

    -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
    goto LABEL_161;
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    uint64_t v30 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _init].cold.2();
    }
    uint64_t v30 = (os_log_s *)&_os_log_default;
    uint64_t v34 = &_os_log_default;
  }

  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "responseData is empty!", buf, 2u);
  }

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAATokenManagerErrorDomain",  -6LL));
  if (gLogObjects && gNumLogObjects >= 3)
  {
    int v36 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _init].cold.2();
    }
    int v36 = (os_log_s *)&_os_log_default;
    v37 = &_os_log_default;
  }

  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
LABEL_162:
}

      v95 = 0LL;
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v95));
      v40 = v95;
      uint64_t v41 = v40;
      if (gLogObjects) {
        uint64_t v42 = gNumLogObjects <= 1;
      }
      else {
        uint64_t v42 = 1;
      }
      uint64_t v43 = !v42;
      if (v40)
      {
        if (v43)
        {
          int v44 = (os_log_s *)*(id *)(gLogObjects + 8);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[MFAANetwork _init].cold.2();
          }
          int v44 = (os_log_s *)&_os_log_default;
          id v46 = &_os_log_default;
        }

        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_12();
        }

        v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  -6LL));
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v48 = (os_log_s *)*(id *)(gLogObjects + 8);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[MFAANetwork _init].cold.2();
          }
          v48 = (os_log_s *)&_os_log_default;
          id v49 = &_os_log_default;
        }

        if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          goto LABEL_150;
        }
      }

      else
      {
        if (v43)
        {
          v45 = (os_log_s *)*(id *)(gLogObjects + 8);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[MFAANetwork _init].cold.2();
          }
          v45 = (os_log_s *)&_os_log_default;
          v50 = &_os_log_default;
        }

        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_8();
        }

        id v51 = objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"ppid"]);
        if (v51)
        {
          id v52 = (void *)v51;
          v53 = objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"locale"]);
          if (v53)
          {
            v54 = (void *)v53;
            v55 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"ppid_metadata"]);

            if (v55)
            {
              v56 = *(void **)(a1 + 40);
              v57 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"ppid"]);
              LOBYTE(v56) = [v56 isEqualToString:v57];

              if ((v56 & 1) == 0)
              {
                v58 = logObjectForModule(1);
                v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
                  __98__MFAANetwork__requestMetadataForCertSerial_issuerSeq_ppid_requestedLocale_requestInfo_withReply___block_invoke_168_cold_8( a1 + 40,  v39);
                }
              }

              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", @"locale", v93));
              if (v47)
              {
                v60 = *(void *)(a1 + 48);
                uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"ppid"]);
                __int16 v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  v47));
                int v63 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"ppid_metadata"]);
                (*(void (**)(uint64_t, void *, void *, void *, void))(v60 + 16))(v60, v61, v62, v63, 0LL);
              }

              else
              {
                v82 = logObjectForModule(1);
                v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
                if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                  __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_7( v83,  v84,  v85,  v86,  v87,  v88,  v89,  v90);
                }

                uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  -6LL));
                v91 = logObjectForModule(1);
                v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
                if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
                  -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
                }

                (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
              }

              uint64_t v8 = v94;

              goto LABEL_151;
            }
          }

          else
          {
          }
        }

        v66 = logObjectForModule(1);
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          __98__MFAANetwork__requestMetadataForCertSerial_issuerSeq_ppid_requestedLocale_requestInfo_withReply___block_invoke_168_cold_5();
        }

        v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  -6LL));
        v68 = logObjectForModule(1);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
LABEL_150:

          (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
          uint64_t v8 = v93;
LABEL_151:

          goto LABEL_166;
        }
      }

      -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
      goto LABEL_150;
    }

    if ([*(id *)(a1 + 32) forceFairPlaySAPFailure])
    {
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([@"1234" dataUsingEncoding:4]);
    }

    else
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue([v16 allHeaderFields]);
      v65 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:@"signature"]);

      if (v65) {
        uint64_t v29 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v65,  0LL);
      }
      else {
        uint64_t v29 = 0LL;
      }
    }

    buf[0] = 0;
    v69 = *(void **)(a1 + 32);
    v96 = 0LL;
    v70 = [v69 _verifyFairPlaySignatureSync:v29 forData:v7 timedOut:buf error:&v96];
    v71 = v96;
    v72 = v71;
    if (buf[0])
    {
      v73 = v8;
      v74 = logObjectForModule(1);
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _verifyFairPlaySignatureSync:forData:timedOut:error:].cold.1();
      }

      v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  -4LL));
      v77 = logObjectForModule(1);
      v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      if (!os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        goto LABEL_165;
      }
    }

    else
    {
      if ((v70 & 1) != 0)
      {
        v93 = v8;

        goto LABEL_103;
      }

      v73 = v8;
      v79 = logObjectForModule(1);
      v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.14();
      }

      v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  -6LL));
      v81 = logObjectForModule(1);
      v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (!os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
LABEL_165:

        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        uint64_t v8 = v73;
        goto LABEL_166;
      }
    }

    -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
    goto LABEL_165;
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v30 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _init].cold.2();
    }
    uint64_t v30 = (os_log_s *)&_os_log_default;
    uint64_t v34 = &_os_log_default;
  }

  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "responseData is empty!", buf, 2u);
  }

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  -6LL));
  if (gLogObjects && gNumLogObjects >= 2)
  {
    int v36 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _init].cold.2();
    }
    int v36 = (os_log_s *)&_os_log_default;
    v37 = &_os_log_default;
  }

  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_166:
}

      v129 = 0LL;
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v129));
      uint64_t v41 = v129;
      uint64_t v42 = v41;
      uint64_t v43 = v26[245];
      if (v43) {
        int v44 = gNumLogObjects <= 1;
      }
      else {
        int v44 = 1;
      }
      v45 = !v44;
      if (v41)
      {
        id v46 = v41;
        if (v45)
        {
          v47 = v40;
          v48 = (os_log_s *)*(id *)(v43 + 8);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[MFAANetwork _init].cold.2();
          }
          v47 = v40;
          v48 = (os_log_s *)&_os_log_default;
          v50 = &_os_log_default;
        }

        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_12();
        }

        id v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  -6LL));
        if (gLogObjects && gNumLogObjects >= 2)
        {
          id v52 = (os_log_s *)*(id *)(gLogObjects + 8);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[MFAANetwork _init].cold.2();
          }
          id v52 = (os_log_s *)&_os_log_default;
          v53 = &_os_log_default;
        }

        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
        }

        (*(void (**)(void))(*(void *)(v128 + 64) + 16LL))();
        v40 = v47;
        uint64_t v42 = v46;
        goto LABEL_186;
      }

      if (v45)
      {
        id v49 = (os_log_s *)*(id *)(v43 + 8);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[MFAANetwork _init].cold.2();
        }
        id v49 = (os_log_s *)&_os_log_default;
        v54 = &_os_log_default;
      }

      v127 = v8;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_8();
      }

      id v51 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:@"certificates"]);
      if (!v51) {
        goto LABEL_168;
      }
      v55 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v51, v55) & 1) == 0 || [v51 count] != (id)1) {
        goto LABEL_168;
      }
      v56 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndexedSubscript:0]);
      v57 = objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"cert_serial"]);
      if (v57)
      {
        v125 = (void *)v57;
        v58 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndexedSubscript:0]);
        v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"cert_serial"]);
        v60 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v59, v60) & 1) != 0)
        {
          v121 = v59;
          v123 = v58;
          v119 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndexedSubscript:0]);
          uint64_t v61 = objc_claimAutoreleasedReturnValue([v119 objectForKeyedSubscript:@"cert_code"]);
          if (v61)
          {
            v117 = (void *)v61;
            __int16 v62 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndexedSubscript:0]);
            int v63 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKeyedSubscript:@"cert_code"]);
            v64 = objc_opt_class(&OBJC_CLASS___NSNumber);
            isKindOfClass = objc_opt_isKindOfClass(v63, v64);

            if ((isKindOfClass & 1) != 0)
            {
              v65 = logObjectForModule(2);
              v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
                __60__MFAANetwork__validateCertSerial_issuerSeq_ppid_withReply___block_invoke_cold_12();
              }

              v67 = objc_alloc(&OBJC_CLASS___NSData);
              v68 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndexedSubscript:0]);
              v69 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:@"cert_serial"]);
              v70 = -[NSData initWithBase64EncodedString:options:]( v67,  "initWithBase64EncodedString:options:",  v69,  0LL);

              v71 = logObjectForModule(2);
              v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
                __60__MFAANetwork__validateCertSerial_issuerSeq_ppid_withReply___block_invoke_cold_11();
              }

              v126 = v70;
              if (-[NSData isEqualToData:](v70, "isEqualToData:", *(void *)(v128 + 40)))
              {
                v122 = v16;
                v124 = v40;
                v73 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndexedSubscript:0]);
                v74 = (void *)objc_claimAutoreleasedReturnValue([v73 objectForKeyedSubscript:@"cert_code"]);
                v75 = [v74 intValue];

                v76 = v75 - 1000;
                v77 = 0;
                v78 = 1;
                v79 = 1;
                switch(v76)
                {
                  case 0u:
                    goto LABEL_199;
                  case 1u:
                  case 2u:
                  case 4u:
                    v78 = 0;
                    v79 = 0;
                    v77 = 1;
                    goto LABEL_199;
                  case 3u:
                    v77 = 0;
                    v78 = 0;
                    v79 = 2;
                    goto LABEL_199;
                  case 5u:
                    v77 = 0;
                    v78 = 0;
                    v79 = 4;
                    goto LABEL_199;
                  case 6u:
                    v77 = 0;
                    v78 = 0;
                    v79 = 3;
LABEL_199:
                    v110 = logObjectForModule(1);
                    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
                    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
                    {
                      v120 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndexedSubscript:0]);
                      v112 = (void *)objc_claimAutoreleasedReturnValue([v120 objectForKeyedSubscript:@"cert_code"]);
                      v118 = v78;
                      v113 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndexedSubscript:0]);
                      v114 = (void *)objc_claimAutoreleasedReturnValue([v113 objectForKeyedSubscript:@"ppid_code"]);
                      *(_DWORD *)buf = 67109634;
                      v132 = v79;
                      v133 = 2112;
                      v134 = v112;
                      v135 = 2112;
                      v136 = v114;
                      _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_DEFAULT,  "certStatus: %{coreacc:MFAACertificateManager_CertStatus_t}d, certCode: %@, ppidCode: %@",  buf,  0x1Cu);

                      v78 = v118;
                    }

                    if (v77 | v78) {
                      v115 = 0LL;
                    }
                    else {
                      v115 = v79;
                    }
                    [*(id *)(v128 + 32) _setCachedStatusForCertSerial:*(void *)(v128 + 40) issuerSeq:*(void *)(v128 + 48) ppid:*(void *)(v128 + 56) certStatus:v115];
                    (*(void (**)(void))(*(void *)(v128 + 64) + 16LL))();
                    break;
                  default:
                    v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid cert code returned from server: %d",  1LL));
                    v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:failureReason:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:failureReason:",  @"MFAACertificateManagerErrorDomain",  -6LL,  v106));
                    v108 = logObjectForModule(1);
                    v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
                    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
                      -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
                    }

                    (*(void (**)(void))(*(void *)(v128 + 64) + 16LL))();
                    break;
                }

                id v16 = v122;
                v40 = v124;
              }

              else
              {
                v101 = logObjectForModule(1);
                v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
                if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
                  __60__MFAANetwork__validateCertSerial_issuerSeq_ppid_withReply___block_invoke_cold_10();
                }

                v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  -6LL));
                v104 = logObjectForModule(1);
                v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
                if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
                  -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
                }

                (*(void (**)(void))(*(void *)(v128 + 64) + 16LL))();
              }

              v100 = v126;
LABEL_185:

              uint64_t v8 = v127;
LABEL_186:

              goto LABEL_187;
            }

LABEL_35:
}

LABEL_168:
            if (gLogObjects && gNumLogObjects >= 2)
            {
              v95 = (os_log_s *)*(id *)(gLogObjects + 8);
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                -[MFAANetwork _init].cold.2();
              }
              v95 = (os_log_s *)&_os_log_default;
              v96 = &_os_log_default;
            }

            if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
              __98__MFAANetwork__requestMetadataForCertSerial_issuerSeq_ppid_requestedLocale_requestInfo_withReply___block_invoke_168_cold_5();
            }

            v97 = objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  -6LL));
            if (gLogObjects && gNumLogObjects >= 2)
            {
              v98 = (os_log_s *)*(id *)(gLogObjects + 8);
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                -[MFAANetwork _init].cold.2();
              }
              v98 = (os_log_s *)&_os_log_default;
              v99 = &_os_log_default;
            }

            v100 = (void *)v97;
            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
              -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
            }

            (*(void (**)(void))(*(void *)(v128 + 64) + 16LL))();
            goto LABEL_185;
          }
        }
      }

      goto LABEL_168;
    }

    if ([*(id *)(a1 + 32) forceFairPlaySAPFailure])
    {
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([@"1234" dataUsingEncoding:4]);
    }

    else
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue([v16 allHeaderFields]);
      v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:@"signature"]);

      if (v81) {
        id v27 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v81,  0LL);
      }
      else {
        id v27 = 0LL;
      }
    }

    buf[0] = 0;
    v82 = *(void **)(a1 + 32);
    v130 = 0LL;
    v83 = [v82 _verifyFairPlaySignatureSync:v27 forData:v7 timedOut:buf error:&v130];
    v84 = v130;
    v85 = v84;
    if (buf[0])
    {
      v86 = a1;
      v87 = logObjectForModule(1);
      v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _verifyFairPlaySignatureSync:forData:timedOut:error:].cold.1();
      }

      v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  -4LL));
      v90 = logObjectForModule(1);
      v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
      if (!os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
        goto LABEL_164;
      }
    }

    else
    {
      if ((v83 & 1) != 0)
      {
        v128 = a1;

        v26 = (void *)&unk_10007E000;
        goto LABEL_103;
      }

      v86 = a1;
      v92 = logObjectForModule(1);
      v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
        -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.14();
      }

      v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  -6LL));
      v94 = logObjectForModule(1);
      v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
      if (!os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
        goto LABEL_164;
      }
    }

    -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
LABEL_164:

    (*(void (**)(void))(*(void *)(v86 + 64) + 16LL))();
LABEL_97:

    goto LABEL_187;
  }

  if (v24 == (id)401)
  {
    uint64_t v29 = -4LL;
    goto LABEL_65;
  }

  if (v24 != (id)400)
  {
    uint64_t v29 = -6LL;
LABEL_65:
    int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:",  @"MFAACertificateManagerErrorDomain",  v29));
    if (!v25) {
      goto LABEL_53;
    }
    goto LABEL_66;
  }

  int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:description:",  @"MFAACertificateManagerErrorDomain",  -3LL,  @"The server has determined that the data provided was invalid."));
  if (!v25) {
    goto LABEL_53;
  }
LABEL_66:
  uint64_t v30 = v16;
  int v31 = a1;
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v32 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _init].cold.2();
    }
    v32 = (os_log_s *)&_os_log_default;
    id v33 = &_os_log_default;
  }

  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    __87__MFAANetwork__requestMetadataForToken_withUUID_requestedLocale_requestInfo_withReply___block_invoke_147_cold_21();
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v34 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MFAANetwork _init].cold.2();
    }
    uint64_t v34 = (os_log_s *)&_os_log_default;
    uint64_t v35 = &_os_log_default;
  }

  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    -[MFAANetwork _requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:].cold.1();
  }

  (*(void (**)(void))(*(void *)(v31 + 64) + 16LL))();
  id v16 = v30;
LABEL_187:
}

LABEL_39:
    goto LABEL_40;
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  LODWORD(v35) = 0;
  char v18 = (void *)objc_claimAutoreleasedReturnValue([v11 base64EncodedStringWithOptions:0]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 base64EncodedStringWithOptions:0]);
  int v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MFAANetwork userDefaultsQueue](self, "userDefaultsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __70__MFAANetwork__getCachedStatusForCertSerial_issuerSeq_ppid_withReply___block_invoke;
  block[3] = &unk_100074808;
  block[4] = self;
  v21 = v18;
  uint64_t v30 = v21;
  id v22 = v19;
  int v31 = v22;
  id v33 = buf;
  v32 = v10;
  dispatch_sync(v20, block);

  if (v13) {
    v13[2](v13, *(unsigned int *)(*(void *)&buf[8] + 24LL), 0LL);
  }

  _Block_object_dispose(buf, 8);
LABEL_40:
}

void sub_10000EBB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10000F308( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10000FF1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000109C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100011460( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

LABEL_93:
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_5(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_7(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id OUTLINED_FUNCTION_9(void *a1, const char *a2)
{
  return [a1 initWithData:v2 encoding:4];
}

void OUTLINED_FUNCTION_10( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_11( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id OUTLINED_FUNCTION_12(void *a1, const char *a2, uint64_t a3)
{
  return [a1 initWithData:a3 encoding:4];
}

  ;
}

  ;
}

id OUTLINED_FUNCTION_15(void *a1, const char *a2)
{
  return [a1 length];
}

  ;
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1, uint64_t a2)
{
  return obfuscatedPointer(a2);
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_23(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

id OUTLINED_FUNCTION_25(void *a1, const char *a2)
{
  return [a1 count];
}

void init_logging_signposts()
{
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1) {
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
  }
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  uint64_t v2 = "";
  if (*(_BYTE *)(a1 + 48))
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = 0LL;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(const char **)(v6 + v3);
      if (!v7)
      {
        id v7 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v12) = v4;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)",  buf,  8u);
          uint64_t v6 = *(void *)(a1 + 32);
          id v7 = "<Undefined>";
        }
      }

      uint64_t v8 = *(const char **)(v6 + v3 + 8);
      if (!v8)
      {
        uint64_t v8 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v15, v4, &v16);
          uint64_t v8 = "<Undefined>";
        }
      }

      os_log_t v9 = os_log_create(v7, v8);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v9;
      if (v9)
      {
        ++v5;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v12 = v7;
          __int16 v13 = 2080;
          uint64_t v14 = v8;
          _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Created log object %s: %s",  buf,  0x16u);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v12 = v7;
        __int16 v13 = 2080;
        uint64_t v14 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to create os_log_t object %s: %s!",  buf,  0x16u);
      }

      ++v4;
      unint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16LL;
    }

    while (v4 < v10);
    uint64_t v2 = "setExportedInterface:" + 21;
  }

  else
  {
    LODWORD(v10) = 0;
    int v5 = 0;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 325);
    LODWORD(v12) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Created %d log object(s)!",  buf,  8u);
    LODWORD(v10) = *(unsigned __int8 *)(a1 + 48);
  }

  gLogSignpostObjects = *(void *)(a1 + 40);
  gNumLogSignpostObjects = v10;
}

void sub_100015E2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100015F40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_3_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void *sub_10001644C(void *result)
{
  char *result = ++qword_10007E858;
  return result;
}

uint64_t sub_100016468( mach_port_t a1, int a2, int *a3, uint64_t a4, int a5, _OWORD *a6, void *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  int v30 = 1;
  uint64_t v31 = a4;
  int v32 = 16777472;
  int v33 = a5;
  NDR_record_t v34 = NDR_record;
  int v17 = *a3;
  int v35 = a2;
  int v36 = v17;
  int v37 = a5;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B000000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v19 = mach_msg(&msg, 3, 0x40u, 0xDCu, reply_port, 0, 0);
  uint64_t v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v19)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v20 = 4294966988LL;
      }

      else if (msg.msgh_id == 1300)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v20 = 4294966996LL;
          if (v30 == 2
            && msg.msgh_size == 212
            && !msg.msgh_remote_port
            && HIBYTE(v32) == 1
            && HIWORD(v35) << 16 == 1114112)
          {
            int v21 = v33;
            if (v33 == v47)
            {
              uint64_t v20 = 0LL;
              int v22 = *(_DWORD *)&v34.mig_vers;
              *a3 = v38;
              __int128 v23 = v46;
              a6[6] = v45;
              a6[7] = v23;
              __int128 v24 = v44;
              a6[4] = v43;
              a6[5] = v24;
              __int128 v25 = v40;
              *a6 = v39;
              a6[1] = v25;
              __int128 v26 = v42;
              a6[2] = v41;
              a6[3] = v26;
              *a7 = v31;
              *a8 = v21;
              int v27 = v49;
              *a9 = v48;
              *a10 = v27;
              *a11 = v50;
              *a12 = v22;
              return v20;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v20 = 4294966996LL;
          if (HIDWORD(v31))
          {
            if (msg.msgh_remote_port) {
              uint64_t v20 = 4294966996LL;
            }
            else {
              uint64_t v20 = HIDWORD(v31);
            }
          }
        }

        else
        {
          uint64_t v20 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v20 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v20;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v20;
}

uint64_t sub_1000166C0(mach_port_t a1, unsigned int a2, __int128 *a3)
{
  __int128 v4 = a3[5];
  __int128 v19 = a3[4];
  __int128 v20 = v4;
  __int128 v5 = a3[7];
  __int128 v21 = a3[6];
  __int128 v22 = v5;
  __int128 v6 = a3[1];
  __int128 v15 = *a3;
  __int128 v16 = v6;
  __int128 v7 = a3[3];
  __int128 v17 = a3[2];
  NDR_record_t v13 = NDR_record;
  unsigned int v14 = a2;
  __int128 v18 = v7;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4B100000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3, 0xA4u, 0x2Cu, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v10;
  }

  if ((_DWORD)v9)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v10;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v10 = 4294966988LL;
LABEL_17:
    mach_msg_destroy(&msg);
    return v10;
  }

  if (msg.msgh_id != 1301)
  {
    uint64_t v10 = 4294966995LL;
    goto LABEL_17;
  }

  uint64_t v10 = 4294966996LL;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_17;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_17;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_17;
  }
  uint64_t v10 = v14;
  if (v14) {
    goto LABEL_17;
  }
  return v10;
}

uint64_t sub_10001684C( mach_port_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, void *a9, _DWORD *a10)
{
  int v18 = 1;
  uint64_t v19 = a6;
  int v20 = 16777472;
  int v21 = a7;
  NDR_record_t v22 = NDR_record;
  *(_DWORD *)__int128 v23 = a2;
  *(_DWORD *)&v23[4] = a3;
  *(_DWORD *)&v23[8] = a4;
  *(_OWORD *)&v23[12] = *a5;
  int v24 = a7;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B200000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3, 0x54u, 0x50u, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 1302)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996LL;
          if (v18 == 1 && msg.msgh_size == 72 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
          {
            int v15 = v21;
            if (v21 == *(_DWORD *)&v23[16])
            {
              uint64_t v14 = 0LL;
              *a8 = *(_OWORD *)v23;
              *a9 = v19;
              *a10 = v15;
              return v14;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v14 = 4294966996LL;
          if (HIDWORD(v19))
          {
            if (msg.msgh_remote_port) {
              uint64_t v14 = 4294966996LL;
            }
            else {
              uint64_t v14 = HIDWORD(v19);
            }
          }
        }

        else
        {
          uint64_t v14 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v14;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v14;
}

uint64_t sub_100016A38(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4B300000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3, 0x18u, 0x3Cu, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v12;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v12 = 4294966988LL;
    }

    else if (msg.msgh_id == 1303)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 52)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v12 = v18;
            if (!v18)
            {
              int v15 = v20;
              *a2 = v19;
              *a3 = v15;
              int v16 = v22;
              *a4 = v21;
              *a5 = v16;
              return v12;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v13 = 1;
          }
          else {
            BOOL v13 = v18 == 0;
          }
          if (v13) {
            uint64_t v12 = 4294966996LL;
          }
          else {
            uint64_t v12 = v18;
          }
          goto LABEL_23;
        }
      }

      uint64_t v12 = 4294966996LL;
    }

    else
    {
      uint64_t v12 = 4294966995LL;
    }

LABEL_23:
    mach_msg_destroy(&msg);
    return v12;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v12;
}

uint64_t sub_100016BB0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 1374699841 * ((((2 * a1) | 0x340440B2) - a1 + 1711136679) ^ 0xF7F63850);
  return ((uint64_t (*)(void))(*((void *)*(&off_100079130 + (v1 ^ 0x5EF))
                              + (((*(void *)a1 == *(void *)(a1 + 8)) * ((51 * (v1 ^ 0x5DA)) ^ 0x630)) ^ v1)
                              - 1)
                            - 8LL))();
}

uint64_t sub_100016C38@<X0>(uint64_t a1@<X8>)
{
  int v4 = *(_DWORD *)(v2 - 0xC7F991DE6408E19LL);
  int v5 = v4 - 159353952;
  if (v4 - 159353952 < 0) {
    int v5 = 159353952 - v4;
  }
  *(_DWORD *)(v1 - 0xC7F991DE6408E19LL) = v4;
  return (*(uint64_t (**)(void))(a1
                              + 8LL
                              * ((93
                                * ((v5 ^ 0xF9CB9BF3) + 1459613664 + ((v5 << (v3 - 44)) & 0xF39737E6) != ((v3 - 104) ^ 0x50CB8E16))) ^ v3)))();
}

uint64_t sub_100016CCC@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v2 - 0xC7F991DE6408E15LL) + 4LL * (v5 - 1355516884)) = *(_DWORD *)(*(void *)(v3 - 0xC7F991DE6408E15LL)
                                                                                           + 4LL * (v5 - 1355516884));
}

void sub_100016D44()
{
}

void sub_100016D50(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32) + 108757529 * (((a1 | 0xFA9FB8B3) - (a1 & 0xFA9FB8B3)) ^ 0x1A03DA98);
  __asm { BR              X9 }

uint64_t sub_100016E2C@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  unsigned int v12 = 1755732067 * (((&a4 | 0xA509F51) - (&a4 & 0xA509F51)) ^ 0xD496228A);
  a7 = &STACK[0x37021DA48139155A];
  a4 = &STACK[0x42E48BBDD224DE3D];
  a5 = v10;
  a8 = v12 ^ 0x64BC49B;
  a6 = (v11 + 172) ^ v12;
  uint64_t v13 = ((uint64_t (*)(unint64_t **))(*(void *)(a1 + 8LL * (v11 - 1)) - 8LL))(&a4);
  return ((uint64_t (*)(uint64_t))(*(void *)(v9
                                                      + 8LL
                                                      * (((*(_DWORD *)(v10 - 0x27681A84B35EB0EDLL) == v8)
                                                        * (37 * (((v11 + 211) | 0x418) ^ 0x51C) + 1560)) ^ v11))
                                          - 4LL))(v13);
}

uint64_t sub_100016F20( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
}

uint64_t sub_100016F54()
{
  *int v1 = v0;
  int v4 = v0 - ((2 * v0) & 0x317341DE) + 414818497 + ((2 * (v3 - 11)) ^ 0xA32);
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((602
                                          * ((((3 * ((v3 - 11) ^ 0x52B)) ^ 0x1DFFFFC3) & (2 * v4) ^ 0x1173418C)
                                           + (v4 ^ 0x96465F39)
                                           + 2010721788 != 114896338)) ^ (v3 - 11)))
                            - 8LL))();
}

uint64_t sub_100016FF0(int a1)
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((244
                                          * ((((a1 + 1147) ^ (v2 + v1 + ((a1 + 1212) ^ 0x71000501u) < 8)) & 1) == 0)) ^ a1))
                            - 12LL))();
}

uint64_t sub_100017048(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  BOOL v7 = v4 - v5 - (unint64_t)(6 * (a4 ^ 0x5DCu)) + 1478 > 0x1F;
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (((4 * v7) | (16 * v7)) ^ a4)) - 8LL))();
}

uint64_t sub_1000170A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(void))(*(void *)(v6
                                                     + 8LL
                                                     * (((((v5 < 0x20) ^ (a5 - 17)) & 1)
                                                       * (((a5 - 1401) | 0x2AA) - 723)) ^ a5))
                                         - 12LL))(0LL);
}

uint64_t sub_1000170E4(uint64_t a1, int a2)
{
  unsigned int v9 = v6 + v5 + v7;
  v10.i64[0] = 0x3232323232323232LL;
  v10.i64[1] = 0x3232323232323232LL;
  uint64_t v11 = v2 + v9;
  uint64_t v12 = v3 + v9;
  int8x16_t v13 = veorq_s8(*(int8x16_t *)(v11 - 31), v10);
  *(int8x16_t *)(v12 - 15) = veorq_s8(*(int8x16_t *)(v11 - 15), v10);
  *(int8x16_t *)(v12 - 31) = v13;
  return ((uint64_t (*)(void))(*(void *)(v8
                                        + 8LL
}

void sub_100017154()
{
}

void sub_100017160()
{
  _DWORD *v0 = v1;
}

void sub_1000173A8(uint64_t a1)
{
  int v1 = 1759421093 * (a1 ^ 0xB37DB054);
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 8) - 0x27681A84B35EB0F9LL) + 503480823;
  unsigned int v4 = *(_DWORD *)a1 + v1 + 380801153;
  int v5 = (v4 < 0x41F83143) ^ (v3 < 0x41F83143);
  BOOL v6 = v3 < v4;
  if (v5) {
    BOOL v6 = v4 < 0x41F83143;
  }
  int v2 = *(_DWORD *)(a1 + 16) + v1;
  __asm { BR              X11 }

uint64_t sub_1000174A8()
{
  return (*(uint64_t (**)(void))(v1 + 8LL * (((v0 + 34 + 14 * (v0 ^ 0xD1) - 361) * (v2 == 1236742230)) ^ v0)))();
}

uint64_t sub_1000174E0()
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
}

uint64_t sub_10001753C@<X0>(int a1@<W8>)
{
  *(_BYTE *)(*(void *)(v3 - 0x27681A84B35EB105LL) + (v5 - 1547459025 + v2)) = *(_BYTE *)(*(void *)(v3 - 0x27681A84B35EB105LL) + v2 - 310717355 + ((v1 + 707075844) & 0xD5DADBF6));
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * ((189 * (v2 - 1 == a1)) ^ v1)) - 12LL))();
}

void sub_1000175B8()
{
}

uint64_t sub_1000175C0()
{
  BOOL v3 = ((v0 - 1119) & *(_DWORD *)(v1 - 0x27681A84B35EB0F1LL)) == 0;
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * ((2 * (((v0 - 71) ^ v3) & 1)) & 0xEF | (16
                                                                                       * (((v0 - 71) ^ v3) & 1)) | v0)))();
}

void sub_100017600()
{
  *(_DWORD *)(v0 - 0x27681A84B35EB0EDLL) = -1645193683;
}

void sub_100017B10(_DWORD *a1)
{
  unsigned int v1 = *a1 ^ (1225351577
            * ((-1431559688 - (a1 ^ 0x637B64C4 | 0xAAAC21F8) + (a1 ^ 0x637B64C4 | 0x5553DE07)) ^ 0x15B262D5));
  __asm { BR              X15 }

void sub_100017C3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(a4 + v5) = v4;
}

uint64_t sub_100018B40(_DWORD *a1)
{
  unsigned int v1 = 1224239923 * (((a1 | 0x8C9528F6) - (_DWORD)a1 + (a1 & 0x736AD709)) ^ 0x7E26D521);
  unsigned int v2 = a1[4] - v1;
  int v3 = *a1 ^ v1;
  unsigned int v5 = v3 - 1051670498;
  BOOL v4 = v3 - 1051670498 < 0;
  LODWORD(v6) = 1051670498 - v3;
  if (v4) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = v5;
  }
  return ((uint64_t (*)(void))(*((void *)*(&off_100079130 + (int)(v2 ^ 0xF4))
                              + (int)((484 * (v6 != ((2 * (_DWORD)v6) & 0xD0B90CAE))) ^ v2)
                              - 1)
                            - 4LL))();
}

void sub_100018BF8(int a1@<W8>)
{
  **(_DWORD **)(v1 - 0xC7F991DE6408E15LL) = (v2 + 1750894167) ^ 0xD7B70E58;
  *(_DWORD *)(v1 - 0xC7F991DE6408E19LL) = a1 + 1;
}

void sub_100018C50(uint64_t a1)
{
  int v1 = (628203409 * ((1303688841 - (a1 | 0x4DB4B689) + (a1 | 0xB24B4976)) ^ 0x30C34545)) ^ *(_DWORD *)(a1 + 16) ^ 0x43C;
  __asm { BR              X7 }

uint64_t sub_100018E08(int a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6, unsigned int a7)
{
}

void sub_100018E6C()
{
}

uint64_t sub_100018E74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(_DWORD *)(a11 - 0x7542B2AE5773787LL) = 1292221340 - v16;
  int v22 = 1224239923 * (((v21 - 136) & 0x8278F9B6 | ~((v21 - 136) | 0x8278F9B6)) ^ 0x8F34FB9E);
  *(_DWORD *)(v21 - 120) = v22 + v20 - 620;
  *(void *)(v21 - 12_Block_object_dispose(va, 8) = a15;
  *(_DWORD *)(v21 - 136) = v22 ^ 0x3EAF37E3;
  sub_100018B40((_DWORD *)(v21 - 136));
  int v23 = 1759421093 * ((2 * ((v21 - 136) & 0x4FEBF750) - (v21 - 136) - 1340864343) ^ 0x369B8FD);
  *(_DWORD *)(v21 - 136) = ((v20 ^ 0x1BF9F000) & (v17 << 6))
                         - v23
                         + ((v17 << ((v20 + 53) & 0xB7 ^ 0x32)) ^ 0x8DFCF9B9)
                         + 2069626752;
  *(void *)(v21 - 12_Block_object_dispose(va, 8) = a15;
  *(_DWORD *)(v21 - 120) = v20 - v23 + 636;
  sub_100038D3C(v21 - 136);
  *(_DWORD *)(v21 - 120) = v20 + 1374699841 * ((v21 - 136) ^ 0x6DF41809) + 635;
  *(void *)(v21 - 136) = a16;
  *(void *)(v21 - 12_Block_object_dispose(va, 8) = &STACK[0xC7F991DE6408E5D];
  sub_100016BB0(v21 - 136);
  *(_DWORD *)(v21 - 120) = v20
                         + 1178560073
                         * ((((v21 - 136) ^ 0xFBA47593 | 0x3D05B776)
                           - ((v21 - 136) ^ 0xFBA47593)
                           + (((v21 - 136) ^ 0xFBA47593) & 0xC2FA4889)) ^ 0x7C35BA87)
                         + 775;
  *(void *)(v21 - 12_Block_object_dispose(va, 8) = a16;
  *(void *)(v21 - 112) = a15;
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(v19 + 8LL * (v20 ^ 0x3F7)))(v21 - 136);
}

uint64_t sub_1000190C0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, int a13, int a14)
{
  *(_DWORD *)(v17 - 120) = a14 + 1374699841 * ((v17 - 136) ^ 0x6DF41809) + 142;
  *(void *)(v17 - 136) = v16;
  *(void *)(v17 - 12_Block_object_dispose(va, 8) = v14;
  uint64_t v18 = sub_100016BB0(v17 - 136);
  return (*(uint64_t (**)(uint64_t))(v15 + 8LL * ((914 * (a11 < ((a14 + 199) ^ (a14 - 118) ^ 0x13E))) ^ a14)))(v18);
}

uint64_t sub_10001913C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(_DWORD *)(v20 - 120) = v19
                         + 1374699841 * ((2 * ((v20 - 136) & 0xB04ADC0) - (v20 - 136) + 1962627641) ^ 0x190F4A30)
                         - 57;
  *(void *)(v20 - 136) = a16;
  *(void *)(v20 - 12_Block_object_dispose(va, 8) = a14;
  sub_100016BB0(v20 - 136);
  int v21 = 1759421093 * (((v20 - 136) & 0x61219070 | ~((v20 - 136) | 0x61219070)) ^ 0x2DA3DFDB);
  *(_DWORD *)(v20 - 120) = v19 - v21 - 56;
  *(void *)(v20 - 12_Block_object_dispose(va, 8) = v16;
  *(_DWORD *)(v20 - 136) = 156825914 - v21;
  sub_100038D3C(v20 - 136);
  *(_DWORD *)(v20 - 120) = v19
                         + 1178560073
                         * ((((v20 - 136) | 0xECCF7CEC) - (v20 - 136) + ((v20 - 136) & 0x13308310)) ^ 0x565B048E)
                         + 83;
  *(void *)(v20 - 112) = v16;
  *(void *)(v20 - 12_Block_object_dispose(va, 8) = a16;
  uint64_t v22 = v17(v20 - 136);
  return ((uint64_t (*)(uint64_t))(*(void *)(v18
                                                      + 8LL
                                                      * (((*(_DWORD *)(v20 - 136) <= 0xFF9D8B2u) | ((*(_DWORD *)(v20 - 136) <= 0xFF9D8B2u) << 7)) ^ (v19 - 472)))
                                          - (((v19 ^ 0x95u) - 1236) ^ 0x93LL)))(v22);
}

uint64_t sub_1000192F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  return ((uint64_t (*)(void))(*(void *)(v13
                                        + 8LL
                                        * ((27
                                          * (((2 * a13) & 0xB7F5F7DE)
                                           + (a13 ^ 0x5BFAFBEF)
                                           + (((v14 ^ 0x4F4) + 1119) ^ 0xF77FBBFE)
                                           - 1400551921 > 0x7FFFFFFD)) ^ v14))
                            - 4LL))();
}

  ;
}

void sub_100019EE8()
{
  unint64_t v0 = (unint64_t)&v2[qword_10007E730 ^ qword_10007E798];
  qword_10007E798 = 536075833 * (v0 + 0x793AB71194CDC804LL);
  qword_10007E730 = 536075833 * (v0 ^ 0x86C548EE6B3237FCLL);
  *(_DWORD *)*(&off_100079130
  uint64_t v1 = ((uint64_t (*)(uint64_t))*(&off_100079130
                                         + ((57
  *(void *)*(&off_100079130
  __asm { BR              X8 }

void sub_10001A094()
{
  *uint64_t v1 = v0;
}

void sub_1000217A0(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) - 0xC7F991DE6408E19LL) - 1369292382;
  int v3 = *(_DWORD *)(*(void *)(a1 + 8) - 0xC7F991DE6408E19LL) - 1369292382;
  int v4 = (v2 < 937545218) ^ (v3 < 937545218);
  BOOL v5 = v2 > v3;
  if (v4) {
    BOOL v6 = v2 < 937545218;
  }
  else {
    BOOL v6 = v5;
  }
  int v1 = *(_DWORD *)(a1 + 16) - 1178560073 * ((-2 - ((a1 | 0x5930FF1B) + (~(_DWORD)a1 | 0xA6CF00E4))) ^ 0x1C5B7886);
  __asm { BR              X15 }

uint64_t sub_100021894()
{
  int v4 = ((147 * (v2 ^ 0x3F2)) ^ 0xA12D6B27) + v3;
  int v5 = v1 - 1590858969 + ((v2 - 1009) | 0xD0) + 375;
  BOOL v6 = v5 < 715979222;
  BOOL v7 = v4 < v5;
  if (v4 < 715979222 != v6) {
    BOOL v7 = v6;
  }
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((1605 * !v7) ^ v2)) - 4LL))();
}

uint64_t sub_10002191C(uint64_t a1)
{
  if (((v3 + 801) ^ 0x76807059) + v2 >= 0) {
    int v2 = 318707904 - v2;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v1
                                                                                 + 8LL
                                                                                 * ((1132
                                                                                   * (v2
                                                                                    - 159354951
                                                                                    + ((v3 - 1476574434) & 0x5802BFEF) > (int)((77 * ((v3 + 801) ^ 0x3EC)) ^ 0xFFFFF9AE))) ^ (v3 + 801)))
                                                                     - 4LL))( a1,  1476575215LL,  4135612345LL,  4294965678LL);
}

uint64_t sub_100021A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v8
                                        + 8LL
                                        * ((31
                                          * ((*(_DWORD *)(*v11 + 4LL * v14) ^ (v13 + a6) & a7 ^ (v9
                                                                                               + ((v13 + a8) & v12)
                                                                                               + 1399)) > (*(_DWORD *)(*v10 + 4LL * v14) ^ v9))) ^ v13))
                            - 4LL))();
}

uint64_t sub_100021A5C()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * ((((((v3 + v1) & v2) + 61) ^ (v3 + 801)) * (v4 < v5)) ^ v3)))();
}

void sub_100021A88()
{
}

_DWORD *sub_100021A90(_DWORD *result)
{
  char *result = ((v2 + 600) ^ 0x1FF3B737) - v1;
  return result;
}

uint64_t sub_100021AC0(uint64_t a1)
{
  int v1 = 1759421093 * ((~(_DWORD)a1 & 0xA201450D | a1 & 0x5DFEBAF2) ^ 0x117CF559);
  int v2 = *(_DWORD *)(a1 + 8) - v1;
  unsigned int v3 = *((_DWORD *)*(&off_100079130 + (v2 ^ 0x769)) + 83);
  unsigned int v4 = (*(_DWORD *)(a1 + 16) ^ v1) - 16856931;
  BOOL v5 = v3 + 402133936 > v4;
  if (v4 < 0x17F813B0 != v3 > 0xE807EC4F) {
    BOOL v5 = v3 > 0xE807EC4F;
  }
}

uint64_t sub_100021BA8()
{
  unsigned int v4 = v2 + 749603472;
  BOOL v5 = v4 < 0x45A755A3;
  BOOL v6 = v1 + 1168594339 < v4;
  if (v5 != v1 > 0xBA58AA5C) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(void))(v0 + 8LL * ((54 * ((((v3 - 1361) ^ v7) & 1) == 0)) ^ v3)))();
}

uint64_t sub_100021C18(uint64_t a1)
{
  int v5 = v4 | 0x182;
  unsigned int v6 = *(_DWORD *)(v3 + 336);
  unsigned int v7 = (*(_DWORD *)(a1 + 4) ^ v1) + 354516975;
  if (v6 > 0x73C32EE1 != v7 < (((v5 + 1152) | 0x108) ^ 0x8C3CD610)) {
    BOOL v8 = v6 > 0x73C32EE1;
  }
  else {
    BOOL v8 = v6 - 1942171362 > v7;
  }
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1528 * !v8) ^ v5)) - ((v5 + 1152) ^ 0x60ELL)))();
}

uint64_t sub_100021CB8()
{
  unsigned int v4 = v2 + 80333165;
  BOOL v5 = v4 < 0x7BE51A9C;
  BOOL v6 = v3 + (v1 ^ 0x25B) + 2078610318 < v4;
  if (v5 != v3 > (v1 ^ 0x841AE036)) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v0 + 8LL * ((944 * !v6) ^ v1)))();
}

uint64_t sub_100021D30(_DWORD *a1)
{
  unsigned int v5 = *(_DWORD *)(v3 + 352);
  unsigned int v6 = (*a1 ^ v1) + 237531176;
  BOOL v7 = v5 + 2 * (v4 ^ 0x6D2) - 1915799556 > v6;
  if (v5 > 0x7230C0F5 != v6 < ((184 * (v4 ^ 0x55F)) ^ 0x8DCF383A)) {
    BOOL v7 = v5 > 0x7230C0F5;
  }
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((253 * v7) ^ v4 ^ 0x42E)) - 8LL))();
}

uint64_t sub_100021DC8@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  unsigned int v5 = v2 - 2132719391;
  BOOL v6 = v5 < 0x8817C3;
  BOOL v7 = v3 + 8918979 < v5;
  if (v6 != v3 > v4 - 8920820) {
    BOOL v7 = v6;
  }
  if (v7) {
    int v8 = a2;
  }
  else {
    int v8 = a2 + 1;
  }
  *(_DWORD *)(result + 12) = v8;
  return result;
}

uint64_t sub_100021E1C(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))*(&off_100074B40 + ((16 * (*(_DWORD *)(a2 + 4) == 1206753096)) | 0xA5u)))(4294925278LL);
}

uint64_t sub_100021E58@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_BYTE *)(*(void *)(a2 + 96) + 448LL) = *(_BYTE *)(*(void *)(a1 + 8) + 12LL);
  return (*(uint64_t (**)(void))(v2 + 3096))(0LL);
}

void sub_100021EC4()
{
}

void sub_100021ED0(uint64_t a1)
{
  int v1 = 628203409 * (((a1 | 0x89B748DF) - a1 + (a1 & 0x7648B720)) ^ 0xB3F44EC);
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 24) - 0xB19902B9219B199LL) + 604313364;
  unsigned int v3 = *(_DWORD *)(a1 + 20) + v1 - 316474524;
  BOOL v4 = v2 < 0x39B10190;
  BOOL v5 = v2 > v3;
  if (v3 < 0x39B10190 != v4) {
    BOOL v5 = v4;
  }
  __asm { BR              X9 }

uint64_t sub_100021FB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * ((196
                                * (((*(unsigned __int8 *)(*(void *)(a1 + 40) + (v2 - 363588221))
}

uint64_t sub_100022004()
{
  int v4 = v3 ^ 0x6FC;
  unsigned int v5 = ((v4 - 77) ^ 0xBB970340) + v0;
  BOOL v6 = v2 - 226943326 > v5;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (((8 * !v6) | (!v6 << 10)) ^ v4)) - 8LL))();
}

uint64_t sub_100022084(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(v2
                                                    + 8LL
                                                    * ((1688
                                                      * (((v3 ^ 0x4F ^ (*(char *)(v1 + (v4 + 1)) >= 0)) & 1) == 0)) ^ v3)))( a1,  ((*(unsigned __int8 *)(v1 + (v4 + 1)) << ((v3 - 102) & 0xB6 ^ 3)) & 0x7E)
}

uint64_t sub_100022110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((1910
                                          * (((((v6 + 65) & 0x7F ^ 0xFCDBFBFF) + 2 * ((v6 + 65) & 0x7F)) & 0xFCDBFFFC) == ((299 * (a5 ^ 0x1F8)) ^ 0xFCDBFB02))) ^ a5))
                            - ((a5 ^ 0x1F8u)
                             + 1788)
                            + 1786LL))();
}

uint64_t sub_10002217C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v11 = v9 + a7 + ((v10 - 1633) | 0x110) - 211221332;
  BOOL v12 = v11 < 0x5F0ECD7;
  BOOL v13 = v11 > v7 - 1184700757;
  return (*(uint64_t (**)(void))(v8 + 8LL * ((156 * !v13) | v10)))();
}

uint64_t sub_1000221F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v12 = *(unsigned __int8 *)(v7 + (v10 + v9 + 2));
  return (*(uint64_t (**)(uint64_t, void))(v8 + 8LL * (v11 ^ (958 * (a7 != -52691968)))))( a1,  (v12 ^ 0x47EFBFBB) - 141440 + ((((v11 + 1361) ^ 0x5D9) - 357) & (2 * v12)));
}

uint64_t sub_10002226C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8)
{
  int v12 = *(unsigned __int8 *)(v8 + (a5 + v11 + 1794));
  return (*(uint64_t (**)(uint64_t, void))(v9 + 8LL * ((1557 * (v10 - 1 == a6)) ^ a8)))( a1,  ((v12 | ((((a8 + 807) | 0x100) ^ 0x1268C202) + (a2 << 8))) ^ 0xFFFFD7FB)
         + 1206763328
         + ((2 * (v12 | ((((a8 + 807) | 0x100) ^ 0x1268C202) + (a2 << 8)))) & 0xFFFFAFF6));
}

uint64_t sub_1000222D8(uint64_t a1, int a2, int a3)
{
  int v8 = v5 + v6 + v7 + 1599204958;
  uint64_t v9 = (a3 + 1448515837) & 0xA9A961FE;
  int v10 = a3 - 1284;
  unsigned int v11 = a2 + v8 + 121046671;
  unsigned int v12 = v3 + 1953524854;
  int v13 = (v12 < 0xC0FE72A2) ^ (v11 < 0xC0FE72A2);
  BOOL v14 = v11 > v12;
  if (v13) {
    BOOL v14 = v11 < 0xC0FE72A2;
  }
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * ((1247 * !v14) ^ v10)) - v9 + 502))();
}

uint64_t *sub_100022378@<X0>(uint64_t *result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  uint64_t v8 = result[6];
  uint64_t v10 = *result;
  uint64_t v9 = result[1];
  *a3 = v5 + 1541701226;
  *(_DWORD *)(v10 - 0x5F8E90DD494572B7LL) = v4;
  *(_DWORD *)(v8 - 0x56530F603BC303ACLL) = a2;
  *(void *)(v9 - 0x4FF3ADA337C70005LL) = v3 + v7 - 1910103002 + ((v6 + 4) | 0x500u);
  *((_DWORD *)result + _Block_object_dispose(va, 8) = 1645153785;
  return result;
}

void sub_100022400(_DWORD *a1)
{
  unsigned int v1 = 1374699841 * (((_DWORD)a1 - 1542394297 - 2 * (a1 & 0xA410EE47)) ^ 0xC9E4F64E);
  unsigned int v2 = *a1 + v1;
  __asm { BR              X13 }

uint64_t sub_1000224B8@<X0>(uint64_t a1@<X8>)
{
  unsigned int v5 = 1755732067 * ((v7 & 0x9095DB2C | ~(v7 | 0x9095DB2C)) ^ 0xB1AC9908);
  uint64_t v8 = v2;
  v7[0] = (v3 - (((v1 + 43) ^ 0xB54A6CA2) & (v4 + 1853089944)) + 299838324) ^ v5;
  v7[1] = (v1 + 7) ^ v5;
  return ((uint64_t (*)(_DWORD *))(*(void *)(a1 + 8LL * (v1 ^ 0x245)) - 8LL))(v7);
}

void IPaI1oem5iL(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_100022668( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13)
{
  a13 = 108757529 * (((&a12 | 0x956C4C34) - (&a12 & 0x956C4C34)) ^ 0x75F02E1F) + 1695027452;
  uint64_t v15 = sub_10005A350(&a12);
  return (*(uint64_t (**)(uint64_t))(v14 + 8LL * ((275 * (a12 == 1645153785)) ^ v13)))(v15);
}

uint64_t sub_1000226E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t *a12, int a13, unsigned int a14)
{
  a12 = &STACK[0x4BD26FD1213425B1];
  a14 = 1307 - 460628867 * ((2 * (&a12 & 0x44AF77C8) - &a12 - 1152350160) ^ 0xF7C60A4D);
  sub_100035EF0((uint64_t)&a12);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14
                                                                                + 8LL
                                                                                * ((23
                                                                                  * (((a13 == 1645153785) ^ 0x2F) & 1)) ^ 0x2A6u)))( v15,  v16,  v17,  v18,  v19);
}

uint64_t sub_1000227A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13, uint64_t a14, int a15)
{
  unsigned int v19 = 1178560073 * ((2 * (&a12 & 0x1E6864C8) - &a12 - 510158029) ^ 0x5B03E351);
  a13 = v19
      + (v15 ^ 0xD57F7D4A ^ (53 * (v17 & 0x9F3 ^ 0x12E)))
      + (((((v17 & 0x9F3) - 2) | 0xC) ^ 0xAAFEFEDA) & (2 * v15))
      + 2063454782;
  a15 = ((v17 & 0x9F3) + 709) ^ v19;
  a14 = a11;
  sub_100045F9C((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18
                                                                                          + 8LL
                                                                                          * ((14 * (a12 != v16 + 689)) ^ v17 & 0x9F3u))
                                                                              - 8LL))( v20,  v21,  v22,  v23,  v24);
}

uint64_t sub_100022890( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t *a12, uint64_t a13, unsigned int a14, unsigned int a15, unsigned int a16, int a17)
{
  unsigned int v21 = (((&a12 | 0xFB74E5AA) - (&a12 & 0xFB74E5AA)) ^ 0xB7E267D7) * v20;
  a15 = v21 + v19 + 2138963059;
  a16 = 635686783 - v21;
  a12 = &STACK[0x58A7AA08624568E6];
  a13 = a11;
  a14 = v21 - 279984296;
  uint64_t v22 = sub_10005A720((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t))(*(void *)(v18
                                                      + 8LL
                                                      * ((1580 * (a17 == ((v19 - 1118674286) & 0x42AD9EF1) + v17)) ^ v19))
                                          - 8LL))(v22);
}

uint64_t sub_100022958()
{
  int v5 = 53 * (v4 ^ 0x120);
  unsigned int v13 = &STACK[0x384B062F076094AC];
  uint64_t v14 = v8;
  unsigned int v11 = (v4 + 44) ^ (1374699841 * (&v11 ^ 0x6DF41809));
  ((void (*)(unsigned int *))(*(void *)(v2 + 8LL * (v4 ^ 0x198)) - 8LL))(&v11);
  unsigned int v13 = v8;
  unsigned int v11 = (v4 + 545) ^ (1755732067 * (((&v11 | 0x68EC43F5) - (&v11 & 0x68EC43F5)) ^ 0xB62AFE2E));
  sub_1000565D0((uint64_t)&v11);
  if ((_DWORD)v14 == v5 + v1) {
    int v6 = v9;
  }
  else {
    int v6 = (int)v14;
  }
  unsigned int v12 = v4 + ((&v11 & 0x85FB557C | ~(&v11 | 0x85FB557C)) ^ 0x70F0A4AC) * v3 + 728;
  unsigned int v13 = v8;
  v0(&v11);
  unsigned int v12 = v5 + ((2 * (&v11 & 0x2037FE78) - &v11 + 1606943108) ^ 0x553C0FAB) * v3 + 340;
  unsigned int v13 = v10;
  v0(&v11);
  return v6 ^ (v1 + 689);
}

void sub_100022B00(uint64_t a1)
{
  uint64_t v2 = qword_10007E738 - (void)&v3 + qword_10007E730;
  qword_10007E738 = 536075833 * (v2 + 0x793AB71194CDC804LL);
  qword_10007E730 = 536075833 * (v2 ^ 0x86C548EE6B3237FCLL);
  ((void (*)(char *, void (*)()))*(&off_100079130
                                            + ((57
                                                                             * ((qword_10007E730 - qword_10007E738) ^ 0xFC)) ^ byte_1000682C0[byte_100064A60[(57 * ((qword_10007E730 - qword_10007E738) ^ 0xFC))] ^ 0xF7])
                                            + 47))( (char *)*(&off_100079130 + ((57 * (qword_10007E738 ^ 0xFC ^ qword_10007E730)) ^ byte_100071000[byte_10006C310[(57 * (qword_10007E738 ^ 0xFC ^ qword_10007E730))] ^ 0xB6])
            + 19)
  - 4,
    sub_10005A8B8);
  __asm { BR              X9 }

uint64_t sub_100022C1C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8LL * ((41 * (**(void **)(v1 + 1616) != 0LL)) ^ 0x3D1u)))();
}

uint64_t sub_100022C44()
{
  return (*(uint64_t (**)(uint64_t))(v1 + 1608))(v0);
}

  ;
}

uint64_t sub_100022C6C(uint64_t a1)
{
  int v1 = 535753261 * ((a1 - 1922189914 - 2 * (a1 & 0x8D6DB5A6)) ^ 0x8799BB89);
  int v2 = *(_DWORD *)(a1 + 16) + v1;
  int v3 = *(_DWORD *)a1 ^ v1;
  int v4 = *(_DWORD *)(*(void *)(a1 + 24) - 0xC7F991DE6408E19LL);
  unsigned int v6 = v4 - 159353952;
  BOOL v5 = v4 - 159353952 < 0;
  unsigned int v7 = 159353952 - v4;
  if (!v5) {
    unsigned int v7 = v6;
  }
  return ((uint64_t (*)(void))(*((void *)*(&off_100079130 + v2 - 386)
                              + ((30 * ((v3 - 843402718) < 4 * (unint64_t)v7)) ^ v2)
                              - 1)
                            - (v2 ^ 0x51Fu)
                            + 1191LL))();
}

uint64_t sub_100022D3C()
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (v2 ^ (67 * (v0 != 843402718))))
                            - (((v2 + 110787148) & 0xF9658379)
                             - 205)
                            + 424LL))();
}

uint64_t sub_100022D8C()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((1884 * (((v1 - 361) | 0xA2) == 434)) ^ (v1 - 245))) - 4LL))();
}

uint64_t sub_100022E04@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W3>, int a4@<W4>, int a5@<W8>)
{
  *(_BYTE *)(*(void *)(a1 + 8) + (a4 + a5)) = (a3 ^ v7) >> v8;
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * ((971 * (((a2 - 863) ^ (a2 - 6)) + a4 != v6)) ^ a2)) - 12LL))();
}

uint64_t sub_100022E50(uint64_t a1, int a2)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1884 * (v3 + 8 == ((a2 - 162) | 0xA2) - 402)) ^ (a2 - 46))) - 4LL))();
}

uint64_t sub_100022E8C(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v7 = v3 > 0x7CA4B262;
  if (v7 == v6 - 1136057856 < -2091168355) {
    BOOL v7 = v6 - 1136057856 < v5;
  }
  return ((uint64_t (*)(uint64_t, void))(*(void *)(v4 + 8LL * (((a3 + 1107) * v7) ^ a3)) - 4LL))( a1,  (a3 + 46));
}

uint64_t sub_100022EF8@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W8>)
{
  return sub_100022E04(a1, a2, *(_DWORD *)(*v4 + 4LL * (v5 - 1192373149)), v3, a3);
}

uint64_t sub_100022F24(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(result + 32) = a3;
  return result;
}

void sub_100022F2C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 3804331 * ((a1 - 2 * (a1 & 0xF3A65B02) - 207201534) ^ 0x8D737EF4);
  int v2 = (*(_BYTE *)a1 ^ (-85 * ((a1 - 2 * (a1 & 2) + 2) ^ 0xF4)));
  ((void (*)(char *, void (*)()))*(&off_100079130 + v1 - 1289))( (char *)*(&off_100079130 + v1 - 1458) - 4,  sub_10005ADFC);
  uint64_t v3 = *(void *)*(&off_100079130 + v1 - 1503);
  unsigned int v5 = v1 + 1755732067 * (((&v4 | 0x1283C73D) - (&v4 & 0x1283C73D)) ^ 0xCC457AE6) - 580;
  uint64_t v4 = v3;
  sub_1000577D0((uint64_t)&v4);
  __asm { BR              X9 }

uint64_t sub_10002307C()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((1541
                                          * (**(_DWORD **)(v2 + 8LL * (v0 ^ 0x3C2)) == ((v0 + 725) ^ 0x34B) - 1698)) ^ v0))
                            - 8LL))();
}

uint64_t sub_100023138@<X0>(int a1@<W8>)
{
  char v8 = *(unsigned int **)(v6 + 8LL * (a1 - 1290));
  uint64_t v9 = *v8;
  uint64_t v10 = *(void *)(v6 + 8LL * (a1 - 1323));
  unsigned int v11 = *(_BYTE **)(v10 - 4);
  v22[0] = *v11 - 71;
  v22[1] = v11[1] - 71;
  v22[2] = v11[2] - 71;
  v22[3] = v11[3] - 71;
  v22[4] = v11[4] - 71;
  v22[5] = v11[5] - 71;
  v22[6] = v11[6] - 71;
  v22[7] = v11[7] - 71;
  v22[8] = v11[8] - 71;
  v22[9] = v11[9] - 71;
  v22[10] = v11[10] - 71;
  v22[11] = v11[11] - 71;
  v22[12] = v11[12] - 71;
  v22[13] = v11[13] - 71;
  v22[14] = v11[14] - 71;
  v22[15] = v11[15] - 71;
  v22[16] = v11[16] - 71;
  v22[17] = v11[17] - 71;
  v22[18] = v11[18] - 71;
  v22[19] = v11[19] - 71;
  v22[20] = v11[20] - 71;
  v22[21] = v11[21] - 71;
  unsigned int v12 = *(_BYTE **)(v10 - 4);
  v22[22] = v12[22] - 71;
  v22[23] = v12[23] - 71;
  v22[24] = v12[24] - 71;
  v22[25] = v12[25] - 71;
  v22[26] = v12[26] - 71;
  v22[27] = v12[27] - 71;
  v22[28] = v12[28] - 71;
  v22[29] = v12[29] - 71;
  unsigned int v13 = *(uint64_t (**)(uint64_t, _BYTE *, _DWORD *))(v6 + 8LL * (a1 ^ 0x525));
  int v14 = v13(v9, v22, v2);
  unsigned int v15 = ((2 * v14) & 0xBFCFF7EE) + (v14 ^ 0x5FE7FBF7);
  if (v15 != 1609038839)
  {
    if (v15 == 1609039941)
    {
      uint64_t v16 = *v8;
      int v17 = *(_BYTE **)(*(void *)(v6 + 8LL * (v4 - 1349)) - 4LL);
      v23[0] = *v17 - 70;
      v23[1] = v17[1] - 70;
      v23[2] = v17[2] - 70;
      v23[3] = v17[3] - 70;
      v23[4] = v17[4] - 70;
      v23[5] = v17[5] - 70;
      v23[6] = v17[6] - 70;
      v23[7] = v17[7] - 70;
      v23[8] = v17[8] - 70;
      v23[9] = v17[9] - 70;
      v23[10] = v17[10] - 70;
      v23[11] = v17[11] - 70;
      v23[12] = v17[12] - 70;
      v23[13] = v17[13] - 70;
      v23[14] = v17[14] - 70;
      v23[15] = v17[15] - 70;
      v23[16] = v17[16] - 70;
      v23[17] = v17[17] - 70;
      v23[18] = v17[18] - 70;
      v23[19] = v17[19] - 70;
      int v18 = v13(v16, v23, v2);
      unsigned int v19 = (2 * v18) & 0xB1CDF7BE;
      unsigned int v15 = (v18 ^ 0x58E6FBDF) - 2359306;
    }

    else
    {
      unsigned int v19 = -119865378;
    }

    __asm { BR              X8 }
  }

  *(_DWORD *)(v7 + 344) |= (3 * (v4 ^ 0x7DF)) ^ 0x6A8;
  *(_DWORD *)(v7 + 44) = 746457987;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, _DWORD *))(v6 + 8LL * (v4 - 1406)))( *v2,  v7 + 332,  v7 + 336,  v7 + 340,  v3);
  uint64_t v21 = *(void *)(v1 + 8);
  *(_DWORD *)(*(void *)(v1 + 24) - 0x705CCB0086AF2A86LL) = *v2;
  *(_DWORD *)(v21 - 0x4CAF57822185BF99LL) = *v3;
  *(_DWORD *)(v1 + 20) = 1645153785;
  return result;
}

void sub_10002355C(uint64_t a1)
{
  int v1 = 1225351577 * (((a1 | 0xD0007703) - a1 + (a1 & 0x2FFF88FC)) ^ 0xF39AAF15);
  __asm { BR              X11 }

uint64_t sub_100023614@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8LL * (((*v1 != 0) * (a1 ^ 0x102)) ^ a1)))();
}

uint64_t sub_100023648@<X0>(int a1@<W8>)
{
  int v5 = 3 * (a1 ^ 0x91);
  uint64_t v6 = v3(*v4);
  return ((uint64_t (*)(uint64_t))(*(void *)(v2 + 8LL * ((205 * (*v1 != 0)) ^ v5)) - 12LL))(v6);
}

uint64_t sub_100023680()
{
  uint64_t result = v2(*v3);
  *int v1 = 0;
  *(_DWORD *)uint64_t v0 = 0;
  *(void *)(v0 + 344) = 0LL;
  *(void *)(v0 + 352) = 0LL;
  *(_DWORD *)(v0 + 360) = 521138062;
  *(_DWORD *)(v0 + 56) = 746457987;
  return result;
}

uint64_t sub_1000236C0@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((205 * (*v1 != 0)) ^ a1 ^ 0x1B1)) - 12LL))();
}

void sub_1000236EC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4) - 3804331 * (((a1 | 0x51A664) - (a1 & 0x51A664)) ^ 0x7E848392);
  __asm { BR              X9 }

uint64_t sub_1000237B8@<X0>( _DWORD *a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, int a8)
{
  unsigned int v14 = *(_DWORD *)(v8 - 0x27681A84B35EB0F5LL) + *a1 - v12 + ((v13 + 2132657639) & 0x80E23D37 ^ 0xBD783FD5);
  unsigned int v15 = 1759421093 * (&a5 ^ 0xB37DB054);
  a8 = v13 - v15 + 40;
  a7 = v8;
  a5 = v14 - v15 + 415266632;
  a6 = v15 + 1236742230;
  uint64_t v16 = ((uint64_t (*)(int *))(*(void *)(a2 + 8LL * (v13 - 509)) - 4LL))(&a5);
  return (*(uint64_t (**)(uint64_t))(v11 + 8LL * ((502 * (*v10 == v9)) ^ v13)))(v16);
}

uint64_t sub_10002388C()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL
                                             * (((*(void *)(v0 + 8) == 0x58C2F3F47EC954F5LL) * (v1 - 1298)) ^ v1))
                            - ((v1 + 202) ^ 0x5F9LL)))();
}

uint64_t sub_1000238D4()
{
  return (*(uint64_t (**)(void))(v2 + 8LL * ((1004 * ((((v0 + 1) ^ (v1 == 1116194070)) & 1) == 0)) ^ v0)))();
}

void sub_100023908()
{
  _DWORD *v0 = -1645193696;
}

void sub_100023B40(uint64_t a1)
{
  qword_10007E6C8 = 536075833 * ((unint64_t)&v2[qword_10007E730 - qword_10007E6C8] ^ 0x86C548EE6B3237FCLL);
  qword_10007E730 = qword_10007E6C8;
  pthread_once((pthread_once_t *)&unk_10007E718, sub_10005A8B8);
  __asm { BR              X9 }

uint64_t sub_100023C2C@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * ((240 * ((((**(void **)(v1 + 1616) == 0LL) ^ 0xE1F45F16) & 1) == 0)) ^ 0x25Fu))
                            - 8LL))();
}

uint64_t sub_100023C6C()
{
  return (*(uint64_t (**)(uint64_t))(v1 + 1176))(v0);
}

  ;
}

uint64_t sub_100023C94(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  __int16 v2 = *(_DWORD *)result + 26185 * ((2 * (result & 0x1A68) - result - 6761) ^ 0x9DF5);
  *(_DWORD *)(v1 - 0x5C6940C6B1BC6FDALL) = v2 & 0x1FF ^ 0xB31524D1;
  *(void *)(v1 - 0x5C6940C6B1BC6FFALL) = 0x6731FE5437D4814ALL;
  *(_DWORD *)(v1 - 0x5C6940C6B1BC6FDELL) = 369984849;
  int v3 = v2 ^ 0x8E;
  if (v3 == 1)
  {
    int v4 = 369984865;
    goto LABEL_5;
  }

  if (v3 == 2)
  {
    *(_DWORD *)(v1 - 0x5C6940C6B1BC6FE2LL) = -1830205819;
    int v4 = 369984869;
LABEL_5:
    *(void *)(v1 - 0x5C6940C6B1BC6FF2LL) = 0xBEF60CFC367E8474LL;
    *(void *)(v1 - 0x5C6940C6B1BC6FEALL) = 0x4109F303C9817B8BLL;
    *(_DWORD *)(v1 - 0x5C6940C6B1BC6FDELL) = v4;
  }

  *(_DWORD *)(result + 4) = 1284260520;
  return result;
}

uint64_t sub_100023DDC(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))*(&off_100074B48 + ((194 * (*(_DWORD *)(a2 + 4) != 1206753084)) ^ 0x24Au) - 1))();
}

uint64_t sub_100023E18()
{
  return 4294925278LL;
}

uint64_t sub_100023E20(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 16) = (**(unsigned __int8 **)(a2 + 8) ^ 0x1EEBF92F)
                       - 148926504
                       + ((2 * **(unsigned __int8 **)(a2 + 8)) & 0x5E);
  return 0LL;
}

void sub_100023E58(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0xC7F991DE6408E19LL);
  int v4 = v2 - 159353952;
  BOOL v3 = v2 - 159353952 < 0;
  int v5 = 159353952 - v2;
  if (!v3) {
    int v5 = v4;
  }
  int v1 = (*(_DWORD *)a1 - 235795823 * ((a1 + 1658036232 - 2 * (a1 & 0x62D3A008)) ^ 0xF67EE951) - 345) | 0x109;
  __asm { BR              X10 }

uint64_t sub_100023F88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6, int a7, unsigned int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * (((*(_DWORD *)(*v9 + 4LL * a8) != v8) * a6) ^ a7))
                            - ((a7 - 80) ^ a5)
                            + 713LL))();
}

void sub_100023FBC()
{
}

uint64_t sub_100023FC4(uint64_t result)
{
  *(_DWORD *)(result + 4) = 313388984;
  return result;
}

void sub_100024068(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (1755732067 * ((a1 - 2 * (a1 & 0x7A08EF3) + 127962867) ^ 0xD9663328));
  __asm { BR              X10 }

uint64_t sub_1000240F4@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8LL
                              * (((*(_DWORD *)(v2 - 0x27681A84B35EB0EDLL) == 1645153785) * ((856 * (v1 ^ 0xD8)) ^ 0x7D5)) ^ v1)))();
}

uint64_t sub_100024144@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *(_DWORD *)(v1 - 0x27681A84B35EB0F5LL) - 1309758810;
  unsigned int v4 = *(_DWORD *)(v1 - 0x27681A84B35EB0F9LL) - 1602345780;
  BOOL v5 = v3 < ((v2 - 112831669) & 0x6B9A6DEu) - 999042242;
  BOOL v6 = v3 > v4;
  if (v5 == v4 < 0xC473D418) {
    BOOL v5 = v6;
  }
  return (*(uint64_t (**)(void))(a1 + 8LL * ((13 * v5) ^ v2)))();
}

uint64_t sub_1000241E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v7 = 11 * (v6 ^ 0x6D5);
  uint64_t v8 = *(void *)(v4 - 0x27681A84B35EB105LL);
  int v9 = *(unsigned __int8 *)(v8 + (v3 - 310716791)) ^ 0x32;
  int v10 = ((*(unsigned __int8 *)(v8 + (v3 - 310716794)) ^ 0x32) << 24) | ((*(unsigned __int8 *)(v8 + (v3 - 310716793)) ^ 0x32) << 16) | ((*(unsigned __int8 *)(v8 + v3 - 310717010 + 2 * ((v7 + 936947223) & 0xC8274FF9 ^ 0x205)) ^ 0x32) << 8) | v9;
  return ((uint64_t (*)(void))(*(void *)(a2
                                        + 8LL
                                        * ((203
                                          * (((v2 + v10 - 2 * (v10 & (v2 + 6) ^ v9 & 6) + 0x1000000) & 0xFFFFFF ^ 0xF0DF9)
                                           - (*(_DWORD *)(a1 + 32) ^ v5) != -96652631)) ^ v7))
                            - 8LL))();
}

void sub_1000242E0()
{
  _DWORD *v0 = -1645193524;
}

uint64_t sub_100024490@<X0>(void *a1@<X0>, int a2@<W2>, uint64_t a3@<X8>)
{
  *(void *)(*a1 - 0x42E48BBDD224DE3DLL) = v6 + v5 + 8;
  return (*(uint64_t (**)(void))(a3
                              + 8LL
                              * ((19 * (*v3 != (((a2 - 641) | 0x42) ^ v4 ^ (((a2 - 592) ^ 0xCB) * v7)))) ^ (a2 - 592))))();
}

uint64_t sub_100024504@<X0>(void *a1@<X0>, int a2@<W4>, uint64_t a3@<X8>)
{
  *(void *)(*a1 - 0x42E48BBDD224DE3DLL) = 0LL;
  return (*(uint64_t (**)(void))(a3
                              + 8LL
                              * ((19 * (*v3 != ((((a2 ^ 0x3D0) - 49) | 0x42) ^ v4 ^ (109 * (a2 ^ 0x31B))))) ^ a2 ^ 0x3D0)))();
}

void sub_100024574(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 24) - 0x37021DA48139154ELL) = v3;
  *uint64_t v1 = v2;
  JUMPOUT(0x100024488LL);
}

void gLg1CWr7p()
{
  v0[1] = 108757529 * ((v0 + 70320331 - 2 * (v0 & 0x43100CB)) ^ 0xE4AD62E0) + 1695027452;
  sub_10005A350(v0);
  __asm { BR              X8 }

uint64_t sub_100024668( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, unsigned int a20, unsigned int a21, int a22)
{
  unsigned int v25 = 1759421093 * (&a19 ^ 0xB37DB054);
  HIDWORD(a19) = v25 ^ 0x771B5177;
  a20 = v25 + 1806;
  a22 = v25 ^ 0x18F94B49;
  LODWORD(a19) = v25 ^ 0x7FA6CEE2;
  ((void (*)(unint64_t **))(*(void *)(v24 + 392) - 12LL))(&a19);
  LODWORD(a12) = a21;
  a21 = 1307
      - 460628867
      * (((&a19 | 0x79CC505F) - &a19 + (&a19 & 0x8633AFA0)) ^ 0x355AD222);
  a19 = &STACK[0x4BD26FD1213425D9];
  sub_100035EF0((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 + 8LL * (v22 | ((a20 == 1645153785) << 8))) - 4LL))( v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  a9,  a10,  a11,  a12);
}

uint64_t sub_100024770( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20, unsigned int a21, uint64_t a22, unsigned int a23, uint64_t a24)
{
  unsigned int v29 = 1178560073
      * (((&a20 | 0x2DEBD9B6) - &a20 + (&a20 & 0xD2142648)) ^ 0x977FA1D4);
  a23 = v29 ^ 0x3E8;
  a22 = a17;
  a21 = ((2 * v26) & 0xBCFBBE7E) + (v26 ^ 0x5E7DDF3F) - 234917126 + v29;
  sub_100045F9C((uint64_t)&a20);
  unsigned int v30 = 1178560073
      * (((&a20 | 0xA44E095A) - &a20 + (&a20 & 0x5BB1F6A0)) ^ 0x1EDA7138);
  a23 = (((2 * v25) & 0xFF9AFFFE) + (v25 ^ 0xFFCD7FFF) + 196320555) ^ v30;
  a21 = v30 + 1289;
  a22 = a17;
  a24 = v24;
  uint64_t v31 = (void (*)(int *))(*(void *)(v28 + 1024) - 8LL);
  v31(&a20);
  unsigned int v32 = 1178560073 * ((&a20 - 791991911 - 2 * (&a20 & 0xD0CB2999)) ^ 0x6A5F51FB);
  a22 = a17;
  a24 = a14;
  a23 = v32 ^ ((a13 ^ 0x3FB7BDBB) - 875995281 + ((2 * a13) & 0x7F6F7B76));
  a21 = v32 + 1289;
  uint64_t v33 = ((uint64_t (*)(int *))v31)(&a20);
  return ((uint64_t (*)(uint64_t))(*(void *)(v27 + 8LL * ((2034 * (a20 == 1645153785)) ^ 0x35Du)) - 12LL))(v33);
}

uint64_t sub_100024960( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, uint64_t a20, int a21, int a22, int a23, int a24)
{
  if (a12 >= 0x608FEDF6) {
    int v27 = 1010542952;
  }
  else {
    int v27 = 635686783;
  }
  int v28 = 460628867 * ((&a19 + 663701623 - 2 * ((unint64_t)&a19 & 0x278F4877)) ^ 0x6B19CA0A);
  a23 = v27 - v28;
  a21 = v28 - 628183178;
  a22 = v28 + v25 + 2138962536;
  a19 = &STACK[0x58A7AA0862456916];
  a20 = a16;
  uint64_t v29 = sub_10005A720((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t))(*(void *)(v26
                                                      + 8LL
                                                      * ((101
                                                        * (a24 != v24 + ((v25 + 2122744248) & 0x81797F1F) - 545 - 495)) ^ v25))
                                          - 12LL))(v29);
}

uint64_t sub_100024A54( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v13
                                                                        + 8LL
                                                                        * (int)(((v12
                                                                                + 24
                                                                                + ((v12 + 1527559566) & 0xA4F349EE)
                                                                                + 117)
                                                                               * (a12 > 0x608FEDF5)) ^ v12))
                                                            - 4LL))( a1,  a2,  a3);
}

uint64_t sub_100024B04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned int a19, uint64_t a20, uint64_t a21, uint64_t a22, unsigned int a23)
{
  a23 = (v23 - 10) ^ (1225351577
                    * ((2 * (&a19 & 0x486B7D40) - &a19 + 932479672) ^ 0x140E5AAE));
  a20 = a15;
  a21 = v28;
  a22 = v24;
  ((void (*)(unsigned int *))(*(void *)(v27 + 8LL * (v23 - 299)) - 8LL))(&a19);
  a19 = (v23 - 19) ^ (1374699841 * (((&a19 | 0x5275727) + (~&a19 | 0xFAD8A8D8)) ^ 0x68D34F2F));
  a21 = a15;
  a20 = a10;
  v26(&a19);
  a20 = a15;
  a19 = (v23 + 482) ^ (1755732067
                     * (((&a19 | 0xA2C01B31) - &a19 + (&a19 & 0x5D3FE4C8)) ^ 0x7C06A6EA));
  uint64_t v29 = sub_1000565D0((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t))(*(void *)(v25
                                                      + 8LL
                                                      * ((1216 * ((_DWORD)a21 == 123 * (v23 ^ 0x16B) + 1645152924)) ^ v23))
                                          - 8LL))(v29);
}

uint64_t sub_100024CDC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
}

uint64_t sub_100024D28@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, int a8, int a9)
{
  return (*(uint64_t (**)(void))(v10 + 8LL * ((387 * ((((a9 ^ v9) > a6) ^ (a1 - 115) ^ 0x37) & 1)) ^ a1)))();
}

uint64_t sub_100024D6C()
{
  unsigned int v3 = v0 - ((v0 << (((v1 + 19) & 0xDF) - 92)) & 0x82B34678) - 1051090116;
  BOOL v4 = ((v1 ^ 0xECF2B880) & (2 * v3) ^ 0x80B20068) + (v3 ^ 0x3720FFC9) + 1845473215 == 1685654708;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (((2 * v4) | (4 * v4)) ^ v1)) - 8LL))();
}

uint64_t sub_100024E10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  BOOL v12 = v10 + v9 + 159818507 >= ((31 * (v8 ^ 0x165)) ^ (a8 + 1068)) - 928899231;
  return ((uint64_t (*)(void))(*(void *)(v11 + 8LL * ((v12 | (4 * v12)) ^ v8 ^ 0x7B9)) - 12LL))();
}

uint64_t sub_100024E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return ((uint64_t (*)(void))(*(void *)(v9
                                        + 8LL
                                        * ((61 * (v7 - a7 < (unint64_t)(v8 + 486) - 919)) ^ v8))
                            + 928899231LL
                            - ((v8 + 2002648558) & 0xBFFFE0E7)))();
}

uint64_t sub_100024ED0( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v10 + 8LL * (((v9 >= 3 * (a2 ^ 0x284u) - 889) * ((a2 - v8) ^ (a8 + 888))) ^ a2)))();
}

uint64_t sub_100024F08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v15 = (v12 + v10);
  __int128 v16 = *(_OWORD *)(v9 + v15 - 15);
  __int128 v17 = *(_OWORD *)(v9 + v15 - 31);
  uint64_t v18 = a7 + v15;
  *(_OWORD *)(v18 - 15) = v16;
  *(_OWORD *)(v18 - 31) = v17;
  return (*(uint64_t (**)(uint64_t))(v14
                                            + 8LL
                                            * ((303 * (929 * (v13 ^ (a8 + 859)) - 1826 == (v11 & 0xFFFFFFE0))) ^ (v8 + v13 + 309))))(929LL);
}

uint64_t sub_100024F70(uint64_t a1, uint64_t a2, int a3)
{
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * (a3 | (v3 != v4))) - ((a3 - 997) ^ 0x359LL)))();
}

uint64_t sub_100024F9C( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v10 + 8LL * ((1843 * ((v9 & 0x18) == ((a2 - v8) ^ (a8 + 1524) ^ 0x399))) ^ a2)))();
}

uint64_t sub_100024FD4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(a7 - 7 + (v10 + v8 - v11)) = *(void *)(v7 - 7 + (v10 + v8 - v11));
  return (*(uint64_t (**)(void))(v12 + 8LL * ((1414 * ((a1 ^ 0x2F5) + v11 - 356 == (v9 & 0xFFFFFFF8))) ^ a1)))();
}

uint64_t sub_100025020(int a1, int a2, uint64_t a3, int a4, int a5)
{
  *(void *)(a3 + (a4 - v6)) = *(void *)(v7 + (a4 - v6));
  return (*(uint64_t (**)(void))(v8 + 8LL * (((v5 + v6 - 356 == a2) * a5) ^ a1)))();
}

uint64_t sub_10002504C(uint64_t a1, int a2)
{
}

uint64_t sub_100025094@<X0>(uint64_t a1@<X6>, int a2@<W7>, int a3@<W8>)
{
  *(_BYTE *)(a1 + (v7 ^ (a2 + 1712) ^ (v5 - 821)) + v6) = *(_BYTE *)(v4
  return (*(uint64_t (**)(void))(v8 + 8LL * ((853 * (v6 - 1 == a3)) ^ (v3 + v7 + 465))))();
}

uint64_t sub_1000250D8()
{
  unsigned int v8 = v2
     + 535753261
  uint64_t v9 = v5;
  v1(v7);
  uint64_t v9 = v6;
  unsigned int v8 = ((v2 - 744574573) & 0x2C614F1F)
  v1(v7);
  return v3 ^ v0;
}

void sub_1000251E0(uint64_t a1)
{
  int v2 = 3804331 * (((a1 | 0xD29CC998) - (a1 | 0x2D633667) + 761476711) ^ 0xAC49EC6E);
  int v3 = *(_DWORD *)(a1 + 4);
  int v4 = *(_DWORD *)a1 ^ v2;
  unsigned int v5 = 1178560073
     * ((((&v41 | 0x135B03A) ^ 0xFFFFFFFE) - (~&v41 | 0xFECA4FC5)) ^ 0x445E37A7);
  int v6 = *(_DWORD *)(a1 + 8) ^ v2;
  unint64_t v17 = 3804331
      * (((a1 | 0xF8BBF308D29CC998LL) - (a1 | 0x7440CF72D633667LL) + 0x7440CF72D633667LL) ^ 0x3712930CAC49EC6ELL);
  int v7 = v3 + v2;
  unsigned int v41 = 1076023948 - v5;
  int v43 = v4 - v5 + 1172345383;
  uint64_t v25 = &STACK[0x5C6940C6B1BC7126];
  __int128 v42 = &STACK[0x5C6940C6B1BC7126];
  sub_100023C94((uint64_t)&v41);
  int v8 = v6;
  int v32 = v7 - 1515316656;
  int v16 = v7 + 1773184230;
  int v19 = v7 - 829826358;
  int v18 = v7 - 119409945;
  v13[1] = (char *)&v13[-147572436] + 1;
  uint64_t v20 = 55 * (v4 ^ 0x27u);
  uint64_t v28 = v4 ^ 0x666u;
  uint64_t v29 = &v40;
  int32x4_t v26 = vdupq_n_s32(0xC41E1BF2);
  int32x4_t v27 = vdupq_n_s32(0x620F0DFFu);
  unsigned int v22 = (v4 + 271127083) & 0xEFD6EFF9;
  int v15 = v4 + 1037830021;
  int v14 = v4 - 1343287479;
  uint64_t v34 = (v4 - 1343287479);
  int v30 = 622 * (v4 ^ 0x36);
  int v31 = v4;
  int32x4_t v24 = vdupq_n_s32(0x620F0DF9u);
  uint64_t v21 = a1;
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = (char *)*(&off_100079130 + (v4 ^ 0x1E)) - 8;
  uint64_t v23 = v20 + *(void *)&v10[8 * v4] - 1049;
  unsigned int v11 = v8 - 176919824 + ~(((v8 + 690444800) & 0x4C4D10FF ^ v8 & 0x10) << ((v4 + 64) ^ 0x75));
  char v35 = (HIBYTE(v11) ^ 0x4C) - ((v11 >> 23) & 0x64) + 50;
  char v36 = (BYTE2(v11) ^ 0x4D) - ((v11 >> 15) & 0x64) + 50;
  char v37 = (BYTE1(v11) ^ 0x10) - ((2 * (BYTE1(v11) ^ 0x10)) & 0x64) + 50;
  char v38 = (v8 - 16 + ~((v8 ^ v8 & 0x10) << ((v4 + 64) ^ 0x75))) ^ 0xDD;
  uint64_t v12 = *(void *)&v10[8
                      * ((26 * (((2 * v39) & 0xA ^ 8) + (v39 & 0x3F ^ 0x6F3FFFD1u) - 1866465281 < 0xFFFFFFC0)) ^ (v4 + 58))]
      - 8LL;
  uint64_t v33 = v9;
  __asm { BR              X13 }

uint64_t sub_1000255EC@<X0>(int a1@<W0>, uint64_t a2@<X2>, uint64_t a3@<X3>, int a4@<W8>)
{
  *(_BYTE *)(a3 + (a4 + v7)) = *(_BYTE *)(a2 + ((5 * (v4 ^ a1)) ^ (v6 + 1341)) + v5);
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((419 * ((a4 & 0xFFFFFFC0) != v8)) ^ v4)) - 8LL))();
}

uint64_t sub_100025638( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, unint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, int a38, char a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, int a47, int a48, int a49, int a50,int a51,int a52,int a53,unsigned int a54,int a55,unsigned __int8 a56)
{
  __int16 v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, char *))(v58 + 8LL * v56);
  HIDWORD(a12) = v57;
  uint64_t v63 = a56 ^ 0x5Fu;
  if ((_DWORD)v63 == 2)
  {
    BOOL v72 = (unint64_t)&a39 < a30 && v59 < (unint64_t)&a48;
    return ((uint64_t (*)(void, void))(*(void *)(v58
                                                               + 8LL
                                                               * (int)(((((a2 + 972) | 0x112) ^ 0x505) * v72) ^ (a2 + 1233)))
                                                   - (a29 ^ 0x65A)))( a54,  a54);
  }

  else if ((_DWORD)v63 == 1)
  {
    uint64_t v64 = ((_DWORD)a2 + 40) | 0x81u;
    int v65 = a2 + 169;
    BOOL v67 = (unint64_t)&a39 >= a30 || v59 >= (unint64_t)&a48;
    uint64_t v68 = (v64 + 637);
    v69 = (uint64_t (*)(uint64_t, uint64_t, void, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v58 + 8LL * (int)((v68 * v67) ^ v65)) - 4LL);
    return v69( v64,  1075421723LL,  v69,  v68,  &a39,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26);
  }

  else
  {
    a50 = v60 + 2 * (a50 ^ v60) - (v61 & (4 * (a50 ^ v60)));
    a51 = 2 * (a51 ^ v60) + v60 - (v61 & (4 * (a51 ^ v60)));
    a52 = 2 * (a52 ^ v60) + v60 - (v61 & (4 * (a52 ^ v60)));
    a53 = 2 * (a53 ^ v60) + v60 - (v61 & (4 * (a53 ^ v60)));
    return v62(v63, a2, 3005633205LL, a4, &a39);
  }

uint64_t sub_1000265C4( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, unsigned int a32, uint64_t a33, uint64_t a34, int a35)
{
  unsigned int v36 = a35 + 2117096340 + a7;
  BOOL v37 = v36 < 0xCB0A057B;
  BOOL v38 = v36 > a32;
  if (a32 < 0xCB0A057B != v37) {
    BOOL v39 = v37;
  }
  else {
    BOOL v39 = v38;
  }
  return ((uint64_t (*)(void))(*(void *)(v35 + 8LL * ((634 * !v39) ^ (a2 + 1022))) - 12LL))();
}

uint64_t sub_100026648(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
}

uint64_t sub_1000266A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8)
{
  *(_BYTE *)(a4 + v9) = *(_BYTE *)(v12 + (v8 + a3))
  return ((uint64_t (*)(void))(*(void *)(v11 + 8LL * (((v9 != 63) * v13) ^ v10)) - 12LL))();
}

uint64_t sub_1000266F8(uint64_t a1, uint64_t a2, int a3, int8x16_t *a4)
{
  *a4 = vaddq_s8( vsubq_s8( *(int8x16_t *)(v7 + (v4 + a3)),  vandq_s8( vaddq_s8(*(int8x16_t *)(v7 + (v4 + a3)), *(int8x16_t *)(v7 + (v4 + a3))),  v9)),  v8);
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (v5 + 317)) - 12LL))();
}

uint64_t sub_100026754( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13
                                                                       + 8LL
                                                                       * ((984
                                                                         * (((((_DWORD)a2 + 528) ^ (a13 - 1998991134 + (((_DWORD)a2 - 52) | 0x44u) + 1317 < 0xFFFFFFFB)) & 1) == 0)) ^ ((int)a2 + 441))))( a1,  a2,  a3,  a4);
}

void sub_1000267C8()
{
}

uint64_t sub_1000267E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16)
{
  BOOL v19 = a16 < 0xF3E5C5F5;
  return ((uint64_t (*)(void))(*(void *)(v18
                                        + 8LL
}

uint64_t sub_100026868@<X0>( int a1@<W0>, unsigned int a2@<W1>, int a3@<W2>, uint64_t a4@<X3>, char a5@<W5>, int a6@<W8>)
{
  BOOL v12 = a2 < v9;
  *(_BYTE *)(a4 + (a6 + v8)) = *(_BYTE *)(v11 + (v6 + a3))
  unsigned int v13 = a1 + v6 + 1;
  int v14 = v12 ^ (v13 < v9);
  BOOL v15 = v13 < a2;
  if (!v14) {
    BOOL v12 = v15;
  }
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * (((16 * !v12) | (32 * !v12)) ^ v7)) - 4LL))();
}

uint64_t sub_1000268E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, unint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, int a31, unsigned int a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, int a39, char a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49)
{
  int v52 = 628203409 * ((-671978737 - ((v51 - 168) | 0xD7F26B0F) + ((v51 - 168) | 0x280D94F0)) ^ 0xAA8598C3);
  *(_DWORD *)(v51 - 160) = v52 + v49 - 646;
  *(_DWORD *)(v51 - 156) = a15 - v52;
  STACK[0x358] = a24;
  uint64_t v53 = sub_1000384D0(v51 - 168);
  uint64_t v54 = a49 & 0x3F;
  *(&a40 + (v54 ^ 0x14)) = -78;
  return ((uint64_t (*)(uint64_t, void, uint64_t))(*(void *)(v50
                                                                       + 8LL
                                                                       * ((105 * ((v54 ^ 0x14) < 0x38)) ^ v49))
                                                           - ((v49 + 2049300052) & 0x85DA233C)
                                                           + 48LL))( v53,  a32,  3005633205LL);
}

uint64_t sub_1000269E0()
{
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8LL
                                            * ((((v0 - 1180579210) < 0x38) * (3 * (v2 ^ 0x1ED) - 42)) ^ (v2 + 461))))(50LL);
}

uint64_t sub_100026A28@<X0>(int a1@<W8>)
{
  uint64_t v4 = v1;
  uint64_t v5 = v2 + v1;
  else {
    uint64_t v6 = 56LL;
  }
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * (((((a1 - 905) ^ 0x68C) - 1039)
}

uint64_t sub_100026A80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)(a10 + v12 + (v10 ^ 0x68F)) = v14;
  return ((uint64_t (*)(void))(*(void *)(v13 + 8LL * (int)((624 * ((v11 & 0xFFFFFFFFFFFFFFF8LL) == 8)) | v10)) - 8LL))();
}

uint64_t sub_100026AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v7 + (v5 ^ a5)) = v10;
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * (int)(((v6 == 0) * v8) | v5)) - 8LL))();
}

uint64_t sub_100026AF4()
{
  return (*(uint64_t (**)(void))(v3 + 8LL * (((((v2 - 1) | 2) - 509) * (v0 != v1)) ^ v2)))();
}

uint64_t sub_100026B1C@<X0>(char a1@<W0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = a3 + v4;
  *(_BYTE *)(a2 + v6) = a1;
  return (*(uint64_t (**)(void))(v5
                              + 8LL
                              * ((((unint64_t)(v6 + 1) < 0x38) | (2 * ((unint64_t)(v6 + 1) < 0x38))) ^ v3 ^ 3)))();
}

uint64_t sub_100026B50(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)(a4 + v5 + v6) = a1;
  return (*(uint64_t (**)(void))(v7
                              + 8LL
                              * ((((unint64_t)(v5 + v6 + 1) < 0x38) | (2
                                                                            * ((unint64_t)(v5 + v6 + 1) < 0x38))) ^ v4)))();
}

void sub_100026B7C()
{
}

uint64_t sub_100026EB8()
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (((v1 != v0) * ((v2 - 1209) ^ 0x27D)) ^ v2)) - 12LL))();
}

uint64_t sub_100026F00@<X0>(uint64_t a1@<X3>, int a2@<W8>)
{
  uint64_t v7 = v2 + v4;
  *(_BYTE *)(a1 + v7) = v5;
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * ((((unint64_t)(v7 + 1) < 0x40) * v3) ^ (a2 + 1209))) - 12LL))();
}

void sub_100026F40()
{
}

uint64_t sub_100026F50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, int a36, char a37)
{
  BOOL v40 = (v38 & 0xFFFFFFFC) == ((v37 | 0x92) ^ 0x2E1) + 1998989753;
  return (*(uint64_t (**)(uint64_t, uint64_t, char *))(v39
                                                             + 8LL
                                                             * (((2
                                                                * (((19 * ((v37 | 0x92) ^ 0xE1)) ^ v40) & 1)) & 0xF7 | (8 * (((19 * ((v37 | 0x92) ^ 0xE1)) ^ v40) & 1))) ^ (v37 | 0x92))))( a1,  a2,  &a37);
}

uint64_t sub_100026FB4@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, int a3@<W8>)
{
  *(_BYTE *)(a2 + (a3 + v5)) = *(_BYTE *)(a1 + v3 - 1998989808);
  return (*(uint64_t (**)(void))(v7 + 8LL * ((1737 * (((v3 + 1LL) & 0xFFFFFFFCLL) == v6)) ^ (v4 - 313))))();
}

uint64_t sub_100027018( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t (*a20)(uint64_t), uint64_t a21, uint64_t a22, uint64_t a23, unint64_t a24)
{
  int v26 = 628203409 * ((~((v25 - 168) | 0x9F6F2C5F) + ((v25 - 168) & 0x9F6F2C5F)) ^ 0xE218DF93);
  *(_DWORD *)(v25 - 160) = v26 + v24 + 1001;
  *(_DWORD *)(v25 - 156) = 507371030 - v26;
  STACK[0x358] = a24;
  uint64_t v27 = sub_1000384D0(v25 - 168);
  return a20(v27);
}

uint64_t sub_100027088( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, int a49, __int16 a50,char a51,char a52,int a53)
{
  if (BYTE4(a32) == 2) {
    return ((uint64_t (*)(void))(*(void *)(v53
  }
                                          + 8LL
  if (BYTE4(a32) == 1) {
    return ((uint64_t (*)(void))(*(void *)(v53
  }
                                          + 8LL
                                          * (((2 * (a53 == 369984849)) | (16 * (a53 == 369984849))) ^ ((int)a2 + 1050)))
                              - ((2 * (_DWORD)a2) ^ 0x426u)
                              + 1090LL))();
  uint64_t v55 = 103 * (a2 ^ 0x31);
  unint64_t v56 = ((unint64_t)&a37 ^ 0x7DFFFDE1BDDDED78LL ^ v55)
      + ((2LL * (void)&a37) & 0xFBFFFBC37BBBDEF0LL)
      - 0x601C90400009019ELL;
  a52 = ((v56 + 35) ^ 0xBA) * (v56 + 103 * (a2 ^ 0x31) + 49);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 + 8LL * (int)v55) - 4LL))( a1,  a2,  a19,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41);
}

void sub_1000273CC()
{
}

uint64_t sub_1000273D4@<X0>(int a1@<W8>)
{
  int v2 = 235795823 * ((((v1 - 168) | 0xEB9F054C) - ((v1 - 168) & 0xEB9F054C)) ^ 0x7F324C15);
  *(_DWORD *)(v1 - 160) = v2 + 1596901039;
  *(_DWORD *)(v1 - 132) = (a1 + 1809) ^ v2;
  uint64_t result = ((uint64_t (*)(uint64_t))((char *)*(&off_100079130 + a1 - 11) - 4))(v1 - 168);
  *(_DWORD *)(v4 + 12) = *(_DWORD *)(v1 - 136);
  return result;
}

void cp2g1b9ro(uint64_t a1, uint64_t a2)
{
  if (a1) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  __asm { BR              X8 }

uint64_t sub_100027558( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15)
{
  a15 = 108757529
  uint64_t v17 = sub_10005A350(&a14);
  return ((uint64_t (*)(uint64_t))(*(void *)(v16 + 8LL * ((924 * (a14 == 1645153785)) ^ v15)) - 4LL))(v17);
}

uint64_t sub_1000275E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t *a14, int a15, unsigned int a16)
{
  a16 = 1307 - 460628867 * ((&a14 & 0x9E53D03D | ~(&a14 | 0x9E53D03D)) ^ 0x2D3AADBF);
  a14 = &STACK[0x4BD26FD1213425B9];
  sub_100035EF0((uint64_t)&a14);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 + 8LL * ((17 * (a15 == v16)) ^ 0x4AD))
                                                                                                - 4LL))( v18,  v19,  v20,  v21,  v22,  v23,  v24);
}

uint64_t sub_10002768C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, unsigned int a16, uint64_t a17)
{
  a16 = v19 + 1224239923 * ((&a14 & 0xD2B4AA2E | ~(&a14 | 0xD2B4AA2E)) ^ 0xDFF8A806) + 1201;
  a17 = v17;
  a15 = a12;
  uint64_t v23 = ((uint64_t (*)(int *))(*(void *)(v21 + 8LL * (v19 ^ 0xB0)) - 12LL))(&a14);
  return ((uint64_t (*)(uint64_t))(*(void *)(v20
                                                      + 8LL * (((a14 == v18) * (v22 + v19 + 840366501 + 600)) ^ v19))
                                          - 4LL))(v23);
}

uint64_t sub_100027740( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t *a14, uint64_t a15, unsigned int a16, unsigned int a17, unsigned int a18, int a19)
{
  unsigned int v23 = 460628867 * (&a14 ^ 0x4C96827D);
  a18 = 635686783 - v23;
  a14 = &STACK[0x58A7AA08624568F6];
  a15 = a12;
  a16 = v23 - 910010299;
  a17 = v23 + v20 + 2138963185;
  uint64_t v24 = sub_10005A720((uint64_t)&a14);
  return ((uint64_t (*)(uint64_t))(*(void *)(v22
                                                      + 8LL
                                                      * (((a19 == v19) * (((v20 ^ (v21 + 602)) - v21 + 300) ^ 0x789)) ^ v20))
                                          - 4LL))(v24);
}

uint64_t sub_1000277F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t *a11, uint64_t a12, uint64_t a13, unsigned int a14, unint64_t *a15, unint64_t *a16)
{
  a14 = (v20 - 390) ^ (1374699841
                     * ((&a14 - 762734092 - 2 * (&a14 & 0xD28999F4)) ^ 0xBF7D81FD));
  a15 = &STACK[0x384B062F07609560];
  a16 = a11;
  int v21 = (void (*)(unsigned int *))(*(void *)(v19 + 8LL * (v20 ^ 0x26A)) - 8LL);
  v21(&a14);
  a14 = (v20 - 390) ^ (1374699841
                     * ((&a14 + 2125390926 - 2 * (&a14 & 0x7EAEE44E)) ^ 0x135AFC47));
  a15 = &STACK[0x384B062F07609564];
  a16 = a11;
  v21(&a14);
  a14 = (v20 + 111) ^ (1755732067
                     * ((791046139 - (&a14 | 0x2F2667FB) + (&a14 | 0xD0D99804)) ^ 0xE1F25DF));
  a15 = a11;
  uint64_t v22 = sub_1000565D0((uint64_t)&a14);
  return ((uint64_t (*)(uint64_t))(*(void *)(v18
                                                      + 8LL
                                                      * (((((v20 - v16 - 1) ^ ((_DWORD)a16 == v17)) & 1)
                                                        * (v20 ^ 0x2F5)) ^ v20))
                                          - 4LL))(v22);
}

uint64_t sub_10002795C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  return ((uint64_t (*)(void))(*(void *)(v15 + 8LL * (int)((1534 * (a14 == v14)) ^ v16 ^ 0x2A)) - (v16 ^ 0x2DBLL)))();
}

uint64_t sub_1000279A0()
{
  void *v0 = v2 ^ v7 ^ 0x5019F7ADu;
  uint64_t v10 = v5;
  int v9 = 535753261 * (((v8 | 0x7AAA3359) + (~v8 | 0x8555CCA6)) ^ 0x705E3D77) - 840365647 + v2;
  v4(v8);
  int v9 = 535753261 * ((v8 - 1904952353 - 2 * ((unint64_t)v8 & 0x8E74BBDF)) ^ 0x8480B5F0)
     - 840365647
     + v2;
  uint64_t v10 = v6;
  v4(v8);
  return v1 ^ 0x620F0DF9u;
}

uint64_t sub_100027AB0(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 - 628203409 * (a1 ^ 0x82880C33) + 2;
  signed int v2 = (v1 ^ 0xF680737B) + *(_DWORD *)(*(void *)(a1 + 8) - 0xC7F991DE6408E19LL);
  if (v2 < 0) {
    signed int v2 = -v2;
  }
  return ((uint64_t (*)(void))(*((void *)*(&off_100079130 + v1 - 177)
                              + ((((v2 ^ 0xBDEDFFF6) + 1108475913 + ((2 * v2) & 0x7BDBFFEC) < 0x7FFFFFFF)
                                * ((v1 - 1262923266) & 0x4B46ADFF ^ 0x60E)) ^ v1)
                              - 1)
                            - (((v1 - 18) | 0x10u) ^ 0xD5LL)))();
}

uint64_t sub_100027BB4(uint64_t a1, int a2, int a3, int a4, uint64_t a5)
{
  return ((uint64_t (*)(void))(*(void *)(a5
                                        + 8LL * (((*(_DWORD *)(*v5 + 4LL * v6) != a2) * (((a4 - 22) | 0x18) ^ a3)) ^ a4))
                            - 12LL))();
}

void sub_100027BEC()
{
}

uint64_t sub_100027BF4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  *(_DWORD *)(result + 4) = a6;
  return result;
}

void sub_100027BFC(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    BOOL v2 = *(void *)(a1 + 8) == 0x58A7AA08624568E6LL;
  }
  else {
    BOOL v2 = 1;
  }
  char v3 = v2;
  int v1 = *(_DWORD *)(a1 + 16) ^ (1755732067 * ((2 * (a1 & 0x47DE7202) - a1 - 1205760515) ^ 0x66E73026));
  __asm { BR              X8 }

uint64_t sub_100027D28()
{
  LODWORD(STACK[0x468]) = v0;
  uint64_t v5 = v4 - 200;
  *(_BYTE *)uint64_t v5 = (-85 * ((2 * ((v4 + 56) & 0x38) - (v4 + 56) - 57) ^ 0x31)) ^ 0x2E;
  STACK[0x2A8] = (unint64_t)&STACK[0x4CAF57822185C49D];
  *(void *)(v5 + _Block_object_dispose(va, 8) = &STACK[0x4CAF57822185C49D];
  STACK[0x2B0] = (unint64_t)&STACK[0x705CCB0086AF2F6E];
  *(void *)(v5 + 24) = &STACK[0x705CCB0086AF2F6E];
  *(_DWORD *)(v4 - 184) = 3804331 * ((2 * ((v4 - 200) & 0x59AF7138) - (v4 - 200) - 1504670009) ^ 0xD885AB31) + v2 + 856;
  unsigned int v6 = *(uint64_t (**)(uint64_t))(v1 + 8LL * (v2 ^ 0x2CE));
  STACK[0x2A0] = (unint64_t)v6;
  uint64_t v7 = v6(v4 - 200);
  int v8 = *(_DWORD *)(v4 - 180);
  LODWORD(STACK[0x618]) = v8;
  return (*(uint64_t (**)(uint64_t))(v3
                                            + 8LL
                                            * (((v8 == 1645153785) * ((((v2 + 592) | 4) + 556) ^ (v2 - 231))) ^ v2)))(v7);
}

#error "10002865C: call analysis failed (funcsize=363)"
uint64_t sub_100028660()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  STACK[0x2C8] = v1;
  STACK[0x4D8] = 0LL;
  unsigned int v6 = 235795823 * ((565679011 - ((v5 - 200) | 0x21B793A3) + ((v5 - 200) | 0xDE486C5C)) ^ 0x4AE52505);
  v4[1] = 0x15C2A15CF2725D85LL;
  uint64_t v7 = STACK[0x2B8];
  *(_DWORD *)(v5 - 200) = v6 ^ 0xE4EF48AC;
  *(_DWORD *)(v5 - 164) = v3 - v6 - 440;
  int v8 = STACK[0x2C0];
  v4[2] = v7;
  v4[3] = v8;
  int v9 = (uint64_t (*)(uint64_t))(*(void *)(v0 + 8LL * (v3 - 626)) - 12LL);
  STACK[0x2D0] = (unint64_t)v9;
  uint64_t v10 = v9(v5 - 200);
  return ((uint64_t (*)(uint64_t))(*(void *)(v2 + 8LL * ((22 * (*(_DWORD *)(v5 - 168) != 1645153785)) ^ v3))
                                          - ((v3 ^ 0x14Du)
                                           + 676)
                                          + 1249LL))(v10);
}

uint64_t sub_100028740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  LODWORD(STACK[0x4AC]) = v4;
  STACK[0x620] = STACK[0x460];
  LODWORD(STACK[0x618]) = v4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                       + 8LL
                                                                       * ((((179 * (((v3 - 1197) | 0x44) ^ 0x7B)
                                                                           - 1018159216) & 0x3CAFDFCB ^ 0x597)
                                                                         * (v4 == v6)) ^ ((v3 - 1197) | 0x44))))( a1,  a2,  a3,  2649773600LL);
}

void sub_10002D9D8()
{
}

uint64_t sub_10002DA70(unint64_t a1)
{
  *(void *)(v5 + 304) = v2 - 176;
  *(void *)(v5 + 96) = a1;
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (v1 | (2 * (v4 > a1)))) - ((v1 - 22) ^ 0x33FLL)))();
}

uint64_t sub_10002DB14@<X0>(uint64_t a1@<X0>, char a2@<W3>, int a3@<W8>)
{
  *(_BYTE *)(a1 + (v6 + v7)) = *(_BYTE *)(v9 + (v6 + v7)) ^ *(_BYTE *)(v4
                                                                                                 + ((v6 + v7) & 0xFLL)) ^ *(_BYTE *)(v5 + ((v6 + v7) & 0xFLL)) ^ *(_BYTE *)(((v6 + v7) & 0xFLL) + v3 + 2) ^ (((v6 + v7) & 0xF) * (a3 ^ 0x80)) ^ a2;
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((120 * ((v6 + 1 + v7) < 0x150)) ^ a3)) - 8LL))();
}

uint64_t sub_10002DB7C@<X0>( uint64_t a1@<X0>, char a2@<W3>, int a3@<W5>, char a4@<W6>, int a5@<W7>, int a6@<W8>)
{
  uint64_t v13 = (v9 + a3);
  *(_BYTE *)(a1 + v13) = *(_BYTE *)(v12 + v13) ^ *(_BYTE *)(v7 + (v13 & 0xF)) ^ *(_BYTE *)(v8 + (v13 & 0xF)) ^ *(_BYTE *)((v13 & 0xF) + v6 + 2) ^ ((v13 & 0xF) * a4) ^ a2;
  return ((uint64_t (*)(void))(*(void *)(v11 + 8LL * (((v9 - 1 != v10) * a5) ^ a6)) - 8LL))();
}

uint64_t sub_10002DBDC@<X0>( int8x16_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int8x16_t *a14)
{
  int v17 = (int8x16_t *)((char *)&STACK[0x6C0] + STACK[0x3D0] + (a7 ^ 0x991D124D801601E0LL));
  *int v17 = veorq_s8(*a14, (int8x16_t)xmmword_100061B50);
  uint64_t v18 = v16[47];
  v16[48] = a1;
  v16[49] = a1;
  v16[47] = 435 * (v14 ^ 0x662u) + v18 - 1708;
  return ((uint64_t (*)(int8x16_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 + 8LL * (v14 ^ ((v17 == a1) | ((v17 == a1) << 8))))
                                                                                           - 8LL))( a1,  a2,  a3,  a4,  a5,  a6);
}

uint64_t sub_10002DC60@<X0>( unsigned __int8 *a1@<X0>, int a2@<W4>, char a3@<W7>, uint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  int v61 = (unsigned __int8 *)&STACK[0x19C0] + a4;
  *int v61 = *a1;
  *(void *)(v61 + 1) = *(void *)(a1 + 1);
  *(_DWORD *)(v61 + 9) = *(_DWORD *)(a1 + 9);
  *(_WORD *)(v61 + 13) = *(_WORD *)(a1 + 13);
  v61[15] = a1[15];
  uint64_t v62 = *((void *)a1 + 1);
  *((void *)v61 + 2) = *(void *)a1;
  *((void *)v61 + 3) = v62;
  int v63 = (v57 - 589705933) & 0x23262F86;
  uint64_t v64 = *(void *)(v59 + 8LL * (v57 - 1560)) - 12LL;
  uint64_t v65 = *(void *)(v59 + 8LL * (v57 - 1531));
  uint64_t v66 = *(void *)(v59 + 8LL * (v57 - 1546)) - 12LL;
  char v67 = *(_BYTE *)(v66 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 14) ^ 0x86LL));
  char v68 = *(_BYTE *)(v66 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 10) ^ 0xCBLL));
  LODWORD(v62) = (((*(unsigned __int8 *)(v65 + (v61[8] ^ 0x65LL)) + (v61[8] ^ a2) - 123) ^ 0xF5) << 24) | (((v68 ^ (16 * v68)) ^ 0x25) << 8);
  int v69 = ((v61[7] ^ 0x90) + *(_BYTE *)(v64 + (v61[7] ^ 0x7CLL)) - 85) | ((((v61[4] ^ 0x13)
  uint64_t v70 = *(void *)(v59 + 8LL * (v57 - 1733));
  unsigned int v71 = *(unsigned __int8 *)(v70 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 1) ^ 0x1ALL));
  int v72 = (v71 >> 1) ^ (((((v71 ^ 0xA7) + (v71 & 0xD5 ^ a3) + 1) ^ v71 & 0xDF) & 0xF0) >> 4) ^ 0x3C;
  int v73 = ((v61[3] ^ 0xB8) + *(_BYTE *)(v64 + (v61[3] ^ 0x54LL)) - 85) | ((v71 ^ 0x37 ^ (v72 - ((2 * v72) & 0xA6) + 83)) << 16);
  LOBYTE(v71) = *(_BYTE *)(v66 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 6) ^ 0x2ELL));
  unsigned int v74 = *(_BYTE *)(v70 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 13) ^ 0x5BLL)) ^ 0x72;
  unsigned int v75 = v69 & 0xFFFF00FF | (((v71 ^ (16 * v71)) ^ 0x39) << 8);
  int v76 = *(unsigned __int8 *)(v70 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 13) ^ 0x5BLL)) ^ 0x72 ^ (v74 >> 4) ^ (v74 >> 1);
  int v77 = (((v67 ^ (16 * v67)) ^ 0xE9) << 8) | ((v76 - ((2 * v76) & 0x2E) + 23) << 16);
  LOBYTE(v72) = *(_BYTE *)(v70 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 5) ^ 0xEDLL));
  int v78 = ((v72 ^ 0x72) >> 4) ^ ((v72 ^ 0x72) >> 1);
  uint64_t v324 = v70;
  uint64_t v326 = v65;
  uint64_t v327 = v64;
  LODWORD(v62) = v62 & 0xFF00FF00 | ((v61[11] ^ 0x3E) + *(_BYTE *)(v64 + (v61[11] ^ 0xD2LL)) - 85) | (((*(_BYTE *)(v70 + (v61[9] ^ 0x38LL)) ^ ((*(_BYTE *)(v70 + (v61[9] ^ 0x38LL)) ^ 0x72) >> 4) ^ ((*(_BYTE *)(v70 + (v61[9] ^ 0x38LL)) ^ 0x72) >> 1)) ^ 0xD9) << 16);
  uint64_t v325 = v66;
  unsigned int v79 = v73 & 0xFFFF00FF | (((*(unsigned __int8 *)(v65 + (*v61 ^ 0x81LL)) + (*v61 ^ 0xD0) - 123) ^ 0x3C) << 24) | (((*(_BYTE *)(v66 + (v61[2] ^ 0x22LL)) ^ (16 * *(_BYTE *)(v66 + (v61[2] ^ 0x22LL)))) ^ 0x17) << 8);
  LODWORD(STACK[0x428]) = (v77 & 0xFFFFFF00 | ((((v61[12] ^ 0x13) + *(unsigned __int8 *)(v65 + (v61[12] ^ 0x42LL)) - 123) ^ 0xE6) << 24) | (*(_BYTE *)(v64 + (v61[15] ^ 0x38LL)) + (v61[15] ^ 0xD4) - 85)) ^ 0x5DA22AEE;
  LODWORD(STACK[0x3D8]) = v79 ^ 0x29843879;
  LODWORD(STACK[0x300]) = (v75 & 0xFF00FFFF | ((v72 ^ 0x6C ^ (v78
                                                                                              - ((2 * v78) & 0x62)
                                                                                              + 49)) << 16)) ^ HIDWORD(a34);
  LODWORD(STACK[0x408]) = v62 ^ 0x18D17C97;
  v322 = *(_BYTE **)(v60 + 384);
  v323 = *(unsigned __int8 **)(v60 + 392);
  STACK[0x420] = 14LL;
  HIDWORD(v333) = (v63 ^ 0x619) + 301;
  uint64_t v80 = v66;
  LODWORD(v61) = *(unsigned __int8 *)(v66 + (BYTE4(v333) ^ 0x15u ^ v323[14]));
  STACK[0x320] = 4LL;
  uint64_t v81 = v323[4];
  unsigned int v82 = (((16 * (_DWORD)v61) ^ 0xFFFFFFA0) - ((2 * ((16 * (_DWORD)v61) ^ 0xFFFFFFA0)) & 0x60) + 58) ^ v61;
  LOBYTE(v61) = *(_BYTE *)(v65 + (v81 ^ 0xE6));
  STACK[0x460] = 15LL;
  int v83 = v323[15];
  unsigned __int8 v84 = ((_BYTE)v61 + (v81 ^ 0xB7) - 123) ^ 0xE5;
  if ((v83 & 0x20) != 0) {
    int v85 = -32;
  }
  else {
    int v85 = 32;
  }
  uint64_t v86 = (v85 + v83);
  int v87 = *(unsigned __int8 *)(v64 + (v86 ^ 0xDD));
  STACK[0x418] = 6LL;
  int v88 = *(unsigned __int8 *)(v66 + (v323[6] ^ 0x51LL));
  int v339 = v87 + (v86 ^ 0x31);
  STACK[0x328] = 12LL;
  STACK[0x2D0] = 0LL;
  HIDWORD(v89) = v88 ^ (((16 * v88) ^ 0xFFFFFFA0) - ((2 * ((16 * v88) ^ 0xFFFFFFA0)) & 0x60) + 58) ^ 0x3F;
  LODWORD(v89) = BYTE4(v89) & 0xF8;
  unint64_t v90 = ((v89 >> 3) | ((unint64_t)v84 << 13)) ^ 0x58F620A6;
  int v91 = (v90 >> 21) | ((_DWORD)v90 << 11);
  int v338 = *(unsigned __int8 *)(v65 + (v323[12] ^ 0xF7) - 2 * ((v323[12] ^ 0xF7) & 0xAEu) + 174) - (v323[12] ^ 0xF7);
  uint64_t v92 = *v323;
  STACK[0x3D0] = 3LL;
  uint64_t v93 = v323[3];
  int v94 = *(unsigned __int8 *)(v65 + (v92 ^ 0xD8)) + (v92 ^ 0x76) - 2 * (v92 ^ 0x76);
  STACK[0x400] = 8LL;
  int v336 = (v93 ^ 0xFFFFFFBB) + *(unsigned __int8 *)(v64 + (v93 ^ 0x57));
  char v95 = (v323[8] ^ 0xA7) + *(_BYTE *)(v65 + (v323[8] ^ 0xF6LL));
  STACK[0x3C0] = 7LL;
  LOBYTE(v93) = (v323[7] ^ 0xE9) + *(_BYTE *)(v64 + (v323[7] ^ 5LL)) - 85;
  STACK[0x298] = 13LL;
  int v96 = *(unsigned __int8 *)(v70 + (v323[13] ^ 0x12LL));
  unsigned int v97 = v96 ^ ((((v96 ^ 0x72u) >> 3) & 4 ^ v96 & 0xA4 | ((v96 ^ 0x72u) >> 3) & 0xFFFFFFFB ^ (v96 ^ 0x72) & 0x5A) >> 1);
  LOBYTE(v96) = *(_BYTE *)(v70 + (v323[5] ^ 0x9CLL));
  int v98 = ((v96 ^ 0x72) >> 4) ^ ((v96 ^ 0x72) >> 1);
  int v99 = v93 | ((v96 ^ 0xE6 ^ (v98 - ((2 * v98) & 0x62) + 49)) << 16);
  STACK[0x290] = 9LL;
  int v100 = *(unsigned __int8 *)(v70 + (v323[9] ^ 0x76LL));
  unsigned int v101 = (v100 ^ 0x72u) >> 3;
  char v102 = v100 & 8 | 0x37;
  int v103 = v100 ^ ((((v101 + v102 - 55) ^ (v100 ^ 0x72) & 0xF7) & 0xFE) >> 1);
  STACK[0x228] = 1LL;
  char v104 = *(_BYTE *)(v64 + (v323[11] ^ 0x12LL)) + (v323[11] ^ 0xFE);
  unsigned int v105 = *(_BYTE *)(v70 + (v323[1] ^ 0xCFLL)) ^ 0x72;
  int v106 = *(unsigned __int8 *)(v70 + (v323[1] ^ 0xCFLL)) ^ 0x72 ^ (v105 >> 4) ^ (v105 >> 1);
  STACK[0x258] = 10LL;
  char v107 = *(_BYTE *)(v80 + (v323[10] ^ 0xFBLL));
  uint64_t v108 = *(void *)(v59 + 8LL * (v63 - 769)) - 4LL;
  HIDWORD(v331) = (v107 ^ (16 * v107)) ^ 0x23;
  int v109 = *(_DWORD *)(v108 + 4LL * ((v107 ^ (16 * v107)) ^ 0xACu));
  HIDWORD(v110) = v109 ^ 0x7763;
  LODWORD(v110) = v109 ^ 0x55D90000;
  uint64_t v111 = *(void *)(v59 + 8LL * (v63 - 704)) - 8LL;
  LODWORD(v333) = v97;
  int v112 = *(_DWORD *)(v111 + 4LL * (v97 ^ 0x17));
  HIDWORD(v340) = v63;
  LODWORD(v331) = v94 - 124;
  uint64_t v113 = *(void *)(v59 + 8LL * (v63 - 734)) - 4LL;
  int v114 = (v110 >> 16) ^ *(_DWORD *)(v113 + 4LL * ((v94 - 124) ^ 0xF9u)) ^ (16 * (v112 ^ 0xB4C82AC9)
                                                                                          + 1452181747
                                                                                          - ((32 * (v112 ^ 0xB4C82AC9)) & 0xAD1D11E0));
  unsigned int v115 = v112 ^ (v114 - 905743237 - ((2 * v114) & 0x9406E8F6));
  HIDWORD(v330) = v99 ^ v91;
  unsigned int v116 = v99 ^ v91 ^ 0xDD03A24B;
  unsigned int v117 = (v99 ^ v91) ^ 0x78;
  uint64_t v118 = *(void *)(v59 + 8LL * (v63 ^ 0x394)) - 8LL;
  LODWORD(v334) = v82;
  int v119 = *(_DWORD *)(v108 + 4LL * (v82 ^ 0x71u));
  unsigned int v120 = *(_DWORD *)(v118 + 4LL * v117) ^ v115;
  HIDWORD(v110) = v119 ^ 0x7763;
  LODWORD(v110) = v119 ^ 0x55D90000;
  unint64_t v332 = __PAIR64__(v103, v106);
  unsigned int v121 = *(_DWORD *)(v111 + 4LL * (v106 ^ 0xBFu)) ^ 0xB4C82AC9;
  int v122 = (v110 >> 16) ^ (16 * v121 + 1452181747 - ((32 * v121) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * HIBYTE(v116));
  HIDWORD(v329) = (v104 - 85);
  unsigned int v123 = *(_DWORD *)(v118 + 4LL * (HIDWORD(v329) ^ 0xB9u)) ^ v121 ^ (v122 - 905743237 - ((2 * v122) & 0x9406E8F6));
  unsigned int v124 = *(_DWORD *)(v111 + 4LL * BYTE2(v116)) ^ 0xB4C82AC9;
  unsigned int v125 = *(unsigned __int8 *)(v80 + (v323[2] ^ 0x26LL)) ^ 0xFFFFFF82;
  LODWORD(v329) = v125 ^ (16 * v125);
  int v126 = *(_DWORD *)(v108 + 4LL * (v329 ^ 0xFBu));
  HIDWORD(v110) = v126 ^ 0x7763;
  LODWORD(v110) = v126 ^ 0x55D90000;
  HIDWORD(v32_Block_object_dispose(va, 8) = (v95 - ((2 * v95 + 10) & 0x4E) - 84);
  int v127 = (v110 >> 16) ^ *(_DWORD *)(v113 + 4LL * (HIDWORD(v328) ^ 0x40u)) ^ (16 * v124
                                                                           + 1452181747
                                                                           - ((32 * v124) & 0xAD1D11E0));
  LODWORD(v330) = v339 - 85;
  unsigned int v128 = *(_DWORD *)(v118 + 4LL * ((v339 - 85) ^ 0xEBu)) ^ v124 ^ (v127
                                                                                  - 905743237
                                                                                  - ((2 * v127) & 0x9406E8F6));
  unsigned int v129 = *(_DWORD *)(v111 + 4LL * (v103 ^ 0xEu)) ^ 0xB4C82AC9;
  int v130 = *(_DWORD *)(v108 + 4LL * (BYTE1(v91) ^ 0x31u));
  HIDWORD(v110) = v130 ^ 0x7763;
  LODWORD(v110) = v130 ^ 0x55D90000;
  int v131 = (v110 >> 16) ^ *(_DWORD *)(v113 + 4LL * ((v338 - 124) ^ 0xF7u)) ^ (16 * v129
                                                                                           + 1452181747
                                                                                           - ((32 * v129) & 0xAD1D11E0));
  HIDWORD(a20) = v336 - 85;
  LODWORD(v32_Block_object_dispose(va, 8) = v338 - 124;
  unsigned int v132 = *(_DWORD *)(v118 + 4LL * ((v336 - 85) ^ 0x33u)) ^ v129 ^ (v131
                                                                                  - 905743237
                                                                                  - ((2 * v131) & 0x9406E8F6));
  unsigned int v133 = *(_DWORD *)(v111 + 4LL * (BYTE2(v132) ^ 0xBBu)) ^ 0xB4C82AC9;
  int v134 = *(_DWORD *)(v108 + 4LL * (BYTE1(v128) ^ 0xF4u));
  HIDWORD(v110) = v134 ^ 0x7763;
  LODWORD(v110) = v134 ^ 0x55D90000;
  BYTE1(v134) = BYTE1(v123) ^ 0xAD;
  unsigned int v135 = v133 ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v120) ^ 0xE3)) ^ *(_DWORD *)(v118
                                                                            + 4LL * (v123 ^ 0xDBu)) ^ (16 * v133 + 1452181747 - ((32 * v133) & 0xAD1D11E0)) ^ (v110 >> 16);
  int v136 = *(_DWORD *)(v111 + 4LL * (BYTE2(v120) ^ 0x24u));
  int v137 = *(_DWORD *)(v108 + 4LL * ((unsigned __int16)(v132 ^ 0x22E) >> 8));
  HIDWORD(v110) = v137 ^ 0x7763;
  LODWORD(v110) = v137 ^ 0x55D90000;
  int v138 = (16 * (v136 ^ 0xB4C82AC9) + 1452181747 - ((32 * (v136 ^ 0xB4C82AC9)) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * ((v123 ^ 0xF15ADDB) >> 24)) ^ (v110 >> 16);
  unsigned int v139 = v138 - 905743237 - ((2 * v138) & 0x9406E8F6);
  int v140 = *(_DWORD *)(v118 + 4LL * (v128 ^ 0x80u)) ^ v136;
  unsigned int v141 = *(_DWORD *)(v111 + 4LL * (BYTE2(v123) ^ 0xD6u)) ^ 0xB4C82AC9;
  unsigned int v142 = (16 * v141 + 1452181747 - ((32 * v141) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v128) ^ 0x19));
  int v143 = *(_DWORD *)(v108 + 4LL * (BYTE1(v120) ^ 0xCCu));
  HIDWORD(v110) = v143 ^ 0x7763;
  LODWORD(v110) = v143 ^ 0x55D90000;
  unsigned int v144 = *(_DWORD *)(v118 + 4LL * (v132 ^ 0x2Eu)) ^ v141 ^ (v110 >> 16) ^ (v142
                                                                                          - 905743237
                                                                                          - ((2 * v142) & 0x9406E8F6));
  int v145 = *(_DWORD *)(v111 + 4LL * (BYTE2(v128) ^ 0x32u));
  int v146 = *(_DWORD *)(v108 + 4LL * BYTE1(v134));
  HIDWORD(v110) = v146 ^ 0x7763;
  LODWORD(v110) = v146 ^ 0x55D90000;
  int v147 = (v110 >> 16) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v132) ^ 0xBD)) ^ (16 * (v145 ^ 0xB4C82AC9)
                                                                         + 1452181747
                                                                         - ((32 * (v145 ^ 0xB4C82AC9)) & 0xAD1D11E0));
  unsigned int v148 = v145 ^ *(_DWORD *)(v118 + 4LL * (v120 ^ 0x69u)) ^ 0xC501FC0D ^ (v147
                                                                                        - 905743237
                                                                                        - ((2 * v147) & 0x9406E8F6));
  unsigned int v149 = v148
       - ((2 * v148) & 0x5F186BF6)
       + 797718011
       - ((2 * (v148 - ((2 * v148) & 0x5F186BF6) + 797718011)) & 0xFCE7E61C)
       - 25955570;
  int v150 = *(_DWORD *)(v111 + 4LL * (BYTE2(v149) ^ 0xB0u));
  BYTE2(v132) = BYTE2(v144) ^ 0xEB;
  int v151 = *(_DWORD *)(v108 + 4LL * ((unsigned __int16)(v144 ^ 0xDFF9) >> 8));
  unsigned int v152 = (16 * (v150 ^ 0xB4C82AC9) + 1452181747 - ((32 * (v150 ^ 0xB4C82AC9)) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v135) ^ 0x5C)) ^ (((v151 ^ 0x55D97763u) >> (v135 & 0x10 ^ 0x10) >> (v135 & 0x10)) + ((v151 << 16) ^ 0x77630000));
  unsigned int v153 = *(_DWORD *)(v118 + 4LL * ((v140 ^ v139) ^ 0x10u)) ^ v150 ^ (v152
                                                                                    - 905743236
                                                                                    + ~((2 * v152) & 0x9406E8F6));
  LOWORD(v150) = v135 ^ 0xA05B;
  unsigned int v154 = *(_DWORD *)(v111 + 4LL * ((v135 ^ 0xB559A05B) >> 16)) ^ 0xB4C82AC9;
  unsigned int v155 = (16 * v154 + 1452181747 - ((32 * v154) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * ((v140 ^ ~v139) >> 24));
  int v156 = *(_DWORD *)(v108 + 4LL * (BYTE1(v149) ^ 0x60u));
  HIDWORD(v110) = v156 ^ 0x7763;
  LODWORD(v110) = v156 ^ 0x55D90000;
  unsigned int v157 = *(_DWORD *)(v118 + 4LL * (v144 ^ 0xF9u)) ^ v154 ^ ((v155 ^ (v110 >> 16))
                                                                           - 905743237
                                                                           - ((2 * (v155 ^ (v110 >> 16))) & 0x9406E8F6));
  int v158 = *(_DWORD *)(v113 + 4LL * (HIBYTE(v144) ^ 5));
  HIDWORD(v110) = v158 ^ 0xF3;
  LODWORD(v110) = v158 ^ 0x568E8800;
  unsigned int v159 = *(_DWORD *)(v111 + 4LL * (((v140 ^ v139) >> 16) ^ 0xFDu)) ^ 0xB4C82AC9;
  unsigned int v160 = (((v110 >> 10) ^ 0x25EB099C) << 10) ^ (16 * v159) ^ (((v110 >> 10) ^ 0x25EB099C) >> 22);
  int v161 = *(_DWORD *)(v108 + 4LL * BYTE1(v150));
  HIDWORD(v110) = v161 ^ 0x7763;
  LODWORD(v110) = v161 ^ 0x55D90000;
  int v162 = *(_DWORD *)(v118
                   + 4LL
                   * ((v148
                                      - ((2 * v148) & 0xF6)
                                      - 5
                                      - ((2 * (v148 - ((2 * v148) & 0xF6) - 5)) & 0x1C)
                                      + 14) ^ 0x3Du)) ^ v159 ^ (v110 >> 16) ^ (v160
                                                                             - 905743237
                                                                             - ((2 * v160) & 0x9406E8F6));
  int v163 = *(_DWORD *)(v108 + 4LL * (((unsigned __int16)(v140 ^ v139) >> 8) ^ 0xE7u));
  HIDWORD(v110) = v163 ^ 0x7763;
  LODWORD(v110) = v163 ^ 0x55D90000;
  unsigned int v164 = *(_DWORD *)(v111 + 4LL * BYTE2(v132)) ^ 0xB4C82AC9;
  int v165 = (v110 >> 16) ^ (16 * v164 + 1452181747 - ((32 * v164) & 0xAD1D11E0)) ^ *(_DWORD *)(v113
                                                                                          + 4LL * (HIBYTE(v149) ^ 0x17));
  int v166 = *(_DWORD *)(v118 + 4LL * (v150 ^ 0x33u)) ^ v164;
  unsigned int v167 = v162 ^ 0xF1F7E4A6;
  int v168 = *(_DWORD *)(v108 + 4LL * ((unsigned __int16)(v162 ^ 0xE4A6) >> 8));
  unsigned int v169 = v166 ^ (v165 - 905743237 - ((2 * v165) & 0x9406E8F6));
  HIDWORD(v110) = v168 ^ 0x7763;
  LODWORD(v110) = v168 ^ 0x55D90000;
  unsigned int v170 = *(_DWORD *)(v111 + 4LL * (BYTE2(v169) ^ 0x62u)) ^ 0xB4C82AC9;
  unsigned int v171 = (16 * v170 + 1452181747 - ((32 * v170) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v153) ^ 0x69));
  unsigned int v172 = *(_DWORD *)(v118 + 4LL * (v157 ^ 0x68u)) ^ v170 ^ (v110 >> 16) ^ (v171
                                                                                          - 905743237
                                                                                          - 2
                                                                                          * (v171 & 0x4A03747F ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v153) ^ 0x69)) & 4));
  unsigned int v173 = *(_DWORD *)(v111 + 4LL * (BYTE2(v153) ^ 0x93u)) ^ 0xB4C82AC9;
  int v174 = *(_DWORD *)(v108 + 4LL * ((unsigned __int16)(v169 ^ 0x2957) >> 8));
  HIDWORD(v110) = v174 ^ 0x7763;
  LODWORD(v110) = v174 ^ 0x55D90000;
  int v175 = (16 * v173 + 1452181747 - ((32 * v173) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v157) ^ 0xCE)) ^ (v110 >> 16);
  unsigned int v176 = *(_DWORD *)(v118 + 4LL * (v162 ^ 0x15u)) ^ v173 ^ (v175 - 905743237 - ((2 * v175) & 0x9406E8F6));
  unsigned int v177 = *(_DWORD *)(v111 + 4LL * (BYTE2(v157) ^ 0x60u)) ^ 0xB4C82AC9;
  int v178 = *(_DWORD *)(v108 + 4LL * (BYTE1(v153) ^ 0xB1u));
  HIDWORD(v110) = v178 ^ 0x7763;
  LODWORD(v110) = v178 ^ 0x55D90000;
  int v179 = (16 * v177 + 1452181747 - ((32 * v177) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * HIBYTE(v167)) ^ (v110 >> 16);
  unsigned int v180 = *(_DWORD *)(v118 + 4LL * (v169 ^ 0x57u)) ^ v177 ^ (v179 - 905743237 - ((2 * v179) & 0x9406E8F6));
  if ((v157 & 0x1000) != 0) {
    int v181 = -16;
  }
  else {
    int v181 = 16;
  }
  int v182 = (BYTE1(v157) ^ 0xC) + v181;
  unsigned int v183 = *(_DWORD *)(v111 + 4LL * BYTE2(v167)) ^ 0xB4C82AC9;
  unsigned int v184 = *(_DWORD *)(v108 + 4LL * (v182 ^ 0x83u));
  unsigned int v185 = *(_DWORD *)(v113 + 4LL * (HIBYTE(v169) ^ 0xA1)) ^ HIWORD(v184) ^ (v184 << 16) ^ (16 * v183
                                                                                        + 1452181747
                                                                                        - ((32 * v183) & 0xAD1D11E0)) ^ 0x776355D9;
  unsigned int v186 = *(_DWORD *)(v118 + 4LL * (v153 ^ 0xAAu)) ^ v183 ^ (v185 - 905743237 - ((2 * v185) & 0x9406E8F6));
  unsigned int v187 = v186 ^ 0xEFBC3B44;
  unsigned int v188 = *(_DWORD *)(v111 + 4LL * ((v186 ^ 0xEFBC3B44) >> 16)) ^ 0xB4C82AC9;
  int v189 = *(_DWORD *)(v108 + 4LL * ((unsigned __int16)(v180 ^ 0x8D48) >> 8));
  HIDWORD(v190) = v189 ^ 0x7763;
  LODWORD(v190) = v189 ^ 0x55D90000;
  int v191 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v172) ^ 0xCC)) ^ (16 * v188
                                                                         + 1452181747
                                                                         - ((32 * v188) & 0xAD1D11E0));
  unsigned int v192 = *(_DWORD *)(v118 + 4LL * (v176 ^ 0xA9u)) ^ v188 ^ (v191 - 905743237 - ((2 * v191) & 0x9406E8F6));
  LOWORD(v18_Block_object_dispose(va, 8) = v172 ^ 0xD583;
  unsigned int v193 = *(_DWORD *)(v111 + 4LL * (((v172 ^ 0x255FD583) >> 16) ^ 0xC3u)) ^ 0xB4C82AC9;
  int v194 = *(_DWORD *)(v108 + 4LL * ((unsigned __int16)(v186 ^ 0x3B44) >> 8));
  HIDWORD(v190) = v194 ^ 0x7763;
  LODWORD(v190) = v194 ^ 0x55D90000;
  int v195 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4LL * HIBYTE(v176)) ^ (16 * v193 + 1452181747 - ((32 * v193) & 0xAD1D11E0));
  unsigned int v196 = *(_DWORD *)(v118 + 4LL * (v180 ^ 0x48u)) ^ v193 ^ (v195 - 905743237 - ((2 * v195) & 0x9406E8F6));
  unsigned int v197 = *(_DWORD *)(v111 + 4LL * ((v176 ^ 0xE93411A9) >> 16)) ^ 0xB4C82AC9;
  int v198 = *(_DWORD *)(v108 + 4LL * BYTE1(v188));
  HIDWORD(v190) = v198 ^ 0x7763;
  LODWORD(v190) = v198 ^ 0x55D90000;
  int v199 = (16 * v197 + 1452181747 - ((32 * v197) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * ((v180 ^ 0x807D8D48) >> 24)) ^ (v190 >> 16);
  unsigned int v200 = *(_DWORD *)(v118 + 4LL * (v186 ^ 0x77u)) ^ v197 ^ (v199 - 905743237 - ((2 * v199) & 0x9406E8F6));
  unsigned int v201 = *(_DWORD *)(v111 + 4LL * (BYTE2(v180) ^ 0xBEu)) ^ 0xB4C82AC9;
  int v202 = *(_DWORD *)(v108 + 4LL * (BYTE1(v176) ^ 0x82u));
  HIDWORD(v190) = v202 ^ 0x7763;
  LODWORD(v190) = v202 ^ 0x55D90000;
  int v203 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4LL * HIBYTE(v187)) ^ (16 * v201 + 1452181747 - ((32 * v201) & 0xAD1D11E0));
  unsigned int v204 = *(_DWORD *)(v118 + 4LL * v188) ^ v201 ^ (v203 - 905743237 - ((2 * v203) & 0x9406E8F6));
  unsigned int v205 = *(_DWORD *)(v111 + 4LL * ((v204 ^ 0x950DA39D) >> 16)) ^ 0xB4C82AC9;
  unsigned int v206 = (16 * v205 + 1452181747 - ((32 * v205) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * ((v192 ^ 0x11521BCA) >> 24));
  int v207 = *(_DWORD *)(v108 + 4LL * (BYTE1(v200) ^ 0x89u));
  HIDWORD(v190) = v207 ^ 0x7763;
  LODWORD(v190) = v207 ^ 0x55D90000;
  unsigned int v208 = v206 - 905743237 - ((2 * v206) & 0x9406E8F6);
  BYTE1(v206) = BYTE1(v196) ^ 0xD1;
  int v209 = v205 ^ *(_DWORD *)(v118 + 4LL * (v196 ^ 0x88u)) ^ (v190 >> 16) ^ v208;
  int v210 = *(_DWORD *)(v111 + 4LL * ((v192 ^ 0x11521BCA) >> 16));
  int v211 = *(_DWORD *)(v108 + 4LL * (BYTE1(v204) ^ 0x30u));
  HIDWORD(v190) = v211 ^ 0x7763;
  LODWORD(v190) = v211 ^ 0x55D90000;
  unsigned int v212 = (v209 ^ 0x71C9D6C4) - 2 * ((v209 ^ 0x71C9D6C4) & 0x3A5692AD ^ v209 & 9);
  int v213 = (16 * (v210 ^ 0xB4C82AC9) + 1452181747 - ((32 * (v210 ^ 0xB4C82AC9)) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v196) ^ 0xDF)) ^ (v190 >> 16);
  v200 ^= 0x7A851A70u;
  unsigned int v214 = *(_DWORD *)(v118 + 4LL * (v200 ^ 0x33u)) ^ v210 ^ (v213 - 905743237 - ((2 * v213) & 0x9406E8F6));
  unsigned int v215 = *(_DWORD *)(v111 + 4LL * (BYTE2(v196) ^ 0xA7u)) ^ 0xB4C82AC9;
  int v216 = *(_DWORD *)(v108 + 4LL * (BYTE1(v192) ^ 0x88u));
  HIDWORD(v190) = v216 ^ 0x7763;
  LODWORD(v190) = v216 ^ 0x55D90000;
  int v217 = (16 * v215 + 1452181747 - ((32 * v215) & 0xAD1D11E0)) ^ (v190 >> 16) ^ *(_DWORD *)(v113
                                                                                          + 4LL
                                                                                          * ((HIBYTE(v200) ^ -HIBYTE(v200) ^ ((HIBYTE(v200) ^ 0xFFFFFF16) + 234))
                                                                                           + 233));
  unsigned int v218 = *(_DWORD *)(v118 + 4LL * (v204 ^ 0x9Du)) ^ v215 ^ (v217 - 905743237 - ((2 * v217) & 0x9406E8F6));
  int v219 = *(_DWORD *)(v111 + 4LL * BYTE2(v200));
  int v220 = *(_DWORD *)(v108 + 4LL * BYTE1(v206));
  HIDWORD(v190) = v220 ^ 0x7763;
  LODWORD(v190) = v220 ^ 0x55D90000;
  int v221 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v204) ^ 0x7C)) ^ (16 * (v219 ^ 0xB4C82AC9)
                                                                         + 1452181747
                                                                         - ((32 * (v219 ^ 0xB4C82AC9)) & 0xAD1D11E0));
  unsigned int v222 = *(_DWORD *)(v118 + 4LL * (v192 ^ 0xF9u)) ^ v219 ^ (v221 - 905743237 - ((2 * v221) & 0x9406E8F6));
  int v223 = *(_DWORD *)(v108 + 4LL * ((unsigned __int16)(v218 ^ 0xDE69) >> 8));
  HIDWORD(v190) = v223 ^ 0x7763;
  LODWORD(v190) = v223 ^ 0x55D90000;
  int v224 = *(_DWORD *)(v111 + 4LL * (BYTE2(v222) ^ 0x4Fu));
  v212 -= 1168731484;
  int v225 = (v190 >> 16) ^ (16 * (v224 ^ 0xB4C82AC9) + 1452181747 - ((32 * (v224 ^ 0xB4C82AC9)) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v212) ^ 0xD3));
  unsigned int v226 = *(_DWORD *)(v118 + 4LL * (v214 ^ 0x1Au)) ^ v224 ^ (v225 - 905743237 - ((2 * v225) & 0x9406E8F6));
  int v227 = *(_DWORD *)(v108 + 4LL * (BYTE1(v222) ^ 0x15u));
  HIDWORD(v190) = v227 ^ 0x7763;
  LODWORD(v190) = v227 ^ 0x55D90000;
  unsigned int v228 = *(_DWORD *)(v111 + 4LL * (BYTE2(v212) ^ 0x3Cu)) ^ 0xB4C82AC9;
  unsigned int v229 = v228 ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v214) ^ 0x69)) ^ *(_DWORD *)(v118
                                                                            + 4LL * (v218 ^ 0x69u)) ^ ((v190 >> 16) - 905743237 - ((2 * (v190 >> 16)) & 0x9406E8F6)) ^ (16 * v228 + 1452181747 - ((32 * v228) & 0xAD1D11E0));
  unsigned int v230 = *(_DWORD *)(v111 + 4LL * (BYTE2(v214) ^ 0x32u)) ^ 0xB4C82AC9;
  int v231 = *(_DWORD *)(v108 + 4LL * (BYTE1(v212) ^ 0xF9u));
  HIDWORD(v190) = v231 ^ 0x7763;
  LODWORD(v190) = v231 ^ 0x55D90000;
  int v232 = (16 * v230 + 1452181747 - ((32 * v230) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * ((v218 ^ 0x5FEEDE69) >> 24)) ^ (v190 >> 16);
  unsigned int v233 = *(_DWORD *)(v118
                   + 4LL
  unsigned int v234 = *(_DWORD *)(v111 + 4LL * (BYTE2(v218) ^ 0x2Du)) ^ 0xB4C82AC9;
  int v235 = *(_DWORD *)(v108 + 4LL * (BYTE1(v214) ^ 0xF5u));
  HIDWORD(v190) = v235 ^ 0x7763;
  LODWORD(v190) = v235 ^ 0x55D90000;
  int v236 = (v190 >> 16) ^ (16 * v234 + 1452181747 - ((32 * v234) & 0xAD1D11E0)) ^ *(_DWORD *)(v113
                                                                                          + 4LL
                                                                                          * ((HIBYTE(v222) ^ 0xA1) & 0x90 ^ 0x86u ^ (~(2 * (HIBYTE(v222) ^ 0xA1 | 0x90)) + (HIBYTE(v222) ^ 0xA1 | 0x90))));
  unsigned int v237 = *(_DWORD *)(v118 + 4LL * ~(_BYTE)v212) ^ v234 ^ (v236 - 905743236 + ~((2 * v236) & 0x9406E8F6));
  unsigned int v238 = *(_DWORD *)(v111 + 4LL * ((v237 ^ 0x59A5F4B7) >> 16)) ^ 0xB4C82AC9;
  int v239 = *(_DWORD *)(v108 + 4LL * ((unsigned __int16)(v233 ^ 0x872B) >> 8));
  HIDWORD(v190) = v239 ^ 0x7763;
  LODWORD(v190) = v239 ^ 0x55D90000;
  int v240 = (16 * v238 + 1452181747 - ((32 * v238) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v226) ^ 0x66)) ^ (v190 >> 16);
  unsigned int v241 = *(_DWORD *)(v118 + 4LL * (v229 ^ 0xEEu)) ^ v238 ^ (v240 - 905743237 - ((2 * v240) & 0x9406E8F6));
  unsigned int v242 = *(_DWORD *)(v111 + 4LL * (BYTE2(v226) ^ 0xEDu)) ^ 0xB4C82AC9;
  int v243 = *(_DWORD *)(v108 + 4LL * (BYTE1(v237) ^ 0x67u));
  HIDWORD(v190) = v243 ^ 0x7763;
  LODWORD(v190) = v243 ^ 0x55D90000;
  int v244 = v242 ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v229) ^ 0xD6)) ^ *(_DWORD *)(v118
                                                                            + 4LL * (v233 ^ 0x18u)) ^ (16 * v242 + 1452181747 - ((32 * v242) & 0xAD1D11E0)) ^ ((v190 >> 16) - 905743237 - ((2 * (v190 >> 16)) & 0x9406E8F6));
  unsigned int v245 = *(_DWORD *)(v111 + 4LL * (BYTE2(v229) ^ 0x56u)) ^ 0xB4C82AC9;
  int v246 = *(_DWORD *)(v108 + 4LL * (BYTE1(v226) ^ 0x91u));
  HIDWORD(v190) = v246 ^ 0x7763;
  LODWORD(v190) = v246 ^ 0x55D90000;
  int v247 = *(_DWORD *)(v113 + 4LL * ((v233 ^ 0x911B872B) >> 24)) ^ v245 ^ 0x6D41727E ^ (16 * v245
                                                                                    + 1452181747
                                                                                    - ((32 * v245) & 0xAD1D11E0)) ^ (v190 >> 16);
  unsigned int v248 = *(_DWORD *)(v111 + 4LL * (BYTE2(v233) ^ 0xD8u)) ^ 0xB4C82AC9;
  int v249 = *(_DWORD *)(v108 + 4LL * (BYTE1(v229) ^ 0xE4u));
  HIDWORD(v190) = v249 ^ 0x7763;
  LODWORD(v190) = v249 ^ 0x55D90000;
  int v250 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v237) ^ 0xB0)) ^ (16 * v248
                                                                         + 1452181747
                                                                         - ((32 * v248) & 0xAD1D11E0));
  unsigned int v251 = *(_DWORD *)(v118 + 4LL * (v226 ^ 0x6Fu)) ^ v248 ^ (v250 - 905743237 - ((2 * v250) & 0x9406E8F6));
  int v252 = *(_DWORD *)(v108
                   + 4LL
                   * (((unsigned __int16)(*(_WORD *)(v118 + 4LL * (v226 ^ 0x6Fu)) ^ v248 ^ (v250 + 29819 - ((2 * v250) & 0xE8F6))) >> 8) ^ 0x66u));
  HIDWORD(v190) = v252 ^ 0x7763;
  LODWORD(v190) = v252 ^ 0x55D90000;
  int v253 = v190 >> 16;
  HIDWORD(v190) = *(_DWORD *)(v118 + 4LL * (v237 ^ 0xB7u)) ^ 0xD68BD0C1;
  LODWORD(v190) = HIDWORD(v190);
  int v254 = v244 ^ 0x177CD9D9;
  unsigned int v255 = *(_DWORD *)(v111 + 4LL * (BYTE2(v241) ^ 0x74u)) ^ 0xB4C82AC9;
  unsigned int v256 = *(_DWORD *)(v113 + 4LL * ((v244 ^ 0x177CD9D9u) >> 24)) ^ 0x6D41727E ^ v255 ^ (16 * v255
                                                                                     + 1452181747
                                                                                     - ((32 * v255) & 0xAD1D11E0)) ^ v253;
  unsigned int v257 = (v256 & 0x200 ^ 0xE7FEFFBE) + 2 * (v256 & 0x200);
  LODWORD(v190) = (v190 >> 21) ^ __ROR4__(v247, 21) ^ 0x549BF9D9;
  HIDWORD(v190) = v190;
  int v258 = v190 >> 11;
  int v259 = *(_DWORD *)(v118 + 4LL * ((v190 >> 11) ^ 0xEFu));
  BOOL v260 = ((v257 + 402718786) & (v259 ^ 0xCA03747B)) == 0;
  unsigned int v261 = *(_DWORD *)(v111 + 4LL * (BYTE2(v251) ^ 0x72u)) ^ 0xB4C82AC9;
  int v262 = *(_DWORD *)(v108 + 4LL * (BYTE1(v258) ^ 0xA0u));
  HIDWORD(v190) = v262 ^ 0x7763;
  LODWORD(v190) = v262 ^ 0x55D90000;
  int v263 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4LL * ((v241 ^ 0xD4B73D47) >> 24)) ^ (16 * v261
                                                                               + 1452181747
                                                                               - ((32 * v261) & 0xAD1D11E0));
  unsigned int v264 = *(_DWORD *)(v118 + 4LL * (v244 ^ 0xEAu)) ^ v261 ^ (v263 - 905743237 - ((2 * v263) & 0x9406E8F6));
  unsigned int v265 = v257 + 1003347924;
  unsigned int v266 = 197910352 - v257;
  if (v260) {
    unsigned int v266 = v265;
  }
  unsigned int v267 = ((v259 ^ 0xD68BD0C1) - 600629138 + v266) ^ v256 & 0xFFFFFDFF;
  unsigned int v268 = *(_DWORD *)(v111 + 4LL * BYTE2(v254)) ^ 0xB4C82AC9;
  int v269 = *(_DWORD *)(v108 + 4LL * (BYTE1(v241) ^ 0xAEu));
  HIDWORD(v270) = v269 ^ 0x7763;
  LODWORD(v270) = v269 ^ 0x55D90000;
  unsigned int v271 = (16 * v268 + 1452181747 - ((32 * v268) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * ((v258 ^ 0x1EA133EFu) >> 24));
  unsigned int v272 = *(_DWORD *)(v118 + 4LL * (v251 ^ 0xDu)) ^ v268 ^ (v270 >> 16) ^ (v271
                                                                                         - 905743237
                                                                                         - 2
                                                                                         * (v271 & 0x4A03747F ^ *(_DWORD *)(v113 + 4LL * ((v258 ^ 0x1EA133EFu) >> 24)) & 4));
  unsigned int v273 = *(_DWORD *)(v111 + 4LL * (BYTE2(v258) ^ 0x62u)) ^ 0xB4C82AC9;
  int v274 = *(_DWORD *)(v108 + 4LL * BYTE1(v254));
  HIDWORD(v270) = v274 ^ 0x7763;
  LODWORD(v270) = v274 ^ 0x55D90000;
  int v275 = (16 * v273 + 1452181747 - ((32 * v273) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4LL * (HIBYTE(v251) ^ 0x32)) ^ (v270 >> 16);
  unsigned int v276 = *(_DWORD *)(v118 + 4LL * (v241 ^ 0x74u)) ^ v273 ^ (v275 - 905743237 - ((2 * v275) & 0x9406E8F6));
  v277 = (char *)*(&off_100079130 + v63 - 726) - 4;
  v278 = (char *)*(&off_100079130 + v63 - 686) - 12;
  v279 = (char *)*(&off_100079130 + v63 - 677) - 12;
  unsigned int v280 = *(_DWORD *)&v278[4 * (BYTE2(v264) ^ 0x99)] ^ 0x858E78B5;
  unsigned int v281 = v280 ^ (*(_DWORD *)&v277[4 * (((v267 ^ 0xF137909F) >> 24) ^ 0xB4)]
               + (((v267 ^ 0xF137909F) >> 24) ^ 0x9FD52929)
               - 1891546004) ^ (v280 >> 2) ^ *(_DWORD *)&v279[4 * (v272 ^ 0x79)] ^ (v280 >> 4);
  v282 = (char *)*(&off_100079130 + (v63 ^ 0x32D)) - 8;
  int v283 = *(_DWORD *)&v282[4 * ((unsigned __int16)(v276 ^ 0x7C9C) >> 8)] ^ 0x44850E66;
  unsigned int v284 = ((v272 ^ 0x7B)
        - 162178079
        + ((2 * (((v272 ^ 0x7B) + 112) & 0x17E ^ (v272 ^ 0xBC37B | 0x7FFFFFF1))) ^ 0xF0C3001D)) ^ v283 ^ (1515496080 * v283);
  unsigned int v285 = HIBYTE(v272);
  unsigned int v286 = v264 ^ 0x6792B6A6;
  int v287 = *(_DWORD *)&v277[4 * (((v264 ^ 0x6792B6A6) >> 24) ^ 0xB4)];
  LODWORD(v335) = *(_DWORD *)&v277[4 * (HIBYTE(v272) ^ 0xB4)];
  LODWORD(v340) = (v276 ^ 0x250E7C9C) >> 24;
  HIDWORD(v337) = *(_DWORD *)&v277[4 * (v340 ^ 0xB4)];
  int v288 = *(_DWORD *)&v278[4 * (BYTE2(v276) ^ 5)];
  int v289 = *(_DWORD *)&v278[4 * ((v267 ^ 0xF137909F) >> 16)];
  HIDWORD(v335) = *(_DWORD *)&v278[4 * ((v272 ^ 0xBC37B) >> 16)];
  int v290 = *(_DWORD *)&v282[4 * ((unsigned __int16)(v272 ^ 0xC37B) >> 8)];
  HIDWORD(v334) = *(_DWORD *)&v282[4 * ((unsigned __int16)(v264 ^ 0xB6A6) >> 8)];
  int v291 = *(_DWORD *)&v282[4 * (BYTE1(v267) ^ 0x5E)];
  int v292 = *(_DWORD *)&v279[4 * (v267 ^ 0x9D)];
  int v293 = *(_DWORD *)&v279[4 * (v276 ^ 0x9E)];
  LODWORD(v337) = *(_DWORD *)&v279[4 * (v264 ^ 0xA4)];
  unsigned int v294 = ((v281 ^ v284) - 1180827501 - ((2 * (v281 ^ v284)) & 0x733C0126)) ^ LODWORD(STACK[0x300]);
  uint64_t v295 = (uint64_t)*(&off_100079130 + v63 - 849);
  v322[5] = *(_BYTE *)(v295 + (((v294 ^ 0x5244C6B3) >> 16) ^ 0x5ELL)) ^ ((v294 ^ 0x5244C6B3) >> 16) ^ 0x8A ^ ((((v294 ^ 0x5244C6B3) >> 16) ^ 0x8A) - ((2 * (((v294 ^ 0x5244C6B3) >> 16) ^ 0x8A) - 18) & 0xF7) - 14) ^ 0xB9;
  unsigned int v296 = v288 ^ 0x858E78B5 ^ ((HIBYTE(v286) ^ 0x9FD52929) - 1891546004 + v287) ^ ((v288 ^ 0x858E78B5) >> 2) ^ ((v288 ^ 0x858E78B5) >> 4) ^ v290 ^ 0x44850E66 ^ v292 ^ (1515496080 * (v290 ^ 0x44850E66)) ^ ((v267 ^ 0x9F) - 162178079 + ((2 * (((v267 ^ 0x9F) + 112) & 0x17E ^ (v267 ^ 0xF137909F | 0x7FFFFFF1))) ^ 0xF0C3001D));
  uint64_t v297 = (v296 + 696531065 - ((2 * v296) & 0x53087184) + 73) ^ LODWORD(STACK[0x3D8]);
  unsigned int v298 = v297 ^ 0x22A932A6;
  uint64_t v299 = (BYTE1(v298) | 0x88) ^ (v298 >> 8) & 0x88;
  v300 = (char *)*(&off_100079130 + (v63 ^ 0x3E4)) - 12;
  v322[2] = (((unsigned __int16)(v297 ^ 0x32A6) >> 8) | 0x88) ^ ((unsigned __int16)(v297 ^ 0x32A6) >> 8) & 0x88 ^ 0x35 ^ ((v300[v299 ^ 0x14] ^ 3) - ((2 * v300[v299 ^ 0x14]) & 0x20) - 112);
  v301 = (char *)*(&off_100079130 + v63 - 844) - 4;
  LODWORD(v299) = v301[HIBYTE(v294) ^ 0xEFLL];
  HIDWORD(v270) = v299 ^ 0x1B;
  LODWORD(v270) = (v299 ^ 0x40) << 24;
  v322[STACK[0x320]] = (v270 >> 29) ^ 0x83;
  int v302 = v289 ^ 0x858E78B5 ^ ((v285 ^ 0x9FD52929) - 1891546004 + v335) ^ ((v289 ^ 0x858E78B5) >> 2) ^ ((v289 ^ 0x858E78B5) >> 4);
  int v303 = v302 & 0x1000000 | 0x287B5FB3;
  if ((v302 & 0x1000000 & ~v293) != 0) {
    int v303 = 1358348134 - v303;
  }
  unsigned int v304 = v302 & 0xFEFFFFFF ^ (1515496080 * (HIDWORD(v334) ^ 0x44850E66)) ^ ((((v276 ^ 0x9C)
                                                                            - 162178079
                                                                            + ((2
                                                                              * (((v276 ^ 0x9C) + 112) & 0xFFFFFF7F ^ (v276 ^ 0x250E7C9C | 0x7FFFFFF0))) ^ 0xF0C3001F)) ^ v293)
                                                                          - 679174067
                                                                          + v303);
  uint64_t v305 = HIDWORD(v334) ^ 0x44850E66 ^ LODWORD(STACK[0x408]) ^ (v304 + 416382103 - ((2 * v304) & 0x31A2F9A2) + 58);
  v306 = (char *)*(&off_100079130 + (v63 ^ 0x3D4)) - 4;
  LOBYTE(v304) = v306[BYTE4(v334) ^ 0x66u ^ LOBYTE(STACK[0x408]) ^ (v304
                                                                                   - 105
                                                                                   - ((2 * v304) & 0xA2)
                                                                                   + 58) ^ 0x28LL];
  v322[11] = v304 & 0xFB ^ ((v304 | 0xFB) + 24) ^ 0x38;
  int v307 = v301[BYTE3(v297) ^ 0xF9LL];
  HIDWORD(v30_Block_object_dispose(va, 8) = v307 ^ 0x1B;
  LODWORD(v30_Block_object_dispose(va, 8) = (v307 ^ 0x40) << 24;
  unint64_t v309 = STACK[0x2D0];
  v322[STACK[0x2D0]] = (v308 >> 29) ^ 0xFB;
  v322[STACK[0x228]] = BYTE2(v298) ^ 0x61 ^ ((BYTE2(v298) ^ 0x61) + ((16 - 2 * (BYTE2(v298) ^ 0x61)) | 9) - 13) ^ 0xB8 ^ *(_BYTE *)(v295 + (BYTE2(v298) ^ 0xB5LL));
  int v310 = (v340 ^ 0x9FD52929) - 1891546004 + HIDWORD(v337);
  unsigned int v311 = HIDWORD(v335) ^ 0x858E78B5 ^ ((HIDWORD(v335) ^ 0x858E78B5) >> 4) ^ ((HIDWORD(v335) ^ 0x858E78B5) >> 2);
  unsigned int v312 = (v311 & 0x80000 ^ 0xBF5FFADD) + 2 * (v311 & 0x80000);
  BOOL v260 = ((v312 + 1084228899) & v310) == 0;
  unsigned int v313 = v312 + 1929342327;
  unsigned int v314 = -239115471 - v312;
  if (v260) {
    unsigned int v314 = v313;
  }
  int v315 = v337 ^ (v286 + 2096205936) ^ (((v310 - 845113428 + v314) ^ v311 & 0xFFF7FFFF ^ (1515496080 * (v291 ^ 0x44850E66)))
                                                      + 2036583281
                                                      + ~(2
                                                        * (((v310 - 845113428 + v314) ^ v311 & 0xFFF7FFFF ^ (1515496080 * (v291 ^ 0x44850E66))) & 0x7963CB7A ^ ((v310 - 845113428 + v314) ^ v311 & 0xFFF7FFFF) & 0xA)));
  unsigned int v316 = v291 ^ LODWORD(STACK[0x428]) ^ (v315 + 1570908894 - ((2 * v315) & 0xBB4455BC));
  v322[STACK[0x298]] = *(_BYTE *)(v295 + (BYTE2(v316) ^ 0x1E) + ((v316 >> 15) & 0x1A8 ^ 0xFFFFFFD7) + 213) ^ BYTE2(v316) ^ ((BYTE2(v316) ^ 0x1E) + ((16 - 2 * (BYTE2(v316) ^ 0x1E)) | 9) - 13) ^ 0x98;
  int v317 = v301[HIBYTE(v316) ^ 0xBELL];
  HIDWORD(v31_Block_object_dispose(va, 8) = v317 ^ 0x1B;
  LODWORD(v31_Block_object_dispose(va, 8) = (v317 ^ 0x40) << 24;
  v322[STACK[0x328]] = (v318 >> 29) ^ 0x50;
  v322[STACK[0x290]] = ((v305 ^ 0xCFDDD967) >> 16) ^ 0x94 ^ ((((v305 ^ 0xCFDDD967) >> 16) ^ 0x94)
                                                                         + ((16
                                                                           - 2
                                                                           * (((v305 ^ 0xCFDDD967) >> 16) ^ 0x94)) | 9)
                                                                         - 13) ^ *(_BYTE *)(v295
                                                                                          + (((v305 ^ 0xCFDDD967) >> 16) ^ 0x40LL)) ^ 0xC;
  unsigned int v319 = (((v316 ^ 0x1BB09C49) >> 4) & 0xF0 | ((unsigned __int16)(v316 ^ 0x9C49) >> 12)) ^ 0xE6;
  v322[STACK[0x420]] = v300[((v319 >> 4) & 0xFFFFFF0F | (16 * (v319 & 0xF))) ^ 0xAELL] ^ (((v319 >> 4) & 0xF | (16 * (v319 & 0xF)))
                                                                                        - ((v319 >> 3) & 6)
                                                                                        + 3) ^ 0x2B;
  v322[STACK[0x258]] = (((unsigned __int16)(v305 ^ 0xD967) >> 8) - (((v305 ^ 0xCFDDD967) >> 7) & 6) + 3) ^ 0xDB ^ v300[((unsigned __int16)(v305 ^ 0xD967) >> 8) ^ 0xA0LL];
  v322[STACK[0x418]] = (((unsigned __int16)(v294 ^ 0xC6B3) >> 8) - (((v294 ^ 0x5244C6B3) >> 7) & 6) + 3) ^ v300[((unsigned __int16)(v294 ^ 0xC6B3) >> 8) ^ 0x75LL] ^ 0x80;
  v322[STACK[0x3D0]] = v306[v297 ^ 0x95LL] ^ 0x86;
  v322[STACK[0x3C0]] = v306[v294 ^ 0x7FLL] ^ 0x17;
  v322[STACK[0x460]] = v306[v316 ^ 0xE6LL] ^ 0xB8;
  int v320 = v301[BYTE3(v305) ^ 0x49LL];
  HIDWORD(v31_Block_object_dispose(va, 8) = v320 ^ 0x1B;
  LODWORD(v31_Block_object_dispose(va, 8) = (v320 ^ 0x40) << 24;
  v322[STACK[0x400]] = (v318 >> 29) ^ 0x2E;
  HIDWORD(a13) = v63 ^ 0x619;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char *, unint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v58 + 8LL * ((56 * ((((_DWORD)v309 - 699207985 - ((2 * (_DWORD)v309 + 32) & 0xACA5DD9E) + 16) ^ 0xD652EEC0) < 0x150)) | v63)) - 8LL))( 9LL,  v305,  v297,  230LL,  v306,  v309,  v300,  1149570662LL,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  v322,  v323,  v324,  v325,  v326,  v327,  a20,  v328,  v329,  v330,  v331,  v332,  v333,  v334,  v335,  v337,  v340,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  2LL,  a43,  a44,  a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57);
}

void sub_10002FF04( uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, int a24, unsigned __int8 a25, int a26, int a27, unsigned __int8 a28, int a29, unsigned __int8 a30, int a31, int a32, int a33, unsigned __int8 a34, int a35, int a36, int a37, char a38)
{
  LODWORD(STACK[0x3D8]) = (a25 | ((((a37 ^ 0x54A) - 122) ^ a32) << 24) | ((a28 ^ 0xEF) << 8) | ((a34 ^ 0x92) << 16)) ^ 0xB104EBA2;
  LODWORD(STACK[0x300]) = a31 ^ 0xBE1F7410;
  LODWORD(STACK[0x408]) = ((a33 << 8) | (a27 << 24) | ((a35 ^ 0x77) << 16) | a29) ^ 0x310F566E;
  LODWORD(STACK[0x428]) = ((((a36 ^ 0xBC) << 16) + ((a26 ^ 0x1A) << 24)) | a30 | ((a38 ^ a4) << 8)) ^ 0x4E33834F;
  JUMPOUT(0x10002DFECLL);
}

uint64_t sub_10002FFF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  unint64_t v19 = STACK[0x550];
  STACK[0x668] -= 32LL;
  *(_BYTE *)(v19 + 335) = *(_BYTE *)(a14 + 335) ^ 0xCD ^ *((_BYTE *)*(&off_100079130 + (a18 ^ 0x526)) + 3) ^ *((_BYTE *)*(&off_100079130 + (a18 ^ 0x586)) + 13) ^ *((_BYTE *)*(&off_100079130 + a18 - 1220) + (((a18 - 1437) | 0x441u) ^ 0x440LL) + 11) ^ 0x32;
  return ((uint64_t (*)(void))(*(void *)(v18 + 8LL * a18) - 4LL))();
}

void sub_1000300C8()
{
}

uint64_t sub_1000300D0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  STACK[0x3B0] = a8;
  *(void *)(a2 + 304) -= 16LL;
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((7 * (v8 ^ 0x4F0)) ^ v8 ^ 0x786))
}

uint64_t sub_100030118@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  int v10 = *(_BYTE **)(v9 + 344);
  a8[12] = ((-93 * (a1 ^ 0xE6)) ^ 0xE9) + 50;
  a8[13] = 50;
  a8[14] = 50;
  a8[15] = 51;
  v10[16] ^= *a8 ^ 0x32;
  v10[17] ^= a8[1] ^ 0x32;
  v10[18] ^= a8[2] ^ 0x32;
  v10[19] ^= a8[3] ^ 0x32;
  v10[20] ^= a8[4] ^ 0x32;
  v10[21] ^= a8[5] ^ 0x32;
  v10[22] ^= a8[6] ^ 0x32;
  v10[23] ^= a8[7] ^ 0x32;
  v10[24] ^= a8[8] ^ 0x32;
  v10[25] ^= a8[9] ^ 0x32;
  v10[26] ^= a8[10] ^ 0x32;
  v10[27] ^= a8[11] ^ 0x32;
  v10[28] ^= a8[12] ^ 0x32;
  v10[29] ^= a8[13] ^ 0x32;
  v10[30] ^= a8[14] ^ 0x32;
  v10[31] ^= a8[15] ^ 0x32;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v8 + 8LL * (a1 - 395)) - 4LL))(1254LL, 50LL);
}

void sub_100030324()
{
}

uint64_t sub_10003032C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((60 * (LODWORD(STACK[0x46C]) != ((v4 - 225) | 0x451) + 1206751714)) ^ ((v4 - 225) | 0x451)))
                            - ((((v4 - 225) | 0x451u) - 895) ^ a4)))();
}

uint64_t sub_1000303AC@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((51 * (*(_BYTE *)(v2 + (a1 + 1252)) == 50)) ^ v1))
                            - ((v1 ^ 0x483u)
                             - 278)
                            + 1083LL))();
}

uint64_t sub_1000303F4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
}

uint64_t sub_100030430( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
  LODWORD(STACK[0x46C]) = 1206753083;
  unint64_t v41 = STACK[0x648];
  STACK[0x4C0] = 335LL;
  *(_BYTE *)(v41 + 335) = (a39 ^ 0xBA) * (a39 + 17);
  return (*(uint64_t (**)(void))(v39
                              + 8LL
                              * (int)(((STACK[0x4C0] == 0) * (((v40 + 1002725785) & 0xC43B9DD9) - 1065)) ^ (v40 + 1002725785) & 0xC43B9DD9)))();
}

void sub_100030778()
{
}

uint64_t sub_100030780@<X0>(int a1@<W8>)
{
  int v3 = a1 - 430;
  int v4 = a1 + 141;
  uint64_t v5 = ((uint64_t (*)(void))STACK[0x310])();
  LODWORD(STACK[0x688]) = v1;
  return ((uint64_t (*)(uint64_t))(*(void *)(v2 + 8LL * (((v1 == v4 + 1645152532) * (v3 - 581)) ^ v3)) - 8LL))(v5);
}

uint64_t sub_1000307C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = LODWORD(STACK[0x468]);
  unint64_t v8 = STACK[0x3C8];
  unint64_t v9 = STACK[0x2C8];
  unint64_t v10 = STACK[0x448];
  uint64_t v11 = *(void *)(v6 + 8LL * (v5 - 1210));
  STACK[0x428] = STACK[0x2C8] + 2353;
  STACK[0x420] = v10 + 49;
  STACK[0x418] = v9 + 2333;
  STACK[0x410] = v10 + 29;
  STACK[0x408] = v9 + 2313;
  STACK[0x400] = v10 + 9;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v11 - 8))( a1,  a2,  v7,  2649773600LL,  a5,  v8);
}

void sub_1000311A0()
{
  LODWORD(STACK[0x680]) = v0;
  JUMPOUT(0x100031120LL);
}

uint64_t sub_1000311CC(uint64_t a1, uint64_t a2, int a3)
{
  STACK[0x460] = v3;
  int v7 = STACK[0x49C];
  *(_DWORD *)(*(void *)(v6 + 448) + ((a3 - 1133293923 + v7 - 1188) & 0xFFFFFFFC)) = v4;
  LODWORD(STACK[0x49C]) = v7 + 4;
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((99
}

uint64_t sub_1000328C4@<X0>(uint64_t a1@<X8>)
{
  int v9 = v5 + v3;
  int v10 = *(_DWORD *)(a1 + 4LL * (v9 - 8)) ^ *(_DWORD *)(a1 + 4LL * (v9 - 3));
  int v11 = *(_DWORD *)(a1 + 4LL * (v9 - 16)) ^ *(_DWORD *)(a1 + 4LL * (v9 - 14)) ^ (v10 + v8 - (v6 & (2 * v10)));
  HIDWORD(v12) = (v1 - 335) ^ (v8 + 136) ^ v11;
  LODWORD(v12) = v11;
  *(_DWORD *)(a1 + 4LL * (v2 + v5)) = (v12 >> 31) + v8 - (v6 & (2 * (v12 >> 31)));
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((((v2 + 1 + v5) > 0x4F) * v4) ^ v1)) - 8LL))();
}

uint64_t sub_100032950()
{
  return (*(uint64_t (**)(void))(v1 + 8LL * v0))();
}

void sub_100032A4C()
{
}

uint64_t sub_100032A64(uint64_t a1, int a2)
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((121 * ((a2 + 1 + v4) > 0x27)) ^ v2)) - 8LL))();
}

uint64_t sub_100032B28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
}

uint64_t sub_100032BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((241 * ((a6 + 1 + v8) > 0x4F)) ^ v6)) - 4LL))();
}

void sub_100032CC0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  LODWORD(STACK[0x57C]) = v8;
  LODWORD(STACK[0x498]) = v12;
  LODWORD(STACK[0x544]) = v9;
  LODWORD(STACK[0x614]) = v11;
  LODWORD(STACK[0x5C8]) = v10;
  uint64_t v17 = *(void *)(v16 + 432);
  int v18 = *(_DWORD *)(v17 - 0x5C6940C6B1BC6FE2LL);
  LODWORD(STACK[0x49C]) = v15 + 80;
  int v19 = ((v13 - 452) ^ (v14 - 997) ^ v18) + (v10 ^ v14);
  *(_DWORD *)(v17 - 0x5C6940C6B1BC6FE2LL) = v19 + v14 - (a8 & (2 * v19));
  JUMPOUT(0x100032D44LL);
}

uint64_t sub_100032E54( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unint64_t v66 = STACK[0x488];
  int v67 = *(unsigned __int8 *)(STACK[0x488] - 0x5C6940C6B1BC6FDALL) ^ 0x5F;
  if (v67 == 2) {
    return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v65
  }
                                                                 + 8LL
                                                                 * ((562
                                                                   * (((a55 ^ (*(_DWORD *)(v66 - 0x5C6940C6B1BC6FDELL) == 369984849)) & 1) == 0)) ^ ((int)a3 + 74)))
                                                     - 8LL))( a1,  25LL);
  if (v67 == 1) {
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 + 8LL * ((111 * (*(_DWORD *)(v66 - 0x5C6940C6B1BC6FDELL) != (((LODWORD(STACK[0x468]) - 469) | 0xA0) ^ 0x160D86E1))) ^ (LODWORD(STACK[0x468]) + 74))) - 8LL))( a1,  25LL,  a3,  a4,  1099626267LL,  1695LL,  26919485LL,  858949875LL);
  }
  uint64_t v69 = LODWORD(STACK[0x468]);
  STACK[0x480] = 91LL;
  *(_BYTE *)(v66 - 0x5C6940C6B1BC6FDFLL) = (a65 + 7 * ((a3 - 71) ^ 0x2D)) * ((a65 - 44) ^ 0xBA);
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v65
                                                               + 8LL * ((932 * (STACK[0x480] == 0)) ^ ((int)a3 - 839)))
                                                   - 12LL))( v69,  25LL);
}

void sub_1000337F8()
{
}

uint64_t sub_100033800()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_100033834(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_DWORD *)(a6 + 52) = (((((v8 + a3 - 1089 - 164) ^ v6) + (LODWORD(STACK[0x684]) ^ v8)) % 0x2710) ^ 0xEFFFDBB9)
                       + 1006630752
                       + ((2 * ((((v8 + a3 - 1089 - 164) ^ v6) + (LODWORD(STACK[0x684]) ^ v8)) % 0x2710)) & 0x3772);
  int v9 = STACK[0x68C];
  LODWORD(STACK[0x4AC]) = STACK[0x68C];
  return (*(uint64_t (**)(void))(v7 + 8LL * ((1169 * (v9 == v8)) ^ (a3 - 1089))))();
}

void sub_1000338BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  *a6 = STACK[0x52C];
  a6[85] = STACK[0x4E4];
  a6[86] = STACK[0x61C];
  a6[87] = STACK[0x60C];
  a6[88] = STACK[0x4EC];
  JUMPOUT(0x10002CFCCLL);
}

void sub_1000338EC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)(v4 + 304) -= 1616LL;
  LODWORD(STACK[0x4AC]) = a4 + 174;
  JUMPOUT(0x10002CFCCLL);
}

void sub_100033908()
{
}

void sub_100033910()
{
  *(_DWORD *)(v1 + 36) = v0 | 4;
}

uint64_t sub_100033918(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  STACK[0x3B0] = v4;
  LODWORD(STACK[0x618]) = a4 - 10;
  return (*(uint64_t (**)(void))(v5
                              + 8LL * ((1443 * (((STACK[0x3B0] == 0) ^ (v6 - 84)) & 1)) ^ (v6 - 596))))();
}

uint64_t sub_100033AAC()
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * ((v0 - 521138063 + ((v2 + 1098251017) & 0xBE8A07F7) - 1253 >= (v2 ^ 0x344u) - 670) ^ v2)))();
}

uint64_t sub_100033AF8(uint64_t a1)
{
  LODWORD(STACK[0x618]) = v1 - 10;
  unint64_t v4 = STACK[0x530];
  unint64_t v5 = LODWORD(STACK[0x5F4]);
  STACK[0x508] = v5;
  return ((uint64_t (*)(uint64_t, unint64_t))(*(void *)(v2
                                                                        + 8LL
                                                                        * ((1625
                                                                          * ((_DWORD)v5 != ((v3 - 35477226) & 0x21D537C ^ 0x178))) ^ (v3 - 711)))
                                                            - ((v3 - 1045827046) & 0x3E5609CB)
                                                            + 199LL))( a1,  v4);
}

void sub_100033B08()
{
}

void sub_100033B44(uint64_t a1@<X1>, int a2@<W8>)
{
  int v4 = a2 ^ 0x674;
  v2(*(unsigned int *)STACK[0x318], a1, LODWORD(STACK[0x334]) - 1862247496 + (a2 ^ 0x674u) - 1253);
  *(_DWORD *)(v3 - 200) = (v4 + 426521764) ^ (535753261
                                            * ((1828448706 - ((v3 - 200) | 0x6CFBE9C2) + ((v3 - 200) | 0x9304163D)) ^ 0x99F01812));
  sub_10005B024((_DWORD *)(v3 - 200));
  JUMPOUT(0x100033BD4LL);
}

uint64_t sub_100033C18( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43)
{
  unint64_t v49 = STACK[0x530];
  int v50 = LODWORD(STACK[0x5F4]) ^ ((v47 ^ 0x26B) - 1099358560);
  int v51 = (2 * LODWORD(STACK[0x5F4])) & 0x7CF23ED6;
  int v52 = 235795823 * ((((2 * (v48 - 200)) | 0x7ACDC568) - (v48 - 200) - 1030152884) ^ 0xA9CBABED);
  uint64_t v53 = v48 - 200;
  *(void *)(v53 + _Block_object_dispose(va, 8) = v44;
  *(void *)(v53 + memset((void *)(v1 - 204), 50, 16) = a42;
  *(void *)(v53 + 32) = v45;
  *(_DWORD *)(v48 - 136) = v52 + v50 + v51 + 1307043736;
  *(_BYTE *)(v53 + 24) = 111 * ((((2 * (v48 + 56)) | 0x68) - (v48 + 56) + 76) ^ 0xED) - 30;
  *(void *)(v53 + 56) = v49;
  *(void *)(v53 + 4_Block_object_dispose(va, 8) = a43;
  *(_DWORD *)(v48 - 160) = (v47 - 485) ^ v52;
  *(_DWORD *)(v48 - 200) = (v43 + 760079447) ^ v52;
  uint64_t v54 = ((uint64_t (*)(uint64_t))((char *)*(&off_100079130 + v47 - 642) - 8))(v48 - 200);
  int v55 = *(_DWORD *)(v48 - 132);
  LODWORD(STACK[0x618]) = v55;
}

uint64_t sub_100033D38( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, int a38)
{
  return ((uint64_t (*)(void))(*(void *)(v39
                                        + 8LL
                                        * (int)((((LODWORD(STACK[0x590]) ^ v38) != a38 - 1368499268)
                                               * (((v40 + 445943596) & 0xE56B74ED) - 678)) ^ v40))
                            - 4LL))();
}

uint64_t sub_100033D8C@<X0>(int a1@<W8>)
{
  LODWORD(STACK[0x618]) = v1 + 391;
  uint64_t v5 = LODWORD(STACK[0x618]);
  uint64_t v6 = 235795823 * (((v3 | 0x68728E509914D92ELL) - (v3 & 0x68728E509914D92ELL)) ^ 0x60C234AE0DB99077LL);
  int v7 = a1 - 976199517 + v6;
  *(_DWORD *)(v4 - 192) = -235795823 * (((v3 | 0x9914D92E) - (v3 & 0x9914D92E)) ^ 0xDB99077);
  *(_DWORD *)(v4 - 18_Block_object_dispose(va, 8) = v6 ^ (a1 - 976199517) ^ 0x73;
  unsigned int v8 = (uint64_t *)(v4 - 200);
  v8[2] = v6 ^ 0x9DF05623LL;
  uint64_t *v8 = v5 ^ v6;
  *(_DWORD *)(v4 - 176) = a1 - v6 - 1501687097;
  *(_DWORD *)(v4 - 172) = v7 + 106;
  *(_DWORD *)(v4 - 16_Block_object_dispose(va, 8) = v7;
  uint64_t v9 = ((uint64_t (*)(uint64_t))STACK[0x3B8])(v4 - 200);
  STACK[0x3B0] = 0LL;
  int v10 = *(uint64_t (**)(uint64_t))(v2 + 8LL * *(int *)(v4 - 164));
  LODWORD(STACK[0x334]) = 1862247496;
  return v10(v9);
}

uint64_t sub_100033E0C@<X0>(uint64_t a1@<X1>, unsigned int a2@<W8>)
{
  unint64_t v5 = ((unint64_t)&STACK[0x508] ^ 0xF3F3F9DFAFEB7F9FLL)
     + 0x5D9F8EE7FE9CD861LL
     + ((2LL * (void)&STACK[0x508]) & 0xE7E7F3BF5FD6FF30LL);
  uint64_t v6 = v2 - 1;
  *(void *)(v4 + 24) = v6;
  *(_BYTE *)(a1 + v6) = (a2 ^ 0x66 ^ v5 ^ 0xA4) * (v5 + 17);
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((1814 * (*(void *)(v4 + 24) == 0LL)) ^ a2)) - 8LL))();
}

void sub_100033E9C()
{
}

void sub_100033EA4(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_100033FB4()
{
  STACK[0x3B0] = 0LL;
  int v2 = *(_DWORD *)(STACK[0x3C8] + 56);
  *(_DWORD *)(STACK[0x3C8] + 56) = v2 + 1;
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8LL * ((1804 * ((v0 ^ 0xD381F09D) + v2 < 0xFFFFFFFA)) ^ (v0 - 1129)));
  LODWORD(STACK[0x334]) = 1862247496;
  return v3();
}

void sub_100034008()
{
  int v3 = v0 ^ 0x499;
  *(_DWORD *)(v2 - 200) = ((v0 ^ 0x499) + 426522893) ^ (535753261
                                                      * ((v2 + 1931614134 - 2 * ((v2 - 200) & 0x7322187E)) ^ 0x79D61651));
  sub_10005B024((_DWORD *)(v2 - 200));
  *(_BYTE *)uint64_t v1 = (-85 * ((v2 + 56) ^ 0xF6)) ^ 0x2F;
  *(void *)(v1 + 24) = STACK[0x2B0];
  *(void *)(v1 + _Block_object_dispose(va, 8) = STACK[0x2A8];
  *(_DWORD *)(v2 - 184) = 3804331 * ((v2 - 200) ^ 0x7ED525F6) + v3 + 1389;
  ((void (*)(uint64_t))STACK[0x2A0])(v2 - 200);
  STACK[0x3B0] = 0LL;
  LODWORD(STACK[0x334]) = 1862247496;
  JUMPOUT(0x100033B14LL);
}

void jEHf8Xzsv8K(uint64_t a1)
{
  __asm { BR              X9 }

uint64_t sub_100034118@<X0>(uint64_t a1@<X8>)
{
  return 0LL;
}

uint64_t sub_10003412C()
{
  return 4294925273LL;
}

void sub_100034138(uint64_t a1)
{
  int v1 = 235795823 * (((a1 | 0x1A7DF74B) - (a1 | 0xE58208B4) - 444462924) ^ 0x8ED0BE12);
  int v2 = *(_DWORD *)(a1 + 40) ^ v1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  unsigned int v6 = 1374699841 * ((2 * (&v8 & 0x59A7A858) - &v8 + 643323809) ^ 0x4BAC4FA8);
  unsigned int v7 = *(_DWORD *)(a1 + 64) - v1 - v6;
  int v13 = v6 ^ ((*(_DWORD *)a1 ^ v1) - 757538690);
  uint64_t v14 = v3;
  unsigned int v15 = v7 + 1047456190;
  int v9 = v6 ^ (v2 + 368399990);
  uint64_t v8 = v5;
  uint64_t v12 = v4;
  uint64_t v10 = v5;
  sub_10005ACE4((uint64_t)&v8);
  __asm { BR              X8 }

uint64_t sub_1000342C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unint64_t *a11, char a12, int a13, uint64_t a14, int a15)
{
  int v24 = *(unsigned __int8 *)(v16 + 24) - v17;
  unsigned int v25 = 1759421093 * (&a10 ^ 0xB37DB054);
  a11 = &STACK[0x17594DE9181849F3];
  a14 = v22;
  a12 = ((v24 ^ 0xFE) + ((v24 << (v23 - 120)) & ((v23 ^ 0xC2) + 127) ^ 2) - 5) ^ (-91 * (&a10 ^ 0x54));
  a13 = v25 + 395618377 + v21;
  a15 = v23 - v25 + 906;
  uint64_t v26 = ((uint64_t (*)(int *))(*(void *)(v15 + 8LL * (v23 ^ 0x5A)) - 4LL))(&a10);
  return ((uint64_t (*)(uint64_t))(*(void *)(v20 + 8LL * (((a10 != v19) * v18) ^ v23)) - 8LL))(v26);
}

uint64_t sub_100034394()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
}

void sub_1000343D8(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x384B062F07609540LL) = v2 - 1;
  *(_DWORD *)(v1 + 6_Block_object_dispose(va, 8) = 1645153785;
}

void Fc3vhtJDvr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a4) {
    BOOL v5 = a5 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  __asm { BR              X8 }

uint64_t sub_1000345E4( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, unsigned int a18)
{
  *a4 = 0LL;
  *a5 = 0;
  a18 = 108757529 * ((&a17 & 0xA7DA3C6 | ~(&a17 | 0xA7DA3C6)) ^ 0x151E3E12) + 1695027452;
  uint64_t v21 = sub_10005A350(&a17);
  return (*(uint64_t (**)(uint64_t))(v19 + 8LL * ((1110 * (a17 == v20)) ^ v18)))(v21);
}

uint64_t sub_10003466C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, unsigned int a18, unsigned int a19, int a20)
{
  unsigned int v23 = 1759421093 * ((&a17 - 826825291 - 2 * (&a17 & 0xCEB7A5B5)) ^ 0x7DCA15E1);
  HIDWORD(a17) = v23 ^ 0x771B5177;
  a18 = v23 + 1806;
  a20 = v23 ^ 0x18F94B49;
  LODWORD(a17) = v23 ^ 0x7FA6CEE2;
  ((void (*)(unint64_t **))(*(void *)(v22 + 392) - 12LL))(&a17);
  a17 = &STACK[0x4BD26FD1213425D9];
  a19 = 1307 - 460628867 * ((((2 * &a17) | 0x9D678C32) - &a17 + 827079143) ^ 0x82254464);
  sub_100035EF0((uint64_t)&a17);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 8LL * ((11 * (a18 == v21)) ^ 0x296u)))( v24,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  a9,  a10);
}

uint64_t sub_100034774( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, unsigned int a18, uint64_t a19, unsigned int a20, uint64_t a21)
{
  unsigned int v26 = 1178560073 * ((((2 * &a17) | 0x572E13FC) - &a17 + 1416164866) ^ 0x1103719C);
  a18 = ((2 * v23) & 0xE6FBE672) + (v23 ^ 0x737DF339) - 587243776 + v26;
  a20 = v26 ^ 0x3E8;
  a19 = a16;
  sub_100045F9C((uint64_t)&a17);
  unsigned int v27 = 1178560073 * (((~&a17 & 0x8CEF827A) - (~&a17 | 0x8CEF827B)) ^ 0x367BFA19);
  a21 = v21;
  a20 = v27 ^ ((v22 ^ 0x5BFF7F7E) - 1350459988 + ((2 * v22) & 0xB7FEFEFC));
  a19 = a16;
  a18 = v27 + 1289;
  uint64_t v28 = ((uint64_t (*)(int *))(*(void *)(v25 + 1024) - 8LL))(&a17);
  return (*(uint64_t (**)(uint64_t))(v24 + 8LL * ((1916 * (a17 == 1645153785)) ^ 0x323u)))(v28);
}

uint64_t sub_1000348D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, uint64_t a18, unsigned int a19, unsigned int a20, unsigned int a21, int a22)
{
  if (a12 >= 0x608FEDF6) {
    int v25 = 1010542952;
  }
  else {
    int v25 = 635686783;
  }
  unsigned int v26 = 460628867
      * ((((&a17 | 0x2AEB2E12) ^ 0xFFFFFFFE) - (~&a17 | 0xD514D1ED)) ^ 0x99825390);
  a17 = &STACK[0x58A7AA0862456906];
  a18 = a16;
  a19 = v26 - 1703100402;
  a20 = v26 + v23 + 2138962557;
  a21 = v25 - v26;
  uint64_t v27 = sub_10005A720((uint64_t)&a17);
  return (*(uint64_t (**)(uint64_t))(v24
                                            + 8LL
                                            * ((22 * (a22 == v22 + v23 - 141 + ((v23 + 367) | 0x160) - 2184)) ^ v23)))(v27);
}

uint64_t sub_1000349C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v14
                                                     + 8LL * (((((v12 + 466728956) & 0x71D) - 699) * (a12 < v13)) ^ v12)))( a1,  a2);
}

uint64_t sub_100034A60@<X0>( uint64_t a1@<X8>, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, _BYTE *a6, int a7, char a8, uint64_t a9, uint64_t a10, unsigned int a11, char *a12, _BYTE *a13, uint64_t a14, unsigned int a15)
{
  int v22 = v15;
  a12 = &a8 + a1;
  a13 = a6;
  a11 = (v18 - 1177) ^ (((2 * (&a11 & 0x7F331FB0) - &a11 - 2134056888) ^ 0xED38F841) * v16);
  v20(&a11);
  a13 = v22;
  a14 = v17;
  a15 = ((v18 ^ 0xFE) - 938) ^ (1225351577 * (&a11 ^ 0x239AD816));
  a12 = a6;
  ((void (*)(unsigned int *))(*(void *)(v21 + 8LL * (v18 ^ 0x5B3u)) - 8LL))(&a11);
  a12 = a3;
  a13 = a6;
  a11 = ((v18 ^ 0xFE) - 947) ^ (1374699841
                              * ((-1001333016 - (&a11 | 0xC450DEE8) + (&a11 | 0x3BAF2117)) ^ 0x565B391E));
  v20(&a11);
  a11 = ((v18 ^ 0xFE) - 446) ^ (1755732067
                              * ((((&a11 | 0x3445A058) ^ 0xFFFFFFFE) - (~&a11 | 0xCBBA5FA7)) ^ 0x157CE27C));
  a12 = a6;
  uint64_t v23 = sub_1000565D0((uint64_t)&a11);
  return ((uint64_t (*)(uint64_t))(*(void *)(v19
                                                      + 8LL
                                                      * ((27
                                                        * ((_DWORD)a13 != (((v18 ^ 0xFE) - 45646309) & 0x7FFB)
                                                                        + 1645152982)) ^ v18 ^ 0xFEu))
                                          - (v18 ^ 0x114u)
                                          + 1246LL))(v23);
}

uint64_t sub_100034C24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14)
{
  return ((uint64_t (*)(void))(*(void *)(v15 + 8LL * (((a14 != v14) * ((v16 - 532) ^ (v16 - 451))) ^ v16)) - 8LL))();
}

uint64_t sub_100034C50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  return ((uint64_t (*)(void))(*(void *)(v14
                                        + 8LL
                                        * (((a13 != ((v15 + 1678211847) & 0x87B7 ^ (v13 - 925)))
}

uint64_t sub_100034CA8@<X0>(int a1@<W8>)
{
  BOOL v5 = (*(uint64_t (**)(void))(v4 + 8LL * (v1 - 1731)))(a1 ^ v2) == 0;
  return (*(uint64_t (**)(void))(v3 + 8LL * ((v5 * (((v1 - 1412) | 0x102) ^ 0x336)) ^ v1)))();
}

uint64_t sub_100034CF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v16 = a13 ^ (v14 - 1291) ^ (v13 - 1656909894) & 0x62C26DB7;
  return ((uint64_t (*)(void))(*(void *)(v15
                                        + 8LL
                                        * ((232
                                          * (((2 * (v16 - ((2 * v16) & 0xEDAA0BF4) + 1993672186)) & 0xDFDBFDDA ^ (((v13 - 901) | 0x308) - 846593368))
                                           + ((v16 - ((2 * v16) & 0xEDAA0BF4) + 1993672186) ^ 0x1938FB17)
                                           - 1610946564 != 266921705)) ^ (v13 - 1333)))
                            - 12LL))();
}

uint64_t sub_100034DAC()
{
  BOOL v4 = v1 + v0 + ((v2 - 874430325) & 0x341EBEEDu) - 1877869966 < (((v2 + 8993113) | 0xA8160008) ^ 0xA89F4081);
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((2 * v4) | (4 * v4) | v2)) - 8LL))();
}

uint64_t sub_100034E30(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return ((uint64_t (*)(void))(*(void *)(v6
                                        + 8LL
                                        * (((((a4 - 1904335010) ^ 0x26E16D76 ^ v5) + ((a4 - 1904335010) & 0x7181D2F1))
}

uint64_t sub_100034E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v8
                              + 8LL
                              * (((v7 < ((a5 - v6 - 213) ^ (v5 + 1686))) * ((a5 + 21) ^ 0x100)) ^ a5)))();
}

uint64_t sub_100034EB4(uint64_t a1, int a2)
{
  unsigned int v10 = v8 + v7 + v6 + 1696;
  uint64_t v11 = v3 + v10;
  __int128 v12 = *(_OWORD *)(v11 - 31);
  uint64_t v13 = a1 + v10;
  *(_OWORD *)(v13 - 15) = *(_OWORD *)(v11 - 15);
  *(_OWORD *)(v13 - 31) = v12;
  return (*(uint64_t (**)(void))(v9 + 8LL * ((((v5 & 0xFFFFFFE0) != 32) * ((a2 - v2) ^ 0x604)) ^ (v4 + a2 + 410))))();
}

void sub_100034F10()
{
}

uint64_t sub_100034F1C(uint64_t a1)
{
  *uint64_t v3 = a1;
  *int v6 = v2;
  int v4 = (v1 - 1155) | 0x202;
  uint64_t v12 = v8;
  unsigned int v11 = v1
      - 500
      + 535753261
  v7(v10);
  uint64_t v12 = v9;
  unsigned int v11 = v4
  v7(v10);
  return 0LL;
}

void sub_1000351D4(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_100035258( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, unint64_t *))(*(void *)(v66 + 3744) - 8LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  3102982430LL,  a9,  &a66,  a11,  &STACK[0x4FF3ADA337C70055]);
}

uint64_t sub_1000353A4()
{
  return ((uint64_t (*)(void))(*(void *)(v1
}

uint64_t sub_100035400( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17)
{
  return (*(uint64_t (**)(void))(v18 + 8LL * ((107 * ((((v17 - 1641) ^ 0xFFFFFF2F) & v19) - a17 == -3)) ^ v17)))();
}

uint64_t sub_100035434@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL * (((((a1 - 880016978) | 0xC428) + 879967018) * (v1 == 369238551)) ^ a1))
                            - 8LL))();
}

uint64_t sub_100035488( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20, int a21)
{
  int v25 = 2 * (v21 ^ (v22 + 125) ^ 0x10F);
  int v26 = v21 + 879967956;
  BOOL v27 = a21 - 94734047 < (v24 - 937898909);
  return ((uint64_t (*)(void))(*(void *)(v23 + 8LL * ((v27 * (v25 ^ 0x1C0)) ^ v26)) - 8LL))();
}

uint64_t sub_10003563C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  int v21 = 628203409 * ((v20 - 152) ^ 0x82880C33);
  *(_DWORD *)(v20 - 136) = v17 - v21 + 1538;
  *(_DWORD *)(v20 - 132) = v19 - v21 + 77623025;
  *(void *)(v20 - 152) = a14;
  *(void *)(v20 - 144) = a12;
  *(void *)(v20 - 112) = a17;
  *(void *)(v20 - 104) = a13;
  *(void *)(v20 - 12_Block_object_dispose(va, 8) = a15;
  uint64_t v22 = (*(uint64_t (**)(uint64_t))(a6 + 8LL * (v17 ^ 0x19D)))(v20 - 152);
  return ((uint64_t (*)(uint64_t))(*(void *)(v18
                                                      + 8LL
                                                      * (((*(_DWORD *)(v20 - 120) == (((v17 + 134791456) | 0xC3840489) ^ 0xA983CB50))
                                                        * ((355 * (v17 ^ 0x105)) ^ 0x58D)) ^ v17))
                                          - 8LL))(v22);
}

uint64_t sub_100035730( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 8LL * (((*(_DWORD *)(v11 + 48LL * (v13 + a8)) == 470551612) * (((16 * v8) ^ 0x6FF0 ^ (v9 + 256)) + 879967002)) ^ v8))
                                                                                       - 4LL))( a1,  a2,  a3,  a4,  a5,  v12);
}

uint64_t sub_100035790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((v5 - 1155520739) <= 0x19 && ((1 << (v5 + 29)) & 0x3014001) != 0) {
    __asm { BR              X10 }
  }

  return a5 ^ 0x9DF05627;
}

void sub_100035EF0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12) + 460628867 * ((a1 & 0x73B15F3F | ~(a1 | 0x73B15F3F)) ^ 0xC0D822BD);
  uint64_t v2 = *((void *)*(&off_100079130 + v1 - 1265)
       + ((61 * (((uint64_t (*)(uint64_t))*(&off_100079130 + v1 - 1081))(32LL) != 0)) ^ v1)
       - 1)
     - 8LL;
  __asm { BR              X8 }

uint64_t sub_100035F80(uint64_t result)
{
  uint64_t v2 = *v1;
  *(void *)uint64_t result = 0LL;
  *(void *)(result + _Block_object_dispose(va, 8) = 0x23F5AF4C23F5AF4CLL;
  *(void *)(result + memset((void *)(v1 - 204), 50, 16) = 0xA94A23B81285297ALL;
  *(_DWORD *)(result + 24) = 1645153785;
  *(void *)(v2 - 0x4BD26FD1213425A1LL) = result + 0x27681A84B35EB105LL;
  *((_DWORD *)v1 + 2) = 1645153785;
  return result;
}

void sub_100036000(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_100036044(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(v2 + 8LL * ((1906 * (**(_BYTE **)(a2 + 8) == 0)) ^ 0x13Eu)))();
}

uint64_t sub_100036070()
{
  unsigned int v2 = v1 - ((2 * v1 + 1881461128) & 0x82B34678) + 2037124096;
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * ((912
                                          * (((2 * v2) & 0xECF2B9EA ^ 0x80B20068) + (v2 ^ 0x3720FFC9) + 1845473215 != 1685654708)) ^ 0x4AAu))
                            - 4LL))();
}

uint64_t sub_100036124(uint64_t a1, uint64_t a2, int a3, int a4)
{
  return (*(uint64_t (**)(void))(v4 + 8LL * ((26 * (a4 + a3 + v5 + 973 + (v5 ^ 0x9869E38) > 7)) ^ v5)))();
}

uint64_t sub_100036178( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v8
}

uint64_t sub_1000361BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v8
                              + 8LL
                              * (int)((((((a8 + 2059979559) & 0x33F0) + 118) ^ 0xC21B0EF2 ^ ((((a8 + 2059979559) & 0x33F0)
                                                                                            + 118) | 0x38) ^ 0xC21B0EC4)
                                     * (v9 < 0x20)) ^ (a8 + 2059979559) & 0x33F0)))();
}

uint64_t sub_10003620C(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int a7)
{
  unsigned int v12 = a7 + a3 + a4 + 2015;
  uint64_t v13 = v10 + v12;
  __int128 v14 = *(_OWORD *)(v13 - 31);
  uint64_t v15 = v9 + v12;
  *(_OWORD *)(v15 - 15) = *(_OWORD *)(v13 - 15);
  *(_OWORD *)(v15 - 31) = v14;
  return (*(uint64_t (**)(void))(v7
                              + 8LL
                              * ((((v11 & 0xFFFFFFE0) != 32) * (((v8 + a6 + 1315) | 0xC) - 1540)) ^ (v8 + a6 + 124))))();
}

void sub_100036268()
{
}

uint64_t sub_100036274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_DWORD *)(a5 + 1424) = v6 + ((v7 - v5) ^ 0x2D86C0A4);
  *(void *)(*(void *)(a1 + 96) + 520LL) = *(void *)(a2 + 8) + 1LL;
  return 0LL;
}

uint64_t sub_1000363CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W5>, int a4@<W8>)
{
  *(_BYTE *)(v5 + (v8 + v7)) = *(_BYTE *)(v6 + (v8 + v7));
  return ((uint64_t (*)(uint64_t, uint64_t, void))(*(void *)(v4
                                                                       + 8LL
                                                                       * ((41
                                                                         * (((v8 - 1 == a4) ^ (((a3 - 31) & 0xF7) - 104)) & 1)) ^ (a3 - 86405151) & 0x5266FF7u))
                                                           - 8LL))( a1,  a2,  (((a3 - 86405151) & 0x5266FF7) - 1385) | 0x482u);
}

void sub_100036430(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4) - 535753261 * (a1 ^ 0xAF40E2F);
  __asm { BR              X9 }

uint64_t sub_1000364B8@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL
}

void sub_1000364F8(int a1@<W8>)
{
  __asm { BR              X15 }

void sub_100036724()
{
}

void sub_10003672C()
{
}

uint64_t sub_100036760(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))((char *)*(&off_100074B40
                                                    + (((8 * (*(_DWORD *)(a2 + 4) != 1206753096)) | ((*(_DWORD *)(a2 + 4) != 1206753096) << 6)) ^ 0x99u))
                                          - 12))(4294925278LL);
}

uint64_t sub_1000367A8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_BYTE *)(*(void *)(a2 + 96) + 468LL) = *(_BYTE *)(*(void *)(a1 + 8) + 12LL);
  return ((uint64_t (*)(void))(*(void *)(v2 + 9208) - 12LL))(0LL);
}

uint64_t sub_100036800@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(a1 + (v7 + v5)) = *(_BYTE *)(v4 + (v7 + v5));
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (((v7 - 1 != v2) * v6) ^ v3)) - 12LL))(0LL);
}

void sub_100036834(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) ^ (3804331 * ((2 * (a1 & 0x520CC9FF) - a1 - 1376569856) ^ 0xD32613F6));
  uint64_t v2 = *(void *)a1;
  ((void (*)(char *, void (*)()))*(&off_100079130 + (v1 ^ 0x1C2)))( (char *)*(&off_100079130 + v1 - 229) - 4,  sub_10005A8B8);
  __asm { BR              X11 }

uint64_t sub_1000368F0()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((883 * (**(void **)(v1 + 8LL * (v2 ^ 0x1E8)) == 0LL)) ^ v2))
                            - ((v2 - 1332780451) & 0x4F709ED1)
                            + 585LL))();
}

  ;
}

uint64_t sub_10003694C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 8LL * (a1 ^ 0x2C2)))(v1);
}

void sub_10003696C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_1000369BC@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((19 * (v1 == 1206753083)) ^ 0x58Du)) - 8LL))();
}

uint64_t sub_1000369F4(_DWORD *a1)
{
  *((_BYTE *)a1 + (v3 ^ (v2 + 687)) + v1 + 4) = 79;
  *a1 = v1;
  return 0LL;
}

uint64_t sub_100036A28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)(a1 + (v3 + v4) + 4) = ((2 * **(_BYTE **)(a2 + 8)) & 0x9F) + (**(_BYTE **)(a2 + 8) ^ 0x4F);
  unsigned int v5 = *(_DWORD *)(a2 + 4) - 650652805;
  BOOL v6 = v5 < 0x21256AB6;
  BOOL v7 = v5 > 0x21256AB7;
  if (v6) {
    BOOL v7 = v6;
  }
  return ((uint64_t (*)(void))(*(void *)(a3 + 8LL * ((1572 * !v7) ^ 0x3BAu)) - 8LL))();
}

void sub_100036AD8()
{
}

void sub_100036AE0(uint64_t a1)
{
  BOOL v3 = *(_DWORD *)(*(void *)(a1 + 8) - 0xC7F991DE6408E19LL) == 159353952
    || *(_DWORD *)(*(void *)(a1 + 16) - 0xC7F991DE6408E19LL) == 159353952;
  int v1 = *(_DWORD *)a1 - 1225351577 * ((-1557536513 - (a1 | 0xA329E0FF) + (a1 | 0x5CD61F00)) ^ 0x7F4CC716);
  __asm { BR              X14 }

uint64_t sub_100036BF0@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL
}

uint64_t sub_100036C50(int a1)
{
  int v3 = (uint64_t (*)(void, uint64_t, uint64_t))(*(void *)(v1
                                                                    + 8LL
                                                                    * ((1868 * (v2 > ((a1 - 776) | 0x444) - 1239)) ^ a1))
                                                        - 8LL);
  return v3(v3, 136689414LL, 1868LL);
}

uint64_t sub_100036CC8( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  BOOL v20 = v17 > v19;
  *(_DWORD *)(a14 + 4LL * (a2 - 136689414)) = v15;
  if (v20 == a2 - 912297563 < ((v16 - 598) | 0x11A) + 1371874575) {
    BOOL v20 = a2 - 912297563 < v18;
  }
  return ((uint64_t (*)(void))(*(void *)(v14 + 8LL * ((977 * !v20) ^ v16)) - 8LL))();
}

uint64_t sub_100036D44(int a1)
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (a1 ^ (46 * (v2 == 0)))) - ((a1 + 118) ^ 0x419LL)))();
}

uint64_t sub_100036D78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  return ((uint64_t (*)(void))(*(void *)(v10
                                        + 8LL * (int)((((v12 + 1694736606) & 0x9AFC5BF7 ^ 0x26B) * (v11 > a10)) ^ v12))
                            - ((v12 - 2048383028) & 0x7A17D5E7)
                            + 441LL))();
}

uint64_t sub_100036DFC( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return ((uint64_t (*)(void))(*(void *)(v14
                                        + 8LL
                                        * ((925 * (*(_DWORD *)(a14 + 4LL * (v16 + v17 + 1)) == v15)) ^ (a1 + 588)))
                            - ((23 * (a1 ^ 0x1C8) - 265) | 0xC5u)
                            + 219LL))();
}

uint64_t sub_100036E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
}

void sub_100036E94()
{
}

void sub_100036E9C()
{
  _DWORD *v0 = v1;
}

void sub_100037294(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24) - 1225351577 * ((2 * (a1 & 0x2B9C6F1D) - a1 + 1415811298) ^ 0x77F948F4);
  if (*(_DWORD *)(*(void *)(a1 + 8) - 0xC7F991DE6408E19LL) - 159353952 >= 0) {
    unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0xC7F991DE6408E19LL) - 159353952;
  }
  else {
    unsigned int v2 = 159353952 - *(_DWORD *)(*(void *)(a1 + 8) - 0xC7F991DE6408E19LL);
  }
  if (*(_DWORD *)(*(void *)(a1 + 16) - 0xC7F991DE6408E19LL) - 159353952 >= 0) {
    unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 16) - 0xC7F991DE6408E19LL) - 159353952;
  }
  else {
    unsigned int v3 = 159353952 - *(_DWORD *)(*(void *)(a1 + 16) - 0xC7F991DE6408E19LL);
  }
  uint64_t v6 = *(void *)(a1 + 8);
  v5[1] = (460628867 * ((1088039055 - (v5 | 0x40DA288F) + (v5 | 0xBF25D770)) ^ 0xF3B3550D)) ^ (v1 + 290);
  sub_100046940((uint64_t)v5);
  if (v2 >= v3) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = v2;
  }
  __asm { BR              X16 }

uint64_t sub_100037420@<X0>(uint64_t a1@<X8>)
{
  int v11 = v4 - 413931738;
  uint64_t v12 = 4LL * (v7 + v5);
  int v13 = (*(_DWORD *)(*(void *)(v10 - 0xC7F991DE6408E15LL) + v12) ^ v6)
      - (*(_DWORD *)(*(void *)(v9 - 0xC7F991DE6408E15LL) + v12) ^ v6);
  *(_DWORD *)(*(void *)(a1 - 0xC7F991DE6408E15LL) + v12) = v13
                                                           + v6
                                                           - ((((v3 - 387) | 0x140) ^ (v8 + 434)) & (2 * v13));
  BOOL v15 = v7 - 1538539199 < 1733551910 && v7 - 1538539199 >= v11;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((v15 * v2) ^ v3)) - 12LL))();
}

uint64_t sub_100037534()
{
  BOOL v4 = v2 + 141438039 < (int)(v3 + 1266045501);
  if (v3 > 0x3489ADC2 != v2 + 141438039 < -881438147) {
    BOOL v4 = v3 > 0x3489ADC2;
  }
  return (*(uint64_t (**)(void))(v0 + 8LL * ((!v4 * (((v1 - 453) | 0x320) ^ 0x90)) ^ v1)))();
}

uint64_t sub_1000375AC()
{
  BOOL v4 = v2 + 773424304 < (int)(v3 + 1898030669 + v1 + 903);
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((57 * v4) | v1)) - 4LL))();
}

uint64_t sub_100037634@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  int v14 = v7 - 903;
  BOOL v15 = v12 > v6;
  uint64_t v16 = 4LL * (v10 + v8);
  int v17 = v3 + 404716728 + (*(_DWORD *)(*(void *)(v13 - 0xC7F991DE6408E15LL) + v16) ^ 0x401477F0);
  *(_DWORD *)(*(void *)(a2 - 0xC7F991DE6408E15LL) + vmemset((void *)(v1 - 204), 50, 16) = v17 + v9 - (v11 & (2 * v17));
  LODWORD(vmemset((void *)(v1 - 204), 50, 16) = v10 + 1 + v4;
  int v18 = v15 ^ ((int)v16 < a1 + 746);
  BOOL v19 = (int)v16 < v5;
  if (!v18) {
    BOOL v15 = v19;
  }
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1163 * v15) ^ v14)) - 4LL))();
}

uint64_t sub_100037730()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
}

uint64_t sub_100037774()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * ((691 * (v2 + v3 + ((v1 - 466) | 0x220u) + 538 - 1083 < 0x7FFFFFFF)) ^ v1)))();
}

uint64_t sub_1000377B0@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  int v6 = a1 - 1515627297;
  int v7 = a1 - 321;
  BOOL v8 = v4 - 179107018 < -1201983204;
  int v9 = (**(_DWORD **)(a2 - 0xC7F991DE6408E15LL) ^ 0x401477F0) + 1;
  **(_DWORD **)(a2 - 0xC7F991DE6408E15LL) = v9 + v3 - (v5 & (2 * v9));
  signed int v10 = (v6 & 0x5A56A53A ^ 0xBEA6F4D2) + 2041856053;
  int v11 = v8 ^ (v10 < -1201983204);
  BOOL v12 = v10 < v4 - 179107018;
  if (!v11) {
    BOOL v8 = v12;
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 8LL * ((269 * !v8) ^ v7)))(1515627834LL);
}

void sub_100037884()
{
}

uint64_t sub_100037890@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v14 = (a1 - 229) | 0x33;
  uint64_t v15 = 4LL * (v10 + v8);
  int v16 = v3 + 404716727 + (*(_DWORD *)(*(void *)(v13 - 0xC7F991DE6408E15LL) + v15) ^ v9);
  *(_DWORD *)(*(void *)(a2 - 0xC7F991DE6408E15LL) + v15) = v16 + v9 - ((v16 << ((v14 + 84) & 0xF6 ^ 0xC3)) & v11);
  BOOL v17 = v12 > v7;
  LODWORD(v15) = v10 + 1 + v5;
  int v18 = v17 ^ ((int)v15 < v4);
  BOOL v19 = (int)v15 < v6;
  if (!v18) {
    BOOL v17 = v19;
  }
  return (*(uint64_t (**)(void))(v2 + 8LL * ((350 * v17) ^ v14)))();
}

uint64_t sub_100037998()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * ((247 * (v2 + v3 - 1 < ((v1 + 393399162) & 0xE88D367D ^ 0x7FFFFBE7))) ^ (v1 + 596)))
                            - 8LL))();
}

uint64_t sub_100037A10@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((197
                                          * (*(_DWORD *)(*(void *)(a1 - 0xC7F991DE6408E15LL)
                                                       + 4LL * (v3 + v5 + ((v2 + 12) | 0x50u) - 1141)) == v4 + 262 * (((v2 + 12) | 0x50) ^ 0x470) - 1048)) ^ ((v2 + 12) | 0x50)))
                            - 8LL))();
}

uint64_t sub_100037A7C()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * ((108 * (((v1 ^ ((v3 + v2 - 2) < 0x7FFFFFFF)) & 1) == 0)) ^ v1))
                            - ((v1 - 1178509359) & 0x463E9E36)
                            + 536LL))();
}

uint64_t sub_100037AD4()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * (int)((197
                                               * (*(_DWORD *)(v1 + 4LL * (v4 + (v2 ^ v3) + v6 - 1141)) == v5 + 262 * (v2 ^ v3 ^ 0x470) - 1048)) ^ v2 ^ v3))
                            - 8LL))();
}

void sub_100037B24(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0xC7F991DE6408E19LL) = (((v3 + v2) * (v1 - 1901766679)) ^ 0x5DFFADE4)
                                        - 1417683332
                                        + ((2 * (v3 + v2) * (v1 - 1901766679)) & 0xBBFF5BC8);
}

void sub_100037BB0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4) - 1178560073 * (a1 ^ 0xBA947862);
  __asm { BR              X9 }

uint64_t sub_100037C5C@<X0>(int a1@<W8>)
{
}

uint64_t sub_100037CA4()
{
  BOOL v6 = (*(_BYTE *)(v3 - 0x27681A84B35EB0F1LL) & 1) == 0
    && (*(_DWORD *)(v2 + 16) ^ v0) - 193011051 < ((v1 - 478) | 0x100u) - 337;
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * ((v6 | (16 * v6)) ^ v1)) - 4LL))();
}

uint64_t sub_100037D10@<X0>( uint64_t (*a1)(unsigned int *)@<X8>, uint64_t a2, unsigned int a3, int a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  unsigned int v11 = 3804331 * (((&a3 | 0xCAC897F1) - (&a3 & 0xCAC897F1)) ^ 0xB41DB207);
  a7 = v11 + 384812048;
  a3 = v11 + 1116194082;
  a4 = v11 + v10 + 248;
  a5 = v7;
  a6 = v8;
  uint64_t v12 = a1(&a3);
  return ((uint64_t (*)(uint64_t))(*(void *)(v9
                                                      + 8LL
                                                      * (((*(_DWORD *)(v8 - 0x27681A84B35EB0EDLL) != ((v10 + 369513487) & 0xE9F9ABF9) + 1645153504)
                                                        * ((v10 + 1017) ^ 0x500)) | v10))
                                          - 12LL))(v12);
}

void sub_100037DE0()
{
  unsigned int v5 = v3 - (((v4 + 1008) ^ 0x989A24D6) & (2 * v3 - 386021972)) + 1087108037;
  _BYTE *v7 = (HIBYTE(v5) ^ 0x4C) - ((v5 >> 23) & 0x64) + 50;
  v7[1] = (BYTE2(v5) ^ 0x4D) - ((v5 >> 15) & 0x64) + 50;
  _DWORD v7[2] = (BYTE1(v5) ^ 0x10) - ((2 * (BYTE1(v5) ^ 0x10)) & 0x64) + 50;
  v7[3] = (v3 - (((v4 - 16) ^ 0xD6) & (2 * v3 - 84)) - 59) ^ 0xDD;
  uint64_t v6 = v2 - ((2 * v2) & 0x3749B0E77A16C552LL) + 0x1BA4D873BD0B62A9LL;
  _BYTE v7[4] = (HIBYTE(v6) ^ 0x1B) - ((2 * (HIBYTE(v6) ^ 0x1B)) & 0x64) + 50;
  v7[5] = (BYTE6(v6) ^ 0xA4) - ((2 * (BYTE6(v6) ^ 0xA4)) & 0x64) + 50;
  v7[6] = (BYTE5(v6) ^ 0xD8) + (~(2 * (BYTE5(v6) ^ 0xD8)) | 0x9B) + 51;
  v7[7] = (BYTE4(v6) ^ 0x73) - 2 * ((BYTE4(v6) ^ 0x73) & 0x36 ^ BYTE4(v6) & 4) + 50;
  v7[8] = (((v2 - ((2 * (_DWORD)v2) & 0x7A16C552) - 1123327319) >> 24) ^ 0xBD)
  v7[9] = (BYTE2(v6) ^ 0xB) - ((2 * (BYTE2(v6) ^ 0xB)) & 0x64) + 50;
  v7[10] = (BYTE1(v6) ^ 0x62) - 2 * ((BYTE1(v6) ^ 0x62) & 0x36 ^ BYTE1(v6) & 4) + 50;
  v7[11] = (v2 - ((2 * v2) & 0x52) - 87) ^ 0x9B;
  _DWORD *v0 = *(_DWORD *)(v1 - 0x27681A84B35EB0EDLL);
}

uint64_t sub_1000384D0(uint64_t a1)
{
  int v1 = 628203409 * (((a1 | 0xC21FEC2B) - (a1 & 0xC21FEC2B)) ^ 0x4097E018);
  int v2 = *(_DWORD *)(a1 + 8) - v1;
  unsigned int v3 = v1 + *(_DWORD *)(a1 + 12) - 507371026;
  unsigned int v4 = (*(_DWORD *)(*(void *)a1 - 0x5C6940C6B1BC6FF6LL) ^ 0x6731FE54) + v3;
  unsigned int v5 = v4 - ((2 * v4) & 0xCE63FCA8) + 1731329620;
  *(_DWORD *)(*(void *)a1 - 0x5C6940C6B1BC6FF6LL) = v5;
}

void sub_100038598(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x5C6940C6B1BC6FFALL) = (*(_DWORD *)(a1 - 0x5C6940C6B1BC6FFALL) ^ 0x37D4814A)
                                         + 936673610
                                         - ((2 * (*(_DWORD *)(a1 - 0x5C6940C6B1BC6FFALL) ^ 0x37D4814A) + 2) & 0x6FA90294)
                                         + 1;
}

void sub_1000385E0(_DWORD *a1)
{
  unsigned int v1 = 235795823 * (((_DWORD)a1 - 1876425126 - 2 * (a1 & 0x9028065A)) ^ 0x4854F03);
  unsigned int v2 = a1[9] + v1;
  int v3 = *a1 ^ v1;
  BOOL v5 = (v3 & 0x30000000) == 0 || (v3 & 0x3F000000) == 603979776;
  __asm { BR              X11 }

uint64_t sub_1000386B0@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, unsigned int a5, uint64_t a6, unint64_t *a7, int a8, unint64_t *a9, char a10, int a11)
{
  uint64_t v15 = *(void *)(v12 + 8);
  unsigned int v16 = 1755732067
      * (((&a4 | 0xA5876138) - &a4 + (&a4 & 0x5A789EC0)) ^ 0x7B41DCE3);
  a8 = v16 + v14 + 301;
  a9 = &STACK[0xF250A47131524F5];
  a6 = v15;
  a7 = &STACK[0x4B30070DAA05F9E0];
  a10 = (99 * (((&a4 | 0x38) - &a4 + (&a4 & 0xC0)) ^ 0xE3)) ^ 0xC5;
  a5 = ((v11 ^ 0x1B729855) + 394248036 + ((v11 << ((v14 - 29) ^ 0x36)) & 0xFD3BA1FE ^ 0xC91A8154)) ^ v16;
  a4 = &STACK[0x330904BA72E93EC4];
  uint64_t v17 = (*(uint64_t (**)(unint64_t **))(a1 + 8LL * (v14 ^ 0x12F)))(&a4);
  return ((uint64_t (*)(uint64_t))(*(void *)(v13 + 8LL * ((1381 * (a11 == 1645153785)) ^ v14)) - 8LL))(v17);
}

uint64_t sub_1000387E8()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
}

uint64_t sub_100038848( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
}

uint64_t sub_1000388C4()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (v0 ^ (692 * (v1 != 0xD86A8E34)))) - 12LL))();
}

uint64_t sub_100038918@<X0>(uint64_t a1@<X8>)
{
  BOOL v9 = v4 > 0x13057B94;
  *(_BYTE *)(a1 + (v7 - 281128576)) = *(_BYTE *)(v1 + (v7 - 281128576));
  if (v9 == v7 - 600254996 < v3) {
    BOOL v9 = v7 - 600254996 < v5;
  }
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((v9 * v6) ^ v2)) - 12LL))();
}

uint64_t sub_10003899C()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((15
                                          * (((2 * v1) & 0xDF59FFDE ^ 0x90511C48)
                                           + (v1 ^ 0xB7C671DB)
                                           + ((v0 - 808) ^ 0xF7DF7F8F) != 1737260655)) ^ v0))
                            - 12LL))();
}

uint64_t sub_100038A08()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((2015
                                          * ((((v0 - 1873608687) < 0xC) ^ (-83 * (v1 ^ 4))) & 1)) ^ v1))
}

uint64_t sub_100038A64(int a1, int a2, int a3)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((28
                                          * (((a3 + a1 + v4 - (v3 & 3) + 1486) & 0xFFFFFFFC) <= a1
                                                                                              + v4
                                                                                              + ((((a2 - 878) | 0x304)
                                                                                                + a3) ^ (20 * (a2 ^ 0x77Eu))))) ^ a2))
                            - 12LL))();
}

uint64_t sub_100038ACC@<X0>(unsigned int a1@<W0>, uint64_t a2@<X8>, uint8x8_t a3@<D0>)
{
  uint64_t v8 = (v6 - 519);
  a3.i32[0] = *(_DWORD *)(a2 + (v8 ^ 0x4FF) + a1);
  *(_DWORD *)(a2 - 3 + (v3 + v4 + v8 - 1007 - 271)) = vmovn_s16((int16x8_t)vmovl_u8(a3)).u32[0];
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * (int)((1019 * (v5 != 4)) ^ v8)) - 8LL))();
}

uint64_t sub_100038B30@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 3 + (v3 + v2)) = *(_DWORD *)(v1 - 3 + (v3 + v2));
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (((v5 == 4) * (((v4 - 71) | 2) ^ 0x77A)) ^ (v4 + 311))) - 8LL))();
}

uint64_t sub_100038B84(int a1)
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((((a1 - 660417817) & 0x275D2D5D ^ 0x127) * (v1 == v2)) ^ a1)) - 4LL))();
}

uint64_t sub_100038BC4@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(a1 + (v4 + v3)) = *(_BYTE *)(v1 + (v4 + v3));
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * ((529 * (v4 - 1 != v2)) ^ (v5 + 40))) - (v5 ^ 0x2ECu) + 948LL))();
}

uint64_t sub_100038C04()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((1570
                                          * ((((v0 - 696) ^ (*(void *)(v1 + 16) == 0x2E91F1FE0AA58417LL)) & 1) == 0)) ^ v0))
                            - 12LL))();
}

uint64_t sub_100038C48@<X0>(uint64_t a1@<X8>, int a2, int a3)
{
  *(_DWORD *)(a1 - 0x2E91F1FE0AA58417LL) = a3;
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL * ((980 * (*(void *)(v4 + 24) != 0x5412677448247A30LL)) ^ (v3 - 612)))
                            - 8LL))();
}

void sub_100038CA0(uint64_t a1@<X8>)
{
  *(void *)(a1 - 0x5412677448247A30LL) = v2;
  *(_DWORD *)(v1 + 32) = 1645153785;
}

void sub_100038D3C(uint64_t a1)
{
  int v1 = 1759421093 * (((a1 | 0x9EBEB665) - a1 + (a1 & 0x6141499A)) ^ 0x2DC30631);
  int v2 = *(_DWORD *)(a1 + 16) + v1;
  __asm { BR              X14 }

uint64_t sub_100038E04@<X0>(uint64_t a1@<X8>)
{
  unsigned int v5 = 108757529 * ((1436736608 - (&v7 | 0x55A2DC60) + (&v7 | 0xAA5D239F)) ^ 0x4AC141B4);
  uint64_t v8 = v1;
  int v7 = v5 + v3 + 163;
  unsigned int v9 = (v2 - ((((739 * (v3 ^ 0x312)) ^ 0xED4E0848) + v4) & 0xC39B409E) + 1484039958) ^ v5;
  return ((uint64_t (*)(int *))(*(void *)(a1 + 8LL * (v3 ^ 0x38E)) - 8LL))(&v7);
}

void sub_100038F78(uint64_t a1, uint64_t a2)
{
  **(_DWORD **)(a1 + 96) = *(_DWORD *)(a2 + 16);
  int v3 = 1178560073 * ((&v5 - 1556789680 - 2 * ((unint64_t)&v5 & 0xA3354650)) ^ 0x19A13E32);
  int v5 = 1076023948 - v3;
  uint64_t v6 = &STACK[0x5C6940C6B1BC70A6];
  int v7 = 1172345435 - v3;
  sub_100023C94((uint64_t)&v5);
  __asm { BR              X9 }

uint64_t sub_10003911C()
{
  unsigned int v5 = v1 - 2147479261;
  if (v5 <= 0x40) {
    unsigned int v5 = 64;
  }
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((659 * (v4 - v0 - v2 + v5 > 0xE)) ^ 0x492u)) - 12LL))();
}

uint64_t sub_100039188(unsigned int a1)
{
  int v7 = v2 + v1;
  int v8 = v7 - 2147479261;
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * ((11 * (v6 - v7 >= (v4 + v8))) ^ a1)) - 12LL))();
}

uint64_t sub_1000391D0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, int a22, char a23)
{
  return ((uint64_t (*)(void))(*(void *)(v25
                                        + 8LL
                                        * ((46
}

uint64_t sub_100039238@<X0>(int a1@<W8>)
{
  int v7 = 638 * (v4 ^ 0x517);
  v8.i64[0] = 0x6464646464646464LL;
  v8.i64[1] = 0x6464646464646464LL;
  v9.i64[0] = 0x3232323232323232LL;
  v9.i64[1] = 0x3232323232323232LL;
  *(int8x16_t *)(v2 + a1 + (v7 ^ 0x17D ^ (v1 + 897))) = vaddq_s8( vsubq_s8(*v6, vandq_s8(vaddq_s8(*v6, *v6), v8)),  v9);
}

void sub_1000392BC()
{
}

uint64_t sub_1000392C8(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v4
                                                               + 8LL
                                                               * (((((v3 - 1867562114) & 0x50B70A) + 879) * (v1 == v2)) ^ v3))
                                                   - (v3
                                                    - 735)
                                                   + 670LL))( a1,  2427853056LL);
}

uint64_t sub_100039318@<X0>( int a1@<W1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, char a17)
{
  *(&a17 + (a2 + v17)) = *(_BYTE *)(v18 + v21 - 1473562207)
  return ((uint64_t (*)(void))(*(void *)(v20 + 8LL * ((107 * ((a1 + a2 + 49) > 0x3F)) ^ v19)) - 12LL))();
}

uint64_t sub_100039388( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, int32x4_t a41, int32x4_t a42, int32x4_t a43, int32x4_t a44)
{
  uint64_t v120 = v45;
  int v52 = (uint64_t (*)(__n128, __n128, __n128, __n128, __n128))(*(void *)(v46 + 8LL * v44) - 4LL);
  v53.n128_u64[0] = 0x3232323232323232LL;
  v53.n128_u64[1] = 0x3232323232323232LL;
  __n128 v54 = (__n128)vdupq_n_s32(0x620F0DFFu);
  __n128 v55 = (__n128)vdupq_n_s32(0x620F0DF9u);
  uint64_t v123 = v51 - 16;
  v56.n128_u64[0] = 0x6464646464646464LL;
  v56.n128_u64[1] = 0x6464646464646464LL;
  __n128 v57 = (__n128)vdupq_n_s32(0xC41E1BF2);
  HIDWORD(a13) = a13 + 972540699;
  uint64_t v58 = HIDWORD(a31);
  uint64_t v59 = a33;
  int v60 = BYTE4(a34) ^ 0x5F;
  HIDWORD(amemset((void *)(v1 - 204), 50, 16) = BYTE4(a34) ^ 0x5F;
  if (v60 == 2)
  {
    unint64_t v121 = __PAIR64__(a32, HIDWORD(a31));
    unint64_t v122 = __PAIR64__(a33, HIDWORD(a32));
    int8x16x4_t v125 = vld4q_s8((const char *)&a22 + 4);
    int v94 = a6 + a5 + 337;
    LODWORD(amemset((void *)(v1 - 204), 50, 16) = HIDWORD(a33);
    uint8x16_t v95 = (uint8x16_t)veorq_s8(v125.val[0], (int8x16_t)v53);
    uint16x8_t v96 = vmovl_u8(*(uint8x8_t *)v95.i8);
    uint16x8_t v97 = vmovl_high_u8(v95);
    uint8x16_t v98 = (uint8x16_t)veorq_s8(v125.val[1], (int8x16_t)v53);
    _Q22 = vmovl_u8(*(uint8x8_t *)v98.i8);
    _Q21 = vmovl_high_u8(v98);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }

    uint8x16_t v103 = (uint8x16_t)veorq_s8(v125.val[2], (int8x16_t)v53);
    uint16x8_t v104 = vmovl_high_u8(v103);
    uint16x8_t v105 = vmovl_u8(*(uint8x8_t *)v103.i8);
    v125.val[0] = veorq_s8(v125.val[3], (int8x16_t)v53);
    v125.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v125.val[0]);
    v125.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v125.val[1]);
    v125.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v125.val[1].i8);
    v125.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v125.val[0].i8);
    v125.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v125.val[0]);
    v125.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v125.val[0].i8);
    int32x4_t v106 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v105.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v96.i8), 0x18uLL)),  v125.val[0]);
    int32x4_t v107 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v105, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v96), 0x18uLL)),  v125.val[3]);
    int32x4_t v108 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v104.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v97.i8), 0x18uLL)),  v125.val[1]);
    int32x4_t v109 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v104, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v97), 0x18uLL)),  v125.val[2]);
    v125.val[0] = veorq_s8( vandq_s8((int8x16_t)v106, (int8x16_t)v54),  (int8x16_t)(*(_OWORD *)v125.val & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    v125.val[3] = veorq_s8( vandq_s8((int8x16_t)v107, (int8x16_t)v54),  (int8x16_t)(*(_OWORD *)&v125.val[3] & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    v125.val[1] = veorq_s8( vandq_s8((int8x16_t)v108, (int8x16_t)v54),  (int8x16_t)(*(_OWORD *)&v125.val[1] & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    v125.val[2] = veorq_s8( vandq_s8((int8x16_t)v109, (int8x16_t)v54),  (int8x16_t)(*(_OWORD *)&v125.val[2] & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    a43 = vaddq_s32(vsubq_s32(v108, vaddq_s32((int32x4_t)v125.val[1], (int32x4_t)v125.val[1])), (int32x4_t)v55);
    a44 = vaddq_s32(vsubq_s32(v109, vaddq_s32((int32x4_t)v125.val[2], (int32x4_t)v125.val[2])), (int32x4_t)v55);
    a41 = vaddq_s32(vsubq_s32(v106, vaddq_s32((int32x4_t)v125.val[0], (int32x4_t)v125.val[0])), (int32x4_t)v55);
    a42 = vaddq_s32(vsubq_s32(v107, vaddq_s32((int32x4_t)v125.val[3], (int32x4_t)v125.val[3])), (int32x4_t)v55);
    uint64_t v110 = v94 ^ 0x184u;
    uint64_t v111 = (_DWORD *)&a41 + v49 + 1580584629;
    int v112 = *(v111 - 8) ^ *(v111 - 3);
    uint64_t v113 = v110 ^ (v50 + 340);
    uint64_t v114 = *(v111 - 16);
    int v115 = v114 ^ *(v111 - 14) ^ (v112 + v113 - ((2 * v112) & 0xC41E1BF2));
    HIDWORD(v117) = v115 ^ v50;
    LODWORD(v117) = v115;
    int v116 = v117 >> 31;
    uint64_t v118 = (v50 + v116);
    *uint64_t v111 = v118 - ((2 * v116) & 0xC41E1BF2);
    int v119 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 + 8LL * ((1617 * (v51 != 1580584566)) ^ v94)) - 12LL);
    return v119( v110,  1580584630LL,  v58,  v59,  v119,  v118,  v114,  v113,  a9,  a10,  a11,  a12,  a13,  a14,  v120,  a16,  v121,  v122,  v52,  v123,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40);
  }

  else if (v60 == 1)
  {
    int8x16x4_t v124 = vld4q_s8((const char *)&a22 + 4);
    uint64_t v61 = 41 * (a5 ^ (a5 - 13));
    uint8x16_t v62 = (uint8x16_t)veorq_s8(v124.val[0], (int8x16_t)v53);
    uint16x8_t v63 = vmovl_high_u8(v62);
    int8x16_t v64 = (int8x16_t)vmovl_high_u16(v63);
    uint16x8_t v65 = vmovl_u8(*(uint8x8_t *)v62.i8);
    int8x16_t v66 = (int8x16_t)vmovl_high_u16(v65);
    uint8x16_t v67 = (uint8x16_t)veorq_s8(v124.val[1], (int8x16_t)v53);
    uint16x8_t v68 = vmovl_u8(*(uint8x8_t *)v67.i8);
    uint16x8_t v69 = vmovl_high_u8(v67);
    int8x16_t v70 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v68.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v65.i8));
    int8x16_t v71 = vorrq_s8((int8x16_t)vshll_high_n_u16(v68, 8uLL), v66);
    int8x16_t v72 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v69.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v63.i8));
    int8x16_t v73 = vorrq_s8((int8x16_t)vshll_high_n_u16(v69, 8uLL), v64);
    uint8x16_t v74 = (uint8x16_t)veorq_s8(v124.val[2], (int8x16_t)v53);
    _Q22 = (int8x16_t)vmovl_high_u8(v74);
    _Q21 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v74.i8);
    int8x16_t v77 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL);
    __asm { SHLL2           V21.4S, V21.8H, #0x10 }

    int8x16_t v82 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL);
    __asm { SHLL2           V22.4S, V22.8H, #0x10 }

    v124.val[0] = veorq_s8(v124.val[3], (int8x16_t)v53);
    v124.val[1] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v124.val[0].i8);
    v124.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v124.val[0]);
    int32x4_t v83 = (int32x4_t)vorrq_s8( vorrq_s8(v70, v77),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v124.val[1].i8), 0x18uLL));
    v124.val[1] = vorrq_s8( vorrq_s8(v71, _Q21),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v124.val[1]), 0x18uLL));
    int32x4_t v84 = (int32x4_t)vorrq_s8( vorrq_s8(v72, v82),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v124.val[0].i8), 0x18uLL));
    int32x4_t v85 = (int32x4_t)vorrq_s8( vorrq_s8(v73, _Q22),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v124.val[0]), 0x18uLL));
    a43 = vaddq_s32(vsubq_s32(v84, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v84, v84), (int8x16_t)v57)), (int32x4_t)v55);
    a44 = vaddq_s32(vsubq_s32(v85, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v85, v85), (int8x16_t)v57)), (int32x4_t)v55);
    a41 = vaddq_s32(vsubq_s32(v83, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v83, v83), (int8x16_t)v57)), (int32x4_t)v55);
    a42 = vaddq_s32( vsubq_s32( (int32x4_t)v124.val[1],  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v124.val[1], (int32x4_t)v124.val[1]), (int8x16_t)v57)),  (int32x4_t)v55);
    int v86 = (HIDWORD(a31) ^ (v47 + (v61 ^ 0x3FF) - 490))
        + ((a33 ^ v47) & (a32 ^ 0xAEC4588A) | (a32 ^ v47) & (HIDWORD(a32) ^ v47))
        - 2059938322
    int v87 = v86 + v47 - (v48 & (2 * v86));
    int v88 = (char *)*(&off_100079130 + (int)(v61 ^ 0x278)) - 4;
    int v89 = (((v87 ^ v47) << (v88[v123 + v49] - 98)) | ((v87 ^ v47) >> (98 - v88[v123 + v49]))) + (a32 ^ v47);
    uint64_t v90 = v48 & (2 * v89);
    uint64_t v91 = v89 + v47 - v90;
    uint64_t v92 = *(uint64_t (**)(char *, uint64_t, void, void, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 8LL * (int)(v61 | 0xEA));
    return v92( v88,  v61,  v92,  a33,  v90,  1580584629LL,  HIDWORD(a32),  v91,  a9,  a10,  a11,  a12,  a13,  a14,  v45,  a16,  __PAIR64__(a32, HIDWORD(a31)),  __PAIR64__(a33, HIDWORD(a32)),  v52,  v123,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40);
  }

  else
  {
    HIDWORD(a31) = 2 * (HIDWORD(a31) ^ v47) + v47 - (v48 & (4 * (HIDWORD(a31) ^ v47)));
    LODWORD(a32) = 2 * (a32 ^ v47) + v47 - (v48 & (4 * (a32 ^ v47)));
    HIDWORD(a32) = 2 * (HIDWORD(a32) ^ v47) + v47 - (v48 & (4 * (HIDWORD(a32) ^ v47)));
    LODWORD(a33) = 2 * (a33 ^ v47) + v47 - (v48 & (4 * (a33 ^ v47)));
    return v52(v53, v54, v55, v56, v57);
  }

uint64_t sub_100039EC0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15)
{
  else {
    BOOL v17 = a15 + 1141814776 > v15;
  }
}

uint64_t sub_100039F54(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  return ((uint64_t (*)(void))(*(void *)(v7
                                        + 8LL
}

uint64_t sub_100039F9C( int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return ((uint64_t (*)(void))(*(void *)(v16
                                        + 8LL
                                        * ((460
                                          * (a14
                                           + v15
}

uint64_t sub_100039FE8@<X0>(int a1@<W3>, int a2@<W4>, int a3@<W5>, int a4@<W8>)
{
  *(_BYTE *)(v6 + v_Block_object_dispose(va, 8) = *(_BYTE *)(v10 + (v5 + a1))
  return (*(uint64_t (**)(void))(v9 + 8LL * (((v8 + 1 == (a4 ^ (a2 - 57)) + 7LL) * v7) ^ (a3 + a4 + 371))))();
}

uint64_t sub_10003A038@<X0>( int a1@<W3>, int a2@<W4>, int a3@<W5>, int a4@<W6>, int a5@<W7>, int a6@<W8>, int8x16_t a7@<Q0>, int8x16_t a8@<Q3>)
{
  int8x16_t v12 = *(int8x16_t *)(v11 + v8 + (((a6 ^ (a2 - 3)) * a4) ^ (a1 - 9)));
  *uint64_t v9 = vaddq_s8(vsubq_s8(v12, vandq_s8(vaddq_s8(v12, v12), a8)), a7);
  return (*(uint64_t (**)(void))(v10 + 8LL * (a5 ^ (a3 + a6 + 393))))();
}

uint64_t sub_10003A09C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  BOOL v16 = v13 + 1674314577 < (a13 + 1505040564);
  return ((uint64_t (*)(void))(*(void *)(v15 + 8LL * (int)((v16 | (2 * v16)) ^ v14)) - (v14 ^ 0x2B1LL)))();
}

uint64_t sub_10003A10C( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, int a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32)
{
  uint64_t v34 = (a2 - 113401905) & 0xB7FE76BF;
  int v35 = 628203409 * ((~((v33 - 120) | 0xCC5631E2) + ((v33 - 120) & 0xCC5631E2)) ^ 0xB121C22E);
  int v39 = (a2 + 415) | 0x10;
  *(void *)(v33 - 120) = a11;
  *(_DWORD *)(v33 - 112) = v35 + a2 + 1005;
  *(_DWORD *)(v33 - 10_Block_object_dispose(va, 8) = a13 - v35 - 1135465194;
  uint64_t v36 = sub_1000384D0(v33 - 120);
  uint64_t v37 = a32 & 0x3F;
  *(&a23 + (v37 ^ 0x14)) = -78;
  return ((uint64_t (*)(uint64_t))(*(void *)(v32
}

uint64_t sub_10003A224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
}

uint64_t sub_10003A25C()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((27 * ((((v1 ^ 0x6B0) - 1006) ^ v0) < 8)) ^ v1)) - 4LL))();
}

uint64_t sub_10003A294( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, int a22, char a23)
{
  *(void *)(&a23 + v24 + 1) = 0x3232323232323232LL;
}

uint64_t sub_10003A2E0(double a1)
{
  *int v1 = a1;
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (((v5 == 0) * v4) ^ v2)) - (v3 ^ 0x1DB)))();
}

uint64_t sub_10003A30C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * (v6 ^ (877 * (v8 != v7))))
                            + 2973505203LL
}

void sub_10003A340()
{
}

uint64_t sub_10003A350@<X0>( int a1@<W0>, int a2@<W3>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, char a18)
{
  BOOL v25 = v18 < v20;
  *(&a18 + 12 * (v21 ^ 0x2BDu) + a3 + v22) = *(_BYTE *)(v24 + (v19 + a2))
  unsigned int v26 = v19 + 1 + a1;
  int v27 = v25 ^ (v26 < v20);
  BOOL v28 = v26 < v18;
  if (!v27) {
    BOOL v25 = v28;
  }
  return ((uint64_t (*)(void))(*(void *)(v23 + 8LL * ((v25 | (2 * v25)) ^ v21)) - 8LL))();
}

uint64_t sub_10003A3CC@<X0>(int a1@<W4>, int a2@<W5>, int a3@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((1039 * (a3 - 1370612763 < ((277 * (v4 ^ (a1 - 5))) ^ 0x551u))) ^ (a2 + v4 + 233)))
                            - 12LL))();
}

uint64_t sub_10003A418@<X0>(unsigned int a1@<W8>)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1 - 1370612763LL;
  else {
    uint64_t v5 = 56LL;
  }
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (int)((((unint64_t)(v5 - v3 + 1370612763) > 7)
                                               * ((v1 + 1837422910) & 0x927B23FB ^ 0xB5)) | v1))
                            - 12LL))();
}

uint64_t sub_10003A48C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, int a22, char a23)
{
  *(void *)(&a23 + v24 - 1370612763) = 0x3232323232323232LL;
  return ((uint64_t (*)(void))(*(void *)(v26
                                        + 8LL
                                        * ((863 * ((v23 & 0xFFFFFFFFFFFFFFF8LL) == 8)) ^ ((v25 - 1837423955) | 0x29)))
                            - ((((v25 - 1837423955) | 0x29u) + 331) ^ 0x2C4LL)))();
}

uint64_t sub_10003A4F4(double a1)
{
  *uint64_t v3 = a1;
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (((v5 == 0) * v4) ^ v1)) - (v2 ^ 0x2C4)))();
}

uint64_t sub_10003A520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
}

void sub_10003A560()
{
}

uint64_t sub_10003AA10@<X0>( uint64_t a1@<X2>, char a2@<W4>, char a3@<W5>, unsigned int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, int a31)
{
  int v35 = *((_DWORD *)&a19 + ((v33 + v31) >> (a3 + a2 + v32 + 13 + 35)) + 18);
  *(_BYTE *)(a1 + (v33 + v31 + 1)) = (BYTE2(v35) ^ 0x3B) - ((2 * (BYTE2(v35) ^ 0x3B)) & 0x64) + 50;
  *(_BYTE *)(a1 + (v33 + v31)) = (HIBYTE(v35) ^ 0x51) - ((2 * (HIBYTE(v35) ^ 0x51)) & 0x64) + 50;
  *(_BYTE *)(a1 + (v33 + v31 + 3)) = v35 ^ 0x47;
  *(_BYTE *)(a1 + (v33 + v31 + 2)) = (BYTE1(v35) ^ 0xA7) - ((2 * (BYTE1(v35) ^ 0xA7)) & 0x64) + 50;
  if (v33 + 1230102376 < a4 != a31 - 1338440525 < a4) {
    BOOL v36 = a31 - 1338440525 < a4;
  }
  else {
    BOOL v36 = v33 + 1230102376 < (a31 - 1338440525);
  }
  return ((uint64_t (*)(void))(*(void *)(v34 + 8LL * ((496 * !v36) ^ v32)) - 8LL))();
}

uint64_t sub_10003AB00@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, int a34, __int16 a35, char a36, char a37)
{
  unint64_t v38 = ((2LL * (void)&a22) & 0xABEF7EE8F7F2B6F0LL)
  a37 = ((v38 - 58) ^ 0xBA) * (v38 - 41);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v37 + 8LL * (int)((a5 + a9 - 792) ^ (a5 - 58) ^ a9)) - 8LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26);
}

void sub_10003AB94()
{
}

uint64_t sub_10003ABA0()
{
  return 0LL;
}

void sub_10003ABE0(uint64_t a1)
{
  int v1 = 1178560073 * ((-2 - ((a1 | 0xAE85A791) + (~(_DWORD)a1 | 0x517A586E))) ^ 0xEBEE200C);
  __asm { BR              X10 }

uint64_t sub_10003AC7C@<X0>(uint64_t a1@<X8>)
{
}

uint64_t sub_10003ACD0@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((v1 + 939) ^ 0x26)) - 4LL))();
}

uint64_t sub_10003ADF8@<X0>(int a1@<W6>, int a2@<W7>, uint64_t a3@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a3
                                        + 8LL
}

uint64_t sub_10003AE34@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((1465 * (v1 != 461 * (v2 ^ 0x29C) - 1383)) ^ v2)) - 4LL))();
}

uint64_t sub_10003AE68@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v3 - 0xC7F991DE6408E15LL) + 4LL * (v2 + v1)) = v4;
  int v6 = v2 + v5 + 712 - 1382;
  *(_DWORD *)(v3 - 0xC7F991DE6408E19LL) = v6;
  int v7 = v6 + v1;
  if (v6 + v1 < 0) {
    int v7 = -v7;
  }
  return (*(uint64_t (**)(void))(a1
                              + 8LL
                              * ((69
                                * ((v7 ^ 0x3D7FACEB)
                                 + (((v5 + 712) ^ 0x7AFF5CB1) & (2 * v7))
                                 - 1031777824
                                 + ((((v5 + 712) ^ 0x5F2) + 123) | 0x24) >= 0)) ^ (v5 + 712) ^ 0x5F2)))();
}

uint64_t sub_10003AF40@<X0>(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(a2
                              + 8LL
                              * (int)(((*(_DWORD *)(*v4 + 4LL * a1) == v2) * ((v3 + 1043585895) & 0xC1CC2537 ^ 0x4C6)) ^ v3)))();
}

uint64_t sub_10003AF80@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8LL * ((69 * (v2 - 1 + ((v1 + 123) | 0x24) >= 0)) ^ v1)))();
}

uint64_t sub_10003AFB8(uint64_t result)
{
  else {
    int v6 = v5;
  }
  *int v4 = v6;
  *(_DWORD *)(result + 24) = 1261507126;
  return result;
}

void sub_10003AFFC(uint64_t a1)
{
  int v1 = 1178560073 * ((-2 - ((a1 | 0x5A50E64C) + (~(_DWORD)a1 | 0xA5AF19B3))) ^ 0x1F3B61D1);
  int v2 = *(_DWORD *)(a1 + 40) ^ v1;
  if (*(void *)(a1 + 48) | *(void *)(a1 + 64)) {
    BOOL v3 = *(_DWORD *)(a1 + 24) + v1 == 1354219139;
  }
  else {
    BOOL v3 = 1;
  }
  int v4 = !v3;
  __asm { BR              X9 }

uint64_t sub_10003B154@<X0>(int a1@<W8>)
{
  BOOL v4 = v1[1] == 0x1171F84DB0CF5C20LL || (v1[7] | v1[4]) == 0LL;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1402 * (((a1 + 56) ^ v4) & 1)) ^ a1)) - 8LL))();
}

uint64_t sub_10003B1AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, char a28, uint64_t a29, char a30, uint64_t a31, char a32)
{
  uint64_t v37 = *(void *)(v35 + 72);
  *(_DWORD *)(v33 - 0x1171F84DB0CF5C20LL) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, char *, char *, char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8LL * ((2043 * (v37 != 0xC7F991DE6408E1DLL)) ^ v32)))( v37,  0x7542B2AE5773797LL,  &a25,  &a30,  &a32,  &a28,  &a20,  0xC7F991DE6408E1DLL,  a9,  a10,  v34);
}

uint64_t sub_10003B248@<X0>( uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, int a8@<W8>, uint64_t a9, uint64_t a10)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 + 8LL * (((a8 - 925) * (v10 == 0)) ^ (a8 - 363))) - ((a8 + 1873335829) & 0x905726BF ^ 0x86LL)))( a3 + a7,  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a9,  a10);
}

uint64_t sub_10003B394( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  int v27 = v18 ^ 0x6A4;
  int v28 = ((v26 - 1956630864 - 2 * ((v26 - 144) & 0x8B602F40)) ^ 0x31F45722) * v19;
  *(_DWORD *)(v26 - 1memset((void *)(v1 - 204), 50, 16) = v28 + v21 + (v18 ^ 0x9796BF8);
  *(void *)(v26 - 136) = v20;
  *(void *)(v26 - 12_Block_object_dispose(va, 8) = a1;
  *(_DWORD *)(v26 - 144) = v28 + v18 + 166;
  ((void (*)(uint64_t))(*(void *)(v22 + 8LL * (v18 - 21)) - 12LL))(v26 - 144);
  *(void *)(v26 - 144) = v23;
  *(void *)(v26 - 136) = a16;
  *(_DWORD *)(v26 - 12_Block_object_dispose(va, 8) = (v27 - 44) ^ (628203409
                                       * ((((2 * (v26 - 144)) | 0x6174B83A) - (v26 - 144) + 1329964003) ^ 0x3232502E));
  ((void (*)(uint64_t))(*(void *)(v22 + 8LL * (v27 - 1446)) - 12LL))(v26 - 144);
  *(void *)(v26 - 144) = a17;
  *(void *)(v26 - 136) = a16;
  *(_DWORD *)(v26 - 12_Block_object_dispose(va, 8) = v27
                         + 1374699841 * (((~(v26 - 144) & 0xF8095E0E) - (~(v26 - 144) | 0xF8095E0F)) ^ 0x95FD4606)
                         - 507;
  *(void *)(v26 - 112) = a15;
  *(void *)(v26 - 104) = v23;
  *(void *)(v26 - 120) = a18;
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(v22 + 8LL * (v27 - 1361)))(v26 - 144);
  return ((uint64_t (*)(uint64_t))(*(void *)(v24
                                                      + 8LL
}

uint64_t sub_10003B594()
{
  int v6 = 535753261 * (((((v5 - 144) | 0x615B03DC) ^ 0xFFFFFFFE) - (~(v5 - 144) | 0x9EA4FC23)) ^ 0x9450F20C);
  *(_DWORD *)(v5 - 144) = (v2 - 1439 + v1 - 510816560) ^ v6;
  *(_DWORD *)(v5 - 12_Block_object_dispose(va, 8) = v2 - 1439 - v6 + 289;
  *(void *)(v5 - 120) = v3;
  *(void *)(v5 - 136) = v8;
  uint64_t result = ((uint64_t (*)(uint64_t))(*(void *)(v4 + 8LL * (v2 - 1462)) - 8LL))(v5 - 144);
  *uint64_t v10 = v9;
  _DWORD *v0 = 1645153785;
  return result;
}

void sub_10003B6E8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4) ^ (1755732067 * (((a1 | 0x83D72B3C) - (a1 & 0x83D72B3C)) ^ 0x5D1196E7));
  uint64_t v2 = *(void *)(a1 + 8);
  v3[0] = v1 + 628203409 * (((v3 | 0xF56E3C19) + (~v3 | 0xA91C3E6)) ^ 0x77E6302B) - 501;
  uint64_t v4 = v2;
  sub_100027AB0((uint64_t)v3);
  __asm { BR              X9 }

uint64_t sub_10003B820@<X0>(uint64_t a1@<X8>)
{
  unsigned int v5 = (((v4 ^ v3) >> 4) & 0xFFF6EF8 ^ 0x5AA4270) + (((v4 ^ v3) >> 5) ^ 0x6D2A9EC5) - 375855535;
  BOOL v7 = v5 > v1 + 1503173062 && v5 < v2 + 1503174093;
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((948 * v7) ^ v1)) - (((v1 - 882) | 0xAu) ^ 0x92LL)))();
}

uint64_t sub_10003B8A8@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
}

uint64_t sub_10003B8F0@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                                     + 8LL
                                                     * (((((v2 ^ 0x2B) + 325) ^ (v2 + 289))
}

void sub_10003B950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v13 = v5 + 1879029627;
  uint64_t v14 = *(void *)(v11 - 0xC7F991DE6408E15LL);
  unsigned int v15 = (*(_DWORD *)(v14 + 4LL * (v12 - 1)) ^ (a5 + v7 - 1030)) >> v6;
  uint64_t v16 = 4LL * v13;
  *(_DWORD *)(v14 + vmemset((void *)(v1 - 204), 50, 16) = v15 + v7 - (v8 & (2 * v15));
  int v17 = v18 - (*(_DWORD *)(*(void *)(v11 - 0xC7F991DE6408E15LL) + v16) == v7);
  *int v9 = v17;
}

void sub_10003BC10(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }

uint64_t sub_10003BC84@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((2
                                          * (((a1 - 1206753083) ^ 0x7FFF75CFFFFAEFB9LL)
                                           - 0x7FFF75CF03D79510LL
}

uint64_t sub_10003BD18()
{
  int v6 = *(unsigned __int8 *)(v4 + v3 - 0x2500E162B343AFF1LL) - *(unsigned __int8 *)(v1 + v3 - 0x2500E162B343AFF1LL);
  return ((uint64_t (*)(uint64_t))(*(void *)(v5
                                                      + 8LL
                                                      * (((((((2 * v2) ^ 0x61E) - 1769999280) & (2 * v6)) + (v6 ^ v0) == v0)
                                                        * (v2 ^ 0x41C)) ^ v2))
                                          - 8LL))(4294925278LL);
}

uint64_t sub_10003BD80()
{
  BOOL v5 = v1 < v0;
  if (v5 == v2 - 0x2500E161B7205547LL < v0) {
    BOOL v5 = v2 - 0x2500E161B7205547LL < v1;
  }
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * (v3 ^ (2 * !v5))) - (v3 ^ 0x2E5u) + 929LL))();
}

uint64_t sub_10003BDE8@<X0>(int a1@<W8>)
{
}

uint64_t sub_10003BE3C()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((1697
                                          * (((2 * (*v0 - 42)) & 0xEDBE4FCE) + ((*v0 - 42) ^ 0x76DF27E7) == 1994336231)) ^ v1))
                            - ((v1 - 38) | 0x25u)
                            + 491LL))();
}

uint64_t sub_10003BEA4()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1010
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
}

uint64_t sub_10003BEF4()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1360
                                          * ((((*(unsigned __int8 *)(v2 + 2) - 72) << (v3 + 9)) & v1)
}

uint64_t sub_10003BF54()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((2015
                                          * (((((v3 - 257) | 0x100) ^ (v1 - 405)) & (2
                                                                                   * (*(unsigned __int8 *)(v2 + 3) - 134)))
}

uint64_t sub_10003BFA4()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1473
                                          * ((((*(unsigned __int8 *)(v2 + 4) - 247) << (v3 + 9)) & v1)
}

uint64_t sub_10003BFF0(int a1)
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((2026
                                          * (((((v3 - 115) | 0x72) ^ a1) & (2 * (*(unsigned __int8 *)(v2 + 5) - 13)))
}

uint64_t sub_10003C040()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 6) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 6) - 1) ^ v0) == v0)
                                          * (((v3 - 152) | 0x97) + 908)) ^ v3))
                            - 12LL))();
}

uint64_t sub_10003C08C()
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((1901
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
}

uint64_t sub_10003C0D8()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 8) - 4)))
                                           + ((*(unsigned __int8 *)(v2 + 8) - 4) ^ v0) == v0)
                                          * (((v3 - 4) | 3) ^ 0x383)) ^ v3))
                            - 12LL))();
}

uint64_t sub_10003C124(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(v5 + 96) + 1428LL) = 527506314;
}

uint64_t sub_10003C188(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((11
                                          * ((v3 & (2 * (**(unsigned __int8 **)(a2 + 8) - 42)))
}

uint64_t sub_10003C1D0()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((907
                                          * ((((*(unsigned __int8 *)(v3 + 1) - 134) << (v2 ^ 0xF6)) & v1)
}

uint64_t sub_10003C214()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 2) - 72)))
                                           + ((*(unsigned __int8 *)(v3 + 2) - 72) ^ v0) == v0)
                                          * ((66 * (v2 ^ 0x1F3)) ^ 0x2E3)) ^ v2))
                            - 12LL))();
}

uint64_t sub_10003C25C()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1925
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 3) - 134)))
}

uint64_t sub_10003C2B0()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 4) - 247)))
                                           + ((*(unsigned __int8 *)(v3 + 4) - 247) ^ v0) == v0)
                                          * (v2 + 1339)) ^ v2))
                            - 12LL))();
}

uint64_t sub_10003C2E8()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * (int)((1627
                                               * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
}

uint64_t sub_10003C32C(int a1)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((1809
                                          * ((v2 & (2 * (*(unsigned __int8 *)(v4 + 6) - 1)))
}

uint64_t sub_10003C36C()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1896
                                          * (((v2 ^ 0xFF ^ (v1 - 264)) & (2 * (*(unsigned __int8 *)(v3 + 7) - 1)))
}

uint64_t sub_10003C3AC()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((637
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 8) - 5)))
                                           + ((*(unsigned __int8 *)(v3 + 8) - 5) ^ v0) == v0
                                                                                        + ((v2 + 340298752) & 0xEBB7735B)
                                                                                        - 339)) ^ v2))
                            - 12LL))();
}

uint64_t sub_10003C404(int a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(v4 + 96) + 1428LL) = 527506318;
}

uint64_t sub_10003C454(uint64_t a1, uint64_t a2)
{
  int v6 = **(unsigned __int8 **)(a2 + 8) - 42;
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * (((((v6 << (31 * (v4 ^ 1) - 22)) & v3) + (v6 ^ v2) != v2) * ((v4 ^ 0x101) + 22)) ^ v4))
                            - 12LL))();
}

uint64_t sub_10003C4A8()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1370
                                          * (((v1 + ((v2 + 1269073064) & 0xB45B7B7F) - 319) & (2
                                                                                             * (*(unsigned __int8 *)(v3 + 1)
                                                                                              - 134)))
}

uint64_t sub_10003C4FC()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((177
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 2) - 72)))
                                           + ((*(unsigned __int8 *)(v3 + 2) - 72) ^ v0) == v0)) ^ v2))
}

uint64_t sub_10003C538()
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((1410
                                          * (((v1 + v3 - 319) & (2 * (*(unsigned __int8 *)(v4 + 3) - 134)))
}

uint64_t sub_10003C574()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1878
                                          * ((((*(unsigned __int8 *)(v3 + 4) - 247) << (((v2 + 104) & 0xBF) - 62)) & v1)
}

uint64_t sub_10003C5C8()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((203
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
}

uint64_t sub_10003C608()
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((828
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v4 + 6) + (v3 ^ 0xFFFFFEC0))))
}

uint64_t sub_10003C644()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1128
                                          * (((v1 + (v2 ^ 0x28) - 319) & (2 * (*(unsigned __int8 *)(v3 + 7) - 1)))
}

uint64_t sub_10003C688()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1792
                                          * ((((11 * (v2 ^ 0x10A)) ^ (v1 - 221)) & (2
                                                                                  * (*(unsigned __int8 *)(v3 + 8) - 11)))
}

uint64_t sub_10003C6D4@<X0>(int a1@<W8>)
{
  int v5 = (v1 ^ 0x44) + 319;
  *(_DWORD *)(*(void *)(v3 + 96) + 1428LL) = 527506330;
  char v6 = (v1 ^ 0x44) - 54;
  int v7 = 1178560073 * ((2 * ((v4 - 120) & 0x128615B8) - (v4 - 120) - 310777277) ^ 0x57ED9221);
  *(void *)(v4 - 112) = v4 + 0x5C6940C6B1BC6F5ELL;
  *(_DWORD *)(v4 - 120) = (((v5 ^ 0x583) + 776745519) ^ (a1 - 1)) - v7;
  *(_DWORD *)(v4 - 104) = v5 - v7 + 1172344777;
  uint64_t v8 = sub_100023C94(v4 - 120);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2
                                                     + 8LL
                                                     * ((1410
                                                       * (*(_DWORD *)v3
                                                        - 165236985
                                                        + ((*(_DWORD *)(v4 - 152) << (v6 ^ 0x1C)) & 0x7A ^ 0x28)
                                                        + (*(_DWORD *)(v4 - 152) & 0x3F ^ 0xA7ED9FA9) < 0xFFFFFFC0)) ^ v5)))( v8,  313836798LL);
}

uint64_t sub_10003C8AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, int a21)
{
  unsigned int v26 = v22 + 1477599300;
  if (v26 <= 0x40) {
    unsigned int v26 = 64;
  }
  return ((uint64_t (*)(void))(*(void *)(v24
                                        + 8LL * (a21 ^ (8 * (-v21 - v23 + ((a21 - 1020) ^ (a8 - 787)) + v26 > 0xE))))
                            + 1267140513LL
                            - (a21 ^ (v25 - 1777))))();
}

uint64_t sub_10003C92C(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v13 = v9 + v8;
  int v14 = v13 + a2;
  return ((uint64_t (*)(void))(*(void *)(v12
                                        + 8LL
                                        * (int)(((((a1 + 757975018) & 0xD2D235E5) - 167)
}

uint64_t sub_10003C9A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return (*(uint64_t (**)(void))(v15
                              + 8LL
                              * ((19
                                * (a13
                                 + v16
                                 - 220
                                 + (unint64_t)(v13 + ((v14 - 275302696) & 0x5BEFCFE7 ^ 0x139567E6u)) > 0xF)) ^ v14)))();
}

uint64_t sub_10003C9F8@<X0>(int a1@<W4>, int a2@<W8>)
{
  v8.i64[0] = 0x6464646464646464LL;
  v8.i64[1] = 0x6464646464646464LL;
  v9.i64[0] = 0x3232323232323232LL;
  v9.i64[1] = 0x3232323232323232LL;
  *(int8x16_t *)(v4 + a2 + ((a1 + v3 + 708) ^ (v2 + 787))) = vaddq_s8( vsubq_s8( *v7,  vandq_s8(vaddq_s8(*v7, *v7), v8)),  v9);
  return (*(uint64_t (**)(int8x16_t *))(v6
                                                + 8LL * ((105 * (((v5 + 1) & 0x1FFFFFFF0LL) == 16)) ^ (a1 + v3 + 1588))))(v7 + 1);
}

void sub_10003CA64()
{
}

uint64_t sub_10003CA70(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
}

uint64_t sub_10003CAB4@<X0>(int a1@<W4>, int a2@<W6>, uint64_t a3@<X8>)
{
  *(_BYTE *)(v8 - 220 + (((v5 - v9 + 30) ^ 0xFFFFFFE1LL) & (a3 + v3))) = *(_BYTE *)(v4 + v7 - 313836798)
                                                                                     - ((2
                                                                                       * *(_BYTE *)(v4 + v7 - 313836798)) & 0x64)
                                                                                     + 50;
}

uint64_t sub_10003CB30( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, int a16, int a17, int a18, int a19, int a20, int a21, int a22, int a23, uint64_t (*a24)(void, __n128, __n128, __n128, __n128, __n128, __n128), int a25, int a26, uint64_t a27, uint64_t a28, int32x4_t a29, int32x4_t a30, int32x4_t a31, int32x4_t a32)
{
  __int128 v42 = *(uint64_t (**)(void, __n128, __n128, __n128, __n128, __n128, __n128))(v33 + 8LL * v32);
  a19 = a13 - 1361199332;
  a18 = ((v32 + 184812002) | v37) ^ 0x5B4E77BD;
  int v43 = (const char *)(v40 - 220);
  __n128 v44 = (__n128)vdupq_n_s32(0x620F0DFFu);
  v45.n128_u64[0] = 0x3232323232323232LL;
  v45.n128_u64[1] = 0x3232323232323232LL;
  __n128 v46 = (__n128)vdupq_n_s32(0x620F0DF9u);
  a27 = v36 - 16;
  v47.n128_u64[0] = 0x6464646464646464LL;
  v47.n128_u64[1] = 0x6464646464646464LL;
  v48.n128_u64[0] = 0x3333333333333333LL;
  v48.n128_u64[1] = 0x3333333333333333LL;
  __n128 v49 = (__n128)vdupq_n_s32(0xC41E1BF2);
  int v50 = (v41 + 1997669178) & 0x3D66F774;
  a25 = v50 ^ 0x239;
  a26 = v35 - 374;
  int v51 = *(_DWORD *)(v40 - 148);
  int v52 = *(_DWORD *)(v40 - 144);
  int v54 = *(_DWORD *)(v40 - 140);
  int v53 = *(_DWORD *)(v40 - 136);
  int v55 = *(_BYTE *)(v40 - 124) ^ 0x5F;
  a17 = *(unsigned __int8 *)(v40 - 124) ^ 0x5F;
  if (v55 == 2)
  {
    a20 = v51;
    a21 = v52;
    a22 = v54;
    a23 = v53;
    a24 = v42;
    int8x16x4_t v100 = vld4q_s8(v43);
    a16 = *(_DWORD *)(v40 - 132);
    uint8x16_t v80 = (uint8x16_t)veorq_s8(v100.val[0], (int8x16_t)v45);
    uint16x8_t v81 = vmovl_u8(*(uint8x8_t *)v80.i8);
    uint16x8_t v82 = vmovl_high_u8(v80);
    uint8x16_t v83 = (uint8x16_t)veorq_s8(v100.val[1], (int8x16_t)v45);
    _Q23 = vmovl_u8(*(uint8x8_t *)v83.i8);
    _Q22 = vmovl_high_u8(v83);
    __asm
    {
      SHLL2           V24.4S, V22.8H, #0x10
      SHLL2           V25.4S, V23.8H, #0x10
    }

    uint8x16_t v88 = (uint8x16_t)veorq_s8(v100.val[2], (int8x16_t)v45);
    uint16x8_t v89 = vmovl_high_u8(v88);
    uint16x8_t v90 = vmovl_u8(*(uint8x8_t *)v88.i8);
    v100.val[0] = veorq_s8(v100.val[3], (int8x16_t)v45);
    v100.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v100.val[0]);
    v100.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v100.val[1]);
    v100.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v100.val[1].i8);
    v100.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v100.val[0].i8);
    v100.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v100.val[0]);
    v100.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v100.val[0].i8);
    int32x4_t v91 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q23.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v90.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v81.i8), 0x18uLL)),  v100.val[0]);
    int32x4_t v92 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q25, (int8x16_t)vshll_high_n_u16(v90, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v81), 0x18uLL)),  v100.val[3]);
    int32x4_t v93 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v89.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v82.i8), 0x18uLL)),  v100.val[1]);
    int32x4_t v94 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v89, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v82), 0x18uLL)),  v100.val[2]);
    v100.val[0] = veorq_s8( vandq_s8((int8x16_t)v91, (int8x16_t)v44),  (int8x16_t)(*(_OWORD *)v100.val & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    v100.val[3] = veorq_s8( vandq_s8((int8x16_t)v92, (int8x16_t)v44),  (int8x16_t)(*(_OWORD *)&v100.val[3] & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    v100.val[1] = veorq_s8( vandq_s8((int8x16_t)v93, (int8x16_t)v44),  (int8x16_t)(*(_OWORD *)&v100.val[1] & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    v100.val[2] = veorq_s8( vandq_s8((int8x16_t)v94, (int8x16_t)v44),  (int8x16_t)(*(_OWORD *)&v100.val[2] & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    a31 = vaddq_s32(vsubq_s32(v93, vaddq_s32((int32x4_t)v100.val[1], (int32x4_t)v100.val[1])), (int32x4_t)v46);
    a32 = vaddq_s32(vsubq_s32(v94, vaddq_s32((int32x4_t)v100.val[2], (int32x4_t)v100.val[2])), (int32x4_t)v46);
    a29 = vaddq_s32(vsubq_s32(v91, vaddq_s32((int32x4_t)v100.val[0], (int32x4_t)v100.val[0])), (int32x4_t)v46);
    a30 = vaddq_s32(vsubq_s32(v92, vaddq_s32((int32x4_t)v100.val[3], (int32x4_t)v100.val[3])), (int32x4_t)v46);
    uint8x16_t v95 = (_DWORD *)&a29 + v39 + 1485875768;
    int v96 = *(v95 - 8) ^ *(v95 - 3);
    unsigned int v97 = *(v95 - 16) ^ *(v95 - 14) ^ (v96 + v34 - ((2 * v96) & 0xC41E1BF2));
    HIDWORD(v9_Block_object_dispose(va, 8) = v97 ^ v34;
    LODWORD(v9_Block_object_dispose(va, 8) = v97;
    *uint8x16_t v95 = (v98 >> 31) + v34 - ((2 * (v98 >> 31)) & 0xC41E1BF2);
    return ((uint64_t (*)(uint64_t))(*(void *)(v33
                                                        + 8LL
                                                        * (((4 * (v36 != 1485875705)) | (16 * (v36 != 1485875705))) ^ (a5 + v41 + 950)))
                                            - 8LL))(150LL);
  }

  else if (v55 == 1)
  {
    a20 = v51;
    a21 = v52;
    a22 = v54;
    a23 = v53;
    a24 = v42;
    int8x16x4_t v99 = vld4q_s8(v43);
    uint8x16_t v56 = (uint8x16_t)veorq_s8(v99.val[0], (int8x16_t)v45);
    uint16x8_t v57 = vmovl_high_u8(v56);
    int8x16_t v58 = (int8x16_t)vmovl_high_u16(v57);
    uint16x8_t v59 = vmovl_u8(*(uint8x8_t *)v56.i8);
    int8x16_t v60 = (int8x16_t)vmovl_high_u16(v59);
    uint8x16_t v61 = (uint8x16_t)veorq_s8(v99.val[1], (int8x16_t)v45);
    uint16x8_t v62 = vmovl_u8(*(uint8x8_t *)v61.i8);
    uint16x8_t v63 = vmovl_high_u8(v61);
    int8x16_t v64 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v62.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v59.i8));
    int8x16_t v65 = vorrq_s8((int8x16_t)vshll_high_n_u16(v62, 8uLL), v60);
    int8x16_t v66 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v63.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v57.i8));
    int8x16_t v67 = vorrq_s8((int8x16_t)vshll_high_n_u16(v63, 8uLL), v58);
    uint8x16_t v68 = (uint8x16_t)veorq_s8(v99.val[2], (int8x16_t)v45);
    _Q23 = (int8x16_t)vmovl_high_u8(v68);
    _Q22 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v68.i8);
    int8x16_t v71 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL);
    __asm { SHLL2           V22.4S, V22.8H, #0x10 }

    int8x16_t v76 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q23.i8, 0x10uLL);
    __asm { SHLL2           V23.4S, V23.8H, #0x10 }

    v99.val[0] = veorq_s8(v99.val[3], (int8x16_t)v45);
    v99.val[1] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v99.val[0].i8);
    v99.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v99.val[0]);
    int32x4_t v77 = (int32x4_t)vorrq_s8( vorrq_s8(v64, v71),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v99.val[1].i8), 0x18uLL));
    v99.val[1] = vorrq_s8( vorrq_s8(v65, _Q22),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v99.val[1]), 0x18uLL));
    int32x4_t v78 = (int32x4_t)vorrq_s8( vorrq_s8(v66, v76),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v99.val[0].i8), 0x18uLL));
    v99.val[0] = vorrq_s8( vorrq_s8(v67, _Q23),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v99.val[0]), 0x18uLL));
    a31 = vaddq_s32(vsubq_s32(v78, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v78, v78), (int8x16_t)v49)), (int32x4_t)v46);
    a32 = vaddq_s32( vsubq_s32( (int32x4_t)v99.val[0],  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v99.val[0], (int32x4_t)v99.val[0]), (int8x16_t)v49)),  (int32x4_t)v46);
    a29 = vaddq_s32(vsubq_s32(v77, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v77, v77), (int8x16_t)v49)), (int32x4_t)v46);
    a30 = vaddq_s32( vsubq_s32( (int32x4_t)v99.val[1],  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v99.val[1], (int32x4_t)v99.val[1]), (int8x16_t)v49)),  (int32x4_t)v46);
    return ((uint64_t (*)(uint64_t, __n128))(*(void *)(v33
                                                                + 8LL * ((1059 * (a27 + 1 == v36)) ^ v50))
                                                    - 12LL))( 150LL,  v44);
  }

  else
  {
    *(_DWORD *)(v40 - 14_Block_object_dispose(va, 8) = 2 * (v51 ^ v35) + v35 - (v38 & (4 * (v51 ^ v35)));
    *(_DWORD *)(v40 - 144) = 2 * (v52 ^ v35) + v35 - (v38 & (4 * (v52 ^ v35)));
    *(_DWORD *)(v40 - 140) = 2 * (v54 ^ v35) + v35 - (v38 & (4 * (v54 ^ v35)));
    *(_DWORD *)(v40 - 136) = 2 * (v53 ^ v35) + v35 - (v38 & (4 * (v53 ^ v35)));
    return v42(150LL, v44, v45, v46, v47, v48, v49);
  }

uint64_t sub_10003D6C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, unsigned int a16, unsigned int a17)
{
  else {
    BOOL v19 = a14 - 32199846 > a17;
  }
  return (*(uint64_t (**)(void))(v17
                              + 8LL * ((!v19 * (((95 * (v18 ^ (v18 + 1)) - 219) | 0x680) ^ 0x6F1)) ^ (a5 + v18 + 577))))();
}

uint64_t sub_10003D764(uint64_t a1, int a2, uint64_t a3, int a4)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * (((((v4 + 1208417726) | 0x3800325) ^ (v6 - 32))
}

uint64_t sub_10003D7B0( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return ((uint64_t (*)(void))(*(void *)(v15
                                        + 8LL
                                        * ((477
                                          * (a13
                                           + v13
                                           - (unint64_t)(a2
                                                              + (v14 ^ (v16 - 1598))
                                                              + ((v14 - 71884507) & 0x4FCFDFBDu)
                                                              + 1446849464) > 0xF)) ^ v14))
                            - 4LL))();
}

uint64_t sub_10003D814( double a1, double a2, double a3, int8x16_t a4, int8x16_t a5, uint64_t a6, int a7, uint64_t a8, int a9, int a10)
{
  *int v10 = vaddq_s8( vaddq_s8(*(int8x16_t *)(v13 + (a7 + a9)), a5),  vmvnq_s8( vandq_s8( vaddq_s8(*(int8x16_t *)(v13 + (a7 + a9)), *(int8x16_t *)(v13 + (a7 + a9))),  a4)));
  return ((uint64_t (*)(void))(*(void *)(v12 + 8LL * (a10 + v11 + 269)) - 8LL))();
}

uint64_t sub_10003D878@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W3>, int a4@<W4>, uint64_t a5@<X8>)
{
  *(_BYTE *)(v6 + a5) = *(_BYTE *)(v9 + (a2 + a3))
  return ((uint64_t (*)(void))(*(void *)(v8
}

uint64_t sub_10003D8CC( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  BOOL v15 = a2 + 1583058440 < (a13 + 254059018);
  return (*(uint64_t (**)(void))(v13 + 8LL * (int)((v15 * (((v14 + 220361917) & 0xF2DD8B2F) - 214)) ^ v14)))();
}

uint64_t sub_10003D940( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v16 = 628203409 * ((((v15 - 120) | 0x96D41AAA) - ((v15 - 120) & 0x96D41AAA)) ^ 0x145C1699);
  *(void *)(v15 - 120) = a10;
  *(_DWORD *)(v15 - 112) = v16 + v14 + 787;
  *(_DWORD *)(v15 - 10_Block_object_dispose(va, 8) = a13 - v16 + ((v14 - a5 - 185) ^ 0xF7D52AB3);
  uint64_t v17 = sub_1000384D0(v15 - 120);
  uint64_t v18 = *(_DWORD *)(v15 - 152) & 0x3F;
  *(_BYTE *)(v15 - 220 + (v18 ^ 0x14)) = -78;
  return ((uint64_t (*)(uint64_t))(*(void *)(v13
                                                      + 8LL
                                                      * ((38
}

uint64_t sub_10003DA40(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3
                                                               + 8LL
                                                               * (((((v1 == 63) ^ (v2 - 116)) & 1)
                                                                 * ((v2 ^ 0x18) - 1252)) ^ v2))
                                                   - 4LL))( a1,  -560347418LL);
}

uint64_t sub_10003DA78()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (v1 ^ (396 * ((v0 ^ 0x2Bu) > 7))))
                            - ((v1 + 1809836352) & 0xDFA717B7)
                            - ((v1 + 8585172) | 0x4B040124u)
                            + 2534281030LL))();
}

uint64_t sub_10003DADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)(v9 - 220 + v5 + 1) = 0x3232323232323232LL;
  return ((uint64_t (*)(uint64_t))(*(void *)(v8
                                                      + 8LL
                                                      * (int)((((v6 & 0x38) == 8LL)
                                                             * ((v7 - 189157558) & 0xBFBF4FBD ^ 0x756)) ^ (a5 + v7 + 1558)))
                                          - 12LL))(1267140513LL);
}

void sub_10003DB48()
{
}

uint64_t sub_10003DB50@<X0>(int a1@<W1>, int a2@<W3>, int a3@<W8>)
{
  BOOL v10 = v3 < v4;
  *(_BYTE *)(v9 - 220 + (a3 - 98667421)) = *(_BYTE *)(v7 + (a1 + a2))
                                                       + (v8 ^ 0x2F)
                                                       - ((2 * *(_BYTE *)(v7 + (a1 + a2))) & 0x64);
  unsigned int v11 = a1 + 1 + v5;
  int v12 = v10 ^ (v11 < v4);
  BOOL v13 = v11 < v3;
  if (!v12) {
    BOOL v10 = v13;
  }
  return (*(uint64_t (**)(void))(v6 + 8LL * ((52 * v10) ^ v8)))();
}

uint64_t sub_10003DBD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W4>, int a4@<W8>)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v4
                                                                        + 8LL
                                                                        * ((195
                                                                          * (a4 + ((48 * (v5 ^ (v6 + 8))) ^ 0xDE99C766) < 0x38)) ^ (v5 + a3)))
                                                            - 4LL))( a1,  a2,  -560347418LL);
}

uint64_t sub_10003DC1C@<X0>(unsigned int a1@<W8>)
{
  unint64_t v3 = a1 - 1827487934LL + ((v1 + 1804562031) & 0xDFF797B5);
  if (v3 <= 0x38) {
    unint64_t v3 = 56LL;
  }
  return (*(uint64_t (**)(void))(v2 + 8LL
                                   * ((1762 * (v3 - a1 + ((v1 + 1337421373) & 0xFBCF97E7) - 706793099LL > 7)) ^ v1)))();
}

uint64_t sub_10003DC9C@<X0>(uint64_t a1@<X2>, int a2@<W4>, uint64_t a3@<X8>)
{
  *(void *)(v6 - 220 + a3 + a1) = 0x3232323232323232LL;
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((824
                                          * (((v3 - 1963967430) & 0x2988BD7D ^ 0x155LL) == (v4 & 0xFFFFFFFFFFFFFFF8LL))) ^ (a2 + v3 + 1312)))
                            - 12LL))();
}

uint64_t sub_10003DD0C()
{
  return (*(uint64_t (**)(void))(v3 + 8LL * ((221 * (((v0 == v1) ^ (v4 + v2 - 93)) & 1)) ^ v2)))();
}

void sub_10003DD3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  int v7 = *(unsigned __int8 *)(v5 - 124) ^ 0x5F;
  if (v7 == 1)
  {
    unsigned int v14 = *(_DWORD *)(v5 - 156);
    unsigned int v13 = *(_DWORD *)(v5 - 152);
    *(_BYTE *)(v5 - 164) = ((8 * v13) ^ 0xA0) - ((2 * ((8 * v13) ^ 0xA0)) & 0x60) + 50;
    *(_BYTE *)(v5 - 163) = ((v13 >> 5) ^ (a5 + v6 - 95))
                         - 2 * (((v13 >> 5) ^ (a5 + v6 - 95)) & 0x33 ^ ((v13 & 0x20) != 0))
                         + 50;
    char v11 = 100;
    *(_BYTE *)(v5 - 162) = ((v13 >> 13) ^ 0x8F) - ((2 * ((v13 >> 13) ^ 0x8F)) & 0x64) + 50;
    HIDWORD(v15) = v14 ^ 0xA;
    LODWORD(v15) = v13 ^ 0x60000000;
    *(_BYTE *)(v5 - 161) = ((v13 >> 21) ^ 0x39) - ((2 * ((v13 >> 21) ^ 0x39)) & 0x64) + 50;
    *(_BYTE *)(v5 - 160) = (v15 >> 29) - ((2 * (v15 >> 29)) & 0x64) + 50;
    *(_BYTE *)(v5 - 159) = ((v14 >> 5) ^ 0xA) - 2 * (((v14 >> 5) ^ 0xA) & 0x37 ^ (v14 >> 5) & 5) + 50;
    *(_BYTE *)(v5 - 15_Block_object_dispose(va, 8) = ((v14 >> 13) ^ 0xA4) - ((2 * ((v14 >> 13) ^ 0xA4)) & 0x64) + 50;
    char v8 = a5 + v6 + 5;
    unsigned int v12 = (v14 >> 21) ^ 0xFFFFFFBE;
  }

  else
  {
    if (v7 != 2) {
      goto LABEL_6;
    }
    char v8 = -34 * (v6 ^ (v6 - 5));
    unsigned int v9 = *(_DWORD *)(v5 - 156);
    unsigned int v12 = *(_DWORD *)(v5 - 152);
    *(_BYTE *)(v5 - 164) = (v8 ^ (v9 >> 21) ^ 0xE8)
                         - 2 * ((v8 ^ (v9 >> 21) ^ 0xE8) & 0x33 ^ ((v9 & 0x200000) != 0))
                         + 50;
    *(_BYTE *)(v5 - 163) = ((v9 >> 13) ^ 0xA4) - 2 * (((v9 >> 13) ^ 0xA4) & 0x3A ^ (v9 >> 13) & 8) + 50;
    *(_BYTE *)(v5 - 162) = ((v9 >> 5) ^ 0xA) + (~(2 * ((v9 >> 5) ^ 0xA)) | 0x9B) + 51;
    HIDWORD(v10) = v9 ^ 0xA;
    LODWORD(v10) = v12 ^ 0x60000000;
    *(_BYTE *)(v5 - 161) = (v10 >> 29) - ((2 * (v10 >> 29)) & 0x64) + 50;
    *(_BYTE *)(v5 - 160) = ((v12 >> 21) ^ 0x39) - 2 * (((v12 >> 21) ^ 0x39) & 0x36 ^ (v12 >> 21) & 4) + 50;
    *(_BYTE *)(v5 - 159) = ((v12 >> 13) ^ 0x8F) - ((2 * ((v12 >> 13) ^ 0x8F)) & 0x64) + 50;
    *(_BYTE *)(v5 - 15_Block_object_dispose(va, 8) = ((v12 >> 5) ^ 0xF2) - ((2 * ((v12 >> 5) ^ 0xF2)) & 0x64) + 50;
    char v11 = 96;
    LOBYTE(v12) = (8 * v12) ^ 0xA0;
  }

  *(_BYTE *)(v5 - 157) = v12 - (v11 & (2 * v12)) + ((v8 + 105) & 0xE5 ^ 0x97);
LABEL_6:
  JUMPOUT(0x10003CB3CLL);
}

uint64_t sub_10003E158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * (v5 ^ ((8 * (v7 == v6)) | (16 * (v7 == v6)))))
                            + a1
                            - (((v5 - 1645) | 1u)
                             - a5
                             + 16)))();
}

void sub_10003E190()
{
}

uint64_t sub_10003E1A4@<X0>(uint64_t a1@<X1>, int a2@<W4>, uint64_t a3@<X8>)
{
  *(_BYTE *)(v5 - 220 + a3 + a1) = 50;
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1565
}

uint64_t sub_10003E254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v10 = v7 - 1734423542 + ((v5 + 1115685440) | 0x9070300);
  int v11 = *(_DWORD *)(v9 - 220 + (v10 & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a3 + v10) = (HIBYTE(v11) ^ 0x51) - ((2 * (HIBYTE(v11) ^ 0x51)) & 0x64) + 50;
  *(_BYTE *)(a3 + (v7 + v3)) = (BYTE2(v11) ^ 0x3B) - ((2 * (BYTE2(v11) ^ 0x3B)) & 0x64) + 50;
  *(_BYTE *)(a3 + (v7 + v3 + 1)) = (BYTE1(v11) ^ 0xA7) - ((2 * (BYTE1(v11) ^ 0xA7)) & 0x64) + 50;
  *(_BYTE *)(a3 + (v7 + v3 + 2)) = v11 ^ 0x47;
  unsigned int v12 = *(_DWORD *)(v9 - 128) + 364390470;
  BOOL v13 = v12 < v4;
  BOOL v14 = v7 + 267092298 < v12;
  if (v7 + 267092298 < v4 != v13) {
    BOOL v14 = v13;
  }
  return (*(uint64_t (**)(void))(v8 + 8LL * ((v14 * v6) ^ v5)))();
}

void sub_10003E3F4()
{
}

  ;
}

void sub_10003E438(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) + 535753261 * ((2 * (a1 & 0x5E99CC2A) - a1 - 1587137579) ^ 0xAB923DFA);
  uint64_t v2 = *(void *)a1;
  if (*(_DWORD *)(*(void *)a1 - 0xC7F991DE6408E19LL) - 159353952 >= 0) {
    unsigned int v4 = *(_DWORD *)(*(void *)a1 - 0xC7F991DE6408E19LL) - 159353952;
  }
  else {
    unsigned int v4 = 159353952 - *(_DWORD *)(*(void *)a1 - 0xC7F991DE6408E19LL);
  }
  uint64_t v3 = *(void *)(a1 + 16);
  if (*(_DWORD *)(v3 - 0xC7F991DE6408E19LL) - 159353952 >= 0) {
    unsigned int v5 = *(_DWORD *)(v3 - 0xC7F991DE6408E19LL) - 159353952;
  }
  else {
    unsigned int v5 = 159353952 - *(_DWORD *)(v3 - 0xC7F991DE6408E19LL);
  }
  v7[1] = (460628867 * (((v7 | 0xE042447A) - (v7 & 0xE042447A)) ^ 0xACD4C607)) ^ (v1 + 693);
  uint64_t v8 = v2;
  sub_100046940((uint64_t)v7);
  if (v4 >= v5) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = v4;
  }
  __asm { BR              X14 }

uint64_t sub_10003E5CC@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  int v11 = v9 - 27;
  int v12 = (2 * (v9 - 27)) ^ 0x596;
  BOOL v13 = v3 > 0x34F7BADB;
  uint64_t v14 = 4LL * (v6 + v4);
  int v15 = v7
      + 966000769
      + (*(_DWORD *)(*(void *)(v10 - 0xC7F991DE6408E15LL) + v14) ^ (v8 + v12 - 1394))
      + (*(_DWORD *)(*(void *)(a2 - 0xC7F991DE6408E15LL) + v14) ^ v8);
  *(_DWORD *)(*(void *)(a1 - 0xC7F991DE6408E15LL) + v14) = v15 + v8 - (v5 & (2 * v15));
  if (v13 == v6 - 619284429 < -888650460) {
    BOOL v13 = v6 - 619284429 < (int)(v3 + 1258833188);
  }
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((255 * !v13) ^ v11)) - 12LL))();
}

uint64_t sub_10003E6FC()
{
  BOOL v5 = v3 - 2010637295 > 2014963970 || v3 - 2010637295 < v2 - 132519677;
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((212 * v5) ^ v1)) - ((v1 - 152439432) & 0x91605FF) + 230LL))();
}

uint64_t sub_10003E75C@<X0>(uint64_t a1@<X8>)
{
  int v13 = v3 - 1253;
  uint64_t v14 = 4LL * (v9 + v7);
  int v15 = v2 + v10 + (*(_DWORD *)(*(void *)(v12 - 0xC7F991DE6408E15LL) + v14) ^ (v11 + v13 + 93 - 234));
  *(_DWORD *)(*(void *)(a1 - 0xC7F991DE6408E15LL) + v14) = v15 + v11 - (v8 & (2 * v15));
  int v16 = v9 + 1 + v4;
  BOOL v18 = v16 > v5 || v16 < v6;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((233 * v18) ^ (v13 + 1253))) - 4LL))();
}

uint64_t sub_10003E824()
{
  BOOL v5 = v2 + 1086776997 > 817410966 || v2 + 1086776997 < v3 - 1330072681;
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((v5 * ((v1 + 2) ^ 0x66 ^ (5 * (v1 ^ 0x1F1)))) ^ v1)) - 12LL))();
}

uint64_t sub_10003E880@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v13 = 4LL * (v10 + v8);
  int v14 = v3 + v11 + (*(_DWORD *)(*(void *)(a2 - 0xC7F991DE6408E15LL) + v13) ^ v12);
  *(_DWORD *)(*(void *)(a1 - 0xC7F991DE6408E15LL) + v13) = v14 + v12 - ((v14 << ((v7 ^ 6) + 23)) & v9);
  int v15 = v10 + 1 + v4;
  BOOL v17 = v15 > v5 || v15 < v6;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (((2 * v17) | (4 * v17)) ^ v7 ^ 6)) - 12LL))();
}

uint64_t sub_10003E948()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL * ((85 * (v1 == ((v2 + 75) ^ 0x49CCCEB039940553LL))) ^ v2))
                            - (v2 ^ 0x50Au)
                            + 133LL))();
}

void sub_10003E990(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0xC7F991DE6408E19LL) = (((v3 + v2) * (v1 - 1901766679)) ^ 0x2D7FCE79)
                                        - 603996697
                                        + ((2 * (v3 + v2) * (v1 - 1901766679)) & 0x5AFF9CF2);
}

void sub_10003EA70(uint64_t a1)
{
  int v1 = 1178560073 * ((-2 - ((a1 | 0x20C3A6CC) + (~(_DWORD)a1 | 0xDF3C5933))) ^ 0x65A82151);
  __asm { BR              X9 }

uint64_t sub_10003EB24@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((1696 * (v2 != (v1 ^ 0x7D6) + 100575459)) ^ v1)) - 8LL))();
}

uint64_t sub_10003EB78@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((59 * (v1 ^ 0xC3)) ^ 0x36)) - 4LL))();
}

uint64_t sub_10003ECA0@<X0>(int a1@<W5>, int a2@<W6>, uint64_t a3@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a3 + 8LL * (((v4 == ((v5 + 702) ^ a1 ^ (v3 + 731))) * a2) ^ v5)) - 8LL))();
}

uint64_t sub_10003ECCC@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((((v2 + 214) ^ 0x74) * (v1 != 0)) ^ v2)) - 8LL))();
}

uint64_t sub_10003ECF4@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  int v6 = v3 + v2;
  int v7 = (v5 ^ 0x389) + v3;
  *(_DWORD *)(*(void *)(v4 - 0xC7F991DE6408E15LL) + 4LL * v6) = a1;
  *(_DWORD *)(v4 - 0xC7F991DE6408E19LL) = v7;
  int v8 = v7 + v2;
  if (v7 + v2 < 0) {
    int v8 = -v8;
  }
  return ((uint64_t (*)(void))(*(void *)(a2
                                        + 8LL
                                        * (int)(((v5 ^ 0x7D6) + 1808758879) & 0x943083EF ^ (((int)((v8 ^ 0xBDFFAD62)
                                                                                                 + ((v8 << ((((v5 ^ 0xD6) + 95) & 0xEF) + 84)) & 0x7BFF5AC4)
}

uint64_t sub_10003EDF0@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * (((*(_DWORD *)(*v3 + 4LL * v4) == v1) * ((v2 - 15499184) & 0xEC7FFF ^ 0x40E)) ^ v2))
                            - 8LL))();
}

uint64_t sub_10003EE34@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
}

_DWORD *sub_10003EE78(_DWORD *result)
{
  else {
    int v6 = v5;
  }
  *unsigned int v4 = v6;
  char *result = 85258470;
  return result;
}

uint64_t sub_10003EEBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = qword_10007E730 - qword_10007E7A0 - (void)&v8;
  qword_10007E7A0 = 536075833 * v2 + 0x793AB71194CDC804LL;
  qword_10007E730 = 536075833 * (v2 ^ 0x86C548EE6B3237FCLL);
  int v3 = *(_DWORD *)(a2 + 4);
  unsigned __int8 v4 = 57 * ((qword_10007E730 + 57 * v2 + 4) ^ 0xFC);
  int v5 = (char *)*(&off_100079130 + (v4 ^ byte_10006C410[byte_1000683C0[v4] ^ 0x84]) - 54) - 8;
  if (v3 == 1206753086) {
    __asm { BR              X17 }
  }

  if (v3 == 1206753093)
  {
    int v6 = **(unsigned __int8 **)(a2 + 8) - 9;
    __asm { BR              X1 }
  }

  return 4294925278LL;
}

void sub_10003F580(unint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 44) - 1755732067 * (((a1 | 0xCC66703E) - (a1 | 0x33998FC1) + 865701825) ^ 0x12A0CDE5);
  unsigned int v3 = *(_DWORD *)(a1 + 16) + 1755732067 * (((a1 | 0xCC66703E) - (a1 | 0x33998FC1) + 865701825) ^ 0x12A0CDE5);
  unsigned int v4 = 1178560073 * ((1588112264 - (&v37 | 0x5EA8AB88) + (&v37 | 0xA1575477)) ^ 0x1BC32C15);
  int v5 = *(_DWORD *)(a1 + 36);
  unint64_t v21 = 1755732067
      * (((a1 | 0xDEEEE61CC66703ELL) - (a1 | 0xF211119E33998FC1LL) - 0xDEEEE61CC66703FLL) ^ 0xD045495E12A0CDE5LL);
  int v6 = v5 + 1755732067 * (((a1 | 0xCC66703E) - (a1 | 0x33998FC1) + 865701825) ^ 0x12A0CDE5);
  int v39 = v2 - v4 + 1172345356;
  unsigned int v37 = 1076023948 - v4;
  int v27 = &STACK[0x5C6940C6B1BC7306];
  int v38 = &STACK[0x5C6940C6B1BC7306];
  sub_100023C94((uint64_t)&v37);
  int v7 = (void *)a1;
  char v8 = (char *)*(&off_100079130 + (int)(v2 - 37)) - 8;
  int v20 = ((v2 + 177) | 0x4E8) + v6 + 206677213;
  int v19 = 1484105499;
  int v18 = v6 - 857971597;
  int v12 = v6 + 1138537797;
  int v11 = v6 - 770055748;
  int v10 = (char *)&v10 - 250415509;
  int v17 = 143 * (v2 ^ 0x46);
  int v16 = v17 ^ 0x5875A21C;
  int v13 = (v2 - 1913092366) & 0x72077DBF;
  int v15 = v13 ^ 0x52C;
  int v31 = v2 ^ 0x6F;
  int v30 = v2 ^ 0x22;
  uint64_t v14 = v2 ^ 0x22;
  uint64_t v29 = v14;
  unsigned int v28 = v2;
  int32x4_t v24 = vdupq_n_s32(0x620F0DF9u);
  int32x4_t v25 = vdupq_n_s32(0x620F0DFFu);
  int32x4_t v23 = vdupq_n_s32(0xC41E1BF2);
  int v22 = v7;
  uint64_t v26 = *v7;
  unsigned int v9 = v3
     - (((v3 << (((((v2 - 79) | 0xE8) + 48) | 0xE0) ^ 0x52 ^ (((v2 - 79) | 0xE8) + 3) & 0xBF)) + 655359252) & 0x989A21DE)
     - 539684999;
  char v32 = (HIBYTE(v9) ^ 0x4C) - ((v9 >> 23) & 0x64) + 50;
  char v33 = (BYTE2(v9) ^ 0x4D) - ((v9 >> 15) & 0x64) + 50;
  char v34 = (BYTE1(v9) ^ 0x10) - ((2 * (BYTE1(v9) ^ 0x10)) & 0x64) + 50;
  char v35 = (v3
       - ((((_BYTE)v3 << (((((v2 - 79) | 0xE8) + 48) | 0xE0) ^ 0x52 ^ (((v2 - 79) | 0xE8) + 3) & 0xBF)) + 20) & 0xDE)
       + 121) ^ 0xDD;
  __asm { BR              X15 }

uint64_t sub_10003F984@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  *(_BYTE *)(a4 + (v22 + v20 - 921 - 352)) = v21;
  *(_BYTE *)(a4 + (a9 - 1862623871)) = *(_BYTE *)(a6 + 1);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 + 8LL * ((1627 * ((((v20 - 1194) | 1) ^ 0x4Bu) > 2)) ^ (v20 - 921))) - 4LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20);
}

uint64_t sub_100040D24@<X0>(uint64_t a1@<X3>, uint64_t a2@<X5>, int a3@<W8>)
{
  *(_BYTE *)(a1 + (a3 - 1862623870)) = *(_BYTE *)(a2 + (v5 - 1900496073));
}

uint64_t sub_100040D80@<X0>( uint64_t a1@<X3>, uint64_t a2@<X5>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t (*a22)(uint64_t))
{
  int v25 = (v22 - 1690666352) & 0x64C5845F;
  *(_BYTE *)(a1 + (a3 + 2)) = *(_BYTE *)(a2 + (v23 - 1900496151 + v25));
  int v26 = 628203409 * ((-420577316 - ((v24 - 160) | 0xE6EE7FDC) + ((v24 - 160) | 0x19118023)) ^ 0x9B998C10);
  *(_DWORD *)(v24 - 152) = v26 + v25 + 974;
  *(_DWORD *)(v24 - 14_Block_object_dispose(va, 8) = 507371030 - v26;
  *(void *)(v24 - 160) = a21;
  uint64_t v27 = sub_1000384D0(v24 - 160);
  return a22(v27);
}

uint64_t sub_100040E28( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unsigned int a11)
{
  BOOL v14 = a11 < 0x9000B19B;
  return ((uint64_t (*)(void))(*(void *)(v13 + 8LL * ((v14 * (((v12 - 1221) | 0x19) ^ 0x41)) ^ v12)) - 12LL))();
}

uint64_t sub_100040EA8@<X0>( int a1@<W0>, int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, int a6@<W8>)
{
  BOOL v13 = a3 < v9;
  *(_BYTE *)(a4 + (a6 + a2)) = *(_BYTE *)(v12 + (v6 + v8))
  unsigned int v14 = a1 + v6 + 1;
  int v15 = v13 ^ (v14 < v9);
  BOOL v16 = v14 < a3;
  if (!v15) {
    BOOL v13 = v16;
  }
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * ((v13 * v11) ^ v7)) - 12LL))();
}

uint64_t sub_100040F18( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26)
{
  int v29 = 628203409 * ((((v28 - 160) | 0x8BCD2C81) + (~(v28 - 160) | 0x7432D37E)) ^ 0x94520B3);
  *(_DWORD *)(v28 - 152) = v29 + v26 + 962;
  *(_DWORD *)(v28 - 14_Block_object_dispose(va, 8) = a10 - v29;
  *(void *)(v28 - 160) = a26;
  uint64_t v30 = sub_1000384D0(v28 - 160);
  uint64_t v31 = STACK[0x310] & 0x3F ^ ((v26 ^ 0x39Au) - 941);
  *((_BYTE *)&STACK[0x2CC] + v31) = -78;
  return ((uint64_t (*)(uint64_t))(*(void *)(v27 + 8LL * ((968 * (v31 > 0x37)) ^ v26)) - 4LL))(v30);
}

uint64_t sub_100041010()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((((((v1 - 247) ^ (v0 == 63)) & 1) == 0) * (7 * (v1 ^ 0x3CC) - 86)) ^ v1))
                            - 4LL))();
}

uint64_t sub_100041068@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8LL * ((477 * ((a1 ^ 0x2Bu) > 7)) ^ (v1 | 0x10))))();
}

uint64_t sub_1000410A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(a9 + v10) = v13;
  return (*(uint64_t (**)(void))(v12
                              + 8LL
                              * ((409 * ((v11 & 0x38) - (unint64_t)(v9 + 322) == -393LL)) ^ (v9 + 623))))();
}

uint64_t sub_1000410EC(int a1)
{
  *(void *)(v2 + v4) = v6;
  return (*(uint64_t (**)(void))(v5 + 8LL * (((v3 == v4) * a1) ^ v1)))();
}

uint64_t sub_10004110C()
{
  return (*(uint64_t (**)(void))(v3 + 8LL * ((((v1 ^ 0x1DE) + ((v1 - 392) | 0x52) + 673) * (v2 != v0)) ^ v1)))();
}

uint64_t sub_100041154@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  *(_BYTE *)(a1 + a2 + v3) = v6;
  return (*(uint64_t (**)(void))(v7 + 8LL * (((a2 + v3 + (unint64_t)(v2 ^ v5) - 90 > 0x3F) * v4) ^ (v2 + 299))))();
}

void sub_100041188()
{
}

uint64_t sub_1000411B0()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((1556 * (((v2 - 1967077713) & 0x753F3BC7u) + v0 - 250416935 < 0x38)) ^ (v2 + 663)))
                            - 12LL))();
}

uint64_t sub_100041210@<X0>(unsigned int a1@<W8>)
{
  unint64_t v4 = ((v2 + ((a1 - 2076846039) & 0x7BCA27FD) - 669) ^ (a1 - 1511176519) & 0x5A12B6CF) + v1;
  if (v4 <= 0x38) {
    unint64_t v4 = 56LL;
  }
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((2000 * (v4 - v1 + 250416225 > 7)) ^ a1)) - 12LL))();
}

uint64_t sub_100041298( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(a9 + v10) = v13;
  return ((uint64_t (*)(void))(*(void *)(v12
                                        + 8LL
                                        * (int)((14
                                               * ((((((v11 + 1227796478) & 0xB6D14FF7) - 29) ^ (((((v11 + 1227796478) & 0xB6D14FF7)
                                                                                                - 747LL) & v9) == 8)) & 1) == 0)) ^ (v11 + 1227796478) & 0xB6D14FF7))
                            - 8LL))();
}

uint64_t sub_100041304(int a1)
{
  *(void *)(v2 + v5) = v7;
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * ((14 * (a1 & ~(v3 ^ (v4 == v5)))) ^ v1)) - 8LL))();
}

uint64_t sub_100041334()
{
}

uint64_t sub_10004137C@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  *(_BYTE *)(a1 + a2 + v3) = v4;
}

void sub_1000413AC()
{
  int v1 = LOBYTE(STACK[0x32C]) ^ 0x5F;
  if (v1 == 1)
  {
    unsigned int v8 = STACK[0x310];
    unsigned int v9 = STACK[0x30C];
    int v10 = LODWORD(STACK[0x310]) >> 5;
    char v11 = v10 ^ 0xF2;
    char v12 = (v10 ^ 0xF2) & 0x37 ^ v10 & 5;
    char v5 = v0 ^ 0x26;
    char v13 = v11 - 2 * v12;
    int v14 = LODWORD(STACK[0x310]) >> 13;
    LOBYTE(STACK[0x304]) = (v0 ^ 0x26)
                         + ((8 * LOBYTE(STACK[0x310])) ^ 0xA0)
                         - ((2 * ((8 * LOBYTE(STACK[0x310])) ^ 0xA0)) & 0x60)
                         - 55;
    LOBYTE(STACK[0x305]) = v13 + 50;
    LOBYTE(STACK[0x306]) = (v14 ^ 0x8F) + (~(2 * (v14 ^ 0x8F)) | 0x9B) + 51;
    LOBYTE(STACK[0x307]) = ((v8 >> 21) ^ 0x39) - 2 * (((v8 >> 21) ^ 0x39) & 0x36 ^ (v8 >> 21) & 4) + 50;
    HIDWORD(v15) = v9 ^ 0xA;
    LODWORD(v15) = v8 ^ 0x60000000;
    char v6 = 100;
    LOBYTE(STACK[0x308]) = (v15 >> 29) - ((2 * (v15 >> 29)) & 0x64) + 50;
    LOBYTE(STACK[0x309]) = ((v9 >> 5) ^ 0xA) - ((2 * ((v9 >> 5) ^ 0xA)) & 0x64) + 50;
    LOBYTE(STACK[0x30A]) = ((v9 >> 13) ^ 0xA4) - ((2 * ((v9 >> 13) ^ 0xA4)) & 0x64) + 50;
    unsigned int v7 = (v9 >> 21) ^ 0xFFFFFFBE;
  }

  else
  {
    if (v1 != 2) {
      goto LABEL_6;
    }
    unsigned int v2 = STACK[0x30C];
    unsigned int v7 = STACK[0x310];
    int v3 = LODWORD(STACK[0x30C]) >> 13;
    LOBYTE(STACK[0x304]) = ((LODWORD(STACK[0x30C]) >> 21) ^ 0xBE)
                         - 2 * (((LODWORD(STACK[0x30C]) >> 21) ^ 0xBE) & 0x33 ^ ((STACK[0x30C] & 0x200000) != 0))
                         + 50;
    LOBYTE(STACK[0x305]) = (v3 ^ (v0 + 85)) - 2 * ((v3 ^ (v0 + 85)) & 0x33 ^ ((v2 & 0x2000) != 0)) + 50;
    LOBYTE(STACK[0x306]) = ((v2 >> 5) ^ 0xA) - 2 * (((v2 >> 5) ^ 0xA) & 0x37 ^ (v2 >> 5) & 5) + 50;
    HIDWORD(v4) = v2 ^ 0xA;
    LODWORD(v4) = v7 ^ 0x60000000;
    LOBYTE(STACK[0x307]) = (v4 >> 29) - ((2 * (v4 >> 29)) & 0x64) + 50;
    LOBYTE(STACK[0x308]) = ((v7 >> 21) ^ 0x39) - ((2 * ((v7 >> 21) ^ 0x39)) & 0x64) + 50;
    LOBYTE(STACK[0x309]) = ((v7 >> 13) ^ 0x8F) - ((2 * ((v7 >> 13) ^ 0x8F)) & 0x64) + 50;
    LOBYTE(STACK[0x30A]) = ((v7 >> 5) ^ 0xF2) - 2 * (((v7 >> 5) ^ 0xF2) & 0x36 ^ (v7 >> 5) & 4) + 50;
    char v5 = v0 + 26;
    char v6 = 96;
    LOBYTE(v7) = (8 * v7) ^ 0xA0;
  }

  LOBYTE(STACK[0x30B]) = v7 + ((v5 - 10) & 0xEF) - (v6 & (2 * v7)) - 29;
LABEL_6:
  JUMPOUT(0x10003FF28LL);
}

uint64_t sub_100041610( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, int a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36)
{
  if (a31 == 2) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v37
  }
                                                       + 8LL
                                                       * ((961
                                                         * (((LODWORD(STACK[0x328]) == 369984849) ^ (v36 - 34)) & 1)) ^ (v36 + 1245))))( a1,  a11);
  if (a31 == 1) {
    return (*(uint64_t (**)(void))(v37 + 8LL * ((56 * (LODWORD(STACK[0x328]) == v36 + 369984770)) ^ (v36 + 1221))))();
  }
  int v39 = (16 * v36) ^ 0x560;
  unint64_t v40 = ((unint64_t)&a36 ^ 0x3B7E7DF27E694F73LL)
      - 0x18019002680273LL
      + (((void)&a36 << (((16 * v36) ^ 0x60u) + 113)) & 0x76FCFBE4FCD29EE0LL);
  LOBYTE(STACK[0x327]) = ((((v39 - 81) & 0xFE) + 124) ^ v40) * (v40 + 17);
  return ((uint64_t (*)(void))(*(void *)(v37 + 8LL * v39) - 8LL))();
}

void sub_10004194C()
{
}

uint64_t sub_100041954( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, int a36, char a37)
{
  uint64_t v42 = *(void *)(a18 + 24);
  memset((void *)(v40 - 176), 50, 16);
  int v43 = 235795823 * (((v40 - 160) & 0xA61497F7 | ~((v40 - 160) | 0xA61497F7)) ^ 0xCD462151);
  *(_DWORD *)(v40 - 152) = v43 + 1596901039;
  *(void *)(v40 - 160) = v40 - 192;
  *(_DWORD *)(v40 - 124) = (v37 + 1799) ^ v43;
  *(void *)(v40 - 144) = &a37;
  *(void *)(v40 - 136) = v42;
  *(void *)(v40 - 120) = v40 + 0x3EAB24E7EEDAAD1ALL;
  uint64_t v44 = ((uint64_t (*)(uint64_t))(*(void *)(v41 + 8LL * (v37 - 21)) - 4LL))(v40 - 160);
  return ((uint64_t (*)(uint64_t))(*(void *)(v38
                                                      + 8LL
                                                      * ((1117
                                                        * (*(_DWORD *)(v40 - 128) == v39 + ((v37 + 34) | 0x403) - 1123)) ^ v37))
                                          - 4LL))(v44);
}

uint64_t sub_100041A5C()
{
  uint64_t v7 = v0 + 1;
  BOOL v9 = (v6 ^ 0xFD6C6FCF) + ((v4 - 1044) ^ 0x73FFF5B2) + ((2 * v6) & 0xFAD8DF9E) != 1902929356 || v7 == v2 + 16;
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((473 * v9) ^ v4)) - 4LL))();
}

uint64_t sub_100041AE4@<X0>(int a1@<W8>)
{
  unint64_t v4 = 1178560073 * ((v3 - 160 - 2 * ((v3 - 160) & 0xDE8BE26CF99EC706LL) - 0x21741D93066138FALL) ^ 0xC577B284430ABF64LL);
  *(void *)(v3 - 144) = v4 + 1902929356;
  *(_DWORD *)(v3 - 132) = v4;
  *(_DWORD *)(v3 - 12_Block_object_dispose(va, 8) = v4 + a1 + 2104632311;
  *(void *)(v3 - 120) = v1 - v4;
  *(_DWORD *)(v3 - 156) = ((a1 + 1671359681) ^ 0x6B) + v4;
  *(_DWORD *)(v3 - 152) = ((a1 + 1671359681) ^ 0x3E) + v4;
  *(_DWORD *)(v3 - 136) = a1 + 1671359681 + v4;
  uint64_t v5 = ((uint64_t (*)(uint64_t))((char *)*(&off_100079130 + a1 - 8) - 8))(v3 - 160);
  return ((uint64_t (*)(uint64_t))(*(void *)(v2 + 8LL * *(int *)(v3 - 160)) - 4LL))(v5);
}

void sub_100041BB4()
{
  *(_DWORD *)(v0 + 32) = 1645153785;
}

void sub_100041C00(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }

uint64_t sub_100041C60()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((7 * (v1 == 1206753083)) ^ 0x47Au)) - 4LL))();
}

uint64_t sub_100041C94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v4 = v3 + 1013;
  *(_DWORD *)(*(void *)(a1 + 96) + 800LL) = 1612862051;
  *(_DWORD *)(*(void *)(a1 + 96) + 804LL) = 159353952;
  *(void *)(*(void *)(a1 + 96) + 808LL) = *(void *)(a1 + 96) + 816LL;
  uint64_t v5 = *(void *)(a1 + 96) + 0xC7F991DE640913DLL;
  unsigned int v6 = 1178560073
     * (((&v8 ^ 0xF4D518DC | 0xA372392C)
  uint64_t v9 = *(void *)(a2 + 8) + (*(_DWORD *)(a2 + 4) - v4);
  uint64_t v10 = v5;
  unsigned int v12 = v6 + v4 + 306418366;
  unsigned int v8 = v6 + 308;
  ((void (*)(unsigned int *))(*(void *)(a3 + 968) - 12LL))(&v8);
  return (1279786127 * v11 - 1666208810);
}

void sub_100041DF8(_DWORD *a1)
{
  unsigned int v1 = *a1 ^ (235795823 * ((-127693918 - (a1 | 0xF8638BA2) + (a1 | 0x79C745D)) ^ 0x93313D04));
  __asm { BR              X10 }

uint64_t sub_100041EC4(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (((*(_DWORD *)(*(void *)(a1 + 8) + v3) == 45 * (v4 ^ 0x29C) + v1)
                                          * (((v4 ^ 0x29C) + 1940) ^ 0x792)) ^ v4))
                            - 12LL))();
}

uint64_t sub_100041F08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = a1;
  uint64_t v5 = v1;
  unsigned int v6 = v2 + 1374699841 * ((2 * (&v4 & 0x37738180) - &v4 - 930316676) ^ 0xA5786675) + 1072;
  return sub_100016BB0((uint64_t)&v4);
}

void sub_100042088(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 1224239923 * ((a1 & 0x9A8552A9 | ~(a1 | 0x9A8552A9)) ^ 0x97C95081);
  __asm { BR              X9 }

void sub_10004215C()
{
  _DWORD *v0 = -1645193696;
}

uint64_t sub_10004274C(_DWORD *a1)
{
  unsigned int v1 = 1178560073 * ((2 * (a1 & 0x7B1A53C3) - (_DWORD)a1 - 2065322948) ^ 0x3E71D45E);
  unsigned int v2 = a1[1] + v1;
  return ((uint64_t (*)(void))(*((void *)*(&off_100079130 + (int)(v2 ^ 0x753))
                              + (int)(((((*a1 - v1) ^ 0x620F0DF9) - 1 < 0x63) * (v2 - 1751 + (v2 ^ 0x7DB) - 322)) ^ v2)
                              - 1)
                            - 12LL))();
}

uint64_t sub_1000427E8@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(*(void *)(result + 8) - 0x67843F9A1244BACBLL) = (a2 ^ 0x9DF0F206)
                                                              - ((v2 - 1004659888) & (2 * (a2 ^ 0x9DF0F206) - 85198))
                                                              + 1645111186;
  return result;
}

uint64_t sub_100042888(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))((char *)*(&off_100074B48 + ((109 * (*(_DWORD *)(a2 + 4) != 1206753084)) ^ 0x3A7u) - 1) - 8))();
}

uint64_t sub_1000428C8()
{
  return 4294925278LL;
}

uint64_t sub_1000428D0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = **(_BYTE **)(a2 + 8) != 0;
  *(_BYTE *)(a1 + 8_Block_object_dispose(va, 8) = (v2 ^ 0x2F) + 2 * v2;
  return 0LL;
}

void sub_100042908(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 - 108757529 * ((-2 - ((a1 | 0x1E625E8E) + (~(_DWORD)a1 | 0xE19DA171))) ^ 0x101C35A);
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0xC7F991DE6408E19LL);
  uint64_t v5 = *(void *)(a1 + 8);
  unsigned int v4 = (460628867 * ((((v3 | 0xC87E0ECA) ^ 0xFFFFFFFE) - (~v3 | 0x3781F135)) ^ 0x7B177348)) ^ (v1 - 113);
  sub_100046940((uint64_t)v3);
  __asm { BR              X9 }

uint64_t sub_100042A48@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * ((((131 * ((v1 - 877) ^ 0x182)) ^ 0x191) * (((v3 ^ v2) & 0x1F) == 0xF)) ^ v1))
                            - 4LL))();
}

uint64_t sub_100042AB8@<X0>(uint64_t a1@<X8>)
{
  int v4 = ((v2 + 892) ^ 0xB0240DD2) + (v3 ^ 0xCFFFFFD5) + 2145122043 + (v1 & 0x9FFFFFAA) < 0x7FFFFFFF;
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
}

uint64_t sub_100042B3C@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * ((511 * (v1 + 287788292 < ((v2 - 2113754378) & 0x7DFD53BFu) + 2147482700)) ^ v2))
                            - 4LL))();
}

uint64_t sub_100042B9C@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v5 - 0xC7F991DE6408E15LL) + 4LL * (v1 + v2 + 1)) = -1075083249;
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
}

uint64_t sub_100042BFC@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(_DWORD *)(*v6 + 4LL * (a2 + v3 + 1)) = v5;
}

void sub_100042C38()
{
  int v5 = 963203894 - v0;
  if (*v4 + 1988129696 >= ((v3 - 390) ^ 0x3B3)) {
    int v6 = v5;
  }
  else {
    int v6 = v1;
  }
  *v4 += v2 + v6 + 2;
}

void sub_100042F84(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }

uint64_t sub_100042FEC()
{
  return 4294925278LL;
}

void sub_100043174(uint64_t a1)
{
  BOOL v4 = *(void *)(a1 + 40) != 0x27681A84B35EB105LL
    && *(void *)(a1 + 16) != 0x3EEC7284B8A20CABLL
    && *(void *)a1 != 0x66706D739F962A92LL;
  int v1 = *(_DWORD *)(a1 + 8) + 535753261 * ((((2 * a1) | 0xD63BF148) - a1 - 1797126308) ^ 0x61E9F68B);
  __asm { BR              X9 }

uint64_t sub_100043288( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 + 8LL * ((1069 * (*(_DWORD *)(a18 - 0x27681A84B35EB0EDLL) == 1645153785)) ^ v19)) - (((v19 - 564) | 0x51Cu) ^ 0x516LL)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8);
}

uint64_t sub_1000432E8( __n128 a1, __n128 a2, __n128 a3, __n128 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22)
{
  v24.n128_u64[0] = 0x6464646464646464LL;
  v24.n128_u64[1] = 0x6464646464646464LL;
  v25.n128_u64[0] = 0x3232323232323232LL;
  v25.n128_u64[1] = 0x3232323232323232LL;
  unsigned int v26 = *(_DWORD *)(a22 - 0x27681A84B35EB0F5LL) - 1184605341;
  BOOL v27 = v26 < 0xCBE984DD;
  if (v26 >= 0xCBE984DD) {
    BOOL v27 = v26 > 0xCBE984DD;
  }
  return ((uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128))(*(void *)(v23
                                                                                             + 8LL
                                                                                             * ((v27
                                                                                               * ((149 * (v22 ^ 0x512)
                                                                                                 - 1222) ^ 0x3FC)) ^ (149 * (v22 ^ 0x512))))
                                                                                 - ((5 * ((149 * (v22 ^ 0x512)) ^ 0x691u)) ^ 0x22DLL)))( a1,  a2,  a3,  a4,  v24,  v25);
}

uint64_t sub_100043530( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, int a26, unsigned int a27)
{
}

uint64_t sub_100044250( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17)
{
  *(_BYTE *)(*v19 + (v17 + a8)) = -78;
  unsigned int v21 = (((v18 - 888) | 0x20) ^ 0x2FE47CEB) + v17;
  int v22 = ((a17 - 504887143) < 0x50E7ACE1) ^ (v21 < 0x50E7ACE1);
  BOOL v23 = v21 < a17 - 504887143;
  if (v22) {
    BOOL v24 = (a17 - 504887143) < 0x50E7ACE1;
  }
  else {
    BOOL v24 = v23;
  }
  return (*(uint64_t (**)(void))(v20 + 8LL * ((23 * v24) ^ v18)))();
}

uint64_t sub_1000442C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  BOOL v16 = v12 < v8;
  *(_BYTE *)(*v14 + (v9 + 1 + a8)) = 50;
  unsigned int v17 = v10 + v9 + 499;
  int v18 = v16 ^ (v17 < v8 + v11 - 1422);
  BOOL v19 = v17 < v12;
  if (!v18) {
    BOOL v16 = v19;
  }
  return (*(uint64_t (**)(void))(v15 + 8LL * ((v16 * v13) ^ v11)))();
}

void sub_100044320(int a1@<W8>)
{
  *(void *)(v3 - 0x3EEC7284B8A20CABLL) = *v1;
  *(_DWORD *)(v4 - 0x66706D739F962A92LL) = a1;
  *int v1 = 0LL;
  *(void *)(v7 - 0x27681A84B35EB0FDLL) = 0x23F5AF4C23F5AF4CLL;
  _DWORD *v2 = 310716794;
  *(_DWORD *)(v7 - 0x27681A84B35EB0F1LL) = ((*(_DWORD *)(v7 - 0x27681A84B35EB0F1LL) & 0xFFFFFFFE ^ 0x42D83F58 | 0x95997BD8)
                                          - (*(_DWORD *)(v7 - 0x27681A84B35EB0F1LL) & 0xFFFFFFFE ^ 0x42D83F58 | 0x6A668427)
                                          + 1785103399) ^ 0xD7414481;
  *(_DWORD *)(v6 + 2_Block_object_dispose(va, 8) = *v5;
}

void jfkdDAjba3jd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, _DWORD *a6)
{
  *a5 = 0LL;
  *a6 = 0;
  v6[1] = 108757529
  sub_10005A350(v6);
  __asm { BR              X8 }

uint64_t sub_100044514( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t *a15, int a16, unsigned int a17)
{
  a15 = &STACK[0x4BD26FD1213425B9];
  a17 = 1307 - 460628867 * ((&a15 & 0xA1039BA5 | ~(&a15 | 0xA1039BA5)) ^ 0x126AE627);
  sub_100035EF0((uint64_t)&a15);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 + 8LL * ((16 * (a16 == 1645153785)) | v17)) - 12LL))( v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26);
}

uint64_t sub_1000445B4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16, uint64_t a17, unsigned int a18, uint64_t a19)
{
  unsigned int v26 = 1178560073 * ((&a15 & 0x443E359C | ~(&a15 | 0x443E359C)) ^ 0x155B201);
  a17 = a12;
  a18 = v26 ^ 0x3E8;
  a16 = (v22 ^ 0xF3FDF27D) + ((2 * v22) & 0xE7FBE4FA) + 1551851452 + v26;
  sub_100045F9C((uint64_t)&a15);
  unsigned int v27 = 1178560073 * (((&a15 | 0xFEB9F472) - (&a15 & 0xFEB9F472)) ^ 0x442D8C10);
  a17 = a12;
  a18 = v27 ^ 0x3E8;
  a16 = ((2 * v21) & 0xECFABD76) + 1098 + (v21 ^ 0xF67D5EBB) + 1509945140 + v27;
  sub_100045F9C((uint64_t)&a15);
  unsigned int v28 = 1178560073 * ((1638435589 - (&a15 | 0x61A88B05) + (&a15 | 0x9E5774FA)) ^ 0x24C30C98);
  a18 = v28 ^ ((v20 ^ 0x4BF17F7E) - 1081107028 + ((2 * v20) & 0x97E2FEFC));
  a19 = v19;
  a17 = a12;
  a16 = v28 + 1289;
  sub_100037BB0((uint64_t)&a15);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 + 8LL * ((750 * (a15 == 1645153785)) ^ 0x451u)) - 12LL))( v29,  v30,  v31,  v32,  v33,  v34,  v35,  v36,  v25,  v23);
}

uint64_t sub_1000447AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t *a15, uint64_t a16, unsigned int a17, unsigned int a18, unsigned int a19, int a20)
{
  unsigned int v22 = 460628867 * ((&a15 & 0x289C561E | ~(&a15 | 0x289C561E)) ^ 0x9BF52B9C);
  a19 = 635686783 - v22;
  a17 = v22 + 1697367587;
  a18 = v22 + v20 + 2138962262;
  a15 = &STACK[0x58A7AA08624568F6];
  a16 = a12;
  uint64_t v23 = sub_10005A720((uint64_t)&a15);
  return ((uint64_t (*)(uint64_t))(*(void *)(v21
                                                      + 8LL
                                                      * ((27
}

uint64_t sub_10004489C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t *a11, uint64_t a12, uint64_t a13, uint64_t a14, unsigned int a15, unint64_t *a16, unint64_t *a17, unint64_t *a18, unsigned int a19)
{
  int v22 = v19 & 0x70D0B2DF;
  a16 = a11;
  a17 = &STACK[0x72E1645BEBB64033];
  a19 = (v22 + 211) ^ (1225351577 * (&a15 ^ 0x239AD816));
  a18 = &STACK[0x1E6EF7153090DEA];
  ((void (*)(unsigned int *))(*(void *)(v20 + 8LL * (v22 - 78)) - 8LL))(&a15);
  a16 = &STACK[0x384B062F07609564];
  a17 = a11;
  a15 = (v22 + 202) ^ (1374699841 * (&a15 ^ 0x6DF41809));
  ((void (*)(unsigned int *))(*(void *)(v20 + 8LL * (v22 ^ 0x3Au)) - 8LL))(&a15);
  a16 = a11;
  a15 = (v22 + 703) ^ (1755732067
                     * ((2 * (&a15 & 0x22973738) - &a15 + 1567148230) ^ 0x83AE751D));
  uint64_t v23 = sub_1000565D0((uint64_t)&a15);
  return (*(uint64_t (**)(uint64_t))(v21
                                            + 8LL
                                            * ((((_DWORD)a17 == 1645153785) * (((v22 - 677531922) & 0x286254D3) + 369)) ^ v22)))(v23);
}

uint64_t sub_100044A10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  return (*(uint64_t (**)(void))(v15 + 8LL * ((910 * (a14 == ((221 * (v14 ^ 0x8A)) ^ 0x620F09A8))) ^ v14)))();
}

uint64_t sub_100044A50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  return (*(uint64_t (**)(void))(v14
                              + 8LL
                              * ((691 * (a13 != ((((v13 + 756930384) & 0xD2E22C71) + 1645152037) ^ (v13 + 1536)))) ^ v13)))();
}

uint64_t sub_100044AA8@<X0>(int a1@<W8>)
{
  BOOL v4 = (*(uint64_t (**)(void))(v2 + 8LL * (v1 - 1453)))(a1 ^ 0x620F0DF9u) == 0;
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((v4 * ((v1 - 1207) ^ 0x5C7 ^ (5 * (v1 ^ 0x652)))) ^ v1)) - 8LL))();
}

uint64_t sub_100044B00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  unsigned int v15 = (a13 ^ 0x620F0DF9) + ((v13 + 494461987) & 0xE2871B56 ^ 0x76D504A8) - ((2 * (a13 ^ 0x620F0DF9)) & 0xEDAA0BF4);
  return ((uint64_t (*)(void))(*(void *)(v14
                                        + 8LL
                                        * ((1615
                                          * (((2 * v15) & 0xDFDBFDDA ^ 0xCD8A09D0)
                                           + ((v13 - 329) ^ 0x1938FB98 ^ v15)
                                           - 1610946564 != 266921705)) ^ v13))
                            - 12LL))();
}

uint64_t sub_100044BAC()
{
  return (*(uint64_t (**)(void))(v3 + 8LL * ((((v1 + v0 + v2 - 1877868607) > 7) * (v2 - 334)) | v2)))();
}

uint64_t sub_100044BF8(uint64_t a1)
{
  unsigned int v4 = v2 + 761;
  BOOL v5 = v1 - a1 < (v4 ^ 0x46BuLL);
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (int)((v5 | (16 * v5)) ^ v4)) - 12LL))();
}

uint64_t sub_100044C38(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return ((uint64_t (*)(uint64_t, void))(*(void *)(v6
                                                              + 8LL
                                                              * (((((v4 < 0x20) ^ (a4 - v5 - 99)) & 1)
                                                                * (a4 - 812)) ^ a4))
                                                  - 4LL))( a1,  (a4 - 146));
}

uint64_t sub_100044C78(uint64_t a1)
{
  unsigned int v10 = v4 + v5 + v6;
  uint64_t v11 = v1 + v10;
  __int128 v12 = *(_OWORD *)(v11 - 31);
  uint64_t v13 = a1 + v10;
  *(_OWORD *)(v13 - 15) = *(_OWORD *)(v11 - 15);
  *(_OWORD *)(v13 - 31) = v12;
  return ((uint64_t (*)(void))(*(void *)(v9
                                        + 8LL
                                        * ((((v2 & 0xFFFFFFE0) == 32) * ((38 * (v7 ^ (v3 + 1095))) ^ 0x44D)) ^ (v8 + v7 + 734)))
                            - 8LL))();
}

void sub_100044CE0()
{
}

uint64_t sub_100044CEC(uint64_t a1)
{
  void *v7 = a1;
  _DWORD *v8 = v2;
  int v5 = (v1 ^ 0x4DE) - 426;
  uint64_t v13 = v9;
  unsigned int v12 = (v1 ^ 0x4DE) + (v11 ^ 0xAF40E2F) * v4 - 76;
  v3(v11);
  uint64_t v13 = v10;
  unsigned int v12 = v5 + ((((2 * v11) | 0xC2DB3190) - v11 + 512911160) ^ 0xEB9996E7) * v4 + 350;
  v3(v11);
  return 0LL;
}

void sub_100044F7C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32) - 1224239923 * ((-2 - ((a1 | 0xAACC30C4) + (~(_DWORD)a1 | 0x5533CF3B))) ^ 0xA78032EC);
  __asm { BR              X14 }

void sub_100045094(uint64_t a1@<X8>)
{
  *(_DWORD *)(v1 + a1) = 159353952;
}

void sub_100045F9C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (1178560073 * ((2 * (a1 & 0x878F6F35) - a1 + 2020643018) ^ 0xC2E4E8A8));
  __asm { BR              X10 }

uint64_t sub_100046074@<X0>( uint64_t a1@<X8>, uint64_t a2, unsigned int a3, int a4, unint64_t *a5, uint64_t a6, unsigned int a7)
{
  unsigned int v10 = 3804331 * (((&a3 | 0x81ADAAE9) + (~&a3 | 0x7E525516)) ^ 0xFF788F1E);
  a5 = &STACK[0x58C2F3F47EC954F5];
  a6 = v8;
  a7 = v10 + 910892480;
  a3 = v10 + 1116194074;
  a4 = v10 + v7 - 480;
  uint64_t v11 = ((uint64_t (*)(unsigned int *))(*(void *)(a1 + 8LL * (v7 - 818)) - 12LL))(&a3);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8LL
                                            * ((1204 * (*(_DWORD *)(v8 - 0x27681A84B35EB0EDLL) == 1645153785)) ^ v7)))(v11);
}

void sub_100046140(_DWORD *a1@<X8>)
{
  unsigned int v3 = v1[1] - v2 - ((2 * (v1[1] - v2) + 1594186638) & 0x989A21DE) - 70271306;
  *int v4 = (HIBYTE(v3) ^ 0x4C) - ((v3 >> 23) & 0x64) + 50;
  v4[1] = (BYTE2(v3) ^ 0x4D) - ((v3 >> 15) & 0x64) + 50;
  v4[2] = (BYTE1(v3) ^ 0x10) - ((2 * (BYTE1(v3) ^ 0x10)) & 0x64) + 50;
  v4[3] = v3 ^ 0xDD;
  *int v1 = *a1;
}

void sub_100046204(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_100046248()
{
  return 4294925273LL;
}

void zxcm2Qme0x(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X8 }

uint64_t sub_10004633C(uint64_t a1, int a2)
{
  if (a1) {
    BOOL v3 = a2 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  int v4 = v3;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((7 * v4) ^ 0x2D2u)) - 4LL))();
}

uint64_t sub_100046388( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  a14 = v15
  uint64_t v16 = sub_10005A350(&a13);
  return ((uint64_t (*)(uint64_t))(*(void *)(v14
                                                      + 8LL
                                                      * ((1788 * (a13 == ((239 * (v15 ^ 0x2D6)) ^ 0x620F0F34))) ^ v15))
                                          - ((v15 - 1689052227) ^ 0x9B531E96LL)))(v16);
}

uint64_t sub_100046458( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, unsigned int a15)
{
  a15 = v16 - 460628867 * (((&a13 | 0x8BDC4BD5) + (~&a13 | 0x7423B42A)) ^ 0xC74AC9A9) + 590;
  a13 = &STACK[0x4BD26FD1213425B9];
  sub_100035EF0((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 + 8LL * (int)(((a14 != v15) * ((v16 - 76030703) ^ 0xFB77DFC6)) ^ v16))
                                                                                       - ((v16 - 76030703) & 0x9FDB3EB3 ^ 0x9B531E96LL)))( v18,  v19,  v20,  v21,  v22,  v23);
}

uint64_t sub_100046510( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, uint64_t a15, unsigned int a16, uint64_t a17)
{
  unsigned int v23 = 1178560073 * (&a13 ^ 0xBA947862);
  a17 = v17;
  a14 = v23 + v22 - 128;
  a16 = (((v22 + 1974771810) & 0x8A4B5F9E ^ 0x1FF95825)
       + ((2 * v18) & 0xD70F7EF6)
       + (v18 ^ 0xEB87BDAE ^ ((v22 - 884) | 0xC0))) ^ v23;
  a15 = a12;
  uint64_t v24 = ((uint64_t (*)(int *))(*(void *)(v20 + 8LL * (v22 ^ 0x509)) - 8LL))(&a13);
  return ((uint64_t (*)(uint64_t))(*(void *)(v21 + 8LL * (((a13 != v19) | (2 * (a13 != v19))) ^ v22)) - 12LL))(v24);
}

uint64_t sub_1000465F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, uint64_t a14, int a15, int a16, int a17, int a18)
{
  int v21 = 460628867 * ((&a13 - 1886733488 - 2 * ((unint64_t)&a13 & 0x8F8ABB50)) ^ 0xC31C392D);
  a13 = &STACK[0x58A7AA08624568EE];
  a14 = a12;
  a15 = v21 - 1370370129;
  a16 = v21 + 2138961942 + v20;
  a17 = 635686783 - v21;
  uint64_t v22 = sub_10005A720((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t))(*(void *)(v19
                                                      + 8LL
                                                      * (((a18 == ((v20 - 693) ^ (v18 + 307)))
                                                        * (((v20 - 1146) | 0x4A0) - 748)) ^ v20))
                                          - 12LL))(v22);
}

uint64_t sub_1000466BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, unsigned int a14, unint64_t *a15, uint64_t a16)
{
  a14 = (v16 - 1111) ^ (1374699841
                      * ((((&a14 | 0x21ACE69C) ^ 0xFFFFFFFE) - (~&a14 | 0xDE531963)) ^ 0xB3A7016A));
  a15 = &STACK[0x384B062F07609554];
  a16 = a10;
  uint64_t v19 = ((uint64_t (*)(unsigned int *))(*(void *)(v17 + 8LL * (v16 - 1275)) - 8LL))(&a14);
  return (*(uint64_t (**)(uint64_t))(v18
                                            + 8LL
                                            * ((121 * (a12 == ((v16 - 1710155678) | 0x1420080) - 960762009)) ^ v16)))(v19);
}

uint64_t sub_10004677C()
{
  unsigned int v14 = 1689051594
      - 108757529 * ((2 * (&v9 & 0x4A6220) - &v9 + 2142608861) ^ 0x9F29FFF6)
      + v3
      + 93;
  uint64_t v11 = v0;
  uint64_t v12 = v6;
  uint64_t v13 = 0x3B4E8EE293AAEC8ALL;
  (*(void (**)(unsigned int *))(v4 + 8LL * (v3 + 1689051594)))(&v9);
  unsigned int v9 = (v3 + 1689052348) ^ (1755732067
                          * (((&v9 | 0x7744F355) - (&v9 & 0x7744F355)) ^ 0xA9824E8E));
  uint64_t v11 = v6;
  sub_1000565D0((uint64_t)&v9);
  unsigned int v10 = v3
      + 1689051594
  uint64_t v11 = v6;
  v1(&v9);
  uint64_t v11 = v8;
  unsigned int v10 = v3
      + 1689052227
  v1(&v9);
  return v7 ^ v2;
}

void sub_100046940(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4) ^ (460628867 * (((a1 | 0x4A5B5FFB) - (a1 & 0x4A5B5FFB)) ^ 0x6CDDD86));
  uint64_t v3 = *(void *)(a1 + 8);
  v2[0] = v1 + 628203409 * (((v2 | 0xF7CBF79) + (~v2 | 0xF0834086)) ^ 0x8DF4B34B) - 617;
  sub_100027AB0((uint64_t)v2);
  __asm { BR              X8 }

void sub_100046A3C()
{
  else {
    int v3 = v1 + 2;
  }
  _DWORD *v0 = v3;
}

void sub_100046AA8(_DWORD *a1)
{
  unsigned int v1 = *a1 + 1755732067 * (((a1 | 0xFD508F6) - (_DWORD)a1 + (a1 & 0xF02AF709)) ^ 0xD113B52D);
  __asm { BR              X14 }

uint64_t sub_100046BC8()
{
  int v4 = v0 + 295202885 < (int)((v1 ^ 0x1B17FF6C) + v3);
  if (v3 > 0x64E8035A != v0 + 295202885 < -1692926811) {
    int v4 = v3 > 0x64E8035A;
  }
  return ((uint64_t (*)(uint64_t))(*(void *)(v2 + 8LL * ((v4 << 9) | (v4 << 10) | v1 ^ 0x2EC)) - 12LL))(0x5795C76E21738119LL);
}

uint64_t sub_100046D00@<X0>( uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, int a4@<W3>, void *a5@<X6>, unsigned int a6@<W7>, int a7@<W8>)
{
  unint64_t v17 = a1 + a3 + (*(_DWORD *)(v7 + 4 * v12) ^ v9) + a6 * (unint64_t)(*(_DWORD *)(*a5 + 4LL * a2) ^ v9);
  *(_DWORD *)(v7 + 4 * v12) = v17
                            + (((((v11 - 1990494502) & 0x76A48BC9) - 708) | 0x20) ^ (v9 + 283))
                            - (((_DWORD)v17 << (((v11 - 38) & 0xC9 ^ v13) - 69)) & 0x7FD7101E);
  BOOL v19 = a2 - 1793570764 < a7 && a2 - 1793570764 >= a4;
  return ((uint64_t (*)(unint64_t))(*(void *)(v8
                                                               + 8LL * ((v11 - 1990494502) & 0x76A48BC9 ^ (v19 * v10)))
                                                   - 4LL))((v14 ^ HIDWORD(v17)) + (v15 & (v17 >> 31)) + v16);
}

uint64_t sub_100046DC0(uint64_t a1)
{
}

uint64_t sub_100046E24@<X0>(int a1@<W8>)
{
  int v4 = a1 - 1211;
  BOOL v5 = v1 + 77641432 < (int)(v3 + 236995384);
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1310 * v5) ^ v4)) - 4LL))();
}

uint64_t sub_100046F1C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X8>)
{
  unint64_t v14 = a1 - 0x5795C76E21738119LL + (*(_DWORD *)(v2 + 4 * v4) ^ v5);
  *(_DWORD *)(v2 + 4 * v4) = v14 + v5 - ((2 * v14) & 0x7FD7101E);
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * (((((v8 + 88 + v6) & v7 ^ a2 ^ (v14 >> (((v8 + 88) ^ v9)
                                                                                * v10
                                                                                - 86)))
                                           + v12
                                           + (v11 & (2 * (v14 >> (((v8 + 88) ^ v9) * v10 - 86)))) != 0x5795C76E21738119LL)
                                          * v13) ^ (v8 + 88)))
                            - 8LL))();
}

uint64_t sub_100046FC4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10)
{
  int v13 = *a10 - 176105989;
  BOOL v14 = v10 - 176105989 < v12 + 2130730981;
  int v15 = v14 ^ (v13 < ((v12 - 630) | 0x146) + 2130731285);
  BOOL v16 = v10 - 176105989 > v13;
  if (!v15) {
    BOOL v14 = v16;
  }
  return ((uint64_t (*)(void))(*(void *)(v11 + 8LL * ((1483 * v14) ^ v12)) - 8LL))();
}

void sub_100047038()
{
  *int v1 = v0;
}

uint64_t sub_10004705C(uint64_t a1)
{
  int v1 = 1374699841 * ((((2 * a1) | 0x4FD35BAC) - a1 + 1477857834) ^ 0xCA1DB5DF);
  int v2 = *(_DWORD *)a1 ^ v1;
  int v3 = *(_DWORD *)(a1 + 16) + v1;
  if (v3 < 0) {
    int v3 = -v3;
  }
  int v4 = *(_DWORD *)(*(void *)(a1 + 8) - 0xC7F991DE6408E19LL);
  unsigned int v6 = v4 - 159353952;
  BOOL v5 = v4 - 159353952 < 0;
  unsigned int v7 = 159353952 - v4;
  if (!v5) {
    unsigned int v7 = v6;
  }
  return (*((uint64_t (**)(void))*(&off_100079130 + v2 - 1300) + ((573 * (v3 >> 5 < v7)) ^ v2) - 1))();
}

uint64_t sub_10004710C@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  unsigned int v4 = ((*(_DWORD *)(*(void *)(v2 - 0xC7F991DE6408E15LL) + 4LL * v3) ^ 0xBFEB880F) >> a2) ^ 0xE0F36651;
  *(_DWORD *)(result + 4) = v4 & 0xC4EA2BA4 ^ 0x3264FBF1 ^ ((v4 & 0xC4822281 | 0x12788964)
                                                          - (v4 & 0x680924 | 0xED87769B)
                                                          - 309889381);
  return result;
}

uint64_t sub_10004718C(uint64_t result)
{
  *(_DWORD *)(result + 4) = 538735252;
  return result;
}

void sub_10004719C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24) - 1225351577 * ((-2 - ((a1 | 0x64CFEAB8) + (~(_DWORD)a1 | 0x9B301547))) ^ 0xB8AACD51);
  __asm { BR              X13 }

uint64_t sub_100047314@<X0>( uint64_t *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, char a31, uint64_t a32, char a33, uint64_t a34, char a35, uint64_t a36, char a37, uint64_t a38, char a39)
{
  __n128 v46 = &a39 + v39;
  int8x16_t v65 = &a29 + v39;
  int8x16_t v64 = &a31 + v39;
  uint16x8_t v63 = &a35 + v39;
  uint16x8_t v62 = &a37 + v39;
  uint8x16_t v61 = &a33 + v39;
  uint64_t v59 = v40;
  int8x16_t v60 = &a25 + v39;
  int8x16_t v66 = &a23 + v39;
  uint64_t v47 = *a1;
  uint64_t v48 = a1[5];
  uint64_t v68 = a1[4];
  LODWORD(a13) = v42 + 380;
  *(void *)(v45 - 104) = *(void *)(*a1 - 0x7542B2AE577378FLL);
  *(void *)(v45 - 12_Block_object_dispose(va, 8) = &a39 + v39;
  *(void *)(v45 - 120) = v48;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923 * (((v45 - 144) & 0x3BB37F04 | ~((v45 - 144) | 0x3BB37F04)) ^ 0x36FF7D2C);
  *(void *)(v45 - 144) = v47;
  *(void *)(v45 - 136) = a3;
  int8x16_t v67 = *(void (**)(uint64_t))(a2 + 8LL * ((int)v42 - 1378));
  uint64_t v69 = v41;
  v67(v45 - 144);
  *(void *)(v45 - 136) = v48;
  *(void *)(v45 - 12_Block_object_dispose(va, 8) = v66;
  *(_DWORD *)(v45 - 144) = (v42 - 453) ^ (((2 * ((v45 - 144) & 0x7323D130) - (v45 - 144) + 215756489) ^ 0x2F46F6DF) * v43);
  *(void *)(v45 - 120) = v46;
  *(void *)(v45 - 112) = v47;
  ((void (*)(uint64_t))((char *)*(&off_100079130 + (int)v42 - 1504) - 4))(v45 - 144);
  *(void *)(v45 - 104) = v46;
  *(_DWORD *)(v45 - 112) = v42 + 380 + 1224239923 * ((v45 + 460286470 - 2 * ((v45 - 144) & 0x1B6F6A96)) ^ 0xE9DC9741);
  *(void *)(v45 - 144) = v47;
  *(void *)(v45 - 136) = v66;
  *(void *)(v45 - 12_Block_object_dispose(va, 8) = v65;
  *(void *)(v45 - 120) = v48;
  v67(v45 - 144);
  *(void *)(v45 - 104) = v65;
  *(void *)(v45 - 144) = v47;
  *(void *)(v45 - 136) = v66;
  *(void *)(v45 - 12_Block_object_dispose(va, 8) = v64;
  *(void *)(v45 - 120) = v48;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923 * (((v45 - 144) & 0xFA6987D9 | ~((v45 - 144) | 0xFA6987D9)) ^ 0xF72585F1);
  v67(v45 - 144);
  *(void *)(v45 - 104) = v64;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923
                         * ((((v45 - 144) | 0x89678349) - (v45 - 144) + ((v45 - 144) & 0x76987CB0)) ^ 0x7BD47E9E);
  *(void *)(v45 - 144) = v47;
  *(void *)(v45 - 136) = v66;
  *(void *)(v45 - 12_Block_object_dispose(va, 8) = v63;
  *(void *)(v45 - 120) = v48;
  v67(v45 - 144);
  *(void *)(v45 - 104) = v63;
  *(void *)(v45 - 144) = v47;
  *(void *)(v45 - 136) = v66;
  *(void *)(v45 - 12_Block_object_dispose(va, 8) = v62;
  *(void *)(v45 - 120) = v48;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923
                         * ((((v45 - 144) | 0xA3105CC4) - (v45 - 144) + ((v45 - 144) & 0x5CEFA338)) ^ 0x51A3A113);
  v67(v45 - 144);
  *(void *)(v45 - 104) = v62;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923 * (((v45 - 144) & 0x9B210A30 | ~((v45 - 144) | 0x9B210A30)) ^ 0x966D0818);
  *(void *)(v45 - 144) = v47;
  *(void *)(v45 - 136) = v66;
  *(void *)(v45 - 12_Block_object_dispose(va, 8) = v61;
  *(void *)(v45 - 120) = v48;
  v67(v45 - 144);
  *(void *)(v45 - 104) = v61;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923 * ((((v45 - 144) | 0x95C539CC) - ((v45 - 144) & 0x95C539CC)) ^ 0x6776C41B);
  *(void *)(v45 - 144) = v47;
  *(void *)(v45 - 136) = v66;
  *(void *)(v45 - 12_Block_object_dispose(va, 8) = v60;
  *(void *)(v45 - 120) = v48;
  v67(v45 - 144);
  *(void *)(v45 - 144) = v47;
  *(void *)(v45 - 136) = v66;
  *(void *)(v45 - 104) = v60;
  *(void *)(v45 - 12_Block_object_dispose(va, 8) = v66;
  *(void *)(v45 - 120) = v48;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923 * (((v45 - 144) & 0x8BC4ED51 | ~((v45 - 144) | 0x8BC4ED51)) ^ 0x8688EF79);
  v67(v45 - 144);
  uint64_t v49 = *(void *)(v47 - 0x7542B2AE5773797LL);
  *(_DWORD *)(v45 - 12_Block_object_dispose(va, 8) = v42
                         + 1374699841
                         * ((-1520606683 - ((v45 - 144) | 0xA55D6225) + ((v45 - 144) | 0x5AA29DDA)) ^ 0x375685D3)
                         - 79;
  *(void *)(v45 - 144) = v49;
  *(void *)(v45 - 136) = v44;
  sub_100016BB0(v45 - 144);
  *(void *)(v45 - 136) = v68;
  *(_DWORD *)(v45 - 144) = v42 + 235795823 * ((v45 - 862440077 - 2 * ((v45 - 144) & 0xCC983603)) ^ 0x58357F5A) - 1147;
  sub_100023E58(v45 - 144);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, char *, char *, char *, char *, uint64_t, uint64_t, uint64_t))(v69 + 8LL * (int)((((*(_DWORD *)(v45 - 140) - 313388985) < 0x7FFFFFFF) * (((v42 - 1428) | 0x54) + ((v42 - 1051) ^ 0xFFFFFEC0))) ^ v42)))( v50,  v51,  v52,  v53,  v54,  v55,  v56,  v57,  v59,  v60,  v61,  v62,  v63,  v64,  v65,  v66,  a12,  a13,  v42);
}

uint64_t sub_100047818()
{
  int v5 = 1224239923 * ((v4 - 144) ^ 0xF2B3FDD7);
  *(_DWORD *)(v4 - 12_Block_object_dispose(va, 8) = v5 + v0 + 10;
  *(_DWORD *)(v4 - 144) = v5 ^ 0x3EAF37E3;
  *(void *)(v4 - 136) = v8;
  sub_100018B40((_DWORD *)(v4 - 144));
  *(void *)(v4 - 104) = v1;
  *(_DWORD *)(v4 - 112) = v0
                        + 1224239923 * ((2 * ((v4 - 144) & 0x53DB0AB8) - (v4 - 144) + 740619589) ^ 0xDE970892)
                        + 1724;
  *(void *)(v4 - 12_Block_object_dispose(va, 8) = v1;
  *(void *)(v4 - 120) = v2;
  *(void *)(v4 - 144) = v3;
  *(void *)(v4 - 136) = v8;
  v9(v4 - 144);
  *(_DWORD *)(v4 - 12_Block_object_dispose(va, 8) = ((v0 + 556) | 0x98)
                        + 1374699841 * ((((v4 - 144) | 0xF444FDE1) + (~(v4 - 144) | 0xBBB021E)) ^ 0x99B0E5E9)
                        + 557;
  *(void *)(v4 - 144) = v1;
  *(void *)(v4 - 136) = v7;
  return sub_100016BB0(v4 - 144);
}

void sub_100048888(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (1178560073 * ((((2 * a1) | 0xD7F3130A) - a1 + 335967867) ^ 0x516DF1E7));
  __asm { BR              X14 }

uint64_t sub_1000489B8@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v14 = v11 > 0x21B7F2B0;
  *(_DWORD *)(a9 + 4LL * (v9 + a1)) = *(_DWORD *)(*(void *)(v12 - 0xC7F991DE6408E15LL) + 4LL * (v9 + a1));
  if (v14 == v9 + 985134360 < -565703345) {
    BOOL v14 = v9 + 985134360 < (int)(v11 + 1581780303);
  }
  return ((uint64_t (*)(uint64_t))(*(void *)(v13 + 8LL * ((510 * !v14) ^ (v10 - 799))) - 8LL))(3729263951LL);
}

uint64_t sub_100048A60( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v16 = v14 - 963 + v13 - 986969928;
  BOOL v18 = v16 > 1757160217 || v16 < a13 - 390323430;
  return ((uint64_t (*)(void))(*(void *)(v15 + 8LL * ((23 * v18) ^ v14)) - 12LL))();
}

uint64_t sub_100048AD0@<X0>( int a1@<W2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(_DWORD *)(a10 + 4LL * (v10 + a2)) = a1;
  int v17 = v12 + v10 + 555;
  BOOL v19 = v17 > ((v11 - 1139021551) & 0x43E4132B) + v13 || v17 < v14;
  return ((uint64_t (*)(void))(*(void *)(v16 + 8LL * ((v19 * v15) ^ v11)) - 12LL))();
}

uint64_t sub_100048B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7
                                                                                          + 8LL
                                                                                          * ((((2 * v6) ^ 0x40A)
                                                                                            * (v5 == 0)) ^ v6))
                                                                              - ((v6 - 480591215) & 0x1CA53FFF ^ 0x4B7LL)))( a1,  a2,  a3,  a4,  a5);
}

uint64_t sub_100048B7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10, uint64_t a11, int a12, int a13, uint64_t a14)
{
  int v17 = 1374699841 * ((2 * ((v16 - 128) & 0x66A9F4B8) - (v16 - 128) + 425069377) ^ 0x74A21348);
  *(_DWORD *)(v16 - 12_Block_object_dispose(va, 8) = v15 - v17 - 188;
  *(_DWORD *)(v16 - 124) = v17 + ((a13 << 6) & 0xDB9F1FC0) + ((32 * a13) ^ 0x6DCF8FF5) - 621380673;
  *(void *)(v16 - 120) = a14;
  sub_100022400((_DWORD *)(v16 - 128));
  return ((uint64_t (*)(void))(*(void *)(v14
                                        + 8LL
                                        * ((1972 * (*a10 + ((v15 - 159355000) ^ v15 ^ 0x307u) > 0x7FFFFFFE)) ^ v15))
                            - 4LL))();
}

uint64_t sub_100048C5C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(_DWORD *)(v18 - 112) = v14
                         + 1374699841 * (((~(v18 - 128) & 0x2D3D96EC) - (~(v18 - 128) | 0x2D3D96ED)) ^ 0x40C98EE4)
                         + 427;
  *(void *)(v18 - 12_Block_object_dispose(va, 8) = a14;
  *(void *)(v18 - 120) = &STACK[0xC7F991DE6408E5D];
  sub_100016BB0(v18 - 128);
  *(void *)(v18 - 120) = a14;
  *(_DWORD *)(v18 - 112) = v14
                         + ((((v18 - 128) ^ 0x5F497C76) & 0x2F4F9D48 | ~((v18 - 128) ^ 0x5F497C76 | 0x2F4F9D48)) ^ 0x356D66A3)
                         * v16
                         + 567;
  *(void *)(v18 - 104) = v17;
  uint64_t v19 = ((uint64_t (*)(uint64_t))*(&off_100079130 + (v14 ^ 0x4A7)))(v18 - 128);
  return ((uint64_t (*)(uint64_t))(*(void *)(v15
                                                      + 8LL
                                                      * (int)(((*(_DWORD *)(v18 - 128) > ((v14 + 1618980239) ^ 0x607FB2C9u)
                                                                                       + 268031314)
                                                             * (((v14 + 1618980239) & 0x9F804EFF) + 405)) ^ v14))
                                          - 4LL))(v19);
}

uint64_t sub_100048D80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  int v18 = (v17 + 888) | 0x12;
  int v19 = 1075 - (a16 - 159353952 + v18);
  if (a16 - 159353952 + v18 - 1075 >= 0) {
    int v19 = a16 - 159353952 + v18 - 1075;
  }
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8LL
}

uint64_t sub_100048E2C(int a1)
{
  return (*(uint64_t (**)(void))(v4 + 8LL * (((*(_DWORD *)(v1 + 4LL * v2) != a1) * ((v3 + 906) ^ 0xA9)) ^ v3)))();
}

uint64_t sub_100048E5C()
{
  return (*(uint64_t (**)(void))(v2 + 8LL * (((v0 - 1 > (int)((v1 - 906) ^ 0xFFFFFF56)) * ((v1 + 778) ^ 0x4BB)) ^ v1)))();
}

uint64_t sub_100048E98()
{
  uint64_t v3 = *(void *)(v5 + 32);
  *(_DWORD *)(v2 - 112) = v0 + 1374699841 * ((v2 - 128) ^ 0x6DF41809) - 376;
  *(void *)(v2 - 12_Block_object_dispose(va, 8) = v1;
  *(void *)(v2 - 120) = v3;
  return sub_100016BB0(v2 - 128);
}

uint64_t sub_10004934C(uint64_t a1)
{
  int v1 = 535753261 * (((a1 | 0xB4CC401E) - a1 + (a1 & 0x4B33BFE1)) ^ 0xBE384E31);
  int v2 = *(_DWORD *)(a1 + 8) ^ v1;
  int v3 = *(_DWORD *)(a1 + 24) - v1;
  int v4 = *(_DWORD *)(*(void *)(a1 + 16) - 0xC7F991DE6408E19LL);
  unsigned int v6 = v4 - 159353952;
  BOOL v5 = v4 - 159353952 < 0;
  unsigned int v7 = 159353952 - v4;
  if (v5) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = v6;
  }
  return ((uint64_t (*)(void))(*((void *)*(&off_100079130 + v2 - 1195)
                              + ((944 * ((v3 - 2129462123) >= 4 * (unint64_t)v8)) ^ v2)
                              - 1)
                            - 12LL))();
}

uint64_t sub_100049414()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * (int)((v2 + 632557832) & 0xDA4BEEEA ^ (29 * (v1 == 2129462123))))
                            - (((v2 + 632557832) & 0xDA4BEEEA)
                             - 4)
                            + 1208LL))();
}

uint64_t sub_100049464(uint64_t result)
{
  *(_DWORD *)(result + 2_Block_object_dispose(va, 8) = v1;
  return result;
}

uint64_t sub_10004946C(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v1 + 8LL * (int)((v3 - 173) ^ 0x4A))
                                                                    - v3
                                                                    + 1216LL))( a1,  v3,  3219884047LL,  v2);
}

uint64_t sub_1000494E0@<X0>(void *a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W8>)
{
  *(_BYTE *)(*a1 + (a4 + a5)) = ((a3 ^ v7) >> v8)
                                            - (((a3 ^ v7) >> v8 << ((a2 + 49) ^ 0xD4)) & (a2 - 96))
                                            + 50;
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * (a2 | (a4 - 1 == v6) | (16 * (a4 - 1 == v6)))) - 12LL))();
}

uint64_t sub_10004953C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3
                                                                                + 8LL
                                                                                * (int)((74 * (v5 == 24)) ^ (a2 - 173)))
                                                                    - a2
                                                                    + 1216LL))( a1,  a2,  a3,  v4);
}

uint64_t sub_100049570(uint64_t a1)
{
  BOOL v7 = v4 - 1798686946 > 2047817217 || v4 - 1798686946 < v3;
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v1 + 8LL * (v5 ^ (193 * v7)))
                                                                    - 5 * (v5 ^ 0x4E3u)
                                                                    + 1216LL))( a1,  5 * (v5 ^ 0x4E3u),  3219884047LL,  v2);
}

uint64_t sub_1000495C8@<X0>(void *a1@<X0>, int a2@<W8>)
{
  return sub_1000494E0(a1, v5 + 173, *(_DWORD *)(*v3 + 4LL * (v4 - 1699021736 + v5 + 173)), v2, a2);
}

void sub_1000495F4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 44) - 1224239923 * (((a1 | 0x1FD8AEE4) - a1 + (a1 & 0xE027511B)) ^ 0xED6B5333);
  __asm { BR              X13 }

uint64_t sub_100049710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v5
                                                                                + 8LL
                                                                                * (v3 ^ (1928 * (v4 != 0xEB8F3DED))))
                                                                    - 12LL))( a1,  a2,  a3,  (v3 + 69));
}

uint64_t sub_100049760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v15 = v7 > v9;
  *(_BYTE *)(v13 + (v11 - 271286987)) = *(_BYTE *)(*(void *)(v12 + 8LL * (v5 ^ 0x1E3))
                                                               + (((_BYTE)v11 + 53) & 0xF)
                                                               - 4LL) ^ *(_BYTE *)(v4 + (v11 - 271286987)) ^ (23 * ((v11 + 53) & 0xF)) ^ *(_BYTE *)(*(void *)(v12 + 8LL * (v5 - 321)) + (((_BYTE)v11 + 53) & 0xF)) ^ *(_BYTE *)(*(void *)(v12 + 8LL * (v5 - 314)) + (((_BYTE)v11 + 53) & 0xF) + (a4 ^ 0x1F3) - 8);
  if (v15 == v11 - 1983323350 < v6) {
    BOOL v15 = v11 - 1983323350 < v8;
  }
  return ((uint64_t (*)(void))(*(void *)(v14 + 8LL * ((v15 * v10) ^ v5)) - 12LL))();
}

uint64_t sub_100049814()
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * ((52
                                * ((((v0 + 753702940) & 0xD313674B ^ 0xE6FAFFEC) & (2 * v1) ^ 0xC61A79CA)
                                 + (v1 ^ 0x18F2411A)
                                 + ((v0 - 1193) ^ 0x3EE3DA49) != 845240498)) ^ v0)))();
}

uint64_t sub_100049890()
{
  return (*(uint64_t (**)(void))(v3 + 8LL * ((98 * (v2 + v1 + v0 + 209878278 >= (v0 - 1531))) ^ v0)))();
}

uint64_t sub_1000498F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v8
                                        + 8LL
                                        * ((30
}

uint64_t sub_100049944(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v12 = (a3 + v9 + v8 + 1227);
  uint64_t v13 = v12 + v10;
  uint64_t v14 = v12 & 0xF;
  unint64_t v15 = v14 - v13 + v6;
  uint64_t v16 = (v7 | v14) - v13;
  unint64_t v17 = (v5 | v14) - v13;
  BOOL v21 = v15 > 0xF && v4 - v10 >= (((a4 ^ 0x15u) + 575) ^ 0x5BDuLL) && (unint64_t)(v16 + 1) > 0xF && v17 > 0xF;
  return ((uint64_t (*)(void))(*(void *)(v11 + 8LL * ((248 * v21) ^ a4)) - 12LL))();
}

uint64_t sub_1000499C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void))(*(void *)(v8
                                                                       + 8LL
                                                                       * ((788
                                                                         * (((v7 < 0x10) ^ ((a7 ^ 0x37) - 1)) & 1)) ^ a7))
                                                           - 8LL))( a1,  a2,  0LL);
}

uint64_t sub_100049A00( uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  char v63 = a4 + 2;
  unsigned int v64 = (a4 + 1289949719) & 0xB31CEFDF;
  v70.val[1].i64[0] = ((_BYTE)a2 + 11) & 0xF;
  v70.val[1].i64[1] = ((_BYTE)a2 + v63 + 21 + 121) & 0xF;
  v70.val[2].i64[0] = ((_BYTE)a2 + 9) & 0xF;
  v70.val[2].i64[1] = ((_BYTE)a2 + 8) & 0xF;
  v70.val[3].i64[0] = ((_BYTE)a2 + 7) & 0xF;
  v70.val[3].i64[1] = ((_BYTE)a2 + 6) & 0xF;
  v65.i64[0] = 0x8787878787878787LL;
  v65.i64[1] = 0x8787878787878787LL;
  uint64_t v66 = a2 + ((v64 - 527) ^ (v57 - 126));
  v70.val[0].i64[0] = ((_BYTE)a2 + ((v64 - 15) ^ (v57 - 126))) & 0xF;
  v70.val[0].i64[1] = ((_BYTE)a2 + 12) & 0xF;
  v67.i64[0] = vqtbl4q_s8(v70, (int8x16_t)xmmword_100061B60).u64[0];
  v71.val[0].i64[1] = ((_BYTE)a2 + 4) & 0xF;
  v71.val[1].i64[1] = ((_BYTE)a2 + 2) & 0xF;
  v71.val[2].i64[1] = a2 & 0xF;
  v71.val[3].i64[1] = ((_BYTE)a2 + 14) & 0xF;
  v71.val[0].i64[0] = ((_BYTE)a2 + 5) & 0xF;
  v71.val[1].i64[0] = ((_BYTE)a2 + 3) & 0xF;
  v71.val[2].i64[0] = ((_BYTE)a2 + 1) & 0xF;
  v71.val[3].i64[0] = ((_BYTE)a2 - 1) & 0xF;
  v67.i64[1] = vqtbl4q_s8(v71, (int8x16_t)xmmword_100061B60).u64[0];
  int8x16_t v68 = vrev64q_s8(vmulq_s8(v67, v65));
  *(int8x16_t *)(*(void *)(v62 - 120) - 15LL + v66) = veorq_s8( veorq_s8( veorq_s8( *(int8x16_t *)(v59 + (v66 & 0xF) - 15),  *(int8x16_t *)(v56 - 15 + v66)),  veorq_s8( *(int8x16_t *)((v66 & 0xF) + v60 - 14),  *(int8x16_t *)(v58 + (v66 & 0xF) - 15))),  vextq_s8(v68, v68, 8uLL));
  return ((uint64_t (*)(void))(*(void *)(a56 + 8LL * (int)((13 * ((v61 & 0xFFFFFFF0) != 16)) ^ v64)) - 12LL))();
}

void sub_100049B78()
{
}

uint64_t sub_100049B84(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
}

uint64_t sub_100049BC0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(uint64_t))(*(void *)(v9
                                                      + 8LL
                                                      * ((353 * ((((a8 - 350) ^ (((a8 - 1220) & v8) == 0)) & 1) == 0)) ^ a8))
                                          - 8LL))(a1);
}

uint64_t sub_100049C04@<X0>( int a1@<W2>, int a2@<W3>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51)
{
  int v60 = v58 + a3 + v57;
  unsigned int v61 = v60 + v52 - a1;
  v63.val[0].i64[0] = v61 & 0xF;
  v63.val[0].i64[1] = ((_BYTE)v60 - (_BYTE)a1 + 12) & 0xF;
  v63.val[1].i64[0] = ((_BYTE)v60 - (_BYTE)a1 + 11) & 0xF;
  v63.val[1].i64[1] = ((_BYTE)v60 - (_BYTE)a1 + ((102 * (a2 ^ 0x98)) ^ 6)) & 0xF;
  v63.val[2].i64[0] = ((_BYTE)v60 - (_BYTE)a1 + 9) & 0xF;
  v63.val[2].i64[1] = ((_BYTE)v60 - (_BYTE)a1 + 8) & 0xF;
  v63.val[3].i64[0] = ((_BYTE)v60 - (_BYTE)a1 + 7) & 0xF;
  v63.val[3].i64[1] = ((_BYTE)v60 - (_BYTE)a1 + 6) & 0xF;
  *(int8x8_t *)(v59 - 7 + v61) = veor_s8( veor_s8( veor_s8(*(int8x8_t *)(v54 + v63.val[0].i64[0] - 7), *(int8x8_t *)(v51 - 7 + v61)),  veor_s8( *(int8x8_t *)(v63.val[0].i64[0] + v55 - 6),  *(int8x8_t *)(v53 + v63.val[0].i64[0] - 7))),  vrev64_s8( vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8(v63, (int8x16_t)xmmword_100061B70),  (int8x8_t)0x8787878787878787LL)));
}

void sub_100049D24()
{
}

uint64_t sub_100049D2C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v26
                                                                                + 8LL
                                                                                * ((((v25 - 350) ^ 0x120) * (v24 == a7)) ^ v25))
                                                                    - 8LL))( a24,  a2,  a3,  (v25 - 350) ^ 0x29Cu);
}

uint64_t sub_100049D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  *(_BYTE *)(v12 + (a6 + v8)) = *(_BYTE *)(v10 + ((a6 + v8) & 0xFLL)) ^ *(_BYTE *)(v6
                                                                                               + (a6 + v8)) ^ *(_BYTE *)((((_BYTE)a6 + (_BYTE)v8) & 0xF) + v11 + 1) ^ *(_BYTE *)(v9 + (((_BYTE)a6 + (_BYTE)v8) & 0xF)) ^ (((a6 + v8) & 0xF) * ((a5 ^ 0x9C) - 107));
  return ((uint64_t (*)(void))(*(void *)(v13 + 8LL * ((1008 * (a6 - 1 != v7)) ^ (a5 + 622))) - 4LL))();
}

uint64_t sub_100049DD4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47)
{
  uint64_t v50 = *(void *)(a1 + 24);
  *(int8x16_t *)(v48 - 112) = veorq_s8( *(int8x16_t *)(*(void *)(a1 + 16) - 0x2CB40BEC8D7CDE9DLL),  (int8x16_t)xmmword_100061B80);
  if (v47) {
    BOOL v51 = v50 == 0x39E8CCF6252BBBF8LL;
  }
  else {
    BOOL v51 = 1;
  }
  int v52 = v51;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 8LL * (int)(((((((_DWORD)a4 - 16) ^ v52) & 1) == 0) * (a4 + 763)) ^ a4)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47);
}

uint64_t sub_100049E50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47)
{
  BOOL v50 = (_DWORD)a25 == v47 + 547374634 || (((_BYTE)a25 + 4) & 0xF) != 11 * (v47 ^ 0x1D3) - 539;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 8LL * (v47 ^ (16 * v50))))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47);
}

uint64_t sub_100049EA0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, int a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,int a55,int a56,int a57)
{
  return ((uint64_t (*)(void))(*(void *)(v57
                                        + 8LL
                                        * (a57 ^ (1830
                                                * (((2 * (a25 - ((2 * a55) & 0x73F15AF2) + 425223533)) & 0xF7EFFEEE ^ 0x73E15AE2)
                                                 + ((a25 - ((2 * a55) & 0x73F15AF2) + 425223533) ^ 0x420F520E)
                                                 - 277165155 != 1802685204))))
                            - 12LL))();
}

uint64_t sub_100049F68(int a1, int a2)
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL * (((a2 + a1 + 13 * (v2 ^ 0x20Fu) - 2079850918 > 7) * (v2 + 872)) ^ v2))
                            - 12LL))();
}

uint64_t sub_100049FE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(void))(*(void *)(v7
                                        + 8LL
}

uint64_t sub_10004A01C(int a1, int a2, int a3)
{
  uint64_t v9 = (a2 + a1 + v6);
  unint64_t v10 = v9 + v7 + 1;
  uint64_t v11 = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)v6) & 0xF;
  uint64_t v12 = v11 - v9;
  unint64_t v13 = v4 + v12;
  ++v11;
  unint64_t v14 = v4 + v11;
  unint64_t v15 = v5 + v12;
  unint64_t v16 = v5 + v11;
  unint64_t v17 = v3 + v12;
  unint64_t v18 = v3 + v11;
  BOOL v20 = v14 > v7 && v13 < v10;
  if (v16 > v7 && v15 < v10) {
    BOOL v20 = 1;
  }
  int v23 = v18 > v7 && v17 < v10 || v20;
}

uint64_t sub_10004A0A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void))(*(void *)(v7
                                                                       + 8LL
                                                                       * ((((a6 - 2008942240) & 0x77BE03DF ^ 0x253)
                                                                         * (v6 < 0x10)) ^ a6))
                                                           - ((a6 + 1710980831) & 0x9A047FFE ^ 0x3E0LL)))( a1,  a2,  0LL);
}

uint64_t sub_10004A104(int a1, int a2, uint64_t a3, int a4)
{
  v19.val[1].i64[0] = ((_BYTE)v8 + 9) & 0xF;
  v19.val[1].i64[1] = ((_BYTE)v8 + 8) & 0xF;
  v19.val[2].i64[0] = ((_BYTE)v8 + 7) & 0xF;
  v19.val[2].i64[1] = ((_BYTE)v8 + 6) & 0xF;
  v19.val[3].i64[0] = ((_BYTE)v8 + 5) & 0xF;
  v19.val[3].i64[1] = ((_BYTE)v8 + 4) & 0xF;
  v20.val[0].i64[0] = ((_BYTE)v8 + 3) & 0xF;
  v20.val[0].i64[1] = ((_BYTE)v8 + 2) & 0xF;
  v20.val[1].i64[0] = (v8 + 1) & 0xF;
  v20.val[1].i64[1] = v8 & 0xF;
  v20.val[2].i64[0] = (v8 - 1) & 0xF;
  v20.val[2].i64[1] = (v8 + 14) & 0xF;
  v20.val[3].i64[0] = ((_BYTE)v8 + 13) & 0xF;
  v20.val[3].i64[1] = ((_BYTE)v8 + 12) & 0xF;
  v12.i64[0] = 0x505050505050505LL;
  v12.i64[1] = 0x505050505050505LL;
  v13.i64[0] = 0x3232323232323232LL;
  v13.i64[1] = 0x3232323232323232LL;
  uint64_t v14 = v9 + a2 + a1 - 539 + (a4 ^ 0x1FFu);
  v19.val[0].i64[0] = ((_BYTE)v9 + (_BYTE)a2 + (_BYTE)a1 - 27 + ~(_BYTE)a4) & 0xF;
  v19.val[0].i64[1] = ((_BYTE)v8 + 10) & 0xF;
  v15.i64[0] = vqtbl4q_s8(v19, (int8x16_t)xmmword_100061B60).u64[0];
  v15.i64[1] = vqtbl4q_s8(v20, (int8x16_t)xmmword_100061B60).u64[0];
  int8x16_t v16 = vrev64q_s8( veorq_s8( veorq_s8(*(int8x16_t *)(v10 - 15 + v14), *(int8x16_t *)(v6 + (v14 & 0xF) - 15)),  veorq_s8(*(int8x16_t *)(v7 + (v14 & 0xF) - 15), *(int8x16_t *)(v5 + (v14 & 0xF) - 15))));
  int8x16_t v17 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v16, v16, 8uLL), v13), vmulq_s8(v15, v12)));
  *(int8x16_t *)(v10 - 15 + v14) = vextq_s8(v17, v17, 8uLL);
  return ((uint64_t (*)(void))(*(void *)(v11 + 8LL * ((1673 * ((v4 & 0xFFFFFFF0) == 16)) ^ a4)) - 8LL))();
}

void sub_10004A260()
{
}

uint64_t sub_10004A26C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,unsigned int a55,uint64_t a56,uint64_t a57)
{
  int v62 = v59 - 326;
  int v63 = (2 * (v59 - 326)) ^ 0x256;
  *(_DWORD *)(v61 - 124) = v63;
  uint64_t v64 = *(void *)(v60 + 8LL * (v59 - 479)) - 4LL;
  uint64_t v65 = *(void *)(v60 + 8LL * ((v59 - 326) ^ 0xA7));
  int v66 = (*(unsigned __int8 *)(v65 + (*v57 ^ 0xB1LL)) ^ 0xA7) << (v63 - 86);
  uint64_t v67 = *(void *)(v60 + 8LL * ((v59 - 326) ^ 0x24));
  int v68 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBEBLL) ^ 0x49LL));
  int v69 = v66 | ((*(unsigned __int8 *)(v64 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF6LL) ^ 0xD7LL)) ^ 0x96) << 8);
  HIDWORD(v71) = v68 ^ 2;
  LODWORD(v71) = (v68 ^ 0xFFFFFF9F) << 24;
  unsigned __int8 v70 = v71 >> 26;
  uint64_t v72 = *(void *)(v60 + 8LL * (v62 - 127));
  int v73 = *(unsigned __int8 *)(v65 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBECLL) ^ 0xB8LL));
  int v74 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBEFLL) ^ 0x6BLL));
  HIDWORD(v71) = v74 ^ 2;
  LODWORD(v71) = (v74 ^ 0xFFFFFF9F) << 24;
  int v75 = ((v71 >> 26) ^ 0x53) << 16;
  LOBYTE(v6_Block_object_dispose(va, 8) = *(_BYTE *)(v64 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBEALL) ^ 0x2ELL));
  int v76 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF7LL) ^ 0x47LL));
  HIDWORD(v71) = v76 ^ 2;
  LODWORD(v71) = (v76 ^ 0xFFFFFF9F) << 24;
  int v77 = v69 | (*(_BYTE *)(v72 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF5LL) ^ 0xECLL)) + 119) ^ 9 | (((v71 >> 26) ^ 0x1E) << 16);
  int v78 = v75 | ((*(unsigned __int8 *)(v64 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBEELL) ^ 0x77LL)) ^ 0x59) << 8);
  int v79 = (*(_BYTE *)(v72 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF1LL) ^ 0xA9LL)) + 119) | ((*(unsigned __int8 *)(v64 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF2LL) ^ 0x30LL)) ^ 0xA3) << 8);
  int v80 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF3LL) ^ 0xCBLL));
  LOBYTE(v67) = *(_BYTE *)(v72 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBE9LL) ^ 0x36LL)) + 119;
  HIDWORD(v71) = v80 ^ 2;
  LODWORD(v71) = (v80 ^ 0xFFFFFF9F) << 24;
  int v81 = ((v70 ^ 0xFB) << 16) | ((v73 ^ 0x1F) << 24) | ((v68 ^ 0x53) << 8);
  LOBYTE(v64) = *(_BYTE *)(v72 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBEDLL) ^ 0xB5LL));
  unsigned int v82 = v79 & 0xFF00FFFF | (((v71 >> 26) ^ 0xBA) << 16) | ((*(unsigned __int8 *)(v65
                                                                                                + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF4LL) ^ 0x35LL)) ^ 0x68) << 24);
  uint64_t v83 = *(void *)(v60 + 8LL * (v62 ^ 0xCD)) - 8LL;
  int v84 = v78 | ((*(unsigned __int8 *)(v65 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF0LL) ^ 0xBFLL)) ^ 0x71) << 24);
  uint64_t v85 = v70 ^ 0x61u;
  uint64_t v86 = *(void *)(v60 + 8LL * (v62 ^ 0x40)) - 8LL;
  LODWORD(v65) = *(_DWORD *)(v83 + 4LL * (v67 ^ 0xFDu)) ^ 0x5859772F ^ *(_DWORD *)(v86 + 4 * v85);
  uint64_t v87 = v73 ^ 0x8Au;
  uint64_t v88 = *(void *)(v60 + 8LL * (v62 ^ 3)) - 12LL;
  LODWORD(v65) = (v65 - 1142355399 + (~(2 * v65) | 0x882DEB8D) + 1) ^ *(_DWORD *)(v88 + 4 * v87);
  LODWORD(v85) = v65 - ((2 * v65) & 0xFEC65660);
  uint64_t v89 = *(void *)(v60 + 8LL * (int)(v62 & 0x8524C8B7)) - 4LL;
  LOBYTE(v67) = v67 ^ 0x2A;
  unsigned int v588 = v81 & 0xFFFFFF00 | v67;
  LOBYTE(v64) = (v64 + 119) ^ 0xA8;
  unsigned int v90 = v84 & 0xFFFFFF00 | v64;
  unint64_t v587 = __PAIR64__(v77, v82);
  int v473 = *(_DWORD *)(v89 + 4LL * (v68 ^ 0x6Bu)) ^ v77 ^ (v85 - 10278096);
  *(_DWORD *)(v61 - 176) = v473 ^ v82;
  int v91 = v473 ^ v82 ^ 0x4D;
  unsigned __int8 v502 = v473 ^ v82 ^ 0x4D;
  *(_DWORD *)(v61 - 16_Block_object_dispose(va, 8) = v91 ^ v90;
  int v92 = v91 ^ v90 ^ (v588 - 2 * ((v81 & 0x4D356500 | v67 & 0xD7) ^ v67 & 0x10) - 852138553);
  int v516 = ((unsigned __int16)(v91 ^ v90 ^ ((v81 & 0xFF00 | v67)
                                                         - 2 * ((v81 & 0x6500 | v67 & 0xD7) ^ v67 & 0x10)
                                                         + 26055)) >> 8);
  int v505 = BYTE2(v92);
  LODWORD(v87) = *(_DWORD *)(v89 + 4LL * (v516 ^ 0x9Fu)) ^ *(_DWORD *)(v86 + 4LL * (BYTE2(v92) ^ 0x8Bu));
  unsigned int v93 = v92 ^ 0x77C2486E;
  int v514 = v92;
  int v94 = ((v87 ^ 0xF8092AD9) - ((2 * (v87 ^ 0xF8092AD9)) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83
                                                                                                + 4LL
                                                                                                * (v92 ^ 0xEEu));
  unsigned int v510 = HIBYTE(v93);
  int v95 = v473 ^ *(_DWORD *)(v88 + 4LL * (HIBYTE(v93) ^ 0x65)) ^ (v94 - ((2 * v94) & 0x77D21472) - 1142355399);
  HIDWORD(v586) = v90;
  int v96 = v90 - 2 * (v90 & 0x33FC9F2E ^ v64 & 4) - 1275289814;
  LODWORD(v64) = v95 ^ 0xB3FC9F2A;
  int v97 = v95;
  *(_DWORD *)(v61 - 160) = v95;
  unsigned int v98 = v95 ^ 0xB3FC9F2A ^ v96;
  unsigned int v99 = v98 ^ v93;
  LODWORD(v87) = v98;
  *(_DWORD *)(v61 - 12_Block_object_dispose(va, 8) = v98;
  int v530 = BYTE2(v99);
  int v533 = BYTE1(v99);
  unsigned int v100 = *(_DWORD *)(v86 + 4LL * (BYTE2(v99) ^ 0x2Eu)) ^ *(_DWORD *)(v89 + 4LL * (BYTE1(v99) ^ 0x9Bu)) ^ 0xF8092AD9;
  int v601 = v99;
  unsigned int v101 = (v100 - ((2 * v100) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83 + 4LL * (v99 ^ 0xD2u));
  unsigned int v102 = v99 ^ 0xB978221C;
  *(_DWORD *)(v61 - 192) = HIBYTE(v99);
  int v103 = (v101 - ((2 * v101) & 0x77D21472) - 1142355399) ^ *(_DWORD *)(v88 + 4LL * (HIBYTE(v99) ^ 0x69));
  unsigned int v104 = v103 ^ v91 ^ 0xD520653E;
  int v557 = v103 ^ v91;
  *(_DWORD *)(v61 - 152) = v104 ^ v98;
  int v105 = ((v104 ^ v87 ^ 0x4FA668D4) - ((2 * (v104 ^ v87 ^ 0x4FA668D4)) & 0x9BBF06AA) - 840989867) ^ v102;
  unsigned int v106 = v105 ^ 0x9547167F;
  int v567 = ((v105 ^ 0x9547167F) >> 16);
  int v589 = ((unsigned __int16)(v105 ^ 0x167F) >> 8);
  unsigned int v107 = *(_DWORD *)(v86 + 4LL * (v567 ^ 0x89u)) ^ *(_DWORD *)(v89 + 4LL * (v589 ^ 0x3Au)) ^ 0xF8092AD9;
  int v575 = (((v104 ^ v87 ^ 0xD4) - ((2 * (v104 ^ v87 ^ 0xD4)) & 0xAA) + 85) ^ v102);
  unsigned int v108 = (v107 - ((2 * v107) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83 + 4LL * (v575 ^ 0xE4u));
  unsigned int v592 = HIBYTE(v106);
  int v109 = (v108 - ((2 * v108) & 0x77D21472) - 1142355399) ^ *(_DWORD *)(v88 + 4LL * (HIBYTE(v106) ^ 0x1D));
  unsigned int v538 = v103 ^ v97;
  unsigned int v599 = (v109 - ((2 * v109) & 0xA38B4F64) - 775575630) ^ v103 ^ v97;
  unsigned int v110 = v599 ^ 0xD1C5A7B2 ^ v103 ^ v91;
  *(_DWORD *)(v61 - 224) = v599 ^ 0xD1C5A7B2;
  *(_DWORD *)(v61 - 256) = v110;
  unsigned int v111 = ((v110 ^ 0xFE25CD6D) - ((2 * (v110 ^ 0xFE25CD6D)) & 0x9BBF06AA) - 840989867) ^ v102;
  *(_DWORD *)(v61 - 200) = BYTE1(v111);
  int v112 = *(_DWORD *)(v89 + 4LL * (BYTE1(v111) ^ 0x6Fu));
  *(_DWORD *)(v61 - 20_Block_object_dispose(va, 8) = BYTE2(v111);
  int v113 = *(_DWORD *)(v86 + 4LL * (BYTE2(v111) ^ 0xA8u));
  int v524 = v64 ^ ((v473 ^ v82 ^ 0xBAF72DE4) - ((2 * (v473 ^ v82 ^ 0xBAF72DE4)) & 0x67F93E54) - 1275289814);
  *(_DWORD *)(v61 - 232) = HIBYTE(v111);
  LODWORD(v67) = ((v112 ^ v113 ^ 0xF8092AD9) - ((2 * (v112 ^ v113 ^ 0xF8092AD9)) & 0x77D21472) - 1142355399) ^ *(_DWORD *)(v88 + 4LL * (HIBYTE(v111) ^ 0x85));
  *(_DWORD *)(v61 - 24_Block_object_dispose(va, 8) = v111;
  LODWORD(v67) = (v67 - ((2 * v67) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83 + 4LL * (v111 ^ 0x25u));
  unsigned int v602 = v110 ^ v104 ^ v98;
  int v114 = (v67 - ((2 * v67) & 0xDFAE912E) + 1876379799) ^ v104 ^ v602;
  unsigned int v115 = (v67 - ((2 * v67) & 0xDFAE912E) + 1876379799) ^ v104;
  *(_DWORD *)(v61 - 132) = v114;
  LODWORD(v64) = v111 ^ v114 ^ 0x355EFF67;
  int v116 = v114 ^ 0x355EFF67;
  __int16 v463 = v114 ^ 0xFF67;
  *(_DWORD *)(v61 - 240) = v111;
  unsigned int v500 = (v64 ^ 0x6D8C20B0) >> 24;
  int v490 = ((v64 ^ 0x6D8C20B0) >> 16);
  int v117 = *(_DWORD *)(v86 + 4LL * (v490 ^ 0x89u)) ^ *(_DWORD *)(v88 + 4LL * (v500 ^ 0x1D));
  int v487 = ((unsigned __int16)(v64 ^ 0x20B0) >> 8);
  unsigned int v118 = ((v117 ^ 0xBC830BD0) - 2 * ((v117 ^ 0xBC830BD0) & 0x7F632B32 ^ v117 & 2) - 10278096) ^ *(_DWORD *)(v89 + 4LL * (v487 ^ 0x3Au));
  *(_DWORD *)(v61 - 184) = v599 ^ 0xD1C5A7B2 ^ v67;
  int v481 = v64;
  LODWORD(v64) = v599 ^ 0xD1C5A7B2 ^ v67 ^ *(_DWORD *)(v83 + 4LL * (v64 ^ 0x2Bu)) ^ (v118 - ((2 * v118) & 0xBE66ED8C) + 1597208262);
  int v119 = v64 ^ v115 ^ 0x7C166C11;
  int v120 = v64;
  int v579 = v64;
  LODWORD(v67) = (v119 ^ v111) >> 24;
  *(_DWORD *)(v61 - 2memset((void *)(v1 - 204), 50, 16) = v67;
  int v569 = (v119 ^ v111);
  LODWORD(v67) = *(_DWORD *)(v88 + 4LL * (v67 ^ 0x9B)) ^ *(_DWORD *)(v83 + 4LL * (v569 ^ 0x31u)) ^ 0xE4DA7CFF;
  unsigned int v546 = ((v119 ^ v111) >> 8) ^ 0x86839A;
  int v554 = ((unsigned __int16)(v119 ^ v111) >> 8) ^ 0x9A;
  int v121 = (v67 - ((2 * v67) & 0xFEC65660) - 10278096) ^ *(_DWORD *)(v89
                                                                 + 4LL
                                                                 * (((unsigned __int16)(v119 ^ v111) >> 8) ^ 0xA0u));
  LODWORD(v67) = v119 ^ v111 ^ 0xE42FE6B3;
  int v552 = ((v119 ^ v111) >> 16);
  LODWORD(v64) = (v121 - ((2 * v121) & 0xED403D2) + 124387817) ^ *(_DWORD *)(v86 + 4LL * (v552 ^ 0xAu));
  int v122 = (v64 - ((2 * v64) & 0xD4DD4916) - 361847669) ^ v120;
  *(_DWORD *)(v61 - 136) = v122;
  int v123 = v122 ^ 0x17ED3E21;
  int v124 = v122 ^ 0x17ED3E21 ^ v119;
  __int16 v496 = v122 ^ 0x3E21;
  unsigned int v560 = v119 ^ v116;
  LODWORD(v85) = v119;
  int v536 = v119;
  int v125 = v119 ^ v116 ^ 0x4158620E;
  *(_DWORD *)(v61 - 140) = v125;
  unsigned int v126 = ((v124 ^ 0x5A137D54) - ((2 * (v124 ^ 0x5A137D54)) & 0xACCAC996) - 697998133) ^ v125;
  unsigned int v127 = ((v126 ^ 0xB97FFD6F) - 2 * ((v126 ^ 0x3EE0256F) & 4 ^ (v126 ^ 0xB97FFD6F) & 0x62AC7C1D) + 1655471129) ^ v67 ^ 0x479AB031;
  int v581 = (((v126 ^ 0x6F) - 2 * ((v126 ^ 0x6F) & 4 ^ (v126 ^ 0x6F) & 0x1D) + 25) ^ v67);
  unsigned int v128 = *(_DWORD *)(v89 + 4LL * (BYTE1(v127) ^ 0x3Au)) ^ *(_DWORD *)(v83 + 4LL * (v581 ^ 0xAAu)) ^ 0xA0505DF6;
  int v129 = (v128 - ((2 * v128) & 0xED403D2) + 124387817) ^ *(_DWORD *)(v86 + 4LL * (BYTE2(v127) ^ 0x89u));
  int v130 = (v129 - ((2 * v129) & 0x77D21472) - 1142355399) ^ *(_DWORD *)(v88 + 4LL * (HIBYTE(v127) ^ 0x1D));
  unsigned int v131 = v130 ^ v85;
  unsigned int v132 = ((v130 ^ v85 ^ 0xA6C48CD5) - ((2 * (v130 ^ v85 ^ 0xA6C48CD5)) & 0xC558F832) + 1655471129) ^ v67;
  int v133 = *(_DWORD *)(v88 + 4LL * (HIBYTE(v132) ^ 5)) ^ *(_DWORD *)(v89 + 4LL * (BYTE1(v132) ^ 0x6Fu)) ^ 0x448A2109;
  int v565 = (((v130 ^ v85 ^ 0xD5) - ((2 * (v130 ^ v85 ^ 0xD5)) & 0x32) + 25) ^ v67);
  unsigned int v134 = (v133 - ((2 * v133) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83 + 4LL * (v565 ^ 0x25u));
  int v135 = v123 ^ v130;
  int v136 = v123 ^ v130 ^ *(_DWORD *)(v86 + 4LL * (BYTE2(v132) ^ 0xA8u)) ^ (v134 - ((2 * v134) & 0xED403D2) + 124387817);
  int v137 = v126 ^ 0x3EE0256F ^ v136;
  unsigned int v583 = v137;
  int v595 = ((unsigned __int16)(v137 ^ v132) >> 8);
  unsigned int v469 = (v137 ^ v132) >> 24;
  LODWORD(v8_Block_object_dispose(va, 8) = *(_DWORD *)(v89 + 4LL * (v595 ^ 0x44u)) ^ *(_DWORD *)(v88 + 4LL * (v469 ^ 0x47));
  int v476 = (v137 ^ v132);
  int v138 = ((v88 ^ 0x448A2109) - ((2 * (v88 ^ 0x448A2109)) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83
                                                                                                 + 4LL * (v476 ^ 0xD5u));
  int v459 = ((v137 ^ v132) >> 16);
  int v139 = (v138 - ((2 * v138) & 0xED403D2) + 124387817) ^ *(_DWORD *)(v86 + 4LL * (v459 ^ 0xCBu));
  LODWORD(v586) = v136 ^ 0x29F34BD1 ^ (v139 - ((2 * v139) & 0x5208CCF0) - 1459329416);
  int v465 = v136 ^ v131;
  unsigned int v466 = v136;
  unsigned __int8 v458 = BYTE2(v137) ^ 0x63;
  HIDWORD(v585) = v136 ^ v131 ^ 0xBC788024 ^ (v586 - ((2 * v586) & 0x31B49E60) - 1730523344);
  LODWORD(v585) = HIDWORD(v585) ^ v137 ^ 0x42632BF0 ^ 0x4662A266;
  HIDWORD(a49) = (v585 - 2 * (v585 & 0x60991DD ^ (HIDWORD(v585) ^ v137 ^ 0x42632BF0) & 9) + 101290452) ^ v137 ^ v132;
  int v140 = (char *)*(&off_100079130 + (v62 ^ 0x39)) - 12;
  LODWORD(v86) = (((v135 ^ 0x1B9155BDu) >> 16)
                + 441139960
                + ((2 * ((v135 ^ 0x1B9155BDu) >> 16) + 88) & 0x196 ^ 0xF6F76FFF)) ^ *(_DWORD *)&v140[4 * (((v135 ^ 0x1B9155BDu) >> 16) ^ 0x2D)];
  LODWORD(v8_Block_object_dispose(va, 8) = ((BYTE2(v132) ^ 0x89) + 441139959 - ((2 * (BYTE2(v132) ^ 0x89) + 160207960) & 0x9089196)) ^ *(_DWORD *)&v140[4 * (BYTE2(v132) ^ 0xA4)];
  unsigned int v141 = (char *)*(&off_100079130 + v62 + 40) - 4;
  int v142 = (v86 - ((2 * v86) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (BYTE1(v135) ^ 0x47)];
  LODWORD(v89) = v88 - ((2 * v88) & 0xB6BB4012);
  int v594 = v62;
  int v143 = (char *)*(&off_100079130 + v62 + 14) - 4;
  int v144 = (v89 - 614621175) ^ *(_DWORD *)&v143[4 * (HIBYTE(v132) ^ 0xCC)];
  __int16 v572 = v126 ^ 0x256F ^ v131;
  int v145 = (char *)*(&off_100079130 + v62 + 55) - 12;
  LODWORD(v67) = *(_DWORD *)&v145[4 * (v126 ^ 0x6F ^ v131 ^ 0x53)];
  int v146 = ((v126 ^ 0x3EE0256F ^ v131) >> 16);
  LODWORD(v67) = *(_DWORD *)&v140[4 * (v146 ^ 0xAA)] ^ *(_DWORD *)&v143[4 * (((v126 ^ 0x3EE0256F ^ v131) >> 24) ^ 0x3E)] ^ ((v146 ^ 0x87) + 441139960 + ((2 * (v146 ^ 0x87) + 88) & 0x196 ^ 0xF6F76FFF)) ^ (181304767 * v67 - ((362609534 * v67 - 27765796) & 0xB6BB4012) + 1518979575);
  int v147 = *(_DWORD *)&v145[4 * (v131 ^ 0x74)];
  int v148 = (181304767 * v147 - ((362609534 * v147 + 2119717852) & 0x5C4753DE) + 760206301) ^ *(_DWORD *)&v141[4 * (BYTE1(v131) ^ 0x5A)];
  unsigned int v577 = v148 - ((2 * v148) & 0xB6BB4012);
  unsigned int v543 = BYTE1(v132) ^ 0xB0;
  int v563 = v144 - ((2 * v144) & 0x5C4753DE);
  int v549 = v67 - ((2 * v67) & 0x5C4753DE);
  unsigned int v591 = (v142 - ((2 * v142) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * ((v135 ^ 0x1B9155BDu) >> 24)] ^ (181304767 * *(_DWORD *)&v145[4 * (v135 ^ 0x7D)] + 2133600750);
  int v149 = *(_DWORD *)&v140[4 * (((v524 ^ 0xE9B45E6C) >> 16) ^ 0xF5)] ^ ((((v524 ^ 0xE9B45E6C) >> 16) ^ 0xD8)
                                                                                      + 441139959
                                                                                      - ((2
  unsigned int v150 = *(_DWORD *)(v61 - 128) ^ 0x31676F78;
  unsigned int v151 = *(_DWORD *)&v140[4 * (BYTE2(v150) ^ 0x7B)] ^ ((BYTE2(v150) ^ 0x56)
                                                     + 441139960
                                                     + ((2 * (BYTE2(v150) ^ 0x56) + 88) & 0x196 ^ 0xF6F76FFF));
  int v152 = (v151 - 614621175 + (~(2 * v151) | 0x4944BFED) + 1) ^ *(_DWORD *)&v143[4 * HIBYTE(v150)];
  unsigned int v153 = *(_DWORD *)&v140[4 * (v530 ^ 0x34)] ^ ((v530 ^ 0x19)
                                              + 441139960
                                              + ((2 * (v530 ^ 0x19) + 88) & 0x196 ^ 0xF6F76FFF));
  int v154 = (v153 - ((2 * v153) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (v533 ^ 5)];
  int v531 = v152 - ((2 * v152) & 0x5C4753DE);
  unsigned int v534 = v154 - ((2 * v154) & 0xB6BB4012);
  int v155 = *(_DWORD *)&v145[4 * (*(_DWORD *)(v61 - 160) ^ 0xDF)];
  unsigned int v156 = *(_DWORD *)(v61 - 160) ^ 0x5A18571F;
  unsigned int v157 = *(_DWORD *)&v143[4 * HIBYTE(v156)] ^ ((BYTE2(v156) ^ 0xC1)
                                             + 441139960
                                             + ((2 * (BYTE2(v156) ^ 0xC1) + 88) & 0x196 ^ 0xF6F76FFF)) ^ *(_DWORD *)&v140[4 * (BYTE2(v156) ^ 0xEC)] ^ ((~(362609534 * v155 - 27765796) | 0x4944BFED) + 181304767 * v155 + 1518979576);
  unsigned int v527 = v157 - ((2 * v157) & 0x5C4753DE);
  LODWORD(v67) = *(_DWORD *)&v143[4 * ((v524 ^ 0xE9B45E6C) >> 24)] ^ (v149 - ((2 * v149) & 0xB6BB4012) - 614621175);
  unsigned int v468 = v524 ^ 0xAC;
  unsigned int v519 = BYTE1(v524) ^ 0xB4;
  int v521 = v67 - ((2 * v67) & 0x5C4753DE);
  LOWORD(v89) = v124 ^ 0x8EA4;
  unsigned int v158 = v124 ^ 0x35C48CD5;
  int v159 = v126 ^ 0x5C7FFD6F;
  unsigned int v525 = HIBYTE(v126) ^ 0x2B;
  int v160 = *(_DWORD *)&v140[4 * (BYTE2(v127) ^ 0xDE)] ^ ((BYTE2(v127) ^ 0xF3)
                                                     + 441139959
                                                     - ((2 * (BYTE2(v127) ^ 0xF3) + 160207960) & 0x9089196));
  unsigned int v161 = *(_DWORD *)&v140[4 * (BYTE2(v158) ^ 0xFE)] ^ ((BYTE2(v158) ^ 0xD3)
                                                     + 441139960
                                                     + ((2 * (BYTE2(v158) ^ 0xD3) + 88) & 0x196 ^ 0xF6F76FFF));
  int v162 = *(_DWORD *)&v145[4 * (v126 ^ 0xAA)];
  unsigned int v163 = (v160 - ((2 * v160) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * (HIBYTE(v127) ^ 0x36)];
  int v164 = BYTE2(*(_DWORD *)(v61 - 136));
  unsigned int v165 = *(_DWORD *)&v140[4 * (v164 ^ 0xC1)] ^ ((v164 ^ 0xEC)
                                              + 441139960
                                              + ((2 * (v164 ^ 0xEC) + 88) & 0x196 ^ 0xF6F76FFF));
  int v166 = (v165 - ((2 * v165) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (HIBYTE(v496) ^ 0x8B)];
  unsigned int v507 = v163 - ((2 * v163) & 0x5C4753DE);
  unsigned int v512 = v166 - ((2 * v166) & 0xB6BB4012);
  int v167 = *(_DWORD *)&v141[4 * (BYTE1(v159) ^ 0x20)] ^ ((BYTE2(v159) ^ 0xD7)
                                                     + 441139959
                                                     - ((2 * (BYTE2(v159) ^ 0xD7) + 160207960) & 0x9089196)) ^ *(_DWORD *)&v140[4 * (BYTE2(v159) ^ 0xFA)] ^ (181304767 * v162 - ((362609534 * v162 + 2119717852) & 0x5C4753DE) + 760206301);
  unsigned int v168 = (v161 - ((2 * v161) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * HIBYTE(v158)] ^ (181304767
                                                                                              * *(_DWORD *)&v145[4 * (v89 ^ 0x99)]
                                                                                              + 2133600750);
  unsigned int v477 = BYTE1(v89) ^ 0x14;
  unsigned int v456 = v496 ^ 0xA3;
  unsigned int v484 = v168 - ((2 * v168) & 0x5C4753DE);
  unsigned int v497 = v167 - ((2 * v167) & 0xB6BB4012);
  unsigned int v478 = v473 ^ 0x2BEAE26B;
  LODWORD(v67) = *(_DWORD *)&v140[4 * (((v473 ^ 0x2BEAE26Bu) >> 16) ^ 0xEC)] ^ ((((v473 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1)
                                                                                               + 441139960
                                                                                               + ((2
  LODWORD(v67) = (v67 - ((2 * v67) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (BYTE1(v473) ^ 8)];
  unsigned int v169 = *(_DWORD *)&v140[4 * (v505 ^ 0x15)] ^ ((v505 ^ 0x38)
                                              + 441139960
                                              + ((2 * (v505 ^ 0x38) + 88) & 0x196 ^ 0xF6F76FFF));
  int v170 = *(_DWORD *)&v145[4 * (v502 ^ 0x55)];
  int v506 = v67 - ((2 * v67) & 0xB6BB4012);
  int v462 = BYTE2(*(_DWORD *)(v61 - 168));
  unsigned int v503 = (v462 ^ 0xA7) + 441139960 + ((2 * (v462 ^ 0xA7) + 88) & 0x196 ^ 0xF6F76FFF);
  LODWORD(v67) = (v169 - ((2 * v169) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (v516 ^ 0xF5)] ^ (181304767 * *(_DWORD *)&v145[4 * (v514 ^ 0x9D)] + 2133600750);
  int v517 = v67 - ((2 * v67) & 0xB6BB4012);
  unsigned int v171 = *(_DWORD *)(v61 - 176);
  unsigned int v172 = (181304767 * v170 - ((362609534 * v170 - 27765796) & 0xB6BB4012) + 1518979575) ^ ((BYTE2(v171) ^ 0xBA)
                                                                                         + 441139960
                                                                                         + ((2 * (BYTE2(v171) ^ 0xBA)
                                                                                           + 88) & 0x196 ^ 0xF6F76FFF)) ^ *(_DWORD *)&v143[4 * (HIBYTE(v171) ^ 0x2F)] ^ *(_DWORD *)&v140[4 * (BYTE2(v171) ^ 0x97)];
  unsigned int v474 = v172 - ((2 * v172) & 0x5C4753DE);
  int v173 = BYTE2(*(_DWORD *)(v61 - 132));
  unsigned int v174 = *(_DWORD *)&v140[4 * (v173 ^ 0x25)] ^ ((v173 ^ 8) + 441139960 + ((2 * (v173 ^ 8) + 88) & 0x196 ^ 0xF6F76FFF));
  LODWORD(v89) = *(_DWORD *)(v61 - 184);
  unsigned int v175 = *(_DWORD *)&v140[4 * (BYTE2(v89) ^ 0x56)] ^ ((BYTE2(v89) ^ 0x7B)
                                                    + 441139960
                                                    + ((2 * (BYTE2(v89) ^ 0x7B) + 88) & 0x196 ^ 0xF6F76FFF));
  int v176 = *(_DWORD *)&v145[4 * (v115 ^ 0xFB)];
  int v177 = (v174 - ((2 * v174) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (HIBYTE(v463) ^ 0x60)] ^ (181304767 * *(_DWORD *)&v145[4 * (v463 ^ 0xC3)] + 2133600750);
  int v178 = (181304767 * v176 - ((362609534 * v176 + 2119717852) & 0x5C4753DE) + 760206301) ^ *(_DWORD *)&v141[4 * (BYTE1(v115) ^ 0xEF)];
  LODWORD(v464) = v177 - ((2 * v177) & 0xB6BB4012);
  LODWORD(v457) = v178 - ((2 * v178) & 0xB6BB4012);
  unsigned int v179 = (v175 - ((2 * v175) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * (BYTE3(v89) ^ 0xD9)] ^ (181304767 * *(_DWORD *)&v145[4 * (v89 ^ 0x79)] + 2133600750);
  unsigned int v180 = *(_DWORD *)&v140[4 * (v490 ^ 0x86)] ^ ((v490 ^ 0xAB)
                                              + 441139960
                                              + ((2 * (v490 ^ 0xAB) + 88) & 0x196 ^ 0xF6F76FFF));
  unsigned int v181 = (v180 - ((2 * v180) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * v500];
  unsigned int v454 = v487 ^ 0xEE;
  unsigned int v453 = v481 ^ 0x8D;
  unsigned int v491 = v181 - ((2 * v181) & 0x5C4753DE);
  unsigned int v488 = v179 - ((2 * v179) & 0x5C4753DE);
  int v482 = BYTE2(v115) ^ 0x16;
  unsigned int v515 = (BYTE2(v115) ^ 0x73) + 441139960 + ((2 * (BYTE2(v115) ^ 0x73) + 88) & 0x196 ^ 0xF6F76FFF);
  unsigned int v182 = *(_DWORD *)&v140[4 * (v459 ^ 0x8B)] ^ ((v459 ^ 0xA6)
                                              + 441139960
                                              + ((2 * (v459 ^ 0xA6) + 88) & 0x196 ^ 0xF6F76FFF));
  int v501 = (v458 ^ 0xEC) + 441139959 - ((2 * (v458 ^ 0xEC) + 160207960) & 0x9089196);
  unsigned int v183 = v469 ^ 0x22;
  unsigned int v494 = HIBYTE(v115) ^ 0xE8;
  unsigned int v184 = *(_DWORD *)&v140[4 * (BYTE2(v466) ^ 0xE8)] ^ ((BYTE2(v466) ^ 0xC5)
                                                     + 441139960
                                                     + ((2 * (BYTE2(v466) ^ 0xC5) + 88) & 0x196 ^ 0xF6F76FFF));
  unsigned int v185 = (181304767 * *(_DWORD *)&v145[4 * (v466 ^ 0xCA)] + 2133600750) ^ *(_DWORD *)&v143[4 * (HIBYTE(v466) ^ 0x8E)] ^ (v184 - ((2 * v184) & 0xB6BB4012) - 614621175);
  unsigned int v472 = v465 ^ 0x44039AAA;
  unsigned int v186 = (181304767 * *(_DWORD *)&v145[4 * (v465 ^ 0xDB)] + 2133600750) ^ (((v465 ^ 0x44039AAAu) >> 16)
                                                                                          + 441139960
                                                                                          + ((2
                                                                                            * ((v465 ^ 0x44039AAAu) >> 16)
                                                                                            + 88) & 0x196 ^ 0xF6F76FFF)) ^ *(_DWORD *)&v140[4 * (((v465 ^ 0x44039AAAu) >> 16) ^ 0x2D)];
  unsigned int v470 = v185 - ((2 * v185) & 0x5C4753DE);
  int v187 = (v186 - ((2 * v186) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (BYTE1(v465) ^ 0xC0)];
  unsigned int v188 = *(_DWORD *)&v143[4 * v183] ^ (181304767 * *(_DWORD *)&v145[4 * (v476 ^ 0xFE)] + 2133600750) ^ (v182 - ((2 * v182) & 0xB6BB4012) - 614621175);
  HIDWORD(v475) = v187 - ((2 * v187) & 0xB6BB4012);
  HIDWORD(v464) = v188 - ((2 * v188) & 0x5C4753DE);
  int v189 = *(_DWORD *)&v145[4 * ((v103 ^ v97) ^ 0xEC)];
  unsigned int v190 = *(_DWORD *)&v140[4 * (v567 ^ 0x32)] ^ ((v567 ^ 0x1F)
                                              + 441139960
                                              + ((2 * (v567 ^ 0x1F) + 88) & 0x196 ^ 0xF6F76FFF));
  int v191 = *(_DWORD *)&v145[4 * (v557 ^ 0xE6)];
  LODWORD(v67) = *(_DWORD *)&v143[4 * (HIBYTE(v538) ^ 0xCA)] ^ ((BYTE2(v538) ^ 0x2F)
                                                              + 441139960
                                                              + ((2 * (BYTE2(v538) ^ 0x2F) + 88) & 0x196 ^ 0xF6F76FFF)) ^ *(_DWORD *)&v140[4 * (BYTE2(v538) ^ 2)] ^ (181304767 * v189 - ((362609534 * v189 - 27765796) & 0xB6BB4012) + 1518979575);
  int v192 = (v190 - ((2 * v190) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (v589 ^ 0x8C)] ^ (181304767
                                                                                                * *(_DWORD *)&v145[4 * (v575 ^ 0xD9)]
                                                                                                + 2133600750);
  unsigned int v193 = *(_DWORD *)&v143[4 * ((v557 ^ 0x49A657C7u) >> 24)] ^ ((((v557 ^ 0x49A657C7u) >> 16) ^ 0x35)
                                                             + 441139960
                                                             + ((2
  unsigned int v194 = *(_DWORD *)&v140[4 * (((*(_DWORD *)(v61 - 152) ^ 0x715B7EABu) >> 16) ^ 0x2D)] ^ (((*(_DWORD *)(v61 - 152) ^ 0x715B7EABu) >> 16) + 441139960 + ((2 * ((*(_DWORD *)(v61 - 152) ^ 0x715B7EABu) >> 16) + 88) & 0x196 ^ 0xF6F76FFF));
  unsigned int v576 = v592 ^ 0xAA;
  int v590 = (v67 - ((2 * v67) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4
                                                                        * (((unsigned __int16)(v103 ^ v97) >> 8) ^ 0x2E)];
  unsigned int v568 = v192 - ((2 * v192) & 0xB6BB4012);
  unsigned int v460 = BYTE1(v557) ^ 0xB9;
  LODWORD(v67) = (v194 - ((2 * v194) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4
                                                                                 * ((*(_DWORD *)(v61 - 152) ^ 0x715B7EABu) >> 24)] ^ (181304767 * *(_DWORD *)&v145[4 * (*(_DWORD *)(v61 - 152) ^ 0x3B)] + 2133600750);
  unsigned int v558 = v193 - ((2 * v193) & 0x5C4753DE);
  int v539 = v67 - ((2 * v67) & 0x5C4753DE);
  unsigned int v195 = *(_DWORD *)&v140[4 * (v552 ^ 0xC1)] ^ ((v552 ^ 0xEC)
                                              + 441139960
                                              + ((2 * (v552 ^ 0xEC) + 88) & 0x196 ^ 0xF6F76FFF));
  LODWORD(v67) = (v195 - ((2 * v195) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4
                                                                                  * ((v554 - ((2 * v546) & 0x166) + 179) ^ 0x54)] ^ (181304767 * *(_DWORD *)&v145[4 * (v569 ^ 0xE2)] + 2133600750);
  int v196 = *(_DWORD *)&v145[4 * (*(_DWORD *)(v61 - 140) ^ 0xF0)];
  unsigned int v197 = (181304767 * v196 - ((362609534 * v196 - 27765796) & 0xB6BB4012) + 1518979575) ^ *(_DWORD *)&v143[4 * (HIBYTE(v560) ^ 0x3E)];
  int v570 = v67 - ((2 * v67) & 0xB6BB4012);
  unsigned int v547 = v197 - ((2 * v197) & 0x5C4753DE);
  unsigned int v555 = v536 ^ 0xEEA2BFA8;
  int v198 = *(_DWORD *)&v140[4 * (((v536 ^ 0xEEA2BFA8) >> 16) ^ 0x86)] ^ ((((v536 ^ 0xEEA2BFA8) >> 16) ^ 0xAB)
                                                                                      + 441139959
                                                                                      - ((2
  LODWORD(v67) = (181304767 * *(_DWORD *)&v145[4 * (v536 ^ 0x68)] + 2133600750) ^ *(_DWORD *)&v141[4 * (BYTE1(v536) ^ 0x55)] ^ (v198 - ((2 * v198) & 0x5C4753DE) - 1373394449);
  unsigned int v449 = v458 ^ 0xC1;
  int v199 = ((v579 ^ 0x231B9DB5u) >> 16);
  unsigned int v593 = (v199 ^ 0xC1) + 441139960 + ((2 * (v199 ^ 0xC1) + 88) & 0x196 ^ 0xF6F76FFF);
  LODWORD(v452) = v67 - ((2 * v67) & 0xB6BB4012);
  int v447 = BYTE2(v560);
  unsigned int v553 = (BYTE2(v560) ^ 0xC8) + 441139960 + ((2 * (BYTE2(v560) ^ 0xC8) + 88) & 0x196 ^ 0xF6F76FFF);
  unsigned int v200 = v599 ^ 0x406768A6;
  int v201 = *(_DWORD *)&v145[4 * (v565 ^ 0x60)];
  int v202 = *(_DWORD *)&v145[4 * (v601 ^ 0xFB)];
  int v203 = *(_DWORD *)&v145[4 * (*(_DWORD *)(v61 - 128) ^ 0xB8)];
  int v204 = *(_DWORD *)&v145[4 * v468];
  int v205 = *(_DWORD *)&v145[4 * v456];
  int v206 = *(_DWORD *)&v145[4 * (v581 ^ 0xF0)];
  LODWORD(v85) = *(_DWORD *)(v61 - 168);
  int v207 = *(_DWORD *)&v145[4 * (v85 ^ 0x57)];
  int v208 = *(_DWORD *)&v145[4 * v453];
  int v209 = *(_DWORD *)&v145[4 * (v583 ^ 0x78)];
  LODWORD(v67) = *(_DWORD *)&v145[4 * (v579 ^ 0x75)];
  int v210 = *(_DWORD *)&v145[4 * (*(_DWORD *)(v61 - 248) ^ 0x74)];
  int v211 = *(_DWORD *)&v145[4 * (v602 ^ 0x96)];
  unsigned int v212 = *(_DWORD *)(v61 - 256);
  int v213 = *(_DWORD *)&v145[4 * (v212 ^ 0x2A)];
  LODWORD(v145) = *(_DWORD *)&v145[4 * (v599 ^ 0x9F)];
  *(_DWORD *)(v61 - 24_Block_object_dispose(va, 8) = 181304767 * v201 + 2133600750;
  int v600 = 181304767 * v202 + 2133600750;
  HIDWORD(v457) = 181304767 * v203 + 2133600750;
  HIDWORD(v467) = 181304767 * v204 + 2133600750;
  int v561 = 181304767 * v205 + 2133600750;
  HIDWORD(v455) = 181304767 * v208 + 2133600750;
  LODWORD(v451) = 181304767 * v206 + 2133600750;
  HIDWORD(v451) = 181304767 * v67 + 2133600750;
  HIDWORD(v452) = 181304767 * (_DWORD)v145 + 2133600750;
  LODWORD(v145) = (181304767 * v210 - ((362609534 * v210 - 27765796) & 0xB6BB4012) + 1518979575) ^ *(_DWORD *)&v143[4 * (*(_DWORD *)(v61 - 232) ^ 0x7B)];
  LODWORD(v67) = *(_DWORD *)&v140[4 * (BYTE2(v602) ^ 0x7B)] ^ ((BYTE2(v602) ^ 0x56)
                                                             + 441139960
                                                             + ((2 * (BYTE2(v602) ^ 0x56) + 88) & 0x196 ^ 0xF6F76FFF)) ^ (181304767 * v211 + 2133600750);
  LODWORD(v89) = (v67 - ((2 * v67) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (BYTE1(v602) ^ 0xCC)];
  unsigned int v214 = *(_DWORD *)&v140[4 * (BYTE2(v200) ^ 0x3C)] ^ ((BYTE2(v200) ^ 0x11)
                                                     + 441139960
                                                     + ((2 * (BYTE2(v200) ^ 0x11) + 88) & 0x196 ^ 0xF6F76FFF));
  int v215 = (181304767 * v213 + 2133600750) ^ ((BYTE2(v212) ^ 0x37)
                                          + 441139959
                                          - ((2 * (BYTE2(v212) ^ 0x37) + 160207960) & 0x9089196)) ^ *(_DWORD *)&v140[4 * (BYTE2(v212) ^ 0x1A)];
  int v216 = (_DWORD)v145 - ((2 * (_DWORD)v145) & 0x5C4753DE);
  LODWORD(v145) = (v215 - ((2 * v215) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * (HIBYTE(v212) ^ 0xF9)];
  LODWORD(v67) = *(_DWORD *)(v61 - 208);
  HIDWORD(v44_Block_object_dispose(va, 8) = *(_DWORD *)&v140[4 * (BYTE2(v131) ^ 0x61)];
  *(_DWORD *)(v61 - 232) = *(_DWORD *)&v140[4 * (v462 ^ 0x8A)];
  int v542 = *(_DWORD *)&v140[4 * (v482 ^ 0x48)];
  LODWORD(v450) = *(_DWORD *)&v140[4 * v449];
  int v483 = *(_DWORD *)&v140[4 * (v199 ^ 0xEC)];
  HIDWORD(v461) = *(_DWORD *)&v140[4 * (v447 ^ 0xE5)];
  int v598 = *(_DWORD *)&v140[4 * (v67 ^ 0x1A)];
  LODWORD(v140) = ((*(_DWORD *)(v61 - 240) >> 15) & 0x58 ^ 0x48) + (v67 ^ 0x4C64A1B);
  *(_DWORD *)(v61 - 240) = (_DWORD)v140 + 361035980 + ((2 * (_DWORD)v140) & 0x196 ^ 0xF6F76FFF);
  unsigned int v217 = HIBYTE(v602) ^ 0xE5;
  *(_DWORD *)(v61 - 20_Block_object_dispose(va, 8) = *(_DWORD *)&v141[4 * v543];
  int v544 = *(_DWORD *)&v141[4 * (HIBYTE(v572) ^ 0x8E)];
  int v603 = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 128)) ^ 0x85)];
  HIDWORD(v450) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 160)) ^ 0xBD)];
  *(_DWORD *)(v61 - 160) = *(_DWORD *)&v141[4 * v519];
  HIDWORD(v446) = *(_DWORD *)&v141[4 * v477];
  LODWORD(v44_Block_object_dispose(va, 8) = *(_DWORD *)&v141[4 * (BYTE1(v127) ^ 0x1A)];
  *(_DWORD *)(v61 - 256) = *(_DWORD *)&v141[4 * (BYTE1(v85) ^ 0xF5)];
  *(_DWORD *)(v61 - 176) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 176)) ^ 0xD6)];
  int v520 = *(_DWORD *)&v141[4 * v454];
  HIDWORD(a25) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 184)) ^ 0xD7)];
  int v573 = *(_DWORD *)&v141[4 * (BYTE1(v583) ^ 0x76)];
  int v218 = *(_DWORD *)&v141[4 * (BYTE1(v466) ^ 0x16)];
  LODWORD(v445) = *(_DWORD *)&v141[4 * (v595 ^ 0xBE)];
  *(_DWORD *)(v61 - 184) = *(_DWORD *)&v141[4 * v460];
  int v596 = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 152)) ^ 0xFE)];
  LODWORD(v446) = *(_DWORD *)&v141[4 * (BYTE1(v579) ^ 0x77)];
  HIDWORD(v445) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 140)) ^ 0x95)];
  *(_DWORD *)(v61 - 200) = *(_DWORD *)&v141[4 * (*(_DWORD *)(v61 - 200) ^ 0x84)];
  LODWORD(v467) = *(_DWORD *)&v141[4 * (BYTE1(v212) ^ 0x2E)];
  int v219 = v89 - ((2 * v89) & 0xB6BB4012);
  LODWORD(v89) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 224)) ^ 0xC8)];
  LODWORD(v444) = *(_DWORD *)&v143[4 * (HIBYTE(v131) ^ 0xB2)];
  *(_DWORD *)(v61 - 152) = v563 - 1373394449;
  int v564 = v549 - 1373394449;
  *(_DWORD *)(v61 - 192) = *(_DWORD *)&v143[4 * (*(_DWORD *)(v61 - 192) ^ 7)];
  *(_DWORD *)(v61 - 224) = v531 - 1373394449;
  LODWORD(v455) = v527 - 1373394449;
  LODWORD(v461) = v521 - 1373394449;
  int v550 = *(_DWORD *)&v143[4 * (HIBYTE(*(_DWORD *)(v61 - 136)) ^ 0xFB)];
  HIDWORD(v443) = v507 - 1373394449;
  LODWORD(v443) = v484 - 1373394449;
  unsigned int v485 = v474 - 1373394449;
  unsigned int v532 = v491 - 1373394449;
  HIDWORD(v444) = v488 - 1373394449;
  LODWORD(v67) = v470 - 1373394449;
  unsigned int v508 = v558 - 1373394449;
  LODWORD(v475) = v539 - 1373394449;
  unsigned int v548 = v547 - 1373394449;
  int v522 = v216 - 1373394449;
  int v528 = (_DWORD)v145 - ((2 * (_DWORD)v145) & 0x5C4753DE) - 1373394449;
  int v559 = *(_DWORD *)&v143[4 * v525];
  int v489 = *(_DWORD *)&v143[4 * (BYTE3(v85) ^ 0xB8)];
  int v492 = *(_DWORD *)&v143[4 * HIBYTE(v478)];
  int v479 = *(_DWORD *)&v143[4 * (v510 ^ 0x4B)];
  int v540 = *(_DWORD *)&v143[4 * (HIBYTE(*(_DWORD *)(v61 - 132)) ^ 0x17)];
  int v526 = *(_DWORD *)&v143[4 * v494];
  int v220 = *(_DWORD *)&v143[4 * (HIBYTE(v583) ^ 0xA6)];
  int v221 = *(_DWORD *)&v143[4 * HIBYTE(v472)];
  int v511 = *(_DWORD *)&v143[4 * v576];
  LODWORD(v145) = v89 ^ (v214 - ((2 * v214) & 0x5C4753DE) - 1373394449);
  int v222 = *(_DWORD *)&v143[4 * ((v579 ^ 0x231B9DB5u) >> 24)];
  int v537 = *(_DWORD *)&v143[4 * (*(_DWORD *)(v61 - 216) ^ 0x38)];
  int v223 = *(_DWORD *)&v143[4 * HIBYTE(v555)];
  HIDWORD(v471) = *(_DWORD *)&v143[4 * v217];
  LODWORD(v471) = *(_DWORD *)&v143[4 * HIBYTE(v200)];
  unsigned int v224 = v577 - 614621175;
  unsigned int v495 = v534 - 614621175;
  unsigned int v225 = v497 - 614621175;
  *(_DWORD *)(v61 - 2memset((void *)(v1 - 204), 50, 16) = v506 - 614621175;
  int v498 = v517 - 614621175;
  *(_DWORD *)(v61 - 16_Block_object_dispose(va, 8) = v568 - 614621175;
  int v226 = v570 - 614621175;
  int v227 = v452 - 614621175;
  int v228 = v219 - 614621175;
  unsigned int v229 = (_DWORD)v145 - ((2 * (_DWORD)v145) & 0xB6BB4012) - 614621175;
  int v230 = v591 ^ v590 ^ 0x6285F181;
  int v231 = v67 ^ v218 ^ v230;
  int v232 = (char *)*(&off_100079130 + v594 + 23) - 4;
  uint64_t v233 = (uint64_t)*(&off_100079130 + (v594 ^ 0xA5));
  uint64_t v234 = (uint64_t)*(&off_100079130 + v594 + 21);
  uint64_t v235 = (uint64_t)*(&off_100079130 + v594 - 141);
  unsigned int v236 = (*(unsigned __int8 *)(v235 + (*(unsigned __int8 *)(v61 - 109) ^ 0x41LL)) ^ 5) & 0xFF00FFFF | (((*(_BYTE *)(v233 + (*(unsigned __int8 *)(v61 - 111) ^ 0x40LL)) - 106) ^ 0x5A) << 16) | ((*(unsigned __int8 *)(v234 + (*(unsigned __int8 *)(v61 - 110) ^ 0xBBLL)) ^ 0xD0) << 8) | ((v232[*(unsigned __int8 *)(v61 - 112) ^ 0x1ELL] ^ (*(unsigned __int8 *)(v61 - 112) - ((2 * *(unsigned __int8 *)(v61 - 112)) & 0xCA) - 27) ^ 0x84) << 24);
  v584 = v232;
  int v237 = *(unsigned __int8 *)(v235 + (*(unsigned __int8 *)(v61 - 97) ^ 0x74LL)) ^ 0xA2 | (((*(_BYTE *)(v233 + (*(unsigned __int8 *)(v61 - 99) ^ 0xF3LL)) - 106) ^ 2) << 16) | ((*(unsigned __int8 *)(v234 + (*(unsigned __int8 *)(v61 - 98) ^ 0x20LL)) ^ 0x3A) << 8) | ((v232[*(unsigned __int8 *)(v61 - 100) ^ 0xF3LL] ^ (*(unsigned __int8 *)(v61 - 100) - ((2 * *(unsigned __int8 *)(v61 - 100)) & 0xCA) - 27) ^ 0x85) << 24);
  uint64_t v578 = v235;
  uint64_t v580 = v234;
  unsigned int v238 = (*(unsigned __int8 *)(v235 + (*(unsigned __int8 *)(v61 - 105) ^ 0xE4LL)) ^ 0x33) & 0xFF00FFFF | ((v232[*(unsigned __int8 *)(v61 - 108) ^ 0x3ELL] ^ (*(unsigned __int8 *)(v61 - 108) - ((2 * *(unsigned __int8 *)(v61 - 108)) & 0xCA) - 27) ^ 0xFFFFFFE1) << 24) | (((*(_BYTE *)(v233 + (*(unsigned __int8 *)(v61 - 107) ^ 0x27LL)) - 106) ^ 0x96) << 16) | ((*(unsigned __int8 *)(v234 + (*(unsigned __int8 *)(v61 - 106) ^ 9LL)) ^ 0xD5) << 8);
  int v239 = *(unsigned __int8 **)(v61 - 120);
  uint64_t v582 = v233;
  unsigned int v240 = (*(unsigned __int8 *)(v235 + (*(unsigned __int8 *)(v61 - 101) ^ 0xF2LL)) ^ 0x8A) & 0xFF00FFFF | ((v232[*(unsigned __int8 *)(v61 - 104) ^ 0xD3LL] ^ (*(unsigned __int8 *)(v61 - 104) - ((2 * *(unsigned __int8 *)(v61 - 104)) & 0xCA) - 27) ^ 0xE0) << 24) | ((*(unsigned __int8 *)(v234 + (*(unsigned __int8 *)(v61 - 102) ^ 0xBELL)) ^ 0x72) << 8) & 0xFF00FFFF | (((*(_BYTE *)(v233 + (*(unsigned __int8 *)(v61 - 103) ^ 0xE9LL)) - 106) ^ 0x8A) << 16);
  if ((v231 & 0x80) != 0) {
    int v241 = -128;
  }
  else {
    int v241 = 128;
  }
  *(_DWORD *)(v61 - 12_Block_object_dispose(va, 8) = v237 ^ 0xC71C9E0F;
  *(_DWORD *)(v61 - 132) = v236 ^ 0x653F3C3B;
  *(_DWORD *)(v61 - 136) = v238 ^ 0xEFEB9384;
  *(_DWORD *)(v61 - 140) = v240 ^ 0x14CE96FF;
  HIDWORD(v574) = (HIDWORD(v464) - 1373394449) ^ v445;
  LODWORD(v574) = v220 ^ v501 ^ v573 ^ v450 ^ (181304767 * v209 + 2133600750);
  HIDWORD(v571) = (HIDWORD(v475) - 614621175) ^ v221;
  LODWORD(v571) = v564 ^ v544;
  HIDWORD(v566) = v444 ^ ((BYTE2(v131) ^ 0x4C) + 441139959 - ((2 * (BYTE2(v131) ^ 0x4C) + 160207960) & 0x9089196)) ^ HIDWORD(v448) ^ v224;
  LODWORD(v566) = v443 ^ HIDWORD(v446);
  HIDWORD(v562) = HIDWORD(v443) ^ v448 ^ v451;
  LODWORD(v562) = (v512 - 614621175) ^ v550 ^ v561;
  HIDWORD(v556) = v225 ^ v559;
  LODWORD(v556) = v446 ^ v222 ^ v593 ^ v483 ^ HIDWORD(v451);
  HIDWORD(v551) = HIDWORD(v445) ^ v553 ^ HIDWORD(v461) ^ v548;
  LODWORD(v551) = v227 ^ v223;
  HIDWORD(v545) = v226 ^ v537;
  LODWORD(v545) = HIDWORD(v444) ^ HIDWORD(a25);
  HIDWORD(v541) = v526 ^ v515 ^ v542 ^ (v457 - 614621175);
  LODWORD(v541) = (v464 - 614621175) ^ v540;
  HIDWORD(v535) = HIDWORD(v455) ^ v520 ^ v532;
  LODWORD(v535) = HIDWORD(v452) ^ v471 ^ v229;
  HIDWORD(v529) = v528 ^ v467;
  LODWORD(v529) = v228 ^ HIDWORD(v471);
  HIDWORD(v523) = *(_DWORD *)(v61 - 200) ^ *(_DWORD *)(v61 - 240) ^ v598 ^ v522;
  LODWORD(v523) = *(_DWORD *)(v61 - 168) ^ v511;
  HIDWORD(v51_Block_object_dispose(va, 8) = *(_DWORD *)(v61 - 184) ^ v508;
  LODWORD(v51_Block_object_dispose(va, 8) = v475 ^ v596;
  HIDWORD(v513) = v455 ^ HIDWORD(v450);
  LODWORD(v513) = *(_DWORD *)(v61 - 224) ^ v603 ^ HIDWORD(v457);
  HIDWORD(v509) = HIDWORD(v467) ^ *(_DWORD *)(v61 - 160) ^ v461;
  LODWORD(v509) = v600 ^ *(_DWORD *)(v61 - 192) ^ v495;
  HIDWORD(v504) = v485 ^ *(_DWORD *)(v61 - 176);
  LODWORD(v504) = *(_DWORD *)(v61 - 256) ^ v503 ^ v489 ^ *(_DWORD *)(v61 - 232) ^ (181304767 * v207 + 2133600750);
  HIDWORD(v499) = v498 ^ v479;
  LODWORD(v499) = *(_DWORD *)(v61 - 216) ^ v492;
  HIDWORD(v493) = (v241 + (v231 ^ 0x2497E332)) ^ v230;
  LODWORD(v493) = *(_DWORD *)(v61 - 152) ^ *(_DWORD *)(v61 - 208) ^ *(_DWORD *)(v61 - 248);
  int v242 = *(_DWORD *)(v61 - 124);
  HIDWORD(v486) = v242 & 0x39CF440F;
  LODWORD(v486) = v242 ^ 0x3A0;
  HIDWORD(v480) = v242 ^ 0x3BC;
  LODWORD(v480) = v242 ^ 0x333;
  HIDWORD(a25) = v242 ^ 0x379;
  *(void *)(v61 - 176) = 13LL;
  unsigned __int8 v243 = *(_BYTE *)(v233 + (v239[13] ^ (((v242 - 100) | 0x11) - 40))) - 106;
  *(void *)(v61 - 152) = 1LL;
  uint64_t v244 = v239[1] ^ 0x57LL;
  *(void *)(v61 - 160) = 10LL;
  uint64_t v245 = v239[10] ^ 0xB6LL;
  LODWORD(v244) = ((*(_BYTE *)(v233 + v244) - 106) ^ 0xF6) << 16;
  *(void *)(v61 - 192) = 4LL;
  int v246 = (*(unsigned __int8 *)(v234 + v245) ^ 0x5F) << 8;
  uint64_t v247 = v239[4];
  int v248 = v584[v247 ^ 0x9A];
  *(void *)(v61 - 224) = 7LL;
  LODWORD(v247) = v248 ^ (v247 - ((2 * v247) & 0xCA) - 27) ^ 0xFFFFFFCF;
  int v249 = *(unsigned __int8 *)(v578 + (v239[7] ^ 0xD6LL));
  *(void *)(v61 - 2memset((void *)(v1 - 204), 50, 16) = 2LL;
  LODWORD(v247) = v249 ^ 0x60 | ((_DWORD)v247 << 24);
  int v250 = *(unsigned __int8 *)(v234 + v239[2]) ^ 0x4D;
  *(void *)(v61 - 184) = 3LL;
  LODWORD(v244) = v244 | (v250 << 8);
  int v251 = *(unsigned __int8 *)(v578 + (v239[3] ^ 0x74LL));
  *(void *)(v61 - 16_Block_object_dispose(va, 8) = 12LL;
  LODWORD(v244) = v244 | v251 ^ 0xA2;
  int v252 = v584[v239[12] ^ 0x6ELL] ^ (v239[12] + (~(2 * v239[12]) | 0x35) - 26) ^ 0x51;
  *(void *)(v61 - 20_Block_object_dispose(va, 8) = 0LL;
  int v253 = ((v243 ^ 2) << 16) | (v252 << 24);
  int v254 = v244 | ((v584[*v239 ^ 0x15LL] ^ (*v239 - ((2 * *v239) & 0xCA) - 27) ^ 0xAE) << 24);
  LODWORD(v244) = v246 | ((v584[v239[8] ^ 0x46LL] ^ (v239[8] - ((2 * v239[8]) & 0xCA) - 27) ^ 0xFFFFFFE7) << 24);
  *(void *)(v61 - 200) = 14LL;
  int v255 = *(unsigned __int8 *)(v234 + (v239[14] ^ 0xD5LL)) ^ 0xC5;
  *(void *)(v61 - 232) = 5LL;
  LODWORD(v247) = v247 & 0xFF00FFFF | (((*(_BYTE *)(v582 + (v239[5] ^ 0x9DLL)) - 106) ^ 0xF7) << 16);
  LODWORD(v244) = *(unsigned __int8 *)(v578 + (v239[11] ^ 0xC2LL)) ^ 0x87 | v244;
  *(void *)(v61 - 256) = 9LL;
  *(void *)(v61 - 24_Block_object_dispose(va, 8) = 11LL;
  LODWORD(v244) = v244 & 0xFF00FFFF | (((*(_BYTE *)(v582 + (v239[9] ^ 0x3ELL)) - 106) ^ 0xDF) << 16);
  int v256 = *(unsigned __int8 *)(v234 + (v239[6] ^ 0xA4LL));
  *(void *)(v61 - 240) = 15LL;
  int v257 = *(unsigned __int8 *)(v578 + (v239[15] ^ 0x47LL)) ^ 0xA2 | v253 | (v255 << 8);
  unsigned int v597 = v247 | ((v256 ^ 0x95) << 8);
  uint64_t v258 = (uint64_t)*(&off_100079130 + (v242 ^ 0x3A0));
  unsigned int v259 = ((((unsigned __int16)(v597 ^ WORD2(v585)) >> 8) ^ 0x4C)
        - 1101829684
        - 2 * ((((v597 ^ HIDWORD(v585)) >> 8) ^ 0xB71C4C) & 0xDC ^ ((v597 ^ HIDWORD(v585)) >> 8) & 0x10)) ^ *(_DWORD *)(v258 + 4LL * (((unsigned __int16)(v597 ^ WORD2(v585)) >> 8) ^ 0x21u));
  unsigned int v260 = v254 ^ v586;
  unsigned int v261 = v254 ^ v586 ^ 0x730032AA;
  uint64_t v262 = (uint64_t)*(&off_100079130 + (v242 & 0x39CF440F));
  unsigned int v263 = (v259 - 747033579 - ((2 * v259) & 0xA6F2582A)) ^ *(_DWORD *)(v262
                                                                    + 4LL * ((v254 ^ v586) ^ 0xAAu));
  unsigned int v264 = ((((unsigned __int16)(WORD2(a49) ^ v257) >> 8) ^ 0xF0)
        - 1101829684
        - 2
        * ((((HIDWORD(a49) ^ v257) >> 8) ^ 0x50F9F0) & 0xCF ^ ((HIDWORD(a49) ^ v257) >> 8) & 3)) ^ *(_DWORD *)(v258 + 4LL * (((unsigned __int16)(WORD2(a49) ^ v257) >> 8) ^ 0x9Du));
  unsigned int v265 = v264 - 367616239 - ((2 * v264) & 0xD42D3E22);
  uint64_t v266 = (uint64_t)*(&off_100079130 + v242 - 859);
  int v267 = *(_DWORD *)(v266 + 4LL * (((v244 ^ v585) >> 16) ^ 0x68u));
  HIDWORD(v269) = v267 ^ 0xEA2;
  LODWORD(v269) = v267 ^ 0xBEBBE000;
  int v268 = v269 >> 12;
  int v270 = *(_DWORD *)(v266 + 4LL * BYTE2(v260));
  HIDWORD(v269) = v270 ^ 0xEA2;
  LODWORD(v269) = v270 ^ 0xBEBBE000;
  unsigned int v271 = (char *)*(&off_100079130 + (v242 ^ 0x3BC)) - 12;
  int v272 = v265 ^ *(_DWORD *)&v271[4 * (((v597 ^ HIDWORD(v585)) >> 24) ^ 0xB7)] ^ (v269 >> 12);
  int v273 = *(_DWORD *)(v266 + 4LL * (((HIDWORD(a49) ^ v257) >> 16) ^ 0xF9u));
  HIDWORD(v269) = v273 ^ 0xEA2;
  LODWORD(v269) = v273 ^ 0xBEBBE000;
  int v274 = *(_DWORD *)(v262 + 4LL * ((v247 ^ BYTE4(v585)) ^ 0xFBu)) ^ ((unsigned __int16)(v244 ^ v585) >> 8) ^ *(_DWORD *)(v258 + 4LL * (((unsigned __int16)(v244 ^ v585) >> 8) ^ 0x23u)) ^ 0x6D2A4597 ^ (v269 >> 12);
  LODWORD(v247) = *(_DWORD *)(v266 + 4LL * (((v597 ^ HIDWORD(v585)) >> 16) ^ 0x1Cu));
  HIDWORD(v269) = v247 ^ 0xEA2;
  LODWORD(v269) = v247 ^ 0xBEBBE000;
  LODWORD(v247) = *(_DWORD *)&v271[4 * (((v244 ^ v585) >> 24) ^ 0xF6)] ^ (BYTE1(v261) - 1101829684 - ((v260 >> 7) & 0x198)) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v261) ^ 0x6Du)) ^ ((v269 >> 12) - 367616239 - ((2 * (v269 >> 12)) & 0xD42D3E22));
  unsigned int v275 = HIDWORD(v574) ^ v268 ^ *(_DWORD *)&v271[4 * (((HIDWORD(a49) ^ v257) >> 24) ^ 0x50)] ^ (v263 - 367616239 - ((2 * v263) & 0xD42D3E22));
  unsigned int v276 = v574 ^ *(_DWORD *)(v262 + 4LL * ((BYTE4(a49) ^ v257) ^ 0x9Bu)) ^ (v247
                                                                                          - 747033579
                                                                                          - ((2 * v247) & 0xA6F2582A));
  LODWORD(v247) = HIDWORD(v571) ^ *(_DWORD *)(v262 + 4LL * ((v244 ^ v585) ^ 0x5Fu)) ^ (v272 - 747033579 - ((2 * v272) & 0xA6F2582A));
  unsigned int v277 = HIDWORD(v493) ^ *(_DWORD *)&v271[4 * HIBYTE(v261)] ^ (v274 - 367616239 - ((2 * v274) & 0xD42D3E22));
  unsigned int v278 = v275 ^ 0xF9388C2F;
  int v279 = *(_DWORD *)(v266 + 4LL * ((v275 ^ 0xF9388C2F) >> 16));
  HIDWORD(v269) = v279 ^ 0xEA2;
  LODWORD(v269) = v279 ^ 0xBEBBE000;
  int v280 = v269 >> 12;
  int v281 = *(_DWORD *)(v266 + 4LL * (BYTE2(v276) ^ 6u));
  HIDWORD(v269) = v281 ^ 0xEA2;
  LODWORD(v269) = v281 ^ 0xBEBBE000;
  int v282 = v269 >> 12;
  int v283 = *(_DWORD *)(v266 + 4LL * (BYTE2(v247) ^ 0x66u));
  HIDWORD(v269) = v283 ^ 0xEA2;
  LODWORD(v269) = v283 ^ 0xBEBBE000;
  int v284 = (v269 >> 12) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v277) ^ 5u)) ^ ((BYTE1(v277) ^ 0x68)
                                                                      - 1101829684
                                                                      - 2
                                                                      * (((v277 >> 8) ^ 0x42BD68) & 0xDD ^ (v277 >> 8) & 0x11));
  unsigned int v285 = (v280 - 747033579 - ((2 * v280) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4LL * (v247 ^ 0xB6u));
  unsigned int v286 = (v284 - 747033579 - ((2 * v284) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4LL * (v275 ^ 0x61u));
  unsigned int v287 = (BYTE1(v278) - 1101829684 - ((v278 >> 7) & 0x198)) ^ 0xD678EAEF ^ *(_DWORD *)(v258 + 4LL
                                                                                            * (BYTE1(v278) ^ 0x6Du));
  int v288 = *(_DWORD *)&v271[4 * (BYTE3(v247) ^ 0x43)] ^ 0x480CC4AF;
  int v289 = v287 + v288 - 2 * (v287 & v288);
  int v290 = *(_DWORD *)(v266 + 4LL * (BYTE2(v277) ^ 0xBDu));
  HIDWORD(v269) = v290 ^ 0xEA2;
  LODWORD(v269) = v290 ^ 0xBEBBE000;
  unsigned int v291 = *(_DWORD *)&v271[4 * HIBYTE(v278)] ^ (v282 - 367616239 - ((2 * v282) & 0xD42D3E22));
  unsigned int v292 = (v291 - 747033579 - ((2 * v291) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4LL * (v277 ^ 0xABu));
  unsigned int v293 = *(_DWORD *)&v271[4 * (HIBYTE(v277) ^ 0x42)] ^ v591 ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v276) ^ 0xFFu)) ^ ((BYTE1(v276) ^ 0x92) - 1101829684 - ((2 * ((v276 >> 8) ^ 0xA00692)) & 0x198)) ^ (v285 - 367616239 - ((2 * v285) & 0xD42D3E22));
  LOBYTE(v277) = BYTE1(v247) ^ 0x54;
  LODWORD(v247) = v493 ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v247) ^ 0x39u)) ^ (v292 - 1101829684 - ((2 * v292) & 0x7CA6D398));
  int v294 = v571 ^ *(_DWORD *)&v271[4 * (HIBYTE(v276) ^ 0xA0)] ^ (v286 - 367616239 - ((2 * v286) & 0xD42D3E22));
  unsigned int v295 = HIDWORD(v566) ^ *(_DWORD *)(v262 + 4LL * (v276 ^ 0x8Eu)) ^ ((v289 ^ (v269 >> 12))
                                                                                    - 747033579
                                                                                    - ((2 * (v289 ^ (v269 >> 12))) & 0xA6F2582A));
  int v296 = *(_DWORD *)(v266 + 4LL * (BYTE2(v295) ^ 0x79u));
  HIDWORD(v269) = v296 ^ 0xEA2;
  LODWORD(v269) = v296 ^ 0xBEBBE000;
  BYTE1(v276) = BYTE1(v294) ^ 0x68;
  int v297 = ((v269 >> 12) - 367616239 - ((2 * (v269 >> 12)) & 0xD42D3E22)) ^ *(_DWORD *)&v271[4
                                                                                         * ((v294 ^ 0x2261685Eu) >> 24)];
  int v298 = ((BYTE1(v295) ^ 0xD0) - 1101829684 - 2 * (((v295 >> 8) ^ 0x679D0) & 0xCD ^ (v295 >> 8) & 1)) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v295) ^ 0xBDu));
  unsigned int v299 = (v298 - 747033579 - ((2 * v298) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4LL * (v293 ^ 0x76u));
  unsigned int v300 = ((BYTE1(v247) ^ 0xEC)
        - 1101829684
        - 2 * (((v247 >> 8) ^ 0xE5FEC) & 0xCD ^ (v247 >> 8) & 1)) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v247) ^ 0x81u));
  int v301 = *(_DWORD *)(v266 + 4LL * (BYTE2(v247) ^ 0x5Fu));
  HIDWORD(v269) = v301 ^ 0xEA2;
  LODWORD(v269) = v301 ^ 0xBEBBE000;
  int v302 = v269 >> 12;
  HIDWORD(v269) = *(_DWORD *)(v262 + 4LL * (v294 ^ 0x5Eu)) ^ 0x3A6E0B9D;
  LODWORD(v269) = HIDWORD(v269);
  int v303 = (v269 >> 28) ^ __ROR4__( *(_DWORD *)&v271[4 * (HIBYTE(v295) ^ 6)] ^ 0x7462B151 ^ (v300 - 367616239 - ((2 * v300) & 0xD42D3E22)),  28);
  unsigned int v304 = (v302 - 367616239 - ((2 * v302) & 0xD42D3E22)) ^ *(_DWORD *)&v271[4 * (HIBYTE(v293) ^ 0xD2)];
  unsigned int v305 = (v304 - 747033579 - ((2 * v304) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4LL * (v295 ^ 0x4Cu));
  int v306 = *(_DWORD *)(v266 + 4LL * (BYTE2(v294) ^ 0x1Bu));
  HIDWORD(v269) = v306 ^ 0xEA2;
  LODWORD(v269) = v306 ^ 0xBEBBE000;
  int v307 = v269 >> 12;
  int v308 = ((v293 >> 8) ^ 0xD2CCC0) & 0xCE ^ (v293 >> 8) & 2;
  int v309 = BYTE1(v293) ^ 0xC0;
  int v310 = *(_DWORD *)(v266 + 4LL * (BYTE2(v293) ^ 0xCCu));
  HIDWORD(v269) = v310 ^ 0xEA2;
  LODWORD(v269) = v310 ^ 0xBEBBE000;
  int v311 = v443 ^ HIDWORD(v446) ^ (v269 >> 12) ^ __ROR4__(v303 ^ 0x78071371, 4);
  LOBYTE(v310) = v247 ^ v277;
  unsigned int v312 = HIDWORD(v562) ^ *(_DWORD *)&v271[4 * (BYTE3(v247) ^ 0xE)] ^ v307 ^ (v299 - 367616239 - ((2 * v299) & 0xD42D3E22));
  unsigned int v313 = v562 ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v276) ^ 0x6Du)) ^ (v305 - 1101829684 - ((2 * v305) & 0x7CA6D398));
  unsigned int v314 = HIDWORD(v556) ^ (v309 - 1101829684 - 2 * v308) ^ *(_DWORD *)(v262 + 4LL * (v310 ^ 0xCAu)) ^ *(_DWORD *)(v258 + 4LL * (v309 ^ 0x6Du)) ^ (v297 - 747033579 - ((2 * v297) & 0xA6F2582A));
  unsigned int v315 = BYTE1(v276) ^ 0x4552953C ^ v313;
  LODWORD(v247) = *(_DWORD *)(v266 + 4LL * BYTE2(v315));
  HIDWORD(v269) = v247 ^ 0xEA2;
  LODWORD(v269) = v247 ^ 0xBEBBE000;
  int v316 = v269 >> 12;
  BYTE1(v247) = BYTE1(v311) ^ 0xE7;
  int v317 = *(_DWORD *)(v266 + 4LL * ((v311 ^ 0x99FEE750) >> 16));
  HIDWORD(v269) = v317 ^ 0xEA2;
  LODWORD(v269) = v317 ^ 0xBEBBE000;
  int v318 = (v269 >> 12) - 747033579 - ((2 * (v269 >> 12)) & 0xA6F2582A);
  int v319 = BYTE1(v312) ^ 0x29;
  int v320 = v319 - 1101829684 - 2 * (((v312 >> 8) ^ 0xA73B29) & 0xCE ^ (v312 >> 8) & 2);
  int v321 = *(_DWORD *)(v266 + 4LL * (BYTE2(v314) ^ 2u));
  HIDWORD(v269) = v321 ^ 0xEA2;
  LODWORD(v269) = v321 ^ 0xBEBBE000;
  int v322 = (BYTE1(v315) - 1101829684 - ((v315 >> 7) & 0x198)) ^ *(_DWORD *)(v262 + 4LL * (v312 ^ 0x72u)) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v315) ^ 0x6Du)) ^ v318;
  int v323 = *(_DWORD *)&v271[4 * (HIBYTE(v312) ^ 0xA7)] ^ (v269 >> 12);
  int v324 = *(_DWORD *)(v266 + 4LL * (BYTE2(v312) ^ 0x3Bu));
  int v325 = v323 ^ *(_DWORD *)(v262 + 4LL * v315);
  HIDWORD(v269) = v324 ^ 0xEA2;
  LODWORD(v269) = v324 ^ 0xBEBBE000;
  unsigned int v326 = v556 ^ ((BYTE1(v314) ^ 0xD9) - 1101829684 - ((2 * ((v314 >> 8) ^ 0x9802D9)) & 0x198)) ^ *(_DWORD *)(v262 + 4LL * (v311 ^ 0x1Eu)) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v314) ^ 0xB4u)) ^ (v269 >> 12) ^ *(_DWORD *)&v271[4 * (HIBYTE(v313) ^ 0x61)];
  unsigned int v327 = HIDWORD(v551) ^ *(_DWORD *)&v271[4 * (HIBYTE(v314) ^ 0x98)] ^ (v322 - 367616239 - ((2 * v322) & 0xD42D3E22));
  int v328 = v227 ^ v223 ^ *(_DWORD *)(v262 + 4LL * (v314 ^ 0x3Du)) ^ v320 ^ *(_DWORD *)&v271[4 * ((v311 ^ 0x99FEE750) >> 24)] ^ *(_DWORD *)(v258 + 4LL * (v319 ^ 0x6Du));
  int v329 = *(_DWORD *)(v266 + 4LL * (BYTE2(v326) ^ 0xF7u));
  HIDWORD(v269) = v329 ^ 0xEA2;
  LODWORD(v269) = v329 ^ 0xBEBBE000;
  int v330 = v269 >> 12;
  int v331 = *(_DWORD *)(v258 + 4LL * (((unsigned __int16)(v311 ^ 0xE750) >> 8) ^ 0x6Du));
  unsigned int v332 = v328 ^ v316;
  int v333 = HIDWORD(v545) ^ v331;
  int v334 = *(_DWORD *)(v266 + 4LL * (BYTE2(v332) ^ 0x87u));
  unsigned int v335 = v333 ^ ((v325 ^ 0x396FB304) - 1101829684 - 2 * ((v325 ^ 0x396FB304) & 0x3E5369CE ^ v325 & 2));
  HIDWORD(v269) = v334 ^ 0xEA2;
  LODWORD(v269) = v334 ^ 0xBEBBE000;
  int v336 = BYTE1(v332) ^ 0x4C;
  int v337 = v336 - 1101829684 - 2 * (((v332 >> 8) ^ 0xEC874C) & 0xDE ^ (v332 >> 8) & 0x12);
  unsigned int v338 = v326 ^ 0xDA8D2242;
  int v339 = *(_DWORD *)(v262 + 4LL * ((v335 ^ BYTE1(v247)) ^ 0x41u)) ^ (((unsigned __int16)(v326 ^ 0x2242) >> 8)
                                                                                    - 1101829684
                                                                                    - ((v326 >> 7) & 0x198)) ^ *(_DWORD *)(v258 + 4LL * (((unsigned __int16)(v326 ^ 0x2242) >> 8) ^ 0x6Du)) ^ ((v269 >> 12) - 747033579 - ((2 * (v269 >> 12)) & 0xA6F2582A));
  int v340 = *(_DWORD *)(v266 + 4LL * (BYTE2(v335) ^ 0x81u));
  HIDWORD(v269) = v340 ^ 0xEA2;
  LODWORD(v269) = v340 ^ 0xBEBBE000;
  int v341 = ((v269 >> 12) - 367616239 - ((2 * (v269 >> 12)) & 0xD42D3E22)) ^ *(_DWORD *)&v271[4 * HIBYTE(v338)];
  unsigned int v342 = (v341 - 747033579 - ((2 * v341) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4LL * (v332 ^ 1u));
  LODWORD(v247) = *(_DWORD *)(v262 + 4LL * (v327 ^ 0xFCu)) ^ (v330
                                                                             - 747033579
                                                                             - ((2 * v330) & 0xA6F2582A)) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v335) ^ 0xCDu)) ^ ((BYTE1(v335) ^ 0xA0) - 1101829684 - 2 * (((v335 >> 8) ^ 0x6881A0) & 0xDE ^ (v335 >> 8) & 0x12));
  unsigned int v343 = *(_DWORD *)(v266 + 4LL * (BYTE2(v327) ^ 0xC6u));
  LODWORD(v269) = __ROR4__((v343 >> 12) ^ 0x266369C, 17) ^ 0xEE910136;
  HIDWORD(v269) = v269;
  unsigned int v344 = v545 ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v327) ^ 0x75u)) ^ (v342 - 1101829684 - ((2 * v342) & 0x7CA6D398));
  LODWORD(v247) = HIDWORD(v541) ^ *(_DWORD *)&v271[4 * (HIBYTE(v332) ^ 0xEC)] ^ (v247
                                                                               - 367616239
                                                                               - ((2 * v247) & 0xD42D3E22));
  int v345 = v541 ^ *(_DWORD *)&v271[4 * (HIBYTE(v327) ^ 0x5A)] ^ (v339 - 367616239 - ((2 * v339) & 0xD42D3E22));
  unsigned int v346 = HIDWORD(v535) ^ v337 ^ *(_DWORD *)(v262 + 4LL * v338) ^ *(_DWORD *)(v258 + 4LL * (v336 ^ 0x6Du)) ^ *(_DWORD *)&v271[4 * (HIBYTE(v335) ^ 0x68)] ^ ((v269 >> 15) + (v343 << 20));
  int v347 = ((BYTE1(v344) ^ 0x9D) - 1101829684 - 2 * (((v344 >> 8) ^ 0xC2489D) & 0xCE ^ (v344 >> 8) & 2)) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v344) ^ 0xF0u));
  unsigned int v348 = *(_DWORD *)(v266 + 4LL * (BYTE2(v247) ^ 0x8Fu));
  unsigned int v349 = *(_DWORD *)(v262 + 4LL * (v346 ^ 0x8Eu)) ^ (v348 << 20) ^ (v348 >> 12) ^ 0xEA2BEBBE ^ (v347 - 747033579 - ((2 * v347) & 0xA6F2582A));
  int v350 = *(_DWORD *)(v266 + 4LL * ((v345 ^ 0xCFB8D782) >> 16));
  HIDWORD(v269) = v350 ^ 0xEA2;
  LODWORD(v269) = v350 ^ 0xBEBBE000;
  int v351 = ((v269 >> 12) - 747033579 - ((2 * (v269 >> 12)) & 0xA6F2582A)) ^ *(_DWORD *)(v262
                                                                                    + 4LL
                                                                                    * ((v344 ^ BYTE1(v327)) ^ 0x3Fu));
  unsigned int v352 = v349 - 367616239 - ((2 * v349) & 0xD42D3E22);
  unsigned int v353 = v351 - 367616239 - ((2 * v351) & 0xD42D3E22);
  int v354 = BYTE1(v247) ^ 0xD9;
  unsigned int v355 = v354 - 1101829684 - 2 * (((v247 >> 8) ^ 0xC78FD9) & 0xCE ^ (v247 >> 8) & 2);
  int v356 = *(_DWORD *)(v266 + 4LL * (BYTE2(v344) ^ 0x48u));
  HIDWORD(v269) = v356 ^ 0xEA2;
  LODWORD(v269) = v356 ^ 0xBEBBE000;
  int v357 = ((BYTE1(v346) ^ 0xD3) - 1101829684 - ((2 * ((v346 >> 8) ^ 0xF5C4D3)) & 0x198)) ^ *(_DWORD *)(v262 + 4LL * (v345 ^ 0xCCu)) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v346) ^ 0xBEu)) ^ ((v269 >> 12) - 747033579 - ((2 * (v269 >> 12)) & 0xA6F2582A));
  int v358 = *(_DWORD *)(v266 + 4LL * (BYTE2(v346) ^ 0xC4u));
  HIDWORD(v269) = v358 ^ 0xEA2;
  LODWORD(v269) = v358 ^ 0xBEBBE000;
  unsigned int v359 = v535 ^ (((unsigned __int16)(v345 ^ 0xD782) >> 8)
               - 1101829684
               - (((v345 ^ 0xCFB8D782) >> 7) & 0x198)) ^ *(_DWORD *)(v262 + 4LL * (v247 ^ 0x50u)) ^ *(_DWORD *)(v258 + 4LL * (((unsigned __int16)(v345 ^ 0xD782) >> 8) ^ 0x6Du)) ^ (v269 >> 12) ^ *(_DWORD *)&v271[4 * (HIBYTE(v344) ^ 0xC2)];
  LODWORD(v247) = HIDWORD(v529) ^ *(_DWORD *)&v271[4 * (BYTE3(v247) ^ 0xC7)] ^ (v357
                                                                              - 367616239
                                                                              - ((2 * v357) & 0xD42D3E22));
  unsigned int v360 = v529 ^ *(_DWORD *)&v271[4 * ((v345 ^ 0xCFB8D782) >> 24)] ^ v352;
  unsigned int v361 = HIDWORD(v523) ^ v355 ^ *(_DWORD *)&v271[4 * (HIBYTE(v346) ^ 0xF5)] ^ *(_DWORD *)(v258 + 4LL * (v354 ^ 0x6Du)) ^ v353;
  int v362 = *(_DWORD *)(v266 + 4LL * (BYTE2(v247) ^ 0xE6u));
  HIDWORD(v269) = v362 ^ 0xEA2;
  LODWORD(v269) = v362 ^ 0xBEBBE000;
  int v363 = v269 >> 12;
  int v364 = *(_DWORD *)(v266 + 4LL * (BYTE2(v360) ^ 0x1Cu));
  unsigned int v365 = (((unsigned __int16)(v361 ^ 0xCCA2) >> 8) - 1101829684 - (((v361 ^ 0x33C8CCA2) >> 7) & 0x198)) ^ *(_DWORD *)(v258 + 4LL * (((unsigned __int16)(v361 ^ 0xCCA2) >> 8) ^ 0x6Du));
  HIDWORD(v269) = v364 ^ 0xEA2;
  LODWORD(v269) = v364 ^ 0xBEBBE000;
  int v366 = (v269 >> 12) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v247) ^ 0xD9u)) ^ ((BYTE1(v247) ^ 0xB4)
                                                                         - 1101829684
                                                                         - 2
                                                                         * (((v247 >> 8) ^ 0x4FE6B4) & 0xCD ^ (v247 >> 8) & 1));
  unsigned int v367 = (v366 - 747033579 - ((2 * v366) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4LL * (v359 ^ 0xEEu));
  unsigned int v368 = (v365 - 747033579 - ((2 * v365) & 0xA6F2582A)) ^ *(_DWORD *)(v262
                                                                    + 4LL
                                                                    * ((v529 ^ v271[4 * ((v345 ^ 0xCFB8D782) >> 24)] ^ v352) ^ 0x3Au));
  unsigned int v369 = *(_DWORD *)(v262 + 4LL * (v361 ^ 0xA2u)) ^ (((unsigned __int16)(v359 ^ 0xA7EE) >> 8)
                                                                    - 1101829684
                                                                    - (((v359 ^ 0x205CA7EE) >> 7) & 0x198)) ^ *(_DWORD *)(v258 + 4LL * (((unsigned __int16)(v359 ^ 0xA7EE) >> 8) ^ 0x6Du)) ^ (v363 - 747033579 - ((2 * v363) & 0xA6F2582A));
  int v370 = *(_DWORD *)(v262 + 4LL * (v247 ^ 0x96u));
  HIDWORD(v269) = v370 ^ 0x13792C15;
  LODWORD(v269) = v370 ^ 0xC0000000;
  HIDWORD(v269) = (v269 >> 29) ^ 0x6615DA09;
  LODWORD(v269) = HIDWORD(v269);
  int v371 = (v269 >> 3) - 1101829684 - ((2 * (v269 >> 3)) & 0x7CA6D398);
  int v372 = *(_DWORD *)(v266 + 4LL * ((v359 ^ 0x205CA7EE) >> 16));
  HIDWORD(v269) = v372 ^ 0xEA2;
  LODWORD(v269) = v372 ^ 0xBEBBE000;
  int v373 = v269 >> 12;
  int v374 = *(_DWORD *)(v266 + 4LL * ((v361 ^ 0x33C8CCA2) >> 16));
  HIDWORD(v269) = v374 ^ 0xEA2;
  LODWORD(v269) = v374 ^ 0xBEBBE000;
  unsigned int v375 = v523 ^ *(_DWORD *)&v271[4 * (HIBYTE(v361) ^ 0x17)] ^ (v367 - 367616239 - ((2 * v367) & 0xD42D3E22));
  int v376 = BYTE1(v360);
  int v377 = v371 ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v360) ^ 0xD1u)) ^ (v269 >> 12);
  unsigned int v378 = *(_DWORD *)&v271[4 * (HIBYTE(v359) ^ 4)] ^ v590 ^ (v377 - 367616239 - ((2 * v377) & 0xD42D3E22));
  unsigned int v379 = HIDWORD(v518) ^ *(_DWORD *)&v271[4 * (BYTE3(v247) ^ 0x4F)] ^ v373 ^ (v368
                                                                            - 367616239
                                                                            - ((2 * v368) & 0xD42D3E22));
  LODWORD(v247) = v518 ^ *(_DWORD *)&v271[4 * (HIBYTE(v360) ^ 0x1B)] ^ (v369 - 367616239 - ((2 * v369) & 0xD42D3E22));
  int v380 = *(_DWORD *)(v266 + 4LL * (BYTE2(v247) ^ 0x7Eu));
  HIDWORD(v269) = v380 ^ 0xEA2;
  LODWORD(v269) = v380 ^ 0xBEBBE000;
  int v381 = v269 >> 12;
  int v382 = *(_DWORD *)(v266 + 4LL * (BYTE2(v379) ^ 1u));
  HIDWORD(v269) = v382 ^ 0xEA2;
  LODWORD(v269) = v382 ^ 0xBEBBE000;
  int v383 = ((v269 >> 12) - 747033579 - ((2 * (v269 >> 12)) & 0xA6F2582A)) ^ *(_DWORD *)(v262
                                                                                    + 4LL
                                                                                    * (v375 ^ 0xC6u));
  int v384 = ((BYTE1(v375) ^ 0x71) - 1101829684 - ((2 * ((v375 >> 8) ^ 0xF25B71)) & 0x198)) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v375) ^ 0x1Cu));
  unsigned int v385 = (v384 - 367616239 - ((2 * v384) & 0xD42D3E22)) ^ *(_DWORD *)&v271[4 * (HIBYTE(v379) ^ 0x1F)];
  int v386 = *(_DWORD *)(v266 + 4LL * (BYTE2(v375) ^ 0x5Bu));
  HIDWORD(v269) = v386 ^ 0xEA2;
  LODWORD(v269) = v386 ^ 0xBEBBE000;
  int v387 = v269 >> 12;
  unsigned int v388 = v385 - 747033579 - ((2 * v385) & 0xA6F2582A);
  unsigned int v389 = v376 ^ 0x73F4E0AF ^ v378;
  int v390 = *(_DWORD *)(v266 + 4LL * BYTE2(v389));
  HIDWORD(v269) = v390 ^ 0xEA2;
  LODWORD(v269) = v390 ^ 0xBEBBE000;
  int v391 = v269 >> 12;
  HIDWORD(v269) = v381 ^ ((BYTE1(v379) ^ 0x81) - 1101829684 - ((2 * ((v379 >> 8) ^ 0x1F0181)) & 0x198)) ^ 0xD678EAEF ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v379) ^ 0xECu));
  LODWORD(v269) = HIDWORD(v269);
  LODWORD(v269) = (v269 >> 11) ^ __ROR4__(*(_DWORD *)&v271[4 * (HIBYTE(v375) ^ 0xF2)] ^ 0x480CC4AF, 11) ^ 0xD490839A;
  HIDWORD(v269) = v269;
  unsigned int v392 = v455 ^ HIDWORD(v450) ^ *(_DWORD *)(v262 + 4LL * (v379 ^ 0xB8u)) ^ ((BYTE1(v247) ^ 0xAA)
                                                                                           - 1101829684
                                                                                           - 2
                                                                                           * (((v247 >> 8) ^ 0x967EAA) & 0xCD ^ (v247 >> 8) & 1)) ^ *(_DWORD *)&v271[4 * (HIBYTE(v378) ^ 0x57)] ^ v387 ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v247) ^ 0xC7u));
  unsigned int v393 = v513 ^ *(_DWORD *)&v271[4 * (BYTE3(v247) ^ 0x96)] ^ (BYTE1(v389) - 1101829684 - ((v389 >> 7) & 0x198)) ^ *(_DWORD *)(v258 + 4LL * (BYTE1(v389) ^ 0x6Du)) ^ (v383 - 367616239 - ((2 * v383) & 0xD42D3E22));
  unsigned int v394 = HIDWORD(v509) ^ *(_DWORD *)(v262 + 4LL * (v247 ^ 0x88u)) ^ v391 ^ v388;
  unsigned int v395 = v509 ^ *(_DWORD *)(v262 + 4LL * v389) ^ ((v269 >> 21)
                                                                 - 747033579
                                                                 - ((2 * (v269 >> 21)) & 0xA6F2582A));
  int v396 = *(_DWORD *)(v266 + 4LL * (BYTE2(v392) ^ 0x84u));
  HIDWORD(v269) = v396 ^ 0xEA2;
  LODWORD(v269) = v396 ^ 0xBEBBE000;
  int v397 = v269 >> 12;
  int v398 = *(_DWORD *)(v258 + 4LL * (BYTE1(v393) ^ 0x96u)) ^ ((BYTE1(v393) ^ 0xFB)
                                                          - 1101829684
                                                          - ((2 * ((v393 >> 8) ^ 0x3EA2FB)) & 0x198));
  unsigned int v399 = (v398 - 747033579 - ((2 * v398) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4LL * (v394 ^ 0x75u));
  int v400 = *(_DWORD *)(v266 + 4LL * (BYTE2(v393) ^ 0xA2u));
  HIDWORD(v269) = v400 ^ 0xEA2;
  LODWORD(v269) = v400 ^ 0xBEBBE000;
  int v401 = (((unsigned __int16)(v394 ^ 0xF075) >> 8) - 1101829684 - (((v394 ^ 0xB54AF075) >> 7) & 0x198)) ^ (v269 >> 12) ^ *(_DWORD *)(v258 + 4LL * (((unsigned __int16)(v394 ^ 0xF075) >> 8) ^ 0x6Du));
  int v402 = *(_DWORD *)&v271[4 * (HIBYTE(v392) ^ 0xFE)];
  unsigned int v403 = (v401 - 367616239 - ((2 * v401) & 0xD42D3E22)) ^ *(_DWORD *)&v271[4 * (HIBYTE(v395) ^ 0xED)];
  unsigned int v404 = v399 - 367616239 - ((2 * v399) & 0xD42D3E22);
  v395 ^= 0xC9AF1D8F;
  int v405 = BYTE1(v395);
  int v406 = BYTE1(v395) - 1101829684 - ((v395 >> 7) & 0x198);
  int v407 = *(_DWORD *)(v262 + 4LL * v395);
  int v408 = *(_DWORD *)(v262 + 4LL * (v392 ^ 0x6Bu));
  unsigned int v409 = *(_DWORD *)(v266 + 4LL * BYTE2(v395));
  LODWORD(v247) = *(_DWORD *)(v266 + 4LL * (BYTE2(v394) ^ 0x4Au));
  HIDWORD(v269) = v247 ^ 0xEA2;
  LODWORD(v269) = v247 ^ 0xBEBBE000;
  LODWORD(v266) = *(_DWORD *)(v258 + 4LL * (v405 ^ 0x6Du));
  int v410 = (v392 >> 8) ^ 0xFE8473;
  LODWORD(v25_Block_object_dispose(va, 8) = *(_DWORD *)(v258 + 4LL * (v410 ^ 0x6Du));
  int v411 = v410 - 1101829684 - ((2 * v410) & 0x198);
  unsigned int v412 = HIDWORD(v504) ^ *(_DWORD *)(v262 + 4LL * (v393 ^ 0x9Au)) ^ v397 ^ *(_DWORD *)&v271[4 * (HIBYTE(v394) ^ 0x91)] ^ v406 ^ v266;
  LODWORD(v266) = v504 ^ v411 ^ *(_DWORD *)&v271[4 * (HIBYTE(v393) ^ 0x3E)] ^ v258 ^ v407 ^ (v269 >> 12);
  unsigned int v413 = HIDWORD(v499) ^ v408 ^ (v403 - 747033579 - ((2 * v403) & 0xA6F2582A));
  LODWORD(v25_Block_object_dispose(va, 8) = v499 ^ v402 ^ (v409 >> 12) ^ (v409 << 20) ^ v404;
  int v414 = *(_DWORD *)(v61 - 124);
  v415 = (char *)*(&off_100079130 + v414 - 809) - 4;
  v416 = (char *)*(&off_100079130 + v414 - 792) - 4;
  LODWORD(v247) = *(_DWORD *)&v416[4
                                 * (((unsigned __int16)(v499 ^ v402 ^ (v409 >> 12) ^ v404) >> 8) ^ 0xC8)] ^ *(_DWORD *)&v415[4 * (v413 ^ 7)];
  int v417 = (v247 ^ 0x2636AA21) - 1507977308 - 2 * ((v247 ^ 0x2636AA21) & 0x261E17B4 ^ v247 & 0x10);
  LODWORD(v247) = *(_DWORD *)&v416[4 * (BYTE1(v412) ^ 0xC2)];
  v418 = (char *)*(&off_100079130 + (int)v480) - 4;
  int v419 = *(_DWORD *)&v416[4 * ((unsigned __int16)(v413 ^ 0x6F07) >> 8)];
  int v420 = v417 ^ *(_DWORD *)&v418[4 * (BYTE3(v266) ^ 0xB2)];
  LODWORD(v271) = *(_DWORD *)&v416[4 * ~(v266 >> 8)];
  int v421 = *(_DWORD *)&v418[4 * (HIBYTE(v413) ^ 0xEF)];
  LODWORD(v262) = *(_DWORD *)&v418[4 * (BYTE3(v258) ^ 0x77)];
  int v422 = *(_DWORD *)&v418[4 * (HIBYTE(v412) ^ 8)];
  v423 = (char *)*(&off_100079130 + v414 - 759) - 12;
  int v424 = *(_DWORD *)&v423[4 * (BYTE2(v258) ^ 0x97)];
  uint64_t v425 = *(unsigned int *)&v423[4 * (BYTE2(v413) ^ 0x2A)];
  uint64_t v426 = *(unsigned int *)&v423[4 * (BYTE2(v266) ^ 0x9B)];
  LODWORD(v423) = *(_DWORD *)&v423[4 * (BYTE2(v412) ^ 0xE4)] ^ (v420 + 1430988054 - ((2 * v420) & 0xAA964A2C));
  int v427 = *(_DWORD *)&v415[4 * (v412 ^ 0xD8)];
  LODWORD(v41_Block_object_dispose(va, 8) = *(_DWORD *)&v415[4 * (v266 ^ 0xC5)];
  LODWORD(v415) = *(_DWORD *)&v415[4 * (v258 ^ 0x65)];
  LODWORD(v25_Block_object_dispose(va, 8) = *(_DWORD *)(v61 - 140) ^ HIDWORD(v586) ^ ((_DWORD)v423 - ((2 * (_DWORD)v423) & 0x2C9828FA) - 1773398915);
  v428 = (char *)*(&off_100079130 + v414 - 651) - 8;
  *(_BYTE *)(*(void *)(v61 - 120) + 8LL) = v428[BYTE3(v258) ^ 0xD7LL] ^ 0xC2;
  LODWORD(v423) = ((v424 ^ 0x5C323448 ^ v419) - 1507977308 - ((2 * (v424 ^ 0x5C323448 ^ v419)) & 0x4C3C2F48)) ^ v422;
  LODWORD(v423) = ((_DWORD)v423 + 793754495 - ((2 * (_DWORD)v423) & 0x5E9F76FE)) ^ v418;
  LODWORD(v423) = *(_DWORD *)(v61 - 136) ^ v587 ^ ((_DWORD)v423 - ((2 * (_DWORD)v423) & 0xDAD2220C) + 1835602182);
  v429 = (char *)*(&off_100079130 + v414 - 760) - 12;
  *(_BYTE *)(*(void *)(v61 - 120) + *(void *)(v61 - 224)) = (v429[v423 ^ 0xC7LL] - 63) ^ 0x5F;
  v430 = (char *)*(&off_100079130 + SHIDWORD(a25)) - 12;
  int v431 = v430[BYTE1(v423) ^ 0x13LL];
  HIDWORD(v269) = v431 ^ 0x2A;
  LODWORD(v269) = (v431 ^ 0x40) << 24;
  *(_BYTE *)(*(void *)(v61 - 120) + 6LL) = (v269 >> 30) ^ 0x40;
  int v432 = ((v427 ^ 0x7A049E69 ^ v425) - 1507977308 - ((2 * (v427 ^ 0x7A049E69 ^ v425)) & 0x4C3C2F48)) ^ v262;
  unsigned int v433 = (v432 - ((2 * v432) & 0x12F222BC) + 158929246) ^ v271;
  unsigned int v434 = *(_DWORD *)(v61 - 132) ^ HIDWORD(v587) ^ (v433 - ((2 * v433) & 0xCF7B7D72) - 406995271);
  int v435 = v430[BYTE1(v434)];
  HIDWORD(v269) = v435 ^ 0x2A;
  LODWORD(v269) = (v435 ^ 0x40) << 24;
  *(_BYTE *)(*(void *)(v61 - 120) + *(void *)(v61 - 216)) = (v269 >> 30) ^ 0x7E;
  v436 = (char *)*(&off_100079130 + v414 - 650) - 8;
  *(_BYTE *)(*(void *)(v61 - 120) + *(void *)(v61 - 256)) = v436[BYTE2(v258) ^ 0xFBLL] ^ 0xDD;
  int v437 = ((v247 ^ 0xAF6706FA ^ v421) + 1430988054 - ((2 * (v247 ^ 0xAF6706FA ^ v421)) & 0xAA964A2C)) ^ v426;
  unsigned int v438 = v415 ^ (v437 + 793754495 - ((2 * v437) & 0x5E9F76FE));
  unsigned int v439 = *(_DWORD *)(v61 - 128) ^ v588 ^ (v438 - ((2 * v438) & 0x8B3C385C) + 1167989806);
  *(_BYTE *)(*(void *)(v61 - 120) + *(void *)(v61 - 176)) = v436[BYTE2(v439) ^ 0xB8LL] ^ 0xE;
  *(_BYTE *)(*(void *)(v61 - 120) + *(void *)(v61 - 248)) = (v429[v258 ^ 0x1BLL] - 63) ^ 0x7D;
  *(_BYTE *)(*(void *)(v61 - 120) + *(void *)(v61 - 232)) = v436[BYTE2(v423) ^ 3LL] ^ 0x70;
  *(_BYTE *)(*(void *)(v61 - 120) + *(void *)(v61 - 192)) = v428[(v423 >> 24) ^ 0x6DLL] ^ 0x3A;
  LODWORD(v423) = v430[BYTE1(v258) ^ 0x92LL];
  HIDWORD(v269) = v423 ^ 0x2A;
  LODWORD(v269) = (v423 ^ 0x40) << 24;
  *(_BYTE *)(*(void *)(v61 - 120) + *(void *)(v61 - 160)) = (v269 >> 30) ^ 0xD2;
  uint64_t v440 = *(void *)(v61 - 208);
  *(_BYTE *)(*(void *)(v61 - 120) + v440) = v428[HIBYTE(v434) ^ 0x53LL] ^ 0xD6;
  *(_BYTE *)(*(void *)(v61 - 120) + *(void *)(v61 - 184)) = (v429[v434 ^ 0x95LL] - 63) ^ 0xAF;
  LOBYTE(v423) = v429[v439 ^ 0x64LL];
  uint64_t v441 = *(void *)(v61 - 120);
  *(_BYTE *)(v441 + *(void *)(v61 - 240)) = ((_BYTE)v423 - 63) ^ 0x27;
  *(_BYTE *)(v441 + *(void *)(v61 - 168)) = v428[HIBYTE(v439) ^ 0x6ELL] ^ 0x40;
  LODWORD(v423) = v430[BYTE1(v439) ^ 0x1FLL];
  HIDWORD(v269) = v423 ^ 0x2A;
  LODWORD(v269) = (v423 ^ 0x40) << 24;
  *(_BYTE *)(v441 + *(void *)(v61 - 200)) = (v269 >> 30) ^ 0x58;
  *(_BYTE *)(v441 + *(void *)(v61 - 152)) = v436[BYTE2(v434) ^ 0xC8LL] ^ 0x5F;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, unint64_t))(a57 + 8LL * ((1692 * ((((_DWORD)v440 - 1210073429 - 2 * (((_DWORD)v440 + 16) & 0x37DFBE9F)) ^ 0xB7DFBE9B) < a55)) ^ (v414 - 380))))( v430,  793754495LL,  42LL,  2861976108LL,  v426,  1430988054LL,  1587508990LL,  v425,  v443,  v444,  v445,  v446,  v448,  v450,  v451,  v452,  v455,  v457,  v461,  v464,  v467,  v471,  v475,  a24,  a25,  v480,  v486,  v493,  v499,  v504,  v509,  v513,  v518,  v523,  v529,  v535,  v541,  v545,  v551,  v556,  v562,  v566,  v571,  v574,  v578,  v580,  v582,  v584,  a49,
           v585,
           v586,
           v587);
}

void sub_10004EA74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57,int a58,int a59,int a60)
{
  *(_DWORD *)(v60 - 12_Block_object_dispose(va, 8) = a57 ^ 0x9EAC4702;
  *(_DWORD *)(v60 - 140) = a59 ^ 0x2D1575D2;
  *(_DWORD *)(v60 - 132) = a60 ^ 0x93AB7741;
  *(_DWORD *)(v60 - 136) = a58 ^ 0x94358E1A;
  JUMPOUT(0x10004CD5CLL);
}

uint64_t sub_10004EAC8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * (a7 ^ (1816 * (v7 != a3))))
                            - ((a7 + 1721561428) & 0x99630FFE)
                            + 866LL))();
}

uint64_t sub_10004EB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v9
                                                                      + 8LL
                                                                      * (int)((((((a7 + 1714580835) ^ 0x66326F76) & v7) != 0)
                                                                             * ((a7 + 1714580835) & 0x99CD93EF ^ 0x362)) | (a7 + 389))))( a1,  a2,  a3,  (v8 - a3));
}

uint64_t sub_10004EB54( int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  *(_DWORD *)(v65 - 12_Block_object_dispose(va, 8) = v56;
  *(_DWORD *)(v65 - 124) = v63;
  int v66 = (a7 - 193) | 0x50;
  unsigned int v67 = (v66 ^ 0xFFFFFE2D) & v56;
  int v68 = -a3;
  *(_DWORD *)(v65 - 132) = v67;
  char v69 = v61 + a2 + a1;
  uint64_t v70 = (v68 + a2 + a1 + v62);
  v72.val[0].i64[0] = ((_BYTE)v68 + (_BYTE)a2 + (_BYTE)a1 + (_BYTE)v62) & 0xF;
  v72.val[0].i64[1] = ((_BYTE)v68 + v69 + 10) & 0xF;
  v72.val[1].i64[0] = ((_BYTE)v68 + v69 + 9) & 0xF;
  v72.val[1].i64[1] = ((_BYTE)v68 + v60 + ((((a7 + 63) | 0x50) + 70) ^ 3)) & 0xF;
  v72.val[2].i64[0] = ((_BYTE)v68 + v69 + 7) & 0xF;
  v72.val[2].i64[1] = ((_BYTE)v68 + v69 + 6) & 0xF;
  v72.val[3].i64[0] = ((_BYTE)v68 + v69 + 5) & 0xF;
  v72.val[3].i64[1] = ((_BYTE)v68 + v69 + 4) & 0xF;
  *(int8x8_t *)(v64 - 7 + v70) = vrev64_s8( veor_s8( veor_s8( vrev64_s8( veor_s8( veor_s8(*(int8x8_t *)(v64 - 7 + v70), *(int8x8_t *)(v58 + (v70 & 0xF) - 7)),  veor_s8( *(int8x8_t *)(v59 + (v70 & 0xF) - 7),  *(int8x8_t *)(v57 + (v70 & 0xF) - 7)))),  (int8x8_t)0x3232323232323232LL),  vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8(v72, (int8x16_t)xmmword_100061B70),  (int8x8_t)0x505050505050505LL)));
  return (*(uint64_t (**)(__n128))(a56 + 8LL * ((915 * (v68 != 8 - v67)) ^ v66)))((__n128)xmmword_100061B70);
}

void sub_10004EC98()
{
}

uint64_t sub_10004ECC0()
{
}

uint64_t sub_10004ECFC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v11 = (a4 - 1802685205);
  *(_BYTE *)(v9 + v11) ^= *(_BYTE *)(v7 + (v11 & 0xF)) ^ *(_BYTE *)(v8 + (v11 & 0xF)) ^ *(_BYTE *)(v6 + (v11 & 0xF)) ^ (5 * (v11 & 0xF)) ^ 0x32;
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * ((998 * (a4 - 1 == v5)) ^ (a5 - 369))) - 12LL))();
}

void sub_10004ED64()
{
  if (v0 == 2010122275) {
    int v1 = 1645153785;
  }
  else {
    int v1 = -1645193695;
  }
  *(_DWORD *)(v2 + 40) = v1;
}

void Mib5yocT( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    BOOL v8 = a3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v12 = !v8 && a6 != 0 && a7 != 0 && a8 != 0;
  __asm { BR              X8 }

uint64_t sub_10004EE64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, _DWORD *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, int a21, unsigned int a22)
{
  *a6 = 0LL;
  *a7 = 0;
  a22 = 108757529
  uint64_t v27 = v22;
  uint64_t v25 = sub_10005A350(&a21);
  return ((uint64_t (*)(uint64_t))(*(void *)(v27 + 8LL * ((1797 * (a21 == v24)) ^ v23)) - 4LL))(v25);
}

uint64_t sub_10004EF04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, unint64_t *a21, unsigned int a22, unsigned int a23, int a24)
{
  unsigned int v24 = 1759421093 * ((&a21 + 2130158787 - 2 * (&a21 & 0x7EF7A4C3)) ^ 0xCD8A1497);
  a24 = v24 ^ 0x18F94B49;
  HIDWORD(a21) = v24 ^ 0x771B5177;
  a22 = v24 + 1806;
  LODWORD(a21) = v24 ^ 0x7FA6CEE2;
  sub_100021AC0((uint64_t)&a21);
  LODWORD(a11) = a23;
  a23 = 1307 - 460628867 * ((((2 * &a21) | 0x5259E7E8) - &a21 + 1456671756) ^ 0xE5BA7189);
  a21 = &STACK[0x4BD26FD1213425D9];
  sub_100035EF0((uint64_t)&a21);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a14 + 8LL * ((27 * (a22 != 1645153785)) ^ 0x16Fu)) - 4LL))( v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  a9,  a10,  a11,  a12,  a13,  a14);
}

uint64_t sub_10004F03C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, int a21, int a22, uint64_t a23, unsigned int a24, uint64_t a25)
{
  int v32 = 87 * v25;
  unsigned int v33 = 1178560073
      * ((-1996209345 - (&a21 | 0x8904433F) + (&a21 | 0x76FBBCC0)) ^ 0xCC6FC4A2);
  a23 = a16;
  a24 = (87 * v25 + 43) ^ v33;
  a22 = (v30 ^ 0xDBFDF3FD) + v33 + 1954504252 + ((((87 * v25 - 937) | 0x160) - 1208228218) & (2 * v30));
  sub_100045F9C((uint64_t)&a21);
  a24 = 87 * v25
  a23 = a16;
  a25 = v29;
  ((void (*)(int *))((char *)*(&off_100079130 + 87 * v25 - 926) - 12))(&a21);
  unsigned int v34 = 1178560073 * (&a21 ^ 0xBA947862);
  a23 = a16;
  a24 = (v32 + 43) ^ v34;
  a22 = (v28 ^ 0x7D7D52F9) + v34 - 754974912 + ((v28 << (68 * (v32 ^ 0xB2) + 5)) & 0xFAFAA5F2);
  sub_100045F9C((uint64_t)&a21);
  a25 = v26;
  a22 = v34 + v32 + 332;
  a24 = v34 ^ ((v27 ^ 0xBFEF9D6F) + 1267826619 + ((2 * v27) & 0x7FDF3ADE));
  a23 = a16;
  uint64_t v35 = ((uint64_t (*)(int *))((char *)*(&off_100079130 + (v32 ^ 0x33Du)) - 8))(&a21);
  return (*(uint64_t (**)(uint64_t))(a14 + 8LL * (((a21 != v31) | ((a21 != v31) << 6)) ^ v32)))(v35);
}

uint64_t sub_10004F254( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned int a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, unint64_t *a22, uint64_t a23, int a24, unsigned int a25, int a26, int a27)
{
  if (a12 + (v27 ^ 0xBEFFE260) >= 0x1F8FCFD3) {
    int v29 = 1010542952;
  }
  else {
    int v29 = 635686783;
  }
  int v30 = 460628867 * ((&a22 - 68604818 - 2 * ((unint64_t)&a22 & 0xFBE92C6E)) ^ 0xB77FAE13);
  a26 = v29 - v30;
  a24 = v30 - 982147079;
  a25 = v30 + 2138962340 + a10;
  a22 = &STACK[0x58A7AA086245692E];
  a23 = a17;
  uint64_t v31 = sub_10005A720((uint64_t)&a22);
  return (*(uint64_t (**)(uint64_t))(a15
                                            + 8LL
                                            * ((1183 * (a27 == ((((a10 + 1611586287) & 0xF125FF) - 887) ^ (v28 - 364)))) ^ a10)))(v31);
}

uint64_t sub_10004F35C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, unint64_t *a23, unint64_t *a24, unsigned int a25)
{
  a23 = &STACK[0x72E1645BEBB64067];
  a24 = &STACK[0x1E6EF7153090E02];
  a22 = a18;
  a25 = (v27 - 905) ^ (1225351577
                     * ((((2 * &a21) | 0xE5132B40) - &a21 + 225864288) ^ 0xD1134DB6));
  uint64_t v29 = v25;
  uint64_t v30 = ((uint64_t (*)(char *))((char *)*(&off_100079130 + (v27 & 0xF9F055)) - 8))(&a21);
  return (*(uint64_t (**)(uint64_t))(v29 + 8LL * (((((v27 + 37624584) & 0x1C1E0EF) + 490) * (v26 < v28)) ^ v27)))(v30);
}

uint64_t sub_10004F474( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _BYTE *a18, uint64_t a19, int a20, char a21, unsigned int a22, char *a23, _BYTE *a24)
{
  a22 = (v27 - 914) ^ ((&a22 ^ 0x6DF41809) * v25);
  a23 = &a21 + v26;
  a24 = a18;
  v29(&a22);
  a22 = (v27 - 914) ^ (1374699841 * ((&a22 & 0x80170750 | ~(&a22 | 0x80170750)) ^ 0x121CE0A6));
  a23 = v28;
  a24 = a18;
  v29(&a22);
  a23 = v24;
  a24 = a18;
  a22 = (v27 - 914) ^ (1374699841
                     * ((&a22 - 1703598249 - 2 * (&a22 & 0x9A752757)) ^ 0xF7813F5E));
  v29(&a22);
  a23 = a18;
  a22 = (v27 - 413) ^ (1755732067
                     * ((2 * (&a22 & 0x6B25E860) - &a22 + 349837213) ^ 0xCA1CAA46));
  uint64_t v31 = sub_1000565D0((uint64_t)&a22);
  int v32 = (_DWORD)a24 == v30 + ((v27 - 109820142) & 0x68BB7FE) - 1020;
  return ((uint64_t (*)(uint64_t))(*(void *)(a14 + 8LL * (((8 * v32) | (v32 << 9)) ^ (v27 - 1032))) - 8LL))(v31);
}

uint64_t sub_10004F5E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20)
{
  return ((uint64_t (*)(void))(*(void *)(v20
                                        + 8LL * (int)(((a20 == v22) * (((v21 + 1980706585) & 0x89F0D3FF) + 296)) ^ v21))
                            - ((v21 - 2065801700) & 0x7B21A19F)
                            + 151LL))();
}

uint64_t sub_10004F640@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  *int8x16_t v15 = a9 ^ 0xF9;
  return ((uint64_t (*)(void))(*(void *)(v14
                                        + 8LL
                                        * (int)(((a14 == v16)
                                               * ((((a1 - 92) | 0xA0) ^ 0xFFFFFC63) + ((a1 + 333) | 0x210))) ^ a1))
                            - 8LL))();
}

uint64_t sub_10004F698( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  BOOL v17 = ((uint64_t (*)(void))*(&off_100079130 + (v15 ^ 1)))(v14 ^ (v16 - 736) ^ v15 ^ 0x603u) != 0;
  return ((uint64_t (*)(void))(*(void *)(a14 + 8LL * ((v17 * (v15 ^ 0x1E0)) ^ v15)) - 8LL))();
}

uint64_t sub_10004F6F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  unsigned int v23 = (a20 ^ v22) - (((((v20 - 1760) | 0x9A) + 73) ^ 0xEDAA0B17) & (2 * (a20 ^ v22))) + 1993672186;
  return ((uint64_t (*)(void))(*(void *)(v21
                                        + 8LL
                                        * ((504
                                          * (((2 * v23) & 0xDFDBFDDA ^ 0xCD8A09D0) + (v23 ^ 0x1938FB17) - 1610946564 != 266921705)) ^ v20))
                            - 12LL))();
}

uint64_t sub_10004F78C(uint64_t a1, int a2)
{
  int v5 = v3 + v2 - 1877868269 >= ((33 * (a2 ^ 0x8E)) ^ 0x29Cu);
}

uint64_t sub_10004F804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v8 = v5 - a1 >= (unint64_t)(25 * (a5 ^ v6 ^ (v6 + 677))) - 1193;
  return (*(uint64_t (**)(void))(v7 + 8LL * (((4 * v8) | (32 * v8)) ^ a5)))();
}

uint64_t sub_10004F840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(uint64_t, void))(*(void *)(v10
                                                              + 8LL
                                                              * ((54 * (v9 >= ((v7 + (a7 ^ (v8 + 1597)) + 851) ^ 0x3CDu))) ^ a7))
                                                  - 12LL))( a1,  0LL);
}

uint64_t sub_10004F87C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v13 = v11 + v10 + a6;
  uint64_t v14 = v7 + v13;
  __int128 v15 = *(_OWORD *)(v14 - 31);
  uint64_t v16 = a1 + v13;
  *(_OWORD *)(v16 - 15) = *(_OWORD *)(v14 - 15);
  *(_OWORD *)(v16 - 31) = v15;
  return (*(uint64_t (**)(void))(v12
                              + 8LL
                              * ((((v9 & 0xFFFFFFE0) == 32) * ((10 * (a3 ^ (v8 + 645))) ^ 0x4AB)) ^ (v6 + a3 + 481))))();
}

void sub_10004F8E0()
{
}

uint64_t sub_10004F8EC(uint64_t a1)
{
  void *v7 = a1;
  _DWORD *v8 = v2;
  int v4 = ((v1 ^ 0x31F) - 325940229) & 0x136D717C;
  unsigned int v12 = (v1 ^ 0x31F)
  uint64_t v13 = v10;
  v6(v11);
  unsigned int v12 = v4
      + 535753261
  uint64_t v13 = v9;
  v6(v11);
  return v3 ^ 0x620F0DF9u;
}

void sub_10004FBA8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 36) ^ (235795823
                             * ((-2 - ((a1 ^ 0x29040430 | 0x96E8ABCB) + (a1 ^ 0x10C0A082 | 0x69175434))) ^ 0x52961214));
  __asm { BR              X14 }

uint64_t sub_10004FCF8(uint64_t a1, int a2)
{
  BOOL v4 = (v2 ^ (a2 + 215) ^ 0x8B0A4B63) == 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8LL * (((2 * v4) | (4 * v4)) ^ a2)))(a1, 827000779LL);
}

uint64_t sub_10004FD4C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(_BYTE *)(a3 + (a2 - 827000779)) = *(_BYTE *)(v3 + (a2 - 827000779)) ^ *(_BYTE *)(v6 + ((a2 - 827000779) & 0xFLL)) ^ *(_BYTE *)(v5 + ((a2 - 827000779) & 0xFLL)) ^ *(_BYTE *)(v4 + ((a2 - 827000779) & 0xFLL)) ^ (97 * ((a2 + 53) & 0xF)) ^ 0x32;
  int v13 = v8 - 267 + a2;
  unsigned int v14 = a2 + 869111975;
  uint64_t v15 = (v13 - 1292);
  int v16 = (v9 > v11) ^ (v14 < v7);
  BOOL v17 = v14 < v10;
  if (v16) {
    BOOL v17 = v9 > v11;
  }
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v12 + 8LL * ((83 * v17) ^ v8)) - 8LL))(a1, v15);
}

uint64_t sub_10004FDE8()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((22
                                          * (((((v0 - 1518) | 0x1C8) - 654498756) ^ v1)
                                           + ((2 * v1) & 0xA7EED6BE ^ 0x60492B6) == 1408723807)) ^ v0))
                            - 8LL))();
}

uint64_t sub_10004FE58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(void))(*(void *)(v6
                                        + 8LL
                                        * ((1362
}

uint64_t sub_10004FEB0(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(void))(*(void *)(v7
                                        + 8LL
                                        * (((((a7 - 311191283) & 0x128C66FD) - 159)
}

uint64_t sub_10004FEFC@<X0>(int a1@<W3>, unsigned int a2@<W4>, int a3@<W7>, uint64_t a4@<X8>)
{
  uint64_t v9 = a3 + a1 + 248 * (((a2 + 920) | 0x301) ^ 0x747);
  uint64_t v10 = v9 + v4;
  uint64_t v11 = v9 + a4;
  unint64_t v12 = v10 - v11;
  uint64_t v13 = a3 & 0xF;
  unint64_t v14 = v13 + v7 - v11;
  unint64_t v15 = (v13 | v6) - v11;
  unint64_t v16 = (v13 | v5) - v11;
  BOOL v20 = v12 > 0xF && v14 > 0xF && v15 > 0xF && v16 > 0xF;
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((86 * v20) ^ a2)) - 12LL))();
}

uint64_t sub_10004FF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(v8
                                                                                         + 8LL
                                                                                         * (a7 ^ (1019 * (v7 > 0xF))))
                                                                             - ((52 * (a7 ^ 0x1E1) + 1506241642) & 0xA63893F6)
                                                                             + 978LL))( a1,  a2,  a3,  a4,  0LL);
}

uint64_t sub_10004FFC8@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  *(_DWORD *)(v9 - 1memset((void *)(v1 - 204), 50, 16) = v7 + 2;
  *(_DWORD *)(v9 - 12_Block_object_dispose(va, 8) = v7 + 9;
  *(_DWORD *)(v9 - 136) = v7 + 8;
  v17.val[1].i64[0] = ((_BYTE)v7 + 1) & 0xF;
  v17.val[1].i64[1] = v7 & 0xF;
  v17.val[2].i64[0] = ((_BYTE)v7 - 1) & 0xF;
  v17.val[2].i64[1] = ((_BYTE)v7 + 14) & 0xF;
  v17.val[3].i64[0] = ((_BYTE)v7 + 13) & 0xF;
  v17.val[3].i64[1] = ((_BYTE)v7 + 12) & 0xF;
  v18.val[0].i64[0] = ((_BYTE)v7 + 11) & 0xF;
  v18.val[0].i64[1] = ((_BYTE)v7 + 10) & 0xF;
  v18.val[1].i64[0] = *(_DWORD *)(v9 - 128) & 0xF;
  v18.val[1].i64[1] = *(_DWORD *)(v9 - 136) & 0xF;
  uint64_t v10 = *(void *)(v9 - 256);
  v18.val[2].i64[0] = ((_BYTE)v7 + 7) & 0xF;
  v18.val[2].i64[1] = (v7 + 6) & 0xF;
  v18.val[3].i64[0] = ((_BYTE)v7 + 5) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)v7 + 4) & 0xF;
  v11.i64[0] = 0x6161616161616161LL;
  v11.i64[1] = 0x6161616161616161LL;
  v12.i64[0] = 0x3232323232323232LL;
  v12.i64[1] = 0x3232323232323232LL;
  v17.val[0].i64[0] = ((_BYTE)v7 + (_BYTE)v6) & 0xF;
  v17.val[0].i64[1] = *(_DWORD *)(v9 - 116) & 0xF;
  v13.i64[0] = vqtbl4q_s8(v17, (int8x16_t)xmmword_100061B60).u64[0];
  v13.i64[1] = vqtbl4q_s8(v18, (int8x16_t)xmmword_100061B60).u64[0];
  int8x16_t v14 = vrev64q_s8( veorq_s8( veorq_s8(*(int8x16_t *)(v2 - 15 + (v7 + v6)), *(int8x16_t *)(v5 + v17.val[0].i64[0] - 15)),  veorq_s8(*(int8x16_t *)(v4 + v17.val[0].i64[0] - 15), *(int8x16_t *)(v3 + v17.val[0].i64[0] - 15))));
  int8x16_t v15 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v14, v14, 8uLL), v12), vmulq_s8(v13, v11)));
  *(int8x16_t *)(a2 - 15 + (v7 + v6)) = vextq_s8(v15, v15, 8uLL);
  return ((uint64_t (*)(uint64_t))(*(void *)(v10
                                                      + 8LL
                                                      * ((1049 * ((((a1 - 884) | 0x618) ^ 0x608) == (v8 & 0xFFFFFFF0))) ^ a1))
                                          - 8LL))(v8);
}

uint64_t sub_100050158( int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10)
{
  return ((uint64_t (*)(uint64_t))(*(void *)(v10
                                                      + 8LL
}

uint64_t sub_100050198( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  BOOL v11 = ((((a8 - 1072) ^ 0x6AD) - 1853) & v9) != 0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(v10
                                                                                                  + 8LL * (((8 * v11) | (16 * v11)) ^ (a8 - 1072)))
                                                                                      - 4LL))( a1,  a2,  a3,  a4,  a5,  (v8 - a5));
}

uint64_t sub_1000501D0@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W4>, int a5@<W7>, uint64_t a6@<X8>)
{
  *(_DWORD *)(v12 - 152) = v11;
  unsigned int v14 = ((a5 - 19) ^ 0xFFFFFC3B) & v11;
  *(void *)(v12 - 136) = v6 - 7;
  *(void *)(v12 - 144) = a6 - 7;
  int v15 = -a4;
  *(_DWORD *)(v12 - 160) = v14;
  char v16 = v13 + a2 + a1;
  *(_DWORD *)(v12 - 12_Block_object_dispose(va, 8) = a5 - 19;
  *(_DWORD *)(v12 - 1memset((void *)(v1 - 204), 50, 16) = (a5 + 1920881190) & 0x8D81ABEB;
  uint64_t v17 = (v15 + a3 + a2 + a1 + 496);
  v19.val[0].i64[0] = ((_BYTE)v15 + (_BYTE)a3 + (_BYTE)a2 + (_BYTE)a1 - 16) & 0xF;
  v19.val[0].i64[1] = ((_BYTE)v15 + v16 + 2) & 0xF;
  v19.val[1].i64[0] = ((_BYTE)v15 + v16 + 1) & 0xF;
  v19.val[1].i64[1] = ((_BYTE)v15 + v10) & 0xF;
  v19.val[2].i64[0] = ((_BYTE)v15 + v16 + 15) & 0xF;
  v19.val[2].i64[1] = ((_BYTE)v15 + v16 + 14) & 0xF;
  v19.val[3].i64[0] = ((_BYTE)v15 + v16 + 13) & 0xF;
  v19.val[3].i64[1] = ((_BYTE)v15 + v10 + *(_DWORD *)(v12 - 116) + 4) & 0xF;
  *(int8x8_t *)(*(void *)(v12 - 144) + v17) = vrev64_s8( veor_s8( veor_s8( vrev64_s8( veor_s8( veor_s8( *(int8x8_t *)(*(void *)(v12 - 136) + v17),  *(int8x8_t *)(v9 + (v17 & 0xF) - 7)),  veor_s8( *(int8x8_t *)(v8 + (v17 & 0xF) - 7),  *(int8x8_t *)(v7 + (v17 & 0xF) - 7)))),  (int8x8_t)0x3232323232323232LL),  vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8( v19,  (int8x16_t)xmmword_100061B70),  (int8x8_t)0x6161616161616161LL)));
  return ((uint64_t (*)(__n128))(*(void *)(*(void *)(v12 - 256)
                                                     + 8LL * ((21 * (v15 != 8 - v14)) ^ *(_DWORD *)(v12 - 128)))
                                         - 4LL))((__n128)xmmword_100061B70);
}

void sub_100050344()
{
}

uint64_t sub_100050368( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return ((uint64_t (*)(uint64_t))(*(void *)(v10
                                                      + 8LL
                                                      * (int)((((*(_DWORD *)(v11 - 116) + 1285438991) & 0xB361C74D ^ 0x305)
                                                             * (*(_DWORD *)(v11 - 152) == *(_DWORD *)(v11 - 160))) ^ *(_DWORD *)(v11 - 116)))
                                          - ((*(_DWORD *)(v11 - 116) + 536) | 0x10Du)
                                          + 1289LL))(a10);
}

uint64_t sub_1000503C4@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  uint64_t v10 = (a1 + v7);
  *(_BYTE *)(a2 + v10) = *(_BYTE *)(v2 + v10) ^ *(_BYTE *)(v5 + (v10 & 0xF)) ^ *(_BYTE *)(v4 + (v10 & 0xF)) ^ *(_BYTE *)(v3 + (v10 & 0xF)) ^ (97 * (v10 & 0xF)) ^ 0x32;
}

uint64_t sub_10005043C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  uint64_t v38 = *(void *)(a1 + 24);
  *(int8x16_t *)(v37 - 112) = veorq_s8( *(int8x16_t *)(*(void *)(a1 + 40) - 0x3EAB24E7EEDAADCALL),  (int8x16_t)xmmword_100061B90);
  if (a9) {
    BOOL v39 = v38 == 0x39E8CCF6252BBBF8LL;
  }
  else {
    BOOL v39 = 1;
  }
  int v40 = !v39;
  HIDWORD(a12) = v35 << ((a7 - 14) & 0xDF ^ (a7 - 47));
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 + 8LL * (int)((158 * v40) ^ a7)) - 8LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35);
}

uint64_t sub_1000504D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34)
{
  unsigned int v37 = (HIDWORD(a11) & 0xFEECEEFE) + (v34 ^ 0xFF76777F);
  BOOL v39 = (((_BYTE)v37 + 1) & 0xF) != 0 || v37 == -9013377;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8LL * (((((v35 ^ 0xAB) - 410) ^ 0x3E6) * v39) ^ v35)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34);
}

uint64_t sub_100050538( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, int a44, int a45)
{
  unsigned int v46 = a10 - (((a45 + 1991023091) & 0x895367DD ^ 0x97F0829) & a13) + 630243607;
  return ((uint64_t (*)(void))(*(void *)(v45
                                        + 8LL
                                        * ((251
                                          * (((2 * v46) & 0xB6FEE7BE ^ 0x7E072C) + (v46 ^ 0x5FC0F469) + 753659424 == 141255167)) ^ a45))
                            - 4LL))();
}

uint64_t sub_100050604()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL * ((104 * (v2 + v1 + 612404257 >= ((v0 + 465) ^ 0x74Du))) ^ (v0 - 966)))
                            - 12LL))();
}

uint64_t sub_100050674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6
                                                                                 + 8LL
                                                                                 * (int)((1278
                                                                                        * ((((a3 ^ 0x6EB)
                                                                                           - 1877) & a6) == -612404256)) ^ a3))
                                                                     - 12LL))( a1,  a2,  a3,  a2);
}

uint64_t sub_1000506B0@<X0>(int a1@<W0>, int a2@<W2>, unint64_t a3@<X8>)
{
  uint64_t v9 = (v7 + v6 + a1);
  unint64_t v10 = v9 + a3 + 1;
  uint64_t v11 = (v7 + v6) & 0xF;
  uint64_t v12 = v11 - v9;
  unint64_t v13 = v4 + v12;
  unint64_t v14 = v11 + v4 + 1;
  unint64_t v15 = v3 + (((a2 ^ 0x28Bu) + 1056) ^ 0x747LL) + v12;
  unint64_t v16 = v11 + v3 + 3;
  unint64_t v17 = v12 + v5 + 4;
  unint64_t v18 = v11 + v5 + 5;
  BOOL v20 = v14 > a3 && v13 < v10;
  if (v16 > a3 && v15 < v10) {
    BOOL v20 = 1;
  }
  int v23 = v18 > a3 && v17 < v10 || v20;
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((2006 * (v23 ^ 1)) ^ a2)) - 12LL))();
}

uint64_t sub_10005074C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void))(*(void *)(v7
                                                                       + 8LL
                                                                       * ((252
                                                                         * (((a6 + 82) ^ (v6 < (((a6 - 795) | 0x180) ^ 0x19Au))) & 1)) ^ a6))
                                                           - 12LL))( a1,  a2,  0LL);
}

uint64_t sub_10005078C@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W3>, uint64_t a4@<X8>)
{
  *(_DWORD *)(v10 - 1memset((void *)(v1 - 204), 50, 16) = a2 + 9;
  v17.val[1].i64[0] = ((_BYTE)a2 + 14) & 0xF;
  v17.val[1].i64[1] = ((_BYTE)a2 + 13) & 0xF;
  v17.val[2].i64[0] = ((_BYTE)a2 + 12) & 0xF;
  v17.val[2].i64[1] = ((_BYTE)a2 + 11) & 0xF;
  uint64_t v11 = *(void *)(v10 - 256);
  unsigned int v12 = v9 + v8 + a1;
  v17.val[3].i64[0] = ((_BYTE)a2 + 10) & 0xF;
  v17.val[3].i64[1] = *(_DWORD *)(v10 - 116) & 0xF;
  v18.val[0].i64[0] = ((_BYTE)a2 + 8) & 0xF;
  v18.val[0].i64[1] = ((_BYTE)a2 + 7) & 0xF;
  v18.val[1].i64[0] = ((_BYTE)a2 + 6) & 0xF;
  v18.val[1].i64[1] = ((_BYTE)a2 + 5) & 0xF;
  v18.val[2].i64[0] = ((_BYTE)a2 + 4) & 0xF;
  v18.val[2].i64[1] = ((_BYTE)a2 + 3) & 0xF;
  v18.val[3].i64[0] = (a2 + 2) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)a2 + 1) & 0xF;
  v13.i64[0] = 0x7777777777777777LL;
  v13.i64[1] = 0x7777777777777777LL;
  v17.val[0].i64[0] = v12 & 0xF;
  v17.val[0].i64[1] = ((_BYTE)a2 - 1) & 0xF;
  v14.i64[0] = vqtbl4q_s8(v17, (int8x16_t)xmmword_100061B60).u64[0];
  v14.i64[1] = vqtbl4q_s8(v18, (int8x16_t)xmmword_100061B60).u64[0];
  int8x16_t v15 = vrev64q_s8(vmulq_s8(v14, v13));
  *(int8x16_t *)(a4 - 15 + v12) = veorq_s8( veorq_s8( veorq_s8( veorq_s8( *(int8x16_t *)(v5 + v17.val[0].i64[0] - 15),  *(int8x16_t *)(a4 - 15 + v12)),  *(int8x16_t *)(v17.val[0].i64[0] + v4 - 13)),  *(int8x16_t *)(v6 + v17.val[0].i64[0] + ((4 * a3) ^ 0x62CLL) - 15)),  vextq_s8(v15, v15, 8uLL));
  return (*(uint64_t (**)(void))(v11 + 8LL * ((1988 * ((v7 & 0xFFFFFFF0) == 16)) ^ a3)))();
}

void sub_1000508F4()
{
}

uint64_t sub_100050900@<X0>( unsigned __int8 *a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF7LL);
  int v12 = (v8 + 806) | 0x45;
  *(_DWORD *)(v10 - 1memset((void *)(v1 - 204), 50, 16) = v12;
  uint64_t v13 = (uint64_t)*(&off_100079130 + v8 - 862);
  int v14 = *(unsigned __int8 *)(v13 + (v11 ^ 0x85));
  HIDWORD(v15) = v14 ^ 0x1A;
  LODWORD(v15) = ((v12 + 59) ^ v14) << 24;
  int v16 = (v15 >> 30) ^ 0x9F;
  int8x16x4_t v17 = (char *)*(&off_100079130 + v8 - 980) - 12;
  int v18 = v17[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEDLL) ^ 0xBFLL];
  HIDWORD(v15) = v18 ^ 0xC;
  LODWORD(v15) = (v18 ^ 0xC0) << 24;
  LOBYTE(v1_Block_object_dispose(va, 8) = v15 >> 28;
  int v19 = v16 << 16;
  int v20 = *(unsigned __int8 *)(v13 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF3LL) ^ 0x6FLL));
  HIDWORD(v15) = v20 ^ 0x1A;
  LODWORD(v15) = (v20 ^ 0x80) << 24;
  int v21 = ((v15 >> 30) ^ 0x68) << 16;
  uint64_t v22 = (uint64_t)*(&off_100079130 + v8 - 773);
  int v23 = (char *)*(&off_100079130 + v8 - 857) - 4;
  char v24 = v23[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBECLL) ^ 0xD8LL];
  int v25 = v17[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBE9LL) ^ 0xBCLL];
  HIDWORD(v15) = v25 ^ 0xC;
  LODWORD(v15) = (v25 ^ 0xC0) << 24;
  LOBYTE(v25) = v15 >> 28;
  int v26 = v21 | ((*(unsigned __int8 *)(v22 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF2LL) ^ 0xDFLL)) ^ 0xC0) << 8) | ((v23[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF4LL) ^ 0xAFLL] ^ 0x6D) << 24);
  int v27 = v17[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF1LL) ^ 0x98LL];
  HIDWORD(v15) = v27 ^ 0xC;
  LODWORD(v15) = (v27 ^ 0xC0) << 24;
  unsigned int v28 = v26 & 0xFFFFFF00 | (v15 >> 28);
  LODWORD(v17) = v17[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF5LL) ^ 0xD0LL];
  HIDWORD(v15) = v17 ^ 0xC;
  LODWORD(v15) = (v17 ^ 0xC0) << 24;
  LOBYTE(v17) = v15 >> 28;
  int v29 = v19 | ((*(unsigned __int8 *)(v22 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF6LL) ^ 0x49LL)) ^ 0x4A) << 8) | ((v23[*v9 ^ 0xFELL] ^ 0xB4) << 24);
  int v30 = *(unsigned __int8 *)(v13 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEBLL) ^ 0xB6LL));
  HIDWORD(v15) = v30 ^ 0x1A;
  LODWORD(v15) = (v30 ^ 0x80) << 24;
  uint64_t v31 = (v15 >> 30) ^ 0x21LL;
  LODWORD(v13) = *(unsigned __int8 *)(v13 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEFLL) ^ 0xC8LL));
  HIDWORD(v15) = v13 ^ 0x1A;
  LODWORD(v15) = (v13 ^ 0x80) << 24;
  unint64_t v32 = (((*(unsigned __int8 *)(v22 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEALL) ^ 0xC7LL)) ^ 1LL) << 8) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)(v24 ^ 0xBDu) << 24) | (v31 << 16) | v25 ^ 0x68LL) ^ 0x75F49EF4;
  unsigned int v33 = v18 | ((*(unsigned __int8 *)(v22 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEELL) ^ 0xB7LL)) ^ 0xE1) << 8) & 0xFF00FFFF | (((v15 >> 30) ^ 0x37) << 16) | ((v23[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF0LL) ^ 0x18LL] ^ 0xF2) << 24);
  uint64_t v34 = ((unsigned __int16)((((*(unsigned __int8 *)(v22
                                                                   + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEALL) ^ 0xC7LL)) ^ 1) << 8) | v25 ^ 0x68) ^ 0x9EF4) >> 8);
  int v35 = (char *)*(&off_100079130 + (v8 ^ 0x384)) - 4;
  LODWORD(v23) = (v34 - ((2 * (v32 >> 8)) & 0x12E) - 630217321) ^ *(_DWORD *)&v35[4 * (v34 ^ 0xF5)];
  uint64_t v36 = (uint64_t)*(&off_100079130 + (v8 ^ 0x34F));
  int v37 = *(_DWORD *)(v36 + 4LL * (v24 ^ 0xA2u));
  HIDWORD(v15) = ~v37;
  LODWORD(v15) = v37 ^ 0xAF8BCD8;
  int v38 = v31 ^ 0xDD;
  BOOL v39 = (char *)*(&off_100079130 + v8 - 811) - 8;
  LODWORD(v23) = (v15 >> 2) ^ *(_DWORD *)&v39[4 * v38] ^ ((_DWORD)v23 - ((2 * (_DWORD)v23) & 0xA555BF4) - 2060800518);
  int v40 = (char *)*(&off_100079130 + (v8 ^ 0x319)) - 4;
  unsigned int v237 = v29 & 0xFFFFFF00 | v17 ^ 0x3C;
  unsigned int v41 = *(_DWORD *)&v40[4 * (v25 ^ 0xD9)] ^ v237 ^ ((_DWORD)v23
                                                                   - ((2 * (_DWORD)v23) & 0xA2BAA0D4)
                                                                   - 782413718);
  unsigned int v238 = v28;
  unsigned int v235 = v33;
  int v233 = v41 ^ v28 ^ 0x2789BBD4;
  int v42 = v33 ^ 0xE6 ^ v233;
  LODWORD(v17) = *(_DWORD *)(v36 + 4LL * (((v42 ^ v32) >> 24) ^ 0x21));
  HIDWORD(v15) = ~(_DWORD)v17;
  LODWORD(v15) = v17 ^ 0xAF8BCD8;
  LODWORD(v17) = ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA2BAA0D4) - 782413718) ^ *(_DWORD *)&v40[4
                                                                                            * ((v42 ^ v32) ^ 0xDE)];
  int v231 = v42 ^ v32;
  unsigned int v234 = v41;
  unsigned int v230 = *(_DWORD *)&v35[4 * (((unsigned __int16)(v42 ^ v32) >> 8) ^ 0x1E)] ^ *(_DWORD *)&v39[4 * (((v42 ^ v32) >> 16) ^ 0x8F)] ^ v41 ^ ((((unsigned __int16)(v42 ^ v32) >> 8) ^ 0xEB) - 630217321 + (~(2 * (((v42 ^ v32) >> 8) ^ 0x4BA6EB)) | 0xFFFFFED1) + 1) ^ ((_DWORD)v17 - ((2 * (_DWORD)v17) & 0xA555BF4) - 2060800518);
  int v43 = v230 ^ 0x76E748E2 ^ v41 ^ v28;
  int v236 = v32;
  int v44 = *(_DWORD *)(v36 + 4LL * (((v43 ^ v32) >> 24) ^ 0xA2));
  HIDWORD(v15) = ~v44;
  LODWORD(v15) = v44 ^ 0xAF8BCD8;
  unsigned int v45 = v43 ^ v32 ^ 0xC84590C6;
  int v46 = *(_DWORD *)&v35[4 * (BYTE1(v45) ^ 0xF5)] ^ *(_DWORD *)&v39[4
                                                                 * (((v43 ^ v32) >> 16) ^ 0x6C)] ^ (BYTE1(v45) - ((v45 >> 7) & 0x12E) - 630217321) ^ ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA555BF4) - 2060800518);
  int v228 = v43 ^ v32;
  int v229 = v43;
  unsigned int v227 = v230 ^ 0x76E748E2 ^ *(_DWORD *)&v40[4 * ((v43 ^ v32) ^ 0x83)] ^ (v46
                                                                                         - ((2 * v46) & 0xA2BAA0D4)
                                                                                         - 782413718);
  int v226 = v227 ^ 0x2789BBD4 ^ v43;
  int v232 = v42;
  HIDWORD(v225) = v43 ^ v42;
  unsigned int v47 = v226 ^ 0x8EDEEA78 ^ v43 ^ v42;
  int v48 = *(_DWORD *)(v36 + 4LL * (((v47 ^ v45) >> 24) ^ 0x67));
  HIDWORD(v15) = ~v48;
  LODWORD(v15) = v48 ^ 0xAF8BCD8;
  int v49 = (v15 >> 2) ^ *(_DWORD *)&v35[4 * (((unsigned __int16)(v47 ^ v45) >> 8) ^ 0x97)] ^ ((((unsigned __int16)(v47 ^ v45) >> 8) ^ 0x62) - ((2 * (((v47 ^ v45) >> 8) ^ 0xD8B62)) & 0x12E) - 630217321);
  unsigned int v50 = (v49 - ((2 * v49) & 0xA2BAA0D4) - 782413718) ^ *(_DWORD *)&v40[4 * ((v47 ^ v45) ^ 0xE1)];
  int v51 = v227 ^ 0x2789BBD4 ^ *(_DWORD *)&v39[4 * (((v47 ^ v45 ^ 0x2142BA5) >> 16) ^ 0xB6)] ^ (v50 - ((2 * v50) & 0xA555BF4) - 2060800518);
  HIDWORD(v224) = v47 ^ v45;
  LODWORD(v225) = v47;
  HIDWORD(v223) = v51 ^ v226 ^ 0x8EDEEA78;
  LODWORD(v223) = HIDWORD(v223) ^ 0x307C325C ^ v47 ^ 0x5EF1BA37;
  LODWORD(v23) = *(_DWORD *)(v36 + 4LL * (((v223 ^ v47 ^ v45) >> 24) ^ 0xA4));
  HIDWORD(v15) = ~(_DWORD)v23;
  LODWORD(v15) = v23 ^ 0xAF8BCD8;
  LODWORD(v23) = ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA2BAA0D4) - 782413718) ^ *(_DWORD *)&v40[4
                                                                                            * ((v223 ^ v47 ^ v45) ^ 0x18)];
  unsigned int v52 = v223 ^ v47 ^ v45 ^ 0xCEE37B5D;
  HIDWORD(v222) = v223 ^ v47 ^ v45;
  LODWORD(v224) = v51;
  unsigned int v53 = *(_DWORD *)&v39[4 * (BYTE6(v222) ^ 0xCA)] ^ *(_DWORD *)&v35[4 * (BYTE1(v52) ^ 0xF5)] ^ v51 ^ (BYTE1(v52) - ((v52 >> 7) & 0x12E) - 630217321) ^ 0xD4F2AD1A ^ ((_DWORD)v23 - ((2 * (_DWORD)v23) & 0xA555BF4) - 2060800518);
  unsigned int v54 = v53 ^ ((v47 ^ 0x5EF1BA37) - ((2 * (v47 ^ 0x5EF1BA37)) & 0xA9E55A34) - 722293478);
  LODWORD(v17) = *(_DWORD *)(v36 + 4LL * (((v54 ^ v52) >> 24) ^ 0x70));
  HIDWORD(v15) = ~(_DWORD)v17;
  LODWORD(v15) = v17 ^ 0xAF8BCD8;
  LODWORD(v17) = ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA555BF4) - 2060800518) ^ *(_DWORD *)&v39[4
                                                                                            * (((v54 ^ v52 ^ 0xF3443494) >> 16) ^ 0xE4)];
  LODWORD(v17) = ((_DWORD)v17 - 782413718 + (~(2 * (_DWORD)v17) | 0x5D455F2B) + 1) ^ *(_DWORD *)&v40[4 * ((v53 ^ ((v47 ^ 0x37) - ((2 * (v47 ^ 0x37)) & 0x34) + 26) ^ v52) ^ 0x91)];
  LODWORD(v221) = v54 ^ v52;
  int v55 = v54 ^ v52 ^ 0x1A89BBD4;
  LODWORD(v17) = ((_DWORD)v17 - ((2 * (_DWORD)v17) & 0xB4DF4B2E) - 630217321) ^ *(_DWORD *)&v35[4 * (BYTE1(v55) ^ 0xF5)];
  int v56 = v7;
  unsigned int v57 = v53 ^ BYTE1(v55) ^ ((_DWORD)v17 - ((2 * (_DWORD)v17) & 0xA9E55A34) - 722293478);
  HIDWORD(v221) = v54;
  LODWORD(v222) = v53;
  LODWORD(v220) = v53 ^ ((HIDWORD(v223) ^ 0x307C325C) - ((2 * (HIDWORD(v223) ^ 0x307C325C)) & 0xA9E55A34) - 722293478);
  HIDWORD(v219) = v57 ^ v220;
  LODWORD(v17) = v57 ^ v220 ^ 0xE6F58988;
  unsigned int v58 = v17 ^ v54;
  unsigned int v59 = v17 ^ v54 ^ v55;
  int v60 = *(_DWORD *)(v36 + 4LL * (HIBYTE(v59) ^ 0x43));
  HIDWORD(v15) = ~v60;
  LODWORD(v15) = v60 ^ 0xAF8BCD8;
  int v61 = *(_DWORD *)&v35[4 * (((unsigned __int16)(v59 ^ 0x7ABE) >> 8) ^ 0xF5)] ^ *(_DWORD *)&v39[4 * (((v59 ^ 0x4D501F31) >> 16) ^ 0xE2)] ^ (((unsigned __int16)(v59 ^ 0x7ABE) >> 8) - (((v59 ^ 0x299B7ABE) >> 7) & 0x12E) - 630217321) ^ ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA555BF4) - 2060800518);
  HIDWORD(v220) = v57;
  unsigned int v62 = v57 ^ *(_DWORD *)&v40[4 * (v59 ^ 0xFB)] ^ (v61 - ((2 * v61) & 0xA2BAA0D4) - 782413718);
  HIDWORD(v217) = v62 ^ v17;
  LODWORD(v17) = v62 ^ v17 ^ 0x5BF36347;
  LODWORD(v219) = v58;
  LODWORD(v217) = v17 ^ v58;
  LODWORD(v23) = v17 ^ v58 ^ 0x2745D0FF;
  unsigned int v63 = v23 ^ v59 ^ 0x299B7ABE ^ 0x3DCC6B2B;
  int v64 = (BYTE1(v63) - ((v63 >> 7) & 0x12E) - 630217321) ^ *(_DWORD *)&v35[4 * (BYTE1(v63) ^ 0xF5)];
  unsigned int v65 = (v64 - ((2 * v64) & 0xA2BAA0D4) - 782413718) ^ *(_DWORD *)&v40[4
                                                                     * ((~(v17 ^ v58) ^ v59 ^ 0xBE) ^ 0x6E)];
  HIDWORD(v2memset((void *)(v1 - 204), 50, 16) = v23 ^ v59 ^ 0x299B7ABE;
  int v66 = *(_DWORD *)(v36 + 4LL * (HIBYTE(HIDWORD(v216)) ^ 0x57u));
  HIDWORD(v15) = ~v66;
  LODWORD(v15) = v66 ^ 0xAF8BCD8;
  unint64_t v218 = __PAIR64__(v59, v62);
  LODWORD(v2memset((void *)(v1 - 204), 50, 16) = (v15 >> 2) ^ *(_DWORD *)&v39[4 * (((HIDWORD(v216) ^ 0x516EF336u) >> 16) ^ 0x8B)] ^ v62 ^ (v65 - ((2 * v65) & 0xA555BF4) - 2060800518);
  HIDWORD(v215) = v216 ^ 0x930000ED ^ v17;
  LODWORD(v215) = HIDWORD(v215) ^ 0x8D06EA22 ^ v23;
  int v67 = *(_DWORD *)(v36 + 4LL * (((v215 ^ v63) >> 24) ^ 0x39));
  HIDWORD(v15) = ~v67;
  LODWORD(v15) = v67 ^ 0xAF8BCD8;
  HIDWORD(v214) = v215 ^ v63;
  LODWORD(v32) = v215 ^ v63 ^ 0x53DEAA41;
  int v68 = *(_DWORD *)&v40[4 * ((v215 ^ v63) ^ 4)] ^ *(_DWORD *)&v35[4 * (BYTE1(v32) ^ 0xF5)] ^ 0xB32F5FD ^ (v15 >> 2);
  int v69 = *(_DWORD *)&v39[4 * (((v215 ^ v63 ^ 0x9289BB39) >> 16) ^ 0x7E)] ^ v216 ^ 0x930000ED ^ BYTE1(v32) ^ 0xE1715EEC ^ (v68 - ((2 * v68) & 0xA555BF4) - 2060800518);
  unsigned int v70 = (HIDWORD(v215) ^ 0x8D06EA22) - ((2 * (HIDWORD(v215) ^ 0x8D06EA22)) & 0xC2E2BDD8);
  LODWORD(v23) = v69 ^ ((_DWORD)v23 - ((2 * (_DWORD)v23) & 0xC2E2BDD8) - 512663828);
  LODWORD(v36) = *(_DWORD *)(v36 + 4LL * (((v23 ^ v32) >> 24) ^ 0x44));
  HIDWORD(v15) = ~(_DWORD)v36;
  LODWORD(v15) = v36 ^ 0xAF8BCD8;
  int v71 = *(_DWORD *)&v35[4
                      * (((unsigned __int16)((unsigned __int16)v23 ^ WORD2(v214) ^ 0xAA41) >> 8) ^ 0xFD)] ^ *(_DWORD *)&v40[4 * (v23 ^ BYTE4(v214) ^ 0x41 ^ 0xC4)] ^ ((((unsigned __int16)((unsigned __int16)v23 ^ WORD2(v214) ^ 0xAA41) >> 8) ^ 8) - (((v23 ^ v32) >> 7) & 0x12E) - 630217321) ^ ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA2BAA0D4) - 782413718);
  HIDWORD(v213) = v23 ^ v32 ^ 0xF2402859;
  LODWORD(v17) = (v71 - ((2 * v71) & 0xA555BF4) - 2060800518) ^ *(_DWORD *)&v39[4
                                                                              * (((v23 ^ v32) >> 16) ^ 0x16)];
  LODWORD(v34) = (_DWORD)v17 - ((2 * (_DWORD)v17) & 0xC2E2BDD8);
  uint64_t v72 = (uint64_t)*(&off_100079130 + (v8 ^ 0x3BC));
  int v73 = (char *)*(&off_100079130 + v8 - 920) - 4;
  uint64_t v74 = (uint64_t)*(&off_100079130 + v8 - 864);
  int v75 = *(unsigned __int8 *)(v74 + (*(unsigned __int8 *)(v10 - 109) ^ 0xA5LL));
  HIDWORD(v15) = v75 ^ 7;
  LODWORD(v15) = v75 << 24;
  uint64_t v76 = (uint64_t)*(&off_100079130 + (v8 ^ 0x3BE));
  uint64_t v210 = v74;
  uint64_t v212 = v72;
  unsigned int v77 = (*(unsigned __int8 *)(v74 + (*(unsigned __int8 *)(v10 - 105) ^ 0x28LL)) ^ 0xD) & 0xFFFF00FF | ((((*(_BYTE *)(v10 - 106) ^ 0xAC) + *(_BYTE *)(v72 + (*(unsigned __int8 *)(v10 - 106) ^ 0xA3LL)) + 87) ^ 0xF6) << 8) | ((*(unsigned __int8 *)(v76 + (*(unsigned __int8 *)(v10 - 108) ^ 0xB2LL)) ^ 0x2E) << 24);
  uint64_t v209 = v76;
  LODWORD(v17) = (*(unsigned __int8 *)(v74 + (*(unsigned __int8 *)(v10 - 97) ^ 0x7BLL)) ^ 0x78) & 0xFFFF00FF | ((((*(_BYTE *)(v10 - 98) ^ 0xD0) + *(_BYTE *)(v72 + (*(unsigned __int8 *)(v10 - 98) ^ 0xDFLL)) + 87) ^ 0xE4) << 8) | ((v73[*(unsigned __int8 *)(v10 - 99) ^ 0xAALL] ^ 0xE2) << 16) | ((*(unsigned __int8 *)(v76 + (*(unsigned __int8 *)(v10 - 100) ^ 0x45LL)) ^ 0x16) << 24);
  int v211 = v73;
  unsigned int v78 = (((((v15 >> 30) ^ 0xDB) >> 2) | (((v15 >> 30) ^ 0xDB) << 6)) | ((v73[*(unsigned __int8 *)(v10 - 111) ^ 0x7ALL] ^ 0x81) << 16) | ((*(unsigned __int8 *)(v76 + (*(unsigned __int8 *)(v10 - 112) ^ 0x78LL)) ^ 0x2C) << 24) | (((*(_BYTE *)(v72 + (*(unsigned __int8 *)(v10 - 110) ^ 0x5DLL)) + (*(_BYTE *)(v10 - 110) ^ 0x52) + 87) ^ 0x5D) << 8)) ^ 0xAE30F304;
  LODWORD(v72) = ((*(unsigned __int8 *)(v74 + (*(unsigned __int8 *)(v10 - 101) ^ 0x60LL)) ^ 0xCC) & 0xFFFF00FF | ((v73[*(unsigned __int8 *)(v10 - 103) ^ 5LL] ^ 0xD0) << 16) | (((*(_BYTE *)(v72 + (*(unsigned __int8 *)(v10 - 102) ^ 4LL)) + (*(_BYTE *)(v10 - 102) ^ 0xB) + 87) ^ 0x33) << 8) | ((*(unsigned __int8 *)(v76 + (*(unsigned __int8 *)(v10 - 104) ^ 0x1CLL)) ^ 0xD9) << 24)) ^ 0xF27FA7C8;
  int v79 = (v77 | ((v73[*(unsigned __int8 *)(v10 - 107) ^ 0x27LL] ^ 0xB4) << 16)) ^ 0xF6784D9;
  LODWORD(v40) = v17 ^ 0x8663AEDE;
  LODWORD(v20_Block_object_dispose(va, 8) = v56 + 9013377;
  int v80 = *(_DWORD *)(v10 - 116);
  HIDWORD(v207) = v80 & 0xBC56885E;
  LODWORD(v207) = v80 ^ 0x754;
  HIDWORD(v206) = v69 ^ (v70 - 512663828);
  LODWORD(v214) = v69;
  LODWORD(v206) = (v34 - 512663828) ^ v69;
  HIDWORD(v205) = v80 ^ 0x711;
  LODWORD(v205) = v80 ^ 0x7F2;
  LODWORD(v213) = v23 ^ 0x626A2240;
  HIDWORD(v20_Block_object_dispose(va, 8) = (v70 - 512663828) ^ 0x3DC8BA5D ^ (v34 - 512663828);
  HIDWORD(a6) = HIDWORD(v208) ^ v23 ^ 0x626A2240;
  *(void *)(v10 - 200) = 7LL;
  uint64_t v81 = a1[7];
  *(void *)(v10 - 152) = 12LL;
  LODWORD(v17) = *(unsigned __int8 *)(v74 + (v81 ^ 0x41));
  uint64_t v82 = a1[12] ^ 0x60LL;
  uint64_t v83 = ((v80 - 1525) | 0x424) ^ 0x57Cu;
  *(void *)(v10 - 144) = v83;
  *(void *)(v10 - 12_Block_object_dispose(va, 8) = 1LL;
  int v84 = *(unsigned __int8 *)(v209 + v82) ^ 0xAD;
  int v85 = *(unsigned __int8 *)(v209 + (a1[v83] ^ 0xC1LL)) ^ 0x19;
  LODWORD(v82) = v73[a1[1] ^ 0x66LL] ^ 0x6D;
  *(void *)(v10 - 136) = 15LL;
  LODWORD(v35) = (_DWORD)v82 << 16;
  uint64_t v86 = a1[15] ^ 0xE9LL;
  *(void *)(v10 - 160) = 11LL;
  LODWORD(v86) = *(unsigned __int8 *)(v74 + v86) ^ 0xDA;
  LODWORD(v73) = v86 | (v84 << 24);
  int v87 = *(unsigned __int8 *)(v74 + (a1[11] ^ 0xC3LL));
  *(void *)(v10 - 176) = 0LL;
  unsigned int v88 = v35 | ((*(unsigned __int8 *)(v209 + (*a1 ^ 0x30LL)) ^ 0x9D) << 24);
  LOBYTE(v35) = v87 ^ 0x10;
  *(void *)(v10 - 16_Block_object_dispose(va, 8) = 2LL;
  unsigned int v89 = v88 & 0xFFFF00FF | (((*(_BYTE *)(v212 + (a1[2] ^ 0xC0LL)) + (a1[2] ^ 0xCF) + 87) ^ 0xF9) << 8);
  *(void *)(v10 - 232) = 4LL;
  *(void *)(v10 - 2memset((void *)(v1 - 204), 50, 16) = 9LL;
  int v90 = v211[a1[9] ^ 0x5DLL] ^ 0xBE;
  *(void *)(v10 - 192) = 10LL;
  int v91 = (v90 << 16) | (((*(_BYTE *)(v212 + (a1[10] ^ 0xD5LL)) + (a1[10] ^ 0xDA) + 87) ^ 0xCF) << 8) | v87 ^ 0x10 | (v85 << 24);
  *(void *)(v10 - 184) = 14LL;
  uint64_t v92 = a1[14];
  LOBYTE(v85) = *(_BYTE *)(v212 + (v92 ^ 0xE4));
  *(void *)(v10 - 224) = 5LL;
  LODWORD(v74) = (v85 + (v92 ^ 0xEB) - 41);
  *(void *)(v10 - 20_Block_object_dispose(va, 8) = 3LL;
  LODWORD(v92) = *(unsigned __int8 *)(v210 + (a1[3] ^ 0xDCLL)) ^ 0xCE | v89;
  *(void *)(v10 - 240) = 13LL;
  LODWORD(v17) = v17 ^ 0xA;
  unsigned int v93 = v17 | ((*(unsigned __int8 *)(v209 + (a1[4] ^ 0xFCLL)) ^ 0x23) << 24);
  LODWORD(v73) = ((_DWORD)v74 << 8) | ((v211[a1[13] ^ 0x92LL] ^ 0x83) << 16) | v73;
  LODWORD(v74) = (v211[a1[5] ^ 0xA9LL] ^ 0x50) << 16;
  *(void *)(v10 - 24_Block_object_dispose(va, 8) = 6LL;
  int v94 = v91 + 1271275121 - 2 * (v91 & 0x4BC61E75 ^ v35 & 4);
  LODWORD(v35) = v78 ^ v237 ^ (v92 - ((2 * v92) & 0x2F12947A) + 394873405);
  unsigned int v95 = v79 ^ v238 ^ ((v74 & 0xFFFF00FF | (((*(_BYTE *)(v212 + (a1[6] ^ 0x4FLL)) + (a1[6] ^ 0x40) + 87) ^ 0xB7) << 8) | v93)
                    - 2
  LODWORD(v17) = v40 ^ v236 ^ ((_DWORD)v73 + 1071257447 - 2
                                                                      * (v73 & 0x3FDA1777 ^ v86 & 0x10));
  unsigned int v96 = v72 ^ v235 ^ v94;
  int v97 = (char *)*(&off_100079130 + (v80 ^ 0x754)) - 8;
  LODWORD(v72) = *(_DWORD *)&v97[4 * (HIBYTE(v96) ^ 0x3F)];
  HIDWORD(v15) = ~(_DWORD)v72;
  LODWORD(v15) = v72 ^ 0x1DE9534E;
  uint64_t v98 = (uint64_t)*(&off_100079130 + v80 - 1765);
  LODWORD(v74) = (v15 >> 1) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v17) ^ 0x34u)) ^ ((BYTE2(v17) ^ 0x68)
                                                                             - 114727250
                                                                             - 2
                                                                             * (((v17 >> 16) ^ 0xB768) & 0xBE ^ (v17 >> 16) & 0x10));
  unsigned int v99 = (char *)*(&off_100079130 + (int)(v80 & 0xBC56885E)) - 4;
  unsigned int v100 = *(_DWORD *)&v99[4 * (v96 ^ 0xC6)] ^ ((BYTE2(v35) ^ 0xD5)
                                                             - 114727250
                                                             - ((2 * ((v35 >> 16) ^ 0x6CD5)) & 0x15C)) ^ ((v96 ^ 0xAB) + 1069380434 + ((2 * (v96 ^ 0xAB) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v35) ^ 0x89u));
  unsigned int v101 = *(_DWORD *)(v98 + 4LL * (BYTE2(v95) ^ 0x8Cu)) ^ *(_DWORD *)&v99[4 * (v17 ^ 0xB6)] ^ ((v17 ^ 0xDB) + 1069380434 + ((2 * (v17 ^ 0xDB) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ ((BYTE2(v95) ^ 0xD0) - 114727250 - ((2 * (HIWORD(v95) ^ 0xC8D0)) & 0x15C));
  int v102 = *(_DWORD *)&v97[4 * (HIBYTE(v95) ^ 0xC8)];
  HIDWORD(v15) = ~v102;
  LODWORD(v15) = v102 ^ 0x1DE9534E;
  LODWORD(v92) = v101 + 1312414243 - ((2 * v101) & 0x9C73B446);
  unsigned int v103 = v100 + 1312414243 - ((2 * v100) & 0x9C73B446);
  LODWORD(v73) = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0x6C)];
  LODWORD(v86) = ((BYTE2(v96) ^ 0xAD) - 114727250 - ((2 * (HIWORD(v96) ^ 0x3FAD)) & 0x15C)) ^ *(_DWORD *)&v99[4 * (v35 ^ 0x1C)] ^ ((v35 ^ 0x71) + 1069380434 + ((2 * (v35 ^ 0x71) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v96) ^ 0xF1u)) ^ (v15 >> 1);
  HIDWORD(v15) = ~(_DWORD)v73;
  LODWORD(v15) = v73 ^ 0x1DE9534E;
  LODWORD(v73) = v15 >> 1;
  int v104 = *(_DWORD *)&v97[4 * ((v17 >> 24) ^ 0xB7)];
  HIDWORD(v15) = ~v104;
  LODWORD(v15) = v104 ^ 0x1DE9534E;
  uint64_t v105 = (uint64_t)*(&off_100079130 + v80 - 1760);
  unsigned int v106 = (v95 ^ 0x10) + 1069380434 + ((2 * (v95 ^ 0x10) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  LODWORD(v74) = *(_DWORD *)(v105 + 4LL * (BYTE1(v35) ^ 0xDEu)) ^ v232 ^ *(_DWORD *)&v99[4
                                                                                       * (v95 ^ 0x7D)] ^ (v74 + 1312414243 - ((2 * v74) & 0x9C73B446));
  int v107 = *(_DWORD *)(v105 + 4LL * (BYTE1(v17) ^ 0x66u));
  LODWORD(v17) = v103 ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v95) ^ 0x2Fu)) ^ (v15 >> 1);
  LODWORD(v35) = (_DWORD)v17 - ((2 * (_DWORD)v17) & 0x3E5B35E);
  unsigned int v108 = v74 ^ v106;
  LODWORD(v17) = *(_DWORD *)(v105 + 4LL * (BYTE1(v96) ^ 0x29u)) ^ v234 ^ v73 ^ v92;
  LODWORD(v86) = v107 ^ v233 ^ (v86 + 1312414243 - ((2 * v86) & 0x9C73B446));
  LODWORD(v73) = *(_DWORD *)&v97[4 * ((v74 ^ ~v106) >> 24)];
  HIDWORD(v15) = ~(_DWORD)v73;
  LODWORD(v15) = v73 ^ 0x1DE9534E;
  LODWORD(v73) = v15 >> 1;
  LODWORD(v74) = *(_DWORD *)&v97[4 * ((v17 >> 24) ^ 0x91)];
  HIDWORD(v15) = ~(_DWORD)v74;
  LODWORD(v15) = v74 ^ 0x1DE9534E;
  LODWORD(v74) = v15 >> 1;
  int v109 = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0xA3)];
  HIDWORD(v15) = ~v109;
  LODWORD(v15) = v109 ^ 0x1DE9534E;
  int v110 = v74 ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v86) ^ 0xF0u)) ^ ((BYTE2(v86) ^ 0xAC)
                                                              - 114727250
                                                              - 2 * ((WORD1(v86) ^ 0xA3AC) & 0xBF ^ WORD1(v86) & 0x11));
  LODWORD(v74) = (v15 >> 1) ^ *(_DWORD *)&v99[4 * (v17 ^ 0x7B)] ^ *(_DWORD *)(v98
                                                                                             + 4LL
                                                                                             * (BYTE2(v108) ^ 0x15u)) ^ ((BYTE2(v108) ^ 0x49) - 114727250 - ((2 * (HIWORD(v108) ^ 0xFF49)) & 0x15C)) ^ ((v17 ^ 0x16) + 1069380434 + ((2 * (v17 ^ 0x16) + 254) & 0x1A4 ^ 0xFFC2FFFF));
  LODWORD(v92) = v74 + 1312414243 - ((2 * v74) & 0x9C73B446);
  LODWORD(v35) = ((_DWORD)v35 + 32692655) ^ v231;
  unsigned int v111 = (v110 + 1312414243 - ((2 * v110) & 0x9C73B446)) ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v108) ^ 0x2Cu));
  LODWORD(v73) = v73 ^ *(_DWORD *)&v99[4 * (v86 ^ 3)] ^ ((v86 ^ 0x6E)
                                                                                      + 1069380434
                                                                                      + ((2
  LODWORD(v74) = *(_DWORD *)(v98 + 4LL * (BYTE2(v17) ^ 0x2Eu)) ^ ((BYTE2(v17) ^ 0x72)
                                                                - 114727250
                                                                - ((2 * ((v17 >> 16) ^ 0x9172)) & 0x15C));
  int v112 = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0x6F)];
  HIDWORD(v15) = ~v112;
  LODWORD(v15) = v112 ^ 0x1DE9534E;
  LODWORD(v86) = ((v108 ^ 0xFC)
                + 1069380434
                + ((2 * (v108 ^ 0xFC) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)(v105
                                                                                                 + 4LL
                                                                                                 * (BYTE1(v86) ^ 0xBDu)) ^ *(_DWORD *)&v99[4 * (v108 ^ 0x91)] ^ (v74 + 1312414243 - ((2 * v74) & 0x9C73B446)) ^ (v15 >> 1);
  unsigned int v113 = ((v35 ^ 0xE2) - 1726037377) ^ v230 ^ *(_DWORD *)&v99[4 * (v35 ^ 0x8F)] ^ (v111 - 1499549486 - ((2 * v111) & 0x4D3D61A4));
  LODWORD(v17) = *(_DWORD *)(v105 + 4LL * (BYTE1(v17) ^ 0x57u)) ^ HIDWORD(v225) ^ ((_DWORD)v73
                                                                                 + 1312414243
                                                                                 - ((2 * (_DWORD)v73) & 0x9C73B446));
  LODWORD(v86) = (v86 - ((2 * v86) & 0x80116EF0) - 1073170568) ^ v228;
  LODWORD(v35) = *(_DWORD *)(v105 + 4LL * (BYTE1(v35) ^ 0x42u)) ^ v229 ^ v92;
  int v114 = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0x2D)];
  HIDWORD(v15) = ~v114;
  LODWORD(v15) = v114 ^ 0x1DE9534E;
  LODWORD(v74) = ((v35 ^ 0xA1)
                + 1069380434
                + ((2 * (v35 ^ 0xA1) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v35 ^ 0xCC)];
  int v115 = *(_DWORD *)(v98 + 4LL * (BYTE2(v113) ^ 0xDBu)) ^ ((BYTE2(v113) ^ 0x87)
                                                         - 114727250
                                                         - 2 * ((HIWORD(v113) ^ 0x3A87) & 0xBE ^ HIWORD(v113) & 0x10)) ^ (v15 >> 1);
  LODWORD(v74) = (v74 + 1312414243 - ((2 * v74) & 0x9C73B446)) ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v113) ^ 0xDEu));
  LODWORD(v73) = ((v113 ^ 0x9E)
                + 1069380434
                + ((2 * (v113 ^ 0x9E) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v113 ^ 0xF3)];
  unsigned int v116 = (v115 + 1312414243 - ((2 * v115) & 0x9C73B446)) ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v35) ^ 0x57u));
  int v117 = ((v17 ^ 0x740CBC3A) >> 16);
  LODWORD(v92) = v117 - 114727250 - (((v17 ^ 0x740CBC3A) >> 15) & 0x15C);
  int v118 = *(_DWORD *)&v97[4 * ((v17 >> 24) ^ 0x37)];
  HIDWORD(v15) = ~v118;
  LODWORD(v15) = v118 ^ 0x1DE9534E;
  int v119 = v15 >> 1;
  int v120 = *(_DWORD *)&v97[4 * (HIBYTE(v113) ^ 0x3A)];
  HIDWORD(v15) = ~v120;
  LODWORD(v15) = v120 ^ 0x1DE9534E;
  int v121 = BYTE2(v35) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v35) ^ 0xF6u)) ^ *(_DWORD *)(v105
                                                                                + 4LL
                                                                                * ((unsigned __int16)((unsigned __int16)v17 ^ 0xBC3A) >> 8)) ^ 0xB710BC27 ^ (v15 >> 1);
  unsigned int v122 = ((v86 ^ 0x68) - 1726037377) ^ v227 ^ *(_DWORD *)&v99[4 * (v86 ^ 5)] ^ (v121 - 1499549486 - ((2 * v121) & 0x4D3D61A4));
  LODWORD(v17) = ((v17 ^ 0x3A) - 1726037377) ^ HIDWORD(v224) ^ *(_DWORD *)&v99[4
                                                                                              * (v17 ^ 0x57)] ^ (v116 - 1499549486 - ((2 * v116) & 0x4D3D61A4));
  LODWORD(v35) = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0x7C)];
  HIDWORD(v15) = ~(_DWORD)v35;
  LODWORD(v15) = v35 ^ 0x1DE9534E;
  unsigned int v123 = *(_DWORD *)(v98 + 4LL * (BYTE2(v86) ^ 0x8Eu)) ^ v225 ^ BYTE2(v86) ^ v119 ^ (v74
                                                                                   - 114727250
                                                                                   - ((2 * v74) & 0xF252CD5C));
  LODWORD(v35) = *(_DWORD *)(v105 + 4LL * (BYTE1(v86) ^ 0x57u)) ^ v226 ^ v92 ^ *(_DWORD *)(v98 + 4LL * (v117 ^ 0x5Cu)) ^ (v15 >> 1) ^ ((_DWORD)v73 + 1312414243 - ((2 * (_DWORD)v73) & 0x9C73B446));
  LODWORD(v86) = v123 ^ 0xFA64A511;
  LODWORD(v74) = ((v123 ^ 0x11) + 1069380434 + ((2 * (v123 ^ 0xFA64A511) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v123 ^ 0x7C)];
  LODWORD(v73) = *(_DWORD *)&v97[4 * (HIBYTE(v122) ^ 0x5B)];
  int v124 = v74 + 1312414243 - ((2 * v74) & 0x9C73B446);
  HIDWORD(v15) = ~(_DWORD)v73;
  LODWORD(v15) = v73 ^ 0x1DE9534E;
  int v125 = *(_DWORD *)&v97[4 * ((v17 >> 24) ^ 0x28)];
  LODWORD(v74) = (v15 >> 1) ^ *(_DWORD *)&v99[4 * (v17 ^ 0x1F)];
  HIDWORD(v15) = ~v125;
  LODWORD(v15) = v125 ^ 0x1DE9534E;
  LODWORD(v73) = v15 >> 1;
  int v126 = *(_DWORD *)&v97[4 * (HIBYTE(v123) ^ 0xB9)];
  HIDWORD(v15) = ~v126;
  LODWORD(v15) = v126 ^ 0x1DE9534E;
  int v127 = v15 >> 1;
  LODWORD(v74) = v74 ^ ((v17 ^ 0x72)
                      + 1069380434
                      + ((2 * (v17 ^ 0x72) + 254) & 0x1A4 ^ 0xFFC2FFFF));
  int v128 = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0xB4)];
  HIDWORD(v15) = ~v128;
  LODWORD(v15) = v128 ^ 0x1DE9534E;
  unsigned int v129 = v127 ^ *(_DWORD *)&v99[4 * (v35 ^ 0x8B)] ^ ((v35 ^ 0xE6)
                                                                    + 1069380434
                                                                    + ((2 * (v35 ^ 0xE6) + 254) & 0x1A4 ^ 0xFFC2FFFF));
  int v130 = BYTE2(v122) ^ 0x95;
  int v131 = v130 - 114727250 - ((2 * (HIWORD(v122) ^ 0x5B95)) & 0x15C);
  LODWORD(v83) = v122;
  unsigned int v132 = (v122 ^ 0xF4) + 1069380434 + ((2 * (v122 ^ 0xF4) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  unsigned int v133 = ((BYTE2(v17) ^ 0x14)
        - 114727250
        - 2 * (((v17 >> 16) ^ 0x2814) & 0xAF ^ (v17 >> 16) & 1)) ^ v223 ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v122) ^ 0x1Fu)) ^ (v129 + 1312414243 - ((2 * v129) & 0x9C73B446)) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v17) ^ 0x48u));
  unsigned int v134 = *(_DWORD *)(v105 + 4LL * BYTE1(v86)) ^ v224 ^ ((BYTE2(v35) ^ 0x59)
                                                      - 114727250
                                                      - ((2 * ((v35 >> 16) ^ 0xB459)) & 0x15C)) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v35) ^ 5u)) ^ (v74 + 1312414243 - ((2 * v74) & 0x9C73B446));
  LODWORD(v86) = (BYTE2(v86) - 114727250 - ((v86 >> 15) & 0x15C)) ^ HIDWORD(v223) ^ *(_DWORD *)&v99[4 * (v83 ^ 0x99)] ^ v132 ^ ((v15 >> 1) + 1312414243 - ((2 * (v15 >> 1)) & 0x9C73B446)) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v86) ^ 0x5Cu)) ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v17) ^ 0x12u));
  LODWORD(v35) = *(_DWORD *)(v105 + 4LL * (BYTE1(v35) ^ 0x34u)) ^ HIDWORD(v222) ^ v131 ^ *(_DWORD *)(v98 + 4LL * (v130 ^ 0x5Cu)) ^ v124 ^ v73;
  LODWORD(v17) = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0xEB)];
  HIDWORD(v15) = ~(_DWORD)v17;
  LODWORD(v15) = v17 ^ 0x1DE9534E;
  LODWORD(v17) = (v15 >> 1) + 1312414243 - ((2 * (v15 >> 1)) & 0x9C73B446);
  unsigned int v135 = ((BYTE2(v86) ^ 0x81) - 114727250 - ((2 * (WORD1(v86) ^ 0x1481)) & 0x15C)) ^ *(_DWORD *)(v98
                                                                                               + 4LL
                                                                                               * (BYTE2(v86) ^ 0xDDu));
  unsigned int v136 = ((v86 ^ 0x51) + 1069380434 + ((2 * (v86 ^ 0x51) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v86 ^ 0x3C)];
  LODWORD(v74) = *(_DWORD *)(v98 + 4LL * (BYTE2(v133) ^ 0xDBu)) ^ ((BYTE2(v133) ^ 0x87)
                                                                 - 114727250
                                                                 - ((2 * (HIWORD(v133) ^ 0x7787)) & 0x15C));
  unsigned int v137 = *(_DWORD *)(v98 + 4LL * (((v35 ^ 0xA87CE98B) >> 16) ^ 0x5Cu)) ^ ((v35 ^ 0xA87CE98B) >> 16) ^ (v136 - 114727250 - ((2 * v136) & 0xF252CD5C));
  int v138 = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0x14)];
  HIDWORD(v15) = ~v138;
  LODWORD(v15) = v138 ^ 0x1DE9534E;
  int v139 = v15 >> 1;
  int v140 = *(_DWORD *)&v97[4 * (HIBYTE(v134) ^ 0x9A)];
  HIDWORD(v15) = ~v140;
  LODWORD(v15) = v140 ^ 0x1DE9534E;
  int v141 = ((v35 ^ 0x8B)
        + 1069380434
        + ((2 * (v35 ^ 0xA87CE98B) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)(v105
                                                                                           + 4LL * (BYTE1(v133) ^ 0xDEu)) ^ *(_DWORD *)&v99[4 * (v35 ^ 0xE6)] ^ (v135 + 1312414243 - ((2 * v135) & 0x9C73B446)) ^ (v15 >> 1);
  int v142 = *(_DWORD *)&v97[4 * (HIBYTE(v133) ^ 0x77)];
  HIDWORD(v15) = ~v142;
  LODWORD(v15) = v142 ^ 0x1DE9534E;
  LODWORD(v17) = *(_DWORD *)(v105 + 4LL * (BYTE1(v86) ^ 0x34u)) ^ v221 ^ ((BYTE2(v134) ^ 0xE9)
                                                                        - 114727250
                                                                        - ((2 * (HIWORD(v134) ^ 0x9AE9)) & 0x15C)) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v134) ^ 0xB5u)) ^ ((v133 ^ 0x9E) + 1069380434 + ((2 * (v133 ^ 0x9E) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ v17 ^ *(_DWORD *)&v99[4 * (v133 ^ 0xF3)];
  LODWORD(v83) = *(_DWORD *)(v105 + 4LL * (BYTE1(v35) ^ 0xBu)) ^ v220 ^ v139 ^ ((v134 ^ 0xA8)
                                                                              + 1069380434
  unsigned int v143 = *(_DWORD *)(v105 + 4LL * (BYTE1(v134) ^ 0x2Du)) ^ HIDWORD(v221) ^ (v15 >> 1) ^ (v137
                                                                                       + 1312414243
                                                                                       - ((2 * v137) & 0x9C73B446));
  LODWORD(v86) = (v141 - 722293478 - ((2 * v141) & 0xA9E55A34)) ^ v222;
  int v144 = *(_DWORD *)&v97[4 * (BYTE3(v83) ^ 0x6D)];
  HIDWORD(v15) = ~v144;
  LODWORD(v15) = v144 ^ 0x1DE9534E;
  int v145 = v15 >> 1;
  unsigned int v146 = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0xFD)];
  unsigned int v147 = *(_DWORD *)(v98 + 4LL * (((v83 ^ 0x2E0E654A) >> 16) ^ 0x5Cu)) ^ (~v146 << 31) ^ (v146 >> 1) ^ (((v83 ^ 0x2E0E654A) >> 16) - 114727250 - (((v83 ^ 0x2E0E654A) >> 15) & 0x15C)) ^ 0xEF4A9A7;
  int v148 = ((v83 ^ 0x4A) + 1069380434 + ((2 * (v83 ^ 0x2E0E654A) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v83 ^ 0x27)];
  LODWORD(v73) = v147 + 1312414243 - ((2 * v147) & 0x9C73B446);
  int v149 = *(_DWORD *)&v97[4 * (HIBYTE(v143) ^ 0xAE)];
  HIDWORD(v15) = ~v149;
  LODWORD(v15) = v149 ^ 0x1DE9534E;
  int v150 = (v15 >> 1) ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v86) ^ 0xA4u)) ^ (v148 + 1312414243 - ((2 * v148) & 0x9C73B446));
  LODWORD(v92) = v150 - 114727250 - ((2 * v150) & 0xF252CD5C);
  unsigned int v151 = *(_DWORD *)(v98 + 4LL * (BYTE2(v143) ^ 0x3Au)) ^ v145 ^ *(_DWORD *)&v99[4 * (v86 ^ 0x4D)] ^ ((v86 ^ 0x20) + 1069380434 + ((2 * (v86 ^ 0x20) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ ((BYTE2(v143) ^ 0x66) - 114727250 - 2 * ((HIWORD(v143) ^ 0xAE66) & 0xAF ^ HIWORD(v143) & 1));
  LODWORD(v35) = ((v143 ^ 0xB3)
                - 413623133
                + ((2 * (v143 ^ 0xB3) + 126) & 0x46 ^ 0xEFCE7BFF)) ^ *(_DWORD *)(v105
                                                                                                + 4LL
                                                                                                * (BYTE1(v83) ^ 0x65u));
  LODWORD(v35) = ((_DWORD)v35 - 1499549486 - ((2 * (_DWORD)v35) & 0x4D3D61A4)) ^ *(_DWORD *)&v99[4
                                                                                               * (v143 ^ 0xDE)];
  LODWORD(v86) = *(_DWORD *)(v98 + 4LL * (BYTE2(v86) ^ 0x40u)) ^ ((BYTE2(v86) ^ 0x1C)
                                                                - 114727250
                                                                - ((2 * (WORD1(v86) ^ 0xFD1C)) & 0x15C));
  LODWORD(v86) = (v86 ^ 0xD9E215AF ^ -(v86 ^ 0xD9E215AF) ^ ((v86 ^ v35 ^ 0x431D28D3)
                                                          + (v35 ^ 0x6500C283)
                                                          + 1))
               + (v35 ^ 0x6500C283);
  LODWORD(v35) = *(_DWORD *)&v97[4 * ((v17 ^ 0x3F162902) >> 24)];
  HIDWORD(v15) = ~(_DWORD)v35;
  LODWORD(v15) = v35 ^ 0x1DE9534E;
  int v152 = *(_DWORD *)(v105 + 4LL * (BYTE1(v143) ^ 0x7Cu));
  unsigned int v153 = ((v17 ^ 0x3F162902) >> 16) ^ v219 ^ *(_DWORD *)(v98 + 4LL * (((v17 ^ 0x3F162902) >> 16) ^ 0x5Cu)) ^ v92;
  unsigned int v154 = (v15 >> 1) ^ HIDWORD(v218) ^ v86;
  unsigned int v155 = *(_DWORD *)(v105 + 4LL * (BYTE1(v17) ^ 0xCBu)) ^ HIDWORD(v219) ^ (v151 + 1312414243 - ((2 * v151) & 0x9C73B446));
  LODWORD(v35) = v152 ^ HIDWORD(v220) ^ ((v17 ^ 2)
                                       + 1069380434
                                       + ((2 * (v17 ^ 0x3F162902) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v17 ^ 0x6F)] ^ v73;
  LODWORD(v86) = ((BYTE2(v35) ^ 0xE9) - 114727250 - ((2 * ((v35 >> 16) ^ 0xB8E9)) & 0x15C)) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v35) ^ 0xB5u));
  int v156 = *(_DWORD *)&v97[4 * (HIBYTE(v153) ^ 0x9D)];
  HIDWORD(v15) = ~v156;
  LODWORD(v15) = v156 ^ 0x1DE9534E;
  int v157 = v15 >> 1;
  LODWORD(v73) = *(_DWORD *)&v97[4 * (HIBYTE(v155) ^ 0x61)];
  HIDWORD(v15) = ~(_DWORD)v73;
  LODWORD(v15) = v73 ^ 0x1DE9534E;
  LODWORD(v17) = *(_DWORD *)&v99[4 * (v35 ^ 0xC5)] ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v153) ^ 0x28u)) ^ ((v35 ^ 0xA8) + 1069380434 + ((2 * (v35 ^ 0xA8) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ ((BYTE2(v153) ^ 0x74) - 114727250 - ((2 * (HIWORD(v153) ^ 0x9D74)) & 0x15C)) ^ (v15 >> 1);
  int v158 = v157 ^ ((BYTE2(v154) ^ 0xE6) - 114727250 - 2 * ((HIWORD(v154) ^ 0xB0E6) & 0xAF ^ HIWORD(v154) & 1)) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v154) ^ 0xBAu));
  LODWORD(v73) = v153;
  LODWORD(v92) = (v153 ^ 0xD9)
               + 1069380434
               + ((2 * (v153 ^ 0xD9) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  int v159 = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0xB8)];
  HIDWORD(v15) = ~v159;
  LODWORD(v15) = v159 ^ 0x1DE9534E;
  unsigned int v160 = (v155 ^ 0x85) + 1069380434 + ((2 * (v155 ^ 0x85) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  int v161 = ((BYTE2(v155) ^ 8) - 114727250 - ((2 * (HIWORD(v155) ^ 0x6108)) & 0x15C)) ^ *(_DWORD *)(v98
                                                                                               + 4LL
                                                                                               * (BYTE2(v155) ^ 0x54u)) ^ *(_DWORD *)&v99[4 * (v154 ^ 0x29)] ^ ((v154 ^ 0x44) + 1069380434 + ((2 * (v154 ^ 0x44) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ (v15 >> 1);
  LODWORD(v17) = *(_DWORD *)(v105 + 4LL * (BYTE1(v154) ^ 0xDDu)) ^ HIDWORD(v217) ^ ((_DWORD)v17
                                                                                  + 1312414243
                                                                                  - ((2 * (_DWORD)v17) & 0x9C73B446));
  LODWORD(v83) = *(_DWORD *)&v97[4 * (HIBYTE(v154) ^ 0xB0)];
  HIDWORD(v15) = ~(_DWORD)v83;
  LODWORD(v15) = v83 ^ 0x1DE9534E;
  unsigned int v162 = *(_DWORD *)(v105 + 4LL * (BYTE1(v153) ^ 0xBDu)) ^ v218 ^ (v161 + 1312414243 - ((2 * v161) & 0x9C73B446));
  int v163 = *(_DWORD *)&v99[4 * (v155 ^ 0xE8)];
  unsigned int v164 = *(_DWORD *)(v105 + 4LL * (BYTE1(v155) ^ 0x8Fu)) ^ HIDWORD(v216) ^ *(_DWORD *)&v99[4
                                                                                         * (v73 ^ 0xB4)] ^ v92 ^ (v15 >> 1) ^ (v86 + 1312414243 - ((2 * v86) & 0x9C73B446));
  LODWORD(v86) = v160 ^ v217 ^ v163 ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v35) ^ 0x2Du)) ^ (v158
                                                                                      + 1312414243
                                                                                      - ((2 * v158) & 0x9C73B446));
  int v165 = BYTE2(v162);
  int v166 = *(_DWORD *)&v97[4 * (HIBYTE(v164) ^ 0x18)];
  unsigned int v167 = ((BYTE2(v86) ^ 0x66) - 114727250 - 2 * ((WORD1(v86) ^ 0xAE66) & 0xAF ^ WORD1(v86) & 1)) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v86) ^ 0x3Au));
  HIDWORD(v15) = ~v166;
  LODWORD(v15) = v166 ^ 0x1DE9534E;
  LODWORD(v35) = ((v15 >> 1) - 114727250 - ((2 * (v15 >> 1)) & 0xF252CD5C)) ^ *(_DWORD *)(v98
                                                                                        + 4LL * (BYTE2(v162) ^ 0x40u));
  int v168 = *(_DWORD *)&v97[4 * (HIBYTE(v162) ^ 0xEF)];
  HIDWORD(v15) = ~v168;
  LODWORD(v15) = v168 ^ 0x1DE9534E;
  int v169 = (v15 >> 1) ^ *(_DWORD *)&v99[4 * (v164 ^ 0x90)] ^ ((v164 ^ 0xFD)
                                                                           + 1069380434
                                                                           + ((2 * (v164 ^ 0xFD) + 254) & 0x1A4 ^ 0xFFC2FFFF));
  LODWORD(v73) = v167 + 1312414243 - ((2 * v167) & 0x9C73B446);
  unsigned int v170 = *(_DWORD *)&v99[4 * (v17 ^ 0x27)] ^ ((v17 ^ 0x4A)
                                                             + 1069380434
                                                             + ((2 * (v17 ^ 0x4A) + 254) & 0x1A4 ^ 0xFFC2FFFF));
  LODWORD(v83) = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0xAE)];
  HIDWORD(v15) = ~(_DWORD)v83;
  LODWORD(v15) = v83 ^ 0x1DE9534E;
  int v171 = (v15 >> 1) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v164) ^ 0xFu)) ^ (v170 - 114727250 - ((2 * v170) & 0xF252CD5C));
  LODWORD(v74) = *(_DWORD *)&v97[4 * ((v17 >> 24) ^ 0xDC)];
  HIDWORD(v15) = ~(_DWORD)v74;
  LODWORD(v15) = v74 ^ 0x1DE9534E;
  unsigned int v172 = (_DWORD)v35 + 1312414243 - ((2 * (_DWORD)v35) & 0x9C73B446);
  LODWORD(v35) = ((BYTE2(v17) ^ 0xE)
                - 114727250
                - 2 * (((v17 >> 16) ^ 0xDC0E) & 0xBF ^ (v17 >> 16) & 0x11)) ^ v216 ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v86) ^ 0x7Cu)) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v17) ^ 0x52u)) ^ (v169 + 1312414243 - ((2 * v169) & 0x9C73B446));
  LODWORD(v83) = v86;
  unsigned int v173 = (v86 ^ 0xB3) + 1069380434 + ((2 * (v86 ^ 0xB3) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  LODWORD(v86) = *(_DWORD *)(v105 + 4LL * (BYTE1(v164) ^ 0x1Bu)) ^ HIDWORD(v215) ^ *(_DWORD *)&v99[4
                                                                                                 * (v162 ^ 0x4D)] ^ ((v162 ^ 0x20) + 1069380434 + ((2 * (v162 ^ 0x20) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ (v15 >> 1) ^ v73;
  LODWORD(v17) = v172 ^ HIDWORD(v214) ^ v173 ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v17) ^ 0x65u)) ^ *(_DWORD *)&v99[4 * (v83 ^ 0xDE)];
  LOBYTE(v73) = v17 ^ BYTE2(v162);
  unsigned int v174 = *(_DWORD *)(v105 + 4LL * (BYTE1(v162) ^ 0xA4u)) ^ v215 ^ (v171 + 1312414243 - ((2 * v171) & 0x9C73B446));
  LODWORD(v92) = v17 ^ v165 ^ 0x7641388B;
  int v175 = (v174 ^ BYTE2(v164));
  LODWORD(v83) = *(_DWORD *)&v97[4 * BYTE3(v92)];
  HIDWORD(v15) = ~(_DWORD)v83;
  LODWORD(v15) = v83 ^ 0x1DE9534E;
  LODWORD(v83) = v15 >> 1;
  int v176 = *(_DWORD *)&v97[4 * ((v35 ^ 0xF7E9CFA8) >> 24)];
  HIDWORD(v15) = ~v176;
  LODWORD(v15) = v176 ^ 0x1DE9534E;
  int v177 = v15 >> 1;
  unsigned int v178 = (BYTE2(v92) - 114727250 - ((v17 >> 15) & 0x15C)) ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v92) ^ 0x5Cu));
  int v179 = *(_DWORD *)&v97[4 * (HIBYTE(v174) ^ 0xE7)];
  HIDWORD(v15) = ~v179;
  LODWORD(v15) = v179 ^ 0x1DE9534E;
  int v180 = v15 >> 1;
  int v181 = v83 ^ *(_DWORD *)&v99[4 * (v175 ^ 0x18)] ^ (((v35 ^ 0xF7E9CFA8) >> 16)
                                                   - 114727250
                                                   - (((v35 ^ 0xF7E9CFA8) >> 15) & 0x15C)) ^ *(_DWORD *)(v98 + 4LL * (((v35 ^ 0xF7E9CFA8) >> 16) ^ 0x5Cu)) ^ ((~(2 * (v175 ^ 0x75) + 4031742) | 0xFFC2FE5B) + (v175 ^ 0x75) + 1069380434);
  unsigned int v182 = (v181 + 1312414243 - ((2 * v181) & 0x9C73B446)) ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v86) ^ 0xECu));
  int v183 = v177 ^ *(_DWORD *)(v98 + 4LL * (BYTE2(v86) ^ 0xA7u)) ^ ((BYTE2(v86) ^ 0xFB)
                                                               - 114727250
                                                               - ((2 * (WORD1(v86) ^ 0x57FB)) & 0x15C)) ^ (v92 + 1069380434 + ((2 * v92 + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v73 ^ 0xE6)];
  LODWORD(v83) = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0x57)];
  HIDWORD(v15) = ~(_DWORD)v83;
  LODWORD(v15) = v83 ^ 0x1DE9534E;
  unsigned int v184 = (v183 + 1312414243 - ((2 * v183) & 0x9C73B446)) ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v174) ^ 0x6Du));
  int v185 = HIWORD(v174) ^ 0xE731;
  LODWORD(v9_Block_object_dispose(va, 8) = *(_DWORD *)(v98 + 4LL * (v185 ^ 0x5Cu));
  int v186 = *(_DWORD *)(v105 + 4LL * (BYTE1(v35) ^ 0x2Du));
  LODWORD(v86) = v86;
  unsigned int v187 = ((v35 ^ 0xA8)
        + 1069380434
        + ((2 * (v35 ^ 0xF7E9CFA8) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ (v185
                                                                                - 114727250
                                                                                - ((2 * v185) & 0x15C)) ^ *(_DWORD *)&v99[4 * (v35 ^ 0xC5)];
  LODWORD(v83) = *(_DWORD *)&v99[4 * (v86 ^ 0x42)];
  LODWORD(v35) = (v86 ^ 0x2F) + 1069380434 + ((2 * (v86 ^ 0x2F) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  LODWORD(v86) = HIDWORD(v206) ^ *(_DWORD *)(v105 + 4LL * (BYTE1(v17) ^ 0xDAu)) ^ ((v187 ^ (v15 >> 1) ^ v98)
                                                                                 + 1312414243
                                                                                 - ((2 * (v187 ^ (v15 >> 1) ^ v98)) & 0x9C73B446));
  LODWORD(v17) = (v184 - 512663828 - ((2 * v184) & 0xC2E2BDD8)) ^ v214;
  LODWORD(v105) = (v182 - 595648296 - ((2 * v182) & 0xB8FE41B0)) ^ HIDWORD(v213);
  LODWORD(v99) = v186 ^ v213 ^ v35 ^ v180 ^ v83 ^ (v178 + 1312414243 - ((2 * v178) & 0x9C73B446));
  BYTE2(v187) = BYTE2(v86) ^ 0x8C;
  LODWORD(v35) = v105 ^ 0x351D74B9;
  LODWORD(v34) = *(_DWORD *)(v10 - 116);
  unsigned int v188 = (char *)*(&off_100079130 + (int)v34 - 1801) - 4;
  int v189 = (char *)*(&off_100079130 + (int)v34 - 1668) - 8;
  unsigned int v190 = (char *)*(&off_100079130 + (int)v34 - 1699) - 8;
  int v191 = (*(_DWORD *)&v190[4 * (BYTE2(v17) ^ 0x9E)] - 1066110617) ^ (*(_DWORD *)&v188[4 * (v99 ^ 0xC9)]
                                                                   + 1161575469);
  uint64_t v192 = *(unsigned int *)&v188[4 * (v86 ^ 0xC8)];
  int v193 = (*(_DWORD *)&v190[4 * (BYTE2(v99) ^ 0x38)] - 1066110617) ^ (*(_DWORD *)&v189[4
                                                                                    * ((v86 ^ 0x898C5DC8) >> 24)]
                                                                   + 74050895) ^ (*(_DWORD *)&v188[4
                                                                                                 * (v17 ^ 0xA2)]
                                                                                + 1161575469);
  LODWORD(v9_Block_object_dispose(va, 8) = *(_DWORD *)&v188[4 * (v105 ^ 0xB9)];
  uint64_t v194 = *(unsigned int *)&v189[4 * ((v17 >> 24) ^ 0xE7)];
  LODWORD(v18_Block_object_dispose(va, 8) = *(_DWORD *)&v189[4 * ((v99 >> 24) ^ 0xB8)];
  uint64_t v195 = (uint64_t)*(&off_100079130 + (int)v34 - 1817);
  LODWORD(v86) = *(_DWORD *)(v195 + 4LL * (BYTE1(v86) ^ 0x61u)) ^ (*(_DWORD *)&v189[4 * (BYTE3(v105) ^ 0x65)] + 74050895);
  LODWORD(v105) = *(_DWORD *)(v195 + 4LL * (BYTE1(v17) ^ 0xA0u));
  LODWORD(v99) = *(_DWORD *)(v195 + 4LL * (BYTE1(v99) ^ 0xE9u));
  LODWORD(v86) = (v191 - 839040011 - ((2 * v191) & 0x9BFA87EA)) ^ v86;
  LODWORD(v92) = *(_DWORD *)&v190[4 * BYTE2(v187)];
  LODWORD(v189) = *(_DWORD *)&v190[4 * BYTE2(v35)];
  LODWORD(v97) = *(_DWORD *)(v195 + 4LL * BYTE1(v35)) ^ HIDWORD(v208) ^ (v193 - 839040011 - ((2 * v193) & 0x9BFA87EA));
  LODWORD(v17) = HIDWORD(a6) ^ HIDWORD(v213) ^ (v86 - 595648296 - ((2 * v86) & 0xB8FE41B0));
  uint64_t v196 = ((unsigned __int16)(*(_WORD *)(v195 + 4LL * BYTE1(v35)) ^ WORD2(v208) ^ (v193
                                                                                                 + 17397
                                                                                                 - ((2 * v193) & 0x87EA))) >> 8) ^ 0x99LL;
  unsigned int v197 = (char *)*(&off_100079130 + (int)v34 - 1741) - 12;
  a1[*(void *)(v10 - 248)] = v197[v196] ^ 0x5D;
  int v198 = (char *)*(&off_100079130 + (int)v34 - 1818) - 4;
  a1[*(void *)(v10 - 240)] = (v198[BYTE2(v17) ^ 0xADLL] - 42) ^ 0xC5;
  LODWORD(v196) = v105 ^ HIDWORD(a6) ^ (v192 - ((2 * v192 - 1971816358) & 0x9BFA87EA) + 322535458) ^ ((_DWORD)v188 + 74050895) ^ ((_DWORD)v189 - 1066110617);
  int v199 = (char *)*(&off_100079130 + SHIDWORD(v205)) - 8;
  a1[*(void *)(v10 - 200)] = v199[v97 ^ 0xFCLL] ^ 0x42;
  a1[*(void *)(v10 - 216)] = (v198[BYTE2(v196) ^ 0x8CLL] - 42) ^ 0x47;
  unsigned int v200 = (char *)*(&off_100079130 + (int)v205) - 12;
  a1[*(void *)(v10 - 232)] = (v200[(v97 >> 24) ^ 0xDELL] + 24) ^ 0x1B;
  a1[*(void *)(v10 - 224)] = ((v198[BYTE2(v97) ^ 0x15LL] + ((v198[BYTE2(v97) ^ 0x15LL] - 42) ^ 0xDA) - 41) ^ 0xFE)
                             + v198[BYTE2(v97) ^ 0x15LL]
                             - 42;
  uint64_t v201 = (v98 + 1161575469);
  uint64_t v202 = v206 ^ v99 ^ ((_DWORD)v92 - 1066110617) ^ v201 ^ ((_DWORD)v194 - ((2 * (_DWORD)v194 + 148101790) & 0x9BFA87EA) - 764989116);
  a1[*(void *)(v10 - 208)] = v199[(v206 ^ v99 ^ (v92 + 103) ^ v201 ^ (v194 - ((2 * v194 - 98) & 0xEA) + 68)) ^ 5LL] ^ 0xB0;
  a1[*(void *)(v10 - 152)] = (v200[(v17 >> 24) ^ 0x4ELL] + 24) ^ 0xE6;
  a1[*(void *)(v10 - 144)] = (v200[BYTE3(v196) ^ 0x9CLL] + 24) ^ 0xB8;
  uint64_t v203 = *(void *)(v10 - 176);
  a1[v203] = (v200[BYTE3(v202) ^ 0x67LL] + 24) ^ 0x91;
  a1[*(void *)(v10 - 160)] = v199[v196 ^ 0xF2LL] ^ 0xBA;
  a1[*(void *)(v10 - 192)] = v197[BYTE1(v196) ^ 0x1ELL] ^ 0xFE;
  a1[*(void *)(v10 - 168)] = v197[((unsigned __int16)(v206 ^ (unsigned __int16)v99 ^ (v92 + 29031) ^ v201 ^ (v194 - ((2 * v194 - 9570) & 0x87EA) + 12612)) >> 8) ^ 0x33LL] ^ 0xE7;
  a1[*(void *)(v10 - 184)] = v197[BYTE1(v17) ^ 0xBCLL] ^ 0x29;
  a1[*(void *)(v10 - 136)] = v199[v17 ^ 0x9FLL] ^ 0x42;
  a1[*(void *)(v10 - 128)] = (v198[BYTE2(v202) ^ 0xDLL] - 42) ^ 0x8E;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t (**)(int, int, int, int, int, int, int, int, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v10 - 256) + 8LL * (int)((v34 - 568) | (2 * ((((_DWORD)v203 - 1332899240 - ((2 * (_DWORD)v203 + 32) & 0x611B24B0) + 16) ^ 0xB08D9258) < v56 + 9013377)))) - 8LL))( v201,  v202,  v194,  &off_100079130,  66LL,  v192,  v195,  v199,  a2,  a3,  a4,  a1,  a6,  v205,  v206,  v207,  v208,  v209,  v210,  v211,  v212,  v213,  v214,  v215,  v216,  v217,  v218,  v219,  v220,  v221,  v222,  v223,  v224,  v225);
}

void sub_100053864()
{
}

uint64_t sub_100053898(uint64_t a1, uint64_t a2, int a3)
{
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * (((253 * (v4 ^ 0x6E) - 204) * (v3 != a3)) ^ v4))
}

uint64_t sub_1000538D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void, void))(*(void *)(v7
                                                                                        + 8LL
                                                                                        * ((1004
                                                                                          * ((((v6 & 8) == 0) ^ (a6 + 75)) & 1)) ^ a6))
                                                                            - 8LL))( a1,  a2,  a3,  (a2 - a3),  (a6 + 331) | 0x400u);
}

uint64_t sub_10005390C@<X0>(int a1@<W0>, int a2@<W2>, int a3@<W6>, uint64_t a4@<X8>)
{
  *(_DWORD *)(v12 - 12_Block_object_dispose(va, 8) = v11;
  *(_DWORD *)(v12 - 136) = v7;
  unsigned int v13 = (a3 ^ 0xFFFFF88F) & v7;
  int v14 = -a2;
  *(_DWORD *)(v12 - 144) = v13;
  char v15 = v10 + v9 + v8;
  *(_DWORD *)(v12 - 1memset((void *)(v1 - 204), 50, 16) = a3 ^ 0x721;
  uint64_t v16 = (v14 + v10 + v9 + a1);
  v18.val[0].i64[0] = ((_BYTE)v14 + (_BYTE)v10 + (_BYTE)v9 + (_BYTE)a1) & 0xF;
  v18.val[0].i64[1] = ((_BYTE)v14 + v15 - 81) & 0xF;
  v18.val[1].i64[0] = ((_BYTE)v14 + v15 + 5 * *(_BYTE *)(v12 - 116)) & 0xF;
  v18.val[1].i64[1] = ((_BYTE)v14 + v15 - 83) & 0xF;
  v18.val[2].i64[0] = ((_BYTE)v14 + v15 - 84) & 0xF;
  v18.val[2].i64[1] = ((_BYTE)v14 + v15 - 85) & 0xF;
  v18.val[3].i64[0] = ((_BYTE)v14 + v15 - 86) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)v14 + v15 - 87) & 0xF;
  *(int8x8_t *)(a4 - 7 + vmemset((void *)(v1 - 204), 50, 16) = veor_s8( veor_s8( veor_s8(*(int8x8_t *)(v5 + (v16 & 0xF) - 7), *(int8x8_t *)(a4 - 7 + v16)),  veor_s8(*(int8x8_t *)((v16 & 0xF) + v4 - 5), *(int8x8_t *)((v16 & 0xF) + v6 - 3))),  vrev64_s8( vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8(v18, (int8x16_t)xmmword_100061B70),  (int8x8_t)0x7777777777777777LL)));
  return (*(uint64_t (**)(__n128))(*(void *)(v12 - 256) + 8LL * (a3 ^ 2 | (2 * (v14 != 8 - v13)))))((__n128)xmmword_100061B70);
}

void sub_100053A48()
{
}

uint64_t sub_100053A70()
{
}

uint64_t sub_100053AB4@<X0>(int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  uint64_t v8 = (a1 - 141255584);
  *(_BYTE *)(a3 + v8) ^= *(_BYTE *)(v5 + (v8 & 0xF)) ^ *(_BYTE *)((v8 & 0xF) + v4 + 2) ^ *(_BYTE *)((v8 & 0xF) + v6 + 4) ^ (119 * (v8 & 0xF));
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((19 * (a1 - 1 != v3)) ^ (a2 - 1753))) - 8LL))();
}

void sub_100053B20()
{
  if (v0 == 1807390555) {
    int v1 = 1645153785;
  }
  else {
    int v1 = -1645193695;
  }
  *(_DWORD *)(v2 + 32) = v1;
}

void sub_100053B84(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 1374699841 * ((a1 + 2125213654 - 2 * (a1 & 0x7EAC2FD6)) ^ 0x135837DF);
  int v3 = *(unint64_t **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = *(unint64_t **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v2 - 0x7542B2AE577378FLL);
  unsigned int v11 = v1 + 1224239923 * ((&v7 & 0x62925DD | ~(&v7 | 0x62925DD)) ^ 0xB6527F5) + 865;
  uint64_t v12 = v6;
  int v9 = &STACK[0xC7F991DE6408E4D];
  uint64_t v10 = v5;
  uint64_t v7 = v2;
  uint64_t v8 = v4;
  ((void (*)(uint64_t *))*(&off_100079130 + v1 - 893))(&v7);
  uint64_t v7 = *(void *)(v2 - 0x7542B2AE5773797LL);
  uint64_t v8 = &STACK[0xC7F991DE6408E5D];
  LODWORD(v9) = v1
              + 1374699841
  sub_100016BB0((uint64_t)&v7);
  LODWORD(v7) = v1 + 235795823 * (&v7 ^ 0x94AD4959) - 662;
  uint64_t v8 = v3;
  sub_100023E58((uint64_t)&v7);
  __asm { BR              X8 }

uint64_t sub_100053D88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t), uint64_t a12)
{
  *(_DWORD *)(v19 - 112) = v13 + 1224239923 * ((v19 + 1260386870 - 2 * ((v19 - 144) & 0x4B1FFAC6)) ^ 0xB9AC0711) + 1606;
  *(void *)(v19 - 144) = v14;
  *(void *)(v19 - 136) = a12;
  *(void *)(v19 - 104) = v17;
  *(void *)(v19 - 12_Block_object_dispose(va, 8) = v17;
  *(void *)(v19 - 120) = v15;
  uint64_t v20 = a11(v19 - 144);
  return ((uint64_t (*)(uint64_t))(*(void *)(v12
                                                      + 8LL
                                                      * ((111
}

uint64_t sub_100053E40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(void *)(v19 - 136) = v15;
  *(void *)(v19 - 12_Block_object_dispose(va, 8) = v16;
  *(_DWORD *)(v19 - 144) = (v17 + 791) ^ (1225351577
                                        * ((((2 * ((v19 - 144) ^ 0x34E6FF81)) | 0xB1E44DAA)
                                          - ((v19 - 144) ^ 0x34E6FF81)
                                          + 655218987) ^ 0xCF8E0142));
  *(void *)(v19 - 120) = v16;
  *(void *)(v19 - 112) = v14;
  ((void (*)(uint64_t))((char *)*(&off_100079130 + v17 - 260) - 4))(v19 - 144);
  int v20 = 1374699841
      * ((~((v19 - 144) ^ 0xCE91F438 | 0xE3331AF3) + (((v19 - 144) ^ 0xCE91F438) & 0xE3331AF3)) ^ 0xBFA9093D);
  *(_DWORD *)(v19 - 144) = (v17 + 1030) ^ v20;
  *(_DWORD *)(v19 - 12_Block_object_dispose(va, 8) = -313388985 - v20 + v18;
  *(void *)(v19 - 136) = a13;
  uint64_t v21 = sub_10004705C(v19 - 144);
  return (*(uint64_t (**)(uint64_t))(v13 + 8LL * ((114 * (*(_DWORD *)(v19 - 140) == 538735252)) ^ v17)))(v21);
}

uint64_t sub_100053F64()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * ((111
}

uint64_t sub_100053FA8()
{
  uint64_t v5 = *(void *)(v8 + 24);
  int v6 = 1224239923 * ((((v4 - 144) | 0x5ECCF06D) + (~(v4 - 144) | 0xA1330F92)) ^ 0xAC7F0DBB);
  *(_DWORD *)(v4 - 144) = v6 ^ 0x3EAF37E3;
  *(void *)(v4 - 136) = v10;
  *(_DWORD *)(v4 - 12_Block_object_dispose(va, 8) = v6 + v3 - 849;
  sub_100018B40((_DWORD *)(v4 - 144));
  *(void *)(v4 - 144) = v0;
  *(void *)(v4 - 136) = v10;
  *(void *)(v4 - 104) = v2;
  *(void *)(v4 - 12_Block_object_dispose(va, 8) = v2;
  *(void *)(v4 - 120) = v1;
  *(_DWORD *)(v4 - 112) = v3
                        + 1224239923 * ((2 * ((v4 - 144) & 0x10151408) - (v4 - 144) - 269816843) ^ 0x1D591622)
                        + 865;
  v9(v4 - 144);
  *(_DWORD *)(v4 - 12_Block_object_dispose(va, 8) = v3 + 1374699841 * ((v4 - 144) ^ 0x6DF41809) + 406;
  *(void *)(v4 - 144) = v2;
  *(void *)(v4 - 136) = v5;
  return sub_100016BB0(v4 - 144);
}

void sub_1000540CC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32) ^ (1225351577 * ((-2 - ((a1 | 0x21ABC784) + (~(_DWORD)a1 | 0xDE54387B))) ^ 0xFDCEE06D));
  __asm { BR              X10 }

uint64_t sub_10005419C@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  unsigned int v12 = 1755732067 * ((2 * (&a4 & 0x17931B20) - &a4 + 1751966942) ^ 0xB6AA5905);
  a8 = v12 ^ 0x6228DDF;
  a7 = &STACK[0x37021DA481391552];
  a4 = &STACK[0x42E48BBDD224DE45];
  a5 = v11;
  a6 = (v10 - 136) ^ v12;
  uint64_t v13 = ((uint64_t (*)(unint64_t **))(*(void *)(a1 + 8LL * (v10 ^ 0x14F)) - 8LL))(&a4);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8LL
                                            * (((*(_DWORD *)(v11 - 0x27681A84B35EB0EDLL) == v8) * ((v10 + 48) ^ 0x53C)) ^ v10)))(v13);
}

uint64_t sub_100054280( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  return ((uint64_t (*)(void))(*(void *)(v11
                                        + 8LL
                                        * ((((a10 == v10) ^ (v12 + 1)) & 1 | (8
}

uint64_t sub_1000542C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11)
{
  *(_BYTE *)(v11 + (v13 + v12)) = *(_BYTE *)(a11 + (v13 + v12)) ^ 0x32;
  BOOL v17 = ((v16 - 1825813931) & 0x6CD3B57A ^ (v12 + 351)) + v13 < (a10 ^ v14);
  return ((uint64_t (*)(void))(*(void *)(v15 + 8LL * ((v17 | (8 * v17)) ^ v16)) - 4LL))();
}

void sub_10005432C(_DWORD *a1@<X8>)
{
  uint64_t v4 = *(void *)(v3 + 16);
  *(void *)(*(void *)(v3 + 24) - 0x1E6EF7153090DC2LL) = v1;
  *(_DWORD *)(v4 - 0x72E1645BEBB64013LL) = v2;
  *(_DWORD *)uint64_t v3 = *a1;
}

void sub_100054394(_DWORD *a1)
{
  unsigned int v1 = *a1 + 108757529 * ((2 * (a1 & 0x5EAB9BD4) - (_DWORD)a1 - 1588304853) ^ 0x41C80600);
  __asm { BR              X14 }

uint64_t sub_100054454(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (int)(((*(_DWORD *)(*(void *)(a1 + 8) + v4) != v3)
                                               * (((v1 + 1019832448) & 0xC336977F) + 614)) ^ (v1 + 1138)))
                            - ((v1 + 670) | 0x304u)
                            + 1800LL))();
}

uint64_t sub_1000544AC()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * (int)(((((((10 * (v2 ^ 0x731)) ^ 0xF68072D2) + v3) * (v0 - 159353952)) >> 31)
                                               * ((v2 - 1130536225) & 0x4362977E ^ 0x130)) | v2))
                            - 8LL))();
}

uint64_t sub_100054510@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = v2;
  unsigned int v6 = v3 - 535753261 * ((&v5 & 0xF4826C3B | ~(&v5 | 0xF4826C3B)) ^ 0x1899DEB) - 229;
  uint64_t v7 = a1;
  uint64_t v8 = v2;
  return ((uint64_t (*)(uint64_t *))(*(void *)(v1 + 8LL * (v3 - 231)) - 4LL))(&v5);
}

void sub_100054658(uint64_t a1)
{
  __asm { BR              X8 }

void sub_100054778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = *(unsigned __int8 **)(a4 + 8LL * (a5 ^ (a5 - 19)));
  BOOL v11 = ((**(unsigned __int8 **)(a7 + 80) - (*v9 ^ 0x32)) ^ 0x76DF27E7)
      + ((2 * (**(unsigned __int8 **)(a7 + 80) - (*v9 ^ 0x32))) & 0xEDBE4FCE)
      - 1183589858 == 1608824740 - v7
     && a6 != 2441235919LL;
  __asm { BR              X15 }

uint64_t sub_100055864@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  *(_BYTE *)(v2 + (v4 - 266921706)) = *(_BYTE *)(a2 + (v4 - 266921706));
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * ((117 * (((a1 + 94) ^ 0xFFFFFC70) + v4 == v3)) ^ a1)) - 12LL))();
}

void sub_1000558AC(uint64_t a1)
{
  int v1 = 1759421093 * (a1 ^ 0xB37DB054);
  if (*(void *)(a1 + 24)) {
    BOOL v2 = *(_DWORD *)(a1 + 20) - v1 == 603303756;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  __asm { BR              X8 }

uint64_t sub_100055958()
{
  BOOL v3 = (*(uint64_t (**)(uint64_t))(v0 + 8LL * (v2 ^ 0x302)))(32LL) == 0;
}

uint64_t sub_1000559C4()
{
  BOOL v4 = v1 != v0 + ((v3 - 1653570193) & 0x628F7D0B) - 1027;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (((2 * v4) | (4 * v4)) ^ v3)) - 8LL))();
}

uint64_t sub_100055A1C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v11 = v2 - 603303757;
  int v12 = v2 - 1;
  int v13 = *(unsigned __int8 *)(v6 + v11);
  if (v13 == 50) {
    __asm { BR              X11 }
  }

  if (v13 == 178)
  {
    int v14 = 1645153785;
    uint64_t v15 = *(void *)(v4 + 8);
    int v16 = *(unsigned __int8 *)(v4 + 16) ^ v5;
    *(void *)uint64_t result = v6;
    *(_DWORD *)(result + _Block_object_dispose(va, 8) = v7;
    *(_DWORD *)(result + 12) = v12;
    if (v16 == 24) {
      int v17 = -1454758981;
    }
    else {
      int v17 = -1454758982;
    }
    *(_DWORD *)(result + memset((void *)(v1 - 204), 50, 16) = 310716794;
    *(_DWORD *)(result + 20) = v17;
    *(_DWORD *)(result + 24) = 1645153785;
    *(void *)(v15 - 0x17594DE9181849F3LL) = a2;
  }

  else
  {
    uint64_t result = (*(uint64_t (**)(void))(v8 + 8LL * (v9 ^ 0x419)))();
    int v14 = -1645193696;
  }

  *(_DWORD *)uint64_t v4 = v14;
  return result;
}

void sub_100055B00(uint64_t a1)
{
  int v2 = 1755732067 * ((2 * ((a1 ^ 0xFDCA5AD1) & 0x4699B354) - (a1 ^ 0xFDCA5AD1) - 1184478037) ^ 0x9A6AABA1);
  int v3 = *(_DWORD *)(a1 + 32) - v2;
  unsigned int v4 = v3
  nullsub_1(&v4);
  __asm { BR              X17 }

uint64_t sub_100055C98()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (v3 | (8 * (((v0 + 1) & 0x7FFFFFFC) != v1)))) - 4LL))();
}

void sub_100055CBC()
{
}

uint64_t sub_100055CC8@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((1176 * v5) ^ v4)) - 4LL))();
}

uint64_t sub_100055D14()
{
  int v3 = 13 * (v2 ^ 0x29F);
  unsigned int v4 = v0 - ((2 * v0 + 1881461130) & 0x918F5A50) + ((v3 + 1325647569) & 0xB0FC3DDF) - 2133192674;
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((1636
                                          * (((2 * v4) & 0xFFFEFB66 ^ 0x918E5A40) + (v4 ^ 0xB738D09B) - 1394876467 != 752573824)) ^ v3))
                            - 8LL))();
}

uint64_t sub_100055DCC()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
}

uint64_t sub_100055E30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v3
                              + 8LL
                              * (v2 ^ (((unint64_t)(v1 - a1) > 0x1F) | (2 * ((unint64_t)(v1 - a1) > 0x1F))))))();
}

uint64_t sub_100055E54()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (((((v0 < 0x20) ^ (((v1 + 42) | 0x11) + 112)) & 1)
                                          * (((((v1 - 1238) | 0x11) - 840300522) & 0x3215F7D7) - 580)) ^ ((v1 - 1238) | 0x11)))
                            - 4LL))();
}

uint64_t sub_100055EA8(uint64_t a1)
{
  unsigned int v8 = v4 + v3 + v5;
  uint64_t v9 = v1 + v8;
  __int128 v10 = *(_OWORD *)(v9 - 31);
  uint64_t v11 = a1 + v8;
  *(_OWORD *)(v11 - 15) = *(_OWORD *)(v9 - 15);
  *(_OWORD *)(v11 - 31) = v10;
}

void sub_100055F00()
{
}

uint64_t sub_100055F0C(uint64_t a1, int a2)
{
}

uint64_t sub_100055F4C(uint64_t a1, int a2)
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((a2 + 464) ^ (1777 * ((v2 & 0x18) == 0))))
                            - (a2 + 576)
}

uint64_t sub_100055F84(uint64_t a1)
{
  *(void *)(a1 - 7 + (v4 + v3 + v5 - v6)) = *(void *)(v1 - 7 + (v4 + v3 + v5 - v6));
  BOOL v9 = v7 - (v2 & 0xFFFFFFF8) - 763 == -v6;
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((8 * v9) | (16 * v9) | v7)) - 12LL))();
}

uint64_t sub_100055FE4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)(a3 + (v4 + a4)) = *(void *)(v5 + (v4 + a4));
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((8 * (v6 == a4)) | (16 * (v6 == a4)) | v7)) - 12LL))();
}

uint64_t sub_100056014(uint64_t a1, int a2)
{
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * (((((v3 + 102) | 0x107) ^ 0x5C8) * (v2 == a2)) ^ v3))
                            - (v3 ^ 0x55Eu)
                            + 312LL))();
}

uint64_t sub_100056050@<X0>(uint64_t a1@<X0>, int a2@<W2>, int a3@<W8>)
{
  int v6 = (a2 - 296) | 0x10A;
  *(_BYTE *)(a1 + (v4 - 752573825)) = *(_BYTE *)(v3 + (v4 - 752573825));
  BOOL v7 = v4 - 1 != (v6 ^ 0x4D1 ^ a3);
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * (((2 * v7) | (32 * v7)) ^ v6)) - 8LL))();
}

uint64_t sub_1000560A0@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  *(_BYTE *)(a1 + (v5 + v4)) = *(_BYTE *)(v2 + (v5 + v4));
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (((2 * (v5 - 1 != a2)) | (32 * (v5 - 1 != a2))) ^ v3)) - 8LL))();
}

uint64_t sub_1000560D0()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (((*(void *)(v1 + 24) != 0x4B30070DAA05F9DDLL) * ((v0 - 838) ^ 0x165)) ^ v0))
                            - 4LL))();
}

uint64_t sub_10005610C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)(a2 - 0x4B30070DAA05F9DDLL) = 1;
  uint64_t v4 = *v2;
  *(void *)(v2[5] - 0xF250A47131524EDLL) = result;
  *(_DWORD *)(v4 - 0x330904BA72E93EC0LL) = v3;
  *((_DWORD *)v2 + 13) = 1645153785;
  return result;
}

void sub_1000561A0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_100056204@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(*(void *)(a2 + 96) + 24LL) = v4;
  unsigned int v5 = *(_DWORD *)(a1 + 4) - ((2 * *(_DWORD *)(a1 + 4) + 1881461130) & 0xEDAA0BF4) + 786919103;
  return ((uint64_t (*)(void))(*(void *)(v2
                                                     + 8LL
                                                     * ((83
                                                       * (((2 * v5) & 0xDFDBFDDA ^ 0xCD8A09D0)
                                                        + (v5 ^ 0x1938FB17)
                                                        - 1610946564 != 266921705)) ^ v3))
                                         - 8LL))(0LL);
}

uint64_t sub_100056298()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
}

uint64_t sub_100056308(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v3
                              + 8LL
                              * ((84 * (v4 - a1 - (unint64_t)(a3 + 12) + 385 < 0x20)) | (a3 + 1191))))();
}

uint64_t sub_100056340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
}

uint64_t sub_100056398@<X0>(int a1@<W1>, int a2@<W3>, uint64_t a3@<X8>)
{
  unsigned int v9 = v7 + v6 + v8;
  uint64_t v10 = v4 + v9;
  __int128 v11 = *(_OWORD *)(v10 - 31);
  uint64_t v12 = a3 + v9;
  *(_OWORD *)(v12 - 15) = *(_OWORD *)(v10 - 15);
  *(_OWORD *)(v12 - 31) = v11;
  return (*(uint64_t (**)(void))(v3
                              + 8LL
                              * ((((v5 & 0xFFFFFFE0) == 32) * (((a2 + 1016589078) & 0x3CED7F3C) + 357)) ^ (a1 + a2 + 1066))))();
}

void sub_100056400()
{
}

uint64_t sub_10005640C(uint64_t a1, int a2, int a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                                     + 8LL
                                                     * (int)(((((13 * (a5 ^ 0x105)) ^ (a2 + 1842))
                                                             + ((a5 - 1082458691) & 0xC6FF97EF))
                                                            * (v6 != a3)) ^ a5))
                                         - 8LL))(0LL);
}

uint64_t sub_100056460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(void, uint64_t, uint64_t, void))(*(void *)(v6
                                                                               + 8LL
                                                                               * ((244
                                                                                 * (((a6 + 112) ^ ((((a6 + 935) ^ 0x538) & v7) == 0)) & 1)) ^ a6))
                                                                   - 8LL))( (a6 + 1646419312) & 0x9DDDA5FF,  a2,  a3,  (v8 - a3));
}

uint64_t sub_1000564B0@<X0>(int a1@<W0>, int a2@<W2>, uint64_t a3@<X8>)
{
  *(void *)(a3 - 7 + (v7 + v6 + v8 - a2)) = *(void *)(v4 - 7 + (v7 + v6 + v8 - a2));
}

void sub_100056510()
{
}

uint64_t sub_10005651C(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
}

uint64_t sub_10005654C@<X0>(int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  *(_BYTE *)(a3 + (a1 - 266921706)) = *(_BYTE *)(v5 + (a1 - 266921706));
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL
                                                          * ((450 * ((a2 ^ 0x1C2) + a1 - 1251 != v4)) ^ a2 ^ 0x1C2))
                                         - 4LL))(0LL);
}

uint64_t sub_100056590@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(a1 + (v7 + v3)) = *(_BYTE *)(v4 + (v7 + v3));
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (((v6 + v7 - 1251 != v2) * v5) ^ v6)) - 4LL))(0LL);
}

  ;
}

uint64_t sub_1000565D0(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (1755732067 * ((a1 & 0xECFD530 | ~(a1 | 0xECFD530)) ^ 0x2FF69714));
  return ((uint64_t (*)(void))(*((void *)*(&off_100079130 + v1 - 804)
                              + ((1547 * (*(void *)(a1 + 8) != 0x27681A84B35EB105LL)) ^ v1)
                              - 1)
                            - 8LL))();
}

uint64_t sub_100056660()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * ((1858
                                          * (*(_DWORD *)(v1 - 0x27681A84B35EB0EDLL) == ((v2 + 1851613323) & 0x91A29F6E ^ 0x620F0EB1))) ^ v2))
                            - 8LL))();
}

uint64_t sub_1000566C0()
{
  unsigned int v3 = *(_DWORD *)(v1 - 0x27681A84B35EB0F5LL) + 1273267861;
  unsigned int v4 = *(_DWORD *)(v1 - 0x27681A84B35EB0F9LL) + 980680899;
  BOOL v5 = v4 < (v2 ^ 6u) + 1583983809;
  BOOL v6 = v3 < v4;
  if (v3 < 0x5E69B00F != v5) {
    BOOL v6 = v5;
  }
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * (((2 * !v6) | (4 * !v6)) ^ v2)) - 8LL))();
}

uint64_t sub_10005675C@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  _DWORD *v2 = a2;
  *(_DWORD *)(result + memset((void *)(v1 - 204), 50, 16) = -1645193524;
  return result;
}

void sub_100056770(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16)
     - 460628867 * (((a1 ^ 0x68759CF4 | 0x87CE5E15) - ((a1 ^ 0x68759CF4) & 0x87CE5E15)) ^ 0xA32D409C);
  __asm { BR              X10 }

uint64_t sub_1000568B8()
{
  BOOL v5 = *(_DWORD *)(v2 + 48) - v0 != 870327928 && (*(void *)(v2 + 32) | *(void *)(v2 + 56)) != 0LL;
}

uint64_t sub_100056918()
{
  BOOL v4 = v1[5] == 0x164C0FDDF1987668LL || (*v1 | v1[3]) == 0LL;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((362 * (((v0 - 100) ^ v4) & 1)) ^ v0)) - 8LL))();
}

uint64_t sub_100056978@<X0>( uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return ((uint64_t (*)(uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 + 8LL * (int)(v20 & 0x8E18C33F ^ (124 * (v19 != 0)))) - ((502 * (v20 & 0x8E18C33F ^ 0x33F) - 1894953982) & 0x70F2B3FC) + 1000LL))( a1,  &STACK[0xC7F991DE6408EC5],  a2,  a3,  a4,  a5,  a6,  a7,  a1,  a10,  a11,  a12,  a13,  &STACK[0xC7F991DE6408EC5],  a15,  a8 - 0x3555E11E9398A6A2LL,  a17,  a8 - 0x3555E11E9398A7B2LL,  a19);
}

uint64_t sub_100056AB8@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v29 = v22 ^ 0x22F;
  int v30 = ((v28 - 1244544018 - 2 * ((v28 - 144) & 0xB5D1C47E)) ^ 0xF45BC1C) * v27;
  *(void *)(v28 - 12_Block_object_dispose(va, 8) = v20;
  *(void *)(v28 - 120) = a20;
  *(_DWORD *)(v28 - 140) = v22 - v30 - 751;
  *(_DWORD *)(v28 - 136) = v23 + v30 + (v22 ^ 0xD21E8525);
  uint64_t v46 = a1 + v21;
  ((void (*)(uint64_t))(*(void *)(v26 + 8LL * (v22 - 950)) - 8LL))(v28 - 144);
  HIDWORD(a10) = 203 * (v29 ^ 0x1C0);
  uint64_t v47 = v25;
  HIDWORD(v45) = v29 + 1083;
  *(_DWORD *)(v28 - 12_Block_object_dispose(va, 8) = (v29 + 1083) ^ (628203409
                                         * ((2 * ((v28 - 144) & 0x54E47578) - (v28 - 144) + 723225217) ^ 0xA99386B2));
  *(void *)(v28 - 144) = a17;
  *(void *)(v28 - 136) = a18;
  int v44 = (void (*)(uint64_t))(*(void *)(v26 + 8LL * (v29 ^ 0x147)) - 12LL);
  v44(v28 - 144);
  LODWORD(v45) = v29 + 1402;
  *(void *)(v28 - 120) = a17;
  *(void *)(v28 - 112) = a19;
  *(_DWORD *)(v28 - 12_Block_object_dispose(va, 8) = (v29 + 1402) ^ (((((v28 - 144) | 0x680F62BB) - ((v28 - 144) & 0x680F62BB)) ^ 0xD29B1AD9) * v27);
  *(void *)(v28 - 144) = a18;
  *(void *)(v28 - 136) = a20;
  int v43 = (void (*)(uint64_t))(*(void *)(v26 + 8LL * (v29 ^ 0x1C1)) - 4LL);
  v43(v28 - 144);
  HIDWORD(v42) = v29 + 1485;
  *(_DWORD *)(v28 - 112) = v29
                         + 1485
                         + 1224239923
                         * ((((v28 - 144) ^ 0xF9BB0CB1 | 0x15437DFD) - (((v28 - 144) ^ 0xF9BB0CB1) & 0x15437DFD)) ^ 0x1E4B8C9B);
  *(void *)(v28 - 104) = v25;
  *(void *)(v28 - 12_Block_object_dispose(va, 8) = a19;
  *(void *)(v28 - 120) = a17;
  *(void *)(v28 - 144) = a18;
  *(void *)(v28 - 136) = a19;
  uint64_t v31 = *(void (**)(uint64_t))(v26 + 8LL * (v29 ^ 0x171));
  v31(v28 - 144);
  LODWORD(v42) = v29 + 469;
  *(void *)(v28 - 136) = a19;
  *(void *)(v28 - 12_Block_object_dispose(va, 8) = a19;
  *(_DWORD *)(v28 - 120) = v29 + 469 + 1225351577 * ((v28 - 144) ^ 0x239AD816);
  *(void *)(v28 - 112) = a9;
  *(void *)(v28 - 104) = a17;
  *(void *)(v28 - 144) = a18;
  unint64_t v32 = (void (*)(uint64_t))(*(void *)(v26 + 8LL * (v29 - 279)) - 12LL);
  v32(v28 - 144);
  *(void *)(v28 - 144) = a13;
  *(void *)(v28 - 136) = a18;
  *(_DWORD *)(v28 - 12_Block_object_dispose(va, 8) = (v29 + 1083) ^ (628203409
                                         * ((((v28 - 144) | 0xDED8722D) - ((v28 - 144) & 0xDED8722D)) ^ 0x5C507E1E));
  v44(v28 - 144);
  *(void *)(v28 - 120) = a13;
  *(void *)(v28 - 112) = a7;
  *(_DWORD *)(v28 - 12_Block_object_dispose(va, 8) = (v29 + 1402) ^ (1178560073
                                         * ((989915423 - ((v28 - 144) | 0x3B00E91F) + ((v28 - 144) | 0xC4FF16E0)) ^ 0x7E6B6E82));
  *(void *)(v28 - 144) = a18;
  *(void *)(v28 - 136) = a20;
  v43(v28 - 144);
  *(_DWORD *)(v28 - 112) = v29
                         + 1485
                         + 1224239923 * ((((v28 - 144) | 0x639614A3) + (~(v28 - 144) | 0x9C69EB5C)) ^ 0x9125E975);
  *(void *)(v28 - 104) = v47;
  *(void *)(v28 - 144) = a18;
  *(void *)(v28 - 136) = a7;
  *(void *)(v28 - 12_Block_object_dispose(va, 8) = a7;
  *(void *)(v28 - 120) = a13;
  v31(v28 - 144);
  *(void *)(v28 - 136) = a7;
  *(void *)(v28 - 12_Block_object_dispose(va, 8) = a7;
  *(void *)(v28 - 112) = a11;
  *(void *)(v28 - 104) = a13;
  *(_DWORD *)(v28 - 120) = v29
                         + 469
                         + 1225351577 * ((((v28 - 144) | 0x59480BB8) - ((v28 - 144) & 0x59480BB8)) ^ 0x7AD2D3AE);
  *(void *)(v28 - 144) = a18;
  v32(v28 - 144);
  *(_DWORD *)(v28 - 144) = v29
                         - 108757529
                         * (((((v28 - 144) | 0xF475AFFA) ^ 0xFFFFFFFE) - (~(v28 - 144) | 0xB8A5005)) ^ 0xEB16322E)
                         - 81;
  *(void *)(v28 - 136) = a7;
  *(void *)(v28 - 12_Block_object_dispose(va, 8) = a19;
  ((void (*)(uint64_t))((char *)*(&off_100079130 + (v29 ^ 0x1AB)) - 12))(v28 - 144);
  *(_DWORD *)(v28 - 140) = (v29 + 383) ^ (460628867 * ((v28 - 144) ^ 0x4C96827D));
  *(void *)(v28 - 136) = a7;
  sub_100046940(v28 - 144);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), void (*)(uint64_t), uint64_t, uint64_t, void, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t)))(*(void *)(v24 + 8LL * (v29 | (32 * (*(_DWORD *)(v28 - 144) < (HIDWORD(a10) + 1901766070))))) - 7 * (v29 ^ 0x194u) + 597LL))( v33,  v34,  v35,  v36,  v37,  v38,  v39,  v40,  a2,  v42,  v43,  v44,  v45,  a7,  7 * (v29 ^ 0x194u),  a9,  a10,  (char *)*(&off_100079130 + (v29 ^ 0x15A)) - 8,  v46,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  v31);
}

uint64_t sub_100056FB8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void (*a18)(uint64_t), uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, void (*a27)(uint64_t), uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  *(_DWORD *)(v40 - 144) = (v37 - 204) ^ (235795823 * ((v40 - 101333398 - 2 * ((v40 - 144) & 0xF9F5C6FA)) ^ 0x6D588FA3));
  *(void *)(v40 - 136) = v39;
  *(void *)(v40 - 12_Block_object_dispose(va, 8) = v36;
  v35(v40 - 144);
  *(void *)(v40 - 144) = a25;
  *(void *)(v40 - 136) = v39;
  *(_DWORD *)(v40 - 112) = v37
                         + 1327
                         + 1224239923
                         * ((2 * (((v40 - 144) ^ 0xA8FDC33E) & 0x7EE300AA) - ((v40 - 144) ^ 0xA8FDC33E) + 18677589) ^ 0x5B52C1BC);
  *(void *)(v40 - 12_Block_object_dispose(va, 8) = v39;
  *(void *)(v40 - 120) = v36;
  *(void *)(v40 - 104) = a35;
  a27(v40 - 144);
  *(_DWORD *)(v40 - 112) = v37
                         + 1327
                         + 1224239923
                         * ((((v40 - 144) | 0x595B079F) - (v40 - 144) + ((v40 - 144) & 0xA6A4F860)) ^ 0xABE8FA48);
  *(void *)(v40 - 144) = a25;
  *(void *)(v40 - 136) = a19;
  *(void *)(v40 - 12_Block_object_dispose(va, 8) = v39;
  *(void *)(v40 - 120) = v36;
  *(void *)(v40 - 104) = v39;
  a27(v40 - 144);
  *(void *)(v40 - 136) = v39;
  *(void *)(v40 - 12_Block_object_dispose(va, 8) = a24;
  *(_DWORD *)(v40 - 144) = (v37 - 1882358073) ^ (235795823
                                               * ((((v40 - 144) | 0xEC38560C) - ((v40 - 144) & 0xEC38560C)) ^ 0x78951F55));
  sub_10005ABE0(v40 - 144);
  *(_DWORD *)(v40 - 144) = (v37 - 204) ^ (235795823
                                        * ((-2026376004 - ((v40 - 144) | 0x8737F4BC) + ((v40 - 144) | 0x78C80B43)) ^ 0xEC65421A));
  *(void *)(v40 - 136) = v39;
  *(void *)(v40 - 12_Block_object_dispose(va, 8) = a26;
  a18(v40 - 144);
  *(void *)(v40 - 144) = v39;
  *(void *)(v40 - 136) = a26;
  *(_DWORD *)(v40 - 12_Block_object_dispose(va, 8) = v37 + 1374699841 * ((v40 - 144) ^ 0x6DF41809) + 868;
  uint64_t v41 = sub_100016BB0(v40 - 144);
  return ((uint64_t (*)(uint64_t))(*(void *)(v38
                                                      + 8LL
                                                      * ((((((v37 - 577) ^ (a23 == 0)) & 1) == 0) * (v37 - 556)) ^ (v37 + 381)))
                                          - 12LL))(v41);
}

uint64_t sub_1000571F8()
{
  int v4 = 535753261 * ((((v3 - 144) ^ 0x80BC1318 | 0x67434C63) + ((v3 - 144) ^ 0x26000443 | 0x98BCB39C)) ^ 0xAC481975);
  *(_DWORD *)(v3 - 136) = ((v0 | 0x648) - 403) ^ v4;
  *(_DWORD *)(v3 - 120) = v4 + v7 + 1259132612 + (((v0 | 0x648) - 953243641) & 0x38D157BF);
  *(void *)(v3 - 144) = v8;
  *(void *)(v3 - 12_Block_object_dispose(va, 8) = v2;
  uint64_t result = ((uint64_t (*)(uint64_t))((char *)*(&off_100079130 + ((v0 | 0x648) ^ 0x6B6)) - 8))(v3 - 144);
  *(_DWORD *)(v6 - 0x164C0FDDF1987668LL) = v7;
  *(_DWORD *)(v1 + 64) = 1645153785;
  return result;
}

void sub_1000573A4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) + 1759421093 * ((a1 - 1364022623 - 2 * (a1 & 0xAEB2AAA1)) ^ 0x1DCF1AF5);
  __asm { BR              X9 }

uint64_t sub_100057454()
{
  BOOL v3 = (*(uint64_t (**)(uint64_t))(v0 + 8LL * (v1 - 613)))(200LL) == 0;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1636 * ((v3 ^ v1) & 1)) ^ v1)) - 8LL))();
}

uint64_t sub_100057494(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(v5 + 8LL * ((v7 ^ 0x4D8) - 1826)))(a1, 0LL);
  if ((_DWORD)result == 16)
  {
    v3 -= 7;
    goto LABEL_7;
  }

  if ((_DWORD)result == 12)
  {
LABEL_7:
    uint64_t result = (*(uint64_t (**)(uint64_t))(v5 + 8LL * (v4 & 0x75DAF05A)))(a1);
    int v10 = v3;
    goto LABEL_8;
  }

  if ((_DWORD)result)
  {
    v3 -= 6;
    goto LABEL_7;
  }

  *uint64_t v6 = a1;
  int v10 = 2107069443;
LABEL_8:
  *(_DWORD *)(v1 + 12) = v10 ^ v2;
  return result;
}

void sub_100057520(_DWORD *a1)
{
  unsigned int v1 = *a1 ^ (1374699841 * ((((2 * (_DWORD)a1) | 0x97E9331C) - (_DWORD)a1 + 873162354) ^ 0xA6008187));
  __asm { BR              X10 }

uint64_t sub_1000575EC@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  unsigned int v12 = 1755732067 * ((&a4 & 0xC1A12D46 | ~(&a4 | 0xC1A12D46)) ^ 0xE0986F62);
  a7 = &STACK[0x37021DA48139155A];
  a6 = (v10 - 127) ^ v12;
  a4 = &STACK[0x42E48BBDD224DE3D];
  a5 = v11;
  a8 = v12 ^ 0x6BDE6AF;
  uint64_t v13 = ((uint64_t (*)(unint64_t **))(*(void *)(a1 + 8LL * (v10 - 300)) - 8LL))(&a4);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8LL
                                            * ((866
                                              * (*(_DWORD *)(v11 - 0x27681A84B35EB0EDLL) == v8
                                                                                          + ((v10 + 682) | 0x24)
                                                                                          - 1063)) ^ v10)))(v13);
}

uint64_t sub_1000576D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  return ((uint64_t (*)(void))(*(void *)(v12 + 8LL * ((111 * (a11 != v11 + 4)) ^ v13))
                            - ((v13 - 509929160) & 0x1E64E3F9)
                            + 337LL))();
}

void sub_100057718(_DWORD *a1@<X8>)
{
  *a1 = v2;
  *(_DWORD *)(v1 + 4) = -1645193524;
}

void sub_1000577D0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) - 1755732067 * ((a1 & 0xB853BF30 | ~(a1 | 0xB853BF30)) ^ 0x996AFD14);
  uint64_t v2 = *(void *)a1;
  ((void (*)(char *, void (*)()))*(&off_100079130 + (v1 ^ 0x345)))( (char *)*(&off_100079130 + v1 - 872) - 4,  sub_10005A8B8);
  __asm { BR              X11 }

uint64_t sub_1000578A0@<X0>(int a1@<W8>)
{
  BOOL v3 = **(void **)(v2 + 8LL * (a1 - 698)) != 0LL;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((v3 | (32 * v3)) ^ a1)) - 4LL))();
}

uint64_t sub_1000578CC()
{
  return (*(uint64_t (**)(uint64_t))(v2 + 8LL * (v0 ^ 0x309)))(v1);
}

  ;
}

void sub_1000578FC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X8 }

uint64_t sub_100057984(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((918 * (**(_BYTE **)(a2 + 8) == 0)) ^ 0x94u)) - 12LL))();
}

uint64_t sub_1000579B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  *(void *)(*(void *)(a17 + 96) + 504LL) = v19 + 1;
  *(_DWORD *)(*(void *)(a17 + 96) + 496LL) = a19 - 1;
  int v22 = 1178560073 * ((((v21 - 152) | 0xA18E8F2E) - ((v21 - 152) & 0xA18E8F2E)) ^ 0x1B1AF74C);
  *(void *)(v21 - 144) = v21 + 0x5C6940C6B1BC6F3ELL;
  *(_DWORD *)(v21 - 136) = 1172345435 - v22;
  *(_DWORD *)(v21 - 152) = 1076023948 - v22;
  uint64_t v23 = sub_100023C94(v21 - 152);
  BOOL v24 = a19 - 1071279739 + ((2 * (*(_DWORD *)(v21 - 184) & 0x3F)) ^ 0x28) + (*(_DWORD *)(v21 - 184) & 0x3F ^ 0xF7ECD6EB) > 0xFFFFFFBF;
  return ((uint64_t (*)(uint64_t))(*(void *)(v20 + 8LL * (((4 * v24) | (8 * v24)) ^ 0x283u)) - 12LL))(v23);
}

uint64_t sub_100057BA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  BOOL v22 = v19 + 1552915351 < (a19 + 2020647308);
  return ((uint64_t (*)(void))(*(void *)(v21 + 8LL * ((v22 * (((v20 - 189) | 0x14) + 430)) ^ v20)) - 4LL))();
}

uint64_t sub_100057C10( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  unsigned int v21 = (a1 + 7106602) | 0xC1808080;
  int v22 = 628203409 * ((((v20 - 152) | 0xE8E27941) - (v20 - 152) + ((v20 - 152) & 0x171D86B8)) ^ 0x6A6A7572);
  *(void *)(v20 - 152) = a16;
  *(_DWORD *)(v20 - 144) = v22 + a1 + 992;
  *(_DWORD *)(v20 - 140) = a19 - v22 - 699382058;
  uint64_t v23 = sub_1000384D0(v20 - 152);
  uint64_t v24 = *(_DWORD *)(v20 - 184) & 0x3F;
  *(_BYTE *)(v20 - 252 + (v24 ^ 0x14)) = -78;
  return ((uint64_t (*)(uint64_t))(*(void *)(v19
                                                      + 8LL
}

uint64_t sub_100057D30(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(uint64_t))(v6
                                            + 8LL
                                            * (((v4 == a4 + ((v5 - 202575953) & 0xCDFFFFF7) + 63)
                                              * (((v5 + 225) | 0x400) - 1545)) | v5)))(-1615192458LL);
}

uint64_t sub_100057D7C(uint64_t a1, uint64_t a2, int a3)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
}

uint64_t sub_100057DB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v5 - 252 + a2 + a1) = 0x3232323232323232LL;
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL * ((51 * (((v3 + 704899974) & 0xD5FC0F78) - 336LL == (v2 & 0x38))) ^ v3))
                            - 8LL))();
}

uint64_t sub_100057E1C@<X0>(int a1@<W4>, int a2@<W8>)
{
  BOOL v10 = v3 < v4;
  *(_BYTE *)(v9 - 252 + (a2 - 1737234171)) = *(_BYTE *)(v6 + (v2 + a1))
                                                         + (~(*(unsigned __int8 *)(v6
  unsigned int v11 = v2 + 1 + v5;
  int v12 = v10 ^ (v11 < v4);
  BOOL v13 = v11 < v3;
  if (!v12) {
    BOOL v10 = v13;
  }
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((491 * v10) ^ v7)) - 4LL))((v7 - 169));
}

uint64_t sub_100057E9C(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(void))(v6 + 8LL * ((622 * (((v4 == v3) ^ (a3 + v5 - 92)) & 1)) ^ v5)))();
}

uint64_t sub_100057EEC( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t (*a25)(void, __n128, __n128, __n128, __n128, __n128), int a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, int32x4_t a33, int32x4_t a34, int32x4_t a35, int32x4_t a36)
{
  __n128 v45 = (__n128)vdupq_n_s32(0x620F0DFFu);
  uint64_t v46 = (const char *)(v43 - 252);
  __n128 v47 = (__n128)vdupq_n_s32(0x620F0DF9u);
  v48.n128_u64[0] = 0x3232323232323232LL;
  v48.n128_u64[1] = 0x3232323232323232LL;
  a27 = v41 - 16;
  uint64_t v49 = (v42 - 1);
  v50.n128_u64[0] = 0x6464646464646464LL;
  v50.n128_u64[1] = 0x6464646464646464LL;
  __n128 v51 = (__n128)vdupq_n_s32(0xC41E1BF2);
  int v53 = *(_DWORD *)(v43 - 180);
  int v52 = *(_DWORD *)(v43 - 176);
  a26 = v53;
  int v54 = *(_DWORD *)(v43 - 172);
  int v55 = *(_DWORD *)(v43 - 168);
  int v56 = *(_BYTE *)(v43 - 156) ^ 0x5F;
  if (v56 == 2)
  {
    a25 = v44;
    int8x16x4_t v103 = vld4q_s8(v46);
    int v82 = a3 + a4 + 361;
    uint8x16_t v83 = (uint8x16_t)veorq_s8(v103.val[0], (int8x16_t)v48);
    uint16x8_t v84 = vmovl_u8(*(uint8x8_t *)v83.i8);
    uint16x8_t v85 = vmovl_high_u8(v83);
    uint8x16_t v86 = (uint8x16_t)veorq_s8(v103.val[1], (int8x16_t)v48);
    _Q22 = vmovl_u8(*(uint8x8_t *)v86.i8);
    _Q21 = vmovl_high_u8(v86);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }

    uint8x16_t v91 = (uint8x16_t)veorq_s8(v103.val[2], (int8x16_t)v48);
    uint16x8_t v92 = vmovl_high_u8(v91);
    uint16x8_t v93 = vmovl_u8(*(uint8x8_t *)v91.i8);
    v103.val[0] = veorq_s8(v103.val[3], (int8x16_t)v48);
    v103.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v103.val[0]);
    v103.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v103.val[1]);
    v103.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v103.val[1].i8);
    v103.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v103.val[0].i8);
    v103.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v103.val[0]);
    v103.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v103.val[0].i8);
    int32x4_t v94 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v93.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v84.i8), 0x18uLL)),  v103.val[0]);
    int32x4_t v95 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v93, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v84), 0x18uLL)),  v103.val[3]);
    int32x4_t v96 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v92.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v85.i8), 0x18uLL)),  v103.val[1]);
    int32x4_t v97 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v92, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v85), 0x18uLL)),  v103.val[2]);
    v103.val[0] = veorq_s8( vandq_s8((int8x16_t)v94, (int8x16_t)v45),  (int8x16_t)(*(_OWORD *)v103.val & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    v103.val[3] = veorq_s8( vandq_s8((int8x16_t)v95, (int8x16_t)v45),  (int8x16_t)(*(_OWORD *)&v103.val[3] & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    v103.val[1] = veorq_s8( vandq_s8((int8x16_t)v96, (int8x16_t)v45),  (int8x16_t)(*(_OWORD *)&v103.val[1] & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    v103.val[2] = veorq_s8( vandq_s8((int8x16_t)v97, (int8x16_t)v45),  (int8x16_t)(*(_OWORD *)&v103.val[2] & __PAIR128__(0xFFFFFF06FFFFFF06LL, 0xFFFFFF06FFFFFF06LL)));
    a35 = vaddq_s32(vsubq_s32(v96, vaddq_s32((int32x4_t)v103.val[1], (int32x4_t)v103.val[1])), (int32x4_t)v47);
    a36 = vaddq_s32(vsubq_s32(v97, vaddq_s32((int32x4_t)v103.val[2], (int32x4_t)v103.val[2])), (int32x4_t)v47);
    a33 = vaddq_s32(vsubq_s32(v94, vaddq_s32((int32x4_t)v103.val[0], (int32x4_t)v103.val[0])), (int32x4_t)v47);
    a34 = vaddq_s32(vsubq_s32(v95, vaddq_s32((int32x4_t)v103.val[3], (int32x4_t)v103.val[3])), (int32x4_t)v47);
    uint64_t v98 = (_DWORD *)&a33 + v39 + 1438604517;
    int v99 = *((_DWORD *)&a33 + (v82 ^ 0x475u ^ (unint64_t)(v39 + 788)) + 1438604517) ^ *(v98 - 3);
    unsigned int v100 = *(v98 - 16) ^ *(v98 - 14) ^ (v99 + v37 - ((2 * v99) & 0xC41E1BF2));
    HIDWORD(v101) = v100 ^ v37;
    LODWORD(v101) = v100;
    *uint64_t v98 = (v101 >> 31) + v37 - ((2 * (v101 >> 31)) & 0xC41E1BF2);
    return ((uint64_t (*)(uint64_t))(*(void *)(v40 + 8LL * ((1178 * (v41 == 1438604454)) ^ v82)) - 12LL))(v49);
  }

  else if (v56 == 1)
  {
    a25 = v44;
    int8x16x4_t v102 = vld4q_s8(v46);
    uint8x16_t v57 = (uint8x16_t)veorq_s8(v102.val[0], (int8x16_t)v48);
    uint16x8_t v58 = vmovl_high_u8(v57);
    int8x16_t v59 = (int8x16_t)vmovl_high_u16(v58);
    uint16x8_t v60 = vmovl_u8(*(uint8x8_t *)v57.i8);
    int8x16_t v61 = (int8x16_t)vmovl_high_u16(v60);
    uint8x16_t v62 = (uint8x16_t)veorq_s8(v102.val[1], (int8x16_t)v48);
    uint16x8_t v63 = vmovl_u8(*(uint8x8_t *)v62.i8);
    uint16x8_t v64 = vmovl_high_u8(v62);
    int8x16_t v65 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v63.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v60.i8));
    int8x16_t v66 = vorrq_s8((int8x16_t)vshll_high_n_u16(v63, 8uLL), v61);
    int8x16_t v67 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v64.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v58.i8));
    int8x16_t v68 = vorrq_s8((int8x16_t)vshll_high_n_u16(v64, 8uLL), v59);
    uint8x16_t v69 = (uint8x16_t)veorq_s8(v102.val[2], (int8x16_t)v48);
    _Q22 = (int8x16_t)vmovl_high_u8(v69);
    _Q21 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v69.i8);
    int8x16_t v72 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL);
    __asm { SHLL2           V21.4S, V21.8H, #0x10 }

    int8x16_t v77 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL);
    __asm { SHLL2           V22.4S, V22.8H, #0x10 }

    v102.val[0] = veorq_s8(v102.val[3], (int8x16_t)v48);
    v102.val[1] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v102.val[0].i8);
    v102.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v102.val[0]);
    int32x4_t v78 = (int32x4_t)vorrq_s8( vorrq_s8(v65, v72),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v102.val[1].i8), 0x18uLL));
    v102.val[1] = vorrq_s8( vorrq_s8(v66, _Q21),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v102.val[1]), 0x18uLL));
    int32x4_t v79 = (int32x4_t)vorrq_s8( vorrq_s8(v67, v77),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v102.val[0].i8), 0x18uLL));
    int32x4_t v80 = (int32x4_t)vorrq_s8( vorrq_s8(v68, _Q22),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v102.val[0]), 0x18uLL));
    a35 = vaddq_s32(vsubq_s32(v79, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v79, v79), (int8x16_t)v51)), (int32x4_t)v47);
    a36 = vaddq_s32(vsubq_s32(v80, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v80, v80), (int8x16_t)v51)), (int32x4_t)v47);
    a33 = vaddq_s32(vsubq_s32(v78, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v78, v78), (int8x16_t)v51)), (int32x4_t)v47);
    a34 = vaddq_s32( vsubq_s32( (int32x4_t)v102.val[1],  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v102.val[1], (int32x4_t)v102.val[1]), (int8x16_t)v51)),  (int32x4_t)v47);
    return ((uint64_t (*)(uint64_t, __n128))(*(void *)(v40 + 8LL
                                                                      * ((62 * (a27 + 1 != v41)) | (a3 + a4 + 129)))
                                                    - 12LL))( v49,  v45);
  }

  else
  {
    *(_DWORD *)(v43 - 180) = (v53 ^ v42) + (a26 ^ v42) + v42 - (v38 & (2 * ((v53 ^ v42) + (a26 ^ v42))));
    *(_DWORD *)(v43 - 176) = 2 * (v52 ^ v42) + v42 - (v38 & (4 * (v52 ^ v42)));
    *(_DWORD *)(v43 - 172) = 2 * (v54 ^ v42) + v42 - (v38 & (4 * (v54 ^ v42)));
    *(_DWORD *)(v43 - 16_Block_object_dispose(va, 8) = 2 * (v55 ^ v42) + v42 - (v38 & (4 * (v55 ^ v42)));
    a31 = 0LL;
    return v44(v49, v45, v47, v48, v50, v51);
  }

uint64_t sub_100058D4C( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, int a21, int a22, int a23, unsigned int a24)
{
  else {
    BOOL v25 = a21 + 1538029256 > a24;
  }
}

uint64_t sub_100058DDC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v7
                                                               + 8LL
                                                               * ((1709
                                                                 * (((v6 + 1) ^ (a5 + v5 + 63 < (v5 - 633048600 + a3 + v6 - 352))) & 1)) ^ v6))
                                                   - 12LL))( a1,  1456643678LL);
}

uint64_t sub_100058E40( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return ((uint64_t (*)(void))(*(void *)(v22
                                        + 8LL
                                        * (((~a19
                                           + v19
                                           - (unint64_t)(v21 + (v20 ^ 0x3A ^ (a3 + 214))) < 0x10)
                                          * ((v20 ^ 0x3A) - 288)) ^ v20 ^ 0x3A))
                            - 12LL))();
}

uint64_t sub_100058E88@<X0>(char a1@<W1>, int a2@<W3>, int a3@<W4>, char a4@<W6>, uint64_t a5@<X8>)
{
  *(_BYTE *)(v7 + a5) = *(_BYTE *)(v10 + (v5 + a3))
  return ((uint64_t (*)(void))(*(void *)(v11 + 8LL * (((a5 == 63) * v9) | (a2 + v6 + 276))) - 8LL))();
}

uint64_t sub_100058EE0( double a1, double a2, int8x16_t a3, int8x16_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  *uint64_t v10 = vaddq_s8( vsubq_s8( *(int8x16_t *)(v12 + (v9 + a9)),  vandq_s8( vaddq_s8(*(int8x16_t *)(v12 + (v9 + a9)), *(int8x16_t *)(v12 + (v9 + a9))),  a4)),  a3);
  return ((uint64_t (*)(void))(*(void *)(v13 + 8LL * (v11 + 25)) - 8LL))();
}

uint64_t sub_100058F48@<X0>(int a1@<W2>, int a2@<W3>, int a3@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v4
                                            + 8LL
                                            * ((1030 * ((v3 - a1 + 443 + a3 - 1615192901) < 0x38)) ^ (a2 + v3 + 455))))(-1615192458LL);
}

uint64_t sub_100058F8C@<X0>(uint64_t a1@<X0>, unsigned int a2@<W8>)
{
  uint64_t v4 = a2;
  uint64_t v5 = a1 + a2;
  else {
    uint64_t v6 = 56LL;
  }
  return (*(uint64_t (**)(void))(v3
                              + 8LL
                              * ((1858
                                * (((v2 + 44) ^ (v6 - v4 + 1615192458 < (((v2 + 99) | 0x61u) ^ 0x277uLL))) & 1)) ^ v2)))();
}

uint64_t sub_100059008@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v5 - 252 + v3 + a1) = 0x3232323232323232LL;
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL * ((58 * (((7 * (v2 ^ 0x22Cu) - 589LL) & a2) != 8)) ^ (7 * (v2 ^ 0x22C))))
                            - ((7 * (v2 ^ 0x22C) - 147) | 9u)
                            + 439LL))();
}

uint64_t sub_100059074(double a1)
{
  *(double *)(v3 + v6) = a1;
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * (((v4 != v6) * v5) ^ v1)) - v2 + 439))();
}

uint64_t sub_10005909C@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(v4
                              + 8LL
                              * (int)(((((v3 - 805309644) & 0xF1ECFBF7 ^ 0xFFFFFF72) + (v3 ^ (a1 + 117))) * (a2 == v2)) ^ v3)))();
}

void sub_1000590E8(uint64_t a1, uint64_t a2, char a3, char a4)
{
  int v5 = *(unsigned __int8 *)(v4 - 156) ^ 0x5F;
  if (v5 == 1)
  {
    unsigned int v10 = *(_DWORD *)(v4 - 188);
    unsigned int v9 = *(_DWORD *)(v4 - 184);
    *(_BYTE *)(v4 - 196) = ((8 * v9) ^ 0xA0) + ((a3 + 22) & 0xB7 ^ 0x87) - ((2 * ((8 * v9) ^ 0xA0)) & 0x60);
    *(_BYTE *)(v4 - 195) = ((v9 >> 5) ^ 0xF2) - 2 * (((v9 >> 5) ^ 0xF2) & 0x36 ^ (v9 >> 5) & 4) + 50;
    *(_BYTE *)(v4 - 194) = ((v9 >> 13) ^ 0x8F) - ((2 * ((v9 >> 13) ^ 0x8F)) & 0x64) + 50;
    *(_BYTE *)(v4 - 193) = ((v9 >> 21) ^ 0x39) - ((2 * ((v9 >> 21) ^ 0x39)) & 0x64) + 50;
    HIDWORD(v11) = v10 ^ 0xA;
    LODWORD(v11) = v9 ^ 0x60000000;
    *(_BYTE *)(v4 - 192) = (v11 >> 29) - ((2 * (v11 >> 29)) & 0x64) + 50;
    *(_BYTE *)(v4 - 191) = ((v10 >> 5) ^ 0xA) - 2 * (((v10 >> 5) ^ 0xA) & 0x37 ^ (v10 >> 5) & 5) + 50;
    *(_BYTE *)(v4 - 190) = ((v10 >> 13) ^ 0xA4) - ((2 * ((v10 >> 13) ^ 0xA4)) & 0x64) + 50;
    unsigned int v8 = ((v10 >> 21) ^ 0xFFFFFFBE) - ((2 * ((v10 >> 21) ^ 0xFFFFFFBE)) & 0x64) + 50;
  }

  else
  {
    if (v5 != 2) {
      goto LABEL_6;
    }
    unsigned int v8 = *(_DWORD *)(v4 - 188);
    unsigned int v6 = *(_DWORD *)(v4 - 184);
    *(_BYTE *)(v4 - 196) = ((v8 >> 21) ^ 0xBE)
                         + ~(2 * (((v8 >> 21) ^ 0xBE) & (a4 + a3 + 51) ^ ((v8 & 0x200000) != 0)))
                         + 51;
    *(_BYTE *)(v4 - 195) = ((v8 >> 13) ^ 0xA4) + (~(2 * ((v8 >> 13) ^ 0xA4)) | 0x9B) + 51;
    HIDWORD(v7) = v8 ^ 0xA;
    LODWORD(v7) = v6 ^ 0x60000000;
    *(_BYTE *)(v4 - 194) = ((v8 >> 5) ^ 0xA) - 2 * (((v8 >> 5) ^ 0xA) & 0x36 ^ (v8 >> 5) & 4) + 50;
    *(_BYTE *)(v4 - 193) = (v7 >> 29) - ((2 * (v7 >> 29)) & 0x64) + 50;
    *(_BYTE *)(v4 - 192) = ((v6 >> 21) ^ 0x39) - ((2 * ((v6 >> 21) ^ 0x39)) & 0x64) + 50;
    *(_BYTE *)(v4 - 191) = ((v6 >> 13) ^ 0x8F) - ((2 * ((v6 >> 13) ^ 0x8F)) & 0x64) + 50;
    *(_BYTE *)(v4 - 190) = ((v6 >> 5) ^ 0xF2) - ((2 * ((v6 >> 5) ^ 0xF2)) & 0x64) + 50;
    LOBYTE(v_Block_object_dispose(va, 8) = ((8 * v6) ^ 0xA0) + (~(2 * ((8 * v6) ^ 0xA0)) | 0x9F) + 51;
  }

  *(_BYTE *)(v4 - 189) = v8;
LABEL_6:
  JUMPOUT(0x1000581B4LL);
}

uint64_t sub_100059554@<X0>(char a1@<W3>, uint64_t a2@<X5>, int a3@<W8>)
{
  unsigned int v8 = v5 + a3;
  unsigned int v9 = *(_DWORD *)(v7 - 252 + ((v5 + a3) & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a2 + v8 + 1) = (BYTE2(v9) ^ 0x3B) - ((2 * (BYTE2(v9) ^ 0x3B)) & 0x64) + 50;
  *(_BYTE *)(a2 + v_Block_object_dispose(va, 8) = (HIBYTE(v9) ^ 0x51) - (((HIBYTE(v9) ^ 0x51) << ((v4 - a1 + 1) ^ 0xE6)) & 0x64) + 50;
  *(_BYTE *)(a2 + v8 + 3) = v9 ^ 0x47;
  *(_BYTE *)(a2 + v8 + 2) = (BYTE1(v9) ^ 0xA7) - ((2 * (BYTE1(v9) ^ 0xA7)) & 0x64) + 50;
  unsigned int v10 = *(_DWORD *)(v7 - 160) - 2026446123;
  if (v5 - 1725448501 < v3 != v10 < v3) {
    BOOL v11 = v10 < v3;
  }
  else {
    BOOL v11 = v5 - 1725448501 < v10;
  }
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * ((510 * !v11) ^ v4)) - 12LL))();
}

void sub_1000596EC()
{
}

uint64_t sub_1000596F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
  *(_DWORD *)(&a33 + a31) = 1037212390;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *))(*(void *)(v34 + 8LL * ((22 * (v33 ^ 0x350)) ^ 0x6BD)) - 8LL))( 1398064151LL,  1037212390LL,  a3,  a4,  a5,  &a33 + a31,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  &a33 + a31 + 392);
}

uint64_t sub_1000597A8(int a1)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((51 * (((v3 == a1) ^ (v1 + 33)) & 1)) ^ v1)) - 4LL))();
}

uint64_t sub_1000597F0( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, int a30)
{
  unsigned int v33 = v30 & 0xDDFDFEFF;
  unsigned __int8 v34 = v33 + 12;
  int v35 = v33 - a3 + 242;
  int v36 = a4 + v33 + 67;
  BOOL v37 = a30 - 176914108 < (v32 - 1020078970);
  return (*(uint64_t (**)(void))(v31 + 8LL * ((((v34 ^ v37) & 1) * (v35 ^ 0x29)) ^ v36)))();
}

uint64_t sub_100059A50()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * (((((*(_DWORD *)(v1 + 48LL * (v4 + v2) + 36) == v4) ^ ((v0 & 0xBF) - 30)) & 1)
                                          * (((v0 & 0x6937FBBF) + 63) ^ 0x80)) ^ v0 & 0x6937FBBF))
                            - 12LL))();
}

uint64_t sub_100059AA8( uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25)
{
  int v31 = v27 - a4 - 242;
  int v32 = 628203409 * ((((v30 - 152) | 0x36F0807) - ((v30 - 152) & 0x36F0807)) ^ 0x81E70434);
  *(_DWORD *)(v30 - 136) = v27 - v32 + 1552;
  *(_DWORD *)(v30 - 132) = v29 - v32 + 77623025;
  *(void *)(v30 - 12_Block_object_dispose(va, 8) = a14;
  *(void *)(v30 - 112) = v26;
  *(void *)(v30 - 104) = a12;
  *(void *)(v30 - 152) = a13;
  *(void *)(v30 - 144) = a11;
  uint64_t v34 = v25;
  ((void (*)(uint64_t))*(&off_100079130 + v27 - 85))(v30 - 152);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 + 8LL * ((356 * (*(_DWORD *)(v30 - 120) == (v31 ^ 0xA3E3FA51) + (v27 ^ 0x3B1))) ^ v27))
                                                                                       - 8LL))( 1398064151LL,  1037212390LL,  3253530855LL,  1041436441LL,  v34,  a25);
}

uint64_t sub_100059BA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(v7
                              + 8LL
                              * (((*(_DWORD *)(a5 + 48LL * (v8 + v5)) != 617625952)
                                * (((a3 + v6 - 835) ^ (a3 - 51)) - 51)) | v6)))();
}

uint64_t sub_100059BF0@<X0>(int a1@<W3>, int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((199
                                          * (((((v2 - 1058217968) | 0x1001084) - 2098010104) ^ a2) != v3 - 634403168)) ^ v2))
                            + 3253530843LL
                            - (v2 - a1 - 83)))();
}

uint64_t sub_100059C60(uint64_t a1, uint64_t a2, int a3, int a4)
{
  return ((uint64_t (*)(void))(*(void *)(v6
                                        + 8LL
                                        * ((39
}

uint64_t sub_100059CE8@<X0>( uint64_t a1@<X4>, uint64_t a2@<X5>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, int a25, uint64_t a26, int a27, int a28)
{
  *(_DWORD *)(a2 + 392) = a3;
  *(_DWORD *)(a2 + 396) = a28;
  *(void *)(a2 + 400) = a23;
  *(_DWORD *)(a2 + 40_Block_object_dispose(va, 8) = a25 - v32 + 1642836220;
  *(void *)(a2 + 4memset((void *)(v1 - 204), 50, 16) = v29 + (v32 - 363588221);
  int v35 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 48LL * v28 + 8))(a12, a19);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33
                                                                       + 8LL
                                                                       * ((270
                                                                         * (v35
                                                                          + v30
                                                                          - (((v31 + 510469503) & 0xE192D4B6 ^ (v34 - 140)) & (2 * v35)) == v30)) ^ v31)))( 1398064151LL,  1037212390LL,  3253530855LL,  1041436441LL);
}

uint64_t sub_100059DB4()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((39
}

uint64_t sub_100059E28(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, _DWORD *a6)
{
  return ((uint64_t (*)(void))(*(void *)(v7
                                        + 8LL
}

uint64_t sub_100059E80@<X0>( int a1@<W2>, uint64_t a2@<X4>, _DWORD *a3@<X5>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, int a26)
{
  uint64_t v33 = &a3[6 * v27];
  v33[2] = v32;
  v33[3] = v28;
  *((void *)v33 + 2) = v30;
  v33[6] = a26;
  *a3 = v26 + 1;
  return ((uint64_t (*)(void))(*(void *)(v31
                                        + 8LL
                                        * (((*(_DWORD *)(a2 + 48LL * v29 + 32) + 749419496 < ((a4 + 1033) ^ 0x800004F8))
                                          * ((a1 + a4 - 242) ^ (a1 + 719))) ^ a4))
                            - 8LL))();
}

uint64_t sub_100059EFC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 + 8LL * (((v22 + 74 * (v21 ^ 0x4F9) == 1645153933) * (((74 * (v21 ^ 0x4F9)) ^ 0x66) + 1545)) ^ (74 * (v21 ^ 0x4F9)))) - 12LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21);
}

uint64_t sub_100059F5C( int a1, int a2, int a3, uint64_t a4, uint64_t a5, _DWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, int a27)
{
  BOOL v31 = v29 != a1 || *a6 != a2 + (v27 ^ a27) - a3;
  return ((uint64_t (*)(void))(*(void *)(v28 + 8LL * ((1725 * v31) ^ v27)) - 8LL))();
}

void sub_100059FA4()
{
}

uint64_t sub_100059FE4()
{
  return v0 ^ v1;
}

uint64_t sub_10005A028(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 8_Block_object_dispose(va, 8) = 47;
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 80) = *(void *)(a2 + 8);
  return 0LL;
}

uint64_t sub_10005A048(uint64_t a1)
{
  unsigned int v3 = 1951 - 1759421093 * ((&v2 + 137599165 - 2 * (&v2 & 0x83398BD)) ^ 0xBB4E28E9);
  uint64_t v2 = a1;
  sub_1000573A4((uint64_t)&v2);
  return v4;
}

uint64_t sub_10005A0DC(uint64_t result)
{
  unint64_t v1 = 1374699841 * ((result - 2 * (result & 0xA8F7ECC532399345LL) - 0x5708133ACDC66CBBLL) ^ 0xA6FB72C95FCD8B4CLL);
  unint64_t v2 = *(void *)(result + 16) ^ v1;
  unint64_t v3 = *(void *)(result + 8) - v1;
  BOOL v4 = v2 >= v3;
  BOOL v5 = (uint64_t)v2 < (uint64_t)v3;
  int v6 = !v4;
  if (((*(_DWORD *)(result + 24) + 1374699841 * (((_DWORD)result - 2 * (result & 0x32399345) + 842634053) ^ 0x5FCD8B4C)) & 1) == 0) {
    BOOL v5 = v6;
  }
  BOOL v7 = !v5;
  uint64_t v8 = 32LL;
  if (!v7) {
    uint64_t v8 = 28LL;
  }
  *(_DWORD *)(result + 36) = *(_DWORD *)(result + 40) ^ (1374699841
                                                       * ((result - 2 * (result & 0x32399345) + 842634053) ^ 0x5FCD8B4C)) ^ *(_DWORD *)(result + v8) ^ (1374699841 * ((result - 2 * (result & 0x32399345) + 842634053) ^ 0x5FCD8B4C));
  return result;
}

uint64_t sub_10005A16C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + _Block_object_dispose(va, 8) = *(void *)(a2 + 24);
  return 0LL;
}

void sub_10005A184(uint64_t a1)
{
  uint64_t v1 = a1;
  unsigned int v2 = (3804331 * ((&v1 & 0xB40B85C6 | ~(&v1 | 0xB40B85C6)) ^ 0x35215FCF)) ^ 0x122;
  sub_100036834((uint64_t)&v1);
}

void sub_10005A218(uint64_t a1)
{
  uint64_t v1 = a1;
  unsigned int v2 = 1755732067 * (((&v1 | 0xF9EE60DF) + (~&v1 | 0x6119F20)) ^ 0x2728DD05) + 933;
  sub_1000577D0((uint64_t)&v1);
}

uint64_t sub_10005A2A8(uint64_t result)
{
  uint64_t v1 = 1178560073 * ((2 * (result & 0x64AC438940A5398ALL) - result + 0x1B53BC76BF5AC675LL) ^ 0xAFEC9E05CEBE17LL);
  unint64_t v2 = *(void *)(result + 16) - v1;
  unint64_t v3 = *(void *)(result + 40) + v1;
  BOOL v4 = v3 >= v2;
  BOOL v5 = v3 != v2;
  int v6 = v4;
  if (((*(_DWORD *)(result + 28) ^ (1178560073 * ((2 * (result & 0x40A5398A) - (_DWORD)result - 1084569995) ^ 0x5CEBE17))) & 1) != 0) {
    int v7 = v6;
  }
  else {
    int v7 = v5;
  }
  BOOL v8 = v7 == 0;
  uint64_t v9 = 4LL;
  if (!v8) {
    uint64_t v9 = 24LL;
  }
  *(_DWORD *)uint64_t result = (*(_DWORD *)(result + v9)
                     - 1178560073 * ((2 * (result & 0x40A5398A) - result - 1084569995) ^ 0x5CEBE17)) ^ (*(_DWORD *)(result + 8) - 1178560073 * ((2 * (result & 0x40A5398A) - result - 1084569995) ^ 0x5CEBE17));
  return result;
}

uint64_t sub_10005A350(int *a1)
{
  unsigned int v2 = a1[1] - 108757529 * (a1 ^ 0xE09C622B);
  uint64_t result = ((uint64_t (*)(char *, void))*(&off_100079130 + (int)(v2 - 1695027228)))( (char *)*(&off_100079130 + (int)(v2 - 1695027372)) - 12,  *(&off_100079130 + (int)(v2 ^ 0x6508107F)));
  int v4 = *(_DWORD *)*(&off_100079130 + (int)(v2 ^ 0x650810DA));
  if ((_DWORD)result) {
    int v4 = -1645193401;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_10005A3EC(uint64_t result)
{
  unint64_t v1 = 235795823 * ((~result & 0x2A1D36B9A93A3D3LL | result & 0xFD5E2C94656C5C2CLL) ^ 0xA1169950E3EEA8ALL);
  uint64_t v2 = *(void *)(result + 16);
  unint64_t v3 = v2 ^ v1;
  BOOL v4 = *(void *)result == v2;
  BOOL v5 = (*(void *)result ^ v1) > v3;
  if (((*(_DWORD *)(result + 8) + (_DWORD)v1) & 1) != 0) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = v4;
  }
  BOOL v7 = !v6;
  uint64_t v8 = 28LL;
  if (!v7) {
    uint64_t v8 = 32LL;
  }
  *(_DWORD *)(result + 36) = *(_DWORD *)(result + 12) ^ v1 ^ (*(_DWORD *)(result + v8) - v1);
  return result;
}

_BYTE *sub_10005A484(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3 = -(int)result & 7;
  if (v3 > a3) {
    LODWORD(v3) = a3;
  }
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }

  unint64_t v4 = a3 - v3;
  unint64_t v6 = v4;
  unint64_t v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      char *result = a2;
      break;
    default:
      uint64_t result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_10005A514 + 4 * byte_100064D67[(v5 >> 3) & 7]))();
      break;
  }

  return result;
}

uint64_t sub_10005A578(uint64_t a1)
{
  int v2 = 628203409 * (((a1 | 0xBB8CAEEC) - (a1 & 0xBB8CAEEC)) ^ 0x3904A2DF);
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 20) + v2;
  int v7 = *(_DWORD *)a1 + 2024873124 + v2;
  unsigned int v8 = 235795823
     * (((&v10 | 0xDE5284D5) - &v10 + (&v10 & 0x21AD7B28)) ^ 0x4AFFCD8C);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = v4;
  uint64_t v16 = v3;
  unsigned int v11 = v8 + (v6 ^ 0x1C576372) + 2142240416 + ((2 * v6) & 0xBEFD8FFE ^ 0x8651091A);
  uint64_t v10 = v5;
  int v15 = v8 ^ (v7 + 1820);
  uint64_t result = ((uint64_t (*)(uint64_t *))((char *)*(&off_100079130 + v7) - 4))(&v10);
  *(_DWORD *)(a1 + 40) = v14;
  return result;
}

uint64_t sub_10005A6D4(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 64) = *(void *)(a2 + 8);
  return 0LL;
}

uint64_t sub_10005A6F0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 32) = *(void *)(a2 + 8);
  return 0LL;
}

uint64_t sub_10005A708(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = *(void *)(a2 + 8);
  return 0LL;
}

uint64_t sub_10005A720(uint64_t a1)
{
  int v2 = 460628867 * (((a1 | 0x167EA26) - a1 + (a1 & 0xFE9815D9)) ^ 0x4DF1685B);
  int v3 = *(_DWORD *)(a1 + 20) - v2;
  uint64_t v5 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  int v6 = *(_DWORD *)(a1 + 16) - v2 - ((2 * (*(_DWORD *)(a1 + 16) - v2) + 50606586) & 0x52C224C2) - 1427952802;
  int v7 = -400126375 * (*(_DWORD *)(a1 + 24) + v2) - 1847956774;
  unsigned int v8 = 1755732067
     * (((&v10 | 0x8E52AAAD) - &v10 + (&v10 & 0x71AD5550)) ^ 0x50941776);
  unsigned int v10 = (v7 ^ 0xFFDDE664) + v8 + ((2 * v7) & 0xFFBBCCC8) + 1370734048;
  int v12 = v8 ^ (v3 - 2138962107);
  uint64_t v13 = v4;
  int v14 = v6 ^ v8;
  uint64_t v11 = v5;
  uint64_t result = ((uint64_t (*)(unsigned int *))((char *)*(&off_100079130 + (v3 ^ 0x7F7DFD65)) - 8))(&v10);
  *(_DWORD *)(a1 + 2_Block_object_dispose(va, 8) = v15;
  return result;
}

void sub_10005A8B8()
{
  unint64_t v0 = qword_10007E740 ^ (unint64_t)&v1 ^ qword_10007E730;
  qword_10007E740 = 536075833 * v0 + 0x3076D37E12EEFF1CLL;
  qword_10007E730 = 536075833 * (v0 ^ 0x86C548EE6B3237FCLL);
  unsigned int v3 = 1951 - 1759421093 * ((2 * (&v2 & 0x1AB9A500) - &v2 + 1699109631) ^ 0xD63BEAAB);
  uint64_t v2 = (uint64_t)*(&off_100079130
  sub_1000573A4((uint64_t)&v2);
}

uint64_t sub_10005A9E0(uint64_t result)
{
  unint64_t v1 = 1755732067 * ((2 * (result & 0x155053FA18C8728CLL) - result + 0x6AAFAC05E7378D73LL) ^ 0xB7040B3A39F130A8LL);
  unint64_t v2 = *(void *)(result + 16) ^ v1;
  unint64_t v3 = *(void *)(result + 8) - v1;
  BOOL v4 = v3 > v2;
  BOOL v5 = v3 == v2;
  int v6 = v4;
  if (((*(_DWORD *)(result + 32) - 1755732067 * ((2 * (result & 0x18C8728C) - (_DWORD)result - 415789709) ^ 0x39F130A8)) & 1) != 0) {
    int v7 = v6;
  }
  else {
    int v7 = v5;
  }
  if (v7) {
    int v8 = *(_DWORD *)(result + 24) + 1755732067 * ((2 * (result & 0x18C8728C) - result - 415789709) ^ 0x39F130A8);
  }
  else {
    int v8 = *(_DWORD *)(result + 28) - 1755732067 * ((2 * (result & 0x18C8728C) - result - 415789709) ^ 0x39F130A8);
  }
  *(_DWORD *)uint64_t result = *(_DWORD *)(result + 4) ^ (1755732067
                                               * ((2 * (result & 0x18C8728C) - result - 415789709) ^ 0x39F130A8)) ^ v8;
  return result;
}

uint64_t sub_10005AA80(char a1, unsigned int a2)
{
  return byte_1000682C0[(byte_100064A60[a2] ^ a1)] ^ a2;
}

uint64_t sub_10005AAAC(char a1, unsigned int a2)
{
  return byte_100064B60[(byte_100070F00[a2] ^ a1)] ^ a2;
}

uint64_t sub_10005AAD8(char a1, unsigned int a2)
{
  return byte_100071000[(byte_10006C310[a2] ^ a1)] ^ a2;
}

uint64_t sub_10005AB04(char a1, unsigned int a2)
{
  return byte_10006C410[(byte_1000683C0[a2] ^ a1)] ^ a2;
}

uint64_t sub_10005AB30(char a1, unsigned int a2)
{
  return byte_1000684C0[(byte_100064C60[a2] ^ a1)] ^ a2;
}

uint64_t sub_10005AB5C(unsigned int a1)
{
  return byte_100071000[byte_10006C310[a1] ^ 0xB6] ^ a1;
}

uint64_t sub_10005AB88(unsigned int a1)
{
  return byte_100064B60[byte_100070F00[a1] ^ 0x1B] ^ a1;
}

uint64_t sub_10005ABB4(unsigned int a1)
{
  return byte_100071000[byte_10006C310[a1] ^ 0x53] ^ a1;
}

uint64_t sub_10005ABE0(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (235795823 * ((2 * (a1 & 0x5AD4AFC8) - a1 + 623595575) ^ 0xB186196E));
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  unsigned int v5 = v1
     + 1225351577
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  return ((uint64_t (*)(unsigned int *))*(&off_100079130 + (int)(v1 ^ 0x8FCD81B4)))(&v5);
}

uint64_t sub_10005ACE4(uint64_t a1)
{
  int v2 = 1374699841 * (a1 ^ 0x6DF41809);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)a1;
  unsigned int v7 = 1224239923 * ((((2 * &v10) | 0x912C61DA) - &v10 + 929681171) ^ 0x3A25CD3A);
  int v8 = (*(_DWORD *)(a1 + 8) ^ v2) - 368400168;
  int v11 = v2 + *(_DWORD *)(a1 + 56) - v7 - 707766453;
  int v16 = v8 + v7 + 869;
  uint64_t v13 = v3;
  uint64_t v14 = v5;
  uint64_t v10 = v6;
  uint64_t v12 = v4;
  uint64_t result = ((uint64_t (*)(uint64_t *))((char *)*(&off_100079130 + v8) - 4))(&v10);
  *(_DWORD *)(a1 + 24) = v15;
  return result;
}

void sub_10005ADFC()
{
  unint64_t v0 = (unint64_t)&v2[qword_10007E730 ^ qword_10007DB68];
  qword_10007DB68 = 536075833 * v0 - 0x793AB71194CDC804LL;
  qword_10007E730 = 536075833 * (v0 ^ 0x86C548EE6B3237FCLL);
  uint64_t v3 = (char *)*(&off_100079130
  unsigned int v4 = 1951 - 1759421093 * (((&v3 | 0x62E542B1) - (&v3 & 0x62E542B1)) ^ 0xD198F2E5);
  sub_1000573A4((uint64_t)&v3);
  unsigned int v4 = 1951 - 1759421093 * ((((2 * &v3) | 0xD19EEED6) - &v3 - 1758426987) ^ 0xDBB2C73F);
  uint64_t v3 = (char *)*(&off_100079130
               + ((57 * (qword_10007DB68 ^ 0xFC ^ qword_10007E730)) ^ byte_100071000[byte_10006C310[(57 * (qword_10007DB68 ^ 0xFC ^ qword_10007E730))] ^ 0x15])
               + 80)
     - 4;
  sub_1000573A4((uint64_t)&v3);
  unsigned int v1 = 1225351577
     * (((&v3 ^ 0x9D172845 | 0xE551A89D)
  LODWORD(v3) = v1 + 336;
  BYTE4(v3) = v1 ^ 0x7D;
  sub_10002355C((uint64_t)&v3);
}

void sub_10005B024(_DWORD *a1)
{
  uint64_t v1 = *(void *)*(&off_100079130
                  + (int)((*a1 ^ (535753261
  unsigned int v3 = (3804331 * (&v2 ^ 0x7ED525F6)) ^ ((*a1 ^ (535753261
                                                             * ((1711628207
                                                               - (a1 | 0x66055FAF)
  uint64_t v2 = v1;
  sub_100036834((uint64_t)&v2);
}

uint64_t sub_10005B100(char a1, unsigned int a2)
{
  return byte_1000681C0[(byte_100064960[a2] ^ a1)] ^ a2;
}

uint64_t sub_10005B12C(unsigned int a1)
{
  return byte_1000681C0[byte_100064960[a1] ^ 0x85] ^ a1;
}

uint64_t sub_10005B158(unsigned int a1)
{
  return byte_1000682C0[byte_100064A60[a1] ^ 0xF7] ^ a1;
}

uint64_t sub_10005B184(unsigned int a1)
{
  return byte_100064B60[byte_100070F00[a1] ^ 0x5E] ^ a1;
}

uint64_t sub_10005B1B0(unsigned int a1)
{
  return byte_100071000[byte_10006C310[a1] ^ 0x15] ^ a1;
}

uint64_t sub_10005B1DC(unsigned int a1)
{
  return byte_10006C410[byte_1000683C0[a1] ^ 0x84] ^ a1;
}

uint64_t sub_10005B208(unsigned int a1)
{
  return byte_1000684C0[byte_100064C60[a1] ^ 0xCD] ^ a1;
}

uint64_t sub_10005B234(unsigned int a1)
{
  return byte_1000682C0[byte_100064A60[a1] ^ 0xCC] ^ a1;
}

uint64_t sub_10005B260(unsigned int a1)
{
  return byte_10006C410[byte_1000683C0[a1] ^ 0xF9] ^ a1;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0LL);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3LL;
  }
  unsigned int v4 = *(_BYTE **)result;
  if (*(void *)result == -1LL) {
    goto LABEL_68;
  }
  uint64_t v5 = &v4[v3];
  uint64_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    uint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1LL)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0LL;
            }
LABEL_34:
            uint64_t result = 0LL;
            *a3 = v15;
            return result;
          }

LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }

        return 3LL;
      }

      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3LL;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3LL;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3LL;
      }
      unint64_t v15 = 0LL;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1LL)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3LL;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0LL;
        }
      }
    }

LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }

  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3LL;
  }
  unint64_t v8 = 0LL;
  uint64_t result = 3LL;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    uint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3LL;
      }
      goto LABEL_20;
    }
  }

  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3LL;
  }
  unsigned int v4 = *(_BYTE **)result;
  if (*(void *)result == -1LL) {
    goto LABEL_54;
  }
  uint64_t v5 = &v4[v3];
  uint64_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    uint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1LL)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3LL;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7LL;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0LL;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }

        goto LABEL_55;
      }

      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3LL;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3LL;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }

      if (!*v14) {
        return 3LL;
      }
      unint64_t v15 = 0LL;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1LL)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3LL;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }

LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }

  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3LL;
  }
  unint64_t v8 = 0LL;
  uint64_t result = 3LL;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    uint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3LL;
      }
      goto LABEL_20;
    }
  }

  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  *a3 = 0;
  *a2 = 0LL;
  a2[1] = 0LL;
  if (!*(void *)(result + 8)) {
    return 3LL;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }

      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }

      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1LL)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }

        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0LL;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }

        goto LABEL_19;
      }
    }

    return 3LL;
  }

  if (v3) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3LL;
  }
  uint64_t result = 0LL;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0LL;
      *a3 = a2;
      return result;
    }
  }

  return 3LL;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, &v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4))
    {
      return 7LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a2 = v4;
    }
  }

  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3LL;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3LL;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7LL;
    }
    goto LABEL_10;
  }

  if (v2 >= 2)
  {
    if (v2 > 9) {
      return 7LL;
    }
  }

LABEL_10:
  unint64_t v5 = 0LL;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }

  while (v2);
  uint64_t result = 0LL;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008LL)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }

      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0LL;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }

      __break(0x5519u);
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1LL;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0LL;
        *a1 = v9;
        return result;
      }

      __break(0x5519u);
    }

    __break(0x5513u);
  }

  return result;
}

uint64_t DERParseSequenceToObject( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0LL);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010LL) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERParseSequenceContentToObject( unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v32 = 0LL;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }

  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    int v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result) {
        break;
      }
      if (a2 <= v13) {
        return 2LL;
      }
      while (1)
      {
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24LL * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24LL * v13 + 8)) {
          break;
        }
        uint64_t result = 2LL;
        if ((v18 & 1) != 0)
        {
          ++v13;
        }

        return result;
      }

      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24LL * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7LL;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3LL;
            }

            goto LABEL_59;
          }

          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }

          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }

      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }

LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }

      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }

    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0LL;
      }

      else
      {
        BOOL v25 = (__int16 *)(a3 + 24LL * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0LL;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }

        return 5LL;
      }
    }
  }

  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0LL;
    }
    else {
      return 3LL;
    }
  }

  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent( unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0LL);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012LL >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  v9[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }

  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result) {
      break;
    }
    if (v7) {
      return 0LL;
    }
  }

  else {
    return result;
  }
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)",  buf,  8u);
}

void logObjectForModule_cold_1()
{
}

void _splitASN1Tokens_cold_1()
{
}

void _splitASN1Tokens_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = OUTLINED_FUNCTION_19(a1, a2);
  *(_DWORD *)uint64_t v4 = 134217984;
  *uint64_t v3 = v5;
  OUTLINED_FUNCTION_7((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "pItemBegin: %p", v4);
  OUTLINED_FUNCTION_22();
}

void _splitASN1Tokens_cold_4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = OUTLINED_FUNCTION_19(a1, a2);
  *(_DWORD *)uint64_t v4 = 134217984;
  *uint64_t v3 = v5;
  OUTLINED_FUNCTION_7((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "pItemEnd: %p", v4);
  OUTLINED_FUNCTION_22();
}

void _splitASN1Tokens_cold_5(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "ret: %d", buf, 8u);
}

void _splitASN1Tokens_cold_7(uint64_t a1, os_log_s *a2)
{
}

void _splitASN1Tokens_cold_9(uint64_t a1, os_log_s *a2)
{
}

void _splitASN1Tokens_cold_11(void *a1, char *a2)
{
}

void _splitASN1Tokens_cold_13()
{
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)",  buf,  8u);
}

id objc_msgSend__requestMetadataForCertSerial_issuerSeq_ppid_requestedLocale_requestInfo_withReply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestMetadataForCertSerial:issuerSeq:ppid:requestedLocale:requestInfo:withReply:");
}