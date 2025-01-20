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

- (DICreateParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DICreateParams;
  result = -[DIBaseParams initWithURL:error:](&v7, sel_initWithURL_error_, a3, a5);
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
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DICreateParams;
  v5 = -[DIBaseParams initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_numBlocks = [v4 decodeInt64ForKey:@"numBlocks"];
    v5->_encryptionMethod = [v4 decodeIntegerForKey:@"encryptionMethod"];
    v5->_passphrase = [v4 decodeBoolForKey:@"passphrase"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"certificate"];
    certificate = v5->_certificate;
    v5->_certificate = (NSString *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DICreateParams;
  -[DIBaseParams encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[DICreateParams numBlocks](self, "numBlocks"), @"numBlocks");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DICreateParams encryptionMethod](self, "encryptionMethod"),  @"encryptionMethod");
  objc_msgSend(v4, "encodeBool:forKey:", -[DICreateParams passphrase](self, "passphrase"), @"passphrase");
  v5 = -[DICreateParams publicKey](self, "publicKey");
  [v4 encodeObject:v5 forKey:@"publicKey"];

  -[DICreateParams certificate](self, "certificate");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
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
  v9 = -[DICreateParams certificate](self, "certificate");
  if (v9)
  {
    v10 = -[DICreateParams certificate](self, "certificate");
    [v8 getCertificateWithCertificatePath:v10 error:a5];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_4:
    LOBYTE(a5) = 1;
    goto LABEL_6;
  }
  v12 = -[DICreateParams publicKey](self, "publicKey");
  if (!v12) {
    goto LABEL_4;
  }
  id v13 = -[DICreateParams publicKey](self, "publicKey");
  convertHexToBytes((char *)[v13 UTF8String], &v17, &__p);

  [MEMORY[0x189603F48] dataWithBytes:__p length:v17];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 getCertificateWithPublicKey:v14 error:a5];
  a5 = (id *)(id)objc_claimAutoreleasedReturnValue();
  *a4 = a5;

  v15 = __p;
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
    if (-[DICreateParams encryptionMethod](self, "encryptionMethod") == 2) {
      int v7 = 256;
    }
    else {
      int v7 = 128;
    }
    crypto::header::encryption_key_bits_size_t::encryption_key_bits_size_t(&v19, v7);
    id v8 = operator new(0x4CuLL);
    int v20 = v19;
    crypto::header::header(v8, &v20);
    v9 = -[DIBaseParams cryptoHeader](self, "cryptoHeader");
    v10 = *v9;
    void *v9 = v8;
    if (v10) {
      operator delete(v10);
    }
    objc_super v11 = -[DIEncryptionFrontend initWithParams:]( objc_alloc(&OBJC_CLASS___DIEncryptionCreator),  "initWithParams:",  self);
    if (-[DICreateParams passphrase](self, "passphrase")) {
      goto LABEL_8;
    }
    v15 = -[DICreateParams publicKey](self, "publicKey");
    if (v15)
    {
    }

    else
    {
      -[DICreateParams certificate](self, "certificate");
      unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
LABEL_8:
        v12 = -[DICreateParams systemKeychainAccount](self, "systemKeychainAccount");
        if (v12)
        {
          -[DICreateParams systemKeychainAccount](self, "systemKeychainAccount");
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          char v14 = [v6 createAndStoreInSystemKeychainWithCreator:v11 account:v13 error:a4];

LABEL_17:
          goto LABEL_18;
        }

        char v16 = -[DIEncryptionCreator createWithXpcHandler:error:](v11, "createWithXpcHandler:error:", v6, a4);
LABEL_16:
        char v14 = v16;
        goto LABEL_17;
      }
    }

    char v16 = -[DICreateParams tryCreateUsingKeychainCertificateWithError:]( self,  "tryCreateUsingKeychainCertificateWithError:",  a4);
    goto LABEL_16;
  }

  char v14 = 1;
LABEL_18:

  return v14;
}

