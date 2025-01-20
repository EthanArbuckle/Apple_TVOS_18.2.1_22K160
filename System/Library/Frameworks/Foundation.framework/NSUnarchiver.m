@interface NSUnarchiver
+ (NSString)classNameDecodedForArchiveClassName:(NSString *)inArchiveName;
+ (id)unarchiveObjectWithData:(NSData *)data;
+ (id)unarchiveObjectWithFile:(NSString *)path;
+ (void)decodeClassName:(NSString *)inArchiveName asClassName:(NSString *)trueName;
+ (void)initialize;
- (BOOL)isAtEnd;
- (NSString)classNameDecodedForArchiveClassName:(NSString *)inArchiveName;
- (NSUnarchiver)initForReadingWithData:(NSData *)data;
- (NSZone)objectZone;
- (id)data;
- (id)decodeDataObject;
- (id)decodeObject;
- (int64_t)versionForClassName:(id)a3;
- (unsigned)systemVersion;
- (void)_setAllowedClasses:(id)a3;
- (void)dealloc;
- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5;
- (void)decodeBytesWithReturnedLength:(unint64_t *)a3;
- (void)decodeClassName:(NSString *)inArchiveName asClassName:(NSString *)trueName;
- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4;
- (void)decodeValuesOfObjCTypes:(const char *)a3;
- (void)replaceObject:(id)object withObject:(id)newObject;
- (void)setObjectZone:(NSZone *)zone;
@end

@implementation NSUnarchiver

+ (void)initialize
{
  if (&OBJC_CLASS___NSUnarchiver == a1)
  {
    +[NSUnarchiver decodeClassName:asClassName:]( &OBJC_CLASS___NSUnarchiver,  "decodeClassName:asClassName:",  @"NSAbsoluteURL",  @"NSURL");
    +[NSUnarchiver decodeClassName:asClassName:]( &OBJC_CLASS___NSUnarchiver,  "decodeClassName:asClassName:",  @"NSLocalTimeZone",  @"__NSLocalTimeZone");
  }

- (NSUnarchiver)initForReadingWithData:(NSData *)data
{
  v3 = self;
  if (!data)
  {

    v27 = (void *)MEMORY[0x189603F70];
    uint64_t v28 = *MEMORY[0x189603A60];
    v29 = @"*** -initForReadingWithData: nil argument";
    goto LABEL_31;
  }

  v5 = malloc(0x18uLL);
  v3->uint64_t datax = v5;
  if (v5)
  {
    v6 = v5;
    void *v5 = CFRetain(data);
    v6[1] = CFDataGetBytePtr((CFDataRef)data);
    CFIndex Length = CFDataGetLength((CFDataRef)data);
    v6[2] = Length;
    if (Length < 13) {
      goto LABEL_18;
    }
    uint64_t v8 = v6[1];
    if (*(_BYTE *)(v8 + 1) != 11) {
      goto LABEL_18;
    }
    if (*(void *)(v8 + 2) != 0x7274736465707974LL || *(void *)(v8 + 5) != 0x6D61657274736465LL)
    {
      uint64_t v10 = *(void *)(v8 + 2);
      uint64_t v11 = *(void *)(v8 + 5);
      if (v10 != 0x79746D6165727473LL || v11 != 0x64657079746D6165LL) {
        goto LABEL_18;
      }
    }

    char v13 = _decodeCharAtCursor(*((void *)v3->datax + 1), *((void *)v3->datax + 2), &v3->cursor);
    v3->streamerVersion = v13;
    _decodeCStringAtCursor((uint64_t)v3->datax, &v3->cursor, v3->swap != 0);
    v15 = (char *)v14;
    if (!strcmp(v14, "typedstream"))
    {
      char v17 = 1;
    }

    else
    {
      if (strcmp(v15, "streamtyped"))
      {
        free(v15);
LABEL_18:

        return 0LL;
      }

      char v17 = 0;
    }

    v3->swap = v17;
    free(v15);
    uint64_t datax = (uint64_t)v3->datax;
    BOOL v19 = v3->swap != 0;
    uint64_t v20 = _decodeCharAtCursor(*(void *)(datax + 8), *(void *)(datax + 16), &v3->cursor);
    v3->systemVersion = (int)_decodeIntStartingWithChar(datax, v20, &v3->cursor, v19);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  0LL,  &_NSUnarchiverCreatePointerTable__NSUnarchiverPointerTableValueCallbacks);
    v3->pointerTable = Mutable;
    if (Mutable)
    {
      v22 = malloc(0x20uLL);
      if (!v22) {
        goto LABEL_29;
      }
      v23 = v22;
      *(_OWORD *)v22 = xmmword_183850400;
      v22[2] = 100LL;
      v24 = malloc(0x320uLL);
      v23[3] = v24;
      if (!v24) {
        goto LABEL_29;
      }
      v3->stringTable = v23;
      CFMutableDictionaryRef v25 = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], 0LL);
      v3->classVersions = v25;
      if (v25)
      {
        v3->objectZone = 0LL;
        v3->lastLabel = -111LL;
        v3->reserved = 0LL;
        v26 = malloc(0x18uLL);
        v3->allUnarchivedObjects = v26;
        if (v26)
        {
          _OWORD *v26 = xmmword_183850410;
          *((void *)v3->allUnarchivedObjects + 2) = NSAllocateObjectArray(0x200uLL);
          if (*((void *)v3->allUnarchivedObjects + 2)) {
            return v3;
          }
        }
      }
    }
  }

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t datax = (CFTypeRef *)self->datax;
  if (!*datax || (CFRelease(*datax), (uint64_t datax = (CFTypeRef *)self->datax) != 0LL)) {
    free(datax);
  }
  pointerTable = self->pointerTable;
  stringTable = self->stringTable;
  if (stringTable)
  {
    if (*(void *)stringTable)
    {
      unint64_t v6 = 0LL;
      do
        free(*(void **)(*((void *)stringTable + 3) + 8 * v6++));
      while (v6 < *(void *)stringTable);
    }

    free(*((void **)stringTable + 3));
    free(stringTable);
  }

  id classVersions = self->classVersions;
  if (classVersions) {

  }
  allUnarchivedObjects = (uint64_t *)self->allUnarchivedObjects;
  if (allUnarchivedObjects)
  {
    uint64_t v9 = *allUnarchivedObjects;
    uint64_t v10 = (id *)allUnarchivedObjects[2];
    if (*allUnarchivedObjects)
    {
      do
      {
        uint64_t v11 = v9 - 1;

        uint64_t v9 = v11;
      }

      while (v11);
    }

    free(v10);
    free(self->allUnarchivedObjects);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSUnarchiver;
  -[NSUnarchiver dealloc](&v12, sel_dealloc);
}

