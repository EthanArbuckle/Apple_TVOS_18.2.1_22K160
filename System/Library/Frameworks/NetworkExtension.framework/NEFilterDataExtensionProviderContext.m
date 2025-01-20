@interface NEFilterDataExtensionProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (NSDictionary)URLAppendStringMap;
- (NSDictionary)remediationMap;
- (id)extensionPoint;
- (id)findFlowWithFlow:(uint64_t)a1;
- (id)socketExceptions;
- (void)applySettings:(id)a3 completionHandler:(id)a4;
- (void)closeBrowserFilterFlow:(uint64_t)a1;
- (void)closeChannelFlow:(id *)a1;
- (void)closeFlow:(id *)a1;
- (void)closeSocketFlow:(uint64_t)a3 socketID:;
- (void)fetchAppInfoForPID:(int)a3 UUID:(id)a4 bundleID:(id)a5 completionHandler:(id)a6;
- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4;
- (void)fetchProviderConnectionWithCompletionHandler:(id)a3;
- (void)handleChannelMessageFlowFinish:(void *)a3 filloutReply:(void *)a4 completionHandler:;
- (void)handleClientMessage:(id)a3 filloutReply:(id)a4 completionHandler:(id)a5;
- (void)handleData:(uint64_t)a3 offset:(void *)a4 forFlow:(uint64_t)a5 direction:(void *)a6 reply:(int)a7 controlSocket:(void *)a8 completionHandler:;
- (void)handleDataCompleteForFlow:(uint64_t)a3 direction:(void *)a4 reply:(int)a5 controlSocket:(void *)a6 completionHandler:;
- (void)handleNewFlow:(void *)a3 reply:(int)a4 controlSocket:(void *)a5 completionHandler:;
- (void)handleRulesChanged;
- (void)provideRemediationMap:(id)a3;
- (void)provideURLAppendStringMap:(id)a3;
- (void)providerControlSocketFileHandle:(id)a3;
- (void)report:(id)a3;
- (void)reportFlow:(void *)a3 forVerdict:(uint64_t)a4 event:;
- (void)reportFlow:(void *)a3 forVerdict:(void *)a4 absoluteVerdict:;
- (void)reportFlowClosed:(void *)a1;
- (void)reportFlowStats:(void *)a1;
- (void)resumeFlow:(id)a3 withVerdict:(id)a4;
- (void)sendBrowserContentFilterServerRequest;
- (void)sendSocketContentFilterRequest;
- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3;
- (void)updateFlow:(id)a3 withVerdict:(id)a4 forDirection:(int64_t)a5;
@end

@implementation NEFilterDataExtensionProviderContext

- (id)extensionPoint
{
  return @"com.apple.networkextension.filter-data";
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v6 = a3;
  id v7 = a4;
  if (self)
  {
    if (v6) {
      BOOL v8 = v6[11] & 1;
    }
    else {
      BOOL v8 = 0;
    }
    self->_controlProviderExists = v8;
  }

  [MEMORY[0x189603FA8] array];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self) {
    objc_storeStrong((id *)&self->_pendingConnections, v9);
  }

  [MEMORY[0x189603F68] dictionary];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self) {
    objc_storeStrong((id *)&self->_remediationMap, v10);
  }

  [MEMORY[0x189603F68] dictionary];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self) {
    objc_storeStrong((id *)&self->_URLAppendStringMap, v11);
  }

  uint64_t v12 = +[NEAppInfoCache sharedAppInfoCache]();
  v13 = (void *)v12;
  if (v12) {
    objc_storeWeak((id *)(v12 + 8), self);
  }
  v14 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NEFilterDataExtensionProviderContext;
  -[NEFilterExtensionProviderContext startFilterWithOptions:completionHandler:]( &v19,  sel_startFilterWithOptions_completionHandler_,  v6,  v7);
  objc_initWeak(&location, self);
  ne_log_obj();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = self;
    _os_log_impl(&dword_1876B1000, v15, OS_LOG_TYPE_DEFAULT, "%@: Calling startFilterWithCompletionHandler", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __81__NEFilterDataExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke;
  v16[3] = &unk_18A08F268;
  objc_copyWeak(&v17, &location);
  [v14 startFilterWithCompletionHandler:v16];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)stopWithReason:(int)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __55__NEFilterDataExtensionProviderContext_stopWithReason___block_invoke;
  v6[3] = &unk_18A08D3E8;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

- (void)providerControlSocketFileHandle:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  int v4 = dup([a3 fileDescriptor]);
  if (self)
  {
    unsigned int v5 = v4;
    if (v4 < 0)
    {
      ne_log_obj();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(handler[0]) = 67109120;
        HIDWORD(handler[0]) = v5;
        _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "Invalid controlSocket value: %d",  (uint8_t *)handler,  8u);
      }
    }

    else
    {
      [MEMORY[0x189603FC8] dictionary];
      v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      socketFlows = self->_socketFlows;
      self->_socketFlows = v6;

      -[NEFilterExtensionProviderContext queue](self, "queue");
      BOOL v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1895F8B60], v5, 0LL, v8);

      if (!v9) {
        return;
      }
      uint64_t v10 = MEMORY[0x1895F87A8];
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke;
      handler[3] = &unk_18A08F098;
      v11 = v9;
      objc_super v19 = v11;
      v20 = self;
      dispatch_source_set_cancel_handler(v11, handler);
      v15[0] = v10;
      v15[1] = 3221225472LL;
      v15[2] = __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke_119;
      v15[3] = &unk_18A08F098;
      uint64_t v12 = v11;
      v16 = v12;
      id v17 = self;
      dispatch_source_set_event_handler(v12, v15);
      dispatch_resume(v12);
      source = self->_source;
      self->_source = (OS_dispatch_source *)v12;
      v14 = v12;
    }
  }

- (void)fetchProviderConnectionWithCompletionHandler:(id)a3
{
  int v4 = (void (**)(id, NSXPCListenerEndpoint *))a3;
  if (!self || !self->_clientListener)
  {
    -[NEFilterExtensionProviderContext queue](self, "queue");
    unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_t v6 = xpc_connection_create(0LL, v5);
    xpc_connection_t v7 = v6;
    if (self)
    {
      objc_storeStrong((id *)&self->_clientListener, v6);

      clientListener = self->_clientListener;
    }

    else
    {

      clientListener = 0LL;
    }

    xpc_endpoint_t v9 = xpc_endpoint_create(clientListener);
    id v10 = objc_alloc_init(MEMORY[0x189607B58]);
    v11 = v10;
    if (self)
    {
      objc_storeStrong((id *)&self->_listenerEndpoint, v10);

      -[NSXPCListenerEndpoint _setEndpoint:](self->_listenerEndpoint, "_setEndpoint:", v9);
      uint64_t v12 = self->_clientListener;
    }

    else
    {

      [0 _setEndpoint:v9];
      uint64_t v12 = 0LL;
    }

    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __85__NEFilterDataExtensionProviderContext_fetchProviderConnectionWithCompletionHandler___block_invoke;
    handler[3] = &unk_18A090220;
    void handler[4] = self;
    xpc_connection_set_event_handler(v12, handler);
    if (!self)
    {
      xpc_connection_resume(0LL);

      listenerEndpoint = 0LL;
      goto LABEL_10;
    }

    xpc_connection_resume(self->_clientListener);
  }

  listenerEndpoint = self->_listenerEndpoint;
LABEL_10:
  v4[2](v4, listenerEndpoint);
}

- (void)handleRulesChanged
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 handleRulesChanged];
}

- (void)provideRemediationMap:(id)a3
{
  id v4 = a3;
  -[NEFilterExtensionProviderContext queue](self, "queue");
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __62__NEFilterDataExtensionProviderContext_provideRemediationMap___block_invoke;
  v7[3] = &unk_18A08F098;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)provideURLAppendStringMap:(id)a3
{
  id v4 = a3;
  -[NEFilterExtensionProviderContext queue](self, "queue");
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __66__NEFilterDataExtensionProviderContext_provideURLAppendStringMap___block_invoke;
  v7[3] = &unk_18A08F098;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sendBrowserContentFilterServerRequest
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendBrowserContentFilterServerRequest];
}

- (void)sendSocketContentFilterRequest
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendSocketContentFilterRequest];
}

- (void)applySettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderContext hostContext](self, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 applySettings:v7 completionHandler:v6];
}

