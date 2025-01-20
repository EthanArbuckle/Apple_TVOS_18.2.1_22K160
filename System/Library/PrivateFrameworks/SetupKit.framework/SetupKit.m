ValueMetadata *type metadata accessor for SKPlaceholder()
{
  return &type metadata for SKPlaceholder;
}

void sub_18879A4CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}
}

LABEL_8:
    -[CBAdvertiser invalidate](bleAdvertiser, "invalidate", v17, v18, v19);
    v9 = self->_bleAdvertiser;
    self->_bleAdvertiser = 0LL;

    goto LABEL_9;
  }

    objc_msgSend((id)v6, "_handleAcceptBLEConnection:", v9, v11);
    [*(id *)(a1 + 40) _update];
    v5[2](v5, 0LL);
    goto LABEL_9;
  }

  NSErrorF_safe();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v5)[2](v5, v7);

LABEL_9:
}

    objc_msgSend((id)v6, "_bleServerAcceptConnecton:", v9, v11);
    [*(id *)(a1 + 40) _run];
    v5[2](v5, 0LL);
    goto LABEL_9;
  }

  NSErrorF_safe();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v5)[2](v5, v7);

LABEL_9:
}

    objc_msgSend((id)v6, "_bleServerAcceptConnecton:", v9, v11);
    [*(id *)(a1 + 40) _run];
    v5[2](v5, 0LL);
    goto LABEL_9;
  }

  NSErrorF_safe();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v5)[2](v5, v7);

LABEL_9:
}

    objc_msgSend((id)v6, "_bleServerAcceptConnecton:", v9, v11);
    [*(id *)(a1 + 40) _run];
    v5[2](v5, 0LL);
    goto LABEL_9;
  }

  NSErrorF_safe();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v5)[2](v5, v7);

LABEL_9:
}

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v11 = self;
    LogPrintF();
  }

  self->_activateCalled = 1;
  -[SKConnection _run](self, "_run", v11, v12, v13, v14, v15, v16);
  (*((void (**)(id, void))v5 + 2))(v5, 0LL);
LABEL_13:
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

  if (objc_msgSend(v16, "isConnected", v12, v13, v14, v15)
    && !self->_networkRelayProxyInterface
    && [v6 length])
  {
    objc_storeStrong((id *)&self->_networkRelayProxyInterface, a4);
    -[SKSetupCaptiveNetworkJoinClient _run](self, "_run");
  }
}

    objc_msgSend((id)v6, "_bleServerAcceptConnecton:", v9, v11);
    [*(id *)(a1 + 40) _run];
    v5[2](v5, 0LL);
    goto LABEL_9;
  }

  NSErrorF_safe();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v5)[2](v5, v7);

LABEL_9:
}

    objc_msgSend((id)v6, "_bleServerAcceptConnecton:", v9, v11);
    [*(id *)(a1 + 40) _run];
    v5[2](v5, 0LL);
    goto LABEL_9;
  }

  NSErrorF_safe();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v5)[2](v5, v7);

LABEL_9:
}

LABEL_7:
    objc_msgSend(v11, "invalidate", v8, v10);
    goto LABEL_8;
  }

    objc_msgSend(v11, "invalidate", v8, v10);
    goto LABEL_8;
  }

    objc_msgSend(v11, "invalidate", v8, v10);
    goto LABEL_8;
  }

    objc_msgSend(v11, "invalidate", v8, v10);
    goto LABEL_8;
  }

    objc_msgSend(v11, "invalidate", v8, v10);
    goto LABEL_8;
  }

    objc_msgSend(v11, "invalidate", v8, v10);
    goto LABEL_8;
  }

LABEL_4:
  v9 = v7;
  LogPrintF();
  objc_msgSend(v11, "invalidate", v9, v5);
LABEL_8:
}

  v9 = v7;
  LogPrintF();
  objc_msgSend(v11, "invalidate", v9, v5);
LABEL_8:
}

  v9 = v7;
  LogPrintF();
  objc_msgSend(v11, "invalidate", v9, v5);
LABEL_8:
}

  v9 = v7;
  LogPrintF();
  objc_msgSend(v11, "invalidate", v9, v5);
