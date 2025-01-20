@interface NEHotspotConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)hidden;
- (BOOL)isAccessory;
- (BOOL)joinOnce;
- (BOOL)useSSIDPrefix;
- (NEHotspotConfiguration)init;
- (NEHotspotConfiguration)initWithCoder:(id)a3;
- (NEHotspotConfiguration)initWithHS20Settings:(NEHotspotHS20Settings *)hs20Settings eapSettings:(NEHotspotEAPSettings *)eapSettings;
- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID;
- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID eapSettings:(NEHotspotEAPSettings *)eapSettings;
- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID passphrase:(NSString *)passphrase isWEP:(BOOL)isWEP;
- (NEHotspotConfiguration)initWithSSIDPrefix:(NSString *)SSIDPrefix;
- (NEHotspotConfiguration)initWithSSIDPrefix:(NSString *)SSIDPrefix passphrase:(NSString *)passphrase isWEP:(BOOL)isWEP;
- (NEHotspotEAPSettings)eapSettings;
- (NEHotspotHS20Settings)hs20Settings;
- (NSNumber)lifeTimeInDays;
- (NSString)SSID;
- (NSString)SSIDPrefix;
- (NSString)passphrase;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)securityType;
- (int64_t)validate;
- (uint64_t)validateEAPSettings;
- (void)encodeWithCoder:(id)a3;
- (void)setEapSettings:(id)a3;
- (void)setHidden:(BOOL)hidden;
- (void)setHs20Settings:(id)a3;
- (void)setIsAccessory:(BOOL)a3;
- (void)setJoinOnce:(BOOL)joinOnce;
- (void)setLifeTimeInDays:(NSNumber *)lifeTimeInDays;
- (void)setPassphrase:(id)a3;
- (void)setSecurityType:(int64_t)a3;
- (void)setUseSSIDPrefix:(BOOL)a3;
@end

@implementation NEHotspotConfiguration

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  v4 = -[NEHotspotConfiguration SSID](self, "SSID");
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = -[NEHotspotConfiguration SSID](self, "SSID");
    [v3 appendPrettyObject:v6 withName:@"SSID" andIndent:0 options:0];
  }
  v7 = -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
    [v3 appendPrettyObject:v9 withName:@"SSID Prefix" andIndent:0 options:0];
  }
  v10 = -[NEHotspotConfiguration lifeTimeInDays](self, "lifeTimeInDays");
  [v3 appendFormat:@"\tLife Time : %@ Days\n", v10];

  switch(-[NEHotspotConfiguration securityType](self, "securityType"))
  {
    case 1LL:
      [v3 appendPrettyObject:@"WEP" withName:@"Security Type" andIndent:0 options:0];
      v11 = -[NEHotspotConfiguration passphrase](self, "passphrase");
      v12 = @"WEP Passphrase";
      goto LABEL_9;
    case 2LL:
      [v3 appendPrettyObject:@"WPA/WPA2 Personal" withName:@"Security Type" andIndent:0 options:0];
      v11 = -[NEHotspotConfiguration passphrase](self, "passphrase");
      v12 = @"WPA/WPA2 Personal Passphrase";
LABEL_9:
      v13 = v3;
      v14 = v11;
      uint64_t v15 = 3LL;
      goto LABEL_13;
    case 3LL:
      [v3 appendPrettyObject:@"WPA/WPA2 Enterprise" withName:@"Security Type" andIndent:0 options:0];
      v11 = -[NEHotspotConfiguration eapSettings](self, "eapSettings");
      v12 = @"EAP Configuration";
      goto LABEL_12;
    case 4LL:
      [v3 appendPrettyObject:@"Hotspot 2.0" withName:@"Security Type" andIndent:0 options:0];
      v16 = -[NEHotspotConfiguration eapSettings](self, "eapSettings");
      [v3 appendPrettyObject:v16 withName:@"EAP Configuration" andIndent:0 options:0];
      v11 = -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
      v12 = @"Hotspot 2.0 Configuration";
LABEL_12:
      v13 = v3;
      v14 = v11;
      uint64_t v15 = 0LL;
LABEL_13:
      [v13 appendPrettyObject:v14 withName:v12 andIndent:0 options:v15];

      break;
    default:
      [v3 appendPrettyObject:@"Open" withName:@"Security Type" andIndent:0 options:0];
      break;
  }

  return v3;
}

