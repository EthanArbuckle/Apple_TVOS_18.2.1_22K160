@interface NRLinkDirectorMessage
- (id)description;
- (void)dealloc;
@end

@implementation NRLinkDirectorMessage

- (void)dealloc
{
  if (self)
  {
    messageBufferPtr = self->_messageBufferPtr;
    if (messageBufferPtr)
    {
      free(messageBufferPtr);
      self->_messageBufferPtr = 0LL;
    }

    self->_messageLen = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NRLinkDirectorMessage;
  -[NRLinkDirectorMessage dealloc](&v4, "dealloc");
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  unint64_t v4 = sub_100020CF0((uint64_t)self);
  if (self)
  {
    uint64_t messageVersion = self->_messageVersion;
    uint64_t payloadLength = self->_payloadLength;
  }

  else
  {
    uint64_t messageVersion = 0LL;
    uint64_t payloadLength = 0LL;
  }

  return  -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"[%llu, vers %u, len %u]",  v4,  messageVersion,  payloadLength);
}

- (void).cxx_destruct
{
}

@end