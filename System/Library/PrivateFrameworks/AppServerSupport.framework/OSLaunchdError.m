@interface OSLaunchdError
+ (id)createXPCError:(int)a3;
@end

@implementation OSLaunchdError

+ (id)createXPCError:(int)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  [NSString stringWithUTF8String:xpc_strerror()];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *MEMORY[0x1896075F0];
  v9[0] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607870] errorWithDomain:@"OSLaunchdErrorDomain" code:a3 userInfo:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end