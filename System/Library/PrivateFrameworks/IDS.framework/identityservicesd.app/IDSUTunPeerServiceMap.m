@interface IDSUTunPeerServiceMap
- (BOOL)associateServiceName:(id)a3 withStreamID:(unsigned __int16)a4 remoteInstanceID:(unsigned __int8 *)(a5 remoteInstanceIDChanged:;
- (BOOL)setRemoteInstanceID:(unsigned __int8 *)(a3;
- (BOOL)translateServiceName:(id)a3 toStreamID:(unsigned __int16 *)a4 createIfNotFound:(BOOL)a5 mappingCreated:(BOOL *)a6 remoteInstanceID:(unsigned __int8 *)(a7 remoteInstanceIDChanged:;
- (BOOL)translateStreamID:(unsigned __int16)a3 toServiceName:(id *)a4 remoteInstanceID:(unsigned __int8 *)(a5 remoteInstanceIDChanged:;
- (IDSUTunPeerServiceMap)initWithName:(id)a3;
- (id)description;
- (unint64_t)count;
- (void)_dumpServiceMap;
- (void)_simulateCrashWithErrorString:(id)a3;
- (void)dumpServiceMap;
@end

@implementation IDSUTunPeerServiceMap

- (IDSUTunPeerServiceMap)initWithName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSUTunPeerServiceMap;
  v5 = -[IDSUTunPeerServiceMap init](&v13, "init");
  if (v5)
  {
    v6 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  1282LL,  20LL);
    serviceNameToStreamIDMap = v5->_serviceNameToStreamIDMap;
    v5->_serviceNameToStreamIDMap = v6;

    v8 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  1282LL,  0LL,  20LL);
    streamIDToServiceNameMap = v5->_streamIDToServiceNameMap;
    v5->_streamIDToServiceNameMap = v8;

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_nextStreamID = 1;
    v10 = (NSString *)[v4 copy];
    name = v5->_name;
    v5->_name = v10;
  }

  return v5;
}

- (id)description
{
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v3;
  *(_OWORD *)&out[16] = v3;
  uuid_unparse_upper(self->_remoteInstanceID, out);
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%p> name %@ instanceID [%s] nextStreamID %u\n_serviceNameToStreamIDMap %@\n_streamIDToServiceNameMap %@\n",  self,  self->_name,  out,  self->_nextStreamID,  self->_serviceNameToStreamIDMap,  self->_streamIDToServiceNameMap));
}

- (BOOL)setRemoteInstanceID:(unsigned __int8 *)(a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v7 = uuid_compare((const unsigned __int8 *)a3, self->_remoteInstanceID);
  if (v7)
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v8;
    *(_OWORD *)&out[16] = v8;
    *(void *)&v29[29] = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t v29 = v8;
    *(_OWORD *)&v29[16] = v8;
    uuid_unparse_upper(self->_remoteInstanceID, out);
    uuid_unparse_upper((const unsigned __int8 *)a3, v29);
    uint64_t v9 = OSLogHandleForTransportCategory("UTunPeerServiceMap");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = out;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Remote instance ID reset: old [%s] new [%s]",  buf,  0x16u);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12)
    {
      if (_IDSShouldLogTransport(v12))
      {
        _IDSLogTransport( @"UTunPeerServiceMap",  @"IDS",  @"Remote instance ID reset: old [%s] new [%s]");
        if (_IDSShouldLog(0LL, @"UTunPeerServiceMap")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeerServiceMap",  @"Remote instance ID reset: old [%s] new [%s]");
        }
      }
    }

    uint64_t v13 = 0LL;
    previousRemoteInstanceIDs = self->_previousRemoteInstanceIDs;
    while (1)
    {
      int v15 = uuid_compare((const unsigned __int8 *)a3, previousRemoteInstanceIDs[v13]);
      BOOL v3 = v15 != 0;
      if (!v15) {
        break;
      }
      if (++v13 == 8)
      {
        uuid_copy(self->_remoteInstanceID, (const unsigned __int8 *)a3);
        -[NSMapTable removeAllObjects](self->_serviceNameToStreamIDMap, "removeAllObjects");
        -[NSMapTable removeAllObjects](self->_streamIDToServiceNameMap, "removeAllObjects");
        self->_nextStreamID = 1;
        uuid_copy(previousRemoteInstanceIDs[self->_nextRemoteInstanceIDIndex], (const unsigned __int8 *)a3);
        int v16 = self->_nextRemoteInstanceIDIndex + 1;
        BOOL v17 = -v16 < 0;
        int v18 = -v16 & 7;
        int v19 = v16 & 7;
        if (!v17) {
          int v19 = -v18;
        }
        self->_nextRemoteInstanceIDIndex = v19;
        goto LABEL_21;
      }
    }

    *(void *)&buf[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v20;
    *(_OWORD *)&buf[16] = v20;
    uuid_unparse_upper((const unsigned __int8 *)a3, buf);
    uint64_t v21 = OSLogHandleForTransportCategory("UTunPeerServiceMap");
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136315138;
      v27 = buf;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Asked to set remote instanceID for previous ID [%s]",  v26,  0xCu);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24)
    {
      if (_IDSShouldLogTransport(v24))
      {
        _IDSLogTransport( @"UTunPeerServiceMap",  @"IDS",  @"Asked to set remote instanceID for previous ID [%s]");
        if (_IDSShouldLog(0LL, @"UTunPeerServiceMap")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeerServiceMap",  @"Asked to set remote instanceID for previous ID [%s]");
        }
      }
    }
  }

- (BOOL)associateServiceName:(id)a3 withStreamID:(unsigned __int16)a4 remoteInstanceID:(unsigned __int8 *)(a5 remoteInstanceIDChanged:
{
  unsigned int v8 = a4;
  id v10 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (uuid_compare((const unsigned __int8 *)a5, self->_remoteInstanceID))
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v12;
    *(_OWORD *)&out[16] = v12;
    *(void *)((char *)&value[1] + 13) = 0xAAAAAAAAAAAAAAAALL;
    value[0] = v12;
    value[1] = v12;
    uuid_unparse_upper(self->_remoteInstanceID, out);
    uuid_unparse_upper((const unsigned __int8 *)a5, (char *)value);
    uint64_t v13 = OSLogHandleForTransportCategory("UTunPeerServiceMap");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v43 = out;
      __int16 v44 = 2080;
      v45 = value;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Remote instance ID do not match: old [%s] new [%s]",  buf,  0x16u);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        _IDSLogTransport( @"UTunPeerServiceMap",  @"IDS",  @"Remote instance ID do not match: old [%s] new [%s]");
        if (_IDSShouldLog(0LL, @"UTunPeerServiceMap")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeerServiceMap",  @"Remote instance ID do not match: old [%s] new [%s]");
        }
      }
    }

    BOOL v17 = 0;
    *a6 = 1;
    goto LABEL_48;
  }

  if (v8)
  {
    *(void *)&value[0] = 0xAAAAAAAAAAAAAAAALL;
    BOOL v18 = NSMapMember(self->_streamIDToServiceNameMap, (const void *)v8, 0LL, (void **)value);
    BOOL v19 = v18;
    uint64_t v20 = *(void *)&value[0];
    if (v18) {
      uint64_t v21 = *(void **)&value[0];
    }
    else {
      uint64_t v21 = 0LL;
    }
    id v22 = v21;
    BOOL v23 = NSMapMember(self->_serviceNameToStreamIDMap, v10, 0LL, (void **)value);
    BOOL v24 = v23;
    if (v23) {
      unsigned __int16 v25 = value[0];
    }
    else {
      unsigned __int16 v25 = 0;
    }
    if (v19)
    {
      unsigned int v26 = [v10 isEqualToString:v20];
      BOOL v27 = v8 != v25 && v24;
      if (v27 || !v26)
      {
        v28 = @"YES";
        uuid_string_t v29 = @"NO";
        if (v26) {
          v28 = @"NO";
        }
        if (!v27) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
    }

    else if (v8 != v25 && v23)
    {
      v28 = @"NO";
LABEL_38:
      uuid_string_t v29 = @"YES";
LABEL_39:
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"serviceMap[%@ <=> %lu] serviceNameMismatch %@ streamIDMismatch %@ [%@ <=> %lu]",  v10,  v8,  v28,  v29,  v22,  v25));
      uint64_t v36 = OSLogHandleForTransportCategory("UTunPeerServiceMap");
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uuid_string_t out = 138412290;
        *(void *)&out[4] = v35;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)out, 0xCu);
      }

      uint64_t v39 = os_log_shim_legacy_logging_enabled(v38);
      if ((_DWORD)v39)
      {
        if (_IDSShouldLogTransport(v39))
        {
          v41 = v35;
          _IDSLogTransport(@"UTunPeerServiceMap", @"IDS", @"%@");
          if (_IDSShouldLog(0LL, @"UTunPeerServiceMap"))
          {
            v41 = v35;
            _IDSLogV(0LL, @"IDSFoundation", @"UTunPeerServiceMap", @"%@");
          }
        }
      }

      -[IDSUTunPeerServiceMap _simulateCrashWithErrorString:](self, "_simulateCrashWithErrorString:", v35, v41);

      BOOL v17 = 0;
      goto LABEL_47;
    }

    -[NSMapTable setObject:forKey:](self->_serviceNameToStreamIDMap, "setObject:forKey:", v8, v10);
    -[NSMapTable setObject:forKey:](self->_streamIDToServiceNameMap, "setObject:forKey:", v10, v8);
    BOOL v17 = 1;
