@interface NSFetchIndexElementDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isAscending;
- (BOOL)isEqual:(id)a3;
- (NSFetchIndexDescription)indexDescription;
- (NSFetchIndexElementDescription)_validateCollationType:(void *)a3 forProperty:;
- (NSFetchIndexElementDescription)initWithCoder:(id)a3;
- (NSFetchIndexElementDescription)initWithProperty:(NSPropertyDescription *)property collationType:(NSFetchIndexElementType)collationType;
- (NSFetchIndexElementType)collationType;
- (NSPropertyDescription)_throwIfNotEditable;
- (NSPropertyDescription)property;
- (NSString)propertyName;
- (_DWORD)initWithPropertyName:(uint64_t)a3 collationType:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_setIndexDescription:(uint64_t)a1;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initWithPropertyName:(void *)a3 property:(uint64_t)a4 collationType:(int)a5 ascending:;
- (void)setAscending:(BOOL)ascending;
- (void)setCollationType:(NSFetchIndexElementType)collationType;
@end

@implementation NSFetchIndexElementDescription

- (NSFetchIndexElementDescription)_validateCollationType:(void *)a3 forProperty:
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (result && a2 == 1)
  {
    if ([a3 _propertyType] == 2 || objc_msgSend(a3, "_propertyType") == 6)
    {
      result = (NSFetchIndexElementDescription *)[a3 attributeType];
      if (result == (NSFetchIndexElementDescription *)100
        || result == (NSFetchIndexElementDescription *)200
        || result == (NSFetchIndexElementDescription *)600)
      {
        return result;
      }

      v4 = (void *)MEMORY[0x189603F70];
      uint64_t v5 = *MEMORY[0x189603A60];
      v12 = @"property";
      v13 = a3;
      uint64_t v6 = [MEMORY[0x189603F68] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      v7 = @"Invalid collation type (rtree indexes can only be created for floats or integers < 32 bit).";
    }

    else
    {
      v4 = (void *)MEMORY[0x189603F70];
      uint64_t v5 = *MEMORY[0x189603A60];
      v14 = @"property";
      v15[0] = a3;
      uint64_t v6 = [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v7 = @"Invalid collation type (rtree indexes can only be created on attributes).";
    }

    objc_exception_throw((id)[v4 exceptionWithName:v5 reason:v7 userInfo:v6]);
    return -[NSFetchIndexElementDescription initWithProperty:collationType:](v8, v9, v10, v11);
  }

  return result;
}

- (NSFetchIndexElementDescription)initWithProperty:(NSPropertyDescription *)property collationType:(NSFetchIndexElementType)collationType
{
  if (!property)
  {

    NSFetchIndexElementType v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    v13 = @"Can't create an index element without a property";
    goto LABEL_17;
  }

  if (!-[NSPropertyDescription name](property, "name"))
  {

    NSFetchIndexElementType v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    v13 = @"Can't create an index element with an unnamed property";
    goto LABEL_17;
  }

  unint64_t v7 = -[NSPropertyDescription _propertyType](property, "_propertyType");
  if (v7 - 4 >= 3 && v7 != 2)
  {
    if (v7 == 7)
    {

      NSFetchIndexElementType v11 = (void *)MEMORY[0x189603F70];
      uint64_t v12 = *MEMORY[0x189603A60];
      v13 = @"Can't create an index element with composite property";
    }

    else
    {

      NSFetchIndexElementType v11 = (void *)MEMORY[0x189603F70];
      uint64_t v12 = *MEMORY[0x189603A60];
      v13 = @"Can't create an index element with non-attribute property";
    }

- (_DWORD)initWithPropertyName:(uint64_t)a3 collationType:
{
  if (!a1) {
    return 0LL;
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_CLASS___NSFetchIndexElementDescription;
  uint64_t v5 = objc_msgSendSuper2(&v9, sel_init);
  if (v5)
  {
    id v6 = a2;
    int v7 = v5[10];
    *((void *)v5 + 2) = v6;
    *((void *)v5 + 3) = a3;
    v5[10] = v7 & 0xFFFFFFFC | 1;
  }

  return v5;
}

- (void)initWithPropertyName:(void *)a3 property:(uint64_t)a4 collationType:(int)a5 ascending:
{
  if (!a1) {
    return 0LL;
  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_CLASS___NSFetchIndexElementDescription;
  objc_super v9 = objc_msgSendSuper2(&v12, sel_init);
  if (v9)
  {
    v9[2] = a2;
    if (a3 && [a3 _propertyType] == 5)
    {
      v9[1] = a3;
      unsigned int v10 = *((_DWORD *)v9 + 10) | 2;
    }

    else
    {
      v9[1] = 0LL;
      unsigned int v10 = v9[5] & 0xFFFFFFFD;
    }

    v9[3] = a4;
    *((_DWORD *)v9 + 10) = v10 & 0xFFFFFFFE | a5;
  }

  return v9;
}

- (void)dealloc
{
  self->_propertyName = 0LL;
  if ((*(_BYTE *)&self->_indexElementDescriptionFlags & 2) != 0)
  {

    self->_property = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFetchIndexElementDescription;
  -[NSFetchIndexElementDescription dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  if (-[NSPropertyDescription _propertyType](self->_property, "_propertyType") == 5) {
    [a3 encodeObject:self->_property forKey:@"NSIndexedProperty"];
  }
  [a3 encodeInteger:self->_collationType forKey:@"NSFetchIndexElementType"];
  [a3 encodeObject:self->_indexDescription forKey:@"NSFetchIndexDescription"];
  [a3 encodeBool:*(_DWORD *)&self->_indexElementDescriptionFlags & 1 forKey:@"NSAscending"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFetchIndexElementDescription)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSFetchIndexElementDescription;
  v4 = -[NSFetchIndexElementDescription init](&v19, sel_init);
  if (v4)
  {
    uint64_t v5 = +[PFModelDecoderContext retainedContext](&OBJC_CLASS___PFModelDecoderContext, "retainedContext");
    uint64_t v14 = MEMORY[0x1895F87A8];
    uint64_t v15 = 3221225472LL;
    objc_super v16 = __48__NSFetchIndexElementDescription_initWithCoder___block_invoke;
    v17 = &unk_189EA7758;
    v18 = v5;
    id v6 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPropertyName"];
    v4->_propertyName = v6;
    if (v6 && (-[NSString isNSString](v6, "isNSString") & 1) == 0)
    {
      unsigned int v10 = &unk_189F03F40;
    }

    else
    {
      uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSFetchIndexDescription"];
      v4->_indexDescription = (NSFetchIndexDescription *)v7;
      if (!v7)
      {
LABEL_13:
        NSFetchIndexElementType v11 = (void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(MEMORY[0x189604010], "setWithObjects:", objc_opt_class(), 0, v14, v15),  @"NSIndexedProperty");
        if (!v11) {
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ([v11 _propertyType] == 5 || !v4->_indexDescription)
          {
            v4->_property = (NSPropertyDescription *)v11;
            unsigned int v12 = *(_DWORD *)&v4->_indexElementDescriptionFlags | 2;
            goto LABEL_23;
          }

void __48__NSFetchIndexElementDescription_initWithCoder___block_invoke(uint64_t a1)
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)(v4 + 32) = 0LL;
    *(void *)(v4 + 16) = -[NSString copy](self->_propertyName, "copy");
    if (-[NSPropertyDescription _propertyType](self->_property, "_propertyType") == 5) {
      id v6 = (NSPropertyDescription *)-[NSPropertyDescription copy](self->_property, "copy");
    }
    else {
      id v6 = -[NSFetchIndexElementDescription property](self, "property");
    }
    *(void *)(v5 + 8) = v6;
    int v7 = *(_DWORD *)(v5 + 40) | 2;
    *(_DWORD *)(v5 + 40) = v7;
    *(void *)(v5 + 24) = self->_collationType;
    *(_DWORD *)(v5 + 40) = v7 & 0xFFFFFFFE | *(_DWORD *)&self->_indexElementDescriptionFlags & 1;
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v13) = 1;
  }

  else
  {
    uint64_t v19 = v5;
    uint64_t v20 = v4;
    uint64_t v21 = v3;
    if (a3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (unint64_t collationType = self->_collationType, collationType == [a3 collationType])
      && (int v12 = -[NSFetchIndexElementDescription isAscending](self, "isAscending"),
          v12 == [a3 isAscending]))
    {
      propertyName = self->_propertyName;
      uint64_t v13 = [a3 propertyName];
      if (propertyName == (NSString *)v13
        || (uint64_t v15 = v13, LOBYTE(v13) = 0, propertyName)
        && v15
        && (LODWORD(v13) = -[NSString isEqual:](propertyName, "isEqual:"), (_DWORD)v13))
      {
        if (-[NSPropertyDescription _propertyType](self->_property, "_propertyType", v6, v19, v20, v21, v7, v8) != 5
          || (property = self->_property, uint64_t v13 = [a3 property], property == (NSPropertyDescription *)v13)
          || (uint64_t v17 = v13, LOBYTE(v13) = 0, property)
          && v17
          && (LODWORD(v13) = -[NSPropertyDescription isEqual:](property, "isEqual:"), (_DWORD)v13))
        {
          LOBYTE(v13) = 1;
        }
      }
    }

    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_propertyName, "hash");
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  propertyName = self->_propertyName;
  if (-[NSPropertyDescription _propertyType](self->_property, "_propertyType") == 5) {
    property = self->_property;
  }
  else {
    property = (NSPropertyDescription *)@"modeled property";
  }
  unint64_t collationType = self->_collationType;
  BOOL v7 = -[NSFetchIndexElementDescription isAscending](self, "isAscending");
  uint64_t v8 = @"descending";
  if (v7) {
    uint64_t v8 = @"ascending";
  }
  return (id)[v3 stringWithFormat:@"<NSFetchIndexElementDescription : (%@ (%@), %d, %@)>", propertyName, property, collationType, v8];
}

- (NSPropertyDescription)_throwIfNotEditable
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    v1 = result;
    v2 = (void *)-[NSPropertyDescription property](result, "property");
    if (!v2 && v1->_versionHash)
    {
      uint64_t v3 = *MEMORY[0x189603A58];
      uint64_t v6 = @"offender";
      v7[0] = v1;
      objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v3,  @"Broken logic around index elements",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1)));
      return -[NSFetchIndexElementDescription property](v4, v5);
    }

    else
    {
      return (NSPropertyDescription *)[v2 _throwIfNotEditable];
    }
  }

  return result;
}

- (NSPropertyDescription)property
{
  property = self->_property;
  if (!property)
  {
    indexDescription = self->_indexDescription;
    if (indexDescription)
    {
      uint64_t v6 = -[NSFetchIndexDescription entity](indexDescription, "entity");
      if (v6) {
        property = (NSPropertyDescription *)[*(id *)(v6 + 96) objectForKey:self->_propertyName];
      }
      else {
        property = 0LL;
      }
      if (!-[NSPropertyDescription _isEditable](property, "_isEditable"))
      {
        __indexElementDescriptionFlags indexElementDescriptionFlags = self->_indexElementDescriptionFlags;
        if ((*(_BYTE *)&indexElementDescriptionFlags & 2) != 0)
        {

          __indexElementDescriptionFlags indexElementDescriptionFlags = self->_indexElementDescriptionFlags;
        }

        self->_property = property;
        self->___indexElementDescriptionFlags indexElementDescriptionFlags = (__indexElementDescriptionFlags)(*(_DWORD *)&indexElementDescriptionFlags & 0xFFFFFFFD);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return property;
}

- (NSFetchIndexElementType)collationType
{
  return self->_collationType;
}

- (void)setCollationType:(NSFetchIndexElementType)collationType
{
  if (self->_collationType != collationType)
  {
    -[NSFetchIndexElementDescription _validateCollationType:forProperty:](self, collationType, self->_property);
    -[NSFetchIndexDescription _validateCollationTypeChangeFrom:to:]( (unint64_t)self->_indexDescription,  self->_collationType,  collationType);
    self->_unint64_t collationType = collationType;
  }

- (BOOL)isAscending
{
  return *(_DWORD *)&self->_indexElementDescriptionFlags & 1;
}

- (void)setAscending:(BOOL)ascending
{
  BOOL v3 = ascending;
  -[NSFetchIndexElementDescription _throwIfNotEditable]((NSPropertyDescription *)self);
  self->___indexElementDescriptionFlags indexElementDescriptionFlags = (__indexElementDescriptionFlags)(*(_DWORD *)&self->_indexElementDescriptionFlags & 0xFFFFFFFE | v3);
}

- (NSFetchIndexDescription)indexDescription
{
  return self->_indexDescription;
}

- (void)_setIndexDescription:(uint64_t)a1
{
  if (a1)
  {
    if (!a2 || *(void *)(a1 + 32) || [*(id *)(a1 + 8) _propertyType] == 5) {
      goto LABEL_10;
    }
    if ([a2 entity])
    {

      *(void *)(a1 + 8) = 0LL;
      unsigned int v4 = *(_DWORD *)(a1 + 40) & 0xFFFFFFFD;
    }

    else
    {
      if ((*(_BYTE *)(a1 + 40) & 2) != 0)
      {
LABEL_10:
        *(void *)(a1 + 32) = a2;
        return;
      }

      id v5 = *(id *)(a1 + 8);
      unsigned int v4 = *(_DWORD *)(a1 + 40) | 2;
    }

    *(_DWORD *)(a1 + 40) = v4;
    goto LABEL_10;
  }

- (NSString)propertyName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

@end