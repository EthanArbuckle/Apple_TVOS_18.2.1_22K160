@interface CEMDeviceRestartCommand
- (BOOL)dmf_requestExecutesWithoutReturning;
- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4;
- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMDeviceRestartCommand

- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4
{
  return (id)objc_opt_new(&OBJC_CLASS___DMFRestartDeviceRequest, a2, a3, a4);
}

- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4
{
  return 0LL;
}

- (BOOL)dmf_requestExecutesWithoutReturning
{
  return 1;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0LL;
}

@end