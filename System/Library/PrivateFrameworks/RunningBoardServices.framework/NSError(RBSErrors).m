@interface NSError(RBSErrors)
+ (id)rbs_errorClientNotAuthorized;
+ (id)rbs_errorClientNotEntitled:()RBSErrors permanent:;
- (BOOL)rbs_isPermanentFailure;
@end

@implementation NSError(RBSErrors)

+ (id)rbs_errorClientNotEntitled:()RBSErrors permanent:
{
  id v5 = a3;
  [MEMORY[0x189603FC8] dictionary];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:@"Client not entitled" forKey:*MEMORY[0x1896075F0]];
  if (v5) {
    [v6 setObject:v5 forKey:@"RBSEntitlement"];
  }
  [MEMORY[0x189607968] numberWithBool:a4];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v7 forKey:@"RBSPermanent"];

  [MEMORY[0x189607870] errorWithDomain:@"RBSServiceErrorDomain" code:1 userInfo:v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)rbs_errorClientNotAuthorized
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 setObject:@"Client not authorized" forKey:*MEMORY[0x1896075F0]];
  [v0 setObject:MEMORY[0x189604A80] forKey:@"RBSPermanent"];
  [MEMORY[0x189607870] errorWithDomain:@"RBSServiceErrorDomain" code:1 userInfo:v0];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (BOOL)rbs_isPermanentFailure
{
  BOOL result = -[NSError rbs_isServiceDenied](a1);
  if (result)
  {
    [a1 userInfo];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 valueForKey:@"RBSPermanent"];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 BOOLValue];

    return v5;
  }

  return result;
}

@end