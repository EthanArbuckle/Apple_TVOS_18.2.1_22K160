@interface GKTurnBasedMatchmakerExtensionViewController
- (BOOL)showExistingMatches;
- (BOOL)showPlay;
- (BOOL)showQuit;
- (GKMatchRequest)matchRequest;
- (id)hostObjectProxy;
- (id)turnBasedViewController;
- (void)constructContentViewController;
- (void)dismissWithGameController;
- (void)finishWithTurnBasedMatch:(id)a3;
- (void)messageFromClient:(id)a3;
- (void)quitTurnBasedMatch:(id)a3;
- (void)refreshMatches;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setMatchRequest:(id)a3;
- (void)setShowExistingMatches:(BOOL)a3;
- (void)setShowPlay:(BOOL)a3;
- (void)setShowQuit:(BOOL)a3;
- (void)turnBasedViewController:(id)a3 didFailWithError:(id)a4;
- (void)turnBasedViewController:(id)a3 didFindMatch:(id)a4;
- (void)turnBasedViewController:(id)a3 playerQuitForMatch:(id)a4;
@end

@implementation GKTurnBasedMatchmakerExtensionViewController

- (id)turnBasedViewController
{
  return -[GKTurnBasedMatchmakerExtensionViewController contentViewController](self, "contentViewController");
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemMatchesShowPlayForMatch]);
  -[GKTurnBasedMatchmakerExtensionViewController setShowPlay:](self, "setShowPlay:", [v8 BOOLValue]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemMatchesShowQuitForMatch]);
  -[GKTurnBasedMatchmakerExtensionViewController setShowQuit:](self, "setShowQuit:", [v9 BOOLValue]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemMatchesShowExistingMatches]);
  -[GKTurnBasedMatchmakerExtensionViewController setShowExistingMatches:]( self,  "setShowExistingMatches:",  [v10 BOOLValue]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemMatchesMatchRequestInternal]);
  if (v11)
  {
    v12 = -[GKMatchRequest initWithInternalRepresentation:]( objc_alloc(&OBJC_CLASS___GKMatchRequest),  "initWithInternalRepresentation:",  v11);
    -[GKTurnBasedMatchmakerExtensionViewController setMatchRequest:](self, "setMatchRequest:", v12);
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GKTurnBasedMatchmakerExtensionViewController;
  -[GKTurnBasedMatchmakerExtensionViewController setInitialState:withReply:](&v13, "setInitialState:withReply:", v6, v7);
}

- (void)constructContentViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMatchmakerExtensionViewController matchRequest](self, "matchRequest"));

  if (v3)
  {
    -[GKTurnBasedMatchmakerExtensionViewController setAdjustTopConstraint:](self, "setAdjustTopConstraint:", 0LL);
    -[GKTurnBasedMatchmakerExtensionViewController setAlwaysShowDoneButton:](self, "setAlwaysShowDoneButton:", 0LL);
    id v4 = objc_alloc(&OBJC_CLASS___GKTurnBasedMatchesViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMatchmakerExtensionViewController matchRequest](self, "matchRequest"));
    id v6 = [v4 initWithMatchRequest:v5];
    -[GKTurnBasedMatchmakerExtensionViewController setContentViewController:](self, "setContentViewController:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKGame currentGame](&OBJC_CLASS___GKGame, "currentGame"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[GKTurnBasedMatchmakerExtensionViewController turnBasedViewController]( self,  "turnBasedViewController"));
    [v8 setGame:v7];

    v9 = (void *)objc_claimAutoreleasedReturnValue( -[GKTurnBasedMatchmakerExtensionViewController turnBasedViewController]( self,  "turnBasedViewController"));
    [v9 setDelegate:self];

    BOOL showExistingMatches = self->_showExistingMatches;
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[GKTurnBasedMatchmakerExtensionViewController turnBasedViewController]( self,  "turnBasedViewController"));
    [v11 setShowExistingMatches:showExistingMatches];

    BOOL showPlay = self->_showPlay;
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( -[GKTurnBasedMatchmakerExtensionViewController turnBasedViewController]( self,  "turnBasedViewController"));
    [v13 setShowPlay:showPlay];

    BOOL showQuit = self->_showQuit;
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[GKTurnBasedMatchmakerExtensionViewController turnBasedViewController]( self,  "turnBasedViewController"));
    [v15 setShowQuit:showQuit];

    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___GKTurnBasedMatchmakerExtensionViewController;
    -[GKTurnBasedMatchmakerExtensionViewController constructContentViewController]( &v16,  "constructContentViewController");
  }

