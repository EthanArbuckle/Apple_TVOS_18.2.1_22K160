@interface _NSMetadataQueryResultArray
- (_NSMetadataQueryResultArray)retain;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)release;
@end

@implementation _NSMetadataQueryResultArray

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSMetadataQueryResultArray;
  -[_NSMetadataQueryResultArray dealloc](&v3, sel_dealloc);
}

- (unint64_t)retainCount
{
  return self->_rc + 1LL;
}

- (_NSMetadataQueryResultArray)retain
{
  p_rc = &self->_rc;
  do
    unsigned int v3 = __ldxr((unsigned int *)p_rc);
  while (__stxr(v3 + 1, (unsigned int *)p_rc));
  return self;
}

- (void)release
{
  id query = self->_query;
  objc_sync_enter(query);
  p_rc = &self->_rc;
  do
    int v5 = __ldxr((unsigned int *)p_rc);
  while (__stxr(v5 - 1, (unsigned int *)p_rc));
  if (v5 <= 0)
  {
    [self->_query _zapResultArrayIfIdenticalTo:self];
    objc_sync_exit(query);
    -[_NSMetadataQueryResultArray dealloc](self, "dealloc");
  }

  else
  {
    objc_sync_exit(query);
  }

- (unint64_t)count
{
  return [self->_query resultCount];
}

- (id)objectAtIndex:(unint64_t)a3
{
  if ([self->_query resultCount] > a3) {
    return (id)[self->_query resultAtIndex:a3];
  }
  v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: index (%ld) out of bounds (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), a3, objc_msgSend(self->_query, "resultCount")), 0 reason userInfo];
  objc_exception_throw(v7);
  return -[_NSMetadataQuerySortingPseudoItem valueForKey:](v8, v9, v10);
}

@end