@interface CMContinuityCaptureAudioDevice
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_syncedTimestampForSampleTime:(double)a3 addTransportLatency:(BOOL)a4 forceHostClock:(BOOL)a5;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_syncedTimestampForSampleTime:(double)a3 forceHostClock:(BOOL)a4;
- (AudioStreamBasicDescription)_inputASBDForMode:(SEL)a3;
- (AudioStreamBasicDescription)_outputASBDForMode:(SEL)a3;
- (BOOL)changeSamplingRate:(double)a3;
- (BOOL)testModeEnabled;
- (CMContinuityCaptureAudioDevice)initWithDeviceUID:(id)a3 deviceName:(id)a4 modelUID:(id)a5 transportLatencyInSeconds:(id)a6 withPlugin:(id)a7;
- (CMContinuityCaptureRemoteFrameLatencyMetrics)latencyMetrics;
- (id).cxx_construct;
- (id)getZeroTimestampBlock;
- (id)willDoReadInputBlock;
- (id)willDoWriteMixBlock;
- (int)performStartIO;
- (int)performStopIO;
- (void)_clearTimeSyncClock;
- (void)_handleTimelineChange:(id)a3;
- (void)_handleTimelineChangeForceConfigChange:(BOOL)a3 completionBlock:(id)a4;
- (void)_initializeHostTimeForZeroSampleTime;
- (void)_scheduleWritingNextSilenceFrame;
- (void)_setupCustomProperties;
- (void)_synchronizeCurrentHostTimeForSampleTime:(double)a3;
- (void)_updateNetworkClock:(id *)a3;
- (void)_updateZeroTimeStampWithSampleTime:(double)a3;
- (void)_writeAudioData:(id)a3 numSamples:(unsigned int)a4 startingSampleTime:(unint64_t)a5;
- (void)dealloc;
- (void)enqueueAudioData:(id)a3 numSamples:(unsigned int)a4 startingSampleTime:(unint64_t)a5;
- (void)modeProperty:(id)a3 changedValueTo:(unsigned int)a4;
- (void)setLatencyMetrics:(id)a3;
- (void)setTestModeEnabled:(BOOL)a3;
- (void)startFillingSilenceAudioDataIfApplicable;
- (void)updateNetworkClockWithSynchronizedNetworkTime:(unint64_t)a3 forSampleTime:(unint64_t)a4 networkClockIdentifier:(unint64_t)a5 transportTypeIsUSB:(BOOL)a6;
- (void)updateUSBActive:(BOOL)a3;
- (void)useCachedNetworkClockIfPossible;
@end

@implementation CMContinuityCaptureAudioDevice

