void RBSSerializeCFValueToXPCDictionaryWithKey(uint64_t a1, void *a2, const char *a3)
{
  id v5;
  void *v6;
  xpc_object_t xdict;
  v5 = a2;
  if (a1 && v5 && a3)
  {
    xdict = v5;
    v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v6) {
      xpc_dictionary_set_value(xdict, a3, v6);
    }

    v5 = xdict;
  }
}

uint64_t RBSCreateDeserializedCFValueFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  if (!a1) {
    return 0LL;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v2 = xpc_dictionary_get_value(a1, a2);
  if (!v2) {
    return 0LL;
  }
  v3 = (void *)v2;
  uint64_t v4 = _CFXPCCreateCFObjectFromXPCObject();

  return v4;
}

id RBSDeserializeCFValueFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return (id)RBSCreateDeserializedCFValueFromXPCDictionaryWithKey(a1, a2);
}

void RBSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    if ([(id)objc_opt_class() supportsSecureCoding])
    {
      if (!v6) {
        goto LABEL_10;
      }
    }

    else
    {
      [MEMORY[0x1896077D8] currentHandler];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "void RBSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(NSObject<NSSecureCoding> *__strong, __strong xpc_ object_t, const char *)");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 handleFailureInFunction:v13, @"RBSXPCSerialization.m", 44, @"Invalid parameter not satisfying: %@", @"!object || [[object class] supportsSecureCoding]" file lineNumber description];

      if (!v6) {
        goto LABEL_10;
      }
    }

    uint64_t v7 = MEMORY[0x186E30AB4](v6);
    if (a3 && v7 == MEMORY[0x1895F9250])
    {
      v8 = (void *)MEMORY[0x186E304CC]();
      uint64_t v14 = 0LL;
      [MEMORY[0x1896078F8] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v14];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v14 && [v9 length])
      {
        id v11 = v10;
        xpc_dictionary_set_data(v6, a3, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
      }

      objc_autoreleasePoolPop(v8);
    }
  }

LABEL_10:
}

    v3 = 0LL;
    goto LABEL_11;
  }

  return v12;
}

uint64_t RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey( objc_class *a1, void *a2, const char *a3)
{
  id v5 = a2;
  if (!a1)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "NSObject<NSSecureCoding> *RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(__unsafe_unr etained Class, __strong xpc_object_t, const char *)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInFunction:v17, @"RBSXPCSerialization.m", 58, @"Invalid parameter not satisfying: %@", @"class != nil" file lineNumber description];
  }

  if ((-[objc_class supportsSecureCoding](a1, "supportsSecureCoding") & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "NSObject<NSSecureCoding> *RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(__unsafe_unr etained Class, __strong xpc_object_t, const char *)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 handleFailureInFunction:v19, @"RBSXPCSerialization.m", 59, @"Invalid parameter not satisfying: %@", @"[class supportsSecureCoding]" file lineNumber description];
  }

  uint64_t v6 = 0LL;
  if (v5 && a3)
  {
    uint64_t v7 = xpc_dictionary_get_value(v5, a3);
    v8 = (void *)v7;
    if (v7 && MEMORY[0x186E30AB4](v7) == MEMORY[0x1895F9240])
    {
      v9 = (void *)MEMORY[0x186E304CC]();
      v10 = (void *)MEMORY[0x189603F48];
      bytes_ptr = xpc_data_get_bytes_ptr(v8);
      [v10 dataWithBytes:bytes_ptr length:xpc_data_get_length(v8)];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v20 = 0LL;
      uint64_t v6 = [MEMORY[0x189607908] unarchivedObjectOfClass:a1 fromData:v12 error:&v20];
      id v13 = v20;
      if (v13)
      {
        rbs_coder_log();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey_cold_1(a1, (uint64_t)v13, v14);
        }
      }

      objc_autoreleasePoolPop(v9);
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  return v6;
}

id RBSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey( objc_class *a1, void *a2, const char *a3)
{
  return (id)RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey( a1,  a2,  a3);
}

void RBSSerializeStringToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      id v5 = a1;
      xpc_object_t xdict = a2;
      xpc_dictionary_set_string(xdict, a3, (const char *)[v5 UTF8String]);
    }
  }
}

const char *RBSCreateDeserializedStringFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    string = xpc_dictionary_get_string(v3, a2);
    if (string) {
      string = (const char *)[objc_alloc(NSString) initWithCString:string encoding:4];
    }
  }

  else
  {
    string = 0LL;
  }

  return string;
}

const char *RBSDeserializeStringFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return (id)RBSCreateDeserializedStringFromXPCDictionaryWithKey(a1, a2);
}

void RBSSerializeDataToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      id v5 = a1;
      xpc_object_t xdict = a2;
      id v6 = v5;
      uint64_t v7 = (const void *)[v6 bytes];
      size_t v8 = [v6 length];

      xpc_dictionary_set_data(xdict, a3, v7, v8);
    }
  }

const void *RBSCreateDeserializedDataFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  size_t length = 0LL;
  if (v3)
  {
    data = xpc_dictionary_get_data(v3, a2, &length);
    if (data)
    {
      id v6 = objc_alloc(MEMORY[0x189603F48]);
      data = (const void *)[v6 initWithBytes:data length:length];
    }
  }

  else
  {
    data = 0LL;
  }

  return data;
}

const void *RBSDeserializeDataFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return (id)RBSCreateDeserializedDataFromXPCDictionaryWithKey(a1, a2);
}

void RBSSerializeDoubleToXPCDictionaryWithKey(xpc_object_t xdict, const char *key, double value)
{
  if (xdict)
  {
    if (key) {
      xpc_dictionary_set_double(xdict, key, value);
    }
  }

double RBSDeserializeDoubleFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  double value = 0.0;
  if (a1 && a2)
  {
    uint64_t v3 = xpc_dictionary_get_value(a1, a2);
    uint64_t v4 = (void *)v3;
    if (v3 && MEMORY[0x186E30AB4](v3) == MEMORY[0x1895F9258]) {
      double value = xpc_double_get_value(v4);
    }
  }

  return value;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void RBSDispatchAsyncWithQoS(void *a1, dispatch_qos_class_t a2, void *a3)
{
  queue = a1;
  if (a2)
  {
    id v5 = (dispatch_queue_s *)dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, a2, 0, a3);
    dispatch_async(queue, v5);

    id v6 = v5;
  }

  else
  {
    dispatch_async(queue, a3);
    id v6 = queue;
  }
}

LABEL_14:
    HIDWORD(v12) = *(_DWORD *)(a1 + 36) - 9;
    LODWORD(v12) = HIDWORD(v12);
    id v11 = v12 >> 2;
    id v13 = v11 > 6;
    uint64_t v14 = (1 << v11) & 0x5D;
    if (v13 || v14 == 0) {
      *(_DWORD *)(a1 + 36) = 17;
    }
    os_unfair_lock_unlock(v2);
  }

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_15:
  return v6;
}

  return v10;
}

CFStringRef NSStringFromRBSCPUMaximumUsageViolationPolicy(unint64_t a1)
{
  if (a1 > 2) {
    return @"(undefined)";
  }
  else {
    return off_189DE0310[a1];
  }
}

LABEL_34:
    goto LABEL_35;
  }

  v12 = 0;
LABEL_38:

  return v12;
}

uint64_t RBSAtomicGetFlag(unsigned int *a1)
{
  if (!a1) {
    RBSAtomicGetFlag_cold_1();
  }
  while (1)
  {
    unsigned int v1 = __ldxr(a1);
    if (v1 != 1) {
      break;
    }
    uint64_t v2 = 1LL;
    if (!__stxr(1u, a1)) {
      return v2;
    }
  }

  uint64_t v2 = 0LL;
  __clrex();
  return v2;
}

uint64_t RBSAtomicSetFlag(unsigned int a1, unsigned int *a2)
{
  if (!a2) {
    RBSAtomicSetFlag_cold_1();
  }
  while (1)
  {
    unsigned int v2 = __ldxr(a2);
    if (v2 != (a1 ^ 1)) {
      break;
    }
    if (!__stxr(a1, a2)) {
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

BOOL RBSandboxCanGetProcessInfo(int a1)
{
  if (getpid() == a1) {
    return 1LL;
  }
  if (RBSandboxCanGetProcessInfo_onceToken != -1) {
    dispatch_once(&RBSandboxCanGetProcessInfo_onceToken, &__block_literal_global_2);
  }
  return RBSandboxCanGetProcessInfo_allowed != 0;
}

uint64_t __RBSandboxCanGetProcessInfo_block_invoke()
{
  uint64_t result = sandbox_check();
  RBSandboxCanGetProcessInfo_allowed = (_DWORD)result == 0;
  return result;
}

id RBObjectOfClassForKey(void *a1, uint64_t a2)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      unsigned int v2 = v3;
    }
    else {
      unsigned int v2 = 0LL;
    }
  }

  id v4 = v2;

  return v4;
}

BOOL _RBShortBSDProcessInfoForPID(int a1, void *a2)
{
  BOOL result = 0LL;
  if (a1 >= 1)
  {
    if (a2)
    {
      BOOL result = RBSandboxCanGetProcessInfo(a1);
      if (result)
      {
        if (proc_pidinfo(a1, 13, 0LL, a2, 64) == 64)
        {
          return 1LL;
        }

        else
        {
          if (*__error() != 3)
          {
            rbs_general_log();
            id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
              _RBShortBSDProcessInfoForPID_cold_1(a1, v5);
            }
          }

          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t RBSSandboxCanAccessMachService()
{
  if (RBSSandboxCanAccessMachService_onceToken != -1) {
    dispatch_once(&RBSSandboxCanAccessMachService_onceToken, &__block_literal_global_4);
  }
  return RBSSandboxCanAccessMachService_canAccess;
}

uint64_t __RBSSandboxCanAccessMachService_block_invoke()
{
  uint64_t result = sandbox_check();
  RBSSandboxCanAccessMachService_canAccess = (_DWORD)result == 0;
  return result;
}

id RBSExecutablePathForPID()
{
  int v0 = MEMORY[0x1895F8858]();
  int v1 = v0;
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (v0 >= 1 && RBSandboxCanGetProcessInfo(v0))
  {
    int v2 = proc_pidpath(v1, buffer, 0x1000u);
    if (v2 < 1)
    {
      rbs_general_log();
      uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        RBSExecutablePathForPID_cold_2();
      }
      id v4 = 0LL;
    }

    else
    {
      uint64_t v3 = (os_log_s *)[objc_alloc(NSString) initWithBytes:buffer length:v2 encoding:4];
      -[os_log_s stringByStandardizingPath](v3, "stringByStandardizingPath");
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v4;
  }

  else
  {
    rbs_general_log();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      RBSExecutablePathForPID_cold_1(v1);
    }

    return 0LL;
  }

id RBSExecutablePathForBundlePath(void *a1)
{
  id v1 = a1;
  RBSSystemRootDirectory();
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringByAppendingPathComponent:v1];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  id v4 = (void *)[objc_alloc(MEMORY[0x1896077F8]) initWithPath:v3];
  [v4 executablePath];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id RBSSystemRootDirectory()
{
  if (RBSSystemRootDirectory_onceToken != -1) {
    dispatch_once(&RBSSystemRootDirectory_onceToken, &__block_literal_global_9);
  }
  return (id)RBSSystemRootDirectory___SystemRootDirectory;
}

id RBSBundleIDForPID(int a1)
{
  if (getpid() != a1)
  {
    RBSExecutablePathForPID();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      int v2 = 0LL;
      goto LABEL_17;
    }

    uint64_t v3 = (void *)MEMORY[0x186E304CC]();
    id v1 = v1;
    [v1 UTF8String];
    id v4 = (void *)xpc_bundle_create();
    if (v4)
    {
      xpc_bundle_get_info_dictionary();
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5
        && (string = xpc_dictionary_get_string( v5, (const char *)[(id) *MEMORY[0x189604E00] UTF8String])) != 0)
      {
        int v2 = (void *)[objc_alloc(NSString) initWithUTF8String:string];

        if (v2)
        {
LABEL_16:

          objc_autoreleasePoolPop(v3);
          goto LABEL_17;
        }
      }

      else
      {
      }
    }

    [MEMORY[0x189604030] fileURLWithPath:v1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (uint64_t v8 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle()) != 0LL)
    {
      v9 = v8;
      CFBundleGetIdentifier(v8);
      int v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v9);
    }

    else
    {
      int v2 = 0LL;
    }

    goto LABEL_16;
  }

  [MEMORY[0x1896077F8] mainBundle];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 bundleIdentifier];
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v2;
}

id RBSPathForSystemDirectory(NSSearchPathDirectory a1)
{
  return _RBSearchPathForDirectoryInDomain(a1, 8uLL);
}

id _RBSearchPathForDirectoryInDomain(NSSearchPathDirectory a1, NSSearchPathDomainMask domainMask)
{
  char v2 = domainMask;
  uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)domainMask);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] == 1LL)
  {
    NSSearchPathForDirectoriesInDomains(a1, domainMask, 1);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 firstObject];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if ((v2 & 1) != 0) {
        RBSCurrentUserDirectory();
      }
      else {
        RBSSystemRootDirectory();
      }
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v5 hasPrefix:v7])
      {
        id v6 = v5;
      }

      else
      {
        [v7 stringByAppendingPathComponent:v5];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 stringByStandardizingPath];
        id v6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

