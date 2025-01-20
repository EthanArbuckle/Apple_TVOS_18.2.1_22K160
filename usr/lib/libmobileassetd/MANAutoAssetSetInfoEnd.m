@interface MANAutoAssetSetInfoEnd
+ (BOOL)supportsSecureCoding;
- (MANAutoAssetSetInfoEnd)initWithCoder:(id)a3;
- (MANAutoAssetSetInfoEnd)initWithLockReason:(id)a3 endingLockCount:(int64_t)a4;
- (NSString)endLockReason;
- (id)summary;
- (int64_t)endLockCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MANAutoAssetSetInfoEnd

- (MANAutoAssetSetInfoEnd)initWithLockReason:(id)a3 endingLockCount:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInfoEnd;
  v8 = -[MANAutoAssetSetInfoEnd init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endLockReason, a3);
    v9->_endLockCount = a4;
  }

  return v9;
}

- (MANAutoAssetSetInfoEnd)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInfoEnd;
  v5 = -[MANAutoAssetSetInfoEnd init](&v10, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"endLockReason"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    endLockReason = v5->_endLockReason;
    v5->_endLockReason = (NSString *)v7;

    v5->_endLockCount = (int64_t)[v4 decodeIntegerForKey:@"endLockCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoEnd endLockReason](self, "endLockReason"));
  [v5 encodeObject:v4 forKey:@"endLockReason"];

  objc_msgSend( v5,  "encodeInteger:forKey:",  -[MANAutoAssetSetInfoEnd endLockCount](self, "endLockCount"),  @"endLockCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%ld",  -[MANAutoAssetSetInfoEnd endLockCount](self, "endLockCount"));
  if (-[MANAutoAssetSetInfoEnd endLockCount](self, "endLockCount") == -1)
  {

    v3 = @"ALL";
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoEnd endLockReason](self, "endLockReason"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"endLockReason:%@|endLockCount:%@",  v4,  v3));

  return v5;
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