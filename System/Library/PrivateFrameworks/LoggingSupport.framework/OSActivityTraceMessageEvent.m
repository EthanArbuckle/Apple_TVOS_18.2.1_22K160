@interface OSActivityTraceMessageEvent
- (OSActivityTraceMessageEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (OS_xpc_object)payload;
- (unint64_t)senderProgramCounter;
- (unsigned)messageType;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityTraceMessageEvent

- (OSActivityTraceMessageEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OSActivityTraceMessageEvent;
  v4 = -[OSActivityTraceMessageEvent init](&v9, sel_init);
  if (v4)
  {
    unint64_t var0 = a3->var8.var0.var0;
    v6 = os_trace_copy_formatted_message((uint64_t)&a3->var8);
    if (v6)
    {
      v7 = v6;
      -[OSActivityEvent fillFromStreamEntry:eventMessage:persisted:]( v4,  "fillFromStreamEntry:eventMessage:persisted:",  a3,  v6,  0LL);
      -[OSActivityEventMessage fillEventData:length:privateBuffer:length:]( v4,  "fillEventData:length:privateBuffer:length:",  a3->var8.var2.var11,  a3->var8.var2.var12,  0LL,  0LL);
      objc_storeStrong((id *)&v4->_payload, a3->var8.var4.var13);
      v4->_senderProgramCounter = a3->var8.var0.var7;
      v4->_messageType = BYTE1(var0);
      free(v7);
    }

    else
    {

      return 0LL;
    }
  }

  return v4;
}

- (void)_addProperties:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OSActivityTraceMessageEvent;
  id v4 = a3;
  -[OSActivityEvent _addProperties:](&v8, sel__addProperties_, v4);
  int v5 = -[OSActivityTraceMessageEvent messageType](self, "messageType", v8.receiver, v8.super_class);
  if (v5 <= 1)
  {
    if (!v5)
    {
      v6 = @"Default";
      goto LABEL_13;
    }

    if (v5 == 1)
    {
      v6 = @"Info";
      goto LABEL_13;
    }

- (OS_xpc_object)payload
{
  return self->_payload;
}

- (unint64_t)senderProgramCounter
{
  return self->_senderProgramCounter;
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (void).cxx_destruct
{
}

@end