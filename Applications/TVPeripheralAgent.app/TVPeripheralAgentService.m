@interface TVPeripheralAgentService
+ (id)_batteryCheckReasonDescription:(int64_t)a3;
+ (id)_gameControllerHomeButtonImageIDWithService:(unsigned int)a3;
+ (id)sharedInstance;
- (BOOL)_couldRequireProximityPairingWorkaround;
- (BOOL)_isDeviceConnectedWithRegistryEntryID:(unint64_t)a3;
- (BOOL)batteryNotificationDeviceValid:(void *)a3;
- (BOOL)isSuppressingDisconnectHUDDuringProximityPairing;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldConnectToAudioDevice;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (NSMutableSet)connectedAudioDevices;
- (NSXPCListener)listener;
- (PBSBulletin)bulletin;
- (PBSBulletinService)bulletinService;
- (PBSHeadphoneBannerManager)headphoneBannerManager;
- (TVPABluetoothRemoteDiscoveryHelper)bluetoothRemoteDiscoveryHelper;
- (TVPABluetoothRemotePairingAgent)bluetoothRemotePairingAgent;
- (TVPADeviceEnforcementAgent)deviceEnforcementAgent;
- (TVPAPeripheralHUDSuppressionDataStore)hudSuppressionDataStore;
- (id)_activeApplicationBundleIdentifiers;
- (id)_knownBluetoothGamepadIDs;
- (id)_mostRecentlyPlayedGameFromRecentApplicationBundleIdentifiers:(id)a3;
- (void)_bluetoothRemoteBatteryLevelChanged:(id)a3;
- (void)_bluetoothRemoteDidConnectNotification:(id)a3;
- (void)_bluetoothRemoteDidDetectUserPresenceNotification:(id)a3;
- (void)_bluetoothRemoteDidDisconnectNotification:(id)a3;
- (void)_bluetoothRemotePowerSourceLimitedSourceNotification:(id)a3;
- (void)_checkBatteryLevelForRemote:(id)a3 reason:(int64_t)a4;
- (void)_dismissPairingAgent;
- (void)_enforcementAgentWillDisconnectDeviceNotification:(id)a3;
- (void)_handleGameControllerConnectedWithService:(unsigned int)a3 registryEntryID:(unint64_t)a4;
- (void)_handleGameControllerDisconnectedWithService:(unsigned int)a3 registryEntryID:(unint64_t)a4;
- (void)_initializeRemoteClickpadModeDidChangeDarwinNotifyToken;
- (void)_postRemoteClickpadModeDidChangeDarwinNotification:(unint64_t)a3;
- (void)_postRemoteTypeDidChangeDarwinNotificationIfNeeded;
- (void)_presentPeripheralNotification:(id)a3;
- (void)_rememberConnectedDeviceForService:(unsigned int)a3 deviceType:(int64_t)a4;
- (void)_setupNotificationForExternalDeviceConnectionAndBatteryLevel;
- (void)beginSuppressingPeripheralHUDWithOptions:(unint64_t)a3 forClientBundleIdentifier:(id)a4;
- (void)bluetoothManager:(id)a3 didCompleteDeviceConnection:(id)a4 error:(id)a5;
- (void)bluetoothManager:(id)a3 didCompleteDeviceDisconnection:(id)a4 error:(id)a5;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)dealloc;
- (void)endSuppressingPeripheralHUDWithOptions:(unint64_t)a3 forClientBundleIdentifier:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pairingAgentDidPairRemote:(id)a3;
- (void)pairingAgentDidTimeout:(id)a3;
- (void)presentAudioDeviceConnectedNotificationWithDevice:(id)a3;
- (void)presentAudioDeviceDisconnectedNotificationWithDevice:(id)a3;
- (void)presentGameControllerConnectedNotificationWithName:(id)a3 homeButtonImageID:(id)a4 mostRecentlyPlayedGame:(id)a5;
- (void)presentGameControllerDisconnectedNotificationWithName:(id)a3;
- (void)presentPeripheralNotificationWithType:(int64_t)a3;
- (void)presentRemoteConnectedNotification:(id)a3;
- (void)presentRemoteDisconnectedNotification:(id)a3;
- (void)refreshGameControllerPowerSources;
- (void)setBluetoothRemoteDiscoveryHelper:(id)a3;
- (void)setBluetoothRemotePairingAgent:(id)a3;
- (void)setBulletin:(id)a3;
- (void)setBulletinService:(id)a3;
- (void)setConnectedAudioDevices:(id)a3;
- (void)setDeviceEnforcementAgent:(id)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setHeadphoneBannerManager:(id)a3;
- (void)setHudSuppressionDataStore:(id)a3;
- (void)setListener:(id)a3;
- (void)setSuppressingDisconnectHUDDuringProximityPairing:(BOOL)a3;
- (void)start;
- (void)updateBatteryState;
@end

@implementation TVPeripheralAgentService

+ (id)sharedInstance
{
  v4 = (dispatch_once_t *)&unk_100041380;
  id location = 0LL;
  objc_storeStrong(&location, &stru_100038D88);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100041378;
}

- (id)_knownBluetoothGamepadIDs
{
  v9[2] = self;
  v9[1] = (id)a2;
  id v7 =  +[TVSPreferences sharedAppleTVServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedAppleTVServicesPreferences");
  v9[0] = [v7 objectForKey:off_1000401E8[0]];

  v8 = 0LL;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v9[0], v2) & 1) != 0) {
    v3 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9[0]);
  }
  else {
    v3 = +[NSSet set](&OBJC_CLASS___NSSet, "set");
  }
  v4 = v8;
  v8 = v3;

  v6 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(v9, 0LL);
  return v6;
}

- (void)refreshGameControllerPowerSources
{
  v39 = self;
  value[1] = (void *)a2;
  CFDictionaryRemoveAllValues(self->gcPowerSourceRegistryIDs);
  CFTypeRef v35 = (CFTypeRef)IOPSCopyPowerSourcesByType(4LL);
  if (v35)
  {
    CFArrayRef v34 = IOPSCopyPowerSourcesList(v35);
    if (v34)
    {
      for (CFIndex i = 0LL; ; ++i)
      {
        CFIndex v14 = i;
        if (v14 >= CFArrayGetCount(v34)) {
          break;
        }
        ValueAtIndex = CFArrayGetValueAtIndex(v34, i);
        CFDictionaryRef v32 = IOPSGetPowerSourceDescription(v35, ValueAtIndex);
        if (v32)
        {
          if (CFDictionaryGetValueIfPresent(v32, @"Accessory Category", (const void **)value))
          {
            if (CFStringCompare((CFStringRef)value[0], @"Game Controller", 0LL) == kCFCompareEqualTo)
            {
              if (CFDictionaryGetValueIfPresent(v32, @"Accessory Identifier", (const void **)&v37))
              {
                CFDictionaryAddValue(v39->gcPowerSourceRegistryIDs, v37, ValueAtIndex);
                id location = sub_10001B96C();
                char v30 = 2;
                if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
                {
                  log = (os_log_s *)location;
                  os_log_type_t type = v30;
                  sub_100013988((uint64_t)v40, (uint64_t)v37);
                  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  type,  "Game Controller Battery: found power source accessory connection with registryID = %@",  v40,  0xCu);
                }

                objc_storeStrong(&location, 0LL);
              }

              else
              {
                id v29 = sub_10001B96C();
                char v28 = 16;
                if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
                {
                  v10 = (os_log_s *)v29;
                  os_log_type_t v11 = v28;
                  sub_100009998(v27);
                  _os_log_error_impl( (void *)&_mh_execute_header,  v10,  v11,  "Game Controller Battery: No HUD alert will be shown for battery status notification from game contro ller. Reason: failed to get indentifier of the game controller type accessory power source",  v27,  2u);
                }

                objc_storeStrong(&v29, 0LL);
              }
            }
          }

          else
          {
            id v26 = sub_10001B96C();
            char v25 = 2;
            if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
            {
              v8 = (os_log_s *)v26;
              os_log_type_t v9 = v25;
              sub_100009998(v24);
              _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  v9,  "Game Controller Battery: found power source accessory connection that does not implement kIOPSAccessoryCategoryKey",  v24,  2u);
            }

            objc_storeStrong(&v26, 0LL);
          }
        }

        else
        {
          id v23 = sub_10001B96C();
          char v22 = 16;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
          {
            v6 = (os_log_s *)v23;
            os_log_type_t v7 = v22;
            sub_100009998(v21);
            _os_log_error_impl( (void *)&_mh_execute_header,  v6,  v7,  "Game Controller Battery: No HUD alert will be shown for game controller's battery status. Reason: failed t o get description of power sources for accessories",  v21,  2u);
          }

          objc_storeStrong(&v23, 0LL);
        }
      }

      CFRelease(v34);
    }

    else
    {
      os_log_t oslog = (os_log_t)sub_10001B96C();
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v4 = oslog;
        os_log_type_t v5 = v19;
        sub_100009998(v18);
        _os_log_error_impl( (void *)&_mh_execute_header,  v4,  v5,  "Game Controller Battery: No HUD alert will be shown for game controller's battery status. Reason: failed to ge t handle for list of power sources for accessories",  v18,  2u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }

    CFRelease(v35);
  }

  else
  {
    os_log_t v17 = (os_log_t)sub_10001B96C();
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v2 = v17;
      os_log_type_t v3 = v16;
      sub_100009998(v15);
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  v3,  "Game Controller Battery: No HUD alert will be shown for game controller's battery status. Reason: failed to get power sources for accessory type devices",  v15,  2u);
    }

    objc_storeStrong((id *)&v17, 0LL);
  }

