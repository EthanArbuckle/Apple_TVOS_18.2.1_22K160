@interface NSArchiver
+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path;
+ (NSData)archivedDataWithRootObject:(id)rootObject;
+ (id)classNameEncodedForTrueClassName:(id)a3;
+ (void)encodeClassName:(id)a3 intoClassName:(id)a4;
+ (void)initialize;
- (NSArchiver)initForWritingWithMutableData:(NSMutableData *)mdata;
- (NSMutableData)archiverData;
- (NSString)classNameEncodedForTrueClassName:(NSString *)trueName;
- (id)data;
- (int64_t)versionForClassName:(id)a3;
- (void)dealloc;
- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5;
- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4;
- (void)encodeClassName:(NSString *)trueName intoClassName:(NSString *)inArchiveName;
- (void)encodeConditionalObject:(id)object;
- (void)encodeDataObject:(id)a3;
- (void)encodeObject:(id)a3;
- (void)encodeRootObject:(id)rootObject;
- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4;
- (void)encodeValuesOfObjCTypes:(const char *)a3;
- (void)replaceObject:(id)object withObject:(id)newObject;
@end

@implementation NSArchiver

+ (void)initialize
{
  if (&OBJC_CLASS___NSArchiver == a1)
  {
    +[NSArchiver encodeClassName:intoClassName:]( &OBJC_CLASS___NSArchiver,  "encodeClassName:intoClassName:",  @"__NSLocalTimeZone",  @"NSLocalTimeZone");
    +[NSArchiver encodeClassName:intoClassName:]( &OBJC_CLASS___NSArchiver,  "encodeClassName:intoClassName:",  @"__NSLocalTimeZoneI",  @"NSLocalTimeZone");
  }

- (NSArchiver)initForWritingWithMutableData:(NSMutableData *)mdata
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  CFDictionaryKeyCallBacks v8 = *(CFDictionaryKeyCallBacks *)byte_189C994B0;
  if (!mdata)
  {

    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"*** -initForWritingWithMutableData: nil argument",  0,  *(_OWORD *)&v8.version,  *(_OWORD *)&v8.release,  *(_OWORD *)&v8.equal));
  }

  self->mdata = mdata;
  v4 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  self->stringTable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, &v8, 0LL);
  self->pointerTable = CFDictionaryCreateMutable(v4, 0LL, 0LL, 0LL);
  v5 = self->mdata;
  LOBYTE(v9) = 4;
  objc_msgSend( v5,  "appendBytes:length:",  &v9,  1,  *(_OWORD *)&v8.version,  *(_OWORD *)&v8.release,  *(_OWORD *)&v8.equal);
  _encodeCString(self->mdata, "streamtyped");
  v6 = self->mdata;
  __int16 v9 = 1000;
  char v10 = -127;
  [v6 appendBytes:&v10 length:1];
  [v6 appendBytes:&v9 length:2];
  return self;
}

- (NSMutableData)archiverData
{
  return (NSMutableData *)self->mdata;
}

- (id)data
{
  return self->mdata;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1895F89C0];

  replacementTable = self->replacementTable;
  if (replacementTable) {
    CFRelease(replacementTable);
  }
  pointerTable = self->pointerTable;
  stringTable = self->stringTable;
  if (stringTable) {
    CFRelease(stringTable);
  }
  ids = self->ids;
  if (ids) {
    CFRelease(ids);
  }
  map = self->map;
  if (map) {
    CFRelease(map);
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSArchiver;
  -[NSArchiver dealloc](&v8, sel_dealloc);
}

- (void)replaceObject:(id)object withObject:(id)newObject
{
  replacementTable = self->replacementTable;
  if (!replacementTable)
  {
    replacementTable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, 0LL, 0LL);
    self->replacementTable = replacementTable;
  }

  CFDictionarySetValue( (CFMutableDictionaryRef)replacementTable,  object,  (const void *)[newObject replacementObjectForArchiver:self]);
}

