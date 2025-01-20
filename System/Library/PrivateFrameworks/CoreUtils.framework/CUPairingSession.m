@interface CUPairingSession
- (BOOL)localize;
- (CUAppleIDClient)myAppleIDInfoClient;
- (CUPairedPeer)pairedPeer;
- (CUPairingSession)init;
- (NSArray)allowedMACAddresses;
- (NSData)mfiCertificateData;
- (NSData)mfiToken;
- (NSDictionary)acl;
- (NSDictionary)aclActual;
- (NSDictionary)additionalPeerInfo;
- (NSDictionary)additionalSelfInfo;
- (NSDictionary)appInfoPeer;
- (NSDictionary)appInfoSelf;
- (NSDictionary)groupInfoPeer;
- (NSDictionary)groupInfoSelf;
- (NSDictionary)peerInfo;
- (NSString)fixedPIN;
- (NSString)label;
- (NSString)languageCode;
- (NSString)localeIdentifier;
- (NSString)mfiProductType;
- (NSString)mfiSerialNumber;
- (NSString)myAppleID;
- (NSString)peerAppleID;
- (OS_dispatch_queue)dispatchQueue;
- (id)completionHandler;
- (id)copyIdentityHandler;
- (id)findPeerHandler;
- (id)hidePINHandler;
- (id)openStreamWithName:(id)a3 error:(id *)a4;
- (id)openStreamWithName:(id)a3 type:(int)a4 error:(id *)a5;
- (id)promptForPINHandler;
- (id)savePeerHandler;
- (id)sendDataHandler;
- (id)sendMessageDataHandler;
- (id)showPINHandler;
- (id)showPINHandlerEx;
- (id)signDataHandler;
- (id)verifySignatureHandler;
- (int)_showPINBuiltInUI:(id)a3 useVisualPairing:(BOOL)a4;
- (int)deriveKeyWithSaltPtr:(const void *)a3 saltLen:(unint64_t)a4 infoPtr:(const void *)a5 infoLen:(unint64_t)a6 keyLen:(unint64_t)a7 outputKeyPtr:(void *)a8;
- (int)peerDeviceClass;
- (unint64_t)peerAppFlags;
- (unint64_t)selfAppFlags;
- (unsigned)flags;
- (unsigned)pinType;
- (unsigned)pinTypeActual;
- (unsigned)sessionType;
- (void)_activate;
- (void)_cleanup;
- (void)_completed:(id)a3;
- (void)_receivedData:(id)a3 flags:(unsigned int)a4;
- (void)_tryPIN:(id)a3;
- (void)activate;
- (void)closeStream:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)receivedData:(id)a3;
- (void)receivedMessageData:(id)a3;
- (void)setAcl:(id)a3;
- (void)setAdditionalPeerInfo:(id)a3;
- (void)setAdditionalSelfInfo:(id)a3;
- (void)setAllowedMACAddresses:(id)a3;
- (void)setAppInfoSelf:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCopyIdentityHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFindPeerHandler:(id)a3;
- (void)setFixedPIN:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setGroupInfoSelf:(id)a3;
- (void)setHidePINHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLocalize:(BOOL)a3;
- (void)setMfiCertificateData:(id)a3;
- (void)setMfiProductType:(id)a3;
- (void)setMfiSerialNumber:(id)a3;
- (void)setMfiToken:(id)a3;
- (void)setMyAppleID:(id)a3;
- (void)setMyAppleIDInfoClient:(id)a3;
- (void)setPeerAppleID:(id)a3;
- (void)setPeerDeviceClass:(int)a3;
- (void)setPinType:(unsigned int)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setSavePeerHandler:(id)a3;
- (void)setSelfAppFlags:(unint64_t)a3;
- (void)setSendDataHandler:(id)a3;
- (void)setSendMessageDataHandler:(id)a3;
- (void)setSessionType:(unsigned int)a3;
- (void)setShowPINHandler:(id)a3;
- (void)setShowPINHandlerEx:(id)a3;
- (void)setSignDataHandler:(id)a3;
- (void)setVerifySignatureHandler:(id)a3;
- (void)tryPIN:(id)a3;
@end

@implementation CUPairingSession

- (CUPairingSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUPairingSession;
  v2 = -[CUPairingSession init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUPairingSession;
  }

  return v2;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  -[CUPairingSession _cleanup](self, "_cleanup");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUPairingSession;
  -[CUPairingSession dealloc](&v4, sel_dealloc);
}

