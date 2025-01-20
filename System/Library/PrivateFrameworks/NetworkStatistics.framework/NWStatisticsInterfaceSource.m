@interface NWStatisticsInterfaceSource
- (NWStatisticsInterfaceSource)initWithManager:(id)a3 interface:(int64_t)a4 threshold:(int64_t)a5;
- (id)_currentSnapshot;
- (id)description;
- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5;
@end

@implementation NWStatisticsInterfaceSource

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  if (a4 < 0xF8) {
    return 1;
  }
  p_descriptor = &self->_descriptor;
  if (!memcmp(&self->_descriptor, a3, 0xF8uLL))
  {
    v21 = -[NWStatisticsSource manager](self, "manager");
    char v22 = [v21 mgrflags];

    if ((v22 & 4) != 0) {
      return 1;
    }
    else {
      return 2;
    }
  }

  else
  {
    __int128 v9 = *(_OWORD *)a3;
    __int128 v10 = *((_OWORD *)a3 + 1);
    __int128 v11 = *((_OWORD *)a3 + 3);
    *(_OWORD *)&p_descriptor->link_status.u.wifi.ul_min_latency = *((_OWORD *)a3 + 2);
    *(_OWORD *)&p_descriptor->link_status.u.wifi.ul_bytes_lost = v11;
    *(_OWORD *)&p_descriptor->threshold = v9;
    *(_OWORD *)&p_descriptor->link_status.u.cellular.valid_bitmask = v10;
    __int128 v12 = *((_OWORD *)a3 + 4);
    __int128 v13 = *((_OWORD *)a3 + 5);
    __int128 v14 = *((_OWORD *)a3 + 7);
    *(_OWORD *)&p_descriptor->type = *((_OWORD *)a3 + 6);
    *(_OWORD *)&p_descriptor->description[12] = v14;
    *(_OWORD *)&p_descriptor->link_status.u.wifi.dl_min_latency = v12;
    *(_OWORD *)&p_descriptor->link_status.u.wifi.config_frequency = v13;
    __int128 v15 = *((_OWORD *)a3 + 8);
    __int128 v16 = *((_OWORD *)a3 + 9);
    __int128 v17 = *((_OWORD *)a3 + 11);
    *(_OWORD *)&p_descriptor->description[60] = *((_OWORD *)a3 + 10);
    *(_OWORD *)&p_descriptor->description[76] = v17;
    *(_OWORD *)&p_descriptor->description[28] = v15;
    *(_OWORD *)&p_descriptor->description[44] = v16;
    __int128 v18 = *((_OWORD *)a3 + 12);
    __int128 v19 = *((_OWORD *)a3 + 13);
    __int128 v20 = *((_OWORD *)a3 + 14);
    *(void *)&p_descriptor->name[12] = *((void *)a3 + 30);
    *(_OWORD *)&p_descriptor->description[108] = v19;
    *(_OWORD *)&p_descriptor->description[124] = v20;
    *(_OWORD *)&p_descriptor->description[92] = v18;
    return 3;
  }

- (id)_currentSnapshot
{
  return  -[NWSInterfaceSnapshot initWithCounts:interfaceDescriptor:sourceIdent:seqno:]( objc_alloc(&OBJC_CLASS___NWSInterfaceSnapshot),  "initWithCounts:interfaceDescriptor:sourceIdent:seqno:",  -[NWStatisticsSource _nstat_counts](self, "_nstat_counts"),  &self->_descriptor,  -[NWStatisticsSource reference](self, "reference"),  -[NWStatisticsSource snapshotRevision](self, "snapshotRevision"));
}

- (id)description
{
  __ret = 0LL;
  v3 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v3, 0LL, "NWSInterfaceSource %I", self->_descriptor.ifindex);
  if (!__ret) {
    return 0LL;
  }
  [NSString stringWithCString:__ret encoding:4];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(__ret);
  return v4;
}

- (NWStatisticsInterfaceSource)initWithManager:(id)a3 interface:(int64_t)a4 threshold:(int64_t)a5
{
  unsigned int v6 = a4;
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NWStatisticsInterfaceSource;
  __int128 v9 = -[NWStatisticsSource initWithManager:source:provider:](&v22, sel_initWithManager_source_provider_, v8, 0LL, 6LL);
  if (v9)
  {
    __int128 v31 = 0u;
    uint64_t v32 = 6LL;
    int64_t v33 = a5;
    uint64_t v34 = v6;
    int v10 = [v8 addSource:v9 request:&v31 length:40];
    NStatGetLog();
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (v10) {
        __int128 v12 = "Created";
      }
      else {
        __int128 v12 = "Failed to create";
      }
      *(_DWORD *)buf = 134218754;
      id v24 = v8;
      __int16 v25 = 2080;
      v26 = v12;
      __int16 v27 = 1024;
      unsigned int v28 = v6;
      __int16 v29 = 1024;
      int v30 = a5;
      _os_log_impl( &dword_187FF5000,  v11,  OS_LOG_TYPE_INFO,  "Manager %p: %s source for interface index %d with threshold %d",  buf,  0x22u);
    }

    if (([v8 mgrflags] & 0x80) != 0) {
      NStatMgrTraceF( v8,  "%s Manager %p: %s source for interface %I index %d with threshold %d",  v13,  v14,  v15,  v16,  v17,  v18,  (char)"-[NWStatisticsInterfaceSource initWithManager:interface:threshold:]");
    }
    if (v10) {
      __int128 v19 = v9;
    }
    else {
      __int128 v19 = 0LL;
    }
    __int128 v20 = v19;
  }

  else
  {
    __int128 v20 = 0LL;
  }

  return v20;
}

@end