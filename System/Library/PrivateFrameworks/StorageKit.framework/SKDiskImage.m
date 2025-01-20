@interface SKDiskImage
+ (id)createBlankAt:(id)a3 params:(id)a4 error:(id *)a5;
+ (id)diskImageConvertFromParamsAt:(id)a3 params:(id)a4 error:(id *)a5;
+ (id)diskImageUnsafeWithURL:(id)a3 params:(id)a4 error:(id *)a5;
+ (id)diskImageWithURL:(id)a3 params:(id)a4 error:(id *)a5;
- (BOOL)attachBeforeResizeWithStdinPass:(BOOL)a3 error:(id *)a4;
- (BOOL)ejectWithError:(id *)a3;
- (BOOL)isAttached;
- (BOOL)resizeWithParams:(id)a3 progress:(id)a4 error:(id *)a5;
- (BOOL)retrieveDIInfoWithParams:(id)a3 error:(id *)a4;
- (DIBaseParams)diParams;
- (DIDeviceHandle)deviceHandle;
- (NSURL)imageURL;
- (SKDiskImage)initWithURL:(id)a3 diParams:(id)a4 error:(id *)a5;
- (SKDiskImage)initWithURL:(id)a3 error:(id *)a4;
- (id)attachNoMountWithError:(id *)a3;
- (id)attachWithError:(id *)a3;
- (id)attachWithParams:(id)a3 error:(id *)a4;
- (id)deduceDiskWithError:(id *)a3;
- (id)description;
- (id)diAttachWithParams:(id)a3 error:(id *)a4;
- (id)mount:(id)a3 params:(id)a4 outError:(id *)a5;
- (id)newResizerWithParams:(id)a3 error:(id *)a4;
- (id)newShallowResizerWithParams:(id)a3 error:(id *)a4;
- (id)redactedDescription;
- (id)resizeLimitsInternalWithLimitsParams:(id)a3 error:(id *)a4;
- (id)resizeLimitsShallowInternalWithLimitsParams:(id)a3 error:(id *)a4;
- (id)resizeLimitsWithError:(id *)a3;
- (id)resizeLimitsWithLimitsParams:(id)a3 error:(id *)a4;
- (id)resizeWithParams:(id)a3 completionBlock:(id)a4;
- (id)retrieveInfoWithParams:(id)a3 error:(id *)a4;
- (unint64_t)diResize:(id)a3 error:(id *)a4;
- (void)resize:(id)a3 completionBlock:(id)a4;
- (void)setDeviceHandle:(id)a3;
- (void)setDiParams:(id)a3;
@end

@implementation SKDiskImage

+ (id)diskImageWithURL:(id)a3 params:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    [a1 diskImageUnsafeWithURL:v8 params:v9 error:a5];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v11, a5);
  }

  return v10;
}

id __45__SKDiskImage_diskImageWithURL_params_error___block_invoke()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v3 = @"faultCode";
  base64Encode((uint64_t)"SKDiskImage.m", 95LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)diskImageUnsafeWithURL:(id)a3 params:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v8 = (char *)a3;
  id v9 = a4;
  [v9 source];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if ((unint64_t)[v9 numBlocks] <= 0x4F)
    {
      v12 = +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 28LL, a5);
      goto LABEL_48;
    }

    [a1 createBlankAt:v8 params:v9 error:a5];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      SKGetOSLog();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        if (a5) {
          v25 = (const __CFString *)*a5;
        }
        else {
          v25 = &stru_18A323F58;
        }
        int v33 = 136315394;
        v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
        __int16 v35 = 2112;
        v36 = v25;
        _os_log_impl( &dword_188F75000,  v24,  OS_LOG_TYPE_ERROR,  "%s: Failed to create blank disk image %@",  (uint8_t *)&v33,  0x16u);
      }

      id v22 = 0LL;
      goto LABEL_45;
    }

    v16 = (void *)[objc_alloc((Class)a1) initWithURL:v8 diParams:v15 error:a5];
    if (!v16)
    {
      SKGetOSLog();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        if (a5) {
          v27 = (const __CFString *)*a5;
        }
        else {
          v27 = &stru_18A323F58;
        }
        int v33 = 136315394;
        v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
        __int16 v35 = 2112;
        v36 = v27;
        _os_log_impl( &dword_188F75000,  v26,  OS_LOG_TYPE_ERROR,  "%s: Failed to create disk image %@",  (uint8_t *)&v33,  0x16u);
      }

      int v23 = 1;
LABEL_43:
      [MEMORY[0x1896078A8] defaultManager];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 removeItemAtURL:v8 error:0];

      id v22 = 0LL;