- (void)updateBatteryState
{
  v56 = self;
  value[1] = (void *)a2;
  CFTypeRef v52 = (CFTypeRef)IOPSCopyPowerSourcesByType(4LL);
  if (v52)
  {
    CFArrayRef v51 = IOPSCopyPowerSourcesList(v52);
    if (v51)
    {
      for (CFIndex i = 0LL; ; ++i)
      {
        CFIndex v20 = i;
        if (v20 >= CFArrayGetCount(v51)) {
          break;
        }
        CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(v51, i);
        CFDictionaryRef v49 = IOPSGetPowerSourceDescription(v52, ValueAtIndex);
        if (v49)
        {
          if (CFDictionaryGetValueIfPresent(v49, @"Accessory Identifier", (const void **)value))
          {
            if (CFDictionaryGetValueIfPresent(v56->gcPowerSourceRegistryIDs, value[0], (const void **)&v54))
            {
              if (-[TVPeripheralAgentService batteryNotificationDeviceValid:]( v56,  "batteryNotificationDeviceValid:",  value[0]))
              {
                if (CFDictionaryGetValueIfPresent(v49, @"Current Capacity", (const void **)&v44)
                  && CFDictionaryGetValueIfPresent(v49, @"Max Capacity", (const void **)&v43))
                {
                  CFNumberGetValue((CFNumberRef)v43, kCFNumberLongLongType, &valuePtr);
                  if (valuePtr)
                  {
                    CFNumberGetValue((CFNumberRef)v44, kCFNumberLongLongType, &v46);
                    id v42 = sub_10001B96C();
                    os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
                    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEFAULT))
                    {
                      os_log_type_t v16 = (os_log_s *)v42;
                      os_log_type_t v17 = v41;
                      sub_100014970((uint64_t)v58, (uint64_t)value[0], v46);
                      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "Game Controller Battery: accessory with registry ID = %@ reporting battery capacity level = %llu",  v58,  0x16u);
                    }

                    objc_storeStrong(&v42, 0LL);
                    if (v46 > 5)
                    {
                      if (v46 > 0xA)
                      {
                        if (v46 <= 0x14) {
                          -[TVPeripheralAgentService presentPeripheralNotificationWithType:]( v56,  "presentPeripheralNotificationWithType:",  10LL);
                        }
                      }

                      else
                      {
                        -[TVPeripheralAgentService presentPeripheralNotificationWithType:]( v56,  "presentPeripheralNotificationWithType:",  11LL);
                      }
                    }

                    else
                    {
                      -[TVPeripheralAgentService presentPeripheralNotificationWithType:]( v56,  "presentPeripheralNotificationWithType:",  12LL);
                    }
                  }

                  else
                  {
                    id v40 = sub_10001B96C();
                    char v39 = 2;
                    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEBUG))
                    {
                      CFIndex v14 = (os_log_s *)v40;
                      os_log_type_t v15 = v39;
                      sub_100009998(v38);
                      _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  v15,  "Game Controller Battery: Ignoring battery level reports for uninitialized power source",  v38,  2u);
                    }

                    objc_storeStrong(&v40, 0LL);
                  }
                }

                else
                {
                  os_log_t oslog = (os_log_t)sub_10001B96C();
                  os_log_type_t v36 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                  {
                    v12 = oslog;
                    os_log_type_t v13 = v36;
                    sub_100009998(v35);
                    _os_log_error_impl( (void *)&_mh_execute_header,  v12,  v13,  "Game Controller Battery: No HUD alert will be shown for game controller's battery status. Reason: failed to get current battery capacity of the accessory power source",  v35,  2u);
                  }

                  objc_storeStrong((id *)&oslog, 0LL);
                }
              }

              else
              {
                os_log_t v34 = (os_log_t)sub_10001B96C();
                os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  v10 = v34;
                  os_log_type_t v11 = v33;
                  sub_100013988((uint64_t)v57, (uint64_t)value[0]);
                  _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "Game Controller Battery: accessory ID %@ did not match TVPA's cached keys of connected devices",  v57,  0xCu);
                }

                objc_storeStrong((id *)&v34, 0LL);
              }
            }

            else
            {
              id location = sub_10001B96C();
              char v47 = 2;
              if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
              {
                log = (os_log_s *)location;
                os_log_type_t type = v47;
                sub_100013988((uint64_t)v59, (uint64_t)value[0]);
                _os_log_debug_impl( (void *)&_mh_execute_header,  log,  type,  "Game Controller Battery: got battery level notification from accessory power source with registryID = %@ that is not an attached accessory (i.e. kIOPSAccNotifyAttach is missing for this device)",  v59,  0xCu);
              }

              objc_storeStrong(&location, 0LL);
            }
          }

          else
          {
            os_log_t v32 = (os_log_t)sub_10001B96C();
            os_log_type_t v31 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v8 = v32;
              os_log_type_t v9 = v31;
              sub_100009998(v30);
              _os_log_error_impl( (void *)&_mh_execute_header,  v8,  v9,  "Game Controller Battery: No HUD alert will be shown for game controller's battery status. Reason: failed to get indentifier key of the accessory power source",  v30,  2u);
            }

            objc_storeStrong((id *)&v32, 0LL);
          }
        }

        else
        {
          os_log_t v29 = (os_log_t)sub_10001B96C();
          os_log_type_t v28 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v6 = v29;
            os_log_type_t v7 = v28;
            sub_100009998(v27);
            _os_log_error_impl( (void *)&_mh_execute_header,  v6,  v7,  "Game Controller Battery: No HUD alert will be shown for game controller's battery status. Reason: failed t o get description of power sources for accessories",  v27,  2u);
          }

          objc_storeStrong((id *)&v29, 0LL);
        }
      }

      CFRelease(v51);
    }

    else
    {
      os_log_t v26 = (os_log_t)sub_10001B96C();
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v4 = v26;
        os_log_type_t v5 = v25;
        sub_100009998(v24);
        _os_log_error_impl( (void *)&_mh_execute_header,  v4,  v5,  "Game Controller Battery: No HUD alert will be shown for game controller's battery status. Reason: failed to ge t handle for list of power sources for accessories",  v24,  2u);
      }

      objc_storeStrong((id *)&v26, 0LL);
    }

    CFRelease(v52);
  }

  else
  {
    os_log_t v23 = (os_log_t)sub_10001B96C();
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v2 = v23;
      os_log_type_t v3 = v22;
      sub_100009998(v21);
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  v3,  "Game Controller Battery: No HUD alert will be shown for game controller's battery status. Reason: failed to get indentifier key of the accessory power source",  v21,  2u);
    }

    objc_storeStrong((id *)&v23, 0LL);
  }

- (BOOL)batteryNotificationDeviceValid:(void *)a3
{
  os_log_type_t v15 = self;
  SEL v14 = a2;
  CFNumberRef v13 = (CFNumberRef)a3;
  char v12 = 0;
  if (a3)
  {
    CFTypeID v7 = CFGetTypeID(v13);
    if (v7 == CFStringGetTypeID())
    {
      v6 = +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v13);
      -[NSScanner scanUnsignedLongLong:](v6, "scanUnsignedLongLong:", &valuePtr);
      objc_storeStrong((id *)&v6, 0LL);
    }

    else if (v7 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v13, kCFNumberLongLongType, &valuePtr);
    }

    else
    {
      uint64_t valuePtr = -1LL;
    }

    return -[TVPeripheralAgentService _isDeviceConnectedWithRegistryEntryID:]( v15,  "_isDeviceConnectedWithRegistryEntryID:",  valuePtr);
  }

  else
  {
    id location = sub_10001B96C();
    char v9 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v9;
      sub_100009998(v8);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "Game Controller Battery: null handle for device registry ID",  v8,  2u);
    }

    objc_storeStrong(&location, 0LL);
    return 0;
  }

- (TVPABluetoothRemotePairingAgent)bluetoothRemotePairingAgent
{
  if (!self->_bluetoothRemotePairingAgent)
  {
    uint64_t v2 = objc_opt_new(&OBJC_CLASS___TVPABluetoothRemotePairingAgent);
    bluetoothRemotePairingAgent = self->_bluetoothRemotePairingAgent;
    self->_bluetoothRemotePairingAgent = v2;

    -[TVPABluetoothRemotePairingAgent setDelegate:](self->_bluetoothRemotePairingAgent, "setDelegate:", self);
  }

  return self->_bluetoothRemotePairingAgent;
}

- (void)_rememberConnectedDeviceForService:(unsigned int)a3 deviceType:(int64_t)a4
{
  SEL v14 = self;
  SEL v13 = a2;
  io_registry_entry_t v12 = a3;
  int64_t v11 = a4;
  id CFProperty = (id)IORegistryEntryCreateCFProperty(a3, @"Transport", kCFAllocatorDefault, 0);
  id v10 = CFProperty;
  if ([v10 isEqualToString:@"BluetoothLowEnergy"])
  {
    id v17 = (id)IORegistryEntryCreateCFProperty(v12, @"PhysicalDeviceUniqueID", kCFAllocatorDefault, 0);
    id v9 = v17;
    if ([v9 length])
    {
      id v16 = (id)IORegistryEntryCreateCFProperty(v12, @"VendorID", kCFAllocatorDefault, 0);
      id v8 = v16;
      id v15 = (id)IORegistryEntryCreateCFProperty(v12, @"ProductID", kCFAllocatorDefault, 0);
      id v7 = v15;
      id v6 = v9;
      int64_t v4 = v11;
      id v5 = [v8 unsignedIntegerValue];
      TVSRememberConnectedPeripheral(v6, v4, v5, [v7 unsignedIntegerValue]);
      objc_storeStrong(&v7, 0LL);
      objc_storeStrong(&v8, 0LL);
    }

    objc_storeStrong(&v9, 0LL);
  }

  objc_storeStrong(&v10, 0LL);
}

- (void)_handleGameControllerConnectedWithService:(unsigned int)a3 registryEntryID:(unint64_t)a4
{
  char v30 = self;
  SEL v29 = a2;
  unsigned int v28 = a3;
  v27 = (void *)a4;
  id CFProperty = (id)IORegistryEntryCreateCFProperty(a3, @"Product", kCFAllocatorDefault, 0);
  id v26 = CFProperty;
  id location = sub_10001B96C();
  os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    sub_100014970((uint64_t)v33, (uint64_t)v26, (uint64_t)v27);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v24,  "Handling connected game controller. name=%@, registryEntryID=%llu",  v33,  0x16u);
  }

  objc_storeStrong(&location, 0LL);
  if ((sub_10001C328(v30->startTime, 0.0) & 1) != 0)
  {
    int64_t v4 = (void *)objc_opt_class(v30);
    id v19 = [v4 _gameControllerHomeButtonImageIDWithService:v28];
    id v18 = sub_10001B96C();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
      sub_100014970((uint64_t)v32, (uint64_t)v26, (uint64_t)v27);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  v17,  "Fetching recent application bundle identifiers for game controller connection. name=%@, registryEntryID=%llu",  v32,  0x16u);
    }

    objc_storeStrong(&v18, 0LL);
    id v6 = +[PBSSystemServiceConnection sharedConnection](&OBJC_CLASS___PBSSystemServiceConnection, "sharedConnection");
    id v5 = [v6 systemServiceProxy];
    id v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    io_registry_entry_t v12 = sub_10001D948;
    SEL v13 = &unk_100038E00;
    SEL v14 = v30;
    v16[1] = v27;
    id v15 = v26;
    v16[0] = v19;
    [v5 recentApplicationBundleIdentifiersWithReply:&v9];

    objc_storeStrong(v16, 0LL);
    objc_storeStrong(&v15, 0LL);
    objc_storeStrong((id *)&v14, 0LL);
    objc_storeStrong(&v19, 0LL);
    int v20 = 0;
  }

  else
  {
    id v23 = sub_10001B96C();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (os_log_s *)v23;
      os_log_type_t v8 = v22;
      sub_100009998(v21);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "NOT SHOWING game controller notification.", v21, 2u);
    }

    objc_storeStrong(&v23, 0LL);
    int v20 = 1;
  }

  objc_storeStrong(&v26, 0LL);
}

+ (id)_gameControllerHomeButtonImageIDWithService:(unsigned int)a3
{
  id v10 = a1;
  SEL v9 = a2;
  io_registry_entry_t v8 = a3;
  id location = @"";
  id CFProperty = (id)IORegistryEntryCreateCFProperty(v8, @"VendorID", kCFAllocatorDefault, 0);
  id v6 = CFProperty;
  id v5 = [v6 unsignedIntegerValue];
  if (v5 == (id)1118)
  {
    objc_storeStrong(&location, PBSSystemBulletinTextImageIDXboxButton);
  }

  else if (v5 == (id)1356)
  {
    objc_storeStrong(&location, PBSSystemBulletinTextImageIDPlayStationButton);
  }

  id v4 = location;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&location, 0LL);
  return v4;
}

