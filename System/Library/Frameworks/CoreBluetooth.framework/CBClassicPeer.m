@interface CBClassicPeer
- (BOOL)EQConfigEnabled;
- (BOOL)LRDetectionEnabled;
- (BOOL)autoAnswerCalls;
- (BOOL)browsingEnabled;
- (BOOL)inEarDetectionEnabled;
- (BOOL)isAACPCapabilityBit:(unsigned int)a3;
- (BOOL)isAppleAccessoryServer;
- (BOOL)isAppleDevice;
- (BOOL)isAppleFeatureSupported:(unsigned int)a3;
- (BOOL)isConnectedOverUSB;
- (BOOL)isDevFused;
- (BOOL)isGameController;
- (BOOL)isIncoming;
- (BOOL)isMac;
- (BOOL)isMultiBatteryDevice;
- (BOOL)isNintendoGameController;
- (BOOL)isRFCOMMServiceSupported:(id)a3;
- (BOOL)isReportingBatteryPercent;
- (BOOL)isServiceSupported:(id)a3;
- (BOOL)isSonyGameController;
- (BOOL)isXboxGameController;
- (BOOL)isiPad;
- (BOOL)isiPhone;
- (BOOL)objectPushEnabled;
- (BOOL)panEnabled;
- (BOOL)remoteTimeSyncEnabled;
- (BOOL)smartRoutingSupported;
- (BOOL)traceLogging;
- (CBClassicPeer)initWithInfo:(id)a3 manager:(id)a4;
- (NSArray)services;
- (NSArray)syncGroups;
- (NSData)aacpCapabilityBits;
- (NSData)sdpRecordData;
- (NSHashTable)L2CAPChannels;
- (NSHashTable)RFCOMMChannels;
- (NSNumber)RSSI;
- (NSString)addressString;
- (NSString)appleModelIdentifier;
- (NSString)name;
- (NSString)serialNumber;
- (NSUUID)trustedUID;
- (id)channelWithID:(unsigned __int8)a3;
- (id)channelWithPSM:(unsigned __int16)a3;
- (id)connectL2CAPCallback;
- (id)connectRFCOMMCallback;
- (id)description;
- (id)disconnectL2CAPCallback;
- (id)disconnectRFCOMMCallback;
- (id)importServices:(id)a3;
- (id)service:(id)a3;
- (id)serviceForPSM:(unsigned __int16)a3;
- (id)serviceForRFCOMMChannelID:(unsigned __int8)a3;
- (int64_t)internalState;
- (unint64_t)appleExtendedFeatureBitMask;
- (unint64_t)hash;
- (unsigned)EQConfigBass;
- (unsigned)EQConfigMid;
- (unsigned)EQConfigTreble;
- (unsigned)appleFeatureBitMask;
- (unsigned)batteryPercentCase;
- (unsigned)batteryPercentCombined;
- (unsigned)batteryPercentLeft;
- (unsigned)batteryPercentRight;
- (unsigned)batteryPercentSingle;
- (unsigned)clickHoldInterval;
- (unsigned)clickHoldModeLeft;
- (unsigned)clickHoldModeRight;
- (unsigned)colorID;
- (unsigned)connectionHandle;
- (unsigned)crownRotationDirection;
- (unsigned)deviceType;
- (unsigned)doubleClickInterval;
- (unsigned)doubleClickMode;
- (unsigned)doubleTapAction;
- (unsigned)doubleTapActionLeft;
- (unsigned)doubleTapActionRight;
- (unsigned)doubleTapCapability;
- (unsigned)getConnectedServices;
- (unsigned)listeningMode;
- (unsigned)listeningModeConfigs;
- (unsigned)micMode;
- (unsigned)modeSupported;
- (unsigned)oneBudANCMode;
- (unsigned)primaryInEarStatus;
- (unsigned)productID;
- (unsigned)psmForService:(id)a3;
- (unsigned)rfcommChannelIDForService:(id)a3;
- (unsigned)secondaryInEarStatus;
- (unsigned)singleClickMode;
- (unsigned)smartRoutingEnabled;
- (unsigned)switchControlMode;
- (unsigned)syncSettings;
- (unsigned)vendorID;
- (unsigned)vendorIDSource;
- (unsigned)version;
- (void)closeL2CAPChannel:(unsigned __int16)a3;
- (void)closeRFCOMMChannel:(unsigned __int8)a3;
- (void)configureRFCOMMPortParams:(id)a3;
- (void)dealloc;
- (void)getConnectedServices;
- (void)handleDisconnection;
- (void)handleFailedConnection;
- (void)handleGetPeerState:(id)a3;
- (void)handleL2CAPChannelClosed:(id)a3;
- (void)handleL2CAPChannelOpened:(id)a3;
- (void)handleMsg:(int)a3 args:(id)a4;
- (void)handlePeerUpdated:(id)a3;
- (void)handleRFCOMMChannelClosed:(id)a3;
- (void)handleRFCOMMChannelOpened:(id)a3;
- (void)handleSuccessfulConnection:(id)a3;
- (void)openL2CAPChannel:(unsigned __int16)a3;
- (void)openRFCOMMChannel:(unsigned __int8)a3;
- (void)openRFCOMMChannel:(unsigned __int8)a3 options:(id)a4;
- (void)sendMsg:(int)a3 args:(id)a4;
- (void)sendMsg:(int)a3 requiresConnected:(BOOL)a4 args:(id)a5;
- (void)setAacpCapabilityBits:(id)a3;
- (void)setAddressString:(id)a3;
- (void)setAppleExtendedFeatureBitMask:(unint64_t)a3;
- (void)setAppleFeatureBitMask:(unsigned int)a3;
- (void)setAppleModelIdentifier:(id)a3;
- (void)setAutoAnswerCalls:(BOOL)a3;
- (void)setBatteryPercentCase:(unsigned __int8)a3;
- (void)setBatteryPercentCombined:(unsigned __int8)a3;
- (void)setBatteryPercentLeft:(unsigned __int8)a3;
- (void)setBatteryPercentRight:(unsigned __int8)a3;
- (void)setBatteryPercentSingle:(unsigned __int8)a3;
- (void)setBrowsingEnabled:(BOOL)a3;
- (void)setClickHoldInterval:(unsigned int)a3;
- (void)setClickHoldModeLeft:(unsigned __int8)a3;
- (void)setClickHoldModeRight:(unsigned __int8)a3;
- (void)setColorID:(unsigned __int8)a3;
- (void)setConnectL2CAPCallback:(id)a3;
- (void)setConnectRFCOMMCallback:(id)a3;
- (void)setConnectionHandle:(unsigned __int16)a3;
- (void)setCrownRotationDirection:(unsigned __int8)a3;
- (void)setDeviceType:(unsigned __int8)a3;
- (void)setDisconnectL2CAPCallback:(id)a3;
- (void)setDisconnectRFCOMMCallback:(id)a3;
- (void)setDoubleClickInterval:(unsigned int)a3;
- (void)setDoubleClickMode:(unsigned __int8)a3;
- (void)setDoubleTapAction:(unsigned __int16)a3;
- (void)setDoubleTapActionLeft:(unsigned __int16)a3;
- (void)setDoubleTapActionRight:(unsigned __int16)a3;
- (void)setDoubleTapCapability:(unsigned __int8)a3;
- (void)setEQConfigBass:(unsigned __int8)a3;
- (void)setEQConfigEnabled:(BOOL)a3;
- (void)setEQConfigMid:(unsigned __int8)a3;
- (void)setEQConfigTreble:(unsigned __int8)a3;
- (void)setInEarDetectionEnabled:(BOOL)a3;
- (void)setInternalState:(int64_t)a3;
- (void)setIsAppleAccessoryServer:(BOOL)a3;
- (void)setIsConnectedOverUSB:(BOOL)a3;
- (void)setIsDevFused:(BOOL)a3;
- (void)setIsIncoming:(BOOL)a3;
- (void)setL2CAPChannels:(id)a3;
- (void)setLRDetectionEnabled:(BOOL)a3;
- (void)setListeningMode:(unsigned __int8)a3;
- (void)setListeningModeConfigs:(unsigned int)a3;
- (void)setMicMode:(unsigned __int8)a3;
- (void)setModeSupported:(unsigned __int8)a3;
- (void)setName:(id)a3;
- (void)setObjectPushEnabled:(BOOL)a3;
- (void)setOneBudANCMode:(unsigned __int8)a3;
- (void)setOrphan;
- (void)setPanEnabled:(BOOL)a3;
- (void)setPrimaryInEarStatus:(unsigned __int8)a3;
- (void)setProductID:(unsigned __int16)a3;
- (void)setRFCOMMChannels:(id)a3;
- (void)setRSSI:(id)a3;
- (void)setRemoteTimeSyncEnabled:(BOOL)a3;
- (void)setSdpRecordData:(id)a3;
- (void)setSecondaryInEarStatus:(unsigned __int8)a3;
- (void)setSerialNumber:(id)a3;
- (void)setServices:(id)a3;
- (void)setSingleClickMode:(unsigned __int8)a3;
- (void)setSmartRoutingEnabled:(unsigned __int8)a3;
- (void)setSmartRoutingSupported:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setSwitchControlMode:(unsigned __int8)a3;
- (void)setSyncGroups:(id)a3;
- (void)setSyncSettings:(unsigned __int16)a3;
- (void)setTraceLogging:(BOOL)a3;
- (void)setTrustedUID:(id)a3;
- (void)setVendorID:(unsigned __int16)a3;
- (void)setVendorIDSource:(unsigned __int16)a3;
- (void)setVersion:(unsigned __int16)a3;
@end

@implementation CBClassicPeer

