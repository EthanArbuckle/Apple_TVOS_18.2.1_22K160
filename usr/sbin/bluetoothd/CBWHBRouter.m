@interface CBWHBRouter
- (BOOL)insertIntoDeviceTableWithKey:(id)a3 value:(id)a4;
- (BOOL)insertIntoWHBHostTableWithKey:(id)a3 value:(id)a4;
- (CBWHBRouter)init;
- (CBWHBRouter)initWithOptions:(unint64_t)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)getCBDeviceForStableId:(id)a3 onHost:(id)a4;
- (id)optimalWHBHostForStableIdentifier:(id)a3 result:(int *)a4;
- (id)rankWHBHosts:(id)a3;
- (unint64_t)calculateMetricforDevice:(id)a3 onHost:(id)a4;
- (unint64_t)coexUsageOfWHBHost:(id)a3;
- (void)activate;
- (void)coexChangeNotification:(id)a3;
- (void)deviceConnectionInterruptedOn:(id)a3;
- (void)deviceFound:(id)a3;
- (void)deviceLost:(id)a3;
- (void)hostConnectionInterruptedOn:(id)a3;
- (void)invalidate;
- (void)receivedUpdateEvent:(id)a3 hostID:(id)a4;
- (void)removeDeviceFromDeviceTable:(id)a3 value:(id)a4;
- (void)removeFromDeviceTableWithKey:(id)a3 value:(id)a4;
- (void)removefromRemoteHostMapWithKey:(id)a3;
- (void)removefromRemoteHostMapWithKey:(id)a3 value:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)subscribeToCoexStateUpdates;
- (void)unSubscribeFromCoexStateUpdates;
- (void)updateCoexUpdate:(id)a3 whbHost:(id)a4;
@end

@implementation CBWHBRouter

- (CBWHBRouter)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CBWHBRouter;
  v2 = -[CBWHBRouter init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    deviceTable = v2->_deviceTable;
    v2->_deviceTable = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    whbHostTable = v2->_whbHostTable;
    v2->_whbHostTable = v5;

    v2->_options = 7LL;
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v2->_isActivated = 0;
  }

  if (dword_1008D60F8 <= 30 && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
  {
    v7 = "SUCCESS";
    if (!v2) {
      v7 = "FAILURE";
    }
    LogPrintF_safe(&dword_1008D60F8, "-[CBWHBRouter init]", 30LL, "Init status : %s", v7);
  }

  return v2;
}

- (CBWHBRouter)initWithOptions:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CBWHBRouter;
  v4 = -[CBWHBRouter init](&v11, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    deviceTable = v4->_deviceTable;
    v4->_deviceTable = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    whbHostTable = v4->_whbHostTable;
    v4->_whbHostTable = v7;

    v4->_options = a3 | 1;
    objc_storeStrong((id *)&v4->_dispatchQueue, &_dispatch_main_q);
    v4->_isActivated = 0;
  }

  if (dword_1008D60F8 <= 30 && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
  {
    objc_super v9 = "SUCCESS";
    if (!v4) {
      objc_super v9 = "FAILURE";
    }
    LogPrintF_safe(&dword_1008D60F8, "-[CBWHBRouter initWithOptions:]", 30LL, "Init status : %s", v9);
  }

  return v4;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  self->_isActivated = 1;
}

- (void)invalidate
{
  self->_isActivated = 0;
  -[CBWHBRouter unSubscribeFromCoexStateUpdates](self, "unSubscribeFromCoexStateUpdates");
}

