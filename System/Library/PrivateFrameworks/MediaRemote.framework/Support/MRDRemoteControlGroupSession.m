@interface MRDRemoteControlGroupSession
+ (id)hostedSessionWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5;
+ (id)remoteSessionWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHosted;
- (BOOL)isLowPowerMode;
- (BOOL)isUpdatingLowPowerMode;
- (MRDFastSyncGroupSession)fastSyncSession;
- (MRDGroupSessionParticipant)leader;
- (MRDGroupSessionParticipant)localParticipant;
- (MRDRemoteControlGroupSession)initWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6;
- (MRDRemoteControlGroupSession)initWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5 hostSigningKey:(id)a6;
- (MRGroupSessionToken)joinToken;
- (MRUserIdentity)localIdentity;
- (MSVTimer)lowPowerDeferralTimer;
- (NSArray)members;
- (NSArray)participants;
- (NSArray)pendingParticipants;
- (NSArray)remoteParticipants;
- (NSArray)remotePendingParticipants;
- (NSError)lowPowerError;
- (NSHashTable)observers;
- (NSMapTable)pendingJoinCompletions;
- (NSMapTable)pendingParticipantsMap;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedSessionName;
- (NSString)sharedSecret;
- (OS_dispatch_queue)notificationQueue;
- (_TtC12mediaremoted14MRDNearbyGroup)nearbyGroup;
- (_TtC12mediaremoted19MRDNearbyInvitation)nearbyInvitation;
- (id)handleJoinRequest:(id)a3 isGuest:(BOOL)a4 completion:(id)a5;
- (int64_t)state;
- (os_unfair_lock_s)lock;
- (unint64_t)hash;
- (unsigned)routeType;
- (void)_initializeWithIdentity:(id)a3 nearbyGroup:(id)a4 isHosted:(BOOL)a5 hostSigningKey:(id)a6;
- (void)addObserver:(id)a3;
- (void)approvePendingParticipant:(id)a3;
- (void)clearPendingCompletions;
- (void)dealloc;
- (void)denyPendingParticipant:(id)a3;
- (void)finish;
- (void)handleApprovedJoinRequest:(id)a3 isGuest:(BOOL)a4;
- (void)handleDisplayMonitorChangeNotification:(id)a3;
- (void)reevaluateLowPowerMode;
- (void)removeAllParticipants;
- (void)removeObserver:(id)a3;
- (void)removeParticipant:(id)a3;
- (void)revokeAutoApprovalForAllParticipants;
- (void)revokeAutoApprovalForParticipant:(id)a3;
- (void)sendMessageData:(id)a3 toParticipants:(id)a4;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)session:(id)a3 didReceiveRemoteApprovalForPendingParticipant:(id)a4 from:(id)a5;
- (void)session:(id)a3 didReceiveRemoteControlMessage:(id)a4 from:(id)a5;
- (void)session:(id)a3 didReceiveRemoteRejectionForPendingParticipant:(id)a4 from:(id)a5;
- (void)session:(id)a3 didReceiveRemoteRemoveAllRequestFromParticipant:(id)a4;
- (void)session:(id)a3 didReceiveRemoteRemoveRequestForParticipant:(id)a4 from:(id)a5;
- (void)session:(id)a3 didUpdateMembers:(id)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4;
- (void)sessionDidCompleteIdentityShare:(id)a3;
- (void)setIsHosted:(BOOL)a3;
- (void)setIsLowPowerMode:(BOOL)a3;
- (void)setIsUpdatingLowPowerMode:(BOOL)a3;
- (void)setJoinToken:(id)a3;
- (void)setLeader:(id)a3;
- (void)setLowPowerDeferralTimer:(id)a3;
- (void)setLowPowerError:(id)a3;
- (void)setMembers:(id)a3;
- (void)setNearbyGroup:(id)a3;
- (void)setNearbyInvitation:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPendingJoinCompletions:(id)a3;
- (void)setPendingParticipantsMap:(id)a3;
- (void)setRemotePendingParticipants:(id)a3;
- (void)setSharedSecret:(id)a3;
- (void)setState:(int64_t)a3;
- (void)start;
- (void)trackJoinResponseApproved:(BOOL)a3;
- (void)transitionToState:(int64_t)a3;
@end

