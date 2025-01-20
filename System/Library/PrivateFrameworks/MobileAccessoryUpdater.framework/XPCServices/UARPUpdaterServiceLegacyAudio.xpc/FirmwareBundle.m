@interface FirmwareBundle
+ (id)defaultBundlePath;
- (FirmwareBundle)initWithBundle:(id)a3;
- (FirmwareBundle)initWithBundleName:(id)a3;
- (FirmwareBundle)initWithBundlePath:(id)a3;
- (FirmwareBundle)initWithData:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6;
- (FirmwareBundle)initWithURL:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6;
- (NSData)certificate;
- (NSData)firmwareImage;
- (NSData)hash;
- (NSData)signature;
- (NSDictionary)buildManifest;
- (NSURL)firmwareLocalURL;
- (id)description;
- (id)getFirmwareDataInRange:(_NSRange)a3 error:(id *)a4;
- (id)parseMSP430TXTFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4;
- (id)parseResourceFileIntoData:(id)a3;
- (id)parseSRECFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4;
- (unsigned)firmwareImageBaseAddress;
- (unsigned)firmwareImageSize;
- (unsigned)productIDCode;
- (void)calculateHash;
- (void)dealloc;
- (void)loadFirmwareImage;
- (void)parseFileName:(id)a3 intoPath:(id *)a4 andExtension:(id *)a5;
- (void)parseSRECLine:(id)a3 intoImage:(id)a4;
- (void)setBuildManifest:(id)a3;
- (void)setProductIDCode:(unsigned int)a3;
@end

@implementation FirmwareBundle

