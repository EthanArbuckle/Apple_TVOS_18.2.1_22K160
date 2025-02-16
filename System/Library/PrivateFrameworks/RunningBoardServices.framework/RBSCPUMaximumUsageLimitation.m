@interface RBSCPUMaximumUsageLimitation
+ (id)limitationForRole:(unsigned __int8)a3 withPercentage:(unint64_t)a4 duration:(double)a5 violationPolicy:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (RBSCPUMaximumUsageLimitation)initWithRBSXPCCoder:(id)a3;
- (double)duration;
- (id)_initWithRole:(unint64_t)a3 percentage:(unint64_t)a4 duration:(double)a5 violationPolicy:;
- (id)description;
- (unint64_t)hash;
- (unint64_t)percentage;
- (unint64_t)violationPolicy;
- (unsigned)role;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSCPUMaximumUsageLimitation

+ (id)limitationForRole:(unsigned __int8)a3 withPercentage:(unint64_t)a4 duration:(double)a5 violationPolicy:(unint64_t)a6
{
  return  -[RBSCPUMaximumUsageLimitation _initWithRole:percentage:duration:violationPolicy:]( objc_alloc(&OBJC_CLASS___RBSCPUMaximumUsageLimitation),  a3,  a4,  a6,  a5);
}

- (id)_initWithRole:(unint64_t)a3 percentage:(unint64_t)a4 duration:(double)a5 violationPolicy:
{
  if (result)
  {
    char v8 = a2;
    v9 = result;
    if ((a2 - 8) <= 0xFFFFFFF9)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 handleFailureInMethod:sel__initWithRole_percentage_duration_violationPolicy_ object:v9 file:@"RBSCPUMaximumUsageLimitation.m" lineNumber:119 description:@"initialized with invalid role"];
    }

    if (a4 >= 3)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 handleFailureInMethod:sel__initWithRole_percentage_duration_violationPolicy_ object:v9 file:@"RBSCPUMaximumUsageLimitation.m" lineNumber:120 description:@"initialized with invalid violation policy"];
    }

    if (a5 <= 0.0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 handleFailureInMethod:sel__initWithRole_percentage_duration_violationPolicy_ object:v9 file:@"RBSCPUMaximumUsageLimitation.m" lineNumber:121 description:@"initialized with invalid duration"];
    }

    if (a3 >= 0x65)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 handleFailureInMethod:sel__initWithRole_percentage_duration_violationPolicy_ object:v9 file:@"RBSCPUMaximumUsageLimitation.m" lineNumber:122 description:@"initialized with invalid percentage"];
    }

    v14.receiver = v9;
    v14.super_class = (Class)&OBJC_CLASS___RBSCPUMaximumUsageLimitation;
    result = objc_msgSendSuper2(&v14, sel__init);
    if (result)
    {
      *((_BYTE *)result + 8) = v8;
      *((void *)result + 2) = a3;
      *((double *)result + 3) = a5;
      *((void *)result + 4) = a4;
    }
  }

  return result;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = NSStringFromRBSRole(self->_role);
  v6 = (void *)v5;
  unint64_t violationPolicy = self->_violationPolicy;
  if (violationPolicy > 2) {
    char v8 = @"(undefined)";
  }
  else {
    char v8 = off_189DE0310[violationPolicy];
  }
  v9 = (void *)[v3 initWithFormat:@"<%@| role:%@ percentage:%lu duration:%.2f violationPolicy:%@>", v4, v5, self->_percentage, *(void *)&self->_duration, v8];

  return v9;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSCPUMaximumUsageLimitation;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, @"role", v5.receiver, v5.super_class);
  [v4 encodeUInt64:self->_percentage forKey:@"percentage"];
  [v4 encodeDouble:@"duration" forKey:self->_duration];
  [v4 encodeUInt64:self->_violationPolicy forKey:@"violationPolicy"];
}

- (RBSCPUMaximumUsageLimitation)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RBSCPUMaximumUsageLimitation;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v8, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    v5->_role = [v4 decodeInt64ForKey:@"role"];
    v5->_percentage = [v4 decodeUInt64ForKey:@"percentage"];
    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v6;
    v5->_unint64_t violationPolicy = [v4 decodeUInt64ForKey:@"violationPolicy"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSCPUMaximumUsageLimitation;
  BOOL v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4)
    && self->_role == *((unsigned __int8 *)v4 + 8)
    && self->_percentage == *((void *)v4 + 2)
    && self->_duration == v4[3]
    && self->_violationPolicy == *((void *)v4 + 4);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_percentage ^ self->_role;
  [MEMORY[0x189607968] numberWithDouble:self->_duration];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = v3 ^ self->_violationPolicy ^ [v4 hash];

  return v5;
}

- (unint64_t)percentage
{
  return self->_percentage;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)violationPolicy
{
  return self->_violationPolicy;
}

- (unsigned)role
{
  return self->_role;
}

@end