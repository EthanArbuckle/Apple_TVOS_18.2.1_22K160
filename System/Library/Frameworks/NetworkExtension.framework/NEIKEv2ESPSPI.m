@interface NEIKEv2ESPSPI
- (BOOL)isEqual:(id)a3;
- (NEIKEv2ESPSPI)initWithValue:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)value;
@end

@implementation NEIKEv2ESPSPI

- (NEIKEv2ESPSPI)initWithValue:(unsigned int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEIKEv2ESPSPI;
  v4 = -[NEIKEv2SPI init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    v6 = v4;
  }

  else
  {
    ne_log_obj();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%08X",  bswap32(-[NEIKEv2ESPSPI value](self, "value")));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unsigned int v6 = -[NEIKEv2ESPSPI value](self, "value");
    int v7 = [v5 value];

    BOOL v8 = v6 == v7;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NEIKEv2ESPSPI value](self, "value");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NEIKEv2ESPSPI initWithValue:]( +[NEIKEv2ESPSPI allocWithZone:](&OBJC_CLASS___NEIKEv2ESPSPI, "allocWithZone:", a3),  "initWithValue:",  -[NEIKEv2ESPSPI value](self, "value"));
}

- (unsigned)value
{
  return self->_value;
}

@end