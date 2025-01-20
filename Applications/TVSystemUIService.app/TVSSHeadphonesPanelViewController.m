@interface TVSSHeadphonesPanelViewController
- (TVSSHeadphonesPanelViewController)initWithAudioNowPlayingController:(id)a3 menuModeController:(id)a4 headphonesController:(id)a5;
@end

@implementation TVSSHeadphonesPanelViewController

- (TVSSHeadphonesPanelViewController)initWithAudioNowPlayingController:(id)a3 menuModeController:(id)a4 headphonesController:(id)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v12 = 0LL;
  objc_storeStrong(&v12, a5);
  v5 = objc_alloc(&OBJC_CLASS___TVSSHeadphonesPanelPlatterController);
  v11 = -[TVSSHeadphonesPanelPlatterController initWithAudioNowPlayingController:menuModeController:headphonesController:]( v5,  "initWithAudioNowPlayingController:menuModeController:headphonesController:",  location[0],  v13,  v12);
  v6 = v15;
  v15 = 0LL;
  v15 = -[TVSSHeadphonesPanelViewController initWithPlatterController:](v6, "initWithPlatterController:", v11);
  v10 = v15;
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  return v10;
}

@end