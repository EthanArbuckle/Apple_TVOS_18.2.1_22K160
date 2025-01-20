@interface LSIsCurrentProcessSandboxed
@end

@implementation LSIsCurrentProcessSandboxed

void ___LSIsCurrentProcessSandboxed_block_invoke()
{
  if (_LSGetAuditTokenForSelf::once != -1) {
    dispatch_once(&_LSGetAuditTokenForSelf::once, &__block_literal_global_117);
  }
  _LSIsAuditTokenSandboxed( _LSGetAuditTokenForSelf::result,  &_LSIsCurrentProcessSandboxed::sSandbox,  (BOOL *)&_LSIsCurrentProcessSandboxed::sAppSandbox);
}

@end