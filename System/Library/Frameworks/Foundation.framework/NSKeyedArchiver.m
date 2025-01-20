@interface NSKeyedArchiver
+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path;
+ (NSData)archivedDataWithRootObject:(id)object requiringSecureCoding:(BOOL)requiresSecureCoding error:(NSError *)error;
+ (NSData)archivedDataWithRootObject:(id)rootObject;
+ (NSString)classNameForClass:(Class)cls;
+ (void)initialize;
+ (void)setClassName:(NSString *)codedName forClass:(Class)cls;
- (BOOL)_allowsValueCoding;
- (BOOL)allowsKeyedCoding;
- (BOOL)requiresSecureCoding;
- (NSData)encodedData;
- (NSKeyedArchiver)init;
- (NSKeyedArchiver)initRequiringSecureCoding:(BOOL)requiresSecureCoding;
- (NSPropertyListFormat)outputFormat;
- (NSString)classNameForClass:(Class)cls;
- (id)_blobForCurrentObject;
- (id)_initWithOutput:(id)a3;
- (id)delegate;
- (id)description;
- (int64_t)versionForClassName:(id)a3;
- (unsigned)systemVersion;
- (void)_encodeArrayOfObjects:(id)a3 forKey:(id)a4;
- (void)_encodePropertyList:(id)a3 forKey:(id)a4;
- (void)_setBlobForCurrentObject:(id)a3;
- (void)dealloc;
- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5;
- (void)encodeBool:(BOOL)value forKey:(NSString *)key;
- (void)encodeBytes:(const uint8_t *)bytes length:(NSUInteger)length forKey:(NSString *)key;
- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4;
- (void)encodeConditionalObject:(id)a3;
- (void)encodeConditionalObject:(id)object forKey:(NSString *)key;
- (void)encodeDouble:(double)value forKey:(NSString *)key;
- (void)encodeFloat:(float)value forKey:(NSString *)key;
- (void)encodeInt32:(int32_t)value forKey:(NSString *)key;
- (void)encodeInt64:(int64_t)value forKey:(NSString *)key;
- (void)encodeInt:(int)value forKey:(NSString *)key;
- (void)encodeObject:(id)a3;
- (void)encodeObject:(id)object forKey:(NSString *)key;
- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4;
- (void)encodeValuesOfObjCTypes:(const char *)a3;
- (void)finishEncoding;
- (void)replaceObject:(id)a3 withObject:(id)a4;
- (void)setClassName:(NSString *)codedName forClass:(Class)cls;
- (void)setDelegate:(id)delegate;
- (void)setOutputFormat:(NSPropertyListFormat)outputFormat;
- (void)setRequiresSecureCoding:(BOOL)requiresSecureCoding;
@end

@implementation NSKeyedArchiver

+ (void)initialize
{
  if (&OBJC_CLASS___NSKeyedArchiver == a1)
  {
    if (getenv("NSWarnAboutOldStyleArchiverMethods")) {
      _warnArchiverCompat = 1;
    }
    +[NSKeyedArchiver setClassName:forClass:]( &OBJC_CLASS___NSKeyedArchiver,  "setClassName:forClass:",  @"NSLocalTimeZone",  objc_lookUpClass("__NSLocalTimeZone"));
    +[NSKeyedArchiver setClassName:forClass:]( &OBJC_CLASS___NSKeyedArchiver,  "setClassName:forClass:",  @"NSLocalTimeZone",  objc_lookUpClass("__NSLocalTimeZoneI"));
  }

- (void)_setBlobForCurrentObject:(id)a3
{
  uint64_t v5 = -[NSMutableArray count](self->_containers, "count") - 1;
  -[NSMutableArray addObject:](self->_containers, "addObject:", a3);
  -[NSMutableArray removeObjectAtIndex:](self->_containers, "removeObjectAtIndex:", v5);
}

- (id)_blobForCurrentObject
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:]( self->_containers,  "objectAtIndexedSubscript:",  -[NSMutableArray count](self->_containers, "count") - 1);
}

