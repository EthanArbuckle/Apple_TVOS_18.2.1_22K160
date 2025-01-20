@interface NEFilterRemediationVerdict
+ (NEFilterRemediationVerdict)allowVerdict;
+ (NEFilterRemediationVerdict)dropVerdict;
+ (NEFilterRemediationVerdict)needRulesVerdict;
- (int64_t)filterAction;
@end

@implementation NEFilterRemediationVerdict

- (int64_t)filterAction
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEFilterRemediationVerdict;
  int64_t result = -[NEFilterVerdict filterAction](&v4, sel_filterAction);
  if (!result)
  {
    if (-[NEFilterVerdict drop](self, "drop") || self && self->super._remediate) {
      return 4LL;
    }
    else {
      return 1LL;
    }
  }

  return result;
}

+ (NEFilterRemediationVerdict)allowVerdict
{
  return  -[NEFilterVerdict initWithDrop:remediate:]( objc_alloc(&OBJC_CLASS___NEFilterRemediationVerdict),  "initWithDrop:remediate:",  0LL,  0LL);
}

+ (NEFilterRemediationVerdict)dropVerdict
{
  return  -[NEFilterVerdict initWithDrop:remediate:]( objc_alloc(&OBJC_CLASS___NEFilterRemediationVerdict),  "initWithDrop:remediate:",  1LL,  0LL);
}

+ (NEFilterRemediationVerdict)needRulesVerdict
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setNeedRules:1];
  return (NEFilterRemediationVerdict *)v2;
}

@end