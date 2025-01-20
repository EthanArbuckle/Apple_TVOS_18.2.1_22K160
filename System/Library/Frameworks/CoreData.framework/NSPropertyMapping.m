@interface NSPropertyMapping
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)userInfo;
- (NSExpression)valueExpression;
- (NSPropertyMapping)init;
- (NSPropertyMapping)initWithCoder:(id)a3;
- (NSString)name;
- (id)_initWithDestinationName:(id)a3 valueExpression:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_setPropertyTransforms:(void *)result;
- (void)_setTransformValidations:(void *)result;
- (void)_throwIfNotEditable;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(NSString *)name;
- (void)setUserInfo:(NSDictionary *)userInfo;
- (void)setValueExpression:(NSExpression *)valueExpression;
@end

@implementation NSPropertyMapping

+ (void)initialize
{
}

- (NSPropertyMapping)init
{
  return (NSPropertyMapping *)-[NSPropertyMapping _initWithDestinationName:valueExpression:]( self,  "_initWithDestinationName:valueExpression:",  0LL,  0LL);
}

- (void)dealloc
{
  self->_name = 0LL;
  self->_valueExpression = 0LL;

  self->_userInfo = 0LL;
  self->_propertyTransforms = 0LL;

  self->_transformValidations = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPropertyMapping;
  -[NSPropertyMapping dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v4[4] = -[NSString copy](self->_name, "copy");
    v4[5] = -[NSExpression copy](self->_valueExpression, "copy");
    v4[6] = -[NSDictionary copy](self->_userInfo, "copy");
    v4[3] = -[NSArray copy](self->_propertyTransforms, "copy");
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_23;
  }
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v6) = 0;
    return v6;
  }

  v5 = -[NSPropertyMapping name](self, "name");
  uint64_t v6 = [a3 name];
  if (v5 == (NSString *)v6
    || (uint64_t v7 = v6, LOBYTE(v6) = 0, v5) && v7 && (LODWORD(v6) = -[NSString isEqual:](v5, "isEqual:"), (_DWORD)v6))
  {
    v8 = -[NSPropertyMapping valueExpression](self, "valueExpression");
    uint64_t v6 = [a3 valueExpression];
    if (v8 == (NSExpression *)v6
      || (uint64_t v9 = v6, LOBYTE(v6) = 0, v8) && v9 && (LODWORD(v6) = -[NSExpression isEqual:](v8, "isEqual:"), (_DWORD)v6))
    {
      v10 = -[NSPropertyMapping userInfo](self, "userInfo");
      uint64_t v6 = [a3 userInfo];
      if (v10 == (NSDictionary *)v6
        || (uint64_t v11 = v6, LOBYTE(v6) = 0, v10)
        && v11
        && (LODWORD(v6) = -[NSDictionary isEqual:](v10, "isEqual:"), (_DWORD)v6))
      {
        if (self) {
          propertyTransforms = self->_propertyTransforms;
        }
        else {
          propertyTransforms = 0LL;
        }
        v13 = (NSArray *)*((void *)a3 + 3);
        if (propertyTransforms != v13)
        {
          LOBYTE(v6) = 0;
          if (propertyTransforms && v13) {
            LOBYTE(v6) = -[NSArray isEqual:](propertyTransforms, "isEqual:");
          }
          return v6;
        }

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%@), name %@, valueExpression %@, userInfo %@", objc_opt_class(), -[NSPropertyMapping name](self, "name"), -[NSPropertyMapping valueExpression](self, "valueExpression"), -[NSPropertyMapping userInfo](self, "userInfo")];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  v5 = self->_name;
  if (v5 != name)
  {

    self->_name = (NSString *)-[NSString copy](name, "copy");
  }

- (NSExpression)valueExpression
{
  return self->_valueExpression;
}

- (void)setValueExpression:(NSExpression *)valueExpression
{
  v5 = self->_valueExpression;
  if (v5 != valueExpression)
  {

    self->_valueExpression = (NSExpression *)-[NSExpression copy](valueExpression, "copy");
  }

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  v5 = self->_userInfo;
  if (v5 != userInfo)
  {

    self->_userInfo = (NSDictionary *)-[NSDictionary copy](userInfo, "copy");
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self) {
    propertyTransforms = self->_propertyTransforms;
  }
  else {
    propertyTransforms = 0LL;
  }
  [a3 encodeObject:propertyTransforms forKey:@"NSPropertyTransforms"];
}

- (NSPropertyMapping)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSPropertyMapping;
  v4 = -[NSPropertyMapping init](&v9, sel_init);
  if (v4)
  {
    v5 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSDestinationPropertyName"];
    v4->_name = v5;
    if (v5 && (-[NSString isNSString](v5, "isNSString") & 1) == 0)
    {
      objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4866,  &unk_189F03BF8));

      return 0LL;
    }

    else
    {
      uint64_t v6 = (void *)MEMORY[0x189604010];
      uint64_t v7 = objc_opt_class();
      v4->_valueExpression = (NSExpression *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v6,  "setWithObjects:",  v7,  objc_opt_class(),  0),  @"NSValueExpression");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        -[NSExpression allowEvaluation](v4->_valueExpression, "allowEvaluation");
      }
      v4->_userInfo = (NSDictionary *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines plistClassesForSecureCoding]() forKey:@"NSUserInfo"];
      v4->_propertyTransforms = (NSArray *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPropertyTransforms"];
      *(_DWORD *)&v4->_propertyMappingFlags &= ~1u;
    }
  }

  return v4;
}

- (id)_initWithDestinationName:(id)a3 valueExpression:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSPropertyMapping;
  uint64_t v6 = -[NSPropertyMapping init](&v8, sel_init);
  if (v6)
  {
    v6->_name = (NSString *)[a3 copy];
    v6->_valueExpression = (NSExpression *)[a4 copy];
    v6->_userInfo = 0LL;
    *(_DWORD *)&v6->_propertyMappingFlags &= ~1u;
  }

  return v6;
}

- (void)_throwIfNotEditable
{
  if (!self || (*(_BYTE *)&self->_propertyMappingFlags & 1) != 0)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't modify an immutable property mapping." userInfo:0]);
    -[NSPropertyMapping _setPropertyTransforms:](v2, v3);
  }

- (void)_setPropertyTransforms:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    result = (void *)[result _throwIfNotEditable];
    v4 = (void *)v3[3];
    if (v4 != a2)
    {

      result = a2;
      v3[3] = result;
    }
  }

  return result;
}

- (void)_setTransformValidations:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    result = (void *)[result _throwIfNotEditable];
    v4 = (void *)v3[2];
    if (v4 != a2)
    {

      result = a2;
      v3[2] = result;
    }
  }

  return result;
}

@end