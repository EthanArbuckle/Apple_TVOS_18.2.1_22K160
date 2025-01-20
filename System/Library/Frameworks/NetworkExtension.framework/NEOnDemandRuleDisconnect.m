@interface NEOnDemandRuleDisconnect
- (NEOnDemandRuleDisconnect)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation NEOnDemandRuleDisconnect

- (NEOnDemandRuleDisconnect)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleDisconnect;
  return -[NEOnDemandRule initWithAction:](&v3, sel_initWithAction_, 2LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleDisconnect;
  return -[NEOnDemandRule copyWithZone:](&v4, sel_copyWithZone_, a3);
}

@end