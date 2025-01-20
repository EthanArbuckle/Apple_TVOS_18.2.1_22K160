@interface NSCompositeAttributeDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSchemaEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTransient;
- (NSArray)elements;
- (NSCompositeAttributeDescription)init;
- (NSCompositeAttributeDescription)initWithCoder:(id)a3;
- (id)_buildDefaultValue;
- (id)_flattenElements:(id)a3;
- (id)_flattenedElements;
- (id)_initWithName:(id)a3;
- (id)_initWithName:(id)a3 type:(unint64_t)a4;
- (id)_initWithName:(id)a3 type:(unint64_t)a4 withClassName:(id)a5;
- (id)_initWithType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_buildDefaultValue:(void *)a3 usingElements:;
- (uint64_t)_checkElements:(uint64_t)result;
- (unint64_t)_propertyType;
- (unint64_t)attributeType;
- (void)_addElement:(id)a3;
- (void)_createCachesAndOptimizeState;
- (void)_setEntityAndMaintainIndices:(id)a3;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributeType:(unint64_t)a3;
- (void)setDefaultValue:(id)a3;
- (void)setElements:(NSArray *)elements;
@end

@implementation NSCompositeAttributeDescription

- (NSCompositeAttributeDescription)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  v2 = -[NSPropertyDescription init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    -[NSCompositeAttributeDescription setAttributeType:](v2, "setAttributeType:", 2100LL);
  }
  return v3;
}

- (id)_initWithName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  id v3 = -[NSPropertyDescription _initWithName:](&v6, sel__initWithName_, a3);
  v4 = v3;
  if (v3) {
    [v3 setAttributeType:2100];
  }
  return v4;
}

- (id)_initWithType:(unint64_t)a3
{
  if (a3 == 2100)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
    return -[NSAttributeDescription _initWithType:](&v8, sel__initWithType_);
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSCompositeAttributeDescription only supports NSCompositeAttributeType as a type." userInfo:0]);
    return -[NSCompositeAttributeDescription _initWithName:type:](v4, v5, v6, v7);
  }

- (id)_initWithName:(id)a3 type:(unint64_t)a4
{
  if (a4 == 2100)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
    return -[NSAttributeDescription _initWithName:type:](&v10, sel__initWithName_type_, a3);
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSCompositeAttributeDescription only supports NSCompositeAttributeType as a type." userInfo:0]);
    return -[NSCompositeAttributeDescription _initWithName:type:withClassName:](v5, v6, v7, v8, v9);
  }

- (id)_initWithName:(id)a3 type:(unint64_t)a4 withClassName:(id)a5
{
  if (a4 == 2100)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
    return -[NSAttributeDescription _initWithName:type:withClassName:]( &v8,  sel__initWithName_type_withClassName_,  a3,  2100LL,  a5);
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSCompositeAttributeDescription only supports NSCompositeAttributeType as a type." userInfo:0]);
    -[NSCompositeAttributeDescription dealloc](v6, v7);
  }

  return result;
}

- (void)dealloc
{
  self->_elements = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  -[NSAttributeDescription dealloc](&v3, sel_dealloc);
}

- (unint64_t)_propertyType
{
  return 7LL;
}

- (unint64_t)attributeType
{
  return 2100LL;
}

