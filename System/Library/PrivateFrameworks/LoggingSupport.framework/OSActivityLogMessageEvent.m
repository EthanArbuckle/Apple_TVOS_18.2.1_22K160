@interface OSActivityLogMessageEvent
- (NSString)category;
- (NSString)subsystem;
- (OSActivityLogMessageEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (unint64_t)senderProgramCounter;
- (unsigned)messageType;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityLogMessageEvent

- (OSActivityLogMessageEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___OSActivityLogMessageEvent;
  v4 = -[OSActivityLogMessageEvent init](&v13, sel_init);
  if (v4)
  {
    unint64_t var0 = a3->var8.var0.var0;
    v6 = os_log_copy_formatted_message((uint64_t)&a3->var8);
    if (v6)
    {
      v7 = v6;
      -[OSActivityEvent fillFromStreamEntry:eventMessage:persisted:]( v4,  "fillFromStreamEntry:eventMessage:persisted:",  a3,  v6,  a3->var8.var4.var19);
      free(v7);
      -[OSActivityEventMessage fillEventData:length:privateBuffer:length:]( v4,  "fillEventData:length:privateBuffer:length:",  a3->var8.var2.var11,  a3->var8.var2.var12,  a3->var8.var8.var12,  a3->var8.var4.var14);
      if (a3->var8.var4.var16)
      {
        uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:");
        category = v4->_category;
        v4->_category = (NSString *)v8;
      }

      if (a3->var8.var4.var15)
      {
        uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:");
        subsystem = v4->_subsystem;
        v4->_subsystem = (NSString *)v10;
      }

      v4->_senderProgramCounter = a3->var8.var0.var7;
      v4->_messageType = BYTE1(var0);
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
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OSActivityLogMessageEvent;
  -[OSActivityEvent _addProperties:](&v12, sel__addProperties_, v4);
  int v5 = -[OSActivityLogMessageEvent messageType](self, "messageType");
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
  }

  else
  {
    switch(v5)
    {
      case 2:
        v6 = @"Debug";
        goto LABEL_13;
      case 16:
        v6 = @"Error";
        goto LABEL_13;
      case 17:
        v6 = @"Fault";
        goto LABEL_13;
    }
  }

  v6 = @"Unknown";
LABEL_13:
  v7 = -[OSActivityLogMessageEvent subsystem](self, "subsystem");
  if (v7)
  {
    -[OSActivityLogMessageEvent subsystem](self, "subsystem");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v8 forKey:@"subsystem"];
  }
  v9 = -[OSActivityLogMessageEvent category](self, "category");
  if (v9)
  {
    -[OSActivityLogMessageEvent category](self, "category");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v10 forKey:@"category"];
  }

  [v4 setObject:v6 forKey:@"messageType"];
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[OSActivityLogMessageEvent senderProgramCounter](self, "senderProgramCounter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v11 forKey:@"senderProgramCounter"];
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
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