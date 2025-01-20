@interface MAAutoAssetSetInfoEnd
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetSetInfoEnd)initWithCoder:(id)a3;
- (MAAutoAssetSetInfoEnd)initWithLockReason:(id)a3 endingLockCount:(int64_t)a4;
- (NSString)endLockReason;
- (id)summary;
- (int64_t)endLockCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetSetInfoEnd

- (MAAutoAssetSetInfoEnd)initWithLockReason:(id)a3 endingLockCount:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetInfoEnd;
  v8 = -[MAAutoAssetSetInfoEnd init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endLockReason, a3);
    v9->_endLockCount = a4;
  }

  return v9;
}

- (MAAutoAssetSetInfoEnd)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetInfoEnd;
  v5 = -[MAAutoAssetSetInfoEnd init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endLockReason"];
    endLockReason = v5->_endLockReason;
    v5->_endLockReason = (NSString *)v6;

    v5->_endLockCount = [v4 decodeIntegerForKey:@"endLockCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  -[MAAutoAssetSetInfoEnd endLockReason](self, "endLockReason");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v4 forKey:@"endLockReason"];

  objc_msgSend( v5,  "encodeInteger:forKey:",  -[MAAutoAssetSetInfoEnd endLockCount](self, "endLockCount"),  @"endLockCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%ld",  -[MAAutoAssetSetInfoEnd endLockCount](self, "endLockCount"));
  if (-[MAAutoAssetSetInfoEnd endLockCount](self, "endLockCount") == -1)
  {

    v3 = @"ALL";
  }

  id v4 = (void *)NSString;
  -[MAAutoAssetSetInfoEnd endLockReason](self, "endLockReason");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"endLockReason:%@|endLockCount:%@", v5, v3];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)endLockReason
{
  return self->_endLockReason;
}

- (int64_t)endLockCount
{
  return self->_endLockCount;
}

- (void).cxx_destruct
{
}

@end