- (void)setAttributeType:(unint64_t)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (a3 != 2100)
  {
    uint64_t v3 = *MEMORY[0x189603A60];
    SEL v5 = @"offending attribute";
    v6[0] = self;
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v3,  @"The attribute type of a composite cannot be changed from NSCompositeAttributeType.",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  -[NSAttributeDescription setAttributeType:](&v4, sel_setAttributeType_);
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  id v4 = -[NSAttributeDescription description](&v10, sel_description);
  unint64_t v5 = -[NSCompositeAttributeDescription attributeType](self, "attributeType");
  SEL v6 = -[NSCompositeAttributeDescription elements](self, "elements");
  BOOL v7 = -[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion");
  objc_super v8 = @"NO";
  if (v7) {
    objc_super v8 = @"YES";
  }
  return (id)[v3 stringWithFormat:@"%@, attributeType %lu, elements %@, preservesValueInHistoryOnDeletion %@", v4, v5, v6, v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isTransient
{
  return 0;
}

- (NSCompositeAttributeDescription)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  id v4 = -[NSAttributeDescription initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    unint64_t v5 = (void *)MEMORY[0x189604010];
    uint64_t v6 = objc_opt_class();
    v4->_elements = (NSArray *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0),  @"NSCompositeElements");
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  -[NSAttributeDescription encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_elements forKey:@"NSCompositeElements"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  id v4 = -[NSAttributeDescription copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_super v5 = v4;
  if (v4) {
    [v4 setElements:self->_elements];
  }
  return v5;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(NSArray *)elements
{
  v35[2] = *MEMORY[0x1895F89C0];
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  -[NSCompositeAttributeDescription _checkElements:]((uint64_t)self, elements);
  objc_super v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", -[NSArray count](elements, "count"));
  BOOL v6 = -[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion");
  [v5 addObjectsFromArray:elements];
  objc_super v7 = 0LL;
  unint64_t v8 = 0LL;
  while ([v5 count])
  {
    id v9 = (void *)[v5 firstObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ([v9 preservesValueInHistoryOnDeletion]
        && !-[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion"))
      {
        v16 = (void *)MEMORY[0x189603F70];
        uint64_t v17 = [NSString stringWithFormat:@"Nested composite %@ is not eligible for preserving values on deletion (only allowed for root composite and leaves).", objc_msgSend(v9, "_qualifiedName")];
        v34[0] = @"Composite";
        v34[1] = @"Element";
        v35[0] = self;
        v35[1] = v9;
        uint64_t v18 = [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:v34 count:2];
LABEL_29:
        objc_exception_throw((id)[v16 exceptionWithName:*MEMORY[0x189603A60] reason:v17 userInfo:v18]);
LABEL_31:
        __break(1u);
      }

      int v10 = [v9 preservesValueInHistoryOnDeletion];
      if (v10 != -[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion"))
      {
        v16 = (void *)MEMORY[0x189603F70];
        uint64_t v17 = [NSString stringWithFormat:@"Nested composite %@ is not eligible for preserving values on deletion (only allowed for root composite and leaves).", objc_msgSend(v9, "_qualifiedName")];
        v32[0] = @"Composite";
        v32[1] = @"Element";
        v33[0] = self;
        v33[1] = v9;
        uint64_t v18 = [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:v32 count:2];
        goto LABEL_29;
      }
    }

    if (v6)
    {
      if (!v7)
      {
        v16 = (void *)MEMORY[0x189603F70];
        uint64_t v17 = [NSString stringWithFormat:@"Composite %@ that is preserved on deletion but element %@ is not.", -[NSPropertyDescription _qualifiedName](self, "_qualifiedName"), objc_msgSend(v9, "_qualifiedName")];
        v28[0] = @"Composite";
        v28[1] = @"Element";
        v29[0] = self;
        v29[1] = v9;
        uint64_t v18 = [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:v28 count:2];
        goto LABEL_29;
      }
    }

    else if ([v9 preservesValueInHistoryOnDeletion])
    {
      v16 = (void *)MEMORY[0x189603F70];
      uint64_t v17 = [NSString stringWithFormat:@"Element %@ is preserved on deletion but its composite %@ is not.", objc_msgSend(v9, "_qualifiedName"), -[NSPropertyDescription _qualifiedName](self, "_qualifiedName")];
      v30[0] = @"Element";
      v30[1] = @"Composite";
      v31[0] = v9;
      v31[1] = self;
      uint64_t v18 = [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:2];
      goto LABEL_29;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v9, "elements"));
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
    }

    ++v8;
    [v5 removeObject:v9];
  }

  if (v8 >= 0x3EA)
  {
    v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = [NSString stringWithFormat:@"%@ does not yet support more than 1000 total attributes as part of the modeled composite attribute graph. This attribute, %@, has %lu.", +[NSAttributeDescription stringForAttributeType:]( NSAttributeDescription, "stringForAttributeType:", -[NSCompositeAttributeDescription attributeType](self, "attributeType")), -[NSPropertyDescription _qualifiedName](self, "_qualifiedName"), v8];
    objc_exception_throw((id)[v19 exceptionWithName:*MEMORY[0x189603A60] reason:v20 userInfo:0]);
    goto LABEL_31;
  }

  v11 = (NSArray *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSArray count](elements, "count"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v12 = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(elements);
        }
        v15 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copy];
        -[NSArray addObject:](v11, "addObject:", v15);
      }

      uint64_t v12 = -[NSArray countByEnumeratingWithState:objects:count:]( elements,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    }

    while (v12);
  }

  self->_elements = v11;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x3052000000LL;
  v22[3] = __Block_byref_object_copy__50;
  v22[4] = __Block_byref_object_dispose__50;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __47__NSCompositeAttributeDescription_setElements___block_invoke;
  v21[3] = &unk_189EABCC8;
  v21[4] = v22;
  v22[5] = v21;
  __47__NSCompositeAttributeDescription_setElements___block_invoke((uint64_t)v21, v11, (uint64_t)self);
  _Block_object_dispose(v22, 8);
}

- (uint64_t)_checkElements:(uint64_t)result
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = (void *)result;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id result = [a2 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v26;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v26 != v5) {
            objc_enumerationMutation(a2);
          }
          objc_super v7 = *(void **)(*((void *)&v25 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_49;
          }
          uint64_t v8 = [v7 attributeType];
          uint64_t v9 = v8;
          if (v8 > 799)
          {
            if (v8 > 1199)
            {
              if (v8 > 1999)
              {
                if (v8 != 2100)
                {
                  if (v8 != 2000) {
                    goto LABEL_45;
                  }
                  goto LABEL_47;
                }
              }

              else if (v8 != 1200 && v8 != 1800)
              {
                goto LABEL_45;
              }
            }

            else if (v8 > 999)
            {
              if (v8 == 1000)
              {
                if (([v7 allowsExternalBinaryDataStorage] & 1) != 0
                  || ([v7 isFileBackedFuture] & 1) != 0)
                {
                  goto LABEL_47;
                }
              }

              else if (v8 != 1100)
              {
                goto LABEL_45;
              }
            }

            else if (v8 != 800 && v8 != 900)
            {
              goto LABEL_45;
            }
          }

          else if (v8 <= 399)
          {
            if (v8 <= 199)
            {
              if (v8 != 100)
              {
                if (v8)
                {
LABEL_45:
                  uint64_t v10 = [NSString stringWithUTF8String:"New attribute type? %@"];
                  _NSCoreDataLog(17LL, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v7);
                  uint64_t v17 = (os_log_s *)__pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v34 = v7;
                    _os_log_fault_impl( &dword_186681000,  v17,  OS_LOG_TYPE_FAULT,  "CoreData: New attribute type? %@",  buf,  0xCu);
                  }
                }

uint64_t __47__NSCompositeAttributeDescription_setElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if ([v10 isNSArray])
        {
          uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
          (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v10, a3);
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v10 setSuperCompositeAttribute:a3];
            uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
            (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, [v10 elements], v10);
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              [v10 setSuperCompositeAttribute:a3];
            }
          }
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = result;
    }

    while (result);
  }

  return result;
}

- (void)_setEntityAndMaintainIndices:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  -[NSPropertyDescription _setEntityAndMaintainIndices:](&v7, sel__setEntityAndMaintainIndices_);
  v6[0] = 0LL;
  v6[1] = v6;
  void v6[2] = 0x3052000000LL;
  v6[3] = __Block_byref_object_copy__50;
  v6[4] = __Block_byref_object_dispose__50;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __64__NSCompositeAttributeDescription__setEntityAndMaintainIndices___block_invoke;
  v5[3] = &unk_189EABCF0;
  v5[4] = a3;
  v5[5] = v6;
  v6[5] = v5;
  __64__NSCompositeAttributeDescription__setEntityAndMaintainIndices___block_invoke( (uint64_t)v5,  self->_elements,  (uint64_t)a3);
  _Block_object_dispose(v6, 8);
}

uint64_t __64__NSCompositeAttributeDescription__setEntityAndMaintainIndices___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if ([v10 isNSArray])
        {
          uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
          (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v10, a3);
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v10 _setEntityAndMaintainIndices:a3];
            uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, [v10 elements], a3);
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              [v10 _setEntityAndMaintainIndices:*(void *)(a1 + 32)];
            }
          }
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = result;
    }

    while (result);
  }

  return result;
}

