@interface DTXMachTransport
+ (id)_legacyFileDescriptorHandshakeWithReceivePort:(unsigned int)a3;
+ (id)_legacyFileDescriptorHandshakeWithSendPort:(unsigned int)a3;
+ (id)fileDescriptorHandshakeWithReceivePort:(unsigned int)a3;
+ (id)fileDescriptorHandshakeWithSendPort:(unsigned int)a3;
+ (id)schemes;
- (BOOL)_setupWithSendPort:(unsigned int)a3 receivePort:(unsigned int)a4 disconnectBlock:(id)a5;
- (DTXMachTransport)init;
- (DTXMachTransport)initWithReceiveRight:(unsigned int)a3 sendRight:(unsigned int)a4 disconnectBlock:(id)a5;
- (DTXMachTransport)initWithRemoteAddress:(id)a3;
- (DTXMachTransport)initWithXPCRepresentation:(id)a3;
- (id)localAddresses;
- (id)serializedXPCRepresentation;
- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4;
- (void)dealloc;
- (void)disconnect;
@end

@implementation DTXMachTransport

+ (id)schemes
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x189604010], a2, (uint64_t)@"mach", 0);
}

- (BOOL)_setupWithSendPort:(unsigned int)a3 receivePort:(unsigned int)a4 disconnectBlock:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  BOOL v8 = a3 - 1 >= 0xFFFFFFFE || a4 - 1 >= 0xFFFFFFFE;
  BOOL v9 = !v8;
  if (v8)
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(@"-[%@ %@]: Invalid ports provided: %d, %d", v24, v25, v6, v5);
  }

  else
  {
    self->_sendPort = a3;
    self->_receivePort = a4;
    v10 = (void *)MEMORY[0x1895D398C](a5, a2);
    id disconnectBlock = self->_disconnectBlock;
    self->_id disconnectBlock = v10;

    v12 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B40],  self->_receivePort,  0LL,  (dispatch_queue_t)self->_inputQueue);
    listenSource = self->_listenSource;
    self->_listenSource = v12;

    uint64_t v14 = MEMORY[0x1895F87A8];
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = sub_188BC273C;
    v28[3] = &unk_18A2ED618;
    v28[4] = self;
    v15 = (void *)MEMORY[0x1895D398C](v28);
    v16 = (void *)MEMORY[0x1895D398C]();
    id inputReaderBlock = self->_inputReaderBlock;
    self->_id inputReaderBlock = v16;

    dispatch_source_set_event_handler((dispatch_source_t)self->_listenSource, self->_inputReaderBlock);
    dispatch_resume((dispatch_object_t)self->_listenSource);
    v18 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B48],  self->_sendPort,  1uLL,  (dispatch_queue_t)self->_inputQueue);
    deadPortSource = self->_deadPortSource;
    self->_deadPortSource = v18;

    v20 = self->_deadPortSource;
    handler[0] = v14;
    handler[1] = 3221225472LL;
    handler[2] = sub_188BC2858;
    handler[3] = &unk_18A2ED618;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v20, handler);
    dispatch_resume((dispatch_object_t)self->_deadPortSource);
    objc_msgSend_setStatus_(self, v21, 1);
  }

  return v9;
}

- (DTXMachTransport)init
{
  return self;
}

- (DTXMachTransport)initWithReceiveRight:(unsigned int)a3 sendRight:(unsigned int)a4 disconnectBlock:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  BOOL v8 = (void (**)(void))a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DTXMachTransport;
  BOOL v9 = -[DTXTransport init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    sub_188BC2988(v9);
    if ((objc_msgSend__setupWithSendPort_receivePort_disconnectBlock_(v10, v11, v5, v6, v8) & 1) == 0)
    {
      if (v8) {
        v8[2](v8);
      }

      v10 = 0LL;
    }
  }

  return v10;
}

