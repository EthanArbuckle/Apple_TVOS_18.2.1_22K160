@interface ATSACCAClockDevice
- (ATSACCAClockDevice)initWithClockIdentifier:(unint64_t)a3 withPlugin:(id)a4;
- (ATSACCAClockDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4;
- (BOOL)changeSamplingRate:(double)a3;
- (id).cxx_construct;
- (int)performStartIO;
- (int)performStopIO;
- (int64_t)referenceCount;
- (unint64_t)clockIdentifier;
- (void)dealloc;
- (void)didBeginClockGrandmasterChangeForClock:(id)a3;
- (void)didChangeClockMasterForClock:(id)a3;
- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4;
- (void)didEndClockGrandmasterChangeForClock:(id)a3;
- (void)initializeFirstTimestamp:(id)a3;
- (void)setReferenceCount:(int64_t)a3;
@end

@implementation ATSACCAClockDevice

- (ATSACCAClockDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[ATSACCAClockDevice initWithDeviceUID:withPlugin:]",  a4));
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Do not call %@",  v5);

  return 0LL;
}

- (ATSACCAClockDevice)initWithClockIdentifier:(unint64_t)a3 withPlugin:(id)a4
{
  id v6 = a4;
  if (TSNullClockIdentifier != a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSClockManager timeSyncAudioClockDeviceUIDForClockIdentifier:]( &OBJC_CLASS___TSClockManager,  "timeSyncAudioClockDeviceUIDForClockIdentifier:",  a3));
    v48.receiver = self;
    v48.super_class = (Class)&OBJC_CLASS___ATSACCAClockDevice;
    v9 = -[ATSACCAClockDevice initWithDeviceUID:withPlugin:](&v48, "initWithDeviceUID:withPlugin:", v8, v6);
    v7 = v9;
    if (!v9)
    {
LABEL_19:

      goto LABEL_20;
    }

    v9->_clockIdentifier = a3;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.AppleTimeSyncAudioClock.%@.%@.workloop", v12, v8));
    dispatch_workloop_t inactive = dispatch_workloop_create_inactive((const char *)[v13 UTF8String]);

    dispatch_workloop_set_scheduler_priority(inactive, 63LL, 1LL);
    dispatch_activate(inactive);
    initially_dispatch_workloop_t inactive = dispatch_queue_attr_make_initially_inactive(0LL);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(initially_inactive);
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INTERACTIVE, 0);
    attr = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);

    v18 = (objc_class *)objc_opt_class(v7);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    id v21 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.AppleTimeSyncAudioClock.%@.%@.timer", v20, v8));
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], attr);
    timerQueue = v7->_timerQueue;
    v7->_timerQueue = (OS_dispatch_queue *)v22;

    dispatch_set_target_queue((dispatch_object_t)v7->_timerQueue, inactive);
    dispatch_activate((dispatch_object_t)v7->_timerQueue);
    v24 = (objc_class *)objc_opt_class(v7);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    id v27 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.AppleTimeSyncAudioClock.%@.%@.logging", v26, v8));
    dispatch_queue_t v28 = dispatch_queue_create((const char *)[v27 UTF8String], 0);
    loggingQueue = v7->_loggingQueue;
    v7->_loggingQueue = (OS_dispatch_queue *)v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TimeSync Clock 0x%016llx",  a3));
    -[ATSACCAClockDevice setDeviceName:](v7, "setDeviceName:", v30);

    -[ATSACCAClockDevice setManufacturerName:](v7, "setManufacturerName:", @"Apple Inc.");
    -[ATSACCAClockDevice setModelName:](v7, "setModelName:", @"TimeSync Audio Clock");
    -[ATSACCAClockDevice setModelUID:](v7, "setModelUID:", @"ATSAC:TimeSyncClockDevice");
    -[ATSACCAClockDevice setCanChangeDeviceName:](v7, "setCanChangeDeviceName:", 0LL);
    -[ATSACCAClockDevice setTransportType:](v7, "setTransportType:", 1635017059LL);
    -[ATSACCAClockDevice setSamplingRates:](v7, "setSamplingRates:", &off_C9C0);
    -[ATSACCAClockDevice setSamplingRate:](v7, "setSamplingRate:", 48000.0);
    -[ATSACCAClockDevice samplingRate](v7, "samplingRate");
    -[ATSACCAClockDevice setTimestampPeriod:](v7, "setTimestampPeriod:", (v31 * 260.0 / 1000.0));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
    id v46 = 0LL;
    unsigned int v33 = [v32 addMappingFromClockID:a3 toCoreAudioClockDomain:&v47 error:&v46];
    id v34 = v46;

    if (v33)
    {
      uint64_t v35 = v47;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Could not create mapping between clock identifier and CoreAudio clock domain\n",  buf,  2u);
      }

      uint64_t v35 = 0LL;
      unsigned int v47 = 0;
    }

    -[ATSACCAClockDevice setClockDomain:](v7, "setClockDomain:", v35);
    v36 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.audio.AppleTimeSyncAudioClock");
    -[NSUserDefaults registerDefaults:](v36, "registerDefaults:", &off_C9D8);
    -[ATSACCAClockDevice setClockIsStable:]( v7,  "setClockIsStable:",  -[NSUserDefaults BOOLForKey:](v36, "BOOLForKey:", @"ClockIsStable"));
    if (-[NSUserDefaults BOOLForKey:](v36, "BOOLForKey:", @"ClockUsesRawAlgorithm")) {
      -[ATSACCAClockDevice setClockAlgorithm:](v7, "setClockAlgorithm:", 1918990199LL);
    }
    v37 = objc_alloc(&OBJC_CLASS___TSIntervalFilter);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
    v39 = -[TSIntervalFilter initWithExpectedInterval:multiIntervalCount:filterSize:]( v37,  "initWithExpectedInterval:multiIntervalCount:filterSize:",  [v38 machAbsoluteNanosecondsToTicks:260000000],  1,  6);
    intervalFilter = v7->_intervalFilter;
    v7->_intervalFilter = v39;

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_5498;
    v45[3] = &unk_C478;
    v45[4] = &v7->_timestamp;
    -[ATSACCAClockDevice setGetZeroTimestampBlock:](v7, "setGetZeroTimestampBlock:", v45);
    v44 = 0LL;
    if (os_parse_boot_arg_int("timesync_atsac_async", &v44))
    {
      if (v44 == (_BYTE *)&dword_0 + 1)
      {
        v7->_forceOutOfSync = 1;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[ATSACCAClockDevice deviceUID](v7, "deviceUID"));
          *(_DWORD *)buf = 138412290;
          v50 = v41;
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Forcing audio clock device %@ to local clock due to timesync_atsac_async boot-arg set to 1",  buf,  0xCu);
        }

        goto LABEL_18;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v50 = v44;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "timesync_atsac_async boot-arg set to %lld, ignoring",  buf,  0xCu);
      }
    }

    v7->_forceOutOfSync = 0;