@implementation MRDRemoteControlGroupSession

+ (id)hostedSessionWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[MRDRemoteControlGroupSession initWithNearbyGroup:nearbyInvitation:identity:hostSigningKey:]( objc_alloc(&OBJC_CLASS___MRDRemoteControlGroupSession),  "initWithNearbyGroup:nearbyInvitation:identity:hostSigningKey:",  v9,  v8,  v7,  0LL);

  return v10;
}

+ (id)remoteSessionWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = -[MRDRemoteControlGroupSession initWithNearbyGroup:identity:hostSigningKey:joinToken:]( objc_alloc(&OBJC_CLASS___MRDRemoteControlGroupSession),  "initWithNearbyGroup:identity:hostSigningKey:joinToken:",  v12,  v11,  v10,  v9);

  return v13;
}

- (MRDRemoteControlGroupSession)initWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5 hostSigningKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MRDRemoteControlGroupSession;
  v14 = -[MRDRemoteControlGroupSession init](&v29, "init");
  v15 = v14;
  if (v14)
  {
    -[MRDRemoteControlGroupSession _initializeWithIdentity:nearbyGroup:isHosted:hostSigningKey:]( v14,  "_initializeWithIdentity:nearbyGroup:isHosted:hostSigningKey:",  v12,  v10,  1LL,  v13);
    objc_storeStrong((id *)&v15->_nearbyInvitation, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v17 = [v16 groupSessionGenerateSharedSecret];

    if (v17)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v10 sessionSecret]);
      sharedSecret = v15->_sharedSecret;
      v15->_sharedSecret = (NSString *)v18;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MRDeviceInfoRequest localDeviceInfo](&OBJC_CLASS___MRDeviceInfoRequest, "localDeviceInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 WHAIdentifier]);
    v22 = objc_alloc(&OBJC_CLASS___MRGroupSessionToken);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v11 invitationData]);
    v24 = -[MRGroupSessionToken initWithInvitationData:sharedSecret:sessionIdentifier:equivalentMediaIdentifier:version:]( v22,  "initWithInvitationData:sharedSecret:sessionIdentifier:equivalentMediaIdentifier:version:",  v23,  v15->_sharedSecret,  v15->_identifier,  v21,  MRGroupSessionTokenVersion);
    joinToken = v15->_joinToken;
    v15->_joinToken = v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue( +[MRDFastSyncGroupSession createSessionWithNearbyGroup:asUser:delegate:]( &OBJC_CLASS___MRDFastSyncGroupSession,  "createSessionWithNearbyGroup:asUser:delegate:",  v10,  v12,  v15));
    fastSyncSession = v15->_fastSyncSession;
    v15->_fastSyncSession = (MRDFastSyncGroupSession *)v26;
  }

  return v15;
}

- (MRDRemoteControlGroupSession)initWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MRDRemoteControlGroupSession;
  v14 = -[MRDRemoteControlGroupSession init](&v21, "init");
  v15 = v14;
  if (v14)
  {
    -[MRDRemoteControlGroupSession _initializeWithIdentity:nearbyGroup:isHosted:hostSigningKey:]( v14,  "_initializeWithIdentity:nearbyGroup:isHosted:hostSigningKey:",  v11,  v10,  0LL,  v12);
    objc_storeStrong((id *)&v15->_joinToken, a6);
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[MRDFastSyncGroupSession joinSessionWithNearbyGroup:asUser:hostSigningKey:delegate:]( &OBJC_CLASS___MRDFastSyncGroupSession,  "joinSessionWithNearbyGroup:asUser:hostSigningKey:delegate:",  v10,  v11,  v12,  v15));
    fastSyncSession = v15->_fastSyncSession;
    v15->_fastSyncSession = (MRDFastSyncGroupSession *)v16;

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
    [v18 addObserver:v15 selector:"handleDisplayMonitorChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v19];
  }

  return v15;
}

