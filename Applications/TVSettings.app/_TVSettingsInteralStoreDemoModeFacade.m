@interface _TVSettingsInteralStoreDemoModeFacade
- (BOOL)applyChanges;
- (BOOL)hasCustomScreenSaverConfigurationURLString;
- (BOOL)isContentUnlocked;
- (BOOL)isDirty;
- (BOOL)isEnabled;
- (BOOL)isEnrolledInDeKOTA;
- (BOOL)requestUnenroll;
- (BOOL)videoPlaybackRestricted;
- (NSString)modeType;
- (NSString)screenSaverConfigurationURLString;
- (_TVSettingsInteralStoreDemoModeFacade)init;
- (double)videoPlaybackRestrictionTimeout;
- (id)availableModeTypes;
- (unint64_t)modeTypeEnum;
- (unint64_t)modeTypeIndexToEnum:(int64_t)a3;
- (void)restoreDefaults;
- (void)setEnabled:(BOOL)a3;
- (void)setHasCustomScreenSaverConfigurationURLString:(BOOL)a3;
- (void)setModeType:(id)a3;
- (void)setRequestUnenroll:(BOOL)a3;
- (void)setScreenSaverConfigurationURLString:(id)a3;
- (void)setVideoPlaybackRestricted:(BOOL)a3;
- (void)setVideoPlaybackRestrictionTimeout:(double)a3;
@end

@implementation _TVSettingsInteralStoreDemoModeFacade

- (_TVSettingsInteralStoreDemoModeFacade)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____TVSettingsInteralStoreDemoModeFacade;
  v2 = -[_TVSettingsInteralStoreDemoModeFacade init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[_TVSettingsInteralStoreDemoModeFacade restoreDefaults](v2, "restoreDefaults");
  }
  return v3;
}

- (void)restoreDefaults
{
  if (-[_TVSettingsInteralStoreDemoModeFacade isEnrolledInDeKOTA](self, "isEnrolledInDeKOTA"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](&OBJC_CLASS___MSDKManagedDevice, "sharedInstance"));
    id v16 = 0LL;
    id v4 = [v3 isContentFrozen:&v16];
    id v5 = v16;

    if (v5)
    {
      id v6 = sub_100049368();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000F7738();
      }
    }

    -[_TVSettingsInteralStoreDemoModeFacade setEnabled:](self, "setEnabled:", v4);
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[_TVSettingsInteralStoreDemoModeFacade availableModeTypes](self, "availableModeTypes"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "objectAtIndex:",  +[UIApplication tvsui_storeDemoModeType]( UIApplication,  "tvsui_storeDemoModeType")));
    modeType = self->_modeType;
    self->_modeType = v8;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIApplication tvsui_idleScreenEntriesConfigurationURL]( &OBJC_CLASS___UIApplication,  "tvsui_idleScreenEntriesConfigurationURL"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);

  if (-[__CFString length](v11, "length")) {
    v12 = v11;
  }
  else {
    v12 = @"http://atv.demos.apple.com/";
  }
  objc_storeStrong((id *)&self->_screenSaverConfigurationURLString, v12);
  +[UIApplication tvsui_videoPlaybackTimeout](&OBJC_CLASS___UIApplication, "tvsui_videoPlaybackTimeout");
  self->_videoPlaybackRestrictionTimeout = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIApplication tvsui_bundleIDsWithVideoRestriction]( &OBJC_CLASS___UIApplication,  "tvsui_bundleIDsWithVideoRestriction"));
  unsigned int v15 = [v14 containsObject:@"com.apple.feed.NetflixFeed"];
  if (v15)
  {
    unsigned int v15 = [v14 containsObject:@"com.apple.TVShows"];
    if (v15)
    {
      unsigned int v15 = [v14 containsObject:@"com.apple.TVMovies"];
      if (v15) {
        LOBYTE(v15) = [v14 containsObject:@"com.apple.TVWatchList"];
      }
    }
  }

  self->_videoPlaybackRestricted = v15;
  self->_requestUnenroll = 0;
}

- (BOOL)isEnrolledInDeKOTA
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](&OBJC_CLASS___MSDKManagedDevice, "sharedInstance"));
  id v8 = 0LL;
  unsigned __int8 v3 = [v2 isEnrolled:&v8];
  id v4 = v8;

  if (v4)
  {
    id v5 = sub_100049368();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000F7798();
    }
  }

  return v3;
}

- (BOOL)isContentUnlocked
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](&OBJC_CLASS___MSDKManagedDevice, "sharedInstance"));
  id v14 = 0LL;
  unsigned __int8 v3 = [v2 isEnrolled:&v14];
  id v4 = v14;
  if (v4)
  {
    id v5 = v4;
    id v6 = sub_100049368();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000F7798();
    }
  }

  id v13 = 0LL;
  unsigned __int8 v8 = [v2 isContentFrozen:&v13];
  id v9 = v13;
  if (v9)
  {
    id v10 = sub_100049368();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000F7738();
    }
  }

  return v3 & (v8 ^ 1);
}

