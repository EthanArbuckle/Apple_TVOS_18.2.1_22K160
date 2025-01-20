@interface NWConcrete_nw_interface_use_observer
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_interface_use_observer

- (void)dealloc
{
  v3 = (void *)*((void *)self + 1);
  if (v3)
  {
    free(v3);
    *((void *)self + 1) = 0LL;
  }

  v4 = (void *)*((void *)self + 2);
  if ((*((_BYTE *)self + 24) & 1) != 0 && v4)
  {
    *((void *)self + 2) = 0LL;

    v4 = (void *)*((void *)self + 2);
  }

  *((void *)self + 2) = 0LL;

  v5 = (void *)*((void *)self + 2);
  *((void *)self + 2) = 0LL;

  *((_BYTE *)self + 24) |= 1u;
  v6 = (void *)*((void *)self + 4);
  if ((*((_BYTE *)self + 40) & 1) != 0 && v6)
  {
    *((void *)self + 4) = 0LL;

    v6 = (void *)*((void *)self + 4);
  }

  *((void *)self + 4) = 0LL;

  v7 = (void *)*((void *)self + 4);
  *((void *)self + 4) = 0LL;

  *((_BYTE *)self + 40) |= 1u;
  *((_DWORD *)self + 12) = -1;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_interface_use_observer;
  -[NWConcrete_nw_interface_use_observer dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  v3 = (void *)*((void *)self + 4);
  if ((*((_BYTE *)self + 40) & 1) != 0 && v3)
  {
    *((void *)self + 4) = 0LL;

    v3 = (void *)*((void *)self + 4);
  }

  *((void *)self + 4) = 0LL;

  v4 = (void *)*((void *)self + 2);
  if ((*((_BYTE *)self + 24) & 1) != 0 && v4)
  {
    *((void *)self + 2) = 0LL;

    v4 = (void *)*((void *)self + 2);
  }

  *((void *)self + 2) = 0LL;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 4) = 0LL;
  return self;
}

@end