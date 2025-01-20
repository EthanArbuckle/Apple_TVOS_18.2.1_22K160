@interface TVSSFaceTimeMenuItemProvider
- (BOOL)_isSharePlayIconForState:(id)a3;
- (BOOL)shouldShowMenuItem;
- (BOOL)updateVisualContentForMenuItem:(id)a3;
- (NSString)cachedPlatterState;
- (TVSSFaceTimePlatterBackingStore)backingStore;
- (TVSSMenuModeStateContributingDelegate)contributorDelegate;
- (id)_currentItemContent;
- (id)initForPrivacyPlus:(BOOL)a3;
- (id)log;
- (id)newMenuItem;
- (id)stateDumpBuilder;
- (void)dealloc;
- (void)faceTimePlatterBackingStoreDidChange:(id)a3;
- (void)setCachedPlatterState:(id)a3;
- (void)setContributorDelegate:(id)a3;
- (void)updateFromPlatterState:(id)a3;
- (void)updateMenuModeState:(id)a3;
@end

@implementation TVSSFaceTimeMenuItemProvider

- (id)initForPrivacyPlus:(BOOL)a3
{
  SEL v24 = a2;
  BOOL v23 = a3;
  v25 = 0LL;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVSSFaceTimeMenuItemProvider;
  v25 = -[TVSSMenuItemProvider initWithIdentifier:](&v22, "initWithIdentifier:", TVSPFaceTimeMenuItemProviderIdentifier);
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    v25->_privacyPlusMode = v23;
    id v21 = objc_alloc_init(&OBJC_CLASS___TVSSFaceTimePlatterBackingStore);
    objc_storeStrong((id *)&v25->_backingStore, v21);
    v3 = (NSString *)[v21 platterState];
    cachedPlatterState = v25->_cachedPlatterState;
    v25->_cachedPlatterState = v3;

    -[TVSSFaceTimePlatterBackingStore setDelegate:](v25->_backingStore, "setDelegate:", v25);
    -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v25, "updateMenuItemWithReason:", @"Initial Update");
    objc_initWeak(&from, v25);
    aClass = (objc_class *)objc_opt_class(v25);
    v11 = NSStringFromClass(aClass);
    id v19 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TVSystemUIService - %@",  v11);

    v9 = &_dispatch_main_q;
    id v10 = v19;
    v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    v16 = sub_100078B58;
    v17 = &unk_1001B6330;
    objc_copyWeak(&v18, &from);
    v5 = (BSInvalidatable *)(id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle( v9,  v10,  &v13);
    stateCaptureHandle = v25->_stateCaptureHandle;
    v25->_stateCaptureHandle = v5;

    objc_destroyWeak(&v18);
    objc_storeStrong(&v19, 0LL);
    objc_destroyWeak(&from);
    objc_storeStrong(&v21, 0LL);
  }

  v8 = v25;
  objc_storeStrong((id *)&v25, 0LL);
  return v8;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSFaceTimeMenuItemProvider;
  -[TVSSFaceTimeMenuItemProvider dealloc](&v2, "dealloc");
}

