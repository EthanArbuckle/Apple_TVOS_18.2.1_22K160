@interface MCMLazyDescription
- (MCMLazyDescription)initWithDescriber:(id)a3;
- (id)description;
- (id)redactedDescription;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation MCMLazyDescription

- (MCMLazyDescription)initWithDescriber:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMLazyDescription;
  v5 = -[MCMLazyDescription init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1895CE54C](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }

  return v5;
}

- (unint64_t)length
{
  value = self->_value;
  if (!value)
  {
    id v4 = -[MCMLazyDescription description](self, "description");
    value = self->_value;
  }

  return -[NSString length](value, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  value = self->_value;
  if (!value)
  {
    id v6 = -[MCMLazyDescription description](self, "description");
    value = self->_value;
  }

  return -[NSString characterAtIndex:](value, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  value = self->_value;
  if (!value)
  {
    id v9 = -[MCMLazyDescription description](self, "description");
    value = self->_value;
  }

  -[NSString getCharacters:range:](value, "getCharacters:range:", a3, location, length);
}

- (id)description
{
  value = self->_value;
  if (!value)
  {
    (*((void (**)(void))self->_block + 2))();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_value;
    self->_value = v4;

    value = self->_value;
  }

  return value;
}

- (id)redactedDescription
{
  return (id)(*((uint64_t (**)(id, uint64_t))self->_block + 2))(self->_block, 1LL);
}

- (void).cxx_destruct
{
}

@end