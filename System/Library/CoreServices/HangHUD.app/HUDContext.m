@interface HUDContext
+ (id)displayNameForHangInfo:(id)a3;
- (BOOL)accessibilityReducesTransparency;
- (BOOL)hangHasPendingAnimation:(id)a3;
- (BOOL)hasHudRenderContextInvalidated;
- (BOOL)isValid;
- (CAContext)hudRenderContext;
- (CAFilter)blurFilter;
- (CAFilter)saturationFilter;
- (CALayer)containerLayer;
- (CALayer)rootLayer;
- (CGSize)layoutHUDLines:(unint64_t)a3 ids:(id)a4;
- (HUDContext)initWithQueue:(id)a3;
- (HUDContext)initWithRenderContext:(id)a3 queue:(id)a4;
- (HUDTheme)currentTheme;
- (NSCache)bundleIdToAppNameCache;
- (NSDictionary)lastKnownHangs;
- (NSMutableDictionary)hudLines;
- (NSMutableSet)hudContentWithPendingAnimations;
- (double)HUD_background_opacity;
- (double)HangHUD_updater_latency_in_ms;
- (double)lastKnownFirstKeyLayerHeight;
- (double)lastKnownMaxKeyLayerWidth;
- (double)minimumValueLayerWidth;
- (double)sidePadding;
- (id)getKeyForLine:(id)a3;
- (void)animationDidStartOnLine:(id)a3;
- (void)animationDidStopOnLine:(id)a3;
- (void)applyThemeColors;
- (void)clearBundleNameCache;
- (void)clearHUDLinesAnimated:(BOOL)a3;
- (void)clearHUDLinesAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)createContainerLayer;
- (void)dealloc;
- (void)determineNewFrameForRootLayer:(CGSize)a3 numberOfLines:(unint64_t)a4;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performHUDUpdate:(id)a3;
- (void)performHUDUpdate:(id)a3 withCompletion:(id)a4;
- (void)recreateContainerLayerIfNecessary;
- (void)reloadThemeColors;
- (void)setAccessibilityReducesTransparency:(BOOL)a3;
- (void)setBlurFilter:(id)a3;
- (void)setBundleIdToAppNameCache:(id)a3;
- (void)setContainerLayer:(id)a3;
- (void)setCurrentTheme:(id)a3;
- (void)setDisplayScaleDependentPropertiesOnLayers;
- (void)setHUD_background_opacity:(double)a3;
- (void)setHangHUD_updater_latency_in_ms:(double)a3;
- (void)setHudContentWithPendingAnimations:(id)a3;
- (void)setHudLines:(id)a3;
- (void)setHudRenderContext:(id)a3;
- (void)setLastKnownFirstKeyLayerHeight:(double)a3;
- (void)setLastKnownHangs:(id)a3;
- (void)setLastKnownMaxKeyLayerWidth:(double)a3;
- (void)setMinimumValueLayerWidth:(double)a3;
- (void)setRenderParametersFromMonitoredStates:(id)a3;
- (void)setRootLayer:(id)a3;
- (void)setSaturationFilter:(id)a3;
- (void)setSidePadding:(double)a3;
- (void)systemAppearanceDidChange;
- (void)updateCornerRadiusAndSidePaddingIfNecessary:(id)a3;
- (void)updateCurrentTheme;
- (void)updateHUD:(id)a3 withCompletion:(id)a4;
- (void)updateHUDLineWithId:(id)a3 content:(id)a4 options:(unint64_t)a5;
- (void)updateHangs:(id)a3 withCompletion:(id)a4;
@end

@implementation HUDContext

