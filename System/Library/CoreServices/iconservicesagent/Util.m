@interface Util
+ (int)pidFromAuditToken:(id *)a3;
@end

@implementation Util

+ (int)pidFromAuditToken:(id *)a3
{
  pid_t pidp = 0;
  __int128 v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v3;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  return pidp;
}

@end