- (CBClassicPeer)initWithInfo:(id)a3 manager:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CBClassicPeer;
  v7 = -[CBPeer initWithInfo:manager:](&v14, sel_initWithInfo_manager_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_state = 0LL;
    uint64_t v9 = [objc_alloc(MEMORY[0x1896078B8]) initWithOptions:5 capacity:0];
    L2CAPChannels = v8->_L2CAPChannels;
    v8->_L2CAPChannels = (NSHashTable *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1896078B8]) initWithOptions:5 capacity:0];
    RFCOMMChannels = v8->_RFCOMMChannels;
    v8->_RFCOMMChannels = (NSHashTable *)v11;

    -[CBPeer setMtuLength:](v8, "setMtuLength:", 672LL);
    -[CBClassicPeer handlePeerUpdated:](v8, "handlePeerUpdated:", v6);
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  unint64_t v3 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CBClassicPeer dealloc]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_186F9B000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  L2CAPChannels = self->_L2CAPChannels;
  if (L2CAPChannels) {
    -[NSHashTable removeAllObjects](L2CAPChannels, "removeAllObjects");
  }
  RFCOMMChannels = self->_RFCOMMChannels;
  if (RFCOMMChannels) {
    -[NSHashTable removeAllObjects](RFCOMMChannels, "removeAllObjects");
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBClassicPeer;
  -[CBClassicPeer dealloc](&v6, sel_dealloc);
}

- (id)description
{
  v16 = (void *)NSString;
  uint64_t v15 = objc_opt_class();
  -[CBPeer identifier](self, "identifier");
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 UUIDString];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CBClassicPeer name](self, "name");
  -[CBPeer peerStateToString:](self, "peerStateToString:", -[CBClassicPeer internalState](self, "internalState"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CBPeer pairingState](self, "pairingState")) {
    v7 = @"Paired";
  }
  else {
    v7 = @"Unpaired";
  }
  v8 = -[CBClassicPeer addressString](self, "addressString");
  unsigned int v9 = -[CBClassicPeer deviceType](self, "deviceType");
  unsigned int v10 = -[CBClassicPeer productID](self, "productID");
  unsigned int v11 = -[CBClassicPeer vendorID](self, "vendorID");
  if (-[CBClassicPeer isAppleDevice](self, "isAppleDevice")) {
    v12 = @", Apple";
  }
  else {
    v12 = &stru_189FB61A8;
  }
  [v16 stringWithFormat:@"<%@: %p %@, %@, %@, %@, %@, devType: %d, PID: 0x%04X, VID: 0x%04X%@>", v15, self, v4, v5, v6, v7, v8, v9, v10, v11, v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)importServices:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v8 objectForKeyedSubscript:@"kCBMsgArgPSM"];
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v8 objectForKeyedSubscript:@"kCBMsgArgRFCOMMChannelID"];
        unsigned int v11 = (void *)v10;
        if (v9)
        {
          v28[0] = @"kCBMsgArgServiceUUID";
          objc_msgSend(v8, "objectForKeyedSubscript:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = +[CBUUID UUIDWithData:](&OBJC_CLASS___CBUUID, "UUIDWithData:", v12);
          v28[1] = @"kCBMsgArgPSM";
          v29[0] = v13;
          [v8 objectForKeyedSubscript:@"kCBMsgArgPSM"];
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
          v29[1] = v14;
          uint64_t v15 = (void *)MEMORY[0x189603F68];
          v16 = v29;
          v17 = v28;
LABEL_7:
          [v15 dictionaryWithObjects:v16 forKeys:v17 count:2];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 addObject:v18];

          goto LABEL_8;
        }

        if (v10)
        {
          v26[0] = @"kCBMsgArgServiceUUID";
          objc_msgSend(v8, "objectForKeyedSubscript:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = +[CBUUID UUIDWithData:](&OBJC_CLASS___CBUUID, "UUIDWithData:", v12);
          v26[1] = @"kCBMsgArgRFCOMMChannelID";
          v27[0] = v13;
          objc_msgSend(v8, "objectForKeyedSubscript:");
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
          v27[1] = v14;
          uint64_t v15 = (void *)MEMORY[0x189603F68];
          v16 = v27;
          v17 = v26;
          goto LABEL_7;
        }

- (void)sendMsg:(int)a3 args:(id)a4
{
}

- (void)sendMsg:(int)a3 requiresConnected:(BOOL)a4 args:(id)a5
{
  BOOL v5 = a4;
  unsigned __int16 v6 = a3;
  id v8 = a5;
  -[CBPeer manager](self, "manager");
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (-[CBClassicPeer state](self, "state") != 2 && v5)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        -[CBClassicPeer sendMsg:requiresConnected:args:].cold.2();
      }
    }

    if (!v8) {
      id v8 = (id)MEMORY[0x189604A60];
    }
    uint64_t v10 = (void *)[v8 mutableCopy];
    -[CBPeer identifier](self, "identifier");
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setObject:v11 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    v12 = -[CBPeer manager](self, "manager");
    [v12 sendMsg:v6 args:v10];

LABEL_11:
    return;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    goto LABEL_11;
  }
  -[CBClassicPeer sendMsg:requiresConnected:args:].cold.1();
}

- (void)handleMsg:(int)a3 args:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v7 = 1;
  id v8 = &selRef_handleGetPeerState_;
  switch((int)v4)
  {
    case 23:
      unsigned int v9 = sel_handleL2CAPChannelOpened_;
      int64_t v10 = -[CBClassicPeer internalState](self, "internalState");
      goto LABEL_8;
    case 24:
      unsigned int v9 = sel_handleL2CAPChannelClosed_;
      int64_t v10 = -[CBClassicPeer internalState](self, "internalState");
      goto LABEL_8;
    case 41:
      goto LABEL_7;
    case 45:
      -[CBClassicPeer internalState](self, "internalState");
      -[CBClassicPeer handlePeerUpdated:](self, sel_handlePeerUpdated_, v6);
      break;
    case 56:
      char v7 = 0;
      id v8 = &selRef_handleRFCOMMChannelOpened_;
LABEL_7:
      unsigned int v9 = *v8;
      int64_t v10 = -[CBClassicPeer internalState](self, "internalState");
      if ((v7 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    case 57:
      unsigned int v9 = sel_handleRFCOMMChannelClosed_;
      int64_t v10 = -[CBClassicPeer internalState](self, "internalState");
LABEL_8:
      if (v10 == 2)
      {
LABEL_14:
        objc_msgSend(self, v9, v6);
      }

      else
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        }
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
          -[CBClassicPeer handleMsg:args:].cold.1();
        }
      }

      break;
    default:
      v11.receiver = self;
      v11.super_class = (Class)&OBJC_CLASS___CBClassicPeer;
      -[CBPeer handleMsg:args:](&v11, sel_handleMsg_args_, v4, v6);
      break;
  }
}

- (void)handleGetPeerState:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBClassicPeer handlePeerUpdated:](self, "handlePeerUpdated:", v4);
}

