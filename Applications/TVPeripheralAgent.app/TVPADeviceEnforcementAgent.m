@interface TVPADeviceEnforcementAgent
- (BOOL)_isBreakingEnforcableRuleForDeviceType:(int64_t)a3;
- (BOOL)askUserAboutConnectingAudioDevice;
- (BOOL)askUserAboutDisconnectingAudioDevice;
- (BOOL)shouldConnectToAudioDevice;
- (BOOL)tellUserDeviceDoesntRepectDisconnectWithName:(id)a3;
- (TVPADeviceEnforcementAgent)init;
- (void)_applyNewEnforcement;
- (void)_bluetoothManagerUpdated:(id)a3;
- (void)_didCompleteDeviceConnection:(id)a3 currentState:(unsigned int)a4;
- (void)_disconnectDevice:(id)a3 tellUserIfDeviceDoesntRepectDisconnect:(BOOL)a4;
- (void)bluetoothManager:(id)a3 didCompleteDeviceConnection:(id)a4 error:(id)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startEnforcing;
- (void)tellUserDevice:(id)a3 disconnectedDueToDeviceLimit:(int64_t)a4;
- (void)tellUserUpdateNeededForDisconnectedDevice:(id)a3;
@end

@implementation TVPADeviceEnforcementAgent

- (TVPADeviceEnforcementAgent)init
{
  v27 = self;
  SEL v26 = a2;
  sub_1000103B4();
  v2 = v27;
  v27 = 0LL;
  v25.receiver = v2;
  v25.super_class = (Class)&OBJC_CLASS___TVPADeviceEnforcementAgent;
  v10 = -[TVPADeviceEnforcementAgent init](&v25, "init");
  v27 = v10;
  objc_storeStrong((id *)&v27, v10);
  if (v10)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    connectedDevices = v27->_connectedDevices;
    v27->_connectedDevices = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___CUBluetoothClient);
    discoveryClient = v27->_discoveryClient;
    v27->_discoveryClient = v5;

    v18 = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    v21 = sub_100010DE0;
    v22 = &unk_100038868;
    v23 = v27;
    -[CUBluetoothClient setDeviceConnectedHandler:](v27->_discoveryClient, "setDeviceConnectedHandler:", &v18);
    v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_100010E78;
    v16 = &unk_100038868;
    v17 = v27;
    -[CUBluetoothClient setDeviceDisconnectedHandler:](v27->_discoveryClient, "setDeviceDisconnectedHandler:", &v12);
    -[CUBluetoothClient activate](v27->_discoveryClient, "activate");
    objc_storeStrong((id *)&v17, 0LL);
    objc_storeStrong((id *)&v23, 0LL);
  }

  v7 = v27;
  v27 = 0LL;
  v11.receiver = v7;
  v11.super_class = (Class)&OBJC_CLASS___TVPADeviceEnforcementAgent;
  v27 = -[TVPADeviceEnforcementAgent init](&v11, "init");
  v9 = v27;
  objc_storeStrong((id *)&v27, 0LL);
  return v9;
}

- (void)dealloc
{
  objc_super v11 = self;
  location[1] = (id)a2;
  location[0] = sub_1000110F8();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v9;
    sub_100009998(v8);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "*** WARNING: deallocation of TVPADeviceEnforcementAgent unexpected",  v8,  2u);
  }

  objc_storeStrong(location, 0LL);
  if (v11->_observingPhysicalNetworkInterface)
  {
    id v3 = +[TVSEthernetInterface RJ45EthernetInterface](&OBJC_CLASS___TVSEthernetInterface, "RJ45EthernetInterface");
    [v3 removeObserver:v11 forKeyPath:@"active" context:off_1000401C0];
  }

  if (v11->_observingConnectedDevices)
  {
    v2 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
    -[TVSBluetoothManager removeObserver:forKeyPath:context:]( v2,  "removeObserver:forKeyPath:context:",  v11,  @"connectedDevices",  off_1000401C8);
  }

  if (v11->_discoveryClient)
  {
    -[CUBluetoothClient invalidate](v11->_discoveryClient, "invalidate");
    objc_storeStrong((id *)&v11->_discoveryClient, 0LL);
    -[NSMutableDictionary removeAllObjects](v11->_connectedDevices, "removeAllObjects");
  }

  v6.receiver = v11;
  v6.super_class = (Class)&OBJC_CLASS___TVPADeviceEnforcementAgent;
  -[TVPADeviceEnforcementAgent dealloc](&v6, "dealloc");
}

