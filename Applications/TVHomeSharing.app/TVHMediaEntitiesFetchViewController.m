@interface TVHMediaEntitiesFetchViewController
+ (id)new;
- (BOOL)_loadBackgroundImageInfoForContentView;
- (BOOL)_loadBackgroundImageInfoForContentViewWithImageProxy:(id)a3;
- (BOOL)_loadBackgroundImageInfoForLoadingView;
- (BOOL)_shouldLoadBackgroundImage;
- (BOOL)_shouldShowContentViewControllerWithResultSet:(id)a3;
- (BOOL)contentHasBeenDeleted;
- (BOOL)disableFetchingWhenViewDisappears;
- (BOOL)enableFetchingWhenViewFirstAppears;
- (BOOL)tvh_ppt_isLoading;
- (NSArray)fetchRequests;
- (NSString)fetchControllerIdentifier;
- (NSString)noContentErrorMessage;
- (TVHKAsynchronousWorkToken)contentViewBackgroundImageLoadToken;
- (TVHKAsynchronousWorkToken)loadingViewBackgroundImageLoadToken;
- (TVHKBackgroundImageInfo)contentViewBackgroundImageInfo;
- (TVHKBackgroundImageLoader)backgroundImageLoader;
- (TVHKBackgroundImageRequest)contentViewBackgroundImageRequest;
- (TVHKMediaEntitiesFetchContext)sourceMediaEntitiesFetchContext;
- (TVHKMediaEntitiesFetchController)mediaEntitiesFetchController;
- (TVHKMediaEntitiesFetchControllerResultSet)fetchResultSet;
- (TVHKMediaEntity)sourceMediaEntity;
- (TVHKMediaEntityCollection)sourceMediaEntityCollection;
- (TVHKMediaItem)sourceMediaItem;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHKStateMachine)stateMachine;
- (TVHMediaEntitiesFetchViewController)init;
- (TVHMediaEntitiesFetchViewController)initWithCoder:(id)a3;
- (TVHMediaEntitiesFetchViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHMediaEntitiesFetchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHMediaEntitiesFetchViewControllerDelegate)delegate;
- (UIView)currentView;
- (UIViewController)contentViewController;
- (id)_backgroundImageInfoWithRequest:(id)a3 completionHandler:(id)a4;
- (id)_backgroundImageProxyForMediaEntity:(id)a3;
- (id)_backgroundImageRequestWithImageProxy:(id)a3 generateBackdropImage:(BOOL)a4;
- (id)_delegateContentViewControllerWithResultSet:(id)a3 sourceMediaEntity:(id)a4 sourceMediaEntityBackgroundImageInfo:(id)a5;
- (id)preferredFocusEnvironments;
- (unint64_t)currentViewType;
- (unint64_t)mode;
- (void)_cancelContentViewBackgroundImageLoad;
- (void)_cancelLoadingViewBackgroundImageLoad;
- (void)_configureStateMachine;
- (void)_delegatePurgeSourceMediaEntityBackgroundImages;
- (void)_delegateUpdateContentViewControllerWithFetchControllerResultSet:(id)a3;
- (void)_delegateUpdateContentViewControllerWithSourceMediaEntity:(id)a3 sourceMediaEntityBackgroundImageInfo:(id)a4;
- (void)_registerStateMachineHandlers;
- (void)dealloc;
- (void)didDeleteSourceMediaEntityForMediaEntitiesFetchController:(id)a3;
- (void)disableFetching;
- (void)enableFetching;
- (void)mediaEntitiesFetchController:(id)a3 didChangeSourceMediaEntity:(id)a4;
- (void)mediaEntitiesFetchController:(id)a3 didCompleteWithResultSet:(id)a4 sourceMediaEntity:(id)a5;
- (void)mediaEntitiesFetchController:(id)a3 didFailWithError:(id)a4;
- (void)mediaEntitiesFetchController:(id)a3 mediaEntitiesDidChangeWithResultSet:(id)a4;
- (void)purgeAssets;
- (void)reloadPurgedAssets;
- (void)setBackgroundImageLoader:(id)a3;
- (void)setContentHasBeenDeleted:(BOOL)a3;
- (void)setContentViewBackgroundImageInfo:(id)a3;
- (void)setContentViewBackgroundImageLoadToken:(id)a3;
- (void)setContentViewBackgroundImageRequest:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setCurrentView:(id)a3;
- (void)setCurrentViewType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableFetchingWhenViewDisappears:(BOOL)a3;
- (void)setEnableFetchingWhenViewFirstAppears:(BOOL)a3;
- (void)setLoadingViewBackgroundImageLoadToken:(id)a3;
- (void)setMediaEntitiesFetchController:(id)a3;
- (void)setNoContentErrorMessage:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVHMediaEntitiesFetchViewController

+ (id)new
{
  return 0LL;
}

- (TVHMediaEntitiesFetchViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntitiesFetchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMediaEntitiesFetchViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaEntitiesFetchViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!v12) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaLibrary");
  }
  if ([v13 count])
  {
    if (!v14) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ array parameter must not be cmpty.",  @"fetchRequests");
  if (v14) {
LABEL_5:
  }
    TVHKRequireMediaEntityOwnedByMediaLibrary(v14, v12);
LABEL_6:
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesFetchViewController;
  v16 = -[TVHMediaEntitiesFetchViewController initWithNibName:bundle:](&v27, "initWithNibName:bundle:", 0LL, 0LL);
  v17 = v16;
  if (v16)
  {
    v16->_mode = a5;
    v18 = -[TVHKMediaEntitiesFetchController initWithMediaLibrary:fetchRequests:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchController),  "initWithMediaLibrary:fetchRequests:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v12,  v13,  v14,  v15);
    v19 = (objc_class *)objc_opt_class(v17);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[TVHKMediaEntitiesFetchController setLogName:](v18, "setLogName:", v21);
    -[TVHMediaEntitiesFetchViewController setMediaEntitiesFetchController:]( v17,  "setMediaEntitiesFetchController:",  v18);
    v22 = objc_alloc_init(&OBJC_CLASS___TVHKBackgroundImageLoader);
    backgroundImageLoader = v17->_backgroundImageLoader;
    v17->_backgroundImageLoader = v22;

    v24 = -[TVHKStateMachine initWithName:initialState:mode:]( objc_alloc(&OBJC_CLASS___TVHKStateMachine),  "initWithName:initialState:mode:",  v21,  @"Idle",  0LL);
    stateMachine = v17->_stateMachine;
    v17->_stateMachine = v24;

    -[TVHMediaEntitiesFetchViewController _configureStateMachine](v17, "_configureStateMachine");
  }

  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesFetchViewController;
  -[TVHMediaEntitiesFetchViewController dealloc](&v3, "dealloc");
}

- (TVHKMediaLibrary)mediaLibrary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController mediaEntitiesFetchController]( self,  "mediaEntitiesFetchController"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaLibrary]);

  return (TVHKMediaLibrary *)v3;
}

- (NSArray)fetchRequests
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController mediaEntitiesFetchController]( self,  "mediaEntitiesFetchController"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 requests]);

  return (NSArray *)v3;
}

- (TVHKMediaEntitiesFetchControllerResultSet)fetchResultSet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController mediaEntitiesFetchController]( self,  "mediaEntitiesFetchController"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 resultSet]);

  return (TVHKMediaEntitiesFetchControllerResultSet *)v3;
}

- (NSString)fetchControllerIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController mediaEntitiesFetchController]( self,  "mediaEntitiesFetchController"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return (NSString *)v3;
}

- (TVHKMediaEntity)sourceMediaEntity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController mediaEntitiesFetchController]( self,  "mediaEntitiesFetchController"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sourceMediaEntity]);

  return (TVHKMediaEntity *)v3;
}

- (TVHKMediaItem)sourceMediaItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController sourceMediaEntity](self, "sourceMediaEntity"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVHKMediaItem);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return (TVHKMediaItem *)v4;
}

- (TVHKMediaEntityCollection)sourceMediaEntityCollection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController sourceMediaEntity](self, "sourceMediaEntity"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVHKMediaEntityCollection);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return (TVHKMediaEntityCollection *)v4;
}

