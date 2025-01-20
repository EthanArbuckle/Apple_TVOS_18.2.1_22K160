@interface XBLaunchImageContextWrapper
+ (id)contextWrapperForApplicationWithCompatibilityInfo:(id)a3 launchRequest:(id)a4 captureOptions:(int64_t)a5;
- (BOOL)_verifyMemoryImpactOfViewHierarchy:(id)a3 bundleID:(id)a4 size:(unint64_t *)a5 error:(id *)a6;
- (UIViewController)rootViewController;
- (XBApplicationLaunchCompatibilityInfo)appInfo;
- (XBLaunchCaptureInformation)captureInformation;
- (XBLaunchImageContextWrapper)initWithApplicationCompatibilityInfo:(id)a3 launchRequest:(id)a4 captureOptions:(int64_t)a5;
- (XBLaunchImageError)error;
- (XBLaunchInterface)launchInterface;
- (XBLaunchStateRequest)launchRequest;
- (_XBWrapperWindow)wrapperWindow;
- (id)_errorForParsingException:(id)a3 bundleID:(id)a4;
- (id)_ioSurfaceForLayerContents:(void *)a3;
- (id)_parseInterfaceConfiguration:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6;
- (id)_parseInterfaceWithNibName:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6;
- (id)_parseInterfaceWithStoryboardName:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6;
- (id)_parseLaunchInterface:(id)a3 bundle:(id)a4 bundlePath:(id)a5 bundleID:(id)a6 error:(id *)a7;
- (unint64_t)_estimatedMemorySizeOfViewHierarchy:(id)a3;
- (unsigned)contextID;
- (void)_configureNewWindow;
- (void)_configureRootViewForRTL:(id)a3 bundle:(id)a4;
- (void)_update;
- (void)invalidate;
- (void)setAppInfo:(id)a3;
- (void)setCaptureInformation:(id)a3;
- (void)setLaunchRequest:(id)a3;
- (void)setWrapperWindow:(id)a3;
- (void)updateLaunchRequest:(id)a3;
@end

@implementation XBLaunchImageContextWrapper

+ (id)contextWrapperForApplicationWithCompatibilityInfo:(id)a3 launchRequest:(id)a4 captureOptions:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithApplicationCompatibilityInfo:v9 launchRequest:v8 captureOptions:a5];

  return v10;
}

- (XBLaunchImageContextWrapper)initWithApplicationCompatibilityInfo:(id)a3 launchRequest:(id)a4 captureOptions:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___XBLaunchImageContextWrapper;
  v11 = -[XBLaunchImageContextWrapper init](&v26, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appInfo, a3);
    objc_storeStrong((id *)&v12->_launchRequest, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 launchInterfaceIdentifier]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 launchInterfaceWithIdentifier:v13]);
    launchInterface = v12->_launchInterface;
    v12->_launchInterface = (XBLaunchInterface *)v14;

    v12->_int64_t captureOptions = a5;
    if (a5)
    {
      v16 = objc_alloc_init(&OBJC_CLASS___XBLaunchCaptureInformation);
      captureInformation = v12->_captureInformation;
      v12->_captureInformation = v16;
    }

    id v18 = sub_1000028A8();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](v12->_appInfo, "bundleIdentifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v10 launchInterfaceIdentifier]);
      v22 = v12->_launchInterface;
      int64_t captureOptions = v12->_captureOptions;
      launchRequest = v12->_launchRequest;
      *(_DWORD *)buf = 138544386;
      v28 = v20;
      __int16 v29 = 2114;
      v30 = v21;
      __int16 v31 = 2114;
      v32 = v22;
      __int16 v33 = 2048;
      int64_t v34 = captureOptions;
      __int16 v35 = 2114;
      v36 = launchRequest;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "[%{public}@] XBLaunchImageContextWrapper configuring with\n launchInterfaceIdentifier: %{public}@\n launchInterface: %{public}@\n captureOptions: %ld\n launchRequest: %{public}@",  buf,  0x34u);
    }

    -[XBLaunchImageContextWrapper _configureNewWindow](v12, "_configureNewWindow");
  }

  return v12;
}

- (unsigned)contextID
{
  wrapperWindow = self->_wrapperWindow;
  if (wrapperWindow) {
    return -[_XBWrapperWindow _contextId](wrapperWindow, "_contextId");
  }
  else {
    return XBInvalidContextId;
  }
}

