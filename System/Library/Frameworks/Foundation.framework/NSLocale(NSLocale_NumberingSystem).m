@interface NSLocale(NSLocale_NumberingSystem)
- (const)_numberingSystem;
@end

@implementation NSLocale(NSLocale_NumberingSystem)

- (const)_numberingSystem
{
  return @"latn";
}

@end