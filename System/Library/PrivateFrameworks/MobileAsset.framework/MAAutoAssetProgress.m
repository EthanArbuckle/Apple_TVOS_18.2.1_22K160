@interface MAAutoAssetProgress
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStalled;
- (MAAutoAssetProgress)init;
- (MAAutoAssetProgress)initWithCoder:(id)a3;
- (double)expectedTimeRemainingSecs;
- (id)copy;
- (id)newSummaryDictionary;
- (id)summary;
- (int64_t)totalExpectedBytes;
- (int64_t)totalWrittenBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setExpectedTimeRemainingSecs:(double)a3;
- (void)setIsStalled:(BOOL)a3;
- (void)setTotalExpectedBytes:(int64_t)a3;
- (void)setTotalWrittenBytes:(int64_t)a3;
@end

@implementation MAAutoAssetProgress

- (MAAutoAssetProgress)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MAAutoAssetProgress;
  result = -[MAAutoAssetProgress init](&v3, sel_init);
  if (result)
  {
    result->_isStalled = 0;
    result->_totalWrittenBytes = 0LL;
    result->_expectedTimeRemainingSecs = 0.0;
    result->_totalExpectedBytes = 0LL;
  }

  return result;
}

- (MAAutoAssetProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MAAutoAssetProgress;
  v5 = -[MAAutoAssetProgress init](&v8, sel_init);
  if (v5)
  {
    v5->_totalExpectedBytes = [v4 decodeInt64ForKey:@"totalExpectedBytes"];
    v5->_totalWrittenBytes = [v4 decodeInt64ForKey:@"totalWrittenBytes"];
    v5->_isStalled = [v4 decodeBoolForKey:@"isStalled"];
    [v4 decodeDoubleForKey:@"expectedTimeRemainingSecs"];
    v5->_expectedTimeRemainingSecs = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetProgress totalExpectedBytes](self, "totalExpectedBytes"),  @"totalExpectedBytes");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetProgress totalWrittenBytes](self, "totalWrittenBytes"),  @"totalWrittenBytes");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetProgress isStalled](self, "isStalled"), @"isStalled");
  -[MAAutoAssetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  objc_msgSend(v4, "encodeDouble:forKey:", @"expectedTimeRemainingSecs");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetProgress);
  -[MAAutoAssetProgress setTotalExpectedBytes:]( v3,  "setTotalExpectedBytes:",  -[MAAutoAssetProgress totalExpectedBytes](self, "totalExpectedBytes"));
  -[MAAutoAssetProgress setTotalWrittenBytes:]( v3,  "setTotalWrittenBytes:",  -[MAAutoAssetProgress totalWrittenBytes](self, "totalWrittenBytes"));
  -[MAAutoAssetProgress setIsStalled:](v3, "setIsStalled:", -[MAAutoAssetProgress isStalled](self, "isStalled"));
  -[MAAutoAssetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  -[MAAutoAssetProgress setExpectedTimeRemainingSecs:](v3, "setExpectedTimeRemainingSecs:");
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MAAutoAssetProgress *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      uint64_t v6 = -[MAAutoAssetProgress totalExpectedBytes](v5, "totalExpectedBytes");
      if (v6 == -[MAAutoAssetProgress totalExpectedBytes](self, "totalExpectedBytes")
        && (uint64_t v7 = -[MAAutoAssetProgress totalWrittenBytes](v5, "totalWrittenBytes"),
            v7 == -[MAAutoAssetProgress totalWrittenBytes](self, "totalWrittenBytes"))
        && (BOOL v8 = -[MAAutoAssetProgress isStalled](v5, "isStalled"),
            v8 == -[MAAutoAssetProgress isStalled](self, "isStalled")))
      {
        -[MAAutoAssetProgress expectedTimeRemainingSecs](v5, "expectedTimeRemainingSecs");
        double v12 = v11;
        -[MAAutoAssetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
        BOOL v9 = v12 == v13;
      }

      else
      {
        BOOL v9 = 0;
      }
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)summary
{
  objc_super v3 = (void *)NSString;
  int64_t v4 = -[MAAutoAssetProgress totalExpectedBytes](self, "totalExpectedBytes");
  int64_t v5 = -[MAAutoAssetProgress totalWrittenBytes](self, "totalWrittenBytes");
  if (-[MAAutoAssetProgress isStalled](self, "isStalled")) {
    uint64_t v6 = @"Y";
  }
  else {
    uint64_t v6 = @"N";
  }
  -[MAAutoAssetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  return (id)[v3 stringWithFormat:@"expectedBytes:%lld|writtenBytes:%lld|stalled:%@|timeRemainingSecs:%f", v4, v5, v6, v7];
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  -[MAAutoAssetProgress totalExpectedBytes](self, "totalExpectedBytes"));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v4 forKey:@"totalExpectedBytes"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  -[MAAutoAssetProgress totalWrittenBytes](self, "totalWrittenBytes"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v5 forKey:@"totalWrittenBytes"];

  if (-[MAAutoAssetProgress isStalled](self, "isStalled")) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v3 setSafeObject:v6 forKey:@"isStalled"];
  uint64_t v7 = (void *)MEMORY[0x189607968];
  -[MAAutoAssetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  objc_msgSend(v7, "numberWithDouble:");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v8 forKey:@"expectedTimeRemainingSecs"];

  return v3;
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