- (id)_errorForParsingException:(id)a3 bundleID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  unsigned int v8 = [v7 isEqualToString:@"UIWindowRestrictedSplashboardViewException"];
  id v9 = objc_alloc(&OBJC_CLASS___XBLaunchImageError);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);

  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Exception thrown attempting to load a storyboard using a restricted view class: %@",  v10));
    v12 = v9;
    uint64_t v13 = 5LL;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Exception thrown during load: %@",  v10));
    v12 = v9;
    uint64_t v13 = 2LL;
  }

  uint64_t v14 = -[XBLaunchImageError initWithCode:bundleID:reason:fatal:]( v12,  "initWithCode:bundleID:reason:fatal:",  v13,  v5,  v11,  0LL);

  return v14;
}

- (id)_parseInterfaceWithStoryboardName:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIStoryboard storyboardWithName:bundle:]( &OBJC_CLASS___UIStoryboard,  "storyboardWithName:bundle:",  v9,  v10));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 instantiateInitialViewController]);

  if (a6 && !v13 && !*a6)
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___XBLaunchImageError);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not load any content for the interface named %@.",  v9));
    *a6 =  -[XBLaunchImageError initWithCode:bundleID:reason:fatal:]( v14,  "initWithCode:bundleID:reason:fatal:",  3LL,  v11,  v15,  0LL);
  }

  return v13;
}

- (id)_parseInterfaceWithNibName:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v26 = a5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](&OBJC_CLASS___UINib, "nibWithNibName:bundle:", v9, v10));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v25 instantiateWithOwner:0 options:0]);
  v12 = (UIViewController *)[v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    while (2)
    {
      for (i = 0LL; i != v12; i = (UIViewController *)((char *)i + 1))
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___UIWindow);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          id v17 = sub_1000028A8();
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
            sub_100006F08(v19, buf, &v33, v18);
          }
        }

        else
        {
          uint64_t v20 = objc_opt_class(&OBJC_CLASS___UIViewController);
          if ((objc_opt_isKindOfClass(v15, v20) & 1) != 0)
          {
            v12 = v15;
            goto LABEL_17;
          }

          uint64_t v21 = objc_opt_class(&OBJC_CLASS___UIView);
          if ((objc_opt_isKindOfClass(v15, v21) & 1) != 0)
          {
            v12 = objc_alloc_init(&OBJC_CLASS___UIViewController);
            -[UIViewController setView:](v12, "setView:", v15);
            goto LABEL_17;
          }
        }
      }

      v12 = (UIViewController *)[v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

- (id)_parseInterfaceConfiguration:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v51 = a4;
  id v48 = a5;
  v50 = objc_alloc_init(&OBJC_CLASS___UIViewController);
  id v9 = objc_alloc_init(&OBJC_CLASS___UIView);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 colorName]);

  if (v10
    && (id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 colorName]),
        v49 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIColor,  "colorNamed:inBundle:compatibleWithTraitCollection:",  v11,  v51,  0LL)),  v11,  (v12 = v49) != 0LL))
  {
    int v13 = 0;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](&OBJC_CLASS___UIColor, "systemBackgroundColor"));
    v49 = 0LL;
    int v13 = 1;
  }

  -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v12);
  if (v13) {

  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 imageName]);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 imageName]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  v15,  v51,  0LL));

    if (v16)
    {
      id v17 = objc_alloc_init(&OBJC_CLASS___XBUpdatingImageView);
      -[UIView addSubview:](v9, "addSubview:", v17);
      if ([v8 imageRespectsSafeAreaInsets])
      {
        -[XBUpdatingImageView setTranslatesAutoresizingMaskIntoConstraints:]( v17,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](v9, "safeAreaLayoutGuide"));
        v46 = (void *)objc_claimAutoreleasedReturnValue([v47 leadingAnchor]);
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[XBUpdatingImageView leadingAnchor](v17, "leadingAnchor"));
        v44 = (void *)objc_claimAutoreleasedReturnValue([v46 constraintEqualToAnchor:v45]);
        v52[0] = v44;
        v43 = (void *)objc_claimAutoreleasedReturnValue([v47 trailingAnchor]);
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[XBUpdatingImageView trailingAnchor](v17, "trailingAnchor"));
        v41 = (void *)objc_claimAutoreleasedReturnValue([v43 constraintEqualToAnchor:v42]);
        v52[1] = v41;
        v40 = (void *)objc_claimAutoreleasedReturnValue([v47 topAnchor]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[XBUpdatingImageView topAnchor](v17, "topAnchor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToAnchor:v18]);
        v52[2] = v19;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v47 bottomAnchor]);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[XBUpdatingImageView bottomAnchor](v17, "bottomAnchor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21]);
        v52[3] = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 4LL));
        +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v23);
      }

      else
      {
        -[XBUpdatingImageView setAutoresizingMask:](v17, "setAutoresizingMask:", 18LL);
      }

      -[XBUpdatingImageView setImage:](v17, "setImage:", v16);
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v8 bars]);
  unsigned int v25 = [v24 containsObject:XBLaunchConfigurationToolbarKey];

  if (v25)
  {
    id v26 = objc_alloc_init(&OBJC_CLASS___UIToolbar);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v8 toolbarImageName]);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  v27,  v51,  0LL));

    __int128 v29 = -[XBViewMatchingImageView initWithMatchingView:image:bottom:]( objc_alloc(&OBJC_CLASS___XBViewMatchingImageView),  "initWithMatchingView:image:bottom:",  v26,  v28,  1LL);
    -[XBViewMatchingImageView setAutoresizingMask:](v29, "setAutoresizingMask:", 18LL);
    -[UIView addSubview:](v9, "addSubview:", v29);
  }

  else
  {
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v8 bars]);
    unsigned int v31 = [v30 containsObject:XBLaunchConfigurationTabBarKey];

    if (!v31) {
      goto LABEL_19;
    }
    id v26 = objc_alloc_init(&OBJC_CLASS___UITabBar);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v8 tabBarImageName]);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  v32,  v51,  0LL));

    __int128 v29 = -[XBViewMatchingImageView initWithMatchingView:image:bottom:]( objc_alloc(&OBJC_CLASS___XBViewMatchingImageView),  "initWithMatchingView:image:bottom:",  v26,  v28,  1LL);
    -[XBViewMatchingImageView setAutoresizingMask:](v29, "setAutoresizingMask:", 18LL);
    -[UIView addSubview:](v9, "addSubview:", v29);
  }

