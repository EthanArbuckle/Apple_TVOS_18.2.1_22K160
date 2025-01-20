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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIAttachParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DIAttachParams;
  v5 = -[DIBaseParams initWithCoder:](&v15, "initWithCoder:", v4);
  if (v5)
  {
    v5->_autoMount = [v4 decodeBoolForKey:@"autoMount"];
    v5->_commandSize = (unint64_t)[v4 decodeIntegerForKey:@"commandSize"];
    v5->_regEntryID = (unint64_t)[v4 decodeInt64ForKey:@"regEntryID"];
    v5->_handleRefCount = [v4 decodeBoolForKey:@"handleRefCount"];
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(DIStatFS, v6),  @"inputStatFS");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    inputStatFS = v5->_inputStatFS;
    v5->_inputStatFS = (DIStatFS *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"inputMountedFrom");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    inputMountedFrom = v5->_inputMountedFrom;
    v5->_inputMountedFrom = (NSString *)v12;

    v5->_fileMode = (int64_t)[v4 decodeIntegerForKey:@"fileMode"];
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
  -[DIBaseParams encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams autoMount](self, "autoMount"), @"autoMount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIAttachParams commandSize](self, "commandSize"), @"commandSize");
  objc_msgSend(v4, "encodeInt64:forKey:", -[DIAttachParams regEntryID](self, "regEntryID"), @"regEntryID");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[DIAttachParams handleRefCount](self, "handleRefCount"),  @"handleRefCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachParams inputStatFS](self, "inputStatFS"));
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
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  uint64_t v8 = -[DIAttachParams initWithURL:shadowURLs:error:](self, "initWithURL:shadowURLs:error:", v6, v7, a4);

  return v8;
}

- (DIAttachParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DIAttachParams;
  uint64_t v10 = -[DIBaseParams initWithURL:error:](&v17, "initWithURL:error:", v8, a5);
  id v11 = v10;
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
    uint64_t v12 = v11;
    goto LABEL_8;
  }

  if (!-[DIBaseParams isPstack](v11, "isPstack"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v11, "shadowChain"));
    unsigned __int8 v14 = [v13 addShadowURLs:v9 error:a5];

    if ((v14 & 1) != 0) {
      goto LABEL_7;
    }
LABEL_9:
    objc_super v15 = 0LL;
    goto LABEL_10;
  }

  uint64_t v12 = (DIAttachParams *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Custom cache or shadow is not supported for pstack based images.",  a5));
LABEL_8:
  objc_super v15 = v12;
LABEL_10:

  return v15;
}

- (DIAttachParams)initWithExistingParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 inputURL]);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DIAttachParams;
  id v8 = -[DIBaseParams initWithURL:error:](&v16, "initWithURL:error:", v7, a4);

  if (!v8) {
    goto LABEL_3;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 diskImageParamsXPC]);
  -[DIBaseParams setDiskImageParamsXPC:](v8, "setDiskImageParamsXPC:", v9);

  -[DIAttachParams setupDefaults](v8, "setupDefaults");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v8, "shadowChain"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 shadowChain]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nodes]);
  unsigned __int8 v13 = [v10 addShadowNodes:v12 error:a4];

  if ((v13 & 1) == 0) {
    unsigned __int8 v14 = 0LL;
  }
  else {
LABEL_3:
  }
    unsigned __int8 v14 = v8;

  return v14;
}

- (BOOL)shouldValidateShadows
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  unsigned __int8 v3 = [v2 shouldValidate];

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  [v4 setShouldValidate:v3];
}

