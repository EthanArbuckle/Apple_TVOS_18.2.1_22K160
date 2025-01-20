@interface DICreateParams
+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5;
+ (BOOL)eraseIfExistingWithURL:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)createDiskImageParamsWithError:(id *)a3;
- (BOOL)createEncryptionWithXPCHandler:(id)a3 error:(id *)a4;
- (BOOL)createWithError:(id *)a3;
- (BOOL)getCertificateWithEncryptionCreator:(id)a3 outCertificate:(id *)a4 error:(id *)a5;
- (BOOL)onErrorCleanup;
- (BOOL)passphrase;
- (BOOL)resizeWithNumBlocks:(unint64_t)a3 error:(id *)a4;
- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4;
- (BOOL)supportsPstack;
- (BOOL)tryCreateUsingKeychainCertificateWithError:(id *)a3;
- (DICreateParams)initWithCoder:(id)a3;
- (DICreateParams)initWithURL:(id)a3 error:(id *)a4;
- (DICreateParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5;
- (NSString)certificate;
- (NSString)publicKey;
- (NSString)systemKeychainAccount;
- (unint64_t)encryptionMethod;
- (unint64_t)numBlocks;
- (void)createDiskImageParamsXPC;
- (void)encodeWithCoder:(id)a3;
- (void)setCertificate:(id)a3;
- (void)setEncryptionMethod:(unint64_t)a3;
- (void)setNumBlocks:(unint64_t)a3;
- (void)setPassphrase:(BOOL)a3;
- (void)setPublicKey:(id)a3;
- (void)setSystemKeychainAccount:(id)a3;
@end

@implementation DICreateParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DICreateParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DICreateParams;
  result = -[DIBaseParams initWithURL:error:](&v7, "initWithURL:error:", a3, a5);
  if (result) {
    result->_numBlocks = a4;
  }
  return result;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (DICreateParams)initWithURL:(id)a3 error:(id *)a4
{
  return -[DICreateParams initWithURL:numBlocks:error:](self, "initWithURL:numBlocks:error:", a3, 0LL, a4);
}

- (DICreateParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DICreateParams;
  v5 = -[DIBaseParams initWithCoder:](&v15, "initWithCoder:", v4);
  if (v5)
  {
    v5->_numBlocks = (unint64_t)[v4 decodeInt64ForKey:@"numBlocks"];
    v5->_encryptionMethod = (unint64_t)[v4 decodeIntegerForKey:@"encryptionMethod"];
    v5->_passphrase = [v4 decodeBoolForKey:@"passphrase"];
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v6), @"publicKey");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"certificate");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    certificate = v5->_certificate;
    v5->_certificate = (NSString *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DICreateParams;
  -[DIBaseParams encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[DICreateParams numBlocks](self, "numBlocks"), @"numBlocks");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DICreateParams encryptionMethod](self, "encryptionMethod"),  @"encryptionMethod");
  objc_msgSend(v4, "encodeBool:forKey:", -[DICreateParams passphrase](self, "passphrase"), @"passphrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams publicKey](self, "publicKey"));
  [v4 encodeObject:v5 forKey:@"publicKey"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams certificate](self, "certificate"));
  [v4 encodeObject:v6 forKey:@"certificate"];
}

- (BOOL)getCertificateWithEncryptionCreator:(id)a3 outCertificate:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  if (!a4)
  {
    LOBYTE(a5) = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Invalid certificate out argument",  a5);
    goto LABEL_6;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams certificate](self, "certificate"));

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams certificate](self, "certificate"));
    *a4 = (id)objc_claimAutoreleasedReturnValue([v8 getCertificateWithCertificatePath:v10 error:a5]);

LABEL_4:
    LOBYTE(a5) = 1;
    goto LABEL_6;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams publicKey](self, "publicKey"));

  if (!v12) {
    goto LABEL_4;
  }
  id v13 = objc_claimAutoreleasedReturnValue(-[DICreateParams publicKey](self, "publicKey"));
  sub_1001208D8((char *)[v13 UTF8String], &v17, &__p);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", __p, v17));
  a5 = (id *)(id)objc_claimAutoreleasedReturnValue([v8 getCertificateWithPublicKey:v14 error:a5]);
  *a4 = a5;

  objc_super v15 = __p;
  __p = 0LL;
  if (v15) {
    operator delete[](v15);
  }
  if (a5) {
    goto LABEL_4;
  }
