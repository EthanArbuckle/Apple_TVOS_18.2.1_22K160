@interface RSDNetworkInterface
- (RSDNetworkInterface)initWithName:(const char *)a3 error:(id *)a4;
- (char)name;
- (in6_addr)local_address;
- (unsigned)index;
- (void)dealloc;
- (void)setIndex:(unsigned int)a3;
@end

@implementation RSDNetworkInterface

- (RSDNetworkInterface)initWithName:(const char *)a3 error:(id *)a4
{
  *(void *)v24.__u6_addr8 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v24.__u6_addr32[2] = 0xAAAAAAAAAAAAAAAALL;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___RSDNetworkInterface;
  v6 = -[RSDNetworkInterface init](&v23, "init");
  if (!v6)
  {
    v12 = 0LL;
    v16 = 0LL;
LABEL_10:
    v19 = 0LL;
    goto LABEL_18;
  }

  unsigned int v7 = if_nametoindex(a3);
  v6->_index = v7;
  if (v7)
  {
    int v8 = sub_100017DA8(a3, &v24, 0);
    if (!v8)
    {
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          v20 = strdup(a3);
          if (v20) {
            break;
          }
          __os_temporary_resource_shortage();
        }
      }

      else
      {
        v20 = strdup(a3);
        if (!v20) {
          sub_10002B71C(a3, &v25, v30);
        }
      }

      v6->_name = v20;
      v21 = (in6_addr *)calloc(1uLL, 0x10uLL);
      if (!v21) {
        sub_10002B644(&v25, v30);
      }
      v12 = 0LL;
      v6->_local_address = v21;
      in6_addr *v21 = v24;
      goto LABEL_17;
    }

    int v9 = v8;
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"network_copy_interface_address_in6: %s",  strerror(v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v27 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));

    v13 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorDomain v14 = NSPOSIXErrorDomain;
    uint64_t v15 = v9;
  }

  else
  {
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to find interface index for name %s",  a3));
    v29 = v17;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));

    v13 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorDomain v14 = NSPOSIXErrorDomain;
    uint64_t v15 = 22LL;
  }

  v18 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", v14, v15, v12);
  v16 = v18;
  if (!v18)
  {
LABEL_17:
    v19 = v6;
    v16 = 0LL;
    goto LABEL_18;
  }

  if (!a4) {
    goto LABEL_10;
  }
  v16 = v18;
  v19 = 0LL;
  *a4 = v16;
LABEL_18:

  return v19;
}

- (void)dealloc
{
  self->_name = 0LL;
  free(self->_local_address);
  self->_local_address = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RSDNetworkInterface;
  -[RSDNetworkInterface dealloc](&v3, "dealloc");
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (char)name
{
  return self->_name;
}

- (in6_addr)local_address
{
  return self->_local_address;
}

@end