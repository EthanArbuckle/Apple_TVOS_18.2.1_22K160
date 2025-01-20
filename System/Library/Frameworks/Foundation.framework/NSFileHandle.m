@interface NSFileHandle
+ (BOOL)supportsSecureCoding;
+ (NSFileHandle)allocWithZone:(_NSZone *)a3;
+ (NSFileHandle)fileHandleForReadingAtPath:(NSString *)path;
+ (NSFileHandle)fileHandleForReadingFromURL:(NSURL *)url error:(NSError *)error;
+ (NSFileHandle)fileHandleForUpdatingAtPath:(NSString *)path;
+ (NSFileHandle)fileHandleForUpdatingURL:(NSURL *)url error:(NSError *)error;
+ (NSFileHandle)fileHandleForWritingAtPath:(NSString *)path;
+ (NSFileHandle)fileHandleForWritingToURL:(NSURL *)url error:(NSError *)error;
+ (NSFileHandle)fileHandleWithNullDevice;
+ (NSFileHandle)fileHandleWithStandardError;
+ (NSFileHandle)fileHandleWithStandardInput;
+ (NSFileHandle)fileHandleWithStandardOutput;
+ (id)fileHandleForReadingFromURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5;
+ (id)fileHandleForUpdatingURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5;
+ (id)fileHandleForWritingToURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5;
+ (void)initialize;
- (BOOL)closeAndReturnError:(NSError *)error;
- (BOOL)getOffset:(unint64_t *)offsetInFile error:(NSError *)error;
- (BOOL)seekToEndReturningOffset:(unint64_t *)offsetInFile error:(NSError *)error;
- (BOOL)seekToOffset:(unint64_t)offset error:(NSError *)error;
- (BOOL)synchronizeAndReturnError:(NSError *)error;
- (BOOL)truncateAtOffset:(unint64_t)offset error:(NSError *)error;
- (BOOL)writeData:(NSData *)data error:(NSError *)error;
- (Class)classForCoder;
- (NSData)availableData;
- (NSData)readDataOfLength:(NSUInteger)length;
- (NSData)readDataToEndOfFile;
- (NSData)readDataToEndOfFileAndReturnError:(NSError *)error;
- (NSData)readDataUpToLength:(NSUInteger)length error:(NSError *)error;
- (NSFileHandle)initWithCoder:(NSCoder *)coder;
- (NSFileHandle)initWithFileDescriptor:(int)fd;
- (NSFileHandle)initWithFileDescriptor:(int)fd closeOnDealloc:(BOOL)closeopt;
- (NSFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5;
- (NSFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6;
- (NSFileHandle)initWithURL:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6;
- (int)fileDescriptor;
- (unint64_t)offsetInFile;
- (unint64_t)seekToEndOfFile;
- (void)closeFile;
- (void)encodeWithCoder:(id)a3;
- (void)readabilityHandler;
- (void)seekToFileOffset:(unint64_t)offset;
- (void)setReadabilityHandler:(void *)readabilityHandler;
- (void)setWriteabilityHandler:(void *)writeabilityHandler;
- (void)synchronizeFile;
- (void)truncateFileAtOffset:(unint64_t)offset;
- (void)writeData:(NSData *)data;
- (void)writeabilityHandler;
@end

@implementation NSFileHandle

+ (void)initialize
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if ((id)objc_opt_class() == a1)
  {
    int v2 = getrlimit(8, &v7);
    *(void *)v8 = 0x1D00000001LL;
    int rlim_max = 0;
    size_t v5 = 4LL;
    if (sysctl(v8, 2u, &rlim_max, &v5, 0LL, 0LL) | v2)
    {
      if (v2) {
        return;
      }
      LODWORD(v3) = rlim_max;
    }

    else
    {
      LODWORD(v3) = rlim_max;
      if (v7.rlim_max < rlim_max)
      {
        int rlim_max = v7.rlim_max;
        LODWORD(v3) = v7.rlim_max;
      }
    }

    if (v7.rlim_cur < (int)v3)
    {
      rlim_t v3 = (int)v3;
      rlimit v4 = v7;
      v4.rlim_cur = v3;
      setrlimit(8, &v4);
    }
  }

+ (NSFileHandle)fileHandleWithStandardInput
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __43__NSFileHandle_fileHandleWithStandardInput__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C4961C8 != -1) {
    dispatch_once(&qword_18C4961C8, v3);
  }
  return (NSFileHandle *)_MergedGlobals_25;
}

