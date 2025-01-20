@interface NSPEventsPredictorTrainingInput
- (MLMultiArray)lstm_input;
- (MLMultiArray)sequential_TimeDistributedDense_dense_BiasAdd_true;
- (NSPEventsPredictorTrainingInput)initWithLstm_input:(id)a3 sequential_TimeDistributedDense_dense_BiasAdd_true:(id)a4;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setLstm_input:(id)a3;
- (void)setSequential_TimeDistributedDense_dense_BiasAdd_true:(id)a3;
@end

@implementation NSPEventsPredictorTrainingInput

- (NSPEventsPredictorTrainingInput)initWithLstm_input:(id)a3 sequential_TimeDistributedDense_dense_BiasAdd_true:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSPEventsPredictorTrainingInput;
  v9 = -[NSPEventsPredictorTrainingInput init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lstm_input, a3);
    objc_storeStrong((id *)&v10->_sequential_TimeDistributedDense_dense_BiasAdd_true, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100103A40);
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"lstm_input"])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSPEventsPredictorTrainingInput lstm_input](self, "lstm_input"));
  }

  else
  {
    if (![v4 isEqualToString:@"sequential/TimeDistributedDense/dense/BiasAdd_true"])
    {
      id v7 = 0LL;
      goto LABEL_7;
    }

    uint64_t v5 = objc_claimAutoreleasedReturnValue( -[NSPEventsPredictorTrainingInput sequential_TimeDistributedDense_dense_BiasAdd_true]( self,  "sequential_TimeDistributedDense_dense_BiasAdd_true"));
  }

  v6 = (void *)v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MLFeatureValue featureValueWithMultiArray:]( &OBJC_CLASS___MLFeatureValue,  "featureValueWithMultiArray:",  v5));

LABEL_7:
  return v7;
}

- (MLMultiArray)lstm_input
{
  return self->_lstm_input;
}

- (void)setLstm_input:(id)a3
{
}

- (MLMultiArray)sequential_TimeDistributedDense_dense_BiasAdd_true
{
  return self->_sequential_TimeDistributedDense_dense_BiasAdd_true;
}

- (void)setSequential_TimeDistributedDense_dense_BiasAdd_true:(id)a3
{
}

- (void).cxx_destruct
{
}

@end