- (void)replaceObject:(id)object withObject:(id)newObject
{
  v22[129] = *MEMORY[0x1895F89C0];
  if (object == newObject) {
    return;
  }
  MEMORY[0x1895F8858](self);
  MEMORY[0x1895F8858](v7);
  unint64_t Count = CFDictionaryGetCount(*(CFDictionaryRef *)(v8 + 48));
  if (!Count) {
    return;
  }
  unint64_t v10 = Count;
  if (Count >> 60)
  {
    v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** value %lu too large (may have wrapped)",  Count);
    v16 = (void *)MEMORY[0x189603F70];
    uint64_t v17 = *MEMORY[0x189603A48];
LABEL_20:
    objc_exception_throw((id)[v16 exceptionWithName:v17 reason:v15 userInfo:0]);
    -[NSUnarchiver _setAllowedClasses:](v18, v19, v20);
    return;
  }

  if (Count >= 0x81)
  {
    uint64_t v11 = (const void **)malloc(8 * Count);
    objc_super v12 = (const void **)malloc(8 * v10);
  }

  else
  {
    uint64_t v11 = (const void **)v22;
    objc_super v12 = (const void **)v21;
  }

  if (!v11 || !v12)
  {
    v16 = (void *)MEMORY[0x189603F70];
    uint64_t v17 = *MEMORY[0x189603B38];
    v15 = (NSString *)@"*** memory allocation failed";
    goto LABEL_20;
  }

  CFDictionaryGetKeysAndValues((CFDictionaryRef)self->pointerTable, v11, v12);
  for (uint64_t i = 0LL; i != v10; ++i)
  {
    v14 = v12[i];
    if (*(id *)v14 == object)
    {
      *(void *)v14 = newObject;
      v14[8] = 2;
    }
  }

  if (v11 != v22) {
    free(v11);
  }
}

