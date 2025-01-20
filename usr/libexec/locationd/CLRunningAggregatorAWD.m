@interface CLRunningAggregatorAWD
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetCompanionOnlyNoGPSRun;
- (CLRunningAggregatorAWD)init;
- (id).cxx_construct;
- (id)onStepNotification:(int)a3 data:(uint64_t)a4;
- (void)ageOutStepArray;
- (void)beginService;
- (void)checkForRunningThreshold;
- (void)clearStepArray;
- (void)endService;
- (void)updateSession:(int64_t)a3;
@end

@implementation CLRunningAggregatorAWD

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199A3A8 != -1) {
    dispatch_once(&qword_10199A3A8, &stru_10186A6D8);
  }
  return (id)qword_10199A3A0;
}

- (CLRunningAggregatorAWD)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLRunningAggregatorAWD;
  return -[CLRunningAggregatorAWD initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLRunningAggregatorAWDServiceProtocol,  &OBJC_PROTOCOL___CLRunningAggregatorAWDClientProtocol);
}

+ (BOOL)isSupported
{
  return sub_1004F7000();
}

- (void)beginService
{
  self->fHasRun = 0;
  self->fInSession = 0;
  value = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  sub_1004F2598();
  if (sub_1004F7500()
    && objc_msgSend( objc_msgSend(-[CLRunningAggregatorAWD universe](self, "universe"), "vendor"),  "isServiceEnabled:",  @"CLStepCountNotifier"))
  {
    sub_101037234((uint64_t)sub_100A6E4D4, (uint64_t)self, -[CLRunningAggregatorAWD universe](self, "universe"), &v7);
    v4 = v7;
    v7 = 0LL;
    unint64_t v5 = self->fStepCountClient.__ptr_.__value_;
    self->fStepCountClient.__ptr_.__value_ = v4;
    if (v5)
    {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
      v6 = v7;
      v7 = 0LL;
      if (v6) {
        (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
      }
    }

    [*((id *)self->fStepCountClient.__ptr_.__value_ + 2) register:*((void *)self->fStepCountClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  }

- (void)endService
{
  value = self->fStepCountClient.__ptr_.__value_;
  if (value)
  {
    self->fStepCountClient.__ptr_.__value_ = 0LL;
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }

- (BOOL)syncgetCompanionOnlyNoGPSRun
{
  BOOL fHasRun = self->fHasRun;
  self->BOOL fHasRun = 0;
  return fHasRun;
}

- (id)onStepNotification:(int)a3 data:(uint64_t)a4
{
  id result = objc_msgSend(objc_msgSend((id)a1, "universe"), "silo");
  if (!a3 && !*(_BYTE *)(a1 + 8))
  {
    if (*(_BYTE *)(a1 + 9) || *(_BYTE *)(a4 + 112)) {
      [(id)a1 clearStepArray];
    }
    else {
      sub_100A6E628((void *)(a1 + 16), (void *)(a4 + 8), (void *)(a4 + 80));
    }
    [(id)a1 ageOutStepArray];
    return _[(id)a1 checkForRunningThreshold];
  }

  return result;
}

- (void)updateSession:(int64_t)a3
{
  self->fInSession = a3 != 0;
}

- (void)ageOutStepArray
{
  double Current = CFAbsoluteTimeGetCurrent();
  p_fStepWindow = &self->fStepWindow;
  unint64_t value = p_fStepWindow->__size_.__value_;
  if (value)
  {
    double v6 = Current;
    do
    {
      unint64_t start = p_fStepWindow->__start_;
      if (v6 {
      p_fStepWindow->__start_ = start + 1;
      }
      p_fStepWindow->__size_.__value_ = value - 1;
      sub_100232D40((uint64_t)p_fStepWindow, 1);
      unint64_t value = p_fStepWindow->__size_.__value_;
    }

    while (value);
  }

- (void)clearStepArray
{
  p_fStepWindow = &self->fStepWindow;
  begin = self->fStepWindow.__map_.__begin_;
  end = self->fStepWindow.__map_.__end_;
  self->fStepWindow.__size_.__value_ = 0LL;
  unint64_t v5 = (char *)end - (char *)begin;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*begin);
      double v6 = p_fStepWindow->__map_.__end_;
      begin = p_fStepWindow->__map_.__begin_ + 1;
      p_fStepWindow->__map_.__begin_ = begin;
      unint64_t v5 = (char *)v6 - (char *)begin;
    }

    while (v5 > 0x10);
  }

  if (v5 >> 3 == 1)
  {
    uint64_t v7 = 128LL;
  }

  else
  {
    if (v5 >> 3 != 2) {
      return;
    }
    uint64_t v7 = 256LL;
  }

  p_fStepWindow->__start_ = v7;
}

- (void)checkForRunningThreshold
{
  p_fStepWindow = &self->fStepWindow;
  unint64_t start = self->fStepWindow.__start_;
  begin = self->fStepWindow.__map_.__begin_;
  end = self->fStepWindow.__map_.__end_;
  uint64_t v7 = &begin[start >> 8];
  if (end == begin) {
    v8 = 0LL;
  }
  else {
    v8 = (double *)((char *)*v7 + 16 * start);
  }
  double v9 = 0.0;
  while (1)
  {
    unint64_t v10 = start + p_fStepWindow->__size_.__value_;
    v11 = &begin[v10 >> 8];
    uint64_t v12 = end == begin ? 0LL : (uint64_t)*v11 + 16 * v10;
    if (v8[1] >= 2.33333333)
    {
      v13 = *v11;
      uint64_t v14 = (uint64_t)*v11 + 16 * v10;
      if (end == begin) {
        uint64_t v15 = 0LL;
      }
      else {
        uint64_t v15 = v14;
      }
      uint64_t v16 = v15 - (void)v13;
      uint64_t v17 = (v15 - (uint64_t)v13) >> 4;
      if (v16 < 17) {
        uint64_t v18 = (uint64_t)v11[-((unint64_t)(256 - v17) >> 8)] + 16 * (v17 - 1);
      }
      else {
      if (v8 == (double *)v18)
      {
        double Current = CFAbsoluteTimeGetCurrent();
      }

      else
      {
        uint64_t v19 = (char *)v8 - (_BYTE *)*v7;
        uint64_t v20 = v19 >> 4;
        if (v19 < -15) {
          v21 = (double *)((char *)v7[-((unint64_t)(254 - v20) >> 8)] + 16 * ~(-2 - v20));
        }
        else {
        double Current = *v21;
        }
      }

      double v9 = v9 + Current - *v8;
    }

    v8 += 2;
    if ((char *)v8 - (_BYTE *)*v7 == 4096)
    {
      v23 = (double *)v7[1];
      ++v7;
      v8 = v23;
    }

    unint64_t start = p_fStepWindow->__start_;
    begin = p_fStepWindow->__map_.__begin_;
    end = p_fStepWindow->__map_.__end_;
  }

  if (v9 >= 600.0) {
    self->BOOL fHasRun = 1;
  }
}

- (void).cxx_destruct
{
  unint64_t value = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  sub_100231C10(&self->fStepWindow.__map_.__first_);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0LL;
  return self;
}

@end