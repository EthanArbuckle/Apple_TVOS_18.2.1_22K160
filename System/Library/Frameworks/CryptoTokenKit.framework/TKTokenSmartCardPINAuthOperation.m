@interface TKTokenSmartCardPINAuthOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)finishWithError:(id *)a3;
- (Class)baseClassForUI;
- (NSData)APDUTemplate;
- (NSInteger)PINByteOffset;
- (NSString)PIN;
- (NSString)localizedPINLabel;
- (TKSmartCard)smartCard;
- (TKSmartCardPINFormat)PINFormat;
- (TKTokenSmartCardPINAuthOperation)init;
- (TKTokenSmartCardPINAuthOperation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)importOperation:(id)a3;
- (void)setAPDUTemplate:(NSData *)APDUTemplate;
- (void)setLocalizedPINLabel:(id)a3;
- (void)setPIN:(NSString *)PIN;
- (void)setPINByteOffset:(NSInteger)PINByteOffset;
- (void)setPINFormat:(TKSmartCardPINFormat *)PINFormat;
- (void)setSmartCard:(TKSmartCard *)smartCard;
@end

@implementation TKTokenSmartCardPINAuthOperation

- (TKTokenSmartCardPINAuthOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TKTokenSmartCardPINAuthOperation;
  v2 = -[TKTokenSmartCardPINAuthOperation init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    PINFormat = v2->_PINFormat;
    v2->_PINFormat = (TKSmartCardPINFormat *)v3;
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenSmartCardPINAuthOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TKTokenSmartCardPINAuthOperation;
  v5 = -[TKTokenAuthOperation initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    NSStringFromSelector(sel_PINFormat);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    PINFormat = v5->_PINFormat;
    v5->_PINFormat = (TKSmartCardPINFormat *)v8;

    uint64_t v10 = objc_opt_class();
    NSStringFromSelector(sel_APDUTemplate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    APDUTemplate = v5->_APDUTemplate;
    v5->_APDUTemplate = (NSData *)v12;

    uint64_t v14 = objc_opt_class();
    NSStringFromSelector(sel_PINByteOffset);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 decodeObjectOfClass:v14 forKey:v15];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINByteOffset = [v16 integerValue];

    uint64_t v17 = objc_opt_class();
    NSStringFromSelector("PIN");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
    PIN = v5->_PIN;
    v5->_PIN = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    NSStringFromSelector(sel_localizedPINLabel);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    localizedPINLabel = v5->_localizedPINLabel;
    v5->_localizedPINLabel = (NSString *)v23;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TKTokenSmartCardPINAuthOperation;
  id v4 = a3;
  -[TKTokenAuthOperation encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  PINFormat = self->_PINFormat;
  NSStringFromSelector(sel_PINFormat);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", PINFormat, v6, v15.receiver, v15.super_class);

  APDUTemplate = self->_APDUTemplate;
  NSStringFromSelector(sel_APDUTemplate);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:APDUTemplate forKey:v8];

  [MEMORY[0x189607968] numberWithInteger:self->_PINByteOffset];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_PINByteOffset);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:v10];

  PIN = self->_PIN;
  NSStringFromSelector("PIN");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:PIN forKey:v12];

  localizedPINLabel = self->_localizedPINLabel;
  NSStringFromSelector(sel_localizedPINLabel);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:localizedPINLabel forKey:v14];
}

- (BOOL)finishWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    return 1;
  }
  -[TKTokenSmartCardPINAuthOperation APDUTemplate](self, "APDUTemplate");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v6 mutableCopy];

  -[TKTokenSmartCardPINAuthOperation PINFormat](self, "PINFormat");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TKTokenSmartCardPINAuthOperation PIN](self, "PIN");
  int v10 = objc_msgSend( v8,  "fillPIN:intoAPDUTemplate:PINByteOffset:error:",  v9,  v7,  -[TKTokenSmartCardPINAuthOperation PINByteOffset](self, "PINByteOffset"),  a3);

  if (v10)
  {
    -[TKTokenSmartCardPINAuthOperation setPIN:](self, "setPIN:", 0LL);
    uint64_t v27 = 0LL;
    v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    v30 = __Block_byref_object_copy__3;
    v31 = __Block_byref_object_dispose__3;
    id v32 = 0LL;
    uint64_t v21 = 0LL;
    v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    v24 = __Block_byref_object_copy__3;
    v25 = __Block_byref_object_dispose__3;
    id v26 = 0LL;
    v11 = -[TKTokenSmartCardPINAuthOperation smartCard](self, "smartCard");
    [v11 setSynchronous:1];

    -[TKTokenSmartCardPINAuthOperation smartCard](self, "smartCard");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __52__TKTokenSmartCardPINAuthOperation_finishWithError___block_invoke;
    v20[3] = &unk_189F8B210;
    v20[4] = &v27;
    v20[5] = &v21;
    [v12 transmitRequest:v7 reply:v20];
    v13 = -[TKTokenSmartCardPINAuthOperation smartCard](self, "smartCard");
    [v13 setSynchronous:0];

    uint64_t v14 = v28[5];
    if (a3 && !v14)
    {
      *a3 = (id) v22[5];
      uint64_t v14 = v28[5];
    }

    if (v14
      && (-[TKTokenSmartCardPINAuthOperation smartCard](self, "smartCard"),
          objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 checkAPDUResponse:v28[5] error:a3],
          v15,
          v16))
    {
      -[TKTokenSmartCardPINAuthOperation smartCard](self, "smartCard");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 setSensitive:1];

      BOOL v18 = 1;
    }

    else
    {
      BOOL v18 = 0;
    }

    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }

  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

void __52__TKTokenSmartCardPINAuthOperation_finishWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }
}

- (Class)baseClassForUI
{
  return (Class)objc_opt_class();
}

- (void)importOperation:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TKTokenSmartCardPINAuthOperation;
  id v4 = a3;
  -[TKTokenAuthOperation importOperation:](&v13, sel_importOperation_, v4);
  objc_msgSend(v4, "PINFormat", v13.receiver, v13.super_class);
  v5 = (TKSmartCardPINFormat *)objc_claimAutoreleasedReturnValue();
  PINFormat = self->_PINFormat;
  self->_PINFormat = v5;

  [v4 APDUTemplate];
  id v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  APDUTemplate = self->_APDUTemplate;
  self->_APDUTemplate = v7;

  self->_PINByteOffset = [v4 PINByteOffset];
  [v4 localizedPINLabel];
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedPINLabel = self->_localizedPINLabel;
  self->_localizedPINLabel = v9;

  [v4 PIN];
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  PIN = self->_PIN;
  self->_PIN = v11;
}

- (TKSmartCardPINFormat)PINFormat
{
  return (TKSmartCardPINFormat *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPINFormat:(TKSmartCardPINFormat *)PINFormat
{
}

- (NSData)APDUTemplate
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAPDUTemplate:(NSData *)APDUTemplate
{
}

- (NSInteger)PINByteOffset
{
  return self->_PINByteOffset;
}

- (void)setPINByteOffset:(NSInteger)PINByteOffset
{
  self->_PINByteOffset = PINByteOffset;
}

- (TKSmartCard)smartCard
{
  return (TKSmartCard *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSmartCard:(TKSmartCard *)smartCard
{
}

- (NSString)PIN
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPIN:(NSString *)PIN
{
}

- (NSString)localizedPINLabel
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setLocalizedPINLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end