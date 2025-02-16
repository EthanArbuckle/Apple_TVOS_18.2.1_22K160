@interface NSConstraintConflict
+ (BOOL)supportsSecureCoding;
- (BOOL)_isDBConflict;
- (NSArray)conflictingObjects;
- (NSArray)conflictingSnapshots;
- (NSArray)constraint;
- (NSConstraintConflict)initWithCoder:(id)a3;
- (NSConstraintConflict)initWithConstraint:(NSArray *)contraint databaseObject:(NSManagedObject *)databaseObject databaseSnapshot:(NSDictionary *)databaseSnapshot conflictingObjects:(NSArray *)conflictingObjects conflictingSnapshots:(NSArray *)conflictingSnapshots;
- (NSDictionary)constraintValues;
- (NSDictionary)databaseSnapshot;
- (NSManagedObject)databaseObject;
- (id)debugDescription;
- (id)description;
- (void)_doCleanupForXPCStore:(id)a3 context:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSConstraintConflict

- (NSConstraintConflict)initWithConstraint:(NSArray *)contraint databaseObject:(NSManagedObject *)databaseObject databaseSnapshot:(NSDictionary *)databaseSnapshot conflictingObjects:(NSArray *)conflictingObjects conflictingSnapshots:(NSArray *)conflictingSnapshots
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___NSConstraintConflict;
  v12 = -[NSConstraintConflict init](&v32, sel_init);
  if (v12)
  {
    v27 = conflictingSnapshots;
    v12->_constraint = contraint;
    v12->_databaseObject = databaseObject;
    v12->_databaseSnapshot = databaseSnapshot;
    v12->_conflictingObjects = conflictingObjects;
    v12->_conflictedValues = (NSDictionary *)-[NSKnownKeysDictionary initForKeys:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initForKeys:",  contraint);
    id v13 = -[NSArray lastObject](conflictingObjects, "lastObject");
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( contraint,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
    if (!v14) {
      goto LABEL_21;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    while (1)
    {
      v17 = contraint;
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v17);
        }
        v19 = *(void **)(*((void *)&v28 + 1) + 8 * v18);
        v20 = (void *)[v19 componentsSeparatedByString:@"."];
        if ((unint64_t)[v20 count] < 2)
        {
          v22 = (void *)[v13 valueForKey:v19];
          if (!v22) {
            goto LABEL_15;
          }
        }

        else
        {
          if (![v20 count]) {
            goto LABEL_15;
          }
          unint64_t v21 = 0LL;
          v22 = 0LL;
          do
          {
            uint64_t v23 = [v20 objectAtIndex:v21];
            if (v21) {
              uint64_t v24 = [v22 objectForKey:v23];
            }
            else {
              uint64_t v24 = [v13 valueForKey:v23];
            }
            v22 = (void *)v24;
            ++v21;
          }

          while ([v20 count] > v21);
          if (!v22) {
LABEL_15:
          }
            v22 = (void *)[MEMORY[0x189603FE8] null];
        }

        -[NSDictionary setValue:forKey:](v12->_conflictedValues, "setValue:forKey:", v22, v19);
        ++v18;
      }

      while (v18 != v15);
      contraint = v17;
      uint64_t v25 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
      uint64_t v15 = v25;
      if (!v25)
      {
LABEL_21:
        v12->_conflictingSnapshots = v27;
        return v12;
      }
    }
  }

  return v12;
}