LABEL_6:

  return (char)a5;
}

- (BOOL)createEncryptionWithXPCHandler:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[DICreateParams encryptionMethod](self, "encryptionMethod"))
  {
    if ((id)-[DICreateParams encryptionMethod](self, "encryptionMethod") == (id)2) {
      int v7 = 256;
    }
    else {
      int v7 = 128;
    }
    sub_10008E0C0(&v19, v7);
    id v8 = operator new(0x4CuLL);
    int v20 = v19;
    sub_100114D60(v8, &v20);
    v9 = -[DIBaseParams cryptoHeader](self, "cryptoHeader");
    uint64_t v10 = *v9;
    void *v9 = v8;
    if (v10) {
      operator delete(v10);
    }
    id v11 = -[DIEncryptionFrontend initWithParams:]( objc_alloc(&OBJC_CLASS___DIEncryptionCreator),  "initWithParams:",  self);
    if (-[DICreateParams passphrase](self, "passphrase")) {
      goto LABEL_8;
    }
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams publicKey](self, "publicKey"));
    if (v15)
    {
    }

    else
    {
      size_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams certificate](self, "certificate"));

      if (!v17)
      {
LABEL_8:
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams systemKeychainAccount](self, "systemKeychainAccount"));

        if (v12)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams systemKeychainAccount](self, "systemKeychainAccount"));
          unsigned __int8 v14 = [v6 createAndStoreInSystemKeychainWithCreator:v11 account:v13 error:a4];

LABEL_17:
          goto LABEL_18;
        }

        unsigned __int8 v16 = -[DIEncryptionCreator createWithXpcHandler:error:](v11, "createWithXpcHandler:error:", v6, a4);
LABEL_16:
        unsigned __int8 v14 = v16;
        goto LABEL_17;
      }
    }

    unsigned __int8 v16 = -[DICreateParams tryCreateUsingKeychainCertificateWithError:]( self,  "tryCreateUsingKeychainCertificateWithError:",  a4);
    goto LABEL_16;
  }

  unsigned __int8 v14 = 1;
LABEL_18:

  return v14;
}

- (void)createDiskImageParamsXPC
{
  exception = __cxa_allocate_exception(0x40uLL);
  v3 = (void *)sub_100004494( (uint64_t)exception,  (uint64_t)"Invalid argument, please use one of the DICreateParams derived classes instead",  0x16u);
}

- (BOOL)createDiskImageParamsWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  unsigned __int8 v6 = [v5 isFileURL];

  if ((v6 & 1) == 0) {
    return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"URL must have a file scheme",  a3);
  }
  int v7 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v22 = 0LL;
    uint64_t v8 = sub_1000BE278();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
    if (v10) {
      uint64_t v12 = 3LL;
    }
    else {
      uint64_t v12 = 2LL;
    }
    *(_DWORD *)buf = 68158211;
    int v24 = 49;
    __int16 v25 = 2080;
    v26 = "-[DICreateParams createDiskImageParamsWithError:]";
    __int16 v27 = 2113;
    v28 = v11;
    id v13 = (char *)_os_log_send_and_compose_impl( v12,  &v22,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%.*s: entry with %{private}@",  buf,  28);

    if (v13)
    {
      fprintf(__stderrp, "%s\n", v13);
      free(v13);
    }
  }

  else
  {
    uint64_t v15 = sub_1000BE278();
    unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      size_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
      *(_DWORD *)buf = 68158211;
      int v24 = 49;
      __int16 v25 = 2080;
      v26 = "-[DICreateParams createDiskImageParamsWithError:]";
      __int16 v27 = 2113;
      v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%.*s: entry with %{private}@", buf, 0x1Cu);
    }
  }

  *__error() = v7;
  uint64_t v19 = objc_opt_class(self, v18);
  int v20 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  LOBYTE(v19) = [(id)v19 eraseIfExistingWithURL:v20 error:a3];

  if ((v19 & 1) == 0) {
    return 0;
  }
  -[DICreateParams createDiskImageParamsXPC](self, "createDiskImageParamsXPC");
  return 1;
}

