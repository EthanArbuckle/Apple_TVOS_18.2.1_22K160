@interface ComponentTVRemote
- (BOOL)isCharging;
- (BOOL)isPresent;
- (BOOL)isRemoteConnected;
- (TVSBluetoothRemoteInfo)tvRemote;
- (id)batteryLevel;
- (id)remoteType;
- (id)serialNumber;
- (void)populateAttributes:(id)a3;
- (void)setTvRemote:(id)a3;
@end

@implementation ComponentTVRemote

- (BOOL)isPresent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote"));
  -[ComponentTVRemote setTvRemote:](self, "setTvRemote:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTVRemote tvRemote](self, "tvRemote"));
  if (!v4) {
    +[TVSBluetoothRemoteUtilities stopConnectionMonitoring]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "stopConnectionMonitoring");
  }
  return v4 != 0LL;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  +[TVSBluetoothRemoteUtilities startListeningForPowerSources]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "startListeningForPowerSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTVRemote serialNumber](self, "serialNumber"));
  [v4 setObject:v5 forKeyedSubscript:@"serialNumber"];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ComponentTVRemote isRemoteConnected](self, "isRemoteConnected")));
  [v4 setObject:v6 forKeyedSubscript:@"isRemoteConnected"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTVRemote remoteType](self, "remoteType"));
  [v4 setObject:v7 forKeyedSubscript:@"remoteType"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTVRemote batteryLevel](self, "batteryLevel"));
  [v4 setObject:v8 forKeyedSubscript:@"batteryLevel"];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ComponentTVRemote isCharging](self, "isCharging")));
  [v4 setObject:v9 forKeyedSubscript:@"isCharging"];

  +[TVSBluetoothRemoteUtilities stopListeningForPowerSources]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "stopListeningForPowerSources");
  +[TVSBluetoothRemoteUtilities stopConnectionMonitoring]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "stopConnectionMonitoring");
}

- (BOOL)isRemoteConnected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTVRemote tvRemote](self, "tvRemote"));
  unsigned __int8 v3 = [v2 isConnected];

  return v3;
}

- (id)batteryLevel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTVRemote tvRemote](self, "tvRemote"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[TVSBluetoothRemoteUtilities batteryLevelForRemoteName:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "batteryLevelForRemoteName:",  v3)));

  id v5 = numberOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)serialNumber
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTVRemote tvRemote](self, "tvRemote"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);
  id v4 = stringOrNull(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (BOOL)isCharging
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTVRemote tvRemote](self, "tvRemote"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[TVSBluetoothRemoteUtilities chargingStateForRemoteName:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "chargingStateForRemoteName:",  v3)));
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (id)remoteType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTVRemote tvRemote](self, "tvRemote"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v2 remoteType]));

  id v4 = numberOrNull(v3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (TVSBluetoothRemoteInfo)tvRemote
{
  return self->_tvRemote;
}

- (void)setTvRemote:(id)a3
{
}

- (void).cxx_destruct
{
}

@end