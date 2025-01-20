}

LABEL_5:
    -[__CFDictionary setObject:forKeyedSubscript:]( matching,  "setObject:forKeyedSubscript:",  &off_100026A08,  @"PrimaryUsagePage");
    v12 = &off_100026A20;
    v13 = @"PrimaryUsage";
    goto LABEL_6;
  }

  if (v11 == 332 || v11 == 546) {
    goto LABEL_5;
  }
LABEL_15:
  v12 = &off_100026BA8;
  v13 = @"DeviceUsagePairs";
LABEL_6:
  -[__CFDictionary setObject:forKeyedSubscript:](matching, "setObject:forKeyedSubscript:", v12, v13);
  p_notificationIter = &self->_notificationIter;
  if (!IOServiceAddMatchingNotification( self->_notificationPort,  "IOServiceMatched",  matching,  (IOServiceMatchingCallback)sub_100004210,  self,  &self->_notificationIter)
    && *p_notificationIter)
  {
    while (IOIteratorNext(*p_notificationIter))
      ;
  }
}

void sub_100004210(void *a1)
{
  id v1 = a1;
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([v1 logHandle]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100016A54();
  }

  v3 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([v1 matchSemaphore]);
  dispatch_semaphore_signal(v3);

  [v1 clearNotification];
}

void sub_1000059AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11)
{
}

void sub_100005A04(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained hostBatteryCapacity];
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 minBatteryHost]);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Host has low battery of %d%% below minimum threshold %d%%",  v4,  [v5 intValue]));

    v7 = objc_alloc(&OBJC_CLASS___NSError);
    v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) errorDomain]);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    v12 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    v10 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v8, 18LL, v9);
    [v3 setError:v10];

    [v3 executeNextBootstrapAction];
  }
}

void sub_100005B4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained batteryTimer]);

    if (v1)
    {
      v2 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([WeakRetained batteryTimer]);
      dispatch_source_cancel(v2);

      [WeakRetained setBatteryTimer:0];
    }

    if ([WeakRetained batteryToken] != -1)
    {
      notify_cancel((int)[WeakRetained batteryToken]);
      [WeakRetained setBatteryToken:0xFFFFFFFFLL];
    }
  }
}

void sub_100005BE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setHostPowerSource:0];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109376;
      v8[1] = [v3 hostBatteryCapacity];
      __int16 v9 = 1024;
      unsigned int v10 = [v3 hostBatteryOnACPower];
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Host battery %d%% on AC power %d",  (uint8_t *)v8,  0xEu);
    }

    signed int v5 = [v3 hostBatteryCapacity];
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 minBatteryHost]);
    signed int v7 = [v6 intValue];

    if (v5 >= v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      [v3 executeNextBootstrapAction];
    }

    else if (([v3 hostBatteryOnACPower] & 1) == 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }
}

void sub_100005D44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))( *(void *)(a1 + 32),  [WeakRetained batteryToken]);
    int v3 = [v6 hostBatteryCapacity];
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 minBatteryHost]);
    if (v3 >= (int)[v4 intValue])
    {

      goto LABEL_6;
    }

    unsigned int v5 = [v6 hostBatteryOnACPower];

    id WeakRetained = v6;
    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_6:
      id WeakRetained = v6;
    }
  }
}

LABEL_21:
  return v13;
}

  v32 = v13->_plugin;
  if (v32)
  {
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](v32, "logHandle"));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_10001743C((uint64_t)v12, v33);
    }

    v34 = v13->_plugin;
    v35 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"IOMatchLaunchServiceID"]);
    -[SHFUPlugin logIORegistryEntry:](v34, "logIORegistryEntry:", v35);

    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](v13->_plugin, "logHandle"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v13->_plugin;
      *(_DWORD *)buf = 138412290;
      v50 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }

  else
  {
    v36 = (os_log_s *)v13;
    uint64_t v13 = 0LL;
  }

  NSErrorUserInfoKey v11 = v43;
LABEL_28:

  return v13;
}

void sub_10000626C(uint64_t a1, int a2, int a3, void *a4)
{
  if (!(a3 | a2))
  {
    id v5 = a4;
    [v5 setBtSession:a1];
    [v5 btSessionArrived];
  }

void sub_10000658C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000065B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = 0LL;
    id v3 = objc_claimAutoreleasedReturnValue([WeakRetained btAddress]);
    int v4 = BTDeviceAddressFromString([v3 UTF8String], v8);

    if (v4)
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 logHandle]);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100016CB0();
      }
LABEL_13:

      goto LABEL_14;
    }

    int v6 = BTDeviceFromAddress([v2 btSession], v8, &v9);
    signed int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 logHandle]);
    id v5 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100016C50();
      }
      goto LABEL_13;
    }

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100016C24();
    }

    if (BTDeviceConnect(v9))
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 logHandle]);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100016BC4();
      }
      goto LABEL_13;
    }
  }

LABEL_14:
}

void sub_100006974( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000069A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100016D10(v2);
    }

    int v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v2 delayBootstrapSource]);
    dispatch_source_cancel(v4);

    [v2 setDelayBootstrapSource:0];
    [v2 executeNextBootstrapAction];
  }
}

void sub_100006CE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100006CF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained executeNextBootstrapAction];
    id WeakRetained = v2;
  }
}

void sub_100006FF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100007020(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 networkDelay]);
      v7[0] = 67109120;
      v7[1] = [v4 intValue];
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "No network connection after %d seconds",  (uint8_t *)v7,  8u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 networkStatus]);
    if (v5)
    {
      int v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v2 networkStatus]);
      dispatch_source_cancel(v6);

      [v2 setNetworkStatus:0];
    }

    if ([v2 networkReachability])
    {
      SCNetworkReachabilitySetCallback((SCNetworkReachabilityRef)[v2 networkReachability], 0, 0);
      SCNetworkReachabilitySetDispatchQueue((SCNetworkReachabilityRef)[v2 networkReachability], 0);
      CFRelease([v2 networkReachability]);
      [v2 setNetworkReachability:0];
      [v2 executeNextBootstrapAction];
    }
  }
}

id sub_100007180(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 checkNetworkReachability:a2];
}

void sub_10000783C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *location)
{
}

