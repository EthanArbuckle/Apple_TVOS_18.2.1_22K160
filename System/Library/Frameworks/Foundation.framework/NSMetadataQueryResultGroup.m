@interface NSMetadataQueryResultGroup
- (NSArray)results;
- (NSArray)subgroups;
- (NSString)attribute;
- (NSUInteger)resultCount;
- (id)_init:(id)a3 attributes:(id)a4 index:(unint64_t)a5 value:(id)a6;
- (id)resultAtIndex:(NSUInteger)idx;
- (id)value;
- (void)_addResult:(unint64_t)a3;
- (void)_zapResultArray;
- (void)dealloc;
@end

@implementation NSMetadataQueryResultGroup

- (id)_init:(id)a3 attributes:(id)a4 index:(unint64_t)a5 value:(id)a6
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSMetadataQueryResultGroup;
  v10 = -[NSMetadataQueryResultGroup init](&v12, sel_init);
  v10->_private[0] = a3;
  v10->_private[1] = a4;
  v10->_private2[0] = a5;
  v10->_private[2] = a6;
  v10->_private[3] = 0LL;
  v10->_private[4] = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  v10->_private[5] = 0LL;
  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  self->_private[5] = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMetadataQueryResultGroup;
  -[NSMetadataQueryResultGroup dealloc](&v3, sel_dealloc);
}

- (void)_addResult:(unint64_t)a3
{
  unint64_t v5 = self->_private2[0] + 1;
  if (v5 < [self->_private[1] count])
  {
    uint64_t v6 = objc_msgSend( self->_private[0],  "valueOfAttribute:forResultAtIndex:",  objc_msgSend(self->_private[1], "objectAtIndex:", self->_private2[0] + 1),  a3);
    if (!v6) {
      uint64_t v6 = [MEMORY[0x189603FE8] null];
    }
    id v7 = (id)[self->_private[3] objectForKey:v6];
    if (!v7)
    {
      id v7 = -[NSMetadataQueryResultGroup _init:attributes:index:value:]( objc_alloc(&OBJC_CLASS___NSMetadataQueryResultGroup),  "_init:attributes:index:value:",  self->_private[0],  self->_private[1],  self->_private2[0] + 1,  v6);
      id v8 = self->_private[3];
      if (!v8)
      {
        id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
        self->_private[3] = v8;
      }

      [v8 setObject:v7 forKey:v6];
    }

    [v7 _addResult:a3];
  }

- (NSString)attribute
{
  return (NSString *)[self->_private[1] objectAtIndex:self->_private2[0]];
}

- (id)value
{
  return self->_private[2];
}

- (NSArray)subgroups
{
  return (NSArray *)[self->_private[3] allValues];
}

- (NSUInteger)resultCount
{
  return [self->_private[4] count];
}

- (id)resultAtIndex:(NSUInteger)idx
{
  if ([self->_private[4] count] > idx) {
    return (id)objc_msgSend(self->_private[0], "resultAtIndex:", objc_msgSend(self->_private[4], "_indexAtIndex:", idx));
  }
  id v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: index (%ld) out of bounds (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), idx, -[NSMetadataQueryResultGroup resultCount](self, "resultCount")), 0 reason userInfo];
  objc_exception_throw(v7);
  -[NSMetadataQueryResultGroup _zapResultArray](v8, v9);
  return result;
}

- (void)_zapResultArray
{
  self->_private[5] = 0LL;
  [self->_private[0] enableUpdates];
}

- (NSArray)results
{
  id result = (NSArray *)self->_private[5];
  if (!result)
  {
    [self->_private[0] disableUpdates];
    uint64_t v4 = objc_alloc(&OBJC_CLASS____NSMetadataQueryResultGroupArray);
    if (v4) {
      v4->_group = self;
    }
    id result = v4;
    self->_private[5] = result;
  }

  return result;
}

@end