- (BOOL)reOpenIfWritableWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  if ([v5 isFileURL])
  {
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___DiskImageParamsPlugin_XPC, v7);
    char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

    if ((isKindOfClass & 1) == 0) {
      return 1;
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeShadowURL]);

  if (!v11)
  {
    -[DIBaseParams backend](self, "backend");
    char v12 = (*(uint64_t (**)(void))(**(void **)buf + 48LL))(*(void *)buf);
    char v13 = v12;
    if (!*(void *)v57) {
      goto LABEL_9;
    }
    unsigned __int8 v14 = (unint64_t *)(*(void *)v57 + 8LL);
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      (*(void (**)(void))(**(void **)v57 + 16LL))(*(void *)v57);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v57);
      if ((v13 & 1) != 0) {
        return 1;
      }
    }

    else
    {
LABEL_9:
      if ((v12 & 1) != 0) {
        return 1;
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    unsigned int v19 = [v18 isWritableFormat];

    int v20 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v55 = 0LL;
      uint64_t v21 = sub_1000B85DC();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v23 = 3LL;
      }
      else {
        uint64_t v23 = 2LL;
      }
      v24 = "NO";
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 44;
      *(void *)&v57[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
      *(_WORD *)v57 = 2080;
      if (v19) {
        v24 = "YES";
      }
      __int16 v58 = 2080;
      v59 = v24;
      LODWORD(v53) = 28;
      v25 = (char *)_os_log_send_and_compose_impl( v23,  &v55,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%.*s: isWritableFormat: %s",  (int)buf,  v53,  v54);

      if (v25)
      {
        fprintf(__stderrp, "%s\n", v25);
        free(v25);
      }
    }

    else
    {
      uint64_t v26 = sub_1000B85DC();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = "NO";
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 44;
        *(void *)&v57[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
        *(_WORD *)v57 = 2080;
        if (v19) {
          v28 = "YES";
        }
        __int16 v58 = 2080;
        v59 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%.*s: isWritableFormat: %s", buf, 0x1Cu);
      }
    }

    *__error() = v20;
    int64_t v29 = -[DIAttachParams fileMode](self, "fileMode");
    if ((v19 & 1) != 0)
    {
      if (v29 != 2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
        uint64_t v32 = objc_opt_class(&OBJC_CLASS___DiskImageParamsPlugin_XPC, v31);
        char v33 = objc_opt_isKindOfClass(v30, v32);

        if ((v33 & 1) != 0)
        {
          v34 = objc_alloc(&OBJC_CLASS___PluginBackendXPC);
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
          v36 = -[PluginBackendXPC initWithURL:openMode:](v34, "initWithURL:openMode:", v35, 2LL);

          v37 = v36;
        }

        else
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
          v39 = +[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]( &OBJC_CLASS___BackendXPC,  "newFileBackendWithURL:fileOpenFlags:error:",  v38,  2LL,  a3);

          v37 = v39;
          if (!v39) {
            return 0;
          }
        }

        int v40 = *__error();
        if (sub_1000B8654())
        {
          uint64_t v55 = 0LL;
          uint64_t v41 = sub_1000B85DC();
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v43 = 3LL;
          }
          else {
            uint64_t v43 = 2LL;
          }
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
          v45 = (char *)objc_claimAutoreleasedReturnValue([v44 path]);
          *(_DWORD *)buf = 68158211;
          *(_DWORD *)&buf[4] = 44;
          *(_WORD *)v57 = 2080;
          *(void *)&v57[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
          __int16 v58 = 2113;
          v59 = v45;
          LODWORD(v53) = 28;
          v46 = (char *)_os_log_send_and_compose_impl( v43,  &v55,  0LL,  0LL,  &_mh_execute_header,  v42,  0LL,  "%.*s: Image %{private}@ re-opened with RW permissions",  buf,  v53);

          if (v46)
          {
            fprintf(__stderrp, "%s\n", v46);
            free(v46);
          }
        }

        else
        {
          uint64_t v47 = sub_1000B85DC();
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
            v50 = (char *)objc_claimAutoreleasedReturnValue([v49 path]);
            *(_DWORD *)buf = 68158211;
            *(_DWORD *)&buf[4] = 44;
            *(_WORD *)v57 = 2080;
            *(void *)&v57[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
            __int16 v58 = 2113;
            v59 = v50;
            _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%.*s: Image %{private}@ re-opened with RW permissions",  buf,  0x1Cu);
          }
        }

        *__error() = v40;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
        v52 = (void *)objc_claimAutoreleasedReturnValue([v51 backendXPC]);
        [v52 replaceWithBackendXPC:v37];
      }
    }

    else if (v29 == 4)
    {
      return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Image has a read-only format, attach failed due to force RW flag",  a3);
    }
  }

  return 1;
}

