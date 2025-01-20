@interface NSInflectionRuleExplicit
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSInflectionRuleExplicit)initWithCoder:(id)a3;
- (NSInflectionRuleExplicit)initWithMorphology:(NSMorphology *)morphology;
- (NSMorphology)morphology;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSInflectionRuleExplicit

- (NSInflectionRuleExplicit)initWithMorphology:(NSMorphology *)morphology
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSInflectionRuleExplicit;
  v4 = -[NSInflectionRule _init](&v6, sel__init);
  if (v4) {
    v4->_morphology = (NSMorphology *)-[NSMorphology copy](morphology, "copy");
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSInflectionRuleExplicit;
  -[NSInflectionRuleExplicit dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSInflectionRuleExplicit)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSInflectionRuleExplicit;
  uint64_t v4 = -[NSInflectionRule _init](&v6, sel__init);
  if (v4) {
    v4->_morphology = (NSMorphology *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.Morphology"];
  }
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  return -[NSMorphology hash](-[NSInflectionRuleExplicit morphology](self, "morphology"), "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSMorphology isEqual:]( -[NSInflectionRuleExplicit morphology](self, "morphology"),  "isEqual:",  [a3 morphology]);
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSInflectionRuleExplicit;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ { morphology = %@ }",  -[NSInflectionRuleExplicit description](&v3, sel_description),  -[NSInflectionRuleExplicit morphology](self, "morphology"));
}

- (NSMorphology)morphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 8LL, 1);
}

@end