@interface RPCompanionLinkDevice
- (BOOL)checkIfHomeHubDeviceIsLookingForItsHubWithLocalDevice:(id)a3;
- (BOOL)checkIfHubIsLookingForAHomeHubDeviceItIsHostingWithLocalDevice:(id)a3;
- (BOOL)hasAnyDiscoveryFlags;
- (BOOL)hasIOS;
- (BOOL)hasValidDiscoveryTypeForLocalDevice:(id)a3;
- (BOOL)hasWatchOS;
- (BOOL)isCompanionLinkDeviceAProxyHost;
- (BOOL)isCompanionLinkDeviceAnAudioAccessory;
- (BOOL)isCompanionLinkHomeHubDevice;
- (BOOL)isDiscoveredOverBLE;
- (BOOL)isDiscoveredOverInfraWifi;
- (BOOL)isDiscoveredOverWifiP2P;
- (BOOL)isGuestDevice;
- (BOOL)isMeDevice;
- (BOOL)isOwner;
- (BOOL)willUseProxyCommunicationWithLocalDevice:(id)a3;
- (id)_ad_siriSharedData;
- (id)_ad_siriSharedDataProtobuf;
- (id)getAceDiscoveryType;
- (int)getHALDiscoveryType;
@end

@implementation RPCompanionLinkDevice

- (id)_ad_siriSharedDataProtobuf
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice siriInfo](self, "siriInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"sharedDataProtoBuf"]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    v5 = -[_ADPBDeviceSetDataRequest initWithData:]( objc_alloc(&OBJC_CLASS____ADPBDeviceSetDataRequest),  "initWithData:",  v3);
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (id)_ad_siriSharedData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice _ad_siriSharedDataProtobuf](self, "_ad_siriSharedDataProtobuf"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_ad_data"));

  return v3;
}

- (BOOL)isDiscoveredOverInfraWifi
{
  return ((unint64_t)-[RPCompanionLinkDevice statusFlags](self, "statusFlags") >> 2) & 1;
}

- (BOOL)isDiscoveredOverWifiP2P
{
  return ((unint64_t)-[RPCompanionLinkDevice statusFlags](self, "statusFlags") >> 9) & 1;
}

- (BOOL)isDiscoveredOverBLE
{
  return ((unint64_t)-[RPCompanionLinkDevice statusFlags](self, "statusFlags") >> 1) & 1;
}

- (BOOL)isCompanionLinkHomeHubDevice
{
  return ((unint64_t)-[RPCompanionLinkDevice statusFlags](self, "statusFlags") >> 28) & 1;
}

- (BOOL)isCompanionLinkDeviceAnAudioAccessory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self, "model"));
  unsigned __int8 v3 = [v2 hasPrefix:@"AudioAccessory"];

  return v3;
}

- (BOOL)isCompanionLinkDeviceAProxyHost
{
  return ((unint64_t)-[RPCompanionLinkDevice statusFlags](self, "statusFlags") >> 29) & 1;
}