LABEL_19:
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v8 bars]);
  unsigned int v34 = [v33 containsObject:XBLaunchConfigurationNavigationBarKey];

  if (v34)
  {
    __int16 v35 = objc_alloc_init(&OBJC_CLASS___UINavigationBar);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v8 navigationBarImageName]);
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  v36,  v51,  0LL));

    v38 = -[XBViewMatchingImageView initWithMatchingView:image:bottom:]( objc_alloc(&OBJC_CLASS___XBViewMatchingImageView),  "initWithMatchingView:image:bottom:",  v35,  v37,  0LL);
    -[XBViewMatchingImageView setAutoresizingMask:](v38, "setAutoresizingMask:", 18LL);
    -[UIView addSubview:](v9, "addSubview:", v38);
  }

  -[UIViewController setView:](v50, "setView:", v9);

  return v50;
}

- (id)_parseLaunchInterface:(id)a3 bundle:(id)a4 bundlePath:(id)a5 bundleID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v13)
  {
    id v20 = sub_1000028A8();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100006F60();
    }

    if (a7)
    {
      v22 = objc_alloc(&OBJC_CLASS___XBLaunchImageError);
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to construct NSBundle for %@ at %@.",  v15,  v14));
      *a7 =  -[XBLaunchImageError initWithCode:bundleID:reason:fatal:]( v22,  "initWithCode:bundleID:reason:fatal:",  4LL,  v15,  v23,  0LL);
    }

- (void)_configureRootViewForRTL:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v11 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle localizations](self->_bundle, "localizations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v6,  v7));

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
    NSWritingDirection v10 = +[NSParagraphStyle defaultWritingDirectionForLanguage:]( &OBJC_CLASS___NSParagraphStyle,  "defaultWritingDirectionForLanguage:",  v9);

    if (v10 == NSWritingDirectionRightToLeft) {
      sub_100003D48(v11);
    }

    id v5 = v11;
  }
}

