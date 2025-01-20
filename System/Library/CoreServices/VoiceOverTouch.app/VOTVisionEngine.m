@interface VOTVisionEngine
+ (BOOL)_shouldAnalyzeElement:(id)a3 deferToMediaAnalysisElementIfNeeded:(BOOL)a4;
+ (BOOL)elementNeedsAdditionalDescription:(id)a3;
+ (BOOL)shouldAnalyzeElement:(id)a3;
- (AXMVoiceOverVisionEngine)engine;
- (BOOL)wasCachePurged;
- (VOTVisionEngine)init;
- (VOTVisionEngineResultUpdateDelegate)resultUpdateDelegate;
- (id)_renderStringToImage:(id)a3;
- (id)_visionAnalysisOptionsForElement:(id)a3 visionOptions:(id)a4;
- (id)preferredMediaAnalysisLocale;
- (id)resultsForElement:(id)a3;
- (int64_t)_interfaceOrientationForElement:(id)a3;
- (void)analyzeElement:(id)a3 withOptions:(id)a4;
- (void)dealloc;
- (void)produceCaptionForElement:(id)a3 completion:(id)a4;
- (void)purgeCache;
- (void)setEngine:(id)a3;
- (void)setResultUpdateDelegate:(id)a3;
- (void)setWasCachePurged:(BOOL)a3;
@end

@implementation VOTVisionEngine

+ (BOOL)_shouldAnalyzeElement:(id)a3 deferToMediaAnalysisElementIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((AXDeviceIsAudioAccessory(v6, v7) & 1) != 0) {
    goto LABEL_10;
  }
  unsigned int v8 = [v6 mediaAnalysisOptions];
  if ([v6 doesHaveTraits:kAXBackButtonTrait | kAXStaticTextTrait | kAXTextEntryTrait | kAXKeyboardKeyTrait | kAXAllowsDirectInteractionTrait | kAXMathEquationTrait | kAXAutoCorrectCandidateTrait | kAXTextAreaTrait | kAXMapTrait | kAXSecureTextFieldTrait | kAXWebInteractiveVideoTrait] & 1) != 0 || (objc_msgSend(v6, "isTouchContainer") & 1) != 0 || (objc_msgSend(v6, "isAccessibleGroup"))
  {
    goto LABEL_10;
  }

  if ([v6 doesHaveTraits:kAXImageTrait])
  {
LABEL_9:
    unsigned __int8 v9 = 1;
    goto LABEL_11;
  }

  if (![v6 supportsMediaAnalysis])
  {
LABEL_10:
    unsigned __int8 v9 = 0;
    goto LABEL_11;
  }

  unsigned __int8 v9 = 0;
  if (v8 && v4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaAnalysisElement]);
    v12 = v11;
    else {
      unsigned __int8 v9 = 0;
    }
  }

+ (BOOL)shouldAnalyzeElement:(id)a3
{
  return [a1 _shouldAnalyzeElement:a3 deferToMediaAnalysisElementIfNeeded:1];
}

+ (BOOL)elementNeedsAdditionalDescription:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 label]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByTrimmingCharactersInSet:v5]);

  BOOL v9 = [v6 length] == (id)1
    && (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 value]),
        id v8 = [v7 length],
        v7,
        !v8)
    && ([v6 characterAtIndex:0] - 19968) >> 9 > 0x28

  return v9;
}

- (VOTVisionEngine)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___VOTVisionEngine;
  v2 = -[VOTVisionEngine init](&v20, "init");
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___AXMVoiceOverVisionEngine);
    -[VOTVisionEngine setEngine:](v2, "setEngine:", v3);

    objc_initWeak(&location, v2);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v5 = [v4 imageCaptionGenderStrategy];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine engine](v2, "engine"));
    [v6 setGenderStrategy:v5];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000DC7C4;
    v17[3] = &unk_100176F08;
    objc_copyWeak(&v18, &location);
    id v8 = objc_loadWeakRetained(&location);
    [v7 registerUpdateBlock:v17 forRetrieveSelector:"imageCaptionGenderStrategy" withListener:v8];

    objc_destroyWeak(&v18);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v10 = off_1001ABF00;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000DC838;
    v15[3] = &unk_100179FA8;
    objc_copyWeak(&v16, &location);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 addObserverForName:v10 object:0 queue:0 usingBlock:v15]);
    id languageConfigurationObserver = v2->_languageConfigurationObserver;
    v2->_id languageConfigurationObserver = (id)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine engine](v2, "engine"));
    [v13 prewarmEngine];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  if (self->_languageConfigurationObserver)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self->_languageConfigurationObserver];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTVisionEngine;
  -[VOTVisionEngine dealloc](&v4, "dealloc");
}

