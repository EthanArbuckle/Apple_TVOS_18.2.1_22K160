@interface CUPairingDaemon
+ (id)sharedPairingDaemon;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)testMode;
- (CUPairingDaemon)init;
- (NSString)description;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_copyHomeKitExWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)_copyHomeKitLocalPairingIDWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)_copyHomeKitWithOptionsHAP:(unint64_t)a3 error:(int *)a4;
- (id)_copyHomeKitWithOptionsKeychain:(unint64_t)a3 error:(int *)a4;
- (id)_copyIdentityWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)_copyOrCreateWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)_copyPairedPeersWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)_findHomeKitExPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5;
- (id)_findHomeKitPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5;
- (id)_findPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5;
- (id)copyIdentityWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)copyPairedPeersWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)detailedDescription;
- (id)findPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5;
- (id)initStandalone;
- (int)_deleteIdentityWithOptions:(unint64_t)a3;
- (int)_removePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5;
- (int)_saveIdentity:(id)a3 options:(unint64_t)a4;
- (int)_savePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5;
- (int)deleteIdentityWithOptions:(unint64_t)a3;
- (int)removePairedPeer:(id)a3 options:(unint64_t)a4;
- (int)removePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5;
- (int)savePairedPeer:(id)a3 options:(unint64_t)a4;
- (int)savePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5;
- (void)_activate;
- (void)_connectionInvalidated:(id)a3;
- (void)_invalidate;
- (void)_removeDups:(id)a3;
- (void)_rpIdentityUpdate;
- (void)activate;
- (void)dealloc;
- (void)getIdentityWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)reset;
- (void)setDispatchQueue:(id)a3;
- (void)setTestMode:(BOOL)a3;
@end

@implementation CUPairingDaemon

- (CUPairingDaemon)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUPairingDaemon;
  v2 = -[CUPairingDaemon init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_rpIdentityNotifier = -1;
    objc_storeStrong((id *)&gPairingDaemon, v2);
    v3 = v2;
  }

  return v2;
}

- (id)initStandalone
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUPairingDaemon;
  v2 = -[CUPairingDaemon init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_rpIdentityNotifier = -1;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  if (self->_xpcListener) {
    FatalErrorF("XPC listener still active during dealloc");
  }
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CUPairingDaemon;
  -[CUPairingDaemon dealloc](&v2, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)NSPrintF();
}

- (id)detailedDescription
{
  uint64_t v106 = *MEMORY[0x1895F89C0];
  CFMutableStringRef v102 = 0LL;
  NSAppendPrintF(&v102);
  v3 = v102;
  id v4 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 2LL, 0LL);
  objc_super v5 = v4;
  if (v4)
  {
    v101 = v3;
    id v63 = v4;
    v6 = (id *)&v101;
    v7 = &v101;
  }

  else
  {
    v100 = v3;
    v6 = (id *)&v100;
    v7 = &v100;
  }

  NSAppendPrintF(v7);
  id v8 = *v6;

  id v9 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 6LL, 0LL);
  if (v9)
  {
    id v99 = v8;
    id v63 = v9;
    v10 = &v99;
    v11 = (CFMutableStringRef *)&v99;
  }

  else
  {
    id v98 = v8;
    v10 = &v98;
    v11 = (CFMutableStringRef *)&v98;
  }

  NSAppendPrintF(v11);
  id v12 = *v10;

  id v13 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 10LL, 0LL);
  if (v13)
  {
    id v97 = v12;
    id v63 = v13;
    v14 = &v97;
    v15 = (CFMutableStringRef *)&v97;
  }

  else
  {
    id v96 = v12;
    v14 = &v96;
    v15 = (CFMutableStringRef *)&v96;
  }

  NSAppendPrintF(v15);
  v16 = (__CFString *)*v14;

  if (GestaltGetDeviceClass_sOnce != -1) {
    dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13042);
  }
  if (GestaltGetDeviceClass_deviceClass == 7 || GestaltGetDeviceClass_deviceClass == 4)
  {
    id v17 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 18LL, 0LL, v63);

    if (v17)
    {
      CFMutableStringRef v95 = v16;
      id v63 = v17;
      v18 = &v95;
      NSAppendPrintF(&v95);
      id v13 = v17;
    }

    else
    {
      CFMutableStringRef v94 = v16;
      v18 = &v94;
      NSAppendPrintF(&v94);
      id v13 = 0LL;
    }

    v19 = *v18;

    v16 = v19;
  }

  id v20 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 34LL, 0LL, v63);

  if (v20)
  {
    v93 = v16;
    v21 = (id *)&v93;
    v22 = &v93;
  }

  else
  {
    v92 = v16;
    v21 = (id *)&v92;
    v22 = &v92;
  }

  NSAppendPrintF(v22);
  id v23 = *v21;

  id v24 = -[CUPairingDaemon copyIdentityWithOptions:error:](self, "copyIdentityWithOptions:error:", 258LL, 0LL);
  v68 = v24;
  if (v24)
  {
    id v91 = v23;
    v25 = &v91;
    v26 = (CFMutableStringRef *)&v91;
  }

  else
  {
    id v90 = v23;
    v25 = &v90;
    v26 = (CFMutableStringRef *)&v90;
  }

  NSAppendPrintF(v26);
  v27 = (__CFString *)*v25;

  v69 = self;
  id v28 = -[CUPairingDaemon copyPairedPeersWithOptions:error:](self, "copyPairedPeersWithOptions:error:", 2LL, 0LL);
  CFMutableStringRef v89 = v27;
  uint64_t v64 = [v28 count];
  NSAppendPrintF(&v89);
  v29 = v89;

  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  id v30 = v28;
  uint64_t v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v85, v105, 16, v64);
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v86;
    do
    {
      for (uint64_t i = 0LL; i != v32; ++i)
      {
        v35 = v29;
        if (*(void *)v86 != v33) {
          objc_enumerationMutation(v30);
        }
        v36 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        CFMutableStringRef v84 = v29;
        id v37 = v36;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v38 = [v37 detailedDescription];
        }

        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0) {
            [v37 descriptionWithLevel:20];
          }
          else {
          uint64_t v38 = NSPrintF();
          }
        }

        v39 = (void *)v38;

        NSAppendPrintF(&v84);
        v29 = v84;
      }

      uint64_t v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v85, v105, 16, v39, v68);
    }

    while (v32);
  }

  if (![v30 count])
  {
    CFMutableStringRef v83 = v29;
    NSAppendPrintF(&v83);
    v40 = v83;

    v29 = v40;
  }

  id v41 = -[CUPairingDaemon copyPairedPeersWithOptions:error:](v69, "copyPairedPeersWithOptions:error:", 6LL, 0LL);

  CFMutableStringRef v82 = v29;
  uint64_t v65 = [v41 count];
  NSAppendPrintF(&v82);
  v42 = v82;

  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  id v43 = v41;
  uint64_t v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v78, v104, 16, v65);
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v79;
    do
    {
      for (uint64_t j = 0LL; j != v45; ++j)
      {
        v48 = v42;
        if (*(void *)v79 != v46) {
          objc_enumerationMutation(v43);
        }
        v49 = *(void **)(*((void *)&v78 + 1) + 8 * j);
        CFMutableStringRef v77 = v42;
        id v50 = v49;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v51 = [v50 detailedDescription];
        }

        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0) {
            [v50 descriptionWithLevel:20];
          }
          else {
          uint64_t v51 = NSPrintF();
          }
        }

        v52 = (void *)v51;

        NSAppendPrintF(&v77);
        v42 = v77;
      }

      uint64_t v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v78, v104, 16, v52);
    }

    while (v45);
  }

  if (![v43 count])
  {
    CFMutableStringRef v76 = v42;
    NSAppendPrintF(&v76);
    v53 = v76;

    v42 = v53;
  }

  CFMutableStringRef v75 = v42;
  uint64_t v66 = -[NSMutableSet count](v69->_xpcConnections, "count");
  NSAppendPrintF(&v75);
  v54 = v75;

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  v55 = v69->_xpcConnections;
  uint64_t v56 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v71,  v103,  16LL,  v66);
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v72;
    do
    {
      uint64_t v59 = 0LL;
      v60 = v54;
      do
      {
        if (*(void *)v72 != v58) {
          objc_enumerationMutation(v55);
        }
        uint64_t v61 = *(void *)(*((void *)&v71 + 1) + 8 * v59);
        CFMutableStringRef v70 = v60;
        uint64_t v67 = objc_msgSend(*(id *)(v61 + 40), "processIdentifier", v67);
        NSAppendPrintF(&v70);
        v54 = v70;

        ++v59;
        v60 = v54;
      }

      while (v57 != v59);
      uint64_t v57 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v71,  v103,  16LL,  v67);
    }

    while (v57);
  }

  return v54;
}