LABEL_47:

    goto LABEL_48;
  }

  uint64_t v30 = OSLogHandleForTransportCategory("UTunPeerServiceMap");
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uuid_string_t out = 138412290;
    *(void *)&out[4] = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "cannot associate %@ with streamID 0",  (uint8_t *)out,  0xCu);
  }

  uint64_t v33 = os_log_shim_legacy_logging_enabled(v32);
  if ((_DWORD)v33
    && _IDSShouldLogTransport(v33)
    && (_IDSLogTransport(@"UTunPeerServiceMap", @"IDS", @"cannot associate %@ with streamID 0"),
        _IDSShouldLog(0LL, @"UTunPeerServiceMap")))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"UTunPeerServiceMap", @"cannot associate %@ with streamID 0");
    BOOL v17 = 0;
  }

  else
  {
    BOOL v17 = 0;
  }

- (BOOL)translateStreamID:(unsigned __int16)a3 toServiceName:(id *)a4 remoteInstanceID:(unsigned __int8 *)(a5 remoteInstanceIDChanged:
{
  unsigned int v9 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (uuid_compare((const unsigned __int8 *)a5, self->_remoteInstanceID))
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v12;
    *(_OWORD *)&out[16] = v12;
    *(void *)&v23[29] = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t v23 = v12;
    *(_OWORD *)&v23[16] = v12;
    uuid_unparse_upper(self->_remoteInstanceID, out);
    uuid_unparse_upper((const unsigned __int8 *)a5, v23);
    uint64_t v13 = OSLogHandleForTransportCategory("UTunPeerServiceMap");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = out;
      __int16 v21 = 2080;
      id v22 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Remote instance ID do not match: old [%s] new [%s]",  buf,  0x16u);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        _IDSLogTransport( @"UTunPeerServiceMap",  @"IDS",  @"Remote instance ID do not match: old [%s] new [%s]");
        if (_IDSShouldLog(0LL, @"UTunPeerServiceMap")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeerServiceMap",  @"Remote instance ID do not match: old [%s] new [%s]");
        }
      }
    }

    BOOL v17 = 0;
    *a6 = 1;
  }

  else
  {
    *(void *)uuid_string_t out = 0xAAAAAAAAAAAAAAAALL;
    BOOL v17 = NSMapMember(self->_streamIDToServiceNameMap, (const void *)v9, 0LL, (void **)out);
    if (v17) {
      *a4 = *(id *)out;
    }
  }

  os_unfair_lock_unlock(p_lock);
  return v17;
}

