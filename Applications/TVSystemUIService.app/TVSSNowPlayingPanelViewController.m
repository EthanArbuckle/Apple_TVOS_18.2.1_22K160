@interface TVSSNowPlayingPanelViewController
- (TVSSAudioNowPlayingController)audioNowPlayingController;
- (TVSSNowPlayingPanelPlatterController)platterController;
- (TVSSNowPlayingPanelViewController)initWithAudioNowPlayingController:(id)a3;
@end

@implementation TVSSNowPlayingPanelViewController

- (TVSSNowPlayingPanelViewController)initWithAudioNowPlayingController:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = objc_alloc(&OBJC_CLASS___TVSSNowPlayingPanelPlatterController);
  id v8 = -[TVSSNowPlayingPanelPlatterController initWithIdentifier:audioNowPlayingController:]( v3,  "initWithIdentifier:audioNowPlayingController:",  @"com.apple.status.nowPlayingItem",  location[0]);
  v4 = v10;
  v10 = 0LL;
  v7 = -[TVSSNowPlayingPanelViewController initWithPlatterController:](v4, "initWithPlatterController:", v8);
  v10 = v7;
  objc_storeStrong((id *)&v10, v7);
  if (v7)
  {
    objc_storeStrong((id *)&v10->_audioNowPlayingController, location[0]);
    objc_storeStrong((id *)&v10->_platterController, v8);
  }

  v6 = v10;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v6;
}

- (TVSSNowPlayingPanelPlatterController)platterController
{
  return self->_platterController;
}

- (TVSSAudioNowPlayingController)audioNowPlayingController
{
  return self->_audioNowPlayingController;
}

- (void).cxx_destruct
{
}

@end