@interface _NSPropertyDescriptionProxy
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (Class)class;
- (_NSPropertyDescriptionProxy)initWithCoder:(id)a3;
- (_NSPropertyDescriptionProxy)initWithPropertyDescription:(id)a3;
- (id)_underlyingProperty;
- (id)description;
- (id)entity;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)hash;
- (unsigned)_entitysReferenceID;
- (void)_setEntity:(id)a3;
- (void)_setEntityAndMaintainIndices:(id)a3;
- (void)_setEntitysReferenceID:(unsigned int)a3;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSPropertyDescriptionProxy

- (_NSPropertyDescriptionProxy)initWithPropertyDescription:(id)a3
{
  self->_underlyingProperty = (NSPropertyDescription *)a3;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPropertyDescriptionProxy)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____NSPropertyDescriptionProxy;
  v4 = -[_NSPropertyDescriptionProxy init](&v18, sel_init);
  if (v4)
  {
    v5 = +[PFModelDecoderContext retainedContext](&OBJC_CLASS___PFModelDecoderContext, "retainedContext");
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v15 = __45___NSPropertyDescriptionProxy_initWithCoder___block_invoke;
    v16 = &unk_189EA7758;
    v17 = v5;
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSUnderlyingProperty"];
    v4->_underlyingProperty = (NSPropertyDescription *)v6;
    if (!v6) {
      goto LABEL_11;
    }
    if (v5) {
      v7 = (void *)v5[3];
    }
    else {
      v7 = 0LL;
    }
    [v7 addObject:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0) {
      v9 = &unk_189F03E78;
    }
    else {
      v9 = &unk_189F03E50;
    }
    if ((isKindOfClass & 1 & (v5 != 0LL)) == 0) {
      goto LABEL_18;
    }
    if (v5[1] || v5[2])
    {
LABEL_11:
      v4->_entitysReferenceIDForProperty = [a3 decodeIntegerForKey:@"NSReferenceID"];
      uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSEntityDescription"];
      v4->_entityDescription = (NSEntityDescription *)v10;
      if (!v10)
      {
LABEL_19:
        v15((uint64_t)v14);
        return v4;
      }

      if (v5) {
        v11 = (void *)v5[3];
      }
      else {
        v11 = 0LL;
      }
      [v11 addObject:v10];
      objc_opt_class();
      char v12 = objc_opt_isKindOfClass();
      if ((v12 & 1) != 0) {
        v9 = &unk_189F03EC8;
      }
      else {
        v9 = &unk_189F03EA0;
      }
      if (v5 != 0LL && (v12 & 1) != 0)
      {
        if (v5[1] || v5[2]) {
          goto LABEL_19;
        }
        v9 = &unk_189F03EC8;
      }
    }

    else
    {
      v9 = &unk_189F03E78;
    }

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Proxy for prop named %@ on ed %@, real %@", -[NSPropertyDescription name](self->_underlyingProperty, "name"), -[NSEntityDescription name](self->_entityDescription, "name"), self->_underlyingProperty];
}

- (id)_underlyingProperty
{
  return self->_underlyingProperty;
}

- (void)_setEntitysReferenceID:(unsigned int)a3
{
  self->_entitysReferenceIDForProperty = a3;
}

- (unsigned)_entitysReferenceID
{
  return self->_entitysReferenceIDForProperty;
}

- (id)entity
{
  return self->_entityDescription;
}

- (void)_setEntity:(id)a3
{
  self->_entityDescription = (NSEntityDescription *)a3;
}

- (void)_setEntityAndMaintainIndices:(id)a3
{
  self->_entityDescription = (NSEntityDescription *)a3;
}

- (BOOL)isKindOfClass:(Class)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  unint64_t v7 = -[NSPropertyDescription _propertyType](self->_underlyingProperty, "_propertyType");
  underlyingProperty = self->_underlyingProperty;
  if (v7 == 4) {
    -[NSPropertyDescription _versionHash:inStyle:proxyContext:]( underlyingProperty,  "_versionHash:inStyle:proxyContext:",  a3,  a4,  self);
  }
  else {
    -[NSPropertyDescription _versionHash:inStyle:](underlyingProperty, "_versionHash:inStyle:", a3, a4);
  }
}

- (Class)class
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  return -[NSPropertyDescription isEqual:](self->_underlyingProperty, "isEqual:", a3);
}

- (unint64_t)hash
{
  return -[NSPropertyDescription hash](self->_underlyingProperty, "hash");
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_underlyingProperty;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[NSPropertyDescription methodSignatureForSelector:]( self->_underlyingProperty,  "methodSignatureForSelector:",  a3);
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  v5 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v5, a3);
  if (InstanceMethod
    || (unint64_t v7 = (objc_class *)objc_opt_class(),
        TypeEncoding = (char *)class_getInstanceMethod(v7, a3),
        (InstanceMethod = (objc_method *)TypeEncoding) != 0LL))
  {
    TypeEncoding = (char *)method_getTypeEncoding(InstanceMethod);
    if (TypeEncoding)
    {
      v9 = TypeEncoding;
      if (method_getNumberOfArguments(InstanceMethod) == 2)
      {
        LOBYTE(TypeEncoding) = 0;
        int v10 = *v9;
        if (v10 <= 98)
        {
          if (v10 == 64)
          {
            v11 = (id (*)(id, SEL, ...))returnIdThing1;
            goto LABEL_15;
          }

          if (v10 != 81) {
            return (char)TypeEncoding;
          }
LABEL_12:
          v11 = (id (*)(id, SEL, ...))returnUIntegerThing1;
LABEL_15:
          class_addMethod((Class)a1, a3, v11, v9);
          LOBYTE(TypeEncoding) = 1;
          return (char)TypeEncoding;
        }

        if (v10 == 99)
        {
          v11 = (id (*)(id, SEL, ...))returnBoolThing1;
          goto LABEL_15;
        }

        if (v10 == 113) {
          goto LABEL_12;
        }
      }

      else
      {
        LOBYTE(TypeEncoding) = 0;
      }
    }
  }

  return (char)TypeEncoding;
}

@end