@interface VOTUIServer
+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3;
- (BOOL)shouldPreventAutorotatingAllContentViewControllers;
- (CGRect)_handleConvertFrameMessage:(id)a3;
- (Legacy_VOTUIItemChooserController)itemChooserController;
- (NSMutableArray)externalWindowScenes;
- (NSMutableDictionary)captionPanelViewControllers;
- (NSMutableDictionary)cursorViewControllers;
- (NSMutableDictionary)rotorViewControllers;
- (NSMutableDictionary)screenCurtainViewControllers;
- (NSString)voiceOverWarningIdentifier;
- (VOTEnabledBannerViewController)voiceOverEnabledBannerViewController;
- (VOTUIBrailleViewController)brailleViewController;
- (VOTUIElementVisualizationViewController)elementVisualizationViewController;
- (VOTUIMapsExplorationViewController)mapsExplorationViewController;
- (VOTUIServer)init;
- (VOTUISonificationViewController)sonificationViewController;
- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4;
- (id)_handleConvertFramesMessage:(id)a3;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)_addBrailleViewControllerWithOrientation:(int64_t)a3 dotNumberPositions:(id)a4 typingMode:(int64_t)a5;
- (void)_addMapsExplorationViewController;
- (void)_handleBeginSonificationPlayback:(id)a3;
- (void)_handleDisplayUIServerBasedItemChooser:(id)a3;
- (void)_handleFlashBrailleInsertedTextMessage:(id)a3;
- (void)_handleHideVoiceOverWarning:(id)a3;
- (void)_handleHighlightBrailleDotsMessage:(id)a3;
- (void)_handleHighlightMapsExplorationSegmentMessage:(id)a3;
- (void)_handlePauseSonificationPlayback:(id)a3;
- (void)_handleScreenCurtainEnabled:(BOOL)a3;
- (void)_handleSendFocusChangeToZoom:(id)a3;
- (void)_handleSetCursorFrameMessage:(id)a3;
- (void)_handleSetElementVisualizationFramesMessage:(id)a3;
- (void)_handleSetSonificationPlayheadPosition:(id)a3;
- (void)_handleShowBrailleUIMessage:(id)a3;
- (void)_handleShowMapsExplorationUIMessage:(id)a3;
- (void)_handleShowVoiceOverWarning:(id)a3;
- (void)_handleUpdateBrailleUIMessage:(id)a3;
- (void)_handleUpdateMapsExplorationCurrentCenter:(id)a3;
- (void)_handleUpdateMapsExplorationUIWithCurrentLocationMessage:(id)a3;
- (void)_handleUpdateVisualRotor:(id)a3;
- (void)_handleVoiceOverCaptionPanelEnabled:(id)a3;
- (void)_handleZoomFocusChangeNotification:(id)a3;
- (void)_removeBrailleViewController;
- (void)_removeCaptionPanelViewControllers;
- (void)_removeCursorViewControllers;
- (void)_removeElementVisualizationViewController;
- (void)_removeItemChooserController;
- (void)_removeMapsExplorationViewController;
- (void)_removeRotorViewControllers;
- (void)_removeScreenCurtainControllers;
- (void)_removeSonificationViewController;
- (void)_removeVOTEnabledBannerViewController;
- (void)_toggleVoiceOverCaptionPanelViewController;
- (void)_updateCursorWithFrame:(CGRect)a3 pathData:(id)a4 animate:(BOOL)a5 displayID:(id)a6;
- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3;
- (void)dealloc;
- (void)externalDisplaySceneConnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)externalDisplaySceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)setBrailleViewController:(id)a3;
- (void)setCaptionPanelViewControllers:(id)a3;
- (void)setCursorViewControllers:(id)a3;
- (void)setElementVisualizationViewController:(id)a3;
- (void)setExternalWindowScenes:(id)a3;
- (void)setItemChooserController:(id)a3;
- (void)setMapsExplorationViewController:(id)a3;
- (void)setRotorViewControllers:(id)a3;
- (void)setScreenCurtainViewControllers:(id)a3;
- (void)setSonificationViewController:(id)a3;
- (void)setVoiceOverEnabledBannerViewController:(id)a3;
- (void)setVoiceOverWarningIdentifier:(id)a3;
@end

@implementation VOTUIServer

