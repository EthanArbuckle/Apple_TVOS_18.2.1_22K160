@interface GKDashboardExtensionViewController
- (BOOL)isArcade;
- (BOOL)isDismissing;
- (BOOL)shouldShowPlayForChallenge;
- (BOOL)shouldShowPlayForTurnBasedMatch;
- (BOOL)shouldShowQuitForTurnBasedMatch;
- (GKDashboardExtensionViewController)initWithCoder:(id)a3;
- (GKDashboardRequest)dashboardRequest;
- (GKLeaderboardInternal)leaderboardInternal;
- (NSDictionary)dashboardAssetNames;
- (NSDictionary)leaderboardAssetNames;
- (NSDictionary)leaderboardSetAssetNames;
- (NSString)achievementIdentifier;
- (NSString)activityIdentifier;
- (NSString)gameBundleID;
- (NSString)launchContext;
- (NSString)leaderboardIdentifier;
- (NSString)leaderboardSetIdentifier;
- (NSString)leaderboardTitle;
- (NSString)playerAlias;
- (NSString)playerIdentifier;
- (id)hostObjectProxy;
- (int64_t)leaderboardPlayerScope;
- (int64_t)leaderboardTimeScope;
- (int64_t)viewState;
- (void)addDoneButtonToViewController:(id)a3;
- (void)configureContentViewController;
- (void)constructContentViewController;
- (void)dashboardDidChangeToLeaderboardIdentifier:(id)a3;
- (void)dashboardDidChangeToLeaderboardPlayerScope:(int64_t)a3;
- (void)dashboardDidChangeToLeaderboardTimeScope:(int64_t)a3;
- (void)dashboardDidChangeToViewState:(int64_t)a3;
- (void)dismissWithGameController;
- (void)finishAndPlayChallenge:(id)a3;
- (void)finishWithTurnBasedMatch:(id)a3;
- (void)messageFromClient:(id)a3;
- (void)quitTurnBasedMatch:(id)a3;
- (void)requestDashboardLogoImageWithHandler:(id)a3;
- (void)requestImagesForLeaderboardSetsWithHandler:(id)a3;
- (void)requestImagesForLeaderboardsInSet:(id)a3 handler:(id)a4;
- (void)setAchievementIdentifier:(id)a3;
- (void)setActivityIdentifier:(id)a3;
- (void)setDashboardAssetNames:(id)a3;
- (void)setDashboardAssetNames:(id)a3 leaderboardSetAssetNames:(id)a4 leaderboardAssetNames:(id)a5;
- (void)setDashboardRequest:(id)a3;
- (void)setGameBundleID:(id)a3;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setIsArcade:(BOOL)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setLaunchContext:(id)a3;
- (void)setLeaderboardAssetNames:(id)a3;
- (void)setLeaderboardIdentifier:(id)a3;
- (void)setLeaderboardInternal:(id)a3;
- (void)setLeaderboardPlayerScope:(int64_t)a3;
- (void)setLeaderboardSetAssetNames:(id)a3;
- (void)setLeaderboardSetIdentifier:(id)a3;
- (void)setLeaderboardTimeScope:(int64_t)a3;
- (void)setLeaderboardTitle:(id)a3;
- (void)setPlayerAlias:(id)a3;
- (void)setPlayerIdentifier:(id)a3;
- (void)setShouldShowPlayForChallenge:(BOOL)a3;
- (void)setShouldShowPlayForTurnBasedMatch:(BOOL)a3;
- (void)setShouldShowQuitForTurnBasedMatch:(BOOL)a3;
- (void)setViewState:(int64_t)a3;
- (void)tearDownExtensionWithReply:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKDashboardExtensionViewController

