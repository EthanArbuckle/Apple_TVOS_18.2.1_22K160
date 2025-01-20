@interface LogUtils
@end

@implementation LogUtils

uint64_t __LogUtils_EnsureInitialized_block_invoke()
{
  return pthread_mutex_unlock(&gLogUtilsLock);
}

@end