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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___DiskImageParamsRAM_XPC, v3);
  char isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  return isKindOfClass & 1;
}

- (DIBaseParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___DIBaseParams;
  v5 = -[DIBaseParams init](&v28, "init");
  if (v5)
  {
    id v6 = [v4 decodeBoolForKey:@"debugLogsEnabled"];
    id v7 = [v4 decodeBoolForKey:@"forwardLogs"];
    sub_1000B8660((uint64_t)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 processName]);
    unsigned __int8 v10 = [v9 isEqualToString:@"diskimagesiod"];

    if ((v10 & 1) == 0) {
      sub_1000B8648((uint64_t)v7);
    }
    id v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIURL, v11), @"inputURL");
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    inputURL = v5->_inputURL;
    v5->_inputURL = (DIURL *)v13;

    id v16 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(DIShadowChain, v15),  @"shadowChain");
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    shadowChain = v5->_shadowChain;
    v5->_shadowChain = (DIShadowChain *)v17;

    v5->_readPassphraseFlags = (unint64_t)[v4 decodeIntegerForKey:@"readPassphraseFlags"];
    id v20 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(DiskImageParamsXPC, v19),  @"diskImageParams");
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    diskImageParamsXPC = v5->_diskImageParamsXPC;
    v5->_diskImageParamsXPC = (DiskImageParamsXPC *)v21;

    id v24 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSError, v23),  @"deserializationError");
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    deserializationError = v5->_deserializationError;
    v5->_deserializationError = (NSError *)v25;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeBool:sub_1000B866C() forKey:@"debugLogsEnabled"];
  [v8 encodeBool:sub_1000B8654() forKey:@"forwardLogs"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  [v8 encodeObject:v4 forKey:@"diskImageParams"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  [v8 encodeObject:v5 forKey:@"inputURL"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  [v8 encodeObject:v6 forKey:@"shadowChain"];

  objc_msgSend( v8,  "encodeInteger:forKey:",  -[DIBaseParams readPassphraseFlags](self, "readPassphraseFlags"),  @"readPassphraseFlags");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams deserializationError](self, "deserializationError"));
  [v8 encodeObject:v7 forKey:@"deserializationError"];
}

- (DIBaseParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DIBaseParams;
  id v7 = -[DIBaseParams init](&v17, "init");
  if (v7)
  {
    id v8 = +[DIURL newDIURLWithNSURL:](&OBJC_CLASS___DIURL, "newDIURLWithNSURL:", v6);
    inputURL = v7->_inputURL;
    v7->_inputURL = v8;

    v7->_readPassphraseFlags = 7LL;
    unsigned __int8 v10 = objc_alloc_init(&OBJC_CLASS___DIShadowChain);
    shadowChain = v7->_shadowChain;
    v7->_shadowChain = v10;

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL path](v7->_inputURL, "path"));
    if (!v12
      || (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  v6,  1LL)),  v13,  v12,  !v13))
    {
      v14 = (DIBaseParams *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  22LL,  @"Malformed URL format",  a4));
      goto LABEL_9;
    }

    if (!-[DIBaseParams tryResolvePstackChain:](v7, "tryResolvePstackChain:", a4))
    {
      uint64_t v15 = 0LL;
      goto LABEL_10;
    }

    if (-[DIBaseParams isPstack](v7, "isPstack") && !-[DIBaseParams supportsPstack](v7, "supportsPstack"))
    {
      v14 = (DIBaseParams *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"This operation doesn't support pstack files",  a4));
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
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));

  if (v7)
  {
    int v8 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v21 = 0LL;
      uint64_t v9 = sub_1000B85DC();
      unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v11 = 3LL;
      }
      else {
        uint64_t v11 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v23 = 49;
      __int16 v24 = 2080;
      uint64_t v25 = "-[DIBaseParams openExistingImageWithFlags:error:]";
      LODWORD(v20) = 18;
      id v12 = (char *)_os_log_send_and_compose_impl( v11,  &v21,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%.*s: Using existing disk image params",  (int)buf,  v20);

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }

    else
    {
      uint64_t v17 = sub_1000B85DC();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v23 = 49;
        __int16 v24 = 2080;
        uint64_t v25 = "-[DIBaseParams openExistingImageWithFlags:error:]";
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%.*s: Using existing disk image params",  buf,  0x12u);
      }
    }

    *__error() = v8;
    return 1;
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
    id v14 = +[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]( &OBJC_CLASS___DiskImageParamsXPC,  "newWithURL:fileOpenFlags:error:",  v13,  v5,  a4);
    -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v14);

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    BOOL v16 = v15 != 0LL;
  }

  return v16;
}

