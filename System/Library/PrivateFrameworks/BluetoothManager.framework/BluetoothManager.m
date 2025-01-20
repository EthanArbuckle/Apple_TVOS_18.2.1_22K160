uint64_t sharedBluetoothManagerLogComponent()
{
  if (sharedBluetoothManagerLogComponent_onceToken != -1) {
    dispatch_once(&sharedBluetoothManagerLogComponent_onceToken, &__block_literal_global);
  }
  return sharedBluetoothManagerLogComponent_sharedBTMLog;
}

os_log_t __sharedBluetoothManagerLogComponent_block_invoke()
{
  os_log_t result = os_log_create("com.apple.bluetooth", "BluetoothManager");
  sharedBluetoothManagerLogComponent_sharedBTMLog = (uint64_t)result;
  return result;
}
}

LABEL_8:
    -[BluetoothManager _accessoryManager]( +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance", v8),  "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    return BTAccessoryManagerSetupCommand();
  }

  if (a3 == 1)
  {
    v4 = (os_log_s *)sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v5 = "SendSetupCommand Start";
      v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl(&dword_1874BF000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  return 0;
}

  v10 = (os_log_s *)sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[BluetoothManager _postNotificationWithArray:].cold.1();
  }
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_5(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t AddressForBTDevice()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  uint64_t v3 = 0LL;
  memset(v2, 0, sizeof(v2));
  v0 = (os_log_s *)sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    AddressForBTDevice_cold_1();
  }
  return 0LL;
}

void _btServiceEventCallback(uint64_t a1, int a2, int a3, int a4, uint64_t a5)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  v10 = (void *)MEMORY[0x1895A68C8]();
  v11 = +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance");
  id v12 = -[BluetoothManager addDeviceIfNeeded:](v11, "addDeviceIfNeeded:", a1);
  v13 = v12;
  if (a2 != -1 && (a2 & 0x40) != 0) {
    goto LABEL_66;
  }
  if (a3 == 2)
  {
    switch(a2)
    {
      case -1:
        if (a4 != 701 || (_DWORD)a5) {
          goto LABEL_66;
        }
        [v12 _clearName];
        v24 = @"BluetoothDeviceUpdatedNotification";
        goto LABEL_65;
      case 16:
        if (a4 == 201 && !(_DWORD)a5)
        {
          v26 = (os_log_s *)sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            _btServiceEventCallback_cold_10();
          }
        }

        goto LABEL_66;
      case 2:
        if (a4 != 303 || (_DWORD)a5) {
          goto LABEL_66;
        }
        v27 = (os_log_s *)sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          _btServiceEventCallback_cold_9();
        }
        break;
      case 1:
        v16 = (os_log_s *)sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          _btServiceEventCallback_cold_8();
        }
        if (a4 == 101 && !(_DWORD)a5)
        {
          v17 = (os_log_s *)sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            _btServiceEventCallback_cold_1();
          }
          v18 = v11;
          uint64_t v19 = 1LL;
