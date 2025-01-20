@interface PDCloudStoreShareInvitationRequestCreateKeysResponse
- (PDCloudStoreShareInvitationRequestCreateKeysResponse)initWithInvitation:(id)a3;
- (PKCloudStoreZoneInvitation)invitation;
- (unint64_t)type;
@end

@implementation PDCloudStoreShareInvitationRequestCreateKeysResponse

- (PDCloudStoreShareInvitationRequestCreateKeysResponse)initWithInvitation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDCloudStoreShareInvitationRequestCreateKeysResponse;
  v6 = -[PDCloudStoreShareInvitationRequestGenericResponse initWithSuccess:error:]( &v9,  "initWithSuccess:error:",  1LL,  0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_invitation, a3);
  }

  return v7;
}

- (unint64_t)type
{
  return 1LL;
}

- (PKCloudStoreZoneInvitation)invitation
{
  return self->_invitation;
}

- (void).cxx_destruct
{
}

@end