@interface OS_mrcs_object
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation OS_mrcs_object

- (void)dealloc
{
  for (i = (void *)self[2]; i; i = (void *)*i)
  {
    v4 = (void (*)(OS_mrcs_object *, SEL))i[5];
    if (v4) {
      v4(self, a2);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___OS_mrcs_object;
  -[OS_mrcs_object dealloc](&v5, "dealloc");
}

- (NSString)description
{
  return (NSString *)(id)_mdns_obj_copy_description_as_cfstring((uint64_t)self);
}

- (NSString)debugDescription
{
  return (NSString *)(id)_mdns_obj_copy_description_as_cfstring((uint64_t)self);
}

- (id)redactedDescription
{
  return (id)(id)_mdns_obj_copy_description_as_cfstring((uint64_t)self);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (OS_mrcs_object *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___OS_mrcs_object);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
      && (OS_mrcs_object v6 = self[2], v6 == *(void *)&v4[2])
      && (v9 = *(uint64_t (**)(OS_mrcs_object *, OS_mrcs_object *))(*(void *)&v6 + 32LL)) != 0LL)
    {
      char v7 = v9(self, v4);
    }

    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

@end