- (void)activate
{
  if (self->_testMode && !self->_xpcListener)
  {
    [MEMORY[0x189607B50] anonymousListener];
    v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__CUPairingDaemon_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _activate]",  0x1Eu,  (uint64_t)"Activate\n",  v2,  v3,  v4,  v5,  v13);
  }

  if (!self->_homeKitManager)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___CUHomeKitManager);
    homeKitManager = self->_homeKitManager;
    self->_homeKitManager = v7;

    dispatch_queue_t v9 = dispatch_queue_create("CUPairingDaemonHomeKit", 0LL);
    -[CUHomeKitManager setDispatchQueue:](self->_homeKitManager, "setDispatchQueue:", v9);

    -[CUHomeKitManager setFlags:](self->_homeKitManager, "setFlags:", 516LL);
    if (GestaltGetDeviceClass_sOnce != -1) {
      dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13042);
    }
    if (GestaltGetDeviceClass_deviceClass == 7 || GestaltGetDeviceClass_deviceClass == 4) {
      -[CUHomeKitManager setFlags:]( self->_homeKitManager,  "setFlags:",  -[CUHomeKitManager flags](self->_homeKitManager, "flags") | 2);
    }
    -[CUHomeKitManager activate](self->_homeKitManager, "activate");
  }

  if (self->_rpIdentityNotifier == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __28__CUPairingDaemon__activate__block_invoke;
    handler[3] = &unk_189F32EC8;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.identitiesChanged", &self->_rpIdentityNotifier, dispatchQueue, handler);
    -[CUPairingDaemon _rpIdentityUpdate](self, "_rpIdentityUpdate");
  }

  if (!self->_stateHandle) {
    self->_stateHandle = os_state_add_handler();
  }
  if (!self->_xpcListener)
  {
    v11 = (NSXPCListener *)[objc_alloc(MEMORY[0x189607B50]) initWithMachServiceName:@"com.apple.PairingManager"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v11;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__CUPairingDaemon_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _invalidate]",  0x1Eu,  (uint64_t)"Invalidate\n",  v2,  v3,  v4,  v5,  v17);
  }

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0LL;

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = self->_xpcConnections;
  uint64_t v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*(void *)(*((void *)&v17 + 1) + 8 * i) + 40), "invalidate", (void)v17);
      }

      uint64_t v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v10);
  }

  -[NSMutableSet removeAllObjects](self->_xpcConnections, "removeAllObjects");
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0LL;

  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0LL;
  }

  int rpIdentityNotifier = self->_rpIdentityNotifier;
  if (rpIdentityNotifier != -1)
  {
    notify_cancel(rpIdentityNotifier);
    self->_int rpIdentityNotifier = -1;
  }

  rpSelfIRK = self->_rpSelfIRK;
  self->_rpSelfIRK = 0LL;

  -[CUHomeKitManager invalidate](self->_homeKitManager, "invalidate");
  homeKitManager = self->_homeKitManager;
  self->_homeKitManager = 0LL;

  if ((CUPairingDaemon *)gPairingDaemon == self)
  {
    gPairingDaemon = 0LL;
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = objc_alloc_init(&OBJC_CLASS___CUPairingXPCConnection);
  objc_storeStrong((id *)&v7->_daemon, self);
  objc_storeStrong((id *)&v7->_dispatchQueue, self->_dispatchQueue);
  objc_storeStrong((id *)&v7->_xpcCnx, a4);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v10 = self->_xpcConnections;
    self->_xpcConnections = v9;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v7);
  [v6 _setQueue:self->_dispatchQueue];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6AAB08];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setExportedInterface:v11];

  [v6 setExportedObject:v7];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __54__CUPairingDaemon_listener_shouldAcceptNewConnection___block_invoke;
  v20[3] = &unk_189F33088;
  v20[4] = self;
  id v12 = v7;
  v21 = v12;
  [v6 setInvalidationHandler:v20];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6AAC98];
  char v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setRemoteObjectInterface:v13];

  [v6 resume];
  if (gLogCategory_CUPairingDaemon <= 20
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x14u)))
  {
    char v14 = [v6 processIdentifier];
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon listener:shouldAcceptNewConnection:]",  0x14u,  (uint64_t)"XPC connection started from %#{pid}\n",  v15,  v16,  v17,  v18,  v14);
  }

  return 1;
}

- (void)_connectionInvalidated:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v5 connectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v5);
}

- (void)reset
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (self->_testMode)
  {
    -[CUPairingDaemon deleteIdentityWithOptions:](self, "deleteIdentityWithOptions:", 0LL);
    -[CUPairingDaemon deleteIdentityWithOptions:](self, "deleteIdentityWithOptions:", 4LL);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v7 = -[CUPairingDaemon copyPairedPeersWithOptions:error:](self, "copyPairedPeersWithOptions:error:", 0LL, 0LL);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          -[CUPairingDaemon removePairedPeer:options:removeAdminAllowed:]( self,  "removePairedPeer:options:removeAdminAllowed:",  *(void *)(*((void *)&v22 + 1) + 8 * i),  0LL,  1LL);
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v9);
    }

    id v12 = -[CUPairingDaemon copyPairedPeersWithOptions:error:](self, "copyPairedPeersWithOptions:error:", 4LL, 0LL);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t j = 0LL; j != v15; ++j)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          -[CUPairingDaemon removePairedPeer:options:removeAdminAllowed:]( self,  "removePairedPeer:options:removeAdminAllowed:",  *(void *)(*((void *)&v18 + 1) + 8 * j),  4LL,  1LL,  (void)v18);
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }

      while (v15);
    }
  }

  else if (gLogCategory_CUPairingDaemon <= 90 {
         && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize( (uint64_t)&gLogCategory_CUPairingDaemon,  0x5Au)))
  }
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon reset]",  0x5Au,  (uint64_t)"### Reset only allowed in test mode\n",  v2,  v3,  v4,  v5,  v29);
  }

- (void)_rpIdentityUpdate
{
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]",  0x1Eu,  (uint64_t)"Self RPIdentity get start\n",  v2,  v3,  v4,  v5,  v9[0]);
  }

  id v7 = objc_alloc_init((Class)getRPClientClass[0]());
  [v7 setDispatchQueue:self->_dispatchQueue];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __36__CUPairingDaemon__rpIdentityUpdate__block_invoke;
  v9[3] = &unk_189F31650;
  id v10 = v7;
  uint64_t v11 = self;
  id v8 = v7;
  [v8 getIdentitiesWithFlags:1 completion:v9];
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return -[NSXPCListener endpoint](self->_xpcListener, "endpoint");
}

- (id)copyIdentityWithOptions:(unint64_t)a3 error:(int *)a4
{
  id v6 = self;
  objc_sync_enter(v6);
  if ((a3 & 8) != 0)
  {
    uint64_t v7 = -[CUPairingDaemon _copyHomeKitWithOptions:error:](v6, "_copyHomeKitWithOptions:error:", a3, a4);
  }

  else if ((a3 & 0x138) != 0)
  {
    uint64_t v7 = -[CUPairingDaemon _copyHomeKitExWithOptions:error:](v6, "_copyHomeKitExWithOptions:error:", a3, a4);
  }

  else
  {
    uint64_t v7 = -[CUPairingDaemon _copyOrCreateWithOptions:error:](v6, "_copyOrCreateWithOptions:error:", a3, a4);
  }

  id v8 = (void *)v7;
  objc_sync_exit(v6);

  return v8;
}

