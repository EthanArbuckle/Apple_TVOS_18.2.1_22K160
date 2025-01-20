@interface PDNFCInitiatedPairingManager
- (BOOL)_canAttemptNativePairing;
- (PDNFCInitiatedPairingManager)initWithFieldDetectorManager:(id)a3 daManager:(id)a4 carKeyRequirementsChecker:(id)a5 remoteInterfacePresenter:(id)a6 assertionManager:(id)a7;
- (void)_nativelyPairToTerminalWithFieldPropertiesIfPossible:(id)a3;
- (void)_probeTerminalForPairingStatusWithCompletion:(id)a3;
- (void)_requestNativePairingWithSupportedTerminal:(id)a3;
- (void)_updateFieldDetectionState;
- (void)dealloc;
- (void)fieldDetectorManager:(id)a3 didEnterFieldWithProperties:(id)a4;
- (void)initiateNativePairingIfPossibleFromTCIs:(id)a3 brandCode:(int64_t)a4;
@end

@implementation PDNFCInitiatedPairingManager

- (PDNFCInitiatedPairingManager)initWithFieldDetectorManager:(id)a3 daManager:(id)a4 carKeyRequirementsChecker:(id)a5 remoteInterfacePresenter:(id)a6 assertionManager:(id)a7
{
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___PDNFCInitiatedPairingManager;
  v17 = -[PDNFCInitiatedPairingManager init](&v26, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_daManager, a4);
    objc_storeStrong((id *)&v18->_carKeyRequirementsChecker, a5);
    objc_storeStrong((id *)&v18->_remoteInterfacePresenter, a6);
    objc_storeStrong((id *)&v18->_assertionManager, a7);
    objc_storeStrong((id *)&v18->_fieldDetectorManager, a3);
    sub_10015B950((uint64_t)v18->_fieldDetectorManager, v18);
    id v19 = PDUtilityQueue();
    v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v19);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100322A08;
    block[3] = &unk_100639300;
    v25 = v18;
    dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v20, v21);
  }

  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDNFCInitiatedPairingManager;
  -[PDNFCInitiatedPairingManager dealloc](&v3, "dealloc");
}

- (void)initiateNativePairingIfPossibleFromTCIs:(id)a3 brandCode:(int64_t)a4
{
  id v6 = a3;
  if (-[PDCarKeyRequirementsChecker deviceSupportsCredentials]( self->_carKeyRequirementsChecker,  "deviceSupportsCredentials"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDCarKeyRequirementsChecker supportedTerminalForTCIs:brandCode:]( self->_carKeyRequirementsChecker,  "supportedTerminalForTCIs:brandCode:",  v6,  a4));
    if (v7 && -[PDNFCInitiatedPairingManager _canAttemptNativePairing](self, "_canAttemptNativePairing"))
    {
      -[PDNFCInitiatedPairingManager _requestNativePairingWithSupportedTerminal:]( self,  "_requestNativePairingWithSupportedTerminal:",  v7);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(22LL);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Pairing is not supported with the terminal with the TCIs: %@",  (uint8_t *)&v10,  0xCu);
      }
    }
  }
}

- (void)_nativelyPairToTerminalWithFieldPropertiesIfPossible:(id)a3
{
  id v4 = a3;
  if (-[PDCarKeyRequirementsChecker deviceSupportsCredentials]( self->_carKeyRequirementsChecker,  "deviceSupportsCredentials"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Checking if pairing is supported for terminal with field: %@",  buf,  0xCu);
    }

    v7 = objc_alloc(&OBJC_CLASS___NSSet);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 TCIs]);
    v9 = -[NSSet initWithArray:](v7, "initWithArray:", v8);

    if (!-[NSSet count](v9, "count")) {
      goto LABEL_17;
    }
    int v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDCarKeyRequirementsChecker supportedTerminalForTCIs:brandCode:]( self->_carKeyRequirementsChecker,  "supportedTerminalForTCIs:brandCode:",  v9,  [v4 carKeyBrandCode]));
    if (v10)
    {
      if (-[PDNFCInitiatedPairingManager _canAttemptNativePairing](self, "_canAttemptNativePairing"))
      {
        id v11 = [v4 pairingRequested];
        if (v11)
        {
          if (v11 == (id)1) {
            -[PDNFCInitiatedPairingManager _requestNativePairingWithSupportedTerminal:]( self,  "_requestNativePairingWithSupportedTerminal:",  v10);
          }
        }

        else
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472LL;
          v13[2] = sub_100322D80;
          v13[3] = &unk_100656CA0;
          v13[4] = self;
          id v14 = v9;
          -[PDNFCInitiatedPairingManager _probeTerminalForPairingStatusWithCompletion:]( self,  "_probeTerminalForPairingStatusWithCompletion:",  v13);
        }

        goto LABEL_16;
      }

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "Prevented from starting native pairing with terminal.";
        goto LABEL_14;
      }
    }

    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Pairing is not supported with the terminal";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
    }

LABEL_16:
LABEL_17:
  }
}

- (BOOL)_canAttemptNativePairing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDAssertionManager assertionsOfType:](self->_assertionManager, "assertionsOfType:", 1LL));
  id v3 = [v2 count];

  if (v3)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      id v6 = "Unable to attempt native pairing - provisioning in progress";
      v7 = (uint8_t *)&v11;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }

  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(22LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v6 = "Unable to attempt native pairing - remote interface presented";
      v7 = (uint8_t *)&v10;
      goto LABEL_7;
    }
  }

  return 0;
}

- (void)_requestNativePairingWithSupportedTerminal:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Requesting native pairing for supported terminal: %@",  buf,  0xCu);
  }

  id v7 = [[PKVehicleInitiatedPairingProxCardRequest alloc] initWithSupportedTerminal:v4 referralSource:2];
  remoteInterfacePresenter = self->_remoteInterfacePresenter;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10032303C;
  v10[3] = &unk_100639610;
  id v11 = v4;
  id v9 = v4;
  sub_1001ADAA8((uint64_t)remoteInterfacePresenter, (uint64_t)v7, (uint64_t)v10);
}

- (void)fieldDetectorManager:(id)a3 didEnterFieldWithProperties:(id)a4
{
  id v5 = a4;
  if ([v5 accessTerminalSubtype] == (id)2 && objc_msgSend(v5, "pairingRequested") != (id)2) {
    -[PDNFCInitiatedPairingManager _nativelyPairToTerminalWithFieldPropertiesIfPossible:]( self,  "_nativelyPairToTerminalWithFieldPropertiesIfPossible:",  v5);
  }
}

- (void)_updateFieldDetectionState
{
  if (!-[PDCarKeyRequirementsChecker deviceSupportsCredentials]( self->_carKeyRequirementsChecker,  "deviceSupportsCredentials"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v6 = "Requesting to disable persistent field detect - no device support for car key";
      id v7 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }

- (void)_probeTerminalForPairingStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Probing remote device for pairing status...",  v8,  2u);
    }

    daManager = self->_daManager;
    if (daManager) {
      -[PKDAManager probeTerminalForPairingStatusWithCompletion:]( daManager,  "probeTerminalForPairingStatusWithCompletion:",  v4);
    }
    else {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
    }
  }
}

- (void).cxx_destruct
{
}

@end