- (TVHKMediaEntitiesFetchContext)sourceMediaEntitiesFetchContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController mediaEntitiesFetchController]( self,  "mediaEntitiesFetchController"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sourceMediaEntitiesFetchContext]);

  return (TVHKMediaEntitiesFetchContext *)v3;
}

- (void)enableFetching
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  [v2 postEvent:@"EnableFetching"];
}

- (void)disableFetching
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  [v2 postEvent:@"DisableFetching"];
}

- (BOOL)tvh_ppt_isLoading
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentState]);

  else {
    unsigned int v4 = [v3 isEqualToString:@"ShowingNoContentView"] ^ 1;
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesFetchViewController;
  -[TVHMediaEntitiesFetchViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  [v4 postEvent:@"ViewWillAppear"];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesFetchViewController;
  -[TVHMediaEntitiesFetchViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  [v4 postEvent:@"ViewWillDisappear"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesFetchViewController;
  -[TVHMediaEntitiesFetchViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  [v4 postEvent:@"ViewDidDisappear"];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesFetchViewController;
  -[TVHMediaEntitiesFetchViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController currentView](self, "currentView"));
  if (v3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController view](self, "view"));
    [v4 bounds];
    objc_msgSend(v3, "setFrame:", 0.0, 0.0);
  }
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController contentViewController](self, "contentViewController"));
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    unsigned int v4 = &__NSArray0__struct;
  }

  return v4;
}

- (void)_configureStateMachine
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  id v3 = sub_100079DD8();
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v5 setLogObject:v4];

  [v5 setShouldAcceptEvents:1];
}

