@interface CKKSBaseAESSIVKey
- (BOOL)isEqual:(id)a3;
- (CKKSBaseAESSIVKey)init;
- (CKKSBaseAESSIVKey)initWithBase64:(id)a3;
- (CKKSBaseAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)zeroKey;
@end

@implementation CKKSBaseAESSIVKey

- (CKKSBaseAESSIVKey)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CKKSBaseAESSIVKey;
  v2 = -[CKKSBaseAESSIVKey init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->size = 80LL;
    -[CKKSBaseAESSIVKey zeroKey](v2, "zeroKey");
  }

  return v3;
}

- (CKKSBaseAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSBaseAESSIVKey;
  v6 = -[CKKSBaseAESSIVKey init](&v9, "init");
  v7 = v6;
  if (a4 <= 0x50 && v6)
  {
    v6->size = a4;
    memcpy(v6->key, a3, a4);
  }

  return v7;
}

- (CKKSBaseAESSIVKey)initWithBase64:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSBaseAESSIVKey;
  objc_super v5 = -[CKKSBaseAESSIVKey init](&v9, "init");
  if (!v5)
  {
LABEL_6:
    v7 = v5;
    goto LABEL_7;
  }

  v6 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v4,  0LL);
  v7 = (CKKSBaseAESSIVKey *)v6;
  if (v6)
  {
    if (-[NSData length](v6, "length") <= 0x50)
    {
      v5->size = (unint64_t)-[CKKSBaseAESSIVKey length](v7, "length");
      memcpy(v5->key, -[CKKSBaseAESSIVKey bytes](v7, "bytes"), v5->size);
    }

    goto LABEL_6;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CKKSBaseAESSIVKey, v5);
  BOOL v8 = 0;
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    size_t size = self->size;
    if (size == v4[11] && !memcmp(self->key, v4 + 1, size)) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CKKSBaseAESSIVKey;
  -[CKKSBaseAESSIVKey dealloc](&v3, "dealloc");
}

- (void)zeroKey
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend( objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3),  "initWithBytes:len:",  self->key,  self->size);
}

@end