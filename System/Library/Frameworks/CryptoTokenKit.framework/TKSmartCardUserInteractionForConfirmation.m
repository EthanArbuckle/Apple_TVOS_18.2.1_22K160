@interface TKSmartCardUserInteractionForConfirmation
+ (BOOL)supportsSecureCoding;
- (BOOL)result;
- (TKSmartCardSlot)slot;
- (TKSmartCardUserInteractionForConfirmation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)runWithReply:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setSlot:(id)a3;
@end

@implementation TKSmartCardUserInteractionForConfirmation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForConfirmation)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForConfirmation;
  v5 = -[TKSmartCardUserInteraction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_result = [v6 integerValue] != 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForConfirmation;
  id v4 = a3;
  -[TKSmartCardUserInteraction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", self->_result, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"result"];
}

- (void)runWithReply:(id)a3
{
  id v4 = a3;
  v5 = -[TKSmartCardUserInteractionForConfirmation slot](self, "slot");
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke;
  v12[3] = &unk_189F8A488;
  id v7 = v4;
  id v13 = v7;
  [v5 synchronous:0 remoteSlotWithErrorHandler:v12];
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke_2;
  v10[3] = &unk_189F8A890;
  id v11 = v7;
  id v9 = v7;
  [v8 runUserInteraction:self reply:v10];
}

uint64_t __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
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