- (BOOL)createWithError:(id *)a3
{
  if (!-[DICreateParams numBlocks](self, "numBlocks")) {
    return +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  @"Invalid size requested for the new image",  a3);
  }
  if (-[DICreateParams createDiskImageParamsWithError:](self, "createDiskImageParamsWithError:", a3))
  {
    if (!-[DICreateParams encryptionMethod](self, "encryptionMethod")) {
      return -[DICreateParams resizeWithNumBlocks:error:]( self,  "resizeWithNumBlocks:error:",  -[DICreateParams numBlocks](self, "numBlocks"),  a3);
    }
    v5 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
    if (-[DIClient2Controller_XPCHandler connectWithError:](v5, "connectWithError:", a3)
      && -[DICreateParams createEncryptionWithXPCHandler:error:](self, "createEncryptionWithXPCHandler:error:", v5, a3))
    {

      return -[DICreateParams resizeWithNumBlocks:error:]( self,  "resizeWithNumBlocks:error:",  -[DICreateParams numBlocks](self, "numBlocks"),  a3);
    }
  }

  return 0;
}

- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4
{
  int v7 = -[DIEncryptionFrontend initWithParams:](objc_alloc(&OBJC_CLASS___DIEncryptionCreator), "initWithParams:", self);
  id v15 = 0LL;
  unsigned __int8 v8 = -[DICreateParams getCertificateWithEncryptionCreator:outCertificate:error:]( self,  "getCertificateWithEncryptionCreator:outCertificate:error:",  v7,  &v15,  a4);
  id v9 = v15;
  if ((v8 & 1) != 0)
  {
    unsigned int v10 = -[DICreateParams passphrase](self, "passphrase");
    if (v9) {
      int v11 = v10;
    }
    else {
      int v11 = 1;
    }
    if (v11 != 1 || a3 && *a3)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      unsigned __int8 v13 = [v12 makeNewImageEncryptedWithPassphrase:a3 certificate:v9 error:a4];
    }

    else
    {
      unsigned __int8 v13 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  @"Passphrase cannot be empty",  a4);
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (BOOL)tryCreateUsingKeychainCertificateWithError:(id *)a3
{
  return -[DICreateParams setPassphrase:error:](self, "setPassphrase:error:", 0LL, a3);
}

- (BOOL)resizeWithNumBlocks:(unint64_t)a3 error:(id *)a4
{
  uint64_t v31 = 0LL;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  id v9 = [v8 shouldValidate];
  if (v7)
  {
    [v7 createDiskImageWithCache:0 shadowValidation:v9];
    uint64_t v10 = *(void *)buf;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v31 = v10;
  *(void *)buf = 0LL;

  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v31 + 24LL))(v31);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  id v13 = [v12 setSizeWithDiskImage:&v31 newSize:v11 * a3];

  if ((_DWORD)v13)
  {
    BOOL v14 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  v13,  @"Failed to resize the image",  a4);
    goto LABEL_20;
  }

  -[DICreateParams setNumBlocks:]( self,  "setNumBlocks:",  (*(uint64_t (**)(uint64_t))(*(void *)v31 + 32LL))(v31));
  unint64_t v15 = -[DICreateParams numBlocks](self, "numBlocks");
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v31 + 24LL))(v31);
  int v17 = *__error();
  unint64_t v18 = v16 * v15;
  if (sub_1000BE2F0())
  {
    uint64_t v30 = 0LL;
    uint64_t v19 = sub_1000BE278();
    int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v21 = 3LL;
    }
    else {
      uint64_t v21 = 2LL;
    }
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&uint8_t buf[4] = 44;
    __int16 v33 = 2080;
    v34 = "-[DICreateParams resizeWithNumBlocks:error:]";
    __int16 v35 = 2048;
    unint64_t v36 = v18;
    LODWORD(v29) = 28;
    uint64_t v22 = (char *)_os_log_send_and_compose_impl( v21,  &v30,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "%.*s: Disk image resized to %llu bytes",  (int)buf,  v29);

    if (v22)
    {
      fprintf(__stderrp, "%s\n", v22);
      free(v22);
    }
  }

  else
  {
    uint64_t v23 = sub_1000BE278();
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 44;
      __int16 v33 = 2080;
      v34 = "-[DICreateParams resizeWithNumBlocks:error:]";
      __int16 v35 = 2048;
      unint64_t v36 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%.*s: Disk image resized to %llu bytes",  buf,  0x1Cu);
    }
  }

  *__error() = v17;
  __int16 v25 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 136LL))(v31);
  uint64_t v26 = sub_1000144E8(v25);
  if (!(_DWORD)v26)
  {
    BOOL v14 = 1;
    if (!v25) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  BOOL v14 = +[DIError failWithPOSIXCode:error:](&OBJC_CLASS___DIError, "failWithPOSIXCode:error:", v26, a4);
  if (v25) {
LABEL_19:
  }
    (*(void (**)(void *))(*v25 + 40LL))(v25);
LABEL_20:
  uint64_t v27 = v31;
  uint64_t v31 = 0LL;
  if (v27) {
    (*(void (**)(uint64_t))(*(void *)v27 + 16LL))(v27);
  }
  return v14;
}

