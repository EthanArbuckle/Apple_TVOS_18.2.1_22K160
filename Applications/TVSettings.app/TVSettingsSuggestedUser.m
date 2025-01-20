@interface TVSettingsSuggestedUser
- (NSPersonNameComponents)nameComponents;
- (NSString)accountUsername;
- (NSString)altDSID;
- (NSString)fullName;
- (NSString)identifier;
- (NSString)shortName;
- (TVSettingsSuggestedUser)initWithSuggestedUserProfile:(id)a3;
@end

@implementation TVSettingsSuggestedUser

- (TVSettingsSuggestedUser)initWithSuggestedUserProfile:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVSettingsSuggestedUser;
  v5 = -[TVSettingsSuggestedUser init](&v18, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 identifier]);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 nameComponents]);
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 shortName]);
    shortName = v5->_shortName;
    v5->_shortName = (NSString *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 fullName]);
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 altDSID]);
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v14;

    accountUsername = v5->_accountUsername;
    v5->_accountUsername = (NSString *)&stru_100195DD8;
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)accountUsername
{
  return self->_accountUsername;
}

- (void).cxx_destruct
{
}

@end