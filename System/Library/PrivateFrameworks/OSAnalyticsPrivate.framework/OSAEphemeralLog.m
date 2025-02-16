@interface OSAEphemeralLog
- (OSAEphemeralLog)initWithData:(id)a3 andMetadata:(id)a4;
- (void)retire:(const char *)a3;
@end

@implementation OSAEphemeralLog

- (OSAEphemeralLog)initWithData:(id)a3 andMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OSAEphemeralLog;
  v9 = -[OSAEphemeralLog init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_content, a3);
    uint64_t v11 = (int)*MEMORY[0x189611B18];
    v12 = *(Class *)((char *)&v10->super.super.isa + v11);
    *(Class *)((char *)&v10->super.super.isa + v11) = (Class)@"<ephemeral>";

    id v13 = v7;
    *(Class *)((char *)&v10->super.super.isa + (int)*MEMORY[0x189611B28]) = (Class)fmemopen( (void *)[v13 bytes],  objc_msgSend(v13, "length"),  "r");
    objc_storeStrong((id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x189611B20]), a4);
  }

  return v10;
}

- (void)retire:(const char *)a3
{
  content = self->_content;
  self->_content = 0LL;
}

- (void).cxx_destruct
{
}

@end