uint64_t __43__NSFileHandle_fileHandleWithStandardInput__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_allocWithZone((Class)_NSStdIOFileHandle) initWithFileDescriptor:0 closeOnDealloc:0];
  _MergedGlobals_25 = result;
  if (result)
  {
    rlim_t v3 = (unsigned __int16 *)(result + 100);
    do
      unsigned __int16 v4 = __ldaxr(v3);
    while (__stlxr(v4 | 0x8000, v3));
  }

  else
  {
    uint64_t result = [*(id *)(a1 + 32) fileHandleWithNullDevice];
    _MergedGlobals_25 = result;
  }

  return result;
}

+ (NSFileHandle)fileHandleWithStandardOutput
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __44__NSFileHandle_fileHandleWithStandardOutput__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C4961D8 != -1) {
    dispatch_once(&qword_18C4961D8, v3);
  }
  return (NSFileHandle *)qword_18C4961D0;
}

uint64_t __44__NSFileHandle_fileHandleWithStandardOutput__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_allocWithZone((Class)_NSStdIOFileHandle) initWithFileDescriptor:1 closeOnDealloc:0];
  qword_18C4961D0 = result;
  if (result)
  {
    rlim_t v3 = (unsigned __int16 *)(result + 100);
    do
      unsigned __int16 v4 = __ldaxr(v3);
    while (__stlxr(v4 | 0x4000, v3));
  }

  else
  {
    uint64_t result = [*(id *)(a1 + 32) fileHandleWithNullDevice];
    qword_18C4961D0 = result;
  }

  return result;
}

+ (NSFileHandle)fileHandleWithStandardError
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __43__NSFileHandle_fileHandleWithStandardError__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C4961E8 != -1) {
    dispatch_once(&qword_18C4961E8, v3);
  }
  return (NSFileHandle *)qword_18C4961E0;
}

uint64_t __43__NSFileHandle_fileHandleWithStandardError__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_allocWithZone((Class)_NSStdIOFileHandle) initWithFileDescriptor:2 closeOnDealloc:0];
  qword_18C4961E0 = result;
  if (result)
  {
    rlim_t v3 = (unsigned __int16 *)(result + 100);
    do
      unsigned __int16 v4 = __ldaxr(v3);
    while (__stlxr(v4 | 0x2000, v3));
  }

  else
  {
    uint64_t result = [*(id *)(a1 + 32) fileHandleWithNullDevice];
    qword_18C4961E0 = result;
  }

  return result;
}

+ (NSFileHandle)fileHandleWithNullDevice
{
  if (qword_18C4961F8 != -1) {
    dispatch_once(&qword_18C4961F8, &__block_literal_global_9);
  }
  return (NSFileHandle *)qword_18C4961F0;
}

uint64_t __40__NSFileHandle_fileHandleWithNullDevice__block_invoke()
{
  uint64_t result = [objc_allocWithZone((Class)NSNullFileHandle) init];
  qword_18C4961F0 = result;
  return result;
}

+ (NSFileHandle)allocWithZone:(_NSZone *)a3
{
  if (&OBJC_CLASS___NSFileHandle == a1) {
    a1 = (id)objc_opt_self();
  }
  return (NSFileHandle *)NSAllocateObject((Class)a1, 0LL, a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileHandle)initWithCoder:(NSCoder *)coder
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0]);
    -[NSFileHandle encodeWithCoder:](v7, v8, v9);
  }

  size_t v5 = (void *)-[NSCoder decodeXPCObjectOfType:forKey:]( coder,  "decodeXPCObjectOfType:forKey:",  MEMORY[0x1895F9270],  @"NS.fd");
  if (v5) {
    return -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( self,  "initWithFileDescriptor:closeOnDealloc:",  xpc_fd_dup(v5),  1LL);
  }

  return 0LL;
}