- (int64_t)_interfaceOrientationForElement:(id)a3
{
  return 1LL;
}

- (id)preferredMediaAnalysisLocale
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 selectedLanguage]);

  if (![v3 length]
    || (objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXMLocSupport sharedInstance](&OBJC_CLASS___AXMLocSupport, "sharedInstance")),
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localeForLanguageCode:v3]),
        v4,
        !v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
    if ([v6 length])
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXMLocSupport sharedInstance](&OBJC_CLASS___AXMLocSupport, "sharedInstance"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 localeForLanguageCode:v6]);
    }

    else
    {
      id v5 = 0LL;
    }
  }

  return v5;
}

- (id)_visionAnalysisOptionsForElement:(id)a3 visionOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 mediaAnalysisOptions];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000DCC44;
  v30[3] = &unk_100179FD0;
  id v9 = v7;
  id v31 = v9;
  id v10 = v6;
  id v32 = v10;
  int v33 = (int)v8;
  uint64_t v11 = objc_retainBlock(v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine preferredMediaAnalysisLocale](self, "preferredMediaAnalysisLocale"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000DCCA0;
  v27[3] = &unk_10017A038;
  id v13 = v10;
  id v28 = v13;
  id v14 = v12;
  id v29 = v14;
  v15 = objc_retainBlock(v27);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine engine](self, "engine"));
  else {
    uint64_t v17 = (uint64_t)[v9 includeFullImageDescriptionsForAllElements];
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue( [v16 configuredOptionsDisableAllDetectors:v11 elementOptions:v8 textRecognitionLevel:&stru_10017A010 textDetectionLocales:v15 prefer ringFullCaptions:v17]);

  if ((_DWORD)v8) {
    id v19 = [v9 includeSceneDetection];
  }
  else {
    id v19 = 0LL;
  }
  [v18 setDetectScenes:v19];
  char v26 = 0;
  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue([v13 url]);
  BOOL v24 = 1;
  if ([v20 isFileURL])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);
    unsigned int v23 = [v21 fileExistsAtPath:v22 isDirectory:&v26];

    if (v23)
    {
      if (!v26) {
        BOOL v24 = 0;
      }
    }
  }

  [v18 setIncludeImageInResult:v24];
  [v18 setPreferredOutputLocale:v14];

  return v18;
}

- (id)_renderStringToImage:(id)a3
{
  id v3 = a3;
  v17.width = 300.0;
  v17.height = 200.0;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 1.0);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v4 setFill];

  CurrentContext = UIGraphicsGetCurrentContext();
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = 300.0;
  v18.size.height = 200.0;
  CGContextFillRect(CurrentContext, v18);
  v15[0] = NSFontAttributeName;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 220.0));
  v16[0] = v6;
  v15[1] = NSForegroundColorAttributeName;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  v16[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

  [v3 sizeWithAttributes:v8];
  objc_msgSend(v3, "drawInRect:withAttributes:", v8, v9 * -0.5 + 150.0, -28.0, 300.0, 256.0);

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  id v12 = v11;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", [v12 CGImage]));

  return v13;
}

