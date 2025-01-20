@interface CBAccessoryDaemon
- (CBDaemonServer)daemonServer;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)diagnosticAccessoryFakeWithIdentifier:(id)a3 leftPercent:(int)a4 leftState:(unsigned __int8)a5 rightPercent:(int)a6 rightState:(unsigned __int8)a7 casePercent:(int)a8 caseState:(unsigned __int8)a9 lidClosed:(BOOL)a10 obcMinutes:(int)a11 error:(id *)a12;
- (id)diagnosticControl:(id)a3 error:(id *)a4;
- (id)findPrimaryCBDevice:(id)a3;
- (void)_accessoryDiscoveryEnsureStarted;
- (void)_accessoryDiscoveryEnsureStopped;
- (void)_accessoryDiscoveryFoundDevice:(id)a3;
- (void)_connectionMonitorEnsureStarted;
- (void)_connectionMonitorEnsureStopped;
- (void)_connectionMonitorFoundDevice:(id)a3;
- (void)_connectionMonitorUpdate;
- (void)_screenOnChanged;
- (void)_update;
- (void)activate;
- (void)invalidate;
- (void)prefsChanged;
- (void)setDaemonServer:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CBAccessoryDaemon

- (id)description
{
  return -[CBAccessoryDaemon descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v23 = 0LL;
  v24 = (id *)&v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_1000095C8;
  v27 = sub_1000095D8;
  id v28 = 0LL;
  int v22 = 12;
  id obj = 0LL;
  objc_opt_class(self);
  else {
    v5 = "== %@";
  }
  CUAppendF(&obj, &v22, v5);
  objc_storeStrong(&v28, obj);
  v6 = v24 + 5;
  id v20 = v24[5];
  unsigned int v7 = -[NSMutableDictionary count](self->_accessoryInfoMap, "count");
  if (self->_connectionMonitor) {
    v8 = "yes";
  }
  else {
    v8 = "no";
  }
  CUAppendF(&v20, &v22, "devices %d, discovery %s", v7, v8);
  objc_storeStrong(v6, v20);
  if (a3 <= 0x14u)
  {
    v9 = v24;
    id v19 = v24[5];
    NSAppendPrintF_safe(&v19, " ==\n");
    objc_storeStrong(v9 + 5, v19);
    connectionMonitor = self->_connectionMonitor;
    if (connectionMonitor)
    {
      v11 = v24;
      id v18 = v24[5];
      NSAppendPrintF_safe(&v18, "%@\n", connectionMonitor);
      objc_storeStrong(v11 + 5, v18);
    }

    accessoryInfoMap = self->_accessoryInfoMap;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000095E0;
    v16[3] = &unk_10087EEA0;
    v16[4] = &v23;
    int v17 = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( accessoryInfoMap,  "enumerateKeysAndObjectsUsingBlock:",  v16);
  }

  v13 = (__CFString *)v24[5];
  if (!v13) {
    v13 = &stru_1008A57D8;
  }
  v14 = v13;
  _Block_object_dispose(&v23, 8);

  return v14;
}

- (void)activate
{
  v3 = self->_systemMonitor;
  if (!v3)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    objc_storeStrong((id *)&self->_systemMonitor, v3);
    -[CUSystemMonitor setDispatchQueue:](v3, "setDispatchQueue:", self->_dispatchQueue);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10000978C;
    v5[3] = &unk_10087EEC8;
    v5[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](v3, "setScreenOnChangedHandler:", v5);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100009794;
    v4[3] = &unk_10087EEC8;
    v4[4] = self;
    -[CUSystemMonitor setScreenLockedChangedHandler:](v3, "setScreenLockedChangedHandler:", v4);
    -[CUSystemMonitor activateWithCompletion:](v3, "activateWithCompletion:", &stru_10087EEE8);
  }

  -[CBAccessoryDaemon prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  periodicTimer = self->_periodicTimer;
  if (periodicTimer)
  {
    v4 = periodicTimer;
    dispatch_source_cancel(v4);
    v5 = self->_periodicTimer;
    self->_periodicTimer = 0LL;
  }

  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0LL;
}

- (id)diagnosticControl:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"iStr", TypeID, 0LL);
  id v9 = objc_claimAutoreleasedReturnValue(TypedValue);
  v10 = (const char *)[v9 UTF8String];
  if (v10)
  {
    v11 = v10;
    if (!strcasecmp(v10, "accessory-help"))
    {
      v12 = @"accessory-fake-add[,paramKey1=paramValue1][,paramKey2=paramValue2][,etc.] -- Add/update fake accessory.\n    id=accessoryID\n    leftPercent=0-100\n    leftState=unknown/charging/discharging\n    rightPercent=0-100\n    rightState=unknown/charging/discharging\n    casePercent=0-100\n    caseState=unknown/charging/discharging\n    lidClosed=yes/no\n    obc=yes/no\naccessory-fake-remove -- Remove fake accessory\n\nExample: accessory-fake-add,casePercent=54,lidClosed=yes\n\n";
      goto LABEL_70;
    }

    if (!strcasecmp(v11, "accessory-fake-remove"))
    {
      v13 = self->_accessoryFakeDevice;
      if (v13)
      {
        if (dword_1008D5F68 <= 30
          && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
        {
          LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon diagnosticControl:error:]",  30LL,  "Fake accessory remove: %@",  v13);
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](v13, "identifier"));
        v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_accessoryInfoMap,  "objectForKeyedSubscript:",  v31));
        [v32 invalidate];
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_accessoryInfoMap,  "setObject:forKeyedSubscript:",  0LL,  v31);
        accessoryFakeDevice = self->_accessoryFakeDevice;
        self->_accessoryFakeDevice = 0LL;

        v12 = @"Removed accessory\n";
      }

      else
      {
        v12 = @"No fake accessory\n";
      }
    }

    else
    {
      if (stricmp_prefix(v11, "accessory-fake-add"))
      {
        v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"error: unsupported command '%s'. See accessory-help\n",  v11);
        goto LABEL_70;
      }

      v37 = a4;
      v38 = self;
      id v42 = v6;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11 + 18));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsSeparatedByString:@","]);

      id v16 = [v15 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v16)
      {
        id v17 = v16;
        unsigned int v41 = 0;
        BOOL v39 = 0;
        char v40 = 2;
        uint64_t v18 = *(void *)v49;
        unsigned int v45 = 82;
        unsigned __int8 v46 = 1;
        id v19 = @"FakeAccessoryID";
        unsigned int v47 = 78;
        unsigned int v43 = 43;
        unsigned __int8 v44 = 1;
LABEL_13:
        uint64_t v20 = 0LL;
        while (1)
        {
          if (*(void *)v49 != v18) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v48 + 1) + 8 * v20);
          if (![v21 length]) {
            goto LABEL_58;
          }
          int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 componentsSeparatedByString:@"="]);
          if ((unint64_t)[v22 count] <= 1)
          {
            v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"error: bad parameter format '%@'. See accessory-help\n",  v21);
