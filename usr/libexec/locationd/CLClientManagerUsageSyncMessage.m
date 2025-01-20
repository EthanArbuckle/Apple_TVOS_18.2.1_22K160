@interface CLClientManagerUsageSyncMessage
- (BOOL)isMessageOfType:(id)a3;
- (NSDictionary)dataPayload;
- (NSDictionary)idsOptions;
- (NSString)messageType;
- (int64_t)priority;
- (void)dealloc;
- (void)setDataPayload:(id)a3;
- (void)setIdsOptions:(id)a3;
- (void)setMessageType:(id)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation CLClientManagerUsageSyncMessage

- (void)dealloc
{
  self->_messageType = 0LL;
  self->_dataPayload = 0LL;

  self->_idsOptions = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLClientManagerUsageSyncMessage;
  -[CLClientManagerUsageSyncMessage dealloc](&v3, "dealloc");
}

- (BOOL)isMessageOfType:(id)a3
{
  return -[NSString isEqual:]( -[CLClientManagerUsageSyncMessage messageType](self, "messageType"),  "isEqual:",  a3);
}

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(id)a3
{
}

- (NSDictionary)dataPayload
{
  return self->_dataPayload;
}

- (void)setDataPayload:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSDictionary)idsOptions
{
  return self->_idsOptions;
}

- (void)setIdsOptions:(id)a3
{
}

@end