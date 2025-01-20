@interface NSReduceObservationTransformer
+ (id)reduceValue:(id)a3 withReducer:(id)a4;
- (NSReduceObservationTransformer)initWithBlock:(id)a3 initialValue:(id)a4;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
- (void)finishObserving;
@end

@implementation NSReduceObservationTransformer

+ (id)reduceValue:(id)a3 withReducer:(id)a4
{
  return (id)[objc_alloc((Class)a1) initWithBlock:a4 initialValue:a3];
}

- (void)finishObserving
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id accumulator = self->_accumulator;
  uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(&v9);
  MEMORY[0x1895F8858](StackObservedValueClassAndBoxSize);
  v7 = objc_constructInstance(v6, (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v7[6] = 1;
  *((void *)v7 + 1) = accumulator;
  *((void *)v7 + 2) = self;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSReduceObservationTransformer;
  -[NSReduceObservationTransformer _receiveBox:](&v10, sel__receiveBox_, v7);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSReduceObservationTransformer;
  -[NSReduceObservationTransformer finishObserving](&v8, sel_finishObserving);
}

- (void)_receiveBox:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v3 = *((_DWORD *)a3 + 6);
  if (v3 == 1)
  {
    id accumulator = self->_accumulator;
    self->_id accumulator = (id)(*((uint64_t (**)(void))self->_reducer + 2))();
  }

  else if (v3 == 3)
  {
    -[NSReduceObservationTransformer finishObserving](self, "finishObserving");
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___NSReduceObservationTransformer;
    -[NSReduceObservationTransformer _receiveBox:](&v5, sel__receiveBox_);
  }

- (NSReduceObservationTransformer)initWithBlock:(id)a3 initialValue:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSReduceObservationTransformer;
  uint64_t v6 = -[NSReduceObservationTransformer init](&v8, sel_init);
  if (v6)
  {
    v6->_reducer = (id)[a3 copy];
    v6->_id accumulator = a4;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSReduceObservationTransformer;
  -[NSObservationSource dealloc](&v3, sel_dealloc);
}

@end