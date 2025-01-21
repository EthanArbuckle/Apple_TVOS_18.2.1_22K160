@interface ConnectOptions
+ (id)alertOptionsWithConnectionAlerts:(BOOL)a3 disconnectionAlerts:(BOOL)a4 notificationAlerts:(BOOL)a5 delay:(int64_t)a6 bridgeTransport:(BOOL)a7;
- (BOOL)ancsRequired;
- (BOOL)connectingToPANServices;
- (BOOL)connectionAlerts;
- (BOOL)disableLeGATT;
- (BOOL)disconnectionAlerts;
- (BOOL)enableAutoReconnect;
- (BOOL)enableControllerBTClockUpdates;
- (BOOL)enableScanCore;
- (BOOL)enableTransportBridging;
- (BOOL)hideFromBTSettings;
- (BOOL)isLatencyCritical;
- (BOOL)notificationAlerts;
- (BOOL)opportunistic;
- (BOOL)requiresLowLatency;
- (BOOL)resetDisconnectionHistory;
- (BOOL)waitForConnectionPoll;
- (BOOL)wantsObjectDiscoveryData;
- (ConnectOptions)initWithCoder:(id)a3;
- (NSArray)connectingClients;
- (NSArray)useCaseList;
- (NSData)temporaryIRK;
- (NSData)temporaryLTK;
- (NSString)clientBundleID;
- (NSString)clientProcessID;
- (NSString)temporaryIdentityAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)PHYOptions;
- (int64_t)delay;
- (int64_t)initPHYs;
- (int64_t)maxAllowedConnectionDelay;
- (int64_t)minRSSILevelForConnection;
- (int64_t)mrcEnable;
- (int64_t)txPowerAuxConnectReq;
- (int64_t)txPowerConnectInd;
- (unint64_t)connectionUseCase;
- (unint64_t)ctkdChosenTransport;
- (void)encodeWithCoder:(id)a3;
- (void)setAncsRequired:(BOOL)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientProcessID:(id)a3;
- (void)setConnectingClients:(id)a3;
- (void)setConnectingToPANServices:(BOOL)a3;
- (void)setConnectionAlerts:(BOOL)a3;
- (void)setConnectionUseCase:(unint64_t)a3;
- (void)setCtkdChosenTransport:(unint64_t)a3;
- (void)setDelay:(int64_t)a3;
- (void)setDisableLeGATT:(BOOL)a3;
- (void)setDisconnectionAlerts:(BOOL)a3;
- (void)setEnableAutoReconnect:(BOOL)a3;
- (void)setEnableControllerBTClockUpdates:(BOOL)a3;
- (void)setEnableScanCore:(BOOL)a3;
- (void)setEnableTransportBridging:(BOOL)a3;
- (void)setHideFromBTSettings:(BOOL)a3;
- (void)setInitPHYs:(int64_t)a3;
- (void)setIsLatencyCritical:(BOOL)a3;
- (void)setMaxAllowedConnectionDelay:(int64_t)a3;
- (void)setMinRSSILevelForConnection:(int64_t)a3;
- (void)setMrcEnable:(int64_t)a3;
- (void)setNotificationAlerts:(BOOL)a3;
- (void)setOpportunistic:(BOOL)a3;
- (void)setPHYOptions:(int64_t)a3;
- (void)setRequiresLowLatency:(BOOL)a3;
- (void)setResetDisconnectionHistory:(BOOL)a3;
- (void)setTemporaryIRK:(id)a3;
- (void)setTemporaryIdentityAddress:(id)a3;
- (void)setTemporaryLTK:(id)a3;
- (void)setTxPowerAuxConnectReq:(int64_t)a3;
- (void)setTxPowerConnectInd:(int64_t)a3;
- (void)setUseCaseList:(id)a3;
- (void)setWaitForConnectionPoll:(BOOL)a3;
- (void)setWantsObjectDiscoveryData:(BOOL)a3;
@end

@implementation ConnectOptions

