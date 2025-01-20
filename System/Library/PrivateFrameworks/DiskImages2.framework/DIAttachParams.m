@interface DIAttachParams
+ (BOOL)copyWithURL:(id)a3 outURLStr:(char *)a4 maxLen:(unint64_t)a5 error:(id *)a6;
+ (BOOL)supportsSecureCoding;
- (BOOL)autoMount;
- (BOOL)emulateExternalDisk;
- (BOOL)handleRefCount;
- (BOOL)onDiskCache;
- (BOOL)reOpenIfWritableWithError:(id *)a3;
- (BOOL)shouldValidateShadows;
- (BOOL)uniqueDevice;
- (DIAttachParams)initWithCoder:(id)a3;
- (DIAttachParams)initWithExistingParams:(id)a3 error:(id *)a4;
- (DIAttachParams)initWithURL:(id)a3 error:(id *)a4;
- (DIAttachParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5;
- (DIStatFS)inputStatFS;
- (NSString)inputMountedFrom;
- (NSURL)customCacheURL;
- (id)newAttachWithError:(id *)a3;
- (id)toDI1ParamsWithError:(id *)a3;
- (int64_t)fileMode;
- (unint64_t)commandSize;
- (unint64_t)regEntryID;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoMount:(BOOL)a3;
- (void)setCommandSize:(unint64_t)a3;
- (void)setCustomCacheURL:(id)a3;
- (void)setEmulateExternalDisk:(BOOL)a3;
- (void)setFileMode:(int64_t)a3;
- (void)setHandleRefCount:(BOOL)a3;
- (void)setInputMountedFrom:(id)a3;
- (void)setInputStatFS:(id)a3;
- (void)setOnDiskCache:(BOOL)a3;
- (void)setRegEntryID:(unint64_t)a3;
- (void)setShouldValidateShadows:(BOOL)a3;
- (void)setUniqueDevice:(BOOL)a3;
- (void)setupDefaults;
@end

@implementation DIAttachParams

- (DIAttachParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIAttachParams;
  v5 = -[DIBaseParams initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_autoMount = [v4 decodeBoolForKey:@"autoMount"];
    v5->_commandSize = [v4 decodeIntegerForKey:@"commandSize"];
    v5->_regEntryID = [v4 decodeInt64ForKey:@"regEntryID"];
    v5->_handleRefCount = [v4 decodeBoolForKey:@"handleRefCount"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputStatFS"];
    inputStatFS = v5->_inputStatFS;
    v5->_inputStatFS = (DIStatFS *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputMountedFrom"];
    inputMountedFrom = v5->_inputMountedFrom;
    v5->_inputMountedFrom = (NSString *)v8;

    v5->_fileMode = [v4 decodeIntegerForKey:@"fileMode"];
    v5->_onDiskCache = [v4 decodeBoolForKey:@"onDiskCache"];
    v5->_uniqueDevice = [v4 decodeBoolForKey:@"uniqueDevice"];
    v5->_emulateExternalDisk = [v4 decodeBoolForKey:@"emulateExternalDisk"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DIAttachParams;
  -[DIBaseParams encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams autoMount](self, "autoMount"), @"autoMount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIAttachParams commandSize](self, "commandSize"), @"commandSize");
  objc_msgSend(v4, "encodeInt64:forKey:", -[DIAttachParams regEntryID](self, "regEntryID"), @"regEntryID");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[DIAttachParams handleRefCount](self, "handleRefCount"),  @"handleRefCount");
  v5 = -[DIAttachParams inputStatFS](self, "inputStatFS");
  [v4 encodeObject:v5 forKey:@"inputStatFS"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DIAttachParams fileMode](self, "fileMode"), @"fileMode");
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams onDiskCache](self, "onDiskCache"), @"onDiskCache");
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams uniqueDevice](self, "uniqueDevice"), @"uniqueDevice");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[DIAttachParams emulateExternalDisk](self, "emulateExternalDisk"),  @"emulateExternalDisk");
}

- (void)setupDefaults
{
  self->_fileMode = 1LL;
  self->_autoMount = !-[DIBaseParams RAMdisk](self, "RAMdisk");
  self->_onDiskCache = 0;
  customCacheURL = self->_customCacheURL;
  self->_customCacheURL = 0LL;
}

- (void)setCustomCacheURL:(id)a3
{
  self->_onDiskCache = a3 != 0LL;
}