- (id)_mostRecentlyPlayedGameFromRecentApplicationBundleIdentifiers:(id)a3
{
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v24 = -[TVPeripheralAgentService _activeApplicationBundleIdentifiers](v26, "_activeApplicationBundleIdentifiers");
  id v6 = +[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance");
  id v23 = -[PBSAppInfoController appInfos](v6, "appInfos");

  id v22 = sub_10001B96C();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000822C((uint64_t)v27, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  v21,  "Will check for recently played games using recent applications. bundlerIdentifiers=%{public}@",  v27,  0xCu);
  }

  objc_storeStrong(&v22, 0LL);
  uint64_t v14 = 0LL;
  id v15 = &v14;
  int v16 = 838860800;
  int v17 = 48;
  id v18 = sub_10001B9E4;
  id v19 = sub_10001BA38;
  id v20 = 0LL;
  id v5 = location[0];
  id v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = sub_10001E0C4;
  int v11 = &unk_100038E28;
  id v12 = v23;
  v13[0] = v24;
  v13[1] = &v14;
  [v5 enumerateObjectsWithOptions:2 usingBlock:&v7];
  id v4 = (id)v15[5];
  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v12, 0LL);
  _Block_object_dispose(&v14, 8);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)_activeApplicationBundleIdentifiers
{
  id v15 = self;
  v14[1] = (id)a2;
  v14[0] = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  memset(__b, 0, sizeof(__b));
  id v8 = -[FBSDisplayLayoutMonitor currentLayout](v15->_displayLayoutMonitor, "currentLayout");
  id obj = [v8 elements];

  id v10 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v6);
      id location = [v13 bundleIdentifier];
      if (location) {
        [v14[0] addObject:location];
      }
      objc_storeStrong(&location, 0LL);
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = [v14[0] copy];
  objc_storeStrong(v14, 0LL);
  return v3;
}

- (void)_handleGameControllerDisconnectedWithService:(unsigned int)a3 registryEntryID:(unint64_t)a4
{
  int v9 = self;
  SEL v8 = a2;
  unsigned int v7 = a3;
  unint64_t v6 = a4;
  id CFProperty = (id)IORegistryEntryCreateCFProperty(a3, @"Product", kCFAllocatorDefault, 0);
  id v5 = CFProperty;
  os_log_t oslog = (os_log_t)sub_10001B96C();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100014970((uint64_t)v11, (uint64_t)v5, v6);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Handling disconnected game controller. name=%@, registryEntryID=%llu",  v11,  0x16u);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVPeripheralAgentService presentGameControllerDisconnectedNotificationWithName:]( v9,  "presentGameControllerDisconnectedNotificationWithName:",  v5);
  objc_storeStrong(&v5, 0LL);
}

- (BOOL)_isDeviceConnectedWithRegistryEntryID:(unint64_t)a3
{
  int v16 = self;
  SEL v15 = a2;
  unint64_t v14 = a3;
  char v13 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = v16->ioNotifiers;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v17,  16LL);
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v7);
      id v3 = [v12 regID];
      if (v3 == (id)v14) {
        break;
      }
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v17,  16LL);
        if (!v8) {
          goto LABEL_9;
        }
      }
    }

    char v13 = 1;
  }

- (void)dealloc
{
  uint64_t v6 = self;
  SEL v5 = a2;
  -[TVPAMetricsReporter invalidate](self->_metricsReporter, "invalidate");
  -[TVPARemoteFlagsController invalidate](v6->_remoteFlagsController, "invalidate");
  if (v6->_remoteClickpadModeNotifyTokenIsValid)
  {
    notify_cancel(v6->_remoteClickpadModeNotifyToken);
    v6->_remoteClickpadModeNotifyTokenIsValid = 0;
    id v3 = +[NSUserDefaults tvps_userDefaults](&OBJC_CLASS___NSUserDefaults, "tvps_userDefaults");
    [v3 removeObserver:v6 forKeyPath:TVPeripheralServicesUserDefaultsKeyRemoteClickpadMode context:off_100040200];
  }

  if (v6->_remoteTypeNotifyTokenIsValid)
  {
    notify_cancel(v6->_remoteTypeNotifyToken);
    v6->_remoteTypeNotifyTokenIsValid = 0;
  }

  if (v6->_proximityNotifyTokenIsValid)
  {
    notify_cancel(v6->_proximityNotifyToken);
    v6->_proximityNotifyTokenIsValid = 0;
  }

  if (v6->_setupFinishedNotifyTokenIsValid)
  {
    notify_cancel(v6->_setupFinishedNotifyToken);
    v6->_setupFinishedNotifyTokenIsValid = 0;
  }

  if (v6->_mfiAuthNotifyTokenIsValid)
  {
    notify_cancel(v6->_mfiAuthNotifyToken);
    v6->_mfiAuthNotifyTokenIsValid = 0;
  }

  if (v6->_externalDeviceHIDManager) {
    CFRelease(v6->_externalDeviceHIDManager);
  }
  if (v6->ioPort)
  {
    IONotificationPortDestroy(v6->ioPort);
    v6->ioPort = 0LL;
  }

  if (v6->ioIterator)
  {
    IOObjectRelease(v6->ioIterator);
    v6->ioIterator = 0;
  }

  if (v6->ioNotifiers)
  {
    -[NSMutableSet removeAllObjects](v6->ioNotifiers, "removeAllObjects");
    objc_storeStrong((id *)&v6->ioNotifiers, 0LL);
  }

  if (v6->gcPowerSourceRegistryIDs)
  {
    notify_cancel(v6->_accessoryAttachToken);
    v6->_accessoryTimeRemainingToken = -1;
    notify_cancel(v6->_accessoryTimeRemainingToken);
    v6->_accessoryAttachToken = -1;
    CFDictionaryRemoveAllValues(v6->gcPowerSourceRegistryIDs);
    CFRelease(v6->gcPowerSourceRegistryIDs);
    v6->gcPowerSourceRegistryIDs = 0LL;
  }

  -[FBSDisplayLayoutMonitor invalidate](v6->_displayLayoutMonitor, "invalidate");
  uint64_t v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v6);

  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___TVPeripheralAgentService;
  -[TVPeripheralAgentService dealloc](&v4, "dealloc");
}

- (void)start
{
  v77 = self;
  v76[1] = (id)a2;
  v76[0] = [[PBSMigration alloc] initWithName:@"Connected Peripherals Preferences" handler:&stru_100038E68];
  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v76[0]);
  id v75 = [[PBSMigration alloc] initWithName:@"TVPeripheralServices Preferences" handler:&stru_100038E88];
  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v75);
  +[PBSMigrator performMigrationIfNeeded](&OBJC_CLASS___PBSMigrator, "performMigrationIfNeeded");
  +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___TVPABluetoothRemoteDiscoveryHelper);
  bluetoothRemoteDiscoveryHelper = v77->_bluetoothRemoteDiscoveryHelper;
  v77->_bluetoothRemoteDiscoveryHelper = v2;

  objc_super v4 = objc_alloc_init(&OBJC_CLASS___TVPAPeripheralHUDSuppressionDataStore);
  hudSuppressionDataStore = v77->_hudSuppressionDataStore;
  v77->_hudSuppressionDataStore = v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_10001FB0C,  @"com.apple.language.changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  id v74 = BYSetupAssistantFinishedDarwinNotification;
  name = (char *)[v74 UTF8String];
  char v30 = v77;
  queue = &_dispatch_main_q;
  v67 = _NSConcreteStackBlock;
  int v68 = -1073741824;
  int v69 = 0;
  v70 = sub_10001FBAC;
  v71 = &unk_100038938;
  v72 = v77;
  uint32_t v33 = notify_register_dispatch(name, &v30->_setupFinishedNotifyToken, queue, &v67);

  uint32_t v73 = v33;
  v77->_setupFinishedNotifyTokenIsValid = v33 == 0;
  os_log_t v34 = v77;
  CFTypeRef v35 = &_dispatch_main_q;
  v60 = _NSConcreteStackBlock;
  int v61 = -1073741824;
  int v62 = 0;
  v63 = sub_100020074;
  v64 = &unk_100038938;
  v65 = v77;
  uint32_t v36 = notify_register_dispatch( "com.apple.PineBoard.DidReceivePeripheralPairingRequest",  &v34->_proximityNotifyToken,  v35,  &v60);

  uint32_t v66 = v36;
  v77->_proximityNotifyTokenIsValid = v36 == 0;
  v37 = v77;
  v38 = &_dispatch_main_q;
  v53 = _NSConcreteStackBlock;
  int v54 = -1073741824;
  int v55 = 0;
  v56 = sub_100020548;
  v57 = &unk_100038938;
  v58 = v77;
  uint32_t v39 = notify_register_dispatch( "com.apple.MobileBluetooth.MFiAuthenticationDidFail",  &v37->_mfiAuthNotifyToken,  v38,  &v53);

  uint32_t v59 = v39;
  v77->_mfiAuthNotifyTokenIsValid = v39 == 0;
  id v52 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  [v52 addObserver:v77 selector:"_bluetoothRemoteDidConnectNotification:" name:TVSBluetoothRemoteDidConnectNotification object:0];
  [v52 addObserver:v77 selector:"_bluetoothRemoteDidDisconnectNotification:" name:TVSBluetoothRemoteDidDisconnectNotification object:0];
  [v52 addObserver:v77 selector:"_bluetoothRemoteBatteryLevelChanged:" name:TVSBluetoothRemotePowerSourceInfoDidChangeNotification object:0];
  [v52 addObserver:v77 selector:"_bluetoothRemotePowerSourceLimitedSourceNotification:" name:TVSBluetoothRemotePowerSourceLimitedSourceDidChangeNotification object:0];
  [v52 addObserver:v77 selector:"_bluetoothRemoteDidDetectUserPresenceNotification:" name:TVSBluetoothRemotePresenceDidChangeNotification object:0];
  [v52 addObserver:v77 selector:"_enforcementAgentWillDisconnectDeviceNotification:" name:@"TVPAEnforcementAgentWillDisconnectDevice" object:v77->_deviceEnforcementAgent];
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___TVPAMetricsReporter);
  metricsReporter = v77->_metricsReporter;
  v77->_metricsReporter = v7;

  -[TVPAMetricsReporter activate](v77->_metricsReporter, "activate");
  +[TVSBluetoothRemoteUtilities startConnectionMonitoring]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "startConnectionMonitoring");
  +[TVSBluetoothRemoteUtilities startListeningForPowerSources]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "startListeningForPowerSources");
  if ((_os_feature_enabled_impl("PineBoard", "RemoteLowBatteryAlerts") & 1) != 0)
  {
    unint64_t v46 = _NSConcreteStackBlock;
    int v47 = -1073741824;
    int v48 = 0;
    CFDictionaryRef v49 = sub_10002064C;
    v50 = &unk_100038EF0;
    CFArrayRef v51 = v77;
    +[PBSSystemStatus addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:]( &OBJC_CLASS___PBSSystemStatus,  "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:",  @"systemAttentionState",  1LL,  1LL,  &v46);
    id v40 = _NSConcreteStackBlock;
    int v41 = -1073741824;
    int v42 = 0;
    v43 = sub_1000206F4;
    v44 = &unk_100038EF0;
    v45 = v77;
    +[PBSSystemStatus addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:]( &OBJC_CLASS___PBSSystemStatus,  "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:",  @"systemDisplayState",  1LL,  1LL,  &v40);
    objc_storeStrong((id *)&v45, 0LL);
    objc_storeStrong((id *)&v51, 0LL);
  }

  -[TVPeripheralAgentService _initializeRemoteClickpadModeDidChangeDarwinNotifyToken]( v77,  "_initializeRemoteClickpadModeDidChangeDarwinNotifyToken");
  if ((_os_feature_enabled_impl("PineBoard", "PressToDictate") & 1) != 0)
  {
    int v9 = objc_alloc_init(&OBJC_CLASS___TVPARemoteFlagsController);
    remoteFlagsController = v77->_remoteFlagsController;
    v77->_remoteFlagsController = v9;

    -[TVPARemoteFlagsController update](v77->_remoteFlagsController, "update");
  }

  else
  {
    -[TVPeripheralAgentService _postRemoteTypeDidChangeDarwinNotificationIfNeeded]( v77,  "_postRemoteTypeDidChangeDarwinNotificationIfNeeded");
  }

  v27 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  -[TVSBluetoothManager setDelegate:](v27, "setDelegate:", v77);

  id v28 =  +[TVSPreferences sharedAppleTVServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedAppleTVServicesPreferences");
  unsigned __int8 v29 = [v28 BOOLForKey:@"BTAllowUnlimitedConnections" defaultValue:0];

  if ((v29 & 1) == 0)
  {
    id v24 = v77;
    os_log_type_t v25 = objc_opt_new(&OBJC_CLASS___TVPADeviceEnforcementAgent);
    -[TVPeripheralAgentService setDeviceEnforcementAgent:](v24, "setDeviceEnforcementAgent:");

    id v26 = -[TVPeripheralAgentService deviceEnforcementAgent](v77, "deviceEnforcementAgent");
    -[TVPADeviceEnforcementAgent startEnforcing](v26, "startEnforcing");

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    v77->startTime = v11;
  }

  -[TVPeripheralAgentService _setupNotificationForExternalDeviceConnectionAndBatteryLevel]( v77,  "_setupNotificationForExternalDeviceConnectionAndBatteryLevel");
  id v12 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.tvperipheralagent.xpc");
  listener = v77->_listener;
  v77->_listener = v12;

  os_log_type_t v21 = v77->_listener;
  id v22 = &_dispatch_main_q;
  -[NSXPCListener _setQueue:](v21, "_setQueue:");

  -[NSXPCListener setDelegate:](v77->_listener, "setDelegate:", v77);
  -[NSXPCListener resume](v77->_listener, "resume");
  id v23 =  +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor]( &OBJC_CLASS___FBSDisplayLayoutMonitorConfiguration,  "configurationForDefaultMainDisplayMonitor");
  unint64_t v14 =  +[FBSDisplayLayoutMonitor monitorWithConfiguration:]( &OBJC_CLASS___FBSDisplayLayoutMonitor,  "monitorWithConfiguration:");
  displayLayoutMonitor = v77->_displayLayoutMonitor;
  v77->_displayLayoutMonitor = v14;

  id v16 = +[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance");
  int v17 = (NSMutableSet *)+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  connectedAudioDevices = v77->_connectedAudioDevices;
  v77->_connectedAudioDevices = v17;

  id v19 = objc_alloc_init(&OBJC_CLASS___PBSHeadphoneBannerManager);
  headphoneBannerManager = v77->_headphoneBannerManager;
  v77->_headphoneBannerManager = v19;

  objc_storeStrong(&v52, 0LL);
  objc_storeStrong((id *)&v58, 0LL);
  objc_storeStrong((id *)&v65, 0LL);
  objc_storeStrong((id *)&v72, 0LL);
  objc_storeStrong(&v74, 0LL);
  objc_storeStrong(&v75, 0LL);
  objc_storeStrong(v76, 0LL);
}

