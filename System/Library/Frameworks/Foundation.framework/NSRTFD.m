@interface NSRTFD
+ (void)initialize;
- (BOOL)_isLink:(id)a3;
- (BOOL)isPackage;
- (NSRTFD)init;
- (NSRTFD)initWithCapacity:(unint64_t)a3;
- (NSRTFD)initWithContentsOfFile:(id)a3;
- (NSRTFD)initWithDataRepresentation:(id)a3;
- (NSRTFD)initWithDictionary:(id)a3;
- (NSRTFD)initWithDictionary:(id)a3 copyItems:(BOOL)a4;
- (NSRTFD)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (NSRTFD)initWithPasteboardDataRepresentation:(id)a3;
- (id)_getDocInfoForKey:(id)a3;
- (id)addCommon:(id)a3 docInfo:(id)a4 value:(id)a5 zone:(_NSZone *)a6;
- (id)addData:(id)a3 name:(id)a4;
- (id)addFile:(id)a3;
- (id)addLink:(id)a3;
- (id)copy;
- (id)copy:(id)a3 into:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createRandomKey:(id)a3;
- (id)createUniqueKey:(id)a3;
- (id)dataForFile:(id)a3;
- (id)dataRepresentation;
- (id)freeSerialized:(void *)a3 length:(unint64_t)a4;
- (id)getDirInfo:(BOOL)a3;
- (id)getDocument:(id)a3 docInfo:(id)a4;
- (id)initFromDocument:(id)a3 error:(unint64_t *)a4;
- (id)initFromElement:(id)a3 ofDocument:(id)a4;
- (id)keyEnumerator;
- (id)nameFromPath:(id)a3 extra:(id)a4;
- (id)objectForKey:(id)a3;
- (id)pasteboardDataRepresentation;
- (id)removeFile:(id)a3;
- (id)replaceFile:(id)a3 data:(id)a4;
- (id)replaceFile:(id)a3 path:(id)a4;
- (id)serialize:(void *)a3 length:(unint64_t *)a4;
- (id)setPackage:(BOOL)a3;
- (id)tmpNameFromPath:(id)a3;
- (id)tmpNameFromPath:(id)a3 extension:(id)a4;
- (int64_t)validatePath:(id)a3 ignore:(id)a4;
- (unint64_t)addDirNamed:(id)a3;
- (unint64_t)addFileNamed:(id)a3 fileAttributes:(id)a4;
- (unint64_t)count;
- (unint64_t)initUnixFile:(id)a3;
- (unint64_t)insertItem:(id)a3 path:(id)a4 dirInfo:(id)a5 zone:(_NSZone *)a6 plist:(id)a7;
- (unint64_t)internalSaveTo:(id)a3 removeBackup:(BOOL)a4 errorHandler:(id)a5;
- (unint64_t)internalSaveTo:(id)a3 removeBackup:(BOOL)a4 errorHandler:(id)a5 temp:(id)a6 backup:(id)a7;
- (unint64_t)internalWritePath:(id)a3 errorHandler:(id)a4 remapContents:(BOOL)a5 hardLinkPath:(id)a6;
- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7;
- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 markBusy:(BOOL)a7 hardLinkPath:(id)a8;
- (void)dealloc;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation NSRTFD

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    [a1 setVersion:1];
  }
}

- (NSRTFD)init
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) init];
  return self;
}

- (NSRTFD)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithObjects:a3 forKeys:a4 count:a5];
  return self;
}

- (NSRTFD)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithDictionary:a3 copyItems:a4];
  return self;
}

- (NSRTFD)initWithDictionary:(id)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithDictionary:a3];
  return self;
}

- (NSRTFD)initWithContentsOfFile:(id)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithContentsOfFile:a3];
  return self;
}

- (NSRTFD)initWithCapacity:(unint64_t)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithCapacity:a3];
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSRTFD;
  -[NSRTFD dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->dict, "count");
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->dict, "objectForKey:", a3);
}