void sub_100007898(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained clearOldRegistryEntryIDs];
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 options]);
    int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"IOMatchLaunchServiceID"]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 abortUpdate]);
    unsigned int v6 = [v5 BOOLValue];

    if (v6)
    {
      signed int v7 = objc_alloc(&OBJC_CLASS___NSError);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v2 errorDomain]);
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      v16 = @"Device not targeted by update/cycle scripts";
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      unsigned int v10 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v8, 35LL, v9);
      [v2 setError:v10];
    }

    else
    {
      if (![v2 abortRegistryEntryID:v4])
      {
LABEL_7:
        [v2 executeNextBootstrapAction];

        goto LABEL_8;
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Abort update for previously seen registry entry ID %@",  v4));
      NSErrorUserInfoKey v11 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v2 errorDomain]);
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      v14 = v8;
      unsigned int v10 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
      v12 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", v9, 57LL, v10);
      [v2 setError:v12];
    }

    goto LABEL_7;
  }

LABEL_8:
}
}

void sub_100007A98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained delayBootstrap];
    id WeakRetained = v2;
  }
}

void sub_100007AC8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
    int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 batteryCheckDevice]);
    id v5 = [v4 BOOLValue];
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v2 logHandle]);
    signed int v7 = (void *)objc_claimAutoreleasedReturnValue([v2 options]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"IOMatchLaunchServiceID"]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v2 errorDomain]);
    id v25 = 0LL;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:",  v3,  v5,  v6,  v8,  v9,  &v25));
    id v11 = v25;

    if (v11)
    {
      [v2 setError:v11];
    }

    else
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      v20 = v10;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
            v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 logHandle]);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "checking updates for %@", buf, 0xCu);
            }

            v19 = (void *)objc_claimAutoreleasedReturnValue([v2 loggingIdentifier]);
            [v17 logVersions:v19];
          }

          id v14 = [v12 countByEnumeratingWithState:&v21 objects:v28 count:16];
        }

        while (v14);
      }

      unsigned int v10 = v20;
    }

    [v2 executeNextBootstrapAction];
  }
}

void sub_100007D40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained deviceNeedsBTReconnect]);
    unsigned int v4 = [v3 BOOLValue];

    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v2 batteryCheckDevice]);
      id v7 = [v6 BOOLValue];
      v8 = (void *)objc_claimAutoreleasedReturnValue([v2 logHandle]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v2 options]);
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"IOMatchLaunchServiceID"]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v2 errorDomain]);
      id v27 = 0LL;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:",  v5,  v7,  v8,  v10,  v11,  &v27));
      id v13 = v27;

      if (v13)
      {
        [v2 setError:v13];
      }

      else
      {
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v14 = v12;
        id v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v24;
          do
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v24 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deviceAddress", (void)v23));
              id v21 = [v20 length];

              if (v21)
              {
                __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceAddress]);
                [v2 setBtAddress:v22];
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
          }

          while (v16);
        }
      }
    }

    objc_msgSend(v2, "executeNextBootstrapAction", (void)v23);
  }
}

void sub_100007F8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained verifyHostBattery];
    id WeakRetained = v2;
  }
}

void sub_100007FBC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained verifyDeviceBattery]);
    [v3 setError:v2];

    [v3 executeNextBootstrapAction];
    id WeakRetained = v3;
  }
}

void sub_100008014(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained networkDelay]);
    if ((int)[v2 intValue] < 1)
    {
    }

    else
    {
      unsigned __int8 v3 = [v4 hostConnectedToNetwork];

      if ((v3 & 1) == 0)
      {
        [v4 waitForNetwork];
LABEL_7:
        id WeakRetained = v4;
        goto LABEL_8;
      }
    }

    [v4 executeNextBootstrapAction];
    goto LABEL_7;
  }

void sub_10000808C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 batteryCheckDevice]);
    id v5 = [v4 BOOLValue];
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v2 logHandle]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v2 options]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"IOMatchLaunchServiceID"]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v2 errorDomain]);
    id v24 = 0LL;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:",  v3,  v5,  v6,  v8,  v9,  &v24));
    id v11 = v24;

    if (v11)
    {
      [v2 setError:v11];
    }

    else
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          id v16 = 0LL;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            if (objc_msgSend( *(id *)(*((void *)&v20 + 1) + 8 * (void)v16),  "GATTServicesDiscoveryNeeded",  (void)v20))
            {
              uint64_t v17 = objc_alloc(&OBJC_CLASS___CBCentralManager);
              v18 = (void *)objc_claimAutoreleasedReturnValue([v2 serialQueue]);
              v19 = -[CBCentralManager initWithDelegate:queue:](v17, "initWithDelegate:queue:", v2, v18);
              [v2 setCentralManager:v19];
            }

            id v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }

        while (v14);
      }
    }

    objc_msgSend(v2, "executeNextBootstrapAction", (void)v20);
  }
}

LABEL_4:
  LOBYTE(v6) = 1;
LABEL_8:

  return v6;
}

void sub_1000090B0(_Unwind_Exception *a1)
{
}

uint64_t sub_100009140(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100009154(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        __int16 v10 = 0;
        id v7 = "Waiting for host sleep";
        v8 = (uint8_t *)&v10;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
    }

    else if (v6)
    {
      __int16 v9 = 0;
      id v7 = "Waiting for system idle";
      v8 = (uint8_t *)&v9;
      goto LABEL_7;
    }
  }
}

id sub_100009204(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10000922C(uint64_t a1)
{
}

void sub_100009234(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10001704C(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    id v13 = objc_alloc(&OBJC_CLASS___TVPSSuppressRemoteConnectivityHUDAssertion);
    id v14 = (objc_class *)objc_opt_class(v4);
    uint64_t v15 = NSStringFromClass(v14);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = -[TVPSSuppressRemoteConnectivityHUDAssertion initWithIdentifier:](v13, "initWithIdentifier:", v16);
    [v4 setRemoteHUDAssertion:v17];

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteHUDAssertion]);
    [v18 acquire];

    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 userInactivityStatus]);
    if (v19)
    {
      __int128 v20 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v4 userInactivityStatus]);
      dispatch_source_cancel(v20);

      [v4 setUserInactivityStatus:0];
    }

    int v21 = *(_DWORD *)(a1 + 48);
    if (v21 == 2)
    {
      __int128 v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 serialQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100009420;
      block[3] = &unk_100024618;
      objc_copyWeak(&v31, v2);
      dispatch_async(v22, block);

      objc_destroyWeak(&v31);
    }

    else if (v21 == 1)
    {
      [v4 commitFirmwareWithOptions:*(void *)(a1 + 32)];
    }

    else if (v21)
    {
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 logHandle]);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100016FE4(a1 + 48, v23, v24, v25, v26, v27, v28, v29);
      }
    }

    else
    {
      [v4 sendFirmwareToDeviceWithOptions:*(void *)(a1 + 32)];
    }
  }
}

void sub_100009420(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained sendPersonalizedManifestsToDevice];
    id WeakRetained = v2;
  }
}