- (unint64_t)coexUsageOfWHBHost:(id)a3
{
  id v4 = a3;
  if ((self->_options & 2) == 0)
  {
    unint64_t v5 = 1LL;
LABEL_23:
    if (dword_1008D60F8 <= 30
      && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter coexUsageOfWHBHost:]",  30LL,  " CoexUsage:%llu for WHBHost:%@",  v5,  v4);
    }

    goto LABEL_27;
  }

  int v19 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbHostTable, "objectForKeyedSubscript:", v4));
  if (v6)
  {
    v7 = v6;
    id v8 = [v6 estimatedConnectionsLastUpdatedTicks];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = mach_absolute_time();
      if ((unint64_t)UpTicksToSeconds(v10 - (void)v9) >= 0xA)
      {
        [v7 setEstimatedConnections:0];
        [v7 setEstimatedConnectionsLastUpdatedTicks:0];
      }
    }

    uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"whbMaxLEConnections", &v19);
    unint64_t v12 = 3LL;
    if (!v19)
    {
      unint64_t v13 = Int64;
      if (Int64 != 3)
      {
        if (dword_1008D60F8 <= 30
          && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
        {
          LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter coexUsageOfWHBHost:]",  30LL,  "WHB Max LE Connections: %llu -> %llu",  3LL,  v13);
        }

        unint64_t v12 = v13;
      }
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 coexUsage]);
    id v15 = [v14 numLEConnection];

    if ((unint64_t)v15 >= v12)
    {
      unint64_t v5 = 0LL;
    }

    else
    {
      v16 = (char *)[v7 estimatedConnections];
      v17 = (void *)objc_claimAutoreleasedReturnValue([v7 coexUsage]);
      unint64_t v5 = &v16[(void)[v17 numLEConnection]] < (char *)3;
    }

    goto LABEL_23;
  }

  unint64_t v5 = 0LL;
LABEL_27:

  return v5;
}

- (id)rankWHBHosts:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceTable, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    v21 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 hostMap]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10002508C;
    v26[3] = &unk_10087F870;
    v26[4] = self;
    id v20 = v4;
    id v27 = v20;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingComparator:v26]);

    id v10 = [v9 mutableCopy];
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          if ((self->_options & 2) != 0)
          {
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
            if (!-[CBWHBRouter coexUsageOfWHBHost:](self, "coexUsageOfWHBHost:", v16))
            {
              if (dword_1008D60F8 <= 30
                && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
              {
                LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter rankWHBHosts:]",  30LL,  "Removed host: %@ from ranked list",  v16);
              }

              [v10 removeObject:v16];
            }
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }

      while (v13);
    }

    id v17 = [v10 count];
    if (dword_1008D60F8 <= 30
      && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter rankWHBHosts:]",  30LL,  "Device %@ ranked %llu hosts succesfully",  v20,  v17);
    }

    if (v17
      && dword_1008D60F8 <= 30
      && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", @", "));
      LogPrintF_safe(&dword_1008D60F8, "-[CBWHBRouter rankWHBHosts:]", 30LL, "RankedHosts: %@", v18);
    }

    v6 = v21;
  }

  else
  {
    if (dword_1008D60F8 <= 30
      && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D60F8, "-[CBWHBRouter rankWHBHosts:]", 30LL, "Failed to Rank for Device : %@", v4);
    }

    id v10 = 0LL;
  }

  return v10;
}

- (void)subscribeToCoexStateUpdates
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"coexChangeNotification:" name:@"com.apple.bluetooth.leconnection" object:0];
}

- (void)unSubscribeFromCoexStateUpdates
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"com.apple.bluetooth.leconnection" object:0];
}