- (void)_registerStateMachineHandlers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1000298A8;
  v52[3] = &unk_1000FD920;
  objc_copyWeak(&v53, location);
  unsigned int v4 = objc_retainBlock(v52);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10002998C;
  v50[3] = &unk_1000FCEF8;
  objc_copyWeak(&v51, location);
  id v5 = objc_retainBlock(v50);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1000299DC;
  v48[3] = &unk_1000FD310;
  objc_copyWeak(&v49, location);
  [v3 registerHandlerForEvent:@"ViewWillAppear" onState:@"Idle" withBlock:v48];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100029A40;
  v45[3] = &unk_1000FD948;
  objc_copyWeak(&v47, location);
  uint64_t v6 = v5;
  id v46 = v6;
  [v3 registerHandlerForEvent:@"ViewWillAppear" onState:@"ShowingContentView" withBlock:v45];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100029AAC;
  v43[3] = &unk_1000FD970;
  v7 = v6;
  id v44 = v7;
  [v3 registerDefaultHandlerForEvent:@"ViewWillAppear" withBlock:v43];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100029AFC;
  v41[3] = &unk_1000FD310;
  objc_copyWeak(&v42, location);
  [v3 registerDefaultHandlerForEvent:@"ViewWillDisappear" withBlock:v41];
  [v3 registerHandlerForEvent:@"ViewDidDisappear" onState:@"ShowingContentView" withBlock:&stru_1000FD9B0];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100029B78;
  v39[3] = &unk_1000FD310;
  objc_copyWeak(&v40, location);
  [v3 registerDefaultHandlerForEvent:@"EnableFetching" withBlock:v39];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100029BE0;
  v37[3] = &unk_1000FD310;
  objc_copyWeak(&v38, location);
  [v3 registerDefaultHandlerForEvent:@"DisableFetching" withBlock:v37];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100029C48;
  v34[3] = &unk_1000FD948;
  objc_copyWeak(&v36, location);
  v8 = v4;
  id v35 = v8;
  [v3 registerDefaultHandlerForEvent:@"FetchDidComplete" withBlock:v34];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100029D1C;
  v32[3] = &unk_1000FD970;
  v9 = v8;
  id v33 = v9;
  [v3 registerHandlerForEvent:@"FetchDidFail" onState:@"ShowingLoadingView" withBlock:v32];
  [v3 registerDefaultHandlerForEvent:@"FetchDidFail" withBlock:&stru_1000FD9D0];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100029D3C;
  v30[3] = &unk_1000FD310;
  objc_copyWeak(&v31, location);
  [v3 registerHandlerForEvent:@"MediaEntitiesDidChange" onState:@"ShowingContentView" withBlock:v30];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100029DD8;
  v27[3] = &unk_1000FD948;
  objc_copyWeak(&v29, location);
  v10 = v9;
  id v28 = v10;
  [v3 registerHandlerForEvent:@"MediaEntitiesDidChange" onState:@"ShowingNoContentView" withBlock:v27];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100029E90;
  v25[3] = &unk_1000FD310;
  objc_copyWeak(&v26, location);
  [v3 registerHandlerForEvent:@"SourceMediaEntityDidChange" onState:@"ShowingContentView" withBlock:v25];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100029FBC;
  v23[3] = &unk_1000FD310;
  objc_copyWeak(&v24, location);
  [v3 registerDefaultHandlerForEvent:@"SourceMediaEntityDidChange" withBlock:v23];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10002A020;
  v20[3] = &unk_1000FD948;
  objc_copyWeak(&v22, location);
  v11 = v10;
  id v21 = v11;
  [v3 registerHandlerForEvent:@"ContentViewBackgroundImageLoadDidComplete" onState:@"ShowingLoadingView" withBlock:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10002A0E4;
  v18[3] = &unk_1000FD310;
  objc_copyWeak(&v19, location);
  [v3 registerHandlerForEvent:@"ContentViewBackgroundImageLoadDidComplete" onState:@"ShowingContentView" withBlock:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002A194;
  v16[3] = &unk_1000FD310;
  objc_copyWeak(&v17, location);
  [v3 registerHandlerForEvent:@"LoadingViewBackgroundImageLoadDidComplete" onState:@"ShowingLoadingView" withBlock:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10002A2A8;
  v14[3] = &unk_1000FD310;
  objc_copyWeak(&v15, location);
  [v3 registerHandlerForEvent:@"PurgeBackgroundImages" onState:@"ShowingContentView" withBlock:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002A30C;
  v12[3] = &unk_1000FD310;
  objc_copyWeak(&v13, location);
  [v3 registerHandlerForEvent:@"ReloadPurgedBackgroundImages" onState:@"ShowingContentView" withBlock:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);

  objc_destroyWeak(location);
}

- (void)purgeAssets
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  [v2 postEvent:@"PurgeBackgroundImages"];
}

- (void)reloadPurgedAssets
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  [v2 postEvent:@"ReloadPurgedBackgroundImages"];
}

- (void)mediaEntitiesFetchController:(id)a3 didCompleteWithResultSet:(id)a4 sourceMediaEntity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v10,  "tvhk_setObjectIfNotNil:forKey:",  v8,  @"FetchControllerResultSet");

  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v10,  "tvhk_setObjectIfNotNil:forKey:",  v7,  @"SourceMediaEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  [v9 postEvent:@"FetchDidComplete" withContext:0 userInfo:v10];
}

- (void)mediaEntitiesFetchController:(id)a3 mediaEntitiesDidChangeWithResultSet:(id)a4
{
  id v5 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v7,  "tvhk_setObjectIfNotNil:forKey:",  v5,  @"FetchControllerResultSet");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  [v6 postEvent:@"MediaEntitiesDidChange" withContext:0 userInfo:v7];
}

- (void)mediaEntitiesFetchController:(id)a3 didChangeSourceMediaEntity:(id)a4
{
  id v5 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v7,  "tvhk_setObjectIfNotNil:forKey:",  v5,  @"SourceMediaEntity");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine"));
  [v6 postEvent:@"SourceMediaEntityDidChange" withContext:0 userInfo:v7];
}

- (void)mediaEntitiesFetchController:(id)a3 didFailWithError:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController stateMachine](self, "stateMachine", a3, a4));
  [v4 postEvent:@"FetchDidFail" withContext:0 userInfo:0];
}

- (void)didDeleteSourceMediaEntityForMediaEntitiesFetchController:(id)a3
{
}