LABEL_44:
      if (!v23)
      {
        id v22 = v22;
        v12 = v22;
        goto LABEL_47;
      }

+ (id)diskImageConvertFromParamsAt:(id)a3 params:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x18960F238] convertWithParams:v9 error:a5])
  {
    v10 = (void *)[objc_alloc((Class)a1) initWithURL:v8 diParams:v9 error:a5];
  }

  else
  {
    SKGetOSLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        v12 = (const __CFString *)*a5;
      }
      else {
        v12 = &stru_18A323F58;
      }
      int v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_188F75000, v11, OS_LOG_TYPE_ERROR, "Could not convert with %@", (uint8_t *)&v14, 0xCu);
    }

    v10 = 0LL;
  }

  return v10;
}

+ (id)createBlankAt:(id)a3 params:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  [a4 diCreateParamsWithURL:a3 error:a5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    SKGetOSLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        id v9 = (const __CFString *)*a5;
      }
      else {
        id v9 = &stru_18A323F58;
      }
      int v15 = 136315394;
      uint64_t v16 = "+[SKDiskImage createBlankAt:params:error:]";
      __int16 v17 = 2112;
      v18 = v9;
      v11 = "%s: Failed to create 'create params' %@";
      v12 = v8;
      uint32_t v13 = 22;
      goto LABEL_14;
    }

- (BOOL)isAttached
{
  mach_timespec_t waitTime = (mach_timespec_t)5LL;
  IOKitWaitQuiet(*MEMORY[0x1896086A8], &waitTime);
  v3 = -[SKIOObject initWithClassName:]( objc_alloc(&OBJC_CLASS___SKIOObject),  "initWithClassName:",  @"AppleDiskImagesController");
  id v4 = -[SKIOObject newIteratorWithOptions:](v3, "newIteratorWithOptions:", 0LL);
  v5 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithIteratorNext:", v4);
  if (v5)
  {
    v6 = v5;
    int v14 = v3;
    while (1)
    {
      if (IOObjectConformsTo(-[SKIOObject ioObj](v6, "ioObj", v14), "AppleDiskImageDevice"))
      {
        id v7 = -[SKIOObject copyPropertyWithClass:key:]( v6,  "copyPropertyWithClass:key:",  objc_opt_class(),  @"DiskImageURL");
        -[SKDiskImage imageURL](self, "imageURL");
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 absoluteString];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        int v10 = [v7 isEqualToString:v9];

        if (v10) {
          break;
        }
      }

      v11 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithIteratorNext:", v4);

      v6 = v11;
      if (!v11)
      {
        BOOL v12 = 0;
        goto LABEL_9;
      }
    }

    BOOL v12 = 1;
LABEL_9:
    v3 = v14;
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (SKDiskImage)initWithURL:(id)a3 error:(id *)a4
{
  return -[SKDiskImage initWithURL:diParams:error:](self, "initWithURL:diParams:error:", a3, 0LL, a4);
}

- (SKDiskImage)initWithURL:(id)a3 diParams:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SKDiskImage;
  v11 = -[SKDiskImage init](&v18, sel_init);
  if ([v9 isFileURL]
    && ([MEMORY[0x1896078A8] defaultManager],
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(),
        [v9 path],
        uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue(),
        char v14 = [v12 fileExistsAtPath:v13],
        v13,
        v12,
        (v14 & 1) == 0))
  {
    +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 253LL, a5);
    int v15 = (SKDiskImage *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (v11)
    {
      objc_storeStrong((id *)&v11->_imageURL, a3);
      objc_storeStrong((id *)&v11->_diParams, a4);
    }

    int v15 = v11;
  }

  uint64_t v16 = v15;

  return v16;
}

- (id)attachWithError:(id *)a3
{
  v5 = (void *)objc_opt_new();
  v6 = -[SKDiskImage attachWithParams:error:](self, "attachWithParams:error:", v5, a3);
  return v6;
}

- (id)attachNoMountWithError:(id *)a3
{
  v5 = (void *)objc_opt_new();
  [v5 setPolicy:0];
  v6 = -[SKDiskImage attachWithParams:error:](self, "attachWithParams:error:", v5, a3);
  return v6;
}