- (BOOL)supportsPstack
{
  return 1;
}

- (BOOL)tryResolvePstackChain:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  id v43 = 0LL;
  id v44 = 0LL;
  unsigned __int8 v6 = +[DiskImageGraph loadPlistDictFromURL:dict:error:]( &OBJC_CLASS___DiskImageGraph,  "loadPlistDictFromURL:dict:error:",  v5,  &v44,  &v43);
  id v7 = v44;
  id v8 = v43;

  if ((v6 & 1) != 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"PstackVersion"]);
    BOOL v10 = v9 == 0LL;

    if (!v10)
    {
      self->_isPstack = 1;
      uint64_t v11 = objc_alloc(&OBJC_CLASS___DiskImageGraph);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
      uint64_t v13 = -[DiskImageGraph initWithData:pstackURL:imported:error:]( v11,  "initWithData:pstackURL:imported:error:",  v7,  v12,  0LL,  a3);

      if (v13)
      {
        v41 = v13;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph activeNode](v41, "activeNode"));
        if (v15)
        {
          do
          {
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 toDIShadowNode]);
            [v14 addObject:v16];

            uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 parent]);
            uint64_t v15 = (void *)v17;
          }

          while (v17);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue([v14 lastObject]);
        [v14 removeLastObject];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 reverseObjectEnumerator]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allObjects]);

        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
        unsigned __int8 v22 = [v21 addShadowNodes:v20 error:a3];

        if ((v22 & 1) != 0)
        {
          int v23 = (DIURL *)objc_claimAutoreleasedReturnValue([v18 URL]);
          inputURL = self->_inputURL;
          self->_inputURL = v23;
        }
      }

      else
      {
        unsigned __int8 v22 = 0;
      }

      goto LABEL_40;
    }

    if (sub_1000B866C())
    {
      int v27 = *__error();
      if (!sub_1000B8654())
      {
        uint64_t v35 = sub_1000B85DC();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68157954;
          int v46 = 38;
          __int16 v47 = 2080;
          v48 = "-[DIBaseParams tryResolvePstackChain:]";
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%.*s: Not a pstack", buf, 0x12u);
        }

        goto LABEL_38;
      }

      uint64_t v42 = 0LL;
      uint64_t v32 = sub_1000B85DC();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        uint64_t v34 = 3LL;
      }
      else {
        uint64_t v34 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v46 = 38;
      __int16 v47 = 2080;
      v48 = "-[DIBaseParams tryResolvePstackChain:]";
      LODWORD(v40) = 18;
      v31 = (char *)_os_log_send_and_compose_impl( v34,  &v42,  0LL,  0LL,  &_mh_execute_header,  v33,  2LL,  "%.*s: Not a pstack",  (int)buf,  v40);

      if (v31) {
        goto LABEL_17;
      }
      goto LABEL_38;
    }

    goto LABEL_39;
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if ([v25 isEqualToString:@"com.apple.DiskImages2.ErrorDomain"])
  {
    BOOL v26 = [v8 code] == (id)167;

    if (v26)
    {
      if (sub_1000B866C())
      {
        int v27 = *__error();
        if (!sub_1000B8654())
        {
          uint64_t v37 = sub_1000B85DC();
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68157954;
            int v46 = 38;
            __int16 v47 = 2080;
            v48 = "-[DIBaseParams tryResolvePstackChain:]";
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%.*s: Not a pstack", buf, 0x12u);
          }

          goto LABEL_38;
        }

        uint64_t v42 = 0LL;
        uint64_t v28 = sub_1000B85DC();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          uint64_t v30 = 3LL;
        }
        else {
          uint64_t v30 = 2LL;
        }
        *(_DWORD *)buf = 68157954;
        int v46 = 38;
        __int16 v47 = 2080;
        v48 = "-[DIBaseParams tryResolvePstackChain:]";
        LODWORD(v40) = 18;
        v31 = (char *)_os_log_send_and_compose_impl( v30,  &v42,  0LL,  0LL,  &_mh_execute_header,  v29,  2LL,  "%.*s: Not a pstack",  (int)buf,  v40);

        if (v31)
        {
LABEL_17:
          fprintf(__stderrp, "%s\n", v31);
          free(v31);
        }

- (BOOL)checkBeforeSetWithIsPassphrase:(BOOL)a3 error:(id *)a4
{
  unsigned __int8 v6 = @"Public key";
  if (a3) {
    unsigned __int8 v6 = @"Passphrase";
  }
  id v7 = v6;
  if (!-[DIBaseParams hasUnlockedBackend](self, "hasUnlockedBackend"))
  {
    if (-[DIBaseParams RAMdisk](self, "RAMdisk"))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A %@ cannot be specified for RAM disks",  v7));
      unsigned __int8 v10 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  150LL,  v9,  a4);
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___DiskImageParamsLocked_XPC, v12);
      char isKindOfClass = objc_opt_isKindOfClass(v11, v13);

      if ((isKindOfClass & 1) != 0)
      {
        BOOL v8 = 1;
        goto LABEL_11;
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A %@ was specified, but the image file doesn't seem to be encrypted",  v7));
      unsigned __int8 v10 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  150LL,  v9,  a4);
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
  if (-[DIBaseParams checkBeforeSetWithIsPassphrase:error:](self, "checkBeforeSetWithIsPassphrase:error:", 1LL))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    id v8 = [v7 newWithPassphrase:a3 error:a4];
    BOOL v9 = v8 != 0LL;
    if (!v8)
    {
LABEL_25:

      return v9;
    }

    if (a3)
    {
      int v10 = *__error();
      if (!sub_1000B8654())
      {
        uint64_t v18 = sub_1000B85DC();
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v26 = 36;
          __int16 v27 = 2080;
          uint64_t v28 = "-[DIBaseParams setPassphrase:error:]";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%.*s: Passphrase is correct", buf, 0x12u);
        }

        goto LABEL_24;
      }

      uint64_t v24 = 0LL;
      uint64_t v11 = sub_1000B85DC();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v13 = 3LL;
      }
      else {
        uint64_t v13 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v26 = 36;
      __int16 v27 = 2080;
      uint64_t v28 = "-[DIBaseParams setPassphrase:error:]";
      LODWORD(v23) = 18;
      id v14 = (char *)_os_log_send_and_compose_impl( v13,  &v24,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%.*s: Passphrase is correct",  (int)buf,  v23);

      if (v14) {
        goto LABEL_16;
      }
    }

    else
    {
      int v10 = *__error();
      if (!sub_1000B8654())
      {
        uint64_t v20 = sub_1000B85DC();
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v26 = 36;
          __int16 v27 = 2080;
          uint64_t v28 = "-[DIBaseParams setPassphrase:error:]";
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%.*s: Found certificate in keychain",  buf,  0x12u);
        }

        goto LABEL_24;
      }

      uint64_t v24 = 0LL;
      uint64_t v15 = sub_1000B85DC();
      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = 3LL;
      }
      else {
        uint64_t v17 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v26 = 36;
      __int16 v27 = 2080;
      uint64_t v28 = "-[DIBaseParams setPassphrase:error:]";
      LODWORD(v23) = 18;
      id v14 = (char *)_os_log_send_and_compose_impl( v17,  &v24,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%.*s: Found certificate in keychain",  (int)buf,  v23);

      if (v14)
      {
LABEL_16:
        fprintf(__stderrp, "%s\n", v14);
        free(v14);
      }
    }

- (BOOL)tryUnlockUsingKeychainCertificateWithError:(id *)a3
{
  return -[DIBaseParams setPassphrase:error:](self, "setPassphrase:error:", 0LL, a3);
}

- (NSUUID)encryptionUUID
{
  if (*(void *)-[DIBaseParams cryptoHeader](self, "cryptoHeader")) {
    uint64_t v3 = -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  *(void *)-[DIBaseParams cryptoHeader](self, "cryptoHeader") + 36LL);
  }
  else {
    uint64_t v3 = 0LL;
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@[%@]", v5, v6));

  return v7;
}

- (BOOL)prepareImageWithXpcHandler:(id)a3 fileMode:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (!*(void *)-[DIBaseParams cryptoHeader](self, "cryptoHeader")
    || (v9 = -[DIEncryptionFrontend initWithParams:]( objc_alloc(&OBJC_CLASS___DIEncryptionUnlocker),  "initWithParams:",  self),  unsigned int v10 = -[DIEncryptionUnlocker unlockWithXpcHandler:error:](v9, "unlockWithXpcHandler:error:", v8, a5),  v9,  v10))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
    unsigned int v12 = [v11 isEmpty];

    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      [v14 setShadowChain:v13];
    }

    else
    {
      if (a4 != 2)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
        [v15 openWritable:1 createNonExisting:a4 != 3];

        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
        [v17 setShadowChain:v16];
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 shadowChain]);
      BOOL v20 = v19 == 0LL;

      if (v20)
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
        [v21 openWritable:0 createNonExisting:0];

        unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
        int v23 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
        [v23 setShadowChain:v22];
      }
    }

    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)hasUnlockedBackend
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 backendXPC]);
  unsigned __int8 v4 = [v3 isUnlocked];

  return v4;
}