- (id)keyEnumerator
{
  return (id)-[NSMutableDictionary keyEnumerator](self->dict, "keyEnumerator");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (_NSIsNSData() && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = -[NSPageData initWithData:]( +[NSData allocWithZone:](NSPageData, "allocWithZone:", [a3 zone]),  "initWithData:",  a3);
    -[NSMutableDictionary setObject:forKey:](self->dict, "setObject:forKey:", v7, a4);
  }

  else
  {
    -[NSMutableDictionary setObject:forKey:](self->dict, "setObject:forKey:", a3, a4);
  }

- (void)removeObjectForKey:(id)a3
{
}

- (BOOL)isPackage
{
  return -[NSRTFD objectForKey:](self, "objectForKey:", @"..") == 0;
}

- (id)setPackage:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[NSRTFD isPackage](self, "isPackage") != a3)
  {
    if (v3)
    {
      -[NSRTFD removeObjectForKey:](self, "removeObjectForKey:", @"..");
    }

    else
    {
      v5 = -[NSPageData init]( +[NSData allocWithZone:](&OBJC_CLASS___NSPageData, "allocWithZone:", -[NSRTFD zone](self, "zone")),  "init");
      -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v5, @"..");
    }
  }

  return self;
}

- (unint64_t)initUnixFile:(id)a3
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = 0LL;
  -[NSRTFD initFromDocument:error:](self, "initFromDocument:error:", a3, v4);
  return v4[0];
}

- (id)initFromDocument:(id)a3 error:(unint64_t *)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v7 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  v8 = -[NSRTFD init](self, "init");
  if (![a3 length]) {
    goto LABEL_8;
  }
  if (([a3 isAbsolutePath] & 1) == 0) {
    a3 = -[NSString stringByAppendingPathComponent:]( -[NSFileManager currentDirectoryPath](v7, "currentDirectoryPath"),  "stringByAppendingPathComponent:",  a3);
  }
  if (!-[NSFileManager fileExistsAtPath:isDirectory:](v7, "fileExistsAtPath:isDirectory:", a3, &v11))
  {
LABEL_8:
    if (a4) {
      *a4 = 9LL;
    }
    goto LABEL_13;
  }

  if (v11)
  {
    unint64_t v9 = -[NSRTFD addDirNamed:](v8, "addDirNamed:", a3);
    if (!v9) {
      return v8;
    }
    goto LABEL_11;
  }

  unint64_t v9 = -[NSRTFD addFileNamed:fileAttributes:]( v8,  "addFileNamed:fileAttributes:",  a3,  -[NSFileManager fileAttributesAtPath:traverseLink:](v7, "fileAttributesAtPath:traverseLink:", a3, 1LL));
  if (v9)
  {
LABEL_11:
    if (a4) {
      *a4 = v9;
    }
LABEL_13:

    return 0LL;
  }

  return v8;
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 markBusy:(BOOL)a7 hardLinkPath:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = -[NSRTFD keyEnumerator](self, "keyEnumerator");
  if (a4) {
    uint64_t v15 = *((unsigned __int16 *)a4 + 8);
  }
  else {
    uint64_t v15 = 511LL;
  }
  id v16 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0LL);
  uint64_t v31 = v15 | 0x1C0;
  if (_NXMakeDirs(a3, (v15 | 0x1C0) & ~+[NSPageData _umask](&OBJC_CLASS___NSPageData, "_umask")) < 0) {
    return 4LL;
  }
  uint64_t v29 = v15;
  if (v9)
  {
    v17 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
    v18 = -[NSNumber initWithBool:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithBool:", 1LL);
    v19 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  v18,  @"NSFileBusy",  0);

    -[NSFileManager changeFileAttributes:atPath:](v17, "changeFileAttributes:atPath:", v19, a3);
  }

  uint64_t v20 = [v14 nextObject];
  BOOL v30 = v9;
  if (v20)
  {
    uint64_t v21 = v20;
    do
    {
      id v22 = -[NSRTFD objectForKey:](self, "objectForKey:", v21);
      if (v22)
      {
        v23 = -[NSString initWithFormat:]( +[NSString allocWithZone:](&OBJC_CLASS___NSString, "allocWithZone:", -[NSRTFD zone](self, "zone")),  "initWithFormat:",  @"%@/%@",  a3,  v21);
        id v22 = (id)objc_msgSend( v22,  "writePath:docInfo:errorHandler:remapContents:hardLinkPath:",  v23,  objc_msgSend(v16, "objectForKey:", v21),  a5,  v10,  objc_msgSend(a8, "stringByAppendingPathComponent:", v21));
      }

      uint64_t v24 = [v14 nextObject];
      if (!v24) {
        break;
      }
      uint64_t v21 = v24;
    }

    while (!v22);
  }

  else
  {
    id v22 = 0LL;
  }

  if (v31 != v29) {
    _NXChmodFile((uint64_t)a3, v29 & ~+[NSPageData _umask](&OBJC_CLASS___NSPageData, "_umask"));
  }
  if (v30)
  {
    v25 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
    v26 = -[NSNumber initWithBool:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithBool:", 0LL);
    v27 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  v26,  @"NSFileBusy",  0);

    -[NSFileManager changeFileAttributes:atPath:](v25, "changeFileAttributes:atPath:", v27, a3);
  }

  return (unint64_t)v22;
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7
{
  return -[NSRTFD writePath:docInfo:errorHandler:remapContents:markBusy:hardLinkPath:]( self,  "writePath:docInfo:errorHandler:remapContents:markBusy:hardLinkPath:",  a3,  a4,  a5,  a6,  0LL,  a7);
}

