void sub_187D3BDA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_187D3BE48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3BEB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3BFF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3C0FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)result = a4;
  *(void *)(result + 4) = a2;
  *(_WORD *)(result + 12) = 1024;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, os_log_s *a4@<X8>)
{
}

id _AFKUserLog()
{
  if (_AFKUserLog::onceToken != -1) {
    dispatch_once(&_AFKUserLog::onceToken, &__block_literal_global);
  }
  return (id)_AFKUserLog::log;
}

void sub_187D3C494(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_187D3C548( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___AFKMemoryDescriptorManager;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_187D3C5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3C7B0(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_187D3C85C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3C91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3CB20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3CC6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___AFKMemoryDescriptor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_187D3CD8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}
}

void sub_187D3CE90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3CFE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3D0E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3D1D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3D2D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(float *)a3 = a1;
  *(void *)(a3 + 4) = a4;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v4;
}

void sub_187D3D4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3D540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_54:
      v12 = 0LL;
      goto LABEL_55;
    }
  }

  if (self->_reportHandler) {
    input[0] |= 1uLL;
  }
  if (self->_commandHandlerWithReturn || self->_commandHandler) {
    input[0] |= 2uLL;
  }
  if (self->_descriptorHandler) {
    input[0] |= 3uLL;
  }
  if (-[NSSet count](self->_descriptorManagers, "count"))
  {
    if (-[NSSet count](self->_descriptorManagers, "count") >= 0x10000)
    {
      v48[0] = 0LL;
      v51 = 0u;
      v52 = 0u;
      v50 = 0u;
      memset(buf, 0, sizeof(buf));
      os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      LODWORD(v42) = 134217984;
      *(void *)((char *)&v42 + 4) = 0LL;
      _os_log_send_and_compose_impl();
      v28 = _os_crash_msg();
      -[AFKEndpointInterface activate:].cold.1(v28);
    }

    v12 = calloc(-[NSSet count](self->_descriptorManagers, "count"), 8uLL);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = self->_descriptorManagers;
    v14 = -[NSSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v33,  v47,  16LL);
    if (v14)
    {
      v15 = 0LL;
      v16 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v14; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          v12[v15 + i] = [*(id *)(*((void *)&v33 + 1) + 8 * i) regID];
        }

        v14 = -[NSSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v33,  v47,  16LL);
        v15 += i;
      }

      while (v14);
    }

    int v4 = MEMORY[0x1895F87A8];
    v18 = 8 * -[NSSet count](self->_descriptorManagers, "count");
  }

  else
  {
    v18 = 0LL;
    v12 = 0LL;
  }

  v19 = IONotificationPortCreate(*MEMORY[0x1896086A8]);
  self->_asyncPort = v19;
  if (v19)
  {
    IONotificationPortSetDispatchQueue(v19, (dispatch_queue_t)self->_queue);
    v10 = MEMORY[0x1895B51A8](*p_connect, 0LL, *v8, &v41, &v40, 1LL);
    if (!v10)
    {
      v20 = v40;
      self->_dataQueue = v41;
      self->_dataQueueSize = v20;
      NotificationPort = IODataQueueAllocateNotificationPort();
      self->_dataQueuePort = NotificationPort;
      if (NotificationPort)
      {
        v22 = (OS_dispatch_mach *)dispatch_mach_create();
        dataQueueMachChannel = self->_dataQueueMachChannel;
        self->_dataQueueMachChannel = v22;

        if (self->_dataQueueMachChannel)
        {
          dispatch_mach_connect();
          objc_storeStrong(&self->me, self);
          v10 = MEMORY[0x1895B51C0](self->_connect, 0LL, self->_dataQueuePort, 0LL);
          if (v10)
          {
            _AFKUserLog();
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              -[AFKEndpointInterface regID](self, "regID");
              -[AFKEndpointInterface activate:].cold.6();
            }
          }

          else
          {
            v10 = IOConnectCallMethod(*p_connect, 0, input, 2u, v12, v18, 0LL, 0LL, 0LL, 0LL);
            if (!v10) {
              goto LABEL_32;
            }
            _AFKUserLog();
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              -[AFKEndpointInterface regID](self, "regID");
              -[AFKEndpointInterface activate:].cold.5();
            }
          }

          goto LABEL_55;
        }

        _AFKUserLog();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[AFKEndpointInterface activate:].cold.4((uint64_t)buf, -[AFKEndpointInterface regID](self, "regID"), v26);
        }
      }

      else
      {
        _AFKUserLog();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[AFKEndpointInterface activate:].cold.3((uint64_t)buf, -[AFKEndpointInterface regID](self, "regID"), v26);
        }
      }

      goto LABEL_32;
    }

    _AFKUserLog();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      -[AFKEndpointInterface regID](self, "regID");
      -[AFKMemoryDescriptor mapDescriptor].cold.1();
    }
  }

  else
  {
    _AFKUserLog();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v10 = -536870210;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[AFKEndpointInterface activate:].cold.2((uint64_t)v48, -[AFKEndpointInterface regID](self, "regID"), v25);
    }
  }