LABEL_8:
}

  v9 = v7;
  LogPrintF();
  objc_msgSend(v11, "invalidate", v9, v5);
LABEL_8:
}

  v9 = v7;
  LogPrintF();
  objc_msgSend(v11, "invalidate", v9, v5);
LABEL_8:
}

LABEL_14:
}
}
}
}
}
}
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

void sub_18879E758( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_18879EB60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_18879F57C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_18879FD30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

LABEL_5:
}

id PBSUserPresentationServiceFunction()
{
  return (id)classPBSUserPresentationService;
}

Class initPBSUserPresentationService()
{
  if (PineBoardServicesLibrary_sOnce != -1) {
    dispatch_once(&PineBoardServicesLibrary_sOnce, &__block_literal_global_429);
  }
  Class result = objc_getClass("PBSUserPresentationService");
  classPBSUserPresentationService = (uint64_t)result;
  getPBSUserPresentationServiceClass[0] = (uint64_t (*)())PBSUserPresentationServiceFunction;
  return result;
}

id PBSUPRDialogCustomViewControllerClassNameKeyFunction()
{
  return (id)constantValPBSUPRDialogCustomViewControllerClassNameKey;
}

id initValPBSUPRDialogCustomViewControllerClassNameKey()
{
  if (PineBoardServicesLibrary_sOnce != -1) {
    dispatch_once(&PineBoardServicesLibrary_sOnce, &__block_literal_global_429);
  }
  v0 = (id *)dlsym((void *)PineBoardServicesLibrary_sLib, "PBSUPRDialogCustomViewControllerClassNameKey");
  if (v0) {
    objc_storeStrong((id *)&constantValPBSUPRDialogCustomViewControllerClassNameKey, *v0);
  }
  getPBSUPRDialogCustomViewControllerClassNameKey[0] = (uint64_t (*)())PBSUPRDialogCustomViewControllerClassNameKeyFunction;
  return (id)constantValPBSUPRDialogCustomViewControllerClassNameKey;
}

id PBSUPRDialogCustomViewServiceNameKeyFunction()
{
  return (id)constantValPBSUPRDialogCustomViewServiceNameKey;
}

id initValPBSUPRDialogCustomViewServiceNameKey()
{
  if (PineBoardServicesLibrary_sOnce != -1) {
    dispatch_once(&PineBoardServicesLibrary_sOnce, &__block_literal_global_429);
  }
  v0 = (id *)dlsym((void *)PineBoardServicesLibrary_sLib, "PBSUPRDialogCustomViewServiceNameKey");
  if (v0) {
    objc_storeStrong((id *)&constantValPBSUPRDialogCustomViewServiceNameKey, *v0);
  }
  getPBSUPRDialogCustomViewServiceNameKey[0] = (uint64_t (*)())PBSUPRDialogCustomViewServiceNameKeyFunction;
  return (id)constantValPBSUPRDialogCustomViewServiceNameKey;
}

id PBSUPRDialogTypeKeyFunction()
{
  return (id)constantValPBSUPRDialogTypeKey;
}

id initValPBSUPRDialogTypeKey()
{
  if (PineBoardServicesLibrary_sOnce != -1) {
    dispatch_once(&PineBoardServicesLibrary_sOnce, &__block_literal_global_429);
  }
  v0 = (id *)dlsym((void *)PineBoardServicesLibrary_sLib, "PBSUPRDialogTypeKey");
  if (v0) {
    objc_storeStrong((id *)&constantValPBSUPRDialogTypeKey, *v0);
  }
  getPBSUPRDialogTypeKey[0] = (uint64_t (*)())PBSUPRDialogTypeKeyFunction;
  return (id)constantValPBSUPRDialogTypeKey;
}

id PBSUPRDialogTypeCustomFunction()
{
  return (id)constantValPBSUPRDialogTypeCustom;
}

