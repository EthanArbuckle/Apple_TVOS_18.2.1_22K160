@interface SDProximityController
+ (SDProximityController)sharedController;
- (NSMutableDictionary)deviceIdToCurrentPreset;
- (SDProximityController)init;
- (int64_t)_deviceToPreset:(id)a3;
- (unint64_t)checkDeviceRegion:(id)a3;
- (void)_newDeviceOrRegion:(id)a3 region:(id)a4;
- (void)_notifyRegionLost:(id)a3;
- (void)_removeDevice:(id)a3;
- (void)_runSession;
- (void)_triggerDeviceProximity:(id)a3;
- (void)clearDeviceList;
- (void)notifyDeviceLost:(id)a3;
- (void)restart;
- (void)sender:(id)a3 _notifyBluetoothSample:(id)a4 withId:(id)a5 forType:(unint64_t)a6;
- (void)sender:(id)a3 notifyBluetoothSample:(id)a4;
- (void)sender:(id)a3 notifyBluetoothSample:(id)a4 forType:(unint64_t)a5;
- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6;
- (void)sessionBegan;
- (void)sessionDidStartRunning:(id)a3;
- (void)sessionSuspensionEnded:(id)a3;
- (void)sessionWasSuspended:(id)a3;
@end

@implementation SDProximityController

+ (SDProximityController)sharedController
{
  if (qword_100656E38 != -1) {
    dispatch_once(&qword_100656E38, &stru_1005CBE98);
  }
  return (SDProximityController *)(id)qword_100656E40;
}

- (SDProximityController)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SDProximityController;
  v2 = -[SDProximityController init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    deviceIdToDelegate = v3->_deviceIdToDelegate;
    v3->_deviceIdToDelegate = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    deviceIdToPairingAgentDeviceID = v3->_deviceIdToPairingAgentDeviceID;
    v3->_deviceIdToPairingAgentDeviceID = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    deviceIdToCurrentPreset = v3->_deviceIdToCurrentPreset;
    v3->_deviceIdToCurrentPreset = v8;

    *(int64x2_t *)&v3->_currentRestartDelay = vdupq_n_s64(3uLL);
    v3->_currentRestartCount = 0LL;
    -[SDProximityController _runSession](v3, "_runSession");
  }

  return v3;
}

- (void)sender:(id)a3 notifyBluetoothSample:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = 2 * ([v6 deviceActionType] == 36);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
  -[SDProximityController sender:_notifyBluetoothSample:withId:forType:]( self,  "sender:_notifyBluetoothSample:withId:forType:",  v7,  v6,  v9,  v8);
}

- (void)sender:(id)a3 notifyBluetoothSample:(id)a4 forType:(unint64_t)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = v8;
  if ((a5 | 2) == 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);
    -[SDProximityController sender:_notifyBluetoothSample:withId:forType:]( self,  "sender:_notifyBluetoothSample:withId:forType:",  v11,  v9,  v10,  a5);
  }
}

- (void)notifyDeviceLost:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = sub_10004E330();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceIdToDelegate, "allKeys"));
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "removing device: %@ from list: %@",  (uint8_t *)&v9,  0x16u);
  }

  os_unfair_lock_unlock(&self->_lock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
  -[SDProximityController _removeDevice:](self, "_removeDevice:", v8);
}