+ (id)displayNameForHangInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___HTHangHUDInfo);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    if (qword_100036508 != -1) {
      dispatch_once(&qword_100036508, &stru_100028AC0);
    }
    v5 = (void *)qword_100036510;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleId]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);

    if (v7)
    {
      v8 = v7;
      v9 = (__CFString *)v8;
      goto LABEL_28;
    }

    id v11 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleId]);
    id v35 = 0LL;
    id v13 = [v11 initWithBundleIdentifier:v12 allowPlaceholder:0 error:&v35];
    id v14 = v35;

    if (!v14)
    {
      if ((sub_100014948() & 1) != 0) {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[HUDConfiguration sharedInstance](&OBJC_CLASS___HUDConfiguration, "sharedInstance"));
      }
      else {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      }
      v28 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue([v17 thirdPartyDevPreferredLanguages]);

      if ([v29 count]) {
        uint64_t v30 = objc_claimAutoreleasedReturnValue([v13 localizedNameWithPreferredLocalizations:v29]);
      }
      else {
        uint64_t v30 = objc_claimAutoreleasedReturnValue([v13 localizedName]);
      }
      v31 = (void *)v30;
      v32 = (void *)qword_100036510;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleId]);
      [v32 setObject:v31 forKey:v33];

      v8 = v31;
      v9 = (__CFString *)v8;
      goto LABEL_27;
    }

    NSErrorDomain v15 = (NSErrorDomain)objc_claimAutoreleasedReturnValue([v14 domain]);
    NSErrorDomain v16 = v15;
    if (v15 == NSOSStatusErrorDomain)
    {
      id v18 = [v14 code];

      if (v18 == (id)-10814LL)
      {
        id v19 = sub_1000031C4();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleId]);
          *(_DWORD *)buf = 138412290;
          v37 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "There is no LS application record for bundle id %@",  buf,  0xCu);
        }

        v22 = (void *)qword_100036510;
        v23 = (void *)objc_claimAutoreleasedReturnValue([v3 shortenedBundle]);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleId]);
        [v22 setObject:v23 forKey:v24];

        goto LABEL_21;
      }
    }

    else
    {
    }

    id v25 = sub_1000031C4();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleId]);
      *(_DWORD *)buf = 138412546;
      v37 = v27;
      __int16 v38 = 2112;
      id v39 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Unable to create an LS application record from bundle id %@: %@",  buf,  0x16u);
    }

LABEL_21:
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 shortenedBundle]);
    v8 = 0LL;
LABEL_27:

    goto LABEL_28;
  }

  id v10 = sub_1000031C4();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "This function should be called for HTHangHUDInfo only.",  buf,  2u);
  }

  v9 = &stru_100029C00;
LABEL_28:

  return v9;
}

- (HUDContext)initWithQueue:(id)a3
{
  v13[0] = &__kCFBooleanTrue;
  v12[0] = kCAContextDisplayable;
  v12[1] = kCAContextDisplayId;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 displayId]));
  v12[2] = kCAContextIgnoresHitTest;
  v13[1] = v6;
  v13[2] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAContext remoteContextWithOptions:](&OBJC_CLASS___CAContext, "remoteContextWithOptions:", v7));

  LODWORD(v9) = 1343554297;
  [v8 setLevel:v9];
  [v8 setSecure:1];
  -[HUDContext setHangHUD_updater_latency_in_ms:](self, "setHangHUD_updater_latency_in_ms:", 0.0);
  -[HUDContext setHUD_background_opacity:](self, "setHUD_background_opacity:", 1.0);
  self->_hud_clear_lock._os_unfair_lock_opaque = 0;
  id v10 = -[HUDContext initWithRenderContext:queue:](self, "initWithRenderContext:queue:", v8, v4);

  return v10;
}

- (void)setRenderParametersFromMonitoredStates:(id)a3
{
  unsigned int v4 = [a3 isImmersionLevelControllerPresentOnScreen];
  double v5 = 0.95;
  if (!v4) {
    double v5 = 1.0;
  }
  -[HUDContext setHUD_background_opacity:](self, "setHUD_background_opacity:", v5);
  id v6 = sub_10000A4EC();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10001604C(self, v7);
  }
}

