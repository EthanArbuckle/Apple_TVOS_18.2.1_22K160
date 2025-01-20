@interface SPSoundSensor
+ (id)sharedSoundSensorModule;
- (BOOL)subscribeToNoiseLevelForClient:(id)a3 callback:(id)a4;
- (BOOL)subscribeToSoundForClient:(id)a3 soundType:(unsigned int)a4 callback:(id)a5;
- (BOOL)unsubscribeFromNoiseLevel:(id)a3;
- (BOOL)unsubscribeFromSound:(id)a3;
- (SPSoundSensor)init;
- (unsigned)currentNoiseLevel;
- (unsigned)getCurrentSoundSensorState:(unsigned int)a3;
- (void)_activate;
- (void)_invalidate;
- (void)activate;
- (void)invalidate;
- (void)setNoiseLevel:(float)a3;
- (void)setSoundProbability:(unsigned int)a3 value:(float)a4;
@end

@implementation SPSoundSensor

+ (id)sharedSoundSensorModule
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003E54;
  block[3] = &unk_10000C2B8;
  block[4] = a1;
  if (qword_100011F40 != -1) {
    dispatch_once(&qword_100011F40, block);
  }
  return (id)qword_100011F38;
}

- (SPSoundSensor)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SPSoundSensor;
  v2 = -[SPSoundSensor init](&v14, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("SPSoundSensor", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    soundSubscribers = v2->_soundSubscribers;
    v2->_soundSubscribers = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    noiseLevelSubscribers = v2->_noiseLevelSubscribers;
    v2->_noiseLevelSubscribers = v9;

    v2->_currentSoundState[2] = 0;
    *(void *)v2->_currentSoundState = 0LL;
    v15[0] = &off_10000C8C0;
    v15[1] = &off_10000C8D8;
    v16[0] = &off_10000C908;
    v16[1] = &off_10000C908;
    v15[2] = &off_10000C8F0;
    v16[2] = &off_10000C908;
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));
    soundTypeToThreshold = v2->_soundTypeToThreshold;
    v2->_soundTypeToThreshold = (NSDictionary *)v11;

    v2->_currentNoiseLevel = 0;
  }

  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004008;
  block[3] = &unk_10000C2E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activate
{
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    if (dword_100011B90 <= 50
      && (dword_100011B90 != -1 || _LogCategory_Initialize(&dword_100011B90, 50LL)))
    {
      LogPrintF(&dword_100011B90, "-[SPSoundSensor _activate]", 50LL, "Activate called");
    }
  }

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000040D8;
  block[3] = &unk_10000C2E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  self->_activateCalled = 0;
}

- (void)setSoundProbability:(unsigned int)a3 value:(float)a4
{
  uint64_t v5 = *(void *)&a3;
  soundTypeToThreshold = self->_soundTypeToThreshold;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](soundTypeToThreshold, "objectForKeyedSubscript:", v8));
  [v9 floatValue];
  float v11 = v10;

  currentSoundState = self->_currentSoundState;
  unsigned int v13 = self->_currentSoundState[(int)v5];
  if (v11 <= a4)
  {
    if ((v13 | 2) != 2) {
      return;
    }
    currentSoundState[(int)v5] = 1;
    if (dword_100011B90 <= 50
      && (dword_100011B90 != -1 || _LogCategory_Initialize(&dword_100011B90, 50LL)))
    {
      LogPrintF( &dword_100011B90,  "-[SPSoundSensor setSoundProbability:value:]",  50LL,  "Sound %s state changed to Present");
    }
  }

  else
  {
    if (v13 > 1) {
      return;
    }
    currentSoundState[(int)v5] = 2;
    if (dword_100011B90 <= 50
      && (dword_100011B90 != -1 || _LogCategory_Initialize(&dword_100011B90, 50LL)))
    {
      LogPrintF( &dword_100011B90,  "-[SPSoundSensor setSoundProbability:value:]",  50LL,  "Sound %s state changed to Absent");
    }
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  objc_super v14 = self->_soundSubscribers;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if ([v19 soundType] == (_DWORD)v5)
        {
          v20 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v19 callback]);
          v20[2](v20, v5, currentSoundState[(int)v5]);
        }
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    }

    while (v16);
  }
}

