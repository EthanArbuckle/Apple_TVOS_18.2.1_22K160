@interface ACCExternalAccessory
+ (id)accessoryDictionaryForLogging:(id)a3;
+ (unsigned)_generateLegacyIAPConnectionID;
- (ACCExternalAccessory)initWithEndpointUUIDs:(id)a3 primaryEndpointUUID:(id)a4;
- (BOOL)supportsMultipleSessionsPerProtocol;
- (NSArray)EAProtocolsAppMatching;
- (NSArray)endpointUUIDs;
- (NSData)EACertData;
- (NSData)EACertSerial;
- (NSDictionary)EAAccessoryDictionary;
- (NSDictionary)EAProtocols;
- (NSDictionary)vehicleInfoDictionary;
- (NSDictionary)vehicleStatus;
- (NSNumber)EAConnectionID;
- (NSNumber)EAProductID;
- (NSNumber)EATransportType;
- (NSNumber)EAVendorID;
- (NSString)EADockType;
- (NSString)EAFirmwareRevisionActive;
- (NSString)EAFirmwareRevisionPending;
- (NSString)EAHardwareRevision;
- (NSString)EAMACAddress;
- (NSString)EAManufacturer;
- (NSString)EAModelNumber;
- (NSString)EAName;
- (NSString)EAPPID;
- (NSString)EAPreferredApp;
- (NSString)EARegionCode;
- (NSString)EASerialNumber;
- (NSString)primaryEndpointUUID;
- (id)_nativeUSBEndpointUUIDForProtocolIdentifier:(id)a3 iAP2Endpoint:(id *)a4;
- (id)copyExternalAccessoryProtocols;
- (id)description;
- (id)externalAccessoryProtocolInformationForProtocolName:(id)a3;
- (unint64_t)destinationSharingOptions;
- (void)_addAccessoryInfo:(ACCEndpoint_s *)a3;
- (void)_addEAProtocolPrimaryEndpointInfo:(ACCEndpoint_s *)a3;
- (void)_addEAProtocolsForEAEndpoints:(id)a3;
- (void)_addiAP2AuthInfo:(id *)a3;
- (void)_addiAP2EAProtocols:(id *)a3;
- (void)_addiAP2IdentificationInfo:(id *)a3;
- (void)_addiAP2VehicleInfo:(id *)a3;
- (void)_constructEADictionary:(id)a3;
- (void)copyExternalAccessoryProtocols;
- (void)setDestinationSharingOptions:(unint64_t)a3;
- (void)setVehicleStatus:(id)a3;
- (void)updateAccessoryInfo;
@end

@implementation ACCExternalAccessory

- (ACCExternalAccessory)initWithEndpointUUIDs:(id)a3 primaryEndpointUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___ACCExternalAccessory;
  id v8 = -[ACCExternalAccessory init](&v33, "init");
  if (v8)
  {
    id v9 = [v6 count];
    if (v7 || v9)
    {
      id v10 = [v6 copy];
      v11 = (void *)*((void *)v8 + 4);
      *((void *)v8 + 4) = v10;

      id v12 = v7 ? v7 : (id)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:0]);
      v13 = (void *)*((void *)v8 + 3);
      *((void *)v8 + 3) = v12;

      *((void *)v8 + 1) = 0LL;
      v14 = (void *)*((void *)v8 + 15);
      *((void *)v8 + 15) = 0LL;

      v15 = (void *)*((void *)v8 + 28);
      *((void *)v8 + 28) = 0LL;

      v16 = (void *)*((void *)v8 + 20);
      *((void *)v8 + 20) = 0LL;

      v17 = (void *)*((void *)v8 + 21);
      *((void *)v8 + 21) = 0LL;

      v18 = (void *)*((void *)v8 + 22);
      *((void *)v8 + 22) = 0LL;

      v19 = (void *)*((void *)v8 + 23);
      *((void *)v8 + 23) = 0LL;

      v20 = (void *)*((void *)v8 + 27);
      *((void *)v8 + 27) = 0LL;

      v21 = (void *)*((void *)v8 + 25);
      *((void *)v8 + 25) = 0LL;

      *((void *)v8 + 26) = 0LL;
      EndpointWithUUID = acc_manager_getEndpointWithUUID(*((const void **)v8 + 3));
      uint64_t ParentConnection = acc_endpoint_getParentConnection((uint64_t)EndpointWithUUID);
      if (EndpointWithUUID)
      {
        uint64_t v24 = ParentConnection;
        if (ParentConnection)
        {
          *((_BYTE *)v8 + 16) = 0;
          v25 = -[NSNumber initWithInt:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInt:",  acc_endpoint_getTransportType((uint64_t)EndpointWithUUID));
          v26 = (void *)*((void *)v8 + 17);
          *((void *)v8 + 17) = v25;

          if (*(_DWORD *)(v24 + 8) == 2)
          {
            if (*(void *)(v24 + 16))
            {
              v27 = -[NSString initWithString:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithString:",  *(void *)(v24 + 16));
              v28 = (void *)*((void *)v8 + 15);
              *((void *)v8 + 15) = v27;

              if (acc_policies_shouldOverrideNameOnAccessoryWithModelNumber(*((void *)v8 + 7)))
              {
                v29 = (void *)platform_bluetooth_copyNameForMacAddress(*(void *)(v24 + 16));
                v30 = v29;
                if (v29 && [v29 length]) {
                  objc_storeStrong((id *)v8 + 5, v30);
                }
              }
            }
          }

          switch(*((_DWORD *)EndpointWithUUID + 7))
          {
            case 1:
              [v8 _addAccessoryInfo:EndpointWithUUID];
              break;
            case 4:
              uint64_t v31 = EndpointWithUUID[7];
              if (v31)
              {
                [v8 _addAccessoryInfo:EndpointWithUUID];
                [v8 _addiAP2IdentificationInfo:v31];
                [v8 _addiAP2AuthInfo:v31];
                [v8 _addiAP2EAProtocols:v31];
              }

              break;
            case 5:
            case 7:
              [v8 _addEAProtocolPrimaryEndpointInfo:EndpointWithUUID];
              [v8 _addEAProtocolsForEAEndpoints:*((void *)v8 + 4)];
              break;
            default:
              break;
          }

          [v8 _constructEADictionary:*((void *)v8 + 3)];
        }
      }
    }
  }

  return (ACCExternalAccessory *)v8;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ACCExternalAccessory<%@(%@) %@(%@) endpoints=%@>",  self->_primaryEndpointUUID,  self->_EAConnectionID,  self->_EAName,  self->_EAModelNumber,  self->_endpointUUIDs);
}