- (void)getIdentityWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  v28[1] = *MEMORY[0x1895F89C0];
  id v8 = (void (**)(id, void *, void *))a4;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  if ((a3 & 8) != 0)
  {
    int v24 = 0;
    id v11 = -[CUPairingDaemon _copyHomeKitWithOptions:error:](v9, "_copyHomeKitWithOptions:error:", a3, &v24);
    if (v8)
    {
      uint64_t v12 = v24;
      if (v24)
      {
        id v13 = (void *)MEMORY[0x189607870];
        uint64_t v27 = *MEMORY[0x1896075E0];
        uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v24, 0, 0));
        uint64_t v4 = (void *)v14;
        uint64_t v15 = @"?";
        if (v14) {
          uint64_t v15 = (const __CFString *)v14;
        }
        v28[0] = v15;
        [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 errorWithDomain:*MEMORY[0x189607670] code:v12 userInfo:v5];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v16 = 0LL;
      }

      v8[2](v8, v11, v16);
      if ((_DWORD)v12)
      {
      }
    }

    goto LABEL_21;
  }

  if ((a3 & 0x138) == 0)
  {
    int v24 = 0;
    id v11 = -[CUPairingDaemon _copyOrCreateWithOptions:error:](v9, "_copyOrCreateWithOptions:error:", a3, &v24);
    if (v8)
    {
      uint64_t v17 = v24;
      if (v24)
      {
        __int128 v18 = (void *)MEMORY[0x189607870];
        uint64_t v25 = *MEMORY[0x1896075E0];
        uint64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v24, 0, 0));
        uint64_t v4 = (void *)v19;
        __int128 v20 = @"?";
        if (v19) {
          __int128 v20 = (const __CFString *)v19;
        }
        v26 = v20;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 errorWithDomain:*MEMORY[0x189607670] code:v17 userInfo:v5];
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        __int128 v21 = 0LL;
      }

      v8[2](v8, v11, v21);
      if ((_DWORD)v17)
      {
      }
    }

- (id)_copyHomeKitWithOptionsHAP:(unint64_t)a3 error:(int *)a4
{
  id v11 = -[CUPairingDaemon _copyHomeKitLocalPairingIDWithOptions:error:]( self,  "_copyHomeKitLocalPairingIDWithOptions:error:");
  if (v11) {
    return v11;
  }
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsHAP:error:]",  0x1Eu,  (uint64_t)"No HomeKit Local Pairing ID, trying HAP directly",  v7,  v8,  v9,  v10,  v26);
  }

  -[objc_class systemStore](getHAPSystemKeychainStoreClass_5695(), "systemStore");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    id v13 = v12;
    id v27 = 0LL;
    [v12 getLocalPairingIdentity:&v27];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v27;
    uint64_t v16 = v15;
    if (v14)
    {
      [v14 identifier];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        __int128 v18 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v17];
        if (v18)
        {
          uint64_t v19 = objc_alloc_init(&OBJC_CLASS___CUPairingIdentity);
          -[CUPairingIdentity setIdentifier:](v19, "setIdentifier:", v18);
          [v14 publicKey];
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 data];
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CUPairingIdentity setPublicKey:](v19, "setPublicKey:", v21);

          if ((a3 & 2) != 0)
          {
            [v14 privateKey];
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 data];
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CUPairingIdentity setSecretKey:](v19, "setSecretKey:", v23);
          }

          int v24 = 0;
          goto LABEL_13;
        }

        uint64_t v19 = 0LL;
      }

      else
      {
        uint64_t v19 = 0LL;
        __int128 v18 = 0LL;
      }

      int v24 = -6708;
    }

    else
    {
      int v24 = NSErrorToOSStatusEx(v15, 0LL);
      uint64_t v19 = 0LL;
      uint64_t v17 = 0LL;
      __int128 v18 = 0LL;
    }

- (id)_copyHomeKitLocalPairingIDWithOptions:(unint64_t)a3 error:(int *)a4
{
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = __Block_byref_object_copy__5662;
  uint64_t v28 = __Block_byref_object_dispose__5663;
  id v29 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  __int128 v21 = __Block_byref_object_copy__5662;
  __int128 v22 = __Block_byref_object_dispose__5663;
  id v23 = 0LL;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  homeKitManager = self->_homeKitManager;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __63__CUPairingDaemon__copyHomeKitLocalPairingIDWithOptions_error___block_invoke;
  v14[3] = &unk_189F33CC8;
  uint64_t v16 = &v24;
  uint64_t v17 = &v18;
  uint64_t v9 = v7;
  id v15 = v9;
  -[CUHomeKitManager getHomeKitLocalPairingIdentityWithOptions:completion:]( homeKitManager,  "getHomeKitLocalPairingIdentityWithOptions:completion:",  a3,  v14);
  dispatch_time_t v10 = dispatch_time(0LL, 30000000000LL);
  if (dispatch_semaphore_wait(v9, v10))
  {
    LODWORD(v11) = -6722;
  }

  else
  {
    id v11 = (void *)v19[5];
    if (v11) {
      LODWORD(v11) = NSErrorToOSStatusEx(v11, 0LL);
    }
  }

  if (a4) {
    *a4 = (int)v11;
  }
  id v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (id)_copyHomeKitWithOptionsKeychain:(unint64_t)a3 error:(int *)a4
{
  char v51 = a3;
  uint64_t v58 = *MEMORY[0x1895F89C0];
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]",  0x1Eu,  (uint64_t)"Get HomeKit Local key",  v4,  v5,  v6,  v7,  v49);
  }

  uint64_t v8 = *MEMORY[0x18960BB38];
  id v15 = (const __CFDictionary *)KeychainCopyMatchingFormatted( &v55,  (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}",  a3,  (uint64_t)a4,  v4,  v5,  v6,  v7,  *MEMORY[0x18960BB38]);
  if (!v15)
  {
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]",  0x1Eu,  (uint64_t)"No HomeKit Local key, try v2 key: %#m",  v11,  v12,  v13,  v14,  v55);
    }

    id v15 = (const __CFDictionary *)KeychainCopyMatchingFormatted( &v55,  (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}",  v9,  v10,  v11,  v12,  v13,  v14,  v8);
    if (!v15)
    {
      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]",  0x1Eu,  (uint64_t)"No HomeKit v2 key, try v0 key: %#m",  v18,  v19,  v20,  v21,  v55);
      }

      id v15 = (const __CFDictionary *)KeychainCopyMatchingFormatted( &v55,  (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}",  v16,  v17,  v18,  v19,  v20,  v21,  v8);
      if (!v15)
      {
        uint64_t v28 = 0LL;
        id v30 = 0LL;
        id v34 = 0LL;
        v42 = 0LL;
        id v29 = a4;
        goto LABEL_31;
      }
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v29 = a4;
    if (gLogCategory_CUPairingDaemon <= 90
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x5Au)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]",  0x5Au,  (uint64_t)"Bad HomeKit key type",  v22,  v23,  v24,  v25,  v50);
    }

    v42 = 0LL;
    id v34 = 0LL;
    id v30 = 0LL;
    uint64_t v28 = 0LL;
    int v41 = -6756;
    goto LABEL_50;
  }

  uint64_t v26 = (const void *)*MEMORY[0x18960B870];
  CFTypeID TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v15, v26, TypeID, &v55);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  id v29 = a4;
  if (!v28)
  {
    id v30 = 0LL;
    goto LABEL_45;
  }

  id v30 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v28];
  if (!v30)
  {
    v42 = 0LL;
    id v34 = 0LL;
    int v41 = -6708;
    goto LABEL_50;
  }

  uint64_t v31 = (const void *)*MEMORY[0x18960BE78];
  CFTypeID v32 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v15, v31, v32, &v55);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
LABEL_45:
    id v34 = 0LL;
    v42 = 0LL;
    goto LABEL_31;
  }

  id v34 = v33;
  v35 = (char *)[v34 bytes];
  size_t v36 = [v34 length];
  size_t v54 = v36;
  id v37 = (char *)memchr(v35, 43, v36);
  if (!v37)
  {
    v42 = 0LL;
    int v41 = -6742;
    goto LABEL_50;
  }

  uint64_t v38 = &v35[v36];
  v39 = v37 + 1;
  int64_t v40 = v38 - (v37 + 1);
  int64_t v53 = v40;
  size_t v54 = v37 - v35;
  int v41 = HexToData(v35, v37 - v35, 22, (uint64_t)v57, 0x20uLL, &v54, 0LL, 0LL);
  int v55 = v41;
  if (v41) {
    goto LABEL_39;
  }
  if (v54 != 32)
  {
LABEL_40:
    v42 = 0LL;
    int v41 = -6743;
LABEL_50:
    int v55 = v41;
    goto LABEL_32;
  }

  int v41 = HexToData(v39, v40, 22, (uint64_t)v56, 0x20uLL, (unint64_t *)&v53, 0LL, 0LL);
  int v55 = v41;
  if (v41)
  {
LABEL_39:
    v42 = 0LL;
    goto LABEL_32;
  }

  if (v53 != 32) {
    goto LABEL_40;
  }
  v42 = objc_alloc_init(&OBJC_CLASS___CUPairingIdentity);
  -[CUPairingIdentity setIdentifier:](v42, "setIdentifier:", v30);
  id v43 = objc_alloc(MEMORY[0x189603F48]);
  uint64_t v44 = (void *)[v43 initWithBytes:v57 length:v54];
  -[CUPairingIdentity setPublicKey:](v42, "setPublicKey:", v44);

  if ((v51 & 2) != 0)
  {
    id v45 = objc_alloc(MEMORY[0x189603F48]);
    uint64_t v46 = (void *)[v45 initWithBytes:v56 length:v53];
    -[CUPairingIdentity setSecretKey:](v42, "setSecretKey:", v46);
  }

  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]",  0x1Eu,  (uint64_t)"Got HomeKit key: %@",  v22,  v23,  v24,  v25,  (char)v42);
  }

