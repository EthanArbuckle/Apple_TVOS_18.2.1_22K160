@interface RBSStateCaptureSetSegment
- (BOOL)containsItem:(id)a3;
- (NSSet)items;
- (RBSStateCaptureSetSegment)init;
- (id)_stateCapture;
- (unint64_t)count;
- (void)addItem:(id)a3 withLength:(unint64_t)a4;
- (void)dealloc;
- (void)removeItem:(id)a3;
@end

@implementation RBSStateCaptureSetSegment

- (NSSet)items
{
  return (NSSet *)self->_items;
}

- (RBSStateCaptureSetSegment)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RBSStateCaptureSetSegment;
  v2 = -[RBSStateCaptureSetSegment init](&v15, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189603FE0] set];
    items = v2->_items;
    v2->_items = (NSMutableSet *)v3;

    objc_initWeak(&location, v2);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __33__RBSStateCaptureSetSegment_init__block_invoke;
    v12[3] = &unk_18A256CD0;
    objc_copyWeak(&v13, &location);
    v5 = (void *)MEMORY[0x1895CA0E4](v12);
    uint64_t v6 = segmentUniqueID++;
    objc_msgSend(NSString, "stringWithFormat:", @"RBSStateCaptureSet Segment %d", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17LL, 0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = _RBLogAddStateCaptureBlockWithTitle(v8, v7, v5);
    invalidatable = v2->_invalidatable;
    v2->_invalidatable = (RBSInvalidatable *)v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v2;
}

__CFString *__33__RBSStateCaptureSetSegment_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _stateCapture];
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v3 = &stru_18A257E48;
  }

  return v3;
}

- (id)_stateCapture
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock(&_stateCaptureLock);
  uint64_t v3 = (void *)-[NSMutableSet copy](self->_items, "copy");
  os_unfair_lock_unlock(&_stateCaptureLock);
  [MEMORY[0x189607940] string];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "captureState", (void)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 appendString:v10];

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)addItem:(id)a3 withLength:(unint64_t)a4
{
}

- (void)removeItem:(id)a3
{
}

- (unint64_t)count
{
  return -[NSMutableSet count](self->_items, "count");
}

- (BOOL)containsItem:(id)a3
{
  return -[NSMutableSet containsObject:](self->_items, "containsObject:", a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSStateCaptureSetSegment;
  -[RBSStateCaptureSetSegment dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end