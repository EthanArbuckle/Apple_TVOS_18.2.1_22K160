@interface NSRecursiveLock
+ (NSRecursiveLock)allocWithZone:(_NSZone *)a3;
- (BOOL)isLocking;
- (BOOL)lockBeforeDate:(NSDate *)limit;
- (BOOL)tryLock;
- (NSRecursiveLock)init;
- (NSString)name;
- (id)description;
- (void)dealloc;
- (void)lock;
- (void)setName:(NSString *)name;
- (void)unlock;
@end

@implementation NSRecursiveLock

- (void)lock
{
  v3 = pthread_self();
  unint64_t v4 = self->_priv.cnt + 1;
  self->_priv.t = v3;
  self->_priv.cnt = v4;
}

- (void)unlock
{
  p_priv = &self->_priv;
  unint64_t v4 = self->_priv.cnt - 1;
  self->_priv.cnt = v4;
  if (!v4) {
    self->_priv.t = 0LL;
  }
  pthread_mutex_unlock(&p_priv->m);
  cd = self->_priv.cd;
  if (cd)
  {
    pthread_mutex_lock((pthread_mutex_t *)cd);
    pthread_cond_broadcast((pthread_cond_t *)((char *)cd + 64));
    pthread_mutex_unlock((pthread_mutex_t *)cd);
  }

+ (NSRecursiveLock)allocWithZone:(_NSZone *)a3
{
  return (NSRecursiveLock *)NSAllocateObject((Class)a1, 0x60uLL, a3);
}

- (NSRecursiveLock)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (_MergedGlobals_107 != -1) {
    dispatch_once(&_MergedGlobals_107, &__block_literal_global_24);
  }
  if (pthread_mutex_init(&self->_priv.m, &stru_18C4967D0))
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___NSRecursiveLock;
    -[NSRecursiveLock dealloc](&v4, sel_dealloc);
    return 0LL;
  }

  else
  {
    self->_priv.n = 0LL;
    self->_priv.t = 0LL;
    self->_priv.cnt = 0LL;
  }

  return self;
}

uint64_t __23__NSRecursiveLock_init__block_invoke()
{
  return pthread_mutexattr_settype(&stru_18C4967D0, 2);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  pthread_mutex_destroy(&self->_priv.m);
  cd = self->_priv.cd;
  if (cd)
  {
    pthread_cond_destroy((pthread_cond_t *)((char *)cd + 64));
    pthread_mutex_destroy((pthread_mutex_t *)cd);
    free(cd);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSRecursiveLock;
  -[NSRecursiveLock dealloc](&v4, sel_dealloc);
}

- (BOOL)lockBeforeDate:(NSDate *)limit
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  -[NSDate timeIntervalSinceReferenceDate](limit, "timeIntervalSinceReferenceDate");
  double v5 = v4;
  p_cd = (unint64_t *)&self->_priv.cd;
  cd = self->_priv.cd;
  if (!cd)
  {
    v8 = (pthread_mutex_t *)malloc(0x70uLL);
    cd = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v8;
    if (!v8) {
      goto LABEL_7;
    }
    if (!pthread_mutex_init(v8, 0LL))
    {
      pthread_mutex_destroy((pthread_mutex_t *)cd);
    }

    free(cd);
    cd = 0LL;
LABEL_7:
    while (!__ldaxr(p_cd))
    {
    }

    __clrex();
    pthread_cond_destroy((pthread_cond_t *)((char *)cd + 64));
    pthread_mutex_destroy((pthread_mutex_t *)cd);
    free(cd);
    cd = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_cd;
  }

- (BOOL)tryLock
{
  int v3 = pthread_mutex_trylock(&self->_priv.m);
  if (!v3)
  {
    double v4 = pthread_self();
    unint64_t v5 = self->_priv.cnt + 1;
    self->_priv.t = v4;
    self->_priv.cnt = v5;
  }

  return v3 == 0;
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSRecursiveLock;
  id v3 = -[NSRecursiveLock description](&v8, sel_description);
  double v4 = "'";
  n = self->_priv.n;
  if (!n) {
    double v4 = "";
  }
  v6 = (NSString *)@"nil";
  if (n) {
    v6 = self->_priv.n;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{recursion count = %ld, name = %s%@%s}",  v3,  self->_priv.cnt,  v4,  v6,  v4);
}

- (void)setName:(NSString *)name
{
  n = self->_priv.n;
  if (n != name)
  {

    self->_priv.n = (NSString *)-[NSString copy](name, "copy");
  }

- (NSString)name
{
  return self->_priv.n;
}

- (BOOL)isLocking
{
  if (pthread_equal(0LL, self->_priv.t)) {
    return 0;
  }
  double v4 = pthread_self();
  return pthread_equal(v4, self->_priv.t) != 0;
}

@end