+ (id)alertOptionsWithConnectionAlerts:(BOOL)a3 disconnectionAlerts:(BOOL)a4 notificationAlerts:(BOOL)a5 delay:(int64_t)a6 bridgeTransport:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  BOOL v10 = a4;
  BOOL v11 = a3;
  v12 = objc_alloc_init(&OBJC_CLASS___ConnectOptions);
  -[ConnectOptions setConnectionAlerts:](v12, "setConnectionAlerts:", v11);
  -[ConnectOptions setDisconnectionAlerts:](v12, "setDisconnectionAlerts:", v10);
  -[ConnectOptions setNotificationAlerts:](v12, "setNotificationAlerts:", v9);
  -[ConnectOptions setDelay:](v12, "setDelay:", a6);
  -[ConnectOptions setEnableTransportBridging:](v12, "setEnableTransportBridging:", v7);
  -[ConnectOptions setDisableLeGATT:](v12, "setDisableLeGATT:", 0LL);
  -[ConnectOptions setCtkdChosenTransport:](v12, "setCtkdChosenTransport:", 0LL);
  v13 = [NSData data];
  -[ConnectOptions setTemporaryLTK:](v12, "setTemporaryLTK:", v13);

  v14 = [NSArray array];
  -[ConnectOptions setConnectingClients:](v12, "setConnectingClients:", v14);

  -[ConnectOptions setOpportunistic:](v12, "setOpportunistic:", 0LL);
  -[ConnectOptions setEnableAutoReconnect:](v12, "setEnableAutoReconnect:", 0LL);
  -[ConnectOptions setRequiresLowLatency:](v12, "setRequiresLowLatency:", 0LL);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[ConnectOptions init]( +[ConnectOptions allocWithZone:](&OBJC_CLASS___ConnectOptions, "allocWithZone:", a3),  "init");
  -[ConnectOptions setPHYOptions:](v4, "setPHYOptions:", -[ConnectOptions PHYOptions](self, "PHYOptions"));
  -[ConnectOptions setAncsRequired:](v4, "setAncsRequired:", -[ConnectOptions ancsRequired](self, "ancsRequired"));
  v5 = [self clientBundleID];
  -[ConnectOptions setClientBundleID:](v4, "setClientBundleID:", v5);

  -[ConnectOptions setConnectionAlerts:]( v4,  "setConnectionAlerts:",  -[ConnectOptions connectionAlerts](self, "connectionAlerts"));
  -[ConnectOptions setDisconnectionAlerts:]( v4,  "setDisconnectionAlerts:",  -[ConnectOptions disconnectionAlerts](self, "disconnectionAlerts"));
  -[ConnectOptions setNotificationAlerts:]( v4,  "setNotificationAlerts:",  -[ConnectOptions notificationAlerts](self, "notificationAlerts"));
  -[ConnectOptions setDelay:](v4, "setDelay:", -[ConnectOptions delay](self, "delay"));
  -[ConnectOptions setWantsObjectDiscoveryData:]( v4,  "setWantsObjectDiscoveryData:",  -[ConnectOptions wantsObjectDiscoveryData](self, "wantsObjectDiscoveryData"));
  -[ConnectOptions setEnableTransportBridging:]( v4,  "setEnableTransportBridging:",  -[ConnectOptions enableTransportBridging](self, "enableTransportBridging"));
  -[ConnectOptions setDisableLeGATT:](v4, "setDisableLeGATT:", -[ConnectOptions disableLeGATT](self, "disableLeGATT"));
  -[ConnectOptions setHideFromBTSettings:]( v4,  "setHideFromBTSettings:",  -[ConnectOptions hideFromBTSettings](self, "hideFromBTSettings"));
  -[ConnectOptions setInitPHYs:](v4, "setInitPHYs:", -[ConnectOptions initPHYs](self, "initPHYs"));
  -[ConnectOptions setEnableControllerBTClockUpdates:]( v4,  "setEnableControllerBTClockUpdates:",  -[ConnectOptions enableControllerBTClockUpdates](self, "enableControllerBTClockUpdates"));
  v6 = [self clientProcessID];
  -[ConnectOptions setClientProcessID:](v4, "setClientProcessID:", v6);

  -[ConnectOptions setConnectionUseCase:]( v4,  "setConnectionUseCase:",  -[ConnectOptions connectionUseCase](self, "connectionUseCase"));
  -[ConnectOptions setMaxAllowedConnectionDelay:]( v4,  "setMaxAllowedConnectionDelay:",  -[ConnectOptions maxAllowedConnectionDelay](self, "maxAllowedConnectionDelay"));
  -[ConnectOptions setWaitForConnectionPoll:]( v4,  "setWaitForConnectionPoll:",  -[ConnectOptions waitForConnectionPoll](self, "waitForConnectionPoll"));
  -[ConnectOptions setMinRSSILevelForConnection:]( v4,  "setMinRSSILevelForConnection:",  -[ConnectOptions minRSSILevelForConnection](self, "minRSSILevelForConnection"));
  -[ConnectOptions setEnableScanCore:]( v4,  "setEnableScanCore:",  -[ConnectOptions enableScanCore](self, "enableScanCore"));
  -[ConnectOptions setIsLatencyCritical:]( v4,  "setIsLatencyCritical:",  -[ConnectOptions isLatencyCritical](self, "isLatencyCritical"));
  -[ConnectOptions setCtkdChosenTransport:]( v4,  "setCtkdChosenTransport:",  -[ConnectOptions ctkdChosenTransport](self, "ctkdChosenTransport"));
  BOOL v7 = [self temporaryLTK];
  -[ConnectOptions setTemporaryLTK:](v4, "setTemporaryLTK:", v7);

  v8 = -[ConnectOptions connectingClients];
  -[ConnectOptions setConnectingClients:](v4, "setConnectingClients:", v8);

  -[ConnectOptions setOpportunistic:](v4, "setOpportunistic:", -[ConnectOptions opportunistic](self, "opportunistic"));
  BOOL v9 = -[ConnectOptions useCaseList];
  -[ConnectOptions setUseCaseList:](v4, "setUseCaseList:", v9);

  -[ConnectOptions setRequiresLowLatency:]( v4,  "setRequiresLowLatency:",  -[ConnectOptions requiresLowLatency](self, "requiresLowLatency"));
  -[ConnectOptions setTxPowerConnectInd:]( v4,  "setTxPowerConnectInd:",  -[ConnectOptions txPowerConnectInd](self, "txPowerConnectInd"));
  -[ConnectOptions setTxPowerAuxConnectReq:]( v4,  "setTxPowerAuxConnectReq:",  -[ConnectOptions txPowerAuxConnectReq](self, "txPowerAuxConnectReq"));
  -[ConnectOptions setMrcEnable:](v4, "setMrcEnable:", -[ConnectOptions mrcEnable](self, "mrcEnable"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->_connectionAlerts forKey:@"connectionAlerts"];
  [v4 encodeBool:self->_disconnectionAlerts forKey:@"disconnectionAlerts"];
  [v4 encodeBool:self->_notificationAlerts forKey:@"notificationAlerts"];
  [v4 encodeInteger:self->_delay forKey:@"delay"];
  [v4 encodeBool:self->_enableTransportBridging forKey:@"enableTransportBridging"];
}

