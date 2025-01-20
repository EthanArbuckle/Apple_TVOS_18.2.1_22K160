@interface TKSmartCardPINFormat
+ (BOOL)supportsSecureCoding;
+ (void)_writeNumber:(unint64_t)a3 into:(id)a4 bitOffset:(int64_t)a5 bitLength:(int64_t)a6;
- (BOOL)fillPIN:(id)a3 intoAPDUTemplate:(id)a4 PINByteOffset:(int64_t)a5 error:(id *)a6;
- (NSInteger)PINBitOffset;
- (NSInteger)PINBlockByteLength;
- (NSInteger)PINLengthBitOffset;
- (NSInteger)PINLengthBitSize;
- (NSInteger)maxPINLength;
- (NSInteger)minPINLength;
- (TKSmartCardPINCharset)charset;
- (TKSmartCardPINEncoding)encoding;
- (TKSmartCardPINFormat)init;
- (TKSmartCardPINFormat)initWithCoder:(id)a3;
- (TKSmartCardPINJustification)PINJustification;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)PINBlockString;
- (unsigned)PINFormatStringWithError:(id *)a3;
- (unsigned)PINLengthFormatWithError:(id *)a3;
- (unsigned)PINMaxExtraDigit;
- (void)encodeWithCoder:(id)a3;
- (void)setCharset:(TKSmartCardPINCharset)charset;
- (void)setEncoding:(TKSmartCardPINEncoding)encoding;
- (void)setMaxPINLength:(NSInteger)maxPINLength;
- (void)setMinPINLength:(NSInteger)minPINLength;
- (void)setPINBitOffset:(NSInteger)PINBitOffset;
- (void)setPINBlockByteLength:(NSInteger)PINBlockByteLength;
- (void)setPINJustification:(TKSmartCardPINJustification)PINJustification;
- (void)setPINLengthBitOffset:(NSInteger)PINLengthBitOffset;
- (void)setPINLengthBitSize:(NSInteger)PINLengthBitSize;
@end

@implementation TKSmartCardPINFormat