- (void)updateFromPlatterState:(id)a3
{
  int v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = -[TVSSFaceTimeMenuItemProvider log](v15, "log");
  os_log_type_t v12 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
  {
    sub_10001AEB8((uint64_t)v16, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  v12,  "Requested facetime menu item update for state: %{public}@",  v16,  0xCu);
  }

  objc_storeStrong(&v13, 0LL);
  if (v15->_cachedPlatterState == location[0])
  {
    int v11 = 1;
  }

  else
  {
    id v10 = v15->_cachedPlatterState;
    objc_storeStrong((id *)&v15->_cachedPlatterState, location[0]);
    if ([location[0] isEqual:@"NoConversations"])
    {
      -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( v15,  "updateMenuItemWithReason:",  @"No conversations detected");
    }

    else if ([location[0] isEqual:@"NearbyConversations"])
    {
      id v9 = @"Nearby conversations detected";
      -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v15, "updateMenuItemWithReason:", v9);
      if (-[TVSSFaceTimeMenuItemProvider _isSharePlayIconForState:](v15, "_isSharePlayIconForState:", v10)) {
        -[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]( v15,  "updateCurrentMenuItemVisualContentWithReason:",  v9);
      }
      objc_storeStrong(&v9, 0LL);
    }

    else if ([location[0] isEqual:@"SharePlayOnly"])
    {
      id v8 = @"In lightweight SharePlay with no activity";
      -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v15, "updateMenuItemWithReason:", v8);
      if (objc_msgSend(v10, "tvss_useFaceTimeIconForState")) {
        -[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]( v15,  "updateCurrentMenuItemVisualContentWithReason:",  v8);
      }
      objc_storeStrong(&v8, 0LL);
    }

    else if ([location[0] isEqual:@"SharePlayActivity"])
    {
      id v7 = @"In SharePlay with an activity";
      -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v15, "updateMenuItemWithReason:", v7);
      if (objc_msgSend(v10, "tvss_useFaceTimeIconForState")) {
        -[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]( v15,  "updateCurrentMenuItemVisualContentWithReason:",  v7);
      }
      objc_storeStrong(&v7, 0LL);
    }

    else if ([location[0] isEqual:@"FaceTimeOnly"])
    {
      id v6 = @"In FaceTime without a SharePlay activity";
      -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v15, "updateMenuItemWithReason:", v6);
      if (-[TVSSFaceTimeMenuItemProvider _isSharePlayIconForState:](v15, "_isSharePlayIconForState:", v10)) {
        -[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]( v15,  "updateCurrentMenuItemVisualContentWithReason:",  v6);
      }
      objc_storeStrong(&v6, 0LL);
    }

    else if ([location[0] isEqual:@"FaceTimeAndSharePlayActivity"])
    {
      id v5 = @"In FaceTime with a SharePlay activity";
      -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v15, "updateMenuItemWithReason:", v5);
      if (objc_msgSend(v10, "tvss_useFaceTimeIconForState")) {
        -[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]( v15,  "updateCurrentMenuItemVisualContentWithReason:",  v5);
      }
      objc_storeStrong(&v5, 0LL);
    }

    else if ([location[0] isEqual:@"IncomingCall"])
    {
      v4 = @"Incoming Call";
      -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v15, "updateMenuItemWithReason:", v4);
      -[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]( v15,  "updateCurrentMenuItemVisualContentWithReason:",  v4);
      objc_storeStrong((id *)&v4, 0LL);
    }

    SEL v3 = -[TVSSFaceTimeMenuItemProvider contributorDelegate](v15, "contributorDelegate");
    -[TVSSMenuModeStateContributingDelegate stateContributorHasUpdate:](v3, "stateContributorHasUpdate:", v15);

    objc_storeStrong(&v10, 0LL);
    int v11 = 0;
  }

  objc_storeStrong(location, 0LL);
}

- (void)faceTimePlatterBackingStoreDidChange:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  SEL v3 = v6;
  id v4 = [location[0] platterState];
  -[TVSSFaceTimeMenuItemProvider updateFromPlatterState:](v3, "updateFromPlatterState:");

  objc_storeStrong(location, 0LL);
}

- (BOOL)shouldShowMenuItem
{
  return (-[NSString isEqual:]( self->_cachedPlatterState,  "isEqual:",  @"NoConversations",  a2,  self) ^ 1) & 1;
}