- (DTXMachTransport)initWithRemoteAddress:(id)a3
{
  uint64_t v87 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v83.receiver = self;
  v83.super_class = (Class)&OBJC_CLASS___DTXMachTransport;
  uint64_t v6 = -[DTXTransport initWithRemoteAddress:](&v83, sel_initWithRemoteAddress_, v5);
  v7 = v6;
  if (v6)
  {
    sub_188BC2988(v6);
    objc_msgSend_host(v5, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_intValue(v10, v11, v12);

    p_sendPort = &v7->_sendPort;
    v7->_sendPort = 0;
    p_receivePort = &v7->_receivePort;
    v7->_receivePort = 0;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    objc_msgSend_pathComponents(v5, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v79, v86, 16);
    if (v20)
    {
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)v80;
      do
      {
        for (uint64_t i = 0LL; i != v23; ++i)
        {
          if (*(void *)v80 != v24) {
            objc_enumerationMutation(v18);
          }
          unsigned int v26 = objc_msgSend_intValue(*(void **)(*((void *)&v79 + 1) + 8 * i), v21, v22);
          if (v26 - 1 <= 0xFFFFFFFD)
          {
            v27 = &v7->_sendPort;
            if (*p_sendPort + 1 < 2 || (v27 = &v7->_receivePort, *p_receivePort + 1 <= 1)) {
              unsigned int *v27 = v26;
            }
          }
        }

        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v79, v86, 16);
      }

      while (v23);
    }

    if (*p_sendPort + 1 < 2 || *p_receivePort + 1 <= 1)
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(@"-[%@ %@]: Invalid ports in address: %@", v29, v30, v5);

LABEL_16:
LABEL_17:
      v7 = 0LL;
      goto LABEL_18;
    }

    pid_t v32 = getpid();
    pid_t v33 = v32;
    uint64_t v34 = *MEMORY[0x1895FBBE0];
    mach_port_name_t task = *MEMORY[0x1895FBBE0];
    if ((_DWORD)v13 == v32)
    {
      pid_t v74 = v32;
      uint64_t v75 = v13;
      uint64_t v35 = v34;
    }

    else
    {
      if (task_for_pid(v34, v13, &task))
      {
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog( @"-[%@ %@]: Unable to connect to URL specifying ports in remote process' (%d) namespace: %@",  v37,  v38,  v13,  v5);

        goto LABEL_16;
      }

      pid_t v74 = v33;
      uint64_t v75 = v13;
      uint64_t v35 = task;
      LODWORD(v34) = *MEMORY[0x1895FBBE0];
    }

    uint64_t v39 = *p_receivePort;
    unsigned int *p_receivePort = 0;
    *(void *)poly = 0LL;
    mach_port_name_t name = 0;
    is_self = mach_task_is_self(v35);
    if (is_self)
    {
      BOOLean_t v72 = is_self;
      poly[1] = v39;
      mach_msg_type_name_t v41 = 16;
    }

    else
    {
      uint64_t v45 = MEMORY[0x1895D36D4](v35, v39, 16LL, &poly[1], poly);
      if ((_DWORD)v45) {
        goto LABEL_45;
      }
      BOOLean_t v72 = 0;
      mach_msg_type_name_t v41 = poly[0];
    }

    if (mach_task_is_self(v34))
    {
      mach_port_t v42 = poly[1];
      mach_port_name_t name = poly[1];
      if (v41 - 19 > 0xFFFFFFFC)
      {
LABEL_36:
        unsigned int *p_receivePort = v42;
        if (v42 - 1 <= 0xFFFFFFFD) {
          goto LABEL_46;
        }
        uint64_t v45 = 5LL;
LABEL_45:
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = mach_error_string(v45);
        NSLog(@"-[%@ %@]: Unable to extract receive right from process %d: %s (%d)", v50, v51, v75, v52, v45);

LABEL_46:
        uint64_t v53 = task;
        ipc_space_t v54 = *MEMORY[0x1895FBBE0];
        uint64_t v55 = *p_sendPort;
        unsigned int *p_sendPort = 0;
        *(void *)poly = 0LL;
        BOOLean_t v56 = mach_task_is_self(v53);
        if (v56)
        {
          BOOLean_t v73 = v56;
          poly[1] = v55;
          mach_msg_type_name_t v57 = 17;
        }

        else
        {
          uint64_t v61 = MEMORY[0x1895D36D4](v53, v55, 17LL, &poly[1], poly);
          if ((_DWORD)v61) {
            goto LABEL_68;
          }
          BOOLean_t v73 = 0;
          mach_msg_type_name_t v57 = poly[0];
        }

        if (mach_task_is_self(v54))
        {
          mach_port_t v58 = poly[1];
          mach_port_name_t name = poly[1];
          if (v57 - 19 > 0xFFFFFFFC)
          {
LABEL_58:
            unsigned int *p_sendPort = v58;
            if (v58 - 1 <= 0xFFFFFFFD)
            {
              int v64 = v75;
LABEL_69:
              if (v64 != v74) {
                mach_port_deallocate(*MEMORY[0x1895FBBE0], task);
              }
              v76[0] = MEMORY[0x1895F87A8];
              v76[1] = 3221225472LL;
              v76[2] = sub_188BC30B0;
              v76[3] = &unk_18A2ED618;
              v7 = v7;
              v77 = v7;
              v70 = (void (**)(void))MEMORY[0x1895D398C](v76);
              if (objc_msgSend__setupWithSendPort_receivePort_disconnectBlock_( v7,  v71,  *p_sendPort,  *p_receivePort,  v70))
              {

                goto LABEL_18;
              }

              v70[2](v70);

              goto LABEL_17;
            }

            uint64_t v61 = 5LL;
LABEL_68:
            v66 = (objc_class *)objc_opt_class();
            NSStringFromClass(v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = mach_error_string(v61);
            int v64 = v75;
            NSLog( @"-[%@ %@]: Unable to extract send right from process %d: %s (%d)",  v67,  v68,  v75,  v69,  v61);

            goto LABEL_69;
          }

          ipc_space_t v59 = v54;
          mach_port_t v60 = poly[1];
        }

        else
        {
          if ((_DWORD)v53 != v54)
          {
            while (1)
            {
              mach_port_name_t name = 0;
              uint64_t v65 = mach_port_allocate(v54, 4u, &name);
              if ((_DWORD)v65) {
                break;
              }
              uint64_t v65 = mach_port_deallocate(v54, name);
              if ((_DWORD)v65) {
                break;
              }
              uint64_t inserted = mach_port_insert_right(v54, name, poly[1], v57);
              if ((inserted & 0xFFFFFFF7) != 5) {
                goto LABEL_56;
              }
            }

            uint64_t v61 = v65;
            BOOLean_t v63 = v73;
            goto LABEL_66;
          }

          mach_port_name_t name = v55;
          mach_port_t v60 = poly[1];
          ipc_space_t v59 = v53;
          mach_port_t v58 = v55;
        }

        uint64_t inserted = mach_port_insert_right(v59, v58, v60, v57);
LABEL_56:
        uint64_t v61 = inserted;
        BOOLean_t v63 = v73;
        if (!(_DWORD)inserted)
        {
          mach_port_t v58 = name;
          goto LABEL_58;
        }

- (DTXMachTransport)initWithXPCRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DTXMachTransport;
  id v5 = -[DTXTransport initWithXPCRepresentation:](&v13, sel_initWithXPCRepresentation_, v4);
  uint64_t v6 = v5;
  if (v5)
  {
    sub_188BC2988(v5);
    v6->_sendPort = xpc_dictionary_copy_mach_send();
    v6->_receivePort = xpc_dictionary_extract_mach_recv();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = sub_188BC3268;
    v11[3] = &unk_18A2ED618;
    v7 = v6;
    uint64_t v12 = v7;
    BOOL v8 = (void (**)(void))MEMORY[0x1895D398C](v11);
    if ((objc_msgSend__setupWithSendPort_receivePort_disconnectBlock_(v7, v9, v6->_sendPort, v6->_receivePort, v8) & 1) == 0)
    {
      v8[2](v8);

      v7 = 0LL;
    }

    uint64_t v6 = v7;
  }

  return v6;
}

- (id)serializedXPCRepresentation
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_188BC33B0;
  v10 = sub_188BC33C0;
  id v11 = 0LL;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_188BC33C8;
  v5[3] = &unk_18A2ED578;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)outputQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)dealloc
{
  sendBuffer = self->_sendBuffer;
  if (sendBuffer)
  {
    free(sendBuffer);
    self->_sendBuffer = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DTXMachTransport;
  -[DTXTransport dealloc](&v4, sel_dealloc);
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  if (self->_sendPort + 1 >= 2)
  {
    unint64_t v6 = a4;
    v7 = (char *)a3;
    unint64_t v5 = 0LL;
    unsigned int bufferedLength = self->_bufferedLength;
    do
    {
      else {
        unsigned int v9 = v6;
      }
      memcpy(&self->_sendBuffer->var1[bufferedLength], v7, v9);
      unsigned int bufferedLength = self->_bufferedLength + v9;
      self->_unsigned int bufferedLength = bufferedLength;
      if (!v6 || bufferedLength == 32672)
      {
        sendBuffer = self->_sendBuffer;
        *(void *)&sendBuffer->var0.var0.var0 = 0LL;
        *(void *)&sendBuffer->var0.var0.var2 = 0LL;
        sendBuffer->var0.var1 = 0;
        *(void *)&sendBuffer->var0.var0.var4 = 0LL;
        id v11 = (mach_msg_header_t *)self->_sendBuffer;
        v11->msgh_remote_port = self->_sendPort;
        v11->msgh_bits = 19;
        LODWORD(sendBuffer) = self->_bufferedLength;
        v11[1].msgh_bits = sendBuffer;
        if (mach_msg(v11, 1, ((_DWORD)sendBuffer + 35) & 0xFFFFFFF8, 0, 0, 0, 0)) {
          goto LABEL_3;
        }
        unsigned int bufferedLength = 0;
        self->_unsigned int bufferedLength = 0;
      }

      v7 += v9;
      v5 += v9;
      v6 -= v9;
    }

    while (v6);
  }

  else
  {
    unint64_t v5 = 0LL;
LABEL_3:
    objc_msgSend_disconnect(self, a2, (uint64_t)a3, a4);
  }

  return v5;
}

- (void)disconnect
{
  listenSource = self->_listenSource;
  if (listenSource) {
    dispatch_source_cancel((dispatch_source_t)listenSource);
  }
  inputQueue = self->_inputQueue;
  uint64_t v5 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BC3748;
  block[3] = &unk_18A2ED618;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)inputQueue, block);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DTXMachTransport;
  -[DTXTransport disconnect](&v8, sel_disconnect);
  outputQueue = self->_outputQueue;
  v7[0] = v5;
  v7[1] = 3221225472LL;
  v7[2] = sub_188BC3798;
  v7[3] = &unk_18A2ED618;
  v7[4] = self;
  dispatch_async((dispatch_queue_t)outputQueue, v7);
}

