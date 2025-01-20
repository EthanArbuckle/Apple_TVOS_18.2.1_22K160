@interface MRDGroupSessionInvitationRequest
- (MRDGroupSession)session;
- (MRDGroupSessionInvitationRequest)initWithSession:(id)a3 pendingParticipant:(id)a4;
- (MRDGroupSessionParticipant)pendingParticipant;
@end

@implementation MRDGroupSessionInvitationRequest

- (MRDGroupSessionInvitationRequest)initWithSession:(id)a3 pendingParticipant:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MRDGroupSessionInvitationRequest;
  v9 = -[MRDGroupSessionInvitationRequest init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_pendingParticipant, a4);
  }

  return v10;
}

- (MRDGroupSession)session
{
  return self->_session;
}

- (MRDGroupSessionParticipant)pendingParticipant
{
  return self->_pendingParticipant;
}

- (void).cxx_destruct
{
}

@end