- (HUDContext)initWithRenderContext:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___HUDContext;
  double v9 = -[HUDContext init](&v39, "init");
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v10 addObserver:v9 selector:"systemAppearanceDidChange" name:PBSSystemAppearanceDidChangeNotification object:0];

    -[HUDContext updateCurrentTheme](v9, "updateCurrentTheme");
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    hudLines = v9->_hudLines;
    v9->_hudLines = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v9->_hudRenderContext, a3);
    objc_storeStrong((id *)&v9->_queue, a4);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    rootLayer = v9->_rootLayer;
    v9->_rootLayer = (CALayer *)v13;

    -[CALayer setName:](v9->_rootLayer, "setName:", @"hangtracerd HUD root layer");
    v9->_accessibilityReducesTransparency = sub_100014A14() ^ 1;
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterGaussianBlur));
    blurFilter = v9->_blurFilter;
    v9->_blurFilter = (CAFilter *)v15;

    -[CAFilter setCachesInputImage:](v9->_blurFilter, "setCachesInputImage:", 0LL);
    -[CAFilter setValue:forKey:](v9->_blurFilter, "setValue:forKey:", @"low", kCAFilterInputQuality);
    -[CAFilter setValue:forKey:](v9->_blurFilter, "setValue:forKey:", &__kCFBooleanTrue, kCAFilterInputDither);
    -[CAFilter setValue:forKey:](v9->_blurFilter, "setValue:forKey:", &__kCFBooleanTrue, kCAFilterInputNormalizeEdges);
    -[CAFilter setValue:forKey:](v9->_blurFilter, "setValue:forKey:", &__kCFBooleanTrue, kCAFilterInputHardEdges);
    -[CAFilter setValue:forKey:](v9->_blurFilter, "setValue:forKey:", &off_10002D470, kCAFilterInputRadius);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterColorSaturate));
    saturationFilter = v9->_saturationFilter;
    v9->_saturationFilter = (CAFilter *)v17;

    -[CAFilter setCachesInputImage:](v9->_saturationFilter, "setCachesInputImage:", 0LL);
    -[CAFilter setValue:forKey:](v9->_saturationFilter, "setValue:forKey:", &off_10002D500, kCAFilterInputAmount);
    -[HUDContext createContainerLayer](v9, "createContainerLayer");
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext rootLayer](v9, "rootLayer"));
    -[CAContext setLayer:](v9->_hudRenderContext, "setLayer:", v19);

    lastKnownHangs = v9->_lastKnownHangs;
    v9->_lastKnownHangs = (NSDictionary *)&__NSDictionary0__struct;

    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    hudContentWithPendingAnimations = v9->_hudContentWithPendingAnimations;
    v9->_hudContentWithPendingAnimations = (NSMutableSet *)v21;

    v9->_sidePadding = 0.0;
    v9->_lastKnownFirstKeyLayerHeight = 0.0;
    LOBYTE(v34) = 0;
    v23 = -[HTHangHUDInfo initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:]( objc_alloc(&OBJC_CLASS___HTHangHUDInfo),  "initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:",  0LL,  0LL,  0LL,  &stru_100029C00,  &stru_100029C00,  @"com.apple.HangHUD",  10000.0,  v34);
    v24 = objc_alloc(&OBJC_CLASS___HangHUDLine);
    queue = v9->_queue;
    currentTheme = v9->_currentTheme;
    sub_100013ED0();
    v27 = -[HangHUDLine initWithQueue:processName:theme:fontSize:lineDelegate:]( v24,  "initWithQueue:processName:theme:fontSize:lineDelegate:",  queue,  &stru_100029C00,  currentTheme,  0LL);
    -[HangHUDLine update:options:](v27, "update:options:", v23, 0LL);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100007130;
    v35[3] = &unk_100028AE8;
    v28 = v9;
    v36 = v28;
    v37 = v23;
    __int16 v38 = v27;
    v29 = v27;
    uint64_t v30 = v23;
    -[HUDContext performHUDUpdate:](v28, "performHUDUpdate:", v35);
    -[HUDContext clearHUDLinesAnimated:](v28, "clearHUDLinesAnimated:", 0LL);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    [v31 addObserver:v28 forKeyPath:@"currentOrientation" options:3 context:0];

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    [v32 addObserver:v28 forKeyPath:@"bounds" options:3 context:0];
  }

  return v9;
}