- (void)clearDeviceList
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = sub_10004E330();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    deviceIdToCurrentPreset = self->_deviceIdToCurrentPreset;
    int v7 = 138412290;
    id v8 = deviceIdToCurrentPreset;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "clearing deviceIdToCurrentPreset: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[NSMutableDictionary removeAllObjects](self->_deviceIdToCurrentPreset, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_deviceIdToDelegate, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_deviceIdToPairingAgentDeviceID, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)sender:(id)a3 _notifyBluetoothSample:(id)a4 withId:(id)a5 forType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned int v13 = [v11 rssi];
  if ((v13 & 0x80000000) == 0) {
    goto LABEL_11;
  }
  int v14 = v13;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  deviceIdToDelegate = self->_deviceIdToDelegate;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceIdentifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](deviceIdToDelegate, "setObject:forKeyedSubscript:", v10, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 pairingAgentDeviceIdentifier]);
  deviceIdToPairingAgentDeviceID = self->_deviceIdToPairingAgentDeviceID;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceIdentifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( deviceIdToPairingAgentDeviceID,  "setObject:forKeyedSubscript:",  v18,  v20);

  os_unfair_lock_unlock(&self->_lock);
  id v21 = [v11 channel];
  switch(a6)
  {
    case 3uLL:
      id v29 = objc_alloc(&OBJC_CLASS___NIBluetoothSample);
      double v30 = (double)v14;
      v31 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v11 model]);
      id v26 = [v29 initWithRSSI:v31 identifier:v32 model:v21 channel:v30 machContinuousTimeSeconds:(double)mach_continuous_time()];

      os_unfair_lock_lock(&self->_lock);
      niSessions = self->_niSessions;
      v28 = &off_1005F7540;
      goto LABEL_8;
    case 2uLL:
      id v33 = objc_alloc(&OBJC_CLASS___NIBluetoothSample);
      double v34 = (double)v14;
      v35 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
      id v26 = [v33 initWithRSSI:v35 identifier:@"DovePeace" model:v21 channel:v34 machContinuousTimeSeconds:(double)mach_continuous_time()];

      os_unfair_lock_lock(&self->_lock);
      niSessions = self->_niSessions;
      v28 = &off_1005F7528;
      goto LABEL_8;
    case 1uLL:
      id v22 = objc_alloc(&OBJC_CLASS___NIBluetoothSample);
      double v23 = (double)v14;
      v24 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v11 model]);
      id v26 = [v22 initWithRSSI:v24 identifier:v25 model:v21 channel:v23 machContinuousTimeSeconds:(double)mach_continuous_time()];

      os_unfair_lock_lock(&self->_lock);
      niSessions = self->_niSessions;
      v28 = &off_1005F7510;
LABEL_8:
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](niSessions, "objectForKeyedSubscript:", v28));
      os_unfair_lock_unlock(p_lock);
      goto LABEL_9;
  }

  id v38 = (id)objc_claimAutoreleasedReturnValue([v11 model]);
  if (([v38 isEqual:@"AirPods1,1"] & 1) != 0
    || ([v38 isEqual:@"AirPods1,3"] & 1) != 0
    || [v38 isEqual:@"AirPodsPro1,1"])
  {
  }

  else
  {
    id v42 = [[SFHeadphoneProduct alloc] initWithBluetoothModel:v38];
    unsigned int v43 = [v42 isAirPods];

    if (!v43)
    {

      goto LABEL_22;
    }
  }

  int v39 = _os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider");

  if (!v39)
  {
LABEL_22:
    id v44 = objc_alloc(&OBJC_CLASS___NIBluetoothSample);
    double v45 = (double)v14;
    v46 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v11 model]);
    id v26 = [v44 initWithRSSI:v46 identifier:v47 model:v21 channel:v45 machContinuousTimeSeconds:(double)mach_continuous_time()];

    int64_t v48 = -[SDProximityController _deviceToPreset:](self, "_deviceToPreset:", v11);
    if (!v48)
    {
      id v54 = sub_10004E330();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v55 = [v11 deviceActionType];
        v56 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
        int v57 = 67109378;
        LODWORD(v58[0]) = v55;
        WORD2(v58[0]) = 2112;
        *(void *)((char *)v58 + 6) = v56;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "unexpected action type: %d for device: %@",  (uint8_t *)&v57,  0x12u);
      }

      goto LABEL_10;
    }

    int64_t v49 = v48;
    os_unfair_lock_lock(&self->_lock);
    v50 = self->_niSessions;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v49));
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v50, "objectForKeyedSubscript:", v51));

    os_unfair_lock_unlock(p_lock);
    id v52 = sub_10004E330();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      int v57 = 138412290;
      v58[0] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Notify Bluetooth Sample with ID: %@, SDProximityController forwarding sample to NI",  (uint8_t *)&v57,  0xCu);
    }

LABEL_9:
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s devicePresenceNotifier](v36, "devicePresenceNotifier"));
    [v37 notifyBluetoothSample:v26];

LABEL_10:
    goto LABEL_11;
  }

  id v40 = sub_10004E330();
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    int v57 = 138412290;
    v58[0] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEBUG,  "Notify Bluetooth Sample with ID: %@, SDProximityController not sending to NI",  (uint8_t *)&v57,  0xCu);
  }

LABEL_11:
}

