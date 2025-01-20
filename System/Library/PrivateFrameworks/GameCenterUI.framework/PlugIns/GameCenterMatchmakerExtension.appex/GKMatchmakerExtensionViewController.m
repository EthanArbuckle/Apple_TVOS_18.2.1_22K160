@interface GKMatchmakerExtensionViewController
- (BOOL)canStartWithMinimumPlayers;
- (BOOL)hosted;
- (BOOL)isEligibleForGroupSession;
- (BOOL)isEntitledToUseGroupActivities;
- (GKInvite)acceptedInvite;
- (GKMatchRequest)matchRequest;
- (GKMatchmakerExtensionViewController)initWithCoder:(id)a3;
- (GKPlayerPickerContext)playerPickerContext;
- (NSArray)existingPlayers;
- (id)hostObjectProxy;
- (id)nearbyPlayerHandler;
- (int64_t)matchmakingMode;
- (void)applicationWillEnterForeground;
- (void)constructContentViewController;
- (void)dismissWithGameController;
- (void)messageFromClient:(id)a3;
- (void)multiplayerP2PViewController:(id)a3 cancelInviteToPlayer:(id)a4;
- (void)multiplayerP2PViewController:(id)a3 didFinishWithError:(id)a4;
- (void)multiplayerP2PViewController:(id)a3 sendData:(id)a4;
- (void)multiplayerP2PViewController:(id)a3 setShareInvitees:(id)a4;
- (void)multiplayerP2PViewController:(id)a3 shareMatchWithRequest:(id)a4 handler:(id)a5;
- (void)multiplayerP2PViewController:(id)a3 startMatchingWithRequest:(id)a4;
- (void)multiplayerP2PViewControllerCancelMatching:(id)a3;
- (void)multiplayerPicker:(id)a3 didPickPlayers:(id)a4 messageGroups:(id)a5 customMessage:(id)a6;
- (void)multiplayerPickerDidCancel:(id)a3;
- (void)requestRecipientProperties:(id)a3;
- (void)setAcceptedInvite:(id)a3;
- (void)setCanStartWithMinimumPlayers:(BOOL)a3;
- (void)setDefaultInvitationMessage:(id)a3;
- (void)setExistingPlayers:(id)a3;
- (void)setHosted:(BOOL)a3;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setIsEligibleForGroupSession:(BOOL)a3;
- (void)setIsEntitledToUseGroupActivities:(BOOL)a3;
- (void)setMatchRequest:(id)a3;
- (void)setMatchmakingMode:(int64_t)a3;
- (void)setNearbyPlayer:(id)a3 reachable:(BOOL)a4;
- (void)setNearbyPlayerHandler:(id)a3;
- (void)setPlayerPickerContext:(id)a3;
- (void)startBrowsingForNearbyPlayersWithReachableHandler:(id)a3;
- (void)stopBrowsingForNearbyPlayers;
@end

@implementation GKMatchmakerExtensionViewController

- (GKMatchmakerExtensionViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKMatchmakerExtensionViewController;
  v3 = -[GKMatchmakerExtensionViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[GKMatchmakerExtensionViewController setAlwaysShowDoneButton:](v3, "setAlwaysShowDoneButton:", 0LL);
  }
  return v4;
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemMatchesHosted]);
  -[GKMatchmakerExtensionViewController setHosted:](self, "setHosted:", [v8 BOOLValue]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemMatchesMatchmakingMode]);
  -[GKMatchmakerExtensionViewController setMatchmakingMode:]( self,  "setMatchmakingMode:",  [v9 integerValue]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemMatchesFastStartEnabled]);
  -[GKMatchmakerExtensionViewController setCanStartWithMinimumPlayers:]( self,  "setCanStartWithMinimumPlayers:",  [v10 BOOLValue]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemMatchesGroupSessionEligible]);
  -[GKMatchmakerExtensionViewController setIsEligibleForGroupSession:]( self,  "setIsEligibleForGroupSession:",  [v11 BOOLValue]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemEntitledToGroupActivities]);
  -[GKMatchmakerExtensionViewController setIsEntitledToUseGroupActivities:]( self,  "setIsEntitledToUseGroupActivities:",  [v12 BOOLValue]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"playerPickerContext"]);
  -[GKMatchmakerExtensionViewController setPlayerPickerContext:](self, "setPlayerPickerContext:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemPlayerInternalsKey]);
  -[GKMatchmakerExtensionViewController setExistingPlayers:](self, "setExistingPlayers:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemMatchesMatchRequestInternal]);
  if (v15)
  {
    v16 = -[GKMatchRequest initWithInternalRepresentation:]( objc_alloc(&OBJC_CLASS___GKMatchRequest),  "initWithInternalRepresentation:",  v15);
    -[GKMatchmakerExtensionViewController setMatchRequest:](self, "setMatchRequest:", v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKExtensionItemMatchesAcceptedInviteInternal]);
  if (v17)
  {
    v18 = -[GKInvite initWithInternalRepresentation:]( objc_alloc(&OBJC_CLASS___GKInvite),  "initWithInternalRepresentation:",  v17);
    -[GKMatchmakerExtensionViewController setAcceptedInvite:](self, "setAcceptedInvite:", v18);
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GKMatchmakerExtensionViewController;
  -[GKMatchmakerExtensionViewController setInitialState:withReply:](&v19, "setInitialState:withReply:", v6, v7);
}

- (void)constructContentViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController acceptedInvite](self, "acceptedInvite"));
  if (v3
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController matchRequest](self, "matchRequest"))) != 0LL)
  {
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController playerPickerContext](self, "playerPickerContext"));

    if (!v16) {
      return;
    }
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController playerPickerContext](self, "playerPickerContext"));

  if (v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___GKDashboardMultiplayerPickerViewController);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController playerPickerContext](self, "playerPickerContext"));
    id v7 = [v6 maxPlayers];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController playerPickerContext](self, "playerPickerContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 excludedPlayers]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController playerPickerContext](self, "playerPickerContext"));
    id v11 = objc_msgSend( v5,  "initWithMaxSelectable:hiddenPlayers:nearbyOnly:pickerOrigin:",  v7,  v9,  0,  objc_msgSend(v10, "pickerOrigin"));

    [v11 setMultiplayerPickerDelegate:self];
    [v11 setNearbyDelegate:self];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    objc_msgSend(v11, "setSupportsNearby:", objc_msgSend(v12, "shouldAllowNearbyMultiplayer"));

    -[GKMatchmakerExtensionViewController setContentViewController:](self, "setContentViewController:", v11);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController acceptedInvite](self, "acceptedInvite"));

    id v14 = objc_alloc(&OBJC_CLASS___GKDashboardMultiplayerP2PViewController);
    if (v13)
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController acceptedInvite](self, "acceptedInvite"));
      id v15 = [v14 initWithAcceptedInvite:v11];
      -[GKMatchmakerExtensionViewController setContentViewController:](self, "setContentViewController:", v15);
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController matchRequest](self, "matchRequest"));
      id v18 = [v14 initWithMatchRequest:v17];
      -[GKMatchmakerExtensionViewController setContentViewController:](self, "setContentViewController:", v18);

      BOOL v19 = -[GKMatchmakerExtensionViewController canStartWithMinimumPlayers](self, "canStartWithMinimumPlayers");
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController contentViewController](self, "contentViewController"));
      [v11 setCanStartWithMinimumPlayers:v19];
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController playerPickerContext](self, "playerPickerContext"));
  if (!v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKGame currentGame](&OBJC_CLASS___GKGame, "currentGame"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController multiplayerViewController](self, "multiplayerViewController"));
    [v22 setGame:v21];

    BOOL v23 = -[GKMatchmakerExtensionViewController hosted](self, "hosted");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController multiplayerViewController](self, "multiplayerViewController"));
    [v24 setHosted:v23];

    int64_t v25 = -[GKMatchmakerExtensionViewController matchmakingMode](self, "matchmakingMode");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController multiplayerViewController](self, "multiplayerViewController"));
    [v26 setMatchmakingMode:v25];

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController existingPlayers](self, "existingPlayers"));
    id v28 = [v27 count];

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController multiplayerViewController]( self,  "multiplayerViewController"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController existingPlayers](self, "existingPlayers"));
      [v29 setExistingPlayers:v30];
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController multiplayerViewController](self, "multiplayerViewController"));
    [v31 setDelegate:self];

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController multiplayerViewController](self, "multiplayerViewController"));
    [v32 setNearbyDelegate:self];
  }

  -[GKMatchmakerExtensionViewController setAdjustTopConstraint:](self, "setAdjustTopConstraint:", 0LL);
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___GKMatchmakerExtensionViewController;
  -[GKMatchmakerExtensionViewController constructContentViewController](&v33, "constructContentViewController");
}

