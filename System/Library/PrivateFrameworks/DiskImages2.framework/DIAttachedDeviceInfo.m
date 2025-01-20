@interface DIAttachedDeviceInfo
+ (id)DI1URLWithData:(id)a3 error:(id *)a4;
+ (id)copyAllMountPoints;
+ (id)newDI1DevicesArrayWithError:(id *)a3;
+ (id)newDI2DevicesArrayWithError:(id *)a3;
+ (id)newDevicesArrayWithError:(id *)a3;
+ (id)newEntityDictWithIOMedia:(id)a3 mountPoints:(id)a4;
- (BOOL)fillDI1InfoWithDevice:(id)a3 error:(id *)a4;
- (BOOL)fillDI2InfoWithDevice:(id)a3 error:(id *)a4;
- (BOOL)setDI2PIDWithDevice:(id)a3 error:(id *)a4;
- (DIAttachedDeviceInfo)initWithBSDName:(id)a3 error:(id *)a4;
- (DIAttachedDeviceInfo)initWithDevice:(id)a3 error:(id *)a4;
- (DIIOMedia)ioMedia;
- (NSNumber)blockSize;
- (NSNumber)mediaSize;
- (NSNumber)pid;
- (NSString)BSDName;
- (NSString)instanceId;
- (NSURL)cacheURL;
- (NSURL)imageURL;
- (NSURL)shadowURL;
- (id)copyEntitiesList;
- (id)description;
- (id)toDictionary;
- (int64_t)frameworkNum;
- (void)setIoMedia:(id)a3;
@end

@implementation DIAttachedDeviceInfo

- (DIAttachedDeviceInfo)initWithDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___DIAttachedDeviceInfo;
  v7 = -[DIAttachedDeviceInfo init](&v20, sel_init);
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = [v6 copyIOMediaWithError:a4];
  ioMedia = v7->_ioMedia;
  v7->_ioMedia = (DIIOMedia *)v8;

  v10 = v7->_ioMedia;
  if (!v10)
  {
LABEL_13:
    v18 = 0LL;
    goto LABEL_14;
  }

  uint64_t v11 = -[DIIOObject copyPropertyWithClass:key:](v10, "copyPropertyWithClass:key:", objc_opt_class(), @"Size");
  mediaSize = v7->_mediaSize;
  v7->_mediaSize = (NSNumber *)v11;

  uint64_t v13 = -[DIIOObject copyPropertyWithClass:key:]( v7->_ioMedia,  "copyPropertyWithClass:key:",  objc_opt_class(),  @"Preferred Block Size");
  blockSize = v7->_blockSize;
  v7->_blockSize = (NSNumber *)v13;

  uint64_t v15 = -[DIIOMedia BSDName](v7->_ioMedia, "BSDName");
  BSDName = v7->_BSDName;
  v7->_BSDName = (NSString *)v15;

  if (!v7->_mediaSize || !v7->_blockSize || !v7->_BSDName)
  {
    +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  @"Basic information about the IOMedia device is missing",  a4);
    v17 = (DIAttachedDeviceInfo *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }

  if (![v6 diskImageDevice])
  {
    if (!IOObjectConformsTo([v6 ioObj], "IOHDIXHDDriveNub"))
    {
      +[DIError nilWithEnumValue:description:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:description:error:",  157LL,  @"Device is not a disk image",  a4);
      v17 = (DIAttachedDeviceInfo *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }

    if (-[DIAttachedDeviceInfo fillDI1InfoWithDevice:error:](v7, "fillDI1InfoWithDevice:error:", v6, a4)) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }

  if (!-[DIAttachedDeviceInfo fillDI2InfoWithDevice:error:](v7, "fillDI2InfoWithDevice:error:", v6, a4)) {
    goto LABEL_13;
  }
LABEL_8:
  v17 = v7;
LABEL_10:
  v18 = v17;
LABEL_14:

  return v18;
}

- (BOOL)fillDI2InfoWithDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)[v6 copyPropertyWithClass:objc_opt_class() key:@"DiskImageURL"];
  if (v7)
  {
    uint64_t v8 = (NSURL *)[objc_alloc(MEMORY[0x189604030]) initWithString:v7];
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = v8;
  }

  else
  {
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = 0LL;
  }

  if (*p_imageURL)
  {
    uint64_t v11 = (void *)[v6 copyPropertyWithClass:objc_opt_class() key:@"ShadowURL"];
    if (v11)
    {
      v12 = (NSURL *)[objc_alloc(MEMORY[0x189604030]) initWithString:v11];
      shadowURL = self->_shadowURL;
      self->_shadowURL = v12;
    }

    else
    {
      shadowURL = self->_shadowURL;
      self->_shadowURL = 0LL;
    }

    uint64_t v15 = (void *)[v6 copyPropertyWithClass:objc_opt_class() key:@"CacheURL"];
    if (v15)
    {
      v16 = (NSURL *)[objc_alloc(MEMORY[0x189604030]) initWithString:v15];
      cacheURL = self->_cacheURL;
      self->_cacheURL = v16;
    }

    else
    {
      cacheURL = self->_cacheURL;
      self->_cacheURL = 0LL;
    }

    v18 = (NSString *)[v6 copyPropertyWithClass:objc_opt_class() key:@"InstanceID"];
    instanceId = self->_instanceId;
    self->_instanceId = v18;

    self->_frameworkNum = 2LL;
    BOOL v14 = -[DIAttachedDeviceInfo setDI2PIDWithDevice:error:](self, "setDI2PIDWithDevice:error:", v6, a4)
       || +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  @"Failed to get Daemon PID",  a4);
  }

  else
  {
    BOOL v14 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  @"Invalid or missing image URL key",  a4);
  }

  return v14;
}