- (void)analyzeElement:(id)a3 withOptions:(id)a4
{
  id v6 = (VOTVisionEngine *)a3;
  if (v6)
  {
    id v7 = a4;
    id v8 = (VOTVisionEngine *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine mediaAnalysisElement](v6, "mediaAnalysisElement"));
    if (!v8) {
      id v8 = v6;
    }
    double v9 = (void *)objc_claimAutoreleasedReturnValue( -[VOTVisionEngine _visionAnalysisOptionsForElement:visionOptions:]( self,  "_visionAnalysisOptionsForElement:visionOptions:",  v8,  v7));

    id v10 = (VOTVisionEngine *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine url](v8, "url"));
    int64_t v62 = -[VOTVisionEngine _interfaceOrientationForElement:](self, "_interfaceOrientationForElement:", v8);
    -[VOTVisionEngine mediaAnalysisFrame](v8, "mediaAnalysisFrame");
    CGFloat x = v80.origin.x;
    CGFloat y = v80.origin.y;
    CGFloat width = v80.size.width;
    CGFloat height = v80.size.height;
    v85.origin.CGFloat x = CGRectZero.origin.x;
    v85.origin.CGFloat y = CGRectZero.origin.y;
    v85.size.CGFloat width = CGRectZero.size.width;
    v85.size.CGFloat height = CGRectZero.size.height;
    if (CGRectEqualToRect(v80, v85)) {
      goto LABEL_6;
    }
    v81.origin.CGFloat x = x;
    v81.origin.CGFloat y = y;
    v81.size.CGFloat width = width;
    v81.size.CGFloat height = height;
    double v15 = x;
    double v16 = y;
    double v17 = width;
    double v18 = height;
    if (CGRectIsInfinite(v81))
    {
LABEL_6:
      -[VOTVisionEngine visibleFrame](v8, "visibleFrame");
      double v15 = v19;
      double v16 = v20;
      double v17 = v21;
      double v18 = v22;
    }

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine application](v8, "application"));
    id v23 = objc_msgSend(v68, "convertAccessibilityFrameToScreenCoordinates:", v15, v16, v17, v18);
    double v65 = v25;
    double v66 = v24;
    double v63 = v27;
    double v64 = v26;
    uint64_t v28 = VOTLogCommon(v23);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v82.origin.CGFloat x = x;
      v82.origin.CGFloat y = y;
      v82.size.CGFloat width = width;
      v82.size.CGFloat height = height;
      v56 = NSStringFromCGRect(v82);
      v57 = (VOTVisionEngine *)objc_claimAutoreleasedReturnValue(v56);
      v83.origin.CGFloat x = v15;
      v83.origin.CGFloat y = v16;
      v83.size.CGFloat width = v17;
      v83.size.CGFloat height = v18;
      v58 = NSStringFromCGRect(v83);
      v59 = (VOTVisionEngine *)objc_claimAutoreleasedReturnValue(v58);
      v84.origin.CGFloat y = v65;
      v84.origin.CGFloat x = v66;
      v84.size.CGFloat height = v63;
      v84.size.CGFloat width = v64;
      v60 = NSStringFromCGRect(v84);
      v61 = (VOTVisionEngine *)objc_claimAutoreleasedReturnValue(v60);
      *(_DWORD *)buf = 138413058;
      v73 = self;
      __int16 v74 = 2112;
      v75 = v57;
      __int16 v76 = 2112;
      v77 = v59;
      __int16 v78 = 2112;
      v79 = v61;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Vision analysis frame for element %@: visionAnalysis:%@ captureRegion:%@ convertedFrame:%@",  buf,  0x2Au);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 elementForAttribute:1005]);

    v67 = v31;
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 windowContextIDs]);
    int v33 = v9;
    [v9 setIgnoredLayerContextIDs:v32];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472LL;
    v71[2] = sub_1000DD510;
    v71[3] = &unk_10017A058;
    v71[4] = v34;
    v35 = objc_retainBlock(v71);
    char v70 = 0;
    unsigned int v36 = 0;
    if (-[VOTVisionEngine isFileURL](v10, "isFileURL"))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine path](v10, "path"));
      unsigned int v36 = [v37 fileExistsAtPath:v38 isDirectory:&v70];
    }

    v69 = v10;
    unsigned int v39 = -[VOTVisionEngine isPHAssetLocallyAvailable](v8, "isPHAssetLocallyAvailable");
    v40 = (VOTVisionEngine *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine imageAssetLocalIdentifier](v8, "imageAssetLocalIdentifier"));
    v41 = (VOTVisionEngine *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine photoLibraryURL](v8, "photoLibraryURL"));
    if (v39 && v40)
    {
      uint64_t v42 = AXMediaLogService();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v73 = v40;
        __int16 v74 = 2112;
        v75 = v41;
        __int16 v76 = 2112;
        v77 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "AnalyzeElement[AssetLocalIdentifier]: %@, photoLibraryURL:%@, element: %@",  buf,  0x20u);
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine engine](self, "engine"));
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 imageNode]);
      [v45 setShouldProcessRemotely:1];

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine engine](self, "engine"));
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 imageNode]);
      [v47 triggerWithImageAssetLocalIdentifier:v40 photoLibraryURL:v41 options:v33 cacheKey:v6 resultHandler:v35];
    }

    else
    {
      if (v70) {
        unsigned int v48 = 0;
      }
      else {
        unsigned int v48 = v36;
      }
      if (v48 == 1)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine engine](self, "engine"));
        v50 = (void *)objc_claimAutoreleasedReturnValue([v49 imageNode]);
        [v50 setShouldProcessRemotely:1];

        uint64_t v51 = AXMediaLogService();
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v73 = v69;
          __int16 v74 = 2112;
          v75 = v40;
          __int16 v76 = 2112;
          v77 = v41;
          __int16 v78 = 2112;
          v79 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_INFO,  "AnalyzeElement[URL]: %@, localIdentifier: %@, photoLibraryURL: %@, element: %@",  buf,  0x2Au);
        }

        v46 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine engine](self, "engine"));
        v53 = (void *)objc_claimAutoreleasedReturnValue([v46 imageNode]);
        v47 = v53;
        if (v40) {
          [v53 triggerWithImageURL:v69 assetLocalIdentifier:v40 photoLibraryURL:v41 options:v33 cacheKey:v6 resultHandler:v35];
        }
        else {
          [v53 triggerWithImageURL:v69 options:v33 cacheKey:v6 resultHandler:v35];
        }
      }

      else
      {
        uint64_t v54 = AXMediaLogService();
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v73 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_INFO,  "AnalyzeElement[ScreenCap] for element: %@",  buf,  0xCu);
        }

        v46 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine engine](self, "engine"));
        v47 = (void *)objc_claimAutoreleasedReturnValue([v46 captureNode]);
        objc_msgSend( v47,  "triggerWithScreenCaptureRegion:interfaceOrientation:options:cacheKey:resultHandler:",  v62,  v33,  v6,  v35,  v66,  v65,  v64,  v63);
      }
    }

    self->_wasCachePurged = 0;
  }
}