LABEL_54:
          -[BluetoothManager setAudioConnected:](v18, "setAudioConnected:", v19);
          goto LABEL_66;
        }

        if (a4 == 102 && !(_DWORD)a5)
        {
          v28 = (os_log_s *)sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            _btServiceEventCallback_cold_2();
          }
          v18 = v11;
          uint64_t v19 = 0LL;
          goto LABEL_54;
        }

        if (a4 == 103 && !(_DWORD)a5)
        {
          v30 = (os_log_s *)sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            _btServiceEventCallback_cold_3();
          }
          v24 = @"BluetoothHandsfreeInitiatedVoiceCommand";
          goto LABEL_65;
        }

        if (a4 == 104 && !(_DWORD)a5)
        {
          v31 = (os_log_s *)sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            _btServiceEventCallback_cold_4();
          }
          v24 = @"BluetoothHandsfreeEndedVoiceCommand";
          goto LABEL_65;
        }

        if (a4 != 303 || (_DWORD)a5)
        {
          if (a4 != 702 || (_DWORD)a5)
          {
            if (a4 != 703 || (_DWORD)a5) {
              goto LABEL_66;
            }
            v34 = (os_log_s *)sharedBluetoothManagerLogComponent();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
              _btServiceEventCallback_cold_7();
            }
            v24 = @"BluetoothHighPowerDisabled";
          }

          else
          {
            v33 = (os_log_s *)sharedBluetoothManagerLogComponent();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              _btServiceEventCallback_cold_6();
            }
            v24 = @"BluetoothHighPowerEnabled";
          }

          goto LABEL_65;
        }

        v32 = (os_log_s *)sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          _btServiceEventCallback_cold_5();
        }
        break;
      default:
        goto LABEL_66;
    }

    v24 = @"BluetoothDeviceSupportsContactSyncNotification";
    goto LABEL_65;
  }

  if (a3 == 1)
  {
    uint64_t v20 = [v12 connectedServicesCount];
    if (a4 == 12)
    {
      uint64_t v21 = v20;
      v22 = (os_log_s *)sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        if ((_DWORD)a5) {
          v23 = (const __CFString *)objc_msgSend( NSString,  "stringWithFormat:",  @"failed with error %d",  a5);
        }
        else {
          v23 = @"succeeded";
        }
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = a2;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v13;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v23;
        _os_log_impl( &dword_1874BF000,  v22,  OS_LOG_TYPE_INFO,  "disconnection to service 0x%08x on device %@ %@",  buf,  0x1Cu);
      }

      if (!v21)
      {
        if ((_DWORD)a5)
        {
          -[BluetoothManager postNotificationName:object:error:]( v11,  "postNotificationName:object:error:",  @"BluetoothDeviceDisconnectFailedNotification",  v13,  [MEMORY[0x189607968] numberWithInt:a5]);
          goto LABEL_66;
        }

        v24 = @"BluetoothDeviceDisconnectSuccessNotification";
        goto LABEL_65;
      }
    }
  }

  else
  {
    if (a3) {
      goto LABEL_66;
    }
    if (([v12 _isNameCached] & 1) == 0)
    {
      uint64_t v49 = 0LL;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v36 = 0u;
      memset(buf, 0, sizeof(buf));
      if (!BTDeviceGetName()) {
        -[BluetoothManager postNotificationName:object:]( v11,  "postNotificationName:object:",  @"BluetoothDeviceUpdatedNotification",  v13);
      }
    }

    if (a4 != 1)
    {
      if (a4 != 11) {
        goto LABEL_66;
      }
      v14 = (os_log_s *)sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if ((_DWORD)a5) {
          v15 = (const __CFString *)objc_msgSend( NSString,  "stringWithFormat:",  @"failed with error %d",  a5);
        }
        else {
          v15 = @"succeeded";
        }
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = a2;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v13;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v15;
        _os_log_impl( &dword_1874BF000,  v14,  OS_LOG_TYPE_INFO,  "connection to service 0x%08x on device %@ %@",  buf,  0x1Cu);
      }

      if (a2 == 512) {
        -[BluetoothManager postNotificationName:object:]( v11,  "postNotificationName:object:",  @"BluetoothDeviceSupportsMAPClientNotification",  v13);
      }
      uint64_t v29 = [v13 getConnectingServiceMask] & ~a2;
      [v13 setConnectingServicemask:v29];
      if ((_DWORD)a5)
      {
        if (!(_DWORD)v29 && ![v13 connectedServicesCount])
        {
          -[BluetoothManager postNotificationName:object:error:]( v11,  "postNotificationName:object:error:",  @"BluetoothDeviceConnectFailedNotification",  v13,  [MEMORY[0x189607968] numberWithInt:a5]);
          -[BluetoothManager _updateBluetoothState](v11, "_updateBluetoothState");
        }

        goto LABEL_66;
      }

      v24 = @"BluetoothDeviceConnectSuccessNotification";
LABEL_65:
      -[BluetoothManager postNotificationName:object:](v11, "postNotificationName:object:", v24, v13);
      goto LABEL_66;
    }

    v25 = (os_log_s *)sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = a2;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v13;
      _os_log_impl( &dword_1874BF000,  v25,  OS_LOG_TYPE_INFO,  "attempting to connect to service 0x%08x on device %@",  buf,  0x12u);
    }

    objc_msgSend(v13, "setConnectingServicemask:", objc_msgSend(v13, "getConnectingServiceMask") | a2);
  }

LABEL_66:
  objc_autoreleasePoolPop(v10);
}