- (VOTUIServer)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___VOTUIServer;
  v2 = -[VOTUIServer init](&v17, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_8454;
    v14[3] = &unk_247A8;
    objc_copyWeak(&v15, &location);
    id v4 = objc_loadWeakRetained(&location);
    [v3 registerUpdateBlock:v14 forRetrieveSelector:"enableVoiceOverCaptions" withListener:v4];

    objc_destroyWeak(&v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"_voiceOverStatusChanged" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];
    [v5 addObserver:v2 selector:"_handleZoomFocusChangeNotification:" name:UIAXZoomFocusChangedNotification object:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_8480;
    block[3] = &unk_247D0;
    v6 = v2;
    v13 = v6;
    dispatch_async(&_dispatch_main_q, block);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[VOTUIServer setExternalWindowScenes:](v6, "setExternalWindowScenes:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[VOTUIServer setCursorViewControllers:](v6, "setCursorViewControllers:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[VOTUIServer setCaptionPanelViewControllers:](v6, "setCaptionPanelViewControllers:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[VOTUIServer setRotorViewControllers:](v6, "setRotorViewControllers:", v10);

    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];
  -[VOTUIServer _removeCaptionPanelViewControllers](self, "_removeCaptionPanelViewControllers");
  -[VOTUIServer _removeElementVisualizationViewController](self, "_removeElementVisualizationViewController");
  -[VOTUIServer _removeScreenCurtainControllers](self, "_removeScreenCurtainControllers");
  -[VOTUIServer _removeSonificationViewController](self, "_removeSonificationViewController");
  -[VOTUIServer _removeVOTEnabledBannerViewController](self, "_removeVOTEnabledBannerViewController");

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTUIServer;
  -[VOTUIServer dealloc](&v4, "dealloc");
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  switch(a4)
  {
    case 1uLL:
      -[VOTUIServer _handleSetCursorFrameMessage:](self, "_handleSetCursorFrameMessage:", v9);
      goto LABEL_36;
    case 2uLL:
      -[VOTUIServer _handleShowBrailleUIMessage:](self, "_handleShowBrailleUIMessage:", v9);
      goto LABEL_36;
    case 3uLL:
      -[VOTUIServer _handleHideBrailleUIMessage:](self, "_handleHideBrailleUIMessage:", v9);
      goto LABEL_36;
    case 4uLL:
      -[VOTUIServer _handleHighlightBrailleDotsMessage:](self, "_handleHighlightBrailleDotsMessage:", v9);
      goto LABEL_36;
    case 5uLL:
      -[VOTUIServer _handleUpdateBrailleUIMessage:](self, "_handleUpdateBrailleUIMessage:", v9);
      goto LABEL_36;
    case 6uLL:
      -[VOTUIServer _handleFlashBrailleInsertedTextMessage:](self, "_handleFlashBrailleInsertedTextMessage:", v9);
      goto LABEL_36;
    case 7uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"enabled"]);
      -[VOTUIServer _handleScreenCurtainEnabled:](self, "_handleScreenCurtainEnabled:", [v11 BOOLValue]);
      goto LABEL_32;
    case 8uLL:
      -[VOTUIServer _handleVoiceOverCaptionPanelEnabled:](self, "_handleVoiceOverCaptionPanelEnabled:", v9);
      goto LABEL_36;
    case 9uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:&off_25A98]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 window]);
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v15 _contextId]));

      v31 = @"contextId";
      v32 = v11;
      v16 = &v32;
      objc_super v17 = &v31;
      goto LABEL_21;
    case 0xAuLL:
      -[VOTUIServer _handleSetElementVisualizationFramesMessage:]( self,  "_handleSetElementVisualizationFramesMessage:",  v9);
      goto LABEL_36;
    case 0xBuLL:
      -[VOTUIServer _handleUpdateVisualRotor:](self, "_handleUpdateVisualRotor:", v9);
      goto LABEL_36;
    case 0xCuLL:
      -[VOTUIServer _handleDisplayUIServerBasedItemChooser:](self, "_handleDisplayUIServerBasedItemChooser:", v9);
      goto LABEL_36;
    case 0xDuLL:
      -[VOTUIServer _handleConvertFrameMessage:](self, "_handleConvertFrameMessage:", v9);
      CGFloat x = v33.origin.x;
      CGFloat y = v33.origin.y;
      CGFloat width = v33.size.width;
      CGFloat height = v33.size.height;
      if (CGRectIsNull(v33)) {
        goto LABEL_36;
      }
      v29 = @"convertedFrame";
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.CGFloat width = width;
      v34.size.CGFloat height = height;
      v22 = NSStringFromRect(v34);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v30 = v11;
      v16 = &v30;
      objc_super v17 = &v29;
      goto LABEL_21;
    case 0xEuLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer _handleConvertFramesMessage:](self, "_handleConvertFramesMessage:", v9));
      if (![v11 count]) {
        goto LABEL_32;
      }
      v27 = @"convertedFramesStrings";
      v28 = v11;
      v16 = &v28;
      objc_super v17 = &v27;
LABEL_21:
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v17,  1LL));

      goto LABEL_37;
    case 0xFuLL:
      -[VOTUIServer _handleShowMapsExplorationUIMessage:](self, "_handleShowMapsExplorationUIMessage:", v9);
      goto LABEL_36;
    case 0x10uLL:
      -[VOTUIServer _handleHighlightMapsExplorationSegmentMessage:]( self,  "_handleHighlightMapsExplorationSegmentMessage:",  v9);
      goto LABEL_36;
    case 0x11uLL:
      -[VOTUIServer _handleUpdateMapsExplorationCurrentCenter:](self, "_handleUpdateMapsExplorationCurrentCenter:", v9);
      goto LABEL_36;
    case 0x12uLL:
      -[VOTUIServer _handleUpdateMapsExplorationUIWithCurrentLocationMessage:]( self,  "_handleUpdateMapsExplorationUIWithCurrentLocationMessage:",  v9);
      goto LABEL_36;
    case 0x13uLL:
      -[VOTUIServer _handleHideMapsExplorationUIMessage:](self, "_handleHideMapsExplorationUIMessage:", v9);
      goto LABEL_36;
    case 0x14uLL:
      -[VOTUIServer _handleSendFocusChangeToZoom:](self, "_handleSendFocusChangeToZoom:", v9);
      goto LABEL_36;
    case 0x15uLL:
      -[VOTUIServer _handleSetSonificationPlayheadPosition:](self, "_handleSetSonificationPlayheadPosition:", v9);
      goto LABEL_36;
    case 0x16uLL:
      -[VOTUIServer _handleBeginSonificationPlayback:](self, "_handleBeginSonificationPlayback:", v9);
      goto LABEL_36;
    case 0x17uLL:
      -[VOTUIServer _handlePauseSonificationPlayback:](self, "_handlePauseSonificationPlayback:", v9);
      goto LABEL_36;
    case 0x18uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"alertText"]);
      id v25 =  [v11 showAlertWithText:v24 subtitleText:0 iconImage:0 type:5 priority:20 duration:self forService:AXUIAlertDisplayTimeDefaultForBanners];

