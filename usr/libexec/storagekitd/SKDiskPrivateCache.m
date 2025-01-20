@interface SKDiskPrivateCache
- (BOOL)isLiveFSContainer;
- (NSArray)sortedChildren;
- (NSObject)wholeDADisk;
- (NSString)liveDiskIdentifier;
- (NSString)rawIOContent;
- (NSString)volumeKind;
- (NSString)volumeType;
- (SKDiskPrivateCache)init;
- (id)copyHumanIOContentWithMediaDict:(id)a3 isWholeDisk:(BOOL)a4;
- (int)schemeID;
- (int64_t)mountFlags;
- (void)setIsLiveFSContainer:(BOOL)a3;
- (void)setLiveDiskIdentifier:(id)a3;
- (void)setMountFlags:(int64_t)a3;
- (void)setRawIOContent:(id)a3;
- (void)setSchemeID:(int)a3;
- (void)setSortedChildren:(id)a3;
- (void)setVolumeKind:(id)a3;
- (void)setVolumeType:(id)a3;
- (void)setWholeDADisk:(id)a3;
@end

@implementation SKDiskPrivateCache

- (SKDiskPrivateCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKDiskPrivateCache;
  result = -[SKDiskPrivateCache init](&v3, "init");
  if (result) {
    result->_schemeID = 512;
  }
  return result;
}

- (id)copyHumanIOContentWithMediaDict:(id)a3 isWholeDisk:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"Content"]);
  -[SKDiskPrivateCache setRawIOContent:](self, "setRawIOContent:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
  if (!v7) {
    return 0LL;
  }
  if (v4)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
  }

  else
  {
    v10 = objc_alloc(&OBJC_CLASS___SKIOMedia);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache wholeDADisk](self, "wholeDADisk"));
    v12 = -[SKIOMedia initWithDADisk:](v10, "initWithDADisk:", v11);

    id v8 = -[SKIOObject copyPropertyWithClass:key:]( v12,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSString),  @"Content");
  }

  if (sub_10001232C(v8))
  {
    id v13 = v8;
    if ([v13 isEqualToString:@"Apple_partition_scheme"])
    {
      uint64_t v14 = 1LL;
    }

    else if ([v13 isEqualToString:@"FDisk_partition_scheme"])
    {
      uint64_t v14 = 8LL;
    }

    else if ([v13 isEqualToString:@"GUID_partition_scheme"])
    {
      uint64_t v14 = 16LL;
    }

    else
    {
      uint64_t v14 = 512LL;
    }
  }

  else
  {
    uint64_t v14 = 512LL;
  }

  -[SKDiskPrivateCache setSchemeID:](self, "setSchemeID:", v14);
  if (-[SKDiskPrivateCache schemeID](self, "schemeID") == 512)
  {
    if (v4)
    {
      uint64_t v15 = 0LL;
      v16 = 0LL;
      while (1)
      {
        v17 = v16;
        uint64_t v18 = (unsigned __int16)word_10003D680[v15];
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
        v16 = (void *)MKTypeToHuman(v18, v19, &off_100047A38);

        if (v16)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
          unsigned int v21 = [v16 isEqualToString:v20];

          if (!v21) {
            break;
          }
        }

        v15 += 2LL;
        if (v15 == 8)
        {
          if (v16) {
            break;
          }
          goto LABEL_28;
        }
      }

- (NSObject)wholeDADisk
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setWholeDADisk:(id)a3
{
}

- (int)schemeID
{
  return self->_schemeID;
}

- (void)setSchemeID:(int)a3
{
  self->_schemeID = a3;
}

- (NSString)rawIOContent
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRawIOContent:(id)a3
{
}

- (NSString)volumeKind
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setVolumeKind:(id)a3
{
}

- (NSString)volumeType
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setVolumeType:(id)a3
{
}

- (NSString)liveDiskIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLiveDiskIdentifier:(id)a3
{
}

- (BOOL)isLiveFSContainer
{
  return self->_isLiveFSContainer;
}

- (void)setIsLiveFSContainer:(BOOL)a3
{
  self->_isLiveFSContainer = a3;
}

- (int64_t)mountFlags
{
  return self->_mountFlags;
}

- (void)setMountFlags:(int64_t)a3
{
  self->_mountFlags = a3;
}

- (NSArray)sortedChildren
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSortedChildren:(id)a3
{
}

- (void).cxx_destruct
{
}

@end