- (id)_delegateContentViewControllerWithResultSet:(id)a3 sourceMediaEntity:(id)a4 sourceMediaEntityBackgroundImageInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController delegate](self, "delegate"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 mediaEntitiesFetchViewController:self contentViewControllerWithFetchControllerResultSet:v10 sourceMediaEntity :v9 sourceMediaEntityBackgroundImageInfo:v8]);

  return v12;
}

- (void)_delegateUpdateContentViewControllerWithFetchControllerResultSet:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector( v4,  "mediaEntitiesFetchViewController:updateContentViewController:withFetchControllerResultSet:") & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController contentViewController](self, "contentViewController"));
    [v4 mediaEntitiesFetchViewController:self updateContentViewController:v5 withFetchControllerResultSet:v6];
  }
}

- (void)_delegateUpdateContentViewControllerWithSourceMediaEntity:(id)a3 sourceMediaEntityBackgroundImageInfo:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector( v7,  "mediaEntitiesFetchViewController:updateContentViewController:withSourceMediaEntity:sourceMediaEntityBackgroundImageInfo:") & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController contentViewController](self, "contentViewController"));
    [v7 mediaEntitiesFetchViewController:self updateContentViewController:v8 withSourceMediaEntity:v9 sourceMediaEntityBackgroundImageInfo:v6];
  }
}

- (void)_delegatePurgeSourceMediaEntityBackgroundImages
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector( v4,  "mediaEntitiesFetchViewController:purgeSourceMediaEntityBackgroundImagesForContentViewController:") & 1) != 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController contentViewController](self, "contentViewController"));
    [v4 mediaEntitiesFetchViewController:self purgeSourceMediaEntityBackgroundImagesForContentViewController:v3];
  }
}

- (NSString)noContentErrorMessage
{
  noContentErrorMessage = self->_noContentErrorMessage;
  if (!noContentErrorMessage)
  {
    self->_noContentErrorMessage = (NSString *)&stru_100100278;

    noContentErrorMessage = self->_noContentErrorMessage;
  }

  return noContentErrorMessage;
}

- (void)setCurrentViewType:(unint64_t)a3
{
  if (self->_currentViewType == a3) {
    return;
  }
  id v5 = sub_10007A1C8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController mediaEntitiesFetchController]( self,  "mediaEntitiesFetchController"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 publiclyLoggableSuccinctDescription]);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] - Changing view type to %lu",  buf,  0x16u);
  }

  unint64_t currentViewType = self->_currentViewType;
  self->_unint64_t currentViewType = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController childViewControllers](self, "childViewControllers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  id v31 = sub_10002AC2C;
  v32 = sub_10002AC3C;
  id v33 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController currentView](self, "currentView"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10002AC44;
  v29[3] = &unk_1000FD9F8;
  v29[4] = buf;
  id v12 = objc_retainBlock(v29);
  id v13 = (void (**)(void))v12;
  if (v11)
  {
    [v11 willMoveToParentViewController:0];
    v13[2](v13);
    [v11 removeFromParentViewController];
    id v14 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 40LL) = 0LL;
  }

  else if (*(void *)(*(void *)&buf[8] + 40LL))
  {
    ((void (*)(void *))v12[2])(v12);
  }

  unint64_t v15 = self->_currentViewType;
  if (v15 == 3)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController contentViewController](self, "contentViewController"));
LABEL_16:
    v16 = 0LL;
    goto LABEL_17;
  }

  if (v15 == 2)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController noContentErrorMessage](self, "noContentErrorMessage"));
    v16 = objc_alloc_init(&OBJC_CLASS___TVHErrorView);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHErrorView messageLabel](v16, "messageLabel"));
    [v19 setText:v18];

    goto LABEL_14;
  }

  if (v15 != 1)
  {
    id v17 = 0LL;
    goto LABEL_16;
  }

  v16 = objc_alloc_init(&OBJC_CLASS___TVHLoadingView);
LABEL_14:
  id v17 = 0LL;