- (id)localAddresses
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = getpid();
  objc_super v4 = (void *)MEMORY[0x189604030];
  objc_msgSend_stringByAppendingFormat_( @"mach",  v5,  (uint64_t)@"://%d/%d/%d",  v3,  self->_receivePort,  self->_sendPort);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v4, v7, (uint64_t)v6);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v9, (uint64_t)v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)fileDescriptorHandshakeWithReceivePort:(unsigned int)a3
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  int v27 = -1;
  unsigned int v28 = -1;
  if (a3 - 1 >= 0xFFFFFFFE)
  {
    int v7 = 1;
  }

  else
  {
    uint64_t v35 = 0LL;
    v36 = &v35;
    uint64_t v37 = 0x2020000000LL;
    int v38 = 0;
    uint64_t v5 = MEMORY[0x1895F87A8];
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v30 = sub_188BC4BF8;
    v31 = &unk_18A2ED6D8;
    pid_t v32 = &v35;
    pid_t v33 = &v28;
    uint64_t v34 = &v27;
    unint64_t v6 = v29;
    bzero(&msg, 0x324uLL);
    if (mach_msg((mach_msg_header_t *)&msg, 2, 0, 0x324u, a3, 0, 0) || (_DWORD)msg_20 == 70)
    {
      LODWORD(v42[0]) = 0;
      LODWORD(v41[0]) = 4;
      ((void (*)(void *, void, _OWORD *, _OWORD *, void))v30)(v6, 0LL, v42, v41, 0LL);
    }

    else if (v51[191] + (_DWORD)msg_4 == 804 && (HIDWORD(msg_20) - 65) > 0xFFFFFFBF)
    {
      uint64_t v15 = 0LL;
      int v16 = msg;
      memset(v42, 0, sizeof(v42));
      uint64_t v17 = 4LL * HIDWORD(msg_20);
      v18 = v51;
      v19 = v51;
      memset(v41, 0, sizeof(v41));
      while (1)
      {
        unsigned int v21 = *v19;
        v19 += 3;
        unsigned int v20 = v21;
        if (HIBYTE(v21)) {
          break;
        }
        unsigned int v22 = v20 - 1441792;
        int v23 = v20 & 0xFF0000;
        BOOL v24 = v22 >= 0xFFFB0000 || v23 == 0x100000;
        if (v24 && (v16 & 0x80000000) == 0) {
          break;
        }
        int v25 = 4 * (v22 < 0xFFFB0000);
        if (v23 == 0x100000) {
          int v25 = 1;
        }
        *(_DWORD *)((char *)v42 + v15) = *(v18 - 2);
        if (v16 >= 0) {
          int v26 = 6;
        }
        else {
          int v26 = v25;
        }
        *(_DWORD *)((char *)v41 + v15) = v26;
        v15 += 4LL;
        v18 = v19;
        if (v17 == v15) {
          goto LABEL_31;
        }
      }

      int v39 = 4;
      int v40 = 0;
LABEL_31:
      ((void (*)(void *))v30)(v6);
      mach_msg_destroy((mach_msg_header_t *)&msg);
    }

    else
    {
      LODWORD(v42[0]) = 0;
      LODWORD(v41[0]) = 4;
      ((void (*)(void *, void, _OWORD *, _OWORD *, void))v30)(v6, 0LL, v42, v41, 0LL);
      mach_msg_destroy((mach_msg_header_t *)&msg);
    }

    int v7 = *((_DWORD *)v36 + 6);
    _Block_object_dispose(&v35, 8);
    if (!v7)
    {
      objc_super v13 = objc_alloc(&OBJC_CLASS___DTXFileDescriptorTransport);
      id v11 = (void *)objc_msgSend_initWithIncomingFileDescriptor_outgoingFileDescriptor_disconnectBlock_( v13,  v14,  v28,  v5,  3221225472,  sub_188BC3CFC,  &unk_18A2ED638,  __PAIR64__(v27, v28));
      return v11;
    }
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    objc_super v8 = getprogname();
    pid_t v9 = getpid();
    Name = sel_getName(a2);
    int msg = 136315906;
    msg_4 = v8;
    __int16 msg_12 = 1024;
    pid_t msg_14 = v9;
    __int16 msg_18 = 2082;
    msg_20 = Name;
    __int16 v49 = 1024;
    int v50 = v7;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s(%d) [error]: '%{public}s' failed: (%d)\n",  (uint8_t *)&msg,  0x22u);
  }

  id v11 = 0LL;
  return v11;
}

