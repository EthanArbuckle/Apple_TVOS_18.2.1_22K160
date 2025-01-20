@interface CMContinuityCaptureAudioPlugin
+ (id)sharedPlugin;
- (void)_enqueueAudioData:(id)a3 numSamples:(unsigned int)a4 startingSampleTime:(unint64_t)a5 forUID:(id)a6;
- (void)_finishCollectingLatencyMetricsForUniqueID:(int64_t)a3 withReply:(id)a4;
- (void)_startCollectingLatencyMetricsWithUniqueID:(int64_t)a3 forAudioDevic:(id)a4;
- (void)_startFillingSilenceAudioDataIfApplicableForUID:(id)a3;
- (void)_updateAvailableDevices:(id)a3 reportAudioDeviceUIDs:(BOOL)a4;
- (void)_updateNetworkClockWithSynchronizedNetworkTime:(unint64_t)a3 forSampleTime:(unint64_t)a4 networkClockIdentifier:(unint64_t)a5 transportTypeIsUSB:(BOOL)a6 forUID:(id)a7;
- (void)_updateUSBActive:(BOOL)a3 forUID:(id)a4;
- (void)_useCachedNetworkClockIfPossibleForUID:(id)a3;
- (void)audioInputReceiver:(id)a3 enqueueAudioData:(id)a4 numSamples:(unsigned int)a5 startingSampleTime:(unint64_t)a6 forUID:(id)a7;
- (void)audioInputReceiver:(id)a3 finishCollectingLatencyMetricsForUniqueID:(int64_t)a4 withReply:(id)a5;
- (void)audioInputReceiver:(id)a3 startCollectingLatencyMetricsWithUniqueID:(int64_t)a4 forAudioDeviceUID:(id)a5;
- (void)audioInputReceiver:(id)a3 startFillingSilenceAudioDataIfApplicableForUID:(id)a4;
- (void)audioInputReceiver:(id)a3 updateAvailableDevices:(id)a4 reportAudioDeviceUIDs:(BOOL)a5;
- (void)audioInputReceiver:(id)a3 updateNetworkClockWithSynchronizedNetworkTime:(unint64_t)a4 forSampleTime:(unint64_t)a5 networkClockIdentifier:(unint64_t)a6 transportTypeIsUSB:(BOOL)a7 forUID:(id)a8;
- (void)audioInputReceiver:(id)a3 updatePreferences:(id)a4;
- (void)audioInputReceiver:(id)a3 updateUSBActive:(BOOL)a4 forUID:(id)a5;
- (void)audioInputReceiver:(id)a3 useCachedNetworkClockIfPossibleForUID:(id)a4;
- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3;
- (void)startStreamingForAudioDeviceUID:(id)a3 options:(id)a4;
- (void)stopStreamingForAudioDeviceUID:(id)a3;
@end

@implementation CMContinuityCaptureAudioPlugin

+ (id)sharedPlugin
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_43D4;
  block[3] = &unk_103D0;
  block[4] = a1;
  if (qword_156F8 != -1) {
    dispatch_once(&qword_156F8, block);
  }
  return (id)_sharedPlugin;
}

- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CMContinuityCaptureAudioPlugin;
  -[CMContinuityCaptureAudioPlugin halInitializeWithPluginHost:](&v10, "halInitializeWithPluginHost:", a3);
  v4 = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority( [@"com.apple.continuitycapture.audioplugin" UTF8String],  0,  14);
  queue = self->_queue;
  self->_queue = v4;

  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.continuitycapture.audioplugin.metrics", 0LL);
  metricsQueue = self->_metricsQueue;
  self->_metricsQueue = v6;

  v8 = (CMContinuityCaptureAudioInputReceiver *)objc_alloc_init((Class)&OBJC_CLASS___CMContinuityCaptureAudioInputReceiver);
  audioInputReceiver = self->_audioInputReceiver;
  self->_audioInputReceiver = v8;

  -[CMContinuityCaptureAudioInputReceiver setDelegate:](self->_audioInputReceiver, "setDelegate:", self);
  self->_obfuscationEnabled = 1;
}

- (void)startStreamingForAudioDeviceUID:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Start streaming for audio device UID %@ options %@",  buf,  0x16u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4600;
  block[3] = &unk_103F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)stopStreamingForAudioDeviceUID:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Stop streaming for audio device UID %@",  buf,  0xCu);
  }

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_4724;
  v7[3] = &unk_10420;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)audioInputReceiver:(id)a3 updatePreferences:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kCMContinuityCaptureAudioPreferencesKeyObfuscationEnabled]);
  id v7 = v6;
  if (v6)
  {
    int obfuscationEnabled = self->_obfuscationEnabled;
    if (obfuscationEnabled != [v6 BOOLValue])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v9 = self->_obfuscationEnabled;
        int v16 = 67109376;
        *(_DWORD *)id v17 = v9;
        *(_WORD *)&v17[4] = 1024;
        *(_DWORD *)&v17[6] = [v7 BOOLValue];
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Device obfuscation enabled changed from %d to %d",  (uint8_t *)&v16,  0xEu);
      }

      self->_int obfuscationEnabled = [v7 BOOLValue];
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:kCMContinuityCaptureAudioPreferencesKeyTransportLatencyInSeconds]);
  v11 = v10;
  if (v10)
  {
    [v10 doubleValue];
    if (v12 > 2.22044605e-16)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        -[NSNumber doubleValue](self->_transportLatencyInSeconds, "doubleValue");
        uint64_t v14 = v13;
        [v11 doubleValue];
        int v16 = 134218240;
        *(void *)id v17 = v14;
        *(_WORD *)&v17[8] = 2048;
        uint64_t v18 = v15;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Device input latency changed from %f to %f sec",  (uint8_t *)&v16,  0x16u);
      }

      objc_storeStrong((id *)&self->_transportLatencyInSeconds, v11);
    }
  }
}