- (void)encodeWithCoder:(id)a3
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5
{
  rlimit v7 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (NSFileHandle)initWithFileDescriptor:(int)fd closeOnDealloc:(BOOL)closeopt
{
  v6 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSFileHandle)initWithFileDescriptor:(int)fd
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSFileHandle)initWithURL:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  else {
    uint64_t v11 = 0LL;
  }
  return -[NSFileHandle initWithPath:flags:createMode:error:]( self,  "initWithPath:flags:createMode:error:",  v11,  a4,  a5,  a6);
}

- (NSFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  SEL v8 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v8);
}

+ (NSFileHandle)fileHandleForReadingAtPath:(NSString *)path
{
  return (NSFileHandle *)(id)[objc_allocWithZone((Class)a1) initWithPath:path flags:0 createMode:0];
}

+ (NSFileHandle)fileHandleForWritingAtPath:(NSString *)path
{
  return (NSFileHandle *)(id)[objc_allocWithZone((Class)a1) initWithPath:path flags:1 createMode:0];
}

+ (NSFileHandle)fileHandleForUpdatingAtPath:(NSString *)path
{
  return (NSFileHandle *)(id)[objc_allocWithZone((Class)a1) initWithPath:path flags:2 createMode:0];
}

+ (NSFileHandle)fileHandleForReadingFromURL:(NSURL *)url error:(NSError *)error
{
  return (NSFileHandle *)(id)[objc_allocWithZone((Class)a1) initWithURL:url flags:0 createMode:0 error:error];
}

+ (NSFileHandle)fileHandleForWritingToURL:(NSURL *)url error:(NSError *)error
{
  return (NSFileHandle *)(id)[objc_allocWithZone((Class)a1) initWithURL:url flags:1 createMode:0 error:error];
}

+ (NSFileHandle)fileHandleForUpdatingURL:(NSURL *)url error:(NSError *)error
{
  return (NSFileHandle *)(id)[objc_allocWithZone((Class)a1) initWithURL:url flags:2 createMode:0 error:error];
}

+ (id)fileHandleForReadingFromURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  return (id)[objc_allocWithZone((Class)a1) initWithURL:a3 flags:512 createMode:a4 error:a5];
}

+ (id)fileHandleForWritingToURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  return (id)[objc_allocWithZone((Class)a1) initWithURL:a3 flags:513 createMode:a4 error:a5];
}

+ (id)fileHandleForUpdatingURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  return (id)[objc_allocWithZone((Class)a1) initWithURL:a3 flags:514 createMode:a4 error:a5];
}

- (NSData)availableData
{
  unsigned __int16 v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSData)readDataToEndOfFile
{
  unsigned __int16 v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSData)readDataToEndOfFileAndReturnError:(NSError *)error
{
  uint64_t v6 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_readDataToEndOfFile);
  if (v6 == +[NSFileHandle instanceMethodForSelector:]( &OBJC_CLASS___NSFileHandle,  "instanceMethodForSelector:",  sel_readDataToEndOfFile))
  {
    SEL v8 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v8);
  }

  if (error) {
    *error = 0LL;
  }
  return -[NSFileHandle readDataToEndOfFile](self, "readDataToEndOfFile");
}

- (NSData)readDataOfLength:(NSUInteger)length
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSData)readDataUpToLength:(NSUInteger)length error:(NSError *)error
{
  uint64_t v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_readDataOfLength_);
  if (v8 == +[NSFileHandle instanceMethodForSelector:]( &OBJC_CLASS___NSFileHandle,  "instanceMethodForSelector:",  sel_readDataOfLength_))
  {
    v10 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }

  if (error) {
    *error = 0LL;
  }
  return -[NSFileHandle readDataOfLength:](self, "readDataOfLength:", length);
}

- (void)writeData:(NSData *)data
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)writeData:(NSData *)data error:(NSError *)error
{
  uint64_t v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_writeData_);
  if (v8 == +[NSFileHandle instanceMethodForSelector:]( &OBJC_CLASS___NSFileHandle,  "instanceMethodForSelector:",  sel_writeData_))
  {
    v10 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }

  if (error) {
    *error = 0LL;
  }
  -[NSFileHandle writeData:](self, "writeData:", data);
  return 1;
}