+ (void)encodeClassName:(id)a3 intoClassName:(id)a4
{
  Mutable = (__CFDictionary *)encodingMap;
  if (!encodingMap)
  {
    Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    encodingMap = (uint64_t)Mutable;
  }

  CFDictionarySetValue(Mutable, a3, a4);
}

+ (id)classNameEncodedForTrueClassName:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  if (!encodingMap) {
    return (id)[a3 copyWithZone:0];
  }
  id result = (id)CFDictionaryGetValue((CFDictionaryRef)encodingMap, a3);
  if (!result) {
    return (id)[a3 copyWithZone:0];
  }
  return result;
}

- (int64_t)versionForClassName:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v3 = NSClassFromString((NSString *)a3);
  if (v3) {
    return class_getVersion(v3);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  mdata = self->mdata;
  if (mdata) {
    _encodeOrReuseCString(mdata, (char *)a3, (CFDictionaryRef)self->stringTable);
  }
  _encodeValueOfObjCType((uint64_t)self, (char *)a3, (objc_class **)a4);
  if (*v8)
  {
    typeDescriptorError((char)*v8, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
    _encodeOrReuseCString(v9, v10, v11);
  }

- (void)encodeValuesOfObjCTypes:(const char *)a3
{
  v3 = (char *)a3;
  mdata = self->mdata;
  if (mdata) {
    _encodeOrReuseCString(mdata, (char *)a3, (CFDictionaryRef)self->stringTable);
  }
  objc_super v8 = (objc_class ***)&v9;
  if (*v3)
  {
    do
    {
      v6 = v8++;
      _encodeValueOfObjCType((uint64_t)self, v3, *v6);
      v3 = v7;
    }

    while (*v7);
  }

- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5
{
  sizep[1] = *MEMORY[0x1895F89C0];
  size_t v9 = strlen(a3);
  if (self->mdata)
  {
    size_t v10 = v9 + 15;
    if (v9 + 15 < 0x201) {
      CFDictionaryRef v11 = v9 == -15LL ? 0LL : (char *)sizep - ((v9 + 30) & 0xFFFFFFFFFFFFFFF0LL);
    }
    else {
      CFDictionaryRef v11 = (char *)malloc(v9 + 15);
    }
    snprintf(v11, v10, "[%lu%s]", a4, a3);
    _encodeOrReuseCString(self->mdata, v11, (CFDictionaryRef)self->stringTable);
    if (v10 >= 0x201) {
      free(v11);
    }
  }

  int v12 = *(unsigned __int8 *)a3;
  if (v12 == 99 && (v13 = a3 + 1, !a3[1]))
  {
    [self->mdata appendBytes:a5 length:a4];
  }

  else
  {
    size_t v14 = strlen(a3);
    size_t v15 = v14 + 3;
    if (v14 + 3 < 0x201)
    {
      if (v14 == -3LL) {
        v16 = 0LL;
      }
      else {
        v16 = (char *)sizep - ((v14 + 18) & 0xFFFFFFFFFFFFFFF0LL);
      }
    }

    else
    {
      v16 = (char *)malloc(v14 + 3);
    }

    v17 = (char *)a3;
    if (v12)
    {
      v17 = (char *)a3;
      if (v12 != 123)
      {
        v17 = (char *)a3;
        if (a3[1])
        {
          strlcpy(v16, "{", v15);
          strlcat(v16, a3, v15);
          strlcat(v16, "}", v15);
          v17 = v16;
        }
      }
    }

    v13 = NSGetSizeAndAlignment(v17, sizep, 0LL);
    if (a4)
    {
      uint64_t v18 = 0LL;
      do
        _encodeValueOfObjCType((uint64_t)self, v17, (objc_class **)((char *)a5 + sizep[0] * v18++));
      while (a4 != v18);
    }

    if (v15 >= 0x201) {
      free(v16);
    }
  }

  if (*v13) {
    typeDescriptorError(*v13, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
  }
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  mdata = self->mdata;
  if (mdata)
  {
    _encodeOrReuseCString(mdata, "+", (CFDictionaryRef)self->stringTable);
    _encodeInt(self->mdata, a4);
    [self->mdata appendBytes:a3 length:a4];
  }

- (void)encodeObject:(id)a3
{
  mdata = self->mdata;
  if (mdata) {
    _encodeOrReuseCString(mdata, "@", (CFDictionaryRef)self->stringTable);
  }
  _encodeObject_old((uint64_t)self, a3);
}

- (void)encodeDataObject:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  unint64_t v6 = [a3 length];
  if (v6 >> 31)
  {
    v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: data length (%qd) makes data too large to fit in non-keyed archive", _NSMethodExceptionProem((objc_class *)self, a2), v6), 0 reason userInfo];
    objc_exception_throw(v7);
  }

  int v8 = v6;
  -[NSArchiver encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "i", &v8);
  -[NSArchiver encodeArrayOfObjCType:count:at:]( self,  "encodeArrayOfObjCType:count:at:",  "c",  v8,  [a3 bytes]);
}

- (void)encodeRootObject:(id)rootObject
{
  mdata = self->mdata;
  if (mdata)
  {
    if (!self->ids)
    {
      self->ids = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, 0LL);
      mdata = self->mdata;
    }

    id v6 = mdata;
    self->mdata = 0LL;
    -[NSArchiver encodeObject:](self, "encodeObject:", rootObject);
    self->mdata = v6;
    -[NSArchiver encodeObject:](self, "encodeObject:", rootObject);
  }

  else
  {
    v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -encodeRootObject: already done for %p",  rootObject);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v7 userInfo:0]);
    -[NSArchiver encodeConditionalObject:](v8, v9, v10);
  }

- (void)encodeConditionalObject:(id)object
{
  if (self->mdata)
  {
    if (self->ids)
    {
      v5 = _replacementObjectForObject((uint64_t)self, object);
      if (v5)
      {
        if (CFSetGetValue((CFSetRef)self->ids, v5)) {
          id v6 = object;
        }
        else {
          id v6 = 0LL;
        }
      }

      else
      {
        id v6 = 0LL;
      }

      -[NSArchiver encodeObject:](self, "encodeObject:", v6);
    }

    else
    {
      v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** encodeConditionalObject: -encodeRootObject: has not been previously done for %p",  object);
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v7 userInfo:0]);
      _replacementObjectForObject(v8, v9);
    }
  }

+ (NSData)archivedDataWithRootObject:(id)rootObject
{
  v5 = (NSData *)[MEMORY[0x189603FB8] data];
  int v6 = _CFExecutableLinkedOnOrAfter();
  if (v6) {
    _CFAutoreleasePoolPush();
  }
  objc_msgSend( (id)objc_msgSend(objc_allocWithZone((Class)a1), "initForWritingWithMutableData:", v5),  "encodeRootObject:",  rootObject);
  if (v6) {
    _CFAutoreleasePoolPop();
  }
  return v5;
}

+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path
{
  return objc_msgSend( (id)objc_msgSend(a1, "archivedDataWithRootObject:", rootObject),  "writeToFile:atomically:",  path,  1);
}

- (void)encodeClassName:(NSString *)trueName intoClassName:(NSString *)inArchiveName
{
  map = self->map;
  if (!map)
  {
    map = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    self->map = map;
  }

  CFDictionarySetValue((CFMutableDictionaryRef)map, trueName, inArchiveName);
}

- (NSString)classNameEncodedForTrueClassName:(NSString *)trueName
{
  if (!trueName) {
    return 0LL;
  }
  map = (const __CFDictionary *)self->map;
  if (!map) {
    return (NSString *)-[NSString copyWithZone:](trueName, "copyWithZone:", 0LL);
  }
  id result = (NSString *)CFDictionaryGetValue(map, trueName);
  if (!result) {
    return (NSString *)-[NSString copyWithZone:](trueName, "copyWithZone:", 0LL);
  }
  return result;
}

@end