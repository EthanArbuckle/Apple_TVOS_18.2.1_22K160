@interface _NSAttributedStringGrammarInflection
+ (BOOL)_canSelectUserInflectionWithPreferredLanguages:(id)a3;
+ (BOOL)_isSimulatingLockedDevice;
+ (BOOL)_isSimulatingThirdPartyProcess;
+ (BOOL)_thirdPartyApplicationsCanAccessUserInflection;
+ (BOOL)canSelectCustomInflection;
+ (BOOL)canSelectUserInflection;
+ (BOOL)supportsSecureCoding;
+ (NSArray)presetInflections;
+ (NSString)_protectedPreferencesDomain;
+ (NSString)_thirdPartyPreferencesDomain;
+ (_NSAttributedStringGrammarInflection)_currentGlobalUserInflection;
+ (_NSAttributedStringGrammarInflection)_currentGlobalUserInflectionIfAvailable;
+ (_NSAttributedStringGrammarInflection)userInflection;
+ (void)_addGlobalUserInflectionObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5;
+ (void)_removeGlobalUserInflectionObserver:(id)a3 context:(void *)a4;
+ (void)_setThirdPartyApplicationsCanAccessUserInflection:(BOOL)a3;
+ (void)_usePreferencesDomainForFirstParty:(id)a3 thirdParty:(id)a4 simulateLockedDevice:(BOOL)a5 simulateThirdPartyProcess:(BOOL)a6 withinBlock:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdentity;
- (NSData)externalRepresentation;
- (NSDictionary)externalRepresentationDictionary;
- (NSMorphologyCustomPronoun)englishCustomPronoun;
- (NSString)localizedShortDescription;
- (_NSAttributedStringGrammarInflection)init;
- (_NSAttributedStringGrammarInflection)initWithCoder:(id)a3;
- (_NSAttributedStringGrammarInflection)initWithExternalRepresentation:(id)a3 error:(id *)a4;
- (_NSAttributedStringGrammarInflection)initWithExternalRepresentationDictionary:(id)a3 error:(id *)a4;
- (_NSAttributedStringGrammarInflection)initWithInflectionRule:(id)a3;
- (_NSAttributedStringGrammarInflection)initWithMorphology:(id)a3;
- (id)_initWithGender:(int64_t)a3;
- (id)_initWithMarkdownDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)context;
- (int64_t)determinationType;
- (int64_t)gender;
- (int64_t)grammaticalCase;
- (int64_t)number;
- (int64_t)person;
- (unint64_t)hash;
- (void)_setAsGlobalUserInflection;
- (void)_useInsteadOfUserInflectionInBlock:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setDeterminationType:(int64_t)a3;
- (void)setEnglishCustomPronoun:(id)a3;
- (void)setGender:(int64_t)a3;
- (void)setGrammaticalCase:(int64_t)a3;
- (void)setNumber:(int64_t)a3;
- (void)setPerson:(int64_t)a3;
@end

@implementation _NSAttributedStringGrammarInflection

- (_NSAttributedStringGrammarInflection)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSAttributedStringGrammarInflection;
  return -[_NSAttributedStringGrammarInflection init](&v3, sel_init);
}

