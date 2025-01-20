@interface NSXPCConnection
+ (NSXPCConnection)currentConnection;
+ (void)_currentBoost;
+ (void)_handoffCurrentReplyToQueue:(id)a3 block:(id)a4;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (Class)_remoteObjectInterfaceClass;
- (NSString)_serviceInfoForDecoder;
- (NSString)serviceName;
- (NSXPCConnection)init;
- (NSXPCConnection)initWithListenerEndpoint:(NSXPCListenerEndpoint *)endpoint;
- (NSXPCConnection)initWithMachServiceName:(NSString *)name options:(NSXPCConnectionOptions)options;
- (NSXPCConnection)initWithMachServiceName:(id)a3;
- (NSXPCConnection)initWithServiceName:(NSString *)serviceName;
- (NSXPCConnection)initWithServiceName:(id)a3 options:(unint64_t)a4;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (NSXPCListenerEndpoint)endpoint;
- (au_asid_t)auditSessionIdentifier;
- (gid_t)effectiveGroupIdentifier;
- (id)_additionalInvalidationHandler;
- (id)_errorDescription;
- (id)_initWithCustomTransport:(id)a3;
- (id)_initWithRemoteConnection:(id)a3 name:(id)a4;
- (id)_initWithRemoteService:(id)a3 name:(id)a4 options:(unint64_t)a5;
- (id)_initWithRemoteService:(id)a3 name:(id)a4 options:(unint64_t)a5 mode:(unint64_t)a6;
- (id)_queue;
- (id)_unboostingRemoteObjectProxy;
- (id)_xpcConnection;
- (id)delegate;
- (id)description;
- (id)exportedObject;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(void *)handler;
- (id)remoteObjectProxyWithTimeout:(double)a3 errorHandler:(id)a4;
- (id)remoteObjectProxyWithUserInfo:(id)a3 errorHandler:(id)a4;
- (id)replacementObjectForEncoder:(id)a3 object:(id)a4;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(void *)handler;
- (id)userInfo;
- (id)valueForEntitlement:(id)a3;
- (pid_t)processIdentifier;
- (uid_t)effectiveUserIdentifier;
- (uint64_t)_initWithPeerConnection:(void *)a1 name:(_xpc_connection_s *)a2 options:(__CFString *)a3;
- (uint64_t)_initWithRemotePeerConnection:(void *)a1 name:(uint64_t)a2 options:(__CFString *)a3;
- (uint64_t)_removeImportedProxy:(uint64_t)result;
- (uint64_t)_sendProgressMessage:(uint64_t)a3 forSequence:;
- (void)_cancelProgress:(unint64_t)a3;
- (void)_decodeAndInvokeMessageWithEvent:(id)a3 reply:(id)a4 flags:(unint64_t)a5;
- (void)_decodeAndInvokeReplyBlockWithEvent:(id)a3 sequence:(unint64_t)a4 replyInfo:(id)a5;
- (void)_decodeProgressMessageWithData:(id)a3 flags:(unint64_t)a4;
- (void)_killConnection:(int)a3;
- (void)_pauseProgress:(unint64_t)a3;
- (void)_resumeProgress:(unint64_t)a3;
- (void)_sendDesistForProxy:(id)a3;
- (void)_sendInvocation:(id)a3 orArguments:(id *)a4 count:(unint64_t)a5 methodSignature:(id)a6 selector:(SEL)a7 withProxy:(id)a8;
- (void)_sendSelector:(SEL)a3 withProxy:(id)a4;
- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5;
- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6;
- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6 arg3:(id)a7;
- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6 arg3:(id)a7 arg4:(id)a8;
- (void)_setBootstrapObject:(id)a3 forKey:(id)a4;
- (void)_setLanguages:(id)a3;
- (void)_setQueue:(id)a3;
- (void)_setTargetUserIdentifier:(unsigned int)a3;
- (void)_setUUID:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)interruptionHandler;
- (void)invalidate;
- (void)invalidationHandler;
- (void)resume;
- (void)scheduleSendBarrierBlock:(void *)block;
- (void)setDelegate:(id)a3;
- (void)setExportedInterface:(NSXPCInterface *)exportedInterface;
- (void)setExportedObject:(id)exportedObject;
- (void)setInterruptionHandler:(void *)interruptionHandler;
- (void)setInvalidationHandler:(void *)invalidationHandler;
- (void)setOptions:(unint64_t)a3;
- (void)setRemoteObjectInterface:(NSXPCInterface *)remoteObjectInterface;
- (void)setUserInfo:(id)a3;
- (void)set_additionalInvalidationHandler:(id)a3;
- (void)suspend;
@end

@implementation NSXPCConnection

void __51__NSXPCConnection_initWithMachServiceName_options___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_decodeAndInvokeMessageWithEvent:(id)a3 reply:(id)a4 flags:(unint64_t)a5
{
  char v5 = a5;
  v74[5] = *MEMORY[0x1895F89C0];
  uint64 = (const char *)xpc_dictionary_get_uint64(a3, "proxynum");
  if (!uint64
    || (v11 = -[_NSXPCConnectionExportedObjectTable exportedObjectForProxyNumber:]( (os_unfair_lock_s *)self->_exportInfo,  uint64),  v12 = -[_NSXPCConnectionExportedObjectTable interfaceForProxyNumber:]( (os_unfair_lock_s *)self->_exportInfo,  uint64),  !v11))
  {
    v16 = (os_log_s *)_NSXPCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      __int16 v68 = 2048;
      v69 = uint64;
      _os_log_fault_impl( &dword_182EB1000,  v16,  OS_LOG_TYPE_FAULT,  "%{public}@: received an undecodable message for proxy %lld (no exported object to receive message). Dropping message.",  buf,  0x16u);
    }

    goto LABEL_10;
  }

  v13 = v12;
  if (!v12)
  {
    v17 = (os_log_s *)_NSXPCLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_fault_impl( &dword_182EB1000,  v17,  OS_LOG_TYPE_FAULT,  "%{public}@: received an undecodable message (no protocol set to define allowed messages on exported object). Dropping message.",  buf,  0xCu);
    }

