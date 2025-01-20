@interface DMMigrationPluginWrapperWatchdog
+ (id)_messageStringWithPluginBundleIdentifier:(id)a3 durationDescription:(id)a4 backupDeviceUUID:(id)a5;
- (DMMigrationPluginWrapperWatchdog)initWithPluginBundleIdentifier:(id)a3 backupDeviceUUID:(id)a4;
- (DMPluginFaulter)faulter;
- (DMTimer)timer;
- (NSString)backupDeviceUUID;
- (NSString)pluginBundleIdentifier;
- (unint64_t)fireCount;
- (unint64_t)secondsBeforeNextFault;
- (unint64_t)secondsOfLeeway;
- (void)_migrationPluginDuration10Minutes;
- (void)_migrationPluginDuration20Minutes;
- (void)_migrationPluginDuration40Minutes;
- (void)_migrationPluginDuration5Minutes;
- (void)cancel;
- (void)resume;
- (void)setBackupDeviceUUID:(id)a3;
- (void)setFaulter:(id)a3;
- (void)setFireCount:(unint64_t)a3;
- (void)setPluginBundleIdentifier:(id)a3;
- (void)setSecondsBeforeNextFault:(unint64_t)a3;
- (void)setSecondsOfLeeway:(unint64_t)a3;
- (void)setTimer:(id)a3;
@end

@implementation DMMigrationPluginWrapperWatchdog

- (DMMigrationPluginWrapperWatchdog)initWithPluginBundleIdentifier:(id)a3 backupDeviceUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DMMigrationPluginWrapperWatchdog;
  v8 = -[DMMigrationPluginWrapperWatchdog init](&v19, "init");
  v9 = v8;
  if (v8)
  {
    -[DMMigrationPluginWrapperWatchdog setPluginBundleIdentifier:](v8, "setPluginBundleIdentifier:", v6);
    -[DMMigrationPluginWrapperWatchdog setBackupDeviceUUID:](v9, "setBackupDeviceUUID:", v7);
    v10 = objc_alloc_init(&OBJC_CLASS___DMPluginFaulter);
    -[DMMigrationPluginWrapperWatchdog setFaulter:](v9, "setFaulter:", v10);

    -[DMMigrationPluginWrapperWatchdog setSecondsBeforeNextFault:](v9, "setSecondsBeforeNextFault:", 300LL);
    -[DMMigrationPluginWrapperWatchdog setSecondsOfLeeway:](v9, "setSecondsOfLeeway:", 10LL);
    -[DMMigrationPluginWrapperWatchdog setFireCount:](v9, "setFireCount:", 0LL);
    v11 = objc_alloc(&OBJC_CLASS___DMTimer);
    id v12 = -[DMMigrationPluginWrapperWatchdog secondsBeforeNextFault](v9, "secondsBeforeNextFault");
    id v13 = -[DMMigrationPluginWrapperWatchdog secondsOfLeeway](v9, "secondsOfLeeway");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000629C;
    v17[3] = &unk_10000C398;
    v14 = v9;
    v18 = v14;
    v15 = -[DMTimer initWithSecondsBeforeFirstFire:secondsOfLeeway:fireBlock:]( v11,  "initWithSecondsBeforeFirstFire:secondsOfLeeway:fireBlock:",  v12,  v13,  v17);
    -[DMMigrationPluginWrapperWatchdog setTimer:](v14, "setTimer:", v15);
  }

  return v9;
}

- (void)resume
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog timer](self, "timer"));
  [v2 resume];
}

- (void)cancel
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog timer](self, "timer"));
  [v2 cancelSynchronously];
}