- (id)attachWithParams:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (v6)
  {
    SKGetOSLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskImage imageURL](self, "imageURL");
      id v8 = (char *)objc_claimAutoreleasedReturnValue();
      int v18 = 138412546;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_188F75000, v7, OS_LOG_TYPE_DEFAULT, "Attaching %@ with %@", (uint8_t *)&v18, 0x16u);
    }

    -[SKDiskImage diAttachWithParams:error:](self, "diAttachWithParams:error:", v6, a4);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SKDiskImage mount:params:outError:](self, "mount:params:outError:", v9, v6, a4);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        SKGetOSLog();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[SKDiskImage imageURL](self, "imageURL");
          BOOL v12 = (char *)objc_claimAutoreleasedReturnValue();
          int v18 = 138412546;
          uint64_t v19 = v12;
          __int16 v20 = 2112;
          id v21 = v10;
          _os_log_impl( &dword_188F75000,  v11,  OS_LOG_TYPE_DEFAULT,  "Attached disk image %@ to %@ device successfully",  (uint8_t *)&v18,  0x16u);
        }

        id v10 = v10;
        uint32_t v13 = v10;
      }

      else
      {
        SKGetOSLog();
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136315394;
          uint64_t v19 = "-[SKDiskImage attachWithParams:error:]";
          __int16 v20 = 2112;
          id v21 = v9;
          _os_log_impl(&dword_188F75000, v16, OS_LOG_TYPE_ERROR, "%s: Couldn't mount disk %@", (uint8_t *)&v18, 0x16u);
        }

        uint32_t v13 = 0LL;
      }
    }

    else
    {
      SKGetOSLog();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        -[SKDiskImage imageURL](self, "imageURL");
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        int v18 = 136315394;
        uint64_t v19 = "-[SKDiskImage attachWithParams:error:]";
        __int16 v20 = 2112;
        id v21 = v15;
        _os_log_impl( &dword_188F75000,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "%s: Failed to attach %@",  (uint8_t *)&v18,  0x16u);
      }

      uint32_t v13 = 0LL;
    }
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v14, a4);
    uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

id __38__SKDiskImage_attachWithParams_error___block_invoke()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v3 = @"faultCode";
  base64Encode((uint64_t)"SKDiskImage.m", 239LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (BOOL)retrieveDIInfoWithParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[SKDiskImage diParams](self, "diParams");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  id v8 = objc_alloc(MEMORY[0x18960F228]);
  if (v7)
  {
    -[SKDiskImage diParams](self, "diParams");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v8 initWithExistingParams:v9 error:a4];
  }

  else
  {
    -[SKDiskImage imageURL](self, "imageURL");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v8 initWithURL:v9 error:a4];
  }

  v11 = (void *)v10;

  if (!v11)
  {
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_14;
  }

  int v12 = [v6 stdinPassPhrase];
  uint64_t v13 = [v11 readPassphraseFlags];
  if (v12) {
    uint64_t v14 = v13 | 8;
  }
  else {
    uint64_t v14 = v13;
  }
  [v11 setReadPassphraseFlags:v14];
  objc_msgSend(v11, "setExtraInfo:", objc_msgSend(v6, "extraInfo"));
  if (([MEMORY[0x18960F238] retrieveInfoWithParams:v11 error:a4] & 1) == 0)
  {
    SKGetOSLog();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_188F75000, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve image info", v19, 2u);
    }

    goto LABEL_13;
  }

  -[SKDiskImage setDiParams:](self, "setDiParams:", v11);
  [v11 imageInfo];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setImageInfo:v15];

  BOOL v16 = 1;
LABEL_14:

  return v16;
}

- (id)retrieveInfoWithParams:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (-[SKDiskImage retrieveDIInfoWithParams:error:](self, "retrieveDIInfoWithParams:error:", v6, a4))
  {
    id v7 = (void *)objc_opt_new();
    id v8 = v7;
    if (v7)
    {
      [v7 setReadOnly:1];
      [v8 setIsManagedAttach:1];
      [v8 setPolicy:0];
      -[SKDiskImage attachWithParams:error:](self, "attachWithParams:error:", v8, a4);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        [v6 getInfoDictWithDisk:v9];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 254LL, a4);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }

      else
      {
        SKGetOSLog();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v13 = 136315138;
          uint64_t v14 = "-[SKDiskImage retrieveInfoWithParams:error:]";
          _os_log_impl(&dword_188F75000, v11, OS_LOG_TYPE_ERROR, "%s: Attach failed", (uint8_t *)&v13, 0xCu);
        }

        uint64_t v10 = 0LL;
      }
    }

    else
    {
      +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 251LL, a4);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)diAttachWithParams:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id obj = 0LL;
  SKGetOSLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[SKDiskImage imageURL](self, "imageURL");
    id v8 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = v8;
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl(&dword_188F75000, v7, OS_LOG_TYPE_DEBUG, "Attaching %@ with %@", buf, 0x16u);
  }

  -[SKDiskImage diParams](self, "diParams");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    SKGetOSLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188F75000, v10, OS_LOG_TYPE_DEBUG, "Using saved instance of di2 params", buf, 2u);
    }
    v11 = -[SKDiskImage diParams](self, "diParams");
    id v34 = 0LL;
    [v6 diAttachParamsWithExistingParams:v11 error:&v34];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v34;

    if (v12) {
      goto LABEL_13;
    }
  }

  else
  {
    -[SKDiskImage imageURL](self, "imageURL");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = 0LL;
    [v6 diAttachParamsWithURL:v14 error:&v33];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v33;

    -[SKDiskImage setDiParams:](self, "setDiParams:", v12);
    if (v12) {
      goto LABEL_13;
    }
  }

  if ([v13 code] == 45)
  {
    SKGetOSLog();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskImage imageURL](self, "imageURL");
      BOOL v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v16;
      __int16 v38 = 2112;
      id v39 = v6;
      _os_log_impl(&dword_188F75000, v15, OS_LOG_TYPE_DEFAULT, "Fallback attaching %@ with %@", buf, 0x16u);
    }

    __int16 v17 = (void *)MEMORY[0x18960F200];
    -[SKDiskImage imageURL](self, "imageURL");
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v32 = 0LL;
    int v19 = objc_msgSend( v17,  "diskImageAttach:readOnly:autoMount:BSDName:error:",  v18,  objc_msgSend(v6, "readOnly"),  0,  &v32,  a4);
    id v20 = v32;