- (NSKeyedArchiver)initRequiringSecureCoding:(BOOL)requiresSecureCoding
{
  BOOL v3 = requiresSecureCoding;
  v4 = -[NSKeyedArchiver init](self, "init");
  -[NSKeyedArchiver setRequiresSecureCoding:](v4, "setRequiresSecureCoding:", v3);
  return v4;
}

+ (NSData)archivedDataWithRootObject:(id)object requiringSecureCoding:(BOOL)requiresSecureCoding error:(NSError *)error
{
  v6 = (void *)[objc_alloc((Class)a1) initRequiringSecureCoding:requiresSecureCoding];
  [v6 encodeObject:object forKey:@"root"];
  v7 = (NSData *)[v6 encodedData];
  [v6 finishEncoding];

  return v7;
}

- (NSKeyedArchiver)init
{
  return (NSKeyedArchiver *)-[NSKeyedArchiver _initWithOutput:]( self,  "_initWithOutput:",  (id)objc_opt_new());
}

- (id)_initWithOutput:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  self->_stream = (void *)CFRetain(a3);
  atomic_store(0xC80000uLL, &self->_flags);
  self->_delegate = 0LL;
  self->_containers = 0LL;
  self->_objects = 0LL;
  self->_objRefMap = 0LL;
  self->_replacementMap = 0LL;
  self->_classNameMap = 0LL;
  self->_conditionals = 0LL;
  self->_classes = 0LL;
  self->_visited = 0LL;
  self->_cache = 0LL;
  self->_cacheSize = 0LL;
  self->_estimatedCount = 0LL;
  self->_containers = (NSMutableArray *)objc_opt_new();
  self->_objects = (NSMutableArray *)objc_opt_new();
  _CFArraySetCapacity();
  -[NSMutableArray addObject:](self->_objects, "addObject:", @"$null");
  keyCallBacks.version = 0LL;
  keyCallBacks.retain = (CFDictionaryRetainCallBack)__karetain;
  keyCallBacks.release = (CFDictionaryReleaseCallBack)__karelease;
  memset(&keyCallBacks.copyDescription, 0, 24);
  self->_objRefMap = CFDictionaryCreateMutable(0LL, 0LL, &keyCallBacks, 0LL);
  _CFDictionarySetCapacity();
  self->_conditionals = CFDictionaryCreateMutable(0LL, 0LL, &keyCallBacks, 0LL);
  v4 = (void *)objc_opt_new();
  _CFDictionarySetCapacity();
  -[NSMutableArray addObject:](self->_containers, "addObject:", v4);
  ++self->_estimatedCount;

  unint64_t v5 = atomic_load(&self->_flags);
  atomic_store(v5 & 0xFFFFFFFFFFFFFFFELL, &self->_flags);
  self->_genericKey = 0LL;
  return self;
}

+ (NSData)archivedDataWithRootObject:(id)rootObject
{
  unint64_t v5 = (NSData *)(id)[objc_allocWithZone(MEMORY[0x189603FB8]) initWithLength:0];
  v6 = (void *)MEMORY[0x186E1FF60]();
  id v7 = (id)[objc_allocWithZone((Class)a1) initForWritingWithMutableData:v5];
  [v7 encodeObject:rootObject forKey:@"root"];
  [v7 finishEncoding];
  objc_autoreleasePoolPop(v6);
  return v5;
}