- (void)_addElement:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x189603FA8] arrayWithArray:self->_elements];
  [v5 addObject:a3];
  -[NSCompositeAttributeDescription setElements:]( self,  "setElements:",  [MEMORY[0x189603F18] arrayWithArray:v5]);
}

- (BOOL)_isSchemaEqual:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  unsigned int v5 = -[NSAttributeDescription _isSchemaEqual:](&v7, sel__isSchemaEqual_);
  if (v5) {
    LOBYTE(v5) = -[NSArray isEqual:](self->_elements, "isEqual:", [a3 elements]);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }

  else
  {
    uint64_t v13 = v3;
    uint64_t v14 = v4;
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
    unsigned int v7 = -[NSAttributeDescription isEqual:](&v12, sel_isEqual_);
    if (v7)
    {
      elements = self->_elements;
      uint64_t v9 = [a3 elements];
      if (elements == (NSArray *)v9)
      {
        LOBYTE(v7) = 1;
      }

      else
      {
        if (elements) {
          BOOL v10 = v9 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10) {
          LOBYTE(v7) = 0;
        }
        else {
          LOBYTE(v7) = -[NSArray isEqual:](elements, "isEqual:", v9);
        }
      }
    }
  }

  return v7;
}

- (void)setDefaultValue:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (([a3 isNSDictionary] & 1) == 0)
  {
    unsigned int v5 = (void *)MEMORY[0x189603F70];
    uint64_t v6 = *MEMORY[0x189603A60];
    uint64_t v8 = @"Attribute";
    v9[0] = -[NSPropertyDescription name](self, "name");
    objc_exception_throw((id)objc_msgSend( v5,  "exceptionWithName:reason:userInfo:",  v6,  @"Unsupported default value for composite. Must be an NSDictionary.",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  -[NSAttributeDescription setDefaultValue:](&v7, sel_setDefaultValue_, a3);
}

- (id)_buildDefaultValue
{
  uint64_t v3 = objc_msgSend(-[NSAttributeDescription defaultValue](self, "defaultValue"), "mutableCopy");
  id v4 = (id)v3;
  if (!v3) {
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  -[NSCompositeAttributeDescription _buildDefaultValue:usingElements:]( (uint64_t)self,  v4,  -[NSCompositeAttributeDescription elements](self, "elements"));
  unsigned int v5 = (void *)[MEMORY[0x189603F68] dictionaryWithDictionary:v4];

  if (!v3 && ![v5 count]) {
    return 0LL;
  }
  return v5;
}

- (uint64_t)_buildDefaultValue:(void *)a3 usingElements:
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v23 = result;
  if (result)
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    uint64_t result = [a3 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v33;
      uint64_t v22 = a2;
      uint64_t v20 = *(void *)v33;
      do
      {
        uint64_t v6 = 0LL;
        uint64_t v21 = v4;
        do
        {
          if (*(void *)v33 != v5) {
            objc_enumerationMutation(a3);
          }
          objc_super v7 = *(__CFString **)(*((void *)&v32 + 1) + 8 * v6);
          uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSCompositeAttributeDescription _buildDefaultValue:usingElements:]( v23,  a2,  -[__CFString elements](v7, "elements"));
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v19 = *MEMORY[0x189603A60];
              uint64_t v36 = @"Attribute";
              v37 = v7;
              objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v19,  @"Unsupported attribute type for composite.",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1)));
            }

            uint64_t v25 = -[__CFString defaultValue](v7, "defaultValue");
            if (v25)
            {
              __int128 v27 = v8;
              __int128 v26 = -[NSPropertyDescription _elementPath](v7);
              uint64_t v9 = (void *)-[__CFString componentsSeparatedByString:](v26, "componentsSeparatedByString:", @".");
              if ((unint64_t)[v9 count] >= 2)
              {
                __int128 v30 = 0u;
                __int128 v31 = 0u;
                __int128 v28 = 0u;
                __int128 v29 = 0u;
                uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
                if (v10)
                {
                  uint64_t v11 = v10;
                  uint64_t v12 = *(void *)v29;
                  uint64_t v13 = (uint64_t)v22;
                  do
                  {
                    uint64_t v14 = 0LL;
                    __int128 v15 = (void *)v13;
                    do
                    {
                      if (*(void *)v29 != v12) {
                        objc_enumerationMutation(v9);
                      }
                      uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * v14);
                      uint64_t v13 = objc_msgSend(v15, "objectForKey:", v16, v20);
                      if (!v13)
                      {
                        id v17 = objc_alloc_init(MEMORY[0x189603FC8]);
                        [v15 setObject:v17 forKey:v16];
                      }

                      ++v14;
                      __int128 v15 = (void *)v13;
                    }

                    while (v11 != v14);
                    uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
                  }

                  while (v11);
                }
              }

              a2 = v22;
              uint64_t v18 = objc_msgSend(v22, "valueForKeyPath:", v26, v20);
              uint64_t v5 = v20;
              uint64_t v4 = v21;
              uint64_t v8 = v27;
              if (!v18) {
                [v22 setValue:v25 forKeyPath:v26];
              }
            }
          }

          objc_autoreleasePoolPop(v8);
          ++v6;
        }

        while (v6 != v4);
        uint64_t result = [a3 countByEnumeratingWithState:&v32 objects:v39 count:16];
        uint64_t v4 = result;
      }

      while (result);
    }
  }

  return result;
}