- (void)coexChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002522C;
  v7[3] = &unk_10087EFC8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)insertIntoDeviceTableWithKey:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stableIdentifier]);
  if (v8)
  {
    id v9 = (CBDeviceEntry *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceTable,  "objectForKeyedSubscript:",  v8));
    if (v9)
    {
      id v10 = v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDeviceEntry hostMap](v9, "hostMap"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v7]);
      id v13 = v12;
      if (v12)
      {
        [v12 floatValue];
        *(float *)&double v15 = (float)(v14 + (float)(int)[v6 bleRSSI]) * 0.5;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15));
        [v11 setObject:v16 forKeyedSubscript:v7];

        if (dword_1008D60F8 <= 30
          && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
        {
          id v17 = [v6 bleRSSI];
          v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v7]);
          LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter insertIntoDeviceTableWithKey:value:]",  30LL,  "Updated an entry on Device Table with RSSI %d and  Average RSSI : %@",  v17,  v18);
        }
      }

      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v6 bleRSSI]));
        [v11 setObject:v21 forKeyedSubscript:v7];

        if (dword_1008D60F8 <= 30
          && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
        {
          LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter insertIntoDeviceTableWithKey:value:]",  30,  "Added new Host entry on Device Table with RSSI %d ",  [v6 bleRSSI]);
        }
      }
    }

    else
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___CBDeviceEntry);
      int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 bleRSSI]));
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBDeviceEntry hostMap](v10, "hostMap"));
      [v20 setObject:v19 forKeyedSubscript:v7];

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceTable, "setObject:forKeyedSubscript:", v10, v8);
      if (dword_1008D60F8 <= 30
        && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
      {
        LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter insertIntoDeviceTableWithKey:value:]",  30LL,  "Successfully created a new entry into Device Table");
      }
    }
  }

  return v8 != 0LL;
}

- (void)removeDeviceFromDeviceTable:(id)a3 value:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceTable, "objectForKeyedSubscript:", v10));
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 hostMap]);
    [v9 removeObjectForKey:v6];
  }

  if (dword_1008D60F8 <= 30 && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL))) {
    LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter removeDeviceFromDeviceTable:value:]",  30LL,  "CBDevice %@ on WHBHost %@ is successfully removed from Device Table",  v10,  v6);
  }
}

- (void)removeFromDeviceTableWithKey:(id)a3 value:(id)a4
{
  id v7 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 stableIdentifier]);
  if (v6) {
    -[CBWHBRouter removeDeviceFromDeviceTable:value:](self, "removeDeviceFromDeviceTable:value:", v6, v7);
  }
}

- (unint64_t)calculateMetricforDevice:(id)a3 onHost:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  unint64_t v9 = 0LL;
  if (v6 && v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceTable, "objectForKeyedSubscript:", v6));
    id v11 = v10;
    if (v10)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 hostMap]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v8]);
      float v14 = v13;
      if (v13)
      {
        [v13 floatValue];
        float v16 = v15;
        if (v15 <= -85.0)
        {
          unint64_t v9 = 0LL;
        }

        else if (v15 < -85.0 || v15 > -80.0)
        {
          BOOL v18 = v15 > -50.0 || v15 < -70.0;
          uint64_t v19 = 3LL;
          if (v18) {
            uint64_t v19 = 4LL;
          }
          if (v15 < -80.0 || v15 > -70.0) {
            unint64_t v9 = v19;
          }
          else {
            unint64_t v9 = 2LL;
          }
        }

        else
        {
          unint64_t v9 = 1LL;
        }

        if ((self->_options & 2) != 0) {
          v9 *= -[CBWHBRouter coexUsageOfWHBHost:](self, "coexUsageOfWHBHost:", v8);
        }
      }

      else
      {
        unint64_t v9 = 0LL;
        float v16 = 0.0;
      }
    }

    else
    {
      unint64_t v9 = 0LL;
      float v16 = 0.0;
    }

    if (dword_1008D60F8 <= 30
      && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter calculateMetricforDevice:onHost:]",  30LL,  "CBDevice %@ on WHBHost %@ has RSSI: %f and ranked: %lld",  v6,  v8,  v16,  v9);
    }
  }

  return v9;
}

