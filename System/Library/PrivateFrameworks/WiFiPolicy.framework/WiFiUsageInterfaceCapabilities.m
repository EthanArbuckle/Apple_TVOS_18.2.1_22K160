@interface WiFiUsageInterfaceCapabilities
- (BOOL)deviceSupports:(int)a3;
- (NSSet)deviceCapabilities;
- (NSString)interfaceName;
- (WiFiUsageInterfaceCapabilities)initWithInterfaceName:(id)a3;
- (_Apple80211)a11Ref;
- (id)description;
- (int)supportedPhyModes;
- (unint64_t)currentNumberOfSpatialStreams;
- (unint64_t)maxInterfacePHYRate;
- (unint64_t)maxPHYRate;
- (void)dealloc;
- (void)setA11Ref:(_Apple80211 *)a3;
- (void)setDeviceCapabilities:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setMaxPHYRate:(unint64_t)a3;
- (void)setSupportedPhyModes:(int)a3;
@end

@implementation WiFiUsageInterfaceCapabilities

- (WiFiUsageInterfaceCapabilities)initWithInterfaceName:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    NSLog( @"%s - Cannot create InterfaceCapabilities (invalid interfaceName:%@)",  "-[WiFiUsageInterfaceCapabilities initWithInterfaceName:]",  0LL);
LABEL_6:
    v9 = 0LL;
    goto LABEL_7;
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WiFiUsageInterfaceCapabilities;
  self = -[WiFiUsageInterfaceCapabilities init](&v11, sel_init);
  v5 = (NSString *)[v4 copy];
  interfaceName = self->_interfaceName;
  self->_interfaceName = v5;

  uint64_t v7 = Apple80211Open();
  if ((_DWORD)v7)
  {
    NSLog( @"%s: Apple80211Open returned err %d",  "-[WiFiUsageInterfaceCapabilities initWithInterfaceName:]",  v7);
    goto LABEL_6;
  }

  uint64_t v8 = Apple80211BindToInterface();
  if ((_DWORD)v8)
  {
    NSLog( @"%s: Apple80211BindToInterface returned err %d",  "-[WiFiUsageInterfaceCapabilities initWithInterfaceName:]",  v8);
    goto LABEL_6;
  }

  self->_maxPHYRate = 0x7FFFFFFFFFFFFFFFLL;
  self->_supportedPhyModes = 0;
  self = self;
  v9 = self;
LABEL_7:

  return v9;
}

- (unint64_t)maxInterfacePHYRate
{
  unint64_t result = self->_maxPHYRate;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[WiFiUsageInterfaceCapabilities supportedPhyModes](self, "supportedPhyModes"))
    {
      if (-[WiFiUsageInterfaceCapabilities deviceSupports:](self, "deviceSupports:", 94LL)) {
        uint64_t v4 = 160LL;
      }
      else {
        uint64_t v4 = 80LL;
      }
      unint64_t result = +[WiFiUsageLQMTransformations getMaxPhyrateWithNss:Bw:Phy:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getMaxPhyrateWithNss:Bw:Phy:",  2LL,  v4,  self->_supportedPhyModes);
      self->_maxPHYRate = result;
    }

    else
    {
      return self->_maxPHYRate;
    }
  }

  return result;
}

- (int)supportedPhyModes
{
  int result = self->_supportedPhyModes;
  if (!result)
  {
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = Apple80211Get();
    if ((_DWORD)v5)
    {
      NSLog( @"%s: Apple80211CopyValue returned err %d",  "-[WiFiUsageInterfaceCapabilities supportedPhyModes]",  v5);
    }

    else
    {
      [v4 objectForKey:@"PHYMODE_SUPPORTED"];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      self->_supportedPhyModes = [v6 unsignedIntValue];
    }

    return self->_supportedPhyModes;
  }

  return result;
}

- (unint64_t)currentNumberOfSpatialStreams
{
  uint64_t v2 = Apple80211CopyValue();
  if ((_DWORD)v2) {
    NSLog( @"%s: Apple80211CopyValue returned err %d",  "-[WiFiUsageInterfaceCapabilities currentNumberOfSpatialStreams]",  v2);
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSSet)deviceCapabilities
{
  deviceCapabilities = self->_deviceCapabilities;
  if (!deviceCapabilities)
  {
    uint64_t v4 = Apple80211CopyValue();
    if ((_DWORD)v4)
    {
      NSLog( @"%s: Apple80211CopyValue returned err %d",  "-[WiFiUsageInterfaceCapabilities deviceCapabilities]",  v4);
    }

    else
    {
      [MEMORY[0x189604010] setWithArray:0];
      uint64_t v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v6 = self->_deviceCapabilities;
      self->_deviceCapabilities = v5;
    }

    deviceCapabilities = self->_deviceCapabilities;
  }

  return deviceCapabilities;
}

- (BOOL)deviceSupports:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[WiFiUsageInterfaceCapabilities deviceCapabilities](self, "deviceCapabilities");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    return 0;
  }
  deviceCapabilities = self->_deviceCapabilities;
  [MEMORY[0x189607968] numberWithUnsignedInt:v3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(deviceCapabilities) = -[NSSet containsObject:](deviceCapabilities, "containsObject:", v7);

  return (char)deviceCapabilities;
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  interfaceName = self->_interfaceName;
  +[WiFiUsagePrivacyFilter getLabelForPhyModes:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForPhyModes:",  -[WiFiUsageInterfaceCapabilities supportedPhyModes](self, "supportedPhyModes"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[WiFiUsagePrivacyFilter getLabelForPhyModes:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForPhyModes:",  +[WiFiUsageLQMTransformations maxPhyModeFrom:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "maxPhyModeFrom:",  self->_supportedPhyModes));
  [v3 stringWithFormat:@"%@: supportedPhyModes:%@ maxPhyMode:%@ maxPHYRate:%d", interfaceName, v5, v6, -[WiFiUsageInterfaceCapabilities maxInterfacePHYRate](self, "maxInterfacePHYRate")];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  if (self->_a11Ref) {
    Apple80211Close();
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiUsageInterfaceCapabilities;
  -[WiFiUsageInterfaceCapabilities dealloc](&v3, sel_dealloc);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (_Apple80211)a11Ref
{
  return self->_a11Ref;
}

- (void)setA11Ref:(_Apple80211 *)a3
{
  self->_a11Ref = a3;
}

- (unint64_t)maxPHYRate
{
  return self->_maxPHYRate;
}

- (void)setMaxPHYRate:(unint64_t)a3
{
  self->_maxPHYRate = a3;
}

- (void)setSupportedPhyModes:(int)a3
{
  self->_supportedPhyModes = a3;
}

- (void)setDeviceCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end