- (id)newMenuItem
{
  id v8 = self;
  v7[1] = (id)a2;
  v7[0] = 0LL;
  if (self->_privacyPlusMode) {
    objc_super v2 = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:hasFocusableContent:",  @"com.apple.TVSystemUIService.faceTimeProviderItem",  0LL);
  }
  else {
    objc_super v2 = -[TVSSMenuItem initWithIdentifier:platterViewControllerClass:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:platterViewControllerClass:",  @"com.apple.TVSystemUIService.faceTimeProviderItem",  objc_opt_class(&OBJC_CLASS___TVSSFaceTimePanelViewController));
  }
  id v3 = v7[0];
  v7[0] = v2;

  id v6 = -[TVSSFaceTimeMenuItemProvider _currentItemContent](v8, "_currentItemContent");
  [v7[0] setVisualContent:v6];
  id v5 = v7[0];
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(v7, 0LL);
  return v5;
}

- (id)log
{
  return FaceTimeControllerLog();
}

- (BOOL)updateVisualContentForMenuItem:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = location[0];
  id v5 = -[TVSSFaceTimeMenuItemProvider _currentItemContent](v7, "_currentItemContent");
  objc_msgSend(v4, "setVisualContent:");

  objc_storeStrong(location, 0LL);
  return 1;
}

- (BOOL)_isSharePlayIconForState:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((MGGetBoolAnswer(@"s8TgWYc7BjtSNbtuycqauw") & 1) != 0
    || ([location[0] isEqual:@"NearbyConversations"] & 1) == 0)
  {
    unsigned __int8 v4 = 1;
    if (([location[0] isEqual:@"SharePlayOnly"] & 1) == 0)
    {
      unsigned __int8 v4 = 1;
    }

    char v6 = v4 & 1;
  }

  else
  {
    char v6 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v6 & 1;
}

- (id)_currentItemContent
{
  v49 = self;
  SEL v48 = a2;
  LOBYTE(v30) = 0;
  if (self->_privacyPlusMode) {
    unsigned int v30 = !-[NSString isEqualToString:](v49->_cachedPlatterState, "isEqualToString:", @"NearbyConversations");
  }
  unsigned __int8 v47 = v30 & 1;
  if ((-[NSString isEqual:](v49->_cachedPlatterState, "isEqual:", @"IncomingCall") & 1) != 0)
  {
    if (v49->_privacyPlusMode)
    {
      SEL v24 = -[TVSSFaceTimeMenuItemProvider backingStore](v49, "backingStore");
      BOOL v23 = -[TVSSFaceTimePlatterBackingStore incomingCallInfo](v24, "incomingCallInfo");
      id v22 = -[TVSSFaceTimeIncomingCallInfo conversation](v23, "conversation");
      BOOL v25 = [v22 avMode] == (id)2;

      BOOL v46 = v25;
      if (v25) {
        objc_super v2 = @"video.fill";
      }
      else {
        objc_super v2 = @"phone.fill";
      }
      v45 = v2;
      v26 = v45;
      id v27 =  +[UIImageSymbolConfiguration configurationPreferringMulticolor]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationPreferringMulticolor");
      id v44 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  v26);

      v28 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
      id v29 = v44;
      sub_100079AF8();
      v43[1] = v3;
      v43[2] = v4;
      v50 = -[TVSSImageContent initWithImage:size:allowFilters:allowSelectedBackground:]( v28,  "initWithImage:size:allowFilters:allowSelectedBackground:",  v29,  0LL,  0LL,  *(double *)&v3,  *(double *)&v4);
      objc_storeStrong(&v44, 0LL);
      objc_storeStrong((id *)&v45, 0LL);
    }

    else
    {
      id v18 = objc_alloc(&OBJC_CLASS___TVSSIncomingFaceTimeVisualContent);
      id v21 = -[TVSSFaceTimeMenuItemProvider backingStore](v49, "backingStore");
      v20 = -[TVSSFaceTimePlatterBackingStore incomingCallInfo](v21, "incomingCallInfo");
      id v19 = -[TVSSFaceTimeIncomingCallInfo conversation](v20, "conversation");
      v50 = -[TVSSIncomingFaceTimeVisualContent initWithMode:](v18, "initWithMode:", [v19 avMode]);
    }
  }

  else if (-[NSString tvss_useFaceTimeIconForState](v49->_cachedPlatterState, "tvss_useFaceTimeIconForState"))
  {
    char v41 = 0;
    char v39 = 0;
    char v37 = 0;
    if ((v47 & 1) != 0)
    {
      id v42 =  +[UIImageSymbolConfiguration configurationPreferringMulticolor]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationPreferringMulticolor");
      char v41 = 1;
      id v40 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"video.fill");
      char v39 = 1;
      id v5 = v40;
    }

    else
    {
      id v38 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"video.fill");
      char v37 = 1;
      id v5 = v38;
    }

    v43[0] = v5;
    if ((v37 & 1) != 0) {

    }
    if ((v39 & 1) != 0) {
    if ((v41 & 1) != 0)
    }

    char v35 = 0;
    char v33 = 0;
    if (v49->_privacyPlusMode)
    {
      v17 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
      sub_100079AF8();
      v36 = -[TVSSImageContent initWithImage:size:allowFilters:allowSelectedBackground:]( v17,  "initWithImage:size:allowFilters:allowSelectedBackground:",  v43[0],  (v47 ^ 1) & 1,  0LL,  v6,  v7);
      char v35 = 1;
      id v8 = v36;
    }

    else
    {
      v34 = -[TVSSImageContent initWithImage:](objc_alloc(&OBJC_CLASS___TVSSImageContent), "initWithImage:", v43[0]);
      char v33 = 1;
      id v8 = v34;
    }

    v50 = v8;
    if ((v33 & 1) != 0) {

    }
    if ((v35 & 1) != 0) {
    objc_storeStrong(v43, 0LL);
    }
  }

  else if ((v47 & 1) != 0)
  {
    v16 = objc_alloc(&OBJC_CLASS___TVSSCAPackageContent);
    sub_100079AF8();
    double v31 = v9;
    double v32 = v10;
    sub_100079B24();
    v50 = -[TVSSCAPackageContent initWithLightModePackageName:darkModePackageName:size:repeatInterval:contentOffset:]( v16,  "initWithLightModePackageName:darkModePackageName:size:repeatInterval:contentOffset:",  @"SharePlay_Green_Light",  @"SharePlay_Green_Dark",  v31,  v32,  1.2,  v11,  v12);
  }

  else
  {
    int v14 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
    id v15 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"shareplay");
    v50 = -[TVSSImageContent initWithImage:](v14, "initWithImage:");
  }

  return v50;
}

  ;
}

  ;
}