LABEL_18:

    goto LABEL_19;
  }

  v7 = 0LL;
LABEL_20:

  return v7;
}

- (int)performStartIO
{
  self->_hasLastTimestamp = 0;
  if (self->_forceOutOfSync)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Starting clock IO, forced out of sync due to boot-arg",  buf,  2u);
    }

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
    v4 = (TSClock *)objc_claimAutoreleasedReturnValue([v3 timeSyncClock]);
    clock = self->_clock;
    self->_clock = v4;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
    v7 = (TSClock *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "clockWithClockIdentifier:",  -[ATSACCAClockDevice clockIdentifier](self, "clockIdentifier")));
    v8 = self->_clock;
    self->_clock = v7;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = -[ATSACCAClockDevice clockIdentifier](self, "clockIdentifier");
    *(_DWORD *)buf = 134217984;
    unint64_t v41 = v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%016llx: starting IO\n", buf, 0xCu);
  }

  v10 = self->_clock;
  if (!v10) {
    return 1937010544;
  }
  -[TSClock addClient:](v10, "addClient:", self);
  intervalFilter = self->_intervalFilter;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
  -[TSIntervalFilter resetFilterWithNewExpectedInterval:]( intervalFilter,  "resetFilterWithNewExpectedInterval:",  [v12 machAbsoluteNanosecondsToTicks:260000000]);

  dispatch_source_t v13 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  1uLL,  (dispatch_queue_t)self->_timerQueue);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
  id v15 = [v14 machAbsoluteNanosecondsToTicks:30000000];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_59FC;
  handler[3] = &unk_C568;
  handler[4] = self;
  v16 = v13;
  __int128 v38 = xmmword_A210;
  v37 = v16;
  id v39 = v15;
  dispatch_source_set_event_handler(v16, handler);
  dispatch_queue_attr_t v17 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  startSemaphore = self->_startSemaphore;
  self->_startSemaphore = v17;

  p_timerSource = &self->_timerSource;
  objc_storeStrong((id *)&self->_timerSource, v13);
  timerQueue = self->_timerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_6890;
  block[3] = &unk_C590;
  block[4] = self;
  id v21 = v16;
  uint64_t v35 = v21;
  dispatch_async((dispatch_queue_t)timerQueue, block);
  dispatch_queue_t v22 = self->_startSemaphore;
  dispatch_time_t v23 = dispatch_time(0LL, 4000000000LL);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v22, v23))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v24 = -[ATSACCAClockDevice clockIdentifier](self, "clockIdentifier");
      *(_DWORD *)buf = 134217984;
      unint64_t v41 = v24;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%016llx: Failed to start the timer running, took too long to lock the clock.\n",  buf,  0xCu);
    }

    -[TSClock removeClient:](self->_clock, "removeClient:", self);
    dispatch_source_set_event_handler((dispatch_source_t)*p_timerSource, 0LL);
    dispatch_source_t v25 = (dispatch_source_t)*p_timerSource;
    *p_timerSource = 0LL;

    v26 = self->_timerQueue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_6900;
    v32[3] = &unk_C5B8;
    v32[4] = self;
    dispatch_sync((dispatch_queue_t)v26, v32);
    id v27 = self->_clock;
    self->_clock = 0LL;

    self->_lastLockState = 0;
    dispatch_source_set_event_handler(v21, &stru_C5D8);
    dispatch_resume(v21);
    int v28 = 2003329396;
  }

  else
  {
    dispatch_resume(v21);
    v33.receiver = self;
    v33.super_class = (Class)&OBJC_CLASS___ATSACCAClockDevice;
    int v28 = -[ATSACCAClockDevice performStartIO](&v33, "performStartIO");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v29 = -[ATSACCAClockDevice clockIdentifier](self, "clockIdentifier");
      *(_DWORD *)buf = 134218240;
      unint64_t v41 = v29;
      __int16 v42 = 1024;
      int v43 = v28;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%016llx: started IO 0x%08x\n",  buf,  0x12u);
    }
  }

  v30 = self->_startSemaphore;
  self->_startSemaphore = 0LL;

  return v28;
}

