@interface NSPEventsPredictorInput
- (MLMultiArray)lstm_input;
- (NSPEventsPredictorInput)initWithLstm_input:(id)a3;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setLstm_input:(id)a3;
@end

@implementation NSPEventsPredictorInput

- (NSPEventsPredictorInput)initWithLstm_input:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSPEventsPredictorInput;
  v6 = -[NSPEventsPredictorInput init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lstm_input, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100103A10);
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"lstm_input"])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictorInput lstm_input](self, "lstm_input"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MLFeatureValue featureValueWithMultiArray:]( &OBJC_CLASS___MLFeatureValue,  "featureValueWithMultiArray:",  v4));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (MLMultiArray)lstm_input
{
  return self->_lstm_input;
}

- (void)setLstm_input:(id)a3
{
}

- (void).cxx_destruct
{
}

@end