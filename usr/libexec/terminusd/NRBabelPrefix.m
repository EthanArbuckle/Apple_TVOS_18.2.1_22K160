@interface NRBabelPrefix
- (BOOL)isContainedInPrefix:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPrefix:(const in6_addr *)a3 plen:(unsigned __int8)a4;
- (NRBabelPrefix)initWithPrefix:(const in6_addr *)a3 plen:(unsigned __int8)a4;
- (id)description;
- (id)descriptionWithoutPlen;
- (in6_addr)prefixInner;
- (unsigned)plen;
- (unsigned)writeToAE:(char *)a3 plen:(char *)a4 prefix:(char *)a5;
- (void)setPlen:(unsigned __int8)a3;
- (void)setPrefixInner:(in6_addr)a3;
- (void)writePrefix:(in6_addr *)a3;
@end

@implementation NRBabelPrefix

- (NRBabelPrefix)initWithPrefix:(const in6_addr *)a3 plen:(unsigned __int8)a4
{
  uint64_t p_class_meths = a4;
  if (a4 < 0x81u) {
    goto LABEL_8;
  }
  LODWORD(v7) = a4;
  uint64_t p_class_meths = (uint64_t)&OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
  if (qword_1001DC8B0 != -1) {
    goto LABEL_26;
  }
  while (1)
  {
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (*(void *)(p_class_meths + 2224) != -1LL) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "attempted to create prefix with plen %u > 128", (_DWORD)v7);
    }

    uint64_t p_class_meths = 128LL;
LABEL_8:
    if (!a3->__u6_addr32[0]
      && !a3->__u6_addr32[1]
      && p_class_meths <= 0x5F
      && a3->__u6_addr32[2] == -65536)
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        _NRLogWithArgs(qword_1001DC8A8, 17LL, "attempted to create v4 prefix with plen %u < 96", p_class_meths);
      }

      else {
        uint64_t p_class_meths = (p_class_meths + 96);
      }
    }

    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___NRBabelPrefix;
    result = -[NRBabelPrefix init](&v16, "init");
    if (result) {
      break;
    }
    id v9 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v9, 16LL);

    v7 = "-[NRBabelPrefix initWithPrefix:plen:]";
    if (IsLevelEnabled)
    {
      id v11 = sub_1000B07C8();
      _NRLogWithArgs( v11,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRBabelPrefix initWithPrefix:plen:]"",  558);
    }

    a3 = (const in6_addr *)_os_log_pack_size(12LL);
    self = (NRBabelPrefix *)((char *)&v15 - ((__chkstk_darwin(a3) + 15) & 0xFFFFFFFFFFFFFFF0LL));
    v12 = __error();
    uint64_t v13 = _os_log_pack_fill(self, a3, *v12, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "-[NRBabelPrefix initWithPrefix:plen:]";
    id v14 = sub_1000B07C8();
    _NRLogAbortWithPack(v14, self);
LABEL_26:
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }

  result->_prefixInner = *a3;
  result->_plen = p_class_meths;
  return result;
}

- (BOOL)matchesPrefix:(const in6_addr *)a3 plen:(unsigned __int8)a4
{
  if (self->_plen != a4) {
    return 0;
  }
  unsigned int v4 = a4;
  p_prefixInner = &self->_prefixInner;
  if (a4 >= 0x81u)
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "attempted to compare prefixes with plen %u > 128", v4);
    }

    unsigned int v4 = 128;
  }

  char v7 = v4;
  size_t v8 = (unint64_t)v4 >> 3;
  if (memcmp(p_prefixInner, a3, v8)) {
    return 0;
  }
  if ((v7 & 7) != 0)
  {
    if ((v7 & 0x80) == 0) {
      return (a3->__u6_addr8[v8] ^ p_prefixInner->__u6_addr8[v8]) >> (8 - (v7 & 7)) == 0;
    }
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "Invalid plenLastBits %u plenBytes %u", v7 & 7, v8);
    }
  }

  return 1;
}

- (id)description
{
  p_prefixInner = &self->_prefixInner;
  unsigned __int8 plen = self->_plen;
  if (!self->_prefixInner.__u6_addr32[0]
    && !self->_prefixInner.__u6_addr32[1]
    && self->_prefixInner.__u6_addr32[2] == -65536)
  {
    plen -= 96;
  }

  unsigned int v4 = objc_alloc(&OBJC_CLASS___NSString);
  IPv6AddrString = (void *)createIPv6AddrString(p_prefixInner, v5);
  char v7 = -[NSString initWithFormat:](v4, "initWithFormat:", @"%@/%u", IPv6AddrString, plen);

  return v7;
}

- (id)descriptionWithoutPlen
{
  __uint32_t v4 = self->_prefixInner.__u6_addr32[0];
  p_prefixInner = &self->_prefixInner;
  if (v4 || self->_prefixInner.__u6_addr32[1] || self->_prefixInner.__u6_addr32[2] != -65536) {
    IPv6AddrString = (void *)createIPv6AddrString(p_prefixInner, a2);
  }
  else {
    IPv6AddrString = 0LL;
  }
  return IPv6AddrString;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NRBabelPrefix);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    unsigned __int8 v6 = [v4 matchesPrefix:&self->_prefixInner plen:self->_plen];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isContainedInPrefix:(id)a3
{
  id v4 = a3;
  unsigned int plen = self->_plen;
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)writePrefix:(in6_addr *)a3
{
  *a3 = self->_prefixInner;
}

- (unsigned)writeToAE:(char *)a3 plen:(char *)a4 prefix:(char *)a5
{
  *(void *)a5 = 0LL;
  *((void *)a5 + 1) = 0LL;
  unsigned int plen = self->_plen;
  if (plen < 0x81)
  {
    if (!self->_plen)
    {
      LOBYTE(v12) = 0;
      *a3 = 0;
      goto LABEL_14;
    }
  }

  else
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "internal error plen %u > 128", plen);
    }

    unsigned int plen = 128;
  }

  unsigned int v10 = plen + 7;
  p_prefixInner = &self->_prefixInner;
  if (!self->_prefixInner.__u6_addr32[0] && !self->_prefixInner.__u6_addr32[1])
  {
    __uint32_t v14 = self->_prefixInner.__u6_addr32[2];
    if (v14)
    {
      if (v14 == -65536)
      {
        LOBYTE(plen) = plen - 96;
        int v12 = (v10 >> 3) - 12;
        *a3 = 1;
        p_prefixInner = (in6_addr *)&self->_prefixInner.__u6_addr32[3];
        goto LABEL_13;
      }
    }

    else if (self->_prefixInner.__u6_addr32[3] == 0x1000000)
    {
      *a3 = 3;
      int v12 = (v10 >> 3) - 8;
      p_prefixInner = (in6_addr *)&self->_prefixInner.__u6_addr32[2];
      goto LABEL_13;
    }
  }

  int v12 = v10 >> 3;
  *a3 = 2;
LABEL_13:
  memcpy(a5, p_prefixInner, v12);
LABEL_14:
  *a4 = plen;
  return v12;
}

- (in6_addr)prefixInner
{
  uint64_t v2 = *(void *)&self->_prefixInner.__u6_addr32[2];
  uint64_t v3 = *(void *)self->_prefixInner.__u6_addr8;
  *(void *)&result.__u6_addr32[2] = v2;
  *(void *)result.__u6_addr8 = v3;
  return result;
}

- (void)setPrefixInner:(in6_addr)a3
{
  self->_prefixInner = a3;
}

- (unsigned)plen
{
  return self->_plen;
}

- (void)setPlen:(unsigned __int8)a3
{
  self->_unsigned int plen = a3;
}

@end