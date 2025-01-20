@interface TVSettingsSystemPairingsPairing
- (NSString)displayName;
- (NSString)rawDisplayName;
- (NSUUID)key;
- (TVSettingsSystemPairingsFacade)facade;
- (TVSettingsSystemPairingsPairing)initWithCoreUtilsPairedPeer:(id)a3 isDevicePairing:(BOOL)a4;
- (TVSettingsSystemPairingsPairing)initWithRemotePairingPairedHost:(id)a3;
- (int64_t)source;
- (void)setFacade:(id)a3;
- (void)setRawDisplayName:(id)a3;
- (void)unpairWithCompletion:(id)a3;
- (void)updateWithCoreUtilsPeer:(id)a3;
- (void)updateWithRemotePairingPairedHost:(id)a3;
@end

@implementation TVSettingsSystemPairingsPairing

- (TVSettingsSystemPairingsPairing)initWithCoreUtilsPairedPeer:(id)a3 isDevicePairing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSettingsSystemPairingsPairing;
  v7 = -[TVSettingsSystemPairingsPairing init](&v14, "init");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v9 = (NSUUID *)[v8 copy];
    key = v7->_key;
    v7->_key = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 name]);
    rawDisplayName = v7->_rawDisplayName;
    v7->_rawDisplayName = (NSString *)v11;

    v7->_source = v4;
  }

  return v7;
}

- (TVSettingsSystemPairingsPairing)initWithRemotePairingPairedHost:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsSystemPairingsPairing;
  v5 = -[TVSettingsSystemPairingsPairing init](&v12, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v7 = (NSUUID *)[v6 copy];
    key = v5->_key;
    v5->_key = v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 name]);
    rawDisplayName = v5->_rawDisplayName;
    v5->_rawDisplayName = (NSString *)v9;

    v5->_source = 2LL;
  }

  return v5;
}

- (NSString)displayName
{
  v2 = self->_rawDisplayName;
  v3 = v2;
  if (v2 && -[NSString length](v2, "length"))
  {
    id v4 = -[NSString copy](v3, "copy");
  }

  else
  {
    uint64_t v5 = TSKLocString(@"SystemPairingUnlabeledDeviceTitle");
    id v4 = (id)objc_claimAutoreleasedReturnValue(v5);
  }

  id v6 = v4;

  return (NSString *)v6;
}

- (void)updateWithCoreUtilsPeer:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 name]);
  -[TVSettingsSystemPairingsPairing setRawDisplayName:](self, "setRawDisplayName:", v4);
}

- (void)updateWithRemotePairingPairedHost:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 name]);
  -[TVSettingsSystemPairingsPairing setRawDisplayName:](self, "setRawDisplayName:", v4);
}

- (void)unpairWithCompletion:(id)a3
{
  p_facade = &self->_facade;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_facade);
  [WeakRetained unpairDevice:self withCompletion:v5];
}

- (NSUUID)key
{
  return self->_key;
}

- (int64_t)source
{
  return self->_source;
}

- (TVSettingsSystemPairingsFacade)facade
{
  return (TVSettingsSystemPairingsFacade *)objc_loadWeakRetained((id *)&self->_facade);
}

- (void)setFacade:(id)a3
{
}

- (NSString)rawDisplayName
{
  return self->_rawDisplayName;
}

- (void)setRawDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end