- (BOOL)insertIntoWHBHostTableWithKey:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stableIdentifier]);
  if (v8)
  {
    unint64_t v9 = (CBWHBHostEntry *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_whbHostTable,  "objectForKeyedSubscript:",  v6));
    if (v9)
    {
      id v10 = v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBHostEntry deviceList](v9, "deviceList"));
      [v11 setObject:v7 forKeyedSubscript:v8];

      if (dword_1008D60F8 <= 30
        && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
      {
        LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter insertIntoWHBHostTableWithKey:value:]",  30LL,  "Added an entry for device : %@ to WHBHost Table for WHBHost: %@",  v7,  v6);
      }
    }

    else
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___CBWHBHostEntry);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBHostEntry deviceList](v10, "deviceList"));
      [v12 setObject:v7 forKeyedSubscript:v8];

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_whbHostTable, "setObject:forKeyedSubscript:", v10, v6);
      if (dword_1008D60F8 <= 30
        && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
      {
        LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter insertIntoWHBHostTableWithKey:value:]",  30LL,  "Created an entry for device : %@ on WHBHost Table for WHBHost: %@",  v7,  v6);
      }
    }
  }

  else if (dword_1008D60F8 <= 90 {
         && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 90LL)))
  }
  {
    LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter insertIntoWHBHostTableWithKey:value:]",  90LL,  "StableIdentifier for device : %@ is nil",  v7);
  }

  return v8 != 0LL;
}

- (void)removefromRemoteHostMapWithKey:(id)a3 value:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stableIdentifier]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbHostTable, "objectForKeyedSubscript:", v11));
    unint64_t v9 = v8;
    if (v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceList]);
      [v10 removeObjectForKey:v7];
    }

    if (dword_1008D60F8 <= 30
      && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter removefromRemoteHostMapWithKey:value:]",  30LL,  "Removed an entry for device : %@ from WHBHost Table for WHBHost: %@",  v6,  v11);
    }
  }

  else if (dword_1008D60F8 <= 90 {
         && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 90LL)))
  }
  {
    LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter removefromRemoteHostMapWithKey:value:]",  90LL,  "StableIdentifier for device : %@ is nil",  v6);
  }
}

- (void)removefromRemoteHostMapWithKey:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbHostTable, "objectForKeyedSubscript:"));
  if (v4)
  {
    if (dword_1008D60F8 <= 30
      && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter removefromRemoteHostMapWithKey:]",  30LL,  "Removing all the devices on WHBHost: %@",  v6);
    }

    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceList]);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100025E44;
    v7[3] = &unk_10087F898;
    void v7[4] = self;
    id v8 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v7];
  }

  -[NSMutableDictionary removeObjectForKey:](self->_whbHostTable, "removeObjectForKey:", v6);
  if (dword_1008D60F8 <= 30 && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL))) {
    LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter removefromRemoteHostMapWithKey:]",  30LL,  "Removed an entry for WHBHost: %@ from WHBHost Table",  v6);
  }
}

- (void)deviceFound:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (self->_isActivated)
  {
    if (v4)
    {
      id v11 = v4;
      if ([v4 bleRSSI])
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 stableIdentifier]);
        if (v6)
        {
          id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteHostID]);
          if (v7) {
            id v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 remoteHostID]);
          }
          else {
            id v8 = @"CBLocalHostID";
          }

          if (dword_1008D60F8 <= 30
            && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
          {
            LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter deviceFound:]",  30LL,  "Device: %@ found on WHBHost: %@",  v6,  v8);
          }

          -[CBWHBRouter insertIntoDeviceTableWithKey:value:](self, "insertIntoDeviceTableWithKey:value:", v11, v8);
          -[CBWHBRouter insertIntoWHBHostTableWithKey:value:](self, "insertIntoWHBHostTableWithKey:value:", v8, v11);
        }

        goto LABEL_23;
      }

      unint64_t v5 = v11;
      if (dword_1008D60F8 <= 90)
      {
        if (dword_1008D60F8 != -1 || (v10 = _LogCategory_Initialize(&dword_1008D60F8, 90LL), unint64_t v5 = v11, v10))
        {
          LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter deviceFound:]",  90LL,  "RSSI is unknown. Ignoring device found event");
          goto LABEL_23;
        }
      }
    }
  }

  else if (dword_1008D60F8 <= 90)
  {
    id v11 = v4;
    if (dword_1008D60F8 != -1 || (int v9 = _LogCategory_Initialize(&dword_1008D60F8, 90LL), v5 = v11, v9))
    {
      LogPrintF_safe(&dword_1008D60F8, "-[CBWHBRouter deviceFound:]", 90LL, "WHB Router object is not activated");
LABEL_23:
      unint64_t v5 = v11;
    }
  }
}