+ (id)defaultBundlePath
{
  return -[NSString stringByAppendingFormat:]( -[NSBundle resourcePath](+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"), "resourcePath"),  "stringByAppendingFormat:",  @"/FirmwareBundles/");
}

- (void)calculateHash
{
  uint64_t v11 = 0LL;
  firmwareLocalURL = self->_firmwareLocalURL;
  if (firmwareLocalURL)
  {
    HashForDataAtLocationAsData = generateHashForDataAtLocationAsData(firmwareLocalURL, 10LL, (uint64_t)&v11);
    self->_hash = HashForDataAtLocationAsData;
    v5 = HashForDataAtLocationAsData;
  }

  else
  {
    memset(v12, 0, sizeof(v12));
    uint64_t v6 = ccsha256_di(0LL, a2);
    NSLog( @"%s: hash not provided by asset. creating sha256 on the fly imageSize=%d\n",  "-[FirmwareBundle calculateHash]",  self->_firmwareImageSize);
    __chkstk_darwin();
    v8 = (char *)&v10 - v7;
    ccdigest_init(v6, (char *)&v10 - v7);
    ccdigest_update(v6, v8, self->_firmwareImageSize, -[NSData bytes](self->_firmwareImage, "bytes"));
    (*(void (**)(uint64_t, char *, _OWORD *))(v6 + 56))(v6, v8, v12);
    v9 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v12, 32LL);
    self->_hash = v9;
    NSLog(@"hash created %@\n", v9);
  }

- (FirmwareBundle)initWithData:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6
{
  uint64_t v6 = self;
  if (a3)
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___FirmwareBundle;
    uint64_t v6 = -[FirmwareBundle init](&v23, "init");
    if (v6)
    {
      v6->_firmwareImage = (NSData *)a3;
      v6->_firmwareImageSize = [a3 length];
      v6->_hash = (NSData *)a4;
      v6->_signature = (NSData *)a5;
      v6->_certificate = (NSData *)a6;
      *(void *)&v6->_productIDCode = 0LL;
      v6->_bundleDescription = 0LL;
      v6->_buildManifest = 0LL;
      if (!v6->_hash) {
        -[FirmwareBundle calculateHash](v6, "calculateHash");
      }
      firmwareImage = v6->_firmwareImage;
      v12 = "valid";
      if (firmwareImage) {
        v13 = "valid";
      }
      else {
        v13 = "nil";
      }
      id v14 = -[NSData length](firmwareImage, "length");
      hash = v6->_hash;
      if (hash) {
        v16 = "valid";
      }
      else {
        v16 = "nil";
      }
      id v17 = -[NSData length](hash, "length");
      signature = v6->_signature;
      if (signature) {
        v19 = "valid";
      }
      else {
        v19 = "nil";
      }
      id v20 = -[NSData length](signature, "length");
      certificate = v6->_certificate;
      if (!certificate) {
        v12 = "nil";
      }
      NSLog( @"%s: I=%s[%lu] H=%s[%lu] S=%s[%lu] C=%s[%lu] productID=%d\n",  "-[FirmwareBundle initWithData:hashData:signatureData:certData:]",  v13,  v14,  v16,  v17,  v19,  v20,  v12,  -[NSData length](certificate, "length"),  v6->_productIDCode);
    }

    else
    {
      NSLog(@"%s: super init failed\n", "-[FirmwareBundle initWithData:hashData:signatureData:certData:]");
    }
  }

  else
  {
    NSLog(@"%s: null payload\n", "-[FirmwareBundle initWithData:hashData:signatureData:certData:]");
  }

  return v6;
}

- (FirmwareBundle)initWithURL:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6
{
  uint64_t v25 = 0LL;
  if ([a3 checkResourceIsReachableAndReturnError:&v25])
  {
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___FirmwareBundle;
    uint64_t v11 = -[FirmwareBundle init](&v24, "init");
    if (v11)
    {
      v11->_firmwareLocalURL = (NSURL *)a3;
      v11->_hash = (NSData *)a4;
      v11->_signature = (NSData *)a5;
      v11->_certificate = (NSData *)a6;
      *(void *)&v11->_productIDCode = 0LL;
      v11->_bundleDescription = 0LL;
      v11->_buildManifest = 0LL;
      id v23 = 0LL;
      [a3 getResourceValue:&v23 forKey:NSURLFileSizeKey error:&v25];
      v11->_firmwareImageSize = [v23 unsignedIntValue];
      if (!v11->_hash) {
        -[FirmwareBundle calculateHash](v11, "calculateHash");
      }
      firmwareLocalURL = v11->_firmwareLocalURL;
      id v13 = -[NSData length](v11->_firmwareImage, "length");
      hash = v11->_hash;
      v15 = "valid";
      if (hash) {
        v16 = "valid";
      }
      else {
        v16 = "nil";
      }
      id v17 = -[NSData length](hash, "length");
      signature = v11->_signature;
      if (signature) {
        v19 = "valid";
      }
      else {
        v19 = "nil";
      }
      id v20 = -[NSData length](signature, "length");
      certificate = v11->_certificate;
      if (!certificate) {
        v15 = "nil";
      }
      NSLog( @"%s: I=%@[%lu] H=%s[%lu] S=%s[%lu] C=%s[%lu] productID=%d\n",  "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]",  firmwareLocalURL,  v13,  v16,  v17,  v19,  v20,  v15,  -[NSData length](certificate, "length"),  v11->_productIDCode);
    }

    else
    {
      NSLog(@"%s: super init failed\n", "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]");
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017C9C((uint64_t)a3);
    }
    return 0LL;
  }

  return v11;
}

- (FirmwareBundle)initWithBundle:(id)a3
{
  id v35 = 0LL;
  uint64_t v36 = 0LL;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___FirmwareBundle;
  v4 = -[FirmwareBundle init](&v34, "init");
  if (!v4) {
    goto LABEL_37;
  }
  id v5 = [a3 objectForInfoDictionaryKey:@"FirmwareImageBaseAddress"];
  id v6 = [a3 objectForInfoDictionaryKey:@"FirmwareImageSize"];
  id v7 = [a3 objectForInfoDictionaryKey:@"FirmwareImageFile"];
  if (!v7) {
    goto LABEL_37;
  }
  id v8 = v7;
  id v9 = [a3 objectForInfoDictionaryKey:@"HashFile"];
  id v10 = [a3 objectForInfoDictionaryKey:@"CertificateFile"];
  id v11 = [a3 objectForInfoDictionaryKey:@"SignatureFile"];
  id v12 = [a3 objectForInfoDictionaryKey:@"CFBundleIdentifier"];
  if (!v12) {
    goto LABEL_37;
  }
  id v13 = v12;
  NSLog(@"%s: Info Name Keys [I:%@ H:%@ S:%@ C=%@]\n", "-[FirmwareBundle initWithBundle:]", v8, v9, v11, v10);
  if (v5) {
    -[NSScanner scanHexInt:]( +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v5),  "scanHexInt:",  &v4->_firmwareImageBaseAddress);
  }
  if (v6)
  {
    -[NSScanner scanHexInt:]( +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v6),  "scanHexInt:",  &v4->_firmwareImageSize);
  }

  else
  {
    -[FirmwareBundle parseFileName:intoPath:andExtension:](v4, "parseFileName:intoPath:andExtension:", v8, &v36, &v35);
    unint64_t v14 = -[NSDictionary fileSize]( -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  [a3 pathForResource:v36 ofType:v35],  0),  "fileSize");
    v4->_firmwareImageSize = v14;
    NSLog( @"%s: imageFileSize unspecified by asset. using file size=%d\n",  "-[FirmwareBundle initWithBundle:]",  v14);
  }

  id v15 = [a3 objectForInfoDictionaryKey:@"DefaultFillByte"];
  if (v15)
  {
    -[NSScanner scanHexInt:]( +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v15),  "scanHexInt:",  &v33);
    unsigned __int8 v16 = v33;
  }

  else
  {
    unsigned __int8 v16 = -1;
  }

  -[FirmwareBundle parseFileName:intoPath:andExtension:](v4, "parseFileName:intoPath:andExtension:", v8, &v36, &v35);
  if (![v35 caseInsensitiveCompare:@"s19"])
  {
    v19 = -[FirmwareBundle parseSRECFile:withDefaultByteValue:]( v4,  "parseSRECFile:withDefaultByteValue:",  [a3 pathForResource:v36 ofType:v35],  v16);
    goto LABEL_16;
  }

  id v17 = [v35 caseInsensitiveCompare:@"bin"];
  id v18 = [a3 pathForResource:v36 ofType:v35];
  if (v17)
  {
    v19 = -[FirmwareBundle parseMSP430TXTFile:withDefaultByteValue:]( v4,  "parseMSP430TXTFile:withDefaultByteValue:",  v18,  v16);
LABEL_16:
    uint64_t v20 = 5LL;
    goto LABEL_18;
  }

  v19 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v18);
  uint64_t v20 = 10LL;