- (void)_cleanup
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0LL;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0LL;

  id showPINHandler = self->_showPINHandler;
  self->_id showPINHandler = 0LL;

  id showPINHandlerEx = self->_showPINHandlerEx;
  self->_id showPINHandlerEx = 0LL;

  id hidePINHandler = self->_hidePINHandler;
  self->_id hidePINHandler = 0LL;

  id sendDataHandler = self->_sendDataHandler;
  self->_id sendDataHandler = 0LL;

  id sendMessageDataHandler = self->_sendMessageDataHandler;
  self->_id sendMessageDataHandler = 0LL;

  id signDataHandler = self->_signDataHandler;
  self->_id signDataHandler = 0LL;

  id verifySignatureHandler = self->_verifySignatureHandler;
  self->_id verifySignatureHandler = 0LL;

  id copyIdentityHandler = self->_copyIdentityHandler;
  self->_id copyIdentityHandler = 0LL;

  id findPeerHandler = self->_findPeerHandler;
  self->_id findPeerHandler = 0LL;

  id savePeerHandler = self->_savePeerHandler;
  self->_id savePeerHandler = 0LL;

  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0LL;
  }

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (CUPairedPeer)pairedPeer
{
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    v3 = (void *)*((void *)pairingSession + 33);
    if (v3) {
      id v4 = v3;
    }
  }

  else
  {
    v3 = 0LL;
  }

  return (CUPairedPeer *)v3;
}

- (unint64_t)peerAppFlags
{
  pairingSession = self->_pairingSession;
  if (pairingSession) {
    return *((void *)pairingSession + 25);
  }
  else {
    return 0LL;
  }
}

- (void)setSelfAppFlags:(unint64_t)a3
{
  self->_selfAppFlags = a3;
  pairingSession = self->_pairingSession;
  if (pairingSession) {
    *((void *)pairingSession + 26) = a3;
  }
}

