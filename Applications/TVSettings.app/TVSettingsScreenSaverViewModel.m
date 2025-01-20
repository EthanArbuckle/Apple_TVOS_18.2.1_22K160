@interface TVSettingsScreenSaverViewModel
- (BOOL)isActive;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)localizedDescriptionText;
- (NSString)localizedName;
- (NSURL)previewImageURL;
- (TVSettingsScreenSaverViewModel)initWithIdentifier:(id)a3 localizedName:(id)a4 localizedDescriptionText:(id)a5 previewImageURL:(id)a6 isDisabled:(BOOL)a7 preferredOrder:(int64_t)a8;
- (int64_t)preferredOrder;
- (void)setActive:(BOOL)a3;
@end

@implementation TVSettingsScreenSaverViewModel

- (TVSettingsScreenSaverViewModel)initWithIdentifier:(id)a3 localizedName:(id)a4 localizedDescriptionText:(id)a5 previewImageURL:(id)a6 isDisabled:(BOOL)a7 preferredOrder:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverViewModel;
  v18 = -[TVSettingsScreenSaverViewModel init](&v22, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_localizedName, a4);
    objc_storeStrong((id *)&v19->_localizedDescriptionText, a5);
    objc_storeStrong((id *)&v19->_previewImageURL, a6);
    v19->_isDisabled = a7;
    v19->_preferredOrder = a8;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverViewModel identifier](self, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    if (![v5 isEqualToString:v6])
    {
      BOOL v13 = 0;
LABEL_25:

      goto LABEL_26;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverViewModel localizedName](self, "localizedName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
    if (![v7 isEqualToString:v8])
    {
      BOOL v13 = 0;
LABEL_24:

      goto LABEL_25;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverViewModel localizedDescriptionText](self, "localizedDescriptionText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescriptionText]);
    if (![v9 isEqualToString:v10])
    {
      BOOL v13 = 0;
LABEL_23:

      goto LABEL_24;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverViewModel previewImageURL](self, "previewImageURL"));
    if (v11 || (uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 previewImageURL])) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverViewModel previewImageURL](self, "previewImageURL", v17));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v4 previewImageURL]);
      if (!objc_msgSend(v12, "isEqual:"))
      {
        BOOL v13 = 0;
        goto LABEL_19;
      }

      v19 = v12;
      int v20 = 1;
    }

    else
    {
      v18 = 0LL;
      int v20 = 0;
    }

    unsigned int v14 = -[TVSettingsScreenSaverViewModel isDisabled](self, "isDisabled", v18);
    if (v14 == [v4 isDisabled])
    {
      id v15 = -[TVSettingsScreenSaverViewModel preferredOrder](self, "preferredOrder");
      BOOL v13 = v15 == [v4 preferredOrder];
      v12 = v19;
      if ((v20 & 1) == 0)
      {
LABEL_20:
        if (!v11) {

        }
        goto LABEL_23;
      }
    }

    else
    {
      BOOL v13 = 0;
      v12 = v19;
      if (!v20) {
        goto LABEL_20;
      }
    }

- (void)setActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    -[TVSettingsScreenSaverViewModel willChangeValueForKey:](self, "willChangeValueForKey:", @"isActive");
    self->_isActive = a3;
    -[TVSettingsScreenSaverViewModel didChangeValueForKey:](self, "didChangeValueForKey:", @"isActive");
  }

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)localizedDescriptionText
{
  return self->_localizedDescriptionText;
}

- (NSURL)previewImageURL
{
  return self->_previewImageURL;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (int64_t)preferredOrder
{
  return self->_preferredOrder;
}

- (void).cxx_destruct
{
}

@end