- (BOOL)_verifyMemoryImpactOfViewHierarchy:(id)a3 bundleID:(id)a4 size:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  [v11 setNeedsLayout];
  [v11 layoutIfNeeded];
  unint64_t v12 = -[XBLaunchImageContextWrapper _estimatedMemorySizeOfViewHierarchy:]( self,  "_estimatedMemorySizeOfViewHierarchy:",  v11);

  if (a5) {
    *a5 = v12;
  }
  id v13 = sub_1000026E8();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1000070C0();
  }

  if (v12 >= 0x17D7840)
  {
    int IsEnabled = _XBDebugCaptureIsEnabled();
    if (!IsEnabled)
    {
      if (a6)
      {
        id v18 = objc_alloc(&OBJC_CLASS___XBLaunchImageError);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] Estimated size (%zu) is over limit (%zu)",  v10,  v12,  25000000LL));
        *a6 =  -[XBLaunchImageError initWithCode:bundleID:reason:fatal:]( v18,  "initWithCode:bundleID:reason:fatal:",  6LL,  v10,  v19,  0LL);
      }

      id v20 = sub_1000026E8();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_signpost_enabled(v17))
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
        *(_DWORD *)buf = 138543874;
        v24 = v21;
        __int16 v25 = 2050;
        unint64_t v26 = v12;
        __int16 v27 = 2050;
        uint64_t v28 = 25000000LL;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "OverMemoryLimit",  "BundleIdOverride=%{public, signpost.description:attribute}@ estimate=%{signpost.telemetry:number1, public}zu l imit=%{signpost.telemetry:number2, public}zu enableTelemetry=YES ",  buf,  0x20u);
      }

      goto LABEL_15;
    }

    if (v12 > 0x17D7840)
    {
      id v16 = sub_1000026E8();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_10000703C();
      }
LABEL_15:

      goto LABEL_16;
    }
  }

  LOBYTE(IsEnabled) = 1;
LABEL_16:

  return IsEnabled;
}

