@interface CDResult
- (BOOL)finished;
- (BOOL)isFinished;
- (BOOL)success;
- (BOOL)timedOut;
- (CDResult)init;
- (double)duration;
- (unint64_t)monotonicBegin;
- (unint64_t)monotonicEnd;
- (void)finish;
- (void)setFinished:(BOOL)a3;
- (void)setMonotonicEnd:(unint64_t)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTimedOut:(BOOL)a3;
@end

@implementation CDResult

- (CDResult)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CDResult;
  v2 = -[CDResult init](&v4, "init");
  if (v2) {
    v2->_monotonicBegin = mach_absolute_time();
  }
  return v2;
}

- (void)finish
{
}

- (double)duration
{
  if (!-[CDResult finished](self, "finished")) {
    return INFINITY;
  }
  unint64_t v3 = -[CDResult monotonicBegin](self, "monotonicBegin");
  unint64_t v4 = -[CDResult monotonicEnd](self, "monotonicEnd");
  if (_MergedGlobals_12 != -1) {
    dispatch_once(&_MergedGlobals_12, &__block_literal_global_2);
  }
  return (double)((v4 - v3) * dword_1000667B8 / *(unsigned int *)algn_1000667BC) / 1000000000.0;
}

- (unint64_t)monotonicBegin
{
  return self->_monotonicBegin;
}

- (unint64_t)monotonicEnd
{
  return self->_monotonicEnd;
}

- (void)setMonotonicEnd:(unint64_t)a3
{
  self->_monotonicEnd = a3;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

@end