- (BOOL)shouldConnectToAudioDevice
{
  return -[TVPADeviceEnforcementAgent shouldConnectToAudioDevice]( self->_deviceEnforcementAgent,  "shouldConnectToAudioDevice",  a2,  self);
}

- (void)beginSuppressingPeripheralHUDWithOptions:(unint64_t)a3 forClientBundleIdentifier:(id)a4
{
  id v8 = self;
  SEL v7 = a2;
  unint64_t v6 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  objc_super v4 = -[TVPeripheralAgentService hudSuppressionDataStore](v8, "hudSuppressionDataStore");
  -[TVPAPeripheralHUDSuppressionDataStore beginSuppressingWithOptions:forClientBundleIdentifier:]( v4,  "beginSuppressingWithOptions:forClientBundleIdentifier:",  v6,  location);

  objc_storeStrong(&location, 0LL);
}

- (void)endSuppressingPeripheralHUDWithOptions:(unint64_t)a3 forClientBundleIdentifier:(id)a4
{
  id v8 = self;
  SEL v7 = a2;
  unint64_t v6 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  objc_super v4 = -[TVPeripheralAgentService hudSuppressionDataStore](v8, "hudSuppressionDataStore");
  -[TVPAPeripheralHUDSuppressionDataStore endSuppressingWithOptions:forClientBundleIdentifier:]( v4,  "endSuppressingWithOptions:forClientBundleIdentifier:",  v6,  location);

  objc_storeStrong(&location, 0LL);
}

- (BOOL)_couldRequireProximityPairingWorkaround
{
  id v3 = +[TVSDevice productType](&OBJC_CLASS___TVSDevice, "productType");
  unsigned __int8 v4 = [v3 hasPrefix:@"AppleTV5,"];

  return v4 & 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  SEL v7 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v7);

  unsigned __int8 v4 = objc_alloc(&OBJC_CLASS___TVPAAgentConnection);
  id v8 = -[TVPAAgentConnection initWithConnection:](v4, "initWithConnection:", v9);
  -[TVPAAgentConnection resume](v8, "resume");
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return 1;
}

- (void)bluetoothManager:(id)a3 didCompleteDeviceConnection:(id)a4 error:(id)a5
{
  uint32_t v39 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v37 = 0LL;
  objc_storeStrong(&v37, a4);
  id v36 = 0LL;
  objc_storeStrong(&v36, a5);
  id v35 = sub_10001B96C();
  os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v35;
    os_log_type_t type = v34;
    id v18 = [v37 identifier];
    id v33 = v18;
    sub_100013988((uint64_t)v41, (uint64_t)v33);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Completed connection to device: %@", v41, 0xCu);

    objc_storeStrong(&v33, 0LL);
  }

  objc_storeStrong(&v35, 0LL);
  if (v37)
  {
    char v28 = 1;
    if ([v37 type] == (id)3)
    {
      char v28 = 0;
      char v26 = 0;
      LOBYTE(v13) = 0;
      if (!v36)
      {
        connectedAudioDevices = v39->_connectedAudioDevices;
        id v27 = [v37 identifier];
        char v26 = 1;
        unsigned int v13 = -[NSMutableSet containsObject:](connectedAudioDevices, "containsObject:") ^ 1;
      }

      if ((v26 & 1) != 0) {

      }
      if ((v13 & 1) != 0)
      {
        char v28 = 1;
        id v25 = sub_10001B96C();
        os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = (os_log_s *)v25;
          os_log_type_t v10 = v24;
          id v11 = [v37 identifier];
          id v23 = v11;
          sub_100013988((uint64_t)v40, (uint64_t)v23);
          _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "Presenting audio device connected notification for device: %@",  v40,  0xCu);

          objc_storeStrong(&v23, 0LL);
        }

        objc_storeStrong(&v25, 0LL);
        SEL v7 = v39->_connectedAudioDevices;
        id v8 = [v37 identifier];
        -[NSMutableSet addObject:](v7, "addObject:");

        -[TVPeripheralAgentService presentAudioDeviceConnectedNotificationWithDevice:]( v39,  "presentAudioDeviceConnectedNotificationWithDevice:",  v37);
      }
    }

    char v21 = 0;
    char v6 = 0;
    if ((v28 & 1) != 0)
    {
      id v22 = -[TVPeripheralAgentService deviceEnforcementAgent](v39, "deviceEnforcementAgent");
      char v21 = 1;
      char v6 = objc_opt_respondsToSelector();
    }

    if ((v21 & 1) != 0) {

    }
    if ((v6 & 1) != 0)
    {
      SEL v5 = -[TVPeripheralAgentService deviceEnforcementAgent](v39, "deviceEnforcementAgent");
      -[TVPADeviceEnforcementAgent bluetoothManager:didCompleteDeviceConnection:error:]( v5,  "bluetoothManager:didCompleteDeviceConnection:error:",  location[0],  v37,  v36);
    }

    int v29 = 0;
  }

  else
  {
    id v32 = sub_10001B96C();
    char v31 = 16;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      unint64_t v14 = (os_log_s *)v32;
      os_log_type_t v15 = v31;
      sub_100009998(v30);
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  v15,  "Received nil device in connection completed. Bailing early.",  v30,  2u);
    }

    objc_storeStrong(&v32, 0LL);
    int v29 = 1;
  }

  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bluetoothManager:(id)a3 didCompleteDeviceDisconnection:(id)a4 error:(id)a5
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  id v12 = -[TVPeripheralAgentService deviceEnforcementAgent](v19, "deviceEnforcementAgent");
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    id v9 = -[TVPeripheralAgentService deviceEnforcementAgent](v19, "deviceEnforcementAgent");
    -[TVPADeviceEnforcementAgent bluetoothManager:didCompleteDeviceDisconnection:error:]( v9,  "bluetoothManager:didCompleteDeviceDisconnection:error:",  location[0],  v17,  v16);
  }

  if (!v16)
  {
    char v14 = 0;
    unsigned __int8 v8 = 0;
    if ([v17 type] == (id)3)
    {
      connectedAudioDevices = v19->_connectedAudioDevices;
      id v15 = [v17 identifier];
      char v14 = 1;
      unsigned __int8 v8 = -[NSMutableSet containsObject:](connectedAudioDevices, "containsObject:");
    }

    if ((v14 & 1) != 0) {

    }
    if ((v8 & 1) != 0)
    {
      SEL v5 = v19->_connectedAudioDevices;
      id v6 = [v17 identifier];
      -[NSMutableSet removeObject:](v5, "removeObject:");

      -[TVPeripheralAgentService presentAudioDeviceDisconnectedNotificationWithDevice:]( v19,  "presentAudioDeviceDisconnectedNotificationWithDevice:",  v17);
    }

    else if ([v17 type] == (id)1)
    {
      -[TVPAMetricsReporter reportRemote:didDisconnectWithError:]( v19->_metricsReporter,  "reportRemote:didDisconnectWithError:",  v17,  v16);
    }
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pairingAgentDidPairRemote:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = sub_10001B96C();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v7;
    os_log_type_t type = v6;
    sub_100009998(v5);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Pairing agent has reported a paired remote. Will dismiss pairing agent.",  v5,  2u);
  }

  objc_storeStrong(&v7, 0LL);
  -[TVPeripheralAgentService _dismissPairingAgent](v9, "_dismissPairingAgent");
  objc_storeStrong(location, 0LL);
}

- (void)pairingAgentDidTimeout:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = sub_10001B96C();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v7;
    os_log_type_t type = v6;
    sub_100009998(v5);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Pairing agent has reported a timeout. Will dismiss pairing agent.",  v5,  2u);
  }

  objc_storeStrong(&v7, 0LL);
  -[TVPeripheralAgentService _dismissPairingAgent](v9, "_dismissPairingAgent");
  objc_storeStrong(location, 0LL);
}

