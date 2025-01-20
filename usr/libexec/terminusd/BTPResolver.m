@interface BTPResolver
- (BOOL)start;
- (BTPResolver)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 name:(id)a5 type:(id)a6 domain:(id)a7;
- (NSMutableArray)advertisers;
- (NSString)bonjourDomain;
- (NSString)bonjourName;
- (NSString)bonjourType;
- (_DNSServiceRef_t)sdRefResolve;
- (unsigned)dstIfIndex;
- (unsigned)srcIfIndex;
- (void)dealloc;
- (void)handleReplyFullName:(id)a3 hostTarget:(id)a4 port:(unsigned __int16)a5 txtRecord:(id)a6 ifIndex:(unsigned int)a7;
- (void)setAdvertisers:(id)a3;
- (void)setBonjourDomain:(id)a3;
- (void)setBonjourName:(id)a3;
- (void)setBonjourType:(id)a3;
- (void)setDstIfIndex:(unsigned int)a3;
- (void)setSdRefResolve:(_DNSServiceRef_t *)a3;
- (void)setSrcIfIndex:(unsigned int)a3;
- (void)stop;
@end

@implementation BTPResolver

- (BTPResolver)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 name:(id)a5 type:(id)a6 domain:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___BTPResolver;
  v16 = -[BTPResolver init](&v22, "init");
  v17 = v16;
  if (v16)
  {
    v16->_sdRefResolve = 0LL;
    v16->_srcIfIndex = a3;
    v16->_dstIfIndex = a4;
    objc_storeStrong((id *)&v16->_bonjourName, a5);
    objc_storeStrong((id *)&v17->_bonjourType, a6);
    objc_storeStrong((id *)&v17->_bonjourDomain, a7);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    advertisers = v17->_advertisers;
    v17->_advertisers = (NSMutableArray *)v18;

    v20 = v17;
  }

  else
  {
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d super init failed",  ",  "-[BTPResolver initWithSrcIfIndex:dstIfIndex:name:type:domain:]"",  275);
    }
  }

  return v17;
}

- (BOOL)start
{
  p_sdRefResolve = &self->_sdRefResolve;
  if (self->_sdRefResolve) {
    return 1;
  }
  uint64_t v5 = DNSServiceResolve( p_sdRefResolve,  0,  self->_srcIfIndex,  -[NSString UTF8String](self->_bonjourName, "UTF8String"),  -[NSString UTF8String](self->_bonjourType, "UTF8String"),  -[NSString UTF8String](self->_bonjourDomain, "UTF8String"),  (DNSServiceResolveReply)sub_10001FD78,  self);
  sdRefResolve = self->_sdRefResolve;
  if (!sdRefResolve || (_DWORD)v5)
  {
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d DNSServiceResolve for %@.%@.%@ failed %d",  ",  "-[BTPResolver start]"",  300LL,  self->_bonjourName,  self->_bonjourType,  self->_bonjourDomain,  v5);
    }

    BOOL result = 0;
    *p_sdRefResolve = 0LL;
  }

  else
  {
    if (qword_1001DC6F8 != -1)
    {
      v9 = self->_sdRefResolve;
      dispatch_once(&qword_1001DC6F8, &stru_1001AE468);
      sdRefResolve = v9;
    }

    DNSServiceErrorType v7 = DNSServiceSetDispatchQueue(sdRefResolve, (dispatch_queue_t)qword_1001DC6F0);
    if (!v7)
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC6E0, 2LL))
      {
        if (qword_1001DC6E8 != -1) {
          dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
        }
        _NRLogWithArgs( qword_1001DC6E0,  2LL,  "%s%.30s:%-4d Successfully started resolving for %@.%@.%@ over %u",  ",  "-[BTPResolver start]"",  311LL,  self->_bonjourName,  self->_bonjourType,  self->_bonjourDomain,  self->_srcIfIndex);
      }

      return 1;
    }

    DNSServiceErrorType v8 = v7;
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d DNSServiceSetDispatchQueue failed %d",  ",  "-[BTPResolver start]"",  306,  v8);
    }

    -[BTPResolver stop](self, "stop");
    return 0;
  }

  return result;
}

