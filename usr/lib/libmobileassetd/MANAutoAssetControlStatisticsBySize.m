@interface MANAutoAssetControlStatisticsBySize
+ (BOOL)supportsSecureCoding;
- (MANAutoAssetControlStatisticsBySize)init;
- (MANAutoAssetControlStatisticsBySize)initWithCoder:(id)a3;
- (MANAutoAssetControlStatisticsBySize)initWithInitialValue:(int64_t)a3;
- (id)copy;
- (id)description;
- (id)summary;
- (int64_t)fullAssets;
- (int64_t)fullBytes;
- (int64_t)patchedAssets;
- (int64_t)patchedBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setFullAssets:(int64_t)a3;
- (void)setFullBytes:(int64_t)a3;
- (void)setPatchedAssets:(int64_t)a3;
- (void)setPatchedBytes:(int64_t)a3;
@end

@implementation MANAutoAssetControlStatisticsBySize

- (MANAutoAssetControlStatisticsBySize)init
{
  return -[MANAutoAssetControlStatisticsBySize initWithInitialValue:](self, "initWithInitialValue:", 0LL);
}

- (MANAutoAssetControlStatisticsBySize)initWithInitialValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MANAutoAssetControlStatisticsBySize;
  result = -[MANAutoAssetControlStatisticsBySize init](&v5, "init");
  if (result)
  {
    result->_patchedAssets = a3;
    result->_patchedBytes = a3;
    result->_fullAssets = a3;
    result->_fullBytes = a3;
  }

  return result;
}

- (MANAutoAssetControlStatisticsBySize)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MANAutoAssetControlStatisticsBySize;
  objc_super v5 = -[MANAutoAssetControlStatisticsBySize init](&v7, "init");
  if (v5)
  {
    v5->_patchedAssets = (int64_t)[v4 decodeInt64ForKey:@"patchedAssets"];
    v5->_patchedBytes = (int64_t)[v4 decodeInt64ForKey:@"patchedBytes"];
    v5->_fullAssets = (int64_t)[v4 decodeInt64ForKey:@"fullAssets"];
    v5->_fullBytes = (int64_t)[v4 decodeInt64ForKey:@"fullBytes"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsBySize patchedAssets](self, "patchedAssets"),  @"patchedAssets");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsBySize patchedBytes](self, "patchedBytes"),  @"patchedBytes");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsBySize fullAssets](self, "fullAssets"),  @"fullAssets");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsBySize fullBytes](self, "fullBytes"),  @"fullBytes");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetControlStatisticsBySize);
  -[MANAutoAssetControlStatisticsBySize setPatchedAssets:]( v3,  "setPatchedAssets:",  -[MANAutoAssetControlStatisticsBySize patchedAssets](self, "patchedAssets"));
  -[MANAutoAssetControlStatisticsBySize setPatchedBytes:]( v3,  "setPatchedBytes:",  -[MANAutoAssetControlStatisticsBySize patchedBytes](self, "patchedBytes"));
  -[MANAutoAssetControlStatisticsBySize setFullAssets:]( v3,  "setFullAssets:",  -[MANAutoAssetControlStatisticsBySize fullAssets](self, "fullAssets"));
  -[MANAutoAssetControlStatisticsBySize setFullBytes:]( v3,  "setFullBytes:",  -[MANAutoAssetControlStatisticsBySize fullBytes](self, "fullBytes"));
  return v3;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @">>>\n   patchedAssets: %lld\n    patchedBytes: %lld\n      fullAssets: %lld\n       fullBytes: %lld\n<<<]",  -[MANAutoAssetControlStatisticsBySize patchedAssets](self, "patchedAssets"),  -[MANAutoAssetControlStatisticsBySize patchedBytes](self, "patchedBytes"),  -[MANAutoAssetControlStatisticsBySize fullAssets](self, "fullAssets"),  -[MANAutoAssetControlStatisticsBySize fullBytes](self, "fullBytes"));
}

- (id)summary
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[patchedAssets:%lld,patchedBytes:%lld,fullAssets:%lld,fullBytes:%lld]",  -[MANAutoAssetControlStatisticsBySize patchedAssets](self, "patchedAssets"),  -[MANAutoAssetControlStatisticsBySize patchedBytes](self, "patchedBytes"),  -[MANAutoAssetControlStatisticsBySize fullAssets](self, "fullAssets"),  -[MANAutoAssetControlStatisticsBySize fullBytes](self, "fullBytes"));
}

- (int64_t)patchedAssets
{
  return self->_patchedAssets;
}

- (void)setPatchedAssets:(int64_t)a3
{
  self->_patchedAssets = a3;
}

- (int64_t)patchedBytes
{
  return self->_patchedBytes;
}

- (void)setPatchedBytes:(int64_t)a3
{
  self->_patchedBytes = a3;
}

- (int64_t)fullAssets
{
  return self->_fullAssets;
}

- (void)setFullAssets:(int64_t)a3
{
  self->_fullAssets = a3;
}

- (int64_t)fullBytes
{
  return self->_fullBytes;
}

- (void)setFullBytes:(int64_t)a3
{
  self->_fullBytes = a3;
}

@end