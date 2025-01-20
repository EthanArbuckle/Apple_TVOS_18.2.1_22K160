@interface _SFSHA384DigestOperation
+ (BOOL)supportsSecureCoding;
+ (id)digest:(id)a3;
+ (int64_t)blockSize;
+ (int64_t)outputSize;
- (NSData)hashValue;
- (_SFSHA384DigestOperation)init;
- (_SFSHA384DigestOperation)initWithCoder:(id)a3;
- (__CFString)_secKeyECDSAAlgorithm;
- (void)addData:(id)a3;
@end

@implementation _SFSHA384DigestOperation

+ (id)digest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS____SFSHA384DigestOperation);
  -[_SFSHA384DigestOperation addData:](v4, "addData:", v3);
  v5 = -[_SFSHA384DigestOperation hashValue](v4, "hashValue");
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA384DigestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____SFSHA384DigestOperation;
  v2 = -[_SFSHA384DigestOperation init](&v6, sel_init);
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SFSHA384DigestOperation_Ivars);
    sha384DigestOperationInternal = v2->_sha384DigestOperationInternal;
    v2->_sha384DigestOperationInternal = v3;

    CC_SHA384_Init((CC_SHA512_CTX *)((char *)v2->_sha384DigestOperationInternal + 8));
  }

  return v2;
}

- (_SFSHA384DigestOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFSHA384DigestOperation;
  return -[_SFSHA384DigestOperation init](&v4, sel_init, a3);
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
  sha384DigestOperationInternal = (char *)self->_sha384DigestOperationInternal;
  *(_OWORD *)v13.count = *(_OWORD *)(sha384DigestOperationInternal + 8);
  __int128 v3 = *(_OWORD *)(sha384DigestOperationInternal + 40);
  __int128 v4 = *(_OWORD *)(sha384DigestOperationInternal + 72);
  __int128 v5 = *(_OWORD *)(sha384DigestOperationInternal + 24);
  *(_OWORD *)&v13.hash[4] = *(_OWORD *)(sha384DigestOperationInternal + 56);
  *(_OWORD *)&v13.hash[6] = v4;
  *(_OWORD *)v13.hash = v5;
  *(_OWORD *)&v13.hash[2] = v3;
  __int128 v6 = *(_OWORD *)(sha384DigestOperationInternal + 104);
  __int128 v7 = *(_OWORD *)(sha384DigestOperationInternal + 136);
  __int128 v8 = *(_OWORD *)(sha384DigestOperationInternal + 88);
  *(_OWORD *)&v13.wbuf[4] = *(_OWORD *)(sha384DigestOperationInternal + 120);
  *(_OWORD *)&v13.wbuf[6] = v7;
  *(_OWORD *)v13.wbuf = v8;
  *(_OWORD *)&v13.wbuf[2] = v6;
  __int128 v9 = *(_OWORD *)(sha384DigestOperationInternal + 168);
  __int128 v10 = *(_OWORD *)(sha384DigestOperationInternal + 200);
  __int128 v11 = *(_OWORD *)(sha384DigestOperationInternal + 152);
  *(_OWORD *)&v13.wbuf[12] = *(_OWORD *)(sha384DigestOperationInternal + 184);
  *(_OWORD *)&v13.wbuf[14] = v10;
  *(_OWORD *)&v13.wbuf[8] = v11;
  *(_OWORD *)&v13.wbuf[10] = v9;
  CC_SHA384_Final(md, &v13);
  [MEMORY[0x189603F48] dataWithBytes:md length:48];
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addData:(id)a3
{
  __int128 v3 = (CC_SHA512_CTX *)((char *)self->_sha384DigestOperationInternal + 8);
  id v4 = a3;
  __int128 v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA384_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x18960BC48];
}

- (void).cxx_destruct
{
}

@end