- (BOOL)shouldConnectToAudioDevice
{
  v16[2] = self;
  v16[1] = (id)a2;
  v16[0] = +[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", &off_10003B148);
  memset(__b, 0, sizeof(__b));
  v10 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  id obj = -[TVSBluetoothManager connectedDevices](v10, "connectedDevices");

  id v12 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v12)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v12;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(id *)(__b[1] + 8 * v8);
      if (([v15 isConnected] & 1) != 0 && objc_msgSend(v15, "state") == (id)2)
      {
        id v4 = v16[0];
        v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 type]);
        objc_msgSend(v4, "addObject:");
      }

      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  int v13 = sub_10001140C(v16[0]);
  BOOL v3 = sub_100011594(v13) != -1;
  objc_storeStrong(v16, 0LL);
  return v3;
}

- (void)_applyNewEnforcement
{
  SEL v26 = self;
  SEL v25 = a2;
  if (self->_enforcing)
  {
    uint64_t v6 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
    id v5 = -[TVSBluetoothManager connectedDevices](v6, "connectedDevices");
    int v7 = sub_1000118EC(v5);

    unsigned int v24 = v7;
    int v23 = sub_100011594(v7);
    if (v23 == -1)
    {
      unsigned int v22 = sub_100011B5C(v24, 3);
      unsigned int v21 = sub_100011B5C(v24, 2);
      unsigned int v20 = sub_100011B5C(v24, 1);
      int v18 = 1;
      unsigned int v17 = v22;
      if (v22 <= 1) {
        int v4 = v17;
      }
      else {
        int v4 = v18;
      }
      int v16 = v4;
      int v15 = 1;
      unsigned int v14 = v21;
      if (v21 <= 1) {
        int v3 = v14;
      }
      else {
        int v3 = v15;
      }
      int v13 = v3;
      int v12 = 1;
      unsigned int v11 = v20;
      if (v20 <= 1) {
        int v2 = v11;
      }
      else {
        int v2 = v12;
      }
      int v10 = v2;
      int v19 = sub_100011BAC(v4, v3, v2, 0, 0);
      int v9 = sub_100011594(v19);
      os_log_t oslog = (os_log_t)sub_1000110F8();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100011BF4((uint64_t)v27, v24, v19);
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "moving from state %05x to %05x at start of enforcement",  v27,  0xEu);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      sub_100011C40(v26, v24, v19, 0LL, 0);
    }
  }

