@interface TKSmartCardUserInteractionForSecurePINChange
+ (BOOL)supportsSecureCoding;
- (NSData)APDU;
- (TKSmartCardPINConfirmation)PINConfirmation;
- (TKSmartCardPINFormat)PINFormat;
- (TKSmartCardSlot)slot;
- (TKSmartCardUserInteractionForSecurePINChange)init;
- (TKSmartCardUserInteractionForSecurePINChange)initWithCoder:(id)a3;
- (int64_t)currentPINByteOffset;
- (int64_t)newPINByteOffset;
- (void)encodeWithCoder:(id)a3;
- (void)runWithReply:(id)a3;
- (void)setAPDU:(id)a3;
- (void)setCurrentPINByteOffset:(int64_t)a3;
- (void)setNewPINByteOffset:(int64_t)a3;
- (void)setPINConfirmation:(TKSmartCardPINConfirmation)PINConfirmation;
- (void)setPINFormat:(id)a3;
- (void)setSlot:(id)a3;
- (void)setSlot:(id)a3 PINFormat:(id)a4 APDU:(id)a5 currentPINByteOffset:(int64_t)a6 newPINByteOffset:(int64_t)a7;
@end

@implementation TKSmartCardUserInteractionForSecurePINChange

- (TKSmartCardUserInteractionForSecurePINChange)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForSecurePINChange;
  result = -[TKSmartCardUserInteractionForPINOperation init](&v3, sel_init);
  if (result) {
    result->_PINConfirmation = 0LL;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForSecurePINChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForSecurePINChange;
  v5 = -[TKSmartCardUserInteractionForPINOperation initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINConfirmation"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINConfirmation = [v6 unsignedIntegerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINFormat"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 copy];
    PINFormat = v5->_PINFormat;
    v5->_PINFormat = (TKSmartCardPINFormat *)v8;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"APDU"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 copy];
    APDU = v5->_APDU;
    v5->_APDU = (NSData *)v11;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentPINByteOffset"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_currentPINByteOffset = [v13 integerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"newPINByteOffset"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_newPINByteOffset = [v14 integerValue];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForSecurePINChange;
  id v4 = a3;
  -[TKSmartCardUserInteractionForPINOperation encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", self->_PINConfirmation, v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"PINConfirmation"];

  [v4 encodeObject:self->_PINFormat forKey:@"PINFormat"];
  [v4 encodeObject:self->_APDU forKey:@"APDU"];
  [MEMORY[0x189607968] numberWithInteger:self->_currentPINByteOffset];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"currentPINByteOffset"];

  [MEMORY[0x189607968] numberWithInteger:self->_newPINByteOffset];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"newPINByteOffset"];
}

- (void)setSlot:(id)a3 PINFormat:(id)a4 APDU:(id)a5 currentPINByteOffset:(int64_t)a6 newPINByteOffset:(int64_t)a7
{
  id v12 = a5;
  id v13 = a4;
  -[TKSmartCardUserInteractionForSecurePINChange setSlot:](self, "setSlot:", a3);
  -[TKSmartCardUserInteractionForSecurePINChange setPINFormat:](self, "setPINFormat:", v13);

  -[TKSmartCardUserInteractionForSecurePINChange setAPDU:](self, "setAPDU:", v12);
  -[TKSmartCardUserInteractionForSecurePINChange setCurrentPINByteOffset:](self, "setCurrentPINByteOffset:", a6);
  -[TKSmartCardUserInteractionForSecurePINChange setNewPINByteOffset:](self, "setNewPINByteOffset:", a7);
}

- (void)runWithReply:(id)a3
{
  id v4 = a3;
  v5 = -[TKSmartCardUserInteractionForSecurePINChange slot](self, "slot");
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke;
  v12[3] = &unk_189F8A488;
  id v7 = v4;
  id v13 = v7;
  [v5 synchronous:0 remoteSlotWithErrorHandler:v12];
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke_2;
  v10[3] = &unk_189F8A6F8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 runUserInteraction:self reply:v10];
}

uint64_t __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  v5 = (objc_class *)MEMORY[0x189603FB8];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_alloc_init(v5);
  id v10 = v6;
  LODWORD(v5) = +[TKSmartCard decodeResponse:sw:appendTo:error:]( &OBJC_CLASS___TKSmartCard,  "decodeResponse:sw:appendTo:error:",  v7,  &v11,  v8,  &v10);

  id v9 = v10;
  if ((_DWORD)v5)
  {
    [*(id *)(a1 + 32) setResultSW:v11];
    [*(id *)(a1 + 32) setResultData:v8];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (TKSmartCardPINConfirmation)PINConfirmation
{
  return self->_PINConfirmation;
}

- (void)setPINConfirmation:(TKSmartCardPINConfirmation)PINConfirmation
{
  self->_PINConfirmation = PINConfirmation;
}

- (TKSmartCardSlot)slot
{
  return (TKSmartCardSlot *)objc_loadWeakRetained((id *)&self->_slot);
}

- (void)setSlot:(id)a3
{
}

- (TKSmartCardPINFormat)PINFormat
{
  return (TKSmartCardPINFormat *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setPINFormat:(id)a3
{
}

- (NSData)APDU
{
  return (NSData *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setAPDU:(id)a3
{
}

- (int64_t)currentPINByteOffset
{
  return self->_currentPINByteOffset;
}

- (void)setCurrentPINByteOffset:(int64_t)a3
{
  self->_currentPINByteOffset = a3;
}

- (int64_t)newPINByteOffset
{
  return self->_newPINByteOffset;
}

- (void)setNewPINByteOffset:(int64_t)a3
{
  self->_newPINByteOffset = a3;
}

- (void).cxx_destruct
{
}

@end