- (unint64_t)checkDeviceRegion:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);

  if (v6)
  {
    deviceIdToCurrentPreset = self->_deviceIdToCurrentPreset;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( deviceIdToCurrentPreset,  "objectForKeyedSubscript:",  v8));
    unsigned __int8 v10 = [v9 isEqual:&off_1005F7510];

    if ((v10 & 1) != 0)
    {
      unint64_t v11 = 1LL;
    }

    else
    {
      id v12 = self->_deviceIdToCurrentPreset;
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
      int v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));
      unsigned __int8 v15 = [v14 isEqual:&off_1005F7528];

      if ((v15 & 1) != 0)
      {
        unint64_t v11 = 2LL;
      }

      else
      {
        v16 = self->_deviceIdToCurrentPreset;
        v17 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v17));
        unsigned __int8 v19 = [v18 isEqual:&off_1005F7558];

        if ((v19 & 1) != 0)
        {
          unint64_t v11 = 3LL;
        }

        else
        {
          v20 = self->_deviceIdToCurrentPreset;
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v21));
          unsigned int v23 = [v22 isEqual:&off_1005F7540];

          if (v23) {
            unint64_t v11 = 4LL;
          }
          else {
            unint64_t v11 = 0LL;
          }
        }
      }
    }
  }

  else
  {
    unint64_t v11 = 0LL;
  }

  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (void)_notifyRegionLost:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);

  int v7 = -[NSUUID initWithUUIDString:](v5, "initWithUUIDString:", v6);
  -[SDProximityController _removeDevice:](self, "_removeDevice:", v7);
}

- (void)_removeDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_deviceIdToDelegate, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_deviceIdToPairingAgentDeviceID, "removeObjectForKey:", v4);
  id v5 = sub_10004E330();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    deviceIdToCurrentPreset = self->_deviceIdToCurrentPreset;
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    int v14 = deviceIdToCurrentPreset;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "removing devicepresetid: %@ from presetidlist: %@",  (uint8_t *)&v11,  0x16u);
  }

  id v8 = sub_10004E330();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableDictionary count](self->_deviceIdToDelegate, "count")));
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    int v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "removing devicepresetid: %@ from delegatelist size: %@",  (uint8_t *)&v11,  0x16u);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_deviceIdToCurrentPreset, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_deviceIdToDelegate, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_triggerDeviceProximity:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceIdToDelegate,  "objectForKeyedSubscript:",  v4));
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceIdToPairingAgentDeviceID,  "objectForKeyedSubscript:",  v4));
    os_unfair_lock_unlock(p_lock);
    [v6 proximityDeviceDidTrigger:v7];
  }

  else
  {
    id v8 = sub_10004E330();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Don't have a delegate to call for device with identifier: %@",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (void)_newDeviceOrRegion:(id)a3 region:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  int v9 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);

  __int16 v13 = -[NSUUID initWithUUIDString:](v9, "initWithUUIDString:", v10);
  id v11 = [v7 devicePresencePreset];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_deviceIdToCurrentPreset,  "setObject:forKeyedSubscript:",  v12,  v13);

  os_unfair_lock_unlock(p_lock);
  -[SDProximityController _triggerDeviceProximity:](self, "_triggerDeviceProximity:", v13);
}

