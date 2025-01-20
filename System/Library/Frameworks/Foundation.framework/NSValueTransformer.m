@interface NSValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
+ (NSArray)valueTransformerNames;
+ (NSValueTransformer)valueTransformerForName:(NSValueTransformerName)name;
+ (void)_warnAboutInscureArchiverCitingOffender:(uint64_t)a1;
+ (void)setValueTransformer:(NSValueTransformer *)transformer forName:(NSValueTransformerName)name;
- (id)_initForFoundationOnly;
- (id)reverseTransformedValue:(id)value;
- (id)transformedValue:(id)value;
@end

@implementation NSValueTransformer

+ (void)setValueTransformer:(NSValueTransformer *)transformer forName:(NSValueTransformerName)name
{
  if (name)
  {
    os_unfair_lock_lock(&stru_18C496CAC);
    TransformerRegistry = (void *)_getTransformerRegistry();
    if (transformer) {
      [TransformerRegistry setObject:transformer forKey:name];
    }
    else {
      [TransformerRegistry removeObjectForKey:name];
    }

    qword_18C496CB0 = 0LL;
    os_unfair_lock_unlock(&stru_18C496CAC);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Name cannot be nil" userInfo:0]);
    _getTransformerRegistry();
  }

+ (void)_warnAboutInscureArchiverCitingOffender:(uint64_t)a1
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (qword_18C496CB8 != -1) {
    dispatch_once(&qword_18C496CB8, &__block_literal_global_55);
  }
  if ((_MergedGlobals_128 & 1) == 0)
  {
    v3 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      int v4 = 138543362;
      uint64_t v5 = a2;
      _os_log_fault_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_FAULT,  "'%{public}@' should not be used to for un-archiving and will be removed in a future release",  (uint8_t *)&v4,  0xCu);
    }
  }

const char *__62__NSValueTransformer__warnAboutInscureArchiverCitingOffender___block_invoke()
{
  result = getenv("NSValueTransformerDisableDeprecationWarnings");
  if (result)
  {
    result = (const char *)strncmp(result, "YES", 3uLL);
    if (!(_DWORD)result) {
      _MergedGlobals_128 = 1;
    }
  }

  return result;
}

+ (NSValueTransformer)valueTransformerForName:(NSValueTransformerName)name
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (name)
  {
    if (name == (NSValueTransformerName)@"NSKeyedUnarchiveFromData"
      || name == (NSValueTransformerName)@"NSUnarchiveFromData")
    {
      +[NSValueTransformer _warnAboutInscureArchiverCitingOffender:]( (uint64_t)&OBJC_CLASS___NSValueTransformer,  (uint64_t)name);
    }

    os_unfair_lock_lock(&stru_18C496CAC);
    Class v7 = (Class)(id)[(id)_getTransformerRegistry() objectForKey:name];
    os_unfair_lock_unlock(&stru_18C496CAC);
    if (v7) {
      return (NSValueTransformer *)v7;
    }
    Class v7 = NSClassFromString(name);
    if (dyld_program_sdk_at_least())
    {
      if (!v7) {
        return (NSValueTransformer *)v7;
      }
      if (!-[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class()))
      {
        v9 = (os_log_s *)_NSOSLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = 138543618;
          v11 = _NSMethodExceptionProem((objc_class *)a1, a2);
          __int16 v12 = 2114;
          NSValueTransformerName v13 = name;
          _os_log_error_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@: '%{public}@' is not a subclass of NSValueTransformer.",  (uint8_t *)&v10,  0x16u);
        }

        Class v7 = 0LL;
        return (NSValueTransformer *)v7;
      }
    }

    else if (!v7)
    {
      return (NSValueTransformer *)v7;
    }

    Class v7 = (Class)objc_alloc_init(v7);
    [a1 setValueTransformer:v7 forName:name];
    return (NSValueTransformer *)v7;
  }

  return 0LL;
}

+ (NSArray)valueTransformerNames
{
  v2 = (void *)qword_18C496CB0;
  if (!qword_18C496CB0)
  {
    v2 = (void *)objc_msgSend((id)objc_msgSend((id)_getTransformerRegistry(), "allKeys"), "copy");
    qword_18C496CB0 = (uint64_t)v2;
  }

  id v3 = v2;
  os_unfair_lock_unlock(&stru_18C496CAC);
  return (NSArray *)v3;
}

+ (Class)transformedValueClass
{
  return 0LL;
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)value
{
  return value;
}

- (id)reverseTransformedValue:(id)value
{
  if ([(id)objc_opt_class() allowsReverseTransformation]) {
    return -[NSValueTransformer transformedValue:](self, "transformedValue:", value);
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Transformer does not support reverse transformations" userInfo:0]);
  return -[NSValueTransformer _initForFoundationOnly](v6, v7);
}

- (id)_initForFoundationOnly
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSValueTransformer;
  return -[NSValueTransformer init](&v3, sel_init);
}

@end