- (void)_initializeWithIdentity:(id)a3 nearbyGroup:(id)a4 isHosted:(BOOL)a5 hostSigningKey:(id)a6
{
  id v9 = (MRUserIdentity *)a3;
  id v10 = (_TtC12mediaremoted14MRDNearbyGroup *)a4;
  self->_lock._os_unfair_lock_opaque = 0;
  id v11 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
  observers = self->_observers;
  self->_observers = v11;

  dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t NotificationQueue = MRGroupSessionSubsystemGetNotificationQueue(v14, v15);
  unsigned int v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(NotificationQueue);
  uint64_t v18 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2( "com.apple.amp.MediaRemote.MRDRemoteControlGroupSession.notificationQueue",  v14,  v17);
  v19 = self->_notificationQueue;
  self->_notificationQueue = v18;

  self->_isHosted = a5;
  localIdentity = self->_localIdentity;
  self->_localIdentity = v9;
  objc_super v21 = v9;

  v22 = (NSMapTable *)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToStrongObjectsMapTable"));
  pendingParticipantsMap = self->_pendingParticipantsMap;
  self->_pendingParticipantsMap = v22;

  v24 = (NSMapTable *)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToStrongObjectsMapTable"));
  pendingJoinCompletions = self->_pendingJoinCompletions;
  self->_pendingJoinCompletions = v24;

  nearbyGroup = self->_nearbyGroup;
  self->_nearbyGroup = v10;
  v27 = v10;

  v28 = (NSString *)objc_claimAutoreleasedReturnValue(-[MRDNearbyGroup identifier](v27, "identifier"));
  identifier = self->_identifier;
  self->_identifier = v28;

  self->_state = 0LL;
  uint64_t v31 = _MRLogForCategory(12LL, v30);
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 134217984;
    v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSession] <%p> Initialized",  (uint8_t *)&v33,  0xCu);
  }
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(12LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDGroupSession] <%p> Dealloc.", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
  [v5 end];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRDRemoteControlGroupSession;
  -[MRDRemoteControlGroupSession dealloc](&v6, "dealloc");
}

- (NSString)description
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession identifier](self, "identifier"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MRDRemoteControlGroupSession isHosted](self, "isHosted")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession nearbyGroup](self, "nearbyGroup"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession nearbyInvitation](self, "nearbyInvitation"));
  id v10 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@: identifier=%@, hosted=%@ nearbyGroup=%@ nearbyInvitation=%@>",  v4,  v5,  v7,  v8,  v9);

  return v10;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class(self);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MRDRemoteControlGroupSession isHosted](self, "isHosted")));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringValue]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingParticipants](self, "pendingParticipants"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession nearbyGroup](self, "nearbyGroup"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession nearbyInvitation](self, "nearbyInvitation"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> identifier=%@, hosted=%@, pendingParticipants=%@ nearbyGroup=%@ nearbyInvitation=%@",  v3,  self,  v4,  v6,  v7,  v8,  v9));

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRDRemoteControlGroupSession *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      identifier = self->_identifier;
      id v7 = v4->_identifier;
      id v8 = identifier;
      id v9 = v8;
      if (v8 == v7) {
        unsigned __int8 v10 = 1;
      }
      else {
        unsigned __int8 v10 = -[NSString isEqual:](v8, "isEqual:", v7);
      }
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (NSString)localizedSessionName
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession leader](self, "leader"));
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identity]);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 displayName]);
    uint64_t Name = MRGroupSessionRouteMakeName(v6, -[MRDRemoteControlGroupSession routeType](self, "routeType"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(Name);
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRGroupSessionToken hostInfo](self->_joinToken, "hostInfo"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedSessionName]);
  }

  return (NSString *)v8;
}

- (unsigned)routeType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRGroupSessionToken hostInfo](self->_joinToken, "hostInfo"));
  unsigned __int8 v3 = [v2 routeType];

  return v3;
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  if (!state)
  {
    uint64_t v6 = _MRLogForCategory(12LL, v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      unsigned __int8 v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSession] <%p> Starting.",  (uint8_t *)&v9,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
    [v8 start];
  }

