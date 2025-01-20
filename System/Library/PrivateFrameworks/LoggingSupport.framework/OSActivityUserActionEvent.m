@interface OSActivityUserActionEvent
- (OSActivityUserActionEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (unint64_t)senderProgramCounter;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityUserActionEvent

- (OSActivityUserActionEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  if (a3->var8.var3.var10)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___OSActivityUserActionEvent;
    v4 = -[OSActivityUserActionEvent init](&v7, sel_init);
    v5 = v4;
    if (v4)
    {
      -[OSActivityEvent fillFromStreamEntry:eventMessage:persisted:]( v4,  "fillFromStreamEntry:eventMessage:persisted:",  a3,  a3->var8.var3.var10,  a3->var8.var8.var10[12]);
      v5->_senderProgramCounter = a3->var8.var0.var7;
    }
  }

  else
  {

    return 0LL;
  }

  return v5;
}

- (void)_addProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OSActivityUserActionEvent;
  id v4 = a3;
  -[OSActivityEvent _addProperties:](&v6, sel__addProperties_, v4);
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[OSActivityUserActionEvent senderProgramCounter](self, "senderProgramCounter", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKey:@"senderProgramCounter"];
}

- (unint64_t)senderProgramCounter
{
  return self->_senderProgramCounter;
}

@end