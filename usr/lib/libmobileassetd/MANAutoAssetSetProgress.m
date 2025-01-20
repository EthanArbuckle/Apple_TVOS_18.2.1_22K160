@interface MANAutoAssetSetProgress
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStalled;
- (MANAutoAssetSetProgress)init;
- (MANAutoAssetSetProgress)initWithCoder:(id)a3;
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

@implementation MANAutoAssetSetProgress

- (MANAutoAssetSetProgress)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetProgress;
  result = -[MANAutoAssetSetProgress init](&v3, "init");
  if (result)
  {
    result->_isStalled = 0;
    *(_OWORD *)&result->_downloadedAssetCount = 0u;
    *(_OWORD *)&result->_totalExpectedBytes = 0u;
    result->_expectedTimeRemainingSecs = 0.0;
  }

  return result;
}

- (MANAutoAssetSetProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetProgress;
  v5 = -[MANAutoAssetSetProgress init](&v8, "init");
  if (v5)
  {
    v5->_downloadedAssetCount = (int64_t)[v4 decodeInt64ForKey:@"downloadedAssetCount"];
    v5->_remainingAssetCount = (int64_t)[v4 decodeInt64ForKey:@"remainingAssetCount"];
    v5->_totalExpectedBytes = (int64_t)[v4 decodeInt64ForKey:@"totalExpectedBytes"];
    v5->_totalWrittenBytes = (int64_t)[v4 decodeInt64ForKey:@"totalWrittenBytes"];
    v5->_isStalled = [v4 decodeBoolForKey:@"isStalled"];
    [v4 decodeFloatForKey:@"expectedTimeRemainingSecs"];
    v5->_expectedTimeRemainingSecs = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MANAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount"),  @"downloadedAssetCount");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MANAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount"),  @"remainingAssetCount");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MANAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes"),  @"totalExpectedBytes");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MANAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes"),  @"totalWrittenBytes");
  objc_msgSend(v5, "encodeBool:forKey:", -[MANAutoAssetSetProgress isStalled](self, "isStalled"), @"isStalled");
  -[MANAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  *(float *)&double v4 = v4;
  [v5 encodeFloat:@"expectedTimeRemainingSecs" forKey:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetProgress);
  -[MANAutoAssetSetProgress setDownloadedAssetCount:]( v3,  "setDownloadedAssetCount:",  -[MANAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount"));
  -[MANAutoAssetSetProgress setRemainingAssetCount:]( v3,  "setRemainingAssetCount:",  -[MANAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount"));
  -[MANAutoAssetSetProgress setTotalExpectedBytes:]( v3,  "setTotalExpectedBytes:",  -[MANAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes"));
  -[MANAutoAssetSetProgress setTotalWrittenBytes:]( v3,  "setTotalWrittenBytes:",  -[MANAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes"));
  -[MANAutoAssetSetProgress setIsStalled:](v3, "setIsStalled:", -[MANAutoAssetSetProgress isStalled](self, "isStalled"));
  -[MANAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  -[MANAutoAssetSetProgress setExpectedTimeRemainingSecs:](v3, "setExpectedTimeRemainingSecs:");
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (MANAutoAssetSetProgress *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetProgress);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      float v6 = v4;
      id v7 = -[MANAutoAssetSetProgress downloadedAssetCount](v6, "downloadedAssetCount");
      if (v7 == (id)-[MANAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount")
        && (id v8 = -[MANAutoAssetSetProgress remainingAssetCount](v6, "remainingAssetCount"),
            v8 == (id)-[MANAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount"))
        && (id v9 = -[MANAutoAssetSetProgress totalExpectedBytes](v6, "totalExpectedBytes"),
            v9 == (id)-[MANAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes"))
        && (id v10 = -[MANAutoAssetSetProgress totalWrittenBytes](v6, "totalWrittenBytes"),
            v10 == (id)-[MANAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes"))
        && (unsigned int v11 = -[MANAutoAssetSetProgress isStalled](v6, "isStalled"),
            v11 == -[MANAutoAssetSetProgress isStalled](self, "isStalled")))
      {
        -[MANAutoAssetSetProgress expectedTimeRemainingSecs](v6, "expectedTimeRemainingSecs");
        double v15 = v14;
        -[MANAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
        char v12 = v15 == v16;
      }

      else
      {
        char v12 = 0;
      }
    }

    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)summary
{
  int64_t v3 = -[MANAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount");
  int64_t v4 = -[MANAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount");
  int64_t v5 = -[MANAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes");
  int64_t v6 = -[MANAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes");
  if (-[MANAutoAssetSetProgress isStalled](self, "isStalled")) {
    id v7 = @"Y";
  }
  else {
    id v7 = @"N";
  }
  -[MANAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"downloadedCount:%lld|remainingAssetCount:%lld|expectedBytes:%lld|writtenBytes:%lld|stalled:%@|timeRemainingSecs:%f",  v3,  v4,  v5,  v6,  v7,  v8);
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