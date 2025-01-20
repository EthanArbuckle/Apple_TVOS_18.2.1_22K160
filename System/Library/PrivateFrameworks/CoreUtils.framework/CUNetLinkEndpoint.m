@interface CUNetLinkEndpoint
- ($4FF8D77539A8BD95DCE0A545902499A9)ipAddr;
- (BOOL)isClient;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)stateChangedHandler;
- (int)state;
- (void)setIpAddr:(id *)a3;
- (void)setStateChangedHandler:(id)a3;
@end

@implementation CUNetLinkEndpoint

- (id)description
{
  return -[CUNetLinkEndpoint descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v24 = 0LL;
  NSAppendPrintF(&v24);
  v5 = v24;
  CFMutableStringRef v23 = v5;
  NSAppendPrintF(&v23);
  v6 = v23;

  CFMutableStringRef v22 = v6;
  NSAppendPrintF(&v22);
  v7 = v22;

  if (self->_expiredTicks)
  {
    v21 = v7;
    uint64_t v8 = mach_absolute_time();
    UpTicksToSeconds(v8 - self->_expiredTicks);
    v9 = (id *)&v21;
    v10 = &v21;
  }

  else
  {
    v20 = v7;
    v9 = (id *)&v20;
    v10 = &v20;
  }

  NSAppendPrintF(v10);
  v11 = (__CFString *)*v9;

  gettimeofday(&v19, 0LL);
  CFMutableStringRef v18 = v11;
  NSAppendPrintF(&v18);
  v12 = v18;

  CFMutableStringRef v17 = v12;
  NSAppendPrintF(&v17);
  v13 = v17;

  if (a3 <= 20)
  {
    CFMutableStringRef v16 = v13;
    NSAppendPrintF(&v16);
    v14 = v16;

    v13 = v14;
  }

  return v13;
}

- ($4FF8D77539A8BD95DCE0A545902499A9)ipAddr
{
  retstr->var0 = (sockaddr)self->var2.sin6_addr;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self->var2.sin6_addr + 12);
  return self;
}

- (void)setIpAddr:(id *)a3
{
  sockaddr var0 = a3->var0;
  *(in6_addr *)((char *)&self->_ipAddr.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_ipAddr.sa = var0;
}

- (BOOL)isClient
{
  return self->_client;
}

- (int)state
{
  return self->_state;
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end