- (void)updateAccessoryInfo
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 EAAccessoryDictionary]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "Updating EADictionary... (old: %@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (id)externalAccessoryProtocolInformationForProtocolName:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAProtocols](self, "EAProtocols", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (![v10 caseInsensitiveCompare:v4])
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAProtocols](self, "EAProtocols"));
          v11 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v10]);

          if (gLogObjects && gNumLogObjects >= 10)
          {
            v13 = (os_log_s *)*(id *)(gLogObjects + 72);
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
            v13 = (os_log_s *)&_os_log_default;
            id v14 = &_os_log_default;
          }

          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[ACCExternalAccessory externalAccessoryProtocolInformationForProtocolName:].cold.1();
          }

          goto LABEL_19;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v11 = 0LL;
LABEL_19:

  return v11;
}

- (id)copyExternalAccessoryProtocols
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAProtocols](self, "EAProtocols"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v5 = [v4 copy];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 10;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v8 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  else
  {
    uint64_t v8 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ACCExternalAccessory copyExternalAccessoryProtocols].cold.1(self, (uint64_t)v5, v8);
  }

  return v5;
}

- (void)_addiAP2AuthInfo:(id *)a3
{
  if (iap2_feature_getFeature((uint64_t)a3, 0))
  {
    id v5 = (NSData *)iap2_accAuthentication_copyCertificate((uint64_t)a3);
    BOOL v6 = (NSData *)iap2_accAuthentication_copyCertificateSerial((uint64_t)a3);
    if (v6) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v5 = 0LL;
    id v7 = 0LL;
  }

  EACertData = self->_EACertData;
  self->_EACertData = v5;
  id v10 = v5;

  EACertSerial = self->_EACertSerial;
  self->_EACertSerial = v7;
}

