@interface SRGuideViewController
- (BOOL)_hasTitle;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)usePlatterStyle;
- (BOOL)wantsToManageBackgroundColor;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)transparentHeaderViewClass;
- (SAGuidanceGuideSnippet)_guideSnippet;
- (SRGuideViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)_heightOfRowForDomainSnippet:(id)a3;
- (double)desiredHeightForTransparentHeaderView;
- (double)desiredHeightForWidth:(double)a3;
- (id)_bigButtonViewController;
- (id)_domainSnippetForEnabledIntentSupportedAppAtIndex:(unint64_t)a3;
- (id)_domainSnippetForHelpDomainAtIndex:(unint64_t)a3;
- (id)_domainSnippetForIndexPath:(id)a3;
- (id)_fallbackImage;
- (id)_iconImageForGuideDomainSnippet:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)_numberOfHelpDomains;
- (int64_t)_numberOfIntentEnabledApps;
- (int64_t)_numberOfIntentSupportedApps;
- (int64_t)_pinAnimationType;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_endTrackingGuideShowTimeIfNecessary;
- (void)_prepareSiriEnabledAppList;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureReusableTransparentHeaderView:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setGuideSnippet:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SRGuideViewController

- (SRGuideViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SRGuideViewController;
  v4 = -[SRGuideViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0LL, 0LL);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSCache);
    domainIconCache = v4->_domainIconCache;
    v4->_domainIconCache = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    guideImageOperationQueue = v4->_guideImageOperationQueue;
    v4->_guideImageOperationQueue = v7;

    -[NSOperationQueue setQualityOfService:](v4->_guideImageOperationQueue, "setQualityOfService:", 25LL);
    -[NSOperationQueue setMaxConcurrentOperationCount:]( v4->_guideImageOperationQueue,  "setMaxConcurrentOperationCount:",  2LL);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    spawnedGuideImageFetches = v4->_spawnedGuideImageFetches;
    v4->_spawnedGuideImageFetches = (NSMutableSet *)v9;

    -[SRGuideViewController setDefaultViewInsets:]( v4,  "setDefaultViewInsets:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
  }

  return v4;
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SRGuideViewController;
  -[SRGuideViewController didReceiveMemoryWarning](&v3, "didReceiveMemoryWarning");
  -[NSCache removeAllObjects](self->_domainIconCache, "removeAllObjects");
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SRGuideViewController;
  -[SRGuideViewController setDelegate:](&v4, "setDelegate:", a3);
  -[SRGuideViewController _prepareSiriEnabledAppList](self, "_prepareSiriEnabledAppList");
}

- (id)_bigButtonViewController
{
  bigButtonController = self->_bigButtonController;
  if (!bigButtonController)
  {
    objc_super v4 = objc_alloc_init(&OBJC_CLASS___SRBigButtonController);
    v5 = self->_bigButtonController;
    self->_bigButtonController = v4;

    v6 = self->_bigButtonController;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 appPunchOutButton]);
    -[SRBigButtonController setAceObject:](v6, "setAceObject:", v8);

    uint64_t v9 = self->_bigButtonController;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
    -[SRBigButtonController setDelegate:](v9, "setDelegate:", v10);

    bigButtonController = self->_bigButtonController;
  }

  return bigButtonController;
}

