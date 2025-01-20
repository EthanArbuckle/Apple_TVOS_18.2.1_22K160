@interface NRDevicePreferencesManager
- (id)description;
- (void)dealloc;
@end

@implementation NRDevicePreferencesManager

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (NRDevicePreferencesManager *)self->_nrUUID;
  }
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 1LL);

  if (IsLevelEnabled)
  {
    if (v2) {
      nrUUID = v2->_nrUUID;
    }
    else {
      nrUUID = 0LL;
    }
    v6 = nrUUID;
    v8 = (void *)_NRCopyLogObjectForNRUUID(v6, v7);
    _NRLogWithArgs(v8, 1LL, "%s%.30s:%-4d Dealloc: %@", ", "-[NRDevicePreferencesManager dealloc]"", 64LL, v2);
  }

  v9.receiver = v2;
  v9.super_class = (Class)&OBJC_CLASS___NRDevicePreferencesManager;
  -[NRDevicePreferencesManager dealloc](&v9, "dealloc");
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  if (self)
  {
    v4 = self->_devicePreferencesTypeLink;
    policyTrafficClassifiersDict = self->_policyTrafficClassifiersDict;
  }

  else
  {
    v4 = 0LL;
    policyTrafficClassifiersDict = 0LL;
  }

  v6 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"Active Link Preferences: %@, Policy Traffic Classifiers: %@",  v4,  policyTrafficClassifiersDict);

  return v6;
}

- (void).cxx_destruct
{
}

@end