- (void)_addAccessoryInfo:(ACCEndpoint_s *)a3
{
  if (a3)
  {
    AccessoryInfo = (id *)acc_endpoint_getAccessoryInfo((uint64_t)a3);
    BOOL v6 = AccessoryInfo;
    if (AccessoryInfo && *AccessoryInfo)
    {
      id v67 = *AccessoryInfo;
    }

    else
    {
      uint64_t v7 = acc_strings_placeholder_Unknown();
      id v67 = (id)objc_claimAutoreleasedReturnValue(v7);
      if (!v6) {
        goto LABEL_8;
      }
    }

    id v8 = v6[1];
    if (v8)
    {
      id v66 = v8;
LABEL_9:
      id v10 = v6[2];
      if (v10)
      {
        id v65 = v10;
LABEL_12:
        id v12 = v6[3];
        if (v12)
        {
          id v64 = v12;
LABEL_15:
          id v14 = v6[4];
          if (v14)
          {
            id v15 = v14;
LABEL_18:
            id v17 = v6[5];
            if (v17)
            {
              id v18 = v17;
              goto LABEL_21;
            }

- (void)_addiAP2IdentificationInfo:(id *)a3
{
  if (!a3) {
    return;
  }
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 10;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    uint64_t v7 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding iAP2 identification info...", v12, 2u);
  }

  if ((iap2_identification_isIdentifiedForFeature((const __CFSet *)a3, 0x15u) & 1) != 0
    || iap2_identification_isIdentifiedForFeature((const __CFSet *)a3, 3u))
  {
    self->_eaAccessoryCapabilities |= 2uLL;
  }

  int isIdentifiedForIncomingMessageID = iap2_identification_isIdentifiedForIncomingMessageID((uint64_t)a3, 59907);
  unint64_t eaAccessoryCapabilities = self->_eaAccessoryCapabilities;
  if (!isIdentifiedForIncomingMessageID)
  {
    if ((eaAccessoryCapabilities & 0x10000) == 0) {
      goto LABEL_25;
    }
LABEL_41:
    self->_supportsMultipleSessionsPerProtocol = 1;
    if ((eaAccessoryCapabilities & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  eaAccessoryCapabilities |= 0x10000uLL;
  self->_unint64_t eaAccessoryCapabilities = eaAccessoryCapabilities;
  if ((eaAccessoryCapabilities & 0x10000) != 0) {
    goto LABEL_41;
  }
LABEL_25:
  if ((eaAccessoryCapabilities & 0x400) != 0)
  {
LABEL_26:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carkit.carplay-attached", 0LL, 0LL, 1u);
  }

- (void)_addiAP2EAProtocols:(id *)a3
{
  uint64_t v3 = a3;
  Feature = (void *)iap2_feature_getFeature((uint64_t)a3, 0xAu);
  if (!Feature) {
    return;
  }
  id v6 = Feature;
  uint64_t v7 = &ACCConnectionInfoCopyLocalizedAccessoryNameCFPrivate_ptr;
  if (*Feature)
  {
    id v8 = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", *Feature);
    EAPreferredApp = self->_EAPreferredApp;
    self->_EAPreferredApp = v8;
  }

  if (!v6[1]) {
    return;
  }
  obj = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  CFIndex Count = CFArrayGetCount((CFArrayRef)v6[1]);
  if (Count < 1) {
    goto LABEL_51;
  }
  v42 = v10;
  v43 = self;
  CFIndex v11 = 0LL;
  char v44 = 0;
  uint64_t v47 = kACCExternalAccessoryMatchActionKey;
  uint64_t v48 = kACCExternalAccessoryProtocolIndexKey;
  uint64_t v54 = kACCExternalAccessoryProtocolTypeKey;
  uint64_t v46 = kACCExternalAccessorySessionUsesSocketInterfaceKey;
  uint64_t v45 = kACCExternalAccessoryProtocolEndpointUUIDKey;
  v52 = v3;
  v49 = v6;
  do
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    ValueAtIndex = (unsigned __int16 *)CFArrayGetValueAtIndex((CFArrayRef)v6[1], v11);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *ValueAtIndex));
    [v12 setObject:v14 forKey:v48];
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)ValueAtIndex + 4)));
    [v12 setObject:v15 forKey:v47];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)ValueAtIndex + 6)));
    [v12 setObject:v16 forKey:v54];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[253], "stringWithString:", *((void *)ValueAtIndex
                                                                                               + 1)));
    -[NSMutableDictionary setObject:forKey:](obj, "setObject:forKey:", v12, v17);
    if (v3->var0->var3 != 8)
    {
      var1 = v3->var1;
LABEL_32:
      id v23 = -[__CFString copy](var1, "copy");
      goto LABEL_33;
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue( -[ACCExternalAccessory _nativeUSBEndpointUUIDForProtocolIdentifier:iAP2Endpoint:]( v43,  "_nativeUSBEndpointUUIDForProtocolIdentifier:iAP2Endpoint:",  v17,  v3));
    uint64_t v19 = gLogObjects;
    int v20 = gNumLogObjects;
    if (gLogObjects) {
      BOOL v21 = gNumLogObjects <= 9;
    }
    else {
      BOOL v21 = 1;
    }
    int v22 = !v21;
    if (!v18)
    {
      if (v22)
      {
        v26 = (os_log_s *)*(id *)(gLogObjects + 72);
      }

      else
      {
        v26 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v58 = v19;
          __int16 v59 = 1024;
          LODWORD(v60) = v20;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
        }

        id v31 = &_os_log_default;
      }

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[ACCExternalAccessory _addiAP2EAProtocols:].cold.3(&v55, v56, v26);
      }

      var1 = v52->var1;
      goto LABEL_32;
    }

    id v23 = (id)v18;
    if (v22)
    {
      uint64_t v24 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      CFIndex v53 = v11;
      v27 = ValueAtIndex;
      v28 = (void *)v18;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v58 = v19;
        __int16 v59 = 1024;
        LODWORD(v60) = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
      }

      id v29 = &_os_log_default;
      uint64_t v24 = (os_log_s *)&_os_log_default;
      id v23 = v28;
      ValueAtIndex = v27;
      CFIndex v11 = v53;
    }

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v58 = (uint64_t)v23;
      __int16 v59 = 2112;
      v60 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Found native EA USB endpoint %@ protocol for string %@",  buf,  0x16u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 2LL));
    [v12 setObject:v30 forKey:v54];

