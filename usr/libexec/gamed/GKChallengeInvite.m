@interface GKChallengeInvite
+ (BOOL)supportsSecureCoding;
- (GKChallengeInternal)challenge;
- (GKChallengeInvite)initWithChallenge:(id)a3;
- (GKChallengeInvite)initWithCoder:(id)a3;
- (GKPlayerInternal)issuingPlayer;
- (GKPlayerInternal)receivingPlayer;
- (NSDictionary)pushDescriptor;
- (NSString)challengeID;
- (NSString)gameTitle;
- (NSString)goalText;
- (NSString)resolvedBundleID;
- (id)challengeInternalObject;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)loadDetailsWithHandler:(id)a3;
- (void)loadGoalTextForGameDescriptor:(id)a3 handler:(id)a4;
- (void)setChallenge:(id)a3;
- (void)setChallengeID:(id)a3;
- (void)setGameTitle:(id)a3;
- (void)setGoalText:(id)a3;
- (void)setIssuingPlayer:(id)a3;
- (void)setPushDescriptor:(id)a3;
- (void)setReceivingPlayer:(id)a3;
- (void)setResolvedBundleID:(id)a3;
@end

@implementation GKChallengeInvite

- (GKChallengeInvite)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___GKChallengeInvite;
  v6 = -[GKChallengeInvite init](&v35, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(GKPlayerInternal, v5),  @"receivingPlayer");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    receivingPlayer = v6->_receivingPlayer;
    v6->_receivingPlayer = (GKPlayerInternal *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(GKPlayerInternal, v10),  @"issuingPlayer");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    issuingPlayer = v6->_issuingPlayer;
    v6->_issuingPlayer = (GKPlayerInternal *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(GKChallengeInternal, v14),  @"challenge");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    challenge = v6->_challenge;
    v6->_challenge = (GKChallengeInternal *)v16;

    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v18),  @"goalText");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    goalText = v6->_goalText;
    v6->_goalText = (NSString *)v20;

    id v23 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v22),  @"gameTitle");
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    gameTitle = v6->_gameTitle;
    v6->_gameTitle = (NSString *)v24;

    id v27 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v26),  @"resolvedBundleID");
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    resolvedBundleID = v6->_resolvedBundleID;
    v6->_resolvedBundleID = (NSString *)v28;

    id v31 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v30),  @"challengeID");
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    challengeID = v6->_challengeID;
    v6->_challengeID = (NSString *)v32;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  receivingPlayer = self->_receivingPlayer;
  id v5 = a3;
  [v5 encodeObject:receivingPlayer forKey:@"receivingPlayer"];
  [v5 encodeObject:self->_issuingPlayer forKey:@"issuingPlayer"];
  [v5 encodeObject:self->_challenge forKey:@"challenge"];
  [v5 encodeObject:self->_goalText forKey:@"goalText"];
  [v5 encodeObject:self->_gameTitle forKey:@"gameTitle"];
  [v5 encodeObject:self->_resolvedBundleID forKey:@"resolvedBundleID"];
  [v5 encodeObject:self->_challengeID forKey:@"challengeID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeInvite pushDescriptor](self, "pushDescriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKChallengeInvite: %@",  v2));

  return v3;
}

- (id)challengeInternalObject
{
  return 0LL;
}

- (GKChallengeInvite)initWithChallenge:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GKChallengeInvite;
  v6 = -[GKChallengeInvite init](&v9, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_challenge, a3);
  }

  return v7;
}

- (void)loadDetailsWithHandler:(id)a3
{
  id v23 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKChallengeInvite.m",  101LL,  "-[GKChallengeInvite loadDetailsWithHandler:]"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeInvite challenge](self, "challenge"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 receivingPlayer]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerID]);
  v32[0] = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeInvite challenge](self, "challenge"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 issuingPlayer]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playerID]);
  v32[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000D9C88;
  v28[3] = &unk_10026B080;
  id v14 = v6;
  id v29 = v14;
  id v30 = v13;
  id v31 = self;
  id v15 = v13;
  [v5 perform:v28];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeInternal bundleID](self->_challenge, "bundleID"));
  -[GKChallengeInvite setResolvedBundleID:](self, "setResolvedBundleID:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeInternal game](self->_challenge, "game"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);
  -[GKChallengeInvite setGameTitle:](self, "setGameTitle:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000D9DC8;
  v24[3] = &unk_10026BB70;
  v24[4] = self;
  id v25 = v17;
  id v26 = v14;
  id v27 = v23;
  id v20 = v14;
  id v21 = v23;
  id v22 = v17;
  [v5 notifyOnQueue:v19 block:v24];
}

- (void)loadGoalTextForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = dispatch_group_create();
  v35[0] = 0LL;
  v35[1] = v35;
  v35[2] = 0x3032000000LL;
  v35[3] = sub_1000DA334;
  v35[4] = sub_1000DA344;
  id v36 = 0LL;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  challenge = self->_challenge;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___GKAchievementChallengeInternal, v11);
  char isKindOfClass = objc_opt_isKindOfClass(challenge, v12);
  id v15 = self->_challenge;
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v16 = v15;
    dispatch_group_enter(v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKGameStatService,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v9,  0LL));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    void v32[2] = sub_1000DA34C;
    v32[3] = &unk_100271840;
    uint64_t v18 = v16;
    v33 = v18;
    v34[1] = v35;
    v34[0] = v8;
    [v17 getAchievementDescriptionsForGameDescriptor:v6 handler:v32];
    id v19 = (id *)&v33;
    id v20 = (id *)v34;
LABEL_5:

    goto LABEL_6;
  }

  uint64_t v21 = objc_opt_class(&OBJC_CLASS___GKScoreChallengeInternal, v14);
  if ((objc_opt_isKindOfClass(v15, v21) & 1) != 0)
  {
    id v22 = self->_challenge;
    dispatch_group_enter(v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKGameStatService,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v9,  0LL));
    receivingPlayer = self->_receivingPlayer;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000DA50C;
    v29[3] = &unk_100271840;
    uint64_t v18 = v22;
    id v30 = v18;
    v31[1] = v35;
    v31[0] = v8;
    [v17 getLeaderboardsForGameDescriptor:v6 player:receivingPlayer setIdentifier:0 handler:v29];
    id v19 = (id *)&v30;
    id v20 = (id *)v31;
    goto LABEL_5;
  }

- (GKChallengeInternal)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (GKPlayerInternal)receivingPlayer
{
  return self->_receivingPlayer;
}

- (void)setReceivingPlayer:(id)a3
{
}

- (GKPlayerInternal)issuingPlayer
{
  return self->_issuingPlayer;
}

- (void)setIssuingPlayer:(id)a3
{
}

- (NSString)goalText
{
  return self->_goalText;
}

- (void)setGoalText:(id)a3
{
}

- (NSString)gameTitle
{
  return self->_gameTitle;
}

- (void)setGameTitle:(id)a3
{
}

- (NSString)resolvedBundleID
{
  return self->_resolvedBundleID;
}

- (void)setResolvedBundleID:(id)a3
{
}

- (NSString)challengeID
{
  return self->_challengeID;
}

- (void)setChallengeID:(id)a3
{
}

- (NSDictionary)pushDescriptor
{
  return self->_pushDescriptor;
}

- (void)setPushDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end