@interface CFPrefsRecreateFileWatcher
@end

@implementation CFPrefsRecreateFileWatcher

uint64_t ___CFPrefsRecreateFileWatcher_block_invoke()
{
  uint64_t locked = _onqueue_locked_CFPrefsRecreateFileWatcher();
  os_unfair_lock_unlock((os_unfair_lock_t)&dirWatcherLock);
  return fsEventStreamStart(locked);
}

@end