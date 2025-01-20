@interface TVSSVideoMicPlatterController
+ (id)batteryStateDescriptionForBatteryLevel:(float)a3 batteryState:(int64_t)a4;
+ (id)connectedContinuityCameraContentFromBackingStore:(id)a3;
+ (id)enabledMicModeContentFromBackingStore:(id)a3;
+ (id)layoutFromBackingStore:(id)a3 framingView:(id)a4;
+ (id)layoutProvidersFromBackingStore:(id)a3;
+ (id)renderersFromBackingStore:(id)a3 framingView:(id)a4;
- (BSInvalidatable)videoPreviewAssertion;
- (TVSSManualFramingView)framingView;
- (TVSSVideoMicBackingStore)backingStore;
- (TVSSVideoMicPlatterController)initWithIdentifier:(id)a3;
- (id)contextMenuConfigurationForRenderer:(id)a3;
- (void)continuityDevicePickerDidEndPresenting:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)didUpdateFocusOnZoomControl:(BOOL)a3;
- (void)manualFramingViewDidChangeLensSelection:(BOOL)a3;
- (void)manualFramingViewDidChangeZoomFactor:(double)a3;
- (void)manualFramingViewDidTriggerOneShotFraming;
- (void)presentCameraPickerIfNecessary;
- (void)reloadPlatter;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)setBackingStore:(id)a3;
- (void)setFramingView:(id)a3;
- (void)setVideoPreviewAssertion:(id)a3;
- (void)videoMicBackingStoreDidChange:(id)a3;
@end

@implementation TVSSVideoMicPlatterController

+ (id)enabledMicModeContentFromBackingStore:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  memset(__b, 0, sizeof(__b));
  id v12 = [location[0] micModes];
  id obj = [v12 allValues];

  id v14 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v14)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0LL;
    id v11 = v14;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v10);
      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0LL;
        id v11 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v11) {
          goto LABEL_9;
        }
      }
    }

    objc_storeStrong(&v17, v16);
  }

+ (id)connectedContinuityCameraContentFromBackingStore:(id)a3
{
  id v20 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = [location[0] connectedDeviceName];
  char v16 = 0;
  if (v14)
  {
    id v3 = v14;
  }

  else
  {
    id v17 = TVSSLagunaLocalizedString(@"TVSSControlCenterDefaultCameraName");
    char v16 = 1;
    id v3 = v17;
  }

  id v18 = v3;
  if ((v16 & 1) != 0) {

  }
  uint64_t v9 = v20;
  id v10 = [location[0] continuityCaptureDevice];
  [v10 batteryLevel];
  int v8 = v4;
  id v5 = [location[0] batteryState];
  LODWORD(v6) = v8;
  id v15 = [v9 batteryStateDescriptionForBatteryLevel:v5 batteryState:v6];

  id v11 = v18;
  id v12 =  +[UIImage _systemImageNamed:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:",  @"rectangle.inset.filled.and.camera");
  v13 =  +[TVSPContent contentWithTitle:image:attrText1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:attrText1:",  v11);

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
  return v13;
}

+ (id)batteryStateDescriptionForBatteryLevel:(float)a3 batteryState:(int64_t)a4
{
  id v27 = a1;
  SEL v26 = a2;
  float v25 = a3;
  int64_t v24 = a4;
  BOOL v16 = 0;
  if (a4) {
    BOOL v16 = v24 != 1;
  }
  BOOL v23 = v16;
  id v7 = +[UITraitCollection _tvspMainSceneTraits](&OBJC_CLASS___UITraitCollection, "_tvspMainSceneTraits");
  id v8 = [v7 userInterfaceStyle];

  v22[1] = v8;
  v22[0] =  +[TVSSBatteryLevelImageConfiguration batteryLevelImageConfigurationForBatteryLevel:isCharging:userInterfaceStyle:]( &OBJC_CLASS___TVSSBatteryLevelImageConfiguration,  "batteryLevelImageConfigurationForBatteryLevel:isCharging:userInterfaceStyle:",  v16,  v8,  v25);
  v21 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v21, "setNumberStyle:", 3LL);
  -[NSNumberFormatter setUsesSignificantDigits:](v21, "setUsesSignificantDigits:", 0LL);
  -[NSNumberFormatter setUsesGroupingSeparator:](v21, "setUsesGroupingSeparator:", 0LL);
  uint64_t v9 = v21;
  *(float *)&double v4 = v25;
  id v10 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v4);
  id v20 = -[NSNumberFormatter stringFromNumber:](v9, "stringFromNumber:");

  id v12 = [v22[0] imageSymbolName];
  id v11 = [v22[0] imageSymbolConfiguration];
  id v19 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  v12);

  id v5 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  id v18 = -[NSMutableAttributedString initWithString:](v5, "initWithString:", v20);
  id v17 = +[NSTextAttachment textAttachmentWithImage:](&OBJC_CLASS___NSTextAttachment, "textAttachmentWithImage:", v19);
  v13 = v18;
  id v14 =  +[NSMutableAttributedString attributedStringWithAttachment:]( &OBJC_CLASS___NSMutableAttributedString,  "attributedStringWithAttachment:",  v17);
  -[NSMutableAttributedString appendAttributedString:](v13, "appendAttributedString:");

  id v15 = v18;
  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong((id *)&v20, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  objc_storeStrong(v22, 0LL);
  return v15;
}

