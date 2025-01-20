@interface NSPropertyDescription
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)_allowsCloudEncryption;
- (BOOL)_comparePredicatesAndWarnings:(id)a3;
- (BOOL)_epsilonEquals:(id)a3 rhs:(id)a4 withFlags:(int)a5;
- (BOOL)_hasMaxValueInExtraIvars;
- (BOOL)_hasMinValueInExtraIvars;
- (BOOL)_isAttribute;
- (BOOL)_isEditable;
- (BOOL)_isEqual:(id)a3 skipIndexCheck:(BOOL)a4;
- (BOOL)_isEqualWithoutIndex:(id)a3;
- (BOOL)_isFileBackedFuture;
- (BOOL)_isOrdered;
- (BOOL)_isRelationship;
- (BOOL)_isSchemaEqual:(id)a3;
- (BOOL)_isSpotlightIndexedAndTransient;
- (BOOL)_isToManyRelationship;
- (BOOL)_isTriggerBacked;
- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6;
- (BOOL)_preserveValueOnDelete;
- (BOOL)_skipValidation;
- (BOOL)_storeBinaryDataExternally;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndexed;
- (BOOL)isIndexedBySpotlight;
- (BOOL)isOptional;
- (BOOL)isReadOnly;
- (BOOL)isStoredInExternalRecord;
- (BOOL)isTransient;
- (NSArray)validationPredicates;
- (NSArray)validationWarnings;
- (NSData)versionHash;
- (NSDictionary)userInfo;
- (NSEntityDescription)entity;
- (NSPropertyDescription)init;
- (NSPropertyDescription)initWithCoder:(id)a3;
- (NSString)name;
- (NSString)renamingIdentifier;
- (NSString)versionHashModifier;
- (_NSExtraPropertyIVars)_extraIVars;
- (__CFString)_elementPath;
- (__CFString)_rootName;
- (id)_initWithName:(id)a3;
- (id)_namespace;
- (id)_qualifiedName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)superCompositeAttribute;
- (int)_encodedPropertyFlagsForFlags:(int)a3;
- (int64_t)_entitysReferenceID;
- (unint64_t)_propertyType;
- (unint64_t)hash;
- (void)_appendPropertyFieldsToData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8;
- (void)_createCachesAndOptimizeState;
- (void)_initializeExtraIVars;
- (void)_replaceValidationPredicates:(id)a3 andWarnings:(id)a4;
- (void)_restoreValidation;
- (void)_setEntity:(id)a3;
- (void)_setEntityAndMaintainIndices:(id)a3;
- (void)_setEntitysReferenceID:(int64_t)a3;
- (void)_setNamespace:(unint64_t *)a1;
- (void)_setOrdered:(BOOL)a3;
- (void)_stripForMigration;
- (void)_throwIfNotEditable;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setIndexed:(BOOL)indexed;
- (void)setIndexedBySpotlight:(BOOL)indexedBySpotlight;
- (void)setName:(NSString *)name;
- (void)setOptional:(BOOL)optional;
- (void)setReadOnly:(BOOL)a3;
- (void)setRenamingIdentifier:(NSString *)renamingIdentifier;
- (void)setStoredInExternalRecord:(BOOL)storedInExternalRecord;
- (void)setSuperCompositeAttribute:(id)a3;
- (void)setTransient:(BOOL)transient;
- (void)setUserInfo:(NSDictionary *)userInfo;
- (void)setValidationPredicates:(NSArray *)validationPredicates withValidationWarnings:(NSArray *)validationWarnings;
- (void)setVersionHashModifier:(NSString *)versionHashModifier;
@end

@implementation NSPropertyDescription

- (BOOL)isTransient
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 1) & 1;
}

- (id)superCompositeAttribute
{
  unint64_t v3 = atomic_load((unint64_t *)&self->_extraIvars);
  return *(id *)(v3 + 32);
}

- (NSString)name
{
  return self->_name;
}

- (NSEntityDescription)entity
{
  return self->_entity;
}

- (NSPropertyDescription)init
{
  return (NSPropertyDescription *)-[NSPropertyDescription _initWithName:](self, "_initWithName:", 0LL);
}

- (id)_initWithName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSPropertyDescription;
  v4 = -[NSPropertyDescription init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFE80 | 4;
    v4->_name = (NSString *)[a3 copy];
    v5->_entitysReferenceIDForProperty = -1;
    v5->_versionHashModifier = 0LL;
    v5->_versionHash = 0LL;
  }

  return v5;
}

- (void)_setEntitysReferenceID:(int64_t)a3
{
  uint64_t entitysReferenceIDForProperty = self->_entitysReferenceIDForProperty;
  if (entitysReferenceIDForProperty == -1 || entitysReferenceIDForProperty == a3) {
    self->_uint64_t entitysReferenceIDForProperty = a3;
  }
  else {
    __break(1u);
  }
}

- (void)setReadOnly:(BOOL)a3
{
  __int16 v3 = a3;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFFE | v3;
}

- (void)_throwIfNotEditable
{
}