id RBSPathForCurrentUserDirectory(NSSearchPathDirectory a1)
{
  return _RBSearchPathForDirectoryInDomain(a1, 1uLL);
}

id RBSCurrentUserDirectory()
{
  if (RBSCurrentUserDirectory___once != -1) {
    dispatch_once(&RBSCurrentUserDirectory___once, &__block_literal_global_8);
  }
  return (id)RBSCurrentUserDirectory___userDirectory;
}

void __RBSCurrentUserDirectory_block_invoke()
{
  id v0 = objc_alloc(NSString);
  uid_t v1 = getuid();
  uint64_t v2 = [v0 initWithUTF8String:getpwuid(v1)->pw_dir];
  uint8x8_t v3 = (void *)RBSCurrentUserDirectory___userDirectory;
  RBSCurrentUserDirectory___userDirectory = v2;
}

void __RBSSystemRootDirectory_block_invoke()
{
  CFStringRef v0 = CFStringCreateWithFileSystemRepresentation(0LL, "/");
  uid_t v1 = (void *)RBSSystemRootDirectory___SystemRootDirectory;
  RBSSystemRootDirectory___SystemRootDirectory = (uint64_t)v0;
}

id RBSNumberForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  RBObjectOfClassForKey(v4, (uint64_t)v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id RBSStringForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  RBObjectOfClassForKey(v4, (uint64_t)v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id RBSURLForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  RBObjectOfClassForKey(v4, (uint64_t)v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id RBSArrayForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  RBObjectOfClassForKey(v4, (uint64_t)v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id RBSDictionaryForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  RBObjectOfClassForKey(v4, (uint64_t)v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t RBSBoolForKey(void *a1, uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 0LL;
  }

  return v3;
}

double RBSMachAbsoluteTime()
{
  if (*(double *)&RBSMachAbsoluteTime___TimeScale == 0.0 && !mach_timebase_info(&info))
  {
    LODWORD(v0) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&RBSMachAbsoluteTime___TimeScale = (double)v0 / (double)v1 / 1000000000.0;
  }

  return *(double *)&RBSMachAbsoluteTime___TimeScale * (double)mach_absolute_time();
}

BOOL RBSPIDExists(int a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (getpid() == a1) {
    return 1LL;
  }
  if (a1 < 1) {
    return 0LL;
  }
  return _RBShortBSDProcessInfoForPID(a1, v3);
}

uint64_t RBSPIDIsBeingDebugged(int a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (a1 < 1) {
    return 0LL;
  }
  BOOL v1 = _RBShortBSDProcessInfoForPID(a1, v3);
  return *(_DWORD *)&v1 & ((v3[32] & 2) >> 1);
}

void RBSDispatchQueueAssert(void *a1)
{
  BOOL v1 = a1;
  uint64_t v3 = v1;
  if (v1 == (dispatch_queue_s *)MEMORY[0x1895F8AE0])
  {
    if (([MEMORY[0x189607A40] isMainThread] & 1) == 0)
    {
      uint64_t v2 = (void *)MEMORY[0x1895F8AE0];
      dispatch_assert_queue_V2(MEMORY[0x1895F8AE0]);
    }
  }

  else
  {
    dispatch_assert_queue_V2(v1);
  }
}

BOOL RBSAuditTokenRepresentsPlatformBinary(_OWORD *a1)
{
  __int128 v2 = a1[1];
  *(_OWORD *)v7.val = *a1;
  *(_OWORD *)&v7.val[4] = v2;
  uint64_t v3 = SecTaskCreateWithAuditToken(0LL, &v7);
  uint32_t CodeSignStatus = SecTaskGetCodeSignStatus(v3);
  if (v3)
  {
    CFRelease(v3);
  }

  else
  {
    rbs_general_log();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      RBSAuditTokenRepresentsPlatformBinary_cold_1(a1, v5);
    }
  }

  return (CodeSignStatus & 0xC000001) == 67108865;
}

BOOL RBSIsBinaryCatalystOriOS(int a1)
{
  int buffer = 0;
  if (proc_pidinfo(a1, 30, 0LL, &buffer, 4) == 4) {
    return (buffer & 0xFFFFFFFB) == 2;
  }
  rbs_general_log();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    RBSIsBinaryCatalystOriOS_cold_1(a1, v3, v4);
  }

  return 0LL;
}

id RBSExtensionPointFromBundleDict(void *a1)
{
  id v1 = a1;
  [v1 objectForKeyedSubscript:@"NSExtension"];
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    [v1 objectForKeyedSubscript:@"EXAppExtensionAttributes"];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"EXExtensionPointIdentifier"];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

id RBSContainedExtensionBundleIDs(void *a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  [MEMORY[0x189603FE0] setWithObject:v1];
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x189605738]) initWithBundleIdentifier:v1 allowPlaceholder:0 error:0];
  rbs_general_log();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      [v3 applicationExtensionRecords];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      uint64_t v21 = [v6 count];
      __int16 v22 = 2112;
      id v23 = v1;
      _os_log_impl(&dword_185F67000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu extensions contained in %@", buf, 0x16u);
    }

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    objc_msgSend(v3, "applicationExtensionRecords", 0);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v4);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          rbs_general_log();
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            RBSContainedExtensionBundleIDs_cold_1(buf, v11, &v21, v12);
          }

          [v11 bundleIdentifier];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v2 addObject:v13];
        }

        uint64_t v8 = -[os_log_s countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v8);
    }
  }

  else if (v5)
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = (uint64_t)v1;
    _os_log_impl( &dword_185F67000,  v4,  OS_LOG_TYPE_DEFAULT,  "failed to get LSApplicationRecord for %@ - probably OK",  buf,  0xCu);
  }

  return v2;
}

  ;
}

void OUTLINED_FUNCTION_1_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_2_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

LABEL_27:
      else {
        objc_msgSend(NSString, "stringWithFormat:", @"0x%llx", a3);
      }
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v8 & 1) != 0)
      {
        id v13 = v11;
        v12 = v13;
      }

      else
      {
        if (!a4) {
          goto LABEL_36;
        }
        [NSString stringWithFormat:@"%@(%@)", v7, v11];
        id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v7 = v13;
LABEL_36:

      return v7;
  }

void sub_185F740DC(_Unwind_Exception *a1)
{
}

void sub_185F74AE8(_Unwind_Exception *a1)
{
}

void _RBSXPCEncodeObjectForKey(void *a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  BOOL v5 = a1;
  id v6 = a2;
  id v47 = a3;
  context = (void *)MEMORY[0x186E304CC]();
  aClass = (objc_class *)objc_opt_class();
  if ([v6 RBSIsXPCObject])
  {
    uint64_t v7 = (void *)v5[3];
    if (v47)
    {
      if (!v7) {
        uint64_t v7 = (void *)v5[1];
      }
      id v8 = v7;
      xpc_dictionary_set_value(v8, (const char *)[v47 UTF8String], v6);
    }

    else
    {
      if (!v7) {
        uint64_t v7 = (void *)v5[1];
      }
      id v17 = v7;
      xpc_array_append_value(v17, v6);
    }

    goto LABEL_42;
  }

  if ((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || _NSIsNSOrderedSet())
  {
    uint64_t v9 = v5;
    id v10 = v47;
    id v11 = v6;
    id v12 = v9[3];
    if (!v12) {
      id v12 = v9[1];
    }
    id v13 = v12;
    xpc_object_t v14 = xpc_array_create(0LL, 0LL);
    id v45 = v10;
    objc_storeStrong(v9 + 3, v14);
    if (v10)
    {
      if (v13 && MEMORY[0x186E30AB4](v13) == MEMORY[0x1895F9250]) {
        goto LABEL_22;
      }
      [MEMORY[0x1896077D8] currentHandler];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "void _BSXPCEncodeCollectionWithKey(RBSXPCCoder *__strong, NSString *__strong, __strong id<NSFastEnumeration>)");
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 handleFailureInFunction:v16 file:@"RBSXPCCoder.m" lineNumber:269 description:&stru_189DE1D08];
    }

    else
    {
      if (v13 && MEMORY[0x186E30AB4](v13) == MEMORY[0x1895F9220]) {
        goto LABEL_22;
      }
      [MEMORY[0x1896077D8] currentHandler];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "void _BSXPCEncodeCollectionWithKey(RBSXPCCoder *__strong, NSString *__strong, __strong id<NSFastEnumeration>)");
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 handleFailureInFunction:v16 file:@"RBSXPCCoder.m" lineNumber:268 description:&stru_189DE1D08];
    }

LABEL_22:
    if (!v11)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "void _BSXPCEncodeCollectionWithKey(RBSXPCCoder *__strong, NSString *__strong, __strong id<NSFastEnumeration>)");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v40 handleFailureInFunction:v41 file:@"RBSXPCCoder.m" lineNumber:270 description:&stru_189DE1D08];
    }

    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v58;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v58 != v20) {
            objc_enumerationMutation(v18);
          }
          _RBSXPCEncodeObjectForKey(v9, *(void *)(*((void *)&v57 + 1) + 8 * i), 0LL);
        }

        uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:v61 count:16];
      }

      while (v19);
    }

    if (v14)
    {
      if (v45)
      {
        __int16 v22 = (const char *)[v45 UTF8String];
        id v23 = v13;
        id v24 = v14;
        if (v22)
        {
          if (v13)
          {
            v25 = v24;
            if (MEMORY[0x186E30AB4]() == MEMORY[0x1895F9220]) {
              xpc_dictionary_set_value(v23, v22, v25);
            }
          }
        }

        else
        {
          [MEMORY[0x1896077D8] currentHandler];
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend( NSString,  "stringWithUTF8String:",  "void RBSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullab le __strong, xpc_type_t _Nullable)");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          [v42 handleFailureInFunction:v43 file:@"RBSXPCUtilities_Project.h" lineNumber:123 description:@"key must not be nil"];
        }
      }

      else
      {
        id v26 = v13;
        id v27 = v14;
        if (v13)
        {
          v28 = v27;
          if (MEMORY[0x186E30AB4]() == MEMORY[0x1895F9220]) {
            xpc_array_append_value(v26, v28);
          }
        }
      }
    }

    id v29 = _BSXPCPopEncodingContext(v9, v13);

    goto LABEL_42;
  }

  if (_NSIsNSDictionary())
  {
    v54[0] = MEMORY[0x1895F87A8];
    v54[1] = 3221225472LL;
    v54[2] = ___RBSXPCEncodeObjectForKey_block_invoke;
    v54[3] = &unk_189DE07A0;
    id v55 = v6;
    v56 = v5;
    _BSXPCEncodeDictionaryWithKey(v56, v47, v54);

    v30 = v55;
LABEL_47:

    goto LABEL_42;
  }

  if ([v6 supportsRBSXPCSecureCoding])
  {
    v51[0] = MEMORY[0x1895F87A8];
    v51[1] = 3221225472LL;
    v51[2] = ___RBSXPCEncodeObjectForKey_block_invoke_2;
    v51[3] = &unk_189DE07A0;
    id v52 = v6;
    v53 = v5;
    _BSXPCEncodeDictionaryWithKey(v53, v47, v51);

    v30 = v52;
    goto LABEL_47;
  }

  if (-[objc_class supportsSecureCoding](aClass, "supportsSecureCoding"))
  {
    v31 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v31)
    {
      v32 = (void *)v5[3];
      if (v47)
      {
        if (!v32) {
          v32 = (void *)v5[1];
        }
        id v33 = v32;
        xpc_dictionary_set_value(v33, (const char *)[v47 UTF8String], v31);
      }

      else
      {
        if (!v32) {
          v32 = (void *)v5[1];
        }
        id v33 = v32;
        xpc_array_append_value(v33, v31);
      }
    }

    else
    {
      if (!v5[4])
      {
        uint64_t v38 = [objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
        v39 = (void *)v5[4];
        v5[4] = v38;
      }

      v48[0] = MEMORY[0x1895F87A8];
      v48[1] = 3221225472LL;
      v48[2] = ___RBSXPCEncodeObjectForKey_block_invoke_3;
      v48[3] = &unk_189DE07A0;
      v49 = v5;
      id v50 = v6;
      _BSXPCEncodeDictionaryWithKey(v49, v47, v48);

      id v33 = v49;
    }
  }

  else
  {
    v34 = (void *)MEMORY[0x189603F70];
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(aClass);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 raise:*MEMORY[0x189603A60], @"%@ could not encode object %@ because it supports neither RBSXPC[Secure]Coding nor NSSecureCoding.", v36, v37 format];
  }

LABEL_42:
  objc_autoreleasePoolPop(context);
}

LABEL_43:
        if ((_os_feature_enabled_impl() & 1) != 0)
        {
          LOBYTE(v9) = 0;
LABEL_47:

          goto LABEL_48;
        }

