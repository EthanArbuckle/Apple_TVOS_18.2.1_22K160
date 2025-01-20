@interface NSInflectionRule
+ (BOOL)canInflectLanguage:(NSString *)language;
+ (BOOL)canInflectPreferredLocalization;
+ (BOOL)supportsSecureCoding;
+ (NSInflectionRule)automaticRule;
- (NSInflectionRule)initWithCoder:(id)a3;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSInflectionRule

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSInflectionRule;
  return -[NSInflectionRule init](&v3, sel_init);
}

+ (NSInflectionRule)automaticRule
{
  if (qword_18C492548 != -1) {
    dispatch_once(&qword_18C492548, &__block_literal_global_61);
  }
  return (NSInflectionRule *)_MergedGlobals_3;
}

id __33__NSInflectionRule_automaticRule__block_invoke()
{
  id result = -[NSInflectionRule _init](objc_alloc(&OBJC_CLASS____NSInflectionRuleAutomatic), "_init");
  _MergedGlobals_3 = (uint64_t)result;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)encodeWithCoder:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSInflectionRule)initWithCoder:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

+ (BOOL)supportsSecureCoding
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)a1, a2, v4);
}

+ (BOOL)canInflectPreferredLocalization
{
  id v3 = -[NSArray firstObject]( -[NSBundle preferredLocalizations]( +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"),  "preferredLocalizations"),  "firstObject");
  if (v3) {
    LOBYTE(v3) = [a1 canInflectLanguage:v3];
  }
  return (char)v3;
}

+ (BOOL)canInflectLanguage:(NSString *)language
{
  BOOL v4 = _NSRequiresMorphunInflectionForLanguageIdentifier(language);
  if (v4) {
    LOBYTE(v4) = _NSRequiresMorphunInflectionForLanguageIdentifier(language);
  }
  return v4;
}

@end