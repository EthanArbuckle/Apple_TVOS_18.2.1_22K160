@interface TVSSBluetoothRemoteManager
+ (id)sharedInstance;
- (TVSBluetoothRemoteInfo)connectedBluetoothRemote;
- (TVSSBluetoothRemoteManager)init;
- (TVSSBluetoothRemoteManagingDelegate)delegate;
- (void)_handleBluetoothRemoteDidConnectNotification:(id)a3;
- (void)_handleBluetoothRemoteDidDisconnectNotification:(id)a3;
- (void)_handleBluetoothRemotePowerSourceInfoDidChangeNotification:(id)a3;
- (void)_handleBluetoothRemotePowerSourceLimitedSourceDidChangeNotification:(id)a3;
- (void)_notifyDelegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation TVSSBluetoothRemoteManager

+ (id)sharedInstance
{
  id v10 = a1;
  SEL v9 = a2;
  obj = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_1000BB604;
  v7 = &unk_1001B6430;
  id v8 = a1;
  v12 = (dispatch_once_t *)&unk_100221D40;
  id location = 0LL;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1) {
    dispatch_once(v12, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221D38;
}

- (TVSSBluetoothRemoteManager)init
{
  SEL v6 = a2;
  v7 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSSBluetoothRemoteManager;
  v7 = -[TVSSBluetoothRemoteManager init](&v5, "init");
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    int v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "_handleBluetoothRemoteDidConnectNotification:",  TVSBluetoothRemoteDidConnectNotification);
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "_handleBluetoothRemoteDidDisconnectNotification:",  TVSBluetoothRemoteDidDisconnectNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "_handleBluetoothRemotePowerSourceInfoDidChangeNotification:",  TVSBluetoothRemotePowerSourceInfoDidChangeNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "_handleBluetoothRemotePowerSourceLimitedSourceDidChangeNotification:",  TVSBluetoothRemotePowerSourceLimitedSourceDidChangeNotification,  0LL);
    +[TVSBluetoothRemoteUtilities setEnableExtendedAttributes:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "setEnableExtendedAttributes:",  0LL);
    +[TVSBluetoothRemoteUtilities startListeningForPowerSources]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "startListeningForPowerSources");
    +[TVSBluetoothRemoteUtilities startConnectionMonitoring]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "startConnectionMonitoring");
    objc_storeStrong((id *)&v4, 0LL);
  }

  v3 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  return v3;
}

- (void)dealloc
{
  int v4 = self;
  v3[1] = (id)a2;
  +[TVSBluetoothRemoteUtilities stopConnectionMonitoring]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "stopConnectionMonitoring");
  +[TVSBluetoothRemoteUtilities stopListeningForPowerSources]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "stopListeningForPowerSources");
  v3[0] = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  objc_msgSend(v3[0], "removeObserver:name:object:", v4, TVSBluetoothRemoteDidConnectNotification);
  [v3[0] removeObserver:v4 name:TVSBluetoothRemoteDidDisconnectNotification object:0];
  [v3[0] removeObserver:v4 name:TVSBluetoothRemotePowerSourceInfoDidChangeNotification object:0];
  [v3[0] removeObserver:v4 name:TVSBluetoothRemotePowerSourceLimitedSourceDidChangeNotification object:0];
  objc_storeStrong(v3, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSBluetoothRemoteManager;
  -[TVSSBluetoothRemoteManager dealloc](&v2, "dealloc");
}

- (void)_handleBluetoothRemoteDidConnectNotification:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)BluetoothRemoteManagerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100014A50((uint64_t)v6, (uint64_t)"-[TVSSBluetoothRemoteManager _handleBluetoothRemoteDidConnectNotification:]");
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: Remote has connected. Will notify delegate.",  v6,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVSSBluetoothRemoteManager _notifyDelegate](v5, "_notifyDelegate");
  objc_storeStrong(location, 0LL);
}

- (void)_handleBluetoothRemoteDidDisconnectNotification:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)BluetoothRemoteManagerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100014A50( (uint64_t)v6,  (uint64_t)"-[TVSSBluetoothRemoteManager _handleBluetoothRemoteDidDisconnectNotification:]");
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: Remote has disconnected. Will notify delegate.",  v6,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVSSBluetoothRemoteManager _notifyDelegate](v5, "_notifyDelegate");
  objc_storeStrong(location, 0LL);
}

- (void)_handleBluetoothRemotePowerSourceInfoDidChangeNotification:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)BluetoothRemoteManagerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100014A50( (uint64_t)v6,  (uint64_t)"-[TVSSBluetoothRemoteManager _handleBluetoothRemotePowerSourceInfoDidChangeNotification:]");
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: Remote power source info did change. Will notify delegate.",  v6,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVSSBluetoothRemoteManager _notifyDelegate](v5, "_notifyDelegate");
  objc_storeStrong(location, 0LL);
}

- (void)_handleBluetoothRemotePowerSourceLimitedSourceDidChangeNotification:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)BluetoothRemoteManagerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100014A50( (uint64_t)v6,  (uint64_t)"-[TVSSBluetoothRemoteManager _handleBluetoothRemotePowerSourceLimitedSourceDidChangeNotification:]");
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: Remote limited power source info did change. Will notify delegate.",  v6,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVSSBluetoothRemoteManager _notifyDelegate](v5, "_notifyDelegate");
  objc_storeStrong(location, 0LL);
}

- (TVSBluetoothRemoteInfo)connectedBluetoothRemote
{
  return (TVSBluetoothRemoteInfo *)+[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote",  a2,  self);
}

- (void)_notifyDelegate
{
  objc_super v2 = -[TVSSBluetoothRemoteManager delegate](self, "delegate");
  -[TVSSBluetoothRemoteManagingDelegate bluetoothRemoteManagerDidUpdate:](v2, "bluetoothRemoteManagerDidUpdate:", self);
}

- (TVSSBluetoothRemoteManagingDelegate)delegate
{
  return (TVSSBluetoothRemoteManagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end