- (NSDictionary)appInfoPeer
{
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    v3 = (void *)PairingSessionCopyProperty((uint64_t)pairingSession, @"appInfoPeer", 0LL);
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v4 = v3;
    }
    else {
      id v4 = 0LL;
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)groupInfoPeer
{
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    v3 = (void *)PairingSessionCopyProperty((uint64_t)pairingSession, @"groupInfoPeer", 0LL);
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v4 = v3;
    }
    else {
      id v4 = 0LL;
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return (NSDictionary *)v4;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__CUPairingSession_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  v69[1] = *MEMORY[0x1895F89C0];
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    uint64_t sessionType = self->_sessionType;
    else {
      v9 = off_189F33D10[sessionType];
    }
    CUPrintFlags(self->_flags, byte_186B4BB71, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString length](self->_fixedPIN, "length");
    LogPrintF_safe( (uint64_t)ucat,  (uint64_t)"-[CUPairingSession _activate]",  0x1Eu,  (uint64_t)"Activate: sessionType=%s, flags=%@, pinType=%s, fixedPIN=%s",  v11,  v12,  v13,  v14,  (char)v9);
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__CUPairingSession_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_completed:(id)a3
{
  id v24 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v8 = v24;
  if (!v24)
  {
    pairingSession = self->_pairingSession;
    if (pairingSession)
    {
      v10 = (NSDictionary *)*((void *)pairingSession + 34);
      if (v10) {
        CFRetain(*((CFTypeRef *)pairingSession + 34));
      }
      aclActual = self->_aclActual;
      self->_aclActual = v10;

      uint64_t v12 = (NSDictionary *)PairingSessionCopyPeerInfo(self->_pairingSession, 0LL);
      peerInfo = self->_peerInfo;
      self->_peerInfo = v12;

      v8 = 0LL;
    }
  }

  if (self->_pinDialogToken && (self->_flags & 0x100) != 0)
  {
    char v14 = objc_opt_respondsToSelector();
    pbsMediaService = self->_pbsMediaService;
    id pinDialogToken = self->_pinDialogToken;
    if ((v14 & 1) != 0) {
      -[PBSMediaRemoteServiceInterface dismissPinDialogWithToken:error:]( pbsMediaService,  "dismissPinDialogWithToken:error:",  pinDialogToken,  v24);
    }
    else {
      -[PBSMediaRemoteServiceInterface dismissPinDialogWithToken:]( pbsMediaService,  "dismissPinDialogWithToken:",  pinDialogToken);
    }
    id v17 = self->_pinDialogToken;
    self->_id pinDialogToken = 0LL;

    uint64_t v18 = self->_pbsMediaService;
    self->_pbsMediaService = 0LL;

    v8 = v24;
  }

  if (self->_completionHandler)
  {
    ucat = self->_ucat;
    int var0 = ucat->var0;
    if (v8)
    {
      if (var0 <= 50)
      {
        if (var0 == -1)
        {
          BOOL v21 = _LogCategory_Initialize((uint64_t)ucat, 0x32u);
          LOBYTE(v8) = (_BYTE)v24;
          if (!v21) {
            goto LABEL_24;
          }
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUPairingSession _completed:]",  0x32u,  (uint64_t)"### Pairing failed: %{error}\n",  v4,  v5,  v6,  v7,  (char)v8);
      }
    }

    else if (var0 <= 30)
    {
      if (var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUPairingSession _completed:]",  0x1Eu,  (uint64_t)"Pairing completed\n",  v4,  v5,  v6,  v7,  v23);
    }

- (void)receivedMessageData:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__CUPairingSession_receivedMessageData___block_invoke;
  v7[3] = &unk_189F33088;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)receivedData:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __33__CUPairingSession_receivedData___block_invoke;
  v7[3] = &unk_189F33088;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_receivedData:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v60[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v11 = v6;
  uint64_t v56 = 0LL;
  v57 = 0LL;
  char v55 = 0;
  pairingSession = self->_pairingSession;
  if (!pairingSession)
  {
    int v58 = -6745;
    ucat = self->_ucat;
    if (ucat->var0 > 90) {
      goto LABEL_27;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    unsigned int v44 = "### Use before activate\n";
    unsigned int v45 = 90;
    goto LABEL_52;
  }

  id v13 = v6;
  char v14 = (unsigned __int8 *)[v13 bytes];
  CFIndex v15 = [v13 length];
  int v18 = PairingSessionExchange((uint64_t)pairingSession, v14, v15, (char **)&v57, (uint64_t)&v56, (uint64_t)&v55, v16, v17);
  int v58 = v18;
  if (v18)
  {
    char v42 = v18;
    if (v18 == -6771)
    {
      int v58 = 0;
      ucat = self->_ucat;
      if (ucat->var0 > 30) {
        goto LABEL_27;
      }
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      unsigned int v44 = "Waiting for user input\n";
    }

    else
    {
      ucat = self->_ucat;
      if (ucat->var0 > 30) {
        goto LABEL_27;
      }
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      char v54 = v42;
      unsigned int v44 = "### Pairing failed: %#m\n";
    }

    unsigned int v45 = 30;
LABEL_52:
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUPairingSession _receivedData:flags:]",  v45,  (uint64_t)v44,  v7,  v8,  v9,  v10,  v54);
    goto LABEL_27;
  }

  uint64_t v19 = v57;
  if (!v57)
  {
    if (!v55) {
      goto LABEL_29;
    }
LABEL_26:
    -[CUPairingSession _completed:](self, "_completed:", 0LL);
    goto LABEL_27;
  }

  id v20 = objc_alloc(MEMORY[0x189603F48]);
  BOOL v21 = (void *)[v20 initWithBytesNoCopy:v19 length:v56 freeWhenDone:1];
  v57 = 0LL;
  if (!self->_sendMessageDataHandler)
  {
    id sendDataHandler = (void (**)(id, void, void *))self->_sendDataHandler;
    if (sendDataHandler) {
      sendDataHandler[2](sendDataHandler, v4, v21);
    }
LABEL_25:

    if (!v55) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  v22 = (__CFString *)objc_alloc_init(MEMORY[0x189603FC8]);
  -[__CFString setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v21, @"_pd");
  if ((v4 & 1) != 0)
  {
    char v23 = self->_languageCode;
    if (v23)
    {
LABEL_7:
      -[__CFString setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v23, @"_lc");
      goto LABEL_8;
    }

    if (self->_localize)
    {
      [MEMORY[0x189603F90] preferredLanguages];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v40 firstObject];
      char v23 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (v23) {
        goto LABEL_7;
      }
    }

    else
    {
      char v23 = 0LL;
    }

- (void)tryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __27__CUPairingSession_tryPIN___block_invoke;
  v7[3] = &unk_189F33088;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_tryPIN:(id)a3
{
  v29[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUPairingSession _tryPIN:]",  0x1Eu,  (uint64_t)"Try PIN\n",  v4,  v5,  v6,  v7,  v27);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (int)_showPINBuiltInUI:(id)a3 useVisualPairing:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  if (!self->_pbsMediaService)
  {
    [(Class)getPBSSystemServiceConnectionClass[0]() sharedConnection];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 mediaRemoteServiceProxy];
    uint64_t v12 = (PBSMediaRemoteServiceInterface *)objc_claimAutoreleasedReturnValue();
    pbsMediaService = self->_pbsMediaService;
    self->_pbsMediaService = v12;

    if (!self->_pbsMediaService)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 90)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUPairingSession _showPINBuiltInUI:useVisualPairing:]",  0x5Au,  (uint64_t)"### Show PIN PBS proxy failed\n",  v6,  v7,  v8,  v9,  v48);
      }

- (id)openStreamWithName:(id)a3 error:(id *)a4
{
  return -[CUPairingSession openStreamWithName:type:error:](self, "openStreamWithName:type:error:", a3, 1LL, a4);
}

- (id)openStreamWithName:(id)a3 type:(int)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  v37 = 0LL;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUPairingSession openStreamWithName:type:error:]",  0x1Eu,  (uint64_t)"Open stream '%@'\n",  v8,  v9,  v10,  v11,  (char)v12);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)closeStream:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  ucat = self->_ucat;
  id v12 = v4;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUPairingSession closeStream:]",  0x1Eu,  (uint64_t)"Close stream '%@'\n",  v5,  v6,  v7,  v8,  (char)v4);
      BOOL v4 = v12;
      goto LABEL_5;
    }

    BOOL v10 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
    BOOL v4 = v12;
    if (v10)
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (int)deriveKeyWithSaltPtr:(const void *)a3 saltLen:(unint64_t)a4 infoPtr:(const void *)a5 infoLen:(unint64_t)a6 keyLen:(unint64_t)a7 outputKeyPtr:(void *)a8
{
  pairingSession = self->_pairingSession;
  if (!pairingSession)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:]",  0x5Au,  (uint64_t)"### Derive key before activate\n",  (uint64_t)a5,  a6,  a7,  (uint64_t)a8,  v18);
    }

    return -6745;
  }

  int v14 = PairingSessionDeriveKey((uint64_t)pairingSession, (char *)a3, a4, (uint64_t)a5, a6, a7, (uint64_t)a8);
  if (v14)
  {
    int v17 = self->_ucat;
    if (v17->var0 <= 90)
    {
      if (v17->var0 == -1)
      {
        int v17 = self->_ucat;
      }

      LogPrintF( (uint64_t)v17,  (uint64_t)"-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:]",  0x5Au,  (uint64_t)"### Derive key failed: %#m\n",  v10,  v11,  v12,  v13,  v14);
    }
  }

  return v14;
}

