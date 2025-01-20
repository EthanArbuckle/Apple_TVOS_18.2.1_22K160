@interface _PFLock
+ (void)initialize;
- (BOOL)tryLock;
- (_PFLock)init;
- (void)dealloc;
- (void)lock;
- (void)unlock;
@end

@implementation _PFLock

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    pthread_mutexattr_init(&__PFLockNMAttr);
    pthread_mutexattr_settype(&__PFLockNMAttr, 2);
  }

- (_PFLock)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PFLock;
  v2 = -[_PFLock init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    if (pthread_mutex_init(&v2->_lock, &__PFLockNMAttr))
    {
      v5.receiver = v3;
      v5.super_class = (Class)&OBJC_CLASS____PFLock;
      -[_PFLock dealloc](&v5, sel_dealloc);
      return 0LL;
    }

    else
    {
      v3->_owner = 0LL;
      v3->_count = 0LL;
    }
  }

  return v3;
}

- (void)dealloc
{
  if (pthread_mutex_destroy(&self->_lock) == 16 || self->_owner)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"_PFLock deallocated while in use"];
    _NSCoreDataLog(17LL, v3, v4, v5, v6, v7, v8, v9, (uint64_t)v11.receiver);
    v10 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_186681000,  v10,  OS_LOG_TYPE_FAULT,  "CoreData: _PFLock deallocated while in use",  buf,  2u);
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____PFLock;
  -[_PFLock dealloc](&v11, sel_dealloc);
}

- (void)lock
{
  uint64_t v3 = pthread_self();
  unint64_t v4 = self->_count + 1;
  self->_owner = v3;
  self->_count = v4;
}

- (BOOL)tryLock
{
  int v3 = pthread_mutex_trylock(&self->_lock);
  if (!v3)
  {
    unint64_t v4 = pthread_self();
    unint64_t v5 = self->_count + 1;
    self->_owner = v4;
    self->_count = v5;
  }

  return v3 == 0;
}

- (void)unlock
{
  unint64_t v2 = self->_count - 1;
  self->_count = v2;
  if (!v2) {
    self->_owner = 0LL;
  }
  pthread_mutex_unlock(&self->_lock);
}

@end