- (id)_copyHomeKitExWithOptions:(unint64_t)a3 error:(int *)a4
{
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = __Block_byref_object_copy__5662;
  uint64_t v28 = __Block_byref_object_dispose__5663;
  id v29 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy__5662;
  uint64_t v22 = __Block_byref_object_dispose__5663;
  id v23 = 0LL;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  homeKitManager = self->_homeKitManager;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __51__CUPairingDaemon__copyHomeKitExWithOptions_error___block_invoke;
  v14[3] = &unk_189F33CC8;
  uint64_t v16 = &v24;
  uint64_t v17 = &v18;
  uint64_t v9 = v7;
  id v15 = v9;
  -[CUHomeKitManager getPairingIdentityWithOptions:completion:]( homeKitManager,  "getPairingIdentityWithOptions:completion:",  a3,  v14);
  dispatch_time_t v10 = dispatch_time(0LL, 30000000000LL);
  if (dispatch_semaphore_wait(v9, v10))
  {
    LODWORD(v11) = -6722;
  }

  else
  {
    uint64_t v11 = (void *)v19[5];
    if (v11) {
      LODWORD(v11) = NSErrorToOSStatusEx(v11, 0LL);
    }
  }

  if (a4) {
    *a4 = (int)v11;
  }
  id v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (id)_copyOrCreateWithOptions:(unint64_t)a3 error:(int *)a4
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  dispatch_semaphore_t v7 = -[CUPairingDaemon _copyIdentityWithOptions:error:](self, "_copyIdentityWithOptions:error:", a3, &v39);
  uint64_t v8 = v7;
  if (v7 && !v39)
  {
    if ((a3 & 2) != 0)
    {
      -[CUPairingIdentity altIRK](v7, "altIRK");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        if ((a3 & 4) == 0) {
          goto LABEL_30;
        }
        goto LABEL_21;
      }

      dispatch_time_t v10 = v9;
      if ((a3 & 4) != 0 && self->_rpSelfIRK)
      {
        -[CUPairingIdentity altIRK](v8, "altIRK");
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = [v11 isEqual:self->_rpSelfIRK];

        if ((v12 & 1) != 0) {
          goto LABEL_38;
        }
LABEL_21:
        if (self->_rpSelfIRK)
        {
          -[CUPairingIdentity setAltIRK:](v8, "setAltIRK:");
          if (gLogCategory_CUPairingDaemon <= 30
            && (gLogCategory_CUPairingDaemon != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
          {
            LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _copyOrCreateWithOptions:error:]",  0x1Eu,  (uint64_t)"Updating identity for RP IRK: %@\n",  v23,  v24,  v25,  v26,  (char)v8);
          }

          goto LABEL_37;
        }

- (id)_copyIdentityWithOptions:(unint64_t)a3 error:(int *)a4
{
  char v9 = a3;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  dispatch_time_t v10 = (const __CFDictionary *)KeychainCopyMatchingFormatted( &v27,  (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}",  a3,  (uint64_t)a4,  v4,  v5,  v6,  v7,  *MEMORY[0x18960BB38]);
  int v11 = v27;
  if (v27)
  {
    uint64_t v24 = 0LL;
    char v12 = 0LL;
    goto LABEL_27;
  }

  if (!v10)
  {
    uint64_t v24 = 0LL;
    char v12 = 0LL;
    uint64_t v17 = 0LL;
    goto LABEL_34;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v24 = 0LL;
    char v12 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
LABEL_36:
    int v11 = -6756;
    goto LABEL_40;
  }

  char v12 = objc_alloc_init(&OBJC_CLASS___CUPairingIdentity);
  Value = (__CFString *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x18960B870]);
  if (Value)
  {
    int v11 = CFGetUUIDEx(Value, 0LL, (uint64_t)v28);
    int v27 = v11;
    if (!v11)
    {
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v28];
      -[CUPairingIdentity setIdentifier:](v12, "setIdentifier:", v14);

      id v15 = (const void *)*MEMORY[0x18960BE78];
      CFTypeID TypeID = CFDataGetTypeID();
      CFDictionaryGetTypedValue(v10, v15, TypeID, &v27);
      uint64_t v17 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      int v11 = v27;
      if (!v27)
      {
        if (v17)
        {
          uint64_t v18 = (__CFString *)OPACKDecodeData(v17, 0, &v27);
          int v11 = v27;
          if (v27) {
            goto LABEL_24;
          }
          if (!v18)
          {
LABEL_25:
            uint64_t v24 = 0LL;
LABEL_39:
            int v11 = -6762;
            goto LABEL_40;
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            CFTypeID v19 = CFDataGetTypeID();
            CFDictionaryGetTypedValue((const __CFDictionary *)v18, @"pk", v19, &v27);
            uint64_t v20 = (const __CFData *)objc_claimAutoreleasedReturnValue();

            int v11 = v27;
            if (v27)
            {
              uint64_t v24 = 0LL;
              uint64_t v17 = v20;
              goto LABEL_21;
            }

            if (!v20)
            {
              uint64_t v24 = 0LL;
              uint64_t v17 = 0LL;
              goto LABEL_39;
            }

            -[CUPairingIdentity setPublicKey:](v12, "setPublicKey:", v20);
            if ((v9 & 2) == 0)
            {
              uint64_t v17 = v20;
LABEL_20:
              uint64_t v24 = v12;
              int v11 = 0;
              int v27 = 0;
              char v12 = v24;
              goto LABEL_21;
            }

            CFTypeID v21 = CFDataGetTypeID();
            CFDictionaryGetTypedValue((const __CFDictionary *)v18, @"altIRK", v21, 0LL);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22) {
              -[CUPairingIdentity setAltIRK:](v12, "setAltIRK:", v22);
            }
            CFTypeID v23 = CFDataGetTypeID();
            CFDictionaryGetTypedValue((const __CFDictionary *)v18, @"sk", v23, &v27);
            uint64_t v17 = (const __CFData *)objc_claimAutoreleasedReturnValue();

            int v11 = v27;
            if (!v27)
            {
              if (v17)
              {
                -[CUPairingIdentity setSecretKey:](v12, "setSecretKey:", v17);
                goto LABEL_20;
              }

              goto LABEL_25;
            }

- (int)deleteIdentityWithOptions:(unint64_t)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  LODWORD(a3) = -[CUPairingDaemon _deleteIdentityWithOptions:](v4, "_deleteIdentityWithOptions:", a3);
  objc_sync_exit(v4);

  return a3;
}

- (int)_deleteIdentityWithOptions:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  int v14 = KeychainDeleteFormatted( (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O}",  (uint64_t)a2,  a3,  v3,  v4,  v5,  v6,  v7,  *MEMORY[0x18960BB38]);
  if (!v14)
  {
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _deleteIdentityWithOptions:]",  0x1Eu,  (uint64_t)"Deleted identity\n",  v10,  v11,  v12,  v13,  v23);
    }

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v15 = self->_xpcConnections;
    uint64_t v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (*(_BYTE *)(v20 + 32))
          {
            [*(id *)(v20 + 40) remoteObjectProxy];
            CFTypeID v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 pairingIdentityDeletedWithOptions:a3];
          }
        }

        uint64_t v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
      }

      while (v17);
    }

    notify_post("com.apple.pairing.identityChanged");
  }

  return v14;
}

- (int)_saveIdentity:(id)a3 options:(unint64_t)a4
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  p_cache = &OBJC_CLASS___CUAppleIDClient.cache;
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]",  0x1Eu,  (uint64_t)"Save %@\n",  v6,  v7,  v8,  v9,  (char)v10);
  }

  [v10 identifier];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 UUIDString];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    CFTypeID v21 = 0LL;
    CFMutableDataRef v24 = 0LL;
    uint64_t v18 = 0LL;
    __int128 v25 = 0LL;
    int v42 = -6708;
