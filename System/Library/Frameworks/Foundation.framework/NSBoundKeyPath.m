@interface NSBoundKeyPath
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)keyPathWithRootObject:(id)a3 path:(const char *)a4;
+ (id)newKeyPathWithRootObject:(id)a3 keyPathString:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)validateValue:(id *)a3 error:(id *)a4;
- (NSString)keyPath;
- (id)mutableArrayValue;
- (id)mutableOrderedSetValue;
- (id)mutableSetValue;
- (id)rootObject;
- (id)value;
- (unint64_t)hash;
- (void)dealloc;
- (void)setRootObject:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation NSBoundKeyPath

+ (id)newKeyPathWithRootObject:(id)a3 keyPathString:(id)a4
{
  Instance = class_createInstance((Class)a1, 0LL);
  Instance[2] = a4;
  [Instance setRootObject:a3];
  return Instance;
}

+ (id)keyPathWithRootObject:(id)a3 path:(const char *)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v6 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", a4);
  uint64_t v10 = objc_opt_class();
  id v11 = a3;
  v12 = v6;
  os_unfair_lock_lock_with_options();
  Mutable = (const __CFSet *)qword_18C494A70;
  if (!qword_18C494A70)
  {
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, &keyPathWithRootObject_path__callbacks);
    qword_18C494A70 = (uint64_t)Mutable;
  }

  v8 = (id)CFSetGetValue(Mutable, &v10);
  if (!v8)
  {
    v8 = (void *)objc_msgSend(a1, "newKeyPathWithRootObject:keyPathString:", a3, v6, v10, v11, v12, v13);
    if (v8) {
      CFSetAddValue((CFMutableSetRef)qword_18C494A70, v8);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_19_0);

  return v8;
}

- (NSString)keyPath
{
  return (NSString *)(id)-[NSString copy](self->_keyPath, "copy");
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock_with_options();
  if (qword_18C494A70) {
    CFSetRemoveValue((CFMutableSetRef)qword_18C494A70, self);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_19_0);
  objc_storeWeak(&self->_rootObject, 0LL);

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSBoundKeyPath;
  -[NSBoundKeyPath dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 == self) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = (void *)[a3 rootObject];
  return v5 == -[NSBoundKeyPath rootObject](self, "rootObject");
}

- (unint64_t)hash
{
  return -[NSString hash](self->_keyPath, "hash");
}

- (void)setRootObject:(id)a3
{
}

- (id)rootObject
{
  return objc_loadWeak(&self->_rootObject);
}

- (BOOL)validateValue:(id *)a3 error:(id *)a4
{
  return objc_msgSend( -[NSBoundKeyPath rootObject](self, "rootObject"),  "validateValue:forKeyPath:error:",  a3,  self->_keyPath,  a4);
}

- (id)value
{
  return (id)objc_msgSend(-[NSBoundKeyPath rootObject](self, "rootObject"), "valueForKeyPath:", self->_keyPath);
}

- (void)setValue:(id)a3
{
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)mutableArrayValue
{
  return (id)objc_msgSend( -[NSBoundKeyPath rootObject](self, "rootObject"),  "mutableArrayValueForKeyPath:",  self->_keyPath);
}

- (id)mutableOrderedSetValue
{
  return (id)objc_msgSend( -[NSBoundKeyPath rootObject](self, "rootObject"),  "mutableOrderedSetValueForKeyPath:",  self->_keyPath);
}

- (id)mutableSetValue
{
  return (id)objc_msgSend( -[NSBoundKeyPath rootObject](self, "rootObject"),  "mutableSetValueForKeyPath:",  self->_keyPath);
}

- (void).cxx_destruct
{
}

@end