- (void)_setAllowedClasses:(id)a3
{
  id reserved = self->reserved;
  if (reserved != a3)
  {

    self->id reserved = (id)[a3 copy];
  }

- (void)setObjectZone:(NSZone *)zone
{
  self->objectZone = zone;
}

- (NSZone)objectZone
{
  return self->objectZone;
}

- (BOOL)isAtEnd
{
  CFIndex cursor = self->cursor;
  return cursor >= CFDataGetLength(*(CFDataRef *)self->datax);
}

- (unsigned)systemVersion
{
  return self->systemVersion;
}

- (int64_t)versionForClassName:(id)a3
{
  v6[1] = *(const void **)MEMORY[0x1895F89C0];
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    id classVersions = (const __CFDictionary *)self->classVersions;
    if (classVersions)
    {
      if (CFDictionaryGetValueIfPresent(classVersions, a3, v6)) {
        return (int64_t)v6[0];
      }
      else {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }

  return result;
}

- (id)data
{
  return *(id *)self->datax;
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  uint64_t v7 = _decodeReusedCStringUsingTable( (uint64_t)self->datax,  (unint64_t *)self->stringTable,  &self->cursor,  self->swap != 0);
  checkExpected(v7, (char *)a3);
  char v8 = *_decodeValueOfObjCType((uint64_t)self, (char *)a3, a4);
  if (v8)
  {
    typeDescriptorError(v8, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
    _decodeReusedCStringUsingTable(v9, v10, v11, v12);
  }

- (void)decodeValuesOfObjCTypes:(const char *)a3
{
  uint64_t v5 = _decodeReusedCStringUsingTable( (uint64_t)self->datax,  (unint64_t *)self->stringTable,  &self->cursor,  self->swap != 0);
  checkExpected(v5, (char *)a3);
}

- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5
{
  sizep[1] = *MEMORY[0x1895F89C0];
  size_t v9 = strlen(a3);
  MEMORY[0x1895F8858](v9);
  uint64_t v11 = (char *)sizep - ((v10 + 30) & 0xFFFFFFFFFFFFFFF0LL);
  snprintf(v11, v12, "[%lu%s]", a4, a3);
  uint64_t v13 = _decodeReusedCStringUsingTable( (uint64_t)self->datax,  (unint64_t *)self->stringTable,  &self->cursor,  self->swap != 0);
  checkExpected(v13, v11);
  if (*a3 == 99 && (v14 = a3 + 1, !a3[1]))
  {
    _deserializeBytes(a5, *((void *)self->datax + 1), *((void *)self->datax + 2), &self->cursor, a4);
  }

  else
  {
    size_t v15 = strlen(a3);
    size_t v16 = v15 + 3;
    MEMORY[0x1895F8858](v15);
    v18 = (char *)sizep - ((v17 + 18) & 0xFFFFFFFFFFFFFFF0LL);
    SEL v19 = (char *)a3;
    if (*a3)
    {
      SEL v19 = (char *)a3;
      if (*a3 != 123)
      {
        SEL v19 = (char *)a3;
        if (a3[1])
        {
          strlcpy((char *)sizep - ((v17 + 18) & 0xFFFFFFFFFFFFFFF0LL), "{", v16);
          strlcat(v18, a3, v16);
          strlcat(v18, "}", v16);
          SEL v19 = v18;
        }
      }
    }

    v14 = NSGetSizeAndAlignment(v19, sizep, 0LL);
    if (a4)
    {
      NSUInteger v20 = 0LL;
      while (v20 <= 0x7FFFFFFFFFFFFFFFLL / sizep[0])
      {
        _decodeValueOfObjCType((uint64_t)self, v19, (char *)a5 + sizep[0] * v20++);
        if (a4 == v20) {
          goto LABEL_11;
        }
      }

      v22 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** value %lu too large (may have wrapped)",  v20);
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v22 userInfo:0]);
LABEL_15:
      typeDescriptorError(v21, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
    }
  }

- (void)decodeBytesWithReturnedLength:(unint64_t *)a3
{
  if (self->streamerVersion > 3)
  {
    uint64_t v5 = _decodeReusedCStringUsingTable( (uint64_t)self->datax,  (unint64_t *)self->stringTable,  &self->cursor,  self->swap != 0);
    checkExpected(v5, "+");
  }

  uint64_t datax = self->datax;
  p_CFIndex cursor = &self->cursor;
  BOOL v8 = self->swap != 0;
  uint64_t v9 = _decodeCharAtCursor(datax[1], datax[2], &self->cursor);
  int v10 = _decodeIntStartingWithChar((uint64_t)datax, v9, &self->cursor, v8);
  uint64_t v11 = v10;
  *a3 = v10;
  if (v10 < 0) {
    goto LABEL_35;
  }
  size_t v12 = self->datax;
  unint64_t v13 = v12[1];
  int64_t v14 = *p_cursor;
  BOOL v15 = !__CFADD__(*p_cursor, v13) || v14 <= 0;
  BOOL v16 = !v15;
  if (v14 == 0x8000000000000000LL) {
    goto LABEL_35;
  }
  if (v16) {
    goto LABEL_35;
  }
  uint64_t v17 = v12[2];
  if (v14 < 0 && v13 < -v14) {
    goto LABEL_35;
  }
  if (!v17
    || ((result = (void *)(v14 + v13), -v17 < v13) ? (BOOL v19 = v17 == 1) : (BOOL v19 = 1),
        (unint64_t v20 = v17 - 1 + v13, v19) ? (v21 = (unint64_t)result >= v13) : (v21 = 0),
        v21 ? (BOOL v22 = v20 >= (unint64_t)result) : (BOOL v22 = 0),
        !v22
     || v11
     && (v11 != 1 && (unint64_t)result > -v11
      || ((v23 = (char *)result + v11 - 1, (unint64_t)v23 >= v13)
        ? (BOOL v24 = v20 >= (unint64_t)v23)
        : (BOOL v24 = 0),
          !v24))))
  {
LABEL_35:
    while (1)
    {
      CFMutableDictionaryRef v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** End of archive encountered prematurely at %ld",  *p_cursor);
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSArchiverArchiveInconsistency" reason:v25 userInfo:0]);
    }
  }

  *p_CFIndex cursor = v14 + v11;
  return result;
}

- (id)decodeObject
{
  if (self->streamerVersion >= 4)
  {
    uint64_t v3 = _decodeReusedCStringUsingTable( (uint64_t)self->datax,  (unint64_t *)self->stringTable,  &self->cursor,  self->swap != 0);
    checkExpected(v3, "@");
  }

  return (id)_decodeObject_old((uint64_t)self);
}

- (id)decodeDataObject
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  -[NSCoder decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "i", &v6, 4LL);
  if (v6 < 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSArchiverArchiveInconsistency" reason:@"attempt to decode NSData bytes with a negative byte count" userInfo:0]);
  }
  uint64_t v3 = (void *)[MEMORY[0x189603FB8] allocWithZone:self->objectZone];
  v4 = (void *)[v3 initWithLength:v6];
  -[NSUnarchiver decodeArrayOfObjCType:count:at:]( self,  "decodeArrayOfObjCType:count:at:",  "c",  v6,  [v4 mutableBytes]);
  return v4;
}

+ (id)unarchiveObjectWithData:(NSData *)data
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)a1) initForReadingWithData:data];
  v4 = (void *)[v3 decodeObject];
  if (([v3 isAtEnd] & 1) == 0 && v4) {
    NSLog((NSString *)@"*** +[NSUnarchiver unarchiveObjectWithData:]: extra data discarded");
  }
  id v5 = v4;

  return v4;
}

