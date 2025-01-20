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
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___DIAttachedDeviceInfo;
  v7 = -[DIAttachedDeviceInfo init](&v22, "init");
  if (!v7) {
    goto LABEL_8;
  }
  v8 = (DIIOMedia *)[v6 copyIOMediaWithError:a4];
  ioMedia = v7->_ioMedia;
  v7->_ioMedia = v8;

  v11 = v7->_ioMedia;
  if (!v11)
  {
LABEL_13:
    v20 = 0LL;
    goto LABEL_14;
  }

  v12 = -[DIIOObject copyPropertyWithClass:key:]( v11,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSNumber, v10),  @"Size");
  mediaSize = v7->_mediaSize;
  v7->_mediaSize = v12;

  v15 = -[DIIOObject copyPropertyWithClass:key:]( v7->_ioMedia,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSNumber, v14),  @"Preferred Block Size");
  blockSize = v7->_blockSize;
  v7->_blockSize = v15;

  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[DIIOMedia BSDName](v7->_ioMedia, "BSDName"));
  BSDName = v7->_BSDName;
  v7->_BSDName = (NSString *)v17;

  if (!v7->_mediaSize || !v7->_blockSize || !v7->_BSDName)
  {
    v19 = (DIAttachedDeviceInfo *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  @"Basic information about the IOMedia device is missing",  a4));
    goto LABEL_10;
  }

  if (![v6 diskImageDevice])
  {
    if (!IOObjectConformsTo((io_object_t)[v6 ioObj], "IOHDIXHDDriveNub"))
    {
      v19 = (DIAttachedDeviceInfo *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:description:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:description:error:",  157LL,  @"Device is not a disk image",  a4));
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
  v19 = v7;
LABEL_10:
  v20 = v19;
LABEL_14:

  return v20;
}

- (BOOL)fillDI2InfoWithDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v8 = objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(NSString, v7), @"DiskImageURL");
  if (v8)
  {
    v9 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v8);
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = v9;
  }

  else
  {
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = 0LL;
  }

  if (*p_imageURL)
  {
    id v13 = objc_msgSend( v6,  "copyPropertyWithClass:key:",  objc_opt_class(NSString, v12),  @"ShadowURL");
    if (v13)
    {
      uint64_t v14 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v13);
      shadowURL = self->_shadowURL;
      self->_shadowURL = v14;
    }

    else
    {
      shadowURL = self->_shadowURL;
      self->_shadowURL = 0LL;
    }

    id v18 = objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(NSString, v17), @"CacheURL");
    if (v18)
    {
      v19 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v18);
      cacheURL = self->_cacheURL;
      self->_cacheURL = v19;
    }

    else
    {
      cacheURL = self->_cacheURL;
      self->_cacheURL = 0LL;
    }

    objc_super v22 = (NSString *)objc_msgSend( v6,  "copyPropertyWithClass:key:",  objc_opt_class(NSString, v21),  @"InstanceID");
    instanceId = self->_instanceId;
    self->_instanceId = v22;

    self->_frameworkNum = 2LL;
    if (-[DIAttachedDeviceInfo setDI2PIDWithDevice:error:](self, "setDI2PIDWithDevice:error:", v6, a4)) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  @"Failed to get Daemon PID",  a4);
    }
  }

  else
  {
    BOOL v16 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  @"Invalid or missing image URL key",  a4);
  }

  return v16;
}

- (BOOL)setDI2PIDWithDevice:(id)a3 error:(id *)a4
{
  uint64_t v19 = -1LL;
  id v5 = [a3 newIteratorWithOptions:0 error:a4];
  id v6 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v5);
  if (v6)
  {
    uint64_t v7 = v6;
    while (1)
    {
      if (IOObjectConformsTo(-[DIIOObject ioObj](v7, "ioObj"), "DIDeviceIOUserClient"))
      {
        id v9 = -[DIIOObject copyPropertyWithClass:key:]( v7,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSString, v8),  @"IOUserClientCreator");
        if (v9) {
          break;
        }
      }

      uint64_t v10 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v5);

      uint64_t v7 = v10;
      if (!v10) {
        goto LABEL_6;
      }
    }

    uint64_t v12 = v9;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v9));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
    unsigned int v15 = [v13 scanUpToCharactersFromSet:v14 intoString:0];

    if (v15 && [v13 scanInteger:&v19])
    {
      BOOL v16 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v19));
      pid = self->_pid;
      self->_pid = v16;

      BOOL v11 = 1;
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  else
  {
LABEL_6:
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)DI1URLWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v5, 4LL);

  if (!v6)
  {
    BOOL v11 = @"Invalid path property (not UTF8)";
    goto LABEL_7;
  }

  uint64_t v7 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v6);
  uint64_t v8 = v7;
  if (!v7 || (id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](v7, "scheme")), v9, !v9))
  {
    uint64_t v10 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v6);

    uint64_t v8 = v10;
    if (!v10)
    {
      BOOL v11 = @"Invalid path property (not a path or URL)";
LABEL_7:
      uint64_t v8 = (NSURL *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  v11,  a4));
    }
  }

  return v8;
}

