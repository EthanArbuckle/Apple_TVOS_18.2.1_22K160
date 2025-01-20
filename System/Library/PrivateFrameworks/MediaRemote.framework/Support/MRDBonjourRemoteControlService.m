@interface MRDBonjourRemoteControlService
+ (id)_netServiceTXTRecordDataWithDeviceInfo:(id)a3;
- (MRDBonjourRemoteControlService)initWithNetServiceType:(id)a3;
- (MRDBonjourRemoteControlServiceDelegate)delegate;
- (NSData)lastKnownBluetoothAddress;
- (NSString)description;
- (NSString)netServiceType;
- (void)_handleDeviceInfoChangedNotification:(id)a3;
- (void)_handleRestrictionChangedNotification:(id)a3;
- (void)_initializeBonjourServiceWithDeviceInfo:(id)a3;
- (void)_txtDataChanged;
- (void)_txtDataChangedWithDeviceInfo:(id)a3;
- (void)_txtDataChangedWithUserInfo:(id)a3;
- (void)dealloc;
- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5;
- (void)netService:(id)a3 didNotPublish:(id)a4;
- (void)netServiceDidPublish:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastKnownBluetoothAddress:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRDBonjourRemoteControlService

- (MRDBonjourRemoteControlService)initWithNetServiceType:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MRDBonjourRemoteControlService;
  v5 = -[MRDBonjourRemoteControlService init](&v19, "init");
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = (NSString *)[v4 copy];
    netServiceType = v5->_netServiceType;
    v5->_netServiceType = v6;

    v8 = (CUBluetoothClient *)objc_alloc_init((Class)MSVWeakLinkClass(@"CUBluetoothClient", @"CoreUtils"));
    bluetoothClient = v5->_bluetoothClient;
    v5->_bluetoothClient = v8;

    v10 = &_dispatch_main_q;
    -[CUBluetoothClient setDispatchQueue:](v5->_bluetoothClient, "setDispatchQueue:", &_dispatch_main_q);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100032A64;
    v16[3] = &unk_10039AAE8;
    objc_copyWeak(&v17, &location);
    -[CUBluetoothClient setBluetoothAddressChangedHandler:]( v5->_bluetoothClient,  "setBluetoothAddressChangedHandler:",  v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100032B3C;
    v14[3] = &unk_10039AB10;
    objc_copyWeak(&v15, &location);
    +[MRDeviceInfoRequest deviceInfoForOrigin:queue:completion:]( &OBJC_CLASS___MRDeviceInfoRequest,  "deviceInfoForOrigin:queue:completion:",  v11,  &_dispatch_main_q,  v14);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v5 selector:"_handleDeviceInfoChangedNotification:" name:kMRDeviceInfoDidChangeNotification object:0];
    [v12 addObserver:v5 selector:"_handleRestrictionChangedNotification:" name:MCRestrictionChangedNotification object:0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[MRDBonjourRemoteControlService stop](self, "stop");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDBonjourRemoteControlService;
  -[MRDBonjourRemoteControlService dealloc](&v4, "dealloc");
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  objc_super v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p %@>",  v5,  self,  self->_netServiceType));

  return (NSString *)v6;
}

- (void)start
{
  uint64_t v3 = _MRLogForCategory(3LL, a2);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    networkService = self->_networkService;
    netServiceType = self->_netServiceType;
    int v7 = 138543618;
    v8 = networkService;
    __int16 v9 = 2114;
    v10 = netServiceType;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlNetworkService] Starting network service: %{public}@ for type %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  -[CUBluetoothClient activate](self->_bluetoothClient, "activate");
  -[NSNetService publishWithOptions:](self->_networkService, "publishWithOptions:", 2LL);
  self->_started = 1;
}

