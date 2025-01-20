@interface NSDerivedAttributeDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSchemaEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)isTransient;
- (NSDerivedAttributeDescription)initWithCoder:(id)a3;
- (NSExpression)derivationExpression;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_validateKeypaths:(uint64_t)result;
- (unint64_t)_propertyType;
- (void)_createCachesAndOptimizeState;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setDerivationExpression:(NSExpression *)derivationExpression;
- (void)setRenamingIdentifier:(id)a3;
@end

@implementation NSDerivedAttributeDescription

- (void)dealloc
{
  self->_derivationExpression = 0LL;
  self->_filteringPredicate = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSDerivedAttributeDescription;
  -[NSAttributeDescription dealloc](&v3, sel_dealloc);
}

- (unint64_t)_propertyType
{
  return 6LL;
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSDerivedAttributeDescription;
  id v4 = -[NSAttributeDescription description](&v12, sel_description);
  NSAttributeType v5 = -[NSAttributeDescription attributeType](self, "attributeType");
  v6 = -[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName");
  derivationExpression = self->_derivationExpression;
  filteringPredicate = self->_filteringPredicate;
  BOOL v9 = -[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion");
  v10 = @"NO";
  if (v9) {
    v10 = @"YES";
  }
  return (id)[v3 stringWithFormat:@"%@, attributeType %lu, attributeValueClassName %@, derivationExpression %@, filteringPredicate %@, preservesValueInHistoryOnDeletion %@", v4, v5, v6, derivationExpression, filteringPredicate, v10];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isTransient
{
  return 0;
}

- (BOOL)isReadOnly
{
  return 1;
}

- (NSDerivedAttributeDescription)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSDerivedAttributeDescription;
  id v4 = -[NSAttributeDescription initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    NSAttributeType v5 = (void *)MEMORY[0x189604010];
    uint64_t v6 = objc_opt_class();
    v4->_derivationExpression = (NSExpression *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v5,  "setWithObjects:",  v6,  objc_opt_class(),  0),  @"NSDerivationExpression");
    v7 = (void *)MEMORY[0x189604010];
    uint64_t v8 = objc_opt_class();
    v4->_filteringPredicate = (NSPredicate *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v7,  "setWithObjects:",  v8,  objc_opt_class(),  0),  @"NSFilteringPredicate");
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSDerivedAttributeDescription;
  -[NSAttributeDescription encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_derivationExpression forKey:@"NSDerivationExpression"];
  [a3 encodeObject:self->_filteringPredicate forKey:@"NSFilteringPredicate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSDerivedAttributeDescription;
  id v4 = -[NSAttributeDescription copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (v4)
  {
    v4[15] = self->_derivationExpression;
    v4[16] = self->_filteringPredicate;
  }

  return v4;
}

- (NSExpression)derivationExpression
{
  return self->_derivationExpression;
}

- (void)setDerivationExpression:(NSExpression *)derivationExpression
{
  v14[1] = *MEMORY[0x1895F89C0];
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_derivationExpression != derivationExpression)
  {
    if (-[NSExpression expressionType](derivationExpression, "expressionType") != NSKeyPathExpressionType)
    {
LABEL_9:
      v11 = derivationExpression;

      self->_derivationExpression = derivationExpression;
      return;
    }

    objc_super v5 = -[NSExpression keyPath](derivationExpression, "keyPath");
    if (-[NSString hasSuffix:](v5, "hasSuffix:", @".@sum"))
    {
      objc_super v6 = (void *)MEMORY[0x189607878];
      v14[0] = objc_msgSend( MEMORY[0x189607878],  "expressionForKeyPath:",  -[NSString substringToIndex:](v5, "substringToIndex:", -[NSString length](v5, "length") - 5));
      v7 = (void *)MEMORY[0x189603F18];
      uint64_t v8 = v14;
    }

    else
    {
      if (!-[NSString hasSuffix:](v5, "hasSuffix:", @".@total"))
      {
        if (!-[NSString hasSuffix:](v5, "hasSuffix:", @".@count")) {
          goto LABEL_9;
        }
        objc_super v6 = (void *)MEMORY[0x189607878];
        uint64_t v12 = objc_msgSend( MEMORY[0x189607878],  "expressionForKeyPath:",  -[NSString substringToIndex:](v5, "substringToIndex:", -[NSString length](v5, "length") - 7));
        uint64_t v9 = [MEMORY[0x189603F18] arrayWithObjects:&v12 count:1];
        objc_super v10 = @"count:";
        goto LABEL_8;
      }

      objc_super v6 = (void *)MEMORY[0x189607878];
      uint64_t v13 = objc_msgSend( MEMORY[0x189607878],  "expressionForKeyPath:",  -[NSString substringToIndex:](v5, "substringToIndex:", -[NSString length](v5, "length") - 7));
      v7 = (void *)MEMORY[0x189603F18];
      uint64_t v8 = &v13;
    }

    uint64_t v9 = [v7 arrayWithObjects:v8 count:1];
    objc_super v10 = @"sum:";
LABEL_8:
    derivationExpression = (NSExpression *)[v6 expressionForFunction:v10 arguments:v9];
    goto LABEL_9;
  }

- (BOOL)_isSchemaEqual:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSDerivedAttributeDescription;
  unsigned int v5 = -[NSAttributeDescription _isSchemaEqual:](&v8, sel__isSchemaEqual_);
  if (v5)
  {
    unsigned int v5 = -[NSExpression isEqual:](self->_derivationExpression, "isEqual:", [a3 derivationExpression]);
    if (v5)
    {
      if (a3) {
        uint64_t v6 = *((void *)a3 + 16);
      }
      else {
        uint64_t v6 = 0LL;
      }
      LOBYTE(v5) = -[NSPredicate isEqual:](self->_filteringPredicate, "isEqual:", v6) ^ 1;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
    return v7;
  }

  uint64_t v16 = v3;
  uint64_t v17 = v4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NSDerivedAttributeDescription;
  unsigned int v7 = -[NSAttributeDescription isEqual:](&v15, sel_isEqual_);
  if (!v7) {
    return v7;
  }
  derivationExpression = self->_derivationExpression;
  uint64_t v9 = [a3 derivationExpression];
  if (derivationExpression != (NSExpression *)v9)
  {
    if (derivationExpression) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
LABEL_17:
      LOBYTE(v7) = 0;
      return v7;
    }

    unsigned int v7 = -[NSExpression isEqual:](derivationExpression, "isEqual:", v9);
    if (!v7) {
      return v7;
    }
  }

  filteringPredicate = self->_filteringPredicate;
  if (a3) {
    uint64_t v12 = (NSPredicate *)*((void *)a3 + 16);
  }
  else {
    uint64_t v12 = 0LL;
  }
  if (filteringPredicate == v12)
  {
    LOBYTE(v7) = 1;
    return v7;
  }

  if (filteringPredicate) {
    BOOL v13 = v12 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    goto LABEL_17;
  }
  LOBYTE(v7) = -[NSPredicate isEqual:](filteringPredicate, "isEqual:");
  return v7;
}

- (void)setDefaultValue:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *MEMORY[0x189603A60];
  unsigned int v7 = @"offending property";
  v8[0] = self;
  objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v3,  @"Can't set a default value for a derived attribute",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1)));
  -[NSDerivedAttributeDescription setRenamingIdentifier:](v4, v5, v6);
}

