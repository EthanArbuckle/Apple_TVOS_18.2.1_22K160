@interface LSProcessCanAccessProgressPort
@end

@implementation LSProcessCanAccessProgressPort

void ___LSProcessCanAccessProgressPort_block_invoke()
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = _LSGetAuditTokenForSelf();
  _LSProcessCanAccessProgressPort_canAccessProgressPort = _LSCheckMachPortAccessForAuditToken(v0, v1) != 0;
}

@end