- (void)createContainerLayer
{
  id v3 = (id *)&OBJC_CLASS___CABackdropLayer_ptr;
  if (self->_accessibilityReducesTransparency) {
    id v3 = (id *)&OBJC_CLASS___CALayer_ptr;
  }
  unsigned int v4 = (CALayer *)objc_claimAutoreleasedReturnValue([*v3 layer]);
  containerLayer = self->_containerLayer;
  self->_containerLayer = v4;

  -[CALayer setName:](self->_containerLayer, "setName:", @"hangtracerd HUD container layer");
  -[CALayer setHidden:](self->_containerLayer, "setHidden:", 1LL);
  LODWORD(v6) = 1036831949;
  -[CALayer setShadowOpacity:](self->_containerLayer, "setShadowOpacity:", v6);
  -[CALayer setShadowPathIsBounds:](self->_containerLayer, "setShadowPathIsBounds:", 1LL);
  -[CALayer setAllowsGroupOpacity:](self->_containerLayer, "setAllowsGroupOpacity:", 1LL);
  -[HUDContext setDisplayScaleDependentPropertiesOnLayers](self, "setDisplayScaleDependentPropertiesOnLayers");
  if (!self->_accessibilityReducesTransparency)
  {
    id v7 = self->_containerLayer;
    saturationFilter = self->_saturationFilter;
    v12[0] = self->_blurFilter;
    v12[1] = saturationFilter;
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
    -[CALayer setFilters:](v7, "setFilters:", v9);

    -[CALayer setReducesCaptureBitDepth:](self->_containerLayer, "setReducesCaptureBitDepth:", 1LL);
    -[CALayer setScale:](self->_containerLayer, "setScale:", 0.0625);
    LODWORD(v10) = 1045220557;
    -[CALayer setShadowOpacity:](self->_containerLayer, "setShadowOpacity:", v10);
    SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 0.1);
    -[CALayer setBorderColor:](self->_containerLayer, "setBorderColor:", SRGB);
    CGColorRelease(SRGB);
  }

  -[CALayer addSublayer:](self->_rootLayer, "addSublayer:", self->_containerLayer);
  -[HUDContext reloadThemeColors](self, "reloadThemeColors");
}

- (void)recreateContainerLayerIfNecessary
{
  int v3 = sub_100014A14() ^ 1;
  if (self->_accessibilityReducesTransparency != v3)
  {
    self->_accessibilityReducesTransparency = v3;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000073D4;
    v4[3] = &unk_1000286E0;
    v4[4] = self;
    -[HUDContext performHUDUpdate:](self, "performHUDUpdate:", v4);
  }

- (void)invalidate
{
  id v3 = sub_1000031C4();
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudRenderContext](self, "hudRenderContext"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 debugDescription]);
    int v9 = 138412290;
    double v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Invalidating current HUD Context. Debug description: %@",  (uint8_t *)&v9,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
  [v7 removeFromSuperlayer];

  -[HUDContext setContainerLayer:](self, "setContainerLayer:", 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudRenderContext](self, "hudRenderContext"));
  [v8 invalidate];

  -[HUDContext setHudRenderContext:](self, "setHudRenderContext:", 0LL);
  sub_1000144D8();
}

- (BOOL)hasHudRenderContextInvalidated
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudRenderContext](self, "hudRenderContext"));
  BOOL v3 = v2 == 0LL;

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 isEqualToString:@"currentOrientation"])
  {
    queue = (dispatch_queue_s *)self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000076B4;
    v15[3] = &unk_1000287C8;
    uint64_t v11 = (id *)v16;
    v16[0] = v9;
    v16[1] = self;
    v12 = v15;
LABEL_5:
    dispatch_async(queue, v12);

    goto LABEL_6;
  }

  if ([v8 isEqualToString:@"bounds"])
  {
    queue = (dispatch_queue_s *)self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000787C;
    void v13[3] = &unk_1000287C8;
    uint64_t v11 = (id *)v14;
    v14[0] = v9;
    v14[1] = self;
    v12 = v13;
    goto LABEL_5;
  }

- (void)dealloc
{
  id v3 = sub_1000031C4();
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000160D4(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  [v12 removeObserver:self forKeyPath:@"currentOrientation"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  [v13 removeObserver:self forKeyPath:@"bounds"];

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___HUDContext;
  -[HUDContext dealloc](&v14, "dealloc");
}

- (void)performHUDUpdate:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  unsigned int v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2(queue);
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  v4[2](v4);

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  +[CATransaction flush](&OBJC_CLASS___CATransaction, "flush");
}

- (void)performHUDUpdate:(id)a3 withCompletion:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  id v6 = a4;
  uint64_t v7 = (void (**)(void))a3;
  dispatch_assert_queue_V2(queue);
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction addCommitHandler:forPhase:](&OBJC_CLASS___CATransaction, "addCommitHandler:forPhase:", v6, 2LL);

  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  v7[2](v7);

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  +[CATransaction flush](&OBJC_CLASS___CATransaction, "flush");
}