- (unint64_t)internalWritePath:(id)a3 errorHandler:(id)a4 remapContents:(BOOL)a5 hardLinkPath:(id)a6
{
  BOOL v7 = a5;
  BOOL v11 = -[NSRTFD isPackage](self, "isPackage");
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  a3))
  {
    return 8LL;
  }

  if (v11) {
    return -[NSRTFD writePath:docInfo:errorHandler:remapContents:markBusy:hardLinkPath:]( self,  "writePath:docInfo:errorHandler:remapContents:markBusy:hardLinkPath:",  a3,  0LL,  a4,  v7,  1LL,  a6);
  }
  id v13 = -[NSRTFD objectForKey:](self, "objectForKey:", @"..");
  uint64_t v14 = objc_msgSend(-[NSRTFD getDirInfo:](self, "getDirInfo:", 0), "objectForKey:", @"..");
  if (v13) {
    return [v13 writePath:a3 docInfo:v14 errorHandler:a4 remapContents:v7 hardLinkPath:0];
  }
  else {
    return 12LL;
  }
}

- (unint64_t)internalSaveTo:(id)a3 removeBackup:(BOOL)a4 errorHandler:(id)a5 temp:(id)a6 backup:(id)a7
{
  BOOL v10 = a4;
  id v13 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  BOOL v14 = -[NSFileManager fileExistsAtPath:](v13, "fileExistsAtPath:", a3);
  BOOL v15 = -[NSFileManager isWritableFileAtPath:](v13, "isWritableFileAtPath:", a3);
  BOOL v16 = -[NSFileManager isDeletableFileAtPath:](v13, "isDeletableFileAtPath:", a3);
  if (v14) {
    id v17 = a3;
  }
  else {
    id v17 = 0LL;
  }
  if (!v14 || v15) {
    goto LABEL_9;
  }
  if (!v16) {
    return 11LL;
  }
  id v17 = a3;
LABEL_9:
  unint64_t v18 = -[NSRTFD internalWritePath:errorHandler:remapContents:hardLinkPath:]( self,  "internalWritePath:errorHandler:remapContents:hardLinkPath:",  a6,  a5,  v10,  v17);
  if (v18)
  {
    a7 = a6;
LABEL_12:
    _NXRemoveDocument((uint64_t)a7);
    return v18;
  }

  uint64_t v20 = _NXRenameFile((uint64_t)a6, (uint64_t)a3);
  if (v20 < 0) {
    unint64_t result = 5LL;
  }
  else {
    unint64_t result = 0LL;
  }
  if ((v20 & 0x8000000000000000LL) == 0 && v10) {
    goto LABEL_12;
  }
  return result;
}

- (id)nameFromPath:(id)a3 extra:(id)a4
{
  return (id)[a3 stringByAppendingString:a4];
}

- (id)tmpNameFromPath:(id)a3 extension:(id)a4
{
  return (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a3, "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  objc_msgSend( @".",  "stringByAppendingString:",  -[NSProcessInfo globallyUniqueString]( +[NSProcessInfo processInfo](NSProcessInfo, "processInfo"),  "globallyUniqueString"))),  "stringByAppendingPathExtension:",  a4);
}

- (id)tmpNameFromPath:(id)a3
{
  return -[NSRTFD tmpNameFromPath:extension:](self, "tmpNameFromPath:extension:", a3, @"tmp");
}

- (unint64_t)internalSaveTo:(id)a3 removeBackup:(BOOL)a4 errorHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = -[NSRTFD tmpNameFromPath:extension:](self, "tmpNameFromPath:extension:", a3, @"tmp");
  if (v6) {
    id v10 = -[NSRTFD tmpNameFromPath:extension:](self, "tmpNameFromPath:extension:", a3, @"bak");
  }
  else {
    id v10 = -[NSRTFD nameFromPath:extra:](self, "nameFromPath:extra:", a3, @"~");
  }
  return -[NSRTFD internalSaveTo:removeBackup:errorHandler:temp:backup:]( self,  "internalSaveTo:removeBackup:errorHandler:temp:backup:",  a3,  v6,  a5,  v9,  v10);
}