- (GKDashboardExtensionViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKDashboardExtensionViewController;
  v3 = -[GKDashboardExtensionViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    v3->_viewState = -1LL;
    v3->_leaderboardTimeScope = 2LL;
    v3->_leaderboardPlayerScope = 1LL;
    -[GKDashboardExtensionViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 5LL);
  }

  return v4;
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  uint64_t v6 = GKExtensionItemDashboardViewState;
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
  -[GKDashboardExtensionViewController setViewState:](self, "setViewState:", [v9 integerValue]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardTimeScope]);
  -[GKDashboardExtensionViewController setLeaderboardTimeScope:]( self,  "setLeaderboardTimeScope:",  [v10 integerValue]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardPlayerScope]);
  -[GKDashboardExtensionViewController setLeaderboardPlayerScope:]( self,  "setLeaderboardPlayerScope:",  [v11 integerValue]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardLeaderboardID]);
  -[GKDashboardExtensionViewController setLeaderboardIdentifier:](self, "setLeaderboardIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardLeaderboardSetID]);
  -[GKDashboardExtensionViewController setLeaderboardSetIdentifier:](self, "setLeaderboardSetIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardLeaderboardTitle]);
  -[GKDashboardExtensionViewController setLeaderboardTitle:](self, "setLeaderboardTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardLeaderboardInternal]);
  -[GKDashboardExtensionViewController setLeaderboardInternal:](self, "setLeaderboardInternal:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardGameBundleID]);
  -[GKDashboardExtensionViewController setGameBundleID:](self, "setGameBundleID:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardAchievementID]);
  -[GKDashboardExtensionViewController setAchievementIdentifier:](self, "setAchievementIdentifier:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardActivityID]);
  -[GKDashboardExtensionViewController setActivityIdentifier:](self, "setActivityIdentifier:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardPlayerID]);
  -[GKDashboardExtensionViewController setPlayerIdentifier:](self, "setPlayerIdentifier:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardPlayerAlias]);
  -[GKDashboardExtensionViewController setPlayerAlias:](self, "setPlayerAlias:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardShowPlayForChallenge]);
  -[GKDashboardExtensionViewController setShouldShowPlayForChallenge:]( self,  "setShouldShowPlayForChallenge:",  [v21 BOOLValue]);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemMatchesShowPlayForMatch]);
  -[GKDashboardExtensionViewController setShouldShowPlayForTurnBasedMatch:]( self,  "setShouldShowPlayForTurnBasedMatch:",  [v22 BOOLValue]);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemMatchesShowQuitForMatch]);
  -[GKDashboardExtensionViewController setShouldShowQuitForTurnBasedMatch:]( self,  "setShouldShowQuitForTurnBasedMatch:",  [v23 BOOLValue]);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardIsArcadeGame]);
  -[GKDashboardExtensionViewController setIsArcade:](self, "setIsArcade:", [v24 BOOLValue]);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKExtensionItemDashboardLaunchContext]);
  -[GKDashboardExtensionViewController setLaunchContext:](self, "setLaunchContext:", v25);

  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___GKDashboardExtensionViewController;
  -[GKDashboardExtensionViewController setInitialState:withReply:](&v29, "setInitialState:withReply:", v8, v7);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  if ([v26 userInterfaceIdiom] == (id)1)
  {

    uint64_t v27 = 0LL;
  }

  else
  {
    int ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();

    uint64_t v27 = ShouldUsePadUI ^ 1u;
  }

  -[GKDashboardExtensionViewController setRequiresNavigationController:](self, "setRequiresNavigationController:", v27);
}