- (void)handlePeerUpdated:(id)a3
{
  uint64_t v290 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceType"];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v6 = [v5 unsignedIntValue];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceType"];
  if (v7)
  {
    id v8 = (void *)v7;
    int v9 = -[CBClassicPeer deviceType](self, "deviceType");

    if (v9 != v6) {
      -[CBClassicPeer setDeviceType:](self, "setDeviceType:", v6);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgPID"];
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int16 v11 = [v10 unsignedIntValue];

  uint64_t v12 = [v4 objectForKeyedSubscript:@"kCBMsgArgPID"];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = -[CBClassicPeer productID](self, "productID");

    if (v14 != v11) {
      -[CBClassicPeer setProductID:](self, "setProductID:", v11);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgVID"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int16 v16 = [v15 unsignedIntValue];

  uint64_t v17 = [v4 objectForKeyedSubscript:@"kCBMsgArgVID"];
  if (v17)
  {
    v18 = (void *)v17;
    int v19 = -[CBClassicPeer vendorID](self, "vendorID");

    if (v19 != v16) {
      -[CBClassicPeer setVendorID:](self, "setVendorID:", v16);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgVIDSource"];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int16 v21 = [v20 unsignedIntValue];

  uint64_t v22 = [v4 objectForKeyedSubscript:@"kCBMsgArgVIDSource"];
  if (v22)
  {
    __int128 v23 = (void *)v22;
    int v24 = -[CBClassicPeer vendorIDSource](self, "vendorIDSource");

    if (v24 != v21) {
      -[CBClassicPeer setVendorIDSource:](self, "setVendorIDSource:", v21);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgVersion"];
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int16 v26 = [v25 unsignedIntValue];

  uint64_t v27 = [v4 objectForKeyedSubscript:@"kCBMsgArgVersion"];
  if (v27)
  {
    v28 = (void *)v27;
    int v29 = -[CBClassicPeer version](self, "version");

    if (v29 != v26) {
      -[CBClassicPeer setVersion:](self, "setVersion:", v26);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgIsDevFused"];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [v30 BOOLValue];

  uint64_t v32 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsDevFused"];
  if (v32)
  {
    v33 = (void *)v32;
    int v34 = -[CBClassicPeer isDevFused](self, "isDevFused");

    if ((_DWORD)v31 != v34) {
      -[CBClassicPeer setIsDevFused:](self, "setIsDevFused:", v31);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgColorID"];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = [v35 unsignedCharValue];

  uint64_t v37 = [v4 objectForKeyedSubscript:@"kCBMsgArgColorID"];
  if (v37)
  {
    v38 = (void *)v37;
    int v39 = -[CBClassicPeer colorID](self, "colorID");

    if (v39 != (_DWORD)v36) {
      -[CBClassicPeer setColorID:](self, "setColorID:", v36);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercent"];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  int v41 = [v40 unsignedCharValue];

  uint64_t v42 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercent"];
  if (v42)
  {
    v43 = (void *)v42;
    int v44 = -[CBClassicPeer batteryPercentSingle](self, "batteryPercentSingle");

    if (v44 != v41)
    {
      [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercent"];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBClassicPeer setBatteryPercentSingle:]( self,  "setBatteryPercentSingle:",  [v45 unsignedCharValue]);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentLeft"];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = [v46 unsignedCharValue];

  uint64_t v48 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentLeft"];
  if (v48)
  {
    v49 = (void *)v48;
    int v50 = -[CBClassicPeer batteryPercentLeft](self, "batteryPercentLeft");

    if (v50 != (_DWORD)v47) {
      -[CBClassicPeer setBatteryPercentLeft:](self, "setBatteryPercentLeft:", v47);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentRight"];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = [v51 unsignedCharValue];

  uint64_t v53 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentRight"];
  if (v53)
  {
    v54 = (void *)v53;
    int v55 = -[CBClassicPeer batteryPercentRight](self, "batteryPercentRight");

    if (v55 != (_DWORD)v52) {
      -[CBClassicPeer setBatteryPercentRight:](self, "setBatteryPercentRight:", v52);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentCase"];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v57 = [v56 unsignedCharValue];

  uint64_t v58 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentCase"];
  if (v58)
  {
    v59 = (void *)v58;
    int v60 = -[CBClassicPeer batteryPercentCase](self, "batteryPercentCase");

    if (v60 != (_DWORD)v57) {
      -[CBClassicPeer setBatteryPercentCase:](self, "setBatteryPercentCase:", v57);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentCombined"];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v62 = [v61 unsignedCharValue];

  uint64_t v63 = [v4 objectForKeyedSubscript:@"kCBMsgArgBatteryPercentCombined"];
  if (v63)
  {
    v64 = (void *)v63;
    int v65 = -[CBClassicPeer batteryPercentCombined](self, "batteryPercentCombined");

    if (v65 != (_DWORD)v62) {
      -[CBClassicPeer setBatteryPercentCombined:](self, "setBatteryPercentCombined:", v62);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgListeningMode"];
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  int v67 = [v66 unsignedCharValue];

  uint64_t v68 = [v4 objectForKeyedSubscript:@"kCBMsgArgListeningMode"];
  if (v68)
  {
    v69 = (void *)v68;
    int v70 = -[CBClassicPeer listeningMode](self, "listeningMode");

    if (v70 != v67)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"listeningMode");
      self->_listeningMode = v67;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"listeningMode");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgListeningConfigs"];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v72 = [v71 unsignedIntValue];

  uint64_t v73 = [v4 objectForKeyedSubscript:@"kCBMsgArgListeningConfigs"];
  if (v73)
  {
    v74 = (void *)v73;
    unsigned int v75 = -[CBClassicPeer listeningModeConfigs](self, "listeningModeConfigs");

    if (v75 != v72)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"listeningModeConfigs");
      self->_listeningModeConfigs = v72;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"listeningModeConfigs");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgLRDetectionModeEnabled"];
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  int v77 = [v76 BOOLValue];

  uint64_t v78 = [v4 objectForKeyedSubscript:@"kCBMsgArgLRDetectionModeEnabled"];
  if (v78)
  {
    v79 = (void *)v78;
    int v80 = -[CBClassicPeer LRDetectionEnabled](self, "LRDetectionEnabled");

    if (v77 != v80)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"LRDetectionEnabled");
      self->_LRDetectionEnabled = v77;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"LRDetectionEnabled");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgEQModeEnabled"];
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  int v82 = [v81 BOOLValue];

  uint64_t v83 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQModeEnabled"];
  if (v83)
  {
    v84 = (void *)v83;
    int v85 = -[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled");

    if (v82 != v85)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"EQConfigEnabled");
      self->_EQConfigEnabled = v82;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"EQConfigEnabled");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgEQTreble"];
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  int v87 = [v86 unsignedCharValue];

  uint64_t v88 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQTreble"];
  if (v88)
  {
    v89 = (void *)v88;
    int v90 = -[CBClassicPeer EQConfigTreble](self, "EQConfigTreble");

    if (v90 != v87)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"EQConfigTreble");
      self->_EQConfigTreble = v87;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"EQConfigTreble");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgEQMid"];
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  int v92 = [v91 unsignedCharValue];

  uint64_t v93 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQMid"];
  if (v93)
  {
    v94 = (void *)v93;
    int v95 = -[CBClassicPeer EQConfigMid](self, "EQConfigMid");

    if (v95 != v92)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"EQConfigMid");
      self->_EQConfigMid = v92;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"EQConfigMid");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgEQBass"];
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  int v97 = [v96 unsignedCharValue];

  uint64_t v98 = [v4 objectForKeyedSubscript:@"kCBMsgArgEQBass"];
  if (v98)
  {
    v99 = (void *)v98;
    int v100 = -[CBClassicPeer EQConfigBass](self, "EQConfigBass");

    if (v100 != v97)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"EQConfigBass");
      self->_EQConfigBass = v97;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"EQConfigBass");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgAutoAnswerCalls"];
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  int v102 = [v101 BOOLValue];

  uint64_t v103 = [v4 objectForKeyedSubscript:@"kCBMsgArgAutoAnswerCalls"];
  if (v103)
  {
    v104 = (void *)v103;
    int v105 = -[CBClassicPeer autoAnswerCalls](self, "autoAnswerCalls");

    if (v102 != v105)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"autoAnswerCalls");
      self->_autoAnswerCalls = v102;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"autoAnswerCalls");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgCrownRotationDirection"];
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  int v107 = [v106 unsignedCharValue];

  uint64_t v108 = [v4 objectForKeyedSubscript:@"kCBMsgArgCrownRotationDirection"];
  if (v108)
  {
    v109 = (void *)v108;
    int v110 = -[CBClassicPeer crownRotationDirection](self, "crownRotationDirection");

    if (v110 != v107)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"crownRotationDirection");
      self->_crownRotationDirection = v107;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"crownRotationDirection");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgSingleClickMode"];
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  int v112 = [v111 unsignedCharValue];

  uint64_t v113 = [v4 objectForKeyedSubscript:@"kCBMsgArgSingleClickMode"];
  if (v113)
  {
    v114 = (void *)v113;
    int v115 = -[CBClassicPeer singleClickMode](self, "singleClickMode");

    if (v115 != v112)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"singleClickMode");
      self->_singleClickMode = v112;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"singleClickMode");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleClickMode"];
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  int v117 = [v116 unsignedCharValue];

  uint64_t v118 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleClickMode"];
  if (v118)
  {
    v119 = (void *)v118;
    int v120 = -[CBClassicPeer doubleClickMode](self, "doubleClickMode");

    if (v120 != v117)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"doubleClickMode");
      self->_doubleClickMode = v117;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"doubleClickMode");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgClickHoldMode"];
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  if (v121)
  {
    [v4 objectForKeyedSubscript:@"kCBMsgArgClickHoldMode"];
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v123 = [v122 unsignedIntValue];

    if (-[CBClassicPeer clickHoldModeLeft](self, "clickHoldModeLeft") != HIBYTE(v123))
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"clickHoldModeLeft");
      self->_clickHoldModeLeft = HIBYTE(v123);
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"clickHoldModeLeft");
    }

    if (-[CBClassicPeer clickHoldModeRight](self, "clickHoldModeRight") != v123)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"clickHoldModeRight");
      self->_clickHoldModeRight = v123;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"clickHoldModeRight");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleClickInterval"];
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v125 = [v124 unsignedIntValue];

  uint64_t v126 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleClickInterval"];
  if (v126)
  {
    v127 = (void *)v126;
    unsigned int v128 = -[CBClassicPeer doubleClickInterval](self, "doubleClickInterval");

    if (v128 != v125)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"doubleClickInterval");
      self->_doubleClickInterval = v125;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"doubleClickInterval");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgClickHoldInterval"];
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v130 = [v129 unsignedIntValue];

  uint64_t v131 = [v4 objectForKeyedSubscript:@"kCBMsgArgClickHoldInterval"];
  if (v131)
  {
    v132 = (void *)v131;
    unsigned int v133 = -[CBClassicPeer clickHoldInterval](self, "clickHoldInterval");

    if (v133 != v130)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"clickHoldInterval");
      self->_clickHoldInterval = v130;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"clickHoldInterval");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgOneBudANCMode"];
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  int v135 = [v134 unsignedCharValue];

  uint64_t v136 = [v4 objectForKeyedSubscript:@"kCBMsgArgOneBudANCMode"];
  if (v136)
  {
    v137 = (void *)v136;
    int v138 = -[CBClassicPeer oneBudANCMode](self, "oneBudANCMode");

    if (v138 != v135)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"oneBudANCMode");
      self->_oneBudANCMode = v135;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"oneBudANCMode");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgSwitchControlMode"];
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  int v140 = [v139 unsignedCharValue];

  uint64_t v141 = [v4 objectForKeyedSubscript:@"kCBMsgArgSwitchControlMode"];
  if (v141)
  {
    v142 = (void *)v141;
    int v143 = -[CBClassicPeer switchControlMode](self, "switchControlMode");

    if (v143 != v140)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"switchControlMode");
      self->_switchControlMode = v140;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"switchControlMode");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapAction"];
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  if (v144)
  {
    [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapAction"];
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    int v146 = [v145 unsignedIntValue];

    if (v146 != -[CBClassicPeer doubleTapAction](self, "doubleTapAction"))
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"doubleTapAction");
      self->_doubleTapAction = v146;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"doubleTapAction");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapActionEx"];
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  if (v147)
  {
    [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapActionEx"];
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v149 = [v148 unsignedIntValue];

    if (-[CBClassicPeer doubleTapActionLeft](self, "doubleTapActionLeft") != (unsigned __int16)(v149 >> 8))
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"doubleTapActionLeft");
      self->_doubleTapActionLeft = v149 >> 8;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"doubleTapActionLeft");
    }

    if (-[CBClassicPeer doubleTapActionRight](self, "doubleTapActionRight") != v149)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"doubleTapActionRight");
      self->_doubleTapActionRight = v149;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"doubleTapActionRight");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapCapability"];
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v151 = [v150 unsignedCharValue];

  uint64_t v152 = [v4 objectForKeyedSubscript:@"kCBMsgArgDoubleTapCapability"];
  if (v152)
  {
    v153 = (void *)v152;
    int v154 = -[CBClassicPeer doubleTapCapability](self, "doubleTapCapability");

    if (v154 != (_DWORD)v151) {
      -[CBClassicPeer setDoubleTapCapability:](self, "setDoubleTapCapability:", v151);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgMicMode"];
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  int v156 = [v155 unsignedCharValue];

  uint64_t v157 = [v4 objectForKeyedSubscript:@"kCBMsgArgMicMode"];
  if (v157)
  {
    v158 = (void *)v157;
    int v159 = -[CBClassicPeer micMode](self, "micMode");

    if (v159 != v156)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"micMode");
      self->_micMode = v156;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"micMode");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgInEarDetectionEnabled"];
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  int v161 = [v160 BOOLValue];

  uint64_t v162 = [v4 objectForKeyedSubscript:@"kCBMsgArgInEarDetectionEnabled"];
  if (v162)
  {
    v163 = (void *)v162;
    int v164 = -[CBClassicPeer inEarDetectionEnabled](self, "inEarDetectionEnabled");

    if (v161 != v164)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"inEarDetectionEnabled");
      self->_inEarDetectionEnabled = v161;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"inEarDetectionEnabled");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgSmartRoutingSupported"];
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  int v166 = [v165 BOOLValue];

  uint64_t v167 = [v4 objectForKeyedSubscript:@"kCBMsgArgSmartRoutingSupported"];
  if (v167)
  {
    v168 = (void *)v167;
    int v169 = -[CBClassicPeer smartRoutingSupported](self, "smartRoutingSupported");

    if (v166 != v169)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"smartRoutingSupported");
      self->_smartRoutingSupported = v166;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"smartRoutingSupported");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgSmartRoutingEnabled"];
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  int v171 = [v170 unsignedCharValue];

  uint64_t v172 = [v4 objectForKeyedSubscript:@"kCBMsgArgSmartRoutingEnabled"];
  if (v172)
  {
    v173 = (void *)v172;
    int v174 = -[CBClassicPeer smartRoutingEnabled](self, "smartRoutingEnabled");

    if (v174 != v171)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"smartRoutingEnabled");
      self->_smartRoutingEnabled = v171;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"smartRoutingEnabled");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgRemoteTimeSyncEnabled"];
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  int v176 = [v175 BOOLValue];

  uint64_t v177 = [v4 objectForKeyedSubscript:@"kCBMsgArgRemoteTimeSyncEnabled"];
  if (v177)
  {
    v178 = (void *)v177;
    int v179 = -[CBClassicPeer remoteTimeSyncEnabled](self, "remoteTimeSyncEnabled");

    if (v176 != v179)
    {
      -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"remoteTimeSyncEnabled");
      self->_remoteTimeSyncEnabled = v176;
      -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"remoteTimeSyncEnabled");
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgPrimaryInEarStatus"];
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v181 = [v180 unsignedCharValue];

  uint64_t v182 = [v4 objectForKeyedSubscript:@"kCBMsgArgPrimaryInEarStatus"];
  if (v182)
  {
    v183 = (void *)v182;
    int v184 = -[CBClassicPeer primaryInEarStatus](self, "primaryInEarStatus");

    if (v184 != (_DWORD)v181) {
      -[CBClassicPeer setPrimaryInEarStatus:](self, "setPrimaryInEarStatus:", v181);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgSecondaryInEarStatus"];
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v186 = [v185 unsignedCharValue];

  uint64_t v187 = [v4 objectForKeyedSubscript:@"kCBMsgArgSecondaryInEarStatus"];
  if (v187)
  {
    v188 = (void *)v187;
    int v189 = -[CBClassicPeer secondaryInEarStatus](self, "secondaryInEarStatus");

    if (v189 != (_DWORD)v186) {
      -[CBClassicPeer setSecondaryInEarStatus:](self, "setSecondaryInEarStatus:", v186);
    }
  }

  uint64_t v190 = [v4 objectForKeyedSubscript:@"kCBMsgArgServices"];
  if (v190)
  {
    v191 = -[CBClassicPeer importServices:](self, "importServices:", v190);
    -[CBClassicPeer setServices:](self, "setServices:", v191);
  }

  uint64_t v192 = [v4 objectForKeyedSubscript:@"kCBMsgArgSDPRecordData"];
  if (v192) {
    -[CBClassicPeer setSdpRecordData:](self, "setSdpRecordData:", v192);
  }
  v283 = (void *)v192;
  uint64_t v193 = [v4 objectForKeyedSubscript:@"kCBMsgArgAACPCapabilityBits"];
  if (v193)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    v194 = (os_log_s *)(id)CBLogComponent;
    if (os_log_type_enabled(v194, OS_LOG_TYPE_DEBUG)) {
      -[CBClassicPeer handlePeerUpdated:].cold.2(self, v193, v194);
    }

    -[CBClassicPeer setAacpCapabilityBits:](self, "setAacpCapabilityBits:", v193);
  }

  v282 = (void *)v193;
  [v4 objectForKeyedSubscript:@"kCBMsgArgAppleFeatureBitMask"];
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v196 = [v195 unsignedLongValue];

  uint64_t v197 = [v4 objectForKeyedSubscript:@"kCBMsgArgAppleFeatureBitMask"];
  if (v197)
  {
    v198 = (void *)v197;
    unsigned int v199 = -[CBClassicPeer appleFeatureBitMask](self, "appleFeatureBitMask");

    if (v199 != (_DWORD)v196) {
      -[CBClassicPeer setAppleFeatureBitMask:](self, "setAppleFeatureBitMask:", v196);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgExtendedAppleFeatureBitMask"];
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v201 = [v200 unsignedLongLongValue];

  uint64_t v202 = [v4 objectForKeyedSubscript:@"kCBMsgArgExtendedAppleFeatureBitMask"];
  if (v202)
  {
    v203 = (void *)v202;
    unint64_t v204 = -[CBClassicPeer appleExtendedFeatureBitMask](self, "appleExtendedFeatureBitMask");

    if (v204 != v201) {
      -[CBClassicPeer setAppleExtendedFeatureBitMask:](self, "setAppleExtendedFeatureBitMask:", v201);
    }
  }

  uint64_t v205 = [v4 objectForKeyedSubscript:@"kCBMsgArgRssi"];
  if (v205)
  {
    v206 = -[CBClassicPeer RSSI](self, "RSSI");
    char v207 = [v206 isEqualToNumber:v205];

    if ((v207 & 1) == 0) {
      -[CBClassicPeer setRSSI:](self, "setRSSI:", v205);
    }
  }

  v281 = (void *)v205;
  [v4 objectForKeyedSubscript:@"kCBMsgArgSerialNumber"];
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  if (v208)
  {
    v209 = -[CBClassicPeer serialNumber](self, "serialNumber");
    char v210 = [v208 isEqualToString:v209];

    if ((v210 & 1) == 0) {
      -[CBClassicPeer setSerialNumber:](self, "setSerialNumber:", v208);
    }
  }

  v280 = v208;
  [v4 objectForKeyedSubscript:@"kCBMsgArgTrustedUID"];
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = v211;
  if (v211)
  {
    [v211 UUIDString];
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    v214 = -[CBClassicPeer trustedUID](self, "trustedUID");
    [v214 UUIDString];
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    char v216 = [v213 isEqualToString:v215];

    if ((v216 & 1) == 0) {
      -[CBClassicPeer setTrustedUID:](self, "setTrustedUID:", v212);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgIsIncoming"];
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v218 = [v217 BOOLValue];

  uint64_t v219 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsIncoming"];
  if (v219)
  {
    v220 = (void *)v219;
    int v221 = -[CBClassicPeer isIncoming](self, "isIncoming");

    if ((_DWORD)v218 != v221) {
      -[CBClassicPeer setIsIncoming:](self, "setIsIncoming:", v218);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgInternalState"];
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v223 = [v222 integerValue];

  uint64_t v224 = [v4 objectForKeyedSubscript:@"kCBMsgArgInternalState"];
  if (v224)
  {
    v225 = (void *)v224;
    int64_t v226 = -[CBClassicPeer internalState](self, "internalState");

    if (v226 != v223) {
      -[CBClassicPeer setInternalState:](self, "setInternalState:", v223);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionHandle"];
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v228 = [v227 unsignedShortValue];

  uint64_t v229 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionHandle"];
  if (v229)
  {
    v230 = (void *)v229;
    int v231 = -[CBClassicPeer connectionHandle](self, "connectionHandle");

    if (v231 != (_DWORD)v228) {
      -[CBClassicPeer setConnectionHandle:](self, "setConnectionHandle:", v228);
    }
  }

  uint64_t v232 = [v4 objectForKeyedSubscript:@"kCBMsgArgAddressString"];
  if (v232)
  {
    v233 = -[CBClassicPeer addressString](self, "addressString");
    char v234 = [v233 isEqualToString:v232];

    if ((v234 & 1) == 0) {
      -[CBClassicPeer setAddressString:](self, "setAddressString:", v232);
    }
  }

  v278 = (void *)v232;
  [v4 objectForKeyedSubscript:@"kCBMsgArgModesSupported"];
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v236 = [v235 unsignedCharValue];

  uint64_t v237 = [v4 objectForKeyedSubscript:@"kCBMsgArgModesSupported"];
  if (v237)
  {
    v238 = (void *)v237;
    int v239 = -[CBClassicPeer modeSupported](self, "modeSupported");

    if (v239 != (_DWORD)v236) {
      -[CBClassicPeer setModeSupported:](self, "setModeSupported:", v236);
    }
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v241 = (uint64_t)v240;
  v284 = (void *)v190;
  if (v240 && ![v240 length])
  {

    uint64_t v241 = 0LL;
    v245 = -[CBClassicPeer name](self, "name");
    if (v245)
    {
LABEL_165:
      if (!v241) {
        goto LABEL_174;
      }
      goto LABEL_172;
    }
  }

  else
  {
    uint64_t v242 = -[CBClassicPeer name](self, "name");
    uint64_t v243 = v241 | v242;

    if (v243) {
      goto LABEL_165;
    }
  }
  v244 = -[CBClassicPeer addressString](self, "addressString");
  if (v244)
  {
    uint64_t v241 = -[CBClassicPeer addressString](self, "addressString");
    goto LABEL_165;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  v246 = (os_log_s *)(id)CBLogComponent;
  if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR)) {
    -[CBClassicPeer handlePeerUpdated:].cold.1(v246, v247, v248, v249, v250, v251, v252, v253);
  }

  uint64_t v241 = (uint64_t)&stru_189FB61A8;
LABEL_172:
  v254 = -[CBClassicPeer name](self, "name");
  char v255 = [(id)v241 isEqual:v254];

  if ((v255 & 1) == 0)
  {
    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"name");
    objc_storeStrong((id *)&self->_name, (id)v241);
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"name");
  }

- (void)handleSuccessfulConnection:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgIsLinkEncrypted"];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionTransport"];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgIsIncoming"];
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgServices"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgSDPRecordData"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    -[CBClassicPeer setSdpRecordData:](self, "setSdpRecordData:", v8);
  }
  if (v7)
  {
    -[CBClassicPeer importServices:](self, "importServices:", v7);
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer setServices:](self, "setServices:", v9);
  }

  -[CBPeer setIsLinkEncrypted:](self, "setIsLinkEncrypted:", [v10 BOOLValue]);
  -[CBPeer setConnectedTransport:]( self,  "setConnectedTransport:",  [v5 unsignedIntegerValue]);
  -[CBClassicPeer setIsIncoming:](self, "setIsIncoming:", [v6 BOOLValue]);
  -[CBClassicPeer setState:](self, "setState:", 2LL);
}

- (void)handleFailedConnection
{
}

- (void)handleDisconnection
{
}

- (void)handleL2CAPChannelOpened:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189607870] errorWithInfo:v4];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    {
      -[CBClassicPeer handleL2CAPChannelOpened:].cold.1();
      unsigned __int8 v6 = 0LL;
      -[CBClassicPeer connectL2CAPCallback](self, "connectL2CAPCallback");
      unsigned __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16) {
        goto LABEL_13;
      }
    }

    else
    {
      unsigned __int8 v6 = 0LL;
      -[CBClassicPeer connectL2CAPCallback](self, "connectL2CAPCallback");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7) {
        goto LABEL_13;
      }
    }

    goto LABEL_12;
  }

  unsigned __int8 v6 = -[CBL2CAPChannel initWithPeer:info:](objc_alloc(&OBJC_CLASS___CBL2CAPChannel), "initWithPeer:info:", self, v4);
  [v4 objectForKey:@"kCBMsgArgPSM"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 unsignedCharValue];

  -[CBClassicPeer serviceForPSM:](self, "serviceForPSM:", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
  unsigned __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBL2CAPChannel setServiceUUID:](v6, "setServiceUUID:", v11);

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  uint64_t v12 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    v18 = "-[CBClassicPeer handleL2CAPChannelOpened:]";
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_186F9B000, v12, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v17, 0x16u);
  }
  v13 = -[CBClassicPeer L2CAPChannels](self, "L2CAPChannels");
  [v13 addObject:v6];

  -[CBClassicPeer connectL2CAPCallback](self, "connectL2CAPCallback");
  int v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_12:
    -[CBClassicPeer connectL2CAPCallback](self, "connectL2CAPCallback");
    uint64_t v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, CBL2CAPChannel *, uint64_t))v15)[2](v15, v6, [v5 code]);
  }