void sub_185F77584(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x185F77554LL);
  }

  JUMPOUT(0x185F7759CLL);
}

id RBSXPCDictionaryGetValue(void *a1, const char *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = v5;
  if (a2)
  {
    if (!v5) {
      goto LABEL_4;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "xpc_object_t  _Nullable RBSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
    xpc_object_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInFunction:v14 file:@"RBSXPCUtilities_Project.h" lineNumber:112 description:@"key must not be nil"];

    if (!v6) {
      goto LABEL_4;
    }
  }

  if (MEMORY[0x186E30AB4](v6) == MEMORY[0x1895F9250])
  {
    xpc_dictionary_get_value(v6, a2);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v11;
    if (!a3) {
      goto LABEL_6;
    }
    id v12 = v11;
    uint64_t v7 = v12;
    if (v12)
    {
      if (MEMORY[0x186E30AB4](v12) == a3) {
        id v8 = v7;
      }
      else {
        id v8 = 0LL;
      }
    }

    else
    {
      id v8 = 0LL;
    }

    goto LABEL_5;
  }

LABEL_4:
  uint64_t v7 = 0LL;
  id v8 = 0LL;
  id v9 = 0LL;
  if (a3)
  {
LABEL_5:
    id v9 = v8;
  }

LABEL_6:
  return v9;
}

id _BSXPCDecodeObjectForKey(void *a1, void *a2, objc_class *a3, uint8_t *a4)
{
  uint64_t v7 = a1;
  id v8 = a2;
  if (!v8)
  {
    [MEMORY[0x1896077D8] currentHandler];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "NSObject *_BSXPCDecodeObjectForKey(RBSXPCCoder *__strong, NSString *__strong, __unsafe_unretained Class, __unsafe_ unretained Class)");
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 handleFailureInFunction:v16, @"RBSXPCCoder.m", 399, @"Invalid parameter not satisfying: %@", @"key != nil" file lineNumber description];
  }

  id v9 = (void *)v7[3];
  if (!v9) {
    id v9 = (void *)v7[1];
  }
  id v10 = v9;
  id v11 = v8;
  RBSXPCDictionaryGetValue(v10, (const char *)[v11 UTF8String], 0);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  _BSXPCDecodeObjectFromContext(v7, v12, v11, a3, a4);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void _BSXPCEncodeDictionaryWithKey(void *a1, void *a2, void *a3)
{
  id v25 = a1;
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)*((void *)v25 + 3);
  if (!v7) {
    uint64_t v7 = (void *)*((void *)v25 + 1);
  }
  id v8 = v7;
  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  objc_storeStrong((id *)v25 + 3, v9);
  if (v5)
  {
    if (!v8 || MEMORY[0x186E30AB4](v8) != MEMORY[0x1895F9250])
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "void _BSXPCEncodeDictionaryWithKey(RBSXPCCoder *__strong, NSString *__strong, void (^__strong)(__strong xpc_object_t))");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = v10;
      id v13 = v11;
      uint64_t v14 = 299LL;
LABEL_10:
      [v12 handleFailureInFunction:v13 file:@"RBSXPCCoder.m" lineNumber:v14 description:&stru_189DE1D08];
    }
  }

  else if (!v8 || MEMORY[0x186E30AB4](v8) != MEMORY[0x1895F9220])
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "void _BSXPCEncodeDictionaryWithKey(RBSXPCCoder *__strong, NSString *__strong, void (^__strong)(__strong xpc_object_t))");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v10;
    id v13 = v11;
    uint64_t v14 = 298LL;
    goto LABEL_10;
  }

  v6[2](v6, v9);
  if (v9 && xpc_dictionary_get_count(v9))
  {
    if (v5)
    {
      __int128 v15 = (const char *)[v5 UTF8String];
      id v16 = v8;
      id v17 = v9;
      if (v15)
      {
        if (v8)
        {
          id v18 = v17;
          if (MEMORY[0x186E30AB4]() == MEMORY[0x1895F9250]) {
            xpc_dictionary_set_value(v16, v15, v18);
          }
        }
      }

      else
      {
        [MEMORY[0x1896077D8] currentHandler];
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( NSString,  "stringWithUTF8String:",  "void RBSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
        id v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 handleFailureInFunction:v24 file:@"RBSXPCUtilities_Project.h" lineNumber:123 description:@"key must not be nil"];
      }
    }

    else
    {
      id v19 = v8;
      id v20 = v9;
      if (v8)
      {
        uint64_t v21 = v20;
        if (MEMORY[0x186E30AB4]() == MEMORY[0x1895F9250]) {
          xpc_array_append_value(v19, v21);
        }
      }
    }
  }

  id v22 = _BSXPCPopEncodingContext(v25, v8);
}

void sub_185F78500()
{
}

void sub_185F78510()
{
  if ((v0 & 1) != 0) {
    JUMPOUT(0x185F78518LL);
  }
  JUMPOUT(0x185F7851CLL);
}

id _BSXPCPopEncodingContext(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)*((void *)v3 + 3);
  if (!v5) {
    id v5 = (void *)*((void *)v3 + 1);
  }
  id v6 = v5;
  objc_storeStrong((id *)v3 + 3, a2);
  uint64_t v7 = (void *)*((void *)v3 + 3);
  if (v7 == *((void **)v3 + 1))
  {
    *((void *)v3 + 3) = 0LL;
  }

  return v6;
}

id _BSXPCDecodeObjectFromContext(void *a1, void *a2, void *a3, objc_class *a4, uint8_t *a5)
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  xpc_object_t v9 = a1;
  id v79 = a2;
  id v76 = a3;
  if (!a4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "NSObject *_BSXPCDecodeObjectFromContext(RBSXPCCoder *__strong, __strong xpc_object_t, NSString *__strong, __unsafe _unretained Class, __unsafe_unretained Class)");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    [v68 handleFailureInFunction:v69, @"RBSXPCCoder.m", 405, @"Invalid parameter not satisfying: %@", @"expectedClass != nil" file lineNumber description];
  }

  id v10 = v9 + 3;
  id v11 = v9[3];
  if (!v11) {
    id v11 = v9[1];
  }
  id v78 = v11;
  id v12 = (id)MEMORY[0x1895F91C8];
  if (v79) {
    id v13 = v79;
  }
  else {
    id v13 = (void *)MEMORY[0x1895F91C8];
  }
  objc_storeStrong(v9 + 3, v13);
  context = (void *)MEMORY[0x186E304CC]();
  uint64_t v14 = v9;
  Class aClass = a4;
  if (!a4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    [v70 handleFailureInFunction:v71, @"RBSXPCCoder.m", 437, @"Invalid parameter not satisfying: %@", @"expectedClass != nil" file lineNumber description];
  }

  id v15 = *v10;
  if (!*v10) {
    id v15 = v14[1];
  }
  id v16 = v15;
  id v17 = v16;
  if (v16 == v12) {
    goto LABEL_35;
  }
  uint64_t v18 = MEMORY[0x186E30AB4](v16);
  NSClassFromString(@"OS_xpc_object");
  if ((-[objc_class isSubclassOfClass:]( a4,  "isSubclassOfClass:",  (id)objc_claimAutoreleasedReturnValue()) & 1) != 0)
  {
    id v19 = v17;
    goto LABEL_15;
  }

  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (a5)
    {
      if (v18 != MEMORY[0x1895F9220])
      {
        rbs_coder_log();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          _BSXPCDecodeObjectFromContext_cold_6();
        }
        uint64_t v21 = @"Invalid decoding context for collection";
LABEL_26:

LABEL_27:
        [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60] format:v21];
LABEL_35:
        id v19 = 0LL;
        goto LABEL_36;
      }

      id v35 = objc_alloc_init(MEMORY[0x189603FA8]);
      id applier = (id)MEMORY[0x1895F87A8];
      uint64_t v83 = 3221225472LL;
      v84 = ___BSXPCDecodeObject_block_invoke;
      v85 = &unk_189DE07C8;
      v86 = v14;
      v88 = a5;
      id v36 = v35;
      id v87 = v36;
      if (xpc_array_apply(v17, &applier))
      {
        id v19 = (id)[[aClass alloc] initWithArray:v36];
      }

      else
      {
        rbs_coder_log();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          _BSXPCDecodeObjectFromContext_cold_5();
        }

        [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60] format:@"Unable to decode array: an object within the array failed to decode"];
        id v19 = 0LL;
      }

      goto LABEL_15;
    }

    rbs_coder_log();
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(aClass);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _BSXPCDecodeObjectFromContext_cold_4(v30, (uint64_t)&applier, v29);
    }

    v31 = (void *)MEMORY[0x189603F70];
    NSStringFromClass(aClass);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 raise:*MEMORY[0x189603A60], @"Attempted to decode a collection (%@) without specifying the class it contains", v32 format];
LABEL_34:

    goto LABEL_35;
  }

  if (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()))
  {
    if (a5)
    {
      if (v18 != MEMORY[0x1895F9250])
      {
        rbs_coder_log();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          _BSXPCDecodeObjectFromContext_cold_10();
        }
        uint64_t v21 = @"Invalid decoding context for dictionary";
        goto LABEL_26;
      }

      *(void *)buf = 0LL;
      v91[0] = buf;
      v91[1] = 0x3032000000LL;
      v91[2] = __Block_byref_object_copy_;
      v91[3] = __Block_byref_object_dispose_;
      id v92 = 0LL;
      [MEMORY[0x189603FC8] dictionary];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      id applier = (id)MEMORY[0x1895F87A8];
      uint64_t v83 = 3221225472LL;
      v84 = ___BSXPCDecodeObject_block_invoke_180;
      v85 = &unk_189DE07F0;
      v86 = v14;
      v89 = a5;
      id v52 = v51;
      id v87 = v52;
      v88 = buf;
      if (xpc_dictionary_apply(v17, &applier))
      {
        id v19 = (id)[[aClass alloc] initWithDictionary:v52];
      }

      else
      {
        rbs_coder_log();
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          _BSXPCDecodeObjectFromContext_cold_9((uint64_t)v91, v53, v54);
        }

        [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60], @"Unable to decode dictionary key %@", *(void *)(v91[0] + 40) format];
        id v19 = 0LL;
      }

      _Block_object_dispose(buf, 8);
LABEL_15:
      if (!v19) {
        goto LABEL_36;
      }
      goto LABEL_16;
    }

    if (xpc_dictionary_get_string(v17, "bsx_index"))
    {
      if (v18 != MEMORY[0x1895F9250])
      {
        [MEMORY[0x1896077D8] currentHandler];
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( NSString,  "stringWithUTF8String:",  "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        [v72 handleFailureInFunction:v73 file:@"RBSXPCCoder.m" lineNumber:596 description:@"RBSXPCEncodingNSSecure expects a dictionary decodingContext"];
      }

      goto LABEL_60;
    }

    goto LABEL_52;
  }

  if (v18 != MEMORY[0x1895F9250]) {
    goto LABEL_52;
  }
  if ((-[objc_class supportsRBSXPCSecureCoding](a4, "supportsRBSXPCSecureCoding") & 1) != 0)
  {
    v49 = (NSString *)RBSCreateDeserializedStringFromXPCDictionaryWithKey(v17, "bsx_class");
    if (!v49)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      [v74 handleFailureInFunction:v75 file:@"RBSXPCCoder.m" lineNumber:574 description:@"we already verified that this must be true"];
    }

    id v50 = NSClassFromString(v49);
    if (v50)
    {
      if (aClass == v50)
      {
LABEL_102:
        id v19 = (id)[[v50 alloc] initWithRBSXPCCoder:v14];

        goto LABEL_15;
      }

      if ((-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", v50) & 1) != 0)
      {
        id v50 = aClass;
        goto LABEL_102;
      }

      if ((-[objc_class isSubclassOfClass:](v50, "isSubclassOfClass:", aClass) & 1) != 0) {
        goto LABEL_102;
      }
      rbs_coder_log();
      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(aClass);
        objc_claimAutoreleasedReturnValue();
        _BSXPCDecodeObjectFromContext_cold_12();
      }

      v67 = (void *)MEMORY[0x189603F70];
      NSStringFromClass(aClass);
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
      [v67 raise:*MEMORY[0x189603A60], @"Decoded class %@ is not compatible with expected class %@", v49, v62, v76, context, v78 format];
    }

    else
    {
      rbs_coder_log();
      __int128 v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(aClass);
        objc_claimAutoreleasedReturnValue();
        _BSXPCDecodeObjectFromContext_cold_11();
      }

      v61 = (void *)MEMORY[0x189603F70];
      NSStringFromClass(aClass);
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
      [v61 raise:*MEMORY[0x189603A60], @"Unable to reify class %@ for expected class %@", v49, v62, v76, context, v78 format];
    }

    id v50 = 0LL;
    goto LABEL_102;
  }

  if (!-[objc_class supportsSecureCoding](a4, "supportsSecureCoding"))
  {
    rbs_coder_log();
    id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(a4);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      _BSXPCDecodeObjectFromContext_cold_13(v56, (uint64_t)&applier, v55);
    }

    __int128 v57 = (void *)MEMORY[0x189603F70];
    NSStringFromClass(aClass);
    __int128 v58 = (void *)objc_claimAutoreleasedReturnValue();
    [v57 raise:*MEMORY[0x189603A60], @"No valid encoding type could be determined for expected class: %@", v58 format];

    [MEMORY[0x1896077D8] currentHandler];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 handleFailureInFunction:v59 file:@"RBSXPCCoder.m" lineNumber:630 description:@"we should not have been able to vet the class without defining the encoding"];

    goto LABEL_34;
  }

  if (xpc_dictionary_get_string(v17, "bsx_index"))
  {
    if (a5)
    {
      uint64_t v38 = objc_msgSend(MEMORY[0x189604010], "setWithObjects:", a4, a5, 0, v76, context, v78);
      goto LABEL_61;
    }

LABEL_60:
    uint64_t v38 = [MEMORY[0x189604010] setWithObjects:&aClass count:1];
LABEL_61:
    v39 = (void *)v38;
    if (!v14[5])
    {
      RBSDeserializeDataFromXPCDictionaryWithKey(v14[1], "bsx_archive");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v40 length])
      {
        v41 = v39;
        id v42 = objc_alloc(MEMORY[0x189607908]);
        id applier = 0LL;
        uint64_t v43 = [v42 initForReadingFromData:v40 error:&applier];
        v44 = (os_log_s *)applier;
        id v45 = v14[5];
        v14[5] = (void *)v43;

        [v14[5] setRequiresSecureCoding:1];
        if (v44)
        {
          rbs_coder_log();
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            _BSXPCDecodeObjectFromContext_cold_8((uint64_t)v44, v46, v47);
          }

          v48 = v14[5];
          v14[5] = 0LL;
        }
      }

      else
      {
        rbs_coder_log();
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v41 = v39;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          _BSXPCDecodeObjectFromContext_cold_7();
        }
      }

      v39 = v41;
    }

    RBSDeserializeStringFromXPCDictionaryWithKey(v17, "bsx_index");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v14[5];
    id v80 = 0LL;
    [v64 decodeTopLevelObjectOfClasses:v39 forKey:v63 error:&v80];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v65 = v80;
    if (v65) {
      [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60], @"Error during decoding of %@: %@", v63, v65 format];
    }

    goto LABEL_15;
  }

    uint64_t v43 = *(id *)(a1 + 8);
    v44 = v12;
    if (v43)
    {
      xpc_dictionary_get_value(v43, "_primitiveAssertions");
      id v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = !v18;
      if (!v45) {
        v46 = 1;
      }
      if ((v46 & 1) == 0) {
        xpc_dictionary_set_value(v44, "_primitiveAssertions", v45);
      }
    }

    else
    {
      id v45 = 0LL;
    }

    if ((v8 & 0x20) == 0) {
      goto LABEL_74;
    }
    goto LABEL_67;
  }

  id v12 = v10;