- (void)_dismissPairingAgent
{
  char v28 = self;
  location[1] = (id)a2;
  location[0] = sub_10001B96C();
  os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t v18 = v26;
    sub_100009998(v25);
    _os_log_impl((void *)&_mh_execute_header, log, v18, "Dismissing pairing agent", v25, 2u);
  }

  objc_storeStrong(location, 0LL);
  id v15 = -[TVPeripheralAgentService bluetoothRemoteDiscoveryHelper](v28, "bluetoothRemoteDiscoveryHelper");
  -[TVPABluetoothRemoteDiscoveryHelper stop](v15, "stop");

  id v16 = -[TVPeripheralAgentService bulletin](v28, "bulletin");
  if (v16)
  {
    id v24 = sub_10001B96C();
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (os_log_s *)v24;
      os_log_type_t type = v23;
      char v14 = -[TVPeripheralAgentService bulletin](v28, "bulletin");
      id v22 = v14;
      sub_10000822C((uint64_t)v30, (uint64_t)v22);
      _os_log_impl((void *)&_mh_execute_header, v12, type, "Dismissing bulletin: %{public}@", v30, 0xCu);

      objc_storeStrong((id *)&v22, 0LL);
    }

    objc_storeStrong(&v24, 0LL);
    id v11 = -[TVPeripheralAgentService bulletinService](v28, "bulletinService");
    os_log_type_t v10 = -[TVPeripheralAgentService bulletin](v28, "bulletin");
    -[PBSBulletinService dismissBulletin:](v11, "dismissBulletin:");
  }

  unsigned __int8 v8 = -[TVPeripheralAgentService bluetoothRemotePairingAgent](v28, "bluetoothRemotePairingAgent");
  -[TVPABluetoothRemotePairingAgent stopPairing](v8, "stopPairing");

  id v9 = -[TVPeripheralAgentService bluetoothRemotePairingAgent](v28, "bluetoothRemotePairingAgent");
  -[TVPABluetoothRemotePairingAgent setDelegate:](v9, "setDelegate:");

  -[TVPeripheralAgentService setBluetoothRemotePairingAgent:](v28, "setBluetoothRemotePairingAgent:", 0LL);
  if (-[TVPeripheralAgentService isSuppressingDisconnectHUDDuringProximityPairing]( v28,  "isSuppressingDisconnectHUDDuringProximityPairing"))
  {
    id v7 = -[TVPeripheralAgentService hudSuppressionDataStore](v28, "hudSuppressionDataStore");
    os_log_type_t v6 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    SEL v5 = -[NSBundle bundleIdentifier](v6, "bundleIdentifier");
    -[TVPAPeripheralHUDSuppressionDataStore endSuppressingWithOptions:forClientBundleIdentifier:]( v7,  "endSuppressingWithOptions:forClientBundleIdentifier:",  2LL);

    -[TVPeripheralAgentService setSuppressingDisconnectHUDDuringProximityPairing:]( v28,  "setSuppressingDisconnectHUDDuringProximityPairing:",  0LL);
    id v21 = sub_10001B96C();
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = (os_log_s *)v21;
      os_log_type_t v3 = v20;
      unsigned __int8 v4 = -[TVPeripheralAgentService hudSuppressionDataStore](v28, "hudSuppressionDataStore");
      id v19 = v4;
      sub_10000822C((uint64_t)v29, (uint64_t)v19);
      _os_log_impl( (void *)&_mh_execute_header,  v2,  v3,  "Disconnect HUD suppression for proximity pairing has been released. HUDSuppressionDataStore=%{public}@",  v29,  0xCu);

      objc_storeStrong((id *)&v19, 0LL);
    }

    objc_storeStrong(&v21, 0LL);
  }

- (void)_bluetoothRemoteDidConnectNotification:(id)a3
{
  id v84 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v46 = [location[0] userInfo];
  id v82 = [v46 objectForKey:TVSBluetoothRemoteUserInfoRemoteObject];

  if (v82)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v77 = v3;
    [v82 lastDisconnectTime];
    uint64_t v76 = v4;
    os_log_t v75 = (os_log_t)sub_10001B96C();
    os_log_type_t v74 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = v75;
      os_log_type_t v42 = v74;
      id v43 = [v82 name];
      id v73 = v43;
      sub_100022200((uint64_t)v91, (uint64_t)v73, v77, v76, COERCE__INT64(*(double *)&v77 - *(double *)&v76));
      _os_log_impl( (void *)&_mh_execute_header,  v41,  v42,  "BTRemoteUtils: Handling TVSBluetoothRemoteDidConnectNotification. %{public}@ connected (%f - %f) = %f",  v91,  0x2Au);

      objc_storeStrong(&v73, 0LL);
    }

    objc_storeStrong((id *)&v75, 0LL);
    id v37 = [v82 identifier];
    id v35 = [v82 remoteType];
    id v36 = [v82 firmwareVersion];
    TVSRememberConnectedRemote(v37, v35);

    id v72 =  +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote");
    id v39 = [v72 identifier];
    id v38 = [v82 identifier];
    unsigned __int8 v40 = objc_msgSend(v39, "isEqualToString:");

    if ((v40 & 1) != 0)
    {
      char v68 = 0;
      memset(__b, 0, sizeof(__b));
      int v29 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
      id obj = -[TVSBluetoothManager pairedDevices](v29, "pairedDevices");

      id v31 = [obj countByEnumeratingWithState:__b objects:v89 count:16];
      if (v31)
      {
        uint64_t v26 = *(void *)__b[2];
        uint64_t v27 = 0LL;
        id v28 = v31;
        while (1)
        {
          uint64_t v25 = v27;
          if (*(void *)__b[2] != v26) {
            objc_enumerationMutation(obj);
          }
          id v67 = *(id *)(__b[1] + 8 * v27);
          if ([v67 type] == (id)1)
          {
            id v23 = [v67 name];
            id v22 = [v82 name];
            BOOL v24 = (objc_msgSend(v23, "isEqual:") & 1) != 0;

            if (!v24)
            {
              os_log_t v65 = (os_log_t)sub_10001B96C();
              os_log_type_t v64 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = v65;
                os_log_type_t v20 = v64;
                id v21 = [v67 name];
                id v63 = v21;
                sub_10000822C((uint64_t)v88, (uint64_t)v63);
                _os_log_impl((void *)&_mh_execute_header, v19, v20, "BTRemoteUtils: unpairing %{public}@", v88, 0xCu);

                objc_storeStrong(&v63, 0LL);
              }

              objc_storeStrong((id *)&v65, 0LL);
              [v67 unpairWithCompletion:0];
              char v68 = 1;
            }
          }

          ++v27;
          if (v25 + 1 >= (unint64_t)v28)
          {
            uint64_t v27 = 0LL;
            id v28 = [obj countByEnumeratingWithState:__b objects:v89 count:16];
            if (!v28) {
              break;
            }
          }
        }
      }

      if ((_os_feature_enabled_impl("PineBoard", "PressToDictate") & 1) != 0) {
        [*((id *)v84 + 14) update];
      }
      else {
        [v84 _postRemoteTypeDidChangeDarwinNotificationIfNeeded];
      }
      id v17 = [v84 hudSuppressionDataStore];
      unsigned __int8 v18 = [v17 isHUDSuppressedForOption:1];

      if ((v18 & 1) != 0)
      {
        os_log_t v62 = (os_log_t)sub_10001B96C();
        os_log_type_t v61 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          char v13 = v62;
          os_log_type_t v14 = v61;
          id v16 = [v82 name];
          id v12 = v16;
          id v60 = v12;
          id v15 = [v84 hudSuppressionDataStore];
          id v59 = v15;
          sub_10001E758((uint64_t)v87, (uint64_t)v12, (uint64_t)v59);
          _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "BTRemoteUtils: Remote connection HUD notifications are being suppressed so no connected HUD will be displaye d for %{public}@. HUDSuppressionDataStore=%{public}@",  v87,  0x16u);

          objc_storeStrong(&v59, 0LL);
          objc_storeStrong(&v60, 0LL);
        }

        objc_storeStrong((id *)&v62, 0LL);
        int v78 = 1;
      }

      else
      {
        if ((v68 & 1) != 0
          || (double v11 = *((double *)v84 + 12), [v82 lastDisconnectTime], (sub_10001C328(v11, v5) & 1) != 0))
        {
          dispatch_time_t when = dispatch_time(0LL, 30000000000LL);
          queue = &_dispatch_main_q;
          id v52 = _NSConcreteStackBlock;
          int v53 = -1073741824;
          int v54 = 0;
          int v55 = sub_10002227C;
          v56 = &unk_100038F18;
          id v57 = v84;
          id v58 = v82;
          dispatch_after(when, queue, &v52);

          os_log_t v51 = (os_log_t)sub_10001B96C();
          os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            sub_10000822C((uint64_t)v86, (uint64_t)v82);
            _os_log_impl((void *)&_mh_execute_header, v51, v50, "BTRemoteUtils: Showing HUD for %{public}@.", v86, 0xCu);
          }

          objc_storeStrong((id *)&v51, 0LL);
          [v84 presentRemoteConnectedNotification:v82];
          objc_storeStrong(&v58, 0LL);
          objc_storeStrong(&v57, 0LL);
        }

        else
        {
          os_log_t v49 = (os_log_t)sub_10001B96C();
          os_log_type_t v48 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            os_log_type_t v6 = v49;
            os_log_type_t v7 = v48;
            id v8 = [v82 name];
            id v47 = v8;
            sub_100022200((uint64_t)v85, (uint64_t)v47, *((void *)v84 + 12), v77, v76);
            _os_log_error_impl( (void *)&_mh_execute_header,  v6,  v7,  "BTRemoteUtils: %{public}@ connected too soon. Not showing HUD. PA Start time = %f, Current time = %f and L ast remote connected time = %f",  v85,  0x2Au);

            objc_storeStrong(&v47, 0LL);
          }

          objc_storeStrong((id *)&v49, 0LL);
        }

        int v78 = 0;
      }
    }

    else
    {
      os_log_t v71 = (os_log_t)sub_10001B96C();
      os_log_type_t v70 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = v71;
        os_log_type_t v33 = v70;
        id v34 = [v72 name];
        id v69 = v34;
        sub_10000822C((uint64_t)v90, (uint64_t)v69);
        _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "BTRemoteUtils: The remote which connected is not the most recently connected remote. Ignoring. Most recently c onnected remote = %{public}@",  v90,  0xCu);

        objc_storeStrong(&v69, 0LL);
      }

      objc_storeStrong((id *)&v71, 0LL);
      int v78 = 1;
    }

    objc_storeStrong(&v72, 0LL);
  }

  else
  {
    os_log_t oslog = (os_log_t)sub_10001B96C();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v45 = type;
      sub_100009998(v79);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v45,  "BTRemoteUtils: Handling TVSBluetoothRemoteDidConnectNotification but no remote object was found in the userInfo",  v79,  2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    int v78 = 1;
  }

  objc_storeStrong(&v82, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_postRemoteTypeDidChangeDarwinNotificationIfNeeded
{
  id v32 = self;
  v31[1] = (id)a2;
  v31[0] =  +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote");
  if (!v31[0])
  {
    int v30 = 1;
    goto LABEL_27;
  }

  if (!v32->_remoteTypeNotifyTokenIsValid)
  {
    uint32_t state = notify_register_check("com.apple.TVPeripheralAgent.RemoteTypeDidChange", &v32->_remoteTypeNotifyToken);
    if (state)
    {
      id location = sub_10001B96C();
      os_log_type_t v27 = OS_LOG_TYPE_FAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_FAULT))
      {
        sub_1000139C8((uint64_t)v38, state);
        _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v27,  "Unable to create register token for RemoteTypeDidChangeDarwinNotificationName. err=%u",  v38,  8u);
      }

      objc_storeStrong(&location, 0LL);
      int v30 = 1;
      goto LABEL_27;
    }

    v32->_remoteTypeNotifyTokenIsValid = 1;
  }

  uint32_t state = notify_get_state(v32->_remoteTypeNotifyToken, &state64);
  if (state)
  {
    id v25 = sub_10001B96C();
    os_log_type_t v24 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_FAULT))
    {
      sub_1000139C8((uint64_t)v37, state);
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  v24,  "Unable to get current state for RemoteTypeDidChangeDarwinNotificationName. err=%u",  v37,  8u);
    }

    objc_storeStrong(&v25, 0LL);
    int v30 = 1;
    goto LABEL_27;
  }

  uint64_t v23 = state64;
  id v10 =  +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote");
  id v11 = [v10 remoteType];

  id v22 = v11;
  id v21 = sub_10001B96C();
  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    os_log_type_t v6 = (os_log_s *)v21;
    os_log_type_t v7 = v20;
    id v9 = (id)TVSBluetoothRemoteTypeLogString(v22);
    id v5 = v9;
    id v19 = v5;
    id v8 = (id)TVSBluetoothRemoteTypeLogString(v23);
    id v18 = v8;
    sub_10001E758((uint64_t)v36, (uint64_t)v5, (uint64_t)v18);
    _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "Checking remote types to determine if RemoteTypeDidChangeDarwinNotificationName should be sent: currentRemoteType= %{public}@, previousRemoteType=%{public}@",  v36,  0x16u);

    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(&v19, 0LL);
  }

  objc_storeStrong(&v21, 0LL);
  if ((id)v23 == v22)
  {
LABEL_26:
    int v30 = 0;
    goto LABEL_27;
  }

  uint32_t state = notify_set_state(v32->_remoteTypeNotifyToken, (uint64_t)v22);
  if (!state)
  {
    os_log_t oslog = (os_log_t)sub_10001B96C();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = oslog;
      os_log_type_t v3 = v14;
      id v4 = (id)TVSBluetoothRemoteTypeLogString(v22);
      id v13 = v4;
      sub_10000822C((uint64_t)v34, (uint64_t)v13);
      _os_log_impl( (void *)&_mh_execute_header,  v2,  v3,  "Posting RemoteTypeDidChangeDarwinNotificationName. deviceType=%{public}@",  v34,  0xCu);

      objc_storeStrong(&v13, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    notify_post("com.apple.TVPeripheralAgent.RemoteTypeDidChange");
    if (state)
    {
      os_log_t v12 = (os_log_t)sub_10001B96C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        sub_1000139C8((uint64_t)v33, state);
        _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "Unable to post RemoteTypeDidChangeDarwinNotificationName. err=%u",  v33,  8u);
      }

      objc_storeStrong((id *)&v12, 0LL);
    }

    goto LABEL_26;
  }

  id v17 = sub_10001B96C();
  os_log_type_t v16 = OS_LOG_TYPE_FAULT;
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_FAULT))
  {
    sub_1000139C8((uint64_t)v35, state);
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  v16,  "Unable to set current state for RemoteTypeDidChangeDarwinNotificationName. err=%u",  v35,  8u);
  }

  objc_storeStrong(&v17, 0LL);
  int v30 = 1;
