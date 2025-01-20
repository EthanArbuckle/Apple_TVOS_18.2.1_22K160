@interface NRBabelInterfaceSocket
- (BOOL)handlePathUpdate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)setupLocalAddress;
- (BOOL)setupLocalAddressCheckAgainst:(const in6_addr *)a3;
- (NRBabelInterfaceSocket)initWithInstance:(id)a3 interface:(unsigned int)a4;
- (NSString)ifName;
- (OS_dispatch_source)socketReadSource;
- (OS_nw_interface)nwIf;
- (OS_nw_path_evaluator)pathEvaluator;
- (id)description;
- (int)fd;
- (unsigned)ifIndex;
- (void)addToProhibited:(id)a3;
- (void)dealloc;
- (void)readPackets;
- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5;
- (void)setFd:(int)a3;
- (void)setIfIndex:(unsigned int)a3;
- (void)setIfName:(id)a3;
- (void)setNwIf:(id)a3;
- (void)setPathEvaluator:(id)a3;
- (void)setSocketReadSource:(id)a3;
@end

@implementation NRBabelInterfaceSocket

- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5
{
  uint64_t v6 = *(void *)&a4;
  if (-[NRBabelInterface viable](self, "viable"))
  {
    int fd = self->_fd;
    unsigned int ifIndex = self->_ifIndex;
    uint64_t v36 = 672800284LL;
    unsigned int v38 = ifIndex;
    in6_addr v37 = *a5;
    v35.msg_name = &v36;
    v35.msg_namelen = 28;
    v35.msg_iov = a3;
    v35.msg_iovlen = v6;
    v35.msg_control = 0LL;
    *(void *)&v35.msg_controllen = 0LL;
    ssize_t v11 = sendmsg(fd, &v35, 0);
    if (v11 < 0)
    {
      int v15 = *__error();
      if (strerror_r(v15, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        _NRLogWithArgs(qword_1001DC8A8, 17LL, "sendmsg failed: [%d] %s", v15, __strerrbuf);
      }
    }

    else
    {
      ssize_t v12 = v11;
      if ((_DWORD)v6)
      {
        uint64_t v13 = v6;
        if (v6 > 8)
        {
          uint64_t v16 = v6 & 7;
          if (!v16) {
            uint64_t v16 = 8LL;
          }
          uint64_t v14 = v6 - v16;
          p_iov_len = (const double *)&a3[4].iov_len;
          int32x4_t v18 = 0uLL;
          uint64_t v19 = v14;
          int32x4_t v20 = 0uLL;
          do
          {
            v21 = p_iov_len - 8;
            unsigned __int128 v22 = (unsigned __int128)vld2q_f64(v21);
            v23 = p_iov_len - 4;
            unsigned __int128 v24 = (unsigned __int128)vld2q_f64(v23);
            v25 = p_iov_len + 16;
            unsigned __int128 v27 = (unsigned __int128)vld2q_f64(p_iov_len);
            v26 = p_iov_len + 4;
            unsigned __int128 v28 = (unsigned __int128)vld2q_f64(v26);
            int32x4_t v18 = vaddq_s32(v18, vuzp1q_s32((int32x4_t)v22, (int32x4_t)v24));
            int32x4_t v20 = vaddq_s32(v20, vuzp1q_s32((int32x4_t)v27, (int32x4_t)v28));
            p_iov_len = v25;
            v19 -= 8LL;
          }

          while (v19);
          LODWORD(v6) = vaddvq_s32(vaddq_s32(v20, v18));
        }

        else
        {
          uint64_t v14 = 0LL;
          LODWORD(v6) = 0;
        }

        uint64_t v29 = v13 - v14;
        v30 = &a3[v14].iov_len;
        do
        {
          int v31 = *(_DWORD *)v30;
          v30 += 2;
          uint64_t v6 = (v6 + v31);
          --v29;
        }

        while (v29);
      }

      if ((_DWORD)v6 != (_DWORD)v11)
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          id v32 = (id)qword_1001DC8A8;
          IPv6AddrString = (void *)createIPv6AddrString(a5, v33);
          _NRLogWithArgs( v32,  16LL,  "%s%.30s:%-4d sent %zd instead of %u to %@",  ",  "-[NRBabelInterfaceSocket sendPacket:iovLen:toAddr:]"",  815LL,  v12,  v6,  IPv6AddrString);
        }
      }
    }
  }