LABEL_33:
    uint64_t v32 = gLogObjects;
    int v33 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v34 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v58 = v32;
        __int16 v59 = 1024;
        LODWORD(v60) = v33;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
      }

      id v35 = &_os_log_default;
      v34 = (os_log_s *)&_os_log_default;
    }

    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "iAP2 EA uses the socket interface by default",  buf,  2u);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    [v12 setObject:v36 forKey:v46];

    [v12 setObject:v23 forKey:v45];
    int v37 = *((_DWORD *)ValueAtIndex + 4);
    if (v37 == 3) {
      goto LABEL_44;
    }
    if (v37 != 2)
    {
      if (v37 != 1) {
        goto LABEL_46;
      }
LABEL_44:
      [v42 addObject:v17];
    }

    char v44 = 1;
LABEL_46:

    ++v11;
    id v6 = v49;
    uint64_t v3 = v52;
    uint64_t v7 = &ACCConnectionInfoCopyLocalizedAccessoryNameCFPrivate_ptr;
  }

  while (Count != v11);
  id v10 = v42;
  self = v43;
  if ((v44 & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v38 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v38 = (os_log_s *)&_os_log_default;
      id v41 = &_os_log_default;
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "accessory supports public iAP", buf, 2u);
    }

    v43->_eaAccessoryCapabilities |= 1uLL;
    goto LABEL_66;
  }

- (void)_addiAP2VehicleInfo:(id *)a3
{
  uint64_t Feature = iap2_feature_getFeature((uint64_t)a3, 0x14u);
  if (Feature)
  {
    uint64_t v5 = Feature;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v7 = *(void **)(v5 + 24);
    if (v7)
    {
      id v8 = [v7 copy];
      [v6 setObject:v8 forKey:kACCVehicleInfoDisplayNameKey];
    }

    uint64_t v9 = *(void **)(v5 + 32);
    if (v9)
    {
      id v10 = [v9 copy];
      [v6 setObject:v10 forKey:kACCVehicleInfoMapsDisplayNameKey];
    }

    CFIndex v11 = *(void **)(v5 + 16);
    if (v11)
    {
      id v12 = v11;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v13 = [v12 countByEnumeratingWithState:&v47 objects:v54 count:16];
      if (v13)
      {
        id v14 = v13;
        LODWORD(v15) = 0;
        uint64_t v16 = *(void *)v48;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v48 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v15 = (1 << (char)[*(id *)(*((void *)&v47 + 1) + 8 * (void)i) unsignedIntValue]) | v15;
          }

          id v14 = [v12 countByEnumeratingWithState:&v47 objects:v54 count:16];
        }

        while (v14);
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v15));
      [v6 setObject:v18 forKey:kACCVehicleInfoEngineTypeBitmaskKey];
    }

    uint64_t v19 = *(void **)(v5 + 40);
    if (v19)
    {
      id v20 = [v19 copy];
      [v6 setObject:v20 forKey:kACCVehicleInfoVehicleColorHexCodeKey];
    }

    BOOL v21 = *(void **)(v5 + 48);
    if (v21)
    {
      id v22 = v21;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      id v23 = [v22 countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = 0LL;
        uint64_t v26 = *(void *)v44;
        do
        {
          for (j = 0LL; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v22);
            }
            v25 |= 1 << (char)[*(id *)(*((void *)&v43 + 1) + 8 * (void)j) unsignedLongLongValue];
          }

          id v24 = [v22 countByEnumeratingWithState:&v43 objects:v53 count:16];
        }

        while (v24);
      }

      else
      {
        uint64_t v25 = 0LL;
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v25));
      [v6 setObject:v28 forKey:kACCVehicleInfoSupportedChargingConnectorsBitMaskKey];
    }

    if (*(_DWORD *)(v5 + 56))
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
      [v6 setObject:v29 forKey:kACCVehicleInfoPowerForConnectorTypeCCS1Key];
    }

    if (*(_DWORD *)(v5 + 60))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
      [v6 setObject:v30 forKey:kACCVehicleInfoPowerForConnectorTypeCCS2Key];
    }

    if (*(_DWORD *)(v5 + 64))
    {
      id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
      [v6 setObject:v31 forKey:kACCVehicleInfoPowerForConnectorTypeJ1772Key];
    }

    if (*(_DWORD *)(v5 + 68))
    {
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
      [v6 setObject:v32 forKey:kACCVehicleInfoPowerForConnectorTypeCHAdeMOKey];
    }

    if (*(_DWORD *)(v5 + 72))
    {
      int v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
      [v6 setObject:v33 forKey:kACCVehicleInfoPowerForConnectorTypeMennekesKey];
    }

    if (*(_DWORD *)(v5 + 76))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
      [v6 setObject:v34 forKey:kACCVehicleInfoPowerForConnectorTypeGBT_DCKey];
    }

    if (*(_DWORD *)(v5 + 80))
    {
      id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
      [v6 setObject:v35 forKey:kACCVehicleInfoPowerForConnectorTypeGBT_ACKey];
    }

    if (*(_DWORD *)(v5 + 84))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
      [v6 setObject:v36 forKey:kACCVehicleInfoPowerForConnectorTypeTeslaKey];

      int v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v5 + 88)));
      [v6 setObject:v37 forKey:kACCVehicleInfoPowerForConnectorTypeNACS_DCKey];
    }

    if (*(_DWORD *)(v5 + 92))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
      [v6 setObject:v38 forKey:kACCVehicleInfoPowerForConnectorTypeNACS_ACKey];
    }

    p_vehicleInfoDictionary = &self->_vehicleInfoDictionary;
    objc_storeStrong((id *)p_vehicleInfoDictionary, v6);
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v40 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v40 = (os_log_s *)&_os_log_default;
      id v41 = &_os_log_default;
    }

    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v42 = *p_vehicleInfoDictionary;
      *(_DWORD *)buf = 138412290;
      v52 = v42;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "iAP2 vehicle info is %@", buf, 0xCu);
    }
  }