LABEL_27:
  objc_storeStrong(v31, 0LL);
}

- (void)_bluetoothRemoteDidDisconnectNotification:(id)a3
{
  int v41 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v13);

  id v12 = [location[0] userInfo];
  id v39 = [v12 objectForKey:TVSBluetoothRemoteUserInfoRemoteObject];

  id v38 = sub_10001B96C();
  os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v39 name];
    id v36 = v11;
    sub_10000822C((uint64_t)v43, (uint64_t)v36);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v38,  v37,  "BTRemoteUtils: Remote %{public}@ Disconnected",  v43,  0xCu);

    objc_storeStrong(&v36, 0LL);
  }

  objc_storeStrong(&v38, 0LL);
  id v9 = -[TVPeripheralAgentService hudSuppressionDataStore](v41, "hudSuppressionDataStore");
  unsigned __int8 v10 = -[TVPAPeripheralHUDSuppressionDataStore isHUDSuppressedForOption:](v9, "isHUDSuppressedForOption:", 2LL);

  if ((v10 & 1) != 0)
  {
    id v35 = sub_10001B96C();
    os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v39 name];
      id v33 = v8;
      os_log_type_t v7 = -[TVPeripheralAgentService hudSuppressionDataStore](v41, "hudSuppressionDataStore");
      id v32 = v7;
      sub_10001E758((uint64_t)v42, (uint64_t)v33, (uint64_t)v32);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v35,  v34,  "BTRemoteUtils: Remote disconnection HUD notifications are being suppressed so no disconnection HUD will be displ ayed for %{public}@. HUDSuppressionDataStore=%{public}@",  v42,  0x16u);

      objc_storeStrong(&v32, 0LL);
      objc_storeStrong(&v33, 0LL);
    }

    objc_storeStrong(&v35, 0LL);
    int v31 = 1;
  }

  else
  {
    v27[0] = 0LL;
    v27[1] = v27;
    int v28 = 0x20000000;
    int v29 = 32;
    char v30 = 0;
    os_log_type_t v6 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
    id v5 = -[TVSBluetoothManager pairedDevices](v6, "pairedDevices");
    id v21 = _NSConcreteStackBlock;
    int v22 = -1073741824;
    int v23 = 0;
    os_log_type_t v24 = sub_100022E8C;
    id v25 = &unk_100038F40;
    v26[0] = v39;
    v26[1] = v27;
    [v5 enumerateObjectsUsingBlock:&v21];

    dispatch_time_t when = dispatch_time(0LL, 15000000000LL);
    queue = &_dispatch_main_q;
    os_log_type_t v14 = _NSConcreteStackBlock;
    int v15 = -1073741824;
    int v16 = 0;
    id v17 = sub_100022F64;
    id v18 = &unk_100038F68;
    id v19 = v39;
    v20[1] = v27;
    v20[0] = v41;
    dispatch_after(when, queue, &v14);

    objc_storeStrong(v20, 0LL);
    objc_storeStrong(&v19, 0LL);
    objc_storeStrong(v26, 0LL);
    _Block_object_dispose(v27, 8);
    int v31 = 0;
  }

  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_bluetoothRemoteDidDetectUserPresenceNotification:(id)a3
{
  os_log_type_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] userInfo];
  id v4 = [v3 objectForKey:TVSBluetoothRemoteUserInfoRemoteObject];

  -[TVPeripheralAgentService _checkBatteryLevelForRemote:reason:](v6, "_checkBatteryLevelForRemote:reason:", v4, 4LL);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_batteryCheckReasonDescription:(int64_t)a3
{
  v5[3] = a1;
  v5[2] = (id)a2;
  v5[1] = (id)a3;
  v5[0] = 0LL;
  if ((unint64_t)a3 <= 4) {
    __asm { BR              X8 }
  }

  id v4 = v5[0];
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (void)_checkBatteryLevelForRemote:(id)a3 reason:(int64_t)a4
{
  v83 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v81 = a4;
  id v80 = sub_10001B96C();
  os_log_type_t v79 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v80;
    os_log_type_t type = v79;
    id v53 = [location[0] name];
    id v48 = v53;
    id v78 = v48;
    int v49 = [location[0] isConnected] & 1;
    id v4 = (void *)objc_opt_class(v83);
    id v52 = [v4 _batteryCheckReasonDescription:v81];
    id v77 = v52;
    sub_100023C18((uint64_t)v87, (uint64_t)v48, v49, (uint64_t)v77);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "BTRemoteUtils: Checking battery for remote. name=%{public}@, connected=%{BOOL}d, reason=%{public}@",  v87,  0x1Cu);

    objc_storeStrong(&v77, 0LL);
    objc_storeStrong(&v78, 0LL);
  }

  objc_storeStrong(&v80, 0LL);
  unint64_t v76 = 0LL;
  if (location[0] && ([location[0] isConnected] & 1) != 0)
  {
    id v42 =  +[TVSPreferences sharedPeripheralAgentPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPeripheralAgentPreferences");
    [v42 remoteTimeIntervalInSecondsSinceLastBatteryCheck];
    double v43 = v5;

    uint64_t v75 = *(void *)&v43;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v74 = v6;
    double v73 = v6 - v43;
    double v72 = 0.0;
    id v44 = [location[0] name];
    id v45 = +[TVSBluetoothRemoteUtilities batteryLevelForRemoteName:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "batteryLevelForRemoteName:");

    uint64_t v71 = (uint64_t)v45;
    id v46 = [location[0] name];
    unsigned __int8 v47 = +[TVSBluetoothRemoteUtilities chargingStateForRemoteName:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "chargingStateForRemoteName:");

    char v70 = v47 & 1;
    if ((uint64_t)v45 < 0 || (v70 & 1) != 0)
    {
      os_log_t v64 = (os_log_t)sub_10001B96C();
      os_log_type_t v63 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = v64;
        os_log_type_t v23 = v63;
        id v24 = [location[0] name];
        id v62 = v24;
        sub_100023D54((uint64_t)v85, (uint64_t)v62, v71);
        _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "BTRemoteUtils: Unknown battery level for remote: %{public}@. level=(%ld%%)",  v85,  0x16u);

        objc_storeStrong(&v62, 0LL);
      }

      objc_storeStrong((id *)&v64, 0LL);
    }

    else
    {
      if (v71 > 5)
      {
        if (v71 > 10)
        {
          if (v71 <= 20)
          {
            unint64_t v76 = 3LL;
            id v37 =  +[TVSPreferences sharedPeripheralAgentPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPeripheralAgentPreferences");
            [v37 remote20PercentBatteryCheckTimeIntervalInSeconds];
            double v72 = v11;
          }
        }

        else
        {
          unint64_t v76 = 4LL;
          id v38 =  +[TVSPreferences sharedPeripheralAgentPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPeripheralAgentPreferences");
          [v38 remote10PercentBatteryCheckTimeIntervalInSeconds];
          double v72 = v10;
        }
      }

      else
      {
        unint64_t v76 = 5LL;
        if ((_os_feature_enabled_impl("PineBoard", "RemoteLowBatteryAlerts") & 1) != 0)
        {
          if (v81)
          {
            id v40 =  +[TVSPreferences sharedPeripheralAgentPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPeripheralAgentPreferences");
            [v40 remoteCriticallyLowBatteryUserInitiatedCheckTimeIntervalInSeconds];
            double v72 = v8;
          }

          else
          {
            id v41 =  +[TVSPreferences sharedPeripheralAgentPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPeripheralAgentPreferences");
            [v41 remoteCriticallyLowBatteryCheckTimeIntervalInSeconds];
            double v72 = v7;
          }
        }

        else
        {
          id v39 =  +[TVSPreferences sharedPeripheralAgentPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPeripheralAgentPreferences");
          [v39 remoteCriticallyLowBatteryCheckTimeIntervalInSeconds];
          double v72 = v9;
        }
      }

      os_log_t oslog = (os_log_t)sub_10001B96C();
      os_log_type_t v68 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = oslog;
        os_log_type_t v33 = v68;
        id v36 = [location[0] name];
        id v25 = v36;
        id v67 = v25;
        uint64_t v26 = v71;
        int v27 = v70 & 1;
        id v35 = sub_1000053D0(v76);
        id v28 = v35;
        id v66 = v28;
        uint64_t v29 = v75;
        uint64_t v30 = *(void *)&v73;
        uint64_t v31 = *(void *)&v72;
        id v12 = (void *)objc_opt_class(v83);
        id v34 = [v12 _batteryCheckReasonDescription:v81];
        id v65 = v34;
        sub_100023C84((uint64_t)v86, (uint64_t)v25, v26, v27, (uint64_t)v28, v29, v30, v31, (uint64_t)v65);
        _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "BTRemoteUtils: Checked battery level for remote: %{public}@. level=%ld%%, charging=%{BOOL}d, HUDType=%{public} @, lastCheck=%.2f, lastCheckTimeElapsed=%.2f, checkTimeInterval=%.2f, reason=%{public}@",  v86,  0x4Eu);

        objc_storeStrong(&v65, 0LL);
        objc_storeStrong(&v66, 0LL);
        objc_storeStrong(&v67, 0LL);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }

    if (v76 && v73 > v72)
    {
      os_log_t v61 = (os_log_t)sub_10001B96C();
      os_log_type_t v60 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v61;
        os_log_type_t v19 = v60;
        id v21 = [location[0] name];
        id v16 = v21;
        id v59 = v16;
        uint64_t v17 = v71;
        id v20 = sub_1000053D0(v76);
        id v58 = v20;
        sub_100023DA4((uint64_t)v84, (uint64_t)v16, v17, (uint64_t)v58);
        _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "BTRemoteUtils: Showing battery HUD for remote: %{public}@, level=(%ld%%), HUDType=%{public}@",  v84,  0x20u);

        objc_storeStrong(&v58, 0LL);
        objc_storeStrong(&v59, 0LL);
      }

      objc_storeStrong((id *)&v61, 0LL);
      id v15 =  +[TVSPreferences sharedPeripheralAgentPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPeripheralAgentPreferences");
      [v15 setRemoteTimeIntervalInSecondsSinceLastBatteryCheck:v74];

      -[TVPeripheralAgentService presentPeripheralNotificationWithType:]( v83,  "presentPeripheralNotificationWithType:",  v76);
      -[TVPAMetricsReporter reportLowBatteryNotificationWithRemote:]( v83->_metricsReporter,  "reportLowBatteryNotificationWithRemote:",  location[0]);
    }
  }

  else
  {
    os_log_t v57 = (os_log_t)sub_10001B96C();
    os_log_type_t v56 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v57;
      os_log_type_t v14 = v56;
      sub_100009998(v55);
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "BTRemoteUtils: Unable to check battery. Remote is not available/connected",  v55,  2u);
    }

    objc_storeStrong((id *)&v57, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_bluetoothRemotePowerSourceLimitedSourceNotification:(id)a3
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] userInfo];
  id v4 = [v3 objectForKey:TVSBluetoothRemoteUserInfoRemoteObject];

  if ([v4 isCharging]) {
    -[TVPeripheralAgentService presentPeripheralNotificationWithType:]( v6,  "presentPeripheralNotificationWithType:",  6LL);
  }
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_bluetoothRemoteBatteryLevelChanged:(id)a3
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] userInfo];
  id v4 = [v3 objectForKey:TVSBluetoothRemoteUserInfoRemoteObject];

  -[TVPeripheralAgentService _checkBatteryLevelForRemote:reason:](v6, "_checkBatteryLevelForRemote:reason:", v4, 0LL);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_enforcementAgentWillDisconnectDeviceNotification:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  AnalyticsSendEventLazy(@"com.apple.appletv.bluetooth", &stru_100038F88);
  objc_storeStrong(location, 0LL);
}