- (void)finish
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state == 4)
  {
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    -[MRDRemoteControlGroupSession setState:](self, "setState:", 4LL);
    os_unfair_lock_unlock(p_lock);
    uint64_t v5 = _MRLogForCategory(12LL, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      int v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSession] <%p> Finishing.",  (uint8_t *)&v8,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
    [v7 end];
  }

- (void)sendMessageData:(id)a3 toParticipants:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "msv_map:", &stru_1003A2F68));

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10014DB94;
  v11[3] = &unk_100399508;
  v11[4] = self;
  [v8 sendRemoteControlMessage:v7 to:v10 completion:v11];
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession observers](self, "observers"));
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession observers](self, "observers"));
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)handleJoinRequest:(id)a3 isGuest:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identity]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 prewarmForIdentity:v11]);

  os_unfair_lock_lock(&self->_lock);
  dispatch_queue_attr_t v13 = objc_alloc(&OBJC_CLASS___MRDFastSyncGroupSessionParticipant);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identity]);

  uint64_t v15 = -[MRDFastSyncGroupSessionParticipant initWithIdentifier:identity:connected:guest:]( v13,  "initWithIdentifier:identity:connected:guest:",  v12,  v14,  0LL,  v5);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingParticipantsMap](self, "pendingParticipantsMap"));
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDFastSyncGroupSessionParticipant identifier](v15, "identifier"));
  [v16 setObject:v15 forKey:v17];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingJoinCompletions](self, "pendingJoinCompletions"));
  id v19 = objc_retainBlock(v8);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDFastSyncGroupSessionParticipant identifier](v15, "identifier"));
  [v18 setObject:v19 forKey:v20];

  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingParticipantsMap](self, "pendingParticipantsMap"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectEnumerator]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allObjects]);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession observers](self, "observers"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 allObjects]);

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
  [v26 markParticipantAsGuestIfNeeded:v15];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
  [v27 addPendingParticipant:v15];

  v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession notificationQueue](self, "notificationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014DF2C;
  block[3] = &unk_100398F40;
  id v33 = v25;
  v34 = self;
  id v35 = v23;
  id v29 = v23;
  id v30 = v25;
  dispatch_async(v28, block);

  return v12;
}

- (void)handleApprovedJoinRequest:(id)a3 isGuest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);
  id v17 = (id)objc_claimAutoreleasedReturnValue([v7 prewarmForIdentity:v8]);

  os_unfair_lock_lock(&self->_lock);
  id v9 = objc_alloc(&OBJC_CLASS___MRDFastSyncGroupSessionParticipant);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);

  id v11 = -[MRDFastSyncGroupSessionParticipant initWithIdentifier:identity:connected:guest:]( v9,  "initWithIdentifier:identity:connected:guest:",  v17,  v10,  0LL,  v4);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingParticipantsMap](self, "pendingParticipantsMap"));
  dispatch_queue_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDFastSyncGroupSessionParticipant identifier](v11, "identifier"));
  [v12 setObject:v11 forKey:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingJoinCompletions](self, "pendingJoinCompletions"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDFastSyncGroupSessionParticipant identifier](v11, "identifier"));
  [v14 setObject:&stru_1003A2FA8 forKey:v15];

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
  [v16 markParticipantAsGuestIfNeeded:v11];

  -[MRDRemoteControlGroupSession approvePendingParticipant:](self, "approvePendingParticipant:", v17);
}