- (NEHotspotConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEHotspotConfiguration;
  result = -[NEHotspotConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_securityType = 0LL;
    *(_WORD *)&result->_joinOnce = 0;
    result->_useSSIDPrefix = 0;
  }

  return result;
}

- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID
{
  v4 = SSID;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEHotspotConfiguration;
  uint64_t v5 = -[NEHotspotConfiguration init](&v10, sel_init);
  if (v5)
  {
    uint64_t v6 = -[NSString copy](v4, "copy");
    v7 = v5->_SSID;
    v5->_SSID = (NSString *)v6;

    SSIDPrefix = v5->_SSIDPrefix;
    v5->_SSIDPrefix = (NSString *)&stru_18A0915E8;

    v5->_securityType = 0LL;
    v5->_useSSIDPrefix = 0;
  }

  return v5;
}

- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID passphrase:(NSString *)passphrase isWEP:(BOOL)isWEP
{
  BOOL v5 = isWEP;
  uint64_t v8 = SSID;
  v9 = passphrase;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NEHotspotConfiguration;
  objc_super v10 = -[NEHotspotConfiguration init](&v18, sel_init);
  if (v10)
  {
    uint64_t v11 = -[NSString copy](v8, "copy");
    v12 = v10->_SSID;
    v10->_SSID = (NSString *)v11;

    SSIDPrefix = v10->_SSIDPrefix;
    v10->_SSIDPrefix = (NSString *)&stru_18A0915E8;

    uint64_t v14 = 1LL;
    if (!v5) {
      uint64_t v14 = 2LL;
    }
    v10->_securityType = v14;
    uint64_t v15 = -[NSString copy](v9, "copy");
    v16 = v10->_passphrase;
    v10->_passphrase = (NSString *)v15;

    v10->_useSSIDPrefix = 0;
  }

  return v10;
}

- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID eapSettings:(NEHotspotEAPSettings *)eapSettings
{
  uint64_t v6 = SSID;
  v7 = eapSettings;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEHotspotConfiguration;
  uint64_t v8 = -[NEHotspotConfiguration init](&v15, sel_init);
  if (v8)
  {
    uint64_t v9 = -[NSString copy](v6, "copy");
    objc_super v10 = v8->_SSID;
    v8->_SSID = (NSString *)v9;

    v8->_securityType = 3LL;
    uint64_t v11 = -[NEHotspotEAPSettings copy](v7, "copy");
    v12 = v8->_eapSettings;
    v8->_eapSettings = (NEHotspotEAPSettings *)v11;

    v13 = v8->_eapSettings;
    if (v13)
    {
      -[NEHotspotEAPSettings setPreferredTLSVersion:](v13, "setPreferredTLSVersion:", 2LL);
      -[NEHotspotEAPSettings setTlsClientCertificateRequired:]( v8->_eapSettings,  "setTlsClientCertificateRequired:",  0LL);
    }
  }

  return v8;
}

- (NEHotspotConfiguration)initWithHS20Settings:(NEHotspotHS20Settings *)hs20Settings eapSettings:(NEHotspotEAPSettings *)eapSettings
{
  uint64_t v6 = hs20Settings;
  v7 = eapSettings;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEHotspotConfiguration;
  uint64_t v8 = -[NEHotspotConfiguration init](&v17, sel_init);
  uint64_t v9 = v8;
  if (v8)
  {
    SSID = v8->_SSID;
    v8->_SSID = (NSString *)&stru_18A0915E8;

    v9->_securityType = 4LL;
    uint64_t v11 = -[NEHotspotEAPSettings copy](v7, "copy");
    v12 = v9->_eapSettings;
    v9->_eapSettings = (NEHotspotEAPSettings *)v11;

    v13 = v9->_eapSettings;
    if (v13)
    {
      -[NEHotspotEAPSettings setPreferredTLSVersion:](v13, "setPreferredTLSVersion:", 2LL);
      -[NEHotspotEAPSettings setTlsClientCertificateRequired:]( v9->_eapSettings,  "setTlsClientCertificateRequired:",  0LL);
    }

    uint64_t v14 = -[NEHotspotHS20Settings copy](v6, "copy");
    objc_super v15 = v9->_hs20Settings;
    v9->_hs20Settings = (NEHotspotHS20Settings *)v14;
  }

  return v9;
}

