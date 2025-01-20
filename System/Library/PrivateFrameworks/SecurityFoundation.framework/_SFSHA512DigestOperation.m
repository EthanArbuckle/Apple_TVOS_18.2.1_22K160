@interface _SFSHA512DigestOperation
+ (BOOL)supportsSecureCoding;
+ (id)digest:(id)a3;
+ (int64_t)blockSize;
+ (int64_t)outputSize;
- (NSData)hashValue;
- (_SFSHA512DigestOperation)init;
- (_SFSHA512DigestOperation)initWithCoder:(id)a3;
- (__CFString)_secKeyECDSAAlgorithm;
- (void)addData:(id)a3;
@end

@implementation _SFSHA512DigestOperation

+ (id)digest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS____SFSHA512DigestOperation);
  -[_SFSHA512DigestOperation addData:](v4, "addData:", v3);
  v5 = -[_SFSHA512DigestOperation hashValue](v4, "hashValue");
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA512DigestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____SFSHA512DigestOperation;
  v2 = -[_SFSHA512DigestOperation init](&v6, sel_init);
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SFSHA512DigestOperation_Ivars);
    sha512DigestOperationInternal = v2->_sha512DigestOperationInternal;
    v2->_sha512DigestOperationInternal = v3;

    CC_SHA512_Init((CC_SHA512_CTX *)((char *)v2->_sha512DigestOperationInternal + 8));
  }

  return v2;
}

- (_SFSHA512DigestOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFSHA512DigestOperation;
  return -[_SFSHA512DigestOperation init](&v4, sel_init, a3);
}

+ (int64_t)outputSize
{
  return 0LL;
}

+ (int64_t)blockSize
{
  return 0LL;
}

- (NSData)hashValue
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  sha512DigestOperationInternal = (char *)self->_sha512DigestOperationInternal;
  *(_OWORD *)v13.count = *(_OWORD *)(sha512DigestOperationInternal + 8);
  __int128 v3 = *(_OWORD *)(sha512DigestOperationInternal + 40);
  __int128 v4 = *(_OWORD *)(sha512DigestOperationInternal + 72);
  __int128 v5 = *(_OWORD *)(sha512DigestOperationInternal + 24);
  *(_OWORD *)&v13.hash[4] = *(_OWORD *)(sha512DigestOperationInternal + 56);
  *(_OWORD *)&v13.hash[6] = v4;
  *(_OWORD *)v13.hash = v5;
  *(_OWORD *)&v13.hash[2] = v3;
  __int128 v6 = *(_OWORD *)(sha512DigestOperationInternal + 104);
  __int128 v7 = *(_OWORD *)(sha512DigestOperationInternal + 136);
  __int128 v8 = *(_OWORD *)(sha512DigestOperationInternal + 88);
  *(_OWORD *)&v13.wbuf[4] = *(_OWORD *)(sha512DigestOperationInternal + 120);
  *(_OWORD *)&v13.wbuf[6] = v7;
  *(_OWORD *)v13.wbuf = v8;
  *(_OWORD *)&v13.wbuf[2] = v6;
  __int128 v9 = *(_OWORD *)(sha512DigestOperationInternal + 168);
  __int128 v10 = *(_OWORD *)(sha512DigestOperationInternal + 200);
  __int128 v11 = *(_OWORD *)(sha512DigestOperationInternal + 152);
  *(_OWORD *)&v13.wbuf[12] = *(_OWORD *)(sha512DigestOperationInternal + 184);
  *(_OWORD *)&v13.wbuf[14] = v10;
  *(_OWORD *)&v13.wbuf[8] = v11;
  *(_OWORD *)&v13.wbuf[10] = v9;
  CC_SHA512_Final(md, &v13);
  [MEMORY[0x189603F48] dataWithBytes:md length:64];
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addData:(id)a3
{
  __int128 v3 = (CC_SHA512_CTX *)((char *)self->_sha512DigestOperationInternal + 8);
  id v4 = a3;
  __int128 v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA512_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x18960BC50];
}

- (void).cxx_destruct
{
}

@end