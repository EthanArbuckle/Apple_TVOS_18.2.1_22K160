@interface LSCheckLSDServiceAccessForAuditToken
@end

@implementation LSCheckLSDServiceAccessForAuditToken

Class ___LSCheckLSDServiceAccessForAuditToken_block_invoke()
{
  Class result = NSClassFromString(@"_LSDService");
  _LSCheckLSDServiceAccessForAuditToken::lsdServiceClass = (uint64_t)result;
  return result;
}

@end