- (void)stop
{
  sdRefResolve = self->_sdRefResolve;
  if (sdRefResolve)
  {
    DNSServiceRefDeallocate(sdRefResolve);
    self->_sdRefResolve = 0LL;
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v4 = self->_advertisers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      DNSServiceErrorType v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "stop", (void)v9);
        DNSServiceErrorType v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v6);
  }
}

- (void)dealloc
{
  if (self->_sdRefResolve)
  {
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d _sdRefResolve is still active",  ",  "-[BTPResolver dealloc]"",  329);
    }

    -[BTPResolver stop](self, "stop");
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BTPResolver;
  -[BTPResolver dealloc](&v3, "dealloc");
}

- (void)handleReplyFullName:(id)a3 hostTarget:(id)a4 port:(unsigned __int16)a5 txtRecord:(id)a6 ifIndex:(unsigned int)a7
{
  unsigned int v9 = a5;
  id v17 = a3;
  id v12 = a4;
  id v13 = a6;
  if (self->_srcIfIndex == a7)
  {
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 2LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      _NRLogWithArgs( qword_1001DC6E0,  2LL,  "%s%.30s:%-4d received result for %@.%@.%@ : fullName %@ hostTarget %@ port %d txtRecord %@",  ",  "-[BTPResolver handleReplyFullName:hostTarget:port:txtRecord:ifIndex:]"",  345LL,  self->_bonjourName,  self->_bonjourType,  self->_bonjourDomain,  v17,  v12,  __rev16(v9),  v13);
    }

    LOWORD(v16) = v9;
    id v14 = -[BTPAdvertiser initWithSrcIfIndex:dstIfIndex:name:type:domain:hostTarget:port:txtRecord:]( objc_alloc(&OBJC_CLASS___BTPAdvertiser),  "initWithSrcIfIndex:dstIfIndex:name:type:domain:hostTarget:port:txtRecord:",  self->_srcIfIndex,  self->_dstIfIndex,  self->_bonjourName,  self->_bonjourType,  self->_bonjourDomain,  v12,  v16,  v13);
    id v15 = v14;
    if (v14)
    {
      -[BTPAdvertiser start](v14, "start");
      -[NSMutableArray addObject:](self->_advertisers, "addObject:", v15);
    }
  }

  else
  {
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d received update with invalid ifIndex %u != %u",  ",  "-[BTPResolver handleReplyFullName:hostTarget:port:txtRecord:ifIndex:]"",  341,  a7,  self->_srcIfIndex);
    }
  }
}

- (_DNSServiceRef_t)sdRefResolve
{
  return self->_sdRefResolve;
}

- (void)setSdRefResolve:(_DNSServiceRef_t *)a3
{
  self->_sdRefResolve = a3;
}

- (unsigned)srcIfIndex
{
  return self->_srcIfIndex;
}

- (void)setSrcIfIndex:(unsigned int)a3
{
  self->_srcIfIndex = a3;
}

- (unsigned)dstIfIndex
{
  return self->_dstIfIndex;
}

- (void)setDstIfIndex:(unsigned int)a3
{
  self->_dstIfIndex = a3;
}

- (NSString)bonjourName
{
  return self->_bonjourName;
}

- (void)setBonjourName:(id)a3
{
}

- (NSString)bonjourType
{
  return self->_bonjourType;
}

- (void)setBonjourType:(id)a3
{
}

- (NSString)bonjourDomain
{
  return self->_bonjourDomain;
}

- (void)setBonjourDomain:(id)a3
{
}

- (NSMutableArray)advertisers
{
  return self->_advertisers;
}

- (void)setAdvertisers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end