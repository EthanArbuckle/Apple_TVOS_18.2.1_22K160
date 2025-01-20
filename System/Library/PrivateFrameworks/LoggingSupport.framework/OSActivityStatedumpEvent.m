@interface OSActivityStatedumpEvent
- (OSActivityStatedumpEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityStatedumpEvent

- (OSActivityStatedumpEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  if (a3->var8.var2.var11)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___OSActivityStatedumpEvent;
    v4 = -[OSActivityStatedumpEvent init](&v7, sel_init);
    v5 = v4;
    if (v4) {
      -[OSActivityEvent fillFromStreamEntry:eventMessage:persisted:]( v4,  "fillFromStreamEntry:eventMessage:persisted:",  a3,  a3->var8.var3.var10,  1LL);
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
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OSActivityStatedumpEvent;
  id v3 = a3;
  -[OSActivityEvent _addProperties:](&v4, sel__addProperties_, v3);
  objc_msgSend(v3, "setObject:forKey:", &unk_189F1D0A0, @"eventType", v4.receiver, v4.super_class);
}

@end