- (void)constructContentViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKGame currentGame](&OBJC_CLASS___GKGame, "currentGame"));
  -[GKDashboardExtensionViewController setAdjustTopConstraint:](self, "setAdjustTopConstraint:", 0LL);
  v4 = objc_alloc_init(&OBJC_CLASS___GKDashboardRequest);
  -[GKDashboardRequest setState:](v4, "setState:", -[GKDashboardExtensionViewController viewState](self, "viewState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController leaderboardIdentifier](self, "leaderboardIdentifier"));
  -[GKDashboardRequest setLeaderboardID:](v4, "setLeaderboardID:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController leaderboardSetIdentifier](self, "leaderboardSetIdentifier"));
  -[GKDashboardRequest setLeaderboardSetID:](v4, "setLeaderboardSetID:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController leaderboardTitle](self, "leaderboardTitle"));
  -[GKDashboardRequest setLeaderboardTitle:](v4, "setLeaderboardTitle:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController leaderboardInternal](self, "leaderboardInternal"));
  if (v8)
  {
    v9 = objc_alloc(&OBJC_CLASS___GKLeaderboard);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController leaderboardInternal](self, "leaderboardInternal"));
    v11 = -[GKLeaderboard initWithInternalRepresentation:](v9, "initWithInternalRepresentation:", v10);
    -[GKDashboardRequest setLeaderboard:](v4, "setLeaderboard:", v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController gameBundleID](self, "gameBundleID"));
  -[GKDashboardRequest setGameBundleID:](v4, "setGameBundleID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController achievementIdentifier](self, "achievementIdentifier"));
  -[GKDashboardRequest setAchievementID:](v4, "setAchievementID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController activityIdentifier](self, "activityIdentifier"));
  -[GKDashboardRequest setActivityIdentifier:](v4, "setActivityIdentifier:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController playerIdentifier](self, "playerIdentifier"));
  -[GKDashboardRequest setPlayerID:](v4, "setPlayerID:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController playerAlias](self, "playerAlias"));
  -[GKDashboardRequest setPlayerAlias:](v4, "setPlayerAlias:", v16);

  -[GKDashboardRequest setLeaderboardTimeScope:]( v4,  "setLeaderboardTimeScope:",  -[GKDashboardExtensionViewController leaderboardTimeScope](self, "leaderboardTimeScope"));
  -[GKDashboardRequest setLeaderboardPlayerScope:]( v4,  "setLeaderboardPlayerScope:",  -[GKDashboardExtensionViewController leaderboardPlayerScope](self, "leaderboardPlayerScope"));
  -[GKDashboardRequest setShouldShowPlayForChallenge:]( v4,  "setShouldShowPlayForChallenge:",  -[GKDashboardExtensionViewController shouldShowPlayForChallenge](self, "shouldShowPlayForChallenge"));
  -[GKDashboardRequest setShouldShowPlayForTurnBasedMatch:]( v4,  "setShouldShowPlayForTurnBasedMatch:",  -[GKDashboardExtensionViewController shouldShowPlayForTurnBasedMatch](self, "shouldShowPlayForTurnBasedMatch"));
  -[GKDashboardRequest setShouldShowQuitForTurnBasedMatch:]( v4,  "setShouldShowQuitForTurnBasedMatch:",  -[GKDashboardExtensionViewController shouldShowQuitForTurnBasedMatch](self, "shouldShowQuitForTurnBasedMatch"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer localPlayer](&OBJC_CLASS___GKLocalPlayer, "localPlayer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameRecord gameRecordForPlayer:game:]( &OBJC_CLASS___GKGameRecord,  "gameRecordForPlayer:game:",  v17,  v3));
  -[GKDashboardRequest setGameRecord:](v4, "setGameRecord:", v18);

  -[GKDashboardRequest setIsArcade:]( v4,  "setIsArcade:",  -[GKDashboardExtensionViewController isArcade](self, "isArcade"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController launchContext](self, "launchContext"));
  -[GKDashboardRequest setLaunchContext:](v4, "setLaunchContext:", v19);

  if (self->_dashboardAssetNames)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController dashboardAssetNames](self, "dashboardAssetNames"));
    -[GKDashboardRequest setDashboardAssetNames:](v4, "setDashboardAssetNames:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController leaderboardAssetNames](self, "leaderboardAssetNames"));
    -[GKDashboardRequest setLeaderboardAssetNames:](v4, "setLeaderboardAssetNames:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController leaderboardSetAssetNames](self, "leaderboardSetAssetNames"));
    -[GKDashboardRequest setLeaderboardSetAssetNames:](v4, "setLeaderboardSetAssetNames:", v22);
  }

  -[GKDashboardExtensionViewController setDashboardRequest:](self, "setDashboardRequest:", v4);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100003420;
  v25[3] = &unk_10000C4B0;
  v25[4] = self;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[DashboardLaunchManager viewControllerWithRequest:game:dismissHandler:]( &OBJC_CLASS____TtC28GameCenterDashboardExtension22DashboardLaunchManager,  "viewControllerWithRequest:game:dismissHandler:",  v4,  v3,  v25));
  -[GKDashboardExtensionViewController setContentViewController:](self, "setContentViewController:", v23);

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___GKDashboardExtensionViewController;
  -[GKDashboardExtensionViewController constructContentViewController](&v24, "constructContentViewController");
}

- (void)configureContentViewController
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKDashboardExtensionViewController;
  -[GKDashboardExtensionViewController configureContentViewController](&v6, "configureContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKColorPalette sharedPalette](&OBJC_CLASS___GKColorPalette, "sharedPalette"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 emphasizedTextColor]);
  [v3 setTintColor:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___GKDashboardExtensionViewController;
  -[GKDashboardExtensionViewController viewWillAppear:](&v23, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController effectView](self, "effectView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 backgroundEffects]);

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController effectView](self, "effectView"));
  [v6 setBackgroundEffects:&__NSArray0__struct];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController view](self, "view"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);
  LODWORD(v9) = 0;
  [v8 setOpacity:v9];

  v10 = objc_alloc(&OBJC_CLASS___CAMediaTimingFunction);
  LODWORD(v11) = 1050253722;
  LODWORD(v12) = 1045220557;
  LODWORD(v13) = 1061997773;
  LODWORD(v14) = 0.75;
  v15 = -[CAMediaTimingFunction initWithControlPoints::::](v10, "initWithControlPoints::::", v11, v12, v14, v13);
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setAnimationTimingFunction:](&OBJC_CLASS___CATransaction, "setAnimationTimingFunction:", v15);
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_100003634;
  v20 = &unk_10000C4D8;
  v21 = self;
  id v22 = v5;
  id v16 = v5;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  &v17,  &stru_10000C518,  0.33);
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit", v17, v18, v19, v20, v21);
}

- (void)tearDownExtensionWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100003728;
  v4[3] = &unk_10000C568;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)addDoneButtonToViewController:(id)a3
{
  id v7 = a3;
  if (([v7 _gkExtensionWantsCustomRightBarButtonItemInViewService] & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIButton _gkXmarkedCloseButtonWithTarget:action:]( &OBJC_CLASS___UIButton,  "_gkXmarkedCloseButtonWithTarget:action:",  self,  "donePressed:"));
    id v5 = -[UIBarButtonItem initWithCustomView:](objc_alloc(&OBJC_CLASS___UIBarButtonItem), "initWithCustomView:", v4);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v7 navigationItem]);
    [v6 setRightBarButtonItem:v5];
  }
}

