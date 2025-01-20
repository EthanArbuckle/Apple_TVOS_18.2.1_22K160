@interface NSMetadataQueryAttributeValueTuple
- (NSString)attribute;
- (NSUInteger)count;
- (id)_init:(id)a3 attribute:(id)a4 value:(id)a5 count:(unint64_t)a6;
- (id)value;
- (void)dealloc;
@end

@implementation NSMetadataQueryAttributeValueTuple

- (id)_init:(id)a3 attribute:(id)a4 value:(id)a5 count:(unint64_t)a6
{
  self->_attr = a4;
  self->_value = a5;
  self->_count = a6;
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMetadataQueryAttributeValueTuple;
  -[NSMetadataQueryAttributeValueTuple dealloc](&v3, sel_dealloc);
}

- (NSString)attribute
{
  return (NSString *)self->_attr;
}

- (id)value
{
  return self->_value;
}

- (NSUInteger)count
{
  return self->_count;
}

@end