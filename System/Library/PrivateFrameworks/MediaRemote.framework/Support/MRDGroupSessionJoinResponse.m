@interface MRDGroupSessionJoinResponse
- (MRDGroupSessionJoinResponse)initWithNearbyGroup:(id)a3 publicSigningKeyData:(id)a4 joinToken:(id)a5;
- (MRGroupSessionToken)joinToken;
- (NSData)publicSigningKeyData;
- (NSString)sessionIdentifier;
- (_TtC12mediaremoted14MRDNearbyGroup)nearbyGroup;
@end

@implementation MRDGroupSessionJoinResponse

- (MRDGroupSessionJoinResponse)initWithNearbyGroup:(id)a3 publicSigningKeyData:(id)a4 joinToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MRDGroupSessionJoinResponse;
  v12 = -[MRDGroupSessionJoinResponse init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_nearbyGroup, a3);
    objc_storeStrong((id *)&v13->_publicSigningKeyData, a4);
    objc_storeStrong((id *)&v13->_joinToken, a5);
  }

  return v13;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (_TtC12mediaremoted14MRDNearbyGroup)nearbyGroup
{
  return self->_nearbyGroup;
}

- (NSData)publicSigningKeyData
{
  return self->_publicSigningKeyData;
}

- (MRGroupSessionToken)joinToken
{
  return self->_joinToken;
}

- (void).cxx_destruct
{
}

@end