- (id)dataRepresentation
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[NSRTFD zone](self, "zone");
  uint64_t v4 = -[NSAKSerializerStream init]( +[NSAKSerializerStream allocWithZone:](&OBJC_CLASS___NSAKSerializerStream, "allocWithZone:", v3),  "init");
  v11[0] = 1684436082LL;
  -[NSAKSerializerStream writeData:length:](v4, "writeData:length:", v11, 8LL);
  id v5 = -[NSAKSerializer initForSerializerStream:]( +[NSDocumentSerializer allocWithZone:](&OBJC_CLASS___NSDocumentSerializer, "allocWithZone:", v3),  "initForSerializerStream:",  v4);
  uint64_t v6 = [v5 serializeObject:self];
  uint64_t v7 = v6 + 8;
  id v8 = objc_allocWithZone(MEMORY[0x189603FB8]);
  id v9 = (void *)[v8 initWithLength:(v6 + *MEMORY[0x1895FD590] + 7) & -*MEMORY[0x1895FD590]];
  -[NSAKSerializerStream copySerializationInto:](v4, "copySerializationInto:", [v9 mutableBytes]);
  [v9 setLength:v7];

  return v9;
}

- (NSRTFD)initWithDataRepresentation:(id)a3
{
  unint64_t v5 = [a3 length];
  unint64_t v6 = v5 - 8;
  if (v5 < 8)
  {
    NSLog((NSString *)@"Unable to read RTFD from data:%p", a3);
LABEL_3:

    return 0LL;
  }

  id v8 = (_DWORD *)[a3 bytes];
  if (*v8 ^ 0x64667472 | *((unsigned __int8 *)v8 + 4))
  {
    id v9 = self;
    id v10 = a3;
  }

  else
  {
    if (v8[1])
    {
      NSLog((NSString *)@"Bad version in RTFD data:%p", a3);
      goto LABEL_3;
    }

    id v10 = (id)objc_msgSend(a3, "subdataWithRange:", 8, v6);
    id v9 = self;
  }

  return -[NSRTFD initWithPasteboardDataRepresentation:](v9, "initWithPasteboardDataRepresentation:", v10);
}

- (id)createRandomKey:(id)a3
{
  uint64_t v5 = -[NSRTFD zone](self, "zone");
  if (!-[NSRTFD objectForKey:](self, "objectForKey:", a3)) {
    return a3;
  }
  while (1)
  {
    uint64_t v6 = mach_absolute_time();
    uint64_t v7 = [a3 significantText];
    id v9 = -[NSString initWithFormat:]( +[NSString allocWithZone:](NSString, "allocWithZone:", v5),  "initWithFormat:",  @"%d_%@",  v6,  objc_msgSend(a3, "substringWithRange:", v7, v8));
    if (!-[NSRTFD objectForKey:](self, "objectForKey:", v9)) {
      break;
    }
  }

  return v9;
}

- (id)createUniqueKey:(id)a3
{
  do
    id v5 = -[NSRTFD createRandomKey:](self, "createRandomKey:", a3);
  while (-[NSRTFD objectForKey:]( self,  "objectForKey:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.tiff", v5)));
  return v5;
}

- (id)getDocument:(id)a3 docInfo:(id)a4
{
  uint64_t v6 = -[NSRTFD zone](self, "zone");
  __int16 v7 = *((_WORD *)a4 + 9);
  if ((v7 & 1) != 0) {
    return -[NSRTFD initFromDocument:error:]( +[NSRTFD allocWithZone:](&OBJC_CLASS___NSRTFD, "allocWithZone:", v6),  "initFromDocument:error:",  a3,  0LL);
  }
  else {
    return newLeafDocument((uint64_t)a3, v7, v6);
  }
}

- (id)replaceFile:(id)a3 data:(id)a4
{
  uint64_t v6 = -[NSPageData initWithData:]( +[NSData allocWithZone:](&OBJC_CLASS___NSPageData, "allocWithZone:", -[NSRTFD zone](self, "zone")),  "initWithData:",  a4);
  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v6, a3);

  return self;
}

