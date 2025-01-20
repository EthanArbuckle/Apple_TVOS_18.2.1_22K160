@interface CEMDeviceLockCommand
- (BOOL)dmf_requestExecutesWithoutReturning;
- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4;
- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMDeviceLockCommand

- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_opt_new(&OBJC_CLASS___DMFLockDeviceRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceLockCommand payloadMessage](self, "payloadMessage"));
  [v5 setMessage:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceLockCommand payloadPhoneNumber](self, "payloadPhoneNumber"));
  [v5 setPhoneNumber:v7];

  return v5;
}

- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4
{
  return 0LL;
}

- (BOOL)dmf_requestExecutesWithoutReturning
{
  return 0;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0LL;
}

@end