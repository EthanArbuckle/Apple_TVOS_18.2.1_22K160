@interface TVSSPassiveNowPlayingMenuItemProvider
- (TVSSAudioNowPlayingController)audioNowPlayingController;
- (TVSSNowPlayingMenuItemProvider)nowPlayingProvider;
- (TVSSPassiveNowPlayingMenuItemProvider)initWithNowPlayingProvider:(id)a3 audioNowPlayingController:(id)a4;
- (void)_updatePassiveItem;
- (void)dealloc;
- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4;
- (void)providerItemsDidChange:(id)a3;
- (void)setAudioNowPlayingController:(id)a3;
- (void)setNowPlayingProvider:(id)a3;
@end

@implementation TVSSPassiveNowPlayingMenuItemProvider

- (TVSSPassiveNowPlayingMenuItemProvider)initWithNowPlayingProvider:(id)a3 audioNowPlayingController:(id)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0LL;
  v9.receiver = v4;
  v9.super_class = (Class)&OBJC_CLASS___TVSSPassiveNowPlayingMenuItemProvider;
  v12 = -[TVSSMenuItemProvider initWithIdentifier:]( &v9,  "initWithIdentifier:",  @"com.apple.TVSystemUIService.nowPlaying.passiveProvider");
  objc_storeStrong((id *)&v12, v12);
  if (v12)
  {
    objc_storeStrong((id *)&v12->_nowPlayingProvider, location[0]);
    -[TVSSMenuItemProvider addProviderObserver:](v12->_nowPlayingProvider, "addProviderObserver:", v12);
    objc_storeStrong((id *)&v12->_audioNowPlayingController, v10);
    v7 = -[TVSSAudioNowPlayingController nowPlayingState](v12->_audioNowPlayingController, "nowPlayingState");
    -[TVSSNowPlayingState addObserver:](v7, "addObserver:", v12);

    -[TVSSPassiveNowPlayingMenuItemProvider _updatePassiveItem](v12, "_updatePassiveItem");
  }

  v6 = v12;
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v6;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  -[TVSSMenuItemProvider removeProviderObserver:](self->_nowPlayingProvider, "removeProviderObserver:", self);
  v2 = -[TVSSAudioNowPlayingController nowPlayingState](v5->_audioNowPlayingController, "nowPlayingState");
  -[TVSSNowPlayingState removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSPassiveNowPlayingMenuItemProvider;
  -[TVSSPassiveNowPlayingMenuItemProvider dealloc](&v3, "dealloc");
}

- (void)providerItemsDidChange:(id)a3
{
  SEL v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSPassiveNowPlayingMenuItemProvider _updatePassiveItem](v4, "_updatePassiveItem");
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSPassiveNowPlayingMenuItemProvider _updatePassiveItem](v5, "_updatePassiveItem");
  objc_storeStrong(location, 0LL);
}

- (void)_updatePassiveItem
{
  v6 = -[TVSSPassiveNowPlayingMenuItemProvider audioNowPlayingController](self, "audioNowPlayingController");
  v5 = -[TVSSAudioNowPlayingController nowPlayingState](v6, "nowPlayingState");
  id v7 = -[TVSSNowPlayingState playbackState](v5, "playbackState");

  if (v7 == (id)3)
  {
    v2 = +[NSOrderedSet orderedSet](&OBJC_CLASS___NSOrderedSet, "orderedSet");
    -[TVSSMenuItemProvider setItems:](self, "setItems:");
  }

  else
  {
    SEL v4 = -[TVSSPassiveNowPlayingMenuItemProvider nowPlayingProvider](self, "nowPlayingProvider");
    objc_super v3 = -[TVSSMenuItemProvider items](v4, "items");
    -[TVSSMenuItemProvider setItems:](self, "setItems:");
  }

- (TVSSNowPlayingMenuItemProvider)nowPlayingProvider
{
  return self->_nowPlayingProvider;
}

- (void)setNowPlayingProvider:(id)a3
{
}

- (TVSSAudioNowPlayingController)audioNowPlayingController
{
  return self->_audioNowPlayingController;
}

- (void)setAudioNowPlayingController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end