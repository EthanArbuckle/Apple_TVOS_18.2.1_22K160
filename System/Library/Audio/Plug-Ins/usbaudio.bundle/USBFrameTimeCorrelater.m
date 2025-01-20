@interface USBFrameTimeCorrelater
- (BOOL)start;
- (USBFrameTimeCorrelater)initWithIOUSBHostObject:(id)a3;
- (USBFrameTimeCorrelaterStatistics)getStatistics;
- (id).cxx_construct;
- (unint64_t)timeforUSBFrame:(unint64_t)a3;
- (unint64_t)updateTimes;
- (unint64_t)updateTimesWithRetries:(int)a3;
- (void)dealloc;
- (void)stop;
@end

@implementation USBFrameTimeCorrelater

- (USBFrameTimeCorrelater)initWithIOUSBHostObject:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&qword_100117320);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_100117320))
  {
    mach_timebase_info(&info);
    qword_100117318 = (uint64_t)info;
    __cxa_guard_release(&qword_100117320);
  }

  if ((_DWORD)qword_100117318 == HIDWORD(qword_100117318)) {
    unint64_t v7 = 40000LL;
  }
  else {
    unint64_t v7 = 40000 * (unint64_t)HIDWORD(qword_100117318) / qword_100117318;
  }
  self->_kPreemptionLimitMach = v7;
  objc_storeStrong((id *)&self->_usbHostObject, a3);
  v8 = objc_alloc_init(&OBJC_CLASS___AUAPeriodicEventRT);
  timer = self->_timer;
  self->_timer = v8;

  self->_started = 0;
  *(void *)&self->_startLock._os_unfair_lock_opaque = 0LL;
  *(_OWORD *)&self->_wakeOffsetMachCurrent = 0u;
  *(_OWORD *)&self->_wakeErrorMachMax = 0u;
  *(_OWORD *)&self->_preemptedTimeMachMax = 0u;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___USBFrameTimeCorrelater;
  v10 = -[USBFrameTimeCorrelater init](&v12, "init");

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___USBFrameTimeCorrelater;
  -[USBFrameTimeCorrelater dealloc](&v3, "dealloc");
}

- (USBFrameTimeCorrelaterStatistics)getStatistics
{
  unint64_t wakeOffsetMachCurrent = self->_wakeOffsetMachCurrent;
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)qword_100117330);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(qword_100117330))
  {
    mach_timebase_info((mach_timebase_info_t)&info);
    qword_100117328 = info.n128_u64[0];
    __cxa_guard_release(qword_100117330);
  }

  if ((_DWORD)qword_100117328 != HIDWORD(qword_100117328)) {
    unint64_t wakeOffsetMachCurrent = wakeOffsetMachCurrent * qword_100117328 / HIDWORD(qword_100117328);
  }
  retstr->var1 = wakeOffsetMachCurrent;
  unint64_t wakeOffsetMachPrevious = self->_wakeOffsetMachPrevious;
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)qword_100117330);
  if ((v8 & 1) == 0 && __cxa_guard_acquire(qword_100117330))
  {
    mach_timebase_info((mach_timebase_info_t)&info);
    qword_100117328 = info.n128_u64[0];
    __cxa_guard_release(qword_100117330);
  }

  if ((_DWORD)qword_100117328 != HIDWORD(qword_100117328)) {
    unint64_t wakeOffsetMachPrevious = wakeOffsetMachPrevious * qword_100117328 / HIDWORD(qword_100117328);
  }
  retstr->var2 = wakeOffsetMachPrevious;
  sub_100003A04((uint64_t)&self->_tc.timePairs.mSlots.__elems_[1], &info);
  retstr->var0 = v17;
  unint64_t wakeErrorMachMax = self->_wakeErrorMachMax;
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)qword_100117330);
  if ((v11 & 1) == 0)
  {
    result = (USBFrameTimeCorrelaterStatistics *)__cxa_guard_acquire(qword_100117330);
    if ((_DWORD)result)
    {
      mach_timebase_info((mach_timebase_info_t)&info);
      qword_100117328 = info.n128_u64[0];
      __cxa_guard_release(qword_100117330);
    }
  }

  if ((_DWORD)qword_100117328 != HIDWORD(qword_100117328)) {
    unint64_t wakeErrorMachMax = wakeErrorMachMax * qword_100117328 / HIDWORD(qword_100117328);
  }
  retstr->var3 = wakeErrorMachMax;
  unint64_t measurementDurationMachMax = self->_measurementDurationMachMax;
  unsigned __int8 v13 = atomic_load((unsigned __int8 *)qword_100117330);
  if ((v13 & 1) == 0)
  {
    result = (USBFrameTimeCorrelaterStatistics *)__cxa_guard_acquire(qword_100117330);
    if ((_DWORD)result)
    {
      mach_timebase_info((mach_timebase_info_t)&info);
      qword_100117328 = info.n128_u64[0];
      __cxa_guard_release(qword_100117330);
    }
  }

  if ((_DWORD)qword_100117328 != HIDWORD(qword_100117328)) {
    unint64_t measurementDurationMachMax = measurementDurationMachMax * qword_100117328 / HIDWORD(qword_100117328);
  }
  retstr->var4 = measurementDurationMachMax;
  unint64_t preemptedTimeMachMax = self->_preemptedTimeMachMax;
  unsigned __int8 v15 = atomic_load((unsigned __int8 *)qword_100117330);
  if ((v15 & 1) == 0)
  {
    result = (USBFrameTimeCorrelaterStatistics *)__cxa_guard_acquire(qword_100117330);
    if ((_DWORD)result)
    {
      mach_timebase_info((mach_timebase_info_t)&info);
      qword_100117328 = info.n128_u64[0];
      __cxa_guard_release(qword_100117330);
    }
  }

  if ((_DWORD)qword_100117328 != HIDWORD(qword_100117328)) {
    unint64_t preemptedTimeMachMax = preemptedTimeMachMax * qword_100117328 / HIDWORD(qword_100117328);
  }
  retstr->var5 = preemptedTimeMachMax;
  *(void *)&retstr->var6 = *(void *)&self->_failedMeasurementCount;
  *(_OWORD *)&self->_unint64_t wakeErrorMachMax = 0u;
  *(_OWORD *)&self->_unint64_t preemptedTimeMachMax = 0u;
  return result;
}

