@interface DIBaseParams
+ (BOOL)supportsSecureCoding;
- (BOOL)RAMdisk;
- (BOOL)checkBeforeSetWithIsPassphrase:(BOOL)a3 error:(id *)a4;
- (BOOL)hasUnlockedBackend;
- (BOOL)isPstack;
- (BOOL)openExistingImageWithFlags:(int)a3 error:(id *)a4;
- (BOOL)prepareImageWithXpcHandler:(id)a3 fileMode:(int64_t)a4 error:(id *)a5;
- (BOOL)requiresRootDaemon;
- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4;
- (BOOL)supportsPstack;
- (BOOL)tryResolvePstackChain:(id *)a3;
- (BOOL)tryUnlockUsingKeychainCertificateWithError:(id *)a3;
- (BOOL)validateDeserializationWithError:(id *)a3;
- (DIBaseParams)initWithCoder:(id)a3;
- (DIBaseParams)initWithURL:(id)a3 error:(id *)a4;
- (DIShadowChain)shadowChain;
- (DIURL)inputURL;
- (DiskImageParamsXPC)diskImageParamsXPC;
- (NSError)deserializationError;
- (NSUUID)encryptionUUID;
- (NSUUID)instanceID;
- (id)description;
- (shared_ptr<Backend>)backend;
- (unint64_t)rawBlockSize;
- (unint64_t)readPassphraseFlags;
- (void)cryptoHeader;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setDeserializationError:(id)a3;
- (void)setDiskImageParamsXPC:(id)a3;
- (void)setInputURL:(id)a3;
- (void)setRawBlockSize:(unint64_t)a3;
- (void)setReadPassphraseFlags:(unint64_t)a3;
@end

@implementation DIBaseParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)RAMdisk
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (DIBaseParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___DIBaseParams;
  v5 = -[DIBaseParams init](&v20, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeBoolForKey:@"debugLogsEnabled"];
    uint64_t v7 = [v4 decodeBoolForKey:@"forwardLogs"];
    DISetDebugLogsEnabled(v6);
    [MEMORY[0x1896079D8] processInfo];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 processName];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = [v9 isEqualToString:@"diskimagesiod"];

    if ((v10 & 1) == 0) {
      DISetForwardLogs(v7);
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputURL"];
    inputURL = v5->_inputURL;
    v5->_inputURL = (DIURL *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shadowChain"];
    shadowChain = v5->_shadowChain;
    v5->_shadowChain = (DIShadowChain *)v13;

    v5->_readPassphraseFlags = [v4 decodeIntegerForKey:@"readPassphraseFlags"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diskImageParams"];
    diskImageParamsXPC = v5->_diskImageParamsXPC;
    v5->_diskImageParamsXPC = (DiskImageParamsXPC *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deserializationError"];
    deserializationError = v5->_deserializationError;
    v5->_deserializationError = (NSError *)v17;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeBool:DIDebugLogsEnabled() forKey:@"debugLogsEnabled"];
  [v8 encodeBool:DIForwardLogs() forKey:@"forwardLogs"];
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v4 forKey:@"diskImageParams"];
  v5 = -[DIBaseParams inputURL](self, "inputURL");
  [v8 encodeObject:v5 forKey:@"inputURL"];

  -[DIBaseParams shadowChain](self, "shadowChain");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v6 forKey:@"shadowChain"];

  objc_msgSend( v8,  "encodeInteger:forKey:",  -[DIBaseParams readPassphraseFlags](self, "readPassphraseFlags"),  @"readPassphraseFlags");
  -[DIBaseParams deserializationError](self, "deserializationError");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v7 forKey:@"deserializationError"];
}

