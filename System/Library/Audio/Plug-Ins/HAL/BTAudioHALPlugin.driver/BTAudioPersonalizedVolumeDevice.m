@interface BTAudioPersonalizedVolumeDevice
- (BTAudioPersonalizedVolumeDevice)init;
- (BTAudioPersonalizedVolumeDevice)initWithBluetoothInfo:(unsigned int)a3 deviceAddr:(id)a4;
- (OS_dispatch_queue)avNotificationMonitorQueue;
- (id).cxx_construct;
- (id)_getCurrentManualVolumeUpdatesDictionary:(id)a3 forCoreAnalyticSubmission:(BOOL)a4;
- (id)getVolumeForCurrentAudioCategory:(id)a3;
- (unsigned)_getCurrentAudioCategoryFromString:(id)a3;
- (unsigned)_getManualVolumeUpdateReasonFromString:(id)a3;
- (void)NotifyManualVolumeChanged:(id)a3 shouldUpdateBuds:(BOOL)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setAvNotificationMonitorQueue:(id)a3;
- (void)startManualVolumeUpdateTimer;
- (void)updateVolumeActiveAudioCategoryMap:(unsigned __int8)a3 audioCategory:(id)a4;
@end

@implementation BTAudioPersonalizedVolumeDevice

- (BTAudioPersonalizedVolumeDevice)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BTAudioPersonalizedVolumeDevice;
  result = -[BTAudioPersonalizedVolumeDevice init](&v3, "init");
  result->_sendManualVolumeUpdate = 1;
  result->_manualUpdateDispatchBlock = 0LL;
  return result;
}