- (void)_setupNotificationForExternalDeviceConnectionAndBatteryLevel
{
  kern_return_t v38;
  SEL v39;
  TVPeripheralAgentService *v40;
  uint8_t v41[8];
  id v40 = self;
  id v39 = a2;
  id v38 = -536870212;
  self->_accessoryAttachToken = -1;
  v40->_accessoryTimeRemainingToken = -1;
  id v16 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  ioNotifiers = v40->ioNotifiers;
  v40->ioNotifiers = v16;

  if (v40->ioPort)
  {
    IONotificationPortDestroy(v40->ioPort);
    v40->ioPort = 0LL;
  }

  v40->ioPort = IONotificationPortCreate(kIOMainPortDefault);
  if (v40->ioPort)
  {
    notifyPort = v40->ioPort;
    matching = IOServiceMatching("IOHIDDevice");
    id v38 = IOServiceAddMatchingNotification( notifyPort,  "IOServiceFirstMatch",  matching,  (IOServiceMatchingCallback)sub_10001BC60,  v40,  &v40->ioIterator);
    if (v38)
    {
      IONotificationPortDestroy(v40->ioPort);
      v40->ioPort = 0LL;
      id v34 = sub_10001B96C();
      os_log_type_t v33 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
      {
        sub_1000139C8((uint64_t)v41, v38);
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v34,  v33,  "Failed to add IOService matching notification: 0x%x",  v41,  8u);
      }

      objc_storeStrong(&v34, 0LL);
    }

    else
    {
      sub_10001BC60(v40, v40->ioIterator);
      notify = v40->ioPort;
      double v10 = &_dispatch_main_q;
      IONotificationPortSetDispatchQueue(notify, v10);

      if (v40->gcPowerSourceRegistryIDs)
      {
        CFDictionaryRemoveAllValues(v40->gcPowerSourceRegistryIDs);
        CFRelease(v40->gcPowerSourceRegistryIDs);
      }

      v40->gcPowerSourceRegistryIDs = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (v40->gcPowerSourceRegistryIDs)
      {
        objc_initWeak(&from, v40);
        out_token = &v40->_accessoryAttachToken;
        queue = &_dispatch_main_q;
        handler = _NSConcreteStackBlock;
        int v24 = -1073741824;
        int v25 = 0;
        uint64_t v26 = sub_100024694;
        int v27 = &unk_100038FB0;
        objc_copyWeak(&v28, &from);
        notify_register_dispatch("com.apple.system.accpowersources.attach", out_token, queue, &handler);

        p_accessoryTimeRemainingToken = &v40->_accessoryTimeRemainingToken;
        id v4 = &_dispatch_main_q;
        uint64_t v17 = _NSConcreteStackBlock;
        int v18 = -1073741824;
        int v19 = 0;
        id v20 = sub_100024758;
        id v21 = &unk_100038FB0;
        objc_copyWeak(&v22, &from);
        notify_register_dispatch( "com.apple.system.accpowersources.timeremaining",  p_accessoryTimeRemainingToken,  v4,  &v17);

        id v3 = objc_loadWeakRetained(&from);
        [v3 refreshGameControllerPowerSources];

        objc_destroyWeak(&v22);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&from);
      }

      else
      {
        id v32 = sub_10001B96C();
        char v31 = 16;
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
        {
          double v8 = (os_log_s *)v32;
          os_log_type_t v9 = v31;
          sub_100009998(v30);
          _os_log_error_impl( (void *)&_mh_execute_header,  v8,  v9,  "WARNING: No HUD alert will be shown for game controller's battery status. Reason: failed to allocate a dicti onary to store gc power source registry IDs",  v30,  2u);
        }

        objc_storeStrong(&v32, 0LL);
      }
    }
  }

  else
  {
    id location = sub_10001B96C();
    char v36 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v36;
      sub_100009998(v35);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "Failed to create port for getting IOKit notification for device state. Device connect/disconnect or battery leve l notifications is disabled",  v35,  2u);
    }

    objc_storeStrong(&location, 0LL);
  }

- (void)_initializeRemoteClickpadModeDidChangeDarwinNotifyToken
{
  double v11 = self;
  SEL v10 = a2;
  if (!self->_remoteClickpadModeNotifyTokenIsValid)
  {
    uint32_t v9 = notify_register_check( "com.apple.TVPeripheralAgent.RemoteClickpadModeDidChange",  &v11->_remoteClickpadModeNotifyToken);
    if (v9)
    {
      id location = sub_10001B96C();
      os_log_type_t v7 = OS_LOG_TYPE_FAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_FAULT))
      {
        sub_1000139C8((uint64_t)v14, v9);
        _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v7,  "Unable to create register token for RemoteClickpadDidChangeDarwinNotificationName. err=%u",  v14,  8u);
      }

      objc_storeStrong(&location, 0LL);
    }

    else
    {
      v11->_remoteClickpadModeNotifyTokenIsValid = 1;
      id v6 = +[NSUserDefaults tvps_userDefaults](&OBJC_CLASS___NSUserDefaults, "tvps_userDefaults");
      [v6 addObserver:v11 forKeyPath:TVPeripheralServicesUserDefaultsKeyRemoteClickpadMode options:1 context:off_100040200];
      uint64_t state64 = (uint64_t)objc_msgSend(v6, "tvps_remoteClickpadMode");
      os_log_t oslog = (os_log_t)sub_10001B96C();
      os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100024AE0((uint64_t)v13, state64);
        _os_log_impl((void *)&_mh_execute_header, oslog, v3, "Setting initial clickpad mode state to %lu", v13, 0xCu);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      uint32_t v9 = notify_set_state(v11->_remoteClickpadModeNotifyToken, state64);
      if (v9)
      {
        os_log_t v2 = (os_log_t)sub_10001B96C();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
        {
          sub_1000139C8((uint64_t)v12, v9);
          _os_log_fault_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "Unable to set initial state for RemoteClickpadDidChangeDarwinNotificationName. err=%u",  v12,  8u);
        }

        objc_storeStrong((id *)&v2, 0LL);
      }

      objc_storeStrong(&v6, 0LL);
    }
  }

- (void)_postRemoteClickpadModeDidChangeDarwinNotification:(unint64_t)a3
{
  double v11 = self;
  SEL v10 = a2;
  unint64_t v9 = a3;
  if (self->_remoteClickpadModeNotifyTokenIsValid)
  {
    uint32_t v8 = notify_set_state(v11->_remoteClickpadModeNotifyToken, v9);
    if (v8)
    {
      id location = sub_10001B96C();
      os_log_type_t v6 = OS_LOG_TYPE_FAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_FAULT))
      {
        sub_1000139C8((uint64_t)v14, v8);
        _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v6,  "Unable to set current state for RemoteTypeDidChangeDarwinNotificationName. err=%u",  v14,  8u);
      }

      objc_storeStrong(&location, 0LL);
    }

    else
    {
      os_log_t oslog = (os_log_t)sub_10001B96C();
      os_log_type_t v4 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100024AE0((uint64_t)v13, v9);
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  v4,  "Posting RemoteClickpadModeDidChangeDarwinNotificationName. clickpadMode=%lu",  v13,  0xCu);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      notify_post("com.apple.TVPeripheralAgent.RemoteClickpadModeDidChange");
      if (v8)
      {
        os_log_t v3 = (os_log_t)sub_10001B96C();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        {
          sub_1000139C8((uint64_t)v12, v8);
          _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "Unable to post RemoteClickpadModeDidChangeDarwinNotificationName. err=%u",  v12,  8u);
        }

        objc_storeStrong((id *)&v3, 0LL);
      }
    }
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  int v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  id v15 = a6;
  if (a6 == off_100040200)
  {
    id v6 = objc_msgSend(v16, "bs_safeNumberForKey:", NSKeyValueChangeNewKey);
    id v7 = [v6 integerValue];

    id v14 = v7;
    id v13 = sub_10001B96C();
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      sub_100024AE0((uint64_t)v20, (uint64_t)v14);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  v12,  "Detected changed clickpad mode. Will post notification. newClickpadMode=%lu",  v20,  0xCu);
    }

    objc_storeStrong(&v13, 0LL);
    -[TVPeripheralAgentService _postRemoteClickpadModeDidChangeDarwinNotification:]( v19,  "_postRemoteClickpadModeDidChangeDarwinNotification:",  v14);
  }

  else
  {
    v11.receiver = v19;
    v11.super_class = (Class)&OBJC_CLASS___TVPeripheralAgentService;
    -[TVPeripheralAgentService observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v17,  v16,  v15);
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)presentPeripheralNotificationWithType:(int64_t)a3
{
  os_log_type_t v4 = self;
  v3[2] = (id)a2;
  v3[1] = (id)a3;
  v3[0] =  +[TVPAPeripheralUserNotification peripheralUserNotificationWithHUDType:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "peripheralUserNotificationWithHUDType:",  a3);
  -[TVPeripheralAgentService _presentPeripheralNotification:](v4, "_presentPeripheralNotification:", v3[0]);
  objc_storeStrong(v3, 0LL);
}