LABEL_32:
      goto LABEL_36;
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
      goto LABEL_38;
    case 0x1CuLL:
      -[VOTUIServer _handleToggleElementLabeler:](self, "_handleToggleElementLabeler:", v9);
      goto LABEL_36;
    case 0x1DuLL:
      -[VOTUIServer _handleToggleQuickSettings](self, "_handleToggleQuickSettings");
      goto LABEL_36;
    default:
      if (a4 == 10000)
      {
        -[VOTUIServer _handleShowVoiceOverWarning:](self, "_handleShowVoiceOverWarning:", v9);
      }

      else
      {
        if (a4 != 10001) {
LABEL_38:
        }
          abort();
        -[VOTUIServer _handleHideVoiceOverWarning:](self, "_handleHideVoiceOverWarning:", v9);
      }

+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3
{
  if (a3 == 1) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_25B60));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"com.apple.accessibility.voiceover"));
  }
  return v3;
}

- (void)_handleVoiceOverCaptionPanelEnabled:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer captionPanelViewControllers](self, "captionPanelViewControllers", 0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "parseMessage:") & 1) != 0) {
          [v11 parseMessage:v4];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)_toggleVoiceOverCaptionPanelViewController
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    if ([v3 enableVoiceOverCaptions])
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer screenCurtainViewControllers](self, "screenCurtainViewControllers"));

      if (!v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer captionPanelViewControllers](self, "captionPanelViewControllers"));
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
        unsigned __int8 v7 = [v6 containsObject:&off_25A98];

        if ((v7 & 1) == 0)
        {
          id v8 = objc_alloc_init(&OBJC_CLASS___VOTUICaptionPanelViewController);
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer captionPanelViewControllers](self, "captionPanelViewControllers"));
          [v9 setObject:v8 forKeyedSubscript:&off_25A98];

          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer captionPanelViewControllers](self, "captionPanelViewControllers"));
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:&off_25A98]);
          [v10 addContentViewController:v12 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfac eStyle:0 forWindowScene:0 spatialConfiguration:0 completion:0];
        }

        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        obj = self->_externalWindowScenes;
        id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v27;
          do
          {
            v16 = 0LL;
            do
            {
              if (*(void *)v27 != v15) {
                objc_enumerationMutation(obj);
              }
              objc_super v17 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v16);
              v18 = objc_alloc_init(&OBJC_CLASS___VOTUICaptionPanelViewController);
              captionPanelViewControllers = self->_captionPanelViewControllers;
              v20 = (void *)objc_claimAutoreleasedReturnValue([v17 screen]);
              v21 = (void *)objc_claimAutoreleasedReturnValue([v20 displayIdentity]);
              v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v21 displayID]));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( captionPanelViewControllers,  "setObject:forKeyedSubscript:",  v18,  v22);

              v23 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
              [v23 addContentViewController:v18 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInte rfaceStyle:0 forWindowScene:v17 completion:0];

              v16 = (char *)v16 + 1;
            }

            while (v14 != v16);
            id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
          }

          while (v14);
        }

        return;
      }
    }

    else
    {
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer captionPanelViewControllers](self, "captionPanelViewControllers"));

  if (v24) {
    -[VOTUIServer _removeCaptionPanelViewControllers](self, "_removeCaptionPanelViewControllers");
  }
}

- (void)_removeCaptionPanelViewControllers
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer captionPanelViewControllers](self, "captionPanelViewControllers", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);

  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
        [v10 removeContentViewController:v9 withUserInteractionEnabled:0 forService:self context:0 completion:0];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer captionPanelViewControllers](self, "captionPanelViewControllers"));
  [v11 removeAllObjects];
}

- (void)_handleSetCursorFrameMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"animate"]);
  id v6 = [v5 BOOLValue];

  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"frame"]);
  CGRect v30 = CGRectFromString(v7);
  double x = v30.origin.x;
  double y = v30.origin.y;
  double width = v30.size.width;
  double height = v30.size.height;

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"path"]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"display"]);

  if (v13)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
    unsigned __int8 v16 = [v15 containsObject:v13];

    if ((v16 & 1) == 0)
    {
      objc_super v17 = -[VOTUICursorViewController initWithAXUIService:]( objc_alloc(&OBJC_CLASS___VOTUICursorViewController),  "initWithAXUIService:",  self);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
      [v18 setObject:v17 forKeyedSubscript:v13];

      v19 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v13]);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_9194;
      v22[3] = &unk_247F8;
      v22[4] = self;
      double v25 = x;
      double v26 = y;
      double v27 = width;
      double v28 = height;
      id v23 = v12;
      char v29 = (char)v6;
      id v24 = v13;
      [v19 addContentViewController:v21 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceSty le:0 forWindowScene:0 completion:v22];
    }

    -[VOTUIServer _updateCursorWithFrame:pathData:animate:displayID:]( self,  "_updateCursorWithFrame:pathData:animate:displayID:",  v12,  v6,  v13,  x,  y,  width,  height);
  }
}