- (CMContinuityCaptureAudioDevice)initWithDeviceUID:(id)a3 deviceName:(id)a4 modelUID:(id)a5 transportLatencyInSeconds:(id)a6 withPlugin:(id)a7
{
  id v12 = a3;
  id v51 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___CMContinuityCaptureAudioDevice;
  v16 = -[CMContinuityCaptureAudioDevice initWithDeviceUID:withPlugin:](&v52, "initWithDeviceUID:withPlugin:", v12, v15);
  v17 = v16;
  v18 = v16;
  if (v16)
  {
    -[CMContinuityCaptureAudioDevice setDeviceName:](v16, "setDeviceName:", v51);
    -[CMContinuityCaptureAudioDevice setModelName:](v18, "setModelName:", v12);
    -[CMContinuityCaptureAudioDevice setManufacturerName:](v18, "setManufacturerName:", @"Apple Inc.");
    -[CMContinuityCaptureAudioDevice setCanBeDefaultInputDevice:](v18, "setCanBeDefaultInputDevice:", 1LL);
    -[CMContinuityCaptureAudioDevice setCanBeDefaultOutputDevice:](v18, "setCanBeDefaultOutputDevice:", 0LL);
    -[CMContinuityCaptureAudioDevice setCanBeDefaultSystemDevice:](v18, "setCanBeDefaultSystemDevice:", 0LL);
    -[CMContinuityCaptureAudioDevice setAllowAutoRoute:](v18, "setAllowAutoRoute:", 0LL);
    -[CMContinuityCaptureAudioDevice setCanChangeDeviceName:](v18, "setCanChangeDeviceName:", 0LL);
    -[CMContinuityCaptureAudioDevice setSamplingRates:](v18, "setSamplingRates:", &off_10948);
    -[CMContinuityCaptureAudioDevice setSamplingRate:](v18, "setSamplingRate:", 48000.0);
    if (v14)
    {
      [v14 doubleValue];
      double v20 = v19;
      -[CMContinuityCaptureAudioDevice samplingRate](v18, "samplingRate");
      v18->_unsigned int transportLatency = (v20 * v21);
      [v14 doubleValue];
      int v23 = (int)(v22 * 1000.0);
    }

    else
    {
      -[CMContinuityCaptureAudioDevice samplingRate](v18, "samplingRate");
      v18->_unsigned int transportLatency = (v24 * 0.15);
      int v23 = 150;
    }

    v18->_transportLatencyInMs = v23;
    -[CMContinuityCaptureAudioDevice samplingRate](v18, "samplingRate");
    LODWORD(v25) = v18->_transportLatency;
    -[CMContinuityCaptureAudioDevice setInputLatency:]( v18,  "setInputLatency:",  ((double)v25 + v26 * 0.005));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int transportLatency = v18->_transportLatency;
      unsigned int v28 = -[CMContinuityCaptureAudioDevice inputLatency](v18, "inputLatency");
      *(_DWORD *)buf = 138412802;
      id v54 = v12;
      __int16 v55 = 1024;
      unsigned int v56 = transportLatency;
      __int16 v57 = 1024;
      unsigned int v58 = v28;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Audio device %@ using transport latency: %u frames and input latency: %u frames",  buf,  0x18u);
    }

    -[CMContinuityCaptureAudioDevice setInputSafetyOffset:](v18, "setInputSafetyOffset:", 100LL);
    -[CMContinuityCaptureAudioDevice setModelUID:](v18, "setModelUID:", v13);
    -[CMContinuityCaptureAudioDevice setTransportType:](v18, "setTransportType:", 1667463020LL);
    -[CMContinuityCaptureAudioDevice samplingRate](v18, "samplingRate");
    -[CMContinuityCaptureAudioDevice setTimestampPeriod:]( v18,  "setTimestampPeriod:",  (v29 * 260.0 / 1000.0));
    -[CMContinuityCaptureAudioDevice _setupCustomProperties](v18, "_setupCustomProperties");
    v30 = -[CMContinuityCaptureAudioStream initWithDirection:owningDevice:deviceMode:plugin:]( objc_alloc(&OBJC_CLASS___CMContinuityCaptureAudioStream),  "initWithDirection:owningDevice:deviceMode:plugin:",  1768845428LL,  v18,  v18->_mode,  v15);
    inputStream = v17->_inputStream;
    v17->_inputStream = v30;

    -[CMContinuityCaptureAudioStream setStreamName:](v17->_inputStream, "setStreamName:", @"InputStream");
    -[CMContinuityCaptureAudioDevice addInputStream:](v18, "addInputStream:", v18->_inputStream);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleID]);
    v33 = (objc_class *)objc_opt_class(v18);
    v34 = NSStringFromClass(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@.workQueue",  v32,  v35,  v12));

    id v37 = v36;
    uint64_t v38 = FigDispatchQueueCreateWithPriority([v37 UTF8String], 0, 14);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v38;

    v40 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleID]);
    v41 = (objc_class *)objc_opt_class(v18);
    v42 = NSStringFromClass(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@.timelineChangeQueue",  v40,  v43,  v12));

    id v45 = v44;
    uint64_t v46 = FigDispatchQueueCreateWithPriority([v45 UTF8String], 0, 14);
    timelineChangeQueue = v18->_timelineChangeQueue;
    v18->_timelineChangeQueue = (OS_dispatch_queue *)v46;

    v18->_timeLineChangeLock._os_unfair_lock_opaque = 0;
    -[CMContinuityCaptureAudioDevice _clearTimeSyncClock](v18, "_clearTimeSyncClock");
    CMTimeEpoch epoch = kCMTimeInvalid.epoch;
    *(_OWORD *)(&v17->_transportLatencyInMs + 1) = *(_OWORD *)&kCMTimeInvalid.value;
    *(void *)&v17->_streamStartsTime.flags = epoch;
    unint64_t v49 = TSInvalidTime;
    v17->_cachedNetworkClock.clockIdentifier = TSNullClockIdentifier;
    v17->_cachedNetworkClock.networkTimeForZeroSampleTime = v49;
    v17->_cachedNetworkClock.transportType = -[CMContinuityCaptureAudioDevice transportType]( v18,  "transportType");
  }

  return v18;
}

- (void)dealloc
{
  silenceFramesTimer = self->_silenceFramesTimer;
  if (silenceFramesTimer)
  {
    dispatch_source_cancel((dispatch_source_t)silenceFramesTimer);
    v4 = self->_silenceFramesTimer;
    self->_silenceFramesTimer = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CMContinuityCaptureAudioDevice;
  -[CMContinuityCaptureAudioDevice dealloc](&v5, "dealloc");
}

- (void)_setupCustomProperties
{
  v3 = objc_alloc_init(&OBJC_CLASS___CCAModeSupportedProperty);
  modeSupportedProperty = self->_modeSupportedProperty;
  self->_modeSupportedProperty = v3;

  -[CMContinuityCaptureAudioDevice addCustomProperty:](self, "addCustomProperty:", self->_modeSupportedProperty);
  objc_super v5 = -[CCAModeProperty initWithOwningDevice:]( objc_alloc(&OBJC_CLASS___CCAModeProperty),  "initWithOwningDevice:",  self);
  modeProperty = self->_modeProperty;
  self->_modeProperty = v5;

  -[CMContinuityCaptureAudioDevice addCustomProperty:](self, "addCustomProperty:", self->_modeProperty);
  self->_mode = -[CCAModeProperty mode](self->_modeProperty, "mode");
}

- (int)performStartIO
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_68D0;
  v5[3] = &unk_105C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)workQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)performStopIO
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_6E9C;
  v5[3] = &unk_105C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)workQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)getZeroTimestampBlock
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_7118;
  v3[3] = &unk_105E0;
  v3[4] = &self->_timestamp;
  v3[5] = &self->_lastReadZeroTimestamp;
  return objc_retainBlock(v3);
}

- (id)willDoReadInputBlock
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_7204;
  v3[3] = &unk_10600;
  unsigned __int8 v4 = -[CMContinuityCaptureAudioDevice hasInput](self, "hasInput");
  return objc_retainBlock(v3);
}

