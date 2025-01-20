@interface ADPrimeTokenWrapper
+ (BOOL)supportsSecureCoding;
- (ADPrimeTokenWrapper)initWithCoder:(id)a3;
- (NSString)primeToken;
- (double)lastPrimeTokenTimestamp;
- (id)init:(id)a3 timeStamp:(double)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setLastPrimeTokenTimestamp:(double)a3;
- (void)setPrimeToken:(id)a3;
@end

@implementation ADPrimeTokenWrapper

- (id)init:(id)a3 timeStamp:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADPrimeTokenWrapper;
  v8 = -[ADPrimeTokenWrapper init](&v11, "init");
  v9 = (double *)v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_primeToken, a3);
    v9[2] = a4;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADPrimeTokenWrapper primeToken](self, "primeToken"));
  [v4 encodeObject:v5 forKey:@"primeToken"];
  [v4 encodeDouble:@"lastPrimeTokenTimestamp" forKey:self->_lastPrimeTokenTimestamp];
}

- (ADPrimeTokenWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSString), 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"primeToken"];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 decodeDoubleForKey:@"lastPrimeTokenTimestamp"];
  double v10 = v9;

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADPrimeTokenWrapper;
  objc_super v11 = -[ADPrimeTokenWrapper init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_primeToken, v8);
    v12->_lastPrimeTokenTimestamp = v10;
  }

  return v12;
}

- (NSString)primeToken
{
  return self->_primeToken;
}

- (void)setPrimeToken:(id)a3
{
}

- (double)lastPrimeTokenTimestamp
{
  return self->_lastPrimeTokenTimestamp;
}

- (void)setLastPrimeTokenTimestamp:(double)a3
{
  self->_lastPrimeTokenTimestamp = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end