void _btSessionEventCallback(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v8 = (void *)MEMORY[0x1895A68C8]();
  if (!(a3 | a2))
  {
    v9 = (os_log_s *)sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1874BF000, v9, OS_LOG_TYPE_DEFAULT, "Got a session, lets continue with setup", buf, 2u);
    }

    uint64_t v10 = [a4 _setup:a1];
    if ((v10 & 1) != 0)
    {
      v11 = (os_log_s *)sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = 0;
        id v12 = "Sending attached posting BluetoothAvailabilityChangedNotification with availability set to YES";
        v13 = (uint8_t *)&v17;
LABEL_21:
        _os_log_impl(&dword_1874BF000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }

    else
    {
      [a4 _cleanup:1];
      v11 = (os_log_s *)sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        id v12 = "Session attached posting BluetoothAvailabilityChangedNotification with availability set to NO";
        v13 = v18;
        goto LABEL_21;
      }
    }

    objc_msgSend( a4,  "postNotificationName:object:",  @"BluetoothAvailabilityChangedNotification",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", v10));
    [a4 _updateBluetoothState];
    goto LABEL_23;
  }

  v14 = (os_log_s *)sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    _btSessionEventCallback_cold_1();
  }
  if ([a4 available])
  {
    if (!(_DWORD)a2) {
      [a4 _updateBluetoothState];
    }
    v15 = (os_log_s *)sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl( &dword_1874BF000,  v15,  OS_LOG_TYPE_DEFAULT,  "Sending BluetoothAvailabilityChangedNotification with availability set to NO",  v16,  2u);
    }

    objc_msgSend( a4,  "postNotificationName:object:",  @"BluetoothAvailabilityChangedNotification",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 0));
  }

  [a4 _cleanup:0];
  [a4 _attach];
LABEL_23:
  objc_autoreleasePoolPop(v8);
}

void _btLocalStatusEventCallback(uint64_t a1, int a2)
{
  uint64_t v3 = (void *)MEMORY[0x1895A68C8]();
  uint64_t v4 = +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance");
  v5 = v4;
  switch(a2)
  {
    case 0:
      v6 = (os_log_s *)sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1874BF000, v6, OS_LOG_TYPE_INFO, "local device power state changed", buf, 2u);
      }

      -[BluetoothManager _updateDenylistMode](v5, "_updateDenylistMode");
      -[BluetoothManager _powerChanged](v5, "_powerChanged");
      break;
    case 3:
      -[BluetoothManager _connectabilityChanged](v4, "_connectabilityChanged");
      break;
    case 4:
      -[BluetoothManager _pairedStatusChanged](v4, "_pairedStatusChanged");
      break;
    case 5:
      -[BluetoothManager _connectedStatusChanged](v4, "_connectedStatusChanged");
      break;
    case 6:
    case 7:
      -[BluetoothManager _discoveryStateChanged](v4, "_discoveryStateChanged");
      break;
    case 8:
      -[BluetoothManager _advertisingChanged](v4, "_advertisingChanged");
      break;
    case 9:
      v7 = (os_log_s *)sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1874BF000, v7, OS_LOG_TYPE_INFO, "local device airplane mode state changed", v8, 2u);
      }

      -[BluetoothManager _updateAirplaneModeStatus](v5, "_updateAirplaneModeStatus");
      break;
    case 10:
      -[BluetoothManager _updateDenylistMode](v4, "_updateDenylistMode");
      break;
    case 11:
      -[BluetoothManager _notifyFirstDeviceUnlockCompleted](v4, "_notifyFirstDeviceUnlockCompleted");
      break;
    default:
      break;
  }

  objc_autoreleasePoolPop(v3);
}

void _btAccessoryEventCallback(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v10 = +[BluetoothManager sharedInstanceQueue](&OBJC_CLASS___BluetoothManager, "sharedInstanceQueue");
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = ___btAccessoryEventCallback_block_invoke;
  v11[3] = &__block_descriptor_64_e5_v8__0l;
  v11[4] = a1;
  v11[5] = a3;
  int v12 = a2;
  int v13 = a4;
  v11[6] = a5;
  dispatch_async(v10, v11);
}