- (int)performStopIO
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v12 = -[ATSACCAClockDevice clockIdentifier](self, "clockIdentifier");
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%016llx: stopping IO\n", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ATSACCAClockDevice;
  int v3 = -[ATSACCAClockDevice performStopIO](&v10, "performStopIO");
  -[TSClock removeClient:](self->_clock, "removeClient:", self);
  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
  dispatch_source_set_event_handler((dispatch_source_t)self->_timerSource, 0LL);
  timerSource = self->_timerSource;
  self->_timerSource = 0LL;

  timerQueue = self->_timerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_6BA8;
  block[3] = &unk_C5B8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)timerQueue, block);
  clock = self->_clock;
  self->_clock = 0LL;

  self->_lastLockState = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = -[ATSACCAClockDevice clockIdentifier](self, "clockIdentifier");
    *(_DWORD *)buf = 134218240;
    unint64_t v12 = v7;
    __int16 v13 = 1024;
    int v14 = v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%016llx: stopped IO 0x%08x\n", buf, 0x12u);
  }

  return v3;
}

- (BOOL)changeSamplingRate:(double)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_6C40;
  v4[3] = &unk_C600;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  -[ATSACCAClockDevice requestConfigurationChange:](self, "requestConfigurationChange:", v4);
  return 1;
}

- (void)didChangeClockMasterForClock:(id)a3
{
  id v4 = a3;
  timerQueue = self->_timerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_6D30;
  v7[3] = &unk_C590;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)timerQueue, v7);
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  id v6 = a4;
  timerQueue = self->_timerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_6F28;
  block[3] = &unk_C650;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)timerQueue, block);
}

- (void)didBeginClockGrandmasterChangeForClock:(id)a3
{
  id v4 = a3;
  timerQueue = self->_timerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_7194;
  v7[3] = &unk_C590;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)timerQueue, v7);
}

- (void)didEndClockGrandmasterChangeForClock:(id)a3
{
  id v4 = a3;
  timerQueue = self->_timerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_7380;
  v7[3] = &unk_C590;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)timerQueue, v7);
}