- (id)_nativeUSBEndpointUUIDForProtocolIdentifier:(id)a3 iAP2Endpoint:(id *)a4
{
  id v5 = a3;
  id v6 = acc_manager_copyConnectionUUIDForEndpointUUID(a4->var1);
  ConnectionWithUUID = acc_manager_getConnectionWithUUID(v6);
  Endpoints = (const __CFDictionary *)acc_connection_getEndpoints((uint64_t)ConnectionWithUUID);
  CFIndex Count = CFDictionaryGetCount(Endpoints);
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 9;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (Count >= 1)
  {
    uint64_t v12 = Count;
    if (v11)
    {
      id v13 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v13 = (os_log_s *)&_os_log_default;
      id v15 = &_os_log_default;
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Have %ld endpoints to parse", buf, 0xCu);
    }

    v28[1] = v28;
    __chkstk_darwin(v16);
    uint64_t v18 = (char *)v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    memset(v18, 170, v17);
    CFDictionaryGetKeysAndValues(Endpoints, (const void **)v18, 0LL);
    uint64_t v19 = 0LL;
    id v20 = 0LL;
    unsigned int v21 = 1;
    while (1)
    {
      id v22 = *(id *)&v18[8 * v19];
      EndpointWithUUID = acc_manager_getEndpointWithUUID(v22);
LABEL_23:

      uint64_t v19 = v21;
      BOOL v10 = v12 <= v21++;
      if (v10) {
        goto LABEL_34;
      }
    }

    id v24 = (id)acc_endpoint_copyIdentifier((uint64_t)EndpointWithUUID);
    NSLog(@"found EANative endpointUUID %@, identifier %@", v22, v24);
    if ([v24 caseInsensitiveCompare:v5])
    {
      if (!v24)
      {
LABEL_22:

        goto LABEL_23;
      }
    }

    else
    {
      id v25 = [v22 copy];

      id v20 = v25;
      if (!v24) {
        goto LABEL_22;
      }
    }

    CFRelease(v24);
    goto LABEL_22;
  }

  if (v11)
  {
    id v14 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v14 = (os_log_s *)&_os_log_default;
    id v26 = &_os_log_default;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No native USB endpoints found!", buf, 2u);
  }

  id v20 = 0LL;
LABEL_34:

  return v20;
}