- (void)updateMenuModeState:(id)a3
{
  unsigned __int8 v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_msgSend( location[0],  "setFaceTimeActive:",  -[TVSSFaceTimeMenuItemProvider shouldShowMenuItem](v4, "shouldShowMenuItem"));
  objc_storeStrong(location, 0LL);
}

- (id)stateDumpBuilder
{
  double v12 = self;
  v11[1] = (id)a2;
  v11[0] = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v2 = [v11[0] appendBool:v12->_privacyPlusMode withKey:@"privacyPlusMode"];
  id v6 = v11[0];
  double v7 = -[TVSSFaceTimeMenuItemProvider cachedPlatterState](v12, "cachedPlatterState");
  id v3 = objc_msgSend(v6, "appendString:withKey:");

  id v8 = v11[0];
  double v9 = -[TVSSFaceTimeMenuItemProvider backingStore](v12, "backingStore");
  id v4 = objc_msgSend(v8, "appendObject:withKey:");

  id v10 = v11[0];
  objc_storeStrong(v11, 0LL);
  return v10;
}

- (TVSSMenuModeStateContributingDelegate)contributorDelegate
{
  return (TVSSMenuModeStateContributingDelegate *)objc_loadWeakRetained((id *)&self->contributorDelegate);
}

- (void)setContributorDelegate:(id)a3
{
}

- (NSString)cachedPlatterState
{
  return self->_cachedPlatterState;
}

- (void)setCachedPlatterState:(id)a3
{
}

- (TVSSFaceTimePlatterBackingStore)backingStore
{
  return self->_backingStore;
}

- (void).cxx_destruct
{
}

@end