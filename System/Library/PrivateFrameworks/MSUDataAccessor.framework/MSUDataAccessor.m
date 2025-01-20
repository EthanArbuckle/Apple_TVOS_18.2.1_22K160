}

id MSUDASharedLogger()
{
  predicate = (dispatch_once_t *)&MSUDASharedLogger_pred;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &__block_literal_global_43);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)MSUDASharedLogger___instance;
}

void __MSUDASharedLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MSUDataAccessor", "MSUDataAccessor");
  v1 = (void *)MSUDASharedLogger___instance;
  MSUDASharedLogger___instance = (uint64_t)v0;
}

_BYTE *__os_log_helper_16_0_0(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_0_1_4_0(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

void sub_186205B24()
{
}

void __destructor_8_s8_s16(uint64_t a1)
{
}

void __copy_helper_block_e8_32s(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 32);
  v3 = (id *)(a1 + 32);
  id *v3 = 0LL;
  objc_storeStrong(v3, v2);
}

void __destroy_helper_block_e8_32s(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

LABEL_7:
    __strlcpy_chk();
    goto LABEL_11;
  }

  if (v6 == 2) {
    goto LABEL_7;
  }
  if (v8)
  {
    v3 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:0];
    *v8 = v3;
  }

  v11 = 0LL;
  return v11;
}

uint64_t lookupPathForPersonalizedData(unsigned int a1, uint64_t a2, uint64_t a3)
{
  unsigned int v13 = a1;
  uint64_t v12 = a2;
  uint64_t v11 = a3;
  id v10 = 0LL;
  id v9 = 0LL;
  if (a2)
  {
    id v6 = +[MSUDataAccessor sharedDataAccessor](&OBJC_CLASS___MSUDataAccessor, "sharedDataAccessor");
    id obj = v9;
    v5 = (void *)[v6 copyPathForPersonalizedData:v13 error:&obj];
    objc_storeStrong(&v9, obj);
    id v3 = v10;
    id v10 = v5;

    if (v9)
    {
      uint64_t v14 = [v9 code];
      int v8 = 1;
    }

    else if (v10)
    {
      if ([v10 getCString:v12 maxLength:v11 encoding:4]) {
        uint64_t v14 = 0LL;
      }
      else {
        uint64_t v14 = 6001LL;
      }
      int v8 = 1;
    }

    else
    {
      uint64_t v14 = 6001LL;
      int v8 = 1;
    }
  }

  else
  {
    uint64_t v14 = 6000LL;
    int v8 = 1;
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  return v14;
}

uint64_t lookupPathForPersistentData(unsigned int a1, uint64_t a2, uint64_t a3)
{
  unsigned int v13 = a1;
  uint64_t v12 = a2;
  uint64_t v11 = a3;
  id v10 = 0LL;
  id v9 = 0LL;
  if (a2)
  {
    id v6 = +[MSUDataAccessor sharedDataAccessor](&OBJC_CLASS___MSUDataAccessor, "sharedDataAccessor");
    id obj = v9;
    v5 = (void *)[v6 copyPathForPersistentData:v13 error:&obj];
    objc_storeStrong(&v9, obj);
    id v3 = v10;
    id v10 = v5;

    if (v9)
    {
      uint64_t v14 = [v9 code];
      int v8 = 1;
    }

    else if (v10)
    {
      if ([v10 getCString:v12 maxLength:v11 encoding:4]) {
        uint64_t v14 = 0LL;
      }
      else {
        uint64_t v14 = 6001LL;
      }
      int v8 = 1;
    }

    else
    {
      uint64_t v14 = 6001LL;
      int v8 = 1;
    }
  }

  else
  {
    uint64_t v14 = 6000LL;
    int v8 = 1;
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  return v14;
}

void sub_186207A84()
{
}

void sub_18620877C()
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  id *v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __copy_helper_block_e8_32s40s48s56r64r(id *a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 32);
  a1[4] = 0LL;
  objc_storeStrong(a1 + 4, v2);
  id v3 = *(void **)(a2 + 40);
  a1[5] = 0LL;
  objc_storeStrong(a1 + 5, v3);
  v4 = *(void **)(a2 + 48);
  a1[6] = 0LL;
  objc_storeStrong(a1 + 6, v4);
  _Block_object_assign(a1 + 7, *(const void **)(a2 + 56), 8);
  _Block_object_assign(a1 + 8, *(const void **)(a2 + 64), 8);
}

void __destroy_helper_block_e8_32s40s48s56r64r(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F8290](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82F0](data, *(void *)&len, md);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x189613710]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}