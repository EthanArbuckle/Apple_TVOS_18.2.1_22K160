@interface NSEntityMigrationPolicy
- (BOOL)beginEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error;
- (BOOL)createDestinationInstancesForSourceInstance:(NSManagedObject *)sInstance entityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error;
- (BOOL)createRelationshipsForDestinationInstance:(NSManagedObject *)dInstance entityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error;
- (BOOL)endEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error;
- (BOOL)endInstanceCreationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error;
- (BOOL)endRelationshipCreationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error;
- (BOOL)performCustomValidationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error;
- (id)_nonNilValueOrDefaultValueForAttribute:(id)a3 source:(id)a4 destination:(id)a5;
@end

@implementation NSEntityMigrationPolicy

- (BOOL)beginEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  return 1;
}

- (BOOL)createDestinationInstancesForSourceInstance:(NSManagedObject *)sInstance entityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v10 = -[NSEntityMapping destinationEntityName](mapping, "destinationEntityName");
  if (v10)
  {
    v10 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  v10,  -[NSMigrationManager destinationContext](manager, "destinationContext"));
    if (v10)
    {
      v11 = v10;
      v12 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  manager,  @"manager",  sInstance,  @"source",  v10,  @"destination",  mapping,  @"entityMapping",  self,  @"entityPolicy",  0);
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      v23 = mapping;
      v13 = -[NSEntityMapping attributeMappings](mapping, "attributeMappings");
      uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          uint64_t v17 = 0LL;
          do
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
            if (manager) {
              migrationContext = manager->_migrationContext;
            }
            else {
              migrationContext = 0LL;
            }
            -[NSMigrationContext setCurrentPropertyMapping:]( (uint64_t)migrationContext,  *(void **)(*((void *)&v24 + 1) + 8 * v17));
            if ([v18 valueExpression])
            {
              v20 = (void *)[v12 mutableCopy];
              [v20 setValue:v18 forKey:@"propertyMapping"];
              -[NSString setValue:forKey:]( v11,  "setValue:forKey:",  objc_msgSend((id)objc_msgSend(v18, "valueExpression"), "expressionValueWithObject:context:", 0, v20),  objc_msgSend(v18, "name"));
            }

            ++v17;
          }

          while (v15 != v17);
          uint64_t v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
          uint64_t v15 = v21;
        }

        while (v21);
      }

      -[NSMigrationManager associateSourceInstance:withDestinationInstance:forEntityMapping:]( manager,  "associateSourceInstance:withDestinationInstance:forEntityMapping:",  sInstance,  v11,  v23);
      LOBYTE(v10) = 1;
    }
  }

  return (char)v10;
}

- (BOOL)endInstanceCreationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  return 1;
}