- (void)setName:(NSString *)name
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_name != name)
  {
    v5 = -[NSPropertyDescription entity](self, "entity");
    p_isa = (id *)&v5->super.isa;
    if (v5
      && -[NSDictionary objectForKey:]( -[NSEntityDescription propertiesByName](v5, "propertiesByName"),  "objectForKey:",  name)
      && !-[NSPropertyDescription superCompositeAttribute](self, "superCompositeAttribute"))
    {
LABEL_17:
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"Can't change name of property from %@ to %@", self->_name, name), 0 reason userInfo]);
    }

    if (-[NSPropertyDescription superCompositeAttribute](self, "superCompositeAttribute"))
    {
      objc_super v7 = (void *)objc_msgSend( -[NSPropertyDescription superCompositeAttribute](self, "superCompositeAttribute"),  "elements");
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0LL;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            if (objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11), "name"),  "isEqualToString:",  name)) {
              goto LABEL_17;
            }
            ++v11;
          }

          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }

        while (v9);
      }

      self->_name = (NSString *)-[NSString copy](name, "copy");
    }

    else
    {
      -[NSEntityDescription _removeProperty:](p_isa, self);

      self->_name = (NSString *)-[NSString copy](name, "copy");
      [p_isa _addProperty:self];
    }
  }

- (BOOL)_isAttribute
{
  return 0;
}

- (id)_namespace
{
  unint64_t v3 = atomic_load((unint64_t *)&self->_extraIvars);
  return *(id *)(v3 + 24);
}

- (BOOL)isOptional
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 2) & 1;
}

- (int64_t)_entitysReferenceID
{
  return self->_entitysReferenceIDForProperty;
}

- (void)dealloc
{
  p_extraIvars = (unint64_t *)&self->_extraIvars;
  if (atomic_load((unint64_t *)&self->_extraIvars))
  {
    v5 = (id *)atomic_load(p_extraIvars);

    v6 = (void *)atomic_load(p_extraIvars);
    void *v6 = 0LL;
    unint64_t v7 = atomic_load(p_extraIvars);

    unint64_t v8 = atomic_load(p_extraIvars);
    *(void *)(v8 + 24) = 0LL;
    unint64_t v9 = atomic_load(p_extraIvars);
    *(void *)(v9 + 32) = 0LL;
    if ((*(_WORD *)&self->_propertyDescriptionFlags & 0x80) == 0)
    {
      uint64_t v10 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        uint64_t v10 = malloc_default_zone();
      }
      uint64_t v11 = (void *)atomic_load((unint64_t *)&self->_extraIvars);
      malloc_zone_free(v10, v11);
    }

    atomic_store(0LL, (unint64_t *)&self->_extraIvars);
  }

  self->_entity = 0LL;
  self->_name = 0LL;

  self->_validationPredicates = 0LL;
  self->_validationWarnings = 0LL;

  self->_userInfo = 0LL;
  self->_versionHash = 0LL;

  self->_versionHashModifier = 0LL;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSPropertyDescription;
  -[NSPropertyDescription dealloc](&v12, sel_dealloc);
}

- (BOOL)_isOrdered
{
  return HIBYTE(*(_WORD *)&self->_propertyDescriptionFlags) & 1;
}

+ (void)initialize
{
}

- (int)_encodedPropertyFlagsForFlags:(int)a3
{
  return a3;
}

