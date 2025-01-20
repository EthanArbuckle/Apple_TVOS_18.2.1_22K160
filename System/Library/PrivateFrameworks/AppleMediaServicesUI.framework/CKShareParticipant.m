@interface CKShareParticipant
- (NSString)hashedDescription;
- (int64_t)participantRole;
- (int64_t)participantStatus;
@end

@implementation CKShareParticipant

- (int64_t)participantRole
{
  CKShareParticipantRole v2 = -[CKShareParticipant role](self, "role");
  else {
    return qword_10016A578[v2];
  }
}

- (int64_t)participantStatus
{
  CKShareParticipantAcceptanceStatus v2 = -[CKShareParticipant acceptanceStatus](self, "acceptanceStatus");
  else {
    return qword_10016A5A0[v2];
  }
}

- (NSString)hashedDescription
{
  uint64_t v15 = objc_opt_class(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKShareParticipant userIdentity](self, "userIdentity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nameComponents]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 givenName]);
  uint64_t v6 = AMSHashIfNeeded(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKShareParticipant userIdentity](self, "userIdentity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nameComponents]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 familyName]);
  uint64_t v11 = AMSHashIfNeeded(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p name = %@ %@ | role = %ld | status = %ld",  v15,  self,  v7,  v12,  -[CKShareParticipant participantRole](self, "participantRole"),  -[CKShareParticipant participantStatus](self, "participantStatus")));

  return (NSString *)v13;
}

@end