- (void)messageFromClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = GKExtensionProtocolSecureCodedClasses();
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v19 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v6,  v4,  &v19));
  id v8 = v19;

  if (v8)
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers();
    }
    v10 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100007588((uint64_t)v8, v10);
    }
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessageCommandKey]);
  id v12 = [v11 integerValue];

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessageParamKey]);
  double v14 = v13;
  switch((unint64_t)v12)
  {
    case 5uLL:
      -[GKDashboardExtensionViewController setViewState:](self, "setViewState:", [v13 integerValue]);
      break;
    case 6uLL:
      -[GKDashboardExtensionViewController setLeaderboardIdentifier:](self, "setLeaderboardIdentifier:", v13);
      break;
    case 7uLL:
      -[GKDashboardExtensionViewController setLeaderboardTimeScope:]( self,  "setLeaderboardTimeScope:",  [v13 integerValue]);
      break;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      goto LABEL_10;
    case 0xFuLL:
      -[GKDashboardExtensionViewController setShouldShowPlayForChallenge:]( self,  "setShouldShowPlayForChallenge:",  [v13 BOOLValue]);
      break;
    case 0x10uLL:
      -[GKDashboardExtensionViewController setShouldShowPlayForTurnBasedMatch:]( self,  "setShouldShowPlayForTurnBasedMatch:",  [v13 BOOLValue]);
      break;
    case 0x11uLL:
      -[GKDashboardExtensionViewController setShouldShowQuitForTurnBasedMatch:]( self,  "setShouldShowQuitForTurnBasedMatch:",  [v13 BOOLValue]);
      break;
    case 0x12uLL:
      v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessageDashboardAssetNames]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessageLeaderboardSetNames]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessageLeaderboardNames]);
      -[GKDashboardExtensionViewController setDashboardAssetNames:leaderboardSetAssetNames:leaderboardAssetNames:]( self,  "setDashboardAssetNames:leaderboardSetAssetNames:leaderboardAssetNames:",  v15,  v16,  v17);

      break;
    default:
      if (v12 == (id)50)
      {
        -[GKDashboardExtensionViewController setLeaderboardPlayerScope:]( self,  "setLeaderboardPlayerScope:",  [v13 integerValue]);
      }

      else
      {
LABEL_10:
        v18.receiver = self;
        v18.super_class = (Class)&OBJC_CLASS___GKDashboardExtensionViewController;
        -[GKDashboardExtensionViewController messageFromClient:](&v18, "messageFromClient:", v4);
      }

      break;
  }
}

