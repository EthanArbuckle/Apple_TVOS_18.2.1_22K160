@interface PBAppSwitcherItem
- (BOOL)isLive;
- (BOOL)isPendingDeletion;
- (BOOL)isPendingInsertion;
- (NSString)displayName;
- (NSString)identifier;
- (PBAppInfo)appInfo;
- (PBAppSwitcherDataSource)dataSource;
- (PBAppSwitcherItem)initWithType:(int64_t)a3 bundleIdentifier:(id)a4 appInfo:(id)a5 dataSource:(id)a6 live:(BOOL)a7;
- (UIImage)iconImage;
- (id)description;
- (int64_t)itemType;
- (void)_updateDisplayName;
- (void)_updateForProgressChange;
- (void)_updateIconImage;
- (void)setAppInfo:(id)a3;
- (void)setPendingDeletion:(BOOL)a3;
- (void)setPendingInsertion:(BOOL)a3;
@end

@implementation PBAppSwitcherItem

- (PBAppSwitcherItem)initWithType:(int64_t)a3 bundleIdentifier:(id)a4 appInfo:(id)a5 dataSource:(id)a6 live:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___PBAppSwitcherItem;
  v16 = -[PBAppSwitcherItem init](&v31, "init");
  v17 = v16;
  if (v16)
  {
    v16->_itemType = a3;
    v16->_live = a7;
    objc_storeStrong((id *)&v16->_identifier, a4);
    if (!v13)
    {
      id v18 = sub_100082664();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        sub_100291140((uint64_t)v14, v19);
      }
    }

    v20 = (PBAppInfo *)[v14 copy];
    appInfo = v17->_appInfo;
    v17->_appInfo = v20;

    if (v17->_itemType)
    {
      displayName = v17->_displayName;
      v17->_displayName = 0LL;
    }

    else
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v14 localizedName]);
      displayName = v17->_displayName;
      v17->_displayName = (NSString *)v23;
    }

    if (v17->_itemType)
    {
      iconImage = v17->_iconImage;
      v17->_iconImage = 0LL;
    }

    else
    {
      iconImage = (UIImage *)objc_claimAutoreleasedReturnValue( +[PBAppIconCache sharedAppSwitcherIconCache]( &OBJC_CLASS___PBAppIconCache,  "sharedAppSwitcherIconCache"));
      identifier = v17->_identifier;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 traitCollection]);
      [v27 displayScale];
      uint64_t v28 = objc_claimAutoreleasedReturnValue( -[UIImage iconImageForAppWithBundleIdentifier:scale:]( iconImage,  "iconImageForAppWithBundleIdentifier:scale:",  identifier));
      v29 = v17->_iconImage;
      v17->_iconImage = (UIImage *)v28;
    }

    objc_storeWeak((id *)&v17->_dataSource, v15);
  }

  return v17;
}

- (void)setAppInfo:(id)a3
{
  v4 = (PBAppInfo *)[a3 copy];
  appInfo = self->_appInfo;
  self->_appInfo = v4;

  -[PBAppSwitcherItem _updateDisplayName](self, "_updateDisplayName");
  -[PBAppSwitcherItem _updateIconImage](self, "_updateIconImage");
}

- (id)description
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%p>(%@)",  self,  self->_identifier));
}

- (void)_updateForProgressChange
{
}

- (void)_updateDisplayName
{
  if (self->_itemType) {
    v3 = 0LL;
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfo localizedName](self->_appInfo, "localizedName"));
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherItem displayName](self, "displayName"));
  if (v3 != v4 && ([v3 isEqual:v4] & 1) == 0)
  {
    -[PBAppSwitcherItem willChangeValueForKey:](self, "willChangeValueForKey:", @"displayName");
    v5 = (NSString *)[v3 copy];
    displayName = self->_displayName;
    self->_displayName = v5;

    -[PBAppSwitcherItem didChangeValueForKey:](self, "didChangeValueForKey:", @"displayName");
  }
}

- (void)_updateIconImage
{
  if (self->_itemType)
  {
    v3 = 0LL;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppIconCache sharedAppSwitcherIconCache]( &OBJC_CLASS___PBAppIconCache,  "sharedAppSwitcherIconCache"));
    identifier = self->_identifier;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 traitCollection]);
    [v7 displayScale];
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconImageForAppWithBundleIdentifier:scale:", identifier));
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherItem iconImage](self, "iconImage"));
  if (v3 != v8 && [v3 isEqual:v8])
  {
    -[PBAppSwitcherItem willChangeValueForKey:](self, "willChangeValueForKey:", @"iconImage");
    objc_storeStrong((id *)&self->_iconImage, v3);
    -[PBAppSwitcherItem didChangeValueForKey:](self, "didChangeValueForKey:", @"iconImage");
  }
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (BOOL)isLive
{
  return self->_live;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (BOOL)isPendingDeletion
{
  return self->_pendingDeletion;
}

- (void)setPendingDeletion:(BOOL)a3
{
  self->_pendingDeletion = a3;
}

- (PBAppSwitcherDataSource)dataSource
{
  return (PBAppSwitcherDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (PBAppInfo)appInfo
{
  return self->_appInfo;
}

- (BOOL)isPendingInsertion
{
  return self->_pendingInsertion;
}

- (void)setPendingInsertion:(BOOL)a3
{
  self->_pendingInsertion = a3;
}

- (void).cxx_destruct
{
}

@end