LABEL_63:

            goto LABEL_66;
          }

          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:0]);
          id v24 = objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:1]);
          id v25 = [v24 UTF8String];
          if ([v23 caseInsensitiveCompare:@"id"])
          {
            if ([v23 caseInsensitiveCompare:@"leftPercent"])
            {
              if (![v23 caseInsensitiveCompare:@"leftState"])
              {
                id v27 = v24;
                if ([v27 caseInsensitiveCompare:@"Charging"])
                {
                  if ([v27 caseInsensitiveCompare:@"Discharging"])
                  {
                    if ([v27 caseInsensitiveCompare:@"FullyCharged"]) {
                      char v28 = 4 * ([v27 caseInsensitiveCompare:@"OBC"] == 0);
                    }
                    else {
                      char v28 = 3;
                    }
                  }

                  else
                  {
                    char v28 = 2;
                  }
                }

                else
                {
                  char v28 = 1;
                }

                unsigned __int8 v46 = v28;
LABEL_56:

                goto LABEL_57;
              }

              if ([v23 caseInsensitiveCompare:@"rightPercent"])
              {
                if ([v23 caseInsensitiveCompare:@"rightState"])
                {
                  if ([v23 caseInsensitiveCompare:@"casePercent"])
                  {
                    if ([v23 caseInsensitiveCompare:@"caseState"])
                    {
                      if ([v23 caseInsensitiveCompare:@"lidClosed"])
                      {
                        if ([v23 caseInsensitiveCompare:@"obcMinutes"])
                        {
                          v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"error: bad parameter key '%@'. See accessory-help\n",  v23);

                          goto LABEL_63;
                        }

                        unsigned int v41 = [v24 intValue];
                      }

                      else
                      {
                        BOOL v30 = !strnicmpx(v25, -1LL, "true")
                           || !strnicmpx(v25, -1LL, "yes")
                           || !strnicmpx(v25, -1LL, "y")
                        BOOL v39 = v30;
                      }
                    }

                    else
                    {
                      char v40 = sub_100009F5C(v24);
                    }
                  }

                  else
                  {
                    unsigned int v43 = [v24 intValue];
                  }

                  goto LABEL_57;
                }

                id v27 = v24;
                if ([v27 caseInsensitiveCompare:@"Charging"])
                {
                  if ([v27 caseInsensitiveCompare:@"Discharging"])
                  {
                    if ([v27 caseInsensitiveCompare:@"FullyCharged"]) {
                      char v29 = 4 * ([v27 caseInsensitiveCompare:@"OBC"] == 0);
                    }
                    else {
                      char v29 = 3;
                    }
                  }

                  else
                  {
                    char v29 = 2;
                  }
                }

                else
                {
                  char v29 = 1;
                }

                unsigned __int8 v44 = v29;
                goto LABEL_56;
              }

              unsigned int v45 = [v24 intValue];
            }

            else
            {
              unsigned int v47 = [v24 intValue];
            }
          }

          else
          {
            v26 = (__CFString *)v24;

            id v19 = v26;
          }

