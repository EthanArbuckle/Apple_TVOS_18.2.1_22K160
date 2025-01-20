@interface NEIKEv2Session
+ (void)removeItemsFromDictionary:(int)a3 lowerEdge:;
- (BOOL)checkSelectedChildSAProposal:(id)a3;
- (BOOL)checkSelectedIKEProposal:(id)a3;
- (BOOL)peerAuthenticated;
- (BOOL)ppkAuthenticated;
- (BOOL)updateConfiguration:(id)a3;
- (NEIKEv2ConfigurationMessage)assignedConfiguration;
- (NEIKEv2Session)initWithIKEConfig:(id)a3 firstChildConfig:(id)a4 sessionConfig:(id)a5 queue:(id)a6 ipsecInterface:(NEVirtualInterface_s *)a7 ikeSocketHandler:(id)a8 kernelSASessionName:(id)a9 packetDelegate:(id)a10;
- (NEIKEv2Session)initWithIKEConfig:(id)a3 firstChildConfig:(id)a4 sessionConfig:(id)a5 queue:(id)a6 ipsecInterface:(NEVirtualInterface_s *)a7 ikeSocketHandler:(id)a8 saSession:(id)a9 packetDelegate:(id)a10;
- (NSString)description;
- (NSString)ikeInterfaceName;
- (NWEndpoint)localEndpoint;
- (NWEndpoint)remoteEndpoint;
- (OS_dispatch_queue)clientQueue;
- (_BYTE)abort;
- (_DWORD)copyChildWithID:(void *)a1;
- (_OWORD)addEmptyInterface;
- (__CFString)interfaceName;
- (id)additionalAddressesUpdateBlock;
- (id)childStateUpdateBlock;
- (id)configurationUpdateBlock;
- (id)copyChildWithSPI:(void *)a1;
- (id)copySAFromDictionary:(void *)a1 forChild:(void *)a2;
- (id)copySAFromDictionary:(void *)a1 forSPI:(void *)a2;
- (id)copySAsToDeleteAndInstallRekeyedChildSA:(id)a1;
- (id)firstChildSA;
- (id)privateNotifyStatusEvent;
- (id)redirectEventBlock;
- (id)shortDPDEventBlock;
- (id)stateUpdateBlock;
- (id)trafficSelectorUpdateBlock;
- (os_log_s)initWithIKEConfig:(os_log_s *)a1 configurationDelegate:(void *)a2 queue:(void *)a3 saSession:(void *)a4 shouldCopySASession:(void *)a5 transport:(void *)a6 packetDelegate:(void *)a7;
- (os_log_s)initWithIKEConfig:(void *)a3 configurationDelegate:(void *)a4 queue:(void *)a5 kernelSASessionName:(void *)a6 transport:(void *)a7 packetDelegate:;
- (os_log_s)initWithIKEConfig:(void *)a3 firstChildConfig:(void *)a4 sessionConfig:(void *)a5 queue:(id *)a6 ipsecInterface:(void *)a7 ikeSocketHandler:(void *)a8 saSession:(char)a9 shouldOwnSASession:(void *)a10 packetDelegate:(void *)a11 transport:(void *)a12 configurationDelegate:;
- (uint64_t)copyIPsecInterfaceWithMissingAllowed:(uint64_t)a1;
- (uint64_t)fireWaitingRequestHandlerWithPacket:(void *)a1;
- (uint64_t)generateSPIForChild:(void *)a3 proposals:;
- (uint64_t)handleIKEIntermediateForResponderIKESA:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:;
- (uint64_t)installChildSA:(uint64_t)a1;
- (uint64_t)interfaceIndex;
- (uint64_t)migrateAllChildSAs;
- (uint64_t)receiveDeleteChildSPI:(void *)a3 remoteSPI:(void *)a4 packet:;
- (uint64_t)sendCurrentRequest:(uint64_t)a1;
- (uint64_t)sendReply:(void *)a3 replyHandler:;
- (uint64_t)sendReplyForMessageID:(_BYTE *)a1;
- (uint64_t)sendRequest:(uint64_t)a1 retry:(void *)a2 replyHandler:(void *)a3;
- (uint64_t)sendRequest:(unint64_t)a3 retryIntervalInMilliseconds:(int)a4 maxRetries:(void *)a5 timeoutError:(char)a6 resend:(uint64_t)a7 sendMessageID:(void *)a8 sendCompletionHandler:(void *)a9 replyHandler:;
- (uint64_t)setupReceivedChildCopyError;
- (uint64_t)uninstallAllChildSAs;
- (unint64_t)state;
- (unsigned)addChild:(id)a3;
- (void)addFirstChild:(void *)a1;
- (void)blackholeDetectedSA:(id)a3;
- (void)cancelSendTimer;
- (void)clientCallback;
- (void)clientCallbackInfo;
- (void)connect;
- (void)dealloc;
- (void)deleteSA:(id)a3;
- (void)disconnect;
- (void)dpdTimerFired;
- (void)enqueuePendingRequestContext:(void *)a1;
- (void)expireSA:(id)a3;
- (void)finishConfigurationEstablishment;
- (void)forceRekeyChild:(unsigned int)a3;
- (void)forceRekeyIKE;
- (void)handleEAPAndGSPMForIKESA:(void *)a3 authPacket:(void *)a4 handler:;
- (void)handleFollowupKEForRekeyChildSAInitiator:(unint64_t)a3 iteration:(void *)a4 handler:;
- (void)handleFollowupKEForRekeyChildSAResponder:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:;
- (void)handleFollowupKEForRekeyIKESAInitiator:(void *)a3 rekeyIKEContext:(unint64_t)a4 iteration:(void *)a5 handler:;
- (void)handleFollowupKEForRekeyIKESAResponder:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:;
- (void)handleIKEIntermediateForInitiatorIKESA:(unint64_t)a3 iteration:(void *)a4 handler:;
- (void)idleTimeoutSA:(id)a3;
- (void)initiateDelete:(void *)a1;
- (void)initiateDeleteChildSA:(void *)a1;
- (void)initiateDeleteChildSPI:(void *)a3 remoteSPI:(void *)a4 deleteCompletionCallback:;
- (void)initiateInformational:(_BYTE *)a1;
- (void)initiateMOBIKE:(_BYTE *)a1;
- (void)initiateNewChildSA:(_BYTE *)a1;
- (void)initiateRekeyChildSA:(_BYTE *)a1;
- (void)initiateRekeyIKESA:(_BYTE *)a1;
- (void)invalidate;
- (void)invalidateDPDTimer;
- (void)invalidateWithCompletionHandler:(BOOL)a3 completionHandler:(id)a4;
- (void)processFragment:(_DWORD *)a1;
- (void)receiveConnection:(void *)a1;
- (void)receiveDeleteChildSA:(void *)a1;
- (void)receiveDeleteIKESA:(void *)a1;
- (void)receiveInformational:(_BYTE *)a1;
- (void)receiveMOBIKE:(void *)a1;
- (void)receiveNewChildSA:(void *)a3 packet:;
- (void)receivePacket:(id)a3;
- (void)receiveRedirect:(void *)a1;
- (void)receiveRekeyChildSA:(void *)a3 packet:;
- (void)receiveRekeyIKESA:(void *)a1;
- (void)removeChild:(unsigned int)a3;
- (void)removeChild:(void *)a3 withReason:;
- (void)removeFirstChild;
- (void)reportConfiguration;
- (void)reportError:(int)a3;
- (void)reportPrivateNotifies:(void *)a1;
- (void)reportPrivateNotifiesInPacket:(id *)a1;
- (void)reportServerRedirect:(void *)a1;
- (void)reportState;
- (void)reportTrafficSelectorsForChildSA:(void *)a1;
- (void)resetAll;
- (void)resetChild:(char *)a1;
- (void)resetMessages;
- (void)retryCookieForIKESA:(uint64_t)a3 validated:(void *)a4 handler:;
- (void)sendKeepaliveWithRetries:(unsigned int)a3 retryIntervalInMilliseconds:(unint64_t)a4 callbackQueue:(id)a5 callback:(id)a6;
- (void)sendMOBIKEWithRetries:(unsigned int)a3 retryInterval:(unint64_t)a4 interfaceName:(id)a5 invalidateTransport:(BOOL)a6 resetEndpoint:(id)a7 callbackQueue:(id)a8 callback:(id)a9;
- (void)sendPendingRequestContext;
- (void)sendPrivateNotifies:(id)a3 maxRetries:(unsigned int)a4 retryIntervalInMilliseconds:(unint64_t)a5 callbackQueue:(id)a6 callback:(id)a7;
- (void)setAdditionalAddressesUpdateBlock:(id)a3;
- (void)setChildStateUpdateBlock:(id)a3;
- (void)setClientCallback:(void *)a3;
- (void)setClientCallbackInfo:(void *)a3;
- (void)setClientQueue:(id)a3;
- (void)setConfigurationUpdateBlock:(id)a3;
- (void)setIKESA:(uint64_t)a1;
- (void)setPendingPrivateNotifies:(uint64_t)a1;
- (void)setPrivateNotifyStatusEvent:(id)a3;
- (void)setReceivedReply:(uint64_t)a3 messageID:;
- (void)setRedirectEventBlock:(id)a3;
- (void)setSentMOBIKERequest:(int)a3 messageID:;
- (void)setShortDPDEventBlock:(id)a3;
- (void)setStateUpdateBlock:(id)a3;
- (void)setTrafficSelectorUpdateBlock:(id)a3;
- (void)startDPDTimer;
- (void)startIKELifetimeTimer;
- (void)uninstallOldRekeyedChildSAs:(void *)a1;
- (void)updateEndpointState;
@end

@implementation NEIKEv2Session

- (void)reportPrivateNotifiesInPacket:(id *)a1
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  self = a1;
  if (a1)
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v29 = v3;
    id v31 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (v3) {
      id Property = objc_getProperty(v3, v4, 64LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id obj = Property;
    uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (v10)
          {
            uint64_t v11 = v10[3];
            if ((unsigned __int16)v11 >= 0xA000u)
            {
              ne_log_obj();
              v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                id v14 = objc_getProperty(v10, v13, 32LL, 1);
                *(_DWORD *)buf = 138412802;
                *(void *)v38 = self;
                *(_WORD *)&v38[8] = 1024;
                *(_DWORD *)&v38[10] = (unsigned __int16)v11;
                __int16 v39 = 2112;
                id v40 = v14;
                _os_log_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_INFO,  "%@ Received private notify status %u %@",  buf,  0x1Cu);
              }

              v15 = objc_alloc(&OBJC_CLASS___NEIKEv2PrivateNotify);
              id v17 = objc_getProperty(v10, v16, 32LL, 1);
              v18 = -[NEIKEv2PrivateNotify initWithNotifyStatus:notifyData:]( v15,  "initWithNotifyStatus:notifyData:",  (unsigned __int16)v11,  v17);

              if (v18)
              {
                [v31 addObject:v18];
              }

              else
              {
                ne_log_obj();
                v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
                {
                  id v21 = objc_getProperty(v10, v20, 32LL, 1);
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v38 = (unsigned __int16)v11;
                  *(_WORD *)&v38[4] = 2112;
                  *(void *)&v38[6] = v21;
                  _os_log_fault_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_FAULT,  "NEIKEv2PrivateNotify init %u %@ failed",  buf,  0x12u);
                }
              }
            }
          }
        }

        uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }

      while (v7);
    }

    id v3 = v29;
    if ([v31 count])
    {
      v23 = objc_getProperty(self, v22, 336LL, 1);
      if (v23 && (uint64_t v24 = v23[6], v23, v24 == 2))
      {
        -[NEIKEv2Session reportPrivateNotifies:](self, v31);
      }

      else
      {
        v25 = self + 49;
        id v26 = self[49];

        if (!v26)
        {
          id v27 = objc_alloc_init(MEMORY[0x189603FA8]);
          objc_storeStrong(v25, v27);
        }

        id v28 = *v25;
        [v28 addObjectsFromArray:v31];
      }
    }
  }
}

- (void)initiateDelete:(void *)a1
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  v4 = a2;
  if (a1)
  {
    v5 = (dispatch_queue_s *)objc_getProperty(a1, v3, 368LL, 1);
    dispatch_assert_queue_V2(v5);

    if (!v4)
    {
      ne_log_obj();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[NEIKEv2Session(Exchange) initiateDelete:]";
        _os_log_fault_impl(&dword_1876B1000, v11, OS_LOG_TYPE_FAULT, "%s called with null deleteIKEContext", buf, 0xCu);
      }

      goto LABEL_27;
    }

    objc_opt_self();
    uint64_t v6 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2InformationalPacket));
    if (v6)
    {
      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NEIKEv2DeletePayload);
      uint64_t v8 = (os_log_s *)v7;
      if (v7) {
        v7->_protocol = 1LL;
      }
      if ((-[NEIKEv2Payload isValid]((uint64_t)v7) & 1) != 0)
      {
        *(void *)buf = v8;
        [MEMORY[0x189603F18] arrayWithObjects:buf count:1];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_atomic(v6, v10, v9, 88LL);

        uint64_t v11 = v6;
        goto LABEL_11;
      }

      ne_log_obj();
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "+[NEIKEv2InformationalPacket(Exchange) createDeleteIKE]";
        _os_log_fault_impl(&dword_1876B1000, v47, OS_LOG_TYPE_FAULT, "%s called with null delete.isValid", buf, 0xCu);
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed",  buf,  2u);
      }
    }

    uint64_t v11 = 0LL;
LABEL_11:

    if (v11)
    {
      if (v4[24])
      {
        v53[0] = MEMORY[0x1895F87A8];
        v53[1] = 3221225472LL;
        v53[2] = __43__NEIKEv2Session_Exchange__initiateDelete___block_invoke;
        v53[3] = &unk_18A08CEE8;
        v53[4] = a1;
        v12 = v4;
        id v54 = v12;
        if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v11, v53) == -1)
        {
          [v12 sendCallbackSuccess:0 session:a1];
          id v14 = objc_getProperty(a1, v13, 336LL, 1);
          ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"delete with reply",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v48);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v14, 3uLL, ErrorFailedToSend);

          -[NEIKEv2Session reportState](a1, v23);
          -[NEIKEv2Session resetAll]((uint64_t)a1, v24);
        }

        v25 = v54;
      }

      else
      {
        aBlock[0] = MEMORY[0x1895F87A8];
        aBlock[1] = 3221225472LL;
        aBlock[2] = __43__NEIKEv2Session_Exchange__initiateDelete___block_invoke_4;
        aBlock[3] = &unk_18A08CF10;
        id v27 = v4;
        id v51 = v27;
        v52 = a1;
        id v28 = _Block_copy(aBlock);
        uint64_t v11 = v11;
        id v29 = v28;
        id Property = objc_getProperty(a1, v30, 336LL, 1);
        int v32 = 4;
        if (Property)
        {
          if ((Property[17] & 1) != 0) {
            int v32 = 12;
          }
          else {
            int v32 = 4;
          }
        }

        Error = (void *)NEIKEv2CreateError(3LL);
        int v34 = -[NEIKEv2Session sendRequest:retryIntervalInMilliseconds:maxRetries:timeoutError:resend:sendMessageID:sendCompletionHandler:replyHandler:]( (uint64_t)a1,  v11,  0LL,  v32,  Error,  0,  0xFFFFFFFFLL,  v29,  0LL);

        if (v34 == -1)
        {
          [v27 sendCallbackSuccess:0 session:a1];
          id v36 = objc_getProperty(a1, v35, 336LL, 1);
          v44 = (void *)NEIKEv2CreateErrorFailedToSend( @"delete with send complete",  v37,  v38,  v39,  v40,  v41,  v42,  v43,  v49);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v36, 3uLL, v44);

          -[NEIKEv2Session reportState](a1, v45);
          -[NEIKEv2Session resetAll]((uint64_t)a1, v46);
        }

        v25 = v51;
      }
    }

    else
    {
      ne_log_obj();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_error_impl(&dword_1876B1000, v26, OS_LOG_TYPE_ERROR, "%@ Failed to create Delete packet", buf, 0xCu);
      }

      [v4 sendCallbackSuccess:0 session:a1];
      uint64_t v11 = 0LL;
    }

void __43__NEIKEv2Session_Exchange__initiateDelete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v3 && !-[NEIKEv2Packet hasErrors](v3, v4))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v10 = 1LL;
      goto LABEL_9;
    }

    ne_log_obj();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)v12 = 138412290;
      *(void *)&v12[4] = v6;
      uint64_t v7 = "%@ Failed to process packet";
LABEL_11:
      _os_log_error_impl(&dword_1876B1000, v5, OS_LOG_TYPE_ERROR, v7, v12, 0xCu);
    }
  }

  else
  {
    ne_log_obj();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)v12 = 138412290;
      *(void *)&v12[4] = v11;
      uint64_t v7 = "%@ Failed to receive Delete packet";
      goto LABEL_11;
    }
  }

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v10 = 0LL;
LABEL_9:
  objc_msgSend(v8, "sendCallbackSuccess:session:", v10, v9, *(_OWORD *)v12);
}

uint64_t __43__NEIKEv2Session_Exchange__initiateDelete___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendCallbackSuccess:a2 session:*(void *)(a1 + 40)];
}

- (void)initiateDeleteChildSPI:(void *)a3 remoteSPI:(void *)a4 deleteCompletionCallback:
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!a1) {
    goto LABEL_22;
  }
  id v9 = a2;
  uint64_t v11 = (dispatch_queue_s *)objc_getProperty(a1, v10, 368LL, 1);
  dispatch_assert_queue_V2(v11);

  id v12 = v9;
  objc_opt_self();
  if (!v12)
  {
    ne_log_obj();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NEIKEv2InformationalPacket(Exchange) createDeleteChild:]";
      _os_log_fault_impl(&dword_1876B1000, v13, OS_LOG_TYPE_FAULT, "%s called with null childSPI", buf, 0xCu);
    }

    uint64_t v20 = 0LL;
    goto LABEL_14;
  }

  uint64_t v13 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2InformationalPacket));
  if (!v13)
  {
    ne_log_obj();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed",  buf,  2u);
    }

    goto LABEL_12;
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___NEIKEv2DeletePayload);
  uint64_t v15 = (os_log_s *)v14;
  if (v14) {
    v14->_protocol = 3LL;
  }
  id v39 = v12;
  [MEMORY[0x189603F18] arrayWithObjects:&v39 count:1];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15) {
    objc_setProperty_atomic(v15, v16, v17, 32LL);
  }

  if ((-[NEIKEv2Payload isValid]((uint64_t)v15) & 1) == 0)
  {
    ne_log_obj();
    SEL v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NEIKEv2InformationalPacket(Exchange) createDeleteChild:]";
      _os_log_fault_impl(&dword_1876B1000, v35, OS_LOG_TYPE_FAULT, "%s called with null delete.isValid", buf, 0xCu);
    }

LABEL_12:
    uint64_t v20 = 0LL;
    goto LABEL_13;
  }

  *(void *)buf = v15;
  [MEMORY[0x189603F18] arrayWithObjects:buf count:1];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(v13, v19, v18, 88LL);

  uint64_t v20 = v13;
LABEL_13:

LABEL_14:
  if (v20)
  {
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = (uint64_t)__86__NEIKEv2Session_Exchange__initiateDeleteChildSPI_remoteSPI_deleteCompletionCallback___block_invoke;
    v36[3] = (uint64_t)&unk_18A08CF60;
    v36[4] = (uint64_t)a1;
    id v21 = v8;
    id v38 = v21;
    id v37 = v7;
    if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v20, v36) == -1)
    {
      (*((void (**)(id, void))v21 + 2))(v21, 0LL);
      id v23 = objc_getProperty(a1, v22, 336LL, 1);
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"delete child",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  v36[0]);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v23, 3uLL, ErrorFailedToSend);

      -[NEIKEv2Session reportState](a1, v32);
      -[NEIKEv2Session resetAll]((uint64_t)a1, v33);
    }
  }

  else
  {
    ne_log_obj();
    int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = a1;
      _os_log_error_impl(&dword_1876B1000, v34, OS_LOG_TYPE_ERROR, "%@ Failed to create Delete packet", buf, 0xCu);
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0LL);
  }

LABEL_22:
}

void __86__NEIKEv2Session_Exchange__initiateDeleteChildSPI_remoteSPI_deleteCompletionCallback___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      (*(void (**)(void, void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), 0LL);
      goto LABEL_8;
    }

    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v5;
    uint64_t v6 = "%@ Failed to receive Delete packet";
LABEL_10:
    _os_log_error_impl(&dword_1876B1000, (os_log_t)v4, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v8, 0xCu);
    goto LABEL_7;
  }

  if ((-[NEIKEv2InformationalPacket validateDeleteChild:]((uint64_t)v3, *(void **)(a1 + 40)) & 1) == 0)
  {
    ne_log_obj();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v7;
    uint64_t v6 = "%@ Failed to process Delete packet";
    goto LABEL_10;
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), 1LL);
LABEL_8:
}

- (uint64_t)receiveDeleteChildSPI:(void *)a3 remoteSPI:(void *)a4 packet:
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1) {
    id Property = objc_getProperty(a1, v9, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v12 = (dispatch_queue_s *)Property;
  dispatch_assert_queue_V2(v12);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v31 = 138412290;
      *(void *)&v31[4] = a1;
      id v14 = "%@ Failed to receive Delete packet";
LABEL_11:
      _os_log_error_impl(&dword_1876B1000, v13, OS_LOG_TYPE_ERROR, v14, v31, 0xCu);
    }

- (void)initiateInformational:(_BYTE *)a1
{
  uint64_t v114 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  uint64_t v6 = (dispatch_queue_s *)Property;
  dispatch_assert_queue_V2(v6);

  if (!a1[15]) {
    __assert_rtn( "-[NEIKEv2Session(Exchange) initiateInformational:]",  "NEIKEv2Exchange.m",  318,  "self.hasOutboundRequestInFlight");
  }
  ne_log_obj();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v108 = a1;
    __int16 v109 = 2112;
    id v110 = v4;
    _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_INFO, "%@ Sending %@", buf, 0x16u);
  }

  if (!*((_DWORD *)v4 + 6)
    || (uint64_t v9 = objc_getProperty(a1, v8, 336LL, 1)) == 0LL
    || (uint64_t v10 = v9[6], v9, v10 != 2))
  {
    [v4 sendCallbackSuccess:0 session:a1];
    goto LABEL_72;
  }

  id v12 = objc_getProperty(a1, v11, 336LL, 1);
  if (!v12 || (char v13 = v12[11], v12, (v13 & 1) == 0))
  {
    objc_opt_self();
    uint64_t v15 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2InformationalPacket));
    uint64_t v16 = v15;
    if (v15)
    {
      uint64_t v17 = v15;
    }

    else
    {
      ne_log_obj();
      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_1876B1000,  v36,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed",  buf,  2u);
      }
    }

    SEL v35 = v16;
    goto LABEL_36;
  }

  uint64_t v16 = (os_log_s *)objc_getProperty(a1, v14, 336LL, 1);
  objc_opt_self();
  id v19 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2InformationalPacket));
  if (!v19)
  {
    ne_log_obj();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_1876B1000,  v26,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed",  buf,  2u);
    }

    SEL v35 = 0LL;
    goto LABEL_35;
  }

  -[NEIKEv2IKESA initiatorSPI](v16, v18);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2IKESA responderSPI](v16, v21);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16) {
    id v24 = objc_getProperty(v16, v22, 64LL, 1);
  }
  else {
    id v24 = 0LL;
  }
  id v25 = v24;
  uint64_t v26 = (os_log_s *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v20,  v23,  v25);

  if (!-[NEIKEv2Packet addNotification:data:](v19, 0x4004uLL, v26))
  {
    ne_log_obj();
    int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_1876B1000,  v34,  OS_LOG_TYPE_FAULT,  "[packet addNotification:NEIKEv2NotifyTypeNATDetectionSourceIP] failed",  buf,  2u);
    }

    goto LABEL_33;
  }

  -[NEIKEv2IKESA initiatorSPI](v16, v27);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2IKESA responderSPI](v16, v29);
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16) {
    id v32 = objc_getProperty(v16, v30, 72LL, 1);
  }
  else {
    id v32 = 0LL;
  }
  id v33 = v32;
  int v34 = (os_log_s *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v28,  v31,  v33);

  if (!-[NEIKEv2Packet addNotification:data:](v19, 0x4005uLL, v34))
  {
    ne_log_obj();
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_1876B1000,  v37,  OS_LOG_TYPE_FAULT,  "[packet addNotification:NEIKEv2NotifyTypeNATDetectionDestinationIP] failed",  buf,  2u);
    }

LABEL_33:
    SEL v35 = 0LL;
    goto LABEL_34;
  }

  SEL v35 = v19;
LABEL_34:

LABEL_35:
LABEL_36:

  if (v35)
  {
    id v38 = *((id *)v4 + 4);
    uint64_t v39 = [v38 count];

    if (v39)
    {
      uint64_t v40 = v35;
      __int128 v105 = 0u;
      __int128 v106 = 0u;
      __int128 v103 = 0u;
      __int128 v104 = 0u;
      id obj = *((id *)v4 + 4);
      uint64_t v41 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v104;
        while (2)
        {
          uint64_t v44 = 0LL;
          do
          {
            if (*(void *)v104 != v43) {
              objc_enumerationMutation(obj);
            }
            v45 = *(void **)(*((void *)&v103 + 1) + 8 * v44);
            v46 = objc_alloc_init(&OBJC_CLASS___NEIKEv2NotifyPayload);
            unsigned int v47 = [v45 notifyStatus];
            if (v46)
            {
              v46->_notifyType = v47;
              [v45 notifyData];
              uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_setProperty_atomic(v46, v49, v48, 32LL);
            }

            else
            {
              [v45 notifyData];
              uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
            }

            if (!-[NEIKEv2Packet addNotifyPayload:](v40, v46))
            {
              ne_log_obj();
              v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl( &dword_1876B1000,  v70,  OS_LOG_TYPE_FAULT,  "[sendKeepalive addNotifyPayload:notifyPayload] failed",  buf,  2u);
              }

              [v4 sendCallbackSuccess:0 session:a1];
              SEL v35 = v40;
              if (a1) {
                id v72 = objc_getProperty(a1, v71, 336LL, 1);
              }
              else {
                id v72 = 0LL;
              }
              id v73 = v72;
              ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"[sendKeepalive addNotifyPayload:notifyPayload] failed",  v74,  v75,  v76,  v77,  v78,  v79,  v80,  v98);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v73, 3uLL, ErrorInternal);

              -[NEIKEv2Session reportState](a1, v82);
              -[NEIKEv2Session resetAll]((uint64_t)a1, v83);

              v84 = obj;
              goto LABEL_67;
            }

            ++v44;
          }

          while (v42 != v44);
          uint64_t v50 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
          uint64_t v42 = v50;
          if (v50) {
            continue;
          }
          break;
        }
      }

      SEL v35 = v40;
    }

    unint64_t v51 = *((void *)v4 + 5);
    int v52 = *((_DWORD *)v4 + 6);
    Error = (void *)NEIKEv2CreateError(3LL);
    v101[0] = MEMORY[0x1895F87A8];
    v101[1] = 3221225472LL;
    v101[2] = __50__NEIKEv2Session_Exchange__initiateInformational___block_invoke;
    v101[3] = &unk_18A08CEE8;
    v101[4] = a1;
    id v54 = v4;
    id v102 = v54;
    int v55 = -[NEIKEv2Session sendRequest:retryIntervalInMilliseconds:maxRetries:timeoutError:resend:sendMessageID:sendCompletionHandler:replyHandler:]( (uint64_t)a1,  v35,  v51,  v52,  Error,  0,  0xFFFFFFFFLL,  0LL,  v101);

    if (v55 == -1)
    {
      [v54 sendCallbackSuccess:0 session:a1];
      if (a1) {
        id v86 = objc_getProperty(a1, v85, 336LL, 1);
      }
      else {
        id v86 = 0LL;
      }
      id v87 = v86;
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"informational packet",  v88,  v89,  v90,  v91,  v92,  v93,  v94,  v99);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v87, 3uLL, ErrorFailedToSend);

      -[NEIKEv2Session reportState](a1, v96);
      -[NEIKEv2Session resetAll]((uint64_t)a1, v97);
    }

    else
    {
      ne_log_obj();
      uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v108 = a1;
        __int16 v109 = 2112;
        id v110 = v54;
        __int16 v111 = 1024;
        int v112 = v55;
        _os_log_impl(&dword_1876B1000, v56, OS_LOG_TYPE_INFO, "%@ Sent %@ with message ID %d", buf, 0x1Cu);
      }
    }

    v84 = v102;
LABEL_67:
  }

  else
  {
    ne_log_obj();
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v108 = a1;
      _os_log_error_impl( &dword_1876B1000,  v57,  OS_LOG_TYPE_ERROR,  "%@ Failed to create informational packet",  buf,  0xCu);
    }

    [v4 sendCallbackSuccess:0 session:a1];
    id v59 = objc_getProperty(a1, v58, 336LL, 1);
    v67 = (void *)NEIKEv2CreateErrorInternal( @"Failed to create informational packet",  v60,  v61,  v62,  v63,  v64,  v65,  v66,  v98);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v59, 3uLL, v67);

    -[NEIKEv2Session reportState](a1, v68);
    -[NEIKEv2Session resetAll]((uint64_t)a1, v69);
  }

LABEL_72:
}

void __50__NEIKEv2Session_Exchange__initiateInformational___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (!v3)
  {
    ne_log_obj();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = v9;
      id v8 = "%@ Failed to receive informational packet";
      uint64_t v10 = v6;
      uint32_t v11 = 12;
LABEL_32:
      _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, v8, buf, v11);
      goto LABEL_9;
    }

    goto LABEL_9;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_large_obj();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v46 = v42;
      __int16 v47 = 2112;
      id v48 = v3;
      id v8 = "%@ Received packet was not informational as expected %@";
      goto LABEL_31;
    }

void __50__NEIKEv2Session_Exchange__initiateInformational___block_invoke_22( uint64_t a1,  void *a2,  int a3,  void *a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = a2;
  ne_log_obj();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v18 = 138412290;
      uint64_t v19 = v11;
      _os_log_impl(&dword_1876B1000, v10, OS_LOG_TYPE_INFO, "%@ Updated remote SA successfully", (uint8_t *)&v18, 0xCu);
    }

    [*(id *)(a1 + 40) sendCallbackSuccess:1 session:v8];
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 138412290;
      uint64_t v19 = v17;
      _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, "%@ Failed to remote SA", (uint8_t *)&v18, 0xCu);
    }

    [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
    if (v8) {
      id Property = objc_getProperty(v8, v12, 336LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v14 = Property;
    -[NEIKEv2IKESA setState:error:]((uint64_t)v14, 3uLL, v7);

    -[NEIKEv2Session reportState](v8, v15);
    -[NEIKEv2Session resetAll]((uint64_t)v8, v16);
  }
}

- (void)initiateMOBIKE:(_BYTE *)a1
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_getProperty(a1, v3, 368LL, 1);
    dispatch_assert_queue_V2(v5);

    if (!a1[15]) {
      __assert_rtn( "-[NEIKEv2Session(Exchange) initiateMOBIKE:]",  "NEIKEv2Exchange.m",  2917,  "self.hasOutboundRequestInFlight");
    }
    if (!v4)
    {
      ne_log_obj();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v59 = "-[NEIKEv2Session(Exchange) initiateMOBIKE:]";
        _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "%s called with null mobikeContext", buf, 0xCu);
      }

      goto LABEL_33;
    }

    id v7 = (os_log_s *)objc_getProperty(a1, v6, 336LL, 1);
    if (!v7)
    {
      ne_log_obj();
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v59 = "-[NEIKEv2Session(Exchange) initiateMOBIKE:]";
        _os_log_fault_impl(&dword_1876B1000, v53, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
      }

      [v4 sendCallbackSuccess:0 session:a1];
      id v8 = 0LL;
      goto LABEL_33;
    }

    id v8 = v7;
    if ((*((_BYTE *)v7 + 11) & 1) == 0)
    {
      ne_log_obj();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "MOBIKE not supported for this IKE SA. Ignoring request",  buf,  2u);
      }

      Error = (void *)NEIKEv2CreateError(9LL);
      -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](v4, 0LL, a1, Error);
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }

    if (*((_BYTE *)v4 + 24))
    {
      -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v7, 1);
      uint64_t v12 = objc_getProperty(a1, v11, 360LL, 1);
      if (v12)
      {
        *(void *)(v12 + 64) = 1000LL;
        *(_DWORD *)(v12 + 12) = -1;
        *(void *)(v12 + 16) = 0LL;
        *(void *)(v12 + 24) = 0LL;
        *(_OWORD *)(v12 + 32) = xmmword_187873220;
        *(_OWORD *)(v12 + 48) = xmmword_187873230;
        *(_WORD *)(v12 + 8) = 0;
      }
    }

    id v13 = v4[4];
    objc_setProperty_atomic(v8, v14, v13, 304LL);

    id v15 = v4[5];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
LABEL_27:
      -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 4uLL, 0LL);
      -[NEIKEv2Session reportState](a1, v42);
      Error = -[NEIKEv2IKESA copyTransport]((id *)v8, v43);
      if (Error)
      {
        v56[0] = MEMORY[0x1895F87A8];
        v56[1] = 3221225472LL;
        v56[2] = (uint64_t)__43__NEIKEv2Session_Exchange__initiateMOBIKE___block_invoke;
        v56[3] = (uint64_t)&unk_18A08F098;
        v56[4] = (uint64_t)a1;
        v57 = v4;
        -[NEIKEv2Transport waitForTransport:]((uint64_t)Error, v56);
      }

      else
      {
        ne_log_obj();
        id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_1876B1000,  v44,  OS_LOG_TYPE_ERROR,  "Initiate MOBIKE failed to create a new transport for IKE SA",  buf,  2u);
        }

        ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Initiate MOBIKE failed to create a new transport for IKE SA",  v45,  v46,  v47,  v48,  v49,  v50,  v51,  v56[0]);
        -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](v4, 0LL, a1, ErrorInternal);
      }

      goto LABEL_32;
    }

    id v17 = v4[5];
    int v18 = v17;
    if (v17)
    {
      if ([v17 address])
      {
        if (nelog_is_debug_logging_enabled())
        {
          ne_log_obj();
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v59 = (const char *)v8;
            __int16 v60 = 2112;
            uint64_t v61 = v18;
            _os_log_debug_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_DEBUG,  "Setting remote address of %@ to %@",  buf,  0x16u);
          }
        }

        objc_msgSend(MEMORY[0x189608DE8], "endpointWithAddress:", objc_msgSend(v18, "address"));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_atomic(v8, v21, v20, 72LL);

        if (!*(_WORD *)(objc_msgSend(objc_getProperty(v8, v22, 72, 1), "address") + 2))
        {
          char v24 = *((_BYTE *)v8 + 12);
          uint64_t v25 = objc_msgSend(objc_getProperty(v8, v23, 72, 1), "address");
          if ((v24 & 1) != 0) {
            __int16 v26 = -27631;
          }
          else {
            __int16 v26 = -3071;
          }
          *(_WORD *)(v25 + 2) = v26;
        }

        objc_setProperty_atomic(v8, v23, 0LL, 64LL);
        id v28 = objc_getProperty(v8, v27, 464LL, 1);
        id Property = objc_getProperty(v8, v29, 32LL, 1);
        -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v28, Property, 0);

        id v32 = objc_getProperty(v8, v31, 472LL, 1);
        id v34 = objc_getProperty(v8, v33, 32LL, 1);
        -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v32, v34, 0);

        id v36 = objc_getProperty(v8, v35, 480LL, 1);
        id v38 = objc_getProperty(v8, v37, 32LL, 1);
        -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v36, v38, 0);

        objc_setProperty_atomic(v8, v39, 0LL, 464LL);
        objc_setProperty_atomic(v8, v40, 0LL, 472LL);
        objc_setProperty_atomic(v8, v41, 0LL, 480LL);
        goto LABEL_26;
      }

      ne_log_obj();
      id v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_FAULT))
      {
LABEL_44:

LABEL_26:
        goto LABEL_27;
      }

      *(_DWORD *)buf = 136315138;
      id v59 = "-[NEIKEv2IKESA resetRemoteAddress:]";
      int v55 = "%s called with null remoteAddress.address";
    }

    else
    {
      ne_log_obj();
      id v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_FAULT)) {
        goto LABEL_44;
      }
      *(_DWORD *)buf = 136315138;
      id v59 = "-[NEIKEv2IKESA resetRemoteAddress:]";
      int v55 = "%s called with null remoteAddress";
    }

    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v54, OS_LOG_TYPE_FAULT, v55, buf, 0xCu);
    goto LABEL_44;
  }

void __43__NEIKEv2Session_Exchange__initiateMOBIKE___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = (id *)Property;
  -[NEIKEv2IKESA resyncAddress](v4, v5);

  uint64_t v6 = *(unsigned int **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  if (v6)
  {
    uint64_t v9 = (dispatch_queue_s *)objc_getProperty(v6, v7, 368LL, 1);
    dispatch_assert_queue_V2(v9);

    id v11 = objc_getProperty(v6, v10, 336LL, 1);
    id v13 = v11;
    if (v11)
    {
      id v14 = objc_getProperty(v11, v12, 64LL, 1);

      if (v14)
      {
        if (v8)
        {
          int v15 = *((_DWORD *)v8 + 7);
          unint64_t v16 = *((void *)v8 + 6);
        }

        else
        {
          int v15 = 0;
          unint64_t v16 = 0LL;
        }

        *(void *)&__int128 v57 = MEMORY[0x1895F87A8];
        *((void *)&v57 + 1) = 3221225472LL;
        SEL v58 = __48__NEIKEv2Session_Exchange__initiateMOBIKEInner___block_invoke;
        id v59 = &unk_18A08D0C8;
        id v60 = v8;
        uint64_t v61 = v6;
        id v62 = v13;
        id v17 = &v57;
        uint64_t v19 = (dispatch_queue_s *)objc_getProperty(v6, v18, 368LL, 1);
        dispatch_assert_queue_V2(v19);

        id v21 = objc_getProperty(v6, v20, 336LL, 1);
        uint64_t v22 = v6[6];
        uint64_t v24 = objc_getProperty(v6, v23, 376LL, 1);
        uint64_t v25 = (void *)v24;
        if ((_DWORD)v22 == -1 || !v24)
        {
          v58((uint64_t)v17, 0LL);
        }

        else
        {
          ne_log_obj();
          __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1876B1000, v26, OS_LOG_TYPE_INFO, "Re-sending previous MOBIKE request", buf, 2u);
          }

          *(void *)buf = MEMORY[0x1895F87A8];
          uint64_t v52 = 3221225472LL;
          v53 = __87__NEIKEv2Session_Exchange__resendPreviousMOBIKEInnerWithRetries_retryInterval_handler___block_invoke;
          id v54 = &unk_18A08D2D0;
          SEL v27 = v17;
          uint64_t v56 = v27;
          id v55 = v21;
          if (-[NEIKEv2Session sendRequest:retryIntervalInMilliseconds:maxRetries:timeoutError:resend:sendMessageID:sendCompletionHandler:replyHandler:]( (uint64_t)v6,  v25,  v16,  v15,  0LL,  1,  v22,  0LL,  buf) == -1)
          {
            ne_log_obj();
            id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)uint64_t v50 = 0;
              _os_log_error_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_ERROR,  "Resend previous MOBIKE, failed to send Informational packet",  v50,  2u);
            }

            ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"resend previous MOBIKE, failed to send Informational packet",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v49);
            v58((uint64_t)v27, ErrorFailedToSend);
          }
        }

        ErrorInternal = v60;
        goto LABEL_23;
      }

      ne_log_obj();
      SEL v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v57) = 0;
        _os_log_error_impl( &dword_1876B1000,  v37,  OS_LOG_TYPE_ERROR,  "Initiate MOBIKE failed to fetch new local address for IKE SA",  (uint8_t *)&v57,  2u);
      }

      uint64_t v45 = @"Initiate MOBIKE failed to fetch new local address for IKE SA";
    }

    else
    {
      ne_log_obj();
      uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        LODWORD(v57) = 136315138;
        *(void *)((char *)&v57 + 4) = "-[NEIKEv2Session(Exchange) initiateMOBIKEInner:]";
        _os_log_fault_impl(&dword_1876B1000, v47, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", (uint8_t *)&v57, 0xCu);
      }

      uint64_t v45 = @"Initiate MOBIKE failed, no IKE SA";
    }

    ErrorInternal = (void *)NEIKEv2CreateErrorInternal(v45, v38, v39, v40, v41, v42, v43, v44, v48);
    -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:]((id *)v8, 0LL, v6, ErrorInternal);
LABEL_23:
  }
}

void __48__NEIKEv2Session_Exchange__initiateMOBIKEInner___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v86 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](*(id **)(a1 + 32), 0LL, *(void **)(a1 + 40), a2);
    return;
  }

  id v3 = *(id *)(a1 + 48);
  objc_opt_self();
  if (!v3)
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v85 = "+[NEIKEv2InformationalPacket(Exchange) createUpdateAddressInitiator:]";
      _os_log_fault_impl(&dword_1876B1000, v5, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
    }

    SEL v20 = 0LL;
    goto LABEL_21;
  }

  id v4 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2InformationalPacket));
  uint64_t v5 = v4;
  if (!v4)
  {
    ne_log_obj();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v21 = "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed";
LABEL_36:
    _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, v21, buf, 2u);
    goto LABEL_12;
  }

  if (-[NEIKEv2Packet addNotification:data:](v4, 0x4010uLL, 0LL))
  {
    -[NEIKEv2IKESA initiatorSPI](v3, v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2IKESA responderSPI](v3, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = objc_getProperty(v3, v10, 64LL, 1);
    uint64_t v12 = (os_log_s *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v7,  v9,  v11);

    if (-[NEIKEv2Packet addNotification:data:](v5, 0x4004uLL, v12))
    {
      -[NEIKEv2IKESA initiatorSPI](v3, v13);
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2IKESA responderSPI](v3, v15);
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      id v18 = objc_getProperty(v3, v17, 72LL, 1);
      uint64_t v19 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v14,  v16,  v18);

      if (-[NEIKEv2Packet addNotification:data:](v5, 0x4005uLL, v19))
      {
        SEL v20 = v5;
LABEL_19:

        goto LABEL_20;
      }

      ne_log_obj();
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_1876B1000,  v22,  OS_LOG_TYPE_FAULT,  "[packet addNotification:NEIKEv2NotifyTypeNATDetectionDestinationIP] failed",  buf,  2u);
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v19,  OS_LOG_TYPE_FAULT,  "[packet addNotification:NEIKEv2NotifyTypeNATDetectionSourceIP] failed",  buf,  2u);
      }
    }

    SEL v20 = 0LL;
    goto LABEL_19;
  }

  ne_log_obj();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    id v21 = "[packet addNotification:NEIKEv2NotifyTypeUpdateSAAddresses] failed";
    goto LABEL_36;
  }

void __87__NEIKEv2Session_Exchange__resendPreviousMOBIKEInnerWithRetries_retryInterval_handler___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Resend previous MOBIKE, failed to receive Informational packet again",  buf,  2u);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = @"Resend previous MOBIKE, failed to receive Informational packet again";
    goto LABEL_10;
  }

  if ((-[NEIKEv2InformationalPacket validateUpdateAddresses:](v3, *(void **)(a1 + 32)) & 1) == 0)
  {
    ne_log_obj();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "Resend previous MOBIKE, failed to process Informational packet",  (uint8_t *)&v16,  2u);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = @"Resend previous MOBIKE, failed to process Informational packet";
LABEL_10:
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v13, v5, v6, v7, v8, v9, v10, v11, v16);
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, ErrorPeerInvalidSyntax);

    goto LABEL_11;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
LABEL_11:
}

void __48__NEIKEv2Session_Exchange__initiateMOBIKEInner___block_invoke_459(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NEIKEv2Session setSentMOBIKERequest:messageID:](*(void *)(a1 + 32), 0LL, -1);
    if ((-[NEIKEv2InformationalPacket validateUpdateAddresses:](v3, *(void **)(a1 + 56)) & 1) != 0)
    {
      if ((-[NEIKEv2Session migrateAllChildSAs](*(void *)(a1 + 32), v4) & 1) != 0)
      {
        -[NEIKEv2Session reportConfiguration](*(void **)(a1 + 32), v5);
        uint64_t v6 = *(void *)(a1 + 56);
        if (v6)
        {
          *(_WORD *)(v6 + 26) = 0;
          *(void *)(v6 + 120) = 0LL;
          *(_BYTE *)(v6 + 21) = 0;
          uint64_t v7 = *(void *)(a1 + 56);
        }

        else
        {
          uint64_t v7 = 0LL;
        }

        -[NEIKEv2IKESA setState:error:](v7, 2uLL, 0LL);
        -[NEIKEv2Session reportState](*(void **)(a1 + 32), v8);
        ne_log_obj();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v54) = 0;
          _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_INFO,  "Initiate MOBIKE switched IKE SA addresses",  (uint8_t *)&v54,  2u);
        }

        -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](*(id **)(a1 + 48), 1LL, *(void **)(a1 + 32), 0LL);
      }

      else
      {
        ne_log_obj();
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v55 = 0;
          _os_log_error_impl( &dword_1876B1000,  v30,  OS_LOG_TYPE_ERROR,  "Initiate MOBIKE failed to migrate child SAs",  v55,  2u);
        }

        uint64_t v31 = *(id **)(a1 + 48);
        uint64_t v32 = *(void **)(a1 + 32);
        ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Initiate MOBIKE failed to migrate child SAs",  v33,  v34,  v35,  v36,  v37,  v38,  v39,  v54);
        -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](v31, 0LL, v32, ErrorInternal);

        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v41, 336LL, 1);
        }
        id v43 = Property;
        uint64_t v51 = (void *)NEIKEv2CreateErrorInternal( @"Initiate MOBIKE failed to migrate child SAs",  v44,  v45,  v46,  v47,  v48,  v49,  v50,  v54);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v43, 3uLL, v51);

        -[NEIKEv2Session reportState](*(void **)(a1 + 32), v52);
        -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v53);
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v56 = 0;
        _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "Initiate MOBIKE failed to process Informational packet",  v56,  2u);
      }

      ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Initiate MOBIKE failed to process Informational packet",  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v54);
      -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:]( *(id **)(a1 + 48),  0LL,  *(void **)(a1 + 32),  ErrorPeerInvalidSyntax);
      id v26 = *(id *)(a1 + 32);
      if (v26) {
        id v26 = objc_getProperty(v26, v25, 336LL, 1);
      }
      id v27 = v26;
      -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, ErrorPeerInvalidSyntax);

      -[NEIKEv2Session reportState](*(void **)(a1 + 32), v28);
      -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v29);
    }
  }

  else
  {
    ne_log_obj();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "Initiate MOBIKE failed to receive Informational packet",  buf,  2u);
    }

    uint64_t v11 = *(_DWORD **)(a1 + 40);
    if (v11) {
      int v12 = v11[6];
    }
    else {
      int v12 = 0;
    }
    -[NEIKEv2Session setSentMOBIKERequest:messageID:](*(void *)(a1 + 32), v11, v12);
    id v13 = *(id **)(a1 + 48);
    id v14 = *(void **)(a1 + 32);
    Error = (void *)NEIKEv2CreateError(3LL);
    -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](v13, 0LL, v14, Error);
  }
}

- (void)receiveInformational:(_BYTE *)a1
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_getProperty(a1, v3, 368LL, 1);
    dispatch_assert_queue_V2(v5);

    id v7 = objc_getProperty(a1, v6, 336LL, 1);
    if (!v7)
    {
      ne_log_obj();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        LODWORD(v39) = 136315138;
        *(void *)((char *)&v39 + 4) = "-[NEIKEv2Session(Exchange) receiveInformational:]";
        _os_log_fault_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_FAULT,  "%s called with null self.ikeSA",  (uint8_t *)&v39,  0xCu);
      }

      goto LABEL_11;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v4 && !-[NEIKEv2Packet hasErrors](v4, v8))
      {
        if ((a1[11] & 1) == 0)
        {
          int v12 = (double *)objc_getProperty(a1, v9, 336LL, 1);
          id v14 = v12;
          if (v12)
          {
            uint64_t v15 = objc_msgSend(objc_getProperty(v12, v13, 88, 1), "deadPeerDetectionReceiveIntervalTriggerReporting");
            if (v15)
            {
              unint64_t v16 = v15;
              double Current = CFAbsoluteTimeGetCurrent();
              double v19 = v14[15];
              if (v19 == 0.0
                || Current - v19 > (double)v16
                || (unsigned __int16 v20 = *((_WORD *)v14 + 13) + 1,
                    *((_WORD *)v14 + 13) = v20,
                    objc_msgSend( objc_getProperty(v14, v17, 88, 1),  "deadPeerDetectionReceiveMaxShortDPDBeforeReporting") > v20)
                || (*((_BYTE *)v14 + 21) & 1) != 0)
              {
                v14[15] = Current;
              }

              else
              {
                *((_BYTE *)v14 + 21) = 1;
                v14[15] = Current;

                if (objc_getProperty(a1, v21, 336LL, 1))
                {
                  [a1 shortDPDEventBlock];
                  id v14 = (double *)objc_claimAutoreleasedReturnValue();
                  [a1 clientQueue];
                  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v22 && v14)
                  {
                    [a1 clientQueue];
                    uint64_t v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
                    *(void *)&__int128 v39 = MEMORY[0x1895F87A8];
                    *((void *)&v39 + 1) = 3221225472LL;
                    uint64_t v40 = __32__NEIKEv2Session_reportShortDPD__block_invoke;
                    id v41 = &unk_18A0908C8;
                    uint64_t v42 = a1;
                    id v14 = v14;
                    id v43 = v14;
                    dispatch_async(v23, &v39);
                  }
                }

                else
                {
                  ne_log_obj();
                  id v14 = (double *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_FAULT))
                  {
                    LODWORD(v39) = 136315138;
                    *(void *)((char *)&v39 + 4) = "-[NEIKEv2Session reportShortDPD]";
                    _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v14,  OS_LOG_TYPE_FAULT,  "%s called with null self.ikeSA",  (uint8_t *)&v39,  0xCu);
                  }
                }
              }
            }
          }

          -[NEIKEv2Session reportPrivateNotifiesInPacket:]((id *)a1, v4);
          id v25 = objc_getProperty(a1, v24, 336LL, 1);
          +[NEIKEv2InformationalPacket createInformationalResponse:ikeSA:]( (uint64_t)&OBJC_CLASS___NEIKEv2InformationalPacket,  v4,  v25);
          uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            if ((-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v10, 0LL) & 1) == 0)
            {
              id v27 = objc_getProperty(a1, v26, 336LL, 1);
              ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"informational reply",  v28,  v29,  v30,  v31,  v32,  v33,  v34,  v39);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, ErrorFailedToSend);

              -[NEIKEv2Session reportState](a1, v36);
              -[NEIKEv2Session resetAll]((uint64_t)a1, v37);
            }
          }

          else
          {
            ne_log_obj();
            uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v39) = 138412290;
              *(void *)((char *)&v39 + 4) = a1;
              _os_log_error_impl( &dword_1876B1000,  v38,  OS_LOG_TYPE_ERROR,  "%@ Failed to create Keepalive packet",  (uint8_t *)&v39,  0xCu);
            }

            uint64_t v10 = 0LL;
          }

          goto LABEL_11;
        }

        ne_log_obj();
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v39) = 138412290;
          *(void *)((char *)&v39 + 4) = a1;
          uint64_t v11 = "%@ Session has been aborted, cannot process informational";
          goto LABEL_34;
        }
      }

      else
      {
        ne_log_obj();
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v39) = 138412290;
          *(void *)((char *)&v39 + 4) = a1;
          uint64_t v11 = "%@ Failed to process informational packet";
LABEL_34:
          _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v39, 0xCu);
        }
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v39) = 138412290;
        *(void *)((char *)&v39 + 4) = a1;
        uint64_t v11 = "%@ Failed to receive informational packet";
        goto LABEL_34;
      }
    }

- (void)retryCookieForIKESA:(uint64_t)a3 validated:(void *)a4 handler:
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  uint64_t v9 = a4;
  if (a1)
  {
    uint64_t v10 = (dispatch_queue_s *)objc_getProperty(a1, v8, 368LL, 1);
    dispatch_assert_queue_V2(v10);

    if ((a3 & 1) != 0
      || (!v7 ? (id Property = 0LL) : (id Property = objc_getProperty(v7, v11, 280LL, 1)),
          id v13 = Property,
          v13,
          !v13))
    {
      v9[2](v9, a3);
    }

    else
    {
      -[NEIKEv2Session resetMessages](a1, v14);
      ne_log_obj();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = a1;
        _os_log_debug_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_DEBUG,  "%@ Received cookie notification, retrying IKE SA Init with cookie (connect retry cookie)",  buf,  0xCu);
      }

      +[NEIKEv2IKESAInitPacket createIKESAInitForInitiatorIKESA:]((uint64_t)&OBJC_CLASS___NEIKEv2IKESAInitPacket, v7);
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v43[0] = MEMORY[0x1895F87A8];
        v43[1] = 3221225472LL;
        v43[2] = __66__NEIKEv2Session_Exchange__retryCookieForIKESA_validated_handler___block_invoke;
        v43[3] = &unk_18A08CF60;
        v43[4] = a1;
        id v44 = v7;
        uint64_t v45 = v9;
        if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v16, v43) == -1)
        {
          id v18 = objc_getProperty(a1, v17, 336LL, 1);
          ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"retry SA INIT cookie",  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v42);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v18, 3uLL, ErrorFailedToSend);

          -[NEIKEv2Session reportState](a1, v27);
          -[NEIKEv2Session resetAll]((uint64_t)a1, v28);
        }
      }

      else
      {
        ne_log_obj();
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v47 = a1;
          _os_log_error_impl( &dword_1876B1000,  v29,  OS_LOG_TYPE_ERROR,  "%@ Failed to create IKE SA Init retry packet (connect retry cookie)",  buf,  0xCu);
        }

        id v31 = objc_getProperty(a1, v30, 336LL, 1);
        ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create IKE SA Init retry packet (connect retry cookie)",  v32,  v33,  v34,  v35,  v36,  v37,  v38,  v42);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v31, 3uLL, ErrorInternal);

        -[NEIKEv2Session reportState](a1, v40);
        -[NEIKEv2Session resetAll]((uint64_t)a1, v41);
      }
    }
  }
}

void __66__NEIKEv2Session_Exchange__retryCookieForIKESA_validated_handler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[NEIKEv2IKESAInitPacket validateSAInitAsInitiator:]((uint64_t)v3, *(void **)(a1 + 40)) & 1) != 0)
    {
      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    }

    else
    {
      ne_log_obj();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v22 = 138412290;
        *(void *)&v22[4] = v21;
        _os_log_error_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_ERROR,  "%@ Failed to parse IKE SA Init retry reply (connect retry cookie)",  v22,  0xCu);
      }

      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    }

    v4();
  }

  else
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v22 = 138412290;
      *(void *)&v22[4] = v20;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive IKE SA Init retry reply (connect retry cookie)",  v22,  0xCu);
    }

    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v6, 336LL, 1);
    }
    id v8 = Property;
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive IKE SA Init retry reply (connect retry cookie)",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  *(uint64_t *)v22);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 3uLL, ErrorPeerInvalidSyntax);

    -[NEIKEv2Session reportState](*(void **)(a1 + 32), v17);
    -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v18);
  }
}

void __62__NEIKEv2Session_Exchange__retryKEForIKESA_validated_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[NEIKEv2IKESAInitPacket validateSAInitAsInitiator:]((uint64_t)v3, *(void **)(a1 + 40)) & 1) != 0)
    {
      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    }

    else
    {
      ne_log_obj();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v22 = 138412290;
        *(void *)&v22[4] = v21;
        _os_log_error_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_ERROR,  "%@ Failed to parse IKE SA Init retry reply (connect retry KE)",  v22,  0xCu);
      }

      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    }

    v4();
  }

  else
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v22 = 138412290;
      *(void *)&v22[4] = v20;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive IKE SA Init retry reply (connect retry KE)",  v22,  0xCu);
    }

    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v6, 336LL, 1);
    }
    id v8 = Property;
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive IKE SA Init retry reply (connect retry KE)",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  *(uint64_t *)v22);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 3uLL, ErrorPeerInvalidSyntax);

    -[NEIKEv2Session reportState](*(void **)(a1 + 32), v17);
    -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v18);
  }
}

- (void)handleIKEIntermediateForInitiatorIKESA:(unint64_t)a3 iteration:(void *)a4 handler:
{
  uint64_t v120 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  uint64_t v9 = a4;
  if (a1)
  {
    uint64_t v10 = (dispatch_queue_s *)objc_getProperty(a1, v8, 368LL, 1);
    dispatch_assert_queue_V2(v10);

    if (v7)
    {
      id Property = objc_getProperty(v7, v11, 96LL, 1);
      uint64_t v14 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v13, 120LL, 1);
      }
    }

    else
    {
      uint64_t v14 = 0LL;
      id Property = 0LL;
    }

    id v15 = Property;
    unint64_t v16 = [v15 count];

    if (v16 > a3)
    {
      if (v7)
      {
        id v18 = objc_getProperty(v7, v17, 96LL, 1);
        uint64_t v20 = v18;
        if (v18) {
          id v18 = objc_getProperty(v18, v19, 120LL, 1);
        }
      }

      else
      {
        uint64_t v20 = 0LL;
        id v18 = 0LL;
      }

      id v21 = v18;
      [v21 objectAtIndexedSubscript:a3];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7) {
        id v24 = objc_getProperty(v7, v23, 96LL, 1);
      }
      else {
        id v24 = 0LL;
      }
      id v25 = v24;
      -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v25);
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 objectForKeyedSubscript:v22];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        if ((-[NEIKEv2IKESA generateLocalValuesForKEMProtocol:](v7, v27) & 1) != 0)
        {
          uint64_t v28 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2IntermediatePacket));
          uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NEIKEv2KeyExchangePayload);
          id v31 = v29;
          if (v28)
          {
            objc_setProperty_atomic(v28, v30, v29, 88LL);

            id v33 = objc_getProperty(v28, v32, 88LL, 1);
            uint64_t v35 = v33;
            if (v33) {
              objc_setProperty_atomic(v33, v34, v27, 24LL);
            }
          }

          else
          {

            uint64_t v35 = 0LL;
          }

          id v110 = v22;
          if (v7)
          {
            id v37 = objc_getProperty(v7, v36, 160LL, 1);
            uint64_t v38 = v37;
            if (v37)
            {
              __int128 v39 = (void *)*((void *)v37 + 2);
              goto LABEL_19;
            }
          }

          else
          {
            uint64_t v38 = 0LL;
          }

          __int128 v39 = 0LL;
LABEL_19:
          id v40 = v39;
          uint64_t v42 = v40;
          if (v28)
          {
            id v43 = objc_getProperty(v28, v41, 88LL, 1);
            uint64_t v45 = v43;
            if (v43) {
              objc_setProperty_atomic(v43, v44, v42, 32LL);
            }

            id v47 = objc_getProperty(v28, v46, 88LL, 1);
          }

          else
          {

            id v47 = 0LL;
          }

          id v48 = v47;
          char v49 = -[NEIKEv2Payload isValid]((uint64_t)v48);

          if ((v49 & 1) == 0)
          {
            ne_log_obj();
            id v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v117 = a1;
              _os_log_error_impl( &dword_1876B1000,  v64,  OS_LOG_TYPE_ERROR,  "%@ Failed to create IKE_INTERMEDIATE packet (connect intermediate)",  buf,  0xCu);
            }

            id v66 = objc_getProperty(a1, v65, 336LL, 1);
            ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create IKE_INTERMEDIATE packet (connect intermediate)",  v67,  v68,  v69,  v70,  v71,  v72,  v73,  v109);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v66, 3uLL, ErrorInternal);

            -[NEIKEv2Session reportState](a1, v75);
            -[NEIKEv2Session resetAll]((uint64_t)a1, v76);
            uint64_t v22 = v110;
            goto LABEL_40;
          }

          v111[0] = MEMORY[0x1895F87A8];
          v111[1] = 3221225472LL;
          v111[2] = __85__NEIKEv2Session_Exchange__handleIKEIntermediateForInitiatorIKESA_iteration_handler___block_invoke;
          v111[3] = &unk_18A08CF88;
          v111[4] = a1;
          id v112 = v27;
          uint64_t v50 = v7;
          id v113 = v50;
          unint64_t v115 = a3;
          uint64_t v114 = v9;
          if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v28, v111) == -1)
          {
            id v55 = objc_getProperty(a1, v51, 336LL, 1);
            ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"initiator IKE_INTERMEDIATE #%zu",  v77,  v78,  v79,  v80,  v81,  v82,  v83,  a3 + 1);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v55, 3uLL, ErrorFailedToSend);
            uint64_t v22 = v110;
          }

          else
          {
            if (v28) {
              int v52 = *((_DWORD *)v28 + 6) + 1;
            }
            else {
              int v52 = 1;
            }
            uint64_t v22 = v110;
            if (v7) {
              v50[7] = v52;
            }
            ne_log_obj();
            v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v117 = a1;
              _os_log_error_impl( &dword_1876B1000,  v53,  OS_LOG_TYPE_ERROR,  "%@ Failed to process IKE_INTERMEDIATE request packet for AUTH (connect intermediate)",  buf,  0xCu);
            }

            id v55 = objc_getProperty(a1, v54, 336LL, 1);
            ErrorFailedToSend = (void *)NEIKEv2CreateErrorCrypto( @"Failed to process IKE_INTERMEDIATE request packet for AUTH (connect intermediate)",  v56,  v57,  v58,  v59,  v60,  v61,  v62,  v109);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v55, 3uLL, ErrorFailedToSend);
          }

          -[NEIKEv2Session reportState](a1, v84);
          -[NEIKEv2Session resetAll]((uint64_t)a1, v85);
LABEL_39:

LABEL_40:
LABEL_41:

          goto LABEL_42;
        }

        ne_log_obj();
        v97 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v117 = a1;
          __int16 v118 = 2112;
          v119 = v27;
          _os_log_error_impl( &dword_1876B1000,  v97,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate values for KEM %@ (connect intermediate)",  buf,  0x16u);
        }

        id v88 = objc_getProperty(a1, v98, 336LL, 1);
        v96 = (void *)NEIKEv2CreateErrorInternal( @"Failed to generate values for KEM %@ (connect intermediate)",  v99,  v100,  v101,  v102,  v103,  v104,  v105,  (uint64_t)v27);
      }

      else
      {
        ne_log_obj();
        uint64_t v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v117 = a1;
          __int16 v118 = 2112;
          v119 = v22;
          _os_log_error_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_ERROR,  "%@ No chosen KEM found for transform type %@ (connect intermediate)",  buf,  0x16u);
        }

        id v88 = objc_getProperty(a1, v87, 336LL, 1);
        v96 = (void *)NEIKEv2CreateErrorInternal( @"No chosen KEM found for transform type %@ (connect intermediate)",  v89,  v90,  v91,  v92,  v93,  v94,  v95,  (uint64_t)v22);
      }

      __int128 v106 = v96;
      -[NEIKEv2IKESA setState:error:]((uint64_t)v88, 3uLL, v96);

      -[NEIKEv2Session reportState](a1, v107);
      -[NEIKEv2Session resetAll]((uint64_t)a1, v108);
      goto LABEL_41;
    }

    v9[2](v9);
  }

void __85__NEIKEv2Session_Exchange__handleIKEIntermediateForInitiatorIKESA_iteration_handler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v124 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id Property = v3;
    SEL v6 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v5, 88LL, 1);
    }
    id v7 = Property;

    if (v7)
    {
      if (v6)
      {
        id v9 = objc_getProperty(v6, v8, 88LL, 1);
        uint64_t v11 = v9;
        if (v9) {
          id v9 = objc_getProperty(v9, v10, 24LL, 1);
        }
      }

      else
      {
        uint64_t v11 = 0LL;
        id v9 = 0LL;
      }

      id v12 = v9;

      if (v12)
      {
        if (v6)
        {
          id v14 = objc_getProperty(v6, v13, 88LL, 1);
          unint64_t v16 = v14;
          if (v14) {
            id v14 = objc_getProperty(v14, v15, 32LL, 1);
          }
        }

        else
        {
          unint64_t v16 = 0LL;
          id v14 = 0LL;
        }

        id v17 = v14;

        if (v17)
        {
          if (v6)
          {
            id v19 = objc_getProperty(v6, v18, 88LL, 1);
            id v21 = v19;
            if (v19) {
              id v19 = objc_getProperty(v19, v20, 24LL, 1);
            }
          }

          else
          {
            id v21 = 0LL;
            id v19 = 0LL;
          }

          id v22 = v19;
          uint64_t v23 = [v22 method];
          uint64_t v24 = [*(id *)(a1 + 40) method];

          if (v23 != v24)
          {
            ne_log_obj();
            uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              uint64_t v76 = *(void *)(a1 + 32);
              if (v6)
              {
                id v77 = objc_getProperty(v6, v57, 88LL, 1);
                uint64_t v79 = v77;
                if (v77) {
                  id v77 = objc_getProperty(v77, v78, 24LL, 1);
                }
              }

              else
              {
                uint64_t v79 = 0LL;
                id v77 = 0LL;
              }

              id v80 = v77;
              uint64_t v81 = [v80 method];
              uint64_t v82 = [*(id *)(a1 + 40) method];
              *(_DWORD *)buf = 138412802;
              uint64_t v119 = v76;
              __int16 v120 = 2048;
              uint64_t v121 = v81;
              __int16 v122 = 2048;
              uint64_t v123 = v82;
              _os_log_error_impl( &dword_1876B1000,  v56,  OS_LOG_TYPE_ERROR,  "%@ Did not receive matching method from KE payload (%zu != %zu) (connect intermediate)",  buf,  0x20u);
            }

            id v59 = *(id *)(a1 + 32);
            if (v59) {
              id v59 = objc_getProperty(v59, v58, 336LL, 1);
            }
            id v44 = v59;
            if (v6)
            {
              id v61 = objc_getProperty(v6, v60, 88LL, 1);
              v53 = v61;
              if (v61) {
                id v61 = objc_getProperty(v61, v62, 24LL, 1);
              }
            }

            else
            {
              v53 = 0LL;
              id v61 = 0LL;
            }

            id v63 = v61;
            uint64_t v64 = [v63 method];
            [*(id *)(a1 + 40) method];
            ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive matching method from KE payload (%zu != %zu) (connect intermediate)",  v65,  v66,  v67,  v68,  v69,  v70,  v71,  v64);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v44, 3uLL, ErrorPeerInvalidSyntax);

            goto LABEL_44;
          }

          if (v6)
          {
            id v26 = objc_getProperty(v6, v25, 88LL, 1);
            uint64_t v28 = v26;
            if (v26) {
              id v26 = objc_getProperty(v26, v27, 32LL, 1);
            }
          }

          else
          {
            uint64_t v28 = 0LL;
            id v26 = 0LL;
          }

          id v30 = v26;
          id v31 = *(void **)(a1 + 48);
          if (v31) {
            objc_setProperty_atomic(v31, v29, v30, 152LL);
          }

          if ((-[NEIKEv2IKESA processPrimaryKeyExchange](*(void *)(a1 + 48), v32) & 1) != 0)
          {
            if ((-[NEIKEv2IKESA updateIntAuthWithPacket:](*(void *)(a1 + 48), v6) & 1) != 0)
            {
              id v33 = *(_BYTE **)(a1 + 48);
              if (v33 && (-[NEIKEv2IKESA generateAllValuesUsingSA:](v33, *(void **)(a1 + 48)) & 1) != 0)
              {
                -[NEIKEv2Session handleIKEIntermediateForInitiatorIKESA:iteration:handler:]( *(void *)(a1 + 32),  *(void *)(a1 + 48),  *(void *)(a1 + 64) + 1LL,  *(void *)(a1 + 56));
LABEL_45:

                goto LABEL_46;
              }

              ne_log_obj();
              v97 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
              {
                uint64_t v115 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 138412290;
                uint64_t v119 = v115;
                _os_log_error_impl( &dword_1876B1000,  v97,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate crypto values (connect intermediate)",  buf,  0xCu);
              }

              id v99 = *(id *)(a1 + 32);
              if (v99) {
                id v99 = objc_getProperty(v99, v98, 336LL, 1);
              }
              id v44 = v99;
              v107 = @"Failed to generate crypto values (connect intermediate)";
            }

            else
            {
              ne_log_obj();
              __int16 v111 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
              {
                uint64_t v116 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 138412290;
                uint64_t v119 = v116;
                _os_log_error_impl( &dword_1876B1000,  v111,  OS_LOG_TYPE_ERROR,  "%@ Failed to process IKE_INTERMEDIATE reply packet for AUTH (connect intermediate)",  buf,  0xCu);
              }

              id v113 = *(id *)(a1 + 32);
              if (v113) {
                id v113 = objc_getProperty(v113, v112, 336LL, 1);
              }
              id v44 = v113;
              v107 = @"Failed to process IKE_INTERMEDIATE reply packet for AUTH (connect intermediate)";
            }
          }

          else
          {
            ne_log_obj();
            v108 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl( &dword_1876B1000,  v108,  OS_LOG_TYPE_ERROR,  "Failed to process KE data (connect intermediate)",  buf,  2u);
            }

            id v110 = *(id *)(a1 + 32);
            if (v110) {
              id v110 = objc_getProperty(v110, v109, 336LL, 1);
            }
            id v44 = v110;
            v107 = @"Failed to process KE data (connect intermediate)";
          }

          ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(v107, v100, v101, v102, v103, v104, v105, v106, v117);
LABEL_43:
          v53 = ErrorCrypto;
          -[NEIKEv2IKESA setState:error:]((uint64_t)v44, 3uLL, ErrorCrypto);
LABEL_44:

          -[NEIKEv2Session reportState](*(void **)(a1 + 32), v54);
          -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v55);
          goto LABEL_45;
        }

        ne_log_obj();
        char v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          uint64_t v75 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v119 = v75;
          _os_log_error_impl( &dword_1876B1000,  v49,  OS_LOG_TYPE_ERROR,  "%@ Did not receive data in KE payload (connect intermediate)",  buf,  0xCu);
        }

        id v51 = *(id *)(a1 + 32);
        if (v51) {
          id v51 = objc_getProperty(v51, v50, 336LL, 1);
        }
        id v44 = v51;
        uint64_t v45 = @"Did not receive data in KE payload (connect intermediate)";
      }

      else
      {
        ne_log_obj();
        SEL v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          uint64_t v74 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v119 = v74;
          _os_log_error_impl( &dword_1876B1000,  v46,  OS_LOG_TYPE_ERROR,  "%@ Did not receive method in KE payload (connect intermediate)",  buf,  0xCu);
        }

        id v48 = *(id *)(a1 + 32);
        if (v48) {
          id v48 = objc_getProperty(v48, v47, 336LL, 1);
        }
        id v44 = v48;
        uint64_t v45 = @"Did not receive method in KE payload (connect intermediate)";
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v73 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v119 = v73;
        _os_log_error_impl( &dword_1876B1000,  v34,  OS_LOG_TYPE_ERROR,  "%@ Did not receive KE payload (connect intermediate)",  buf,  0xCu);
      }

      id v36 = *(id *)(a1 + 32);
      if (v36) {
        id v36 = objc_getProperty(v36, v35, 336LL, 1);
      }
      id v44 = v36;
      uint64_t v45 = @"Did not receive KE payload (connect intermediate)";
    }

    ErrorCrypto = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v45, v37, v38, v39, v40, v41, v42, v43, v117);
    goto LABEL_43;
  }

  ne_log_obj();
  uint64_t v83 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
  {
    uint64_t v114 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v119 = v114;
    _os_log_error_impl( &dword_1876B1000,  v83,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive IKE_INTERMEDIATE reply (connect intermediate)",  buf,  0xCu);
  }

  id v85 = *(id *)(a1 + 32);
  if (v85) {
    id v85 = objc_getProperty(v85, v84, 336LL, 1);
  }
  id v86 = v85;
  uint64_t v94 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive IKE_INTERMEDIATE reply (connect intermediate)",  v87,  v88,  v89,  v90,  v91,  v92,  v93,  v117);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v86, 3uLL, v94);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v95);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v96);
LABEL_46:
}

- (uint64_t)handleIKEIntermediateForResponderIKESA:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  if (a1)
  {
    id v14 = a4;
    unint64_t v16 = (dispatch_queue_s *)objc_getProperty(a1, v15, 368LL, 1);
    dispatch_assert_queue_V2(v16);

    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __120__NEIKEv2Session_Exchange__handleIKEIntermediateForResponderIKESA_iteration_replyPacket_replyPacketDescription_handler___block_invoke;
    v31[3] = &unk_18A08CFB0;
    uint64_t v35 = a3;
    id v32 = v11;
    id v33 = a1;
    id v34 = v13;
    uint64_t v17 = -[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v14, v31);

    if ((v17 & 1) == 0)
    {
      id v19 = objc_getProperty(a1, v18, 336LL, 1);
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"%@",  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)v12);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v19, 3uLL, ErrorFailedToSend);

      -[NEIKEv2Session reportState](a1, v28);
      -[NEIKEv2Session resetAll]((uint64_t)a1, v29);
    }
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return v17;
}

void __120__NEIKEv2Session_Exchange__handleIKEIntermediateForResponderIKESA_iteration_replyPacket_replyPacketDescription_handler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v233 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  unint64_t v5 = *(void *)(a1 + 56);
  SEL v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id Property = objc_getProperty(v6, v3, 96LL, 1);
    id v9 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v8, 120LL, 1);
    }
  }

  else
  {
    id v9 = 0LL;
    id Property = 0LL;
  }

  id v10 = Property;
  unint64_t v11 = [v10 count];

  if (v5 < v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v13 = v4;
      id v14 = *(void **)(a1 + 32);
      if (v14)
      {
        id v15 = objc_getProperty(v14, v12, 96LL, 1);
        uint64_t v17 = v15;
        if (v15) {
          id v15 = objc_getProperty(v15, v16, 120LL, 1);
        }
      }

      else
      {
        uint64_t v17 = 0LL;
        id v15 = 0LL;
      }

      id v18 = v15;
      [v18 objectAtIndexedSubscript:*(void *)(a1 + 56)];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();

      id v21 = *(id *)(a1 + 32);
      if (v21) {
        id v21 = objc_getProperty(v21, v20, 96LL, 1);
      }
      id v22 = v21;
      -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v22);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 objectForKeyedSubscript:v19];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        ne_log_obj();
        v202 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v202, OS_LOG_TYPE_ERROR))
        {
          uint64_t v214 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v228 = v214;
          __int16 v229 = 2112;
          uint64_t v230 = (uint64_t)v19;
          _os_log_error_impl( &dword_1876B1000,  v202,  OS_LOG_TYPE_ERROR,  "%@ No chosen KEM found for transform type %@ (receive intermediate)",  buf,  0x16u);
        }

        id v204 = *(id *)(a1 + 40);
        if (v204) {
          id v204 = objc_getProperty(v204, v203, 336LL, 1);
        }
        id v116 = v204;
        ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"No chosen KEM found for transform type %@ (receive intermediate)",  v205,  v206,  v207,  v208,  v209,  v210,  v211,  (uint64_t)v19);
        goto LABEL_82;
      }

      if (v13) {
        id v26 = objc_getProperty(v13, v25, 88LL, 1);
      }
      else {
        id v26 = 0LL;
      }
      id v27 = v26;

      if (v27)
      {
        if (v13)
        {
          id v29 = objc_getProperty(v13, v28, 88LL, 1);
          id v31 = v29;
          if (v29) {
            id v29 = objc_getProperty(v29, v30, 24LL, 1);
          }
        }

        else
        {
          id v31 = 0LL;
          id v29 = 0LL;
        }

        id v32 = v29;

        if (v32)
        {
          if (v13)
          {
            id v34 = objc_getProperty(v13, v33, 88LL, 1);
            id v36 = v34;
            if (v34) {
              id v34 = objc_getProperty(v34, v35, 32LL, 1);
            }
          }

          else
          {
            id v36 = 0LL;
            id v34 = 0LL;
          }

          id v37 = v34;

          if (v37)
          {
            v226 = v19;
            if (v13)
            {
              id v39 = objc_getProperty(v13, v38, 88LL, 1);
              uint64_t v41 = v39;
              if (v39) {
                id v39 = objc_getProperty(v39, v40, 24LL, 1);
              }
            }

            else
            {
              uint64_t v41 = 0LL;
              id v39 = 0LL;
            }

            id v42 = v39;
            uint64_t v43 = [v42 method];
            uint64_t v44 = [v24 method];

            if (v43 != v44)
            {
              ne_log_obj();
              v128 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
              {
                uint64_t v177 = *(void *)(a1 + 40);
                if (v13)
                {
                  id v178 = objc_getProperty(v13, v129, 88LL, 1);
                  v180 = v178;
                  if (v178) {
                    id v178 = objc_getProperty(v178, v179, 24LL, 1);
                  }
                }

                else
                {
                  v180 = 0LL;
                  id v178 = 0LL;
                }

                id v181 = v178;
                *(_DWORD *)buf = 138412802;
                uint64_t v228 = v177;
                __int16 v229 = 2048;
                uint64_t v230 = [v181 method];
                __int16 v231 = 2048;
                uint64_t v232 = [v24 method];
                _os_log_error_impl( &dword_1876B1000,  v128,  OS_LOG_TYPE_ERROR,  "%@ Did not receive matching method from KE payload (%zu != %zu) (receive intermediate)",  buf,  0x20u);
              }

              id v131 = *(id *)(a1 + 40);
              if (v131) {
                id v131 = objc_getProperty(v131, v130, 336LL, 1);
              }
              id v133 = v131;
              if (v13)
              {
                id v134 = objc_getProperty(v13, v132, 88LL, 1);
                v136 = v134;
                if (v134) {
                  id v134 = objc_getProperty(v134, v135, 24LL, 1);
                }
              }

              else
              {
                v136 = 0LL;
                id v134 = 0LL;
              }

              id v137 = v134;
              uint64_t v138 = [v137 method];
              [v24 method];
              ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive matching method from KE payload (%zu != %zu) (receive intermediate)",  v139,  v140,  v141,  v142,  v143,  v144,  v145,  v138);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v133, 3uLL, ErrorPeerInvalidSyntax);

              -[NEIKEv2Session reportState](*(void **)(a1 + 40), v147);
              -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v148);
              id v19 = v226;
              goto LABEL_83;
            }

            SEL v46 = *(void **)(a1 + 32);
            if (v13)
            {
              id v47 = objc_getProperty(v13, v45, 88LL, 1);
              char v49 = v47;
              if (v47) {
                id v47 = objc_getProperty(v47, v48, 32LL, 1);
              }
            }

            else
            {
              char v49 = 0LL;
              id v47 = 0LL;
            }

            id v50 = v47;
            char v51 = -[NEIKEv2IKESA generateLocalValuesForKEMProtocol:peerPayload:](v46, v24, v50);

            if ((v51 & 1) != 0)
            {
              int v52 = (void *)-[NEIKEv2Packet initResponse:]( (uint64_t)objc_alloc(&OBJC_CLASS___NEIKEv2IntermediatePacket),  v13);
              v53 = objc_alloc_init(&OBJC_CLASS___NEIKEv2KeyExchangePayload);
              id v55 = v53;
              if (v52)
              {
                objc_setProperty_atomic(v52, v54, v53, 88LL);

                id v57 = objc_getProperty(v52, v56, 88LL, 1);
                id v59 = v57;
                if (v57) {
                  objc_setProperty_atomic(v57, v58, v24, 24LL);
                }
              }

              else
              {

                id v59 = 0LL;
              }

              id v61 = *(void **)(a1 + 32);
              if (v61)
              {
                id v62 = objc_getProperty(v61, v60, 160LL, 1);
                id v63 = v62;
                if (v62)
                {
                  uint64_t v64 = (void *)*((void *)v62 + 2);
                  goto LABEL_37;
                }
              }

              else
              {
                id v63 = 0LL;
              }

              uint64_t v64 = 0LL;
LABEL_37:
              id v66 = v64;
              if (v52)
              {
                id v67 = objc_getProperty(v52, v65, 88LL, 1);
                uint64_t v69 = v67;
                if (v67) {
                  objc_setProperty_atomic(v67, v68, v66, 32LL);
                }
              }

              else
              {
                uint64_t v69 = 0LL;
              }

              if (v13) {
                id v71 = objc_getProperty(v13, v70, 88LL, 1);
              }
              else {
                id v71 = 0LL;
              }
              id v72 = v71;
              char v73 = -[NEIKEv2Payload isValid]((uint64_t)v72);

              if ((v73 & 1) == 0)
              {
                ne_log_obj();
                v159 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v183 = *(void *)(a1 + 40);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v228 = v183;
                  _os_log_error_impl( &dword_1876B1000,  v159,  OS_LOG_TYPE_ERROR,  "%@ Failed to create IKE_INTERMEDIATE packet (receive intermediate)",  buf,  0xCu);
                }

                v163 = *(void **)(a1 + 40);
                v162 = (uint64_t *)(a1 + 40);
                id v161 = v163;
                if (v163) {
                  id v161 = objc_getProperty(v161, v160, 336LL, 1);
                }
                id v102 = v161;
                ErrorCrypto = (void *)NEIKEv2CreateErrorInternal( @"Failed to create IKE_INTERMEDIATE packet (receive intermediate)",  v164,  v165,  v166,  v167,  v168,  v169,  v170,  v224);
                -[NEIKEv2IKESA setState:error:]((uint64_t)v102, 3uLL, ErrorCrypto);
                id v85 = v162;
                goto LABEL_102;
              }

              uint64_t v75 = *(void **)(a1 + 32);
              if (v75)
              {
                id v76 = objc_getProperty(v75, v74, 160LL, 1);
                id v77 = v76;
                if (v76)
                {
                  uint64_t v78 = (void *)*((void *)v76 + 3);
LABEL_46:
                  id v80 = v78;
                  uint64_t v81 = *(void **)(a1 + 32);
                  if (v81) {
                    objc_setProperty_atomic(v81, v79, v80, 168LL);
                  }

                  uint64_t v83 = *(void **)(a1 + 32);
                  if (v83)
                  {
                    objc_setProperty_atomic(v83, v82, 0LL, 160LL);
                    uint64_t v84 = *(void *)(a1 + 32);
                  }

                  else
                  {
                    uint64_t v84 = 0LL;
                  }

                  id v85 = (uint64_t *)(a1 + 40);
                  uint64_t v86 = *(void *)(a1 + 40);
                  uint64_t v87 = *(void *)(a1 + 56) + 1LL;
                  id v88 = objc_alloc(NSString);
                  uint64_t v225 = *(void *)(a1 + 56) + 1LL;
                  uint64_t v89 = (void *)[v88 initWithFormat:@"responder IKE_INTERMEDIATE #%zu"];
                  int v90 = -[NEIKEv2Session handleIKEIntermediateForResponderIKESA:iteration:replyPacket:replyPacketDescription:handler:]( v86,  v84,  v87,  v52,  v89,  *(void *)(a1 + 48));

                  id v19 = v226;
                  if (!v90) {
                    goto LABEL_103;
                  }
                  if ((-[NEIKEv2IKESA updateIntAuthWithPacket:](*(void *)(a1 + 32), v13) & 1) != 0)
                  {
                    if ((-[NEIKEv2IKESA updateIntAuthWithPacket:](*(void *)(a1 + 32), v52) & 1) != 0)
                    {
                      uint64_t v91 = *(_BYTE **)(a1 + 32);
                      ne_log_obj();
                      uint64_t v92 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v221 = *v85;
                        *(_DWORD *)buf = 138412290;
                        uint64_t v228 = v221;
                        _os_log_error_impl( &dword_1876B1000,  v92,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate crypto values (receive intermediate)",  buf,  0xCu);
                      }

                      id v94 = (id)*v85;
                      if (*v85) {
                        id v94 = objc_getProperty(v94, v93, 336LL, 1);
                      }
                      id v102 = v94;
                      uint64_t v103 = @"Failed to generate crypto values (receive intermediate)";
                    }

                    else
                    {
                      ne_log_obj();
                      v218 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v223 = *v85;
                        *(_DWORD *)buf = 138412290;
                        uint64_t v228 = v223;
                        _os_log_error_impl( &dword_1876B1000,  v218,  OS_LOG_TYPE_ERROR,  "%@ Failed to process IKE_INTERMEDIATE reply packet for AUTH (receive intermediate)",  buf,  0xCu);
                      }

                      id v220 = (id)*v85;
                      if (*v85) {
                        id v220 = objc_getProperty(v220, v219, 336LL, 1);
                      }
                      id v102 = v220;
                      uint64_t v103 = @"Failed to process IKE_INTERMEDIATE reply packet for AUTH (receive intermediate)";
                    }
                  }

                  else
                  {
                    ne_log_obj();
                    v215 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v215, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v222 = *v85;
                      *(_DWORD *)buf = 138412290;
                      uint64_t v228 = v222;
                      _os_log_error_impl( &dword_1876B1000,  v215,  OS_LOG_TYPE_ERROR,  "%@ Failed to process IKE_INTERMEDIATE request packet for AUTH (receive intermediate)",  buf,  0xCu);
                    }

                    id v217 = (id)*v85;
                    if (*v85) {
                      id v217 = objc_getProperty(v217, v216, 336LL, 1);
                    }
                    id v102 = v217;
                    uint64_t v103 = @"Failed to process IKE_INTERMEDIATE request packet for AUTH (receive intermediate)";
                  }

                  ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(v103, v95, v96, v97, v98, v99, v100, v101, v225);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v102, 3uLL, ErrorCrypto);
LABEL_102:

                  -[NEIKEv2Session reportState]((void *)*v85, v172);
                  -[NEIKEv2Session resetAll](*v85, v173);
                  id v19 = v226;
LABEL_103:

                  goto LABEL_83;
                }
              }

              else
              {
                id v77 = 0LL;
              }

              uint64_t v78 = 0LL;
              goto LABEL_46;
            }

            ne_log_obj();
            v149 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            id v19 = v226;
            if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
            {
              uint64_t v182 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138412546;
              uint64_t v228 = v182;
              __int16 v229 = 2112;
              uint64_t v230 = (uint64_t)v24;
              _os_log_error_impl( &dword_1876B1000,  v149,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate values for KEM %@ (receive intermediate)",  buf,  0x16u);
            }

            id v151 = *(id *)(a1 + 40);
            if (v151) {
              id v151 = objc_getProperty(v151, v150, 336LL, 1);
            }
            id v116 = v151;
            ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to generate values for KEM %@ (receive intermediate)",  v152,  v153,  v154,  v155,  v156,  v157,  v158,  (uint64_t)v24);
LABEL_82:
            v125 = ErrorInternal;
            -[NEIKEv2IKESA setState:error:]((uint64_t)v116, 3uLL, ErrorInternal);

            -[NEIKEv2Session reportState](*(void **)(a1 + 40), v126);
            -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v127);
LABEL_83:

            goto LABEL_84;
          }

          ne_log_obj();
          uint64_t v121 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
          {
            uint64_t v176 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            uint64_t v228 = v176;
            _os_log_error_impl( &dword_1876B1000,  v121,  OS_LOG_TYPE_ERROR,  "%@ Did not receive data in KE payload (receive intermediate)",  buf,  0xCu);
          }

          id v123 = *(id *)(a1 + 40);
          if (v123) {
            id v123 = objc_getProperty(v123, v122, 336LL, 1);
          }
          id v116 = v123;
          uint64_t v117 = @"Did not receive data in KE payload (receive intermediate)";
        }

        else
        {
          ne_log_obj();
          __int16 v118 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
          {
            uint64_t v175 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            uint64_t v228 = v175;
            _os_log_error_impl( &dword_1876B1000,  v118,  OS_LOG_TYPE_ERROR,  "%@ Did not receive method in KE payload (receive intermediate)",  buf,  0xCu);
          }

          id v120 = *(id *)(a1 + 40);
          if (v120) {
            id v120 = objc_getProperty(v120, v119, 336LL, 1);
          }
          id v116 = v120;
          uint64_t v117 = @"Did not receive method in KE payload (receive intermediate)";
        }
      }

      else
      {
        ne_log_obj();
        uint64_t v106 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          uint64_t v174 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v228 = v174;
          _os_log_error_impl( &dword_1876B1000,  v106,  OS_LOG_TYPE_ERROR,  "%@ Did not receive KE payload (receive intermediate)",  buf,  0xCu);
        }

        id v108 = *(id *)(a1 + 40);
        if (v108) {
          id v108 = objc_getProperty(v108, v107, 336LL, 1);
        }
        id v116 = v108;
        uint64_t v117 = @"Did not receive KE payload (receive intermediate)";
      }

      ErrorInternal = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v117, v109, v110, v111, v112, v113, v114, v115, v224);
      goto LABEL_82;
    }

    ne_log_obj();
    v184 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
    {
      uint64_t v212 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v228 = v212;
      _os_log_error_impl( &dword_1876B1000,  v184,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive IKE_INTERMEDIATE packet (receive intermediate)",  buf,  0xCu);
    }

    id v186 = *(id *)(a1 + 40);
    if (v186) {
      id v186 = objc_getProperty(v186, v185, 336LL, 1);
    }
    id v194 = v186;
    v195 = @"Failed to receive IKE_INTERMEDIATE packet (receive intermediate)";
LABEL_118:
    v199 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v195, v187, v188, v189, v190, v191, v192, v193, v224);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v194, 3uLL, v199);

    -[NEIKEv2Session reportState](*(void **)(a1 + 40), v200);
    -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v201);
    goto LABEL_84;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    v196 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
    {
      uint64_t v213 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v228 = v213;
      _os_log_error_impl( &dword_1876B1000,  v196,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive IKE Auth packet (receive)",  buf,  0xCu);
    }

    id v198 = *(id *)(a1 + 40);
    if (v198) {
      id v198 = objc_getProperty(v198, v197, 336LL, 1);
    }
    id v194 = v198;
    v195 = @"Failed to receive IKE Auth packet (receive)";
    goto LABEL_118;
  }

  if (v4) {
    int v104 = v4[6];
  }
  else {
    int v104 = 0;
  }
  uint64_t v105 = *(void *)(a1 + 32);
  if (v105) {
    *(_DWORD *)(v105 + 28) = v104;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_84:
}

- (void)handleEAPAndGSPMForIKESA:(void *)a3 authPacket:(void *)a4 handler:
{
  uint64_t v448 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (!a1) {
    goto LABEL_194;
  }
  unint64_t v11 = (dispatch_queue_s *)objc_getProperty(a1, v9, 368LL, 1);
  dispatch_assert_queue_V2(v11);

  if (v8)
  {
    id v13 = objc_getProperty(v8, v12, 136LL, 1);
    if (v13)
    {

LABEL_8:
      id Property = objc_getProperty(v8, v15, 136LL, 1);
      goto LABEL_9;
    }

    id v16 = objc_getProperty(v8, v14, 144LL, 1);
  }

  else
  {
    id v16 = 0LL;
  }

  id v17 = v16;

  if (!v17)
  {
    v10[2](v10, v8);
    goto LABEL_194;
  }

  if (v8) {
    goto LABEL_8;
  }
  id Property = 0LL;
LABEL_9:
  id v19 = Property;

  if (!v19)
  {
    if (v8) {
      id v45 = objc_getProperty(v8, v20, 144LL, 1);
    }
    else {
      id v45 = 0LL;
    }
    id v46 = v45;

    if (!v46)
    {
      uint64_t v68 = 0LL;
      uint64_t v69 = "";
      goto LABEL_185;
    }

    id v47 = v7;
    id v48 = v8;
    objc_opt_self();
    id obja = v48;
    v419 = a1;
    if (v47)
    {
      if (v8)
      {
        if (-[NEIKEv2Packet hasErrors](v48, v49))
        {
          v421 = v10;
          selfa = v47;
          id v51 = v8;
          __int128 v441 = 0u;
          __int128 v442 = 0u;
          __int128 v439 = 0u;
          __int128 v440 = 0u;
          id v52 = objc_getProperty(v48, v50, 64LL, 1);
          uint64_t v53 = [v52 countByEnumeratingWithState:&v439 objects:v446 count:16];
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v440;
            while (2)
            {
              for (uint64_t i = 0LL; i != v54; ++i)
              {
                if (*(void *)v440 != v55) {
                  objc_enumerationMutation(v52);
                }
                id v57 = *(const __CFString **)(*((void *)&v439 + 1) + 8 * i);
                if (v57 && (unint64_t)(v57->length - 1) <= 0x3FFE)
                {
                  uint64_t v98 = (__CFString *)-[NEIKEv2NotifyPayload copyError](v57);
                  ne_log_obj();
                  uint64_t v99 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                  {
                    v235 = (void *)[v48 copyShortDescription];
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v235;
                    __int16 v444 = 2112;
                    v445 = v98;
                    _os_log_error_impl( &dword_1876B1000,  v99,  OS_LOG_TYPE_ERROR,  "%@ Initiator auth GSPM received notify error: %@",  buf,  0x16u);
                  }

                  ErrorPeerInvalidSyntax = v98;
                  uint64_t v68 = 0LL;
                  uint64_t v65 = (uint64_t)ErrorPeerInvalidSyntax;
                  id v8 = v51;
                  id v10 = v421;
                  id v47 = selfa;
                  goto LABEL_87;
                }
              }

              uint64_t v54 = [v52 countByEnumeratingWithState:&v439 objects:v446 count:16];
              if (v54) {
                continue;
              }
              break;
            }
          }

          id v8 = v51;
          id v10 = v421;
          id v47 = selfa;
        }

        id v58 = objc_getProperty(v48, v50, 144LL, 1);
        id v59 = v58;
        if (v58) {
          uint64_t v60 = (void *)*((void *)v58 + 3);
        }
        else {
          uint64_t v60 = 0LL;
        }
        id v61 = v60;

        if (!v61)
        {
          ne_log_obj();
          uint64_t v101 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          id v48 = obja;
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          {
            v236 = (void *)[obja copyShortDescription];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v236;
            _os_log_error_impl(&dword_1876B1000, v101, OS_LOG_TYPE_ERROR, "%@ No GSPM data received", buf, 0xCu);

            id v48 = obja;
          }

          ErrorPeerInvalidSyntax = (__CFString *)NEIKEv2CreateErrorPeerInvalidSyntax( @"No GSPM data received",  v102,  v103,  v104,  v105,  v106,  v107,  v108,  v409);
          uint64_t v65 = 0LL;
          goto LABEL_146;
        }

        id v63 = objc_getProperty(v47, v62, 456LL, 1);
        uint64_t v65 = (uint64_t)v63;
        if ((v47[9] & 1) == 0)
        {
          id v48 = obja;
          if (v63)
          {
LABEL_59:
            id v422 = *(id *)(v65 + 16);
            goto LABEL_108;
          }

          id v66 = -[NEIKEv2GSPM initWithIKESA:]((id *)objc_alloc(&OBJC_CLASS___NEIKEv2GSPM), v47);
          if (v66)
          {
            uint64_t v65 = (uint64_t)v66;
            objc_setProperty_atomic(v47, v67, v66, 456LL);
            goto LABEL_59;
          }

          ne_log_obj();
          v382 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v382, OS_LOG_TYPE_ERROR))
          {
            v407 = (void *)[obja copyShortDescription];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v407;
            _os_log_error_impl(&dword_1876B1000, v382, OS_LOG_TYPE_ERROR, "%@ Failed to create GSPM handler", buf, 0xCu);
          }

          v380 = @"Failed to create GSPM handler";
LABEL_263:
          ErrorPeerInvalidSyntax = (__CFString *)NEIKEv2CreateErrorInternal( v380,  v373,  v374,  v375,  v376,  v377,  v378,  v379,  v409);
          uint64_t v65 = 0LL;
          uint64_t v68 = 0LL;
LABEL_87:
          id v48 = obja;
LABEL_169:

          if (v68)
          {

            uint64_t v69 = "GSPM";
            a1 = v419;
            goto LABEL_185;
          }

          id v282 = v8;
          if (!v47 || (v47[9] & 1) == 0)
          {
            ne_log_obj();
            v326 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v326, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v446 = 138412290;
              v447 = (const char *)v419;
              _os_log_error_impl( &dword_1876B1000,  v326,  OS_LOG_TYPE_ERROR,  "%@ Failed to process IKE Auth (GSPM) packet (receive)",  v446,  0xCu);
            }

            id v327 = +[NEIKEv2IKEAuthPacket createIKEAuthResponse:refusalError:]( (uint64_t)&OBJC_CLASS___NEIKEv2IKEAuthPacket,  obja,  0x18uLL);
            if ((-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)v419, v327, 0LL) & 1) != 0)
            {
              -[NEIKEv2IKESA setState:error:]((uint64_t)v47, 3uLL, ErrorPeerInvalidSyntax);
              -[NEIKEv2Session reportState](v419, v329);
            }

            else
            {
              id v356 = objc_getProperty(v419, v328, 336LL, 1);
              ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"GSPM refusal (receive) %@",  v357,  v358,  v359,  v360,  v361,  v362,  v363,  (uint64_t)ErrorPeerInvalidSyntax);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v356, 3uLL, ErrorFailedToSend);

              -[NEIKEv2Session reportState](v419, v365);
              -[NEIKEv2Session resetAll]((uint64_t)v419, v366);
            }

LABEL_247:
LABEL_248:
            id v8 = v282;
            goto LABEL_194;
          }
          v343 = -[__CFString domain](ErrorPeerInvalidSyntax, "domain");
          if ([v343 isEqual:@"NEIKEv2ErrorDomain"])
          {
            uint64_t v344 = -[__CFString code](ErrorPeerInvalidSyntax, "code");

            if (v344 == 5)
            {
              ne_log_obj();
              v345 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v345, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v446 = 138412290;
                v447 = (const char *)v419;
                _os_log_impl( &dword_1876B1000,  v345,  OS_LOG_TYPE_DEFAULT,  "%@ Received server redirect in IKE Auth (GSPM) (connect)",  v446,  0xCu);
              }

              -[NEIKEv2IKESA setState:error:]((uint64_t)v47, 3uLL, ErrorPeerInvalidSyntax);
              -[NEIKEv2Session reportServerRedirect:](v419, obja);
              -[NEIKEv2Session resetAll]((uint64_t)v419, v346);
              v10[2](v10, 0LL);
              goto LABEL_247;
            }
          }

          else
          {
          }

          ne_log_obj();
          v367 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v367, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v446 = 138412290;
            v447 = (const char *)v419;
            _os_log_error_impl( &dword_1876B1000,  v367,  OS_LOG_TYPE_ERROR,  "%@ Failed to process IKE Auth (GSPM) packet (connect)",  v446,  0xCu);
          }

          id v369 = objc_getProperty(v419, v368, 336LL, 1);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v369, 3uLL, ErrorPeerInvalidSyntax);

          -[NEIKEv2Session reportState](v419, v370);
          -[NEIKEv2Session resetAll]((uint64_t)v419, v371);
          goto LABEL_247;
        }

        id v48 = obja;
        if (!v63)
        {
          ne_log_obj();
          v372 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v372, OS_LOG_TYPE_ERROR))
          {
            v403 = (void *)[obja copyShortDescription];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v403;
            _os_log_error_impl( &dword_1876B1000,  v372,  OS_LOG_TYPE_ERROR,  "%@ Initiator is missing GSPM handler",  buf,  0xCu);
          }

          v380 = @"Initiator is missing GSPM handler";
          goto LABEL_263;
        }

        if ((v47[17] & 1) == 0)
        {
          if ((-[NEIKEv2IKEAuthPacket validateAuthPart1AsInitiator:beforeEAP:]((uint64_t)obja, v47, 0) & 1) == 0)
          {
            uint64_t Error = NEIKEv2CreateErrorPeerInvalidSyntax( @"Initial AUTH validation failed",  v109,  v110,  v111,  v112,  v113,  v114,  v115,  v409);
            goto LABEL_145;
          }

          if (-[NEIKEv2Packet hasNotification:](obja, (const char *)0x4017))
          {
            uint64_t Error = NEIKEv2CreateError(5LL);
LABEL_145:
            ErrorPeerInvalidSyntax = (__CFString *)Error;
LABEL_146:
            uint64_t v68 = 0LL;
            goto LABEL_169;
          }
        }

        id v422 = 0LL;
LABEL_108:
        v47[17] = 1;
        id v134 = objc_getProperty(v48, v64, 144LL, 1);
        v135 = v134;
        if (v134) {
          v136 = (void *)*((void *)v134 + 3);
        }
        else {
          v136 = 0LL;
        }
        id v144 = v136;
        if (*(void *)(v65 + 40))
        {
          if (*(void *)(v65 + 8))
          {
            id ErrorInternal = (id)NEIKEv2CreateErrorInternal( @"Failed to process extraneous peer message",  v137,  v138,  v139,  v140,  v141,  v142,  v143,  v409);
            goto LABEL_120;
          }

          uint64_t v152 = *(void **)(v65 + 24);
          *(void *)buf = 0LL;
          id v153 = v152;
          uint64_t v154 = [v153 processSecondPeerMessage:v144 error:buf];
          id v155 = *(id *)buf;
          uint64_t v156 = *(void **)(v65 + 8);
          *(void *)(v65 + 8) = v154;

          if (!*(void *)(v65 + 8))
          {
            id v48 = obja;
            id ErrorInternal = v155;
LABEL_120:

            v417 = ErrorInternal;
            if (ErrorInternal)
            {
              ne_log_obj();
              v347 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
              {
                v394 = (void *)[obja copyShortDescription];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v394;
                __int16 v444 = 2112;
                v445 = v417;
                _os_log_error_impl( &dword_1876B1000,  v347,  OS_LOG_TYPE_ERROR,  "%@ Failed to process GSPM message: %@",  buf,  0x16u);
              }

              uint64_t ErrorCrypto = NEIKEv2CreateErrorCrypto( @"Failed to process GSPM message",  v348,  v349,  v350,  v351,  v352,  v353,  v354,  v409);
              goto LABEL_256;
            }

            char v158 = v47[9];
            if ((v158 & 1) != 0)
            {
              id v159 = *(id *)(v65 + 16);

              char v158 = v47[9];
              id v422 = v159;
            }

            v160 = objc_alloc(&OBJC_CLASS___NEIKEv2IKEAuthPacket);
            if ((v158 & 1) != 0)
            {
              uint64_t v68 = -[NEIKEv2Packet initOutbound](v160);
              if (!v68)
              {
                ne_log_obj();
                v381 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v381, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl( &dword_1876B1000,  v381,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2IKEAuthPacket alloc] initOutbound] failed",  buf,  2u);
                }

                uint64_t v169 = @"[[NEIKEv2IKEAuthPacket alloc] initOutbound] failed";
                goto LABEL_255;
              }
            }

            else
            {
              uint64_t v68 = (os_log_s *)-[NEIKEv2Packet initResponse:]((uint64_t)v160, v48);
              if (!v68)
              {
                ne_log_obj();
                id v161 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v161, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl( &dword_1876B1000,  v161,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2IKEAuthPacket alloc] initResponse:] failed",  buf,  2u);
                }

                uint64_t v169 = @"[[NEIKEv2IKEAuthPacket alloc] initResponse:] failed";
LABEL_255:
                uint64_t ErrorCrypto = NEIKEv2CreateErrorInternal(v169, v162, v163, v164, v165, v166, v167, v168, v409);
LABEL_256:
                ErrorPeerInvalidSyntax = (__CFString *)ErrorCrypto;
                uint64_t v175 = 0LL;
                uint64_t v68 = 0LL;
                goto LABEL_134;
              }
            }

            uint64_t v170 = v422;
            if (v422)
            {
              v171 = objc_alloc_init(&OBJC_CLASS___NEIKEv2GSPMPayload);
              objc_setProperty_atomic(v68, v172, v171, 144LL);

              id v174 = objc_getProperty(v68, v173, 144LL, 1);
              -[NEIKEv2GSPMPayload setGspmData:]((uint64_t)v174, v422);

              ErrorPeerInvalidSyntax = 0LL;
              uint64_t v175 = 0LL;
LABEL_168:

              goto LABEL_169;
            }

            uint64_t v176 = objc_alloc_init(&OBJC_CLASS___NEIKEv2AuthPayload);
            objc_setProperty_atomic(v68, v177, v176, 128LL);

            id v178 = -[NEIKEv2AuthenticationProtocol initWithSecurePassword:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithSecurePassword:",  -1LL);
            objc_getProperty(v68, v179, 128LL, 1);
            v180 = (void *)objc_claimAutoreleasedReturnValue();
            -[NEIKEv2AuthPayload setAuthProtocol:]((uint64_t)v180, v178);

            id v181 = -[NEIKEv2IKESA createInitiatorGSPMAuthenticationDataUsingPrimeKey:]((os_log_s *)v47, 0LL);
            uint64_t v183 = objc_getProperty(v68, v182, 128LL, 1);
            -[NEIKEv2AuthPayload setAuthenticationData:](v183, v181);

            objc_getProperty(v68, v184, 128LL, 1);
            v185 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v183) = -[NEIKEv2Payload isValid]((uint64_t)v185);

            if ((v183 & 1) == 0)
            {
              ne_log_obj();
              uint64_t v187 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v187, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "+[NEIKEv2IKEAuthPacket(Exchange) createGSPMForIKESA:lastPacket:refusalError:]";
                _os_log_fault_impl( &dword_1876B1000,  v187,  OS_LOG_TYPE_FAULT,  "%s called with null responsePacket.auth.isValid",  buf,  0xCu);
              }

              goto LABEL_137;
            }

            if ((v47[24] & 1) == 0)
            {
              ErrorPeerInvalidSyntax = 0LL;
              uint64_t v175 = 0LL;
LABEL_134:
              id v48 = obja;
              uint64_t v170 = v422;
              goto LABEL_168;
            }

            id v223 = objc_getProperty(v47, v186, 88LL, 1);
            char v224 = [v223 ppkIDType];

            HIBYTE(v438) = v224;
            if (v224)
            {
              id v226 = objc_getProperty(v47, v225, 88LL, 1);
              [v226 ppkID];
              v227 = (void *)objc_claimAutoreleasedReturnValue();

              if (v224 != 2 || v227)
              {
                uint64_t v228 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FB8]),  "initWithCapacity:",  objc_msgSend(v227, "length") + 1);
                [v228 appendBytes:(char *)&v438 + 1 length:1];
                [v228 appendData:v227];
                v414 = v228;
                BOOL v229 = -[NEIKEv2Packet addNotification:data:](v68, 0x4034uLL, v228);
                uint64_t v170 = 0LL;
                if (v229)
                {
                  id v231 = objc_getProperty(v47, v230, 88LL, 1);
                  char v232 = [v231 ppkMandatory];

                  if ((v232 & 1) != 0)
                  {
LABEL_166:

                    ErrorPeerInvalidSyntax = 0LL;
                    uint64_t v175 = 0LL;
                    goto LABEL_167;
                  }

                  uint64_t v233 = -[NEIKEv2IKESA createInitiatorGSPMAuthenticationDataUsingPrimeKey:]( (os_log_s *)v47,  (const char *)1);
                  if (-[NEIKEv2Packet addNotification:data:](v68, 0x4035uLL, v233))
                  {

                    goto LABEL_166;
                  }

                  v384 = v227;
                  id v385 = v8;
                  ne_log_obj();
                  v395 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v395, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl( &dword_1876B1000,  v395,  OS_LOG_TYPE_FAULT,  "[responsePacket addNotification:NEIKEv2NotifyTypeNoPPKAuth] failed",  buf,  2u);
                  }

                  ErrorPeerInvalidSyntax = (__CFString *)NEIKEv2CreateErrorInternal( @"[responsePacket addNotification:NEIKEv2NotifyTypeNoPPKAuth] failed",  v396,  v397,  v398,  v399,  v400,  v401,  v402,  v409);
                }

                else
                {
                  v384 = v227;
                  id v385 = v8;
                  ne_log_obj();
                  v386 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v386, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl( &dword_1876B1000,  v386,  OS_LOG_TYPE_FAULT,  "[responsePacket addNotification:NEIKEv2NotifyTypePPKIdentity] failed",  buf,  2u);
                  }

                  ErrorPeerInvalidSyntax = (__CFString *)NEIKEv2CreateErrorInternal( @"[responsePacket addNotification:NEIKEv2NotifyTypePPKIdentity] failed",  v387,  v388,  v389,  v390,  v391,  v392,  v393,  v409);
                  uint64_t v233 = 0LL;
                }

                uint64_t v175 = v68;
                uint64_t v68 = 0LL;
                id v8 = v385;
                uint64_t v170 = 0LL;
                goto LABEL_167;
              }

              ne_log_obj();
              uint64_t v187 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v187, OS_LOG_TYPE_FAULT))
              {
LABEL_137:

                ErrorPeerInvalidSyntax = 0LL;
                uint64_t v170 = 0LL;
                uint64_t v175 = v68;
                uint64_t v68 = 0LL;
LABEL_167:
                id v48 = obja;
                goto LABEL_168;
              }

              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "+[NEIKEv2IKEAuthPacket(Exchange) createGSPMForIKESA:lastPacket:refusalError:]";
              v383 = "%s called with null ppkID";
            }

            else
            {
              ne_log_obj();
              uint64_t v187 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v187, OS_LOG_TYPE_FAULT)) {
                goto LABEL_137;
              }
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "+[NEIKEv2IKEAuthPacket(Exchange) createGSPMForIKESA:lastPacket:refusalError:]";
              v383 = "%s called with null ppkIDType";
            }

            _os_log_fault_impl(&dword_1876B1000, v187, OS_LOG_TYPE_FAULT, v383, buf, 0xCu);
            goto LABEL_137;
          }

          uint64_t v157 = *(void **)(v65 + 16);
          *(void *)(v65 + 16) = 0LL;

          id ErrorInternal = 0LL;
        }

        else
        {
          id v416 = v8;
          v146 = v7;
          v147 = *(void **)(v65 + 24);
          *(void *)buf = 0LL;
          id v148 = v147;
          [v148 processFirstPeerMessage:v144 error:buf];
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          id v150 = *(id *)buf;

          if (v149)
          {
            objc_storeStrong((id *)(v65 + 16), v149);
            objc_storeStrong((id *)(v65 + 40), v136);
            id ErrorInternal = 0LL;
          }

          else
          {
            id ErrorInternal = v150;
          }

          id v7 = v146;
          id v8 = v416;
        }

        id v48 = obja;
        goto LABEL_120;
      }

      uint64_t v65 = ne_log_obj();
      if (!os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_FAULT))
      {
LABEL_228:
        ErrorPeerInvalidSyntax = 0LL;
        goto LABEL_146;
      }

      *(_DWORD *)v446 = 136315138;
      v447 = "+[NEIKEv2IKEAuthPacket(Exchange) createGSPMForIKESA:lastPacket:refusalError:]";
      v325 = "%s called with null lastPacket";
    }

    else
    {
      uint64_t v65 = ne_log_obj();
      if (!os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_FAULT)) {
        goto LABEL_228;
      }
      *(_DWORD *)v446 = 136315138;
      v447 = "+[NEIKEv2IKEAuthPacket(Exchange) createGSPMForIKESA:lastPacket:refusalError:]";
      v325 = "%s called with null ikeSA";
    }

    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v65, OS_LOG_TYPE_FAULT, v325, v446, 0xCu);
    goto LABEL_228;
  }

  if (!v7 || (v7[9] & 1) == 0)
  {
    ne_log_obj();
    v281 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v281, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v446 = 138412290;
      v447 = (const char *)a1;
      _os_log_fault_impl( &dword_1876B1000,  v281,  OS_LOG_TYPE_FAULT,  "%@ EAP is not supported by responder (receive)",  v446,  0xCu);
    }

    id v282 = v8;
    id v283 = +[NEIKEv2IKEAuthPacket createIKEAuthResponse:refusalError:]( (uint64_t)&OBJC_CLASS___NEIKEv2IKEAuthPacket,  v8,  0x18uLL);
    if ((-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v283, 0LL) & 1) != 0)
    {
      v291 = (void *)NEIKEv2CreateErrorInternal( @"EAP is not supported by responder (receive)",  (uint64_t)v284,  v285,  v286,  v287,  v288,  v289,  v290,  v409);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, v291);

      -[NEIKEv2Session reportState](a1, v292);
    }

    else
    {
      id v314 = objc_getProperty(a1, v284, 336LL, 1);
      v322 = (void *)NEIKEv2CreateErrorFailedToSend( @"EAP unsupported refusal (receive)",  v315,  v316,  v317,  v318,  v319,  v320,  v321,  v409);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v314, 3uLL, v322);

      -[NEIKEv2Session reportState](a1, v323);
      -[NEIKEv2Session resetAll]((uint64_t)a1, v324);
    }

    goto LABEL_248;
  }

  id v21 = v7;
  id v22 = v8;
  uint64_t v23 = objc_opt_self();
  self = v22;
  if ((v7[9] & 1) == 0)
  {
    ne_log_obj();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      goto LABEL_213;
    }
    *(_DWORD *)v446 = 136315138;
    v447 = "+[NEIKEv2IKEAuthPacket(Exchange) createEAPForInitiatorIKESA:lastResponderPacket:]";
    v293 = "%s called with null ikeSA.isInitiator";
LABEL_258:
    _os_log_fault_impl(&dword_1876B1000, v33, OS_LOG_TYPE_FAULT, v293, v446, 0xCu);
    goto LABEL_213;
  }

  if (!v8)
  {
    ne_log_obj();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      goto LABEL_213;
    }
    *(_DWORD *)v446 = 136315138;
    v447 = "+[NEIKEv2IKEAuthPacket(Exchange) createEAPForInitiatorIKESA:lastResponderPacket:]";
    v293 = "%s called with null lastResponderPacket";
    goto LABEL_258;
  }

  uint64_t v412 = v23;
  v420 = v10;
  if (-[NEIKEv2Packet hasErrors](v22, v24))
  {
    uint64_t v26 = (uint64_t)v21;
    __int128 v441 = 0u;
    __int128 v442 = 0u;
    __int128 v439 = 0u;
    __int128 v440 = 0u;
    id obj = (NEIKEv2EAP *)objc_getProperty(v22, v25, 64LL, 1);
    uint64_t v27 = -[NEIKEv2EAP countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v439,  v446,  16LL);
    if (v27)
    {
      uint64_t v28 = v27;
      id v29 = 0LL;
      uint64_t v30 = *(void *)v440;
      v418 = a1;
      while (2)
      {
        for (uint64_t j = 0LL; j != v28; ++j)
        {
          if (*(void *)v440 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v439 + 1) + 8 * j);
          if (v32 && (unint64_t)(*(void *)(v32 + 24) - 1LL) <= 0x3FFE)
          {
            id v33 = (os_log_s *)-[NEIKEv2NotifyPayload copyError](*(const __CFString **)(*((void *)&v439 + 1) + 8 * j));

            ne_log_obj();
            id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              uint64_t v44 = (void *)[self copyShortDescription];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v44;
              __int16 v444 = 2112;
              v445 = v33;
              _os_log_error_impl( &dword_1876B1000,  v34,  OS_LOG_TYPE_ERROR,  "%@ Initiator auth EAP received notify error: %@",  buf,  0x16u);
            }

            if ((*(void *)(v32 + 24) & 0xFFFFFFFFFFFFE000LL) != 0x2000 || (*(_BYTE *)(v26 + 18) & 1) != 0)
            {
LABEL_61:
              id v21 = (_BYTE *)v26;
              -[NEIKEv2IKESA setState:error:](v26, 3uLL, v33);
              uint64_t v68 = 0LL;
              a1 = v418;
              id v10 = v420;
              id v22 = self;
              goto LABEL_182;
            }

            uint64_t v36 = objc_getProperty(self, v35, 128LL, 1);
            uint64_t v38 = (void *)v36;
            if (v36 && (id v39 = *(id *)(v36 + 32)) != 0LL)
            {
            }

            else
            {
              id v40 = objc_getProperty(self, v37, 136LL, 1);
              id v42 = v40;
              if (v40) {
                id v40 = objc_getProperty(v40, v41, 24LL, 1);
              }
              id v43 = v40;

              if (!v43) {
                goto LABEL_61;
              }
            }

            id v29 = v33;
          }
        }

        uint64_t v28 = -[NEIKEv2EAP countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v439,  v446,  16LL);
        a1 = v418;
        if (v28) {
          continue;
        }
        break;
      }
    }

    else
    {
      id v29 = 0LL;
    }

    id v33 = v29;
    id v22 = self;
    id v21 = (_BYTE *)v26;
  }

  else
  {
    id v33 = 0LL;
  }

  id v70 = objc_getProperty(v22, v25, 136LL, 1);
  id v72 = v70;
  if (v70) {
    id v70 = objc_getProperty(v70, v71, 24LL, 1);
  }
  id v10 = v420;
  id v73 = v70;

  if (!v73)
  {
    ne_log_obj();
    uint64_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      id v198 = (void *)[self copyShortDescription];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v198;
      _os_log_error_impl(&dword_1876B1000, v89, OS_LOG_TYPE_ERROR, "%@ No EAP data received", buf, 0xCu);
    }

    id objb = (id)NEIKEv2CreateErrorAuthentication(@"No EAP data received", v90, v91, v92, v93, v94, v95, v96, v409);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v21, 3uLL, objb);
    uint64_t v68 = 0LL;
    id v22 = self;

    goto LABEL_183;
  }

  id v22 = self;
  id obj = (NEIKEv2EAP *)objc_getProperty(v21, v74, 448LL, 1);
  if (!obj)
  {
    if (-[NEIKEv2IKEAuthPacket validateAuthPart1AsInitiator:beforeEAP:]((uint64_t)self, v21, 1))
    {
      if (-[NEIKEv2Packet hasNotification:](self, (const char *)0x4017))
      {
        id objc = (id)NEIKEv2CreateError(5LL);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v21, 3uLL, objc);
        uint64_t v68 = 0LL;

        goto LABEL_183;
      }

      id obj = objc_alloc_init(&OBJC_CLASS___NEIKEv2EAP);
      objc_setProperty_atomic(v21, v151, obj, 448LL);
      v21[17] = 1;
      goto LABEL_70;
    }

void __72__NEIKEv2Session_Exchange__handleEAPAndGSPMForIKESA_authPacket_handler___block_invoke( uint64_t *a1,  void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NEIKEv2Session handleEAPAndGSPMForIKESA:authPacket:handler:](a1[4], a1[5], v3, a1[6]);
  }

  else
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = a1[4];
      uint64_t v19 = a1[7];
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v18;
      __int16 v22 = 2080;
      uint64_t v23 = v19;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive IKE Auth (%s) reply (connect)",  buf,  0x16u);
    }

    id Property = (id)a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v5, 336LL, 1);
    }
    id v7 = Property;
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive IKE Auth (%s) reply (connect)",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  a1[7]);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, ErrorPeerInvalidSyntax);

    -[NEIKEv2Session reportState]((void *)a1[4], v16);
    -[NEIKEv2Session resetAll](a1[4], v17);
  }
}

void __72__NEIKEv2Session_Exchange__handleEAPAndGSPMForIKESA_authPacket_handler___block_invoke_119( uint64_t *a1,  void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NEIKEv2Session handleEAPAndGSPMForIKESA:authPacket:handler:](a1[4], a1[5], v3, a1[6]);
  }

  else
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = a1[4];
      uint64_t v19 = a1[7];
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v18;
      __int16 v22 = 2080;
      uint64_t v23 = v19;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive IKE Auth (%s) reply (receive)",  buf,  0x16u);
    }

    id Property = (id)a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v5, 336LL, 1);
    }
    id v7 = Property;
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive IKE Auth (%s) reply (receive)",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  a1[7]);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, ErrorPeerInvalidSyntax);

    -[NEIKEv2Session reportState]((void *)a1[4], v16);
    -[NEIKEv2Session resetAll](a1[4], v17);
  }
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = v33;
      _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive IKE SA Init reply (connect)",  buf,  0xCu);
    }

    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v17, 336LL, 1);
    }
    id v19 = Property;
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive IKE SA Init reply (connect)",  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v34);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v19, 3uLL, ErrorPeerInvalidSyntax);

    -[NEIKEv2Session reportState](*(void **)(a1 + 32), v28);
    goto LABEL_17;
  }

  uint64_t v5 = -[NEIKEv2IKESAInitPacket validateSAInitAsInitiator:]((uint64_t)v3, *(void **)(a1 + 40));
  if ((v5 & 1) != 0 || (SEL v6 = *(void **)(a1 + 40)) == 0LL || v6[6] != 3LL)
  {
LABEL_19:
    uint64_t v30 = *(void **)(a1 + 32);
    id v29 = *(void **)(a1 + 40);
    v35[0] = MEMORY[0x1895F87A8];
    v35[1] = 3221225472LL;
    v35[2] = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_136;
    v35[3] = &unk_18A08D050;
    v35[4] = v30;
    id v31 = v29;
    uint64_t v32 = *(void *)(a1 + 48);
    id v36 = v31;
    uint64_t v37 = v32;
    -[NEIKEv2Session retryCookieForIKESA:validated:handler:](v30, v31, v5, v35);

    goto LABEL_20;
  }

  id v7 = objc_getProperty(v6, v4, 56LL, 1);
  [v7 domain];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v8 isEqual:@"NEIKEv2ErrorDomain"] & 1) == 0)
  {

    goto LABEL_19;
  }

  id v10 = *(id *)(a1 + 40);
  if (v10) {
    id v10 = objc_getProperty(v10, v9, 56LL, 1);
  }
  id v11 = v10;
  uint64_t v12 = [v11 code];

  if (v12 != 5) {
    goto LABEL_19;
  }
  ne_log_obj();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v39 = v14;
    _os_log_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ Received server redirect in IKE SA Init (connect)",  buf,  0xCu);
  }

  -[NEIKEv2Session reportServerRedirect:](*(void **)(a1 + 32), v3);
LABEL_17:
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v15);
LABEL_20:
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_136(void *a1, uint64_t a2)
{
  uint64_t v122 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)a1[4];
  id v4 = (void *)a1[5];
  v102[0] = MEMORY[0x1895F87A8];
  v102[1] = 3221225472LL;
  uint64_t v103 = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_2;
  uint64_t v104 = &unk_18A08D050;
  uint64_t v105 = v5;
  id v6 = v4;
  uint64_t v7 = a1[6];
  id v106 = v6;
  uint64_t v107 = v7;
  id v8 = v6;
  id v10 = v102;
  if (v5)
  {
    id v11 = (dispatch_queue_s *)objc_getProperty(v5, v9, 368LL, 1);
    dispatch_assert_queue_V2(v11);

    if ((a2 & 1) != 0
      || (!v8 ? (id v13 = 0LL) : (id v13 = objc_getProperty(v8, v12, 144LL, 1)),
          id v14 = v13,
          v14,
          !v14))
    {
      v103(v10, a2);
    }

    else
    {
      -[NEIKEv2Session resetMessages](v5, v15);
      if (v8) {
        objc_setProperty_atomic(v8, v16, 0LL, 160LL);
      }
      ne_log_obj();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        if (v8) {
          id Property = objc_getProperty(v8, v18, 144LL, 1);
        }
        else {
          id Property = 0LL;
        }
        id v20 = Property;
        uint64_t v21 = [v20 method];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(void *)&buf[14] = v21;
        _os_log_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_INFO,  "%@ Received KE method preference %tu, retrying IKE SA Init (connect retry KE)",  buf,  0x16u);
      }

      if (v8) {
        id v23 = objc_getProperty(v8, v22, 144LL, 1);
      }
      else {
        id v23 = 0LL;
      }
      id v24 = v23;
      uint64_t v26 = [v24 method];
      uint64_t v101 = v24;
      if (v8) {
        id v27 = objc_getProperty(v8, v25, 80LL, 1);
      }
      else {
        id v27 = 0LL;
      }
      id v100 = v27;
      [v100 proposals];
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      __int128 v112 = 0u;
      __int128 v113 = 0u;
      __int128 v114 = 0u;
      __int128 v115 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v112 objects:buf count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v113;
        uint64_t v98 = *(void *)v113;
        uint64_t v99 = v10;
        while (2)
        {
          for (uint64_t i = 0LL; i != v31; ++i)
          {
            if (*(void *)v113 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void **)(*((void *)&v112 + 1) + 8 * i);
            __int128 v108 = 0u;
            __int128 v109 = 0u;
            __int128 v110 = 0u;
            __int128 v111 = 0u;
            [v34 kemProtocols];
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v36 = [v35 countByEnumeratingWithState:&v108 objects:v116 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v109;
LABEL_23:
              uint64_t v39 = 0LL;
              while (1)
              {
                if (*(void *)v109 != v38) {
                  objc_enumerationMutation(v35);
                }
                if ([*(id *)(*((void *)&v108 + 1) + 8 * v39) method] == v26) {
                  break;
                }
                if (v37 == ++v39)
                {
                  uint64_t v37 = [v35 countByEnumeratingWithState:&v108 objects:v116 count:16];
                  if (v37) {
                    goto LABEL_23;
                  }
                  goto LABEL_29;
                }
              }

              if ((-[NEIKEv2IKESA generateInitialValues](v8, v56) & 1) != 0)
              {
                +[NEIKEv2IKESAInitPacket createIKESAInitForInitiatorIKESA:]( (uint64_t)&OBJC_CLASS___NEIKEv2IKESAInitPacket,  v8);
                id v57 = (void *)objc_claimAutoreleasedReturnValue();
                id v10 = v99;
                if (v57)
                {
                  *(void *)buf = MEMORY[0x1895F87A8];
                  *(void *)&uint8_t buf[8] = 3221225472LL;
                  *(void *)&uint8_t buf[16] = __62__NEIKEv2Session_Exchange__retryKEForIKESA_validated_handler___block_invoke;
                  __int16 v118 = &unk_18A08CF60;
                  SEL v119 = v5;
                  id v120 = v8;
                  id v121 = v99;
                  if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)v5, v57, buf) == -1)
                  {
                    id v59 = objc_getProperty(v5, v58, 336LL, 1);
                    ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"retry SA INIT KE",  v60,  v61,  v62,  v63,  v64,  v65,  v66,  v97);
                    -[NEIKEv2IKESA setState:error:]((uint64_t)v59, 3uLL, ErrorFailedToSend);

                    -[NEIKEv2Session reportState](v5, v68);
                    -[NEIKEv2Session resetAll]((uint64_t)v5, v69);
                  }
                }

                else
                {
                  ne_log_obj();
                  uint64_t v81 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v5;
                    _os_log_error_impl( &dword_1876B1000,  v81,  OS_LOG_TYPE_ERROR,  "%@ Failed to create IKE SA Init retry packet (connect retry KE)",  buf,  0xCu);
                  }

                  id v83 = objc_getProperty(v5, v82, 336LL, 1);
                  id ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create IKE SA Init retry packet (connect retry KE)",  v84,  v85,  v86,  v87,  v88,  v89,  v90,  v97);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v83, 3uLL, ErrorInternal);

                  -[NEIKEv2Session reportState](v5, v92);
                  -[NEIKEv2Session resetAll]((uint64_t)v5, v93);
                }

                goto LABEL_49;
              }

              ne_log_obj();
              id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              id v10 = v99;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v5;
                _os_log_error_impl( &dword_1876B1000,  v70,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate local crypto values (connect retry KE)",  buf,  0xCu);
              }

              id v44 = objc_getProperty(v5, v71, 336LL, 1);
              id ErrorCrypto = (id)NEIKEv2CreateErrorCrypto( @"Failed to generate local crypto values (connect retry KE)",  v72,  v73,  v74,  v75,  v76,  v77,  v78,  v97);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v44, 3uLL, ErrorCrypto);
              goto LABEL_44;
            }

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v5 = (void *)a1[4];
  id v4 = (void *)a1[5];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_3;
  v8[3] = &unk_18A08D050;
  v8[4] = v5;
  id v6 = v4;
  uint64_t v7 = a1[6];
  id v9 = v6;
  uint64_t v10 = v7;
  -[NEIKEv2Session retryCookieForIKESA:validated:handler:](v5, v6, a2, v8);
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_3(uint64_t *a1, const char *a2)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  if ((a2 & 1) == 0)
  {
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = a1[4];
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = v44;
      _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "%@ Failed to process IKE SA Init packet (connect)",  buf,  0xCu);
    }

    id Property = (id)a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v10, 336LL, 1);
    }
    id v19 = Property;
    id v20 = @"Failed to process IKE SA Init packet (connect)";
    goto LABEL_12;
  }

  id v3 = (void *)a1[5];
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, 0LL, 280LL);
    uint64_t v5 = a1[5];
    uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40LL);
    if (v5)
    {
      char v7 = *(_BYTE *)(v5 + 23);
      if (v6)
      {
        if ((v7 & 1) != 0)
        {
          -[NEIKEv2Session removeFirstChild](a1[4], v4);
          uint64_t v25 = *(void *)(a1[6] + 8);
          uint64_t v26 = *(void **)(v25 + 40);
          *(void *)(v25 + 40) = 0LL;

          goto LABEL_20;
        }

        goto LABEL_6;
      }

      if ((v7 & 1) != 0) {
        goto LABEL_20;
      }
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40LL);
  }

  if (!v6)
  {
LABEL_14:
    ne_log_obj();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v46 = a1[4];
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = v46;
      _os_log_error_impl( &dword_1876B1000,  v22,  OS_LOG_TYPE_ERROR,  "%@ Failed to negotiate Childless SA (connect)",  buf,  0xCu);
    }

    id v24 = (id)a1[4];
    if (v24) {
      id v24 = objc_getProperty(v24, v23, 336LL, 1);
    }
    id v19 = v24;
    id v20 = @"Failed to negotiate Childless SA (connect)";
LABEL_12:
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v20, v12, v13, v14, v15, v16, v17, v18, v47);
    goto LABEL_27;
  }

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_143(uint64_t a1, const char *a2)
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  id v3 = *(_BYTE **)(a1 + 32);
  if (!v3 || (v3[24] & 1) == 0) {
    goto LABEL_5;
  }
  -[NEIKEv2IKESA ppk](*(id *)(a1 + 32), a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = -[NEIKEv2IKESA generateDerivativesFromPPK:]((uint64_t)v3, v4);

  if (v5)
  {
    id v3 = *(_BYTE **)(a1 + 32);
LABEL_5:
    char v7 = +[NEIKEv2IKEAuthPacket createIKEAuthForInitiatorIKESA:childSA:]( (uint64_t)&OBJC_CLASS___NEIKEv2IKEAuthPacket,  v3,  *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
    if (v7)
    {
      id Property = *(id *)(a1 + 40);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 336LL, 1);
      }
      id v9 = Property;
      -[NEIKEv2IKESA authenticationProtocol](v9, v10);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = [v11 isSecurePassword];

      if (v12)
      {
        id v14 = *(id *)(a1 + 40);
        if (v14) {
          id v14 = objc_getProperty(v14, v13, 336LL, 1);
        }
        id v15 = v14;
        -[NEIKEv2IKESA authenticationProtocol](v15, v16);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v47 = objc_getProperty(v7, v13, 128LL, 1);
        id v15 = (id)v47;
        if (v47) {
          uint64_t v48 = *(void **)(v47 + 24);
        }
        else {
          uint64_t v48 = 0LL;
        }
        id v17 = v48;
      }

      id v49 = v17;
      id v50 = *(id *)(a1 + 40);
      if (v50) {
        id v50 = objc_getProperty(v50, v18, 336LL, 1);
      }
      id v51 = v50;
      -[NEIKEv2IKESA setLocalAuthProtocolUsed:]((uint64_t)v51, v49);

      v71[0] = MEMORY[0x1895F87A8];
      v71[1] = 3221225472LL;
      v71[2] = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_148;
      v71[3] = &unk_18A08D000;
      uint64_t v52 = *(void **)(a1 + 32);
      uint64_t v72 = *(void *)(a1 + 40);
      id v53 = v52;
      uint64_t v54 = *(void *)(a1 + 48);
      id v73 = v53;
      uint64_t v74 = v54;
      if (-[NEIKEv2Session sendRequest:retry:replyHandler:](v72, v7, v71) == -1)
      {
        id v56 = *(id *)(a1 + 40);
        if (v56) {
          id v56 = objc_getProperty(v56, v55, 336LL, 1);
        }
        id v57 = v56;
        ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"initiator AUTH",  v58,  v59,  v60,  v61,  v62,  v63,  v64,  v70);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v57, 3uLL, ErrorFailedToSend);

        -[NEIKEv2Session reportState](*(void **)(a1 + 40), v66);
        -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v67);
      }
    }

    else
    {
      ne_log_obj();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v68 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v76 = v68;
        _os_log_error_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_ERROR,  "%@ Failed to create IKE Auth packet (connect)",  buf,  0xCu);
      }

      id v21 = *(id *)(a1 + 40);
      if (v21) {
        id v21 = objc_getProperty(v21, v20, 336LL, 1);
      }
      id v22 = v21;
      id ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create IKE Auth packet (connect)",  v23,  v24,  v25,  v26,  v27,  v28,  v29,  v70);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v22, 3uLL, ErrorInternal);

      -[NEIKEv2Session reportState](*(void **)(a1 + 40), v31);
      -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v32);
    }

    return;
  }

  ne_log_obj();
  id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    uint64_t v69 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v76 = v69;
    _os_log_error_impl( &dword_1876B1000,  v33,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate PPK-derived keys (connect)",  buf,  0xCu);
  }

  id v35 = *(id *)(a1 + 40);
  if (v35) {
    id v35 = objc_getProperty(v35, v34, 336LL, 1);
  }
  id v36 = v35;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto( @"Failed to generate PPK-derived keys (connect)",  v37,  v38,  v39,  v40,  v41,  v42,  v43,  v70);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v36, 3uLL, ErrorCrypto);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v45);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v46);
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;
    id v5 = *(id *)(a1 + 40);
    char v7 = v5;
    id v8 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
    if (v4)
    {
      if (v5)
      {
        id v10 = objc_getProperty(v4, v9, 136LL, 1);

        if (v10) {
          goto LABEL_6;
        }
        if (-[NEIKEv2Packet hasErrors](v4, v11))
        {
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          id v44 = objc_getProperty(v4, v37, 64LL, 1);
          uint64_t v45 = [v44 countByEnumeratingWithState:&v75 objects:buf count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v76;
            while (2)
            {
              for (uint64_t i = 0LL; i != v46; ++i)
              {
                if (*(void *)v76 != v47) {
                  objc_enumerationMutation(v44);
                }
                id v49 = *(const __CFString **)(*((void *)&v75 + 1) + 8 * i);
                if (v49 && (unint64_t)(v49->length - 1) <= 0x3FFE)
                {
                  id v36 = (__CFString *)-[NEIKEv2NotifyPayload copyError](v49);
                  ne_log_obj();
                  id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v61 = (char *)[v4 copyShortDescription];
                    *(_DWORD *)id v79 = 138412546;
                    uint64_t v80 = v61;
                    __int16 v81 = 2112;
                    SEL v82 = v36;
                    _os_log_error_impl( &dword_1876B1000,  v56,  OS_LOG_TYPE_ERROR,  "%@ EAP only authentication, received notify error %@",  v79,  0x16u);
                  }

                  id v8 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
                  goto LABEL_41;
                }
              }

              uint64_t v46 = [v44 countByEnumeratingWithState:&v75 objects:buf count:16];
              if (v46) {
                continue;
              }
              break;
            }
          }

          id v8 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
          goto LABEL_6;
        }

        uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorPeerInvalidSyntax( @"EAP only mode, IKE Auth packet does not contain EAP (connect)",  (uint64_t)v37,  v38,  v39,  v40,  v41,  v42,  v43,  v70[0]);
      }

      else
      {
        ne_log_obj();
        uint64_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)id v79 = 136315138;
          uint64_t v80 = "-[NEIKEv2IKEAuthPacket(Exchange) validateEAPOnlyAuthentication:]";
          _os_log_fault_impl(&dword_1876B1000, v62, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", v79, 0xCu);
        }

        uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorInternal( @"IKE SA is nil",  v63,  v64,  v65,  v66,  v67,  v68,  v69,  v70[0]);
      }

      id v36 = (__CFString *)ErrorPeerInvalidSyntax;
LABEL_41:

      if (v36)
      {
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v12, 336LL, 1);
        }
        id v58 = Property;
        -[NEIKEv2IKESA setState:error:]((uint64_t)v58, 3uLL, v36);

        -[NEIKEv2Session reportState](*(void **)(a1 + 32), v59);
        -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v60);
        goto LABEL_20;
      }

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_151(uint64_t *a1, void *a2)
{
  uint64_t v458 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = (_BYTE *)a1[4];
  if (v4)
  {
    v4[17] = 0;
    id v4 = (_BYTE *)a1[4];
  }

  id v5 = *(void **)(*(void *)(a1[7] + 8) + 40LL);
  uint64_t v6 = v4;
  id v7 = v5;
  id v9 = v7;
  if (!v3) {
    goto LABEL_34;
  }
  if (!v6)
  {
    ne_log_obj();
    v328 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v328, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v422 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthPart2AsInitiator:childSA:]";
      v329 = "%s called with null ikeSA";
LABEL_297:
      _os_log_fault_impl(&dword_1876B1000, v328, OS_LOG_TYPE_FAULT, v329, buf, 0xCu);
    }

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_153(uint64_t a1)
{
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_154(uint64_t a1, const char *a2)
{
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_157(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto( @"Failed to generate Child SA crypto values (connect)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_160(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  id ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to install Child SA (connect)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

- (uint64_t)setupReceivedChildCopyError
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v3 = (dispatch_queue_s *)objc_getProperty(a1, a2, 368LL, 1);
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = -[NEIKEv2Session firstChildSA](a1, v4);
  uint64_t v7 = (void *)v5;
  if (!v5)
  {
    uint64_t v23 = objc_getProperty(a1, v6, 336LL, 1);
    if (v23)
    {
      char v24 = v23[23];

      if ((v24 & 1) != 0)
      {
        -[NEIKEv2Session reportState](a1, v25);
        uint64_t ErrorInternal = 0LL;
        goto LABEL_14;
      }
    }

    ne_log_obj();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v28 = 138412290;
      *(void *)&v28[4] = a1;
      _os_log_error_impl(&dword_1876B1000, v26, OS_LOG_TYPE_ERROR, "%@ Failed to get childSA receiver", v28, 0xCu);
    }

    uint64_t v22 = @"Failed to get childSA receiver";
    goto LABEL_12;
  }

  *(_BYTE *)(v5 + 9) = 0;
  -[NEIKEv2ChildSA setState:error:](v5, 1uLL, 0LL);
  -[NEIKEv2Session reportState](a1, v8);
  id v10 = objc_getProperty(v7, v9, 48LL, 1);
  [v10 proposals];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  char v12 = -[NEIKEv2Session generateSPIForChild:proposals:](a1, v7, v11);

  uint64_t ErrorInternal = 0LL;
  if ((v12 & 1) == 0)
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v28 = 138412290;
      *(void *)&v28[4] = a1;
      _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate Child SA SPI (receive)",  v28,  0xCu);
    }

    uint64_t v22 = @"Failed to generate Child SA SPI (receive)";
LABEL_12:
    uint64_t ErrorInternal = NEIKEv2CreateErrorInternal(v22, v15, v16, v17, v18, v19, v20, v21, *(uint64_t *)v28);
  }

void __58__NEIKEv2Session_Exchange__setupReceivedChildWithHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  const void *a4)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v9 = a3;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v8, 368LL, 1);
  }
  uint64_t v11 = (dispatch_queue_s *)Property;
  dispatch_assert_queue_V2(v11);

  uint64_t v13 = *(void *)(a1 + 32);
  if (!v13 || !*(_BYTE *)(v13 + 13))
  {
    ne_log_obj();
    uint64_t ErrorInternal = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(ErrorInternal, OS_LOG_TYPE_FAULT))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      *(_DWORD *)id v51 = 138412290;
      *(void *)&v51[4] = v29;
      _os_log_fault_impl( &dword_1876B1000,  ErrorInternal,  OS_LOG_TYPE_FAULT,  "%@ already received config block",  v51,  0xCu);
    }

    goto LABEL_35;
  }

  *(_BYTE *)(v13 + 13) = 0;
  if (!v7)
  {
    ne_log_obj();
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = *(void *)(a1 + 32);
      *(_DWORD *)id v51 = 138412290;
      *(void *)&v51[4] = v35;
      _os_log_error_impl( &dword_1876B1000,  v30,  OS_LOG_TYPE_ERROR,  "%@ Listener rejected this IKEv2 inbound connection by sending back nil sessionConfig",  v51,  0xCu);
    }

    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v27 = @"Listener rejected this IKEv2 inbound connection by sending back nil sessionConfig";
    goto LABEL_34;
  }

  uint64_t v14 = *(void **)(a1 + 32);
  if (v14)
  {
    uint64_t v15 = objc_getProperty(v14, v12, 336LL, 1);
    if (v15)
    {
      char v16 = v15[23] & 1;
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  char v16 = 0;
LABEL_9:

  if (!v9 && (v16 & 1) == 0)
  {
    ne_log_obj();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = *(void *)(a1 + 32);
      *(_DWORD *)id v51 = 138412290;
      *(void *)&v51[4] = v36;
      _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "%@ Listener rejected this IKEv2 inbound connection by sending back nil childConfig",  v51,  0xCu);
    }

    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v27 = @"Listener rejected this IKEv2 inbound connection by sending back nil childConfig";
LABEL_34:
    uint64_t ErrorInternal = (os_log_s *)NEIKEv2CreateErrorInternal(v27, v19, v20, v21, v22, v23, v24, v25, *(uint64_t *)v51);
    (*(void (**)(uint64_t, os_log_s *))(v26 + 16))(v26, ErrorInternal);
    goto LABEL_35;
  }

  uint64_t v31 = *(void **)(a1 + 32);
  if (v31)
  {
    uint64_t v32 = objc_getProperty(v31, v17, 336LL, 1);
    if (v32)
    {
      char v33 = v32[23];

      if (v9)
      {
        if ((v33 & 1) != 0)
        {
          ne_log_obj();
          uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          {
            uint64_t v37 = *(void *)(a1 + 32);
            *(_DWORD *)id v51 = 138412290;
            *(void *)&v51[4] = v37;
            _os_log_fault_impl( &dword_1876B1000,  v34,  OS_LOG_TYPE_FAULT,  "%@ Listener sent back non-nil childConfig for childless SA connection",  v51,  0xCu);
          }

          uint64_t v26 = *(void *)(a1 + 40);
          uint64_t v27 = @"Listener sent back non-nil childConfig for childless SA connection";
          goto LABEL_34;
        }
      }
    }
  }

  if (a4)
  {
    uint64_t v38 = *(void *)(a1 + 32);
    if (v38 && *(void *)(v38 + 328))
    {
      ne_log_obj();
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v51 = 0;
        _os_log_fault_impl( &dword_1876B1000,  v39,  OS_LOG_TYPE_FAULT,  "Tried to set ipsecInterface when already set",  v51,  2u);
      }

      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = @"Tried to set ipsecInterface when already set";
      goto LABEL_34;
    }

    CFTypeRef v40 = CFRetain(a4);
    uint64_t v41 = *(void *)(a1 + 32);
    if (v41) {
      *(void *)(v41 + 328) = v40;
    }
  }

  ne_log_large_obj();
  SEL v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    uint64_t v43 = *(void *)(a1 + 32);
    *(_DWORD *)id v51 = 138412802;
    *(void *)&v51[4] = v43;
    __int16 v52 = 2112;
    id v53 = v7;
    __int16 v54 = 2112;
    id v55 = v9;
    _os_log_impl( &dword_1876B1000,  v42,  OS_LOG_TYPE_INFO,  "%@ Received responseSessionConfig %@ responseChildConfig %@",  v51,  0x20u);
  }

  uint64_t v45 = *(void **)(a1 + 32);
  if (v45)
  {
    id v46 = objc_getProperty(v45, v44, 336LL, 1);
    uint64_t v48 = v46;
    if (v46) {
      objc_setProperty_atomic(v46, v47, v7, 88LL);
    }
  }

  else
  {
    uint64_t v48 = 0LL;
  }

  if (v9) {
    -[NEIKEv2Session addFirstChild:](*(void **)(a1 + 32), v9);
  }
  uint64_t v50 = *(void *)(a1 + 40);
  uint64_t ErrorInternal = (os_log_s *)-[NEIKEv2Session setupReceivedChildCopyError](*(void **)(a1 + 32), v49);
  (*(void (**)(uint64_t, os_log_s *))(v50 + 16))(v50, ErrorInternal);
LABEL_35:
}

- (void)receiveConnection:(void *)a1
{
  v285[1] = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_getProperty(a1, v3, 368LL, 1);
    dispatch_assert_queue_V2(v5);

    id v7 = objc_getProperty(a1, v6, 336LL, 1);
    id v9 = v7;
    if (!v7)
    {
      ne_log_obj();
      uint64_t v254 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v254, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v282 = "-[NEIKEv2Session(Exchange) receiveConnection:]";
        _os_log_fault_impl(&dword_1876B1000, v254, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
      }

      goto LABEL_77;
    }

    if (v4 && (int v10 = v4[6]) != 0)
    {
      ne_log_obj();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_72;
      }
      *(_DWORD *)buf = 138412546;
      id v282 = (const char *)a1;
      __int16 v283 = 1024;
      int v284 = v10;
      id v200 = "%@ Dropping IKE SA Init with wrong message ID %d";
      id v201 = v14;
      uint32_t v202 = 18;
    }

    else
    {
      id v11 = objc_getProperty(v7, v8, 80LL, 1);
      char v12 = [v11 serverMode];

      ne_log_obj();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = v13;
      if ((v12 & 1) != 0)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v282 = (const char *)a1;
          _os_log_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ Starting IKEv2 responder from SA_INIT",  buf,  0xCu);
        }

        v9[9] = 0;
        char v16 = (void *)-[NEIKEv2Packet copyUnifiedData](v4, v15);
        objc_setProperty_atomic(v9, v17, v16, 320LL);

        -[NEIKEv2IKESA setState:error:]((uint64_t)v9, 1uLL, 0LL);
        -[NEIKEv2Session reportState](a1, v18);
        id v20 = objc_getProperty(v9, v19, 304LL, 1);

        if (!v20)
        {
          [a1 ikeInterfaceName];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic(v9, v22, v21, 304LL);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          ne_log_obj();
          SEL v145 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v282 = (const char *)a1;
            _os_log_error_impl( &dword_1876B1000,  v145,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive IKE SA Init packet (receive)",  buf,  0xCu);
          }

          id v147 = objc_getProperty(a1, v146, 336LL, 1);
          uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive IKE SA Init packet (receive)",  v148,  v149,  v150,  v151,  v152,  v153,  v154,  v258);
LABEL_76:
          id v156 = ErrorPeerInvalidSyntax;
          -[NEIKEv2IKESA setState:error:]((uint64_t)v147, 3uLL, ErrorPeerInvalidSyntax);

          -[NEIKEv2Session reportState](a1, v157);
          -[NEIKEv2Session resetAll]((uint64_t)a1, v158);
          goto LABEL_77;
        }

        unint64_t v269 = 7LL;
        if ((-[NEIKEv2IKESAInitPacket validateSAInitAsResponder:errorCodeToSend:](v4, v9, &v269) & 1) != 0)
        {
          if ((-[NEIKEv2IKESA generateInitialValues](v9, v23) & 1) != 0)
          {
            uint64_t v24 = v4;
            uint64_t v25 = v9;
            objc_opt_self();
            id v27 = objc_getProperty(v25, v26, 96LL, 1);

            if (!v27)
            {
              ne_log_obj();
              uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                id v282 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitResponse:ikeSA:]";
                _os_log_fault_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_FAULT,  "%s called with null ikeSA.chosenProposal",  buf,  0xCu);
              }

              id v144 = 0LL;
LABEL_120:

              if (v144)
              {
                char v229 = -[NEIKEv2IKESA generateAllValuesForSAInit](v25, v228);
                ne_log_obj();
                uint64_t v230 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                id v231 = v230;
                if ((v229 & 1) != 0)
                {
                  if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v282 = (const char *)a1;
                    _os_log_impl(&dword_1876B1000, v231, OS_LOG_TYPE_DEFAULT, "%@ Sending SA_INIT reply", buf, 0xCu);
                  }

                  v266[0] = MEMORY[0x1895F87A8];
                  v266[1] = 3221225472LL;
                  v266[2] = __46__NEIKEv2Session_Exchange__receiveConnection___block_invoke;
                  v266[3] = &unk_18A08D0F0;
                  uint64_t v267 = v25;
                  uint64_t v268 = a1;
                  -[NEIKEv2Session handleIKEIntermediateForResponderIKESA:iteration:replyPacket:replyPacketDescription:handler:]( a1,  v267,  0LL,  v144,  @"responder SA INIT",  v266);

                  goto LABEL_132;
                }

                if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v282 = (const char *)a1;
                  _os_log_error_impl( &dword_1876B1000,  v231,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate crypto values (receive)",  buf,  0xCu);
                }

                id v234 = objc_getProperty(a1, v243, 336LL, 1);
                id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto( @"Failed to generate crypto values (receive)",  v244,  v245,  v246,  v247,  v248,  v249,  v250,  v258);
              }

              else
              {
                ne_log_obj();
                char v232 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v232, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v282 = (const char *)a1;
                  _os_log_error_impl( &dword_1876B1000,  v232,  OS_LOG_TYPE_ERROR,  "%@ Failed to create IKE SA Init packet (receive)",  buf,  0xCu);
                }

                id v234 = objc_getProperty(a1, v233, 336LL, 1);
                id ErrorCrypto = (void *)NEIKEv2CreateErrorInternal( @"Failed to create IKE SA Init packet (receive)",  v235,  v236,  v237,  v238,  v239,  v240,  v241,  v258);
              }

              uint64_t v251 = ErrorCrypto;
              -[NEIKEv2IKESA setState:error:]((uint64_t)v234, 3uLL, ErrorCrypto);

              -[NEIKEv2Session reportState](a1, v252);
              -[NEIKEv2Session resetAll]((uint64_t)a1, v253);
LABEL_132:

              goto LABEL_77;
            }

            uint64_t v28 = (os_log_s *)-[NEIKEv2Packet initResponse:]( (uint64_t)objc_alloc(&OBJC_CLASS___NEIKEv2IKESAInitPacket),  v24);
            if (!v28)
            {
              ne_log_obj();
              uint64_t v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl( &dword_1876B1000,  v80,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2IKESAInitPacket alloc] initResponse:] failed",  buf,  2u);
              }

              id v144 = 0LL;
              goto LABEL_119;
            }

            uint64_t v264 = v24;
            uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NEIKEv2IKESAPayload);
            objc_setProperty_atomic(v28, v30, v29, 96LL);

            self = v25;
            id v32 = objc_getProperty(v25, v31, 96LL, 1);
            v285[0] = v32;
            [MEMORY[0x189603F18] arrayWithObjects:v285 count:1];
            char v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_getProperty(v28, v34, 96LL, 1);
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v37 = v35;
            if (v35) {
              objc_setProperty_atomic(v35, v36, v33, 24LL);
            }

            objc_getProperty(v28, v38, 96LL, 1);
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
            char v40 = -[NEIKEv2Payload isValid]((uint64_t)v39);

            if ((v40 & 1) != 0)
            {
              uint64_t v41 = objc_alloc_init(&OBJC_CLASS___NEIKEv2KeyExchangePayload);
              objc_setProperty_atomic(v28, v42, v41, 104LL);

              id v44 = objc_getProperty(self, v43, 96LL, 1);
              -[NEIKEv2IKESAProposal kemProtocol](v44, v45);
              id v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_getProperty(v28, v47, 104LL, 1);
              uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v50 = v48;
              if (v48) {
                objc_setProperty_atomic(v48, v49, v46, 24LL);
              }

              id v52 = objc_getProperty(self, v51, 160LL, 1);
              id v53 = v52;
              if (v52) {
                __int16 v54 = (void *)*((void *)v52 + 2);
              }
              else {
                __int16 v54 = 0LL;
              }
              id v55 = v54;
              objc_getProperty(v28, v56, 104LL, 1);
              uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v59 = v57;
              if (v57) {
                objc_setProperty_atomic(v57, v58, v55, 32LL);
              }

              objc_getProperty(v28, v60, 104LL, 1);
              uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
              char v62 = -[NEIKEv2Payload isValid]((uint64_t)v61);

              if ((v62 & 1) != 0)
              {
                id v63 = objc_alloc_init(&OBJC_CLASS___NEIKEv2NoncePayload);
                objc_setProperty_atomic(v28, v64, v63, 112LL);

                uint64_t v25 = self;
                id v66 = objc_getProperty(self, v65, 128LL, 1);
                objc_getProperty(v28, v67, 112LL, 1);
                id v68 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v70 = v68;
                if (v68) {
                  objc_setProperty_atomic(v68, v69, v66, 24LL);
                }

                objc_getProperty(v28, v71, 112LL, 1);
                id v72 = (void *)objc_claimAutoreleasedReturnValue();
                char v73 = -[NEIKEv2Payload isValid]((uint64_t)v72);

                if ((v73 & 1) != 0)
                {
                  -[NEIKEv2IKESA initiatorSPI](self, v74);
                  uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NEIKEv2IKESA responderSPI](self, v76);
                  __int128 v77 = (void *)objc_claimAutoreleasedReturnValue();
                  id v79 = objc_getProperty(self, v78, 64LL, 1);
                  uint64_t v80 = (os_log_s *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v75,  v77,  v79);

                  if (!-[NEIKEv2Packet addNotification:data:](v28, 0x4004uLL, v80))
                  {
                    ne_log_obj();
                    uint64_t v87 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl( &dword_1876B1000,  v87,  OS_LOG_TYPE_FAULT,  "[packet addNotification:NEIKEv2NotifyTypeNATDetectionSourceIP] failed",  buf,  2u);
                    }

                    id v144 = 0LL;
                    uint64_t v25 = self;
                    goto LABEL_160;
                  }

                  v260 = v80;
                  -[NEIKEv2IKESA initiatorSPI](self, v81);
                  SEL v82 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NEIKEv2IKESA responderSPI](self, v83);
                  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
                  id v86 = objc_getProperty(self, v85, 72LL, 1);
                  uint64_t v87 = (os_log_s *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v82,  v84,  v86);

                  if (!-[NEIKEv2Packet addNotification:data:](v28, 0x4005uLL, v87))
                  {
                    ne_log_obj();
                    log = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl( &dword_1876B1000,  log,  OS_LOG_TYPE_FAULT,  "[packet addNotification:NEIKEv2NotifyTypeNATDetectionDestinationIP] failed",  buf,  2u);
                    }

                    id v144 = 0LL;
                    goto LABEL_157;
                  }

                  if (!-[NEIKEv2Packet addNotification:data:](v28, 0x402EuLL, 0LL))
                  {
                    ne_log_obj();
                    log = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    uint64_t v25 = self;
                    if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl( &dword_1876B1000,  log,  OS_LOG_TYPE_FAULT,  "[packet addNotification:NEIKEv2NotifyTypeIKEv2FragmentationSupported] failed",  buf,  2u);
                    }

                    id v144 = 0LL;
                    goto LABEL_158;
                  }

                  id v89 = objc_getProperty(self, v88, 80LL, 1);
                  [v89 extraSupportedSignatureHashes];
                  uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NEIKEv2IKESA remoteAuthentication](self, v91);
                  id v92 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v93 = (os_log_s *)+[NEIKEv2Crypto copySignHashDataForSet:authentication:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v90,  v92);

                  log = v93;
                  if (v93 && !-[NEIKEv2Packet addNotification:data:](v28, 0x402FuLL, v93))
                  {
                    ne_log_obj();
                    uint64_t v255 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v255, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_156;
                    }
                    *(_WORD *)buf = 0;
                    v256 = "[packet addNotification:NEIKEv2NotifyTypeSignatureHashAlgorithms] failed";
                  }

                  else
                  {
                    id v95 = objc_getProperty(self, v94, 80LL, 1);
                    int v96 = [v95 requestChildlessSA];

                    if (!v96 || -[NEIKEv2Packet addNotification:data:](v28, 0x4022uLL, 0LL))
                    {
                      if (((_BYTE)self[3] & 1) == 0 || -[NEIKEv2Packet addNotification:data:](v28, 0x4033uLL, 0LL))
                      {
                        id Property = objc_getProperty(self, v97, 96LL, 1);
                        id v100 = Property;
                        if (Property) {
                          id Property = objc_getProperty(Property, v99, 120LL, 1);
                        }
                        id v101 = Property;

                        if (!v101 || -[NEIKEv2Packet addNotification:data:](v28, 0x4036uLL, 0LL))
                        {
                          v259 = v87;
                          uint64_t v102 = self;
                          id v103 = self[13];

                          if (v103)
                          {
                            id v105 = self[13];
                            unsigned int v106 = bswap32([v105 securePasswordMethod]) >> 16;

                            *(_WORD *)buf = v106;
                            uint64_t v107 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:buf length:2];
                            if (!-[NEIKEv2Packet addNotification:data:](v28, 0x4028uLL, v107))
                            {
                              ne_log_obj();
                              v257 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v257, OS_LOG_TYPE_FAULT))
                              {
                                *(_WORD *)uint64_t v279 = 0;
                                _os_log_fault_impl( &dword_1876B1000,  v257,  OS_LOG_TYPE_FAULT,  "[packet addNotification:NEIKEv2NotifyTypeSecurePasswordMethods] failed",  v279,  2u);
                              }

                              id v144 = 0LL;
                              goto LABEL_164;
                            }

                            uint64_t v102 = self;
                          }

                          __int128 v276 = 0u;
                          __int128 v277 = 0u;
                          __int128 v275 = 0u;
                          __int128 v274 = 0u;
                          id v108 = objc_getProperty(v102, v104, 80LL, 1);
                          [v108 customIKESAInitVendorPayloads];
                          __int128 v109 = (void *)objc_claimAutoreleasedReturnValue();

                          uint64_t v110 = [v109 countByEnumeratingWithState:&v274 objects:buf count:16];
                          if (v110)
                          {
                            uint64_t v111 = v110;
                            id v262 = *(id *)v275;
                            do
                            {
                              for (uint64_t i = 0LL; i != v111; ++i)
                              {
                                if (*(id *)v275 != v262) {
                                  objc_enumerationMutation(v109);
                                }
                                __int128 v113 = *(void **)(*((void *)&v274 + 1) + 8 * i);
                                __int128 v114 = objc_alloc_init(&OBJC_CLASS___NEIKEv2VendorIDPayload);
                                [v113 vendorData];
                                id v116 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v114) {
                                  objc_setProperty_atomic(v114, v115, v116, 24LL);
                                }

                                objc_getProperty(v28, v117, 120LL, 1);
                                id v118 = (void *)objc_claimAutoreleasedReturnValue();

                                if (v118)
                                {
                                  objc_getProperty(v28, v119, 120LL, 1);
                                  id v120 = (void *)objc_claimAutoreleasedReturnValue();
                                  [v120 arrayByAddingObject:v114];
                                  id v121 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_setProperty_atomic(v28, v122, v121, 120LL);
                                }

                                else
                                {
                                  uint64_t v280 = v114;
                                  [MEMORY[0x189603F18] arrayWithObjects:&v280 count:1];
                                  id v120 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_setProperty_atomic(v28, v123, v120, 120LL);
                                }
                              }

                              uint64_t v111 = [v109 countByEnumeratingWithState:&v274 objects:buf count:16];
                            }

                            while (v111);
                          }

                          __int128 v272 = 0u;
                          __int128 v273 = 0u;
                          __int128 v270 = 0u;
                          __int128 v271 = 0u;
                          id v125 = objc_getProperty(self, v124, 80LL, 1);
                          [v125 customIKESAInitPayloads];
                          id v126 = (void *)objc_claimAutoreleasedReturnValue();

                          id v263 = v126;
                          uint64_t v127 = [v126 countByEnumeratingWithState:&v270 objects:v279 count:16];
                          if (v127)
                          {
                            uint64_t v128 = v127;
                            uint64_t v129 = *(void *)v271;
                            do
                            {
                              uint64_t v130 = 0LL;
                              do
                              {
                                if (*(void *)v271 != v129) {
                                  objc_enumerationMutation(v263);
                                }
                                SEL v131 = *(void **)(*((void *)&v270 + 1) + 8 * v130);
                                id v132 = objc_alloc_init(&OBJC_CLASS___NEIKEv2CustomPayload);
                                uint64_t v133 = [v131 customType];
                                if (v132)
                                {
                                  v132->_customType = v133;
                                  [v131 customData];
                                  id v134 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_setProperty_atomic(v132, v135, v134, 32LL);
                                }

                                else
                                {
                                  [v131 customData];
                                  id v134 = (void *)objc_claimAutoreleasedReturnValue();
                                }

                                objc_getProperty(v28, v136, 56LL, 1);
                                id v137 = (void *)objc_claimAutoreleasedReturnValue();

                                if (v137)
                                {
                                  objc_getProperty(v28, v138, 56LL, 1);
                                  id v139 = (void *)objc_claimAutoreleasedReturnValue();
                                  [v139 arrayByAddingObject:v132];
                                  uint64_t v140 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_setProperty_atomic(v28, v141, v140, 56LL);
                                }

                                else
                                {
                                  uint64_t v278 = v132;
                                  [MEMORY[0x189603F18] arrayWithObjects:&v278 count:1];
                                  id v139 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_setProperty_atomic(v28, v142, v139, 56LL);
                                }

                                ++v130;
                              }

                              while (v128 != v130);
                              uint64_t v143 = [v263 countByEnumeratingWithState:&v270 objects:v279 count:16];
                              uint64_t v128 = v143;
                            }

                            while (v143);
                          }

                          id v144 = v28;
LABEL_164:
                          uint64_t v24 = v264;
                          uint64_t v25 = self;
                          uint64_t v87 = v259;
                          uint64_t v80 = v260;
                          goto LABEL_159;
                        }

                        ne_log_obj();
                        uint64_t v255 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v255, OS_LOG_TYPE_FAULT)) {
                          goto LABEL_156;
                        }
                        *(_WORD *)buf = 0;
                        v256 = "[packet addNotification:NEIKEv2NotifyTypeIntermediateExchangeSupported] failed";
                        goto LABEL_155;
                      }

                      ne_log_obj();
                      uint64_t v255 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v255, OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)buf = 0;
                        v256 = "[packet addNotification:NEIKEv2NotifyTypeUsePPK] failed";
                        goto LABEL_155;
                      }

void __46__NEIKEv2Session_Exchange__receiveConnection___block_invoke(uint64_t a1, void *a2)
{
  v248[12] = *(id *)MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v6 = (uint64_t)v4;
  if (!v3) {
    goto LABEL_96;
  }
  if (v4 && (v4[9] & 1) != 0)
  {
    ne_log_obj();
    uint64_t v218 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v218, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t v239 = 136315138;
      uint64_t v240 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthPart1AsResponderCopyErrorForIKESA:errorCodeToSend:]";
      _os_log_fault_impl( &dword_1876B1000,  v218,  OS_LOG_TYPE_FAULT,  "%s called with null !ikeSA.isInitiator",  v239,  0xCu);
    }

    uint64_t ErrorInternal = NEIKEv2CreateErrorInternal( @"validateAuthPart1AsResponder called as initiator",  v219,  v220,  v221,  v222,  v223,  v224,  v225,  v226);
    goto LABEL_136;
  }

  if (-[NEIKEv2Packet hasErrors](v3, v5))
  {
    __int128 v237 = 0u;
    __int128 v238 = 0u;
    *(_OWORD *)location = 0u;
    __int128 v236 = 0u;
    id v8 = objc_getProperty(v3, v7, 64LL, 1);
    uint64_t v9 = [v8 countByEnumeratingWithState:location objects:buf count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v236;
      while (2)
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v236 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = (const __CFString *)*((void *)location[1] + i);
          if (v13)
          {
            unint64_t length = v13->length;
            if (length - 1 <= 0x3FFE)
            {
              uint64_t ErrorPeerInvalidSyntax = (void *)-[NEIKEv2NotifyPayload copyError](v13);
              if (!ErrorPeerInvalidSyntax) {
                uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorInternal( @"Failed to copy notify error",  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v226);
              }
              ne_log_obj();
              char v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                uint64_t v206 = (char *)[v3 copyShortDescription];
                *(_DWORD *)uint64_t v239 = 138412546;
                uint64_t v240 = v206;
                __int16 v241 = 2112;
                id v242 = ErrorPeerInvalidSyntax;
                _os_log_error_impl( &dword_1876B1000,  v33,  OS_LOG_TYPE_ERROR,  "%@ Responder auth received notify error %@",  v239,  0x16u);
              }

              goto LABEL_102;
            }
          }
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:location objects:buf count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }

  objc_getProperty(v3, v7, 96LL, 1);
  id Property = (void *)objc_claimAutoreleasedReturnValue();
  SEL v17 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v16, 24LL, 1);
  }
  id v18 = Property;

  if (!v18)
  {
    ne_log_obj();
    SEL v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v207 = (char *)[v3 copyShortDescription];
      *(_DWORD *)uint64_t v239 = 138412290;
      uint64_t v240 = v207;
      _os_log_error_impl(&dword_1876B1000, v34, OS_LOG_TYPE_ERROR, "%@ Initiator ID missing", v239, 0xCu);
    }

    SEL v42 = @"Initiator ID missing";
    goto LABEL_100;
  }

  if (v6) {
    id v20 = objc_getProperty((id)v6, v19, 80LL, 1);
  }
  else {
    id v20 = 0LL;
  }
  id v21 = v20;
  if (([v21 requestChildlessSA] & 1) == 0)
  {

    goto LABEL_33;
  }

  objc_getProperty(v3, v22, 88LL, 1);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
LABEL_33:
    if (v6 && (*(_BYTE *)(v6 + 23) & 1) != 0) {
      goto LABEL_38;
    }
    goto LABEL_35;
  }

  if (v6)
  {
    *(_BYTE *)(v6 + 23) = 1;
    goto LABEL_38;
  }

void __46__NEIKEv2Session_Exchange__receiveConnection___block_invoke_209(void **a1, void *a2)
{
  uint64_t v279 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v5 = -[NEIKEv2Session firstChildSA](a1[4], v4);
  uint64_t v6 = (__CFString *)v5;
  if (v3) {
    goto LABEL_2;
  }
  if (v5)
  {
    ne_log_obj();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = (const char *)a1[4];
      *(_DWORD *)buf = 138412546;
      __int128 v274 = v25;
      __int16 v275 = 2112;
      __int128 v276 = v6;
      _os_log_impl(&dword_1876B1000, v24, OS_LOG_TYPE_DEFAULT, "%@ Set up Child SA %@", buf, 0x16u);
    }

    goto LABEL_22;
  }

  uint64_t v26 = a1[5];
  if (v26 && (v26[23] & 1) != 0) {
    goto LABEL_22;
  }
  ne_log_obj();
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    uint64_t v221 = (const char *)a1[4];
    *(_DWORD *)buf = 138412290;
    __int128 v274 = v221;
    _os_log_error_impl(&dword_1876B1000, v27, OS_LOG_TYPE_ERROR, "%@ Failed to set up Child SA", buf, 0xCu);
  }

  uint64_t ErrorInternal = NEIKEv2CreateErrorInternal( @"Failed to set up Child SA",  v28,  v29,  v30,  v31,  v32,  v33,  v34,  v243);
  if (!ErrorInternal)
  {
LABEL_22:
    uint64_t v36 = a1[6];
    uint64_t v37 = a1[5];
    uint64_t v38 = v6;
    uint64_t v40 = v38;
    if (!v36) {
      goto LABEL_133;
    }
    if (v37)
    {
      if ((v37[9] & 1) != 0)
      {
        ne_log_obj();
        uint64_t v232 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v232, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          __int128 v274 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthPart2AsResponderCopyErrorForIKESA:childSA:errorCodeToSend:]";
          _os_log_fault_impl( &dword_1876B1000,  v232,  OS_LOG_TYPE_FAULT,  "%s called with null !ikeSA.isInitiator",  buf,  0xCu);
        }

        uint64_t v240 = @"validateAuthPart2AsResponder called as initiator";
        goto LABEL_149;
      }

      char v41 = v37[23] & 1;
      if (v38)
      {
LABEL_27:
        SEL v42 = -[NEIKEv2IKESA copyInitiatorIdentifier](v37, v39);

        self = v36;
        if (v42)
        {
          objc_getProperty(v36, v43, 96LL, 1);
          id Property = (void *)objc_claimAutoreleasedReturnValue();
          id v46 = Property;
          if (Property) {
            id Property = objc_getProperty(Property, v45, 24LL, 1);
          }
          id v47 = Property;
          id v49 = -[NEIKEv2IKESA copyInitiatorIdentifier](v37, v48);
          char v50 = [v47 isEqual:v49];

          uint64_t v36 = self;
          if ((v50 & 1) == 0)
          {
            objc_getProperty(self, v43, 96LL, 1);
            id v89 = (void *)objc_claimAutoreleasedReturnValue();
            id v91 = v89;
            if (v89) {
              id v89 = objc_getProperty(v89, v90, 24LL, 1);
            }
            id v92 = v89;
            id v76 = (__CFString *)[v92 copyShortDescription];

            uint64_t v94 = -[NEIKEv2IKESA copyInitiatorIdentifier](v37, v93);
            id v79 = (__CFString *)[v94 copyShortDescription];

            ne_log_obj();
            SEL v95 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
            {
              uint64_t v220 = (char *)[self copyShortDescription];
              *(_DWORD *)buf = 138412802;
              __int128 v274 = v220;
              __int16 v275 = 2112;
              __int128 v276 = v76;
              __int16 v277 = 2112;
              uint64_t v278 = v79;
              _os_log_error_impl( &dword_1876B1000,  v95,  OS_LOG_TYPE_ERROR,  "%@ Initiator ID could not be verified (%@ != %@)",  buf,  0x20u);
            }

            uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorPeerInvalidSyntax( @"Initiator ID could not be verified (%@ != %@)",  v96,  v97,  v98,  v99,  v100,  v101,  v102,  (uint64_t)v76);
            goto LABEL_51;
          }
        }

        objc_getProperty(v36, v43, 96LL, 1);
        id v51 = (void *)objc_claimAutoreleasedReturnValue();
        id v53 = v51;
        if (v51) {
          id v51 = objc_getProperty(v51, v52, 24LL, 1);
        }
        id v55 = v51;
        if (v37) {
          objc_setProperty_atomic(v37, v54, v55, 504LL);
        }

        objc_getProperty(v36, v56, 104LL, 1);
        id v57 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v59 = v57;
        if (v57 && (id v60 = objc_getProperty(v57, v58, 24LL, 1)) != 0LL)
        {
          char v62 = v60;
          id v63 = -[NEIKEv2IKESA copyResponderIdentifier](v37, v61);

          if (v63)
          {
            objc_getProperty(self, v64, 104LL, 1);
            id v65 = (void *)objc_claimAutoreleasedReturnValue();
            id v67 = v65;
            if (v65) {
              id v65 = objc_getProperty(v65, v66, 24LL, 1);
            }
            id v68 = v65;
            id v70 = -[NEIKEv2IKESA copyResponderIdentifier](v37, v69);
            char v71 = [v68 isEqual:v70];

            if ((v71 & 1) == 0)
            {
              objc_getProperty(self, v64, 104LL, 1);
              SEL v72 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v74 = v72;
              if (v72) {
                SEL v72 = objc_getProperty(v72, v73, 24LL, 1);
              }
              id v75 = v72;
              id v76 = (__CFString *)[v75 copyShortDescription];

              SEL v78 = -[NEIKEv2IKESA copyResponderIdentifier](v37, v77);
              id v79 = (__CFString *)[v78 copyShortDescription];

              ne_log_obj();
              uint64_t v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
              {
                char v229 = (char *)[self copyShortDescription];
                *(_DWORD *)buf = 138412802;
                __int128 v274 = v229;
                __int16 v275 = 2112;
                __int128 v276 = v76;
                __int16 v277 = 2112;
                uint64_t v278 = v79;
                _os_log_error_impl( &dword_1876B1000,  v80,  OS_LOG_TYPE_ERROR,  "%@ Responder ID could not be verified (%@ != %@)",  buf,  0x20u);
              }

              uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorPeerInvalidSyntax( @"Responder ID could not be verified (%@ != %@)",  v81,  v82,  v83,  v84,  v85,  v86,  v87,  (uint64_t)v76);
LABEL_51:
              id v3 = (id)ErrorPeerInvalidSyntax;

LABEL_52:
              unint64_t v7 = 24LL;
              goto LABEL_138;
            }
          }
        }

        else
        {
        }

        uint64_t v103 = self;
        id v104 = objc_getProperty(self, v64, 152LL, 1);
        uint64_t v106 = v104;
        if (!v104 || (uint64_t v107 = objc_getProperty(v104, v105, 24LL, 1)) == 0LL)
        {
          uint64_t v118 = 0LL;
LABEL_89:

          goto LABEL_90;
        }

        uint64_t v108 = v107[1];

        if (v108 != 1)
        {
LABEL_90:
          if (!v37 || (v37[23] & 1) == 0)
          {
            else {
              unint64_t v139 = 2LL;
            }
            if (v6) {
              id v140 = objc_getProperty(v40, v138, 48LL, 1);
            }
            else {
              id v140 = 0LL;
            }
            id v141 = v140;
            uint64_t v142 = [v141 mode];

            if (v139 == v142)
            {
              if (v6) {
                id v144 = objc_getProperty(v40, v143, 48LL, 1);
              }
              else {
                id v144 = 0LL;
              }
              uint64_t v145 = self;
              id v146 = v144;
              if ([v146 sequencePerTrafficClass])
              {
                int v147 = -[NEIKEv2Packet hasNotification:](self, (const char *)0xC350);

                if (v147)
                {
                  ne_log_obj();
                  uint64_t v149 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
                  {
                    id v231 = (char *)[self copyShortDescription];
                    *(_DWORD *)buf = 138412290;
                    __int128 v274 = v231;
                    _os_log_debug_impl( &dword_1876B1000,  v149,  OS_LOG_TYPE_DEBUG,  "%@ Sequence Per Traffic Class supported",  buf,  0xCu);
                  }

                  if (v6) {
                    BYTE2(v40->info) = 1;
                  }
                }
              }

              else
              {
              }

              objc_getProperty(self, v148, 88LL, 1);
              uint64_t v163 = (void *)objc_claimAutoreleasedReturnValue();
              id v165 = v163;
              if (v163) {
                uint64_t v163 = objc_getProperty(v163, v164, 24LL, 1);
              }
              id v166 = v163;

              if (v6) {
                id v168 = objc_getProperty(v40, v167, 48LL, 1);
              }
              else {
                id v168 = 0LL;
              }
              id v169 = v168;
              [v169 proposals];
              uint64_t v170 = (void *)objc_claimAutoreleasedReturnValue();

              if (v6) {
                id v172 = objc_getProperty(v40, v171, 48LL, 1);
              }
              else {
                id v172 = 0LL;
              }
              id v173 = v172;
              uint64_t v174 = +[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]( (uint64_t)NEIKEv2ChildSAProposal,  v170,  v166,  [v173 preferInitiatorProposalOrder],  0);
              uint64_t v176 = v174;
              if (v6)
              {
                objc_setProperty_atomic(v40, v175, v174, 56LL);

                id v178 = objc_getProperty(v40, v177, 56LL, 1);
              }

              else
              {

                id v178 = 0LL;
              }

              id v179 = v178;

              ne_log_obj();
              SEL v180 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              uint64_t v181 = v180;
              if (v179)
              {
                uint64_t v258 = v170;
                if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
                {
                  id v183 = (__CFString *)[self copyShortDescription];
                  if (v6) {
                    id v184 = objc_getProperty(v40, v182, 56LL, 1);
                  }
                  else {
                    id v184 = 0LL;
                  }
                  uint64_t v185 = (__CFString *)v184;
                  *(_DWORD *)buf = 138412802;
                  __int128 v274 = (const char *)v40;
                  __int16 v275 = 2112;
                  __int128 v276 = v183;
                  __int16 v277 = 2112;
                  uint64_t v278 = v185;
                  _os_log_impl( &dword_1876B1000,  v181,  OS_LOG_TYPE_DEFAULT,  "%@ %@ Chose initiator auth child proposal %@",  buf,  0x20u);

                  uint64_t v145 = self;
                }

                objc_getProperty(v145, v186, 160LL, 1);
                uint64_t v187 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v189 = v187;
                if (v187) {
                  uint64_t v187 = objc_getProperty(v187, v188, 24LL, 1);
                }
                SEL v190 = v37;
                id v192 = v187;
                uint64_t v253 = a1;
                if (v6)
                {
                  uint64_t v193 = v40;
                  id v194 = objc_getProperty(v40, v191, 48LL, 1);
                }

                else
                {
                  id v194 = 0LL;
                  uint64_t v193 = v40;
                }

                id v195 = v194;
                [v195 remoteTrafficSelectors];
                uint64_t v196 = (void *)objc_claimAutoreleasedReturnValue();
                id v197 = +[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]( (uint64_t)&OBJC_CLASS___NEIKEv2TrafficSelector,  (uint64_t)v192,  v196);
                -[NEIKEv2ChildSA setInitiatorTrafficSelectors:](v193, v197);

                objc_getProperty(self, v198, 168LL, 1);
                uint64_t v199 = (void *)objc_claimAutoreleasedReturnValue();
                id v201 = v199;
                if (v199) {
                  uint64_t v199 = objc_getProperty(v199, v200, 24LL, 1);
                }
                uint64_t v37 = v190;
                id v203 = v199;
                if (v6) {
                  id v204 = objc_getProperty(v40, v202, 48LL, 1);
                }
                else {
                  id v204 = 0LL;
                }
                id v205 = v204;
                [v205 localTrafficSelectors];
                uint64_t v206 = (void *)objc_claimAutoreleasedReturnValue();
                id v207 = +[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]( (uint64_t)&OBJC_CLASS___NEIKEv2TrafficSelector,  (uint64_t)v203,  v206);
                -[NEIKEv2ChildSA setResponderTrafficSelectors:](v40, v207);

                a1 = v253;
                goto LABEL_133;
              }

              if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
              {
                uint64_t v230 = (char *)[self copyShortDescription];
                *(_DWORD *)buf = 138412290;
                __int128 v274 = v230;
                _os_log_error_impl( &dword_1876B1000,  v181,  OS_LOG_TYPE_ERROR,  "%@ No matching proposal found",  buf,  0xCu);
              }

              id v3 = (id)NEIKEv2CreateErrorPeerInvalidSyntax( @"No matching proposal found",  v208,  v209,  v210,  v211,  v212,  v213,  v214,  v243);
            }

            else
            {
              ne_log_obj();
              uint64_t v151 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
              {
                uint64_t v222 = (char *)[self copyShortDescription];
                ChildSAModeString = NEIKEv2CreateChildSAModeString(v139);
                uint64_t v225 = v37;
                if (v6) {
                  id v226 = objc_getProperty(v40, v223, 48LL, 1);
                }
                else {
                  id v226 = 0LL;
                }
                id v227 = v226;
                uint64_t v228 = NEIKEv2CreateChildSAModeString([v227 mode]);
                *(_DWORD *)buf = 138412802;
                __int128 v274 = v222;
                __int16 v275 = 2112;
                __int128 v276 = ChildSAModeString;
                __int16 v277 = 2112;
                uint64_t v278 = v228;
                _os_log_error_impl( &dword_1876B1000,  v151,  OS_LOG_TYPE_ERROR,  "%@ Transport mode Child SA did not match (packet had %@ but config expected %@)",  buf,  0x20u);

                uint64_t v37 = v225;
              }

              uint64_t v153 = NEIKEv2CreateChildSAModeString(v139);
              if (v6) {
                id v154 = objc_getProperty(v40, v152, 48LL, 1);
              }
              else {
                id v154 = 0LL;
              }
              id v155 = v154;
              id v244 = NEIKEv2CreateChildSAModeString([v155 mode]);
              id v3 = (id)NEIKEv2CreateErrorPeerInvalidSyntax( @"Transport mode Child SA did not match (packet had %@ but config expected %@)",  v156,  v157,  v158,  v159,  v160,  v161,  v162,  (uint64_t)v153);
            }

            unint64_t v7 = 14LL;
LABEL_138:

            if (v3) {
              goto LABEL_3;
            }
LABEL_139:
            uint64_t v216 = a1[4];
            id v215 = a1[5];
            uint64_t v217 = a1[6];
            v259[0] = MEMORY[0x1895F87A8];
            v259[1] = 3221225472LL;
            v259[2] = __46__NEIKEv2Session_Exchange__receiveConnection___block_invoke_214;
            v259[3] = &unk_18A08D0A0;
            id v218 = v215;
            uint64_t v219 = a1[4];
            id v260 = v218;
            id v261 = v219;
            id v262 = a1[6];
            id v263 = v40;
            -[NEIKEv2Session handleEAPAndGSPMForIKESA:authPacket:handler:](v216, v218, v217, v259);

            id v3 = v260;
            goto LABEL_11;
          }

void __46__NEIKEv2Session_Exchange__receiveConnection___block_invoke_214(uint64_t a1, void *a2)
{
  v538[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6)
  {
    uint64_t v8 = 0LL;
    if (!v3)
    {
      uint64_t v5 = 0LL;
      goto LABEL_16;
    }

    BOOL v9 = 1;
    goto LABEL_5;
  }

  *(_BYTE *)(v6 + 17) = 0;
  unint64_t v7 = *(id *)(a1 + 32);
  uint64_t v8 = (uint64_t)v7;
  if (!v5) {
    goto LABEL_16;
  }
  BOOL v9 = v7 == 0LL;
  if (!v7 || (v7[9] & 1) == 0)
  {
LABEL_5:
    -[NEIKEv2IKESA remoteAuthentication]((id)v8, v4);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v10 method])
    {
      if (v9)
      {

LABEL_8:
        uint64_t v13 = objc_getProperty(v5, v12, 128LL, 1);
        uint64_t v14 = (void *)v13;
        uint64_t v15 = a1;
        if (v13) {
          uint64_t v16 = *(void **)(v13 + 24);
        }
        else {
          uint64_t v16 = 0LL;
        }
        id v17 = v16;

        uint64_t v19 = objc_getProperty(v5, v18, 128LL, 1);
        uint64_t v20 = (void *)v19;
        if (v19) {
          id v21 = *(void **)(v19 + 32);
        }
        else {
          id v21 = 0LL;
        }
        id v22 = v21;

        if ([v17 isSecurePassword]
          && (-[NEIKEv2IKESA remoteAuthentication]((id)v8, v23),
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(),
              int v25 = [v24 isSecurePassword],
              v24,
              v25))
        {
          uint64_t v26 = -[NEIKEv2IKESA remoteAuthentication]((id)v8, v23);

          id v17 = (id)v26;
        }

        else
        {
          -[NEIKEv2IKESA remoteAuthentication]((id)v8, v23);
          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
          char v62 = +[NEIKEv2Crypto isRemoteAuthenticationPacketProtocol:compatibleWithConfiguredProtocol:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v17,  v61);

          if ((v62 & 1) == 0)
          {
            ne_log_obj();
            uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              v296 = (char *)[v5 copyShortDescription];
              -[NEIKEv2IKESA remoteAuthentication]((id)v8, v297);
              id v298 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v533 = v296;
              __int16 v534 = 2112;
              uint64_t v535 = (uint64_t)v17;
              __int16 v536 = 2112;
              v537 = v298;
              _os_log_error_impl( &dword_1876B1000,  v74,  OS_LOG_TYPE_ERROR,  "%@ Responder packet authentication method %@ is not compatible with configuration %@",  buf,  0x20u);
            }
            v503 = -[NEIKEv2IKESA remoteAuthentication]((id)v8, v75);
            ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication( @"Packet authentication method %@ is not compatible with configuration %@",  v76,  v77,  v78,  v79,  v80,  v81,  v82,  (uint64_t)v17);

            goto LABEL_194;
          }
        }

        if (v9 || (*(_BYTE *)(v8 + 24) & 1) == 0) {
          goto LABEL_42;
        }
        id v99 = objc_getProperty((id)v8, v27, 456LL, 1);
        if (!v99 || (uint64_t v101 = *(void *)(v8 + 416), v99, v101))
        {
LABEL_76:
          uint64_t v128 = *(void *)(v8 + 416);
          id v129 = objc_getProperty((id)v8, v100, 88LL, 1);
          uint64_t v130 = v129;
          if (v128)
          {
            uint64_t v131 = [v129 ppkIDType];

            if (v131 != 2
              || (id v133 = objc_getProperty((id)v8, v132, 88LL, 1),
                  [v133 ppkID],
                  uint64_t v134 = (void *)objc_claimAutoreleasedReturnValue(),
                  v134,
                  v133,
                  v134))
            {
              id v135 = objc_getProperty((id)v8, v132, 88LL, 1);
              uint64_t v136 = [v135 ppkIDType];

              id v138 = objc_getProperty((id)v8, v137, 88LL, 1);
              [v138 ppkID];
              unint64_t v139 = (void *)objc_claimAutoreleasedReturnValue();

              if (*(void *)(v8 + 416) == v136)
              {
                id v140 = v5;
                id v141 = *(id *)(v8 + 424);
                if ([v141 length] || objc_msgSend(v139, "length"))
                {
                  id v142 = *(id *)(v8 + 424);
                  char v143 = [v142 isEqualToData:v139];

                  if ((v143 & 1) == 0)
                  {
                    ne_log_obj();
                    uint64_t v145 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
                    {
                      v485 = (char *)*(id *)(v8 + 424);
                      *(_DWORD *)buf = 138412546;
                      v533 = v485;
                      __int16 v534 = 2112;
                      uint64_t v535 = (uint64_t)v139;
                      _os_log_error_impl( &dword_1876B1000,  v145,  OS_LOG_TYPE_ERROR,  "PPK ID %@ != Expected %@",  buf,  0x16u);
                    }

                    uint64_t v5 = v140;
LABEL_153:

                    id v251 = objc_getProperty((id)v8, v250, 88LL, 1);
                    int v252 = [v251 ppkMandatory];

                    if (v252)
                    {
                      ne_log_obj();
                      uint64_t v253 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v253, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_error_impl( &dword_1876B1000,  v253,  OS_LOG_TYPE_ERROR,  "Wrong PPK ID received with mandatory PPK auth",  buf,  2u);
                      }

                      id v261 = @"Wrong PPK ID received with mandatory PPK auth";
LABEL_185:
                      uint64_t ErrorCrypto = NEIKEv2CreateErrorAuthentication( v261,  v254,  v255,  v256,  v257,  v258,  v259,  v260,  v502);
LABEL_193:
                      ErrorAuthentication = (void *)ErrorCrypto;

                      goto LABEL_194;
                    }

                    id v262 = *(id *)(v8 + 384);

                    ne_log_obj();
                    id v263 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    __int128 v264 = v263;
                    if (!v262)
                    {
                      if (os_log_type_enabled(v263, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_error_impl( &dword_1876B1000,  v264,  OS_LOG_TYPE_ERROR,  "Wrong PPK ID received and no non-PPK AUTH data received",  buf,  2u);
                      }

                      id v261 = @"Wrong PPK ID received and no non-PPK AUTH data received";
                      goto LABEL_185;
                    }

                    __int128 v265 = v139;
                    if (os_log_type_enabled(v263, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl( &dword_1876B1000,  v264,  OS_LOG_TYPE_INFO,  "Wrong PPK ID received, falling back to non-PPK AUTH data",  buf,  2u);
                    }

                    id v266 = *(id *)(v8 + 384);
                    int v63 = 0;
                    id v22 = v266;
LABEL_189:

LABEL_43:
                    id v64 = v17;
                    -[NEIKEv2IKESA remoteAuthentication]((id)v8, v65);
                    SEL v66 = (void *)objc_claimAutoreleasedReturnValue();
                    int v67 = [v66 isNonStandard];

                    uint64_t v69 = v64;
                    if (v67)
                    {
                      -[NEIKEv2IKESA remoteAuthentication]((id)v8, v68);
                      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    if (v9) {
                      id Property = 0LL;
                    }
                    else {
                      id Property = objc_getProperty((id)v8, v68, 456LL, 1);
                    }
                    id v71 = Property;

                    if (v71)
                    {
                      if ([v69 method] == 12)
                      {
                        SEL v72 = -[NEIKEv2IKESA createInitiatorGSPMAuthenticationDataUsingPrimeKey:]((os_log_s *)v8, 0LL);
                        if (v72
                          && +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v72,  v22))
                        {
                          if (!v9)
                          {
                            *(_BYTE *)(v8 + 18) = 1;
                            if (v63) {
                              *(_BYTE *)(v8 + 19) = 1;
                            }
                          }

LABEL_150:
                          a1 = v15;
                          goto LABEL_16;
                        }

                        ne_log_obj();
                        id v242 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v242, OS_LOG_TYPE_ERROR))
                        {
                          int v327 = v5;
                          v328 = (char *)[v5 copyShortDescription];
                          *(_DWORD *)buf = 138412290;
                          v533 = v328;
                          _os_log_error_impl( &dword_1876B1000,  v242,  OS_LOG_TYPE_ERROR,  "%@ GSPM authentication data could not be verified",  buf,  0xCu);

                          uint64_t v5 = v327;
                        }

                        ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication( @"GSPM authentication data could not be verified",  v243,  v244,  v245,  v246,  v247,  v248,  v249,  v502);
                        goto LABEL_168;
                      }

                      ne_log_obj();
                      uint64_t v152 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
                      {
                        v326 = (char *)[v5 copyShortDescription];
                        *(_DWORD *)buf = 138412546;
                        v533 = v326;
                        __int16 v534 = 2112;
                        uint64_t v535 = (uint64_t)v69;
                        _os_log_error_impl( &dword_1876B1000,  v152,  OS_LOG_TYPE_ERROR,  "%@ Wrong authentication method %@ for GSPM",  buf,  0x16u);
                      }

                      uint64_t v160 = NEIKEv2CreateErrorAuthentication( @"Wrong authentication method $@ for GSPM",  v153,  v154,  v155,  v156,  v157,  v158,  v159,  (uint64_t)v69);
                    }

                    else
                    {
                      if ([v69 isSignature])
                      {
                        if (v9) {
                          id v147 = 0LL;
                        }
                        else {
                          id v147 = objc_getProperty((id)v8, v146, 88LL, 1);
                        }
                        v507 = v5;
                        id v148 = v147;
                        uint64_t v149 = (__SecKey *)-[NEIKEv2SessionConfiguration copyRemoteAuthKey](v148);

                        if (v149)
                        {
                          uint64_t v150 = (void *)-[NEIKEv2IKESA createRemoteSignedOctetsUsingPrimeKey:](v8, 0LL);
                          char v151 = +[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v22,  v150,  v69,  v149);
                          CFRelease(v149);
                          if ((v151 & 1) != 0)
                          {
                            if (!v9)
                            {
                              *(_BYTE *)(v8 + 18) = 1;
                              if (v63) {
                                *(_BYTE *)(v8 + 19) = 1;
                              }
                            }

                            uint64_t v5 = v507;
                            goto LABEL_150;
                          }

                          ne_log_obj();
                          __int16 v277 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v277, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v331 = (char *)[v507 copyShortDescription];
                            *(_DWORD *)buf = 138412546;
                            v533 = v331;
                            __int16 v534 = 2112;
                            uint64_t v535 = (uint64_t)v69;
                            _os_log_error_impl( &dword_1876B1000,  v277,  OS_LOG_TYPE_ERROR,  "%@ Responder failed to validate remote authentication data %@",  buf,  0x16u);
                          }

                          ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication( @"Failed to validate remote authentication data %@",  v278,  v279,  v280,  v281,  v282,  v283,  v284,  (uint64_t)v69);
                        }

                        else
                        {
                          ne_log_obj();
                          v494 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v494, OS_LOG_TYPE_FAULT))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_fault_impl( &dword_1876B1000,  v494,  OS_LOG_TYPE_FAULT,  "Responder configuration is missing remote public key",  buf,  2u);
                          }

                          ErrorAuthentication = (void *)NEIKEv2CreateErrorInternal( @"Responder configuration is missing remote public key",  v495,  v496,  v497,  v498,  v499,  v500,  v501,  v502);
                        }

                        uint64_t v5 = v507;
                        goto LABEL_168;
                      }

                      if ((-[NEIKEv2IKESA checkSharedKeyAuthData:usingPrimeKey:](v8, v22, 0LL) & 1) != 0)
                      {
                        if (!v9)
                        {
                          *(_BYTE *)(v8 + 18) = 1;
                          if (v63) {
                            *(_BYTE *)(v8 + 19) = 1;
                          }
                        }

                        goto LABEL_150;
                      }

                      ne_log_obj();
                      __int128 v268 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v330 = (char *)[v5 copyShortDescription];
                        *(_DWORD *)buf = 138412546;
                        v533 = v330;
                        __int16 v534 = 2112;
                        uint64_t v535 = (uint64_t)v69;
                        _os_log_error_impl( &dword_1876B1000,  v268,  OS_LOG_TYPE_ERROR,  "%@ Responder failed to validate remote authentication data %@",  buf,  0x16u);
                      }

                      uint64_t v160 = NEIKEv2CreateErrorAuthentication( @"Failed to validate remote authentication data %@",  v269,  v270,  v271,  v272,  v273,  v274,  v275,  (uint64_t)v69);
                    }

                    ErrorAuthentication = (void *)v160;
LABEL_168:

                    unint64_t v276 = 24LL;
LABEL_196:
                    a1 = v15;
                    goto LABEL_197;
                  }
                }

                else
                {
                }

                -[NEIKEv2IKESA ppk]((id)v8, v144);
                id v300 = (void *)objc_claimAutoreleasedReturnValue();
                char v301 = -[NEIKEv2IKESA generateDerivativesFromPPK:](v8, v300);

                if ((v301 & 1) == 0)
                {
                  ne_log_obj();
                  v302 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  uint64_t v5 = v140;
                  if (os_log_type_enabled(v302, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v533 = (const char *)v140;
                    _os_log_error_impl( &dword_1876B1000,  v302,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate PPK-derived keys",  buf,  0xCu);
                  }

                  uint64_t ErrorCrypto = NEIKEv2CreateErrorCrypto( @"Failed to generate PPK-derived keys",  v303,  v304,  v305,  v306,  v307,  v308,  v309,  v502);
                  goto LABEL_193;
                }

                __int128 v265 = v139;
                int v63 = 1;
                uint64_t v5 = v140;
                goto LABEL_189;
              }

              ne_log_obj();
              uint64_t v145 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
              {
                v329 = *(const char **)(v8 + 416);
                *(_DWORD *)buf = 134218240;
                v533 = v329;
                __int16 v534 = 2048;
                uint64_t v535 = v136;
                _os_log_error_impl( &dword_1876B1000,  v145,  OS_LOG_TYPE_ERROR,  "PPK Type %zu != Expected Type %zu",  buf,  0x16u);
              }

              goto LABEL_153;
            }

            ne_log_obj();
            uint64_t v285 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v285, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              v533 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthFinalAsResponderCopyErrorForIKESA:errorCodeToSend:]";
              _os_log_fault_impl( &dword_1876B1000,  v285,  OS_LOG_TYPE_FAULT,  "%s called with null ikeSA.sessionConfiguration.ppkID",  buf,  0xCu);
            }

            uint64_t ErrorInternal = NEIKEv2CreateErrorInternal( @"PPK use negotiated but PPK ID is not present in configuration",  v286,  v287,  v288,  v289,  v290,  v291,  v292,  v502);
          }

          else
          {
            int v161 = [v129 ppkMandatory];

            if (!v161)
            {
LABEL_42:
              int v63 = 0;
              goto LABEL_43;
            }

            ne_log_obj();
            uint64_t v162 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl( &dword_1876B1000,  v162,  OS_LOG_TYPE_ERROR,  "No PPK ID received with mandatory PPK auth",  buf,  2u);
            }

            uint64_t ErrorInternal = NEIKEv2CreateErrorAuthentication( @"No PPK ID received with mandatory PPK auth",  v163,  v164,  v165,  v166,  v167,  v168,  v169,  v502);
          }

          ErrorAuthentication = (void *)ErrorInternal;
LABEL_194:
          unint64_t v276 = 24LL;
LABEL_195:

          goto LABEL_196;
        }

        uint64_t v102 = -[NEIKEv2Packet copyNotification:](v5, (const char *)0x4034);
        id v104 = v102;
        if (v102)
        {
          uint64_t v105 = -[NEIKEv2NotifyPayload getPPKIDType](v102, v103);
          uint64_t v113 = v105;
          if ((unint64_t)(v105 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            ErrorAuthentication = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"PPK ID type %zu is invalid",  (uint64_t)v106,  v107,  v108,  v109,  v110,  v111,  v112,  v105);
          }

          else
          {
            id v114 = (void *)-[NEIKEv2NotifyPayload copyPPKID](v104, v106);
            uint64_t v115 = [v114 length];
            if (v113 != 2 || v115)
            {
              -[NEIKEv2IKESA setPpkIDFromPacket:](v8, v114);
              *(void *)(v8 + 416) = v113;
              uint64_t v123 = -[NEIKEv2Packet copyNotification:](v5, (const char *)0x4035);
              uint64_t v125 = v123;
              uint64_t v126 = v5;
              if (v123) {
                uint64_t v123 = objc_getProperty(v123, v124, 32LL, 1);
              }
              id v127 = v123;
              -[NEIKEv2IKESA setPrimeAuthenticationDataFromPacket:](v8, v127);

              uint64_t v5 = v126;
              goto LABEL_75;
            }

            ErrorAuthentication = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"PPK ID missing from payload",  v116,  v117,  v118,  v119,  v120,  v121,  v122,  v502);
          }

          unint64_t v276 = 7LL;
          goto LABEL_195;
        }

- (void)initiateNewChildSA:(_BYTE *)a1
{
  uint64_t v141 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  uint64_t v6 = (dispatch_queue_s *)Property;
  dispatch_assert_queue_V2(v6);

  if (!a1[15]) {
    __assert_rtn( "-[NEIKEv2Session(Exchange) initiateNewChildSA:]",  "NEIKEv2Exchange.m",  1546,  "self.hasOutboundRequestInFlight");
  }
  id v7 = v4[3];
  id v9 = objc_getProperty(a1, v8, 336LL, 1);
  uint64_t v10 = v9;
  if (!v7)
  {
    ne_log_obj();
    uint64_t v132 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v132, OS_LOG_TYPE_FAULT))
    {
LABEL_72:

      [v4 sendCallbackSuccess:0 session:a1];
      goto LABEL_67;
    }

    *(_DWORD *)buf = 136315138;
    id v140 = "-[NEIKEv2Session(Exchange) initiateNewChildSA:]";
    id v133 = "%s called with null childSA";
LABEL_76:
    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v132, OS_LOG_TYPE_FAULT, v133, buf, 0xCu);
    goto LABEL_72;
  }

  if (!v9)
  {
    ne_log_obj();
    uint64_t v132 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v132, OS_LOG_TYPE_FAULT)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    id v140 = "-[NEIKEv2Session(Exchange) initiateNewChildSA:]";
    id v133 = "%s called with null ikeSA";
    goto LABEL_76;
  }

  -[NEIKEv2ChildSA setState:error:]((uint64_t)v7, 1uLL, 0LL);
  -[NEIKEv2Session reportState](a1, v11);
  id v13 = objc_getProperty(v7, v12, 48LL, 1);
  [v13 proposals];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  char v15 = -[NEIKEv2Session generateSPIForChild:proposals:](a1, v7, v14);

  if ((v15 & 1) == 0)
  {
    ne_log_obj();
    SEL v92 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v92, OS_LOG_TYPE_ERROR, "Failed to generate Child SA SPI", buf, 2u);
    }

    [v4 sendCallbackSuccess:0 session:a1];
    uint64_t v100 = @"Failed to generate Child SA SPI";
    goto LABEL_39;
  }

  if ((-[NEIKEv2ChildSA generateInitialValues]((id *)v7) & 1) == 0)
  {
    ne_log_obj();
    uint64_t v101 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v101,  OS_LOG_TYPE_ERROR,  "Failed to generate local Child crypto values",  buf,  2u);
    }

    [v4 sendCallbackSuccess:0 session:a1];
    uint64_t v100 = @"Failed to generate local Child crypto values";
LABEL_39:
    uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(v100, v93, v94, v95, v96, v97, v98, v99, (uint64_t)v134);
    -[NEIKEv2ChildSA setState:error:]((uint64_t)v7, 3uLL, ErrorCrypto);

    -[NEIKEv2Session reportState](a1, v103);
    -[NEIKEv2Session resetChild:](a1, v7);
    goto LABEL_67;
  }

  uint64_t v16 = v7;
  objc_opt_self();
  if ((v16[9] & 1) == 0)
  {
    ne_log_obj();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
      _os_log_fault_impl(&dword_1876B1000, v19, OS_LOG_TYPE_FAULT, "%s called with null childSA.isInitiator", buf, 0xCu);
    }

    goto LABEL_58;
  }

  id v17 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2CreateChildPacket));
  if (!v17)
  {
    ne_log_obj();
    id v104 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_1876B1000,  v104,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2CreateChildPacket alloc] initOutbound:] failed",  buf,  2u);
    }

    uint64_t v19 = 0LL;
    goto LABEL_58;
  }

  uint64_t v19 = v17;
  id v20 = objc_getProperty(v16, v18, 48LL, 1);
  uint64_t v21 = [v20 mode];

  if (v21 == 1 && !-[NEIKEv2Packet addNotification:data:](v19, 0x4007uLL, 0LL))
  {
    ne_log_obj();
    uint64_t v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v106 = "[packet addNotification:NEIKEv2NotifyTypeUseTransportMode] failed";
      uint64_t v107 = v105;
      uint32_t v108 = 2;
LABEL_56:
      _os_log_fault_impl(&dword_1876B1000, v107, OS_LOG_TYPE_FAULT, v106, buf, v108);
      goto LABEL_57;
    }

    goto LABEL_57;
  }

  id v22 = objc_alloc_init(&OBJC_CLASS___NEIKEv2ChildSAPayload);
  objc_setProperty_atomic(v19, v23, v22, 96LL);

  id v25 = objc_getProperty(v16, v24, 48LL, 1);
  [v25 proposals];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getProperty(v19, v27, 96LL, 1);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = v28;
  if (v28) {
    objc_setProperty_atomic(v28, v29, v26, 24LL);
  }

  objc_getProperty(v19, v31, 96LL, 1);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  char v33 = -[NEIKEv2Payload isValid]((uint64_t)v32);

  if ((v33 & 1) == 0)
  {
    ne_log_obj();
    uint64_t v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 136315138;
    id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
    uint64_t v106 = "%s called with null packet.childSA.isValid";
LABEL_55:
    uint64_t v107 = v105;
    uint32_t v108 = 12;
    goto LABEL_56;
  }

  if (-[NEIKEv2ChildSA shouldGenerateNewDHKeys](v16, v34))
  {
    uint64_t v35 = objc_alloc_init(&OBJC_CLASS___NEIKEv2KeyExchangePayload);
    objc_setProperty_atomic(v19, v36, v35, 104LL);

    id v134 = objc_getProperty(v16, v37, 48LL, 1);
    [v134 proposals];
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 firstObject];
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2IKESAProposal kemProtocol](v39, v40);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getProperty(v19, v42, 104LL, 1);
    SEL v43 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v45 = v43;
    if (v43) {
      objc_setProperty_atomic(v43, v44, v41, 24LL);
    }

    id v47 = objc_getProperty(v16, v46, 112LL, 1);
    uint64_t v48 = v47;
    if (v47) {
      id v49 = (void *)*((void *)v47 + 2);
    }
    else {
      id v49 = 0LL;
    }
    id v50 = v49;
    objc_getProperty(v19, v51, 104LL, 1);
    SEL v52 = (void *)objc_claimAutoreleasedReturnValue();
    SEL v54 = v52;
    if (v52) {
      objc_setProperty_atomic(v52, v53, v50, 32LL);
    }

    objc_getProperty(v19, v55, 104LL, 1);
    char v56 = (void *)objc_claimAutoreleasedReturnValue();
    char v57 = -[NEIKEv2Payload isValid]((uint64_t)v56);

    if ((v57 & 1) == 0)
    {
      ne_log_obj();
      uint64_t v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
        goto LABEL_57;
      }
      *(_DWORD *)buf = 136315138;
      id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
      uint64_t v106 = "%s called with null packet.ke.isValid";
      goto LABEL_55;
    }
  }

  int v58 = objc_alloc_init(&OBJC_CLASS___NEIKEv2NoncePayload);
  objc_setProperty_atomic(v19, v59, v58, 112LL);

  objc_getProperty(v16, v60, 80LL, 1);
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getProperty(v19, v62, 112LL, 1);
  int v63 = (void *)objc_claimAutoreleasedReturnValue();
  id v65 = v63;
  if (v63) {
    objc_setProperty_atomic(v63, v64, v61, 24LL);
  }

  objc_getProperty(v19, v66, 112LL, 1);
  int v67 = (void *)objc_claimAutoreleasedReturnValue();
  char v68 = -[NEIKEv2Payload isValid]((uint64_t)v67);

  if ((v68 & 1) == 0)
  {
    ne_log_obj();
    uint64_t v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 136315138;
    id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
    uint64_t v106 = "%s called with null packet.nonce.isValid";
    goto LABEL_55;
  }

  uint64_t v69 = objc_alloc_init(&OBJC_CLASS___NEIKEv2InitiatorTrafficSelectorPayload);
  objc_setProperty_atomic(v19, v70, v69, 128LL);

  -[NEIKEv2ChildSA configuredInitiatorTrafficSelectors](v16, v71);
  SEL v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getProperty(v19, v73, 128LL, 1);
  uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v76 = v74;
  if (v74) {
    objc_setProperty_atomic(v74, v75, v72, 24LL);
  }

  objc_getProperty(v19, v77, 128LL, 1);
  uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
  char v79 = -[NEIKEv2Payload isValid]((uint64_t)v78);

  if ((v79 & 1) == 0)
  {
    ne_log_obj();
    uint64_t v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 136315138;
    id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
    uint64_t v106 = "%s called with null packet.tsi.isValid";
    goto LABEL_55;
  }

  uint64_t v80 = objc_alloc_init(&OBJC_CLASS___NEIKEv2ResponderTrafficSelectorPayload);
  objc_setProperty_atomic(v19, v81, v80, 136LL);

  -[NEIKEv2ChildSA configuredResponderTrafficSelectors](v16, v82);
  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getProperty(v19, v84, 136LL, 1);
  uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
  int v87 = v85;
  if (v85) {
    objc_setProperty_atomic(v85, v86, v83, 24LL);
  }

  objc_getProperty(v19, v88, 136LL, 1);
  SEL v89 = (void *)objc_claimAutoreleasedReturnValue();
  char v90 = -[NEIKEv2Payload isValid]((uint64_t)v89);

  if ((v90 & 1) == 0)
  {
    ne_log_obj();
    uint64_t v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
      uint64_t v106 = "%s called with null packet.tsr.isValid";
      goto LABEL_55;
    }

void __47__NEIKEv2Session_Exchange__initiateNewChildSA___block_invoke(id *a1, void *a2)
{
  uint64_t v219 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    SEL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)SEL v218 = 0;
      _os_log_error_impl(&dword_1876B1000, v18, OS_LOG_TYPE_ERROR, "Failed to receive Create Child SA packet", v218, 2u);
    }

    [a1[4] sendCallbackSuccess:0 session:a1[5]];
    uint64_t v26 = (uint64_t)a1[6];
    SEL v27 = @"Failed to receive Create Child SA packet";
    goto LABEL_83;
  }

  id v4 = (char *)a1[6];
  uint64_t v6 = v4;
  if (!v3) {
    goto LABEL_80;
  }
  if (!v4 || (v4[9] & 1) == 0)
  {
    ne_log_obj();
    SEL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      SEL v210 = "-[NEIKEv2CreateChildPacket(Exchange) validateCreateChildAsInitiator:]";
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "%s called with null childSA.isInitiator", buf, 0xCu);
    }

    goto LABEL_79;
  }

  __int128 v207 = 0u;
  __int128 v208 = 0u;
  __int128 v206 = 0u;
  __int128 v205 = 0u;
  SEL v8 = (os_log_s *)objc_getProperty(v3, v7, 64LL, 1);
  uint64_t v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v205,  v218,  16LL);
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v206;
  do
  {
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      if (*(void *)v206 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(const __CFString **)(*((void *)&v205 + 1) + 8 * i);
      if (v13 && (unint64_t)(v13->length - 1) <= 0x3FFE)
      {
        ne_log_obj();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          SEL v43 = (os_log_s *)[v3 copyShortDescription];
          id v44 = (id)-[NEIKEv2NotifyPayload copyError](v13);
          *(_DWORD *)buf = 138412802;
          SEL v210 = v6;
          __int16 v211 = 2112;
          uint64_t v212 = (uint64_t)v43;
          __int16 v213 = 2112;
          uint64_t v214 = (uint64_t)v44;
          uint64_t v45 = "%@ %@ Initiator create child received notify error %@";
          SEL v46 = v17;
          goto LABEL_46;
        }

void __47__NEIKEv2Session_Exchange__initiateNewChildSA___block_invoke_241(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to install Child SA",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v12);
  -[NEIKEv2ChildSA setState:error:](v2, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v11);
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)receiveNewChildSA:(void *)a3 packet:
{
  uint64_t v387 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    uint64_t v8 = (dispatch_queue_s *)objc_getProperty(a1, v6, 368LL, 1);
    dispatch_assert_queue_V2(v8);

    id v11 = objc_getProperty(a1, v9, 336LL, 1);
    if (!v11)
    {
      ne_log_obj();
      uint64_t v275 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v275, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)SEL v385 = 136315138;
        SEL v386 = "-[NEIKEv2Session(Exchange) receiveNewChildSA:packet:]";
        _os_log_fault_impl(&dword_1876B1000, v275, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", v385, 0xCu);
      }

      goto LABEL_92;
    }

    if (v5)
    {
      id v12 = objc_getProperty(v5, v10, 48LL, 1);
      [v12 proposals];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      char v14 = -[NEIKEv2Session generateSPIForChild:proposals:](a1, v5, v13);

      if ((v14 & 1) != 0)
      {
        if ((-[NEIKEv2ChildSA generateInitialValues]((id *)v5) & 1) != 0)
        {
          uint64_t v16 = v5;
          if ((v16[9] & 1) != 0)
          {
            ne_log_obj();
            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              id v378 = "-[NEIKEv2CreateChildPacket(Exchange) validateCreateChildAsResponder:]";
              _os_log_fault_impl( &dword_1876B1000,  v20,  OS_LOG_TYPE_FAULT,  "%s called with null !childSA.isInitiator",  buf,  0xCu);
            }

            goto LABEL_75;
          }

          if (-[NEIKEv2Packet hasErrors](v7, v15))
          {
            __int128 v375 = 0u;
            __int128 v376 = 0u;
            __int128 v373 = 0u;
            __int128 v374 = 0u;
            if (v7)
            {
              SEL v18 = v7;
              id Property = objc_getProperty(v7, v17, 64LL, 1);
            }

            else
            {
              SEL v18 = 0LL;
              id Property = 0LL;
            }

            uint64_t v20 = (os_log_s *)Property;
            uint64_t v21 = -[os_log_s countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v373,  v385,  16LL);
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v374;
              while (2)
              {
                for (uint64_t i = 0LL; i != v22; ++i)
                {
                  if (*(void *)v374 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = *(const __CFString **)(*((void *)&v373 + 1) + 8 * i);
                  if (v25 && (unint64_t)(v25->length - 1) <= 0x3FFE)
                  {
                    ne_log_obj();
                    SEL v103 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v136 = (void *)[v18 copyShortDescription];
                      SEL v137 = (__CFString *)-[NEIKEv2NotifyPayload copyError](v25);
                      *(_DWORD *)buf = 138412802;
                      id v378 = v16;
                      __int16 v379 = 2112;
                      SEL v380 = v136;
                      __int16 v381 = 2112;
                      unint64_t v382 = (unint64_t)v137;
                      _os_log_error_impl( &dword_1876B1000,  v103,  OS_LOG_TYPE_ERROR,  "%@ %@ Responder create child received notify error %@",  buf,  0x20u);
                    }

                    id v7 = v18;
                    goto LABEL_75;
                  }
                }

                uint64_t v22 = -[os_log_s countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v373,  v385,  16LL);
                if (v22) {
                  continue;
                }
                break;
              }
            }

            id v7 = v18;
          }

          else {
            uint64_t v27 = 2LL;
          }
          id v28 = objc_getProperty(v16, v26, 48LL, 1);
          uint64_t v29 = [v28 mode];

          if (v27 != v29)
          {
            ne_log_obj();
            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
LABEL_75:

              goto LABEL_76;
            }

            id v36 = (void *)[v7 copyShortDescription];
            *(_DWORD *)buf = 138412546;
            id v378 = v16;
            __int16 v379 = 2112;
            SEL v380 = v36;
            _os_log_error_impl( &dword_1876B1000,  v20,  OS_LOG_TYPE_ERROR,  "%@ %@ Transport mode Child SA did not match",  buf,  0x16u);
LABEL_74:

            goto LABEL_75;
          }

          objc_getProperty(v7, v30, 96LL, 1);
          SEL v31 = (void *)objc_claimAutoreleasedReturnValue();
          id v33 = v31;
          if (v31) {
            SEL v31 = objc_getProperty(v31, v32, 24LL, 1);
          }
          uint64_t v20 = v31;

          id v35 = objc_getProperty(v16, v34, 48LL, 1);
          [v35 proposals];
          id v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[os_log_s count](v20, "count"))
          {
            self = v7;
            id v38 = objc_getProperty(v16, v37, 48LL, 1);
            uint64_t v39 = +[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]( (uint64_t)NEIKEv2ChildSAProposal,  v36,  v20,  [v38 preferInitiatorProposalOrder],  0);
            objc_setProperty_atomic(v16, v40, v39, 56LL);

            id v42 = objc_getProperty(v16, v41, 56LL, 1);
            ne_log_obj();
            SEL v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            id v44 = v43;
            if (!v42)
            {
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                id v104 = self;
                uint64_t v105 = (void *)[self copyShortDescription];
                *(_DWORD *)buf = 138412546;
                id v378 = v16;
                __int16 v379 = 2112;
                SEL v380 = v105;
                uint64_t v106 = "%@ %@ No matching proposal found";
                goto LABEL_167;
              }

void __53__NEIKEv2Session_Exchange__receiveNewChildSA_packet___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to process KE data", a2, a3, a4, a5, a6, a7, a8, v12);
  -[NEIKEv2ChildSA setState:error:](v9, 3uLL, ErrorCrypto);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v11);
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 40), *(void **)(a1 + 32));
}

void __53__NEIKEv2Session_Exchange__receiveNewChildSA_packet___block_invoke_252( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto( @"Failed to generate Child SA crypto values",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v12);
  -[NEIKEv2ChildSA setState:error:](v9, 3uLL, ErrorCrypto);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v11);
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 40), *(void **)(a1 + 32));
}

void __53__NEIKEv2Session_Exchange__receiveNewChildSA_packet___block_invoke_253( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to install Child SA",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v12);
  -[NEIKEv2ChildSA setState:error:](v9, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v11);
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 40), *(void **)(a1 + 32));
}

void __69__NEIKEv2Session_Exchange__retryKEForRekeyChildSA_validated_handler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[NEIKEv2CreateChildPacket validateRekeyResponseChildSA:]((uint64_t)v3, *(void **)(a1 + 48)) & 1) != 0)
    {
      uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16LL);
    }

    else
    {
      ne_log_obj();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v19 = 138412290;
        *(void *)&v19[4] = v18;
        _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "%@ Failed to process Create Child SA packet (child rekey retry KE)",  v19,  0xCu);
      }

      uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16LL);
    }

    v4();
  }

  else
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v19 = 138412290;
      *(void *)&v19[4] = v17;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive Create Child SA packet (child rekey retry KE)",  v19,  0xCu);
    }

    [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive Create Child SA packet (child rekey retry KE)",  v7,  v8,  v9,  v10,  v11,  v12,  v13,  *(uint64_t *)v19);
    -[NEIKEv2ChildSA setState:error:](v6, 3uLL, ErrorPeerInvalidSyntax);

    -[NEIKEv2Session reportState](*(void **)(a1 + 32), v15);
    -[NEIKEv2Session resetChild:](*(char **)(a1 + 32), *(void **)(a1 + 48));
  }
}

- (void)handleFollowupKEForRekeyChildSAInitiator:(unint64_t)a3 iteration:(void *)a4 handler:
{
  uint64_t v119 = *MEMORY[0x1895F89C0];
  uint64_t v7 = a2;
  uint64_t v9 = a4;
  if (a1)
  {
    uint64_t v10 = (dispatch_queue_s *)objc_getProperty(a1, v8, 368LL, 1);
    dispatch_assert_queue_V2(v10);

    if (v7) {
      uint64_t v11 = (const char *)v7[6];
    }
    else {
      uint64_t v11 = 0LL;
    }
    uint64_t v12 = -[NEIKEv2Session copyChildWithID:](a1, v11);
    char v14 = v12;
    if (v12)
    {
      id Property = objc_getProperty(v12, v13, 56LL, 1);
      uint64_t v17 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v16, 120LL, 1);
      }
    }

    else
    {
      uint64_t v17 = 0LL;
      id Property = 0LL;
    }

    id v18 = Property;
    unint64_t v19 = [v18 count];

    if (v19 <= a3)
    {
      if (v14) {
        objc_setProperty_atomic(v14, v20, 0LL, 128LL);
      }
      v9[2](v9);
      goto LABEL_47;
    }

    if (!a3)
    {
      id v22 = objc_alloc(MEMORY[0x189603FA8]);
      if (v14)
      {
        id v23 = objc_getProperty(v14, v21, 56LL, 1);
        uint64_t v25 = v23;
        if (v23) {
          id v23 = objc_getProperty(v23, v24, 120LL, 1);
        }
      }

      else
      {
        uint64_t v25 = 0LL;
        id v23 = 0LL;
      }

      id v26 = v23;
      id v28 = (void *)objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v26, "count"));
      if (v14) {
        objc_setProperty_atomic(v14, v27, v28, 136LL);
      }
    }

    if (v14)
    {
      id v29 = objc_getProperty(v14, v20, 56LL, 1);
      SEL v31 = v29;
      if (v29) {
        id v29 = objc_getProperty(v29, v30, 120LL, 1);
      }
    }

    else
    {
      SEL v31 = 0LL;
      id v29 = 0LL;
    }

    id v32 = v29;
    [v32 objectAtIndexedSubscript:a3];
    id v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14) {
      id v35 = objc_getProperty(v14, v34, 56LL, 1);
    }
    else {
      id v35 = 0LL;
    }
    id v36 = v35;
    -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v36);
    SEL v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 objectForKeyedSubscript:v33];
    id v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      if ((-[NEIKEv2ChildSA generateLocalValuesForKEMProtocol:](v14, v38) & 1) != 0)
      {
        uint32_t v108 = v33;
        uint64_t v39 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2FollowupKEPacket));
        SEL v40 = objc_alloc_init(&OBJC_CLASS___NEIKEv2KeyExchangePayload);
        id v42 = v40;
        if (v39)
        {
          objc_setProperty_atomic(v39, v41, v40, 88LL);

          id v44 = objc_getProperty(v39, v43, 88LL, 1);
          SEL v46 = v44;
          if (v44) {
            objc_setProperty_atomic(v44, v45, v38, 24LL);
          }
        }

        else
        {

          SEL v46 = 0LL;
        }

        if (v14)
        {
          id v48 = objc_getProperty(v14, v47, 112LL, 1);
          SEL v49 = v48;
          if (v48)
          {
            SEL v50 = (void *)*((void *)v48 + 2);
LABEL_28:
            id v52 = v50;
            if (v39)
            {
              id v53 = objc_getProperty(v39, v51, 88LL, 1);
              id v55 = v53;
              if (v53) {
                objc_setProperty_atomic(v53, v54, v52, 32LL);
              }
            }

            else
            {
              id v55 = 0LL;
            }

            if (v14) {
              id v57 = objc_getProperty(v14, v56, 128LL, 1);
            }
            else {
              id v57 = 0LL;
            }
            id v58 = v57;
            int v60 = v58;
            if (v39)
            {
              objc_setProperty_atomic(v39, v59, v58, 96LL);

              id v62 = objc_getProperty(v39, v61, 88LL, 1);
            }

            else
            {

              id v62 = 0LL;
            }

            id v63 = v62;
            char v64 = -[NEIKEv2Payload isValid]((uint64_t)v63);

            if ((v64 & 1) != 0)
            {
              v109[0] = MEMORY[0x1895F87A8];
              v109[1] = 3221225472LL;
              v109[2] = __87__NEIKEv2Session_Exchange__handleFollowupKEForRekeyChildSAInitiator_iteration_handler___block_invoke;
              v109[3] = &unk_18A08D190;
              v109[4] = a1;
              id v65 = v7;
              id v110 = v65;
              id v111 = v14;
              id v112 = v38;
              unint64_t v114 = a3;
              uint64_t v113 = v9;
              if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v39, v109) == -1)
              {
                [v65 sendCallbackSuccess:0 session:a1];
                id v67 = objc_getProperty(a1, v66, 336LL, 1);
                ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"initiator rekey child FOLLOWUP_KE #%zu",  v68,  v69,  v70,  v71,  v72,  v73,  v74,  a3 + 1);
                -[NEIKEv2IKESA setState:error:]((uint64_t)v67, 3uLL, ErrorFailedToSend);

                -[NEIKEv2Session reportState](a1, v76);
                -[NEIKEv2Session resetAll]((uint64_t)a1, v77);
              }

              id v33 = v108;
            }

            else
            {
              ne_log_obj();
              uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              id v33 = v108;
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v116 = a1;
                _os_log_error_impl( &dword_1876B1000,  v78,  OS_LOG_TYPE_ERROR,  "%@ Failed to create FOLLOWUP_KE packet (initiator rekey child followup KE)",  buf,  0xCu);
              }

              [v7 sendCallbackSuccess:0 session:a1];
              uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create FOLLOWUP_KE packet (initiator rekey child followup KE)",  v79,  v80,  v81,  v82,  v83,  v84,  v85,  v107);
              -[NEIKEv2ChildSA setState:error:]((uint64_t)v14, 3uLL, ErrorInternal);

              -[NEIKEv2Session reportState](a1, v87);
              -[NEIKEv2Session resetChild:]((char *)a1, v14);
            }

            goto LABEL_46;
          }
        }

        else
        {
          SEL v49 = 0LL;
        }

        SEL v50 = 0LL;
        goto LABEL_28;
      }

      ne_log_obj();
      uint64_t v97 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v116 = a1;
        __int16 v117 = 2112;
        uint64_t v118 = v38;
        _os_log_error_impl( &dword_1876B1000,  v97,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate values for KEM %@ (initiator rekey child followup KE)",  buf,  0x16u);
      }

      [v7 sendCallbackSuccess:0 session:a1];
      uint64_t v96 = (void *)NEIKEv2CreateErrorInternal( @"Failed to generate values for KEM %@ (initiator rekey child followup KE)",  v98,  v99,  v100,  v101,  v102,  v103,  v104,  (uint64_t)v38);
    }

    else
    {
      ne_log_obj();
      uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v116 = a1;
        __int16 v117 = 2112;
        uint64_t v118 = v33;
        _os_log_error_impl( &dword_1876B1000,  v88,  OS_LOG_TYPE_ERROR,  "%@ No chosen KEM found for transform type %@ (initiator rekey child followup KE)",  buf,  0x16u);
      }

      [v7 sendCallbackSuccess:0 session:a1];
      uint64_t v96 = (void *)NEIKEv2CreateErrorInternal( @"No chosen KEM found for transform type %@ (initiator rekey child followup KE)",  v89,  v90,  v91,  v92,  v93,  v94,  v95,  (uint64_t)v33);
    }

    uint64_t v105 = v96;
    -[NEIKEv2ChildSA setState:error:]((uint64_t)v14, 3uLL, v96);

    -[NEIKEv2Session reportState](a1, v106);
    -[NEIKEv2Session resetChild:]((char *)a1, v14);
LABEL_46:

LABEL_47:
  }
}

void __87__NEIKEv2Session_Exchange__handleFollowupKEForRekeyChildSAInitiator_iteration_handler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v117 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id Property = v3;
    uint64_t v6 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v5, 88LL, 1);
    }
    id v7 = Property;

    if (v7)
    {
      if (v6)
      {
        id v9 = objc_getProperty(v6, v8, 88LL, 1);
        uint64_t v11 = v9;
        if (v9) {
          id v9 = objc_getProperty(v9, v10, 24LL, 1);
        }
      }

      else
      {
        uint64_t v11 = 0LL;
        id v9 = 0LL;
      }

      id v12 = v9;

      if (v12)
      {
        if (v6)
        {
          id v14 = objc_getProperty(v6, v13, 88LL, 1);
          uint64_t v16 = v14;
          if (v14) {
            id v14 = objc_getProperty(v14, v15, 32LL, 1);
          }
        }

        else
        {
          uint64_t v16 = 0LL;
          id v14 = 0LL;
        }

        id v17 = v14;

        if (v17)
        {
          if (v6)
          {
            id v19 = objc_getProperty(v6, v18, 88LL, 1);
            uint64_t v21 = v19;
            if (v19) {
              id v19 = objc_getProperty(v19, v20, 24LL, 1);
            }
          }

          else
          {
            uint64_t v21 = 0LL;
            id v19 = 0LL;
          }

          id v22 = v19;
          uint64_t v23 = [v22 method];
          uint64_t v24 = [*(id *)(a1 + 56) method];

          if (v23 != v24)
          {
            ne_log_obj();
            id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              uint64_t v91 = *(const char **)(a1 + 32);
              if (v6)
              {
                id v92 = objc_getProperty(v6, v64, 88LL, 1);
                uint64_t v94 = v92;
                if (v92) {
                  id v92 = objc_getProperty(v92, v93, 24LL, 1);
                }
              }

              else
              {
                uint64_t v94 = 0LL;
                id v92 = 0LL;
              }

              id v95 = v92;
              uint64_t v96 = [v95 method];
              uint64_t v97 = [*(id *)(a1 + 56) method];
              *(_DWORD *)buf = 138412802;
              id v112 = v91;
              __int16 v113 = 2048;
              uint64_t v114 = v96;
              __int16 v115 = 2048;
              uint64_t v116 = v97;
              _os_log_error_impl( &dword_1876B1000,  v63,  OS_LOG_TYPE_ERROR,  "%@ Did not receive matching method from KE payload (%zu != %zu) (initiator rekey child followup KE)",  buf,  0x20u);
            }

            [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
            uint64_t v66 = *(void *)(a1 + 48);
            if (v6)
            {
              id v67 = objc_getProperty(v6, v65, 88LL, 1);
              SEL v61 = v67;
              if (v67) {
                id v67 = objc_getProperty(v67, v68, 24LL, 1);
              }
            }

            else
            {
              SEL v61 = 0LL;
              id v67 = 0LL;
            }

            id v69 = v67;
            uint64_t v70 = [v69 method];
            [*(id *)(a1 + 56) method];
            uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive matching method from KE payload (%zu != %zu) (initiator rekey child followup KE)",  v71,  v72,  v73,  v74,  v75,  v76,  v77,  v70);
            -[NEIKEv2ChildSA setState:error:](v66, 3uLL, ErrorPeerInvalidSyntax);

            goto LABEL_43;
          }

          if (v6)
          {
            id v26 = objc_getProperty(v6, v25, 88LL, 1);
            id v28 = v26;
            if (v26) {
              id v26 = objc_getProperty(v26, v27, 32LL, 1);
            }
          }

          else
          {
            id v28 = 0LL;
            id v26 = 0LL;
          }

          id v30 = v26;
          SEL v31 = *(void **)(a1 + 48);
          if (v31) {
            objc_setProperty_atomic(v31, v29, v30, 104LL);
          }

          id v33 = *(void **)(a1 + 48);
          if (v33)
          {
            id v34 = objc_getProperty(*(id *)(a1 + 48), v32, 136LL, 1);

            if (v34)
            {
              if (-[NEIKEv2ChildSA processCurrentKeyExchange](v33, v35))
              {
                id v37 = objc_getProperty(v33, v36, 136LL, 1);
                uint64_t v39 = (uint64_t *)objc_getProperty(v33, v38, 112LL, 1);
                SEL v40 = v39;
                if (v39) {
                  uint64_t v41 = v39[3];
                }
                else {
                  uint64_t v41 = 0LL;
                }
                [v37 addObject:v41];

                objc_setProperty_atomic(v33, v42, 0LL, 112LL);
                if (v6) {
                  id v44 = objc_getProperty(v6, v43, 96LL, 1);
                }
                else {
                  id v44 = 0LL;
                }
                id v46 = v44;
                id v47 = *(void **)(a1 + 48);
                if (v47) {
                  objc_setProperty_atomic(v47, v45, v46, 128LL);
                }

                -[NEIKEv2Session handleFollowupKEForRekeyChildSAInitiator:iteration:handler:]( *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 72) + 1LL,  *(void *)(a1 + 64));
                goto LABEL_44;
              }
            }

            else
            {
              ne_log_obj();
              uint64_t v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                id v112 = "-[NEIKEv2ChildSA(Crypto) processFollowupKeyExchange]";
                _os_log_fault_impl( &dword_1876B1000,  v79,  OS_LOG_TYPE_FAULT,  "%s called with null self.followupSharedSecrets",  buf,  0xCu);
              }
            }
          }

          ne_log_obj();
          uint64_t v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( &dword_1876B1000,  v80,  OS_LOG_TYPE_ERROR,  "Failed to process KE data (initiator rekey child followup KE)",  buf,  2u);
          }

          [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
          uint64_t v56 = *(void *)(a1 + 48);
          uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto( @"Failed to process KE data (initiator rekey child followup KE)",  v81,  v82,  v83,  v84,  v85,  v86,  v87,  v110);
LABEL_42:
          SEL v61 = ErrorCrypto;
          -[NEIKEv2ChildSA setState:error:](v56, 3uLL, ErrorCrypto);
LABEL_43:

          -[NEIKEv2Session reportState](*(void **)(a1 + 32), v62);
          -[NEIKEv2Session resetChild:](*(char **)(a1 + 32), *(void **)(a1 + 48));
LABEL_44:

          goto LABEL_45;
        }

        ne_log_obj();
        id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          uint64_t v90 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          id v112 = v90;
          _os_log_error_impl( &dword_1876B1000,  v59,  OS_LOG_TYPE_ERROR,  "%@ Did not receive data in KE payload (initiator rekey child followup KE)",  buf,  0xCu);
        }

        [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
        uint64_t v56 = *(void *)(a1 + 48);
        id v57 = @"Did not receive data in KE payload (initiator rekey child followup KE)";
      }

      else
      {
        ne_log_obj();
        id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          uint64_t v89 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          id v112 = v89;
          _os_log_error_impl( &dword_1876B1000,  v58,  OS_LOG_TYPE_ERROR,  "%@ Did not receive method in KE payload (initiator rekey child followup KE)",  buf,  0xCu);
        }

        [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
        uint64_t v56 = *(void *)(a1 + 48);
        id v57 = @"Did not receive method in KE payload (initiator rekey child followup KE)";
      }
    }

    else
    {
      ne_log_obj();
      id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        uint64_t v88 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        id v112 = v88;
        _os_log_error_impl( &dword_1876B1000,  v48,  OS_LOG_TYPE_ERROR,  "%@ Did not receive KE payload (initiator rekey child followup KE)",  buf,  0xCu);
      }

      [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
      uint64_t v56 = *(void *)(a1 + 48);
      id v57 = @"Did not receive KE payload (initiator rekey child followup KE)";
    }

    uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v57, v49, v50, v51, v52, v53, v54, v55, v110);
    goto LABEL_42;
  }

  ne_log_obj();
  uint64_t v98 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
  {
    SEL v109 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v112 = v109;
    _os_log_error_impl( &dword_1876B1000,  v98,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive FOLLOWUP_KE reply (initiator rekey child followup KE)",  buf,  0xCu);
  }

  [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
  uint64_t v99 = *(void *)(a1 + 48);
  uint64_t v107 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive FOLLOWUP_KE reply (initiator rekey child followup KE)",  v100,  v101,  v102,  v103,  v104,  v105,  v106,  v110);
  -[NEIKEv2ChildSA setState:error:](v99, 3uLL, v107);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v108);
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 32), *(void **)(a1 + 48));
LABEL_45:
}

- (void)handleFollowupKEForRekeyChildSAResponder:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  if (a1)
  {
    id v14 = a4;
    uint64_t v16 = (dispatch_queue_s *)objc_getProperty(a1, v15, 368LL, 1);
    dispatch_assert_queue_V2(v16);

    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __122__NEIKEv2Session_Exchange__handleFollowupKEForRekeyChildSAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke;
    v27[3] = &unk_18A08CFB0;
    uint64_t v31 = a3;
    id v17 = v11;
    id v28 = v17;
    id v29 = a1;
    id v30 = v13;
    LOBYTE(v16) = -[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v14, v27);

    if ((v16 & 1) == 0)
    {
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"%@",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)v12);
      -[NEIKEv2ChildSA setState:error:]((uint64_t)v17, 3uLL, ErrorFailedToSend);

      -[NEIKEv2Session reportState](a1, v26);
      -[NEIKEv2Session resetChild:]((char *)a1, v17);
    }
  }
}

void __122__NEIKEv2Session_Exchange__handleFollowupKEForRekeyChildSAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke( uint64_t *a1,  void *a2)
{
  uint64_t v271 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  unint64_t v5 = a1[7];
  uint64_t v6 = (void *)a1[4];
  if (v6)
  {
    id Property = objc_getProperty(v6, v3, 184LL, 1);
    id v9 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v8, 120LL, 1);
    }
  }

  else
  {
    id v9 = 0LL;
    id Property = 0LL;
  }

  id v10 = Property;
  unint64_t v11 = [v10 count];

  if (v5 < v11)
  {
    if (!a1[7])
    {
      id v13 = objc_alloc(MEMORY[0x189603FA8]);
      id v14 = (void *)a1[4];
      if (v14)
      {
        id v15 = objc_getProperty(v14, v12, 184LL, 1);
        id v17 = v15;
        if (v15) {
          id v15 = objc_getProperty(v15, v16, 120LL, 1);
        }
      }

      else
      {
        id v17 = 0LL;
        id v15 = 0LL;
      }

      id v18 = v15;
      uint64_t v20 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v18, "count"));
      uint64_t v21 = (void *)a1[4];
      if (v21) {
        objc_setProperty_atomic(v21, v19, v20, 136LL);
      }
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v23 = v4;
      uint64_t v24 = (void *)a1[4];
      if (v24)
      {
        id v25 = objc_getProperty(v24, v22, 184LL, 1);
        uint64_t v27 = v25;
        if (v25) {
          id v25 = objc_getProperty(v25, v26, 120LL, 1);
        }
      }

      else
      {
        uint64_t v27 = 0LL;
        id v25 = 0LL;
      }

      id v28 = v25;
      [v28 objectAtIndexedSubscript:a1[7]];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();

      id v31 = (id)a1[4];
      if (v31) {
        id v31 = objc_getProperty(v31, v30, 184LL, 1);
      }
      id v32 = v31;
      -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v32);
      id v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 objectForKeyedSubscript:v29];
      id v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
        ne_log_obj();
        int v252 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v252, OS_LOG_TYPE_ERROR))
        {
          uint64_t v262 = a1[5];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v262;
          *(_WORD *)&_BYTE buf[12] = 2112;
          *(void *)&buf[14] = v29;
          _os_log_error_impl( &dword_1876B1000,  v252,  OS_LOG_TYPE_ERROR,  "%@ No chosen KEM found for transform type %@ (responder rekey child followup KE)",  buf,  0x16u);
        }

        uint64_t v79 = a1[4];
        uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"No chosen KEM found for transform type %@ (responder rekey child followup KE)",  v253,  v254,  v255,  v256,  v257,  v258,  v259,  (uint64_t)v29);
        goto LABEL_68;
      }

      if (v23) {
        id v36 = objc_getProperty(v23, v35, 88LL, 1);
      }
      else {
        id v36 = 0LL;
      }
      id v37 = v36;

      if (v37)
      {
        if (v23)
        {
          id v39 = objc_getProperty(v23, v38, 88LL, 1);
          uint64_t v41 = v39;
          if (v39) {
            id v39 = objc_getProperty(v39, v40, 24LL, 1);
          }
        }

        else
        {
          uint64_t v41 = 0LL;
          id v39 = 0LL;
        }

        id v42 = v39;

        if (v42)
        {
          if (v23)
          {
            id v44 = objc_getProperty(v23, v43, 88LL, 1);
            id v46 = v44;
            if (v44) {
              id v44 = objc_getProperty(v44, v45, 32LL, 1);
            }
          }

          else
          {
            id v46 = 0LL;
            id v44 = 0LL;
          }

          id v47 = v44;

          if (v47)
          {
            if (v23)
            {
              id v49 = objc_getProperty(v23, v48, 88LL, 1);
              uint64_t v51 = v49;
              if (v49) {
                id v49 = objc_getProperty(v49, v50, 24LL, 1);
              }
            }

            else
            {
              uint64_t v51 = 0LL;
              id v49 = 0LL;
            }

            id v52 = v49;
            uint64_t v53 = [v52 method];
            uint64_t v54 = [v34 method];

            if (v53 != v54)
            {
              ne_log_obj();
              __int16 v113 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              {
                __int128 v267 = v29;
                uint64_t v183 = a1[5];
                if (v23)
                {
                  id v184 = objc_getProperty(v23, v114, 88LL, 1);
                  id v186 = v184;
                  if (v184) {
                    id v184 = objc_getProperty(v184, v185, 24LL, 1);
                  }
                }

                else
                {
                  id v186 = 0LL;
                  id v184 = 0LL;
                }

                id v187 = v184;
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v183;
                *(_WORD *)&_BYTE buf[12] = 2048;
                *(void *)&buf[14] = [v187 method];
                __int16 v269 = 2048;
                uint64_t v270 = [v34 method];
                _os_log_error_impl( &dword_1876B1000,  v113,  OS_LOG_TYPE_ERROR,  "%@ Did not receive matching method from KE payload (%zu != %zu) (responder rekey child followup KE)",  buf,  0x20u);

                id v29 = v267;
              }

              uint64_t v116 = a1[4];
              if (v23)
              {
                id v117 = objc_getProperty(v23, v115, 88LL, 1);
                id v111 = v117;
                if (v117) {
                  id v117 = objc_getProperty(v117, v118, 24LL, 1);
                }
              }

              else
              {
                id v111 = 0LL;
                id v117 = 0LL;
              }

              id v119 = v117;
              uint64_t v120 = [v119 method];
              [v34 method];
              uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive matching method from KE payload (%zu != %zu) (responder rekey child followup KE)",  v121,  v122,  v123,  v124,  v125,  v126,  v127,  v120);
              -[NEIKEv2ChildSA setState:error:](v116, 3uLL, ErrorPeerInvalidSyntax);

              goto LABEL_69;
            }

            if (v23)
            {
              id v56 = objc_getProperty(v23, v55, 96LL, 1);
              id v58 = v56;
              if (v56) {
                id v56 = objc_getProperty(v56, v57, 32LL, 1);
              }
            }

            else
            {
              id v58 = 0LL;
              id v56 = 0LL;
            }

            id v60 = v56;
            SEL v61 = (void *)a1[4];
            id v266 = v29;
            if (v61)
            {
              id v62 = objc_getProperty(v61, v59, 128LL, 1);
              char v64 = v62;
              if (v62) {
                id v62 = objc_getProperty(v62, v63, 32LL, 1);
              }
            }

            else
            {
              char v64 = 0LL;
              id v62 = 0LL;
            }

            id v65 = v62;
            char v66 = [v60 isEqualToData:v65];

            if ((v66 & 1) == 0)
            {
              ne_log_obj();
              uint64_t v129 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              uint64_t v131 = &off_18A087000;
              if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
              {
                uint64_t v239 = a1[5];
                if (v23)
                {
                  id v240 = objc_getProperty(v23, v130, 96LL, 1);
                  SEL v242 = v240;
                  if (v240) {
                    id v240 = objc_getProperty(v240, v241, 32LL, 1);
                  }
                }

                else
                {
                  SEL v242 = 0LL;
                  id v240 = 0LL;
                }

                id v244 = v240;
                uint64_t v245 = (void *)a1[4];
                if (v245)
                {
                  id v246 = objc_getProperty(v245, v243, 128LL, 1);
                  char v248 = v246;
                  if (v246) {
                    id v246 = objc_getProperty(v246, v247, 32LL, 1);
                  }
                }

                else
                {
                  char v248 = 0LL;
                  id v246 = 0LL;
                }

                id v249 = v246;
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v239;
                *(_WORD *)&_BYTE buf[12] = 2112;
                *(void *)&buf[14] = v244;
                __int16 v269 = 2112;
                uint64_t v270 = (uint64_t)v249;
                _os_log_error_impl( &dword_1876B1000,  v129,  OS_LOG_TYPE_ERROR,  "%@ ADDITIONAL_KEY_EXCHANGE in FOLLOWUP_KE request doesn't match expected (%@ != %@) (responder rekey c hild followup KE)",  buf,  0x20u);

                uint64_t v131 = &off_18A087000;
              }

              uint64_t v132 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)objc_alloc((Class)v131[338]), v23);
              uint64_t v133 = v132;
              id v29 = v266;
              if (v132) {
                -[NEIKEv2Packet addNotification:data:](v132, 0x2FuLL, 0LL);
              }
              char v134 = -[NEIKEv2Session sendReply:replyHandler:](a1[5], v133, 0LL);
              uint64_t v142 = a1[4];
              if ((v134 & 1) != 0)
              {
                uint64_t v265 = a1[4];
                if (v23)
                {
                  id v143 = objc_getProperty(v23, v135, 96LL, 1);
                  ErrorFailedToSend = v143;
                  if (v143) {
                    id v143 = objc_getProperty(v143, v144, 32LL, 1);
                  }
                }

                else
                {
                  ErrorFailedToSend = 0LL;
                  id v143 = 0LL;
                }

                id v147 = v143;
                id v148 = (void *)a1[4];
                if (v148)
                {
                  id v149 = objc_getProperty(v148, v146, 128LL, 1);
                  char v151 = v149;
                  if (v149) {
                    id v149 = objc_getProperty(v149, v150, 32LL, 1);
                  }
                }

                else
                {
                  char v151 = 0LL;
                  id v149 = 0LL;
                }

                id v264 = v149;
                uint64_t v159 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"ADDITIONAL_KEY_EXCHANGE in FOLLOWUP_KE request doesn't match expected (%@ != %@) (responder rekey child followup KE)",  v152,  v153,  v154,  v155,  v156,  v157,  v158,  (uint64_t)v147);
                -[NEIKEv2ChildSA setState:error:](v265, 3uLL, v159);

                id v29 = v266;
                goto LABEL_90;
              }

              ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"responder rekey child followup KE mismatched link",  (uint64_t)v135,  v136,  v137,  v138,  v139,  v140,  v141,  v263);
              uint64_t v160 = v142;
LABEL_89:
              -[NEIKEv2ChildSA setState:error:](v160, 3uLL, ErrorFailedToSend);
LABEL_90:

              -[NEIKEv2Session reportState]((void *)a1[5], v161);
              -[NEIKEv2Session resetChild:]((char *)a1[5], (void *)a1[4]);
LABEL_91:

              goto LABEL_70;
            }

            uint64_t v68 = (void *)a1[4];
            if (v23)
            {
              id v69 = objc_getProperty(v23, v67, 88LL, 1);
              uint64_t v71 = v69;
              id v29 = v266;
              if (v69) {
                id v69 = objc_getProperty(v69, v70, 32LL, 1);
              }
            }

            else
            {
              uint64_t v71 = 0LL;
              id v69 = 0LL;
              id v29 = v266;
            }

            id v72 = v69;
            id v73 = v34;
            id v75 = v72;
            if (!v68) {
              goto LABEL_49;
            }
            id v76 = objc_getProperty(v68, v74, 112LL, 1);

            if (v76)
            {
              ne_log_obj();
              uint64_t v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "-[NEIKEv2ChildSA(Crypto) generateLocalValuesForKEMProtocol:peerPayload:]";
                _os_log_fault_impl( &dword_1876B1000,  v77,  OS_LOG_TYPE_FAULT,  "%s called with null !self.currentKEHandler",  buf,  0xCu);
              }

- (void)initiateRekeyChildSA:(_BYTE *)a1
{
  uint64_t v124 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  uint64_t v6 = (dispatch_queue_s *)Property;
  dispatch_assert_queue_V2(v6);

  if (!a1[15]) {
    __assert_rtn( "-[NEIKEv2Session(Exchange) initiateRekeyChildSA:]",  "NEIKEv2Exchange.m",  2024,  "self.hasOutboundRequestInFlight");
  }
  id v8 = objc_getProperty(a1, v7, 336LL, 1);
  if (v4) {
    id v9 = (const char *)v4[6];
  }
  else {
    id v9 = 0LL;
  }
  id v10 = -[NEIKEv2Session copyChildWithID:](a1, v9);
  id v12 = v10;
  if (!v8)
  {
    ne_log_obj();
    uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v121 = "-[NEIKEv2Session(Exchange) initiateRekeyChildSA:]";
    uint64_t v101 = "%s called with null ikeSA";
    goto LABEL_70;
  }

  if (!v10)
  {
    ne_log_obj();
    uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v121 = "-[NEIKEv2Session(Exchange) initiateRekeyChildSA:]";
    uint64_t v101 = "%s called with null childSA";
    goto LABEL_70;
  }

  BOOL v13 = -[NEIKEv2ChildSA isRekeying](v10, v11);
  ne_log_large_obj();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v121 = a1;
      __int16 v122 = 2112;
      uint64_t v123 = v12;
      _os_log_debug_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_DEBUG,  "%@ Child SA %@ already rekeying, skipping",  buf,  0x16u);
    }

    uint64_t v16 = v4;
    uint64_t v17 = 1LL;
    goto LABEL_40;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v121 = a1;
    __int16 v122 = 2112;
    uint64_t v123 = v12;
    _os_log_impl(&dword_1876B1000, v15, OS_LOG_TYPE_INFO, "%@ Rekey Child SA %@", buf, 0x16u);
  }

  id v19 = objc_getProperty(v12, v18, 56LL, 1);
  if (v19)
  {
    id v21 = objc_getProperty(v12, v20, 56LL, 1);
    id v23 = v21;
    if (v21) {
      id v21 = objc_getProperty(v21, v22, 80LL, 1);
    }
    id v24 = v21;

    id v26 = objc_getProperty(v12, v25, 56LL, 1);
    id v28 = v26;
    if (v26) {
      id v26 = objc_getProperty(v26, v27, 88LL, 1);
    }
    id v29 = v26;

    id v31 = objc_getProperty(v12, v30, 48LL, 1);
    [v31 proposals];
    id v32 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v107 = v32;
    if ([v32 count] == 1
      && (id v34 = objc_getProperty(v12, v33, 48LL, 1),
          char v35 = [v34 opportunisticPFS],
          v34,
          (v35 & 1) == 0))
    {
      [v107 objectAtIndexedSubscript:0];
      id v56 = (void *)objc_claimAutoreleasedReturnValue();
      SEL v38 = -[NEIKEv2ChildSAProposal copyForRekey](v56);

      if (v38) {
        v38[8] = 1;
      }
      id v119 = v38;
      [MEMORY[0x189603F18] arrayWithObjects:&v119 count:1];
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v12, v57, v39, 176LL);
    }

    else
    {
      id v103 = v29;
      id v104 = v24;
      id v105 = v8;
      uint64_t v106 = v4;
      id v36 = objc_getProperty(v12, v33, 56LL, 1);
      id v37 = -[NEIKEv2ChildSAProposal copyForRekey](v36);
      SEL v38 = -[NEIKEv2ChildSAProposal copyWithoutKEM](v37);

      id v39 = objc_alloc_init(MEMORY[0x189603FD0]);
      __int128 v114 = 0u;
      __int128 v115 = 0u;
      __int128 v116 = 0u;
      __int128 v117 = 0u;
      id v40 = v107;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v114 objects:v118 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v115;
        do
        {
          for (uint64_t i = 0LL; i != v42; ++i)
          {
            if (*(void *)v115 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = -[NEIKEv2ChildSAProposal copyForRekey](*(void **)(*((void *)&v114 + 1) + 8 * i));
            id v46 = -[NEIKEv2ChildSAProposal copyWithoutKEM](v45);
            if ([v46 isEqual:v38])
            {
              char v47 = [v39 count];
              if (v45) {
                v45[8] = v47 + 1;
              }
              objc_msgSend(v39, "addObject:", v45, v103);
            }
          }

          uint64_t v42 = [v40 countByEnumeratingWithState:&v114 objects:v118 count:16];
        }

        while (v42);
      }

      id v49 = objc_getProperty(v12, v48, 48LL, 1);
      int v50 = [v49 opportunisticPFS];

      id v8 = v105;
      id v4 = v106;
      id v29 = v103;
      id v24 = v104;
      if (v50)
      {
        char v51 = [v39 count];
        if (v38) {
          v38[8] = v51 + 1;
        }
        objc_msgSend(v39, "addObject:", v38, v103);
      }

      if (objc_msgSend(v39, "count", v103))
      {
        [v39 array];
        id v52 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v53 = (void *)[v52 copy];
        objc_setProperty_atomic(v12, v54, v53, 176LL);
      }
    }

    id v59 = objc_getProperty(v12, v58, 176LL, 1);
    if (!v59)
    {
      ne_log_obj();
      uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v121 = "-[NEIKEv2Session(Exchange) initiateRekeyChildSA:]";
        _os_log_fault_impl( &dword_1876B1000,  v78,  OS_LOG_TYPE_FAULT,  "%s called with null childSA.rekeyRequestProposals",  buf,  0xCu);
      }

      [v4 sendCallbackSuccess:0 session:a1];
      goto LABEL_67;
    }

    id v61 = objc_getProperty(v12, v60, 176LL, 1);
    char v62 = -[NEIKEv2Session generateSPIForChild:proposals:](a1, v12, v61);

    if ((v62 & 1) != 0)
    {
      if ((-[NEIKEv2ChildSA generateInitialValues]((id *)v12) & 1) != 0)
      {
        +[NEIKEv2CreateChildPacket createRekeyRequestChildSA:]((uint64_t)&OBJC_CLASS___NEIKEv2CreateChildPacket, v12);
        id v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63)
        {
          v108[0] = MEMORY[0x1895F87A8];
          v108[1] = 3221225472LL;
          v108[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke;
          v108[3] = &unk_18A08D230;
          char v64 = v4;
          SEL v109 = v64;
          uint64_t v110 = a1;
          id v111 = v12;
          id v112 = v24;
          id v113 = v29;
          if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v63, v108) == -1)
          {
            [v64 sendCallbackSuccess:0 session:a1];
            if (a1) {
              id v66 = objc_getProperty(a1, v65, 336LL, 1);
            }
            else {
              id v66 = 0LL;
            }
            id v67 = v66;
            ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"initiator rekey child SA",  v68,  v69,  v70,  v71,  v72,  v73,  v74,  v102);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v67, 3uLL, ErrorFailedToSend);

            -[NEIKEv2Session reportState](a1, v76);
            -[NEIKEv2Session resetAll]((uint64_t)a1, v77);
          }
        }

        else
        {
          ne_log_obj();
          uint64_t v91 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( &dword_1876B1000,  v91,  OS_LOG_TYPE_ERROR,  "Failed to create Create Child SA packet",  buf,  2u);
          }

          [v4 sendCallbackSuccess:0 session:a1];
          uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create Create Child SA packet",  v92,  v93,  v94,  v95,  v96,  v97,  v98,  v102);
          -[NEIKEv2ChildSA setState:error:]((uint64_t)v12, 3uLL, ErrorInternal);

          -[NEIKEv2Session reportState](a1, v100);
          -[NEIKEv2Session resetChild:](a1, v12);
        }

        goto LABEL_67;
      }

      ne_log_obj();
      uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v88,  OS_LOG_TYPE_ERROR,  "Failed to generate local Child crypto values",  buf,  2u);
      }

      [v4 sendCallbackSuccess:0 session:a1];
      uint64_t v87 = @"Failed to generate local Child crypto values";
    }

    else
    {
      ne_log_obj();
      uint64_t v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1876B1000, v79, OS_LOG_TYPE_ERROR, "Failed to generate Child SA SPI", buf, 2u);
      }

      [v4 sendCallbackSuccess:0 session:a1];
      uint64_t v87 = @"Failed to generate Child SA SPI";
    }

    uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(v87, v80, v81, v82, v83, v84, v85, v86, v102);
    -[NEIKEv2ChildSA setState:error:]((uint64_t)v12, 3uLL, ErrorCrypto);

    -[NEIKEv2Session reportState](a1, v90);
    -[NEIKEv2Session resetChild:](a1, v12);
LABEL_67:

    goto LABEL_68;
  }

  ne_log_obj();
  uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v121 = "-[NEIKEv2Session(Exchange) initiateRekeyChildSA:]";
    uint64_t v101 = "%s called with null childSA.chosenProposal";
LABEL_70:
    _os_log_fault_impl(&dword_1876B1000, v55, OS_LOG_TYPE_FAULT, v101, buf, 0xCu);
  }

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v128 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v4 = -[NEIKEv2CreateChildPacket validateRekeyResponseChildSA:]((uint64_t)v3, *(void **)(a1 + 48));
    unint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    v105[0] = MEMORY[0x1895F87A8];
    v105[1] = 3221225472LL;
    uint64_t v106 = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_313;
    uint64_t v107 = &unk_18A08D208;
    uint32_t v108 = v6;
    id v109 = *(id *)(a1 + 48);
    id v110 = *(id *)(a1 + 32);
    id v111 = *(id *)(a1 + 56);
    id v112 = *(id *)(a1 + 64);
    id v7 = v5;
    id v9 = v105;
    if (v6)
    {
      id v10 = (dispatch_queue_s *)objc_getProperty(v6, v8, 368LL, 1);
      dispatch_assert_queue_V2(v10);

      if (v7) {
        unint64_t v11 = (const char *)v7[6];
      }
      else {
        unint64_t v11 = 0LL;
      }
      id v12 = -[NEIKEv2Session copyChildWithID:](v6, v11);
      id v14 = v12;
      if ((v4 & 1) != 0
        || (!v12 ? (id v15 = 0LL) : (id v15 = objc_getProperty(v12, v13, 96LL, 1)),
            id v16 = v15,
            v16,
            !v16))
      {
        v106((uint64_t)v9, (const char *)v4);
      }

      else
      {
        if (v14) {
          objc_setProperty_atomic(v14, v17, 0LL, 112LL);
        }
        ne_log_obj();
        SEL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          if (v14) {
            id Property = objc_getProperty(v14, v19, 96LL, 1);
          }
          else {
            id Property = 0LL;
          }
          id v21 = Property;
          uint64_t v22 = [v21 method];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v6;
          *(_WORD *)&_BYTE buf[12] = 2048;
          *(void *)&buf[14] = v22;
          _os_log_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_INFO,  "%@ Received KE method preference %tu, retrying rekey Child SA (child rekey retry KE)",  buf,  0x16u);
        }

        id v103 = v9;
        id v104 = v7;

        if (v14) {
          id v24 = objc_getProperty(v14, v23, 96LL, 1);
        }
        else {
          id v24 = 0LL;
        }
        id v25 = v24;
        uint64_t v27 = [v25 method];
        if (v14) {
          id v28 = objc_getProperty(v14, v26, 176LL, 1);
        }
        else {
          id v28 = 0LL;
        }
        id v29 = v28;
        objc_opt_self();
        __int128 v117 = 0u;
        __int128 v118 = 0u;
        __int128 v119 = 0u;
        __int128 v120 = 0u;
        id v30 = v29;
        uint64_t v102 = [v30 countByEnumeratingWithState:&v117 objects:buf count:16];
        if (v102)
        {
          uint64_t v31 = *(void *)v118;
          uint64_t v100 = *(void *)v118;
          uint64_t v101 = v25;
          while (2)
          {
            for (uint64_t i = 0LL; i != v102; ++i)
            {
              if (*(void *)v118 != v31) {
                objc_enumerationMutation(v30);
              }
              id v33 = *(void **)(*((void *)&v117 + 1) + 8 * i);
              __int128 v113 = 0u;
              __int128 v114 = 0u;
              __int128 v115 = 0u;
              __int128 v116 = 0u;
              [v33 kemProtocols];
              id v34 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v35 = [v34 countByEnumeratingWithState:&v113 objects:v121 count:16];
              if (v35)
              {
                uint64_t v36 = v35;
                uint64_t v37 = *(void *)v114;
LABEL_26:
                uint64_t v38 = 0LL;
                while (1)
                {
                  if (*(void *)v114 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  if ([*(id *)(*((void *)&v113 + 1) + 8 * v38) method] == v27) {
                    break;
                  }
                  if (v36 == ++v38)
                  {
                    uint64_t v36 = [v34 countByEnumeratingWithState:&v113 objects:v121 count:16];
                    if (v36) {
                      goto LABEL_26;
                    }
                    goto LABEL_32;
                  }
                }

                if ((-[NEIKEv2ChildSA generateInitialValues]((id *)v14) & 1) != 0)
                {
                  +[NEIKEv2CreateChildPacket createRekeyRequestChildSA:]( (uint64_t)&OBJC_CLASS___NEIKEv2CreateChildPacket,  v14);
                  char v64 = (void *)objc_claimAutoreleasedReturnValue();
                  id v9 = v103;
                  id v7 = v104;
                  if (v64)
                  {
                    *(void *)buf = MEMORY[0x1895F87A8];
                    *(void *)&uint8_t buf[8] = 3221225472LL;
                    *(void *)&uint8_t buf[16] = __69__NEIKEv2Session_Exchange__retryKEForRekeyChildSA_validated_handler___block_invoke;
                    uint64_t v123 = &unk_18A08D168;
                    uint64_t v124 = v6;
                    uint64_t v125 = v104;
                    id v126 = v14;
                    uint64_t v127 = v103;
                    if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)v6, v64, buf) == -1)
                    {
                      id v66 = objc_getProperty(v6, v65, 336LL, 1);
                      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"child rekey retry KE",  v67,  v68,  v69,  v70,  v71,  v72,  v73,  v99);
                      -[NEIKEv2IKESA setState:error:]((uint64_t)v66, 3uLL, ErrorFailedToSend);

                      -[NEIKEv2Session reportState](v6, v75);
                      -[NEIKEv2Session resetAll]((uint64_t)v6, v76);
                    }
                  }

                  else
                  {
                    ne_log_obj();
                    uint64_t v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v6;
                      _os_log_error_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_ERROR,  "%@ Failed to create Create Child SA packet (child rekey retry KE)",  buf,  0xCu);
                    }

                    [v104 sendCallbackSuccess:0 session:v6];
                    uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create Create Child SA packet (child rekey retry KE)",  v87,  v88,  v89,  v90,  v91,  v92,  v93,  v99);
                    -[NEIKEv2ChildSA setState:error:]((uint64_t)v14, 3uLL, ErrorInternal);

                    -[NEIKEv2Session reportState](v6, v95);
                    -[NEIKEv2Session resetChild:]((char *)v6, v14);
                  }

                  goto LABEL_55;
                }

                ne_log_obj();
                uint64_t v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                id v9 = v103;
                id v7 = v104;
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v6;
                  _os_log_error_impl( &dword_1876B1000,  v77,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate local Child crypto values (child rekey retry KE)",  buf,  0xCu);
                }

                [v104 sendCallbackSuccess:0 session:v6];
                id ErrorCrypto = (id)NEIKEv2CreateErrorCrypto( @"Failed to generate local Child crypto values (child rekey retry KE)",  v78,  v79,  v80,  v81,  v82,  v83,  v84,  v99);
                -[NEIKEv2ChildSA setState:error:]((uint64_t)v14, 3uLL, ErrorCrypto);
                goto LABEL_50;
              }

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_313(uint64_t a1, const char *a2)
{
  if ((a2 & 1) == 0)
  {
    ne_log_obj();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v17, OS_LOG_TYPE_ERROR, "Failed to process Create Child SA packet", buf, 2u);
    }

    uint64_t v20 = *(void **)(a1 + 32);
    id v19 = *(void **)(a1 + 40);
    if (v19)
    {
      id Property = objc_getProperty(v19, v18, 56LL, 1);
      id v16 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v22, 80LL, 1);
      }
    }

    else
    {
      id v16 = 0LL;
      id Property = 0LL;
    }

    id v24 = Property;
    id v25 = *(void **)(a1 + 40);
    if (v25)
    {
      id v26 = objc_getProperty(v25, v23, 56LL, 1);
      id v28 = v26;
      if (v26) {
        id v26 = objc_getProperty(v26, v27, 88LL, 1);
      }
    }

    else
    {
      id v28 = 0LL;
      id v26 = 0LL;
    }

    id v29 = v26;
    v54[0] = MEMORY[0x1895F87A8];
    v54[1] = 3221225472LL;
    v54[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_314;
    v54[3] = &unk_18A08D118;
    id v10 = (id *)v55;
    id v30 = *(id *)(a1 + 48);
    uint64_t v31 = *(void *)(a1 + 32);
    id v32 = *(void **)(a1 + 40);
    v55[0] = v30;
    v55[1] = v31;
    id v15 = &v56;
    id v56 = v32;
    id v33 = v54;
    goto LABEL_17;
  }

  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = objc_getProperty(v3, a2, 56LL, 1);
    uint64_t v6 = v4;
    if (v4) {
      id v4 = objc_getProperty(v4, v5, 112LL, 1);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    id v4 = 0LL;
  }

  id v7 = v4;
  uint64_t v8 = [v7 method];

  if (v8 && (-[NEIKEv2ChildSA processPrimaryKeyExchange](*(void *)(a1 + 40), v9) & 1) == 0)
  {
    ne_log_obj();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v34, OS_LOG_TYPE_ERROR, "Failed to process KE data", buf, 2u);
    }

    uint64_t v20 = *(void **)(a1 + 32);
    uint64_t v36 = *(void **)(a1 + 40);
    if (v36)
    {
      id v37 = objc_getProperty(v36, v35, 56LL, 1);
      id v16 = v37;
      if (v37) {
        id v37 = objc_getProperty(v37, v38, 80LL, 1);
      }
    }

    else
    {
      id v16 = 0LL;
      id v37 = 0LL;
    }

    id v24 = v37;
    id v40 = *(void **)(a1 + 40);
    if (v40)
    {
      id v41 = objc_getProperty(v40, v39, 56LL, 1);
      id v28 = v41;
      if (v41) {
        id v41 = objc_getProperty(v41, v42, 88LL, 1);
      }
    }

    else
    {
      id v28 = 0LL;
      id v41 = 0LL;
    }

    id v29 = v41;
    v51[0] = MEMORY[0x1895F87A8];
    v51[1] = 3221225472LL;
    v51[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_315;
    v51[3] = &unk_18A08D118;
    id v10 = (id *)v52;
    id v43 = *(id *)(a1 + 48);
    uint64_t v44 = *(void *)(a1 + 32);
    uint64_t v45 = *(void **)(a1 + 40);
    v52[0] = v43;
    v52[1] = v44;
    id v15 = &v53;
    id v53 = v45;
    id v33 = v51;
LABEL_17:
    -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](v20, v24, v29, v33);

    goto LABEL_18;
  }

  v46[0] = MEMORY[0x1895F87A8];
  v46[1] = 3221225472LL;
  v46[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_2;
  v46[3] = &unk_18A08D1E0;
  id v10 = (id *)v47;
  unint64_t v11 = *(void **)(a1 + 32);
  id v12 = *(void **)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  v47[0] = v13;
  v47[1] = v14;
  id v15 = &v48;
  id v48 = *(id *)(a1 + 48);
  id v49 = *(id *)(a1 + 56);
  id v50 = *(id *)(a1 + 64);
  -[NEIKEv2Session handleFollowupKEForRekeyChildSAInitiator:iteration:handler:](v11, v12, 0LL, v46);

  id v16 = v49;
LABEL_18:
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_314(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to process Create Child SA packet",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v12);
  -[NEIKEv2ChildSA setState:error:](v2, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v11);
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 40), *(void **)(a1 + 48));
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_315(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to process KE data", v3, v4, v5, v6, v7, v8, v9, v12);
  -[NEIKEv2ChildSA setState:error:](v2, 3uLL, ErrorCrypto);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v11);
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 40), *(void **)(a1 + 48));
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_2(void **a1)
{
  if ((-[NEIKEv2ChildSA generateAllValues]((uint64_t)a1[4]) & 1) != 0)
  {
    id v2 = -[NEIKEv2Session copySAsToDeleteAndInstallRekeyedChildSA:](a1[5], a1[4]);
    if (v2)
    {
      uint64_t v4 = v2;
      uint64_t v5 = a1[4];
      if (v5)
      {
        objc_setProperty_atomic(v5, v3, a1[7], 192LL);
        uint64_t v7 = a1[4];
        if (v7) {
          objc_setProperty_atomic(v7, v6, a1[8], 200LL);
        }
      }

      uint64_t v8 = a1[5];
      uint64_t v9 = a1[7];
      id v10 = a1[8];
      v44[0] = MEMORY[0x1895F87A8];
      v44[1] = 3221225472LL;
      v44[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_2_318;
      v44[3] = &unk_18A08D1B8;
      v44[4] = v8;
      id v11 = v4;
      id v45 = v11;
      id v46 = a1[4];
      id v47 = a1[6];
      -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](v8, v9, v10, v44);
    }

    else
    {
      ne_log_obj();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1876B1000, v27, OS_LOG_TYPE_ERROR, "Failed to install Child SA", buf, 2u);
      }

      id v29 = a1[4];
      id v30 = a1[5];
      if (v29)
      {
        id Property = objc_getProperty(v29, v28, 56LL, 1);
        id v33 = Property;
        if (Property) {
          id Property = objc_getProperty(Property, v32, 80LL, 1);
        }
      }

      else
      {
        id v33 = 0LL;
        id Property = 0LL;
      }

      id v35 = Property;
      uint64_t v36 = a1[4];
      if (v36)
      {
        id v37 = objc_getProperty(v36, v34, 56LL, 1);
        id v39 = v37;
        if (v37) {
          id v37 = objc_getProperty(v37, v38, 88LL, 1);
        }
      }

      else
      {
        id v39 = 0LL;
        id v37 = 0LL;
      }

      id v40 = v37;
      v48[0] = MEMORY[0x1895F87A8];
      v48[1] = 3221225472LL;
      v48[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_317;
      v48[3] = &unk_18A08D118;
      id v49 = a1[6];
      int8x16_t v43 = *((int8x16_t *)a1 + 2);
      id v41 = (id)v43.i64[0];
      int8x16_t v50 = vextq_s8(v43, v43, 8uLL);
      -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](v30, v35, v40, v48);

      id v11 = 0LL;
    }
  }

  else
  {
    ne_log_obj();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v12, OS_LOG_TYPE_ERROR, "Failed to generate Child SA crypto values", buf, 2u);
    }

    uint64_t v14 = a1[4];
    id v15 = a1[5];
    if (v14)
    {
      id v16 = objc_getProperty(v14, v13, 56LL, 1);
      SEL v18 = v16;
      if (v16) {
        id v16 = objc_getProperty(v16, v17, 80LL, 1);
      }
    }

    else
    {
      SEL v18 = 0LL;
      id v16 = 0LL;
    }

    id v20 = v16;
    id v21 = a1[4];
    if (v21)
    {
      id v22 = objc_getProperty(v21, v19, 56LL, 1);
      id v24 = v22;
      if (v22) {
        id v22 = objc_getProperty(v22, v23, 88LL, 1);
      }
    }

    else
    {
      id v24 = 0LL;
      id v22 = 0LL;
    }

    id v25 = v22;
    v51[0] = MEMORY[0x1895F87A8];
    v51[1] = 3221225472LL;
    v51[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_316;
    v51[3] = &unk_18A08D118;
    id v52 = a1[6];
    int8x16_t v42 = *((int8x16_t *)a1 + 2);
    id v26 = (id)v42.i64[0];
    int8x16_t v53 = vextq_s8(v42, v42, 8uLL);
    -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](v15, v20, v25, v51);

    id v11 = v52;
  }
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_316(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto( @"Failed to generate Child SA crypto values",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v12);
  -[NEIKEv2ChildSA setState:error:](v2, 3uLL, ErrorCrypto);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v11);
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 40), *(void **)(a1 + 48));
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_317(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to install Child SA",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v12);
  -[NEIKEv2ChildSA setState:error:](v2, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v11);
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 40), *(void **)(a1 + 48));
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_2_318(uint64_t a1, int a2)
{
  if (a2)
  {
    -[NEIKEv2Session uninstallOldRekeyedChildSAs:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    uint64_t v4 = *(void **)(a1 + 48);
    if (v4)
    {
      objc_setProperty_atomic(v4, v3, 0LL, 192LL);
      uint64_t v6 = *(void **)(a1 + 48);
      if (v6) {
        objc_setProperty_atomic(v6, v5, 0LL, 200LL);
      }
    }

    ne_log_obj();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_INFO, "Rekeyed Child SA", (uint8_t *)&v19, 2u);
    }

    -[NEIKEv2ChildSA setState:error:](*(void *)(a1 + 48), 2uLL, 0LL);
    -[NEIKEv2Session reportState](*(void **)(a1 + 32), v8);
    [*(id *)(a1 + 56) sendCallbackSuccess:1 session:*(void *)(a1 + 32)];
  }

  else
  {
    [*(id *)(a1 + 56) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to delete old Child SA",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v19);
    -[NEIKEv2ChildSA setState:error:](v9, 3uLL, ErrorInternal);

    -[NEIKEv2Session reportState](*(void **)(a1 + 32), v18);
    -[NEIKEv2Session resetChild:](*(char **)(a1 + 32), *(void **)(a1 + 48));
  }

- (void)receiveRekeyChildSA:(void *)a3 packet:
{
  uint64_t v372 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    uint64_t v8 = (dispatch_queue_s *)objc_getProperty(a1, v6, 368LL, 1);
    dispatch_assert_queue_V2(v8);

    id v11 = objc_getProperty(a1, v9, 336LL, 1);
    if (v11)
    {
      if (v5)
      {
        if (-[NEIKEv2ChildSA isRekeying](v5, v10))
        {
          ne_log_obj();
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1876B1000, v13, OS_LOG_TYPE_DEBUG, "Child SA already rekeying, skipping", buf, 2u);
          }

          goto LABEL_68;
        }

        id v14 = objc_getProperty(v5, v12, 56LL, 1);

        if (v14)
        {
          id Property = objc_getProperty(v5, v15, 56LL, 1);
          SEL v18 = Property;
          if (Property) {
            id Property = objc_getProperty(Property, v17, 80LL, 1);
          }
          uint64_t v13 = (os_log_s *)Property;

          id v20 = objc_getProperty(v5, v19, 56LL, 1);
          id v22 = v20;
          if (v20) {
            id v20 = objc_getProperty(v20, v21, 88LL, 1);
          }
          id v353 = v20;

          objc_setProperty_atomic(v5, v23, 0LL, 184LL);
          id v24 = (id *)v5;
          else {
            uint64_t v26 = 2LL;
          }
          id v27 = objc_getProperty(v24, v25, 48LL, 1);
          uint64_t v28 = [v27 mode];

          if (v26 != v28)
          {
            ne_log_obj();
            uint64_t v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              uint64_t v107 = (void *)[v7 copyShortDescription];
              *(_DWORD *)SEL v361 = 138412290;
              id v362 = v107;
              _os_log_error_impl( &dword_1876B1000,  v80,  OS_LOG_TYPE_ERROR,  "%@ Transport mode Child SA did not match",  v361,  0xCu);
            }

            unint64_t v81 = 7LL;
            goto LABEL_51;
          }

          objc_getProperty(v7, v29, 96LL, 1);
          id v30 = (void *)objc_claimAutoreleasedReturnValue();
          id v32 = v30;
          self = v7;
          if (v30) {
            id v30 = objc_getProperty(v30, v31, 24LL, 1);
          }
          id v33 = v30;

          id v35 = objc_getProperty(v24, v34, 48LL, 1);
          [v35 proposals];
          id v36 = (id)objc_claimAutoreleasedReturnValue();

          if ([v33 count])
          {
            id v38 = objc_getProperty(v24, v37, 48LL, 1);
            int v39 = [v38 opportunisticPFS];

            id v351 = v33;
            if (v39)
            {
              id v349 = v13;
              id v41 = (void *)[objc_alloc(MEMORY[0x189603FD0]) initWithArray:v36];
              *(_OWORD *)SEL v368 = 0u;
              __int128 v369 = 0u;
              __int128 v370 = 0u;
              __int128 v371 = 0u;
              id v36 = v36;
              uint64_t v42 = [v36 countByEnumeratingWithState:v368 objects:buf count:16];
              if (v42)
              {
                uint64_t v43 = v42;
                uint64_t v44 = *(void *)v369;
                do
                {
                  for (uint64_t i = 0LL; i != v43; ++i)
                  {
                    if (*(void *)v369 != v44) {
                      objc_enumerationMutation(v36);
                    }
                    id v46 = -[NEIKEv2ChildSAProposal copyWithoutKEM](*(void **)(*(void *)&v368[8] + 8 * i));
                    char v47 = [v41 count];
                    if (v46) {
                      v46[8] = v47 + 1;
                    }
                    [v41 addObject:v46];
                  }

                  uint64_t v43 = [v36 countByEnumeratingWithState:v368 objects:buf count:16];
                }

                while (v43);
              }

              uint64_t v48 = [v36 count];
              if (v48 != [v41 count])
              {
                uint64_t v49 = [v41 array];

                id v36 = (id)v49;
              }

              id v33 = v351;

              uint64_t v13 = v349;
            }

            id v50 = objc_getProperty(v24, v40, 48LL, 1);
            uint64_t v51 = +[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]( (uint64_t)NEIKEv2ChildSAProposal,  v36,  v33,  [v50 preferInitiatorProposalOrder],  1);
            objc_setProperty_atomic(v24, v52, v51, 184LL);

            id v54 = objc_getProperty(v24, v53, 184LL, 1);
            if (v54)
            {
              id v56 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
              objc_getProperty(self, v55, 112LL, 1);
              uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();

              if (v57)
              {
                objc_getProperty(self, v58, 112LL, 1);
                uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v61 = v59;
                if (v59) {
                  uint64_t v59 = objc_getProperty(v59, v60, 24LL, 1);
                }
                id v33 = v351;
                id v62 = v59;

                if (v62)
                {
                  id WeakRetained = objc_loadWeakRetained(v24 + 3);
                  id v350 = WeakRetained;
                  if (WeakRetained) {
                    id WeakRetained = objc_getProperty(WeakRetained, v64, 80LL, 1);
                  }
                  id v65 = WeakRetained;
                  int v66 = [v65 strictNonceSizeChecks];

                  if (v66)
                  {
                    objc_getProperty(self, v67, 112LL, 1);
                    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v70 = v68;
                    if (v68) {
                      uint64_t v68 = objc_getProperty(v68, v69, 24LL, 1);
                    }
                    id v71 = v68;
                    uint64_t v72 = [v71 length];

                    unint64_t v346 = v72;
                    if ((unint64_t)(v72 - 257) <= 0xFFFFFFFFFFFFFF0ELL)
                    {
                      ne_log_obj();
                      uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                      {
                        id v75 = (void *)[self copyShortDescription];
                        *(_DWORD *)SEL v361 = 138412546;
                        id v362 = v75;
                        __int16 v363 = 2048;
                        unint64_t v364 = v72;
                        id v76 = "%@ NONCE data length %zu is out of bounds";
                        uint64_t v77 = v74;
                        uint32_t v78 = 22;
LABEL_113:
                        _os_log_error_impl(&dword_1876B1000, v77, OS_LOG_TYPE_ERROR, v76, v361, v78);
LABEL_114:
                      }

void __55__NEIKEv2Session_Exchange__receiveRekeyChildSA_packet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((-[NEIKEv2InformationalPacket validateDeleteChild:]((uint64_t)v3, *(void **)(a1 + 32)) & 1) == 0)
  {
    ne_log_obj();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_ERROR,  "Failed to process Rekey Child SA Delete packet",  buf,  2u);
    }

    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to process Rekey Child SA Delete packet",  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v72[0]);
    goto LABEL_20;
  }

  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v4, 184LL, 1);
  }
  id v7 = Property;
  uint64_t v8 = *(void **)(a1 + 40);
  if (v8) {
    objc_setProperty_atomic(v8, v6, v7, 56LL);
  }

  uint64_t v10 = *(void **)(a1 + 40);
  if (v10)
  {
    objc_setProperty_atomic(v10, v9, 0LL, 184LL);
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      *(_BYTE *)(v11 + 9) = 0;
      uint64_t v10 = *(void **)(a1 + 40);
    }

    else
    {
      uint64_t v10 = 0LL;
    }
  }

  if ((-[NEIKEv2ChildSA generateAllValues]((uint64_t)v10) & 1) == 0)
  {
    ne_log_obj();
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v35, OS_LOG_TYPE_ERROR, "Failed to generate Child SA crypto values", buf, 2u);
    }

    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorCrypto( @"Failed to generate Child SA crypto values",  v36,  v37,  v38,  v39,  v40,  v41,  v42,  v72[0]);
LABEL_20:
    uint64_t v43 = ErrorPeerInvalidSyntax;
    -[NEIKEv2ChildSA setState:error:](v26, 3uLL, ErrorPeerInvalidSyntax);

    -[NEIKEv2Session reportState](*(void **)(a1 + 48), v44);
    -[NEIKEv2Session resetChild:](*(char **)(a1 + 48), *(void **)(a1 + 40));
    goto LABEL_34;
  }

  id v12 = -[NEIKEv2Session copySAsToDeleteAndInstallRekeyedChildSA:](*(id *)(a1 + 48), *(void **)(a1 + 40));
  if (v12)
  {
    -[NEIKEv2Session uninstallOldRekeyedChildSAs:](*(void **)(a1 + 48), v12);
    +[NEIKEv2InformationalPacket createDeleteResponse:child:]( (uint64_t)&OBJC_CLASS___NEIKEv2InformationalPacket,  v3,  *(void **)(a1 + 56));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      id v14 = v13;
      if ((-[NEIKEv2Session sendReply:replyHandler:](*(void *)(a1 + 48), v13, 0LL) & 1) == 0)
      {
        uint64_t v22 = *(void *)(a1 + 40);
        uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"delete child SA for rekey",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v72[0]);
        -[NEIKEv2ChildSA setState:error:](v22, 3uLL, ErrorFailedToSend);

        -[NEIKEv2Session reportState](*(void **)(a1 + 48), v24);
        -[NEIKEv2Session resetChild:](*(char **)(a1 + 48), *(void **)(a1 + 40));
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1876B1000, v61, OS_LOG_TYPE_ERROR, "Failed to create Child SA Delete packet", buf, 2u);
      }

      uint64_t v62 = *(void *)(a1 + 40);
      uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create Child SA Delete packet",  v63,  v64,  v65,  v66,  v67,  v68,  v69,  v72[0]);
      -[NEIKEv2ChildSA setState:error:](v62, 3uLL, ErrorInternal);

      -[NEIKEv2Session reportState](*(void **)(a1 + 48), v71);
      -[NEIKEv2Session resetChild:](*(char **)(a1 + 48), *(void **)(a1 + 40));
      id v14 = 0LL;
    }
  }

  else
  {
    ne_log_obj();
    id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v45, OS_LOG_TYPE_ERROR, "Failed to install Child SA", buf, 2u);
    }

    char v47 = *(void **)(a1 + 40);
    uint64_t v48 = *(void **)(a1 + 48);
    if (v47)
    {
      id v49 = objc_getProperty(v47, v46, 56LL, 1);
      uint64_t v51 = v49;
      if (v49) {
        id v49 = objc_getProperty(v49, v50, 80LL, 1);
      }
    }

    else
    {
      uint64_t v51 = 0LL;
      id v49 = 0LL;
    }

    id v53 = v49;
    id v54 = *(void **)(a1 + 40);
    if (v54)
    {
      id v55 = objc_getProperty(v54, v52, 56LL, 1);
      uint64_t v57 = v55;
      if (v55) {
        id v55 = objc_getProperty(v55, v56, 88LL, 1);
      }
    }

    else
    {
      uint64_t v57 = 0LL;
      id v55 = 0LL;
    }

    id v58 = v55;
    v72[0] = MEMORY[0x1895F87A8];
    v72[1] = 3221225472LL;
    v72[2] = (uint64_t)__55__NEIKEv2Session_Exchange__receiveRekeyChildSA_packet___block_invoke_331;
    v72[3] = (uint64_t)&unk_18A08CF10;
    id v59 = *(id *)(a1 + 40);
    uint64_t v60 = *(void *)(a1 + 48);
    id v73 = v59;
    uint64_t v74 = v60;
    -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](v48, v53, v58, v72);

    id v14 = v73;
  }

LABEL_34:
}

void __55__NEIKEv2Session_Exchange__receiveRekeyChildSA_packet___block_invoke_331( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to install Child SA",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v12);
  -[NEIKEv2ChildSA setState:error:](v9, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v11);
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 40), *(void **)(a1 + 32));
}

- (void)handleFollowupKEForRekeyIKESAInitiator:(void *)a3 rekeyIKEContext:(unint64_t)a4 iteration:(void *)a5 handler:
{
  uint64_t v115 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  uint64_t v12 = a5;
  if (a1)
  {
    uint64_t v13 = (dispatch_queue_s *)objc_getProperty(a1, v11, 368LL, 1);
    dispatch_assert_queue_V2(v13);

    if (v9)
    {
      id Property = objc_getProperty(v9, v14, 96LL, 1);
      uint64_t v17 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v16, 120LL, 1);
      }
    }

    else
    {
      uint64_t v17 = 0LL;
      id Property = 0LL;
    }

    id v18 = Property;
    unint64_t v19 = [v18 count];

    if (v19 > a4)
    {
      if (!a4)
      {
        id v22 = objc_alloc(MEMORY[0x189603FA8]);
        if (v9)
        {
          id v23 = objc_getProperty(v9, v21, 96LL, 1);
          id v25 = v23;
          if (v23) {
            id v23 = objc_getProperty(v23, v24, 120LL, 1);
          }
        }

        else
        {
          id v25 = 0LL;
          id v23 = 0LL;
        }

        id v26 = v23;
        uint64_t v28 = (void *)objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v26, "count"));
        if (v9) {
          objc_setProperty_atomic(v9, v27, v28, 184LL);
        }
      }

      if (v9)
      {
        id v29 = objc_getProperty(v9, v20, 96LL, 1);
        uint64_t v31 = v29;
        if (v29) {
          id v29 = objc_getProperty(v29, v30, 120LL, 1);
        }
      }

      else
      {
        uint64_t v31 = 0LL;
        id v29 = 0LL;
      }

      id v32 = v29;
      [v32 objectAtIndexedSubscript:a4];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9) {
        id v35 = objc_getProperty(v9, v34, 96LL, 1);
      }
      else {
        id v35 = 0LL;
      }
      id v36 = v35;
      -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v36);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 objectForKeyedSubscript:v33];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
      {
        ne_log_obj();
        uint64_t v83 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v112 = a1;
          __int16 v113 = 2112;
          __int128 v114 = v33;
          _os_log_error_impl( &dword_1876B1000,  v83,  OS_LOG_TYPE_ERROR,  "%@ No chosen KEM found for transform type %@ (initiator rekey followup KE)",  buf,  0x16u);
        }

        uint64_t v84 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
        id v86 = objc_getProperty(a1, v85, 368LL, 1);
        v107[0] = MEMORY[0x1895F87A8];
        v107[1] = 3221225472LL;
        v107[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke;
        v107[3] = &unk_18A08D118;
        id v108 = (os_log_s *)v10;
        id v109 = a1;
        id v110 = v33;
        uint64_t v87 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v84->super.super.isa,  0,  v86,  v107);

        -[NEIKEv2Session initiateDelete:](a1, v87);
        uint64_t v39 = v108;
        goto LABEL_43;
      }

      if ((-[NEIKEv2IKESA generateLocalValuesForKEMProtocol:](v9, v38) & 1) == 0)
      {
        ne_log_obj();
        uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v112 = a1;
          __int16 v113 = 2112;
          __int128 v114 = v38;
          _os_log_error_impl( &dword_1876B1000,  v88,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate values for KEM %@ (initiator rekey followup KE)",  buf,  0x16u);
        }

        uint64_t v89 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
        id v91 = objc_getProperty(a1, v90, 368LL, 1);
        v103[0] = MEMORY[0x1895F87A8];
        v103[1] = 3221225472LL;
        v103[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_339;
        v103[3] = &unk_18A08D118;
        id v104 = (os_log_s *)v10;
        id v105 = a1;
        id v106 = v38;
        uint64_t v92 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v89->super.super.isa,  0,  v91,  v103);

        -[NEIKEv2Session initiateDelete:](a1, v92);
        uint64_t v39 = v104;
        goto LABEL_43;
      }

      uint64_t v93 = v33;
      uint64_t v39 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2FollowupKEPacket));
      uint64_t v40 = objc_alloc_init(&OBJC_CLASS___NEIKEv2KeyExchangePayload);
      uint64_t v42 = v40;
      if (v39)
      {
        objc_setProperty_atomic(v39, v41, v40, 88LL);

        id v44 = objc_getProperty(v39, v43, 88LL, 1);
        id v46 = v44;
        if (v44) {
          objc_setProperty_atomic(v44, v45, v38, 24LL);
        }
      }

      else
      {

        id v46 = 0LL;
      }

      if (v9)
      {
        id v48 = objc_getProperty(v9, v47, 160LL, 1);
        id v49 = v48;
        if (v48)
        {
          id v50 = (void *)*((void *)v48 + 2);
LABEL_26:
          id v52 = v50;
          if (v39)
          {
            id v53 = objc_getProperty(v39, v51, 88LL, 1);
            id v55 = v53;
            if (v53) {
              objc_setProperty_atomic(v53, v54, v52, 32LL);
            }
          }

          else
          {
            id v55 = 0LL;
          }

          if (v9) {
            id v57 = objc_getProperty(v9, v56, 176LL, 1);
          }
          else {
            id v57 = 0LL;
          }
          id v58 = v57;
          uint64_t v60 = v58;
          if (v39)
          {
            objc_setProperty_atomic(v39, v59, v58, 96LL);

            id v62 = objc_getProperty(v39, v61, 88LL, 1);
          }

          else
          {

            id v62 = 0LL;
          }

          id v63 = v62;
          char v64 = -[NEIKEv2Payload isValid]((uint64_t)v63);

          if ((v64 & 1) != 0)
          {
            v94[0] = MEMORY[0x1895F87A8];
            v94[1] = 3221225472LL;
            v94[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_2;
            v94[3] = &unk_18A08D190;
            v94[4] = a1;
            id v65 = v10;
            id v95 = v65;
            id v96 = v38;
            id v97 = v9;
            unint64_t v99 = a4;
            uint64_t v98 = v12;
            if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v39, v94) == -1)
            {
              [v65 sendCallbackSuccess:0 session:a1];
              id v67 = objc_getProperty(a1, v66, 336LL, 1);
              uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"initiator rekey FOLLOWUP_KE #%zu",  v68,  v69,  v70,  v71,  v72,  v73,  v74,  a4 + 1);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v67, 3uLL, ErrorFailedToSend);

              -[NEIKEv2Session reportState](a1, v76);
              -[NEIKEv2Session resetAll]((uint64_t)a1, v77);
            }

            uint64_t v33 = v93;
          }

          else
          {
            ne_log_obj();
            uint32_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            uint64_t v33 = v93;
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v112 = a1;
              _os_log_error_impl( &dword_1876B1000,  v78,  OS_LOG_TYPE_ERROR,  "%@ Failed to create FOLLOWUP_KE packet (initiator rekey followup KE)",  buf,  0xCu);
            }

            uint64_t v79 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
            id v81 = objc_getProperty(a1, v80, 368LL, 1);
            v100[0] = MEMORY[0x1895F87A8];
            v100[1] = 3221225472LL;
            v100[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_342;
            v100[3] = &unk_18A08CF10;
            id v101 = v10;
            uint64_t v102 = a1;
            uint64_t v82 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v79->super.super.isa,  0,  v81,  v100);

            -[NEIKEv2Session initiateDelete:](a1, v82);
          }

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke( uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"No chosen KEM found for transform type %@ (initiator rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  *(void *)(a1 + 48));
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_339( uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to generate values for KEM %@ (initiator rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  *(void *)(a1 + 48));
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_342( uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create FOLLOWUP_KE packet (initiator rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v136 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id Property = v3;
    id v6 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v5, 88LL, 1);
    }
    id v7 = Property;

    if (v7)
    {
      if (v6)
      {
        id v9 = objc_getProperty(v6, v8, 88LL, 1);
        uint64_t v11 = v9;
        if (v9) {
          id v9 = objc_getProperty(v9, v10, 24LL, 1);
        }
      }

      else
      {
        uint64_t v11 = 0LL;
        id v9 = 0LL;
      }

      id v12 = v9;

      if (v12)
      {
        if (v6)
        {
          id v14 = objc_getProperty(v6, v13, 88LL, 1);
          uint64_t v16 = v14;
          if (v14) {
            id v14 = objc_getProperty(v14, v15, 32LL, 1);
          }
        }

        else
        {
          uint64_t v16 = 0LL;
          id v14 = 0LL;
        }

        id v17 = v14;

        if (v17)
        {
          if (v6)
          {
            id v19 = objc_getProperty(v6, v18, 88LL, 1);
            uint64_t v21 = v19;
            if (v19) {
              id v19 = objc_getProperty(v19, v20, 24LL, 1);
            }
          }

          else
          {
            uint64_t v21 = 0LL;
            id v19 = 0LL;
          }

          id v22 = v19;
          uint64_t v23 = [v22 method];
          uint64_t v24 = [*(id *)(a1 + 48) method];

          if (v23 == v24)
          {
            if (v6)
            {
              id v26 = objc_getProperty(v6, v25, 88LL, 1);
              uint64_t v28 = v26;
              if (v26) {
                id v26 = objc_getProperty(v26, v27, 32LL, 1);
              }
            }

            else
            {
              uint64_t v28 = 0LL;
              id v26 = 0LL;
            }

            id v30 = v26;
            uint64_t v31 = *(void **)(a1 + 56);
            if (v31) {
              objc_setProperty_atomic(v31, v29, v30, 152LL);
            }

            uint64_t v33 = *(void **)(a1 + 56);
            if (v33)
            {
              id v34 = objc_getProperty(*(id *)(a1 + 56), v32, 184LL, 1);

              if (v34)
              {
                if (-[NEIKEv2IKESA processCurrentKeyExchange](v33, v35))
                {
                  id v37 = objc_getProperty(v33, v36, 184LL, 1);
                  uint64_t v39 = (uint64_t *)objc_getProperty(v33, v38, 160LL, 1);
                  uint64_t v40 = v39;
                  if (v39) {
                    uint64_t v41 = v39[3];
                  }
                  else {
                    uint64_t v41 = 0LL;
                  }
                  [v37 addObject:v41];

                  objc_setProperty_atomic(v33, v42, 0LL, 160LL);
                  if (v6) {
                    id v44 = objc_getProperty(v6, v43, 96LL, 1);
                  }
                  else {
                    id v44 = 0LL;
                  }
                  id v46 = v44;
                  char v47 = *(void **)(a1 + 56);
                  if (v47) {
                    objc_setProperty_atomic(v47, v45, v46, 176LL);
                  }

                  -[NEIKEv2Session handleFollowupKEForRekeyIKESAInitiator:rekeyIKEContext:iteration:handler:]( *(void *)(a1 + 32),  *(void *)(a1 + 56),  *(void *)(a1 + 40),  *(void *)(a1 + 72) + 1LL,  *(void *)(a1 + 64));
                  goto LABEL_60;
                }
              }

              else
              {
                ne_log_obj();
                uint64_t v82 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  uint64_t v131 = "-[NEIKEv2IKESA(Crypto) processFollowupKeyExchange]";
                  _os_log_fault_impl( &dword_1876B1000,  v82,  OS_LOG_TYPE_FAULT,  "%s called with null self.followupSharedSecrets",  buf,  0xCu);
                }
              }
            }

            ne_log_obj();
            uint64_t v83 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl( &dword_1876B1000,  v83,  OS_LOG_TYPE_ERROR,  "Failed to process KE data (initiator rekey followup KE)",  buf,  2u);
            }

            SEL v85 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
            id v86 = *(id *)(a1 + 32);
            if (v86) {
              id v86 = objc_getProperty(v86, v84, 368LL, 1);
            }
            id v87 = v86;
            v110[0] = MEMORY[0x1895F87A8];
            v110[1] = 3221225472LL;
            v110[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_360;
            v110[3] = &unk_18A08CF10;
            id v88 = *(id *)(a1 + 40);
            uint64_t v89 = *(void *)(a1 + 32);
            id v111 = v88;
            uint64_t v112 = v89;
            SEL v90 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v85->super.super.isa,  0,  v87,  v110);

            -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v90);
            id v56 = v111;
          }

          else
          {
            ne_log_obj();
            uint64_t v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              uint64_t v94 = *(const char **)(a1 + 32);
              if (v6)
              {
                id v95 = objc_getProperty(v6, v74, 88LL, 1);
                id v97 = v95;
                if (v95) {
                  id v95 = objc_getProperty(v95, v96, 24LL, 1);
                }
              }

              else
              {
                id v97 = 0LL;
                id v95 = 0LL;
              }

              id v98 = v95;
              uint64_t v99 = [v98 method];
              uint64_t v100 = [*(id *)(a1 + 48) method];
              *(_DWORD *)buf = 138412802;
              uint64_t v131 = v94;
              __int16 v132 = 2048;
              uint64_t v133 = v99;
              __int16 v134 = 2048;
              uint64_t v135 = v100;
              _os_log_error_impl( &dword_1876B1000,  v73,  OS_LOG_TYPE_ERROR,  "%@ Did not receive matching method from KE payload (%zu != %zu) (initiator rekey followup KE)",  buf,  0x20u);
            }

            id v76 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
            id v77 = *(id *)(a1 + 32);
            if (v77) {
              id v77 = objc_getProperty(v77, v75, 368LL, 1);
            }
            id v78 = v77;
            v113[0] = MEMORY[0x1895F87A8];
            v113[1] = 3221225472LL;
            v113[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_357;
            v113[3] = &unk_18A08D1B8;
            id v79 = *(id *)(a1 + 40);
            uint64_t v80 = *(void *)(a1 + 32);
            id v114 = v79;
            uint64_t v115 = v80;
            id v6 = v6;
            id v116 = v6;
            id v117 = *(id *)(a1 + 48);
            id v81 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v76->super.super.isa,  0,  v78,  v113);

            -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v81);
            id v56 = v114;
          }
        }

        else
        {
          ne_log_obj();
          id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            uint64_t v93 = *(const char **)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            uint64_t v131 = v93;
            _os_log_error_impl( &dword_1876B1000,  v65,  OS_LOG_TYPE_ERROR,  "%@ Did not receive data in KE payload (initiator rekey followup KE)",  buf,  0xCu);
          }

          id v67 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
          id v68 = *(id *)(a1 + 32);
          if (v68) {
            id v68 = objc_getProperty(v68, v66, 368LL, 1);
          }
          id v69 = v68;
          v118[0] = MEMORY[0x1895F87A8];
          v118[1] = 3221225472LL;
          v118[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_354;
          v118[3] = &unk_18A08CF10;
          id v70 = *(id *)(a1 + 40);
          uint64_t v71 = *(void *)(a1 + 32);
          id v119 = v70;
          uint64_t v120 = v71;
          uint64_t v72 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v67->super.super.isa,  0,  v69,  v118);

          -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v72);
          id v56 = v119;
        }
      }

      else
      {
        ne_log_obj();
        id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          uint64_t v92 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v131 = v92;
          _os_log_error_impl( &dword_1876B1000,  v57,  OS_LOG_TYPE_ERROR,  "%@ Did not receive method in KE payload (initiator rekey followup KE)",  buf,  0xCu);
        }

        id v59 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
        id v60 = *(id *)(a1 + 32);
        if (v60) {
          id v60 = objc_getProperty(v60, v58, 368LL, 1);
        }
        id v61 = v60;
        v121[0] = MEMORY[0x1895F87A8];
        v121[1] = 3221225472LL;
        v121[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_351;
        v121[3] = &unk_18A08CF10;
        id v62 = *(id *)(a1 + 40);
        uint64_t v63 = *(void *)(a1 + 32);
        id v122 = v62;
        uint64_t v123 = v63;
        char v64 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v59->super.super.isa,  0,  v61,  v121);

        -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v64);
        id v56 = v122;
      }
    }

    else
    {
      ne_log_obj();
      id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        id v91 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v131 = v91;
        _os_log_error_impl( &dword_1876B1000,  v48,  OS_LOG_TYPE_ERROR,  "%@ Did not receive KE payload (initiator rekey followup KE)",  buf,  0xCu);
      }

      id v50 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
      id v51 = *(id *)(a1 + 32);
      if (v51) {
        id v51 = objc_getProperty(v51, v49, 368LL, 1);
      }
      id v52 = v51;
      v124[0] = MEMORY[0x1895F87A8];
      v124[1] = 3221225472LL;
      v124[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_348;
      v124[3] = &unk_18A08CF10;
      id v53 = *(id *)(a1 + 40);
      uint64_t v54 = *(void *)(a1 + 32);
      id v125 = v53;
      uint64_t v126 = v54;
      id v55 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v50->super.super.isa,  0,  v52,  v124);

      -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v55);
      id v56 = v125;
    }

    goto LABEL_60;
  }

  ne_log_obj();
  id v101 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
  {
    id v109 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v131 = v109;
    _os_log_error_impl( &dword_1876B1000,  v101,  OS_LOG_TYPE_ERROR,  "%@ Failed to receive FOLLOWUP_KE reply (initiator rekey followup KE)",  buf,  0xCu);
  }

  id v103 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
  id v104 = *(id *)(a1 + 32);
  if (v104) {
    id v104 = objc_getProperty(v104, v102, 368LL, 1);
  }
  id v105 = v104;
  v127[0] = MEMORY[0x1895F87A8];
  v127[1] = 3221225472LL;
  v127[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_345;
  v127[3] = &unk_18A08CF10;
  id v106 = *(id *)(a1 + 40);
  uint64_t v107 = *(void *)(a1 + 32);
  id v128 = v106;
  uint64_t v129 = v107;
  id v108 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v103->super.super.isa,  0,  v105,  v127);

  -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v108);
  id v6 = v128;
LABEL_60:
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_345( uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive FOLLOWUP_KE reply (initiator rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_348( uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive KE payload (initiator rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_351( uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive method in KE payload (initiator rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_354( uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive data in KE payload (initiator rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_357( uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v5 = Property;
  uint64_t v6 = *(void **)(a1 + 48);
  if (v6)
  {
    id v7 = objc_getProperty(v6, v4, 88LL, 1);
    uint64_t v9 = v7;
    if (v7) {
      id v7 = objc_getProperty(v7, v8, 24LL, 1);
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    id v7 = 0LL;
  }

  id v10 = v7;
  uint64_t v11 = [v10 method];
  [*(id *)(a1 + 56) method];
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive matching method from KE payload (%zu != %zu) (initiator rekey followup KE)",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v11);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v20);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v21);
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_360( uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto( @"Failed to process KE data (initiator rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

- (void)handleFollowupKEForRekeyIKESAResponder:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  if (a1)
  {
    id v14 = a4;
    uint64_t v16 = (dispatch_queue_s *)objc_getProperty(a1, v15, 368LL, 1);
    dispatch_assert_queue_V2(v16);

    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke;
    v30[3] = &unk_18A08CFB0;
    uint64_t v34 = a3;
    id v31 = v11;
    id v32 = a1;
    id v33 = v13;
    char v17 = -[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v14, v30);

    if ((v17 & 1) == 0)
    {
      id v19 = objc_getProperty(a1, v18, 336LL, 1);
      uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"%@",  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)v12);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v19, 3uLL, ErrorFailedToSend);

      -[NEIKEv2Session reportState](a1, v28);
      -[NEIKEv2Session resetAll]((uint64_t)a1, v29);
    }
  }
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v247 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  unint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id Property = objc_getProperty(v6, v3, 96LL, 1);
    uint64_t v9 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v8, 120LL, 1);
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    id Property = 0LL;
  }

  id v10 = Property;
  unint64_t v11 = [v10 count];

  if (v5 < v11)
  {
    if (!*(void *)(a1 + 56))
    {
      id v13 = objc_alloc(MEMORY[0x189603FA8]);
      id v14 = *(void **)(a1 + 32);
      if (v14)
      {
        id v15 = objc_getProperty(v14, v12, 96LL, 1);
        char v17 = v15;
        if (v15) {
          id v15 = objc_getProperty(v15, v16, 120LL, 1);
        }
      }

      else
      {
        char v17 = 0LL;
        id v15 = 0LL;
      }

      id v18 = v15;
      uint64_t v20 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v18, "count"));
      uint64_t v21 = *(void **)(a1 + 32);
      if (v21) {
        objc_setProperty_atomic(v21, v19, v20, 184LL);
      }
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v23 = (id *)v4;
      uint64_t v24 = *(void **)(a1 + 32);
      if (v24)
      {
        id v25 = objc_getProperty(v24, v22, 96LL, 1);
        uint64_t v27 = v25;
        if (v25) {
          id v25 = objc_getProperty(v25, v26, 120LL, 1);
        }
      }

      else
      {
        uint64_t v27 = 0LL;
        id v25 = 0LL;
      }

      id v28 = v25;
      [v28 objectAtIndexedSubscript:*(void *)(a1 + 56)];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();

      id v31 = *(id *)(a1 + 32);
      if (v31) {
        id v31 = objc_getProperty(v31, v30, 96LL, 1);
      }
      id v32 = v31;
      -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v32);
      id v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 objectForKeyedSubscript:v29];
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        if (v23) {
          id v36 = objc_getProperty(v23, v35, 88LL, 1);
        }
        else {
          id v36 = 0LL;
        }
        id v37 = v36;

        if (v37)
        {
          if (v23)
          {
            id v39 = objc_getProperty(v23, v38, 88LL, 1);
            uint64_t v41 = v39;
            if (v39) {
              id v39 = objc_getProperty(v39, v40, 24LL, 1);
            }
          }

          else
          {
            uint64_t v41 = 0LL;
            id v39 = 0LL;
          }

          id v42 = v39;

          if (v42)
          {
            if (v23)
            {
              id v44 = objc_getProperty(v23, v43, 88LL, 1);
              id v46 = v44;
              if (v44) {
                id v44 = objc_getProperty(v44, v45, 32LL, 1);
              }
            }

            else
            {
              id v46 = 0LL;
              id v44 = 0LL;
            }

            id v47 = v44;

            if (v47)
            {
              if (v23)
              {
                id v49 = objc_getProperty(v23, v48, 88LL, 1);
                id v51 = v49;
                if (v49) {
                  id v49 = objc_getProperty(v49, v50, 24LL, 1);
                }
              }

              else
              {
                id v51 = 0LL;
                id v49 = 0LL;
              }

              id v52 = v49;
              uint64_t v53 = [v52 method];
              uint64_t v54 = [v34 method];

              if (v53 == v54)
              {
                if (v23)
                {
                  id v56 = objc_getProperty(v23, v55, 96LL, 1);
                  id v58 = v56;
                  if (v56) {
                    id v56 = objc_getProperty(v56, v57, 32LL, 1);
                  }
                }

                else
                {
                  id v58 = 0LL;
                  id v56 = 0LL;
                }

                id v60 = v56;
                id v61 = *(void **)(a1 + 32);
                uint64_t v226 = v29;
                if (v61)
                {
                  id v62 = objc_getProperty(v61, v59, 176LL, 1);
                  char v64 = v62;
                  if (v62) {
                    id v62 = objc_getProperty(v62, v63, 32LL, 1);
                  }
                }

                else
                {
                  char v64 = 0LL;
                  id v62 = 0LL;
                }

                id v65 = v62;
                char v66 = [v60 isEqualToData:v65];

                if ((v66 & 1) == 0)
                {
                  ne_log_obj();
                  id v116 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v225 = *(void *)(a1 + 40);
                    if (v23)
                    {
                      id v200 = objc_getProperty(v23, v117, 96LL, 1);
                      id v202 = v200;
                      SEL v203 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
                      if (v200) {
                        id v200 = objc_getProperty(v200, v201, 32LL, 1);
                      }
                    }

                    else
                    {
                      id v202 = 0LL;
                      id v200 = 0LL;
                      SEL v203 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
                    }

                    id v205 = v200;
                    id v206 = *(void **)(a1 + 32);
                    if (v206)
                    {
                      id v207 = objc_getProperty(v206, v204, 176LL, 1);
                      uint64_t v209 = v207;
                      if (v207) {
                        id v207 = objc_getProperty(v207, v208, v203[715], 1);
                      }
                    }

                    else
                    {
                      uint64_t v209 = 0LL;
                      id v207 = 0LL;
                    }

                    id v210 = v207;
                    *(_DWORD *)buf = 138412802;
                    *(void *)&uint8_t buf[4] = v225;
                    *(_WORD *)&_BYTE buf[12] = 2112;
                    *(void *)&buf[14] = v205;
                    __int16 v245 = 2112;
                    uint64_t v246 = (uint64_t)v210;
                    _os_log_error_impl( &dword_1876B1000,  v116,  OS_LOG_TYPE_ERROR,  "%@ ADDITIONAL_KEY_EXCHANGE in FOLLOWUP_KE request doesn't match expected (%@ != %@) (responder rekey followup KE)",  buf,  0x20u);
                  }

                  __int128 v118 = (void *)-[NEIKEv2Packet initResponse:]( (uint64_t)objc_alloc(&OBJC_CLASS___NEIKEv2FollowupKEPacket),  v23);
                  uint64_t v107 = v118;
                  id v29 = v226;
                  if (v118) {
                    -[NEIKEv2Packet addNotification:data:](v118, 0x2FuLL, 0LL);
                  }
                  if ((-[NEIKEv2Session sendReply:replyHandler:](*(void *)(a1 + 40), v107, 0LL) & 1) != 0)
                  {
                    SEL v121 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
                    id v122 = *(id *)(a1 + 40);
                    if (v122) {
                      id v122 = objc_getProperty(v122, v120, 368LL, 1);
                    }
                    id v123 = v122;
                    v232[0] = MEMORY[0x1895F87A8];
                    v232[1] = 3221225472LL;
                    v232[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_385;
                    v232[3] = &unk_18A08D118;
                    v232[4] = *(void *)(a1 + 40);
                    uint64_t v233 = v23;
                    id v234 = *(id *)(a1 + 32);
                    uint64_t v124 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v121->super.super.isa,  0,  v123,  v232);

                    -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 40), v124);
                  }

                  else
                  {
                    id v131 = *(id *)(a1 + 40);
                    if (v131) {
                      id v131 = objc_getProperty(v131, v119, 336LL, 1);
                    }
                    id v132 = v131;
                    uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"responder rekey followup KE mismatched link",  v133,  v134,  v135,  v136,  v137,  v138,  v139,  v224);
                    -[NEIKEv2IKESA setState:error:]((uint64_t)v132, 3uLL, ErrorFailedToSend);

                    -[NEIKEv2Session reportState](*(void **)(a1 + 40), v141);
                    -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v142);
                  }

                  goto LABEL_76;
                }

                id v68 = *(void **)(a1 + 32);
                if (v23)
                {
                  id v69 = objc_getProperty(v23, v67, 88LL, 1);
                  uint64_t v71 = v69;
                  id v29 = v226;
                  if (v69) {
                    id v69 = objc_getProperty(v69, v70, 32LL, 1);
                  }
                }

                else
                {
                  uint64_t v71 = 0LL;
                  id v69 = 0LL;
                  id v29 = v226;
                }

                id v72 = v69;
                char v73 = -[NEIKEv2IKESA generateLocalValuesForKEMProtocol:peerPayload:](v68, v34, v72);

                if ((v73 & 1) != 0)
                {
                  unint64_t v75 = *(void *)(a1 + 56) + 1LL;
                  id v76 = *(void **)(a1 + 32);
                  if (v76)
                  {
                    id v77 = objc_getProperty(v76, v74, 96LL, 1);
                    id v79 = v77;
                    if (v77) {
                      id v77 = objc_getProperty(v77, v78, 120LL, 1);
                    }
                  }

                  else
                  {
                    id v79 = 0LL;
                    id v77 = 0LL;
                  }

                  id v80 = v77;
                  unint64_t v81 = [v80 count];

                  if (v75 >= v81)
                  {
                    SEL v144 = *(void **)(a1 + 32);
                    id v88 = &off_18A087000;
                    if (v144) {
                      objc_setProperty_atomic(v144, v82, 0LL, 176LL);
                    }
                  }

                  else
                  {
                    [MEMORY[0x189607AB8] UUID];
                    uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
                    *(void *)buf = 0LL;
                    *(void *)&uint8_t buf[8] = 0LL;
                    [v83 getUUIDBytes:buf];
                    uint64_t v84 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:buf length:16];
                    id v86 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]( (uint64_t)&OBJC_CLASS___NEIKEv2NotifyPayload,  0x4039uLL,  v84);
                    id v87 = *(void **)(a1 + 32);
                    id v88 = &off_18A087000;
                    if (v87) {
                      objc_setProperty_atomic(v87, v85, v86, 176LL);
                    }
                  }

                  uint64_t v107 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)objc_alloc((Class)v88[338]), v23);
                  id v145 = objc_alloc_init(&OBJC_CLASS___NEIKEv2KeyExchangePayload);
                  id v147 = v145;
                  if (v107)
                  {
                    objc_setProperty_atomic(v107, v146, v145, 88LL);

                    id v149 = objc_getProperty(v107, v148, 88LL, 1);
                    char v151 = v149;
                    if (v149) {
                      objc_setProperty_atomic(v149, v150, v34, 24LL);
                    }
                  }

                  else
                  {

                    char v151 = 0LL;
                  }

                  uint64_t v153 = *(void **)(a1 + 32);
                  if (v153)
                  {
                    id v154 = objc_getProperty(v153, v152, 160LL, 1);
                    SEL v155 = v154;
                    if (v154)
                    {
                      uint64_t v156 = (void *)*((void *)v154 + 2);
                      goto LABEL_108;
                    }
                  }

                  else
                  {
                    SEL v155 = 0LL;
                  }

                  uint64_t v156 = 0LL;
LABEL_108:
                  id v158 = v156;
                  if (v107)
                  {
                    id v159 = objc_getProperty(v107, v157, 88LL, 1);
                    SEL v161 = v159;
                    if (v159) {
                      objc_setProperty_atomic(v159, v160, v158, 32LL);
                    }
                  }

                  else
                  {
                    SEL v161 = 0LL;
                  }

                  id v163 = *(id *)(a1 + 32);
                  if (v163) {
                    id v163 = objc_getProperty(v163, v162, 176LL, 1);
                  }
                  id v164 = v163;
                  id v166 = v164;
                  if (v107)
                  {
                    objc_setProperty_atomic(v107, v165, v164, 96LL);

                    id v168 = objc_getProperty(v107, v167, 88LL, 1);
                  }

                  else
                  {

                    id v168 = 0LL;
                  }

                  id v169 = v168;
                  char v170 = -[NEIKEv2Payload isValid]((uint64_t)v169);

                  if ((v170 & 1) == 0)
                  {
                    ne_log_obj();
                    id v187 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v212 = *(void *)(a1 + 40);
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v212;
                      _os_log_error_impl( &dword_1876B1000,  v187,  OS_LOG_TYPE_ERROR,  "%@ Failed to create FOLLOWUP_KE packet (responder rekey followup KE)",  buf,  0xCu);
                    }

                    SEL v189 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
                    id v190 = *(id *)(a1 + 40);
                    if (v190) {
                      id v190 = objc_getProperty(v190, v188, 368LL, 1);
                    }
                    id v191 = v190;
                    v229[0] = MEMORY[0x1895F87A8];
                    v229[1] = 3221225472LL;
                    void v229[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_391;
                    v229[3] = &unk_18A08D468;
                    v229[4] = *(void *)(a1 + 40);
                    SEL v192 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v189->super.super.isa,  0,  v191,  v229);

                    -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 40), v192);
                    goto LABEL_76;
                  }

                  id v172 = *(id *)(a1 + 32);
                  if (v172) {
                    id v172 = objc_getProperty(v172, v171, 184LL, 1);
                  }
                  id v174 = v172;
                  uint64_t v175 = *(void **)(a1 + 32);
                  if (v175)
                  {
                    id v176 = objc_getProperty(v175, v173, 160LL, 1);
                    id v177 = v176;
                    if (v176)
                    {
                      id v178 = (void *)*((void *)v176 + 3);
LABEL_121:
                      id v179 = v178;
                      [v174 addObject:v179];

                      uint64_t v181 = *(void **)(a1 + 32);
                      uint64_t v182 = v29;
                      if (v181)
                      {
                        objc_setProperty_atomic(v181, v180, 0LL, 160LL);
                        uint64_t v183 = *(void *)(a1 + 32);
                      }

                      else
                      {
                        uint64_t v183 = 0LL;
                      }

                      uint64_t v184 = *(void *)(a1 + 40);
                      uint64_t v185 = *(void *)(a1 + 56) + 1LL;
                      uint64_t v186 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"responder rekey FOLLOWUP_KE #%zu",  v185);
                      -[NEIKEv2Session handleFollowupKEForRekeyIKESAResponder:iteration:replyPacket:replyPacketDescription:handler:]( v184,  v183,  v185,  v107,  v186,  *(void *)(a1 + 48));

                      id v29 = v182;
                      goto LABEL_76;
                    }
                  }

                  else
                  {
                    id v177 = 0LL;
                  }

                  id v178 = 0LL;
                  goto LABEL_121;
                }

                ne_log_obj();
                id v125 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v211 = *(void *)(a1 + 40);
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v211;
                  *(_WORD *)&_BYTE buf[12] = 2112;
                  *(void *)&buf[14] = v34;
                  _os_log_error_impl( &dword_1876B1000,  v125,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate values for KEM %@ (responder rekey followup KE)",  buf,  0x16u);
                }

                uint64_t v127 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
                id v128 = *(id *)(a1 + 40);
                if (v128) {
                  id v128 = objc_getProperty(v128, v126, 368LL, 1);
                }
                id v129 = v128;
                v230[0] = MEMORY[0x1895F87A8];
                v230[1] = 3221225472LL;
                v230[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_388;
                v230[3] = &unk_18A08CF10;
                v230[4] = *(void *)(a1 + 40);
                uint64_t v231 = v34;
                uint64_t v130 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v127->super.super.isa,  0,  v129,  v230);

                -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 40), v130);
                uint64_t v115 = v231;
              }

              else
              {
                ne_log_obj();
                id v108 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                {
                  SEL v227 = v29;
                  uint64_t v195 = *(void *)(a1 + 40);
                  if (v23)
                  {
                    id v196 = objc_getProperty(v23, v109, 88LL, 1);
                    id v198 = v196;
                    if (v196) {
                      id v196 = objc_getProperty(v196, v197, 24LL, 1);
                    }
                  }

                  else
                  {
                    id v198 = 0LL;
                    id v196 = 0LL;
                  }

                  id v199 = v196;
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v195;
                  *(_WORD *)&_BYTE buf[12] = 2048;
                  *(void *)&buf[14] = [v199 method];
                  __int16 v245 = 2048;
                  uint64_t v246 = [v34 method];
                  _os_log_error_impl( &dword_1876B1000,  v108,  OS_LOG_TYPE_ERROR,  "%@ Did not receive matching method from KE payload (%zu != %zu) (responder rekey followup KE)",  buf,  0x20u);

                  id v29 = v227;
                }

                id v111 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
                id v112 = *(id *)(a1 + 40);
                if (v112) {
                  id v112 = objc_getProperty(v112, v110, 368LL, 1);
                }
                id v113 = v112;
                v235[0] = MEMORY[0x1895F87A8];
                v235[1] = 3221225472LL;
                v235[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_380;
                v235[3] = &unk_18A08D118;
                v235[4] = *(void *)(a1 + 40);
                char v236 = v23;
                id v237 = v34;
                id v114 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v111->super.super.isa,  0,  v113,  v235);

                -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 40), v114);
                uint64_t v115 = v236;
              }

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_365( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive FOLLOWUP_KE packet (responder rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_368( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"No chosen KEM found for transform type %@ (responder rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  *(void *)(a1 + 40));
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_371( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive KE payload (responder rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_374( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive method in KE payload (responder rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_377( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive data in KE payload (responder rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_380( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v5 = Property;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = objc_getProperty(v6, v4, 88LL, 1);
    uint64_t v9 = v7;
    if (v7) {
      id v7 = objc_getProperty(v7, v8, 24LL, 1);
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    id v7 = 0LL;
  }

  id v10 = v7;
  uint64_t v11 = [v10 method];
  [*(id *)(a1 + 48) method];
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive matching method from KE payload (%zu != %zu) (responder rekey followup KE)",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v11);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v20);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v21);
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_385( uint64_t *a1,  const char *a2)
{
  id Property = (id)a1[4];
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v5 = Property;
  uint64_t v6 = (void *)a1[5];
  if (v6)
  {
    id v7 = objc_getProperty(v6, v4, 96LL, 1);
    uint64_t v9 = v7;
    if (v7) {
      id v7 = objc_getProperty(v7, v8, 32LL, 1);
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    id v7 = 0LL;
  }

  id v11 = v7;
  uint64_t v12 = (void *)a1[6];
  if (v12)
  {
    id v13 = objc_getProperty(v12, v10, 176LL, 1);
    uint64_t v15 = v13;
    if (v13) {
      id v13 = objc_getProperty(v13, v14, 32LL, 1);
    }
  }

  else
  {
    uint64_t v15 = 0LL;
    id v13 = 0LL;
  }

  id v26 = v13;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"ADDITIONAL_KEY_EXCHANGE in FOLLOWUP_KE request doesn't match expected (%@ != %@) (responder rekey followup KE)",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v11);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState]((void *)a1[4], v24);
  -[NEIKEv2Session resetAll](a1[4], v25);
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_388( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to generate values for KEM %@ (responder rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  *(void *)(a1 + 40));
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_391( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create FOLLOWUP_KE packet (responder rekey followup KE)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_396( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive Rekey IKE Delete packet (receive rekey)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

- (void)initiateRekeyIKESA:(_BYTE *)a1
{
  uint64_t v172 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  uint64_t v6 = (dispatch_queue_s *)Property;
  dispatch_assert_queue_V2(v6);

  if (!a1[15]) {
    __assert_rtn( "-[NEIKEv2Session(Exchange) initiateRekeyIKESA:]",  "NEIKEv2Exchange.m",  2568,  "self.hasOutboundRequestInFlight");
  }
  id v8 = objc_getProperty(a1, v7, 336LL, 1);
  uint64_t v9 = v8;
  if (v8)
  {
    if ((*((_BYTE *)v8 + 16) & 1) == 0)
    {
      *((_BYTE *)v8 + 16) = 1;
      uint64_t v10 = -[NEIKEv2IKESA copyForRekey]((uint64_t)v8);
      uint64_t v12 = v10;
      if (!v10)
      {
        ne_log_obj();
        id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_1876B1000,  v48,  OS_LOG_TYPE_ERROR,  "Failed to create valid IKE SA (initiate rekey)",  buf,  2u);
        }

        id v49 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
        id v51 = objc_getProperty(a1, v50, 368LL, 1);
        v163[0] = MEMORY[0x1895F87A8];
        v163[1] = 3221225472LL;
        v163[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke;
        v163[3] = &unk_18A08CF10;
        id v164 = (os_log_s *)v4;
        SEL v165 = a1;
        id v52 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v49->super.super.isa,  0,  v51,  v163);

        -[NEIKEv2Session initiateDelete:](a1, v52);
        uint64_t v53 = v164;
        goto LABEL_82;
      }

      *((_BYTE *)v10 + 9) = 1;
      if ((-[NEIKEv2IKESA generateInitialValues](v10, v11) & 1) == 0)
      {
        ne_log_obj();
        uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_1876B1000,  v54,  OS_LOG_TYPE_ERROR,  "Failed to generate local IKE crypto values",  buf,  2u);
        }

        id v55 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
        id v57 = objc_getProperty(a1, v56, 368LL, 1);
        v160[0] = MEMORY[0x1895F87A8];
        v160[1] = 3221225472LL;
        v160[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_401;
        v160[3] = &unk_18A08CF10;
        SEL v161 = (os_log_s *)v4;
        uint64_t v162 = a1;
        id v58 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v55->super.super.isa,  0,  v57,  v160);

        -[NEIKEv2Session initiateDelete:](a1, v58);
        uint64_t v53 = v161;
        goto LABEL_82;
      }

      id v13 = v12;
      objc_opt_self();
      id v15 = objc_getProperty(v13, v14, 96LL, 1);

      if (!v15)
      {
        ne_log_obj();
        id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          SEL v167 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyIKESAForInitiator:]";
          _os_log_fault_impl( &dword_1876B1000,  v59,  OS_LOG_TYPE_FAULT,  "%s called with null ikeSA.chosenProposal",  buf,  0xCu);
        }

        goto LABEL_70;
      }

      uint64_t v16 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2CreateChildPacket));
      if (!v16)
      {
        ne_log_obj();
        id v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl( &dword_1876B1000,  v60,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2CreateChildPacket alloc] initOutbound:] failed",  buf,  2u);
        }

        id v59 = 0LL;
        goto LABEL_70;
      }

      uint64_t v17 = v16;
      uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NEIKEv2IKESAPayload);
      objc_setProperty_atomic(v17, v19, v18, 88LL);

      uint64_t v21 = (id *)objc_getProperty(v13, v20, 96LL, 1);
      self = v13;
      uint64_t v152 = v17;
      if (!v21)
      {
        uint64_t v24 = 0LL;
LABEL_50:
        char v73 = v24;
        *(void *)&__int128 v168 = v24;
        [MEMORY[0x189603F18] arrayWithObjects:&v168 count:1];
        uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_getProperty(v17, v75, 88LL, 1);
        id v76 = (void *)objc_claimAutoreleasedReturnValue();
        id v78 = v76;
        if (v76) {
          objc_setProperty_atomic(v76, v77, v74, 24LL);
        }

        id v13 = self;
        id v80 = objc_getProperty(self, v79, 32LL, 1);
        id v59 = v152;
        objc_getProperty(v152, v81, 88LL, 1);
        uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v84 = v82;
        if (v82) {
          objc_setProperty_atomic(v82, v83, v80, 32LL);
        }

        objc_getProperty(v152, v85, 88LL, 1);
        id v86 = (void *)objc_claimAutoreleasedReturnValue();
        char v87 = -[NEIKEv2Payload isValid]((uint64_t)v86);

        if ((v87 & 1) != 0)
        {
          id v88 = objc_alloc_init(&OBJC_CLASS___NEIKEv2NoncePayload);
          objc_setProperty_atomic(v152, v89, v88, 112LL);

          id v91 = objc_getProperty(self, v90, 128LL, 1);
          objc_getProperty(v152, v92, 112LL, 1);
          id v93 = (void *)objc_claimAutoreleasedReturnValue();
          id v95 = v93;
          if (v93) {
            objc_setProperty_atomic(v93, v94, v91, 24LL);
          }

          objc_getProperty(v152, v96, 112LL, 1);
          id v97 = (void *)objc_claimAutoreleasedReturnValue();
          char v98 = -[NEIKEv2Payload isValid]((uint64_t)v97);

          if ((v98 & 1) != 0)
          {
            id v99 = v9;
            id v100 = v4;
            id v101 = objc_alloc_init(&OBJC_CLASS___NEIKEv2KeyExchangePayload);
            objc_setProperty_atomic(v152, v102, v101, 104LL);

            id v104 = objc_getProperty(self, v103, 96LL, 1);
            -[NEIKEv2IKESAProposal kemProtocol](v104, v105);
            id v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_getProperty(v152, v107, 104LL, 1);
            id v108 = (void *)objc_claimAutoreleasedReturnValue();
            id v110 = v108;
            if (v108) {
              objc_setProperty_atomic(v108, v109, v106, 24LL);
            }

            id v112 = objc_getProperty(self, v111, 160LL, 1);
            id v113 = v112;
            if (v112) {
              id v114 = (void *)*((void *)v112 + 2);
            }
            else {
              id v114 = 0LL;
            }
            id v115 = v114;
            objc_getProperty(v152, v116, 104LL, 1);
            id v117 = (void *)objc_claimAutoreleasedReturnValue();
            id v119 = v117;
            if (v117) {
              objc_setProperty_atomic(v117, v118, v115, 32LL);
            }

            objc_getProperty(v152, v120, 104LL, 1);
            SEL v121 = (void *)objc_claimAutoreleasedReturnValue();
            char v122 = -[NEIKEv2Payload isValid]((uint64_t)v121);

            if ((v122 & 1) != 0)
            {
              uint64_t v53 = v152;
              id v4 = v100;
              uint64_t v9 = v99;
              id v13 = self;
              id v59 = v53;
            }

            else
            {
              ne_log_obj();
              id v145 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              id v4 = v100;
              if (os_log_type_enabled(v145, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                SEL v167 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyIKESAForInitiator:]";
                _os_log_fault_impl( &dword_1876B1000,  v145,  OS_LOG_TYPE_FAULT,  "%s called with null packet.ke.isValid",  buf,  0xCu);
              }

              uint64_t v53 = 0LL;
              uint64_t v9 = v99;
              id v13 = self;
              id v59 = v152;
            }

            goto LABEL_71;
          }

          ne_log_obj();
          id v123 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v123, OS_LOG_TYPE_FAULT)) {
            goto LABEL_69;
          }
          *(_DWORD *)buf = 136315138;
          SEL v167 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyIKESAForInitiator:]";
          uint64_t v124 = "%s called with null packet.nonce.isValid";
        }

        else
        {
          ne_log_obj();
          id v123 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v123, OS_LOG_TYPE_FAULT))
          {
LABEL_69:

LABEL_70:
            uint64_t v53 = 0LL;
LABEL_71:

            if (v53)
            {
              v153[0] = MEMORY[0x1895F87A8];
              v153[1] = 3221225472LL;
              v153[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_2;
              v153[3] = &unk_18A08D280;
              v153[4] = a1;
              id v125 = v4;
              id v154 = v125;
              SEL v155 = v13;
              id v156 = v9;
              if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v53, v153) == -1)
              {
                [v125 sendCallbackSuccess:0 session:a1];
                if (a1) {
                  id v127 = objc_getProperty(a1, v126, 336LL, 1);
                }
                else {
                  id v127 = 0LL;
                }
                id v128 = v127;
                uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"initiator rekey IKE SA",  v129,  v130,  v131,  v132,  v133,  v134,  v135,  v147);
                -[NEIKEv2IKESA setState:error:]((uint64_t)v128, 3uLL, ErrorFailedToSend);

                -[NEIKEv2Session reportState](a1, v137);
                -[NEIKEv2Session resetAll]((uint64_t)a1, v138);
              }
            }

            else
            {
              ne_log_obj();
              uint64_t v139 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl( &dword_1876B1000,  v139,  OS_LOG_TYPE_ERROR,  "Failed to create Create Child SA packet (initiate rekey)",  buf,  2u);
              }

              uint64_t v141 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
              if (a1) {
                id v142 = objc_getProperty(a1, v140, 368LL, 1);
              }
              else {
                id v142 = 0LL;
              }
              id v143 = v142;
              v157[0] = MEMORY[0x1895F87A8];
              v157[1] = 3221225472LL;
              v157[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_404;
              v157[3] = &unk_18A08CF10;
              id v158 = v4;
              id v159 = a1;
              SEL v144 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v141->super.super.isa,  0,  v143,  v157);

              -[NEIKEv2Session initiateDelete:](a1, v144);
              uint64_t v53 = 0LL;
            }

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke(uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create valid IKE SA (initiate rekey)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_401(uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto( @"Failed to generate local IKE crypto values (initiate rekey)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_404(uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create Create Child SA packet (initiate rekey)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v284 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v38,  OS_LOG_TYPE_ERROR,  "Failed to receive Create Child SA packet (initiate rekey)",  buf,  2u);
    }

    uint64_t v40 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v39, 368LL, 1);
    }
    id v42 = Property;
    v266[0] = MEMORY[0x1895F87A8];
    v266[1] = 3221225472LL;
    v266[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_407;
    v266[3] = &unk_18A08CF10;
    SEL v43 = (id *)v267;
    id v44 = *(id *)(a1 + 40);
    uint64_t v45 = *(void *)(a1 + 32);
    v267[0] = v44;
    v267[1] = v45;
    id v46 = v266;
    goto LABEL_117;
  }

  id v4 = *(id *)(a1 + 48);
  uint64_t v6 = v4;
  if (!v3) {
    goto LABEL_112;
  }
  if (!v4)
  {
    ne_log_obj();
    uint64_t ErrorPeerInvalidSyntax = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(ErrorPeerInvalidSyntax, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)unint64_t v276 = 136315138;
      uint64_t v277 = "-[NEIKEv2CreateChildPacket(Exchange) validateRekeyIKESA:]";
      _os_log_fault_impl( &dword_1876B1000,  ErrorPeerInvalidSyntax,  OS_LOG_TYPE_FAULT,  "%s called with null ikeSA",  v276,  0xCu);
    }

    goto LABEL_111;
  }

  __int128 v274 = 0u;
  __int128 v275 = 0u;
  __int128 v272 = 0u;
  __int128 v273 = 0u;
  uint64_t ErrorPeerInvalidSyntax = (os_log_s *)objc_getProperty(v3, v7, 64LL, 1);
  uint64_t v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( ErrorPeerInvalidSyntax,  "countByEnumeratingWithState:objects:count:",  &v272,  buf,  16LL);
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v273;
  do
  {
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      if (*(void *)v273 != v11) {
        objc_enumerationMutation(ErrorPeerInvalidSyntax);
      }
      id v13 = *(const __CFString **)(*((void *)&v272 + 1) + 8 * i);
      if (v13 && (unint64_t)(v13->length - 1) <= 0x3FFE)
      {
        id v28 = -[NEIKEv2NotifyPayload copyError](v13);
        ne_log_obj();
        uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          uint64_t v153 = (char *)[v3 copyShortDescription];
          *(_DWORD *)unint64_t v276 = 138412546;
          uint64_t v277 = v153;
          __int16 v278 = 2112;
          uint64_t v279 = v28;
          _os_log_error_impl( &dword_1876B1000,  v47,  OS_LOG_TYPE_ERROR,  "%@ Rekey IKE received notify error %@",  v276,  0x16u);
        }

LABEL_47:
        -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v28);
LABEL_110:

LABEL_111:
LABEL_112:

        ne_log_obj();
        uint64_t v209 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_1876B1000,  v209,  OS_LOG_TYPE_ERROR,  "Failed to process Create Child SA packet (initiate rekey)",  buf,  2u);
        }

        uint64_t v40 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
        id v211 = *(id *)(a1 + 32);
        if (v211) {
          id v211 = objc_getProperty(v211, v210, 368LL, 1);
        }
        id v42 = v211;
        v264[0] = MEMORY[0x1895F87A8];
        v264[1] = 3221225472LL;
        v264[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_410;
        v264[3] = &unk_18A08CF10;
        SEL v43 = (id *)v265;
        id v212 = *(id *)(a1 + 40);
        uint64_t v213 = *(void *)(a1 + 32);
        v265[0] = v212;
        v265[1] = v213;
        id v46 = v264;
        goto LABEL_117;
      }
    }

    uint64_t v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( ErrorPeerInvalidSyntax,  "countByEnumeratingWithState:objects:count:",  &v272,  buf,  16LL);
  }

  while (v10);
LABEL_14:

LABEL_15:
  objc_getProperty(v3, v7, 88LL, 1);
  SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v14;
  if (v14) {
    SEL v14 = objc_getProperty(v14, v15, 32LL, 1);
  }
  id v17 = v14;
  uint64_t v18 = [v17 value];

  if (!v18)
  {
    ne_log_obj();
    id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      id v163 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v163;
      _os_log_error_impl(&dword_1876B1000, v48, OS_LOG_TYPE_ERROR, "%@ SA proposal missing rekey SPI", v276, 0xCu);
    }

    uint64_t ErrorPeerInvalidSyntax = (os_log_s *)NEIKEv2CreateErrorPeerInvalidSyntax( @"SA proposal missing rekey SPI",  v49,  v50,  v51,  v52,  v53,  v54,  v55,  v247);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, ErrorPeerInvalidSyntax);
    goto LABEL_111;
  }

  objc_getProperty(v3, v19, 88LL, 1);
  SEL v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = v20;
  if (v20) {
    SEL v20 = objc_getProperty(v20, v21, 32LL, 1);
  }
  id v23 = v20;
  -[NEIKEv2IKESA assignRemoteSPI:](v6, v23);

  objc_getProperty(v3, v24, 88LL, 1);
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  SEL v27 = v25;
  if (v25) {
    id v25 = objc_getProperty(v25, v26, 24LL, 1);
  }
  uint64_t ErrorPeerInvalidSyntax = v25;

  if (-[os_log_s count](ErrorPeerInvalidSyntax, "count") != 1)
  {
    ne_log_obj();
    SEL v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      id v164 = (char *)[v3 copyShortDescription];
      uint64_t v165 = -[os_log_s count](ErrorPeerInvalidSyntax, "count");
      *(_DWORD *)unint64_t v276 = 138412546;
      uint64_t v277 = v164;
      __int16 v278 = 2048;
      uint64_t v279 = (_BYTE *)v165;
      _os_log_error_impl( &dword_1876B1000,  v56,  OS_LOG_TYPE_ERROR,  "%@ Received %zu SA proposals, require 1",  v276,  0x16u);
    }

    uint64_t v57 = -[os_log_s count](ErrorPeerInvalidSyntax, "count");
    id v28 = (_BYTE *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Received %zu SA proposals, require 1",  v58,  v59,  v60,  v61,  v62,  v63,  v64,  v57);
    goto LABEL_47;
  }

  -[os_log_s firstObject](ErrorPeerInvalidSyntax, "firstObject");
  id v28 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if ((-[NEIKEv2IKESAProposal isAValidResponse](v28, v29) & 1) == 0)
  {
    ne_log_obj();
    uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      SEL v167 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412546;
      uint64_t v277 = v167;
      __int16 v278 = 2112;
      uint64_t v279 = v28;
      _os_log_error_impl( &dword_1876B1000,  v65,  OS_LOG_TYPE_ERROR,  "%@ Received invalid SA proposal for rekey %@",  v276,  0x16u);
    }

    id v73 = (id)NEIKEv2CreateErrorPeerInvalidSyntax( @"Received invalid SA proposal for rekey",  v66,  v67,  v68,  v69,  v70,  v71,  v72,  v247);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v73);
    goto LABEL_109;
  }

  __int128 v270 = 0u;
  __int128 v271 = 0u;
  __int128 v268 = 0u;
  __int128 v269 = 0u;
  id v31 = objc_getProperty(v6, v30, 80LL, 1);
  [v31 proposals];
  id v32 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v33 = [v32 countByEnumeratingWithState:&v268 objects:v282 count:16];
  if (!v33)
  {
LABEL_32:

LABEL_77:
    ne_log_obj();
    id v143 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
    {
      __int128 v169 = (char *)[v3 copyShortDescription];
      id v171 = objc_getProperty(v6, v170, 80LL, 1);
      [v171 proposals];
      uint64_t v172 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)unint64_t v276 = 138412802;
      uint64_t v277 = v169;
      __int16 v278 = 2112;
      uint64_t v279 = v28;
      __int16 v280 = 2112;
      uint64_t v281 = (uint64_t)v172;
      _os_log_error_impl( &dword_1876B1000,  v143,  OS_LOG_TYPE_ERROR,  "%@ Received proposal for rekey %@ does not match config %@",  v276,  0x20u);
    }

    id v73 = objc_getProperty(v6, v144, 80LL, 1);
    [v73 proposals];
    id v133 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v152 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Received proposal for rekey %@ does not match config %@",  v145,  v146,  v147,  v148,  v149,  v150,  v151,  (uint64_t)v28);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v152);

    goto LABEL_108;
  }

  uint64_t v34 = v33;
  uint64_t v35 = *(void *)v269;
LABEL_26:
  uint64_t v36 = 0LL;
  while (1)
  {
    if (*(void *)v269 != v35) {
      objc_enumerationMutation(v32);
    }
    id v37 = *(void **)(*((void *)&v268 + 1) + 8 * v36);
    if (v34 == ++v36)
    {
      uint64_t v34 = [v32 countByEnumeratingWithState:&v268 objects:v282 count:16];
      if (v34) {
        goto LABEL_26;
      }
      goto LABEL_32;
    }
  }

  id v73 = v37;

  if (!v73) {
    goto LABEL_77;
  }
  uint64_t v74 = -[NEIKEv2IKESAProposal copyFromRemote:preferRemoteProposal:](v73, v28, 0);
  objc_setProperty_atomic(v6, v75, v74, 96LL);

  id v77 = objc_getProperty(v6, v76, 96LL, 1);
  if (!v77)
  {
    ne_log_obj();
    id v154 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
    {
      id v206 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v206;
      _os_log_error_impl( &dword_1876B1000,  v154,  OS_LOG_TYPE_ERROR,  "%@ Could not set chosen proposal values",  v276,  0xCu);
    }

    uint64_t v162 = @"Could not set chosen proposal values";
    goto LABEL_106;
  }

  objc_getProperty(v3, v78, 104LL, 1);
  SEL v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v79)
  {
    ne_log_obj();
    id v166 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
    {
      id v215 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v215;
      _os_log_error_impl(&dword_1876B1000, v166, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload", v276, 0xCu);
    }

    uint64_t v162 = @"Did not receive KE payload";
    goto LABEL_106;
  }

  objc_getProperty(v3, v80, 104LL, 1);
  SEL v81 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v83 = v81;
  if (v81) {
    SEL v81 = objc_getProperty(v81, v82, 24LL, 1);
  }
  id v84 = v81;

  if (!v84)
  {
    ne_log_obj();
    __int128 v168 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
    {
      id v216 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v216;
      _os_log_error_impl( &dword_1876B1000,  v168,  OS_LOG_TYPE_ERROR,  "%@ Did not receive method in KE payload",  v276,  0xCu);
    }

    uint64_t v162 = @"Did not receive method in KE payload";
    goto LABEL_106;
  }

  objc_getProperty(v3, v85, 104LL, 1);
  id v86 = (void *)objc_claimAutoreleasedReturnValue();
  id v88 = v86;
  if (v86) {
    id v86 = objc_getProperty(v86, v87, 32LL, 1);
  }
  id v89 = v86;

  if (!v89)
  {
    ne_log_obj();
    unint64_t v173 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
    {
      SEL v217 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v217;
      _os_log_error_impl(&dword_1876B1000, v173, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload", v276, 0xCu);
    }

    uint64_t v162 = @"Did not receive data in KE payload";
    goto LABEL_106;
  }

  objc_getProperty(v3, v90, 104LL, 1);
  id v91 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v253 = v91;
  if (v91) {
    id v91 = objc_getProperty(v91, v92, 24LL, 1);
  }
  id v93 = v91;
  uint64_t v251 = [v93 method];
  id v95 = objc_getProperty(v6, v94, 96LL, 1);
  -[NEIKEv2IKESAProposal kemProtocol](v95, v96);
  id v97 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v98 = [v97 method];

  if (v251 != v98)
  {
    ne_log_obj();
    id v174 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v175 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
    if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
    {
      SEL v252 = (char *)[v3 copyShortDescription];
      objc_getProperty(v3, v218, 104LL, 1);
      id v219 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v255 = v219;
      if (v219) {
        id v219 = objc_getProperty(v219, v220, 24LL, 1);
      }
      id v250 = v219;
      uint64_t v249 = [v250 method];
      id v222 = objc_getProperty(v6, v221, 96LL, 1);
      -[NEIKEv2IKESAProposal kemProtocol](v222, v223);
      uint64_t v224 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v225 = [v224 method];
      *(_DWORD *)unint64_t v276 = 138412802;
      uint64_t v277 = v252;
      __int16 v278 = 2048;
      uint64_t v279 = (_BYTE *)v249;
      __int16 v280 = 2048;
      uint64_t v281 = v225;
      _os_log_error_impl( &dword_1876B1000,  v174,  OS_LOG_TYPE_ERROR,  "%@ Did not receive matching method from KE payload (%zu != %zu)",  v276,  0x20u);

      uint64_t v175 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
    }

    objc_getProperty(v3, v176, v175[754], 1);
    id v177 = (void *)objc_claimAutoreleasedReturnValue();
    id v133 = v177;
    if (v177) {
      id v177 = objc_getProperty(v177, v178, 24LL, 1);
    }
    id v254 = v177;
    uint64_t v179 = [v254 method];
    id v181 = objc_getProperty(v6, v180, 96LL, 1);
    -[NEIKEv2IKESAProposal kemProtocol](v181, v182);
    uint64_t v183 = (void *)objc_claimAutoreleasedReturnValue();
    [v183 method];
    id v191 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive matching method from KE payload (%zu != %zu)",  v184,  v185,  v186,  v187,  v188,  v189,  v190,  v179);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v191);

LABEL_108:
LABEL_109:

    goto LABEL_110;
  }

  objc_getProperty(v3, v99, 104LL, 1);
  id v100 = (void *)objc_claimAutoreleasedReturnValue();
  SEL v102 = v100;
  if (v100) {
    id v100 = objc_getProperty(v100, v101, 32LL, 1);
  }
  id v103 = v100;
  objc_setProperty_atomic(v6, v104, v103, 152LL);

  id v105 = -[NEIKEv2Packet copyNotification:](v3, (const char *)0x4039);
  objc_setProperty_atomic(v6, v106, v105, 176LL);

  SEL v107 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
  objc_getProperty(v3, v108, 112LL, 1);
  id v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v109)
  {
    ne_log_obj();
    SEL v192 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
    {
      uint64_t v226 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v226;
      _os_log_error_impl(&dword_1876B1000, v192, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE payload", v276, 0xCu);
    }

    uint64_t v162 = @"Did not receive NONCE payload";
    goto LABEL_106;
  }

  objc_getProperty(v3, v110, 112LL, 1);
  SEL v111 = (void *)objc_claimAutoreleasedReturnValue();
  id v113 = v111;
  id v114 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
  if (v111) {
    SEL v111 = objc_getProperty(v111, v112, 24LL, 1);
  }
  id v115 = v111;

  if (!v115)
  {
    ne_log_obj();
    id v207 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
    {
      SEL v227 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v227;
      _os_log_error_impl(&dword_1876B1000, v207, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE data", v276, 0xCu);
    }

    uint64_t v162 = @"Did not receive NONCE data";
LABEL_106:
    SEL v208 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v162, v155, v156, v157, v158, v159, v160, v161, v247);
LABEL_107:
    id v133 = v208;
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v208);
    goto LABEL_108;
  }

  id v117 = objc_getProperty(v6, v116, 80LL, 1);
  int v118 = [v117 strictNonceSizeChecks];

  if (!v118) {
    goto LABEL_99;
  }
  objc_getProperty(v3, v119, 112LL, 1);
  SEL v120 = (void *)objc_claimAutoreleasedReturnValue();
  char v122 = v120;
  if (v120) {
    SEL v120 = objc_getProperty(v120, v121, 24LL, 1);
  }
  id v123 = v120;
  unint64_t v124 = [v123 length];

  if (v124 - 257 <= 0xFFFFFFFFFFFFFF0ELL)
  {
    ne_log_obj();
    SEL v238 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v238, OS_LOG_TYPE_ERROR))
    {
      uint64_t v246 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412546;
      uint64_t v277 = v246;
      __int16 v278 = 2048;
      uint64_t v279 = (_BYTE *)v124;
      _os_log_error_impl( &dword_1876B1000,  v238,  OS_LOG_TYPE_ERROR,  "%@ NONCE data length %zu is out of bounds",  v276,  0x16u);
    }

    SEL v208 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"NONCE data length %zu is out of bounds",  v239,  v240,  v241,  v242,  v243,  v244,  v245,  v124);
    goto LABEL_107;
  }

  id v126 = objc_getProperty(v6, v125, 96LL, 1);
  -[NEIKEv2IKESAProposal prfProtocol](v126, v127);
  id v128 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v129 = [v128 nonceSize];

  BOOL v130 = v124 >= v129;
  SEL v107 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
  id v114 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
  if (!v130)
  {
    ne_log_obj();
    uint64_t v131 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    {
      SEL v228 = (char *)[v3 copyShortDescription];
      unint64_t v256 = v124;
      id v230 = objc_getProperty(v6, v229, 96LL, 1);
      -[NEIKEv2IKESAProposal prfProtocol](v230, v231);
      uint64_t v232 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)unint64_t v276 = 138412802;
      uint64_t v277 = v228;
      __int16 v278 = 2048;
      uint64_t v279 = (_BYTE *)v256;
      __int16 v280 = 2112;
      uint64_t v281 = (uint64_t)v232;
      _os_log_error_impl( &dword_1876B1000,  v131,  OS_LOG_TYPE_ERROR,  "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@",  v276,  0x20u);

      unint64_t v124 = v256;
    }

    id v133 = objc_getProperty(v6, v132, 96LL, 1);
    -[NEIKEv2IKESAProposal prfProtocol](v133, v134);
    char v248 = (void *)objc_claimAutoreleasedReturnValue();
    id v142 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"NONCE data length %zu is shorter than the minimum for PRF protocol %@",  v135,  v136,  v137,  v138,  v139,  v140,  v141,  v124);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v142);

    goto LABEL_108;
  }

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_407(uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to receive Create Child SA packet (initiate rekey)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_410(uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to process Create Child SA packet (initiate rekey)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_413(uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto( @"Failed to process KE data (initiate rekey)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_2_416(uint64_t a1)
{
  uint64_t v2 = *(_BYTE **)(a1 + 32);
  if (v2 && (-[NEIKEv2IKESA generateAllValuesUsingSA:](v2, *(void **)(a1 + 40)) & 1) != 0)
  {
    id v4 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
    id Property = *(id *)(a1 + 48);
    if (Property) {
      id Property = objc_getProperty(Property, v3, 368LL, 1);
    }
    id v6 = Property;
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_2_420;
    v20[3] = &unk_18A08D118;
    uint64_t v7 = (id *)v21;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void **)(a1 + 56);
    v21[0] = v8;
    v21[1] = v9;
    uint64_t v22 = v10;
    uint64_t v11 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v4->super.super.isa,  1,  v6,  v20);

    -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 48), v11);
    uint64_t v12 = v22;
  }

  else
  {
    ne_log_obj();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_ERROR,  "Failed to generate IKE SA crypto values (initiate rekey)",  buf,  2u);
    }

    uint64_t v15 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
    id v16 = *(id *)(a1 + 48);
    if (v16) {
      id v16 = objc_getProperty(v16, v14, 368LL, 1);
    }
    id v17 = v16;
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_417;
    v23[3] = &unk_18A08CF10;
    uint64_t v7 = (id *)v24;
    id v18 = *(id *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 48);
    v24[0] = v18;
    v24[1] = v19;
    uint64_t v12 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v15->super.super.isa,  0,  v17,  v23);

    -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 48), v12);
  }
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_417(uint64_t a1)
{
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336LL, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto( @"Failed to generate IKE SA crypto values (initiate rekey)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  -[NEIKEv2Session reportState](*(void **)(a1 + 40), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v14);
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_2_420(uint64_t a1, int a2)
{
  if (a2)
  {
    -[NEIKEv2IKESA setState:error:](*(void *)(a1 + 32), 2uLL, 0LL);
    -[NEIKEv2Session setIKESA:](*(void *)(a1 + 40), *(void **)(a1 + 32));
    [*(id *)(a1 + 48) sendCallbackSuccess:1 session:*(void *)(a1 + 40)];
    ne_log_obj();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "Rekeyed IKE SA", buf, 2u);
    }
  }

  else
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Failed to process Create Child SA Delete packet response (initiate rekey)",  (uint8_t *)&v18,  2u);
    }

    [*(id *)(a1 + 48) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
    id Property = *(id *)(a1 + 40);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 336LL, 1);
    }
    id v7 = Property;
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to process Create Child SA Delete packet response (initiate rekey)",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v18);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, ErrorPeerInvalidSyntax);

    -[NEIKEv2Session reportState](*(void **)(a1 + 40), v16);
    -[NEIKEv2Session resetAll](*(void *)(a1 + 40), v17);
  }

- (void)receiveRekeyIKESA:(void *)a1
{
  uint64_t v384 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_getProperty(a1, v3, 368LL, 1);
    dispatch_assert_queue_V2(v5);

    id v7 = objc_getProperty(a1, v6, 336LL, 1);
    uint64_t v8 = v7;
    if (!v7)
    {
      ne_log_obj();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[NEIKEv2Session(Exchange) receiveRekeyIKESA:]";
        _os_log_fault_impl(&dword_1876B1000, v10, OS_LOG_TYPE_FAULT, "%s called with null oldIKESA", buf, 0xCu);
      }

      goto LABEL_69;
    }

    if ((v7[16] & 1) != 0)
    {
      ne_log_obj();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_DEBUG,  "IKE SA already rekeying, skipping (receive rekey)",  buf,  2u);
      }

      goto LABEL_69;
    }

    v7[16] = 1;
    uint64_t v9 = -[NEIKEv2IKESA copyForRekey]((uint64_t)v7);
    if (!v9)
    {
      ne_log_obj();
      id v103 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v103,  OS_LOG_TYPE_ERROR,  "Failed to create valid IKE SA (receive rekey)",  buf,  2u);
      }

      SEL v104 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
      id v106 = objc_getProperty(a1, v105, 368LL, 1);
      v372[0] = MEMORY[0x1895F87A8];
      v372[1] = 3221225472LL;
      v372[2] = __46__NEIKEv2Session_Exchange__receiveRekeyIKESA___block_invoke;
      v372[3] = &unk_18A08D468;
      v372[4] = a1;
      SEL v107 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v104->super.super.isa,  0,  v106,  v372);

      -[NEIKEv2Session initiateDelete:](a1, v107);
      uint64_t v10 = 0LL;
      goto LABEL_69;
    }

    *((_BYTE *)v9 + 9) = 0;
    uint64_t v10 = v9;
    if (-[NEIKEv2Packet hasErrors](v4, v11))
    {
      __int128 v382 = 0u;
      __int128 v383 = 0u;
      *(_OWORD *)SEL v380 = 0u;
      __int128 v381 = 0u;
      if (v4) {
        id Property = objc_getProperty(v4, v12, 64LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id ErrorPeerInvalidSyntax = Property;
      uint64_t v15 = [ErrorPeerInvalidSyntax countByEnumeratingWithState:v380 objects:buf count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v381;
        while (2)
        {
          for (uint64_t i = 0LL; i != v16; ++i)
          {
            if (*(void *)v381 != v17) {
              objc_enumerationMutation(ErrorPeerInvalidSyntax);
            }
            uint64_t v19 = *(const __CFString **)(*(void *)&v380[8] + 8 * i);
            if (v19 && (unint64_t)(v19->length - 1) <= 0x3FFE)
            {
              SEL v108 = (__CFString *)-[NEIKEv2NotifyPayload copyError](v19);
              ne_log_obj();
              id v109 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
              {
                __int128 v271 = (void *)[v4 copyShortDescription];
                *(_DWORD *)__int128 v373 = 138412546;
                __int128 v374 = v271;
                __int16 v375 = 2112;
                unint64_t v376 = (unint64_t)v108;
                _os_log_error_impl( &dword_1876B1000,  v109,  OS_LOG_TYPE_ERROR,  "%@ Responder rekey IKE received notify error %@",  v373,  0x16u);
              }

              -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v108);
              goto LABEL_61;
            }
          }

          uint64_t v16 = [ErrorPeerInvalidSyntax countByEnumeratingWithState:v380 objects:buf count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
    }

    SEL v20 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
    objc_getProperty(v4, v12, 88LL, 1);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = v21;
    if (v21) {
      uint64_t v21 = objc_getProperty(v21, v22, 32LL, 1);
    }
    id v24 = v21;
    uint64_t v25 = [v24 value];

    if (!v25)
    {
      ne_log_obj();
      id v110 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        __int128 v272 = (void *)[v4 copyShortDescription];
        *(_DWORD *)__int128 v373 = 138412290;
        __int128 v374 = v272;
        _os_log_error_impl(&dword_1876B1000, v110, OS_LOG_TYPE_ERROR, "%@ SA proposal missing rekey SPI", v373, 0xCu);
      }

      id ErrorPeerInvalidSyntax = (id)NEIKEv2CreateErrorPeerInvalidSyntax( @"SA proposal missing rekey SPI",  v111,  v112,  v113,  v114,  v115,  v116,  v117,  v361);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, ErrorPeerInvalidSyntax);
LABEL_61:

      v8[16] = 0;
      unint64_t v102 = 7LL;
      goto LABEL_62;
    }

    objc_getProperty(v4, v26, 88LL, 1);
    SEL v27 = (void *)objc_claimAutoreleasedReturnValue();
    id v29 = v27;
    if (v27) {
      SEL v27 = objc_getProperty(v27, v28, 32LL, 1);
    }
    id v30 = v27;
    -[NEIKEv2IKESA assignRemoteSPI:](v10, v30);

    objc_getProperty(v4, v31, 88LL, 1);
    id v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = v32;
    if (v32) {
      id v32 = objc_getProperty(v32, v33, 24LL, 1);
    }
    id v35 = v32;

    uint64_t v36 = v35;
    id v38 = objc_getProperty(v10, v37, 80LL, 1);
    [v38 proposals];
    SEL v39 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v366 = v39;
    if ([v36 count])
    {
      id v41 = objc_getProperty(v10, v40, 80LL, 1);
      id v42 = +[NEIKEv2IKESAProposal chooseSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:]( (uint64_t)NEIKEv2IKESAProposal,  v39,  v36,  [v41 preferInitiatorProposalOrder]);
      objc_setProperty_atomic(v10, v43, v42, 96LL);

      id v45 = objc_getProperty(v10, v44, 96LL, 1);
      if (!v45)
      {
        ne_log_obj();
        uint64_t v148 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
        {
          uint64_t v282 = (void *)[v4 copyShortDescription];
          *(_DWORD *)__int128 v373 = 138412290;
          __int128 v374 = v282;
          _os_log_error_impl(&dword_1876B1000, v148, OS_LOG_TYPE_ERROR, "%@ No matching proposal found", v373, 0xCu);
        }

        id v100 = (id)NEIKEv2CreateErrorPeerInvalidSyntax( @"No matching proposal found",  v149,  v150,  v151,  v152,  v153,  v154,  v155,  v361);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v100);
        char v101 = 0;
        unint64_t v102 = 14LL;
        goto LABEL_87;
      }

      objc_getProperty(v4, v46, 104LL, 1);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        objc_getProperty(v4, v48, 104LL, 1);
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v51 = v49;
        if (v49) {
          uint64_t v49 = objc_getProperty(v49, v50, 24LL, 1);
        }
        id v52 = v49;

        if (v52)
        {
          objc_getProperty(v4, v53, 104LL, 1);
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
          SEL v56 = v54;
          if (v54) {
            uint64_t v54 = objc_getProperty(v54, v55, 32LL, 1);
          }
          id v57 = v54;

          if (v57)
          {
            objc_getProperty(v4, v58, 104LL, 1);
            uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v61 = v59;
            __int16 v365 = v36;
            if (v59) {
              uint64_t v59 = objc_getProperty(v59, v60, 24LL, 1);
            }
            id v62 = v59;
            uint64_t v63 = [v62 method];
            id v65 = objc_getProperty(v10, v64, 96LL, 1);
            -[NEIKEv2IKESAProposal kemProtocol](v65, v66);
            uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v68 = [v67 method];

            if (v63 != v68)
            {
              ne_log_obj();
              SEL v252 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              uint64_t v253 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
              if (os_log_type_enabled(v252, OS_LOG_TYPE_ERROR))
              {
                unint64_t v364 = (void *)[v4 copyShortDescription];
                objc_getProperty(v4, v333, 104LL, 1);
                uint64_t v334 = (void *)objc_claimAutoreleasedReturnValue();
                int v336 = v334;
                if (v334) {
                  uint64_t v334 = objc_getProperty(v334, v335, 24LL, 1);
                }
                id v363 = v334;
                uint64_t v337 = [v363 method];
                id v339 = objc_getProperty(v10, v338, 96LL, 1);
                -[NEIKEv2IKESAProposal kemProtocol](v339, v340);
                id v341 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)__int128 v373 = 138412802;
                __int128 v374 = v364;
                __int16 v375 = 2048;
                unint64_t v376 = v337;
                __int16 v377 = 2048;
                uint64_t v378 = [v341 method];
                _os_log_error_impl( &dword_1876B1000,  v252,  OS_LOG_TYPE_ERROR,  "%@ Received KE method %zu does not match KE method %zu in SA rekey proposal",  v373,  0x20u);

                uint64_t v253 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
              }

              id v100 = (id)[v4 copyShortDescription];
              objc_getProperty(v4, v254, v253[754], 1);
              uint64_t v255 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v257 = v255;
              if (v255) {
                uint64_t v255 = objc_getProperty(v255, v256, 24LL, 1);
              }
              id v258 = v255;
              [v258 method];
              id v260 = objc_getProperty(v10, v259, 96LL, 1);
              -[NEIKEv2IKESAProposal kemProtocol](v260, v261);
              uint64_t v262 = (void *)objc_claimAutoreleasedReturnValue();
              [v262 method];
              __int128 v270 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Received KE method %zu does not match KE method %zu in SA rekey proposal",  v263,  v264,  v265,  v266,  v267,  v268,  v269,  (uint64_t)v100);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v270);

              char v101 = 0;
              unint64_t v102 = 17LL;
              goto LABEL_155;
            }

            objc_getProperty(v4, v69, 104LL, 1);
            uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v72 = v70;
            uint64_t v36 = v365;
            if (v70) {
              uint64_t v70 = objc_getProperty(v70, v71, 32LL, 1);
            }
            id v73 = v70;
            objc_setProperty_atomic(v10, v74, v73, 152LL);

            objc_getProperty(v4, v75, 112LL, 1);
            SEL v76 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v76)
            {
              ne_log_obj();
              __int128 v274 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v274, OS_LOG_TYPE_ERROR))
              {
                uint64_t v342 = (void *)[v4 copyShortDescription];
                *(_DWORD *)__int128 v373 = 138412290;
                __int128 v374 = v342;
                _os_log_error_impl( &dword_1876B1000,  v274,  OS_LOG_TYPE_ERROR,  "%@ Did not receive NONCE payload",  v373,  0xCu);
              }

              id v100 = (id)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive NONCE payload",  v275,  v276,  v277,  v278,  v279,  v280,  v281,  v361);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v100);
              char v101 = 0;
              unint64_t v102 = 7LL;
              goto LABEL_137;
            }

            objc_getProperty(v4, v77, 112LL, 1);
            id v78 = (void *)objc_claimAutoreleasedReturnValue();
            id v80 = v78;
            if (v78) {
              id v78 = objc_getProperty(v78, v79, 24LL, 1);
            }
            id v81 = v78;

            if (!v81)
            {
              ne_log_obj();
              uint64_t v303 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v303, OS_LOG_TYPE_ERROR))
              {
                id v352 = (void *)[v4 copyShortDescription];
                *(_DWORD *)__int128 v373 = 138412290;
                __int128 v374 = v352;
                _os_log_error_impl( &dword_1876B1000,  v303,  OS_LOG_TYPE_ERROR,  "%@ Did not receive NONCE data",  v373,  0xCu);
              }

              id v100 = (id)NEIKEv2CreateErrorPeerInvalidSyntax( @"Did not receive NONCE data",  v304,  v305,  v306,  v307,  v308,  v309,  v310,  v361);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v100);
              goto LABEL_154;
            }

            id v83 = objc_getProperty(v10, v82, 80LL, 1);
            int v84 = [v83 strictNonceSizeChecks];

            if (v84)
            {
              objc_getProperty(v4, v85, 112LL, 1);
              id v86 = (void *)objc_claimAutoreleasedReturnValue();
              id v88 = v86;
              if (v86) {
                id v86 = objc_getProperty(v86, v87, 24LL, 1);
              }
              id v89 = v86;
              unint64_t v90 = [v89 length];

              if (v90 - 257 <= 0xFFFFFFFFFFFFFF0ELL)
              {
                ne_log_obj();
                SEL v92 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                uint64_t v36 = v365;
                if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                {
                  id v353 = (void *)[v4 copyShortDescription];
                  *(_DWORD *)__int128 v373 = 138412546;
                  __int128 v374 = v353;
                  __int16 v375 = 2048;
                  unint64_t v376 = v90;
                  _os_log_error_impl( &dword_1876B1000,  v92,  OS_LOG_TYPE_ERROR,  "%@ NONCE data length %zu is out of bounds",  v373,  0x16u);
                }

                id v100 = (id)NEIKEv2CreateErrorPeerInvalidSyntax( @"NONCE data length %zu is out of bounds",  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v90);
                -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v100);
                char v101 = 0;
                unint64_t v102 = 7LL;
LABEL_137:
                SEL v20 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
                goto LABEL_87;
              }

              id v313 = objc_getProperty(v10, v91, 96LL, 1);
              -[NEIKEv2IKESAProposal prfProtocol](v313, v314);
              uint64_t v315 = (void *)objc_claimAutoreleasedReturnValue();
              unsigned int v316 = [v315 nonceSize];

              if (v90 < v316)
              {
                ne_log_obj();
                id v317 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v317, OS_LOG_TYPE_ERROR))
                {
                  id v354 = (void *)[v4 copyShortDescription];
                  id v356 = objc_getProperty(v10, v355, 96LL, 1);
                  -[NEIKEv2IKESAProposal prfProtocol](v356, v357);
                  unint64_t v358 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)__int128 v373 = 138412802;
                  __int128 v374 = v354;
                  __int16 v375 = 2048;
                  unint64_t v376 = v90;
                  __int16 v377 = 2112;
                  uint64_t v378 = (uint64_t)v358;
                  _os_log_error_impl( &dword_1876B1000,  v317,  OS_LOG_TYPE_ERROR,  "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@",  v373,  0x20u);
                }

                id v100 = objc_getProperty(v10, v318, 96LL, 1);
                -[NEIKEv2IKESAProposal prfProtocol](v100, v319);
                id v362 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v327 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"NONCE data length %zu is shorter than the minimum for PRF protocol %@",  v320,  v321,  v322,  v323,  v324,  v325,  v326,  v90);
                -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v327);

LABEL_154:
                char v101 = 0;
                unint64_t v102 = 7LL;
LABEL_155:
                SEL v20 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
                uint64_t v36 = v365;
                goto LABEL_87;
              }
            }

            objc_getProperty(v4, v85, 112LL, 1);
            uint64_t v328 = (void *)objc_claimAutoreleasedReturnValue();
            id v100 = v328;
            uint64_t v36 = v365;
            if (v328) {
              uint64_t v328 = objc_getProperty(v328, v329, 24LL, 1);
            }
            SEL v20 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
            id v330 = v328;
            objc_setProperty_atomic(v10, v331, v330, 136LL);

            char v101 = 1;
            unint64_t v102 = 7LL;
LABEL_87:

            if ((v101 & 1) != 0)
            {
              if ((-[NEIKEv2IKESA generateInitialValues](v10, v159) & 1) != 0)
              {
                if ((-[NEIKEv2IKESA processCurrentKeyExchange](v10, v160) & 1) != 0)
                {
                  id v161 = v4;
                  uint64_t v10 = v10;
                  objc_opt_self();
                  id v163 = objc_getProperty(v10, v162, 96LL, 1);

                  if (v163)
                  {
                    uint64_t v164 = -[NEIKEv2Packet initResponse:]( (uint64_t)objc_alloc(&OBJC_CLASS___NEIKEv2CreateChildPacket),  v161);
                    if (v164)
                    {
                      id v165 = (id)v164;
                      id v367 = v161;
                      id v166 = objc_alloc_init(&OBJC_CLASS___NEIKEv2IKESAPayload);
                      objc_setProperty_atomic(v165, v167, v166, v20[752]);

                      id v169 = objc_getProperty(v10, v168, 96LL, 1);
                      *(void *)SEL v380 = v169;
                      [MEMORY[0x189603F18] arrayWithObjects:v380 count:1];
                      SEL v170 = (void *)objc_claimAutoreleasedReturnValue();
                      id v171 = v20;
                      objc_getProperty(v165, v172, v20[752], 1);
                      unint64_t v173 = (void *)objc_claimAutoreleasedReturnValue();
                      uint64_t v175 = v173;
                      if (v173) {
                        objc_setProperty_atomic(v173, v174, v170, 24LL);
                      }

                      id v177 = objc_getProperty(v10, v176, 32LL, 1);
                      objc_getProperty(v165, v178, v171[752], 1);
                      uint64_t v179 = (void *)objc_claimAutoreleasedReturnValue();
                      id v181 = v179;
                      if (v179) {
                        objc_setProperty_atomic(v179, v180, v177, 32LL);
                      }

                      objc_getProperty(v165, v182, v171[752], 1);
                      uint64_t v183 = (void *)objc_claimAutoreleasedReturnValue();
                      char v184 = -[NEIKEv2Payload isValid]((uint64_t)v183);

                      if ((v184 & 1) != 0)
                      {
                        uint64_t v185 = objc_alloc_init(&OBJC_CLASS___NEIKEv2NoncePayload);
                        objc_setProperty_atomic(v165, v186, v185, 112LL);

                        id v188 = objc_getProperty(v10, v187, 128LL, 1);
                        objc_getProperty(v165, v189, 112LL, 1);
                        uint64_t v190 = (void *)objc_claimAutoreleasedReturnValue();
                        SEL v192 = v190;
                        if (v190) {
                          objc_setProperty_atomic(v190, v191, v188, 24LL);
                        }

                        objc_getProperty(v165, v193, 112LL, 1);
                        uint64_t v194 = (void *)objc_claimAutoreleasedReturnValue();
                        char v195 = -[NEIKEv2Payload isValid]((uint64_t)v194);

                        if ((v195 & 1) != 0)
                        {
                          id v196 = objc_alloc_init(&OBJC_CLASS___NEIKEv2KeyExchangePayload);
                          objc_setProperty_atomic(v165, v197, v196, 104LL);

                          id v199 = objc_getProperty(v10, v198, 96LL, 1);
                          -[NEIKEv2IKESAProposal kemProtocol](v199, v200);
                          id v201 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_getProperty(v165, v202, 104LL, 1);
                          id v203 = (void *)objc_claimAutoreleasedReturnValue();
                          id v205 = v203;
                          if (v203) {
                            objc_setProperty_atomic(v203, v204, v201, 24LL);
                          }

                          id v207 = objc_getProperty(v10, v206, 160LL, 1);
                          SEL v208 = v207;
                          if (v207) {
                            uint64_t v209 = (void *)*((void *)v207 + 2);
                          }
                          else {
                            uint64_t v209 = 0LL;
                          }
                          id v210 = v209;
                          objc_getProperty(v165, v211, 104LL, 1);
                          id v212 = (void *)objc_claimAutoreleasedReturnValue();
                          char v214 = v212;
                          if (v212) {
                            objc_setProperty_atomic(v212, v213, v210, 32LL);
                          }

                          objc_getProperty(v165, v215, 104LL, 1);
                          id v216 = (void *)objc_claimAutoreleasedReturnValue();
                          char v217 = -[NEIKEv2Payload isValid]((uint64_t)v216);

                          if ((v217 & 1) != 0)
                          {
                            id v219 = objc_getProperty(v10, v218, 96LL, 1);
                            SEL v221 = v219;
                            if (v219) {
                              id v219 = objc_getProperty(v219, v220, 120LL, 1);
                            }
                            id v222 = v219;

                            if (v222)
                            {
                              [MEMORY[0x189607AB8] UUID];
                              uint64_t v223 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_OWORD *)buf = 0uLL;
                              [v223 getUUIDBytes:buf];
                              uint64_t v224 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:buf length:16];
                              uint64_t v225 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]( (uint64_t)&OBJC_CLASS___NEIKEv2NotifyPayload,  0x4039uLL,  v224);
                              objc_setProperty_atomic(v10, v226, v225, 176LL);

                              id v228 = objc_getProperty(v10, v227, 176LL, 1);
                              -[NEIKEv2Packet addNotifyPayload:](v165, v228);
                            }

                            id v165 = v165;
                            SEL v229 = v165;
                            goto LABEL_142;
                          }

                          ne_log_obj();
                          id v250 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v250, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)buf = 136315138;
                            *(void *)&uint8_t buf[4] = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyResponse:ikeSA:]";
                            uint64_t v251 = "%s called with null packet.ke.isValid";
                            goto LABEL_140;
                          }

void __46__NEIKEv2Session_Exchange__receiveRekeyIKESA___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Failed to create valid IKE SA (receive rekey)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

void __46__NEIKEv2Session_Exchange__receiveRekeyIKESA___block_invoke_439(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = *(_BYTE **)(a1 + 32);
  if (!v4 || (-[NEIKEv2IKESA generateAllValuesUsingSA:](v4, *(void **)(a1 + 40)) & 1) == 0)
  {
    ne_log_obj();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to generate IKE SA crypto values (receive rekey)",  buf,  2u);
    }

    uint64_t v11 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
    id Property = *(id *)(a1 + 48);
    if (Property) {
      id Property = objc_getProperty(Property, v10, 368LL, 1);
    }
    id v13 = Property;
    v53[0] = MEMORY[0x1895F87A8];
    v53[1] = 3221225472LL;
    v53[2] = __46__NEIKEv2Session_Exchange__receiveRekeyIKESA___block_invoke_440;
    v53[3] = &unk_18A08D468;
    v53[4] = *(void *)(a1 + 48);
    uint64_t v6 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v11->super.super.isa,  0,  v13,  v53);

    -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 48), v6);
    goto LABEL_29;
  }

  if (v3 && (-[NEIKEv2InformationalPacket isDeleteIKE](v3, v5) & 1) != 0)
  {
    +[NEIKEv2InformationalPacket createInformationalResponse:ikeSA:]( (uint64_t)&OBJC_CLASS___NEIKEv2InformationalPacket,  v3,  0LL);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((-[NEIKEv2Session sendReply:replyHandler:](*(void *)(a1 + 48), v6, 0LL) & 1) != 0)
      {
        -[NEIKEv2IKESA setState:error:](*(void *)(a1 + 32), 2uLL, 0LL);
        -[NEIKEv2Session setIKESA:](*(void *)(a1 + 48), *(void **)(a1 + 32));
        ne_log_obj();
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_INFO, "Rekeyed IKE SA", buf, 2u);
        }

        goto LABEL_29;
      }

      id v40 = *(id *)(a1 + 48);
      if (v40) {
        id v40 = objc_getProperty(v40, v7, 336LL, 1);
      }
      id v31 = v40;
      uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"delete reply",  v41,  v42,  v43,  v44,  v45,  v46,  v47,  v52);
    }

    else
    {
      ne_log_obj();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v51 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v55 = v51;
        _os_log_error_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_ERROR,  "%@ Failed to create IKE Delete response packet",  buf,  0xCu);
      }

      id v30 = *(id *)(a1 + 48);
      if (v30) {
        id v30 = objc_getProperty(v30, v29, 336LL, 1);
      }
      id v31 = v30;
      uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorInternal( @"Failed to create IKE Delete response packet (receive rekey)",  v32,  v33,  v34,  v35,  v36,  v37,  v38,  v52);
    }

    id v48 = ErrorFailedToSend;
    -[NEIKEv2IKESA setState:error:]((uint64_t)v31, 3uLL, ErrorFailedToSend);

    -[NEIKEv2Session reportState](*(void **)(a1 + 48), v49);
    -[NEIKEv2Session resetAll](*(void *)(a1 + 48), v50);
LABEL_29:

    goto LABEL_30;
  }

  ne_log_obj();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to process Rekey IKE Delete packet (receive rekey)",  buf,  2u);
  }

  id v16 = *(id *)(a1 + 48);
  if (v16) {
    id v16 = objc_getProperty(v16, v15, 336LL, 1);
  }
  id v17 = v16;
  id ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Failed to process Rekey IKE Delete packet (receive rekey)",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v52);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v17, 3uLL, ErrorPeerInvalidSyntax);

  -[NEIKEv2Session reportState](*(void **)(a1 + 48), v26);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 48), v27);
LABEL_30:
}

void __46__NEIKEv2Session_Exchange__receiveRekeyIKESA___block_invoke_440(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto( @"Failed to generate IKE SA crypto values (receive rekey)",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v15);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  -[NEIKEv2Session reportState](*(void **)(a1 + 32), v13);
  -[NEIKEv2Session resetAll](*(void *)(a1 + 32), v14);
}

- (void)receiveMOBIKE:(void *)a1
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_getProperty(a1, v3, 368LL, 1);
    dispatch_assert_queue_V2(v5);

    id v7 = objc_getProperty(a1, v6, 336LL, 1);
    if (!v7)
    {
      ne_log_obj();
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v65 = "-[NEIKEv2Session(Exchange) receiveMOBIKE:]";
        _os_log_fault_impl(&dword_1876B1000, v35, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
      }

      goto LABEL_29;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (-[NEIKEv2InformationalPacket isMOBIKE](v4) & 1) == 0)
    {
      ne_log_obj();
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v37 = "Failed to receive MOBIKE packet";
LABEL_39:
        _os_log_error_impl(&dword_1876B1000, v35, OS_LOG_TYPE_ERROR, v37, buf, 2u);
      }

      goto LABEL_29;
    }

    id v8 = v7;
    if (-[NEIKEv2Packet hasErrors](v4, v9))
    {
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      uint64_t v55 = v8;
      if (v4) {
        id Property = objc_getProperty(v4, v10, 64LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v12 = Property;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:buf count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v57;
LABEL_10:
        uint64_t v16 = 0LL;
        while (1)
        {
          if (*(void *)v57 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v56 + 1) + 8 * v16);
          if (v17)
          {
          }

          if (v14 == ++v16)
          {
            uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:buf count:16];
            if (v14) {
              goto LABEL_10;
            }
            goto LABEL_17;
          }
        }

        ne_log_obj();
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v53 = (void *)[v4 copyShortDescription];
          *(_DWORD *)uint64_t v60 = 138412546;
          uint64_t v61 = v53;
          __int16 v62 = 2112;
          uint64_t v63 = v17;
          _os_log_error_impl(&dword_1876B1000, v36, OS_LOG_TYPE_ERROR, "%@ MOBIKE received notify error %@", v60, 0x16u);
        }

        ne_log_obj();
        uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v37 = "Failed to process MOBIKE packet";
          goto LABEL_39;
        }

        goto LABEL_29;
      }

- (void)receiveRedirect:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_getProperty(a1, v3, 368LL, 1);
    dispatch_assert_queue_V2(v5);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (-[NEIKEv2Packet hasNotification:](v4, (const char *)0x4017) & 1) != 0)
    {
      if (v4)
      {
        int v7 = -[NEIKEv2Packet hasErrors](v4, v6);
        ne_log_obj();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = v8;
        if (!v7)
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1876B1000, v9, OS_LOG_TYPE_DEFAULT, "Received server redirect", buf, 2u);
          }

          -[NEIKEv2Session reportServerRedirect:](a1, v4);
          +[NEIKEv2InformationalPacket createInformationalResponse:ikeSA:]( (uint64_t)&OBJC_CLASS___NEIKEv2InformationalPacket,  v4,  0LL);
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            uint64_t v9 = v12;
            if ((-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v12, 0LL) & 1) == 0)
            {
              id v14 = objc_getProperty(a1, v13, 336LL, 1);
              uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"redirect reply",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v26);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v14, 3uLL, ErrorFailedToSend);

              -[NEIKEv2Session reportState](a1, v23);
              -[NEIKEv2Session resetAll]((uint64_t)a1, v24);
            }
          }

          else
          {
            ne_log_obj();
            SEL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v26) = 0;
              _os_log_error_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_ERROR,  "Failed to create REDIRECT response packet",  (uint8_t *)&v26,  2u);
            }

            uint64_t v9 = 0LL;
          }

          goto LABEL_9;
        }
      }

      else
      {
        ne_log_obj();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = 0;
        uint64_t v10 = "Failed to process redirect packet";
        uint64_t v11 = (uint8_t *)&v28;
LABEL_20:
        _os_log_error_impl(&dword_1876B1000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v29 = 0;
        uint64_t v10 = "Failed to receive redirect packet";
        uint64_t v11 = v29;
        goto LABEL_20;
      }
    }

- (void)receiveDeleteIKESA:(void *)a1
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_getProperty(a1, v3, 368LL, 1);
    dispatch_assert_queue_V2(v5);

    id v7 = objc_getProperty(a1, v6, 336LL, 1);
    if (!v7)
    {
      ne_log_obj();
      BOOL v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t v35 = 136315138;
        *(void *)&v35[4] = "-[NEIKEv2Session(Exchange) receiveDeleteIKESA:]";
        _os_log_fault_impl(&dword_1876B1000, v34, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", v35, 0xCu);
      }

      goto LABEL_17;
    }

    id v8 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v8 && !-[NEIKEv2Packet hasErrors](v8, v9))
      {
        +[NEIKEv2InformationalPacket createInformationalResponse:ikeSA:]( (uint64_t)&OBJC_CLASS___NEIKEv2InformationalPacket,  v8,  0LL);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          uint64_t v10 = v20;
          if ((-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v20, 0LL) & 1) != 0)
          {
            char v12 = 1;
LABEL_10:

            ne_log_large_obj();
            uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            id v14 = v13;
            if ((v12 & 1) != 0)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v35 = 138412546;
                *(void *)&v35[4] = a1;
                __int16 v36 = 2112;
                id v37 = v7;
                _os_log_impl(&dword_1876B1000, v14, OS_LOG_TYPE_DEFAULT, "%@ Received IKE SA Delete %@", v35, 0x16u);
              }

              id v16 = objc_getProperty(a1, v15, 336LL, 1);
              id Error = (void *)NEIKEv2CreateError(14LL);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v16, 3uLL, Error);

              -[NEIKEv2Session reportState](a1, v18);
              -[NEIKEv2Session resetAll]((uint64_t)a1, v19);
            }

            else
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)uint64_t v35 = 138412546;
                *(void *)&v35[4] = a1;
                __int16 v36 = 2112;
                id v37 = v7;
                _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "%@ Failed to process received IKE SA Delete %@",  v35,  0x16u);
              }
            }

- (void)receiveDeleteChildSA:(void *)a1
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_getProperty(a1, v3, 368LL, 1);
    dispatch_assert_queue_V2(v5);

    id v8 = objc_getProperty(a1, v6, 336LL, 1);
    if (!v8)
    {
      ne_log_obj();
      char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v69 = "-[NEIKEv2Session(Exchange) receiveDeleteChildSA:]";
        _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
      }

      goto LABEL_44;
    }

    objc_getProperty(v4, v7, 88LL, 1);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 firstObject];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    char v12 = v10;
    if (v10) {
      id Property = objc_getProperty(v10, v11, 32LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v14 = Property;
    [v14 firstObject];
    SEL v15 = (void *)objc_claimAutoreleasedReturnValue();

    id v16 = -[NEIKEv2Session copyChildWithSPI:](a1, v15);
    id v63 = v8;
    if (v16)
    {
      id v18 = v16;
      id v19 = objc_getProperty(v16, v17, 56LL, 1);
      uint64_t v21 = v19;
      if (v19) {
        id v19 = objc_getProperty(v19, v20, 80LL, 1);
      }
      id v22 = v19;
      id v24 = objc_getProperty(v18, v23, 56LL, 1);
      uint64_t v26 = v24;
      if (v24) {
        id v24 = objc_getProperty(v24, v25, 88LL, 1);
      }
      id v27 = v24;
      char v28 = -[NEIKEv2Session receiveDeleteChildSPI:remoteSPI:packet:](a1, v22, v27, v4);

      ne_log_large_obj();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = v29;
      if ((v28 & 1) != 0)
      {
        uint64_t v32 = v15;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = objc_getProperty(v18, v31, 56LL, 1);
          uint64_t v35 = v33;
          if (v33) {
            id v33 = objc_getProperty(v33, v34, 88LL, 1);
          }
          id v36 = v33;
          *(_DWORD *)buf = 138412546;
          uint64_t v69 = (const char *)a1;
          __int16 v70 = 2112;
          id v71 = v36;
          _os_log_impl( &dword_1876B1000,  v30,  OS_LOG_TYPE_DEFAULT,  "%@ Received Child SA Delete for remote SPI %@",  buf,  0x16u);
        }

        -[NEIKEv2ChildSA setState:error:]((uint64_t)v18, 3uLL, 0LL);
        -[NEIKEv2Session reportState](a1, v37);
        -[NEIKEv2Session resetChild:]((char *)a1, v18);
        id v8 = v63;
        goto LABEL_43;
      }

      id v8 = v63;
      uint64_t v32 = v15;
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
LABEL_34:

LABEL_43:
LABEL_44:

        goto LABEL_45;
      }
    }

    else
    {
      uint64_t v61 = v15;
      __int16 v62 = v12;
      id v38 = v15;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      id v40 = objc_getProperty(a1, v39, 288LL, 1);
      uint64_t v41 = [v40 countByEnumeratingWithState:&v64 objects:buf count:16];
      if (!v41)
      {
LABEL_32:

LABEL_40:
        ne_log_obj();
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        char v12 = v62;
        id v8 = v63;
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v69 = (const char *)a1;
          __int16 v70 = 2112;
          id v71 = v38;
          _os_log_error_impl( &dword_1876B1000,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "%@ Failed to find child SA for spi %@",  buf,  0x16u);
        }

        uint64_t v32 = v61;
        goto LABEL_43;
      }

      uint64_t v43 = v41;
      uint64_t v44 = *(void *)v65;
      uint64_t v60 = v4;
LABEL_18:
      uint64_t v45 = 0LL;
      while (1)
      {
        if (*(void *)v65 != v44) {
          objc_enumerationMutation(v40);
        }
        uint64_t v46 = *(void **)(*((void *)&v64 + 1) + 8 * v45);
        id v47 = v46 ? objc_getProperty(*(id *)(*((void *)&v64 + 1) + 8 * v45), v42, 192LL, 1) : 0LL;
        id v48 = v47;
        if (v46) {
          id v50 = objc_getProperty(v46, v49, 200LL, 1);
        }
        else {
          id v50 = 0LL;
        }
        id v51 = v50;
        char v52 = [v51 isEqual:v38];

        if ((v52 & 1) != 0) {
          goto LABEL_36;
        }
        if (v43 == ++v45)
        {
          uint64_t v53 = [v40 countByEnumeratingWithState:&v64 objects:buf count:16];
          uint64_t v43 = v53;
          id v4 = v60;
          if (v53) {
            goto LABEL_18;
          }
          goto LABEL_32;
        }
      }

LABEL_36:
      id v18 = v46;

      id v4 = v60;
      if (!v46) {
        goto LABEL_40;
      }
      char v12 = v62;
      id v8 = v63;
      id v55 = objc_getProperty(v18, v54, 200LL, 1);
      char v56 = -[NEIKEv2Session receiveDeleteChildSPI:remoteSPI:packet:](a1, 0LL, v55, v60);

      ne_log_large_obj();
      __int128 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = v57;
      if ((v56 & 1) != 0)
      {
        uint64_t v32 = v61;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          id v59 = objc_getProperty(v18, v58, 200LL, 1);
          *(_DWORD *)buf = 138412546;
          uint64_t v69 = (const char *)a1;
          __int16 v70 = 2112;
          id v71 = v59;
          _os_log_impl( &dword_1876B1000,  v30,  OS_LOG_TYPE_DEFAULT,  "%@ Received Child SA Delete for remote SPI %@",  buf,  0x16u);
        }

        goto LABEL_34;
      }

      uint64_t v32 = v61;
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
    }

    *(_DWORD *)buf = 138412546;
    uint64_t v69 = (const char *)a1;
    __int16 v70 = 2112;
    id v71 = v18;
    _os_log_error_impl( &dword_1876B1000,  v30,  OS_LOG_TYPE_ERROR,  "%@ Failed to process received Child SA Delete %@",  buf,  0x16u);
    goto LABEL_34;
  }

- (void)initiateDeleteChildSA:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  SEL v6 = (dispatch_queue_s *)Property;
  dispatch_assert_queue_V2(v6);

  id v7 = -[NEIKEv2Session copyChildWithID:](a1, (const char *)*((unsigned int *)v4 + 6));
  if (v7)
  {
    id v8 = v7;
    if (*((void *)v7 + 4) == 3LL)
    {
      [v4 sendCallbackSuccess:1 session:a1];
    }

    else
    {
      ne_log_large_obj();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v27 = (const char *)a1;
        __int16 v28 = 2112;
        id v29 = v8;
        _os_log_impl(&dword_1876B1000, v9, OS_LOG_TYPE_DEFAULT, "%@ initiate delete Child SA %@", buf, 0x16u);
      }

      id v10 = v4[4];
      -[NEIKEv2ChildSA setState:error:]((uint64_t)v8, 3uLL, v10);

      -[NEIKEv2Session reportState](a1, v11);
      id v13 = objc_getProperty(v8, v12, 56LL, 1);
      SEL v15 = v13;
      if (v13) {
        id v13 = objc_getProperty(v13, v14, 80LL, 1);
      }
      id v16 = v13;
      id v18 = objc_getProperty(v8, v17, 56LL, 1);
      uint64_t v20 = v18;
      if (v18) {
        id v18 = objc_getProperty(v18, v19, 88LL, 1);
      }
      id v21 = v18;
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __50__NEIKEv2Session_Exchange__initiateDeleteChildSA___block_invoke;
      v23[3] = &unk_18A08D118;
      void v23[4] = a1;
      id v8 = v8;
      id v24 = v8;
      uint64_t v25 = v4;
      -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](a1, v16, v21, v23);
    }
  }

  else
  {
    ne_log_obj();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v27 = "-[NEIKEv2Session(Exchange) initiateDeleteChildSA:]";
      _os_log_fault_impl(&dword_1876B1000, v22, OS_LOG_TYPE_FAULT, "%s called with null childSA", buf, 0xCu);
    }

    [v4 sendCallbackSuccess:0 session:a1];
    id v8 = 0LL;
  }
}

uint64_t __50__NEIKEv2Session_Exchange__initiateDeleteChildSA___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) sendCallbackSuccess:a2 session:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = self;
    _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "Dealloc %@", buf, 0xCu);
  }

  -[NEIKEv2Session uninstallAllChildSAs]((uint64_t)self);
  if (self)
  {
    if (objc_getProperty(self, v4, 176LL, 1))
    {
      if (self->_ownsDatabaseSession) {
        objc_msgSend(objc_getProperty(self, v5, 176, 1), "invalidate");
      }
      objc_setProperty_atomic(self, v5, 0LL, 176LL);
    }

    ipsecInterface = self->_ipsecInterface;
    if (ipsecInterface)
    {
      CFRelease(ipsecInterface);
      self->_ipsecInterface = 0LL;
    }

    if (objc_getProperty(self, v5, 264LL, 1))
    {
      id Property = (dispatch_source_s *)objc_getProperty(self, v7, 264LL, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(self, v9, 0LL, 264LL);
    }

    if (objc_getProperty(self, v7, 272LL, 1))
    {
      objc_msgSend(objc_getProperty(self, v10, 272, 1), "invalidate");
      objc_setProperty_atomic(self, v11, 0LL, 272LL);
    }

    if (objc_getProperty(self, v10, 280LL, 1))
    {
      id v13 = (dispatch_source_s *)objc_getProperty(self, v12, 280LL, 1);
      dispatch_source_cancel(v13);
      objc_setProperty_atomic(self, v14, 0LL, 280LL);
    }

    if (objc_getProperty(self, v12, 296LL, 1))
    {
      id v16 = (dispatch_source_s *)objc_getProperty(self, v15, 296LL, 1);
      dispatch_source_cancel(v16);
      objc_setProperty_atomic(self, v17, 0LL, 296LL);
    }
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NEIKEv2Session;
  -[NEIKEv2Session dealloc](&v18, sel_dealloc);
}

- (void)expireSA:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 192LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property objectForKeyedSubscript:v5];
  id v7 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 176LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    int v11 = 138413058;
    SEL v12 = self;
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    objc_super v18 = v7;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ expire SA %@ childSA %@", (uint8_t *)&v11, 0x2Au);
  }

  [v5 invalidate];
}

- (void)deleteSA:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 192LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property objectForKeyedSubscript:v5];
  id v7 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 176LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    int v13 = 138413058;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ delete SA %@ childSA %@", (uint8_t *)&v13, 0x2Au);
  }

  if (v7) {
    -[NEIKEv2Session removeChild:](self, "removeChild:", v7[4]);
  }
  if (self) {
    id v12 = objc_getProperty(self, v11, 192LL, 1);
  }
  else {
    id v12 = 0LL;
  }
  [v12 setObject:0 forKeyedSubscript:v5];
  [v5 invalidate];
}

- (void)idleTimeoutSA:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 192LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property objectForKeyedSubscript:v5];
  id v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 176LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    int v13 = 138413058;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ %@ idle timeout SA %@ childSA %@",  (uint8_t *)&v13,  0x2Au);
  }

  if (v7)
  {
    unsigned int v11 = v7[4];
    id Error = (void *)NEIKEv2CreateError(15LL);
    -[NEIKEv2Session removeChild:withReason:](self, v11, Error);
  }

  [v5 invalidate];
}

- (void)blackholeDetectedSA:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 192LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property objectForKeyedSubscript:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 176LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    int v11 = 138413058;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ %@ blackhole detected SA %@ childSA %@",  (uint8_t *)&v11,  0x2Au);
  }

  if (v7) {
    -[NEIKEv2Session sendKeepaliveWithRetries:retryIntervalInMilliseconds:callbackQueue:callback:]( self,  "sendKeepaliveWithRetries:retryIntervalInMilliseconds:callbackQueue:callback:",  4LL,  0LL,  0LL,  0LL);
  }
}

- (void)reportError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = self;
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (self)
  {
    BOOL isInvalidated = self->_isInvalidated;
    if (!a3) {
      return;
    }
  }

  else
  {
    BOOL isInvalidated = 0;
    if (!a3) {
      return;
    }
  }

  if (isInvalidated) {
    return;
  }
  if (a3 == 49)
  {
    if (!self || (SEL v6 = objc_getProperty(self, a2, 336LL, 1)) == 0LL || (v6[11] & 1) == 0)
    {
      ne_log_obj();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v50 = v4;
        __int16 v51 = 1024;
        int v52 = 49;
        _os_log_error_impl(&dword_1876B1000, v7, OS_LOG_TYPE_ERROR, "%@ Reporting transport error %d", buf, 0x12u);
      }

      if (v4) {
        id Property = objc_getProperty(v4, v8, 336LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v10 = Property;
      uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"Transport error %d",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  49LL);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, ErrorFailedToSend);

      -[NEIKEv2Session reportState](v4, v19);
      return;
    }
  }

  else if (!self)
  {
    goto LABEL_21;
  }

  uint64_t v20 = objc_getProperty(v4, a2, 336LL, 1);
  if (!v20) {
    goto LABEL_21;
  }
  if (v20[6] != 2LL) {
    goto LABEL_21;
  }
  if (v4->_lastRequestMessageID == -1) {
    goto LABEL_21;
  }
  id v22 = objc_getProperty(v4, v21, 240LL, 1);
  [MEMORY[0x189607968] numberWithInt:v4->_lastRequestMessageID];
  SEL v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 objectForKeyedSubscript:v23];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
LABEL_21:
    ne_log_obj();
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v50 = v4;
      __int16 v51 = 1024;
      int v52 = v3;
      _os_log_error_impl(&dword_1876B1000, v36, OS_LOG_TYPE_ERROR, "%@ Reporting transport error %d", buf, 0x12u);
    }

    if (v4)
    {
      id v44 = objc_getProperty(v4, v37, 336LL, 1);
      id v46 = objc_getProperty(v4, v45, 336LL, 1);
      id v4 = (NEIKEv2Session *)v46;
      if (v46)
      {
        unint64_t v47 = *((void *)v46 + 6);
LABEL_26:
        uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal( @"Transport error %d",  (uint64_t)v37,  v38,  v39,  v40,  v41,  v42,  v43,  v3);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v44, v47, ErrorInternal);

        return;
      }
    }

    else
    {
      id v44 = 0LL;
    }

    unint64_t v47 = 0LL;
    goto LABEL_26;
  }

  ne_log_obj();
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v50 = v4;
    __int16 v51 = 1024;
    int v52 = v3;
    _os_log_error_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_ERROR,  "%@ Reporting transport error %d while connected",  buf,  0x12u);
  }

  id v27 = objc_getProperty(v4, v26, 336LL, 1);
  uint64_t v35 = (void *)NEIKEv2CreateErrorInternal(@"Transport error %d", v28, v29, v30, v31, v32, v33, v34, v3);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 2uLL, v35);
}

- (NSString)description
{
  uint64_t v2 = self;
  if (self) {
    self = (NEIKEv2Session *)objc_getProperty(self, a2, 336LL, 1);
  }
  -[NEIKEv2IKESA initiatorSPI](self, a2);
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    id Property = objc_getProperty(v2, v3, 336LL, 1);
  }
  else {
    id Property = 0LL;
  }
  -[NEIKEv2IKESA responderSPI](Property, v3);
  SEL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v7 = objc_alloc(NSString);
  if (v2) {
    unint64_t uniqueIndex = v2->_uniqueIndex;
  }
  else {
    unint64_t uniqueIndex = 0LL;
  }
  SEL v9 = @"0000000000000000";
  if (v4) {
    id v10 = v4;
  }
  else {
    id v10 = @"0000000000000000";
  }
  if (v6) {
    SEL v9 = v6;
  }
  uint64_t v11 = (void *)[v7 initWithFormat:@"IKEv2Session[%llu, %@-%@]", uniqueIndex, v10, v9];

  return (NSString *)v11;
}

- (NEIKEv2Session)initWithIKEConfig:(id)a3 firstChildConfig:(id)a4 sessionConfig:(id)a5 queue:(id)a6 ipsecInterface:(NEVirtualInterface_s *)a7 ikeSocketHandler:(id)a8 saSession:(id)a9 packetDelegate:(id)a10
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  SEL v23 = v22;
  if (!v16)
  {
    ne_log_obj();
    SEL v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v29 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSe"
            "ssion:packetDelegate:]";
      id v27 = "%s called with null ikeConfig";
      goto LABEL_13;
    }

- (NEIKEv2Session)initWithIKEConfig:(id)a3 firstChildConfig:(id)a4 sessionConfig:(id)a5 queue:(id)a6 ipsecInterface:(NEVirtualInterface_s *)a7 ikeSocketHandler:(id)a8 kernelSASessionName:(id)a9 packetDelegate:(id)a10
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (!v16)
  {
    ne_log_obj();
    SEL v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v29 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:kern"
            "elSASessionName:packetDelegate:]";
      id v27 = "%s called with null ikeConfig";
      goto LABEL_13;
    }

- (void)connect
{
  uint64_t v2 = self;
  if (self) {
    self = (NEIKEv2Session *)objc_getProperty(self, a2, 368LL, 1);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__NEIKEv2Session_connect__block_invoke;
  block[3] = &unk_18A090390;
  block[4] = v2;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)disconnect
{
  uint64_t v2 = self;
  if (self) {
    self = (NEIKEv2Session *)objc_getProperty(self, a2, 368LL, 1);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__NEIKEv2Session_disconnect__block_invoke;
  block[3] = &unk_18A090390;
  block[4] = v2;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)forceRekeyIKE
{
  id v4 = -[NEIKEv2RequestContext initWithRequestType:]( objc_alloc(&OBJC_CLASS___NEIKEv2RekeyIKEContext),  "initWithRequestType:",  1LL);
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v3, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __31__NEIKEv2Session_forceRekeyIKE__block_invoke;
  v7[3] = &unk_18A08F098;
  v7[4] = self;
  id v8 = v4;
  SEL v6 = v4;
  dispatch_async(Property, v7);
}

- (void)forceRekeyChild:(unsigned int)a3
{
  id v5 = objc_alloc(&OBJC_CLASS___NEIKEv2RekeyChildContext);
  if (v5)
  {
    v13.receiver = v5;
    v13.super_class = (Class)&OBJC_CLASS___NEIKEv2RekeyChildContext;
    id v7 = -[NEIKEv2Session initWithRequestType:](&v13, sel_initWithRequestType_, 2LL);
    id v8 = v7;
    if (v7) {
      v7->_previousMOBIKEMessageID = a3;
    }
    if (self) {
      goto LABEL_5;
    }
LABEL_8:
    id Property = 0LL;
    goto LABEL_6;
  }

  id v8 = 0LL;
  if (!self) {
    goto LABEL_8;
  }
LABEL_5:
  id Property = (dispatch_queue_s *)objc_getProperty(self, v6, 368LL, 1);
LABEL_6:
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __34__NEIKEv2Session_forceRekeyChild___block_invoke;
  v11[3] = &unk_18A08F098;
  v11[4] = self;
  uint64_t v12 = v8;
  id v10 = v8;
  dispatch_async(Property, v11);
}

- (void)removeChild:(unsigned int)a3
{
}

- (BOOL)updateConfiguration:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (v5)
  {
    if (self) {
      id Property = (dispatch_queue_s *)objc_getProperty(self, v4, 368LL, 1);
    }
    else {
      id Property = 0LL;
    }
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __38__NEIKEv2Session_updateConfiguration___block_invoke;
    v9[3] = &unk_18A08F098;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(Property, v9);
  }

  else
  {
    ne_log_obj();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[NEIKEv2Session updateConfiguration:]";
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "%s called with null sessionConfig", buf, 0xCu);
    }
  }

  return v5 != 0LL;
}

- (void)sendKeepaliveWithRetries:(unsigned int)a3 retryIntervalInMilliseconds:(unint64_t)a4 callbackQueue:(id)a5 callback:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  uint64_t v12 = -[NEIKEv2InformationalContext initWithPrivateNotifies:maxRetries:retryIntervalMilliseconds:callbackQueue:callback:]( (id *)objc_alloc(&OBJC_CLASS___NEIKEv2InformationalContext),  0LL,  a3,  (void *)a4,  v11,  v10);

  if (v12) {
    *((_BYTE *)v12 + 9) = 1;
  }
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v13, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __94__NEIKEv2Session_sendKeepaliveWithRetries_retryIntervalInMilliseconds_callbackQueue_callback___block_invoke;
  v16[3] = &unk_18A08F098;
  v16[4] = self;
  id v17 = v12;
  uint64_t v15 = v12;
  dispatch_async(Property, v16);
}

- (void)sendPrivateNotifies:(id)a3 maxRetries:(unsigned int)a4 retryIntervalInMilliseconds:(unint64_t)a5 callbackQueue:(id)a6 callback:(id)a7
{
  uint64_t v12 = (objc_class *)MEMORY[0x189603F18];
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  id v16 = (void *)[[v12 alloc] initWithArray:v15 copyItems:1];

  id v17 = -[NEIKEv2InformationalContext initWithPrivateNotifies:maxRetries:retryIntervalMilliseconds:callbackQueue:callback:]( (id *)objc_alloc(&OBJC_CLASS___NEIKEv2InformationalContext),  v16,  a4,  (void *)a5,  v14,  v13);
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v18, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  void v21[2] = __100__NEIKEv2Session_sendPrivateNotifies_maxRetries_retryIntervalInMilliseconds_callbackQueue_callback___block_invoke;
  v21[3] = &unk_18A08F098;
  v21[4] = self;
  id v22 = v17;
  id v20 = v17;
  dispatch_async(Property, v21);
}

- (void)sendMOBIKEWithRetries:(unsigned int)a3 retryInterval:(unint64_t)a4 interfaceName:(id)a5 invalidateTransport:(BOOL)a6 resetEndpoint:(id)a7 callbackQueue:(id)a8 callback:(id)a9
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  if (v15)
  {
    id v20 = -[NEIKEv2MOBIKEContext initWithMOBIKEInterface:mobikeEndpoint:invalidateTransport:maxRetries:retryIntervalMilliseconds:callbackQueue:callback:]( (id *)objc_alloc(&OBJC_CLASS___NEIKEv2MOBIKEContext),  v15,  v16,  a6,  a3,  (void *)a4,  v17,  v18);
    if (self) {
      id Property = (dispatch_queue_s *)objc_getProperty(self, v19, 368LL, 1);
    }
    else {
      id Property = 0LL;
    }
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __125__NEIKEv2Session_sendMOBIKEWithRetries_retryInterval_interfaceName_invalidateTransport_resetEndpoint_callbackQueue_callback___block_invoke;
    v23[3] = &unk_18A08F098;
    void v23[4] = self;
    id v24 = v20;
    id v22 = v20;
    dispatch_async(Property, v23);
  }

  else
  {
    ne_log_obj();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      SEL v26 = "-[NEIKEv2Session sendMOBIKEWithRetries:retryInterval:interfaceName:invalidateTransport:resetEndpoint:callbac"
            "kQueue:callback:]";
      _os_log_fault_impl(&dword_1876B1000, v22, OS_LOG_TYPE_FAULT, "%s called with null interfaceName", buf, 0xCu);
    }
  }
}

- (unsigned)addChild:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    objc_opt_self();
    do
      unsigned int v5 = __ldxr((unsigned int *)&getNewChildSAID_nextChildSAID);
    while (__stxr(v5 + 1, (unsigned int *)&getNewChildSAID_nextChildSAID));
    unsigned int v6 = v5;
    if (!v5)
    {
      do
        unsigned int v6 = __ldxr((unsigned int *)&getNewChildSAID_nextChildSAID);
      while (__stxr(v6 + 1, (unsigned int *)&getNewChildSAID_nextChildSAID));
    }

    id v8 = objc_alloc(&OBJC_CLASS___NEIKEv2ChildSA);
    if (self) {
      id Property = objc_getProperty(self, v7, 336LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v10 = -[NEIKEv2ChildSA initWithConfiguration:childID:ikeSA:](v8, v4, v6, Property);
    id v11 = objc_alloc(&OBJC_CLASS___NEIKEv2NewChildContext);
    id v12 = v10;
    if (v11)
    {
      v22.receiver = v11;
      v22.super_class = (Class)&OBJC_CLASS___NEIKEv2NewChildContext;
      id v13 = -[NEIKEv2Session initWithRequestType:](&v22, sel_initWithRequestType_, 5LL);
      id v11 = (NEIKEv2NewChildContext *)v13;
      if (v13) {
        objc_storeStrong((id *)v13 + 3, v10);
      }
    }

    if (self) {
      id v15 = (dispatch_queue_s *)objc_getProperty(self, v14, 368LL, 1);
    }
    else {
      id v15 = 0LL;
    }
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __27__NEIKEv2Session_addChild___block_invoke;
    block[3] = &unk_18A08F7C0;
    block[4] = self;
    id v20 = v12;
    id v21 = v11;
    id v16 = v11;
    id v17 = (os_log_s *)v12;
    dispatch_async(v15, block);
  }

  else
  {
    ne_log_obj();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v22.receiver) = 136315138;
      *(id *)((char *)&v22.receiver + 4) = "-[NEIKEv2Session addChild:]";
      _os_log_fault_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_FAULT,  "%s called with null configuration",  (uint8_t *)&v22,  0xCu);
    }

    unsigned int v6 = 0;
  }

  return v6;
}

- (BOOL)peerAuthenticated
{
  if (self)
  {
    self = (NEIKEv2Session *)objc_getProperty(self, a2, 336LL, 1);
    if (self) {
      LOBYTE(self) = BYTE2(self->_lastRequestMessageID) & 1;
    }
  }

  return (char)self;
}

- (BOOL)ppkAuthenticated
{
  if (self)
  {
    self = (NEIKEv2Session *)objc_getProperty(self, a2, 336LL, 1);
    if (self) {
      LOBYTE(self) = HIBYTE(self->_lastRequestMessageID) & 1;
    }
  }

  return (char)self;
}

- (void)receivePacket:(id)a3
{
  uint64_t v171 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v6, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  dispatch_assert_queue_V2(Property);
  if (v7)
  {
    unsigned int v158 = *((_DWORD *)v7 + 6);
    if (self)
    {
      if ((v7[10] & 1) != 0) {
        ptrdiff_t v10 = 240LL;
      }
      else {
        ptrdiff_t v10 = 232LL;
      }
      id v11 = objc_getProperty(self, v9, v10, 1);
    }

    else
    {
      id v11 = 0LL;
    }

    id v12 = v11;
    ne_log_large_obj();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = self;
      id v14 = (void *)[(id)objc_opt_class() copyTypeDescription];
      id v15 = v14;
      uint64_t v156 = v15;
      if ((v7[10] & 1) != 0) {
        id v16 = "Reply";
      }
      else {
        id v16 = "Request";
      }
      id v4 = (NEIKEv2Session *)v158;
      objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v158, v16);
      uint64_t v155 = (void *)objc_claimAutoreleasedReturnValue();

      [v12 objectForKeyedSubscript:v155];
      uint64_t v154 = (void *)objc_claimAutoreleasedReturnValue();
      if (v154) {
        id v18 = " retransmission";
      }
      else {
        id v18 = "";
      }
      id v157 = v12;
      id v19 = (void *)-[NEIKEv2Packet copyUnifiedData](v7, v17);
      int v20 = [v19 length];
      objc_getProperty(v7, v21, 32LL, 1);
      objc_super v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v24 = objc_getProperty(v7, v23, 40LL, 1);
      *(_DWORD *)buf = 138414082;
      uint64_t v160 = v3;
      __int16 v161 = 2112;
      *(void *)SEL v162 = v14;
      self = v3;
      *(_WORD *)&v162[8] = 2080;
      *(void *)id v163 = v153;
      *(_WORD *)&v163[8] = 2080;
      uint64_t v164 = v18;
      __int16 v165 = 1024;
      *(_DWORD *)id v166 = v20;
      *(_WORD *)&v166[4] = 1024;
      *(_DWORD *)&v166[6] = v158;
      __int16 v167 = 2112;
      SEL v168 = v22;
      __int16 v169 = 2112;
      id v170 = v24;
      _os_log_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_INFO,  "%@ Receiving %@ %s%s, length %u, ID %u (%@->%@)",  buf,  0x4Au);

      id v12 = v157;
    }

    if ((v7[11] & 1) != 0)
    {
      id v26 = objc_getProperty(v7, v25, 40LL, 1);
    }

    else
    {
      objc_getProperty(v7, v25, 32LL, 1);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v27 = v26;
    uint64_t v29 = [v26 value];
    if (!v29)
    {
      if (self)
      {
        uint64_t v30 = (NEIKEv2Session *)objc_getProperty(self, v28, 336LL, 1);
        uint64_t v3 = v30;
        if (v30) {
          uint64_t v30 = (NEIKEv2Session *)objc_getProperty(v30, v31, 80LL, 1);
        }
      }

      else
      {
        uint64_t v3 = 0LL;
        uint64_t v30 = 0LL;
      }

      id v4 = v30;
      if (-[NEIKEv2Session serverMode](v4, "serverMode"))
      {

        goto LABEL_31;
      }
    }

    if (self)
    {
      id v33 = objc_getProperty(self, v28, 336LL, 1);
      if (v33) {
        id v33 = objc_getProperty(v33, v34, 32LL, 1);
      }
    }

    else
    {
      id v33 = 0LL;
    }

    id v35 = v33;
    char v36 = [v35 isEqual:v27];

    if (v29)
    {
      if ((v36 & 1) != 0) {
        goto LABEL_31;
      }
    }

    else
    {

      if ((v36 & 1) != 0)
      {
LABEL_31:
        if ((v7[9] & 1) != 0)
        {
          if (self)
          {
            id v37 = objc_getProperty(self, v32, 336LL, 1);
            if (v37) {
              id v37 = objc_getProperty(v37, v38, 96LL, 1);
            }
          }

          else
          {
            id v37 = 0LL;
          }

          id v39 = v37;

          if (!v39)
          {
            ne_log_obj();
            __int16 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v160 = self;
              _os_log_error_impl( &dword_1876B1000,  v62,  OS_LOG_TYPE_ERROR,  "%@ Ignoring fragment received before security established",  buf,  0xCu);
            }

            goto LABEL_63;
          }

          ne_log_large_obj();
          uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            int v41 = *((_DWORD *)v7 + 4);
            int v42 = *((_DWORD *)v7 + 5);
            *(_DWORD *)buf = 138413058;
            uint64_t v160 = self;
            __int16 v161 = 1024;
            *(_DWORD *)SEL v162 = v41;
            *(_WORD *)&v162[4] = 1024;
            *(_DWORD *)&v162[6] = v42;
            *(_WORD *)id v163 = 2112;
            *(void *)&v163[2] = v7;
            _os_log_impl(&dword_1876B1000, v40, OS_LOG_TYPE_INFO, "%@ Received fragment %u/%u: %@", buf, 0x22u);
          }
        }

        char v43 = v7[10];
        if ((v43 & 1) != 0)
        {
          if (self) {
            id v44 = objc_getProperty(self, v32, 240LL, 1);
          }
          else {
            id v44 = 0LL;
          }
          SEL v45 = (void *)MEMORY[0x189607968];
          id v46 = v44;
          [v45 numberWithInt:v158];
          unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
          [v46 objectForKeyedSubscript:v47];
          id v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v48)
          {
            if ((v7[9] & 1) == 0)
            {
              if (self && objc_getProperty(self, v32, 336LL, 1))
              {
                id v64 = objc_getProperty(self, v63, 336LL, 1);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && -[NEIKEv2Packet hasNotification:](v7, (const char *)0x4017))
                {
                  __int128 v65 = -[NEIKEv2Packet copyNotification:](v7, (const char *)0x4017);
                  uint64_t v68 = -[NEIKEv2NotifyPayload copyServerRedirectNonce](v65, v66);
                  if (!v68) {
                    goto LABEL_125;
                  }
                  id v69 = objc_getProperty(self, v67, 336LL, 1);
                  if (v69) {
                    id v69 = objc_getProperty(v69, v70, 128LL, 1);
                  }
                  id v71 = v69;
                  char v72 = [v68 isEqualToData:v71];

                  if ((v72 & 1) == 0)
                  {
LABEL_125:
                    ne_log_large_obj();
                    uint64_t v129 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v160 = self;
                      __int16 v161 = 2112;
                      *(void *)SEL v162 = v7;
                      _os_log_error_impl( &dword_1876B1000,  v129,  OS_LOG_TYPE_ERROR,  "%@ Ignoring received packet (nonce check failed): %@",  buf,  0x16u);
                    }

                    goto LABEL_100;
                  }
                }
              }

              ne_log_large_obj();
              id v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v160 = self;
                __int16 v161 = 2112;
                *(void *)SEL v162 = v7;
                _os_log_impl(&dword_1876B1000, v73, OS_LOG_TYPE_INFO, "%@ Received response: %@", buf, 0x16u);
              }

              if (self)
              {
                if (!self->_lastRequestMessageID)
                {
                  SEL v75 = (void *)-[NEIKEv2Packet copyUnifiedData](v7, v74);
                  id v77 = objc_getProperty(self, v76, 336LL, 1);
                  if (v77) {
                    objc_setProperty_atomic(v77, v78, v75, 320LL);
                  }
                }

                -[NEIKEv2Session setReceivedReply:messageID:](self, v7, v158);
                id v80 = objc_getProperty(self, v79, 200LL, 1);
                if (v80)
                {
                  int lastRequestMessageID = self->_lastRequestMessageID;

                  if (lastRequestMessageID == v158)
                  {
                    ne_log_obj();
                    uint64_t v82 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
                    {
                      int v83 = self->_lastRequestMessageID;
                      *(_DWORD *)buf = 138412546;
                      uint64_t v160 = self;
                      __int16 v161 = 1024;
                      *(_DWORD *)SEL v162 = v83;
                      _os_log_impl( &dword_1876B1000,  v82,  OS_LOG_TYPE_INFO,  "%@ Processing response for message %u",  buf,  0x12u);
                    }

                    id v85 = objc_getProperty(self, v84, 360LL, 1);
                    -[NEIKEv2RTT updateRTT:responseMessageID:]((uint64_t)v85, self, v158);
                    char v87 = (void (**)(id, id))objc_getProperty(self, v86, 200LL, 1);
                    objc_setProperty_atomic_copy(self, v88, 0LL, 200LL);
                    -[NEIKEv2Session cancelSendTimer](self, v89);
                    v87[2](v87, v7);
                  }
                }
              }

              else
              {

                -[NEIKEv2Session setReceivedReply:messageID:](0LL, v7, v158);
              }

              goto LABEL_100;
            }

            goto LABEL_99;
          }

          char v43 = v7[10];
        }

        if ((v43 & 1) != 0)
        {
LABEL_49:
          if ((v43 & 1) == 0)
          {
            id v54 = self ? objc_getProperty(self, v32, 224LL, 1) : 0LL;
            id v55 = (void *)MEMORY[0x189607968];
            id v56 = v54;
            [v55 numberWithInt:v158];
            __int128 v57 = (void *)objc_claimAutoreleasedReturnValue();
            [v56 objectForKeyedSubscript:v57];
            __int128 v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (v58)
            {
              if ((v7[9] & 1) == 0 || *((_DWORD *)v7 + 4) == 1)
              {
                ne_log_obj();
                id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v160 = self;
                  __int16 v161 = 1024;
                  *(_DWORD *)SEL v162 = v158;
                  _os_log_debug_impl( &dword_1876B1000,  v59,  OS_LOG_TYPE_DEBUG,  "%@ Received duplicate for message %d, re-sending reply",  buf,  0x12u);
                }

                -[NEIKEv2Session sendReplyForMessageID:](self, (const char *)v158);
              }
            }
          }

          goto LABEL_100;
        }

        if (self) {
          id v49 = objc_getProperty(self, v32, 232LL, 1);
        }
        else {
          id v49 = 0LL;
        }
        id v50 = (void *)MEMORY[0x189607968];
        id v51 = v49;
        [v50 numberWithInt:v158];
        int v52 = (void *)objc_claimAutoreleasedReturnValue();
        [v51 objectForKeyedSubscript:v52];
        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          char v43 = v7[10];
          goto LABEL_49;
        }

        if ((v7[9] & 1) == 0)
        {
          if (self)
          {
            if (objc_getProperty(self, v32, 336LL, 1))
            {
              id v91 = objc_getProperty(self, v90, 336LL, 1);
            }
          }

          ne_log_large_obj();
          SEL v92 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v160 = self;
            __int16 v161 = 2112;
            *(void *)SEL v162 = v7;
            _os_log_impl(&dword_1876B1000, v92, OS_LOG_TYPE_INFO, "%@ Received request: %@", buf, 0x16u);
          }

          uint64_t v93 = v7;
          uint64_t v95 = v93;
          if (self)
          {
            int lastReceivedMessageID = self->_lastReceivedMessageID;
            if (lastReceivedMessageID < (int)v158)
            {
              int lastReceivedMessageID = v158;
              self->_int lastReceivedMessageID = v158;
            }

            int v97 = lastReceivedMessageID - 4;
            if (lastReceivedMessageID < 4)
            {
              id v122 = objc_getProperty(self, v94, 232LL, 1);
              uint64_t v123 = (void *)MEMORY[0x189607968];
              id v124 = v122;
              [v123 numberWithInt:v158];
              uint64_t v125 = (void *)objc_claimAutoreleasedReturnValue();
              [v124 setObject:v95 forKeyedSubscript:v125];

LABEL_116:
              if ((-[NEIKEv2Session fireWaitingRequestHandlerWithPacket:](self, v95) & 1) != 0) {
                goto LABEL_100;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                id v60 = v95;
                if (-[NEIKEv2CreateChildPacket isRekeyIKE](v60, v126))
                {
                  -[NEIKEv2Session receiveRekeyIKESA:](self, v60);
                }

                else
                {
                  if (-[NEIKEv2Packet hasNotification:](v60, (const char *)0x4009))
                  {
                    uint64_t v131 = -[NEIKEv2Packet copyNotification:](v60, (const char *)0x4009);
                    id v133 = v131;
                    if (v131) {
                      uint64_t v131 = objc_getProperty(v131, v132, 40LL, 1);
                    }
                    id v134 = v131;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      if (v133) {
                        id v136 = objc_getProperty(v133, v135, 40LL, 1);
                      }
                      else {
                        id v136 = 0LL;
                      }
                      id v137 = v136;
                    }

                    else
                    {
                      id v137 = 0LL;
                    }

                    id v145 = -[NEIKEv2Session copyChildWithSPI:](self, v137);
                    -[NEIKEv2Session receiveRekeyChildSA:packet:](self, v145, v60);
                  }

                  else
                  {
                    if (objc_getProperty(self, v130, 168LL, 1))
                    {
                      uint64_t v138 = objc_alloc(&OBJC_CLASS___NEIKEv2ChildSA);
                      id v140 = objc_getProperty(self, v139, 168LL, 1);
                      objc_opt_self();
                      do
                        unsigned int v142 = __ldxr((unsigned int *)&getNewChildSAID_nextChildSAID);
                      while (__stxr(v142 + 1, (unsigned int *)&getNewChildSAID_nextChildSAID));
                      int v143 = v142;
                      if (!v142)
                      {
                        do
                          int v143 = __ldxr((unsigned int *)&getNewChildSAID_nextChildSAID);
                        while (__stxr(v143 + 1, (unsigned int *)&getNewChildSAID_nextChildSAID));
                      }

                      id v144 = objc_getProperty(self, v141, 336LL, 1);
                      id v133 = -[NEIKEv2ChildSA initWithConfiguration:childID:ikeSA:](v138, v140, v143, v144);
                    }

                    else
                    {
                      id v133 = 0LL;
                    }

                    -[NEIKEv2Session receiveNewChildSA:packet:](self, v133, v60);
                  }
                }

                goto LABEL_60;
              }

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0) {
                  -[NEIKEv2Session receiveConnection:](self, v95);
                }
                goto LABEL_100;
              }

              id v60 = v95;
              if (-[NEIKEv2InformationalPacket isDeleteIKE](v60, v127))
              {
                -[NEIKEv2Session receiveDeleteIKESA:](self, v60);
              }

              else if (-[NEIKEv2InformationalPacket isDeleteChild](v60, v128))
              {
                -[NEIKEv2Session receiveDeleteChildSA:](self, v60);
              }

              else
              {
                if (!-[NEIKEv2InformationalPacket isMOBIKE](v60))
                {
                  id v147 = objc_getProperty(self, v146, 336LL, 1);
                  if (v147) {
                    id v147 = objc_getProperty(v147, v148, 80LL, 1);
                  }
                  id v149 = v147;
                  if ([v149 allowRedirect]
                    && (uint64_t v151 = objc_getProperty(self, v150, 336LL, 1)) != 0LL
                    && v151[6] == 2LL)
                  {
                    int v152 = -[NEIKEv2Packet hasNotification:](v60, (const char *)0x4017);

                    if (v152)
                    {
                      -[NEIKEv2Session receiveRedirect:](self, v60);
                      goto LABEL_60;
                    }
                  }

                  else
                  {
                  }

                  -[NEIKEv2Session receiveInformational:](self, v60);
                  goto LABEL_60;
                }

                -[NEIKEv2Session receiveMOBIKE:](self, v60);
              }

- (void)invalidateWithCompletionHandler:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  ne_log_obj();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = self;
    _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_DEFAULT, "Invalidating %@", buf, 0xCu);
  }

  if (self)
  {
    self->_BOOL isInvalidated = 1;
    id Property = (dispatch_queue_s *)objc_getProperty(self, v8, 368LL, 1);
  }

  else
  {
    id Property = 0LL;
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __68__NEIKEv2Session_invalidateWithCompletionHandler_completionHandler___block_invoke;
  block[3] = &unk_18A08F048;
  BOOL v13 = a3;
  block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(Property, block);
}

- (void)invalidate
{
}

- (BOOL)checkSelectedIKEProposal:(id)a3
{
  id v5 = a3;
  if (self)
  {
    id Property = objc_getProperty(self, v4, 336LL, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v7, 96LL, 1);
    }
  }

  else
  {
    id Property = 0LL;
  }

  id v8 = Property;
  [v5 encryptionProtocols];
  SEL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 firstObject];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10) {
    goto LABEL_10;
  }
  if (v8) {
    id v12 = objc_getProperty(v8, v11, 88LL, 1);
  }
  else {
    id v12 = 0LL;
  }
  id v13 = v12;
  char v14 = [v10 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    ne_log_obj();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    id v35 = "Incorrect encryption algorithm chosen";
    char v36 = buf;
LABEL_26:
    _os_log_error_impl(&dword_1876B1000, v18, OS_LOG_TYPE_ERROR, v35, v36, 2u);
    goto LABEL_30;
  }

  unint64_t v16 = v10[2];
  if (v16 > 0x1F || ((0xD01C0000 >> v16) & 1) == 0)
  {
LABEL_10:
    [v5 integrityProtocols];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 firstObject];
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (!v18
      || (!v8 ? (id v20 = 0LL) : (id v20 = objc_getProperty(v8, v19, 96LL, 1)),
          id v21 = v20,
          char v22 = -[os_log_s isEqual:](v18, "isEqual:", v21),
          v21,
          (v22 & 1) != 0))
    {

      goto LABEL_15;
    }

    ne_log_obj();
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)SEL v45 = 0;
      _os_log_error_impl(&dword_1876B1000, v37, OS_LOG_TYPE_ERROR, "Incorrect integrity algorithm chosen", v45, 2u);
    }

    goto LABEL_30;
  }

  if (v8) {
    id v40 = objc_getProperty(v8, v15, 96LL, 1);
  }
  else {
    id v40 = 0LL;
  }
  id v41 = v40;

  if (!v41)
  {
LABEL_15:
    [v5 prfProtocols];
    SEL v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 firstObject];
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (v18
      && (!v8 ? (id v25 = 0LL) : (id v25 = objc_getProperty(v8, v24, 104LL, 1)),
          id v26 = v25,
          char v27 = -[os_log_s isEqual:](v18, "isEqual:", v26),
          v26,
          (v27 & 1) == 0))
    {
      ne_log_obj();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)char v43 = 0;
        _os_log_error_impl(&dword_1876B1000, v29, OS_LOG_TYPE_ERROR, "Incorrect PRF algorithm chosen", v43, 2u);
      }
    }

    else
    {
      [v5 kemProtocols];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 firstObject];
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (!v29
        || (!v8 ? (id v31 = 0LL) : (id v31 = objc_getProperty(v8, v30, 112LL, 1)),
            id v32 = v31,
            char v33 = -[os_log_s isEqual:](v29, "isEqual:", v32),
            v32,
            (v33 & 1) != 0))
      {
        BOOL v34 = 1;
LABEL_37:

        goto LABEL_38;
      }

      ne_log_obj();
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v42 = 0;
        _os_log_error_impl(&dword_1876B1000, v38, OS_LOG_TYPE_ERROR, "Incorrect KE method chosen", v42, 2u);
      }
    }

    BOOL v34 = 0;
    goto LABEL_37;
  }

  ne_log_obj();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    __int16 v44 = 0;
    id v35 = "Integrity algorithm chosen with authenticated encryption";
    char v36 = (uint8_t *)&v44;
    goto LABEL_26;
  }

- (BOOL)checkSelectedChildSAProposal:(id)a3
{
  id v4 = a3;
  -[NEIKEv2Session firstChildSA](self, v5);
  id Property = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v7, 56LL, 1);
  }
  id v9 = Property;

  [v4 encryptionProtocols];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 firstObject];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11) {
    goto LABEL_9;
  }
  if (v9) {
    id v13 = objc_getProperty(v9, v12, 96LL, 1);
  }
  else {
    id v13 = 0LL;
  }
  id v14 = v13;
  char v15 = [v11 isEqual:v14];

  if ((v15 & 1) == 0)
  {
    ne_log_obj();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_26:
      BOOL v29 = 0;
      goto LABEL_27;
    }

    *(_WORD *)buf = 0;
    uint64_t v30 = "Incorrect encryption algorithm chosen";
    id v31 = buf;
LABEL_21:
    _os_log_error_impl(&dword_1876B1000, v19, OS_LOG_TYPE_ERROR, v30, v31, 2u);
    goto LABEL_26;
  }

  unint64_t v17 = v11[2];
  if (v17 <= 0x1F && ((0xD01C0000 >> v17) & 1) != 0)
  {
    if (v9) {
      id v36 = objc_getProperty(v9, v16, 104LL, 1);
    }
    else {
      id v36 = 0LL;
    }
    id v37 = v36;

    if (!v37) {
      goto LABEL_14;
    }
    ne_log_obj();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    __int16 v39 = 0;
    uint64_t v30 = "Integrity algorithm chosen with authenticated encryption";
    id v31 = (uint8_t *)&v39;
    goto LABEL_21;
  }

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setClientQueue:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (NEIKEv2ConfigurationMessage)assignedConfiguration
{
  return (NEIKEv2ConfigurationMessage *)objc_getProperty(self, a2, 48LL, 1);
}

- (NWEndpoint)localEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 56LL, 1);
}

- (NWEndpoint)remoteEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSString)ikeInterfaceName
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)clientCallback
{
  return self->_clientCallback;
}

- (void)setClientCallback:(void *)a3
{
  self->_clientCallback = a3;
}

- (void)clientCallbackInfo
{
  return self->_clientCallbackInfo;
}

- (void)setClientCallbackInfo:(void *)a3
{
  self->_clientCallbackInfo = a3;
}

- (id)stateUpdateBlock
{
  return objc_getProperty(self, a2, 96LL, 1);
}

- (void)setStateUpdateBlock:(id)a3
{
}

- (id)childStateUpdateBlock
{
  return objc_getProperty(self, a2, 104LL, 1);
}

- (void)setChildStateUpdateBlock:(id)a3
{
}

- (id)configurationUpdateBlock
{
  return objc_getProperty(self, a2, 112LL, 1);
}

- (void)setConfigurationUpdateBlock:(id)a3
{
}

- (id)trafficSelectorUpdateBlock
{
  return objc_getProperty(self, a2, 120LL, 1);
}

- (void)setTrafficSelectorUpdateBlock:(id)a3
{
}

- (id)additionalAddressesUpdateBlock
{
  return objc_getProperty(self, a2, 128LL, 1);
}

- (void)setAdditionalAddressesUpdateBlock:(id)a3
{
}

- (id)shortDPDEventBlock
{
  return objc_getProperty(self, a2, 136LL, 1);
}

- (void)setShortDPDEventBlock:(id)a3
{
}

- (id)redirectEventBlock
{
  return objc_getProperty(self, a2, 144LL, 1);
}

- (void)setRedirectEventBlock:(id)a3
{
}

- (id)privateNotifyStatusEvent
{
  return objc_getProperty(self, a2, 152LL, 1);
}

- (void)setPrivateNotifyStatusEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)firstChildSA
{
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, a2, 288, 1), "firstObject");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

void __68__NEIKEv2Session_invalidateWithCompletionHandler_completionHandler___block_invoke( uint64_t a1,  const char *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 48))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id Property = (dispatch_queue_s *)objc_getProperty(*(id *)(a1 + 32), a2, 368LL, 1);
      dispatch_assert_queue_V2(Property);
      if ([*(id *)(v3 + 320) count])
      {
        ne_log_obj();
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v3;
          _os_log_impl(&dword_1876B1000, v5, OS_LOG_TYPE_INFO, "%@ flushed all pending requests", buf, 0xCu);
        }

        [*(id *)(v3 + 320) removeAllObjects];
      }
    }
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v7 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
  int v8 = *(unsigned __int8 *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  if (v9) {
    id v9 = objc_getProperty(v9, v6, 368LL, 1);
  }
  id v10 = v9;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __68__NEIKEv2Session_invalidateWithCompletionHandler_completionHandler___block_invoke_2;
  v13[3] = &unk_18A08D910;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = *(id *)(a1 + 40);
  id v11 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v7->super.super.isa,  v8 == 0,  v10,  v13);

  -[NEIKEv2Session abort](*(_BYTE **)(a1 + 32), v12);
  -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __68__NEIKEv2Session_invalidateWithCompletionHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (const char *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = (char *)WeakRetained;
  if (WeakRetained)
  {
    self = (char *)WeakRetained;
    -[NEIKEv2Session resetAll]((uint64_t)WeakRetained, WeakRetained);
    id Property = objc_getProperty(self, v4, 336LL, 1);
    if (Property && Property[6] == 2LL)
    {
      id v7 = objc_getProperty(self, v6, 336LL, 1);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, 0LL);
    }

    if (objc_getProperty(self, v6, 176LL, 1))
    {
      id v9 = self;
      if (self[9])
      {
        objc_msgSend(objc_getProperty(self, v8, 176, 1), "invalidate");
        id v9 = self;
      }

      objc_setProperty_atomic(v9, v8, 0LL, 176LL);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v3 = self;
    if (v10)
    {
      (*(void (**)(uint64_t, char *))(v10 + 16))(v10, self);
      uint64_t v3 = self;
    }
  }
}

- (_BYTE)abort
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    id Property = (dispatch_queue_s *)objc_getProperty(result, a2, 368LL, 1);
    dispatch_assert_queue_V2(Property);
    ne_log_obj();
    SEL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      int v8 = v2;
      _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEFAULT, "Aborting session %@", (uint8_t *)&v7, 0xCu);
    }

    v2[11] = 1;
    [v2 setConfigurationUpdateBlock:0];
    [v2 setTrafficSelectorUpdateBlock:0];
    -[NEIKEv2Session cancelSendTimer](v2, v5);
    -[NEIKEv2Session invalidateDPDTimer](v2, v6);
    return (_BYTE *)-[NEIKEv2Session fireWaitingRequestHandlerWithPacket:](v2, 0LL);
  }

  return result;
}

- (void)enqueuePendingRequestContext:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  SEL v4 = a2;
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(a1, v3, 368LL, 1);
    dispatch_assert_queue_V2(Property);
    ne_log_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = (const char *)a1;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_INFO, "%@ Enqueueing %@", buf, 0x16u);
      }

      int v8 = (void *)a1[40];
      if (!v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v10 = (void *)a1[40];
        a1[40] = v9;

        int v8 = (void *)a1[40];
      }

      [v8 addObject:v4];
      id v11 = a1;
      if (*((_BYTE *)v4 + 9) && objc_opt_class())
      {
        id v12 = objc_alloc(NSString);
        [v11 description];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 description];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        id v15 = (void *)[v12 initWithFormat:@"com.apple.networkextension[%@ %@]", v13, v14];

        uint64_t v16 = [objc_alloc(MEMORY[0x189612A98]) initWithIdentifier:v15];
        id v17 = v4[2];
        v4[2] = (id)v16;

        [v4[2] acquireWithTimeout:0 handler:0.0];
        ne_log_obj();
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = (const char *)v4[2];
          *(_DWORD *)buf = 138412290;
          id v22 = v19;
          _os_log_impl(&dword_1876B1000, v18, OS_LOG_TYPE_DEFAULT, "Took power assertion %@", buf, 0xCu);
        }
      }

      if (!v11[15]) {
        -[NEIKEv2Session sendPendingRequestContext]((uint64_t)v11, v20);
      }
    }

    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = "-[NEIKEv2Session enqueuePendingRequestContext:]";
        _os_log_fault_impl(&dword_1876B1000, v7, OS_LOG_TYPE_FAULT, "%s called with null requestContext", buf, 0xCu);
      }
    }
  }
}

- (void)sendPendingRequestContext
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty((id)a1, a2, 368LL, 1);
    dispatch_assert_queue_V2(Property);
    if (!*(_BYTE *)(a1 + 15))
    {
      id v4 = *(id *)(a1 + 320);
      uint64_t v5 = [v4 firstObject];

      if (v5)
      {
        id v6 = (id *)(a1 + 320);
        ne_log_obj();
        int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412546;
          id v15 = (__CFString *)a1;
          __int16 v16 = 2112;
          uint64_t v17 = v5;
          _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_INFO, "%@ Dequeueing %@", (uint8_t *)&v14, 0x16u);
        }

        [*v6 removeObjectAtIndex:0];
        if (![*v6 count]) {
          objc_storeStrong((id *)(a1 + 320), 0LL);
        }
        *(_BYTE *)(v5 + 8) = 1;
        *(_BYTE *)(a1 + 15) = 1;
        int v9 = *(_DWORD *)(v5 + 12);
        if ((*(_BYTE *)(a1 + 11) & 1) != 0)
        {
          if (v9 == 7)
          {
LABEL_12:
            uint64_t v10 = objc_getProperty((id)a1, v8, 336LL, 1);
            if (v10 && v10[6] == 2LL) {
              -[NEIKEv2Session initiateDelete:]((void *)a1, (void *)v5);
            }
            else {
              [(id)v5 sendCallbackSuccess:0 session:a1];
            }
          }

          else
          {
            ne_log_obj();
            id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              int v14 = 138412546;
              id v15 = (__CFString *)a1;
              __int16 v16 = 2112;
              uint64_t v17 = v5;
              _os_log_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_INFO,  "%@ Session aborted, skip request %@",  (uint8_t *)&v14,  0x16u);
            }

            [(id)v5 sendCallbackSuccess:0 session:a1];
            -[NEIKEv2Session sendPendingRequestContext](a1);
          }
        }

        else
        {
          switch(v9)
          {
            case 1:
              -[NEIKEv2Session initiateRekeyIKESA:]((_BYTE *)a1, (void *)v5);
              break;
            case 2:
              -[NEIKEv2Session initiateRekeyChildSA:]((_BYTE *)a1, (void *)v5);
              break;
            case 3:
              -[NEIKEv2Session initiateInformational:]((_BYTE *)a1, (void *)v5);
              break;
            case 4:
              -[NEIKEv2Session initiateMOBIKE:]((_BYTE *)a1, (void *)v5);
              break;
            case 5:
              -[NEIKEv2Session initiateNewChildSA:]((_BYTE *)a1, (void *)v5);
              break;
            case 6:
              -[NEIKEv2Session initiateDeleteChildSA:]((void *)a1, (void *)v5);
              break;
            case 7:
              goto LABEL_12;
            default:
              ne_log_obj();
              id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              {
                id v13 = NEIKEv2RequestContextTypeString(*(_DWORD *)(v5 + 12));
                int v14 = 138412290;
                id v15 = v13;
                _os_log_fault_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_FAULT,  "bad request type %@",  (uint8_t *)&v14,  0xCu);
              }

              break;
          }
        }
      }
    }
  }

- (void)cancelSendTimer
{
  if (a1)
  {
    if (objc_getProperty(a1, a2, 296LL, 1))
    {
      id Property = (dispatch_source_s *)objc_getProperty(a1, v3, 296LL, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(a1, v5, 0LL, 296LL);
    }

    if (objc_getProperty(a1, v3, 360LL, 1))
    {
      int v7 = objc_getProperty(a1, v6, 360LL, 1);
      if (v7)
      {
        v7[8] = 1000LL;
        *((_DWORD *)v7 + 3) = -1;
        v7[2] = 0LL;
        v7[3] = 0LL;
        *((_OWORD *)v7 + 2) = xmmword_187873220;
        *((_OWORD *)v7 + 3) = xmmword_187873230;
        *((_WORD *)v7 + 4) = 0;
      }
    }

    if (objc_getProperty(a1, v6, 200LL, 1))
    {
      uint64_t v10 = (void (**)(id, void))objc_getProperty(a1, v8, 200LL, 1);
      objc_setProperty_atomic_copy(a1, v9, 0LL, 200LL);
      v10[2](v10, 0LL);
    }
  }

- (void)invalidateDPDTimer
{
  if (objc_getProperty(a1, a2, 272LL, 1))
  {
    objc_msgSend(objc_getProperty(a1, v3, 272, 1), "invalidate");
    objc_setProperty_atomic(a1, v4, 0LL, 272LL);
  }

  if (objc_getProperty(a1, v3, 280LL, 1))
  {
    id Property = (dispatch_source_s *)objc_getProperty(a1, v5, 280LL, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(a1, v7, 0LL, 280LL);
  }

- (uint64_t)fireWaitingRequestHandlerWithPacket:(void *)a1
{
  id v4 = a2;
  if (!a1) {
    goto LABEL_6;
  }
  SEL v5 = (dispatch_source_s *)a1[38];
  if (v5)
  {
    dispatch_source_cancel(v5);
    id v6 = (void *)a1[38];
    a1[38] = 0LL;
  }

  if (objc_getProperty(a1, v3, 208LL, 1))
  {
    uint64_t v8 = 1LL;
    SEL v9 = (void (**)(id, id))objc_getProperty(a1, v7, 208LL, 1);
    objc_setProperty_atomic_copy(a1, v10, 0LL, 208LL);
    v9[2](v9, v4);
  }

  else
  {
LABEL_6:
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (void)resetAll
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty((id)a1, a2, 368LL, 1);
    dispatch_assert_queue_V2(Property);
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v53 = 138412290;
      uint64_t v54 = a1;
      _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEFAULT, "Resetting %@", (uint8_t *)&v53, 0xCu);
    }

    -[NEIKEv2Session abort]((_BYTE *)a1, v5);
    -[NEIKEv2Session uninstallAllChildSAs](a1);
    if (objc_getProperty((id)a1, v6, 264LL, 1))
    {
      uint64_t v8 = (dispatch_source_s *)objc_getProperty((id)a1, v7, 264LL, 1);
      dispatch_source_cancel(v8);
      objc_setProperty_atomic((id)a1, v9, 0LL, 264LL);
    }

    -[NEIKEv2Session invalidateDPDTimer]((void *)a1, v7);
    if ((*(_BYTE *)(a1 + 10) & 1) != 0)
    {
      id v11 = *(const void **)(a1 + 328);
      if (v11)
      {
        CFRelease(v11);
        *(void *)(a1 + 328) = 0LL;
      }
    }

    -[NEIKEv2Session resetMessages]((_DWORD *)a1, v10);
    id v13 = objc_getProperty((id)a1, v12, 336LL, 1);
    if (v13)
    {
      id v15 = v13;
      -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v13, 0);
      *((_BYTE *)v15 + 9) = 1;
      *((_BYTE *)v15 + 16) = 0;
      __int16 v16 = objc_alloc_init(&OBJC_CLASS___NEIKEv2IKESPI);
      objc_setProperty_atomic(v15, v17, v16, 32LL);

      objc_setProperty_atomic(v15, v18, 0LL, 40LL);
      objc_setProperty_atomic(v15, v19, 0LL, 152LL);
      objc_setProperty_atomic(v15, v20, 0LL, 160LL);
      objc_setProperty_atomic(v15, v21, 0LL, 168LL);
      objc_setProperty_atomic(v15, v22, 0LL, 176LL);
      objc_setProperty_atomic(v15, v23, 0LL, 184LL);
      objc_setProperty_atomic(v15, v24, 0LL, 128LL);
      objc_setProperty_atomic(v15, v25, 0LL, 136LL);
      objc_setProperty_atomic(v15, v26, 0LL, 192LL);
      objc_setProperty_atomic(v15, v27, 0LL, 200LL);
      objc_setProperty_atomic(v15, v28, 0LL, 208LL);
      objc_setProperty_atomic(v15, v29, 0LL, 216LL);
      objc_setProperty_atomic(v15, v30, 0LL, 224LL);
      objc_setProperty_atomic(v15, v31, 0LL, 232LL);
      objc_setProperty_atomic(v15, v32, 0LL, 240LL);
      objc_setProperty_atomic(v15, v33, 0LL, 248LL);
      objc_setProperty_atomic(v15, v34, 0LL, 256LL);
      objc_setProperty_atomic(v15, v35, 0LL, 264LL);
      objc_setProperty_atomic(v15, v36, 0LL, 512LL);
      objc_setProperty_atomic(v15, v37, 0LL, 520LL);
      objc_setProperty_atomic(v15, v38, 0LL, 528LL);
      objc_setProperty_atomic(v15, v39, 0LL, 488LL);
      objc_setProperty_atomic(v15, v40, 0LL, 96LL);
      objc_setProperty_atomic(v15, v41, 0LL, 312LL);
      objc_setProperty_atomic(v15, v42, 0LL, 320LL);
      objc_setProperty_atomic(v15, v43, 0LL, 504LL);
      objc_setProperty_atomic(v15, v44, 0LL, 448LL);
      objc_setProperty_atomic(v15, v45, 0LL, 456LL);
      objc_storeStrong((id *)v15 + 14, 0LL);
    }

    id v46 = objc_getProperty((id)a1, v14, 360LL, 1);
    if (v46)
    {
      v46[8] = 1000LL;
      *((_DWORD *)v46 + 3) = -1;
      v46[2] = 0LL;
      v46[3] = 0LL;
      *((_OWORD *)v46 + 2) = xmmword_187873220;
      *((_OWORD *)v46 + 3) = xmmword_187873230;
      *((_WORD *)v46 + 4) = 0;
    }

    if (objc_msgSend(objc_getProperty((id)a1, v47, 288, 1), "count"))
    {
      objc_msgSend(objc_getProperty((id)a1, v48, 288, 1), "firstObject");
      id v49 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(objc_getProperty((id)a1, v50, 288, 1), "removeAllObjects");
      if (v49)
      {
        -[NEIKEv2ChildSA reset](v49, v51);
        objc_msgSend(objc_getProperty((id)a1, v52, 288, 1), "addObject:", v49);
      }
    }
  }

- (uint64_t)uninstallAllChildSAs
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (result)
  {
    v1 = (void *)result;
    ne_log_obj();
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      SEL v30 = v1;
      __int16 v31 = 2112;
      id Property = objc_getProperty(v1, v3, 176LL, 1);
      _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEFAULT, "%@ %@ Uninstalling all child SAs", buf, 0x16u);
    }

    objc_msgSend(objc_getProperty(v1, v4, 176, 1), "removeAllSAs");
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v6 = objc_getProperty(v1, v5, 184LL, 1);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * v10++) invalidate];
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v8);
    }

    objc_msgSend(objc_getProperty(v1, v11, 184, 1), "removeAllObjects");
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v13 = objc_getProperty(v1, v12, 192LL, 1);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17++), "invalidate", (void)v19);
        }

        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }

      while (v15);
    }

    return objc_msgSend(objc_getProperty(v1, v18, 192, 1), "removeAllObjects");
  }

  return result;
}

- (void)resetMessages
{
  a1[4] = -1;
  a1[5] = -1;
  a1[6] = -1;
  objc_msgSend(objc_getProperty(a1, v3, 216, 1), "removeAllObjects");
  objc_msgSend(objc_getProperty(a1, v4, 224, 1), "removeAllObjects");
  objc_msgSend(objc_getProperty(a1, v5, 232, 1), "removeAllObjects");
  objc_msgSend(objc_getProperty(a1, v6, 240, 1), "removeAllObjects");
  objc_msgSend(objc_getProperty(a1, v7, 248, 1), "removeAllObjects");
  objc_msgSend(objc_getProperty(a1, v8, 256, 1), "removeAllObjects");
  objc_setProperty_atomic(a1, v9, 0LL, 376LL);
}

- (void)processFragment:(_DWORD *)a1
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  SEL v4 = a2;
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(a1, v3, 368LL, 1);
    dispatch_assert_queue_V2(Property);
    if ((v4[9] & 1) == 0)
    {
      ne_log_obj();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        unint64_t v90 = "-[NEIKEv2Session processFragment:]";
        _os_log_fault_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_FAULT,  "%s called with null fragment.isFragmented",  buf,  0xCu);
      }

      goto LABEL_37;
    }

    uint64_t v7 = *((unsigned int *)v4 + 6);
    if ((v4[10] & 1) != 0)
    {
      uint64_t v10 = objc_getProperty(a1, v6, 336LL, 1);
      int v11 = 4;
      if (v10)
      {
        if ((v10[17] & 1) != 0) {
          int v11 = 6;
        }
        else {
          int v11 = 4;
        }
      }

      int v12 = a1[4];
      BOOL v13 = __OFSUB__(v12, v11);
      int v8 = v12 - v11;
      if (v8 < 0 != v13)
      {
        if ((int)v7 > v12)
        {
          ne_log_obj();
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v90 = (const char *)a1;
            uint64_t v15 = "%@ Discarding too new fragment";
LABEL_20:
            _os_log_impl(&dword_1876B1000, v14, OS_LOG_TYPE_INFO, v15, buf, 0xCu);
          }

- (void)setReceivedReply:(uint64_t)a3 messageID:
{
  if (a1)
  {
    id v5 = a2;
    id Property = objc_getProperty(a1, v6, 240LL, 1);
    int v8 = (void *)MEMORY[0x189607968];
    id v9 = Property;
    [v8 numberWithInt:a3];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v5 forKeyedSubscript:v10];
  }

- (id)copyChildWithSPI:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id obj = objc_getProperty(a1, v3, 288LL, 1);
    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v26;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
          if (v10)
          {
            id Property = objc_getProperty(*(id *)(*((void *)&v25 + 1) + 8 * v9), v6, 56LL, 1);
            BOOL v13 = Property;
            if (Property) {
              id Property = objc_getProperty(Property, v12, 80LL, 1);
            }
          }

          else
          {
            BOOL v13 = 0LL;
            id Property = 0LL;
          }

          id v14 = Property;
          if ([v14 isEqual:v4])
          {

LABEL_23:
            id v22 = v10;
            goto LABEL_24;
          }

          if (v10)
          {
            id v16 = objc_getProperty(v10, v15, 56LL, 1);
            SEL v18 = v16;
            if (v16) {
              id v16 = objc_getProperty(v16, v17, 88LL, 1);
            }
          }

          else
          {
            SEL v18 = 0LL;
            id v16 = 0LL;
          }

          id v19 = v16;
          char v20 = [v19 isEqual:v4];

          if ((v20 & 1) != 0) {
            goto LABEL_23;
          }
          ++v9;
        }

        while (v7 != v9);
        uint64_t v21 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        uint64_t v7 = v21;
        id v22 = 0LL;
      }

      while (v21);
    }

    else
    {
      id v22 = 0LL;
    }

- (uint64_t)sendReplyForMessageID:(_BYTE *)a1
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id Property = (dispatch_queue_s *)objc_getProperty(a1, a2, 368LL, 1);
  dispatch_assert_queue_V2(Property);
  if ((a1[12] & 1) != 0)
  {
    ne_log_obj();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      SEL v50 = a1;
      __int16 v51 = 1024;
      *(_DWORD *)uint64_t v52 = (_DWORD)a2;
      _os_log_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ Skipping sending reply %d on invalidated session",  buf,  0x12u);
    }

    goto LABEL_17;
  }

  if (!objc_getProperty(a1, v5, 336LL, 1))
  {
    ne_log_obj();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    SEL v50 = "-[NEIKEv2Session sendReplyForMessageID:]";
    __int128 v26 = "%s called with null self.ikeSA";
LABEL_42:
    _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, v26, buf, 0xCu);
    goto LABEL_17;
  }

  uint64_t v7 = objc_getProperty(a1, v6, 336LL, 1);
  if ((-[NEIKEv2IKESA hasTransport](v7, v8) & 1) != 0)
  {
    id v10 = (id *)objc_getProperty(a1, v9, 336LL, 1);
    int v12 = (os_log_s *)-[NEIKEv2IKESA copyTransport](v10, v11);
    id v14 = objc_getProperty(a1, v13, 224LL, 1);
    uint64_t v15 = (void *)MEMORY[0x189607968];
    id v16 = v14;
    [v15 numberWithInt:a2];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 objectForKeyedSubscript:v17];
    SEL v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v18 count] == 1)
    {
      ne_log_obj();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        [v18 firstObject];
        SEL v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        SEL v50 = a1;
        __int16 v51 = 1024;
        *(_DWORD *)uint64_t v52 = [v41 length];
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)&v52[6] = (_DWORD)a2;
        __int16 v53 = 2112;
        *(void *)uint64_t v54 = v12;
        _os_log_debug_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_DEBUG,  "%@ Sending reply of length %u with ID %u on %@\n",  buf,  0x22u);
      }

      [v18 firstObject];
      char v20 = (void *)objc_claimAutoreleasedReturnValue();
      char v21 = -[NEIKEv2Transport sendData:sendCompletionHandler:]((id *)v12, v20, 0LL);

      if ((v21 & 1) == 0)
      {
        ne_log_obj();
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1876B1000, v22, OS_LOG_TYPE_ERROR, "Sending reply data failed", buf, 2u);
        }

        id v24 = objc_getProperty(a1, v23, 336LL, 1);
        -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v24, 1);
        uint64_t v25 = 0LL;
        goto LABEL_40;
      }
    }

    else
    {
      if ([v18 count])
      {
        SEL v43 = v18;
        int v44 = [v18 count];
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id v28 = v18;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v46;
          int v32 = 1;
          id v42 = v28;
          while (2)
          {
            uint64_t v33 = 0LL;
            do
            {
              if (*(void *)v46 != v31) {
                objc_enumerationMutation(v28);
              }
              SEL v34 = *(void **)(*((void *)&v45 + 1) + 8 * v33);
              ne_log_obj();
              SEL v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                int v36 = [v34 length];
                *(_DWORD *)buf = 138413570;
                SEL v50 = a1;
                __int16 v51 = 1024;
                *(_DWORD *)uint64_t v52 = v32 + v33;
                id v28 = v42;
                *(_WORD *)&v52[4] = 1024;
                *(_DWORD *)&v52[6] = v44;
                __int16 v53 = 1024;
                *(_DWORD *)uint64_t v54 = v36;
                *(_WORD *)&void v54[4] = 1024;
                *(_DWORD *)&v54[6] = (_DWORD)a2;
                __int16 v55 = 2112;
                id v56 = v12;
                _os_log_debug_impl( &dword_1876B1000,  v35,  OS_LOG_TYPE_DEBUG,  "%@ Sending reply fragment %u/%u of length %u with ID %u on %@\n",  buf,  0x2Eu);
              }

              if ((-[NEIKEv2Transport sendData:sendCompletionHandler:]((id *)v12, v34, 0LL) & 1) == 0)
              {
                ne_log_obj();
                uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  SEL v50 = a1;
                  _os_log_error_impl( &dword_1876B1000,  v37,  OS_LOG_TYPE_ERROR,  "%@ Sending fragment reply data failed",  buf,  0xCu);
                }

                id v39 = objc_getProperty(a1, v38, 336LL, 1);
                -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v39, 1);

                uint64_t v25 = 0LL;
                goto LABEL_35;
              }

              ++v33;
            }

            while (v30 != v33);
            v32 += v33;
            uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v57 count:16];
            if (v30) {
              continue;
            }
            break;
          }
        }

        uint64_t v25 = 1LL;
LABEL_35:
        SEL v18 = v43;
        goto LABEL_40;
      }

      ne_log_obj();
      uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        SEL v50 = a1;
        __int16 v51 = 2112;
        *(void *)uint64_t v52 = v18;
        _os_log_error_impl( &dword_1876B1000,  v40,  OS_LOG_TYPE_ERROR,  "%@ Sending reply had unexpected sendValue %@",  buf,  0x16u);
      }
    }

    uint64_t v25 = 1LL;
LABEL_40:

    goto LABEL_18;
  }

  ne_log_obj();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    SEL v50 = "-[NEIKEv2Session sendReplyForMessageID:]";
    __int128 v26 = "%s called with null self.ikeSA.hasTransport";
    goto LABEL_42;
  }

+ (void)removeItemsFromDictionary:(int)a3 lowerEdge:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_opt_self();
  [v4 allKeys];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 sortedArrayUsingSelector:sel_compare_];
  SEL v6 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    uint64_t v11 = a3;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        SEL v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          ne_log_obj();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            char v20 = v13;
            _os_log_fault_impl(&dword_1876B1000, v14, OS_LOG_TYPE_FAULT, "Key %@ is not NSNumber", buf, 0xCu);
          }

void __27__NEIKEv2Session_addChild___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(_BYTE **)(a1 + 32);
  if (Property)
  {
    if ((Property[11] & 1) != 0) {
      return;
    }
    id Property = objc_getProperty(Property, a2, 288LL, 1);
  }

  [Property addObject:*(void *)(a1 + 40)];
  -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 48));
}

void __125__NEIKEv2Session_sendMOBIKEWithRetries_retryInterval_interfaceName_invalidateTransport_resetEndpoint_callbackQueue_callback___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(_BYTE *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }

  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0LL, *(void **)(a1 + 40));
  }

void __100__NEIKEv2Session_sendPrivateNotifies_maxRetries_retryIntervalInMilliseconds_callbackQueue_callback___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(_BYTE *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }

  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0LL, *(void **)(a1 + 40));
  }

void __94__NEIKEv2Session_sendKeepaliveWithRetries_retryIntervalInMilliseconds_callbackQueue_callback___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(_BYTE *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }

  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0LL, *(void **)(a1 + 40));
  }

void __38__NEIKEv2Session_updateConfiguration___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  SEL v3 = *(_BYTE **)(a1 + 32);
  if (!v3) {
    goto LABEL_8;
  }
  if ((v3[11] & 1) != 0) {
    return;
  }
  if (objc_getProperty(v3, a2, 336LL, 1))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id Property = objc_getProperty(v5, v4, 336LL, 1);
      if (Property) {
        objc_setProperty_atomic(Property, v4, *(id *)(a1 + 40), 88LL);
      }
    }

    -[NEIKEv2Session startDPDTimer](*(void **)(a1 + 32), v4);
  }

  else
  {
LABEL_8:
    ne_log_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[NEIKEv2Session updateConfiguration:]_block_invoke";
      _os_log_fault_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_FAULT,  "%s called with null self.ikeSA",  (uint8_t *)&v8,  0xCu);
    }
  }

- (void)startDPDTimer
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (objc_getProperty(a1, a2, 336LL, 1))
    {
      id Property = objc_getProperty(a1, v3, 336LL, 1);
      if (Property) {
        id Property = objc_getProperty(Property, v5, 88LL, 1);
      }
      id v6 = Property;
      if ([v6 deadPeerDetectionEnabled] && objc_msgSend(v6, "deadPeerDetectionInterval"))
      {
        unint64_t v7 = [v6 deadPeerDetectionInterval];
        unint64_t v8 = v7;
        double v9 = 5.0;
        if (v7 >= 0x12D)
        {
          double v9 = 15.0;
          if (v7 <= 0x383) {
            double v9 = (double)v7 / 60.0;
          }
        }

        if (objc_opt_class())
        {
          if (objc_getProperty(a1, v10, 272LL, 1))
          {
            objc_msgSend(objc_getProperty(a1, v11, 272, 1), "cancel");
          }

          else
          {
            id v12 = objc_alloc(NSString);
            [a1 description];
            SEL v13 = (void *)objc_claimAutoreleasedReturnValue();
            id v14 = (void *)[v12 initWithFormat:@"com.apple.networkextension[%@ Periodic Dead Peer Detection]", v13];

            __int128 v15 = (void *)[objc_alloc(MEMORY[0x189612AA0]) initWithIdentifier:v14];
            objc_setProperty_atomic(a1, v16, v15, 272LL);
          }

          ne_log_obj();
          __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            __int128 v18 = (void *)NEGetSystemWakeTime();
            *(_DWORD *)buf = 138413058;
            __int128 v46 = (const char *)a1;
            __int16 v47 = 2048;
            unint64_t v48 = v8;
            __int16 v49 = 2048;
            double v50 = v9;
            __int16 v51 = 2112;
            uint64_t v52 = v18;
            _os_log_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_INFO,  "%@: Setting DPD timer for %llu seconds, leeway %f seconds, last wake date %@",  buf,  0x2Au);
          }

          objc_initWeak((id *)buf, a1);
          id v20 = objc_getProperty(a1, v19, 272LL, 1);
          id v22 = objc_getProperty(a1, v21, 368LL, 1);
          v43[0] = MEMORY[0x1895F87A8];
          v43[1] = 3221225472LL;
          v43[2] = __31__NEIKEv2Session_startDPDTimer__block_invoke;
          v43[3] = &unk_18A08D7F8;
          objc_copyWeak(&v44, (id *)buf);
          [v20 scheduleWithFireInterval:v22 leewayInterval:v43 queue:(double)v8 handler:v9];

          objc_destroyWeak(&v44);
          objc_destroyWeak((id *)buf);
        }

        else
        {
          if (objc_getProperty(a1, v10, 280LL, 1))
          {
            id v24 = (dispatch_source_s *)objc_getProperty(a1, v23, 280LL, 1);
            dispatch_source_cancel(v24);
            objc_setProperty_atomic(a1, v25, 0LL, 280LL);
          }

          ne_log_obj();
          __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            __int128 v46 = (const char *)a1;
            __int16 v47 = 2048;
            unint64_t v48 = v8;
            __int16 v49 = 2048;
            double v50 = v9;
            _os_log_impl( &dword_1876B1000,  v26,  OS_LOG_TYPE_INFO,  "%@: Setting DPD timer for %llu seconds, leeway %f seconds",  buf,  0x20u);
          }

          id v28 = (dispatch_queue_s *)objc_getProperty(a1, v27, 368LL, 1);
          dispatch_source_t v29 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v28);
          objc_setProperty_atomic(a1, v30, v29, 280LL);

          if (objc_getProperty(a1, v31, 280LL, 1))
          {
            uint64_t v33 = (dispatch_source_s *)objc_getProperty(a1, v32, 280LL, 1);
            dispatch_time_t v34 = dispatch_time(0x8000000000000000LL, 1000000000 * v8);
            dispatch_source_set_timer(v33, v34, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v9 * 1000000000.0));

            objc_initWeak((id *)buf, a1);
            id v36 = objc_getProperty(a1, v35, 280LL, 1);
            handler[0] = MEMORY[0x1895F87A8];
            handler[1] = 3221225472LL;
            handler[2] = __31__NEIKEv2Session_startDPDTimer__block_invoke_53;
            handler[3] = &unk_18A08FAC8;
            uint64_t v37 = (dispatch_source_s *)v36;
            objc_copyWeak(&v42, (id *)buf);
            dispatch_source_set_event_handler(v37, handler);

            id v39 = (dispatch_object_s *)objc_getProperty(a1, v38, 280LL, 1);
            dispatch_activate(v39);
            objc_destroyWeak(&v42);
            objc_destroyWeak((id *)buf);
          }

          else
          {
            ne_log_obj();
            uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1876B1000, v40, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
            }
          }
        }
      }
    }

    else
    {
      ne_log_obj();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int128 v46 = "-[NEIKEv2Session startDPDTimer]";
        _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v6,  OS_LOG_TYPE_FAULT,  "%s called with null self.ikeSA",  buf,  0xCu);
      }
    }
  }

void __31__NEIKEv2Session_startDPDTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WeakRetained[11] & 1) == 0)
  {
    SEL v3 = WeakRetained;
    -[NEIKEv2Session dpdTimerFired](WeakRetained, v2);
    id WeakRetained = v3;
  }
}

void __31__NEIKEv2Session_startDPDTimer__block_invoke_53(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WeakRetained[11] & 1) == 0)
  {
    SEL v3 = WeakRetained;
    -[NEIKEv2Session dpdTimerFired](WeakRetained, v2);
    id WeakRetained = v3;
  }
}

- (void)dpdTimerFired
{
  id Property = objc_getProperty(a1, a2, 336LL, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v4, 88LL, 1);
  }
  id v5 = Property;
  objc_msgSend( a1,  "sendKeepaliveWithRetries:retryIntervalInMilliseconds:callbackQueue:callback:",  objc_msgSend(v5, "deadPeerDetectionMaxRetryCount"),  objc_msgSend(v5, "deadPeerDetectionRetryIntervalMilliseconds"),  0,  0);
  -[NEIKEv2Session startDPDTimer](a1);
}

- (void)removeChild:(void *)a3 withReason:
{
  if (a1)
  {
    id v6 = a3;
    unint64_t v7 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteChildContext);
    id v8 = v6;
    if (v7)
    {
      v15.receiver = v7;
      v15.super_class = (Class)&OBJC_CLASS___NEIKEv2DeleteChildContext;
      double v9 = (NEIKEv2DeleteChildContext *)objc_msgSendSuper2(&v15, sel_initWithRequestType_, 6);
      unint64_t v7 = v9;
      if (v9)
      {
        v9->_childID = a2;
        objc_storeStrong((id *)&v9->_reasonError, a3);
      }
    }

    id Property = (dispatch_queue_s *)objc_getProperty(a1, v10, 368LL, 1);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __41__NEIKEv2Session_removeChild_withReason___block_invoke;
    v13[3] = &unk_18A08F098;
    void v13[4] = a1;
    id v14 = v7;
    id v12 = v7;
    dispatch_async(Property, v13);
  }

void __41__NEIKEv2Session_removeChild_withReason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(_BYTE *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }

  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0LL, *(void **)(a1 + 40));
  }

void __34__NEIKEv2Session_forceRekeyChild___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(_BYTE *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }

  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0LL, *(void **)(a1 + 40));
  }

void __31__NEIKEv2Session_forceRekeyIKE__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(_BYTE *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }

  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0LL, *(void **)(a1 + 40));
  }

void __28__NEIKEv2Session_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v3;
    _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEFAULT, "Disconnect %@", buf, 0xCu);
  }

  id v4 = *(_BYTE **)(a1 + 32);
  if (!v4 || (v4[11] & 1) == 0)
  {
    objc_initWeak((id *)buf, v4);
    id v6 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 368LL, 1);
    }
    id v8 = Property;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __28__NEIKEv2Session_disconnect__block_invoke_38;
    v11[3] = &unk_18A08D7D0;
    objc_copyWeak(&v12, (id *)buf);
    double v9 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v6->super.super.isa,  1,  v8,  v11);

    -[NEIKEv2Session abort](*(_BYTE **)(a1 + 32), v10);
    -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

void __28__NEIKEv2Session_disconnect__block_invoke_38(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    -[NEIKEv2Session resetAll]((uint64_t)WeakRetained, v2);
    id Property = objc_getProperty(v3, v4, 336LL, 1);
    if (Property && Property[6] == 2LL)
    {
      id v7 = objc_getProperty(v3, v6, 336LL, 1);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, 0LL);
      -[NEIKEv2Session reportState](v3, v8);
    }

    ne_log_obj();
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = v3;
      _os_log_impl(&dword_1876B1000, v9, OS_LOG_TYPE_DEFAULT, "Disconnected %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)reportState
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  id Property = objc_getProperty(a1, a2, 336LL, 1);
  if (Property) {
    unint64_t v5 = Property[6];
  }
  else {
    unint64_t v5 = 0LL;
  }
  id v6 = objc_getProperty(a1, v4, 336LL, 1);
  SEL v43 = (id *)a1;
  if (v6) {
    id v6 = objc_getProperty(v6, v7, 56LL, 1);
  }
  id v8 = v6;
  ne_log_obj();
  double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  id v42 = v8;
  if (v8)
  {
    if (!v10) {
      goto LABEL_12;
    }
    SessionStateString = NEIKEv2CreateSessionStateString(v5);
    *(_DWORD *)buf = 138412802;
    id v60 = a1;
    __int16 v61 = 2112;
    id v62 = SessionStateString;
    __int16 v63 = 2112;
    id v64 = v8;
    uint64_t v12 = "%@ Reporting state %@ error %@";
    SEL v13 = v9;
    uint32_t v14 = 32;
  }

  else
  {
    if (!v10) {
      goto LABEL_12;
    }
    SessionStateString = NEIKEv2CreateSessionStateString(v5);
    *(_DWORD *)buf = 138412546;
    id v60 = a1;
    __int16 v61 = 2112;
    id v62 = SessionStateString;
    uint64_t v12 = "%@ Reporting state %@";
    SEL v13 = v9;
    uint32_t v14 = 22;
  }

  _os_log_impl(&dword_1876B1000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);

LABEL_12:
  uint64_t v15 = (id *)a1;
  a1[5] = v5;
  -[NEIKEv2Session updateEndpointState](a1, v16);
  [a1 stateUpdateBlock];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 clientQueue];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && v17)
  {
    [a1 clientQueue];
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __29__NEIKEv2Session_reportState__block_invoke;
    block[3] = &unk_18A08E118;
    block[4] = a1;
    id v56 = v17;
    unint64_t v57 = v5;
    id v55 = v42;
    dispatch_async(v20, block);

    id v22 = objc_getProperty(a1, v21, 336LL, 1);
    if (v22) {
      v22[8] = 0;
    }
  }

  SEL v41 = v17;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = objc_getProperty(a1, v19, 288LL, 1);
  uint64_t v23 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v51;
    do
    {
      for (uint64_t i = 0LL; i != v24; ++i)
      {
        if (*(void *)v51 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        if (v27)
        {
          int v28 = *(_DWORD *)(v27 + 16);
          if (v28)
          {
            unint64_t v29 = *(void *)(v27 + 32);
            if (v5 == 3)
            {
              if (v29) {
                BOOL v30 = v29 == 3;
              }
              else {
                BOOL v30 = 1;
              }
              if (!v30)
              {
                unint64_t v29 = 3LL;
                goto LABEL_33;
              }
            }

            else if (!v5 && v29)
            {
              unint64_t v29 = 0LL;
LABEL_33:
              -[NEIKEv2ChildSA setState:error:](*(void *)(*((void *)&v50 + 1) + 8 * i), v29, v42);
            }

            if ((*(_BYTE *)(v27 + 8) & 1) != 0)
            {
              unint64_t v31 = v5;
              [v15 childStateUpdateBlock];
              int v32 = (void *)objc_claimAutoreleasedReturnValue();
              [v15 clientQueue];
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33 && v32)
              {
                id v35 = objc_getProperty((id)v27, v34, 40LL, 1);
                [v15 clientQueue];
                id v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
                v45[0] = MEMORY[0x1895F87A8];
                v45[1] = 3221225472LL;
                v45[2] = __29__NEIKEv2Session_reportState__block_invoke_2;
                v45[3] = &unk_18A08D898;
                v45[4] = v43;
                id v37 = v32;
                int v49 = v28;
                id v47 = v37;
                unint64_t v48 = v29;
                id v46 = v35;
                id v38 = v35;
                dispatch_async(v36, v45);

                uint64_t v15 = v43;
                *(_BYTE *)(v27 + 8) = 0;
              }

              unint64_t v5 = v31;
            }

            continue;
          }
        }
      }

      uint64_t v24 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    }

    while (v24);
  }

  id WeakRetained = objc_loadWeakRetained(v15 + 43);
  uint64_t v40 = WeakRetained;
  if (WeakRetained && v5 == 3 && !*((_BYTE *)v15 + 14))
  {
    *((_BYTE *)v15 + 14) = 1;
    [WeakRetained sessionFailedBeforeRequestingConfiguration:v15];
  }
}

- (void)updateEndpointState
{
  if (a1)
  {
    id Property = objc_getProperty(a1, a2, 336LL, 1);
    if (-[NEIKEv2IKESA hasTransport](Property, v4))
    {
      id v6 = (id *)objc_getProperty(a1, v5, 336LL, 1);
      id v8 = -[NEIKEv2IKESA copyTransport](v6, v7);
      self = v8;
      if (v8)
      {
        id v10 = objc_getProperty(v8, v9, 16LL, 1);
        objc_setProperty_atomic(a1, v11, v10, 56LL);

        id v13 = objc_getProperty(self, v12, 24LL, 1);
      }

      else
      {
        objc_setProperty_atomic(a1, v9, 0LL, 56LL);
        id v13 = 0LL;
      }

      id v14 = v13;
      objc_setProperty_atomic(a1, v15, v14, 64LL);

      id v17 = self;
      if (self) {
        id v17 = objc_getProperty(self, v16, 32LL, 1);
      }
      id v18 = v17;
      [v18 interfaceName];
      SEL v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(a1, v20, v19, 72LL);
    }

    else
    {
      objc_setProperty_atomic(a1, v5, 0LL, 56LL);
      objc_setProperty_atomic(a1, v21, 0LL, 64LL);
      objc_setProperty_atomic(a1, v22, 0LL, 72LL);
    }
  }

void *__29__NEIKEv2Session_reportState__block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!v1 || (*(_BYTE *)(v1 + 12) & 1) == 0) {
    return (void *)(*(uint64_t (**)(void, void, void))(result[6] + 16LL))( result[6],  result[7],  result[5]);
  }
  return result;
}

uint64_t __29__NEIKEv2Session_reportState__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!v1 || (*(_BYTE *)(v1 + 12) & 1) == 0) {
    return (*(uint64_t (**)(void, void, void, void))(*(void *)(result + 48) + 16LL))( *(void *)(result + 48),  *(unsigned int *)(result + 64),  *(void *)(result + 56),  *(void *)(result + 40));
  }
  return result;
}

void __25__NEIKEv2Session_connect__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEFAULT, "Connect %@", buf, 0xCu);
  }

  id Property = *(_BYTE **)(a1 + 32);
  if (Property)
  {
    if ((Property[11] & 1) != 0) {
      return;
    }
    id Property = objc_getProperty(Property, v4, 336LL, 1);
  }

  id v6 = -[NEIKEv2IKESA copyTransport]((id *)Property, v4);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __25__NEIKEv2Session_connect__block_invoke_36;
  v7[3] = &unk_18A090390;
  v7[4] = *(void *)(a1 + 32);
  -[NEIKEv2Transport waitForTransport:]((uint64_t)v6, v7);
}

void __25__NEIKEv2Session_connect__block_invoke_36(uint64_t a1, const char *a2)
{
  uint64_t v191 = *MEMORY[0x1895F89C0];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  -[NEIKEv2IKESA resyncAddress]((id *)Property, a2);
  unint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = (dispatch_queue_s *)objc_getProperty(*(id *)(a1 + 32), v4, 368LL, 1);
    dispatch_assert_queue_V2(v6);

    id v8 = objc_getProperty(v5, v7, 336LL, 1);
    uint64_t v164 = 0LL;
    __int16 v165 = &v164;
    uint64_t v166 = 0x3032000000LL;
    __int16 v167 = __Block_byref_object_copy__8823;
    SEL v168 = __Block_byref_object_dispose__8824;
    -[NEIKEv2Session firstChildSA](v5, v9);
    id v169 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      ne_log_obj();
      unint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NEIKEv2Session(Exchange) initiateConnect]";
      BOOL v30 = "%s called with null ikeSA";
      goto LABEL_69;
    }

    id v11 = objc_getProperty(v8, v10, 80LL, 1);
    char v12 = [v11 requestChildlessSA];

    id v14 = (void *)v165[5];
    if ((v12 & 1) != 0)
    {
      if (!v14)
      {
LABEL_11:
        ne_log_obj();
        SEL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v5;
          _os_log_impl( &dword_1876B1000,  v20,  OS_LOG_TYPE_DEFAULT,  "%@ Initiating IKEv2 connection",  (uint8_t *)&buf,  0xCu);
        }

        id v22 = objc_getProperty(v8, v21, 80LL, 1);
        int v23 = [v22 serverMode];

        if (v23)
        {
          ne_log_obj();
          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v5;
            _os_log_error_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_ERROR,  "%@ Cannot initiate connection while in server mode (connect)",  (uint8_t *)&buf,  0xCu);
          }

          id v27 = objc_getProperty(v5, v26, 336LL, 1);
          id Error = (id)NEIKEv2CreateError(9LL);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, Error);
LABEL_82:

          -[NEIKEv2Session reportState](v5, v110);
          -[NEIKEv2Session resetAll]((uint64_t)v5, v111);
          goto LABEL_83;
        }

        if ((v8[13] & 1) != 0)
        {
          ptrdiff_t v31 = 480LL;
        }

        else if ((v8[12] & 1) != 0)
        {
          ptrdiff_t v31 = 472LL;
        }

        else
        {
          ptrdiff_t v31 = 464LL;
        }

        int v32 = objc_getProperty(v8, v24, v31, 1);
        if (!v32 || (v32[8] & 1) == 0)
        {
          ne_log_obj();
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v5;
            _os_log_error_impl( &dword_1876B1000,  v33,  OS_LOG_TYPE_ERROR,  "%@ Cannot initiate connection as transport is not connected (connect)",  (uint8_t *)&buf,  0xCu);
          }

          id v27 = objc_getProperty(v5, v34, 336LL, 1);
          id Error = objc_getProperty(v8, v35, 56LL, 1);
          if (Error) {
            id ErrorInternal = objc_getProperty(v8, v36, 56LL, 1);
          }
          else {
            id ErrorInternal = (id)NEIKEv2CreateErrorInternal( @"Transport is not connected (connect)",  (uint64_t)v36,  v37,  v38,  v39,  v40,  v41,  v42,  v156);
          }
          id v67 = ErrorInternal;
          -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, ErrorInternal);

          goto LABEL_82;
        }

        -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 1uLL, 0LL);
        -[NEIKEv2Session reportState](v5, v44);
        id v46 = (void *)v165[5];
        if (v46)
        {
          -[NEIKEv2ChildSA configProposalsWithoutKEM]((id)v165[5], v45);
          id v47 = (void *)objc_claimAutoreleasedReturnValue();
          char v48 = -[NEIKEv2Session generateSPIForChild:proposals:](v5, v46, v47);

          if ((v48 & 1) == 0)
          {
            ne_log_obj();
            id v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v5;
              _os_log_error_impl( &dword_1876B1000,  v77,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate Child SA SPI (connect)",  (uint8_t *)&buf,  0xCu);
            }

            id v27 = objc_getProperty(v5, v78, 336LL, 1);
            id Error = (id)NEIKEv2CreateErrorCrypto( @"Failed to generate Child SA SPI (connect)",  v79,  v80,  v81,  v82,  v83,  v84,  v85,  v156);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, Error);
            goto LABEL_82;
          }
        }

        if ((-[NEIKEv2IKESA generateInitialValues](v8, v45) & 1) == 0)
        {
          ne_log_obj();
          uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v5;
            _os_log_error_impl( &dword_1876B1000,  v68,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate local crypto values (connect)",  (uint8_t *)&buf,  0xCu);
          }

          id v27 = objc_getProperty(v5, v69, 336LL, 1);
          id Error = (id)NEIKEv2CreateErrorCrypto( @"Failed to generate local crypto values (connect)",  v70,  v71,  v72,  v73,  v74,  v75,  v76,  v156);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, Error);
          goto LABEL_82;
        }

        id v50 = objc_getProperty(v8, v49, 88LL, 1);
        [v50 localCertificateReference];
        __int128 v51 = (void *)objc_claimAutoreleasedReturnValue();

        id v53 = objc_getProperty(v8, v52, 88LL, 1);
        [v53 localCertificateKeyReference];
        id v163 = (void *)objc_claimAutoreleasedReturnValue();

        id v55 = objc_getProperty(v8, v54, 88LL, 1);
        int v162 = [v55 localCertificateIsModernSystem];

        ne_log_obj();
        id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v51;
          _os_log_debug_impl( &dword_1876B1000,  v56,  OS_LOG_TYPE_DEBUG,  "fetchLocalCertificateIdentity: certIdentityPersistentData %@",  (uint8_t *)&buf,  0xCu);
        }

        if (v51)
        {
LABEL_38:
          CFDataRef v58 = +[NSData sensitiveDataWithData:](MEMORY[0x189603F48], v51);
          CFDataRef v59 = +[NSData sensitiveDataWithData:](MEMORY[0x189603F48], v163);
          id v60 = (__SecIdentity *)+[NEIKEv2Crypto copySecIdentity:keyData:isModernSystem:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v58,  v59,  v162);
          __int16 v61 = v60;
          if (v60)
          {
            certificateRef[0] = 0LL;
            OSStatus v62 = SecIdentityCopyCertificate(v60, certificateRef);
            CFRelease(v61);
            if (!v62 && certificateRef[0])
            {
              int IsValid = NECertificateDateIsValid((uint64_t)certificateRef[0]);
              if (certificateRef[0])
              {
                CFRelease(certificateRef[0]);
                certificateRef[0] = 0LL;
              }

              if (IsValid != 1)
              {
                if (IsValid == 3)
                {
                  ne_log_obj();
                  uint64_t v151 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
                  {
                    LOWORD(buf) = 0;
                    _os_log_error_impl( &dword_1876B1000,  v151,  OS_LOG_TYPE_ERROR,  "local certificate is expired",  (uint8_t *)&buf,  2u);
                  }

                  int v152 = (void *)NEIKEv2CreateError(12LL);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 3uLL, v152);
                }

                else if (IsValid == 2)
                {
                  ne_log_obj();
                  uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                  {
                    LOWORD(buf) = 0;
                    _os_log_error_impl( &dword_1876B1000,  v65,  OS_LOG_TYPE_ERROR,  "local certificate is not yet valid",  (uint8_t *)&buf,  2u);
                  }

                  __int128 v66 = (void *)NEIKEv2CreateError(11LL);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 3uLL, v66);
                }

                else
                {
                  ne_log_obj();
                  uint64_t v153 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v155 = off_18A08FF38[IsValid - 1];
                    LODWORD(buf) = 136315138;
                    *(void *)((char *)&buf + 4) = v155;
                    _os_log_error_impl( &dword_1876B1000,  v153,  OS_LOG_TYPE_ERROR,  "local certificate status %s",  (uint8_t *)&buf,  0xCu);
                  }

                  uint64_t v154 = (void *)NEIKEv2CreateError(13LL);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 3uLL, v154);
                }

- (os_log_s)initWithIKEConfig:(void *)a3 firstChildConfig:(void *)a4 sessionConfig:(void *)a5 queue:(id *)a6 ipsecInterface:(void *)a7 ikeSocketHandler:(void *)a8 saSession:(char)a9 shouldOwnSASession:(void *)a10 packetDelegate:(void *)a11 transport:(void *)a12 configurationDelegate:
{
  uint64_t v106 = *MEMORY[0x1895F89C0];
  id v18 = a2;
  id v93 = a3;
  id v94 = a4;
  id v19 = a5;
  id newValue = a7;
  id v20 = a8;
  id v21 = a10;
  id v95 = a11;
  id v22 = a12;
  id v92 = v20;
  int v97 = v18;
  if (a1)
  {
    if (v20)
    {
      v103.receiver = a1;
      v103.super_class = (Class)&OBJC_CLASS___NEIKEv2Session;
      int v23 = -[os_log_s init](&v103, sel_init);
      uint64_t v25 = (uint64_t)v23;
      if (v23)
      {
        void v23[4] = -1;
        void v23[5] = -1;
        v23[6] = -1;
        do
          unint64_t v26 = __ldxr(&sNEIKEv2SessionIndex);
        while (__stxr(v26 + 1, &sNEIKEv2SessionIndex));
        *((void *)v23 + 39) = v26;
        objc_setProperty_atomic_copy(v23, v24, newValue, 160LL);
        if (v22) {
          objc_storeWeak((id *)(v25 + 344), v22);
        }
        uint64_t v27 = v25;
        if (v21)
        {
          objc_storeWeak((id *)(v25 + 352), v21);
          uint64_t v27 = v25;
        }

        if (a6)
        {
          if (a6[32] == (id)2)
          {
            CFTypeRef v28 = CFRetain(a6);
            uint64_t v27 = v25;
            *(void *)(v25 + 328) = v28;
          }

          else
          {
            ne_log_obj();
            unint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              __int128 v87 = (const char *)a6[32];
              *(_DWORD *)__int128 buf = 134217984;
              uint64_t v105 = v87;
              _os_log_fault_impl( &dword_1876B1000,  v29,  OS_LOG_TYPE_FAULT,  "Passed in virtual interface of bad type %lld",  buf,  0xCu);
            }

            uint64_t v27 = v25;
          }
        }

        objc_storeStrong((id *)(v27 + 384), a2);
        objc_setProperty_atomic((id)v25, v30, v19, 368LL);
        objc_initWeak(&location, (id)v25);
        ptrdiff_t v31 = objc_alloc(&OBJC_CLASS___NEIKEv2IKESA);
        id v33 = objc_getProperty((id)v25, v32, 160LL, 1);
        uint64_t v34 = MEMORY[0x1895F87A8];
        if (v33)
        {
          v100[0] = MEMORY[0x1895F87A8];
          v100[1] = 3221225472LL;
          v100[2] = __181__NEIKEv2Session_initWithIKEConfig_firstChildConfig_sessionConfig_queue_ipsecInterface_ikeSocketHandler_saSession_shouldOwnSASession_packetDelegate_transport_configurationDelegate___block_invoke;
          v100[3] = &unk_18A08D7A8;
          a6 = &v101;
          objc_copyWeak(&v101, &location);
          SEL v35 = v100;
        }

        else
        {
          SEL v35 = 0LL;
        }

        id v36 = -[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]( v31,  v97,  v94,  v19,  v95,  (void *)v25,  v35,  v21,  v22,  *(void *)(v25 + 312));
        objc_setProperty_atomic((id)v25, v37, v36, 336LL);

        if (!objc_getProperty((id)v25, v38, 336LL, 1))
        {
          ne_log_obj();
          uint64_t v85 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138412290;
            uint64_t v105 = (const char *)v25;
            _os_log_error_impl(&dword_1876B1000, v85, OS_LOG_TYPE_ERROR, "%@ failed to create IKE SA", buf, 0xCu);
          }

          a1 = 0LL;
          goto LABEL_68;
        }

        uint64_t v40 = (id *)objc_getProperty((id)v25, v39, 336LL, 1);
        id v42 = -[NEIKEv2IKESA copyTransport](v40, v41);
        v98[0] = v34;
        v98[1] = 3221225472LL;
        v98[2] = __181__NEIKEv2Session_initWithIKEConfig_firstChildConfig_sessionConfig_queue_ipsecInterface_ikeSocketHandler_saSession_shouldOwnSASession_packetDelegate_transport_configurationDelegate___block_invoke_31;
        v98[3] = &unk_18A090390;
        SEL v43 = (os_log_s *)(id)v25;
        uint64_t v99 = v43;
        -[NEIKEv2Transport waitForTransport:]((uint64_t)v42, v98);

        int v44 = [v97 serverMode];
        *((_BYTE *)v43 + 8) = v44;
        if (v44) {
          objc_setProperty_atomic(v43, v45, v93, 168LL);
        }
        id v46 = objc_alloc_init(MEMORY[0x189603FA8]);
        objc_setProperty_atomic(v43, v47, v46, 288LL);

        if (objc_getProperty(v43, v48, 288LL, 1))
        {
          if (v93
            && (-[NEIKEv2Session addFirstChild:](v43, v93),
                -[NEIKEv2Session firstChildSA](v43, v49),
                id v50 = (void *)objc_claimAutoreleasedReturnValue(),
                BOOL v51 = v50 == 0LL,
                v50,
                v51))
          {
            ne_log_obj();
            id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)__int128 buf = 136315138;
              uint64_t v105 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHan"
                     "dler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
              _os_log_fault_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_FAULT,  "%s called with null self.firstChildSA",  buf,  0xCu);
            }
          }

          else
          {
            id v52 = objc_alloc_init(MEMORY[0x189603FC8]);
            objc_setProperty_atomic(v43, v53, v52, 184LL);

            if (objc_getProperty(v43, v54, 184LL, 1))
            {
              id v55 = objc_alloc_init(MEMORY[0x189603FC8]);
              objc_setProperty_atomic(v43, v56, v55, 192LL);

              if (objc_getProperty(v43, v57, 192LL, 1))
              {
                id v58 = objc_alloc_init(MEMORY[0x189603FC8]);
                objc_setProperty_atomic(v43, v59, v58, 216LL);

                if (objc_getProperty(v43, v60, 216LL, 1))
                {
                  id v61 = objc_alloc_init(MEMORY[0x189603FC8]);
                  objc_setProperty_atomic(v43, v62, v61, 224LL);

                  if (objc_getProperty(v43, v63, 224LL, 1))
                  {
                    id v64 = objc_alloc_init(MEMORY[0x189603FC8]);
                    objc_setProperty_atomic(v43, v65, v64, 232LL);

                    if (objc_getProperty(v43, v66, 232LL, 1))
                    {
                      id v67 = objc_alloc_init(MEMORY[0x189603FC8]);
                      objc_setProperty_atomic(v43, v68, v67, 240LL);

                      if (objc_getProperty(v43, v69, 240LL, 1))
                      {
                        id v70 = objc_alloc_init(MEMORY[0x189603FC8]);
                        objc_setProperty_atomic(v43, v71, v70, 248LL);

                        if (objc_getProperty(v43, v72, 248LL, 1))
                        {
                          id v73 = objc_alloc_init(MEMORY[0x189603FC8]);
                          objc_setProperty_atomic(v43, v74, v73, 256LL);

                          if (objc_getProperty(v43, v75, 256LL, 1))
                          {
                            *((_BYTE *)v43 + 9) = a9;
                            objc_setProperty_atomic(v43, v76, v92, 176LL);
                            id v78 = objc_getProperty(v43, v77, 176LL, 1);
                            [v78 setDelegate:v43];

                            id v80 = objc_getProperty(v43, v79, 368LL, 1);
                            id v82 = objc_getProperty(v43, v81, 176LL, 1);
                            [v82 setDelegateQueue:v80];

                            uint64_t v83 = objc_alloc_init(&OBJC_CLASS___NEIKEv2RTT);
                            objc_setProperty_atomic(v43, v84, v83, 360LL);

                            a1 = v43;
LABEL_67:
                            uint64_t v85 = v99;
LABEL_68:

                            if (v33) {
                              objc_destroyWeak(a6);
                            }
                            objc_destroyWeak(&location);
                            goto LABEL_71;
                          }

                          ne_log_obj();
                          id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)__int128 buf = 136315138;
                            uint64_t v105 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterfac"
                                   "e:ikeSocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                            _os_log_fault_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_FAULT,  "%s called with null self.replyFragmentMaps",  buf,  0xCu);
                          }
                        }

                        else
                        {
                          ne_log_obj();
                          id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)__int128 buf = 136315138;
                            uint64_t v105 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterfac"
                                   "e:ikeSocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                            _os_log_fault_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_FAULT,  "%s called with null self.requestFragmentMaps",  buf,  0xCu);
                          }
                        }
                      }

                      else
                      {
                        ne_log_obj();
                        id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                        {
                          *(_DWORD *)__int128 buf = 136315138;
                          uint64_t v105 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:"
                                 "ikeSocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                          _os_log_fault_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_FAULT,  "%s called with null self.receivedReplies",  buf,  0xCu);
                        }
                      }
                    }

                    else
                    {
                      ne_log_obj();
                      id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)__int128 buf = 136315138;
                        uint64_t v105 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ik"
                               "eSocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                        _os_log_fault_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_FAULT,  "%s called with null self.receivedRequests",  buf,  0xCu);
                      }
                    }
                  }

                  else
                  {
                    ne_log_obj();
                    id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)__int128 buf = 136315138;
                      uint64_t v105 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeS"
                             "ocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                      _os_log_fault_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_FAULT,  "%s called with null self.sentReplies",  buf,  0xCu);
                    }
                  }
                }

                else
                {
                  ne_log_obj();
                  id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)__int128 buf = 136315138;
                    uint64_t v105 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSoc"
                           "ketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                    _os_log_fault_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_FAULT,  "%s called with null self.sentRequests",  buf,  0xCu);
                  }
                }
              }

              else
              {
                ne_log_obj();
                id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)__int128 buf = 136315138;
                  uint64_t v105 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocke"
                         "tHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                  _os_log_fault_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_FAULT,  "%s called with null self.databaseSAs",  buf,  0xCu);
                }
              }
            }

            else
            {
              ne_log_obj();
              id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)__int128 buf = 136315138;
                uint64_t v105 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketH"
                       "andler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                _os_log_fault_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_FAULT,  "%s called with null self.databaseLarvalSAs",  buf,  0xCu);
              }
            }
          }
        }

        else
        {
          ne_log_obj();
          id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)__int128 buf = 136315138;
            uint64_t v105 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandl"
                   "er:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
            _os_log_fault_impl(&dword_1876B1000, v86, OS_LOG_TYPE_FAULT, "%s called with null self.childSAs", buf, 0xCu);
          }
        }

        a1 = 0LL;
        goto LABEL_67;
      }

      uint64_t v25 = ne_log_obj();
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_fault_impl(&dword_1876B1000, (os_log_t)v25, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
      }
    }

    else
    {
      uint64_t v25 = (uint64_t)a1;
      ne_log_obj();
      uint64_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v105 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:s"
               "aSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
        _os_log_fault_impl(&dword_1876B1000, v89, OS_LOG_TYPE_FAULT, "%s called with null saSession", buf, 0xCu);
      }
    }

    a1 = 0LL;
LABEL_71:
  }

  return a1;
}

void __181__NEIKEv2Session_initWithIKEConfig_firstChildConfig_sessionConfig_queue_ipsecInterface_ikeSocketHandler_saSession_shouldOwnSASession_packetDelegate_transport_configurationDelegate___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  int *a5)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained && (WeakRetained[12] & 1) == 0 && objc_getProperty(WeakRetained, v10, 160LL, 1))
  {
    id Property = objc_getProperty(v11, v12, 160LL, 1);
    id v14 = Property;
    int v15 = (*((uint64_t (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))Property + 2))( v14,  [v11 clientCallbackInfo],  a2,  a3,  a4);

    *a5 = v15;
    ne_log_obj();
    BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v17 = *a5;
      int v18 = 136315394;
      id v19 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSe"
            "ssion:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_debug_impl(&dword_1876B1000, v16, OS_LOG_TYPE_DEBUG, "%s: Get socket %d\n", (uint8_t *)&v18, 0x12u);
    }
  }
}

void __181__NEIKEv2Session_initWithIKEConfig_firstChildConfig_sessionConfig_queue_ipsecInterface_ikeSocketHandler_saSession_shouldOwnSASession_packetDelegate_transport_configurationDelegate___block_invoke_31( uint64_t a1,  const char *a2)
{
}

- (void)addFirstChild:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    -[NEIKEv2Session firstChildSA](a1, v3);
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      ne_log_obj();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        BOOL v16 = (const char *)a1;
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "%@ Already have a first child SA, ignoring request",  (uint8_t *)&v15,  0xCu);
      }
    }

    else
    {
      SEL v7 = objc_alloc(&OBJC_CLASS___NEIKEv2ChildSA);
      objc_opt_self();
      do
        unsigned int v9 = __ldxr((unsigned int *)&getNewChildSAID_nextChildSAID);
      while (__stxr(v9 + 1, (unsigned int *)&getNewChildSAID_nextChildSAID));
      int v10 = v9;
      if (!v9)
      {
        do
          int v10 = __ldxr((unsigned int *)&getNewChildSAID_nextChildSAID);
        while (__stxr(v10 + 1, (unsigned int *)&getNewChildSAID_nextChildSAID));
      }

      id Property = objc_getProperty(a1, v8, 336LL, 1);
      char v12 = (os_log_s *)-[NEIKEv2ChildSA initWithConfiguration:childID:ikeSA:](v7, v4, v10, Property);
      if (v12)
      {
        id v6 = v12;
        objc_msgSend(objc_getProperty(a1, v13, 288, 1), "addObject:", v12);
      }

      else
      {
        ne_log_obj();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          int v15 = 136315138;
          BOOL v16 = "-[NEIKEv2Session addFirstChild:]";
          _os_log_fault_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_FAULT,  "%s called with null firstChildSA",  (uint8_t *)&v15,  0xCu);
        }

        id v6 = 0LL;
      }
    }
  }
}

- (os_log_s)initWithIKEConfig:(os_log_s *)a1 configurationDelegate:(void *)a2 queue:(void *)a3 saSession:(void *)a4 shouldCopySASession:(void *)a5 transport:(void *)a6 packetDelegate:(void *)a7
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!a1)
  {
    __int16 v20 = 0LL;
    goto LABEL_7;
  }

  if (!v13)
  {
    ne_log_obj();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v25 = "-[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:saSession:shouldCopySASession:transport:packetDelegate:]";
      int v23 = "%s called with null ikeConfig";
      goto LABEL_15;
    }

- (os_log_s)initWithIKEConfig:(void *)a3 configurationDelegate:(void *)a4 queue:(void *)a5 kernelSASessionName:(void *)a6 transport:(void *)a7 packetDelegate:
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!a1)
  {
    __int16 v20 = 0LL;
    goto LABEL_7;
  }

  if (!v13)
  {
    ne_log_obj();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v25 = "-[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:kernelSASessionName:transport:packetDelegate:]";
      int v23 = "%s called with null ikeConfig";
      goto LABEL_15;
    }

- (void)removeFirstChild
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    -[NEIKEv2Session firstChildSA]((void *)a1, a2);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[NEIKEv2Session resetChild:]((char *)a1, v3);
      objc_msgSend(objc_getProperty((id)a1, v4, 288, 1), "removeObject:", v3);
      if ((*(_BYTE *)(a1 + 10) & 1) != 0)
      {
        unint64_t v5 = *(const void **)(a1 + 328);
        if (v5)
        {
          CFRelease(v5);
          *(void *)(a1 + 328) = 0LL;
        }

        *(_BYTE *)(a1 + 10) = 0;
      }
    }

    else
    {
      ne_log_obj();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 138412290;
        uint64_t v8 = a1;
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "%@ No first child SA, ignoring request",  (uint8_t *)&v7,  0xCu);
      }
    }
  }

- (void)resetChild:(char *)a1
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    ne_log_obj();
    SEL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412546;
        unint64_t v29 = a1;
        __int16 v30 = 2112;
        id v31 = v3;
        _os_log_impl(&dword_1876B1000, v5, OS_LOG_TYPE_INFO, "%@ reset child SA %@", (uint8_t *)&v28, 0x16u);
      }

      id v6 = v3;
      ne_log_obj();
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id Property = objc_getProperty(a1, v8, 176LL, 1);
        int v28 = 138412802;
        unint64_t v29 = a1;
        __int16 v30 = 2112;
        id v31 = Property;
        __int16 v32 = 2112;
        id v33 = v6;
        _os_log_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ %@ Uninstalling child SA %@",  (uint8_t *)&v28,  0x20u);
      }

      id v11 = objc_getProperty(a1, v10, 192LL, 1);
      id v12 = -[NEIKEv2Session copySAFromDictionary:forChild:](v11, v6);
      if (v12)
      {
        id v14 = v12;
        do
        {
          objc_msgSend(objc_getProperty(a1, v13, 176, 1), "removeSA:", v14);
          objc_msgSend(objc_getProperty(a1, v15, 192, 1), "setObject:forKeyedSubscript:", 0, v14);
          id v17 = objc_getProperty(a1, v16, 192LL, 1);
          id v18 = -[NEIKEv2Session copySAFromDictionary:forChild:](v17, v6);

          id v14 = v18;
        }

        while (v18);
      }

      id v19 = objc_getProperty(a1, v13, 184LL, 1);
      id v20 = -[NEIKEv2Session copySAFromDictionary:forChild:](v19, v6);
      if (v20)
      {
        uint64_t v22 = v20;
        do
        {
          objc_msgSend(objc_getProperty(a1, v21, 176, 1), "removeSA:", v22);
          objc_msgSend(objc_getProperty(a1, v23, 184, 1), "setObject:forKeyedSubscript:", 0, v22);
          id v25 = objc_getProperty(a1, v24, 192LL, 1);
          id v26 = -[NEIKEv2Session copySAFromDictionary:forChild:](v25, v6);

          uint64_t v22 = v26;
        }

        while (v26);
      }

      -[NEIKEv2ChildSA reset](v6, v27);
    }

    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        int v28 = 136315138;
        unint64_t v29 = "-[NEIKEv2Session resetChild:]";
        _os_log_fault_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_FAULT,  "%s called with null childSA",  (uint8_t *)&v28,  0xCu);
      }
    }
  }
}

- (id)copySAFromDictionary:(void *)a1 forChild:(void *)a2
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v9, (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)startIKELifetimeTimer
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (objc_getProperty(a1, a2, 336LL, 1))
  {
    if (objc_getProperty(a1, v3, 264LL, 1))
    {
      id Property = (dispatch_source_s *)objc_getProperty(a1, v4, 264LL, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(a1, v6, 0LL, 264LL);
    }

    id v7 = objc_getProperty(a1, v4, 336LL, 1);
    if (v7) {
      id v7 = objc_getProperty(v7, v8, 96LL, 1);
    }
    id v9 = v7;

    if (v9)
    {
      id v11 = objc_getProperty(a1, v10, 336LL, 1);
      if (v11) {
        id v11 = objc_getProperty(v11, v12, 96LL, 1);
      }
      __int128 v13 = (char *)v11;
      __int128 v15 = objc_getProperty(a1, v14, 336LL, 1);
      if (v15) {
        int v16 = v15[9] & 1;
      }
      else {
        int v16 = 0;
      }
      uint64_t v17 = -[NEIKEv2IKESAProposal softLifetimeSecondsForInitiator:](v13, v16);

      if (v17)
      {
        id v19 = (dispatch_queue_s *)objc_getProperty(a1, v18, 368LL, 1);
        dispatch_source_t v20 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v19);
        objc_setProperty_atomic(a1, v21, v20, 264LL);

        BOOL v23 = objc_getProperty(a1, v22, 264LL, 1) == 0LL;
        ne_log_obj();
        SEL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v25 = v24;
        if (v23)
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_fault_impl(&dword_1876B1000, v25, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
          }
        }

        else
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 138412546;
            SEL v38 = (const char *)a1;
            __int16 v39 = 2048;
            uint64_t v40 = v17;
            _os_log_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_INFO,  "%@: Setting IKE soft lifetime timer for %llu seconds",  buf,  0x16u);
          }

          uint64_t v27 = (dispatch_source_s *)objc_getProperty(a1, v26, 264LL, 1);
          dispatch_time_t v28 = dispatch_time(0x8000000000000000LL, 1000000000LL * (void)v17);
          dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0LL);

          objc_initWeak((id *)buf, a1);
          id v30 = objc_getProperty(a1, v29, 264LL, 1);
          handler[0] = MEMORY[0x1895F87A8];
          handler[1] = 3221225472LL;
          handler[2] = __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke;
          handler[3] = &unk_18A08FAC8;
          id v31 = (dispatch_source_s *)v30;
          objc_copyWeak(&v36, (id *)buf);
          dispatch_source_set_event_handler(v31, handler);

          id v33 = (dispatch_object_s *)objc_getProperty(a1, v32, 264LL, 1);
          dispatch_activate(v33);
          objc_destroyWeak(&v36);
          objc_destroyWeak((id *)buf);
        }
      }
    }
  }

  else
  {
    ne_log_obj();
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      SEL v38 = "-[NEIKEv2Session startIKELifetimeTimer]";
      _os_log_fault_impl(&dword_1876B1000, v34, OS_LOG_TYPE_FAULT, "%s called with null self.ikeSA", buf, 0xCu);
    }
  }

void __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained && (WeakRetained[11] & 1) == 0)
  {
    [WeakRetained forceRekeyIKE];
    id Property = objc_getProperty(v3, v4, 336LL, 1);
    if (Property)
    {
      id v8 = objc_getProperty(Property, v6, 96LL, 1);
      if (v8)
      {
        id v9 = objc_getProperty(v3, v7, 336LL, 1);
        if (v9) {
          int v10 = v9[9] & 1;
        }
        else {
          int v10 = 0;
        }
        uint64_t v11 = [v8 lifetimeSeconds];
        __int128 v12 = -[NEIKEv2IKESAProposal softLifetimeSecondsForInitiator:]((char *)v8, v10);
        if (objc_getProperty(v3, v13, 264LL, 1))
        {
          __int128 v15 = (dispatch_source_s *)objc_getProperty(v3, v14, 264LL, 1);
          dispatch_source_cancel(v15);
          objc_setProperty_atomic(v3, v16, 0LL, 264LL);
        }

        uint64_t v17 = (dispatch_queue_s *)objc_getProperty(v3, v14, 368LL, 1);
        dispatch_source_t v18 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v17);
        objc_setProperty_atomic(v3, v19, v18, 264LL);

        BOOL v21 = objc_getProperty(v3, v20, 264LL, 1) == 0LL;
        ne_log_obj();
        SEL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        BOOL v23 = v22;
        if (v21)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_fault_impl(&dword_1876B1000, v23, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
          }
        }

        else
        {
          uint64_t v24 = v11 - (void)v12;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 138412546;
            id v36 = v3;
            __int16 v37 = 2048;
            uint64_t v38 = v24;
            _os_log_impl( &dword_1876B1000,  v23,  OS_LOG_TYPE_INFO,  "%@: Setting IKE hard lifetime timer for %llu seconds",  buf,  0x16u);
          }

          SEL v26 = (dispatch_source_s *)objc_getProperty(v3, v25, 264LL, 1);
          dispatch_time_t v27 = dispatch_time(0x8000000000000000LL, 1000000000 * v24);
          dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0LL);

          id v29 = objc_getProperty(v3, v28, 264LL, 1);
          handler[0] = MEMORY[0x1895F87A8];
          handler[1] = 3221225472LL;
          handler[2] = __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke_54;
          handler[3] = &unk_18A08FAC8;
          id v30 = (dispatch_source_s *)v29;
          objc_copyWeak(&v34, v1);
          dispatch_source_set_event_handler(v30, handler);

          SEL v32 = (dispatch_object_s *)objc_getProperty(v3, v31, 264LL, 1);
          dispatch_activate(v32);
          objc_destroyWeak(&v34);
        }
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }
}

void __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke_54(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained && (WeakRetained[11] & 1) == 0)
  {
    SEL v4 = objc_alloc(&OBJC_CLASS___NEIKEv2DeleteIKEContext);
    id v6 = objc_getProperty(v3, v5, 368LL, 1);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke_2;
    v9[3] = &unk_18A08D7D0;
    objc_copyWeak(&v10, v1);
    id v7 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]( (id *)&v4->super.super.isa,  1,  v6,  v9);

    -[NEIKEv2Session abort](v3, v8);
    -[NEIKEv2Session enqueuePendingRequestContext:](v3, v7);

    objc_destroyWeak(&v10);
  }
}

void __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    self = WeakRetained;
    id Property = objc_getProperty(WeakRetained, WeakRetained, 336LL, 1);
    uint64_t v2 = self;
    if (Property)
    {
      if (Property[6] == 2LL)
      {
        -[NEIKEv2Session resetAll]((uint64_t)self, self);
        id v5 = objc_getProperty(self, v4, 336LL, 1);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, 0LL);
        -[NEIKEv2Session reportState](self, v6);
        uint64_t v2 = self;
      }
    }
  }
}

- (void)setIKESA:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v5 = v3;
  if (a1)
  {
    if (v3)
    {
      if ((*(_BYTE *)(a1 + 11) & 1) == 0)
      {
        -[NEIKEv2Session resetMessages]((_DWORD *)a1, v4);
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v7 = objc_getProperty((id)a1, v6, 288LL, 1);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v19;
          do
          {
            for (uint64_t i = 0LL; i != v9; ++i)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              if (v12) {
                objc_storeWeak((id *)(v12 + 24), v5);
              }
            }

            uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }

          while (v9);
        }

        objc_setProperty_atomic((id)a1, v13, v5, 336LL);
        -[NEIKEv2Session startIKELifetimeTimer]((void *)a1, v14);
        -[NEIKEv2Session invalidateDPDTimer]((void *)a1, v15);
        -[NEIKEv2Session startDPDTimer]((void *)a1, v16);
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v24 = "-[NEIKEv2Session setIKESA:]";
        _os_log_fault_impl(&dword_1876B1000, v17, OS_LOG_TYPE_FAULT, "%s called with null newIKESA", buf, 0xCu);
      }
    }
  }
}

- (_DWORD)copyChildWithID:(void *)a1
{
  int v2 = (int)a2;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = objc_getProperty(a1, a2, 288LL, 1);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(_DWORD **)(*((void *)&v13 + 1) + 8 * v7);
        if (v8) {
          int v9 = v8[4];
        }
        else {
          int v9 = 0;
        }
        if (v9 == v2)
        {
          uint64_t v11 = v8;
          goto LABEL_15;
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v10 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v5 = v10;
    }

    while (v10);
  }

  uint64_t v11 = 0LL;
LABEL_15:

  return v11;
}

- (_OWORD)addEmptyInterface
{
  int v2 = *(const void **)(a1 + 328);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 328) = 0LL;
  }

  CFTypeRef result = NEVirtualInterfaceCreateNexusExtendedWithOptions( (const __CFAllocator *)*MEMORY[0x189604DB0],  2LL,  0LL,  0LL,  0,  0,  0,  0,  0,  0,  0,  0LL,  0LL);
  *(void *)(a1 + 328) = result;
  *(_BYTE *)(a1 + 10) = 1;
  return result;
}

- (__CFString)interfaceName
{
  uint64_t v1 = *(void *)(a1 + 328);
  if (!v1)
  {
LABEL_6:
    int v2 = 0LL;
    return v2;
  }

  int v2 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], (const char *)(v1 + 265), 0x600u);
  if (!v2)
  {
    ne_log_obj();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_fault_impl(&dword_1876B1000, v3, OS_LOG_TYPE_FAULT, "NEVirtualInterfaceCopyName failed", v5, 2u);
    }

    goto LABEL_6;
  }

  return v2;
}

- (uint64_t)interfaceIndex
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 328);
    if (v2)
    {
      CFTypeRef result = *(unsigned int *)(v2 + 292);
      if ((_DWORD)result) {
        return result;
      }
      ne_log_obj();
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        -[NEIKEv2Session interfaceName](v1);
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
        int v5 = 138412290;
        uint64_t v6 = v4;
        _os_log_fault_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_FAULT,  "NEVirtualInterfaceGetIndex (interfaceName=%@) failed",  (uint8_t *)&v5,  0xCu);
      }
    }

    return 0LL;
  }

  return result;
}

- (uint64_t)copyIPsecInterfaceWithMissingAllowed:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 328);
  if (v3)
  {
    uint64_t v4 = (os_log_s *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], (const char *)(v3 + 265), 0x600u);
    unsigned int Index = NEVirtualInterfaceGetIndex(*(void *)(a1 + 328));
    unsigned int v6 = Index;
    if (v4) {
      BOOL v7 = Index == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (!Index)
      {
        if (v4)
        {
          uint64_t v15 = [objc_alloc(MEMORY[0x189608E00]) initWithInterfaceName:v4];
          ne_log_obj();
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          int v9 = v17;
          if (v15)
          {
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_36;
            }
            int v22 = 138412546;
            *(void *)BOOL v23 = a1;
            *(_WORD *)&v23[8] = 2112;
            *(void *)&v23[10] = v4;
            uint64_t v10 = "Created interface for %@ from name %@";
            uint64_t v11 = v9;
            uint32_t v12 = 22;
            goto LABEL_17;
          }

          if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          int v22 = 138412290;
          *(void *)BOOL v23 = v4;
          uint64_t v18 = "[NWInterface initWithInterfaceName:%@] failed";
        }

        else
        {
          ne_log_obj();
          int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          int v22 = 138412290;
          *(void *)BOOL v23 = a1;
          uint64_t v18 = "%@ has ipsecInterface without index or name";
        }

        __int128 v19 = v9;
        uint32_t v20 = 12;
        goto LABEL_34;
      }

      uint64_t v15 = [objc_alloc(MEMORY[0x189608E00]) initWithInterfaceIndex:Index];
      ne_log_obj();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      int v9 = v8;
      if (v15)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          int v22 = 138412546;
          *(void *)BOOL v23 = a1;
          *(_WORD *)&v23[8] = 1024;
          *(_DWORD *)&v23[10] = v6;
          uint64_t v10 = "Created interface for %@ from index %u";
          uint64_t v11 = v9;
          uint32_t v12 = 18;
LABEL_17:
          _os_log_debug_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v22, v12);
        }

- (uint64_t)generateSPIForChild:(void *)a3 proposals:
{
  uint64_t v86 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v7 = a3;
  if (!v7)
  {
    ne_log_obj();
    id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
      goto LABEL_44;
    }
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
    BOOL v51 = "%s called with null proposals";
    goto LABEL_71;
  }

  if (!objc_getProperty(a1, v6, 336LL, 1))
  {
    ne_log_obj();
    id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
    {
LABEL_44:

LABEL_45:
      uint64_t v52 = 0LL;
      goto LABEL_69;
    }

    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
    BOOL v51 = "%s called with null self.ikeSA";
LABEL_71:
    _os_log_fault_impl(&dword_1876B1000, v50, OS_LOG_TYPE_FAULT, v51, buf, 0xCu);
    goto LABEL_44;
  }

  id Property = objc_getProperty(a1, v8, 336LL, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v10, 64LL, 1);
  }
  id v11 = Property;

  if (!v11)
  {
    ne_log_obj();
    id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
      goto LABEL_44;
    }
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
    BOOL v51 = "%s called with null self.ikeSA.localAddress";
    goto LABEL_71;
  }

  id v13 = objc_getProperty(a1, v12, 336LL, 1);
  if (v13) {
    id v13 = objc_getProperty(v13, v14, 72LL, 1);
  }
  id v15 = v13;

  ne_log_obj();
  __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
      _os_log_fault_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_FAULT,  "%s called with null self.ikeSA.remoteAddress",  buf,  0xCu);
    }

    goto LABEL_45;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412546;
    uint64_t v83 = (const char *)a1;
    __int16 v84 = 2112;
    id v85 = objc_getProperty(a1, v18, 176LL, 1);
    _os_log_impl(&dword_1876B1000, v17, OS_LOG_TYPE_INFO, "%@ %@ Generating SPI(s) for child", buf, 0x16u);
  }

  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id v69 = v7;
  id obj = v7;
  uint64_t v19 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (!v19)
  {
    __int128 v21 = 0LL;
    int v22 = 0LL;
    goto LABEL_53;
  }

  uint64_t v20 = v19;
  __int128 v21 = 0LL;
  int v22 = 0LL;
  uint64_t v23 = *(void *)v76;
  do
  {
    uint64_t v24 = 0LL;
    do
    {
      if (*(void *)v76 != v23) {
        objc_enumerationMutation(obj);
      }
      if ([*(id *)(*((void *)&v75 + 1) + 8 * v24) protocol] == 2)
      {
        if (v21) {
          goto LABEL_36;
        }
        id v25 = -[NEIPSecSA initInboundSA](objc_alloc(&OBJC_CLASS___NEIPSecSA), "initInboundSA");
        [v25 setProtocol:2];
        __int128 v21 = v25;
      }

      else
      {
        if (v22) {
          goto LABEL_36;
        }
        id v25 = -[NEIPSecSA initInboundSA](objc_alloc(&OBJC_CLASS___NEIPSecSA), "initInboundSA");
        [v25 setProtocol:1];
        int v22 = v25;
      }

      id v27 = v25;
      if (v5)
      {
        id v28 = v5;
        id v29 = objc_getProperty(v5, v26, 48LL, 1);
      }

      else
      {
        id v28 = 0LL;
        id v29 = 0LL;
      }

      id v30 = v29;
      uint64_t v31 = [v30 mode];

      if (v31 == 1) {
        uint64_t v32 = 1LL;
      }
      else {
        uint64_t v32 = 2LL;
      }
      [v27 setMode:v32];
      [v27 setLifetimeSeconds:120];
      id v34 = objc_getProperty(a1, v33, 336LL, 1);
      if (v34) {
        id v34 = objc_getProperty(v34, v35, 64LL, 1);
      }
      id v36 = v34;
      [v27 setLocalAddress:v36];

      id v38 = objc_getProperty(a1, v37, 336LL, 1);
      if (v38) {
        id v38 = objc_getProperty(v38, v39, 72LL, 1);
      }
      id v40 = v38;
      [v27 setRemoteAddress:v40];

      id v42 = objc_getProperty(a1, v41, 336LL, 1);
      if (v42) {
        id v42 = objc_getProperty(v42, v43, 304LL, 1);
      }
      id v44 = v42;
      [v27 setBoundInterfaceName:v44];

      if (!a1[41]) {
        -[NEIKEv2Session addEmptyInterface]((uint64_t)a1);
      }
      __int128 v45 = (void *)-[NEIKEv2Session copyIPsecInterfaceWithMissingAllowed:]((uint64_t)a1, 1);
      [v45 interfaceName];
      id v46 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 setTunnelInterfaceName:v46];

      if (!objc_msgSend(objc_getProperty(a1, v47, 176, 1), "addLarvalSA:", v27))
      {
        ne_log_obj();
        SEL v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v5 = v28;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          id v68 = objc_getProperty(a1, v54, 176LL, 1);
          *(_DWORD *)__int128 buf = 138412546;
          uint64_t v83 = (const char *)a1;
          __int16 v84 = 2112;
          id v85 = v68;
          _os_log_error_impl( &dword_1876B1000,  v53,  OS_LOG_TYPE_ERROR,  "%@ [%@ addLarvalSA:larvalSA] failed",  buf,  0x16u);
        }

        unsigned __int8 v79 = 0;
        goto LABEL_67;
      }

      id v5 = v28;
      objc_msgSend(objc_getProperty(a1, v48, 184, 1), "setObject:forKeyedSubscript:", v28, v27);

LABEL_36:
      ++v24;
    }

    while (v20 != v24);
    uint64_t v49 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
    uint64_t v20 = v49;
  }

  while (v49);
LABEL_53:

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id v55 = obj;
  uint64_t v56 = [v55 countByEnumeratingWithState:&v71 objects:v80 count:16];
  if (!v56) {
    goto LABEL_66;
  }
  uint64_t v57 = v56;
  uint64_t v58 = *(void *)v72;
  while (2)
  {
    uint64_t v59 = 0LL;
    while (2)
    {
      if (*(void *)v72 != v58) {
        objc_enumerationMutation(v55);
      }
      SEL v60 = *(void **)(*((void *)&v71 + 1) + 8 * v59);
      if ([v60 protocol] == 2)
      {
        id v61 = v21;
        if (!v21)
        {
          ne_log_obj();
          SEL v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)__int128 buf = 136315138;
            uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
            id v67 = "%s called with null ahLarvalSA";
            goto LABEL_77;
          }

          goto LABEL_75;
        }
      }

      else
      {
        id v61 = v22;
        if (!v22)
        {
          ne_log_obj();
          SEL v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)__int128 buf = 136315138;
            uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
            id v67 = "%s called with null espLarvalSA";
LABEL_77:
            _os_log_fault_impl(&dword_1876B1000, v65, OS_LOG_TYPE_FAULT, v67, buf, 0xCu);
          }

- (id)copySAFromDictionary:(void *)a1 forSPI:(void *)a2
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        int v10 = objc_msgSend(v9, "spi", (void)v12);
        if (v10 == [v4 value])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (uint64_t)installChildSA:(uint64_t)a1
{
  uint64_t v212 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (!a1)
  {
    uint64_t v55 = 0LL;
    goto LABEL_45;
  }

  if (!objc_getProperty((id)a1, v3, 336LL, 1))
  {
    ne_log_obj();
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_43;
    }
    int v206 = 136315138;
    id v207 = "-[NEIKEv2Session installChildSA:]";
    SEL v54 = "%s called with null self.ikeSA";
LABEL_42:
    _os_log_fault_impl(&dword_1876B1000, v22, OS_LOG_TYPE_FAULT, v54, (uint8_t *)&v206, 0xCu);
    goto LABEL_43;
  }

  if (!v4)
  {
    ne_log_obj();
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_43;
    }
    int v206 = 136315138;
    id v207 = "-[NEIKEv2Session installChildSA:]";
    SEL v54 = "%s called with null childSA";
    goto LABEL_42;
  }

  id Property = objc_getProperty((id)a1, v5, 336LL, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v7, 64LL, 1);
  }
  id v8 = Property;

  if (!v8)
  {
    ne_log_obj();
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_43;
    }
    int v206 = 136315138;
    id v207 = "-[NEIKEv2Session installChildSA:]";
    SEL v54 = "%s called with null self.ikeSA.localAddress";
    goto LABEL_42;
  }

  id v10 = objc_getProperty((id)a1, v9, 336LL, 1);
  if (v10) {
    id v10 = objc_getProperty(v10, v11, 72LL, 1);
  }
  id v12 = v10;

  if (!v12)
  {
    ne_log_obj();
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_43;
    }
    int v206 = 136315138;
    id v207 = "-[NEIKEv2Session installChildSA:]";
    SEL v54 = "%s called with null self.ikeSA.remoteAddress";
    goto LABEL_42;
  }

  id v14 = objc_getProperty(v4, v13, 56LL, 1);

  if (v14)
  {
    id v16 = objc_getProperty((id)a1, v15, 184LL, 1);
    id v18 = objc_getProperty(v4, v17, 56LL, 1);
    uint64_t v20 = v18;
    if (v18) {
      id v18 = objc_getProperty(v18, v19, 80LL, 1);
    }
    id v21 = v18;
    int v22 = (os_log_s *)-[NEIKEv2Session copySAFromDictionary:forSPI:](v16, v21);

    ne_log_obj();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = v23;
    if (!v22)
    {
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
LABEL_148:
        uint64_t v55 = 0LL;
LABEL_149:

        goto LABEL_44;
      }

      id v58 = objc_getProperty(v4, v57, 56LL, 1);
      SEL v60 = v58;
      if (v58) {
        id v58 = objc_getProperty(v58, v59, 80LL, 1);
      }
      id v61 = (char *)v58;
      int v206 = 138412802;
      id v207 = v61;
      __int16 v208 = 2112;
      id v209 = objc_getProperty((id)a1, v62, 184LL, 1);
      __int16 v210 = 2112;
      id v211 = objc_getProperty((id)a1, v63, 192LL, 1);
      _os_log_fault_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_FAULT,  "copySAFromDictionary incoming %@ databaseLarvalSAs %@ databaseSAs %@ failed",  (uint8_t *)&v206,  0x20u);
LABEL_141:

LABEL_147:
      goto LABEL_148;
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v206 = 138412802;
      id v207 = (const char *)a1;
      __int16 v208 = 2112;
      id v209 = objc_getProperty((id)a1, v25, 176LL, 1);
      __int16 v210 = 2112;
      id v211 = v4;
      _os_log_impl(&dword_1876B1000, v24, OS_LOG_TYPE_INFO, "%@ %@ Installing childSA %@", (uint8_t *)&v206, 0x20u);
    }

    SEL v26 = objc_alloc(&OBJC_CLASS___NEIPSecSA);
    id v28 = objc_getProperty(v4, v27, 56LL, 1);
    id v30 = v28;
    if (v28) {
      id v28 = objc_getProperty(v28, v29, 88LL, 1);
    }
    id v31 = v28;
    uint64_t v24 = -[NEIPSecSA initOutboundSAWithSPI:](v26, "initOutboundSAWithSPI:", [v31 value]);

    id v33 = objc_getProperty(v4, v32, 48LL, 1);
    uint64_t v34 = [v33 mode];

    if (v34 == 1) {
      uint64_t v35 = 1LL;
    }
    else {
      uint64_t v35 = 2LL;
    }
    -[os_log_s setMode:](v24, "setMode:", v35);
    id v37 = objc_getProperty(v4, v36, 56LL, 1);
    uint64_t v38 = [v37 protocol];

    if (v38 == 2) {
      uint64_t v39 = 2LL;
    }
    else {
      uint64_t v39 = 1LL;
    }
    -[os_log_s setProtocol:](v24, "setProtocol:", v39);
    id v41 = objc_getProperty((id)a1, v40, 336LL, 1);
    if (v41) {
      id v41 = objc_getProperty(v41, v42, 64LL, 1);
    }
    id v43 = v41;
    -[os_log_s setLocalAddress:](v24, "setLocalAddress:", v43);

    id v45 = objc_getProperty((id)a1, v44, 336LL, 1);
    if (v45) {
      id v45 = objc_getProperty(v45, v46, 72LL, 1);
    }
    id v47 = v45;
    -[os_log_s setRemoteAddress:](v24, "setRemoteAddress:", v47);

    id v49 = objc_getProperty(v4, v48, 56LL, 1);
    -[NEIKEv2ChildSAProposal encryptionProtocol](v49, v50);
    BOOL v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      uint64_t v52 = v51[2];

      if (v52 <= 19)
      {
        if (v52 == 2 || v52 == 3)
        {
LABEL_65:
          uint64_t v78 = 1LL;
          id v79 = objc_getProperty(v4, v53, 56LL, 1);
          -[os_log_s setLifetimeSeconds:](v22, "setLifetimeSeconds:", [v79 lifetimeSeconds]);

          id v81 = objc_getProperty(v4, v80, 56LL, 1);
          -[os_log_s setLifetimeSeconds:](v24, "setLifetimeSeconds:", [v81 lifetimeSeconds]);

          -[os_log_s setEncryptionAlgorithm:](v22, "setEncryptionAlgorithm:", v52);
          -[os_log_s setEncryptionAlgorithm:](v24, "setEncryptionAlgorithm:", v52);
          objc_getProperty(v4, v82, 144LL, 1);
          uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_log_s setEncryptionKey:](v22, "setEncryptionKey:", v83);

          objc_getProperty(v4, v84, 160LL, 1);
          id v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_log_s setEncryptionKey:](v24, "setEncryptionKey:", v85);

          id v87 = objc_getProperty(v4, v86, 48LL, 1);
          -[os_log_s setReplayWindowSize:](v22, "setReplayWindowSize:", [v87 replayWindowSize]);

          id v89 = objc_getProperty(v4, v88, 48LL, 1);
          -[os_log_s setReplayWindowSize:](v24, "setReplayWindowSize:", [v89 replayWindowSize]);

          -[os_log_s setSequencePerTrafficClass:](v22, "setSequencePerTrafficClass:", v4[10] & 1);
          -[os_log_s setSequencePerTrafficClass:](v24, "setSequencePerTrafficClass:", v4[10] & 1);
          id v91 = objc_getProperty(v4, v90, 56LL, 1);
          -[NEIKEv2ChildSAProposal integrityProtocol](v91, v92);
          id v93 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v94 = [v93 type];

          switch(v94)
          {
            case 0LL:
              id v96 = objc_getProperty(v4, v95, 56LL, 1);
              -[NEIKEv2ChildSAProposal encryptionProtocol](v96, v97);
              id v98 = (void *)objc_claimAutoreleasedReturnValue();
              if (v98 && (unint64_t v99 = v98[2], v99 < 0x20))
              {
                unsigned int v100 = 0xD01C0000 >> v99;

                if ((v100 & 1) != 0)
                {
                  uint64_t v78 = 0LL;
                  goto LABEL_76;
                }
              }

              else
              {
              }

              ne_log_obj();
              SEL v60 = (void *)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR)) {
                goto LABEL_147;
              }
              id v61 = (char *)objc_getProperty(v4, v198, 56LL, 1);
              -[NEIKEv2ChildSAProposal encryptionProtocol](v61, v199);
              objc_super v103 = (void *)objc_claimAutoreleasedReturnValue();
              int v206 = 138412546;
              id v207 = (const char *)a1;
              __int16 v208 = 2112;
              id v209 = v103;
              uint64_t v105 = "%@ No integrity type selected, but encryption %@ is not authenticated";
              uint64_t v106 = (os_log_s *)v60;
              uint32_t v107 = 22;
              goto LABEL_140;
            case 1LL:
              goto LABEL_76;
            case 2LL:
              uint64_t v78 = 2LL;
              goto LABEL_76;
            case 12LL:
              uint64_t v78 = 3LL;
              goto LABEL_76;
            case 13LL:
              uint64_t v78 = 4LL;
              goto LABEL_76;
            case 14LL:
              uint64_t v78 = 5LL;
LABEL_76:
              -[os_log_s setAuthenticationAlgorithm:](v22, "setAuthenticationAlgorithm:", v78);
              -[os_log_s setAuthenticationAlgorithm:](v24, "setAuthenticationAlgorithm:", v78);
              objc_getProperty(v4, v108, 152LL, 1);
              uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue();
              -[os_log_s setAuthenticationKey:](v22, "setAuthenticationKey:", v109);

              objc_getProperty(v4, v110, 168LL, 1);
              uint64_t v111 = (void *)objc_claimAutoreleasedReturnValue();
              -[os_log_s setAuthenticationKey:](v24, "setAuthenticationKey:", v111);

              id v113 = objc_getProperty((id)a1, v112, 336LL, 1);
              if (v113) {
                id v113 = objc_getProperty(v113, v114, 80LL, 1);
              }
              id v115 = v113;
              if (([v115 forceUDPEncapsulation] & 1) != 0
                || (SEL v117 = objc_getProperty((id)a1, v116, 336LL, 1)) != 0LL && (v117[14] & 1) != 0)
              {
              }

              else
              {
                id v119 = objc_getProperty((id)a1, v118, 336LL, 1);
                if (!v119) {
                  goto LABEL_103;
                }
                char v120 = v119[15];

                if ((v120 & 1) == 0) {
                  goto LABEL_104;
                }
              }

              id v122 = objc_getProperty((id)a1, v121, 336LL, 1);
              if (v122) {
                id v122 = objc_getProperty(v122, v123, 80LL, 1);
              }
              id v124 = v122;
              if ([v124 forceUDPEncapsulation])
              {
              }

              else
              {
                char v125 = [*(id *)(a1 + 384) disableSwitchToNATTPorts];

                if ((v125 & 1) != 0)
                {
                  ne_log_obj();
                  id v115 = (id)objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled((os_log_t)v115, OS_LOG_TYPE_INFO)) {
                    goto LABEL_103;
                  }
                  int v206 = 138412290;
                  id v207 = (const char *)a1;
                  uint64_t v126 = "%@ Not enabling NAT traversal (install) because disabled";
                  goto LABEL_102;
                }
              }

              -[os_log_s setNatTraversalEnabled:](v22, "setNatTraversalEnabled:", 1LL);
              -[os_log_s setNatTraversalEnabled:](v24, "setNatTraversalEnabled:", 1LL);
              id v128 = objc_getProperty((id)a1, v127, 336LL, 1);
              if (v128) {
                id v128 = objc_getProperty(v128, v129, 64LL, 1);
              }
              id v130 = v128;
              [v130 port];
              uint64_t v131 = (void *)objc_claimAutoreleasedReturnValue();
              -[os_log_s setNatTraversalPort:]( v22,  "setNatTraversalPort:",  (unsigned __int16)[v131 intValue]);

              id v133 = objc_getProperty((id)a1, v132, 336LL, 1);
              if (v133) {
                id v133 = objc_getProperty(v133, v134, 72LL, 1);
              }
              id v135 = v133;
              [v135 port];
              id v136 = (void *)objc_claimAutoreleasedReturnValue();
              -[os_log_s setNatTraversalSrcPort:]( v22,  "setNatTraversalSrcPort:",  (unsigned __int16)[v136 intValue]);

              id v138 = objc_getProperty((id)a1, v137, 336LL, 1);
              if (v138) {
                id v138 = objc_getProperty(v138, v139, 72LL, 1);
              }
              id v140 = v138;
              [v140 port];
              uint64_t v141 = (void *)objc_claimAutoreleasedReturnValue();
              -[os_log_s setNatTraversalPort:]( v24,  "setNatTraversalPort:",  (unsigned __int16)[v141 intValue]);

              id v143 = objc_getProperty((id)a1, v142, 336LL, 1);
              if (v143) {
                id v143 = objc_getProperty(v143, v144, 64LL, 1);
              }
              id v145 = v143;
              [v145 port];
              uint64_t v146 = (void *)objc_claimAutoreleasedReturnValue();
              -[os_log_s setNatTraversalSrcPort:]( v24,  "setNatTraversalSrcPort:",  (unsigned __int16)[v146 intValue]);

              ne_log_obj();
              id v115 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v115, OS_LOG_TYPE_INFO))
              {
                int v206 = 138412290;
                id v207 = (const char *)a1;
                uint64_t v126 = "%@ Enabling NAT traversal (install)";
LABEL_102:
                _os_log_impl(&dword_1876B1000, (os_log_t)v115, OS_LOG_TYPE_INFO, v126, (uint8_t *)&v206, 0xCu);
              }

- (uint64_t)migrateAllChildSAs
{
  uint64_t v156 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int128 v145 = 0u;
  __int128 v146 = 0u;
  __int128 v143 = 0u;
  __int128 v144 = 0u;
  uint64_t v3 = 1LL;
  id obj = objc_getProperty((id)a1, a2, 288LL, 1);
  uint64_t v4 = [obj countByEnumeratingWithState:&v143 objects:v147 count:16];
  if (!v4) {
    goto LABEL_101;
  }
  uint64_t v6 = v4;
  uint64_t v7 = *(void *)v144;
  *(void *)&__int128 v5 = 138413058LL;
  __int128 v141 = v5;
  while (2)
  {
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      if (*(void *)v144 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(id *)(*((void *)&v143 + 1) + 8 * i);
      if (!objc_getProperty((id)a1, v10, 336LL, 1))
      {
        ne_log_obj();
        int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v149 = "-[NEIKEv2Session migrateChildSA:]";
          id v118 = "%s called with null self.ikeSA";
          goto LABEL_90;
        }

        goto LABEL_99;
      }

      if (!v9)
      {
        ne_log_obj();
        int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v149 = "-[NEIKEv2Session migrateChildSA:]";
          _os_log_fault_impl(&dword_1876B1000, v22, OS_LOG_TYPE_FAULT, "%s called with null childSA", buf, 0xCu);
        }

        id v9 = 0LL;
        goto LABEL_99;
      }

      id Property = objc_getProperty((id)a1, v11, 336LL, 1);
      if (Property) {
        id Property = objc_getProperty(Property, v13, 64LL, 1);
      }
      id v14 = Property;

      if (!v14)
      {
        ne_log_obj();
        int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v149 = "-[NEIKEv2Session migrateChildSA:]";
          id v118 = "%s called with null self.ikeSA.localAddress";
          goto LABEL_90;
        }

- (void)setSentMOBIKERequest:(int)a3 messageID:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 11) & 1) == 0)
    {
      objc_setProperty_atomic((id)a1, v5, v6, 376LL);
      *(_DWORD *)(a1 + 24) = a3;
      if (objc_getProperty((id)a1, v7, 376LL, 1))
      {
        ne_log_obj();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v10 = 138412802;
          uint64_t v11 = a1;
          __int16 v12 = 1024;
          int v13 = a3;
          __int16 v14 = 2112;
          id Property = objc_getProperty((id)a1, v9, 376LL, 1);
          _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_INFO,  "%@ Saving MOBIKE request (message %u) %@\n",  (uint8_t *)&v10,  0x1Cu);
        }
      }
    }
  }
}

- (uint64_t)sendCurrentRequest:(uint64_t)a1
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (!a1) {
    goto LABEL_41;
  }
  id Property = (dispatch_queue_s *)objc_getProperty((id)a1, v3, 368LL, 1);
  dispatch_assert_queue_V2(Property);
  SEL v7 = objc_getProperty((id)a1, v6, 336LL, 1);
  if ((-[NEIKEv2IKESA hasTransport](v7, v8) & 1) != 0)
  {
    int v10 = (id *)objc_getProperty((id)a1, v9, 336LL, 1);
    __int16 v12 = (id *)-[NEIKEv2IKESA copyTransport](v10, v11);
    id v14 = objc_getProperty((id)a1, v13, 216LL, 1);
    __int128 v15 = (void *)MEMORY[0x189607968];
    uint64_t v16 = *(unsigned int *)(a1 + 16);
    id v17 = v14;
    [v15 numberWithInt:v16];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 objectForKeyedSubscript:v18];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v19 count] == 1)
    {
      ne_log_obj();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        [v19 firstObject];
        id v45 = (void *)objc_claimAutoreleasedReturnValue();
        int v46 = [v45 length];
        int v47 = *(_DWORD *)(a1 + 16);
        *(_DWORD *)__int128 buf = 138413058;
        uint64_t v60 = a1;
        __int16 v61 = 1024;
        int v62 = v46;
        __int16 v63 = 1024;
        int v64 = v47;
        __int16 v65 = 2112;
        *(void *)SEL v66 = v12;
        _os_log_debug_impl( &dword_1876B1000,  v20,  OS_LOG_TYPE_DEBUG,  "%@ Sending request of length %u with ID %u on %@\n",  buf,  0x22u);
      }

      [v19 firstObject];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      char v22 = -[NEIKEv2Transport sendData:sendCompletionHandler:](v12, v21, v4);

      if ((v22 & 1) == 0)
      {
        ne_log_obj();
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v60 = a1;
          _os_log_error_impl(&dword_1876B1000, v23, OS_LOG_TYPE_ERROR, "%@ Sending request data failed", buf, 0xCu);
        }

        id v25 = objc_getProperty((id)a1, v24, 336LL, 1);
        -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v25, 1);
LABEL_38:
        a1 = 0LL;
        goto LABEL_39;
      }
    }

    else if ([v19 count])
    {
      SEL v48 = v19;
      int v49 = [v19 count];
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      id obj = v19;
      uint64_t v27 = [obj countByEnumeratingWithState:&v53 objects:v69 count:16];
      if (!v27) {
        goto LABEL_26;
      }
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v54;
      int v30 = -v49;
      int v31 = 1;
LABEL_15:
      uint64_t v32 = 0LL;
      int v33 = v30 + v31;
      while (1)
      {
        if (*(void *)v54 != v29) {
          objc_enumerationMutation(obj);
        }
        SEL v34 = *(void **)(*((void *)&v53 + 1) + 8 * v32);
        ne_log_obj();
        id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          int v36 = [v34 length];
          int v37 = *(_DWORD *)(a1 + 16);
          *(_DWORD *)__int128 buf = 138413570;
          uint64_t v60 = a1;
          __int16 v61 = 1024;
          int v62 = v31 + v32;
          __int16 v63 = 1024;
          int v64 = v49;
          __int16 v65 = 1024;
          *(_DWORD *)SEL v66 = v36;
          *(_WORD *)&v66[4] = 1024;
          *(_DWORD *)&v66[6] = v37;
          __int16 v67 = 2112;
          BOOL v68 = v12;
          _os_log_debug_impl( &dword_1876B1000,  v35,  OS_LOG_TYPE_DEBUG,  "%@ Sending request fragment %u/%u of length %u with ID %u on %@\n",  buf,  0x2Eu);
        }

        if (v33 + (_DWORD)v32)
        {
          if ((-[NEIKEv2Transport sendData:sendCompletionHandler:](v12, v34, 0LL) & 1) == 0)
          {
            ne_log_obj();
            id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = 138412290;
              uint64_t v60 = a1;
              _os_log_error_impl( &dword_1876B1000,  v38,  OS_LOG_TYPE_ERROR,  "%@ Sending fragment request data failed",  buf,  0xCu);
            }

            uint64_t v19 = v48;
            if (v4)
            {
              id v41 = (dispatch_queue_s *)objc_getProperty((id)a1, v40, 368LL, 1);
              v51[0] = MEMORY[0x1895F87A8];
              v51[1] = 3221225472LL;
              v51[2] = __37__NEIKEv2Session_sendCurrentRequest___block_invoke_60;
              v51[3] = &unk_18A090940;
              SEL v52 = (os_log_s *)v4;
              dispatch_async(v41, v51);
              id v42 = v52;
              goto LABEL_36;
            }

            goto LABEL_37;
          }
        }

        else if ((-[NEIKEv2Transport sendData:sendCompletionHandler:](v12, v34, v4) & 1) == 0)
        {
          ne_log_obj();
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138412290;
            uint64_t v60 = a1;
            _os_log_error_impl( &dword_1876B1000,  v42,  OS_LOG_TYPE_ERROR,  "%@ Sending fragment request data failed",  buf,  0xCu);
          }

          uint64_t v19 = v48;
LABEL_36:

LABEL_37:
          id v43 = objc_getProperty((id)a1, v40, 336LL, 1);
          -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v43, 1);

          goto LABEL_38;
        }

        if (v28 == ++v32)
        {
          v31 += v32;
          uint64_t v28 = [obj countByEnumeratingWithState:&v53 objects:v69 count:16];
          int v30 = -v49;
          if (v28) {
            goto LABEL_15;
          }
LABEL_26:

          a1 = 1LL;
          uint64_t v19 = v48;
LABEL_39:

LABEL_40:
          goto LABEL_41;
        }
      }
    }

    a1 = 1LL;
    goto LABEL_39;
  }

  if (v4)
  {
    id v26 = (dispatch_queue_s *)objc_getProperty((id)a1, v9, 368LL, 1);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __37__NEIKEv2Session_sendCurrentRequest___block_invoke;
    block[3] = &unk_18A090940;
    id v58 = (id *)v4;
    dispatch_async(v26, block);
    a1 = 0LL;
    __int16 v12 = v58;
    goto LABEL_40;
  }

  a1 = 0LL;
LABEL_41:

  return a1;
}

uint64_t __37__NEIKEv2Session_sendCurrentRequest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __37__NEIKEv2Session_sendCurrentRequest___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (uint64_t)sendRequest:(unint64_t)a3 retryIntervalInMilliseconds:(int)a4 maxRetries:(void *)a5 timeoutError:(char)a6 resend:(uint64_t)a7 sendMessageID:(void *)a8 sendCompletionHandler:(void *)a9 replyHandler:
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  id v14 = a2;
  id v86 = a5;
  id v15 = a8;
  id newValue = a9;
  if (!a1)
  {
    a7 = 0LL;
    goto LABEL_66;
  }

  id Property = (dispatch_queue_s *)objc_getProperty((id)a1, v16, 368LL, 1);
  dispatch_assert_queue_V2(Property);
  if (!objc_getProperty((id)a1, v18, 336LL, 1))
  {
    ne_log_obj();
    SEL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NEIKEv2Session sendRequest:retryIntervalInMilliseconds:maxRetries:timeoutError:resend:sendM"
                           "essageID:sendCompletionHandler:replyHandler:]";
      _os_log_fault_impl(&dword_1876B1000, v24, OS_LOG_TYPE_FAULT, "%s called with null self.ikeSA", buf, 0xCu);
    }

    a7 = 0xFFFFFFFFLL;
    goto LABEL_65;
  }

  if (!objc_getProperty((id)a1, v19, 200LL, 1))
  {
    *(_BYTE *)(a1 + 11) = 0;
    SEL v24 = (os_log_s *)objc_getProperty((id)a1, v20, 336LL, 1);
    if ((a6 & 1) != 0)
    {
      *(_DWORD *)(a1 + 16) = a7;
      ne_log_obj();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = a7;
        _os_log_impl(&dword_1876B1000, v26, OS_LOG_TYPE_INFO, "%@ Re-sending message ID %u", buf, 0x12u);
      }
    }

    else
    {
      a7 = (*(_DWORD *)(a1 + 16) + 1);
      *(_DWORD *)(a1 + 16) = a7;
    }

    -[NEIKEv2Session cancelSendTimer]((void *)a1, v25);
    objc_setProperty_atomic_copy((id)a1, v27, newValue, 200LL);
    v14[6] = a7;
    id v29 = objc_getProperty((id)a1, v28, 336LL, 1);
    id v83 = -[NEIKEv2Packet copyPacketDatagramsForIKESA:](v14, v29);
    if (!v83)
    {
      ne_log_obj();
      __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_error_impl( &dword_1876B1000,  v56,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate datagrams from packet",  buf,  0xCu);
      }

      if (!v15)
      {
        a7 = 0xFFFFFFFFLL;
LABEL_64:

        goto LABEL_65;
      }

      id v58 = (dispatch_queue_s *)objc_getProperty((id)a1, v57, 368LL, 1);
      v101[0] = MEMORY[0x1895F87A8];
      v101[1] = 3221225472LL;
      v101[2] = __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_61;
      v101[3] = &unk_18A090940;
      id v102 = v15;
      dispatch_async(v58, v101);
      a7 = 0xFFFFFFFFLL;
      SEL v59 = v102;
LABEL_63:

      goto LABEL_64;
    }

    if (v24 && (*((_BYTE *)v24 + 9) & 1) != 0 && !(_DWORD)a7 && [v83 count] == 1)
    {
      [v83 firstObject];
      int v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v24, v31, v30, 312LL);
    }

    ne_log_large_obj();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      int v33 = [v83 count];
      *(_DWORD *)__int128 buf = 138413058;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = v33;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = a7;
      LOWORD(v106[0]) = 2112;
      *(void *)((char *)v106 + 2) = v14;
      _os_log_impl( &dword_1876B1000,  v32,  OS_LOG_TYPE_INFO,  "%@ Sending %u datagrams for packet (message %u): %@",  buf,  0x22u);
    }

    if ((a6 & 1) == 0)
    {
      id v82 = v83;
      int v36 = objc_getProperty((id)a1, v35, 336LL, 1);
      int v38 = 4;
      if (v36)
      {
        if ((v36[17] & 1) != 0) {
          int v38 = 6;
        }
        else {
          int v38 = 4;
        }
      }

      id v39 = objc_getProperty((id)a1, v37, 216LL, 1);
      SEL v40 = (void *)MEMORY[0x189607968];
      uint64_t v41 = *(unsigned int *)(a1 + 16);
      id v42 = v39;
      [v40 numberWithInt:v41];
      id v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 setObject:v82 forKeyedSubscript:v43];

      int v45 = *(_DWORD *)(a1 + 16);
      int v46 = v45 - v38;
      if (v45 >= v38)
      {
        id v47 = objc_getProperty((id)a1, v44, 216LL, 1);
        +[NEIKEv2Session removeItemsFromDictionary:lowerEdge:]((uint64_t)&OBJC_CLASS___NEIKEv2Session, v47, v46);
        id v49 = objc_getProperty((id)a1, v48, 240LL, 1);
        +[NEIKEv2Session removeItemsFromDictionary:lowerEdge:]((uint64_t)&OBJC_CLASS___NEIKEv2Session, v49, v46);
        id v51 = objc_getProperty((id)a1, v50, 256LL, 1);
        +[NEIKEv2Session removeItemsFromDictionary:lowerEdge:]((uint64_t)&OBJC_CLASS___NEIKEv2Session, v51, v46);
      }

      __int128 v53 = objc_getProperty((id)a1, v52, 360LL, 1);
      id v54 = (id)a1;
      if (v53)
      {
        if (v53[3] == -1)
        {
          v53[3] = a7;
          *(void *)__int128 buf = 0LL;
          *(void *)&uint8_t buf[8] = 0LL;
          if (-[NEIKEv2RTT getCurrentTime:]((uint64_t)buf))
          {
            *((void *)v53 + 5) = 1000LL * *(void *)buf + *(_DWORD *)&buf[8] / 1000;
          }

          else
          {
            ne_log_obj();
            uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)id v107 = 138412290;
              id v108 = v54;
              _os_log_error_impl( &dword_1876B1000,  v60,  OS_LOG_TYPE_ERROR,  "%@, failed to start RTT measurement",  v107,  0xCu);
            }
          }
        }

        else
        {
          ne_log_obj();
          __int128 v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            int v81 = v53[3];
            *(_DWORD *)__int128 buf = 138412802;
            *(void *)&uint8_t buf[4] = v54;
            *(_WORD *)&_BYTE buf[12] = 1024;
            *(_DWORD *)&buf[14] = v81;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = a7;
            _os_log_error_impl( &dword_1876B1000,  v55,  OS_LOG_TYPE_ERROR,  "%@, bad request message ID old %u new %u",  buf,  0x18u);
          }
        }
      }
    }

    unint64_t v61 = a3;
    if (!a3)
    {
      id v62 = objc_getProperty((id)a1, v34, 360LL, 1);
      unint64_t v61 = -[NEIKEv2RTT nextRetransmissionInterval]((uint64_t)v62);
    }

    if (a4)
    {
      __int16 v63 = objc_getProperty((id)a1, v34, 336LL, 1);
      if (!v63 || (v63[13] & 1) == 0)
      {
        int v64 = (dispatch_queue_s *)objc_getProperty((id)a1, v34, 368LL, 1);
        dispatch_source_t v65 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v64);
        objc_setProperty_atomic((id)a1, v66, v65, 296LL);

        if (!objc_getProperty((id)a1, v67, 296LL, 1))
        {
          ne_log_obj();
          SEL v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v59,  OS_LOG_TYPE_FAULT,  "dispatch_source_create failed",  buf,  2u);
          }

          goto LABEL_62;
        }

        *(void *)__int128 buf = 0LL;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000LL;
        v106[0] = a4;
        int64_t v69 = 1000000 * v61;
        uint64_t v70 = (dispatch_source_s *)objc_getProperty((id)a1, v68, 296LL, 1);
        dispatch_time_t v71 = dispatch_time(0x8000000000000000LL, v69);
        dispatch_source_set_timer(v70, v71, 0xFFFFFFFFFFFFFFFFLL, 0LL);

        char v73 = (dispatch_source_s *)objc_getProperty((id)a1, v72, 296LL, 1);
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_62;
        handler[3] = &unk_18A08D848;
        char v97 = buf;
        void handler[4] = a1;
        int v99 = a7;
        int v100 = a4;
        id v95 = v24;
        unint64_t v98 = a3;
        id v96 = v86;
        dispatch_source_set_event_handler(v73, handler);
        __int128 v75 = (dispatch_object_s *)objc_getProperty((id)a1, v74, 296LL, 1);
        dispatch_activate(v75);

        _Block_object_dispose(buf, 8);
      }
    }

    SEL v76 = (id *)objc_getProperty((id)a1, v34, 336LL, 1);
    SEL v59 = -[NEIKEv2IKESA copyTransport](v76, v77);
    if (v59)
    {
      v90[0] = MEMORY[0x1895F87A8];
      v90[1] = 3221225472LL;
      v90[2] = __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_68;
      v90[3] = &unk_18A08D870;
      v90[4] = a1;
      id v92 = v15;
      SEL v91 = v24;
      int v93 = a7;
      -[NEIKEv2Transport waitForTransport:]((uint64_t)v59, v90);

      goto LABEL_63;
    }

    if (v15)
    {
      id v79 = (dispatch_queue_s *)objc_getProperty((id)a1, v78, 368LL, 1);
      v88[0] = MEMORY[0x1895F87A8];
      v88[1] = 3221225472LL;
      v88[2] = __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_2;
      v88[3] = &unk_18A090940;
      id v89 = v15;
      dispatch_async(v79, v88);
    }

    SEL v59 = 0LL;
LABEL_62:
    a7 = 0xFFFFFFFFLL;
    goto LABEL_63;
  }

  ne_log_obj();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)&uint8_t buf[4] = a1;
    _os_log_error_impl(&dword_1876B1000, v21, OS_LOG_TYPE_ERROR, "%@ last request still outstanding", buf, 0xCu);
  }

  if (v15)
  {
    uint64_t v23 = (dispatch_queue_s *)objc_getProperty((id)a1, v22, 368LL, 1);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke;
    block[3] = &unk_18A090940;
    SEL v104 = (os_log_s *)v15;
    dispatch_async(v23, block);
    a7 = 0xFFFFFFFFLL;
    SEL v24 = v104;
LABEL_65:

    goto LABEL_66;
  }

  a7 = 0xFFFFFFFFLL;
LABEL_66:

  return a7;
}

uint64_t __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_61( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_62( uint64_t a1,  const char *a2)
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    ne_log_obj();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = *(_DWORD *)(a1 + 72);
      int v6 = *(_DWORD *)(a1 + 76);
      int v7 = v6 - *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      *(_DWORD *)__int128 buf = 138413058;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = v5;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v7;
      LOWORD(v89) = 1024;
      *(_DWORD *)((char *)&v89 + 2) = v6;
      _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "%@ Retry sending request %u (%u/%u), closing", buf, 0x1Eu);
    }

    if ((-[NEIKEv2Session sendCurrentRequest:](*(void *)(a1 + 32), 0LL) & 1) != 0)
    {
      unint64_t v15 = *(void *)(a1 + 64);
      if (!v15)
      {
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v8, 360LL, 1);
        }
        unint64_t v15 = -[NEIKEv2RTT nextRetransmissionInterval]((uint64_t)Property);
      }

      --*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      id v17 = *(id *)(a1 + 32);
      if (v17) {
        id v17 = objc_getProperty(v17, v8, 296LL, 1);
      }
      SEL v18 = (dispatch_source_s *)v17;
      dispatch_time_t v19 = dispatch_time(0x8000000000000000LL, 1000000 * v15);
      dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0LL);

      id v21 = *(dispatch_object_s **)(a1 + 32);
      if (v21) {
        id v21 = (dispatch_object_s *)objc_getProperty(v21, v20, 296LL, 1);
      }
      dispatch_activate(v21);
      return;
    }

    uint64_t v48 = *(void *)(a1 + 40);
    uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"request %u attempt %u/%u",  (uint64_t)v8,  v9,  v10,  v11,  v12,  v13,  v14,  *(unsigned int *)(a1 + 72));
    -[NEIKEv2IKESA setState:error:](v48, 3uLL, ErrorFailedToSend);

LABEL_40:
    -[NEIKEv2Session cancelSendTimer](*(void **)(a1 + 32), v47);
    return;
  }

  if (*(_DWORD *)(a1 + 72))
  {
LABEL_36:
    ne_log_obj();
    id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      uint64_t v44 = *(void *)(a1 + 32);
      int v46 = *(_DWORD *)(a1 + 72);
      int v45 = *(_DWORD *)(a1 + 76);
      *(_DWORD *)__int128 buf = 138412802;
      *(void *)&uint8_t buf[4] = v44;
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = v45;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v46;
      _os_log_impl( &dword_1876B1000,  v43,  OS_LOG_TYPE_INFO,  "%@ Hit max send retries (%u) for request %u, closing",  buf,  0x18u);
    }

    -[NEIKEv2IKESA setState:error:](*(void *)(a1 + 40), 3uLL, *(void **)(a1 + 48));
    goto LABEL_40;
  }

  id v22 = *(id *)(a1 + 32);
  if (v22)
  {
    id v22 = objc_getProperty(v22, a2, 336LL, 1);
    if (v22) {
      id v22 = objc_getProperty(v22, v23, 80LL, 1);
    }
  }

  id v24 = v22;
  if (![v24 allowTCPEncapsulation]
    || (id v26 = *(void **)(a1 + 32)) == 0LL
    || (SEL v27 = objc_getProperty(v26, v25, 336LL, 1)) != 0LL && (v27[13] & 1) != 0
    || (id v29 = *(void **)(a1 + 32)) == 0LL
    || (int v30 = (id *)objc_getProperty(v29, v28, 336LL, 1)) == 0LL)
  {
LABEL_35:

    goto LABEL_36;
  }

  uint64_t v32 = v30;
  *((_BYTE *)v30 + 13) = 1;
  *((_BYTE *)v30 + 10) = 0;
  int v33 = (unsigned __int8 *)objc_msgSend(objc_getProperty(v30, v31, 72, 1), "address");
  if (!v33)
  {
    ne_log_obj();
    SEL v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)SEL v91 = 136315138;
      id v92 = "-[NEIKEv2IKESA switchToTCPEncapsulation]";
      id v84 = "%s called with null remoteAddress";
LABEL_59:
      _os_log_fault_impl(&dword_1876B1000, v34, OS_LOG_TYPE_FAULT, v84, v91, 0xCu);
    }

void __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_68( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  -[NEIKEv2IKESA resyncAddress]((id *)Property, a2);
  if ((-[NEIKEv2Session sendCurrentRequest:](*(void *)(a1 + 32), *(void **)(a1 + 48)) & 1) == 0)
  {
    -[NEIKEv2Session cancelSendTimer](*(void **)(a1 + 32), v4);
    uint64_t v5 = *(void *)(a1 + 40);
    id ErrorFailedToSend = (id)NEIKEv2CreateErrorFailedToSend( @"request %u",  v6,  v7,  v8,  v9,  v10,  v11,  v12,  *(unsigned int *)(a1 + 56));
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, ErrorFailedToSend);
  }

uint64_t __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_65( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336LL, 1);
  }
  -[NEIKEv2IKESA resyncAddress]((id *)Property, a2);
  if ((-[NEIKEv2Session sendCurrentRequest:](*(void *)(a1 + 32), 0LL) & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    id ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend( @"request %u attempts %u",  v4,  v5,  v6,  v7,  v8,  v9,  v10,  *(unsigned int *)(a1 + 48));
    -[NEIKEv2IKESA setState:error:](v11, 3uLL, ErrorFailedToSend);

    -[NEIKEv2Session cancelSendTimer](*(void **)(a1 + 32), v13);
  }

- (uint64_t)sendRequest:(uint64_t)a1 retry:(void *)a2 replyHandler:(void *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    if (v5)
    {
      id Property = objc_getProperty((id)a1, v6, 336LL, 1);
      int v9 = 4;
      if (Property)
      {
        if ((Property[17] & 1) != 0) {
          int v9 = 12;
        }
        else {
          int v9 = 4;
        }
      }

      id Error = (void *)NEIKEv2CreateError(3LL);
      a1 = -[NEIKEv2Session sendRequest:retryIntervalInMilliseconds:maxRetries:timeoutError:resend:sendMessageID:sendCompletionHandler:replyHandler:]( a1,  v5,  0LL,  v9,  Error,  0,  0xFFFFFFFFLL,  0LL,  v7);
    }

    else
    {
      ne_log_obj();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v14 = "-[NEIKEv2Session sendRequest:retry:replyHandler:]";
        _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "%s called with null packet", buf, 0xCu);
      }

      a1 = 0xFFFFFFFFLL;
    }
  }

  return a1;
}

- (uint64_t)sendReply:(void *)a3 replyHandler:
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v7 = a3;
  if (!a1) {
    goto LABEL_12;
  }
  id Property = (dispatch_queue_s *)objc_getProperty((id)a1, v6, 368LL, 1);
  dispatch_assert_queue_V2(Property);
  if (objc_getProperty((id)a1, v9, 336LL, 1))
  {
    if (v5)
    {
      if ((*((_BYTE *)v5 + 10) & 1) != 0)
      {
        id v11 = objc_getProperty((id)a1, v10, 224LL, 1);
        uint64_t v12 = (void *)MEMORY[0x189607968];
        id v13 = v11;
        [v12 numberWithInt:v5[6]];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 objectForKeyedSubscript:v14];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          ne_log_obj();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            int v48 = v5[6];
            *(_DWORD *)__int128 buf = 138412546;
            id v52 = (const char *)a1;
            __int16 v53 = 1024;
            LODWORD(v54) = v48;
            _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "%@ Already sent reply %u, skipping new reply",  buf,  0x12u);
          }

          if (v7) {
            v7[2](v7, 0LL);
          }
          goto LABEL_12;
        }

        *(_BYTE *)(a1 + 11) = 0;
        id v20 = objc_getProperty((id)a1, v16, 336LL, 1);
        id v21 = -[NEIKEv2Packet copyPacketDatagramsForIKESA:](v5, v20);
        if (!v21)
        {
          ne_log_obj();
          int v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138412290;
            id v52 = (const char *)a1;
            _os_log_error_impl( &dword_1876B1000,  v45,  OS_LOG_TYPE_ERROR,  "%@ Failed to generate datagrams from packet",  buf,  0xCu);
          }

          if (v7) {
            v7[2](v7, 0LL);
          }
          goto LABEL_36;
        }

        ne_log_large_obj();
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412546;
          id v52 = (const char *)a1;
          __int16 v53 = 2112;
          id v54 = v5;
          _os_log_impl(&dword_1876B1000, v22, OS_LOG_TYPE_INFO, "%@ Sending reply: %@", buf, 0x16u);
        }

        id v24 = objc_getProperty((id)a1, v23, 336LL, 1);
        if ((!v24 || (v24[9] & 1) == 0) && !v5[6] && [v21 count] == 1)
        {
          [v21 firstObject];
          id v25 = (void *)objc_claimAutoreleasedReturnValue();
          id v27 = objc_getProperty((id)a1, v26, 336LL, 1);
          if (v27) {
            objc_setProperty_atomic(v27, v28, v25, 312LL);
          }
        }

        -[NEIKEv2Session fireWaitingRequestHandlerWithPacket:]((void *)a1, 0LL);
        objc_setProperty_atomic_copy((id)a1, v29, v7, 208LL);
        if (objc_getProperty((id)a1, v30, 208LL, 1))
        {
          uint64_t v32 = (dispatch_queue_s *)objc_getProperty((id)a1, v31, 368LL, 1);
          dispatch_source_t v33 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v32);
          objc_storeStrong((id *)(a1 + 304), v33);

          SEL v34 = *(void **)(a1 + 304);
          if (!v34)
          {
            ne_log_obj();
            int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_fault_impl(&dword_1876B1000, v46, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
            }

LABEL_35:
            -[NEIKEv2Session fireWaitingRequestHandlerWithPacket:]((void *)a1, 0LL);
LABEL_36:
            uint64_t v19 = 0LL;
LABEL_37:

            goto LABEL_38;
          }

          SEL v35 = v34;
          dispatch_time_t v36 = dispatch_time(0x8000000000000000LL, 30000000000LL);
          dispatch_source_set_timer(v35, v36, 0xFFFFFFFFFFFFFFFFLL, 0LL);

          int v37 = *(dispatch_source_s **)(a1 + 304);
          handler[0] = MEMORY[0x1895F87A8];
          handler[1] = 3221225472LL;
          handler[2] = __41__NEIKEv2Session_sendReply_replyHandler___block_invoke;
          handler[3] = &unk_18A090390;
          void handler[4] = a1;
          dispatch_source_set_event_handler(v37, handler);
          dispatch_activate(*(dispatch_object_t *)(a1 + 304));
        }

        uint64_t v38 = v5[6];
        id v39 = v21;
        uint64_t v19 = 1LL;
        id v41 = objc_getProperty((id)a1, v40, 224LL, 1);
        id v42 = (void *)MEMORY[0x189607968];
        id v43 = v41;
        [v42 numberWithInt:v38];
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
        [v43 setObject:v39 forKeyedSubscript:v44];

        goto LABEL_35;
      }

      ne_log_obj();
      SEL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)__int128 buf = 136315138;
      id v52 = "-[NEIKEv2Session sendReply:replyHandler:]";
      id v49 = "%s called with null packet.isResponse";
    }

    else
    {
      ne_log_obj();
      SEL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)__int128 buf = 136315138;
      id v52 = "-[NEIKEv2Session sendReply:replyHandler:]";
      id v49 = "%s called with null packet";
    }

    goto LABEL_40;
  }

  ne_log_obj();
  SEL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v52 = "-[NEIKEv2Session sendReply:replyHandler:]";
    id v49 = "%s called with null self.ikeSA";
LABEL_40:
    _os_log_fault_impl(&dword_1876B1000, v18, OS_LOG_TYPE_FAULT, v49, buf, 0xCu);
  }

uint64_t __41__NEIKEv2Session_sendReply_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_ERROR,  "%@ Timed out waiting for next request",  (uint8_t *)&v5,  0xCu);
  }

  return -[NEIKEv2Session fireWaitingRequestHandlerWithPacket:](*(void **)(a1 + 32), 0LL);
}

- (void)finishConfigurationEstablishment
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (objc_getProperty(a1, a2, 336LL, 1))
    {
      if ((a1[11] & 1) == 0)
      {
        -[NEIKEv2Session startIKELifetimeTimer](a1, v3);
        -[NEIKEv2Session startDPDTimer](a1, v4);
      }
    }

    else
    {
      ne_log_obj();
      int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        int v6 = 136315138;
        uint64_t v7 = "-[NEIKEv2Session finishConfigurationEstablishment]";
        _os_log_fault_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_FAULT,  "%s called with null self.ikeSA",  (uint8_t *)&v6,  0xCu);
      }
    }
  }

id __48__NEIKEv2Session_sendAnalyticsOfChosenProtocols__block_invoke(void *a1)
{
  v15[14] = *MEMORY[0x1895F89C0];
  v14[0] = @"ChosenIKESAEncryptionProtocol";
  v14[1] = @"ChosenIKESAIntegrityProtocol";
  uint64_t v1 = @"<unknown>";
  uint64_t v2 = (const __CFString *)a1[4];
  uint64_t v3 = (const __CFString *)a1[5];
  if (!v2) {
    uint64_t v2 = @"<unknown>";
  }
  if (!v3) {
    uint64_t v3 = @"<unknown>";
  }
  v15[0] = v2;
  v15[1] = v3;
  v14[2] = @"ChosenIKESAPRFProtocol";
  v14[3] = @"ChosenIKESADHProtocol";
  uint64_t v4 = (const __CFString *)a1[6];
  int v5 = (const __CFString *)a1[7];
  if (!v4) {
    uint64_t v4 = @"<unknown>";
  }
  if (!v5) {
    int v5 = @"<unknown>";
  }
  v15[2] = v4;
  v15[3] = v5;
  v14[4] = @"RemoteHasPreferredIKESADHProtocol";
  v14[5] = @"IsIKESACookieIncluded";
  uint64_t v6 = a1[9];
  v15[4] = a1[8];
  v15[5] = v6;
  v14[6] = @"ChosenIKEChildSAEncryptionProtocol";
  v14[7] = @"ChosenIKEChildSAIntegrityProtocol";
  uint64_t v7 = (const __CFString *)a1[10];
  uint64_t v8 = (const __CFString *)a1[11];
  if (!v7) {
    uint64_t v7 = @"<unknown>";
  }
  if (!v8) {
    uint64_t v8 = @"<unknown>";
  }
  v15[6] = v7;
  v15[7] = v8;
  v14[8] = @"LocalAuthProtocolUsed";
  v14[9] = @"RemoteAuthProtocolUsed";
  SEL v9 = (const __CFString *)a1[12];
  uint64_t v10 = (const __CFString *)a1[13];
  if (!v9) {
    SEL v9 = @"<unknown>";
  }
  if (!v10) {
    uint64_t v10 = @"<unknown>";
  }
  v15[8] = v9;
  v15[9] = v10;
  v14[10] = @"EAPProtocolUsed";
  v14[11] = @"LocalNonceSize";
  id v11 = (const __CFString *)a1[14];
  uint64_t v12 = a1[15];
  if (!v11) {
    id v11 = @"<unknown>";
  }
  v15[10] = v11;
  v15[11] = v12;
  v14[12] = @"RemoteNonceSize";
  v14[13] = @"ProcessName";
  if (a1[17]) {
    uint64_t v1 = (const __CFString *)a1[17];
  }
  v15[12] = a1[16];
  v15[13] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:14];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportConfiguration
{
  if (a1)
  {
    id Property = objc_getProperty(a1, a2, 336LL, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 488LL, 1);
    }
    id v5 = Property;
    objc_setProperty_atomic(a1, v6, v5, 48LL);

    [a1 configurationUpdateBlock];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      [a1 clientQueue];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        [a1 clientQueue];
        SEL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1895F87A8];
        v10[1] = 3221225472LL;
        v10[2] = __37__NEIKEv2Session_reportConfiguration__block_invoke;
        v10[3] = &unk_18A0908C8;
        v10[4] = a1;
        id v11 = v7;
        dispatch_async(v9, v10);
      }
    }
  }

void __37__NEIKEv2Session_reportConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_BYTE **)(a1 + 32);
  if (!v2 || (v2[12] & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 assignedConfiguration];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }

void *__50__NEIKEv2Session_reportServerAdditionalAddresses___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!v1 || (*(_BYTE *)(v1 + 12) & 1) == 0) {
    return (void *)(*(uint64_t (**)(void, void))(result[6] + 16LL))(result[6], result[5]);
  }
  return result;
}

- (void)reportServerRedirect:(void *)a1
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v5 = v3;
  if (a1)
  {
    if (v3)
    {
      if (objc_getProperty(a1, v4, 336LL, 1))
      {
        SEL v6 = -[NEIKEv2Packet copyNotification:](v5, (const char *)0x4017);
        uint64_t v8 = v6;
        if (!v6)
        {
          id v24 = 0LL;
LABEL_43:
          [a1 redirectEventBlock];
          SEL v29 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 clientQueue];
          SEL v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30 && v29)
          {
            [a1 clientQueue];
            SEL v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1895F87A8];
            block[1] = 3221225472LL;
            block[2] = __39__NEIKEv2Session_reportServerRedirect___block_invoke;
            block[3] = &unk_18A08FB50;
            void block[4] = a1;
            id v34 = v29;
            id v33 = v24;
            dispatch_async(v31, block);
          }

          goto LABEL_47;
        }

        if (v6[3] != 16407LL)
        {
          ne_log_obj();
          SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = v8;
            _os_log_fault_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_FAULT,  "Cannot copy server redirect nonce from notification %@",  buf,  0xCu);
          }

          goto LABEL_41;
        }

        SEL v9 = (os_log_s *)objc_getProperty(v6, v7, 32LL, 1);
        if ((unint64_t)-[os_log_s length](v9, "length") <= 1)
        {
          ne_log_obj();
          uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 134217984;
            *(void *)&uint8_t buf[4] = -[os_log_s length](v9, "length");
            _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "Server redirect has invalid length %llu",  buf,  0xCu);
          }

          goto LABEL_41;
        }

        uint64_t v12 = (unsigned __int8 *)-[os_log_s bytes](v9, "bytes");
        uint64_t v13 = -[os_log_s length](v9, "length");
        unint64_t v14 = v12[1];
        if (v13 - 2 < v14)
        {
          ne_log_obj();
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v16 = -[os_log_s length](v9, "length");
            int v17 = v12[1];
            *(_DWORD *)__int128 buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = v16;
            *(_WORD *)&uint8_t buf[8] = 1024;
            *(_DWORD *)&buf[10] = v17;
            SEL v18 = "Server redirect has invalid length %u (gateway length %u)";
            uint64_t v19 = buf;
            id v20 = v15;
            uint32_t v21 = 14;
LABEL_39:
            _os_log_error_impl(&dword_1876B1000, v20, OS_LOG_TYPE_ERROR, v18, v19, v21);
          }

void *__39__NEIKEv2Session_reportServerRedirect___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!v1 || (*(_BYTE *)(v1 + 12) & 1) == 0) {
    return (void *)(*(uint64_t (**)(void, void))(result[6] + 16LL))(result[6], result[5]);
  }
  return result;
}

uint64_t __32__NEIKEv2Session_reportShortDPD__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!v1 || (*(_BYTE *)(v1 + 12) & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16LL))();
  }
  return result;
}

- (void)reportPrivateNotifies:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    [a1 privateNotifyStatusEvent];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 clientQueue];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && v4)
    {
      SEL v6 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithArray:v3 copyItems:1];
      [a1 clientQueue];
      uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __40__NEIKEv2Session_reportPrivateNotifies___block_invoke;
      block[3] = &unk_18A08FB50;
      void block[4] = a1;
      id v10 = v6;
      id v11 = v4;
      id v8 = v6;
      dispatch_async(v7, block);
    }
  }
}

void *__40__NEIKEv2Session_reportPrivateNotifies___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!v1 || (*(_BYTE *)(v1 + 12) & 1) == 0) {
    return (void *)(*(uint64_t (**)(void, void))(result[6] + 16LL))(result[6], result[5]);
  }
  return result;
}

- (id)copySAsToDeleteAndInstallRekeyedChildSA:(id)a1
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3)
    {
      id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
      if (!v6) {
        goto LABEL_9;
      }
      id Property = objc_getProperty(a1, v5, 192LL, 1);
      id v8 = -[NEIKEv2Session copySAFromDictionary:forChild:](Property, v4);
      if (v8)
      {
        SEL v9 = v8;
        do
        {
          [v6 addObject:v9];
          objc_msgSend(objc_getProperty(a1, v10, 192, 1), "setObject:forKeyedSubscript:", 0, v9);
          id v12 = objc_getProperty(a1, v11, 192LL, 1);
          id v13 = -[NEIKEv2Session copySAFromDictionary:forChild:](v12, v4);

          SEL v9 = v13;
        }

        while (v13);
      }

      else {
LABEL_9:
      }
        a1 = 0LL;
    }

    else
    {
      ne_log_obj();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        int v16 = 136315138;
        int v17 = "-[NEIKEv2Session copySAsToDeleteAndInstallRekeyedChildSA:]";
        _os_log_fault_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_FAULT,  "%s called with null childSA",  (uint8_t *)&v16,  0xCu);
      }

      a1 = 0LL;
    }
  }

  return a1;
}

- (void)uninstallOldRekeyedChildSAs:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          ne_log_obj();
          SEL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id Property = objc_getProperty(a1, v11, 176LL, 1);
            *(_DWORD *)__int128 buf = 138412802;
            uint64_t v19 = a1;
            __int16 v20 = 2112;
            id v21 = Property;
            __int16 v22 = 2112;
            uint64_t v23 = v9;
            _os_log_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ %@ Uninstalling old rekeyed child SA %@",  buf,  0x20u);
          }

          objc_msgSend(objc_getProperty(a1, v13, 176, 1), "removeSA:", v9);
        }

        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v24 count:16];
      }

      while (v6);
    }
  }
}

- (void)reportTrafficSelectorsForChildSA:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v5 = v3;
  if (a1)
  {
    if (v3)
    {
      int v6 = v3[4];
      objc_getProperty(v3, v4, 64LL, 1);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_getProperty(v5, v8, 72LL, 1);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 trafficSelectorUpdateBlock];
      SEL v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        [a1 clientQueue];
        SEL v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          [a1 clientQueue];
          id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __51__NEIKEv2Session_reportTrafficSelectorsForChildSA___block_invoke;
          block[3] = &unk_18A08D8E8;
          void block[4] = a1;
          id v16 = v10;
          int v17 = v6;
          id v14 = v7;
          id v15 = v9;
          dispatch_async(v12, block);
        }
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v19 = "-[NEIKEv2Session reportTrafficSelectorsForChildSA:]";
        _os_log_fault_impl(&dword_1876B1000, (os_log_t)v7, OS_LOG_TYPE_FAULT, "%s called with null childSA", buf, 0xCu);
      }
    }
  }
}

uint64_t __51__NEIKEv2Session_reportTrafficSelectorsForChildSA___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!v1 || (*(_BYTE *)(v1 + 12) & 1) == 0) {
    return (*(uint64_t (**)(void, void, void, void))(*(void *)(result + 56) + 16LL))( *(void *)(result + 56),  *(unsigned int *)(result + 64),  *(void *)(result + 40),  *(void *)(result + 48));
  }
  return result;
}

- (void)setPendingPrivateNotifies:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 392), a2);
  }
}

@end