LABEL_18:
  (&v4->super.isa)[v20] = (Class)v19;
  -[FirmwareBundle parseFileName:intoPath:andExtension:]( v4,  "parseFileName:intoPath:andExtension:",  @"BuildManifest.plist",  &v36,  &v35);
  v4->_buildManifest =  +[NSDictionary dictionaryWithContentsOfFile:]( NSDictionary,  "dictionaryWithContentsOfFile:",  [a3 pathForResource:v36 ofType:v35]);
  if (v9)
  {
    -[FirmwareBundle parseFileName:intoPath:andExtension:](v4, "parseFileName:intoPath:andExtension:", v9, &v36, &v35);
    if ([v35 caseInsensitiveCompare:@"bin"]) {
      v21 = -[FirmwareBundle parseResourceFileIntoData:]( v4,  "parseResourceFileIntoData:",  [a3 pathForResource:v36 ofType:v35]);
    }
    else {
      v21 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [a3 pathForResource:v36 ofType:v35]);
    }
    v4->_hash = v21;
    if (!v10) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }

  -[FirmwareBundle calculateHash](v4, "calculateHash");
  if (v10)
  {
LABEL_25:
    -[FirmwareBundle parseFileName:intoPath:andExtension:](v4, "parseFileName:intoPath:andExtension:", v10, &v36, &v35);
    if ([v35 caseInsensitiveCompare:@"bin"]) {
      v22 = -[FirmwareBundle parseResourceFileIntoData:]( v4,  "parseResourceFileIntoData:",  [a3 pathForResource:v36 ofType:v35]);
    }
    else {
      v22 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [a3 pathForResource:v36 ofType:v35]);
    }
    v4->_certificate = v22;
  }

