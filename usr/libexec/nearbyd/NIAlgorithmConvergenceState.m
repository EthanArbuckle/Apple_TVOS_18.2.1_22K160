@interface NIAlgorithmConvergenceState
+ (BOOL)supportsSecureCoding;
- (BOOL)insufficientHorizontalSweep;
- (BOOL)insufficientLighting;
- (BOOL)insufficientMovement;
- (BOOL)insufficientSignalStrength;
- (BOOL)insufficientVerticalSweep;
- (BOOL)isEqual:(id)a3;
- (NIAlgorithmConvergenceState)initWithAlgorithmConvergenceState:(id)a3;
- (NIAlgorithmConvergenceState)initWithCoder:(id)a3;
- (NIAlgorithmConvergenceState)initWithConvergenceStatus:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)convergence;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConvergence:(int64_t)a3;
- (void)setInsufficientHorizontalSweep:(BOOL)a3;
- (void)setInsufficientLighting:(BOOL)a3;
- (void)setInsufficientMovement:(BOOL)a3;
- (void)setInsufficientSignalStrength:(BOOL)a3;
- (void)setInsufficientVerticalSweep:(BOOL)a3;
@end

@implementation NIAlgorithmConvergenceState

- (NIAlgorithmConvergenceState)initWithConvergenceStatus:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIAlgorithmConvergenceState;
  result = -[NIAlgorithmConvergenceState init](&v5, "init");
  if (result)
  {
    result->_convergence = a3;
    *(_DWORD *)&result->_insufficientSignalStrength = 0;
    result->_insufficientLighting = 0;
  }

  return result;
}

- (NIAlgorithmConvergenceState)initWithAlgorithmConvergenceState:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NIAlgorithmConvergenceState;
  objc_super v5 = -[NIAlgorithmConvergenceState init](&v7, "init");
  if (v5)
  {
    v5->_convergence = (int64_t)[v4 convergence];
    v5->_insufficientSignalStrength = [v4 insufficientSignalStrength];
    v5->_insufficientHorizontalSweep = [v4 insufficientHorizontalSweep];
    v5->_insufficientVerticalSweep = [v4 insufficientVerticalSweep];
    v5->_insufficientMovement = [v4 insufficientMovement];
    v5->_insufficientLighting = [v4 insufficientLighting];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _[v4 initWithAlgorithmConvergenceState:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_convergence forKey:@"convergence"];
  [v4 encodeBool:self->_insufficientSignalStrength forKey:@"insufficientSignalStrength"];
  [v4 encodeBool:self->_insufficientHorizontalSweep forKey:@"insufficientHorizontalSweep"];
  [v4 encodeBool:self->_insufficientVerticalSweep forKey:@"insufficientVerticalSweep"];
  [v4 encodeBool:self->_insufficientMovement forKey:@"insufficientMovement"];
  [v4 encodeBool:self->_insufficientLighting forKey:@"insufficientLighting"];
}