- (BTAudioPersonalizedVolumeDevice)initWithBluetoothInfo:(unsigned int)a3 deviceAddr:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BTAudioPersonalizedVolumeDevice;
  v6 = -[BTAudioPersonalizedVolumeDevice init](&v10, "init");
  v6->_deviceID = a3;
  v6->_bdAddr = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", a4);
  v6->_sendManualVolumeUpdate = 1;
  v6->_manualUpdateDispatchBlock = 0LL;
  v7 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 3LL);
  v6->_volumeAudioCategoryMap = v7;
  -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 100LL),  @"Audio/Video");
  -[NSMutableDictionary setObject:forKey:]( v6->_volumeAudioCategoryMap,  "setObject:forKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 100LL),  @"PhoneCall");
  -[NSMutableDictionary setObject:forKey:]( v6->_volumeAudioCategoryMap,  "setObject:forKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 100LL),  @"VoiceCommand");
  v8 = (os_log_s *)qword_95988;
  if (os_log_type_enabled((os_log_t)qword_95988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = a4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Initializing Personalized Volume Device %@ ", buf, 0xCu);
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BTAudioPersonalizedVolumeDevice;
  -[BTAudioPersonalizedVolumeDevice dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  bdAddr = self->_bdAddr;
  if (bdAddr)
  {

    self->_bdAddr = 0LL;
  }

  id manualUpdateDispatchBlock = self->_manualUpdateDispatchBlock;
  if (manualUpdateDispatchBlock)
  {
    if (!dispatch_block_testcancel(self->_manualUpdateDispatchBlock))
    {
      dispatch_block_cancel(manualUpdateDispatchBlock);
      id manualUpdateDispatchBlock = self->_manualUpdateDispatchBlock;
    }

    _Block_release(manualUpdateDispatchBlock);
    self->_id manualUpdateDispatchBlock = 0LL;
  }

  volumeAudioCategoryMap = self->_volumeAudioCategoryMap;
  if (volumeAudioCategoryMap)
  {

    self->_volumeAudioCategoryMap = 0LL;
  }

- (void)updateVolumeActiveAudioCategoryMap:(unsigned __int8)a3 audioCategory:(id)a4
{
  if (!a4)
  {
    uint64_t v8 = qword_95988;
    if (!os_log_type_enabled((os_log_t)qword_95988, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v14) = 0;
    v9 = "BTAudioAVNotificationMonitor: returning as audioCategory is nil";
    objc_super v10 = (os_log_s *)v8;
    uint32_t v11 = 2;
    goto LABEL_13;
  }

  uint64_t v5 = a3;
  if ([a4 isEqualToString:kMXSessionAudioCategory_PhoneCall])
  {
    v7 = @"PhoneCall";
LABEL_10:
    -[NSMutableDictionary removeObjectForKey:](self->_volumeAudioCategoryMap, "removeObjectForKey:", v7);
    -[NSMutableDictionary setObject:forKey:]( self->_volumeAudioCategoryMap,  "setObject:forKey:",  +[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v5),  v7);
    goto LABEL_11;
  }

  if ([a4 isEqualToString:kMXSessionAudioCategory_AudioVideo])
  {
    v7 = @"Audio/Video";
    goto LABEL_10;
  }

  if ([a4 isEqualToString:kMXSessionAudioCategory_VoiceCommand])
  {
    v7 = @"VoiceCommand";
    goto LABEL_10;
  }

- (id)getVolumeForCurrentAudioCategory:(id)a3
{
  uint64_t v5 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
  if (a3)
  {
    if ([a3 isEqualToString:kMXSessionAudioCategory_PhoneCall])
    {
      if (-[NSMutableDictionary objectForKeyedSubscript:]( self->_volumeAudioCategoryMap,  "objectForKeyedSubscript:",  @"PhoneCall"))
      {
        volumeAudioCategoryMap = self->_volumeAudioCategoryMap;
        v7 = @"PhoneCall";
        return -[NSMutableDictionary objectForKeyedSubscript:](volumeAudioCategoryMap, "objectForKeyedSubscript:", v7);
      }

      return +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
    }

    if ([a3 isEqualToString:kMXSessionAudioCategory_AudioVideo])
    {
      if (-[NSMutableDictionary objectForKeyedSubscript:]( self->_volumeAudioCategoryMap,  "objectForKeyedSubscript:",  @"Audio/Video"))
      {
        volumeAudioCategoryMap = self->_volumeAudioCategoryMap;
        v7 = @"Audio/Video";
        return -[NSMutableDictionary objectForKeyedSubscript:](volumeAudioCategoryMap, "objectForKeyedSubscript:", v7);
      }

      return +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
    }

    if ([a3 isEqualToString:kMXSessionAudioCategory_VoiceCommand])
    {
      if (-[NSMutableDictionary objectForKeyedSubscript:]( self->_volumeAudioCategoryMap,  "objectForKeyedSubscript:",  @"VoiceCommand"))
      {
        volumeAudioCategoryMap = self->_volumeAudioCategoryMap;
        v7 = @"VoiceCommand";
        return -[NSMutableDictionary objectForKeyedSubscript:](volumeAudioCategoryMap, "objectForKeyedSubscript:", v7);
      }

      return +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
    }

    uint32_t v11 = (os_log_s *)qword_95988;
    if (os_log_type_enabled((os_log_t)qword_95988, OS_LOG_TYPE_ERROR)) {
      sub_58A20((uint64_t)a3, v11);
    }
    return +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
  }

  else
  {
    uint64_t v8 = v5;
    v9 = (os_log_s *)qword_95988;
    if (os_log_type_enabled((os_log_t)qword_95988, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "BTAudioAVNotificationMonitor: returning as audioCategory is nil",  v12,  2u);
    }
  }

  return v8;
}

- (unsigned)_getManualVolumeUpdateReasonFromString:(id)a3
{
  return 0;
}

- (unsigned)_getCurrentAudioCategoryFromString:(id)a3
{
  return 0;
}

- (id)_getCurrentManualVolumeUpdatesDictionary:(id)a3 forCoreAnalyticSubmission:(BOOL)a4
{
  v7 = (NSNumber *)[a3 objectForKeyedSubscript:@"CurrentAudioCategory"];
  if (a4)
  {
    uint64_t v8 = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  -[BTAudioPersonalizedVolumeDevice _getCurrentAudioCategoryFromString:]( self,  "_getCurrentAudioCategoryFromString:",  [a3 objectForKeyedSubscript:@"CurrentAudioCategory"]));
    [a3 objectForKeyedSubscript:@"ReasonForManualUpdate"];
    v9 = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  -[BTAudioPersonalizedVolumeDevice _getManualVolumeUpdateReasonFromString:]( self,  "_getManualVolumeUpdateReasonFromString:",  [a3 objectForKeyedSubscript:@"ReasonForManualUpdate"]));
  }

  else
  {
    uint64_t v8 = v7;
    v9 = (NSNumber *)[a3 objectForKeyedSubscript:@"ReasonForManualUpdate"];
  }

  objc_super v10 = v9;
  v12[0] = @"CurrentAudioCategory";
  v12[1] = @"CurrentVolume";
  v13[0] = v8;
  v13[1] = -[BTAudioPersonalizedVolumeDevice getVolumeForCurrentAudioCategory:]( self,  "getVolumeForCurrentAudioCategory:",  [a3 objectForKeyedSubscript:@"CurrentAudioCategory"]);
  v12[2] = @"IsPersonalizedVolumeUpdate";
  v13[2] = objc_msgSend(a3, "objectForKeyedSubscript:");
  v12[3] = @"ManualVolumeUpdate";
  v13[3] = objc_msgSend(a3, "objectForKeyedSubscript:");
  v12[4] = @"RampInProgress";
  v13[4] = objc_msgSend(a3, "objectForKeyedSubscript:");
  v12[5] = @"PersonalizedVolumeEnabled";
  v13[5] = objc_msgSend(a3, "objectForKeyedSubscript:");
  v12[6] = @"BundleID";
  v12[7] = @"ReasonForManualUpdate";
  v13[6] = objc_msgSend(a3, "objectForKeyedSubscript:");
  v13[7] = v10;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  8LL);
}

- (void)NotifyManualVolumeChanged:(id)a3 shouldUpdateBuds:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (os_log_s *)qword_95988;
  if (os_log_type_enabled((os_log_t)qword_95988, OS_LOG_TYPE_DEFAULT))
  {
    BOOL sendManualVolumeUpdate = self->_sendManualVolumeUpdate;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v17 = sendManualVolumeUpdate;
    *(_WORD *)&v17[4] = 2112;
    *(void *)&v17[6] = a3;
    __int16 v18 = 1024;
    LODWORD(v19) = v4;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "BTAudioPersonalizedVolumeDevice::NotifyManualVolumeChanged _sendManualVolumeUpdate %d manualVolumeUpdate %@ shouldUpdateBuds %d",  buf,  0x18u);
  }

  if (self->_sendManualVolumeUpdate)
  {
    -[BTAudioPersonalizedVolumeDevice startManualVolumeUpdateTimer](self, "startManualVolumeUpdateTimer");
    id v9 = -[BTAudioPersonalizedVolumeDevice _getCurrentManualVolumeUpdatesDictionary:forCoreAnalyticSubmission:]( self,  "_getCurrentManualVolumeUpdatesDictionary:forCoreAnalyticSubmission:",  a3,  1LL);
    id v10 = -[BTAudioPersonalizedVolumeDevice _getCurrentManualVolumeUpdatesDictionary:forCoreAnalyticSubmission:]( self,  "_getCurrentManualVolumeUpdatesDictionary:forCoreAnalyticSubmission:",  a3,  0LL);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100F0;
    v15[3] = &unk_81B90;
    v15[4] = v9;
    int v11 = AnalyticsSendEventLazy(@"com.apple.Bluetooth.PersonalizedVolumeManualUpdateV2", v15);
    uint64_t v12 = (os_log_s *)qword_95988;
    if (os_log_type_enabled((os_log_t)qword_95988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v17 = @"com.apple.Bluetooth.PersonalizedVolumeManualUpdateV2";
      *(_WORD *)&v17[8] = 1024;
      *(_DWORD *)&v17[10] = v11;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "BT Stats for metric '%@' sent to CoreAnalytics with result %u manualVolumeUpdate: %@",  buf,  0x1Cu);
    }

    if (v4)
    {
      unsigned int deviceID = self->_deviceID;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100F8;
      v14[3] = &unk_81BB8;
      v14[4] = self;
      v14[5] = v10;
      sub_3E3BC(qword_962E8, deviceID, v14);
    }
  }

  -[BTAudioPersonalizedVolumeDevice updateVolumeActiveAudioCategoryMap:audioCategory:]( self,  "updateVolumeActiveAudioCategoryMap:audioCategory:",  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"ManualVolumeUpdate"), "intValue"),  objc_msgSend(a3, "objectForKeyedSubscript:", @"CurrentAudioCategory"));
}