- (void)resumeFlow:(id)a3 withVerdict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!v7 || (v7[13] & 1) == 0)
    {
      -[NEFilterExtensionProviderContext queue](self, "queue");
      id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __63__NEFilterDataExtensionProviderContext_resumeFlow_withVerdict___block_invoke;
      block[3] = &unk_18A08F7C0;
      block[4] = self;
      id v21 = v6;
      id v22 = v7;
      id v9 = v7;
      id v10 = v6;
      dispatch_async(v8, block);

      return;
    }

    v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    v13 = @"Verdict argument cannot be a pause verdict";
  }

  else
  {
    v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    v13 = @"Verdict argument must be a NEFilterDataVerdict or a NEFilterNewFlowVerdict";
  }

  [v11 exceptionWithName:v12 reason:v13 userInfo:0];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v14);
  -[NEFilterDataExtensionProviderContext updateFlow:withVerdict:forDirection:](v15, v16, v17, v18, v19);
}

- (void)updateFlow:(id)a3 withVerdict:(id)a4 forDirection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v9)
    {
      if ((v9[11] & 1) == 0 && ([v9 needRules] & 1) == 0 && (v9[13] & 1) == 0) {
        goto LABEL_6;
      }
    }

    else if (([0 needRules] & 1) == 0)
    {
LABEL_6:
      -[NEFilterExtensionProviderContext queue](self, "queue");
      id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke;
      v22[3] = &unk_18A08C048;
      v22[4] = self;
      id v23 = v8;
      id v24 = v9;
      int64_t v25 = a5;
      v11 = v9;
      id v12 = v8;
      dispatch_async(v10, v22);

      return;
    }

    v13 = (void *)MEMORY[0x189603F70];
    uint64_t v14 = *MEMORY[0x189603A60];
    v15 = @"Verdict argument must be a allow, drop, or data verdict";
  }

  else
  {
    v13 = (void *)MEMORY[0x189603F70];
    uint64_t v14 = *MEMORY[0x189603A60];
    v15 = @"Verdict argument must be a NEFilterDataVerdict";
  }

  [v13 exceptionWithName:v14 reason:v15 userInfo:0];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v16);
  -[NEFilterDataExtensionProviderContext handleClientMessage:filloutReply:completionHandler:](v17, v18, v19, v20, v21);
}

- (void)handleClientMessage:(id)a3 filloutReply:(id)a4 completionHandler:(id)a5
{
  uint64_t v241 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  switch(xpc_dictionary_get_int64(v8, "command"))
  {
    case 2LL:
      if (v9)
      {
        id v11 = v8;
        id v30 = v9;
        v31 = (void (**)(void))v10;
        if (self)
        {
          xpc_object_t xdicta = v30;
          id v213 = v10;
          v226[0] = 0LL;
          memset(applier, 0, sizeof(applier));
          uuid = xpc_dictionary_get_uuid(v11, "flow-uuid");
          int64_t int64 = xpc_dictionary_get_int64(v11, "direction");
          string = xpc_dictionary_get_string(v11, "url");
          v35 = (void *)xpc_dictionary_get_string(v11, "parent-url");
          v36 = xpc_dictionary_get_string(v11, "source-app-bundle-id");
          uint64_t int64 = xpc_dictionary_get_uint64(v11, "source-app-pid");
          uint64_t v190 = xpc_dictionary_get_uint64(v11, "source-pid");
          id newValue = (id)xpc_dictionary_get_uint64(v11, "socket-identifier");
          int v37 = xpc_dictionary_get_uint64(v11, "connection-direction");
          if (uuid && (unint64_t)(int64 - 3) > 0xFFFFFFFFFFFFFFFDLL)
          {
            int v189 = v37;
            if (string)
            {
              [NSString stringWithUTF8String:string];
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38)
              {
                [MEMORY[0x189604030] URLWithString:v38];
                v39 = (void *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                v39 = 0LL;
              }
            }

            else
            {
              v39 = 0LL;
            }

            if (v35)
            {
              [NSString stringWithUTF8String:v35];
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              if (v150)
              {
                [MEMORY[0x189604030] URLWithString:v150];
                v35 = (void *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                v35 = 0LL;
              }
            }

            if (v36) {
              v205 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @".%s", v36);
            }
            else {
              v205 = 0LL;
            }
            v151 = objc_alloc(&OBJC_CLASS___NEFilterBrowserFlow);
            id v200 = v35;
            if (v151
              && (aBlock.receiver = v151,
                  aBlock.super_class = (Class)&OBJC_CLASS___NEFilterBrowserFlow,
                  (v152 = -[NEFilterDataExtensionProviderContext initWithURL:sourceAppIdentifier:]( &aBlock,  sel_initWithURL_sourceAppIdentifier_,  v39,  v205)) != 0LL))
            {
              v153 = v152;
              objc_storeStrong((id *)&v152->_socketExceptions, v35);
              socketFlows = v153->_socketFlows;
              v153->_socketFlows = 0LL;

              channelFlows = v153->_channelFlows;
              v153->_channelFlows = 0LL;

              *(&v153->super.super.super.__dummyExtension + 5) = v205 != 0LL;
              aBlock.receiver = 0LL;
              data = xpc_dictionary_get_data(v11, "crypto-signature", (size_t *)&aBlock);
              if (data && aBlock.receiver)
              {
                v157 = data;
                id v158 = objc_alloc(MEMORY[0x189603F48]);
                v159 = (void *)[v158 initWithBytes:v157 length:aBlock.receiver];
                -[NEFilterDataExtensionProviderContext setCrypto_signature:](v153, "setCrypto_signature:", v159);
              }

              v160 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
              objc_setProperty_atomic_copy(v153, v161, v160, 128LL);

              -[NEFilterDataExtensionProviderContext setEpid:](v153, "setEpid:", uint64);
              -[NEFilterDataExtensionProviderContext setPid:](v153, "setPid:", v190);
              if (v189) {
                uint64_t v162 = 2LL;
              }
              else {
                uint64_t v162 = 1LL;
              }
              -[NEFilterDataExtensionProviderContext setDirection:](v153, "setDirection:", v162);
              xpc_dictionary_get_audit_token();
              v163 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:applier length:32];
              -[NEFilterDataExtensionProviderContext setSourceAppAuditToken:](v153, "setSourceAppAuditToken:", v163);

              xpc_dictionary_get_remote_connection(v11);
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              objc_setProperty_atomic(v153, v165, v164, 144LL);

              v166 = xpc_dictionary_get_data(v11, "url-request", v226);
              if (v166)
              {
                [MEMORY[0x189603F48] dataWithBytes:v166 length:v226[0]];
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                if (v167)
                {
                  v168 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v167 error:0];
                  [v168 decodeObjectOfClass:objc_opt_class() forKey:@"URL_Request"];
                  v169 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NEFilterDataExtensionProviderContext setRequest:](v153, "setRequest:", v169);

                  [v168 finishDecoding];
                }
              }

              v170 = xpc_dictionary_get_data(v11, "url-response", v226);
              if (v170)
              {
                [MEMORY[0x189603F48] dataWithBytes:v170 length:v226[0]];
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                if (v171)
                {
                  v172 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v171 error:0];
                  [v172 decodeObjectOfClass:objc_opt_class() forKey:@"URL_Response"];
                  v173 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NEFilterDataExtensionProviderContext setResponse:](v153, "setResponse:", v173);

                  [v172 finishDecoding];
                }
              }

              if (newValue)
              {
                v174 = -[NEFilterDataExtensionProviderContext socketExceptions]((uint64_t)self);
                [MEMORY[0x189607968] numberWithUnsignedLongLong:newValue];
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                [v174 addObject:v175];
              }

              browserFlows = self->_browserFlows;
              if (!browserFlows)
              {
                [MEMORY[0x189603FC8] dictionary];
                v177 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
                v178 = self->_browserFlows;
                self->_browserFlows = v177;

                browserFlows = self->_browserFlows;
              }

              v179 = browserFlows;
              id v181 = objc_getProperty(v153, v180, 128LL, 1);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v179, "setObject:forKeyedSubscript:", v153, v181);

              id v30 = xdicta;
              -[NEFilterDataExtensionProviderContext handleNewFlow:reply:controlSocket:completionHandler:]( self,  v153,  xdicta,  -1,  v31);
            }

            else
            {

              ne_log_obj();
              v182 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
              {
                LOWORD(aBlock.receiver) = 0;
                _os_log_error_impl( &dword_1876B1000,  v182,  OS_LOG_TYPE_ERROR,  "browserFlow: New flow rejected because flow object creation failed",  (uint8_t *)&aBlock,  2u);
              }

              id v30 = xdicta;
              xpc_dictionary_set_int64(xdicta, "error", 1LL);
              v31[2](v31);
              v153 = 0LL;
            }
          }

          else
          {
            ne_log_obj();
            v128 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(aBlock.receiver) = 0;
              _os_log_debug_impl( &dword_1876B1000,  v128,  OS_LOG_TYPE_DEBUG,  "browserFlow: New flow rejected due to invalid parameters",  (uint8_t *)&aBlock,  2u);
            }

            id v30 = xdicta;
            xpc_dictionary_set_int64(xdicta, "error", 4LL);
            v31[2](v31);
          }

          id v10 = v213;
        }

        goto LABEL_247;
      }

      ne_log_obj();
      v125 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR)) {
        goto LABEL_140;
      }
      LOWORD(applier[0]) = 0;
      v126 = "Reply dictionary is NULL when handling a source new flow message";
      goto LABEL_139;
    case 3LL:
      if (!v9)
      {
        ne_log_obj();
        v125 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR)) {
          goto LABEL_140;
        }
        LOWORD(applier[0]) = 0;
        v126 = "Reply dictionary is NULL when handling a source add data message";
        goto LABEL_139;
      }

      id v11 = v8;
      id v12 = v9;
      uint64_t v14 = (void (**)(void))v10;
      if (!self) {
        goto LABEL_179;
      }
      if (self->_browserFlows)
      {
        v40 = xpc_dictionary_get_uuid(v11, "flow-uuid");
        if (v40)
        {
          size_t v41 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v40];
          ne_log_obj();
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(applier[0]) = 138412290;
            *(size_t *)((char *)applier + 4) = v41;
            _os_log_debug_impl( &dword_1876B1000,  v42,  OS_LOG_TYPE_DEBUG,  "browserFlow: add-data message received, %@",  (uint8_t *)applier,  0xCu);
          }

          xpc_object_t xdictb = (xpc_object_t)v41;
          v43 = -[NSMutableDictionary objectForKey:](self->_browserFlows, "objectForKey:", v41);
          if (v43)
          {
            int64_t v44 = xpc_dictionary_get_int64(v11, "direction");
            aBlock.receiver = 0LL;
            v45 = xpc_dictionary_get_data(v11, "data", (size_t *)&aBlock);
            if (v45 && aBlock.receiver)
            {
              v46 = v45;
              uint64_t v202 = v44;
              applier[0] = 0LL;
              v47 = xpc_dictionary_get_data(v11, "url-request", applier);
              if (v47)
              {
                [MEMORY[0x189603F48] dataWithBytes:v47 length:applier[0]];
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                if (v48)
                {
                  v196 = v46;
                  v49 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v48 error:0];
                  [v49 decodeObjectOfClass:objc_opt_class() forKey:@"URL_Request"];
                  id v214 = v10;
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  [v43 setRequest:v50];

                  id v10 = v214;
                  [v49 finishDecoding];

                  v46 = v196;
                }
              }

              v51 = xpc_dictionary_get_data(v11, "url-response", applier);
              if (v51)
              {
                [MEMORY[0x189603F48] dataWithBytes:v51 length:applier[0]];
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if (v52)
                {
                  v197 = v46;
                  v53 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v52 error:0];
                  [v53 decodeObjectOfClass:objc_opt_class() forKey:@"URL_Response"];
                  id v215 = v10;
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  [v43 setResponse:v54];

                  id v10 = v215;
                  [v53 finishDecoding];

                  v46 = v197;
                }
              }

              uint64_t v55 = xpc_dictionary_get_uint64(v11, "data-start-offset");
              [MEMORY[0x189603F48] dataWithBytes:v46 length:aBlock.receiver];
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              -[NEFilterDataExtensionProviderContext handleData:offset:forFlow:direction:reply:controlSocket:completionHandler:]( self,  v56,  v55,  v43,  v202,  v12,  -1,  v14);

              goto LABEL_191;
            }

            ne_log_obj();
            v149 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(applier[0]) = 138412290;
              *(size_t *)((char *)applier + 4) = (size_t)xdictb;
              _os_log_debug_impl( &dword_1876B1000,  v149,  OS_LOG_TYPE_DEBUG,  "browserFlow: Add data message rejected, invalid data parameter %@",  (uint8_t *)applier,  0xCu);
            }

            v144 = v12;
            int64_t v145 = 4LL;
          }

          else
          {
            ne_log_obj();
            v143 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(applier[0]) = 138412290;
              *(size_t *)((char *)applier + 4) = (size_t)xdictb;
              _os_log_debug_impl( &dword_1876B1000,  v143,  OS_LOG_TYPE_DEBUG,  "browserFlow: Add data message ignored, %@",  (uint8_t *)applier,  0xCu);
            }

            v144 = v12;
            int64_t v145 = 6LL;
          }

          xpc_dictionary_set_int64(v144, "error", v145);
          v14[2](v14);
