@interface TVSettingsiTunesMoviesFacade
+ (id)sharedInstance;
- (TVSettingsiTunesMoviesFacade)init;
- (int64_t)playbackQuality;
- (void)_updatePlaybackQuality;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setPlaybackQuality:(int64_t)a3;
@end

@implementation TVSettingsiTunesMoviesFacade

+ (id)sharedInstance
{
  if (qword_1001E1AD8 != -1) {
    dispatch_once(&qword_1001E1AD8, &stru_1001937D8);
  }
  return (id)qword_1001E1AD0;
}

- (TVSettingsiTunesMoviesFacade)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsiTunesMoviesFacade;
  v2 = -[TVSettingsiTunesMoviesFacade init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[TVSettingsiTunesMoviesFacade _updatePlaybackQuality](v2, "_updatePlaybackQuality");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"iTunesFileVideoResolution" options:0 context:off_1001E04C8];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"iTunesFileVideoResolution" context:off_1001E04C8];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsiTunesMoviesFacade;
  -[TVSettingsiTunesMoviesFacade dealloc](&v4, "dealloc");
}

- (void)setPlaybackQuality:(int64_t)a3
{
  if (self->_playbackQuality != a3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    [v5 setITunesMaxHLSVideoResolution:a3];
    [v5 setITunesFileVideoResolution:a3];
    self->_playbackQuality = a3;
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001E04C8 == a6)
  {
    -[TVSettingsiTunesMoviesFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"iTunesFileVideoResolution",  a4,  a5);
    -[TVSettingsiTunesMoviesFacade _updatePlaybackQuality](self, "_updatePlaybackQuality");
    -[TVSettingsiTunesMoviesFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"iTunesFileVideoResolution");
  }

- (void)_updatePlaybackQuality
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  self->_playbackQuality = (int64_t)[v3 iTunesFileVideoResolution];
}

- (int64_t)playbackQuality
{
  return self->_playbackQuality;
}

@end