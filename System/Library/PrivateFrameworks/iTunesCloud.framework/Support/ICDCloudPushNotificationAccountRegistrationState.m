@interface ICDCloudPushNotificationAccountRegistrationState
- (ICDCloudPushNotificationAccountRegistrationState)initWithDictionaryRepresentation:(id)a3;
- (NSArray)mediaKinds;
- (NSData)APNSToken;
- (id)dictionaryRepresentation;
- (void)setAPNSToken:(id)a3;
- (void)setMediaKinds:(id)a3;
@end

@implementation ICDCloudPushNotificationAccountRegistrationState

- (ICDCloudPushNotificationAccountRegistrationState)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = -[ICDCloudPushNotificationAccountRegistrationState init](self, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_dataValueForKey:", @"APNSToken"));
    APNSToken = v5->_APNSToken;
    v5->_APNSToken = (NSData *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_arrayValueForKey:", @"mediaKinds"));
    mediaKinds = v5->_mediaKinds;
    v5->_mediaKinds = (NSArray *)v8;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  id v4 = v3;
  APNSToken = self->_APNSToken;
  if (APNSToken) {
    [v3 setObject:APNSToken forKey:@"APNSToken"];
  }
  mediaKinds = self->_mediaKinds;
  if (mediaKinds) {
    [v4 setObject:mediaKinds forKey:@"mediaKinds"];
  }
  return v4;
}

- (NSData)APNSToken
{
  return self->_APNSToken;
}

- (void)setAPNSToken:(id)a3
{
}

- (NSArray)mediaKinds
{
  return self->_mediaKinds;
}

- (void)setMediaKinds:(id)a3
{
}

- (void).cxx_destruct
{
}

@end