+ (id)renderersFromBackingStore:(id)a3 framingView:(id)a4
{
  id v36 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v34 = 0LL;
  objc_storeStrong(&v34, a4);
  v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = v33;
  double v4 = objc_alloc(&OBJC_CLASS___TVSSVideoPreviewRenderer);
  id v8 = -[TVSSVideoPreviewRenderer initWithIdentifier:framingView:]( v4,  "initWithIdentifier:framingView:",  @"TVSSManualFramingViewDefaultIdentifier",  v34);
  -[NSMutableArray addObject:](v7, "addObject:");

  id v9 = [location[0] videoEffects];
  v27[1] = _NSConcreteStackBlock;
  int v28 = -1073741824;
  int v29 = 0;
  v30 = sub_100111E18;
  v31 = &unk_1001BB4B0;
  v32 = v33;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:");

  id v10 = v33;
  id v12 = [v36 enabledMicModeContentFromBackingStore:location[0]];
  id v11 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"mic_modes");
  -[NSMutableArray addObject:](v10, "addObject:");

  v27[0] = [v36 connectedContinuityCameraContentFromBackingStore:location[0]];
  v13 = v33;
  float v25 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"separator",  19LL,  0LL);
  v37[0] = v25;
  id v24 = TVSSLagunaLocalizedString(@"TVSSControlCenterVideoEffectsTitle");
  BOOL v23 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v22 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"video_effects_title");
  v37[1] = v22;
  id v21 = TVSSLagunaLocalizedString(@"TVSSControlCenterMicModesTitle");
  id v20 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  id v19 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"mic_modes_title",  3LL);
  v37[2] = v19;
  id v18 = TVSSLagunaLocalizedString(@"TVSSControlCenterConnectedCameraTitle");
  id v17 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  BOOL v16 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"cameras_title",  3LL);
  v37[3] = v16;
  id v15 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"connected_camera",  16LL,  v27[0]);
  v37[4] = v15;
  id v14 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 5LL);
  -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:");

  SEL v26 = v33;
  objc_storeStrong(v27, 0LL);
  objc_storeStrong((id *)&v32, 0LL);
  objc_storeStrong((id *)&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(location, 0LL);
  return v26;
}