- (BOOL)setDI2PIDWithDevice:(id)a3 error:(id *)a4
{
  uint64_t v18 = -1LL;
  v5 = (void *)[a3 newIteratorWithOptions:0 error:a4];
  id v6 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v5);
  if (v6)
  {
    v7 = v6;
    while (1)
    {
      if (IOObjectConformsTo(-[DIIOObject ioObj](v7, "ioObj"), "DIDeviceIOUserClient"))
      {
        uint64_t v8 = -[DIIOObject copyPropertyWithClass:key:]( v7,  "copyPropertyWithClass:key:",  objc_opt_class(),  @"IOUserClientCreator");
        if (v8) {
          break;
        }
      }

      v9 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v5);

      v7 = v9;
      if (!v9) {
        goto LABEL_6;
      }
    }

    uint64_t v11 = (void *)v8;
    [MEMORY[0x189607A08] scannerWithString:v8];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607810] decimalDigitCharacterSet];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = [v12 scanUpToCharactersFromSet:v13 intoString:0];

    if (v14 && [v12 scanInteger:&v18])
    {
      [MEMORY[0x189607968] numberWithInteger:v18];
      uint64_t v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      pid = self->_pid;
      self->_pid = v15;

      BOOL v10 = 1;
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  else
  {
LABEL_6:
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)DI1URLWithData:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)NSString;
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithData:v6 encoding:4];

  if (!v7)
  {
    v12 = @"Invalid path property (not UTF8)";
    goto LABEL_7;
  }

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:v7];
  v9 = v8;
  if (!v8 || ([v8 scheme], BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v7];

    v9 = (void *)v11;
    if (!v11)
    {
      v12 = @"Invalid path property (not a path or URL)";
LABEL_7:
      v9 = +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  v12,  a4);
    }
  }

  return v9;
}

