@interface OKWidgetMarimbaView
+ (id)supportedSettings;
+ (void)setupJavascriptContext:(id)a3;
- (BOOL)endAllEditing:(BOOL)a3;
- (BOOL)isBouncing;
- (BOOL)marimbaViewCanInteract:(id)a3;
- (BOOL)prepareForDisplay:(BOOL)a3;
- (BOOL)prepareForUnload:(BOOL)a3;
- (BOOL)prepareForWarmup:(BOOL)a3;
- (BOOL)settingAutoplay;
- (BOOL)settingGotoPosterFrame;
- (BOOL)settingLoop;
- (BOOL)shouldResumeAtBounceEnd;
- (BOOL)slideshowShouldWrap;
- (BOOL)supportsReadiness;
- (CGImage)retainedCGImageForAssetKey:(id)a3 andSize:(CGSize)a4 orientation:(char *)a5;
- (CGImage)retainedCGImageForAssetKey:(id)a3 andSize:(CGSize)a4 orientation:(char *)a5 thumbnailIfPossible:(BOOL)a6 now:(BOOL)a7;
- (CGSize)resolutionForAssetKey:(id)a3;
- (MRMarimbaLayer)marimbaLayer;
- (OKWidgetMarimbaView)initWithWidget:(id)a3;
- (double)remainingPlayDuration;
- (id)_mediaPropertiesForMediaURL:(id)a3;
- (id)absolutePathForAssetKey:(id)a3;
- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (id)attributeForKey:(id)a3 forAssetKey:(id)a4 withOptions:(id)a5;
- (id)attributedSubtitles;
- (id)attributesforAssetPath:(id)a3;
- (id)avAssetForAssetKey:(id)a3;
- (id)detectRegionsOfInterestForAssetKey:(id)a3;
- (id)durations;
- (id)settingAttributedTitle;
- (id)settingMediaFeeder;
- (id)settingObjectForKey:(id)a3;
- (id)settingStyle;
- (id)settingTitle;
- (id)settingTransition;
- (id)subtitles;
- (id)valueForUndefinedKey:(id)a3;
- (void)_restartSlideshowWithCompletion:(id)a3;
- (void)_updateMarimbaDocument;
- (void)dealloc;
- (void)instantPause;
- (void)instantResume;
- (void)layoutSubviews;
- (void)navigateToMediaWithIndex:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)navigateToTextWithIndex:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)navigatorBounceEnd:(id)a3;
- (void)navigatorBounceStart:(id)a3;
- (void)pauseSlideshow:(id)a3;
- (void)play;
- (void)playSlideshow:(id)a3;
- (void)presentationDidLiveUpdate;
- (void)renderer:(id)a3 renderingTimeLogMessage:(id)a4 withTimestamp:(double)a5;
- (void)setAntialiasing:(BOOL)a3;
- (void)setIsBouncing:(BOOL)a3;
- (void)setSettingAttributedSubtitles:(id)a3;
- (void)setSettingAttributedTitle:(id)a3;
- (void)setSettingAutoplay:(BOOL)a3;
- (void)setSettingDurations:(id)a3;
- (void)setSettingForceLive:(BOOL)a3;
- (void)setSettingGotoPosterFrame:(BOOL)a3;
- (void)setSettingInteractiveTransitionSettings:(id)a3;
- (void)setSettingLoop:(BOOL)a3;
- (void)setSettingMediaFeeder:(id)a3;
- (void)setSettingSeed:(unint64_t)a3;
- (void)setSettingStyle:(id)a3;
- (void)setSettingSubtitles:(id)a3;
- (void)setSettingTitle:(id)a3;
- (void)setSettingTransition:(id)a3;
- (void)setSettingUrls:(id)a3;
- (void)setShouldResumeAtBounceEnd:(BOOL)a3;
- (void)slideshowDidEnd:(id)a3;
- (void)warmup:(BOOL)a3;
@end

@implementation OKWidgetMarimbaView