+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path
{
  v17[1] = *(NSString **)MEMORY[0x1895F89C0];
  id v7 = (void *)MEMORY[0x186E1FF60](a1, a2);
  if (_NSCreateTemporaryFile(path, v17, 0LL, &v16, 0LL))
  {
    uint64_t v8 =  CFWriteStreamCreateWithFile( 0,  (CFURLRef)[MEMORY[0x189604030] fileURLWithPath:v17[0] isDirectory:0]);
    int v9 = CFWriteStreamOpen(v8);
    CFStreamStatus Status = CFWriteStreamGetStatus(v8);
    char v11 = 0;
    if (v9) {
      BOOL v12 = Status == kCFStreamStatusOpen;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      id v13 = (id)[objc_allocWithZone((Class)a1) _initWithOutput:v8];
      [v13 encodeObject:rootObject forKey:@"root"];
      [v13 finishEncoding];
      CFStreamStatus v14 = CFWriteStreamGetStatus(v8);
      CFWriteStreamClose(v8);
      if (v14 == kCFStreamStatusError) {
        char v11 = 0;
      }
      else {
        char v11 = _NSMoveTemporaryFileToDestination(v17[0], path);
      }
    }

    _NSCleanupTemporaryDirectory(v16);
  }

  else
  {
    char v11 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v11;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  char v3 = atomic_load(&self->_flags);
  if ((v3 & 2) == 0)
  {
    unint64_t v5 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = _NSMethodExceptionProem((objc_class *)self, a2);
      _os_log_error_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_ERROR,  "%@: warning: NSKeyedArchiver deallocated without having had -finishEncoding called on it.",  buf,  0xCu);
    }
  }

  unint64_t cacheSize = self->_cacheSize;
  if (cacheSize)
  {
    uint64_t v7 = 0LL;
    unsigned int v8 = 1;
    do
    {
      int v9 = self->_cache[v7];
      if (v9)
      {
        CFRelease(v9);
        unint64_t cacheSize = self->_cacheSize;
      }

      uint64_t v7 = v8;
    }

    while (cacheSize > v8++);
  }

  cache = self->_cache;
  if (cache) {
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x189604DD0], cache);
  }
  stream = self->_stream;
  if (stream) {
    CFRelease(stream);
  }

  objRefMap = self->_objRefMap;
  if (objRefMap) {
    CFRelease(objRefMap);
  }
  replacementMap = self->_replacementMap;
  if (replacementMap) {
    CFRelease(replacementMap);
  }
  classNameMap = self->_classNameMap;
  if (classNameMap) {
    CFRelease(classNameMap);
  }
  conditionals = self->_conditionals;
  if (conditionals) {
    CFRelease(conditionals);
  }
  classes = self->_classes;
  if (classes) {
    CFRelease(classes);
  }
  visited = self->_visited;
  if (visited) {
    CFRelease(visited);
  }
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSKeyedArchiver;
  -[NSKeyedArchiver dealloc](&v19, sel_dealloc);
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyedArchiver;
  return -[NSKeyedArchiver description](&v3, sel_description);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)_allowsValueCoding
{
  return 1;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (NSKeyedArchiverDelegate *)delegate;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setOutputFormat:(NSPropertyListFormat)outputFormat
{
  if (outputFormat == NSPropertyListXMLFormat_v1_0 || outputFormat == NSPropertyListBinaryFormat_v1_0)
  {
    unsigned __int16 v3 = atomic_load(&self->_flags);
    atomic_store(((_DWORD)outputFormat << 16) | (unint64_t)v3, &self->_flags);
  }

  else
  {
    uint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: invalid format (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), outputFormat), 0 reason userInfo];
    objc_exception_throw(v4);
    -[NSKeyedArchiver outputFormat](v5, v6);
  }

- (NSPropertyListFormat)outputFormat
{
  unint64_t v2 = atomic_load(&self->_flags);
  return v2 >> 16;
}

+ (void)setClassName:(NSString *)codedName forClass:(Class)cls
{
  Mutable = (__CFDictionary *)qword_18C496190;
  if (!qword_18C496190)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, 0LL, MEMORY[0x189605250]);
    qword_18C496190 = (uint64_t)Mutable;
  }

  if (codedName) {
    CFDictionarySetValue(Mutable, cls, codedName);
  }
  else {
    CFDictionaryRemoveValue(Mutable, cls);
  }
  os_unfair_lock_unlock(&_MergedGlobals_41);
}

- (void)setClassName:(NSString *)codedName forClass:(Class)cls
{
  classNameMap = self->_classNameMap;
  if (!classNameMap)
  {
    classNameMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, 0LL, MEMORY[0x189605250]);
    self->_classNameMap = classNameMap;
  }

  if (codedName) {
    CFDictionarySetValue(classNameMap, cls, codedName);
  }
  else {
    CFDictionaryRemoveValue(classNameMap, cls);
  }
}