- (void)messageFromClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = GKExtensionProtocolSecureCodedClasses();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v17 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v6,  v4,  &v17));
  id v8 = v17;

  if (v8)
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers();
    }
    v10 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000029A4((uint64_t)v8, v10);
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessageCommandKey]);
  uint64_t v12 = (uint64_t)[v11 integerValue];

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessageParamKey]);
  v14 = v13;
  if (v12 <= 27)
  {
    if (v12 == 16)
    {
      -[GKTurnBasedMatchmakerExtensionViewController setShowPlay:](self, "setShowPlay:", [v13 BOOLValue]);
      goto LABEL_18;
    }

    if (v12 == 17)
    {
      -[GKTurnBasedMatchmakerExtensionViewController setShowQuit:](self, "setShowQuit:", [v13 BOOLValue]);
      goto LABEL_18;
    }

- (void)setShowPlay:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL showPlay = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMatchmakerExtensionViewController turnBasedViewController](self, "turnBasedViewController"));
  [v4 setShowPlay:v3];
}

- (void)setShowQuit:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL showQuit = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMatchmakerExtensionViewController turnBasedViewController](self, "turnBasedViewController"));
  [v4 setShowQuit:v3];
}

- (void)refreshMatches
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMatchmakerExtensionViewController turnBasedViewController](self, "turnBasedViewController"));
  [v2 setNeedsRefresh];
}

- (id)hostObjectProxy
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMatchmakerExtensionViewController extensionContext](self, "extensionContext"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _auxiliaryConnection]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxyWithErrorHandler:&stru_100004190]);

  return v4;
}

- (void)finishWithTurnBasedMatch:(id)a3
{
  v7[0] = &off_1000041F8;
  v6[0] = GKExtensionMessageCommandKey;
  v6[1] = GKExtensionMessageParamKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 internal]);
  v7[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));
  -[GKTurnBasedMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);
}

- (void)quitTurnBasedMatch:(id)a3
{
  v7[0] = &off_100004210;
  v6[0] = GKExtensionMessageCommandKey;
  v6[1] = GKExtensionMessageParamKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 internal]);
  v7[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));
  -[GKTurnBasedMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);
}

- (void)dismissWithGameController
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self, a2);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GameController: GKTurnBasedMatchmakerExtensionViewController was dismissed by the game controller.",  v5,  2u);
  }

  -[GKTurnBasedMatchmakerExtensionViewController extensionIsCanceling](self, "extensionIsCanceling");
}

- (void)turnBasedViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &off_100004228,  GKExtensionMessageCommandKey,  0LL));
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:GKExtensionMessageParamKey];
  }
  -[GKTurnBasedMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);
}

- (void)turnBasedViewController:(id)a3 didFindMatch:(id)a4
{
  v8[0] = &off_1000041F8;
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "internal", a3));
  v8[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));
  -[GKTurnBasedMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v6);
}

- (void)turnBasedViewController:(id)a3 playerQuitForMatch:(id)a4
{
  v8[0] = &off_100004210;
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "internal", a3));
  v8[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));
  -[GKTurnBasedMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v6);
}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (void)setMatchRequest:(id)a3
{
}

- (BOOL)showExistingMatches
{
  return self->_showExistingMatches;
}

- (void)setShowExistingMatches:(BOOL)a3
{
  self->_BOOL showExistingMatches = a3;
}

- (BOOL)showPlay
{
  return self->_showPlay;
}

- (BOOL)showQuit
{
  return self->_showQuit;
}

- (void).cxx_destruct
{
}

@end