- (BOOL)translateServiceName:(id)a3 toStreamID:(unsigned __int16 *)a4 createIfNotFound:(BOOL)a5 mappingCreated:(BOOL *)a6 remoteInstanceID:(unsigned __int8 *)(a7 remoteInstanceIDChanged:
{
  BOOL v11 = a5;
  id v14 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!uuid_compare((const unsigned __int8 *)a7, self->_remoteInstanceID))
  {
    *(void *)&value[0] = 0xAAAAAAAAAAAAAAAALL;
    if (NSMapMember(self->_serviceNameToStreamIDMap, v14, 0LL, (void **)value))
    {
      if (*(void *)&value[0] >= 0x10000uLL)
      {
        uint64_t v22 = OSLogHandleForTransportCategory("UTunPeerServiceMap");
        uuid_string_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uuid_string_t out = 134218242;
          *(void *)&out[4] = *(void *)&value[0];
          *(_WORD *)&out[12] = 2112;
          *(void *)&out[14] = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Unexpected streamID %lu found when asked to translate %@",  (uint8_t *)out,  0x16u);
        }

        uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
        if ((_DWORD)v25)
        {
          if (_IDSShouldLogTransport(v25))
          {
            _IDSLogTransport( @"UTunPeerServiceMap",  @"IDS",  @"Unexpected streamID %lu found when asked to translate %@");
            if (_IDSShouldLog(0LL, @"UTunPeerServiceMap"))
            {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeerServiceMap",  @"Unexpected streamID %lu found when asked to translate %@");
              BOOL v21 = 0;
              goto LABEL_28;
            }
          }
        }

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = -[NSMapTable count](self->_serviceNameToStreamIDMap, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_dumpServiceMap
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  for (uint64_t i = 58LL; i != 186; i += 16LL)
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v5;
    *(_OWORD *)&out[16] = v5;
    uuid_unparse_upper((const unsigned __int8 *)self + i, out);
    objc_msgSend(v3, "appendFormat:", @"%s\n", out);
  }

  uint64_t v6 = OSLogHandleForTransportCategory("IDSDelivery-oversized");
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int nextRemoteInstanceIDIndex = self->_nextRemoteInstanceIDIndex;
    *(_DWORD *)uuid_string_t out = 138412802;
    *(void *)&out[4] = self;
    *(_WORD *)&out[12] = 1024;
    *(_DWORD *)&out[14] = nextRemoteInstanceIDIndex;
    *(_WORD *)&out[18] = 2112;
    *(void *)&out[20] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@\nPrevious Remote Instance IDs (next:%d) {%@}",  (uint8_t *)out,  0x1Cu);
  }

  uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
  if ((_DWORD)v10)
  {
    if (_IDSShouldLogTransport(v10))
    {
      _IDSLogTransport( @"IDSDelivery-oversized",  @"IDS",  @"%@\nPrevious Remote Instance IDs (next:%d) {%@}");
      if (_IDSShouldLog(0LL, @"IDSDelivery-oversized")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery-oversized",  @"%@\nPrevious Remote Instance IDs (next:%d) {%@}");
      }
    }
  }
}

- (void)dumpServiceMap
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IDSUTunPeerServiceMap _dumpServiceMap](self, "_dumpServiceMap");
  os_unfair_lock_unlock(p_lock);
}

- (void)_simulateCrashWithErrorString:(id)a3
{
  id v5 = a3;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 processName]);
  IMLogSimulateCrashForProcess(v4, v5, 0LL);
}

- (void).cxx_destruct
{
}

@end