- (void)setDisplayScaleDependentPropertiesOnLayers
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100007D54;
  v2[3] = &unk_1000286E0;
  v2[4] = self;
  -[HUDContext performHUDUpdate:](self, "performHUDUpdate:", v2);
}

- (void)clearHUDLinesAnimated:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = sub_1000031C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = [v9 count];
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[HUDContext clearHUDLinesAnimated:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Clearing %lu HUD lines @ %s", buf, 0x16u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
  BOOL v11 = [v10 count] == 0;

  if (v11)
  {
    id v14 = sub_1000031C4();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  " Invalid HUD line clear request found. The number of HUD lines is 0.",  buf,  2u);
    }
  }

  else
  {
    -[HUDContext setLastKnownMaxKeyLayerWidth:](self, "setLastKnownMaxKeyLayerWidth:", 0.0);
    +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
    if (v6) {
      +[CATransaction addCommitHandler:forPhase:](&OBJC_CLASS___CATransaction, "addCommitHandler:forPhase:", v6, 2LL);
    }
    if (a3)
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3042000000LL;
      v24 = sub_10000821C;
      id v25 = sub_100008228;
      objc_initWeak(v26, self);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100008230;
      v22[3] = &unk_100028B70;
      v22[4] = self;
      v22[5] = buf;
      +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"opacity"));
      [v12 setRemovedOnCompletion:0];
      [v12 setFillMode:kCAFillModeForwards];
      [v12 setToValue:&off_10002D488];
      [v12 setDuration:0.2];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
      [v13 addAnimation:v12 forKey:0];

      _Block_object_dispose(buf, 8);
      objc_destroyWeak(v26);
    }

    else
    {
      +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
      NSErrorDomain v16 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
      [v16 enumerateKeysAndObjectsUsingBlock:&stru_100028B28];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
      [v17 removeAllObjects];

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
      objc_msgSend( v18,  "setFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
      LODWORD(v20) = 0;
      [v19 setOpacity:v20];

      -[HUDContext recreateContainerLayerIfNecessary](self, "recreateContainerLayerIfNecessary");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext rootLayer](self, "rootLayer"));
      [v21 setHidden:1];
    }

    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    +[CATransaction flush](&OBJC_CLASS___CATransaction, "flush");
  }
}

- (void)clearHUDLinesAnimated:(BOOL)a3
{
}

- (void)updateHangs:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[HUDContext setLastKnownHangs:](self, "setLastKnownHangs:", v6);
  id v8 = sub_1000031C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v24 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating HUD with %lu hangs", buf, 0xCu);
  }

  id v10 = sub_100014660(v6, 5u);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [v11 count];
  if ([v6 count] && v12)
  {
    uint64_t v13 = mach_absolute_time();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100008624;
    v18[3] = &unk_100028BC0;
    v18[4] = self;
    id v19 = v6;
    id v20 = v11;
    id v21 = v12;
    uint64_t v22 = v13;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    void v16[2] = sub_100008A14;
    v16[3] = &unk_100028BE8;
    id v17 = v7;
    -[HUDContext performHUDUpdate:withCompletion:](self, "performHUDUpdate:withCompletion:", v18, v16);
  }

  else
  {
    id v14 = sub_1000031C4();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Passed 0 hangs, removing the HUD from screen",  buf,  2u);
    }

    -[HUDContext clearHUDLinesAnimated:](self, "clearHUDLinesAnimated:", 1LL);
  }
}

- (void)updateHUD:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = sub_10001476C(v8, 5u);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 count];
  if ([v8 count] && v11)
  {
    uint64_t v12 = mach_absolute_time();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100008BC4;
    v18[3] = &unk_100028BC0;
    v18[4] = self;
    id v19 = v8;
    id v20 = v10;
    id v21 = v11;
    uint64_t v22 = v12;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    void v16[2] = sub_100009054;
    v16[3] = &unk_100028BE8;
    id v17 = v7;
    -[HUDContext performHUDUpdate:withCompletion:](self, "performHUDUpdate:withCompletion:", v18, v16);
  }

  else
  {
    id v13 = sub_1000031C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Passed 0 HUD content, removing the HUD from screen",  buf,  2u);
    }

    -[HUDContext clearHUDLinesAnimated:withCompletion:](self, "clearHUDLinesAnimated:withCompletion:", 1LL, v7);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[HangDataStreamStatusTracker sharedInstance]( &OBJC_CLASS___HangDataStreamStatusTracker,  "sharedInstance"));
    [v15 initializeStatus];
  }
}

