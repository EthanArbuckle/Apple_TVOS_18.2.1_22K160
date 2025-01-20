@interface RBSCPUMinimumUsageGrant
+ (id)grantForRole:(unsigned __int8)a3 withPercentage:(unint64_t)a4 duration:(double)a5;
- (BOOL)isEqual:(id)a3;
- (RBSCPUMinimumUsageGrant)initWithRBSXPCCoder:(id)a3;
- (double)duration;
- (id)_initWithRole:(unint64_t)a3 percentage:(double)a4 duration:;
- (id)description;
- (unint64_t)hash;
- (unint64_t)percentage;
- (unsigned)role;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSCPUMinimumUsageGrant

+ (id)grantForRole:(unsigned __int8)a3 withPercentage:(unint64_t)a4 duration:(double)a5
{
  return  -[RBSCPUMinimumUsageGrant _initWithRole:percentage:duration:]( objc_alloc(&OBJC_CLASS___RBSCPUMinimumUsageGrant),  a3,  a4,  a5);
}

- (id)_initWithRole:(unint64_t)a3 percentage:(double)a4 duration:
{
  if (result)
  {
    v7 = result;
    if ((a2 & 0xFC) != 4)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 handleFailureInMethod:sel__initWithRole_percentage_duration_ object:v7 file:@"RBSCPUMinimumUsageGrant.m" lineNumber:92 description:@"initialized with invalid role"];
    }

    if (a4 <= 0.0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 handleFailureInMethod:sel__initWithRole_percentage_duration_ object:v7 file:@"RBSCPUMinimumUsageGrant.m" lineNumber:93 description:@"initialized with invalid duration"];
    }

    if (a3 >= 0x65)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 handleFailureInMethod:sel__initWithRole_percentage_duration_ object:v7 file:@"RBSCPUMinimumUsageGrant.m" lineNumber:94 description:@"initialized with invalid percentage"];
    }

    v11.receiver = v7;
    v11.super_class = (Class)&OBJC_CLASS___RBSCPUMinimumUsageGrant;
    result = objc_msgSendSuper2(&v11, sel__init);
    if (result)
    {
      *((_BYTE *)result + 8) = a2;
      *((void *)result + 2) = a3;
      *((double *)result + 3) = a4;
    }
  }

  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSCPUMinimumUsageGrant;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, @"role", v5.receiver, v5.super_class);
  [v4 encodeUInt64:self->_percentage forKey:@"percentage"];
  [v4 encodeDouble:@"duration" forKey:self->_duration];
}

- (RBSCPUMinimumUsageGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RBSCPUMinimumUsageGrant;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v8, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    v5->_role = [v4 decodeInt64ForKey:@"role"];
    v5->_percentage = [v4 decodeUInt64ForKey:@"percentage"];
    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v6;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSCPUMinimumUsageGrant;
  BOOL v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4)
    && self->_role == *((unsigned __int8 *)v4 + 8)
    && self->_percentage == *((void *)v4 + 2)
    && self->_duration == v4[3];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_percentage ^ self->_role;
  [MEMORY[0x189607968] numberWithDouble:self->_duration];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = v2 ^ [v3 hash];

  return v4;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSRole(self->_role);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  double v6 = (void *)[v3 initWithFormat:@"<%@| role:%@ percentage:%lu duration:%.2f>", v4, v5, self->_percentage, *(void *)&self->_duration];

  return v6;
}

- (unint64_t)percentage
{
  return self->_percentage;
}

- (double)duration
{
  return self->_duration;
}

- (unsigned)role
{
  return self->_role;
}

@end