- (id)replaceFile:(id)a3 path:(id)a4
{
  uint64_t v6 = self;
  uint64_t v7 = -[NSRTFD zone](self, "zone");
  id v8 = -[NSRTFD getDirInfo:](v6, "getDirInfo:", 1LL);
  id v9 = (void *)[v8 objectForKey:a3];
  id v10 = -[NSFileManager fileAttributesAtPath:traverseLink:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileAttributesAtPath:traverseLink:",  a4,  0LL);
  if (!v10) {
    return 0LL;
  }
  if (!v9)
  {
    id v13 = -[NSDocInfo initWithFileAttributes:]( +[NSDocInfo allocWithZone:](&OBJC_CLASS___NSDocInfo, "allocWithZone:", v7),  "initWithFileAttributes:",  v10);
    uint64_t v14 = -[NSRTFD getDocument:docInfo:](v6, "getDocument:docInfo:", a4, v13);
    if (!v14)
    {

      return v6;
    }

    uint64_t v12 = (void *)v14;
    -[NSRTFD setObject:forKey:](v6, "setObject:forKey:", v14, a3);
    [v8 setObject:v13 forKey:a3];

    goto LABEL_8;
  }

  [v9 setFileAttributes:v10];
  uint64_t v11 = -[NSRTFD getDocument:docInfo:](v6, "getDocument:docInfo:", a4, v9);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    -[NSRTFD setObject:forKey:](v6, "setObject:forKey:", v11, a3);
LABEL_8:
  }

  return v6;
}

- (id)addCommon:(id)a3 docInfo:(id)a4 value:(id)a5 zone:(_NSZone *)a6
{
  id v10 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 1LL, a4, a5, a6);
  id v11 = -[NSRTFD uniqueKey:](self, "uniqueKey:", [a3 lastPathComponent]);
  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", a5, v11);
  if (a4) {
    [v10 setObject:a4 forKey:v11];
  }
  return v11;
}

- (id)_getDocInfoForKey:(id)a3
{
  return (id)objc_msgSend(-[NSRTFD getDirInfo:](self, "getDirInfo:", 0), "objectForKey:", a3);
}

- (id)addFile:(id)a3
{
  uint64_t v5 = -[NSRTFD zone](self, "zone");
  uint64_t v6 = -[NSFileManager fileAttributesAtPath:traverseLink:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileAttributesAtPath:traverseLink:",  a3,  0LL);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = -[NSDocInfo initWithFileAttributes:]( +[NSDocInfo allocWithZone:](&OBJC_CLASS___NSDocInfo, "allocWithZone:", v5),  "initWithFileAttributes:",  v6);
  id v8 = -[NSRTFD getDocument:docInfo:](self, "getDocument:docInfo:", a3, v7);
  if (v8)
  {
    id v9 = v8;
    id v10 = -[NSRTFD addCommon:docInfo:value:zone:](self, "addCommon:docInfo:value:zone:", a3, v7, v8, v5);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)addLink:(id)a3
{
  uint64_t v5 = -[NSRTFD zone](self, "zone");
  id result = -[NSFileManager fileAttributesAtPath:traverseLink:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileAttributesAtPath:traverseLink:",  a3,  1LL);
  if (result)
  {
    uint64_t v7 = -[NSDocInfo initWithFileAttributes:]( +[NSDocInfo allocWithZone:](&OBJC_CLASS___NSDocInfo, "allocWithZone:", v5),  "initWithFileAttributes:",  result);
    *(&v7->mode + 1) |= 4u;
    id v8 = -[NSPageData initWithData:]( +[NSData allocWithZone:](NSPageData, "allocWithZone:", v5),  "initWithData:",  [a3 dataUsingEncoding:4 allowLossyConversion:1]);
    id v9 = -[NSRTFD addCommon:docInfo:value:zone:](self, "addCommon:docInfo:value:zone:", a3, v7, v8, v5);

    return v9;
  }

  return result;
}

- (id)dataForFile:(id)a3
{
  id v5 = -[NSRTFD objectForKey:](self, "objectForKey:");
  if (!v5) {
    return v5;
  }
  uint64_t v6 = objc_msgSend(-[NSRTFD getDirInfo:](self, "getDirInfo:", 0), "objectForKey:", a3);
  if (!v6 || (*(_WORD *)(v6 + 18) & 4) == 0) {
    return v5;
  }
  id v8 = (id)[objc_allocWithZone((Class)NSString) initWithData:v5 encoding:4];
  return (id)[MEMORY[0x189603F48] dataWithContentsOfFile:v8];
}

- (id)removeFile:(id)a3
{
  id v5 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0LL);
  -[NSRTFD removeObjectForKey:](self, "removeObjectForKey:", a3);
  [v5 removeObjectForKey:a3];
  return self;
}

- (id)copy:(id)a3 into:(id)a4
{
  uint64_t v7 = [a4 zone];
  id v8 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0LL);
  id v9 = (void *)[a4 uniqueKey:a3];
  id v10 = (void *)objc_msgSend(-[NSRTFD objectForKey:](self, "objectForKey:", a3), "copyWithZone:", v7);
  [a4 setObject:v10 forKey:v9];

  uint64_t v11 = [v8 objectForKey:v9];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    id v13 = (void *)[a4 getDirInfo:1];
    uint64_t v14 = (void *)[v12 copyWithZone:v7];
    [v13 setObject:v14 forKey:v9];
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0LL);
  id v7 = -[NSRTFD keyEnumerator](self, "keyEnumerator");
  id v8 = 0LL;
  while (1)
  {
    uint64_t v9 = [v7 nextObject];
    if (!v9) {
      break;
    }
    id v10 = (void *)v9;
    id v11 = -[NSRTFD objectForKey:](self, "objectForKey:", v9);
    if (([v10 isEqual:@"."] & 1) == 0)
    {
      if (v6)
      {
        uint64_t v12 = [v6 objectForKey:v10];
        if (v12)
        {
          id v13 = (void *)v12;
          if (!v8) {
            id v8 = (void *)[v5 getDirInfo:1];
          }
          uint64_t v14 = (void *)[v13 copyWithZone:a3];
          [v8 setObject:v14 forKey:v10];
        }
      }

      BOOL v15 = (void *)[v11 copyWithZone:a3];
      [v5 setObject:v15 forKey:v10];
    }
  }

  return v5;
}

