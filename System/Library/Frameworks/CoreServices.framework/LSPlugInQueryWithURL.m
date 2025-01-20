@interface LSPlugInQueryWithURL
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LSPlugInQueryWithURL)initWithCoder:(id)a3;
- (id)_bundleURL;
- (id)_initWithURL:(id)a3;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSPlugInQueryWithURL

- (id)_initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSPlugInQueryWithURL;
  v6 = -[LSPlugInQuery _init](&v9, sel__init);
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 2, a3);
  }

  return v7;
}

- (id)_bundleURL
{
  return self->_bundleURL;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0LL;
  v16 = (void **)&v15;
  uint64_t v17 = 0x3812000000LL;
  v18 = __Block_byref_object_copy__32;
  v19 = __Block_byref_object_dispose__32;
  uint64_t v20 = 256LL;
  id v21 = 0LL;
  id v14 = 0LL;
  int inited = _LSContextInitReturningError((uint64_t)&v21, (uint64_t)&v14);
  id v9 = v14;
  if (inited)
  {
    v10 = (__CFString *)CFURLCopyFileSystemPath((CFURLRef)self->_bundleURL, kCFURLPOSIXPathStyle);
    v11 = v10;
    if (v10)
    {
      v12 = v10;
      id v13 = v7;
      _CSStoreEnumerateUnits();
    }

    _LSContextDestroy(v16 + 6);
  }

  else
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v9);
  }

  _Block_object_dispose(&v15, 8);
}

void __58__LSPlugInQueryWithURL__enumerateWithXPCConnection_block___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  _BYTE *a5)
{
  if (*(_DWORD *)(a3 + 4))
  {
    uint64_t v9 = _LSContainerGet();
    if (v9)
    {
      BOOL v10 = !_LSContainerCheckState( *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 48LL),  *(unsigned int *)(a3 + 4),  v9,  &v15,  0LL)
         && v15 == 1;
      if (v10
        && _LSAliasMatchesPath_NoIO( *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 48LL),  *(_DWORD *)a3,  *(void **)(a1 + 32),  0LL))
      {
        v11 = +[LSPlugInKitProxy plugInKitProxyForPlugin:withContext:]( &OBJC_CLASS___LSPlugInKitProxy,  "plugInKitProxyForPlugin:withContext:",  a2,  *(void *)(*(void *)(a1 + 48) + 8LL) + 48LL);
        v12 = v11;
        if (v11)
        {
          id v13 = v11;
          id v14 = 0LL;
        }

        else
        {
          _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"-[LSPlugInQueryWithURL _enumerateWithXPCConnection:block:]_block_invoke",  67LL,  0LL);
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        *a5 = 1;
      }
    }
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LSPlugInQueryWithURL;
  if (-[LSPlugInQuery isEqual:](&v12, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    bundleURL = self->_bundleURL;
    id v6 = v4;
    -[NSURL path](bundleURL, "path");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _bundleURL];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    [v8 path];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = [v7 isEqualToString:v9];
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LSPlugInQueryWithURL;
  unint64_t v5 = -[LSPlugInQuery hash](&v7, sel_hash) ^ v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (LSPlugInQueryWithURL)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleURL");
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  id v6 = -[LSPlugInQueryWithURL _initWithURL:](self, "_initWithURL:", v5);
  return v6;
}

- (void).cxx_destruct
{
}

@end