LABEL_26:
    v26 = 0LL;
    if (v19 && v20)
    {
      v26 = (void *)objc_opt_new();
      id obj = v26;
      [v26 setBSDName:v20];
    }

    if ((v19 & 1) != 0) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }

- (id)deduceDiskWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v5 = +[SKManager syncSharedManager](&OBJC_CLASS___SKManager, "syncSharedManager");
  -[SKDiskImage deviceHandle](self, "deviceHandle");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SKDiskImage deviceHandle](self, "deviceHandle");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 BSDName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 diskForString:v8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      id v10 = v9;
    }

    else
    {
      SKGetOSLog();
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[SKDiskImage deviceHandle](self, "deviceHandle");
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 BSDName];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        int v16 = 138412290;
        __int16 v17 = v14;
        _os_log_impl( &dword_188F75000,  v12,  OS_LOG_TYPE_ERROR,  "Couldn't discover disk %@ after attach",  (uint8_t *)&v16,  0xCu);
      }

      +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 251LL, a3);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }

    v11 = v10;
  }

  else
  {
    v11 = +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 251LL, a3);
  }

  return v11;
}

- (BOOL)ejectWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4) {
    char v6 = [v4 ejectWithError:a3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)mount:(id)a3 params:(id)a4 outError:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 policy];
  if (v9 != 2)
  {
    if (v9 == 1)
    {
      SKGetOSLog();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        id v19 = v7;
        __int16 v20 = 2112;
        id v21 = v8;
        _os_log_impl(&dword_188F75000, v15, OS_LOG_TYPE_DEFAULT, "Mounting disk %@ with %@", (uint8_t *)&v18, 0x16u);
      }

      [v8 mountParams];
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 mountWithParams:v16 error:0];
    }

    else if (v9)
    {
      +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 250LL, a5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      uint64_t v14 = v10;
      goto LABEL_14;
    }

- (unint64_t)diResize:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[SKDiskImage diParams](self, "diParams");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  id v8 = objc_alloc(MEMORY[0x18960F230]);
  if (v7)
  {
    -[SKDiskImage diParams](self, "diParams");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = (void *)objc_msgSend(v8, "initWithExistingParams:size:error:", v9, objc_msgSend(v6, "size"), a4);

    if (!v10) {
      goto LABEL_10;
    }
  }

  else
  {
    v11 = -[SKDiskImage imageURL](self, "imageURL");
    id v10 = (void *)objc_msgSend(v8, "initWithURL:size:error:", v11, objc_msgSend(v6, "size"), a4);

    -[SKDiskImage setDiParams:](self, "setDiParams:", v10);
    if (!v10)
    {
LABEL_10:
      unint64_t v15 = 0LL;
      goto LABEL_11;
    }
  }

  int v12 = [v6 stdinPassPhrase];
  uint64_t v13 = [v10 readPassphraseFlags];
  if (v12) {
    uint64_t v14 = v13 | 8;
  }
  else {
    uint64_t v14 = v13;
  }
  [v10 setReadPassphraseFlags:v14];
  unint64_t v15 = [v10 size];
LABEL_11:

  return v15;
}

