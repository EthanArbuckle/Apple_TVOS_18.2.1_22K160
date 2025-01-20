@interface _NSInflectionRuleAutomatic
+ (BOOL)supportsSecureCoding;
- (_NSInflectionRuleAutomatic)initWithCoder:(id)a3;
- (id)description;
@end

@implementation _NSInflectionRuleAutomatic

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSInflectionRuleAutomatic)initWithCoder:(id)a3
{
  return (_NSInflectionRuleAutomatic *) +[NSInflectionRule automaticRule]( &OBJC_CLASS___NSInflectionRule,  "automaticRule");
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSInflectionRuleAutomatic;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (automatic inflection rule)",  -[_NSInflectionRuleAutomatic description](&v3, sel_description));
}

@end