- (void)setOnDiskCache:(BOOL)a3
{
  self->_onDiskCache = a3;
  if (!a3)
  {
    customCacheURL = self->_customCacheURL;
    self->_customCacheURL = 0LL;
  }

- (DIAttachParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [MEMORY[0x189603F18] array];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = -[DIAttachParams initWithURL:shadowURLs:error:](self, "initWithURL:shadowURLs:error:", v6, v7, a4);

  return v8;
}

- (DIAttachParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DIAttachParams;
  v10 = -[DIBaseParams initWithURL:error:](&v17, sel_initWithURL_error_, v8, a5);
  objc_super v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  if (!-[DIBaseParams openExistingImageWithFlags:error:](v10, "openExistingImageWithFlags:error:", 0LL, a5)) {
    goto LABEL_9;
  }
  -[DIAttachParams setupDefaults](v11, "setupDefaults");
  if (![v9 count])
  {
LABEL_7:
    v12 = v11;
    goto LABEL_8;
  }

  if (!-[DIBaseParams isPstack](v11, "isPstack"))
  {
    v13 = -[DIBaseParams shadowChain](v11, "shadowChain");
    char v14 = [v13 addShadowURLs:v9 error:a5];

    if ((v14 & 1) != 0) {
      goto LABEL_7;
    }
LABEL_9:
    v15 = 0LL;
    goto LABEL_10;
  }

  +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Custom cache or shadow is not supported for pstack based images.",  a5);
  v12 = (DIAttachParams *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v15 = v12;
LABEL_10:

  return v15;
}

- (DIAttachParams)initWithExistingParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 inputURL];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DIAttachParams;
  id v8 = -[DIBaseParams initWithURL:error:](&v16, sel_initWithURL_error_, v7, a4);

  if (!v8) {
    goto LABEL_3;
  }
  [v6 diskImageParamsXPC];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseParams setDiskImageParamsXPC:](v8, "setDiskImageParamsXPC:", v9);

  -[DIAttachParams setupDefaults](v8, "setupDefaults");
  v10 = -[DIBaseParams shadowChain](v8, "shadowChain");
  [v6 shadowChain];
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 nodes];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  char v13 = [v10 addShadowNodes:v12 error:a4];

  if ((v13 & 1) == 0) {
    char v14 = 0LL;
  }
  else {
LABEL_3:
  }
    char v14 = v8;

  return v14;
}

- (BOOL)shouldValidateShadows
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 shouldValidate];

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  BOOL v3 = a3;
  -[DIBaseParams shadowChain](self, "shadowChain");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setShouldValidate:v3];
}

- (BOOL)reOpenIfWritableWithError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  v5 = -[DIBaseParams inputURL](self, "inputURL");
  if ([v5 isFileURL])
  {
  }

  else
  {
    -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return 1;
    }
  }

  -[DIBaseParams shadowChain](self, "shadowChain");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 activeShadowURL];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[DIBaseParams backend](self, "backend");
    char v10 = (*(uint64_t (**)(void))(**(void **)buf + 48LL))(*(void *)buf);
    char v11 = v10;
    if (!*(void *)v46) {
      goto LABEL_9;
    }
    v12 = (unint64_t *)(*(void *)v46 + 8LL);
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      (*(void (**)(void))(**(void **)v46 + 16LL))(*(void *)v46);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v46);
      if ((v11 & 1) != 0) {
        return 1;
      }
    }

    else
    {
LABEL_9:
      if ((v10 & 1) != 0) {
        return 1;
      }
    }

    -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = [v16 isWritableFormat];

    int v18 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      v20 = "NO";
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 44;
      *(void *)&v46[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
      *(_WORD *)v46 = 2080;
      if (v17) {
        v20 = "YES";
      }
      __int16 v47 = 2080;
      v48 = v20;
      LODWORD(v44) = 28;
      v43 = buf;
      v21 = (char *)_os_log_send_and_compose_impl();

      if (v21)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v21);
        free(v21);
      }
    }

    else
    {
      getDIOSLog();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = "NO";
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 44;
        *(void *)&v46[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
        *(_WORD *)v46 = 2080;
        if (v17) {
          v23 = "YES";
        }
        __int16 v47 = 2080;
        v48 = v23;
        _os_log_impl(&dword_188046000, v22, OS_LOG_TYPE_DEFAULT, "%.*s: isWritableFormat: %s", buf, 0x1Cu);
      }
    }

    *__error() = v18;
    int64_t v24 = -[DIAttachParams fileMode](self, "fileMode");
    if ((v17 & 1) != 0)
    {
      if (v24 != 2)
      {
        v25 = -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
        objc_opt_class();
        char v26 = objc_opt_isKindOfClass();

        if ((v26 & 1) != 0)
        {
          v27 = objc_alloc(&OBJC_CLASS___PluginBackendXPC);
          v28 = -[DIBaseParams inputURL](self, "inputURL");
          uint64_t v29 = -[PluginBackendXPC initWithURL:openMode:](v27, "initWithURL:openMode:", v28, 2LL);

          v30 = (void *)v29;
        }

        else
        {
          v31 = -[DIBaseParams inputURL](self, "inputURL");
          id v32 = +[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]( &OBJC_CLASS___BackendXPC,  "newFileBackendWithURL:fileOpenFlags:error:",  v31,  2LL,  a3);

          v30 = v32;
          if (!v32) {
            return 0;
          }
        }

        int v33 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
          v35 = -[DIBaseParams inputURL](self, "inputURL", v43, v44);
          [v35 path];
          v36 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158211;
          *(_DWORD *)&buf[4] = 44;
          *(_WORD *)v46 = 2080;
          *(void *)&v46[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
          __int16 v47 = 2113;
          v48 = v36;
          v37 = (char *)_os_log_send_and_compose_impl();

          if (v37)
          {
            fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v37);
            free(v37);
          }
        }

        else
        {
          getDIOSLog();
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = -[DIBaseParams inputURL](self, "inputURL");
            [v39 path];
            v40 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158211;
            *(_DWORD *)&buf[4] = 44;
            *(_WORD *)v46 = 2080;
            *(void *)&v46[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
            __int16 v47 = 2113;
            v48 = v40;
            _os_log_impl( &dword_188046000,  v38,  OS_LOG_TYPE_DEFAULT,  "%.*s: Image %{private}@ re-opened with RW permissions",  buf,  0x1Cu);
          }
        }

        *__error() = v33;
        v41 = -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
        [v41 backendXPC];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v42 replaceWithBackendXPC:v30];
      }
    }

    else if (v24 == 4)
    {
      return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Image has a read-only format, attach failed due to force RW flag",  a3);
    }
  }

  return 1;
}