- (BOOL)_isBreakingEnforcableRuleForDeviceType:(int64_t)a3
{
  if (a3 == 3)
  {
    id v5 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
    id v4 = -[TVSBluetoothManager connectedDevices](v5, "connectedDevices");
    unsigned int v6 = sub_1000118EC(v4);

    return sub_100011B5C(v6, 3) > 1;
  }

  else
  {
    return 0;
  }

- (void)startEnforcing
{
  unsigned int v17 = self;
  location[1] = (id)a2;
  location[0] = sub_1000110F8();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v15;
    sub_100009998(v14);
    _os_log_impl((void *)&_mh_execute_header, log, type, "starting enforcement agent", v14, 2u);
  }

  objc_storeStrong(location, 0LL);
  v17->_observingPhysicalNetworkInterface = 1;
  id v13 = +[TVSEthernetInterface RJ45EthernetInterface](&OBJC_CLASS___TVSEthernetInterface, "RJ45EthernetInterface");
  [v13 addObserver:v17 forKeyPath:@"active" options:0 context:off_1000401C0];
  if (([v13 isActive] & 1) == 0)
  {
    v17->_enforcing = 1;
    id v12 = sub_1000110F8();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = (os_log_s *)v12;
      os_log_type_t v7 = v11;
      sub_100009998(v10);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "start of enforcement", v10, 2u);
    }

    objc_storeStrong(&v12, 0LL);
  }

  id v4 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  int v2 = (NSSet *)-[TVSBluetoothManager connectedDevices](v4, "connectedDevices");
  priorConnectedDevices = v17->_priorConnectedDevices;
  v17->_priorConnectedDevices = v2;

  v17->_observingConnectedDevices = 1;
  id v5 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  -[TVSBluetoothManager addObserver:forKeyPath:options:context:]( v5,  "addObserver:forKeyPath:options:context:",  v17,  @"connectedDevices",  0LL,  off_1000401C8);

  -[TVPADeviceEnforcementAgent _applyNewEnforcement](v17, "_applyNewEnforcement");
  objc_storeStrong(&v13, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v29 = 0LL;
  objc_storeStrong(&v29, a4);
  id v28 = 0LL;
  objc_storeStrong(&v28, a5);
  v27 = a6;
  if (a6 == off_1000401C0)
  {
    id v12 = +[TVSEthernetInterface RJ45EthernetInterface](&OBJC_CLASS___TVSEthernetInterface, "RJ45EthernetInterface");
    unsigned __int8 v13 = [v12 isActive];

    char v26 = v13 & 1;
    id v25 = sub_1000110F8();
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      if (v31->_enforcing) {
        unsigned int v6 = "YES";
      }
      else {
        unsigned int v6 = "NO";
      }
      if ((v26 & 1) != 0) {
        os_log_type_t v7 = "YES";
      }
      else {
        os_log_type_t v7 = "NO";
      }
      sub_100012C28((uint64_t)v32, (uint64_t)v6, (uint64_t)v7);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  v24,  "got ethernet change notification; enforcing:%s, onEthernet:%s",
        v32,
        0x16u);
    }

    objc_storeStrong(&v25, 0LL);
    if (v31->_enforcing && (v26 & 1) != 0)
    {
      v31->_enforcing = 0;
      id v23 = sub_1000110F8();
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = (os_log_s *)v23;
        os_log_type_t v11 = v22;
        sub_100009998(v21);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "end of enforcement", v21, 2u);
      }

      objc_storeStrong(&v23, 0LL);
    }

    else if (!v31->_enforcing && (v26 & 1) == 0)
    {
      v31->_enforcing = 1;
      os_log_t oslog = (os_log_t)sub_1000110F8();
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = oslog;
        os_log_type_t v9 = v19;
        sub_100009998(v18);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "start of enforcement", v18, 2u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      -[TVPADeviceEnforcementAgent _applyNewEnforcement](v31, "_applyNewEnforcement");
    }
  }

  else if (v27 == off_1000401C8)
  {
    -[TVPADeviceEnforcementAgent _bluetoothManagerUpdated:](v31, "_bluetoothManagerUpdated:", v28);
  }

  else
  {
    v17.receiver = v31;
    v17.super_class = (Class)&OBJC_CLASS___TVPADeviceEnforcementAgent;
    -[TVPADeviceEnforcementAgent observeValueForKeyPath:ofObject:change:context:]( &v17,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v29,  v28,  v27);
  }

  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bluetoothManager:(id)a3 didCompleteDeviceConnection:(id)a4 error:(id)a5
{
  v54 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v52 = 0LL;
  objc_storeStrong(&v52, a4);
  id v51 = 0LL;
  objc_storeStrong(&v51, a5);
  if (-[TVPADeviceEnforcementAgent _isBreakingEnforcableRuleForDeviceType:]( v54,  "_isBreakingEnforcableRuleForDeviceType:",  [v52 type])
    || v54->_enforcing
    && sub_10001371C(v52) != 9
    && !v51
    && ([v52 isConnected] & 1) != 0
    && [v52 state] != (id)3)
  {
    id v47 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
    memset(__b, 0, sizeof(__b));
    os_log_type_t v22 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
    id v23 = -[TVSBluetoothManager connectedDevices](v22, "connectedDevices");

    id v24 = [v23 countByEnumeratingWithState:__b objects:v59 count:16];
    if (v24)
    {
      uint64_t v19 = *(void *)__b[2];
      uint64_t v20 = 0LL;
      id v21 = v24;
      while (1)
      {
        uint64_t v18 = v20;
        if (*(void *)__b[2] != v19) {
          objc_enumerationMutation(v23);
        }
        id v46 = *(id *)(__b[1] + 8 * v20);
        ++v20;
        if (v18 + 1 >= (unint64_t)v21)
        {
          uint64_t v20 = 0LL;
          id v21 = [v23 countByEnumeratingWithState:__b objects:v59 count:16];
          if (!v21) {
            break;
          }
        }
      }
    }

    unsigned int v44 = sub_1000118EC(v47);
    int v43 = sub_100011B5C(v44, 3);
    objc_super v17 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
    id v42 = -[TVSBluetoothManager connectedDevices](v17, "connectedDevices");

    char v40 = MGGetBoolAnswer(@"2zyzecwSf2ZYRpB3tuQhOQ") & 1;
    char v41 = v40;
    memset(v38, 0, sizeof(v38));
    id v15 = v42;
    id v16 = [v15 countByEnumeratingWithState:v38 objects:v58 count:16];
    if (v16)
    {
      uint64_t v12 = *(void *)v38[2];
      uint64_t v13 = 0LL;
      id v14 = v16;
      while (1)
      {
        uint64_t v11 = v13;
        if (*(void *)v38[2] != v12) {
          objc_enumerationMutation(v15);
        }
        id v39 = *(id *)(v38[1] + 8 * v13);
        if (([v39 isConnected] & 1) != 0
          && [v39 state] == (id)2
          && [v39 type] == (id)3)
        {
          break;
        }

- (void)_disconnectDevice:(id)a3 tellUserIfDeviceDoesntRepectDisconnect:(BOOL)a4
{
  double v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] respectsDisconnectRequests])
  {
    [location[0] disconnectWithCompletion:0];
  }

  else if (a4)
  {
    id v4 = v8;
    id v5 = [location[0] name];
    -[TVPADeviceEnforcementAgent tellUserDeviceDoesntRepectDisconnectWithName:]( v4,  "tellUserDeviceDoesntRepectDisconnectWithName:");
  }

  objc_storeStrong(location, 0LL);
}

- (void)_didCompleteDeviceConnection:(id)a3 currentState:(unsigned int)a4
{
  id v52 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned int v50 = a4;
  os_log_type_t v22 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter postNotificationName:object:]( v22,  "postNotificationName:object:",  @"TVPAEnforcementAgentWillDisconnectDevice",  v52);

  unsigned int v49 = sub_100011B5C(a4, 3);
  id v48 = sub_1000110F8();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_DEFAULT))
  {
    sub_100013988((uint64_t)v61, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v48,  type,  "asking user about connect of audio device: %@",  v61,  0xCu);
  }

  objc_storeStrong(&v48, 0LL);
  if (-[TVPADeviceEnforcementAgent askUserAboutConnectingAudioDevice](v52, "askUserAboutConnectingAudioDevice"))
  {
LABEL_9:
    int v42 = 1 << byte_10002D840[4 * (int)sub_10001371C(location[0]) + 2];
    int v41 = v50 - v42;
    int v40 = sub_100011594(v50 - v42);
    if (v40 == -1)
    {
      id v39 = sub_1000110F8();
      os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
      {
        sub_1000139C8((uint64_t)v59, v41);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v39,  v38,  "*** WARNING: previous state %05x not found in valid states",  v59,  8u);
      }

      objc_storeStrong(&v39, 0LL);
      int v40 = 0;
    }

    int v20 = v40;
    int v4 = sub_10001371C(location[0]);
    unsigned int v37 = sub_1000143FC(v20, v4, (uint64_t)v58, (uint64_t)v57, 0x80u);
    int v36 = 0x7FFFFFFF;
    int v35 = -1;
    for (unsigned int i = 0; i < v37; ++i)
    {
      int v33 = sub_100014570(v40, v58[i], v57[i]);
      if (v33 < v36)
      {
        int v36 = v33;
        int v35 = i;
      }
    }

    if (v37)
    {
      os_log_t v23 = (os_log_t)sub_1000110F8();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        sub_1000149C0((uint64_t)v53, v41, dword_1000403A0[v58[v35]], dword_1000403A0[v57[v35]], v36);
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "moving from state %05x to %05x to %05x (score: %d)",  v53,  0x1Au);
      }

      objc_storeStrong((id *)&v23, 0LL);
      sub_100011C40(v52, dword_1000403A0[v40], dword_1000403A0[v58[v35]], location[0], 1);
    }

    else
    {
      os_log_t oslog = (os_log_t)sub_1000110F8();
      os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100011BF4((uint64_t)v56, v41, v50);
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  v31,  "no transitions to move from state %05x to %05x",  v56,  0xEu);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      os_log_t v30 = (os_log_t)sub_1000110F8();
      os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = location[0];
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        double v19 = v5;
        [location[0] lastDisconnectTime];
        sub_100014970((uint64_t)v55, (uint64_t)v18, COERCE__INT64(v19 - v6));
        _os_log_impl( (void *)&_mh_execute_header,  v30,  v29,  "requesting disconnect of device '%@'; device was disconnected %f seconds ago",
          v55,
          0x16u);
      }

      objc_storeStrong((id *)&v30, 0LL);
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      double v17 = v7;
      [location[0] lastDisconnectTime];
      BOOL v28 = v17 - v8 < 5.0;
      int v27 = 0;
      memset(__b, 0, sizeof(__b));
      id v14 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
      id obj = -[TVSBluetoothManager connectedDevices](v14, "connectedDevices");

      id v16 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
      if (v16)
      {
        uint64_t v11 = *(void *)__b[2];
        uint64_t v12 = 0LL;
        id v13 = v16;
        while (1)
        {
          uint64_t v10 = v12;
          if (*(void *)__b[2] != v11) {
            objc_enumerationMutation(obj);
          }
          id v26 = *(id *)(__b[1] + 8 * v12);
          id v9 = [location[0] type];
          if (v9 == [v26 type]) {
            ++v27;
          }
          ++v12;
          if (v10 + 1 >= (unint64_t)v13)
          {
            uint64_t v12 = 0LL;
            id v13 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
            if (!v13) {
              break;
            }
          }
        }
      }

      uint64_t v24 = byte_10002D840[4 * (int)sub_10001371C(location[0])];
      if (v27 > v24 && !v28) {
        -[TVPADeviceEnforcementAgent tellUserDevice:disconnectedDueToDeviceLimit:]( v52,  "tellUserDevice:disconnectedDueToDeviceLimit:",  location[0],  v24);
      }
    }

    int v43 = 0;
  }

  else
  {
    id v45 = sub_1000110F8();
    os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_DEFAULT))
    {
      sub_100013988((uint64_t)v60, (uint64_t)location[0]);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v45,  v44,  "requesting disconnect of new audio device: %@",  v60,  0xCu);
    }

    objc_storeStrong(&v45, 0LL);
    [location[0] disconnectWithCompletion:0];
    int v43 = 1;
  }

  objc_storeStrong(location, 0LL);
}