- (void)encodeWithCoder:(id)a3
{
  if (-[NSPropertyDescription isOptional](self, "isOptional"))
  {
    [a3 encodeBool:1 forKey:@"NSIsOptional"];
    uint64_t v5 = 3LL;
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  if (-[NSPropertyDescription isReadOnly](self, "isReadOnly"))
  {
    [a3 encodeBool:1 forKey:@"NSIsReadOnly"];
    uint64_t v5 = v5 | 4;
  }

  if (-[NSPropertyDescription isTransient](self, "isTransient"))
  {
    [a3 encodeBool:1 forKey:@"NSIsTransient"];
    uint64_t v5 = v5 | 8;
  }

  if (-[NSPropertyDescription isIndexedBySpotlight](self, "isIndexedBySpotlight"))
  {
    [a3 encodeBool:1 forKey:@"NSIndexedBySpotlight"];
    uint64_t v5 = v5 | 0x100;
  }

  if (-[NSPropertyDescription isStoredInExternalRecord](self, "isStoredInExternalRecord"))
  {
    [a3 encodeBool:1 forKey:@"NSIsStoredInTruth"];
    uint64_t v5 = v5 | 0x200;
  }

  if (-[NSPropertyDescription _isOrdered](self, "_isOrdered"))
  {
    [a3 encodeBool:1 forKey:@"NSIsOrdered"];
    uint64_t v5 = v5 | 0x400;
  }

  if (-[NSPropertyDescription _allowsCloudEncryption](self, "_allowsCloudEncryption"))
  {
    [a3 encodeBool:1 forKey:@"NSAllowsCloudEncryption"];
    uint64_t v5 = v5 | 0x800;
  }

  v6 = -[NSPropertyDescription renamingIdentifier](self, "renamingIdentifier");
  if (v6) {
    [a3 encodeObject:v6 forKey:@"NSRenamingIdentifier"];
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPropertyDescription name](self, "name"), @"NSPropertyName");
  objc_msgSend( a3,  "encodeConditionalObject:forKey:",  -[NSPropertyDescription entity](self, "entity"),  @"NSEntity");
  unint64_t v7 = -[NSPropertyDescription validationPredicates](self, "validationPredicates");
  if (-[NSArray count](v7, "count")) {
    [a3 encodeObject:v7 forKey:@"NSValidationPredicates"];
  }
  else {
    uint64_t v5 = v5 | 0x10;
  }
  unint64_t v8 = -[NSPropertyDescription validationWarnings](self, "validationWarnings");
  if (-[NSArray count](v8, "count")) {
    [a3 encodeObject:v8 forKey:@"NSValidationWarnings"];
  }
  else {
    uint64_t v5 = v5 | 0x20;
  }
  unint64_t v9 = -[NSPropertyDescription userInfo](self, "userInfo");
  if (-[NSDictionary count](v9, "count")) {
    [a3 encodeObject:v9 forKey:@"NSUserInfo"];
  }
  else {
    uint64_t v5 = v5 | 0x40;
  }
  uint64_t v10 = -[NSPropertyDescription versionHashModifier](self, "versionHashModifier");
  if (-[NSString length](v10, "length")) {
    [a3 encodeObject:v10 forKey:@"NSVersionHashModifier"];
  }
  else {
    uint64_t v5 = v5 | 0x80;
  }
  objc_msgSend( a3,  "encodeInt32:forKey:",  -[NSPropertyDescription _encodedPropertyFlagsForFlags:](self, "_encodedPropertyFlagsForFlags:", v5),  @"_P");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPropertyDescription)initWithCoder:(id)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___NSPropertyDescription;
  v4 = -[NSPropertyDescription init](&v46, sel_init);
  if (v4)
  {
    uint64_t v5 = +[PFModelDecoderContext retainedContext](&OBJC_CLASS___PFModelDecoderContext, "retainedContext");
    v42[0] = MEMORY[0x1895F87A8];
    v42[1] = 3221225472LL;
    v43 = __39__NSPropertyDescription_initWithCoder___block_invoke;
    v44 = &unk_189EA7758;
    v37 = v5;
    v45 = v5;
    unsigned int v6 = [a3 decodeInt32ForKey:@"_P"];
    char v7 = v6;
    if (v6)
    {
      *(_WORD *)&v4->_propertyDescriptionFlags = (2 * v6) & 4 | (v6 >> 2) & 3 | (v6 >> 3) & 0x60 | (v6 >> 2) & 0x100 | (((v6 >> 11) & 1) << 15) | *(_WORD *)&v4->_propertyDescriptionFlags & 0x7E98;
      if ((v6 & 0x10) != 0) {
        goto LABEL_35;
      }
    }

    else
    {
      else {
        __int16 v8 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFFB | v8;
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFFE | [a3 decodeBoolForKey:@"NSIsReadOnly"];
      else {
        __int16 v9 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFFD | v9;
      else {
        __int16 v10 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFDF | v10;
      else {
        __int16 v11 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFBF | v11;
      else {
        __int16 v12 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFEFF | v12;
      else {
        __int16 v13 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = v13 & 0x8000 | *(_WORD *)&v4->_propertyDescriptionFlags & 0x7FFF;
    }

    __int128 v14 = (void *)MEMORY[0x189604010];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = (NSArray *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0),  @"NSValidationPredicates");
    v4->_validationPredicates = v17;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    uint64_t v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v38,  v47,  16LL);
    if (v18)
    {
      uint64_t v19 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0LL; i != v18; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (!byte_18C4ABDC6)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              [v21 allowEvaluation];
            }
          }

          if ([v21 isNSArray])
          {
            objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4866,  &unk_189F03B08));

            goto LABEL_61;
          }
        }

        uint64_t v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v38,  v47,  16LL);
        if (v18) {
          continue;
        }
        break;
      }
    }

void __39__NSPropertyDescription_initWithCoder___block_invoke(uint64_t a1)
{
}