- (_NSAttributedStringGrammarInflection)initWithCoder:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  v6[0] = 0LL;
  uint64_t v4 = -[_NSAttributedStringGrammarInflection initWithExternalRepresentation:error:]( self,  "initWithExternalRepresentation:error:",  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"externalRepresentation"],  v6);
  if (!v4) {
    [a3 failWithError:v6[0]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSAttributedStringGrammarInflection;
  -[_NSAttributedStringGrammarInflection dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS____NSAttributedStringGrammarInflection);
  v4->_grammaticalCase = -[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase");
  v4->_gender = -[_NSAttributedStringGrammarInflection gender](self, "gender");
  v4->_number = -[_NSAttributedStringGrammarInflection number](self, "number");
  v4->_person = -[_NSAttributedStringGrammarInflection person](self, "person");
  v4->_context = -[_NSAttributedStringGrammarInflection context](self, "context");
  v4->_determinationType = -[_NSAttributedStringGrammarInflection determinationType](self, "determinationType");
  v4->_englishCustomPronoun = (NSMorphologyCustomPronoun *)-[NSMorphologyCustomPronoun copy]( -[_NSAttributedStringGrammarInflection englishCustomPronoun]( self,  "englishCustomPronoun"),  "copy");
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  int64_t v4 = -[_NSAttributedStringGrammarInflection context](self, "context");
  int64_t v5 = v4 ^ -[_NSAttributedStringGrammarInflection gender](self, "gender") ^ v3;
  int64_t v6 = -[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase");
  int64_t v7 = v6 ^ -[_NSAttributedStringGrammarInflection number](self, "number");
  int64_t v8 = v5 ^ v7 ^ -[_NSAttributedStringGrammarInflection person](self, "person");
  unint64_t v9 = v8 ^ -[_NSAttributedStringGrammarInflection determinationType](self, "determinationType");
  if (-[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun")) {
    v9 ^= -[NSMorphologyCustomPronoun hash]( -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun"),  "hash");
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int64_t v5 = -[_NSAttributedStringGrammarInflection context](self, "context");
  if (v5 != [a3 context]) {
    return 0;
  }
  int64_t v6 = -[_NSAttributedStringGrammarInflection gender](self, "gender");
  if (v6 != [a3 gender]) {
    return 0;
  }
  int64_t v7 = -[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase");
  if (v7 != [a3 grammaticalCase]) {
    return 0;
  }
  int64_t v8 = -[_NSAttributedStringGrammarInflection number](self, "number");
  if (v8 != [a3 number]) {
    return 0;
  }
  int64_t v9 = -[_NSAttributedStringGrammarInflection person](self, "person");
  if (v9 != [a3 person]) {
    return 0;
  }
  int64_t v10 = -[_NSAttributedStringGrammarInflection determinationType](self, "determinationType");
  if (v10 != [a3 determinationType]) {
    return 0;
  }
  v11 = -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun");
  return v11 == (NSMorphologyCustomPronoun *)[a3 englishCustomPronoun]
      || -[NSMorphologyCustomPronoun isEqual:]( -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun"),  "isEqual:",  [a3 englishCustomPronoun]);
}

- (BOOL)isIdentity
{
  return !-[_NSAttributedStringGrammarInflection context](self, "context")
      && !-[_NSAttributedStringGrammarInflection gender](self, "gender")
      && !-[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase")
      && !-[_NSAttributedStringGrammarInflection number](self, "number")
      && !-[_NSAttributedStringGrammarInflection person](self, "person")
      && !-[_NSAttributedStringGrammarInflection determinationType](self, "determinationType")
      && -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun") == 0;
}

- (NSMorphologyCustomPronoun)englishCustomPronoun
{
  return (NSMorphologyCustomPronoun *)(id)-[NSMorphologyCustomPronoun copy]( self->_englishCustomPronoun,  "copy");
}

- (_NSAttributedStringGrammarInflection)initWithMorphology:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____NSAttributedStringGrammarInflection;
  int64_t v4 = -[_NSAttributedStringGrammarInflection init](&v14, sel_init);
  if (v4)
  {
    unint64_t v5 = [a3 grammaticalGender];
    if (v5 <= 3) {
      -[_NSAttributedStringGrammarInflection setGender:](v4, "setGender:", qword_183991460[v5]);
    }
    unint64_t v6 = [a3 number];
    if (v6 <= 6) {
      -[_NSAttributedStringGrammarInflection setNumber:](v4, "setNumber:", qword_183991480[v6]);
    }
    unint64_t v7 = [a3 grammaticalCase] - 1;
    if (v7 > 0xC) {
      uint64_t v8 = 0LL;
    }
    else {
      uint64_t v8 = qword_1839914B8[v7];
    }
    -[_NSAttributedStringGrammarInflection setGrammaticalCase:](v4, "setGrammaticalCase:", v8);
    uint64_t v9 = [a3 definiteness];
    uint64_t v10 = 3LL;
    if (v9 != 1) {
      uint64_t v10 = 0LL;
    }
    if (v9 == 2) {
      uint64_t v11 = 2LL;
    }
    else {
      uint64_t v11 = v10;
    }
    -[_NSAttributedStringGrammarInflection setDeterminationType:](v4, "setDeterminationType:", v11);
    v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "_customPronouns"), "allValues");
    if ([v12 count] == 1) {
      v4->_englishCustomPronoun = (NSMorphologyCustomPronoun *)objc_msgSend( (id)objc_msgSend(v12, "objectAtIndexedSubscript:", 0),  "copy");
    }
  }

  return v4;
}

- (_NSAttributedStringGrammarInflection)initWithInflectionRule:(id)a3
{
  if (+[NSInflectionRule automaticRule](&OBJC_CLASS___NSInflectionRule, "automaticRule") == a3) {
    return -[_NSAttributedStringGrammarInflection init](self, "init");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn( "-[_NSAttributedStringGrammarInflection initWithInflectionRule:]",  "NSAttributedString_Grammar.m",  450,  "[inflectionRule isKindOfClass:NSInflectionRuleExplicit.class]");
  }
  return -[_NSAttributedStringGrammarInflection initWithMorphology:]( self,  "initWithMorphology:",  [a3 morphology]);
}

- (id)description
{
  uint64_t v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p { ",  objc_opt_class(),  self);
  if (-[_NSAttributedStringGrammarInflection context](self, "context")) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" context = %d;",
  }
      -[_NSAttributedStringGrammarInflection context](self, "context"));
  if (-[_NSAttributedStringGrammarInflection gender](self, "gender")) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" gender = %d;",
  }
      -[_NSAttributedStringGrammarInflection gender](self, "gender"));
  if (-[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase")) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" grammaticalCase = %d;",
  }
      -[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase"));
  if (-[_NSAttributedStringGrammarInflection number](self, "number")) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" number = %d;",
  }
      -[_NSAttributedStringGrammarInflection number](self, "number"));
  if (-[_NSAttributedStringGrammarInflection person](self, "person")) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" person = %d;",
  }
      -[_NSAttributedStringGrammarInflection person](self, "person"));
  if (-[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun")) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" English pronoun = %@;",
  }
      -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun"));
  -[NSMutableString appendString:](v3, "appendString:", @"}>");
  return (id)-[NSMutableString copy](v3, "copy");
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (int64_t)gender
{
  return self->_gender;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (int64_t)grammaticalCase
{
  return self->_grammaticalCase;
}

- (void)setGrammaticalCase:(int64_t)a3
{
  self->_grammaticalCase = a3;
}

- (int64_t)determinationType
{
  return self->_determinationType;
}

- (void)setDeterminationType:(int64_t)a3
{
  self->_determinationType = a3;
}

- (int64_t)number
{
  return self->_number;
}

- (void)setNumber:(int64_t)a3
{
  self->_number = a3;
}

- (int64_t)person
{
  return self->_person;
}

- (void)setPerson:(int64_t)a3
{
  self->_person = a3;
}

- (void)setEnglishCustomPronoun:(id)a3
{
}

- (id)_initWithMarkdownDictionary:(id)a3
{
  return -[_NSAttributedStringGrammarInflection initWithExternalRepresentationDictionary:error:]( self,  "initWithExternalRepresentationDictionary:error:",  a3,  0LL);
}

- (_NSAttributedStringGrammarInflection)initWithExternalRepresentation:(id)a3 error:(id *)a4
{
  id v6 = +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  a4);
  if (v6)
  {
    id v7 = v6;
    if ((_NSIsNSDictionary() & 1) != 0) {
      return -[_NSAttributedStringGrammarInflection initWithExternalRepresentationDictionary:error:]( self,  "initWithExternalRepresentationDictionary:error:",  v7,  a4);
    }
    if (a4) {
      *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3840LL,  0LL);
    }
  }

  return 0LL;
}

- (_NSAttributedStringGrammarInflection)initWithExternalRepresentationDictionary:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS____NSAttributedStringGrammarInflection;
  id v6 = -[_NSAttributedStringGrammarInflection init](&v32, sel_init);
  if (!v6) {
    return v6;
  }
  id v7 = (void *)[a3 objectForKeyedSubscript:@"context"];
  if (v7 && (uint64_t v8 = v7, ([v7 isEqual:@"none"] & 1) == 0))
  {
    if (([v8 isEqual:@"technicalTerm"] & 1) == 0) {
      goto LABEL_80;
    }
    uint64_t v9 = 1LL;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  -[_NSAttributedStringGrammarInflection setContext:](v6, "setContext:", v9);
  uint64_t v10 = (void *)[a3 objectForKeyedSubscript:@"grammaticalGender"];
  if (v10 && (uint64_t v11 = v10, ([v10 isEqual:@"none"] & 1) == 0))
  {
    if ([v11 isEqual:@"masculine"])
    {
      uint64_t v12 = 1LL;
    }

    else if ([v11 isEqual:@"feminine"])
    {
      uint64_t v12 = 2LL;
    }

    else if ([v11 isEqual:@"neuter"])
    {
      uint64_t v12 = 3LL;
    }

    else
    {
      if (([v11 isEqual:@"common"] & 1) == 0) {
        goto LABEL_80;
      }
      uint64_t v12 = 4LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  -[_NSAttributedStringGrammarInflection setGender:](v6, "setGender:", v12);
  v13 = (void *)[a3 objectForKeyedSubscript:@"grammaticalCase"];
  if (v13 && (objc_super v14 = v13, ([v13 isEqual:@"none"] & 1) == 0))
  {
    if ([v14 isEqual:@"accusative"])
    {
      uint64_t v15 = 1LL;
    }

    else if ([v14 isEqual:@"dative"])
    {
      uint64_t v15 = 2LL;
    }

    else if ([v14 isEqual:@"genitive"])
    {
      uint64_t v15 = 3LL;
    }

    else if ([v14 isEqual:@"locative"])
    {
      uint64_t v15 = 4LL;
    }

    else if ([v14 isEqual:@"nominative"])
    {
      uint64_t v15 = 5LL;
    }

    else if ([v14 isEqual:@"partitive"])
    {
      uint64_t v15 = 6LL;
    }

    else if ([v14 isEqual:@"instrumental"])
    {
      uint64_t v15 = 7LL;
    }

    else if ([v14 isEqual:@"prepositional"])
    {
      uint64_t v15 = 8LL;
    }

    else if ([v14 isEqual:@"object"])
    {
      uint64_t v15 = 9LL;
    }

    else if ([v14 isEqual:@"directObject"])
    {
      uint64_t v15 = 10LL;
    }

    else
    {
      if (([v14 isEqual:@"indirectObject"] & 1) == 0) {
        goto LABEL_80;
      }
      uint64_t v15 = 11LL;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  -[_NSAttributedStringGrammarInflection setGrammaticalCase:](v6, "setGrammaticalCase:", v15);
  v16 = (void *)[a3 objectForKeyedSubscript:@"number"];
  if (v16 && (v17 = v16, ([v16 isEqual:@"none"] & 1) == 0))
  {
    if ([v17 isEqual:@"one"])
    {
      uint64_t v18 = 1LL;
    }

    else if ([v17 isEqual:@"two"])
    {
      uint64_t v18 = 2LL;
    }

    else if ([v17 isEqual:@"few"])
    {
      uint64_t v18 = 3LL;
    }

    else if ([v17 isEqual:@"many"])
    {
      uint64_t v18 = 4LL;
    }

    else if ([v17 isEqual:@"zero"])
    {
      uint64_t v18 = 5LL;
    }

    else
    {
      if (([v17 isEqual:@"other"] & 1) == 0) {
        goto LABEL_80;
      }
      uint64_t v18 = 6LL;
    }
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  -[_NSAttributedStringGrammarInflection setNumber:](v6, "setNumber:", v18);
  v19 = (void *)[a3 objectForKeyedSubscript:@"person"];
  if (!v19 || (v20 = v19, ([v19 isEqual:@"none"] & 1) != 0))
  {
    uint64_t v21 = 0LL;
LABEL_17:
    -[_NSAttributedStringGrammarInflection setPerson:](v6, "setPerson:", v21);
    v22 = (void *)[a3 objectForKeyedSubscript:@"customPronouns"];
    if (_NSIsNSDictionary() && [v22 count])
    {
      uint64_t v23 = [v22 objectForKeyedSubscript:@"en"];
      if (!v23) {
        goto LABEL_80;
      }
      v24 = (void *)v23;
      uint64_t v25 = [v24 objectForKeyedSubscript:@"subjectForm"];
      uint64_t v26 = [v24 objectForKeyedSubscript:@"objectForm"];
      uint64_t v27 = [v24 objectForKeyedSubscript:@"possessiveForm"];
      uint64_t v28 = [v24 objectForKeyedSubscript:@"possessiveAdjectiveForm"];
      uint64_t v29 = [v24 objectForKeyedSubscript:@"reflexiveForm"];
      v30 = objc_alloc_init(&OBJC_CLASS___NSMorphologyCustomPronoun);
      -[NSMorphologyCustomPronoun setSubjectForm:](v30, "setSubjectForm:", v25);
      -[NSMorphologyCustomPronoun setObjectForm:](v30, "setObjectForm:", v26);
      -[NSMorphologyCustomPronoun setPossessiveForm:](v30, "setPossessiveForm:", v27);
      -[NSMorphologyCustomPronoun setPossessiveAdjectiveForm:](v30, "setPossessiveAdjectiveForm:", v28);
      -[NSMorphologyCustomPronoun setReflexiveForm:](v30, "setReflexiveForm:", v29);
      if (!v30) {
        goto LABEL_80;
      }
    }

    else
    {
      v30 = 0LL;
    }

    v6->_englishCustomPronoun = v30;
    return v6;
  }

  if ([v20 isEqual:@"first"])
  {
    uint64_t v21 = 1LL;
    goto LABEL_17;
  }

  if ([v20 isEqual:@"second"])
  {
    uint64_t v21 = 2LL;
    goto LABEL_17;
  }

  if ([v20 isEqual:@"third"])
  {
    uint64_t v21 = 3LL;
    goto LABEL_17;
  }

- (NSDictionary)externalRepresentationDictionary
{
  v19[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  if (-[_NSAttributedStringGrammarInflection context](self, "context") == 1) {
    int64_t v4 = @"technicalTerm";
  }
  else {
    int64_t v4 = 0LL;
  }
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"context");
  int64_t v5 = -[_NSAttributedStringGrammarInflection gender](self, "gender");
  id v6 = 0LL;
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"grammaticalGender");
  unint64_t v7 = -[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase") - 1;
  if (v7 > 0xA) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = off_189CA1F38[v7];
  }
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"grammaticalCase");
  unint64_t v9 = -[_NSAttributedStringGrammarInflection number](self, "number") - 1;
  if (v9 > 5) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = off_189CA1F90[v9];
  }
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, @"number");
  unint64_t v11 = -[_NSAttributedStringGrammarInflection person](self, "person") - 1;
  if (v11 > 2) {
    uint64_t v12 = 0LL;
  }
  else {
    uint64_t v12 = off_189CA1FC0[v11];
  }
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, @"person");
  v13 = -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun");
  if (-[NSMorphologyCustomPronoun subjectForm](v13, "subjectForm"))
  {
    if (-[NSMorphologyCustomPronoun objectForm](v13, "objectForm"))
    {
      if (-[NSMorphologyCustomPronoun possessiveForm](v13, "possessiveForm"))
      {
        if (-[NSMorphologyCustomPronoun possessiveAdjectiveForm](v13, "possessiveAdjectiveForm"))
        {
          if (-[NSMorphologyCustomPronoun reflexiveForm](v13, "reflexiveForm"))
          {
            uint64_t v18 = @"en";
            v16[0] = @"subjectForm";
            v17[0] = -[NSMorphologyCustomPronoun subjectForm](v13, "subjectForm");
            v16[1] = @"objectForm";
            v17[1] = -[NSMorphologyCustomPronoun objectForm](v13, "objectForm");
            v16[2] = @"possessiveForm";
            v17[2] = -[NSMorphologyCustomPronoun possessiveForm](v13, "possessiveForm");
            v16[3] = @"possessiveAdjectiveForm";
            v17[3] = -[NSMorphologyCustomPronoun possessiveAdjectiveForm](v13, "possessiveAdjectiveForm");
            v16[4] = @"reflexiveForm";
            v17[4] = -[NSMorphologyCustomPronoun reflexiveForm](v13, "reflexiveForm");
            v19[0] = [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:5];
            uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
            if (v14) {
              -[NSDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  @"customPronouns");
            }
          }
        }
      }
    }
  }

  return v3;
}

- (NSData)externalRepresentation
{
  return +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  -[_NSAttributedStringGrammarInflection externalRepresentationDictionary]( self,  "externalRepresentationDictionary"),  2LL,  0LL);
}

+ (_NSAttributedStringGrammarInflection)userInflection
{
  return  -[_NSAttributedStringGrammarInflection initWithMorphology:]( objc_alloc(&OBJC_CLASS____NSAttributedStringGrammarInflection),  "initWithMorphology:",  0LL);
}

+ (_NSAttributedStringGrammarInflection)_currentGlobalUserInflectionIfAvailable
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  getpid();
  uint64_t v4 = [@"com.apple.morphology.internal" UTF8String];
  if (!sandbox_check()) {
    return +[_NSAttributedStringGrammarInflection _currentGlobalUserInflection]( &OBJC_CLASS____NSAttributedStringGrammarInflection,  "_currentGlobalUserInflection");
  }
  if (_NSInflectionLog_onceToken != -1) {
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  }
  v2 = (os_log_s *)_NSInflectionLog_log;
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = objc_msgSend(@"com.apple.morphology.internal", "UTF8String", v4);
    _os_log_debug_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEBUG,  "Could not read values in %s: accessing these preferences requires user-preference-read or file-read-data sandbox access",  buf,  0xCu);
  }

  return 0LL;
}

