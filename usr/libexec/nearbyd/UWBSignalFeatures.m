@interface UWBSignalFeatures
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BiasEstimatorFeatures)inputFeatures;
- (BiasEstimatorOutputs)outputs;
- (UWBSignalFeatures)initWithCoder:(id)a3;
- (UWBSignalFeatures)initWithUWBSignalFeatures:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)orderedBiasEstimatorFeatutes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInputFeatures:(id)a3;
- (void)setOutputs:(id)a3;
@end

@implementation UWBSignalFeatures

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UWBSignalFeatures)initWithUWBSignalFeatures:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___UWBSignalFeatures;
  v5 = -[UWBSignalFeatures init](&v15, "init");
  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___BiasEstimatorFeatures);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 inputFeatures]);
    v8 = -[BiasEstimatorFeatures initWithBiasEstimatorFeatures:](v6, "initWithBiasEstimatorFeatures:", v7);
    inputFeatures = v5->_inputFeatures;
    v5->_inputFeatures = v8;

    v10 = objc_alloc(&OBJC_CLASS___BiasEstimatorOutputs);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 outputs]);
    v12 = -[BiasEstimatorOutputs initWithBiasEstimatorOutputs:](v10, "initWithBiasEstimatorOutputs:", v11);
    outputs = v5->_outputs;
    v5->_outputs = v12;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _[v4 initWithUWBSignalFeatures:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_inputFeatures forKey:@"inputFeatures"];
  [v4 encodeObject:self->_outputs forKey:@"outputProbabilities"];
}

- (UWBSignalFeatures)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(BiasEstimatorFeatures, v5),  @"inputFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(BiasEstimatorOutputs, v8),  @"outputProbabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UWBSignalFeatures;
  v11 = -[UWBSignalFeatures init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[UWBSignalFeatures setInputFeatures:](v11, "setInputFeatures:", v7);
    -[UWBSignalFeatures setOutputs:](v12, "setOutputs:", v10);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    BOOL v17 = 0;
    goto LABEL_12;
  }

  id v7 = v4;
  uint64_t v8 = v7;
  inputFeatures = self->_inputFeatures;
  if (inputFeatures) {
    goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 inputFeatures]);

  if (v10)
  {
    inputFeatures = self->_inputFeatures;
LABEL_5:
    v11 = (BiasEstimatorFeatures *)objc_claimAutoreleasedReturnValue([v8 inputFeatures]);
    BOOL v12 = inputFeatures == v11;

    goto LABEL_6;
  }

  BOOL v12 = 1;
LABEL_6:
  outputs = self->_outputs;
  if (!outputs)
  {
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v8 outputs]);

    if (!v14)
    {
      BOOL v16 = 1;
      goto LABEL_10;
    }

    outputs = self->_outputs;
  }

  objc_super v15 = (BiasEstimatorOutputs *)objc_claimAutoreleasedReturnValue([v8 outputs]);
  BOOL v16 = outputs == v15;

LABEL_10:
  BOOL v17 = v12 && v16;

LABEL_12:
  return v17;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorFeatures description](self->_inputFeatures, "description"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorOutputs description](self->_outputs, "description"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@, %@", v3, v4));

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = -[BiasEstimatorFeatures hash](self->_inputFeatures, "hash");
  return -[BiasEstimatorOutputs hash](self->_outputs, "hash") ^ v3;
}

- (id)orderedBiasEstimatorFeatutes
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[BiasEstimatorFeatures populateOrderedInputFeature]( self->_inputFeatures,  "populateOrderedInputFeature"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[BiasEstimatorOutputs populateOrderedBiasEstimatorOutputs]( self->_outputs,  "populateOrderedBiasEstimatorOutputs"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@, %@", v3, v4));

  return v5;
}

- (BiasEstimatorFeatures)inputFeatures
{
  return self->_inputFeatures;
}

- (void)setInputFeatures:(id)a3
{
}

- (BiasEstimatorOutputs)outputs
{
  return self->_outputs;
}

- (void)setOutputs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end