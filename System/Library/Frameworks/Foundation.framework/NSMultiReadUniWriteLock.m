@interface NSMultiReadUniWriteLock
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)lockForReadingBeforeDate:(id)a3;
- (BOOL)lockForWritingBeforeDate:(id)a3;
- (BOOL)tryLockForReading;
- (BOOL)tryLockForWriting;
- (NSMultiReadUniWriteLock)init;
- (id)description;
- (id)name;
- (void)dealloc;
- (void)lock;
- (void)lockForReading;
- (void)lockForWriting;
- (void)setName:(id)a3;
- (void)unlock;
@end

@implementation NSMultiReadUniWriteLock

+ (id)allocWithZone:(_NSZone *)a3
{
  return NSAllocateObject((Class)a1, 0xD8uLL, a3);
}

- (NSMultiReadUniWriteLock)init
{
  v2 = self;
  uint64_t v6 = *MEMORY[0x1895F89C0];
  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  if (pthread_rwlock_init(IndexedIvars, 0LL))
  {
    v5.receiver = v2;
    v5.super_class = (Class)&OBJC_CLASS___NSMultiReadUniWriteLock;
    -[NSMultiReadUniWriteLock dealloc](&v5, sel_dealloc);
    return 0LL;
  }

  else
  {
    IndexedIvars[1].__sig = 0LL;
    *(void *)IndexedIvars[1].__opaque = 0LL;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  IndexedIvars = object_getIndexedIvars(self);
  pthread_rwlock_destroy((pthread_rwlock_t *)IndexedIvars);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSMultiReadUniWriteLock;
  -[NSMultiReadUniWriteLock dealloc](&v4, sel_dealloc);
}

- (void)lockForReading
{
  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  pthread_rwlock_rdlock(IndexedIvars);
}

- (BOOL)tryLockForReading
{
  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  return pthread_rwlock_tryrdlock(IndexedIvars) == 0;
}

- (BOOL)lockForReadingBeforeDate:(id)a3
{
  return 0;
}

- (void)lockForWriting
{
  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  pthread_rwlock_wrlock(IndexedIvars);
  IndexedIvars[1].__sig = (uint64_t)pthread_self();
}

- (BOOL)tryLockForWriting
{
  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  int v3 = pthread_rwlock_trywrlock(IndexedIvars);
  if (!v3) {
    IndexedIvars[1].__sig = (uint64_t)pthread_self();
  }
  return v3 == 0;
}

- (BOOL)lockForWritingBeforeDate:(id)a3
{
  return 0;
}

- (void)lock
{
  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  pthread_rwlock_wrlock(IndexedIvars);
  IndexedIvars[1].__sig = (uint64_t)pthread_self();
}

- (void)unlock
{
  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  sig = (_opaque_pthread_t *)IndexedIvars[1].__sig;
  objc_super v4 = pthread_self();
  if (pthread_equal(sig, v4)) {
    IndexedIvars[1].__sig = 0LL;
  }
  pthread_rwlock_unlock(IndexedIvars);
}

- (id)description
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  IndexedIvars = object_getIndexedIvars(self);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSMultiReadUniWriteLock;
  id v4 = -[NSMultiReadUniWriteLock description](&v11, sel_description);
  int v5 = pthread_equal(0LL, *((pthread_t *)IndexedIvars + 25));
  uint64_t v6 = "'";
  uint64_t v7 = *((void *)IndexedIvars + 26);
  if (!v7) {
    uint64_t v6 = "";
  }
  v8 = @"nil";
  if (v7) {
    v8 = (const __CFString *)*((void *)IndexedIvars + 26);
  }
  v9 = "NO";
  if (!v5) {
    v9 = "YES";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{locked for writing = %s, writer thread = %p, name = %s%@%s}",  v4,  v9,  *((void *)IndexedIvars + 25),  v6,  v8,  v6);
}

- (void)setName:(id)a3
{
  IndexedIvars = object_getIndexedIvars(self);
  id v5 = (id)IndexedIvars[26];
  if (v5 != a3)
  {
    uint64_t v6 = IndexedIvars;

    v6[26] = [a3 copy];
  }

- (id)name
{
  return (id)*((void *)object_getIndexedIvars(self) + 26);
}

@end