- (id)synchronousRemoteObjectProxyWithErrorHandler:(void *)handler
{
  return (id)objc_msgSend( objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")),  "_initWithConnection:proxyNumber:generationCount:interface:options:error:",  self,  1,  0,  self->_remoteObjectInterface,  4,  handler);
}

- (Class)_remoteObjectInterfaceClass
{
  remoteObjectInterface = self->_remoteObjectInterface;
  if (remoteObjectInterface) {
    return -[NSXPCInterface _customSubclass](remoteObjectInterface, "_customSubclass");
  }
  else {
    return (Class)objc_opt_class();
  }
}

- (void)_sendInvocation:(id)a3 orArguments:(id *)a4 count:(unint64_t)a5 methodSignature:(id)a6 selector:(SEL)a7 withProxy:(id)a8
{
  v112[256] = *(id *)MEMORY[0x1895F89C0];
  v91 = (void *)[a8 _userInfo];
  if (a8)
  {
    double v15 = *((double *)a8 + 8);
    id Property = objc_getProperty(a8, v14, 32LL, 1);
    id newValue = objc_getProperty(a8, v16, 16LL, 1);
  }

  else
  {
    id Property = 0LL;
    id newValue = 0LL;
    double v15 = 0.0;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  unint64_t v18 = [a6 numberOfArguments];
  if (!a3 && v18 - 2 != a5)
  {
    uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
    v69 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[NSXPCConnection sendInvocation]: Mismatch of count of expected arguments (%s) %lu vs %lu",  sel_getName(a7),  v18 - 2,  a5);
    goto LABEL_105;
  }

  if (a8) {
    uint64_t value = *((void *)a8 + 5);
  }
  else {
    uint64_t value = 0LL;
  }
  unint64_t v84 = a5;
  SEL v85 = a2;
  v92 = a8;
  if (v18 >= 3)
  {
    v19 = 0LL;
    char v20 = 0;
    dispatch_semaphore_t v86 = 0LL;
    xpc_object_t v87 = v17;
    BOOL v21 = 0LL;
    unint64_t v22 = v18 - 2;
    uint64_t v23 = 2LL;
    uint64_t v95 = 1LL;
    v89 = self;
    while (1)
    {
      uint64_t v24 = [a6 _argInfo:v19 + 2];
      if (!v24) {
        break;
      }
      __int16 v25 = *(_WORD *)(v24 + 34);
      if ((v25 & 0x80) != 0)
      {
        uint64_t v24 = *(void *)v24;
        if (!v24) {
          break;
        }
        __int16 v25 = *(_WORD *)(v24 + 34);
      }

      if ((v25 & 8) != 0)
      {
        uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
        Name = sel_getName(a7);
        v74 = @"[NSXPCConnection sendInvocation]: Arguments to messages sent to this proxy may not be 'byref'. (%s)";
        goto LABEL_117;
      }

      if ((v25 & 2) != 0)
      {
        uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
        Name = sel_getName(a7);
        v74 = @"[NSXPCConnection sendInvocation]: Arguments to messages sent to this proxy may not be 'out'. (%s)";
        goto LABEL_117;
      }

      if ((v25 & 0x1000) != 0)
      {
        uint64_t v26 = *(void *)(v24 + 8);
        if (v26)
        {
          if ((*(_WORD *)(v26 + 34) & 0x1000) != 0)
          {
            uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
            Name = sel_getName(a7);
            v74 = @"[NSXPCConnection sendInvocation]: Arguments to messages sent to this proxy may not be of type '**'. (%s)";
            goto LABEL_117;
          }
        }
      }

      if (v25 < 0)
      {
        if ((v20 & 1) != 0)
        {
          uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
          Name = sel_getName(a7);
          v74 = @"[NSXPCConnection sendInvocation]: Only one reply block is allowed per message send. (%s)";
          goto LABEL_117;
        }

        if (v92 && (v92[56] & 2) != 0)
        {
          uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
          Name = sel_getName(a7);
          v74 = @"[NSXPCConnection sendInvocation]: A reply block was sent over a 'no importance' proxy. (%s)";
          goto LABEL_117;
        }

        v112[0] = 0LL;
        if (a3)
        {
          [a3 getArgument:v112 atIndex:v19 + 2];
          id v28 = v112[0];
          if (!v112[0]) {
            goto LABEL_110;
          }
        }

        else
        {
          id v28 = a4[(void)v19];
          v112[0] = v28;
          if (!v28)
          {
LABEL_110:
            uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
            Name = sel_getName(a7);
            v74 = @"[NSXPCConnection sendInvocation]: A NULL reply block was passed into a message meant to be sent over a connection. (%s)";
            goto LABEL_117;
          }
        }

        v29 = _Block_signature(v28);
        if (!v29)
        {
          uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
          Name = sel_getName(a7);
          v74 = @"[NSXPCConnection sendInvocation]: Block was not compiled using a compiler that inserts type information about arguments. (%s)";
          goto LABEL_117;
        }

        v30 = v29;
        uint64_t v31 = objc_msgSend((id)objc_msgSend(MEMORY[0x189603FA0], "signatureWithObjCTypes:", v29), "_argInfo:", -1);
        if ((*(_WORD *)(v31 + 34) & 0x80) != 0) {
          uint64_t v31 = *(void *)v31;
        }
        if (*(_BYTE *)(v31 + 36) != 118)
        {
          uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
          Name = sel_getName(a7);
          v74 = @"[NSXPCConnection sendInvocation]: Return value of block argument must be 'void'. (%s)";
          goto LABEL_117;
        }

        uint64_t v32 = -[_NSXPCConnectionExpectedReplyInfo initWithSelector:]( objc_alloc(&OBJC_CLASS____NSXPCConnectionExpectedReplyInfo),  (uint64_t)a7);
        BOOL v21 = v32;
        if (v32)
        {
          objc_setProperty_atomic(v32, v33, newValue, 40LL);
          v21[7] = value;
          if (v91) {
            objc_setProperty_atomic(v21, v34, v91, 48LL);
          }
          objc_setProperty_atomic_copy(v21, v34, v112[0], 8LL);
          objc_setProperty_atomic_copy(v21, v35, Property, 16LL);
          if (v15 != 0.0)
          {
            dispatch_semaphore_t v86 = dispatch_semaphore_create(0LL);
            objc_setProperty_atomic(v21, v36, v86, 24LL);
          }
        }

        else if (v15 != 0.0)
        {
          dispatch_semaphore_t v86 = dispatch_semaphore_create(0LL);
        }

        sel_getName(a7);
        v95 |= 0x20uLL;
        xpc_dictionary_set_string(v17, "replysig", v30);
        char v20 = 1;
      }

      else if ((v25 & 0x2000) != 0)
      {
        v112[0] = 0LL;
        if (a3)
        {
          [a3 getArgument:v112 atIndex:v19 + 2];
          __int16 v27 = (const char *)(v23 - 2);
        }

        else
        {
          v112[0] = a4[(void)v19];
          __int16 v27 = v19;
        }

        uint64_t v37 = [newValue _interfaceForArgument:v27 ofSelector:a7 reply:0];
        if (v112[0])
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v37)
            {
              uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
              Name = v27;
              v82 = sel_getName(a7);
              v74 = @"[NSXPCConnection sendInvocation]: A proxy object was passed as an argument to a message (argument %ld) but the interface does not specify a proxy object there. (%s)";
LABEL_117:
              for (uint64_t i = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v74, Name, v82, v83);
                    ;
                    uint64_t i = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[NSXPCConnection sendInvocation]: Return type (%c) of method %s is an object (%s) but not 'NSProgress'",  v77,  v73,  class_getName(v76)))
              {
                __int16 v70 = i;
                uint64_t v71 = (void *)MEMORY[0x189603F70];
                __int16 v72 = (void *)MEMORY[0x189603A60];
LABEL_119:
                objc_exception_throw((id)[v71 exceptionWithName:*v72 reason:v70 userInfo:0]);
LABEL_120:
                v76 = (objc_class *)v43;
                uint64_t v77 = *((unsigned __int8 *)v73 + 36);
                uint64_t v73 = sel_getName(a7);
              }
            }
          }

          else if (v112[0] && v37)
          {
            v38 = objc_alloc(&OBJC_CLASS____NSXPCDistantObject);
            id v39 = -[_NSXPCDistantObject _initWithConnection:exportedObject:interface:]( v38,  "_initWithConnection:exportedObject:interface:",  v89,  v112[0],  v37);
            id v111 = v39;
            if (a3)
            {
              [a3 setArgument:&v111 atIndex:v19 + 2];
              [a3 _addAttachedObject:v111];
            }

            else
            {
              a4[(void)v27] = v39;
            }
          }
        }

        self = v89;
        xpc_object_t v17 = v87;
      }

      ++v23;
    }

    uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
    v69 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[NSXPCConnection sendInvocation]: No argument type for invocation argument (%s)",  sel_getName(a7),  v82,  v83);
LABEL_105:
    __int16 v70 = v69;
    uint64_t v71 = (void *)MEMORY[0x189603F70];
    __int16 v72 = (void *)MEMORY[0x189603A58];
    goto LABEL_119;
  }

  BOOL v21 = 0LL;
  dispatch_semaphore_t v86 = 0LL;
  uint64_t v95 = 1LL;
LABEL_56:
  uint64_t v40 = [a6 _argInfo:-1];
  uint64_t v73 = (const char *)v40;
  if ((*(_WORD *)(v40 + 34) & 0x80) != 0) {
    uint64_t v73 = *(const char **)v40;
  }
  int v42 = *((unsigned __int8 *)v73 + 36);
  if (v42 != 118)
  {
    if (!v21)
    {
      uint64_t v73 = (const char *)&OBJC_CLASS___NSString;
      Name = sel_getName(a7);
      v74 = @"[NSXPCConnection sendInvocation]: Return type of methods sent over this proxy must be 'void' or 'NSProgress *' (%s)";
      goto LABEL_117;
    }

    char v43 = (__objc2_class *)[newValue _returnClassForSelector:a7];
    if (v43 != &OBJC_CLASS___NSProgress) {
      goto LABEL_120;
    }
  }

  if (value != 1)
  {
    v44 = v92;
    if (v92) {
      v44 = (_BYTE *)*((void *)v92 + 6);
    }
    if (v44 != (_BYTE *)self->_importInfo->_generationCount)
    {
      v54 = v86;
      if (v21 && objc_getProperty(v21, v41, 16LL, 1))
      {
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke;
        block[3] = &unk_189C991F0;
        block[4] = self;
        block[5] = v21;
        if (v92 && (v92[56] & 4) != 0) {
          __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke((uint64_t)block);
        }
        else {
          dispatch_async((dispatch_queue_t)self->_userQueue, block);
        }
      }

      BOOL v68 = v21 != 0LL;
      goto LABEL_124;
    }
  }

  uint64_t v45 = (void *)objc_opt_new();
  uint64_t v46 = -[NSXPCEncoder initWithStackSpace:size:]( objc_alloc(&OBJC_CLASS___NSXPCEncoder),  "initWithStackSpace:size:",  v112,  2048LL);
  -[NSXPCEncoder _setConnection:](v46, "_setConnection:", self);
  -[NSXPCEncoder setDelegate:](v46, "setDelegate:", self);
  if (self->_otherInfo) {
    -[NSXPCCoder setUserInfo:](v46, "setUserInfo:");
  }
  if (a3) {
    -[NSXPCEncoder _encodeInvocation:isReply:into:](v46, "_encodeInvocation:isReply:into:", a3, 0LL, v17);
  }
  else {
    -[NSXPCEncoder _encodeInvocationObjectArgumentsOnly:count:typeString:selector:isReply:into:]( v46,  "_encodeInvocationObjectArgumentsOnly:count:typeString:selector:isReply:into:",  a4,  v84,  [a6 _cTypeString],  a7,  0,  v17);
  }

  xpc_dictionary_set_uint64(v17, "proxynum", value);
  if (!v21)
  {
    xpc_dictionary_set_uint64(v17, "f", v95);
    if (v92)
    {
      uint64_t v52 = *((void *)v92 + 7);
      char v53 = atomic_load(&self->_state2);
      if ((v52 & 2) != 0)
      {
        if ((v53 & 0x40) != 0) {
          -[_NSXPCTransport sendNotification:](self->_transport, "sendNotification:", v17, v50, v51);
        }
        else {
          xpc_connection_send_notification();
        }
        goto LABEL_132;
      }

      if ((v53 & 0x40) == 0) {
        goto LABEL_77;
      }
    }

    else
    {
      char v80 = atomic_load(&self->_state2);
      if ((v80 & 0x40) == 0)
      {
LABEL_77:
        xpc_connection_send_message(self->_connection.xpc, v17);
LABEL_132:
        xpc_release(v17);
        goto LABEL_133;
      }
    }

    -[_NSXPCTransport sendMessage:](self->_transport, "sendMessage:", v17, v50, v51);
    goto LABEL_132;
  }

  v112[0] = 0LL;
  if (v42 != 118)
  {
    v112[0] =  +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  1LL);
    [a3 setReturnValue:v112];
    uint64_t v49 = v95 | 0xC0;
    v48 = (NSProgress *)v112[0];
    goto LABEL_84;
  }

  id v47 = +[NSProgress currentProgress](&OBJC_CLASS___NSProgress, "currentProgress");
  if (v47)
  {
    v48 = -[NSProgress initWithParent:userInfo:]( objc_alloc(&OBJC_CLASS___NSProgress),  "initWithParent:userInfo:",  v47,  0LL);
    v112[0] = v48;
    uint64_t v49 = v95 | 0x40;
LABEL_84:
    char v55 = v92;
    goto LABEL_85;
  }

  v48 = 0LL;
  char v55 = v92;
  uint64_t v49 = v95;