- (void)messageFromClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = GKExtensionProtocolSecureCodedClasses();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v20 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v6,  v4,  &v20));
  id v8 = v20;

  if (v8)
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers();
    }
    v10 = (os_log_s *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_100007CB4((uint64_t)v8, v10);
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessageCommandKey]);
  id v12 = [v11 integerValue];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessageParamKey]);
  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers();
  }
  id v15 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Got messageFromClient: %@", buf, 0xCu);
  }

  switch((unint64_t)v12)
  {
    case 0x1BuLL:
      -[GKMatchmakerExtensionViewController setHosted:](self, "setHosted:", [v13 BOOLValue]);
      break;
    case 0x1CuLL:
      v16 = -[GKMatchRequest initWithInternalRepresentation:]( objc_alloc(&OBJC_CLASS___GKMatchRequest),  "initWithInternalRepresentation:",  v13);
      -[GKMatchmakerExtensionViewController setMatchRequest:](self, "setMatchRequest:", v16);
      goto LABEL_24;
    case 0x1DuLL:
      v16 = -[GKInvite initWithInternalRepresentation:]( objc_alloc(&OBJC_CLASS___GKInvite),  "initWithInternalRepresentation:",  v13);
      -[GKMatchmakerExtensionViewController setAcceptedInvite:](self, "setAcceptedInvite:", v16);
      goto LABEL_24;
    case 0x1EuLL:
      -[GKMatchmakerExtensionViewController setExistingPlayers:](self, "setExistingPlayers:", v13);
      break;
    case 0x1FuLL:
      -[GKMatchmakerExtensionViewController setDefaultInvitationMessage:](self, "setDefaultInvitationMessage:", v13);
      break;
    case 0x20uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController multiplayerViewController]( self,  "multiplayerViewController"));
      objc_msgSend(v17, "setAutomatchPlayerCount:", objc_msgSend(v13, "integerValue"));
      goto LABEL_35;
    case 0x21uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController multiplayerViewController]( self,  "multiplayerViewController"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessagePlayerInternal]);
      objc_msgSend(v17, "setPlayer:responded:", v18, objc_msgSend(v13, "integerValue"));
      goto LABEL_34;
    case 0x22uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController multiplayerViewController]( self,  "multiplayerViewController"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessagePlayerInternal]);
      objc_msgSend(v17, "setPlayer:connected:", v18, objc_msgSend(v13, "BOOLValue"));
      goto LABEL_34;
    case 0x23uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController multiplayerViewController]( self,  "multiplayerViewController"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessagePlayerInternal]);
      [v17 setPlayer:v18 sentData:v13];
      goto LABEL_34;
    case 0x24uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController multiplayerViewController]( self,  "multiplayerViewController"));
      [v17 setInvitesFailedWithError:v13];
      goto LABEL_35;
    case 0x25uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController multiplayerViewController]( self,  "multiplayerViewController"));
      [v17 setAutomatchFailedWithError:v13];
      goto LABEL_35;
    case 0x26uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController multiplayerViewController]( self,  "multiplayerViewController"));
      [v17 inviterCancelled];
      goto LABEL_35;
    case 0x27uLL:
      v16 = (GKMatchRequest *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessagePlayerID]);
      -[GKMatchmakerExtensionViewController setNearbyPlayer:reachable:]( self,  "setNearbyPlayer:reachable:",  v16,  [v13 BOOLValue]);
LABEL_24:

      break;
    case 0x28uLL:
      -[GKMatchmakerExtensionViewController applicationWillEnterForeground](self, "applicationWillEnterForeground");
      break;
    case 0x29uLL:
    case 0x34uLL:
      break;
    case 0x30uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController multiplayerViewController]( self,  "multiplayerViewController"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessagePlayerInternal]);
      [v17 setConnectingStateForPlayer:v18];
      goto LABEL_34;
    case 0x31uLL:
      -[GKMatchmakerExtensionViewController setMatchmakingMode:]( self,  "setMatchmakingMode:",  [v13 integerValue]);
      break;
    case 0x33uLL:
      -[GKMatchmakerExtensionViewController setCanStartWithMinimumPlayers:]( self,  "setCanStartWithMinimumPlayers:",  [v13 BOOLValue]);
      break;
    case 0x38uLL:
      -[GKMatchmakerExtensionViewController setIsEligibleForGroupSession:]( self,  "setIsEligibleForGroupSession:",  [v13 BOOLValue]);
      break;
    case 0x3AuLL:
      break;
    case 0x3DuLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController multiplayerViewController]( self,  "multiplayerViewController"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessagePlayerInternal]);
      [v17 updateRecipientProperties:v13 forPlayer:v18];