- (void)_updateCursorWithFrame:(CGRect)a3 pathData:(id)a4 animate:(BOOL)a5 displayID:(id)a6
{
  BOOL v37 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a6;
  id v38 = v12;
  if (v12) {
    __int128 v14 = (const void *)AX_CGPathCreateWithDataRepresentation(v12);
  }
  else {
    __int128 v14 = 0LL;
  }
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allKeys]);

  id v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(id *)(*((void *)&v39 + 1) + 8LL * (void)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v21]);
        [v23 setCursorHidden:v21 != v13];
      }

      id v18 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }

    while (v18);
  }

  v44.origin.double x = CGRectZero.origin.x;
  v44.origin.double y = CGRectZero.origin.y;
  v44.size.double width = CGRectZero.size.width;
  v44.size.double height = CGRectZero.size.height;
  v45.origin.double x = x;
  v45.origin.double y = y;
  v45.size.double width = width;
  v45.size.double height = height;
  BOOL v24 = CGRectEqualToRect(v44, v45);
  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
  double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v13]);
  double v27 = v26;
  if (v24 && v14 == 0LL)
  {
    [v26 setCursorHidden:1];

    CGRect v30 = v38;
  }

  else
  {
    unsigned int v29 = [v26 cursorHidden];

    CGRect v30 = v38;
    if (v29)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v13]);
      [v32 setCursorHidden:0];
    }

    CGRect v33 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
    NSRect v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v13]);
    objc_msgSend(v34, "setCursorFrame:animated:", v37, x, y, width, height);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v13]);
    [v36 setCursorPath:v14];

    if (v14) {
      CFRelease(v14);
    }
  }
}

- (void)_handleSetElementVisualizationFramesMessage:(id)a3
{
  id v4 = a3;
  id v15 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"elementVisualizationFrames"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"elementVisualizationFrameLabels"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"elementVisualizationUIClasses"]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v15, v7) & 1) != 0
    && [v15 count]
    && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v5, v8) & 1) != 0))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer elementVisualizationViewController](self, "elementVisualizationViewController"));

    if (!v9)
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___VOTUIElementVisualizationViewController);
      -[VOTUIServer setElementVisualizationViewController:](self, "setElementVisualizationViewController:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer elementVisualizationViewController](self, "elementVisualizationViewController"));
      [v11 addContentViewController:v12 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceSty le:0 forWindowScene:0 completion:0];
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer elementVisualizationViewController](self, "elementVisualizationViewController"));
    [v13 setElementFrames:v15 labels:v5 uiClasses:v6];
  }

  else
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer elementVisualizationViewController](self, "elementVisualizationViewController"));

    if (v14) {
      -[VOTUIServer _removeElementVisualizationViewController](self, "_removeElementVisualizationViewController");
    }
  }
}

- (void)_handleShowVoiceOverWarning:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer voiceOverEnabledBannerViewController](self, "voiceOverEnabledBannerViewController", a3));

  if (!v4)
  {
    id v5 = -[VOTEnabledBannerViewController initWithNibName:bundle:]( objc_alloc(&OBJC_CLASS___VOTEnabledBannerViewController),  "initWithNibName:bundle:",  0LL,  0LL);
    -[VOTUIServer setVoiceOverEnabledBannerViewController:](self, "setVoiceOverEnabledBannerViewController:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer voiceOverEnabledBannerViewController](self, "voiceOverEnabledBannerViewController"));
    [v6 addContentViewController:v7 withUserInteractionEnabled:0 forService:self];

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer voiceOverEnabledBannerViewController](self, "voiceOverEnabledBannerViewController"));
    [v8 showAnimated:1 completion:0];
  }

- (void)_handleHideVoiceOverWarning:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer voiceOverEnabledBannerViewController](self, "voiceOverEnabledBannerViewController", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_977C;
  v5[3] = &unk_247D0;
  v5[4] = self;
  [v4 hideAnimated:1 completion:v5];
}

- (void)_handleUpdateVisualRotor:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer rotorViewControllers](self, "rotorViewControllers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  unsigned __int8 v7 = [v6 containsObject:&off_25A98];

  if ((v7 & 1) == 0)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___VOTUIRotorViewController);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer rotorViewControllers](self, "rotorViewControllers"));
    [v9 setObject:v8 forKeyedSubscript:&off_25A98];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer rotorViewControllers](self, "rotorViewControllers"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:&off_25A98]);
    [v10 addContentViewController:v12 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle :0 forWindowScene:0 spatialConfiguration:0 completion:0];
  }

  if (-[NSMutableArray count](self->_externalWindowScenes, "count"))
  {
    id v30 = v4;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]);

    id obj = v14;
    id v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v33;
      id v18 = &off_25A98;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v20]);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 view]);
          id v24 = [v23 isHidden];

          if ((v24 & 1) == 0)
          {
            double v25 = v20;

            id v18 = v25;
          }

          double v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer rotorViewControllers](self, "rotorViewControllers"));
          double v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v20]);
          [v27 setRotorHidden:v24];
        }

        id v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v16);
    }

    else
    {
      id v18 = &off_25A98;
    }

    id v4 = v30;
  }

  else
  {
    id v18 = &off_25A98;
  }

  double v28 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer rotorViewControllers](self, "rotorViewControllers"));
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v18]);
  [v29 updateVisualRotor:v4];
}

