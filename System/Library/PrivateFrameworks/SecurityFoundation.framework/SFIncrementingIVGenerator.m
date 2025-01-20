@interface SFIncrementingIVGenerator
- (NSData)messageID;
- (SFIncrementingIVGenerator)initWithMessageID:(id)a3;
- (SFIncrementingIVGenerator)initWithRandomMessageID;
- (id)generateIVWithLength:(int64_t)a3 error:(id *)a4;
- (void)setMessageID:(id)a3;
@end

@implementation SFIncrementingIVGenerator

- (SFIncrementingIVGenerator)initWithRandomMessageID
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setLength:32];
  v4 = (const __SecRandom *)*MEMORY[0x18960BE08];
  id v5 = v3;
  if (SecRandomCopyBytes(v4, 0x20uLL, (void *)[v5 mutableBytes]))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"could not get a random initialization vector" userInfo:0];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
    return -[SFIncrementingIVGenerator initWithMessageID:](v9, v10, v11);
  }

  else
  {
    v6 = -[SFIncrementingIVGenerator initWithMessageID:](self, "initWithMessageID:", v5);

    return v6;
  }

- (SFIncrementingIVGenerator)initWithMessageID:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SFIncrementingIVGenerator;
  id v5 = -[SFIncrementingIVGenerator init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___SFIncrementingIVGenerator_Ivars);
    id incrementingIVGeneratorInternal = v5->_incrementingIVGeneratorInternal;
    v5->_id incrementingIVGeneratorInternal = v6;

    uint64_t v8 = [v4 mutableCopy];
    v9 = v5->_incrementingIVGeneratorInternal;
    SEL v10 = (void *)v9[1];
    v9[1] = v8;
  }

  return v5;
}

- (NSData)messageID
{
  return (NSData *)(id)[*((id *)self->_incrementingIVGeneratorInternal + 1) copy];
}

- (void)setMessageID:(id)a3
{
  uint64_t v4 = [a3 copy];
  id incrementingIVGeneratorInternal = self->_incrementingIVGeneratorInternal;
  v6 = (void *)incrementingIVGeneratorInternal[1];
  incrementingIVGeneratorInternal[1] = v4;
}

- (id)generateIVWithLength:(int64_t)a3 error:(id *)a4
{
  id incrementingIVGeneratorInternal = self->_incrementingIVGeneratorInternal;
  if (*((void *)incrementingIVGeneratorInternal + 2) >= (unint64_t)a3)
  {
    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:6 userInfo:0];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id incrementingIVGeneratorInternal = self->_incrementingIVGeneratorInternal;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (a3 - 1 >= (unint64_t)[*((id *)incrementingIVGeneratorInternal + 1) length])
  {
    uint64_t v9 = [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:7 userInfo:0];

    uint64_t v8 = (void *)v9;
  }

  if (a4 && v8)
  {
    SEL v10 = 0LL;
    *a4 = v8;
  }

  else
  {
    objc_msgSend( *((id *)self->_incrementingIVGeneratorInternal + 1),  "subdataWithRange:",  objc_msgSend(*((id *)self->_incrementingIVGeneratorInternal + 1), "length") - a3,  a3);
    SEL v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [*((id *)self->_incrementingIVGeneratorInternal + 1) length];
    uint64_t v12 = [*((id *)self->_incrementingIVGeneratorInternal + 1) mutableBytes];
    __int16 v13 = (*(_BYTE *)(v12 + v11 - 1))++ + 1;
    if ((v13 & 0x100) != 0 && v11 != 1)
    {
      uint64_t v14 = 1 - v11;
      v15 = (_BYTE *)(v11 + v12 - 2);
      do
      {
        unint64_t v16 = [*((id *)self->_incrementingIVGeneratorInternal + 1) length] + v14;
        v17 = self->_incrementingIVGeneratorInternal;
        if (v16 <= v17[2]) {
          unint64_t v16 = v17[2];
        }
        v17[2] = v16;
        __int16 v18 = (*v15--)++ + 1;
        if ((v18 & 0x100) == 0) {
          break;
        }
        ++v14;
      }

      while (v14);
    }
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end