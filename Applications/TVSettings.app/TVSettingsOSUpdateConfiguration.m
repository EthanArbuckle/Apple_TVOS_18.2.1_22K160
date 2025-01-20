@interface TVSettingsOSUpdateConfiguration
- (BOOL)isCarryOrLiveOnConfiguration;
- (BOOL)isConfigurationProfileLoaded;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresAppleConnect;
- (BOOL)requiresVPN;
- (NSString)audienceOverride;
- (NSString)fullName;
- (NSString)identifier;
- (NSString)longDescription;
- (NSString)rawName;
- (NSString)requiredProfileURL;
- (NSString)trainName;
- (NSString)uuid_deprecated;
- (id)description;
- (unint64_t)hash;
- (void)setAudienceOverride:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLongDescription:(id)a3;
- (void)setRawName:(id)a3;
- (void)setRequiredProfileURL:(id)a3;
- (void)setRequiresAppleConnect:(BOOL)a3;
- (void)setRequiresVPN:(BOOL)a3;
- (void)setTrainName:(id)a3;
- (void)setUuid_deprecated:(id)a3;
@end

@implementation TVSettingsOSUpdateConfiguration

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsOSUpdateConfiguration;
  id v3 = -[TVSettingsOSUpdateConfiguration description](&v12, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration rawName](self, "rawName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration longDescription](self, "longDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration trainName](self, "trainName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration identifier](self, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration audienceOverride](self, "audienceOverride"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: name:%@ desc:%@ train:%@ id:%@ audOver:%@",  v4,  v5,  v6,  v7,  v8,  v9));

  return v10;
}

- (NSString)fullName
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration rawName](self, "rawName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration rawName](self, "rawName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration trainName](self, "trainName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration trainName](self, "trainName"));
  id v7 = [v6 length];

  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration trainName](self, "trainName"));
    v5 = v3;
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v3));
LABEL_4:
  }

  return (NSString *)v3;
}

- (BOOL)isCarryOrLiveOnConfiguration
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration identifier](self, "identifier"));
  unsigned __int8 v4 = [v3 hasPrefix:@"com.apple.tvOS.fc"];

  if ((v4 & 1) != 0) {
    return 1;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration trainName](self, "trainName"));
  unsigned __int8 v6 = [v5 isEqualToString:@"Amber"];

  if ((v6 & 1) != 0) {
    return 1;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration trainName](self, "trainName"));
  unsigned __int8 v8 = [v7 isEqualToString:@"Purple"];

  if ((v8 & 1) != 0) {
    return 1;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration trainName](self, "trainName"));
  unsigned __int8 v11 = [v10 isEqualToString:@"Green"];

  return v11;
}

- (BOOL)isConfigurationProfileLoaded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration requiredProfileURL](self, "requiredProfileURL"));
  id v4 = [v3 length];

  if (!v4) {
    return 1;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsOSUpdateConfigurationManager _currentAudienceOverride]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "_currentAudienceOverride"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration audienceOverride](self, "audienceOverride"));
  unsigned __int8 v7 = [v6 isEqualToString:v5];

  if ((v7 & 1) != 0)
  {
    BOOL v8 = 1;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration identifier](self, "identifier"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 installedProfileWithIdentifier:v10]);

    BOOL v8 = v11 != 0LL;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TVSettingsOSUpdateConfiguration *)a3;
  if (v4 == self) {
    goto LABEL_5;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSettingsOSUpdateConfiguration);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    unsigned __int8 v12 = 0;
    goto LABEL_7;
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration audienceOverride](self, "audienceOverride"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration audienceOverride](v4, "audienceOverride"));
  unsigned __int8 v8 = [v6 isEqual:v7];

  if ((v8 & 1) != 0
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration uuid_deprecated](self, "uuid_deprecated")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration uuid_deprecated](v4, "uuid_deprecated")),
        unsigned __int8 v11 = [v9 isEqual:v10],
        v10,
        v9,
        (v11 & 1) != 0))
  {
LABEL_5:
    unsigned __int8 v12 = 1;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration identifier](self, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration identifier](v4, "identifier"));
    if ([v14 isEqual:v15])
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration trainName](self, "trainName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration trainName](v4, "trainName"));
      unsigned __int8 v12 = [v16 isEqual:v17];
    }

    else
    {
      unsigned __int8 v12 = 0;
    }
  }

- (unint64_t)hash
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration identifier](self, "identifier"));
  id v4 = (char *)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration audienceOverride](self, "audienceOverride"));
  unsigned __int8 v6 = &v4[(void)[v5 hash]];
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfiguration trainName](self, "trainName"));
  unsigned __int8 v8 = (char *)[v7 hash] + (void)v6;

  return (unint64_t)v8;
}

- (NSString)rawName
{
  return self->_rawName;
}

- (void)setRawName:(id)a3
{
}

- (NSString)longDescription
{
  return self->_longDescription;
}

- (void)setLongDescription:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)uuid_deprecated
{
  return self->_uuid_deprecated;
}

- (void)setUuid_deprecated:(id)a3
{
}

- (NSString)requiredProfileURL
{
  return self->_requiredProfileURL;
}

- (void)setRequiredProfileURL:(id)a3
{
}

- (NSString)trainName
{
  return self->_trainName;
}

- (void)setTrainName:(id)a3
{
}

- (NSString)audienceOverride
{
  return self->_audienceOverride;
}

- (void)setAudienceOverride:(id)a3
{
}

- (BOOL)requiresVPN
{
  return self->_requiresVPN;
}

- (void)setRequiresVPN:(BOOL)a3
{
  self->_requiresVPN = a3;
}

- (BOOL)requiresAppleConnect
{
  return self->_requiresAppleConnect;
}

- (void)setRequiresAppleConnect:(BOOL)a3
{
  self->_requiresAppleConnect = a3;
}

- (void).cxx_destruct
{
}

@end