- (void)_runSession
{
  v55[0] = &off_1005F7510;
  v3 = objc_alloc_init(&OBJC_CLASS___NISession);
  v56[0] = v3;
  v55[1] = &off_1005F7528;
  id v4 = objc_alloc_init(&OBJC_CLASS___NISession);
  v56[1] = v4;
  v55[2] = &off_1005F7558;
  id v5 = objc_alloc_init(&OBJC_CLASS___NISession);
  v56[2] = v5;
  v55[3] = &off_1005F7540;
  id v6 = objc_alloc_init(&OBJC_CLASS___NISession);
  v56[3] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  4LL));

  id v8 = self;
  os_unfair_lock_lock(&self->_lock);
  int v9 = (NSDictionary *)[v7 copy];
  niSessions = self->_niSessions;
  self->_niSessions = v9;

  id v11 = objc_alloc_init(&OBJC_CLASS___NISession);
  niAirPodsSession = self->_niAirPodsSession;
  self->_niAirPodsSession = v11;

  os_unfair_lock_unlock(&self->_lock);
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v46 objects:v54 count:16];
  id v42 = v13;
  if (v14)
  {
    id v16 = v14;
    uint64_t v43 = *(void *)v47;
    *(void *)&__int128 v15 = 138412546LL;
    __int128 v41 = v15;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v47 != v43) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v17);
        id v19 = [[NIRegionPredicate alloc] initWithName:@"sensorMax" devicePresencePreset:5];
        v20 = (NISession *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v18]);
        id v21 = 0LL;
        switch([v18 intValue])
        {
          case 1u:
            id v22 = objc_alloc(&OBJC_CLASS___NIRegionPredicate);
            unsigned int v23 = @"immediate";
            uint64_t v24 = 1LL;
            goto LABEL_11;
          case 2u:
            id v22 = objc_alloc(&OBJC_CLASS___NIRegionPredicate);
            unsigned int v23 = @"near";
            uint64_t v24 = 2LL;
            goto LABEL_11;
          case 3u:
            id v22 = objc_alloc(&OBJC_CLASS___NIRegionPredicate);
            unsigned int v23 = @"desk";
            uint64_t v24 = 3LL;
            goto LABEL_11;
          case 6u:
            id v22 = objc_alloc(&OBJC_CLASS___NIRegionPredicate);
            unsigned int v23 = @"superImmediate";
            uint64_t v24 = 6LL;
LABEL_11:
            id v21 = objc_msgSend(v22, "initWithName:devicePresencePreset:", v23, v24, v41);
            break;
          default:
            break;
        }

        id v25 = objc_alloc(&OBJC_CLASS___NIDevicePresenceConfiguration);
        id v45 = 0LL;
        id v26 = [v25 initWithInnerBoundary:v21 outerBoundary:v19 error:&v45];
        id v27 = v45;
        [v26 setAllowedDevices:0];
        -[NISession setDelegate:](v20, "setDelegate:", v8);
        id v28 = sub_10004E330();
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          double v30 = v8;
          v31 = (void *)objc_claimAutoreleasedReturnValue([v26 description]);
          *(_DWORD *)buf = v41;
          v51 = v20;
          __int16 v52 = 2112;
          v53 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "starting nisession:%@, with configuration:%@",  buf,  0x16u);

          id v8 = v30;
          id v13 = v42;
        }

        -[NISession runWithConfiguration:](v20, "runWithConfiguration:", v26);
        v17 = (char *)v17 + 1;
      }

      while (v16 != v17);
      id v16 = [v13 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }

    while (v16);
  }

  if (_os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider"))
  {
    id v32 = [[NIRegionPredicate alloc] initWithName:@"immediate" devicePresencePreset:1];
    id v33 = v8;
    id v34 = [[NIRegionPredicate alloc] initWithName:@"sensorMax" devicePresencePreset:5];
    id v44 = 0LL;
    id v35 = [[NIDevicePresenceConfiguration alloc] initWithInnerBoundary:v32 outerBoundary:v34 error:&v44];
    id v36 = v44;
    [v35 setAllowedDevices:8];
    -[NISession setDelegate:](v33->_niAirPodsSession, "setDelegate:", v33);
    id v37 = sub_10004E330();
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = v33->_niAirPodsSession;
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v35 description]);
      *(_DWORD *)buf = 138412546;
      v51 = v39;
      id v13 = v42;
      __int16 v52 = 2112;
      v53 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "starting nisession:%@, with configuration:%@",  buf,  0x16u);
    }

    -[NISession runWithConfiguration:](v33->_niAirPodsSession, "runWithConfiguration:", v35);
  }
}