- (FirmwareBundle)initWithBundlePath:(id)a3
{
  return -[FirmwareBundle initWithBundle:]( self,  "initWithBundle:",  +[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", a3));
}

- (FirmwareBundle)initWithBundleName:(id)a3
{
  return -[FirmwareBundle initWithBundlePath:]( self,  "initWithBundlePath:",  objc_msgSend( +[FirmwareBundle defaultBundlePath](FirmwareBundle, "defaultBundlePath"),  "stringByAppendingString:",  a3));
}

- (void)loadFirmwareImage
{
  if (-[NSURL checkResourceIsReachableAndReturnError:]( self->_firmwareLocalURL,  "checkResourceIsReachableAndReturnError:",  0LL))
  {
    self->_firmwareImage = -[NSData initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfURL:",  self->_firmwareLocalURL);
  }

- (id)getFirmwareDataInRange:(_NSRange)a3 error:(id *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  firmwareFilehandle = self->_firmwareFilehandle;
  if ((firmwareFilehandle
     || (firmwareFilehandle =  +[NSFileHandle fileHandleForReadingFromURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingFromURL:error:",  self->_firmwareLocalURL,  a4),  (self->_firmwareFilehandle = firmwareFilehandle) != 0LL))
    && -[NSFileHandle uarpSeekToOffset:error:](firmwareFilehandle, "uarpSeekToOffset:error:", location, a4))
  {
    return -[NSFileHandle uarpReadDataUpToLength:error:]( self->_firmwareFilehandle,  "uarpReadDataUpToLength:error:",  length,  a4);
  }

  else
  {
    return 0LL;
  }

- (void)parseFileName:(id)a3 intoPath:(id *)a4 andExtension:(id *)a5
{
  id v8 = [a3 pathExtension];
  *a5 = v8;
  if ([v8 caseInsensitiveCompare:@"txt"]
    && [*a5 caseInsensitiveCompare:@"s19"]
    && [*a5 caseInsensitiveCompare:@"bin"]
    && [*a5 caseInsensitiveCompare:@"plist"])
  {
    *a4 = a3;
    *a5 = @"txt";
  }

  else
  {
    *a4 = [a3 stringByDeletingPathExtension];
  }

- (id)parseResourceFileIntoData:(id)a3
{
  v3 = +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  a3,  1LL,  0LL);
  v4 = +[NSMutableData dataWithCapacity:]( &OBJC_CLASS___NSMutableData,  "dataWithCapacity:",  -[NSString length](v3, "length") / 5);
  id v5 = +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v3);
  if (-[NSScanner scanHexInt:](v5, "scanHexInt:", &v8))
  {
    do
    {
      char v7 = v8;
      -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v7, 1LL);
      -[NSScanner scanCharactersFromSet:intoString:]( v5,  "scanCharactersFromSet:intoString:",  +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @","),  0LL);
    }

    while (-[NSScanner scanHexInt:](v5, "scanHexInt:", &v8));
  }

  return v4;
}

- (id)parseMSP430TXTFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4
{
  int v4 = a4;
  char v7 = +[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", self->_firmwareImageSize);
  memset(-[NSMutableData mutableBytes](v7, "mutableBytes"), v4, -[NSMutableData length](v7, "length"));
  int v14 = 0;
  int v8 = +[NSScanner scannerWithString:]( &OBJC_CLASS___NSScanner,  "scannerWithString:",  +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  a3,  1LL,  0LL));
  if (!-[NSScanner isAtEnd](v8, "isAtEnd"))
  {
    do
    {
      if (-[NSScanner scanUpToString:intoString:](v8, "scanUpToString:intoString:", @"\n", &v13))
      {
        unsigned int v9 = [v13 characterAtIndex:0];
        if (v9 != 113)
        {
          if (v9 == 64)
          {
            -[NSScanner scanHexInt:]( +[NSScanner scannerWithString:]( NSScanner,  "scannerWithString:",  [v13 substringFromIndex:1]),  "scanHexInt:",  &v14);
            v14 -= self->_firmwareImageBaseAddress;
          }

          else
          {
            id v10 = +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v13);
            if (!-[NSScanner isAtEnd](v10, "isAtEnd"))
            {
              do
              {
                -[NSScanner scanHexInt:](v10, "scanHexInt:", &v12);
                ++v14;
                -[NSMutableData replaceBytesInRange:withBytes:](v7, "replaceBytesInRange:withBytes:");
              }

              while (!-[NSScanner isAtEnd](v10, "isAtEnd"));
            }
          }
        }
      }
    }

    while (!-[NSScanner isAtEnd](v8, "isAtEnd"));
  }

  return v7;
}

- (void)parseSRECLine:(id)a3 intoImage:(id)a4
{
  char v7 = (const char *)[a3 cStringUsingEncoding:1];
  int v8 = *((unsigned __int8 *)v7 + 1);
  sscanf(v7 + 2, "%02x", &v16);
  uint64_t v9 = v16;
  if ((char *)[a3 length] - 4 == (_BYTE *)(2 * v9))
  {
    char v10 = v9;
    if ((_DWORD)v9)
    {
      id v11 = v7 + 4;
      uint64_t v12 = (v9 - 1) + 1LL;
      id v13 = &v17;
      char v10 = v9;
      do
      {
        sscanf(v11, "%02x", &v16);
        v11 += 2;
        char v14 = v16;
        *(_BYTE *)id v13 = v16;
        id v13 = (unsigned __int16 *)((char *)v13 + 1);
        v10 += v14;
        --v12;
      }

      while (v12);
    }

    if (v10 == -1)
    {
      if (v8 != 48 && v8 != 57)
      {
        if (v8 == 49)
        {
          else {
            objc_msgSend( a4,  "replaceBytesInRange:withBytes:",  (unsigned __int16)(_byteswap_ushort(v17) - self->_firmwareImageBaseAddress),  (int)v9 - 3,  v18);
          }
        }

        else
        {
          NSLog(@"Unhandled SREC record type in parseSRECLine", v15);
        }
      }
    }

    else
    {
      NSLog(@"checksum failure in parseSRECLine", v15);
    }
  }

  else
  {
    NSLog( @"parseSRECLine: Invalid byte_count %d in SREC text_line (%lu)",  v9,  (char *)[a3 length] - 4);
  }

- (id)parseSRECFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4
{
  int v4 = a4;
  char v7 = +[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", self->_firmwareImageSize);
  memset(-[NSMutableData mutableBytes](v7, "mutableBytes"), v4, -[NSMutableData length](v7, "length"));
  int v8 = +[NSScanner scannerWithString:]( &OBJC_CLASS___NSScanner,  "scannerWithString:",  +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  a3,  1LL,  0LL));
  if (!-[NSScanner isAtEnd](v8, "isAtEnd"))
  {
    do
    {
    }

    while (!-[NSScanner isAtEnd](v8, "isAtEnd"));
  }

  return v7;
}

- (void)dealloc
{
  -[NSFileHandle uarpCloseAndReturnError:](self->_firmwareFilehandle, "uarpCloseAndReturnError:", 0LL);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FirmwareBundle;
  -[FirmwareBundle dealloc](&v3, "dealloc");
}

- (id)description
{
  return self->_bundleDescription;
}

- (NSData)firmwareImage
{
  return self->_firmwareImage;
}

- (NSDictionary)buildManifest
{
  return self->_buildManifest;
}

- (void)setBuildManifest:(id)a3
{
}

- (NSData)hash
{
  return self->_hash;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (NSData)signature
{
  return self->_signature;
}

- (unsigned)productIDCode
{
  return self->_productIDCode;
}

- (void)setProductIDCode:(unsigned int)a3
{
  self->_productIDCode = a3;
}

- (unsigned)firmwareImageBaseAddress
{
  return self->_firmwareImageBaseAddress;
}

- (unsigned)firmwareImageSize
{
  return self->_firmwareImageSize;
}

- (NSURL)firmwareLocalURL
{
  return self->_firmwareLocalURL;
}

@end