void sub_100009450(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL))
    {
      uint64_t state64 = 0LL;
      if (!notify_get_state(a2, &state64) && state64)
      {
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 logHandle]);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User is inactive (system idle)", v10, 2u);
        }

        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) + 16LL))();
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
        uint64_t v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = 0LL;

        notify_cancel(a2);
      }
    }

    else
    {
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1000170BC();
      }
    }
  }
}

LABEL_32:
        v64 = v49;
        uint64_t v12 = v64;
        goto LABEL_33;
      }

LABEL_34:
      v34 = (char *)v34 + 1;
    }

    while (v31 != v34);
    id v31 = [v13 countByEnumeratingWithState:&v74 objects:v88 count:16];
  }

  while (v31);

  if ((v67 & 1) == 0) {
    goto LABEL_5;
  }

  uint64_t v24 = 0LL;
  uint64_t v25 = 1LL;
LABEL_6:
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](v14, "logHandle"));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin targetDevice](v14, "targetDevice"));
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v27;
    v80 = 1024;
    v81 = v25;
    v82 = 2112;
    v83 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "prepareFirmware: target device %@ successful %d error %@",  buf,  0x1Cu);
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](v14, "delegate"));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin pluginInfo](v14, "pluginInfo"));
  [v28 didPrepare:v25 info:v29 error:v24];
}

LABEL_24:
  -[SHFUPlugin reconnectDeviceToHost](self, "reconnectDeviceToHost");
  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  [v31 progress:100.0];

  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin targetDevice](self, "targetDevice"));
    *(_DWORD *)buf = 138412802;
    v47 = v33;
    v48 = 1024;
    v49 = v13;
    v50 = 2112;
    v51 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "applyFirmware: target device %@ successful %d error %@",  buf,  0x1Cu);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin pluginInfo](self, "pluginInfo"));
  [v34 didApply:v13 info:v35 error:v12];

  if ((v13 & 1) == 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin remoteHUDAssertion](self, "remoteHUDAssertion"));
    [v36 relinquish];

    -[SHFUPlugin setError:](self, "setError:", v12);
    -[SHFUPlugin setTransaction:](self, "setTransaction:", 0LL);
    -[SHFUPlugin setSerialQueue:](self, "setSerialQueue:", 0LL);
    -[SHFUPlugin releasePowerAssertion](self, "releasePowerAssertion");
  }
}

LABEL_13:
    uint64_t v24 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin personalizationSemaphore](self, "personalizationSemaphore"));
    dispatch_semaphore_signal(v24);
  }
}

void sub_10000B55C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);

  if (!v2)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) verifyLatestFWVersions]);
    [*(id *)(a1 + 32) setError:v3];
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v4 progress:100.0];

  [*(id *)(a1 + 32) releasePowerAssertion];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);

  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) targetDevice]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 1024;
    BOOL v16 = v5 == 0LL;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "finish: target device %@ successful %d error %@",  (uint8_t *)&v13,  0x1Cu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pluginInfo]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  [v9 didFinish:v5 == 0 info:v10 error:v11];

  [*(id *)(a1 + 32) setTransaction:0];
  [*(id *)(a1 + 32) setSerialQueue:0];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) remoteHUDAssertion]);
  [v12 relinquish];
}

uint64_t sub_10000B754(uint64_t a1)
{
  id v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) personalizationSemaphore]);
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000C014(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v6 = @"Error";
    uint64_t v7 = v2;
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  else
  {
    unsigned __int8 v3 = 0LL;
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@.%llu",  @"com.apple.StandaloneHIDFudPlugins.personalization",  [*(id *)(a1 + 40) ecID]));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 postNotificationName:v4 object:*(void *)(a1 + 48) userInfo:v3];
}

void sub_10000C650( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000C660( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000C678( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000C694( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

LABEL_16:
LABEL_17:
      __int128 v20 = 0LL;
      goto LABEL_18;
    }

    v68 = a8;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:NSFileSize]);
    uint64_t v25 = [v24 unsignedLongLongValue];

    if ((unint64_t)v25 <= 0x7F)
    {

      __int128 v20 = (AUFileParser *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ has invalid size of %llu bytes",  v14,  v25));
      if (v68)
      {
        uint64_t v26 = objc_alloc(&OBJC_CLASS___NSError);
        v80 = NSLocalizedDescriptionKey;
        v81 = v20;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v81,  &v80,  1LL));
        uint64_t v28 = v26;
        uint64_t v29 = v18;
        v30 = 5LL;
LABEL_13:
        *v68 = -[NSError initWithDomain:code:userInfo:](v28, "initWithDomain:code:userInfo:", v29, v30, v27);

        goto LABEL_16;
      }

      goto LABEL_16;
    }

    v35 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v14));
    filePath = v20->_filePath;
    v20->_filePath = (NSString *)v35;

    v37 = objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v20->_filePath,  1LL,  v68));
    payload = v20->_payload;
    v20->_payload = (NSData *)v37;

    if (v68 && *v68) {
      goto LABEL_16;
    }
    v67 = v17;

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getPID](v20, "getPID"));
    v41 = [v40 intValue];
    v42 = [v15 intValue];

    if (v41 == v42) {
      goto LABEL_28;
    }
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v43 = v16;
    v44 = [v43 countByEnumeratingWithState:&v69 objects:v79 count:16];
    if (v44)
    {
      v45 = v44;
      v64 = v18;
      v65 = v16;
      v66 = v15;
      v46 = 0;
      v47 = *(void *)v70;
      do
      {
        for (i = 0LL; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v70 != v47) {
            objc_enumerationMutation(v43);
          }
          v49 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getPID](v20, "getPID"));
          v51 = [v50 intValue];
          LOBYTE(v51) = v51 == [v49 intValue];

          v46 |= v51;
        }

        v45 = [v43 countByEnumeratingWithState:&v69 objects:v79 count:16];
      }

      while (v45);

      BOOL v16 = v65;
      __int16 v15 = v66;
      v18 = v64;
      if ((v46 & 1) != 0)
      {
LABEL_28:
        v52 = v16;
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser headerSignature](v20, "headerSignature"));
        v54 = [v53 unsignedIntValue];

        if (v54 == 41671)
        {
          BOOL v16 = v52;
          __int16 v17 = v67;
          goto LABEL_18;
        }

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser headerSignature](v20, "headerSignature"));
        int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ has invalid header signature %u",  v14,  [v55 unsignedIntValue]));

        if (!v68) {
          goto LABEL_36;
        }
        v56 = objc_alloc(&OBJC_CLASS___NSError);
        v75 = NSLocalizedDescriptionKey;
        v76 = v21;
        v57 = v68;
        v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
        v59 = v56;
        v60 = v18;
        v61 = 51LL;
        goto LABEL_35;
      }
    }

    else
    {
    }

    v52 = v16;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getPID](v20, "getPID"));
    int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ has incorrect product ID %@ instead of %@ or equivalent PIDs %@",  v14,  v62,  v15,  v43));

    if (!v68)
    {
LABEL_36:

      BOOL v16 = v52;
      __int16 v17 = v67;
      goto LABEL_17;
    }

    v63 = objc_alloc(&OBJC_CLASS___NSError);
    v77 = NSLocalizedDescriptionKey;
    v78 = v21;
    v57 = v68;
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v78,  &v77,  1LL));
    v59 = v63;
    v60 = v18;
    v61 = 6LL;