- (OKWidgetMarimbaView)initWithWidget:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
  v3 = -[OKWidgetMarimbaView initWithWidget:](&v30, "initWithWidget:", a3);
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___MRMarimbaView);
    objc_msgSend(-[OKWidgetMarimbaView contentView](v3, "contentView"), "bounds");
    v5 = -[MRMarimbaView initWithFrame:](v4, "initWithFrame:");
    v3->_marimbaView = v5;
    -[MRMarimbaView setClipsToBounds:](v5, "setClipsToBounds:", 1LL);
    objc_msgSend(-[MRMarimbaView layer](v3->_marimbaView, "layer"), "setEdgeAntialiasingMask:", 0);
    -[MRMarimbaView setAutoresizingMask:](v3->_marimbaView, "setAutoresizingMask:", 18LL);
    objc_msgSend(-[OKWidgetMarimbaView contentView](v3, "contentView"), "addSubview:", v3->_marimbaView);
    -[MRMarimbaView setInteractionDelegate:](v3->_marimbaView, "setInteractionDelegate:", v3);
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3->_marimbaOptions = v6;
    v7 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v7, kMPAuthoringUseDefaultAudio);
    -[NSMutableDictionary setObject:forKey:]( v3->_marimbaOptions,  "setObject:forKey:",  kMPFadeNone,  kMPAuthoringIntroEffectID);
    -[NSMutableDictionary setObject:forKey:]( v3->_marimbaOptions,  "setObject:forKey:",  kMPFadeNone,  kMPAuthoringOutroEffectID);
    -[NSMutableDictionary setObject:forKey:]( v3->_marimbaOptions,  "setObject:forKey:",  @"Origami",  kMPAuthoringStyleID);
    -[NSMutableDictionary setObject:forKey:]( v3->_marimbaOptions,  "setObject:forKey:",  &__kCFBooleanTrue,  kMPAuthoringUseLoopTransition);
    -[NSMutableDictionary setObject:forKey:]( v3->_marimbaOptions,  "setObject:forKey:",  &__kCFBooleanFalse,  kMPAuthoringUseTitleEffect);
    -[NSMutableDictionary setObject:forKey:]( v3->_marimbaOptions,  "setObject:forKey:",  &__kCFBooleanFalse,  kMPAuthoringLiveUseOutro);
    -[NSMutableDictionary setObject:forKey:]( v3->_marimbaOptions,  "setObject:forKey:",  &__kCFBooleanFalse,  kMPAuthoringCanRepeatEffectWithPreset);
    -[NSMutableDictionary setObject:forKey:](v3->_marimbaOptions, "setObject:forKey:", &off_26F990, kMPAuthoringSeed);
    objc_msgSend(-[OKWidgetMarimbaView contentView](v3, "contentView"), "bounds");
    double v10 = v8;
    double v11 = v9;
    if (v8 >= v9) {
      double v12 = v8 / v9;
    }
    else {
      double v12 = v9 / v8;
    }
    v3->_landscapeMarimbaDocument = objc_alloc_init(&OBJC_CLASS___MPDocument);
    marimbaOptions = v3->_marimbaOptions;
    *(float *)&double v14 = v12;
    v15 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v14);
    -[NSMutableDictionary setObject:forKey:](marimbaOptions, "setObject:forKey:", v15, kMPAuthoringAspectRatio);
    -[MPDocument setLoopingMode:](v3->_landscapeMarimbaDocument, "setLoopingMode:", 2LL);
    -[MPDocument setAssetKeyDelegate:](v3->_landscapeMarimbaDocument, "setAssetKeyDelegate:", v3);
    v3->_portraitMarimbaDocument = objc_alloc_init(&OBJC_CLASS___MPDocument);
    v16 = v3->_marimbaOptions;
    double v17 = 1.0 / v12;
    *(float *)&double v17 = 1.0 / v12;
    v18 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v17);
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v18, kMPAuthoringAspectRatio);
    -[MPDocument setLoopingMode:](v3->_portraitMarimbaDocument, "setLoopingMode:", 2LL);
    -[MPDocument setAssetKeyDelegate:](v3->_portraitMarimbaDocument, "setAssetKeyDelegate:", v3);
    if (v10 < v11) {
      uint64_t v19 = 112LL;
    }
    else {
      uint64_t v19 = 104LL;
    }
    -[MRMarimbaView setDocument:](v3->_marimbaView, "setDocument:", *(void *)&v3->OKWidgetView_opaque[v19]);
    v20 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v20,  "addObserver:selector:name:object:",  v3,  "slideshowDidEnd:",  kMRNotificationPlaybackOver[0],  -[MRMarimbaLayer renderer](-[MRMarimbaView marimbaLayer](v3->_marimbaView, "marimbaLayer"), "renderer"));
    -[MRMarimbaLayer setInteractivityIsEnabled:]( -[MRMarimbaView marimbaLayer](v3->_marimbaView, "marimbaLayer"),  "setInteractivityIsEnabled:",  1LL);
    -[MRRenderer disableFadeInAndOut]( -[MRMarimbaLayer renderer](-[MRMarimbaView marimbaLayer](v3->_marimbaView, "marimbaLayer"), "renderer"),  "disableFadeInAndOut");
    -[MRMarimbaLayer setCorrectsForAutorotation:]( -[MRMarimbaView marimbaLayer](v3->_marimbaView, "marimbaLayer"),  "setCorrectsForAutorotation:",  0LL);
    -[MRMarimbaView setUserInteractionEnabled:](v3->_marimbaView, "setUserInteractionEnabled:", 1LL);
    -[MRRenderer setRenderingDelegate:]( -[MRMarimbaLayer renderer](-[MRMarimbaView marimbaLayer](v3->_marimbaView, "marimbaLayer"), "renderer"),  "setRenderingDelegate:",  v3);
    v21 = (CGImage *)OFCGImageCreateWithURL( objc_msgSend( +[OKRuntime opusKitBundle](OKRuntime, "opusKitBundle"),  "URLForResource:withExtension:",  @"playOverlay",  @"png"),  1);
    v22 = +[UIImage imageWithCGImage:](&OBJC_CLASS___UIImage, "imageWithCGImage:", v21);
    if (v21) {
      CGImageRelease(v21);
    }
    v23 = +[OFUIButton buttonWithType:](&OBJC_CLASS___OFUIButton, "buttonWithType:", 0LL);
    v3->_videoPlayButton = v23;
    -[OFUIButton setBackgroundImage:forState:](v23, "setBackgroundImage:forState:", v22, 0LL);
    objc_msgSend(-[OKWidgetMarimbaView contentView](v3, "contentView"), "center");
    -[OFUIButton setCenter:](v3->_videoPlayButton, "setCenter:");
    -[UIImage size](v22, "size");
    double v25 = v24;
    -[UIImage size](v22, "size");
    -[OFUIButton setBounds:](v3->_videoPlayButton, "setBounds:", 0.0, 0.0, v25, v26);
    -[OFUIButton setHidden:](v3->_videoPlayButton, "setHidden:", 1LL);
    -[OFUIButton addTarget:action:forControlEvents:]( v3->_videoPlayButton,  "addTarget:action:forControlEvents:",  v3,  "playSlideshow:",  64LL);
    v3->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("OKWidgetMarimbaView", 0LL);
    v3->_needsBuildingDocument = 1;
    v27 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v27,  "addObserver:selector:name:object:",  v3,  "navigatorBounceStart:",  kOKNavigatorLinearBounceStart,  0LL);
    v28 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v28,  "addObserver:selector:name:object:",  v3,  "navigatorBounceEnd:",  kOKNavigatorLinearBounceEnd,  0LL);
  }

  return v3;
}