void ___btAccessoryEventCallback_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v1 = *(_DWORD *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = (void *)MEMORY[0x1895A68C8]();
  uint64_t v4 = +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance");
  id v5 = -[BluetoothManager addDeviceIfNeeded:](v4, "addDeviceIfNeeded:", v2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    switch(v1)
    {
      case 1:
        buf[0] = 0;
        if (!BTAccessoryManagerGetDeviceBatteryLevel())
        {
          v6 = @"BluetoothDeviceBatteryChangedNotification";
          goto LABEL_30;
        }

        break;
      case 2:
      case 3:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        break;
      case 4:
        if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 pairedDeviceNameUpdated])
        {
          v6 = @"BluetoothMagicPairedDeviceNameChangedNotification";
          goto LABEL_30;
        }

        break;
      case 5:
        v9 = (os_log_s *)sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1874BF000, v9, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_SETTINGS_CHANGED", buf, 2u);
        }

        v6 = @"BluetoothAccessorySettingsChanged";
        goto LABEL_30;
      case 6:
        -[BluetoothManager _accessoryManager]( +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"),  "_accessoryManager");
        int v10 = BTAccessoryManagerGetInEarStatus();
        v11 = (os_log_s *)sharedBluetoothManagerLogComponent();
        int v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            ___btAccessoryEventCallback_block_invoke_cold_1();
          }
          break;
        }

        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = 3;
          _os_log_impl( &dword_1874BF000,  v12,  OS_LOG_TYPE_DEFAULT,  "received 'AACP In Ear Status Changed' event from device %@ inEarStatus Primary : %u, Secondary : %u",  buf,  0x18u);
        }

        *(void *)buf = v5;
        v18[0] = @"device";
        v18[1] = @"primaryInEarStatus";
        *(void *)&buf[8] = [MEMORY[0x189607968] numberWithUnsignedInteger:3];
        uint8_t v18[2] = @"secondaryInEarStatus";
        *(void *)&uint8_t buf[16] = [MEMORY[0x189607968] numberWithUnsignedInteger:3];
        uint64_t v17 = [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:v18 count:3];
        v6 = @"BluetoothAccessoryInEarStatusNotification";
        v16 = v4;
        goto LABEL_31;
      case 14:
        int v13 = (os_log_s *)sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1874BF000, v13, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_HEADTRACKING_CHANGED", buf, 2u);
        }

        v6 = @"BluetoothAccessibilityHeadTrackChanged";
        goto LABEL_30;
      case 15:
        v14 = (os_log_s *)sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_1874BF000,  v14,  OS_LOG_TYPE_DEFAULT,  "BT_ACCESSORY_HEADTRACKING_AVAILABILITY_CHANGED",  buf,  2u);
        }

        v6 = @"BluetoothHeadTrackingAvailable";
        goto LABEL_30;
      default:
        if (v1 == 22)
        {
          v15 = (os_log_s *)sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1874BF000, v15, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_AACP_CAPABILITIES_RECEIVED", buf, 2u);
          }

          v6 = @"BluetoothAccessoryAACPCapabilitiesReceived";
        }

        else
        {
          if (v1 != 23) {
            break;
          }
          v8 = (os_log_s *)sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_1874BF000,  v8,  OS_LOG_TYPE_DEFAULT,  "BT_ACCESSORY_SENSOR_STREAMING_FREQUENCY_CHANGED",  buf,  2u);
          }

          v6 = @"BluetoothAccessorySensorStreamingFrequencyChanged";
        }

LABEL_30:
        v16 = v4;
        uint64_t v17 = (uint64_t)v5;
LABEL_31:
        -[BluetoothManager postNotificationName:object:](v16, "postNotificationName:object:", v6, v17);
        break;
    }
  }

  else
  {
    v7 = (os_log_s *)sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___btAccessoryEventCallback_block_invoke_cold_2();
    }
  }

  objc_autoreleasePoolPop(v3);
}

void _btDiscoveryStatusEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v7 = (void *)MEMORY[0x1895A68C8]();
  [a5 _setScanState:a2];
  if ((_DWORD)a2 == 1) {
    [a5 _restartScan];
  }
  objc_autoreleasePoolPop(v7);
}

void _btDiscoveryEventCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  v8 = (void *)MEMORY[0x1895A68C8]();
  uint64_t v9 = [a5 addDeviceIfNeeded:a3];
  if (v9)
  {
    int v10 = (void *)v9;
    if (a2 == 1)
    {
      int v13 = (os_log_s *)sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        _btDiscoveryEventCallback_cold_2();
      }
      id v14 = v10;
      [a5 _removeDevice:v10];
      int v12 = @"BluetoothDeviceRemovedNotification";
      goto LABEL_10;
    }

    if (!a2)
    {
      v11 = (os_log_s *)sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        _btDiscoveryEventCallback_cold_1();
      }
      int v12 = @"BluetoothDeviceDiscoveredNotification";
LABEL_10:
      [a5 postNotificationName:v12 object:v10];
    }
  }

  objc_autoreleasePoolPop(v8);
}

void pairingAgentStatusEventCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = (void *)MEMORY[0x1895A68C8]();
  if (a3 == 4294901761LL) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = [a5 addDeviceIfNeeded:a3];
  }
  if (a2 == 3)
  {
    v11 = (os_log_s *)sharedBluetoothManagerLogComponent();
    if ((_DWORD)a4)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        pairingAgentStatusEventCallback_cold_2();
      }
      objc_msgSend( a5,  "postNotificationName:object:error:",  @"BluetoothPairingPINResultFailedNotification",  v10,  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", a4));
    }

    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        pairingAgentStatusEventCallback_cold_1();
      }
      [a5 postNotificationName:@"BluetoothPairingPINResultSuccessNotification" object:v10];
    }
  }

  objc_autoreleasePoolPop(v9);
}

void pairingAgentPincodeCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v6 = (void *)MEMORY[0x1895A68C8]();
  uint64_t v7 = [a4 addDeviceIfNeeded:a2];
  v8 = (os_log_s *)sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1874BF000, v8, OS_LOG_TYPE_INFO, "received pincode request for device %@", (uint8_t *)&v9, 0xCu);
  }

  [a4 postNotificationName:@"BluetoothPairingPINRequestNotification" object:v7];
  objc_autoreleasePoolPop(v6);
}

void pairingAgentUserConfirmationCallback(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  *(void *)&v17[5] = *MEMORY[0x1895F89C0];
  int v9 = (void *)MEMORY[0x1895A68C8]();
  uint64_t v10 = [a5 addDeviceIfNeeded:a2];
  uint64_t v11 = (os_log_s *)sharedBluetoothManagerLogComponent();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (a4)
  {
    if (v12)
    {
      *(_DWORD *)buf = 67109378;
      v17[0] = a3;
      LOWORD(v17[1]) = 2112;
      *(void *)((char *)&v17[1] + 2) = v10;
      _os_log_impl( &dword_1874BF000,  v11,  OS_LOG_TYPE_INFO,  "received user confirmation request (numeric comparison to %06u) for device %@",  buf,  0x12u);
    }

    uint64_t v13 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v10,  @"device",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", a3),  @"value",  0);
    id v14 = @"BluetoothPairingUserNumericComparisionNotification";
    v15 = a5;
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v17 = v10;
      _os_log_impl( &dword_1874BF000,  v11,  OS_LOG_TYPE_INFO,  "received user confirmation request for device %@",  buf,  0xCu);
    }

    id v14 = @"BluetoothPairingUserConfirmationNotification";
    v15 = a5;
    uint64_t v13 = v10;
  }

  [v15 postNotificationName:v14 object:v13];
  objc_autoreleasePoolPop(v9);
}

void pairingAgentPassKeyDisplayCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v7 = (void *)MEMORY[0x1895A68C8]();
  uint64_t v8 = [a4 addDeviceIfNeeded:a2];
  int v9 = (os_log_s *)sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1874BF000, v9, OS_LOG_TYPE_INFO, "received passkey display request for device %@", buf, 0xCu);
  }

  objc_msgSend( a4,  "postNotificationName:object:",  @"BluetoothPairingPassKeyDisplayNotification",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v8,  @"device",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", a3),  @"value",  0));
  objc_autoreleasePoolPop(v7);
}

void pairingAgentLocalOOBDataReadyCallback()
{
  v0 = (os_log_s *)sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_1874BF000, v0, OS_LOG_TYPE_INFO, "received Local OOB Data Ready callback, unsupported", v1, 2u);
  }

