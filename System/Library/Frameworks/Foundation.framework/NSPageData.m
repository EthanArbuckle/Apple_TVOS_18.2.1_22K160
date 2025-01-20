@interface NSPageData
+ (int64_t)_umask;
+ (void)initialize;
- (NSPageData)init;
- (NSPageData)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (NSPageData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4;
- (NSPageData)initWithContentsOfFile:(id)a3;
- (NSPageData)initWithContentsOfMappedFile:(id)a3;
- (NSPageData)initWithContentsOfMappedFile:(id)a3 withFileAttributes:(id)a4;
- (NSPageData)initWithData:(id)a3;
- (NSPageData)initWithDataNoCopy:(id)a3;
- (const)bytes;
- (id)_mappedFile;
- (id)data;
- (id)deserializer;
- (id)initFromSerializerStream:(id)a3 length:(unint64_t)a4;
- (unint64_t)length;
- (unint64_t)writeFd:(int64_t)a3;
- (unint64_t)writeFile:(id)a3;
- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7;
- (void)_setOriginalFileInfoFromFileAttributes:(id)a3;
- (void)dealloc;
@end

@implementation NSPageData

+ (void)initialize
{
  if (&OBJC_CLASS___NSPageData == a1)
  {
    unsigned int v2 = umask(0);
    _NSPageDataUmask = v2;
    umask(v2);
  }

+ (int64_t)_umask
{
  return _NSPageDataUmask;
}

- (unint64_t)length
{
  return -[NSData length](self->data, "length");
}

- (const)bytes
{
  return -[NSData bytes](self->data, "bytes");
}

- (NSPageData)init
{
  self->data = (NSData *)[objc_allocWithZone(MEMORY[0x189603F48]) init];
  return self;
}

- (NSPageData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4
{
  self->data = (NSData *)[objc_allocWithZone(MEMORY[0x189603F48]) initWithBytesNoCopy:a3 length:a4];
  return self;
}

- (NSPageData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  self->data = (NSData *)[objc_allocWithZone(MEMORY[0x189603F48]) initWithBytes:a3 length:a4];
  return self;
}

- (NSPageData)initWithData:(id)a3
{
  self->data = (NSData *)[objc_allocWithZone(MEMORY[0x189603F48]) initWithData:a3];
  return self;
}

- (void)_setOriginalFileInfoFromFileAttributes:(id)a3
{
  if (self->data)
  {
    v4 = (void *)[a3 fileModificationDate];

    self->_originalFileModDate = (NSDate *)[v4 copy];
  }

- (NSPageData)initWithContentsOfFile:(id)a3
{
  v5 = (NSData *)[objc_allocWithZone(MEMORY[0x189603F48]) initWithContentsOfFile:a3];
  self->data = v5;
  if (v5)
  {
    -[NSPageData _setOriginalFileInfoFromFileAttributes:]( self,  "_setOriginalFileInfoFromFileAttributes:",  -[NSFileManager fileAttributesAtPath:traverseLink:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileAttributesAtPath:traverseLink:",  a3,  1LL));
    self->_originalFilePath = (NSString *)[a3 copy];
  }

  return self;
}

- (NSPageData)initWithContentsOfMappedFile:(id)a3
{
  return -[NSPageData initWithContentsOfMappedFile:withFileAttributes:]( self,  "initWithContentsOfMappedFile:withFileAttributes:",  a3,  0LL);
}

- (NSPageData)initWithContentsOfMappedFile:(id)a3 withFileAttributes:(id)a4
{
  v4 = (NSDictionary *)a4;
  if (!a4)
  {
    v4 = -[NSFileManager fileAttributesAtPath:traverseLink:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileAttributesAtPath:traverseLink:",  a3,  1LL);
    if (!v4)
    {
      if (self->data) {
        goto LABEL_4;
      }
LABEL_6:
      -[NSPageData dealloc](self, "dealloc");
      return 0LL;
    }
  }

  v7 = (NSData *)[objc_allocWithZone(MEMORY[0x189603F48]) initWithContentsOfMappedFile:a3];
  self->data = v7;
  if (!v7) {
    goto LABEL_6;
  }
LABEL_4:
  -[NSPageData _setOriginalFileInfoFromFileAttributes:](self, "_setOriginalFileInfoFromFileAttributes:", v4);
  self->_originalFilePath = (NSString *)[a3 copy];
  return self;
}

- (id)_mappedFile
{
  return self->_originalFilePath;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPageData;
  -[NSPageData dealloc](&v3, sel_dealloc);
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7
{
  BOOL v8 = a6;
  if (a4)
  {
    if ((*((_WORD *)a4 + 9) & 4) != 0)
    {
      v19 = (void *)[objc_allocWithZone((Class)NSString) initWithData:self encoding:4];
      BOOL v20 = -[NSFileManager createSymbolicLinkAtPath:pathContent:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createSymbolicLinkAtPath:pathContent:",  a3,  v19);

      if (v20) {
        return 0LL;
      }
      else {
        return 2LL;
      }
    }

    uint64_t v11 = *((unsigned __int16 *)a4 + 8);
    uint64_t v12 = *((void *)a4 + 1);
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v11 = 438LL;
  }

  if (!self->_originalFileModDate
    || ![a7 length]
    || (v13 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),
        (v14 = -[NSFileManager fileAttributesAtPath:traverseLink:](v13, "fileAttributesAtPath:traverseLink:", a7, 1LL)) == 0LL)
    || !-[NSDate isEqual:]( self->_originalFileModDate,  "isEqual:",  -[NSDictionary fileModificationDate](v14, "fileModificationDate"))
    || (BOOL v15 = -[NSFileManager linkItemAtPath:toPath:error:](v13, "linkItemAtPath:toPath:error:", a7, a3, 0LL),
        unint64_t result = 0LL,
        !v15))
  {
    if (-[NSData writeToFile:atomically:](self, "writeToFile:atomically:", a3, 0LL, a5))
    {
      _NXChmodFile((uint64_t)a3, v11 & ~_NSPageDataUmask);
      if (v8)
      {

        self->data = (NSData *)objc_msgSend( (id)objc_msgSend( MEMORY[0x189603F48],  "allocWithZone:",  -[NSPageData zone](self, "zone")),  "initWithContentsOfMappedFile:",  a3);
      }

      if (v12)
      {
        id v17 = objc_allocWithZone(MEMORY[0x189603F68]);
        v18 = (void *)objc_msgSend( v17,  "initWithObjectsAndKeys:",  objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSince1970:", (double)v12),  @"NSFileModificationDate",  0);
      }

      else
      {
        v21 = (void *)[objc_allocWithZone(MEMORY[0x189603F50]) init];
        v18 = (void *)objc_msgSend( objc_allocWithZone(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  v21,  @"NSFileModificationDate",  0);
      }

      -[NSFileManager changeFileAttributes:atPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "changeFileAttributes:atPath:",  v18,  a3);

      v22 = -[NSFileManager fileAttributesAtPath:traverseLink:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileAttributesAtPath:traverseLink:",  a3,  1LL);
      unint64_t result = 0LL;
      if (v22)
      {
        if (v8)
        {
          -[NSPageData _setOriginalFileInfoFromFileAttributes:](self, "_setOriginalFileInfoFromFileAttributes:");

          v23 = (NSString *)[a3 copy];
          unint64_t result = 0LL;
          self->_originalFilePath = v23;
        }
      }
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

- (id)initFromSerializerStream:(id)a3 length:(unint64_t)a4
{
  v7 = NSAllocateMemoryPages(a4);
  [a3 copySerializationInto:v7];
  -[NSPageData initWithBytes:length:](self, "initWithBytes:length:", v7, a4);
  NSDeallocateMemoryPages(v7, a4);
  return self;
}

- (id)deserializer
{
  return -[NSAKDeserializerStream initFromMemoryNoCopy:length:freeWhenDone:]( +[NSAKDeserializerStream allocWithZone:]( &OBJC_CLASS___NSAKDeserializerStream,  "allocWithZone:",  -[NSPageData zone](self, "zone")),  "initFromMemoryNoCopy:length:freeWhenDone:",  -[NSPageData bytes](self, "bytes"),  -[NSPageData length](self, "length"),  0LL);
}

- (NSPageData)initWithDataNoCopy:(id)a3
{
  self->data = (NSData *)a3;
  return self;
}

- (id)data
{
  return self->data;
}

- (unint64_t)writeFd:(int64_t)a3
{
  ssize_t v4 = write(a3, -[NSPageData bytes](self, "bytes"), -[NSPageData length](self, "length"));
  return 2LL * (v4 != -[NSPageData length](self, "length"));
}

- (unint64_t)writeFile:(id)a3
{
  if (!-[NSData writeToFile:atomically:](self, "writeToFile:atomically:", a3, 0LL)) {
    return 2LL;
  }
  _NXChmodFile((uint64_t)a3, ~(_WORD)_NSPageDataUmask & 0x1B6);
  return 0LL;
}

@end