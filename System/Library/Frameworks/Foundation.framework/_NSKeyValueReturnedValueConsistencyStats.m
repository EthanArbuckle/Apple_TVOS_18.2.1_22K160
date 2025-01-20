@interface _NSKeyValueReturnedValueConsistencyStats
- (id)currentValue;
- (void)dealloc;
- (void)setCurrentValue:(id)a3;
@end

@implementation _NSKeyValueReturnedValueConsistencyStats

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  objc_storeWeak(&self->_weakCurrentValue, 0LL);

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSKeyValueReturnedValueConsistencyStats;
  -[_NSKeyValueReturnedValueConsistencyStats dealloc](&v3, sel_dealloc);
}

- (id)currentValue
{
  if (self->_copiedCurrentValue) {
    return self->_copiedCurrentValue;
  }
  else {
    return objc_loadWeak(&self->_weakCurrentValue);
  }
}

- (void)setCurrentValue:(id)a3
{
  id v3 = a3;
  id copiedCurrentValue = self->_copiedCurrentValue;
  if (copiedCurrentValue)
  {
    if (copiedCurrentValue == a3) {
      return;
    }
  }

  else
  {
    id v6 = objc_loadWeak(&self->_weakCurrentValue);
    if (v6)
    {
      id v7 = v6;

      if (v7 == v3) {
        return;
      }
    }
  }

  if ([v3 conformsToProtocol:&unk_18C6509F8])
  {
    v8 = (void *)[v3 copy];
    id v3 = 0LL;
  }

  else
  {
    v8 = 0LL;
  }

  self->_id copiedCurrentValue = v8;
  objc_storeWeak(&self->_weakCurrentValue, v3);
}

@end