- (void)setDashboardAssetNames:(id)a3 leaderboardSetAssetNames:(id)a4 leaderboardAssetNames:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  -[GKDashboardExtensionViewController setDashboardAssetNames:](self, "setDashboardAssetNames:", a3);
  -[GKDashboardExtensionViewController setLeaderboardSetAssetNames:](self, "setLeaderboardSetAssetNames:", v9);

  -[GKDashboardExtensionViewController setLeaderboardAssetNames:](self, "setLeaderboardAssetNames:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController dashboardAssetNames](self, "dashboardAssetNames"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController dashboardRequest](self, "dashboardRequest"));
  [v11 setDashboardAssetNames:v10];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController leaderboardAssetNames](self, "leaderboardAssetNames"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController dashboardRequest](self, "dashboardRequest"));
  [v13 setLeaderboardAssetNames:v12];

  id v15 = (id)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController leaderboardSetAssetNames](self, "leaderboardSetAssetNames"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController dashboardRequest](self, "dashboardRequest"));
  [v14 setLeaderboardSetAssetNames:v15];
}

- (id)hostObjectProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController extensionContext](self, "extensionContext"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _auxiliaryConnection]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxyWithErrorHandler:&stru_10000C5A8]);

  return v4;
}

- (void)finishAndPlayChallenge:(id)a3
{
  v7[0] = &off_10000C840;
  v6[0] = GKExtensionMessageCommandKey;
  v6[1] = GKExtensionMessageParamKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 internal]);
  v7[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));
  -[GKDashboardExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);
}

- (void)finishWithTurnBasedMatch:(id)a3
{
  v7[0] = &off_10000C858;
  v6[0] = GKExtensionMessageCommandKey;
  v6[1] = GKExtensionMessageParamKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 internal]);
  v7[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));
  -[GKDashboardExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);
}

- (void)quitTurnBasedMatch:(id)a3
{
  v7[0] = &off_10000C870;
  v6[0] = GKExtensionMessageCommandKey;
  v6[1] = GKExtensionMessageParamKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 internal]);
  v7[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));
  -[GKDashboardExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);
}

- (void)dashboardDidChangeToViewState:(int64_t)a3
{
  if (self->_viewState != a3)
  {
    self->_viewState = a3;
    v6[0] = GKExtensionMessageCommandKey;
    v6[1] = GKExtensionMessageParamKey;
    v7[0] = &off_10000C888;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
    v7[1] = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));
    -[GKDashboardExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);
  }

- (void)dashboardDidChangeToLeaderboardTimeScope:(int64_t)a3
{
  if (self->_leaderboardTimeScope != a3)
  {
    self->_leaderboardTimeScope = a3;
    v6[0] = GKExtensionMessageCommandKey;
    v6[1] = GKExtensionMessageParamKey;
    v7[0] = &off_10000C8A0;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
    v7[1] = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));
    -[GKDashboardExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);
  }

- (void)dashboardDidChangeToLeaderboardPlayerScope:(int64_t)a3
{
  if (self->_leaderboardPlayerScope != a3)
  {
    self->_leaderboardPlayerScope = a3;
    v6[0] = GKExtensionMessageCommandKey;
    v6[1] = GKExtensionMessageParamKey;
    v7[0] = &off_10000C8B8;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
    v7[1] = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));
    -[GKDashboardExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);
  }

- (void)dashboardDidChangeToLeaderboardIdentifier:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_leaderboardIdentifier, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_leaderboardIdentifier, a3);
    v7[0] = GKExtensionMessageCommandKey;
    v7[1] = GKExtensionMessageParamKey;
    v8[0] = &off_10000C8D0;
    v8[1] = v5;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));
    -[GKDashboardExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v6);
  }
}

- (void)requestDashboardLogoImageWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController hostObjectProxy](self, "hostObjectProxy"));
  [v5 requestDashboardLogoImageWithHandler:v4];
}

- (void)requestImagesForLeaderboardSetsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController hostObjectProxy](self, "hostObjectProxy"));
  [v5 requestImagesForLeaderboardSetsWithHandler:v4];
}

- (void)requestImagesForLeaderboardsInSet:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[GKDashboardExtensionViewController hostObjectProxy](self, "hostObjectProxy"));
  [v8 requestImagesForLeaderboardsInSet:v7 handler:v6];
}

- (void)dismissWithGameController
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self, a2);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GameController: GKDashboardExtensionViewController was dismissed by the game controller.",  v5,  2u);
  }

  -[GKDashboardExtensionViewController extensionIsFinishing](self, "extensionIsFinishing");
}

- (int64_t)viewState
{
  return self->_viewState;
}

- (void)setViewState:(int64_t)a3
{
  self->_viewState = a3;
}

- (int64_t)leaderboardTimeScope
{
  return self->_leaderboardTimeScope;
}

- (void)setLeaderboardTimeScope:(int64_t)a3
{
  self->_leaderboardTimeScope = a3;
}

- (int64_t)leaderboardPlayerScope
{
  return self->_leaderboardPlayerScope;
}

- (void)setLeaderboardPlayerScope:(int64_t)a3
{
  self->_leaderboardPlayerScope = a3;
}

- (NSString)leaderboardIdentifier
{
  return self->_leaderboardIdentifier;
}

- (void)setLeaderboardIdentifier:(id)a3
{
}

- (NSString)leaderboardSetIdentifier
{
  return self->_leaderboardSetIdentifier;
}

- (void)setLeaderboardSetIdentifier:(id)a3
{
}

- (NSString)leaderboardTitle
{
  return self->_leaderboardTitle;
}

- (void)setLeaderboardTitle:(id)a3
{
}

- (GKLeaderboardInternal)leaderboardInternal
{
  return self->_leaderboardInternal;
}

- (void)setLeaderboardInternal:(id)a3
{
}

- (NSString)achievementIdentifier
{
  return self->_achievementIdentifier;
}

- (void)setAchievementIdentifier:(id)a3
{
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSString)playerIdentifier
{
  return self->_playerIdentifier;
}

- (void)setPlayerIdentifier:(id)a3
{
}

- (NSString)playerAlias
{
  return self->_playerAlias;
}

- (void)setPlayerAlias:(id)a3
{
}

- (NSString)gameBundleID
{
  return self->_gameBundleID;
}

- (void)setGameBundleID:(id)a3
{
}

- (NSString)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(id)a3
{
}

- (BOOL)shouldShowPlayForChallenge
{
  return self->_shouldShowPlayForChallenge;
}

- (void)setShouldShowPlayForChallenge:(BOOL)a3
{
  self->_shouldShowPlayForChallenge = a3;
}

- (BOOL)shouldShowPlayForTurnBasedMatch
{
  return self->_shouldShowPlayForTurnBasedMatch;
}

- (void)setShouldShowPlayForTurnBasedMatch:(BOOL)a3
{
  self->_shouldShowPlayForTurnBasedMatch = a3;
}

- (BOOL)shouldShowQuitForTurnBasedMatch
{
  return self->_shouldShowQuitForTurnBasedMatch;
}

- (void)setShouldShowQuitForTurnBasedMatch:(BOOL)a3
{
  self->_shouldShowQuitForTurnBasedMatch = a3;
}

- (NSDictionary)dashboardAssetNames
{
  return self->_dashboardAssetNames;
}

- (void)setDashboardAssetNames:(id)a3
{
}

- (NSDictionary)leaderboardSetAssetNames
{
  return self->_leaderboardSetAssetNames;
}

- (void)setLeaderboardSetAssetNames:(id)a3
{
}

- (NSDictionary)leaderboardAssetNames
{
  return self->_leaderboardAssetNames;
}

- (void)setLeaderboardAssetNames:(id)a3
{
}

- (GKDashboardRequest)dashboardRequest
{
  return self->_dashboardRequest;
}

- (void)setDashboardRequest:(id)a3
{
}

- (BOOL)isArcade
{
  return self->_isArcade;
}

- (void)setIsArcade:(BOOL)a3
{
  self->_isArcade = a3;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (void).cxx_destruct
{
}

@end