- (id)redactedDescription
{
  v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  deviceHandle = self->_deviceHandle;
  if (deviceHandle)
  {
    -[DIDeviceHandle BSDName](deviceHandle, "BSDName");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 stringWithFormat:@"<%@: { device: %@}>", v5, v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v3 stringWithFormat:@"<%@: { device: %@}>", v5, 0];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)description
{
  v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  imageURL = self->_imageURL;
  deviceHandle = self->_deviceHandle;
  if (deviceHandle)
  {
    -[DIDeviceHandle BSDName](deviceHandle, "BSDName");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 stringWithFormat:@"<%@: { image URL: %@, device: %@}>", v5, imageURL, v8];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v3 stringWithFormat:@"<%@: { image URL: %@, device: %@}>", v5, self->_imageURL, 0];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (DIDeviceHandle)deviceHandle
{
  return self->_deviceHandle;
}

- (void)setDeviceHandle:(id)a3
{
}

- (DIBaseParams)diParams
{
  return self->_diParams;
}

- (void)setDiParams:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)newShallowResizerWithParams:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setShallow:", objc_msgSend(v6, "shallow"));
  objc_msgSend(v7, "setStdinPassPhrase:", objc_msgSend(v6, "stdinPassPhrase"));
  -[SKDiskImage resizeLimitsShallowInternalWithLimitsParams:error:]( self,  "resizeLimitsShallowInternalWithLimitsParams:error:",  v7,  a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    uint64_t v9 = -[SKDiskImageResizerBase initWithDiskImage:limits:resizeParams:error:]( objc_alloc(&OBJC_CLASS___SKDiskImageResizer),  "initWithDiskImage:limits:resizeParams:error:",  self,  v8,  v6,  a4);
  }

  else
  {
    SKGetOSLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[SKDiskImage(Resize) newShallowResizerWithParams:error:]";
      _os_log_impl(&dword_188F75000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to get shallow limits", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)newResizerWithParams:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (![v6 shallow])
  {
    id v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setShallow:", objc_msgSend(v6, "shallow"));
    objc_msgSend(v8, "setStdinPassPhrase:", objc_msgSend(v6, "stdinPassPhrase"));
    -[SKDiskImage resizeLimitsInternalWithLimitsParams:error:]( self,  "resizeLimitsInternalWithLimitsParams:error:",  v8,  a4);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SKDiskImage deduceDiskWithError:](self, "deduceDiskWithError:", a4);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        [v10 type];
        int v12 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v13 = +[SKDiskImageSizeLimits isSupportedWholeDisk:]( &OBJC_CLASS___SKDiskImageSizeLimits,  "isSupportedWholeDisk:",  v12);

        if (v13)
        {
          uint64_t v14 = -[SKLastPartitions initWithDisk:](objc_alloc(&OBJC_CLASS___SKLastPartitions), "initWithDisk:", v11);
          -[SKLastPartitions resizablePart](v14, "resizablePart");
          unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 type];
          int v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v16 isEqualToString:kSKDiskTypeAPFSPS[0]])
          {

            __int16 v17 = off_18A322A80;
          }

          else
          {
            -[SKLastPartitions resizablePart](v14, "resizablePart");
            __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 type];
            v27 = v14;
            id v21 = (void *)objc_claimAutoreleasedReturnValue();
            int v26 = [v21 isEqualToString:kSKDiskTypeHFS[0]];

            uint64_t v14 = v27;
            __int16 v17 = off_18A322A98;
            if (v26) {
              __int16 v17 = off_18A322A80;
            }
          }

          id v7 = (SKDiskImagePartitionLessResizer *)[objc_alloc(*v17) initWithDiskImage:self limits:v9 resizeParams:v6 error:a4];

          goto LABEL_23;
        }

        [v11 type];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v19 isEqualToString:kSKDiskTypeAPFSPS[0]])
        {
        }

        else
        {
          [v11 type];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          int v23 = [v22 isEqualToString:kSKDiskTypeHFS[0]];

          if (!v23)
          {
            [v11 ejectWithError:0];
            +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 45LL, a4);
            v24 = (SKDiskImagePartitionLessResizer *)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
        }

        v24 = -[SKDiskImageResizerBase initWithDiskImage:limits:resizeParams:error:]( objc_alloc(&OBJC_CLASS___SKDiskImagePartitionLessResizer),  "initWithDiskImage:limits:resizeParams:error:",  self,  v9,  v6,  a4);
LABEL_22:
        id v7 = v24;
        goto LABEL_23;
      }

      SKGetOSLog();
      int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[SKDiskImage(Resize) newResizerWithParams:error:]";
        _os_log_impl(&dword_188F75000, v18, OS_LOG_TYPE_ERROR, "%s: Failed to get root disk of disk image", buf, 0xCu);
      }
    }

    else
    {
      SKGetOSLog();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[SKDiskImage(Resize) newResizerWithParams:error:]";
        _os_log_impl(&dword_188F75000, (os_log_t)v11, OS_LOG_TYPE_ERROR, "%s: Failed to get limits", buf, 0xCu);
      }
    }

    id v7 = 0LL;
