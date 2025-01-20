@interface CUWiFiTrafficPeer
- ($4FF8D77539A8BD95DCE0A545902499A9)peerIP;
- (BOOL)active;
- (NSData)peerMACData;
- (NSString)sessionID;
- (id)peerMACAddressData;
- (unsigned)trafficFlags;
- (void)setActive:(BOOL)a3;
- (void)setPeerIP:(id *)a3;
- (void)setPeerMACData:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setTrafficFlags:(unsigned int)a3;
@end

@implementation CUWiFiTrafficPeer

- (id)peerMACAddressData
{
  if (-[NSData length](self->_peerMACData, "length") == 6) {
    return self->_peerMACData;
  }
  if (self->_peerIP.sa.sa_family != 30) {
    return 0LL;
  }
  int v4 = self->_peerIP.v6.sin6_addr.__u6_addr8[0];
  if (v4 == 254)
  {
    if ((self->_peerIP.sa.sa_data[7] & 0xC0) != 0x80) {
      return 0LL;
    }
  }

  else if ((v4 & 0xFE) != 0xFC)
  {
    return 0LL;
  }

  __uint32_t sin6_scope_id = self->_peerIP.v6.sin6_scope_id;
  if (sin6_scope_id && sin6_scope_id == if_nametoindex("awdl0"))
  {
    char v6 = self->_peerIP.v6.sin6_addr.__u6_addr8[8] ^ 2;
    __int16 v7 = *(__uint16_t *)((char *)&self->_peerIP.v6.sin6_addr.__u6_addr16[4] + 1);
    __uint8_t v8 = self->_peerIP.v6.sin6_addr.__u6_addr8[13];
    __uint16_t v9 = self->_peerIP.v6.sin6_addr.__u6_addr16[7];
    return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v6 length:6];
  }

  return 0LL;
}

- ($4FF8D77539A8BD95DCE0A545902499A9)peerIP
{
  retstr->var0 = *(sockaddr *)&self[1].var2.sin6_flowinfo;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[1].var2.sin6_addr + 8);
  return self;
}

- (void)setPeerIP:(id *)a3
{
  sockaddr var0 = a3->var0;
  *(in6_addr *)((char *)&self->_peerIP.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_peerIP.sa = var0;
}

- (NSData)peerMACData
{
  return self->_peerMACData;
}

- (void)setPeerMACData:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  self->_trafficFlags = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
}

@end