- (int64_t)_deviceToPreset:(id)a3
{
  id v3 = a3;
  if ([v3 deviceActionType] == 24
    || [v3 deviceActionType] == 5)
  {
    goto LABEL_3;
  }

  unsigned int v6 = [v3 deviceActionType];
  int64_t v4 = 1LL;
  if (v6 != 11 && v6 != 33)
  {
    if ([v3 deviceActionType] == 36
      || ([v3 needsSetup] & 1) != 0)
    {
      goto LABEL_3;
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue([v3 model]);
    if (([v7 isEqual:@"AirPods1,1"] & 1) != 0
      || ([v7 isEqual:@"AirPods1,3"] & 1) != 0
      || ([v7 isEqual:@"AirPodsPro1,1"] & 1) != 0
      || ([v7 isEqual:@"PowerbeatsPro1,1"] & 1) != 0
      || [v7 isEqual:@"Device1,8202"])
    {

LABEL_3:
      int64_t v4 = 1LL;
      goto LABEL_4;
    }

    id v8 = [[SFHeadphoneProduct alloc] initWithBluetoothModel:v7];
    unsigned __int8 v9 = [v8 showsStatus];

    if ((v9 & 1) != 0) {
      goto LABEL_3;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
    unsigned __int8 v11 = [v10 isEqual:@"Device1,21760"];

    if ((v11 & 1) != 0) {
      goto LABEL_3;
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
    unsigned __int8 v13 = [&off_1005FAD60 containsObject:v12];

    if ((v13 & 1) != 0) {
      int64_t v4 = 2LL;
    }
    else {
      int64_t v4 = ([v3 deviceFlags] >> 11) & 1;
    }
  }

- (NSMutableDictionary)deviceIdToCurrentPreset
{
  return self->_deviceIdToCurrentPreset;
}

- (void).cxx_destruct
{
}

- (void)sessionBegan
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = sub_10004E330();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t currentRestartDelay = self->_currentRestartDelay;
    int v7 = 134217984;
    unint64_t v8 = currentRestartDelay;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "session started, resetting previous delay: %llu",  (uint8_t *)&v7,  0xCu);
  }

  self->_unint64_t currentRestartDelay = self->_defaultRestartDelay;
  os_unfair_lock_unlock(p_lock);
}

- (void)restart
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = self->_currentRestartCount + 1;
  self->_unint64_t currentRestartCount = v4;
  if (v4 >= -[NSDictionary count](self->_niSessions, "count"))
  {
    niSessions = self->_niSessions;
    self->_niSessions = 0LL;

    niAirPodsSession = self->_niAirPodsSession;
    self->_niAirPodsSession = 0LL;

    self->_unint64_t currentRestartCount = 0LL;
    unint64_t currentRestartDelay = self->_currentRestartDelay;
    self->_unint64_t currentRestartDelay = 2 * currentRestartDelay;
    os_unfair_lock_unlock(p_lock);
    id v12 = sub_10004E330();
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v20 = currentRestartDelay;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "restarting session with delay: %llu (s)",  buf,  0xCu);
    }

    dispatch_time_t v14 = dispatch_time(0LL, 1000000000 * currentRestartDelay);
    uint64_t v16 = SFMainQueue(v14, v15);
    v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004F8D4;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_after(v14, v17, block);
  }

  else
  {
    os_unfair_lock_unlock(p_lock);
    id v5 = sub_10004E330();
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t currentRestartCount = self->_currentRestartCount;
      NSUInteger v8 = -[NSDictionary count](self->_niSessions, "count");
      *(_DWORD *)buf = 134218240;
      unint64_t v20 = currentRestartCount;
      __int16 v21 = 2048;
      NSUInteger v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "restart count is: %llu out of %lu",  buf,  0x16u);
    }
  }

- (void)sessionDidStartRunning:(id)a3
{
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v4 = sub_10004E330();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didUpdateNearbyObjects", v6, 2u);
  }
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  id v4 = a4;
  id v5 = sub_10004E330();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
    int v8 = 136315138;
    id v9 = [v7 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "didDiscoverNearbyObject object: %s",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_10004E330();
  unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);
    id v13 = [v12 UTF8String];
    id v14 = objc_claimAutoreleasedReturnValue([v9 description]);
    int v15 = 136315394;
    id v16 = v13;
    __int16 v17 = 2080;
    id v18 = [v14 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "didUpdateRegion object: %s newRegion: %s",  (uint8_t *)&v15,  0x16u);
  }

  if (v9 && [v9 devicePresencePreset] != (id)5) {
    -[SDProximityController _newDeviceOrRegion:region:](self, "_newDeviceOrRegion:region:", v8, v9);
  }
  else {
    -[SDProximityController _notifyRegionLost:](self, "_notifyRegionLost:", v8);
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_10004E330();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "didFailWithError error: %@",  (uint8_t *)&v8,  0xCu);
  }

  -[SDProximityController restart](self, "restart");
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_10004E330();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "didInvalidateWithError  error: %@",  (uint8_t *)&v8,  0xCu);
  }

  -[SDProximityController restart](self, "restart");
}

- (void)sessionWasSuspended:(id)a3
{
  id v3 = sub_10004E330();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "sessionWasSuspended waiting for ended suspension to resume. This should happen when bt is toggled back on",  v5,  2u);
  }
}

- (void)sessionSuspensionEnded:(id)a3
{
  id v4 = sub_10004E330();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "sessionSuspensionEnded attempting to resume",  v6,  2u);
  }

  -[SDProximityController restart](self, "restart");
}

@end