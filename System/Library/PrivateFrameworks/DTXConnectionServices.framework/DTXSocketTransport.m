@interface DTXSocketTransport
+ (id)addressForHost:(const char *)a3 port:(int)a4;
+ (id)schemes;
- (DTXSocketTransport)initWithConnectedSocket:(int)a3 disconnectAction:(id)a4;
- (DTXSocketTransport)initWithLocalPort:(int)a3;
- (DTXSocketTransport)initWithRemoteAddress:(id)a3;
- (id)localAddresses;
- (int)port;
- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4;
- (unsigned)supportedDirections;
- (void)_commonSocketTransportInit;
- (void)_setupChannelWithConnectedSocket:(int)a3 assumingOwnership:(BOOL)a4 orDisconnectBlock:(id)a5;
- (void)_setupWithLocalPort:(int)a3;
- (void)_signalSocketAccepted;
- (void)disconnect;
@end

@implementation DTXSocketTransport

+ (id)schemes
{
  return (id)MEMORY[0x189616718](MEMORY[0x189604010], sel_setWithObject_, @"tcp");
}

+ (id)addressForHost:(const char *)a3 port:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = strnstr(a3, ":", 5uLL);
  v8 = (void *)MEMORY[0x189604030];
  v9 = "[";
  v10 = "";
  if (v6) {
    v10 = "]";
  }
  else {
    v9 = "";
  }
  objc_msgSend_stringWithFormat_( NSString,  v7,  (uint64_t)@"%@://%s%s%s:%d",  @"tcp",  v9,  a3,  v10,  v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v8, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_setupWithLocalPort:(int)a3
{
  uint64_t v5 = socket(30, 1, 6);
  if ((v5 & 0x80000000) != 0 || (uint64_t v6 = v5, fcntl(v5, 2, 1LL) == -1)) {
    sub_188BDA340();
  }
  int v12 = 1;
  if (setsockopt(v6, 0xFFFF, 4, &v12, 4u)) {
    sub_188BDA3B8();
  }
  *(_WORD *)v10 = 7708;
  *(_WORD *)&v10[2] = bswap32(a3) >> 16;
  *(_DWORD *)&v10[4] = 0;
  *(_OWORD *)&v10[8] = *MEMORY[0x1895FB7E8];
  int v11 = 0;
  if (bind(v6, (const sockaddr *)v10, 0x1Cu)) {
    sub_188BDA390();
  }
  if (listen(v6, 1)) {
    sub_188BDA368();
  }
  self->_port = sub_188BCEF30(v6);
  atomic_store(v6, (unsigned int *)&self->_socketSemProtector);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_socketAcceptedSem, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_get_global_queue(0LL, 0LL);
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BCEFE8;
  block[3] = &unk_18A2EDEA0;
  int v9 = v6;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)_setupChannelWithConnectedSocket:(int)a3 assumingOwnership:(BOOL)a4 orDisconnectBlock:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  v8 = (void (**)(void))a5;
  self->_port = sub_188BCEF30(v6);
  if (!v8 && v5)
  {
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = sub_188BCF1B0;
    v15[3] = &unk_18A2EDEC0;
    int v16 = v6;
    v8 = (void (**)(void))MEMORY[0x1895D398C](v15);
  }

  if ((v6 & 0x80000000) == 0)
  {
    int v11 = fcntl(v6, 3);
    if ((v11 & 4) == 0)
    {
      fcntl(v6, 4, v11 | 4u);
LABEL_9:
      objc_msgSend__signalSocketAccepted(self, v12, v13);
      v14.receiver = self;
      v14.super_class = (Class)&OBJC_CLASS___DTXSocketTransport;
      -[DTXFileDescriptorTransport setupWithIncomingDescriptor:outgoingDescriptor:disconnectBlock:]( &v14,  sel_setupWithIncomingDescriptor_outgoingDescriptor_disconnectBlock_,  v6,  v6,  v8);
      goto LABEL_12;
    }

    if (v11 != -1) {
      goto LABEL_9;
    }
  }

  NSLog(@"Unable to set non-blocking for FD: %d", v6);
  if (v8) {
    v8[2](v8);
  }
LABEL_12:
}

- (void)_commonSocketTransportInit
{
  v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1LL);
  socketAcceptedSem = self->_socketAcceptedSem;
  self->_socketAcceptedSem = v3;

  atomic_store(0xFFFFFFFF, (unsigned int *)&self->_socketSemProtector);
}

- (void)_signalSocketAccepted
{
  p_socketSemProtector = &self->_socketSemProtector;
  do
    int v4 = __ldaxr((unsigned int *)p_socketSemProtector);
  while (__stlxr(0xFFFFFFFF, (unsigned int *)p_socketSemProtector));
  if (v4 != -1)
  {
    if (self->_socketAcceptedSem)
    {
      close(v4);
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_socketAcceptedSem);
    }
  }

- (DTXSocketTransport)initWithConnectedSocket:(int)a3 disconnectAction:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  int v9 = (void (**)(void))a4;
  if ((v4 & 0x80000000) != 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v7, v8);
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v16,  v17,  (uint64_t)a2,  self,  @"DTXSocketTransport.m",  134,  @"Invalid parameter not satisfying: %@",  @"socketFileDescriptor >= 0");
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___DTXSocketTransport;
  uint64_t v10 = -[DTXFileDescriptorTransport init](&v18, sel_init);
  uint64_t v13 = v10;
  if (v10)
  {
    objc_msgSend__commonSocketTransportInit(v10, v11, v12);
    objc_msgSend__setupChannelWithConnectedSocket_assumingOwnership_orDisconnectBlock_(v13, v14, v4, 0, v9);
  }

  else if (v9)
  {
    v9[2](v9);
  }

  return v13;
}