- (void)approvePendingParticipant:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[MRDRemoteControlGroupSession trackJoinResponseApproved:](self, "trackJoinResponseApproved:", 1LL);
  if (-[MRDRemoteControlGroupSession isHosted](self, "isHosted"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingParticipantsMap](self, "pendingParticipantsMap"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingJoinCompletions](self, "pendingJoinCompletions"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingParticipantsMap](self, "pendingParticipantsMap"));
    [v9 removeObjectForKey:v4];

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingJoinCompletions](self, "pendingJoinCompletions"));
    [v10 removeObjectForKey:v4];
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession remotePendingParticipants](self, "remotePendingParticipants"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10014E484;
    v36[3] = &unk_10039C9C8;
    id v37 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "msv_firstWhere:", v36));

    id v8 = 0LL;
    unsigned __int8 v10 = v37;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingParticipantsMap](self, "pendingParticipantsMap"));
  dispatch_queue_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectEnumerator]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession observers](self, "observers"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allObjects]);

  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    unsigned int v18 = -[MRDRemoteControlGroupSession isHosted](self, "isHosted");
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
    v20 = v19;
    if (v18)
    {
      [v19 removePendingParticipant:v6];

      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
      [v21 prepareForAddedMember];

      v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession notificationQueue](self, "notificationQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10014E4C4;
      block[3] = &unk_10039D0C8;
      id v35 = v8;
      id v32 = v16;
      id v33 = self;
      id v34 = v14;
      dispatch_async(v22, block);
    }

    else
    {
      [v19 remoteApprovePendingParticipant:v6];
    }
  }

  else
  {
    uint64_t v23 = _MRLogForCategory(12LL, v17);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1002BB4AC((uint64_t)v4, v24, v25, v26, v27, v28, v29, v30);
    }
  }
}

- (void)denyPendingParticipant:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[MRDRemoteControlGroupSession trackJoinResponseApproved:](self, "trackJoinResponseApproved:", 0LL);
  if (-[MRDRemoteControlGroupSession isHosted](self, "isHosted"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingParticipantsMap](self, "pendingParticipantsMap"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingJoinCompletions](self, "pendingJoinCompletions"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingParticipantsMap](self, "pendingParticipantsMap"));
    [v9 removeObjectForKey:v4];

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingJoinCompletions](self, "pendingJoinCompletions"));
    [v10 removeObjectForKey:v4];
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession remotePendingParticipants](self, "remotePendingParticipants"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10014E8D0;
    v37[3] = &unk_10039C9C8;
    id v38 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "msv_firstWhere:", v37));

    id v8 = 0LL;
    unsigned __int8 v10 = v38;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingParticipantsMap](self, "pendingParticipantsMap"));
  dispatch_queue_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectEnumerator]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession observers](self, "observers"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allObjects]);

  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    unsigned int v18 = -[MRDRemoteControlGroupSession isHosted](self, "isHosted");
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
    v20 = v19;
    if (v18)
    {
      [v19 removePendingParticipant:v6];

      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);
      [v21 cancelPrewarmedIdentifier:v4 forIdentity:v22];

      uint64_t v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession notificationQueue](self, "notificationQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10014E910;
      block[3] = &unk_10039D0C8;
      id v36 = v8;
      id v33 = v16;
      id v34 = self;
      id v35 = v14;
      dispatch_async(v23, block);
    }

    else
    {
      [v19 remoteRejectPendingParticipant:v6];
    }
  }

  else
  {
    uint64_t v24 = _MRLogForCategory(12LL, v17);
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1002BB510((uint64_t)v4, v25, v26, v27, v28, v29, v30, v31);
    }
  }
}

- (void)removeParticipant:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[MRDRemoteControlGroupSession isHosted](self, "isHosted");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
  id v7 = v6;
  if (v5) {
    [v6 removeParticipantWithIdentifier:v4];
  }
  else {
    [v6 remoteRemoveParticipantWithIdentifier:v4];
  }
}

- (void)removeAllParticipants
{
  if (-[MRDRemoteControlGroupSession isHosted](self, "isHosted"))
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession participants](self, "participants"));
    id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v17 + 1) + 8 * (void)v7) identifier]);
          -[MRDRemoteControlGroupSession removeParticipant:](self, "removeParticipant:", v8);

          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v5);
    }

    os_unfair_lock_lock(&self->_lock);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession observers](self, "observers"));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);

    os_unfair_lock_unlock(&self->_lock);
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession notificationQueue](self, "notificationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10014ECA4;
    block[3] = &unk_100398E60;
    id v15 = v10;
    uint64_t v16 = self;
    id v12 = v10;
    dispatch_async(v11, block);
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
    [v13 remoteRemoveAllParticipants];
  }