LABEL_191:

          goto LABEL_179;
        }

        ne_log_obj();
        v138 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v138, OS_LOG_TYPE_ERROR)) {
          goto LABEL_160;
        }
        LOWORD(applier[0]) = 0;
        v139 = "browserFlow: Add data flow rejected due to invalid parameters";
LABEL_250:
        _os_log_error_impl(&dword_1876B1000, v138, OS_LOG_TYPE_ERROR, v139, (uint8_t *)applier, 2u);
LABEL_160:

        v132 = v12;
        int64_t v133 = 4LL;
      }

      else
      {
        ne_log_obj();
        v130 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
          goto LABEL_150;
        }
        LOWORD(applier[0]) = 0;
        v131 = "browserFlow: Add data message rejected, no browser flow exist";
LABEL_238:
        _os_log_error_impl(&dword_1876B1000, v130, OS_LOG_TYPE_ERROR, v131, (uint8_t *)applier, 2u);
LABEL_150:

        v132 = v12;
        int64_t v133 = 1LL;
      }

      xpc_dictionary_set_int64(v132, "error", v133);
      v14[2](v14);
LABEL_179:

LABEL_246:
LABEL_247:

      goto LABEL_248;
    case 4LL:
      if (!v9)
      {
        ne_log_obj();
        v125 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR)) {
          goto LABEL_140;
        }
        LOWORD(applier[0]) = 0;
        v126 = "Reply dictionary is NULL when handling a source data complete message";
        goto LABEL_139;
      }

      id v11 = v8;
      id v12 = v9;
      uint64_t v14 = (void (**)(void))v10;
      if (!self) {
        goto LABEL_179;
      }
      if (!self->_browserFlows)
      {
        ne_log_obj();
        v130 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
          goto LABEL_150;
        }
        LOWORD(applier[0]) = 0;
        v131 = "browserFlow data complete message rejected, no browser flows exist.";
        goto LABEL_238;
      }

      v57 = xpc_dictionary_get_uuid(v11, "flow-uuid");
      if (!v57)
      {
        ne_log_obj();
        v138 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v138, OS_LOG_TYPE_ERROR)) {
          goto LABEL_160;
        }
        LOWORD(applier[0]) = 0;
        v139 = "browserFlow data complete message rejected, invalid Flow UUID parameter";
        goto LABEL_250;
      }

      id v17 = (os_log_s *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v57];
      -[NSMutableDictionary objectForKey:](self->_browserFlows, "objectForKey:", v17);
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        id v212 = v10;
        int64_t v58 = xpc_dictionary_get_int64(v11, "direction");
        objc_msgSend(v19, "setInBytes:", xpc_dictionary_get_uint64(v11, "byte-count-inbound"));
        objc_msgSend(v19, "setOutBytes:", xpc_dictionary_get_uint64(v11, "byte-count-outbound"));
        aBlock.receiver = 0LL;
        v59 = xpc_dictionary_get_data(v11, "crypto-signature", (size_t *)&aBlock);
        if (v59 && aBlock.receiver)
        {
          v60 = v59;
          id v61 = objc_alloc(MEMORY[0x189603F48]);
          v62 = (void *)[v61 initWithBytes:v60 length:aBlock.receiver];
          objc_msgSend(v19, "setCrypto_signature:", v62);
        }

        ne_log_obj();
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(applier[0]) = 138412290;
          *(size_t *)((char *)applier + 4) = (size_t)v17;
          _os_log_debug_impl( &dword_1876B1000,  v63,  OS_LOG_TYPE_DEBUG,  "browserFlow data complete message received, %@",  (uint8_t *)applier,  0xCu);
        }

        -[NEFilterDataExtensionProviderContext handleDataCompleteForFlow:direction:reply:controlSocket:completionHandler:]( self,  v19,  v58,  v12,  -1,  v14);
        goto LABEL_60;
      }

      ne_log_obj();
      v146 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(applier[0]) = 138412290;
        *(size_t *)((char *)applier + 4) = (size_t)v17;
        _os_log_debug_impl( &dword_1876B1000,  v146,  OS_LOG_TYPE_DEBUG,  "browserFlow data complete message ignored, no open flow for %@",  (uint8_t *)applier,  0xCu);
      }

      xpc_dictionary_set_int64(v12, "error", 6LL);
      goto LABEL_176;
    case 5LL:
      if (v9)
      {
        id v64 = v8;
        id v65 = v9;
        v66 = (void (**)(void))v10;
        if (self)
        {
          if (self->_browserFlows)
          {
            v67 = xpc_dictionary_get_uuid(v64, "flow-uuid");
            if (v67)
            {
              uint64_t v68 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v67];
              v69 = self->_browserFlows;
              xpc_object_t xdictc = (xpc_object_t)v68;
              -[NSMutableDictionary objectForKey:](v69, "objectForKey:", v68);
              v70 = (_BYTE *)objc_claimAutoreleasedReturnValue();

              ne_log_obj();
              v71 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              BOOL v72 = os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG);
              if (v70)
              {
                id v203 = v64;
                id v216 = v10;
                if (v72)
                {
                  LODWORD(applier[0]) = 138412290;
                  *(size_t *)((char *)applier + 4) = (size_t)xdictc;
                  _os_log_debug_impl( &dword_1876B1000,  v71,  OS_LOG_TYPE_DEBUG,  "browserFlow: Remediation message received, %@",  (uint8_t *)applier,  0xCu);
                }

                v70[10] = 1;
                v73 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
                size_t v74 = MEMORY[0x1895F87A8];
                aBlock.receiver = (id)MEMORY[0x1895F87A8];
                aBlock.super_class = (Class)3221225472LL;
                v233 = __96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke;
                v234 = &unk_18A08C070;
                id v235 = v73;
                v75 = v70;
                id v236 = v75;
                id v198 = v73;
                v76 = _Block_copy(&aBlock);
                applier[0] = v74;
                applier[1] = 3221225472LL;
                applier[2] = (size_t)__96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke_2;
                applier[3] = (size_t)&unk_18A08C188;
                v77 = v75;
                *(void *)&__int128 v229 = v77;
                *((void *)&v229 + 1) = self;
                id v230 = v65;
                v231 = v66;
                v78 = _Block_copy(applier);
                v79 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]( objc_alloc(&OBJC_CLASS___NEFilterDataSavedMessageHandler),  v76,  v78);
                -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v79, v77, self);

                id v10 = v216;
                id v64 = v203;
              }

              else
              {
                if (v72)
                {
                  LODWORD(applier[0]) = 138412290;
                  *(size_t *)((char *)applier + 4) = (size_t)xdictc;
                  _os_log_debug_impl( &dword_1876B1000,  v71,  OS_LOG_TYPE_DEBUG,  "Remediation message ignored, no open flow for %@",  (uint8_t *)applier,  0xCu);
                }

                xpc_dictionary_set_int64(v65, "error", 6LL);
                v66[2](v66);
              }

              goto LABEL_184;
            }

            ne_log_obj();
            v140 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
            {
              LOWORD(applier[0]) = 0;
              _os_log_error_impl( &dword_1876B1000,  v140,  OS_LOG_TYPE_ERROR,  "Remediation message rejected, invalid flow UUID parameter",  (uint8_t *)applier,  2u);
            }

            v135 = v65;
            int64_t v136 = 4LL;
          }

          else
          {
            ne_log_obj();
            v134 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
            {
              LOWORD(applier[0]) = 0;
              _os_log_error_impl( &dword_1876B1000,  v134,  OS_LOG_TYPE_ERROR,  "Remediation message rejected, no browser flow exists",  (uint8_t *)applier,  2u);
            }

            v135 = v65;
            int64_t v136 = 1LL;
          }

          xpc_dictionary_set_int64(v135, "error", v136);
          v66[2](v66);
        }

- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderContext hostContext](self, v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke;
  v11[3] = &unk_18A08C160;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 fetchCurrentRulesForFlow:v7 completionHandler:v11];
}

- (void)report:(id)a3
{
  id v6 = a3;
  if (self && self->_controlProviderExists)
  {
    -[NEExtensionProviderContext hostContext](self, v4);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 report:v6];
  }
}

- (void)fetchAppInfoForPID:(int)a3 UUID:(id)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  -[NEFilterExtensionProviderContext queue](self, "queue");
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __91__NEFilterDataExtensionProviderContext_fetchAppInfoForPID_UUID_bundleID_completionHandler___block_invoke;
  block[3] = &unk_18A08D8E8;
  int v21 = a3;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(v13, block);
}

- (NSDictionary)remediationMap
{
  return self->_remediationMap;
}

- (NSDictionary)URLAppendStringMap
{
  return self->_URLAppendStringMap;
}

- (void).cxx_destruct
{
}

void __91__NEFilterDataExtensionProviderContext_fetchAppInfoForPID_UUID_bundleID_completionHandler___block_invoke( uint64_t a1,  const char *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    self = objc_alloc_init(&OBJC_CLASS___NEAppInfo);
    if (self)
    {
      self->_pid = *(_DWORD *)(a1 + 64);
      objc_setProperty_nonatomic_copy(self, v4, *(id *)(a1 + 40), 16LL);
      objc_setProperty_nonatomic_copy(self, v5, *(id *)(a1 + 48), 24LL);
    }

    -[NEExtensionProviderContext hostContext](*(void **)(a1 + 32), v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 getSourceAppInfo:self completionHandler:*(void *)(a1 + 56)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

void __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke_2;
  v7[3] = &unk_18A0908C8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)handleChannelMessageFlowFinish:(void *)a3 filloutReply:(void *)a4 completionHandler:
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    int64_t int64 = xpc_dictionary_get_int64(v7, "command");
    uuid = xpc_dictionary_get_uuid(v7, "flow-uuid");
    id v12 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
    if (!v12)
    {
      ne_log_obj();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_DEBUG,  "Finished data message rejected, invalid flow UUID",  buf,  2u);
      }

      if (v8) {
        xpc_dictionary_set_int64(v8, "error", 4LL);
      }
      v9[2](v9);
      goto LABEL_29;
    }

    [a1[20] objectForKey:v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (int64 == 11)
      {
        objc_msgSend(v13, "setInBytes:", xpc_dictionary_get_uint64(v7, "byte-count-inbound"));
        objc_msgSend(v13, "setOutBytes:", xpc_dictionary_get_uint64(v7, "byte-count-outbound"));
      }

      size_t length = 0LL;
      data = xpc_dictionary_get_data(v7, "crypto-signature", &length);
      if (data && length)
      {
        id v15 = data;
        id v16 = objc_alloc(MEMORY[0x189603F48]);
        id v17 = (void *)[v16 initWithBytes:v15 length:length];
        objc_msgSend(v13, "setCrypto_signature:", v17);
      }

      if (int64 != 11)
      {
        else {
          uint64_t v21 = 2LL;
        }
        ne_log_obj();
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          id v23 = "in";
          *(_DWORD *)buf = 136315394;
          id v26 = v23;
          __int16 v27 = 2112;
          v28 = v12;
          _os_log_debug_impl( &dword_1876B1000,  v22,  OS_LOG_TYPE_DEBUG,  "Received finished %sbound data for %@",  buf,  0x16u);
        }

        -[NEFilterDataExtensionProviderContext handleDataCompleteForFlow:direction:reply:controlSocket:completionHandler:]( a1,  v13,  v21,  v8,  -1,  v9);
        goto LABEL_28;
      }

      ne_log_obj();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = (const char *)v12;
        _os_log_debug_impl(&dword_1876B1000, v18, OS_LOG_TYPE_DEBUG, "Finished flow for %@", buf, 0xCu);
      }

      -[NEFilterDataExtensionProviderContext closeChannelFlow:](a1, v13);
    }

    else
    {
      ne_log_obj();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = (const char *)v12;
        _os_log_debug_impl( &dword_1876B1000,  v20,  OS_LOG_TYPE_DEBUG,  "Finished data message rejected, no flow found for %@",  buf,  0xCu);
      }

      if (v8)
      {
        xpc_dictionary_set_uuid(v8, "flow-uuid", uuid);
        xpc_dictionary_set_int64(v8, "error", 6LL);
      }
    }

    v9[2](v9);
