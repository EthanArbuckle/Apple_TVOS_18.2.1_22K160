@interface _SFMD5DigestOperation
+ (BOOL)supportsSecureCoding;
+ (id)digest:(id)a3;
+ (int64_t)blockSize;
+ (int64_t)outputSize;
- (NSData)hashValue;
- (_SFMD5DigestOperation)init;
- (_SFMD5DigestOperation)initWithCoder:(id)a3;
- (__CFString)_secKeyECDSAAlgorithm;
- (void)addData:(id)a3;
@end

@implementation _SFMD5DigestOperation

+ (id)digest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS____SFMD5DigestOperation);
  -[_SFMD5DigestOperation addData:](v4, "addData:", v3);
  v5 = -[_SFMD5DigestOperation hashValue](v4, "hashValue");
  return v5;
}

+ (int64_t)outputSize
{
  return 0LL;
}

+ (int64_t)blockSize
{
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFMD5DigestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____SFMD5DigestOperation;
  v2 = -[_SFMD5DigestOperation init](&v6, sel_init);
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SFMD5DigestOperation_Ivars);
    id md5DigestOperationInternal = v2->_md5DigestOperationInternal;
    v2->_id md5DigestOperationInternal = v3;

    CC_MD5_Init((CC_MD5_CTX *)((char *)v2->_md5DigestOperationInternal + 8));
  }

  return v2;
}

- (_SFMD5DigestOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFMD5DigestOperation;
  return -[_SFMD5DigestOperation init](&v4, sel_init, a3);
}

- (NSData)hashValue
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  CC_MD5_Final(md, &c);
  [MEMORY[0x189603F48] dataWithBytes:md length:16];
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addData:(id)a3
{
  id v3 = (CC_MD5_CTX *)((char *)self->_md5DigestOperationInternal + 8);
  id v4 = a3;
  uint64_t v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_MD5_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x18960BC28];
}

- (void).cxx_destruct
{
}

@end