- (void)stop
{
  uint64_t v3 = _MRLogForCategory(3LL, a2);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    networkService = self->_networkService;
    netServiceType = self->_netServiceType;
    int v7 = 138543618;
    v8 = networkService;
    __int16 v9 = 2114;
    v10 = netServiceType;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlNetworkService] Stopping network service %{public}@ for type %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  -[CUBluetoothClient invalidate](self->_bluetoothClient, "invalidate");
  -[NSNetService stop](self->_networkService, "stop");
  self->_started = 0;
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = _MRLogForCategory(3LL, v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    netServiceType = self->_netServiceType;
    int v19 = 138544130;
    id v20 = v8;
    __int16 v21 = 2114;
    v22 = netServiceType;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlNetworkService] Did accept connection with service: %{public}@ using type: %{public}@ input: %{pu blic}@ output: %{public}@",  (uint8_t *)&v19,  0x2Au);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v16 = objc_opt_respondsToSelector(WeakRetained, "bonjourRemoteControlService:didAcceptConnection:");

  if ((v16 & 1) != 0)
  {
    id v17 = [[MRStreamTransportConnection alloc] initWithInputStream:v9 outputStream:v10];
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 bonjourRemoteControlService:self didAcceptConnection:v17];
  }
}

- (void)netServiceDidPublish:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(3LL, v5);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    netServiceType = self->_netServiceType;
    int v9 = 138543618;
    id v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = netServiceType;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlNetworkService] Remote server advertisement success with service: %{public}@ using type: %{public}@",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(3LL, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlNetworkService] Remote server advertisement failed with service: %{public}@ error: %{public}@",  buf,  0x16u);
  }

  uint64_t v12 = _MRLogForCategory(3LL, v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlNetworkService] Retrying after 30s...",  buf,  2u);
  }

  networkService = self->_networkService;
  if (networkService)
  {
    -[NSNetService stop](networkService, "stop");
    id v15 = self->_networkService;
    self->_networkService = 0LL;
  }

  char v16 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000331D4;
  v17[3] = &unk_10039AB38;
  v17[4] = self;
  +[MRDeviceInfoRequest deviceInfoForOrigin:queue:completion:]( &OBJC_CLASS___MRDeviceInfoRequest,  "deviceInfoForOrigin:queue:completion:",  v16,  &_dispatch_main_q,  v17);
}

- (void)_handleDeviceInfoChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(3LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlNetworkService] Updating txtData because deviceInfo changed...",  v12,  2u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v9 = MRGetOriginFromUserInfo();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if ([v10 isLocal])
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    -[MRDBonjourRemoteControlService _txtDataChangedWithUserInfo:](self, "_txtDataChangedWithUserInfo:", v11);
  }
}

- (void)_handleRestrictionChangedNotification:(id)a3
{
  uint64_t v4 = _MRLogForCategory(3LL, a2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlNetworkService] Updating txtData because device restrictions changed...",  v6,  2u);
  }

  -[MRDBonjourRemoteControlService _txtDataChanged](self, "_txtDataChanged");
}

- (void)_txtDataChangedWithUserInfo:(id)a3
{
  uint64_t v4 = MRGetDeviceInfoFromUserInfo(a3, a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[MRDBonjourRemoteControlService _txtDataChangedWithDeviceInfo:](self, "_txtDataChangedWithDeviceInfo:", v5);
}

- (void)_txtDataChanged
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000334A4;
  v4[3] = &unk_10039AB38;
  v4[4] = self;
  +[MRDeviceInfoRequest deviceInfoForOrigin:queue:completion:]( &OBJC_CLASS___MRDeviceInfoRequest,  "deviceInfoForOrigin:queue:completion:",  v3,  &_dispatch_main_q,  v4);
}

- (void)_txtDataChangedWithDeviceInfo:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(3LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlNetworkService] Updating txtData: %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  if (v4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDBonjourRemoteControlService lastKnownBluetoothAddress](self, "lastKnownBluetoothAddress"));
    MRPairedDeviceSetBluetoothAddress(v4, v8);

    id v9 = [(id)objc_opt_class(self) _netServiceTXTRecordDataWithDeviceInfo:v4];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[NSNetService setTXTRecordData:](self->_networkService, "setTXTRecordData:", v10);
  }
}

