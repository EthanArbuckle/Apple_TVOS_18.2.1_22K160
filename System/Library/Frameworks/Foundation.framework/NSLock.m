@interface NSLock
- (BOOL)lockBeforeDate:(NSDate *)limit;
- (BOOL)tryLock;
- (NSLock)init;
- (NSString)name;
- (id)description;
- (void)dealloc;
- (void)lock;
- (void)setName:(NSString *)name;
- (void)unlock;
@end

@implementation NSLock

- (NSLock)init
{
  v2 = self;
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (pthread_mutex_init(&self->_priv.m, 0LL))
  {
    v4.receiver = v2;
    v4.super_class = (Class)&OBJC_CLASS___NSLock;
    -[NSLock dealloc](&v4, sel_dealloc);
    return 0LL;
  }

  else
  {
    v2->_priv.n = 0LL;
  }

  return v2;
}

- (void)lock
{
}

- (void)unlock
{
  cd = self->_priv.cd;
  if (cd)
  {
    pthread_mutex_lock((pthread_mutex_t *)cd);
    pthread_cond_broadcast((pthread_cond_t *)((char *)cd + 64));
    pthread_mutex_unlock((pthread_mutex_t *)cd);
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
  v4.super_class = (Class)&OBJC_CLASS___NSLock;
  -[NSLock dealloc](&v4, sel_dealloc);
}

- (BOOL)lockBeforeDate:(NSDate *)limit
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  -[NSDate timeIntervalSinceReferenceDate](limit, "timeIntervalSinceReferenceDate");
  double v5 = v4;
  cd = self->_priv.cd;
  p_cd = (unint64_t *)&self->_priv.cd;
  unint64_t v6 = (unint64_t)cd;
  v9 = (pthread_mutex_t *)(p_cd - 8);
  if (!cd)
  {
    v10 = (pthread_mutex_t *)malloc(0x70uLL);
    unint64_t v6 = (unint64_t)v10;
    if (!v10) {
      goto LABEL_7;
    }
    if (!pthread_mutex_init(v10, 0LL))
    {
      if (!pthread_cond_init((pthread_cond_t *)(v6 + 64), 0LL)) {
        goto LABEL_7;
      }
      pthread_mutex_destroy((pthread_mutex_t *)v6);
    }

    free((void *)v6);
    unint64_t v6 = 0LL;
LABEL_7:
    while (!__ldaxr(p_cd))
    {
      if (!__stlxr(v6, p_cd)) {
        goto LABEL_11;
      }
    }

    __clrex();
    pthread_cond_destroy((pthread_cond_t *)(v6 + 64));
    pthread_mutex_destroy((pthread_mutex_t *)v6);
    free((void *)v6);
    unint64_t v6 = *p_cd;
  }

- (BOOL)tryLock
{
  return pthread_mutex_trylock(&self->_priv.m) == 0;
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSLock;
  id v3 = -[NSLock description](&v8, sel_description);
  double v4 = "'";
  n = self->_priv.n;
  if (!n) {
    double v4 = "";
  }
  unint64_t v6 = (NSString *)@"nil";
  if (n) {
    unint64_t v6 = self->_priv.n;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{name = %s%@%s}",  v3,  v4,  v6,  v4);
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

@end