@interface NSAllDescendantPathsEnumerator
+ (id)newWithPath:(id)a3 prepend:(id)a4 attributes:(id)a5 cross:(BOOL)a6 depth:(unint64_t)a7;
- (BOOL)isEnumeratingDirectoryPostOrder;
- (id)_under;
- (id)currentSubdirectoryAttributes;
- (id)directoryAttributes;
- (id)fileAttributes;
- (id)nextObject;
- (unint64_t)level;
- (void)dealloc;
- (void)skipDescendants;
@end

@implementation NSAllDescendantPathsEnumerator

+ (id)newWithPath:(id)a3 prepend:(id)a4 attributes:(id)a5 cross:(BOOL)a6 depth:(unint64_t)a7
{
  uint64_t v12 = [objc_allocWithZone((Class)a1) init];
  *(void *)(v12 + 16) =  -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  a3,  0LL);
  *(void *)(v12 + 32) = [a4 copyWithZone:0];
  *(void *)(v12 + 8) = (id)[a3 stringByAppendingString:@"/"];
  *(void *)(v12 + 48) = a5;
  *(_BYTE *)(v12 + 72) = a6;
  *(void *)(v12 + 64) = a7;
  return (id)v12;
}

- (id)nextObject
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  under = self->under;
  if (under)
  {
    id v4 = -[NSAllDescendantPathsEnumerator nextObject](under, "nextObject");
    if (v4) {
      return v4;
    }

    self->pathToLastReportedItem = self->under->pathToLastReportedItem;
    self->under = 0LL;
  }

  unint64_t v5 = -[NSArray count](self->contents, "count");
  if (self->idx >= v5) {
    return 0LL;
  }
  unint64_t v6 = v5;
  while (1)
  {
    id v4 = -[NSArray objectAtIndex:](self->contents, "objectAtIndex:");
    ++self->idx;
    v7 = -[NSString stringByAppendingString:](self->path, "stringByAppendingString:", v4);
    if (!lstat(-[NSString fileSystemRepresentation](v7, "fileSystemRepresentation"), &v12)) {
      break;
    }
    if (self->idx >= v6) {
      return 0LL;
    }
  }

  self->pathToLastReportedItem = v7;
  if ((v12.st_mode & 0xF000) == 0x4000)
  {
    prepend = self->prepend;
    uint64_t v10 = (uint64_t)v4;
    if (prepend) {
      uint64_t v10 = -[NSString stringByAppendingPathComponent:](prepend, "stringByAppendingPathComponent:", v4, v4);
    }
    self->under = (NSAllDescendantPathsEnumerator *)+[NSAllDescendantPathsEnumerator newWithPath:prepend:attributes:cross:depth:]( &OBJC_CLASS___NSAllDescendantPathsEnumerator,  "newWithPath:prepend:attributes:cross:depth:",  v7,  v10,  0LL,  self->cross,  self->depth + 1);
  }

  v11 = self->prepend;
  if (v11) {
    return -[NSString stringByAppendingPathComponent:](v11, "stringByAppendingPathComponent:", v4);
  }
  return v4;
}

- (id)fileAttributes
{
  do
  {
    v2 = self;
    self = self->under;
  }

  while (self && self->idx);
  return -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  v2->pathToLastReportedItem,  0LL);
}

- (id)directoryAttributes
{
  return -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  self->path,  0LL);
}

- (id)currentSubdirectoryAttributes
{
  do
  {
    v2 = self;
    self = self->under;
  }

  while (self && self->idx);
  return -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  -[NSString stringByDeletingLastPathComponent]( v2->pathToLastReportedItem,  "stringByDeletingLastPathComponent"),  0LL);
}

- (unint64_t)level
{
  do
  {
    v2 = self;
    self = self->under;
  }

  while (self && self->idx);
  return v2->depth;
}

- (id)_under
{
  return self->under;
}

- (void)skipDescendants
{
  under = self->under;
  if (under && (uint64_t v4 = -[NSAllDescendantPathsEnumerator _under](under, "_under"), under = self->under, !v4))
  {

    self->under = 0LL;
  }

  else
  {
    -[NSAllDescendantPathsEnumerator skipDescendents](under, "skipDescendents");
  }

- (BOOL)isEnumeratingDirectoryPostOrder
{
  return 0;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAllDescendantPathsEnumerator;
  -[NSAllDescendantPathsEnumerator dealloc](&v3, sel_dealloc);
}

@end