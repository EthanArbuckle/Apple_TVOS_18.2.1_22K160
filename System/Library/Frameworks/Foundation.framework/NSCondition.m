@interface NSCondition
- (BOOL)waitUntilDate:(NSDate *)limit;
- (NSCondition)init;
- (NSString)name;
- (id)description;
- (void)broadcast;
- (void)dealloc;
- (void)lock;
- (void)setName:(NSString *)name;
- (void)signal;
- (void)unlock;
- (void)wait;
@end

@implementation NSCondition

- (NSCondition)init
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCondition;
  v2 = -[NSCondition init](&v5, sel_init);
  if (pthread_mutex_init(&v2->m, 0LL))
  {
    v4.receiver = v2;
    v4.super_class = (Class)&OBJC_CLASS___NSCondition;
    -[NSCondition dealloc](&v4, sel_dealloc);
    return 0LL;
  }

  else
  {
    pthread_cond_init(&v2->c, 0LL);
    v2->n = 0LL;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  pthread_mutex_destroy(&self->m);
  pthread_cond_destroy(&self->c);

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCondition;
  -[NSCondition dealloc](&v3, sel_dealloc);
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)wait
{
}

- (BOOL)waitUntilDate:(NSDate *)limit
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  -[NSDate timeIntervalSinceReferenceDate](limit, "timeIntervalSinceReferenceDate");
  double v5 = v4 - CFAbsoluteTimeGetCurrent();
  if (v5 < 0.0) {
    return 0;
  }
  v7.tv_sec = vcvtmd_s64_f64(v5);
  v7.tv_nsec = (int)((v5 - floor(v5)) * 1000000000.0);
  return pthread_cond_timedwait_relative_np(&self->c, &self->m, &v7) == 0;
}

- (void)signal
{
}

- (void)broadcast
{
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSCondition;
  id v3 = -[NSCondition description](&v8, sel_description);
  double v4 = "'";
  n = self->n;
  if (!n) {
    double v4 = "";
  }
  uint64_t v6 = (NSString *)@"nil";
  if (n) {
    uint64_t v6 = self->n;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{name = %s%@%s}",  v3,  v4,  v6,  v4);
}

- (void)setName:(NSString *)name
{
  n = self->n;
  if (n != name)
  {

    self->n = (NSString *)-[NSString copy](name, "copy");
  }

- (NSString)name
{
  return self->n;
}

@end