- (void)dealloc
{
  marimbaView = self->_marimbaView;
  if (marimbaView)
  {

    self->_marimbaView = 0LL;
  }

  -[MPDocument setDocumentAttribute:forKey:]( self->_landscapeMarimbaDocument,  "setDocumentAttribute:forKey:",  0LL,  kMPDocumentAuthoringOptions[0]);
  landscapeMarimbaDocument = self->_landscapeMarimbaDocument;
  if (landscapeMarimbaDocument)
  {

    self->_landscapeMarimbaDocument = 0LL;
  }

  -[MPDocument setDocumentAttribute:forKey:]( self->_portraitMarimbaDocument,  "setDocumentAttribute:forKey:",  0LL,  kMPDocumentAuthoringOptions[0]);
  portraitMarimbaDocument = self->_portraitMarimbaDocument;
  if (portraitMarimbaDocument)
  {

    self->_portraitMarimbaDocument = 0LL;
  }

  marimbaOptions = self->_marimbaOptions;
  if (marimbaOptions)
  {

    self->_marimbaOptions = 0LL;
  }

  mediaFeeder = self->_mediaFeeder;
  if (mediaFeeder)
  {

    self->_mediaFeeder = 0LL;
  }

  videoPlayButton = self->_videoPlayButton;
  if (videoPlayButton)
  {

    self->_videoPlayButton = 0LL;
  }

  attributedTitle = self->_attributedTitle;
  if (attributedTitle)
  {

    self->_attributedTitle = 0LL;
  }

  title = self->_title;
  if (title)
  {

    self->_title = 0LL;
  }

  attributedSubtitles = self->_attributedSubtitles;
  if (attributedSubtitles)
  {

    self->_attributedSubtitles = 0LL;
  }

  subtitles = self->_subtitles;
  if (subtitles)
  {

    self->_subtitles = 0LL;
  }

  durations = self->_durations;
  if (durations)
  {

    self->_durations = 0LL;
  }

  serialQueue = (dispatch_object_s *)self->_serialQueue;
  if (serialQueue)
  {
    dispatch_release(serialQueue);
    self->_serialQueue = 0LL;
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
  -[OKWidgetMarimbaView dealloc](&v15, "dealloc");
}

- (MRMarimbaLayer)marimbaLayer
{
  return -[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer");
}

- (void)layoutSubviews
{
  double v4 = v3;
  -[OKWidgetMarimbaView bounds](self, "bounds");
  v5 = &OBJC_IVAR___OKWidgetMarimbaView__landscapeMarimbaDocument;
  if (v4 < v6) {
    v5 = &OBJC_IVAR___OKWidgetMarimbaView__portraitMarimbaDocument;
  }
  v7 = *(MPDocument **)&self->OKWidgetView_opaque[*v5];
  if (v7 == -[MRMarimbaLayer document](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "document"))
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
    -[OKWidgetMarimbaView layoutSubviews](&v13, "layoutSubviews");
  }

  else
  {
    objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "cleanup");
    UIInterfaceOrientation v8 = -[UIApplication statusBarOrientation]( +[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"),  "statusBarOrientation");
    double v9 = -[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer");
    -[OKWidgetMarimbaView bounds](self, "bounds");
    double v11 = v10;
    -[OKWidgetMarimbaView bounds](self, "bounds");
    -[MRMarimbaLayer beginMorphingToAspectRatio:andOrientation:withDuration:switchToDocument:]( v9,  "beginMorphingToAspectRatio:andOrientation:withDuration:switchToDocument:",  v8,  v7,  v11 / v12,  0.5);
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
    -[OKWidgetMarimbaView layoutSubviews](&v13, "layoutSubviews");
    -[MRMarimbaLayer endMorphing](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "endMorphing");
  }

  objc_msgSend(-[OKWidgetMarimbaView contentView](self, "contentView"), "center");
  -[OFUIButton setCenter:](self->_videoPlayButton, "setCenter:");
}

+ (id)supportedSettings
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___OKWidgetMarimbaView;
  v2 = [NSMutableDictionary dictionaryWithDictionary:objc_msgSendSuper2(&v7, "supportedSettings")];
  v38[0] = @"urls";
  uint64_t v3 = kOKSettingKeyType;
  uint64_t v4 = kOKSettingKeyDefault;
  v36[0] = kOKSettingKeyType;
  v36[1] = kOKSettingKeyDefault;
  v37[0] = &off_26F9A8;
  v37[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v39[0] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  2LL);
  v38[1] = @"style";
  v34[0] = v3;
  v34[1] = v4;
  v35[0] = &off_26F9C0;
  v35[1] = @"Origami";
  v39[1] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL);
  v38[2] = @"autoplay";
  v32[0] = v3;
  v32[1] = v4;
  v33[0] = &off_26F9D8;
  v33[1] = &__kCFBooleanFalse;
  v39[2] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL);
  v38[3] = @"loop";
  v30[0] = v3;
  v30[1] = v4;
  v31[0] = &off_26F9D8;
  v31[1] = &__kCFBooleanFalse;
  v39[3] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL);
  v38[4] = @"gotoPosterFrame";
  v28[0] = v3;
  v28[1] = v4;
  v29[0] = &off_26F9D8;
  v29[1] = &__kCFBooleanFalse;
  v39[4] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  2LL);
  v38[5] = @"mediaFeeder";
  v26[0] = v3;
  v26[1] = kOKSettingKeyClass;
  v27[0] = &off_26F9F0;
  v27[1] = objc_opt_class(&OBJC_CLASS___OKMediaFeeder, v5);
  v39[5] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL);
  v38[6] = @"attributedTitle";
  v24[1] = v4;
  v25[0] = &off_26FA08;
  v24[0] = v3;
  v25[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v39[6] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL);
  v38[7] = @"title";
  v22[1] = v4;
  v23[0] = &off_26F9C0;
  v22[0] = v3;
  v23[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v39[7] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL);
  v38[8] = @"attributedSubtitles";
  v20[1] = v4;
  v21[0] = &off_26FA20;
  v20[0] = v3;
  v21[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v39[8] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL);
  v38[9] = @"subtitles";
  v18[1] = v4;
  v19[0] = &off_26FA20;
  v18[0] = v3;
  v19[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v39[9] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL);
  v38[10] = @"durations";
  v16[1] = v4;
  v17[0] = &off_26FA20;
  v16[0] = v3;
  v17[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v39[10] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL);
  v38[11] = @"seed";
  v14[1] = v4;
  v15[0] = &off_26FA38;
  v14[0] = v3;
  v15[1] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", arc4random());
  v39[11] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL);
  v38[12] = @"documents";
  v12[1] = v4;
  v13[0] = &off_26FA20;
  v12[0] = v3;
  v13[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v39[12] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL);
  v38[13] = @"forceLive";
  v10[0] = v3;
  v10[1] = v4;
  v11[0] = &off_26F9D8;
  v11[1] = &__kCFBooleanFalse;
  v39[13] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL);
  v38[14] = @"interactiveTransitionSettings";
  v8[0] = v3;
  v8[1] = v4;
  v9[0] = &off_26FA20;
  v9[1] = &off_26F920;
  v39[14] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL);
  -[NSMutableDictionary addEntriesFromDictionary:]( v2,  "addEntriesFromDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  15LL));
  return v2;
}

- (id)settingObjectForKey:(id)a3
{
  return 0LL;
}

- (void)setSettingInteractiveTransitionSettings:(id)a3
{
  if ([a3 objectForKeyedSubscript:@"trackingBoxRadiusDefaultValue"])
  {
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"trackingBoxRadiusDefaultValue"), "floatValue");
    objc_msgSend( -[OKWidgetMarimbaView presentationViewController](self, "presentationViewController"),  "setInteractiveTransitionTrackingBoxRadius:",  v5);
  }

  if ([a3 objectForKeyedSubscript:@"progressThresholdDefaultValue"])
  {
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"progressThresholdDefaultValue"), "floatValue");
    objc_msgSend( -[OKWidgetMarimbaView presentationViewController](self, "presentationViewController"),  "setInteractiveTransitionProgressThreshold:",  v6);
  }

  if ([a3 objectForKeyedSubscript:@"velocityThresholdDefaultValue"])
  {
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"velocityThresholdDefaultValue"), "floatValue");
    objc_msgSend( -[OKWidgetMarimbaView presentationViewController](self, "presentationViewController"),  "setInteractiveTransitionVelocityThreshold:",  v7);
  }

- (id)valueForUndefinedKey:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
  return -[OKWidgetMarimbaView valueForUndefinedKey:](&v4, "valueForUndefinedKey:", a3);
}

