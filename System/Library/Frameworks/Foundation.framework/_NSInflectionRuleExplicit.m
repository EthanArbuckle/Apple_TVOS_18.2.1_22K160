@interface _NSInflectionRuleExplicit
- (BOOL)isAutomatic;
- (BOOL)isEqual:(id)a3;
- (NSMorphology)morphology;
- (_NSInflectionRuleExplicit)initWithAttributesDictionary:(id)a3;
- (_NSInflectionRuleExplicit)initWithMorphology:(id)a3 agreeWithArgument:(int64_t)a4 agreeWithConcept:(int64_t)a5 referentConcept:(int64_t)a6;
- (id)description;
- (int64_t)agreeWithArgument;
- (int64_t)agreeWithConcept;
- (int64_t)referentConcept;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _NSInflectionRuleExplicit

- (_NSInflectionRuleExplicit)initWithAttributesDictionary:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  [a3 objectForKeyedSubscript:@"NSInflectionAgreementArgument"];
  if (_NSIsNSNumber()) {
    uint64_t v5 = objc_msgSend( (id)objc_msgSend(a3, "objectForKeyedSubscript:", @"NSInflectionAgreementArgument"),  "integerValue");
  }
  else {
    uint64_t v5 = 0LL;
  }
  [a3 objectForKeyedSubscript:@"NSInflectionAgreementConcept"];
  if (_NSIsNSNumber()) {
    uint64_t v6 = objc_msgSend( (id)objc_msgSend(a3, "objectForKeyedSubscript:", @"NSInflectionAgreementConcept"),  "integerValue");
  }
  else {
    uint64_t v6 = 0LL;
  }
  [a3 objectForKeyedSubscript:@"NSInflectionReferentConcept"];
  if (_NSIsNSNumber()) {
    uint64_t v7 = objc_msgSend( (id)objc_msgSend(a3, "objectForKeyedSubscript:", @"NSInflectionReferentConcept"),  "integerValue");
  }
  else {
    uint64_t v7 = 0LL;
  }
  v8 = (void *)[a3 objectForKeyedSubscript:@"NSInflect"];
  if (!v8)
  {
LABEL_13:
    if (v5) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)[v8 morphology];
    goto LABEL_13;
  }

  v8 = 0LL;
  if (v5) {
    goto LABEL_20;
  }
LABEL_16:
  if (!v6 && !v7 && !v8)
  {

    return 0LL;
  }

- (_NSInflectionRuleExplicit)initWithMorphology:(id)a3 agreeWithArgument:(int64_t)a4 agreeWithConcept:(int64_t)a5 referentConcept:(int64_t)a6
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (a3 || a5 | a4 | a6)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS____NSInflectionRuleExplicit;
    v10 = -[NSInflectionRule _init](&v12, sel__init);
    if (v10)
    {
      v10->_morphology = (NSMorphology *)[a3 copy];
      v10->_agreeWithConcept = a5;
      v10->_agreeWithArgument = a4;
      v10->_referentConcept = a6;
    }
  }

  else
  {

    return 0LL;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSInflectionRuleExplicit;
  -[_NSInflectionRuleExplicit dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:3];
  if (-[_NSInflectionRuleExplicit morphology](self, "morphology")) {
    [v3 addObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"morphology = %@", -[_NSInflectionRuleExplicit morphology](self, "morphology"))];
  }
  if (-[_NSInflectionRuleExplicit agreeWithConcept](self, "agreeWithConcept")) {
    [v3 addObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"agreeWithConcept = %ld", -[_NSInflectionRuleExplicit agreeWithConcept](self, "agreeWithConcept"))];
  }
  if (-[_NSInflectionRuleExplicit agreeWithArgument](self, "agreeWithArgument")) {
    [v3 addObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"agreeWithArgument = %ld", -[_NSInflectionRuleExplicit agreeWithArgument](self, "agreeWithArgument"))];
  }
  if (-[_NSInflectionRuleExplicit referentConcept](self, "referentConcept")) {
    [v3 addObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"referentConcept = %ld", -[_NSInflectionRuleExplicit referentConcept](self, "referentConcept"))];
  }
  if ([v3 count])
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS____NSInflectionRuleExplicit;
    uint64_t v4 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ { %@ }",  -[_NSInflectionRuleExplicit description](&v9, sel_description),  objc_msgSend(v3, "componentsJoinedByString:", @", "));
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS____NSInflectionRuleExplicit;
    uint64_t v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (automatic inflection rule)",  -[_NSInflectionRuleExplicit description](&v8, sel_description),  v7);
  }

  uint64_t v5 = v4;

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  unint64_t v4 = -[NSMorphology hash](-[_NSInflectionRuleExplicit morphology](self, "morphology"), "hash") ^ v3;
  int64_t v5 = -[_NSInflectionRuleExplicit referentConcept](self, "referentConcept");
  int64_t v6 = v5 ^ -[_NSInflectionRuleExplicit agreeWithConcept](self, "agreeWithConcept");
  return v4 ^ v6 ^ -[_NSInflectionRuleExplicit agreeWithArgument](self, "agreeWithArgument");
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  if (!-[_NSInflectionRuleExplicit morphology](self, "morphology")
    || (BOOL v5 = -[NSMorphology isEqual:]( -[_NSInflectionRuleExplicit morphology](self, "morphology"),  "isEqual:",  [a3 morphology])))
  {
    int64_t v6 = -[_NSInflectionRuleExplicit referentConcept](self, "referentConcept");
    if (v6 == [a3 referentConcept])
    {
      int64_t v7 = -[_NSInflectionRuleExplicit agreeWithConcept](self, "agreeWithConcept");
      if (v7 == [a3 agreeWithConcept])
      {
        int64_t v8 = -[_NSInflectionRuleExplicit agreeWithArgument](self, "agreeWithArgument");
        LOBYTE(v5) = v8 == [a3 agreeWithArgument];
        return v5;
      }
    }

- (BOOL)isAutomatic
{
  return !-[_NSInflectionRuleExplicit morphology](self, "morphology")
      && !-[_NSInflectionRuleExplicit agreeWithConcept](self, "agreeWithConcept")
      && -[_NSInflectionRuleExplicit agreeWithArgument](self, "agreeWithArgument") == 0;
}

- (NSMorphology)morphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 8LL, 1);
}

- (int64_t)agreeWithConcept
{
  return self->_agreeWithConcept;
}

- (int64_t)agreeWithArgument
{
  return self->_agreeWithArgument;
}

- (int64_t)referentConcept
{
  return self->_referentConcept;
}

@end