- (void)handleL2CAPChannelClosed:(id)a3
{
  id v4 = (void *)MEMORY[0x189607870];
  id v5 = a3;
  [v4 errorWithInfo:v5];
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:@"kCBMsgArgPSM"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v7 unsignedShortValue];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  uint64_t v9 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicPeer handleL2CAPChannelClosed:].cold.1(v8, (uint64_t)v6, v9);
  }
  -[CBClassicPeer channelWithPSM:](self, "channelWithPSM:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBClassicPeer disconnectL2CAPCallback](self, "disconnectL2CAPCallback");
  unsigned __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CBClassicPeer disconnectL2CAPCallback](self, "disconnectL2CAPCallback");
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v10, [v6 code]);
  }
  v13 = -[CBClassicPeer L2CAPChannels](self, "L2CAPChannels");
  [v13 removeObject:v10];
}

- (id)channelWithPSM:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  -[CBClassicPeer L2CAPChannels](self, "L2CAPChannels", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 PSM] == v3)
        {
          id v11 = v9;

          return v11;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBClassicPeer channelWithPSM:].cold.1();
  }
  return 0LL;
}

- (void)handleRFCOMMChannelOpened:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189607870] errorWithInfo:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    uint64_t v6 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    {
      -[CBClassicPeer handleRFCOMMChannelOpened:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
      __int128 v14 = 0LL;
      v20 = -[CBClassicPeer connectRFCOMMCallback](self, "connectRFCOMMCallback");
      if (!v20) {
        goto LABEL_13;
      }
    }

    else
    {
      __int128 v14 = 0LL;
      -[CBClassicPeer connectRFCOMMCallback](self, "connectRFCOMMCallback");
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15) {
        goto LABEL_13;
      }
    }

    goto LABEL_12;
  }

  __int128 v14 = -[CBRFCOMMChannel initWithPeer:info:](objc_alloc(&OBJC_CLASS___CBRFCOMMChannel), "initWithPeer:info:", self, v4);
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  unsigned __int16 v16 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    uint64_t v22 = "-[CBClassicPeer handleRFCOMMChannelOpened:]";
    __int16 v23 = 2112;
    int v24 = v14;
    _os_log_impl(&dword_186F9B000, v16, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v21, 0x16u);
  }

  -[CBClassicPeer RFCOMMChannels](self, "RFCOMMChannels");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 addObject:v14];
  v18 = -[CBClassicPeer connectRFCOMMCallback](self, "connectRFCOMMCallback");
  if (v18)
  {
LABEL_12:
    -[CBClassicPeer connectRFCOMMCallback](self, "connectRFCOMMCallback");
    __int16 v19 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, CBRFCOMMChannel *, uint64_t))v19)[2](v19, v14, [v5 code]);
  }

