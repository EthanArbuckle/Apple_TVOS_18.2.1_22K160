@interface TKSmartCardATRInterfaceGroup
- (NSNumber)TA;
- (NSNumber)TB;
- (NSNumber)TC;
- (NSNumber)protocol;
- (TKSmartCardATRInterfaceGroup)initWithProtocol:(id)a3;
- (id)description;
- (id)parseWithY:(char *)a3 toProtocol:(id *)a4 fromSource:(id)a5 hasNext:(BOOL *)a6;
@end

@implementation TKSmartCardATRInterfaceGroup

- (NSNumber)TA
{
  return self->_ABC[0];
}

- (NSNumber)TB
{
  return self->_ABC[1];
}

- (NSNumber)TC
{
  return self->_ABC[2];
}

- (TKSmartCardATRInterfaceGroup)initWithProtocol:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKSmartCardATRInterfaceGroup;
  v6 = -[TKSmartCardATRInterfaceGroup init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_protocol, a3);
  }

  return v7;
}

- (id)parseWithY:(char *)a3 toProtocol:(id *)a4 fromSource:(id)a5 hasNext:(BOOL *)a6
{
  v10 = (uint64_t (**)(void))a5;
  for (uint64_t i = 0LL; i != 3; ++i)
  {
    if (((*a3 >> i) & 0x10) != 0)
    {
      uint64_t v12 = v10[2](v10);
      if ((v12 & 0x80000000) != 0) {
        goto LABEL_11;
      }
      uint64_t v13 = [MEMORY[0x189607968] numberWithInt:v12];
      v14 = &(&self->super.isa)[i];
      Class v15 = v14[1];
      v14[1] = (Class)v13;
    }
  }

  if ((*a3 & 0x80000000) == 0)
  {
    id v16 = 0LL;
    *a6 = 0;
    *a3 = 0;
LABEL_10:
    *a4 = v16;
    v18 = self;
    goto LABEL_12;
  }

  *a6 = 1;
  int v17 = v10[2](v10);
  if ((v17 & 0x80000000) == 0)
  {
    *a3 = v17 & 0xF0;
    [MEMORY[0x189607968] numberWithUnsignedLong:1 << (v17 & 0xF)];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_protocol)
  {
    uint64_t v4 = 0LL;
    while ((-[NSNumber unsignedIntegerValue](self->_protocol, "unsignedIntegerValue") & (1 << v4)) == 0)
    {
      uint64_t v4 = (v4 + 1);
      if ((_DWORD)v4 == 16) {
        goto LABEL_7;
      }
    }

    uint64_t v5 = objc_msgSend(MEMORY[0x189607940], "stringWithFormat:", @"T=%d:", v4);

    v3 = (void *)v5;
  }

- (NSNumber)protocol
{
  return self->_protocol;
}

- (void).cxx_destruct
{
  uint64_t v3 = 3LL;
  do
    objc_storeStrong((id *)&(&self->super.isa)[v3--], 0LL);
  while (v3 * 8);
}

@end