LABEL_35:
    *v57 = -[NSError initWithDomain:code:userInfo:](v59, "initWithDomain:code:userInfo:", v60, v61, v58);

    goto LABEL_36;
  }

LABEL_18:
  return v20;
}

LABEL_43:
    unsigned __int8 v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unknown AUType (0x%02X)",  a3));
    return v3;
  }

  if ((int)a3 <= 191)
  {
    switch(a3)
    {
      case 0x70u:
        return @"kAUTypeR1FW";
      case 0xA0u:
        return @"kAUTypeVibeWaveform";
      case 0xB0u:
        return @"kAUTypeBootLoader";
    }

    goto LABEL_43;
  }

  switch(a3)
  {
    case 0xC0u:
      id result = @"kAUTypeKeyCal";
      break;
    case 0xC1u:
      id result = @"kAUTypeMTCal";
      break;
    case 0xC2u:
      id result = @"kAUTypeForceCal";
      break;
    case 0xC3u:
      id result = @"kAUTypeActCal";
      break;
    case 0xC4u:
      id result = @"kAUTypeAccelCal";
      break;
    case 0xC5u:
      id result = @"kAUTypeAudioCal";
      break;
    default:
      if (a3 != 223) {
        goto LABEL_43;
      }
      id result = @"kAUTypeTest";
      break;
  }

  return result;
}

LABEL_26:
  if (-[NSMutableArray count](v73, "count"))
  {
    v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v36, &off_100026A68);
  }

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v74 = v73;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v74,  "countByEnumeratingWithState:objects:count:",  &v92,  v117,  16LL);
  if (v37)
  {
    v38 = *(void *)v93;
    do
    {
      for (i = 0LL; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v93 != v38) {
          objc_enumerationMutation(v74);
        }
        v40 = *(void *)(*((void *)&v92 + 1) + 8LL * (void)i);
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v41 = v19;
        v42 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v88,  v116,  16LL);
        if (v42)
        {
          v43 = *(void *)v89;
          do
          {
            for (j = 0LL; j != v42; j = (char *)j + 1)
            {
              if (*(void *)v89 != v43) {
                objc_enumerationMutation(v41);
              }
              v45 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v41,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v88 + 1) + 8LL * (void)j)));
              [v45 addObject:v40];
            }

            v42 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v88,  v116,  16LL);
          }

          while (v42);
        }
      }

      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v74,  "countByEnumeratingWithState:objects:count:",  &v92,  v117,  16LL);
    }

    while (v37);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v76 = v19;
  v46 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v76,  "countByEnumeratingWithState:objects:count:",  &v84,  v115,  16LL);
  if (v46)
  {
    v68 = *(void *)v85;
    do
    {
      v71 = v46;
      for (k = 0LL; k != v71; k = (char *)k + 1)
      {
        if (*(void *)v85 != v68) {
          objc_enumerationMutation(v76);
        }
        v48 = *(void *)(*((void *)&v84 + 1) + 8LL * (void)k);
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v76, "objectForKeyedSubscript:", v48));
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472LL;
        v82[2] = sub_10000DE0C;
        v82[3] = &unk_1000247D0;
        v83 = v70;
        [v49 sortUsingComparator:v82];
        v77 = v48;
        v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"Devices that report HW Revision ID %@ will receive FW files in the following order:",  v48));
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v51 = v49;
        v52 = [v51 countByEnumeratingWithState:&v78 objects:v114 count:16];
        if (v52)
        {
          v53 = *(void *)v79;
          do
          {
            for (m = 0LL; m != v52; m = (char *)m + 1)
            {
              if (*(void *)v79 != v53) {
                objc_enumerationMutation(v51);
              }
              v56 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( AUFileParser,  "auTypeString:",  [v55 unsignedIntValue]));
              [v50 appendFormat:@" %@", v56];
            }

            v52 = [v51 countByEnumeratingWithState:&v78 objects:v114 count:16];
          }

          while (v52);
        }

        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v119 = v50;
          _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        [v69 setObject:v51 forKeyedSubscript:v77];
      }

      v46 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v76,  "countByEnumeratingWithState:objects:count:",  &v84,  v115,  16LL);
    }

    while (v46);
  }

  v57 = v107[5];
  if (!v57)
  {
    if (![v69 count])
    {
      v60 = objc_alloc(&OBJC_CLASS___NSError);
      v112 = NSLocalizedDescriptionKey;
      v113 = @"No assets found";
      v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v113,  &v112,  1LL));
      v58 = -[NSError initWithDomain:code:userInfo:](v60, "initWithDomain:code:userInfo:", v66, 3LL, v61);

      goto LABEL_62;
    }

    v57 = v107[5];
  }

  v58 = (NSError *)v57;
LABEL_62:

  _Block_object_dispose(&v106, 8);
  return v58;
}

void sub_10000DD4C(_Unwind_Exception *a1)
{
}

uint64_t sub_10000DDCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000DDDC(uint64_t a1)
{
}

uint64_t sub_10000DDE4(uint64_t a1, int a2, id obj)
{
  return 0LL;
}

uint64_t sub_10000DE0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 getFirmwareType]);
  if ([v7 isEqualToNumber:&off_100026A80])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 getFirmwareType]);
    unsigned __int8 v9 = [v8 isEqualToNumber:&off_100026A80];

    if ((v9 & 1) == 0)
    {
      BOOL v10 = [*(id *)(a1 + 32) BOOLValue] == 0;
      uint64_t v11 = -1LL;
      goto LABEL_9;
    }
  }

  else
  {
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 getFirmwareType]);
  if ([v12 isEqualToNumber:&off_100026A80])
  {

LABEL_12:
    uint64_t v15 = 0LL;
    goto LABEL_13;
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 getFirmwareType]);
  unsigned int v14 = [v13 isEqualToNumber:&off_100026A80];

  if (!v14) {
    goto LABEL_12;
  }
  BOOL v10 = [*(id *)(a1 + 32) BOOLValue] == 0;
  uint64_t v11 = 1LL;