- (void)revokeAutoApprovalForParticipant:(id)a3
{
  id v4 = a3;
  if (-[MRDRemoteControlGroupSession isHosted](self, "isHosted"))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    participants = self->_participants;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10014EF18;
    v12[3] = &unk_10039C9C8;
    id v13 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray msv_firstWhere:](participants, "msv_firstWhere:", v12));
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identity]);
      uint64_t v10 = _MRLogForCategory(12LL, v9);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSession] Revoking auto-approval for identity: %@",  buf,  0xCu);
      }

      +[MRDGroupSessionApprovalManager donateRemovedIdentity:]( &OBJC_CLASS___MRDGroupSessionApprovalManager,  "donateRemovedIdentity:",  v8);
    }
  }
}

- (void)revokeAutoApprovalForAllParticipants
{
  if (-[MRDRemoteControlGroupSession isHosted](self, "isHosted"))
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession participants](self, "participants", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) identifier]);
          -[MRDRemoteControlGroupSession revokeAutoApprovalForParticipant:]( self,  "revokeAutoApprovalForParticipant:",  v8);

          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v5);
    }
  }

- (NSArray)pendingParticipants
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[MRDRemoteControlGroupSession isHosted](self, "isHosted"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession pendingParticipantsMap](self, "pendingParticipantsMap"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession remotePendingParticipants](self, "remotePendingParticipants"));
  }

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v6;
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    uint64_t v6 = _MRLogForCategory(12LL, v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = sub_10014CE64(self->_state);
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      __int128 v10 = sub_10014CE64(a3);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSession] <%@> state changed: %@ -> %@",  buf,  0x20u);
    }

    self->_int64_t state = a3;
    if (a3 == 4)
    {
      -[MRDRemoteControlGroupSession clearPendingCompletions](self, "clearPendingCompletions");
    }

    else if (a3 == 3)
    {
      objc_initWeak((id *)buf, self);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession notificationQueue](self, "notificationQueue"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10014F3BC;
      v22[3] = &unk_10039A668;
      objc_copyWeak(&v23, (id *)buf);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:repeats:queue:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:repeats:queue:block:",  0LL,  v12,  v22,  15.0));
      -[MRDRemoteControlGroupSession setLowPowerDeferralTimer:](self, "setLowPowerDeferralTimer:", v13);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession observers](self, "observers"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allObjects]);

    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession notificationQueue](self, "notificationQueue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10014F418;
    v18[3] = &unk_100399030;
    id v19 = v15;
    __int128 v20 = self;
    int64_t v21 = a3;
    id v17 = v15;
    dispatch_async(v16, v18);
  }

- (MRDGroupSessionParticipant)leader
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_leader;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (MRDGroupSessionParticipant)localParticipant
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localParticipant]);

  return (MRDGroupSessionParticipant *)v3;
}

- (NSArray)participants
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  participants = self->_participants;
  if (!participants) {
    participants = (NSArray *)&__NSArray0__struct;
  }
  uint64_t v5 = participants;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)setParticipants:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_storeStrong((id *)&self->_participants, a3);
  if (self->_state == 3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession observers](self, "observers"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession notificationQueue](self, "notificationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10014F6EC;
    block[3] = &unk_100398F40;
    id v11 = v7;
    __int128 v12 = self;
    id v13 = v5;
    id v9 = v7;
    dispatch_async(v8, block);
  }
}

- (NSArray)remoteParticipants
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession participants](self, "participants"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10014F880;
  v6[3] = &unk_10039C9C8;
  v6[4] = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "msv_filter:", v6));

  return (NSArray *)v4;
}

- (NSArray)members
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_members;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMembers:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_storeStrong((id *)&self->_members, a3);
  if (self->_state == 3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession observers](self, "observers"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession notificationQueue](self, "notificationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10014FA0C;
    block[3] = &unk_100398F40;
    id v11 = v7;
    __int128 v12 = self;
    id v13 = v5;
    id v9 = v7;
    dispatch_async(v8, block);
  }
}

