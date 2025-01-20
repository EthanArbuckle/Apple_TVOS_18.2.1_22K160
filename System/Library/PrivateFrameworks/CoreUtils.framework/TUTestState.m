@interface TUTestState
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (int)signalCount;
- (int)waitWithTimeout:(double)a3;
- (void)incrementIntegerForKey:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)signal;
@end

@implementation TUTestState

- (id)description
{
  return NSPrintF();
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSMutableDictionary objectForKeyedSubscript:](v5->_objects, "objectForKeyedSubscript:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objects = v7->_objects;
  if (v11)
  {
    if (!objects)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      v10 = v7->_objects;
      v7->_objects = v9;

      objects = v7->_objects;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](objects, "setObject:forKeyedSubscript:", v11, v6);
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:](objects, "removeObjectForKey:", v6);
  }

  objc_sync_exit(v7);
}

- (void)incrementIntegerForKey:(id)a3
{
  id v4 = (void *)MEMORY[0x189607968];
  id v5 = a3;
  -[TUTestState objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v7, "integerValue") + 1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUTestState setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, v5);
}

- (void)signal
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __21__TUTestState_signal__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(MEMORY[0x1895F8AE0], block);
}

- (int)waitWithTimeout:(double)a3
{
  int signalCount = self->_signalCount;
  if (signalCount > 0) {
    goto LABEL_4;
  }
  if (CFRunLoopRunEx(a3) == 2)
  {
    int signalCount = self->_signalCount;
LABEL_4:
    int result = 0;
    self->_int signalCount = signalCount - 1;
    return result;
  }

  return -6722;
}

- (int)signalCount
{
  return self->_signalCount;
}

- (void).cxx_destruct
{
}

void __21__TUTestState_signal__block_invoke(uint64_t a1)
{
  Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

@end