LABEL_77:

  return v12;
}

LABEL_52:
  id v19 = (id)_CFXPCCreateCFObjectFromXPCObject();
  if (!v19 && v18 == MEMORY[0x1895F92F0]) {
    id v19 = (id)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedLongLong:xpc_uint64_get_value(v17)];
  }
  if (!v19)
  {
    uint64_t v21 = @"Invalid decoding context for <CFXPCBridge>";
    goto LABEL_27;
  }

LABEL_16:
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    rbs_coder_log();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(aClass);
      objc_claimAutoreleasedReturnValue();
      _BSXPCDecodeObjectFromContext_cold_2();
    }

    id v25 = (void *)MEMORY[0x189603F70];
    id v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(aClass);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 raise:*MEMORY[0x189603A60], @"Decoded object class %@ does not match expected class %@", v27, v28 format];
  }

  objc_sync_exit(v2);

  return v2->_shortDescription;
}

LABEL_36:
  objc_storeStrong(v10, v11);
  id v33 = *v10;
  if (*v10 == v14[1])
  {
    id *v10 = 0LL;
  }

  objc_autoreleasePoolPop(context);

  return v19;
}

void sub_185F796CC(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x185F795DCLL);
  }

  JUMPOUT(0x185F796F0LL);
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

uint64_t OUTLINED_FUNCTION_0_2(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, os_log_s *a4@<X8>)
{
}

  ;
}

void OUTLINED_FUNCTION_4_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

id rbs_assertion_log()
{
  if (rbs_assertion_log_onceToken != -1) {
    dispatch_once(&rbs_assertion_log_onceToken, &__block_literal_global_3);
  }
  return (id)rbs_assertion_log___logger;
}

void __rbs_assertion_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "assertion");
  id v1 = (void *)rbs_assertion_log___logger;
  rbs_assertion_log___logger = (uint64_t)v0;
}

id rbs_best_effort_networking_log()
{
  if (rbs_best_effort_networking_log_onceToken != -1) {
    dispatch_once(&rbs_best_effort_networking_log_onceToken, &__block_literal_global_3);
  }
  return (id)rbs_best_effort_networking_log___logger;
}

void __rbs_best_effort_networking_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "best_effort_networking");
  id v1 = (void *)rbs_best_effort_networking_log___logger;
  rbs_best_effort_networking_log___logger = (uint64_t)v0;
}

id rbs_connection_log()
{
  if (rbs_connection_log_onceToken != -1) {
    dispatch_once(&rbs_connection_log_onceToken, &__block_literal_global_5);
  }
  return (id)rbs_connection_log___logger;
}

void __rbs_connection_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "connection");
  id v1 = (void *)rbs_connection_log___logger;
  rbs_connection_log___logger = (uint64_t)v0;
}

id rbs_general_log()
{
  if (rbs_general_log_onceToken != -1) {
    dispatch_once(&rbs_general_log_onceToken, &__block_literal_global_7);
  }
  return (id)rbs_general_log___logger;
}

void __rbs_general_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "general");
  id v1 = (void *)rbs_general_log___logger;
  rbs_general_log___logger = (uint64_t)v0;
}

id rbs_job_log()
{
  if (rbs_job_log_onceToken != -1) {
    dispatch_once(&rbs_job_log_onceToken, &__block_literal_global_9_0);
  }
  return (id)rbs_job_log___logger;
}

void __rbs_job_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "job");
  id v1 = (void *)rbs_job_log___logger;
  rbs_job_log___logger = (uint64_t)v0;
}

id rbs_job_oversize_log()
{
  if (rbs_job_oversize_log_onceToken != -1) {
    dispatch_once(&rbs_job_oversize_log_onceToken, &__block_literal_global_11);
  }
  return (id)rbs_job_oversize_log___logger;
}

void __rbs_job_oversize_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "job_oversize");
  id v1 = (void *)rbs_job_oversize_log___logger;
  rbs_job_oversize_log___logger = (uint64_t)v0;
}

id rbs_monitor_log()
{
  if (rbs_monitor_log_onceToken != -1) {
    dispatch_once(&rbs_monitor_log_onceToken, &__block_literal_global_13);
  }
  return (id)rbs_monitor_log___logger;
}

void __rbs_monitor_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "monitor");
  id v1 = (void *)rbs_monitor_log___logger;
  rbs_monitor_log___logger = (uint64_t)v0;
}

id rbs_power_log()
{
  if (rbs_power_log_onceToken != -1) {
    dispatch_once(&rbs_power_log_onceToken, &__block_literal_global_15);
  }
  return (id)rbs_power_log___logger;
}

void __rbs_power_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "power");
  id v1 = (void *)rbs_power_log___logger;
  rbs_power_log___logger = (uint64_t)v0;
}

id rbs_process_log()
{
  if (rbs_process_log_onceToken != -1) {
    dispatch_once(&rbs_process_log_onceToken, &__block_literal_global_17);
  }
  return (id)rbs_process_log___logger;
}

void __rbs_process_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "process");
  id v1 = (void *)rbs_process_log___logger;
  rbs_process_log___logger = (uint64_t)v0;
}

id rbs_resource_log()
{
  if (rbs_resource_log_onceToken != -1) {
    dispatch_once(&rbs_resource_log_onceToken, &__block_literal_global_19);
  }
  return (id)rbs_resource_log___logger;
}

void __rbs_resource_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "resource");
  id v1 = (void *)rbs_resource_log___logger;
  rbs_resource_log___logger = (uint64_t)v0;
}

id rbs_state_log()
{
  if (rbs_state_log_onceToken != -1) {
    dispatch_once(&rbs_state_log_onceToken, &__block_literal_global_21);
  }
  return (id)rbs_state_log___logger;
}

void __rbs_state_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "state");
  id v1 = (void *)rbs_state_log___logger;
  rbs_state_log___logger = (uint64_t)v0;
}

id rbs_system_log()
{
  if (rbs_system_log_onceToken != -1) {
    dispatch_once(&rbs_system_log_onceToken, &__block_literal_global_23);
  }
  return (id)rbs_system_log___logger;
}

void __rbs_system_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "system");
  id v1 = (void *)rbs_system_log___logger;
  rbs_system_log___logger = (uint64_t)v0;
}

id rbs_shim_log()
{
  if (rbs_shim_log_onceToken != -1) {
    dispatch_once(&rbs_shim_log_onceToken, &__block_literal_global_25);
  }
  return (id)rbs_shim_log___logger;
}

void __rbs_shim_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "shim");
  id v1 = (void *)rbs_shim_log___logger;
  rbs_shim_log___logger = (uint64_t)v0;
}

id rbs_test_log()
{
  if (rbs_test_log_onceToken != -1) {
    dispatch_once(&rbs_test_log_onceToken, &__block_literal_global_27);
  }
  return (id)rbs_test_log___logger;
}

void __rbs_test_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "test");
  id v1 = (void *)rbs_test_log___logger;
  rbs_test_log___logger = (uint64_t)v0;
}

id rbs_coder_log()
{
  if (rbs_coder_log_onceToken != -1) {
    dispatch_once(&rbs_coder_log_onceToken, &__block_literal_global_29);
  }
  return (id)rbs_coder_log___logger;
}

void __rbs_coder_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "coder");
  id v1 = (void *)rbs_coder_log___logger;
  rbs_coder_log___logger = (uint64_t)v0;
}

id rbs_adapter_log()
{
  if (rbs_adapter_log_onceToken != -1) {
    dispatch_once(&rbs_adapter_log_onceToken, &__block_literal_global_31);
  }
  return (id)rbs_adapter_log___logger;
}

void __rbs_adapter_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "adapter");
  id v1 = (void *)rbs_adapter_log___logger;
  rbs_adapter_log___logger = (uint64_t)v0;
}

id rbs_jetsam_log()
{
  if (rbs_jetsam_log_onceToken != -1) {
    dispatch_once(&rbs_jetsam_log_onceToken, &__block_literal_global_33);
  }
  return (id)rbs_jetsam_log___logger;
}

void __rbs_jetsam_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "jetsam");
  id v1 = (void *)rbs_jetsam_log___logger;
  rbs_jetsam_log___logger = (uint64_t)v0;
}

id rbs_ttl_log()
{
  if (rbs_ttl_log_onceToken != -1) {
    dispatch_once(&rbs_ttl_log_onceToken, &__block_literal_global_35);
  }
  return (id)rbs_ttl_log___logger;
}

void __rbs_ttl_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "ttl");
  id v1 = (void *)rbs_ttl_log___logger;
  rbs_ttl_log___logger = (uint64_t)v0;
}

id rbs_message_log()
{
  if (rbs_message_log_onceToken != -1) {
    dispatch_once(&rbs_message_log_onceToken, &__block_literal_global_37);
  }
  return (id)rbs_message_log___logger;
}

void __rbs_message_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "message");
  id v1 = (void *)rbs_message_log___logger;
  rbs_message_log___logger = (uint64_t)v0;
}

id rbs_sp_telemetry_log()
{
  if (rbs_sp_telemetry_log_onceToken != -1) {
    dispatch_once(&rbs_sp_telemetry_log_onceToken, &__block_literal_global_39);
  }
  return (id)rbs_sp_telemetry_log___logger;
}

void __rbs_sp_telemetry_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "sp_telemetry");
  id v1 = (void *)rbs_sp_telemetry_log___logger;
  rbs_sp_telemetry_log___logger = (uint64_t)v0;
}

id rbs_sp_assertion_log()
{
  if (rbs_sp_assertion_log_onceToken != -1) {
    dispatch_once(&rbs_sp_assertion_log_onceToken, &__block_literal_global_41);
  }
  return (id)rbs_sp_assertion_log___logger;
}

void __rbs_sp_assertion_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "sp_assertion");
  id v1 = (void *)rbs_sp_assertion_log___logger;
  rbs_sp_assertion_log___logger = (uint64_t)v0;
}

id rbs_sp_state_log()
{
  if (rbs_sp_state_log_onceToken != -1) {
    dispatch_once(&rbs_sp_state_log_onceToken, &__block_literal_global_43);
  }
  return (id)rbs_sp_state_log___logger;
}

void __rbs_sp_state_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "sp_state");
  id v1 = (void *)rbs_sp_state_log___logger;
  rbs_sp_state_log___logger = (uint64_t)v0;
}

