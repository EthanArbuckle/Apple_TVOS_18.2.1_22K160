@interface RPNearbyInfoV2Discovery
- (CBDiscovery)discovery;
- (NSMutableArray)devices;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearbyInfoV2Discovery)init;
- (id)description;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (int)discoveryType;
- (unsigned)useCase;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDevices:(id)a3;
- (void)setDiscovery:(id)a3;
- (void)setDiscoveryType:(int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setUseCase:(unsigned int)a3;
@end

@implementation RPNearbyInfoV2Discovery

- (RPNearbyInfoV2Discovery)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RPNearbyInfoV2Discovery;
  v2 = -[RPNearbyInfoV2Discovery init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    devices = v2->_devices;
    v2->_devices = v3;

    *(void *)&v2->_discoveryType = 0x2000000000000LL;
    v5 = v2;
  }

  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_discovery)
  {
    v5 = (CBDiscovery *)objc_alloc_init(off_100132530());
    discovery = self->_discovery;
    self->_discovery = v5;

    -[CBDiscovery setDispatchQueue:](self->_discovery, "setDispatchQueue:", self->_dispatchQueue);
    -[CBDiscovery setLabel:](self->_discovery, "setLabel:", @"CLink");
    -[CBDiscovery setUseCase:](self->_discovery, "setUseCase:", self->_useCase);
    if (self->_discoveryType) {
      -[CBDiscovery addDiscoveryType:](self->_discovery, "addDiscoveryType:");
    }
    -[CBDiscovery setBleRSSIThresholdHint:](self->_discovery, "setBleRSSIThresholdHint:", 4294967216LL);
    if (dword_1001324C0 <= 30
      && (dword_1001324C0 != -1 || _LogCategory_Initialize(&dword_1001324C0, 30LL)))
    {
      signed int useCase = self->_useCase;
      if (useCase >= 0x20000)
      {
        if (useCase >= 327680)
        {
          if (useCase > 589824)
          {
            if (useCase <= 2147418111)
            {
              switch(useCase)
              {
                case 589825:
                  v8 = "FindNearbyPencil";
                  break;
                case 655360:
                  v8 = "AccessDigitalHomeKey";
                  break;
                case 786432:
                  v8 = "ProxControlDeviceClose";
                  break;
                default:
LABEL_121:
                  v8 = "?";
                  break;
              }
            }

            else
            {
              switch(useCase)
              {
                case 2147418112:
                  v8 = "InternalTestNoLockScan";
                  break;
                case 2147418113:
                  v8 = "InternalTestNoScreenOffScan";
                  break;
                case 2147418114:
                  v8 = "InternalTestScanWithNoDups";
                  break;
                case 2147418115:
                  v8 = "InternalTestScanWithDups";
                  break;
                case 2147418116:
                  v8 = "InternalTestScanFor20Seconds";
                  break;
                case 2147418117:
                  v8 = "InternalTestActiveScan";
                  break;
                case 2147418118:
                  v8 = "InternalTestUUIDScan";
                  break;
                case 2147418119:
                  v8 = "InternalTestScanFor10ClockSeconds";
                  break;
                case 2147418120:
                  v8 = "InternalTestScanBoost";
                  break;
                default:
                  goto LABEL_121;
              }
            }
          }

          else if (useCase > 458752)
          {
            switch(useCase)
            {
              case 524288:
                v8 = "ADPD";
                break;
              case 524289:
                v8 = "ADPDBuffer";
                break;
              case 524290:
                v8 = "MicroLocation";
                break;
              case 524291:
                v8 = "MicroLocationLeech";
                break;
              default:
                if (useCase == 458753)
                {
                  v8 = "PrecisionFindingFindee";
                }

                else
                {
                  if (useCase != 589824) {
                    goto LABEL_121;
                  }
                  v8 = "FindNearbyRemote";
                }

                break;
            }
          }

          else
          {
            switch(useCase)
            {
              case 393216:
                v8 = "CaptiveNetworkJoin";
                break;
              case 393217:
                v8 = "UseCaseSIMTransfer";
                break;
              case 393218:
                v8 = "MacSetup";
                break;
              case 393219:
                v8 = "AppleIDSignIn";
                break;
              case 393220:
                v8 = "AppleIDSignInSettings";
                break;
              default:
                if (useCase == 327680)
                {
                  v8 = "RapportThirdParty";
                }

                else
                {
                  if (useCase != 458752) {
                    goto LABEL_121;
                  }
                  v8 = "PrecisionFindingFinder";
                }

                break;
            }
          }
        }

        else
        {
          switch(useCase)
          {
            case 131072:
              v8 = "SharingDefault";
              break;
            case 131073:
              v8 = "SharingPhoneAutoUnlock";
              break;
            case 131074:
              v8 = "SharingSiriWatchAuth";
              break;
            case 131075:
              v8 = "SharingMacAutoUnlock";
              break;
            case 131076:
              v8 = "SharingEDTScreenOn";
              break;
            case 131077:
              v8 = "SharingEDTWiFiDisabled";
              break;
            case 131078:
              v8 = "SharingEDTWombatEligibleAsDefaultCamera";
              break;
            case 131079:
              v8 = "SharingEDTWombatCameraPicker";
              break;
            case 131080:
              v8 = "SharingWombatBackground";
              break;
            case 131081:
              v8 = "SharingUniversalControl";
              break;
            case 131082:
              v8 = "SharingPeopleProximity";
              break;
            case 131083:
              v8 = "SharingEDTEnsembleOpenDisplayPrefs";
              break;
            case 131084:
              v8 = "SharingEDTNearbydMotionStopped";
              break;
            case 131085:
              v8 = "SharingDoubleBoostGenericScan";
              break;
            case 131086:
              v8 = "SharingEDTIncomingAdvertisement ";
              break;
            case 131087:
              v8 = "SharingEDTWombatStreamStart";
              break;
            case 131088:
              v8 = "SharingOYAutoUnlock";
              break;
            case 131089:
              goto LABEL_121;
            case 131090:
              v8 = "SharingAirDrop";
              break;
            case 131091:
              v8 = "SharingNearbyInvitationHost";
              break;
            case 131092:
              v8 = "SharingNearbyInvitationParticipant";
              break;
            case 131093:
              v8 = "SharingAirDropAskToAirDrop";
              break;
            case 131094:
              v8 = "SharingAirDropTempIdentity";
              break;
            case 131095:
              v8 = "SharingAirDropNeedsCLink";
              break;
            case 131096:
              v8 = "SharingRemoteWidgetUpdate";
              break;
            case 131097:
              v8 = "SharingCountryCodeUpdate";
              break;
            case 131098:
              v8 = "SharingMacPhoneAutoUnlock";
              break;
            case 131099:
              v8 = "SharingVisionProDiscovery";
              break;
            case 131100:
              v8 = "SharingVisionProStateChange";
              break;
            case 131101:
              v8 = "SharingContinuityScreen";
              break;
            case 131102:
              v8 = "SharingEDTRemoteDisplay";
              break;
            default:
              if (useCase == 196608)
              {
                v8 = "DigitalIDTSA";
              }

              else
              {
                if (useCase != 0x40000) {
                  goto LABEL_121;
                }
                v8 = "DigitalCarKeyThirdParty";
              }

              break;
          }
        }
      }

      else
      {
        v8 = "Unspecified";
        switch(useCase)
        {
          case 0:
            break;
          case 1:
            v8 = "HealthKit";
            break;
          case 2:
            v8 = "HomeKit";
            break;
          case 3:
            v8 = "FindMyObjectConnection";
            break;
          case 4:
            v8 = "FindMyObjectConnectionTransient";
            break;
          case 5:
            v8 = "MIDI";
            break;
          case 6:
            v8 = "Continuity";
            break;
          case 7:
            v8 = "InstantHotSpot";
            break;
          case 8:
            v8 = "NearBy";
            break;
          case 9:
            v8 = "Sharing";
            break;
          case 10:
            v8 = "HearingSupport";
            break;
          case 11:
            v8 = "Magnet";
            break;
          case 12:
            v8 = "HID";
            break;
          case 13:
            v8 = "LEA";
            break;
          case 14:
            v8 = "External";
            break;
          case 15:
            v8 = "ExternalMedical";
            break;
          case 16:
            v8 = "ExternalLock";
            break;
          case 17:
            v8 = "ExternalWatch";
            break;
          case 18:
            v8 = "SmartRouting";
            break;
          case 19:
            v8 = "DigitalID";
            break;
          case 20:
            v8 = "DigitalKey";
            break;
          case 21:
            v8 = "DigitalCarKey";
            break;
          case 22:
            v8 = "HeySiri";
            break;
          case 23:
            v8 = "ThirdPartyApp";
            break;
          case 24:
            v8 = "CNJ";
            break;
          default:
            switch(useCase)
            {
              case 256:
                v8 = "DevicePresenceDetection";
                break;
              case 257:
                v8 = "AudioBox";
                break;
              case 258:
                v8 = "SIMTransfer";
                break;
              case 259:
                v8 = "ProximityScreenOnLeechScan";
                break;
              case 260:
                v8 = "MacMigrate";
                break;
              case 263:
                v8 = "HIDUARTService";
                break;
              case 264:
                v8 = "AccessibilitySwitchControlPairing";
                break;
              case 265:
                v8 = "BaseBandFastConnect";
                break;
              case 266:
                v8 = "SafetyAlerts";
                break;
              case 267:
                v8 = "LECarPlay";
                break;
              case 268:
                v8 = "TCCBluetooth";
                break;
              case 269:
                v8 = "AOPBufferLeech";
                break;
              default:
                goto LABEL_121;
            }

            break;
        }
      }

      LogPrintF( &dword_1001324C0,  "-[RPNearbyInfoV2Discovery activateWithCompletion:]",  30LL,  "Activating NearbyInfoV2 discovery with: %s (0x%x)\n",  v8,  useCase);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100071F14;
    v13[3] = &unk_100111A80;
    v13[4] = self;
    -[CBDiscovery setDeviceFoundHandler:](self->_discovery, "setDeviceFoundHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100071F20;
    v12[3] = &unk_100111A80;
    v12[4] = self;
    -[CBDiscovery setDeviceLostHandler:](self->_discovery, "setDeviceLostHandler:", v12);
    v9 = self->_discovery;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100071F2C;
    v10[3] = &unk_100112CA8;
    id v11 = v4;
    -[CBDiscovery activateWithCompletion:](v9, "activateWithCompletion:", v10);
  }
}

- (void)invalidate
{
  discovery = self->_discovery;
  self->_discovery = 0LL;

  -[NSMutableArray removeAllObjects](self->_devices, "removeAllObjects");
  devices = self->_devices;
  self->_devices = 0LL;

  id deviceFoundHandler = self->_deviceFoundHandler;
  self->_id deviceFoundHandler = 0LL;

  id deviceLostHandler = self->_deviceLostHandler;
  self->_id deviceLostHandler = 0LL;
}

- (void)_deviceFound:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 stableIdentifier]);
  if (v4 || (id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier])) != 0)
  {
    devices = self->_devices;
    if (!devices)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      objc_super v7 = self->_devices;
      self->_devices = v6;

      devices = self->_devices;
    }

    if ((-[NSMutableArray containsObject:](devices, "containsObject:", v4) & 1) != 0)
    {
      if (dword_1001324C0 <= 30
        && (dword_1001324C0 != -1 || _LogCategory_Initialize(&dword_1001324C0, 30LL)))
      {
        LogPrintF( &dword_1001324C0,  "-[RPNearbyInfoV2Discovery _deviceFound:]",  30LL,  "BLE NearbyInfoV2 device changed: %@\n",  v10);
      }
    }

    else
    {
      -[NSMutableArray addObject:](self->_devices, "addObject:", v4);
      if (dword_1001324C0 <= 30
        && (dword_1001324C0 != -1 || _LogCategory_Initialize(&dword_1001324C0, 30LL)))
      {
        LogPrintF( &dword_1001324C0,  "-[RPNearbyInfoV2Discovery _deviceFound:]",  30LL,  "BLE NearbyInfoV2 device found: %@\n",  v10);
      }
    }

    id v8 = objc_retainBlock(self->_deviceFoundHandler);
    v9 = v8;
    if (v8) {
      (*((void (**)(id, id))v8 + 2))(v8, v10);
    }
  }

  else if (dword_1001324C0 <= 90 {
         && (dword_1001324C0 != -1 || _LogCategory_Initialize(&dword_1001324C0, 90LL)))
  }
  {
    LogPrintF( &dword_1001324C0,  "-[RPNearbyInfoV2Discovery _deviceFound:]",  90LL,  "### Ignoring BLE NearbyInfoV2 device found: No ID, %@\n",  v10);
  }
}

