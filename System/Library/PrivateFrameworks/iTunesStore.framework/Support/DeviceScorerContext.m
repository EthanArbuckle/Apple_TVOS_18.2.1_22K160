@interface DeviceScorerContext
- (NSData)challengeResponse;
- (NSData)hostChallenge;
- (NSString)secureElementID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)serverEndpoint;
- (void)setChallengeResponse:(id)a3;
- (void)setHostChallenge:(id)a3;
- (void)setSecureElementID:(id)a3;
- (void)setServerEndpoint:(int64_t)a3;
@end

@implementation DeviceScorerContext

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___DeviceScorerContext);
  v6 = (NSData *)-[NSData copyWithZone:](self->_challengeResponse, "copyWithZone:", a3);
  challengeResponse = v5->_challengeResponse;
  v5->_challengeResponse = v6;

  v8 = (NSData *)-[NSData copyWithZone:](self->_hostChallenge, "copyWithZone:", a3);
  hostChallenge = v5->_hostChallenge;
  v5->_hostChallenge = v8;

  v10 = (NSString *)-[NSString copyWithZone:](self->_secureElementID, "copyWithZone:", a3);
  secureElementID = v5->_secureElementID;
  v5->_secureElementID = v10;

  v5->_serverEndpoint = self->_serverEndpoint;
  return v5;
}

- (NSData)challengeResponse
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setChallengeResponse:(id)a3
{
}

- (NSData)hostChallenge
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setHostChallenge:(id)a3
{
}

- (NSString)secureElementID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSecureElementID:(id)a3
{
}

- (int64_t)serverEndpoint
{
  return self->_serverEndpoint;
}

- (void)setServerEndpoint:(int64_t)a3
{
  self->_serverEndpoint = a3;
}

- (void).cxx_destruct
{
}

@end