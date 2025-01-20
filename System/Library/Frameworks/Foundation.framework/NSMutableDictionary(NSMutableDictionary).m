@interface NSMutableDictionary(NSMutableDictionary)
- (uint64_t)classForCoder;
- (uint64_t)initWithContentsOfFile:()NSMutableDictionary;
- (uint64_t)initWithContentsOfURL:()NSMutableDictionary;
- (uint64_t)initWithContentsOfURL:()NSMutableDictionary error:;
@end

@implementation NSMutableDictionary(NSMutableDictionary)

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

- (uint64_t)initWithContentsOfFile:()NSMutableDictionary
{
  uint64_t v4 = [MEMORY[0x189603F68] newWithContentsOf:a3 immutable:0];

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSMutableDictionary
{
  uint64_t v4 = [MEMORY[0x189603F68] newWithContentsOf:a3 immutable:0];

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSMutableDictionary error:
{
  uint64_t v5 = [MEMORY[0x189603F68] newWithContentsOf:a3 immutable:0 error:a4];

  return v5;
}

@end