- (id)willDoWriteMixBlock
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_7284;
  v3[3] = &unk_10600;
  unsigned __int8 v4 = -[CMContinuityCaptureAudioDevice hasOutput](self, "hasOutput");
  return objc_retainBlock(v3);
}

- (BOOL)changeSamplingRate:(double)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_730C;
  v4[3] = &unk_10628;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  -[CMContinuityCaptureAudioDevice requestConfigurationChange:](self, "requestConfigurationChange:", v4);
  return 1;
}

- (void)enqueueAudioData:(id)a3 numSamples:(unsigned int)a4 startingSampleTime:(unint64_t)a5
{
  id v8 = a3;
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_73B4;
  v11[3] = &unk_10650;
  unsigned int v14 = a4;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v11);
}

- (void)updateNetworkClockWithSynchronizedNetworkTime:(unint64_t)a3 forSampleTime:(unint64_t)a4 networkClockIdentifier:(unint64_t)a5 transportTypeIsUSB:(BOOL)a6
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_7828;
  block[3] = &unk_106A0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  BOOL v8 = a6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)useCachedNetworkClockIfPossible
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_79E0;
  block[3] = &unk_106C8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_updateNetworkClock:(id *)a3
{
  unsigned int var2 = a3->var2;
  unsigned int v6 = -[CMContinuityCaptureAudioDevice transportType](self, "transportType");
  if (a3->var0 != TSNullClockIdentifier && a3->var1 != TSInvalidTime)
  {
    unsigned int v8 = v6;
    if (-[CMContinuityCaptureTimeSyncClock clockIdentifier](self->_timeSyncClock, "clockIdentifier") != (id)a3->var0
      || (self->_timestamp.networkTimeForZeroSampleTime == a3->var1 ? (BOOL v9 = var2 == v8) : (BOOL v9 = 0), !v9))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        double v19 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
        id v18 = -[CMContinuityCaptureTimeSyncClock clockIdentifier](self->_timeSyncClock, "clockIdentifier");
        unint64_t networkTimeForZeroSampleTime = self->_timestamp.networkTimeForZeroSampleTime;
        unint64_t var0 = a3->var0;
        unint64_t var1 = a3->var1;
        unsigned int v13 = -[CMContinuityCaptureAudioDevice transportType](self, "transportType");
        unsigned __int8 v14 = -[CMContinuityCaptureAudioDevice transportType](self, "transportType") >> 16;
        unsigned __int8 v15 = (unsigned __int16)-[CMContinuityCaptureAudioDevice transportType](self, "transportType") >> 8;
        unsigned __int8 v16 = -[CMContinuityCaptureAudioDevice transportType](self, "transportType");
        unsigned int v17 = a3->var2;
        *(_DWORD *)buf = 138415362;
        double v24 = v19;
        __int16 v25 = 2048;
        id v26 = v18;
        __int16 v27 = 2048;
        unint64_t v28 = var0;
        __int16 v29 = 2048;
        unint64_t v30 = networkTimeForZeroSampleTime;
        __int16 v31 = 2048;
        unint64_t v32 = var1;
        __int16 v33 = 1024;
        unsigned int v34 = HIBYTE(v13);
        __int16 v35 = 1024;
        int v36 = v14;
        __int16 v37 = 1024;
        int v38 = v15;
        __int16 v39 = 1024;
        int v40 = v16;
        __int16 v41 = 1024;
        unsigned int v42 = HIBYTE(v17);
        __int16 v43 = 1024;
        int v44 = BYTE2(v17);
        __int16 v45 = 1024;
        int v46 = BYTE1(v17);
        __int16 v47 = 1024;
        int v48 = v17;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ requesting a configuration change due to timeline change. clockIdentifier old:%llu new:%llu, ne tworkTimeForZeroSampleTime old:%llu new:%llu transportType old:'%c%c%c%c' new:'%c%c%c%c'",  buf,  0x64u);
      }

      if (var2 != v8) {
        -[CMContinuityCaptureAudioDevice setTransportType:](self, "setTransportType:", a3->var2);
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_7DD0;
      v20[3] = &unk_106F0;
      v20[4] = self;
      __int128 v21 = *(_OWORD *)&a3->var0;
      uint64_t v22 = *(void *)&a3->var2;
      -[CMContinuityCaptureAudioDevice _handleTimelineChangeForceConfigChange:completionBlock:]( self,  "_handleTimelineChangeForceConfigChange:completionBlock:",  var2 != v8,  v20);
    }
  }

- (void)startFillingSilenceAudioDataIfApplicable
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_8038;
  block[3] = &unk_106C8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)updateUSBActive:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_823C;
  v4[3] = &unk_10718;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, v4);
}

- (void)setLatencyMetrics:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_8588;
  v7[3] = &unk_10740;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (CMContinuityCaptureRemoteFrameLatencyMetrics)latencyMetrics
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  BOOL v9 = sub_8658;
  id v10 = sub_8668;
  id v11 = 0LL;
  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_8670;
  v5[3] = &unk_10768;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CMContinuityCaptureRemoteFrameLatencyMetrics *)v3;
}

- (void)modeProperty:(id)a3 changedValueTo:(unsigned int)a4
{
  id v6 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_8720;
  block[3] = &unk_107B8;
  block[4] = self;
  id v10 = v6;
  unsigned int v11 = a4;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)workQueue, block);
}