- (void)_deviceLost:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 stableIdentifier]);
  if (v4 || (id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier])) != 0)
  {
    if (-[NSMutableArray containsObject:](self->_devices, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->_devices, "removeObject:", v4);
      if (dword_1001324C0 <= 30
        && (dword_1001324C0 != -1 || _LogCategory_Initialize(&dword_1001324C0, 30LL)))
      {
        LogPrintF( &dword_1001324C0,  "-[RPNearbyInfoV2Discovery _deviceLost:]",  30LL,  "BLE NearbyInfoV2 device lost: %@\n",  v7);
      }

      id v5 = objc_retainBlock(self->_deviceLostHandler);
      v6 = v5;
      if (v5) {
        (*((void (**)(id, id))v5 + 2))(v5, v7);
      }
    }
  }

  else
  {
    if (dword_1001324C0 <= 90
      && (dword_1001324C0 != -1 || _LogCategory_Initialize(&dword_1001324C0, 90LL)))
    {
      LogPrintF( &dword_1001324C0,  "-[RPNearbyInfoV2Discovery _deviceLost:]",  90LL,  "### Ignoring BLE NearbyInfoV2 device lost: %@\n",  v7);
    }

    id v4 = 0LL;
  }
}

- (id)description
{
  id v9 = 0LL;
  NSAppendPrintF(&v9, "NearbyInfoV2: ");
  id v3 = v9;
  id v8 = v3;
  NSAppendPrintF(&v8, "%@", self->_discovery);
  id v4 = v8;

  id v7 = v4;
  NSAppendPrintF(&v7, ", Devices %lu", -[NSMutableArray count](self->_devices, "count"));
  id v5 = v7;

  return v5;
}

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (int)discoveryType
{
  return self->_discoveryType;
}

- (void)setDiscoveryType:(int)a3
{
  self->_discoveryType = a3;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unsigned int)a3
{
  self->_signed int useCase = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (CBDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end