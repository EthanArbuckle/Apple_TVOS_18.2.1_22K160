@interface NSFetchIndexDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEditable;
- (BOOL)isEqual:(id)a3;
- (NSArray)elements;
- (NSEntityDescription)entity;
- (NSFetchIndexDescription)initWithCoder:(id)a3;
- (NSFetchIndexDescription)initWithName:(NSString *)name elements:(NSArray *)elements;
- (NSFetchIndexDescription)initWithName:(id)a3 predicate:(id)a4 elements:(id)a5 entity:(id)a6;
- (NSPredicate)partialIndexPredicate;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_compare:(id)a3;
- (uint64_t)_checkElements:(uint64_t)result;
- (uint64_t)_compoundIndexRepresentation;
- (uint64_t)_isIndexForProperty:(uint64_t)a1;
- (uint64_t)_isMappedSinglePropertyIndex;
- (uint64_t)_isPurelyModeledIndex;
- (uint64_t)_isUnique;
- (uint64_t)_setIsUnique:(uint64_t)result;
- (unint64_t)_validateCollationTypeChangeFrom:(uint64_t)a3 to:;
- (unint64_t)hash;
- (void)_setEntity:(id)a3;
- (void)_throwIfNotEditable;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setElements:(NSArray *)elements;
- (void)setName:(NSString *)name;
- (void)setPartialIndexPredicate:(NSPredicate *)partialIndexPredicate;
@end

@implementation NSFetchIndexDescription

- (uint64_t)_checkElements:(uint64_t)result
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = [a2 count] ? objc_msgSend((id)objc_msgSend(a2, "firstObject"), "collationType") : 0;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    result = [a2 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v19;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v19 != v5) {
            objc_enumerationMutation(a2);
          }
          v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
          v8 = (void *)[v7 property];
          if (v8)
          {
            v9 = v8;
            uint64_t v10 = [v8 _propertyType];
            if ((unint64_t)(v10 - 4) >= 3 && v10 != 2)
            {
              v12 = (void *)MEMORY[0x189603F70];
              uint64_t v13 = *MEMORY[0x189603A60];
              v22 = @"Property";
              v23 = v9;
              uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
              v15 = @"Unsupported property type for index.";
              v16 = v12;
              uint64_t v17 = v13;
              goto LABEL_21;
            }

            if (v3 != [v7 collationType])
            {
              v16 = (void *)MEMORY[0x189603F70];
              uint64_t v17 = *MEMORY[0x189603A60];
              v15 = @"Can't mix and match collation types.";
              uint64_t v14 = 0LL;
LABEL_21:
              objc_exception_throw((id)[v16 exceptionWithName:v17 reason:v15 userInfo:v14]);
            }
          }

          ++v6;
        }

        while (v4 != v6);
        result = [a2 countByEnumeratingWithState:&v18 objects:v24 count:16];
        uint64_t v4 = result;
      }

      while (result);
    }
  }

  return result;
}

- (NSFetchIndexDescription)initWithName:(NSString *)name elements:(NSArray *)elements
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!name)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't create an index with no name" userInfo:0]);
  }

  -[NSFetchIndexDescription _checkElements:]((uint64_t)self, elements);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NSFetchIndexDescription;
  v7 = -[NSFetchIndexDescription init](&v16, sel_init);
  if (v7)
  {
    v7->_name = name;
    v7->_elements = (NSArray *)-[NSArray copy](elements, "copy");
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v12,  v17,  16LL);
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(elements);
          }
          -[NSFetchIndexElementDescription _setIndexDescription:](*(void *)(*((void *)&v12 + 1) + 8 * v10++), v7);
        }

        while (v8 != v10);
        uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v12,  v17,  16LL);
      }

      while (v8);
    }
  }

  return v7;
}