- (id)newAttachWithError:(id *)a3
{
  v45[1] = *MEMORY[0x1895F89C0];
  if (!-[DIBaseParams isPstack](self, "isPstack"))
  {
    v5 = -[DIBaseParams shadowChain](self, "shadowChain");
    int v6 = [v5 hasBaseImageCache];

    if (v6)
    {
      v7 = -[DIBaseParams shadowChain](self, "shadowChain");
      [v7 nodes];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 removeObjectAtIndex:0];
    }
  }

  if (!-[DIBaseParams isPstack](self, "isPstack") || !-[DIAttachParams onDiskCache](self, "onDiskCache"))
  {
    -[DIAttachParams customCacheURL](self, "customCacheURL");
    char v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      char v11 = objc_alloc(&OBJC_CLASS___DIShadowNode);
      v12 = -[DIAttachParams customCacheURL](self, "customCacheURL");
      unint64_t v13 = -[DIShadowNode initWithURL:isCache:](v11, "initWithURL:isCache:", v12, 1LL);

      -[DIBaseParams shadowChain](self, "shadowChain");
      char v14 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v13;
      [MEMORY[0x189603F18] arrayWithObjects:v45 count:1];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      char v16 = [v14 verifyNodes:v15 error:a3];

      if ((v16 & 1) == 0)
      {

        return 0LL;
      }

      -[DIBaseParams shadowChain](self, "shadowChain");
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 nodes];
      int v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 insertObject:v13 atIndex:0];
    }

    v19 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
    int v20 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      int v40 = 37;
      __int16 v41 = 2080;
      v42 = "-[DIAttachParams newAttachWithError:]";
      __int16 v43 = 2114;
      uint64_t v44 = self;
      LODWORD(v38) = 28;
      v37 = buf;
      v22 = (char *)_os_log_send_and_compose_impl();

      if (v22)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v22);
        free(v22);
      }
    }

    else
    {
      getDIOSLog();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v40 = 37;
        __int16 v41 = 2080;
        v42 = "-[DIAttachParams newAttachWithError:]";
        __int16 v43 = 2114;
        uint64_t v44 = self;
        _os_log_impl(&dword_188046000, v23, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }
    }

    *__error() = v20;
    if (-[DIBaseParams RAMdisk](self, "RAMdisk") && -[DIAttachParams fileMode](self, "fileMode") == 2)
    {
      int64_t v24 = @"Cannot attach RAM disk as a read-only device";
    }

    else
    {
      v25 = -[DIBaseParams shadowChain](self, "shadowChain", v37, v38);
      if ([v25 isEmpty])
      {
      }

      else
      {
        BOOL v26 = -[DIBaseParams rawBlockSize](self, "rawBlockSize") == 512;

        if (!v26)
        {
          int64_t v24 = @"The image has a 4KB block size, shadow and cache files are not supported";
          goto LABEL_41;
        }
      }

      if (!-[DIBaseParams RAMdisk](self, "RAMdisk")
        || (-[DIBaseParams shadowChain](self, "shadowChain"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            char v28 = [v27 isEmpty],
            v27,
            (v28 & 1) != 0))
      {
        if (!-[DIBaseParams requiresRootDaemon](self, "requiresRootDaemon"))
        {
          if (-[DIClient2Controller_XPCHandler connectWithError:](v19, "connectWithError:", a3)
            && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  v19,  -[DIAttachParams fileMode](self, "fileMode"),  a3)
            && -[DIAttachParams reOpenIfWritableWithError:](self, "reOpenIfWritableWithError:", a3)
            && -[DIAttachParams updateStatFSWithError:](self, "updateStatFSWithError:", a3))
          {
            v30 = objc_alloc(&OBJC_CLASS___QuarantineFileHandler);
            v31 = -[DIBaseParams inputURL](self, "inputURL");
            id v32 = -[QuarantineFileHandler initWithURL:error:](v30, "initWithURL:error:", v31, a3);

            if (v32)
            {
              if (-[DIAttachParams handleRefCount](self, "handleRefCount")
                && -[DIAttachParams uniqueDevice](self, "uniqueDevice"))
              {
                [MEMORY[0x189607AB8] UUID];
                int v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
                [v34 setInstanceID:v33];
              }

              id v9 = -[DIClient2Controller_XPCHandler newAttachWithParams:error:]( v19,  "newAttachWithParams:error:",  self,  a3);
              if (v9 && -[QuarantineFileHandler isQuarantined](v32, "isQuarantined"))
              {
                [v9 BSDName];
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[QuarantineFileHandler applyMountPointsWithBSDName:error:]( v32,  "applyMountPointsWithBSDName:error:",  v35,  0LL);
              }
            }

            else
            {
              id v9 = 0LL;
            }
          }

          else
          {
            id v9 = 0LL;
          }

          goto LABEL_43;
        }

        uint64_t v29 = +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  45LL,  @"Sparsebundles on SMB mounts are not supported on this system",  a3);
LABEL_42:
        id v9 = (id)v29;
LABEL_43:

        return v9;
      }

      int64_t v24 = @"Cannot attach RAM disk with a shadow or a cache file";
    }