LABEL_85:
  BOOL v56 = -[_NSXPCConnectionExpectedReplies sequenceForProgress:]((uint64_t)self->_repliesExpected, v48);
  xpc_dictionary_set_uint64(v17, "sequence", (uint64_t)v56);
  xpc_dictionary_set_uint64(v17, "f", v49);
  if (v112[0])
  {
    [v112[0] setTotalUnitCount:1];
    uint64_t v59 = MEMORY[0x1895F87A8];
    v109[0] = MEMORY[0x1895F87A8];
    v109[1] = 3221225472LL;
    v109[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_2;
    v109[3] = &unk_189C9E2F8;
    v109[4] = self;
    v109[5] = v56;
    [v112[0] setCancellationHandler:v109];
    v108[0] = v59;
    v108[1] = 3221225472LL;
    v108[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_3;
    v108[3] = &unk_189C9E2F8;
    v108[4] = self;
    v108[5] = v56;
    [v112[0] setPausingHandler:v108];
    v107[0] = v59;
    v107[1] = 3221225472LL;
    v107[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_4;
    v107[3] = &unk_189C9E2F8;
    v107[4] = self;
    v107[5] = v56;
    [v112[0] setResumingHandler:v107];
  }

  int v60 = objc_msgSend(newValue, "_hasProxiesInReplyBlockArgumentsOfSelector:", a7, v57, v58);
  char v61 = v60;
  if (v60)
  {
    exportInfo = self->_exportInfo;
    if (exportInfo) {
      dispatch_group_enter((dispatch_group_t)exportInfo->_replyGroup);
    }
  }

  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  v98 = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_5;
  v99 = &unk_189CA5C58;
  v100 = self;
  v101 = v21;
  id v102 = v112[0];
  v103 = v56;
  uint64_t v104 = value;
  SEL v105 = v85;
  char v106 = v61;
  if (v55)
  {
    uint64_t v63 = *((void *)v55 + 7);
    char v64 = atomic_load(&self->_state2);
    v54 = v86;
    if ((v63 & 4) != 0)
    {
      if ((v64 & 0x40) != 0) {
        xpc_object_t v66 = (id)-[_NSXPCTransport sendMessageWithReplySync:]( self->_transport,  "sendMessageWithReplySync:",  v17);
      }
      else {
        xpc_object_t v66 = __NSXPCCONNECTION_IS_WAITING_FOR_A_SYNCHRONOUS_REPLY__(self->_connection.xpc, v17);
      }
      v67 = v66;
      v98((uint64_t)handler, v66);
      xpc_release(v67);
      goto LABEL_123;
    }

    userQueue = (dispatch_queue_s *)self->_userQueue;
    if ((v64 & 0x40) == 0) {
      goto LABEL_93;
    }
LABEL_122:
    -[_NSXPCTransport sendMessageWithReply:onQueue:replyHandler:]( self->_transport,  "sendMessageWithReply:onQueue:replyHandler:",  v17,  userQueue,  handler);
    goto LABEL_123;
  }

  char v78 = atomic_load(&self->_state2);
  userQueue = (dispatch_queue_s *)self->_userQueue;
  v54 = v86;
  if ((v78 & 0x40) != 0) {
    goto LABEL_122;
  }
LABEL_93:
  xpc_connection_send_message_with_reply(self->_connection.xpc, v17, userQueue, handler);
LABEL_123:
  BOOL v68 = 1;
LABEL_124:
  xpc_release(v17);
  if (v68 && v54)
  {
    dispatch_time_t v79 = dispatch_time(0LL, (uint64_t)(v15 * 1000000000.0));
    if (dispatch_semaphore_wait(v54, v79))
    {
      -[NSXPCConnection invalidate](self, "invalidate");
      dispatch_semaphore_wait(v54, 0xFFFFFFFFFFFFFFFFLL);
    }

    dispatch_release(v54);
  }

void __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_5( uint64_t a1,  void *a2)
{
  v48[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 56);
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 48))
  {
    -[_NSXPCConnectionExpectedReplies removeProgressSequence:]( *(void *)(*(void *)(a1 + 32) + 16LL),  *(const void **)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  }

  v8 = (__objc2_class *)MEMORY[0x186E1FF60](v4, v6, v7);
  Class Class = object_getClass(a2);
  if (Class == (Class)MEMORY[0x1895F9268])
  {
    if (a2 == (void *)MEMORY[0x1895F9198])
    {
      uint64_t v12 = *(void *)(a1 + 40);
      if (v12)
      {
        v13 = *(const char **)(v12 + 56);
LABEL_17:
        unint64_t v14 = *(void **)(a1 + 40);
        if (v14 && objc_getProperty(v14, v13, 16LL, 1))
        {
          if (*(void *)(a1 + 64) == 1LL)
          {
            uint64_t v45 = @"NSDebugDescription";
            uint64_t v46 = [*(id *)(a1 + 32) _errorDescription];
            uint64_t v15 = [MEMORY[0x189603F68] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
            uint64_t v16 = 4097LL;
          }

          else
          {
            id v47 = @"NSDebugDescription";
            v48[0] = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"The %@ was interrupted, but the message was sent over an additional proxy and therefore this proxy has become invalid.",  [*(id *)(a1 + 32) _errorDescription]);
            uint64_t v15 = [MEMORY[0x189603F68] dictionaryWithObjects:v48 forKeys:&v47 count:1];
            uint64_t v16 = 4099LL;
          }

          goto LABEL_39;
        }

- (void)_decodeAndInvokeReplyBlockWithEvent:(id)a3 sequence:(unint64_t)a4 replyInfo:(id)a5
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a5)
  {
    v8 = objc_alloc(&OBJC_CLASS___NSXPCDecoder);
    v10 = -[NSXPCDecoder initWithInterface:](v8, "initWithInterface:", objc_getProperty(a5, v9, 40LL, 1));
    -[NSXPCDecoder _setConnection:](v10, "_setConnection:", self);
    if (self->_otherInfo) {
      -[NSXPCCoder setUserInfo:](v10, "setUserInfo:");
    }
    id v12 = -[NSXPCDecoder _decodeReplyFromXPCObject:forSelector:]( v10,  "_decodeReplyFromXPCObject:forSelector:",  a3,  *((void *)a5 + 4));
    if (!v12)
    {
      char v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSXPCConnection %p: Decode of incoming invocation failed (no result)",  self);
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v21 userInfo:0]);
      __break(1u);
      JUMPOUT(0x182EB8F70LL);
    }

    objc_msgSend(v12, "setTarget:", objc_getProperty(a5, v11, 8, 1));
    _CFGetTSD();
    _CFSetTSD();
    v13 = (void *)atomic_load((unint64_t *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      unint64_t v14 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  sel_getName(*((SEL *)a5 + 4)));
      if (objc_getProperty(a5, v15, 48LL, 1))
      {
        v24[0] = @"_NSXPCConnectionInvocationReplyToSelectorKey";
        v24[1] = @"_NSXPCConnectionInvocationReplyUserInfoKey";
        v25[0] = v14;
        v25[1] = objc_getProperty(a5, v16, 48LL, 1);
        uint64_t v17 = (const __CFString **)v24;
        unint64_t v18 = (NSString **)v25;
        uint64_t v19 = 2LL;
      }

      else
      {
        uint64_t v22 = @"_NSXPCConnectionInvocationReplyToSelectorKey";
        uint64_t v23 = v14;
        uint64_t v17 = &v22;
        unint64_t v18 = &v23;
        uint64_t v19 = 1LL;
      }

      objc_msgSend( v12,  "setUserInfo:",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v18, v17, v19));
      [v13 connection:self handleInvocation:v12 isReply:1];
    }

    else
    {
      __NSXPCCONNECTION_IS_CALLING_OUT_TO_REPLY_BLOCK__(v12);
    }

    -[_NSXPCConnectionExpectedReplyInfo cleanup]((uint64_t)a5);
    _CFSetTSD();
  }

  else
  {
    char v20 = (os_log_s *)_NSXPCLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v27 = self;
      _os_log_fault_impl( &dword_182EB1000,  v20,  OS_LOG_TYPE_FAULT,  "%{public}@: Warning: Received reply to unknown message. Dropping incoming message and invalidating connection.",  buf,  0xCu);
    }

    -[NSXPCConnection invalidate](self, "invalidate");
  }

- (uint64_t)_removeImportedProxy:(uint64_t)result
{
  if (result)
  {
    v3 = (void *)result;
    if (!a2 || *(void *)(a2 + 40) != 1LL)
    {
      result = -[_NSXPCConnectionImportInfo removeProxy:](*(void *)(result + 72), a2);
      if ((_DWORD)result) {
        return [v3 _sendDesistForProxy:a2];
      }
    }
  }

  return result;
}

- (id)remoteObjectProxyWithErrorHandler:(void *)handler
{
  return (id)objc_msgSend( objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")),  "_initWithConnection:proxyNumber:generationCount:interface:options:error:",  self,  1,  0,  self->_remoteObjectInterface,  0,  handler);
}

- (NSString)_serviceInfoForDecoder
{
  if (result) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSXPCInterface: %@\n%@",  -[objc_class debugDescription](result[12].super.isa, "debugDescription"),  -[NSString debugDescription](result, "debugDescription"));
  }
  return result;
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke(void *a1)
{
  v5[8] = *MEMORY[0x1895F89C0];
  v1 = (unsigned int *)(*(void *)(a1[6] + 8LL) + 24LL);
  do
    unsigned int v2 = __ldaxr(v1);
  while (__stlxr(1u, v1));
  if (!v2)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_2;
    v5[3] = &unk_189C9E320;
    v3 = (const void *)a1[7];
    uint64_t v4 = a1[9];
    v5[6] = a1[8];
    v5[7] = v4;
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:]( *(void *)(a1[4] + 64LL),  v3,  (uint64_t)v5);
  }

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_2(uint64_t a1)
{
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unsigned int v2 = (unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if (!v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 64);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_4;
    v8[3] = &unk_189CA4D60;
    v8[4] = v4;
    v8[5] = a2;
    uint64_t v6 = *(const void **)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v11 = v7;
    __int128 v9 = *(_OWORD *)(a1 + 40);
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v5, v6, (uint64_t)v8);
  }

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_4(uint64_t a1)
{
  v2[1] = *MEMORY[0x1895F89C0];
  v2[0] = _replacedWithDistantObject( *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  *(void *)(a1 + 64),  0LL);
  _sendReplyArgumentsOnly( *(void *)(a1 + 32),  (uint64_t)"v@?@",  (uint64_t)v2,  1LL,  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void **)(a1 + 56));
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_5( void *a1,  uint64_t a2,  uint64_t a3)
{
  v11[11] = *MEMORY[0x1895F89C0];
  unsigned int v3 = (unsigned int *)(*(void *)(a1[7] + 8LL) + 24LL);
  do
    unsigned int v4 = __ldaxr(v3);
  while (__stlxr(1u, v3));
  if (!v4)
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = *(void *)(v5 + 64);
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_6;
    v11[3] = &unk_189CA5B68;
    v11[4] = v5;
    v11[5] = a2;
    v8 = (const void *)a1[8];
    uint64_t v9 = a1[9];
    v11[6] = v6;
    v11[7] = a3;
    uint64_t v10 = a1[10];
    v11[9] = v9;
    v11[10] = v10;
    v11[8] = a1[6];
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v7, v8, (uint64_t)v11);
  }

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_6(uint64_t a1)
{
  void v2[2] = *MEMORY[0x1895F89C0];
  v2[0] = _replacedWithDistantObject( *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  *(void *)(a1 + 72),  0LL);
  v2[1] = _replacedWithDistantObject( *(void *)(a1 + 32),  *(void *)(a1 + 56),  *(void **)(a1 + 48),  *(void *)(a1 + 72),  1LL);
  _sendReplyArgumentsOnly( *(void *)(a1 + 32),  (uint64_t)"v@?@@",  (uint64_t)v2,  2LL,  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void **)(a1 + 64));
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_7( void *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  v13[12] = *MEMORY[0x1895F89C0];
  unsigned int v4 = (unsigned int *)(*(void *)(a1[7] + 8LL) + 24LL);
  do
    unsigned int v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if (!v5)
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(v6 + 64);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_8;
    v13[3] = &unk_189CA5BB8;
    v13[4] = v6;
    v13[5] = a2;
    uint64_t v9 = (const void *)a1[8];
    uint64_t v10 = a1[9];
    v13[6] = v7;
    v13[7] = a3;
    uint64_t v11 = a1[10];
    v13[10] = v10;
    v13[11] = v11;
    uint64_t v12 = a1[6];
    v13[8] = a4;
    v13[9] = v12;
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v8, v9, (uint64_t)v13);
  }

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_8(uint64_t a1)
{
  void v2[3] = *MEMORY[0x1895F89C0];
  v2[0] = _replacedWithDistantObject( *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  *(void *)(a1 + 80),  0LL);
  v2[1] = _replacedWithDistantObject( *(void *)(a1 + 32),  *(void *)(a1 + 56),  *(void **)(a1 + 48),  *(void *)(a1 + 80),  1LL);
  void v2[2] = _replacedWithDistantObject( *(void *)(a1 + 32),  *(void *)(a1 + 64),  *(void **)(a1 + 48),  *(void *)(a1 + 80),  2LL);
  _sendReplyArgumentsOnly( *(void *)(a1 + 32),  (uint64_t)"v@?@@@",  (uint64_t)v2,  3LL,  *(void *)(a1 + 80),  *(void *)(a1 + 88),  *(void **)(a1 + 72));
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_9( uint64_t a1,  uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unsigned int v2 = (unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if (!v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(v4 + 64);
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_10;
    v10[3] = &unk_189CA5B68;
    v10[4] = v5;
    v10[5] = a2;
    v10[6] = v4;
    uint64_t v7 = *(const void **)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    __int128 v11 = *(_OWORD *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 88);
    uint64_t v12 = v8;
    uint64_t v13 = v9;
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v6, v7, (uint64_t)v10);
  }

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_10(uint64_t a1)
{
  v11[256] = *MEMORY[0x1895F89C0];
  if ((unint64_t)[*(id *)(a1 + 32) numberOfArguments] >= 2)
  {
    unint64_t v2 = 1LL;
    do
    {
      if ((*(_WORD *)([*(id *)(a1 + 32) _argInfo:v2] + 34) & 0x2000) != 0)
      {
        v11[0] = 0LL;
        [*(id *)(a1 + 40) getArgument:v11 atIndex:v2];
        id v3 = _replacedWithDistantObject(*(void *)(a1 + 48), v11[0], *(void **)(a1 + 56), *(void *)(a1 + 72), v2 - 1);
        id v10 = v3;
        if (v3)
        {
          objc_msgSend(*(id *)(a1 + 40), "_addAttachedObject:", v3, v10);
          [*(id *)(a1 + 40) setArgument:&v10 atIndex:v2];
        }
      }

      ++v2;
    }

    while (v2 < objc_msgSend(*(id *)(a1 + 32), "numberOfArguments", v10));
  }

  uint64_t v4 = -[NSXPCEncoder initWithStackSpace:size:]( objc_alloc(&OBJC_CLASS___NSXPCEncoder),  "initWithStackSpace:size:",  v11,  2048LL);
  -[NSXPCEncoder _setConnection:](v4, "_setConnection:", *(void *)(a1 + 48));
  -[NSXPCEncoder setDelegate:](v4, "setDelegate:", *(void *)(a1 + 48));
  if (*(void *)(*(void *)(a1 + 48) + 80LL)) {
    -[NSXPCCoder setUserInfo:](v4, "setUserInfo:");
  }
  -[NSXPCEncoder _encodeInvocation:isReply:into:]( v4,  "_encodeInvocation:isReply:into:",  *(void *)(a1 + 40),  1LL,  *(void *)(a1 + 64));

  char v7 = atomic_load((unsigned int *)(*(void *)(a1 + 48) + 36LL));
  uint64_t v8 = *(void *)(a1 + 48);
  if ((v7 & 0x40) != 0)
  {
    objc_msgSend(*(id *)(v8 + 152), "sendMessage:", *(void *)(a1 + 64), v5, v6);
  }

  else
  {
    uint64_t v9 = *(_xpc_connection_s **)(v8 + 8);
    if (v9) {
      xpc_connection_send_message(v9, *(xpc_object_t *)(a1 + 64));
    }
  }

+ (void)_handoffCurrentReplyToQueue:(id)a3 block:(id)a4
{
  if (_CFGetTSD())
  {
    xpc_dictionary_handoff_reply();
  }

  else
  {
    uint64_t v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: called when there is no reply context", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
    -[NSXPCConnection init](v7, v8);
  }

- (NSXPCConnection)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSXPCConnection;
  unint64_t v2 = -[NSXPCConnection init](&v4, sel_init);
  if (v2)
  {
    v2->_exportInfo = (_NSXPCConnectionExportedObjectTable *)objc_opt_new();
    v2->_importInfo = (_NSXPCConnectionImportInfo *)objc_opt_new();
    v2->_repliesExpected = (_NSXPCConnectionExpectedReplies *)objc_opt_new();
    v2->_repliesRequested = (_NSXPCConnectionRequestedReplies *)objc_opt_new();
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_eCache = (_NSXPCConnectionClassCache *)objc_opt_new();
    v2->_dCache = (_NSXPCConnectionClassCache *)objc_opt_new();
    v2->_importInfo->_generationCount = 1LL;
  }

  return v2;
}

- (uint64_t)_initWithPeerConnection:(void *)a1 name:(_xpc_connection_s *)a2 options:(__CFString *)a3
{
  handler[5] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = [a1 init];
  if (v5)
  {
    *(void *)(v5 + 104) = -[__CFString copy](a3, "copy");
    uint64_t pid = xpc_connection_get_pid(a2);
    char v7 = @"anonymous";
    if (a3) {
      char v7 = a3;
    }
    SEL v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.NSXPCConnection.user.%@.%d",  v7,  pid);
    uint64_t v9 = (unsigned int *)(v5 + 36);
    do
      unsigned int v10 = __ldaxr(v9);
    while (__stlxr(v10 | 0x10, v9));
    __int128 v11 = -[NSString UTF8String](v8, "UTF8String");
    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    *(void *)(v5 + 24) = dispatch_queue_create_with_target_V2(v11, v12, global_queue);
    uint64_t v14 = (_xpc_connection_s *)xpc_retain(a2);
    *(void *)(v5 + 8) = v14;
    xpc_connection_set_target_queue(v14, *(dispatch_queue_t *)(v5 + 24));
    SEL v15 = *(_xpc_connection_s **)(v5 + 8);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    void handler[2] = __56__NSXPCConnection__initWithPeerConnection_name_options___block_invoke;
    handler[3] = &unk_189C9F968;
    handler[4] = v5;
    xpc_connection_set_event_handler(v15, handler);
  }

  return v5;
}

void __56__NSXPCConnection__initWithPeerConnection_name_options___block_invoke(uint64_t a1, void *a2)
{
}

- (uint64_t)_initWithRemotePeerConnection:(void *)a1 name:(uint64_t)a2 options:(__CFString *)a3
{
  v21[5] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = [a1 init];
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = (unsigned int *)(v5 + 36);
    do
      unsigned int v8 = __ldaxr(v7);
    while (__stlxr(v8 | 0x40, v7));
    *(void *)(v5 + 104) = -[__CFString copy](a3, "copy");
    uint64_t v9 = @"anonymous";
    if (a3) {
      uint64_t v9 = a3;
    }
    unsigned int v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.NSXPCConnection.user.%@.remote",  v9);
    do
      unsigned int v11 = __ldaxr(v7);
    while (__stlxr(v11 | 0x10, v7));
    uint64_t v12 = -[NSString UTF8String](v10, "UTF8String");
    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    *(void *)(v6 + 24) = dispatch_queue_create_with_target_V2(v12, v13, global_queue);
    SEL v15 = -[_NSXPCRemoteTransport initWithConnection:]( objc_alloc(&OBJC_CLASS____NSXPCRemoteTransport),  "initWithConnection:",  a2);
    *(void *)(v6 + 152) = v15;
    -[_NSXPCRemoteTransport setTargetQueue:](v15, "setTargetQueue:", *(void *)(v6 + 24));
    uint64_t v16 = MEMORY[0x1895F87A8];
    uint64_t v17 = *(void **)(v6 + 152);
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke;
    v21[3] = &unk_189C9F968;
    v21[4] = v6;
    [v17 setErrorHandler:v21];
    unint64_t v18 = *(void **)(v6 + 152);
    v20[0] = v16;
    v20[1] = 3221225472LL;
    v20[2] = __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke_2;
    v20[3] = &unk_189CA5C30;
    v20[4] = v6;
    [v18 setMessageHandler:v20];
  }

  return v6;
}

void __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
}

- (id)_initWithRemoteService:(id)a3 name:(id)a4 options:(unint64_t)a5 mode:(unint64_t)a6
{
  v22[5] = *MEMORY[0x1895F89C0];
  uint64_t v9 = -[NSXPCConnection init](self, "init", a3, a4, a5);
  unsigned int v10 = v9;
  if (v9)
  {
    p_state2 = &v9->_state2;
    do
      unsigned int v12 = __ldaxr(p_state2);
    while (__stlxr(v12 | 0x40, p_state2));
    uint64_t v13 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.NSXPCConnection.r-user.%@",  v9->_serviceName),  "UTF8String");
    uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v10->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v13, v14, global_queue);
    uint64_t v16 = -[_NSXPCRemoteTransport initWithRemoteService:name:queue:mode:]( objc_alloc(&OBJC_CLASS____NSXPCRemoteTransport),  "initWithRemoteService:name:queue:mode:",  a3,  a4,  v10->_userQueue,  a6);
    v10->_transport = (_NSXPCTransport *)v16;
    -[_NSXPCRemoteTransport setTargetQueue:](v16, "setTargetQueue:", v10->_userQueue);
    uint64_t v17 = MEMORY[0x1895F87A8];
    transport = v10->_transport;
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke;
    v22[3] = &unk_189C9F968;
    v22[4] = v10;
    -[_NSXPCTransport setErrorHandler:](transport, "setErrorHandler:", v22);
    uint64_t v19 = v10->_transport;
    v21[0] = v17;
    v21[1] = 3221225472LL;
    v21[2] = __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke_2;
    v21[3] = &unk_189CA5C30;
    v21[4] = v10;
    -[_NSXPCTransport setMessageHandler:](v19, "setMessageHandler:", v21);
    -[NSString UTF8String](v10->_serviceName, "UTF8String");
  }

  return v10;
}

