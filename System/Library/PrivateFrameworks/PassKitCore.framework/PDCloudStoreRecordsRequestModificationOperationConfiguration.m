@interface PDCloudStoreRecordsRequestModificationOperationConfiguration
- (BOOL)markAsParticipantNeedsNewInvitationToken;
- (id)description;
- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3;
@end

@implementation PDCloudStoreRecordsRequestModificationOperationConfiguration

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (self->_markAsParticipantNeedsNewInvitationToken) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v4 appendFormat:@"markAsParticipantNeedsNewInvitationToken: '%@'; ", v6];
  [v5 appendString:@">"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v5));

  return v7;
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

@end