id initValPBSUPRDialogTypeCustom()
{
  if (PineBoardServicesLibrary_sOnce != -1) {
    dispatch_once(&PineBoardServicesLibrary_sOnce, &__block_literal_global_429);
  }
  v0 = (id *)dlsym((void *)PineBoardServicesLibrary_sLib, "PBSUPRDialogTypeCustom");
  if (v0) {
    objc_storeStrong((id *)&constantValPBSUPRDialogTypeCustom, *v0);
  }
  getPBSUPRDialogTypeCustom[0] = (uint64_t (*)())PBSUPRDialogTypeCustomFunction;
  return (id)constantValPBSUPRDialogTypeCustom;
}

id PBSUserPresentationRequestFunction()
{
  return (id)classPBSUserPresentationRequest;
}

Class initPBSUserPresentationRequest()
{
  if (PineBoardServicesLibrary_sOnce != -1) {
    dispatch_once(&PineBoardServicesLibrary_sOnce, &__block_literal_global_429);
  }
  Class result = objc_getClass("PBSUserPresentationRequest");
  classPBSUserPresentationRequest = (uint64_t)result;
  getPBSUserPresentationRequestClass[0] = (uint64_t (*)())PBSUserPresentationRequestFunction;
  return result;
}

void *__PineBoardServicesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/PineBoardServices.framework/PineBoardServices", 2);
  PineBoardServicesLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t __Block_byref_object_copy__70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__71(uint64_t a1)
{
}

id FLFollowUpControllerFunction()
{
  return (id)classFLFollowUpController;
}

Class initFLFollowUpController()
{
  if (CoreFollowUpLibrary_sOnce != -1) {
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_410);
  }
  Class result = objc_getClass("FLFollowUpController");
  classFLFollowUpController = (uint64_t)result;
  getFLFollowUpControllerClass = (uint64_t (*)())FLFollowUpControllerFunction;
  return result;
}

id FLFollowUpItemFunction()
{
  return (id)classFLFollowUpItem;
}

Class initFLFollowUpItem()
{
  if (CoreFollowUpLibrary_sOnce != -1) {
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_410);
  }
  Class result = objc_getClass("FLFollowUpItem");
  classFLFollowUpItem = (uint64_t)result;
  getFLFollowUpItemClass[0] = (uint64_t (*)())FLFollowUpItemFunction;
  return result;
}

id FLGroupIdentifierDeviceFunction()
{
  return (id)constantValFLGroupIdentifierDevice;
}

id initValFLGroupIdentifierDevice()
{
  if (CoreFollowUpLibrary_sOnce != -1) {
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_410);
  }
  v0 = (id *)dlsym((void *)CoreFollowUpLibrary_sLib, "FLGroupIdentifierDevice");
  if (v0) {
    objc_storeStrong((id *)&constantValFLGroupIdentifierDevice, *v0);
  }
  getFLGroupIdentifierDevice[0] = (uint64_t (*)())FLGroupIdentifierDeviceFunction;
  return (id)constantValFLGroupIdentifierDevice;
}

id FLFollowUpActionFunction()
{
  return (id)classFLFollowUpAction;
}

Class initFLFollowUpAction()
{
  if (CoreFollowUpLibrary_sOnce != -1) {
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_410);
  }
  Class result = objc_getClass("FLFollowUpAction");
  classFLFollowUpAction = (uint64_t)result;
  getFLFollowUpActionClass[0] = (uint64_t (*)())FLFollowUpActionFunction;
  return result;
}

void *__CoreFollowUpLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/CoreFollowUp.framework/CoreFollowUp", 2);
  CoreFollowUpLibrary_sLib = (uint64_t)result;
  return result;
}

void _captiveNetworkProberCallback(void *a1, CFTypeRef cf, int a3)
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 dispatchQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = ___captiveNetworkProberCallback_block_invoke;
  block[3] = &unk_18A281120;
  int v8 = a3;
  block[4] = v5;
  block[5] = a1;
  dispatch_async(v6, block);
}

void ___captiveNetworkProberCallback_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) responseHandler];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _captiveNetworkProbeResult:v1 responseHandler:v3];
}

