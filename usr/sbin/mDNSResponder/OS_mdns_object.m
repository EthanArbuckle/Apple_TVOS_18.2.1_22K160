@interface OS_mdns_object
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation OS_mdns_object

- (void)dealloc
{
  for (i = (void *)self[2]; i; i = (void *)*i)
  {
    v4 = (void (*)(OS_mdns_object *, SEL))i[5];
    if (v4) {
      v4(self, a2);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___OS_mdns_object;
  -[OS_mdns_object dealloc](&v5, "dealloc");
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
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___OS_mdns_object);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0
    && (OS_mdns_object v6 = self[2], v6 == *((void *)a3 + 2))
    && (v8 = *(uint64_t (**)(OS_mdns_object *, id))(*(void *)&v6 + 32LL)) != 0LL)
  {
    return v8(self, a3);
  }

  else
  {
    return 0;
  }

@end