- (void)_scheduleWritingNextSilenceFrame
{
  id v3 = -[CMContinuityCaptureAudioDevice _syncedTimestampForSampleTime:forceHostClock:]( self,  "_syncedTimestampForSampleTime:forceHostClock:",  1LL,  (double)self->_nextSampleTimeToWrite);
  uint64_t v5 = v4;
  dispatch_source_set_timer( (dispatch_source_t)self->_silenceFramesTimer,  (dispatch_time_t)v3,  0xFFFFFFFFFFFFFFFFLL,  0LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    silenceFramesTimer = self->_silenceFramesTimer;
    CMClockMakeHostTimeFromSystemUnits(&time, (uint64_t)v3);
    Float64 Seconds = CMTimeGetSeconds(&time);
    unint64_t nextSampleTimeToWrite = self->_nextSampleTimeToWrite;
    *(_DWORD *)buf = 138413570;
    unsigned int v11 = self;
    __int16 v12 = 2112;
    unsigned int v13 = silenceFramesTimer;
    __int16 v14 = 2048;
    id v15 = v3;
    __int16 v16 = 2048;
    Float64 v17 = Seconds;
    __int16 v18 = 2048;
    uint64_t v19 = v5;
    __int16 v20 = 2048;
    unint64_t v21 = nextSampleTimeToWrite;
    _os_log_debug_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "AudioDevice %@ Scheduled writing next silence frame when %@ fires at hostTime:%llu hostTimePTS:%.3f networkTime:%l lu sampleTime:%llu",  buf,  0x3Eu);
  }

- (void)_clearTimeSyncClock
{
  if (self->_timeSyncClock)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
    objc_msgSend( v3,  "removeMappingFromClockIDToCoreAudioClockDomainForClockID:error:",  -[CMContinuityCaptureTimeSyncClock clockIdentifier](self->_timeSyncClock, "clockIdentifier"),  0);
  }

  -[CMContinuityCaptureAudioDevice setClockDomain:](self, "setClockDomain:", 0LL);
  timeSyncClock = self->_timeSyncClock;
  self->_timeSyncClock = 0LL;

  unint64_t v5 = TSInvalidTime;
  self->_lastSyncedTimestamp.hostTime = TSInvalidTime;
  self->_lastSyncedTimestamp.networkTime = v5;
  self->_timestamp.unint64_t networkTimeForZeroSampleTime = v5;
  self->_clockIdentityUsedForLastSyncedTimestamp = TSNullgPTPClockIdentity;
  self->_clockWasTemporarilyInvalid = 0;
  self->_hostTimeRatioForLastSyncedTimestamp = 0.0;
}

- (void)_initializeHostTimeForZeroSampleTime
{
  LODWORD(v4) = info.numer;
  LODWORD(v3) = info.denom;
  self->_timestamp.hostTimeFrequency = (double)v3 / (double)v4 * 1000000000.0;
  -[CMContinuityCaptureAudioDevice _synchronizeCurrentHostTimeForSampleTime:]( self,  "_synchronizeCurrentHostTimeForSampleTime:",  0.0);
}

- (void)_synchronizeCurrentHostTimeForSampleTime:(double)a3
{
  uint64_t v5 = mach_absolute_time();
  p_timestamp = &self->_timestamp;
  double hostTimeFrequency = self->_timestamp.hostTimeFrequency;
  -[CMContinuityCaptureAudioDevice samplingRate](self, "samplingRate");
  self->_timestamp.hostTimeForZeroSampleTime = v5 - (unint64_t)(hostTimeFrequency / v8 * a3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
    CMClockMakeHostTimeFromSystemUnits(&time, p_timestamp->hostTimeForZeroSampleTime);
    Float64 Seconds = CMTimeGetSeconds(&time);
    *(_DWORD *)buf = 138412802;
    unsigned int v13 = v9;
    __int16 v14 = 2048;
    Float64 v15 = Seconds;
    __int16 v16 = 2048;
    double v17 = a3;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ updated hostTimeForZeroSampleTime %.5f, sampleTime %f",  buf,  0x20u);
  }

- (void)_writeAudioData:(id)a3 numSamples:(unsigned int)a4 startingSampleTime:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  char v20 = 0;
  double v19 = 0.0;
  if (self->_streaming)
  {
    if (self->_interleaveInputAudioData)
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( NSMutableData,  "dataWithLength:",  [v8 length]));
      id v18 = v8;
      id v10 = (char *)[v18 bytes];
      id v17 = v9;
      unsigned int v11 = (char *)[v17 bytes];
      if ((_DWORD)v6)
      {
        __int16 v12 = v11;
        int v13 = 0;
        UInt32 mChannelsPerFrame = self->_outputASBD.mChannelsPerFrame;
        do
        {
          if (mChannelsPerFrame)
          {
            int v15 = 0;
            for (UInt32 i = 0; i < mChannelsPerFrame; ++i)
            {
              memcpy( &v12[self->_outputASBD.mBytesPerFrame * v13 + self->_inputASBD.mBytesPerFrame * i],  &v10[v15 * self->_inputASBD.mBytesPerFrame + self->_inputASBD.mBytesPerFrame * v13],  self->_inputASBD.mBytesPerFrame);
              UInt32 mChannelsPerFrame = self->_outputASBD.mChannelsPerFrame;
              v15 += v6;
            }
          }

          ++v13;
        }

        while (v13 != (_DWORD)v6);
      }

      id v8 = v17;
    }

    -[CMContinuityCaptureAudioStream writeAudioData:numSamples:startingSampleTime:zeroIndexSampleTimeUpdatedOut:zeroIndexSampleTimeOut:]( self->_inputStream,  "writeAudioData:numSamples:startingSampleTime:zeroIndexSampleTimeUpdatedOut:zeroIndexSampleTimeOut:",  v8,  v6,  a5,  &v20,  &v19);
    self->_unint64_t nextSampleTimeToWrite = a5 + v6;
    if (v20) {
      -[CMContinuityCaptureAudioDevice _updateZeroTimeStampWithSampleTime:]( self,  "_updateZeroTimeStampWithSampleTime:",  v19);
    }
    if (self->_startFillingSilenceFrames && self->_silenceFramesTimer) {
      -[CMContinuityCaptureAudioDevice _scheduleWritingNextSilenceFrame](self, "_scheduleWritingNextSilenceFrame");
    }
  }
}