LABEL_9:
  if (v10) {
    uint64_t v15 = -v11;
  }
  else {
    uint64_t v15 = v11;
  }
LABEL_13:

  return v15;
}

uint64_t sub_10000F240(unsigned int a1, void *a2, _DWORD *a3, __IOHIDDevice *a4, void *a5)
{
  uint64_t v9 = 3758097090LL;
  id v10 = a5;
  CFIndex pReportLength = 513LL;
  if (a2 && a3)
  {
    if (*a3 <= 0x200u)
    {
      uint64_t v9 = IOHIDDeviceGetReport(a4, kIOHIDReportTypeFeature, a1, &report, &pReportLength);
      if (!(_DWORD)v9)
      {
        int v13 = pReportLength;
        if (pReportLength >= 1)
        {
          memcpy(a2, &v16, pReportLength - 1);
          uint64_t v9 = 0LL;
          *a3 = v13 - 1;
          goto LABEL_9;
        }

        uint64_t v9 = 3758097127LL;
      }
    }

    else
    {
      uint64_t v9 = 3758097128LL;
    }
  }

  uint64_t v11 = (os_log_s *)v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10001756C(a1, v9, v11);
  }

LABEL_9:
  return v9;
}

NSString *SHFUIOReturnString(uint64_t a1)
{
  if ((int)a1 > -536850433)
  {
    if ((_DWORD)a1 == -536850432)
    {
      unsigned __int8 v3 = @"kUSBHostReturnPipeStalled (Pipe has issued a STALL handshake.  Use clearStall to clear this condition.)";
    }

    else if ((_DWORD)a1 == -536850431)
    {
      unsigned __int8 v3 = @"kUSBHostReturnNoPower (A setConfiguration call was not able to succeed because all configurations require more power than is available.)";
    }

    else
    {
LABEL_9:
      unsigned __int8 v3 = @"Unknown Error";
    }
  }

  else
  {
    unsigned __int8 v3 = @"kIOReturnError (general error)";
    switch(a1)
    {
      case 0xE00002BC:
        return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%08X %@",  a1,  v3,  v1,  v2);
      case 0xE00002BD:
        unsigned __int8 v3 = @"kIOReturnNoMemory (can't allocate memory)";
        break;
      case 0xE00002BE:
        unsigned __int8 v3 = @"kIOReturnNoResources (resource shortage)";
        break;
      case 0xE00002BF:
        unsigned __int8 v3 = @"kIOReturnIPCError (error during IPC)";
        break;
      case 0xE00002C0:
        unsigned __int8 v3 = @"kIOReturnNoDevice (no such device)";
        break;
      case 0xE00002C1:
        unsigned __int8 v3 = @"kIOReturnNotPrivileged (privilege violation)";
        break;
      case 0xE00002C2:
        unsigned __int8 v3 = @"kIOReturnBadArgument (invalid argument)";
        break;
      case 0xE00002C3:
        unsigned __int8 v3 = @"kIOReturnLockedRead (device read locked)";
        break;
      case 0xE00002C4:
        unsigned __int8 v3 = @"kIOReturnLockedWrite (device write locked)";
        break;
      case 0xE00002C5:
        unsigned __int8 v3 = @"kIOReturnExclusiveAccess (exclusive access and device already open)";
        break;
      case 0xE00002C6:
        unsigned __int8 v3 = @"kIOReturnBadMessageID (sent/received messages had different msg_id)";
        break;
      case 0xE00002C7:
        unsigned __int8 v3 = @"kIOReturnUnsupported (unsupported function)";
        break;
      case 0xE00002C8:
        unsigned __int8 v3 = @"kIOReturnVMError (misc. VM failure)";
        break;
      case 0xE00002C9:
        unsigned __int8 v3 = @"kIOReturnInternalError (internal error)";
        break;
      case 0xE00002CA:
        unsigned __int8 v3 = @"kIOReturnIOError (General I/O error)";
        break;
      case 0xE00002CB:
      case 0xE00002DC:
        goto LABEL_9;
      case 0xE00002CC:
        unsigned __int8 v3 = @"kIOReturnCannotLock (can't acquire lock)";
        break;
      case 0xE00002CD:
        unsigned __int8 v3 = @"kIOReturnNotOpen (device not open)";
        break;
      case 0xE00002CE:
        unsigned __int8 v3 = @"kIOReturnNotReadable (read not supported)";
        break;
      case 0xE00002CF:
        unsigned __int8 v3 = @"kIOReturnNotWritable (write not supported)";
        break;
      case 0xE00002D0:
        unsigned __int8 v3 = @"kIOReturnNotAligned (alignment error)";
        break;
      case 0xE00002D1:
        unsigned __int8 v3 = @"kIOReturnBadMedia (Media Error)";
        break;
      case 0xE00002D2:
        unsigned __int8 v3 = @"kIOReturnStillOpen (device(s) still open)";
        break;
      case 0xE00002D3:
        unsigned __int8 v3 = @"kIOReturnRLDError (rld failure)";
        break;
      case 0xE00002D4:
        unsigned __int8 v3 = @"kIOReturnDMAError (DMA failure)";
        break;
      case 0xE00002D5:
        unsigned __int8 v3 = @"kIOReturnBusy (Device Busy)";
        break;
      case 0xE00002D6:
        unsigned __int8 v3 = @"kIOReturnTimeout (I/O Timeout)";
        break;
      case 0xE00002D7:
        unsigned __int8 v3 = @"kIOReturnOffline (device offline)";
        break;
      case 0xE00002D8:
        unsigned __int8 v3 = @"kIOReturnNotReady (not ready)";
        break;
      case 0xE00002D9:
        unsigned __int8 v3 = @"kIOReturnNotAttached (device not attached)";
        break;
      case 0xE00002DA:
        unsigned __int8 v3 = @"kIOReturnNoChannels (no DMA channels left)";
        break;
      case 0xE00002DB:
        unsigned __int8 v3 = @"kIOReturnNoSpace (no space for data)";
        break;
      case 0xE00002DD:
        unsigned __int8 v3 = @"kIOReturnPortExists (port already exists)";
        break;
      case 0xE00002DE:
        unsigned __int8 v3 = @"kIOReturnCannotWire (can't wire down physical memory)";
        break;
      case 0xE00002DF:
        unsigned __int8 v3 = @"kIOReturnNoInterrupt (no interrupt attached)";
        break;
      case 0xE00002E0:
        unsigned __int8 v3 = @"kIOReturnNoFrames (no DMA frames enqueued)";
        break;
      case 0xE00002E1:
        unsigned __int8 v3 = @"kIOReturnMessageTooLarge (oversized msg received on interrupt port)";
        break;
      case 0xE00002E2:
        unsigned __int8 v3 = @"kIOReturnNotPermitted (not permitted)";
        break;
      case 0xE00002E3:
        unsigned __int8 v3 = @"kIOReturnNoPower (no power to device)";
        break;
      case 0xE00002E4:
        unsigned __int8 v3 = @"kIOReturnNoMedia (media not present)";
        break;
      case 0xE00002E5:
        unsigned __int8 v3 = @"kIOReturnUnformattedMedia (media not formatted)";
        break;
      case 0xE00002E6:
        unsigned __int8 v3 = @"kIOReturnUnsupportedMode (no such mode)";
        break;
      case 0xE00002E7:
        unsigned __int8 v3 = @"kIOReturnUnderrun (data underrun)";
        break;
      case 0xE00002E8:
        unsigned __int8 v3 = @"kIOReturnOverrun (data overrun)";
        break;
      case 0xE00002E9:
        unsigned __int8 v3 = @"kIOReturnDeviceError (the device is not working properly!)";
        break;
      case 0xE00002EA:
        unsigned __int8 v3 = @"kIOReturnNoCompletion (a completion routine is required)";
        break;
      case 0xE00002EB:
        unsigned __int8 v3 = @"kIOReturnAborted (operation aborted)";
        break;
      case 0xE00002EC:
        unsigned __int8 v3 = @"kIOReturnNoBandwidth (bus bandwidth would be exceeded)";
        break;
      case 0xE00002ED:
        unsigned __int8 v3 = @"kIOReturnNotResponding (device not responding)";
        break;
      case 0xE00002EE:
        unsigned __int8 v3 = @"kIOReturnIsoTooOld (isochronous I/O request for distant past!)";
        break;
      case 0xE00002EF:
        unsigned __int8 v3 = @"kIOReturnIsoTooNew (isochronous I/O request for distant future)";
        break;
      case 0xE00002F0:
        unsigned __int8 v3 = @"kIOReturnNotFound (data was not found)";
        break;
      default:
        if ((_DWORD)a1 != -536870911) {
          goto LABEL_9;
        }
        unsigned __int8 v3 = @"kIOReturnInvalid (should never be seen)";
        break;
    }
  }

  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"0x%08X %@", a1, v3, v1, v2);
}