id rbs_sp_therm_log()
{
  if (rbs_sp_therm_log_onceToken != -1) {
    dispatch_once(&rbs_sp_therm_log_onceToken, &__block_literal_global_45);
  }
  return (id)rbs_sp_therm_log___logger;
}

void __rbs_sp_therm_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runningboard", "sp_therm");
  id v1 = (void *)rbs_sp_therm_log___logger;
  rbs_sp_therm_log___logger = (uint64_t)v0;
}

void sub_185F7AA78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_185F7ADF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

CFStringRef NSStringFromRBSLegacyReason(uint64_t a1)
{
  if (a1 > 9999)
  {
    if (a1 > 49999)
    {
      if (a1 <= 50003)
      {
        if (a1 == 50000) {
          return @"FinishTaskAfterBackgroundContentFetching";
        }
        if (a1 == 50003) {
          return @"FinishTaskAfterNotificationAction";
        }
      }

      else
      {
        switch(a1)
        {
          case 50004LL:
            return @"FinishTaskAfterWatchConnectivity";
          case 60000LL:
            return @"Domain";
          case 60001LL:
            return @"Custom";
        }
      }

      return &stru_189DE1D08;
    }

    else
    {
      switch(a1)
      {
        case 10000LL:
          uint64_t result = @"Resume";
          break;
        case 10002LL:
          uint64_t result = @"TransientWakeup";
          break;
        case 10004LL:
          uint64_t result = @"FinishTaskUnbounded";
          break;
        case 10005LL:
          uint64_t result = @"Continuous";
          break;
        case 10006LL:
          uint64_t result = @"BackgroundContentFetching";
          break;
        case 10007LL:
          uint64_t result = @"NotificationAction";
          break;
        case 10008LL:
          uint64_t result = @"PIP";
          break;
        default:
          return &stru_189DE1D08;
      }
    }
  }

  else
  {
    uint64_t result = @"None";
    switch(a1)
    {
      case 0LL:
        return result;
      case 1LL:
        uint64_t result = @"MediaPlayback";
        break;
      case 2LL:
        uint64_t result = @"Location";
        break;
      case 3LL:
        uint64_t result = @"ExternalAccessory";
        break;
      case 4LL:
        uint64_t result = @"FinishTask";
        break;
      case 5LL:
        uint64_t result = @"Bluetooth";
        break;
      case 7LL:
        uint64_t result = @"BackgroundUI";
        break;
      case 8LL:
        uint64_t result = @"InterAppAudioStreaming";
        break;
      case 9LL:
        uint64_t result = @"ViewService";
        break;
      case 10LL:
        uint64_t result = @"NewsstandDownload";
        break;
      case 12LL:
        uint64_t result = @"VoIP";
        break;
      case 13LL:
        uint64_t result = @"Extension";
        break;
      case 16LL:
        uint64_t result = @"WatchConnectivity";
        break;
      case 18LL:
        uint64_t result = @"ComplicationUpdate";
        break;
      case 19LL:
        uint64_t result = @"WorkoutProcessing";
        break;
      case 20LL:
        uint64_t result = @"ComplicationPushUpdate";
        break;
      case 21LL:
        uint64_t result = @"BackgroundLocationProcessing";
        break;
      case 23LL:
        uint64_t result = @"AudioRecording";
        break;
      default:
        return &stru_189DE1D08;
    }
  }

  return result;
}

id NSStringFromRBSLegacyFlags(char a1)
{
  id v2 = objc_alloc(NSString);
  id v3 = @" AllowIdleSleep";
  id v4 = &stru_189DE1D08;
  if ((a1 & 4) == 0) {
    id v3 = &stru_189DE1D08;
  }
  id v5 = @" AllowSuspendOnSleep";
  if ((a1 & 0x10) == 0) {
    id v5 = &stru_189DE1D08;
  }
  id v6 = @" PreventTaskSuspend";
  if ((a1 & 1) == 0) {
    id v6 = &stru_189DE1D08;
  }
  uint64_t v7 = @" PreventTaskThrottleDown";
  if ((a1 & 2) == 0) {
    uint64_t v7 = &stru_189DE1D08;
  }
  id v8 = @" PreventThrottleDownUI";
  if ((a1 & 0x20) == 0) {
    id v8 = &stru_189DE1D08;
  }
  if ((a1 & 8) != 0) {
    id v4 = @" WantsForegroundResourcePriority";
  }
  return (id)[v2 initWithFormat:@"(%@%@%@%@%@%@)", v3, v5, v6, v7, v8, v4];
}

LABEL_3:
  id v6 = 0;
LABEL_11:

  return v6;
}

  id v6 = 0;
LABEL_12:

  return v6;
}

  id v6 = 0;
LABEL_12:

  return v6;
}

  id v6 = 0;
LABEL_11:

  return v6;
}

  id v6 = 0;
LABEL_11:

  return v6;
}

  id v6 = 0;
LABEL_17:

  return v6;
}

LABEL_12:
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

  if (self->_state)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2 object:self file:@"RBSAssertion.m" lineNumber:254 description:@"can only call before acquisition"];
  }

  if ((v7 & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 handleFailureInMethod:a2 object:self file:@"RBSAssertion.m" lineNumber:255 description:@"this assertion does not contain an applicable RBSDurationAttribute"];
  }

  id v12 = (void *)[v5 copy];
  warningHandler = self->_warningHandler;
  self->_warningHandler = v12;

  os_unfair_lock_unlock(&self->_lock);
}

  *(void *)&id v10 = -1LL;
  *((void *)&v10 + 1) = -1LL;
  *(_OWORD *)task_info_out = v10;
  id v19 = v10;
  task_info_outCnt = 8;
  id v11 = task_info(tn, 0xFu, task_info_out, &task_info_outCnt);
  if (v11)
  {
    id v12 = v11;
    rbs_general_log();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RBSMachPortTaskNameRight initWithPID:].cold.1(v12);
    }

    id v3 = 0LL;
    tn = 0;
  }

  else
  {
    v16[0] = *(_OWORD *)task_info_out;
    v16[1] = v19;
    +[RBSAuditToken tokenFromAuditToken:](&OBJC_CLASS___RBSAuditToken, "tokenFromAuditToken:", v16);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSMachPort portConsumingRightForPort:](&OBJC_CLASS___RBSMachPort, "portConsumingRightForPort:", tn);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSMachPortTaskNameRight _initWithPID:port:auditToken:]((uint64_t)a1, a2, v15, v14);
    id v3 = a1;
  }

uint64_t OUTLINED_FUNCTION_0_3()
{
  return NSRequestConcreteImplementation();
}

LABEL_5:
  return v6;
}

      if ((values & 8) != 0) {
        goto LABEL_6;
      }
      goto LABEL_20;
    }
  }

  [v5 setTerminationResistance:0];
  if ((values & 0x8000) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  if ((values & 2) != 0) {
    goto LABEL_5;
  }
LABEL_19:
  [v5 setTags:0];
  if ((values & 8) != 0)
  {
LABEL_6:
    if ((values & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }

    id v6 = 0LL;
LABEL_9:
    uint64_t v7 = v2;
    goto LABEL_10;
  }

  id v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
LABEL_10:

  return v6;
}

void sub_185F805E8(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v3 = objc_begin_catch(exception_object);
    }

    else
    {
      objc_begin_catch(exception_object);
      os_unfair_lock_unlock(v2);
    }

    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x185F80648LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_185F81420(_Unwind_Exception *a1)
{
}

CFStringRef NSStringFromRBSDurationStartPolicy(uint64_t a1)
{
  if (a1 > 100)
  {
    switch(a1)
    {
      case 'g':
        return @"Delayed-Fixed";
      case 'f':
        return @"Delayed-Relative";
      case 'e':
        return @"Relative";
      default:
        return @"(invalid start policy)";
    }
  }

  else
  {
    uint64_t result = @"Unspecified";
    switch(a1)
    {
      case 0LL:
        return result;
      case 1LL:
        uint64_t result = @"Fixed";
        break;
      case 2LL:
        uint64_t result = @"Proc-Start-Relative";
        break;
      case 3LL:
        uint64_t result = @"After-Originator-Exit";
        break;
      default:
        return @"(invalid start policy)";
    }
  }

  return result;
}

CFStringRef NSStringFromRBSDurationEndPolicy(unint64_t a1)
{
  if (a1 > 2) {
    return @"(invalid end policy)";
  }
  else {
    return off_189DE0CC0[a1];
  }
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __RBSDaemonDidStart(uint64_t a1, uint64_t a2)
{
}

LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
    return;
  }

  if (v3 == 1)
  {
    rbs_connection_log();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v5 = "Handshake in progress; aborting new handshake attempt";
LABEL_12:
      _os_log_impl(&dword_185F67000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
      goto LABEL_13;
    }

    goto LABEL_13;
  }

  v28 = (os_unfair_lock_s *)(a1 + 40);
  id v29 = (os_unfair_lock_s *)(a1 + 52);
  *(void *)(a1 + 144) = 1LL;
  -[RBSConnection _lock_announceLostInheritances](a1);
  [*(id *)(a1 + 104) removeAllObjects];
  [*(id *)(a1 + 80) allObjects];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 80) removeAllObjects];
  id v26 = (void *)[*(id *)(a1 + 120) copy];
  [*(id *)(a1 + 120) removeAllObjects];
  +[RBSProcessHandle clearAllHandles]();
  [MEMORY[0x189603FE0] set];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  lock = (os_unfair_lock_s *)(a1 + 44);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
  uint64_t v38 = 0u;
  v39 = 0u;
  id v36 = 0u;
  v37 = 0u;
  id v6 = *(id *)(a1 + 72);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    xpc_object_t v9 = *(void *)v37;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v11, lock);
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        id v13 = v12;
        if (v12)
        {
          [v12 descriptor];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 identifier];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = [v15 isEqual:v11];

          if (v16)
          {
            [v30 addObject:v14];
          }

          else
          {
            id v17 = (void *)[v14 copyWithIdentifier:v11];
            [v30 addObject:v17];
          }

          rbs_connection_log();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v41 = v14;
            _os_log_impl( &dword_185F67000,  v18,  OS_LOG_TYPE_INFO,  "Preparing to send handshake assertion descriptor to server %{public}@",  buf,  0xCu);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }

    while (v8);
  }

  os_unfair_lock_unlock(lock);
  id v19 = objc_alloc_init(&OBJC_CLASS___RBSHandshakeRequest);
  -[RBSHandshakeRequest setAssertionDescriptors:](v19, "setAssertionDescriptors:", v30);
  id v20 = (void *)[*(id *)(a1 + 128) copy];
  -[RBSHandshakeRequest setSavedEndowments:](v19, "setSavedEndowments:", v20);

  uint64_t v21 = *(dispatch_queue_s **)(a1 + 64);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__RBSConnection__handshake__block_invoke;
  block[3] = &unk_189DE0FF0;
  block[4] = a1;
  v32 = v19;
  id v33 = v27;
  v34 = v26;
  id v35 = sel__handshake;
  id v22 = v26;
  id v23 = v27;
  id v24 = v19;
  dispatch_async(v21, block);
  os_unfair_lock_unlock(v28);
  os_unfair_lock_unlock(v29);
}

    id v10 = 0;
    goto LABEL_15;
  }

  id v10 = 0;
  if (name && v9)
  {
    if (!-[NSString isEqualToString:](name, "isEqualToString:")) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
}

void sub_185F871CC(_Unwind_Exception *a1)
{
}

void OUTLINED_FUNCTION_0_4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3_1(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_8_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_11( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

LABEL_38:
        id v26 = 0;
        goto LABEL_39;
      }

      v28 = -[NSSet containsObject:]( self->_endowmentNamespaces,  "containsObject:",  @"com.apple.frontboard.visibility");
      uint64_t v14 = v28 ^ -[NSSet containsObject:]( v7->_endowmentNamespaces,  "containsObject:",  @"com.apple.frontboard.visibility");
    }

    else
    {
      uint64_t v14 = 1;
    }
  }

  else
  {
    uint64_t v14 = self->_taskState > 1u;
  }

LABEL_35:
  if (a4) {
    *a4 = v14;
  }
  id v26 = 1;
LABEL_39:

  return v26;
}