- (NIAlgorithmConvergenceState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"convergence"];
  unsigned __int8 v6 = [v4 decodeBoolForKey:@"insufficientSignalStrength"];
  unsigned __int8 v7 = [v4 decodeBoolForKey:@"insufficientHorizontalSweep"];
  unsigned __int8 v8 = [v4 decodeBoolForKey:@"insufficientVerticalSweep"];
  unsigned __int8 v9 = [v4 decodeBoolForKey:@"insufficientMovement"];
  unsigned __int8 v10 = [v4 decodeBoolForKey:@"insufficientLighting"];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NIAlgorithmConvergenceState;
  v11 = -[NIAlgorithmConvergenceState init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_convergence = (int64_t)v5;
    v11->_insufficientSignalStrength = v6;
    v11->_insufficientHorizontalSweep = v7;
    v11->_insufficientVerticalSweep = v8;
    v11->_insufficientMovement = v9;
    v11->_insufficientLighting = v10;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    unsigned __int8 v7 = (NIAlgorithmConvergenceState *)v4;
    unsigned __int8 v8 = v7;
    if (v7 == self)
    {
      BOOL v17 = 1;
    }

    else
    {
      int64_t convergence = self->_convergence;
      id v10 = -[NIAlgorithmConvergenceState convergence](v7, "convergence");
      int insufficientSignalStrength = self->_insufficientSignalStrength;
      unsigned int v12 = -[NIAlgorithmConvergenceState insufficientSignalStrength](v8, "insufficientSignalStrength");
      int insufficientHorizontalSweep = self->_insufficientHorizontalSweep;
      unsigned int v14 = -[NIAlgorithmConvergenceState insufficientHorizontalSweep](v8, "insufficientHorizontalSweep");
      int insufficientVerticalSweep = self->_insufficientVerticalSweep;
      unsigned int v15 = -[NIAlgorithmConvergenceState insufficientVerticalSweep](v8, "insufficientVerticalSweep");
      int insufficientMovement = self->_insufficientMovement;
      unsigned int v21 = -[NIAlgorithmConvergenceState insufficientMovement](v8, "insufficientMovement");
      int insufficientLighting = self->_insufficientLighting;
      unsigned int v16 = -[NIAlgorithmConvergenceState insufficientLighting](v8, "insufficientLighting");
      BOOL v17 = 0;
      if ((id)convergence == v10
        && insufficientSignalStrength == v12
        && insufficientHorizontalSweep == v14
        && insufficientVerticalSweep == v15)
      {
        BOOL v17 = insufficientMovement == v21 && insufficientLighting == v16;
      }
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_convergence));
  unint64_t v4 = (unint64_t)[v3 hash] ^ self->_insufficientSignalStrength ^ (unint64_t)self->_insufficientHorizontalSweep ^ self->_insufficientVerticalSweep ^ self->_insufficientMovement ^ self->_insufficientLighting;

  return v4;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned __int8 v8 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: ", v7);

  unint64_t convergence = self->_convergence;
  if (convergence >= 3) {
    __assert_rtn("NIAlgorithmConvergenceStatusToString", "NIAlgorithmConvergenceState.mm", 142, "false");
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", Convergence: %@", *(&off_1007B53F8 + convergence));
  if (self->_insufficientSignalStrength) {
    id v10 = @"yes";
  }
  else {
    id v10 = @"no";
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", insufficientSignalStrength: %@", v10);
  if (self->_insufficientHorizontalSweep) {
    v11 = @"yes";
  }
  else {
    v11 = @"no";
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", insufficientHorizontalSweep: %@", v11);
  if (self->_insufficientVerticalSweep) {
    unsigned int v12 = @"yes";
  }
  else {
    unsigned int v12 = @"no";
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", insufficientVerticalSweep: %@", v12);
  if (self->_insufficientMovement) {
    v13 = @"yes";
  }
  else {
    v13 = @"no";
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", insufficientMovement: %@", v13);
  if (self->_insufficientLighting) {
    unsigned int v14 = @"yes";
  }
  else {
    unsigned int v14 = @"no";
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", insufficientLighting: %@", v14);
  -[NSMutableString appendString:](v8, "appendString:", @">");
  return v8;
}

- (int64_t)convergence
{
  return self->_convergence;
}

- (void)setConvergence:(int64_t)a3
{
  self->_unint64_t convergence = a3;
}

- (BOOL)insufficientSignalStrength
{
  return self->_insufficientSignalStrength;
}

- (void)setInsufficientSignalStrength:(BOOL)a3
{
  self->_int insufficientSignalStrength = a3;
}

- (BOOL)insufficientHorizontalSweep
{
  return self->_insufficientHorizontalSweep;
}

- (void)setInsufficientHorizontalSweep:(BOOL)a3
{
  self->_int insufficientHorizontalSweep = a3;
}

- (BOOL)insufficientVerticalSweep
{
  return self->_insufficientVerticalSweep;
}

- (void)setInsufficientVerticalSweep:(BOOL)a3
{
  self->_int insufficientVerticalSweep = a3;
}

- (BOOL)insufficientMovement
{
  return self->_insufficientMovement;
}

- (void)setInsufficientMovement:(BOOL)a3
{
  self->_int insufficientMovement = a3;
}

- (BOOL)insufficientLighting
{
  return self->_insufficientLighting;
}

- (void)setInsufficientLighting:(BOOL)a3
{
  self->_int insufficientLighting = a3;
}

@end