+ (id)layoutProvidersFromBackingStore:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v50 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  +[TVSPConstants cameraPreviewHeight](&OBJC_CLASS___TVSPConstants, "cameraPreviewHeight");
  double v49 = v3;
  if ([location[0] isValidPreviewBufferStream])
  {
    v43 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"TVSSManualFramingViewDefaultIdentifier",  v49);
    objc_msgSend(v50, "addObject:");

    id v44 = +[TVSPRow spacer](&OBJC_CLASS___TVSPRow, "spacer");
    objc_msgSend(v50, "addObject:");
  }

  if ([location[0] isValidPreviewBufferStream])
  {
    v56[0] = AVControlCenterVideoEffectCenterStage;
    v56[1] = AVControlCenterVideoEffectBackgroundBlur;
    v56[2] = AVControlCenterVideoEffectStudioLighting;
    v56[3] = AVControlCenterVideoEffectGestures;
    id v48 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 4LL);
    id v47 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    memset(__b, 0, sizeof(__b));
    id obj = v48;
    id v42 = [obj countByEnumeratingWithState:__b objects:v55 count:16];
    if (v42)
    {
      uint64_t v38 = *(void *)__b[2];
      uint64_t v39 = 0LL;
      id v40 = v42;
      while (1)
      {
        uint64_t v37 = v39;
        if (*(void *)__b[2] != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = *(void *)(__b[1] + 8 * v39);
        id v35 = [location[0] videoEffects];
        id v34 = [v35 objectForKeyedSubscript:v46];
        unsigned __int8 v36 = [v34 isSupported];

        if ((v36 & 1) != 0)
        {
          id v31 = v47;
          uint64_t v54 = v46;
          v33 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL);
          v32 = +[TVSPRow rowWithIdentifiers:](&OBJC_CLASS___TVSPRow, "rowWithIdentifiers:");
          objc_msgSend(v31, "addObject:");
        }

        ++v39;
        if (v37 + 1 >= (unint64_t)v40)
        {
          uint64_t v39 = 0LL;
          id v40 = [obj countByEnumeratingWithState:__b objects:v55 count:16];
          if (!v40) {
            break;
          }
        }
      }
    }

    if ([v47 count])
    {
      id v25 = v50;
      +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
      id v26 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
      objc_msgSend(v25, "addObject:");

      id v27 = v50;
      int v28 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"video_effects_title");
      objc_msgSend(v27, "addObject:");

      id v29 = v50;
      +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
      id v30 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
      objc_msgSend(v29, "addObject:");

      [v50 addObjectsFromArray:v47];
    }

    objc_storeStrong(&v47, 0LL);
    objc_storeStrong(&v48, 0LL);
  }

  id v4 = [location[0] enabledMicMode];
  BOOL v24 = v4 == 0LL;

  if (!v24)
  {
    id v18 = v50;
    +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
    id v23 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    v53[0] = v23;
    v22 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"mic_modes_title");
    v53[1] = v22;
    +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
    id v21 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    v53[2] = v21;
    id v20 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"mic_modes");
    v53[3] = v20;
    id v19 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 4LL);
    objc_msgSend(v18, "addObjectsFromArray:");
  }

  if ([v50 count])
  {
    id v14 = v50;
    id v15 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 24.0);
    objc_msgSend(v14, "addObject:");

    id v16 = v50;
    id v17 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"separator");
    objc_msgSend(v16, "addObject:");
  }

  id v7 = v50;
  +[TVSPConstants subtitleVerticalPadding]( &OBJC_CLASS___TVSPConstants,  "subtitleVerticalPadding",  &OBJC_CLASS___TVSPRow);
  id v12 = objc_msgSend(v6, "spacerWithHeight:");
  v52[0] = v12;
  id v11 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"cameras_title");
  v52[1] = v11;
  +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
  id v10 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v52[2] = v10;
  id v9 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"connected_camera");
  v52[3] = v9;
  id v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 4LL);
  objc_msgSend(v7, "addObjectsFromArray:");

  id v13 = v50;
  objc_storeStrong(&v50, 0LL);
  objc_storeStrong(location, 0LL);
  return v13;
}

+ (id)layoutFromBackingStore:(id)a3 framingView:(id)a4
{
  id v11 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  id v7 = [v11 layoutProvidersFromBackingStore:location[0]];
  id v6 = [v11 renderersFromBackingStore:location[0] framingView:v9];
  id v8 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v7);

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (TVSSVideoMicPlatterController)initWithIdentifier:(id)a3
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v31 = objc_alloc_init(&OBJC_CLASS___TVSSSensorActivityController);
  id v30 = -[TVSSVideoMicBackingStore initWithSensorActivityController:]( objc_alloc(&OBJC_CLASS___TVSSVideoMicBackingStore),  "initWithSensorActivityController:",  v31);
  id v18 = objc_alloc(&OBJC_CLASS___TVSSManualFramingView);
  [v30 zoomFactor];
  double v14 = v3;
  [v30 minAvailableVideoZoomFactor];
  double v15 = v4;
  [v30 maxAvailableVideoZoomFactor];
  double v16 = v5;
  [v30 defaultWideZoomFactor];
  double v17 = v6;
  [v30 defaultUltraWideZoomFactor];
  id v29 = -[TVSSManualFramingView initWithCurrentZoomFactor:minZoomFactor:maxZoomFactor:defaultWideZoomFactor:defaultUltraWideZoomFactor:supportsWideCamera:supportsUltraWideCamera:isUsingWideForFraming:]( v18,  "initWithCurrentZoomFactor:minZoomFactor:maxZoomFactor:defaultWideZoomFactor:defaultUltraWideZoomFactor:support sWideCamera:supportsUltraWideCamera:isUsingWideForFraming:",  (unint64_t)[v30 supportsWideCamera] & 1,  (unint64_t)objc_msgSend(v30, "supportsUltraWideCamera") & 1,  (unint64_t)objc_msgSend(v30, "isUsingWideForFraming") & 1,  v14,  v15,  v16,  v17,  v7);
  id v28 = [(id)objc_opt_class(v33) layoutFromBackingStore:v30 framingView:v29];
  id v27 = [(id)objc_opt_class(v33) renderersFromBackingStore:v30 framingView:v29];
  id v8 = v33;
  v33 = 0LL;
  v26.receiver = v8;
  v26.super_class = (Class)&OBJC_CLASS___TVSSVideoMicPlatterController;
  v33 = -[TVSSVideoMicPlatterController initWithIdentifier:layout:renderers:rendererProvider:]( &v26,  "initWithIdentifier:layout:renderers:rendererProvider:",  location[0],  v28,  v27,  &stru_1001BB4D0);
  objc_storeStrong((id *)&v33, v33);
  if (v33)
  {
    objc_storeStrong((id *)&v33->_framingView, v29);
    objc_storeStrong((id *)&v33->_backingStore, v30);
    id v9 = (BSInvalidatable *)[v30 videoPreviewStreamAssertion];
    videoPreviewAssertion = v33->_videoPreviewAssertion;
    v33->_videoPreviewAssertion = v9;

    objc_initWeak(&v25, v29);
    id v13 = v30;
    id v19 = _NSConcreteStackBlock;
    int v20 = -1073741824;
    int v21 = 0;
    v22 = sub_100112EF0;
    id v23 = &unk_1001B79B8;
    objc_copyWeak(&v24, &v25);
    [v13 setOnSampleBufferChange:&v19];
    [v30 setDelegate:v33];
    -[TVSSManualFramingView setDelegate:](v33->_framingView, "setDelegate:", v33);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v25);
  }

  id v12 = v33;
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v33, 0LL);
  return v12;
}