- (void)dealloc
{
  socketReadSource = self->_socketReadSource;
  if (socketReadSource) {
    dispatch_source_cancel((dispatch_source_t)socketReadSource);
  }
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    close(fd);
  }
  pathEvaluator = self->_pathEvaluator;
  if (pathEvaluator) {
    nw_path_evaluator_cancel(pathEvaluator, a2);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NRBabelInterfaceSocket;
  -[NRBabelInterface dealloc](&v6, "dealloc");
}

- (void)readPackets
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInterface instance](self, "instance"));
  if (!v3) {
    goto LABEL_107;
  }
  int fd = v2->_fd;
  unint64_t v48 = (unint64_t)v59 | 0xC;
  memset(v59, 0, sizeof(v59));
  v54[0] = v58;
  v54[1] = 2000LL;
LABEL_3:
  while (2)
  {
    v53.msg_name = &v55;
    v53.msg_namelen = 28;
    v53.msg_iov = (iovec *)v54;
    v53.msg_iovlen = 1;
    v53.msg_control = v59;
    *(void *)&v53.msg_controllen = 32LL;
    ssize_t v5 = recvmsg(fd, &v53, 0);
    if ((v5 & 0x8000000000000000LL) == 0)
    {
      msg_name = (unsigned __int8 *)v53.msg_name;
      if (v53.msg_namelen < 0x1C || v53.msg_name == 0LL)
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d missing name message %u %p",  ",  "-[NRBabelInterfaceSocket readPackets]"",  870,  v53.msg_namelen,  v53.msg_name);
        }

        continue;
      }

      if (*((_BYTE *)v53.msg_name + 1) != 30)
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d packet came from wrong address family %u",  ",  "-[NRBabelInterfaceSocket readPackets]"",  876,  msg_name[1]);
        }

        continue;
      }

      if (*(unsigned __int8 *)v53.msg_name <= 0x1Bu)
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d packet source sin6_len too short %u < %zu",  ",  "-[NRBabelInterfaceSocket readPackets]"",  880,  *msg_name,  0x1CuLL);
        }

        continue;
      }

      ssize_t v8 = v5;
      v9 = (char *)v53.msg_name + 8;
      if (*((unsigned __int8 *)v53.msg_name + 8) == 254 && (*((_BYTE *)v53.msg_name + 9) & 0xC0) == 0x80
        || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInterfaceSocket ifName](v2, "ifName")),
            unsigned __int8 v11 = [v10 hasPrefix:@"ipsec"],
            v10,
            (v11 & 1) != 0))
      {
        if (*((_WORD *)msg_name + 1) != 10266)
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
          {
            if (qword_1001DC8B0 != -1) {
              dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
            }
            _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d packet came from wrong source port %u",  ",  "-[NRBabelInterfaceSocket readPackets]"",  892,  bswap32(*((unsigned __int16 *)msg_name + 1)) >> 16);
          }

          continue;
        }

        if (v53.msg_controllen - 33 < 0xFFFFFFF3 || v53.msg_control != v59)
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
          {
            if (qword_1001DC8B0 != -1) {
              dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
            }
            _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d missing control message %u %p %p",  ",  "-[NRBabelInterfaceSocket readPackets]"",  898,  v53.msg_controllen,  v53.msg_control,  v59);
          }

          continue;
        }

        if (DWORD2(v59[0]) != 46)
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
          {
            if (qword_1001DC8B0 != -1) {
              dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
            }
            _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d Invalid cmsg_type %d",  ",  "-[NRBabelInterfaceSocket readPackets]"",  903,  DWORD2(v59[0]));
          }

          continue;
        }

        if (HIDWORD(v59[1]) == v2->_ifIndex)
        {
          if (-[NRBabelInterface isLocalAddressEqualTo:](v2, "isLocalAddressEqualTo:", v48)) {
            goto LABEL_47;
          }
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          id v13 = (id)qword_1001DC8A8;
          int IsLevelEnabled = _NRLogIsLevelEnabled(v13, 1LL);

          if (IsLevelEnabled)
          {
            id v15 = sub_1000B07C8();
            IPv6AddrString = (void *)createIPv6AddrString(v48, v16);
            _NRLogWithArgs( v15,  1LL,  "%s%.30s:%-4d received packet on wrong local address %@, rechecking",  ",  "-[NRBabelInterfaceSocket readPackets]"",  942LL,  IPv6AddrString);
          }

          if (-[NRBabelInterfaceSocket setupLocalAddressCheckAgainst:](v2, "setupLocalAddressCheckAgainst:", v48))
          {
LABEL_47:
            [v3 handlePacket:v58 length:v8 remoteAddr:msg_name + 8 localAddr:v48 babelInterface:v2 dtls:0];
          }

          else
          {
            id v41 = sub_1000B07C8();
            int v42 = _NRLogIsLevelEnabled(v41, 16LL);

            if (v42)
            {
              id v32 = sub_1000B07C8();
              v34 = (void *)createIPv6AddrString(v48, v43);
              _NRLogWithArgs( v32,  16LL,  "%s%.30s:%-4d packet was sent to wrong local address %@",  ",  "-[NRBabelInterfaceSocket readPackets]"",  945LL,  v34);
              goto LABEL_97;
            }
          }

          continue;
        }

        v46 = v2;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        v47 = v3;
        v21 = (void *)objc_claimAutoreleasedReturnValue([v3 interfaces]);
        id v22 = [v21 countByEnumeratingWithState:&v49 objects:v56 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v50;
LABEL_76:
          uint64_t v25 = 0LL;
          while (1)
          {
            if (*(void *)v50 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v49 + 1) + 8 * v25);
            uint64_t v27 = objc_opt_class(&OBJC_CLASS___NRBabelInterfaceSocket);
            if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
            {
              id v28 = v26;
              unsigned int v29 = [v28 ifIndex];
              if (v29 == HIDWORD(v59[1]))
              {
                v3 = v47;
                [v47 handlePacket:v58 length:v8 remoteAddr:v9 localAddr:v48 babelInterface:v28 dtls:0];

                if (qword_1001DC8B0 != -1) {
                  dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
                }
                v2 = v46;
                id v30 = (id)qword_1001DC8A8;
                char v31 = _NRLogIsLevelEnabled(v30, 2LL);

                if ((v31 & 1) != 0)
                {
                  if (qword_1001DC8B0 != -1) {
                    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
                  }
                  id v32 = (id)qword_1001DC8A8;
                  v34 = (void *)createIPv6AddrString(v9, v33);
                  uint64_t v36 = (void *)createIPv6AddrString(v48, v35);
                  _NRLogWithArgs( v32,  2LL,  "%s%.30s:%-4d handled packet from %@ to %@ that came over wrong interface %u, expected %u",  ",  "-[NRBabelInterfaceSocket readPackets]"",  930LL,  v34,  v36,  HIDWORD(v59[1]),  v46->_ifIndex);

LABEL_97:
                }

                goto LABEL_3;
              }
            }

            if (v23 == (id)++v25)
            {
              id v23 = [v21 countByEnumeratingWithState:&v49 objects:v56 count:16];
              if (!v23) {
                break;
              }
              goto LABEL_76;
            }
          }
        }

        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        v2 = v46;
        v3 = v47;
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        id v37 = (id)qword_1001DC8A8;
        int32x4_t v20 = (void *)createIPv6AddrString(v9, v38);
        v40 = (void *)createIPv6AddrString(v48, v39);
        _NRLogWithArgs( v37,  16LL,  "%s%.30s:%-4d packet from %@ to %@ came over wrong interface %u, expected %u",  ",  "-[NRBabelInterfaceSocket readPackets]"",  934LL,  v20,  v40,  HIDWORD(v59[1]),  v46->_ifIndex);
      }

      else
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        id v18 = (id)qword_1001DC8A8;
        int32x4_t v20 = (void *)createIPv6AddrString(msg_name + 8, v19);
        _NRLogWithArgs( v18,  16LL,  "%s%.30s:%-4d packet came from a non-link-local address %@",  ",  "-[NRBabelInterfaceSocket readPackets]"",  887LL,  v20);
      }

      continue;
    }

    break;
  }

  v44 = __error();
  int v45 = *v44;
  if (*v44 != 35)
  {
    if (strerror_r(*v44, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "recvmsg failed: [%d] %s", v45, __strerrbuf);
    }
  }

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  ifName = self->_ifName;
  unsigned int v5 = -[NRBabelInterface dtlsEnabled](self, "dtlsEnabled");
  objc_super v6 = "";
  if (v5) {
    objc_super v6 = "_DTLS";
  }
  return -[NSString initWithFormat:](v3, "initWithFormat:", @"%@%s", ifName, v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NRBabelInterfaceSocket);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    unsigned int ifIndex = self->_ifIndex;
    BOOL v7 = ifIndex == [v4 ifIndex];
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)setupLocalAddressCheckAgainst:(const in6_addr *)a3
{
  id v32 = 0LL;
  if (getifaddrs(&v32))
  {
    int v5 = *__error();
    if (strerror_r(v5, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "getifaddrs failed: [%d] %s", v5, __strerrbuf);
    }

- (BOOL)setupLocalAddress
{
  return -[NRBabelInterfaceSocket setupLocalAddressCheckAgainst:](self, "setupLocalAddressCheckAgainst:", 0LL);
}

- (NRBabelInterfaceSocket)initWithInstance:(id)a3 interface:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  unsigned int v97 = v4;
  v96.receiver = self;
  v96.super_class = (Class)&OBJC_CLASS___NRBabelInterfaceSocket;
  BOOL v7 = -[NRBabelInterface initWithInstance:](&v96, "initWithInstance:", v6);
  ssize_t v8 = v7;
  if (!v7)
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "[super initWithInstance:] failed");
    }

    goto LABEL_117;
  }

  v7->_unsigned int ifIndex = v4;
  BOOL v9 = if_indextoname(v4, (char *)__strerrbuf) == 0LL;
  v10 = objc_alloc(&OBJC_CLASS___NSString);
  if (v9) {
    unsigned __int8 v11 = -[NSString initWithFormat:](v10, "initWithFormat:", @"invalid%u", v4);
  }
  else {
    unsigned __int8 v11 = -[NSString initWithUTF8String:](v10, "initWithUTF8String:", __strerrbuf);
  }
  ifName = v8->_ifName;
  v8->_ifName = v11;

  if (-[NSString hasPrefix:](v8->_ifName, "hasPrefix:", @"en")) {
    -[NRBabelInterface setDtlsEnabled:](v8, "setDtlsEnabled:", 1LL);
  }
  uint64_t v13 = socket(30, 2, 0);
  if ((v13 & 0x80000000) != 0)
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "socket(AF_INET6, SOCK_DGRAM, 0) failed");
    }

    goto LABEL_117;
  }

  if (!-[NRBabelInterfaceSocket setupLocalAddress](v8, "setupLocalAddress"))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d %@ failed to find local address",  ",  "-[NRBabelInterfaceSocket initWithInstance:interface:]"",  1056LL,  v8);
    }

    goto LABEL_116;
  }

  int v14 = fcntl(v13, 3, 0LL);
  if (v14 < 0)
  {
    int v17 = *__error();
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "fcntl(%d, F_GETFL, 0): [%d] %s", v13, v17, (const char *)__strerrbuf);
    }

    goto LABEL_116;
  }

  int v15 = v14 | 4;
  if (fcntl(v13, 4, v14 | 4u))
  {
    int v16 = *__error();
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "fcntl(%d, F_SETFL, %d): [%d] %s", v13, v15, v16, (const char *)__strerrbuf);
    }

    goto LABEL_116;
  }

  __int128 v94 = xmmword_1001568DC;
  unsigned int v95 = v97;
  if (setsockopt(v13, 41, 12, &v94, 0x14u))
  {
    int v18 = *__error();
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      id v19 = sub_1000B07C8();
      _NRLogWithArgs(v19, 17LL, "failed to join mcast group: [%d] %s", v18, (const char *)__strerrbuf);
    }

    goto LABEL_116;
  }

  if (setsockopt(v13, 41, 11, &unk_1001568B8, 4u))
  {
    int v20 = *__error();
    id v21 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v21, 17LL);

    if (IsLevelEnabled)
    {
      id v23 = sub_1000B07C8();
      _NRLogWithArgs(v23, 17LL, "IPV6_MULTICAST_LOOP failed: [%d] %s", v20, (const char *)__strerrbuf);
    }

    goto LABEL_116;
  }

  if (setsockopt(v13, 0xFFFF, 4, &unk_1001568BC, 4u))
  {
    int v24 = *__error();
    id v25 = sub_1000B07C8();
    int v26 = _NRLogIsLevelEnabled(v25, 17LL);

    if (v26)
    {
      id v27 = sub_1000B07C8();
      _NRLogWithArgs(v27, 17LL, "SO_REUSEADDR failed: [%d] %s", v24, (const char *)__strerrbuf);
    }

    goto LABEL_116;
  }

  if (setsockopt(v13, 0xFFFF, 512, &unk_1001568BC, 4u))
  {
    int v28 = *__error();
    id v29 = sub_1000B07C8();
    int v30 = _NRLogIsLevelEnabled(v29, 17LL);

    if (v30)
    {
      id v31 = sub_1000B07C8();
      _NRLogWithArgs(v31, 17LL, "SO_REUSEPORT failed: [%d] %s", v28, (const char *)__strerrbuf);
    }

    goto LABEL_116;
  }

  if (setsockopt(v13, 41, 125, &v97, 4u))
  {
    int v32 = *__error();
    id v33 = sub_1000B07C8();
    int v34 = _NRLogIsLevelEnabled(v33, 17LL);

    if (v34)
    {
      id v35 = sub_1000B07C8();
      _NRLogWithArgs(v35, 17LL, "IPV6_BOUND_IF %u failed: [%d] %s", v97, v32, (const char *)__strerrbuf);
    }

    goto LABEL_116;
  }

  if (setsockopt(v13, 41, 27, &unk_1001568BC, 4u))
  {
    int v36 = *__error();
    id v37 = sub_1000B07C8();
    int v38 = _NRLogIsLevelEnabled(v37, 17LL);

    if (v38)
    {
      id v39 = sub_1000B07C8();
      _NRLogWithArgs(v39, 17LL, "IPV6_V6ONLY failed: [%d] %s", v36, (const char *)__strerrbuf);
    }

    goto LABEL_116;
  }

  if (setsockopt(v13, 0xFFFF, 4130, &unk_1001568BC, 4u))
  {
    int v40 = *__error();
    id v41 = sub_1000B07C8();
    int v42 = _NRLogIsLevelEnabled(v41, 17LL);

    if (v42)
    {
      id v43 = sub_1000B07C8();
      _NRLogWithArgs(v43, 17LL, "SO_NOSIGPIPE failed: [%d] %s", v40, (const char *)__strerrbuf);
    }

    goto LABEL_116;
  }

  if (setsockopt(v13, 41, 61, &unk_1001568BC, 4u))
  {
    int v44 = *__error();
    id v45 = sub_1000B07C8();
    int v46 = _NRLogIsLevelEnabled(v45, 17LL);

    if (v46)
    {
      id v47 = sub_1000B07C8();
      _NRLogWithArgs(v47, 17LL, "IPV6_RECVPKTINFO failed: [%d] %s", v44, (const char *)__strerrbuf);
    }

    goto LABEL_116;
  }

  v93[0] = (sockaddr)xmmword_1001568C0;
  *(_OWORD *)&v93[0].sa_data[10] = *(__int128 *)((char *)&xmmword_1001568C0 + 12);
  if (bind(v13, v93, 0x1Cu))
  {
    int v48 = *__error();
    id v49 = sub_1000B07C8();
    int v50 = _NRLogIsLevelEnabled(v49, 17LL);

    if (v50)
    {
      id v51 = sub_1000B07C8();
      _NRLogWithArgs(v51, 17LL, "bind failed: [%d] %s", v48, (const char *)__strerrbuf);
    }

    goto LABEL_116;
  }

  __int128 v52 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 queue]);
  dispatch_source_t v53 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v13, 0LL, v52);
  socketReadSource = v8->_socketReadSource;
  v8->_socketReadSource = (OS_dispatch_source *)v53;

  if (!v8->_socketReadSource)
  {
    id v71 = sub_1000B07C8();
    int v72 = _NRLogIsLevelEnabled(v71, 17LL);

    if (v72)
    {
      id v73 = sub_1000B07C8();
      _NRLogWithArgs(v73, 17LL, "dispatch_source_create failed");
    }

    goto LABEL_116;
  }

  v8->_int fd = v13;
  objc_initWeak(__strerrbuf, v8);
  char v55 = (dispatch_source_s *)v8->_socketReadSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000B375C;
  handler[3] = &unk_1001AFED0;
  objc_copyWeak(&v92, __strerrbuf);
  dispatch_source_set_event_handler(v55, handler);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B3788;
  block[3] = &unk_1001AFED0;
  objc_copyWeak(&v90, __strerrbuf);
  dispatch_async(v52, block);
  dispatch_activate((dispatch_object_t)v8->_socketReadSource);
  id v56 = sub_1000B07C8();
  char v57 = _NRLogIsLevelEnabled(v56, 1LL);

  if ((v57 & 1) != 0)
  {
    id v58 = sub_1000B07C8();
    _NRLogWithArgs( v58,  1LL,  "%s%.30s:%-4d succesfully opened socket fd %d on %@",  ",  "-[NRBabelInterfaceSocket initWithInstance:interface:]"",  1159LL,  v13,  v8->_ifName);
  }

  uint64_t v59 = nw_interface_create_with_index(v97);
  nwIf = v8->_nwIf;
  v8->_nwIf = (OS_nw_interface *)v59;

  if (!v8->_nwIf)
  {
    id v74 = sub_1000B07C8();
    int v75 = _NRLogIsLevelEnabled(v74, 16LL);

    if (!v75)
    {
      int v70 = 6;
      goto LABEL_115;
    }

    id v62 = sub_1000B07C8();
    _NRLogWithArgs( v62,  16LL,  "%s%.30s:%-4d failed to open interface index %u",  ",  "-[NRBabelInterfaceSocket initWithInstance:interface:]"",  1163,  v97);
    goto LABEL_113;
  }

  v61 = nw_parameters_create();
  id v62 = v61;
  if (!v61)
  {
    id v76 = sub_1000B07C8();
    char v77 = _NRLogIsLevelEnabled(v76, 17LL);

    if ((v77 & 1) != 0)
    {
      id v78 = sub_1000B07C8();
      _NRLogWithArgs(v78, 17LL, "nw_parameters_create failed");
    }

    id v62 = 0LL;
    goto LABEL_113;
  }

  nw_parameters_require_interface(v61, v8->_nwIf);
  uint64_t evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(0LL, v62);
  pathEvaluator = v8->_pathEvaluator;
  v8->_pathEvaluator = (OS_nw_path_evaluator *)evaluator_for_endpoint;

  v65 = v8->_pathEvaluator;
  if (!v65)
  {
    id v79 = sub_1000B07C8();
    int v80 = _NRLogIsLevelEnabled(v79, 17LL);

    if (v80)
    {
      id v81 = sub_1000B07C8();
      _NRLogWithArgs(v81, 17LL, "nw_path_create_evaluator_for_endpoint with ifIndex %u failed", v97);
    }

    goto LABEL_113;
  }

  v66 = (void *)nw_path_evaluator_copy_path(v65);
  unsigned __int8 v67 = -[NRBabelInterfaceSocket handlePathUpdate:](v8, "handlePathUpdate:", v66);

  if ((v67 & 1) == 0)
  {
    id v82 = sub_1000B07C8();
    int v83 = _NRLogIsLevelEnabled(v82, 16LL);

    if (v83)
    {
      id v84 = sub_1000B07C8();
      _NRLogWithArgs( v84,  16LL,  "%s%.30s:%-4d path for ifIndex %u is not satisfied",  ",  "-[NRBabelInterfaceSocket initWithInstance:interface:]"",  1179,  v97);
    }

- (BOOL)handlePathUpdate:(id)a3
{
  uint64_t v4 = (nw_path *)a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInterface instance](self, "instance"));
  if (v5)
  {
    if (nw_path_get_status(v4) == nw_path_status_satisfied)
    {
      if (!-[NRBabelInterface viable](self, "viable"))
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d if %@ is viable again",  ",  "-[NRBabelInterfaceSocket handlePathUpdate:]"",  1207LL,  self);
        }
      }

      -[NRBabelInterface setViable:](self, "setViable:", 1LL);
      id v6 = objc_alloc(&OBJC_CLASS___NSString);
      ifName = self->_ifName;
      ssize_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 addrStr]);
      BOOL v9 = -[NSString initWithFormat:]( v6,  "initWithFormat:",  @"for addr in $(ifconfig %@ | grep 'inet6 fdfd:' | sed -e 's/^[[:space:]]*//' | cut -d' ' -f2); do ifconfig %@ inet6 -alias $addr ; done ; ifconfig %@ inet6 %@/128",
             ifName,
             ifName,
             ifName,
             v8);

      system(-[NSString UTF8String](v9, "UTF8String"));
      int mtu = nw_path_get_mtu(v4);
      int v11 = mtu - 48;
      if (mtu > 559)
      {
        if (mtu >= 0x10030)
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
          {
            if (qword_1001DC8B0 != -1) {
              dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
            }
            _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d MTU for ifIndex %u is high %d",  ",  "-[NRBabelInterfaceSocket handlePathUpdate:]"",  1225,  self->_ifIndex,  v11);
          }

          int v11 = 0xFFFF;
        }
      }

      else
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d MTU for ifIndex %u is low %d",  ",  "-[NRBabelInterfaceSocket handlePathUpdate:]"",  1222,  self->_ifIndex,  v11);
        }

        int v11 = 512;
      }

      if (-[NRBabelInterface mtu](self, "mtu") != (unsigned __int16)v11)
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          id v15 = (id)qword_1001DC8A8;
          _NRLogWithArgs( v15,  1LL,  "%s%.30s:%-4d updating MTU from %u to %d",  ",  "-[NRBabelInterfaceSocket handlePathUpdate:]",  1229,  -[NRBabelInterface mtu](self, "mtu""),  v11);
        }

        -[NRBabelInterface setMtu:](self, "setMtu:", (unsigned __int16)v11);
      }

      BOOL v12 = 1;
    }

    else
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        id v13 = (id)qword_1001DC8A8;
        uint64_t status = nw_path_get_status(v4);
        _NRLogWithArgs( v13,  1LL,  "%s%.30s:%-4d canceling if %@ because path not satisfied %u",  ",  "-[NRBabelInterfaceSocket handlePathUpdate:]"",  1201LL,  self,  status);
      }

      -[NRBabelInterface setViable:](self, "setViable:", 0LL);
      [v5 purgeInterface:self];
      BOOL v12 = 0;
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)addToProhibited:(id)a3
{
  id v14 = a3;
  int v5 = (void *)nw_parameters_copy_prohibited_interfaces();
  if (!v5)
  {
    id v6 = &v14;
    xpc_object_t v7 = xpc_array_create(0LL, 0LL);
    if (!v7)
    {
      id v8 = sub_1000B07C8();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 16LL);

      if (IsLevelEnabled)
      {
        id v10 = sub_1000B07C8();
        _NRLogWithArgs( v10,  16LL,  "%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed",  ",  "nr_xpc_array_create"",  56,  0LL,  0);
      }

      int v5 = (void *)_os_log_pack_size(28LL);
      self = (NRBabelInterfaceSocket *)((char *)&v14 - ((__chkstk_darwin(v5) + 15) & 0xFFFFFFFFFFFFFFF0LL));
      int v11 = __error();
      uint64_t v12 = _os_log_pack_fill( self,  v5,  *v11,  &_mh_execute_header,  "%{public}s xpc_array_create(%p, %u) failed");
      sub_10005B18C(v12, (uint64_t)"nr_xpc_array_create");
      id v13 = sub_1000B07C8();
      _NRLogAbortWithPack(v13, self);
LABEL_15:
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      goto LABEL_7;
    }

    int v5 = v7;
  }

  id v6 = (id *)nw_interface_copy_dictionary(self->_nwIf);
  if (v6)
  {
    xpc_array_append_value(v5, v6);
    nw_parameters_set_prohibited_interfaces(v14, v5);
    goto LABEL_11;
  }

  p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
  if (qword_1001DC8B0 != -1) {
    goto LABEL_15;
  }
LABEL_7:
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
  {
    if (p_class_meths[278] != (__objc2_meth_list *)-1LL) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    _NRLogWithArgs(qword_1001DC8A8, 17LL, "nw_interface_copy_dictionary(%u, %@) failed", self->_ifIndex, self->_ifName);
  }

- (unsigned)ifIndex
{
  return self->_ifIndex;
}

- (void)setIfIndex:(unsigned int)a3
{
  self->_unsigned int ifIndex = a3;
}

- (NSString)ifName
{
  return self->_ifName;
}

- (void)setIfName:(id)a3
{
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_int fd = a3;
}

- (OS_dispatch_source)socketReadSource
{
  return self->_socketReadSource;
}

- (void)setSocketReadSource:(id)a3
{
}

- (OS_nw_path_evaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
}

- (OS_nw_interface)nwIf
{
  return self->_nwIf;
}

- (void)setNwIf:(id)a3
{
}

- (void).cxx_destruct
{
}

@end