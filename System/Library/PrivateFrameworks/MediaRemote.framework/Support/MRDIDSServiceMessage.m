@interface MRDIDSServiceMessage
- (BOOL)replyWithData:(id)a3 priority:(int64_t)a4;
- (IDSDevice)device;
- (MRDIDSService)service;
- (MRDIDSServiceMessage)initWithID:(id)a3 data:(id)a4 device:(id)a5 service:(id)a6;
- (NSData)data;
- (NSNumber)messageID;
- (void)setService:(id)a3;
@end

@implementation MRDIDSServiceMessage

- (MRDIDSServiceMessage)initWithID:(id)a3 data:(id)a4 device:(id)a5 service:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MRDIDSServiceMessage;
  v14 = -[MRDIDSServiceMessage init](&v20, "init");
  if (v14)
  {
    v15 = (NSNumber *)[v10 copy];
    messageID = v14->_messageID;
    v14->_messageID = v15;

    v17 = (NSData *)[v11 copy];
    data = v14->_data;
    v14->_data = v17;

    objc_storeStrong((id *)&v14->_service, a6);
    objc_storeStrong((id *)&v14->_device, a5);
  }

  return v14;
}

- (BOOL)replyWithData:(id)a3 priority:(int64_t)a4
{
  return -[MRDIDSService _sendMessage:device:type:destination:session:options:priority:replyID:response:]( self->_service,  "_sendMessage:device:type:destination:session:options:priority:replyID:response:",  a3,  self->_device,  0LL,  0LL,  0LL,  0LL,  a4,  self->_messageID,  0LL);
}

- (IDSDevice)device
{
  return self->_device;
}

- (NSData)data
{
  return self->_data;
}

- (NSNumber)messageID
{
  return self->_messageID;
}

- (MRDIDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end