@interface LACDTORatchetState
+ (BOOL)supportsSecureCoding;
+ (id)nullInstance;
- (BOOL)isEqual:(id)a3;
- (LACDTORatchetState)initWithCoder:(id)a3;
- (LACDTORatchetState)initWithRawValue:(int64_t)a3 duration:(double)a4 resetDuration:(double)a5 uuid:(id)a6;
- (NSString)uuid;
- (double)duration;
- (double)effectiveDuration;
- (double)resetDuration;
- (id)description;
- (int64_t)rawValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACDTORatchetState

- (LACDTORatchetState)initWithRawValue:(int64_t)a3 duration:(double)a4 resetDuration:(double)a5 uuid:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACDTORatchetState;
  v12 = -[LACDTORatchetState init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_rawValue = a3;
    v12->_duration = a4;
    v12->_resetDuration = a5;
    objc_storeStrong((id *)&v12->_uuid, a6);
  }

  return v13;
}

+ (id)nullInstance
{
  return  -[LACDTORatchetState initWithRawValue:duration:resetDuration:uuid:]( objc_alloc(&OBJC_CLASS___LACDTORatchetState),  "initWithRawValue:duration:resetDuration:uuid:",  0LL,  0LL,  -1.0,  -1.0);
}

- (double)effectiveDuration
{
  double v3 = 3600.0;
  if (v4 != -1.0)
  {
    -[LACDTORatchetState duration](self, "duration");
    if (v5 > 0.0)
    {
      -[LACDTORatchetState duration](self, "duration");
      double v3 = fmin(v6, 3600.0);
    }
  }

  return fmax(v3, 1.0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t rawValue = self->_rawValue;
  id v5 = a3;
  NSStringFromSelector(sel_rawValue);
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:rawValue forKey:v6];

  double duration = self->_duration;
  NSStringFromSelector(sel_duration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeDouble:v8 forKey:duration];

  double resetDuration = self->_resetDuration;
  NSStringFromSelector(sel_resetDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeDouble:v10 forKey:resetDuration];

  uuid = self->_uuid;
  NSStringFromSelector(sel_uuid);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:uuid forKey:v12];
}

- (LACDTORatchetState)initWithCoder:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_rawValue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  NSStringFromSelector(sel_duration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeDoubleForKey:v7];
  double v9 = v8;

  NSStringFromSelector(sel_resetDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeDoubleForKey:v10];
  double v12 = v11;

  uint64_t v13 = objc_opt_class();
  NSStringFromSelector(sel_uuid);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:v13 forKey:v14];
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[LACDTORatchetState initWithRawValue:duration:resetDuration:uuid:]( self,  "initWithRawValue:duration:resetDuration:uuid:",  v6,  v15,  v9,  v12);
  return v16;
}

- (id)description
{
  v24[5] = *MEMORY[0x1895F89C0];
  v23 = (void *)NSString;
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = self->_rawValue - 1;
  if (v4 > 3) {
    id v5 = @"LACDTORatchetStateRawValueNotStarted";
  }
  else {
    id v5 = off_18A369110[v4];
  }
  [NSString stringWithFormat:@"rawValue: %@", v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v7 = (void *)NSString;
  -[LACDTORatchetState duration](self, "duration");
  [v7 stringWithFormat:@"duration: %.2f", v8];
  double v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  v10 = (void *)NSString;
  -[LACDTORatchetState resetDuration](self, "resetDuration");
  [v10 stringWithFormat:@"resetDuration: %.2f", v11];
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v12;
  uint64_t v13 = (void *)NSString;
  -[LACDTORatchetState effectiveDuration](self, "effectiveDuration");
  [v13 stringWithFormat:@"effectiveDuration: %.2f", v14];
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v15;
  v16 = (void *)NSString;
  v17 = -[LACDTORatchetState uuid](self, "uuid");
  [v16 stringWithFormat:@"uuid: %@", v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  [MEMORY[0x189603F18] arrayWithObjects:v24 count:5];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 componentsJoinedByString:@"; "];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 stringWithFormat:@"<%@ %p; %@>", v3, self, v20];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    int64_t v6 = -[LACDTORatchetState rawValue](self, "rawValue");
    if (v6 != [v5 rawValue]) {
      goto LABEL_6;
    }
    -[LACDTORatchetState duration](self, "duration");
    double v8 = v7;
    [v5 duration];
    if (v8 != v9) {
      goto LABEL_6;
    }
    -[LACDTORatchetState resetDuration](self, "resetDuration");
    double v11 = v10;
    [v5 resetDuration];
    if (v11 == v12
      && (-[LACDTORatchetState effectiveDuration](self, "effectiveDuration"),
          double v14 = v13,
          [v5 effectiveDuration],
          v14 == v15))
    {
      v18 = -[LACDTORatchetState uuid](self, "uuid");
      uint64_t v19 = [v5 uuid];
      if (v18 == (void *)v19)
      {
        char v16 = 1;
        v20 = v18;
      }

      else
      {
        v20 = (void *)v19;
        v21 = -[LACDTORatchetState uuid](self, "uuid");
        [v5 uuid];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        char v16 = [v21 isEqualToString:v22];
      }
    }

    else
    {
LABEL_6:
      char v16 = 0;
    }
  }

  else
  {
    char v16 = 0;
  }

  return v16;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (double)duration
{
  return self->_duration;
}

- (double)resetDuration
{
  return self->_resetDuration;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end