+ (_NSAttributedStringGrammarInflection)_currentGlobalUserInflection
{
  v2 = (void *)CFPreferencesCopyValue( @"AppleUserMorphology",  @"com.apple.morphology.internal",  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
  if (_NSIsNSDictionary()) {
    uint64_t v3 = (_NSAttributedStringGrammarInflection *) -[_NSAttributedStringGrammarInflection _initWithMarkdownDictionary:]( objc_alloc(&OBJC_CLASS____NSAttributedStringGrammarInflection),  "_initWithMarkdownDictionary:",  v2);
  }
  else {
    uint64_t v3 = 0LL;
  }

  return v3;
}

+ (void)_addGlobalUserInflectionObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
}

+ (void)_removeGlobalUserInflectionObserver:(id)a3 context:(void *)a4
{
}

- (void)_setAsGlobalUserInflection
{
  id v2 = -[_NSAttributedStringGrammarInflection _markupDictionary](self, "_markupDictionary");
  uint64_t v3 = (const __CFString *)*MEMORY[0x189605198];
  uint64_t v4 = (const __CFString *)*MEMORY[0x189605178];
  _CFPreferencesSetFileProtectionClass();
  _CFPreferencesSetFileProtectionClass();
  if (qword_18C496E40) {
    int64_t v5 = (const __CFString *)qword_18C496E40;
  }
  else {
    int64_t v5 = @"com.apple.morphology.internal";
  }
  CFPreferencesSetValue(@"AppleUserMorphology", v2, v5, v3, v4);
  if (qword_18C496E40) {
    uint64_t v6 = (const __CFString *)qword_18C496E40;
  }
  else {
    uint64_t v6 = @"com.apple.morphology.internal";
  }
  CFPropertyListRef v7 = CFPreferencesCopyValue(@"AppleUserMorphologyAllowThirdPartyAccess", v6, v3, v4);
  if (v7)
  {
    uint64_t v8 = v7;
    if (CFEqual(v7, (CFTypeRef)*MEMORY[0x189604DE8]))
    {
      if (qword_18C496E48) {
        unint64_t v9 = (const __CFString *)qword_18C496E48;
      }
      else {
        unint64_t v9 = @"com.apple.morphology";
      }
      CFPreferencesSetValue(@"AppleUserMorphology", v2, v9, v3, v4);
    }

    CFRelease(v8);
  }

  +[NSMorphology _clearCachedUserMorphology](&OBJC_CLASS___NSMorphology, "_clearCachedUserMorphology");
}