- (id)_flattenedElements
{
  return -[NSCompositeAttributeDescription _flattenElements:]( self,  "_flattenElements:",  -[NSCompositeAttributeDescription elements](self, "elements"));
}

- (id)_flattenElements:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend( v5,  "addObjectsFromArray:",  -[NSCompositeAttributeDescription _flattenElements:]( self,  "_flattenElements:",  objc_msgSend(v10, "elements")));
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v13 = *MEMORY[0x189603A60];
            uint64_t v18 = @"Attribute";
            uint64_t v19 = v10;
            objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v13,  @"Unsupported attribute type for composite.",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1)));
          }

          [v5 addObject:v10];
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v7);
  }

  uint64_t v11 = (void *)[MEMORY[0x189603F18] arrayWithArray:v5];

  return v11;
}

- (void)_createCachesAndOptimizeState
{
  id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  -[NSAttributeDescription _createCachesAndOptimizeState](&v7, sel__createCachesAndOptimizeState);
  -[NSCompositeAttributeDescription _checkElements:]((uint64_t)self, self->_elements);
  v6[0] = 0LL;
  v6[1] = v6;
  void v6[2] = 0x3052000000LL;
  v6[3] = __Block_byref_object_copy__50;
  v6[4] = __Block_byref_object_dispose__50;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __64__NSCompositeAttributeDescription__createCachesAndOptimizeState__block_invoke;
  v5[3] = &unk_189EABCC8;
  v5[4] = v6;
  v6[5] = v5;
  __64__NSCompositeAttributeDescription__createCachesAndOptimizeState__block_invoke( (uint64_t)v5,  self->_elements,  (uint64_t)self);
  _Block_object_dispose(v6, 8);
  [v3 drain];
  id v4 = 0LL;
}