- (void)navigatorBounceStart:(id)a3
{
  self->_isBouncing = 1;
  self->_shouldResumeAtBounceEnd = -[MRMarimbaLayer isPlaying]( -[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer", a3),  "isPlaying");
  -[MRMarimbaLayer pause](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "pause");
}

- (void)navigatorBounceEnd:(id)a3
{
  self->_isBouncing = 0;
  if (self->_shouldResumeAtBounceEnd) {
    -[MRMarimbaLayer play](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer", a3), "play");
  }
}

- (void)setSettingUrls:(id)a3
{
  id v5 = -[OKWidgetMarimbaView mediaURLs](self, "mediaURLs");
  if ((a3 && [a3 count] || objc_msgSend(v5, "count"))
    && !self->_mediaFeeder
    && ([v5 isEqualToArray:a3] & 1) == 0)
  {
    [v5 removeAllObjects];
    [v5 addObjectsFromArray:a3];
    -[MPDocument setVideoPaths:]( self->_landscapeMarimbaDocument,  "setVideoPaths:",  [a3 valueForKeyPath:@"absoluteString"]);
    -[MPDocument setVideoPaths:]( self->_portraitMarimbaDocument,  "setVideoPaths:",  [a3 valueForKeyPath:@"absoluteString"]);
    float v6 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [a3 count]);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(a3);
          }
          double v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          id v12 = -[OKWidgetMarimbaView _mediaPropertiesForMediaURL:](self, "_mediaPropertiesForMediaURL:", v11);
          if (v12) {
            -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v12, [v11 absoluteString]);
          }
        }

        id v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v8);
    }

    -[MPDocument setMediaProperties:](self->_landscapeMarimbaDocument, "setMediaProperties:", v6);
    -[MPDocument setMediaProperties:](self->_portraitMarimbaDocument, "setMediaProperties:", v6);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    void v13[2] = sub_18C7F4;
    v13[3] = &unk_24D5B0;
    v13[4] = self;
    +[OKSettings applyUpdateBlockOnce:forKey:]( &OBJC_CLASS___OKSettings,  "applyUpdateBlockOnce:forKey:",  v13,  @"updateMarimbaDocument");
  }

- (id)settingMediaFeeder
{
  return self->_mediaFeeder;
}

- (void)setSettingMediaFeeder:(id)a3
{
  mediaFeeder = self->_mediaFeeder;
  if (mediaFeeder != a3)
  {
    if (mediaFeeder)
    {

      self->_mediaFeeder = 0LL;
    }

    self->_mediaFeeder = (OKMediaFeeder *)a3;
    -[OKWidgetMarimbaView presentationDidLiveUpdate](self, "presentationDidLiveUpdate");
  }

- (id)settingStyle
{
  return -[NSMutableDictionary objectForKey:](self->_marimbaOptions, "objectForKey:", kMPAuthoringStyleID);
}

- (void)setSettingStyle:(id)a3
{
  if ((objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_marimbaOptions,  "objectForKey:",  kMPAuthoringStyleID),  "isEqualToString:",  a3) & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKey:](self->_marimbaOptions, "setObject:forKey:", a3, kMPAuthoringStyleID);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_18C93C;
    v5[3] = &unk_24D5B0;
    v5[4] = self;
    +[OKSettings applyUpdateBlockOnce:forKey:]( &OBJC_CLASS___OKSettings,  "applyUpdateBlockOnce:forKey:",  v5,  @"updateMarimbaDocument");
  }

- (id)settingTransition
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->_marimbaOptions, "objectForKey:", kMPAuthoringTransitionList),  "firstObject");
}

- (void)setSettingTransition:(id)a3
{
  if ((objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_marimbaOptions,  "objectForKey:",  kMPAuthoringTransitionList),  "firstObject"),  "isEqualToString:",  a3) & 1) == 0)
  {
    marimbaOptions = self->_marimbaOptions;
    float v6 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", a3);
    -[NSMutableDictionary setObject:forKey:](marimbaOptions, "setObject:forKey:", v6, kMPAuthoringTransitionList);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_18CA38;
    v7[3] = &unk_24D5B0;
    v7[4] = self;
    +[OKSettings applyUpdateBlockOnce:forKey:]( &OBJC_CLASS___OKSettings,  "applyUpdateBlockOnce:forKey:",  v7,  @"updateMarimbaDocument");
  }

- (BOOL)settingAutoplay
{
  return self->_autoplay;
}

- (void)setSettingAutoplay:(BOOL)a3
{
  self->_autoplay = a3;
}

- (BOOL)settingLoop
{
  return self->_loop;
}

- (void)setSettingLoop:(BOOL)a3
{
  self->_loop = a3;
}

- (BOOL)settingGotoPosterFrame
{
  return self->_gotoPosterFrame;
}

- (void)setSettingGotoPosterFrame:(BOOL)a3
{
  self->_gotoPosterFrame = a3;
}

- (id)settingAttributedTitle
{
  return self->_attributedTitle;
}

