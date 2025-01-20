@interface NEOnDemandRuleIgnore
- (NEOnDemandRuleIgnore)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation NEOnDemandRuleIgnore

- (NEOnDemandRuleIgnore)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleIgnore;
  return -[NEOnDemandRule initWithAction:](&v3, sel_initWithAction_, 4LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleIgnore;
  return -[NEOnDemandRule copyWithZone:](&v4, sel_copyWithZone_, a3);
}

@end