- (void)createDiskImageParamsXPC
{
  exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
  DiskImagesRuntimeException::DiskImagesRuntimeException( exception,  "Invalid argument, please use one of the DICreateParams derived classes instead",  0x16u);
}

- (BOOL)createDiskImageParamsWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v5 = -[DIBaseParams inputURL](self, "inputURL");
  char v6 = [v5 isFileURL];

  if ((v6 & 1) == 0) {
    return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"URL must have a file scheme",  a3);
  }
  int v7 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    -[DIBaseParams inputURL](self, "inputURL");
    *(_DWORD *)buf = 68158211;
    int v17 = 49;
    __int16 v18 = 2080;
    int v19 = "-[DICreateParams createDiskImageParamsWithError:]";
    __int16 v20 = 2113;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v9);
    }
  }

  else
  {
    getDIOSLog();
    objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[DIBaseParams inputURL](self, "inputURL");
      *(_DWORD *)buf = 68158211;
      int v17 = 49;
      __int16 v18 = 2080;
      int v19 = "-[DICreateParams createDiskImageParamsWithError:]";
      __int16 v20 = 2113;
      id v21 = v12;
      _os_log_impl(&dword_188046000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry with %{private}@", buf, 0x1Cu);
    }
  }

  *__error() = v7;
  uint64_t v13 = objc_opt_class();
  -[DIBaseParams inputURL](self, "inputURL");
  char v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = [(id)v13 eraseIfExistingWithURL:v14 error:a3];

  if ((v13 & 1) == 0) {
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
  BOOL v8 = -[DICreateParams getCertificateWithEncryptionCreator:outCertificate:error:]( self,  "getCertificateWithEncryptionCreator:outCertificate:error:",  v7,  &v15,  a4);
  id v9 = v15;
  if (v8)
  {
    BOOL v10 = -[DICreateParams passphrase](self, "passphrase");
    if (v9) {
      int v11 = v10;
    }
    else {
      int v11 = 1;
    }
    if (v11 != 1 || a3 && *a3)
    {
      v12 = -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      char v13 = [v12 makeNewImageEncryptedWithPassphrase:a3 certificate:v9 error:a4];
    }

    else
    {
      char v13 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  @"Passphrase cannot be empty",  a4);
    }
  }

  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)tryCreateUsingKeychainCertificateWithError:(id *)a3
{
  return -[DICreateParams setPassphrase:error:](self, "setPassphrase:error:", 0LL, a3);
}

- (BOOL)resizeWithNumBlocks:(unint64_t)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  -[DICreateParams setNumBlocks:](self, "setNumBlocks:");
  uint64_t v26 = 0LL;
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseParams shadowChain](self, "shadowChain");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 shouldValidate];
  if (v7)
  {
    [v7 createDiskImageWithCache:0 shadowValidation:v9];
    uint64_t v10 = *(void *)buf;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v26 = v10;
  *(void *)buf = 0LL;

  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v26 + 24LL))(v26);
  v12 = -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  uint64_t v13 = [v12 setSizeWithDiskImage:&v26 newSize:v11 * a3];

  if ((_DWORD)v13)
  {
    BOOL v14 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  v13,  @"Failed to resize the image",  a4);
    goto LABEL_17;
  }

  -[DICreateParams setNumBlocks:]( self,  "setNumBlocks:",  (*(uint64_t (**)(uint64_t))(*(void *)v26 + 32LL))(v26));
  unint64_t v15 = -[DICreateParams numBlocks](self, "numBlocks");
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v26 + 24LL))(v26);
  int v17 = *__error();
  unint64_t v18 = v16 * v15;
  if (DIForwardLogs())
  {
    getDIOSLog();
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&uint8_t buf[4] = 44;
    __int16 v28 = 2080;
    v29 = "-[DICreateParams resizeWithNumBlocks:error:]";
    __int16 v30 = 2048;
    unint64_t v31 = v18;
    __int16 v20 = (char *)_os_log_send_and_compose_impl();

    if (v20)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v20);
      free(v20);
    }
  }

  else
  {
    getDIOSLog();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 44;
      __int16 v28 = 2080;
      v29 = "-[DICreateParams resizeWithNumBlocks:error:]";
      __int16 v30 = 2048;
      unint64_t v31 = v18;
      _os_log_impl(&dword_188046000, v21, OS_LOG_TYPE_DEFAULT, "%.*s: Disk image resized to %llu bytes", buf, 0x1Cu);
    }
  }

  *__error() = v17;
  uint64_t v22 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v26 + 136LL))(v26);
  uint64_t v23 = DiskImage::Context::flush(v22);
  if (!(_DWORD)v23)
  {
    BOOL v14 = 1;
    if (!v22) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  BOOL v14 = +[DIError failWithPOSIXCode:error:](&OBJC_CLASS___DIError, "failWithPOSIXCode:error:", v23, a4);
  if (v22) {
LABEL_16:
  }
    (*(void (**)(void *))(*v22 + 40LL))(v22);
LABEL_17:
  uint64_t v24 = v26;
  uint64_t v26 = 0LL;
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 16LL))(v24);
  }
  return v14;
}