uint64_t _captiveNetworkLoginCallback(void *a1, void *a2, int a3)
{
  id v5 = a2;
  [a1 server];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 dispatchQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = ___captiveNetworkLoginCallback_block_invoke;
  v9[3] = &unk_18A281030;
  v9[4] = v6;
  v9[5] = v5;
  int v10 = a3;
  v9[6] = a1;
  dispatch_async(v7, v9);

  return 1LL;
}

void ___captiveNetworkLoginCallback_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  [*(id *)(a1 + 48) responseHandler];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _captiveNetworkLoginInfo:v2 cookie:v3 responseHandler:v4];
}

uint64_t initDMIsMigrationNeeded()
{
  if (DataMigrationLibrary_sOnce != -1) {
    dispatch_once(&DataMigrationLibrary_sOnce, &__block_literal_global_423);
  }
  softLinkDMIsMigrationNeeded = (uint64_t (*)())dlsym( (void *)DataMigrationLibrary_sLib,  "DMIsMigrationNeeded");
  return softLinkDMIsMigrationNeeded();
}

void *__DataMigrationLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/DataMigration.framework/DataMigration", 2);
  DataMigrationLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_1887A2D98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_32:
          v6 = self->_runState;
          if (v6 == runState) {
            return;
          }
          var0 = self->_ucat->var0;
          if (var0 > 30) {
            goto LABEL_41;
          }
          if (var0 != -1) {
            goto LABEL_35;
          }
          if (_LogCategory_Initialize())
          {
            v6 = self->_runState;
LABEL_35:
            int v8 = "?";
            if (runState <= 0x1D) {
              int v8 = off_18A2812D0[runState];
            }
            v9 = "?";
            if (v6 <= 0x1D) {
              v9 = off_18A2812D0[v6];
            }
            int v10 = v8;
            v11 = v9;
            LogPrintF();
          }

LABEL_41:
          -[SKConnection _updateExternalState](self, "_updateExternalState", v10, v11);
          break;
        case 16:
        case 18:
          if (self->_stepError) {
            goto LABEL_24;
          }
LABEL_15:
          if (!self->_stepDone) {
            goto LABEL_32;
          }
LABEL_22:
          id v4 = 20;
          goto LABEL_31;
        case 17:
          -[SKConnection _clientPairSetupStartReverse](self, "_clientPairSetupStartReverse");
LABEL_20:
          id v4 = self->_runState + 1;
          goto LABEL_31;
        case 19:
          -[SKConnection _pskPrepareClientMode:](self, "_pskPrepareClientMode:", 1LL);
          if (!self->_stepError) {
            goto LABEL_22;
          }
          goto LABEL_24;
        case 20:
          if (self->_stepError) {
LABEL_24:
          }
            self->_runState = 21;
          else {
            -[SKConnection _processSends](self, "_processSends");
          }
          goto LABEL_32;
        case 21:
          if (self->_stepError)
          {
            -[SKConnection _clientError:](self, "_clientError:");
          }

          else
          {
            NSErrorF_safe();
            id v5 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKConnection _clientError:](self, "_clientError:", v5);
          }

          id v4 = 3;
          goto LABEL_31;
        default:
          goto LABEL_32;
      }
    }
  }

void sub_1887A4470( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1887A4CB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_29:
          -[SKConnection _updateExternalState](self, "_updateExternalState", v7, v8);
          break;
        case 25:
          -[SKConnection _clientPairSetupStart](self, "_clientPairSetupStart");
LABEL_11:
          id v4 = self->_runState + 1;
          goto LABEL_21;
        case 26:
          if (self->_stepError) {
            goto LABEL_20;
          }
          if (self->_stepDone) {
            goto LABEL_16;
          }
          id v4 = 26;
          goto LABEL_22;
        case 27:
          -[SKConnection _pskPrepareClientMode:](self, "_pskPrepareClientMode:", 0LL);
          if (!self->_stepError) {
            goto LABEL_16;
          }
          goto LABEL_20;
        case 28:
          if (self->_stepError) {
            goto LABEL_20;
          }
          -[SKConnection _processSends](self, "_processSends");
          id v4 = self->_runState;
          goto LABEL_22;
        case 29:
          goto LABEL_7;
        default:
          if ((_DWORD)runState) {
            return;
          }
LABEL_7:
          id v4 = 23;
          goto LABEL_21;
      }
    }
  }