- (id)resultsForElement:(id)a3
{
  return +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3);
}

- (void)purgeCache
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine engine](self, "engine"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cache]);
  [v4 purgeCache];

  self->_wasCachePurged = 1;
}

- (void)produceCaptionForElement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___AXMVisionAnalysisOptions);
    [v8 setDetectCaptions:1];
    [v8 setClientID:1];
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 application]);
    int64_t v10 = -[VOTVisionEngine _interfaceOrientationForElement:](self, "_interfaceOrientationForElement:", v6);
    [v6 visibleFrame];
    objc_msgSend(v9, "convertAccessibilityFrameToScreenCoordinates:");
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 elementForAttribute:1005]);

    double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 windowContextIDs]);
    [v8 setIgnoredLayerContextIDs:v21];
    id v22 = +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v24 = v23;
    uint64_t v25 = AXMediaLogService(v22);
    double v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "ProduceCaption[ScreenCap] for element: %@",  buf,  0xCu);
    }

    double v27 = (void *)objc_claimAutoreleasedReturnValue(-[VOTVisionEngine engine](self, "engine"));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 captureNode]);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000DD94C;
    v31[3] = &unk_10017A0A8;
    uint64_t v33 = v24;
    id v32 = v7;
    objc_msgSend( v28,  "triggerWithScreenCaptureRegion:interfaceOrientation:options:cacheKey:resultHandler:",  v10,  v8,  0,  v31,  v12,  v14,  v16,  v18);
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DD8D8;
    block[3] = &unk_10017A080;
    id v35 = v7;
    dispatch_async(v30, block);

    id v8 = v35;
  }
}

- (BOOL)wasCachePurged
{
  return self->_wasCachePurged;
}

- (void)setWasCachePurged:(BOOL)a3
{
  self->_wasCachePurged = a3;
}

- (VOTVisionEngineResultUpdateDelegate)resultUpdateDelegate
{
  return (VOTVisionEngineResultUpdateDelegate *)objc_loadWeakRetained((id *)&self->_resultUpdateDelegate);
}

- (void)setResultUpdateDelegate:(id)a3
{
}

- (AXMVoiceOverVisionEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end