- (CGRect)_handleConvertFrameMessage:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"frame"]);
  CGRect v25 = CGRectFromString(v5);
  double x = v25.origin.x;
  double y = v25.origin.y;
  double width = v25.size.width;
  double height = v25.size.height;

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"display"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);
  objc_msgSend(v12, "convertFrameToCursorSpace:", x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (id)_handleConvertFramesMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"frames"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"display"]);
  unsigned __int8 v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        CGRect v35 = CGRectFromString((NSString *)*(void *)(*((void *)&v30 + 1) + 8LL * (void)v12));
        double x = v35.origin.x;
        double y = v35.origin.y;
        double width = v35.size.width;
        double height = v35.size.height;
        double v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers", (void)v30));
        double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v6]);
        objc_msgSend(v18, "convertFrameToCursorSpace:", x, y, width, height);
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;

        v36.origin.double x = v20;
        v36.origin.double y = v22;
        v36.size.double width = v24;
        v36.size.double height = v26;
        if (!CGRectIsNull(v36))
        {
          v37.origin.double x = v20;
          v37.origin.double y = v22;
          v37.size.double width = v24;
          v37.size.double height = v26;
          double v27 = NSStringFromCGRect(v37);
          double v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          -[NSMutableArray addObject:](v7, "addObject:", v28);
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v10);
  }

  return v7;
}

- (void)_handleShowMapsExplorationUIMessage:(id)a3
{
  id v4 = a3;
  -[VOTUIServer _addMapsExplorationViewController](self, "_addMapsExplorationViewController");
  id v13 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"mapsExplorationCenter"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer mapsExplorationViewController](self, "mapsExplorationViewController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
  [v6 floatValue];
  double v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:1]);
  [v9 floatValue];
  double v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"mapsExplorationData"]);

  objc_msgSend(v5, "updateUIWithCenter:andExplorationSegments:", v12, v8, v11);
}

- (void)_handleUpdateMapsExplorationCurrentCenter:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"mapsExplorationCenter"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer mapsExplorationViewController](self, "mapsExplorationViewController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  [v5 floatValue];
  double v7 = v6;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:1]);
  [v8 floatValue];
  objc_msgSend(v4, "updateUIWithCenter:", v7, v9);
}

- (void)_handleUpdateMapsExplorationUIWithCurrentLocationMessage:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"mapsExplorationCurrentLocation"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer mapsExplorationViewController](self, "mapsExplorationViewController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  [v5 floatValue];
  double v7 = v6;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:1]);
  [v8 floatValue];
  objc_msgSend(v4, "updateUIWithCurrentLocation:", v7, v9);
}

- (void)_handleHighlightMapsExplorationSegmentMessage:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer mapsExplorationViewController](self, "mapsExplorationViewController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"mapsExplorationIndex"]);

  objc_msgSend(v6, "highlightExplorationSegmentWithIndex:", (int)objc_msgSend(v5, "intValue"));
}

- (void)_handleShowBrailleUIMessage:(id)a3
{
  id v4 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"brailleOrientation"]);
  uint64_t v5 = (int)[v10 intValue];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"brailleDotPositions"]);
  id v7 = sub_A0DC(v6);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  float v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"brailleTypingMode"]);

  -[VOTUIServer _addBrailleViewControllerWithOrientation:dotNumberPositions:typingMode:]( self,  "_addBrailleViewControllerWithOrientation:dotNumberPositions:typingMode:",  v5,  v8,  (int)[v9 intValue]);
}

- (void)_handleHighlightBrailleDotsMessage:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer brailleViewController](self, "brailleViewController"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"brailleDotNumbers"]);

  [v6 highlightBrailleDots:v5];
}

- (void)_handleUpdateBrailleUIMessage:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer brailleViewController](self, "brailleViewController"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"brailleOrientation"]);
  uint64_t v6 = (int)[v5 intValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"brailleDotPositions"]);
  id v8 = sub_A0DC(v7);
  float v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"brailleTypingMode"]);

  objc_msgSend(v11, "setOrientation:dotNumberPositions:typingMode:", v6, v9, (int)objc_msgSend(v10, "intValue"));
}

- (void)_handleSendFocusChangeToZoom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FocusChangeFrameKey"]);
  CGRect v40 = CGRectFromString(v5);
  double x = v40.origin.x;
  double y = v40.origin.y;
  double width = v40.size.width;
  double height = v40.size.height;

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FocusChangeTypeKey"]);
  id v11 = [v10 integerValue];

  id v39 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"display"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v39]);
  objc_msgSend(v13, "convertFrameToCursorSpace:", x, y, width, height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  CGFloat v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
  double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v39]);
  CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue([v23 view]);
  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
  CGFloat v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v39]);
  double v27 = (void *)objc_claimAutoreleasedReturnValue([v26 cursorView]);
  objc_msgSend(v24, "convertRect:toView:", v27, v15, v17, v19, v21);
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;

  CGRect v36 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
  CGRect v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v39]);
  id v38 = (UIView *)objc_claimAutoreleasedReturnValue([v37 cursorView]);
  v41.origin.double x = v29;
  v41.origin.double y = v31;
  v41.size.double width = v33;
  v41.size.double height = v35;
  UIAccessibilityZoomFocusChanged((UIAccessibilityZoomType)v11, v41, v38);
}

- (void)_handleZoomFocusChangeNotification:(id)a3
{
  id v19 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v19 userInfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"type"]);
  uint64_t v5 = (char *)[v4 integerValue];

  if ((unint64_t)(v5 - 1) <= 1)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v19 userInfo]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"window"]);

    double v8 = AXUIRectForZoomFocusChangeNotification(v19);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = (void *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
    id v16 = [v7 _contextId];
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v7 screen]);
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 displayIdentity]);
    objc_msgSend( v15,  "notifyZoomFocusDidChangeWithType:rect:contextId:keyboardFrame:displayId:",  v5,  v16,  objc_msgSend(v18, "displayID"),  v8,  v10,  v12,  v14,  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height);
  }
}