- (void)startManualVolumeUpdateTimer
{
  id manualUpdateDispatchBlock = self->_manualUpdateDispatchBlock;
  if (manualUpdateDispatchBlock)
  {
    if (!dispatch_block_testcancel(self->_manualUpdateDispatchBlock))
    {
      dispatch_block_cancel(manualUpdateDispatchBlock);
      id manualUpdateDispatchBlock = self->_manualUpdateDispatchBlock;
    }

    _Block_release(manualUpdateDispatchBlock);
    self->_id manualUpdateDispatchBlock = 0LL;
  }

  self->_BOOL sendManualVolumeUpdate = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10220;
  block[3] = &unk_81BE0;
  block[4] = self;
  self->_id manualUpdateDispatchBlock = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
  avNotificationMonitorQueue = (dispatch_queue_s *)self->_avNotificationMonitorQueue;
  dispatch_time_t v5 = dispatch_time(0LL, 1000000000LL);
  dispatch_after(v5, avNotificationMonitorQueue, self->_manualUpdateDispatchBlock);
}

- (OS_dispatch_queue)avNotificationMonitorQueue
{
  return self->_avNotificationMonitorQueue;
}

- (void)setAvNotificationMonitorQueue:(id)a3
{
  self->_avNotificationMonitorQueue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end