LABEL_55:
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = __Block_byref_object_copy_;
  *(void *)&v50 = __Block_byref_object_dispose_;
  *((void *)&v50 + 1) = [MEMORY[0x189607870] errorWithDomain:@"com.apple.IOKit" code:v10 userInfo:0];
  *(void *)&v42 = 0LL;
  *((void *)&v42 + 1) = &v42;
  v43 = 0x3032000000LL;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = self;
  queue = self->_queue;
  block[0] = v4;
  block[1] = 3221225472LL;
  block[2] = __33__AFKEndpointInterface_activate___block_invoke_18;
  block[3] = &unk_18A131C80;
  block[4] = &v42;
  block[5] = buf;
  dispatch_async((dispatch_queue_t)queue, block);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(buf, 8);
LABEL_32:
  if (v12) {
    free(v12);
  }
LABEL_34:

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void sub_187D3DCD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, id a32)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a32);
  _Unwind_Resume(a1);
}

void sub_187D3DE38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_187D3E1D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3E2EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
}

void sub_187D3E40C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
}

void sub_187D3E52C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
}

void sub_187D3E64C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
}

void sub_187D3E76C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
}

void sub_187D3E920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3EA44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
}

void sub_187D3EBA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, objc_super a12)
{
  a12.super_class = (Class)&OBJC_CLASS___AFKEndpointInterface;
  -[_Unwind_Exception dealloc](&a12, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_187D3EBD0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_187D3F258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_6:
      }

      IODataQueueDequeue(a3, 0LL, &dataSize);
      v6 = IODataQueuePeek(a3);
    }

    while (v6);
  }

  v13 = (unsigned int *)((char *)a3->queue + a3->queueSize);
  if (atomic_load(v13))
  {
    do
      v15 = __ldaxr(v13);
    while (__stlxr(v15 - 1, v13));
    if (IOConnectCallScalarMethod(self->_connect, 8u, 0LL, 0, 0LL, 0LL))
    {
      _AFKUserLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[AFKEndpointInterface regID](self, "regID");
        -[AFKEndpointInterface dequeueDataMessage:].cold.1();
      }
    }
  }

void sub_187D3F51C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3FB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187D3FCC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1_0(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

  ;
}

BOOL OUTLINED_FUNCTION_3_0()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_7(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

double OUTLINED_FUNCTION_9(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOConnectCallScalarMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x189607CC0]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  output,  outputCnt);
}

kern_return_t IOConnectMapMemory( io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x189607CD8]( *(void *)&connect,  *(void *)&memoryType,  *(void *)&intoTask,  atAddress,  ofSize,  *(void *)&options);
}

kern_return_t IOConnectSetCFProperties(io_connect_t connect, CFTypeRef properties)
{
  return MEMORY[0x189607CE8](*(void *)&connect, properties);
}

kern_return_t IOConnectSetNotificationPort( io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x189607CF8](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOConnectUnmapMemory( io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x189607D18](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x189607D68]();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x189607D78](dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return (IODataQueueEntry *)MEMORY[0x189607D80](dataQueue);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x189608330](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1896083A0](*(void *)&object);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x189608500](*(void *)&entry, entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1895FACF0]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1895FACF8]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1895FAD00]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1895FB8C0]();
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t objc_msgSend_enqueueCommand_timestamp_inputBuffer_inputBufferSize_outputPayloadSize_context_options_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_enqueueCommand_timestamp_inputBuffer_inputBufferSize_outputPayloadSize_context_options_);
}

uint64_t objc_msgSend_enqueueResponseForContext_status_timestamp_outputBuffer_outputBufferSize_options_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_enqueueResponseForContext_status_timestamp_outputBuffer_outputBufferSize_options_);
}