- (void)handleRFCOMMChannelClosed:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = (void *)MEMORY[0x189607870];
  id v5 = a3;
  [v4 errorWithInfo:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:@"kCBMsgArgRFCOMMChannelID"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v7 unsignedCharValue];
  -[CBClassicPeer channelWithID:](self, "channelWithID:", v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  uint64_t v10 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    __int128 v15 = "-[CBClassicPeer handleRFCOMMChannelClosed:]";
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    __int16 v19 = v6;
    _os_log_impl(&dword_186F9B000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ and result: %@", (uint8_t *)&v14, 0x20u);
  }

  -[CBClassicPeer disconnectRFCOMMCallback](self, "disconnectRFCOMMCallback");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CBClassicPeer disconnectRFCOMMCallback](self, "disconnectRFCOMMCallback");
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v9, [v6 code]);
  }

  -[CBClassicPeer RFCOMMChannels](self, "RFCOMMChannels");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 removeObject:v9];
}

- (id)channelWithID:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  -[CBClassicPeer RFCOMMChannels](self, "RFCOMMChannels", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 channelID] == v3)
        {
          id v11 = v9;

          return v11;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBClassicPeer channelWithID:].cold.1();
  }
  return 0LL;
}

- (void)setOrphan
{
}

- (id)service:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  -[CBClassicPeer services](self, "services", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v10 objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = [v11 isEqual:v4];

        if ((v12 & 1) != 0)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = 0LL;
LABEL_11:

  return v13;
}

- (id)serviceForPSM:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[CBClassicPeer services](self, "services", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v9 objectForKeyedSubscript:@"kCBMsgArgPSM"];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v11 = [v10 unsignedShortValue];

        if (v11 == v3)
        {
          id v12 = v9;
          goto LABEL_11;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_11:

  return v12;
}

- (unsigned)psmForService:(id)a3
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 objectForKeyedSubscript:@"kCBMsgArgPSM"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned __int16 v6 = [v5 unsignedShortValue];

    return v6;
  }

  else
  {

    return 0;
  }

- (id)serviceForRFCOMMChannelID:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[CBClassicPeer services](self, "services", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v9 objectForKeyedSubscript:@"kCBMsgArgRFCOMMChannelID"];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v11 = [v10 unsignedCharValue];

        if (v11 == v3)
        {
          id v12 = v9;
          goto LABEL_11;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_11:

  return v12;
}

- (unsigned)rfcommChannelIDForService:(id)a3
{
  id v4 = a3;
  if (v4
    && (-[CBClassicPeer service:](self, "service:", v4), (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    uint64_t v6 = v5;
    [v5 objectForKeyedSubscript:@"kCBMsgArgRFCOMMChannelID"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v8 = [v7 unsignedShortValue];

    return v8;
  }

  else
  {

    return 0;
  }

- (void)setListeningMode:(unsigned __int8)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer listeningMode](self, "listeningMode") != a3)
  {
    uint64_t v7 = @"kCBMsgArgListeningMode";
    [MEMORY[0x189607968] numberWithChar:(char)a3];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"listeningMode");
    self->_listeningMode = a3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"listeningMode");
  }

- (void)setListeningModeConfigs:(unsigned int)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer listeningModeConfigs](self, "listeningModeConfigs") != a3)
  {
    uint64_t v7 = @"kCBMsgArgListeningConfigs";
    [MEMORY[0x189607968] numberWithChar:(char)a3];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"listeningModeConfigs");
    self->_listeningModeConfigs = a3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"listeningModeConfigs");
  }

- (void)setLRDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer LRDetectionEnabled](self, "LRDetectionEnabled") != a3)
  {
    uint64_t v7 = @"kCBMsgArgLRDetectionModeEnabled";
    [MEMORY[0x189607968] numberWithBool:v3];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"LRDetectionEnabled");
    self->_LRDetectionEnabled = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"LRDetectionEnabled");
  }

- (void)setEQConfigEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v11[4] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled") != a3)
  {
    v10[0] = @"kCBMsgArgEQModeEnabled";
    [MEMORY[0x189607968] numberWithBool:v3];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v10[1] = @"kCBMsgArgEQTreble";
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedChar:",  -[CBClassicPeer EQConfigTreble](self, "EQConfigTreble"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = @"kCBMsgArgEQMid";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigMid](self, "EQConfigMid"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    v10[3] = @"kCBMsgArgEQBass";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigBass](self, "EQConfigBass"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:4];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v9);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"EQConfigEnabled");
    self->_EQConfigEnabled = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"EQConfigEnabled");
  }

