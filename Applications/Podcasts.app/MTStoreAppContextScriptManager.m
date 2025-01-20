@interface MTStoreAppContextScriptManager
- (MusicJSNativeViewEventRegistry)jsNativeViewEventRegistry;
- (MusicJSNowPlayingController)jsNowPlayingController;
- (MusicJSPlaybackCoordinator)jsPlaybackCoordinator;
- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
@end

@implementation MTStoreAppContextScriptManager

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[MTJSPodcasts initWithAppContext:](objc_alloc(&OBJC_CLASS___MTJSPodcasts), "initWithAppContext:", v6);

  [v5 setObject:v7 forKeyedSubscript:@"podcasts"];
}

- (MusicJSNativeViewEventRegistry)jsNativeViewEventRegistry
{
  return self->_jsNativeViewEventRegistry;
}

- (MusicJSNowPlayingController)jsNowPlayingController
{
  return self->_jsNowPlayingController;
}

- (MusicJSPlaybackCoordinator)jsPlaybackCoordinator
{
  return self->_jsPlaybackCoordinator;
}

- (void).cxx_destruct
{
}

@end