+ (id)fileDescriptorHandshakeWithSendPort:(unsigned int)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a3 - 1 >= 0xFFFFFFFE)
  {
    int v4 = 1;
    goto LABEL_19;
  }

  *(void *)id v11 = -1LL;
  *(void *)uint64_t v12 = -1LL;
  if (pipe(v11) || pipe(v12))
  {
    *(void *)mach_port_name_t name = 0LL;
    int v4 = 6;
LABEL_5:
    if ((v11[0] & 0x80000000) == 0) {
      close(v11[0]);
    }
    goto LABEL_7;
  }

  *(void *)mach_port_name_t name = 0LL;
  int v4 = 15;
  if ((v11[0] & 0x80000000) == 0)
  {
    if (fcntl(v11[0], 2, 1LL) == -1 || v11[1] < 0 || fcntl(v11[1], 2, 1LL) == -1) {
      int v4 = 29;
    }
    goto LABEL_5;
  }

  int v4 = 29;
LABEL_7:
  if ((v11[1] & 0x80000000) == 0) {
    close(v11[1]);
  }
  if ((v12[0] & 0x80000000) == 0) {
    close(v12[0]);
  }
  if ((v12[1] & 0x80000000) == 0) {
    close(v12[1]);
  }
  uint64_t v5 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  if (name[1] - 1 <= 0xFFFFFFFD) {
    mach_port_deallocate(*MEMORY[0x1895FBBE0], name[1]);
  }
  if (name[0] - 1 <= 0xFFFFFFFD) {
    mach_port_deallocate(*v5, name[0]);
  }