- (DIBaseParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DIBaseParams;
  uint64_t v7 = -[DIBaseParams init](&v17, sel_init);
  if (v7)
  {
    id v8 = +[DIURL newDIURLWithNSURL:](&OBJC_CLASS___DIURL, "newDIURLWithNSURL:", v6);
    inputURL = v7->_inputURL;
    v7->_inputURL = v8;

    v7->_readPassphraseFlags = 7LL;
    char v10 = objc_alloc_init(&OBJC_CLASS___DIShadowChain);
    shadowChain = v7->_shadowChain;
    v7->_shadowChain = v10;
    v12 = -[DIURL path](v7->_inputURL, "path");
    if (!v12
      || ([MEMORY[0x189607A50] componentsWithURL:v6 resolvingAgainstBaseURL:1],
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          !v13))
    {
      +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  22LL,  @"Malformed URL format",  a4);
      v14 = (DIBaseParams *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }

    if (!-[DIBaseParams tryResolvePstackChain:](v7, "tryResolvePstackChain:", a4))
    {
      uint64_t v15 = 0LL;
      goto LABEL_10;
    }

    if (-[DIBaseParams isPstack](v7, "isPstack") && !-[DIBaseParams supportsPstack](v7, "supportsPstack"))
    {
      +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"This operation doesn't support pstack files",  a4);
      v14 = (DIBaseParams *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }

  v14 = v7;
LABEL_9:
  uint64_t v15 = v14;
LABEL_10:

  return v15;
}

- (BOOL)openExistingImageWithFlags:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    int v8 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v18 = 49;
      __int16 v19 = 2080;
      objc_super v20 = "-[DIBaseParams openExistingImageWithFlags:error:]";
      char v10 = (char *)_os_log_send_and_compose_impl();

      if (v10)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v10);
        free(v10);
      }
    }

    else
    {
      getDIOSLog();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v18 = 49;
        __int16 v19 = 2080;
        objc_super v20 = "-[DIBaseParams openExistingImageWithFlags:error:]";
        _os_log_impl(&dword_188046000, v15, OS_LOG_TYPE_DEFAULT, "%.*s: Using existing disk image params", buf, 0x12u);
      }
    }

    *__error() = v8;
    return 1;
  }

  else
  {
    -[DIBaseParams inputURL](self, "inputURL");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = +[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]( &OBJC_CLASS___DiskImageParamsXPC,  "newWithURL:fileOpenFlags:error:",  v11,  v5,  a4);
    -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v12);

    -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v14 = v13 != 0LL;
  }

  return v14;
}

- (BOOL)supportsPstack
{
  return 1;
}

- (BOOL)tryResolvePstackChain:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  -[DIBaseParams inputURL](self, "inputURL");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v35 = 0LL;
  id v36 = 0LL;
  BOOL v6 = +[DiskImageGraph loadPlistDictFromURL:dict:error:]( &OBJC_CLASS___DiskImageGraph,  "loadPlistDictFromURL:dict:error:",  v5,  &v36,  &v35);
  id v7 = v36;
  id v8 = v35;

  if (v6)
  {
    [v7 objectForKey:@"PstackVersion"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = v9 == 0LL;

    if (!v10)
    {
      self->_isPstack = 1;
      uint64_t v11 = objc_alloc(&OBJC_CLASS___DiskImageGraph);
      -[DIBaseParams inputURL](self, "inputURL");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = -[DiskImageGraph initWithData:pstackURL:imported:error:]( v11,  "initWithData:pstackURL:imported:error:",  v7,  v12,  0LL,  a3);

      if (v13)
      {
        v34 = v13;
        [MEMORY[0x189603FA8] array];
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageGraph activeNode](v34, "activeNode");
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          do
          {
            [v15 toDIShadowNode];
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 addObject:v16];

            uint64_t v17 = [v15 parent];

            uint64_t v15 = (void *)v17;
          }

          while (v17);
        }

        [v14 lastObject];
        int v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 removeLastObject];
        [v14 reverseObjectEnumerator];
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 allObjects];
        objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[DIBaseParams shadowChain](self, "shadowChain");
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        char v22 = [v21 addShadowNodes:v20 error:a3];

        if ((v22 & 1) != 0)
        {
          [v18 URL];
          v23 = (DIURL *)objc_claimAutoreleasedReturnValue();
          inputURL = self->_inputURL;
          self->_inputURL = v23;
        }
      }

      else
      {
        char v22 = 0;
      }

      goto LABEL_34;
    }

    if (DIDebugLogsEnabled())
    {
      int v27 = *__error();
      if (!DIForwardLogs())
      {
        getDIOSLog();
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68157954;
          int v38 = 38;
          __int16 v39 = 2080;
          v40 = "-[DIBaseParams tryResolvePstackChain:]";
          _os_log_impl(&dword_188046000, v31, OS_LOG_TYPE_DEBUG, "%.*s: Not a pstack", buf, 0x12u);
        }

        goto LABEL_32;
      }

      getDIOSLog();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
      *(_DWORD *)buf = 68157954;
      int v38 = 38;
      __int16 v39 = 2080;
      v40 = "-[DIBaseParams tryResolvePstackChain:]";
      v29 = (char *)_os_log_send_and_compose_impl();

      if (v29) {
        goto LABEL_14;
      }
      goto LABEL_32;
    }

    goto LABEL_33;
  }

  [v8 domain];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v25 isEqualToString:@"com.apple.DiskImages2.ErrorDomain"])
  {
    BOOL v26 = [v8 code] == 167;

    if (v26)
    {
      if (DIDebugLogsEnabled())
      {
        int v27 = *__error();
        if (!DIForwardLogs())
        {
          getDIOSLog();
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68157954;
            int v38 = 38;
            __int16 v39 = 2080;
            v40 = "-[DIBaseParams tryResolvePstackChain:]";
            _os_log_impl(&dword_188046000, v32, OS_LOG_TYPE_DEBUG, "%.*s: Not a pstack", buf, 0x12u);
          }

          goto LABEL_32;
        }

        getDIOSLog();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
        *(_DWORD *)buf = 68157954;
        int v38 = 38;
        __int16 v39 = 2080;
        v40 = "-[DIBaseParams tryResolvePstackChain:]";
        v29 = (char *)_os_log_send_and_compose_impl();

        if (v29)
        {
LABEL_14:
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v29);
          free(v29);
        }

- (BOOL)checkBeforeSetWithIsPassphrase:(BOOL)a3 error:(id *)a4
{
  BOOL v6 = @"Public key";
  if (a3) {
    BOOL v6 = @"Passphrase";
  }
  id v7 = v6;
  if (!-[DIBaseParams hasUnlockedBackend](self, "hasUnlockedBackend"))
  {
    if (-[DIBaseParams RAMdisk](self, "RAMdisk"))
    {
      [NSString stringWithFormat:@"A %@ cannot be specified for RAM disks", v7];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v10 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  150LL,  v9,  a4);
    }

    else
    {
      -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        BOOL v8 = 1;
        goto LABEL_11;
      }

      [NSString stringWithFormat:@"A %@ was specified, but the image file doesn't seem to be encrypted", v7];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v10 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  150LL,  v9,  a4);
    }

    BOOL v8 = v10;

    goto LABEL_11;
  }

  BOOL v8 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Too many calls to set, the image is already unlocked",  a4);