LABEL_12:
    v14 = self->_ucat->var0;
    if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
    {
      v15 = [v6 length];
      CUPrintNSObjectOneLineEx();
      v25 = v15;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v25, v26);
    v13 = objc_alloc_init(MEMORY[0x18960ED80]);
    objc_storeStrong((id *)&self->_pairSetupSession, v13);
    [v13 setDispatchQueue:self->_dispatchQueue];
    [v13 setFixedPIN:self->_password];
    if (self->_conditionalPersistent)
    {
      v16 = 520LL;
    }

    else if (self->_persistentPairing)
    {
      v16 = 8LL;
    }

    else
    {
      v16 = 24LL;
    }

    [v13 setFlags:v16];
    if (self->_label) {
      label = (const __CFString *)self->_label;
    }
    else {
      label = @"SKCnx";
    }
    [v13 setLabel:label];
    [v13 setPinType:self->_passwordType];
    [v13 setSessionType:2];
    if (self->_authShowPasswordHandler)
    {
      v30[0] = v7;
      v30[1] = 3221225472LL;
      v30[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_2;
      v30[3] = &unk_18A281148;
      v30[4] = v13;
      v30[5] = self;
      [v13 setShowPINHandlerEx:v30];
    }

    else
    {
      objc_msgSend(v13, "setFlags:", objc_msgSend(v13, "flags") | 0x80);
    }

    if (self->_authHidePasswordHandler)
    {
      v29[0] = v7;
      v29[1] = 3221225472LL;
      v29[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_3;
      v29[3] = &unk_18A2820C0;
      v29[4] = v13;
      v29[5] = self;
      [v13 setHidePINHandler:v29];
    }

    v28[0] = v7;
    v28[1] = 3221225472LL;
    v28[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_4;
    v28[3] = &unk_18A2810F8;
    v28[4] = v13;
    v28[5] = self;
    [v13 setSendDataHandler:v28];
    v27[0] = v7;
    v27[1] = 3221225472LL;
    v27[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_5;
    v27[3] = &unk_18A282310;
    v27[4] = v13;
    v27[5] = self;
    [v13 setCompletionHandler:v27];
    [v13 activate];
    goto LABEL_30;
  }

  Int64 = CFDictionaryGetInt64();
  self->_reversePairing = Int64 != 0;
  if (!Int64) {
    goto LABEL_12;
  }
  uint64_t v11 = self->_ucat->var0;
  -[SKConnection _run](self, "_run");
LABEL_36:

  v8[2](v8);
  _Block_object_dispose(&v32, 8);
}
}

void sub_1887A57BC(_Unwind_Exception *a1)
{
}

LABEL_22:
  v8[2](v8);
  _Block_object_dispose(&v28, 8);
}

void sub_1887A5D90(_Unwind_Exception *a1)
{
}

void sub_1887A66E0(_Unwind_Exception *a1)
{
}

void sub_1887A6F4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

void sub_1887A7400( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
}

LABEL_13:
    objc_msgSend(v15, "responseHandler", v13, v14);
    v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    NSErrorF_safe();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void, void *))v9)[2](v9, 0LL, 0LL, v12);

    goto LABEL_14;
  }

  int v8 = self->_ucat->var0;
  if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
  {
    [v15 requestID];
    v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_14:
  }

    self->super._runState = v4;
    goto LABEL_14;
  }
}

LABEL_15:
}

      if (v5 == runState) {
        return;
      }
      var0 = self->super._ucat->var0;
    }
  }
}

void sub_1887A89A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1887A8C64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_11:
}

LABEL_20:
}

LABEL_21:
}

uint64_t __Block_byref_object_copy__229(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__230(uint64_t a1)
{
}

void sub_1887AC08C(_Unwind_Exception *a1)
{
}

LABEL_74:
            uint64_t v14 = self->_runState;
            if (v14 < 0x15)
            {
LABEL_70:
              if (((0x1FF8FFuLL >> v14) & 1) == 0) {
                goto LABEL_71;
              }
              v23 = off_18A282010[v14];
            }

            else
            {
LABEL_71:
              else {
                v23 = "User";
              }
            }

            v24 = v23;
            LogPrintF();
            goto LABEL_40;
          }

          if (self->_stepError) {
LABEL_38:
          }
            id v4 = 3;
          else {
            id v4 = 4;
          }
