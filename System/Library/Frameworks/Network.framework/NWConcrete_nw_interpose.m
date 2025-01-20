@interface NWConcrete_nw_interpose
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_interpose

- (void)dealloc
{
  v3 = (void *)*((void *)self + 7);
  *((void *)self + 7) = 0LL;

  v4 = (void *)*((void *)self + 5);
  if (v4)
  {
    nw_path_evaluator_cancel(v4);
    v5 = (void *)*((void *)self + 5);
    *((void *)self + 5) = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_interpose;
  -[NWConcrete_nw_interpose dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end