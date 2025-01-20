@interface TVSSNowPlayingPanelPlatterController
- (TVSPRenderer)transportBarRenderer;
- (TVSSAudioNowPlayingController)audioNowPlayingController;
- (TVSSNowPlayingPanelPlatterController)initWithIdentifier:(id)a3 audioNowPlayingController:(id)a4;
- (TVSSNowPlayingTransportBar)transportBar;
- (void)_updatePlatterArtworkImageForMediaItem:(id)a3;
- (void)configureContentView:(id)a3;
- (void)dealloc;
- (void)didPressPlayPause:(id)a3;
- (void)nowPlayingState:(id)a3 currentMediaItemDidChange:(id)a4;
- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4;
- (void)platterControllerDidActivate;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)transportBarDidUpdateWithTimeElapsed:(double)a3 timeRemaining:(double)a4 percentComplete:(double)a5;
@end

@implementation TVSSNowPlayingPanelPlatterController

- (TVSSNowPlayingPanelPlatterController)initWithIdentifier:(id)a3 audioNowPlayingController:(id)a4
{
  v51 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v49 = 0LL;
  objc_storeStrong(&v49, a4);
  v4 = objc_alloc(&OBJC_CLASS___TVSSNowPlayingTransportBar);
  id v48 = -[TVSSNowPlayingTransportBar initWithAudioNowPlayingController:](v4, "initWithAudioNowPlayingController:", v49);
  id v34 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  id v33 = +[UIColor systemGray3Color](&OBJC_CLASS___UIColor, "systemGray3Color");
  id v32 = +[TVSPViewAttribute backgroundColor:](&OBJC_CLASS___TVSPViewAttribute, "backgroundColor:");
  v56[0] = v32;
  id v31 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
  v56[1] = v31;
  id v30 = +[TVSPViewAttribute cornerRadius:](&OBJC_CLASS___TVSPViewAttribute, "cornerRadius:");
  v56[2] = v30;
  id v29 = +[TVSPViewAttribute contentMode:](&OBJC_CLASS___TVSPViewAttribute, "contentMode:");
  v56[3] = v29;
  v28 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56);
  v27 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v34);
  v57[0] = v27;
  id v26 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  id v25 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
  v55[0] = v25;
  id v24 = +[TVSPViewAttribute contentMode:](&OBJC_CLASS___TVSPViewAttribute, "contentMode:", 1LL);
  v55[1] = v24;
  id v23 =  +[TVSPLayerAttribute minificationFilter:]( &OBJC_CLASS___TVSPLayerAttribute,  "minificationFilter:",  kCAFilterTrilinear);
  v55[2] = v23;
  v22 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55);
  v21 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v26);
  v57[1] = v21;
  v20 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 2LL);
  id v47 =  +[TVSSArtworkInfoRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSSArtworkInfoRenderer,  "rendererWithIdentifier:format:content:overrideStylings:");

  [v47 setArtworkContentMode:2];
  id v46 =  +[TVSSNowPlayingTransportBarRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSSNowPlayingTransportBarRenderer,  "rendererWithIdentifier:format:content:");
  objc_storeStrong((id *)&v51->_transportBarRenderer, v46);
  id v45 =  +[TVSSNowPlayingControlsRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSSNowPlayingControlsRenderer,  "rendererWithIdentifier:format:content:");
  v54[0] = v47;
  v54[1] = v46;
  v54[2] = v45;
  id v44 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 3LL);
  v40 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"track-info");
  v53[0] = v40;
  id v39 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 30.0);
  v53[1] = v39;
  +[TVSSConstants nowPlayingTransportBarHeight](&OBJC_CLASS___TVSSConstants, "nowPlayingTransportBarHeight");
  v38 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"transport-bar",  v5 + 6.0 + 28.0 - 10.0);
  v53[2] = v38;
  +[TVSSConstants nowPlayingLargePlaybackButtonDiameter]( &OBJC_CLASS___TVSSConstants,  "nowPlayingLargePlaybackButtonDiameter");
  v37 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"playback-controls",  v6 - 4.0);
  v53[3] = v37;
  v36 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 4LL);
  v52[0] = v47;
  v52[1] = v46;
  v52[2] = v45;
  v35 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 3LL);
  id v43 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v36);

  [v43 setRowSpacing:0.0];
  v7 = v51;
  v51 = 0LL;
  v42.receiver = v7;
  v42.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingPanelPlatterController;
  v41 = -[TVSSNowPlayingPanelPlatterController initWithIdentifier:layout:renderers:]( &v42,  "initWithIdentifier:layout:renderers:",  location[0],  v43,  v44);
  v51 = v41;
  objc_storeStrong((id *)&v51, v41);
  if (v41)
  {
    objc_storeStrong((id *)&v51->_audioNowPlayingController, v49);
    v16 = -[TVSSAudioNowPlayingController nowPlayingState](v51->_audioNowPlayingController, "nowPlayingState");
    -[TVSSNowPlayingState addObserver:](v16, "addObserver:", v51);

    objc_storeStrong((id *)&v51->_transportBar, v48);
    -[TVSSNowPlayingTransportBar addObserver:](v51->_transportBar, "addObserver:", v51);
    id v17 = objc_alloc(&OBJC_CLASS___PBSPlayPauseButtonEventAssertion);
    v8 = (objc_class *)objc_opt_class(v51);
    v18 = NSStringFromClass(v8);
    v9 = (PBSAssertion *)objc_msgSend(v17, "initWithIdentifier:");
    playPauseAssertion = v51->_playPauseAssertion;
    v51->_playPauseAssertion = v9;

    v11 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
    v12 = -[UITapGestureRecognizer initWithTarget:action:](v11, "initWithTarget:action:", v51, "didPressPlayPause:");
    playPauseGestureRecognizer = v51->_playPauseGestureRecognizer;
    v51->_playPauseGestureRecognizer = v12;

    -[UITapGestureRecognizer setAllowedPressTypes:]( v51->_playPauseGestureRecognizer,  "setAllowedPressTypes:",  &off_1001C8720);
  }

  v15 = v51;
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v48, 0LL);
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v51, 0LL);
  return v15;
}