+ (NSString)classNameForClass:(Class)cls
{
  if (qword_18C496190) {
    Value = (NSString *)CFDictionaryGetValue((CFDictionaryRef)qword_18C496190, cls);
  }
  else {
    Value = 0LL;
  }
  os_unfair_lock_unlock(&_MergedGlobals_41);
  return Value;
}

- (NSString)classNameForClass:(Class)cls
{
  result = (NSString *)self->_classNameMap;
  if (result) {
    return (NSString *)CFDictionaryGetValue((CFDictionaryRef)result, cls);
  }
  return result;
}

- (void)finishEncoding
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  int valuePtr = 100000;
  char v2 = atomic_load(&self->_flags);
  if ((v2 & 2) == 0)
  {
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      -[NSKeyedArchiverDelegate archiverWillFinish:](self->_delegate, "archiverWillFinish:", self);
    }
    unint64_t v5 = atomic_load(&self->_flags);
    atomic_store(v5 | 2, &self->_flags);
    SEL v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
    Mutable = CFDictionaryCreateMutable(v6, 8LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    int v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    CFDictionarySetValue(Mutable, @"$archiver", v10);
    CFDictionarySetValue(Mutable, @"$version", v7);
    CFDictionarySetValue(Mutable, @"$objects", self->_objects);
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)self->_containers, 0LL);
    CFDictionarySetValue(Mutable, @"$top", ValueAtIndex);
    CFRelease(v7);
    self->_estimatedCount += 12LL;
    if (-[NSKeyedArchiver outputFormat](self, "outputFormat") == NSPropertyListXMLFormat_v1_0)
    {
      uint64_t XMLDataWithExtras = _CFPropertyListCreateXMLDataWithExtras();
      if (!XMLDataWithExtras)
      {
        objc_super v19 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: could not create XML data", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
        objc_exception_throw(v19);
        -[NSKeyedArchiver encodedData](v20, v21);
        return;
      }

      id v13 = (const __CFData *)XMLDataWithExtras;
      CFTypeID v14 = CFGetTypeID(self->_stream);
      CFTypeID TypeID = CFDataGetTypeID();
      stream = (__CFData *)self->_stream;
      BytePtr = CFDataGetBytePtr(v13);
      CFIndex Length = CFDataGetLength(v13);
      if (v14 == TypeID) {
        CFDataAppendBytes(stream, BytePtr, Length);
      }
      else {
        CFWriteStreamWrite(stream, BytePtr, Length);
      }
      CFRelease(v13);
    }

    else if (-[NSKeyedArchiver outputFormat](self, "outputFormat") == NSPropertyListBinaryFormat_v1_0)
    {
      __CFBinaryPlistWriteToStreamWithOptions();
    }

    CFRelease(Mutable);
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        -[NSKeyedArchiverDelegate archiverDidFinish:](self->_delegate, "archiverDidFinish:", self);
      }
    }
  }

- (NSData)encodedData
{
  if ((_NSIsNSData() & 1) == 0) {
    return (NSData *)[MEMORY[0x189603F48] data];
  }
  char v3 = atomic_load(&self->_flags);
  if ((v3 & 2) == 0) {
    -[NSKeyedArchiver finishEncoding](self, "finishEncoding");
  }
  return (NSData *)self->_stream;
}

- (void)replaceObject:(id)a3 withObject:(id)a4
{
  value[1] = *(void **)MEMORY[0x1895F89C0];
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot replace"), 0 reason userInfo];
    objc_exception_throw(v10);
  }

  if (a3 != a4)
  {
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      -[NSKeyedArchiverDelegate archiver:willReplaceObject:withObject:]( self->_delegate,  "archiver:willReplaceObject:withObject:",  self,  a3,  a4);
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      CFDictionaryRemoveValue(self->_objRefMap, a3);
      CFDictionarySetValue(self->_objRefMap, a4, value[0]);
    }
  }

  if (!self->_replacementMap)
  {
    self->_replacementMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, 0LL, 0LL);
    _CFDictionarySetCapacity();
  }

  visited = self->_visited;
  if (!visited)
  {
    self->_visited = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, 0LL);
    _CFSetSetCapacity();
    visited = self->_visited;
  }

  CFSetAddValue(visited, a3);
  if (a3 != a4) {
    CFDictionarySetValue(self->_replacementMap, a3, a4);
  }
}