- (void)presentGameControllerConnectedNotificationWithName:(id)a3 homeButtonImageID:(id)a4 mostRecentlyPlayedGame:(id)a5
{
  int v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  id v14 = sub_10001B96C();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v14;
    os_log_type_t type = v13;
    id v5 = location[0];
    id v8 = [v15 localizedName];
    id v12 = v8;
    sub_10001E758((uint64_t)v19, (uint64_t)v5, (uint64_t)v12);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Presenting game controller connected notification. controllerName=%{public}@, mostRecentlyPlayedGame=%{public}@",  v19,  0x16u);

    objc_storeStrong(&v12, 0LL);
  }

  objc_storeStrong(&v14, 0LL);
  id v11 =  +[TVPAPeripheralUserNotification gameControllerConnectedPeripheralUserNotificationWithName:homeButtonImageID:mostRecentlyPlayedGame:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "gameControllerConnectedPeripheralUserNotificationWithName:homeButtonImageID:mostRecentlyPlayedGame:",  location[0],  v16,  v15);
  -[TVPeripheralAgentService _presentPeripheralNotification:](v18, "_presentPeripheralNotification:", v11);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)presentGameControllerDisconnectedNotificationWithName:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 =  +[TVPAPeripheralUserNotification gameControllerDisconnectedPeripheralUserNotificationWithName:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "gameControllerDisconnectedPeripheralUserNotificationWithName:",  location[0]);
  -[TVPeripheralAgentService _presentPeripheralNotification:](v5, "_presentPeripheralNotification:", v3);
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)presentRemoteConnectedNotification:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 =  +[TVPAPeripheralUserNotification remoteConnectionPeripheralUserNotificationWithRemote:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "remoteConnectionPeripheralUserNotificationWithRemote:",  location[0]);
  -[TVPeripheralAgentService _presentPeripheralNotification:](v5, "_presentPeripheralNotification:", v3);
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)presentRemoteDisconnectedNotification:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 =  +[TVPAPeripheralUserNotification remoteDisconnectionPeripheralUserNotificationWithRemote:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "remoteDisconnectionPeripheralUserNotificationWithRemote:",  location[0]);
  -[TVPeripheralAgentService _presentPeripheralNotification:](v5, "_presentPeripheralNotification:", v3);
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)presentAudioDeviceConnectedNotificationWithDevice:(id)a3
{
  SEL v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 =  +[TVPAPeripheralUserNotification audioDeviceConnectedPeripheralUserNotificationWithDevice:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "audioDeviceConnectedPeripheralUserNotificationWithDevice:",  location[0]);
  id v3 = objc_alloc(&OBJC_CLASS___PBSHeadphoneBannerRequest);
  id v6 = [v8 title];
  id v5 = [v8 subtitle];
  id v4 = [v8 assetPath];
  id v7 = objc_msgSend( v3,  "initWithTitle:subtitle:assetPath:isMovieAsset:",  v6,  v5,  v4,  (unint64_t)objc_msgSend(v8, "assetIsMovie") & 1);

  -[PBSHeadphoneBannerManager presentHeadphoneBannerWithRequest:completion:]( v10->_headphoneBannerManager,  "presentHeadphoneBannerWithRequest:completion:",  v7,  &stru_100038FF0);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)presentAudioDeviceDisconnectedNotificationWithDevice:(id)a3
{
  SEL v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 =  +[TVPAPeripheralUserNotification audioDeviceDisconnectedPeripheralUserNotificationWithDevice:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "audioDeviceDisconnectedPeripheralUserNotificationWithDevice:",  location[0]);
  id v3 = objc_alloc(&OBJC_CLASS___PBSHeadphoneBannerRequest);
  id v6 = [v8 title];
  id v5 = [v8 subtitle];
  id v4 = [v8 assetPath];
  id v7 = objc_msgSend( v3,  "initWithTitle:subtitle:assetPath:isMovieAsset:",  v6,  v5,  v4,  (unint64_t)objc_msgSend(v8, "assetIsMovie") & 1);

  -[PBSHeadphoneBannerManager presentHeadphoneBannerWithRequest:completion:]( v10->_headphoneBannerManager,  "presentHeadphoneBannerWithRequest:completion:",  v7,  &stru_100039010);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_presentPeripheralNotification:(id)a3
{
  id v37 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  unsigned __int8 v23 = -[NSUserDefaults BOOLForKey:](v22, "BOOLForKey:", @"PeripheralHUDDisabled");

  char v35 = v23 & 1;
  if ((v23 & 1) == 0)
  {
    id v34 = 0LL;
    id v21 = v37;
    objc_sync_enter(v21);
    objc_storeStrong(&v34, v37->_bulletin);
    objc_storeStrong((id *)&v37->_bulletin, 0LL);
    objc_sync_exit(v21);

    if (v34)
    {
      id v33 = sub_10001B96C();
      os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
      {
        sub_10000822C((uint64_t)v39, (uint64_t)v34);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  v32,  "Dismissing stale bulletin: %{public}@",  v39,  0xCu);
      }

      objc_storeStrong(&v33, 0LL);
      -[PBSBulletinService dismissBulletin:](v37->_bulletinService, "dismissBulletin:", v34);
    }

    id v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    [v31 setObject:&off_10003B160 forKeyedSubscript:PBSSystemBulletinStyleKey];
    id v15 = [location[0] title];
    objc_msgSend(v31, "setObject:forKeyedSubscript:");

    id v16 = [location[0] subtitle];
    objc_msgSend(v31, "setObject:forKeyedSubscript:");

    id v17 = [location[0] bulletinImageType];
    objc_msgSend(v31, "setObject:forKeyedSubscript:");

    int v18 =  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [location[0] activationAction]);
    objc_msgSend(v31, "setObject:forKeyedSubscript:");

    id v19 = [location[0] symbolImageName];
    objc_msgSend(v31, "setObject:forKeyedSubscript:");

    id v20 = [location[0] symbolConfiguration];
    objc_msgSend(v31, "setObject:forKeyedSubscript:");

    if ((uint64_t)[location[0] timeout] > 0)
    {
      id v14 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [location[0] timeout]);
      objc_msgSend(v31, "setObject:forKeyedSubscript:");
    }

    id v30 = [location[0] footer];
    if (v30) {
      [v31 setObject:v30 forKeyedSubscript:PBSSystemBulletinFooterMessageKey];
    }
    id v29 = [location[0] bundleIdentifier];
    if (v29) {
      [v31 setObject:v29 forKeyedSubscript:off_1000401F0[0]];
    }
    id v28 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
    -[PBSBulletin setMessage:](v28, "setMessage:", v31);
    -[PBSBulletin setViewControllerClassName:]( v28,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
    -[PBSBulletin setServiceIdentifier:](v28, "setServiceIdentifier:", PBSSystemBulletinServiceName);
    -[TVPeripheralAgentService setBulletin:](v37, "setBulletin:", v28);
    id v11 = v37;
    id v12 = +[PBSBulletinService sharedInstance](&OBJC_CLASS___PBSBulletinService, "sharedInstance");
    -[TVPeripheralAgentService setBulletinService:](v11, "setBulletinService:");

    os_log_type_t v13 = -[TVPeripheralAgentService bulletinService](v37, "bulletinService");
    -[PBSBulletinService setDelegate:](v13, "setDelegate:", v37);

    id v27 = sub_10001B96C();
    os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (os_log_s *)v27;
      os_log_type_t v8 = v26;
      id v10 = sub_1000053D0((unint64_t)[location[0] type]);
      id v6 = v10;
      id v25 = v6;
      id v9 = [location[0] bulletinImageType];
      id v24 = v9;
      sub_10001E758((uint64_t)v38, (uint64_t)v6, (uint64_t)v24);
      _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "BTRemoteUtils: Showing bulletin. type=%{public}@. bulletinImageType=%{public}@",  v38,  0x16u);

      objc_storeStrong(&v24, 0LL);
      objc_storeStrong(&v25, 0LL);
    }

    objc_storeStrong(&v27, 0LL);
    bulletinService = v37->_bulletinService;
    id v4 = -[TVPeripheralAgentService bulletin](v37, "bulletin");
    -[PBSBulletinService presentBulletin:withCompletion:](bulletinService, "presentBulletin:withCompletion:");

    id v5 = v37;
    objc_sync_enter(v5);
    objc_storeStrong((id *)&v37->_bulletin, v28);
    objc_sync_exit(v5);

    objc_storeStrong((id *)&v28, 0LL);
    objc_storeStrong(&v29, 0LL);
    objc_storeStrong(&v30, 0LL);
    objc_storeStrong(&v31, 0LL);
    objc_storeStrong(&v34, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v26 = 0LL;
  objc_storeStrong(&v26, a4);
  unint64_t v25 = a5;
  id v24 = 0LL;
  os_log_type_t v13 = v28;
  objc_sync_enter(v13);
  id v12 = [v26 identifier];
  id v10 = -[PBSBulletin identifier](v28->_bulletin, "identifier");
  unsigned __int8 v11 = objc_msgSend(v12, "isEqual:");

  if ((v11 & 1) != 0)
  {
    id v9 = [v26 message];
    id v5 = [v9 objectForKey:off_1000401F0[0]];
    id v6 = v24;
    id v24 = v5;

    objc_storeStrong((id *)&v28->_bulletin, 0LL);
  }

  objc_sync_exit(v13);

  if (v24 && v25 == 1)
  {
    id v23 = sub_10001B96C();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000822C((uint64_t)v29, (uint64_t)v24);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  v22,  "Launching game due to bulletin activation. bundleIndentifier=%{public}@",  v29,  0xCu);
    }

    objc_storeStrong(&v23, 0LL);
    os_log_type_t v8 =  +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint");
    id v7 = v24;
    id v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    id v19 = sub_100026360;
    id v20 = &unk_100039058;
    id v21 = v24;
    -[FBSOpenApplicationService openApplication:withOptions:completion:]( v8,  "openApplication:withOptions:completion:",  v7,  0LL,  &v16);

    objc_storeStrong(&v21, 0LL);
  }

  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(location, 0LL);
}

- (PBSBulletinService)bulletinService
{
  return self->_bulletinService;
}

- (void)setBulletinService:(id)a3
{
}

- (PBSBulletin)bulletin
{
  return (PBSBulletin *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setBulletin:(id)a3
{
}

- (void)setBluetoothRemotePairingAgent:(id)a3
{
}

- (TVPADeviceEnforcementAgent)deviceEnforcementAgent
{
  return self->_deviceEnforcementAgent;
}

- (void)setDeviceEnforcementAgent:(id)a3
{
}

- (TVPABluetoothRemoteDiscoveryHelper)bluetoothRemoteDiscoveryHelper
{
  return self->_bluetoothRemoteDiscoveryHelper;
}

- (void)setBluetoothRemoteDiscoveryHelper:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableSet)connectedAudioDevices
{
  return self->_connectedAudioDevices;
}

- (void)setConnectedAudioDevices:(id)a3
{
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (TVPAPeripheralHUDSuppressionDataStore)hudSuppressionDataStore
{
  return self->_hudSuppressionDataStore;
}

- (void)setHudSuppressionDataStore:(id)a3
{
}

- (BOOL)isSuppressingDisconnectHUDDuringProximityPairing
{
  return self->_suppressingDisconnectHUDDuringProximityPairing;
}

- (void)setSuppressingDisconnectHUDDuringProximityPairing:(BOOL)a3
{
  self->_suppressingDisconnectHUDDuringProximityPairing = a3;
}

- (PBSHeadphoneBannerManager)headphoneBannerManager
{
  return self->_headphoneBannerManager;
}

- (void)setHeadphoneBannerManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end