+ (id)_netServiceTXTRecordDataWithDeviceInfo:(id)a3
{
  v29[0] = kMRExternalDeviceUniqueIdentifierTXTRecordKey;
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 identifier]);
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (const __CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1003AE680;
  }
  v30[0] = v6;
  v29[1] = kMRExternalDeviceNameTXTRecordKey;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 name]);
  uint64_t v8 = (void *)v7;
  if (v7) {
    id v9 = (const __CFString *)v7;
  }
  else {
    id v9 = &stru_1003AE680;
  }
  v30[1] = v9;
  v29[2] = kMRExternalDeviceModelNameTXTRecordKey;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v3 localizedModelName]);
  int v11 = (void *)v10;
  if (v10) {
    id v12 = (const __CFString *)v10;
  }
  else {
    id v12 = &stru_1003AE680;
  }
  v30[2] = v12;
  v29[3] = kMRExternalDeviceSystemBuildVersionTXTRecordKey;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v3 buildVersion]);
  v14 = (void *)v13;
  if (v13) {
    id v15 = (const __CFString *)v13;
  }
  else {
    id v15 = &stru_1003AE680;
  }
  v30[3] = v15;
  v29[4] = kMRExternalDeviceAllowPairingTXTRecordKey;
  unsigned int v16 = [v3 isPairingAllowed];
  id v17 = @"NO";
  if (v16) {
    id v17 = @"YES";
  }
  v30[4] = v17;
  v29[5] = kMRExternalDeviceBluetoothAddressTXTRecordKey;
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v3 bluetoothAddress]);
  id v19 = (void *)v18;
  if (v18) {
    __int16 v20 = (const __CFString *)v18;
  }
  else {
    __int16 v20 = &stru_1003AE680;
  }
  v30[5] = v20;
  v29[6] = kMRExternalDeviceLocalAirPlayReceiverPairingIdentityKey;
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v3 deviceUID]);
  v22 = (void *)v21;
  if (v21) {
    __int16 v23 = (const __CFString *)v21;
  }
  else {
    __int16 v23 = &stru_1003AE680;
  }
  v30[6] = v23;
  v29[7] = kMRExternalManagedConfigDeviceIDKey;
  id v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 managedConfigurationDeviceIdentifier]);

  if (v24) {
    __int16 v25 = v24;
  }
  else {
    __int16 v25 = &stru_1003AE680;
  }
  v30[7] = v25;
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  8LL));

  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNetService dataFromTXTRecordDictionary:]( &OBJC_CLASS___NSNetService,  "dataFromTXTRecordDictionary:",  v26));
  return v27;
}

- (void)_initializeBonjourServiceWithDeviceInfo:(id)a3
{
  id v5 = a3;
  if (self->_networkService)
  {
    uint64_t v6 = _MRLogForCategory(3LL, v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      __int16 v23 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlNetworkService] Stopping bonjour service %{public}@",  (uint8_t *)&v22,  0xCu);
    }

    -[NSNetService stop](self->_networkService, "stop");
    networkService = self->_networkService;
    self->_networkService = 0LL;
  }

  uint64_t v9 = _MRLogForCategory(3LL, v4);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    netServiceType = self->_netServiceType;
    int v22 = 138543362;
    __int16 v23 = (MRDBonjourRemoteControlService *)netServiceType;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlNetworkService] Initializing bonjour service for type %{public}@",  (uint8_t *)&v22,  0xCu);
  }

  id v12 = -[NSNetService initWithDomain:type:name:]( objc_alloc(&OBJC_CLASS___NSNetService),  "initWithDomain:type:name:",  @"local.",  self->_netServiceType,  &stru_1003AE680);
  uint64_t v13 = self->_networkService;
  self->_networkService = v12;

  -[NSNetService setDelegate:](self->_networkService, "setDelegate:", self);
  id v14 = [(id)objc_opt_class(self) _netServiceTXTRecordDataWithDeviceInfo:v5];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSNetService setTXTRecordData:](self->_networkService, "setTXTRecordData:", v15);

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  id v17 = [v16 usePeerToPeerExternalDeviceConnections];

  uint64_t v19 = _MRLogForCategory(0LL, v18);
  __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = "NO";
    if ((_DWORD)v17) {
      uint64_t v21 = "YES";
    }
    int v22 = 136315138;
    __int16 v23 = (MRDBonjourRemoteControlService *)v21;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Configuring remote control network service with includesPeerToPeer = %s",  (uint8_t *)&v22,  0xCu);
  }

  -[NSNetService setIncludesPeerToPeer:](self->_networkService, "setIncludesPeerToPeer:", v17);
  if (self->_started) {
    -[MRDBonjourRemoteControlService start](self, "start");
  }
}

- (MRDBonjourRemoteControlServiceDelegate)delegate
{
  return (MRDBonjourRemoteControlServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)netServiceType
{
  return self->_netServiceType;
}

- (NSData)lastKnownBluetoothAddress
{
  return self->_lastKnownBluetoothAddress;
}

- (void)setLastKnownBluetoothAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end