LABEL_50:
    int v50 = v42;
    goto LABEL_41;
  }

  uint64_t v18 = (__CFString *)objc_alloc_init(MEMORY[0x189603FC8]);
  [v10 altIRK];
  CFTypeID v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19) {
    -[__CFString setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v19, @"altIRK");
  }
  [v10 publicKey];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20) {
    -[__CFString setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v20, @"pk");
  }
  [v10 secretKey];
  CFTypeID v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21) {
    -[__CFString setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v21, @"sk");
  }
  CFMutableDataRef v24 = OPACKEncoderCreateDataMutable(v18, 0, &v50);
  if (v50)
  {
    __int128 v25 = 0LL;
    goto LABEL_41;
  }

  if (!v24)
  {
    __int128 v25 = 0LL;
    int v42 = -6762;
    goto LABEL_50;
  }

  id v43 = v21;
  id v45 = v24;
  uint64_t v26 = *MEMORY[0x18960BB38];
  uint64_t v44 = v13;
  __int128 v25 = (const __CFDictionary *)CFCreateF( &v50,  (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}",  v22,  v23,  v14,  v15,  v16,  v17,  *MEMORY[0x18960BB38]);
  if (!v50)
  {
    int updated = KeychainUpdateFormatted( v25,  (uint64_t)"{%kO=%O%kO=%O%kO=%O}",  v27,  v28,  v14,  v15,  v16,  v17,  *MEMORY[0x18960B918]);
    int v50 = updated;
    if (updated)
    {
      if (updated != -25300)
      {
        p_cache = (void **)(&OBJC_CLASS___CUAppleIDClient + 16);
        CFTypeID v21 = v43;
        goto LABEL_41;
      }

      int v50 = KeychainAddFormatted( 0LL,  (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}",  v30,  v31,  v14,  v15,  v16,  v17,  v26);
      CFTypeID v21 = v43;
      if (v50)
      {
        p_cache = (void **)(&OBJC_CLASS___CUAppleIDClient + 16);
        goto LABEL_41;
      }

      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]",  0x1Eu,  (uint64_t)"Saved %@\n",  v14,  v15,  v16,  v17,  (char)v10);
      }

      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      uint64_t v32 = self->_xpcConnections;
      uint64_t v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v46,  v51,  16LL);
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v47;
        do
        {
          for (uint64_t i = 0LL; i != v34; ++i)
          {
            if (*(void *)v47 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            if (*(_BYTE *)(v37 + 32))
            {
              [*(id *)(v37 + 40) remoteObjectProxy];
              uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
              [v38 pairingIdentityCreated:v10 options:a4];
            }
          }

          uint64_t v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v46,  v51,  16LL);
        }

        while (v34);
      }

      notify_post("com.apple.pairing.identityChanged");
      uint64_t v13 = v44;
      CFMutableDataRef v24 = v45;
      p_cache = &OBJC_CLASS___CUAppleIDClient.cache;
    }

    else
    {
      p_cache = &OBJC_CLASS___CUAppleIDClient.cache;
      CFTypeID v21 = v43;
      if (gLogCategory_CUPairingDaemon > 30) {
        goto LABEL_45;
      }
      if (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)) {
        LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]",  0x1Eu,  (uint64_t)"Updated %@\n",  v14,  v15,  v16,  v17,  (char)v10);
      }
    }

    if (!v50) {
      goto LABEL_45;
    }
    goto LABEL_41;
  }

  p_cache = (void **)(&OBJC_CLASS___CUAppleIDClient + 16);
  CFTypeID v21 = v43;
LABEL_41:
  int v39 = *((_DWORD *)p_cache + 320);
  if (v39 <= 60 && (v39 != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu))) {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]",  0x3Cu,  (uint64_t)"### Save %@ failed: %#m\n",  v14,  v15,  v16,  v17,  (char)v10);
  }
LABEL_45:
  if (v25) {
    CFRelease(v25);
  }
  int v40 = v50;

  return v40;
}

- (id)copyPairedPeersWithOptions:(unint64_t)a3 error:(int *)a4
{
  uint64_t v6 = self;
  objc_sync_enter(v6);
  id v7 = -[CUPairingDaemon _copyPairedPeersWithOptions:error:](v6, "_copyPairedPeersWithOptions:error:", a3, a4);
  objc_sync_exit(v6);

  return v7;
}

- (id)_copyPairedPeersWithOptions:(unint64_t)a3 error:(int *)a4
{
  uint64_t v8 = a4;
  uint64_t v72 = *MEMORY[0x1895F89C0];
  char v62 = a3;
  uint64_t v61 = *MEMORY[0x18960BB38];
  CFTypeRef v10 = KeychainCopyMatchingFormatted( &v69,  (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}",  a3,  (uint64_t)a4,  v4,  v5,  v6,  v7,  *MEMORY[0x18960BB38]);
  uint64_t v11 = (void *)v10;
  if (v69)
  {
    id v49 = 0LL;
    id v63 = 0LL;
    if (v69 == -25300)
    {
      id v63 = 0LL;
      int v69 = 0;
      id v49 = (id)MEMORY[0x189604A58];
    }

    goto LABEL_60;
  }

  if (!v10)
  {
    id v49 = 0LL;
    id v63 = 0LL;
    int v52 = -6762;
LABEL_67:
    int v69 = v52;
    goto LABEL_60;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v49 = 0LL;
    id v63 = 0LL;
    int v52 = -6756;
    goto LABEL_67;
  }

  int64_t v53 = self;
  int v55 = v8;
  id v63 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  size_t v54 = v11;
  obuint64_t j = v11;
  uint64_t v64 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (!v64) {
    goto LABEL_39;
  }
  uint64_t v60 = *(void *)v66;
  uint64_t v12 = (const void *)*MEMORY[0x18960B870];
  uint64_t v59 = (const void *)*MEMORY[0x18960BA00];
  uint64_t v58 = (const void *)*MEMORY[0x18960B9F8];
  uint64_t v57 = (const void *)*MEMORY[0x18960B928];
  while (2)
  {
    for (uint64_t i = 0LL; i != v64; ++i)
    {
      if (*(void *)v66 != v60) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(const __CFDictionary **)(*((void *)&v65 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v69 = -6756;
LABEL_58:
        uint64_t v11 = v54;
        uint64_t v8 = v55;
        goto LABEL_59;
      }

      uint64_t v15 = objc_alloc_init(&OBJC_CLASS___CUPairedPeer);
      CFTypeID TypeID = CFStringGetTypeID();
      CFDictionaryGetTypedValue(v14, v12, TypeID, &v69);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v18 = v17;
      if (v69) {
        goto LABEL_42;
      }
      if (!v17)
      {
        int v69 = -6762;
        goto LABEL_57;
      }

      id v18 = v17;
      CFTypeID v19 = (char *)[v18 UTF8String];
      int v69 = StringToUUIDEx(v19, 0xFFFFFFFFFFFFFFFFLL, 0, 0LL, &v70, v20, v21, v22);
      if (v69)
      {
LABEL_42:
        uint64_t v32 = 0LL;
LABEL_43:
        uint64_t v36 = 0LL;
        uint64_t v34 = 0LL;
LABEL_54:
        uint64_t v11 = v54;
        uint64_t v8 = v55;

LABEL_59:
        id v49 = 0LL;
        goto LABEL_60;
      }

      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:&v70];
      -[CUPairedPeer setIdentifier:](v15, "setIdentifier:", v23);

      CFTypeID v24 = CFDateGetTypeID();
      -[CUPairedPeer setDateModified:](v15, "setDateModified:", CFDictionaryGetTypedValue(v14, v59, v24, 0LL));
      CFTypeRef v31 = KeychainCopyMatchingFormatted( &v69,  (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}",  v25,  v26,  v27,  v28,  v29,  v30,  v61);
      uint64_t v32 = (void *)v31;
      if (v69) {
        goto LABEL_43;
      }
      if (!v31)
      {
        int v69 = -6762;
        goto LABEL_56;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v50 = -6756;
        goto LABEL_50;
      }

      uint64_t v33 = OPACKDecodeData((const __CFData *)v32, 0, &v69);
      uint64_t v34 = (__CFString *)v33;
      if (v69)
      {
        uint64_t v36 = 0LL;
        goto LABEL_54;
      }

      if (!v33)
      {
        int v50 = -6762;
LABEL_50:
        int v69 = v50;
LABEL_52:

LABEL_56:
LABEL_57:

        goto LABEL_58;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v69 = -6756;

        goto LABEL_52;
      }

      CFTypeID v35 = CFDictionaryGetTypeID();
      CFDictionaryGetTypedValue((const __CFDictionary *)v34, @"acl", v35, 0LL);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36) {
        -[CUPairedPeer setAcl:](v15, "setAcl:", v36);
      }
      CFTypeID v37 = CFDataGetTypeID();
      CFDictionaryGetTypedValue((const __CFDictionary *)v34, @"pk", v37, &v69);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69)
      {
        uint64_t v32 = v38;
        goto LABEL_54;
      }

      if (!v38)
      {
        int v69 = -6762;

        goto LABEL_56;
      }

      -[CUPairedPeer setPublicKey:](v15, "setPublicKey:", v38);
      CFTypeID v39 = CFStringGetTypeID();
      CFDictionaryGetTypedValue(v14, v58, v39, 0LL);
      int v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40) {
        -[CUPairedPeer setName:](v15, "setName:", v40);
      }
      CFTypeID v41 = CFDataGetTypeID();
      CFDictionaryGetTypedValue(v14, v57, v41, 0LL);
      int v42 = (const __CFData *)objc_claimAutoreleasedReturnValue();

      if (!v42)
      {
        id v43 = 0LL;
LABEL_32:
        id v45 = v40;
        goto LABEL_33;
      }

      id v43 = (__CFString *)OPACKDecodeData(v42, 0, 0LL);
      if (!v43) {
        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      CFTypeID v44 = CFStringGetTypeID();
      CFDictionaryGetTypedValue((const __CFDictionary *)v43, @"model", v44, 0LL);
      id v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45) {
        -[CUPairedPeer setModel:](v15, "setModel:", v45);
      }
      __int128 v46 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v43];
      [v46 removeObjectForKey:@"model"];
      -[CUPairedPeer setInfo:](v15, "setInfo:", v46);

LABEL_33:
      if ((v62 & 2) != 0)
      {
        CFTypeID v47 = CFDataGetTypeID();
        uint64_t v48 = CFDictionaryGetTypedValue((const __CFDictionary *)v34, @"altIRK", v47, 0LL);

        if (v48)
        {
          -[CUPairedPeer setAltIRK:](v15, "setAltIRK:", v48);
          int v42 = (const __CFData *)v48;
        }

        else
        {
          int v42 = 0LL;
        }
      }

      [v63 addObject:v15];
    }

    uint64_t v64 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    if (v64) {
      continue;
    }
    break;
  }