- (ConnectOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ConnectOptions;
  v5 = -[ConnectOptions init](&v7, "init");
  if (v5)
  {
    v5->_connectionAlerts = [v4 decodeBoolForKey:@"connectionAlerts"];
    v5->_disconnectionAlerts = [v4 decodeBoolForKey:@"disconnectionAlerts"];
    v5->_notificationAlerts = [v4 decodeBoolForKey:@"notificationAlerts"];
    v5->_delay = (int64_t)[v4 decodeIntegerForKey:@"delay"];
    v5->_enableTransportBridging = [v4 decodeBoolForKey:@"enableTransportBridging"];
  }

  return v5;
}

- (id)description
{
  uint64_t v3 = sub_1002E6E00();
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  BOOL connectionAlerts = self->_connectionAlerts;
  disBOOL connectionAlerts = self->_disconnectionAlerts;
  BOOL notificationAlerts = self->_notificationAlerts;
  int64_t delay = self->_delay;
  BOOL wantsObjectDiscoveryData = self->_wantsObjectDiscoveryData;
  BOOL enableTransportBridging = self->_enableTransportBridging;
  BOOL disableLeGATT = self->_disableLeGATT;
  BOOL ancsRequired = self->_ancsRequired;
  if (v4)
  {
    BOOL hideFromBTSettings = self->_hideFromBTSettings;
    int64_t initPHYs = self->_initPHYs;
    int64_t PHYOptions = self->_PHYOptions;
    BOOL enableControllerBTClockUpdates = self->_enableControllerBTClockUpdates;
    unint64_t connectionUseCase = self->_connectionUseCase;
    BOOL waitForConnectionPoll = self->_waitForConnectionPoll;
    int64_t minRSSILevelForConnection = self->_minRSSILevelForConnection;
    unint64_t ctkdChosenTransport = self->_ctkdChosenTransport;
    connectingClients = self->_connectingClients;
    BOOL opportunistic = self->_opportunistic;
    if (self->_requiresLowLatency) {
      v23 = @"YES";
    }
    else {
      v23 = @"NO";
    }
    v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(connect:%d disconnect:%d notify:%d delay:%ld wantsObjectDiscoverData:%d transportBridging:%d disableLeGATT:%d ancsRequired:%d hideFromBTSettings:%d initPHYs:%ld PHYoptions:%ld enableControllerBTClockUpdates:%d connectionUseCase:%ld _minRSSILevelForConnection:%ld _waitForConnectionPoll:%d ctkdChosenTransport:%lu) connectingBundles:%@ opportunistic:%d requiresLowLatency:%@",  connectionAlerts,  disconnectionAlerts,  notificationAlerts,  delay,  wantsObjectDiscoveryData,  enableTransportBridging,  disableLeGATT,  ancsRequired,  hideFromBTSettings,  initPHYs,  PHYOptions,  enableControllerBTClockUpdates,  connectionUseCase,  minRSSILevelForConnection,  waitForConnectionPoll,  ctkdChosenTransport,  connectingClients,  opportunistic,  v23);
  }

  else
  {
    v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(connect:%d disconnect:%d notify:%d delay:%ld wantsObjectDiscoverData:%d transportBridging:%d disableLeGATT:%d ancsRequired:%d)",  connectionAlerts,  disconnectionAlerts,  notificationAlerts,  delay,  wantsObjectDiscoveryData,  enableTransportBridging,  self->_disableLeGATT,  ancsRequired,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v36);
  }

  return v24;
}