- (id)diagnosticAccessoryFakeWithIdentifier:(id)a3 leftPercent:(int)a4 leftState:(unsigned __int8)a5 rightPercent:(int)a6 rightState:(unsigned __int8)a7 casePercent:(int)a8 caseState:(unsigned __int8)a9 lidClosed:(BOOL)a10 obcMinutes:(int)a11 error:(id *)a12
{
  int v28 = a7;
  int v14 = a5;
  id v17 = a3;
  char v29 = self;
  accessoryFakeDevice = self->_accessoryFakeDevice;
  p_accessoryFakeDevice = &self->_accessoryFakeDevice;
  uint64_t v20 = accessoryFakeDevice;
  v21 = v20;
  if (!v20)
  {
    v21 = objc_alloc_init(&OBJC_CLASS___CBDevice);
    objc_storeStrong((id *)p_accessoryFakeDevice, v21);
  }

  -[CBDevice setAccessoryStatusFlags:](v21, "setAccessoryStatusFlags:", a10);
  -[CBDevice setAccessoryStatusOBCTime:](v21, "setAccessoryStatusOBCTime:", (double)(60 * a11));
  if (a4 >= 100) {
    int v22 = 100;
  }
  else {
    int v22 = a4;
  }
  -[CBDevice setBatteryInfoLeft:](v21, "setBatteryInfoLeft:", v22 & ~(v22 >> 31) | (v14 << 8));
  if (a6 >= 100) {
    int v23 = 100;
  }
  else {
    int v23 = a6;
  }
  -[CBDevice setBatteryInfoRight:](v21, "setBatteryInfoRight:", v23 & ~(v23 >> 31) | (v28 << 8));
  if (a8 >= 100) {
    int v24 = 100;
  }
  else {
    int v24 = a8;
  }
  -[CBDevice setBatteryInfoCase:](v21, "setBatteryInfoCase:", v24 & ~(v24 >> 31) | (a9 << 8));
  -[CBDevice setIdentifier:](v21, "setIdentifier:", v17);
  -[CBDevice setName:](v21, "setName:", @"Fake Accessory");
  -[CBDevice setProductID:](v21, "setProductID:", 8206LL);
  -[CBDevice setVendorID:](v21, "setVendorID:", 76LL);
  -[CBDevice setVendorIDSource:](v21, "setVendorIDSource:", 1LL);
  if (dword_1008D5F68 <= 30 && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL))) {
    LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon diagnosticAccessoryFakeWithIdentifier:leftPercent:leftState:rightPercent:rightState:casePercen t:caseState:lidClosed:obcMinutes:error:]",  30LL,  "Fake accessory add/update: %@",  v21);
  }
  -[CBAccessoryDaemon _accessoryDiscoveryFoundDevice:](v29, "_accessoryDiscoveryFoundDevice:", v21);
  if (v20) {
    id v25 = @"Updated accessory\n";
  }
  else {
    id v25 = @"Added accessory\n";
  }
  v26 = v25;

  return v26;
}