- (BOOL)isGuestDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsDeviceIdentifier](self, "idsDeviceIdentifier"));
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (BOOL)hasValidDiscoveryTypeForLocalDevice:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[RPCompanionLinkDevice(AssistantAdditions) hasValidDiscoveryTypeForLocalDevice:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  if ((+[AFFeatureFlags isForceBLEDiscoveryForCompanionLinkEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isForceBLEDiscoveryForCompanionLinkEnabled") & 1) != 0)
  {
    unsigned int v6 = -[RPCompanionLinkDevice willUseProxyCommunicationWithLocalDevice:]( self,  "willUseProxyCommunicationWithLocalDevice:",  v4);
    unsigned int v7 = -[RPCompanionLinkDevice isDiscoveredOverInfraWifi](self, "isDiscoveredOverInfraWifi");
    unsigned int v8 = +[AFFeatureFlags isAWDLFallbackForPersonalRequestsEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isAWDLFallbackForPersonalRequestsEnabled");
    else {
      unsigned int v9 = !-[RPCompanionLinkDevice isCompanionLinkHomeHubDevice](self, "isCompanionLinkHomeHubDevice");
    }
    if (-[RPCompanionLinkDevice hasIOS](self, "hasIOS"))
    {
      -[RPCompanionLinkDevice operatingSystemVersion](self, "operatingSystemVersion");
      if (v23)
      {
        -[RPCompanionLinkDevice operatingSystemVersion](self, "operatingSystemVersion");
        BOOL v12 = v22 > 17;
LABEL_16:
        unsigned int v14 = -[RPCompanionLinkDevice isDiscoveredOverWifiP2P](self, "isDiscoveredOverWifiP2P") & v9 & v12 & v8;
        v15 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          v17 = @"NO";
          if (v6) {
            v18 = @"YES";
          }
          else {
            v18 = @"NO";
          }
          *(_DWORD *)buf = 136316418;
          v25 = "-[RPCompanionLinkDevice(AssistantAdditions) hasValidDiscoveryTypeForLocalDevice:]";
          if (v7) {
            v19 = @"YES";
          }
          else {
            v19 = @"NO";
          }
          __int16 v26 = 2112;
          v27 = v18;
          if (v14) {
            v20 = @"YES";
          }
          else {
            v20 = @"NO";
          }
          __int16 v28 = 2112;
          v29 = v19;
          if (v8) {
            v21 = @"YES";
          }
          else {
            v21 = @"NO";
          }
          __int16 v30 = 2112;
          v31 = v20;
          if (v12) {
            v17 = @"YES";
          }
          __int16 v32 = 2112;
          v33 = v21;
          __int16 v34 = 2112;
          v35 = v17;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s willUseProxyCommunicationWithLocalDevice: %@, isDeviceDiscoveredOverInfraWifi: %@, shouldAllowAWDLFallbac k: %@, isAWDLFallbackForPersonalRequestsEnabled: %@, meetMinIOSVersion: %@",  buf,  0x3Eu);
        }

        char v11 = v6 | v7 | v14;
        goto LABEL_18;
      }

      v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[RPCompanionLinkDevice(AssistantAdditions) hasValidDiscoveryTypeForLocalDevice:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s operating system is missing, likely a secondary user. Proceed the request to handle error later.",  buf,  0xCu);
      }
    }

    BOOL v12 = 1;
    goto LABEL_16;
  }

  v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[RPCompanionLinkDevice(AssistantAdditions) hasValidDiscoveryTypeForLocalDevice:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s BLE discovery is disabled, discovery type is valid.",  buf,  0xCu);
  }

  char v11 = 1;
LABEL_18:

  return v11;
}

- (BOOL)checkIfHomeHubDeviceIsLookingForItsHubWithLocalDevice:(id)a3
{
  id v4 = a3;
  if (-[RPCompanionLinkDevice hasAnyDiscoveryFlags](self, "hasAnyDiscoveryFlags"))
  {
    char v5 = 0;
  }

  else
  {
    unsigned int v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      unsigned int v14 = "-[RPCompanionLinkDevice(AssistantAdditions) checkIfHomeHubDeviceIsLookingForItsHubWithLocalDevice:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s Device does not have any discovery status flags. Return true if local device is sidekick and target device is homehub. ",  (uint8_t *)&v13,  0xCu);
    }

    unsigned int v7 = [v4 isCompanionLinkHomeHubDevice];
    unsigned int v8 = -[RPCompanionLinkDevice isCompanionLinkDeviceAnAudioAccessory](self, "isCompanionLinkDeviceAnAudioAccessory");
    unsigned int v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      char v11 = @"NO";
      unsigned int v14 = "-[RPCompanionLinkDevice(AssistantAdditions) checkIfHomeHubDeviceIsLookingForItsHubWithLocalDevice:]";
      if (v7) {
        BOOL v12 = @"YES";
      }
      else {
        BOOL v12 = @"NO";
      }
      int v13 = 136315650;
      v16 = v12;
      __int16 v15 = 2112;
      if (v8) {
        char v11 = @"YES";
      }
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s isLocalDeviceHomeHubDevice: %@, isTargetDeviceAnAudioAccessory: %@.",  (uint8_t *)&v13,  0x20u);
    }

    char v5 = v7 & v8;
  }

  return v5;
}

- (BOOL)checkIfHubIsLookingForAHomeHubDeviceItIsHostingWithLocalDevice:(id)a3
{
  id v4 = a3;
  if (-[RPCompanionLinkDevice isCompanionLinkDeviceAProxyHost](self, "isCompanionLinkDeviceAProxyHost"))
  {
    char v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315138;
      v16 = "-[RPCompanionLinkDevice(AssistantAdditions) checkIfHubIsLookingForAHomeHubDeviceItIsHostingWithLocalDevice:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Target Device has ProxyHost status flag. Return true if local device is HomePod/HHDevice and target device is Sidekick.",  (uint8_t *)&v15,  0xCu);
    }

    unsigned int v6 = [v4 isCompanionLinkDeviceAnAudioAccessory];
    unsigned int v7 = [v4 isCompanionLinkHomeHubDevice];
    unsigned int v8 = -[RPCompanionLinkDevice isCompanionLinkHomeHubDevice](self, "isCompanionLinkHomeHubDevice");
    unsigned int v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      BOOL v12 = @"NO";
      if (v6) {
        int v13 = @"YES";
      }
      else {
        int v13 = @"NO";
      }
      int v15 = 136315906;
      v16 = "-[RPCompanionLinkDevice(AssistantAdditions) checkIfHubIsLookingForAHomeHubDeviceItIsHostingWithLocalDevice:]";
      if (v7) {
        unsigned int v14 = @"YES";
      }
      else {
        unsigned int v14 = @"NO";
      }
      v18 = v13;
      __int16 v17 = 2112;
      __int16 v19 = 2112;
      v20 = v14;
      if (v8) {
        BOOL v12 = @"YES";
      }
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s isLocalDeviceAnAudioAccessory: %@, isLocalDeviceHomeHubDevice: %@, isTargetDeviceHomeHubDevice: %@",  (uint8_t *)&v15,  0x2Au);
    }

    char v10 = (v6 | v7) & v8;
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isMeDevice
{
  LODWORD(v3) = -[RPCompanionLinkDevice isOwner](self, "isOwner");
  if (v3) {
    return ((unint64_t)-[RPCompanionLinkDevice statusFlags](self, "statusFlags") >> 7) & 1;
  }
  return v3;
}