- (void)_updateZeroTimeStampWithSampleTime:(double)a3
{
  id v5 = -[CMContinuityCaptureAudioDevice _syncedTimestampForSampleTime:addTransportLatency:forceHostClock:]( self,  "_syncedTimestampForSampleTime:addTransportLatency:forceHostClock:",  1LL,  self->_startFillingSilenceFrames,  a3);
  unint64_t v7 = v6;
  CMClockMakeHostTimeFromSystemUnits(&time, (uint64_t)v5);
  double Seconds = CMTimeGetSeconds(&time);
  uint64_t v9 = mach_absolute_time();
  CMClockMakeHostTimeFromSystemUnits(&v34, v9);
  double v10 = (Seconds - CMTimeGetSeconds(&v34)) * 1000.0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
    unsigned int transportLatency = self->_transportLatency;
    CMClockMakeHostTimeFromSystemUnits(&v33, (uint64_t)v5);
    Float64 v13 = CMTimeGetSeconds(&v33);
    CMClockMakeHostTimeFromSystemUnits(&v32, (uint64_t)v5);
    double v14 = CMTimeGetSeconds(&v32);
    CMClockMakeHostTimeFromSystemUnits(&v31, self->_lastWrittenZeroTimestamp.hostTime);
    Float64 v15 = CMTimeGetSeconds(&v31);
    LODWORD(buf.value) = 138414850;
    double networkTime = (double)self->_lastWrittenZeroTimestamp.networkTime;
    BOOL startFillingSilenceFrames = self->_startFillingSilenceFrames;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v11;
    LOWORD(buf.flags) = 2048;
    *(double *)((char *)&buf.flags + 2) = a3;
    HIWORD(buf.epoch) = 1024;
    unsigned int v37 = transportLatency;
    __int16 v38 = 2048;
    id v39 = v5;
    __int16 v40 = 2048;
    Float64 v41 = v13;
    __int16 v42 = 2048;
    unint64_t v43 = v7;
    __int16 v44 = 1024;
    BOOL v45 = v7 != 0;
    __int16 v46 = 2048;
    double v47 = (v14 - v15) * 1000.0;
    __int16 v48 = 2048;
    double v49 = (double)v7 / 1000000.0 - networkTime / 1000000.0;
    __int16 v50 = 1024;
    BOOL v51 = startFillingSilenceFrames;
    __int16 v52 = 2048;
    double v53 = v10;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ updated zero time stamp. sampleTime %f transportLatency %u hostTime: %llu hostTimePTS:%.3f networkT ime:%llu fromNetworkClock:%d hostTimeDelta:%.5fms networkTimeDelta:%.5fms fillingSilenceSamples:%d deltaToCurrentTime:%.3fms",  (uint8_t *)&buf,  0x64u);
  }

  latencyMetrics = self->_latencyMetrics;
  if (latencyMetrics) {
    BOOL v19 = v7 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (!v19) {
    -[CMContinuityCaptureRemoteFrameLatencyMetrics addLatencyNumberInMilliSeconds:]( latencyMetrics,  "addLatencyNumberInMilliSeconds:",  (int)((double)self->_transportLatencyInMs - v10));
  }
  if (self->_lastWrittenZeroTimestamp.hostTime || v10 >= 0.0)
  {
    char v20 = &self->_transportLatencyInMs + 1;
    if ((self->_streamStartsTime.timescale & 1) != 0)
    {
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&buf, HostTimeClock);
      CMTime lhs = buf;
      *(_OWORD *)&rhs.value = *(_OWORD *)v20;
      rhs.CMTimeEpoch epoch = *(void *)&self->_streamStartsTime.flags;
      CMTimeSubtract(&v30, &lhs, &rhs);
      CMTime v27 = v30;
      -[CMContinuityCaptureRemoteFrameLatencyMetrics setStartUpLatency:]( self->_latencyMetrics,  "setStartUpLatency:",  (CMTimeGetSeconds(&v27) * 1000.0));
      __int128 v22 = *(_OWORD *)&kCMTimeInvalid.value;
      *(void *)&self->_streamStartsTime.flags = kCMTimeInvalid.epoch;
      *(_OWORD *)char v20 = v22;
    }

    unint64_t currentSeed = self->_currentSeed;
    unint64_t v24 = atomic_load(&self->_timestamp.mTimestampIndex.__a_.__a_value);
    unint64_t v25 = (v24 + 1) % self->_timestamp.mNumberOfSlots;
    id v26 = (char *)self->_timestamp.mTimestamps.__begin_ + 24 * v25;
    *(double *)id v26 = a3;
    *((void *)v26 + 1) = v5;
    *((void *)v26 + 2) = currentSeed;
    atomic_store(v25, &self->_timestamp.mTimestampIndex.__a_.__a_value);
    self->_lastWrittenZeroTimestamp.hostTime = (unint64_t)v5;
    self->_lastWrittenZeroTimestamp.double networkTime = v7;
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_A910(self, a3);
  }

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_syncedTimestampForSampleTime:(double)a3 forceHostClock:(BOOL)a4
{
  id v4 = -[CMContinuityCaptureAudioDevice _syncedTimestampForSampleTime:addTransportLatency:forceHostClock:]( self,  "_syncedTimestampForSampleTime:addTransportLatency:forceHostClock:",  0LL,  a4,  a3);
  result.unint64_t var1 = v5;
  result.unint64_t var0 = (unint64_t)v4;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_syncedTimestampForSampleTime:(double)a3 addTransportLatency:(BOOL)a4 forceHostClock:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v6)
  {
    LODWORD(v9) = self->_transportLatency;
    a3 = (double)v9 + a3;
  }

  if (self->_timeSyncClock) {
    BOOL v10 = !v5;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    unint64_t hostTimeForZeroSampleTime = self->_timestamp.hostTimeForZeroSampleTime;
    double hostTimeFrequency = self->_timestamp.hostTimeFrequency;
    -[CMContinuityCaptureAudioDevice samplingRate](self, "samplingRate");
    unint64_t v13 = 0LL;
    id v15 = (id)(hostTimeForZeroSampleTime + (unint64_t)(a3 * (hostTimeFrequency / v14)));
    goto LABEL_24;
  }

  unint64_t networkTimeForZeroSampleTime = self->_timestamp.networkTimeForZeroSampleTime;
  -[CMContinuityCaptureAudioDevice samplingRate](self, "samplingRate");
  unint64_t v13 = networkTimeForZeroSampleTime + (unint64_t)(a3 / v17 * 1000000000.0);
  id v15 = -[CMContinuityCaptureTimeSyncClock machAbsoluteTimeForDomainTime:]( self->_timeSyncClock,  "machAbsoluteTimeForDomainTime:",  v13);
  id v18 = -[CMContinuityCaptureTimeSyncClock grandMasterIdentifier](self->_timeSyncClock, "grandMasterIdentifier");
  id v19 = v18;
  unint64_t clockIdentityUsedForLastSyncedTimestamp = self->_clockIdentityUsedForLastSyncedTimestamp;
  if (clockIdentityUsedForLastSyncedTimestamp == TSNullgPTPClockIdentity)
  {
    if (v18 != (id)clockIdentityUsedForLastSyncedTimestamp && v15 != (id)TSInvalidTime)
    {
LABEL_15:
      self->_lastSyncedTimestamp.unint64_t hostTime = (unint64_t)v15;
      self->_lastSyncedTimestamp.unint64_t networkTime = v13;
      self->_unint64_t clockIdentityUsedForLastSyncedTimestamp = (unint64_t)v18;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
        int v47 = 138413058;
        __int16 v48 = v23;
        __int16 v49 = 2048;
        unint64_t v50 = (unint64_t)v15;
        __int16 v51 = 2048;
        *(void *)__int16 v52 = v13;
        *(_WORD *)&v52[8] = 2048;
        *(void *)&v52[10] = v19;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ recorded first synced hostTime:%llu networkTime:%llu clockIdentity:%llu",  (uint8_t *)&v47,  0x2Au);
      }

      goto LABEL_24;
    }

    goto LABEL_17;
  }

  if (v18 == (id)TSNullgPTPClockIdentity || v15 == (id)TSInvalidTime)
  {
LABEL_17:
    if (self->_hostTimeRatioForLastSyncedTimestamp > 2.22044605e-16
      && -[CMContinuityCaptureTimeSyncClock isConnectedToPeer](self->_timeSyncClock, "isConnectedToPeer"))
    {
      id v15 = (id)(self->_lastSyncedTimestamp.hostTime
               + (unint64_t)(self->_hostTimeRatioForLastSyncedTimestamp
                                  * (double)(v13 - self->_lastSyncedTimestamp.networkTime)));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
        unint64_t hostTime = self->_lastSyncedTimestamp.hostTime;
        unint64_t networkTime = self->_lastSyncedTimestamp.networkTime;
        double hostTimeRatioForLastSyncedTimestamp = self->_hostTimeRatioForLastSyncedTimestamp;
        int v47 = 138413570;
        __int16 v48 = v24;
        __int16 v49 = 2048;
        unint64_t v50 = (unint64_t)v15;
        __int16 v51 = 2048;
        *(void *)__int16 v52 = v13;
        *(_WORD *)&v52[8] = 2048;
        *(void *)&v52[10] = hostTime;
        *(_WORD *)&v52[18] = 2048;
        *(void *)&v52[20] = networkTime;
        *(_WORD *)&v52[28] = 2048;
        *(double *)&v52[30] = hostTimeRatioForLastSyncedTimestamp;
        _os_log_debug_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "AudioDevice %@ created fake hostTime:%llu for networkTime:%llu using last synced hostTime %llu networkTime %ll u, hostTimeRatio:%.5f",  (uint8_t *)&v47,  0x3Eu);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
      unsigned int v43 = -[CMContinuityCaptureTimeSyncClock isConnectedToPeer]( self->_timeSyncClock,  "isConnectedToPeer");
      unint64_t v45 = self->_lastSyncedTimestamp.hostTime;
      unint64_t v44 = self->_lastSyncedTimestamp.networkTime;
      double v46 = self->_hostTimeRatioForLastSyncedTimestamp;
      int v47 = 138413570;
      __int16 v48 = v42;
      __int16 v49 = 2048;
      unint64_t v50 = v13;
      __int16 v51 = 1024;
      *(_DWORD *)__int16 v52 = v43;
      *(_WORD *)&v52[4] = 2048;
      *(void *)&v52[6] = v45;
      *(_WORD *)&v52[14] = 2048;
      *(void *)&v52[16] = v44;
      *(_WORD *)&v52[24] = 2048;
      *(double *)&v52[26] = v46;
      _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "AudioDevice %@ failed to create fake hostTime for networkTime:%llu clockIsConnectedToPeer: %d. Last synced hostT ime %llu networkTime %llu, hostTimeRatio:%.5f",  (uint8_t *)&v47,  0x3Au);
    }

    self->_clockWasTemporarilyInvalid = 1;
    goto LABEL_24;
  }

  p_lastSyncedTimestamp = &self->_lastSyncedTimestamp;
  unint64_t v22 = self->_lastSyncedTimestamp.hostTime;
  if (v22 == TSInvalidTime) {
    goto LABEL_15;
  }
  if ((id)clockIdentityUsedForLastSyncedTimestamp == v18 && !self->_clockWasTemporarilyInvalid)
  {
    p_lastSyncedTimestamp->unint64_t hostTime = (unint64_t)v15;
    self->_lastSyncedTimestamp.unint64_t networkTime = v13;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
      Float64 v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_hostTimeRatioForLastSyncedTimestamp));
      int v47 = 138413314;
      __int16 v48 = v40;
      __int16 v49 = 2048;
      unint64_t v50 = (unint64_t)v15;
      __int16 v51 = 2048;
      *(void *)__int16 v52 = v13;
      *(_WORD *)&v52[8] = 2048;
      *(void *)&v52[10] = v19;
      *(_WORD *)&v52[18] = 2112;
      *(void *)&v52[20] = v41;
      _os_log_debug_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "AudioDevice %@ recorded synced hostTime:%llu networkTime:%llu clockIdentity:%llu hostTimeRatio %@",  (uint8_t *)&v47,  0x34u);
    }
  }

  else
  {
    CMTime v30 = (char *)-[CMContinuityCaptureTimeSyncClock domainTimeForMachAbsoluteTime:]( self->_timeSyncClock,  "domainTimeForMachAbsoluteTime:");
    CMTime v31 = &v30[-self->_lastSyncedTimestamp.networkTime];
    unint64_t v32 = (unint64_t)&v31[self->_timestamp.networkTimeForZeroSampleTime];
    self->_timestamp.unint64_t networkTimeForZeroSampleTime = v32;
    self->_cachedNetworkClock.unint64_t networkTimeForZeroSampleTime = v32;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      CMTime v33 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
      unint64_t v34 = p_lastSyncedTimestamp->hostTime;
      unint64_t v35 = self->_lastSyncedTimestamp.networkTime;
      int v47 = 138413314;
      __int16 v48 = v33;
      __int16 v49 = 2048;
      unint64_t v50 = (unint64_t)v31;
      __int16 v51 = 2048;
      *(void *)__int16 v52 = v34;
      *(_WORD *)&v52[8] = 2048;
      *(void *)&v52[10] = v35;
      *(_WORD *)&v52[18] = 2048;
      *(void *)&v52[20] = v30;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ calculated networkTimeOffset %lld with hostTime:%llu last synced networkTime:%llu new networkTime %llu",  (uint8_t *)&v47,  0x34u);
    }

    unint64_t v36 = self->_timestamp.networkTimeForZeroSampleTime;
    -[CMContinuityCaptureAudioDevice samplingRate](self, "samplingRate");
    unint64_t v13 = v36 + (unint64_t)(a3 / v37 * 1000000000.0);
    id v15 = -[CMContinuityCaptureTimeSyncClock machAbsoluteTimeForDomainTime:]( self->_timeSyncClock,  "machAbsoluteTimeForDomainTime:",  v13);
    id v38 = -[CMContinuityCaptureTimeSyncClock grandMasterIdentifier](self->_timeSyncClock, "grandMasterIdentifier");
    p_lastSyncedTimestamp->unint64_t hostTime = (unint64_t)v15;
    self->_lastSyncedTimestamp.unint64_t networkTime = v13;
    self->_unint64_t clockIdentityUsedForLastSyncedTimestamp = (unint64_t)v38;
    self->_clockWasTemporarilyInvalid = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
      int v47 = 138413058;
      __int16 v48 = v39;
      __int16 v49 = 2048;
      unint64_t v50 = (unint64_t)v15;
      __int16 v51 = 2048;
      *(void *)__int16 v52 = v13;
      *(_WORD *)&v52[8] = 2048;
      *(void *)&v52[10] = v38;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ recovered time conversion with synced hostTime:%llu networkTime:%llu clockIdentity:%llu",  (uint8_t *)&v47,  0x2Au);
    }
  }