- (NEHotspotConfiguration)initWithSSIDPrefix:(NSString *)SSIDPrefix
{
  v4 = SSIDPrefix;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEHotspotConfiguration;
  BOOL v5 = -[NEHotspotConfiguration init](&v11, sel_init);
  uint64_t v6 = v5;
  if (v5)
  {
    SSID = v5->_SSID;
    v5->_SSID = (NSString *)&stru_18A0915E8;

    uint64_t v8 = -[NSString copy](v4, "copy");
    uint64_t v9 = v6->_SSIDPrefix;
    v6->_SSIDPrefix = (NSString *)v8;

    v6->_securityType = 0LL;
    v6->_useSSIDPrefix = 1;
  }

  return v6;
}

- (NEHotspotConfiguration)initWithSSIDPrefix:(NSString *)SSIDPrefix passphrase:(NSString *)passphrase isWEP:(BOOL)isWEP
{
  BOOL v5 = isWEP;
  uint64_t v8 = SSIDPrefix;
  uint64_t v9 = passphrase;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NEHotspotConfiguration;
  objc_super v10 = -[NEHotspotConfiguration init](&v19, sel_init);
  objc_super v11 = v10;
  if (v10)
  {
    SSID = v10->_SSID;
    v10->_SSID = (NSString *)&stru_18A0915E8;

    uint64_t v13 = -[NSString copy](v8, "copy");
    uint64_t v14 = v11->_SSIDPrefix;
    v11->_SSIDPrefix = (NSString *)v13;

    if (v5) {
      uint64_t v15 = 1LL;
    }
    else {
      uint64_t v15 = 2LL;
    }
    v11->_securityType = v15;
    uint64_t v16 = -[NSString copy](v9, "copy");
    objc_super v17 = v11->_passphrase;
    v11->_passphrase = (NSString *)v16;

    v11->_useSSIDPrefix = 1;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (!-[NEHotspotConfiguration securityType](self, "securityType"))
  {
    BOOL v13 = -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix");
    uint64_t v14 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    if (v13)
    {
      v7 = -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
      uint64_t v15 = [v14 initWithSSIDPrefix:v7];
    }

    else
    {
      v7 = -[NEHotspotConfiguration SSID](self, "SSID");
      uint64_t v15 = [v14 initWithSSID:v7];
    }

    objc_super v19 = (void *)v15;
    goto LABEL_20;
  }

  if (-[NEHotspotConfiguration securityType](self, "securityType") == 1)
  {
    BOOL v5 = -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix");
    uint64_t v6 = [(id)objc_opt_class() allocWithZone:a3];
    if (v5)
    {
      v7 = -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
      -[NEHotspotConfiguration passphrase](self, "passphrase");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (void *)v6;
      objc_super v10 = v7;
      objc_super v11 = v8;
      uint64_t v12 = 1LL;
LABEL_10:
      uint64_t v18 = [v9 initWithSSIDPrefix:v10 passphrase:v11 isWEP:v12];
LABEL_19:
      objc_super v19 = (void *)v18;

LABEL_20:
      goto LABEL_21;
    }
    v7 = -[NEHotspotConfiguration SSID](self, "SSID");
    -[NEHotspotConfiguration passphrase](self, "passphrase");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)v6;
    v21 = v7;
    v22 = v8;
    uint64_t v23 = 1LL;
    goto LABEL_18;
  }

  if (-[NEHotspotConfiguration securityType](self, "securityType") == 2)
  {
    BOOL v16 = -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix");
    uint64_t v17 = [(id)objc_opt_class() allocWithZone:a3];
    if (v16)
    {
      v7 = -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
      -[NEHotspotConfiguration passphrase](self, "passphrase");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (void *)v17;
      objc_super v10 = v7;
      objc_super v11 = v8;
      uint64_t v12 = 0LL;
      goto LABEL_10;
    }
    v7 = -[NEHotspotConfiguration SSID](self, "SSID");
    -[NEHotspotConfiguration passphrase](self, "passphrase");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)v17;
    v21 = v7;
    v22 = v8;
    uint64_t v23 = 0LL;
LABEL_18:
    uint64_t v18 = [v20 initWithSSID:v21 passphrase:v22 isWEP:v23];
    goto LABEL_19;
  }

  if (-[NEHotspotConfiguration securityType](self, "securityType") != 3)
  {
    if (-[NEHotspotConfiguration securityType](self, "securityType") != 4)
    {
      objc_super v19 = 0LL;
      goto LABEL_21;
    }

    v27 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    v7 = -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
    -[NEHotspotConfiguration eapSettings](self, "eapSettings");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v27 initWithHS20Settings:v7 eapSettings:v8];
    goto LABEL_19;
  }

  -[NEHotspotConfiguration eapSettings](self, "eapSettings");
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v24 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    v7 = -[NEHotspotConfiguration SSID](self, "SSID");
    -[NEHotspotConfiguration eapSettings](self, "eapSettings");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v24 initWithSSID:v7 eapSettings:v8];
    goto LABEL_19;
  }

