@interface NWStatisticsTCPSource
- (NWStatisticsTCPSource)initWithManager:(id)a3 local:(const sockaddr *)a4 remote:(const sockaddr *)a5;
- (id)_currentSnapshot;
- (id)description;
- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5;
@end

@implementation NWStatisticsTCPSource

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  if (a4 < 0x158) {
    return 1;
  }
  if (self->_eventFlags != a5)
  {
    self->_eventFlags = a5;
    p_descriptor = &self->_descriptor;
    goto LABEL_7;
  }

  if (memcmp(&self->_descriptor, a3, 0x158uLL))
  {
    p_descriptor = &self->_descriptor;
LABEL_7:
    memcpy(p_descriptor, a3, sizeof(nstat_tcp_descriptor));
    return 3;
  }
  v9 = -[NWStatisticsSource manager](self, "manager");
  char v10 = [v9 mgrflags];

  if ((v10 & 4) != 0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)_currentSnapshot
{
  return  -[NWSTCPSnapshot initWithCounts:TCPDescriptor:sourceIdent:events:seqno:provider:]( objc_alloc(&OBJC_CLASS___NWSTCPSnapshot),  "initWithCounts:TCPDescriptor:sourceIdent:events:seqno:provider:",  -[NWStatisticsSource _nstat_counts](self, "_nstat_counts"),  &self->_descriptor,  -[NWStatisticsSource reference](self, "reference"),  self->_eventFlags,  -[NWStatisticsSource snapshotRevision](self, "snapshotRevision"),  -[NWStatisticsSource provider](self, "provider"));
}

- (id)description
{
  __ret = 0LL;
  v3 = (_printf_domain *)printf_domain();
  asxprintf( &__ret,  v3,  0LL,  "NWSTCPSource %N<->%N@%I",  &self->_descriptor.local,  &self->_descriptor.remote,  self->_descriptor.ifindex);
  if (!__ret) {
    return 0LL;
  }
  [NSString stringWithCString:__ret encoding:4];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(__ret);
  return v4;
}

- (NWStatisticsTCPSource)initWithManager:(id)a3 local:(const sockaddr *)a4 remote:(const sockaddr *)a5
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NWStatisticsTCPSource;
  v9 = -[NWStatisticsSource initWithManager:source:provider:](&v24, sel_initWithManager_source_provider_, v8, 0LL, 2LL);
  if (!v9) {
    goto LABEL_5;
  }
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v37 = 0u;
  LODWORD(v38) = 2;
  if (a4->sa_len > 0x1CuLL) {
    goto LABEL_5;
  }
  __memcpy_chk();
  if (a5)
  {
    if (a5->sa_len > 0x1CuLL)
    {
LABEL_5:
      char v10 = 0LL;
      goto LABEL_22;
    }

    __memcpy_chk();
  }

  else
  {
    BYTE5(v40) = a4->sa_family;
    BYTE4(v40) = BYTE5(v40);
  }

  int v11 = [v8 addSource:v9 request:&v37 length:80];
  NStatGetLog();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (v11) {
      v13 = "Created";
    }
    else {
      v13 = "Failed to create";
    }
    int sa_len = a4->sa_len;
    if (a5) {
      int v15 = a5->sa_len;
    }
    else {
      int v15 = 0;
    }
    *(_DWORD *)buf = 134219266;
    id v26 = v8;
    __int16 v27 = 2080;
    v28 = v13;
    __int16 v29 = 1040;
    int v30 = sa_len;
    __int16 v31 = 2096;
    v32 = a4;
    __int16 v33 = 1040;
    int v34 = v15;
    __int16 v35 = 2096;
    v36 = a5;
    _os_log_impl( &dword_187FF5000,  v12,  OS_LOG_TYPE_INFO,  "Manager %p: %s TCP source for local address %{network:sockaddr}.*P, remote address %{network:sockaddr}.*P",  buf,  0x36u);
  }

  if (([v8 mgrflags] & 0x80) != 0) {
    NStatMgrTraceF( v8,  "%s Manager %p: %s TCP source for local address %N, remote address %N",  v16,  v17,  v18,  v19,  v20,  v21,  (char)"-[NWStatisticsTCPSource initWithManager:local:remote:]");
  }
  if (v11) {
    v22 = v9;
  }
  else {
    v22 = 0LL;
  }
  char v10 = v22;
LABEL_22:

  return v10;
}

@end