- (NSDictionary)acl
{
  return self->_acl;
}

- (void)setAcl:(id)a3
{
}

- (NSDictionary)aclActual
{
  return self->_aclActual;
}

- (NSDictionary)additionalPeerInfo
{
  return self->_additionalPeerInfo;
}

- (void)setAdditionalPeerInfo:(id)a3
{
}

- (NSDictionary)additionalSelfInfo
{
  return self->_additionalSelfInfo;
}

- (void)setAdditionalSelfInfo:(id)a3
{
}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
}

- (unint64_t)selfAppFlags
{
  return self->_selfAppFlags;
}

- (NSDictionary)appInfoSelf
{
  return self->_appInfoSelf;
}

- (void)setAppInfoSelf:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSDictionary)groupInfoSelf
{
  return self->_groupInfoSelf;
}

- (void)setGroupInfoSelf:(id)a3
{
}

- (NSString)fixedPIN
{
  return self->_fixedPIN;
}

- (void)setFixedPIN:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (BOOL)localize
{
  return self->_localize;
}

- (void)setLocalize:(BOOL)a3
{
  self->_localize = a3;
}

- (int)peerDeviceClass
{
  return self->_peerDeviceClass;
}

- (void)setPeerDeviceClass:(int)a3
{
  self->_int peerDeviceClass = a3;
}

- (NSDictionary)peerInfo
{
  return self->_peerInfo;
}

- (unsigned)pinType
{
  return self->_pinType;
}