- (BOOL)connectionAlerts
{
  return self->_connectionAlerts;
}

- (void)setConnectionAlerts:(BOOL)a3
{
  self->_BOOL connectionAlerts = a3;
}

- (BOOL)disconnectionAlerts
{
  return self->_disconnectionAlerts;
}

- (void)setDisconnectionAlerts:(BOOL)a3
{
  self->_disBOOL connectionAlerts = a3;
}

- (BOOL)notificationAlerts
{
  return self->_notificationAlerts;
}

- (void)setNotificationAlerts:(BOOL)a3
{
  self->_BOOL notificationAlerts = a3;
}

- (int64_t)delay
{
  return self->_delay;
}

- (void)setDelay:(int64_t)a3
{
  self->_int64_t delay = a3;
}

- (BOOL)wantsObjectDiscoveryData
{
  return self->_wantsObjectDiscoveryData;
}

- (void)setWantsObjectDiscoveryData:(BOOL)a3
{
  self->_BOOL wantsObjectDiscoveryData = a3;
}

- (BOOL)enableTransportBridging
{
  return self->_enableTransportBridging;
}

- (void)setEnableTransportBridging:(BOOL)a3
{
  self->_BOOL enableTransportBridging = a3;
}

- (BOOL)disableLeGATT
{
  return self->_disableLeGATT;
}

- (void)setDisableLeGATT:(BOOL)a3
{
  self->_BOOL disableLeGATT = a3;
}

- (BOOL)ancsRequired
{
  return self->_ancsRequired;
}

- (void)setAncsRequired:(BOOL)a3
{
  self->_BOOL ancsRequired = a3;
}

- (BOOL)hideFromBTSettings
{
  return self->_hideFromBTSettings;
}

- (void)setHideFromBTSettings:(BOOL)a3
{
  self->_BOOL hideFromBTSettings = a3;
}

- (int64_t)initPHYs
{
  return self->_initPHYs;
}

- (void)setInitPHYs:(int64_t)a3
{
  self->_int64_t initPHYs = a3;
}

- (int64_t)PHYOptions
{
  return self->_PHYOptions;
}

