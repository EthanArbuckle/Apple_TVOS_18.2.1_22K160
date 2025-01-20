@interface NEFilterPacketInterpose
- (BOOL)matchFlow:(const unsigned __int8 *)a3 flowId:;
- (id)description;
- (void)close;
- (void)close:(os_unfair_lock_s *)a1;
- (void)close_nolock:(uint64_t)a1;
- (void)dealloc;
- (void)deallocateFrame:(uint64_t)a1;
- (void)freePacket:(os_unfair_lock_s *)a1;
@end

@implementation NEFilterPacketInterpose

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_debug_impl(&dword_1876B1000, v3, OS_LOG_TYPE_DEBUG, "%@: dealloc", buf, 0xCu);
  }

  -[NEFilterPacketInterpose close:]((os_unfair_lock_s *)self, 0);
  context = self->_context;
  self->_context = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEFilterPacketInterpose;
  -[NEFilterPacketInterpose dealloc](&v5, sel_dealloc);
}

- (id)description
{
  if (self->_channel)
  {
    v3 = (void *)NSString;
    name = nw_interface_get_name(self->_interface);
    [v3 stringWithFormat:@"NEFilterPacketInterpose: %s - [%@:%d - fd %d]", name, objc_getProperty(self, v5, 176, 1), self->_nexusPort, self->_channel_fd];
  }

  else
  {
    interface = self->_interface;
    if (!interface)
    {
      v7 = @"NEFilterPacketInterpose";
      return v7;
    }

    objc_msgSend( NSString,  "stringWithFormat:",  @"NEFilterPacketInterpose: %s",  nw_interface_get_name(interface),  v9,  v10,  v11);
  }

  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void).cxx_destruct
{
}

- (void)close:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    v4 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    -[NEFilterPacketInterpose close_nolock:]((uint64_t)a1, a2);
    os_unfair_lock_unlock(v4);
  }

- (void)close_nolock:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    uint64_t v11 = a1;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_debug_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEBUG, "%@: close: StopInputOnly %d", (uint8_t *)&v10, 0x12u);
  }

  if ((*(_BYTE *)(a1 + 152) & 1) != 0)
  {
    *(_BYTE *)(a1 + 153) = 1;
  }

  else
  {
    *(_BYTE *)(a1 + 153) = 0;
    if (*(void *)(a1 + 192))
    {
      ne_log_obj();
      SEL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 138412290;
        uint64_t v11 = a1;
        _os_log_debug_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEBUG,  "%@: close channel: cancel input",  (uint8_t *)&v10,  0xCu);
      }

      nw_queue_cancel_source();
      *(void *)(a1 + 192) = 0LL;
      *(_BYTE *)(a1 + 152) = 0;
    }

    if ((a2 & 1) == 0 && *(void *)(a1 + 16))
    {
      ne_log_obj();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 138412290;
        uint64_t v11 = a1;
        _os_log_debug_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEBUG,  "%@: close channel: cancel channel",  (uint8_t *)&v10,  0xCu);
      }

      os_channel_destroy();
      *(void *)(a1 + 16) = 0LL;
      *(_DWORD *)(a1 + 32) = -1;
      objc_setProperty_atomic((id)a1, v7, 0LL, 176LL);
      *(void *)(a1 + 184) = 0LL;
      *(_DWORD *)(a1 + 156) = 0;
      *(_DWORD *)(a1 + 160) = 0;
      *(_OWORD *)(a1 + 96) = 0u;
      *(_OWORD *)(a1 + 112) = 0u;
      if (*(void *)(a1 + 24))
      {
        os_channel_attr_destroy();
        *(void *)(a1 + 24) = 0LL;
      }

      *(void *)(a1 + 88) = 0LL;
      uint64_t v8 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = 0LL;

      uint64_t v9 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = 0LL;
    }
  }

- (void)close
{
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    -[NEFilterPacketInterpose close_nolock:]((uint64_t)a1, 1);
    os_unfair_lock_unlock(v2);
  }

- (BOOL)matchFlow:(const unsigned __int8 *)a3 flowId:
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  *(void *)uu1 = 0LL;
  uint64_t v11 = 0LL;
  *(void *)uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  objc_msgSend(objc_getProperty(a1, a2, 176, 1), "getUUIDBytes:", uu1);
  objc_msgSend(objc_getProperty(a1, v6, 168, 1), "getUUIDBytes:", v8);
  return !uuid_compare(uu1, (const unsigned __int8 *)a2) && uuid_compare(v8, a3) == 0;
}