- (id)findPrimaryCBDevice:(id)a3
{
  id v3 = a3;
  char v4 = 1;
  while ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemonServer, "stackController"));
    char v6 = 1;
    id v25 = v5;
    do
    {
      int v7 = (v5 != 0LL) & v6;
      if (v7 != 1) {
        break;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 getDevicesWithFlags:2 error:0]);
      id v9 = v8;
      if (v8)
      {
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v10 = v8;
        id v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v27;
          while (2)
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v27 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
              id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 findMyCaseIdentifier]);
              id v17 = v3;
              id v18 = v16;
              if (v18 == v17)
              {

LABEL_21:
                if (dword_1008D5F68 <= 30
                  && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
                {
                  LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon findPrimaryCBDevice:]",  30LL,  "Found primary CBDevice for accessory with identifier %@: %@",  v17,  v15);
                }

                id v24 = v15;
                int v21 = 1;
                id v9 = v10;
                goto LABEL_27;
              }

              id v19 = v18;
              if ((v3 == 0LL) != (v18 != 0LL))
              {
                unsigned int v20 = [v17 isEqual:v18];

                if (v20) {
                  goto LABEL_21;
                }
              }

              else
              {
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
            if (v12) {
              continue;
            }
            break;
          }

          int v21 = 0;
LABEL_27:
          v5 = v25;
          int v7 = 1;
        }

        else
        {
          int v21 = 0;
        }
      }

      else
      {
        int v21 = 0;
      }

      char v6 = 0;
    }

    while (!v21);

    char v4 = 0;
    if (v7) {
      goto LABEL_33;
    }
  }

  id v24 = 0LL;
LABEL_33:

  return v24;
}