- (void)_setNamespace:(unint64_t *)a1
{
  if (a1)
  {
    v4 = a1 + 7;
    if (atomic_load(a1 + 7))
    {
      unint64_t v6 = atomic_load(v4);

      unint64_t v7 = atomic_load(v4);
      *(void *)(v7 + 24) = 0LL;
    }

    if (!atomic_load(v4)) {
      [a1 _initializeExtraIVars];
    }
    __int16 v9 = a1 + 7;
    unint64_t v10 = atomic_load(v9);
    uint64_t v16 = *(void **)(v10 + 24);
    __int16 v11 = (void *)[a2 copy];
    __int16 v12 = v16;
    unint64_t v13 = atomic_load(v9);
    __int128 v14 = (unint64_t *)(v13 + 24);
    while (1)
    {
      unint64_t v15 = __ldaxr(v14);
    }

    __clrex();

    __int16 v12 = v16;
LABEL_11:
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    *(void *)(v4 + 32) = -[NSString copy](self->_name, "copy");
    *(void *)(v4 + 40) = -[NSArray copy]( -[NSPropertyDescription validationPredicates](self, "validationPredicates"),  "copy");
    *(void *)(v4 + 48) = -[NSArray copy]( -[NSPropertyDescription validationWarnings](self, "validationWarnings"),  "copy");
    int v5 = *(_WORD *)(v4 + 72) & 0xFFFE | *(_WORD *)&self->_propertyDescriptionFlags & 1;
    *(_WORD *)(v4 + 72) = *(_WORD *)(v4 + 72) & 0xFFFE | *(_WORD *)&self->_propertyDescriptionFlags & 1;
    unsigned int v6 = v5 & 0xFFFFFFFD | (2 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 1) & 1));
    *(_WORD *)(v4 + 72) = v6;
    unsigned int v7 = v6 & 0xFFFFFFFB | (4 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 2) & 1));
    *(_WORD *)(v4 + 72) = v7;
    unsigned int v8 = v7 & 0xFFFFFFF7 | (8 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 3) & 1));
    *(_WORD *)(v4 + 72) = v8;
    unsigned int v9 = v8 & 0xFFFFFFEF | (16 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 4) & 1));
    *(_WORD *)(v4 + 72) = v9;
    unsigned int v10 = v9 & 0xFFFFFFDF | (32 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 5) & 1));
    *(_WORD *)(v4 + 72) = v10;
    unsigned int v11 = v10 & 0xFFFFFFBF | (((*(_WORD *)&self->_propertyDescriptionFlags >> 6) & 1) << 6);
    *(_WORD *)(v4 + 72) = v11;
    unsigned int v12 = v11 & 0xFFFFFEFF | ((HIBYTE(*(_WORD *)&self->_propertyDescriptionFlags) & 1) << 8);
    *(_WORD *)(v4 + 72) = v12;
    *(_WORD *)(v4 + 72) = *(_WORD *)&self->_propertyDescriptionFlags & 0x8000 | v12 & 0x7FFF;
    *(void *)(v4 + 64) = -[NSMutableDictionary copy](self->_userInfo, "copy");
    *(void *)(v4 + 8) = -[NSString copy](self->_versionHashModifier, "copy");
    *(void *)(v4 + 16) = 0LL;
    *(_WORD *)(v4 + 76) = -1;
    objc_msgSend( (id)v4,  "setRenamingIdentifier:",  -[NSPropertyDescription renamingIdentifier](self, "renamingIdentifier"));
    objc_msgSend( (id)v4,  "setSuperCompositeAttribute:",  -[NSPropertyDescription superCompositeAttribute](self, "superCompositeAttribute"));
  }

  return (id)v4;
}