LABEL_17:
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10002AC80;
  v26[3] = &unk_1000FDA20;
  id v20 = v10;
  id v27 = v20;
  id v28 = buf;
  id v21 = objc_retainBlock(v26);
  id v22 = (void (**)(void, void))v21;
  if (v17)
  {
    -[TVHMediaEntitiesFetchViewController addChildViewController:](self, "addChildViewController:", v17);
    v23 = (TVHErrorView *)objc_claimAutoreleasedReturnValue([v17 view]);

    ((void (**)(void, TVHErrorView *))v22)[2](v22, v23);
    [v17 didMoveToParentViewController:self];
  }

  else if (v16)
  {
    ((void (*)(void *, TVHErrorView *))v21[2])(v21, v16);
    v23 = v16;
  }

  else
  {
    v23 = 0LL;
  }

  -[TVHMediaEntitiesFetchViewController setCurrentView:]( self,  "setCurrentView:",  *(void *)(*(void *)&buf[8] + 40LL));
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController view](self, "view"));
  [v24 setNeedsLayout];

  if (a3 == 2 && currentViewType == 3) {
    -[TVHMediaEntitiesFetchViewController setContentHasBeenDeleted:](self, "setContentHasBeenDeleted:", 1LL);
  }

  _Block_object_dispose(buf, 8);
}

- (void)setMediaEntitiesFetchController:(id)a3
{
  p_mediaEntitiesFetchController = &self->_mediaEntitiesFetchController;
  id v10 = a3;
  if ((-[TVHKMediaEntitiesFetchController isEqual:](*p_mediaEntitiesFetchController, "isEqual:") & 1) == 0)
  {
    if (*p_mediaEntitiesFetchController)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntitiesFetchController mediaLibrary](*p_mediaEntitiesFetchController, "mediaLibrary"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryFetchControllerManager managerForMediaLibrary:]( &OBJC_CLASS___TVHKMediaLibraryFetchControllerManager,  "managerForMediaLibrary:",  v6));

      -[TVHKMediaEntitiesFetchController setDelegate:](*p_mediaEntitiesFetchController, "setDelegate:", 0LL);
      [v7 removeFetchController:*p_mediaEntitiesFetchController];
    }

    objc_storeStrong((id *)&self->_mediaEntitiesFetchController, a3);
    if (*p_mediaEntitiesFetchController)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntitiesFetchController mediaLibrary](*p_mediaEntitiesFetchController, "mediaLibrary"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryFetchControllerManager managerForMediaLibrary:]( &OBJC_CLASS___TVHKMediaLibraryFetchControllerManager,  "managerForMediaLibrary:",  v8));

      -[TVHKMediaEntitiesFetchController setDelegate:](*p_mediaEntitiesFetchController, "setDelegate:", self);
      [v9 addFetchController:*p_mediaEntitiesFetchController];
    }
  }
}

- (BOOL)_shouldShowContentViewControllerWithResultSet:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector( v5,  "mediaEntitiesFetchViewController:shouldShowContentViewControllerWithFetchControllerResultSet:") & 1) != 0)
  {
    LOBYTE(v6) = [v5 mediaEntitiesFetchViewController:self shouldShowContentViewControllerWithFetchControllerResultSet:v4];
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 results]);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)i) response]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaEntitiesResult]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaEntities]);

          v8 += (uint64_t)[v13 count];
        }

        id v6 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v6);
      LOBYTE(v6) = v8 != 0;
    }
  }

  return (char)v6;
}

- (BOOL)_loadBackgroundImageInfoForContentView
{
  id v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController sourceMediaEntity](self, "sourceMediaEntity"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController _backgroundImageProxyForMediaEntity:]( v2,  "_backgroundImageProxyForMediaEntity:",  v3));

  LOBYTE(v2) = -[TVHMediaEntitiesFetchViewController _loadBackgroundImageInfoForContentViewWithImageProxy:]( v2,  "_loadBackgroundImageInfoForContentViewWithImageProxy:",  v4);
  return (char)v2;
}