- (void)prefsChanged
{
  int v21 = 0;
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"accessoryDaemonConnections", &v21);
  if (v21) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = Int64 == 0;
  }
  BOOL v5 = !v4;
  if (self->_prefAccessoryDaemonConnectionMonitor != v5)
  {
    if (dword_1008D5F68 <= 30
      && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
    {
      char v6 = "yes";
      if (v5) {
        int v7 = "no";
      }
      else {
        int v7 = "yes";
      }
      if (!v5) {
        char v6 = "no";
      }
      LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon prefsChanged]",  30LL,  "AccessoryDaemonConnectionMonitor: %s -> %s",  v7,  v6);
    }

    self->_prefAccessoryDaemonConnectionMonitor = v5;
  }

  CFPrefs_GetDouble(@"com.apple.bluetooth", @"accessoryDaemonConnectSeconds", &v21);
  if (v21) {
    double v9 = (double)(arc4random_uniform(0x3840u) + 72000);
  }
  else {
    double v9 = v8;
  }
  if (v9 != self->_prefAccessoryDaemonConnectSeconds)
  {
    if (dword_1008D5F68 <= 30
      && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
    {
      uint64_t v10 = ((uint64_t (*)(void))CUPrintDurationDouble)();
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = CUPrintDurationDouble(v9);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon prefsChanged]",  30LL,  "AccessoryDaemonConnectSeconds: %@ -> %@",  v11,  v13);
    }

    self->_prefAccessoryDaemonConnectSeconds = v9;
  }

  CFPrefs_GetDouble(@"com.apple.bluetooth", @"accessoryDaemonStayConnectSeconds", &v21);
  if (v21) {
    double v15 = 30.0;
  }
  else {
    double v15 = v14;
  }
  double prefAccessoryDaemonStayConnectedSeconds = self->_prefAccessoryDaemonStayConnectedSeconds;
  if (v15 != prefAccessoryDaemonStayConnectedSeconds)
  {
    if (dword_1008D5F68 <= 30)
    {
      if (dword_1008D5F68 == -1)
      {
        double prefAccessoryDaemonStayConnectedSeconds = self->_prefAccessoryDaemonStayConnectedSeconds;
      }

      uint64_t v17 = CUPrintDurationDouble(prefAccessoryDaemonStayConnectedSeconds);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = CUPrintDurationDouble(v15);
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon prefsChanged]",  30LL,  "AccessoryDaemonStayConnectSeconds: %@ -> %@",  v18,  v20);
    }

- (void)_screenOnChanged
{
  unsigned int v3 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  unsigned int v4 = -[CUSystemMonitor screenLocked](self->_systemMonitor, "screenLocked");
  if (dword_1008D5F68 <= 30)
  {
    unsigned int v5 = v4;
    if (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL))
    {
      char v6 = "off";
      if (v3) {
        char v6 = "on";
      }
      int v7 = "no";
      if (v5) {
        int v7 = "yes";
      }
      LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _screenOnChanged]",  30LL,  "ScreenOn changed: %s, ScreenLocked changed: %s",  v6,  v7);
    }
  }

  -[CBAccessoryDaemon _update](self, "_update");
}

- (void)_update
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemonServer, "stackController"));
  unsigned int v4 = v3;
  if (v3)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 getDevicesWithFlags:1 error:0]);
    char v6 = v5;
    if (v5)
    {
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v7 = v5;
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v15;
LABEL_5:
        uint64_t v11 = 0LL;
        while (1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CBProductInfo productInfoWithProductID:]( CBProductInfo,  "productInfoWithProductID:",  objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "productID", (void)v14)));
          unsigned int v13 = [v12 flags];

          if ((v13 & 0x100000) != 0) {
            break;
          }
          if (v9 == (id)++v11)
          {
            id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (v9) {
              goto LABEL_5;
            }
            break;
          }
        }
      }
    }
  }

  -[CBAccessoryDaemon _accessoryDiscoveryEnsureStopped](self, "_accessoryDiscoveryEnsureStopped");
  if (self->_prefAccessoryDaemonConnectionMonitor) {
    -[CBAccessoryDaemon _connectionMonitorEnsureStarted](self, "_connectionMonitorEnsureStarted");
  }
  else {
    -[CBAccessoryDaemon _connectionMonitorEnsureStopped](self, "_connectionMonitorEnsureStopped");
  }
  -[CBAccessoryDaemon _connectionMonitorUpdate](self, "_connectionMonitorUpdate", (void)v14);
}

- (void)_accessoryDiscoveryEnsureStarted
{
  if (!self->_accessoryDiscovery)
  {
    if (dword_1008D5F68 <= 30
      && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _accessoryDiscoveryEnsureStarted]",  30LL,  "Accessory discovery start");
    }

    unsigned int v3 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
    accessoryDiscovery = self->_accessoryDiscovery;
    self->_accessoryDiscovery = v3;
    unsigned int v5 = v3;

    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBAccessoryDaemon description](self, "description"));
    -[CBDiscovery setAppID:](v5, "setAppID:", v6);

    -[CBDiscovery setDiscoveryFlags:](v5, "setDiscoveryFlags:", 0x180000000080LL);
    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000AA64;
    v8[3] = &unk_10087EF10;
    v8[4] = v5;
    v8[5] = self;
    -[CBDiscovery setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000AA80;
    v7[3] = &unk_10087EF38;
    v7[4] = v5;
    v7[5] = self;
    -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v7);
  }

