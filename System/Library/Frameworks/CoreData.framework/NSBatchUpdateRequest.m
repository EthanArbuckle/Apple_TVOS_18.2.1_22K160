@interface NSBatchUpdateRequest
+ (NSBatchUpdateRequest)batchUpdateRequestWithEntityName:(NSString *)entityName;
+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5;
- (BOOL)_secureOperation;
- (BOOL)includesSubentities;
- (NSBatchUpdateRequest)init;
- (NSBatchUpdateRequest)initWithEntity:(NSEntityDescription *)entity;
- (NSBatchUpdateRequest)initWithEntityName:(NSString *)entityName;
- (NSBatchUpdateRequestResultType)resultType;
- (NSDictionary)propertiesToUpdate;
- (NSEntityDescription)entity;
- (NSPredicate)predicate;
- (NSString)description;
- (NSString)entityName;
- (id)encodeForXPC;
- (unint64_t)requestType;
- (void)_resolveEntityWithContext:(id)a3;
- (void)_setSecureOperation:(BOOL)a3;
- (void)_setValidatedPropertiesToUpdate:(id *)a1;
- (void)dealloc;
- (void)setIncludesSubentities:(BOOL)includesSubentities;
- (void)setPredicate:(NSPredicate *)predicate;
- (void)setPropertiesToUpdate:(NSDictionary *)propertiesToUpdate;
- (void)setResultType:(NSBatchUpdateRequestResultType)resultType;
@end

@implementation NSBatchUpdateRequest

- (id)encodeForXPC
{
  id v2 = -[NSBatchUpdateRequestEncodingToken initForRequest:]( objc_alloc(&OBJC_CLASS___NSBatchUpdateRequestEncodingToken),  "initForRequest:",  self);
  v3 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
  [v3 setDelegate:objc_opt_class()];
  [v3 encodeObject:v2 forKey:@"root"];
  [v3 finishEncoding];
  id v4 = (id)[v3 encodedData];

  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  v7 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:a3 error:0];
  [v7 setDelegate:a4];
  v8 = (void *)[MEMORY[0x189604010] setWithObject:objc_opt_class()];
  if (a5) {
    v8 = (void *)objc_msgSend( v8,  "setByAddingObjectsFromSet:",  objc_msgSend(a5, "allowableClassesForClientWithContext:", a4));
  }
  v9 = (void *)[v7 decodeObjectOfClasses:v8 forKey:@"root"];

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v10 = (void *)objc_msgSend((id)objc_msgSend(v9, "columnsToUpdate", 0), "allValues");
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    int v12 = 0;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          int v16 = [v15 constantValue] == 0;
        }
        else {
          int v16 = objc_msgSend(v15, "isEqual:", objc_msgSend(MEMORY[0x189603FE8], "null"));
        }
        v12 += v16;
      }

      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v11);
    uint64_t v17 = v12;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  if ([v9 nullValueCount] != v17) {
    return 0LL;
  }
  v18 = -[NSBatchUpdateRequest initWithEntityName:]( [NSBatchUpdateRequest alloc],  "initWithEntityName:",  [v9 entityName]);
  -[NSBatchUpdateRequest setPredicate:](v18, "setPredicate:", [v9 predicate]);
  -[NSBatchUpdateRequest setPropertiesToUpdate:](v18, "setPropertiesToUpdate:", [v9 columnsToUpdate]);
  -[NSBatchUpdateRequest setResultType:](v18, "setResultType:", [v9 resultType]);
  -[NSBatchUpdateRequest setIncludesSubentities:]( v18,  "setIncludesSubentities:",  [v9 includeSubEntities]);
  -[NSBatchUpdateRequest _setSecureOperation:](v18, "_setSecureOperation:", [v9 secure]);
  return v18;
}

+ (NSBatchUpdateRequest)batchUpdateRequestWithEntityName:(NSString *)entityName
{
  return (NSBatchUpdateRequest *)(id)[objc_alloc((Class)a1) initWithEntityName:entityName];
}