- (BOOL)_loadBackgroundImageInfoForContentViewWithImageProxy:(id)a3
{
  id v4 = a3;
  -[TVHMediaEntitiesFetchViewController _cancelContentViewBackgroundImageLoad]( self,  "_cancelContentViewBackgroundImageLoad");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController contentViewBackgroundImageLoadToken]( self,  "contentViewBackgroundImageLoadToken"));

  if (v5) {
    goto LABEL_5;
  }
  unsigned int v6 = -[TVHMediaEntitiesFetchViewController _shouldLoadBackgroundImage](self, "_shouldLoadBackgroundImage");
  if (v4 && v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController _backgroundImageRequestWithImageProxy:generateBackdropImage:]( self,  "_backgroundImageRequestWithImageProxy:generateBackdropImage:",  v4,  (id)-[TVHMediaEntitiesFetchViewController mode](self, "mode") == (id)2));
    uint64_t v14 = 0LL;
    __int128 v15 = &v14;
    uint64_t v16 = 0x3032000000LL;
    __int128 v17 = sub_10002AC2C;
    __int128 v18 = sub_10002AC3C;
    id v19 = 0LL;
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002B164;
    v11[3] = &unk_1000FDA48;
    objc_copyWeak(&v12, &location);
    v11[4] = &v14;
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController _backgroundImageInfoWithRequest:completionHandler:]( self,  "_backgroundImageInfoWithRequest:completionHandler:",  v7,  v11));
    uint64_t v9 = (void *)v15[5];
    v15[5] = v8;

    -[TVHMediaEntitiesFetchViewController setContentViewBackgroundImageRequest:]( self,  "setContentViewBackgroundImageRequest:",  v7);
    -[TVHMediaEntitiesFetchViewController setContentViewBackgroundImageLoadToken:]( self,  "setContentViewBackgroundImageLoadToken:",  v15[5]);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v14, 8);

LABEL_5:
    LOBYTE(v5) = 1;
  }

  return (char)v5;
}

- (void)_cancelContentViewBackgroundImageLoad
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController contentViewBackgroundImageLoadToken]( self,  "contentViewBackgroundImageLoadToken"));
  [v3 cancel];

  -[TVHMediaEntitiesFetchViewController setContentViewBackgroundImageLoadToken:]( self,  "setContentViewBackgroundImageLoadToken:",  0LL);
  -[TVHMediaEntitiesFetchViewController setContentViewBackgroundImageRequest:]( self,  "setContentViewBackgroundImageRequest:",  0LL);
}

- (BOOL)_loadBackgroundImageInfoForLoadingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController loadingViewBackgroundImageLoadToken]( self,  "loadingViewBackgroundImageLoadToken"));

  if (v3)
  {
    LOBYTE(v4) = 1;
  }

  else if (-[TVHMediaEntitiesFetchViewController _shouldLoadBackgroundImage](self, "_shouldLoadBackgroundImage"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController sourceMediaEntity](self, "sourceMediaEntity"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController _backgroundImageProxyForMediaEntity:]( self,  "_backgroundImageProxyForMediaEntity:",  v5));

    unsigned int v4 = [v6 isImageAvailable];
    if (v4)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController _backgroundImageRequestWithImageProxy:generateBackdropImage:]( self,  "_backgroundImageRequestWithImageProxy:generateBackdropImage:",  v6,  0LL));
      uint64_t v14 = 0LL;
      __int128 v15 = &v14;
      uint64_t v16 = 0x3032000000LL;
      __int128 v17 = sub_10002AC2C;
      __int128 v18 = sub_10002AC3C;
      id v19 = 0LL;
      objc_initWeak(&location, self);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10002B478;
      v11[3] = &unk_1000FDA48;
      objc_copyWeak(&v12, &location);
      v11[4] = &v14;
      uint64_t v8 = objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController _backgroundImageInfoWithRequest:completionHandler:]( self,  "_backgroundImageInfoWithRequest:completionHandler:",  v7,  v11));
      uint64_t v9 = (void *)v15[5];
      v15[5] = v8;

      -[TVHMediaEntitiesFetchViewController setLoadingViewBackgroundImageLoadToken:]( self,  "setLoadingViewBackgroundImageLoadToken:",  v15[5]);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v14, 8);
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_cancelLoadingViewBackgroundImageLoad
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController loadingViewBackgroundImageLoadToken]( self,  "loadingViewBackgroundImageLoadToken"));
  [v3 cancel];

  -[TVHMediaEntitiesFetchViewController setLoadingViewBackgroundImageLoadToken:]( self,  "setLoadingViewBackgroundImageLoadToken:",  0LL);
}

