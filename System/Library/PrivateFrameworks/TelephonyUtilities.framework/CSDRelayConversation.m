@interface CSDRelayConversation
- (BOOL)endpointOnCurrentDevice;
- (CSDRelayConversation)initWithRelayMessage:(id)a3 queue:(id)a4;
- (CSDRelayConversationDelegate)delegate;
- (NSSet)activeRemoteParticipants;
- (NSSet)remoteMembers;
- (NSUUID)UUID;
- (NSUUID)groupUUID;
- (NSUUID)messagesGroupUUID;
- (OS_dispatch_queue)queue;
- (TUConversation)tuConversation;
- (TUConversationMember)localMember;
- (TUConversationReport)report;
- (TUHandle)initiator;
- (id)description;
- (int64_t)state;
- (unint64_t)avMode;
- (void)setActiveRemoteParticipants:(id)a3;
- (void)setAvMode:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointOnCurrentDevice:(BOOL)a3;
- (void)setLocalMember:(id)a3;
- (void)setMessagesGroupUUID:(id)a3;
- (void)setRemoteMembers:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updateWithProminenceRelayMessage:(id)a3;
- (void)updateWithRelayMessage:(id)a3;
@end

@implementation CSDRelayConversation

- (CSDRelayConversation)initWithRelayMessage:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___CSDRelayConversation;
  v8 = -[CSDRelayConversation init](&v36, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    v9->_state = (int64_t)[v6 tuState];
    v10 = objc_alloc(&OBJC_CLASS___NSUUID);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 uUIDString]);
    v12 = -[NSUUID initWithUUIDString:](v10, "initWithUUIDString:", v11);
    UUID = v9->_UUID;
    v9->_UUID = v12;

    v14 = objc_alloc(&OBJC_CLASS___NSUUID);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 groupUUIDString]);
    v16 = -[NSUUID initWithUUIDString:](v14, "initWithUUIDString:", v15);
    groupUUID = v9->_groupUUID;
    v9->_groupUUID = v16;

    v18 = objc_alloc(&OBJC_CLASS___NSUUID);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 messagesGroupUUIDString]);
    v20 = -[NSUUID initWithUUIDString:](v18, "initWithUUIDString:", v19);
    messagesGroupUUID = v9->_messagesGroupUUID;
    v9->_messagesGroupUUID = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 localMember]);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 tuConversationMember]);
    localMember = v9->_localMember;
    v9->_localMember = (TUConversationMember *)v23;

    v9->_avMode = (unint64_t)[v6 tuAVMode];
    v25 = (void *)objc_claimAutoreleasedReturnValue([v6 initiator]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 tuHandle]);
    initiator = v9->_initiator;
    v9->_initiator = (TUHandle *)v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue([v6 reportData]);
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 tuConversationReport]);
    report = v9->_report;
    v9->_report = (TUConversationReport *)v29;

    uint64_t v31 = objc_claimAutoreleasedReturnValue([v6 tuConversationMembers]);
    remoteMembers = v9->_remoteMembers;
    v9->_remoteMembers = (NSSet *)v31;

    uint64_t v33 = objc_claimAutoreleasedReturnValue([v6 tuConversationParticipants]);
    activeRemoteParticipants = v9->_activeRemoteParticipants;
    v9->_activeRemoteParticipants = (NSSet *)v33;

    v9->_endpointOnCurrentDevice = 1;
  }

  return v9;
}

- (void)updateWithRelayMessage:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 messagesGroupUUIDString]);
  v8 = -[NSUUID initWithUUIDString:](v6, "initWithUUIDString:", v7);
  -[CSDRelayConversation setMessagesGroupUUID:](self, "setMessagesGroupUUID:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 tuConversationParticipants]);
  -[CSDRelayConversation setActiveRemoteParticipants:](self, "setActiveRemoteParticipants:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 tuConversationMembers]);
  -[CSDRelayConversation setRemoteMembers:](self, "setRemoteMembers:", v10);

  -[CSDRelayConversation setState:](self, "setState:", [v4 tuState]);
  -[CSDRelayConversation setAvMode:](self, "setAvMode:", [v4 tuAVMode]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localMember]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 tuConversationMember]);
  -[CSDRelayConversation setLocalMember:](self, "setLocalMember:", v12);

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation delegate](self, "delegate"));
  [v13 conversationChanged:self];
}