- (NEHotspotConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[NEHotspotConfiguration init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSID"];
    SSID = v5->_SSID;
    v5->_SSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSIDPrefix"];
    SSIDPrefix = v5->_SSIDPrefix;
    v5->_SSIDPrefix = (NSString *)v8;

    v5->_useSSIDPrefix = [v4 decodeBoolForKey:@"UseSSIDPrefix"];
    v5->_securityType = [v4 decodeInt64ForKey:@"SecurityType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LifeTimeInDays"];
    lifeTimeInDays = v5->_lifeTimeInDays;
    v5->_lifeTimeInDays = (NSNumber *)v10;

    v5->_joinOnce = [v4 decodeBoolForKey:@"JoinOnce"];
    v5->_isAccessory = [v4 decodeBoolForKey:@"IsAccessory"];
    v5->_hidden = [v4 decodeBoolForKey:@"hidden"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passphrase"];
    passphrase = v5->_passphrase;
    v5->_passphrase = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EAPSettings"];
    eapSettings = v5->_eapSettings;
    v5->_eapSettings = (NEHotspotEAPSettings *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HSSettings"];
    hs20Settings = v5->_hs20Settings;
    v5->_hs20Settings = (NEHotspotHS20Settings *)v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[NEHotspotConfiguration SSID](self, "SSID");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"SSID"];

  -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"SSIDPrefix"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix"),  @"UseSSIDPrefix");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[NEHotspotConfiguration securityType](self, "securityType"),  @"SecurityType");
  v7 = -[NEHotspotConfiguration lifeTimeInDays](self, "lifeTimeInDays");
  [v4 encodeObject:v7 forKey:@"LifeTimeInDays"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotConfiguration joinOnce](self, "joinOnce"), @"JoinOnce");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEHotspotConfiguration isAccessory](self, "isAccessory"),  @"IsAccessory");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotConfiguration hidden](self, "hidden"), @"hidden");
  -[NEHotspotConfiguration passphrase](self, "passphrase");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"passphrase"];

  -[NEHotspotConfiguration eapSettings](self, "eapSettings");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"EAPSettings"];

  -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"HSSettings"];
}