- (void)_removeDups:(id)a3
{
  id v17 = a3;
  uint64_t v3 = [v17 count];
  if (!v3) {
    goto LABEL_20;
  }
  unint64_t v4 = v3;
  for (unint64_t i = 0LL; i < v4; ++i)
  {
    [v17 objectAtIndexedSubscript:i];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 info];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:@"mac"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8) {
      goto LABEL_17;
    }
    [v6 dateModified];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9) {
      goto LABEL_16;
    }
    uint64_t v10 = 0LL;
    unint64_t v15 = v4 - 1;
    unint64_t v16 = v4;
    if (v4 <= 1) {
      unint64_t v4 = 1LL;
    }
    while (i == v10)
    {
LABEL_14:
      if (v4 == ++v10)
      {
        unint64_t v4 = v16;
        goto LABEL_16;
      }
    }

    [v17 objectAtIndexedSubscript:v10];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 info];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 objectForKeyedSubscript:@"mac"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 dateModified];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14 || [v9 compare:v14] >= 1)
    {

LABEL_13:
      goto LABEL_14;
    }

    [v17 removeObjectAtIndex:i--];

    unint64_t v4 = v15;
LABEL_16:

LABEL_17:
  }

- (id)findPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  id v8 = a3;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  if ((a4 & 8) != 0)
  {
    uint64_t v10 = -[CUPairingDaemon _findHomeKitPairedPeer:options:error:](v9, "_findHomeKitPairedPeer:options:error:", v8, a4, a5);
  }

  else
  {
    if ((a4 & 0x138) != 0) {
      -[CUPairingDaemon _findHomeKitExPairedPeer:options:error:]( v9,  "_findHomeKitExPairedPeer:options:error:",  v8,  a4,  a5);
    }
    else {
    uint64_t v10 = -[CUPairingDaemon _findPairedPeer:options:error:](v9, "_findPairedPeer:options:error:", v8, a4, a5);
    }
  }

  uint64_t v11 = (void *)v10;
  objc_sync_exit(v9);

  return v11;
}

- (id)_findHomeKitPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    uint64_t v14 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v13 = 0LL;
    int v15 = -6708;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  id v9 = -[CUPairingDaemon _copyHomeKitWithOptions:error:](self, "_copyHomeKitWithOptions:error:", a4, 0LL);
  uint64_t v10 = v9;
  if (v9
    && ([v9 identifier],
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqual:v8],
        v11,
        v12))
  {
    [v10 publicKey];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      uint64_t v14 = objc_alloc_init(&OBJC_CLASS___CUPairedPeer);
      -[CUPairedPeer setIdentifier:](v14, "setIdentifier:", v8);
      -[CUPairedPeer setPublicKey:](v14, "setPublicKey:", v13);
      int v15 = 0;
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }

    uint64_t v14 = 0LL;
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
  }

  int v15 = -25300;
  if (a5) {
LABEL_9:
  }
    *a5 = v15;
LABEL_10:
  unint64_t v16 = v14;

  return v16;
}

- (id)_findHomeKitExPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  id v8 = a3;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = __Block_byref_object_copy__5662;
  uint64_t v30 = __Block_byref_object_dispose__5663;
  id v31 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = __Block_byref_object_copy__5662;
  CFTypeID v24 = __Block_byref_object_dispose__5663;
  id v25 = 0LL;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  homeKitManager = self->_homeKitManager;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __58__CUPairingDaemon__findHomeKitExPairedPeer_options_error___block_invoke;
  v16[3] = &unk_189F33CA0;
  id v18 = &v26;
  CFTypeID v19 = &v20;
  uint64_t v11 = v9;
  id v17 = v11;
  -[CUHomeKitManager findPairedPeer:options:completion:]( homeKitManager,  "findPairedPeer:options:completion:",  v8,  a4,  v16);
  dispatch_time_t v12 = dispatch_time(0LL, 30000000000LL);
  if (dispatch_semaphore_wait(v11, v12))
  {
    LODWORD(v13) = -6722;
  }

  else
  {
    uint64_t v13 = (void *)v21[5];
    if (v13) {
      LODWORD(v13) = NSErrorToOSStatusEx(v13, 0LL);
    }
  }

  if (a5) {
    *a5 = (int)v13;
  }
  id v14 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (id)_findPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  [v7 identifier];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v60 = v8;
  uint64_t v61 = v7;
  if (!v8)
  {
    [v7 publicKey];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      id v32 = -[CUPairingDaemon _copyPairedPeersWithOptions:error:](self, "_copyPairedPeersWithOptions:error:", a4, &v66);
      id v33 = v32;
      if (v66)
      {
        int v42 = 0LL;
        goto LABEL_44;
      }

      if (v32)
      {
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v62 objects:v67 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          id v36 = 0LL;
          uint64_t v37 = *(void *)v63;
LABEL_19:
          uint64_t v38 = 0LL;
          CFTypeID v39 = v36;
          while (1)
          {
            if (*(void *)v63 != v37) {
              objc_enumerationMutation(v33);
            }
            id v36 = *(id *)(*((void *)&v62 + 1) + 8 * v38);

            [v36 publicKey];
            int v40 = (void *)objc_claimAutoreleasedReturnValue();
            char v41 = [v40 isEqual:v31];

            if ((v41 & 1) != 0) {
              break;
            }
            ++v38;
            CFTypeID v39 = v36;
            if (v35 == v38)
            {
              uint64_t v35 = [v33 countByEnumeratingWithState:&v62 objects:v67 count:16];
              if (v35) {
                goto LABEL_19;
              }

              goto LABEL_26;
            }
          }

          int v42 = (CUPairedPeer *)v36;

          if (!v42) {
            goto LABEL_27;
          }
          goto LABEL_44;
        }

- (int)savePairedPeer:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  LODWORD(a4) = -[CUPairingDaemon _savePairedPeer:options:removeAdminAllowed:]( v7,  "_savePairedPeer:options:removeAdminAllowed:",  v6,  a4,  0LL);
  objc_sync_exit(v7);

  return a4;
}

