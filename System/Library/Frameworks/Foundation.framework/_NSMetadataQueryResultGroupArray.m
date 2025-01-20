@interface _NSMetadataQueryResultGroupArray
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation _NSMetadataQueryResultGroupArray

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  [self->_group _zapResultArray];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSMetadataQueryResultGroupArray;
  -[_NSMetadataQueryResultGroupArray dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return [self->_group resultCount];
}

- (id)objectAtIndex:(unint64_t)a3
{
  if ([self->_group resultCount] > a3) {
    return (id)[self->_group resultAtIndex:a3];
  }
  v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: index (%ld) out of bounds (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), a3, objc_msgSend(self->_group, "resultCount")), 0 reason userInfo];
  objc_exception_throw(v7);
  return (id)-[NSIndexSet _indexAtIndex:](v8, v9, v10);
}

@end