- (BOOL)createRelationshipsForDestinationInstance:(NSManagedObject *)dInstance entityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  v10 = -[NSEntityMapping name](mapping, "name");
  v11 = -[NSMigrationManager sourceInstancesForEntityMappingNamed:destinationInstances:]( manager,  "sourceInstancesForEntityMappingNamed:destinationInstances:",  v10,  [MEMORY[0x189603F18] arrayWithObject:dInstance]);
  if (-[NSArray count](v11, "count"))
  {
    if (-[NSArray count](v11, "count") >= 2)
    {
      if (error)
      {
        v12 = (void *)MEMORY[0x189607870];
        uint64_t v13 = *MEMORY[0x189607460];
        uint64_t v14 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"More than one source for destination in default mapping policy",  @"reason",  v11,  @"source",  dInstance,  @"destination",  0);
        goto LABEL_7;
      }

      return 0;
    }

    v47 = error;
    id v20 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  manager,  @"manager",  -[NSArray objectAtIndex:](v11, "objectAtIndex:", 0),  @"source",  dInstance,  @"destination",  mapping,  @"entityMapping",  self,  @"entityPolicy",  0);
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    uint64_t v21 = -[NSEntityMapping relationshipMappings](mapping, "relationshipMappings");
    uint64_t v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v49,  v53,  16LL);
    if (!v22) {
      return 1;
    }
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v50;
LABEL_11:
    uint64_t v25 = 0LL;
    while (1)
    {
      if (*(void *)v50 != v24) {
        objc_enumerationMutation(v21);
      }
      __int128 v26 = *(void **)(*((void *)&v49 + 1) + 8 * v25);
      if (manager) {
        migrationContext = manager->_migrationContext;
      }
      else {
        migrationContext = 0LL;
      }
      -[NSMigrationContext setCurrentPropertyMapping:]( (uint64_t)migrationContext,  *(void **)(*((void *)&v49 + 1) + 8 * v25));
      if (![v26 valueExpression]) {
        goto LABEL_54;
      }
      v28 = -[NSMigrationManager destinationEntityForEntityMapping:]( manager,  "destinationEntityForEntityMapping:",  mapping);
      uint64_t v29 = [v26 name];
      if (v28) {
        id v30 = -[NSDictionary objectForKey:]( -[NSEntityDescription propertiesByName](v28, "propertiesByName"),  "objectForKey:",  v29);
      }
      else {
        id v30 = 0LL;
      }
      id v31 = (id)[v20 mutableCopy];
      [v31 setValue:v26 forKey:@"propertyMapping"];
      v32 = (void *)objc_msgSend( (id)objc_msgSend(v26, "valueExpression"),  "expressionValueWithObject:context:",  0,  v31);
      if ([v30 isToMany])
      {
        if (![v30 isOrdered])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              uint64_t v36 = [v32 set];
              goto LABEL_52;
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              uint64_t v36 = [MEMORY[0x189604010] setWithArray:v32];
              goto LABEL_52;
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              uint64_t v36 = [MEMORY[0x189604010] setWithObject:v32];
LABEL_52:
              v32 = (void *)v36;
            }

            else
            {
              if (v32)
              {
                error = v47;
                if (!v47) {
                  return 0;
                }
                v40 = (void *)MEMORY[0x189607870];
                uint64_t v41 = *MEMORY[0x189607460];
                v42 = (void *)MEMORY[0x189603F68];
                v46 = dInstance;
                v45 = v32;
                v44 = v26;
                v43 = @"Unknown/unsupported type for toMany relationship destination";
                goto LABEL_72;
              }

              v32 = (void *)NSSet_EmptySet;
            }
          }

          objc_msgSend( -[NSManagedObject mutableSetValueForKey:](dInstance, "mutableSetValueForKey:", objc_msgSend(v26, "name")),  "unionSet:",  v32);
          goto LABEL_54;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v33 = [MEMORY[0x189603FF0] orderedSetWithSet:v32];
            goto LABEL_48;
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v33 = [MEMORY[0x189603FF0] orderedSetWithArray:v32];
            goto LABEL_48;
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v33 = [MEMORY[0x189603FF0] orderedSetWithObject:v32];
LABEL_48:
            v32 = (void *)v33;
          }

          else
          {
            if (v32)
            {
              error = v47;
              if (!v47) {
                return 0;
              }
              v40 = (void *)MEMORY[0x189607870];
              uint64_t v41 = *MEMORY[0x189607460];
              v42 = (void *)MEMORY[0x189603F68];
              v46 = dInstance;
              v45 = v32;
              v44 = v26;
              v43 = @"Unknown/unsupported type for ordered toMany relationship destination";
              goto LABEL_72;
            }

            v32 = (void *)NSOrderedSet_EmptyOrderedSet;
          }
        }

        id v38 = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]( (uint64_t)_PFRoutines,  v32,  -[NSManagedObject valueForKey:](dInstance, "valueForKey:", [v26 name]));
        -[NSManagedObject setValue:forKey:](dInstance, "setValue:forKey:", v38, [v26 name]);

        goto LABEL_54;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v34 = [v32 count];
        if (!v34) {
          goto LABEL_37;
        }
        if (v34 != 1) {
          goto LABEL_64;
        }
        uint64_t v35 = [v32 anyObject];
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 && v32)
            {
              error = v47;
              if (!v47) {
                return 0;
              }
              v40 = (void *)MEMORY[0x189607870];
              uint64_t v41 = *MEMORY[0x189607460];
              v42 = (void *)MEMORY[0x189603F68];
              v46 = dInstance;
              v45 = v32;
              v44 = v26;
              v43 = @"Unknown/unsupported type for toOne relationship destination";
              goto LABEL_72;
            }

            goto LABEL_38;
          }
        }

        uint64_t v37 = [v32 count];
        if (!v37)
        {
LABEL_37:
          v32 = 0LL;
          goto LABEL_38;
        }

        if (v37 != 1)
        {
LABEL_64:
          error = v47;
          if (!v47) {
            return 0;
          }
          v40 = (void *)MEMORY[0x189607870];
          uint64_t v41 = *MEMORY[0x189607460];
          v42 = (void *)MEMORY[0x189603F68];
          v46 = dInstance;
          v45 = v32;
          v44 = v26;
          v43 = @"More than one relationship destination for a toOne relationship";
LABEL_72:
          uint64_t v15 = objc_msgSend( v42,  "dictionaryWithObjectsAndKeys:",  v43,  @"reason",  mapping,  @"entityMapping",  v44,  @"propertyMapping",  v45,  @"relationshipDestinations",  v46,  @"destination",  0);
          uint64_t v16 = v40;
          uint64_t v17 = v41;
          goto LABEL_8;
        }

        uint64_t v35 = [v32 lastObject];
      }

      v32 = (void *)v35;
LABEL_38:
      -[NSManagedObject setValue:forKey:](dInstance, "setValue:forKey:", v32, [v26 name]);
LABEL_54:
      if (v23 == ++v25)
      {
        uint64_t v39 = -[NSArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v49,  v53,  16LL);
        uint64_t v23 = v39;
        if (!v39) {
          return 1;
        }
        goto LABEL_11;
      }
    }
  }

  if (!error) {
    return 0;
  }
  v12 = (void *)MEMORY[0x189607870];
  uint64_t v13 = *MEMORY[0x189607460];
  uint64_t v14 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Can't find source for destination in default mapping policy",  @"reason",  v11,  @"source",  dInstance,  @"destination",  0);
LABEL_7:
  uint64_t v15 = v14;
  uint64_t v16 = v12;
  uint64_t v17 = v13;
LABEL_8:
  v18 = (NSError *)[v16 errorWithDomain:v17 code:134110 userInfo:v15];
  BOOL result = 0;
  *error = v18;
  return result;
}

- (BOOL)endRelationshipCreationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  return 1;
}

- (BOOL)performCustomValidationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  return 1;
}

- (BOOL)endEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  return 1;
}

- (id)_nonNilValueOrDefaultValueForAttribute:(id)a3 source:(id)a4 destination:(id)a5
{
  id v6 = -[NSEntityDescription _attributeNamed:]([a5 entity], (uint64_t)a3);
  id result = (id)objc_msgSend( a4,  "valueForKey:",  objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a4, "entity"),  "_propertyWithRenamingIdentifier:",  objc_msgSend(v6, "renamingIdentifier")),  "name"));
  if (!result) {
    return (id)[v6 defaultValue];
  }
  return result;
}

@end