- (BOOL)isEnabled
{
  return -[_TVSettingsInteralStoreDemoModeFacade modeTypeEnum](self, "modeTypeEnum") != 0;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsInteralStoreDemoModeFacade availableModeTypes](self, "availableModeTypes"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v3]);

  -[_TVSettingsInteralStoreDemoModeFacade setModeType:](self, "setModeType:", v6);
}

- (id)availableModeTypes
{
  return &off_1001AEC80;
}

- (unint64_t)modeTypeIndexToEnum:(int64_t)a3
{
  if (a3 == 2) {
    return 2LL;
  }
  else {
    return a3 == 1;
  }
}

- (unint64_t)modeTypeEnum
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsInteralStoreDemoModeFacade availableModeTypes](self, "availableModeTypes"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsInteralStoreDemoModeFacade modeType](self, "modeType"));
  id v5 = [v3 indexOfObject:v4];

  return -[_TVSettingsInteralStoreDemoModeFacade modeTypeIndexToEnum:](self, "modeTypeIndexToEnum:", v5);
}

- (BOOL)isDirty
{
  unint64_t v3 = -[_TVSettingsInteralStoreDemoModeFacade modeTypeEnum](self, "modeTypeEnum");
  id v4 = +[UIApplication tvsui_storeDemoModeType](&OBJC_CLASS___UIApplication, "tvsui_storeDemoModeType");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIApplication tvsui_idleScreenEntriesConfigurationURL]( &OBJC_CLASS___UIApplication,  "tvsui_idleScreenEntriesConfigurationURL"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteString]);

  if ([v6 length]) {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[_TVSettingsInteralStoreDemoModeFacade screenSaverConfigurationURLString]( self,  "screenSaverConfigurationURLString"));
  }
  else {
    v7 = 0LL;
  }
  if (v7 == v6) {
    LOBYTE(v8) = 0;
  }
  else {
    unsigned int v8 = [v6 isEqualToString:v7] ^ 1;
  }
  +[UIApplication tvsui_videoPlaybackTimeout](&OBJC_CLASS___UIApplication, "tvsui_videoPlaybackTimeout");
  double v10 = v9;
  -[_TVSettingsInteralStoreDemoModeFacade videoPlaybackRestrictionTimeout](self, "videoPlaybackRestrictionTimeout");
  double v12 = v11;
  id v13 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[UIApplication tvsui_bundleIDsWithVideoRestriction]( &OBJC_CLASS___UIApplication,  "tvsui_bundleIDsWithVideoRestriction"));
  unsigned int v14 = -[_TVSettingsInteralStoreDemoModeFacade videoPlaybackRestricted](self, "videoPlaybackRestricted");
  unsigned int v15 = &off_1001AEC98;
  if (!v14) {
    unsigned int v15 = 0LL;
  }
  id v16 = v15;
  if (-[_TVSettingsInteralStoreDemoModeFacade requestUnenroll](self, "requestUnenroll")) {
    unsigned __int8 v17 = -[_TVSettingsInteralStoreDemoModeFacade isEnrolledInDeKOTA](self, "isEnrolledInDeKOTA");
  }
  else {
    unsigned __int8 v17 = 0;
  }
  if (v16 == v13) {
    LOBYTE(v18) = 0;
  }
  else {
    unsigned int v18 = [v13 isEqualToArray:v16] ^ 1;
  }
  if (v4 == (id)v3) {
    char v19 = v8;
  }
  else {
    char v19 = 1;
  }
  if (v10 != v12) {
    char v19 = 1;
  }
  char v20 = v19 | v17 | v18;

  return v20;
}

