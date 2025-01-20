@interface TVHMediaLibrariesEnviroment
+ (id)new;
- (BOOL)isConfiguringScreenSaverOnly;
- (TVHAppSettings)appSettings;
- (TVHKMediaLibrariesManager)mediaLibrariesManager;
- (TVHMediaLibrariesEnviroment)init;
- (TVHMediaLibrariesEnviroment)initWithMediaLibrariesManager:(id)a3;
- (TVHPlaybackManager)playbackManager;
- (TVHScreenSaverPicker)screenSaverPicker;
- (void)setConfiguringScreenSaverOnly:(BOOL)a3;
- (void)setPlaybackManager:(id)a3;
@end

@implementation TVHMediaLibrariesEnviroment

+ (id)new
{
  return 0LL;
}

- (TVHMediaLibrariesEnviroment)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaLibrariesEnviroment)initWithMediaLibrariesManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHMediaLibrariesEnviroment;
  v6 = -[TVHMediaLibrariesEnviroment init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaLibrariesManager, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
    appSettings = v7->_appSettings;
    v7->_appSettings = (TVHAppSettings *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___TVHScreenSaverPicker);
    screenSaverPicker = v7->_screenSaverPicker;
    v7->_screenSaverPicker = v10;
  }

  return v7;
}

- (TVHKMediaLibrariesManager)mediaLibrariesManager
{
  return self->_mediaLibrariesManager;
}

- (TVHAppSettings)appSettings
{
  return self->_appSettings;
}

- (TVHScreenSaverPicker)screenSaverPicker
{
  return self->_screenSaverPicker;
}

- (BOOL)isConfiguringScreenSaverOnly
{
  return self->_configuringScreenSaverOnly;
}

- (void)setConfiguringScreenSaverOnly:(BOOL)a3
{
  self->_configuringScreenSaverOnly = a3;
}

- (TVHPlaybackManager)playbackManager
{
  return self->_playbackManager;
}

- (void)setPlaybackManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end