- (NSBatchUpdateRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSBatchUpdateRequest;
  result = -[NSBatchUpdateRequest init](&v3, sel_init);
  if (result) {
    result->_flags = (_requestFlags)(*(_DWORD *)&result->_flags & 0xFFFFFFF8 | 1);
  }
  return result;
}

- (NSBatchUpdateRequest)initWithEntityName:(NSString *)entityName
{
  id v4 = -[NSBatchUpdateRequest init](self, "init");
  if (v4)
  {
    v4->_entity = entityName;
    *(_DWORD *)&v4->_flags |= 8u;
  }

  return v4;
}

- (NSBatchUpdateRequest)initWithEntity:(NSEntityDescription *)entity
{
  id v4 = -[NSBatchUpdateRequest init](self, "init");
  if (v4) {
    v4->_entity = entity;
  }
  return v4;
}

- (void)dealloc
{
  self->_entity = 0LL;
  self->_predicate = 0LL;

  self->_columnsToUpdate = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSBatchUpdateRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<NSBatchUpdateRequest : entity = %@, properties = %@, subentities = %d, predicate = %@", -[NSBatchUpdateRequest entityName](self, "entityName"), self->_columnsToUpdate, *(_DWORD *)&self->_flags & 1, self->_predicate];
}

- (NSString)entityName
{
  result = (NSString *)self->_entity;
  if ((*(_BYTE *)&self->_flags & 8) == 0) {
    return (NSString *)-[NSString name](result, "name");
  }
  return result;
}

- (NSEntityDescription)entity
{
  if ((*(_BYTE *)&self->_flags & 8) == 0) {
    return (NSEntityDescription *)self->_entity;
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189607678], objc_msgSend( NSString, "stringWithFormat:", @"This batch update request (%p) was created with a string name (%@), and cannot respond to -entity until used by an NSManagedObjectContext", self, self->_entity, 0), 0 reason userInfo]);
  return (NSEntityDescription *)-[NSBatchUpdateRequest requestType](v3, v4);
}

- (unint64_t)requestType
{
  return 6LL;
}

- (BOOL)includesSubentities
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)setIncludesSubentities:(BOOL)includesSubentities
{
  self->_flags = (_requestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | includesSubentities);
}

- (NSBatchUpdateRequestResultType)resultType
{
  return ((unint64_t)self->_flags >> 1) & 3;
}

- (void)setResultType:(NSBatchUpdateRequestResultType)resultType
{
  self->_flags = (_requestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFF9 | (2 * (resultType & 3)));
}

- (NSDictionary)propertiesToUpdate
{
  return self->_columnsToUpdate;
}

