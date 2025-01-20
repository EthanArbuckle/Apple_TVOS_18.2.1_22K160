@interface NSError(UsefulConstructors)
+ (id)errorWithDomain:()UsefulConstructors code:description:underlying:;
+ (uint64_t)errorWithDomain:()UsefulConstructors code:description:;
@end

@implementation NSError(UsefulConstructors)

+ (uint64_t)errorWithDomain:()UsefulConstructors code:description:
{
  return [MEMORY[0x189607870] errorWithDomain:a3 code:a4 description:a5 underlying:0];
}

+ (id)errorWithDomain:()UsefulConstructors code:description:underlying:
{
  v9 = (objc_class *)MEMORY[0x189603FC8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc_init(v9);
  [v13 setObject:v11 forKeyedSubscript:*MEMORY[0x1896075E0]];

  [v13 setObject:v10 forKeyedSubscript:*MEMORY[0x189607798]];
  [MEMORY[0x189607870] errorWithDomain:v12 code:a4 userInfo:v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end