- (void)deviceLost:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (self->_isActivated)
  {
    if (v4)
    {
      int v10 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stableIdentifier]);
      if (v6)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteHostID]);
        if (v7) {
          id v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 remoteHostID]);
        }
        else {
          id v8 = @"CBLocalHostID";
        }

        if (dword_1008D60F8 <= 30
          && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
        {
          LogPrintF_safe(&dword_1008D60F8, "-[CBWHBRouter deviceLost:]", 30LL, "Device: %@ lost on WHBHost: %@", v6, v8);
        }

        -[CBWHBRouter removeFromDeviceTableWithKey:value:](self, "removeFromDeviceTableWithKey:value:", v10, v8);
        -[CBWHBRouter removefromRemoteHostMapWithKey:value:](self, "removefromRemoteHostMapWithKey:value:", v8, v10);
      }

      goto LABEL_18;
    }
  }

  else if (dword_1008D60F8 <= 90)
  {
    int v10 = v4;
    if (dword_1008D60F8 != -1 || (int v9 = _LogCategory_Initialize(&dword_1008D60F8, 90LL), v5 = v10, v9))
    {
      LogPrintF_safe(&dword_1008D60F8, "-[CBWHBRouter deviceLost:]", 90LL, "WHB Router object is not activated");
LABEL_18:
      unint64_t v5 = v10;
    }
  }
}

- (void)hostConnectionInterruptedOn:(id)a3
{
  id v4 = (__CFString *)a3;
  unint64_t v5 = v4;
  if (self->_isActivated)
  {
    id v6 = @"CBLocalHostID";
    int v10 = v4;
    if (v4) {
      id v6 = v4;
    }
    id v7 = v6;
    if (dword_1008D60F8 <= 30
      && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter hostConnectionInterruptedOn:]",  30LL,  "WHB Infrastructure connection interruptted to WHBHost: %@",  v7);
    }

    -[CBWHBRouter removefromRemoteHostMapWithKey:](self, "removefromRemoteHostMapWithKey:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon"));
    [v8 reportWhbMetric:&off_1008C2F08];

    goto LABEL_12;
  }

  if (dword_1008D60F8 <= 90)
  {
    int v10 = v4;
    if (dword_1008D60F8 != -1 || (int v9 = _LogCategory_Initialize(&dword_1008D60F8, 90LL), v5 = v10, v9))
    {
      LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter hostConnectionInterruptedOn:]",  90LL,  "WHB Router object is not activated");
LABEL_12:
      unint64_t v5 = v10;
    }
  }
}

- (void)deviceConnectionInterruptedOn:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (self->_isActivated)
  {
    id v9 = v4;
    if (dword_1008D60F8 <= 30)
    {
      if (dword_1008D60F8 != -1 || (v6 = _LogCategory_Initialize(&dword_1008D60F8, 30LL), unint64_t v5 = v9, v6)) {
        LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter deviceConnectionInterruptedOn:]",  30LL,  "Device connection interruptted to device: %@",  v5);
      }
    }

    -[CBWHBRouter deviceLost:](self, "deviceLost:", v9);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon"));
    [v7 reportWhbMetric:&off_1008C2F30];

    goto LABEL_10;
  }

  if (dword_1008D60F8 <= 90)
  {
    id v9 = v4;
    if (dword_1008D60F8 != -1 || (v8 = _LogCategory_Initialize(&dword_1008D60F8, 90LL), unint64_t v5 = v9, v8))
    {
      LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter deviceConnectionInterruptedOn:]",  90LL,  "WHB Router object is not activated");
LABEL_10:
      unint64_t v5 = v9;
    }
  }
}