void __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
}

- (id)_initWithRemoteService:(id)a3 name:(id)a4 options:(unint64_t)a5
{
  return -[NSXPCConnection _initWithRemoteService:name:options:mode:]( self,  "_initWithRemoteService:name:options:mode:",  a3,  a4,  a5,  0LL);
}

- (id)_initWithRemoteConnection:(id)a3 name:(id)a4
{
  v18[5] = *MEMORY[0x1895F89C0];
  uint64_t v5 = -[NSXPCConnection init](self, "init", a3, a4);
  uint64_t v6 = v5;
  if (v5)
  {
    p_state2 = &v5->_state2;
    do
      unsigned int v8 = __ldaxr(p_state2);
    while (__stlxr(v8 | 0x40, p_state2));
    uint64_t v9 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.NSXPCConnection.r-user.%@",  v5->_serviceName),  "UTF8String");
    unsigned int v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v6->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v9, v10, global_queue);
    unsigned int v12 = -[_NSXPCRemoteTransport initWithConnection:]( objc_alloc(&OBJC_CLASS____NSXPCRemoteTransport),  "initWithConnection:",  a3);
    v6->_transport = (_NSXPCTransport *)v12;
    -[_NSXPCRemoteTransport setTargetQueue:](v12, "setTargetQueue:", v6->_userQueue);
    uint64_t v13 = MEMORY[0x1895F87A8];
    transport = v6->_transport;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke;
    v18[3] = &unk_189C9F968;
    v18[4] = v6;
    -[_NSXPCTransport setErrorHandler:](transport, "setErrorHandler:", v18);
    SEL v15 = v6->_transport;
    v17[0] = v13;
    v17[1] = 3221225472LL;
    v17[2] = __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke_2;
    v17[3] = &unk_189CA5C30;
    v17[4] = v6;
    -[_NSXPCTransport setMessageHandler:](v15, "setMessageHandler:", v17);
    -[NSString UTF8String](v6->_serviceName, "UTF8String");
  }

  return v6;
}