- (void)setNoiseLevel:(float)a3
{
  if (a3 <= 90.0) {
    int v3 = 5;
  }
  else {
    int v3 = 6;
  }
  if (a3 > 75.0) {
    int v4 = v3;
  }
  else {
    int v4 = 4;
  }
  if (a3 > 60.0) {
    int v5 = v4;
  }
  else {
    int v5 = 3;
  }
  if (a3 > 45.0) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = 2;
  }
  if (a3 >= 30.0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 1LL;
  }
  if ((_DWORD)v7 != self->_currentNoiseLevel)
  {
    self->_currentNoiseLevel = v7;
    if (dword_100011B90 <= 50
      && (dword_100011B90 != -1 || _LogCategory_Initialize(&dword_100011B90, 50LL)))
    {
      LogPrintF(&dword_100011B90, "-[SPSoundSensor setNoiseLevel:]", 50LL, "Noise Level set to %ld", v7);
    }

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    v9 = self->_noiseLevelSubscribers;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_super v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) callback]);
          v14[2](v14, v7);
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v11);
    }
  }

- (unsigned)getCurrentSoundSensorState:(unsigned int)a3
{
  return self->_currentSoundState[a3];
}

- (BOOL)subscribeToSoundForClient:(id)a3 soundType:(unsigned int)a4 callback:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v8 = (void (**)(id, uint64_t, void))a5;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___SoundSubscriber);
  -[SoundSubscriber setClient:](v10, "setClient:", v9);

  -[SoundSubscriber setCallback:](v10, "setCallback:", v8);
  -[SoundSubscriber setSoundType:](v10, "setSoundType:", v5);
  -[NSMutableArray addObject:](self->_soundSubscribers, "addObject:", v10);
  v8[2](v8, v5, self->_currentSoundState[v5]);

  if (dword_100011B90 <= 50 && (dword_100011B90 != -1 || _LogCategory_Initialize(&dword_100011B90, 50LL)))
  {
    else {
      id v11 = off_10000C300[(int)v5];
    }
    LogPrintF( &dword_100011B90,  "-[SPSoundSensor subscribeToSoundForClient:soundType:callback:]",  50LL,  "Subscribing for soundType %s",  v11);
  }

  return 1;
}

- (BOOL)subscribeToNoiseLevelForClient:(id)a3 callback:(id)a4
{
  unsigned int v6 = (void (**)(id, void))a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NoiseLevelSubscriber);
  -[NoiseLevelSubscriber setClient:](v8, "setClient:", v7);

  -[NoiseLevelSubscriber setCallback:](v8, "setCallback:", v6);
  -[NSMutableArray addObject:](self->_noiseLevelSubscribers, "addObject:", v8);
  v6[2](v6, self->_currentNoiseLevel);

  if (dword_100011B90 <= 50 && (dword_100011B90 != -1 || _LogCategory_Initialize(&dword_100011B90, 50LL))) {
    LogPrintF( &dword_100011B90,  "-[SPSoundSensor subscribeToNoiseLevelForClient:callback:]",  50LL,  "Subscribing for Noise Level");
  }

  return 1;
}

- (BOOL)unsubscribeFromSound:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = self->_soundSubscribers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "client", (void)v14));

        if (v11 == v4)
        {
          if (dword_100011B90 <= 50
            && (dword_100011B90 != -1 || _LogCategory_Initialize(&dword_100011B90, 50LL)))
          {
            LogPrintF( &dword_100011B90,  "-[SPSoundSensor unsubscribeFromSound:]",  50LL,  "Matching callback found. Unsubscribing");
          }

          -[NSMutableArray removeObject:](self->_soundSubscribers, "removeObject:", v10);

          BOOL v12 = 1;
          goto LABEL_19;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (dword_100011B90 <= 50 && (dword_100011B90 != -1 || _LogCategory_Initialize(&dword_100011B90, 50LL))) {
    LogPrintF( &dword_100011B90,  "-[SPSoundSensor unsubscribeFromSound:]",  50LL,  "No Matching callback found to unsubscribe",  (void)v14);
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (BOOL)unsubscribeFromNoiseLevel:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = self->_noiseLevelSubscribers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "client", (void)v14));

        if (v11 == v4)
        {
          if (dword_100011B90 <= 50
            && (dword_100011B90 != -1 || _LogCategory_Initialize(&dword_100011B90, 50LL)))
          {
            LogPrintF( &dword_100011B90,  "-[SPSoundSensor unsubscribeFromNoiseLevel:]",  50LL,  "Matching callback found. Unsubscribing");
          }

          -[NSMutableArray removeObject:](self->_noiseLevelSubscribers, "removeObject:", v10);

          BOOL v12 = 1;
          goto LABEL_19;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (dword_100011B90 <= 50 && (dword_100011B90 != -1 || _LogCategory_Initialize(&dword_100011B90, 50LL))) {
    LogPrintF( &dword_100011B90,  "-[SPSoundSensor unsubscribeFromNoiseLevel:]",  50LL,  "No Matching callback found to unsubscribe",  (void)v14);
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (unsigned)currentNoiseLevel
{
  return self->_currentNoiseLevel;
}

- (void).cxx_destruct
{
}

@end