- (void)loadView
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SRGuideViewController;
  -[SRGuideViewController loadView](&v24, "loadView");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController collectionView](self, "collectionView"));
  [v3 setDataSource:self];
  [v3 setDelegate:self];
  *(void *)&double v5 = objc_opt_class(&OBJC_CLASS___SRGuideViewCell, v4).n128_u64[0];
  uint64_t v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewCell reuseIdentifier](&OBJC_CLASS___SRGuideViewCell, "reuseIdentifier", v5));
  [v3 registerClass:v7 forCellWithReuseIdentifier:v8];

  *(void *)&double v10 = objc_opt_class(&OBJC_CLASS___SiriUIContentCollectionViewCell, v9).n128_u64[0];
  uint64_t v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[SiriUIContentCollectionViewCell reuseIdentifier]( &OBJC_CLASS___SiriUIContentCollectionViewCell,  "reuseIdentifier",  v10));
  [v3 registerClass:v12 forCellWithReuseIdentifier:v13];

  *(void *)&double v15 = objc_opt_class(&OBJC_CLASS___SiriUISnippetControllerCell, v14).n128_u64[0];
  uint64_t v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[SiriUISnippetControllerCell reuseIdentifier]( &OBJC_CLASS___SiriUISnippetControllerCell,  "reuseIdentifier",  v15));
  [v3 registerClass:v17 forCellWithReuseIdentifier:v18];

  *(void *)&double v20 = objc_opt_class(&OBJC_CLASS___SRGuideViewHeader, v19).n128_u64[0];
  uint64_t v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewHeader reuseIdentifier](&OBJC_CLASS___SRGuideViewHeader, "reuseIdentifier", v20));
  [v3 registerClass:v22 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v23];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController collectionView](self, "collectionView"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathsForSelectedItems]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      double v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController collectionView](self, "collectionView"));
        [v12 deselectItemAtIndexPath:v11 animated:v3];

        double v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SRGuideViewController;
  -[SRGuideViewController viewWillAppear:](&v13, "viewWillAppear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  unsigned int v6 = [v5 siriSnippetViewControllerIsVisible:self];

  if (v6)
  {
    if (self->_showingDetails)
    {
      self->_showingDetails = 0;
    }

    else
    {
      id v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      startViewingTime = self->_startViewingTime;
      self->_startViewingTime = v8;
    }
  }

  else
  {
    id v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[SRGuideViewController viewDidAppear:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Not visible, no need to create a new view time",  buf,  0xCu);
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SRGuideViewController;
  -[SRGuideViewController viewDidAppear:](&v10, "viewDidAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  unsigned int v6 = [v5 siriSnippetViewControllerIsVisible:self];

  if (v6)
  {
    id v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v10 = "-[SRGuideViewController viewDidDisappear:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Showing details, do nothing", buf, 0xCu);
    }
  }

  else
  {
    self->_showingDetails = 0;
    -[SRGuideViewController _endTrackingGuideShowTimeIfNecessary](self, "_endTrackingGuideShowTimeIfNecessary");
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SRGuideViewController;
  -[SRGuideViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
}

- (double)desiredHeightForWidth:(double)a3
{
  int64_t v4 = -[SRGuideViewController _numberOfHelpDomains](self, "_numberOfHelpDomains", a3);
  int64_t v5 = -[SRGuideViewController _numberOfIntentEnabledApps](self, "_numberOfIntentEnabledApps");
  int64_t v6 = v5;
  if (!v4)
  {
    double v8 = 0.0;
    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  uint64_t v7 = 0LL;
  double v8 = 0.0;
  do
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[SRGuideViewController _domainSnippetForHelpDomainAtIndex:]( self,  "_domainSnippetForHelpDomainAtIndex:",  v7));
    -[SRGuideViewController _heightOfRowForDomainSnippet:](self, "_heightOfRowForDomainSnippet:", v9);
    double v8 = v8 + v10;

    ++v7;
  }

  while (v4 != v7);
  if (v6)
  {
LABEL_7:
    uint64_t v11 = 0LL;
    do
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[SRGuideViewController _domainSnippetForEnabledIntentSupportedAppAtIndex:]( self,  "_domainSnippetForEnabledIntentSupportedAppAtIndex:",  v11));
      -[SRGuideViewController _heightOfRowForDomainSnippet:](self, "_heightOfRowForDomainSnippet:", v12);
      double v8 = v8 + v13;

      ++v11;
    }

    while (v6 != v11);
  }

- (void)_endTrackingGuideShowTimeIfNecessary
{
  if (self->_startViewingTime)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
    [v3 siriSnippetViewController:self didShowGuideStartDate:self->_startViewingTime endDate:v5];

    startViewingTime = self->_startViewingTime;
    self->_startViewingTime = 0LL;
  }

- (SAGuidanceGuideSnippet)_guideSnippet
{
  guideSnippet = self->_guideSnippet;
  if (!guideSnippet)
  {
    int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController snippet](self, "snippet"));
    objc_opt_class(&OBJC_CLASS___SAGuidanceGuideSnippet, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      uint64_t v7 = v4;
      double v8 = self->_guideSnippet;
      self->_guideSnippet = v7;
    }

    else
    {
      double v8 = (SAGuidanceGuideSnippet *)objc_claimAutoreleasedReturnValue( +[AFUIGuideCacheManager sharedManager]( &OBJC_CLASS___AFUIGuideCacheManager,  "sharedManager"));
      uint64_t v9 = (SAGuidanceGuideSnippet *)objc_claimAutoreleasedReturnValue(-[SAGuidanceGuideSnippet cachedGuideSnippet](v8, "cachedGuideSnippet"));
      double v10 = self->_guideSnippet;
      self->_guideSnippet = v9;
    }

    guideSnippet = self->_guideSnippet;
  }

  return guideSnippet;
}

- (Class)transparentHeaderViewClass
{
  if (-[SRGuideViewController _hasTitle](self, "_hasTitle")) {
    objc_opt_class(&OBJC_CLASS___SRGuideViewHeader, v2);
  }
  else {
    BOOL v3 = 0LL;
  }
  return (Class)v3;
}

- (void)configureReusableTransparentHeaderView:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 headerText]);
  [v4 setTitle:v5];
}

