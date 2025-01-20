@interface OSActivityLossEvent
- (BOOL)saturated;
- (OSActivityLossEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (unint64_t)endMachTimestamp;
- (unint64_t)startMachTimestamp;
- (unsigned)count;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityLossEvent

- (OSActivityLossEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___OSActivityLossEvent;
  v4 = -[OSActivityLossEvent init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_startMachTimestamp = a3->var8.var3.var10;
    unint64_t var11 = a3->var8.var2.var11;
    v4->_endMachTimestamp = var11;
    unsigned int var12 = a3->var8.var9.var12;
    v4->_count = var12;
    BOOL v8 = a3->var8.var9.var12 == 63;
    v4->_saturated = v8;
    v9 = (const char *)&_CTF_NULLSTR;
    if (v8) {
      v9 = ">=";
    }
    snprintf( __str,  0x100uLL,  "lost %s%u unreliable messages from %llu-%llu (Mach continuous exact start-approx. end)",  v9,  var12,  v4->_startMachTimestamp,  var11);
    -[OSActivityEvent fillFromStreamEntry:eventMessage:persisted:]( v5,  "fillFromStreamEntry:eventMessage:persisted:",  a3,  __str,  1LL);
  }

  return v5;
}

- (void)_addProperties:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OSActivityLossEvent;
  id v4 = a3;
  -[OSActivityEvent _addProperties:](&v9, sel__addProperties_, v4);
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSActivityLossEvent startMachTimestamp](self, "startMachTimestamp", v9.receiver, v9.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKey:@"startMachTimestamp"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSActivityLossEvent endMachTimestamp](self, "endMachTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKey:@"endMachTimestamp"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", -[OSActivityLossEvent count](self, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKey:@"count"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[OSActivityLossEvent saturated](self, "saturated"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v8 forKey:@"saturated"];
}

- (unint64_t)startMachTimestamp
{
  return self->_startMachTimestamp;
}

- (unint64_t)endMachTimestamp
{
  return self->_endMachTimestamp;
}

- (unsigned)count
{
  return self->_count;
}

- (BOOL)saturated
{
  return self->_saturated;
}

@end