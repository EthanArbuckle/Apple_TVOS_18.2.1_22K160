@interface NSOldValueObservationTransformer
+ (id)oldValuesTransformer;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
@end

@implementation NSOldValueObservationTransformer

+ (id)oldValuesTransformer
{
  return objc_alloc_init((Class)a1);
}

- (void)_receiveBox:(id)a3
{
  if (*((_DWORD *)a3 + 6) == 1)
  {
    id v5 = (id)[a3 value];
    id lastValue = self->_lastValue;
    if (lastValue)
    {
      id v7 = lastValue;
      self->_id lastValue = v7;
      uint64_t v8 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  a3,  @"new",  v7,  @"old",  0);
    }

    else
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjectsAndKeys:", a3, @"new", 0, v9, v10);
    }

    [a3 setValue:v8];
    self->_id lastValue = v5;
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSOldValueObservationTransformer;
  -[NSObservationSource dealloc](&v3, sel_dealloc);
}

@end