- (void)_migrationPluginDuration5Minutes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog pluginBundleIdentifier](self, "pluginBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog backupDeviceUUID](self, "backupDeviceUUID"));
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[DMMigrationPluginWrapperWatchdog _messageStringWithPluginBundleIdentifier:durationDescription:backupDeviceUUID:]( &OBJC_CLASS___DMMigrationPluginWrapperWatchdog,  "_messageStringWithPluginBundleIdentifier:durationDescription:backupDeviceUUID:",  v3,  @"5 minutes",  v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog faulter](self, "faulter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog pluginBundleIdentifier](self, "pluginBundleIdentifier"));
  [v5 faultWithPluginIdentifier:v6 message:v7];
}

- (void)_migrationPluginDuration10Minutes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog pluginBundleIdentifier](self, "pluginBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog backupDeviceUUID](self, "backupDeviceUUID"));
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[DMMigrationPluginWrapperWatchdog _messageStringWithPluginBundleIdentifier:durationDescription:backupDeviceUUID:]( &OBJC_CLASS___DMMigrationPluginWrapperWatchdog,  "_messageStringWithPluginBundleIdentifier:durationDescription:backupDeviceUUID:",  v3,  @"10 minutes",  v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog faulter](self, "faulter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog pluginBundleIdentifier](self, "pluginBundleIdentifier"));
  [v5 faultWithPluginIdentifier:v6 message:v7];
}

- (void)_migrationPluginDuration20Minutes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog pluginBundleIdentifier](self, "pluginBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog backupDeviceUUID](self, "backupDeviceUUID"));
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[DMMigrationPluginWrapperWatchdog _messageStringWithPluginBundleIdentifier:durationDescription:backupDeviceUUID:]( &OBJC_CLASS___DMMigrationPluginWrapperWatchdog,  "_messageStringWithPluginBundleIdentifier:durationDescription:backupDeviceUUID:",  v3,  @"20 minutes",  v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog faulter](self, "faulter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog pluginBundleIdentifier](self, "pluginBundleIdentifier"));
  [v5 faultWithPluginIdentifier:v6 message:v7];
}

- (void)_migrationPluginDuration40Minutes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog pluginBundleIdentifier](self, "pluginBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog backupDeviceUUID](self, "backupDeviceUUID"));
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[DMMigrationPluginWrapperWatchdog _messageStringWithPluginBundleIdentifier:durationDescription:backupDeviceUUID:]( &OBJC_CLASS___DMMigrationPluginWrapperWatchdog,  "_messageStringWithPluginBundleIdentifier:durationDescription:backupDeviceUUID:",  v3,  @"40 minutes",  v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog faulter](self, "faulter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationPluginWrapperWatchdog pluginBundleIdentifier](self, "pluginBundleIdentifier"));
  [v5 faultWithPluginIdentifier:v6 message:v7];
}

+ (id)_messageStringWithPluginBundleIdentifier:(id)a3 durationDescription:(id)a4 backupDeviceUUID:(id)a5
{
  id v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Migration plugin %@ still running after %@",  a3,  a4));
  if (v7)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - backup device UUID %@",  v8,  v7));

    v8 = (void *)v9;
  }

  return v8;
}

- (NSString)pluginBundleIdentifier
{
  return self->_pluginBundleIdentifier;
}

- (void)setPluginBundleIdentifier:(id)a3
{
}

- (NSString)backupDeviceUUID
{
  return self->_backupDeviceUUID;
}

- (void)setBackupDeviceUUID:(id)a3
{
}

- (DMPluginFaulter)faulter
{
  return self->_faulter;
}

- (void)setFaulter:(id)a3
{
}

- (unint64_t)secondsBeforeNextFault
{
  return self->_secondsBeforeNextFault;
}

- (void)setSecondsBeforeNextFault:(unint64_t)a3
{
  self->_secondsBeforeNextFault = a3;
}

- (unint64_t)secondsOfLeeway
{
  return self->_secondsOfLeeway;
}

- (void)setSecondsOfLeeway:(unint64_t)a3
{
  self->_secondsOfLeeway = a3;
}

- (DMTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (unint64_t)fireCount
{
  return self->_fireCount;
}

- (void)setFireCount:(unint64_t)a3
{
  self->_fireCount = a3;
}

- (void).cxx_destruct
{
}

@end