LABEL_23:

    goto LABEL_24;
  }

  id v7 = -[SKDiskImage newShallowResizerWithParams:error:](self, "newShallowResizerWithParams:error:", v6, a4);
LABEL_24:

  return v7;
}

- (BOOL)resizeWithParams:(id)a3 progress:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = -[SKDiskImage newResizerWithParams:error:](self, "newResizerWithParams:error:", v8, a5);
  v11 = v10;
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v12 = [v10 requestedSize];
  [v11 limits];
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 currentBytes];

  if (v12 != v14)
  {
    if ([v11 requiredSizeForRecoveryMove])
    {
      unint64_t v15 = -[SKDiskImageResizeParams initWithSize:]( [SKDiskImageResizeParams alloc],  "initWithSize:",  [v11 requiredSizeForRecoveryMove]);
      -[SKDiskImageResizeParams setShallow:](v15, "setShallow:", 1LL);
      id v16 = -[SKDiskImage newResizerWithParams:error:](self, "newResizerWithParams:error:", v15, a5);
      __int16 v17 = v16;
      if (!v16
        || ([v16 progress],
            int v18 = (void *)objc_claimAutoreleasedReturnValue(),
            [v9 chainChildProgress:v18 withPendingUnitCount:50],
            v18,
            ([v17 resizeWithError:a5] & 1) == 0))
      {

        goto LABEL_14;
      }

      id v19 = -[SKDiskImage newResizerWithParams:error:](self, "newResizerWithParams:error:", v8, a5);

      if (!v19)
      {
        v11 = 0LL;
        goto LABEL_14;
      }

      uint64_t v20 = 50LL;
      v11 = v19;
    }

    else
    {
      uint64_t v20 = 100LL;
    }

    [v11 progress];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 chainChildProgress:v21 withPendingUnitCount:v20];

    if ([v11 resizeWithError:a5])
    {
      objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v9, "totalUnitCount"));
      goto LABEL_12;
    }

- (BOOL)attachBeforeResizeWithStdinPass:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = (void *)objc_opt_new();
  [v7 setPolicy:0];
  [v7 setIsManagedAttach:1];
  objc_msgSend(v7, "setStdinPassPhrase:", objc_msgSend(v7, "stdinPassPhrase") | v5);
  -[SKDiskImage attachWithParams:error:](self, "attachWithParams:error:", v7, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = v8 != 0LL;

  return (char)a4;
}

- (id)resizeWithParams:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKManager sharedManager](&OBJC_CLASS___SKManager, "sharedManager");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 frameworkAsyncOperationsQueue];
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __56__SKDiskImage_Resize__resizeWithParams_completionBlock___block_invoke;
  v17[3] = &unk_18A3238C8;
  id v20 = v7;
  v17[4] = self;
  id v18 = v6;
  id v11 = v8;
  id v19 = v11;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v17);

  uint64_t v14 = v19;
  id v15 = v11;

  return v15;
}

void __56__SKDiskImage_Resize__resizeWithParams_completionBlock___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAttached])
  {
    id v12 = 0LL;
    +[SKError failWithPOSIXCode:error:](&OBJC_CLASS___SKError, "failWithPOSIXCode:error:", 16LL, &v12);
    id v2 = v12;
  }

  else
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) stdinPassPhrase];
    id v11 = 0LL;
    int v5 = [v3 attachBeforeResizeWithStdinPass:v4 error:&v11];
    id v2 = v11;
    if (v5)
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      id v10 = v2;
      [v6 resizeWithParams:v7 progress:v8 error:&v10];
      id v9 = v10;

      id v2 = v9;
    }

    [*(id *)(a1 + 32) ejectWithError:0];
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)resize:(id)a3 completionBlock:(id)a4
{
  id v4 = -[SKDiskImage resizeWithParams:completionBlock:](self, "resizeWithParams:completionBlock:", a3, a4);
}