void __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
}

- (NSXPCConnection)initWithServiceName:(id)a3 options:(unint64_t)a4
{
  handler[5] = *MEMORY[0x1895F89C0];
  uint64_t v6 = -[NSXPCConnection init](self, "init", a3, a4);
  if (!v6) {
    return v6;
  }
  char v7 = -[NSFileManager fileSystemRepresentationWithPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileSystemRepresentationWithPath:",  a3);
  if (!v7)
  {

    char v7 = 0LL;
  }

  unsigned int v8 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.NSXPCConnection.user.%@",  a3),  "UTF8String");
  uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v6->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v8, v9, global_queue);
  v6->_serviceName = (NSString *)[a3 copy];
  unsigned int v11 = xpc_connection_create(v7, (dispatch_queue_t)v6->_userQueue);
  v6->_connection.xpc = v11;
  if (v11)
  {
    xpc_connection_set_target_queue(v11, (dispatch_queue_t)v6->_userQueue);
    xpc = v6->_connection.xpc;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    void handler[2] = __47__NSXPCConnection_initWithServiceName_options___block_invoke;
    handler[3] = &unk_189C9F968;
    handler[4] = v6;
    xpc_connection_set_event_handler(xpc, handler);
    -[NSString UTF8String](v6->_serviceName, "UTF8String");
    return v6;
  }

  uint64_t v14 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Unable to connect to the specified name (%@). No connection was created.", _NSMethodExceptionProem((objc_class *)v6, a2), v6->_serviceName), 0 reason userInfo];
  objc_exception_throw(v14);
  objc_exception_rethrow();
  __break(1u);
  return result;
}