- (id)newAttachWithError:(id *)a3
{
  if (!-[DIBaseParams isPstack](self, "isPstack"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
    unsigned int v6 = [v5 hasBaseImageCache];

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nodes]);
      [v8 removeObjectAtIndex:0];
    }
  }

  if (!-[DIBaseParams isPstack](self, "isPstack") || !-[DIAttachParams onDiskCache](self, "onDiskCache"))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachParams customCacheURL](self, "customCacheURL"));

    if (v10)
    {
      id v11 = objc_alloc(&OBJC_CLASS___DIShadowNode);
      char v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachParams customCacheURL](self, "customCacheURL"));
      char v13 = -[DIShadowNode initWithURL:isCache:](v11, "initWithURL:isCache:", v12, 1LL);

      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
      uint64_t v47 = v13;
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
      unsigned __int8 v16 = [v14 verifyNodes:v15 error:a3];

      if ((v16 & 1) == 0)
      {

        return 0LL;
      }

      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 nodes]);
      [v18 insertObject:v13 atIndex:0];
    }

    unsigned int v19 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
    int v20 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v40 = 0LL;
      uint64_t v21 = sub_1000B85DC();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v23 = 3LL;
      }
      else {
        uint64_t v23 = 2LL;
      }
      *(_DWORD *)buf = 68158210;
      int v42 = 37;
      __int16 v43 = 2080;
      v44 = "-[DIAttachParams newAttachWithError:]";
      __int16 v45 = 2114;
      v46 = self;
      v24 = (char *)_os_log_send_and_compose_impl( v23,  &v40,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%.*s: entry: %{public}@",  buf,  28);

      if (v24)
      {
        fprintf(__stderrp, "%s\n", v24);
        free(v24);
      }
    }

    else
    {
      uint64_t v25 = sub_1000B85DC();
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v42 = 37;
        __int16 v43 = 2080;
        v44 = "-[DIAttachParams newAttachWithError:]";
        __int16 v45 = 2114;
        v46 = self;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }
    }

    *__error() = v20;
    if (-[DIBaseParams RAMdisk](self, "RAMdisk") && (id)-[DIAttachParams fileMode](self, "fileMode") == (id)2)
    {
      v27 = @"Cannot attach RAM disk as a read-only device";
    }

    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
      if ([v28 isEmpty])
      {
      }

      else
      {
        BOOL v29 = (id)-[DIBaseParams rawBlockSize](self, "rawBlockSize") == (id)512;

        if (!v29)
        {
          v27 = @"The image has a 4KB block size, shadow and cache files are not supported";
          goto LABEL_44;
        }
      }

      if (!-[DIBaseParams RAMdisk](self, "RAMdisk")
        || (v30 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain")),
            unsigned __int8 v31 = [v30 isEmpty],
            v30,
            (v31 & 1) != 0))
      {
        if (!-[DIBaseParams requiresRootDaemon](self, "requiresRootDaemon"))
        {
          if (-[DIClient2Controller_XPCHandler connectWithError:](v19, "connectWithError:", a3)
            && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  v19,  -[DIAttachParams fileMode](self, "fileMode"),  a3)
            && -[DIAttachParams reOpenIfWritableWithError:](self, "reOpenIfWritableWithError:", a3)
            && -[DIAttachParams updateStatFSWithError:](self, "updateStatFSWithError:", a3))
          {
            char v33 = objc_alloc(&OBJC_CLASS___QuarantineFileHandler);
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
            v35 = -[QuarantineFileHandler initWithURL:error:](v33, "initWithURL:error:", v34, a3);

            if (v35)
            {
              if (-[DIAttachParams handleRefCount](self, "handleRefCount")
                && -[DIAttachParams uniqueDevice](self, "uniqueDevice"))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
                [v37 setInstanceID:v36];
              }

              id v9 = -[DIClient2Controller_XPCHandler newAttachWithParams:error:]( v19,  "newAttachWithParams:error:",  self,  a3);
              if (v9 && -[QuarantineFileHandler isQuarantined](v35, "isQuarantined"))
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue([v9 BSDName]);
                -[QuarantineFileHandler applyMountPointsWithBSDName:error:]( v35,  "applyMountPointsWithBSDName:error:",  v38,  0LL);
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

          goto LABEL_46;
        }

        uint64_t v32 = objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  45LL,  @"Sparsebundles on SMB mounts are not supported on this system",  a3));
LABEL_45:
        id v9 = (id)v32;
LABEL_46:

        return v9;
      }

      v27 = @"Cannot attach RAM disk with a shadow or a cache file";
    }

+ (BOOL)copyWithURL:(id)a3 outURLStr:(char *)a4 maxLen:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = objc_claimAutoreleasedReturnValue([v9 description]);
  id v11 = (const char *)[v10 UTF8String];

  if (!v11 || !*v11)
  {
    unsigned __int8 v13 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Failed converting URL to UTF8",  a6);
LABEL_7:
    BOOL v12 = v13;
    goto LABEL_8;
  }

  if (strlcpy(a4, v11, a5) >= a5)
  {
    unsigned __int8 v13 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  @"Disk image URL is too long",  a6);
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

@end