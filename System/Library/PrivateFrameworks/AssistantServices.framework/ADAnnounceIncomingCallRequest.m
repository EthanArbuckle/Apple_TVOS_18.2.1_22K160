@interface ADAnnounceIncomingCallRequest
- (ADAnnounceIncomingCallRequest)initWithCall:(id)a3 completion:(id)a4;
- (AFSiriIncomingCall)call;
- (void)setCall:(id)a3;
@end

@implementation ADAnnounceIncomingCallRequest

- (ADAnnounceIncomingCallRequest)initWithCall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADAnnounceIncomingCallRequest;
  v7 = -[ADAnnouncementRequest initWithAnnouncementRequestType:platform:completion:]( &v11,  "initWithAnnouncementRequestType:platform:completion:",  2LL,  1LL,  a4);
  if (v7)
  {
    v8 = (AFSiriIncomingCall *)[v6 copy];
    call = v7->_call;
    v7->_call = v8;
  }

  return v7;
}

- (AFSiriIncomingCall)call
{
  return self->_call;
}

- (void)setCall:(id)a3
{
}

- (void).cxx_destruct
{
}

@end