+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  if (a4) {
    return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  21LL,  @"The requested URL is an existing folder",  a5);
  }
  else {
    return 1;
  }
}

+ (BOOL)eraseIfExistingWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  unsigned int v9 = [v7 fileExistsAtPath:v8 isDirectory:&v29];

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    unsigned __int8 v12 = [v10 isWritableFileAtPath:v11];

    if ((v12 & 1) != 0)
    {
      BOOL v14 = (void *)objc_opt_class(a1, v13);
      if ([v14 checkExistingFileWithURL:v6 isDirectory:v29 error:a4])
      {
        int v15 = *__error();
        if (sub_1000BE2F0())
        {
          uint64_t v28 = 0LL;
          uint64_t v16 = sub_1000BE278();
          int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
          if (v18) {
            uint64_t v20 = 3LL;
          }
          else {
            uint64_t v20 = 2LL;
          }
          *(_DWORD *)buf = 68158211;
          int v31 = 47;
          __int16 v32 = 2080;
          __int16 v33 = "+[DICreateParams eraseIfExistingWithURL:error:]";
          __int16 v34 = 2113;
          __int16 v35 = v19;
          uint64_t v21 = (char *)_os_log_send_and_compose_impl( v20,  &v28,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "%.*s: Erasing %{private}@",  buf,  28);

          if (v21)
          {
            fprintf(__stderrp, "%s\n", v21);
            free(v21);
          }
        }

        else
        {
          uint64_t v23 = sub_1000BE278();
          int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
            *(_DWORD *)buf = 68158211;
            int v31 = 47;
            __int16 v32 = 2080;
            __int16 v33 = "+[DICreateParams eraseIfExistingWithURL:error:]";
            __int16 v34 = 2113;
            __int16 v35 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%.*s: Erasing %{private}@", buf, 0x1Cu);
          }
        }

        *__error() = v15;
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned __int8 v22 = [v26 removeItemAtURL:v6 error:a4];
      }

      else
      {
        unsigned __int8 v22 = 0;
      }
    }

    else
    {
      unsigned __int8 v22 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  13LL,  @"Image does not have write permissions",  a4);
    }
  }

  else
  {
    unsigned __int8 v22 = 1;
  }

  return v22;
}

- (BOOL)onErrorCleanup
{
  int v3 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v19 = 0LL;
    uint64_t v4 = sub_1000BE278();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v6 = 3LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
    *(_DWORD *)buf = 68158211;
    int v21 = 32;
    __int16 v22 = 2080;
    uint64_t v23 = "-[DICreateParams onErrorCleanup]";
    __int16 v24 = 2113;
    __int16 v25 = v8;
    int v18 = 28;
    unsigned int v9 = (char *)_os_log_send_and_compose_impl( v6,  &v19,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "%.*s: Creation failed, erasing %{private}@",  buf,  v18);

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }

  else
  {
    uint64_t v10 = sub_1000BE278();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
      *(_DWORD *)buf = 68158211;
      int v21 = 32;
      __int16 v22 = 2080;
      uint64_t v23 = "-[DICreateParams onErrorCleanup]";
      __int16 v24 = 2113;
      __int16 v25 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%.*s: Creation failed, erasing %{private}@",  buf,  0x1Cu);
    }
  }

  *__error() = v3;
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  unsigned __int8 v16 = [v14 removeItemAtURL:v15 error:0];

  return v16;
}

- (unint64_t)encryptionMethod
{
  return self->_encryptionMethod;
}

- (void)setEncryptionMethod:(unint64_t)a3
{
  self->_encryptionMethod = a3;
}

- (NSString)systemKeychainAccount
{
  return self->_systemKeychainAccount;
}

- (void)setSystemKeychainAccount:(id)a3
{
}

- (BOOL)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(BOOL)a3
{
  self->_passphrase = a3;
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSString)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (unint64_t)numBlocks
{
  return self->_numBlocks;
}

- (void)setNumBlocks:(unint64_t)a3
{
  self->_numBlocks = a3;
}

- (void).cxx_destruct
{
}

@end