- (NSFetchIndexDescription)initWithName:(id)a3 predicate:(id)a4 elements:(id)a5 entity:(id)a6
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSFetchIndexDescription;
  uint64_t v10 = -[NSFetchIndexDescription init](&v21, sel_init);
  if (v10)
  {
    v10->_name = (NSString *)a3;
    v10->_elements = (NSArray *)[a5 copy];
    v11 = (NSPredicate *)a4;
    v10->_entity = (NSEntityDescription *)a6;
    v10->_partialIndexPredicate = v11;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v12 = [a5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(a5);
          }
          -[NSFetchIndexElementDescription _setIndexDescription:](*(void *)(*((void *)&v17 + 1) + 8 * v15++), v10);
        }

        while (v13 != v15);
        uint64_t v13 = [a5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v13);
    }
  }

  return v10;
}

- (void)dealloc
{
  self->_elements = 0LL;
  self->_name = 0LL;

  self->_entity = 0LL;
  self->_partialIndexPredicate = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFetchIndexDescription;
  -[NSFetchIndexDescription dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v4[1] = -[NSString copy](self->_name, "copy");
    v4[3] = self->_entity;
    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    elements = self->_elements;
    uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(elements);
          }
          v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) copy];
          [v5 addObject:v11];
          -[NSFetchIndexElementDescription _setIndexDescription:]((uint64_t)v11, v4);
        }

        uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v8);
    }

    v4[2] = v5;
    v4[4] = -[NSPredicate copy](self->_partialIndexPredicate, "copy");
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFetchIndexDescription)initWithCoder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___NSFetchIndexDescription;
  uint64_t v4 = -[NSFetchIndexDescription init](&v35, sel_init);
  if (v4)
  {
    id v5 = +[PFModelDecoderContext retainedContext](&OBJC_CLASS___PFModelDecoderContext, "retainedContext");
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v32 = __41__NSFetchIndexDescription_initWithCoder___block_invoke;
    v33 = &unk_189EA7758;
    v34 = v5;
    uint64_t v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = (NSString *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0),  @"NSIndexName");
    v4->_name = v8;
    if (v8 && (-[NSString isNSString](v8, "isNSString") & 1) == 0)
    {
      v22 = &unk_189F03900;
      goto LABEL_28;
    }

    uint64_t v9 = (void *)MEMORY[0x189604010];
    uint64_t v10 = objc_opt_class();
    unint64_t v11 = 0x189603000uLL;
    uint64_t v12 = objc_opt_class();
    __int128 v13 = (NSArray *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v9, "setWithObjects:", v10, v12, objc_opt_class(), 0),  @"NSIndexElements");
    v4->_elements = v13;
    if (v13)
    {
      if (!-[NSArray isNSArray](v13, "isNSArray"))
      {
        v22 = &unk_189F03928;
        goto LABEL_28;
      }

      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      elements = v4->_elements;
      uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v27,  v36,  16LL);
      if (v15)
      {
        uint64_t v16 = *(void *)v28;
        while (2)
        {
          unint64_t v17 = v11;
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(elements);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4866,  &unk_189F03950));

              goto LABEL_29;
            }
          }

          uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v27,  v36,  16LL);
          unint64_t v11 = v17;
          if (v15) {
            continue;
          }
          break;
        }
      }
    }

    uint64_t v19 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSEntity"];
    v4->_entity = (NSEntityDescription *)v19;
    if (!v19) {
      goto LABEL_23;
    }
    if (v5) {
      __int128 v20 = (void *)v5[3];
    }
    else {
      __int128 v20 = 0LL;
    }
    [v20 addObject:v19];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0) {
      v22 = &unk_189F039A0;
    }
    else {
      v22 = &unk_189F03978;
    }
    if (v5 != 0LL && (isKindOfClass & 1) != 0)
    {
      if (v5[2] || v5[1])
      {
LABEL_23:
        uint64_t v23 = (void *)MEMORY[0x189604010];
        uint64_t v24 = objc_opt_class();
        v4->_partialIndexPredicate = (NSPredicate *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v23,  "setWithObjects:",  v24,  objc_opt_class(),  0),  @"NSPartialIndexPredicate");
        if (v5) {
          uint64_t v25 = (void *)v5[3];
        }
        else {
          uint64_t v25 = 0LL;
        }
        [v25 addObject:v4];
LABEL_30:
        v32((uint64_t)v31);
        return v4;
      }

      v22 = &unk_189F039A0;
    }