- (int64_t)validate
{
  uint64_t v103 = *MEMORY[0x1895F89C0];
  BOOL v5 = -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix");
  if (v5
    || (-[NEHotspotConfiguration SSID](self, "SSID"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        ![v2 length]))
  {
    int v6 = 0;
    BOOL v7 = 0;
    if (!-[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix")) {
      goto LABEL_12;
    }
  }

  else
  {
    -[NEHotspotConfiguration SSID](self, "SSID");
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)[v3 length] <= 0x20)
    {

      goto LABEL_16;
    }

    if (!-[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix"))
    {

      goto LABEL_37;
    }

    int v6 = 1;
  }

  -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v8 length])
  {

    BOOL v7 = 0;
    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v9 length] >= 3)
  {
    -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = (unint64_t)[v10 length] < 0x21;

    if ((v6 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_11:

    goto LABEL_12;
  }

  BOOL v7 = 0;
  if ((v6 & 1) != 0) {
    goto LABEL_11;
  }
LABEL_12:
  if (v5)
  {
    if (!v7)
    {
LABEL_37:
      if (-[NEHotspotConfiguration securityType](self, "securityType") != 4)
      {
        int64_t v25 = -[NEHotspotConfiguration securityType](self, "securityType");
        if (v25 != 4)
        {
          if (v25 == 3) {
            return 101LL;
          }
          if (-[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix")) {
            return 110LL;
          }
          return 101LL;
        }

        return 106LL;
      }

      if (-[NEHotspotConfiguration joinOnce](self, "joinOnce"))
      {
        ne_log_obj();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v102 = (id)objc_opt_class();
          id v22 = v102;
          uint64_t v23 = "%@ JoinOnce is not supported for Hotspot 2.0 Wi-Fi networks.";
          goto LABEL_85;
        }

- (NSString)SSID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)SSIDPrefix
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (BOOL)joinOnce
{
  return self->_joinOnce;
}

- (void)setJoinOnce:(BOOL)joinOnce
{
  self->_joinOnce = joinOnce;
}

- (NSNumber)lifeTimeInDays
{
  return (NSNumber *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLifeTimeInDays:(NSNumber *)lifeTimeInDays
{
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (int64_t)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(int64_t)a3
{
  self->_securityType = a3;
}

- (NSString)passphrase
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPassphrase:(id)a3
{
}

- (NEHotspotEAPSettings)eapSettings
{
  return (NEHotspotEAPSettings *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setEapSettings:(id)a3
{
}

- (NEHotspotHS20Settings)hs20Settings
{
  return (NEHotspotHS20Settings *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setHs20Settings:(id)a3
{
}

- (BOOL)useSSIDPrefix
{
  return self->_useSSIDPrefix;
}

- (void)setUseSSIDPrefix:(BOOL)a3
{
  self->_useSSIDPrefix = a3;
}

- (BOOL)isAccessory
{
  return self->_isAccessory;
}

- (void)setIsAccessory:(BOOL)a3
{
  self->_isAccessory = a3;
}

- (void).cxx_destruct
{
}

- (uint64_t)validateEAPSettings
{
  uint64_t v1 = a1;
  uint64_t v173 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return v1;
  }
  unint64_t v2 = 0x189604000uLL;
  objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  &unk_18A0CF8B8,  &unk_18A0CF8D0,  &unk_18A0CF8E8,  &unk_18A0CF900,  0);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v156 = 0u;
  __int128 v157 = 0u;
  __int128 v158 = 0u;
  __int128 v159 = 0u;
  [(id)v1 eapSettings];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 supportedEAPTypes];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v5 countByEnumeratingWithState:&v156 objects:v167 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v157;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v157 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v156 + 1) + 8 * i);
        if (([v3 containsObject:v10] & 1) == 0)
        {
          ne_log_obj();
          BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v64 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v170 = v64;
            __int16 v171 = 2112;
            uint64_t v172 = v10;
            id v65 = v64;
            _os_log_error_impl(&dword_1876B1000, v13, OS_LOG_TYPE_ERROR, "%@ invalid EAP type %@", buf, 0x16u);
          }

          goto LABEL_14;
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v156 objects:v167 count:16];
    }

    while (v7);
  }

  [(id)v1 eapSettings];
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 supportedEAPTypes];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v12 containsObject:&unk_18A0CF8B8])
  {
  }

  else
  {
    [(id)v1 eapSettings];
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = [v14 isTLSClientCertificateRequired];

    if (!v15) {
      goto LABEL_42;
    }
  }

  [(id)v1 eapSettings];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 identityReference];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    ne_log_obj();
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    v58 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v58;
    id v56 = v58;
    id v57 = "%@ identity not provided";
    goto LABEL_89;
  }

  [(id)v1 eapSettings];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 clientTrustChainReference];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  CFTypeRef result = 0LL;
  [(id)v1 eapSettings];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 identityReference];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_49;
  }

  [(id)v1 eapSettings];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 identityReference];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v23 length];

  if (!v24)
  {
LABEL_49:
    ne_log_obj();
    id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v107 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v107;
      id v108 = v107;
      _os_log_error_impl( &dword_1876B1000,  v59,  OS_LOG_TYPE_ERROR,  "%@ configuration with EAP-TLS type must have identity reference.",  buf,  0xCu);
    }

    v30 = 0LL;
    goto LABEL_52;
  }

  int64_t v25 = (void *)MEMORY[0x189603FC8];
  [(id)v1 eapSettings];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 identityReference];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = *MEMORY[0x189604DE8];
  uint64_t v29 = *MEMORY[0x18960BB38];
  uint64_t v154 = *MEMORY[0x18960BE30];
  obuint64_t j = (id)*MEMORY[0x18960BE80];
  objc_msgSend( v25,  "dictionaryWithObjectsAndKeys:",  v27,  *MEMORY[0x18960BE80],  *MEMORY[0x189604DE8],  *MEMORY[0x18960BE30],  *MEMORY[0x18960BB50],  *MEMORY[0x18960BB38],  0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (SecItemCopyMatching((CFDictionaryRef)v30, &result) || !result)
  {
    ne_log_obj();
    id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v85 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v85;
      id v86 = v85;
      v87 = "%@ failed to find the identity item in the keychain.";
LABEL_87:
      _os_log_error_impl(&dword_1876B1000, v59, OS_LOG_TYPE_ERROR, v87, buf, 0xCu);
    }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end