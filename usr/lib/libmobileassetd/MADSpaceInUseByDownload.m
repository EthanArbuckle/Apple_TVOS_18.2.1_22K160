@interface MADSpaceInUseByDownload
+ (BOOL)supportsSecureCoding;
- (MADSpaceInUseByDownload)initWithCoder:(id)a3;
- (MADSpaceInUseByDownload)initWithSpaceCheckedID:(id)a3;
- (MADSpaceInUseByDownload)initWithSpaceCheckedID:(id)a3 totalRequiredFreeSpace:(unint64_t)a4 cacheDeleteUrgency:(int)a5;
- (NSString)spaceCheckedID;
- (id)description;
- (int)cacheDeleteUrgency;
- (unint64_t)totalRequiredFreeSpace;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheDeleteUrgency:(int)a3;
- (void)setSpaceCheckedID:(id)a3;
- (void)setTotalRequiredFreeSpace:(unint64_t)a3;
@end

@implementation MADSpaceInUseByDownload

- (MADSpaceInUseByDownload)initWithSpaceCheckedID:(id)a3 totalRequiredFreeSpace:(unint64_t)a4 cacheDeleteUrgency:(int)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MADSpaceInUseByDownload;
  v10 = -[MADSpaceInUseByDownload init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_spaceCheckedID, a3);
    v11->_totalRequiredFreeSpace = a4;
    v11->_cacheDeleteUrgency = a5;
  }

  return v11;
}

- (MADSpaceInUseByDownload)initWithSpaceCheckedID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MADSpaceInUseByDownload;
  v6 = -[MADSpaceInUseByDownload init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spaceCheckedID, a3);
    v7->_totalRequiredFreeSpace = 0LL;
    v7->_cacheDeleteUrgency = 0;
  }

  return v7;
}

- (MADSpaceInUseByDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MADSpaceInUseByDownload;
  id v5 = -[MADSpaceInUseByDownload init](&v10, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"spaceCheckedID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    spaceCheckedID = v5->_spaceCheckedID;
    v5->_spaceCheckedID = (NSString *)v7;

    v5->_totalRequiredFreeSpace = (unint64_t)[v4 decodeInt64ForKey:@"totalRequiredFreeSpace"];
    v5->_cacheDeleteUrgency = [v4 decodeIntForKey:@"cacheDeleteUrgency"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADSpaceInUseByDownload spaceCheckedID](self, "spaceCheckedID"));
  [v5 encodeObject:v4 forKey:@"spaceCheckedID"];

  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MADSpaceInUseByDownload totalRequiredFreeSpace](self, "totalRequiredFreeSpace"),  @"totalRequiredFreeSpace");
  objc_msgSend( v5,  "encodeInt:forKey:",  -[MADSpaceInUseByDownload cacheDeleteUrgency](self, "cacheDeleteUrgency"),  @"cacheDeleteUrgency");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADSpaceInUseByDownload spaceCheckedID](self, "spaceCheckedID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"spaceCheckedID:%@, totalRequiredFreeSpace:%llu, cacheDeleteUrgency: %d",  v3,  -[MADSpaceInUseByDownload totalRequiredFreeSpace](self, "totalRequiredFreeSpace"),  -[MADSpaceInUseByDownload cacheDeleteUrgency](self, "cacheDeleteUrgency")));

  return v4;
}

- (NSString)spaceCheckedID
{
  return self->_spaceCheckedID;
}

- (void)setSpaceCheckedID:(id)a3
{
}

- (unint64_t)totalRequiredFreeSpace
{
  return self->_totalRequiredFreeSpace;
}

- (void)setTotalRequiredFreeSpace:(unint64_t)a3
{
  self->_totalRequiredFreeSpace = a3;
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (void)setCacheDeleteUrgency:(int)a3
{
  self->_cacheDeleteUrgency = a3;
}

- (void).cxx_destruct
{
}

@end