void __47__NSXPCConnection_initWithServiceName_options___block_invoke(uint64_t a1, void *a2)
{
}

- (NSXPCConnection)initWithServiceName:(NSString *)serviceName
{
  return -[NSXPCConnection initWithServiceName:options:](self, "initWithServiceName:options:", serviceName, 0LL);
}

- (NSXPCConnection)initWithMachServiceName:(NSString *)name options:(NSXPCConnectionOptions)options
{
  handler[5] = *MEMORY[0x1895F89C0];
  char v7 = -[NSXPCConnection init](self, "init");
  if (!v7) {
    return v7;
  }
  unsigned int v8 = -[NSFileManager fileSystemRepresentationWithPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileSystemRepresentationWithPath:",  name);
  if (!v8)
  {

    unsigned int v8 = 0LL;
  }

  uint64_t v9 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.NSXPCConnection.m-user.%@",  name),  "UTF8String");
  unsigned int v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v7->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v9, v10, global_queue);
  v7->_serviceName = (NSString *)-[NSString copy](name, "copy");
  mach_service = xpc_connection_create_mach_service(v8, (dispatch_queue_t)v7->_userQueue, (options >> 11) & 2);
  v7->_connection.xpc = mach_service;
  if (mach_service)
  {
    xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)v7->_userQueue);
    xpc = v7->_connection.xpc;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    void handler[2] = __51__NSXPCConnection_initWithMachServiceName_options___block_invoke;
    handler[3] = &unk_189C9F968;
    handler[4] = v7;
    xpc_connection_set_event_handler(xpc, handler);
    -[NSString UTF8String](v7->_serviceName, "UTF8String");
    return v7;
  }

  SEL v15 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Unable to connect to the specified name (%@). No connection was created.", _NSMethodExceptionProem((objc_class *)v7, a2), v7->_serviceName), 0 reason userInfo];
  objc_exception_throw(v15);
  objc_exception_rethrow();
  __break(1u);
  return result;
}

- (NSXPCConnection)initWithMachServiceName:(id)a3
{
  return -[NSXPCConnection initWithMachServiceName:options:](self, "initWithMachServiceName:options:", a3, 0LL);
}

- (NSXPCConnection)initWithListenerEndpoint:(NSXPCListenerEndpoint *)endpoint
{
  handler[5] = *MEMORY[0x1895F89C0];
  uint64_t v5 = -[NSXPCConnection init](self, "init");
  if (!v5) {
    return v5;
  }
  uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v5->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2( "com.apple.NSXPCConnection.user.endpoint",  v6,  global_queue);
  p_state2 = &v5->_state2;
  do
    unsigned int v9 = __ldaxr(p_state2);
  while (__stlxr(v9 | 0x20, p_state2));
  if (-[NSXPCListenerEndpoint _endpoint](endpoint, "_endpoint"))
  {
    unsigned int v10 = xpc_connection_create_from_endpoint((xpc_endpoint_t)-[NSXPCListenerEndpoint _endpoint](endpoint, "_endpoint"));
    v5->_connection.xpc = v10;
    if (v10)
    {
      xpc_connection_set_target_queue(v10, (dispatch_queue_t)v5->_userQueue);
      xpc = v5->_connection.xpc;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      void handler[2] = __44__NSXPCConnection_initWithListenerEndpoint___block_invoke;
      handler[3] = &unk_189C9F968;
      handler[4] = v5;
      xpc_connection_set_event_handler(xpc, handler);
      v5->_endpoint = endpoint;
      return v5;
    }

    uint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Unable to connect to the specified endpoint. No connection was created.",  _NSMethodExceptionProem((objc_class *)v5, a2));
  }

  else
  {
    uint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Endpoint argument is NULL.",  _NSMethodExceptionProem((objc_class *)v5, a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v13 userInfo:0]);
  __44__NSXPCConnection_initWithListenerEndpoint___block_invoke(v14, v15);
  return result;
}

void __44__NSXPCConnection_initWithListenerEndpoint___block_invoke(uint64_t a1, void *a2)
{
}

- (id)_initWithCustomTransport:(id)a3
{
  v15[5] = *MEMORY[0x1895F89C0];
  objc_super v4 = -[NSXPCConnection init](self, "init");
  if (v4)
  {
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v4->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2( "com.apple.NSXPCConnection.user.endpoint",  v5,  global_queue);
    p_state2 = &v4->_state2;
    do
      unsigned int v8 = __ldaxr(p_state2);
    while (__stlxr(v8 | 0x40, p_state2));
    unsigned int v9 = (_NSXPCTransport *)a3;
    v4->_transport = v9;
    -[_NSXPCTransport setTargetQueue:](v9, "setTargetQueue:", v4->_userQueue);
    uint64_t v10 = MEMORY[0x1895F87A8];
    transport = v4->_transport;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __44__NSXPCConnection__initWithCustomTransport___block_invoke;
    v15[3] = &unk_189C9F968;
    v15[4] = v4;
    -[_NSXPCTransport setErrorHandler:](transport, "setErrorHandler:", v15);
    unsigned int v12 = v4->_transport;
    v14[0] = v10;
    v14[1] = 3221225472LL;
    v14[2] = __44__NSXPCConnection__initWithCustomTransport___block_invoke_2;
    v14[3] = &unk_189CA5C30;
    v14[4] = v4;
    -[_NSXPCTransport setMessageHandler:](v12, "setMessageHandler:", v14);
  }

  return v4;
}

void __44__NSXPCConnection__initWithCustomTransport___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __44__NSXPCConnection__initWithCustomTransport___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1895F89C0];

  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {

    self->_id interruptionHandler = 0LL;
  }

  id invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {

    self->_id invalidationHandler = 0LL;
  }

  bootstrap = self->_bootstrap;
  if (bootstrap) {
    xpc_release(bootstrap);
  }
  userQueue = (dispatch_object_s *)self->_userQueue;
  if (userQueue) {
    dispatch_release(userQueue);
  }

  xpc = self->_connection.xpc;
  if (xpc) {
    xpc_release(xpc);
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSXPCConnection;
  -[NSXPCConnection dealloc](&v8, sel_dealloc);
}

- (void)suspend
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0) {
    -[_NSXPCTransport suspend](self->_transport, "suspend");
  }
  else {
    xpc_connection_suspend(self->_connection.xpc);
  }
}

- (void)resume
{
  p_state = (unsigned __int8 *)&self->_state;
  do
    unsigned __int8 v4 = __ldaxr(p_state);
  while (__stlxr(v4 | 4, p_state));
  if ((v4 & 4) == 0) {
    CFRetain(self);
  }
  -[_NSXPCConnectionImportInfo _clearEntitlementCache]((uint64_t)self->_importInfo);
  char v5 = atomic_load(&self->_state2);
  if ((v5 & 0x40) != 0) {
    -[_NSXPCTransport resume](self->_transport, "resume");
  }
  else {
    xpc_connection_resume(self->_connection.xpc);
  }
}