- (void)_configureNewWindow
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v37 = _NSFullMethodName(self, a2);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    [v36 handleFailureInMethod:a2, self, @"XBLaunchImageContextWrapper.m", 403, @"%@ must be called on the main thread", v38 object file lineNumber description];
  }

  v4 = objc_autoreleasePoolPush();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v5 _setUIIBAlwaysProvidePeripheryInsets:1];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundlePath](self->_appInfo, "bundlePath"));
  v7 = (NSBundle *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v6));
  bundle = self->_bundle;
  self->_bundle = v7;

  launchInterface = self->_launchInterface;
  id v10 = self->_bundle;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
  id v40 = 0LL;
  unint64_t v12 = (UIViewController *)objc_claimAutoreleasedReturnValue( -[XBLaunchImageContextWrapper _parseLaunchInterface:bundle:bundlePath:bundleID:error:]( self,  "_parseLaunchInterface:bundle:bundlePath:bundleID:error:",  launchInterface,  v10,  v6,  v11,  &v40));
  id v13 = v40;
  rootViewController = self->_rootViewController;
  self->_rootViewController = v12;

  id v15 = self->_rootViewController;
  if (v15 && !v13)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v15, "view"));
    id v17 = sub_1000026E8();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
      __int16 v35 = self->_rootViewController;
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v34;
      __int16 v42 = 2112;
      v43 = v35;
      __int16 v44 = 2112;
      v45 = v16;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "[%@] rootViewController: %@; rootView: %@",
        buf,
        0x20u);
    }

    -[XBLaunchImageContextWrapper _configureRootViewForRTL:bundle:]( self,  "_configureRootViewForRTL:bundle:",  v16,  self->_bundle);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
    id v39 = 0LL;
    unsigned int v20 = -[XBLaunchImageContextWrapper _verifyMemoryImpactOfViewHierarchy:bundleID:size:error:]( self,  "_verifyMemoryImpactOfViewHierarchy:bundleID:size:error:",  v16,  v19,  buf,  &v39);
    id v13 = v39;

    if (v20)
    {
      uint64_t v21 = objc_alloc(&OBJC_CLASS____XBWrapperWindow);
      BSRectWithSize(-[XBLaunchStateRequest naturalSize](self->_launchRequest, "naturalSize"));
      v22 = -[_XBWrapperWindow initWithFrame:](v21, "initWithFrame:");
      wrapperWindow = self->_wrapperWindow;
      self->_wrapperWindow = v22;

      v24 = self->_wrapperWindow;
      uint64_t v25 = -[XBApplicationLaunchCompatibilityInfo launchesOpaque](self->_appInfo, "launchesOpaque")
          ? objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"))
          : objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      unint64_t v26 = (void *)v25;
      -[_XBWrapperWindow setBackgroundColor:](v24, "setBackgroundColor:", v25);

      -[_XBWrapperWindow setRootViewController:]( self->_wrapperWindow,  "setRootViewController:",  self->_rootViewController);
      -[XBLaunchImageContextWrapper _update](self, "_update");
      if ((self->_captureOptions & 1) != 0) {
        -[XBLaunchCaptureInformation setEstimatedMemoryImpact:]( self->_captureInformation,  "setEstimatedMemoryImpact:",  *(void *)buf);
      }
    }
  }

  if (v13)
  {
    objc_storeStrong((id *)&self->_error, v13);
    unsigned int v27 = [v13 isFatal];
    uint64_t v28 = @"Error";
    if (v27) {
      uint64_t v28 = @"Fatal error";
    }
    __int128 v29 = v28;
    id v30 = sub_1000028A8();
    unsigned int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = (UIViewController *)objc_claimAutoreleasedReturnValue( -[XBApplicationLaunchCompatibilityInfo bundleIdentifier]( self->_appInfo,  "bundleIdentifier"));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v13 succinctDescription]);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v29;
      __int16 v42 = 2114;
      v43 = v32;
      __int16 v44 = 2114;
      v45 = v33;
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%{public}@ generating launch image for %{public}@: %{public}@",  buf,  0x20u);
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (void)_update
{
  v3 = objc_autoreleasePoolPush();
  id v4 = sub_1000028A8();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    launchRequest = self->_launchRequest;
    *(_DWORD *)buf = 138543362;
    id v40 = launchRequest;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating window to %{public}@", buf, 0xCu);
  }

  id v7 = -[XBLaunchStateRequest interfaceOrientation](self->_launchRequest, "interfaceOrientation");
  double v8 = BSRectWithSize(-[XBLaunchStateRequest naturalSize](self->_launchRequest, "naturalSize"));
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = -[XBLaunchStateRequest userInterfaceStyle](self->_launchRequest, "userInterfaceStyle");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[_XBWrapperWindow screen](self->_wrapperWindow, "screen"));
  [v16 _updateUserInterfaceIdiom];
  [v16 _setInterfaceOrientation:v7];
  _UIAppSetStatusBarOrientation(v7);
  uint64_t v17 = sub_100002B90((uint64_t)-[XBLaunchStateRequest statusBarState](self->_launchRequest, "statusBarState"));
  _UIAppSetStatusBarHeight(v17);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "_launchImageTraitCollectionForInterfaceOrientation:inBounds:",  v7,  v8,  v10,  v12,  v14));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithUserInterfaceIdiom:]( UITraitCollection,  "traitCollectionWithUserInterfaceIdiom:",  [v16 _userInterfaceIdiom]));
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  v15));
  wrapperWindow = self->_wrapperWindow;
  v38[0] = v18;
  v38[1] = v19;
  v38[2] = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 3LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithTraitsFromCollections:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithTraitsFromCollections:",  v22));
  -[_XBWrapperWindow _setLocalOverrideTraitCollection:](wrapperWindow, "_setLocalOverrideTraitCollection:", v23);

  -[_XBWrapperWindow _setWindowInterfaceOrientation:](self->_wrapperWindow, "_setWindowInterfaceOrientation:", v7);
  -[_XBWrapperWindow _setRotatableViewOrientation:updateStatusBar:duration:force:]( self->_wrapperWindow,  "_setRotatableViewOrientation:updateStatusBar:duration:force:",  v7,  0LL,  0LL,  0.0);
  v24 = self->_wrapperWindow;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchStateRequest customSafeAreaInsets](self->_launchRequest, "customSafeAreaInsets"));
  -[_XBWrapperWindow _setCustomSafeAreaInsets:](v24, "_setCustomSafeAreaInsets:", v25);

  -[_XBWrapperWindow setHidden:](self->_wrapperWindow, "setHidden:", 0LL);
  -[_XBWrapperWindow setFrame:](self->_wrapperWindow, "setFrame:", v8, v10, v12, v14);
  unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_rootViewController, "view"));
  -[_XBWrapperWindow bounds](self->_wrapperWindow, "bounds");
  objc_msgSend(v26, "setFrame:");

  -[_XBWrapperWindow setNeedsUpdateConstraints](self->_wrapperWindow, "setNeedsUpdateConstraints");
  -[_XBWrapperWindow setNeedsLayout](self->_wrapperWindow, "setNeedsLayout");
  -[_XBWrapperWindow layoutIfNeeded](self->_wrapperWindow, "layoutIfNeeded");
  -[_XBWrapperWindow setNeedsDisplay](self->_wrapperWindow, "setNeedsDisplay");
  id v27 = sub_1000028A8();
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Updated window", buf, 2u);
  }

  +[CATransaction flush](&OBJC_CLASS___CATransaction, "flush");
  +[CATransaction synchronize](&OBJC_CLASS___CATransaction, "synchronize");
  int64_t captureOptions = self->_captureOptions;
  uint64_t v30 = -[XBLaunchImageContextWrapper contextID](self, "contextID");
  appInfo = self->_appInfo;
  v32 = self->_launchRequest;
  launchInterface = self->_launchInterface;
  uint64_t v33 = self->_wrapperWindow;
  if ((captureOptions & 2) != 0)
  {
    id v37 = 0LL;
    _XBPreparedLaunchInterfaceForCapture(v30, v33, appInfo, v32, launchInterface, &v37);
    id v35 = v37;
    if (v35)
    {
      v36 = v35;
      -[XBLaunchCaptureInformation setCaarFilePath:](self->_captureInformation, "setCaarFilePath:", v35);
    }
  }

  else
  {
    _XBPreparedLaunchInterfaceForCapture(v30, v33, appInfo, v32, launchInterface, 0LL);
  }

  objc_autoreleasePoolPop(v3);
}