Class ___bluetoothIsBeingManaged_block_invoke()
{
  Class result = NSClassFromString(@"MCProfileConnection");
  if (result)
  {
    Class result = (Class)objc_msgSend( (id)-[objc_class sharedConnection](result, "sharedConnection"),  "isBluetoothModificationAllowed");
    _bluetoothIsBeingManaged_isManaged = result ^ 1;
  }

  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_2_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_11( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void AddressForBTDevice_cold_1()
{
}

void _btServiceEventCallback_cold_1()
{
}

void _btServiceEventCallback_cold_2()
{
}

void _btServiceEventCallback_cold_3()
{
}

void _btServiceEventCallback_cold_4()
{
}

void _btServiceEventCallback_cold_5()
{
}

void _btServiceEventCallback_cold_6()
{
}

void _btServiceEventCallback_cold_7()
{
}

void _btServiceEventCallback_cold_8()
{
}

void _btServiceEventCallback_cold_9()
{
}

void _btServiceEventCallback_cold_10()
{
}

void _btSessionEventCallback_cold_1()
{
}

void ___btAccessoryEventCallback_block_invoke_cold_1()
{
}

void ___btAccessoryEventCallback_block_invoke_cold_2()
{
}

void _btDiscoveryEventCallback_cold_1()
{
}

void _btDiscoveryEventCallback_cold_2()
{
}

void pairingAgentStatusEventCallback_cold_1()
{
}

void pairingAgentStatusEventCallback_cold_2()
{
}

uint64_t BTAccessoryManagerAddCallbacks()
{
  return MEMORY[0x189611120]();
}

uint64_t BTAccessoryManagerGetAACPCapabilityBits()
{
  return MEMORY[0x189611128]();
}

uint64_t BTAccessoryManagerGetAACPCapabilityInteger()
{
  return MEMORY[0x189611130]();
}

uint64_t BTAccessoryManagerGetAccessoryInfo()
{
  return MEMORY[0x189611138]();
}

uint64_t BTAccessoryManagerGetCallManagementConfig()
{
  return MEMORY[0x189611140]();
}

uint64_t BTAccessoryManagerGetControlCommand()
{
  return MEMORY[0x189611148]();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x189611150]();
}

uint64_t BTAccessoryManagerGetDeviceBatteryLevel()
{
  return MEMORY[0x189611158]();
}

uint64_t BTAccessoryManagerGetDeviceBatteryStatus()
{
  return MEMORY[0x189611160]();
}

uint64_t BTAccessoryManagerGetDeviceColor()
{
  return MEMORY[0x189611168]();
}

uint64_t BTAccessoryManagerGetDeviceSoundProfileAllowed()
{
  return MEMORY[0x189611170]();
}

uint64_t BTAccessoryManagerGetDeviceSoundProfileSupport()
{
  return MEMORY[0x189611178]();
}

uint64_t BTAccessoryManagerGetDoubleTapAction()
{
  return MEMORY[0x189611180]();
}

uint64_t BTAccessoryManagerGetDoubleTapActionEx()
{
  return MEMORY[0x189611188]();
}

uint64_t BTAccessoryManagerGetDoubleTapCapability()
{
  return MEMORY[0x189611190]();
}

uint64_t BTAccessoryManagerGetFeatureCapability()
{
  return MEMORY[0x189611198]();
}

uint64_t BTAccessoryManagerGetFeatureProxCardStatus()
{
  return MEMORY[0x1896111A0]();
}

uint64_t BTAccessoryManagerGetGyroInformation()
{
  return MEMORY[0x1896111A8]();
}

uint64_t BTAccessoryManagerGetHeadphoneFeatureValue()
{
  return MEMORY[0x1896111B0]();
}

uint64_t BTAccessoryManagerGetInEarDetectionEnable()
{
  return MEMORY[0x1896111B8]();
}

uint64_t BTAccessoryManagerGetInEarStatus()
{
  return MEMORY[0x1896111C0]();
}

uint64_t BTAccessoryManagerGetMicMode()
{
  return MEMORY[0x1896111C8]();
}

uint64_t BTAccessoryManagerGetNonAppleHAEPairedDevices()
{
  return MEMORY[0x1896111D0]();
}

uint64_t BTAccessoryManagerGetPrimaryBudSide()
{
  return MEMORY[0x1896111D8]();
}

uint64_t BTAccessoryManagerGetSettingFeatureBitMask()
{
  return MEMORY[0x1896111E0]();
}

uint64_t BTAccessoryManagerGetSmartRouteMode()
{
  return MEMORY[0x1896111E8]();
}

uint64_t BTAccessoryManagerGetSmartRouteSupport()
{
  return MEMORY[0x1896111F0]();
}

uint64_t BTAccessoryManagerGetSpatialAudioActive()
{
  return MEMORY[0x1896111F8]();
}

uint64_t BTAccessoryManagerGetSpatialAudioAllowed()
{
  return MEMORY[0x189611200]();
}

uint64_t BTAccessoryManagerGetSpatialAudioConfig()
{
  return MEMORY[0x189611208]();
}

uint64_t BTAccessoryManagerGetSpatialAudioPlatformSupport()
{
  return MEMORY[0x189611210]();
}

uint64_t BTAccessoryManagerGetStereoHFPSupport()
{
  return MEMORY[0x189611218]();
}

uint64_t BTAccessoryManagerGetWirelessSharingSpatial()
{
  return MEMORY[0x189611220]();
}

uint64_t BTAccessoryManagerIsAccessory()
{
  return MEMORY[0x189611228]();
}

uint64_t BTAccessoryManagerIsGenuineAirPods()
{
  return MEMORY[0x189611230]();
}

uint64_t BTAccessoryManagerRemoveCallbacks()
{
  return MEMORY[0x189611238]();
}

uint64_t BTAccessoryManagerSendControlCommand()
{
  return MEMORY[0x189611240]();
}

uint64_t BTAccessoryManagerSetDeviceSoundProfileAllowed()
{
  return MEMORY[0x189611248]();
}

uint64_t BTAccessoryManagerSetDoubleTapAction()
{
  return MEMORY[0x189611250]();
}

uint64_t BTAccessoryManagerSetDoubleTapActionEx()
{
  return MEMORY[0x189611258]();
}

uint64_t BTAccessoryManagerSetFeatureProxCardStatus()
{
  return MEMORY[0x189611260]();
}

uint64_t BTAccessoryManagerSetHeadphoneFeatureValue()
{
  return MEMORY[0x189611268]();
}

uint64_t BTAccessoryManagerSetInEarDetectionEnable()
{
  return MEMORY[0x189611270]();
}

uint64_t BTAccessoryManagerSetIsHidden()
{
  return MEMORY[0x189611278]();
}

uint64_t BTAccessoryManagerSetMicMode()
{
  return MEMORY[0x189611280]();
}

uint64_t BTAccessoryManagerSetupCommand()
{
  return MEMORY[0x189611288]();
}

uint64_t BTAccessoryManagerSmartRouteMode()
{
  return MEMORY[0x189611290]();
}

uint64_t BTAccessoryManagerSpatialAudioAllowed()
{
  return MEMORY[0x189611298]();
}

uint64_t BTAccessoryManagerSpatialAudioConfig()
{
  return MEMORY[0x1896112A0]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x1896112A8]();
}