- (void)setRemotePendingParticipants:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v6 = [v5 copy];

  objc_storeStrong((id *)&self->_remotePendingParticipants, v6);
  if (self->_state == 3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession observers](self, "observers"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession notificationQueue](self, "notificationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10014FC28;
    block[3] = &unk_100398F40;
    id v12 = v8;
    id v13 = self;
    id v14 = v6;
    id v10 = v8;
    dispatch_async(v9, block);
  }
}

- (void)transitionToState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state < a3) {
    -[MRDRemoteControlGroupSession setState:](self, "setState:", a3);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setIsLowPowerMode:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_isLowPowerMode != v3)
  {
    uint64_t v6 = _MRLogForCategory(12LL, v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"OFF";
      if (v3) {
        id v8 = @"ON";
      }
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSession] Low power mode changed to %@",  (uint8_t *)&v9,  0xCu);
    }

    self->_isLowPowerMode = v3;
  }

- (void)handleDisplayMonitorChangeNotification:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MRDRemoteControlGroupSession reevaluateLowPowerMode](self, "reevaluateLowPowerMode");
  os_unfair_lock_unlock(p_lock);
}

- (void)reevaluateLowPowerMode
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v4 = [v3 supportGroupSessionLowPowerMode];

  if (v4)
  {
    if (!-[MRDRemoteControlGroupSession isHosted](self, "isHosted")
      && !-[MRDRemoteControlGroupSession isUpdatingLowPowerMode](self, "isUpdatingLowPowerMode")
      && self->_state == 3)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession lowPowerDeferralTimer](self, "lowPowerDeferralTimer"));

      if (!v5)
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession lowPowerError](self, "lowPowerError"));

        if (!v6)
        {
          id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
          unsigned int v8 = [v7 displayOn];

          unsigned int v9 = -[MRDRemoteControlGroupSession isLowPowerMode](self, "isLowPowerMode");
          if (v8)
          {
            if (!v9) {
              return;
            }
            -[MRDRemoteControlGroupSession setIsUpdatingLowPowerMode:](self, "setIsUpdatingLowPowerMode:", 1LL);
            id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472LL;
            v12[2] = sub_100150038;
            v12[3] = &unk_100399508;
            void v12[4] = self;
            [v10 exitLowPowerModeWithCompletion:v12];
          }

          else
          {
            if ((v9 & 1) != 0) {
              return;
            }
            -[MRDRemoteControlGroupSession setIsUpdatingLowPowerMode:](self, "setIsUpdatingLowPowerMode:", 1LL);
            id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession fastSyncSession](self, "fastSyncSession"));
            v11[0] = _NSConcreteStackBlock;
            v11[1] = 3221225472LL;
            v11[2] = sub_100150100;
            v11[3] = &unk_100399508;
            v11[4] = self;
            [v10 enterLowPowerModeWithCompletion:v11];
          }
        }
      }
    }
  }

- (void)clearPendingCompletions
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_pendingJoinCompletions, "objectEnumerator"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allObjects]);

  -[NSMapTable removeAllObjects](self->_pendingJoinCompletions, "removeAllObjects");
  notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100150260;
  block[3] = &unk_100399250;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, block);
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 1) < 2)
  {
    id v8 = v6;
    if (-[MRDRemoteControlGroupSession isHosted](self, "isHosted")) {
      uint64_t v7 = 2LL;
    }
    else {
      uint64_t v7 = 1LL;
    }
    goto LABEL_9;
  }

  if (a4 == 3)
  {
    id v8 = v6;
    uint64_t v7 = 2LL;
    goto LABEL_9;
  }

  if (a4 == 4)
  {
    id v8 = v6;
    uint64_t v7 = 4LL;
LABEL_9:
    -[MRDRemoteControlGroupSession transitionToState:](self, "transitionToState:", v7);
    id v6 = v8;
  }
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  -[MRDRemoteControlGroupSession setParticipants:](self, "setParticipants:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)session:(id)a3 didUpdateMembers:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  -[MRDRemoteControlGroupSession setMembers:](self, "setMembers:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  -[MRDRemoteControlGroupSession setRemotePendingParticipants:](self, "setRemotePendingParticipants:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)sessionDidCompleteIdentityShare:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[MRDRemoteControlGroupSession setState:](self, "setState:", 3LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 leaderParticipant]);

  -[MRDRemoteControlGroupSession setLeader:](self, "setLeader:", v6);
  os_unfair_lock_unlock(p_lock);
}

- (void)session:(id)a3 didReceiveRemoteControlMessage:(id)a4 from:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession observers](self, "observers"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);

  os_unfair_lock_unlock(&self->_lock);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSession notificationQueue](self, "notificationQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100150630;
  v15[3] = &unk_100399880;
  id v16 = v10;
  id v17 = self;
  id v18 = v7;
  id v19 = v8;
  id v12 = v8;
  id v13 = v7;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)session:(id)a3 didReceiveRemoteApprovalForPendingParticipant:(id)a4 from:(id)a5
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  -[MRDRemoteControlGroupSession approvePendingParticipant:](self, "approvePendingParticipant:", v6);
}