- (id)_ioSurfaceForLayerContents:(void *)a3
{
  CFTypeID v4 = CFGetTypeID(a3);
  if (v4 == CGImageGetTypeID())
  {
    uint64_t ImageProvider = CGImageGetImageProvider(a3);
    id v6 = (void *)CGImageProviderCopyIOSurface(ImageProvider, 0LL);
  }

  else if (v4 == IOSurfaceGetTypeID())
  {
    id v6 = a3;
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (unint64_t)_estimatedMemorySizeOfViewHierarchy:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contents]);
  if (!v6)
  {
    id v14 = sub_1000026E8();
    id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___UIImageView);
      char isKindOfClass = objc_opt_isKindOfClass(v4, v16);

      if ((isKindOfClass & 1) == 0)
      {
LABEL_16:
        unint64_t v11 = 0LL;
        goto LABEL_30;
      }

      [v4 bounds];
      unint64_t v11 = 0LL;
      if (v19 <= 0.0 || v18 <= 0.0) {
        goto LABEL_30;
      }
      id v15 = v4;
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v15 image]);
      if (v20)
      {
        id v21 = sub_1000026E8();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
          *(_DWORD *)buf = 138543874;
          uint64_t v54 = (uint64_t)v46;
          __int16 v55 = 2114;
          size_t v56 = (size_t)v15;
          __int16 v57 = 2114;
          size_t v58 = (size_t)v20;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "[%{public}@] found UIImageView with no contents, but has image: %{public}@ %{public}@",  buf,  0x20u);
        }
      }
    }

    goto LABEL_16;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchImageContextWrapper _ioSurfaceForLayerContents:](self, "_ioSurfaceForLayerContents:", v6));
  double v8 = v7;
  if (v7)
  {
    id v9 = [v7 width];
    id v10 = [v8 height];
    unint64_t v11 = (unint64_t)[v8 allocationSize];
    id v12 = sub_1000026E8();
    double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __int16 v44 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
      *(_DWORD *)buf = 138544642;
      uint64_t v54 = (uint64_t)v44;
      __int16 v55 = 2048;
      size_t v56 = (size_t)v9;
      __int16 v57 = 2048;
      size_t v58 = (size_t)v10;
      __int16 v59 = 2048;
      unint64_t v60 = v11;
      __int16 v61 = 2114;
      id v62 = v4;
      __int16 v63 = 2114;
      v64 = v5;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "[%{public}@] found IOSurface in layer hierarchy; size: {%zu, %zu}; allocSize: %zu; view: %{public}@; layer: %{public}@",
        buf,
        0x3Eu);
    }
  }

  else
  {
    CFTypeID v23 = CFGetTypeID(v6);
    if (v23 == CGImageGetTypeID())
    {
      size_t Width = CGImageGetWidth((CGImageRef)v6);
      size_t Height = CGImageGetHeight((CGImageRef)v6);
      size_t BitsPerPixel = CGImageGetBitsPerPixel((CGImageRef)v6);
      size_t BytesPerRow = CGImageGetBytesPerRow((CGImageRef)v6);
      if (CGImageGetAlphaInfo((CGImageRef)v6) == kCGImageAlphaOnly)
      {
        id v28 = sub_1000026E8();
        __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v30 = objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
          size_t v31 = BitsPerPixel >> 3;
          *(_DWORD *)buf = 138543874;
          uint64_t v54 = v30;
          v32 = (void *)v30;
          __int16 v55 = 2048;
          size_t v56 = v31;
          __int16 v57 = 2048;
          size_t v58 = BytesPerRow;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "[%{public}@] found CGImage that's alpha only. Trusting %zu bytes per pixel and %zu bytes per row",  buf,  0x20u);
        }
      }

      else
      {
        unint64_t v33 = BitsPerPixel >> 3;
        uint64_t v34 = 4LL;
        if (v33 > 4) {
          uint64_t v34 = v33;
        }
        size_t BytesPerRow = v34 * Width;
        id v35 = sub_1000026E8();
        __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
          *(_DWORD *)buf = 138543874;
          uint64_t v54 = (uint64_t)v47;
          __int16 v55 = 2048;
          size_t v56 = v33;
          __int16 v57 = 2048;
          size_t v58 = BytesPerRow;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "[%{public}@] found CGImage that's NOT alpha only. Taking MAX(4, %zu) bytes per pixel to calculate %zu bytes per row",  buf,  0x20u);
        }
      }

      id v36 = sub_1000026E8();
      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
        *(_DWORD *)buf = 138544642;
        uint64_t v54 = (uint64_t)v45;
        __int16 v55 = 2048;
        size_t v56 = Width;
        __int16 v57 = 2048;
        size_t v58 = Height;
        __int16 v59 = 2048;
        unint64_t v60 = BytesPerRow;
        __int16 v61 = 2114;
        id v62 = v4;
        __int16 v63 = 2114;
        v64 = v5;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "[%{public}@] found CGImage in layer hierarchy; size: {%zu, %zu}; bytesPerRow: %zu; view: %{public}@; layer: %{public}@",
          buf,
          0x3Eu);
      }

      unint64_t v11 = BytesPerRow * Height;
    }

    else
    {
      unint64_t v11 = 0LL;
    }
  }

