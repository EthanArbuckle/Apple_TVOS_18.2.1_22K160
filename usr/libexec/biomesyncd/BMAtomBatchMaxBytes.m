@interface BMAtomBatchMaxBytes
- (BMAtomBatchMaxBytes)initWithMaxBytes:(unint64_t)a3;
- (BOOL)canAddAtomWithData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)didAddAtomWithData:(id)a3;
@end

@implementation BMAtomBatchMaxBytes

- (BMAtomBatchMaxBytes)initWithMaxBytes:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BMAtomBatchMaxBytes;
  result = -[BMAtomBatchMaxBytes init](&v5, "init");
  if (result)
  {
    result->_maxBytes = a3;
    result->_usedBytes = 0LL;
  }

  return result;
}

- (BOOL)canAddAtomWithData:(id)a3
{
  return self->_usedBytes <= self->_maxBytes;
}

- (void)didAddAtomWithData:(id)a3
{
  self->_usedBytes += (unint64_t)[a3 length];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  return -[BMAtomBatchMaxBytes initWithMaxBytes:](v3, "initWithMaxBytes:", v3->_maxBytes);
}

@end