+ (BOOL)_thirdPartyApplicationsCanAccessUserInflection
{
  if (qword_18C496E40) {
    id v2 = (const __CFString *)qword_18C496E40;
  }
  else {
    id v2 = @"com.apple.morphology.internal";
  }
  uint64_t v3 = (void *)CFPreferencesCopyValue( @"AppleUserMorphologyAllowThirdPartyAccess",  v2,  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
  char v4 = [v3 isEqual:MEMORY[0x189604A88]];

  return v4;
}

+ (void)_setThirdPartyApplicationsCanAccessUserInflection:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = (const __CFString *)*MEMORY[0x189605198];
  int64_t v5 = (const __CFString *)*MEMORY[0x189605178];
  _CFPreferencesSetFileProtectionClass();
  _CFPreferencesSetFileProtectionClass();
  uint64_t v6 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3);
  if (qword_18C496E40) {
    CFPropertyListRef v7 = (const __CFString *)qword_18C496E40;
  }
  else {
    CFPropertyListRef v7 = @"com.apple.morphology.internal";
  }
  CFPreferencesSetValue(@"AppleUserMorphologyAllowThirdPartyAccess", v6, v7, v4, v5);
  if (v3)
  {
    if (qword_18C496E40) {
      uint64_t v8 = (const __CFString *)qword_18C496E40;
    }
    else {
      uint64_t v8 = @"com.apple.morphology.internal";
    }
    CFPropertyListRef v9 = CFPreferencesCopyValue(@"AppleUserMorphology", v8, v4, v5);
    if (v9)
    {
      uint64_t v10 = v9;
      if (qword_18C496E48) {
        unint64_t v11 = (const __CFString *)qword_18C496E48;
      }
      else {
        unint64_t v11 = @"com.apple.morphology";
      }
      CFPreferencesSetValue(@"AppleUserMorphology", v9, v11, v4, v5);
      CFRelease(v10);
    }
  }

  else
  {
    if (qword_18C496E48) {
      uint64_t v12 = (const __CFString *)qword_18C496E48;
    }
    else {
      uint64_t v12 = @"com.apple.morphology";
    }
    CFPreferencesSetValue(@"AppleUserMorphology", 0LL, v12, v4, v5);
  }