LABEL_30:
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  v38 = (void *)objc_claimAutoreleasedReturnValue([v4 subviews]);
  id v39 = [v38 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v49 != v41) {
          objc_enumerationMutation(v38);
        }
        v11 += -[XBLaunchImageContextWrapper _estimatedMemorySizeOfViewHierarchy:]( self,  "_estimatedMemorySizeOfViewHierarchy:",  *(void *)(*((void *)&v48 + 1) + 8LL * (void)i));
      }

      id v40 = [v38 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }

    while (v40);
  }

  return v11;
}

- (void)updateLaunchRequest:(id)a3
{
  id v5 = (XBLaunchStateRequest *)a3;
  if (self->_launchRequest != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_launchRequest, a3);
    id v5 = v6;
    if (v6)
    {
      -[XBLaunchImageContextWrapper _update](self, "_update");
      id v5 = v6;
    }
  }
}

- (void)invalidate
{
  wrapperWindow = self->_wrapperWindow;
  self->_wrapperWindow = 0LL;

  rootViewController = self->_rootViewController;
  self->_rootViewController = 0LL;

  -[NSBundle unload](self->_bundle, "unload");
  bundle = self->_bundle;
  self->_bundle = 0LL;

  captureInformation = self->_captureInformation;
  self->_captureInformation = 0LL;

  self->_int64_t captureOptions = 0LL;
  +[_UIAssetManager _clearAllCachedImagesAndAssets](&OBJC_CLASS____UIAssetManager, "_clearAllCachedImagesAndAssets");
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (XBLaunchInterface)launchInterface
{
  return self->_launchInterface;
}

- (_XBWrapperWindow)wrapperWindow
{
  return self->_wrapperWindow;
}

- (void)setWrapperWindow:(id)a3
{
}

- (XBApplicationLaunchCompatibilityInfo)appInfo
{
  return self->_appInfo;
}

- (void)setAppInfo:(id)a3
{
}

- (XBLaunchStateRequest)launchRequest
{
  return self->_launchRequest;
}

- (void)setLaunchRequest:(id)a3
{
}

- (XBLaunchImageError)error
{
  return self->_error;
}

- (XBLaunchCaptureInformation)captureInformation
{
  return self->_captureInformation;
}

- (void)setCaptureInformation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end