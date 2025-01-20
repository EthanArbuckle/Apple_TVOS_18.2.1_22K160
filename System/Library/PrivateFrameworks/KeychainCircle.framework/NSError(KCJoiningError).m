@interface NSError(KCJoiningError)
+ (id)errorWithJoiningError:()KCJoiningError format:;
+ (id)errorWithJoiningError:()KCJoiningError format:arguments:;
- (uint64_t)initWithJoiningError:()KCJoiningError userInfo:;
@end

@implementation NSError(KCJoiningError)

- (uint64_t)initWithJoiningError:()KCJoiningError userInfo:
{
  return [a1 initWithDomain:KCErrorDomain code:a3 userInfo:a4];
}

+ (id)errorWithJoiningError:()KCJoiningError format:arguments:
{
  v15[1] = *MEMORY[0x1895F89C0];
  v7 = (objc_class *)MEMORY[0x189607870];
  id v8 = a4;
  id v9 = objc_alloc(v7);
  uint64_t v14 = *MEMORY[0x1896075E0];
  v10 = (void *)[objc_alloc(NSString) initWithFormat:v8 arguments:a5];

  v15[0] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)[v9 initWithJoiningError:a3 userInfo:v11];

  return v12;
}

+ (id)errorWithJoiningError:()KCJoiningError format:
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end