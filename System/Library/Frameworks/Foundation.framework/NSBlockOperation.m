@interface NSBlockOperation
+ (NSBlockOperation)blockOperationWithBlock:(void *)block;
- (NSArray)executionBlocks;
- (NSBlockOperation)init;
- (NSBlockOperation)initWithBlock:(id)a3;
- (void)addExecutionBlock:(void *)block;
- (void)dealloc;
- (void)main;
@end

@implementation NSBlockOperation

- (NSBlockOperation)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSBlockOperation;
  return -[NSOperation init](&v3, sel_init);
}

- (NSBlockOperation)initWithBlock:(id)a3
{
  v5 = -[NSBlockOperation init](self, "init");
  v6 = v5;
  if (a3)
  {
    v5->_block = _Block_copy(a3);
    return v6;
  }

  else
  {
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: block is nil",  _NSMethodExceptionProem((objc_class *)v5, a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v8 userInfo:0]);
    return +[NSBlockOperation blockOperationWithBlock:](v9, v10, v11);
  }

+ (NSBlockOperation)blockOperationWithBlock:(void *)block
{
  return (NSBlockOperation *)(id)[objc_alloc((Class)a1) initWithBlock:block];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  id block = self->_block;
  if (block) {
    _Block_release(block);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSBlockOperation;
  -[NSOperation dealloc](&v4, sel_dealloc);
}

- (void)addExecutionBlock:(void *)block
{
  if (block)
  {
    if (!-[NSOperation isExecuting](self, "isExecuting") && !-[NSOperation isFinished](self, "isFinished"))
    {
      os_unfair_lock_lock(&self->super._iop.__lock);
      executionBlocks = self->_executionBlocks;
      if (self->_block)
      {
        if (!executionBlocks)
        {
          v7 = (NSMutableArray *)objc_opt_new();
          self->_executionBlocks = v7;
          -[NSMutableArray addObject:](v7, "addObject:", self->_block);
          _Block_release(self->_block);
          self->_id block = 0LL;
        }
      }

      else if (!executionBlocks)
      {
        self->_id block = _Block_copy(block);
        goto LABEL_9;
      }

      v8 = _Block_copy(block);
      -[NSMutableArray addObject:](self->_executionBlocks, "addObject:", v8);
      _Block_release(v8);
LABEL_9:
      os_unfair_lock_unlock(&self->super._iop.__lock);
      return;
    }

    id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: blocks cannot be added after the operation has started executing or finished",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  else
  {
    id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: block is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v9 userInfo:0]);
  -[NSBlockOperation main](v10, v11);
}

- (void)main
{
  v8[7] = *MEMORY[0x1895F89C0];
  p_lock = &self->super._iop.__lock;
  os_unfair_lock_lock(&self->super._iop.__lock);
  id block = self->_block;
  if (block)
  {
    uint64_t v5 = _Block_copy(block);
    os_unfair_lock_unlock(p_lock);
    if (v5)
    {
      __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)v5);
      _Block_release(v5);
      return;
    }

    unint64_t v6 = 0LL;
  }

  else
  {
    unint64_t v6 = -[NSMutableArray count](self->_executionBlocks, "count");
    uint64_t v5 = NSAllocateObjectArray(v6);
    -[NSMutableArray getObjects:range:](self->_executionBlocks, "getObjects:range:", v5, 0LL, v6);
    os_unfair_lock_unlock(p_lock);
  }

  v7 = +[NSOperationQueue currentQueue](&OBJC_CLASS___NSOperationQueue, "currentQueue");
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __24__NSBlockOperation_main__block_invoke;
  v8[3] = &unk_189C9F490;
  v8[4] = v7;
  v8[5] = self;
  v8[6] = v5;
  dispatch_apply(v6, 0LL, v8);
  free(v5);
}

uint64_t __24__NSBlockOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return _CFSetTSD();
}

- (NSArray)executionBlocks
{
  objc_super v3 = (NSArray *)(id)objc_opt_new();
  os_unfair_lock_lock(&self->super._iop.__lock);
  if (self->_block)
  {
    -[NSArray addObject:](v3, "addObject:");
  }

  else if (self->_executionBlocks)
  {
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:");
  }

  os_unfair_lock_unlock(&self->super._iop.__lock);
  return v3;
}

@end