- (void)setEQConfigTreble:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v11[4] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer EQConfigTreble](self, "EQConfigTreble") != a3)
  {
    v10[0] = @"kCBMsgArgEQModeEnabled";
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v10[1] = @"kCBMsgArgEQTreble";
    [MEMORY[0x189607968] numberWithUnsignedChar:v3];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = @"kCBMsgArgEQMid";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigMid](self, "EQConfigMid"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    v10[3] = @"kCBMsgArgEQBass";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigBass](self, "EQConfigBass"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:4];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v9);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"EQConfigTreble");
    self->_EQConfigTreble = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"EQConfigTreble");
  }

- (void)setEQConfigMid:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v11[4] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer EQConfigMid](self, "EQConfigMid") != a3)
  {
    v10[0] = @"kCBMsgArgEQModeEnabled";
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v10[1] = @"kCBMsgArgEQTreble";
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedChar:",  -[CBClassicPeer EQConfigTreble](self, "EQConfigTreble"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = @"kCBMsgArgEQMid";
    [MEMORY[0x189607968] numberWithUnsignedChar:v3];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    v10[3] = @"kCBMsgArgEQBass";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigBass](self, "EQConfigBass"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:4];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v9);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"EQConfigMid");
    self->_EQConfigMid = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"EQConfigMid");
  }

- (void)setEQConfigBass:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v11[4] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer EQConfigBass](self, "EQConfigBass") != a3)
  {
    v10[0] = @"kCBMsgArgEQModeEnabled";
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[CBClassicPeer EQConfigEnabled](self, "EQConfigEnabled"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v10[1] = @"kCBMsgArgEQTreble";
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedChar:",  -[CBClassicPeer EQConfigTreble](self, "EQConfigTreble"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = @"kCBMsgArgEQMid";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:", -[CBClassicPeer EQConfigMid](self, "EQConfigMid"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    v10[3] = @"kCBMsgArgEQBass";
    [MEMORY[0x189607968] numberWithUnsignedChar:v3];
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:4];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v9);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"EQConfigBass");
    self->_EQConfigBass = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"EQConfigBass");
  }

- (void)setAutoAnswerCalls:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer autoAnswerCalls](self, "autoAnswerCalls") != a3)
  {
    uint64_t v7 = @"kCBMsgArgAutoAnswerCalls";
    [MEMORY[0x189607968] numberWithBool:v3];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"autoAnswerCalls");
    self->_autoAnswerCalls = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"autoAnswerCalls");
  }

- (void)setCrownRotationDirection:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer crownRotationDirection](self, "crownRotationDirection") != a3)
  {
    uint64_t v7 = @"kCBMsgArgCrownRotationDirection";
    [MEMORY[0x189607968] numberWithUnsignedChar:v3];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"crownRotationDirection");
    self->_crownRotationDirection = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"crownRotationDirection");
  }

- (void)setSingleClickMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer singleClickMode](self, "singleClickMode") != a3)
  {
    uint64_t v7 = @"kCBMsgArgSingleClickMode";
    [MEMORY[0x189607968] numberWithUnsignedChar:v3];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"singleClickMode");
    self->_singleClickMode = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"singleClickMode");
  }

- (void)setDoubleClickMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer doubleClickMode](self, "doubleClickMode") != a3)
  {
    uint64_t v7 = @"kCBMsgArgDoubleClickMode";
    [MEMORY[0x189607968] numberWithUnsignedChar:v3];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"doubleClickMode");
    self->_doubleClickMode = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"doubleClickMode");
  }

- (void)setClickHoldModeLeft:(unsigned __int8)a3
{
  int v3 = a3;
  v9[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer clickHoldModeLeft](self, "clickHoldModeLeft") != a3)
  {
    int v5 = -[CBClassicPeer clickHoldModeRight](self, "clickHoldModeRight");
    unsigned __int8 v8 = @"kCBMsgArgClickHoldMode";
    [MEMORY[0x189607968] numberWithUnsignedInt:v5 | (v3 << 8)];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v7);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"clickHoldModeLeft");
    self->_clickHoldModeLeft = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"clickHoldModeLeft");
  }

- (void)setClickHoldModeRight:(unsigned __int8)a3
{
  int v3 = a3;
  v9[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer clickHoldModeRight](self, "clickHoldModeRight") != a3)
  {
    int v5 = -[CBClassicPeer clickHoldModeLeft](self, "clickHoldModeLeft");
    unsigned __int8 v8 = @"kCBMsgArgClickHoldMode";
    [MEMORY[0x189607968] numberWithUnsignedInt:v3 | (v5 << 8)];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v7);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"clickHoldModeRight");
    self->_clickHoldModeRight = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"clickHoldModeRight");
  }

- (void)setDoubleClickInterval:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer doubleClickInterval](self, "doubleClickInterval") != a3)
  {
    uint64_t v7 = @"kCBMsgArgDoubleClickInterval";
    [MEMORY[0x189607968] numberWithUnsignedInt:v3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"doubleClickInterval");
    self->_doubleClickInterval = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"doubleClickInterval");
  }

- (void)setClickHoldInterval:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer clickHoldInterval](self, "clickHoldInterval") != a3)
  {
    uint64_t v7 = @"kCBMsgArgClickHoldInterval";
    [MEMORY[0x189607968] numberWithUnsignedInt:v3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"clickHoldInterval");
    self->_clickHoldInterval = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"clickHoldInterval");
  }

- (void)setOneBudANCMode:(unsigned __int8)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer oneBudANCMode](self, "oneBudANCMode") != a3)
  {
    uint64_t v7 = @"kCBMsgArgOneBudANCMode";
    [MEMORY[0x189607968] numberWithChar:(char)a3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"oneBudANCMode");
    self->_oneBudANCMode = a3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"oneBudANCMode");
  }

- (void)setSwitchControlMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer switchControlMode](self, "switchControlMode") != a3)
  {
    uint64_t v7 = @"kCBMsgArgSwitchControlMode";
    [MEMORY[0x189607968] numberWithUnsignedChar:v3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"switchControlMode");
    self->_switchControlMode = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"switchControlMode");
  }

- (void)setDoubleTapAction:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer doubleTapAction](self, "doubleTapAction") != a3)
  {
    uint64_t v7 = @"kCBMsgArgDoubleTapAction";
    [MEMORY[0x189607968] numberWithUnsignedInt:v3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"doubleTapAction");
    self->_doubleTapAction = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"doubleTapAction");
  }

- (void)setDoubleTapActionLeft:(unsigned __int16)a3
{
  int v3 = a3;
  v9[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer doubleTapActionLeft](self, "doubleTapActionLeft") != a3)
  {
    int v5 = -[CBClassicPeer doubleTapActionRight](self, "doubleTapActionRight");
    unsigned __int8 v8 = @"kCBMsgArgDoubleTapActionEx";
    [MEMORY[0x189607968] numberWithUnsignedInt:v5 | (v3 << 8)];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v7);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"doubleTapActionLeft");
    self->_doubleTapActionLeft = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"doubleTapActionLeft");
  }

- (void)setDoubleTapActionRight:(unsigned __int16)a3
{
  int v3 = a3;
  v9[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer doubleTapActionRight](self, "doubleTapActionRight") != a3)
  {
    int v5 = -[CBClassicPeer doubleTapActionLeft](self, "doubleTapActionLeft");
    unsigned __int8 v8 = @"kCBMsgArgDoubleTapActionEx";
    [MEMORY[0x189607968] numberWithUnsignedInt:v3 | (v5 << 8)];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v7);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"doubleTapActionRight");
    self->_doubleTapActionRight = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"doubleTapActionRight");
  }

- (void)setMicMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer micMode](self, "micMode") != a3)
  {
    uint64_t v7 = @"kCBMsgArgMicMode";
    [MEMORY[0x189607968] numberWithUnsignedChar:v3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"micMode");
    self->_micMode = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"micMode");
  }

- (void)setInEarDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer inEarDetectionEnabled](self, "inEarDetectionEnabled") != a3)
  {
    uint64_t v7 = @"kCBMsgArgInEarDetectionEnabled";
    [MEMORY[0x189607968] numberWithBool:v3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"inEarDetectionEnabled");
    self->_inEarDetectionEnabled = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"inEarDetectionEnabled");
  }

- (void)setSmartRoutingEnabled:(unsigned __int8)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer smartRoutingEnabled](self, "smartRoutingEnabled") != a3)
  {
    uint64_t v7 = @"kCBMsgArgSmartRoutingEnabled";
    [MEMORY[0x189607968] numberWithChar:(char)a3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"smartRoutingEnabled");
    self->_smartRoutingEnabled = a3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"smartRoutingEnabled");
  }

- (void)setSmartRoutingSupported:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer smartRoutingSupported](self, "smartRoutingSupported") != a3)
  {
    uint64_t v7 = @"kCBMsgArgSmartRoutingSupported";
    [MEMORY[0x189607968] numberWithBool:v3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"smartRoutingSupported");
    self->_smartRoutingSupported = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"smartRoutingSupported");
  }

- (void)setRemoteTimeSyncEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer remoteTimeSyncEnabled](self, "remoteTimeSyncEnabled") != a3)
  {
    uint64_t v7 = @"kCBMsgArgRemoteTimeSyncEnabled";
    [MEMORY[0x189607968] numberWithBool:v3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v6);

    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"remoteTimeSyncEnabled");
    self->_remoteTimeSyncEnabled = v3;
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"remoteTimeSyncEnabled");
  }

- (unsigned)getConnectedServices
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (-[CBClassicPeer internalState](self, "internalState") == 2)
  {
    -[CBPeer manager](self, "manager");
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = @"kCBMsgArgDeviceUUID";
    -[CBPeer identifier](self, "identifier");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 sendSyncMsg:58 args:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 objectForKeyedSubscript:@"kCBMsgArgConnectedServices"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v8 = [v7 unsignedIntValue];
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    uint64_t v9 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBClassicPeer getConnectedServices].cold.1(v9, self);
    }
    return 0;
  }

  return v8;
}

