@interface _NSFileWatcherDirectoryFileHandleInfo
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)close;
@end

@implementation _NSFileWatcherDirectoryFileHandleInfo

- (BOOL)isDirectory
{
  return 1;
}

- (void)close
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3 = self;
  [(id)qword_18C497280 removeObject:self];
  if (![(id)qword_18C497280 countForObject:self])
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS____NSFileWatcherDirectoryFileHandleInfo;
    -[_NSFileWatcherFileHandleInfo close](&v5, sel_close);
  }

  v4 = self;
}

- (unint64_t)hash
{
  return CFHashBytes();
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class();
  return v5 == objc_opt_class()
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p> Directory: %d - inode: %llu dev: %d",  objc_opt_class(),  self,  self->super.fileHandle,  *(void *)((char *)&self->inodeDevPair.dev + 1),  *(unsigned int *)(&self->super.closed + 1));
}

@end