+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  return !a4
      || +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  21LL,  @"The requested URL is an existing folder",  a5);
}

+ (BOOL)eraseIfExistingWithURL:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [MEMORY[0x1896078A8] defaultManager];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 path];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v6 fileExistsAtPath:v7 isDirectory:&v21];

  if (v8)
  {
    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 path];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = [v9 isWritableFileAtPath:v10];

    if ((v11 & 1) != 0)
    {
      if ([(id)objc_opt_class() checkExistingFileWithURL:v5 isDirectory:v21 error:a4])
      {
        int v12 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          [v5 path];
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158211;
          int v23 = 47;
          __int16 v24 = 2080;
          v25 = "+[DICreateParams eraseIfExistingWithURL:error:]";
          __int16 v26 = 2113;
          v27 = v14;
          unint64_t v15 = (char *)_os_log_send_and_compose_impl();

          if (v15)
          {
            fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v15);
            free(v15);
          }
        }

        else
        {
          getDIOSLog();
          int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            [v5 path];
            unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158211;
            int v23 = 47;
            __int16 v24 = 2080;
            v25 = "+[DICreateParams eraseIfExistingWithURL:error:]";
            __int16 v26 = 2113;
            v27 = v18;
            _os_log_impl(&dword_188046000, v17, OS_LOG_TYPE_DEFAULT, "%.*s: Erasing %{private}@", buf, 0x1Cu);
          }
        }

        *__error() = v12;
        [MEMORY[0x1896078A8] defaultManager];
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        char v16 = [v19 removeItemAtURL:v5 error:a4];
      }

      else
      {
        char v16 = 0;
      }
    }

    else
    {
      char v16 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  13LL,  @"Image does not have write permissions",  a4);
    }
  }

  else
  {
    char v16 = 1;
  }

  return v16;
}

- (BOOL)onErrorCleanup
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", 0LL);
  int v3 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    -[DIBaseParams inputURL](self, "inputURL");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 path];
    *(_DWORD *)buf = 68158211;
    int v15 = 32;
    __int16 v16 = 2080;
    int v17 = "-[DICreateParams onErrorCleanup]";
    __int16 v18 = 2113;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    char v6 = (char *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v6);
      free(v6);
    }
  }

  else
  {
    getDIOSLog();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[DIBaseParams inputURL](self, "inputURL");
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 path];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158211;
      int v15 = 32;
      __int16 v16 = 2080;
      int v17 = "-[DICreateParams onErrorCleanup]";
      __int16 v18 = 2113;
      id v19 = v9;
      _os_log_impl(&dword_188046000, v7, OS_LOG_TYPE_DEFAULT, "%.*s: Creation failed, erasing %{private}@", buf, 0x1Cu);
    }
  }

  *__error() = v3;
  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseParams inputURL](self, "inputURL");
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  char v12 = [v10 removeItemAtURL:v11 error:0];

  return v12;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end