- (void)_setValidatedPropertiesToUpdate:(id *)a1
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v2 = a1;
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    uint64_t v50 = [a2 countByEnumeratingWithState:&v52 objects:v72 count:16];
    if (v50)
    {
      uint64_t v4 = *(void *)v53;
      v48 = v2;
LABEL_4:
      uint64_t v5 = 0LL;
      while (1)
      {
        if (*(void *)v53 != v4) {
          objc_enumerationMutation(a2);
        }
        v6 = *(void **)(*((void *)&v52 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v8 = [a2 objectForKey:v6];
        if ([v6 isNSString])
        {
          v49 = v7;
          v9 = (void *)[v6 componentsSeparatedByString:@"."];
          v10 = (void *)[v2 entity];
          if ([v9 count] != 1)
          {

            uint64_t v36 = [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Invalid string keypath %@ passed to propertiesToUpdate:", v6), 0 reason userInfo];
            uint64_t v37 = *MEMORY[0x189607460];
            v70 = @"NSUnderlyingException";
            uint64_t v71 = v36;
            v33 = (void *)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v37,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
            id v2 = v48;
            v7 = v49;
            goto LABEL_33;
          }

          uint64_t v11 = (void *)objc_msgSend( (id)objc_msgSend(v10, "propertiesByName"),  "objectForKey:",  objc_msgSend(v9, "objectAtIndex:", 0));
          id v2 = v48;
          v7 = v49;
          if (!v11 || (v6 = v11, [v11 isTransient]))
          {

            uint64_t v24 = [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Invalid string key %@ passed to propertiesToUpdate:", 0), 0 reason userInfo];
            v19 = (void *)MEMORY[0x189607870];
            uint64_t v20 = *MEMORY[0x189607460];
            v68 = @"NSUnderlyingException";
            uint64_t v69 = v24;
            __int128 v21 = (void *)MEMORY[0x189603F68];
            __int128 v22 = &v69;
            __int128 v23 = &v68;
            goto LABEL_31;
          }
        }

        int v12 = (void *)[v2 entity];
        uint64_t v13 = [v6 name];
        if (!v12
          || (v14 = (void *)objc_msgSend((id)objc_msgSend(v12, "propertiesByName"), "objectForKey:", v13)) == 0)
        {

          uint64_t v18 = [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Attribute/relationship description names passed to propertiesToUpdate must match name on fetch entity (%@)", 0), 0 reason userInfo];
          v19 = (void *)MEMORY[0x189607870];
          uint64_t v20 = *MEMORY[0x189607460];
          v66 = @"NSUnderlyingException";
          uint64_t v67 = v18;
          __int128 v21 = (void *)MEMORY[0x189603F68];
          __int128 v22 = &v67;
          __int128 v23 = &v66;
          goto LABEL_31;
        }

        v15 = v14;
        if ([v14 isTransient])
        {

          uint64_t v25 = [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Invalid property %@ passed as key to propertiesToUpdate:", v15), 0 reason userInfo];
          v19 = (void *)MEMORY[0x189607870];
          uint64_t v20 = *MEMORY[0x189607460];
          v64 = @"NSUnderlyingException";
          uint64_t v65 = v25;
          __int128 v21 = (void *)MEMORY[0x189603F68];
          __int128 v22 = &v65;
          __int128 v23 = &v64;
          goto LABEL_31;
        }

        uint64_t v16 = [v15 _propertyType];
        switch(v16)
        {
          case 4LL:

            uint64_t v26 = [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Invalid relationship (%@) passed to propertiesToUpdate:", v15), 0 reason userInfo];
            v19 = (void *)MEMORY[0x189607870];
            uint64_t v20 = *MEMORY[0x189607460];
            v60 = @"NSUnderlyingException";
            uint64_t v61 = v26;
            __int128 v21 = (void *)MEMORY[0x189603F68];
            __int128 v22 = &v61;
            __int128 v23 = &v60;
            goto LABEL_31;
          case 6LL:

            uint64_t v27 = [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Invalid derived attribute (%@) passed to propertiesToUpdate:", v15), 0 reason userInfo];
            v19 = (void *)MEMORY[0x189607870];
            uint64_t v20 = *MEMORY[0x189607460];
            v58 = @"NSUnderlyingException";
            uint64_t v59 = v27;
            __int128 v21 = (void *)MEMORY[0x189603F68];
            __int128 v22 = &v59;
            __int128 v23 = &v58;
            goto LABEL_31;
          case 5LL:

            uint64_t v28 = [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Invalid expressionDescription %@ passed as key to propertiesToUpdate:", v15), 0 reason userInfo];
            v19 = (void *)MEMORY[0x189607870];
            uint64_t v20 = *MEMORY[0x189607460];
            v62 = @"NSUnderlyingException";
            uint64_t v63 = v28;
            __int128 v21 = (void *)MEMORY[0x189603F68];
            __int128 v22 = &v63;
            __int128 v23 = &v62;
LABEL_31:
            uint64_t v29 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
            v30 = v19;
            uint64_t v31 = v20;
            uint64_t v32 = 134060LL;
LABEL_32:
            v33 = (void *)[v30 errorWithDomain:v31 code:v32 userInfo:v29];
LABEL_33:
            id v17 = v33;
            objc_autoreleasePoolPop(v7);
            id v3 = 0LL;
            goto LABEL_34;
        }

        if (HIBYTE(dword_18C4ABDC0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([v15 isOptional] & 1) == 0)
          {

            v38 = (void *)MEMORY[0x189603F68];
            uint64_t v39 = [v15 name];
            uint64_t v40 = objc_msgSend( v38,  "dictionaryWithObjectsAndKeys:",  v12,  @"NSValidationErrorObject",  v39,  @"NSValidationErrorKey",  objc_msgSend(MEMORY[0x189603FE8], "null"),  @"NSValidationErrorValue",  0);
            uint64_t v41 = [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Invalid NULL value for key (%@) passed to propertiesToUpdate:", objc_msgSend(v15, "name")), v40 reason userInfo];
            v42 = (void *)MEMORY[0x189607870];
            uint64_t v43 = *MEMORY[0x189607460];
            v56 = @"NSUnderlyingException";
            uint64_t v57 = v41;
            uint64_t v29 = [MEMORY[0x189603F68] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
            v30 = v42;
            uint64_t v31 = v43;
            uint64_t v32 = 1570LL;
            goto LABEL_32;
          }
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          uint64_t v8 = [MEMORY[0x189607878] expressionForConstantValue:v8];
        }
        [v3 setObject:v8 forKey:v15];
        objc_autoreleasePoolPop(v7);
        if (v50 == ++v5)
        {
          uint64_t v50 = [a2 countByEnumeratingWithState:&v52 objects:v72 count:16];
          if (v50) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v17 = 0LL;
LABEL_34:
    uint64_t v34 = [v3 count];
    if (v34 != [a2 count])
    {

      if (v17) {
        id v44 = v17;
      }
      goto LABEL_46;
    }

    if (v17)
    {
      id v35 = v17;
      if (!v3) {
        goto LABEL_46;
      }
    }

    else if (!v3)
    {
      id v17 = 0LL;
LABEL_46:
      objc_exception_throw((id)objc_msgSend( (id)objc_msgSend(v17, "userInfo"),  "valueForKey:",  @"NSUnderlyingException"));
      -[NSBatchUpdateRequest setPropertiesToUpdate:](v45, v46, v47);
      return;
    }

    v2[5] = v3;
  }

- (void)setPropertiesToUpdate:(NSDictionary *)propertiesToUpdate
{
  if (self->_columnsToUpdate != propertiesToUpdate)
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      uint64_t v5 = propertiesToUpdate;

      self->_columnsToUpdate = propertiesToUpdate;
    }

    else
    {
      -[NSBatchUpdateRequest _setValidatedPropertiesToUpdate:]((id *)&self->super.super.isa, propertiesToUpdate);
    }
  }

- (void)_resolveEntityWithContext:(id)a3
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    int v5 = [a3 _allowAncillaryEntities];
    v6 = (void *)[a3 persistentStoreCoordinator];
    if (v5)
    {
      if (!v6) {
        goto LABEL_10;
      }
      uint64_t v7 = v6[12];
      if (!v7) {
        goto LABEL_10;
      }
      uint64_t v8 = (id *)(v7 + 56);
    }

    else
    {
      uint64_t v9 = [v6 managedObjectModel];
      if (!v9) {
        goto LABEL_10;
      }
      uint64_t v8 = (id *)(v9 + 32);
    }

    v10 = (void *)[*v8 objectForKey:self->_entity];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = v10;
      id entity = self->_entity;
      self->_id entity = v11;
      *(_DWORD *)&self->_flags &= ~8u;
      uint64_t v13 = self->_columnsToUpdate;
      -[NSBatchUpdateRequest _setValidatedPropertiesToUpdate:]((id *)&self->super.super.isa, v13);

      return;
    }

- (void)_setSecureOperation:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_flags = (_requestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)_secureOperation
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPredicate:(NSPredicate *)predicate
{
}

@end