- (void)session:(id)a3 didReceiveRemoteRejectionForPendingParticipant:(id)a4 from:(id)a5
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  -[MRDRemoteControlGroupSession denyPendingParticipant:](self, "denyPendingParticipant:", v6);
}

- (void)session:(id)a3 didReceiveRemoteRemoveRequestForParticipant:(id)a4 from:(id)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[MRDRemoteControlGroupSession revokeAutoApprovalForParticipant:](self, "revokeAutoApprovalForParticipant:", v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[MRDRemoteControlGroupSession removeParticipant:](self, "removeParticipant:", v8);
}

- (void)session:(id)a3 didReceiveRemoteRemoveAllRequestFromParticipant:(id)a4
{
}

- (void)trackJoinResponseApproved:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001508D8;
  v3[3] = &unk_1003A1898;
  v3[4] = self;
  BOOL v4 = a3;
  MRAnalyticsSendEvent(kMREventGroupSessionJoinResponseSent, 0LL, v3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRUserIdentity)localIdentity
{
  return self->_localIdentity;
}

- (BOOL)isHosted
{
  return self->_isHosted;
}

- (void)setIsHosted:(BOOL)a3
{
  self->_isHosted = a3;
}

- (NSMapTable)pendingParticipantsMap
{
  return self->_pendingParticipantsMap;
}

- (void)setPendingParticipantsMap:(id)a3
{
}

- (NSArray)remotePendingParticipants
{
  return self->_remotePendingParticipants;
}

- (NSMapTable)pendingJoinCompletions
{
  return self->_pendingJoinCompletions;
}

- (void)setPendingJoinCompletions:(id)a3
{
}

- (void)setLeader:(id)a3
{
}

- (MRDFastSyncGroupSession)fastSyncSession
{
  return self->_fastSyncSession;
}

- (_TtC12mediaremoted19MRDNearbyInvitation)nearbyInvitation
{
  return self->_nearbyInvitation;
}

- (void)setNearbyInvitation:(id)a3
{
}

- (_TtC12mediaremoted14MRDNearbyGroup)nearbyGroup
{
  return self->_nearbyGroup;
}

- (void)setNearbyGroup:(id)a3
{
}

- (MRGroupSessionToken)joinToken
{
  return self->_joinToken;
}

- (void)setJoinToken:(id)a3
{
}

- (NSString)sharedSecret
{
  return self->_sharedSecret;
}

- (void)setSharedSecret:(id)a3
{
}

- (BOOL)isLowPowerMode
{
  return self->_isLowPowerMode;
}

- (BOOL)isUpdatingLowPowerMode
{
  return self->_isUpdatingLowPowerMode;
}

- (void)setIsUpdatingLowPowerMode:(BOOL)a3
{
  self->_isUpdatingLowPowerMode = a3;
}

- (MSVTimer)lowPowerDeferralTimer
{
  return self->_lowPowerDeferralTimer;
}

- (void)setLowPowerDeferralTimer:(id)a3
{
}

- (NSError)lowPowerError
{
  return self->_lowPowerError;
}

- (void)setLowPowerError:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end