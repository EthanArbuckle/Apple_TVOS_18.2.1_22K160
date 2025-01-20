@interface NSSQLProperty
- (BOOL)isConstrained;
- (BOOL)isEqual:(id)a3;
- (BOOL)isToMany;
- (NSSQLProperty)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)columnName;
- (id)description;
- (id)entity;
- (id)name;
- (id)propertyDescription;
- (unsigned)propertyType;
- (unsigned)slot;
- (unsigned)sqlType;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
- (void)setConstrained:(BOOL)a3;
@end

@implementation NSSQLProperty

- (unsigned)propertyType
{
  return self->_propertyType;
}

- (id)propertyDescription
{
  return self->_propertyDescription;
}

- (BOOL)isToMany
{
  return self->_propertyType == 8;
}

- (NSSQLProperty)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSSQLProperty;
  v6 = -[NSSQLProperty init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_propertyDescription = (NSPropertyDescription *)a4;
    v6->_entity = (NSSQLEntity *)a3;
    if (a4)
    {
      if (-[NSEntityDescription _hasUniquedProperty:]([a3 entityDescription], a4))
      {
        *(_WORD *)&v7->_flags |= 6u;
        if (a3)
        {
          v8 = (void *)[a3 rootEntity];
          if (v8) {
            v8 = (void *)v8[26];
          }
          [v8 addObject:v7];
        }
      }
    }
  }

  return v7;
}

- (void)dealloc
{
  self->_propertyDescription = 0LL;
  self->_entity = 0LL;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NSSQLProperty;
  -[NSSQLProperty dealloc](&v2, sel_dealloc);
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  self->_propertyDescription = (NSPropertyDescription *)[a3 propertyDescription];
  self->_propertyType = [a3 propertyType];
}

- (id)name
{
  return -[NSPropertyDescription name](self->_propertyDescription, "name");
}

- (id)columnName
{
  return 0LL;
}

- (unsigned)sqlType
{
  return self->_sqlType;
}

- (BOOL)isConstrained
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)setConstrained:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }

  else
  {
    uint64_t v11 = v3;
    uint64_t v12 = v4;
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___NSSQLProperty;
    BOOL v7 = -[NSSQLProperty isEqual:](&v10, sel_isEqual_);
    if (v7)
    {
      id v8 = -[NSSQLProperty propertyDescription](self, "propertyDescription");
      LOBYTE(v7) = v8 == (id)[a3 propertyDescription];
    }
  }

  return v7;
}

- (id)entity
{
  return self->_entity;
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = -[NSSQLProperty name](self, "name");
  if (self) {
    id v7 = -[NSSQLProperty columnName](self, "columnName");
  }
  else {
    id v7 = 0LL;
  }
  return (id)[v3 stringWithFormat:@"<%@ %@ (%@)>", v5, v6, v7];
}

- (unsigned)slot
{
  return -1;
}

@end