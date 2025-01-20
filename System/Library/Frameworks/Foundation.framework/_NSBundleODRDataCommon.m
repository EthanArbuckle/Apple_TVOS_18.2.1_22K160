@interface _NSBundleODRDataCommon
- (BOOL)assetPacksBecameAvailable:(id)a3 error:(id *)a4;
- (BOOL)assetPacksBecameUnavailable:(id)a3 error:(id *)a4;
- (_NSBundleODRDataCommon)initWithBundle:(id)a3;
- (void)dealloc;
@end

@implementation _NSBundleODRDataCommon

- (_NSBundleODRDataCommon)initWithBundle:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NSBundleODRDataCommon;
  v4 = -[_NSBundleODRDataCommon init](&v6, sel_init);
  v4->_bundle = (NSBundle *)a3;
  v4->_assetPackToURL = (NSMutableDictionary *)objc_opt_new();
  v4->_lock = (NSLock *)objc_opt_new();
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  if (self->_sandboxToken >= 1) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSBundleODRDataCommon;
  -[_NSBundleODRDataCommon dealloc](&v3, sel_dealloc);
}

- (BOOL)assetPacksBecameAvailable:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 1;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  uint64_t v17 = 0LL;
  -[NSLock lock](self->_lock, "lock");
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __58___NSBundleODRDataCommon_assetPacksBecameAvailable_error___block_invoke;
  v11[3] = &unk_189CA0BF0;
  v11[5] = &v18;
  v11[6] = &v12;
  v11[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
  -[NSLock unlock](self->_lock, "unlock");
  uint64_t v7 = v13;
  if (a4)
  {
    if (!*((_BYTE *)v19 + 24))
    {
      v8 = (void *)v13[5];
      if (v8)
      {
        *a4 = v8;
        uint64_t v7 = v13;
      }
    }
  }

  char v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

- (BOOL)assetPacksBecameUnavailable:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 1;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  uint64_t v17 = 0LL;
  -[NSLock lock](self->_lock, "lock");
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __60___NSBundleODRDataCommon_assetPacksBecameUnavailable_error___block_invoke;
  v11[3] = &unk_189CA0BF0;
  v11[5] = &v18;
  v11[6] = &v12;
  v11[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
  -[NSLock unlock](self->_lock, "unlock");
  uint64_t v7 = v13;
  if (a4)
  {
    if (!*((_BYTE *)v19 + 24))
    {
      v8 = (void *)v13[5];
      if (v8)
      {
        *a4 = v8;
        uint64_t v7 = v13;
      }
    }
  }

  char v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

@end