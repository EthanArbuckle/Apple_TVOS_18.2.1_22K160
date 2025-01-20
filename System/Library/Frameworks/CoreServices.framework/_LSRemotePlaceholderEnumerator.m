@interface _LSRemotePlaceholderEnumerator
- (id)_applicationRecordWithContext:(LSContext *)a3 bundleIdentifierOrUnit:(unsigned int)a4;
@end

@implementation _LSRemotePlaceholderEnumerator

- (id)_applicationRecordWithContext:(LSContext *)a3 bundleIdentifierOrUnit:(unsigned int)a4
{
  v4 = *(LSContext **)&a4;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  unsigned int v25 = 0;
  v24 = 0LL;
  if (-[_LSApplicationRecordEnumerator _enumerateAllBundles](self, "_enumerateAllBundles"))
  {
    v7 = (void *)_LSBundleGet(a3->db, (int)v4);
    v24 = v7;
    if (!v7) {
      return v7;
    }
    if (!evaluateBundleNoIOCommon(v4, (uint64_t)v7, (const LSBundleData *)self->super._options))
    {
      v7 = 0LL;
      return v7;
    }

    unsigned int v25 = v4;
    BOOL v8 = 1;
  }

  else
  {
    v4 = (LSContext *)_CSStringCopyCFString();
    if (v4)
    {
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __87___LSRemotePlaceholderEnumerator__applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke;
      v23[3] = &unk_189D724F0;
      v23[4] = self;
      v9 = (void *)MEMORY[0x186E2A7B8](v23);
      memset(v26, 0, sizeof(v26));
      int v10 = -[_LSApplicationRecordEnumerator bundleClass](self, "bundleClass");
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = _LSBundleFindWithInfoAndNo_IOFilter(a3, 0LL, v4, 0, v26, v10, 33792, v12, v9, &v25, &v24, 0LL);

      if ((v10 & 1) == 0)
      {
        v13 = (os_log_s *)_LSEnumeratorLog;
        if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG)) {
          -[_LSApplicationRecordEnumerator(Private) _applicationRecordWithContext:bundleIdentifierOrUnit:].cold.1( (uint64_t)v4,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
        }
      }
    }

    else
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10817LL,  (uint64_t)"-[_LSRemotePlaceholderEnumerator _applicationRecordWithContext:bundleIdentifierOrUnit:]",  314LL,  0LL);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _LSEnumeratorFireErrorHandler((unsigned __int8 *)self, v20);
    }

    LODWORD(v4) = v25;
    BOOL v8 = v24 != 0LL;
  }

  v7 = 0LL;
  if ((_DWORD)v4 && v8)
  {
    v21 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
    return  -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( v21,  "_initWithContext:bundleID:bundleData:error:",  a3,  v25,  v24,  0LL);
  }

  return v7;
}

@end