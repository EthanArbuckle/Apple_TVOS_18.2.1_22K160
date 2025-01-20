@interface SecCBORUnsigned
- (SecCBORUnsigned)initWith:(unint64_t)a3;
- (id)getLabel;
- (int)fieldType;
- (int64_t)compare:(id)a3;
- (void)write:(id)a3;
@end

@implementation SecCBORUnsigned

- (int)fieldType
{
  return 0;
}

- (SecCBORUnsigned)initWith:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SecCBORUnsigned;
  result = -[SecCBORUnsigned init](&v5, sel_init);
  if (result) {
    result->m_data = a3;
  }
  return result;
}

- (void)write:(id)a3
{
}

- (int64_t)compare:(id)a3
{
  unint64_t m_data = self->m_data;
  unint64_t v4 = *((void *)a3 + 1);
  BOOL v5 = m_data >= v4;
  int64_t v6 = m_data > v4;
  if (v5) {
    return v6;
  }
  else {
    return -1LL;
  }
}

- (id)getLabel
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", self->m_data);
}

@end