- (void)dealloc
{
  double v6 = self;
  SEL v5 = a2;
  v2 = -[TVSSAudioNowPlayingController nowPlayingState](self->_audioNowPlayingController, "nowPlayingState");
  -[TVSSNowPlayingState removeObserver:](v2, "removeObserver:", v6);

  -[PBSAssertion relinquish](v6->_playPauseAssertion, "relinquish");
  id v3 = -[UITapGestureRecognizer view](v6->_playPauseGestureRecognizer, "view");
  [v3 removeGestureRecognizer:v6->_playPauseGestureRecognizer];

  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingPanelPlatterController;
  -[TVSSNowPlayingPanelPlatterController dealloc](&v4, "dealloc");
}

- (void)platterControllerDidActivate
{
  double v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingPanelPlatterController;
  -[TVSSNowPlayingPanelPlatterController platterControllerDidActivate](&v4, "platterControllerDidActivate");
  -[PBSAssertion acquire](v6->_playPauseAssertion, "acquire");
  id v3 = -[TVSSNowPlayingPanelPlatterController contentView](v6, "contentView");
  id v2 = [v3 window];
  [v2 addGestureRecognizer:v6->_playPauseGestureRecognizer];
}

- (void)configureContentView:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingPanelPlatterController;
  -[TVSSNowPlayingPanelPlatterController configureContentView:](&v6, "configureContentView:", location[0]);
  id v3 = v8;
  SEL v5 = -[TVSSAudioNowPlayingController nowPlayingState](v8->_audioNowPlayingController, "nowPlayingState");
  objc_super v4 = -[TVSSNowPlayingState currentMediaItem](v5, "currentMediaItem");
  -[TVSSNowPlayingPanelPlatterController _updatePlatterArtworkImageForMediaItem:]( v3,  "_updatePlatterArtworkImageForMediaItem:");

  objc_storeStrong(location, 0LL);
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  v8.receiver = v11;
  v8.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingPanelPlatterController;
  -[TVSSNowPlayingPanelPlatterController rendererWasSelected:context:]( &v8,  "rendererWasSelected:context:",  location[0],  v9);
  id v6 = [location[0] identifier];
  unsigned __int8 v7 = [v6 isEqualToString:@"track-info"];

  if ((v7 & 1) != 0)
  {
    objc_super v4 = +[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance");
    -[PBSSystemService presentNowPlayingWithOptions:completion:]( v4,  "presentNowPlayingWithOptions:completion:",  0LL,  &stru_1001BA3C0);

    [v9 dismissSystemMenuWithSourceIdentifier:@"track-info"];
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

  ;
}

- (void)didPressPlayPause:(id)a3
{
  objc_super v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSAudioNowPlayingController togglePlayPause](v4->_audioNowPlayingController, "togglePlayPause");
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingState:(id)a3 currentMediaItemDidChange:(id)a4
{
  unsigned __int8 v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSNowPlayingPanelPlatterController _updatePlatterArtworkImageForMediaItem:]( v7,  "_updatePlatterArtworkImageForMediaItem:",  v5);
  -[TVSSNowPlayingPanelPlatterController reloadContent](v7, "reloadContent");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSNowPlayingPanelPlatterController reloadContent](v5, "reloadContent");
  objc_storeStrong(location, 0LL);
}

- (void)transportBarDidUpdateWithTimeElapsed:(double)a3 timeRemaining:(double)a4 percentComplete:(double)a5
{
}

- (void)_updatePlatterArtworkImageForMediaItem:(id)a3
{
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    sub_1000D31F4();
    uint64_t v23 = v3;
    uint64_t v24 = v4;
    id v9 = -[TVSSNowPlayingPanelPlatterController contentView](v26, "contentView");
    id v8 = [v9 traitCollection];
    [v8 displayScale];
    uint64_t v10 = v5;

    uint64_t v22 = v10;
    sub_1000D31F4();
    double v20 = v6;
    double v21 = v7;
    objc_initWeak(&v19, v26);
    id v11 = location[0];
    v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_1000D3220;
    v16 = &unk_1001BA3E8;
    id v17 = location[0];
    objc_copyWeak(&v18, &v19);
    objc_msgSend(v11, "requestArtworkWithFittingSize:completion:", &v12, v20, v21);
    objc_destroyWeak(&v18);
    objc_storeStrong(&v17, 0LL);
    objc_destroyWeak(&v19);
  }

  objc_storeStrong(location, 0LL);
}

  ;
}

- (TVSSAudioNowPlayingController)audioNowPlayingController
{
  return self->_audioNowPlayingController;
}

- (TVSSNowPlayingTransportBar)transportBar
{
  return self->_transportBar;
}

- (TVSPRenderer)transportBarRenderer
{
  return self->_transportBarRenderer;
}

- (void).cxx_destruct
{
}

@end