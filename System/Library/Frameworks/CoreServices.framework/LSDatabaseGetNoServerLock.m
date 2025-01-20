@interface LSDatabaseGetNoServerLock
@end

@implementation LSDatabaseGetNoServerLock

double ___LSDatabaseGetNoServerLock_block_invoke()
{
  if (([(id)__LSDefaultsGetSharedInstance() hasServer] & 1) == 0
    && ([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0)
  {
    v1 = operator new(0x40uLL);
    double result = 0.0;
    _OWORD *v1 = 0u;
    v1[1] = 0u;
    v1[2] = 0u;
    v1[3] = 0u;
    *(void *)v1 = 850045858LL;
    _LSDatabaseGetNoServerLock::double result = (uint64_t)v1;
  }

  return result;
}

@end