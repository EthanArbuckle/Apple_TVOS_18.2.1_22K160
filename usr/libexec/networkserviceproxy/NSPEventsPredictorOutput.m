@interface NSPEventsPredictorOutput
- (MLMultiArray)Identity;
- (NSPEventsPredictorOutput)initWithIdentity:(id)a3;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setIdentity:(id)a3;
@end

@implementation NSPEventsPredictorOutput

- (NSPEventsPredictorOutput)initWithIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSPEventsPredictorOutput;
  v6 = -[NSPEventsPredictorOutput init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_Identity, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100103A28);
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"Identity"])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictorOutput Identity](self, "Identity"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MLFeatureValue featureValueWithMultiArray:]( &OBJC_CLASS___MLFeatureValue,  "featureValueWithMultiArray:",  v4));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (MLMultiArray)Identity
{
  return self->_Identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end