- (void)initializeFirstTimestamp:(id)a3
{
  id v4 = (dispatch_source_s *)a3;
  uint64_t v5 = mach_absolute_time();
  clock = self->_clock;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TSgPTPClock);
  char isKindOfClass = objc_opt_isKindOfClass(clock, v7);
  unint64_t v9 = self->_clock;
  if ((isKindOfClass & 1) != 0) {
    unint64_t v10 = (unint64_t)-[TSClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:]( v9,  "convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:",  v5,  &self->_lastGrandmasterIdentity,  &self->_lastPortNumber);
  }
  else {
    unint64_t v10 = (unint64_t)-[TSClock convertFromMachAbsoluteToDomainTime:]( v9,  "convertFromMachAbsoluteToDomainTime:",  v5);
  }
  if (v10 == TSInvalidTime)
  {
    int v11 = self->_clock;
    loggingQueue = self->_loggingQueue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_7F74;
    v38[3] = &unk_C590;
    v38[4] = self;
    id v39 = v11;
    __int16 v13 = v11;
    dispatch_async((dispatch_queue_t)loggingQueue, v38);

    goto LABEL_21;
  }

  self->_unint64_t lastDomainTimestamp = 260000000 * (v10 / 0xF7F4900);
  int v14 = self->_clock;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___TSgPTPClock);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
  {
    uint64_t v56 = TSNullgPTPClockIdentity;
    v57[0] = TSNullgPTPClockIdentity;
    __int16 v55 = -1;
    __int16 v54 = -1;
    self->_unint64_t lastMachTimestamp = (unint64_t)-[TSClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]( self->_clock,  "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:",  self->_lastDomainTimestamp,  v57,  &v55);
    id v16 = -[TSClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]( self->_clock,  "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:",  self->_lastDomainTimestamp + 290000000,  &v56,  &v54);
    uint64_t v17 = v57[0];
    if (v57[0] == v56 && v55 == v54)
    {
      id v18 = v16;
    }

    else
    {
      v20 = self->_loggingQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_7B44;
      block[3] = &unk_C4B8;
      __int16 v52 = v55;
      block[4] = v57[0];
      void block[5] = v56;
      __int16 v53 = v54;
      dispatch_async((dispatch_queue_t)v20, block);
      self->_unint64_t lastMachTimestamp = (unint64_t)-[TSClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]( self->_clock,  "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:",  self->_lastDomainTimestamp,  v57,  &v55);
      id v18 = -[TSClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]( self->_clock,  "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:",  self->_lastDomainTimestamp + 290000000,  &v56,  &v54);
      uint64_t v17 = v57[0];
      if (v57[0] != v56 || v55 != v54)
      {
        id v21 = self->_loggingQueue;
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_7C0C;
        v48[3] = &unk_C4B8;
        __int16 v49 = v55;
        v48[4] = v57[0];
        v48[5] = v56;
        __int16 v50 = v54;
        dispatch_async((dispatch_queue_t)v21, v48);
        uint64_t v17 = v57[0];
      }
    }

    if (self->_lastGrandmasterIdentity == v17 && self->_lastPortNumber == v55) {
      goto LABEL_19;
    }
    self->_unint64_t lastDomainTimestamp = 260000000
                               * ((unint64_t)-[TSClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:]( self->_clock,  "convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:",  v5)
                                / 0xF7F4900);
    self->_unint64_t lastMachTimestamp = (unint64_t)-[TSClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]( self->_clock,  "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:");
    id v19 = -[TSClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]( self->_clock,  "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:",  self->_lastDomainTimestamp + 290000000,  &v56,  &v54);
    if (v57[0] != v56 || v55 != v54)
    {
      v36 = self->_loggingQueue;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_7CD4;
      v45[3] = &unk_C4B8;
      __int16 v46 = v55;
      v45[4] = v57[0];
      void v45[5] = v56;
      __int16 v47 = v54;
      dispatch_async((dispatch_queue_t)v36, v45);
      self->_unint64_t lastMachTimestamp = (unint64_t)-[TSClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]( self->_clock,  "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:",  self->_lastDomainTimestamp,  v57,  &v55);
      id v18 = -[TSClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]( self->_clock,  "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:",  self->_lastDomainTimestamp + 290000000,  &v56,  &v54);
      if (v57[0] != v56 || v55 != v54)
      {
        v37 = self->_loggingQueue;
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_7D9C;
        v42[3] = &unk_C4B8;
        __int16 v43 = v55;
        v42[4] = v57[0];
        v42[5] = v56;
        __int16 v44 = v54;
        dispatch_async((dispatch_queue_t)v37, v42);
      }

      goto LABEL_19;
    }
  }

  else
  {
    self->_unint64_t lastMachTimestamp = (unint64_t)-[TSClock convertFromDomainToMachAbsoluteTime:]( self->_clock,  "convertFromDomainToMachAbsoluteTime:",  self->_lastDomainTimestamp);
    id v19 = -[TSClock convertFromDomainToMachAbsoluteTime:]( self->_clock,  "convertFromDomainToMachAbsoluteTime:",  self->_lastDomainTimestamp + 290000000);
  }

  id v18 = v19;