- (void)_accessoryDiscoveryEnsureStopped
{
  if (self->_accessoryDiscovery
    && dword_1008D5F68 <= 30
    && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
  {
    LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _accessoryDiscoveryEnsureStopped]",  30LL,  "Accessory discovery stop");
  }

  -[CBDiscovery invalidate](self->_accessoryDiscovery, "invalidate");
  accessoryDiscovery = self->_accessoryDiscovery;
  self->_accessoryDiscovery = 0LL;

  accessoryFakeDevice = self->_accessoryFakeDevice;
  self->_accessoryFakeDevice = 0LL;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_accessoryInfoMap,  "enumerateKeysAndObjectsUsingBlock:",  &stru_10087EF78);
  accessoryInfoMap = self->_accessoryInfoMap;
  self->_accessoryInfoMap = 0LL;
}

- (void)_accessoryDiscoveryFoundDevice:(id)a3
{
  id v14 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
  if (v4)
  {
    unsigned int v5 = (CBAccessoryInfo *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_accessoryInfoMap,  "objectForKeyedSubscript:",  v4));
    if (!v5)
    {
      unsigned int v5 = objc_alloc_init(&OBJC_CLASS___CBAccessoryInfo);
      accessoryInfoMap = self->_accessoryInfoMap;
      if (!accessoryInfoMap)
      {
        id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v8 = self->_accessoryInfoMap;
        self->_accessoryInfoMap = v7;

        accessoryInfoMap = self->_accessoryInfoMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](accessoryInfoMap, "setObject:forKeyedSubscript:", v5, v4);
    }

    -[CBAccessoryInfo setCbDevice:](v5, "setCbDevice:", v14);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CBAccessoryInfo primaryCBDevice](v5, "primaryCBDevice"));
    if (!v9
      || (uint64_t v10 = (void *)v9,
          unint64_t v11 = (unint64_t)[v14 changeFlags],
          v10,
          (v11 & 0x80000000000LL) != 0))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBAccessoryDaemon findPrimaryCBDevice:](self, "findPrimaryCBDevice:", v12));
      -[CBAccessoryInfo setPrimaryCBDevice:](v5, "setPrimaryCBDevice:", v13);
    }

    if (dword_1008D5F68 <= 30
      && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _accessoryDiscoveryFoundDevice:]",  30LL,  "Accessory found: %@, device: %@",  v5,  v14);
    }

    -[CBAccessoryInfo powerSourceUpdate](v5, "powerSourceUpdate");
  }
}

- (void)_connectionMonitorEnsureStarted
{
  if (!self->_connectionMonitor)
  {
    if (dword_1008D5F68 <= 30
      && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorEnsureStarted]",  30LL,  "Connection monitor: start");
    }

    unsigned int v3 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
    connectionMonitor = self->_connectionMonitor;
    self->_connectionMonitor = v3;
    unsigned int v5 = v3;

    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBAccessoryDaemon description](self, "description"));
    -[CBDiscovery setAppID:](v5, "setAppID:", v6);

    -[CBDiscovery setDiscoveryFlags:](v5, "setDiscoveryFlags:", 0x80000A00000LL);
    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000AEEC;
    v9[3] = &unk_10087EF10;
    v9[4] = v5;
    v9[5] = self;
    -[CBDiscovery setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000AFA0;
    v8[3] = &unk_10087EF10;
    v8[4] = v5;
    v8[5] = self;
    -[CBDiscovery setDeviceLostHandler:](v5, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000B04C;
    v7[3] = &unk_10087EF38;
    v7[4] = v5;
    v7[5] = self;
    -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v7);
  }