- (unint64_t)offsetInFile
{
  unsigned __int16 v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)getOffset:(unint64_t *)offsetInFile error:(NSError *)error
{
  uint64_t v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_offsetInFile);
  if (v8 == +[NSFileHandle instanceMethodForSelector:]( &OBJC_CLASS___NSFileHandle,  "instanceMethodForSelector:",  sel_offsetInFile))
  {
    uint64_t v11 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v11);
  }

  if (error) {
    *error = 0LL;
  }
  unint64_t v9 = -[NSFileHandle offsetInFile](self, "offsetInFile");
  if (offsetInFile) {
    *offsetInFile = v9;
  }
  return 1;
}

- (unint64_t)seekToEndOfFile
{
  unsigned __int16 v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)seekToEndReturningOffset:(unint64_t *)offsetInFile error:(NSError *)error
{
  uint64_t v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_seekToEndOfFile);
  if (v8 == +[NSFileHandle instanceMethodForSelector:]( &OBJC_CLASS___NSFileHandle,  "instanceMethodForSelector:",  sel_seekToEndOfFile))
  {
    uint64_t v11 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v11);
  }

  if (error) {
    *error = 0LL;
  }
  unint64_t v9 = -[NSFileHandle seekToEndOfFile](self, "seekToEndOfFile");
  if (offsetInFile) {
    *offsetInFile = v9;
  }
  return 1;
}

- (void)seekToFileOffset:(unint64_t)offset
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)seekToOffset:(unint64_t)offset error:(NSError *)error
{
  uint64_t v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_seekToFileOffset_);
  if (v8 == +[NSFileHandle instanceMethodForSelector:]( &OBJC_CLASS___NSFileHandle,  "instanceMethodForSelector:",  sel_seekToFileOffset_))
  {
    v10 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }

  if (error) {
    *error = 0LL;
  }
  -[NSFileHandle seekToFileOffset:](self, "seekToFileOffset:", offset);
  return 1;
}

- (void)truncateFileAtOffset:(unint64_t)offset
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)truncateAtOffset:(unint64_t)offset error:(NSError *)error
{
  uint64_t v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_truncateFileAtOffset_);
  if (v8 == +[NSFileHandle instanceMethodForSelector:]( &OBJC_CLASS___NSFileHandle,  "instanceMethodForSelector:",  sel_truncateFileAtOffset_))
  {
    v10 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }

  if (error) {
    *error = 0LL;
  }
  -[NSFileHandle truncateFileAtOffset:](self, "truncateFileAtOffset:", offset);
  return 1;
}

- (void)synchronizeFile
{
  unsigned __int16 v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)synchronizeAndReturnError:(NSError *)error
{
  uint64_t v6 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_synchronizeFile);
  if (v6 == +[NSFileHandle instanceMethodForSelector:]( &OBJC_CLASS___NSFileHandle,  "instanceMethodForSelector:",  sel_synchronizeFile))
  {
    uint64_t v8 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v8);
  }

  if (error) {
    *error = 0LL;
  }
  -[NSFileHandle synchronizeFile](self, "synchronizeFile");
  return 1;
}

- (void)closeFile
{
  unsigned __int16 v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)closeAndReturnError:(NSError *)error
{
  uint64_t v6 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_closeFile);
  if (v6 == +[NSFileHandle instanceMethodForSelector:]( &OBJC_CLASS___NSFileHandle,  "instanceMethodForSelector:",  sel_closeFile))
  {
    uint64_t v8 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v8);
  }

  if (error) {
    *error = 0LL;
  }
  -[NSFileHandle closeFile](self, "closeFile");
  return 1;
}

- (int)fileDescriptor
{
  unsigned __int16 v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)writeabilityHandler
{
  unsigned __int16 v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setWriteabilityHandler:(void *)writeabilityHandler
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)readabilityHandler
{
  unsigned __int16 v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setReadabilityHandler:(void *)readabilityHandler
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end