@interface NSLocale(NSLocale)
+ (uint64_t)autoupdatingCurrentLocale;
- (NSString)debugDescription;
- (uint64_t)classForCoder;
- (uint64_t)encodeWithCoder:()NSLocale;
- (uint64_t)initWithCoder:()NSLocale;
@end

@implementation NSLocale(NSLocale)

- (NSString)debugDescription
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_CLASS___NSLocale_0;
  return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ '%@'}",  objc_msgSendSuper2(&v2, sel_debugDescription),  [a1 localeIdentifier]);
}

+ (uint64_t)autoupdatingCurrentLocale
{
  return [MEMORY[0x189603F90] _autoupdatingCurrent];
}

- (uint64_t)encodeWithCoder:()NSLocale
{
  if ([a3 allowsKeyedCoding]) {
    return objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "localeIdentifier"), @"NS.identifier");
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSLocales cannot be encoded by non-keyed archivers" userInfo:0]);
  return -[NSLocale(NSLocale) initWithCoder:]();
}

- (uint64_t)initWithCoder:()NSLocale
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.identifier"];
    if ((_NSIsNSString() & 1) != 0)
    {
      return [a1 initWithLocaleIdentifier:v5];
    }

    else
    {
      objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  0));

      return 0LL;
    }
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSLocales cannot be decoded by non-keyed archivers" userInfo:0]);
    return -[NSLocale(NSLocale) classForCoder]();
  }

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

@end