id sub_100010550(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100010DFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[FudPersonalizationObjectInfo alloc] initWithTag:v6];

  [v7 setDigest:v5];
  [v7 setTrusted:1];
  objc_msgSend(v7, "setEffectiveProductionMode:", objc_msgSend(*(id *)(a1 + 32), "productionMode"));
  objc_msgSend(v7, "setEffectiveSecurityMode:", objc_msgSend(*(id *)(a1 + 32), "securityMode"));
  [*(id *)(a1 + 40) addObject:v7];
}

LABEL_25:
  return v39;
}

void sub_1000116A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_10001170C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001171C(uint64_t a1)
{
}

void sub_100011724(uint64_t a1, uint64_t a2)
{
}

void sub_100011730(uint64_t a1)
{
}

void sub_100011738(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
  id v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_19;
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100017BA4();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 personalizationObserver]);
  [v7 removeObserver:v8];

  [v5 setPersonalizationObserver:0];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 object]);
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) createAFUManifest:v9]);
    if (*(_BYTE *)(a1 + 72))
    {
      uint64_t v11 = NSHomeDirectory();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"manifest %@.afu",  v13));

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v14]);
      unsigned int v16 = [v10 writeToFile:v15 atomically:1];
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 logHandle]);
      v18 = v17;
      if (v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Personalized manifest written to %@",  buf,  0xCu);
        }
      }

      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        sub_100017B44();
      }
    }

    uint64_t v21 = objc_claimAutoreleasedReturnValue( [v5 sendSingleFirmwareToDevice:v10 totalPrepareBytes:0 bytesSent:0 featureReportDelay:*(void *)(a1 + 40)]);
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"Error"]);

    if (!v20)
    {
      uint64_t v25 = objc_alloc(&OBJC_CLASS___NSError);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 errorDomain]);
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      v30 = @"No personalized manifest";
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
      uint64_t v26 = -[NSError initWithDomain:code:userInfo:](v25, "initWithDomain:code:userInfo:", v10, 52LL, v23);
      uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8LL);
      uint64_t v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;

      goto LABEL_16;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"Error"]);
  }

  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8LL);
  __int128 v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;
LABEL_16:

  uint64_t v24 = *(dispatch_semaphore_s **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v24) {
    dispatch_semaphore_signal(v24);
  }

LABEL_19:
}

LABEL_30:
      v19 = v55;
      i = v65;
      if (v38)
      {
LABEL_37:

        __int128 v23 = v52;
        uint64_t v22 = v53;
        uint64_t v24 = v51;
        goto LABEL_39;
      }

LABEL_33:
    }

    v38 = 0LL;
    __int128 v23 = v52;
    uint64_t v22 = v53;
    uint64_t v24 = v51;
    v59 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
  }

  while (v59);
LABEL_39:

  +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 5.0);
  if (notification)
  {
    IOObjectRelease(notification);
    notification = 0;
  }

  IONotificationPortSetDispatchQueue(v23, 0LL);
  if (v23) {
    IONotificationPortDestroy(v23);
  }

  dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  return v38;
}

uint64_t sub_10001243C(dispatch_semaphore_s *a1, io_iterator_t iterator)
{
  while (IOIteratorNext(iterator))
    ;
  +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 1.0);
  return dispatch_semaphore_signal(a1);
}

void sub_1000148EC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(a1 + 32) + 56LL)) {
    return;
  }
  id v3 = (const void *)IOPSCopyPowerSourcesByType(4LL, a2);
  if (!v3) {
    goto LABEL_19;
  }
  int v4 = v3;
  id v5 = IOPSCopyPowerSourcesList(v3);
  if (!v5) {
    goto LABEL_18;
  }
  id v6 = v5;
  CFIndex Count = CFArrayGetCount(v5);
  if (Count < 1) {
    goto LABEL_17;
  }
  CFIndex v8 = Count;
  CFIndex v9 = 0LL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v6, v9);
    if (!ValueAtIndex) {
      goto LABEL_14;
    }
    CFDictionaryRef v11 = IOPSGetPowerSourceDescription(v4, ValueAtIndex);
    if (!v11) {
      goto LABEL_14;
    }
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v11));
    if (!*(_BYTE *)(a1 + 40)) {
      goto LABEL_23;
    }
    int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serialNumber]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Accessory Identifier"]);
    unsigned __int8 v15 = [v13 isEqualToString:v14];

    if ((v15 & 1) != 0) {
      break;
    }
    if (!*(_BYTE *)(a1 + 40))
    {
LABEL_23:
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) productName]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Name"]);
      unsigned __int8 v18 = [v16 isEqualToString:v17];

      if ((v18 & 1) != 0) {
        break;
      }
    }