LABEL_34:

LABEL_35:
      break;
    default:
      v19.receiver = self;
      v19.super_class = (Class)&OBJC_CLASS___GKMatchmakerExtensionViewController;
      -[GKMatchmakerExtensionViewController messageFromClient:](&v19, "messageFromClient:", v4);
      break;
  }
}

- (void)setHosted:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hosted = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController contentViewController](self, "contentViewController"));

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController multiplayerViewController](self, "multiplayerViewController"));
    [v6 setHosted:v3];
  }

- (void)setCanStartWithMinimumPlayers:(BOOL)a3
{
  BOOL v3 = a3;
  self->_canStartWithMinimumPlayers = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController contentViewController](self, "contentViewController"));

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController multiplayerViewController](self, "multiplayerViewController"));
    [v6 setCanStartWithMinimumPlayers:v3];
  }

- (void)setIsEligibleForGroupSession:(BOOL)a3
{
  self->_isEligibleForGroupSession = a3;
}

- (void)setMatchmakingMode:(int64_t)a3
{
  self->_matchmakingMode = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController contentViewController](self, "contentViewController"));

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController multiplayerViewController](self, "multiplayerViewController"));
    [v6 setMatchmakingMode:a3];
  }

- (void)setExistingPlayers:(id)a3
{
  p_existingPlayers = &self->_existingPlayers;
  v10 = (NSArray *)a3;
  if (*p_existingPlayers != v10)
  {
    objc_storeStrong((id *)&self->_existingPlayers, a3);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController contentViewController](self, "contentViewController"));
    if (v6)
    {
      id v7 = (void *)v6;
      NSUInteger v8 = -[NSArray count](*p_existingPlayers, "count");

      if (v8)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController multiplayerViewController]( self,  "multiplayerViewController"));
        [v9 setExistingPlayers:v10];
      }
    }
  }
}

- (void)setDefaultInvitationMessage:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController matchRequest](self, "matchRequest"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 inviteMessage]);

  if (v5 != v10)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController matchRequest](self, "matchRequest"));
    [v6 setInviteMessage:v10];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController contentViewController](self, "contentViewController"));
    if (v7)
    {
      NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchRequest inviteMessage](self->_matchRequest, "inviteMessage"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController multiplayerViewController](self, "multiplayerViewController"));
      [v9 setDefaultInvitationMessage:v8];
    }
  }
}

- (void)setNearbyPlayer:(id)a3 reachable:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController nearbyPlayerHandler](self, "nearbyPlayerHandler"));

  if (v6)
  {
    id v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[GKMatchmakerExtensionViewController nearbyPlayerHandler]( self,  "nearbyPlayerHandler"));
    ((void (**)(void, id, BOOL))v7)[2](v7, v8, v4);
  }
}

- (void)applicationWillEnterForeground
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  [v3 invalidate];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController multiplayerViewController](self, "multiplayerViewController"));
  [v4 applicationWillEnterForeground];
}

- (id)hostObjectProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController extensionContext](self, "extensionContext"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _auxiliaryConnection]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxyWithErrorHandler:&stru_10000C380]);

  return v4;
}

- (void)multiplayerP2PViewController:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10000C5B8,  GKExtensionMessageCommandKey,  0LL));
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:GKExtensionMessageParamKey];
  }
  -[GKMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);
}

- (void)multiplayerP2PViewController:(id)a3 shareMatchWithRequest:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[GKMatchmakerExtensionViewController hostObjectProxy](self, "hostObjectProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 internal]);

  [v10 shareMatchWithRequest:v9 handler:v7];
}

- (void)multiplayerP2PViewController:(id)a3 setShareInvitees:(id)a4
{
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  v8[0] = &off_10000C5D0;
  v8[1] = a4;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  -[GKMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v6);
}

- (void)multiplayerP2PViewController:(id)a3 startMatchingWithRequest:(id)a4
{
  v8[0] = &off_10000C5E8;
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "internal", a3));
  v8[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));
  -[GKMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v6);
}

