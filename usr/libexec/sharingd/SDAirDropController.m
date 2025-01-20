@interface SDAirDropController
- (SDAirDropController)init;
- (SDAirDropControllerDelegate)delegate;
- (void)addObservers;
- (void)configureSettingsForAirDrop;
- (void)dealloc;
- (void)removeObservers;
- (void)setDelegate:(id)a3;
- (void)setProperty:(void *)a3 forKey:(id)a4;
- (void)setStatusAndNotify;
- (void)somethingChanged:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropController

- (SDAirDropController)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDAirDropController;
  v2 = -[SDAirDropController init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_started = 0;
    v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    properties = v3->_properties;
    v3->_properties = v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v6;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropController;
  -[SDAirDropController dealloc](&v3, "dealloc");
}

- (void)configureSettingsForAirDrop
{
  unsigned int v3 = -[SDStatusMonitor bluetoothEnabled](self->_monitor, "bluetoothEnabled");
  char v4 = v3;
  uint64_t v5 = v3 ^ 1;
  unsigned int v6 = -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled");
  char v7 = v6;
  uint64_t v8 = v6 ^ 1;
  if ((v5 & 1) != 0 || (_DWORD)v8)
  {
    if (-[SDStatusMonitor deviceSupportsWAPI](self->_monitor, "deviceSupportsWAPI"))
    {
      -[SDAirDropController presentEnableRadiosAlertForBluetooth:andWLAN:]( self,  "presentEnableRadiosAlertForBluetooth:andWLAN:",  v5,  v8);
    }

    else
    {
      if ((v7 & 1) == 0) {
        -[SDStatusMonitor setWirelessEnabled:](self->_monitor, "setWirelessEnabled:", 1LL);
      }
      if ((v4 & 1) == 0) {
        -[SDStatusMonitor setBluetoothEnabled:](self->_monitor, "setBluetoothEnabled:", 1LL);
      }
    }
  }

- (void)setProperty:(void *)a3 forKey:(id)a4
{
  id v6 = a4;
  properties = self->_properties;
  v12 = v6;
  if (!a3)
  {
    -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", v6);
LABEL_12:
    objc_super v9 = v12;
    goto LABEL_13;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", a3, v6);
  unsigned int v8 = [v12 isEqual:kSFOperationDiscoverableModeKey];
  objc_super v9 = v12;
  if (v8)
  {
    if (CFEqual(a3, kSFOperationDiscoverableModeContactsOnly))
    {
      char v10 = variable initialization expression of SDAirDropHashStoreCDB.destroyed();
      objc_super v9 = v12;
      if ((v10 & 1) != 0) {
        goto LABEL_13;
      }
      char v11 = sub_100036260();
    }

    else
    {
      if (!CFEqual(a3, kSFOperationDiscoverableModeEveryone))
      {
LABEL_11:
        -[SDStatusMonitor setDiscoverableMode:](self->_monitor, "setDiscoverableMode:", a3);
        goto LABEL_12;
      }

      char v11 = variable initialization expression of SDAirDropHashStoreCDB.destroyed();
    }

    objc_super v9 = v12;
    if ((v11 & 1) == 0)
    {
      -[SDAirDropController configureSettingsForAirDrop](self, "configureSettingsForAirDrop");
      goto LABEL_11;
    }
  }

- (void)setStatusAndNotify
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor discoverableMode](self->_monitor, "discoverableMode"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v3,  kSFOperationDiscoverableModeKey);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100176A38;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)somethingChanged:(id)a3
{
}

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.AppleIDAccountInfoChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.AppleIDChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.DiscoverableModeChanged" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)start
{
  if (!self->_started)
  {
    id v3 = (OS_os_transaction *)os_transaction_create("SDAirDropController");
    transaction = self->_transaction;
    self->_transaction = v3;

    self->_started = 1;
    -[SDAirDropController addObservers](self, "addObservers");
    -[SDAirDropController setStatusAndNotify](self, "setStatusAndNotify");
  }

- (void)stop
{
  if (self->_started)
  {
    uint64_t v3 = kSFOperationDiscoverableModeKey;
    id v5 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationDiscoverableModeKey));
    if (v5)
    {
      -[SDAirDropController setProperty:forKey:](self, "setProperty:forKey:", kSFOperationDiscoverableModeOff, v3);
      -[NSMutableDictionary removeObjectForKey:](self->_properties, "removeObjectForKey:", v3);
    }

    self->_started = 0;
    -[SDAirDropController removeObservers](self, "removeObservers");
    transaction = self->_transaction;
    self->_transaction = 0LL;
  }

- (SDAirDropControllerDelegate)delegate
{
  return (SDAirDropControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end