- (void)_handleSetSonificationPlayheadPosition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));

  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___VOTUISonificationViewController);
    -[VOTUIServer setSonificationViewController:](self, "setSonificationViewController:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));
    [v7 addContentViewController:v8 withUserInteractionEnabled:0 forService:self];
  }

  double v9 = (NSString *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sonificationPlaybackBounds"]);
  CGRect v29 = CGRectFromString(v9);
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;

  double v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sonificationPlayheadProgress"]);
  [v14 doubleValue];
  double v16 = v15;

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));
  objc_msgSend(v17, "convertFrameToViewSpace:", x, y, width, height);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  CGFloat v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));
  [v26 setPlayheadHidden:v16 < 0.0];

  double v27 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));
  objc_msgSend(v27, "setPlaybackBounds:", v19, v21, v23, v25);

  id v28 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));
  [v28 setPlayheadProgress:v16];
}

- (void)_handleBeginSonificationPlayback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));

  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___VOTUISonificationViewController);
    -[VOTUIServer setSonificationViewController:](self, "setSonificationViewController:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));
    [v7 addContentViewController:v8 withUserInteractionEnabled:0 forService:self];
  }

  double v9 = (NSString *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sonificationPlaybackBounds"]);
  CGRect v38 = CGRectFromString(v9);
  double x = v38.origin.x;
  double y = v38.origin.y;
  double width = v38.size.width;
  double height = v38.size.height;

  double v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sonificationPlayheadProgress"]);
  [v14 doubleValue];
  double v16 = v15;

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));
  objc_msgSend(v17, "convertFrameToViewSpace:", x, y, width, height);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  CGFloat v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sonificationDuration"]);
  [v26 doubleValue];
  double v28 = v27;

  CGRect v29 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sonificationPlaybackStartTime"]);
  [v29 doubleValue];
  double v31 = v30;

  double v32 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sonificationNormalizedPlayheadPosition"]);
  [v32 doubleValue];
  double v34 = v33;

  CGFloat v35 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));
  [v35 setPlayheadProgress:v16];

  CGRect v36 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));
  objc_msgSend(v36, "setPlaybackBounds:", v19, v21, v23, v25);

  id v37 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));
  [v37 resumePlaybackFromPosition:v34 startTime:v31 totalDuration:v28];
}

- (void)_handlePauseSonificationPlayback:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController", a3));
  [v3 pausePlayback];
}

- (void)_handleDisplayUIServerBasedItemChooser:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"items"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer itemChooserController](self, "itemChooserController"));
  if (v9)
  {

    if (!v4)
    {
      uint64_t v5 = objc_alloc_init(&OBJC_CLASS___Legacy_VOTUIItemChooserController);
      -[VOTUIServer setItemChooserController:](self, "setItemChooserController:", v5);

      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer itemChooserController](self, "itemChooserController"));
      [v6 setDelegate:self];

      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer itemChooserController](self, "itemChooserController"));
      [v7 addContentViewController:v8 withUserInteractionEnabled:1 forService:self];
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer itemChooserController](self, "itemChooserController"));
    [v4 showItemChooser:v9];
  }

  else
  {
    [v4 hideItemChooser:0];
  }
}

- (void)_handleScreenCurtainEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    -[VOTUIServer _removeScreenCurtainControllers](self, "_removeScreenCurtainControllers");
    goto LABEL_12;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer screenCurtainViewControllers](self, "screenCurtainViewControllers"));

  if (v5)
  {
LABEL_12:
    int v22 = 0;
    goto LABEL_13;
  }

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[VOTUIServer setScreenCurtainViewControllers:](self, "setScreenCurtainViewControllers:", v6);

  _UIAccessibilityBlockPostingOfNotification(UIAccessibilityScreenChangedNotification);
  id v7 = objc_alloc_init(&OBJC_CLASS___VOTUIScreenCurtainViewController);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer screenCurtainViewControllers](self, "screenCurtainViewControllers"));
  [v8 setObject:v7 forKeyedSubscript:&off_25A98];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer screenCurtainViewControllers](self, "screenCurtainViewControllers"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_25A98]);
  [v9 addContentViewController:v11 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTScreenCurtainSceneClientIdentifier" context:0 userInterfaceStyle:0 f orWindowScene:0 completion:0];

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = self->_externalWindowScenes;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v30 = *(void *)v36;
    do
    {
      double v14 = 0LL;
      do
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v14);
        double v16 = objc_alloc_init(&OBJC_CLASS___VOTUIScreenCurtainViewController);
        screenCurtainViewControllers = self->_screenCurtainViewControllers;
        double v18 = (void *)objc_claimAutoreleasedReturnValue([v15 screen]);
        double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 displayIdentity]);
        double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v19 displayID]));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( screenCurtainViewControllers,  "setObject:forKeyedSubscript:",  v16,  v20);

        double v21 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
        [v21 addContentViewController:v16 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTScreenCurtainSceneClientIdentifier" context:0 userInterfaceS tyle:0 forWindowScene:v15 completion:0];

        double v14 = (char *)v14 + 1;
      }

      while (v13 != v14);
      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
    }

    while (v13);
  }

  int v22 = 1;