LABEL_11:

  return v8;
}

- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (-[DIBaseParams checkBeforeSetWithIsPassphrase:error:](self, "checkBeforeSetWithIsPassphrase:error:", 1LL))
  {
    -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = (void *)[v7 newWithPassphrase:a3 error:a4];
    BOOL v9 = v8 != 0LL;
    if (!v8)
    {
LABEL_19:

      return v9;
    }

    if (a3)
    {
      int v10 = *__error();
      if (!DIForwardLogs())
      {
        getDIOSLog();
        BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v20 = 36;
          __int16 v21 = 2080;
          char v22 = "-[DIBaseParams setPassphrase:error:]";
          _os_log_impl(&dword_188046000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: Passphrase is correct", buf, 0x12u);
        }

        goto LABEL_18;
      }

      getDIOSLog();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v20 = 36;
      __int16 v21 = 2080;
      char v22 = "-[DIBaseParams setPassphrase:error:]";
      LODWORD(v18) = 18;
      uint64_t v17 = buf;
      id v12 = (char *)_os_log_send_and_compose_impl();

      if (v12) {
        goto LABEL_10;
      }
    }

    else
    {
      int v10 = *__error();
      if (!DIForwardLogs())
      {
        getDIOSLog();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v20 = 36;
          __int16 v21 = 2080;
          char v22 = "-[DIBaseParams setPassphrase:error:]";
          _os_log_impl(&dword_188046000, v15, OS_LOG_TYPE_DEFAULT, "%.*s: Found certificate in keychain", buf, 0x12u);
        }

        goto LABEL_18;
      }

      getDIOSLog();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v20 = 36;
      __int16 v21 = 2080;
      char v22 = "-[DIBaseParams setPassphrase:error:]";
      LODWORD(v18) = 18;
      uint64_t v17 = buf;
      id v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
LABEL_10:
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v12);
        free(v12);
      }
    }

- (BOOL)tryUnlockUsingKeychainCertificateWithError:(id *)a3
{
  return -[DIBaseParams setPassphrase:error:](self, "setPassphrase:error:", 0LL, a3);
}

- (NSUUID)encryptionUUID
{
  if (*(void *)-[DIBaseParams cryptoHeader](self, "cryptoHeader")) {
    v3 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607AB8]),  "initWithUUIDBytes:",  *(void *)-[DIBaseParams cryptoHeader](self, "cryptoHeader") + 36);
  }
  else {
    v3 = 0LL;
  }
  return (NSUUID *)v3;
}