- (id)resizeLimitsShallowInternalWithLimitsParams:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  -[SKDiskImage deduceDiskWithError:](self, "deduceDiskWithError:", a4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    SKGetOSLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_188F75000, v7, OS_LOG_TYPE_ERROR, "%s: Failed to attach disk image", buf, 0xCu);
    }

    goto LABEL_22;
  }

  uint64_t v7 = (os_log_s *)objc_opt_new();
  if (!-[SKDiskImage retrieveDIInfoWithParams:error:](self, "retrieveDIInfoWithParams:error:", v7, a4))
  {
LABEL_22:
    id v21 = 0LL;
    goto LABEL_40;
  }

  -[os_log_s imageInfo](v7, "imageInfo");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKDiskImageInfoParams size_info_key](&OBJC_CLASS___SKDiskImageInfoParams, "size_info_key");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKDiskImageInfoParams format_info_key](&OBJC_CLASS___SKDiskImageInfoParams, "format_info_key");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v12)
  {
    [v10 objectForKeyedSubscript:@"Max Size Bytes"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:-1];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v46 = v13;
    unint64_t v14 = [v13 unsignedLongLongValue];
    if ([v12 isEqualToString:@"RAW"])
    {
      +[SKManager syncSharedManager](&OBJC_CLASS___SKManager, "syncSharedManager");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKDiskImage imageURL](self, "imageURL");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 path];
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 diskForPath:v17];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        unint64_t v19 = [v46 unsignedLongLongValue];
        unint64_t v20 = [v18 freeSpace];
        if (v19 >= v20) {
          unint64_t v14 = v20;
        }
        else {
          unint64_t v14 = v19;
        }
      }
    }

    id v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setCurrentBytes:", objc_msgSend(v6, "unformattedSize"));
    unint64_t v22 = [v21 currentBytes];
    if (v22 <= v14) {
      unint64_t v23 = v14;
    }
    else {
      unint64_t v23 = v22;
    }
    [v21 setMaxBytes:v23];
    [v10 objectForKeyedSubscript:@"Min Size Bytes"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      unint64_t v26 = [v24 unsignedLongLongValue];
      unint64_t v27 = [v21 currentBytes];
      if (v26 >= v27) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = v26;
      }
    }

    else
    {
      uint64_t v28 = [v21 currentBytes];
    }

    objc_msgSend(v21, "setMinBytes:", v28, v12);
    id v31 = -[SKLastPartitions initWithDisk:](objc_alloc(&OBJC_CLASS___SKLastPartitions), "initWithDisk:", v6);
    SKGetOSLog();
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      -[SKLastPartitions resizablePart](v31, "resizablePart");
      id v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
      __int16 v49 = 2112;
      v50 = v33;
      __int16 v51 = 2048;
      uint64_t v52 = -[SKLastPartitions nonResizableSize](v31, "nonResizableSize");
      _os_log_impl( &dword_188F75000,  v32,  OS_LOG_TYPE_DEFAULT,  "%s: Resizable partition: %@, non-resizable size: %lld bytes",  buf,  0x20u);
    }

    -[SKLastPartitions resizablePart](v31, "resizablePart");
    id v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      unint64_t v35 = [v21 minBytes];
      uint64_t v36 = [v34 startLocation];
      unint64_t v37 = [v34 unformattedSize] + v36;
      unint64_t v38 = v35 <= v37 ? v37 : v35;
      [v21 setMinBytes:v38];
      if (([v34 isEqual:v6] & 1) == 0)
      {
        [v6 type];
        id v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( v21,  "setMinBytes:",  objc_msgSend(v21, "minBytes")
        + +[SKLastPartitions secondaryPartitionTableSizeWithDiskType:]( &OBJC_CLASS___SKLastPartitions,  "secondaryPartitionTableSizeWithDiskType:",  v39));

        -[SKLastPartitions recoveryPart](v31, "recoveryPart");
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          SKGetOSLog();
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = -[SKLastPartitions recoveryPart](v31, "recoveryPart");
            *(_DWORD *)buf = 136315394;
            v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
            __int16 v49 = 2112;
            v50 = v42;
            _os_log_impl(&dword_188F75000, v41, OS_LOG_TYPE_DEFAULT, "%s: Recovery partition: %@", buf, 0x16u);
          }
          v43 = -[SKLastPartitions recoveryPart](v31, "recoveryPart");
          objc_msgSend(v21, "setMinBytes:", objc_msgSend(v21, "minBytes") + objc_msgSend(v43, "unformattedSize"));
        }
      }
    }

    alignResizeLimits(v21);
    objc_claimAutoreleasedReturnValue();

    id v12 = v45;
  }

  else
  {
    v29 = +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    [v29 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_7];

    SKGetOSLog();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_188F75000, v30, OS_LOG_TYPE_FAULT, "%s: Failed to inspect size info", buf, 0xCu);
    }

    -[SKDiskImage setDeviceHandle:](self, "setDeviceHandle:", 0LL);
    +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 22LL, a4);
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_40:
  return v21;
}