LABEL_13:
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer screenCurtainViewControllers](self, "screenCurtainViewControllers"));
  double v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allValues]);

  id v25 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      double v28 = 0LL;
      do
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * (void)v28) setEnabled:v3 animate:1];
        double v28 = (char *)v28 + 1;
      }

      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v26);
  }

  if (v22) {
    _UIAccessibilityUnblockPostingOfNotification(UIAccessibilityScreenChangedNotification);
  }
}

- (void)_handleFlashBrailleInsertedTextMessage:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer brailleViewController](self, "brailleViewController"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"brailleInsertedText"]);

  [v6 flashInsertedText:v5];
}

- (void)_removeScreenCurtainControllers
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer screenCurtainViewControllers](self, "screenCurtainViewControllers", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        [v9 setEnabled:0 animate:1];
        double v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
        [v10 removeContentViewController:v9 withUserInteractionEnabled:0 forService:self context:0 completion:0];
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  -[VOTUIServer setScreenCurtainViewControllers:](self, "setScreenCurtainViewControllers:", 0LL);
}

- (void)_removeCursorViewControllers
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      double v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v11 + 1) + 8LL * (void)v8);
        [v9 setCursorHidden:1];
        double v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
        [v10 removeContentViewController:v9 withUserInteractionEnabled:0 forService:self context:0 completion:0];

        double v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  -[VOTUIServer setCursorViewControllers:](self, "setCursorViewControllers:", 0LL);
}

- (void)_removeElementVisualizationViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer elementVisualizationViewController](self, "elementVisualizationViewController"));
  [v3 setFramesHidden:1];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer elementVisualizationViewController](self, "elementVisualizationViewController"));
  [v4 removeContentViewController:v5 withUserInteractionEnabled:0 forService:self];

  -[VOTUIServer setElementVisualizationViewController:](self, "setElementVisualizationViewController:", 0LL);
}

- (void)_removeItemChooserController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer itemChooserController](self, "itemChooserController"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer itemChooserController](self, "itemChooserController"));
    [v4 removeContentViewController:v5 withUserInteractionEnabled:0 forService:self];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer itemChooserController](self, "itemChooserController"));
    [v6 setDelegate:0];

    -[VOTUIServer setItemChooserController:](self, "setItemChooserController:", 0LL);
  }

- (void)_removeRotorViewControllers
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer rotorViewControllers](self, "rotorViewControllers", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      double v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v8);
        double v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
        [v10 removeContentViewController:v9 withUserInteractionEnabled:0 forService:self context:0 completion:0];

        double v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)_removeSonificationViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer sonificationViewController](self, "sonificationViewController"));
    [v4 removeContentViewController:v5 withUserInteractionEnabled:0 forService:self];

    -[VOTUIServer setSonificationViewController:](self, "setSonificationViewController:", 0LL);
  }

- (void)_removeVOTEnabledBannerViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer voiceOverEnabledBannerViewController](self, "voiceOverEnabledBannerViewController"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer voiceOverEnabledBannerViewController](self, "voiceOverEnabledBannerViewController"));
    [v4 removeContentViewController:v5 withUserInteractionEnabled:0 forService:self];

    -[VOTUIServer setVoiceOverEnabledBannerViewController:](self, "setVoiceOverEnabledBannerViewController:", 0LL);
  }

- (void)_addMapsExplorationViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer mapsExplorationViewController](self, "mapsExplorationViewController"));

  if (!v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___VOTUIMapsExplorationViewController);
    -[VOTUIServer setMapsExplorationViewController:](self, "setMapsExplorationViewController:", v4);

    id v6 = (id)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer mapsExplorationViewController](self, "mapsExplorationViewController"));
    [v6 addContentViewController:v5 withUserInteractionEnabled:0 forService:self];
  }

- (void)_addBrailleViewControllerWithOrientation:(int64_t)a3 dotNumberPositions:(id)a4 typingMode:(int64_t)a5
{
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer brailleViewController](self, "brailleViewController"));

  if (v9)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer brailleViewController](self, "brailleViewController"));
    [v11 setOrientation:a3 dotNumberPositions:v8 typingMode:a5];
  }

  else
  {
    double v10 = -[VOTUIBrailleViewController initWithOrientation:dotNumberPositions:typingMode:]( objc_alloc(&OBJC_CLASS___VOTUIBrailleViewController),  "initWithOrientation:dotNumberPositions:typingMode:",  a3,  v8,  a5);

    -[VOTUIServer setBrailleViewController:](self, "setBrailleViewController:", v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer brailleViewController](self, "brailleViewController"));
    [v11 addContentViewController:v8 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXZoomSceneClientIdentifier"];
  }
}

- (void)_removeBrailleViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer brailleViewController](self, "brailleViewController"));
  [v3 removeContentViewController:v4 withUserInteractionEnabled:0 forService:self];

  -[VOTUIServer setBrailleViewController:](self, "setBrailleViewController:", 0LL);
}

- (void)_removeMapsExplorationViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer mapsExplorationViewController](self, "mapsExplorationViewController"));
  [v3 removeContentViewController:v4 withUserInteractionEnabled:0 forService:self];

  -[VOTUIServer setMapsExplorationViewController:](self, "setMapsExplorationViewController:", 0LL);
}

- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_B8B4;
  block[3] = &unk_247D0;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4
{
  id v5 = a3;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

  id v8 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v37;
    while (2)
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        if (*(id *)(*((void *)&v36 + 1) + 8LL * (void)v11) == v5)
        {

          goto LABEL_29;
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer screenCurtainViewControllers](self, "screenCurtainViewControllers"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allValues]);

  id v14 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v33;
    while (2)
    {
      double v17 = 0LL;
      do
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        if (*(id *)(*((void *)&v32 + 1) + 8LL * (void)v17) == v5)
        {

          double v26 = 10000020.0;
          goto LABEL_31;
        }

        double v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v18 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer itemChooserController](self, "itemChooserController"));
  if (v18 == v5)
  {
    double v26 = UIHUDWindowLevel;
  }

  else
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer brailleViewController](self, "brailleViewController"));

    if (v19 == v5)
    {
      double v26 = 10000017.0;
    }

    else
    {
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      double v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer captionPanelViewControllers](self, "captionPanelViewControllers", 0LL));
      double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allValues]);

      id v22 = [v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v29;
        while (2)
        {
          id v25 = 0LL;
          do
          {
            if (*(void *)v29 != v24) {
              objc_enumerationMutation(v21);
            }
            if (*(id *)(*((void *)&v28 + 1) + 8LL * (void)v25) == v5)
            {

              double v26 = 10000014.0;
              goto LABEL_31;
            }

            id v25 = (char *)v25 + 1;
          }

          while (v23 != v25);
          id v23 = [v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

LABEL_29:
      double v26 = 10000013.0;
    }
  }

- (void)externalDisplaySceneConnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  id v29 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v29 screen]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 displayIdentity]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v7 displayID]));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v8]);

  if (!v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer externalWindowScenes](self, "externalWindowScenes"));
    [v10 addObject:v29];

    id v11 = -[VOTUICursorViewController initWithAXUIService:]( objc_alloc(&OBJC_CLASS___VOTUICursorViewController),  "initWithAXUIService:",  self);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v29 screen]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 displayIdentity]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v14 displayID]));
    [v12 setObject:v11 forKeyedSubscript:v15];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    [v16 addContentViewController:v11 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle :0 forWindowScene:v29 completion:0];

    double v17 = objc_alloc_init(&OBJC_CLASS___VOTUICaptionPanelViewController);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer captionPanelViewControllers](self, "captionPanelViewControllers"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v29 screen]);
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 displayIdentity]);
    double v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v20 displayID]));
    [v18 setObject:v17 forKeyedSubscript:v21];

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    [v22 addContentViewController:v17 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle :0 forWindowScene:v29 completion:0];

    id v23 = objc_alloc_init(&OBJC_CLASS___VOTUIRotorViewController);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer rotorViewControllers](self, "rotorViewControllers"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v29 screen]);
    double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 displayIdentity]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v26 displayID]));
    [v24 setObject:v23 forKeyedSubscript:v27];

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    [v28 addContentViewController:v23 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle :0 forWindowScene:v29 completion:0];
  }
}

- (void)externalDisplaySceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer externalWindowScenes](self, "externalWindowScenes"));
  [v6 removeObject:v5];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer cursorViewControllers](self, "cursorViewControllers"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 screen]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 displayIdentity]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 displayID]));
  [v7 removeObjectForKey:v10];

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIServer captionPanelViewControllers](self, "captionPanelViewControllers"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 screen]);

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 displayIdentity]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v12 displayID]));
  [v14 removeObjectForKey:v13];
}

- (BOOL)shouldPreventAutorotatingAllContentViewControllers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIServer brailleViewController](self, "brailleViewController"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (NSMutableDictionary)cursorViewControllers
{
  return self->_cursorViewControllers;
}

- (void)setCursorViewControllers:(id)a3
{
}

- (VOTUIElementVisualizationViewController)elementVisualizationViewController
{
  return self->_elementVisualizationViewController;
}

- (void)setElementVisualizationViewController:(id)a3
{
}

- (NSMutableDictionary)screenCurtainViewControllers
{
  return self->_screenCurtainViewControllers;
}

- (void)setScreenCurtainViewControllers:(id)a3
{
}

- (VOTUIBrailleViewController)brailleViewController
{
  return self->_brailleViewController;
}

- (void)setBrailleViewController:(id)a3
{
}

- (VOTUIMapsExplorationViewController)mapsExplorationViewController
{
  return self->_mapsExplorationViewController;
}

- (void)setMapsExplorationViewController:(id)a3
{
}

- (NSMutableDictionary)captionPanelViewControllers
{
  return self->_captionPanelViewControllers;
}

- (void)setCaptionPanelViewControllers:(id)a3
{
}

- (NSMutableDictionary)rotorViewControllers
{
  return self->_rotorViewControllers;
}

- (void)setRotorViewControllers:(id)a3
{
}

- (VOTUISonificationViewController)sonificationViewController
{
  return self->_sonificationViewController;
}

- (void)setSonificationViewController:(id)a3
{
}

- (Legacy_VOTUIItemChooserController)itemChooserController
{
  return self->_itemChooserController;
}

- (void)setItemChooserController:(id)a3
{
}

- (NSString)voiceOverWarningIdentifier
{
  return self->_voiceOverWarningIdentifier;
}

- (void)setVoiceOverWarningIdentifier:(id)a3
{
}

- (VOTEnabledBannerViewController)voiceOverEnabledBannerViewController
{
  return self->_voiceOverEnabledBannerViewController;
}

- (void)setVoiceOverEnabledBannerViewController:(id)a3
{
}

- (NSMutableArray)externalWindowScenes
{
  return self->_externalWindowScenes;
}

- (void)setExternalWindowScenes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end