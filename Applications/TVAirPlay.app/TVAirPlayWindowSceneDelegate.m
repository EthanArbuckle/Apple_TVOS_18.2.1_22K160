@interface TVAirPlayWindowSceneDelegate
- (TVAirPlayMediaViewController)mediaViewController;
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation TVAirPlayWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  v8 = -[TVAirPlayWindow initWithWindowScene:](objc_alloc(&OBJC_CLASS___TVAirPlayWindow), "initWithWindowScene:", v11);
  -[TVAirPlayWindowSceneDelegate setWindow:](self, "setWindow:", v8);
  v9 = objc_alloc_init(&OBJC_CLASS___TVAirPlayMediaViewController);
  mediaViewController = self->_mediaViewController;
  self->_mediaViewController = v9;

  -[TVAirPlayMediaViewController setSceneSession:](self->_mediaViewController, "setSceneSession:", v7);
  -[TVAirPlayWindow setRootViewController:](v8, "setRootViewController:", self->_mediaViewController);
  -[TVAirPlayMediaViewController viewServiceBeginPresentationWithOptions:]( self->_mediaViewController,  "viewServiceBeginPresentationWithOptions:",  0LL);
  -[TVAirPlayWindow makeKeyAndVisible](v8, "makeKeyAndVisible");
}

- (void)sceneDidDisconnect:(id)a3
{
  window = self->_window;
  self->_window = 0LL;

  mediaViewController = self->_mediaViewController;
  self->_mediaViewController = 0LL;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (TVAirPlayMediaViewController)mediaViewController
{
  return self->_mediaViewController;
}

- (void).cxx_destruct
{
}

@end