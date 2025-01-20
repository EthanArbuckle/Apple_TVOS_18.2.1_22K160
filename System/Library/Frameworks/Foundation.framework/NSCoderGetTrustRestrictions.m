@interface NSCoderGetTrustRestrictions
@end

@implementation NSCoderGetTrustRestrictions

void ___NSCoderGetTrustRestrictions_block_invoke()
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v0 = dlopen("/System/Library/Frameworks/Security.framework/Security", 256);
  if (v0
    && (v1 = v0,
        v2 = (uint64_t (*)(void))dlsym(v0, "SecTaskCreateFromSelf"),
        v3 = (unsigned int (*)(void))dlsym(v1, "SecTaskGetCodeSignStatus"),
        v4 = (uint64_t (*)(const void *, void))dlsym(v1, "SecTaskCopySigningIdentifier"),
        v2)
    && v3
    && (v5 = v4) != 0LL)
  {
    v6 = (const void *)v2(*MEMORY[0x189604DB0]);
    if ((~v3() & 0x4000001) != 0)
    {
      v8 = (void *)v5(v6, 0LL);
      if (v8)
      {
        v9 = v8;
        else {
          int v10 = 2;
        }
        dword_18C49658C = v10;
        CFRelease(v9);
      }
    }

    else
    {
      dword_18C49658C = 0;
    }

    CFRelease(v6);
  }

  else
  {
    v7 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_182EB1000, v7, OS_LOG_TYPE_ERROR, "NSCoder couldn't load a Security symbol.", v11, 2u);
    }
  }

@end