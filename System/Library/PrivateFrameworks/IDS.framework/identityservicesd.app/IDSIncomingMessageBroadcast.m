@interface IDSIncomingMessageBroadcast
- (BOOL)broadcastNeedsClientAck;
- (BOOL)broadcastPerformed;
- (BOOL)transient;
- (IDSIncomingMessageBroadcast)init;
- (IDSIncomingMessageBroadcast)initWithBroadcastBlock:(id)a3 needsClientAck:(BOOL)a4 messageUUID:(id)a5 priority:(int64_t)a6 senderID:(id)a7 sequenceNumber:(unsigned int)a8;
- (NSString)messageSenderID;
- (NSString)messageUUID;
- (id)broadcastBlock;
- (int64_t)broadcastID;
- (int64_t)messagePriority;
- (unsigned)messageSequenceNumber;
- (void)setBroadcastBlock:(id)a3;
- (void)setBroadcastID:(int64_t)a3;
- (void)setBroadcastNeedsClientAck:(BOOL)a3;
- (void)setBroadcastPerformed:(BOOL)a3;
- (void)setMessagePriority:(int64_t)a3;
- (void)setMessageSenderID:(id)a3;
- (void)setMessageSequenceNumber:(unsigned int)a3;
- (void)setMessageUUID:(id)a3;
- (void)setTransient:(BOOL)a3;
@end

@implementation IDSIncomingMessageBroadcast

- (IDSIncomingMessageBroadcast)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSIncomingMessageBroadcast;
  v2 = -[IDSIncomingMessageBroadcast init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    do
      unint64_t v4 = __ldxr(&qword_1009BE958);
    while (__stxr(v4 + 1, &qword_1009BE958));
    -[IDSIncomingMessageBroadcast setBroadcastID:](v2, "setBroadcastID:", v4 + 1);
  }

  return v3;
}

- (IDSIncomingMessageBroadcast)initWithBroadcastBlock:(id)a3 needsClientAck:(BOOL)a4 messageUUID:(id)a5 priority:(int64_t)a6 senderID:(id)a7 sequenceNumber:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IDSIncomingMessageBroadcast;
  v17 = -[IDSIncomingMessageBroadcast init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    do
      unint64_t v19 = __ldxr(&qword_1009BE958);
    while (__stxr(v19 + 1, &qword_1009BE958));
    -[IDSIncomingMessageBroadcast setBroadcastID:](v17, "setBroadcastID:", v19 + 1);
    -[IDSIncomingMessageBroadcast setBroadcastNeedsClientAck:](v18, "setBroadcastNeedsClientAck:", v12);
    -[IDSIncomingMessageBroadcast setBroadcastBlock:](v18, "setBroadcastBlock:", v14);
    -[IDSIncomingMessageBroadcast setMessageUUID:](v18, "setMessageUUID:", v15);
    -[IDSIncomingMessageBroadcast setMessagePriority:](v18, "setMessagePriority:", a6);
    -[IDSIncomingMessageBroadcast setMessageSenderID:](v18, "setMessageSenderID:", v16);
    -[IDSIncomingMessageBroadcast setMessageSequenceNumber:](v18, "setMessageSequenceNumber:", v8);
  }

  return v18;
}

- (int64_t)broadcastID
{
  return self->_broadcastID;
}

- (void)setBroadcastID:(int64_t)a3
{
  self->_broadcastID = a3;
}

- (id)broadcastBlock
{
  return self->_broadcastBlock;
}

- (void)setBroadcastBlock:(id)a3
{
}

- (BOOL)broadcastNeedsClientAck
{
  return self->_broadcastNeedsClientAck;
}

- (void)setBroadcastNeedsClientAck:(BOOL)a3
{
  self->_broadcastNeedsClientAck = a3;
}

- (BOOL)transient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (BOOL)broadcastPerformed
{
  return self->_broadcastPerformed;
}

- (void)setBroadcastPerformed:(BOOL)a3
{
  self->_broadcastPerformed = a3;
}

- (NSString)messageUUID
{
  return self->_messageUUID;
}

- (void)setMessageUUID:(id)a3
{
}

- (int64_t)messagePriority
{
  return self->_messagePriority;
}

- (void)setMessagePriority:(int64_t)a3
{
  self->_messagePriority = a3;
}

- (NSString)messageSenderID
{
  return self->_messageSenderID;
}

- (void)setMessageSenderID:(id)a3
{
}

- (unsigned)messageSequenceNumber
{
  return self->_messageSequenceNumber;
}

- (void)setMessageSequenceNumber:(unsigned int)a3
{
  self->_messageSequenceNumber = a3;
}

- (void).cxx_destruct
{
}

@end