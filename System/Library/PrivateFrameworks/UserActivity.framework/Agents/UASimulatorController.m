@interface UASimulatorController
+ (id)simulatorControllerForCommandPort:(unsigned int)a3;
+ (void)setSimulatorForCommandPort:(unsigned int)a3 controller:(id)a4;
- (BOOL)active;
- (BOOL)terminate;
- (NSSet)simulators;
- (OS_dispatch_queue)dispatchQ;
- (SFPeerDevice)ourPeerDevice;
- (UASimulatorController)initWithManager:(id)a3;
- (id)simulatorStatus;
- (id)statusString;
- (unsigned)simulatorPort;
- (void)addSimulator:(id)a3;
- (void)removeSimulator:(id)a3;
- (void)setDispatchQ:(id)a3;
- (void)setOurPeerDevice:(id)a3;
- (void)setSimulatorPort:(unsigned int)a3;
@end

@implementation UASimulatorController

+ (id)simulatorControllerForCommandPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000DE338);
  v4 = (void *)qword_1000DE330;
  if (qword_1000DE330)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000DE338);
  return v4;
}

+ (void)setSimulatorForCommandPort:(unsigned int)a3 controller:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v9 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000DE338);
  v5 = (void *)qword_1000DE330;
  if (v9 && !qword_1000DE330)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v7 = (void *)qword_1000DE330;
    qword_1000DE330 = v6;

    v5 = (void *)qword_1000DE330;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  [v5 setObject:v9 forKeyedSubscript:v8];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000DE338);
}

- (UASimulatorController)initWithManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UASimulatorController;
  v5 = -[UACornerActionManagerHandler initWithManager:name:](&v11, "initWithManager:name:", v4, @"SimCreator");
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("simulator", 0LL);
    dispatchQ = v5->_dispatchQ;
    v5->_dispatchQ = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    simulators = v5->_simulators;
    v5->_simulators = (NSMutableSet *)v8;
  }

  return v5;
}

- (NSSet)simulators
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableSet copy](v2->_simulators, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)addSimulator:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  -[NSMutableSet addObject:](obj->_simulators, "addObject:", v4);

  objc_sync_exit(obj);
}

- (void)removeSimulator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableSet removeObject:](v5->_simulators, "removeObject:", v6);
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (BOOL)active
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorController simulators](self, "simulators"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)terminate
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___UASimulatorController;
  BOOL v3 = -[UACornerActionManagerHandler terminate](&v16, "terminate");
  if (v3)
  {
    os_log_t v4 = sub_100039584(0LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Terminating all UASimulators.",  buf,  2u);
    }

    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorController simulators](self, "simulators", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) terminate];
          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }

      while (v7);
    }
  }

  return v3;
}

- (id)statusString
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorController simulators](self, "simulators"));
  id v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorController simulators](self, "simulators"));
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) statusString]);
          [v5 appendFormat:@"%@\n", v10];

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v7);
    }

    __int128 v11 = v5;
  }

  else
  {
    __int128 v11 = 0LL;
  }

  id v12 = [v11 copy];

  return v12;
}

- (id)simulatorStatus
{
  uint64_t v21 = 0LL;
  unsigned int v22 = 0;
  char v23 = 0;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[UASimulatorController simulators](self, "simulators"));
  id v2 = [obj countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v2)
  {
    BOOL v3 = 0LL;
    uint64_t v4 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v7 = sub_100076638((mach_port_t)[v6 pairedClientPort], 0x1C9C380u, &v21, &v22);
        uint64_t v8 = v7;
        if ((_DWORD)v7)
        {
          id v9 = mach_error_string(v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue([v6 statusString]);
          uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(ERROR %d/%s for simulator %@"),  v8,  v9,  v10);

          BOOL v3 = (void *)v11;
        }

        else
        {
          id v12 = objc_alloc(&OBJC_CLASS___NSString);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v21, v22));
          __int128 v14 = -[NSString initWithData:encoding:](v12, "initWithData:encoding:", v13, 4LL);

          if (v14) {
            goto LABEL_14;
          }
          BOOL v3 = 0LL;
        }
      }

      id v2 = [obj countByEnumeratingWithState:&v17 objects:v24 count:16];
      __int128 v14 = (NSString *)v3;
    }

    while (v2);
  }

  else
  {
    __int128 v14 = 0LL;
  }

- (OS_dispatch_queue)dispatchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDispatchQ:(id)a3
{
}

- (unsigned)simulatorPort
{
  return self->_simulatorPort;
}

- (void)setSimulatorPort:(unsigned int)a3
{
  self->_simulatorPort = a3;
}

- (SFPeerDevice)ourPeerDevice
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setOurPeerDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end