uint64_t BTDeviceConnectServices()
{
  return MEMORY[0x1896112B0]();
}

uint64_t BTDeviceDisconnect()
{
  return MEMORY[0x1896112B8]();
}

uint64_t BTDeviceFromAddress()
{
  return MEMORY[0x1896112C0]();
}

uint64_t BTDeviceFromIdentifier()
{
  return MEMORY[0x1896112C8]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x1896112D0]();
}

uint64_t BTDeviceGetCloudPairingStatus()
{
  return MEMORY[0x1896112D8]();
}

uint64_t BTDeviceGetConnectedServices()
{
  return MEMORY[0x1896112E0]();
}

uint64_t BTDeviceGetDefaultName()
{
  return MEMORY[0x1896112E8]();
}

uint64_t BTDeviceGetDeviceClass()
{
  return MEMORY[0x1896112F0]();
}

uint64_t BTDeviceGetDeviceId()
{
  return MEMORY[0x1896112F8]();
}

uint64_t BTDeviceGetDeviceType()
{
  return MEMORY[0x189611300]();
}

uint64_t BTDeviceGetGroups()
{
  return MEMORY[0x189611308]();
}

uint64_t BTDeviceGetHIDDeviceBehavior()
{
  return MEMORY[0x189611310]();
}

uint64_t BTDeviceGetLowSecurityStatus()
{
  return MEMORY[0x189611318]();
}

uint64_t BTDeviceGetMagicPairingStatus()
{
  return MEMORY[0x189611320]();
}

uint64_t BTDeviceGetName()
{
  return MEMORY[0x189611328]();
}

uint64_t BTDeviceGetPairingStatus()
{
  return MEMORY[0x189611330]();
}

uint64_t BTDeviceGetProductName()
{
  return MEMORY[0x189611338]();
}

uint64_t BTDeviceGetServiceSettings()
{
  return MEMORY[0x189611340]();
}

uint64_t BTDeviceGetSupportedServices()
{
  return MEMORY[0x189611348]();
}

uint64_t BTDeviceGetSyncSettings()
{
  return MEMORY[0x189611350]();
}

uint64_t BTDeviceGetUserSelectedDeviceType()
{
  return MEMORY[0x189611358]();
}

uint64_t BTDeviceIsAppleAudioDevice()
{
  return MEMORY[0x189611360]();
}

uint64_t BTDeviceIsProController()
{
  return MEMORY[0x189611368]();
}

uint64_t BTDeviceIsTemporaryPaired()
{
  return MEMORY[0x189611370]();
}

uint64_t BTDevicePhysicalLinkDisconnect()
{
  return MEMORY[0x189611378]();
}

uint64_t BTDeviceSetGroup()
{
  return MEMORY[0x189611380]();
}

uint64_t BTDeviceSetServiceSettings()
{
  return MEMORY[0x189611388]();
}

uint64_t BTDeviceSetSyncSettings()
{
  return MEMORY[0x189611390]();
}

uint64_t BTDeviceSetUserName()
{
  return MEMORY[0x189611398]();
}

