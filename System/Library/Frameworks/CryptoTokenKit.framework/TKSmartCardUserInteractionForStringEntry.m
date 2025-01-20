@interface TKSmartCardUserInteractionForStringEntry
+ (BOOL)supportsSecureCoding;
- (NSString)result;
- (TKSmartCardSlot)slot;
- (TKSmartCardUserInteractionForStringEntry)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)runWithReply:(id)a3;
- (void)setResult:(id)a3;
- (void)setSlot:(id)a3;
@end

@implementation TKSmartCardUserInteractionForStringEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForStringEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForStringEntry;
  v5 = -[TKSmartCardUserInteraction initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 copy];
    v8 = v5->_result;
    v5->_result = (NSString *)v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForStringEntry;
  id v4 = a3;
  -[TKSmartCardUserInteraction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, @"result", v5.receiver, v5.super_class);
}

- (void)runWithReply:(id)a3
{
  id v4 = a3;
  -[TKSmartCardUserInteractionForStringEntry slot](self, "slot");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke;
  v12[3] = &unk_189F8A488;
  id v7 = v4;
  id v13 = v7;
  [v5 synchronous:0 remoteSlotWithErrorHandler:v12];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke_2;
  v10[3] = &unk_189F8A890;
  id v11 = v7;
  id v9 = v7;
  [v8 runUserInteraction:self reply:v10];
}

uint64_t __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (NSString)result
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setResult:(id)a3
{
}

- (TKSmartCardSlot)slot
{
  return (TKSmartCardSlot *)objc_loadWeakRetained((id *)&self->_slot);
}

- (void)setSlot:(id)a3
{
}

- (void).cxx_destruct
{
}

@end