LABEL_19:
  self->_unint64_t lastSampleTime = 0LL;
  self->_unint64_t lastFilteredTimestamp = (unint64_t)-[TSIntervalFilter addTimestamp:]( self->_intervalFilter,  "addTimestamp:",  self->_lastMachTimestamp,  self->_lastMachTimestamp);
  self->_lastFilteredInterval = 0LL;
  unint64_t lastSampleTime = self->_lastSampleTime;
  unint64_t lastFilteredTimestamp = self->_lastFilteredTimestamp;
  unint64_t lastSeed = self->_lastSeed;
  unint64_t v25 = atomic_load(&self->_timestamp.mTimestampIndex.__a_.__a_value);
  unint64_t v26 = (v25 + 1) % self->_timestamp.mNumberOfSlots;
  id v27 = (unint64_t *)((char *)self->_timestamp.mTimestamps.__begin_ + 24 * v26);
  *id v27 = lastSampleTime;
  v27[1] = lastFilteredTimestamp;
  v27[2] = lastSeed;
  atomic_store(v26, &self->_timestamp.mTimestampIndex.__a_.__a_value);
  unint64_t lastGrandmasterIdentity = self->_lastGrandmasterIdentity;
  LOWORD(lastSampleTime) = self->_lastPortNumber;
  unint64_t lastMachTimestamp = self->_lastMachTimestamp;
  unint64_t lastDomainTimestamp = self->_lastDomainTimestamp;
  unint64_t v31 = self->_lastSampleTime;
  unint64_t v32 = self->_lastFilteredTimestamp;
  objc_super v33 = self->_loggingQueue;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_7E64;
  v40[3] = &unk_C678;
  v40[4] = self;
  v40[5] = v31;
  v40[6] = v32;
  v40[7] = lastGrandmasterIdentity;
  __int16 v41 = lastSampleTime;
  v40[8] = lastDomainTimestamp;
  v40[9] = lastMachTimestamp;
  dispatch_async((dispatch_queue_t)v33, v40);
  kdebug_trace( 86262816LL,  -[ATSACCAClockDevice clockIdentifier](self, "clockIdentifier"),  self->_lastSampleTime,  self->_lastFilteredTimestamp,  self->_lastGrandmasterIdentity);
  self->_hasLastTimestamp = 1;
  id v34 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
  self->_lastMachInterval = (unint64_t)[v34 machAbsoluteNanosecondsToTicks:260000000];

  self->_dispatchTime = (unint64_t)v18;
  dispatch_source_set_timer(v4, (dispatch_time_t)v18, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  startSemaphore = self->_startSemaphore;
  if (startSemaphore) {
    dispatch_semaphore_signal((dispatch_semaphore_t)startSemaphore);
  }
LABEL_21:
}

- (void)dealloc
{
  if (-[ATSACCAClockDevice clockDomain](self, "clockDomain"))
  {
    int v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
    [v3 removeMappingFromClockIDToCoreAudioClockDomainForClockID:self->_clockIdentifier error:0];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ATSACCAClockDevice;
  -[ATSACCAClockDevice dealloc](&v4, "dealloc");
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (int64_t)referenceCount
{
  return self->_referenceCount;
}

- (void)setReferenceCount:(int64_t)a3
{
  self->_referenceCount = a3;
}

- (void).cxx_destruct
{
  p_timestamp = &self->_timestamp;
  begin = self->_timestamp.mTimestamps.__begin_;
  if (begin)
  {
    p_timestamp->mTimestamps.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_intervalFilter, 0LL);
  objc_storeStrong((id *)&self->_timerSource, 0LL);
  objc_storeStrong((id *)&self->_clock, 0LL);
  objc_storeStrong((id *)&self->_startSemaphore, 0LL);
  objc_storeStrong((id *)&self->_loggingQueue, 0LL);
  objc_storeStrong((id *)&self->_timerQueue, 0LL);
}

- (id).cxx_construct
{
  p_timestamp = &self->_timestamp;
  self->_timestamp.mNumberOfSlots = 4LL;
  __int128 v5 = 0uLL;
  uint64_t v6 = 0LL;
  sub_85F0(&self->_timestamp.mTimestamps.__begin_, 4uLL, &v5);
  p_timestamp->mTimestampIndex.__a_.__a_value = 0LL;
  return self;
}

@end