- (void)_handleTimelineChange:(id)a3
{
}

- (void)_handleTimelineChangeForceConfigChange:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v6 = (void (**)(void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (a3 || self->_streaming && self->_nextSampleTimeToWrite)
  {
    BOOL isChangingTimeline = self->_isChangingTimeline;
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (isChangingTimeline)
    {
      if (v8)
      {
        unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
        *(_DWORD *)CMTime buf = 138412290;
        unint64_t v24 = v9;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ handle timeline change by waiting for existing configuration change to finish.",  buf,  0xCu);
      }

      timelineChangeQueue = self->_timelineChangeQueue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_9EAC;
      v19[3] = &unk_107E0;
      v19[4] = self;
      unsigned int v11 = (id *)&v20;
      char v20 = v6;
      dispatch_async((dispatch_queue_t)timelineChangeQueue, v19);
    }

    else
    {
      if (v8)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
        *(_DWORD *)CMTime buf = 138412290;
        unint64_t v24 = v15;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ handle timeline change by requesting a configuration change.",  buf,  0xCu);
      }

      self->_BOOL isChangingTimeline = 1;
      os_unfair_lock_lock(&self->_timeLineChangeLock);
      __int16 v16 = (OS_dispatch_group *)dispatch_group_create();
      timelineChangeGroup = self->_timelineChangeGroup;
      self->_timelineChangeGroup = v16;

      dispatch_group_enter((dispatch_group_t)self->_timelineChangeGroup);
      os_unfair_lock_unlock(&self->_timeLineChangeLock);
      id v18 = self->_timelineChangeQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_9D2C;
      block[3] = &unk_107E0;
      block[4] = self;
      unsigned int v11 = (id *)&v22;
      unint64_t v22 = v6;
      dispatch_sync((dispatch_queue_t)v18, block);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioDevice deviceName](self, "deviceName"));
      BOOL streaming = self->_streaming;
      unint64_t nextSampleTimeToWrite = self->_nextSampleTimeToWrite;
      *(_DWORD *)CMTime buf = 138412802;
      unint64_t v24 = v12;
      __int16 v25 = 1024;
      BOOL v26 = streaming;
      __int16 v27 = 2048;
      unint64_t v28 = nextSampleTimeToWrite;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ handle timeline change when timeline hasn't been established, calling completion block directly. streaming:%d nextSampleTime:%llu",  buf,  0x1Cu);
    }

    v6[2](v6);
  }
}