id __73__SKDiskImage_Resize__resizeLimitsShallowInternalWithLimitsParams_error___block_invoke()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v3 = @"faultCode";
  base64Encode((uint64_t)"SKDiskImage+Resize.m", 175LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)resizeLimitsInternalWithLimitsParams:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[SKDiskImage resizeLimitsShallowInternalWithLimitsParams:error:]( self,  "resizeLimitsShallowInternalWithLimitsParams:error:",  v6,  a4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SKDiskImage deduceDiskWithError:](self, "deduceDiskWithError:", a4);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v9 = [v7 physicalStoreMinimumSizeFromStore:v8];
LABEL_13:
        [v7 setMinBytes:v9];
LABEL_26:
        alignResizeLimits(v7);
        objc_claimAutoreleasedReturnValue();
        id v11 = v7;
        goto LABEL_27;
      }

      [v8 type];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = [v12 isEqualToString:kSKDiskTypeHFS[0]];

      if (v13)
      {
        uint64_t v9 = +[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]( &OBJC_CLASS___SKLastPartitions,  "hfsMinimalSizeForDisk:currentSize:",  v8,  0LL);
        goto LABEL_13;
      }

      unint64_t v14 = -[SKLastPartitions initWithDisk:](objc_alloc(&OBJC_CLASS___SKLastPartitions), "initWithDisk:", v8);
      -[SKLastPartitions resizablePart](v14, "resizablePart");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = v15;
      if (v15)
      {
        unint64_t v17 = [v15 totalSpace];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v18 = [v7 physicalStoreMinimumSizeFromStore:v16];
          goto LABEL_19;
        }

        [v16 type];
        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        int v20 = [v19 isEqualToString:kSKDiskTypeHFS[0]];

        if (v20)
        {
          uint64_t v18 = +[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]( &OBJC_CLASS___SKLastPartitions,  "hfsMinimalSizeForDisk:currentSize:",  v16,  0LL);
LABEL_19:
          unint64_t v21 = v18;
          if (v18 != -1)
          {
            [v8 type];
            unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v23 = +[SKLastPartitions secondaryPartitionTableSizeWithDiskType:]( &OBJC_CLASS___SKLastPartitions,  "secondaryPartitionTableSizeWithDiskType:",  v22);

            uint64_t v24 = [v16 startLocation];
            if (v17 >= v21) {
              unint64_t v25 = v21;
            }
            else {
              unint64_t v25 = v17;
            }
            [v7 setMinBytes:v23 + v24 + v25];
            -[SKLastPartitions recoveryPart](v14, "recoveryPart");
            unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              -[SKLastPartitions recoveryPart](v14, "recoveryPart");
              unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setMinBytes:", objc_msgSend(v7, "minBytes") + objc_msgSend(v27, "totalSpace"));
            }
          }
        }
      }

      goto LABEL_26;
    }

    SKGetOSLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136315138;
      uint64_t v30 = "-[SKDiskImage(Resize) resizeLimitsInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_188F75000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to attach disk image", (uint8_t *)&v29, 0xCu);
    }
  }

  else
  {
    SKGetOSLog();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136315138;
      uint64_t v30 = "-[SKDiskImage(Resize) resizeLimitsInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_188F75000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "%s: Failed to get limits", (uint8_t *)&v29, 0xCu);
    }
  }

  id v11 = 0LL;
LABEL_27:

  return v11;
}

- (id)resizeLimitsWithLimitsParams:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  BOOL v7 = -[SKDiskImage isAttached](self, "isAttached");
  if (-[SKDiskImage attachBeforeResizeWithStdinPass:error:]( self,  "attachBeforeResizeWithStdinPass:error:",  [v6 stdinPassPhrase],  a4))
  {
    if ([v6 shallow]) {
      -[SKDiskImage resizeLimitsShallowInternalWithLimitsParams:error:]( self,  "resizeLimitsShallowInternalWithLimitsParams:error:",  v6,  a4);
    }
    else {
      -[SKDiskImage resizeLimitsInternalWithLimitsParams:error:]( self,  "resizeLimitsInternalWithLimitsParams:error:",  v6,  a4);
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!v7) {
        -[SKDiskImage ejectWithError:](self, "ejectWithError:", 0LL);
      }
      -[SKDiskImage setDeviceHandle:](self, "setDeviceHandle:", 0LL);
      id v9 = v8;
    }

    else
    {
      SKGetOSLog();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315138;
        int v13 = "-[SKDiskImage(Resize) resizeLimitsWithLimitsParams:error:]";
        _os_log_impl(&dword_188F75000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to get limits", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)resizeLimitsWithError:(id *)a3
{
  int v5 = (void *)objc_opt_new();
  -[SKDiskImage resizeLimitsWithLimitsParams:error:](self, "resizeLimitsWithLimitsParams:error:", v5, a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end