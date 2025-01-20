@interface GKChallengeIssueExtensionViewController
- (BOOL)_useBackdropViewForWindowBackground;
- (BOOL)forcePicker;
- (GKChallenge)challenge;
- (GKChallengeIssueExtensionViewController)initWithCoder:(id)a3;
- (NSArray)players;
- (NSString)defaultMessage;
- (id)completionHandler;
- (id)hostObjectProxy;
- (void)constructContentViewController;
- (void)setChallenge:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDefaultMessage:(id)a3;
- (void)setForcePicker:(BOOL)a3;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setPlayers:(id)a3;
@end

@implementation GKChallengeIssueExtensionViewController

- (GKChallengeIssueExtensionViewController)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKChallengeIssueExtensionViewController;
  v3 = -[GKChallengeIssueExtensionViewController initWithCoder:](&v8, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[GKChallengeIssueExtensionViewController setAlwaysShowDoneButton:](v3, "setAlwaysShowDoneButton:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    BOOL v6 = [v5 userInterfaceIdiom] == (id)2;

    -[GKChallengeIssueExtensionViewController setForcePicker:](v4, "setForcePicker:", v6);
  }

  return v4;
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = GKExtensionItemChallengeInternalKey;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKChallenge challengeForInternalRepresentation:]( &OBJC_CLASS___GKChallenge,  "challengeForInternalRepresentation:",  v9));
  -[GKChallengeIssueExtensionViewController setChallenge:](self, "setChallenge:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemMessageKey]);
  -[GKChallengeIssueExtensionViewController setDefaultMessage:](self, "setDefaultMessage:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v13 = [v12 userInterfaceIdiom];

  if (v13 != (id)2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemForcePickerKey]);
    -[GKChallengeIssueExtensionViewController setForcePicker:](self, "setForcePicker:", [v14 BOOLValue]);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemPlayerInternalsKey]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 _gkMapWithBlock:&stru_1000041A8]);
  -[GKChallengeIssueExtensionViewController setPlayers:](self, "setPlayers:", v16);

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___GKChallengeIssueExtensionViewController;
  -[GKChallengeIssueExtensionViewController setInitialState:withReply:](&v17, "setInitialState:withReply:", v6, v8);
}

- (void)constructContentViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___UIViewController);
  -[GKChallengeIssueExtensionViewController setContentViewController:](self, "setContentViewController:", v3);

  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x3032000000LL;
  v10[3] = sub_100002924;
  v10[4] = sub_100002934;
  v11 = self;
  challenge = v11->_challenge;
  players = v11->_players;
  defaultMessage = v11->_defaultMessage;
  BOOL forcePicker = v11->_forcePicker;
  v8[4] = v10;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000293C;
  v9[3] = &unk_1000041D0;
  v9[4] = v11;
  v9[5] = v10;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000029DC;
  v8[3] = &unk_100004238;
  +[GKChallengeComposeController composeAndSendFlowForChallenge:selectPlayers:defaultMessage:forcePicker:readyHandler:completionHandler:]( &OBJC_CLASS___GKChallengeComposeController,  "composeAndSendFlowForChallenge:selectPlayers:defaultMessage:forcePicker:readyHandler:completionHandler:",  challenge,  players,  defaultMessage,  forcePicker,  v9,  v8);
  _Block_object_dispose(v10, 8);
}

- (BOOL)_useBackdropViewForWindowBackground
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)1)
  {
    LOBYTE(v4) = 1;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKGame currentGame](&OBJC_CLASS___GKGame, "currentGame"));
    unsigned int v4 = [v5 isGameCenter] ^ 1;
  }

  return v4;
}

- (id)hostObjectProxy
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeIssueExtensionViewController extensionContext](self, "extensionContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _auxiliaryConnection]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:&stru_100004278]);

  if (!v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2 object:self file:@"GKChallengeIssueExtensionViewController.m" lineNumber:112 description:@"GKChallengeIssueExtensionContext remote object proxy is nil!"];
  }

  return v6;
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSString)defaultMessage
{
  return self->_defaultMessage;
}

- (void)setDefaultMessage:(id)a3
{
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
}

- (BOOL)forcePicker
{
  return self->_forcePicker;
}

- (void)setForcePicker:(BOOL)a3
{
  self->_BOOL forcePicker = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end