@interface RBSResistTerminationGrant
+ (id)grantWithResistance:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (RBSResistTerminationGrant)initWithRBSXPCCoder:(id)a3;
- (id)_initWithResistance:(id)result;
- (id)description;
- (unint64_t)hash;
- (unsigned)resistance;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSResistTerminationGrant

+ (id)grantWithResistance:(unsigned __int8)a3
{
  return -[RBSResistTerminationGrant _initWithResistance:](objc_alloc(&OBJC_CLASS___RBSResistTerminationGrant), a3);
}

- (id)_initWithResistance:(id)result
{
  if (result)
  {
    char v2 = a2;
    v3 = result;
    if ((a2 - 51) <= 0xFFFFFFCD)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 handleFailureInMethod:sel__initWithResistance_ object:v3 file:@"RBSResistTerminationGrant.m" lineNumber:65 description:@"initialized with invalid resistance"];
    }

    v5.receiver = v3;
    v5.super_class = (Class)&OBJC_CLASS___RBSResistTerminationGrant;
    result = objc_msgSendSuper2(&v5, sel__init);
    if (result) {
      *((_BYTE *)result + 8) = v2;
    }
  }

  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSResistTerminationGrant;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_resistance, @"_resistance", v5.receiver, v5.super_class);
}

- (RBSResistTerminationGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSResistTerminationGrant;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5) {
    v5->_resistance = [v4 decodeInt64ForKey:@"_resistance"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSResistTerminationGrant;
  BOOL v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4) && self->_resistance == v4[8];

  return v5;
}

- (unint64_t)hash
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSTerminationResistance(self->_resistance);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)[v3 initWithFormat:@"<%@| terminationResistance:%@>", v4, v5];

  return v6;
}

- (unsigned)resistance
{
  return self->_resistance;
}

@end