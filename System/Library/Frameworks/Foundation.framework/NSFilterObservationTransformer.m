@interface NSFilterObservationTransformer
+ (id)filterWithBlock:(id)a3;
- (NSFilterObservationTransformer)initWithBlock:(id)a3;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
@end

@implementation NSFilterObservationTransformer

+ (id)filterWithBlock:(id)a3
{
  return (id)[objc_alloc((Class)a1) initWithBlock:a3];
}

- (void)_receiveBox:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (*((_DWORD *)a3 + 6) != 1 || (*((unsigned int (**)(void))self->_predicate + 2))())
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___NSFilterObservationTransformer;
    -[NSFilterObservationTransformer _receiveBox:](&v5, sel__receiveBox_, a3);
  }

- (NSFilterObservationTransformer)initWithBlock:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFilterObservationTransformer;
  v4 = -[NSFilterObservationTransformer init](&v6, sel_init);
  if (v4) {
    v4->_predicate = (id)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFilterObservationTransformer;
  -[NSObservationSource dealloc](&v3, sel_dealloc);
}

@end