void __41__NSFetchIndexDescription_initWithCoder___block_invoke(uint64_t a1)
{
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_21;
  }
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v6) = 0;
    return v6;
  }

  name = self->_name;
  uint64_t v6 = [a3 name];
  if (name == (NSString *)v6
    || (uint64_t v7 = v6, LOBYTE(v6) = 0, name) && v7 && (LODWORD(v6) = -[NSString isEqual:](name, "isEqual:"), (_DWORD)v6))
  {
    uint64_t v8 = -[NSEntityDescription name](self->_entity, "name");
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "entity"), "name");
    if (v8 == (NSString *)v6
      || (uint64_t v9 = v6, LOBYTE(v6) = 0, v8) && v9 && (LODWORD(v6) = -[NSString isEqual:](v8, "isEqual:"), (_DWORD)v6))
    {
      elements = self->_elements;
      uint64_t v6 = [a3 elements];
      if (elements == (NSArray *)v6
        || (uint64_t v11 = v6, LOBYTE(v6) = 0, elements)
        && v11
        && (LODWORD(v6) = -[NSArray isEqual:](elements, "isEqual:"), (_DWORD)v6))
      {
        partialIndexPredicate = self->_partialIndexPredicate;
        uint64_t v6 = [a3 partialIndexPredicate];
        if (partialIndexPredicate != (NSPredicate *)v6)
        {
          uint64_t v13 = v6;
          LOBYTE(v6) = 0;
          if (partialIndexPredicate && v13) {
            LOBYTE(v6) = -[NSPredicate isEqual:](partialIndexPredicate, "isEqual:");
          }
          return v6;
        }

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSFetchIndexDescription : (%@:%@, elements: %@, predicate: %@)>", -[NSEntityDescription name](self->_entity, "name"), self->_name, self->_elements, self->_partialIndexPredicate];
}

- (BOOL)_isEditable
{
  entity = self->_entity;
  return !entity || -[NSEntityDescription _isEditable](entity, "_isEditable");
}

- (void)_throwIfNotEditable
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  v10[1] = *MEMORY[0x1895F89C0];
  -[NSFetchIndexDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (!name)
  {
    uint64_t v8 = *MEMORY[0x189603A60];
    uint64_t v9 = @"IndexDescription";
    v10[0] = self;
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v8,  @"Can't set an index name to nil",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }

  if ((-[NSString isEqual:](self->_name, "isEqual:", name) & 1) == 0)
  {
    entity = self->_entity;
    if (entity)
    {
      if ((*(_BYTE *)&entity->_entityDescriptionFlags & 4) != 0)
      {
        uint64_t rootentity = (uint64_t)entity->_rootentity;
      }

      else
      {
        do
        {
          uint64_t rootentity = (uint64_t)entity;
          entity = -[NSEntityDescription superentity](entity, "superentity");
        }

        while (entity);
      }
    }

    else
    {
      uint64_t rootentity = 0LL;
    }

    -[NSEntityDescription _validateIndexNameChangeFrom:to:](rootentity, self->_name, (uint64_t)name);
    uint64_t v7 = name;

    self->_name = name;
  }

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(NSArray *)elements
{
  id v5 = (NSArray *)-[NSArray copy](elements, "copy");

  self->_elements = v5;
}

- (NSEntityDescription)entity
{
  return self->_entity;
}

- (void)_setEntity:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  self->_entity = (NSEntityDescription *)a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  elements = self->_elements;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(elements);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        -[NSFetchIndexElementDescription _setIndexDescription:]((uint64_t)v9, self);
        [v9 property];
      }

      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

- (NSPredicate)partialIndexPredicate
{
  return self->_partialIndexPredicate;
}

- (void)setPartialIndexPredicate:(NSPredicate *)partialIndexPredicate
{
  if (self->_partialIndexPredicate != partialIndexPredicate)
  {
    uint64_t v5 = partialIndexPredicate;

    self->_partialIndexPredicate = partialIndexPredicate;
  }

- (unint64_t)_validateCollationTypeChangeFrom:(uint64_t)a3 to:
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    unint64_t v5 = result;
    result = [*(id *)(result + 16) count];
    if (a2 != a3 && result <= 1)
    {
      uint64_t v6 = *MEMORY[0x189603A60];
      uint64_t v7 = @"Index";
      v8[0] = v5;
      objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v6,  @"Can't change an collation type in a multi-element index",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1)));
    }
  }

  return result;
}

