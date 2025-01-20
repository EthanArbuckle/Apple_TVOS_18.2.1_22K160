@interface TVSettingsNotificationSettings
- (BOOL)allowsNotifications;
- (BOOL)isEqual:(id)a3;
- (NSArray)sectionInfos;
- (NSString)displayName;
- (NSString)identifier;
- (unint64_t)hash;
- (void)setAllowsNotifications:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSectionInfos:(id)a3;
@end

@implementation TVSettingsNotificationSettings

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNotificationSettings identifier](self, "identifier"));
    unsigned __int8 v8 = [v6 isEqual:v7];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNotificationSettings sectionInfos](self, "sectionInfos"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (!displayName)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appInfos]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:self->_identifier]);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue([v6 localizedName]);
    unsigned __int8 v8 = self->_displayName;
    self->_displayName = v7;

    displayName = self->_displayName;
    if (!displayName)
    {
      if (qword_1001E1568 != -1) {
        dispatch_once(&qword_1001E1568, &stru_10018E4B0);
      }
      v9 = (os_log_s *)qword_1001E1560;
      if (os_log_type_enabled((os_log_t)qword_1001E1560, OS_LOG_TYPE_ERROR)) {
        sub_1000F6280((uint64_t *)&self->_identifier, v9);
      }
      displayName = self->_displayName;
    }
  }

  return displayName;
}

- (BOOL)allowsNotifications
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_sectionInfos, "firstObject"));
  unsigned __int8 v3 = [v2 allowsNotifications];

  return v3;
}

- (void)setAllowsNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v5 = self->_sectionInfos;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "setAllowsNotifications:", v3, (void)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsNotificationsFacade sharedInstance]( &OBJC_CLASS___TVSettingsNotificationsFacade,  "sharedInstance"));
        [v10 _updateSettings:self];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (NSArray)sectionInfos
{
  return self->_sectionInfos;
}

- (void)setSectionInfos:(id)a3
{
}

- (void).cxx_destruct
{
}

@end