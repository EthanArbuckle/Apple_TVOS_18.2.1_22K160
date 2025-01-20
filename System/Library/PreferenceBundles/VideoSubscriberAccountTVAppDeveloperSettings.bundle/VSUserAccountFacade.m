@interface VSUserAccountFacade
- (VSUserAccount)account;
- (VSUserAccountFacade)initWithAccount:(id)a3;
- (id)_synchedToThisDeviceIndicator;
- (id)accountType;
- (id)authenticationDataString;
- (id)billingCycleEndDate;
- (id)billingIdentifier;
- (id)created;
- (id)deviceCategory;
- (id)displayName;
- (id)displayNameWithSynchedToThisDeviceIndicator;
- (id)fromThisDevice;
- (id)identifier;
- (id)lastModified;
- (id)lastModifiedLong;
- (id)requiresSystemTrust;
- (id)sourceIdentifier;
- (id)tierIdentifiers;
- (id)tvProviderIdentifier;
- (id)updateURLString;
- (void)setAccount:(id)a3;
@end

@implementation VSUserAccountFacade

- (VSUserAccountFacade)initWithAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VSUserAccountFacade;
  v5 = -[VSUserAccountFacade init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[VSUserAccountFacade setAccount:](v5, "setAccount:", v4);
  }

  return v6;
}

- (id)displayName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 deviceName]);
  v5 = (void *)v4;
  v6 = &stru_8370;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v7 = v6;

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  unsigned int v9 = [v8 isDeveloperCreated];

  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v7, "stringByAppendingString:", @" 🚧"));

    v7 = (__CFString *)v10;
  }

  return v7;
}

- (id)displayNameWithSynchedToThisDeviceIndicator
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade displayName](self, "displayName"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade _synchedToThisDeviceIndicator](self, "_synchedToThisDeviceIndicator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:v4]);

  return v5;
}

- (id)_synchedToThisDeviceIndicator
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  else {
    v3 = @"☁️";
  }
  uint64_t v4 = v3;

  return v4;
}

- (id)lastModified
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 modified]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[VSTVAppDeveloperSettingsUtilities stringFromDate:]( &OBJC_CLASS___VSTVAppDeveloperSettingsUtilities,  "stringFromDate:",  v3));

  return v4;
}

- (id)lastModifiedLong
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"TV_APP_DEVELOPER_LAST_MODIFIED" value:0 table:0]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 modified]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[VSTVAppDeveloperSettingsUtilities stringFromDate:]( &OBJC_CLASS___VSTVAppDeveloperSettingsUtilities,  "stringFromDate:",  v6));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@", v4, v7));

  return v8;
}

- (id)created
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 created]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[VSTVAppDeveloperSettingsUtilities stringFromDate:]( &OBJC_CLASS___VSTVAppDeveloperSettingsUtilities,  "stringFromDate:",  v3));

  return v4;
}

- (id)deviceCategory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  if ([v2 deviceCategory]) {
    v3 = @"Other";
  }
  else {
    v3 = @"Mobile";
  }
  uint64_t v4 = v3;

  return v4;
}

- (id)fromThisDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString vs_localizedStringFromBool:]( NSString,  "vs_localizedStringFromBool:",  [v2 isFromCurrentDevice]));

  return v3;
}

- (id)sourceIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sourceIdentifier]);

  return v3;
}

- (id)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  uint64_t v4 = v3;
  if (!v3) {
    v3 = &stru_8370;
  }
  v5 = v3;

  return v5;
}

- (id)tvProviderIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountProviderIdentifier]);

  return v3;
}

- (id)requiresSystemTrust
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString vs_localizedStringFromBool:]( NSString,  "vs_localizedStringFromBool:",  [v2 requiresSystemTrust]));

  return v3;
}

- (id)accountType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (char *)[v2 accountType];

  if (v3 == (_BYTE *)&dword_0 + 1)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v5 = v4;
    v6 = @"TV_APP_DEVELOPER_ACCOUNT_TYPE_PAID";
    goto LABEL_5;
  }

  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v5 = v4;
    v6 = @"TV_APP_DEVELOPER_ACCOUNT_TYPE_FREE";
LABEL_5:
    v2 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:0 table:0]);
  }

  return v2;
}

- (id)billingIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 billingIdentifier]);
  uint64_t v4 = v3;
  if (!v3) {
    v3 = &stru_8370;
  }
  v5 = v3;

  return v5;
}

- (id)billingCycleEndDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 subscriptionBillingCycleEndDate]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[VSTVAppDeveloperSettingsUtilities stringFromDate:]( &OBJC_CLASS___VSTVAppDeveloperSettingsUtilities,  "stringFromDate:",  v3));

  return v4;
}

- (id)updateURLString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 updateURL]);
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);
  v5 = v4;
  if (!v4) {
    uint64_t v4 = &stru_8370;
  }
  v6 = v4;

  return v6;
}

- (id)authenticationDataString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  if ([v3 isFromCurrentDevice])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationData]);
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 authenticationData]);
    }

    else
    {
      v7 = &stru_8370;
    }
  }

  else
  {
    v7 = &stru_8370;
  }

  return v7;
}

- (id)tierIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountFacade account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tierIdentifiers]);
  uint64_t v4 = v3;
  if (!v3) {
    v3 = &__NSArray0__struct;
  }
  id v5 = v3;

  return v5;
}

- (VSUserAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end