- (uint64_t)_isPurelyModeledIndex
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (result)
  {
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    v1 = *(void **)(result + 16);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v7;
      while (2)
      {
        for (uint64_t i = 0LL; i != v3; ++i)
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * i), "property"), "_propertyType") == 5) {
            return 0LL;
          }
        }

        uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }

    return 1LL;
  }

  return result;
}

- (uint64_t)_isIndexForProperty:(uint64_t)a1
{
  if (a1
    && [*(id *)(a1 + 16) count] == 1
    && (uint64_t v4 = (void *)[*(id *)(a1 + 16) firstObject],
        objc_msgSend( (id)objc_msgSend(a2, "name"),  "isEqualToString:",  objc_msgSend((id)objc_msgSend(v4, "property"), "name")))
    && ![v4 collationType])
  {
    return [v4 isAscending];
  }

  else
  {
    return 0LL;
  }

- (uint64_t)_isMappedSinglePropertyIndex
{
  if (a1
    && [*(id *)(a1 + 16) count] == 1
    && (uint64_t v2 = (void *)[*(id *)(a1 + 16) firstObject], !objc_msgSend(v2, "collationType")))
  {
    return [v2 isAscending];
  }

  else
  {
    return 0LL;
  }

- (uint64_t)_compoundIndexRepresentation
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (!a1
    || ![*(id *)(a1 + 16) count]
    || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "firstObject"), "collationType")
    || [*(id *)(a1 + 16) count] == 1)
  {
    return 0LL;
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v4 = *(void **)(a1 + 16);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) property];
        uint64_t v10 = [v9 _propertyType];
        if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 2
          && (v10 != 5
           || !+[_PFRoutines _expressionIsCompoundIndexCompatible:]( (uint64_t)_PFRoutines,  (void *)[v9 expression])))
        {
          return 0LL;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v6);
  }

  uint64_t v2 = [MEMORY[0x189603FA8] array];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v11 = *(void **)(a1 + 16);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (!v12) {
    return v2;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v24;
  do
  {
    uint64_t v15 = 0LL;
    do
    {
      if (*(void *)v24 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v15) property];
      uint64_t v17 = [v16 _propertyType];
      if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 2)
      {
        uint64_t v18 = [v16 name];
        goto LABEL_24;
      }

      if (v17 == 5
        && +[_PFRoutines _expressionIsCompoundIndexCompatible:]( (uint64_t)_PFRoutines,  (void *)[v16 expression]))
      {
        uint64_t v21 = objc_msgSend((id)objc_msgSend(v16, "expression"), "expressionType");
        if (v21 == 3)
        {
          uint64_t v18 = objc_msgSend((id)objc_msgSend(v16, "expression"), "keyPath");
LABEL_24:
          uint64_t v19 = (const __CFString *)v18;
          __int128 v20 = (void *)v2;
LABEL_25:
          [v20 addObject:v19];
          goto LABEL_31;
        }

        if (v21 == 1)
        {
          __int128 v20 = (void *)v2;
          uint64_t v19 = @"self";
          goto LABEL_25;
        }
      }

- (uint64_t)_isUnique
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (result)
  {
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    v1 = *(void **)(result + 16);
    result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v7;
      while (2)
      {
        uint64_t v4 = 0LL;
        do
        {
          if (*(void *)v7 != v3) {
            objc_enumerationMutation(v1);
          }
          uint64_t v5 = *(void *)(*((void *)&v6 + 1) + 8 * v4);
          if (v5 && (*(_BYTE *)(v5 + 40) & 4) != 0) {
            return 1LL;
          }
          ++v4;
        }

        while (v2 != v4);
        result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v2 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }

  return result;
}

- (uint64_t)_setIsUnique:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (result)
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    uint64_t v3 = *(void **)(result + 16);
    result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v10;
      if (a2) {
        int v6 = 4;
      }
      else {
        int v6 = 0;
      }
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * v7);
          if (v8) {
            *(_DWORD *)(v8 + 40) = *(_DWORD *)(v8 + 40) & 0xFFFFFFFB | v6;
          }
          ++v7;
        }

        while (v4 != v7);
        result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v4 = result;
      }

      while (result);
    }
  }

  return result;
}