LABEL_14:
    if (v8 == ++v9) {
      goto LABEL_17;
    }
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56LL), v12);

LABEL_17:
  CFRelease(v6);
LABEL_18:
  CFRelease(v4);
LABEL_19:
  v19 = *(void **)(a1 + 32);
  if (v19[7])
  {
    __int128 v20 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([v19 powerSemaphore]);
    dispatch_semaphore_signal(v20);
  }

uint64_t sub_100014AB4(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100017E84();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100014D38(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100014D4C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100014D60( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_28:
LABEL_7:
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin targetDevice](self, "targetDevice"));
    *(_DWORD *)buf = 138413314;
    v42 = v20;
    v43 = 1024;
    v44 = v9 == 0LL;
    v45 = 1024;
    v46 = v18;
    v47 = 1024;
    v48 = 0;
    v49 = 2112;
    v50 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "findFirmware: target device %@ successful %d updateAvailable %d needsDownload %d error %@",  buf,  0x28u);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin pluginInfo](self, "pluginInfo"));
  if (v9) {
    __int128 v23 = 0;
  }
  else {
    __int128 v23 = v18;
  }
  [v21 didFind:v9 == 0 info:v22 updateAvailable:v18 needsDownload:0 error:v9];

  if ((v23 & 1) == 0)
  {
    -[SHFUPlugin setError:](self, "setError:", v9);
    -[SHFUPlugin setTransaction:](self, "setTransaction:", 0LL);
    -[SHFUPlugin setSerialQueue:](self, "setSerialQueue:", 0LL);
  }
}

void sub_100015560( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_1000155C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000155D0(uint64_t a1)
{
}

void sub_1000155D8(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      int v8 = 136315138;
      uint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received notification %s",  (uint8_t *)&v8,  0xCu);
    }

    notify_cancel(a2);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

uint64_t sub_1000156C0(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mobileAssetType]);
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = (uint64_t)v14;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "MobileAsset catalog download succeeded for %@",  buf,  0xCu);
    }

    goto LABEL_11;
  }

  if (a2 != 13)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mobileAssetType]);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Catalog download failed for %@ with MADownloadResult %ld",  v15,  a2));

    unsigned int v16 = objc_alloc(&OBJC_CLASS___NSError);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) errorDomain]);
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    uint64_t v24 = v7;
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    v19 = -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", v17, 50LL, v18);
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    goto LABEL_11;
  }

  if (!*(_DWORD *)(a1 + 72))
  {
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = 3600LL;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "MobileAsset daemon not ready. Wait up to %lld seconds.",  buf,  0xCu);
    }

    dispatch_time_t v5 = dispatch_time(0LL, 3600000000000LL);
    if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), v5))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mobileAssetType]);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Catalog download timed out for %@ with MADownloadResult %ld",  v6,  13LL));

      int v8 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) errorDomain]);
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      uint64_t v26 = v7;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      CFDictionaryRef v11 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v9, 50LL, v10);
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8LL);
      int v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
LABEL_11:
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

LABEL_27:
  int v13 = v46;
  id v6 = v48;
LABEL_28:
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin targetDevice](self, "targetDevice"));
    *(_DWORD *)buf = 138413314;
    v56 = v42;
    v57 = 1024;
    v58 = v12 == 0LL;
    v59 = 1024;
    v60 = v27;
    v61 = 1024;
    v62 = v26;
    v63 = 2112;
    v64 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "findFirmware: target device %@ successful %d updateAvailable %d needsDownload %d error %@",  buf,  0x28u);
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin pluginInfo](self, "pluginInfo"));
  if (v12) {
    v45 = 0;
  }
  else {
    v45 = v27;
  }
  [v43 didFind:v12 == 0 info:v44 updateAvailable:v27 needsDownload:v26 error:v12];

  if (!v45)
  {
    -[SHFUPlugin setError:](self, "setError:", v12);
    -[SHFUPlugin setTransaction:](self, "setTransaction:", 0LL);
    -[SHFUPlugin setSerialQueue:](self, "setSerialQueue:", 0LL);
  }
}

void sub_100016708( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016744(uint64_t a1, uint64_t a2)
{
  if (a2 != 10 && a2)
  {
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MobileAsset download failed with MADownloadResult %ld",  a2));
    dispatch_time_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) errorDomain]);
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    int v13 = v4;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    int v8 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v6, 49LL, v7);
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) getLocalUrl]);
    [*(id *)(a1 + 32) setFirmwareDirectory:v3];

    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100018250((id *)(a1 + 32));
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_1000168F4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int main(int argc, const char **argv, const char **envp)
{
  os_log_t v3 = os_log_create("com.apple.StandaloneHIDFudPlugins", "main");
  signal(15, (void (__cdecl *)(int))1);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  dispatch_time_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v5);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100016A00;
  handler[3] = &unk_100024730;
  os_log_t v10 = v3;
  uint64_t v7 = v3;
  dispatch_source_set_event_handler(v6, handler);
  dispatch_activate(v6);
  +[AUServiceManager startService](&OBJC_CLASS___AUServiceManager, "startService");

  return 0;
}

void sub_100016A00(uint64_t a1)
{
  uint64_t v1 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "FW update aborted due to SIGTERM", v2, 2u);
  }

  exit(1);
}

void sub_100016A54()
{
}

void sub_100016A80()
{
}

void sub_100016AAC()
{
}

void sub_100016B0C()
{
}

void sub_100016B6C()
{
}

void sub_100016B98()
{
}

void sub_100016BC4()
{
}

void sub_100016C24()
{
}

void sub_100016C50()
{
}

void sub_100016CB0()
{
}

void sub_100016D10(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 bootstrapDelay]);
  [v1 intValue];
  sub_10000C6B8();
  sub_10000C6C4();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 8u);

  sub_10000C6A4();
}

void sub_100016D98()
{
}

void sub_100016DF8()
{
}

void sub_100016E24(void *a1)
{
}

void sub_100016EA0()
{
}

void sub_100016ECC()
{
}

void sub_100016EF8()
{
}

void sub_100016F58()
{
}

void sub_100016F84()
{
}

void sub_100016FE4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001704C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000170BC()
{
}

void sub_1000170E8()
{
}

void sub_100017148()
{
}

