@interface TVSettingsCrossAppTrackingFacade
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)sharedInstance;
- (ADTrackingTransparency)adTrackingTransparency;
- (BOOL)crossAppTrackingAllowed;
- (BOOL)crossAppTrackingAllowedSwitchEnabled;
- (BOOL)isObservingTCCInfos;
- (TVSettingsCrossAppTrackingFacade)initWithServiceName:(id)a3;
- (unint64_t)numberOfAppsAllowingCrossAppTracking;
- (void)_handleAccountStoreDidChangeNotification:(id)a3;
- (void)_resetAdvertisingIdentifierIfNeeded;
- (void)_startObservingTCCInfos;
- (void)_stopObservingTCCInfos;
- (void)_updateCrossAppTrackingState;
- (void)_updateCrossAppTrackingStateAndNotify:(BOOL)a3;
- (void)_updatePropertyForKey:(id)a3 updateBlock:(id)a4 notify:(BOOL)a5;
- (void)dealloc;
- (void)disallowAccessForAllApps;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetAdvertisingIdentifier;
- (void)setCrossAppTrackingAllowed:(BOOL)a3;
- (void)setCrossAppTrackingAllowedSwitchEnabled:(BOOL)a3;
- (void)setInfoArray:(id)a3;
- (void)setObservingTCCInfos:(BOOL)a3;
@end

@implementation TVSettingsCrossAppTrackingFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100085884;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E18F0 != -1) {
    dispatch_once(&qword_1001E18F0, block);
  }
  return (id)qword_1001E18E8;
}

- (TVSettingsCrossAppTrackingFacade)initWithServiceName:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsCrossAppTrackingFacade;
  v3 = -[TVSettingsTCCFacade initWithServiceName:](&v8, "initWithServiceName:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___ADTrackingTransparency);
    adTrackingTransparency = v3->_adTrackingTransparency;
    v3->_adTrackingTransparency = v4;

    -[TVSettingsCrossAppTrackingFacade _updateCrossAppTrackingStateAndNotify:]( v3,  "_updateCrossAppTrackingStateAndNotify:",  0LL);
    -[TVSettingsCrossAppTrackingFacade _startObservingTCCInfos](v3, "_startObservingTCCInfos");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v3 selector:"_handleAccountStoreDidChangeNotification:" name:ACAccountStoreDidChangeNotification object:0];
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsCrossAppTrackingFacade;
  -[TVSettingsTCCFacade dealloc](&v3, "dealloc");
}

- (void)setCrossAppTrackingAllowed:(BOOL)a3
{
  if (self->_crossAppTrackingAllowed != a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100085A28;
    v3[3] = &unk_10018EFA0;
    v3[4] = self;
    BOOL v4 = a3;
    -[TVSettingsCrossAppTrackingFacade _updatePropertyForKey:updateBlock:notify:]( self,  "_updatePropertyForKey:updateBlock:notify:",  @"crossAppTrackingAllowed",  v3,  1LL);
  }

- (unint64_t)numberOfAppsAllowingCrossAppTracking
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTCCFacade infoArray](self, "infoArray"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_filter:", &stru_1001920D8));
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (void)disallowAccessForAllApps
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTCCFacade infoArray](self, "infoArray", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setAllowAccess:0];
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  -[TVSettingsCrossAppTrackingFacade _startObservingTCCInfos](self, "_startObservingTCCInfos");
  -[TVSettingsCrossAppTrackingFacade _resetAdvertisingIdentifierIfNeeded](self, "_resetAdvertisingIdentifierIfNeeded");
}

- (void)resetAdvertisingIdentifier
{
  id v2 = sub_100085CA4();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[TVSettingsCrossAppTrackingFacade resetAdvertisingIdentifier]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Resetting Ad identifier.",  (uint8_t *)&v5,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v4 clearAdvertisingIdentifier];
}

- (void)setInfoArray:(id)a3
{
  id v4 = a3;
  if (-[TVSettingsCrossAppTrackingFacade isObservingTCCInfos](self, "isObservingTCCInfos"))
  {
    -[TVSettingsCrossAppTrackingFacade _stopObservingTCCInfos](self, "_stopObservingTCCInfos");
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___TVSettingsCrossAppTrackingFacade;
    -[TVSettingsTCCFacade setInfoArray:](&v5, "setInfoArray:", v4);
    -[TVSettingsCrossAppTrackingFacade _startObservingTCCInfos](self, "_startObservingTCCInfos");
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___TVSettingsCrossAppTrackingFacade;
    -[TVSettingsTCCFacade setInfoArray:](&v5, "setInfoArray:", v4);
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = NSStringFromSelector("crossAppTrackingAllowedSwitchEnabled");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) != 0
    || (__int128 v8 = NSStringFromSelector("crossAppTrackingAllowed"),
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(v8),
        unsigned __int8 v10 = [v4 isEqualToString:v9],
        v9,
        (v10 & 1) != 0))
  {
    unsigned __int8 v11 = 0;
  }

  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___TVSettingsCrossAppTrackingFacade;
    unsigned __int8 v11 = objc_msgSendSuper2(&v13, "automaticallyNotifiesObserversForKey:", v4);
  }

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DFEC0 == a6)
  {
    -[TVSettingsCrossAppTrackingFacade _resetAdvertisingIdentifierIfNeeded]( self,  "_resetAdvertisingIdentifierIfNeeded",  a3,  a4,  a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsCrossAppTrackingFacade;
    -[TVSettingsCrossAppTrackingFacade observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_startObservingTCCInfos
{
  if (!-[TVSettingsCrossAppTrackingFacade isObservingTCCInfos](self, "isObservingTCCInfos"))
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTCCFacade infoArray](self, "infoArray"));
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        unsigned __int8 v7 = 0LL;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) addObserver:self forKeyPath:@"allowAccess" options:0 context:off_1001DFEC0];
          unsigned __int8 v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }

    -[TVSettingsCrossAppTrackingFacade setObservingTCCInfos:](self, "setObservingTCCInfos:", 1LL);
  }