- (void)_addEAProtocolPrimaryEndpointInfo:(ACCEndpoint_s *)a3
{
  AccessoryInfo = (id *)acc_endpoint_getAccessoryInfo((uint64_t)a3);
  id v6 = AccessoryInfo;
  if (AccessoryInfo && *AccessoryInfo)
  {
    id v47 = *AccessoryInfo;
  }

  else
  {
    uint64_t v7 = acc_strings_placeholder_Unknown();
    id v47 = (id)objc_claimAutoreleasedReturnValue(v7);
    if (!v6) {
      goto LABEL_7;
    }
  }

  id v8 = v6[1];
  if (v8)
  {
    id v9 = v8;
    goto LABEL_8;
  }

- (void)_addEAProtocolsForEAEndpoints:(id)a3
{
  id v3 = a3;
  id v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    unsigned int v6 = 0;
    uint64_t v30 = *(void *)v32;
    uint64_t v28 = kACCExternalAccessoryProtocolIndexKey;
    uint64_t v27 = kACCExternalAccessoryProtocolTypeKey;
    uint64_t v24 = kACCExternalAccessoryProtocolFirmwareVersionActiveKey;
    uint64_t v23 = kACCExternalAccessoryProtocolFirmwareVersionPendingKey;
    uint64_t v26 = kACCExternalAccessoryProtocolEndpointUUIDKey;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        EndpointWithUUID = acc_manager_getEndpointWithUUID(v8);
        CFTypeRef v10 = acc_endpoint_copyIdentifier((uint64_t)EndpointWithUUID);
        if (v10)
        {
          id v11 = v10;
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v6));
          [v12 setObject:v13 forKey:v28];
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 1LL));
          [v12 setObject:v14 forKey:v27];
          if (EndpointWithUUID)
          {
            uint64_t AccessoryInfo = acc_endpoint_getAccessoryInfo((uint64_t)EndpointWithUUID);
            if (AccessoryInfo)
            {
              uint64_t v16 = AccessoryInfo;
              id v17 = (void *)acc_accInfo_retainedProperty(AccessoryInfo, 5, 0LL);
              if (v17) {
                [v12 setObject:v17 forKey:v24];
              }
              id v18 = (void *)acc_accInfo_retainedProperty(v16, 6, 0LL);
              if (v18) {
                [v12 setObject:v18 forKey:v23];
              }
            }
          }

          ++v6;
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v11));
          CFRelease(v11);
          id v20 = [v8 copy];
          [v12 setObject:v20 forKey:v26];

          -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v12, v19);
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v5);
  }

  EAProtocols = self->_EAProtocols;
  self->_EAProtocols = &v29->super;
}