- (void)setPHYOptions:(int64_t)a3
{
  self->_int64_t PHYOptions = a3;
}

- (BOOL)enableControllerBTClockUpdates
{
  return self->_enableControllerBTClockUpdates;
}

- (void)setEnableControllerBTClockUpdates:(BOOL)a3
{
  self->_BOOL enableControllerBTClockUpdates = a3;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)clientProcessID
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setClientProcessID:(id)a3
{
}

- (unint64_t)connectionUseCase
{
  return self->_connectionUseCase;
}

- (void)setConnectionUseCase:(unint64_t)a3
{
  self->_unint64_t connectionUseCase = a3;
}

- (int64_t)maxAllowedConnectionDelay
{
  return self->_maxAllowedConnectionDelay;
}

- (void)setMaxAllowedConnectionDelay:(int64_t)a3
{
  self->_maxAllowedConnectionDelay = a3;
}

- (BOOL)waitForConnectionPoll
{
  return self->_waitForConnectionPoll;
}

- (void)setWaitForConnectionPoll:(BOOL)a3
{
  self->_BOOL waitForConnectionPoll = a3;
}

- (int64_t)minRSSILevelForConnection
{
  return self->_minRSSILevelForConnection;
}

- (void)setMinRSSILevelForConnection:(int64_t)a3
{
  self->_int64_t minRSSILevelForConnection = a3;
}

- (BOOL)enableScanCore
{
  return self->_enableScanCore;
}

- (void)setEnableScanCore:(BOOL)a3
{
  self->_enableScanCore = a3;
}

- (BOOL)isLatencyCritical
{
  return self->_isLatencyCritical;
}

- (void)setIsLatencyCritical:(BOOL)a3
{
  self->_isLatencyCritical = a3;
}

- (unint64_t)ctkdChosenTransport
{
  return self->_ctkdChosenTransport;
}

- (void)setCtkdChosenTransport:(unint64_t)a3
{
  self->_unint64_t ctkdChosenTransport = a3;
}

- (NSData)temporaryLTK
{
  return (NSData *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setTemporaryLTK:(id)a3
{
}

- (NSString)temporaryIdentityAddress
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setTemporaryIdentityAddress:(id)a3
{
}

- (NSData)temporaryIRK
{
  return (NSData *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setTemporaryIRK:(id)a3
{
}

- (BOOL)resetDisconnectionHistory
{
  return self->_resetDisconnectionHistory;
}

- (void)setResetDisconnectionHistory:(BOOL)a3
{
  self->_resetDisconnectionHistory = a3;
}

- (BOOL)connectingToPANServices
{
  return self->_connectingToPANServices;
}

- (void)setConnectingToPANServices:(BOOL)a3
{
  self->_connectingToPANServices = a3;
}

- (NSArray)connectingClients
{
  return (NSArray *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setConnectingClients:(id)a3
{
}

- (NSArray)useCaseList
{
  return (NSArray *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setUseCaseList:(id)a3
{
}

- (BOOL)opportunistic
{
  return self->_opportunistic;
}

- (void)setOpportunistic:(BOOL)a3
{
  self->_BOOL opportunistic = a3;
}

- (BOOL)enableAutoReconnect
{
  return self->_enableAutoReconnect;
}

- (void)setEnableAutoReconnect:(BOOL)a3
{
  self->_enableAutoReconnect = a3;
}

- (BOOL)requiresLowLatency
{
  return self->_requiresLowLatency;
}

- (void)setRequiresLowLatency:(BOOL)a3
{
  self->_requiresLowLatency = a3;
}

- (int64_t)txPowerConnectInd
{
  return self->_txPowerConnectInd;
}

- (void)setTxPowerConnectInd:(int64_t)a3
{
  self->_txPowerConnectInd = a3;
}

- (int64_t)txPowerAuxConnectReq
{
  return self->_txPowerAuxConnectReq;
}

- (void)setTxPowerAuxConnectReq:(int64_t)a3
{
  self->_txPowerAuxConnectReq = a3;
}

- (int64_t)mrcEnable
{
  return self->_mrcEnable;
}

- (void)setMrcEnable:(int64_t)a3
{
  self->_mrcEnable = a3;
}

- (void).cxx_destruct
{
}

@end