void sub_1000171A8(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 firmwareDirectory]);
  sub_10000C6AC();
  sub_10000C6C4();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);
}

void sub_100017248()
{
}

void sub_100017274()
{
}

void sub_1000172A0(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "FTAB too short. Length (%lu bytes) < AFU header + ftab min length",  (uint8_t *)&v2,  0xCu);
}

void sub_100017314(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "FTAB not long enough for file count : %u",  (uint8_t *)v2,  8u);
}

void sub_100017388(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "FTAB not long enough to fit offset + length",  v1,  2u);
}

void sub_1000173C8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "loading firmware files from directory %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10001743C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "options %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000174B0(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unknown FW Source %d",  (uint8_t *)v1,  8u);
}

void sub_10001752C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, ".", v1, 2u);
}

void sub_10001756C(unsigned __int8 a1, uint64_t a2, os_log_s *a3)
{
  int v4 = a2;
  int v5 = a1;
  uint8_t v6 = SHFUIOReturnString(a2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8[0] = 67109634;
  v8[1] = v5;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 2112;
  NSErrorUserInfoKey v12 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "reportID 0x%02X error 0x%08X %@",  (uint8_t *)v8,  0x18u);
}

void sub_10001762C()
{
}

void sub_100017658()
{
}

void sub_1000176B8()
{
}

void sub_100017718()
{
}

void sub_100017778()
{
}

void sub_1000177D8()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "%@ already has FW version 0x%X installed. Will not attempt to reinstall same FW version.",  v2,  0x12u);
  sub_10000C6A4();
}

void sub_100017854()
{
}

void sub_100017880( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000178F0(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 189;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Personalization info feature report ID 0x%02X failed.",  buf,  8u);
}

void sub_100017938( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000179A8(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Reset R1 FW due to invalid R1 FW version 0x%02X",  (uint8_t *)v1,  8u);
  sub_10000C670();
}

void sub_100017A20( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017A8C(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *a2 = 120LL;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Personalization request sent. Wait up to %lld seconds for response.",  buf,  0xCu);
}

void sub_100017AD4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017B44()
{
}

void sub_100017BA4()
{
}

void sub_100017BD0(void *a1)
{
}

void sub_100017C44(void *a1)
{
}

void sub_100017CB8()
{
}

void sub_100017CE4()
{
}

void sub_100017D10( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017D80(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AUFileParser auTypeString:](&OBJC_CLASS___AUFileParser, "auTypeString:", 1LL));
  sub_10000C6AC();
  __int16 v6 = 1024;
  int v7 = 1;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 1024;
  int v11 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ (%d) version 0x%x (%d)", v5, 0x1Eu);
}

void sub_100017E4C()
{
}

void sub_100017E84()
{
}

void sub_100017EB0(uint64_t a1, char a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "options %@ remote %d", (uint8_t *)&v3, 0x12u);
}

void sub_100017F38(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412546;
  uint64_t v3 = ASAttributeContentVersion;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Max %@: %@", (uint8_t *)&v2, 0x16u);
}

void sub_100017FC4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 results]);
  sub_10000C6AC();
  sub_1000168F4((void *)&_mh_execute_header, v2, v3, "MAAssetQuery.results %@", v4, v5, v6, v7, v8);

  sub_100016908();
}

void sub_10001803C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 mobileAssetType]);
  sub_10000C6AC();
  sub_1000168F4((void *)&_mh_execute_header, v2, v3, "MobileAsset query succeeded for %@", v4, v5, v6, v7, v8);

  sub_100016908();
}

void sub_1000180B4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 searchLocal]);
  sub_10000C6AC();
  sub_1000168F4((void *)&_mh_execute_header, v2, v3, "searchLocal %@", v4, v5, v6, v7, v8);

  sub_100016908();
}

void sub_10001812C(uint64_t a1, char a2, os_log_s *a3)
{
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = a2 & 1;
  __int16 v8 = 1024;
  unsigned int v9 = +[ASAsset nonUserInitiatedDownloadsAllowed]( &OBJC_CLASS___ASAsset,  "nonUserInitiatedDownloadsAllowed");
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "options %@ remote %d nonUserInitiatedDownloadsAllowed %d",  (uint8_t *)&v4,  0x18u);
}

void sub_1000181E0()
{
}

void sub_100018250(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 firmwareDirectory]);
  sub_10000C6AC();
  sub_1000168F4((void *)&_mh_execute_header, v2, v3, "asset URL %@", v4, v5, v6, v7, v8);

  sub_100016908();
}

id objc_msgSend_getDevices_hasPowerSource_logHandle_withVendorID_productID_locationID_interfaceNumber_errorDomain_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "getDevices:hasPowerSource:logHandle:withVendorID:productID:locationID:interfaceNumber:errorDomain:error:");
}

id objc_msgSend_getDevicesWithMatchingDict_hasPowerSource_errorDomain_error_delegate_logHandle_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDevicesWithMatchingDict:hasPowerSource:errorDomain:error:delegate:logHandle:");
}

id objc_msgSend_initWithDeviceRef_service_hasPowerSource_delegate_logHandle_errorDomain_error_buffer_bufferLength_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDeviceRef:service:hasPowerSource:delegate:logHandle:errorDomain:error:buffer:bufferLength:");
}

id objc_msgSend_loadParsersFromFWDirectory_logHandle_productID_equivalentPIDs_errorDomain_STFWFirst_parsers_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "loadParsersFromFWDirectory:logHandle:productID:equivalentPIDs:errorDomain:STFWFirst:parsers:");
}

id objc_msgSend_sendAllFirmwaresToDeviceWithVendorID_productID_hasPowerSource_parsers_totalPrepareBytes_bytesSent_featureReportDelay_logHandle_pluginDelegate_errorDomain_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendAllFirmwaresToDeviceWithVendorID:productID:hasPowerSource:parsers:totalPrepareBytes:bytesSent:featureRepo rtDelay:logHandle:pluginDelegate:errorDomain:");
}

id objc_msgSend_sendAllFirmwaresToDeviceWithVendorID_productID_interfaceNum_hasPowerSource_parsers_totalPrepareBytes_bytesSent_featureReportDelay_waitForRenumeration_logHandle_pluginDelegate_errorDomain_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendAllFirmwaresToDeviceWithVendorID:productID:interfaceNum:hasPowerSource:parsers:totalPrepareBytes:bytesSen t:featureReportDelay:waitForRenumeration:logHandle:pluginDelegate:errorDomain:");
}

id objc_msgSend_sendSingleFirmwareToDevice_totalPrepareBytes_bytesSent_featureReportDelay_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSingleFirmwareToDevice:totalPrepareBytes:bytesSent:featureReportDelay:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}