- (id)optimalWHBHostForStableIdentifier:(id)a3 result:(int *)a4
{
  id v6 = a3;
  if (self->_isActivated)
  {
    if (a4) {
      *a4 = 0;
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceTable, "objectForKeyedSubscript:", v6));
    if (!v7)
    {
      if (dword_1008D60F8 <= 90
        && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 90LL)))
      {
        LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter optimalWHBHostForStableIdentifier:result:]",  90LL,  "WHB Router device: %@ is not yet discovered",  v6);
      }

      id v15 = 0LL;
      if (a4) {
        *a4 = 1701;
      }
      goto LABEL_32;
    }

    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBRouter rankWHBHosts:](self, "rankWHBHosts:", v6));
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 firstObject]);
      if (v10)
      {
        id v11 = (void *)v10;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBRouter getCBDeviceForStableId:onHost:](self, "getCBDeviceForStableId:onHost:", v6, v10));
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_whbHostTable,  "objectForKeyedSubscript:",  v11));
        objc_msgSend(v13, "setEstimatedConnections:", (char *)objc_msgSend(v13, "estimatedConnections") + 1);
        [v13 setEstimatedConnectionsLastUpdatedTicks:mach_absolute_time()];
        if (dword_1008D60F8 <= 30
          && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
        {
          LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter optimalWHBHostForStableIdentifier:result:]",  30,  "Estimated Connections:%llu for WHBHost:%@",  [v13 estimatedConnections],  v11);
        }

        id v20 = @"CBWHBMetricsKeyEventType";
        v21 = @"CBWHBMetricsKeySubEventType";
        __int128 v23 = @"WhbStateEvent";
        __int128 v24 = @"OptimalWHBHost";
        __int128 v22 = @"CBWHBMetricsKeyHostIdentifier";
        unsigned int v16 = [v11 isEqual:@"CBLocalHostID"];
        float v14 = @"NotLocal";
        if (v16) {
          float v14 = @"Local";
        }
        goto LABEL_27;
      }

      if (a4) {
        *a4 = 345;
      }
    }

    id v12 = 0LL;
    id v11 = 0LL;
    id v20 = @"CBWHBMetricsKeyEventType";
    v21 = @"CBWHBMetricsKeySubEventType";
    __int128 v23 = @"WhbStateEvent";
    __int128 v24 = @"OptimalWHBHost";
    __int128 v22 = @"CBWHBMetricsKeyHostIdentifier";
    float v14 = @"None";
LABEL_27:
    __int128 v25 = v14;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v20,  3LL));
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon"));
    [v18 reportWhbMetric:v17];

    if (dword_1008D60F8 <= 30
      && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter optimalWHBHostForStableIdentifier:result:]",  30LL,  "Optimal host to reach stableId: %@ is %@ via CBDevice:%@",  v6,  v11,  v12,  v20,  v21,  v22,  v23,  v24);
    }

    id v15 = v12;

LABEL_32:
    goto LABEL_33;
  }

  if (dword_1008D60F8 <= 90 && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 90LL))) {
    LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter optimalWHBHostForStableIdentifier:result:]",  90LL,  "WHB Router object is not activated");
  }
  id v15 = 0LL;
LABEL_33:

  return v15;
}