LABEL_28:

LABEL_29:
  }
}

uint64_t __103__NEFilterDataExtensionProviderContext_handleChannelMessageStatsReport_filloutReply_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1895ADD58](v4) == MEMORY[0x1895F9250])
  {
    uuid = xpc_dictionary_get_uuid(v5, "flow-uuid");
    if (uuid)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        id v9 = *(void **)(v8 + 160);
      }
      else {
        id v9 = 0LL;
      }
      [v9 objectForKey:v7];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v10, "setInBytes:", xpc_dictionary_get_uint64(v5, "byte-count-inbound"));
        objc_msgSend(v10, "setOutBytes:", xpc_dictionary_get_uint64(v5, "byte-count-outbound"));
        *(void *)&buf.sa_len = 0LL;
        *(void *)&buf.sa_data[6] = 0LL;
        int v17 = 0;
        uint64_t v16 = 0LL;
        if (xpc_dictionary_get_data(v5, "local-addr", &length) && length <= 0x1C)
        {
          __memcpy_chk();
          -[NEFilterSocketFlow setLocalAddress:](v10, &buf);
        }

        -[NEFilterDataExtensionProviderContext reportFlowStats:](*(void **)(a1 + 32), v10);
      }

      else
      {
        ne_log_obj();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)&buf.sa_len = 138412290;
          *(void *)&buf.sa_data[2] = v7;
          _os_log_debug_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_DEBUG,  "Channel Stats Report - no flow found for %@",  &buf.sa_len,  0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }
    }

    else
    {
      ne_log_obj();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)&buf.sa_len = 0;
        _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "Channel Stats Report - flow stats with no flow UUID",  &buf.sa_len,  2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

  return 1LL;
}

- (void)reportFlowStats:(void *)a1
{
  id v3 = a2;
  id v5 = v3;
  if (a1)
  {
    if (v3) {
      id Property = objc_getProperty(v3, v4, 112LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v7 = Property;
    uint64_t v8 = (void *)[v7 copy];

    if (v8)
    {
      [v8 setShouldReport:1];
      -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](a1, v5, v8, 4LL);
    }

    else
    {
      ne_log_obj();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v10 = 0;
        _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "No current verdict available, cannot report flow stats",  v10,  2u);
      }
    }
  }
}

- (void)reportFlow:(void *)a3 forVerdict:(uint64_t)a4 event:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (a1 && v8 && [v8 shouldReport])
  {
    if (v7) {
      v7[12] = 1;
    }
    objc_opt_class();
    BOOL v10 = (objc_opt_isKindOfClass() & 1) == 0
       && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
       && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
       || [v9 statisticsReportFrequency] == 0;
    uint64_t v11 = [v9 filterAction];
    if (!v10 || v11)
    {
      v13 = -[NEFilterReport initWithFlow:action:event:](objc_alloc(&OBJC_CLASS___NEFilterReport), v7, v11, a4);
      [a1 report:v13];
      if ((unint64_t)(a4 - 3) <= 1 && ([v9 drop] & 1) == 0)
      {
        [a1 _principalObject];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 handleReport:v13];
      }
    }

    else
    {
      ne_log_obj();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412546;
        uint64_t v16 = v9;
        __int16 v17 = 2048;
        uint64_t v18 = a4;
        _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "Failed to get an action for verdict (%@), cannot generate flow report with type %ld",  (uint8_t *)&v15,  0x16u);
      }
    }
  }
}

- (void)closeChannelFlow:(id *)a1
{
  id v3 = a2;
  -[NEFilterDataExtensionProviderContext reportFlowClosed:](a1, v3);
  if (v3)
  {
    objc_setProperty_atomic(v3, v4, 0LL, 144LL);
    id v5 = a1[20];
    id Property = objc_getProperty(v3, v6, 128LL, 1);
  }

  else
  {
    id v5 = a1[20];
    id Property = 0LL;
  }

  id v8 = Property;

  [v5 removeObjectForKey:v8];
}

- (void)handleDataCompleteForFlow:(uint64_t)a3 direction:(void *)a4 reply:(int)a5 controlSocket:(void *)a6 completionHandler:
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a6;
  [a1 _principalObject];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke;
  aBlock[3] = &unk_18A08C138;
  uint64_t v35 = a3;
  id v16 = v11;
  id v32 = v16;
  v33 = a1;
  id v34 = v14;
  id v17 = v14;
  uint64_t v18 = _Block_copy(aBlock);
  v24[0] = v15;
  v24[1] = 3221225472LL;
  v24[2] = __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke_128;
  v24[3] = &unk_18A08C0E8;
  uint64_t v29 = a3;
  id v19 = v16;
  id v25 = v19;
  id v20 = v12;
  int v30 = a5;
  id v26 = v20;
  __int16 v27 = a1;
  id v21 = v13;
  id v28 = v21;
  id v22 = _Block_copy(v24);
  id v23 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]( objc_alloc(&OBJC_CLASS___NEFilterDataSavedMessageHandler),  v18,  v22);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v23, v19, a1);
}

id __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke( uint64_t a1,  const char *a2)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 56);
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 112LL, 1);
  }
  id v5 = Property;
  SEL v6 = v5;
  if (v3 == 2) {
    uint64_t v7 = [v5 inboundPassOffset];
  }
  else {
    uint64_t v7 = [v5 outboundPassOffset];
  }
  uint64_t v8 = v7;

  ne_log_obj();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (*(void *)(a1 + 56) == 2LL) {
      id v23 = @"Inbound";
    }
    else {
      id v23 = @"Outbound";
    }
    [*(id *)(a1 + 32) identifier];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 UUIDString];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    id v27 = *(id *)(a1 + 32);
    if (v27) {
      id v27 = objc_getProperty(v27, v25, 112LL, 1);
    }
    id v28 = v27;
    int v29 = 138413058;
    int v30 = v23;
    __int16 v31 = 2112;
    id v32 = v26;
    __int16 v33 = 2048;
    uint64_t v34 = v8;
    __int16 v35 = 1024;
    int v36 = [v28 shouldReport];
    _os_log_debug_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEBUG,  "%@ handleDataCompleteForFlow - for flow %@ passOffset %llu shouldReport %d",  (uint8_t *)&v29,  0x26u);
  }

  uint64_t v11 = *(void *)(a1 + 56);
  if (v11 == 1)
  {
    [*(id *)(a1 + 32) setOutputComplete:1];
  }

  else if (v11 == 2)
  {
    [*(id *)(a1 + 32) setInputComplete:1];
  }

  id v12 = *(id *)(a1 + 32);
  if (v12) {
    id v12 = objc_getProperty(v12, v10, 112LL, 1);
  }
  id v13 = v12;
  if ([v13 shouldReport] && objc_msgSend(*(id *)(a1 + 32), "inputComplete"))
  {
    int v14 = [*(id *)(a1 + 32) outputComplete];

    if (!v14) {
      goto LABEL_20;
    }
    id v17 = *(void **)(a1 + 32);
    id v16 = *(void **)(a1 + 40);
    if (v17) {
      id v18 = objc_getProperty(*(id *)(a1 + 32), v15, 112LL, 1);
    }
    else {
      id v18 = 0LL;
    }
    id v13 = v18;
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](v16, v17, v13, 3LL);
  }

LABEL_20:
  if (v8 == -1)
  {
    +[NEFilterDataVerdict allowVerdict](&OBJC_CLASS___NEFilterDataVerdict, "allowVerdict");
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v19 = *(void **)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 32);
    if (*(void *)(a1 + 56) == 2LL) {
      [v19 handleInboundDataCompleteForFlow:v20];
    }
    else {
      [v19 handleOutboundDataCompleteForFlow:v20];
    }
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