- (AudioStreamBasicDescription)_inputASBDForMode:(SEL)a3
{
  if (a4 == 1667329132)
  {
    id v4 = &ContinuityCaptureTelephonyModeInputASBD;
  }

  else
  {
    if (a4 != 1684434036) {
      return self;
    }
    id v4 = &ContinuityCaptureDefaultModeInputASBD;
  }

  __int128 v5 = v4[1];
  *(_OWORD *)&retstr->mSampleRate = *v4;
  *(_OWORD *)&retstr->mBytesPerPacket = v5;
  *(void *)&retstr->mBitsPerChannel = *((void *)v4 + 4);
  return self;
}

- (AudioStreamBasicDescription)_outputASBDForMode:(SEL)a3
{
  if (a4 == 1667329132)
  {
    id v4 = &ContinuityCaptureTelephonyModeOutputASBD;
  }

  else
  {
    if (a4 != 1684434036) {
      return self;
    }
    id v4 = &ContinuityCaptureDefaultModeOutputASBD;
  }

  __int128 v5 = v4[1];
  *(_OWORD *)&retstr->mSampleRate = *v4;
  *(_OWORD *)&retstr->mBytesPerPacket = v5;
  *(void *)&retstr->mBitsPerChannel = *((void *)v4 + 4);
  return self;
}