- (int)savePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  dispatch_semaphore_t v9 = self;
  objc_sync_enter(v9);
  LODWORD(v5) = -[CUPairingDaemon _savePairedPeer:options:removeAdminAllowed:]( v9,  "_savePairedPeer:options:removeAdminAllowed:",  v8,  a4,  v5);
  objc_sync_exit(v9);

  return v5;
}

- (int)_savePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  uint64_t v127 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  [v7 identifier];
  id v8 = (CUPairedPeer *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_t v9 = v8;
  id v99 = v8;
  if (!v8)
  {
    v103 = 0LL;
    v100 = 0LL;
LABEL_102:
    uint64_t v38 = 0LL;
    uint64_t v35 = 0LL;
    CFMutableDataRef v40 = 0LL;
    id v97 = 0LL;
    id v98 = 0LL;
    uint64_t v13 = 0LL;
    char v41 = 0LL;
    int v42 = 0LL;
    CFTypeID v24 = 0LL;
    int v45 = -6708;
    goto LABEL_109;
  }

  -[CUPairedPeer UUIDString](v8, "UUIDString");
  id v8 = (CUPairedPeer *)objc_claimAutoreleasedReturnValue();
  v103 = v8;
  if (!v8)
  {
    v103 = 0LL;
    v100 = 0LL;
    dispatch_semaphore_t v9 = 0LL;
    goto LABEL_102;
  }

  BOOL v93 = a5;
  id v91 = self;
  -[CUPairingDaemon _findPairedPeer:options:error:](self, "_findPairedPeer:options:error:", v7);
  uint64_t v10 = (CUPairedPeer *)(id)objc_claimAutoreleasedReturnValue();
  v100 = v10;
  if (!v10)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___CUPairedPeer);
    -[CUPairedPeer setIdentifier:](v10, "setIdentifier:", v9);
  }

  uint64_t v11 = (__CFString *)objc_alloc_init(MEMORY[0x189603FC8]);
  -[CUPairedPeer info](v10, "info");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (__CFString *)[v12 mutableCopy];

  if (!v13) {
    uint64_t v13 = (__CFString *)objc_alloc_init(MEMORY[0x189603FC8]);
  }
  v101 = v11;
  v105 = v10;
  uint64_t v14 = [v7 info];
  if (v14) {
    -[__CFString addEntriesFromDictionary:](v13, "addEntriesFromDictionary:", v14);
  }
  id v98 = (void *)v14;
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  -[__CFString allKeys](v13, "allKeys");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v118 objects:v126 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v119;
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v119 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v118 + 1) + 8 * i);
        -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v20);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0) {
          -[__CFString removeObjectForKey:](v13, "removeObjectForKey:", v20);
        }
      }

      uint64_t v17 = [v15 countByEnumeratingWithState:&v118 objects:v126 count:16];
    }

    while (v17);
  }

  -[CUPairedPeer acl](v105, "acl");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  CFTypeID v24 = (const __CFDictionary *)[v23 mutableCopy];

  unint64_t Int64 = CFDictionaryGetInt64(v24, @"com.apple.admin", 0LL);
  if (!v24) {
    CFTypeID v24 = (const __CFDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }
  CFMutableStringRef v102 = v7;
  uint64_t v25 = [v7 acl];
  if (v25) {
    -[__CFDictionary addEntriesFromDictionary:](v24, "addEntriesFromDictionary:", v25);
  }
  id v97 = (void *)v25;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  -[__CFDictionary allKeys](v24, "allKeys");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [v26 countByEnumeratingWithState:&v114 objects:v125 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v115;
    do
    {
      for (uint64_t j = 0LL; j != v28; ++j)
      {
        if (*(void *)v115 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v114 + 1) + 8 * j);
        -[__CFDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v31);
        id v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char v33 = objc_opt_isKindOfClass();

        if ((v33 & 1) != 0) {
          -[__CFDictionary removeObjectForKey:](v24, "removeObjectForKey:", v31);
        }
      }

      uint64_t v28 = [v26 countByEnumeratingWithState:&v114 objects:v125 count:16];
    }

    while (v28);
  }

  unint64_t v34 = CFDictionaryGetInt64(v24, @"com.apple.admin", 0LL);
  if (Int64 && !v34 && !v93)
  {
    uint64_t v38 = 0LL;
    id v8 = 0LL;
    CFMutableDataRef v40 = 0LL;
    char v41 = 0LL;
    int v42 = 0LL;
    int v122 = -6773;
    uint64_t v35 = v101;
    id v7 = v102;
    dispatch_semaphore_t v9 = v105;
    goto LABEL_99;
  }

  uint64_t v35 = v101;
  id v7 = v102;
  dispatch_semaphore_t v9 = v105;
  if (-[__CFDictionary count](v24, "count")) {
    -[__CFString setObject:forKeyedSubscript:](v101, "setObject:forKeyedSubscript:", v24, @"acl");
  }
  else {
    -[__CFString removeObjectForKey:](v101, "removeObjectForKey:", @"acl");
  }
  uint64_t v36 = [v102 altIRK];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    -[CUPairedPeer setAltIRK:](v105, "setAltIRK:", v36);
  }

  else
  {
    -[CUPairedPeer altIRK](v105, "altIRK");
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37) {
      goto LABEL_41;
    }
  }

  -[__CFString setObject:forKeyedSubscript:](v101, "setObject:forKeyedSubscript:", v37, @"altIRK");