- (void)setPinType:(unsigned int)a3
{
  self->_pinType = a3;
}

- (unsigned)pinTypeActual
{
  return self->_pinTypeActual;
}

- (unsigned)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unsigned int)a3
{
  self->_uint64_t sessionType = a3;
}

- (NSData)mfiCertificateData
{
  return self->_mfiCertificateData;
}

- (void)setMfiCertificateData:(id)a3
{
}

- (NSString)mfiProductType
{
  return self->_mfiProductType;
}

- (void)setMfiProductType:(id)a3
{
}

- (NSString)mfiSerialNumber
{
  return self->_mfiSerialNumber;
}

- (void)setMfiSerialNumber:(id)a3
{
}

- (NSData)mfiToken
{
  return self->_mfiToken;
}

- (void)setMfiToken:(id)a3
{
}

- (NSString)myAppleID
{
  return self->_myAppleID;
}

- (void)setMyAppleID:(id)a3
{
}

- (CUAppleIDClient)myAppleIDInfoClient
{
  return self->_myAppleIDInfoClient;
}

- (void)setMyAppleIDInfoClient:(id)a3
{
}

- (NSString)peerAppleID
{
  return self->_peerAppleID;
}

- (void)setPeerAppleID:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (id)showPINHandlerEx
{
  return self->_showPINHandlerEx;
}

- (void)setShowPINHandlerEx:(id)a3
{
}

- (id)showPINHandler
{
  return self->_showPINHandler;
}

- (void)setShowPINHandler:(id)a3
{
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
{
}

- (id)sendDataHandler
{
  return self->_sendDataHandler;
}

- (void)setSendDataHandler:(id)a3
{
}

- (id)sendMessageDataHandler
{
  return self->_sendMessageDataHandler;
}

- (void)setSendMessageDataHandler:(id)a3
{
}

- (id)signDataHandler
{
  return self->_signDataHandler;
}

- (void)setSignDataHandler:(id)a3
{
}

- (id)verifySignatureHandler
{
  return self->_verifySignatureHandler;
}

- (void)setVerifySignatureHandler:(id)a3
{
}

- (id)copyIdentityHandler
{
  return self->_copyIdentityHandler;
}

- (void)setCopyIdentityHandler:(id)a3
{
}

- (id)findPeerHandler
{
  return self->_findPeerHandler;
}

- (void)setFindPeerHandler:(id)a3
{
}

- (id)savePeerHandler
{
  return self->_savePeerHandler;
}

- (void)setSavePeerHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __55__CUPairingSession__showPINBuiltInUI_useVisualPairing___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v10 = *(int **)(*(void *)(a1 + 32) + 24LL);
  int v11 = *v10;
  if (v5)
  {
    if (v11 <= 60)
    {
      id v15 = v5;
      if (v11 == -1)
      {
        BOOL v13 = _LogCategory_Initialize((uint64_t)v10, 0x3Cu);
        id v5 = v15;
        if (!v13) {
          goto LABEL_14;
        }
        uint64_t v10 = *(int **)(*(void *)(a1 + 32) + 24LL);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUPairingSession _showPINBuiltInUI:useVisualPairing:]_block_invoke",  0x3Cu,  (uint64_t)"### Show PIN dialog error: %@\n",  v6,  v7,  v8,  v9,  (char)v5);
      goto LABEL_10;
    }
  }

  else if (v11 <= 30)
  {
    id v15 = 0LL;
    if (v11 == -1)
    {
      BOOL v14 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      id v5 = 0LL;
      if (!v14) {
        goto LABEL_14;
      }
      uint64_t v10 = *(int **)(*(void *)(a1 + 32) + 24LL);
    }

    uint64_t v12 = "";
    if (a2) {
      uint64_t v12 = "(user canceled)";
    }
    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUPairingSession _showPINBuiltInUI:useVisualPairing:]_block_invoke",  0x1Eu,  (uint64_t)"Show PIN dialog ended %s\n",  v6,  v7,  v8,  v9,  (char)v12);
LABEL_10:
    id v5 = v15;
  }

uint64_t __27__CUPairingSession_tryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tryPIN:*(void *)(a1 + 40)];
}

uint64_t __33__CUPairingSession_receivedData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receivedData:*(void *)(a1 + 40) flags:0];
}