LABEL_19:
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    unint64_t v6 = getprogname();
    pid_t v7 = getpid();
    objc_super v8 = sel_getName(a2);
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = v6;
    __int16 v15 = 1024;
    pid_t v16 = v7;
    __int16 v17 = 2082;
    v18 = v8;
    __int16 v19 = 1024;
    int v20 = v4;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s(%d) [error]: '%{public}s' failed: (%d)\n",  buf,  0x22u);
  }

  return 0LL;
}

+ (id)_legacyFileDescriptorHandshakeWithReceivePort:(unsigned int)a3
{
  uint64_t v15 = 0LL;
  pid_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v3 = MEMORY[0x1895F87A8];
  int v18 = -1;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = sub_188BC4410;
  v14[3] = &unk_18A2ED660;
  v14[4] = &v15;
  uint64_t v4 = sub_188BC4240(a3, v14);
  uint64_t v5 = v4;
  if ((v4 & 0x80000000) == 0)
  {
    if ((v16[3] & 0x80000000) == 0)
    {
      unint64_t v6 = objc_alloc(&OBJC_CLASS___DTXFileDescriptorTransport);
      uint64_t v7 = *((unsigned int *)v16 + 6);
      v12[0] = v3;
      v12[1] = 3221225472LL;
      int v12[2] = sub_188BC46D0;
      v12[3] = &unk_18A2ED688;
      v12[4] = &v15;
      int v13 = v5;
      pid_t v9 = (void *)objc_msgSend_initWithIncomingFileDescriptor_outgoingFileDescriptor_disconnectBlock_( v6,  v8,  v7,  v5,  v12);
      goto LABEL_8;
    }

    close(v4);
  }

  int v10 = *((_DWORD *)v16 + 6);
  if ((v10 & 0x80000000) == 0) {
    close(v10);
  }
  pid_t v9 = 0LL;
LABEL_8:
  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (id)_legacyFileDescriptorHandshakeWithSendPort:(unsigned int)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v27 = 0LL;
  unsigned int v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_188BC33B0;
  v31 = sub_188BC33C0;
  id v32 = 0LL;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = sub_188BC4A74;
  v25[3] = &unk_18A2ED6B0;
  unsigned int v26 = a3;
  v25[4] = &v27;
  uint64_t v5 = v25;
  v33[0] = v4;
  v33[1] = 3221225472LL;
  uint64_t v34 = sub_188BC4D88;
  uint64_t v35 = &unk_18A2ED728;
  unsigned int v37 = a3;
  unint64_t v6 = v5;
  id v36 = v6;
  uint64_t v7 = v33;
  name[0] = 0;
  objc_super v8 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  mach_error_t v9 = mach_port_allocate(*MEMORY[0x1895FBBE0], 1u, name);
  if (v9)
  {
    int v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v11 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = getprogname();
      pid_t v13 = getpid();
      uint64_t v14 = mach_error_string(v9);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v13;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v14;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v9;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_port_allocate' failed: %s (%d)\n",  buf,  0x22u);
    }
  }

  mach_error_t inserted = mach_port_insert_right(*v8, name[0], name[0], 0x14u);
  if (inserted)
  {
    pid_t v16 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v17 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = getprogname();
      pid_t v19 = getpid();
      int v20 = mach_error_string(inserted);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v19;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v20;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = inserted;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_port_insert_right' failed: %s (%d)\n",  buf,  0x22u);
    }
  }

  uint64_t v21 = name[0];
  *(void *)mach_port_name_t name = 0LL;
  int v39 = name;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 0;
  *(void *)buf = v4;
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_188BC4E38;
  *(void *)&buf[24] = &unk_18A2ED688;
  *(void *)&buf[32] = name;
  int v43 = v21;
  unsigned int v22 = (void (**)(void))MEMORY[0x1895D398C](buf);
  v34((uint64_t)v7, v21, v22);
  v22[2](v22);

  _Block_object_dispose(name, 8);
  id v23 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v23;
}

- (void).cxx_destruct
{
}

@end