- (void)dealloc
{
  double v4 = self;
  SEL v3 = a2;
  -[BSInvalidatable invalidate](self->_videoPreviewAssertion, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSVideoMicPlatterController;
  -[TVSSVideoMicPlatterController dealloc](&v2, "dealloc");
}

- (id)contextMenuConfigurationForRenderer:(id)a3
{
  double v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] identifier];
  unsigned __int8 v5 = [v4 isEqual:@"mic_modes"];

  if ((v5 & 1) != 0)
  {
    id v12 = v14->_backingStore;
    double v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_100113130;
    id v10 = &unk_1001B9058;
    id v11 = v12;
    double v15 =  +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:]( &OBJC_CLASS___UIContextMenuConfiguration,  "configurationWithIdentifier:previewProvider:actionProvider:",  0LL,  0LL,  &v6);
    objc_storeStrong((id *)&v11, 0LL);
    objc_storeStrong((id *)&v12, 0LL);
  }

  else
  {
    double v15 = 0LL;
  }

  objc_storeStrong(location, 0LL);
  return v15;
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  v8.receiver = v11;
  v8.super_class = (Class)&OBJC_CLASS___TVSSVideoMicPlatterController;
  -[TVSSVideoMicPlatterController rendererWasSelected:context:](&v8, "rendererWasSelected:context:", location[0], v9);
  id v7 = [location[0] identifier];
  if ([v7 isEqual:@"connected_camera"])
  {
    -[TVSSVideoMicPlatterController presentCameraPickerIfNecessary](v11, "presentCameraPickerIfNecessary");
  }

  else
  {
    id v4 = -[TVSSVideoMicBackingStore videoEffects](v11->_backingStore, "videoEffects");
    id v6 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v7);

    if (v6) {
      -[TVSSVideoMicBackingStore toggleVideoEffect:](v11->_backingStore, "toggleVideoEffect:", v6);
    }
    objc_storeStrong(&v6, 0LL);
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)reloadPlatter
{
  id v27 = self;
  SEL v26 = a2;
  framingView = self->_framingView;
  -[TVSSVideoMicBackingStore zoomFactor](self->_backingStore, "zoomFactor");
  double v16 = v2;
  -[TVSSVideoMicBackingStore minAvailableVideoZoomFactor](v27->_backingStore, "minAvailableVideoZoomFactor");
  double v15 = v3;
  -[TVSSVideoMicBackingStore maxAvailableVideoZoomFactor](v27->_backingStore, "maxAvailableVideoZoomFactor");
  -[TVSSManualFramingView setZoomFactor:minZoomFactor:maxZoomFactor:]( framingView,  "setZoomFactor:minZoomFactor:maxZoomFactor:",  v16,  v15,  v4);
  -[TVSSManualFramingView setUsingWideForFraming:]( v27->_framingView,  "setUsingWideForFraming:",  -[TVSSVideoMicBackingStore isUsingWideForFraming](v27->_backingStore, "isUsingWideForFraming"));
  id v18 = -[TVSSVideoMicBackingStore videoEffects](v27->_backingStore, "videoEffects");
  id v17 =  -[NSDictionary objectForKeyedSubscript:]( v18,  "objectForKeyedSubscript:",  AVControlCenterVideoEffectCenterStage);
  unsigned __int8 v19 = [v17 isEnabled];

  char v25 = v19 & 1;
  char v24 = -[TVSSVideoMicBackingStore isDockKitEnabled](v27->_backingStore, "isDockKitEnabled");
  char v23 = -[TVSSVideoMicBackingStore isManualFramingSupported](v27->_backingStore, "isManualFramingSupported");
  char v20 = 1;
  if ((v19 & 1) == 0)
  {
    char v20 = 1;
    if ((v24 & 1) == 0) {
      char v20 = v23 ^ 1;
    }
  }

  -[TVSSManualFramingView setManualFramingControlsHidden:]( v27->_framingView,  "setManualFramingControlsHidden:",  v20 & 1);
  v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned __int8 v5 = (void *)objc_opt_class(v27);
  id v8 = [v5 connectedContinuityCameraContentFromBackingStore:v27->_backingStore];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:");

  id v6 = (void *)objc_opt_class(v27);
  id v9 = [v6 enabledMicModeContentFromBackingStore:v27->_backingStore];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:");

  id v10 = v22;
  id v11 = -[TVSSVideoMicBackingStore videoEffects](v27->_backingStore, "videoEffects");
  -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:");

  id v21 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
  -[TVSSVideoMicPlatterController applyContent:](v27, "applyContent:", v22);
  id v12 = v27;
  id v7 = (void *)objc_opt_class(v27);
  id v13 = [v7 layoutFromBackingStore:v27->_backingStore framingView:v27->_framingView];
  -[TVSSVideoMicPlatterController applyLayout:animator:](v12, "applyLayout:animator:");

  -[TVSSVideoMicPlatterController _updatePlatterSizeWithAnimator:](v27, "_updatePlatterSizeWithAnimator:", v21);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong((id *)&v22, 0LL);
}