- (void)audioInputReceiver:(id)a3 updateAvailableDevices:(id)a4 reportAudioDeviceUIDs:(BOOL)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_49AC;
  block[3] = &unk_10448;
  block[4] = self;
  id v11 = v7;
  BOOL v12 = a5;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_updateAvailableDevices:(id)a3 reportAudioDeviceUIDs:(BOOL)a4
{
  BOOL v46 = a4;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_devicesByUIDs)
  {
    id v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    devicesByUIDs = self->_devicesByUIDs;
    self->_devicesByUIDs = v6;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = self->_devicesByUIDs;
    *(_DWORD *)buf = 138412546;
    v60 = v8;
    __int16 v61 = 2112;
    id v62 = v5;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received request to update available devices. Old:\n%@ New:\n%@",  buf,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_devicesByUIDs, "allKeys"));
  id v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_devicesByUIDs, "allKeys"));
    [v9 addObjectsFromArray:v15];

    id v16 = [v9 mutableCopy];
    BOOL v12 = v16;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v18 = [v17 count];

  v47 = v5;
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
    [v10 addObjectsFromArray:v19];

    id v20 = [v10 mutableCopy];
    id v11 = v20;
  }

  v45 = v9;
  [v11 minusSet:v9];
  v44 = v10;
  [v12 minusSet:v10];
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id obj = v11;
  id v21 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v54;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v54 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(NSMutableDictionary **)(*((void *)&v53 + 1) + 8LL * (void)i);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v25;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Publishing device %@", buf, 0xCu);
        }

        if (self->_obfuscationEnabled) {
          v26 = v25;
        }
        else {
          v26 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v25]);
        }
        v27 = v26;
        v28 = @"iPhone Mic";
        if (self->_obfuscationEnabled) {
          v28 = 0LL;
        }
        v29 = v28;
        v30 = -[CMContinuityCaptureAudioDevice initWithDeviceUID:deviceName:modelUID:transportLatencyInSeconds:withPlugin:]( objc_alloc(&OBJC_CLASS___CMContinuityCaptureAudioDevice),  "initWithDeviceUID:deviceName:modelUID:transportLatencyInSeconds:withPlugin:",  v25,  v27,  v29,  self->_transportLatencyInSeconds,  self);

        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_devicesByUIDs,  "setObject:forKeyedSubscript:",  v30,  v25);
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureAudioPlugin sharedPlugin]( &OBJC_CLASS___CMContinuityCaptureAudioPlugin,  "sharedPlugin"));
        [v31 addAudioDevice:v30];
      }

      id v22 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }

    while (v22);
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v32 = v12;
  id v33 = [v32 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v50;
    do
    {
      for (j = 0LL; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v50 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(NSMutableDictionary **)(*((void *)&v49 + 1) + 8LL * (void)j);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v37;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Terminating device %@", buf, 0xCu);
        }

        v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_devicesByUIDs,  "objectForKeyedSubscript:",  v37));
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureAudioPlugin sharedPlugin]( &OBJC_CLASS___CMContinuityCaptureAudioPlugin,  "sharedPlugin"));
        [v39 removeAudioDevice:v38];

        -[NSMutableDictionary removeObjectForKey:](self->_devicesByUIDs, "removeObjectForKey:", v37);
      }

      id v34 = [v32 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }

    while (v34);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_devicesByUIDs, "allKeys"));
  id v42 = [v41 count];

  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_devicesByUIDs, "allKeys"));
    [v40 addObjectsFromArray:v43];
  }

  if (v46) {
    -[CMContinuityCaptureAudioInputReceiver updateAvailableAudioDeviceUIDs:]( self->_audioInputReceiver,  "updateAvailableAudioDeviceUIDs:",  v40);
  }
}

- (void)audioInputReceiver:(id)a3 enqueueAudioData:(id)a4 numSamples:(unsigned int)a5 startingSampleTime:(unint64_t)a6 forUID:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4FF8;
  block[3] = &unk_10470;
  block[4] = self;
  id v17 = v11;
  unsigned int v20 = a5;
  id v18 = v12;
  unint64_t v19 = a6;
  id v14 = v12;
  id v15 = v11;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_enqueueAudioData:(id)a3 numSamples:(unsigned int)a4 startingSampleTime:(unint64_t)a5 forUID:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesByUIDs, "objectForKeyedSubscript:", v11));
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 enqueueAudioData:v10 numSamples:v8 startingSampleTime:a5];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_A4B4();
  }
}