- (unint64_t)hash
{
  return -[NSString hash](-[NSPropertyDescription name](self, "name"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  return -[NSPropertyDescription _isEqual:skipIndexCheck:](self, "_isEqual:skipIndexCheck:", a3, 0LL);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPropertyDescription;
  return (id)[NSString stringWithFormat:@"(%@), name %@, isOptional %d, isTransient %d, entity %@, renamingIdentifier %@, validation predicates %@, warnings %@, versionHashModifier %@\n userInfo %@", -[NSPropertyDescription description](&v3, sel_description), -[NSPropertyDescription name](self, "name"), -[NSPropertyDescription isOptional](self, "isOptional"), -[NSPropertyDescription isTransient](self, "isTransient"), -[NSEntityDescription name](-[NSPropertyDescription entity](self, "entity"), "name"), -[NSPropertyDescription renamingIdentifier](self, "renamingIdentifier"), -[NSPropertyDescription validationPredicates](self, "validationPredicates"), -[NSPropertyDescription validationWarnings](self, "validationWarnings"), -[NSPropertyDescription versionHashModifier](self, "versionHashModifier"), -[NSPropertyDescription userInfo](self, "userInfo")];
}

- (BOOL)isIndexed
{
  entity = self->_entity;
  if (entity)
  {
    int v4 = -[NSEntityDescription _hasIndexForProperty:]((uint64_t)entity, self);
    if (!-[NSPropertyDescription _isEditable](self, "_isEditable"))
    {
      if (v4) {
        __int16 v5 = 8;
      }
      else {
        __int16 v5 = 0;
      }
      *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFF7 | v5;
    }
  }

  else
  {
    return (*(_WORD *)&self->_propertyDescriptionFlags >> 3) & 1;
  }

  return v4;
}

- (void)setIndexed:(BOOL)indexed
{
  entity = self->_entity;
  if (entity)
  {
    -[NSEntityDescription _addIndexForProperty:]((uint64_t)entity, self);
  }

  else
  {
    if (indexed) {
      __int16 v5 = 8;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFF7 | v5;
  }

- (NSArray)validationPredicates
{
  if (self->_validationPredicates) {
    return self->_validationPredicates;
  }
  else {
    return (NSArray *)NSArray_EmptyArray;
  }
}

- (NSArray)validationWarnings
{
  if (self->_validationWarnings) {
    return self->_validationWarnings;
  }
  else {
    return (NSArray *)NSArray_EmptyArray;
  }
}

- (void)setOptional:(BOOL)optional
{
  BOOL v3 = optional;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    __int16 v5 = 4;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFFB | v5;
}

- (void)setTransient:(BOOL)transient
{
  BOOL v3 = transient;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    __int16 v5 = 2;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFFD | v5;
}

- (void)setValidationPredicates:(NSArray *)validationPredicates withValidationWarnings:(NSArray *)validationWarnings
{
  NSUInteger v7 = -[NSArray count](validationPredicates, "count");
  if (v7 == -[NSArray count](validationWarnings, "count"))
  {
    unsigned int v8 = self->_validationPredicates;
    if (v8 != validationPredicates)
    {

      self->_validationPredicates = (NSArray *)-[NSArray copy](validationPredicates, "copy");
    }

    unsigned int v9 = self->_validationWarnings;
    if (v9 != validationWarnings)
    {

      self->_validationWarnings = (NSArray *)-[NSArray copy](validationWarnings, "copy");
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Mismatch between length of validation predicates and warnings" userInfo:0]);
    -[NSPropertyDescription setUserInfo:](v10, v11, v12);
  }

- (void)setUserInfo:(NSDictionary *)userInfo
{
  __int16 v5 = self->_userInfo;
  if (v5 != (NSMutableDictionary *)userInfo)
  {

    self->_userInfo = (NSMutableDictionary *)-[NSDictionary copy](userInfo, "copy");
  }

  objc_sync_exit(self);
}

- (NSDictionary)userInfo
{
  if (self->_userInfo) {
    return &self->_userInfo->super;
  }
  else {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
}

- (NSData)versionHash
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  p_versionHash = (unint64_t *)&self->_versionHash;
  versionHash = self->_versionHash;
  if (versionHash)
  {
LABEL_9:
    unsigned int v6 = versionHash;
    return v6;
  }

  -[NSPropertyDescription _versionHash:inStyle:](self, "_versionHash:inStyle:", v9, 0LL);
  __int16 v5 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v9 length:32];
  if (!-[NSPropertyDescription _isEditable](self, "_isEditable"))
  {
    while (!__ldaxr(p_versionHash))
    {
    }

    __clrex();

LABEL_8:
    versionHash = (NSData *)*p_versionHash;
    goto LABEL_9;
  }

  unsigned int v6 = v5;
  return v6;
}

- (NSString)versionHashModifier
{
  return self->_versionHashModifier;
}

- (void)setVersionHashModifier:(NSString *)versionHashModifier
{
  __int16 v5 = self->_versionHashModifier;
  if (v5 != versionHashModifier)
  {

    self->_versionHashModifier = (NSString *)-[NSString copy](versionHashModifier, "copy");
  }

- (BOOL)isIndexedBySpotlight
{
  if ((*(_WORD *)&self->_propertyDescriptionFlags & 0x20) != 0) {
    return !-[NSPropertyDescription isTransient](self, "isTransient");
  }
  else {
    return 0;
  }
}

- (void)setIndexedBySpotlight:(BOOL)indexedBySpotlight
{
  BOOL v3 = indexedBySpotlight;
  v9[1] = *MEMORY[0x1895F89C0];
  if (-[NSPropertyDescription _propertyType](self, "_propertyType") == 7)
  {
    unsigned int v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A58];
    unsigned int v8 = @"attribute";
    v9[0] = -[NSPropertyDescription name](self, "name");
    objc_exception_throw((id)objc_msgSend( v6,  "exceptionWithName:reason:userInfo:",  v7,  @"A composite attribute type cannot be indexed by spotlight.",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }

  if (v3) {
    __int16 v5 = 32;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFDF | v5;
}

- (BOOL)isStoredInExternalRecord
{
  if ((*(_WORD *)&self->_propertyDescriptionFlags & 0x40) != 0) {
    return !-[NSPropertyDescription isTransient](self, "isTransient");
  }
  else {
    return 0;
  }
}

- (void)setStoredInExternalRecord:(BOOL)storedInExternalRecord
{
  if (storedInExternalRecord) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFBF | v3;
}

- (void)setRenamingIdentifier:(NSString *)renamingIdentifier
{
  if (!renamingIdentifier
    || -[NSString isNSString](renamingIdentifier, "isNSString")
    && -[NSString isEqualToString:](-[NSPropertyDescription name](self, "name"), "isEqualToString:", renamingIdentifier))
  {
    p_extraIvars = (unint64_t *)&self->_extraIvars;
    if (atomic_load((unint64_t *)&self->_extraIvars))
    {
      uint64_t v7 = (id *)atomic_load(p_extraIvars);

      unsigned int v8 = (void *)atomic_load(p_extraIvars);
      *unsigned int v8 = 0LL;
    }
  }

  else
  {
    unsigned int v9 = (unint64_t *)&self->_extraIvars;
    SEL v11 = (void **)atomic_load(v9);
    uint64_t v16 = *v11;
    unsigned int v12 = (void *)-[NSString copy](renamingIdentifier, "copy");
    unint64_t v13 = v16;
    __int128 v14 = (unint64_t *)atomic_load(v9);
    while (1)
    {
      unint64_t v15 = __ldaxr(v14);
    }

    __clrex();

    unint64_t v13 = v16;
LABEL_14:
  }

- (NSString)renamingIdentifier
{
  unint64_t v2 = atomic_load((unint64_t *)&self->_extraIvars);
  else {
    return -[NSPropertyDescription name](self, "name");
  }
}

- (BOOL)_hasMaxValueInExtraIvars
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 9) & 1;
}

- (BOOL)_hasMinValueInExtraIvars
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 10) & 1;
}

- (BOOL)_storeBinaryDataExternally
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 11) & 1;
}

- (BOOL)_preserveValueOnDelete
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 12) & 1;
}

- (BOOL)_isTriggerBacked
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 13) & 1;
}

