@interface _NSFileWatcherFileHandleInfo
+ (id)openFileWithPath:(id)a3;
- (BOOL)isDirectory;
- (BOOL)verifyAccessByAuditToken:(id *)a3;
- (id)description;
- (void)close;
- (void)dealloc;
@end

@implementation _NSFileWatcherFileHandleInfo

- (BOOL)isDirectory
{
  return 0;
}

- (BOOL)verifyAccessByAuditToken:(id *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  return fcntl(self->fileHandle, 50, v4) != -1 && sandbox_check_by_audit_token() == 0;
}

- (void)close
{
  if (self->closed)
  {
    v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempting to close a file descriptor that was already closed: %@",  self);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v3 userInfo:0]);
    -[_NSFileWatcherFileHandleInfo dealloc](v4, v5);
  }

  else
  {
    close(self->fileHandle);
    self->closed = 1;
  }

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (self->fileHandle && !self->closed)
  {
    v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ was deallocated without being closed",  self);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v2 userInfo:0]);
    +[_NSFileWatcherFileHandleInfo openFileWithPath:](v3, v4, v5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS____NSFileWatcherFileHandleInfo;
    -[_NSFileWatcherFileHandleInfo dealloc](&v6, sel_dealloc);
  }

+ (id)openFileWithPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  int v3 = open((const char *)[a3 fileSystemRepresentation], 2129920);
  if (_MergedGlobals_152 != -1) {
    dispatch_once(&_MergedGlobals_152, &__block_literal_global_83);
  }
  if (v3 == -1) {
    return 0LL;
  }
  if (!fstat(v3, &v11) && (v11.st_mode & 0xF000) == 0x4000)
  {
    SEL v4 = objc_alloc_init(&OBJC_CLASS____NSFileWatcherDirectoryFileHandleInfo);
    if (v4)
    {
      id v5 = v4;
      *(_DWORD *)(&v4->super.closed + 1) = v11.st_dev;
      *(void *)((char *)&v4->inodeDevPair.dev + 1) = v11.st_ino;
      uint64_t v6 = [(id)qword_18C497280 member:v4];
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        close(v3);
        v8 = v7;
      }

      else
      {
        v5->super.fileHandle = v3;
        v8 = v5;
      }

      [(id)qword_18C497280 addObject:v8];
      return v8;
    }

    return 0LL;
  }

  v9 = objc_alloc_init(&OBJC_CLASS____NSFileWatcherFileHandleInfo);
  v8 = v9;
  if (v9) {
    v9->fileHandle = v3;
  }
  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p> File: %d",  objc_opt_class(),  self,  self->fileHandle);
}

@end