+ (id)unarchiveObjectWithFile:(NSString *)path
{
  id result = (id)[MEMORY[0x189603F48] dataWithContentsOfFile:path];
  if (result) {
    return (id)[a1 unarchiveObjectWithData:result];
  }
  return result;
}

+ (void)decodeClassName:(NSString *)inArchiveName asClassName:(NSString *)trueName
{
  CFMutableDictionaryRef Mutable = (__CFDictionary *)decodingMap;
  if (decodingMap
    || (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]),  (decodingMap = (uint64_t)Mutable) != 0))
  {
    CFDictionarySetValue(Mutable, inArchiveName, trueName);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B38] reason:@"*** memory allocation failed" userInfo:0]);
    -[NSUnarchiver decodeClassName:asClassName:](v7, v8, v9, v10);
  }

- (void)decodeClassName:(NSString *)inArchiveName asClassName:(NSString *)trueName
{
  map = (__CFDictionary *)self->map;
  if (map
    || (map = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]),  (self->map = map) != 0LL))
  {
    CFDictionarySetValue(map, inArchiveName, trueName);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B38] reason:@"*** memory allocation failed" userInfo:0]);
    +[NSUnarchiver classNameDecodedForArchiveClassName:](v8, v9, v10);
  }

+ (NSString)classNameDecodedForArchiveClassName:(NSString *)inArchiveName
{
  if (!inArchiveName) {
    return 0LL;
  }
  if (!decodingMap) {
    return (NSString *)-[NSString copyWithZone:](inArchiveName, "copyWithZone:", 0LL);
  }
  id result = (NSString *)CFDictionaryGetValue((CFDictionaryRef)decodingMap, inArchiveName);
  if (!result) {
    return (NSString *)-[NSString copyWithZone:](inArchiveName, "copyWithZone:", 0LL);
  }
  return result;
}

- (NSString)classNameDecodedForArchiveClassName:(NSString *)inArchiveName
{
  if (!inArchiveName) {
    return 0LL;
  }
  map = (const __CFDictionary *)self->map;
  if (!map) {
    return (NSString *)-[NSString copyWithZone:](inArchiveName, "copyWithZone:", 0LL);
  }
  id result = (NSString *)CFDictionaryGetValue(map, inArchiveName);
  if (!result) {
    return (NSString *)-[NSString copyWithZone:](inArchiveName, "copyWithZone:", 0LL);
  }
  return result;
}

@end