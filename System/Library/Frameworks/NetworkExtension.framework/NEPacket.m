@interface NEPacket
+ (BOOL)supportsSecureCoding;
- (NEFlowMetaData)metadata;
- (NEPacket)initWithCoder:(id)a3;
- (NEPacket)initWithData:(NSData *)data protocolFamily:(sa_family_t)protocolFamily;
- (NETrafficDirection)direction;
- (NSData)data;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithData:(char)a3 protocolFamily:(void *)a4 metadata:;
- (sa_family_t)protocolFamily;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEPacket

- (void)dealloc
{
  if (self && objc_getProperty(self, a2, 48LL, 1))
  {
    Property = (os_unfair_lock_s *)objc_getProperty(self, v3, 48LL, 1);
    -[NEFilterPacketInterpose freePacket:](Property, self);
    objc_setProperty_atomic(self, v5, 0LL, 48LL);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEPacket;
  -[NEPacket dealloc](&v6, sel_dealloc);
}

- (NEPacket)initWithData:(NSData *)data protocolFamily:(sa_family_t)protocolFamily
{
  return (NEPacket *)-[NEPacket initWithData:protocolFamily:metadata:]( (id *)&self->super.isa,  data,  protocolFamily,  0LL);
}

- (NEPacket)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEPacket;
  SEL v5 = -[NEPacket init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_protocolFamily = [v4 decodeIntForKey:@"protocolFamily"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NEFlowMetaData *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[NEPacket data](self, "data");
  SEL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"data"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEPacket protocolFamily](self, "protocolFamily") != 0,  @"protocolFamily");
  -[NEPacket metadata](self, "metadata");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"metadata"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEPacket allocWithZone:](&OBJC_CLASS___NEPacket, "allocWithZone:", a3);
  -[NEPacket data](self, "data");
  SEL v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = -[NEPacket protocolFamily](self, "protocolFamily");
  v7 = -[NEPacket metadata](self, "metadata");
  uint64_t v8 = -[NEPacket initWithData:protocolFamily:metadata:]((id *)&v4->super.isa, v5, v6, v7);

  return v8;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (sa_family_t)protocolFamily
{
  return self->_protocolFamily;
}

- (NETrafficDirection)direction
{
  return self->_direction;
}

- (NEFlowMetaData)metadata
{
  return (NEFlowMetaData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

- (id)initWithData:(char)a3 protocolFamily:(void *)a4 metadata:
{
  id v8 = a2;
  id v9 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_CLASS___NEPacket;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      *((_BYTE *)a1 + 8) = a3;
      objc_storeStrong(a1 + 4, a4);
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end