LABEL_39:
          self->_runState = v4;
LABEL_40:
          v15 = self->_runState;
          if (v15 == runState) {
            return;
          }
          v16 = self->_ucat->var0;
          if (v16 > 30) {
            continue;
          }
          if (v16 != -1) {
            goto LABEL_43;
          }
          if (_LogCategory_Initialize())
          {
            v15 = self->_runState;
LABEL_43:
            if (runState < 0x15 && ((0x1FF8FFuLL >> runState) & 1) != 0)
            {
              uint64_t v17 = off_18A282010[runState];
            }

            else if ((int)runState <= 9)
            {
              uint64_t v17 = "?";
            }

            else
            {
              uint64_t v17 = "User";
            }

            if (v15 < 0x15 && ((0x1FF8FFuLL >> v15) & 1) != 0)
            {
              v18 = off_18A282010[v15];
            }

            else if ((int)v15 <= 9)
            {
              v18 = "?";
            }

            else
            {
              v18 = "User";
            }

            v24 = v17;
            v25 = v18;
            LogPrintF();
          }

          break;
        default:
          goto LABEL_40;
      }
    }
  }

            uint64_t v14 = self->_runState;
            if (v14 < 0x15)
            {
LABEL_70:
              if (((0x1FF8FFuLL >> v14) & 1) == 0) {
                goto LABEL_71;
              }
              v23 = off_18A282010[v14];
            }

            else
            {
LABEL_71:
              else {
                v23 = "User";
              }
            }

            v24 = v23;
            LogPrintF();
            goto LABEL_40;
          }

          if (self->_stepError) {
LABEL_38:
          }
            id v4 = 3;
          else {
            id v4 = 4;
          }
LABEL_39:
          self->_runState = v4;
LABEL_40:
          v15 = self->_runState;
          if (v15 == runState) {
            return;
          }
          v16 = self->_ucat->var0;
          if (v16 > 30) {
            continue;
          }
          if (v16 != -1) {
            goto LABEL_43;
          }
          if (_LogCategory_Initialize())
          {
            v15 = self->_runState;
LABEL_43:
            if (runState < 0x15 && ((0x1FF8FFuLL >> runState) & 1) != 0)
            {
              uint64_t v17 = off_18A282010[runState];
            }

            else if ((int)runState <= 9)
            {
              uint64_t v17 = "?";
            }

            else
            {
              uint64_t v17 = "User";
            }

            if (v15 < 0x15 && ((0x1FF8FFuLL >> v15) & 1) != 0)
            {
              v18 = off_18A282010[v15];
            }

            else if ((int)v15 <= 9)
            {
              v18 = "?";
            }

            else
            {
              v18 = "User";
            }

            v24 = v17;
            v25 = v18;
            LogPrintF();
          }

          break;
        default:
          goto LABEL_40;
      }
    }
  }

void sub_1887AC6EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1887ACB0C(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__427(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__428(uint64_t a1)
{
}

LABEL_26:
          ++v9;
          goto LABEL_27;
        case 21:
          -[SKSetupCaptiveNetworkJoinClient _runCaptiveNetworkLoginStart](self, "_runCaptiveNetworkLoginStart");
          goto LABEL_25;
        case 22:
          if (self->_captiveNetworkLoginDone)
          {
            v9 = 23;
            goto LABEL_27;
          }

          v9 = 22;
          break;
        case 23:
          if (self->_captiveNetworkProbingSuccess)
          {
            v9 = 24;
LABEL_27:
            self->super._runState = v9;
          }

          else
          {
            v9 = 23;
          }

          break;
        case 24:
          -[SKSetupBase _completeWithError:](self, "_completeWithError:", 0LL);
          v9 = self->super._runState;
          break;
        default:
          return;
      }

      if (v9 == runState) {
        break;
      }
      var0 = self->super._ucat->var0;
    }
  }