- (TKSmartCardPINFormat)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKSmartCardPINFormat;
  result = -[TKSmartCardPINFormat init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_charset = xmmword_186E98A90;
    *(_OWORD *)&result->_minPINLength = xmmword_186E98AA0;
    result->_PINBlockByteLength = 8LL;
    *(_OWORD *)&result->_PINJustification = 0u;
    *(_OWORD *)&result->_PINLengthBitOffset = 0u;
  }

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardPINFormat)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TKSmartCardPINFormat;
  v5 = -[TKSmartCardPINFormat init](&v16, sel_init);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"charset"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_charset = [v6 integerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encoding"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_encoding = [v7 integerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minPINLength"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minPINLength = [v8 integerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxPINLength"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxPINLength = [v9 integerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINBlockByteLength"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINBlockByteLength = [v10 integerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINJustification"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINJustification = [v11 integerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINBitOffset"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINBitOffset = [v12 integerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINLengthBitOffset"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINLengthBitOffset = [v13 integerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINLengthBitSize"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINLengthBitSize = [v14 integerValue];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x189607968];
  int64_t charset = self->_charset;
  id v6 = a3;
  [v4 numberWithInteger:charset];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v7 forKey:@"charset"];

  [MEMORY[0x189607968] numberWithInteger:self->_encoding];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v8 forKey:@"encoding"];

  [MEMORY[0x189607968] numberWithInteger:self->_minPINLength];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v9 forKey:@"minPINLength"];

  [MEMORY[0x189607968] numberWithInteger:self->_maxPINLength];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v10 forKey:@"maxPINLength"];

  [MEMORY[0x189607968] numberWithInteger:self->_PINBlockByteLength];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v11 forKey:@"PINBlockByteLength"];

  [MEMORY[0x189607968] numberWithInteger:self->_PINJustification];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v12 forKey:@"PINJustification"];

  [MEMORY[0x189607968] numberWithInteger:self->_PINBitOffset];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v13 forKey:@"PINBitOffset"];

  [MEMORY[0x189607968] numberWithInteger:self->_PINLengthBitOffset];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v14 forKey:@"PINLengthBitOffset"];

  [MEMORY[0x189607968] numberWithInteger:self->_PINLengthBitSize];
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v15 forKey:@"PINLengthBitSize"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___TKSmartCardPINFormat);
  -[TKSmartCardPINFormat setCharset:](v4, "setCharset:", -[TKSmartCardPINFormat charset](self, "charset"));
  -[TKSmartCardPINFormat setEncoding:](v4, "setEncoding:", -[TKSmartCardPINFormat encoding](self, "encoding"));
  -[TKSmartCardPINFormat setMinPINLength:]( v4,  "setMinPINLength:",  -[TKSmartCardPINFormat minPINLength](self, "minPINLength"));
  -[TKSmartCardPINFormat setMaxPINLength:]( v4,  "setMaxPINLength:",  -[TKSmartCardPINFormat maxPINLength](self, "maxPINLength"));
  -[TKSmartCardPINFormat setPINBlockByteLength:]( v4,  "setPINBlockByteLength:",  -[TKSmartCardPINFormat PINBlockByteLength](self, "PINBlockByteLength"));
  -[TKSmartCardPINFormat setPINJustification:]( v4,  "setPINJustification:",  -[TKSmartCardPINFormat PINJustification](self, "PINJustification"));
  -[TKSmartCardPINFormat setPINBitOffset:]( v4,  "setPINBitOffset:",  -[TKSmartCardPINFormat PINBitOffset](self, "PINBitOffset"));
  -[TKSmartCardPINFormat setPINLengthBitOffset:]( v4,  "setPINLengthBitOffset:",  -[TKSmartCardPINFormat PINLengthBitOffset](self, "PINLengthBitOffset"));
  -[TKSmartCardPINFormat setPINLengthBitSize:]( v4,  "setPINLengthBitSize:",  -[TKSmartCardPINFormat PINLengthBitSize](self, "PINLengthBitSize"));
  return v4;
}