LABEL_41:
  [v102 model];
  uint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    uint64_t v39 = -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", @"model");
    if (v39)
    {
      uint64_t v38 = (__CFString *)v39;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = 0LL;
        CFMutableDataRef v40 = 0LL;
        char v41 = 0LL;
        int v42 = 0LL;
LABEL_52:
        int v45 = -6756;
LABEL_109:
        int v122 = v45;
        goto LABEL_99;
      }
    }

    else
    {
      uint64_t v43 = -[CUPairedPeer model](v105, "model");
      if (v43) {
        uint64_t v38 = (__CFString *)v43;
      }
      else {
        uint64_t v38 = &stru_189F34A78;
      }
    }
  }

  -[CUPairedPeer setModel:](v105, "setModel:", v38);
  -[__CFString setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v38, @"model");
  [v102 name];
  int v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    uint64_t v44 = -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", @"name");
    if (v44)
    {
      int v42 = (__CFString *)v44;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = 0LL;
        CFMutableDataRef v40 = 0LL;
        char v41 = 0LL;
        goto LABEL_52;
      }
    }

    else
    {
      uint64_t v46 = -[CUPairedPeer name](v105, "name");
      if (v46) {
        int v42 = (__CFString *)v46;
      }
      else {
        int v42 = &stru_189F34A78;
      }
    }
  }

  -[CUPairedPeer setName:](v105, "setName:", v42);
  -[__CFString removeObjectForKey:](v13, "removeObjectForKey:", @"name");
  uint64_t v47 = [v102 publicKey];
  if (v47)
  {
    char v41 = (void *)v47;
    -[CUPairedPeer setPublicKey:](v105, "setPublicKey:", v47);
  }

  else
  {
    -[CUPairedPeer publicKey](v105, "publicKey");
    id v8 = (CUPairedPeer *)objc_claimAutoreleasedReturnValue();
    char v41 = v8;
    if (!v8)
    {
      CFMutableDataRef v40 = 0LL;
      if (v100) {
        int v45 = -6768;
      }
      else {
        int v45 = -25300;
      }
      goto LABEL_109;
    }
  }

  -[__CFString setObject:forKeyedSubscript:](v101, "setObject:forKeyedSubscript:", v41, @"pk");
  -[CUPairedPeer setInfo:](v105, "setInfo:", v13);
  CFMutableDataRef v48 = OPACKEncoderCreateDataMutable(v13, 0, &v122);
  CFMutableDataRef v40 = v48;
  if (v122)
  {
    id v8 = 0LL;
    goto LABEL_99;
  }

  if (!v48)
  {
    id v8 = 0LL;
    goto LABEL_108;
  }

  id v8 = (CUPairedPeer *)OPACKEncoderCreateDataMutable(v101, 0, &v122);
  if (v122) {
    goto LABEL_99;
  }
  id v96 = v8;
  if (!v8)
  {
LABEL_108:
    int v45 = -6762;
    goto LABEL_109;
  }

  CFMutableStringRef v94 = v40;
  uint64_t v92 = *MEMORY[0x18960BB38];
  int v55 = (const __CFDictionary *)CFCreateF( &v122,  (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}",  v49,  v50,  v51,  v52,  v53,  v54,  *MEMORY[0x18960BB38]);
  __int128 v62 = v55;
  if (!v122)
  {
    id v90 = v55;
    int updated = KeychainUpdateFormatted( v55,  (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O}",  v56,  v57,  v58,  v59,  v60,  v61,  *MEMORY[0x18960B918]);
    int v122 = updated;
    if (updated)
    {
      __int128 v62 = v90;
      if (updated != -25300) {
        goto LABEL_96;
      }
      int v70 = KeychainAddFormatted( 0LL,  (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}",  v64,  v65,  v66,  v67,  v68,  v69,  v92);
      __int128 v62 = v90;
      int v122 = v70;
      if (v70) {
        goto LABEL_96;
      }
      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _savePairedPeer:options:removeAdminAllowed:]",  0x1Eu,  (uint64_t)"Saved %@\n",  v71,  v72,  v73,  v74,  (char)v102);
      }

      __int128 v108 = 0u;
      __int128 v109 = 0u;
      __int128 v106 = 0u;
      __int128 v107 = 0u;
      CFMutableStringRef v75 = v91->_xpcConnections;
      uint64_t v82 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v75,  "countByEnumeratingWithState:objects:count:",  &v106,  v123,  16LL);
      if (v82)
      {
        uint64_t v83 = v82;
        uint64_t v84 = *(void *)v107;
        do
        {
          for (uint64_t k = 0LL; k != v83; ++k)
          {
            if (*(void *)v107 != v84) {
              objc_enumerationMutation(v75);
            }
            uint64_t v86 = *(void *)(*((void *)&v106 + 1) + 8 * k);
            if (*(_BYTE *)(v86 + 32))
            {
              [*(id *)(v86 + 40) remoteObjectProxy];
              __int128 v87 = (void *)objc_claimAutoreleasedReturnValue();
              [v87 pairedPeerAdded:v105 options:a4];
            }
          }

          uint64_t v83 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v75,  "countByEnumeratingWithState:objects:count:",  &v106,  v123,  16LL);
        }

        while (v83);
      }
    }

    else
    {
      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _savePairedPeer:options:removeAdminAllowed:]",  0x1Eu,  (uint64_t)"Updated %@\n",  v66,  v67,  v68,  v69,  (char)v105);
      }

      __int128 v112 = 0u;
      __int128 v113 = 0u;
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      CFMutableStringRef v75 = v91->_xpcConnections;
      uint64_t v76 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v75,  "countByEnumeratingWithState:objects:count:",  &v110,  v124,  16LL);
      if (v76)
      {
        uint64_t v77 = v76;
        uint64_t v78 = *(void *)v111;
        do
        {
          for (uint64_t m = 0LL; m != v77; ++m)
          {
            if (*(void *)v111 != v78) {
              objc_enumerationMutation(v75);
            }
            uint64_t v80 = *(void *)(*((void *)&v110 + 1) + 8 * m);
            if (*(_BYTE *)(v80 + 32))
            {
              [*(id *)(v80 + 40) remoteObjectProxy];
              __int128 v81 = (void *)objc_claimAutoreleasedReturnValue();
              [v81 pairedPeerChanged:v105 options:a4];
            }
          }

          uint64_t v77 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v75,  "countByEnumeratingWithState:objects:count:",  &v110,  v124,  16LL);
        }

        while (v77);
      }
    }

    notify_post("com.apple.pairing.peerChanged");
    __int128 v62 = v90;
  }

- (int)removePairedPeer:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  LODWORD(a4) = -[CUPairingDaemon _removePairedPeer:options:removeAdminAllowed:]( v7,  "_removePairedPeer:options:removeAdminAllowed:",  v6,  a4,  0LL);
  objc_sync_exit(v7);

  return a4;
}

- (int)removePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  dispatch_semaphore_t v9 = self;
  objc_sync_enter(v9);
  LODWORD(v5) = -[CUPairingDaemon _removePairedPeer:options:removeAdminAllowed:]( v9,  "_removePairedPeer:options:removeAdminAllowed:",  v8,  a4,  v5);
  objc_sync_exit(v9);

  return v5;
}

- (int)_removePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  -[CUPairingDaemon _findPairedPeer:options:error:]( self,  "_findPairedPeer:options:error:",  v7,  a4 & 0xFFFFFFFFFFFFFFFDLL,  0LL);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8) {
    id v8 = v7;
  }
  [v8 identifier];
  dispatch_semaphore_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v18 = 0LL;
    goto LABEL_22;
  }

  [v9 UUIDString];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
LABEL_22:
    int v31 = -6708;
    goto LABEL_20;
  }

  int v19 = KeychainDeleteFormatted( (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  *MEMORY[0x18960BB38]);
  if (v19)
  {
    int v31 = v19;
  }

  else
  {
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _removePairedPeer:options:removeAdminAllowed:]",  0x1Eu,  (uint64_t)"Removed %@\n",  v20,  v21,  v22,  v23,  (char)v8);
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    CFTypeID v24 = self->_xpcConnections;
    uint64_t v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (uint64_t i = 0LL; i != v26; ++i)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if (*(_BYTE *)(v29 + 32))
          {
            [*(id *)(v29 + 40) remoteObjectProxy];
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
            [v30 pairedPeerRemoved:v8 options:a4];
          }
        }

        uint64_t v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
      }

      while (v26);
    }

    notify_post("com.apple.pairing.peerChanged");
    int v31 = 0;
  }

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

- (void).cxx_destruct
{
}

void __58__CUPairingDaemon__findHomeKitExPairedPeer_options_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__CUPairingDaemon__copyHomeKitExWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __63__CUPairingDaemon__copyHomeKitLocalPairingIDWithOptions_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __60__CUPairingDaemon_getIdentityWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __36__CUPairingDaemon__rpIdentityUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (v6)
  {
    if (gLogCategory_CUPairingDaemon <= 90
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x5Au)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]_block_invoke",  0x5Au,  (uint64_t)"### Self RPIdentity get failed: %{error}\n",  v7,  v8,  v9,  v10,  (char)v6);
    }

    goto LABEL_40;
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
LABEL_7:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v35 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v13) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }

    id v21 = v16;

    if (!v21) {
      goto LABEL_20;
    }
    id v22 = *(id *)(*(void *)(a1 + 40) + 24LL);
    [v21 deviceIRKData];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = v23;
    if (v23)
    {
      id v29 = v23;
      id v30 = v22;
      int v31 = v30;
      if (v29 == v30)
      {
      }

      else
      {
        if (!v30)
        {

          goto LABEL_32;
        }

        int v32 = [v29 isEqual:v30];

        if (!v32)
        {
LABEL_32:
          if (gLogCategory_CUPairingDaemon <= 30
            && (gLogCategory_CUPairingDaemon != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
          {
            LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]_block_invoke",  0x1Eu,  (uint64_t)"Self RPIdentity IRK changed: %{mask} -> %{mask}\n",  v24,  v25,  v26,  v27,  (char)v31);
          }

          objc_storeStrong((id *)(*(void *)(a1 + 40) + 24LL), v28);
          notify_post("com.apple.pairing.identityChanged");
LABEL_39:

          goto LABEL_40;
        }
      }
    }

    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]_block_invoke",  0x1Eu,  (uint64_t)"Self RPIdentity IRK unchanged: %{mask} -> %{mask}\n",  v24,  v25,  v26,  v27,  (char)v22);
    }

    goto LABEL_39;
  }

uint64_t __54__CUPairingDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionInvalidated:*(void *)(a1 + 40)];
}

uint64_t __29__CUPairingDaemon_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __28__CUPairingDaemon__activate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (*(_DWORD *)(*(void *)(result + 32) + 16LL) != -1)
  {
    uint64_t v8 = result;
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingDaemon _activate]_block_invoke",  0x1Eu,  (uint64_t)"RPIdentities changed\n",  a5,  a6,  a7,  a8,  v9);
    }

    return [*(id *)(v8 + 32) _rpIdentityUpdate];
  }

  return result;
}

CFMutableStringRef __28__CUPairingDaemon__activate__block_invoke_2(uint64_t a1)
{
  return CUStateDumpWithObject((uint64_t)"CUPairingDaemon", *(void **)(a1 + 32), &gLogCategory_CUPairingDaemon);
}

uint64_t __27__CUPairingDaemon_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

+ (id)sharedPairingDaemon
{
  return (id)gPairingDaemon;
}

@end