- (BOOL)fillDI1InfoWithDevice:(id)a3 error:(id *)a4
{
  id v7 = [a3 copyParentWithError:a4];
  if (v7)
  {
    id v8 = objc_msgSend(v7, "copyPropertyWithClass:key:", objc_opt_class(NSData, v6), @"image-path");
    if (v8)
    {
      id v9 = (NSURL *)objc_claimAutoreleasedReturnValue( +[DIAttachedDeviceInfo DI1URLWithData:error:]( &OBJC_CLASS___DIAttachedDeviceInfo,  "DI1URLWithData:error:",  v8,  a4));
      imageURL = self->_imageURL;
      self->_imageURL = v9;

      if (self->_imageURL)
      {
        id v13 = objc_msgSend( v7,  "copyPropertyWithClass:key:",  objc_opt_class(NSData, v11),  @"shadow-path");
        if (v13
          && (uint64_t v14 = (NSURL *)objc_claimAutoreleasedReturnValue( +[DIAttachedDeviceInfo DI1URLWithData:error:]( &OBJC_CLASS___DIAttachedDeviceInfo,  "DI1URLWithData:error:",  v13,  a4)),  shadowURL = self->_shadowURL,  self->_shadowURL = v14,  shadowURL,  !self->_shadowURL))
        {
          BOOL v16 = 0;
        }

        else
        {
          BOOL v16 = 1;
          self->_frameworkNum = 1LL;
          uint64_t v17 = (NSNumber *)objc_msgSend( v7,  "copyPropertyWithClass:key:",  objc_opt_class(NSNumber, v12),  @"hdid-pid");
          pid = self->_pid;
          self->_pid = v17;

          if (!self->_pid)
          {
            self->_pid = (NSNumber *)&off_10018E2E8;

            BOOL v16 = 1;
          }
        }
      }

      else
      {
        BOOL v16 = 0;
      }
    }

    else
    {
      BOOL v16 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  @"Missing image path property",  a4);
    }
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (DIAttachedDeviceInfo)initWithBSDName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[DIIOMedia initWithDevName:error:](objc_alloc(&OBJC_CLASS___DIIOMedia), "initWithDevName:error:", v6, a4);

  if (v7)
  {
    id v8 = -[DIIOMedia copyBlockDeviceWithError:](v7, "copyBlockDeviceWithError:", a4);
    if (v8)
    {
      self = -[DIAttachedDeviceInfo initWithDevice:error:](self, "initWithDevice:error:", v8, a4);
      id v9 = self;
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

  return v9;
}

+ (id)newDI1DevicesArrayWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = -[DIIOObject initWithClassName:error:]( objc_alloc(&OBJC_CLASS___DIIOObject),  "initWithClassName:error:",  @"IOHDIXController",  0LL);
  id v6 = v5;
  if (v5)
  {
    id v7 = -[DIIOObject newIteratorWithOptions:error:](v5, "newIteratorWithOptions:error:", 0LL, a3);
    if (v7)
    {
      id v8 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v7);
      if (v8)
      {
        id v9 = v8;
        do
        {
          if ([v7 startedOver])
          {
            [v4 removeAllObjects];
            [v7 setStartedOver:0];
          }

          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[DIIOObject ioObjectWithClassName:iterateParent:error:]( v9,  "ioObjectWithClassName:iterateParent:error:",  @"IOHDIXHDDriveNub",  0LL,  a3));
          if (v10)
          {
            uint64_t v11 = -[DIIOObject initWithDIIOObject:](objc_alloc(&OBJC_CLASS___DIBlockDevice), "initWithDIIOObject:", v10);
            uint64_t v12 = -[DIAttachedDeviceInfo initWithDevice:error:]( objc_alloc(&OBJC_CLASS___DIAttachedDeviceInfo),  "initWithDevice:error:",  v11,  0LL);
            if (v12) {
              [v4 addObject:v12];
            }
          }

          id v13 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v7);
          id v9 = v13;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = +[DIIOObject copyDiskImagesControllerWithError:]( &OBJC_CLASS___DIIOObject,  "copyDiskImagesControllerWithError:",  a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 newIteratorWithOptions:0 error:a3];
    if (v7)
    {
      id v8 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIBlockDevice), "initWithIteratorNext:", v7);
      if (v8)
      {
        id v9 = v8;
        do
        {
          if ([v7 startedOver])
          {
            [v4 removeAllObjects];
            [v7 setStartedOver:0];
          }

          if (-[DIBlockDevice diskImageDevice](v9, "diskImageDevice"))
          {
            uint64_t v10 = -[DIAttachedDeviceInfo initWithDevice:error:]( objc_alloc(&OBJC_CLASS___DIAttachedDeviceInfo),  "initWithDevice:error:",  v9,  0LL);
            if (v10) {
              [v4 addObject:v10];
            }
          }

          uint64_t v11 = -[DIIOObject initWithIteratorNext:]( objc_alloc(&OBJC_CLASS___DIBlockDevice),  "initWithIteratorNext:",  v7);

          id v9 = v11;
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
  id v5 = objc_msgSend(a1, "newDI2DevicesArrayWithError:");
  if (v5)
  {
    id v6 = [a1 newDI1DevicesArrayWithError:a3];
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v5));
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo BSDName](self, "BSDName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo imageURL](self, "imageURL"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attached disk image device info: BSD Name [%@], image URL [%@]",  v3,  v4));

  return v5;
}

