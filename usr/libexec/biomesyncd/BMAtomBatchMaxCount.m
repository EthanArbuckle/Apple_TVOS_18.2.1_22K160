@interface BMAtomBatchMaxCount
- (BMAtomBatchMaxCount)initWithMaxCount:(unint64_t)a3;
- (BOOL)canAddAtomWithData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)didAddAtomWithData:(id)a3;
@end

@implementation BMAtomBatchMaxCount

- (BMAtomBatchMaxCount)initWithMaxCount:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BMAtomBatchMaxCount;
  result = -[BMAtomBatchMaxCount init](&v5, "init");
  if (result)
  {
    result->_maxCount = a3;
    result->_atomCount = 0LL;
  }

  return result;
}

- (BOOL)canAddAtomWithData:(id)a3
{
  return self->_atomCount < self->_maxCount;
}

- (void)didAddAtomWithData:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  return -[BMAtomBatchMaxCount initWithMaxCount:](v3, "initWithMaxCount:", v3->_maxCount);
}

@end