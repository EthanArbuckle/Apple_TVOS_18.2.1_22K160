@interface NEL2TPUserPreferences
+ (SCNetworkConnectionRef)createConnectionForConfiguration:(uint64_t)a1;
+ (void)clearCurrentForConfiguration:(uint64_t)a1;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isCurrent;
- (BOOL)isForced;
- (NEL2TPUserPreferences)initWithConfiguration:(id)a3;
- (NEVPNProtocolL2TP)settings;
- (NSString)identifier;
- (NSString)name;
- (void)dealloc;
- (void)setCurrent:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation NEL2TPUserPreferences

- (NEL2TPUserPreferences)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEL2TPUserPreferences;
  v5 = -[NEL2TPUserPreferences init](&v11, sel_init);
  if (v5)
  {
    SCNetworkConnectionRef v6 = +[NEL2TPUserPreferences createConnectionForConfiguration:]((uint64_t)&OBJC_CLASS___NEL2TPUserPreferences, v4);
    v5->_userPrefs = (__SCUserPreferencesRef *)SCNetworkConnectionCreateUserPreferences();
    CFRelease(v6);
    if (!v5->_userPrefs)
    {
      v9 = 0LL;
      goto LABEL_6;
    }

    uint64_t v7 = SCUserPreferencesGetUniqueID();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;
  }

  v9 = v5;
LABEL_6:

  return v9;
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (NEL2TPUserPreferences *)self->_userPrefs;
  }
  CFRelease(self);
  v3.receiver = v2;
  v3.super_class = (Class)&OBJC_CLASS___NEL2TPUserPreferences;
  -[NEL2TPUserPreferences dealloc](&v3, sel_dealloc);
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[NEL2TPUserPreferences name](self, "name");
  if (v5
    && (SCNetworkConnectionRef v6 = (void *)v5,
        -[NEL2TPUserPreferences name](self, "name"),
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v6,
        v8))
  {
    BOOL v9 = 1;
  }

  else
  {
    [v4 addObject:@"L2TP user preferences has no name"];
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setName:(id)a3
{
}

- (NEVPNProtocolL2TP)settings
{
  return (NEVPNProtocolL2TP *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (BOOL)isCurrent
{
  return self->_current;
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (BOOL)isForced
{
  return self->_forced;
}

- (void).cxx_destruct
{
}

+ (SCNetworkConnectionRef)createConnectionForConfiguration:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  [v2 identifier];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  [v3 UUIDString];
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  SCNetworkConnectionRef v5 = SCNetworkConnectionCreateWithServiceID((CFAllocatorRef)*MEMORY[0x189604DB0], v4, 0LL, 0LL);
  return v5;
}

+ (void)clearCurrentForConfiguration:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  SCNetworkConnectionRef v3 = +[NEL2TPUserPreferences createConnectionForConfiguration:]((uint64_t)&OBJC_CLASS___NEL2TPUserPreferences, v2);

  UserPreferences = (const void *)SCNetworkConnectionCreateUserPreferences();
  SCUserPreferencesSetCurrent();
  SCUserPreferencesRemove();
  CFRelease(UserPreferences);
  CFRelease(v3);
}

@end