- (void)multiplayerP2PViewController:(id)a3 cancelInviteToPlayer:(id)a4
{
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  v8[0] = &off_10000C600;
  v8[1] = a4;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  -[GKMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v6);
}

- (void)multiplayerP2PViewController:(id)a3 sendData:(id)a4
{
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  v8[0] = &off_10000C618;
  v8[1] = a4;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  -[GKMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v6);
}

- (void)multiplayerP2PViewControllerCancelMatching:(id)a3
{
  uint64_t v5 = GKExtensionMessageCommandKey;
  id v6 = &off_10000C630;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  -[GKMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v4);
}

- (void)startBrowsingForNearbyPlayersWithReachableHandler:(id)a3
{
  v5[0] = GKExtensionMessageCommandKey;
  v5[1] = GKExtensionMessageParamKey;
  v6[0] = &off_10000C648;
  v6[1] = &__kCFBooleanTrue;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  2LL));
  -[GKMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v4);
}

- (void)stopBrowsingForNearbyPlayers
{
  v4[0] = GKExtensionMessageCommandKey;
  v4[1] = GKExtensionMessageParamKey;
  v5[0] = &off_10000C648;
  v5[1] = &__kCFBooleanFalse;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  2LL));
  -[GKMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v3);
}

- (void)requestRecipientProperties:(id)a3
{
  v6[0] = GKExtensionMessageCommandKey;
  v6[1] = GKExtensionMessageParamKey;
  v7[0] = &off_10000C660;
  v7[1] = a3;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  -[GKMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);
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
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GameController: GKMatchmakerExtensionViewController was dismissed by the game controller.",  v5,  2u);
  }

  -[GKMatchmakerExtensionViewController extensionIsCanceling](self, "extensionIsCanceling");
}

- (void)multiplayerPicker:(id)a3 didPickPlayers:(id)a4 messageGroups:(id)a5 customMessage:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v15 = v13;
  if (!os_log_GKGeneral) {
    id v16 = (id)GKOSLoggers(v13, v14);
  }
  v17 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v11;
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Extension - player picker - didPickPlayers: %@, customMessage: %@",  buf,  0x16u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v11 _gkInternalsFromPlayers]);
  [v18 setObject:v19 forKeyedSubscript:@"players"];

  v21[0] = GKExtensionMessageCommandKey;
  v21[1] = GKExtensionMessageParamKey;
  v22[0] = &off_10000C678;
  v22[1] = v18;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  -[GKMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v20);

  [v10 dismissViewControllerAnimated:1 completion:0];
  -[GKMatchmakerExtensionViewController extensionIsCanceling](self, "extensionIsCanceling");
}

- (void)multiplayerPickerDidCancel:(id)a3
{
  uint64_t v11 = GKExtensionMessageCommandKey;
  id v12 = &off_10000C690;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  -[GKMatchmakerExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v5);

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6, v7);
  }
  id v9 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Extension - player picker - didCancel", v10, 2u);
  }

  [v4 dismissViewControllerAnimated:1 completion:0];

  -[GKMatchmakerExtensionViewController extensionIsCanceling](self, "extensionIsCanceling");
}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (void)setMatchRequest:(id)a3
{
}

- (GKInvite)acceptedInvite
{
  return self->_acceptedInvite;
}

- (void)setAcceptedInvite:(id)a3
{
}

- (BOOL)hosted
{
  return self->_hosted;
}

- (int64_t)matchmakingMode
{
  return self->_matchmakingMode;
}

- (NSArray)existingPlayers
{
  return self->_existingPlayers;
}

- (id)nearbyPlayerHandler
{
  return self->_nearbyPlayerHandler;
}

- (void)setNearbyPlayerHandler:(id)a3
{
}

- (BOOL)canStartWithMinimumPlayers
{
  return self->_canStartWithMinimumPlayers;
}

- (BOOL)isEligibleForGroupSession
{
  return self->_isEligibleForGroupSession;
}

- (BOOL)isEntitledToUseGroupActivities
{
  return self->_isEntitledToUseGroupActivities;
}

- (void)setIsEntitledToUseGroupActivities:(BOOL)a3
{
  self->_isEntitledToUseGroupActivities = a3;
}

- (GKPlayerPickerContext)playerPickerContext
{
  return self->_playerPickerContext;
}

- (void)setPlayerPickerContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end