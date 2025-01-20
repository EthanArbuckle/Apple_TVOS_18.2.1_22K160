@interface NSKnownKeysDictionary
+ (NSArray)classesForArchiving;
+ (NSKnownKeysDictionary)alloc;
+ (NSKnownKeysDictionary)allocWithZone:(_NSZone *)a3;
+ (id)newInstanceWithSearchStrategy:(id)a3 inData:(id)a4;
- (NSKnownKeysDictionary)initWithSearchStrategy:(id)a3;
- (NSKnownKeysMappingStrategy)mapping;
- (const)values;
- (id)initForKeys:(id)a3;
- (id)valueAtIndex:(unint64_t)a3;
@end

@implementation NSKnownKeysDictionary

+ (NSKnownKeysDictionary)allocWithZone:(_NSZone *)a3
{
  return (NSKnownKeysDictionary *)objc_opt_class();
}

+ (NSKnownKeysDictionary)alloc
{
  return (NSKnownKeysDictionary *)objc_opt_class();
}

+ (id)newInstanceWithSearchStrategy:(id)a3 inData:(id)a4
{
  return 0LL;
}

+ (NSArray)classesForArchiving
{
  v3[3] = *MEMORY[0x1895F89C0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  return (NSArray *)[MEMORY[0x189603F18] arrayWithObjects:v3 count:3];
}

- (NSKnownKeysDictionary)initWithSearchStrategy:(id)a3
{
  return 0LL;
}

- (id)initForKeys:(id)a3
{
  return 0LL;
}

- (NSKnownKeysMappingStrategy)mapping
{
  return 0LL;
}

- (const)values
{
  return 0LL;
}

- (id)valueAtIndex:(unint64_t)a3
{
  return 0LL;
}

@end