- (BOOL)testModeEnabled
{
  return self->_testModeEnabled;
}

- (void)setTestModeEnabled:(BOOL)a3
{
  self->_testModeEnabled = a3;
}

- (void).cxx_destruct
{
  begin = self->_timestamp.mTimestamps.__begin_;
  if (begin)
  {
    self->_timestamp.mTimestamps.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_silenceFrameData, 0LL);
  objc_storeStrong((id *)&self->_silenceFramesTimer, 0LL);
  objc_storeStrong((id *)&self->_timelineChangeGroup, 0LL);
  objc_storeStrong((id *)&self->_timelineChangeQueue, 0LL);
  objc_storeStrong((id *)&self->_workQueue, 0LL);
  objc_storeStrong((id *)&self->_inputStream, 0LL);
}

- (id).cxx_construct
{
  p_timestamp = &self->_timestamp;
  self->_timestamp.unint64_t hostTimeForZeroSampleTime = 0LL;
  self->_timestamp.double hostTimeFrequency = 1.0;
  *(_OWORD *)&self->_timestamp.unint64_t networkTimeForZeroSampleTime = xmmword_C1F0;
  __int128 v5 = 0uLL;
  uint64_t v6 = 0LL;
  sub_A148(&self->_timestamp.mTimestamps.__begin_, 4uLL, &v5);
  p_timestamp->mTimestampIndex.__a_.__a_value = 0LL;
  return self;
}

@end