LABEL_39:
    v31 = *(id *)(a1 + 8);
    v32 = v12;
    if (v31)
    {
      xpc_dictionary_get_value(v31, "_endowmentNamespaces");
      id v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = !v18;
      if (!v33) {
        v34 = 1;
      }
      if ((v34 & 1) == 0) {
        xpc_dictionary_set_value(v32, "_endowmentNamespaces", v33);
      }
    }

    else
    {
      id v33 = 0LL;
    }

    if ((v8 & 2) == 0)
    {
LABEL_15:
      if ((v8 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_53;
    }

LABEL_46:
    id v35 = *(id *)(a1 + 8);
    id v36 = v12;
    if (v35)
    {
      xpc_dictionary_get_value(v35, "_tags");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = !v18;
      if (!v37) {
        uint64_t v38 = 1;
      }
      if ((v38 & 1) == 0) {
        xpc_dictionary_set_value(v36, "_tags", v37);
      }
    }

    else
    {
      v37 = 0LL;
    }

    if ((v8 & 8) == 0)
    {
LABEL_16:
      if ((v8 & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_60;
    }

        LOBYTE(v9) = 1;
        goto LABEL_47;
      }
    }

    else
    {
      id v15 = 0LL;
      id v17 = 1;
      uint64_t v18 = 1;
    }

LABEL_53:
    v39 = *(id *)(a1 + 8);
    v40 = v12;
    if (v39)
    {
      xpc_dictionary_get_value(v39, "_legacyAssertions");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      id v42 = !v18;
      if (!v41) {
        id v42 = 1;
      }
      if ((v42 & 1) == 0) {
        xpc_dictionary_set_value(v40, "_legacyAssertions", v41);
      }
    }

    else
    {
      v41 = 0LL;
    }

    if ((v8 & 0x10) == 0)
    {
LABEL_17:
      if ((v8 & 0x20) == 0)
      {
LABEL_74:
        v51 = *(void **)(a1 + 24);
        if (!v51)
        {
          id v52 = objc_alloc_init(MEMORY[0x189603FC8]);
          v53 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v52;

          v51 = *(void **)(a1 + 24);
        }

        [v51 setObject:v12 forKey:v9];
        goto LABEL_77;
      }

LABEL_67:
      uint64_t v47 = *(id *)(a1 + 8);
      v48 = v12;
      if (v47)
      {
        xpc_dictionary_get_value(v47, "_endowmentInfos");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        id v50 = !v18;
        if (!v49) {
          id v50 = 1;
        }
        if ((v50 & 1) == 0) {
          xpc_dictionary_set_value(v48, "_endowmentInfos", v49);
        }
      }

      else
      {
        v49 = 0LL;
      }

      goto LABEL_74;
    }

void sub_185F8CA08(_Unwind_Exception *a1)
{
}

CFStringRef NSStringFromRBSAcquisitionCompletionPolicy(uint64_t a1)
{
  uint64_t v1 = @"(unknown)";
  if (!a1) {
    uint64_t v1 = @"AfterValidation";
  }
  if (a1 == 1) {
    return @"AfterApplication";
  }
  else {
    return v1;
  }
}

BOOL RBSAcquisitionCompletionPolicyIsValid(unint64_t a1)
{
  return a1 < 2;
}

CFStringRef NSStringFromRBSMemoryLimitStrength(unsigned int a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_189DE10A0[(char)a1];
  }
}

BOOL RBSRealAuditTokenValid(_OWORD *a1)
{
  __int128 v1 = a1[1];
  *(_OWORD *)v3.val = *a1;
  *(_OWORD *)&v3.val[4] = v1;
  return audit_token_to_pid(&v3) != -1;
}

__n128 RBSInvalidRealAuditToken@<Q0>(__n128 *a1@<X8>)
{
  result.n128_u64[0] = -1LL;
  result.n128_u64[1] = -1LL;
  *a1 = result;
  a1[1] = result;
  return result;
}

uint64_t RBSMachPortType(mach_port_name_t name)
{
  mach_port_type_t ptype = 0;
  if (mach_port_type(*MEMORY[0x1895FBBE0], name, &ptype))
  {
    rbs_general_log();
    __int128 v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      RBSMachPortType_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }

  return ptype;
}

BOOL RBSMachPortIsType(mach_port_name_t a1, int a2)
{
  return a1 - 1 <= 0xFFFFFFFD && (RBSMachPortType(a1) & a2) != 0;
}

LABEL_7:
  return self;
}

LABEL_11:
  return v3;
}

    uint64_t v6 = 0LL;
    goto LABEL_12;
  }

  if (!v3) {
    goto LABEL_11;
  }
  objects[0] = xpc_uint64_create(a2);
  objects[1] = v4;
  uint64_t v6 = xpc_array_create(objects, 2uLL);
  for (uint64_t i = 1LL; i != -1; --i)

LABEL_12:
  return v6;
}

BOOL _RBSSandboxCanGetMachTaskName(int a1)
{
  if (getpid() == a1) {
    return 1LL;
  }
  if (_RBSSandboxCanGetMachTaskName_onceToken != -1) {
    dispatch_once(&_RBSSandboxCanGetMachTaskName_onceToken, &__block_literal_global_9);
  }
  return _RBSSandboxCanGetMachTaskName_allowed != 0;
}

void OUTLINED_FUNCTION_2_2( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_72:
  return v6;
}

LABEL_30:
  return v6;
}

id _RBSEndowmentWrapType(void *a1, uint64_t a2)
{
  objects[2] = *(xpc_object_t *)MEMORY[0x1895F89C0];
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2 - 4 >= 3)
  {
    if (a2 - 2 < 2)
    {
      xpc_object_t v5 = v3;
LABEL_10:
      xpc_object_t v6 = v5;
      goto LABEL_12;
    }

    if (a2 == 1)
    {
      xpc_object_t v5 = xpc_null_create();
      goto LABEL_10;
    }

id _RBSEndowmentUnwrapTypeAndDecodeWithBlock(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  if (v3)
  {
    uint64_t v5 = MEMORY[0x186E30AB4](v3);
    if (v5 == MEMORY[0x1895F92A8])
    {
      id v9 = v3;
      uint64_t v8 = 1LL;
    }

    else if (v5 == MEMORY[0x1895F92F8])
    {
      id v9 = v3;
      uint64_t v8 = 2LL;
    }

    else if (v5 == MEMORY[0x1895F9260])
    {
      id v9 = v3;
      uint64_t v8 = 3LL;
    }

    else
    {
      if (v5 != MEMORY[0x1895F9220] || xpc_array_get_count(v3) != 2)
      {
        id v9 = 0LL;
        id v10 = 0LL;
LABEL_20:

        goto LABEL_21;
      }

      xpc_array_get_value(v3, 0LL);
      xpc_object_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (MEMORY[0x186E30AB4]() == MEMORY[0x1895F92F0] && (uint64_t value = xpc_uint64_get_value(v6), value - 4 <= 2))
      {
        uint64_t v8 = value;
        xpc_array_get_value(v3, 1uLL);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v8 = 0LL;
        id v9 = 0LL;
      }
    }

    id v10 = 0LL;
    if (v8 && v9)
    {
      v4[2](v4, v8, v9);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_20;
  }

  id v10 = 0LL;
LABEL_21:

  return v10;
}

id RBSEndowmentEncode(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v2 = 0LL;
    uint64_t v3 = 1LL;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(void *)uuid = 0LL;
      uint64_t v15 = 0LL;
      [v1 getUUIDBytes:uuid];
      id v2 = xpc_uuid_create(uuid);
      uint64_t v3 = 2LL;
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [v1 _endpoint];
        id v2 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v3 = 3LL;
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v2 = (id)_CFXPCCreateXPCObjectFromCFObject();
          uint64_t v3 = 4LL;
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            xpc_object_t v6 = xpc_array_create(0LL, 0LL);
            v12[0] = MEMORY[0x1895F87A8];
            v12[1] = 3221225472LL;
            v12[2] = __RBSEndowmentEncode_block_invoke;
            v12[3] = &unk_189DE1108;
            id v2 = v6;
            id v13 = v2;
            [v1 enumerateObjectsUsingBlock:v12];
            size_t count = xpc_array_get_count(v2);
            if (count != [v1 count])
            {

              id v2 = 0LL;
            }

            uint64_t v3 = 5LL;
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
              v10[0] = MEMORY[0x1895F87A8];
              v10[1] = 3221225472LL;
              v10[2] = __RBSEndowmentEncode_block_invoke_2;
              v10[3] = &unk_189DE1130;
              id v2 = v8;
              id v11 = v2;
              [v1 enumerateKeysAndObjectsUsingBlock:v10];
              size_t v9 = xpc_dictionary_get_count(v2);
              if (v9 != [v1 count])
              {

                id v2 = 0LL;
              }

              uint64_t v3 = 6LL;
            }

            else
            {
              uint64_t v3 = 0LL;
              id v2 = 0LL;
            }
          }
        }
      }
    }
  }

  _RBSEndowmentWrapType(v2, v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __RBSEndowmentEncode_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  xpc_object_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v7 = v6;
    xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v6);
    xpc_object_t v6 = v7;
  }

  else
  {
    *a4 = 1;
  }
}

void __RBSEndowmentEncode_block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v9 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    RBSEndowmentEncode(v7);
    xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      xpc_dictionary_set_value( *(xpc_object_t *)(a1 + 32), (const char *)[v9 UTF8String], v8);
    }
    else {
      *a4 = 1;
    }
  }
}

id RBSEndowmentDecode(void *a1)
{
  return _RBSEndowmentUnwrapTypeAndDecodeWithBlock(a1, &__block_literal_global_10);
}

id __RBSEndowmentDecode_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  switch(a2)
  {
    case 1LL:
      uint64_t v6 = [MEMORY[0x189603FE8] null];
      goto LABEL_6;
    case 2LL:
      uint64_t v6 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:xpc_uuid_get_bytes(v4)];
      goto LABEL_6;
    case 3LL:
      id v7 = objc_alloc_init(MEMORY[0x189607B58]);
      [v7 _setEndpoint:v5];
      break;
    case 4LL:
      uint64_t v6 = _CFXPCCreateCFObjectFromXPCObject();
LABEL_6:
      id v7 = (id)v6;
      break;
    case 5LL:
      size_t count = xpc_array_get_count(v4);
      [MEMORY[0x189603FA8] arrayWithCapacity:count];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      applier[0] = MEMORY[0x1895F87A8];
      applier[1] = 3221225472LL;
      applier[2] = __RBSEndowmentDecode_block_invoke_2;
      applier[3] = &unk_189DE1198;
      id v10 = v9;
      id v21 = v10;
      xpc_array_apply(v5, applier);
      if (count == [v10 count]) {
        id v7 = (id)[v10 copy];
      }
      else {
        id v7 = 0LL;
      }
      id v13 = v21;
      goto LABEL_16;
    case 6LL:
      size_t v11 = xpc_dictionary_get_count(v4);
      [MEMORY[0x189603FC8] dictionaryWithCapacity:v11];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v16 = 3221225472LL;
      id v17 = __RBSEndowmentDecode_block_invoke_3;
      uint64_t v18 = &unk_189DE11C0;
      id v10 = v12;
      id v19 = v10;
      xpc_dictionary_apply(v5, &v15);
      if (v11 == objc_msgSend(v10, "count", v15, v16, v17, v18)) {
        id v7 = (id)[v10 copy];
      }
      else {
        id v7 = 0LL;
      }
      id v13 = v19;
LABEL_16:

      break;
    default:
      id v7 = 0LL;
      break;
  }

  return v7;
}

BOOL __RBSEndowmentDecode_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }

  return v4 != 0LL;
}

BOOL __RBSEndowmentDecode_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    [NSString stringWithUTF8String:a2];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v5 forKey:v7];
  }

  return v5 != 0LL;
}

LABEL_28:
    if (v17 && (v18 & 1) != 0) {
      goto LABEL_30;
    }
    goto LABEL_34;
  }

LABEL_49:
  return v9;
}

void ___personalPersonaString_block_invoke()
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (objc_opt_class())
  {
    [MEMORY[0x189612BD0] personaAttributesForPersonaType:0];
    os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = [v0 userPersonaUniqueString];
  }

  else
  {
    uint64_t v1 = 0LL;
  }

  id v2 = (void *)_personalPersonaString_personalPersonaString;
  _personalPersonaString_personalPersonaString = v1;

  if (_personalPersonaString_personalPersonaString)
  {
    uid_t v3 = 0x7FFFFFFF;
  }

  else
  {
    uint64_t v28 = 0LL;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v23 = 0u;
    __int128 v22 = 0u;
    __int128 v21 = 0u;
    __int128 v20 = 0u;
    __int128 v19 = 0u;
    __int128 v18 = 0u;
    __int128 v17 = 0u;
    __int128 v16 = 0u;
    __int128 v15 = 0u;
    __int128 v14 = 0u;
    __int128 v13 = 0u;
    memset(&__count[4], 0, 96);
    *(_DWORD *)__size_t count = 2;
    else {
      uid_t v3 = HIDWORD(v28);
    }
    id v4 = calloc(4uLL, 4uLL);
    *(void *)__size_t count = 4LL;
    if ((kpersona_find_by_type() & 0x80000000) != 0)
    {
      rbs_general_log();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *__error();
        *(_DWORD *)buf = 67109120;
        int v30 = v7;
        _os_log_impl( &dword_185F67000,  v6,  OS_LOG_TYPE_DEFAULT,  "RBSProcessIdentity: kpersona_find_by_type() failed: %d",  buf,  8u);
      }

LABEL_14:
      uint64_t v8 = 0LL;
    }

    else
    {
      uint64_t v5 = *(void *)__count;
      uint64_t v11 = 0LL;
      while (1)
      {
        uint64_t v28 = 0LL;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        __int128 v13 = 0u;
        memset(&__count[4], 0, 96);
        *(_DWORD *)__size_t count = 2;
        if (!__PAIR64__(v3, kpersona_info())) {
          break;
        }
        if (v5 == ++v11) {
          goto LABEL_14;
        }
      }

      uint64_t v8 = objc_msgSend( NSString,  "stringWithUTF8String:",  &__count[88],  *(void *)__count,  *(_OWORD *)&__count[8],  *(_OWORD *)&__count[24],  *(_OWORD *)&__count[40],  *(_OWORD *)&__count[56],  *(_OWORD *)&__count[72]);
    }

    free(v4);
    id v9 = (void *)_personalPersonaString_personalPersonaString;
    _personalPersonaString_personalPersonaString = v8;
  }

  rbs_general_log();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__size_t count = 67109378;
    *(_DWORD *)&__count[4] = v3;
    *(_WORD *)&__count[8] = 2114;
    *(void *)&__count[10] = _personalPersonaString_personalPersonaString;
    _os_log_impl( &dword_185F67000,  v10,  OS_LOG_TYPE_DEFAULT,  "RBSProcessIdentity calculated session %u, persona %{public}@ for persona matching for this process",  __count,  0x12u);
  }
}