- (void)encodeObject:(id)object forKey:(NSString *)key
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    BOOL v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v12);
  }

  else
  {
    SEL v6 = key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0LL) == 36) {
      SEL v6 = (NSString *)[@"$" stringByAppendingString:v6];
    }
    BOOL v8 = self;
    int v9 = v6;
    id v10 = object;
    int v11 = 0;
  }

  _encodeObject((uint64_t)v8, v9, v10, v11);
}

- (void)encodeConditionalObject:(id)object forKey:(NSString *)key
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    BOOL v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v8);
    -[NSKeyedArchiver _encodeArrayOfObjects:forKey:](v9, v10, v11, v12);
  }

  else
  {
    SEL v6 = key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0LL) == 36) {
      SEL v6 = (NSString *)[@"$" stringByAppendingString:v6];
    }
    _encodeObject((uint64_t)self, v6, object, 1);
  }

- (void)_encodeArrayOfObjects:(id)a3 forKey:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v20 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v20);
  }

  SEL v6 = (const __CFString *)a4;
  if (a4 && CFStringGetLength((CFStringRef)a4) >= 1 && CFStringGetCharacterAtIndex(v6, 0LL) == 36) {
    SEL v6 = (const __CFString *)[@"$" stringByAppendingString:v6];
  }
  BOOL v8 = (void *)objc_opt_new();
  _CFArraySetCapacity();
  -[NSMutableArray addObject:](self->_containers, "addObject:", v8);
  ++self->_estimatedCount;

  unint64_t v9 = atomic_load(&self->_flags);
  atomic_store(v9 | 1, &self->_flags);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(a3);
        }
        _encodeObject((uint64_t)self, &stru_189CA6A28, *(void **)(*((void *)&v22 + 1) + 8 * v13++), 0);
      }

      while (v11 != v13);
      uint64_t v11 = [a3 countByEnumeratingWithState:&v22 objects:v21 count:16];
    }

    while (v11);
  }

  uint64_t v14 = -[NSMutableArray count](self->_containers, "count") - 1;
  if (v14 < 0) {
    v15 = 0LL;
  }
  else {
    v15 = (const void *)-[NSMutableArray objectAtIndexedSubscript:](self->_containers, "objectAtIndexedSubscript:", v14);
  }
  CFTypeRef v16 = CFRetain(v15);
  uint64_t v17 = -[NSMutableArray count](self->_containers, "count");
  -[NSMutableArray removeObjectAtIndex:](self->_containers, "removeObjectAtIndex:", v17 - 1);
  if (v17 - 1 >= 1)
  {
    CFTypeID v18 = CFGetTypeID((CFTypeRef)-[NSMutableArray objectAtIndexedSubscript:]( self->_containers,  "objectAtIndexedSubscript:",  v17 - 2));
    unint64_t v19 = atomic_load(&self->_flags);
    atomic_store(v19 & 0xFFFFFFFFFFFFFFFELL | (v18 == 19), &self->_flags);
  }

  addValueToTopContainerE((uint64_t)self, v6, v16);
  CFRelease(v16);
}

- (void)encodeBool:(BOOL)value forKey:(NSString *)key
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    unint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v9);
    -[NSKeyedArchiver encodeInt:forKey:](v10, v11, v12, v13);
  }

  else
  {
    SEL v6 = key;
    BOOL v7 = value;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0LL) == 36) {
      SEL v6 = (NSString *)[@"$" stringByAppendingString:v6];
    }
    BOOL v8 = (const void **)MEMORY[0x189604DE8];
    if (!v7) {
      BOOL v8 = (const void **)MEMORY[0x189604DE0];
    }
    addValueToTopContainerE((uint64_t)self, v6, *v8);
  }