- (void)_constructEADictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAName](self, "EAName"));
  if (v6)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, kACCExternalAccessoryNameKey);
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, kACCExternalAccessoryNameKey);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAManufacturer](self, "EAManufacturer"));
  if (v8)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v8, kACCExternalAccessoryManufacturerKey);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v9, kACCExternalAccessoryManufacturerKey);
  }

  CFTypeRef v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAModelNumber](self, "EAModelNumber"));
  if (v10)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v10, kACCExternalAccessoryModelNumberKey);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v11, kACCExternalAccessoryModelNumberKey);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EASerialNumber](self, "EASerialNumber"));
  if (v12)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v12, kACCExternalAccessorySerialNumberKey);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v13, kACCExternalAccessorySerialNumberKey);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAFirmwareRevisionActive](self, "EAFirmwareRevisionActive"));
  if (v14)
  {
    -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  v14,  kACCExternalAccessoryFirmwareRevisionActiveKey);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  v15,  kACCExternalAccessoryFirmwareRevisionActiveKey);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAFirmwareRevisionPending](self, "EAFirmwareRevisionPending"));
  if (v16)
  {
    -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  v16,  kACCExternalAccessoryFirmwareRevisionPendingKey);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  v17,  kACCExternalAccessoryFirmwareRevisionPendingKey);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAHardwareRevision](self, "EAHardwareRevision"));
  if (v18)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v18, kACCExternalAccessoryHardwareRevisionKey);
  }

  else
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v19, kACCExternalAccessoryHardwareRevisionKey);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAPPID](self, "EAPPID"));
  if (v20)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v20, kACCExternalAccessoryPPIDKey);
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v21, kACCExternalAccessoryPPIDKey);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EARegionCode](self, "EARegionCode"));
  if (v22)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v22, kACCExternalAccessoryRegionCodeKey);
  }

  else
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v23, kACCExternalAccessoryRegionCodeKey);
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAVendorID](self, "EAVendorID"));
  if (v24)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v24, kACCExternalAccessoryVendorIDKey);
  }

  else
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v25, kACCExternalAccessoryVendorIDKey);
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAProductID](self, "EAProductID"));
  if (v26)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v26, kACCExternalAccessoryProductIDKey);
  }

  else
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v27, kACCExternalAccessoryProductIDKey);
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EADockType](self, "EADockType"));
  if (v28)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v28, kACCExternalAccessoryDockTypeKey);
  }

  else
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v29, kACCExternalAccessoryDockTypeKey);
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EATransportType](self, "EATransportType"));
  if (v30)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v30, kACCExternalAccessoryTransportType);
  }

  else
  {
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v31, kACCExternalAccessoryTransportType);
  }

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory primaryEndpointUUID](self, "primaryEndpointUUID"));
  if (v32)
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v32, kACCExternalAccessoryPrimaryUUID);
  }

  else
  {
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v33, kACCExternalAccessoryPrimaryUUID);
  }

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_eaAccessoryCapabilities));
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v34, kACCExternalAccessoryCapabilitiesKey);

  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EACertSerial](self, "EACertSerial"));
  if (v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EACertSerial](self, "EACertSerial"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v36, kACCExternalAccessoryCertSerialNumberKey);
  }

  int v37 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EACertData](self, "EACertData"));

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EACertData](self, "EACertData"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v38, kACCExternalAccessoryCertDataKey);
  }

  if (self->_EAMACAddress)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAMACAddress](self, "EAMACAddress"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v39, kACCExternalAccessoryMacAddressKey);
  }

  unint64_t eaAccessoryCapabilities = self->_eaAccessoryCapabilities;
  if ((eaAccessoryCapabilities & 8) != 0)
  {
    id v41 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  platform_location_getSupportedNMEASentences());
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  v42,  kACCExternalAccessoryLocationSentenceTypesKey);

    unint64_t eaAccessoryCapabilities = self->_eaAccessoryCapabilities;
  }

  if ((eaAccessoryCapabilities & 0x20000) != 0)
  {
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v43, kACCExternalAccessoryDestinationSharingKey);

    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_destinationSharingOptions));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v44, kACCDestinationSharingOptionsKey);
  }

  if (self->_EAProtocols)
  {
    __int16 v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    if (gLogObjects && gNumLogObjects >= 10)
    {
      __int128 v45 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      __int128 v45 = (os_log_s *)&_os_log_default;
      id v46 = &_os_log_default;
    }

    __int16 v72 = v5;
    id v73 = v4;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessory _constructEADictionary:].cold.7(self);
    }

    id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAProtocols](self, "EAProtocols"));
    id v49 = [v48 countByEnumeratingWithState:&v75 objects:v79 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v76;
      uint64_t v52 = kACCExternalAccessoryProtocolIndexKey;
      do
      {
        for (i = 0LL; i != v50; i = (char *)i + 1)
        {
          if (*(void *)v76 != v51) {
            objc_enumerationMutation(v48);
          }
          id v54 = *(id *)(*((void *)&v75 + 1) + 8LL * (void)i);
          uint8_t v55 = self;
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAProtocols](self, "EAProtocols"));
          v57 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKey:v54]);

          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKey:v52]);
          [v74 setObject:v58 forKey:v54];

          self = v55;
          [v47 setObject:v57 forKey:v54];
        }

        id v50 = [v48 countByEnumeratingWithState:&v75 objects:v79 count:16];
      }

      while (v50);
    }

    if (gLogObjects && gNumLogObjects >= 10)
    {
      __int16 v59 = (os_log_s *)*(id *)(gLogObjects + 72);
      id v5 = v72;
      id v4 = v73;
    }

    else
    {
      id v5 = v72;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      __int16 v59 = (os_log_s *)&_os_log_default;
      id v60 = &_os_log_default;
      id v4 = v73;
    }

    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessory _constructEADictionary:].cold.5();
    }

    if (gLogObjects && gNumLogObjects >= 10)
    {
      v61 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v61 = (os_log_s *)&_os_log_default;
      id v62 = &_os_log_default;
    }

    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessory _constructEADictionary:].cold.3();
    }

    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v74, kACCExternalAccessoryProtocolsKey);
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v47, kACCExternalAccessoryProtocolDetailsKey);
  }

  if (self->_EAPreferredApp)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAPreferredApp](self, "EAPreferredApp"));
    id v64 = [v63 copy];
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v64, kACCExternalAccessoryPreferredAppKey);
  }

  vehicleInfoDictionary = self->_vehicleInfoDictionary;
  if (vehicleInfoDictionary) {
    -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  vehicleInfoDictionary,  kACCVehicleInfoLegacyInitialDataKey);
  }
  id v66 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  +[ACCExternalAccessory _generateLegacyIAPConnectionID]( &OBJC_CLASS___ACCExternalAccessory,  "_generateLegacyIAPConnectionID")));
  EAConnectionID = self->_EAConnectionID;
  self->_EAConnectionID = v66;

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessory EAConnectionID](self, "EAConnectionID"));
  id v69 = [v68 copy];
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v69, kACCExternalAccessoryLegacyConnectionIDKey);

  objc_storeStrong((id *)&self->_EAAccessoryDictionary, v5);
  if (gLogObjects && gNumLogObjects >= 10)
  {
    __int16 v70 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int16 v70 = (os_log_s *)&_os_log_default;
    id v71 = &_os_log_default;
  }

  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    -[ACCExternalAccessory _constructEADictionary:].cold.1(self);
  }
}

+ (unsigned)_generateLegacyIAPConnectionID
{
  if (_generateLegacyIAPConnectionID_onceToken != -1) {
    dispatch_once(&_generateLegacyIAPConnectionID_onceToken, &__block_literal_global_23);
  }
  if (((_generateLegacyIAPConnectionID_connectionID + 1) & 0xFFFFFF) != 0) {
    int v2 = _generateLegacyIAPConnectionID_connectionID + 1;
  }
  else {
    int v2 = _generateLegacyIAPConnectionID_connectionID + 2;
  }
  unsigned int result = v2 & 0xFFFFFF | 0x2000000;
  _generateLegacyIAPConnectionID_connectionID = result;
  return result;
}