void OUTLINED_FUNCTION_0_6( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

BOOL RBSTaskStateIsRunning(int a1)
{
  return a1 == 4 || (a1 & 0xFE) == 2;
}

CFStringRef NSStringFromRBSTaskState(unsigned int a1)
{
  if (a1 > 4) {
    return @"(unknown)";
  }
  else {
    return off_189DE1208[(char)a1];
  }
}

BOOL RBSDebugStateIsDebugging(char a1)
{
  return (a1 & 0xFE) == 2;
}

CFStringRef NSStringFromRBSDebugState(unsigned int a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_189DE1230[(char)a1];
  }
}

CFStringRef NSStringFromRBSRole(unsigned int a1)
{
  if (a1 > 7) {
    return @"(undefined)";
  }
  else {
    return off_189DE1250[(char)a1];
  }
}

CFStringRef NSStringFromRBSGPURole(unsigned int a1)
{
  if (a1 > 4) {
    return @"(undefined)";
  }
  else {
    return off_189DE1290[(char)a1];
  }
}

uint64_t RBSDarwinRoleFromRBSRole(unsigned int a1)
{
  if (a1 > 7) {
    return 3LL;
  }
  else {
    return dword_185FA9178[(char)a1];
  }
}

unint64_t RBSRoleFromDarwinRole(unsigned int a1)
{
  unint64_t v1 = 0x2030504040704uLL >> (8 * a1);
  if (a1 >= 7) {
    LOBYTE(v1) = 4;
  }
  return v1 & 7;
}

CFStringRef NSStringFromRBSTerminationResistance(int a1)
{
  if (a1 > 29)
  {
    switch(a1)
    {
      case 30:
        return @"NonInteractive";
      case 40:
        return @"Interactive";
      case 50:
        return @"Absolute";
    }
  }

  else
  {
    switch(a1)
    {
      case 0:
        return @"(unknown)";
      case 10:
        return @"NotRunning";
      case 20:
        return @"None";
    }
  }

  return @"(undefined)";
}

BOOL RBSPreventLaunchStateIsPrevented(int a1)
{
  return a1 == 2;
}

CFStringRef NSStringFromRBSPreventLaunchState(unsigned int a1)
{
  if (a1 > 2) {
    return @"(undefined)";
  }
  else {
    return off_189DE12B8[(char)a1];
  }
}

LABEL_9:
  return v16 != 0LL;
}

id RBSServiceInitialize(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __RBSServiceInitialize_block_invoke;
  block[3] = &unk_189DE0C68;
  id v7 = v1;
  uint64_t v2 = RBSServiceInitialize_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&RBSServiceInitialize_onceToken, block);
  }
  id v4 = (id)RBSServiceInitialize___sharedInstance;

  return v4;
}

void __RBSServiceInitialize_block_invoke(uint64_t a1)
{
  uint64_t v2 = -[RBSService _init](objc_alloc(&OBJC_CLASS___RBSService));
  id v3 = (void *)RBSServiceInitialize___sharedInstance;
  RBSServiceInitialize___sharedInstance = (uint64_t)v2;

  objc_storeStrong((id *)(RBSServiceInitialize___sharedInstance + 8), *(id *)(a1 + 32));
  -[RBSConnection registerServiceDelegate:]( *(void *)(RBSServiceInitialize___sharedInstance + 32),  (void *)RBSServiceInitialize___sharedInstance);
}

void RBSCaptureStateToFile(void *a1)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  rbs_general_log();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v39 = a1;
    _os_log_impl(&dword_185F67000, v2, OS_LOG_TYPE_DEFAULT, "RunningBoard capturing state to file %s", buf, 0xCu);
  }

  [MEMORY[0x1896078A8] defaultManager];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:a1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringByDeletingLastPathComponent];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v3 fileExistsAtPath:v5])
  {
    id v6 = 0LL;
    unsigned int v7 = 0;
    do
    {
      uint64_t v8 = v6;
      +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v37 = 0LL;
      [v9 captureStateForSubsystem:0 error:&v37];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      id v6 = v37;

      if (v10) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = v7 >= 2;
      }
      ++v7;
    }

    while (!v11);
    if (v10)
    {
      [NSString stringWithUTF8String:a1];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v36 = v6;
      [v10 writeToFile:v12 atomically:0 encoding:4 error:&v36];
      id v13 = v36;

      if (v13)
      {
        uint64_t v14 = [v13 code];
        rbs_general_log();
        __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        __int128 v16 = v15;
        if (v14 == 28)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v39 = v13;
            _os_log_impl( &dword_185F67000,  v16,  OS_LOG_TYPE_DEFAULT,  "RBSCaptureStateToFile writeToFile failed with expected error %{public}@",  buf,  0xCu);
          }
        }

        else if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          RBSCaptureStateToFile_cold_3((uint64_t)v13, v16, v30, v31, v32, v33, v34, v35);
        }

        id v6 = v13;
      }

      else
      {
        rbs_general_log();
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v39 = a1;
          _os_log_impl( &dword_185F67000,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "RunningBoard successfully captured state to file %s",  buf,  0xCu);
        }
      }
    }

    else
    {
      if (!v6) {
        RBSCaptureStateToFile_cold_1();
      }
      rbs_general_log();
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        RBSCaptureStateToFile_cold_2((uint64_t)v6, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }

  else
  {
    rbs_general_log();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT)) {
      RBSCaptureStateToFile_cold_4((uint64_t)v5, (os_log_s *)v10, v17, v18, v19, v20, v21, v22);
    }
  }
}

void sub_185F9B6C4(_Unwind_Exception *a1)
{
}

void OUTLINED_FUNCTION_4_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_20:
  [v5 setLegacyAssertions:0];
  if ((values & 0x10) != 0)
  {
LABEL_7:
    if ((values & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }

LABEL_21:
  [v5 setPrimitiveAssertions:0];
  if ((values & 0x20) == 0)
  {
LABEL_26:
    [v5 setEndowmentInfos:0];
    goto LABEL_27;
  }

LABEL_22:
  if (!-[NSSet count](self->_endowmentNamespaces, "count")) {
    goto LABEL_26;
  }
  [v5 endowmentInfos];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11) {
    goto LABEL_26;
  }
  id v12 = (void *)-[NSSet mutableCopy](self->_endowmentNamespaces, "mutableCopy");
  uint64_t v22 = 0LL;
  __int128 v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy__2;
  uint64_t v26 = __Block_byref_object_dispose__2;
  [MEMORY[0x189603FE0] set];
  uint64_t v27 = (id)objc_claimAutoreleasedReturnValue();
  [v5 endowmentInfos];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = MEMORY[0x1895F87A8];
  uint64_t v17 = 3221225472LL;
  uint64_t v18 = __41__RBSProcessStateDescriptor_filterState___block_invoke;
  uint64_t v19 = &unk_189DE1328;
  uint64_t v14 = v12;
  uint64_t v20 = v14;
  uint64_t v21 = &v22;
  [v13 enumerateObjectsUsingBlock:&v16];

  if (objc_msgSend((id)v23[5], "count", v16, v17, v18, v19)) {
    __int128 v15 = v23[5];
  }
  else {
    __int128 v15 = 0LL;
  }
  [v5 setEndowmentInfos:v15];

  _Block_object_dispose(&v22, 8);
LABEL_27:
}

void sub_185F9C9F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id RBSXPCPackObject(void *a1)
{
  id v1 = a1;
  xpc_object_t values = v1;
  if (!v1) {
    goto LABEL_8;
  }
  uint64_t v2 = _RBSIsXPCObject_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&_RBSIsXPCObject_onceToken, &__block_literal_global_12);
  }
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    xpc_object_t v7 = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject();
    if (v7)
    {
      xpc_object_t v5 = xpc_dictionary_create((const char *const *)&RBSEncodedCFTypeKey, &v7, 1uLL);

      goto LABEL_9;
    }

LABEL_8:
    xpc_object_t v5 = 0LL;
    goto LABEL_9;
  }

  xpc_object_t v5 = xpc_dictionary_create((const char *const *)RBSEncodedXPCTypeKey, &values, 1uLL);
LABEL_9:

  return v5;
}

id RBSXPCUnpackObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1) {
    goto LABEL_5;
  }
  uint64_t v3 = MEMORY[0x186E30AB4](v1);
  uint64_t v4 = MEMORY[0x1895F9250];
  if (v3 != MEMORY[0x1895F9250])
  {

    goto LABEL_4;
  }

  xpc_dictionary_get_value(v2, "@");
  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_4:
    id v5 = v2;
    if (MEMORY[0x186E30AB4]() == v4)
    {
      xpc_dictionary_get_value(v5, "*");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }

BOOL RBSXPCEqualDates(void *a1, void *a2)
{
  id v3 = a2;
  [a1 timeIntervalSinceReferenceDate];
  double v5 = v4;
  [v3 timeIntervalSinceReferenceDate];
  double v7 = v6;

  return vabdd_f64(v5, v7) < 0.00001;
}

__CFString *nsObjFromXPCObj(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (const _xpc_type_s *)MEMORY[0x186E30AB4]();
  id v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607940]), "initWithFormat:", @"(%s)", xpc_type_get_name(v2));
  if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9228])
  {
    if (v1 == (id)MEMORY[0x1895F9178]) {
      double v6 = @"true";
    }
    else {
      double v6 = @"false";
    }
    double v7 = v6;
    goto LABEL_27;
  }

  if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9280])
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x189607968]) initWithLongLong:xpc_int64_get_value(v1)];
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F92F0])
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x189607968]) initWithUnsignedLongLong:xpc_uint64_get_value(v1)];
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9258])
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x189607968]) initWithDouble:xpc_double_get_value(v1)];
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9248])
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x189603F50]) initWithTimeIntervalSince1970:(double)xpc_date_get_value(v1) / 1000000000.0];
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9240])
  {
    id v8 = objc_alloc(MEMORY[0x189603F48]);
    bytes_ptr = xpc_data_get_bytes_ptr(v1);
    uint64_t v5 = [v8 initWithBytes:bytes_ptr length:xpc_data_get_length(v1)];
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F92E8])
  {
    uint64_t v5 = [objc_alloc(NSString) initWithCString:xpc_string_get_string_ptr(v1) encoding:4];
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F92F8])
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:xpc_uuid_get_bytes(v1)];
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9250])
  {
    uint64_t v5 = dictFromXPCDict(v1);
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9220])
  {
    uint64_t v5 = arrayFromXPCArray(v1);
  }

  else
  {
    if (v2 != (const _xpc_type_s *)MEMORY[0x1895F9268])
    {
LABEL_30:
      double v7 = v3;
      goto LABEL_31;
    }

    id v4 = objc_alloc(NSString);
    uint64_t v5 = objc_msgSend( v4,  "initWithFormat:",  @"%s",  xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x1895F91B0]));
  }

  double v7 = (__CFString *)v5;
  if (!v5) {
    goto LABEL_30;
  }
LABEL_27:
  if (v2 != (const _xpc_type_s *)MEMORY[0x1895F9250] && v2 != (const _xpc_type_s *)MEMORY[0x1895F9220])
  {
    uint64_t v10 = [objc_alloc(NSString) initWithFormat:@"%@: %@", v3, v7];

    double v7 = (__CFString *)v10;
  }

LABEL_31:
  return v7;
}

id dictFromXPCDict(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_opt_new();
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 3221225472LL;
  applier[2] = __dictFromXPCDict_block_invoke;
  applier[3] = &unk_189DE11C0;
  id v3 = v2;
  id v6 = v3;
  xpc_dictionary_apply(v1, applier);

  return v3;
}

id arrayFromXPCArray(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_opt_new();
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 3221225472LL;
  applier[2] = __arrayFromXPCArray_block_invoke;
  applier[3] = &unk_189DE1198;
  id v3 = v2;
  id v6 = v3;
  xpc_array_apply(v1, applier);

  return v3;
}

uint64_t __dictFromXPCDict_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = *(void **)(a1 + 32);
  [NSString stringWithUTF8String:a2];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v5 forKeyedSubscript:v7];

  return 1LL;
}

uint64_t __arrayFromXPCArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a2];

  return 1LL;
}