void sub_1887AED54(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__582(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__583(uint64_t a1)
{
}

void sub_1887B0EFC(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__879(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__880(uint64_t a1)
{
}

LABEL_18:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48));
    [*(id *)(a1 + 40) _reportEventType:40];
LABEL_19:
    objc_msgSend(*(id *)(a1 + 40), "_run", v11);
    goto LABEL_20;
  }

  NSErrorF_safe();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = **(_DWORD **)(*(void *)(a1 + 40) + 144LL);
  if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48));
  [*(id *)(a1 + 40) _run];

LABEL_20:
}

id logger()
{
  if (sCUOSLogCreateOnce_logger != -1) {
    dispatch_once(&sCUOSLogCreateOnce_logger, &__block_literal_global_42);
  }
  return (id)sCUOSLogHandle_logger;
}

void __logger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.SetupKit", "SKSetupOSUpdateServer");
  uint64_t v1 = (void *)sCUOSLogHandle_logger;
  sCUOSLogHandle_logger = (uint64_t)v0;
}

void sub_1887B762C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1887B785C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_1887B7B20(_Unwind_Exception *a1)
{
}

void sub_1887B7E20(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__1431(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1432(uint64_t a1)
{
}

id SKFrameworkBundle()
{
  if (SKFrameworkBundle_sOnce != -1) {
    dispatch_once(&SKFrameworkBundle_sOnce, &__block_literal_global_1569);
  }
  return (id)SKFrameworkBundle_sBundle;
}

void __SKFrameworkBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.SetupKit"];
  uint64_t v1 = (void *)SKFrameworkBundle_sBundle;
  SKFrameworkBundle_sBundle = v0;

  if (!SKFrameworkBundle_sBundle)
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/System/Library/PrivateFrameworks/SetupKit.framework" isDirectory:1];
    if (v2)
    {
      id v5 = v2;
      uint64_t v3 = [MEMORY[0x1896077F8] bundleWithURL:v2];
      id v4 = (void *)SKFrameworkBundle_sBundle;
      SKFrameworkBundle_sBundle = v3;

      uint64_t v2 = v5;
    }
  }

id SKLocalizedString(void *a1)
{
  id v1 = a1;
  SKFrameworkBundle();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2)
  {
    id v15 = v1;
    goto LABEL_21;
  }

  [v2 localizations];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)CFPreferencesCopyValue( @"AppleLanguages",  (CFStringRef)*MEMORY[0x189605170],  @"mobile",  (CFStringRef)*MEMORY[0x189605178]);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    [MEMORY[0x189603F90] preferredLanguages];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  int v8 = v7;

  if (v4)
  {
    if (v8)
    {
      [MEMORY[0x1896077F8] preferredLocalizationsFromArray:v4 forPreferences:v8];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 firstObject];
      int v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        uint64_t v11 = [v3 pathForResource:@"Localizable" ofType:@"strings" inDirectory:@"." forLocalization:v10];
        if (v11)
        {
          v12 = (void *)v11;
          v13 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:v11];
          if (!CUIsGreenTeaDevice()
            || ([v1 stringByAppendingString:@"_GT"],
                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(),
                [v13 objectForKeyedSubscript:v14],
                id v15 = (id)objc_claimAutoreleasedReturnValue(),
                v14,
                !v15))
          {
            [v13 objectForKeyedSubscript:v1];
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }

          if (v15) {
            goto LABEL_20;
          }
        }

        else
        {
        }
      }
    }
  }

  [v1 stringByAppendingString:@"_GT"];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 localizedStringForKey:v16 value:@"_GT" table:@"Localizable"];
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if ([v15 isEqual:@"_GT"])
  {

LABEL_19:
    [v3 localizedStringForKey:v1 value:&stru_18A2823D0 table:@"Localizable"];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }

  if (!v15) {
    goto LABEL_19;
  }
LABEL_20:

LABEL_21:
  return v15;
}

void sub_1887BB09C(_Unwind_Exception *a1)
{
}