+ (id)copyAllMountPoints
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v20 = 0LL;
  int v3 = getmntinfo_r_np(&v20, 2);
  if (v3)
  {
    if (v3 >= 1)
    {
      unint64_t v4 = 0LL;
      uint64_t v5 = 2168LL * v3;
      do
      {
        id v6 = +[DIHelpers copyDevicePathWithStatfs:]( &OBJC_CLASS___DIHelpers,  "copyDevicePathWithStatfs:",  &v20[v4 / 0x878]);
        id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v20[v4 / 0x878].f_mntonname));
        if (v6)
        {
          else {
            BOOL v8 = 1;
          }
          if (!v8)
          {
            id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
            [v2 setObject:v7 forKeyedSubscript:v9];
          }
        }

        v4 += 2168LL;
      }

      while (v5 != v4);
    }

    free(v20);
  }

  else
  {
    int v10 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v19 = 0LL;
      uint64_t v11 = sub_1000B85DC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        uint64_t v13 = 3LL;
      }
      else {
        uint64_t v13 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v22 = 42;
      __int16 v23 = 2080;
      v24 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
      LODWORD(v18) = 18;
      id v14 = (char *)_os_log_send_and_compose_impl( v13,  &v19,  0LL,  0LL,  &_mh_execute_header,  v12,  16LL,  "%.*s: Failed getting mounts list",  (int)buf,  v18);

      if (v14)
      {
        fprintf(__stderrp, "%s\n", v14);
        free(v14);
      }
    }

    else
    {
      uint64_t v15 = sub_1000B85DC();
      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v22 = 42;
        __int16 v23 = 2080;
        v24 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%.*s: Failed getting mounts list",  buf,  0x12u);
      }
    }

    *__error() = v10;
  }

  return v2;
}

+ (id)newEntityDictWithIOMedia:(id)a3 mountPoints:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 BSDName]);
  BOOL v8 = (void *)v7;
  if (v7)
  {
    uint64_t v15 = @"BSD Name";
    uint64_t v16 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v9));

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v8]);
    [v10 setObject:v11 forKeyedSubscript:@"Mount Point"];

    id v13 = objc_msgSend(v5, "copyPropertyWithClass:key:", objc_opt_class(NSString, v12), @"Content");
    [v10 setObject:v13 forKeyedSubscript:@"Content"];
  }

  else
  {
    int v10 = 0LL;
  }

  return v10;
}

- (id)copyEntitiesList
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = +[DIAttachedDeviceInfo copyAllMountPoints](&OBJC_CLASS___DIAttachedDeviceInfo, "copyAllMountPoints");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo ioMedia](self, "ioMedia"));
  id v6 = +[DIAttachedDeviceInfo newEntityDictWithIOMedia:mountPoints:]( &OBJC_CLASS___DIAttachedDeviceInfo,  "newEntityDictWithIOMedia:mountPoints:",  v5,  v4);

  if (v6) {
    [v3 addObject:v6];
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo ioMedia](self, "ioMedia"));
  id v8 = [v7 newIteratorWithOptions:1 error:0];

  if (v8)
  {
    id v9 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOMedia), "initWithIteratorNext:", v8);
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

        uint64_t v12 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOMedia), "initWithIteratorNext:", v8);

        int v10 = v12;
      }

      while (v12);
    }
  }

  return v3;
}

- (id)toDictionary
{
  v22[0] = @"BSD Name";
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo BSDName](self, "BSDName"));
  v23[0] = v21;
  v22[1] = @"DiskImages Framework";
  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[DIAttachedDeviceInfo frameworkNum](self, "frameworkNum")));
  v23[1] = v3;
  v22[2] = @"DiskImageURL";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo imageURL](self, "imageURL"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
  v23[2] = v5;
  v22[3] = @"Size";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo mediaSize](self, "mediaSize"));
  v23[3] = v6;
  v22[4] = @"Preferred Block Size";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo blockSize](self, "blockSize"));
  v23[4] = v7;
  v22[5] = @"System Entities";
  id v8 = -[DIAttachedDeviceInfo copyEntitiesList](self, "copyEntitiesList");
  v23[5] = v8;
  v22[6] = @"Daemon PID";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo pid](self, "pid"));
  v23[6] = v9;
  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  7LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo shadowURL](self, "shadowURL"));
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo shadowURL](self, "shadowURL"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
    [v11 setObject:v14 forKeyedSubscript:@"ShadowURL"];
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo cacheURL](self, "cacheURL"));

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo cacheURL](self, "cacheURL"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 description]);
    [v11 setObject:v17 forKeyedSubscript:@"CacheURL"];
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo instanceId](self, "instanceId"));

  if (v18)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo instanceId](self, "instanceId"));
    [v11 setObject:v19 forKeyedSubscript:@"InstanceID"];
  }

  return v11;
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