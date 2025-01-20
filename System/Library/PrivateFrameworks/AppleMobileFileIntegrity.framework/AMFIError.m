@interface AMFIError
- (AMFIError)initWithAMFIErrorCode:(int64_t)a3 withURL:(id)a4;
- (AMFIError)initWithMISError:(int)a3 withURL:(id)a4;
@end

@implementation AMFIError

- (AMFIError)initWithAMFIErrorCode:(int64_t)a3 withURL:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x189607760]];
  }
  errorStringForAMFIErrorCode(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1896075E0]];

  v10 = -[AMFIError initWithDomain:code:userInfo:]( self,  "initWithDomain:code:userInfo:",  @"AppleMobileFileIntegrityError",  a3,  v8);
  return v10;
}

- (AMFIError)initWithMISError:(int)a3 withURL:(id)a4
{
  id v6 = a4;
  v7 = -[AMFIError initWithAMFIErrorCode:withURL:](self, "initWithAMFIErrorCode:withURL:", errorCodeForMISError(a3), v6);

  return v7;
}

@end