- (void)_useInsteadOfUserInflectionInBlock:(id)a3
{
  char v4 = -[NSMorphology initWithInflection:](objc_alloc(&OBJC_CLASS___NSMorphology), "initWithInflection:", self);
  -[NSMorphology _overrideUserInflectionInBlock:](v4, (uint64_t)a3);
}

+ (void)_usePreferencesDomainForFirstParty:(id)a3 thirdParty:(id)a4 simulateLockedDevice:(BOOL)a5 simulateThirdPartyProcess:(BOOL)a6 withinBlock:(id)a7
{
  uint64_t v8 = qword_18C496E40;
  uint64_t v9 = qword_18C496E48;
  __int16 v10 = _MergedGlobals_139;
  qword_18C496E40 = (uint64_t)a3;
  qword_18C496E48 = (uint64_t)a4;
  LOBYTE(_MergedGlobals_139) = a5;
  HIBYTE(_MergedGlobals_139) = a6;
  +[NSMorphology _clearCachedUserMorphology](&OBJC_CLASS___NSMorphology, "_clearCachedUserMorphology");
  (*((void (**)(id))a7 + 2))(a7);
  qword_18C496E40 = v8;
  qword_18C496E48 = v9;
  _MergedGlobals_139 = v10;
  +[NSMorphology _clearCachedUserMorphology](&OBJC_CLASS___NSMorphology, "_clearCachedUserMorphology");
}