- (id)_backgroundImageInfoWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController backgroundImageLoader](self, "backgroundImageLoader"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002B678;
  v12[3] = &unk_1000FDA70;
  id v13 = v6;
  id v9 = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 enqueueRequest:v7 withCompletionHandler:v12]);

  return v10;
}

- (id)_backgroundImageRequestWithImageProxy:(id)a3 generateBackdropImage:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = -[TVHKBackgroundImageRequest initWithImageProxy:]( objc_alloc(&OBJC_CLASS___TVHKBackgroundImageRequest),  "initWithImageProxy:",  v5);

  -[TVHKBackgroundImageRequest setRequiresBackdropImage:](v6, "setRequiresBackdropImage:", v4);
  return v6;
}

- (id)_backgroundImageProxyForMediaEntity:(id)a3
{
  id v4 = a3;
  if (v4 && -[TVHMediaEntitiesFetchViewController mode](self, "mode"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntityImageLoadParams imageLoadParamsWithMediaEntity:imageType:]( &OBJC_CLASS___TVHKMediaEntityImageLoadParams,  "imageLoadParamsWithMediaEntity:imageType:",  v4,  0LL));
    id v6 = objc_alloc(&OBJC_CLASS___TVImageProxy);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    uint64_t v8 = -[TVImageProxy initWithObject:imageLoader:groupType:](v6, "initWithObject:imageLoader:groupType:", v5, v7, 0LL);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)_shouldLoadBackgroundImage
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController sourceMediaEntity](self, "sourceMediaEntity"));

  return v3 && -[TVHMediaEntitiesFetchViewController mode](self, "mode") != 0;
}

- (BOOL)contentHasBeenDeleted
{
  return self->_contentHasBeenDeleted;
}

- (void)setContentHasBeenDeleted:(BOOL)a3
{
  self->_contentHasBeenDeleted = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (TVHMediaEntitiesFetchViewControllerDelegate)delegate
{
  return (TVHMediaEntitiesFetchViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)setNoContentErrorMessage:(id)a3
{
}

- (BOOL)enableFetchingWhenViewFirstAppears
{
  return self->_enableFetchingWhenViewFirstAppears;
}

- (void)setEnableFetchingWhenViewFirstAppears:(BOOL)a3
{
  self->_enableFetchingWhenViewFirstAppears = a3;
}

- (BOOL)disableFetchingWhenViewDisappears
{
  return self->_disableFetchingWhenViewDisappears;
}

- (void)setDisableFetchingWhenViewDisappears:(BOOL)a3
{
  self->_disableFetchingWhenViewDisappears = a3;
}

- (TVHKMediaEntitiesFetchController)mediaEntitiesFetchController
{
  return self->_mediaEntitiesFetchController;
}

- (TVHKBackgroundImageLoader)backgroundImageLoader
{
  return self->_backgroundImageLoader;
}

- (void)setBackgroundImageLoader:(id)a3
{
}

- (TVHKAsynchronousWorkToken)loadingViewBackgroundImageLoadToken
{
  return self->_loadingViewBackgroundImageLoadToken;
}

- (void)setLoadingViewBackgroundImageLoadToken:(id)a3
{
}

- (TVHKAsynchronousWorkToken)contentViewBackgroundImageLoadToken
{
  return self->_contentViewBackgroundImageLoadToken;
}

- (void)setContentViewBackgroundImageLoadToken:(id)a3
{
}

- (TVHKBackgroundImageRequest)contentViewBackgroundImageRequest
{
  return self->_contentViewBackgroundImageRequest;
}

- (void)setContentViewBackgroundImageRequest:(id)a3
{
}

- (TVHKBackgroundImageInfo)contentViewBackgroundImageInfo
{
  return self->_contentViewBackgroundImageInfo;
}

- (void)setContentViewBackgroundImageInfo:(id)a3
{
}

- (TVHKStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (UIView)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(id)a3
{
}

- (unint64_t)currentViewType
{
  return self->_currentViewType;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end