- (id)description
{
  v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@[%@]", v5, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)prepareImageWithXpcHandler:(id)a3 fileMode:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (!*(void *)-[DIBaseParams cryptoHeader](self, "cryptoHeader")
    || (v9 = -[DIEncryptionFrontend initWithParams:]( objc_alloc(&OBJC_CLASS___DIEncryptionUnlocker),  "initWithParams:",  self),  BOOL v10 = -[DIEncryptionUnlocker unlockWithXpcHandler:error:](v9, "unlockWithXpcHandler:error:", v8, a5),  v9,  v10))
  {
    -[DIBaseParams shadowChain](self, "shadowChain");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v11 isEmpty];

    if (v12)
    {
      -[DIBaseParams shadowChain](self, "shadowChain");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setShadowChain:v13];
    }

    else
    {
      if (a4 != 2)
      {
        -[DIBaseParams shadowChain](self, "shadowChain");
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 openWritable:1 createNonExisting:a4 != 3];
        v16 = -[DIBaseParams shadowChain](self, "shadowChain");
        -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 setShadowChain:v16];
      }

      -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 shadowChain];
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v20 = v19 == 0LL;

      if (v20)
      {
        -[DIBaseParams shadowChain](self, "shadowChain");
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 openWritable:0 createNonExisting:0];

        -[DIBaseParams shadowChain](self, "shadowChain");
        char v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 setShadowChain:v22];
      }
    }

    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)hasUnlockedBackend
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 backendXPC];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isUnlocked];

  return v4;
}

- (void)invalidate
{
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v5)
  {
    -[DIBaseParams deserializationError](self, "deserializationError");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5 == 0LL;
}

- (NSUUID)instanceID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 instanceID];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (unint64_t)rawBlockSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 blockSize];

  return v3;
}

- (void)setRawBlockSize:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBlockSize:a3];
}

- (BOOL)requiresRootDaemon
{
  v2 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  if (lpsrc)
  {
    if (v5)
    {
      BOOL v6 = v5;
      id v7 = v24;
      __int16 v21 = v5;
      char v22 = v24;
      if (v24)
      {
        id v8 = (unint64_t *)&v24->__shared_owners_;
        do
          unint64_t v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }

      if (FileDescriptor::is_mounted_on_smb(v5[5]))
      {
        char is_mounted_on_smb = (*((uint64_t (**)(FileDescriptor **))*v6 + 6))(v6);
        if (!v7) {
          goto LABEL_29;
        }
      }

      else
      {
        char is_mounted_on_smb = 0;
        if (!v7) {
          goto LABEL_29;
        }
      }

      v16 = (unint64_t *)&v7->__shared_owners_;
      do
        unint64_t v15 = __ldaxr(v16);
      while (__stlxr(v15 - 1, v16));
      goto LABEL_27;
    }
  }

  if (!lpsrc
  {
    char is_mounted_on_smb = 0;
    goto LABEL_29;
  }

  __int16 v21 = v11;
  char v22 = v24;
  if (v24)
  {
    int v12 = (unint64_t *)&v24->__shared_owners_;
    do
      unint64_t v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }

  char is_mounted_on_smb = FileDescriptor::is_mounted_on_smb((FileDescriptor *)(v11 + 3));
  id v7 = v22;
  if (v22)
  {
    BOOL v14 = (unint64_t *)&v22->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
LABEL_27:
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

- (unint64_t)readPassphraseFlags
{
  return self->_readPassphraseFlags;
}

- (void)setReadPassphraseFlags:(unint64_t)a3
{
  self->_readPassphraseFlags = a3;
}

- (DiskImageParamsXPC)diskImageParamsXPC
{
  return self->_diskImageParamsXPC;
}

- (void)setDiskImageParamsXPC:(id)a3
{
}

- (DIURL)inputURL
{
  return self->_inputURL;
}

- (void)setInputURL:(id)a3
{
}

- (DIShadowChain)shadowChain
{
  return self->_shadowChain;
}

- (BOOL)isPstack
{
  return self->_isPstack;
}

- (NSError)deserializationError
{
  return self->_deserializationError;
}

- (void)setDeserializationError:(id)a3
{
}

- (void).cxx_destruct
{
}

- (shared_ptr<Backend>)backend
{
  unint64_t v3 = v2;
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 backendXPC];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 backend];
  }

  else
  {
    void *v3 = 0LL;
    v3[1] = 0LL;
  }

  result.__cntrl_ = v7;
  result.__ptr_ = v6;
  return result;
}

- (void)cryptoHeader
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 backendXPC];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = (void *)[v3 cryptoHeader];

  return v4;
}

@end