- (void)invalidate
{
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams deserializationError](self, "deserializationError"));

  if (a3 && v5) {
    *a3 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams deserializationError](self, "deserializationError"));
  }
  return v5 == 0LL;
}

- (NSUUID)instanceID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 instanceID]);

  return (NSUUID *)v3;
}

- (unint64_t)rawBlockSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  id v3 = [v2 blockSize];

  return (unint64_t)v3;
}

- (void)setRawBlockSize:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
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
      unsigned __int8 v6 = v5;
      id v7 = v24;
      uint64_t v21 = v5;
      unsigned __int8 v22 = v24;
      if (v24)
      {
        id v8 = (unint64_t *)&v24->__shared_owners_;
        do
          unint64_t v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }

      if (sub_1000457D0(v5[5]))
      {
        char v10 = (*(uint64_t (**)(void *))(*v6 + 48LL))(v6);
        if (!v7) {
          goto LABEL_29;
        }
      }

      else
      {
        char v10 = 0;
        if (!v7) {
          goto LABEL_29;
        }
      }

      BOOL v16 = (unint64_t *)&v7->__shared_owners_;
      do
        unint64_t v15 = __ldaxr(v16);
      while (__stlxr(v15 - 1, v16));
      goto LABEL_27;
    }
  }

  if (!lpsrc
  {
    char v10 = 0;
    goto LABEL_29;
  }

  uint64_t v21 = v11;
  unsigned __int8 v22 = v24;
  if (v24)
  {
    unsigned int v12 = (unint64_t *)&v24->__shared_owners_;
    do
      unint64_t v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }

  char v10 = sub_1000457D0((uint64_t)(v11 + 3));
  id v7 = v22;
  if (v22)
  {
    id v14 = (unint64_t *)&v22->__shared_owners_;
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
  id v3 = v2;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 backendXPC]);
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 backend];
  }

  else
  {
    *id v3 = 0LL;
    v3[1] = 0LL;
  }

  result.__cntrl_ = v7;
  result.__ptr_ = v6;
  return result;
}

- (void)cryptoHeader
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 backendXPC]);
  id v4 = [v3 cryptoHeader];

  return v4;
}

@end