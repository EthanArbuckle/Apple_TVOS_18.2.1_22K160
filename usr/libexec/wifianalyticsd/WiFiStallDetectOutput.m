@interface WiFiStallDetectOutput
- (NSDictionary)stallProbability;
- (NSSet)featureNames;
- (WiFiStallDetectOutput)initWithStall:(int64_t)a3 stallProbability:(id)a4;
- (id)featureValueForName:(id)a3;
- (int64_t)stall;
- (void)setStall:(int64_t)a3;
- (void)setStallProbability:(id)a3;
@end

@implementation WiFiStallDetectOutput

- (WiFiStallDetectOutput)initWithStall:(int64_t)a3 stallProbability:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WiFiStallDetectOutput;
  v8 = -[WiFiStallDetectOutput init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_stall = a3;
    objc_storeStrong((id *)&v8->_stallProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1000E03C0);
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"stall"])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[MLFeatureValue featureValueWithInt64:]( &OBJC_CLASS___MLFeatureValue,  "featureValueWithInt64:",  -[WiFiStallDetectOutput stall](self, "stall")));
  }

  else if ([v4 isEqualToString:@"stallProbability"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiStallDetectOutput stallProbability](self, "stallProbability"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[MLFeatureValue featureValueWithDictionary:error:]( &OBJC_CLASS___MLFeatureValue,  "featureValueWithDictionary:error:",  v6,  0LL));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (int64_t)stall
{
  return self->_stall;
}

- (void)setStall:(int64_t)a3
{
  self->_stall = a3;
}

- (NSDictionary)stallProbability
{
  return self->_stallProbability;
}

- (void)setStallProbability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end