- (void)determineNewFrameForRootLayer:(CGSize)a3 numberOfLines:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  double y = sub_100013F14();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentOrientation]);

  id v10 = (void *)kCADisplayOrientationRotation0;
  id v11 = (void *)kCADisplayOrientationRotation180;
  if (v9 != (void *)kCADisplayOrientationRotation0 && v9 != (void *)kCADisplayOrientationRotation180)
  {
    double v15 = height + sub_1000141B8();
    double v16 = width + self->_sidePadding * 2.0;
    double v17 = (sub_100014284() - v16) * 0.5;
    if (v9 == (void *)kCADisplayOrientationRotation270)
    {
      double x = sub_100013D78() - v15 - y;
      CGAffineTransformMakeRotation(&v29, 1.57079633);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
      CGAffineTransform v28 = v29;
      [v18 setAffineTransform:&v28];
    }

    else
    {
      CGAffineTransformMakeRotation(&v27, -1.57079633);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
      CGAffineTransform v26 = v27;
      [v18 setAffineTransform:&v26];
      double x = y;
    }

    double y = v17;
    goto LABEL_16;
  }

  double v15 = width + self->_sidePadding * 2.0;
  double v16 = height + sub_1000141B8();
  double v13 = sub_100013D78();
  if (v9 == v10)
  {
    double x = (v13 - v15) * 0.5;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
    id v18 = v19;
    __int128 v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v32[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v32[1] = v20;
    v32[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    id v21 = (CGAffineTransform *)v32;
LABEL_15:
    [v19 setAffineTransform:v21];
LABEL_16:

    goto LABEL_17;
  }

  if (v9 == v11)
  {
    double x = (v13 - v15) * 0.5;
    double y = sub_100014284() - y - v16;
    CGAffineTransformMakeRotation(&v31, 3.14159265);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
    id v18 = v19;
    CGAffineTransform v30 = v31;
    id v21 = &v30;
    goto LABEL_15;
  }

  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
LABEL_17:
  CATransform3DMakeTranslation(&v25, x, y, 0.0);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext rootLayer](self, "rootLayer"));
  CATransform3D v24 = v25;
  [v22 setSublayerTransform:&v24];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
  objc_msgSend(v23, "setFrame:", 0.0, 0.0, v15, v16);
}

- (void)updateHUDLineWithId:(id)a3 content:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v8]);

  if (!v11)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___HTHangHUDInfo);
    if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(+[HUDContext displayNameForHangInfo:](&OBJC_CLASS___HUDContext, "displayNameForHangInfo:", v9));
      id v14 = objc_alloc(&OBJC_CLASS___HangHUDLine);
      queue = self->_queue;
      currentTheme = self->_currentTheme;
      sub_100013ED0();
      double v17 = -[HangHUDLine initWithQueue:processName:theme:fontSize:lineDelegate:]( v14,  "initWithQueue:processName:theme:fontSize:lineDelegate:",  queue,  v13,  currentTheme,  self);
      id v18 = sub_10000A4EC();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138412802;
        id v28 = v13;
        __int16 v29 = 2048;
        id v30 = [v9 hangStartTime];
        __int16 v31 = 2112;
        id v32 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "A new HUD line is created for %@ with HANG start timestamp of %llu in mach absolute time. contentId:%@",  (uint8_t *)&v27,  0x20u);
      }
    }

    else
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___HTProcessLaunchExitRecord);
      if ((objc_opt_isKindOfClass(v9, v20) & 1) == 0) {
        goto LABEL_10;
      }
      id v13 = v9;
      double v17 = -[ProcExitHUDLine initWithProcExitRecord:theme:lineDelegate:]( objc_alloc(&OBJC_CLASS___ProcExitHUDLine),  "initWithProcExitRecord:theme:lineDelegate:",  v13,  self->_currentTheme,  self);
      id v21 = sub_10000A4EC();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v13 processName]);
        int v27 = 138412546;
        id v28 = v22;
        __int16 v29 = 2048;
        id v30 = [v13 exitTimestamp];
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "A new HUD line is created for %@ with EXIT timestamp of %llu in mach absolute time.",  (uint8_t *)&v27,  0x16u);
      }
    }

    if (v17)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
      [v23 setObject:v17 forKeyedSubscript:v8];

      CATransform3D v24 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
      [v24 addSublayer:v17];
    }
  }

