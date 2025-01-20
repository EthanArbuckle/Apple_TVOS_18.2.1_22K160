@interface PS190SiliconID
- (NSData)data;
- (NSString)string;
- (PS190SiliconID)initWithData:(id)a3;
- (id)description;
@end

@implementation PS190SiliconID

- (PS190SiliconID)initWithData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PS190SiliconID;
  v5 = -[PS190SiliconID init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSString *)(id)[v4 byteString];
    string = v5->_string;
    v5->_string = v6;

    uint64_t v8 = [v4 copy];
    data = v5->_data;
    v5->_data = (NSData *)v8;
  }

  return v5;
}

- (id)description
{
  return self->_string;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end