- (void)dealloc
{
  self->_constraint = 0LL;
  self->_databaseSnapshot = 0LL;

  self->_databaseObject = 0LL;
  self->_conflictingSnapshots = 0LL;

  self->_conflictingObjects = 0LL;
  self->_conflictedValues = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConstraintConflict;
  -[NSConstraintConflict dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 delegate] && (objc_msgSend(a3, "delegate"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    [a3 encodeObject:self->_constraint forKey:@"_constraint"];
    [a3 encodeObject:self->_conflictedValues forKey:@"_conflictedValues"];
    [a3 encodeObject:self->_databaseObject forKey:@"_databaseObject"];
    [a3 encodeObject:self->_databaseSnapshot forKey:@"_databaseSnapshot"];
    [a3 encodeObject:self->_conflictingObjects forKey:@"_conflictingObjects"];
  }

  else
  {
    uint64_t v5 = objc_opt_class();
    NSLog((NSString *)@"Coder = %@ (%@)", a3, v5);
    uint64_t v6 = [a3 delegate];
    [a3 delegate];
    uint64_t v7 = objc_opt_class();
    NSLog((NSString *)@"Delegate = %@ (%@)", v6, v7);
    NSLog( (NSString *)@"CoreData does not support encoding of conflict objects. Conflicts need to be resolved within the scope of a valid managed object context and should not be archived or serialized: %@",  self);
    __break(1u);
  }

- (NSConstraintConflict)initWithCoder:(id)a3
{
  if ([a3 requiresSecureCoding]
    && (objc_opt_respondsToSelector() & 1) != 0
    && ![a3 userInfo]
    && !objc_msgSend((id)objc_msgSend(a3, "userInfo"), "valueForKey:", @"PSCKey")
    || ([a3 requiresSecureCoding] & 1) == 0 && !objc_msgSend(a3, "delegate"))
  {
    NSLog((NSString *)@"This is probably not where you want to be");
  }

  uint64_t v5 = (void *)MEMORY[0x189604010];
  uint64_t v6 = objc_opt_class();
  self->_constraint = (NSArray *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0),  @"_constraint");
  self->_conflictedValues = (NSDictionary *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(a3, "allowedClasses"),  @"_conflictedValues");
  self->_databaseObject = (NSManagedObject *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(a3, "allowedClasses"),  @"_databaseObject");
  self->_databaseSnapshot = (NSDictionary *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(a3, "allowedClasses"),  @"_databaseSnapshot");
  self->_conflictingObjects = (NSArray *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(a3, "allowedClasses"),  @"_conflictingObjects");
  return self;
}

- (void)_doCleanupForXPCStore:(id)a3 context:(id)a4
{
  uint64_t v6 = objc_msgSend(a4, "objectWithID:", -[NSArray firstObject](self->_conflictingObjects, "firstObject", a3));

  self->_conflictingObjects = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v6, 0);
  uint64_t v7 = (NSManagedObject *)(id)[a4 objectWithID:self->_databaseObject];

  self->_databaseObject = v7;
  id v8 = objc_alloc(MEMORY[0x189603F18]);
  v9 = -[NSArray firstObject](self->_conflictingObjects, "firstObject");
  if (v9 && (uint64_t v10 = v9[6]) != 0) {
    uint64_t v11 = *(void *)(v10 + 8);
  }
  else {
    uint64_t v11 = 0LL;
  }
  self->_conflictingSnapshots = (NSArray *)objc_msgSend(v8, "initWithObjects:", v11, 0);
}

- (id)description
{
  id v3 = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]( (uint64_t)&OBJC_CLASS____PFRoutines,  -[NSConstraintConflict conflictingObjects](self, "conflictingObjects"));
  return (id)[NSString stringWithFormat:@"%@ (%p) for constraint %@: database: %@, conflictedObjects: %@", objc_opt_class(), self, -[NSConstraintConflict constraint](self, "constraint"), -[NSManagedObject objectID](-[NSConstraintConflict databaseObject](self, "databaseObject"), "objectID"), v3];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"%@ (%p) for constraint %@: database: %@, conflictedObjects: %@", objc_opt_class(), self, -[NSConstraintConflict constraint](self, "constraint"), -[NSConstraintConflict databaseObject](self, "databaseObject"), -[NSConstraintConflict conflictingObjects](self, "conflictingObjects")];
}

- (BOOL)_isDBConflict
{
  return self->_databaseObject != 0LL;
}

- (NSArray)constraint
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSArray)conflictingObjects
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSDictionary)constraintValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSArray)conflictingSnapshots
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSManagedObject)databaseObject
{
  return (NSManagedObject *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSDictionary)databaseSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

@end