@interface BiasEstimatorOutputs
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BiasEstimatorOutputs)initWithBiasEstimatorOutputs:(id)a3;
- (BiasEstimatorOutputs)initWithCoder:(id)a3;
- (BiasEstimatorOutputs)initWithOuputProbabilities:(id)a3 rawRange:(double)a4 correctedRange:(double)a5;
- (NSArray)outProbabilities;
- (double)correctedRange;
- (double)rawRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)populateOrderedBiasEstimatorOutputs;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCorrectedRange:(double)a3;
- (void)setOutProbabilities:(id)a3;
- (void)setRawRange:(double)a3;
@end

@implementation BiasEstimatorOutputs

- (BiasEstimatorOutputs)initWithOuputProbabilities:(id)a3 rawRange:(double)a4 correctedRange:(double)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___BiasEstimatorOutputs;
  v9 = -[BiasEstimatorOutputs init](&v22, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(id *)(*((void *)&v18 + 1) + 8LL * (void)v14);
          objc_msgSend(v15, "doubleValue", (void)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          -[NSMutableArray addObject:](v10, "addObject:", v16);

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }

      while (v12);
    }

    -[BiasEstimatorOutputs setOutProbabilities:](v9, "setOutProbabilities:", v10);
    -[BiasEstimatorOutputs setRawRange:](v9, "setRawRange:", a4);
    -[BiasEstimatorOutputs setCorrectedRange:](v9, "setCorrectedRange:", a5);
  }

  return v9;
}

- (BiasEstimatorOutputs)initWithBiasEstimatorOutputs:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"UWBSignalFeatures.mm", 291, @"Invalid parameter not satisfying: %@", @"outputs" object file lineNumber description];
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___BiasEstimatorOutputs;
  v6 = -[BiasEstimatorOutputs init](&v14, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 outProbabilities]);
    id v8 = (NSArray *)[v7 copy];
    outProbabilities = v6->_outProbabilities;
    v6->_outProbabilities = v8;

    [v5 rawRange];
    v6->_rawRange = v10;
    [v5 correctedRange];
    v6->_correctedRange = v11;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend( objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3),  "initWithBiasEstimatorOutputs:",  self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_outProbabilities forKey:@"outputProbabilities"];
  [v4 encodeDouble:@"rawRange" forKey:self->_rawRange];
  [v4 encodeDouble:@"correctedRange" forKey:self->_correctedRange];
}

- (BiasEstimatorOutputs)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeArrayOfObjectsOfClass:forKey:",  objc_opt_class(NSNumber, v5),  @"outputProbabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 decodeDoubleForKey:@"rawRange"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"correctedRange"];
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___BiasEstimatorOutputs;
  id v12 = -[BiasEstimatorOutputs init](&v15, "init");
  uint64_t v13 = v12;
  if (v12)
  {
    -[BiasEstimatorOutputs setOutProbabilities:](v12, "setOutProbabilities:", v7);
    -[BiasEstimatorOutputs setRawRange:](v13, "setRawRange:", v9);
    -[BiasEstimatorOutputs setCorrectedRange:](v13, "setCorrectedRange:", v11);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (BiasEstimatorOutputs *)v4;
    double v8 = v7;
    if (v7 == self)
    {
      char v20 = 1;
LABEL_12:

      goto LABEL_13;
    }

    double rawRange = self->_rawRange;
    -[BiasEstimatorOutputs rawRange](v7, "rawRange");
    double v11 = v10;
    double correctedRange = self->_correctedRange;
    -[BiasEstimatorOutputs correctedRange](v8, "correctedRange");
    double v14 = v13;
    outProbabilities = self->_outProbabilities;
    if (!outProbabilities)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorOutputs outProbabilities](v8, "outProbabilities"));

      if (!v16)
      {
        unsigned __int8 v18 = 1;
        goto LABEL_7;
      }

      outProbabilities = self->_outProbabilities;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorOutputs outProbabilities](v8, "outProbabilities"));
    unsigned __int8 v18 = -[NSArray isEqualToArray:](outProbabilities, "isEqualToArray:", v17);

LABEL_7:
    BOOL v19 = rawRange == v11;
    if (correctedRange != v14) {
      BOOL v19 = 0;
    }
    char v20 = v19 & v18;
    goto LABEL_12;
  }

  char v20 = 0;
LABEL_13:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_rawRange));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_correctedRange));
  unint64_t v6 = (unint64_t)[v5 hash];
  unint64_t v7 = v6 ^ v4 ^ (unint64_t)-[NSArray hash](self->_outProbabilities, "hash");

  return v7;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  unint64_t v6 = NSStringFromClass(v5);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  double v8 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: ", v7);

  for (unint64_t i = 0LL; -[NSArray count](self->_outProbabilities, "count") > i; ++i)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_outProbabilities, "objectAtIndex:", i));
    [v10 doubleValue];
    -[NSMutableString appendFormat:](v8, "appendFormat:", @" out_prob_%d: %.6f,", i, v11);
  }

  double rawRange = self->_rawRange;
  double correctedRange = self->_correctedRange;
  -[NSMutableString appendFormat:](v8, "appendFormat:", @" rawRange: %.3f,", *(void *)&rawRange);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @" bias_correction_estimate: %.3f,",  correctedRange - rawRange);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @" correctedRange: %.3f>",  *(void *)&self->_correctedRange);
  return v8;
}

- (id)populateOrderedBiasEstimatorOutputs
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  for (unint64_t i = 0LL; -[NSArray count](self->_outProbabilities, "count") > i; ++i)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_outProbabilities, "objectAtIndex:", i));
    [v5 doubleValue];
    -[NSMutableString appendFormat:](v3, "appendFormat:", @" %.6f, ", v6);
  }

  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" %.3f, %.3f, %.3f",  *(void *)&self->_rawRange,  self->_correctedRange - self->_rawRange,  *(void *)&self->_correctedRange);
  return v3;
}

- (NSArray)outProbabilities
{
  return self->_outProbabilities;
}

- (void)setOutProbabilities:(id)a3
{
}

- (double)rawRange
{
  return self->_rawRange;
}

- (void)setRawRange:(double)a3
{
  self->_double rawRange = a3;
}

- (double)correctedRange
{
  return self->_correctedRange;
}

- (void)setCorrectedRange:(double)a3
{
  self->_double correctedRange = a3;
}

- (void).cxx_destruct
{
}

@end