- (void)presentCameraPickerIfNecessary
{
  v7[2] = self;
  v7[1] = (id)a2;
  id v4 = -[TVSSVideoMicPlatterController contentView](self, "contentView");
  id v3 = [v4 window];
  v7[0] = [v3 rootViewController];

  id v6 = [v7[0] presentedViewController];
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___AVContinuityDevicePickerViewController);
  if ((objc_opt_isKindOfClass(v6, v2) & 1) == 0)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___AVContinuityDevicePickerViewController);
    [v7[0] presentViewController:v5 animated:1 completion:&stru_1001BB4F0];
    objc_storeStrong(&v5, 0LL);
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(v7, 0LL);
}

  ;
}

- (void)videoMicBackingStoreDidChange:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSVideoMicPlatterController reloadPlatter](v5, "reloadPlatter");
  -[TVSSManualFramingView toggleTransform:]( v5->_framingView,  "toggleTransform:",  (unint64_t)[location[0] shouldApplyTransform] & 1);
  if (([location[0] isContinuityCameraConnected] & 1) == 0)
  {
    id v3 = -[TVSSVideoMicPlatterController currentHostingContext](v5, "currentHostingContext");
    [v3 dismissSystemMenuWithSourceIdentifier:@"laguna_session_drop"];
  }

  objc_storeStrong(location, 0LL);
}

- (void)continuityDevicePickerDidEndPresenting:(id)a3 error:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  if (!v5) {
    -[TVSSVideoMicPlatterController reloadPlatter](v7, "reloadPlatter");
  }
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)manualFramingViewDidTriggerOneShotFraming
{
}

- (void)manualFramingViewDidChangeLensSelection:(BOOL)a3
{
}

- (void)manualFramingViewDidChangeZoomFactor:(double)a3
{
  if (a3 > 0.0) {
    -[TVSSVideoMicBackingStore setZoomFactor:](self->_backingStore, "setZoomFactor:", a3);
  }
}

- (void)didUpdateFocusOnZoomControl:(BOOL)a3
{
}

- (TVSSVideoMicBackingStore)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
}

- (BSInvalidatable)videoPreviewAssertion
{
  return self->_videoPreviewAssertion;
}

- (void)setVideoPreviewAssertion:(id)a3
{
}

- (TVSSManualFramingView)framingView
{
  return self->_framingView;
}

- (void)setFramingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end