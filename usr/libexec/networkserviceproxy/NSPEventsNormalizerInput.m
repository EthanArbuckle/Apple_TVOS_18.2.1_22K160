@interface NSPEventsNormalizerInput
- (MLMultiArray)normalizer_input;
- (NSPEventsNormalizerInput)initWithNormalizer_input:(id)a3;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setNormalizer_input:(id)a3;
@end

@implementation NSPEventsNormalizerInput

- (NSPEventsNormalizerInput)initWithNormalizer_input:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSPEventsNormalizerInput;
  v6 = -[NSPEventsNormalizerInput init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_normalizer_input, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100103A88);
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"normalizer_input"])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsNormalizerInput normalizer_input](self, "normalizer_input"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MLFeatureValue featureValueWithMultiArray:]( &OBJC_CLASS___MLFeatureValue,  "featureValueWithMultiArray:",  v4));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (MLMultiArray)normalizer_input
{
  return self->_normalizer_input;
}

- (void)setNormalizer_input:(id)a3
{
}

- (void).cxx_destruct
{
}

@end