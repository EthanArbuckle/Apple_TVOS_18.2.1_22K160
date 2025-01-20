@interface _CFPrefsSynchronizer
+ (uint64_t)sharedInstance;
- (CFSetRef)copyDirtySourcesSnapshotAndClear;
- (_CFPrefsSynchronizer)init;
- (void)clear;
- (void)clear_alreadyLocked;
- (void)disableTimer_alreadyLocked;
- (void)enableTimer_alreadyLocked;
- (void)noteDirtySource:(uint64_t)a1;
- (void)synchronize;
- (void)synchronizeForDaemonTermination;
@end

@implementation _CFPrefsSynchronizer

+ (uint64_t)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_42);
  }
  return sharedInstance_shared;
}

- (_CFPrefsSynchronizer)init
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____CFPrefsSynchronizer;
  v2 = -[_CFPrefsSynchronizer init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_CFPrefsDirtySourcesLock._os_unfair_lock_opaque = 0;
    v2->_dirtySources = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, &kCFTypeSetCallBacks);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v5 = dispatch_queue_create_with_target_V2("CFPreferences Periodic Sync Queue", 0LL, global_queue);
    v3->_synchQueue = (OS_dispatch_queue *)v5;
    v6 = dispatch_source_create(MEMORY[0x1895F8B38], 0x2710uLL, 0LL, v5);
    v3->_synchTimer = (OS_dispatch_source *)v6;
    dispatch_source_set_event_handler(v6, &__block_literal_global_2_0);
  }

  return v3;
}

- (void)synchronize
{
  if (a1)
  {
    v1 = -[_CFPrefsSynchronizer copyDirtySourcesSnapshotAndClear](a1);
    CFSetApplyFunction(v1, (CFSetApplierFunction)_CFPrefsSynchronizeDirtySourceForTimer, 0LL);
    CFRelease(v1);
  }

- (void)enableTimer_alreadyLocked
{
  if (a1)
  {
    if (!*(_BYTE *)(a1 + 36))
    {
      *(_BYTE *)(a1 + 36) = 1;
      dispatch_resume(*(dispatch_object_t *)(a1 + 8));
    }
  }

- (void)disableTimer_alreadyLocked
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 36))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 8));
      *(_BYTE *)(a1 + 36) = 0;
    }
  }

- (void)noteDirtySource:(uint64_t)a1
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 24), a2);
    if (!*(_BYTE *)(a1 + 36))
    {
      *(_BYTE *)(a1 + 36) = 1;
      dispatch_resume(*(dispatch_object_t *)(a1 + 8));
    }

    os_unfair_lock_unlock(v4);
  }

- (CFSetRef)copyDirtySourcesSnapshotAndClear
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    v2 = (os_unfair_lock_s *)((char *)result + 32);
    os_unfair_lock_lock_with_options();
    CFSetRef Copy = CFSetCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, *(CFSetRef *)(v1 + 24));
    -[_CFPrefsSynchronizer clear_alreadyLocked](v1);
    os_unfair_lock_unlock(v2);
    return Copy;
  }

  return result;
}

- (void)clear_alreadyLocked
{
  if (a1)
  {
    CFSetRemoveAllValues(*(CFMutableSetRef *)(a1 + 24));
    if (*(_BYTE *)(a1 + 36))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 8));
      *(_BYTE *)(a1 + 36) = 0;
    }
  }

- (void)synchronizeForDaemonTermination
{
  if (a1)
  {
    uint64_t v1 = -[_CFPrefsSynchronizer copyDirtySourcesSnapshotAndClear](a1);
    CFSetApplyFunction(v1, (CFSetApplierFunction)_CFPrefsSynchronizeDirtySourceForDaemonTermination, 0LL);
    CFRelease(v1);
  }

- (void)clear
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    -[_CFPrefsSynchronizer clear_alreadyLocked](a1);
    os_unfair_lock_unlock(v2);
  }

@end