void __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke_128( uint64_t a1,  void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(a1 + 64) == 2LL) {
        uint64_t v11 = @"Inbound";
      }
      else {
        uint64_t v11 = @"Outbound";
      }
      [*(id *)(a1 + 32) identifierString];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = 138412802;
      int v14 = v11;
      __int16 v15 = 2112;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_debug_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEBUG,  "%@ data complete verdict for flow %@: %@",  (uint8_t *)&v13,  0x20u);
    }
  }

  if ([*(id *)(a1 + 32) createDataCompleteReply:*(void *)(a1 + 40) controlSocket:*(unsigned int *)(a1 + 72) direction:*(void *)(a1 + 64) verdict:v3 context:*(void *)(a1 + 48)]) {
    -[NEFilterDataExtensionProviderContext closeFlow:](*(id **)(a1 + 48), *(void **)(a1 + 32));
  }
  if (v3)
  {
    SEL v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7) {
      id Property = objc_getProperty(*(id *)(a1 + 32), v5, 112LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v9 = Property;
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:absoluteVerdict:](v6, v7, v3, v9);
  }

  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (void)closeFlow:(id *)a1
{
  id v6 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NEFilterDataExtensionProviderContext closeBrowserFilterFlow:]((uint64_t)a1, v6);
      goto LABEL_10;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v3 = v6;
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = v3[25];
      if (v5 == -1)
      {
        -[NEFilterDataExtensionProviderContext closeChannelFlow:](a1, v3);
        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    -[NEFilterDataExtensionProviderContext closeSocketFlow:socketID:](a1, v3, v5);
LABEL_9:
  }

- (void)reportFlow:(void *)a3 forVerdict:(void *)a4 absoluteVerdict:
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1 && v10 && v8 && [v7 shouldReport])
  {
    id v9 = (void *)[v8 copy];
    if (([v9 drop] & 1) != 0
      || [v9 inboundPassOffset] == -1 && objc_msgSend(v9, "outboundPassOffset") == -1)
    {
      [v9 setShouldReport:1];
      -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](a1, v10, v9, 2LL);
    }
  }
}

- (void)closeBrowserFilterFlow:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v5 = v3;
    if (v3)
    {
      objc_setProperty_atomic(v3, v4, 0LL, 144LL);
      id v6 = *(id *)(a1 + 144);
      id Property = objc_getProperty(v5, v7, 128LL, 1);
    }

    else
    {
      id v6 = *(id *)(a1 + 144);
      id Property = 0LL;
    }

    id v9 = Property;

    [v6 removeObjectForKey:v9];
  }

- (void)closeSocketFlow:(uint64_t)a3 socketID:
{
  uint64_t v5 = (void *)a1[19];
  id v6 = (void *)MEMORY[0x189607968];
  id v7 = v5;
  [v6 numberWithUnsignedLongLong:a3];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 removeObjectForKey:v8];
}

- (void)reportFlowClosed:(void *)a1
{
  id v3 = a2;
  uint64_t v5 = v3;
  if (v3 && (v3[12] & 1) != 0)
  {
    id v6 = objc_getProperty(v3, v4, 112LL, 1);
    id v7 = (void *)[v6 copy];

    if (v7)
    {
      [v7 setShouldReport:1];
      -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](a1, v5, v7, 3LL);
    }

    else
    {
      ne_log_obj();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v9 = 0;
        _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "No current verdict available, cannot report flow closed",  v9,  2u);
      }
    }
  }
}

- (void)handleData:(uint64_t)a3 offset:(void *)a4 forFlow:(uint64_t)a5 direction:(void *)a6 reply:(int)a7 controlSocket:(void *)a8 completionHandler:
{
  id v14 = a2;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  [a1 queue];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke;
  v24[3] = &unk_18A08C110;
  void v24[4] = a1;
  uint64_t v29 = a3;
  id v19 = v14;
  id v25 = v19;
  id v20 = v15;
  id v26 = v20;
  uint64_t v30 = a5;
  id v21 = v16;
  id v27 = v21;
  int v31 = a7;
  id v22 = v17;
  id v28 = v22;
  -[NEFilterFlow updateSourceAppInfoWithQueue:completionHandler:](v20, v18, v24);
}

void __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[2] = __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_2;
  aBlock[3] = &unk_18A08C0C0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 72);
  void aBlock[4] = v3;
  uint64_t v5 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  id v21 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v25 = *(void *)(a1 + 80);
  id v22 = v6;
  id v23 = v2;
  id v7 = v2;
  id v8 = _Block_copy(aBlock);
  v13[0] = v5;
  v13[1] = 3221225472LL;
  v13[2] = __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_3;
  v13[3] = &unk_18A08C0E8;
  uint64_t v18 = *(void *)(a1 + 80);
  id v14 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  int v19 = *(_DWORD *)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v9;
  uint64_t v16 = v10;
  id v17 = *(id *)(a1 + 64);
  uint64_t v11 = _Block_copy(v13);
  id v12 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]( objc_alloc(&OBJC_CLASS___NEFilterDataSavedMessageHandler),  v8,  v11);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v12, *(void **)(a1 + 48), *(void **)(a1 + 32));
}

id __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 48);
  unint64_t v5 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 40);
  id v7 = v3;
  id v9 = v7;
  if (!v2) {
    goto LABEL_14;
  }
  if (v7) {
    id Property = objc_getProperty(v7, v8, 112LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  id v12 = v11;
  if (v4 == 2) {
    uint64_t v13 = [v11 inboundPassOffset];
  }
  else {
    uint64_t v13 = [v11 outboundPassOffset];
  }
  unint64_t v14 = v13;

  unint64_t v15 = v14 - v5;
  if (v14 <= v5)
  {
    id v17 = v6;
LABEL_15:
    unint64_t v14 = v5;
    goto LABEL_20;
  }

  if (v14 == -1LL)
  {
LABEL_14:
    id v17 = 0LL;
    goto LABEL_15;
  }

  id v16 = v9;
  if ([v16 socketProtocol] != 17 && objc_msgSend(v16, "socketProtocol") != 6)
  {
    unint64_t v18 = v15 + 4;
    if (v15 + 4 < [v6 length])
    {
      id v19 = objc_alloc(MEMORY[0x189603FB8]);
      objc_msgSend(v6, "subdataWithRange:", 0, 4);
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = (id)[v19 initWithData:v20];

      objc_msgSend(v6, "subdataWithRange:", v18, objc_msgSend(v6, "length") - v18);
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 appendData:v21];

      goto LABEL_19;
    }

void __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_3( uint64_t a1,  void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(a1 + 64) == 2LL) {
        id v11 = @"Inbound";
      }
      else {
        id v11 = @"Outbound";
      }
      [*(id *)(a1 + 32) identifierString];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = 138412802;
      unint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_debug_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEBUG,  "%@ data verdict for flow %@: %@",  (uint8_t *)&v13,  0x20u);
    }
  }

  if ([*(id *)(a1 + 32) createDataReply:*(void *)(a1 + 40) controlSocket:*(unsigned int *)(a1 + 72) direction:*(void *)(a1 + 64) verdict:v3 context:*(void *)(a1 + 48)]) {
    -[NEFilterDataExtensionProviderContext closeFlow:](*(id **)(a1 + 48), *(void **)(a1 + 32));
  }
  if (v3)
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = *(void **)(a1 + 32);
    if (v7) {
      id Property = objc_getProperty(*(id *)(a1 + 32), v5, 112LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v9 = Property;
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:absoluteVerdict:](v6, v7, v3, v9);
  }

  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (void)handleNewFlow:(void *)a3 reply:(int)a4 controlSocket:(void *)a5 completionHandler:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  [a1 queue];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke;
  v16[3] = &unk_18A08D8E8;
  void v16[4] = a1;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  int v20 = a4;
  id v15 = v11;
  id v19 = v15;
  -[NEFilterFlow updateSourceAppInfoWithQueue:completionHandler:](v13, v12, v16);
}

void __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2;
  block[3] = &unk_18A08D8E8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  int v10 = *(_DWORD *)(a1 + 64);
  id v9 = *(id *)(a1 + 56);
  dispatch_async(v2, block);
}

void __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)sockaddr buf = 138412290;
      uint64_t v22 = v11;
      _os_log_debug_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEBUG, "Handling new flow: %@", buf, 0xCu);
    }
  }

  [*(id *)(a1 + 40) _principalObject];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_122;
  aBlock[3] = &unk_18A08C070;
  id v19 = v3;
  id v20 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = _Block_copy(aBlock);
  v12[0] = v4;
  v12[1] = 3221225472LL;
  v12[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2_123;
  v12[3] = &unk_18A08C098;
  id v13 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  int v17 = *(_DWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = *(id *)(a1 + 56);
  id v9 = _Block_copy(v12);
  int v10 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]( objc_alloc(&OBJC_CLASS___NEFilterDataSavedMessageHandler),  v6,  v9);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v10, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_122( uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNewFlow:*(void *)(a1 + 40)];
}