- (DTXSocketTransport)initWithLocalPort:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DTXSocketTransport;
  uint64_t v4 = -[DTXFileDescriptorTransport init](&v10, sel_init);
  v7 = v4;
  if (v4)
  {
    objc_msgSend__commonSocketTransportInit(v4, v5, v6);
    objc_msgSend__setupWithLocalPort_(v7, v8, v3);
  }

  return v7;
}

- (DTXSocketTransport)initWithRemoteAddress:(id)a3
{
  id v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___DTXSocketTransport;
  uint64_t v6 = -[DTXTransport initWithRemoteAddress:](&v46, sel_initWithRemoteAddress_, v5);
  int v9 = v6;
  if (v6)
  {
    objc_msgSend__commonSocketTransportInit(v6, v7, v8);
    memset(&v45.ai_addrlen, 0, 32);
    v45.ai_family = 0;
    v45.ai_flags = 5120;
    *(void *)&v45.ai_socktype = 0x600000001LL;
    v44 = 0LL;
    objc_msgSend_host(v5, v10, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_port(v5, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_intValue(v15, v16, v17);

    if ((_DWORD)v18)
    {
      objc_msgSend_stringWithFormat_(NSString, v19, (uint64_t)@"%d", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      id v21 = v12;
      v24 = (const char *)objc_msgSend_UTF8String(v21, v22, v23);
      id v25 = v20;
      v28 = (const char *)objc_msgSend_UTF8String(v25, v26, v27);
      int v29 = getaddrinfo(v24, v28, &v45, &v44);
      if (v29)
      {
        v42 = gai_strerror(v29);
        NSLog(@"error finding address %@: %s", v5, v42);
      }

      else
      {
        for (i = v44; i; i = i->ai_next)
        {
          uint64_t v34 = socket(i->ai_family, i->ai_socktype, i->ai_protocol);
          if ((v34 & 0x80000000) == 0)
          {
            uint64_t v35 = v34;
            if (fcntl(v34, 2, 1LL) != -1 && (connect(v35, i->ai_addr, i->ai_addrlen) & 0x80000000) == 0)
            {
              freeaddrinfo(v44);
              uint64_t v39 = objc_msgSend_arrayWithObject_(MEMORY[0x189603F18], v38, (uint64_t)v5);
              addresses = v9->_addresses;
              v9->_addresses = (NSArray *)v39;

              objc_msgSend__setupChannelWithConnectedSocket_assumingOwnership_orDisconnectBlock_(v9, v41, v35, 1, 0);
              goto LABEL_15;
            }

            close(v35);
          }
        }

        v36 = __error();
        v43 = strerror(*v36);
        NSLog(@"Unable to connect to address: %@ (%s)", v5, v43);
      }
    }

    else
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(@"-[%@ %@]: Missing port in URL: %@", v31, v32, v5);
    }

    int v9 = 0LL;
  }

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  if (objc_msgSend_status(self, a2, (uint64_t)a3) == 2)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_socketAcceptedSem, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_socketAcceptedSem);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DTXSocketTransport;
  return -[DTXFileDescriptorTransport transmit:ofLength:](&v8, sel_transmit_ofLength_, a3, a4);
}

- (void)disconnect
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DTXSocketTransport;
  -[DTXFileDescriptorTransport disconnect](&v4, sel_disconnect);
}

- (id)localAddresses
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  p_addresses = &self->_addresses;
  addresses = self->_addresses;
  if (addresses) {
    return addresses;
  }
  objc_msgSend_array(MEMORY[0x189603FA8], a2, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = 0LL;
  if (!getifaddrs(&v21))
  {
    objc_super v8 = v21;
    if (v21)
    {
      do
      {
        ifa_addr = v8->ifa_addr;
        int sa_family = ifa_addr->sa_family;
        if (sa_family == 2 || sa_family == 30 && !*(_DWORD *)&ifa_addr[1].sa_data[6])
        {
          uint64_t v11 = &ifa_addr->sa_data[2];
          uint64_t v12 = &ifa_addr->sa_data[6];
          if (sa_family == 2) {
            uint64_t v13 = v11;
          }
          else {
            uint64_t v13 = v12;
          }
          if (inet_ntop(sa_family, v13, v22, 0x2Eu) == v22)
          {
            uint64_t v16 = objc_msgSend_port(self, v14, v15);
            objc_msgSend_addressForHost_port_(DTXSocketTransport, v17, (uint64_t)v22, v16);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v7, v19, (uint64_t)v18);
          }
        }

        objc_super v8 = v8->ifa_next;
      }

      while (v8);
      v20 = v21;
    }

    else
    {
      v20 = 0LL;
    }

    MEMORY[0x1895D359C](v20);
  }

  objc_storeStrong((id *)p_addresses, v7);
  return v7;
}

- (unsigned)supportedDirections
{
  return 3;
}

- (int)port
{
  return self->_port;
}

- (void).cxx_destruct
{
}

@end