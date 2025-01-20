@interface TKSmartCardUserInteractionForSecurePINVerification
+ (BOOL)supportsSecureCoding;
- (NSData)APDU;
- (TKSmartCardPINFormat)PINFormat;
- (TKSmartCardSlot)slot;
- (TKSmartCardUserInteractionForSecurePINVerification)initWithCoder:(id)a3;
- (int64_t)PINByteOffset;
- (void)encodeWithCoder:(id)a3;
- (void)runWithReply:(id)a3;
- (void)setAPDU:(id)a3;
- (void)setPINByteOffset:(int64_t)a3;
- (void)setPINFormat:(id)a3;
- (void)setSlot:(id)a3;
- (void)setSlot:(id)a3 PINFormat:(id)a4 APDU:(id)a5 PINByteOffset:(int64_t)a6;
@end

@implementation TKSmartCardUserInteractionForSecurePINVerification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForSecurePINVerification)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForSecurePINVerification;
  v5 = -[TKSmartCardUserInteractionForPINOperation initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINFormat"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 copy];
    PINFormat = v5->_PINFormat;
    v5->_PINFormat = (TKSmartCardPINFormat *)v7;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"APDU"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 copy];
    APDU = v5->_APDU;
    v5->_APDU = (NSData *)v10;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINByteOffset"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINByteOffset = [v12 integerValue];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForSecurePINVerification;
  id v4 = a3;
  -[TKSmartCardUserInteractionForPINOperation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_PINFormat, @"PINFormat", v6.receiver, v6.super_class);
  [v4 encodeObject:self->_APDU forKey:@"APDU"];
  [MEMORY[0x189607968] numberWithInteger:self->_PINByteOffset];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"PINByteOffset"];
}

- (void)setSlot:(id)a3 PINFormat:(id)a4 APDU:(id)a5 PINByteOffset:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  -[TKSmartCardUserInteractionForSecurePINVerification setSlot:](self, "setSlot:", a3);
  -[TKSmartCardUserInteractionForSecurePINVerification setPINFormat:](self, "setPINFormat:", v11);

  -[TKSmartCardUserInteractionForSecurePINVerification setAPDU:](self, "setAPDU:", v10);
  -[TKSmartCardUserInteractionForSecurePINVerification setPINByteOffset:](self, "setPINByteOffset:", a6);
}

- (void)runWithReply:(id)a3
{
  id v4 = a3;
  v5 = -[TKSmartCardUserInteractionForSecurePINVerification slot](self, "slot");
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke;
  v12[3] = &unk_189F8A488;
  id v7 = v4;
  id v13 = v7;
  [v5 synchronous:0 remoteSlotWithErrorHandler:v12];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke_2;
  v10[3] = &unk_189F8A6F8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 runUserInteraction:self reply:v10];
}

uint64_t __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

- (TKSmartCardSlot)slot
{
  return (TKSmartCardSlot *)objc_loadWeakRetained((id *)&self->_slot);
}

- (void)setSlot:(id)a3
{
}

- (TKSmartCardPINFormat)PINFormat
{
  return (TKSmartCardPINFormat *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setPINFormat:(id)a3
{
}

- (NSData)APDU
{
  return (NSData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setAPDU:(id)a3
{
}

- (int64_t)PINByteOffset
{
  return self->_PINByteOffset;
}

- (void)setPINByteOffset:(int64_t)a3
{
  self->_PINByteOffset = a3;
}

- (void).cxx_destruct
{
}

@end