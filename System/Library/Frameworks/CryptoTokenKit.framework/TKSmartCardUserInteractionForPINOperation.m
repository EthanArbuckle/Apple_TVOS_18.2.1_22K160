@interface TKSmartCardUserInteractionForPINOperation
+ (BOOL)supportsSecureCoding;
- (NSArray)PINMessageIndices;
- (NSData)resultData;
- (NSLocale)locale;
- (TKSmartCardPINCompletion)PINCompletion;
- (TKSmartCardUserInteractionForPINOperation)init;
- (TKSmartCardUserInteractionForPINOperation)initWithCoder:(id)a3;
- (UInt16)resultSW;
- (unsigned)localeID;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(NSLocale *)locale;
- (void)setPINCompletion:(TKSmartCardPINCompletion)PINCompletion;
- (void)setPINMessageIndices:(NSArray *)PINMessageIndices;
- (void)setResultData:(NSData *)resultData;
- (void)setResultSW:(UInt16)resultSW;
@end

@implementation TKSmartCardUserInteractionForPINOperation

- (TKSmartCardUserInteractionForPINOperation)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForPINOperation;
  v2 = -[TKSmartCardUserInteraction init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_PINCompletion = 2LL;
    PINMessageIndices = v2->_PINMessageIndices;
    v2->_PINMessageIndices = 0LL;

    locale = v3->_locale;
    v3->_locale = 0LL;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForPINOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForPINOperation;
  v5 = -[TKSmartCardUserInteraction initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINCompletion"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINCompletion = [v6 unsignedIntegerValue];

    objc_super v7 = (void *)MEMORY[0x189604010];
    uint64_t v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 decodeObjectOfClasses:v9 forKey:@"PINMessageIndices"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 copy];
    PINMessageIndices = v5->_PINMessageIndices;
    v5->_PINMessageIndices = (NSArray *)v11;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 copy];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TKSmartCardUserInteractionForPINOperation;
  id v4 = a3;
  -[TKSmartCardUserInteraction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", self->_PINCompletion, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"PINCompletion"];

  [v4 encodeObject:self->_PINMessageIndices forKey:@"PINMessageIndices"];
  v6 = -[TKSmartCardUserInteractionForPINOperation locale](self, "locale");
  [v4 encodeObject:v6 forKey:@"locale"];
}

- (NSLocale)locale
{
  locale = self->_locale;
  if (locale) {
    return locale;
  }
  [MEMORY[0x189603F90] currentLocale];
  return (NSLocale *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLocale:(NSLocale *)locale
{
}

- (unsigned)localeID
{
  v2 = (void *)MEMORY[0x189603F90];
  v3 = -[TKSmartCardUserInteractionForPINOperation locale](self, "locale");
  [v3 localeIdentifier];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v2) = [v2 windowsLocaleCodeFromLocaleIdentifier:v4];

  return (unsigned __int16)v2;
}

- (TKSmartCardPINCompletion)PINCompletion
{
  return self->_PINCompletion;
}

- (void)setPINCompletion:(TKSmartCardPINCompletion)PINCompletion
{
  self->_PINCompletion = PINCompletion;
}

- (NSArray)PINMessageIndices
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPINMessageIndices:(NSArray *)PINMessageIndices
{
}

- (UInt16)resultSW
{
  return self->_resultSW;
}

- (void)setResultSW:(UInt16)resultSW
{
  self->_resultSW = resultSW;
}

- (NSData)resultData
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setResultData:(NSData *)resultData
{
}

- (void).cxx_destruct
{
}

@end