- (BOOL)fillDI1InfoWithDevice:(id)a3 error:(id *)a4
{
  id v6 = (void *)[a3 copyParentWithError:a4];
  if (v6)
  {
    v7 = (void *)[v6 copyPropertyWithClass:objc_opt_class() key:@"image-path"];
    if (v7)
    {
      +[DIAttachedDeviceInfo DI1URLWithData:error:](&OBJC_CLASS___DIAttachedDeviceInfo, "DI1URLWithData:error:", v7, a4);
      uint64_t v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
      imageURL = self->_imageURL;
      self->_imageURL = v8;

      if (self->_imageURL)
      {
        BOOL v10 = (void *)[v6 copyPropertyWithClass:objc_opt_class() key:@"shadow-path"];
        if (v10
          && (+[DIAttachedDeviceInfo DI1URLWithData:error:]( &OBJC_CLASS___DIAttachedDeviceInfo,  "DI1URLWithData:error:",  v10,  a4),  uint64_t v11 = (NSURL *)objc_claimAutoreleasedReturnValue(),  shadowURL = self->_shadowURL,  self->_shadowURL = v11,  shadowURL,  !self->_shadowURL))
        {
          BOOL v13 = 0;
        }

        else
        {
          BOOL v13 = 1;
          self->_frameworkNum = 1LL;
          int v14 = (NSNumber *)[v6 copyPropertyWithClass:objc_opt_class() key:@"hdid-pid"];
          pid = self->_pid;
          self->_pid = v14;

          if (!self->_pid)
          {
            self->_pid = (NSNumber *)&unk_18A1FC200;

            BOOL v13 = 1;
          }
        }
      }

      else
      {
        BOOL v13 = 0;
      }
    }

    else
    {
      BOOL v13 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  @"Missing image path property",  a4);
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (DIAttachedDeviceInfo)initWithBSDName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[DIIOMedia initWithDevName:error:](objc_alloc(&OBJC_CLASS___DIIOMedia), "initWithDevName:error:", v6, a4);

  if (v7)
  {
    id v8 = -[DIIOMedia copyBlockDeviceWithError:](v7, "copyBlockDeviceWithError:", a4);
    if (v8)
    {
      self = -[DIAttachedDeviceInfo initWithDevice:error:](self, "initWithDevice:error:", v8, a4);
      v9 = self;
    }

    else
    {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

+ (id)newDI1DevicesArrayWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DIIOObject initWithClassName:error:]( objc_alloc(&OBJC_CLASS___DIIOObject),  "initWithClassName:error:",  @"IOHDIXController",  0LL);
  id v6 = v5;
  if (v5)
  {
    id v7 = -[DIIOObject newIteratorWithOptions:error:](v5, "newIteratorWithOptions:error:", 0LL, a3);
    if (v7)
    {
      id v8 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v7);
      if (v8)
      {
        v9 = v8;
        do
        {
          if ([v7 startedOver])
          {
            [v4 removeAllObjects];
            [v7 setStartedOver:0];
          }

          -[DIIOObject ioObjectWithClassName:iterateParent:error:]( v9,  "ioObjectWithClassName:iterateParent:error:",  @"IOHDIXHDDriveNub",  0LL,  a3);
          BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            uint64_t v11 = -[DIIOObject initWithDIIOObject:](objc_alloc(&OBJC_CLASS___DIBlockDevice), "initWithDIIOObject:", v10);
            v12 = -[DIAttachedDeviceInfo initWithDevice:error:]( objc_alloc(&OBJC_CLASS___DIAttachedDeviceInfo),  "initWithDevice:error:",  v11,  0LL);
            if (v12) {
              [v4 addObject:v12];
            }
          }

          BOOL v13 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v7);
          v9 = v13;
        }

        while (v13);
      }

      id v14 = v4;
    }

    else
    {
      id v14 = 0LL;
    }
  }

  else
  {
    id v14 = v4;
  }

  return v14;
}