- (id)copy
{
  return -[NSRTFD copyWithZone:](self, "copyWithZone:", 0LL);
}

- (id)addData:(id)a3 name:(id)a4
{
  id v6 = -[NSPageData initWithData:]( +[NSData allocWithZone:](&OBJC_CLASS___NSPageData, "allocWithZone:", -[NSRTFD zone](self, "zone")),  "initWithData:",  a3);
  id v7 = -[NSRTFD uniqueKey:](self, "uniqueKey:", [a4 lastPathComponent]);
  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v6, v7);

  return v7;
}

- (int64_t)validatePath:(id)a3 ignore:(id)a4
{
  uint64_t v7 = -[NSRTFD zone](self, "zone");
  id v8 = -[NSRTFD keyEnumerator](self, "keyEnumerator");
  id v9 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0LL);
  if (!v9) {
    return 0LL;
  }
  id v10 = v9;
  uint64_t v11 = [v8 nextObject];
  if (!v11) {
    return 0LL;
  }
  uint64_t v12 = v11;
  uint64_t v26 = v7;
  id v13 = 0LL;
  uint64_t v14 = &off_189C61000;
  do
  {
    if (-[NSRTFD objectForKey:](self, "objectForKey:", v12) && ![a4 objectForKey:v12])
    {
      BOOL v15 = v14;
      BOOL v16 = (void *)[objc_allocWithZone((Class)v14[439]) initWithFormat:@"%@/%@", a3, v12];
      uint64_t v17 = [v10 objectForKey:v12];
      if (v17)
      {
        uint64_t v18 = v17;
        v19 = -[NSFileManager fileAttributesAtPath:traverseLink:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileAttributesAtPath:traverseLink:",  v16,  0LL);
        if (v19)
        {
          objc_msgSend(-[NSDictionary fileModificationDate](v19, "fileModificationDate"), "timeIntervalSince1970");
          if (*(void *)(v18 + 8) != (uint64_t)v20)
          {
            if (!v13) {
              id v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x189603FA8], "allocWithZone:", v26), "init");
            }
            [v13 addObject:v12];
          }
        }
      }

      uint64_t v14 = v15;
    }

    uint64_t v12 = [v8 nextObject];
  }

  while (v12);
  if (!v13) {
    return 0LL;
  }
  int64_t v21 = [v13 count];
  if (v21 >= 1)
  {
    for (uint64_t i = 0LL; i != v21; ++i)
    {
      uint64_t v23 = [v13 objectAtIndex:i];
      uint64_t v24 = (void *)[objc_allocWithZone((Class)v14[439]) initWithFormat:@"%@/%@", a3, v23];
      -[NSRTFD replaceFile:path:](self, "replaceFile:path:", v23, v24);
    }
  }

  return v21;
}