void __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2_123( uint64_t a1,  void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) identifier];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 UUIDString];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_debug_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEBUG, "New flow verdict for %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }

  if ([*(id *)(a1 + 32) createNewFlowReply:*(void *)(a1 + 40) controlSocket:*(unsigned int *)(a1 + 64) verdict:v3 context:*(void *)(a1 + 48)]) {
    -[NEFilterDataExtensionProviderContext closeFlow:](*(id **)(a1 + 48), *(void **)(a1 + 32));
  }
  if (v3) {
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:]( *(void **)(a1 + 48),  *(void **)(a1 + 32),  v3,  1LL);
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRemediationForFlow:*(void *)(a1 + 40)];
}

void __96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) identifierString];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = 138412546;
      id v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_debug_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEBUG,  "Remediation verdict for %@: %@",  (uint8_t *)&v6,  0x16u);
    }
  }

  -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:]( *(void **)(a1 + 40),  *(void **)(a1 + 32),  v3,  1LL);
  else {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "verdict-drop", 1);
  }
  -[NEFilterDataExtensionProviderContext closeBrowserFilterFlow:](*(void *)(a1 + 40), *(void **)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (id)socketExceptions
{
  uint64_t v2 = *(void **)(a1 + 168);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x189603FA8] array];
    uint64_t v4 = *(void **)(a1 + 168);
    *(void *)(a1 + 168) = v3;

    uint64_t v2 = *(void **)(a1 + 168);
  }

  return v2;
}

void __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke( uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NEFilterDataExtensionProviderContext findFlowWithFlow:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    ne_log_obj();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    [*(id *)(a1 + 40) identifierString];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)sockaddr buf = 138412290;
    id v21 = v11;
    uint64_t v12 = "Cannot update the verdict for flow %@ which does not exist";
LABEL_8:
    _os_log_impl(&dword_1876B1000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);

    goto LABEL_9;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    [v2 identifierString];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)sockaddr buf = 138412290;
    id v21 = v11;
    uint64_t v12 = "Cannot update the verdict for flow %@ which is not a socket flow";
    goto LABEL_8;
  }

  uint64_t v3 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_114;
  aBlock[3] = &unk_18A08BFF8;
  id v19 = (os_log_s *)*(id *)(a1 + 48);
  uint64_t v4 = _Block_copy(aBlock);
  v13[0] = v3;
  v13[1] = 3221225472LL;
  v13[2] = __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_2;
  v13[3] = &unk_18A08C020;
  id v5 = v2;
  id v14 = v5;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v15 = v6;
  uint64_t v16 = v7;
  uint64_t v17 = *(void *)(a1 + 56);
  __int16 v8 = _Block_copy(v13);
  id v9 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]( objc_alloc(&OBJC_CLASS___NEFilterDataSavedMessageHandler),  v4,  v8);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v9, v5, *(void **)(a1 + 32));

  uint64_t v10 = v19;
LABEL_9:
}

- (id)findFlowWithFlow:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v4 = v3;
      id v5 = v4;
      if (v4 && v4[25] == -1LL)
      {
        id v8 = *(id *)(a1 + 160);
        id v10 = objc_getProperty(v5, v15, 128LL, 1);
      }

      else
      {
        id v6 = *(void **)(a1 + 152);
        uint64_t v7 = (void *)MEMORY[0x189607968];
        id v8 = v6;
        if (v5) {
          uint64_t v9 = v5[25];
        }
        else {
          uint64_t v9 = 0LL;
        }
        [v7 numberWithUnsignedLongLong:v9];
        id v10 = (id)objc_claimAutoreleasedReturnValue();
      }

      id v12 = v10;
      [v8 objectForKeyedSubscript:v10];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v12 = *(id *)(a1 + 144);
      if (v3) {
        id Property = objc_getProperty(v3, v11, 128LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v5 = Property;
      [v12 objectForKeyedSubscript:v5];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      goto LABEL_16;
    }
  }

  id v14 = 0LL;
LABEL_16:

  return v14;
}

id __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_114( uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) identifierString];
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = *(void *)(a1 + 40);
      int v30 = 138412546;
      int v31 = v28;
      __int16 v32 = 2112;
      uint64_t v33 = v29;
      _os_log_debug_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEBUG,  "Provider set data verdict for flow %@: %@",  (uint8_t *)&v30,  0x16u);
    }
  }

  id v5 = *(void **)(a1 + 32);
  if (!v5 || v5[25] != -1LL)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6 && (uint64_t v7 = *(dispatch_source_s **)(v6 + 176)) != 0LL)
    {
      uintptr_t handle = dispatch_source_get_handle(v7);
      if ((handle & 0x80000000) == 0)
      {
        xpc_object_t v10 = 0LL;
        goto LABEL_12;
      }

      ne_log_obj();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_33:
        xpc_object_t v10 = 0LL;
        goto LABEL_34;
      }

      [*(id *)(a1 + 32) identifierString];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      int v30 = 138412290;
      int v31 = v24;
      uint64_t v25 = "Failed to find control socket to update verdict for flow %@";
    }

    else
    {
      ne_log_obj();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      [*(id *)(a1 + 32) identifierString];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      int v30 = 138412290;
      int v31 = v24;
      uint64_t v25 = "Failed to find control socket source to update verdict for flow %@";
    }

    _os_log_error_impl(&dword_1876B1000, v23, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v30, 0xCu);

    goto LABEL_33;
  }

  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v5 = *(void **)(a1 + 32);
  uintptr_t handle = 0xFFFFFFFFLL;
LABEL_12:
  if (v5) {
    id Property = objc_getProperty(v5, v8, 112LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v12 = Property;

  if (!v12)
  {
    ne_log_obj();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) identifierString];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      int v30 = 138412290;
      int v31 = v26;
      id v27 = "Cannot update the verdict for flow %@ because a NEFilterNewFlowVerdict has not yet been provided for this flow";
LABEL_38:
      _os_log_error_impl(&dword_1876B1000, v23, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v30, 0xCu);
    }

void __63__NEFilterDataExtensionProviderContext_resumeFlow_withVerdict___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  -[NEFilterDataExtensionProviderContext findFlowWithFlow:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v2;
  if (!v2)
  {
    ne_log_obj();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 40) identifierString];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v25 = 138412290;
      id v26 = v21;
      _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEFAULT,  "Ignoring resume command for flow %@ which does not exist",  (uint8_t *)&v25,  0xCu);
    }

    goto LABEL_15;
  }

  if ((v2[11] & 1) != 0)
  {
    id v5 = objc_getProperty(v2, v3, 136LL, 1);
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v4[11] = 0;
      id v8 = objc_getProperty(v4, v7, 136LL, 1);
      [v8 firstObject];
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      id v11 = objc_getProperty(v4, v10, 136LL, 1);
      [v11 removeObjectAtIndex:0];

      -[NEFilterDataSavedMessageHandler executeVerdictHandlerWithFlow:verdict:context:]( (uint64_t)v9,  v4,  *(void **)(a1 + 48),  *(void **)(a1 + 32));
      while ((v4[11] & 1) == 0)
      {
        id v13 = objc_getProperty(v4, v12, 136LL, 1);
        uint64_t v14 = [v13 count];

        if (!v14) {
          break;
        }
        id v15 = objc_getProperty(v4, v12, 136LL, 1);
        uint64_t v16 = [v15 firstObject];

        id v18 = objc_getProperty(v4, v17, 136LL, 1);
        [v18 removeObjectAtIndex:0];

        -[NEFilterDataSavedMessageHandler executeWithFlow:context:](v16, v4, *(void **)(a1 + 32));
        uint64_t v9 = (os_log_s *)v16;
      }

      id v22 = objc_getProperty(v4, v12, 136LL, 1);
      uint64_t v23 = [v22 count];

      if (!v23) {
        objc_setProperty_atomic(v4, v24, 0LL, 136LL);
      }
LABEL_15:

      goto LABEL_16;
    }
  }

  ne_log_obj();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    [v4 identifierString];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    int v25 = 138412290;
    id v26 = v20;
    _os_log_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_DEFAULT,  "Ignoring resume command for flow %@ which is not paused",  (uint8_t *)&v25,  0xCu);
  }

