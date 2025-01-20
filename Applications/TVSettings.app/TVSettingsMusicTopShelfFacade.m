@interface TVSettingsMusicTopShelfFacade
- (TVSettingsMusicTopShelfFacade)init;
- (int64_t)topShelfStyle;
- (void)dealloc;
- (void)setTopShelfStyle:(int64_t)a3;
@end

@implementation TVSettingsMusicTopShelfFacade

- (TVSettingsMusicTopShelfFacade)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsMusicTopShelfFacade;
  v2 = -[TVSettingsMusicTopShelfFacade init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.TVMusic"));
    musicPreferences = v2->_musicPreferences;
    v2->_musicPreferences = (TVSPreferences *)v3;

    v2->_topShelfStyle = (int)-[TVSPreferences integerForKey:]( v2->_musicPreferences,  "integerForKey:",  @"MusicTopShelfStyle");
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  @"com.apple.TVMusic",  0LL));
    id preferencesToken = v2->_preferencesToken;
    v2->_id preferencesToken = (id)v5;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsMusicTopShelfFacade;
  -[TVSettingsMusicTopShelfFacade dealloc](&v3, "dealloc");
}

- (void)setTopShelfStyle:(int64_t)a3
{
  self->_topShelfStyle = a3;
  -[TVSPreferences setInteger:forKey:](self->_musicPreferences, "setInteger:forKey:");
}

- (int64_t)topShelfStyle
{
  return self->_topShelfStyle;
}

- (void).cxx_destruct
{
}

@end