- (void)setRenamingIdentifier:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  if ((-[NSString isEqual:](-[NSPropertyDescription renamingIdentifier](self, "renamingIdentifier"), "isEqual:", a3) & 1) == 0)
  {
    uint64_t v4 = *MEMORY[0x189603A60];
    SEL v5 = @"derived attribute";
    v6[0] = self;
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v4,  @"Can't set renaming identifiers for derived attributes",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  }

- (void)_createCachesAndOptimizeState
{
  v21[2] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSDerivedAttributeDescription;
  -[NSAttributeDescription _createCachesAndOptimizeState](&v17, sel__createCachesAndOptimizeState);
  uint64_t v16 = 0LL;
  id v4 = -[NSExpression _keypathsForDerivedPropertyValidation:]( self->_derivationExpression,  "_keypathsForDerivedPropertyValidation:",  &v16);
  if (v4)
  {
    -[NSDerivedAttributeDescription _validateKeypaths:]((uint64_t)self, v4);
    filteringPredicate = self->_filteringPredicate;
    if (!filteringPredicate)
    {
LABEL_5:
      -[NSExpression allowEvaluation](self->_derivationExpression, "allowEvaluation");
      -[NSPredicate allowEvaluation](self->_filteringPredicate, "allowEvaluation");
      [v3 drain];
      id v7 = 0LL;
      return;
    }

    id v6 = -[NSPredicate _keypathsForDerivedPropertyValidation:]( filteringPredicate,  "_keypathsForDerivedPropertyValidation:",  &v16);
    if (v6)
    {
      -[NSDerivedAttributeDescription _validateKeypaths:]((uint64_t)self, v6);
      goto LABEL_5;
    }

    uint64_t v12 = v16;
    if (!v16)
    {
      uint64_t v12 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134097 userInfo:&unk_189F03F18];
      uint64_t v16 = v12;
    }

    BOOL v13 = (void *)MEMORY[0x189603F70];
    uint64_t v14 = *MEMORY[0x189607798];
    v18[0] = @"offending property";
    v18[1] = v14;
    v19[0] = self;
    v19[1] = v12;
    uint64_t v15 = objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v19, v18, 2, v16);
    objc_exception_throw((id)[v13 exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't get keypaths for derived attribute validation" userInfo:v15]);
  }

  else
  {
    uint64_t v8 = v16;
    if (!v16)
    {
      uint64_t v8 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134097 userInfo:&unk_189F03EF0];
      uint64_t v16 = v8;
    }

    uint64_t v9 = (void *)MEMORY[0x189603F70];
    uint64_t v10 = *MEMORY[0x189607798];
    v20[0] = @"offending property";
    v20[1] = v10;
    v21[0] = self;
    v21[1] = v8;
    uint64_t v11 = objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v21, v20, 2, v16);
    objc_exception_throw((id)[v9 exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't get keypaths for derived attribute validation" userInfo:v11]);
  }

  __break(1u);
}