- (void)audioInputReceiver:(id)a3 updateNetworkClockWithSynchronizedNetworkTime:(unint64_t)a4 forSampleTime:(unint64_t)a5 networkClockIdentifier:(unint64_t)a6 transportTypeIsUSB:(BOOL)a7 forUID:(id)a8
{
  id v13 = a8;
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_5174;
  v16[3] = &unk_10498;
  unint64_t v18 = a4;
  unint64_t v19 = a5;
  unint64_t v20 = a6;
  BOOL v21 = a7;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  dispatch_async((dispatch_queue_t)queue, v16);
}

- (void)_updateNetworkClockWithSynchronizedNetworkTime:(unint64_t)a3 forSampleTime:(unint64_t)a4 networkClockIdentifier:(unint64_t)a5 transportTypeIsUSB:(BOOL)a6 forUID:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesByUIDs, "objectForKeyedSubscript:", v12));
  id v14 = v13;
  if (v13)
  {
    [v13 updateNetworkClockWithSynchronizedNetworkTime:a3 forSampleTime:a4 networkClockIdentifier:a5 transportTypeIsUSB:v7];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_A51C();
  }
}

- (void)audioInputReceiver:(id)a3 useCachedNetworkClockIfPossibleForUID:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_52C4;
  v8[3] = &unk_10420;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)_useCachedNetworkClockIfPossibleForUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesByUIDs, "objectForKeyedSubscript:", v4));
  id v6 = v5;
  if (v5)
  {
    [v5 useCachedNetworkClockIfPossible];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_A584();
  }
}

- (void)audioInputReceiver:(id)a3 startFillingSilenceAudioDataIfApplicableForUID:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_53D8;
  v8[3] = &unk_10420;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)_startFillingSilenceAudioDataIfApplicableForUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesByUIDs, "objectForKeyedSubscript:", v4));
  id v6 = v5;
  if (v5)
  {
    [v5 startFillingSilenceAudioDataIfApplicable];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_A5EC();
  }
}

- (void)audioInputReceiver:(id)a3 updateUSBActive:(BOOL)a4 forUID:(id)a5
{
  id v7 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_54FC;
  block[3] = &unk_10448;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_updateUSBActive:(BOOL)a3 forUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesByUIDs, "objectForKeyedSubscript:", v6));
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 updateUSBActive:v4];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_A654();
  }
}

- (void)audioInputReceiver:(id)a3 startCollectingLatencyMetricsWithUniqueID:(int64_t)a4 forAudioDeviceUID:(id)a5
{
  id v7 = a5;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  unint64_t v18 = sub_56CC;
  unint64_t v19 = sub_56DC;
  id v20 = 0LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_56E4;
  block[3] = &unk_104C0;
  id v14 = &v15;
  block[4] = self;
  id v9 = v7;
  id v13 = v9;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (v16[5])
  {
    metricsQueue = self->_metricsQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_5728;
    v11[3] = &unk_104E8;
    v11[5] = &v15;
    v11[6] = a4;
    v11[4] = self;
    dispatch_async((dispatch_queue_t)metricsQueue, v11);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)_startCollectingLatencyMetricsWithUniqueID:(int64_t)a3 forAudioDevic:(id)a4
{
  metricsQueue = self->_metricsQueue;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)metricsQueue);
  if (!self->_latencyMetricsByUniqueID)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    latencyMetricsByUniqueID = self->_latencyMetricsByUniqueID;
    self->_latencyMetricsByUniqueID = v8;
  }

  id v12 = [objc_alloc((Class)CMContinuityCaptureRemoteFrameLatencyMetrics) initWithUniqueID:a3];
  id v10 = self->_latencyMetricsByUniqueID;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, v11);

  [v7 setLatencyMetrics:v12];
}

- (void)audioInputReceiver:(id)a3 finishCollectingLatencyMetricsForUniqueID:(int64_t)a4 withReply:(id)a5
{
  id v7 = a5;
  metricsQueue = self->_metricsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_58A4;
  block[3] = &unk_10510;
  id v11 = v7;
  int64_t v12 = a4;
  block[4] = self;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)metricsQueue, block);
}

- (void)_finishCollectingLatencyMetricsForUniqueID:(int64_t)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_metricsQueue);
  p_latencyMetricsByUniqueID = (uint64_t *)&self->_latencyMetricsByUniqueID;
  latencyMetricsByUniqueID = self->_latencyMetricsByUniqueID;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( latencyMetricsByUniqueID,  "objectForKeyedSubscript:",  v9));

  if (v10)
  {
    [v10 finishCollectingMetrics];
    if (v6) {
      v6[2](v6, v10);
    }
    id v11 = (void *)*p_latencyMetricsByUniqueID;
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    [v11 setObject:0 forKeyedSubscript:v12];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_A6BC(p_latencyMetricsByUniqueID, a3);
  }
}

- (void).cxx_destruct
{
}

@end