void __40__NEFilterPacketInterpose_createChannel__block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v52 = *(char **)(a1 + 32);
    *(_DWORD *)v66 = 138412290;
    v67 = v52;
    _os_log_debug_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEBUG, "%@: INPUT SOURCE: READ EVENT", v66, 0xCu);
  }

  v3 = *(_BYTE **)(a1 + 32);
  if (!v3)
  {
LABEL_6:
    nw_queue_suspend_source();
    v4 = (char *)*(id *)(a1 + 32);
    if (!v4) {
      goto LABEL_100;
    }
    goto LABEL_9;
  }

  if ((v3[152] & 1) == 0)
  {
    v3[152] = 1;
    goto LABEL_6;
  }

  v4 = v3;
LABEL_9:
  uint64_t v53 = a1;
  SEL v5 = (os_unfair_lock_s *)(v4 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)v4 + 2);
  int v6 = 0;
  int v7 = 0;
  char v8 = 1;
  lock = (os_unfair_lock_s *)(v4 + 8);
  do
  {
    char v9 = v8;
    if ((v8 & 1) != 0) {
      uint64_t v10 = 96LL;
    }
    else {
      uint64_t v10 = 112LL;
    }
    if (*(void *)&v4[v10])
    {
      char v61 = v8;
      int v11 = os_channel_available_slot_count();
      if (v11)
      {
        int v12 = v11;
        int v57 = v7;
        ne_log_obj();
        int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v66 = 138412802;
          v48 = "INGRESS";
          if ((v61 & 1) == 0) {
            v48 = "EGRESS";
          }
          v67 = v4;
          __int16 v68 = 2080;
          v60 = v48;
          *(void *)v69 = v48;
          *(_WORD *)&v69[8] = 1024;
          LODWORD(v70) = v12;
          char v9 = v61;
          _os_log_debug_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_DEBUG,  "%@: receiveFramesfromRings: %s: avail slots %d",  v66,  0x1Cu);
        }

        else
        {
          char v9 = v61;
          uint64_t v14 = "EGRESS";
          if ((v61 & 1) != 0) {
            uint64_t v14 = "INGRESS";
          }
          v60 = v14;
        }

        if ((v9 & 1) != 0) {
          uint64_t v15 = 1LL;
        }
        else {
          uint64_t v15 = 2LL;
        }
        uint64_t v16 = 120LL;
        if ((v9 & 1) != 0) {
          uint64_t v16 = 104LL;
        }
        uint64_t v55 = v16;
        uint64_t v56 = v15;
        while (1)
        {
          v17 = v4;
          if (!*(void *)&v4[v10])
          {
            ne_log_obj();
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v66 = 138412802;
              v67 = v4;
              __int16 v68 = 2080;
              *(void *)v69 = v60;
              *(_WORD *)&v69[8] = 2112;
              v70 = @"Bad rx ring";
              v24 = v66;
              v25 = v23;
              goto LABEL_42;
            }

            goto LABEL_43;
          }

          uint64_t next_slot = os_channel_get_next_slot();
          if (!next_slot)
          {
            ne_log_obj();
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v63 = v4;
              __int16 v64 = 2080;
              *(void *)v65 = v60;
              *(_WORD *)&v65[8] = 2112;
              *(void *)&v65[10] = @"NULL next slot";
              v24 = buf;
              v25 = v23;
              goto LABEL_42;
            }

            goto LABEL_43;
          }

          if (!*(void *)&v69[2])
          {
            ne_log_obj();
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v63 = v4;
              __int16 v64 = 2080;
              *(void *)v65 = v60;
              *(_WORD *)&v65[8] = 2112;
              *(void *)&v65[10] = @"NULL prop buf";
              v24 = buf;
              v25 = v23;
              goto LABEL_42;
            }

- (void)freePacket:(os_unfair_lock_s *)a1
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      uint64_t v5 = v3[5];
      if (v5)
      {
        os_unfair_lock_lock(a1 + 2);
        ne_log_obj();
        int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          int v7 = *(_DWORD *)(v5 + 16);
          int v8 = 138412546;
          char v9 = a1;
          __int16 v10 = 1024;
          int v11 = v7;
          _os_log_debug_impl(&dword_1876B1000, v6, OS_LOG_TYPE_DEBUG, "%@: freePacket: %d bytes", (uint8_t *)&v8, 0x12u);
        }

        -[NEFilterPacketInterpose deallocateFrame:]((uint64_t)a1, (void *)v5);
        v4[5] = 0LL;
        os_unfair_lock_unlock(a1 + 2);
      }
    }
  }
}

- (void)deallocateFrame:(uint64_t)a1
{
  if (*(void *)(a1 + 16) && ptr[3]) {
    os_channel_packet_free();
  }
  ptr[1] = 0LL;
  ptr[3] = 0LL;
  ptr[4] = 0LL;
  CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x189604DB0], ptr);
}

@end