- (void)_bluetoothManagerUpdated:(id)a3
{
  int v42 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v42->_enforcing)
  {
    int v20 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
    id v36 = -[TVSBluetoothManager connectedDevices](v20, "connectedDevices");

    int v35 = sub_1000118EC(v36);
    int v34 = sub_100011594(v35);
    if (v34 == -1)
    {
      int v31 = v35;
      id v30 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      memset(__b, 0, sizeof(__b));
      id obj = v36;
      id v19 = [obj countByEnumeratingWithState:__b objects:v44 count:16];
      if (v19)
      {
        uint64_t v15 = *(void *)__b[2];
        uint64_t v16 = 0LL;
        id v17 = v19;
        while (1)
        {
          uint64_t v14 = v16;
          if (*(void *)__b[2] != v15) {
            objc_enumerationMutation(obj);
          }
          id v29 = *(id *)(__b[1] + 8 * v16);
          if (!-[NSSet containsObject:](v42->_priorConnectedDevices, "containsObject:", v29)
            && sub_10001371C(v29) != 9)
          {
            [v30 addObject:v29];
            int v27 = 1 << byte_10002D840[4 * (int)sub_10001371C(v29) + 2];
            v31 -= v27;
          }

          ++v16;
          if (v14 + 1 >= (unint64_t)v17)
          {
            uint64_t v16 = 0LL;
            id v17 = [obj countByEnumeratingWithState:__b objects:v44 count:16];
            if (!v17) {
              break;
            }
          }
        }
      }

      id v11 = [v30 allObjects];
      id v26 = [v11 sortedArrayUsingComparator:&stru_1000388A8];

      memset(v24, 0, sizeof(v24));
      id v12 = v26;
      id v13 = [v12 countByEnumeratingWithState:v24 objects:v43 count:16];
      if (v13)
      {
        uint64_t v8 = *(void *)v24[2];
        uint64_t v9 = 0LL;
        id v10 = v13;
        while (1)
        {
          uint64_t v7 = v9;
          if (*(void *)v24[2] != v8) {
            objc_enumerationMutation(v12);
          }
          id v25 = *(id *)(v24[1] + 8 * v9);
          int v23 = 1 << byte_10002D840[4 * (int)sub_10001371C(v25) + 2];
          v31 += v23;
          ++v9;
          if (v7 + 1 >= (unint64_t)v10)
          {
            uint64_t v9 = 0LL;
            id v10 = [v12 countByEnumeratingWithState:v24 objects:v43 count:16];
            if (!v10) {
              break;
            }
          }
        }
      }

      double v5 = (NSSet *)[v36 copy];
      priorConnectedDevices = v42->_priorConnectedDevices;
      v42->_priorConnectedDevices = v5;

      objc_storeStrong(&v26, 0LL);
      objc_storeStrong(&v30, 0LL);
      int v37 = 0;
    }

    else
    {
      id v33 = sub_1000110F8();
      os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
      {
        sub_1000139C8((uint64_t)v45, v35);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  v32,  "told about BT manager update, but ignoring, current state %05x is valid",  v45,  8u);
      }

      objc_storeStrong(&v33, 0LL);
      int v3 = (NSSet *)[v36 copy];
      int v4 = v42->_priorConnectedDevices;
      v42->_priorConnectedDevices = v3;

      int v37 = 1;
    }

    objc_storeStrong(&v36, 0LL);
  }

  else
  {
    id v40 = sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v40;
      os_log_type_t v22 = type;
      sub_100009998(v38);
      _os_log_impl( (void *)&_mh_execute_header,  log,  v22,  "told about BT manager update, but ignoring, not enforcing",  v38,  2u);
    }

    objc_storeStrong(&v40, 0LL);
    int v37 = 1;
  }

  objc_storeStrong(location, 0LL);
}

