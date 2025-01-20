@interface IDSHCInfo
- (int64_t)state;
- (unsigned)lastSentAck;
- (unsigned)lastSentSeq;
- (unsigned)localCID;
- (unsigned)remoteCID;
- (unsigned)reqCount;
- (void)invalidate;
- (void)localContext;
- (void)remoteContext;
- (void)setLastSentAck:(unsigned int)a3;
- (void)setLastSentSeq:(unsigned int)a3;
- (void)setLocalCID:(unsigned __int16)a3;
- (void)setLocalContext:(void *)a3;
- (void)setRemoteCID:(unsigned __int16)a3;
- (void)setRemoteContext:(void *)a3;
- (void)setReqCount:(unsigned __int16)a3;
- (void)setState:(int64_t)a3;
@end

@implementation IDSHCInfo

- (void)invalidate
{
  uint64_t v3 = OSLogHandleForIDSCategory("HC");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int localCID = self->_localCID;
    int remoteCID = self->_remoteCID;
    localContext = self->_localContext;
    remoteContext = self->_remoteContext;
    *(_DWORD *)buf = 67109888;
    int v11 = localCID;
    __int16 v12 = 2048;
    v13 = localContext;
    __int16 v14 = 1024;
    int v15 = remoteCID;
    __int16 v16 = 2048;
    v17 = remoteContext;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "invalidate HCInfo - local(%d,%p->NULL) remote(%d,%p->NULL)",  buf,  0x22u);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(0LL, @"HC")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"HC",  @"invalidate HCInfo - local(%d,%p->NULL) remote(%d,%p->NULL)");
  }
  IDSHC_RemoveContext(self->_localContext);
  self->_localContext = 0LL;
  IDSHC_RemoveContext(self->_remoteContext);
  self->_remoteContext = 0LL;
}

- (void)setLocalContext:(void *)a3
{
  uint64_t v5 = OSLogHandleForIDSCategory("HC");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    localContext = self->_localContext;
    *(_DWORD *)buf = 134218240;
    int v11 = localContext;
    __int16 v12 = 2048;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setLocalContext - %p->%p", buf, 0x16u);
  }

  uint64_t v9 = self->_localContext;
  if (v9) {
    free(v9);
  }
  self->_localContext = a3;
}

- (void)setRemoteContext:(void *)a3
{
  uint64_t v5 = OSLogHandleForIDSCategory("HC");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    remoteContext = self->_remoteContext;
    *(_DWORD *)buf = 134218240;
    int v11 = remoteContext;
    __int16 v12 = 2048;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setRemoteContext - %p->%p", buf, 0x16u);
  }

  uint64_t v9 = self->_remoteContext;
  if (v9) {
    free(v9);
  }
  self->_remoteContext = a3;
}

- (void)localContext
{
  return self->_localContext;
}

- (void)remoteContext
{
  return self->_remoteContext;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (unsigned)reqCount
{
  return self->_reqCount;
}

- (void)setReqCount:(unsigned __int16)a3
{
  self->_reqCount = a3;
}

- (unsigned)localCID
{
  return self->_localCID;
}

- (void)setLocalCID:(unsigned __int16)a3
{
  self->_int localCID = a3;
}

- (unsigned)remoteCID
{
  return self->_remoteCID;
}

- (void)setRemoteCID:(unsigned __int16)a3
{
  self->_int remoteCID = a3;
}

- (unsigned)lastSentSeq
{
  return self->_lastSentSeq;
}

- (void)setLastSentSeq:(unsigned int)a3
{
  self->_lastSentSeq = a3;
}

- (unsigned)lastSentAck
{
  return self->_lastSentAck;
}

- (void)setLastSentAck:(unsigned int)a3
{
  self->_lastSentAck = a3;
}

@end