void __54__ACCExternalAccessory__generateLegacyIAPConnectionID__block_invoke(id a1)
{
  _generateLegacyIAPConnectionID_connectionID = arc4random();
}

+ (id)accessoryDictionaryForLogging:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3));
  uint64_t v4 = kACCExternalAccessoryCertDataKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kACCExternalAccessoryCertDataKey]);

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v4]);
    id v7 = [v6 length];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu bytes", v7));
    [v3 setObject:v8 forKey:v4];
  }

  uint64_t v9 = kACCExternalAccessoryCertSerialNumberKey;
  CFTypeRef v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kACCExternalAccessoryCertSerialNumberKey]);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v9]);
    id v12 = [v11 length];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu bytes", v12));
    [v3 setObject:v13 forKey:v9];
  }

  return v3;
}

- (NSString)primaryEndpointUUID
{
  return self->_primaryEndpointUUID;
}

- (NSArray)endpointUUIDs
{
  return self->_endpointUUIDs;
}

- (NSString)EAName
{
  return self->_EAName;
}

- (NSString)EAManufacturer
{
  return self->_EAManufacturer;
}

- (NSString)EAModelNumber
{
  return self->_EAModelNumber;
}

- (NSString)EASerialNumber
{
  return self->_EASerialNumber;
}

- (NSString)EAFirmwareRevisionActive
{
  return self->_EAFirmwareRevisionActive;
}

- (NSString)EAFirmwareRevisionPending
{
  return self->_EAFirmwareRevisionPending;
}

- (NSString)EAHardwareRevision
{
  return self->_EAHardwareRevision;
}

- (NSString)EAPPID
{
  return self->_EAPPID;
}

- (NSString)EARegionCode
{
  return self->_EARegionCode;
}

- (NSString)EADockType
{
  return self->_EADockType;
}

- (NSString)EAMACAddress
{
  return self->_EAMACAddress;
}

- (NSNumber)EAConnectionID
{
  return self->_EAConnectionID;
}

- (NSNumber)EATransportType
{
  return self->_EATransportType;
}

- (NSNumber)EAVendorID
{
  return self->_EAVendorID;
}

- (NSNumber)EAProductID
{
  return self->_EAProductID;
}

- (NSArray)EAProtocolsAppMatching
{
  return self->_EAProtocolsAppMatching;
}

- (NSString)EAPreferredApp
{
  return self->_EAPreferredApp;
}

- (NSData)EACertData
{
  return self->_EACertData;
}

- (NSData)EACertSerial
{
  return self->_EACertSerial;
}

- (NSDictionary)EAAccessoryDictionary
{
  return self->_EAAccessoryDictionary;
}

- (BOOL)supportsMultipleSessionsPerProtocol
{
  return self->_supportsMultipleSessionsPerProtocol;
}

- (NSDictionary)vehicleStatus
{
  return self->_vehicleStatus;
}

- (void)setVehicleStatus:(id)a3
{
}

- (unint64_t)destinationSharingOptions
{
  return self->_destinationSharingOptions;
}

- (void)setDestinationSharingOptions:(unint64_t)a3
{
  self->_destinationSharingOptions = a3;
}

- (NSDictionary)vehicleInfoDictionary
{
  return self->_vehicleInfoDictionary;
}

- (NSDictionary)EAProtocols
{
  return self->_EAProtocols;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)externalAccessoryProtocolInformationForProtocolName:.cold.1()
{
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_5_2( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Found externalAccessoryProtocolInformation protocolName %@ for protocol %@",  v2);
  OUTLINED_FUNCTION_2();
}

- (void)copyExternalAccessoryProtocols
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 EAName]);
  OUTLINED_FUNCTION_8_8();
  uint64_t v8 = a2;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a3, v6, "all protocols for accessory %@: %@", v7);

  OUTLINED_FUNCTION_4_9();
}

- (void)_addiAP2EAProtocols:(os_log_t)log .cold.3(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Didn't find native EA endpoint UUID, using iAP2 Endpoint UUID",  buf,  2u);
}

- (void)_constructEADictionary:(void *)a1 .cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 EAAccessoryDictionary]);
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[ACCExternalAccessory accessoryDictionaryForLogging:]( &OBJC_CLASS___ACCExternalAccessory,  "accessoryDictionaryForLogging:",  v1));
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v3, v4, "created eaDict %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_9();
}

- (void)_constructEADictionary:.cold.3()
{
}

- (void)_constructEADictionary:.cold.5()
{
}

- (void)_constructEADictionary:(void *)a1 .cold.7(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 EAProtocols]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "EAProtocols %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

@end