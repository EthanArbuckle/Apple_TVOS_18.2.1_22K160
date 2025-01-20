@interface NSCachedFetchRequestThunk
- (id)initForConnection:(id)a3;
- (void)dealloc;
@end

@implementation NSCachedFetchRequestThunk

- (id)initForConnection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSCachedFetchRequestThunk;
  v4 = -[NSCachedFetchRequestThunk init](&v6, sel_init);
  if (v4) {
    v4->_connection = -[_PFWeakReference initWithObject:]( objc_alloc(&OBJC_CLASS____PFWeakReference),  "initWithObject:",  a3);
  }
  return v4;
}

- (void)dealloc
{
  if (self)
  {
    limitedStatement = self->_limitedStatement;
    unlimitedStatement = self->_unlimitedStatement;
    self->_limitedStatement = 0LL;
    self->_unlimitedStatement = 0LL;
    connection = (id *)self->_connection;
    if (connection)
    {
      id WeakRetained = objc_loadWeakRetained(connection + 1);
      v7 = WeakRetained;
      if (WeakRetained && (unint64_t)limitedStatement | (unint64_t)unlimitedStatement)
      {
        v9[0] = MEMORY[0x1895F87A8];
        v9[1] = 3221225472LL;
        v9[2] = __40__NSCachedFetchRequestThunk_clearCaches__block_invoke;
        v9[3] = &unk_189EA7A38;
        v9[4] = limitedStatement;
        v9[5] = unlimitedStatement;
        v9[6] = WeakRetained;
        -[NSSQLiteConnection _performBlock:]((uint64_t)WeakRetained, (uint64_t)v9);
        goto LABEL_8;
      }
    }

    else
    {
      v7 = 0LL;
    }
  }

void __40__NSCachedFetchRequestThunk_clearCaches__block_invoke(void **a1)
{
}

@end