+ (NSString)_protectedPreferencesDomain
{
  if (qword_18C496E40) {
    return (NSString *)qword_18C496E40;
  }
  else {
    return (NSString *)@"com.apple.morphology.internal";
  }
}

+ (NSString)_thirdPartyPreferencesDomain
{
  if (qword_18C496E48) {
    return (NSString *)qword_18C496E48;
  }
  else {
    return (NSString *)@"com.apple.morphology";
  }
}

+ (BOOL)_isSimulatingLockedDevice
{
  return _MergedGlobals_139;
}

+ (BOOL)_isSimulatingThirdPartyProcess
{
  return HIBYTE(_MergedGlobals_139);
}

- (id)_initWithGender:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____NSAttributedStringGrammarInflection;
  char v4 = -[_NSAttributedStringGrammarInflection init](&v7, sel_init);
  int64_t v5 = v4;
  if (v4) {
    -[_NSAttributedStringGrammarInflection setGender:](v4, "setGender:", a3);
  }
  return v5;
}

+ (NSArray)presetInflections
{
  if (qword_18C496E58 != -1) {
    dispatch_once(&qword_18C496E58, &__block_literal_global_64);
  }
  return (NSArray *)qword_18C496E50;
}

+ (BOOL)canSelectCustomInflection
{
  return 0;
}

