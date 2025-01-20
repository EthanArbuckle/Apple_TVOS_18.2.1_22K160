@interface NWConcrete_nw_masque_connection_pair
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_masque_connection_pair

- (void)dealloc
{
  v3 = (nw_connection *)*((void *)self + 3);
  if (v3)
  {
    nw_connection_cancel(v3);
    v4 = (void *)*((void *)self + 3);
    *((void *)self + 3) = 0LL;
  }

  v5 = (nw_connection *)*((void *)self + 4);
  if (v5)
  {
    nw_connection_cancel(v5);
    v6 = (void *)*((void *)self + 4);
    *((void *)self + 4) = 0LL;
  }

  v7 = (unsigned __int8 *)*((void *)self + 5);
  if (v7)
  {
    nw_array_apply(v7, (uint64_t)&__block_literal_global_29227);
    v8 = (void *)*((void *)self + 5);
    *((void *)self + 5) = 0LL;
  }

  v9 = (nw_connection *)*((void *)self + 6);
  if (v9)
  {
    nw_connection_cancel(v9);
    v10 = (void *)*((void *)self + 6);
    *((void *)self + 6) = 0LL;
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_masque_connection_pair;
  -[NWConcrete_nw_masque_connection_pair dealloc](&v11, sel_dealloc);
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