- (void)encodeInt:(int)value forKey:(NSString *)key
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int valuePtr = value;
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    BOOL v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v8);
  }

  CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)key, 0LL) == 36) {
    key = (NSString *)[@"$" stringByAppendingString:key];
  }
  addValueToTopContainerE((uint64_t)self, key, v7);
  CFRelease(v7);
}

- (void)encodeInt32:(int32_t)value forKey:(NSString *)key
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    SEL v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v11);
  }

  else
  {
    SEL v6 = key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0LL) == 36) {
      SEL v6 = (NSString *)[@"$" stringByAppendingString:v6];
    }
    BOOL v8 = self;
    unint64_t v9 = v6;
    int32_t v10 = value;
  }

  _encodeInt32((uint64_t)v8, v9, v10);
}

- (void)encodeInt64:(int64_t)value forKey:(NSString *)key
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    SEL v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v11);
  }

  else
  {
    SEL v6 = key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0LL) == 36) {
      SEL v6 = (NSString *)[@"$" stringByAppendingString:v6];
    }
    BOOL v8 = self;
    unint64_t v9 = v6;
    int64_t v10 = value;
  }

  _encodeInt64((uint64_t)v8, v9, v10);
}

- (void)encodeFloat:(float)value forKey:(NSString *)key
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    SEL v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v11);
  }

  else
  {
    SEL v6 = key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0LL) == 36) {
      SEL v6 = (NSString *)[@"$" stringByAppendingString:v6];
    }
    BOOL v8 = self;
    unint64_t v9 = v6;
    float v10 = value;
  }

  _encodeFloat((uint64_t)v8, v9, v10);
}

- (void)encodeDouble:(double)value forKey:(NSString *)key
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    SEL v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v11);
  }

  else
  {
    SEL v6 = key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0LL) == 36) {
      SEL v6 = (NSString *)[@"$" stringByAppendingString:v6];
    }
    BOOL v8 = self;
    unint64_t v9 = v6;
    double v10 = value;
  }

  _encodeDouble((uint64_t)v8, v9, v10);
}

- (void)encodeBytes:(const uint8_t *)bytes length:(NSUInteger)length forKey:(NSString *)key
{
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    uint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: archive already finished, %@",  _NSMethodExceptionProem((objc_class *)self, a2),  @"cannot encode anything more");
    v15 = (void *)MEMORY[0x189603F70];
    CFTypeRef v16 = @"NSInvalidArchiveOperationException";
LABEL_12:
    objc_exception_throw((id)[v15 exceptionWithName:v16 reason:v14 userInfo:0]);
    goto LABEL_9;
  }

  CFNumberRef v7 = key;
  if (!bytes && length)
  {
    uint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: argument inconsistency: bytes pointer is null but length (%ld) is not zero",  _NSMethodExceptionProem((objc_class *)self, a2),  length);
    v15 = (void *)MEMORY[0x189603F70];
    CFTypeRef v16 = (const __CFString *)*MEMORY[0x189603A60];
    goto LABEL_12;
  }

  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v7, 0LL) == 36) {
    CFNumberRef v7 = (NSString *)[@"$" stringByAppendingString:v7];
  }
  double v10 = self;
  SEL v11 = bytes;
  CFIndex v12 = length;
  uint64_t v13 = v7;
LABEL_9:
  _encodeBytes((uint64_t)v10, v11, v12, v13);
}

- (void)_encodePropertyList:(id)a3 forKey:(id)a4
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    BOOL v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v8);
    -[NSKeyedArchiver encodeObject:](v9, v10, v11);
  }

  else
  {
    char v6 = (const __CFString *)a4;
    if (a4 && CFStringGetLength((CFStringRef)a4) >= 1 && CFStringGetCharacterAtIndex(v6, 0LL) == 36) {
      char v6 = (const __CFString *)[@"$" stringByAppendingString:v6];
    }
    addValueToTopContainerE((uint64_t)self, v6, a3);
  }