- (double)desiredHeightForTransparentHeaderView
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  [v3 siriViewControllerExpectedWidth:self];
  double v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 headerText]);
  +[SRGuideViewHeader sizeThatFits:text:](&OBJC_CLASS___SRGuideViewHeader, "sizeThatFits:text:", v7, v5, 1.79769313e308);
  double v9 = v8;

  return v9;
}

- (BOOL)wantsToManageBackgroundColor
{
  return 1;
}

- (BOOL)usePlatterStyle
{
  return 0;
}

- (int64_t)_pinAnimationType
{
  return -[SRGuideViewController _hasTitle](self, "_hasTitle");
}

- (int64_t)_numberOfHelpDomains
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 domainSnippets]);
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)_numberOfIntentSupportedApps
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 intentEnabledAppSnippets]);
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)_numberOfIntentEnabledApps
{
  return (int64_t)-[NSMutableArray count](self->_enabledIntentSupportedAppSnippets, "count");
}

- (id)_domainSnippetForHelpDomainAtIndex:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domainSnippets]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a3]);

  return v6;
}

- (id)_domainSnippetForEnabledIntentSupportedAppAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndexedSubscript:]( self->_enabledIntentSupportedAppSnippets,  "objectAtIndexedSubscript:",  a3);
}

- (id)_domainSnippetForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  id v6 = [v4 item];

  if (v5) {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SRGuideViewController _domainSnippetForEnabledIntentSupportedAppAtIndex:]( self,  "_domainSnippetForEnabledIntentSupportedAppAtIndex:",  v6));
  }
  else {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SRGuideViewController _domainSnippetForHelpDomainAtIndex:]( self,  "_domainSnippetForHelpDomainAtIndex:",  v6));
  }
  return v7;
}

- (double)_heightOfRowForDomainSnippet:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domainDisplayName]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 tagPhrase]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  [v7 siriViewControllerExpectedWidth:self];
  +[SRGuideViewCell heightOfCellWithName:tagPhrase:width:]( &OBJC_CLASS___SRGuideViewCell,  "heightOfCellWithName:tagPhrase:width:",  v5,  v6);
  double v9 = v8;

  return v9;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3LL;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 2LL:
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 appPunchOutButton]);
      int64_t v10 = v9 != 0LL;

      break;
    case 1LL:
      int64_t v7 = -[SRGuideViewController _numberOfIntentEnabledApps](self, "_numberOfIntentEnabledApps");
      goto LABEL_7;
    case 0LL:
      int64_t v7 = -[SRGuideViewController _numberOfHelpDomains](self, "_numberOfHelpDomains");
