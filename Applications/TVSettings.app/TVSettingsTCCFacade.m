@interface TVSettingsTCCFacade
- (BOOL)setAllowAccess:(BOOL)a3 forInfo:(id)a4;
- (NSArray)infoArray;
- (NSDictionary)infoByIdentifier;
- (NSString)serviceName;
- (TVSettingsTCCFacade)init;
- (TVSettingsTCCFacade)initWithServiceName:(id)a3;
- (id)fetchInfoMapping;
- (id)infoForIdentifier:(id)a3;
- (void)_updateTCCInfo;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)dealloc;
- (void)setInfoArray:(id)a3;
@end

@implementation TVSettingsTCCFacade

- (TVSettingsTCCFacade)init
{
  return 0LL;
}

- (TVSettingsTCCFacade)initWithServiceName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsTCCFacade;
  v5 = -[TVSettingsTCCFacade init](&v12, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = v6;

    infoByIdentifier = v5->_infoByIdentifier;
    v5->_infoByIdentifier = 0LL;

    -[TVSettingsTCCFacade _updateTCCInfo](v5, "_updateTCCInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v5 selector:"applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    [v10 addObserver:v5];
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIApplicationDidBecomeActiveNotification object:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsTCCFacade;
  -[TVSettingsTCCFacade dealloc](&v5, "dealloc");
}

- (id)infoForIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_infoByIdentifier, "objectForKeyedSubscript:", a3);
}

- (BOOL)setAllowAccess:(BOOL)a3 forInfo:(id)a4
{
  return TCCAccessSetForBundleId(self->_serviceName, [a4 identifier], a3) != 0;
}

- (id)fetchInfoMapping
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)TCCAccessCopyInformation(self->_serviceName);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        CFStringRef Identifier = CFBundleGetIdentifier((CFBundleRef)[v9 objectForKey:kTCCInfoBundle]);
        v11 = (void *)objc_claimAutoreleasedReturnValue(Identifier);
        if (v11) {
          objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_infoByIdentifier,  "objectForKeyedSubscript:",  v11));
        }
        else {
          objc_super v12 = 0LL;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kTCCInfoGranted]);
        id v14 = [v13 BOOLValue];

        if (v12)
        {
          [v12 setAllowAccess:v14];
        }

        else
        {
          objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsTCCInfo infoWithFacade:identifier:allowed:]( &OBJC_CLASS___TVSettingsTCCInfo,  "infoWithFacade:identifier:allowed:",  self,  v11,  v14));
          if (!v12) {
            goto LABEL_13;
          }
        }

        [v3 setObject:v12 forKeyedSubscript:v11];

LABEL_13:
      }

      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }

  return v3;
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009B1B8;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_updateTCCInfo
{
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[TVSettingsTCCFacade fetchInfoMapping](self, "fetchInfoMapping"));
  infoByCFStringRef Identifier = self->_infoByIdentifier;
  self->_infoByCFStringRef Identifier = v3;

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"displayName",  1LL,  "localizedStandardCompare:"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_infoByIdentifier, "allValues"));
  v9 = v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingDescriptors:v7]);

  -[TVSettingsTCCFacade setInfoArray:](self, "setInfoArray:", v8);
}

- (NSArray)infoArray
{
  return self->_infoArray;
}

- (void)setInfoArray:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSDictionary)infoByIdentifier
{
  return self->_infoByIdentifier;
}

- (void).cxx_destruct
{
}

@end