- (void)_connectionMonitorEnsureStopped
{
  if (self->_connectionMonitor
    && dword_1008D5F68 <= 30
    && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
  {
    LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorEnsureStopped]",  30LL,  "Connection monitor: stop");
  }

  -[CBDiscovery invalidate](self->_connectionMonitor, "invalidate");
  connectionMonitor = self->_connectionMonitor;
  self->_connectionMonitor = 0LL;
}

- (void)_connectionMonitorFoundDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[CBProductInfo productInfoWithProductID:]( CBProductInfo,  "productInfoWithProductID:",  [v4 productID]));
  if (([v5 flags] & 0x100000) != 0)
  {
    if (([v4 deviceFlags] & 0x40) != 0)
    {
      char v6 = (void *)objc_claimAutoreleasedReturnValue([v4 findMyCaseIdentifier]);
      if (v6)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectionMap,  "objectForKeyedSubscript:",  v6));
        if (v7)
        {
          if (dword_1008D5F68 <= 30
            && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
          {
            LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]",  30LL,  "Connection monitor: skip already connected: %@",  v4);
          }
        }

        else
        {
          CFTypeID TypeID = CFDictionaryGetTypeID();
          uint64_t v9 = (void *)CFPrefs_CopyTypedValue( @"com.apple.bluetooth",  @"accessoryDaemonConnectTimes",  TypeID,  0LL);
          double Double = CFDictionaryGetDouble(v9, v6, 0LL);
          double Current = CFAbsoluteTimeGetCurrent();
          double v12 = Current - Double;
          if (Current - Double < self->_prefAccessoryDaemonConnectSeconds)
          {
            if (dword_1008D5F68 <= 30)
            {
              if (dword_1008D5F68 != -1
                || (int v20 = _LogCategory_Initialize(&dword_1008D5F68, 30LL), v12 = Current - Double, v20))
              {
                uint64_t v18 = CUPrintDurationDouble(v12);
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
                LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]",  30LL,  "Connection monitor: skip connected too recently: %@, %@",  v4,  v19);
              }
            }
          }

          else
          {
            unsigned int v13 = objc_alloc_init(&OBJC_CLASS___CBDevice);
            -[CBDevice setIdentifier:](v13, "setIdentifier:", v6);
            if (dword_1008D5F68 <= 30
              && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
            {
              LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]",  30LL,  "Connection monitor: connect start %@",  v13);
            }

            id v14 = objc_alloc_init(&OBJC_CLASS___CBConnection);
            -[CBConnection setConnectionFlags:](v14, "setConnectionFlags:", 256LL);
            -[CBConnection setConnectionScanDutyCycle:](v14, "setConnectionScanDutyCycle:", 6LL);
            -[CBConnection setDispatchQueue:](v14, "setDispatchQueue:", self->_dispatchQueue);
            -[CBConnection setPeerDevice:](v14, "setPeerDevice:", v13);
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472LL;
            v21[2] = sub_10000B590;
            v21[3] = &unk_10087EFA0;
            v21[4] = v13;
            v21[5] = v14;
            v21[6] = self;
            v21[7] = v6;
            v21[8] = v9;
            *(double *)&v21[9] = Current;
            -[CBConnection activateWithCompletion:](v14, "activateWithCompletion:", v21);
            connectionMap = self->_connectionMap;
            if (!connectionMap)
            {
              __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              __int128 v17 = self->_connectionMap;
              self->_connectionMap = v16;

              connectionMap = self->_connectionMap;
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:](connectionMap, "setObject:forKeyedSubscript:", v14, v6);
          }
        }
      }

      else if (dword_1008D5F68 <= 30 {
             && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
      }
      {
        LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]",  30LL,  "Connection monitor: skip no FindMy case ID: %@",  v4);
      }
    }

    else if (dword_1008D5F68 <= 30 {
           && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
    }
    {
      LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]",  30LL,  "Connection monitor: skip not active route: %@",  v4);
    }
  }

  else if (dword_1008D5F68 <= 30 {
         && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
  }
  {
    LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]",  30LL,  "Connection monitor: skip non-BTC: %@",  v4);
  }
}

