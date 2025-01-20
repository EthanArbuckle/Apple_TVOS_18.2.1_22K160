@interface NSBlockObservationSink
- (NSBlockObservationSink)initWithBlock:(id)a3 tag:(int)a4;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
@end

@implementation NSBlockObservationSink

- (NSBlockObservationSink)initWithBlock:(id)a3 tag:(int)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSBlockObservationSink;
  v6 = -[NSBlockObservationSink init](&v8, sel_init);
  if (v6)
  {
    v6->_block = (id)[a3 copy];
    v6->_tag = a4;
  }

  return v6;
}

- (void)_receiveBox:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int tag = self->_tag;
  if (*((_DWORD *)a3 + 6) == tag && tag != 3) {
    (*((void (**)(void))self->_block + 2))();
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSBlockObservationSink;
  -[NSBlockObservationSink _receiveBox:](&v7, sel__receiveBox_, a3);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSBlockObservationSink;
  -[NSBlockObservationSink dealloc](&v3, sel_dealloc);
}

@end