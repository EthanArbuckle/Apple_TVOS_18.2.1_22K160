@interface _SFSHA224DigestOperation
+ (BOOL)supportsSecureCoding;
+ (id)digest:(id)a3;
+ (int64_t)blockSize;
+ (int64_t)outputSize;
- (NSData)hashValue;
- (_SFSHA224DigestOperation)init;
- (_SFSHA224DigestOperation)initWithCoder:(id)a3;
- (__CFString)_secKeyECDSAAlgorithm;
- (void)addData:(id)a3;
@end

@implementation _SFSHA224DigestOperation

+ (id)digest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS____SFSHA224DigestOperation);
  -[_SFSHA224DigestOperation addData:](v4, "addData:", v3);
  v5 = -[_SFSHA224DigestOperation hashValue](v4, "hashValue");
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA224DigestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____SFSHA224DigestOperation;
  v2 = -[_SFSHA224DigestOperation init](&v6, sel_init);
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SFSHA224DigestOperation_Ivars);
    sha224DigestOperationInternal = v2->_sha224DigestOperationInternal;
    v2->_sha224DigestOperationInternal = v3;

    CC_SHA224_Init((CC_SHA256_CTX *)((char *)v2->_sha224DigestOperationInternal + 8));
  }

  return v2;
}

- (_SFSHA224DigestOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFSHA224DigestOperation;
  return -[_SFSHA224DigestOperation init](&v4, sel_init, a3);
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
  uint64_t v11 = *MEMORY[0x1895F89C0];
  sha224DigestOperationInternal = (char *)self->_sha224DigestOperationInternal;
  __int128 v3 = *(_OWORD *)(sha224DigestOperationInternal + 40);
  __int128 v4 = *(_OWORD *)(sha224DigestOperationInternal + 24);
  *(_OWORD *)v9.count = *(_OWORD *)(sha224DigestOperationInternal + 8);
  *(_OWORD *)&v9.hash[2] = v4;
  *(_OWORD *)&v9.hash[6] = v3;
  __int128 v5 = *(_OWORD *)(sha224DigestOperationInternal + 56);
  __int128 v6 = *(_OWORD *)(sha224DigestOperationInternal + 72);
  __int128 v7 = *(_OWORD *)(sha224DigestOperationInternal + 88);
  *(void *)&v9.wbuf[14] = *((void *)sha224DigestOperationInternal + 13);
  *(_OWORD *)&v9.wbuf[6] = v6;
  *(_OWORD *)&v9.wbuf[10] = v7;
  *(_OWORD *)&v9.wbuf[2] = v5;
  CC_SHA224_Final(md, &v9);
  [MEMORY[0x189603F48] dataWithBytes:md length:28];
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addData:(id)a3
{
  __int128 v3 = (CC_SHA256_CTX *)((char *)self->_sha224DigestOperationInternal + 8);
  id v4 = a3;
  __int128 v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA224_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x18960BC38];
}

- (void).cxx_destruct
{
}

@end