@interface SecCBORData
- (SecCBORData)initWith:(id)a3;
- (int)fieldType;
- (void)write:(id)a3;
@end

@implementation SecCBORData

- (int)fieldType
{
  return 2;
}

- (SecCBORData)initWith:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SecCBORData;
  v5 = -[SecCBORData init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x189603F48]) initWithData:v4];
    m_data = v5->m_data;
    v5->m_data = (NSData *)v6;
  }

  return v5;
}

- (void)write:(id)a3
{
  m_data = self->m_data;
  id v5 = a3;
  -[SecCBORValue encodeStartItems:output:](self, "encodeStartItems:output:", -[NSData length](m_data, "length"), v5);
  objc_msgSend( v5,  "appendBytes:length:",  -[NSData bytes](self->m_data, "bytes"),  -[NSData length](self->m_data, "length"));
}

- (void).cxx_destruct
{
}

@end