- (BOOL)_isFileBackedFuture
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 14) & 1;
}

- (BOOL)_allowsCloudEncryption
{
  return *(_WORD *)&self->_propertyDescriptionFlags >> 15;
}

- (__CFString)_rootName
{
  if (result)
  {
    v1 = (void *)-[__CFString _namespace](result, "_namespace");
    if (v1) {
      return (__CFString *)objc_msgSend((id)objc_msgSend(v1, "componentsSeparatedByString:", @"."), "firstObject");
    }
    else {
      return &stru_189EAC2E8;
    }
  }

  return result;
}

- (__CFString)_elementPath
{
  if (result)
  {
    v1 = result;
    unint64_t v2 = (void *)-[__CFString _namespace](result, "_namespace");
    if (v2)
    {
      __int16 v3 = v2;
      uint64_t v4 = [v2 rangeOfString:@"."];
      if ((unint64_t)(v4 - 1) > 0x7FFFFFFFFFFFFFFDLL)
      {
        return (__CFString *)-[__CFString name](v1, "name");
      }

      else
      {
        uint64_t v5 = [v3 substringFromIndex:v4 + 1];
        return (__CFString *)[NSString stringWithFormat:@"%@.%@", v5, -[__CFString name](v1, "name")];
      }
    }

    else
    {
      return &stru_189EAC2E8;
    }
  }

  return result;
}

- (id)_qualifiedName
{
  id v3 = -[NSPropertyDescription _namespace](self, "_namespace");
  if (v3) {
    return (id)[NSString stringWithFormat:@"%@.%@", v3, -[NSPropertyDescription name](self, "name")];
  }
  else {
    return -[NSPropertyDescription name](self, "name");
  }
}

- (void)setSuperCompositeAttribute:(id)a3
{
  p_extraIvars = (unint64_t *)&self->_extraIvars;
  unint64_t v7 = atomic_load(p_extraIvars);
  *(void *)(v7 + 32) = a3;
  if (a3)
  {
    if ([a3 _namespace]) {
      uint64_t v8 = [NSString stringWithFormat:@"%@.%@", objc_msgSend(a3, "_namespace"), objc_msgSend(a3, "name")];
    }
    else {
      uint64_t v8 = [a3 name];
    }
    unsigned int v9 = (void *)v8;
  }

  else
  {
    unsigned int v9 = 0LL;
  }

  -[NSPropertyDescription _setNamespace:]((unint64_t *)self, v9);
}

- (BOOL)_epsilonEquals:(id)a3 rhs:(id)a4 withFlags:(int)a5
{
  if (a3 == a4) {
    return 1;
  }
  else {
    return [a3 isEqual:a4];
  }
}

- (BOOL)_isSchemaEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = -[NSPropertyDescription name](self, "name");
  uint64_t v6 = [a3 name];
  if (v5 == (NSString *)v6) {
    return 1;
  }
  uint64_t v7 = v6;
  BOOL result = 0;
  if (v5)
  {
    if (v7) {
      return -[NSString isEqual:](v5, "isEqual:");
    }
  }

  return result;
}

- (void)_initializeExtraIVars
{
  id v3 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    id v3 = malloc_default_zone();
  }
  uint64_t v4 = malloc_zone_calloc(v3, 1uLL, 0x28uLL);
  uint64_t v5 = v4;
  p_extraIvars = (unint64_t *)&self->_extraIvars;
  while (!__ldaxr(p_extraIvars))
  {
  }

  __clrex();
  uint64_t v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v8 = malloc_default_zone();
  }
  malloc_zone_free(v8, v5);
}

- (_NSExtraPropertyIVars)_extraIVars
{
  p_extraIvars = (unint64_t *)&self->_extraIvars;
  return (_NSExtraPropertyIVars *)atomic_load(p_extraIvars);
}