+ (BOOL)copyWithURL:(id)a3 outURLStr:(char *)a4 maxLen:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [v9 description];
  char v11 = (const char *)[v10 UTF8String];

  if (!v11 || !*v11)
  {
    BOOL v13 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Failed converting URL to UTF8",  a6);
LABEL_7:
    BOOL v12 = v13;
    goto LABEL_8;
  }

  if (strlcpy(a4, v11, a5) >= a5)
  {
    BOOL v13 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  @"Disk image URL is too long",  a6);
    goto LABEL_7;
  }

  BOOL v12 = 1;
LABEL_8:

  return v12;
}

- (BOOL)autoMount
{
  return self->_autoMount;
}

- (void)setAutoMount:(BOOL)a3
{
  self->_autoMount = a3;
}

- (int64_t)fileMode
{
  return self->_fileMode;
}

- (void)setFileMode:(int64_t)a3
{
  self->_fileMode = a3;
}

- (BOOL)onDiskCache
{
  return self->_onDiskCache;
}

- (NSURL)customCacheURL
{
  return self->_customCacheURL;
}

- (BOOL)uniqueDevice
{
  return self->_uniqueDevice;
}

- (void)setUniqueDevice:(BOOL)a3
{
  self->_uniqueDevice = a3;
}

- (unint64_t)commandSize
{
  return self->_commandSize;
}

- (void)setCommandSize:(unint64_t)a3
{
  self->_commandSize = a3;
}

- (unint64_t)regEntryID
{
  return self->_regEntryID;
}

- (void)setRegEntryID:(unint64_t)a3
{
  self->_regEntryID = a3;
}

- (BOOL)handleRefCount
{
  return self->_handleRefCount;
}

- (void)setHandleRefCount:(BOOL)a3
{
  self->_handleRefCount = a3;
}

- (DIStatFS)inputStatFS
{
  return self->_inputStatFS;
}

- (void)setInputStatFS:(id)a3
{
}

- (NSString)inputMountedFrom
{
  return self->_inputMountedFrom;
}

- (void)setInputMountedFrom:(id)a3
{
}

- (BOOL)emulateExternalDisk
{
  return self->_emulateExternalDisk;
}

- (void)setEmulateExternalDisk:(BOOL)a3
{
  self->_emulateExternalDisk = a3;
}

- (void).cxx_destruct
{
}

- (id)toDI1ParamsWithError:(id *)a3
{
  return (id)MEMORY[0x189604A60];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end