- (BOOL)applyChanges
{
  BOOL v3 = -[_TVSettingsInteralStoreDemoModeFacade isDirty](self, "isDirty");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_TVSettingsInteralStoreDemoModeFacade screenSaverConfigurationURLString]( self,  "screenSaverConfigurationURLString"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIApplication tvsui_defaultIdleScreenEntriesConfigurationURL]( &OBJC_CLASS___UIApplication,  "tvsui_defaultIdleScreenEntriesConfigurationURL"));
  unsigned int v7 = [v5 isEqual:v6];
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsInteralStoreDemoModeFacade availableModeTypes](self, "availableModeTypes"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsInteralStoreDemoModeFacade modeType](self, "modeType"));
  id v10 = [v8 indexOfObject:v9];

  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL && v10 < [v8 count]) {
    +[UIApplication tvsui_setStoreDemoModeType:](&OBJC_CLASS___UIApplication, "tvsui_setStoreDemoModeType:", v10);
  }
  if (v7)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[UIApplication tvsui_defaultIdleScreenEntriesConfigurationURL]( &OBJC_CLASS___UIApplication,  "tvsui_defaultIdleScreenEntriesConfigurationURL"));

    id v5 = (void *)v11;
  }

  +[UIApplication tvsui_setIdleScreenEntriesConfigurationURL:]( &OBJC_CLASS___UIApplication,  "tvsui_setIdleScreenEntriesConfigurationURL:",  v5);
  -[_TVSettingsInteralStoreDemoModeFacade videoPlaybackRestrictionTimeout](self, "videoPlaybackRestrictionTimeout");
  +[UIApplication tvsui_setVideoPlaybackTimeout:](&OBJC_CLASS___UIApplication, "tvsui_setVideoPlaybackTimeout:");
  if (-[_TVSettingsInteralStoreDemoModeFacade videoPlaybackRestricted](self, "videoPlaybackRestricted")) {
    double v12 = &off_1001AECB0;
  }
  else {
    double v12 = 0LL;
  }
  +[UIApplication tvsui_setBundleIDsWithVideoRestriction:]( &OBJC_CLASS___UIApplication,  "tvsui_setBundleIDsWithVideoRestriction:",  v12);
  if (-[_TVSettingsInteralStoreDemoModeFacade isEnrolledInDeKOTA](self, "isEnrolledInDeKOTA"))
  {
    unsigned int v13 = -[_TVSettingsInteralStoreDemoModeFacade isEnabled](self, "isEnabled");
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](&OBJC_CLASS___MSDKManagedDevice, "sharedInstance"));
    unsigned int v15 = v14;
    if (v13)
    {
      [v14 lockDemoContent];
    }

    else
    {
      id v25 = 0LL;
      [v14 unlockDemoContentWithOptions:0 outError:&v25];
      id v16 = v25;

      if (v16)
      {
        id v17 = sub_100049368();
        unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1000F7858();
        }
      }
    }
  }

  if (-[_TVSettingsInteralStoreDemoModeFacade requestUnenroll](self, "requestUnenroll"))
  {
    char v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](&OBJC_CLASS___MSDKManagedDevice, "sharedInstance"));
    id v24 = 0LL;
    [v19 unenrollWithOptions:0 outError:&v24];
    id v20 = v24;

    if (v20)
    {
      id v21 = sub_100049368();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000F77F8();
      }
    }
  }

  return v3;
}

- (NSString)screenSaverConfigurationURLString
{
  if (self->_hasCustomScreenSaverConfigurationURLString)
  {
    BOOL v3 = self->_screenSaverConfigurationURLString;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIApplication tvsui_idleScreenEntriesConfigurationURL]( &OBJC_CLASS___UIApplication,  "tvsui_idleScreenEntriesConfigurationURL"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 absoluteString]);

    if ([v5 length])
    {
      BOOL v3 = v5;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIApplication tvsui_defaultIdleScreenEntriesConfigurationURLforDemoMode:]( &OBJC_CLASS___UIApplication,  "tvsui_defaultIdleScreenEntriesConfigurationURLforDemoMode:",  -[_TVSettingsInteralStoreDemoModeFacade modeTypeEnum](self, "modeTypeEnum")));
      BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue([v6 absoluteString]);
    }
  }

  return v3;
}

- (void)setScreenSaverConfigurationURLString:(id)a3
{
  self->_hasCustomScreenSaverConfigurationURLString = 1;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a3));
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue([v6 absoluteString]);
  screenSaverConfigurationURLString = self->_screenSaverConfigurationURLString;
  self->_screenSaverConfigurationURLString = v4;
}

- (BOOL)videoPlaybackRestricted
{
  return self->_videoPlaybackRestricted;
}

- (void)setVideoPlaybackRestricted:(BOOL)a3
{
  self->_videoPlaybackRestricted = a3;
}

- (double)videoPlaybackRestrictionTimeout
{
  return self->_videoPlaybackRestrictionTimeout;
}

- (void)setVideoPlaybackRestrictionTimeout:(double)a3
{
  self->_videoPlaybackRestrictionTimeout = a3;
}

- (NSString)modeType
{
  return self->_modeType;
}

- (void)setModeType:(id)a3
{
}

- (BOOL)hasCustomScreenSaverConfigurationURLString
{
  return self->_hasCustomScreenSaverConfigurationURLString;
}

- (void)setHasCustomScreenSaverConfigurationURLString:(BOOL)a3
{
  self->_hasCustomScreenSaverConfigurationURLString = a3;
}

- (BOOL)requestUnenroll
{
  return self->_requestUnenroll;
}

- (void)setRequestUnenroll:(BOOL)a3
{
  self->_requestUnenroll = a3;
}

- (void).cxx_destruct
{
}

@end