- (void)_replaceValidationPredicates:(id)a3 andWarnings:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];

  self->_validationPredicates = (NSArray *)a3;
  self->_validationWarnings = (NSArray *)a4;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  validationPredicates = self->_validationPredicates;
  uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( validationPredicates,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(validationPredicates);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) allowEvaluation];
      }

      uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( validationPredicates,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

- (void)_createCachesAndOptimizeState
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  validationPredicates = self->_validationPredicates;
  uint64_t v3 = -[NSArray countByEnumeratingWithState:objects:count:]( validationPredicates,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(validationPredicates);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) allowEvaluation];
      }

      uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( validationPredicates,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  __int16 v6 = -[NSPropertyDescription isOptional](self, "isOptional", a3, a4);
  if (-[NSPropertyDescription isTransient](self, "isTransient")) {
    __int16 v7 = 2;
  }
  else {
    __int16 v7 = 0;
  }
  __int16 v8 = v7 | v6;
  if (-[NSPropertyDescription isReadOnly](self, "isReadOnly")) {
    __int16 v9 = 4;
  }
  else {
    __int16 v9 = 0;
  }
  __int16 data = v8 | v9;
  CC_SHA256_Init(&c);
  name = (__CFString *)self->_name;
  if (!name)
  {
LABEL_10:
    CStringPtr = (const char *)-[__CFString UTF8String](name, "UTF8String");
    if (!CStringPtr) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  CStringPtr = CFStringGetCStringPtr(name, 0x8000100u);
  if (!CStringPtr)
  {
    name = (__CFString *)self->_name;
    goto LABEL_10;
  }

- (unint64_t)_propertyType
{
  return 0LL;
}

- (BOOL)_isEqualWithoutIndex:(id)a3
{
  return -[NSPropertyDescription _isEqual:skipIndexCheck:](self, "_isEqual:skipIndexCheck:", a3, 1LL);
}

- (BOOL)_isEqual:(id)a3 skipIndexCheck:(BOOL)a4
{
  if (a3 == self)
  {
    LOBYTE(v9) = 1;
    return v9;
  }

  if (!a3) {
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  unint64_t v7 = -[NSPropertyDescription _propertyType](self, "_propertyType");
  if (v7 != [a3 _propertyType]) {
    goto LABEL_16;
  }
  __int16 v8 = -[NSPropertyDescription name](self, "name");
  uint64_t v9 = [a3 name];
  if (v8 == (NSString *)v9
    || (uint64_t v10 = v9, LOBYTE(v9) = 0, v8) && v10 && (LODWORD(v9) = -[NSString isEqual:](v8, "isEqual:"), (_DWORD)v9))
  {
    int v11 = -[NSPropertyDescription isOptional](self, "isOptional");
    if (v11 != [a3 isOptional]
      || (int v12 = -[NSPropertyDescription isTransient](self, "isTransient"),
          v12 != [a3 isTransient])
      || (int v13 = -[NSPropertyDescription _allowsCloudEncryption](self, "_allowsCloudEncryption"),
          v13 != [a3 _allowsCloudEncryption])
      || !a4
      && (int v14 = -[NSPropertyDescription isIndexed](self, "isIndexed"), v14 != [a3 isIndexed])
      || (int v15 = -[NSPropertyDescription isIndexedBySpotlight](self, "isIndexedBySpotlight"),
          v15 != [a3 isIndexedBySpotlight])
      || (int v16 = -[NSPropertyDescription isStoredInExternalRecord](self, "isStoredInExternalRecord"),
          v16 != [a3 isStoredInExternalRecord]))
    {
LABEL_16:
      LOBYTE(v9) = 0;
      return v9;
    }

    uint64_t v17 = -[NSPropertyDescription userInfo](self, "userInfo");
    uint64_t v9 = [a3 userInfo];
    if (v17 == (NSDictionary *)v9
      || (uint64_t v18 = v9, LOBYTE(v9) = 0, v17) && v18 && (LODWORD(v9) = -[NSDictionary isEqual:](v17, "isEqual:"), (_DWORD)v9))
    {
      uint64_t v19 = -[NSPropertyDescription versionHashModifier](self, "versionHashModifier");
      uint64_t v9 = [a3 versionHashModifier];
      if (v19 == (NSString *)v9
        || (uint64_t v20 = v9, LOBYTE(v9) = 0, v19) && v20 && (LODWORD(v9) = -[NSString isEqual:](v19, "isEqual:"), (_DWORD)v9))
      {
        LOBYTE(v9) = -[NSPropertyDescription _comparePredicatesAndWarnings:](self, "_comparePredicatesAndWarnings:", a3);
      }
    }
  }

  return v9;
}

- (BOOL)_isRelationship
{
  return 0;
}

- (BOOL)_isToManyRelationship
{
  return 0;
}

- (void)_setEntity:(id)a3
{
  self->_entity = (NSEntityDescription *)a3;
}

- (void)_setEntityAndMaintainIndices:(id)a3
{
  entity = self->_entity;
  if (entity != a3)
  {
    if (entity)
    {
      if (-[NSEntityDescription _hasIndexForProperty:]((uint64_t)entity, self))
      {
        -[NSEntityDescription _removeIndexForProperty:]((uint64_t)self->_entity, self);
        self->_entity = (NSEntityDescription *)a3;
LABEL_6:
        if (a3)
        {
          -[NSEntityDescription _addIndexForProperty:]((uint64_t)a3, self);
          return;
        }

        __int16 v7 = *(_WORD *)&self->_propertyDescriptionFlags | 8;
LABEL_12:
        *(_WORD *)&self->___int16 propertyDescriptionFlags = v7;
        return;
      }

      self->_entity = (NSEntityDescription *)a3;
    }

    else
    {
      __int16 propertyDescriptionFlags = (__int16)self->_propertyDescriptionFlags;
      self->_entity = (NSEntityDescription *)a3;
      if ((propertyDescriptionFlags & 8) != 0) {
        goto LABEL_6;
      }
    }

    if (a3) {
      return;
    }
    __int16 v7 = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFF7;
    goto LABEL_12;
  }

- (BOOL)_isEditable
{
  entity = self->_entity;
  return !entity || -[NSEntityDescription _isEditable](entity, "_isEditable");
}

- (BOOL)isReadOnly
{
  return *(_WORD *)&self->_propertyDescriptionFlags & 1;
}

- (void)_setOrdered:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFEFF | v3;
}

- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6
{
  if (-[NSPropertyDescription isOptional](self, "isOptional")
    || *a3
    || -[NSPropertyDescription isTransient](self, "isTransient") && !(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
  {
    return 1;
  }

  if (!a6) {
    return 0;
  }
  int v12 = (void *)-[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]( (uint64_t)a5,  1570,  0LL,  (uint64_t)a4,  (uint64_t)*a3,  0LL);
  BOOL result = 0;
  *a6 = v12;
  return result;
}

- (BOOL)_comparePredicatesAndWarnings:(id)a3
{
  id v5 = -[NSPropertyDescription _rawValidationPredicates](self, "_rawValidationPredicates");
  uint64_t v6 = [a3 _rawValidationPredicates];
  if (v5 == (id)v6 || (uint64_t v7 = v6, LOBYTE(v6) = 0, v5) && v7 && (LODWORD(v6) = objc_msgSend(v5, "isEqual:"), (_DWORD)v6))
  {
    id v8 = -[NSPropertyDescription _rawValidationWarnings](self, "_rawValidationWarnings");
    uint64_t v6 = [a3 _rawValidationWarnings];
    if (v8 == (id)v6)
    {
      LOBYTE(v6) = 1;
    }

    else
    {
      uint64_t v9 = v6;
      LOBYTE(v6) = 0;
      if (v8 && v9) {
        LOBYTE(v6) = objc_msgSend(v8, "isEqual:");
      }
    }
  }

  return v6;
}

- (void)_stripForMigration
{
  *(_WORD *)&self->_propertyDescriptionFlags |= 0x10u;
}

- (void)_restoreValidation
{
  *(_WORD *)&self->_propertyDescriptionFlags &= ~0x10u;
}

- (BOOL)_skipValidation
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 4) & 1;
}

- (BOOL)_isSpotlightIndexedAndTransient
{
  return (~*(_WORD *)&self->_propertyDescriptionFlags & 0x22) != 0;
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
}

- (void)_appendPropertyFieldsToData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8
{
  if (-[NSArray count](self->_validationWarnings, "count"))
  {
    _writeInt32IntoData(a3, 1u);
    _writePFEncodedArrayShapeIntoData(a3, self->_validationPredicates, a7, 0LL);
    _writePFEncodedArrayShapeIntoData(a3, self->_validationWarnings, a6, a7);
  }

  else
  {
    _writeInt32IntoData(a3, 0);
  }

  if (atomic_load((unint64_t *)&self->_extraIvars))
  {
    _writeInt32IntoData(a3, 1u);
    int v15 = (void *)atomic_load((unint64_t *)&self->_extraIvars);
    if (*v15)
    {
      _writeInt32IntoData(a3, 1u);
      int v16 = (void *)atomic_load((unint64_t *)&self->_extraIvars);
      _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a6, "objectForKey:", *v16), "unsignedIntegerValue"));
    }

    else
    {
      _writeInt64IntoData(a3, 0LL);
    }

    unint64_t v17 = atomic_load((unint64_t *)&self->_extraIvars);
    _writeInt64IntoData(a3, *(void *)(v17 + 8));
    unint64_t v18 = atomic_load((unint64_t *)&self->_extraIvars);
    _writeInt64IntoData(a3, *(void *)(v18 + 16));
  }

  else
  {
    _writeInt32IntoData(a3, 0);
  }

  if (self->_userInfo) {
    unsigned int v19 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v19 = 0;
  }
  _writeInt32IntoData(a3, v19);
  _writeInt32IntoData(a3, -[NSPropertyDescription _entitysReferenceID](self, "_entitysReferenceID"));
}

@end