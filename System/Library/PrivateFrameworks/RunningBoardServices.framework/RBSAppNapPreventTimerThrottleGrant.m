@interface RBSAppNapPreventTimerThrottleGrant
+ (id)grant;
+ (id)grantWithTier:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (RBSAppNapPreventTimerThrottleGrant)initWithRBSXPCCoder:(id)a3;
- (_BYTE)_initWithTier:(_BYTE *)result;
- (id)description;
- (unint64_t)hash;
- (unsigned)tier;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSAppNapPreventTimerThrottleGrant

+ (id)grant
{
}

+ (id)grantWithTier:(unsigned __int8)a3
{
  return  -[RBSAppNapPreventTimerThrottleGrant _initWithTier:]( objc_alloc(&OBJC_CLASS___RBSAppNapPreventTimerThrottleGrant),  a3);
}

- (_BYTE)_initWithTier:(_BYTE *)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)&OBJC_CLASS___RBSAppNapPreventTimerThrottleGrant;
    result = objc_msgSendSuper2(&v3, sel__init);
    if (result)
    {
      if (a2 >= 6) {
        -[RBSAppNapPreventTimerThrottleGrant _initWithTier:].cold.1();
      }
      result[8] = a2;
    }
  }

  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSAppNapPreventTimerThrottleGrant;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_tier, @"_tier", v5.receiver, v5.super_class);
}

- (RBSAppNapPreventTimerThrottleGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSAppNapPreventTimerThrottleGrant;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5) {
    v5->_tier = [v4 decodeInt64ForKey:@"_tier"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSAppNapPreventTimerThrottleGrant;
  if (-[RBSAttribute isEqual:](&v7, sel_isEqual_, v4)) {
    BOOL v5 = self->_tier == v4[8];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_tier;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = (void *)[v3 initWithFormat:@"<%@| tier:%d>", v4, self->_tier];

  return v5;
}

- (unsigned)tier
{
  return self->_tier;
}

- (void)_initWithTier:.cold.1()
{
  __assert_rtn( "-[RBSAppNapPreventTimerThrottleGrant _initWithTier:]",  "RBSAppNapPreventTimerThrottleGrant.m",  29,  "RBSAppNapPreventTimerThrottleTier0 <= tier && tier <= RBSAppNapPreventTimerThrottleTier5");
}

@end