- (void)activate
{
  p_state = (unsigned __int8 *)&self->_state;
  do
    unsigned __int8 v4 = __ldaxr(p_state);
  while (__stlxr(v4 | 4, p_state));
  if ((v4 & 4) == 0) {
    CFRetain(self);
  }
  -[_NSXPCConnectionImportInfo _clearEntitlementCache]((uint64_t)self->_importInfo);
  char v5 = atomic_load(&self->_state2);
  if ((v5 & 0x40) != 0)
  {
    -[_NSXPCTransport activate](self->_transport, "activate");
  }

  else
  {
    xpc = self->_connection.xpc;
    if (xpc) {
      xpc_connection_activate(xpc);
    }
  }

- (void)invalidate
{
  p_state2 = &self->_state2;
  do
    unsigned int v3 = __ldaxr(p_state2);
  while (__stlxr(v3 | 8, p_state2));
  char v4 = atomic_load(&self->_state2);
  if ((v4 & 0x40) != 0)
  {
    -[_NSXPCTransport cancel](self->_transport, "cancel");
  }

  else
  {
    xpc = self->_connection.xpc;
    if (xpc) {
      xpc_connection_cancel(xpc);
    }
  }

- (void)scheduleSendBarrierBlock:(void *)block
{
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    -[_NSXPCTransport sendBarrierBlock:](self->_transport, "sendBarrierBlock:", block);
  }

  else
  {
    xpc = self->_connection.xpc;
    if (xpc) {
      xpc_connection_send_barrier(xpc, block);
    }
  }

- (void)_sendDesistForProxy:(id)a3
{
  if (a3)
  {
    uint64_t v4 = *((void *)a3 + 5);
    if (v4 == 1) {
      return;
    }
    uint64_t v5 = *((void *)a3 + 6);
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
  }

  if (v5 == self->_importInfo->_generationCount)
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "f", 0xDuLL);
    xpc_dictionary_set_uint64(v6, "proxynum", v4);
    char v7 = atomic_load(&self->_state2);
    if ((v7 & 0x40) != 0)
    {
      -[_NSXPCTransport sendNotification:](self->_transport, "sendNotification:", v6);
    }

    else if (self->_connection.xpc)
    {
      xpc_connection_send_notification();
    }

    xpc_release(v6);
  }

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4
{
  if (a4) {
    id Property = objc_getProperty(a4, a2, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:]( self,  "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:",  0,  0,  0,  [Property _methodSignatureForRemoteSelector:a3],  a3,  a4);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  if (a4) {
    id Property = objc_getProperty(a4, a2, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:]( self,  "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:",  0,  &v9,  1,  objc_msgSend(Property, "_methodSignatureForRemoteSelector:", a3, v9, v10),  a3,  a4);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6
{
  v12[2] = *MEMORY[0x1895F89C0];
  if (a4) {
    id Property = objc_getProperty(a4, a2, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v12[0] = a5;
  v12[1] = a6;
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:]( self,  "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:",  0,  v12,  2,  [Property _methodSignatureForRemoteSelector:a3],  a3,  a4);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6 arg3:(id)a7
{
  v14[3] = *MEMORY[0x1895F89C0];
  if (a4) {
    id Property = objc_getProperty(a4, a2, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v14[0] = a5;
  v14[1] = a6;
  v14[2] = a7;
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:]( self,  "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:",  0,  v14,  3,  [Property _methodSignatureForRemoteSelector:a3],  a3,  a4);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6 arg3:(id)a7 arg4:(id)a8
{
  v16[4] = *MEMORY[0x1895F89C0];
  if (a4) {
    id Property = objc_getProperty(a4, a2, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v16[0] = a5;
  v16[1] = a6;
  v16[2] = a7;
  v16[3] = a8;
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:]( self,  "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:",  0,  v16,  4,  [Property _methodSignatureForRemoteSelector:a3],  a3,  a4);
}

void __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke( uint64_t a1)
{
  v5[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = @"NSDebugDescription";
  v5[0] = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"The %@ was interrupted, but the message was sent over an additional proxy and therefore this proxy has become invalid.",  [*(id *)(a1 + 32) _errorDescription]);
  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4099,  [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:&v4 count:1]);
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 16LL, 1);
  }
  __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)Property);
  -[_NSXPCConnectionExpectedReplyInfo cleanup](*(void *)(a1 + 40));
}

uint64_t __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelProgress:*(void *)(a1 + 40)];
}

uint64_t __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_3( uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseProgress:*(void *)(a1 + 40)];
}

uint64_t __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeProgress:*(void *)(a1 + 40)];
}

- (void)setInterruptionHandler:(void *)interruptionHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_interruptionHandler;
  if (v6 != interruptionHandler)
  {
    if (v6) {

    }
    else {
      char v7 = 0LL;
    }
    self->_id interruptionHandler = v7;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)interruptionHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[self->_interruptionHandler copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setInvalidationHandler:(void *)invalidationHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_invalidationHandler;
  if (v6 != invalidationHandler)
  {
    if (v6) {

    }
    if (invalidationHandler) {
      char v7 = (void *)[invalidationHandler copy];
    }
    else {
      char v7 = 0LL;
    }
    self->_id invalidationHandler = v7;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidationHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[self->_invalidationHandler copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)set_additionalInvalidationHandler:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_setAssociatedObject(self, "additionalInvalidationHandler", a3, (void *)0x303);
  os_unfair_lock_unlock(p_lock);
}

- (id)_additionalInvalidationHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)objc_msgSend(objc_getAssociatedObject(self, "additionalInvalidationHandler"), "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setOptions:(unint64_t)a3
{
  __int16 v3 = a3;
  if ((a3 & 0x100) != 0)
  {
    char v6 = atomic_load(&self->_state2);
    if ((v6 & 0x40) != 0) {
      goto LABEL_7;
    }
    xpc_connection_set_legacy();
  }

  if ((v3 & 0x1000) == 0) {
    return;
  }
  char v7 = atomic_load(&self->_state2);
  if ((v7 & 0x40) == 0)
  {
    xpc_connection_set_privileged();
    return;
  }

- (void)_setLanguages:(id)a3
{
  char v4 = atomic_load(&self->_state2);
  if ((v4 & 0x40) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    if (self->_bootstrap)
    {
      if (a3)
      {
LABEL_4:
        _CFBundleSetupXPCBootstrapWithLanguages();
LABEL_7:
        xpc_connection_set_bootstrap();
        os_unfair_lock_unlock(&self->_lock);
        return;
      }
    }

    else
    {
      self->_bootstrap = (OS_xpc_object *)xpc_dictionary_create(0LL, 0LL, 0LL);
      if (a3) {
        goto LABEL_4;
      }
    }

    _CFBundleSetupXPCBootstrap();
    goto LABEL_7;
  }

  char v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Custom transports do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v6);
  -[NSXPCConnection _setBootstrapObject:forKey:](v7, v8, v9, v10);
}

- (void)_setBootstrapObject:(id)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  bootstrap = self->_bootstrap;
  if (!bootstrap)
  {
    bootstrap = (OS_xpc_object *)xpc_dictionary_create(0LL, 0LL, 0LL);
    self->_bootstrap = bootstrap;
  }

  xpc_dictionary_set_value(bootstrap, (const char *)[a4 UTF8String], a3);
  xpc_connection_set_bootstrap();
  os_unfair_lock_unlock(p_lock);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_transport;
    if (result)
    {
      return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
    }

    else
    {
      *(_OWORD *)retstr->var0 = 0u;
      *(_OWORD *)&retstr->var0[4] = 0u;
    }
  }

  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)xpc_connection_get_audit_token();
  }

  return result;
}

- (id)valueForEntitlement:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (self)
  {
    -[NSXPCConnection auditToken](self, "auditToken");
  }

  else
  {
    __int128 v8 = 0u;
    __int128 v9 = 0u;
  }

  importInfo = (os_unfair_lock_s *)self->_importInfo;
  v7[0] = v8;
  v7[1] = v9;
  return -[_NSXPCConnectionImportInfo _valueForEntitlement:auditToken:](importInfo, (uint64_t)a3, v7);
}

+ (NSXPCConnection)currentConnection
{
  return (NSXPCConnection *)(id)_CFGetTSD();
}

+ (void)_currentBoost
{
  result = (void *)_CFGetTSD();
  if (result) {
    return -[_NSXPCBoost _initWithEvent:](objc_alloc(&OBJC_CLASS____NSXPCBoost), result);
  }
  return result;
}

- (id)userInfo
{
  return self->_otherInfo;
}