uint64_t BTDeviceSetUserSelectedDeviceType()
{
  return MEMORY[0x1896113A0]();
}

uint64_t BTDeviceSupportsHS()
{
  return MEMORY[0x1896113A8]();
}

uint64_t BTDiscoveryAgentCreate()
{
  return MEMORY[0x1896113B0]();
}

uint64_t BTDiscoveryAgentDestroy()
{
  return MEMORY[0x1896113B8]();
}

uint64_t BTDiscoveryAgentGetDevices()
{
  return MEMORY[0x1896113C0]();
}

uint64_t BTDiscoveryAgentStartScan()
{
  return MEMORY[0x1896113C8]();
}

uint64_t BTDiscoveryAgentStopScan()
{
  return MEMORY[0x1896113D0]();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return MEMORY[0x1896113D8]();
}

uint64_t BTLocalDeviceEnableDUTMode()
{
  return MEMORY[0x1896113E0]();
}

uint64_t BTLocalDeviceGetAddressString()
{
  return MEMORY[0x1896113E8]();
}

uint64_t BTLocalDeviceGetAdvertisingStatus()
{
  return MEMORY[0x1896113F0]();
}

uint64_t BTLocalDeviceGetAirplaneModeStatus()
{
  return MEMORY[0x1896113F8]();
}

uint64_t BTLocalDeviceGetConnectable()
{
  return MEMORY[0x189611400]();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return MEMORY[0x189611408]();
}

uint64_t BTLocalDeviceGetConnectingDevices()
{
  return MEMORY[0x189611410]();
}

uint64_t BTLocalDeviceGetConnectionStatus()
{
  return MEMORY[0x189611418]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x189611420]();
}

uint64_t BTLocalDeviceGetDenylistEnabled()
{
  return MEMORY[0x189611428]();
}

uint64_t BTLocalDeviceGetDeviceNamesThatMayBeDenylisted()
{
  return MEMORY[0x189611430]();
}

uint64_t BTLocalDeviceGetDiscoverable()
{
  return MEMORY[0x189611438]();
}

uint64_t BTLocalDeviceGetModulePower()
{
  return MEMORY[0x189611440]();
}

uint64_t BTLocalDeviceGetPairedDevices()
{
  return MEMORY[0x189611448]();
}

uint64_t BTLocalDeviceGetScanning()
{
  return MEMORY[0x189611450]();
}

uint64_t BTLocalDeviceGetSpatialPlatformSupport()
{
  return MEMORY[0x189611458]();
}

uint64_t BTLocalDeviceMaskCallbacks()
{
  return MEMORY[0x189611460]();
}

uint64_t BTLocalDeviceRemoveCallbacks()
{
  return MEMORY[0x189611468]();
}

uint64_t BTLocalDeviceSetConnectable()
{
  return MEMORY[0x189611470]();
}

uint64_t BTLocalDeviceSetDenylistEnabled()
{
  return MEMORY[0x189611478]();
}

uint64_t BTLocalDeviceSetDiscoverable()
{
  return MEMORY[0x189611480]();
}

uint64_t BTLocalDeviceSetModulePower()
{
  return MEMORY[0x189611488]();
}

uint64_t BTLocalDeviceShowPowerPrompt()
{
  return MEMORY[0x189611490]();
}

uint64_t BTLocalDeviceSupportsService()
{
  return MEMORY[0x189611498]();
}

uint64_t BTPairingAgentAcceptSSP()
{
  return MEMORY[0x1896114A0]();
}

uint64_t BTPairingAgentCancelPairing()
{
  return MEMORY[0x1896114A8]();
}

uint64_t BTPairingAgentCreate()
{
  return MEMORY[0x1896114B0]();
}

uint64_t BTPairingAgentDeletePairedDevice()
{
  return MEMORY[0x1896114B8]();
}

uint64_t BTPairingAgentDestroy()
{
  return MEMORY[0x1896114C0]();
}

uint64_t BTPairingAgentSetPincode()
{
  return MEMORY[0x1896114C8]();
}

uint64_t BTPairingAgentStart()
{
  return MEMORY[0x1896114D0]();
}

uint64_t BTPairingAgentStop()
{
  return MEMORY[0x1896114D8]();
}

uint64_t BTServiceAddCallbacks()
{
  return MEMORY[0x1896114E0]();
}

uint64_t BTServiceRemoveCallbacks()
{
  return MEMORY[0x1896114E8]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x1896114F0]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x1896114F8]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E50]();
}

void CFNotificationCenterPostNotification( CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x189613718]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

void xpc_release(xpc_object_t object)
{
}