+ (void)_writeNumber:(unint64_t)a3 into:(id)a4 bitOffset:(int64_t)a5 bitLength:(int64_t)a6
{
  if (a6 >= 1)
  {
    int64_t v9 = a6 + a5;
    uint64_t v10 = -1LL;
    do
    {
      uint64_t v11 = [a4 mutableBytes];
      uint64_t v12 = v9 + v10 + 7;
      if (v9 + v10 >= 0) {
        uint64_t v12 = v9 + v10;
      }
      uint64_t v13 = v12 >> 3;
      char v14 = v9 + v10 - 8 * v13;
      int v15 = *(unsigned __int8 *)(v11 + v13);
      int v16 = v15 & (-129 >> v14);
      unsigned int v17 = v15 | (0x80u >> v14);
      if ((a3 & 1) == 0) {
        LOBYTE(v17) = v16;
      }
      *(_BYTE *)(v11 + v13) = v17;
      a3 >>= 1;
      --v10;
    }

    while (a6 + v10 + 2 > 1);
  }

- (BOOL)fillPIN:(id)a3 intoAPDUTemplate:(id)a4 PINByteOffset:(int64_t)a5 error:(id *)a6
{
  v38[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  if (*(_BYTE *)([v11 bytes] + 4))
  {
    uint64_t v12 = 40LL;
  }

  else if ((unint64_t)[v11 length] <= 6)
  {
    uint64_t v12 = 40LL;
  }

  else
  {
    uint64_t v12 = 56LL;
  }

  id v13 = v10;
  char v14 = (const char *)[v13 UTF8String];
  int64_t v15 = strlen(v14);
  if (v15 < -[TKSmartCardPINFormat minPINLength](self, "minPINLength")
    || v15 > -[TKSmartCardPINFormat maxPINLength](self, "maxPINLength"))
  {
    if (a6)
    {
      int v16 = (void *)MEMORY[0x189607870];
      uint64_t v37 = *MEMORY[0x1896075E0];
      +[TKSmartCard _localizedString:](&OBJC_CLASS___TKSmartCard, "_localizedString:", @"INVALID_PIN");
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v17;
      v18 = (void *)MEMORY[0x189603F68];
      v19 = (void **)v38;
      v20 = &v37;
      goto LABEL_10;
    }

    goto LABEL_37;
  }

  uint64_t v22 = v12 + 8 * a5;
  objc_msgSend( (id)objc_opt_class(),  "_writeNumber:into:bitOffset:bitLength:",  v15,  v11,  -[TKSmartCardPINFormat PINLengthBitOffset](self, "PINLengthBitOffset") + v22,  -[TKSmartCardPINFormat PINLengthBitSize](self, "PINLengthBitSize"));
  NSInteger v23 = -[TKSmartCardPINFormat PINBitOffset](self, "PINBitOffset") + v22;
  TKSmartCardPINEncoding v24 = -[TKSmartCardPINFormat encoding](self, "encoding");
  if (v24 == TKSmartCardPINEncodingBCD) {
    uint64_t v25 = 4LL;
  }
  else {
    uint64_t v25 = 8LL;
  }
  if (-[TKSmartCardPINFormat PINJustification](self, "PINJustification") == TKSmartCardPINJustificationRight)
  {
    char v26 = 2;
    if (v24 != TKSmartCardPINEncodingBCD) {
      char v26 = 3;
    }
    NSInteger v23 = v23 - (v15 << v26) + 8 * -[TKSmartCardPINFormat PINBlockByteLength](self, "PINBlockByteLength");
  }

  if (v15 < 1)
  {
LABEL_36:
    LOBYTE(a6) = 1;
    goto LABEL_37;
  }

  while (1)
  {
    int v28 = *(unsigned __int8 *)v14++;
    unsigned __int8 v27 = v28;
    TKSmartCardPINCharset v29 = -[TKSmartCardPINFormat charset](self, "charset");
    unsigned int v30 = v28 - 48;
    switch(v29)
    {
      case TKSmartCardPINCharsetNumeric:
        if (v30 >= 0xA) {
          goto LABEL_38;
        }
        goto LABEL_33;
      case TKSmartCardPINCharsetAlphanumeric:
        BOOL v31 = v30 >= 0xA && (v27 - 65) >= 0x1Au;
        unsigned int v32 = (v27 - 97);
        break;
      case TKSmartCardPINCharsetUpperAlphanumeric:
        BOOL v31 = v30 >= 0xA;
        unsigned int v32 = (v27 - 65);
        break;
      default:
        goto LABEL_33;
    }

    if (v31 && v32 >= 0x1A) {
      break;
    }
LABEL_33:
    if (-[TKSmartCardPINFormat encoding](self, "encoding") != TKSmartCardPINEncodingASCII) {
      unsigned __int8 v27 = v30;
    }
    [(id)objc_opt_class() _writeNumber:v27 into:v11 bitOffset:v23 bitLength:v25];
    v23 += v25;
    if (!--v15) {
      goto LABEL_36;
    }
  }

- (unsigned)PINFormatStringWithError:(id *)a3
{
  TKSmartCardPINEncoding v5 = -[TKSmartCardPINFormat encoding](self, "encoding");
  TKSmartCardPINEncoding v6 = -[TKSmartCardPINFormat encoding](self, "encoding");
  TKSmartCardPINJustification v7 = -[TKSmartCardPINFormat PINJustification](self, "PINJustification");
  char v8 = -[TKSmartCardPINFormat PINBitOffset](self, "PINBitOffset");
  NSInteger v9 = -[TKSmartCardPINFormat PINBitOffset](self, "PINBitOffset");
  uint64_t v10 = 8LL;
  if ((v8 & 7) != 0) {
    uint64_t v10 = 1LL;
  }
  unint64_t v11 = v9 / v10;
  if (v11 < 0x10) {
    return (v5 == TKSmartCardPINEncodingBCD) | (2 * (v6 == TKSmartCardPINEncodingASCII)) & 0x87 | (4
  }
                                                                                                 * (v7 == TKSmartCardPINJustificationRight)) & 0x87 | (8 * (v11 & 0xF)) | (((v8 & 7) == 0LL) << 7);
  TK_LOG_smartcard();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardPINFormat PINFormatStringWithError:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  }

  if (!a3) {
    return 0;
  }
  [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  unsigned __int8 result = 0;
  *a3 = v20;
  return result;
}

- (unsigned)PINBlockString
{
  char v3 = -[TKSmartCardPINFormat PINBlockByteLength](self, "PINBlockByteLength");
  return v3 & 0xF | (16 * -[TKSmartCardPINFormat PINLengthBitSize](self, "PINLengthBitSize"));
}

- (unsigned)PINLengthFormatWithError:(id *)a3
{
  char v5 = -[TKSmartCardPINFormat PINLengthBitOffset](self, "PINLengthBitOffset");
  NSInteger v6 = -[TKSmartCardPINFormat PINLengthBitOffset](self, "PINLengthBitOffset");
  uint64_t v7 = 8LL;
  if ((v5 & 7) != 0) {
    uint64_t v7 = 1LL;
  }
  unint64_t v8 = v6 / v7;
  if (v8 < 0x10) {
    return v8 | (16 * ((v5 & 7) == 0LL));
  }
  TK_LOG_smartcard();
  NSInteger v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardPINFormat PINLengthFormatWithError:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  if (!a3) {
    return 0;
  }
  [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v18 = 0;
  *a3 = v17;
  return v18;
}

- (unsigned)PINMaxExtraDigit
{
  __int16 v3 = -[TKSmartCardPINFormat minPINLength](self, "minPINLength");
  return -[TKSmartCardPINFormat maxPINLength](self, "maxPINLength") | (unsigned __int16)(v3 << 8);
}

- (TKSmartCardPINCharset)charset
{
  return self->_charset;
}

- (void)setCharset:(TKSmartCardPINCharset)charset
{
  self->_int64_t charset = charset;
}

- (TKSmartCardPINEncoding)encoding
{
  return self->_encoding;
}

- (void)setEncoding:(TKSmartCardPINEncoding)encoding
{
  self->_encoding = encoding;
}

- (NSInteger)minPINLength
{
  return self->_minPINLength;
}

- (void)setMinPINLength:(NSInteger)minPINLength
{
  self->_minPINLength = minPINLength;
}

- (NSInteger)maxPINLength
{
  return self->_maxPINLength;
}

- (void)setMaxPINLength:(NSInteger)maxPINLength
{
  self->_maxPINLength = maxPINLength;
}

- (NSInteger)PINBlockByteLength
{
  return self->_PINBlockByteLength;
}

- (void)setPINBlockByteLength:(NSInteger)PINBlockByteLength
{
  self->_PINBlockByteLength = PINBlockByteLength;
}

- (TKSmartCardPINJustification)PINJustification
{
  return self->_PINJustification;
}

- (void)setPINJustification:(TKSmartCardPINJustification)PINJustification
{
  self->_PINJustification = PINJustification;
}

- (NSInteger)PINBitOffset
{
  return self->_PINBitOffset;
}

- (void)setPINBitOffset:(NSInteger)PINBitOffset
{
  self->_PINBitOffset = PINBitOffset;
}

- (NSInteger)PINLengthBitOffset
{
  return self->_PINLengthBitOffset;
}

- (void)setPINLengthBitOffset:(NSInteger)PINLengthBitOffset
{
  self->_PINLengthBitOffset = PINLengthBitOffset;
}

- (NSInteger)PINLengthBitSize
{
  return self->_PINLengthBitSize;
}

- (void)setPINLengthBitSize:(NSInteger)PINLengthBitSize
{
  self->_PINLengthBitSize = PINLengthBitSize;
}

- (void)PINFormatStringWithError:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)PINLengthFormatWithError:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end