@interface OctagonSignpostLogSystem
@end

@implementation OctagonSignpostLogSystem

void ___OctagonSignpostLogSystem_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.security.signposts", "signpost");
  v1 = (void *)_OctagonSignpostLogSystem_log;
  _OctagonSignpostLogSystem_log = (uint64_t)v0;
}

@end