- (NSString)localizedShortDescription
{
  BOOL v3 = -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun");
  uint64_t v4 = -[NSMorphologyCustomPronoun subjectForm](v3, "subjectForm");
  uint64_t v5 = -[NSMorphologyCustomPronoun objectForm](v3, "objectForm");
  if (v4 && v5) {
    return +[NSString localizedStringWithFormat:]( NSString,  "localizedStringWithFormat:",  [(id)_NSFoundationBundle() localizedStringForKey:@"[CUSTOM PRONOUN] %@/%@" value:&stru_189CA6A28 table:@"Morphology"],  v4,  v5);
  }
  int64_t v7 = -[_NSAttributedStringGrammarInflection gender](self, "gender");
  switch(v7)
  {
    case 1LL:
      uint64_t v8 = (void *)_NSFoundationBundle();
      uint64_t v9 = @"Masculine";
      break;
    case 3LL:
      uint64_t v8 = (void *)_NSFoundationBundle();
      uint64_t v9 = @"Neutral";
      break;
    case 2LL:
      uint64_t v8 = (void *)_NSFoundationBundle();
      uint64_t v9 = @"Feminine";
      break;
    default:
      uint64_t v8 = (void *)_NSFoundationBundle();
      uint64_t v9 = @"Not Specified";
      break;
  }

  return (NSString *)[v8 localizedStringForKey:v9 value:&stru_189CA6A28 table:@"Morphology"];
}

+ (BOOL)_canSelectUserInflectionWithPreferredLanguages:(id)a3
{
  return (unint64_t)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "length") >= 2
      && objc_msgSend( &unk_189D1EE88,  "containsObject:",  objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "substringToIndex:", 2),  "lowercaseString"))
      && _NSRequiresMorphunInflectionForLanguageIdentifier((void *)[a3 firstObject]);
}

+ (BOOL)canSelectUserInflection
{
  return objc_msgSend( a1,  "_canSelectUserInflectionWithPreferredLanguages:",  objc_msgSend(MEMORY[0x189603F90], "preferredLanguages"));
}

@end