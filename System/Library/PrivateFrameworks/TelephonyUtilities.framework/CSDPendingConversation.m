@interface CSDPendingConversation
- (BOOL)isAudioEnabled;
- (BOOL)isUplinkMuted;
- (BOOL)isVideo;
- (BOOL)isVideoEnabled;
- (CSDLetMeInRequestorKeyAgreement)letMeInKeyAgreement;
- (CSDPendingConversation)initWithConversationLink:(id)a3 localMember:(id)a4 queue:(id)a5;
- (NSDate)dateCreated;
- (NSUUID)conversationGroupUUID;
- (NSUUID)temporaryGroupUUID;
- (OS_dispatch_queue)queue;
- (TUConversation)tuConversation;
- (TUConversationLink)link;
- (TUConversationMember)localMember;
- (TUHandle)approverHandle;
- (id)description;
- (id)groupUUID;
- (int64_t)letMeInRequestState;
- (int64_t)state;
- (void)setApproverHandle:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setConversationGroupUUID:(id)a3;
- (void)setLetMeInKeyAgreement:(id)a3;
- (void)setLetMeInRequestState:(int64_t)a3;
- (void)setLink:(id)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
@end

@implementation CSDPendingConversation

- (CSDPendingConversation)initWithConversationLink:(id)a3 localMember:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CSDPendingConversation;
  v12 = -[CSDPendingConversation init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a5);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    temporaryGroupUUID = v13->_temporaryGroupUUID;
    v13->_temporaryGroupUUID = (NSUUID *)v14;

    objc_storeStrong((id *)&v13->_link, a3);
    objc_storeStrong((id *)&v13->_localMember, a4);
    v13->_letMeInRequestState = 1LL;
    *(_WORD *)&v13->_videoEnabled = 257;
    v13->_video = 1;
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    dateCreated = v13->_dateCreated;
    v13->_dateCreated = (NSDate *)v16;
  }

  return v13;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p",  objc_opt_class(self, a2),  self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend( v4,  "appendFormat:",  @" letMeInRequestState=%ld",  -[CSDPendingConversation letMeInRequestState](self, "letMeInRequestState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation temporaryGroupUUID](self, "temporaryGroupUUID"));
  [v4 appendFormat:@" temporaryGroupUUID=%@", v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation conversationGroupUUID](self, "conversationGroupUUID"));
  [v4 appendFormat:@" conversationGroupUUID=%@", v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation approverHandle](self, "approverHandle"));
  [v4 appendFormat:@" approverHandle=%@", v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation link](self, "link"));
  [v4 appendFormat:@" link=%@", v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation localMember](self, "localMember"));
  [v4 appendFormat:@" localMember=%@", v9];

  objc_msgSend( v4,  "appendFormat:",  @" isAudioEnabled=%d",  -[CSDPendingConversation isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend( v4,  "appendFormat:",  @" isVideoEnabled=%d",  -[CSDPendingConversation isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v4, "appendFormat:", @" isVideo=%d", -[CSDPendingConversation isVideo](self, "isVideo"));
  objc_msgSend( v4,  "appendFormat:",  @" isUplinkMuted=%d",  -[CSDPendingConversation isUplinkMuted](self, "isUplinkMuted"));
  [v4 appendString:@">"];
  id v10 = [v4 copy];

  return v10;
}

- (int64_t)state
{
  return 1LL;
}

- (id)groupUUID
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation conversationGroupUUID](self, "conversationGroupUUID"));
  if (v3) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CSDPendingConversation conversationGroupUUID](self, "conversationGroupUUID"));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CSDPendingConversation temporaryGroupUUID](self, "temporaryGroupUUID"));
  }
  v5 = (void *)v4;

  return v5;
}

- (TUConversation)tuConversation
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc(&OBJC_CLASS___TUMutableConversation);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation UUID](self, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation groupUUID](self, "groupUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUConversationProvider faceTimeProvider](&OBJC_CLASS___TUConversationProvider, "faceTimeProvider"));
  id v8 = [v4 initWithUUID:v5 groupUUID:v6 provider:v7];

  objc_msgSend( v8,  "setLetMeInRequestState:",  -[CSDPendingConversation letMeInRequestState](self, "letMeInRequestState"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation link](self, "link"));
  [v8 setLink:v9];

  objc_msgSend(v8, "setState:", -[CSDPendingConversation state](self, "state"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation localMember](self, "localMember"));
  [v8 setLocalMember:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPendingConversation localMember](self, "localMember"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
  [v8 setInitiator:v12];

  [v8 setAudioEnabled:1];
  objc_msgSend(v8, "setVideoEnabled:", -[CSDPendingConversation isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v8, "setVideo:", -[CSDPendingConversation isVideo](self, "isVideo"));
  [v8 setHasJoined:0];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  [v8 setRemoteMembers:v13];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  [v8 setPendingMembers:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  [v8 setKickedMembers:v15];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  [v8 setOtherInvitedHandles:v16];

  [v8 setMessagesGroupUUID:0];
  [v8 setAvcSessionToken:-1];
  [v8 setAvcSessionIdentifier:0];
  [v8 setLocallyCreated:1];
  [v8 setMessagesGroupName:0];
  [v8 setMaxVideoDecodesAllowed:9];
  [v8 setReportingHierarchyToken:0];
  [v8 setReportingHierarchySubToken:0];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  [v8 setActiveRemoteParticipants:v17];

  v18 = objc_alloc(&OBJC_CLASS___TUConversationReport);
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v22 = -[TUConversationReport initWithConversationID:padding:timebase:]( v18,  "initWithConversationID:padding:timebase:",  v19,  v20,  v21);
  [v8 setReport:v22];

  [v8 setPendingConversation:1];
  id v23 = [v8 copy];

  return (TUConversation *)v23;
}

- (NSUUID)temporaryGroupUUID
{
  return self->_temporaryGroupUUID;
}

- (TUConversationLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (int64_t)letMeInRequestState
{
  return self->_letMeInRequestState;
}

- (void)setLetMeInRequestState:(int64_t)a3
{
  self->_letMeInRequestState = a3;
}

- (TUConversationMember)localMember
{
  return self->_localMember;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)isUplinkMuted
{
  return self->_uplinkMuted;
}

- (void)setUplinkMuted:(BOOL)a3
{
  self->_uplinkMuted = a3;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUUID)conversationGroupUUID
{
  return self->_conversationGroupUUID;
}

- (void)setConversationGroupUUID:(id)a3
{
}

- (CSDLetMeInRequestorKeyAgreement)letMeInKeyAgreement
{
  return self->_letMeInKeyAgreement;
}

- (void)setLetMeInKeyAgreement:(id)a3
{
}

- (TUHandle)approverHandle
{
  return self->_approverHandle;
}

- (void)setApproverHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end