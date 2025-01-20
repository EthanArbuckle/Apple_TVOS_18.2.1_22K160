@interface NSPropertyStoreMapping
- (BOOL)isEqual:(id)a3;
- (NSPropertyStoreMapping)initWithProperty:(id)a3;
- (id)description;
- (id)property;
- (void)dealloc;
@end

@implementation NSPropertyStoreMapping

- (NSPropertyStoreMapping)initWithProperty:(id)a3
{
  v5 = +[NSStoreMappingGenerator defaultMappingGenerator]();
  v6 = (void *)[a3 name];
  if (v5) {
    uint64_t v7 = [v6 lowercaseString];
  }
  else {
    uint64_t v7 = 0LL;
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSPropertyStoreMapping;
  result = -[NSStoreMapping initWithExternalName:](&v9, sel_initWithExternalName_, v7);
  if (result) {
    result->_property = (NSPropertyDescription *)a3;
  }
  return result;
}

- (void)dealloc
{
  if (self) {
    self->_property = 0LL;
  }
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NSPropertyStoreMapping;
  -[NSStoreMapping dealloc](&v2, sel_dealloc);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPropertyStoreMapping;
  return (id)[NSString stringWithFormat:@"%@ -> %@", -[NSPropertyStoreMapping description](&v3, sel_description), -[NSPropertyDescription name](self->_property, "name")];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  if (self->_property)
  {
    if (!objc_msgSend( -[NSPropertyStoreMapping property](self, "property"),  "isEqual:",  objc_msgSend(a3, "property"))
      || -[NSStoreMapping externalName](self, "externalName"))
    {
      return objc_msgSend( -[NSStoreMapping externalName](self, "externalName"),  "isEqual:",  objc_msgSend(a3, "externalName"));
    }

    uint64_t v7 = [a3 externalName];
  }

  else
  {
    uint64_t v7 = [a3 property];
  }

  return v7 == 0;
}

- (id)property
{
  return self->_property;
}

@end