- (BOOL)tellUserDeviceDoesntRepectDisconnectWithName:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v4 = sub_1000152E4(location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)tellUserDevice:(id)a3 disconnectedDueToDeviceLimit:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = (void *)a4;
  id v16 = [location[0] name];
  char v15 = [location[0] respectsDisconnectRequests] & 1;
  id v14 = [location[0] type];
  id v13 = [location[0] transportType];
  queue = dispatch_get_global_queue(0LL, 0LL);
  double v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = sub_1000157D4;
  id v10 = &unk_1000388D0;
  v11[1] = v14;
  v11[2] = v13;
  v11[3] = v17;
  char v12 = v15 & 1;
  v11[0] = v16;
  dispatch_async(queue, &v6);

  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)tellUserUpdateNeededForDisconnectedDevice:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = sub_1000110F8();
  os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
  {
    sub_100013988((uint64_t)v21, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  v16,  "tellUserUpdateNeededForDisconnectedDevice %@",  v21,  0xCu);
  }

  objc_storeStrong(&v17, 0LL);
  int v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v15 =  -[NSBundle localizedStringForKey:value:table:]( v3,  "localizedStringForKey:value:table:",  @"AudioSplitterUpdateNeededTitle");

  double v6 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  double v5 =  -[NSBundle localizedStringForKey:value:table:]( v6,  "localizedStringForKey:value:table:",  @"AudioSplitterUpdateNeededMessage",  &stru_100039440,  0LL);
  id v4 = [location[0] name];
  id v14 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v5, v4);

  int v7 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v13 =  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"DeviceLimitExceededDefaultButtonTitle",  &stru_100039440,  0LL);

  v19[0] = kCFUserNotificationAlertHeaderKey;
  v20[0] = v15;
  v19[1] = kCFUserNotificationAlertMessageKey;
  v20[1] = v14;
  v19[2] = kCFUserNotificationDefaultButtonTitleKey;
  v20[2] = v13;
  CFDictionaryRef dictionary =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19);
  SInt32 error = 0;
  CFTimeInterval timeout = 120.0;
  CFUserNotificationRef userNotification = CFUserNotificationCreate(0LL, 120.0, 1uLL, &error, dictionary);
  CFOptionFlags responseFlags = 3LL;
  CFUserNotificationReceiveResponse(userNotification, 120.0, &responseFlags);
  CFRelease(userNotification);
  objc_storeStrong((id *)&dictionary, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)askUserAboutConnectingAudioDevice
{
  return sub_100016358();
}

- (BOOL)askUserAboutDisconnectingAudioDevice
{
  return sub_100016714();
}

- (void).cxx_destruct
{
}

@end