- (CGSize)layoutHUDLines:(unint64_t)a3 ids:(id)a4
{
  id v6 = a4;
  uint64_t v36 = 0LL;
  v37 = (double *)&v36;
  uint64_t v38 = 0x2020000000LL;
  -[HUDContext lastKnownMaxKeyLayerWidth](self, "lastKnownMaxKeyLayerWidth");
  uint64_t v39 = v7;
  uint64_t v32 = 0LL;
  v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000LL;
  -[HUDContext minimumValueLayerWidth](self, "minimumValueLayerWidth");
  uint64_t v35 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000098BC;
  v31[3] = &unk_100028C10;
  v31[4] = &v36;
  v31[5] = &v32;
  [v9 enumerateKeysAndObjectsUsingBlock:v31];

  -[HUDContext setLastKnownMaxKeyLayerWidth:](self, "setLastKnownMaxKeyLayerWidth:", v37[3]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext rootLayer](self, "rootLayer"));
  id v11 = [v10 isHidden];

  if ((_DWORD)v11) {
    self->_double sidePadding = 0.0;
  }
  if (a3)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  -[HUDContext updateCornerRadiusAndSidePaddingIfNecessary:](self, "updateCornerRadiusAndSidePaddingIfNecessary:", v12);
  if (a3)
  {
  }

  double v13 = v37[3];
  double v14 = sub_100014378();
  double v15 = v33[3];
  sub_100014328();
  double v17 = v16;
  double sidePadding = self->_sidePadding;
  double v19 = sub_1000141B8();
  double v20 = fmin(v13 + v14 + v15, v17 + sidePadding * -2.0);
  if (a3)
  {
    unint64_t v21 = 0LL;
    do
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v21]);
      CATransform3D v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v23]);

      [v24 setPreferredKeyLayerWidth:v37[3]];
      [v24 setPreferredValueLayerWidth:v33[3]];
      double v25 = self->_sidePadding;
      CGAffineTransform v26 = (void *)objc_claimAutoreleasedReturnValue([v24 keyLayer]);
      [v26 preferredFrameSize];
      objc_msgSend(v24, "setFrame:", v25, v19, v20, v27);

      [v24 frame];
      if (v21 >= a3 - 1) {
        double v19 = v19 + v28;
      }
      else {
        double v19 = v19 + v28 + 5.0;
      }

      ++v21;
    }

    while (a3 != v21);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  double v29 = v20;
  double v30 = v19;
  result.double height = v30;
  result.double width = v29;
  return result;
}

- (void)updateCornerRadiusAndSidePaddingIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_sidePadding == 0.0)
  {
    if (v4)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 keyLayer]);
      [v6 preferredFrameSize];
      double lastKnownFirstKeyLayerHeight = v7;

      self->_double lastKnownFirstKeyLayerHeight = lastKnownFirstKeyLayerHeight;
    }

    else
    {
      double lastKnownFirstKeyLayerHeight = self->_lastKnownFirstKeyLayerHeight;
    }

    double v9 = sub_1000141B8();
    -[CALayer setCornerRadius:](self->_containerLayer, "setCornerRadius:", v9 + lastKnownFirstKeyLayerHeight * 0.5);
    self->_double sidePadding = v9 + lastKnownFirstKeyLayerHeight * 0.5;
    id v10 = sub_1000031C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218496;
      double v13 = v9 + lastKnownFirstKeyLayerHeight * 0.5;
      __int16 v14 = 2048;
      double v15 = v9;
      __int16 v16 = 2048;
      double v17 = lastKnownFirstKeyLayerHeight;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "HangTracer HUD changed corner radius to %lf for padding %lf & line height %lf",  (uint8_t *)&v12,  0x20u);
    }
  }
}

- (void)updateCurrentTheme
{
  id v3 = (HUDTheme *)objc_claimAutoreleasedReturnValue(+[HUDTheme darkModeTheme](&OBJC_CLASS___HUDTheme, "darkModeTheme"));
  currentTheme = self->_currentTheme;
  self->_currentTheme = v3;

  objc_initWeak(&location, self);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100009BE8;
  v6[3] = &unk_100028C38;
  objc_copyWeak(&v7, &location);
  [v5 systemAppearanceWithReply:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)systemAppearanceDidChange
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100009D44;
  v4[3] = &unk_100028C60;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reloadThemeColors
{
}

- (void)applyThemeColors
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100009DE4;
  v2[3] = &unk_1000286E0;
  v2[4] = self;
  -[HUDContext performHUDUpdate:](self, "performHUDUpdate:", v2);
}

