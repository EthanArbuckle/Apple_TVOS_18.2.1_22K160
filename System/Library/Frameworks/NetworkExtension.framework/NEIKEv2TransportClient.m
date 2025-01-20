@interface NEIKEv2TransportClient
- (id)description;
@end

@implementation NEIKEv2TransportClient

- (id)description
{
  id v4 = objc_alloc(NSString);
  if (self)
  {
    id v5 = objc_getProperty(self, v3, 8LL, 1);
    id v7 = objc_getProperty(self, v6, 16LL, 1);
    self = (NEIKEv2TransportClient *)objc_loadWeakRetained((id *)&self->_delegate);
  }

  else
  {
    id v7 = 0LL;
    id v5 = 0LL;
  }

  v8 = (void *)[v4 initWithFormat:@"[NEIKEv2TransportClient %@-%@ %@]", v5, v7, self];

  return v8;
}

- (void).cxx_destruct
{
}

@end