id _service()
{
  if (_service_onceToken != -1) {
    dispatch_once(&_service_onceToken, &__block_literal_global_14);
  }
  return (id)__service;
}

void ___service_block_invoke()
{
  if (!__service)
  {
    uint64_t v0 = +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
    id v1 = (void *)__service;
    __service = v0;
  }

id rbs_set_assertion_adapter_service(void *a1)
{
  id v1 = a1;
  id v2 = (id)__service;
  id v3 = (void *)__service;
  __service = (uint64_t)v1;
  id v4 = v1;

  return v2;
}

id _assertionMap()
{
  if (_assertionMap_onceToken != -1) {
    dispatch_once(&_assertionMap_onceToken, &__block_literal_global_1_0);
  }
  return (id)_assertionMap_map;
}

void ___assertionMap_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v1 = (void *)_assertionMap_map;
  _assertionMap_map = (uint64_t)v0;
}

id rbs_assertion_adapter_assertion_for_id(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithLongLong:a1];
  [v2 objectForKey:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

  return v4;
}

uint64_t rbs_assertion_adapter_assertion_count()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 count];
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

  return v1;
}

id _lock_nextID()
{
  id v0 = objc_alloc(MEMORY[0x189607968]);
  return (id)[v0 initWithLongLong:_lock_nextID_counter];
}

uint64_t rbs_acquire_domain_assertion(uint64_t a1, uint64_t a2, int a3)
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = a2;
  return rbs_acquire_domain_assertion_list(a1, (uint64_t)v4, 1, a3);
}

uint64_t rbs_acquire_domain_assertion_list(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a4 < 1) {
    return 0LL;
  }
  uint64_t v30 = [NSString stringWithUTF8String:a1];
  [MEMORY[0x189603FA8] array];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s:", a1);
  +[RBSAcquisitionCompletionAttribute attributeWithCompletionPolicy:]( &OBJC_CLASS___RBSAcquisitionCompletionAttribute,  "attributeWithCompletionPolicy:",  1LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v7;
  [v7 addObject:v9];

  if (a3 < 1)
  {
    __int128 v16 = v8;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 8LL * a3;
    do
    {
      [NSString stringWithUTF8String:*(void *)(a2 + v11)];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  v30,  v13);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 addObject:v14];

      if (v11) {
        __int128 v15 = @",%@";
      }
      else {
        __int128 v15 = @"%@";
      }
      objc_msgSend(v8, "stringByAppendingFormat:", v15, v13);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

      v11 += 8LL;
      id v8 = v16;
    }

    while (v12 != v11);
  }

  [v16 stringByAppendingString:@"}"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[RBSTarget targetWithPid:](&OBJC_CLASS___RBSTarget, "targetWithPid:", a4);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = objc_alloc(&OBJC_CLASS___RBSAssertion);
  +[RBSAssertionDescriptor descriptorWithIdentifier:target:explanation:attributes:]( &OBJC_CLASS___RBSAssertionDescriptor,  "descriptorWithIdentifier:target:explanation:attributes:",  0LL,  v19,  v18,  v7);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = _service();
  id v23 = -[RBSAssertion _initWithDescriptor:service:](v20, "_initWithDescriptor:service:", v21, v22);

  id v31 = 0LL;
  LOBYTE(v22) = [v23 acquireWithError:&v31];
  id v24 = v31;
  if ((v22 & 1) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    _assertionMap();
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    _lock_nextID();
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 setObject:v23 forKey:v26];
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
    uint64_t v27 = (void *)v30;
  }

  else
  {
    rbs_assertion_log();
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = (void *)v30;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
      rbs_acquire_domain_assertion_list_cold_1((uint64_t)v18, (uint64_t)v24, (os_log_t)v25);
    }
    uint64_t v26 = &unk_189DF46F8;
  }

  uint64_t v17 = [v26 longLongValue];
  return v17;
}

void rbs_invalidate_domain_assertion(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithLongLong:a1];
  [v2 objectForKey:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [v2 removeObjectForKey:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
    [v4 invalidate];
  }

  else
  {
    rbs_assertion_log();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      rbs_invalidate_domain_assertion_cold_1(a1, v5);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }
}

void sub_185F9FAB8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_185FA038C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_185FA04E8(_Unwind_Exception *a1)
{
}

void RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey_cold_1( objc_class *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  NSStringFromClass(a1);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 136315650;
  double v7 = "RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey";
  __int16 v8 = 2114;
  id v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = a2;
  _os_log_error_impl( &dword_185F67000,  a3,  OS_LOG_TYPE_ERROR,  "%s the encoded object for class %{public}@ failed to decode with error %{public}@",  (uint8_t *)&v6,  0x20u);
}

void RBSAtomicGetFlag_cold_1()
{
  __assert_rtn("RBSAtomicGetFlag", "RBSUtilities.m", 29, "value && (sizeof(int32_t) == sizeof(*value))");
}

void RBSAtomicSetFlag_cold_1()
{
  __assert_rtn("RBSAtomicSetFlag", "RBSUtilities.m", 36, "value && (sizeof(int32_t) == sizeof(*value))");
}

void _RBShortBSDProcessInfoForPID_cold_1(int a1, os_log_s *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = __error();
  uint64_t v5 = strerror(*v4);
  v6[0] = 67109378;
  v6[1] = a1;
  __int16 v7 = 2082;
  __int16 v8 = v5;
  _os_log_error_impl( &dword_185F67000,  a2,  OS_LOG_TYPE_ERROR,  "Unable to get short BSD proc info for %d: %{public}s",  (uint8_t *)v6,  0x12u);
  OUTLINED_FUNCTION_0_1();
}

void RBSExecutablePathForPID_cold_1(int a1)
{
}

void RBSExecutablePathForPID_cold_2()
{
}

void RBSAuditTokenRepresentsPlatformBinary_cold_1(_OWORD *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  __int128 v3 = a1[1];
  *(_OWORD *)v6.val = *a1;
  *(_OWORD *)&v6.val[4] = v3;
  pid_t v4 = audit_token_to_pid(&v6);
  v6.val[0] = 67109120;
  v6.val[1] = v4;
  OUTLINED_FUNCTION_2_0(&dword_185F67000, a2, v5, "SecTaskCreateWithAuditToken failed for %d", (uint8_t *)&v6);
}

void RBSIsBinaryCatalystOriOS_cold_1(int a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_2_0(&dword_185F67000, a2, a3, "Error getting platform info for pid %d", (uint8_t *)v3);
}

void RBSContainedExtensionBundleIDs_cold_1(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_185F67000, a4, OS_LOG_TYPE_DEBUG, "Adding %@ to terminate predicate", a1, 0xCu);
}

void _RBSXPCEncodeObjectForKey_cold_1()
{
  OUTLINED_FUNCTION_3_0();
}

void _BSXPCDecodeObjectFromContext_cold_1()
{
  OUTLINED_FUNCTION_3_0();
}

void _BSXPCDecodeObjectFromContext_cold_2()
{
  uint64_t v2 = (void *)v1;
  OUTLINED_FUNCTION_0_2(v1, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_1_1( &dword_185F67000,  "Decoded object class %{public}@ does not match expected class %{public}@",  v5,  v6);

  OUTLINED_FUNCTION_3_0();
}

void _BSXPCDecodeObjectFromContext_cold_4(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_0( &dword_185F67000,  a3,  (uint64_t)a3,  "Attempted to decode a collection (%{public}@) without specifying the class it contains",  (uint8_t *)a2);

  OUTLINED_FUNCTION_3_0();
}

void _BSXPCDecodeObjectFromContext_cold_5()
{
}

void _BSXPCDecodeObjectFromContext_cold_6()
{
}

void _BSXPCDecodeObjectFromContext_cold_7()
{
}

void _BSXPCDecodeObjectFromContext_cold_8(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_4_0( &dword_185F67000,  a2,  a3,  "Unable to create NSKeyedUnarchiver for data: %{public}@",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void _BSXPCDecodeObjectFromContext_cold_9(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(*(void *)a1 + 40LL);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_4_0(&dword_185F67000, a2, a3, "Unable to decode dictionary key %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_0();
}

void _BSXPCDecodeObjectFromContext_cold_10()
{
}

void _BSXPCDecodeObjectFromContext_cold_11()
{
  OUTLINED_FUNCTION_3_0();
}

void _BSXPCDecodeObjectFromContext_cold_12()
{
  OUTLINED_FUNCTION_3_0();
}

void _BSXPCDecodeObjectFromContext_cold_13(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_0( &dword_185F67000,  a3,  (uint64_t)a3,  "No valid encoding type could be determined for expected class: %{public}@",  (uint8_t *)a2);

  OUTLINED_FUNCTION_3_0();
}

void RBSMachPortType_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RBSCaptureStateToFile_cold_1()
{
}

void RBSCaptureStateToFile_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RBSCaptureStateToFile_cold_3( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RBSCaptureStateToFile_cold_4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void rbs_acquire_domain_assertion_list_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_185F67000,  log,  OS_LOG_TYPE_ERROR,  "Failed to acquire domain assertion %{public}@ with error %{public}@",  (uint8_t *)&v3,  0x16u);
}

void rbs_invalidate_domain_assertion_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_185F67000,  a2,  OS_LOG_TYPE_FAULT,  "Unknown rbs_domain_assertion_id_t %llu, can not invalidate",  (uint8_t *)&v2,  0xCu);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1896028D0](bundle);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

void CFNotificationCenterAddObserver( CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E50]();
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x189603270](theSet);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x189603488](alloc, buffer);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1896076C8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1896076E0](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1896076F0](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x189607718](aSelector);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x18960B668](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x18960B670](task);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x189604170]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x189604880]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1896048A8]();
}

uint64_t _NSIsNSOrderedSet()
{
  return MEMORY[0x1896048C0]();
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1896048C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void _os_activity_initiate( void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

void abort(void)
{
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1895F9318]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895F94C0]();
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return MEMORY[0x1896140D8](atoken);
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x1896140E8](atoken);
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return MEMORY[0x1896140F0](atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return MEMORY[0x1896140F8](atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x189614100](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x189614108](atoken);
}

gid_t audit_token_to_rgid(audit_token_t *atoken)
{
  return MEMORY[0x189614110](atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return MEMORY[0x189614118](atoken);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class( dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1895FAE30]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1895FAF08](label);
}

void dispatch_workloop_set_autorelease_frequency( dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1895FB670](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

uint64_t kpersona_find_by_type()
{
  return MEMORY[0x1895FB8F8]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x1895FB908]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right( ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1895FBB70](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1895FBBA8](*(void *)&task, *(void *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1895FC668]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8E0](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8E8](*(void *)&pid, buffer, *(void *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1895FCBB8]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1895FD338](*(void *)&target_tport, *(void *)&pid, tn);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD860](xarray, index);
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x1895FD8D0]();
}

uint64_t xpc_bundle_get_error()
{
  return MEMORY[0x1895FD8E0]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x1895FD8F0]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1895FD978]();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDA70](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1895FDB10](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1895FDB58](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FDBA0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1895FDBC0]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1895FDBF8](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1895FDC58](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1895FDC70]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return result;
}

uint64_t xpc_endpoint_create_bs_from_port()
{
  return MEMORY[0x1895FDD78]();
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1895FDD88](object1, object2);
}

uint64_t xpc_get_class4NSXPC()
{
  return MEMORY[0x1895FDE68]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x1895FDE88](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1895FDEC8](xint);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x1895FDF10]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1895FDF18]();
}

uint64_t xpc_mach_send_create_with_disposition()
{
  return MEMORY[0x1895FDF20]();
}

uint64_t xpc_mach_send_get_right()
{
  return MEMORY[0x1895FDF28]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1895FDF48]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1895FE0C0](type);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1895FE0D0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1895FE0F8](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1895FE110](xuuid);
}

uint64_t objc_msgSend__initWithBundleID_personaString_persistentJobLabel_platform_bundleInode_execInode_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__initWithBundleID_personaString_persistentJobLabel_platform_bundleInode_execInode_);
}

uint64_t objc_msgSend__initWithNamespace_environment_encodedEndowment_originatingIdentifier_attributePath_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initWithNamespace_environment_encodedEndowment_originatingIdentifier_attributePath_);
}

uint64_t objc_msgSend_endowmentLinkForNamespace_sourceEnvironment_sourcePid_targetEnvironment_targetPid_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_endowmentLinkForNamespace_sourceEnvironment_sourcePid_targetEnvironment_targetPid_);
}

uint64_t objc_msgSend_externalExtensionIdentityForExtensionKitIdentifier_hostIdentifier_UUID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_externalExtensionIdentityForExtensionKitIdentifier_hostIdentifier_UUID_);
}

uint64_t objc_msgSend_identityForXPCServiceIdentifier_hostInstance_UUID_persona_validationToken_variant_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_identityForXPCServiceIdentifier_hostInstance_UUID_persona_validationToken_variant_);
}

uint64_t objc_msgSend_infoWithBundleID_personaString_persistentJobLabel_platform_bundleInode_execInode_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_infoWithBundleID_personaString_persistentJobLabel_platform_bundleInode_execInode_);
}