void sub_1887BB6A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1887BBBB8(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__1667(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1668(uint64_t a1)
{
}

LABEL_27:
    v12 = 0;
    goto LABEL_19;
  }

  uint64_t v11 = self->_ucat->var0;
  v12 = 1;
LABEL_19:

  return v12;
}

void sub_1887BDBF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t __Block_byref_object_copy__2067(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2068(uint64_t a1)
{
}

void __logger_block_invoke_2236()
{
  os_log_t v0 = os_log_create("com.apple.SetupKit", "SKSetupOSUpdateClient");
  uint64_t v1 = (void *)sCUOSLogHandle_logger_2218;
  sCUOSLogHandle_logger_2218 = (uint64_t)v0;
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x18960E890]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x18960E8A0]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x18960E8B0]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x18960E8C0]();
}

uint64_t CFGetInt64()
{
  return MEMORY[0x18960E8E0]();
}

uint64_t CFGetTypedObject()
{
  return MEMORY[0x18960E8E8]();
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

uint64_t CNIAmTheWebsheetApp2()
{
  return MEMORY[0x18960D5B0]();
}

uint64_t CNProberCreate()
{
  return MEMORY[0x18960D668]();
}

uint64_t CNWebsheetNotifyComplete()
{
  return MEMORY[0x18960D670]();
}

uint64_t CUAppendF()
{
  return MEMORY[0x18960E908]();
}

uint64_t CUDecodeNSErrorDictionary()
{
  return MEMORY[0x18960E910]();
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x18960E920]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x18960E930]();
}

uint64_t CUEncodeNSErrorDictionary()
{
  return MEMORY[0x18960E938]();
}

uint64_t CUFatalErrorF()
{
  return MEMORY[0x18960E948]();
}

uint64_t CUGetInterfaceAddresses()
{
  return MEMORY[0x18960E950]();
}

uint64_t CUIsGreenTeaDevice()
{
  return MEMORY[0x18960E958]();
}

uint64_t CUPrintErrorCode()
{
  return MEMORY[0x18960E988]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x18960E998]();
}

uint64_t CUPrintNSDataHex()
{
  return MEMORY[0x18960E9B8]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x18960E9C0]();
}

uint64_t CUPrintNSObject()
{
  return MEMORY[0x18960E9D0]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x18960E9E8]();
}

uint64_t CUPrintNSObjectOneLineEx()
{
  return MEMORY[0x18960E9F8]();
}

uint64_t CWFSecItemQueryPassword()
{
  return MEMORY[0x18960F018]();
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x18960EAB8]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x18960EB18]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x18960EBC8]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x18960EBD8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x18960EBF0]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x18960EC08]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x18960EC90]();
}

uint64_t NSErrorF_safe()
{
  return MEMORY[0x18960ECA8]();
}

uint64_t NSErrorNestedF()
{
  return MEMORY[0x18960ECB8]();
}

uint64_t NSErrorToOSStatus()
{
  return MEMORY[0x18960ECD0]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x18960ECE0]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x18960ECE8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x18960EDF8]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x18960EE00]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x18960EE48]();
}

uint64_t RandomString()
{
  return MEMORY[0x18960EE58]();
}

uint64_t SecondsToUpTicks()
{
  return MEMORY[0x18960EE68]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x18960EEB8]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x18960EEF0]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x18960EF40]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x18960EF50]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x18960EF58]();
}

uint64_t WiFiJoinNetwork_b()
{
  return MEMORY[0x18960EF60]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x189611858]();
}

uint64_t WiFiScan_b()
{
  return MEMORY[0x18960EF68]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x18960EF70]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t createStringFromNRLinkSubtype()
{
  return MEMORY[0x189611A48]();
}

uint64_t createStringFromNRLinkType()
{
  return MEMORY[0x189611A50]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1895FC1B8](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1895FC1E8](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t objc_msgSend__connectionStartWithSKConnection_clientMode_completeOnFailure_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__connectionStartWithSKConnection_clientMode_completeOnFailure_completion_);
}

uint64_t objc_msgSend_registerDevice_properties_operationalproperties_queue_completionBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_registerDevice_properties_operationalproperties_queue_completionBlock_);
}