uint64_t __64__NSCompositeAttributeDescription__createCachesAndOptimizeState__block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if ([v10 isNSArray])
        {
          uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
          (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v10, a3);
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v10 setSuperCompositeAttribute:a3];
            uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
            (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, [v10 elements], v10);
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              [v10 setSuperCompositeAttribute:a3];
            }
          }
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = result;
    }

    while (result);
  }

  return result;
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  CC_SHA256_Init(&c);
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  -[NSAttributeDescription _versionHash:inStyle:](&v26, sel__versionHash_inStyle_, data, a4);
  if (self->_elements)
  {
    uint64_t v6 = (void *)objc_msgSend( -[NSCompositeAttributeDescription _flattenElements:]( self,  "_flattenElements:",  -[NSCompositeAttributeDescription elements](self, "elements")),  "sortedArrayUsingFunction:context:",  _comparePropertiesByName,  0);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v11 isNSArray])
          {
            uint64_t v12 = (void *)[v11 sortedArrayUsingFunction:_comparePropertiesByName context:0];
            __int128 v18 = 0u;
            __int128 v19 = 0u;
            __int128 v20 = 0u;
            __int128 v21 = 0u;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v28 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v19;
              do
              {
                for (uint64_t j = 0LL; j != v14; ++j)
                {
                  if (*(void *)v19 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  [*(id *)(*((void *)&v18 + 1) + 8 * j) _versionHash:data inStyle:a4];
                  CC_SHA256_Update(&c, data, 0x20u);
                }

                uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v28 count:16];
              }

              while (v14);
            }
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && ([v11 isTransient] & 1) == 0)
            {
              [v11 _versionHash:data inStyle:a4];
              CC_SHA256_Update(&c, data, 0x20u);
            }
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }

      while (v8);
    }
  }

  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  int v16 = [a3 length];
  uint64_t v17 = [a3 length];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NSCompositeAttributeDescription;
  -[NSAttributeDescription _writeIntoData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:fetchRequests:]( &v20,  sel__writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_fetchRequests_,  a3,  a4,  a5,  a6,  a7,  a8,  a9);
  if (self->_elements) {
    unsigned int v18 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v18 = 0;
  }
  _writeInt32IntoData(a3, v18);
  uint64_t v19 = bswap32([a3 length] - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v17, 4, &v19);
}

@end