- (void)_connectionMonitorUpdate
{
  double Current = CFAbsoluteTimeGetCurrent();
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_connectionMap, "allKeys"));
  id v5 = [v4 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectionMap,  "objectForKeyedSubscript:",  v9));
        [v10 connectedTime];
        if (v11 != 0.0 && Current - v11 >= self->_prefAccessoryDaemonStayConnectedSeconds)
        {
          if (dword_1008D5F68 <= 30
            && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
          {
            LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorUpdate]",  30LL,  "Connection monitor: auto-disconnect %@",  v9);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_connectionMap,  "setObject:forKeyedSubscript:",  0LL,  v9);
          [v10 invalidate];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }

    while (v6);
  }

  CFTypeID TypeID = CFDictionaryGetTypeID();
  unsigned int v13 = (void *)CFPrefs_CopyTypedValue(@"com.apple.bluetooth", @"accessoryDaemonConnectTimes", TypeID, 0LL);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]);
  id v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v15)
  {
    id v16 = v15;
    __int128 v17 = 0LL;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)j);
        if (Current - CFDictionaryGetDouble(v13, v20, 0LL) >= self->_prefAccessoryDaemonConnectSeconds)
        {
          if (dword_1008D5F68 <= 30
            && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
          {
            LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorUpdate]",  30LL,  "Connection monitor: remove stale connect time %@",  v20);
          }

          if (!v17)
          {
            id v21 = [v13 mutableCopy];
            int v22 = v21;
            if (v21) {
              int v23 = (NSMutableDictionary *)v21;
            }
            else {
              int v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            }
            __int128 v17 = v23;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", 0LL, v20);
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v16);
  }

  else
  {
    __int128 v17 = 0LL;
  }

  if (-[NSMutableDictionary count](v17, "count"))
  {
    CFPrefs_SetValue(@"com.apple.bluetooth", @"accessoryDaemonConnectTimes", v17);
  }

  else if (v17)
  {
    CFPrefs_RemoveValue(@"com.apple.bluetooth", @"accessoryDaemonConnectTimes");
  }

  if (-[NSMutableDictionary count](v17, "count") || -[NSMutableDictionary count](self->_connectionMap, "count"))
  {
    id v24 = self->_periodicTimer;
    if (v24)
    {
LABEL_52:

      goto LABEL_53;
    }

    if (dword_1008D5F68 <= 30
      && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorUpdate]",  30LL,  "Connection monitor: periodic timer start");
    }

    dispatch_source_t v26 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_periodicTimer, v26);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000BC0C;
    handler[3] = &unk_10087EFC8;
    id v24 = v26;
    __int128 v29 = v24;
    BOOL v30 = self;
    dispatch_source_set_event_handler((dispatch_source_t)v24, handler);
    CUDispatchTimerSet(v24, 30.0, 30.0, 5.0);
    dispatch_activate((dispatch_object_t)v24);
    __int128 v27 = v29;
LABEL_51:

    goto LABEL_52;
  }

  periodicTimer = self->_periodicTimer;
  if (periodicTimer)
  {
    if (dword_1008D5F68 >= 31)
    {
      id v24 = periodicTimer;
LABEL_57:
      dispatch_source_cancel((dispatch_source_t)v24);
      __int128 v27 = self->_periodicTimer;
      self->_periodicTimer = 0LL;
      goto LABEL_51;
    }

    if (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL)) {
      LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryDaemon _connectionMonitorUpdate]",  30LL,  "Connection monitor: periodic timer stop");
    }
    id v24 = self->_periodicTimer;
    if (v24) {
      goto LABEL_57;
    }
  }

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end