- (void)updateWithProminenceRelayMessage:(id)a3
{
  id v4 = a3;
  v24 = self;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 prominenceEntrys]);
  id v7 = v6;
  if (v6)
  {
    id v22 = v4;
    id obj = v6;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation activeRemoteParticipants](v24, "activeRemoteParticipants"));
          id v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v26;
            do
            {
              for (j = 0LL; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v26 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
                id v19 = [v18 identifier];
                if (v19 == [v12 participantIdentifier]) {
                  objc_msgSend(v18, "setAudioPriority:", objc_msgSend(v12, "audioPriority"));
                }
              }

              id v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }

            while (v15);
          }
        }

        id v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }

      while (v9);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation delegate](v24, "delegate"));
    [v20 conversationChanged:v24];
    id v4 = v22;
    id v7 = obj;
  }

  else
  {
    id v21 = sub_1001704C4();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
      sub_1002B6EB8((os_log_t)v20);
    }
  }
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p",  objc_opt_class(self, a2),  self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation UUID](self, "UUID"));
  [v4 appendFormat:@" UUID=%@", v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation groupUUID](self, "groupUUID"));
  [v4 appendFormat:@" groupUUID=%@", v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation messagesGroupUUID](self, "messagesGroupUUID"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation messagesGroupUUID](self, "messagesGroupUUID"));
    [v4 appendFormat:@" messagesGroupUUID=%@", v8];
  }

  objc_msgSend(v4, "appendFormat:", @" state=%ld", -[CSDRelayConversation state](self, "state"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation localMember](self, "localMember"));
  [v4 appendFormat:@" localMember=%@", v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation remoteMembers](self, "remoteMembers"));
  [v4 appendFormat:@" remoteMembers=%@", v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  [v4 appendFormat:@" activeRemoteParticipants=%@", v11];

  [v4 appendString:@">"];
  id v12 = [v4 copy];

  return v12;
}

- (TUConversation)tuConversation
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation groupUUID](self, "groupUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TUMutableConversation emptyConversationWithGroupUUID:]( &OBJC_CLASS___TUMutableConversation,  "emptyConversationWithGroupUUID:",  v4));

  [v5 setHostedOnCurrentDevice:0];
  objc_msgSend( v5,  "setEndpointOnCurrentDevice:",  -[CSDRelayConversation endpointOnCurrentDevice](self, "endpointOnCurrentDevice"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation UUID](self, "UUID"));
  [v5 setUUID:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUConversationProvider faceTimeProvider](&OBJC_CLASS___TUConversationProvider, "faceTimeProvider"));
  [v5 setProvider:v7];

  id v8 = objc_alloc_init(&OBJC_CLASS___NSSet);
  [v5 setActivitySessions:v8];

  id v9 = objc_alloc_init(&OBJC_CLASS___NSSet);
  [v5 setKickedMembers:v9];

  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSSet);
  [v5 setRejectedMembers:v10];

  v11 = objc_alloc_init(&OBJC_CLASS___NSSet);
  [v5 setOtherInvitedHandles:v11];

  id v12 = objc_alloc_init(&OBJC_CLASS___NSSet);
  [v5 setParticipantHandles:v12];

  else {
    int64_t v13 = 0LL;
  }
  [v5 setState:v13];
  objc_msgSend(v5, "setState:", -[CSDRelayConversation state](self, "state"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation messagesGroupUUID](self, "messagesGroupUUID"));
  [v5 setMessagesGroupUUID:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation remoteMembers](self, "remoteMembers"));
  [v5 setRemoteMembers:v15];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation localMember](self, "localMember"));
  [v5 setLocalMember:v16];

  objc_msgSend(v5, "setAvMode:", -[CSDRelayConversation avMode](self, "avMode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation initiator](self, "initiator"));
  [v5 setInitiator:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation report](self, "report"));
  [v5 setReport:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  id v20 = [v19 copy];
  [v5 setActiveRemoteParticipants:v20];

  id v21 = [v5 copy];
  return (TUConversation *)v21;
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  self->_endpointOnCurrentDevice = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayConversation delegate](self, "delegate"));
  [v4 conversationChanged:self];
}

- (CSDRelayConversationDelegate)delegate
{
  return (CSDRelayConversationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (NSUUID)messagesGroupUUID
{
  return self->_messagesGroupUUID;
}

- (void)setMessagesGroupUUID:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (TUConversationMember)localMember
{
  return self->_localMember;
}

- (void)setLocalMember:(id)a3
{
}

- (TUHandle)initiator
{
  return self->_initiator;
}

- (NSSet)remoteMembers
{
  return self->_remoteMembers;
}

- (void)setRemoteMembers:(id)a3
{
}

- (NSSet)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (void)setActiveRemoteParticipants:(id)a3
{
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(unint64_t)a3
{
  self->_avMode = a3;
}

- (TUConversationReport)report
{
  return self->_report;
}

- (BOOL)endpointOnCurrentDevice
{
  return self->_endpointOnCurrentDevice;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end