void __40__CUPairingSession_receivedMessageData___block_invoke(uint64_t a1)
{
  unsigned int v16 = -6700;
  uint64_t v2 = (__CFString *)OPACKDecodeData(*(const __CFData **)(a1 + 32), 8, &v16);
  if (!v2)
  {
    uint64_t v12 = *(void **)(a1 + 40);
    BOOL v13 = (void *)*MEMORY[0x189607670];
    if (v16) {
      uint64_t v14 = v16;
    }
    else {
      uint64_t v14 = 4294960596LL;
    }
    goto LABEL_21;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = *(void **)(a1 + 40);
    BOOL v13 = (void *)*MEMORY[0x189607670];
    uint64_t v14 = 4294960540LL;
LABEL_21:
    NSErrorF_safe(v13, (const char *)v14);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 _completed:v4];
    goto LABEL_15;
  }

  CFTypeID TypeID = CFDataGetTypeID();
  CFDictionaryGetTypedValue((const __CFDictionary *)v2, @"_pd", TypeID, 0LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    CFTypeID v5 = CFStringGetTypeID();
    CFDictionaryGetTypedValue((const __CFDictionary *)v2, @"_lc", v5, 0LL);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6) {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 160LL), v6);
    }
    CFTypeID v7 = CFStringGetTypeID();
    CFDictionaryGetTypedValue((const __CFDictionary *)v2, @"_li", v7, 0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 168LL), v8);
    }
    int Int64Ranged = CFDictionaryGetInt64Ranged((const __CFDictionary *)v2, @"_pt", 0LL, 0xFFFFFFFFLL, 0LL);
    if (Int64Ranged)
    {
      *(_DWORD *)(*(void *)(a1 + 40) + 60LL) = Int64Ranged;
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
      if (v10) {
        PairingSessionSetProperty( v10,  @"setupCodeType",  (void *)objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:"));
      }
    }

    int v11 = CFDictionaryGetInt64Ranged((const __CFDictionary *)v2, @"_pdc", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
    if (v11 >= 1) {
      *(_DWORD *)(*(void *)(a1 + 40) + 56LL) = v11;
    }
    [*(id *)(a1 + 40) _receivedData:v4 flags:0];
  }

  else
  {
    id v15 = *(void **)(a1 + 40);
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 _completed:v6];
  }

LABEL_15:
}

uint64_t __30__CUPairingSession_invalidate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  v30[1] = *MEMORY[0x1895F89C0];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 24);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUPairingSession invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v28);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }

    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v9 + 24);
      goto LABEL_3;
    }
  }

uint64_t __30__CUPairingSession_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _cleanup];
}

uint64_t __29__CUPairingSession__activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  _OWORD *a5)
{
  uint64_t v9 = (void (**)(void *, void, void *, id *))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 296LL));
  if (v9)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 length:a4];
    id v20 = 0LL;
    v9[2](v9, a2, v10, &v20);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v20;
    BOOL v13 = v12;
    if (v11)
    {
      if ([v11 length] == 64)
      {
        uint64_t v14 = (__int128 *)[v11 bytes];
        uint64_t v15 = 0LL;
        __int128 v16 = v14[3];
        __int128 v18 = *v14;
        __int128 v17 = v14[1];
        a5[2] = v14[2];
        a5[3] = v16;
        *a5 = v18;
        a5[1] = v17;
      }

      else
      {
        uint64_t v15 = 4294960553LL;
      }
    }

    else if (v12)
    {
      uint64_t v15 = NSErrorToOSStatusEx(v12, 0LL);
    }

    else
    {
      uint64_t v15 = 4294960596LL;
    }
  }

  else
  {
    uint64_t v15 = 4294960573LL;
  }

  return v15;
}

uint64_t __29__CUPairingSession__activate__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  if (v9)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 length:a4];
    BOOL v11 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a5 length:64];
    id v17 = 0LL;
    char v12 = v9[2](v9, a2, v10, v11, &v17);
    id v13 = v17;
    uint64_t v14 = v13;
    if ((v12 & 1) != 0)
    {
      uint64_t v15 = 0LL;
    }

    else if (v13)
    {
      uint64_t v15 = NSErrorToOSStatusEx(v13, 0LL);
    }

    else
    {
      uint64_t v15 = 4294960596LL;
    }
  }

  else
  {
    uint64_t v15 = 4294960573LL;
  }

  return v15;
}

uint64_t __28__CUPairingSession_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

@end