- (BOOL)start
{
  p_startLock = &self->_startLock;
  os_unfair_lock_lock(&self->_startLock);
  ++self->_startCount;
  if (self->_started)
  {
    BOOL started = 1;
  }

  else
  {
    NSLog(@"USBFrameTimeCorrelater starting");
    self->_tc.machPerFrameFilter.index = 0LL;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[14] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.sum = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[10] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[12] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[6] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[8] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[2] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[4] = 0u;
    *(_OWORD *)self->_tc.machPerFrameFilter.values = 0u;
    atomic_store(0, (unsigned int *)&self->_tc.timePairs.mSlots.__elems_[1].mGenerationAndValid + 1);
    atomic_store(0, &self->_tc.timePairs.mSlots.__elems_[3].mGenerationAndValid.__a_.__a_value);
    atomic_store(0, (unsigned int *)&self->_anon_160[32]);
    atomic_store(0, (unsigned int *)&self->_anon_160[96]);
    atomic_store(0, (unsigned int *)&self->_anon_160[160]);
    atomic_store(0, (unsigned __int8 *)&self->_tc.timePairs.mSlots.__elems_[1]);
    unint64_t v5 = -[USBFrameTimeCorrelater updateTimesWithRetries:](self, "updateTimesWithRetries:", 10LL);
    self->_BOOL started = v5 != 0;
    if (v5)
    {
      v18[0] = 0LL;
      v18[1] = v18;
      v18[2] = 0x2020000000LL;
      v18[3] = qword_1001172F8 + mach_absolute_time();
      v17[0] = 0LL;
      v17[1] = v17;
      v17[2] = 0x2020000000LL;
      v17[3] = qword_100117308;
      v16[0] = 0LL;
      v16[1] = v16;
      v16[2] = 0x5812000000LL;
      v16[3] = sub_1000031B4;
      v16[4] = nullsub_1;
      v16[5] = &unk_1000DD1FD;
      v16[6] = qword_100117308;
      v16[7] = qword_100117308;
      v16[8] = qword_100117308;
      v16[9] = qword_100117308;
      v16[10] = 0LL;
      v15[0] = 0LL;
      v15[1] = v15;
      v15[2] = 0x2020000000LL;
      v15[3] = 0LL;
      v13[0] = 0LL;
      v13[1] = v13;
      v13[2] = 0x2020000000LL;
      char v14 = 0;
      objc_initWeak(&location, self);
      timer = self->_timer;
      uint64_t v7 = qword_1001172F8;
      uint64_t v8 = qword_100117310;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1000031CC;
      v10[3] = &unk_1000FD7F0;
      v10[4] = v15;
      objc_copyWeak(&v11, &location);
      v10[5] = v18;
      v10[6] = v13;
      v10[7] = v17;
      v10[8] = v16;
      -[AUAPeriodicEventRT start:maxPeriodMach:eventHandler:](timer, "start:maxPeriodMach:eventHandler:", v7, v8, v10);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
      _Block_object_dispose(v13, 8);
      _Block_object_dispose(v15, 8);
      _Block_object_dispose(v16, 8);
      _Block_object_dispose(v17, 8);
      _Block_object_dispose(v18, 8);
      BOOL started = self->_started;
    }

    else
    {
      BOOL started = 0;
    }
  }

  os_unfair_lock_unlock(p_startLock);
  return started;
}