- (void)encodeObject:(id)a3
{
  if (_warnArchiverCompat == 1)
  {
    char v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v6);
  }

  char v7 = atomic_load(&self->_flags);
  if ((v7 & 2) != 0)
  {
    SEL v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v10);
    -[NSKeyedArchiver encodeConditionalObject:](v11, v12, v13);
  }

  else
  {
    unint64_t genericKey = self->_genericKey;
    self->_unint64_t genericKey = genericKey + 1;
    if (genericKey > 0x27) {
      unint64_t v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"$%ld", genericKey);
    }
    else {
      unint64_t v9 = (NSString *)generic_keys[genericKey];
    }
    _encodeObject((uint64_t)self, v9, a3, 0);
  }

- (void)encodeConditionalObject:(id)a3
{
  if (_warnArchiverCompat == 1)
  {
    char v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v6);
  }

  char v7 = atomic_load(&self->_flags);
  if ((v7 & 2) != 0)
  {
    SEL v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v10);
    -[NSKeyedArchiver encodeBycopyObject:](v11, v12, v13);
  }

  else
  {
    unint64_t genericKey = self->_genericKey;
    self->_unint64_t genericKey = genericKey + 1;
    if (genericKey > 0x27) {
      unint64_t v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"$%ld", genericKey);
    }
    else {
      unint64_t v9 = (NSString *)generic_keys[genericKey];
    }
    _encodeObject((uint64_t)self, v9, a3, 1);
  }

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  if (_warnArchiverCompat == 1)
  {
    BOOL v8 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v8);
  }

  char v9 = atomic_load(&self->_flags);
  if ((v9 & 2) != 0)
  {
    SEL v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidArchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: archive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot encode anything more"), 0 reason userInfo];
    objc_exception_throw(v12);
    -[NSKeyedArchiver encodeValuesOfObjCTypes:](v13, v14, v15);
  }

  else
  {
    unint64_t genericKey = self->_genericKey;
    self->_unint64_t genericKey = genericKey + 1;
    if (genericKey > 0x27) {
      id v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"$%ld", genericKey);
    }
    else {
      id v11 = (NSString *)generic_keys[genericKey];
    }
    _encodeBytes((uint64_t)self, (const UInt8 *)a3, a4, v11);
  }

- (void)encodeValuesOfObjCTypes:(const char *)a3
{
  if (_warnArchiverCompat == 1)
  {
    char v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v6);
  }

  char v7 = atomic_load(&self->_flags);
  if ((v7 & 2) != 0) {
    goto LABEL_12;
  }
  if (!a3)
  {
    SEL v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: null types pointer",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_10;
  }

  SEL v14 = &v15;
  if (*a3)
  {
    while (1)
    {
      BOOL v8 = v14++;
      if (!*v8) {
        break;
      }
      -[NSKeyedArchiver encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", a3);
    }

    SEL v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: null address pointer",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_10:
    id v11 = v10;
    SEL v12 = (void *)MEMORY[0x189603F70];
    for (i = (const __CFString *)*MEMORY[0x189603A60]; ; i = @"NSInvalidArchiveOperationException")
    {
      objc_exception_throw((id)[v12 exceptionWithName:i reason:v11 userInfo:0]);
LABEL_12:
      id v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: archive already finished, %@",  _NSMethodExceptionProem((objc_class *)self, a2),  @"cannot encode anything more");
      SEL v12 = (void *)MEMORY[0x189603F70];
    }
  }

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  if (_warnArchiverCompat == 1)
  {
    BOOL v8 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v8);
  }

  char v9 = atomic_load(&self->_flags);
  if ((v9 & 2) != 0)
  {
    v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: archive already finished, %@",  _NSMethodExceptionProem((objc_class *)self, a2),  @"cannot encode anything more");
    SEL v21 = (void *)MEMORY[0x189603F70];
    __int128 v22 = @"NSInvalidArchiveOperationException";
LABEL_22:
    objc_exception_throw((id)[v21 exceptionWithName:v22 reason:v20 userInfo:0]);
    goto LABEL_9;
  }

  if (!a3 || !a4)
  {
    __int128 v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: null type or address pointer",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_21:
    v20 = v23;
    SEL v21 = (void *)MEMORY[0x189603F70];
    __int128 v22 = (const __CFString *)*MEMORY[0x189603A60];
    goto LABEL_22;
  }

  int v10 = *(unsigned __int8 *)a3;
  if (v10 != 91)
  {
    if (v10 != 123)
    {
      uint64_t v11 = (char)v10;
      SEL v12 = (objc_class *)self;
      id v13 = (double *)a4;
      SEL v14 = a2;
LABEL_9:
      _compatEncodeValueOfObjCType(v12, v11, v13, v14);
      return;
    }

    __int128 v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: this archiver cannot encode structs",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_21;
  }

  unsigned int v17 = *((unsigned __int8 *)a3 + 1);
  CFTypeRef v16 = a3 + 1;
  unsigned int v15 = v17;
  if (v17 - 48 > 9) {
    goto LABEL_18;
  }
  uint64_t v18 = 0LL;
  do
  {
    uint64_t v18 = 10 * v18 + v15 - 48;
    unsigned int v19 = *(unsigned __int8 *)++v16;
    unsigned int v15 = v19;
  }

  while (v19 - 48 < 0xA);
  if (!v18)
  {
LABEL_18:
    __int128 v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: array count is missing or zero",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_21;
  }

  if (v15 == 93)
  {
    __int128 v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: array type is missing",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_21;
  }

  -[NSKeyedArchiver encodeArrayOfObjCType:count:at:](self, "encodeArrayOfObjCType:count:at:", v16);
}

- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5
{
  if (_warnArchiverCompat == 1)
  {
    int v10 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v10);
  }

  char v11 = atomic_load(&self->_flags);
  if ((v11 & 2) == 0)
  {
    if (a3 && a5)
    {
      if (a4)
      {
        int v12 = *(unsigned __int8 *)a3;
        if (v12 != 40 && v12 != 123 && v12 != 91)
        {
          id v13 = (void *)[objc_allocWithZone((Class)_NSKeyedCoderOldStyleArray) initWithObjCType:*a3 count:a4 at:a5];
          -[NSKeyedArchiver encodeObject:](self, "encodeObject:", v13);

          return;
        }

        SEL v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: unsupported type %s for array encoding",  _NSMethodExceptionProem((objc_class *)self, a2),  a3);
        goto LABEL_16;
      }

      unsigned int v19 = _NSMethodExceptionProem((objc_class *)self, a2);
      uint64_t v18 = @"%@: count is zero";
    }

    else
    {
      unsigned int v19 = _NSMethodExceptionProem((objc_class *)self, a2);
      uint64_t v18 = @"%@: null type or address pointer";
    }

    SEL v14 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v18, v19, v20);
LABEL_16:
    unsigned int v15 = v14;
    CFTypeRef v16 = (void *)MEMORY[0x189603F70];
    unsigned int v17 = (const __CFString *)*MEMORY[0x189603A60];
    goto LABEL_17;
  }

  unsigned int v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: archive already finished, %@",  _NSMethodExceptionProem((objc_class *)self, a2),  @"cannot encode anything more");
  CFTypeRef v16 = (void *)MEMORY[0x189603F70];
  unsigned int v17 = @"NSInvalidArchiveOperationException";
LABEL_17:
  objc_exception_throw((id)[v16 exceptionWithName:v17 reason:v15 userInfo:0]);
  objc_exception_rethrow();
  __break(1u);
}

- (int64_t)versionForClassName:(id)a3
{
  Class v3 = NSClassFromString((NSString *)a3);
  if (v3) {
    return -[objc_class version](v3, "version");
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unsigned)systemVersion
{
  return 2000;
}

- (BOOL)requiresSecureCoding
{
  unint64_t v2 = atomic_load(&self->_flags);
  return (v2 >> 2) & 1;
}

- (void)setRequiresSecureCoding:(BOOL)requiresSecureCoding
{
  unint64_t v3 = atomic_load(&self->_flags);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v5 = 4LL;
  if (!requiresSecureCoding) {
    uint64_t v5 = 0LL;
  }
  atomic_store(v4 | v5, &self->_flags);
}

@end