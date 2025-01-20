@interface TVSettingsMusicAudioQualityFacade
+ (id)sharedInstance;
+ (int64_t)_MPMusicResolutionForAudioQuality:(int64_t)a3;
+ (int64_t)_audioQualityForMPMusicResolution:(int64_t)a3;
- (BOOL)spatialAudio;
- (TVSettingsMusicAudioQualityFacade)init;
- (int64_t)audioQuality;
- (void)_qualityDidChange:(id)a3;
- (void)setAudioQuality:(int64_t)a3;
- (void)setSpatialAudio:(BOOL)a3;
@end

@implementation TVSettingsMusicAudioQualityFacade

+ (id)sharedInstance
{
  if (qword_1001E1848 != -1) {
    dispatch_once(&qword_1001E1848, &stru_100191778);
  }
  return (id)qword_1001E1850;
}

- (TVSettingsMusicAudioQualityFacade)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsMusicAudioQualityFacade;
  v2 = -[TVSettingsMusicAudioQualityFacade init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[MPPlaybackUserDefaults standardUserDefaults]( &OBJC_CLASS___MPPlaybackUserDefaults,  "standardUserDefaults"));
    id v4 = [v3 preferredMusicHighBandwidthResolution];

    v2->_audioQuality = (int64_t)[(id)objc_opt_class(v2) _audioQualityForMPMusicResolution:v4];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v6 = MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPPlaybackUserDefaults standardUserDefaults]( &OBJC_CLASS___MPPlaybackUserDefaults,  "standardUserDefaults"));
    [v5 addObserver:v2 selector:"_qualityDidChange:" name:v6 object:v7];
  }

  return v2;
}

- (void)setAudioQuality:(int64_t)a3
{
  if (self->_audioQuality != a3)
  {
    -[TVSettingsMusicAudioQualityFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"audioQuality");
    self->_audioQuality = a3;
    id v5 = [(id)objc_opt_class(self) _MPMusicResolutionForAudioQuality:a3];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MPPlaybackUserDefaults standardUserDefaults]( &OBJC_CLASS___MPPlaybackUserDefaults,  "standardUserDefaults"));
    id v7 = [v6 preferredMusicHighBandwidthResolution];

    if (v5 != v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[MPPlaybackUserDefaults standardUserDefaults]( &OBJC_CLASS___MPPlaybackUserDefaults,  "standardUserDefaults"));
      [v8 setPreferredMusicHighBandwidthResolution:v5];
    }

    -[TVSettingsMusicAudioQualityFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"audioQuality");
  }

- (void)setSpatialAudio:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[MPPlaybackUserDefaults standardUserDefaults]( &OBJC_CLASS___MPPlaybackUserDefaults,  "standardUserDefaults"));
  [v4 setPrefersSpatialAudio:v3];
}

- (BOOL)spatialAudio
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[MPPlaybackUserDefaults standardUserDefaults]( &OBJC_CLASS___MPPlaybackUserDefaults,  "standardUserDefaults"));
  unsigned __int8 v3 = [v2 prefersSpatialAudio];

  return v3;
}

- (void)_qualityDidChange:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[TVSettingsMusicAudioQualityFacade setAudioQuality:]( self,  "setAudioQuality:",  objc_msgSend( (id)objc_opt_class(self),  "_audioQualityForMPMusicResolution:",  objc_msgSend(v4, "preferredMusicHighBandwidthResolution")));
}

+ (int64_t)_MPMusicResolutionForAudioQuality:(int64_t)a3
{
  else {
    return qword_10012A220[a3];
  }
}

+ (int64_t)_audioQualityForMPMusicResolution:(int64_t)a3
{
  if (a3 == 48000) {
    return 1LL;
  }
  else {
    return 2LL * (a3 == 192000);
  }
}

- (int64_t)audioQuality
{
  return self->_audioQuality;
}

@end