- (void)setSettingAttributedTitle:(id)a3
{
  attributedTitle = self->_attributedTitle;
  if (attributedTitle != a3)
  {

    self->_attributedTitle = (NSAttributedString *)[a3 copy];
    self->_needsBuildingDocument = 1;
  }

- (id)settingTitle
{
  return self->_title;
}

- (void)setSettingTitle:(id)a3
{
  title = self->_title;
  if (title != a3)
  {

    self->_title = (NSString *)[a3 copy];
    self->_needsBuildingDocument = 1;
  }

- (id)attributedSubtitles
{
  return self->_attributedSubtitles;
}

- (void)setSettingAttributedSubtitles:(id)a3
{
  if (([a3 isEqualToDictionary:self->_attributedSubtitles] & 1) == 0)
  {

    self->_attributedSubtitles = (NSDictionary *)[a3 copy];
    self->_needsBuildingDocument = 1;
  }

- (id)subtitles
{
  return self->_subtitles;
}

- (void)setSettingSubtitles:(id)a3
{
  if (([a3 isEqualToDictionary:self->_subtitles] & 1) == 0)
  {

    self->_subtitles = (NSDictionary *)[a3 copy];
    self->_needsBuildingDocument = 1;
  }

- (id)durations
{
  return self->_durations;
}

- (void)setSettingDurations:(id)a3
{
  if (([a3 isEqualToDictionary:self->_durations] & 1) == 0)
  {

    self->_durations = (NSDictionary *)[a3 copy];
    self->_needsBuildingDocument = 1;
  }

- (void)setSettingSeed:(unint64_t)a3
{
  if (objc_msgSend( -[NSMutableDictionary objectForKey:](self->_marimbaOptions, "objectForKey:", kMPAuthoringSeed),  "unsignedIntegerValue") != (id)a3)
  {
    marimbaOptions = self->_marimbaOptions;
    float v6 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3);
    -[NSMutableDictionary setObject:forKey:](marimbaOptions, "setObject:forKey:", v6, kMPAuthoringSeed);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_18CD98;
    v7[3] = &unk_24D5B0;
    v7[4] = self;
    +[OKSettings applyUpdateBlockOnce:forKey:]( &OBJC_CLASS___OKSettings,  "applyUpdateBlockOnce:forKey:",  v7,  @"updateMarimbaDocument");
  }

- (void)setSettingForceLive:(BOOL)a3
{
  self->_forceLive = a3;
}

- (void)slideshowDidEnd:(id)a3
{
  if (self->_loop)
  {
    -[MRMarimbaLayer setTime:](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer", a3), "setTime:", 0.0);
    marimbaView = self->_marimbaView;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_18CE5C;
    v5[3] = &unk_24D5B0;
    v5[4] = self;
    -[MRMarimbaView warmupAndPlay:completionBlock:](marimbaView, "warmupAndPlay:completionBlock:", 1LL, v5);
  }

  else
  {
    -[OFUIButton setHidden:](self->_videoPlayButton, "setHidden:", 0LL);
  }

- (BOOL)slideshowShouldWrap
{
  return objc_msgSend( -[OKWidgetMarimbaView presentationViewController](self, "presentationViewController"),  "couchModeLoops");
}

- (void)setAntialiasing:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
  -[OKWidgetMarimbaView setAntialiasing:](&v6, "setAntialiasing:");
  if (v3) {
    uint64_t v5 = 15LL;
  }
  else {
    uint64_t v5 = 0LL;
  }
  -[MRMarimbaLayer setEdgeAntialiasingMask:]( -[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"),  "setEdgeAntialiasingMask:",  v5);
}

- (void)instantPause
{
  self->_shouldResumeAtBounceEnd = 0;
  -[MRMarimbaView pause](self->_marimbaView, "pause");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
  -[OKWidgetMarimbaView instantPause](&v3, "instantPause");
}

- (void)instantResume
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
  -[OKWidgetMarimbaView instantResume](&v3, "instantResume");
  if (self->_isBouncing) {
    self->_shouldResumeAtBounceEnd = 1;
  }
  else {
    -[MRMarimbaLayer play](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "play");
  }
}

- (double)remainingPlayDuration
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
  -[OKWidgetMarimbaView remainingPlayDuration](&v15, "remainingPlayDuration");
  double v4 = v3;
  -[OKWidgetMarimbaView bounds](self, "bounds");
  double v6 = v5;
  -[OKWidgetMarimbaView bounds](self, "bounds");
  id v7 = &OBJC_IVAR___OKWidgetMarimbaView__landscapeMarimbaDocument;
  if (v6 < v8) {
    id v7 = &OBJC_IVAR___OKWidgetMarimbaView__portraitMarimbaDocument;
  }
  uint64_t v9 = *(void **)&self->OKWidgetView_opaque[*v7];
  unsigned __int8 v10 = objc_msgSend( -[OKWidgetMarimbaView presentationViewController](self, "presentationViewController"),  "couchModeLoops");
  [v9 duration];
  double v12 = v11;
  if ((v10 & 1) == 0)
  {
    -[MRRenderer currentSlideshowTime]( -[MRMarimbaLayer renderer](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "renderer"),  "currentSlideshowTime");
    double v12 = v12 - v13;
  }

  double result = 0.0;
  if (v12 >= 0.0166666667) {
    double result = v12;
  }
  if (v4 >= result) {
    return v4;
  }
  return result;
}

- (void)play
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
  -[OKWidgetMarimbaView play](&v6, "play");
  -[OKWidgetMarimbaView playSlideshow:](self, "playSlideshow:", self);
}

- (BOOL)supportsReadiness
{
  return 1;
}

- (BOOL)prepareForDisplay:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
  BOOL v4 = -[OKWidgetMarimbaView prepareForDisplay:](&v14, "prepareForDisplay:", a3);
  if (v4)
  {
    objc_sync_enter(self);
    -[MRRenderer setLogRenderingTimes:]( -[MRMarimbaLayer renderer](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "renderer"),  "setLogRenderingTimes:",  objc_msgSend( -[OKWidgetMarimbaView presentationViewController](self, "presentationViewController"),  "logRenderingTimes"));
    double slideshowTimeAtLastUnload = 0.0;
    if (objc_msgSend( -[OKWidgetMarimbaView presentationViewController](self, "presentationViewController"),  "hasBeenHidden")) {
      double slideshowTimeAtLastUnload = self->_slideshowTimeAtLastUnload;
    }
    self->_double slideshowTimeAtLastUnload = 0.0;
    -[MRMarimbaLayer setTime:]( -[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"),  "setTime:",  slideshowTimeAtLastUnload);
    if (self->_needsBuildingDocument) {
      -[OKWidgetMarimbaView _updateMarimbaDocument](self, "_updateMarimbaDocument");
    }
    -[OKWidgetMarimbaView bounds](self, "bounds");
    double v7 = v6;
    -[OKWidgetMarimbaView bounds](self, "bounds");
    double v8 = &OBJC_IVAR___OKWidgetMarimbaView__landscapeMarimbaDocument;
    if (v7 < v9) {
      double v8 = &OBJC_IVAR___OKWidgetMarimbaView__portraitMarimbaDocument;
    }
    unsigned __int8 v10 = *(MPDocument **)&self->OKWidgetView_opaque[*v8];
    if (v10 != -[MRMarimbaLayer document]( -[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"),  "document")) {
      -[MRMarimbaLayer setDocument:]( -[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"),  "setDocument:",  v10);
    }
    -[MRMarimbaLayer pause](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "pause");
    -[MRMarimbaLayer setTime:]( -[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"),  "setTime:",  slideshowTimeAtLastUnload);
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_18D31C;
    block[3] = &unk_24D5B0;
    block[4] = self;
    dispatch_async(serialQueue, block);
    objc_sync_exit(self);
  }

  return v4;
}

- (BOOL)prepareForWarmup:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
  BOOL v4 = -[OKWidgetMarimbaView prepareForWarmup:](&v13, "prepareForWarmup:", a3);
  if (v4)
  {
    objc_sync_enter(self);
    -[OKWidgetMarimbaView endAllEditing:](self, "endAllEditing:", 0LL);
    if (self->_needsBuildingDocument) {
      -[OKWidgetMarimbaView _updateMarimbaDocument](self, "_updateMarimbaDocument");
    }
    -[OKWidgetMarimbaView bounds](self, "bounds");
    double v6 = v5;
    -[OKWidgetMarimbaView bounds](self, "bounds");
    double v7 = &OBJC_IVAR___OKWidgetMarimbaView__landscapeMarimbaDocument;
    if (v6 < v8) {
      double v7 = &OBJC_IVAR___OKWidgetMarimbaView__portraitMarimbaDocument;
    }
    double v9 = *(MPDocument **)&self->OKWidgetView_opaque[*v7];
    if (v9 != -[MRMarimbaLayer document](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "document")) {
      -[MRMarimbaLayer setDocument:]( -[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"),  "setDocument:",  v9);
    }
    -[MRMarimbaLayer pause](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "pause");
    -[MRMarimbaLayer setTime:](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "setTime:", 0.0);
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_18D494;
    block[3] = &unk_24D5B0;
    block[4] = self;
    dispatch_async(serialQueue, block);
    objc_sync_exit(self);
  }

  return v4;
}

- (BOOL)prepareForUnload:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OKWidgetMarimbaView;
  BOOL v4 = -[OKWidgetMarimbaView prepareForUnload:](&v8, "prepareForUnload:", a3);
  if (v4)
  {
    objc_sync_enter(self);
    -[OKWidgetMarimbaView endAllEditing:](self, "endAllEditing:", 0LL);
    -[MRMarimbaLayer pause](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "pause");
    -[MRRenderer currentSlideshowTime]( -[MRMarimbaLayer renderer](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "renderer"),  "currentSlideshowTime");
    double v6 = v5 + -0.5;
    if (v6 < 0.0) {
      double v6 = 0.0;
    }
    self->_double slideshowTimeAtLastUnload = v6;
    -[MRMarimbaLayer setTime:](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "setTime:", 0.0);
    -[OKWidgetMarimbaView resignReady](self, "resignReady");
    self->_needsBuildingDocument = 1;
    objc_sync_exit(self);
  }

  return v4;
}

- (void)_updateMarimbaDocument
{
  if (-[OKWidgetMarimbaView prepareMode](self, "prepareMode") != (char *)&dword_0 + 1
    && -[OKWidgetMarimbaView prepareMode](self, "prepareMode") != (char *)&dword_0 + 2)
  {
    -[OKWidgetMarimbaView prepareMode](self, "prepareMode");
    return;
  }

  objc_sync_enter(self);
  objc_msgSend(-[OKWidgetMarimbaView contentView](self, "contentView"), "bounds");
  double v5 = v3;
  double v6 = v4;
  if (v3 >= v4) {
    double v7 = v3 / v4;
  }
  else {
    double v7 = v4 / v3;
  }
  if (!self->_authoringIsOutsourced)
  {
    objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "cleanup");
    marimbaOptions = self->_marimbaOptions;
    if (self->_forceLive)
    {
      -[NSMutableDictionary setObject:forKey:]( self->_marimbaOptions,  "setObject:forKey:",  &__kCFBooleanTrue,  kMPAuthoringLive);
    }

    else
    {
      mediaFeeder = self->_mediaFeeder;
      if (mediaFeeder)
      {
        id v10 = -[OKMediaFeeder numberOfMediaItems](mediaFeeder, "numberOfMediaItems");
        BOOL v11 = v10 > objc_msgSend(-[MPDocument videoPaths](self->_landscapeMarimbaDocument, "videoPaths"), "count");
      }

      else
      {
        BOOL v11 = 0LL;
      }

      double v12 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11);
      -[NSMutableDictionary setObject:forKey:](marimbaOptions, "setObject:forKey:", v12, kMPAuthoringLive);
    }

    attributedTitle = self->_attributedTitle;
    if (!attributedTitle) {
      attributedTitle = (NSAttributedString *)self->_title;
    }
    objc_super v14 = self->_marimbaOptions;
    objc_super v15 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", attributedTitle != 0LL);
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, kMPAuthoringUseTitleEffect);
    __int128 v16 = self->_marimbaOptions;
    if (attributedTitle)
    {
      v33 = attributedTitle;
      __int128 v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL);
    }

    else
    {
      __int128 v17 = (NSArray *)&__NSArray0__struct;
    }

    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v17, kMPAuthoringTitleStrings);
    subtitles = self->_subtitles;
    if (self->_attributedSubtitles)
    {
      if (subtitles)
      {
        id v19 = -[NSDictionary mutableCopy](self->_subtitles, "mutableCopy");
        [v19 addEntriesFromDictionary:self->_attributedSubtitles];
        -[NSMutableDictionary setObject:forKey:](self->_marimbaOptions, "setObject:forKey:", v19, kMPAuthoringSubtitles);

LABEL_26:
        durations = self->_durations;
        if (durations) {
          -[NSMutableDictionary setObject:forKey:]( self->_marimbaOptions,  "setObject:forKey:",  durations,  kMPAuthoringCustomDurations);
        }
        objc_msgSend( +[MPCropController sharedController](MPCropController, "sharedController"),  "setDelegate:",  self);
        v23 = self->_marimbaOptions;
        double v24 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7);
        -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v24, kMPAuthoringAspectRatio);
        -[MPDocument setDocumentAttribute:forKey:]( self->_landscapeMarimbaDocument,  "setDocumentAttribute:forKey:",  self->_marimbaOptions,  kMPDocumentAuthoringOptions[0]);
        -[MPDocument applyStyle:]( self->_landscapeMarimbaDocument,  "applyStyle:",  -[NSMutableDictionary objectForKey:](self->_marimbaOptions, "objectForKey:", kMPAuthoringStyleID));
        double v25 = self->_marimbaOptions;
        double v26 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 1.0 / v7);
        -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v26, kMPAuthoringAspectRatio);
        -[MPDocument setDocumentAttribute:forKey:]( self->_portraitMarimbaDocument,  "setDocumentAttribute:forKey:",  self->_marimbaOptions,  kMPDocumentAuthoringOptions[0]);
        -[MPDocument applyStyle:]( self->_portraitMarimbaDocument,  "applyStyle:",  -[NSMutableDictionary objectForKey:](self->_marimbaOptions, "objectForKey:", kMPAuthoringStyleID));
        objc_msgSend( +[MPCropController sharedController](MPCropController, "sharedController"),  "setDelegate:",  0);
        objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "cleanup");
        goto LABEL_29;
      }

      v20 = self->_marimbaOptions;
      v21 = kMPAuthoringSubtitles;
      subtitles = self->_attributedSubtitles;
    }

    else
    {
      v20 = self->_marimbaOptions;
      v21 = kMPAuthoringSubtitles;
      if (!subtitles)
      {
        -[NSMutableDictionary removeObjectForKey:](v20, "removeObjectForKey:", kMPAuthoringSubtitles);
        goto LABEL_26;
      }
    }

    -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", subtitles, v21);
    goto LABEL_26;
  }

- (void)presentationDidLiveUpdate
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_18DADC;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_async(global_queue, block);
}

- (void)warmup:(BOOL)a3
{
  if (self->_gotoPosterFrame)
  {
    -[MPDocument posterTime](self->_landscapeMarimbaDocument, "posterTime");
    -[MRRenderer setTime:]( -[MRMarimbaLayer renderer](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "renderer"),  "setTime:",  v5);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_18DFF0;
  v6[3] = &unk_24D5D8;
  v6[4] = self;
  BOOL v7 = a3;
  -[OKWidgetMarimbaView performBlockOnMainThread:](self, "performBlockOnMainThread:", v6);
  objc_sync_exit(self);
}

- (void)playSlideshow:(id)a3
{
  if (self->_isBouncing)
  {
    self->_shouldResumeAtBounceEnd = 1;
  }

  else
  {
    objc_sync_enter(self);
    if (!-[MRMarimbaLayer isPlaying](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "isPlaying"))
    {
      marimbaView = self->_marimbaView;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_18E17C;
      v5[3] = &unk_24D5B0;
      v5[4] = self;
      -[MRMarimbaView warmupAndPlay:completionBlock:](marimbaView, "warmupAndPlay:completionBlock:", 1LL, v5);
    }

    objc_sync_exit(self);
  }

- (void)pauseSlideshow:(id)a3
{
  self->_shouldResumeAtBounceEnd = 0;
  -[MRMarimbaLayer pause](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "pause");
  objc_sync_exit(self);
}

- (void)navigateToMediaWithIndex:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = -[MPDocument allSlides]( -[MRMarimbaLayer document]( -[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer", a3, a4),  "document"),  "allSlides");
  if ((unint64_t)[v8 count] > a3)
  {
    id v9 = [v8 objectAtIndexedSubscript:a3];
    if (v9)
    {
      -[MRMarimbaLayer gotoSlide:](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "gotoSlide:", v9);
      uint64_t v10 = 1LL;
      if (!a5) {
        return;
      }
LABEL_6:
      (*((void (**)(id, uint64_t))a5 + 2))(a5, v10);
      return;
    }
  }

  uint64_t v10 = 0LL;
  if (a5) {
    goto LABEL_6;
  }
}

- (void)navigateToTextWithIndex:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = -[MRMarimbaLayer document](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer", a3, a4), "document");
  if (!a3 && (self->_attributedTitle || self->_title))
  {
    id v10 = objc_msgSend(objc_msgSend(-[MPDocument titleEffect](v8, "titleEffect"), "texts"), "lastObject");
  }

  else
  {
    id v9 = -[MPDocument allSlides](v8, "allSlides");
    if ((unint64_t)[v9 count] <= a3
      || (id v10 = objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(v9, "objectAtIndexedSubscript:", a3), "parentSubtitleEffect"),  "texts"),  "lastObject")) == 0)
    {
      uint64_t v11 = 0LL;
      if (!a5) {
        return;
      }
      goto LABEL_5;
    }
  }

  -[MRMarimbaLayer gotoText:](-[MRMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"), "gotoText:", v10);
  uint64_t v11 = 1LL;
  if (a5) {
LABEL_5:
  }
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v11);
}

- (void)_restartSlideshowWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_18E420;
  v5[3] = &unk_258BB0;
  v5[4] = self;
  void v5[5] = a3;
  -[OKWidgetMarimbaView navigateToMediaWithIndex:animated:completion:]( self,  "navigateToMediaWithIndex:animated:completion:",  0LL,  0LL,  v5);
}

- (BOOL)marimbaViewCanInteract:(id)a3
{
  return objc_msgSend( -[OKWidgetMarimbaView presentationViewController](self, "presentationViewController", a3),  "interactivityEnabled");
}

- (id)absolutePathForAssetKey:(id)a3
{
  return 0LL;
}

- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  return 0LL;
}

- (CGSize)resolutionForAssetKey:(id)a3
{
  id v3 = objc_msgSend( objc_msgSend(-[OKWidgetMarimbaView page](self, "page"), "presentation"),  "mediaItemForURL:",  +[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  if (v3)
  {
    objc_msgSend(objc_msgSend(v3, "metadata"), "resolution");
  }

  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  result.double height = height;
  result.double width = width;
  return result;
}

- (id)attributeForKey:(id)a3 forAssetKey:(id)a4 withOptions:(id)a5
{
  id result = objc_msgSend( objc_msgSend(-[OKWidgetMarimbaView page](self, "page", a3, a4, a5), "presentation"),  "mediaItemForURL:",  +[NSURL URLWithString:](NSURL, "URLWithString:", a4));
  if (result) {
    return objc_msgSend(objc_msgSend(result, "metadata"), "dictionaryValueForKey:", a3);
  }
  return result;
}

- (id)attributesforAssetPath:(id)a3
{
  id result = objc_msgSend( objc_msgSend(-[OKWidgetMarimbaView page](self, "page"), "presentation"),  "mediaItemForURL:",  +[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  if (result) {
    return objc_msgSend(objc_msgSend(result, "metadata"), "dictionary");
  }
  return result;
}

- (id)detectRegionsOfInterestForAssetKey:(id)a3
{
  return 0LL;
}

- (CGImage)retainedCGImageForAssetKey:(id)a3 andSize:(CGSize)a4 orientation:(char *)a5
{
  double height = a4.height;
  double width = a4.width;
  id result = (CGImage *)objc_msgSend( objc_msgSend(-[OKWidgetMarimbaView page](self, "page"), "presentation"),  "mediaItemForURL:",  +[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  if (result)
  {
    id v10 = result;
    if (width >= height) {
      double v11 = width;
    }
    else {
      double v11 = height;
    }
    unint64_t v12 = (unint64_t)v11;
    objc_msgSend( -[OKWidgetMarimbaView presentationViewController](self, "presentationViewController"),  "presentationViewScale");
    objc_super v14 = (CGImage *)-[CGImage thumbnailImageForResolution:aspectRatio:scale:quality:colorSpace:]( v10,  "thumbnailImageForResolution:aspectRatio:scale:quality:colorSpace:",  v12,  0LL,  width / height,  v13,  kOKMediaItemQualityGood);
    if (a5) {
      *a5 = 0;
    }
    return CGImageRetain(v14);
  }

  return result;
}

- (CGImage)retainedCGImageForAssetKey:(id)a3 andSize:(CGSize)a4 orientation:(char *)a5 thumbnailIfPossible:(BOOL)a6 now:(BOOL)a7
{
  BOOL v7 = a6;
  double height = a4.height;
  double width = a4.width;
  if (a5) {
    *a5 = 0;
  }
  id result = (CGImage *)objc_msgSend( objc_msgSend(-[OKWidgetMarimbaView page](self, "page"), "presentation"),  "mediaItemForURL:",  +[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  if (result)
  {
    unint64_t v12 = result;
    if (v7)
    {
      unint64_t v13 = kOKMediaItemThumbnailResolutionLow;
      double v14 = kOKMediaItemQualityBest;
      double v15 = width / height;
      double v16 = 1.0;
    }

    else
    {
      if (width >= height) {
        double v17 = width;
      }
      else {
        double v17 = height;
      }
      unint64_t v18 = (unint64_t)v17;
      objc_msgSend( -[OKWidgetMarimbaView presentationViewController](self, "presentationViewController"),  "presentationViewScale");
      double v16 = v19;
      double v14 = kOKMediaItemQualityGood;
      id result = v12;
      unint64_t v13 = v18;
      double v15 = width / height;
    }

    return CGImageRetain((CGImageRef)-[CGImage thumbnailImageForResolution:aspectRatio:scale:quality:colorSpace:]( result,  "thumbnailImageForResolution:aspectRatio:scale:quality:colorSpace:",  v13,  0LL,  v15,  v16,  v14));
  }

  return result;
}

- (id)avAssetForAssetKey:(id)a3
{
  id result = objc_msgSend( objc_msgSend(-[OKWidgetMarimbaView page](self, "page"), "presentation"),  "mediaItemForURL:",  +[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  if (result) {
    return [result avAsset];
  }
  return result;
}

- (id)_mediaPropertiesForMediaURL:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(-[OKWidgetMarimbaView page](self, "page"), "presentation"), "mediaItemForURL:", a3);
  if (!v3) {
    return 0LL;
  }
  double v4 = v3;
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v6 = [v4 metadata];
  [v6 duration];
  if (v7 < 3.0 && v7 > 0.0) {
    double v7 = 3.0;
  }
  id v9 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7);
  [v5 setObject:v9 forKeyedSubscript:kMPMetaDataDuration];
  [v5 setObject:&off_26FB40 forKeyedSubscript:kMPMetaDataStartTime];
  [v5 setObject:v9 forKeyedSubscript:kMPMetaDataStopTime];
  if ([v6 creationDate])
  {
    id v10 = [v6 creationDate];
    [v5 setObject:v10 forKeyedSubscript:kMPMetaDataCreationDate];
  }

  [v6 resolution];
  [v5 setObject:NSStringFromCGSize(v19) forKeyedSubscript:kMPMetaDataResolution];
  else {
    uint64_t v11 = 2LL;
  }
  unint64_t v12 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11);
  [v5 setObject:v12 forKeyedSubscript:kMPMetaDataMediaType];
  if ([v6 name])
  {
    id v13 = [v6 name];
    [v5 setObject:v13 forKeyedSubscript:kMPMetaDataCaption];
  }

  if ([v6 caption])
  {
    id v14 = [v6 caption];
    [v5 setObject:v14 forKeyedSubscript:kMPMetaDataComment];
  }

  [v6 longitude];
  double v15 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  [v5 setObject:v15 forKeyedSubscript:kMPMetaDataLongitude];
  [v6 latitude];
  double v16 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  [v5 setObject:v16 forKeyedSubscript:kMPMetaDataLatitude];
  if ([v6 regionsOfInterest])
  {
    id v17 = [v6 regionsOfInterest];
    [v5 setObject:v17 forKeyedSubscript:kMPMetaDataRegionOfInterestRectangles];
  }

  return v5;
}

- (BOOL)endAllEditing:(BOOL)a3
{
  return 1;
}

- (void)renderer:(id)a3 renderingTimeLogMessage:(id)a4 withTimestamp:(double)a5
{
}

+ (void)setupJavascriptContext:(id)a3
{
  v11[0] = JSPropertyDescriptorValueKey;
  v11[1] = JSPropertyDescriptorWritableKey;
  v12[0] = &stru_258BF0;
  v12[1] = &__kCFBooleanTrue;
  void v11[2] = JSPropertyDescriptorEnumerableKey;
  v11[3] = JSPropertyDescriptorConfigurableKey;
  void v12[2] = &__kCFBooleanFalse;
  v12[3] = &__kCFBooleanTrue;
  objc_msgSend( objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"OKWidgetMarimbaView"),  "objectForKeyedSubscript:",  @"prototype"),  "defineProperty:descriptor:",  @"gotoItem",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4));
  v9[0] = JSPropertyDescriptorValueKey;
  v9[1] = JSPropertyDescriptorWritableKey;
  v10[0] = &stru_258C30;
  v10[1] = &__kCFBooleanTrue;
  void v9[2] = JSPropertyDescriptorEnumerableKey;
  v9[3] = JSPropertyDescriptorConfigurableKey;
  void v10[2] = &__kCFBooleanFalse;
  v10[3] = &__kCFBooleanTrue;
  objc_msgSend( objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"OKWidgetMarimbaView"),  "objectForKeyedSubscript:",  @"prototype"),  "defineProperty:descriptor:",  @"restart",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4));
  v7[0] = JSPropertyDescriptorValueKey;
  v7[1] = JSPropertyDescriptorWritableKey;
  v8[0] = &stru_258C70;
  v8[1] = &__kCFBooleanTrue;
  v7[2] = JSPropertyDescriptorEnumerableKey;
  v7[3] = JSPropertyDescriptorConfigurableKey;
  void v8[2] = &__kCFBooleanFalse;
  v8[3] = &__kCFBooleanTrue;
  objc_msgSend( objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"OKWidgetMarimbaView"),  "objectForKeyedSubscript:",  @"prototype"),  "defineProperty:descriptor:",  @"gotoNext",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4));
  v5[0] = JSPropertyDescriptorValueKey;
  v5[1] = JSPropertyDescriptorWritableKey;
  v6[0] = &stru_258C90;
  v6[1] = &__kCFBooleanTrue;
  v5[2] = JSPropertyDescriptorEnumerableKey;
  v5[3] = JSPropertyDescriptorConfigurableKey;
  v6[2] = &__kCFBooleanFalse;
  v6[3] = &__kCFBooleanTrue;
  objc_msgSend( objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"OKWidgetMarimbaView"),  "objectForKeyedSubscript:",  @"prototype"),  "defineProperty:descriptor:",  @"gotoPrevious",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  4));
}

- (BOOL)isBouncing
{
  return self->_isBouncing;
}

- (void)setIsBouncing:(BOOL)a3
{
  self->_isBouncing = a3;
}

- (BOOL)shouldResumeAtBounceEnd
{
  return self->_shouldResumeAtBounceEnd;
}

- (void)setShouldResumeAtBounceEnd:(BOOL)a3
{
  self->_shouldResumeAtBounceEnd = a3;
}

@end