- (id)initFromElement:(id)a3 ofDocument:(id)a4
{
  uint64_t v7 = -[NSRTFD zone](self, "zone");
  uint64_t v8 = [a4 objectForKey:a3];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = -[NSRTFD init](self, "init");
    uint64_t v11 = (void *)[a4 getDirInfo:0];
    if (v11)
    {
      uint64_t v12 = [v11 objectForKey:a3];
      if (v12)
      {
        id v13 = (void *)v12;
        uint64_t v14 = -[NSDirInfo init](+[NSDirInfo allocWithZone:](&OBJC_CLASS___NSDirInfo, "allocWithZone:", v7), "init");
        BOOL v15 = (void *)[v13 copyWithZone:v7];
        -[NSDirInfo setObject:forKey:](v14, "setObject:forKey:", v15, @"..");
        -[NSRTFD setObject:forKey:](v10, "setObject:forKey:", v14, @".");
      }
    }

    BOOL v16 = (void *)[v9 copyWithZone:v7];
    -[NSRTFD setObject:forKey:](v10, "setObject:forKey:", v16, @"..");
  }

  else
  {
    -[NSRTFD dealloc](self, "dealloc");
    return 0LL;
  }

  return v10;
}

- (id)getDirInfo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[NSRTFD objectForKey:](self, "objectForKey:", @".");
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    id v5 = -[NSDirInfo init]( +[NSDirInfo allocWithZone:](&OBJC_CLASS___NSDirInfo, "allocWithZone:", -[NSRTFD zone](self, "zone")),  "init");
    -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v5, @".");
  }

  return v5;
}

- (unint64_t)addFileNamed:(id)a3 fileAttributes:(id)a4
{
  uint64_t v7 = -[NSRTFD zone](self, "zone");
  uint64_t v8 = -[NSPageData initWithContentsOfMappedFile:]( +[NSData allocWithZone:](&OBJC_CLASS___NSPageData, "allocWithZone:", v7),  "initWithContentsOfMappedFile:",  a3);
  if (!v8) {
    return 10LL;
  }
  id v9 = v8;
  id v10 = -[NSDirInfo init](+[NSDirInfo allocWithZone:](&OBJC_CLASS___NSDirInfo, "allocWithZone:", v7), "init");
  uint64_t v11 = -[NSDocInfo initWithFileAttributes:]( +[NSDocInfo allocWithZone:](&OBJC_CLASS___NSDocInfo, "allocWithZone:", v7),  "initWithFileAttributes:",  a4);
  *(&v11->mode + 1) |= 2u;
  -[NSDirInfo setObject:forKey:](v10, "setObject:forKey:", v11, @"..");

  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v9, @"..");
  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v10, @".");

  return 0LL;
}

- (unint64_t)insertItem:(id)a3 path:(id)a4 dirInfo:(id)a5 zone:(_NSZone *)a6 plist:(id)a7
{
  uint64_t v8 = a6;
  id v9 = a5;
  if (a5)
  {
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id v9 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0LL);
  if (!v8) {
LABEL_3:
  }
    uint64_t v8 = (_NSZone *)-[NSRTFD zone](self, "zone");
LABEL_4:
  id v13 = -[NSFileManager fileAttributesAtPath:traverseLink:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileAttributesAtPath:traverseLink:",  a4,  0LL);
  if (v13)
  {
    uint64_t v14 = -[NSDocInfo initWithFileAttributes:]( +[NSDocInfo allocWithZone:](&OBJC_CLASS___NSDocInfo, "allocWithZone:", v8),  "initWithFileAttributes:",  v13);
    __int16 v15 = *(&v14->mode + 1);
    if ((v15 & 1) != 0)
    {
      uint64_t v17 = -[NSRTFD init](+[NSRTFD allocWithZone:](&OBJC_CLASS___NSRTFD, "allocWithZone:", v8), "init");
      unint64_t v18 = -[NSRTFD addDirNamed:](v17, "addDirNamed:", a4);
      if (!v17)
      {
LABEL_17:

        return v18;
      }
    }

    else
    {
      BOOL v16 = newLeafDocument((uint64_t)a4, v15, (uint64_t)v8);
      uint64_t v17 = (NSRTFD *)v16;
      if (v16) {
        unint64_t v18 = 0LL;
      }
      else {
        unint64_t v18 = 10LL;
      }
      if (!v16) {
        goto LABEL_17;
      }
    }

    if (!v18)
    {
      [a7 setObject:v17 forKey:a3];
      [v9 setObject:v14 forKey:a3];
    }

    goto LABEL_17;
  }

  return 9LL;
}

- (unint64_t)addDirNamed:(id)a3
{
  uint64_t v5 = -[NSRTFD zone](self, "zone");
  BOOL v6 = -[NSDirInfo init](+[NSDirInfo allocWithZone:](&OBJC_CLASS___NSDirInfo, "allocWithZone:", v5), "init");
  uint64_t v7 = -[NSFileManager directoryContentsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "directoryContentsAtPath:",  a3);
  if (!v7) {
    uint64_t v7 = (NSArray *)[MEMORY[0x189603F18] array];
  }
  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v6, @".");
  uint64_t v8 = -[NSArray count](v7, "count");
  if (v8 < 1)
  {
LABEL_7:
    unint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = -[NSArray objectAtIndex:](v7, "objectAtIndex:", v10);
      uint64_t v12 = (void *)[objc_allocWithZone((Class)NSString) initWithFormat:@"%@/%@", a3, v11];
      unint64_t v13 = -[NSRTFD insertItem:path:dirInfo:zone:plist:]( self,  "insertItem:path:dirInfo:zone:plist:",  v11,  v12,  v6,  v5,  self);

      if (v13) {
        break;
      }
      if (v9 == ++v10) {
        goto LABEL_7;
      }
    }
  }

  return v13;
}