- (int64_t)_compare:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 1LL;
  }
  if (!-[NSString isEqualToString:]( -[NSEntityDescription name](-[NSFetchIndexDescription entity](self, "entity"), "name"),  "isEqualToString:",  objc_msgSend((id)objc_msgSend(a3, "entity"), "name"))) {
    return -[NSString compare:]( -[NSEntityDescription name](-[NSFetchIndexDescription entity](self, "entity"), "name"),  "compare:",  objc_msgSend((id)objc_msgSend(a3, "entity"), "name"));
  }
  NSUInteger v5 = -[NSArray count](self->_elements, "count");
  if (v5 == [*((id *)a3 + 2) count])
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    elements = self->_elements;
    int64_t result = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
    if (result)
    {
      int64_t v8 = result;
      uint64_t v9 = *(void *)v31;
      uint64_t v23 = *(void *)v31;
      while (1)
      {
        uint64_t v10 = 0LL;
        int64_t v24 = v8;
        while (2)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(elements);
          }
          __int128 v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v12 = (void *)*((void *)a3 + 2);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (!v13) {
            return -1LL;
          }
          uint64_t v14 = v13;
          uint64_t v25 = v10;
          char v15 = 0;
          uint64_t v16 = *(void *)v27;
          while (2)
          {
            for (uint64_t i = 0LL; i != v14; ++i)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v12);
              }
              uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              if (objc_msgSend( (id)objc_msgSend(v11, "propertyName"),  "isEqualToString:",  objc_msgSend(v18, "propertyName")))
              {
                uint64_t v19 = [v11 collationType];
                if (v19 != [v18 collationType])
                {
                  unint64_t v22 = [v11 collationType];
                  BOOL v21 = v22 >= [v18 collationType];
                  goto LABEL_27;
                }

                char v15 = 1;
              }
            }

            uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14) {
              continue;
            }
            break;
          }

          if ((v15 & 1) == 0) {
            return -1LL;
          }
          uint64_t v10 = v25 + 1;
          uint64_t v9 = v23;
          if (v25 + 1 != v24) {
            continue;
          }
          break;
        }

        int64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
        int64_t result = 0LL;
        if (!v8) {
          return result;
        }
      }
    }
  }

  else
  {
    unint64_t v20 = -[NSArray count](self->_elements, "count");
    BOOL v21 = v20 >= [*((id *)a3 + 2) count];
LABEL_27:
    if (v21) {
      return 1LL;
    }
    else {
      return -1LL;
    }
  }

  return result;
}

@end