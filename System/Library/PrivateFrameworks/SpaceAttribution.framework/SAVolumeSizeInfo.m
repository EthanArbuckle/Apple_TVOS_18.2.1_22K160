@interface SAVolumeSizeInfo
+ (BOOL)supportsSecureCoding;
- (NSString)mountedOn;
- (SAVolumeSizeInfo)init;
- (SAVolumeSizeInfo)initWithCoder:(id)a3;
- (unint64_t)capacity;
- (unint64_t)purgeableSize;
- (unint64_t)rawUsed;
- (unint64_t)used;
- (void)encodeWithCoder:(id)a3;
- (void)setCapacity:(unint64_t)a3;
- (void)setMountedOn:(id)a3;
- (void)setPurgeableSize:(unint64_t)a3;
- (void)setRawUsed:(unint64_t)a3;
- (void)setUsed:(unint64_t)a3;
@end

@implementation SAVolumeSizeInfo

- (SAVolumeSizeInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SAVolumeSizeInfo;
  v2 = -[SAVolumeSizeInfo init](&v6, "init");
  v3 = (SAVolumeSizeInfo *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = 0LL;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t used = self->_used;
  id v5 = a3;
  [v5 encodeInt64:used forKey:@"usedSize"];
  [v5 encodeInt64:self->_purgeableSize forKey:@"purgeableSize"];
  [v5 encodeInt64:self->_rawUsed forKey:@"rawUsedSize"];
  [v5 encodeObject:self->_mountedOn forKey:@"mountedOnPath"];
  [v5 encodeInt64:self->_capacity forKey:@"capacitySize"];
}

- (SAVolumeSizeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SAVolumeSizeInfo;
  id v5 = -[SAVolumeSizeInfo init](&v10, "init");
  if (v5)
  {
    v5->_unint64_t used = (unint64_t)[v4 decodeInt64ForKey:@"usedSize"];
    v5->_purgeableSize = (unint64_t)[v4 decodeInt64ForKey:@"purgeableSize"];
    v5->_rawUsed = (unint64_t)[v4 decodeInt64ForKey:@"rawUsedSize"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"mountedOnPath"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    mountedOn = v5->_mountedOn;
    v5->_mountedOn = (NSString *)v7;

    v5->_capacity = (unint64_t)[v4 decodeInt64ForKey:@"capacitySize"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)used
{
  return self->_used;
}

- (void)setUsed:(unint64_t)a3
{
  self->_unint64_t used = a3;
}

- (unint64_t)rawUsed
{
  return self->_rawUsed;
}

- (void)setRawUsed:(unint64_t)a3
{
  self->_rawUsed = a3;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (unint64_t)purgeableSize
{
  return self->_purgeableSize;
}

- (void)setPurgeableSize:(unint64_t)a3
{
  self->_purgeableSize = a3;
}

- (NSString)mountedOn
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMountedOn:(id)a3
{
}

- (void).cxx_destruct
{
}

@end