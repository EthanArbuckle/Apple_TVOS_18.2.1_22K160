@interface NSAutoLocale
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (NSAutoLocale)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSAutoLocale

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSAutoLocale)initWithCoder:(id)a3
{
  char v4 = [a3 allowsKeyedCoding];

  if ((v4 & 1) != 0) {
    return (NSAutoLocale *)(id)[MEMORY[0x189603F90] autoupdatingCurrentLocale];
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSLocales cannot be decoded by non-keyed archivers" userInfo:0]);
  return (NSAutoLocale *)-[NSAutoLocale classForCoder](v6, v7);
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

@end