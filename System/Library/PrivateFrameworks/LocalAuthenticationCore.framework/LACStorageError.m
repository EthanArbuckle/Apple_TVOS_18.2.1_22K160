@interface LACStorageError
+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4;
@end

@implementation LACStorageError

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v5) {
    [v6 setObject:v5 forKey:*MEMORY[0x189607490]];
  }
  [MEMORY[0x189607870] errorWithDomain:@"com.apple.LocalAuthentication.Storage" code:a3 userInfo:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end