- (BOOL)isAppleDevice
{
  if (-[CBClassicPeer vendorIDSource](self, "vendorIDSource") == 2
    && -[CBClassicPeer vendorID](self, "vendorID") == 1452)
  {
    return 1;
  }

  if (-[CBClassicPeer vendorID](self, "vendorID") == 76) {
    return 1;
  }
  if (-[CBPeer pairingState](self, "pairingState") == 2) {
    return 1;
  }
  return -[CBPeer pairingState](self, "pairingState") == 3;
}

- (BOOL)isiPhone
{
  int v3 = -[CBClassicPeer deviceType](self, "deviceType");
  return (v3 == 12 || v3 == 2) && -[CBClassicPeer isAppleDevice](self, "isAppleDevice");
}

- (BOOL)isiPad
{
  BOOL v3 = -[CBClassicPeer isAppleDevice](self, "isAppleDevice");
  if (v3) {
    LOBYTE(v3) = -[CBClassicPeer deviceType](self, "deviceType") == 29;
  }
  return v3;
}

- (BOOL)isMac
{
  int v3 = -[CBClassicPeer deviceType](self, "deviceType");
  return ((v3 - 7) < 4 || v3 == 1) && -[CBClassicPeer isAppleDevice](self, "isAppleDevice");
}

- (BOOL)isMultiBatteryDevice
{
  BOOL result = 0;
  if (-[CBClassicPeer isAppleDevice](self, "isAppleDevice"))
  {
    unsigned int v3 = -[CBClassicPeer productID](self, "productID") - 8194;
    if (v3 < 0x15 && ((0x11B201u >> v3) & 1) != 0) {
      return 1;
    }
    if (!-[CBClassicPeer batteryPercentSingle](self, "batteryPercentSingle")
      && (-[CBClassicPeer batteryPercentCase](self, "batteryPercentCase")
       || -[CBClassicPeer batteryPercentLeft](self, "batteryPercentLeft")
       || -[CBClassicPeer batteryPercentRight](self, "batteryPercentRight")))
    {
      return 1;
    }
  }

  return result;
}

- (BOOL)isReportingBatteryPercent
{
  if (!-[CBClassicPeer isMultiBatteryDevice](self, "isMultiBatteryDevice")) {
    return -[CBClassicPeer batteryPercentSingle](self, "batteryPercentSingle") != 0;
  }
  if (-[CBClassicPeer batteryPercentLeft](self, "batteryPercentLeft")) {
    return 1;
  }
  if (-[CBClassicPeer batteryPercentRight](self, "batteryPercentRight")) {
    return 1;
  }
  return -[CBClassicPeer batteryPercentCase](self, "batteryPercentCase") != 0;
}

- (BOOL)isGameController
{
  return -[CBClassicPeer deviceType](self, "deviceType") == 26
      || -[CBClassicPeer isSonyGameController](self, "isSonyGameController")
      || -[CBClassicPeer isXboxGameController](self, "isXboxGameController");
}

- (BOOL)isSonyGameController
{
  if (-[CBClassicPeer vendorIDSource](self, "vendorIDSource") != 2
    || -[CBClassicPeer vendorID](self, "vendorID") != 1356)
  {
    return 0;
  }

  if (-[CBClassicPeer productID](self, "productID") == 1476
    || -[CBClassicPeer productID](self, "productID") == 2508
    || -[CBClassicPeer productID](self, "productID") == 3302
    || -[CBClassicPeer productID](self, "productID") == 3570
    || -[CBClassicPeer productID](self, "productID") == 3653)
  {
    return 1;
  }

  return -[CBClassicPeer productID](self, "productID") == 3654;
}

- (BOOL)isXboxGameController
{
  if (-[CBClassicPeer vendorIDSource](self, "vendorIDSource") != 2
    || -[CBClassicPeer vendorID](self, "vendorID") != 1118)
  {
    return 0;
  }

  if (-[CBClassicPeer productID](self, "productID") == 765
    || -[CBClassicPeer productID](self, "productID") == 2828
    || -[CBClassicPeer productID](self, "productID") == 2818)
  {
    return 1;
  }

  return -[CBClassicPeer productID](self, "productID") == 2821;
}

- (BOOL)isNintendoGameController
{
  if (-[CBClassicPeer vendorIDSource](self, "vendorIDSource") != 2
    || -[CBClassicPeer vendorID](self, "vendorID") != 1406)
  {
    return 0;
  }

  if (-[CBClassicPeer productID](self, "productID") == 8198) {
    return 1;
  }
  if (-[CBClassicPeer productID](self, "productID") == 8199) {
    return 1;
  }
  return -[CBClassicPeer productID](self, "productID") == 8201;
}

- (BOOL)isAppleFeatureSupported:(unsigned int)a3
{
  return (a3 & ~-[CBClassicPeer appleFeatureBitMask](self, "appleFeatureBitMask")) == 0;
}

- (BOOL)isAACPCapabilityBit:(unsigned int)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  -[CBClassicPeer aacpCapabilityBits](self, "aacpCapabilityBits");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CBClassicPeer aacpCapabilityBits](self, "aacpCapabilityBits");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v7 = [v6 length];

    if (v7 <= a3 >> 3)
    {
      LOBYTE(v5) = 0;
    }

    else
    {
      unsigned __int8 v15 = 0;
      -[CBClassicPeer aacpCapabilityBits](self, "aacpCapabilityBits");
      int v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "getBytes:range:", &v15, a3 >> 3, 1);

      int v8 = (1 << (a3 & 7)) & v15;
      LOBYTE(v5) = v8 != 0;
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      uint64_t v9 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        BOOL v10 = v8 != 0;
        int v11 = v9;
        -[CBClassicPeer name](self, "name");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBClassicPeer aacpCapabilityBits](self, "aacpCapabilityBits");
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316930;
        __int128 v17 = "-[CBClassicPeer isAACPCapabilityBit:]";
        __int16 v18 = 2112;
        uint64_t v19 = v12;
        __int16 v20 = 2112;
        int v21 = v13;
        __int16 v22 = 1024;
        unsigned int v23 = a3;
        __int16 v24 = 1024;
        unsigned int v25 = a3 & 7;
        __int16 v26 = 1024;
        unsigned int v27 = a3 >> 3;
        __int16 v28 = 1024;
        int v29 = v15;
        __int16 v30 = 1024;
        BOOL v31 = v10;
        _os_log_debug_impl( &dword_186F9B000,  v11,  OS_LOG_TYPE_DEBUG,  "%s - “%@” - aacpCapabilityBits=%@ bit #%d is bit %d of byte %d (%2X) bitIsOn:%d",  buf,  0x3Eu);
      }
    }
  }

  return (char)v5;
}

- (void)openRFCOMMChannel:(unsigned __int8)a3 options:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if ((_DWORD)v4)
  {
    unint64_t v7 = (void *)MEMORY[0x189603FC8];
    [MEMORY[0x189607968] numberWithUnsignedChar:v4];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = (id)MEMORY[0x189604A60];
    if (v6) {
      id v9 = v6;
    }
    objc_msgSend( v7,  "dictionaryWithObjectsAndKeys:",  v8,  @"kCBMsgArgRFCOMMChannelID",  v9,  @"kCBMsgArgOptions",  0);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 53LL, v10);

LABEL_5:
    return;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    goto LABEL_5;
  }
  -[CBClassicPeer openRFCOMMChannel:options:].cold.1();
}

- (void)configureRFCOMMPortParams:(id)a3
{
}

- (BOOL)isServiceSupported:(id)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 objectForKeyedSubscript:@"kCBMsgArgPSM"];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v6 = v5 != 0LL;

    return v6;
  }

  else
  {

    return 0;
  }

- (void)openL2CAPChannel:(unsigned __int16)a3
{
  uint64_t v4 = (void *)MEMORY[0x189603FC8];
  [MEMORY[0x189607968] numberWithUnsignedShort:a3];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v4,  "dictionaryWithObjectsAndKeys:",  v6,  @"kCBMsgArgPSM",  MEMORY[0x189604A60],  @"kCBMsgArgOptions",  0);
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 25LL, v5);
}

- (void)closeL2CAPChannel:(unsigned __int16)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x189603FC8];
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedShort:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v6, @"kCBMsgArgPSM", 0);
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 26LL, v5);
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBClassicPeer closeL2CAPChannel:].cold.1();
    }
  }

- (void)openRFCOMMChannel:(unsigned __int8)a3
{
}

- (void)closeRFCOMMChannel:(unsigned __int8)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x189603FC8];
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v6, @"kCBMsgArgRFCOMMChannelID", 0);
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 54LL, v5);
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBClassicPeer openRFCOMMChannel:options:].cold.1();
    }
  }

- (void)setName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"CBClassicPeer.m", 1210, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }

  [MEMORY[0x189607810] newlineCharacterSet];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringByTrimmingCharactersInSet:v6];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607810] controlCharacterSet];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringByTrimmingCharactersInSet:v8];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = (void *)MEMORY[0x189603FC8];
  -[CBPeer identifier](self, "identifier");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"kCBMsgArgDeviceUUID", v13, @"kCBMsgArgName", 0);
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBClassicPeer sendMsg:args:](self, "sendMsg:args:", 42LL, v11);
}

- (BOOL)isRFCOMMServiceSupported:(id)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 objectForKeyedSubscript:@"kCBMsgArgRFCOMMChannelID"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v6 = v5 != 0LL;

    return v6;
  }

  else
  {

    return 0;
  }

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned __int8)a3
{
  self->_deviceType = a3;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)name
{
  return self->_name;
}

- (id)connectL2CAPCallback
{
  return objc_getProperty(self, a2, 152LL, 1);
}

- (void)setConnectL2CAPCallback:(id)a3
{
}

- (id)disconnectL2CAPCallback
{
  return objc_getProperty(self, a2, 160LL, 1);
}

- (void)setDisconnectL2CAPCallback:(id)a3
{
}

- (id)connectRFCOMMCallback
{
  return objc_getProperty(self, a2, 168LL, 1);
}