- (void)setUserInfo:(id)a3
{
  otherInfo = self->_otherInfo;
  if (otherInfo != a3)
  {

    self->_otherInfo = a3;
  }

- (void)setDelegate:(id)a3
{
  char v4 = objc_opt_respondsToSelector();
  p_state2 = &self->_state2;
  if ((v4 & 1) != 0)
  {
    do
      unsigned int v6 = __ldaxr(p_state2);
    while (__stlxr(v6 | 2, p_state2));
  }

  else
  {
    do
      unsigned int v7 = __ldaxr(p_state2);
    while (__stlxr(v7 & 0xFFFFFFFD, p_state2));
  }

- (id)delegate
{
  return (id)atomic_load((unint64_t *)&self->_delegate);
}

- (id)replacementObjectForEncoder:(id)a3 object:(id)a4
{
  char v5 = atomic_load(&self->_state2);
  if ((v5 & 2) == 0) {
    return a4;
  }
  unsigned int v7 = (void *)atomic_load((unint64_t *)&self->_delegate);
  return (id)objc_msgSend(v7, "replacementObjectForXPCConnection:encoder:object:");
}

- (void)_setQueue:(id)a3
{
  if (a3)
  {
    userQueue = self->_userQueue;
    if (userQueue) {
      BOOL v6 = userQueue == a3;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      dispatch_retain((dispatch_object_t)a3);
      unsigned int v7 = (dispatch_object_s *)self->_userQueue;
      self->_userQueue = (OS_dispatch_queue *)a3;
      char v8 = atomic_load(&self->_state2);
      if ((v8 & 0x40) != 0) {
        -[_NSXPCTransport setTargetQueue:](self->_transport, "setTargetQueue:", a3);
      }
      else {
        xpc_connection_set_target_queue(self->_connection.xpc, (dispatch_queue_t)a3);
      }
      dispatch_release(v7);
    }
  }

  else
  {
    __int128 v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: The queue parameter is NULL, which is invalid", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    -[NSXPCConnection _queue](v10, v11);
  }

- (id)_queue
{
  return self->_userQueue;
}

- (id)_errorDescription
{
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0) {
    uint64_t pid = -[_NSXPCTransport processIdentifier](self->_transport, "processIdentifier");
  }
  else {
    uint64_t pid = xpc_connection_get_pid(self->_connection.xpc);
  }
  char v5 = atomic_load(&self->_state2);
  if ((v5 & 0x10) != 0)
  {
    if ((_DWORD)pid) {
      unsigned int v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" from pid %d", pid);
    }
    else {
      unsigned int v7 = (NSString *)&stru_189CA6A28;
    }
    serviceName = self->_serviceName;
    if (serviceName && -[NSString length](serviceName, "length"))
    {
      SEL v11 = @"custom";
      if ((v3 & 0x40) == 0) {
        SEL v11 = @"mach";
      }
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"connection%@ on %@ service named %@",  v7,  v11,  self->_serviceName);
    }

    else
    {
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"connection%@ on anonymousListener or serviceListener",  v7,  v12,  v13);
    }
  }

  else
  {
    if ((_DWORD)pid) {
      BOOL v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" with pid %d", pid);
    }
    else {
      BOOL v6 = (NSString *)&stru_189CA6A28;
    }
    char v8 = atomic_load(&self->_state2);
    if ((v8 & 0x20) != 0) {
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"connection to service%@ created from an endpoint",  v6,  v12,  v13);
    }
    else {
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"connection to service%@ named %@",  v6,  self->_serviceName,  v13);
    }
  }

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCConnection;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[NSXPCConnection description](&v3, sel_description),  -[NSXPCConnection _errorDescription](self, "_errorDescription"));
}

- (id)exportedObject
{
  return -[_NSXPCConnectionExportedObjectTable exportedObjectForProxyNumber:]( (os_unfair_lock_s *)self->_exportInfo,  (const void *)1);
}

- (void)setExportedObject:(id)exportedObject
{
}

- (NSXPCInterface)exportedInterface
{
  return (NSXPCInterface *)-[_NSXPCConnectionExportedObjectTable interfaceForProxyNumber:]( (os_unfair_lock_s *)self->_exportInfo,  (const void *)1);
}

- (void)setExportedInterface:(NSXPCInterface *)exportedInterface
{
}

- (id)remoteObjectProxy
{
  return (id)objc_msgSend( objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")),  "_initWithConnection:proxyNumber:generationCount:interface:options:error:",  self,  1,  0,  self->_remoteObjectInterface,  0,  0);
}

- (id)_unboostingRemoteObjectProxy
{
  return (id)objc_msgSend( objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")),  "_initWithConnection:proxyNumber:generationCount:interface:options:error:",  self,  1,  0,  self->_remoteObjectInterface,  2,  0);
}

- (id)remoteObjectProxyWithUserInfo:(id)a3 errorHandler:(id)a4
{
  id v5 = (id)objc_msgSend( objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")),  "_initWithConnection:proxyNumber:generationCount:interface:options:error:",  self,  1,  0,  self->_remoteObjectInterface,  0,  a4);
  objc_msgSend(v5, "set_userInfo:", a3);
  return v5;
}

- (id)remoteObjectProxyWithTimeout:(double)a3 errorHandler:(id)a4
{
  id result = (id)objc_msgSend( objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")),  "_initWithConnection:proxyNumber:generationCount:interface:options:error:",  self,  1,  0,  self->_remoteObjectInterface,  0,  a4);
  if (result) {
    *((double *)result + 8) = a3;
  }
  return result;
}

- (au_asid_t)auditSessionIdentifier
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0) {
    return -[_NSXPCTransport auditSessionIdentifier](self->_transport, "auditSessionIdentifier");
  }
  else {
    return xpc_connection_get_asid(self->_connection.xpc);
  }
}

- (pid_t)processIdentifier
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0) {
    return -[_NSXPCTransport processIdentifier](self->_transport, "processIdentifier");
  }
  else {
    return xpc_connection_get_pid(self->_connection.xpc);
  }
}

- (uid_t)effectiveUserIdentifier
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0) {
    return -[_NSXPCTransport effectiveUserIdentifier](self->_transport, "effectiveUserIdentifier");
  }
  else {
    return xpc_connection_get_euid(self->_connection.xpc);
  }
}

- (gid_t)effectiveGroupIdentifier
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0) {
    return -[_NSXPCTransport effectiveGroupIdentifier](self->_transport, "effectiveGroupIdentifier");
  }
  else {
    return xpc_connection_get_egid(self->_connection.xpc);
  }
}

- (void)_setUUID:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    uint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Custom transports do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v4);
  }

  [a3 getUUIDBytes:v5];
  xpc_connection_set_instance();
}

- (void)_setTargetUserIdentifier:(unsigned int)a3
{
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    uint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Custom transports do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v4);
    -[NSXPCConnection _killConnection:](v5, v6, v7);
  }

  else
  {
    xpc_connection_set_target_uid();
  }

- (void)_killConnection:(int)a3
{
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    uint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Custom transports do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v4);
    -[NSXPCConnection _xpcConnection](v5, v6);
  }

  else
  {
    xpc_connection_kill();
  }

- (id)_xpcConnection
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) == 0) {
    return self->_connection.xpc;
  }
  uint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Custom transports do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v4);
  return (id)-[NSXPCConnection _sendProgressMessage:forSequence:](v5, v6);
}

- (uint64_t)_sendProgressMessage:(uint64_t)a3 forSequence:
{
  if (result)
  {
    uint64_t v5 = result;
    xpc_dictionary_set_uint64(xdict, "f", 0x15uLL);
    xpc_dictionary_set_uint64(xdict, "sequence", a3);
    char v6 = atomic_load((unsigned int *)(v5 + 36));
    if ((v6 & 0x40) != 0) {
      return [*(id *)(v5 + 152) sendNotification:xdict];
    }
    else {
      return xpc_connection_send_notification();
    }
  }

  return result;
}

- (void)_cancelProgress:(unint64_t)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v5, "f", 0x10015uLL);
  xpc_dictionary_set_uint64(v5, "sequence", a3);
  char v6 = atomic_load(&self->_state2);
  if ((v6 & 0x40) != 0) {
    -[_NSXPCTransport sendNotification:](self->_transport, "sendNotification:", v5);
  }
  else {
    xpc_connection_send_notification();
  }
  xpc_release(v5);
}

- (void)_pauseProgress:(unint64_t)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v5, "f", 0x20015uLL);
  xpc_dictionary_set_uint64(v5, "sequence", a3);
  char v6 = atomic_load(&self->_state2);
  if ((v6 & 0x40) != 0) {
    -[_NSXPCTransport sendNotification:](self->_transport, "sendNotification:", v5);
  }
  else {
    xpc_connection_send_notification();
  }
  xpc_release(v5);
}

- (void)_resumeProgress:(unint64_t)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v5, "f", 0x40015uLL);
  xpc_dictionary_set_uint64(v5, "sequence", a3);
  char v6 = atomic_load(&self->_state2);
  if ((v6 & 0x40) != 0) {
    -[_NSXPCTransport sendNotification:](self->_transport, "sendNotification:", v5);
  }
  else {
    xpc_connection_send_notification();
  }
  xpc_release(v5);
}

- (void)_decodeProgressMessageWithData:(id)a3 flags:(unint64_t)a4
{
  int v4 = a4;
  uint64 = (const void *)xpc_dictionary_get_uint64(a3, "sequence");
  if ((v4 & 0x10000) != 0)
  {
    -[os_unfair_lock_s cancel]( -[_NSXPCConnectionRequestedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesRequested, uint64),  "cancel");
  }

  else if ((v4 & 0x20000) != 0)
  {
    -[os_unfair_lock_s pause]( -[_NSXPCConnectionRequestedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesRequested, uint64),  "pause");
  }

  else if ((v4 & 0x40000) != 0)
  {
    -[os_unfair_lock_s resume]( -[_NSXPCConnectionRequestedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesRequested, uint64),  "resume");
  }

  else
  {
    char v8 = -[_NSXPCConnectionExpectedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesExpected, uint64);
    -[NSProgress _receiveProgressMessage:forSequence:](v8, a3);
  }

- (NSXPCInterface)remoteObjectInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setRemoteObjectInterface:(NSXPCInterface *)remoteObjectInterface
{
}

@end