LABEL_7:
      int64_t v10 = v7;
      break;
    default:
      uint64_t v11 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_100069ED0(a4, v11);
      }
      int64_t v10 = 0LL;
      break;
  }

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 section];
  if ((unint64_t)v8 > 1)
  {
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SiriUISnippetControllerCell reuseIdentifier]( &OBJC_CLASS___SiriUISnippetControllerCell,  "reuseIdentifier"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6]);

    objc_super v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _bigButtonViewController](self, "_bigButtonViewController"));
    [v11 setSnippetViewController:v24];

    [v11 setTopPadding:8.0];
  }

  else
  {
    id v9 = v8;
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewCell reuseIdentifier](&OBJC_CLASS___SRGuideViewCell, "reuseIdentifier"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6]);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _domainSnippetForIndexPath:](self, "_domainSnippetForIndexPath:", v6));
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 aceId]);
    [v11 setAceId:v13];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_domainIconCache, "objectForKey:", v13));
    if (!v14)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _fallbackImage](self, "_fallbackImage"));
      spawnedGuideImageFetches = self->_spawnedGuideImageFetches;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 aceId]);
      LOBYTE(spawnedGuideImageFetches) = -[NSMutableSet containsObject:]( spawnedGuideImageFetches,  "containsObject:",  v16);

      if ((spawnedGuideImageFetches & 1) == 0)
      {
        guideImageOperationQueue = self->_guideImageOperationQueue;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_100008160;
        v28[3] = &unk_1000BA000;
        v28[4] = self;
        id v18 = v12;
        id v29 = v18;
        id v30 = v13;
        id v31 = v11;
        -[NSOperationQueue addOperationWithBlock:](guideImageOperationQueue, "addOperationWithBlock:", v28);
        uint64_t v19 = self->_spawnedGuideImageFetches;
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v18 aceId]);
        -[NSMutableSet addObject:](v19, "addObject:", v20);
      }
    }

    [v11 setIconImage:v14];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v12 domainDisplayName]);
    [v11 setName:v21];

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v12 tagPhrase]);
    [v11 setTagPhrase:v22];

    if (v9)
    {
      v23 = -[SRGuideViewController _numberOfIntentEnabledApps](self, "_numberOfIntentEnabledApps");
    }

    else
    {
      v25 = -[SRGuideViewController _numberOfHelpDomains](self, "_numberOfHelpDomains");
      if (v25 == (char *)[v6 item] + 1)
      {
        [v11 setKeylineType:1];
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightKeylineColor](&OBJC_CLASS___UIColor, "siriui_lightKeylineColor"));
        [v11 setKeylineCustomBackgroundColor:v26];
      }
    }
  }

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewHeader reuseIdentifier](&OBJC_CLASS___SRGuideViewHeader, "reuseIdentifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [v7 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v8 forIndexPath:v6]);

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  id v7 = [v6 section];
  if ((unint64_t)v7 <= 1)
  {
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_enabledIntentSupportedAppSnippets,  "objectAtIndexedSubscript:",  [v6 item]));
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
      int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 domainSnippets]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "item")));
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
    double v13 = v8;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    [v11 siriSnippetViewController:self pushSirilandSnippets:v12];

    self->_showingDetails = 1;
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [v6 section];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  [v8 siriViewControllerExpectedWidth:self];
  double v10 = v9;

  if (v7 == (id)2)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _bigButtonViewController](self, "_bigButtonViewController"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);
    objc_msgSend(v12, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
    double v14 = v13 + 8.0;
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _domainSnippetForIndexPath:](self, "_domainSnippetForIndexPath:", v6));
    -[SRGuideViewController _heightOfRowForDomainSnippet:](self, "_heightOfRowForDomainSnippet:", v11);
    double v14 = v15;
  }

  double v16 = v10;
  double v17 = v14;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)_iconImageForGuideDomainSnippet:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 iconDisplayIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 iconResourceName]);
  if (v5 && [v4 isAppIcon])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v8 scale];
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[UIImage _applicationIconImageForBundleIdentifier:format:scale:]( &OBJC_CLASS___UIImage,  "_applicationIconImageForBundleIdentifier:format:scale:",  v5,  1LL));

    if (v9) {
      goto LABEL_16;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  if (v7)
  {
    *(void *)&double v10 = objc_opt_class(self, v6).n128_u64[0];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v11, v10));
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[UIImage _deviceSpecificImageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "_deviceSpecificImageNamed:inBundle:",  v7,  v12));
    if ([v4 iconNeedsProcessing])
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
      [v13 scale];
      double v15 = v14;

      if (v15 == 2.0)
      {
        uint64_t v16 = 16LL;
      }

      else
      {
        double v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
        [v17 scale];
        double v19 = v18;

        uint64_t v16 = v19 == 3.0 ? 33LL : 3LL;
      }

      id v9 = v9;
      uint64_t v20 = LICreateIconForImage([v9 CGImage], v16, 4);
      if (v20)
      {
        uint64_t v21 = (CGImage *)v20;
        uint64_t v22 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](&OBJC_CLASS___UIImage, "imageWithCGImage:", v20));

        CGImageRelease(v21);
        id v9 = (id)v22;
      }
    }
  }

- (id)_fallbackImage
{
  fallbackImage = self->_fallbackImage;
  if (!fallbackImage)
  {
    *(void *)&double v4 = objc_opt_class(self, a2).n128_u64[0];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v5, v4));
    id v7 = (UIImage *)objc_claimAutoreleasedReturnValue( +[UIImage _deviceSpecificImageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "_deviceSpecificImageNamed:inBundle:",  @"Siri",  v6));
    id v8 = self->_fallbackImage;
    self->_fallbackImage = v7;

    fallbackImage = self->_fallbackImage;
  }

  return fallbackImage;
}

- (BOOL)_hasTitle
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 headerText]);
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)_prepareSiriEnabledAppList
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  BOOL v4 = (NSSet *)objc_claimAutoreleasedReturnValue([v3 siriEnabledAppListForSiriViewController:self]);
  siriEnabledAppList = self->_siriEnabledAppList;
  self->_siriEnabledAppList = v4;

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  enabledIntentSupportedAppSnippets = self->_enabledIntentSupportedAppSnippets;
  self->_enabledIntentSupportedAppSnippets = v6;

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet", 0LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 intentEnabledAppSnippets]);

  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if ([v14 performIntentEnabledAppAuthorizationCheck])
        {
          double v15 = self->_siriEnabledAppList;
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 iconDisplayIdentifier]);
          LODWORD(v15) = -[NSSet containsObject:](v15, "containsObject:", v16);

          if (!(_DWORD)v15) {
            continue;
          }
        }

        -[NSMutableArray addObject:](self->_enabledIntentSupportedAppSnippets, "addObject:", v14);
      }

      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }
}

- (void)setGuideSnippet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end