- (void)stop
{
  p_startLock = &self->_startLock;
  os_unfair_lock_lock(&self->_startLock);
  int startCount = self->_startCount;
  if (startCount <= 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2 object:self file:@"USBFrameTimeCorrelater.mm" lineNumber:387 description:@"USBFrameTimeCorrelater stop called without first being started"];

    int v8 = self->_startCount - 1;
    self->_int startCount = v8;
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    int v6 = startCount - 1;
    self->_int startCount = v6;
    if (v6)
    {
LABEL_3:
      os_unfair_lock_unlock(p_startLock);
      return;
    }
  }

  if (!self->_started) {
    goto LABEL_3;
  }
  NSLog(@"USBFrameTimeCorrelater stopping");
  self->_BOOL started = 0;
  -[AUAPeriodicEventRT stop](self->_timer, "stop");
  os_unfair_lock_unlock(p_startLock);
}

- (unint64_t)timeforUSBFrame:(unint64_t)a3
{
  return v5.n128_u64[1] + (uint64_t)(v6 * (double)(uint64_t)(a3 - v5.n128_u64[0]));
}

- (unint64_t)updateTimesWithRetries:(int)a3
{
  int v4 = (a3 & ~(a3 >> 31)) + 1;
  while (--v4)
  {
    unint64_t result = -[USBFrameTimeCorrelater updateTimes](self, "updateTimes");
    if (result) {
      return result;
    }
  }

  return 0LL;
}

- (unint64_t)updateTimes
{
  __int128 v13 = 0uLL;
  uint64_t v14 = qword_1001172F0;
  __int128 v11 = 0uLL;
  uint64_t v12 = qword_1001172F0;
  objc_super v3 = self->_usbHostObject;
  *(void *)&__int128 v13 = -[IOUSBHostObject frameNumberWithTime:](v3, "frameNumberWithTime:", (char *)&v13 + 8);
  mach_absolute_time();
  __int128 v4 = v13;

  if ((void)v4 && *((void *)&v4 + 1))
  {
    while (1)
    {
      __n128 v5 = self->_usbHostObject;
      *(void *)&__int128 v11 = -[IOUSBHostObject frameNumberWithTime:](v5, "frameNumberWithTime:", (char *)&v11 + 8);
      uint64_t v6 = mach_absolute_time();
      __int128 v7 = v11;

      if (!(void)v7 || !*((void *)&v7 + 1)) {
        break;
      }
      if ((void)v11 - (void)v13 > 1uLL) {
        return 0LL;
      }
      if ((void)v11 - (void)v13 == 1LL)
      {
        unint64_t v9 = v6 - *((void *)&v13 + 1);
        unint64_t preemptedTimeMachMax = self->_preemptedTimeMachMax;
        if (v6 - *((void *)&v13 + 1) > preemptedTimeMachMax) {
          unint64_t preemptedTimeMachMax = v6 - *((void *)&v13 + 1);
        }
        self->_unint64_t preemptedTimeMachMax = preemptedTimeMachMax;
        if (v9 <= self->_kPreemptionLimitMach)
        {
          *((void *)&v11 + 1) = v6 - (v9 >> 1);
          sub_100003768((uint64_t)&self->_tc, (double *)&v11);
          return *((void *)&v13 + 1);
        }

        return 0LL;
      }

      __int128 v13 = v11;
      uint64_t v14 = v12;
    }
  }

  NSLog(@"USBFrameTimeCorrelater updateTimes failed to read time pair, frame == 0 device terminated?");
  return 0LL;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 26) = 0LL;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_BYTE *)self + 256) = 0;
  *((_DWORD *)self + 65) = 0;
  uint64_t v2 = qword_1001172F0;
  *((_DWORD *)self + 80) = 0;
  *(_OWORD *)((char *)self + 328) = 0u;
  *((void *)self + 43) = v2;
  *((_DWORD *)self + 96) = 0;
  *(_OWORD *)((char *)self + 392) = 0u;
  *((void *)self + 51) = v2;
  *((_DWORD *)self + 112) = 0;
  *(_OWORD *)((char *)self + 456) = 0u;
  *((void *)self + 59) = v2;
  *((_DWORD *)self + 128) = 0;
  *(_OWORD *)((char *)self + 520) = 0u;
  *((void *)self + 67) = v2;
  return self;
}

@end