- (BOOL)isOwner
{
  return ((unint64_t)-[RPCompanionLinkDevice statusFlags](self, "statusFlags") >> 19) & 1;
}

- (BOOL)hasIOS
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self, "model"));
  if ([v3 hasPrefix:@"iPhone"])
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    char v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self, "model"));
    unsigned __int8 v4 = [v5 hasPrefix:@"iPad"];
  }

  return v4;
}

- (BOOL)hasWatchOS
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self, "model"));
  unsigned __int8 v3 = [v2 hasPrefix:@"Watch"];

  return v3;
}

- (int)getHALDiscoveryType
{
  if (-[RPCompanionLinkDevice isDiscoveredOverInfraWifi](self, "isDiscoveredOverInfraWifi")) {
    return 1;
  }
  if (-[RPCompanionLinkDevice isDiscoveredOverWifiP2P](self, "isDiscoveredOverWifiP2P")) {
    return 2;
  }
  if (-[RPCompanionLinkDevice isDiscoveredOverBLE](self, "isDiscoveredOverBLE")) {
    return 3;
  }
  return 0;
}

- (BOOL)willUseProxyCommunicationWithLocalDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[RPCompanionLinkDevice checkIfHomeHubDeviceIsLookingForItsHubWithLocalDevice:]( self,  "checkIfHomeHubDeviceIsLookingForItsHubWithLocalDevice:",  v4);
  unsigned int v6 = -[RPCompanionLinkDevice checkIfHubIsLookingForAHomeHubDeviceItIsHostingWithLocalDevice:]( self,  "checkIfHubIsLookingForAHomeHubDeviceItIsHostingWithLocalDevice:",  v4);

  unsigned int v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v9 = @"NO";
    BOOL v12 = "-[RPCompanionLinkDevice(AssistantAdditions) willUseProxyCommunicationWithLocalDevice:]";
    if (v5) {
      char v10 = @"YES";
    }
    else {
      char v10 = @"NO";
    }
    int v11 = 136315650;
    unsigned int v14 = v10;
    __int16 v13 = 2112;
    if (v6) {
      unsigned int v9 = @"YES";
    }
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s isHomeHubDeviceLookingForItsHub: %@, isHubLookingForADeviceItIsHosting: %@",  (uint8_t *)&v11,  0x20u);
  }

  return v5 | v6;
}

- (id)getAceDiscoveryType
{
  if (-[RPCompanionLinkDevice isDiscoveredOverInfraWifi](self, "isDiscoveredOverInfraWifi"))
  {
    unsigned __int8 v3 = (id *)&SARemoteDeviceDiscoveryModeInfraWifiValue;
  }

  else if (-[RPCompanionLinkDevice isDiscoveredOverWifiP2P](self, "isDiscoveredOverWifiP2P"))
  {
    unsigned __int8 v3 = (id *)&SARemoteDeviceDiscoveryModeWifiP2PValue;
  }

  else
  {
    unsigned int v4 = -[RPCompanionLinkDevice isDiscoveredOverBLE](self, "isDiscoveredOverBLE");
    unsigned __int8 v3 = (id *)&SARemoteDeviceDiscoveryModeUnknownValue;
    if (v4) {
      unsigned __int8 v3 = (id *)&SARemoteDeviceDiscoveryModeBluetoothValue;
    }
  }

  return *v3;
}

- (BOOL)hasAnyDiscoveryFlags
{
  id v3 = -[RPCompanionLinkDevice statusFlags](self, "statusFlags");
  if (v3)
  {
    if (-[RPCompanionLinkDevice isDiscoveredOverInfraWifi](self, "isDiscoveredOverInfraWifi")
      || -[RPCompanionLinkDevice isDiscoveredOverWifiP2P](self, "isDiscoveredOverWifiP2P"))
    {
      LOBYTE(v3) = 1;
    }

    else
    {
      LOBYTE(v3) = -[RPCompanionLinkDevice isDiscoveredOverBLE](self, "isDiscoveredOverBLE");
    }
  }

  return (char)v3;
}

@end