- (id)serialize:(void *)a3 length:(unint64_t *)a4
{
  uint64_t v7 = -[NSRTFD zone](self, "zone");
  uint64_t v8 = -[NSAKSerializerStream init]( +[NSAKSerializerStream allocWithZone:](&OBJC_CLASS___NSAKSerializerStream, "allocWithZone:", v7),  "init");
  id v9 = -[NSAKSerializer initForSerializerStream:]( +[NSDocumentSerializer allocWithZone:](&OBJC_CLASS___NSDocumentSerializer, "allocWithZone:", v7),  "initForSerializerStream:",  v8);
  unint64_t v10 = [v9 serializeObject:self];
  *a4 = v10;
  *a3 = 0LL;
  uint64_t v11 = vm_allocate(*MEMORY[0x1895FBBE0], (vm_address_t *)a3, v10, 1);
  if ((_DWORD)v11) {
    objc_msgSend( (id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  @"NSAppKitVirtualMemoryException",  @"vm_allocate() failed in NSRTFD serialize:length:",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11),  @"NSErrorCodeExceptionInfo",  0)),  "raise");
  }
  -[NSAKSerializerStream copySerializationInto:](v8, "copySerializationInto:", *a3);

  return self;
}

- (id)freeSerialized:(void *)a3 length:(unint64_t)a4
{
  uint64_t v5 = mach_vm_deallocate(*MEMORY[0x1895FBBE0], (mach_vm_address_t)a3, a4);
  if ((_DWORD)v5) {
    objc_msgSend( (id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  @"NSAppKitVirtualMemoryException",  @"vm_allocate() failed in NSRTFD freeSerialized:length:",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5),  @"NSErrorCodeExceptionInfo",  0)),  "raise");
  }
  return self;
}

- (id)pasteboardDataRepresentation
{
  v6[1] = *MEMORY[0x1895F89C0];
  -[NSRTFD serialize:length:](self, "serialize:length:", v6, &v5);
  BOOL v3 = (void *)[MEMORY[0x189603F48] dataWithBytes:v6[0] length:v5];
  -[NSRTFD freeSerialized:length:](self, "freeSerialized:length:", v6[0], v5);
  return v3;
}

- (NSRTFD)initWithPasteboardDataRepresentation:(id)a3
{
  uint64_t v5 = -[NSRTFD zone](self, "zone");
  id v6 = -[NSAKDeserializerStream initFromMemoryNoCopy:length:freeWhenDone:]( +[NSAKDeserializerStream allocWithZone:](NSAKDeserializerStream, "allocWithZone:", v5),  "initFromMemoryNoCopy:length:freeWhenDone:",  [a3 bytes],  objc_msgSend(a3, "length"),  0);
  id v7 = -[NSAKDeserializer initForDeserializerStream:]( +[NSDocumentDeserializer allocWithZone:](&OBJC_CLASS___NSDocumentDeserializer, "allocWithZone:", v5),  "initForDeserializerStream:",  v6);
  uint64_t v8 = (NSRTFD *)[v7 deserializeNewObject];

  return v8;
}

- (BOOL)_isLink:(id)a3
{
  id v4 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0LL);
  if (v4)
  {
    uint64_t v5 = [v4 objectForKey:a3];
    LOBYTE(v4) = v5 && (*(_WORD *)(v5 + 18) & 4) != 0;
  }

  return (char)v4;
}

@end