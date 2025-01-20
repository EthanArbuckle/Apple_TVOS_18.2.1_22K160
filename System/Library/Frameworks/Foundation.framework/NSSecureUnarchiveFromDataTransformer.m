@interface NSSecureUnarchiveFromDataTransformer
+ (NSArray)allowedTopLevelClasses;
- (id)description;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation NSSecureUnarchiveFromDataTransformer

+ (NSArray)allowedTopLevelClasses
{
  v4[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = [(id)objc_opt_class() transformedValueClass];
  if (v2)
  {
    v4[0] = v2;
    return (NSArray *)[MEMORY[0x189603F18] arrayWithObjects:v4 count:1];
  }

  else
  {
    if (qword_18C496CC8 != -1) {
      dispatch_once(&qword_18C496CC8, &__block_literal_global_67_0);
    }
    return (NSArray *)qword_18C496CC0;
  }

uint64_t __62__NSSecureUnarchiveFromDataTransformer_allowedTopLevelClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x189603F18]);
  uint64_t result = objc_msgSend( v0,  "initWithObjects:",  MEMORY[0x189603F18],  MEMORY[0x189603F68],  MEMORY[0x189604010],  NSString,  NSNumber,  MEMORY[0x189603F50],  MEMORY[0x189603F48],  objc_opt_class(),  NSUUID,  MEMORY[0x189603FE8],  0);
  qword_18C496CC0 = result;
  return result;
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  v18[1] = *MEMORY[0x1895F89C0];
  if (!a3) {
    return v3;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x189603F70];
    v11 = (const __CFString *)*MEMORY[0x189603A60];
    v12 = @"Cannot unarchive type from non-NSData object.";
    uint64_t v9 = 0LL;
    goto LABEL_10;
  }

  v4 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithArray:",  objc_msgSend((id)objc_opt_class(), "allowedTopLevelClasses"));
  id v16 = 0LL;
  id v3 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v4,  v3,  &v16);

  if (v3 || v16 == 0LL) {
    return v3;
  }
  v7 = (void *)MEMORY[0x189603F70];
  uint64_t v8 = [v16 localizedDescription];
  v17 = @"NSUnderlyingError";
  v18[0] = v16;
  uint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v10 = v7;
  v11 = @"NSInvalidUnarchiveOperationException";
  v12 = (const __CFString *)v8;
LABEL_10:
  objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v12 userInfo:v9]);
  return -[NSSecureUnarchiveFromDataTransformer reverseTransformedValue:](v13, v14, v15);
}

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  v4 = (void *)[(id)objc_opt_class() allowedTopLevelClasses];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (!v5)
  {
LABEL_10:
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Object of class %@ is not among allowed top level class list %@",  objc_opt_class(),  v4);
    v10 = (void *)MEMORY[0x189603F70];
    v11 = (const __CFString *)*MEMORY[0x189603A60];
    uint64_t v12 = 0LL;
LABEL_16:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v9 userInfo:v12]);
    return 0LL;
  }

  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v22;
LABEL_4:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v22 != v7) {
      objc_enumerationMutation(v4);
    }
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      break;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v20 count:16];
      if (v6) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  id v17 = 0LL;
  id result = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v17);
  if (result) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v17 == 0LL;
  }
  if (!v14)
  {
    id v15 = (void *)MEMORY[0x189603F70];
    uint64_t v16 = [v17 localizedDescription];
    v18 = @"NSUnderlyingError";
    id v19 = v17;
    uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v10 = v15;
    v11 = @"NSInvalidArchiveOperationException";
    uint64_t v9 = (NSString *)v16;
    goto LABEL_16;
  }

  return result;
}

- (id)description
{
  return @"<shared NSSecureUnarchiveFromData transformer>";
}

@end