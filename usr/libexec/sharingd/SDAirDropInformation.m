@interface SDAirDropInformation
- (BOOL)BOOLValue:(void *)a3;
- (SDAirDropInformation)init;
- (SDAirDropInformationDelegate)delegate;
- (void)addObservers;
- (void)dealloc;
- (void)removeObservers;
- (void)setDelegate:(id)a3;
- (void)setInformationAndNotify;
- (void)setProperty:(void *)a3 forKey:(id)a4;
- (void)somethingChanged:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropInformation

- (SDAirDropInformation)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDAirDropInformation;
  v2 = -[SDAirDropInformation init](&v9, "init");
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
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropInformation;
  -[SDAirDropInformation dealloc](&v3, "dealloc");
}

- (BOOL)BOOLValue:(void *)a3
{
  if (!a3) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(a3);
  return v4 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)a3) != 0;
}

- (void)setProperty:(void *)a3 forKey:(id)a4
{
  id v6 = a4;
  properties = self->_properties;
  id v8 = v6;
  if (a3) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", a3, v6);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", v6);
  }
  if ([v8 isEqual:kSFOperationWirelessEnabledKey])
  {
    -[SDStatusMonitor setWirelessEnabled:]( self->_monitor,  "setWirelessEnabled:",  -[SDAirDropInformation BOOLValue:](self, "BOOLValue:", a3));
  }

  else if ([v8 isEqual:kSFOperationBluetoothEnabledKey])
  {
    -[SDStatusMonitor setBluetoothEnabled:]( self->_monitor,  "setBluetoothEnabled:",  -[SDAirDropInformation BOOLValue:](self, "BOOLValue:", a3));
  }

  else if (([v8 isEqualToString:kSFOperationWirelessAccessPointKey] & 1) == 0 {
         && [v8 isEqualToString:kSFOperationAirplaneModeEnabledKey])
  }
  {
    -[SDStatusMonitor setAirplaneModeEnabled:]( self->_monitor,  "setAirplaneModeEnabled:",  -[SDAirDropInformation BOOLValue:](self, "BOOLValue:", a3));
  }
}

- (void)setInformationAndNotify
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor wirelessCarPlay](self->_monitor, "wirelessCarPlay")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v3,  kSFOperationWirelessCarPlayKey);

  CFTypeID v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v4,  kSFOperationWirelessEnabledKey);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor bluetoothEnabledIncludingRestricted]( self->_monitor,  "bluetoothEnabledIncludingRestricted")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v5,  kSFOperationBluetoothEnabledKey);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor airplaneModeEnabled](self->_monitor, "airplaneModeEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v6,  kSFOperationAirplaneModeEnabledKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor computerToComputer](self->_monitor, "computerToComputer")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v7,  kSFOperationComputerToComputerKey);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor deviceSupportsWAPI](self->_monitor, "deviceSupportsWAPI")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v8,  kSFOperationDeviceSupportsWAPIKey);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor wirelessAccessPoint](self->_monitor, "wirelessAccessPoint")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v9,  kSFOperationWirelessAccessPointKey);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor someComputerName](self->_monitor, "someComputerName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v10,  kSFOperationReceiverComputerNameKey);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009FEF8;
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
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.UserPictureChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.ComputerNameChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.WirelessModeChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.AirplaneModeChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.BluetoothPowerChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.HotspotMISStateChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.WirelessCarPlayChanged" object:0];
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
    self->_started = 1;
    -[SDAirDropInformation addObservers](self, "addObservers");
    -[SDAirDropInformation setInformationAndNotify](self, "setInformationAndNotify");
  }

- (void)stop
{
  if (self->_started)
  {
    self->_started = 0;
    -[SDAirDropInformation removeObservers](self, "removeObservers");
  }

- (SDAirDropInformationDelegate)delegate
{
  return (SDAirDropInformationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end