- (BOOL)isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudRenderContext](self, "hudRenderContext"));
  unsigned __int8 v3 = [v2 valid];

  return v3;
}

- (id)getKeyForLine:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeysForObject:v4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  if (!v7)
  {
    id v8 = sub_1000031C4();
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      uint64_t v12 = 0LL;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "A key %@ was not found for line %@, this should not happen!",  (uint8_t *)&v11,  0x16u);
    }
  }

  return v7;
}

- (BOOL)hangHasPendingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudContentWithPendingAnimations](self, "hudContentWithPendingAnimations"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)animationDidStopOnLine:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000A160;
  v7[3] = &unk_1000287C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)animationDidStartOnLine:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000A264;
  v7[3] = &unk_1000287C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)clearBundleNameCache
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[HUDContext bundleIdToAppNameCache](self, "bundleIdToAppNameCache"));
  [v2 removeAllObjects];
}

- (HUDTheme)currentTheme
{
  return self->_currentTheme;
}

- (void)setCurrentTheme:(id)a3
{
}

- (CAContext)hudRenderContext
{
  return self->_hudRenderContext;
}

- (void)setHudRenderContext:(id)a3
{
}

- (NSMutableDictionary)hudLines
{
  return self->_hudLines;
}

- (void)setHudLines:(id)a3
{
}

- (NSCache)bundleIdToAppNameCache
{
  return self->_bundleIdToAppNameCache;
}

- (void)setBundleIdToAppNameCache:(id)a3
{
}

- (double)sidePadding
{
  return self->_sidePadding;
}

- (void)setSidePadding:(double)a3
{
  self->_double sidePadding = a3;
}

- (double)minimumValueLayerWidth
{
  return self->_minimumValueLayerWidth;
}

- (void)setMinimumValueLayerWidth:(double)a3
{
  self->_minimumValueLayerWidth = a3;
}

- (double)lastKnownMaxKeyLayerWidth
{
  return self->_lastKnownMaxKeyLayerWidth;
}

- (void)setLastKnownMaxKeyLayerWidth:(double)a3
{
  self->_lastKnownMaxKeyLayerWidth = a3;
}

- (double)lastKnownFirstKeyLayerHeight
{
  return self->_lastKnownFirstKeyLayerHeight;
}

- (void)setLastKnownFirstKeyLayerHeight:(double)a3
{
  self->_double lastKnownFirstKeyLayerHeight = a3;
}

- (NSDictionary)lastKnownHangs
{
  return self->_lastKnownHangs;
}

- (void)setLastKnownHangs:(id)a3
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
}

- (CALayer)containerLayer
{
  return self->_containerLayer;
}

- (void)setContainerLayer:(id)a3
{
}

- (BOOL)accessibilityReducesTransparency
{
  return self->_accessibilityReducesTransparency;
}

- (void)setAccessibilityReducesTransparency:(BOOL)a3
{
  self->_accessibilityReducesTransparencdouble y = a3;
}

- (CAFilter)blurFilter
{
  return self->_blurFilter;
}

- (void)setBlurFilter:(id)a3
{
}

- (CAFilter)saturationFilter
{
  return self->_saturationFilter;
}

- (void)setSaturationFilter:(id)a3
{
}

- (NSMutableSet)hudContentWithPendingAnimations
{
  return self->_hudContentWithPendingAnimations;
}

- (void)setHudContentWithPendingAnimations:(id)a3
{
}

- (double)HangHUD_updater_latency_in_ms
{
  return self->_HangHUD_updater_latency_in_ms;
}

- (void)setHangHUD_updater_latency_in_ms:(double)a3
{
  self->_HangHUD_updater_latency_in_ms = a3;
}

- (double)HUD_background_opacity
{
  return self->_HUD_background_opacity;
}

- (void)setHUD_background_opacity:(double)a3
{
  self->_HUD_background_opacitdouble y = a3;
}

- (void).cxx_destruct
{
}

@end