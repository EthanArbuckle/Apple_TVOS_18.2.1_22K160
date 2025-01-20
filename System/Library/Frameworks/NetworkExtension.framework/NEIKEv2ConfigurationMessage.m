@interface NEIKEv2ConfigurationMessage
- (NEIKEv2ConfigurationMessage)initWithWithAttributes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
@end

@implementation NEIKEv2ConfigurationMessage

- (NEIKEv2ConfigurationMessage)initWithWithAttributes:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEIKEv2ConfigurationMessage;
  v5 = -[NEIKEv2ConfigurationMessage init](&v12, sel_init);
  v7 = v5;
  if (v5)
  {
    objc_setProperty_atomic(v5, v6, v4, 16LL);
    v8 = v7;
  }

  else
  {
    ne_log_obj();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_1876B1000, v10, OS_LOG_TYPE_FAULT, "[super init] failed", v11, 2u);
    }
  }

  return v7;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = v7;
  if (self)
  {
    unint64_t v9 = self->_configurationType - 1;
    if (v9 < 4)
    {
      v10 = off_18A08CDA8[v9];
      [v7 appendPrettyObject:v10 withName:@"Type" andIndent:v5 options:a4];
      goto LABEL_6;
    }

    id v12 = objc_alloc(NSString);
    unint64_t configurationType = self->_configurationType;
  }

  else
  {
    id v12 = objc_alloc(NSString);
    unint64_t configurationType = 0LL;
  }

  v10 = (__CFString *)objc_msgSend(v12, "initWithFormat:", @"%u", configurationType);
  [v8 appendPrettyObject:v10 withName:@"Type" andIndent:v5 options:a4];
  if (!self)
  {
    id Property = 0LL;
    goto LABEL_7;
  }

- (id)description
{
  return -[NEIKEv2ConfigurationMessage descriptionWithIndent:options:]( self,  "descriptionWithIndent:options:",  0LL,  14LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = (void *)v4;
  if (self)
  {
    unint64_t configurationType = self->_configurationType;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  unint64_t configurationType = 0LL;
  if (v4) {
LABEL_3:
  }
    *(void *)(v4 + 8) = configurationType;
LABEL_4:
  id v8 = objc_alloc(MEMORY[0x189603F18]);
  if (self) {
    id Property = objc_getProperty(self, v7, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v11 = (void *)[v8 initWithArray:Property copyItems:1];
  if (v5) {
    objc_setProperty_atomic(v5, v10, v11, 16LL);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end