@interface Invalidation
- (Invalidation)initWithBlock:(id)a3;
- (void)invoke;
@end

@implementation Invalidation

- (Invalidation)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___Invalidation;
  v5 = -[Invalidation init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = MEMORY[0x18959CD0C](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }

  return v5;
}

- (void)invoke
{
}

- (void).cxx_destruct
{
}

@end