- (void)_stopObservingTCCInfos
{
  if (-[TVSettingsCrossAppTrackingFacade isObservingTCCInfos](self, "isObservingTCCInfos"))
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTCCFacade infoArray](self, "infoArray"));
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        unsigned __int8 v7 = 0LL;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) removeObserver:self forKeyPath:@"allowAccess" context:off_1001DFEC0];
          unsigned __int8 v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }

    -[TVSettingsCrossAppTrackingFacade setObservingTCCInfos:](self, "setObservingTCCInfos:", 0LL);
  }

- (void)_resetAdvertisingIdentifierIfNeeded
{
  if (!-[TVSettingsCrossAppTrackingFacade numberOfAppsAllowingCrossAppTracking]( self,  "numberOfAppsAllowingCrossAppTracking"))
  {
    id v3 = sub_100085CA4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[TVSettingsCrossAppTrackingFacade _resetAdvertisingIdentifierIfNeeded]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: All apps were disabled for kTCCServiceUserTracking. Will reset Ad identifier.",  (uint8_t *)&v5,  0xCu);
    }

    -[TVSettingsCrossAppTrackingFacade resetAdvertisingIdentifier](self, "resetAdvertisingIdentifier");
  }

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeStringForKey:", ACAccountTypeIdentifierKey));

  if ([v5 isEqualToString:ACAccountTypeIdentifieriTunesStore])
  {
    [(id)objc_opt_class(self) cancelPreviousPerformRequestsWithTarget:self selector:"_updateCrossAppTrackingState" object:0];
    -[TVSettingsCrossAppTrackingFacade performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_updateCrossAppTrackingState",  0LL,  0.2);
  }
}

- (void)_updateCrossAppTrackingState
{
}

- (void)_updateCrossAppTrackingStateAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCrossAppTrackingFacade adTrackingTransparency](self, "adTrackingTransparency"));
  int crossAppTrackingAllowedSwitchEnabled = self->_crossAppTrackingAllowedSwitchEnabled;
  id v10 = v5;
  unsigned int v7 = [v5 crossAppTrackingAllowedSwitchEnabled];
  if (crossAppTrackingAllowedSwitchEnabled != v7)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100086334;
    v13[3] = &unk_10018EFA0;
    v13[4] = self;
    char v14 = v7;
    -[TVSettingsCrossAppTrackingFacade _updatePropertyForKey:updateBlock:notify:]( self,  "_updatePropertyForKey:updateBlock:notify:",  @"crossAppTrackingAllowedSwitchEnabled",  v13,  v3);
  }

  int crossAppTrackingAllowed = self->_crossAppTrackingAllowed;
  unsigned int v9 = [v10 crossAppTrackingAllowed];
  if (crossAppTrackingAllowed != v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10008634C;
    v11[3] = &unk_10018EFA0;
    v11[4] = self;
    char v12 = v9;
    -[TVSettingsCrossAppTrackingFacade _updatePropertyForKey:updateBlock:notify:]( self,  "_updatePropertyForKey:updateBlock:notify:",  @"crossAppTrackingAllowed",  v11,  v3);
  }
}

- (void)_updatePropertyForKey:(id)a3 updateBlock:(id)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  if (v5)
  {
    __int128 v8 = (void (**)(void))a4;
    -[TVSettingsCrossAppTrackingFacade willChangeValueForKey:](self, "willChangeValueForKey:", v11);
    v8[2](v8);

    -[TVSettingsCrossAppTrackingFacade didChangeValueForKey:](self, "didChangeValueForKey:", v11);
  }

  else
  {
    unsigned int v9 = (void (*)(void))*((void *)a4 + 2);
    id v10 = a4;
    v9();
  }
}

- (BOOL)crossAppTrackingAllowedSwitchEnabled
{
  return self->_crossAppTrackingAllowedSwitchEnabled;
}

- (void)setCrossAppTrackingAllowedSwitchEnabled:(BOOL)a3
{
  self->_int crossAppTrackingAllowedSwitchEnabled = a3;
}

- (BOOL)crossAppTrackingAllowed
{
  return self->_crossAppTrackingAllowed;
}

- (ADTrackingTransparency)adTrackingTransparency
{
  return self->_adTrackingTransparency;
}

- (BOOL)isObservingTCCInfos
{
  return self->_observingTCCInfos;
}

- (void)setObservingTCCInfos:(BOOL)a3
{
  self->_observingTCCInfos = a3;
}

- (void).cxx_destruct
{
}

@end