- (uint64_t)_validateKeypaths:(uint64_t)result
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  v19 = (void *)result;
  if (result)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    result = [a2 countByEnumeratingWithState:&v21 objects:v37 count:16];
    uint64_t v20 = result;
    if (result)
    {
      uint64_t v18 = *(void *)v22;
      do
      {
        uint64_t v2 = 0LL;
        do
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(a2);
          }
          objc_super v17 = *(void **)(*((void *)&v21 + 1) + 8 * v2);
          id v3 = (void *)[v17 componentsSeparatedByString:@"."];
          id v4 = (void *)[v19 entity];
          if ([v3 count])
          {
            unint64_t v5 = 1LL;
            do
            {
              unint64_t v6 = v5 - 1;
              id v7 = (void *)[v3 objectAtIndexedSubscript:v5 - 1];
              if ([v7 rangeOfString:@"$"] != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v12 = (void *)MEMORY[0x189603F70];
                uint64_t v13 = *MEMORY[0x189603A60];
                v35[0] = @"offending property";
                v35[1] = @"keypath";
                v36[0] = v19;
                v36[1] = v17;
                uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:2];
                uint64_t v15 = @"Bad keypath for derived property (unresolved variable)";
                goto LABEL_32;
              }

              if ([v7 rangeOfString:@"@"] == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (!v4
                  || (uint64_t v8 = (void *)objc_msgSend((id)objc_msgSend(v4, "propertiesByName"), "objectForKey:", v7)) == 0)
                {
                  uint64_t v12 = (void *)MEMORY[0x189603F70];
                  uint64_t v13 = *MEMORY[0x189603A60];
                  v31[0] = @"offending property";
                  v31[1] = @"keypath";
                  v32[0] = v19;
                  v32[1] = v17;
                  v31[2] = @"component";
                  v32[2] = v7;
                  uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:v31 count:3];
                  uint64_t v15 = @"Bad keypath for derived property (missing keypath component)";
                  goto LABEL_32;
                }

                uint64_t v9 = v8;
                uint64_t v10 = [v8 _propertyType];
                if (v10 == 2)
                {
                  if (v6 != [v3 count] - 1)
                  {
                    if (v6 != [v3 count] - 2)
                    {
                      uint64_t v12 = (void *)MEMORY[0x189603F70];
                      uint64_t v13 = *MEMORY[0x189603A60];
                      v27[0] = @"offending property";
                      v27[1] = @"keypath";
                      v28[0] = v19;
                      v28[1] = v17;
                      v27[2] = @"component";
                      v28[2] = v7;
                      uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:v27 count:3];
                      uint64_t v15 = @"Bad keypath for derived property (attribute has multiple keys following)";
LABEL_32:
                      objc_exception_throw((id)[v12 exceptionWithName:v13 reason:v15 userInfo:v14]);
                    }

                    if (objc_msgSend( (id)objc_msgSend(v3, "objectAtIndexedSubscript:", v5),  "rangeOfString:",  @"@") == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      uint64_t v12 = (void *)MEMORY[0x189603F70];
                      uint64_t v13 = *MEMORY[0x189603A60];
                      v29[0] = @"offending property";
                      v29[1] = @"keypath";
                      v30[0] = v19;
                      v30[1] = v17;
                      v29[2] = @"component";
                      v30[2] = v7;
                      uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:v29 count:3];
                      uint64_t v15 = @"Bad keypath for derived property (attribute in non-terminal location not followed by operator)";
                      goto LABEL_32;
                    }
                  }
                }

                else
                {
                  if (v10 != 4)
                  {
                    uint64_t v12 = (void *)MEMORY[0x189603F70];
                    uint64_t v13 = *MEMORY[0x189603A60];
                    v25[0] = @"offending property";
                    v25[1] = @"keypath";
                    v26[0] = v19;
                    v26[1] = v17;
                    v25[2] = @"component";
                    v26[2] = v7;
                    uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:3];
                    uint64_t v15 = @"Bad keypath for derived property (unsupported property type in keypath)";
                    goto LABEL_32;
                  }

                  id v4 = (void *)[v9 destinationEntity];
                }
              }

              else if (v6 != [v3 count] - 1)
              {
                uint64_t v12 = (void *)MEMORY[0x189603F70];
                uint64_t v13 = *MEMORY[0x189603A60];
                v33[0] = @"offending property";
                v33[1] = @"keypath";
                v34[0] = v19;
                v34[1] = v17;
                uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:v33 count:2];
                uint64_t v15 = @"Bad keypath for derived property (misplaced operator)";
                goto LABEL_32;
              }
            }

            while (v5++ < [v3 count]);
          }

          ++v2;
        }

        while (v2 != v20);
        result = [a2 countByEnumeratingWithState:&v21 objects:v37 count:16];
        uint64_t v20 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  CC_SHA256_Init(&c);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NSDerivedAttributeDescription;
  -[NSAttributeDescription _versionHash:inStyle:](&v15, sel__versionHash_inStyle_, v17, a4);
  derivationExpression = self->_derivationExpression;
  if (derivationExpression)
  {
    uint64_t v8 = (__CFString *)-[NSExpression predicateFormat](derivationExpression, "predicateFormat");
    CStringPtr = CFStringGetCStringPtr(v8, 0x8000100u);
    if (!CStringPtr) {
      CStringPtr = (const char *)-[__CFString UTF8String](v8, "UTF8String");
    }
    CC_LONG v10 = strlen(CStringPtr);
    CC_SHA256_Update(&c, CStringPtr, v10);
  }

  filteringPredicate = self->_filteringPredicate;
  if (filteringPredicate)
  {
    uint64_t v12 = -[NSPredicate predicateFormat](filteringPredicate, "predicateFormat");
    uint64_t v13 = CFStringGetCStringPtr(v12, 0x8000100u);
    if (!v13) {
      uint64_t v13 = (const char *)-[__CFString UTF8String](v12, "UTF8String");
    }
    CC_LONG v14 = strlen(v13);
    CC_SHA256_Update(&c, v13, v14);
  }

  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  int v16 = [a3 length];
  uint64_t v17 = [a3 length];
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSDerivedAttributeDescription;
  -[NSAttributeDescription _writeIntoData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:fetchRequests:]( &v21,  sel__writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_fetchRequests_,  a3,  a4,  a5,  a6,  a7,  a8,  a9);
  if (self->_derivationExpression) {
    unsigned int v18 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v18 = 0;
  }
  _writeInt32IntoData(a3, v18);
  if (self->_filteringPredicate) {
    unsigned int v19 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v19 = 0;
  }
  _writeInt32IntoData(a3, v19);
  uint64_t v20 = bswap32([a3 length] - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v17, 4, &v20);
}

@end