- (void)setConnectRFCOMMCallback:(id)a3
{
}

- (id)disconnectRFCOMMCallback
{
  return objc_getProperty(self, a2, 176LL, 1);
}

- (void)setDisconnectRFCOMMCallback:(id)a3
{
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned __int16)a3
{
  self->_productID = a3;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_vendorID = a3;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (void)setVendorIDSource:(unsigned __int16)a3
{
  self->_vendorIDSource = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int16)a3
{
  self->_version = a3;
}

- (BOOL)isDevFused
{
  return self->_isDevFused;
}

- (void)setIsDevFused:(BOOL)a3
{
  self->_isDevFused = a3;
}

- (unsigned)colorID
{
  return self->_colorID;
}

- (void)setColorID:(unsigned __int8)a3
{
  self->_colorID = a3;
}

- (NSString)appleModelIdentifier
{
  return self->_appleModelIdentifier;
}

- (void)setAppleModelIdentifier:(id)a3
{
}

- (BOOL)isConnectedOverUSB
{
  return self->_isConnectedOverUSB;
}

- (void)setIsConnectedOverUSB:(BOOL)a3
{
  self->_isConnectedOverUSB = a3;
}

- (BOOL)isAppleAccessoryServer
{
  return self->_isAppleAccessoryServer;
}

- (void)setIsAppleAccessoryServer:(BOOL)a3
{
  self->_isAppleAccessoryServer = a3;
}

- (NSArray)syncGroups
{
  return self->_syncGroups;
}

- (void)setSyncGroups:(id)a3
{
}

- (unsigned)syncSettings
{
  return self->_syncSettings;
}

- (void)setSyncSettings:(unsigned __int16)a3
{
  self->_syncSettings = a3;
}

- (unsigned)batteryPercentSingle
{
  return self->_batteryPercentSingle;
}

- (void)setBatteryPercentSingle:(unsigned __int8)a3
{
  self->_batteryPercentSingle = a3;
}

- (unsigned)batteryPercentLeft
{
  return self->_batteryPercentLeft;
}

- (void)setBatteryPercentLeft:(unsigned __int8)a3
{
  self->_batteryPercentLeft = a3;
}

- (unsigned)batteryPercentRight
{
  return self->_batteryPercentRight;
}

- (void)setBatteryPercentRight:(unsigned __int8)a3
{
  self->_batteryPercentRight = a3;
}

- (unsigned)batteryPercentCase
{
  return self->_batteryPercentCase;
}

- (void)setBatteryPercentCase:(unsigned __int8)a3
{
  self->_batteryPercentCase = a3;
}

- (unsigned)batteryPercentCombined
{
  return self->_batteryPercentCombined;
}

- (void)setBatteryPercentCombined:(unsigned __int8)a3
{
  self->_batteryPercentCombined = a3;
}

- (BOOL)panEnabled
{
  return self->_panEnabled;
}

- (void)setPanEnabled:(BOOL)a3
{
  self->_panEnabled = a3;
}

- (BOOL)browsingEnabled
{
  return self->_browsingEnabled;
}

- (void)setBrowsingEnabled:(BOOL)a3
{
  self->_browsingEnabled = a3;
}

- (BOOL)objectPushEnabled
{
  return self->_objectPushEnabled;
}

- (void)setObjectPushEnabled:(BOOL)a3
{
  self->_objectPushEnabled = a3;
}

- (unsigned)listeningMode
{
  return self->_listeningMode;
}

- (unsigned)listeningModeConfigs
{
  return self->_listeningModeConfigs;
}

- (BOOL)LRDetectionEnabled
{
  return self->_LRDetectionEnabled;
}

- (BOOL)EQConfigEnabled
{
  return self->_EQConfigEnabled;
}

- (unsigned)EQConfigTreble
{
  return self->_EQConfigTreble;
}

- (unsigned)EQConfigMid
{
  return self->_EQConfigMid;
}

- (unsigned)EQConfigBass
{
  return self->_EQConfigBass;
}

- (BOOL)autoAnswerCalls
{
  return self->_autoAnswerCalls;
}

- (unsigned)crownRotationDirection
{
  return self->_crownRotationDirection;
}

- (unsigned)singleClickMode
{
  return self->_singleClickMode;
}

- (unsigned)doubleClickMode
{
  return self->_doubleClickMode;
}

- (unsigned)clickHoldModeLeft
{
  return self->_clickHoldModeLeft;
}

- (unsigned)clickHoldModeRight
{
  return self->_clickHoldModeRight;
}

- (unsigned)doubleClickInterval
{
  return self->_doubleClickInterval;
}

- (unsigned)clickHoldInterval
{
  return self->_clickHoldInterval;
}

- (unsigned)oneBudANCMode
{
  return self->_oneBudANCMode;
}

- (unsigned)switchControlMode
{
  return self->_switchControlMode;
}

- (unsigned)doubleTapAction
{
  return self->_doubleTapAction;
}

- (unsigned)doubleTapActionLeft
{
  return self->_doubleTapActionLeft;
}

- (unsigned)doubleTapActionRight
{
  return self->_doubleTapActionRight;
}

- (unsigned)doubleTapCapability
{
  return self->_doubleTapCapability;
}

- (void)setDoubleTapCapability:(unsigned __int8)a3
{
  self->_doubleTapCapability = a3;
}

- (unsigned)micMode
{
  return self->_micMode;
}

- (BOOL)inEarDetectionEnabled
{
  return self->_inEarDetectionEnabled;
}

- (BOOL)smartRoutingSupported
{
  return self->_smartRoutingSupported;
}

- (unsigned)smartRoutingEnabled
{
  return self->_smartRoutingEnabled;
}

- (BOOL)remoteTimeSyncEnabled
{
  return self->_remoteTimeSyncEnabled;
}

- (unsigned)primaryInEarStatus
{
  return self->_primaryInEarStatus;
}

- (void)setPrimaryInEarStatus:(unsigned __int8)a3
{
  self->_primaryInEarStatus = a3;
}

- (unsigned)secondaryInEarStatus
{
  return self->_secondaryInEarStatus;
}

- (void)setSecondaryInEarStatus:(unsigned __int8)a3
{
  self->_secondaryInEarStatus = a3;
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSData)sdpRecordData
{
  return self->_sdpRecordData;
}

- (void)setSdpRecordData:(id)a3
{
}

- (NSData)aacpCapabilityBits
{
  return self->_aacpCapabilityBits;
}

- (void)setAacpCapabilityBits:(id)a3
{
}

- (unsigned)appleFeatureBitMask
{
  return self->_appleFeatureBitMask;
}

- (void)setAppleFeatureBitMask:(unsigned int)a3
{
  self->_appleFeatureBitMask = a3;
}

- (unint64_t)appleExtendedFeatureBitMask
{
  return self->_appleExtendedFeatureBitMask;
}

- (void)setAppleExtendedFeatureBitMask:(unint64_t)a3
{
  self->_appleExtendedFeatureBitMask = a3;
}

- (NSUUID)trustedUID
{
  return self->_trustedUID;
}

- (void)setTrustedUID:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSNumber)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(id)a3
{
}

- (NSHashTable)L2CAPChannels
{
  return self->_L2CAPChannels;
}

- (void)setL2CAPChannels:(id)a3
{
}

- (NSHashTable)RFCOMMChannels
{
  return self->_RFCOMMChannels;
}

- (void)setRFCOMMChannels:(id)a3
{
}

- (BOOL)isIncoming
{
  return self->_isIncoming;
}

- (void)setIsIncoming:(BOOL)a3
{
  self->_isIncoming = a3;
}

- (int64_t)internalState
{
  return self->_internalState;
}

- (void)setInternalState:(int64_t)a3
{
  self->_internalState = a3;
}

- (unsigned)connectionHandle
{
  return self->_connectionHandle;
}

- (void)setConnectionHandle:(unsigned __int16)a3
{
  self->_connectionHandle = a3;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (void)setAddressString:(id)a3
{
}

- (unsigned)modeSupported
{
  return self->_modeSupported;
}

- (void)setModeSupported:(unsigned __int8)a3
{
  self->_modeSupported = a3;
}

- (BOOL)traceLogging
{
  return self->_traceLogging;
}

- (void)setTraceLogging:(BOOL)a3
{
  self->_traceLogging = a3;
}

- (void).cxx_destruct
{
}

- (void)sendMsg:requiresConnected:args:.cold.1()
{
}

- (void)sendMsg:requiresConnected:args:.cold.2()
{
}

- (void)handleMsg:args:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_186F9B000, v1, OS_LOG_TYPE_DEBUG, "%@ is not connected, ignoring message: %u", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)handlePeerUpdated:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)handlePeerUpdated:(os_log_s *)a3 .cold.2(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  [a1 name];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 136315650;
  unint64_t v7 = "-[CBClassicPeer handlePeerUpdated:]";
  __int16 v8 = 2112;
  id v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl( &dword_186F9B000,  a3,  OS_LOG_TYPE_DEBUG,  "%s - Received capability bits for “%@”: %@",  (uint8_t *)&v6,  0x20u);
}

- (void)handleL2CAPChannelOpened:.cold.1()
{
}

- (void)handleL2CAPChannelClosed:(os_log_t)log .cold.1(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v3 = 136315650;
  uint64_t v4 = "-[CBClassicPeer handleL2CAPChannelClosed:]";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_186F9B000, log, OS_LOG_TYPE_DEBUG, "%s PSM: %u and result: %@", (uint8_t *)&v3, 0x1Cu);
}

- (void)channelWithPSM:.cold.1()
{
}

- (void)handleRFCOMMChannelOpened:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)channelWithID:.cold.1()
{
}

- (void)getConnectedServices
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v3 = a1;
  [a2 identifier];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = 138412546;
  int v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 internalState];
  _os_log_error_impl(&dword_186F9B000, v3, OS_LOG_TYPE_ERROR, "Peer: %@ is not connected %ld", (uint8_t *)&v5, 0x16u);
}

- (void)openRFCOMMChannel:options:.cold.1()
{
}

- (void)closeL2CAPChannel:.cold.1()
{
}

@end