- (id)getCBDeviceForStableId:(id)a3 onHost:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbHostTable, "objectForKeyedSubscript:", v7));
  id v9 = v8;
  uint64_t v17 = 0LL;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_10002690C;
  v21 = sub_10002691C;
  id v22 = 0LL;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceList]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100026924;
    v13[3] = &unk_10087F8C0;
    id v14 = v6;
    id v15 = v7;
    unsigned int v16 = &v17;
    [v10 enumerateKeysAndObjectsUsingBlock:v13];
  }

  else if (dword_1008D60F8 <= 90 {
         && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 90LL)))
  }
  {
    LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter getCBDeviceForStableId:onHost:]",  90LL,  "Unable to find entry for stableIdentifier:%@ on WHBHost: %@",  v6,  v7);
  }

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)description
{
  return -[CBWHBRouter descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 > 0x14u)
  {
    uint64_t v17 = 0LL;
    id v10 = [(id)objc_opt_class(self) description];
    int v8 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
    id v11 = -[NSMutableDictionary count](self->_deviceTable, "count");
    id v16 = -[NSMutableDictionary count](self->_whbHostTable, "count");
    id v9 = (id *)&v17;
    NSAppendPrintF_safe(&v17, "%@: devices %d, hosts %d", v8, v11, v16);
    goto LABEL_7;
  }

  id v22 = 0LL;
  id v4 = [(id)objc_opt_class(self) description];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF_safe(&v22, "== %@ ==\n", v5);
  id v6 = (__CFString *)v22;

  if (self->_deviceTable)
  {
    v21 = v6;
    NSAppendPrintF_safe(&v21, "DeviceTable:\n");
    id v7 = v21;

    id v20 = v7;
    NSAppendPrintF_safe(&v20, "%@", self->_deviceTable);
    id v6 = v20;
  }

  if (self->_whbHostTable)
  {
    uint64_t v19 = v6;
    NSAppendPrintF_safe(&v19, "WHBHostTable:\n");
    int v8 = v19;

    BOOL v18 = v8;
    whbHostTable = self->_whbHostTable;
    id v9 = (id *)&v18;
    NSAppendPrintF_safe(&v18, "%@", whbHostTable);
LABEL_7:
    id v6 = (__CFString *)*v9;
  }

  if (v6) {
    id v12 = v6;
  }
  else {
    id v12 = &stru_1008A57D8;
  }
  id v13 = v12;

  return v13;
}

- (void)updateCoexUpdate:(id)a3 whbHost:(id)a4
{
  id v12 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"NUMBER_OF_LE_CONNECTIONS"]);
  id v7 = [v6 unsignedLongValue];
  int v8 = (CBWHBHostEntry *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_whbHostTable,  "objectForKeyedSubscript:",  v12));
  if (v8)
  {
    id v9 = v8;
    -[CBWHBHostEntry setEstimatedConnections:](v8, "setEstimatedConnections:", 0LL);
    -[CBWHBHostEntry setEstimatedConnectionsLastUpdatedTicks:](v9, "setEstimatedConnectionsLastUpdatedTicks:", 0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBHostEntry coexUsage](v9, "coexUsage"));
    [v10 setNumLEConnection:v7];
  }

  else
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___CBWHBHostEntry);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBHostEntry coexUsage](v9, "coexUsage"));
    [v11 setNumLEConnection:v7];

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_whbHostTable, "setObject:forKeyedSubscript:", v9, v12);
  }
}

- (void)receivedUpdateEvent:(id)a3 hostID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isActivated)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"NUMBER_OF_LE_CONNECTIONS"]);
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 unsignedLongValue];
      -[CBWHBRouter updateCoexUpdate:whbHost:](self, "updateCoexUpdate:whbHost:", v6, v7);
      v14[0] = @"CBWHBMetricsKeyEventType";
      v14[1] = @"CBWHBMetricsKeySubEventType";
      v15[0] = @"CoexUpdateEvent";
      v15[1] = @"ReceivedCoexUpdate";
      v14[2] = @"CBWHBMetricsKeyNumLEConnections";
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v10));
      v15[2] = v11;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  3LL));

      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon"));
      [v13 reportWhbMetric:v12];
    }

    else if (dword_1008D60F8 <= 90 {
           && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 90LL)))
    }
    {
      LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter receivedUpdateEvent:hostID:]",  90LL,  "Invalid event received from WHBHost %@",  v7);
    }
  }

  else if (dword_1008D60F8 <= 90 {
         && (dword_1008D60F8 != -1 || _LogCategory_Initialize(&dword_1008D60F8, 90LL)))
  }
  {
    LogPrintF_safe( &dword_1008D60F8,  "-[CBWHBRouter receivedUpdateEvent:hostID:]",  90LL,  "WHB Router object is not activated");
  }
}

- (void).cxx_destruct
{
}

@end