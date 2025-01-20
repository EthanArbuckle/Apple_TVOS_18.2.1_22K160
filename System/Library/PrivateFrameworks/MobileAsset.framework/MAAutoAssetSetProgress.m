@interface MAAutoAssetSetProgress
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStalled;
- (MAAutoAssetSetProgress)init;
- (MAAutoAssetSetProgress)initWithCoder:(id)a3;
- (double)expectedTimeRemainingSecs;
- (id)copy;
- (id)summary;
- (int64_t)downloadedAssetCount;
- (int64_t)remainingAssetCount;
- (int64_t)totalExpectedBytes;
- (int64_t)totalWrittenBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadedAssetCount:(int64_t)a3;
- (void)setExpectedTimeRemainingSecs:(double)a3;
- (void)setIsStalled:(BOOL)a3;
- (void)setRemainingAssetCount:(int64_t)a3;
- (void)setTotalExpectedBytes:(int64_t)a3;
- (void)setTotalWrittenBytes:(int64_t)a3;
@end

@implementation MAAutoAssetSetProgress

- (MAAutoAssetSetProgress)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetProgress;
  result = -[MAAutoAssetSetProgress init](&v3, sel_init);
  if (result)
  {
    result->_isStalled = 0;
    *(_OWORD *)&result->_downloadedAssetCount = 0u;
    *(_OWORD *)&result->_totalExpectedBytes = 0u;
    result->_expectedTimeRemainingSecs = 0.0;
  }

  return result;
}

- (MAAutoAssetSetProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetProgress;
  v5 = -[MAAutoAssetSetProgress init](&v8, sel_init);
  if (v5)
  {
    v5->_downloadedAssetCount = [v4 decodeInt64ForKey:@"downloadedAssetCount"];
    v5->_remainingAssetCount = [v4 decodeInt64ForKey:@"remainingAssetCount"];
    v5->_totalExpectedBytes = [v4 decodeInt64ForKey:@"totalExpectedBytes"];
    v5->_totalWrittenBytes = [v4 decodeInt64ForKey:@"totalWrittenBytes"];
    v5->_isStalled = [v4 decodeBoolForKey:@"isStalled"];
    [v4 decodeFloatForKey:@"expectedTimeRemainingSecs"];
    v5->_expectedTimeRemainingSecs = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MAAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount"),  @"downloadedAssetCount");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MAAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount"),  @"remainingAssetCount");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MAAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes"),  @"totalExpectedBytes");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MAAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes"),  @"totalWrittenBytes");
  objc_msgSend(v5, "encodeBool:forKey:", -[MAAutoAssetSetProgress isStalled](self, "isStalled"), @"isStalled");
  -[MAAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  *(float *)&double v4 = v4;
  [v5 encodeFloat:@"expectedTimeRemainingSecs" forKey:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetSetProgress);
  -[MAAutoAssetSetProgress setDownloadedAssetCount:]( v3,  "setDownloadedAssetCount:",  -[MAAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount"));
  -[MAAutoAssetSetProgress setRemainingAssetCount:]( v3,  "setRemainingAssetCount:",  -[MAAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount"));
  -[MAAutoAssetSetProgress setTotalExpectedBytes:]( v3,  "setTotalExpectedBytes:",  -[MAAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes"));
  -[MAAutoAssetSetProgress setTotalWrittenBytes:]( v3,  "setTotalWrittenBytes:",  -[MAAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes"));
  -[MAAutoAssetSetProgress setIsStalled:](v3, "setIsStalled:", -[MAAutoAssetSetProgress isStalled](self, "isStalled"));
  -[MAAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  -[MAAutoAssetSetProgress setExpectedTimeRemainingSecs:](v3, "setExpectedTimeRemainingSecs:");
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (MAAutoAssetSetProgress *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      uint64_t v6 = -[MAAutoAssetSetProgress downloadedAssetCount](v5, "downloadedAssetCount");
      if (v6 == -[MAAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount")
        && (uint64_t v7 = -[MAAutoAssetSetProgress remainingAssetCount](v5, "remainingAssetCount"),
            v7 == -[MAAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount"))
        && (uint64_t v8 = -[MAAutoAssetSetProgress totalExpectedBytes](v5, "totalExpectedBytes"),
            v8 == -[MAAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes"))
        && (uint64_t v9 = -[MAAutoAssetSetProgress totalWrittenBytes](v5, "totalWrittenBytes"),
            v9 == -[MAAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes"))
        && (BOOL v10 = -[MAAutoAssetSetProgress isStalled](v5, "isStalled"),
            v10 == -[MAAutoAssetSetProgress isStalled](self, "isStalled")))
      {
        -[MAAutoAssetSetProgress expectedTimeRemainingSecs](v5, "expectedTimeRemainingSecs");
        double v14 = v13;
        -[MAAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
        BOOL v11 = v14 == v15;
      }

      else
      {
        BOOL v11 = 0;
      }
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)summary
{
  objc_super v3 = (void *)NSString;
  int64_t v4 = -[MAAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount");
  int64_t v5 = -[MAAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount");
  int64_t v6 = -[MAAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes");
  int64_t v7 = -[MAAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes");
  if (-[MAAutoAssetSetProgress isStalled](self, "isStalled")) {
    uint64_t v8 = @"Y";
  }
  else {
    uint64_t v8 = @"N";
  }
  -[MAAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  return (id)[v3 stringWithFormat:@"downloadedCount:%lld|remainingAssetCount:%lld|expectedBytes:%lld|writtenBytes:%lld|stalled:%@|timeRemainingSecs:%f", v4, v5, v6, v7, v8, v9];
}

- (int64_t)downloadedAssetCount
{
  return self->_downloadedAssetCount;
}

- (void)setDownloadedAssetCount:(int64_t)a3
{
  self->_downloadedAssetCount = a3;
}

- (int64_t)remainingAssetCount
{
  return self->_remainingAssetCount;
}

- (void)setRemainingAssetCount:(int64_t)a3
{
  self->_remainingAssetCount = a3;
}

- (int64_t)totalExpectedBytes
{
  return self->_totalExpectedBytes;
}

- (void)setTotalExpectedBytes:(int64_t)a3
{
  self->_totalExpectedBytes = a3;
}

- (int64_t)totalWrittenBytes
{
  return self->_totalWrittenBytes;
}

- (void)setTotalWrittenBytes:(int64_t)a3
{
  self->_totalWrittenBytes = a3;
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (void)setIsStalled:(BOOL)a3
{
  self->_isStalled = a3;
}

- (double)expectedTimeRemainingSecs
{
  return self->_expectedTimeRemainingSecs;
}

- (void)setExpectedTimeRemainingSecs:(double)a3
{
  self->_expectedTimeRemainingSecs = a3;
}

@end