+ (id)newDI2DevicesArrayWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = +[DIIOObject copyDiskImagesControllerWithError:]( &OBJC_CLASS___DIIOObject,  "copyDiskImagesControllerWithError:",  a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)[v5 newIteratorWithOptions:0 error:a3];
    if (v7)
    {
      id v8 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIBlockDevice), "initWithIteratorNext:", v7);
      if (v8)
      {
        v9 = v8;
        do
        {
          if ([v7 startedOver])
          {
            [v4 removeAllObjects];
            [v7 setStartedOver:0];
          }

          if (-[DIBlockDevice diskImageDevice](v9, "diskImageDevice"))
          {
            BOOL v10 = -[DIAttachedDeviceInfo initWithDevice:error:]( objc_alloc(&OBJC_CLASS___DIAttachedDeviceInfo),  "initWithDevice:error:",  v9,  0LL);
            if (v10) {
              [v4 addObject:v10];
            }
          }

          uint64_t v11 = -[DIIOObject initWithIteratorNext:]( objc_alloc(&OBJC_CLASS___DIBlockDevice),  "initWithIteratorNext:",  v7);

          v9 = v11;
        }

        while (v11);
      }

      id v12 = v4;
    }

    else
    {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

+ (id)newDevicesArrayWithError:(id *)a3
{
  id v5 = (void *)objc_msgSend(a1, "newDI2DevicesArrayWithError:");
  if (v5)
  {
    id v6 = (void *)[a1 newDI1DevicesArrayWithError:a3];
    if (v6)
    {
      [MEMORY[0x189603FA8] arrayWithArray:v5];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 addObjectsFromArray:v6];
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[DIAttachedDeviceInfo BSDName](self, "BSDName");
  -[DIAttachedDeviceInfo imageURL](self, "imageURL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"Attached disk image device info: BSD Name [%@], image URL [%@]", v4, v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)copyAllMountPoints
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = 0LL;
  int v3 = getmntinfo_r_np(&v15, 2);
  if (v3)
  {
    if (v3 >= 1)
    {
      unint64_t v4 = 0LL;
      uint64_t v5 = 2168LL * v3;
      do
      {
        id v6 = +[DIHelpers copyDevicePathWithStatfs:]( &OBJC_CLASS___DIHelpers,  "copyDevicePathWithStatfs:",  &v15[v4 / 0x878]);
        [NSString stringWithUTF8String:v15[v4 / 0x878].f_mntonname];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          else {
            BOOL v8 = 1;
          }
          if (!v8)
          {
            [v6 lastPathComponent];
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            [v2 setObject:v7 forKeyedSubscript:v9];
          }
        }

        v4 += 2168LL;
      }

      while (v5 != v4);
    }

    free(v15);
  }

  else
  {
    int v10 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      int v17 = 42;
      __int16 v18 = 2080;
      v19 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
      id v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v12);
        free(v12);
      }
    }

    else
    {
      getDIOSLog();
      BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v17 = 42;
        __int16 v18 = 2080;
        v19 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
        _os_log_impl(&dword_188046000, v13, OS_LOG_TYPE_ERROR, "%.*s: Failed getting mounts list", buf, 0x12u);
      }
    }

    *__error() = v10;
  }

  return v2;
}

+ (id)newEntityDictWithIOMedia:(id)a3 mountPoints:(id)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 BSDName];
  BOOL v8 = (void *)v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x189603FC8];
    uint64_t v15 = @"BSD Name";
    v16[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 dictionaryWithDictionary:v10];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 objectForKeyedSubscript:v8];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v12 forKeyedSubscript:@"Mount Point"];

    BOOL v13 = (void *)[v5 copyPropertyWithClass:objc_opt_class() key:@"Content"];
    [v11 setObject:v13 forKeyedSubscript:@"Content"];
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