LABEL_16:
}

void __66__NEFilterDataExtensionProviderContext_provideURLAppendStringMap___block_invoke(uint64_t a1)
{
}

void __62__NEFilterDataExtensionProviderContext_provideRemediationMap___block_invoke(uint64_t a1)
{
}

void __85__NEFilterDataExtensionProviderContext_fetchProviderConnectionWithCompletionHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v9 = v3;
    BOOL v4 = MEMORY[0x1895ADD58]() == MEMORY[0x1895F9238];
    id v3 = v9;
    if (v4)
    {
      id v5 = *(id **)(a1 + 32);
      uint64_t v6 = (_xpc_connection_s *)v9;
      if (v5)
      {
        if (([v5[23] containsObject:v6] & 1) == 0) {
          [v5[23] addObject:v6];
        }
        [v5 queue];
        uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        xpc_connection_set_target_queue(v6, v7);

        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke;
        handler[3] = &unk_18A08DC38;
        void handler[4] = v5;
        id v8 = v6;
        id v11 = v8;
        xpc_connection_set_event_handler(v8, handler);
        xpc_connection_resume(v8);
      }

      id v3 = v9;
    }
  }
}

void __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  BOOL v4 = v3;
  if (v3 && MEMORY[0x1895ADD58](v3) == MEMORY[0x1895F9250])
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke_2;
    v29[3] = &unk_18A08F098;
    id v30 = reply;
    id v28 = *(void **)(a1 + 32);
    id v31 = *(id *)(a1 + 40);
    uint64_t v6 = reply;
    [v28 handleClientMessage:v4 filloutReply:v6 completionHandler:v29];
  }

  else
  {
    id v5 = *(id **)(a1 + 32);
    uint64_t v6 = (_xpc_connection_s *)*(id *)(a1 + 40);
    if (v5)
    {
      [v5[18] allValues];
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v8)
      {
        uint64_t v10 = v8;
        uint64_t v11 = *(void *)v37;
        do
        {
          uint64_t v12 = 0LL;
          do
          {
            if (*(void *)v37 != v11) {
              objc_enumerationMutation(v7);
            }
            id v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
            if (v13) {
              id Property = objc_getProperty(*(id *)(*((void *)&v36 + 1) + 8 * v12), v9, 144LL, 1);
            }
            else {
              id Property = 0LL;
            }
            id v15 = (_xpc_connection_s *)Property;

            if (v15 == v6) {
              -[NEFilterDataExtensionProviderContext closeBrowserFilterFlow:]((uint64_t)v5, v13);
            }
            ++v12;
          }

          while (v10 != v12);
          uint64_t v16 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
          uint64_t v10 = v16;
        }

        while (v16);
      }

      [v5[20] allValues];
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v18)
      {
        uint64_t v20 = v18;
        uint64_t v21 = *(void *)v33;
        do
        {
          uint64_t v22 = 0LL;
          do
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v17);
            }
            uint64_t v23 = *(void **)(*((void *)&v32 + 1) + 8 * v22);
            if (v23) {
              id v24 = objc_getProperty(*(id *)(*((void *)&v32 + 1) + 8 * v22), v19, 144LL, 1);
            }
            else {
              id v24 = 0LL;
            }
            int v25 = (_xpc_connection_s *)v24;

            if (v25 == v6) {
              -[NEFilterDataExtensionProviderContext closeChannelFlow:](v5, v23);
            }
            ++v22;
          }

          while (v20 != v22);
          uint64_t v26 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
          uint64_t v20 = v26;
        }

        while (v26);
      }

      xpc_connection_cancel(v6);
    }
  }
}

void __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v1);
  }
}

void __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke( uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_INFO, "socket source cancel handler called", v5, 2u);
  }

  int handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  close(handle);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    objc_storeStrong((id *)(v4 + 176), 0LL);
  }
}

void __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke_119( uint64_t a1)
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  int handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3) {
    return;
  }
  int v4 = handle;
  socklen_t v98 = 4;
  int v99 = 0;
  if (getsockopt(handle, 0xFFFF, 4128, &v99, &v98))
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v31 = __error();
      __int128 v32 = strerror(*v31);
      *(_DWORD *)id v107 = 136315138;
      v108 = v32;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "Could not get packet size. Received error: %s",  v107,  0xCu);
    }

void __74__NEFilterDataExtensionProviderContext_handleSocketSourceEventWithSocket___block_invoke(uint64_t a1)
{
}

void __55__NEFilterDataExtensionProviderContext_stopWithReason___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 144);
  }
  else {
    uint64_t v3 = 0LL;
  }
  [v3 allValues];
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v45;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(v4);
        }
        size_t v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
        if (v10) {
          objc_setProperty_atomic(v10, v6, 0LL, 144LL);
        }
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }

    while (v7);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    BOOL v12 = *(void **)(v11 + 144);
  }
  else {
    BOOL v12 = 0LL;
  }
  [v12 removeAllObjects];
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    uint64_t v14 = *(void **)(v13 + 160);
  }
  else {
    uint64_t v14 = 0LL;
  }
  [v14 allValues];
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v41;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void **)(*((void *)&v40 + 1) + 8 * v20);
        if (v21) {
          objc_setProperty_atomic(v21, v17, 0LL, 144LL);
        }
        ++v20;
      }

      while (v18 != v20);
      uint64_t v18 = [v15 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }

    while (v18);
  }

  uint64_t v22 = *(void *)(a1 + 32);
  if (v22) {
    uint64_t v23 = *(void **)(v22 + 160);
  }
  else {
    uint64_t v23 = 0LL;
  }
  [v23 removeAllObjects];
  uint64_t v24 = *(void *)(a1 + 32);
  if (v24) {
    int v25 = *(void **)(v24 + 152);
  }
  else {
    int v25 = 0LL;
  }
  [v25 removeAllObjects];
  uint64_t v26 = *(void *)(a1 + 32);
  if (v26)
  {
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v27 = *(id *)(v26 + 184);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v49;
      do
      {
        uint64_t v31 = 0LL;
        do
        {
          if (*(void *)v49 != v30) {
            objc_enumerationMutation(v27);
          }
          xpc_connection_cancel(*(xpc_connection_t *)(*((void *)&v48 + 1) + 8 * v31++));
        }

        while (v29 != v31);
        uint64_t v29 = [v27 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }

      while (v29);
    }

    [*(id *)(v26 + 184) removeAllObjects];
    __int128 v32 = *(_xpc_connection_s **)(v26 + 128);
    if (v32)
    {
      xpc_connection_cancel(v32);
      __int128 v33 = *(void **)(v26 + 128);
      *(void *)(v26 + 128) = 0LL;
    }

    uint64_t v34 = *(void *)(a1 + 32);
    if (v34)
    {
      __int128 v35 = *(dispatch_source_s **)(v34 + 176);
      if (v35) {
        dispatch_source_cancel(v35);
      }
    }
  }

  uint64_t v36 = +[NEAppInfoCache sharedAppInfoCache]();
  __int128 v37 = (void *)v36;
  if (v36) {
    objc_storeWeak((id *)(v36 + 8), 0LL);
  }

  uint64_t v38 = *(unsigned int *)(a1 + 40);
  v39.receiver = *(id *)(a1 + 32);
  v39.super_class = (Class)&OBJC_CLASS___NEFilterDataExtensionProviderContext;
  objc_msgSendSuper2(&v39, sel_stopWithReason_, v38);
}

void __81__NEFilterDataExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[41])
    {
      ne_log_obj();
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEFAULT,  "The completion handler for startFilterWithOptions was executed twice",  v7,  2u);
      }
    }

    else
    {
      WeakRetained[41] = 1;
      if (!v3)
      {
        [WeakRetained sendBrowserContentFilterServerRequest];
        [v5 sendSocketContentFilterRequest];
      }

      [v5 startedWithError:v3];
    }
  }
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_3937 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_3937, &__block_literal_global_3938);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_3939;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_3933 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_3933, &__block_literal_global_74_3934);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_3935;
}

void __71__NEFilterDataExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EB6A8];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_3935;
  _extensionAuxiliaryHostProtocol_protocol_3935 = v0;
}

void __73__NEFilterDataExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EB580];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_3939;
  _extensionAuxiliaryVendorProtocol_protocol_3939 = v0;
}

@end