- (id)copyEntitiesList
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = +[DIAttachedDeviceInfo copyAllMountPoints](&OBJC_CLASS___DIAttachedDeviceInfo, "copyAllMountPoints");
  -[DIAttachedDeviceInfo ioMedia](self, "ioMedia");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = +[DIAttachedDeviceInfo newEntityDictWithIOMedia:mountPoints:]( &OBJC_CLASS___DIAttachedDeviceInfo,  "newEntityDictWithIOMedia:mountPoints:",  v5,  v4);

  if (v6) {
    [v3 addObject:v6];
  }
  -[DIAttachedDeviceInfo ioMedia](self, "ioMedia");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = (void *)[v7 newIteratorWithOptions:1 error:0];

  if (v8)
  {
    v9 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOMedia), "initWithIteratorNext:", v8);
    if (v9)
    {
      int v10 = v9;
      do
      {
        if ([v8 startedOver])
        {
          [v3 removeAllObjects];
          [v8 setStartedOver:0];
        }

        if (IOObjectConformsTo(-[DIIOObject ioObj](v10, "ioObj"), "IOMedia"))
        {
          id v11 = +[DIAttachedDeviceInfo newEntityDictWithIOMedia:mountPoints:]( &OBJC_CLASS___DIAttachedDeviceInfo,  "newEntityDictWithIOMedia:mountPoints:",  v10,  v4);
          if (v11) {
            [v3 addObject:v11];
          }
        }

        id v12 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOMedia), "initWithIteratorNext:", v8);

        int v10 = v12;
      }

      while (v12);
    }
  }

  return v3;
}

- (id)toDictionary
{
  v24[7] = *MEMORY[0x1895F89C0];
  int v3 = (void *)MEMORY[0x189603FC8];
  v23[0] = @"BSD Name";
  v22 = -[DIAttachedDeviceInfo BSDName](self, "BSDName");
  v24[0] = v22;
  v23[1] = @"DiskImages Framework";
  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[DIAttachedDeviceInfo frameworkNum](self, "frameworkNum"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v4;
  v23[2] = @"DiskImageURL";
  -[DIAttachedDeviceInfo imageURL](self, "imageURL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 description];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v6;
  v23[3] = @"Size";
  -[DIAttachedDeviceInfo mediaSize](self, "mediaSize");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v7;
  v23[4] = @"Preferred Block Size";
  -[DIAttachedDeviceInfo blockSize](self, "blockSize");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v8;
  v23[5] = @"System Entities";
  id v9 = -[DIAttachedDeviceInfo copyEntitiesList](self, "copyEntitiesList");
  v24[5] = v9;
  v23[6] = @"Daemon PID";
  -[DIAttachedDeviceInfo pid](self, "pid");
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:7];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 dictionaryWithDictionary:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DIAttachedDeviceInfo shadowURL](self, "shadowURL");
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[DIAttachedDeviceInfo shadowURL](self, "shadowURL");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 description];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v15 forKeyedSubscript:@"ShadowURL"];
  }
  v16 = -[DIAttachedDeviceInfo cacheURL](self, "cacheURL");
  if (v16)
  {
    -[DIAttachedDeviceInfo cacheURL](self, "cacheURL");
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 description];
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v18 forKeyedSubscript:@"CacheURL"];
  }
  v19 = -[DIAttachedDeviceInfo instanceId](self, "instanceId");
  if (v19)
  {
    -[DIAttachedDeviceInfo instanceId](self, "instanceId");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v20 forKeyedSubscript:@"InstanceID"];
  }

  return v12;
}

- (NSString)BSDName
{
  return self->_BSDName;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSURL)shadowURL
{
  return self->_shadowURL;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (int64_t)frameworkNum
{
  return self->_frameworkNum;
}

- (NSNumber)mediaSize
{
  return self->_mediaSize;
}

- (NSNumber)blockSize
{
  return self->_blockSize;
}

- (NSNumber)pid
{
  return self->_pid;
}

- (NSString)instanceId
{
  return self->_instanceId;
}

- (DIIOMedia)ioMedia
{
  return self->_ioMedia;
}

- (void)setIoMedia:(id)a3
{
}

- (void).cxx_destruct
{
}

@end