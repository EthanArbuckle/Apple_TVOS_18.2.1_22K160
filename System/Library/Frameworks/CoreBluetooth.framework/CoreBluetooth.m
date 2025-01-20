LABEL_8:
      }

      v5 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v5);
  }

  return v21;
}

  if (!+[CBUtil isAppleVID:forVIDSrc:](&OBJC_CLASS___CBUtil, "isAppleVID:forVIDSrc:", v10, v8)) {
    goto LABEL_23;
  }
LABEL_9:
  if (v6 > 0x31) {
    goto LABEL_18;
  }
  if (((1LL << v6) & 0x1B0000) != 0) {
    goto LABEL_29;
  }
  if (((1LL << v6) & 0x2000023000000LL) == 0)
  {
LABEL_18:
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      v19 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      goto LABEL_20;
    }

    v19 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:
      v25 = 136446466;
      v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
      v27 = 1024;
      *(_DWORD *)v28 = v6;
      v20 = "%{public}s - Apple device type=%d (not HID or audio) - APPROVED";
      v21 = (os_log_s *)v19;
      v22 = 18;
LABEL_28:
      _os_log_impl(&dword_186F9B000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v25, v22);
    }
}

    if (var0 != -1 || _LogCategory_Initialize())
    {
      v21 = v9;
      LogPrintF_safe();
    }

    goto LABEL_15;
  }

          if (var0 != -1 || _LogCategory_Initialize())
          {
            CUPrintNSError();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();
          }

          goto LABEL_15;
        }
      }

      else
      {
      }

      v15 = self->_ucat->var0;
      if (v15 <= 60 && (v15 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();
      }

      goto LABEL_19;
    }

    var0 = self->_ucat->var0;
    if (var0 > 90) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }

  v13 = xpc_connection_send_message_with_reply_sync(self->_xpcConnection, v7);
  v14 = v13;
  if (v13)
  {
    CBXpcCreateNSDictionaryWithXpcDictionary(v13);
    v15 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    if (CBLogInitOnce == -1) {
      goto LABEL_10;
    }
LABEL_13:
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    v16 = (void *)CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
LABEL_14:
    v18 = v16;
    v19 = -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v4);
    v20 = 138412546;
    v21 = v19;
    v22 = 2112;
    v23 = v15;
    _os_log_debug_impl( &dword_186F9B000,  v18,  OS_LOG_TYPE_DEBUG,  "Received synchronous XPC reply %@: %@",  (uint8_t *)&v20,  0x16u);

    goto LABEL_11;
  }

  v15 = 0LL;
  if (CBLogInitOnce != -1) {
    goto LABEL_13;
  }
LABEL_10:
  v16 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_14;
  }
LABEL_11:

  return v15;
}

LABEL_9:
  -[CBXpcConnection _handleFinalized](self, "_handleFinalized");
LABEL_12:
}

  self->_discoveryFlags |= 0x800000000000000uLL;
  self->_changeFlags |= v7;
}

  self->_discoveryTypesInternal.bitArray[2] |= 2u;
}

LABEL_174:
  v277 = (void *)v241;
  [v4 objectForKey:@"kCBMsgArgModelIdentifier"];
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  if (v256)
  {
    -[CBClassicPeer willChangeValueForKey:](self, "willChangeValueForKey:", @"appleModelIdentifier");
    objc_storeStrong((id *)&self->_appleModelIdentifier, v256);
    -[CBClassicPeer didChangeValueForKey:](self, "didChangeValueForKey:", @"appleModelIdentifier");
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgIsConnectedOverUSB"];
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v258 = [v257 BOOLValue];

  v259 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsConnectedOverUSB"];
  if (v259)
  {
    v260 = (void *)v259;
    v261 = -[CBClassicPeer isConnectedOverUSB](self, "isConnectedOverUSB");

    if ((_DWORD)v258 != v261) {
      -[CBClassicPeer setIsConnectedOverUSB:](self, "setIsConnectedOverUSB:", v258);
    }
  }

  v279 = v212;
  v287 = 0u;
  v288 = 0u;
  v285 = 0u;
  v286 = 0u;
  v262 = -[CBClassicPeer services](self, "services", v256);
  v263 = [v262 countByEnumeratingWithState:&v285 objects:v289 count:16];
  if (v263)
  {
    v264 = v263;
    v265 = 0;
    v266 = *(void *)v286;
    do
    {
      for (i = 0LL; i != v264; ++i)
      {
        if (*(void *)v286 != v266) {
          objc_enumerationMutation(v262);
        }
        [*(id *)(*((void *)&v285 + 1) + 8 * i) objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        [v268 UUIDString];
        v269 = (void *)objc_claimAutoreleasedReturnValue();

        v265 |= [@"7221EC74-0BAD-4D01-8F77-997B2BE0722A" isEqualToString:v269];
      }

      v264 = [v262 countByEnumeratingWithState:&v285 objects:v289 count:16];
    }

    while (v264);
  }

  else
  {
    LOBYTE(v265) = 0;
  }

  -[CBClassicPeer setIsAppleAccessoryServer:](self, "setIsAppleAccessoryServer:", v265 & 1);
  [v4 objectForKeyedSubscript:@"kCBMsgArgRemotePANStatus"];
  v270 = (void *)objc_claimAutoreleasedReturnValue();

  if (v270)
  {
    [v4 objectForKeyedSubscript:@"kCBMsgArgRemotePANStatus"];
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer setPanEnabled:](self, "setPanEnabled:", [v271 BOOLValue]);
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgFileBrowsingStatus"];
  v272 = (void *)objc_claimAutoreleasedReturnValue();

  if (v272)
  {
    [v4 objectForKeyedSubscript:@"kCBMsgArgFileBrowsingStatus"];
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer setBrowsingEnabled:](self, "setBrowsingEnabled:", [v273 BOOLValue]);
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgObjectPushStatus"];
  v274 = (void *)objc_claimAutoreleasedReturnValue();

  if (v274)
  {
    [v4 objectForKeyedSubscript:@"kCBMsgArgObjectPushStatus"];
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicPeer setObjectPushEnabled:](self, "setObjectPushEnabled:", [v275 BOOLValue]);
  }
}

LABEL_13:
}
}

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CBMutableDescriptor;
  v23 = -[CBAttribute initWithUUID:](&v26, sel_initWithUUID_, v7);
  v24 = v23;
  if (v23) {
    -[CBDescriptor setValue:](v23, "setValue:", v8);
  }

  return v24;
}

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CBPeripheral;
  -[CBPeripheral dealloc](&v7, sel_dealloc);
}

        v34 = @"nil";
LABEL_14:
        v47 = v13;
        v48 = v34;
        v45 = (uint64_t)v12;
        v46 = v33;
        LogPrintF_safe();
        if (v31) {

        }
        goto LABEL_16;
      }
    }

    else if ((unint64_t)a5 <= 5)
    {
      goto LABEL_8;
    }

    v33 = "?";
    if (v31) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }

  if (self->_idsDeviceID)
  {
    if (self->_model) {
      goto LABEL_15;
    }
LABEL_21:
    [v10 model];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_storeStrong((id *)&self->_model, v9);
      self->_attributeInternalFlags |= 1u;
    }

    [v10 name];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }

  [v10 idsDeviceID];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    objc_storeStrong((id *)&self->_idsDeviceID, v8);
  }

  if (!self->_model) {
    goto LABEL_21;
  }
LABEL_15:
  [v10 name];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {
LABEL_16:
  }
    objc_storeStrong((id *)&self->_name, v7);
LABEL_17:
}

  if (a4 - v10 < 1) {
    goto LABEL_29;
  }
  v15 = *v10++;
  v14 = v15;
  v16 = v9 | 0x400;
  if (v15 >= 0) {
    v16 = v9;
  }
  v9 = v16 | ((v14 & 4) << 10);
  if ((v9 & 0x1000) == 0)
  {
LABEL_29:
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"w", 0LL);
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"x", 0LL);
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"y", 0LL);
    v22 = 0LL;
    if (v8 != self->_nearbyActivityLevel) {
      goto LABEL_30;
    }
LABEL_25:
    if (v9 != self->_nearbyInfoFlags) {
      goto LABEL_31;
    }
    goto LABEL_26;
  }

  self->_discoveryFlags |= 0x8000uLL;
  if (v16) {
LABEL_18:
  }
    self->_changeFlags |= 0x80000008000uLL;
}
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_5:
      v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
    }

    while (v10);
  }

  if ([v7 count])
  {
    v25 = @"kCBMsgArgUUIDs";
    v26 = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 63LL, v15);
    [v16 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CBCentralManager createCBPeripheralsFromIDs:](self, "createCBPeripheralsFromIDs:", v17);
    [v6 addObjectsFromArray:v18];
  }

  return (NSArray *)v6;
}

      v13 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }

    while (v13);
  }

  if ([v10 count])
  {
    v37 = @"kCBMsgArgUUIDs";
    v38 = v10;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke;
    v30[3] = &unk_189FB1928;
    v19 = (id *)v31;
    v31[0] = v9;
    v31[1] = self;
    v32 = v8;
    v20 = v8;
    v21 = v9;
    -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 63LL, v18, v30);

    v22 = v32;
  }

  else
  {
    -[CBManager getCurrentQueue](self, "getCurrentQueue");
    v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke_2;
    block[3] = &unk_189FB1950;
    v19 = &v29;
    v28 = v9;
    v29 = v8;
    v24 = v8;
    v25 = v9;
    dispatch_async(v23, block);

    v22 = v28;
  }
}

    if (v24 == ++v9)
    {
      v24 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (!v24) {
        goto LABEL_25;
      }
      goto LABEL_4;
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  v17 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBCharacteristic handleDescriptorsDiscovered:].cold.1((uint64_t)v11, (uint64_t)v25, v17);
  }

  v6 = v22;
  v18 = 0LL;
  v5 = v23;
LABEL_26:

  return v18;
}

    if (v32 == ++v11)
    {
      v32 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (!v32) {
        goto LABEL_25;
      }
      goto LABEL_4;
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBService handleIncludedServicesDiscovered:].cold.1();
  }

  v27 = 0LL;
LABEL_26:

  return v27;
}

    if (v9 == ++v10)
    {
      v9 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (!v9) {
        goto LABEL_25;
      }
      goto LABEL_4;
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBService handleCharacteristicsDiscovered:].cold.1();
  }

  v21 = 0LL;
LABEL_26:

  return v21;
}

  centralManager = self->_centralManager;
  if (centralManager)
  {
    v23 = -[CBManager sharedPairingAgent](centralManager, "sharedPairingAgent");
    v30 = v23;
    if (v23)
    {
      [v23 retrieveOOBDataForPeer:v21];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        objc_storeStrong((id *)&self->_pairingOOBData, v37);
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v39 = -[CBPeer identifier](v21, "identifier");
          CUPrintNSDataHex();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();
        }

        (*((void (**)(id, void *, void))v6 + 2))(v6, v37, 0LL);
      }

      else
      {
        v45 = CBErrorF(-6700, (uint64_t)"Generate OOB data failed", v31, v32, v33, v34, v35, v36, v47);
        v46 = (void *)v55[5];
        v55[5] = v45;
      }
    }

    else
    {
      v44 = CBErrorF(-6705, (uint64_t)"No pairing agent", v24, v25, v26, v27, v28, v29, v47);
      v37 = (void *)v55[5];
      v55[5] = v44;
    }
  }

  else
  {
    server = self->_server;
    if (server)
    {
      v49[0] = v5;
      v49[1] = 3221225472LL;
      v49[2] = __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke_2;
      v49[3] = &unk_189FB4640;
      v49[4] = self;
      v50 = v6;
      -[CBServer pairingGenerateOOBDataForPeer:completionHandler:]( server,  "pairingGenerateOOBDataForPeer:completionHandler:",  v21,  v49);
    }

    else
    {
      v41 = CBErrorF(-6700, (uint64_t)"No central or server", v15, v16, v17, v18, v19, v20, v47);
      v42 = (void *)v55[5];
      v55[5] = v41;
    }
  }

    v9 = *(uint64_t *)((char *)&v7->super.isa + *v6);
    obj = v7;
    -[CBReadRequest minLength](v7, "minLength", v21, v22, v23, v24, v25, v26);
    -[CBReadRequest maxLength](obj, "maxLength");
    Data = SocketReadDataEx();
    var0 = self->_ucat->var0;
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
    {
      socketFD = self->_socketFD;
      v12 = -[CBReadRequest minLength](obj, "minLength");
      v13 = -[CBReadRequest maxLength](obj, "maxLength");
      v14 = v6;
      v15 = *(uint64_t *)((char *)&obj->super.isa + *v6);
      CUPrintErrorCode();
      v25 = v15;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v14;
      v23 = v13;
      v24 = v9;
      v21 = socketFD;
      v22 = v12;
      LogPrintF_safe();

      p_readRequestCurrent = v28;
    }

    if (Data)
    {
      if (Data == 35)
      {
        if (self->_readSuspended)
        {
          self->_readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }

      else
      {
        NSErrorF_safe();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBConnection _abortReadsWithError:](self, "_abortReadsWithError:", v19);
      }

      v20 = obj;
      goto LABEL_18;
    }

    v16 = *(uint64_t *)((char *)&obj->super.isa + *v6);
    v17 = -[CBReadRequest bufferData](obj, "bufferData");
    [v17 setLength:v16];

    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0LL;

    -[CBConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", obj, 0LL);
    ++v4;
  }

  while (v4 != 4);
  if (self->_readSuspended)
  {
    self->_readSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_readSource);
  }

  v9 = (void *)v12[2];
  v12[2] = v6;

  [v12 completion];
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  [v12 setCompletion:0];
  if (v10) {
    v10[2](v10);
  }
}

  v12 = *((unsigned __int8 *)a3 + 8);
  if (v5 - 9 < 2)
  {
    v15 = 0;
    v25 = 0;
    goto LABEL_13;
  }

  v13 = __rev16(*(unsigned __int16 *)(a3 + 9));
  if (v5 - 11 < 2)
  {
    v15 = 0;
    v25 = 0;
    goto LABEL_14;
  }

  v25 = __rev16(*(unsigned __int16 *)(a3 + 11));
  if (v5 - 13 < 2)
  {
    v15 = 0;
    goto LABEL_14;
  }

  v14 = __rev16(*(unsigned __int16 *)(a3 + 13));
  if (v5 - 15 < 2)
  {
    v15 = 0;
  }

  else
  {
    v15 = __rev16(*(unsigned __int16 *)(a3 + 15));
    if (a4 - (a3 + 17) >= 1)
    {
      v16 = *((unsigned __int8 *)a3 + 17);
      goto LABEL_16;
    }
  }

LABEL_22:
      v18 = v13;
LABEL_27:

      goto LABEL_28;
    }

    v20 = (void *)[v4 mutableCopy];
    [v20 setObject:v11 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    [v20 setObject:0 forKeyedSubscript:@"kCBMsgArgWhbRemoteControllerId"];
    v21 = -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v20);
    [v21 setStableIdentifier:v6];
    if (CBLogInitOnce == -1)
    {
      v22 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:
        v18 = v21;

        goto LABEL_27;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      v22 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
    }

    *(_DWORD *)buf = 138412546;
    v27 = v11;
    v28 = 2112;
    v29 = v5;
    _os_log_impl( &dword_186F9B000,  v22,  OS_LOG_TYPE_DEFAULT,  "Created local peripheral:%@ successfully for device:%@",  buf,  0x16u);
    goto LABEL_26;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBCentralManager retrieveWhbCBPeripheralWithInfo:].cold.1();
  }
  v18 = 0LL;
LABEL_28:

  return v18;
}

    goto LABEL_23;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  v11 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_186F9B000, v11, OS_LOG_TYPE_DEFAULT, "No peripheral found for args %@", (uint8_t *)&v16, 0xCu);
  }

  *(_WORD *)&self->_homeKitV1CompatibleVersion = 0;
  self->_homeKitV1Flags = 0;
  self->_homeKitV1StateNumber = 0;
  self->_homeKitV1SetupHash = 0;
  if ((discoveryFlags & 0x1000000) != 0)
  {
LABEL_7:
    if ((discoveryFlags & 0x80000000000000LL) != 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }

  if (a4 - a3 <= 3) {
    v10 = 0;
  }
  if (!v10)
  {
    v15 = 0;
    if (!self->_airplayTargetIPv4) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

  v14 = *(_DWORD *)a3;
  a3 += 4;
  v15 = bswap32(v14);
  if (v15 != self->_airplayTargetIPv4)
  {
LABEL_28:
    self->_airplayTargetIPv4 = v15;
    v8 = 0x8000000000LL;
  }

  if (a4 - v5 <= 0) {
    v11 = 0;
  }
  if (!v11)
  {
    v15 = 0LL;
    if (!-[CBDevice heySiriConfidence](self, "heySiriConfidence")) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

  v16 = *(unsigned __int8 *)v5++;
  v15 = v16;
  if (v16 != -[CBDevice heySiriConfidence](self, "heySiriConfidence"))
  {
LABEL_28:
    -[CBDevice setHeySiriConfidence:](self, "setHeySiriConfidence:", v15);
    v9 = 0x400000000000000LL;
  }

  if (v14 != self->_spatialInteractionConfigFlags) {
    self->_spatialInteractionConfigFlags = v14;
  }
  if (v8 == self->_spatialInteractionFlags)
  {
    v20 = 0LL;
  }

  else
  {
    self->_spatialInteractionFlags = v8;
    v20 = 0x40000LL;
  }

  spatialInteractionIdentifiers = self->_spatialInteractionIdentifiers;
  v42 = (NSArray *)v9;
  v22 = spatialInteractionIdentifiers;
  if (v42 == v22)
  {

    v34 = v42;
  }

  else
  {
    if ((v42 == 0LL) != (v22 != 0LL))
    {
      v23 = -[NSArray isEqual:](v42, "isEqual:", v22);

      if ((v23 & 1) != 0)
      {
        spatialInteractionUWBConfigData = self->_spatialInteractionUWBConfigData;
        v25 = v12;
        v26 = spatialInteractionUWBConfigData;
        if (v25 != v26) {
          goto LABEL_31;
        }
LABEL_41:

        v37 = v25;
        goto LABEL_44;
      }
    }

    else
    {
    }

    v35 = (NSArray *)-[NSArray copy](v42, "copy");
    v34 = self->_spatialInteractionIdentifiers;
    self->_spatialInteractionIdentifiers = v35;
    v20 = 0x40000LL;
  }

  v36 = self->_spatialInteractionUWBConfigData;
  v25 = v12;
  v26 = v36;
  if (v25 == v26) {
    goto LABEL_41;
  }
LABEL_31:
  v27 = v26;
  if ((v25 == 0LL) == (v26 != 0LL))
  {

    goto LABEL_43;
  }

  v28 = -[NSData isEqual:](v25, "isEqual:", v26);

  if ((v28 & 1) == 0)
  {
LABEL_43:
    v38 = v25;
    v37 = self->_spatialInteractionUWBConfigData;
    self->_spatialInteractionUWBConfigData = v38;
    v20 = 0x40000LL;
LABEL_44:

    spatialInteractionPresenceConfigData = self->_spatialInteractionPresenceConfigData;
    v30 = v15;
    v31 = spatialInteractionPresenceConfigData;
    if (v30 != v31) {
      goto LABEL_34;
    }
LABEL_45:

    v40 = v30;
    goto LABEL_48;
  }

  v29 = self->_spatialInteractionPresenceConfigData;
  v30 = v15;
  v31 = v29;
  if (v30 == v31) {
    goto LABEL_45;
  }
LABEL_34:
  v32 = v31;
  if ((v30 == 0LL) != (v31 != 0LL))
  {
    v33 = -[NSData isEqual:](v30, "isEqual:", v31);

    if ((v33 & 1) != 0) {
      goto LABEL_49;
    }
  }

  else
  {
  }

  v41 = v30;
  v40 = self->_spatialInteractionPresenceConfigData;
  self->_spatialInteractionPresenceConfigData = v41;
  v20 = 0x40000LL;
LABEL_48:

LABEL_49:
  self->_discoveryFlags |= 0x40000uLL;
  self->_changeFlags |= v20;
}

LABEL_9:
}
}
}
}
}
}

  v12 = v7 > 0 && a4 - v5 > 0;
  if (!v12)
  {
    v13 = 0;
    goto LABEL_20;
  }

  v14 = *v5++;
  v13 = v14;
  if (v14 != -1)
  {
    if (v13 < 0)
    {
      v15 = 256;
      goto LABEL_21;
    }

    v12 = 0LL;
    goto LABEL_4;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      CBErrorF(312900, (uint64_t)"Non-dict token", v6, v7, v8, v9, v10, v11, v21);
      v12 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }

    goto LABEL_9;
  }

  v12 = v5;
LABEL_4:

  return v12;
}

LABEL_17:
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v52, 16, v39, v40, v41);
        }

        while (v28);

        v16 = v40;
        v5 = v41;
        v24 = v39;
      }

      [v11 setObject:v25 forKeyedSubscript:v24];
      v7 = v42;
      v12 = v43;
    }

    if (v44)
    {
      v35 = v45;
      v36 = (void *)v46;
      if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x40) == 0)
      {
LABEL_39:

LABEL_40:
        goto LABEL_41;
      }

      v37 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v37 setObject:v5 forKeyedSubscript:@"kCBMsgArgAdvertisementPeripheral"];
      [v37 setObject:v46 forKeyedSubscript:@"kCBMsgArgRssi"];
      [v37 setObject:v11 forKeyedSubscript:@"kCBMsgArgAdvertisementData"];
      -[NSMutableArray addObject:](self->_discoveredPeripherals, "addObject:", v37);
      if (!v7)
      {
        v38 = -[CBCentralManager delegate](self, "delegate");
        [v38 centralManager:self didDiscoverMultiplePeripherals:self->_discoveredPeripherals];

        -[NSMutableArray removeAllObjects](self->_discoveredPeripherals, "removeAllObjects");
      }

      v36 = (void *)v46;
    }

    else
    {
      -[CBCentralManager delegate](self, "delegate");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v36 = (void *)v46;
      [v37 centralManager:self didDiscoverPeripheral:v5 advertisementData:v11 RSSI:v46];
    }

    v35 = v45;
    goto LABEL_39;
  }

      goto LABEL_18;
    }
  }

  v14 = 0;
LABEL_20:

  return v14;
}

  if (a4) {
    *a4 = v8;
  }
  return result;
}

    -[CBConnection _activateXPCStart:](self, "_activateXPCStart:", 0LL);
    goto LABEL_18;
  }

  v12 = NSErrorF_safe();
  v10 = (id)v18[5];
  v18[5] = v12;
LABEL_16:

LABEL_18:
  v6[2](v6);

  _Block_object_dispose(&v17, 8);
}

  v13[2](v13);
  _Block_object_dispose(&v54, 8);
}

    v20 = 0LL;
    goto LABEL_11;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (a4)
    {
      v22 = "XPC non-dict";
      goto LABEL_16;
    }

    goto LABEL_17;
  }

  if (xpc_dictionary_get_string(v6, "btAddress"))
  {
    v25 = 0;
    v24 = 0;
    if (!TextToHardwareAddress())
    {
      v14 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v24 length:6];
      btAddressData = v13->_btAddressData;
      v13->_btAddressData = (NSData *)v14;
    }
  }

  string = xpc_dictionary_get_string(v6, "deviceID");
  if (string)
  {
    v17 = [NSString stringWithUTF8String:string];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v17;
  }

  int64 = xpc_dictionary_get_int64(v6, "deviceClass");
  v20 = v13;
LABEL_11:

  return v20;
}

  if (a4 - v10 < 3) {
    goto LABEL_29;
  }
  v17 = v10[1] & 0x7F;
  if (v17 >= 0x64) {
    v17 = 100;
  }
  v18 = *v10;
  v19 = (double)v17 / 100.0;
  v20 = v10[2] & 0xF;
  -[CBDevice nearbyInfoStatusProgress](self, "nearbyInfoStatusProgress");
  if (v19 != v21)
  {
    -[CBDevice setNearbyInfoStatusProgress:](self, "setNearbyInfoStatusProgress:", v19);
    v22 = 64LL;
    v23 = v18 & 0x1F;
    if ((_DWORD)v20 == -[CBDevice nearbyInfoStatusTime](self, "nearbyInfoStatusTime")) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  v22 = 0LL;
  v23 = v18 & 0x1F;
  if ((_DWORD)v20 != -[CBDevice nearbyInfoStatusTime](self, "nearbyInfoStatusTime"))
  {
LABEL_22:
    -[CBDevice setNearbyInfoStatusTime:](self, "setNearbyInfoStatusTime:", v20);
    v22 = 64LL;
  }

LABEL_41:
}
  v27 = -[CBSpatialInteractionSession presenceConfigData](self, "presenceConfigData");
  [v4 presenceConfigData];
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v29 = v27;
  v30 = v29;
  if (v28 == v29)
  {

    v36 = v30;
  }

  else
  {
    if ((v29 != 0LL) != (v28 == 0LL))
    {
      v31 = [v28 isEqual:v29];

      if ((v31 & 1) != 0)
      {
        v32 = [v4 scanRate];
        scanRate = self->_scanRate;
        if (v32 == scanRate) {
          goto LABEL_45;
        }
        goto LABEL_51;
      }
    }

    else
    {
    }

    [v4 presenceConfigData];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v37 = v9;

    objc_msgSend(v4, "presenceConfigData", v30, v64);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSpatialInteractionSession setPresenceConfigData:](self, "setPresenceConfigData:", v36);
    v7 = 1;
    v9 = v37;
  }

  v38 = [v4 scanRate];
  scanRate = self->_scanRate;
  if (v38 == scanRate)
  {
LABEL_45:
    v34 = [v4 scanRateScreenOff];
    scanRateScreenOff = self->_scanRateScreenOff;
    if (v34 == scanRateScreenOff) {
      goto LABEL_89;
    }
    goto LABEL_70;
  }

LABEL_23:
}

    LOBYTE(v14) = 1;
    goto LABEL_24;
  }

  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    v13 = (os_log_s *)CBLogComponent;
    LOBYTE(v14) = 0;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    goto LABEL_9;
  }

  v13 = (os_log_s *)CBLogComponent;
  LOBYTE(v14) = 0;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
LABEL_9:
    v21 = 136446210;
    v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
    _os_log_impl(&dword_186F9B000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s - Mouse - REJECTED", (uint8_t *)&v21, 0xCu);
    LOBYTE(v14) = 0;
  }

    v24 = 0LL;
    goto LABEL_15;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (a4)
    {
      v26 = "XPC non-dict";
      goto LABEL_20;
    }

    goto LABEL_23;
  }

  string = xpc_dictionary_get_string(v6, "deviceID");
  if (string)
  {
    v15 = string;
    v16 = objc_alloc(MEMORY[0x189607AB8]);
    [NSString stringWithUTF8String:v15];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = [v16 initWithUUIDString:v17];
    blePeerUUID = v13->_blePeerUUID;
    v13->_blePeerUUID = (NSUUID *)v18;

    if (!v13->_blePeerUUID)
    {
      if (a4)
      {
        [NSString stringWithUTF8String:v15];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        CBErrorF(-6705, (uint64_t)"Bad peer ID: %@", v28, v29, v30, v31, v32, v33, (uint64_t)v27);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_23;
    }
  }

  int64 = xpc_dictionary_get_int64(v6, "psm");
  v21 = xpc_dictionary_get_value(v6, "socketFD");
  v22 = (void *)v21;
  if (v21)
  {
    if (MEMORY[0x18959FCE0](v21) == MEMORY[0x1895F9270])
    {
      v13->_socketFD = xpc_fd_dup(v22);
    }

    else
    {
      var0 = v13->_ucat->var0;
    }
  }

  v24 = v13;

LABEL_15:
  return v24;
}

  homeKitV2AuthTagData = self->_homeKitV2AuthTagData;
  self->_homeKitV2AuthTagData = 0LL;

  *(_DWORD *)&self->_homeKitV2InstanceID = 0;
  self->_homeKitV2Value = 0LL;
  if ((discoveryFlags & 0x80000000000000LL) != 0)
  {
LABEL_8:
    if ((discoveryFlags & 0x5030800010083E37LL) != 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }

      nearbyActionAuthTag = self->_nearbyActionAuthTag;
      v22 = (NSData *)obj;
      v23 = nearbyActionAuthTag;
      if (v22 == v23)
      {

        v26 = v51;
        if ((v49[0] & 1) == 0) {
          goto LABEL_56;
        }
      }

      else
      {
        v24 = v23;
        if ((v22 == 0LL) != (v23 != 0LL))
        {
          v25 = -[NSData isEqual:](v22, "isEqual:", v23);

          if ((v25 & 1) != 0) {
            goto LABEL_26;
          }
        }

        else
        {
        }

        objc_storeStrong((id *)&self->_nearbyActionAuthTag, obj);
        v15 |= v14;
        v26 = v51;
        if ((v49[0] & 1) == 0) {
          goto LABEL_56;
        }
      }

  self->_discoveryFlags |= v8;
  self->_changeFlags |= v9;
}

  if ((_DWORD)v23 == -[CBDevice nearbyInfoStatusType](self, "nearbyInfoStatusType"))
  {
    if (v8 != self->_nearbyActivityLevel) {
      goto LABEL_30;
    }
    goto LABEL_25;
  }

  -[CBDevice setNearbyInfoStatusType:](self, "setNearbyInfoStatusType:", v23);
  v22 = 64LL;
  if (v8 == self->_nearbyActivityLevel) {
    goto LABEL_25;
  }
LABEL_30:
  self->_nearbyActivityLevel = v8;
  v22 = 64LL;
  if (v9 != self->_nearbyInfoFlags)
  {
LABEL_31:
    self->_nearbyInfoFlags = v9;
    v22 |= 0x40uLL;
    if ((v9 & 0x40) == 0) {
      goto LABEL_39;
    }
    goto LABEL_32;
  }

LABEL_16:
}

      v29[5] = v10;
      NSAppendPrintF_safe();
      v11 = v10;

      v10 = v11;
      goto LABEL_17;
    }
  }

  else
  {
    v31[10] = 0LL;
    [(id)objc_opt_class() description];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v6 = (__CFString *)0LL;

    if (v4 > 0x14) {
      goto LABEL_3;
    }
  }

  connectionHandle = self->_connectionHandle;
  if (self->_btBand)
  {
    v31[9] = v6;
    NSAppendPrintF_safe();
    v16 = v6;

    connectionHandle = self->_connectionHandle;
    v6 = v16;
  }

  if (connectionHandle)
  {
    v31[8] = v6;
    NSAppendPrintF_safe();
    v17 = v6;

    v6 = v17;
  }

  if (self->_core0TargetPower)
  {
    v31[7] = v6;
    NSAppendPrintF_safe();
    v18 = v6;

    v6 = v18;
  }

  if (self->_core1TargetPower)
  {
    v31[6] = v6;
    NSAppendPrintF_safe();
    v19 = v6;

    v6 = v19;
  }

  if (self->_currentPCAP)
  {
    v31[5] = v6;
    NSAppendPrintF_safe();
    v20 = v6;

    v6 = v20;
  }

  if (self->_identifier)
  {
    v31[4] = v6;
    NSAppendPrintF_safe();
    v21 = v6;

    v6 = v21;
  }

  if (self->_rssi)
  {
    v31[3] = v6;
    NSAppendPrintF_safe();
    v22 = v6;

    v6 = v22;
  }

  if (self->_sniffInterval)
  {
    v31[2] = v6;
    NSAppendPrintF_safe();
    v23 = v6;

    v6 = v23;
  }

  if (self->_txPower)
  {
    v31[1] = v6;
    NSAppendPrintF_safe();
    v24 = v6;

    v6 = v24;
  }

  if (self->_txPowerMax)
  {
    v31[0] = v6;
    v15 = (id *)v31;
    goto LABEL_48;
  }

  self->_pairingType = a5;
  if (a5)
  {
    if (a5 == 5)
    {
      if (v31)
      {
        v35 = self->_ucat->var0;
        if (v35 <= 30 && (v35 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSDataHex();
          v46 = "OOB";
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (uint64_t)v12;
          LogPrintF_safe();
        }

        v63 = @"kCBMsgArgPairingData";
        v64[0] = v31;
        objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1, v45, v46, v47, v48);
        v36 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        [v49 respondToPairingRequest:v50 type:5 accept:1 data:v36];
        goto LABEL_44;
      }

      v41 = CBErrorF(-6745, (uint64_t)"No OOB data", v25, v26, v27, v28, v29, v30, v45);
LABEL_34:
      v36 = (void (**)(void, void))v56[5];
      v56[5] = v41;
LABEL_44:

      goto LABEL_47;
    }

    if ((unint64_t)a5 > 4 || ((1LL << a5) & 0x16) == 0)
    {
      v41 = CBErrorF(-6735, (uint64_t)"Unsupported pairing type", v25, v26, v27, v28, v29, v30, v45);
      goto LABEL_34;
    }

    v38 = (void (**)(void, void))MEMORY[0x18959F890](self->_pairingPromptHandler);
    if (v38)
    {
      v39 = objc_alloc_init(&OBJC_CLASS___CBPairingInfo);
      -[CBPairingInfo setDevice:](v39, "setDevice:", self->_peerDevice);
      -[CBPairingInfo setPairingType:](v39, "setPairingType:", a5);
      else {
        objc_msgSend(NSString, "stringWithFormat:", @"%06d", objc_msgSend(v13, "intValue"));
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBPairingInfo setPin:](v39, "setPin:", v42);

      ((void (**)(void, CBPairingInfo *))v38)[2](v38, v39);
    }

    if (a5 == 1 && (self->_connectionFlags & 0x200) != 0)
    {
      v43 = self->_ucat->var0;
      if (v43 <= 30 && (v43 != -1 || _LogCategory_Initialize()))
      {
        v45 = (uint64_t)v12;
        v46 = "Display";
        LogPrintF_safe();
      }

      if (v13)
      {
        v61 = @"kCBMsgArgPairingPasskey";
        v62 = v13;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        v36 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v36 = (void (**)(void, void))MEMORY[0x189604A60];
      }

      objc_msgSend(v49, "respondToPairingRequest:type:accept:data:", v50, 1, 1, v36, v45, v46, v47, v48);
      goto LABEL_44;
    }
  }

  else
  {
    if ((self->_connectionFlags & 0x80) == 0)
    {
      v36 = (void (**)(void, void))MEMORY[0x18959F890](self->_pairingPromptHandler);
      if (v36)
      {
        v37 = objc_alloc_init(&OBJC_CLASS___CBPairingInfo);
        -[CBPairingInfo setDevice:](v37, "setDevice:", self->_peerDevice);
        -[CBPairingInfo setPairingType:](v37, "setPairingType:", 0LL);
        ((void (**)(void, CBPairingInfo *))v36)[2](v36, v37);
      }

      goto LABEL_44;
    }

    v40 = self->_ucat->var0;
    if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      objc_msgSend( v49,  "respondToPairingRequest:type:accept:data:",  v50,  0,  1,  MEMORY[0x189604A60],  v12,  "JustWorks",  v47,  v48);
    }

    else
    {
      objc_msgSend( v49,  "respondToPairingRequest:type:accept:data:",  v50,  0,  1,  MEMORY[0x189604A60],  v45,  v46,  v47,  v48);
    }
  }

  [v10 idsDeviceID];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    objc_storeStrong((id *)&self->_idsDeviceID, v8);
  }

  if (!self->_model) {
    goto LABEL_19;
  }
LABEL_6:
  [v10 name];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
LABEL_7:
  }
    objc_storeStrong((id *)&self->_name, v5);
LABEL_8:
}

LABEL_7:
}

  -[CBXpcConnection getEventQueue](self->_connection, "getEventQueue");
  v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = *((void *)v13 + 399);
  block[2] = __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke;
  block[3] = &unk_189FB4D10;
  v25 = v11;
  dispatch_async(v15, block);

LABEL_8:
  if (v10) {
    v16 = v10;
  }
  else {
    v16 = &stru_189FB61A8;
  }
  v26[0] = @"kCBMsgArgResourceKey";
  v26[1] = @"kCBMsgArgResourceSubKey";
  v27[0] = v9;
  v27[1] = v16;
  [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:v26 count:2];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = *((void *)v13 + 399);
  v22[2] = __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke_70;
  v22[3] = &unk_189FB1978;
  v23 = v11;
  v18 = v11;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 28LL, v17, v22);
}
}

LABEL_12:
  if ((*((_BYTE *)&self->_delegateFlags + 2) & 2) != 0)
  {
    [MEMORY[0x189607870] errorWithInfo:v4];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CBCentralManager delegate](self, "delegate");
    [v12 centralManager:self didFailToScanWithError:v11];
  }
}

  objc_opt_class();
  v17 = v13;
LABEL_14:

  return v17;
}
          v6 = -[CBPeer manager](self, "manager");
          [v6 cancelPeripheralConnection:self];

          goto LABEL_13;
        }
      }

      else
      {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
      }

      -[CBPeripheral dealloc].cold.2();
      goto LABEL_8;
    }
  }

    v14 = 0LL;
    goto LABEL_7;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }

    goto LABEL_12;
  }

  v14 = v7;
LABEL_7:

  return v14;
}

void OUTLINED_FUNCTION_1_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_2_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_186FAE174(_Unwind_Exception *a1)
{
}

void sub_186FAE64C(_Unwind_Exception *a1)
{
}

LABEL_6:
  _Block_object_dispose(&v21, 8);
}

  _Block_object_dispose(&v21, 8);
}

  CFPreferencesSetAppValue(a3, MutableCopy, @"com.apple.MobileBluetooth.debug");
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
}

  -[CBService peripheral](v8, "peripheral");
  v9 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
  {
    v10 = (void *)MEMORY[0x189603FC8];
    if (v7) {
      v11 = v7;
    }
    else {
      v11 = (NSArray *)MEMORY[0x189604A58];
    }
    v12 = -[CBService startHandle](v8, "startHandle");
    v13 = -[CBService endHandle](v8, "endHandle");
    objc_msgSend( v10,  "dictionaryWithObjectsAndKeys:",  v11,  @"kCBMsgArgUUIDs",  v12,  @"kCBMsgArgServiceStartHandle",  v13,  @"kCBMsgArgServiceEndHandle",  0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 187LL, v14);
  }

  else
  {
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      goto LABEL_9;
    }

    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
LABEL_9:
    }
      -[CBPeripheral discoverIncludedServices:forService:].cold.1();
  }

  -[CBService peripheral](v8, "peripheral");
  v9 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
  {
    v10 = (void *)MEMORY[0x189603FC8];
    if (v7) {
      v11 = v7;
    }
    else {
      v11 = (NSArray *)MEMORY[0x189604A58];
    }
    v12 = -[CBService startHandle](v8, "startHandle");
    v13 = -[CBService endHandle](v8, "endHandle");
    objc_msgSend( v10,  "dictionaryWithObjectsAndKeys:",  v11,  @"kCBMsgArgUUIDs",  v12,  @"kCBMsgArgServiceStartHandle",  v13,  @"kCBMsgArgServiceEndHandle",  0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 188LL, v14);
  }

  else
  {
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      goto LABEL_9;
    }

    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
LABEL_9:
    }
      -[CBPeripheral discoverIncludedServices:forService:].cold.1();
  }

  -[CBCharacteristic peripheral](v5, "peripheral");
  v6 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v7 = (void *)MEMORY[0x189603FC8];
    v8 = -[CBCharacteristic handle](v5, "handle");
    v9 = -[CBCharacteristic valueHandle](v5, "valueHandle");
    objc_msgSend( v7,  "dictionaryWithObjectsAndKeys:",  v8,  @"kCBMsgArgCharacteristicHandle",  v9,  @"kCBMsgArgCharacteristicValueHandle",  0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 191LL, v10);

    goto LABEL_11;
  }

  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
LABEL_9:
  }
    -[CBPeripheral readValueForCharacteristic:].cold.1();
LABEL_11:
}

  -[CBCharacteristic peripheral](v5, "peripheral");
  v6 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v7 = (void *)MEMORY[0x189603FC8];
    v8 = -[CBCharacteristic handle](v5, "handle");
    v9 = -[CBCharacteristic valueHandle](v5, "valueHandle");
    objc_msgSend( v7,  "dictionaryWithObjectsAndKeys:",  v8,  @"kCBMsgArgCharacteristicHandle",  v9,  @"kCBMsgArgCharacteristicValueHandle",  0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 195LL, v10);

    goto LABEL_11;
  }

  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
LABEL_9:
  }
    -[CBPeripheral readValueForCharacteristic:].cold.1();
LABEL_11:
}

  -[CBDescriptor peripheral](v5, "peripheral");
  v6 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v7 = (void *)MEMORY[0x189603FC8];
    v8 = -[CBDescriptor handle](v5, "handle");
    objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"kCBMsgArgDescriptorHandle", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 201LL, v9);

    goto LABEL_11;
  }

  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
LABEL_9:
  }
    -[CBPeripheral readValueForDescriptor:].cold.1();
LABEL_11:
}

  v15 = v7;
LABEL_8:

  return v15;
}
}
}
}
}

  objc_msgSend(*(id *)(v4 + 32), "didReceiveForwardedMessageForCBManager:", v3, v7, v8);
}

    return;
  }

  v14 = [v4 bleScanRate];
  bleScanRate = self->_bleScanRate;
  if (v14 == bleScanRate)
  {
    v16 = [v4 bleScanRateScreenOff];
    bleScanRateScreenOff = self->_bleScanRateScreenOff;
    if (v16 == bleScanRateScreenOff) {
      goto LABEL_47;
    }
    goto LABEL_28;
  }

  v18 = "Default";
  switch(bleScanRate)
  {
    case 0:
      break;
    case 10:
      v18 = "Periodic";
      break;
    case 20:
      v18 = "Background";
      break;
    case 30:
      v18 = "Low";
      break;
    case 35:
      v18 = "MediumLow";
      break;
    case 40:
      v18 = "Medium";
      break;
    case 50:
      v18 = "High";
      break;
    case 60:
      v18 = "Max";
      break;
    default:
      v18 = "?";
      break;
  }

  v19 = [v4 bleScanRate];
  v20 = "Default";
  switch(v19)
  {
    case 0:
      break;
    case 10:
      v20 = "Periodic";
      break;
    case 20:
      v20 = "Background";
      break;
    case 30:
      v20 = "Low";
      break;
    case 35:
      v20 = "MediumLow";
      break;
    case 40:
      v20 = "Medium";
      break;
    case 50:
      v20 = "High";
      break;
    case 60:
      v20 = "Max";
      break;
    default:
      v20 = "?";
      break;
  }

  v129 = v20;
  CUAppendF();
  v21 = v9;

  self->_bleScanRate = objc_msgSend(v4, "bleScanRate", v18, v129);
  v7 = 1;
  v9 = v21;
  v22 = [v4 bleScanRateScreenOff];
  bleScanRateScreenOff = self->_bleScanRateScreenOff;
  if (v22 != bleScanRateScreenOff)
  {
LABEL_28:
    v23 = "Default";
    switch(bleScanRateScreenOff)
    {
      case 0:
        break;
      case 10:
        v23 = "Periodic";
        break;
      case 20:
        v23 = "Background";
        break;
      case 30:
        v23 = "Low";
        break;
      case 35:
        v23 = "MediumLow";
        break;
      case 40:
        v23 = "Medium";
        break;
      case 50:
        v23 = "High";
        break;
      case 60:
        v23 = "Max";
        break;
      default:
        v23 = "?";
        break;
    }

    v24 = [v4 bleScanRateScreenOff];
    v25 = "Default";
    switch(v24)
    {
      case 0:
        break;
      case 10:
        v25 = "Periodic";
        break;
      case 20:
        v25 = "Background";
        break;
      case 30:
        v25 = "Low";
        break;
      case 35:
        v25 = "MediumLow";
        break;
      case 40:
        v25 = "Medium";
        break;
      case 50:
        v25 = "High";
        break;
      case 60:
        v25 = "Max";
        break;
      default:
        v25 = "?";
        break;
    }

    v130 = v25;
    CUAppendF();
    v26 = v9;

    self->_bleScanRateScreenOff = objc_msgSend(v4, "bleScanRateScreenOff", v23, v130);
    v7 = 1;
    v9 = v26;
  }
}

void sub_186FAEC28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FAEC44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
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

void sub_186FAEFB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FAEFD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FAF31C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FAF338( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FAF664( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FAF680( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FAF9CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FAF9E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FAFD14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FAFD30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB00B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB00D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB0440( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB045C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB0788( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB07A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB0B10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB0B2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB0E28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB0E40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB10D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB10EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FB142C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_186FB1444( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_186FB17BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_186FB17D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_186FB1B0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_186FB1E84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

const char *CBUseCaseToString(int a1)
{
  if (a1 >= 0x20000)
  {
    if (a1 >= 327680)
    {
      if (a1 > 589824)
      {
        if (a1 <= 2147418111)
        {
          switch(a1)
          {
            case 589825:
              return "FindNearbyPencil";
            case 655360:
              return "AccessDigitalHomeKey";
            case 786432:
              return "ProxControlDeviceClose";
            default:
              return "?";
          }
        }

        else
        {
          switch(a1)
          {
            case 2147418112:
              result = "InternalTestNoLockScan";
              break;
            case 2147418113:
              result = "InternalTestNoScreenOffScan";
              break;
            case 2147418114:
              result = "InternalTestScanWithNoDups";
              break;
            case 2147418115:
              result = "InternalTestScanWithDups";
              break;
            case 2147418116:
              result = "InternalTestScanFor20Seconds";
              break;
            case 2147418117:
              result = "InternalTestActiveScan";
              break;
            case 2147418118:
              result = "InternalTestUUIDScan";
              break;
            case 2147418119:
              result = "InternalTestScanFor10ClockSeconds";
              break;
            case 2147418120:
              result = "InternalTestScanBoost";
              break;
            default:
              return "?";
          }
        }
      }

      else if (a1 > 458752)
      {
        switch(a1)
        {
          case 524288:
            result = "ADPD";
            break;
          case 524289:
            result = "ADPDBuffer";
            break;
          case 524290:
            result = "MicroLocation";
            break;
          case 524291:
            result = "MicroLocationLeech";
            break;
          default:
            if (a1 == 458753)
            {
              result = "PrecisionFindingFindee";
            }

            else
            {
              if (a1 != 589824) {
                return "?";
              }
              result = "FindNearbyRemote";
            }

            break;
        }
      }

      else
      {
        switch(a1)
        {
          case 393216:
            result = "CaptiveNetworkJoin";
            break;
          case 393217:
            result = "UseCaseSIMTransfer";
            break;
          case 393218:
            result = "MacSetup";
            break;
          case 393219:
            result = "AppleIDSignIn";
            break;
          case 393220:
            result = "AppleIDSignInSettings";
            break;
          default:
            if (a1 == 327680)
            {
              result = "RapportThirdParty";
            }

            else
            {
              if (a1 != 458752) {
                return "?";
              }
              result = "PrecisionFindingFinder";
            }

            break;
        }
      }
    }

    else
    {
      switch(a1)
      {
        case 131072:
          return "SharingDefault";
        case 131073:
          return "SharingPhoneAutoUnlock";
        case 131074:
          return "SharingSiriWatchAuth";
        case 131075:
          return "SharingMacAutoUnlock";
        case 131076:
          return "SharingEDTScreenOn";
        case 131077:
          return "SharingEDTWiFiDisabled";
        case 131078:
          return "SharingEDTWombatEligibleAsDefaultCamera";
        case 131079:
          return "SharingEDTWombatCameraPicker";
        case 131080:
          return "SharingWombatBackground";
        case 131081:
          return "SharingUniversalControl";
        case 131082:
          return "SharingPeopleProximity";
        case 131083:
          return "SharingEDTEnsembleOpenDisplayPrefs";
        case 131084:
          return "SharingEDTNearbydMotionStopped";
        case 131085:
          return "SharingDoubleBoostGenericScan";
        case 131086:
          return "SharingEDTIncomingAdvertisement ";
        case 131087:
          return "SharingEDTWombatStreamStart";
        case 131088:
          return "SharingOYAutoUnlock";
        case 131089:
          return "?";
        case 131090:
          return "SharingAirDrop";
        case 131091:
          return "SharingNearbyInvitationHost";
        case 131092:
          return "SharingNearbyInvitationParticipant";
        case 131093:
          return "SharingAirDropAskToAirDrop";
        case 131094:
          return "SharingAirDropTempIdentity";
        case 131095:
          return "SharingAirDropNeedsCLink";
        case 131096:
          return "SharingRemoteWidgetUpdate";
        case 131097:
          return "SharingCountryCodeUpdate";
        case 131098:
          return "SharingMacPhoneAutoUnlock";
        case 131099:
          return "SharingVisionProDiscovery";
        case 131100:
          return "SharingVisionProStateChange";
        case 131101:
          return "SharingContinuityScreen";
        case 131102:
          return "SharingEDTRemoteDisplay";
        default:
          if (a1 == 196608)
          {
            result = "DigitalIDTSA";
          }

          else
          {
            if (a1 != 0x40000) {
              return "?";
            }
            result = "DigitalCarKeyThirdParty";
          }

          break;
      }
    }
  }

  else
  {
    result = "Unspecified";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = "HealthKit";
        break;
      case 2:
        result = "HomeKit";
        break;
      case 3:
        result = "FindMyObjectConnection";
        break;
      case 4:
        result = "FindMyObjectConnectionTransient";
        break;
      case 5:
        result = "MIDI";
        break;
      case 6:
        result = "Continuity";
        break;
      case 7:
        result = "InstantHotSpot";
        break;
      case 8:
        result = "NearBy";
        break;
      case 9:
        result = "Sharing";
        break;
      case 10:
        result = "HearingSupport";
        break;
      case 11:
        result = "Magnet";
        break;
      case 12:
        result = "HID";
        break;
      case 13:
        result = "LEA";
        break;
      case 14:
        result = "External";
        break;
      case 15:
        result = "ExternalMedical";
        break;
      case 16:
        result = "ExternalLock";
        break;
      case 17:
        result = "ExternalWatch";
        break;
      case 18:
        result = "SmartRouting";
        break;
      case 19:
        result = "DigitalID";
        break;
      case 20:
        result = "DigitalKey";
        break;
      case 21:
        result = "DigitalCarKey";
        break;
      case 22:
        result = "HeySiri";
        break;
      case 23:
        result = "ThirdPartyApp";
        break;
      case 24:
        result = "CNJ";
        break;
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
      case 261:
      case 262:
        return "?";
      case 256:
        result = "DevicePresenceDetection";
        break;
      case 257:
        result = "AudioBox";
        break;
      case 258:
        result = "SIMTransfer";
        break;
      case 259:
        result = "ProximityScreenOnLeechScan";
        break;
      case 260:
        result = "MacMigrate";
        break;
      case 263:
        result = "HIDUARTService";
        break;
      case 264:
        result = "AccessibilitySwitchControlPairing";
        break;
      case 265:
        result = "BaseBandFastConnect";
        break;
      case 266:
        result = "SafetyAlerts";
        break;
      case 267:
        result = "LECarPlay";
        break;
      case 268:
        result = "TCCBluetooth";
        break;
      case 269:
        result = "AOPBufferLeech";
        break;
      default:
        switch(a1)
        {
          case 65536:
            result = "FindMyAction";
            break;
          case 65537:
            result = "FindMyBackground";
            break;
          case 65538:
            result = "FindMyActionHELE";
            break;
          case 65539:
            result = "FindMyBackgroundHELE";
            break;
          case 65540:
            result = "FindMyActionTransient";
            break;
          case 65541:
            result = "FindMyBackgroundTransient";
            break;
          case 65542:
            result = "FindMyActionHELETransient";
            break;
          case 65543:
            result = "FindMyBackgroundHELETransient";
            break;
          case 65544:
            result = "FindMyNotOptedIn";
            break;
          case 65545:
            result = "FindMyOptedIn";
            break;
          case 65546:
            result = "FindMySepAlertsEnabled";
            break;
          case 65547:
            result = "FindMyTemporaryAggressiveLegacy";
            break;
          case 65548:
            result = "FindMyTemporaryLongAggressive";
            break;
          case 65549:
            result = "FindMyBTFindingUserInitiated";
            break;
          case 65550:
            result = "FindMyHELE";
            break;
          case 65551:
            result = "FindMyBeaconOnDemand";
            break;
          case 65552:
            result = "FindMyWildTimedScan";
            break;
          case 65553:
            result = "FindMyBackgroundLeechScan";
            break;
          case 65554:
            result = "FindMySnifferMode";
            break;
          case 65555:
            result = "FindMyUnpair";
            break;
          case 65556:
            result = "FindMyUnpairHELE";
            break;
          case 65557:
            result = "FindMyPlaySound";
            break;
          case 65558:
            result = "FindMyPlaySoundHELE";
            break;
          case 65559:
            result = "FindMyNotOptedInBeepOnMoveWaking";
            break;
          case 65560:
            result = "FindMyUTTransient";
            break;
          case 65561:
            result = "FindMyUTHELETransient";
            break;
          default:
            return "?";
        }

        break;
    }
  }

  return result;
}

const char *CBNearbyActionTypeToString(unsigned int a1)
{
  if (a1 > 0x58) {
    return "?";
  }
  else {
    return off_189FB2348[(char)a1];
  }
}

LABEL_55:
  v61 = v21;
  v350 = enableEPAForLEAdvertisement;
  v405 = v21;
  CUAppendF();
  v62 = v10;

  self->_enableEPAForLEAdvertisement = v61;
  v7 = 1;
  v10 = v62;
  v23 = objc_msgSend(v4, "airdropFlags", v350, v405);
  airdropFlags = self->_airdropFlags;
  if (v23 != (_DWORD)airdropFlags)
  {
LABEL_33:
    v25 = v23;
    v346 = airdropFlags;
    v401 = v23;
    CUAppendF();
    v26 = v10;

    self->_airdropFlags = v25;
    v7 = 1;
    v10 = v26;
  }

  [v4 bleAdvertisementTimestamp];
  if (v37 != 0.0 && v37 != self->_bleAdvertisementTimestamp) {
    self->_bleAdvertisementTimestamp = v37;
  }
  v38 = [v4 bleAdvertisementTimestampMachContinuous];
  if (v38 && v38 != self->_bleAdvertisementTimestampMachContinuous) {
    self->_bleAdvertisementTimestampMachContinuous = v38;
  }
  [v4 bleAppleManufacturerData];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v342 = v39;
  if (v39)
  {
    bleAppleManufacturerData = self->_bleAppleManufacturerData;
    v41 = v39;
    v42 = bleAppleManufacturerData;
    if (v41 != v42)
    {
      v43 = v42;
      if (v42)
      {
        v44 = -[NSData isEqual:](v41, "isEqual:", v42);

        if ((v44 & 1) != 0) {
          goto LABEL_69;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_bleAppleManufacturerData, v342);
      v12 |= 0x40000000uLL;
LABEL_69:
      LOBYTE(v5) = v349;
      goto LABEL_70;
    }
  }

LABEL_34:
  objc_msgSend(v4, "airdropTempAuthTagData", v346, v401);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  airdropTempAuthTagData = self->_airdropTempAuthTagData;
  v29 = v27;
  v30 = airdropTempAuthTagData;
  if (v29 == v30)
  {

    v56 = v29;
  }

  else
  {
    v31 = v30;
    if ((v29 == 0LL) != (v30 != 0LL))
    {
      v32 = -[NSData isEqual:](v29, "isEqual:", v30);

      if ((v32 & 1) != 0)
      {
        v33 = [v4 airdropModel];
        airdropModel = self->_airdropModel;
        if (v33 == (_DWORD)airdropModel) {
          goto LABEL_38;
        }
        goto LABEL_60;
      }
    }

    else
    {
    }

    v7 = 1;
    CUPrintNSDataHex();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v347 = v63;
    v402 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v64 = v10;

    v65 = v29;
    v56 = self->_airdropTempAuthTagData;
    self->_airdropTempAuthTagData = v65;
    v10 = v64;
  }

  v33 = [v4 airdropModel];
  airdropModel = self->_airdropModel;
  if (v33 == (_DWORD)airdropModel)
  {
LABEL_38:
    v35 = objc_msgSend(v4, "airdropVersion", v347, v402);
    airdropVersion = self->_airdropVersion;
    if (v35 == (_DWORD)airdropVersion) {
      goto LABEL_39;
    }
    goto LABEL_61;
  }

LABEL_60:
  v66 = v33;
  v351 = airdropModel;
  v406 = v33;
  CUAppendF();
  v67 = v10;

  self->_airdropModel = v66;
  v7 = 1;
  v10 = v67;
  v35 = objc_msgSend(v4, "airdropVersion", v351, v406);
  airdropVersion = self->_airdropVersion;
  if (v35 == (_DWORD)airdropVersion)
  {
LABEL_39:
    v37 = [v4 airdropHash1];
    airdropHash1 = self->_airdropHash1;
    if (v37 == (_DWORD)airdropHash1) {
      goto LABEL_40;
    }
    goto LABEL_62;
  }

    *p_bleScanRate = 20;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Background"))
    {
LABEL_28:
      if (strcmp(string, "Low")) {
        goto LABEL_29;
      }
      goto LABEL_62;
    }

  v32 = xpc_dictionary_get_value(v6, "dvIn");
  v33 = (void *)v32;
  if (!v32) {
    goto LABEL_65;
  }
  if (MEMORY[0x18959FCE0](v32) != v15)
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"Bad DeviceInfo XPC type", v34, v35, v36, v37, v38, v39, v128);
      v123 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_323;
    }

    goto LABEL_333;
  }

  v46 = (void *)CUXPCCreateCFObjectFromXPCObject();
  if (!v46)
  {
    if (a4)
    {
      v126 = "XPC->CF failed";
      v127 = -6732;
LABEL_338:
      CBErrorF(v127, (uint64_t)v126, v40, v41, v42, v43, v44, v45, v128);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_61:
  v68 = v35;
  v352 = airdropVersion;
  v407 = v35;
  CUAppendF();
  v69 = v10;

  self->_airdropVersion = v68;
  v7 = 1;
  v10 = v69;
  v37 = objc_msgSend(v4, "airdropHash1", v352, v407);
  airdropHash1 = self->_airdropHash1;
  if (v37 == (_DWORD)airdropHash1)
  {
LABEL_40:
    v39 = [v4 airdropHash2];
    airdropHash2 = self->_airdropHash2;
    if (v39 == (_DWORD)airdropHash2) {
      goto LABEL_41;
    }
    goto LABEL_63;
  }

    *p_bleScanRateScreenOff = 20;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Low"))
    {
LABEL_29:
      if (strcmp(v18, "Low")) {
        goto LABEL_30;
      }
      goto LABEL_63;
    }

LABEL_62:
  v70 = v37;
  v353 = airdropHash1;
  v408 = v37;
  CUAppendF();
  v71 = v10;

  self->_airdropHash1 = v70;
  v7 = 1;
  v10 = v71;
  v39 = objc_msgSend(v4, "airdropHash2", v353, v408);
  airdropHash2 = self->_airdropHash2;
  if (v39 == (_DWORD)airdropHash2)
  {
LABEL_41:
    v41 = [v4 airdropHash3];
    airdropHash3 = self->_airdropHash3;
    if (v41 == (_DWORD)airdropHash3) {
      goto LABEL_42;
    }
    goto LABEL_64;
  }

    *p_bleScanRate = 30;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Low"))
    {
LABEL_30:
      if (strcmp(string, "MediumLow")) {
        goto LABEL_31;
      }
      goto LABEL_64;
    }

LABEL_63:
  v72 = v39;
  v354 = airdropHash2;
  v409 = v39;
  CUAppendF();
  v73 = v10;

  self->_airdropHash2 = v72;
  v7 = 1;
  v10 = v73;
  v41 = objc_msgSend(v4, "airdropHash3", v354, v409);
  airdropHash3 = self->_airdropHash3;
  if (v41 == (_DWORD)airdropHash3)
  {
LABEL_42:
    v43 = [v4 airdropHash4];
    airdropHash4 = self->_airdropHash4;
    if (v43 == (_DWORD)airdropHash4) {
      goto LABEL_43;
    }
    goto LABEL_65;
  }

    *p_bleScanRateScreenOff = 30;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "MediumLow"))
    {
LABEL_31:
      if (strcmp(v18, "MediumLow")) {
        goto LABEL_32;
      }
      goto LABEL_65;
    }

LABEL_64:
  v74 = v41;
  v355 = airdropHash3;
  v410 = v41;
  CUAppendF();
  v75 = v10;

  self->_airdropHash3 = v74;
  v7 = 1;
  v10 = v75;
  v43 = objc_msgSend(v4, "airdropHash4", v355, v410);
  airdropHash4 = self->_airdropHash4;
  if (v43 == (_DWORD)airdropHash4)
  {
LABEL_43:
    v45 = [v4 airdropConfigData];
    airdropConfigData = self->_airdropConfigData;
    if (v45 == (_DWORD)airdropConfigData) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }

    *p_bleScanRate = 35;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "MediumLow"))
    {
LABEL_32:
      if (strcmp(string, "Medium")) {
        goto LABEL_33;
      }
      goto LABEL_66;
    }

LABEL_65:
  v76 = v43;
  v356 = airdropHash4;
  v411 = v43;
  CUAppendF();
  v77 = v10;

  self->_airdropHash4 = v76;
  v7 = 1;
  v10 = v77;
  v45 = objc_msgSend(v4, "airdropConfigData", v356, v411);
  airdropConfigData = self->_airdropConfigData;
  if (v45 != (_DWORD)airdropConfigData)
  {
LABEL_44:
    v47 = v45;
    v348 = airdropConfigData;
    v403 = v45;
    CUAppendF();
    v48 = v10;

    self->_airdropConfigData = v47;
    v7 = 1;
    v10 = v48;
  }

    *p_bleScanRateScreenOff = 35;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Medium"))
    {
LABEL_33:
      if (strcmp(v18, "Medium")) {
        goto LABEL_34;
      }
      goto LABEL_67;
    }

      v430 = (void *)v53;
      NSAppendPrintF_safe();
      objc_storeStrong(v52, v658);
    }

    audioStreamState = self->_audioStreamState;
    if (audioStreamState)
    {
      v55 = v682 + 5;
      v657 = v682[5];
      if (audioStreamState > 3) {
        v56 = "?";
      }
      else {
        v56 = off_189FB56A0[audioStreamState - 1];
      }
      v430 = (void *)v56;
      NSAppendPrintF_safe();
      objc_storeStrong(v55, v657);
    }

    v57 = -[CBDevice frequencyBand](self, "frequencyBand", v430);
    if (v57)
    {
      v58 = "2.4";
      if (v57 != 1) {
        v58 = "?";
      }
      if (v57 == 2) {
        v58 = "5";
      }
      v59 = v682;
      v656 = v682[5];
      v431 = v58;
      NSAppendPrintF_safe();
      objc_storeStrong(v59 + 5, v656);
    }

    bleChannel = (const char *)self->_bleChannel;
    if ((_DWORD)bleChannel)
    {
      v61 = v682;
      v655 = v682[5];
      v431 = bleChannel;
      NSAppendPrintF_safe();
      objc_storeStrong(v61 + 5, v655);
    }

    autoAncCapability = (const char *)self->_autoAncCapability;
    if (self->_autoAncCapability)
    {
      v63 = v682;
      v654 = v682[5];
      v431 = autoAncCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v63 + 5, v654);
    }

    v64 = a3;
    batteryInfoMain = self->_batteryInfoMain;
    batteryInfoLeft = self->_batteryInfoLeft;
    batteryInfoRight = self->_batteryInfoRight;
    batteryInfoCase = self->_batteryInfoCase;
    if (self->_batteryInfoMain || self->_batteryInfoLeft || self->_batteryInfoRight || self->_batteryInfoCase)
    {
      v69 = v682;
      v653 = v682[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v69 + 5, v653);
      if (batteryInfoMain)
      {
        v70 = v682 + 5;
        v652 = v682[5];
        v71 = (batteryInfoMain >> 8) & 7;
        v72 = "";
        if (v71 == 2) {
          v72 = "-";
        }
        if (v71 == 1) {
          v73 = "+";
        }
        else {
          v73 = v72;
        }
        v431 = v73;
        v474 = (float)((float)((float)(batteryInfoMain & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v70, v652);
      }

      if (batteryInfoLeft)
      {
        v74 = v682 + 5;
        v651 = v682[5];
        v75 = (batteryInfoLeft >> 8) & 7;
        v76 = "";
        if (v75 == 2) {
          v76 = "-";
        }
        if (v75 == 1) {
          v77 = "+";
        }
        else {
          v77 = v76;
        }
        v431 = v77;
        v474 = (float)((float)((float)(batteryInfoLeft & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v74, v651);
      }

      if (batteryInfoRight)
      {
        v78 = v682 + 5;
        v650 = v682[5];
        v79 = (batteryInfoRight >> 8) & 7;
        v80 = "";
        if (v79 == 2) {
          v80 = "-";
        }
        if (v79 == 1) {
          v81 = "+";
        }
        else {
          v81 = v80;
        }
        v431 = v81;
        v474 = (float)((float)((float)(batteryInfoRight & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v78, v650);
      }

      if (batteryInfoCase)
      {
        v82 = v682 + 5;
        v649 = v682[5];
        v83 = (batteryInfoCase >> 8) & 7;
        v84 = "";
        if (v83 == 2) {
          v84 = "-";
        }
        if (v83 == 1) {
          v85 = "+";
        }
        else {
          v85 = v84;
        }
        v431 = v85;
        v474 = (float)((float)((float)(batteryInfoCase & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v82, v649);
      }
    }

    v86 = -[CBDevice clickHoldModeLeft](self, "clickHoldModeLeft", v431, v474);
    v87 = -[CBDevice clickHoldModeRight](self, "clickHoldModeRight");
    if (v86 | v87)
    {
      v88 = v682;
      v648 = v682[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v88 + 5, v648);
      if (v86)
      {
        v89 = v682 + 5;
        v647 = v682[5];
        if (v86 > 7) {
          v90 = @"?";
        }
        else {
          v90 = (const __CFString *)*((void *)&off_189FB56B8 + (char)(v86 - 1));
        }
        v432 = v90;
        NSAppendPrintF_safe();
        objc_storeStrong(v89, v647);
      }

      if (v87)
      {
        v91 = v682 + 5;
        v646 = v682[5];
        if (v87 > 7) {
          v92 = @"?";
        }
        else {
          v92 = (const __CFString *)*((void *)&off_189FB56B8 + (char)(v87 - 1));
        }
        v432 = v92;
        NSAppendPrintF_safe();
        objc_storeStrong(v91, v646);
      }
    }

    endCallCapability = (const __CFString *)self->_endCallCapability;
    v94 = v64;
    if (self->_endCallCapability)
    {
      v95 = v682;
      v645 = v682[5];
      v432 = endCallCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v95 + 5, v645);
    }

    v96 = -[CBDevice endCallConfig](self, "endCallConfig", v432);
    if (v96)
    {
      v97 = v682;
      v644 = v682[5];
      v433 = v96;
      NSAppendPrintF_safe();
      objc_storeStrong(v97 + 5, v644);
    }

    muteControlCapability = self->_muteControlCapability;
    if (self->_muteControlCapability)
    {
      v99 = v682;
      v643 = v682[5];
      v433 = muteControlCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v99 + 5, v643);
    }

    v100 = -[CBDevice muteControlConfig](self, "muteControlConfig", v433);
    if (v100)
    {
      v101 = v682;
      v642 = v682[5];
      v434 = (CBControllerInfo *)v100;
      NSAppendPrintF_safe();
      objc_storeStrong(v101 + 5, v642);
    }

    v102 = self->_caseVersion;
    v103 = v102;
    if (v102)
    {
      v104 = v682;
      v641 = v682[5];
      v434 = (CBControllerInfo *)v102;
      NSAppendPrintF_safe();
      objc_storeStrong(v104 + 5, v641);
    }

    if ((self->_colorInfo & 0x100) != 0)
    {
      v105 = v682;
      v640 = v682[5];
      v434 = (CBControllerInfo *)-[CBDevice colorCodeBest](self, "colorCodeBest");
      NSAppendPrintF_safe();
      objc_storeStrong(v105 + 5, v640);
    }

    v106 = self->_controllerInfo;
    v107 = v106;
    if (v106)
    {
      v108 = v682;
      v639 = v682[5];
      v434 = v106;
      NSAppendPrintF_safe();
      objc_storeStrong(v108 + 5, v639);
    }

    conversationDetectCapability = (CBControllerInfo *)self->_conversationDetectCapability;
    if (self->_conversationDetectCapability)
    {
      v110 = v682;
      v638 = v682[5];
      v434 = conversationDetectCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v110 + 5, v638);
    }

    v111 = -[CBDevice conversationDetectConfig](self, "conversationDetectConfig", v434);
    if (v111)
    {
      v112 = v682;
      v637 = v682[5];
      v435 = v111;
      NSAppendPrintF_safe();
      objc_storeStrong(v112 + 5, v637);
    }

    v113 = -[CBDevice crownRotationDirection](self, "crownRotationDirection", v435);
    if (v113)
    {
      v114 = @"?";
      if (v113 == 1) {
        v114 = @"BackToFront";
      }
      if (v113 == 2) {
        v114 = @"FrontToBack";
      }
      v115 = v682;
      v636 = v682[5];
      v436 = v114;
      NSAppendPrintF_safe();
      objc_storeStrong(v115 + 5, v636);
    }

    doubleTapActionLeft = self->_doubleTapActionLeft;
    doubleTapActionRight = self->_doubleTapActionRight;
    doubleTapCapability = self->_doubleTapCapability;
    if (self->_doubleTapActionLeft || self->_doubleTapActionRight || self->_doubleTapCapability)
    {
      v119 = v682;
      v635 = v682[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v119 + 5, v635);
      if ((_DWORD)doubleTapActionLeft)
      {
        v120 = v682 + 5;
        v634 = v682[5];
        else {
          v121 = off_189FB56F0[doubleTapActionLeft];
        }
        v436 = (__CFString *)v121;
        NSAppendPrintF_safe();
        objc_storeStrong(v120, v634);
      }

      if (doubleTapActionRight)
      {
        v122 = v682 + 5;
        v633 = v682[5];
        else {
          v123 = off_189FB56F0[doubleTapActionRight];
        }
        v436 = (__CFString *)v123;
        NSAppendPrintF_safe();
        objc_storeStrong(v122, v633);
      }

      if (doubleTapCapability)
      {
        v124 = v682 + 5;
        v632 = v682[5];
        else {
          v125 = off_189FB5720[doubleTapCapability];
        }
        v436 = (__CFString *)v125;
        NSAppendPrintF_safe();
        objc_storeStrong(v124, v632);
      }
    }

    if (-[CBDevice gapaFlags](self, "gapaFlags", v436))
    {
      v126 = v682;
      v631 = v682[5];
      CUPrintFlags32();
      v437 = (void *)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF_safe();
      objc_storeStrong(v126 + 5, v631);
    }

    v127 = self->_firmwareVersion;
    v128 = v127;
    if (v127)
    {
      v129 = v682;
      v630 = v682[5];
      v437 = v127;
      NSAppendPrintF_safe();
      objc_storeStrong(v129 + 5, v630);
    }

    v130 = -[CBDevice listeningMode](self, "listeningMode");
    if (v130)
    {
      v131 = v682 + 5;
      v629 = v682[5];
      if (v130 > 4) {
        v132 = "?";
      }
      else {
        v132 = off_189FB5740[v130 - 1];
      }
      v437 = (void *)v132;
      NSAppendPrintF_safe();
      objc_storeStrong(v131, v629);
    }

    if (-[CBDevice listeningModeConfigs](self, "listeningModeConfigs", v437))
    {
      v133 = v682;
      v628 = v682[5];
      CUPrintFlags32();
      v438 = (void *)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF_safe();
      objc_storeStrong(v133 + 5, v628);
    }
    v134 = -[CBDevice btVersion](self, "btVersion", v438);
    v135 = v134;
    if (v134)
    {
      v136 = v682;
      v627 = v682[5];
      v439 = [v134 cStringUsingEncoding:4];
      NSAppendPrintF_safe();
      objc_storeStrong(v136 + 5, v627);
    }

    microphoneMode = self->_microphoneMode;
    if (self->_microphoneMode)
    {
      v138 = v682 + 5;
      v626 = v682[5];
      else {
        v139 = off_189FB5760[microphoneMode];
      }
      v439 = (uint64_t)v139;
      NSAppendPrintF_safe();
      objc_storeStrong(v138, v626);
    }

    primaryPlacement = self->_primaryPlacement;
    secondaryPlacement = self->_secondaryPlacement;
    placementMode = self->_placementMode;
    if (__PAIR64__(secondaryPlacement, primaryPlacement) || self->_placementMode)
    {
      v143 = v682;
      v625 = v682[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v143 + 5, v625);
      if (primaryPlacement)
      {
        v144 = v682 + 5;
        v624 = v682[5];
        if (primaryPlacement > 7) {
          v145 = "?";
        }
        else {
          v145 = off_189FB5D48[primaryPlacement - 1];
        }
        v439 = (uint64_t)v145;
        NSAppendPrintF_safe();
        objc_storeStrong(v144, v624);
      }

      if (secondaryPlacement)
      {
        v146 = v682 + 5;
        v623 = v682[5];
        if (secondaryPlacement > 7) {
          v147 = "?";
        }
        else {
          v147 = off_189FB5D48[secondaryPlacement - 1];
        }
        v439 = (uint64_t)v147;
        NSAppendPrintF_safe();
        objc_storeStrong(v146, v623);
      }

      if (placementMode)
      {
        v148 = v682 + 5;
        v622 = v682[5];
        else {
          v149 = off_189FB5798[placementMode];
        }
        v439 = (uint64_t)v149;
        NSAppendPrintF_safe();
        objc_storeStrong(v148, v622);
      }
    }

    v150 = -[CBDevice primaryBudSide](self, "primaryBudSide", v439);
    if (v150)
    {
      v151 = v682 + 5;
      v621 = v682[5];
      if (v150 > 3) {
        v152 = "?";
      }
      else {
        v152 = off_189FB5780[(char)(v150 - 1)];
      }
      v440 = v152;
      NSAppendPrintF_safe();
      objc_storeStrong(v151, v621);
    }

    v153 = -[CBDevice findMyCaseIdentifier](self, "findMyCaseIdentifier", v440);
    v154 = (void *)v153;
    if (v153)
    {
      v155 = v682;
      v620 = v682[5];
      v441 = *(double *)&v153;
      NSAppendPrintF_safe();
      objc_storeStrong(v155 + 5, v620);
    }

    v156 = -[CBDevice findMyGroupIdentifier](self, "findMyGroupIdentifier");
    v157 = (void *)v156;
    if (v156)
    {
      v158 = v682;
      v619 = v682[5];
      v441 = *(double *)&v156;
      NSAppendPrintF_safe();
      objc_storeStrong(v158 + 5, v619);
    }

    v159 = -[CBDevice interval](self, "interval");
    if (v159 && (-[CBDevice discoveryFlags](self, "discoveryFlags") & 0x200000) != 0)
    {
      v160 = (double)v159;
      if ((-[CBDevice deviceFlags](self, "deviceFlags") & 0x4000) != 0)
      {
        v161 = v682 + 5;
        v618 = v682[5];
        v441 = v160 * 0.625;
        NSAppendPrintF_safe();
        v162 = v618;
      }

      else
      {
        if ((-[CBDevice deviceFlags](self, "deviceFlags") & 0x2000) == 0) {
          goto LABEL_217;
        }
        v161 = v682 + 5;
        v617 = v682[5];
        v441 = v160 * 1.25;
        NSAppendPrintF_safe();
        v162 = v617;
      }

      v163 = v162;
      v164 = *v161;
      *v161 = v163;
    }

LABEL_45:
  objc_msgSend(v4, "airplaySourceAuthTagData", v348, v403);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
  v51 = v49;
  v52 = airplaySourceAuthTagData;
  if (v51 == v52)
  {

    v57 = v51;
LABEL_69:

    goto LABEL_70;
  }

  v53 = v52;
  if ((v51 == 0LL) == (v52 != 0LL))
  {

    goto LABEL_68;
  }

  v54 = -[NSData isEqual:](v51, "isEqual:", v52);

  if ((v54 & 1) == 0)
  {
LABEL_68:
    v7 = 1;
    CUPrintNSDataHex();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v349 = v78;
    v404 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v79 = v10;

    v80 = v51;
    v57 = self->_airplaySourceAuthTagData;
    self->_airplaySourceAuthTagData = v80;
    v10 = v79;
    goto LABEL_69;
  }

  if (a4 - v5 <= 0) {
    v19 = 0;
  }
  if (!v19)
  {
    uint64_t v27 = 0;
    if (!self->_homeKitV1ConfigurationNumber) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }

  v28 = *(unsigned __int8 *)v5++;
  uint64_t v27 = v28;
  if (v28 != self->_homeKitV1ConfigurationNumber)
  {
LABEL_51:
    self->_homeKitV1ConfigurationNumber = v27;
    v10 |= 0x400000uLL;
  }

LABEL_70:
  v81 = objc_msgSend(v4, "airplaySourceFlags", v349, v404);
  v469 = v29;
  v470 = v17;
  if (v81 != self->_airplaySourceFlags)
  {
    CUPrintFlags32();
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v357 = v82;
    v412 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v83 = v10;

    self->_airplaySourceFlags = v81;
    v7 = 1;
    v10 = v83;
  }

  objc_msgSend(v4, "airplaySourceUWBConfigData", v357, v412);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  airplaySourceUWBConfigData = self->_airplaySourceUWBConfigData;
  v86 = v84;
  v87 = airplaySourceUWBConfigData;
  if (v86 == v87)
  {

    v163 = v86;
  }

  else
  {
    v88 = v87;
    if ((v86 == 0LL) != (v87 != 0LL))
    {
      v89 = -[NSData isEqual:](v86, "isEqual:", v87);

      if ((v89 & 1) != 0)
      {
        v90 = [v4 airplayTargetConfigSeed];
        airplayTargetConfigSeed = (void *)self->_airplayTargetConfigSeed;
        if (v90 == (_DWORD)airplayTargetConfigSeed) {
          goto LABEL_77;
        }
        goto LABEL_76;
      }
    }

    else
    {
    }

    v7 = 1;
    CUPrintNSDataHex();
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v413 = v358 = v167;
    CUAppendF();
    v168 = v10;

    v169 = v86;
    v163 = self->_airplaySourceUWBConfigData;
    self->_airplaySourceUWBConfigData = v169;
    v10 = v168;
  }

  v90 = [v4 airplayTargetConfigSeed];
  airplayTargetConfigSeed = (void *)self->_airplayTargetConfigSeed;
  if (v90 != (_DWORD)airplayTargetConfigSeed)
  {
LABEL_76:
    v92 = v90;
    v358 = airplayTargetConfigSeed;
    v413 = v90;
    CUAppendF();
    v93 = v10;

    self->_airplayTargetConfigSeed = v92;
    v7 = 1;
    v10 = v93;
  }

  [v4 serviceUUIDs];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  serviceUUIDs = self->_serviceUUIDs;
  v55 = v53;
  v56 = serviceUUIDs;
  if (v55 == v56)
  {
  }

  else
  {
    v57 = v56;
    if ((v55 == 0LL) != (v56 != 0LL))
    {
      v58 = -[NSArray isEqual:](v55, "isEqual:", v56);

      if ((v58 & 1) != 0)
      {
        v59 = [v4 useCase];
        useCase = self->_useCase;
        if (v59 == useCase) {
          goto LABEL_75;
        }
        goto LABEL_74;
      }
    }

    else
    {
    }

    CUPrintNSObjectOneLine();
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 serviceUUIDs];
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v95 = v9;

    objc_msgSend(v4, "serviceUUIDs", v93, v138);
    v96 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v55 = self->_serviceUUIDs;
    self->_serviceUUIDs = v96;
    v7 = 1;
    v9 = v95;
  }

  v59 = [v4 useCase];
  useCase = self->_useCase;
  if (v59 != useCase)
  {
LABEL_74:
    v118 = CBUseCaseToString_0(useCase);
    v132 = CBUseCaseToString_0(v59);
    CUAppendF();
    v61 = v9;

    self->_useCase = v59;
    v7 = 1;
    v9 = v61;
  }

  v45 = [v4 bleChannel];
  if (v45 && v45 != self->_bleChannel)
  {
    self->_bleChannel = v45;
    v12 |= 0x200000000uLL;
  }

  v46 = [v4 bleRSSI];
  if (v46)
  {
    bleRSSI = self->_bleRSSI;
    if (!bleRSSI) {
      goto LABEL_78;
    }
    if (bleRSSI > -51)
    {
      v48 = 0LL;
      if (v46 > -51) {
        goto LABEL_77;
      }
LABEL_90:
      if (v46 <= 0xFFFFFFB9)
      {
        if (v46 <= 0xFFFFFFAF)
        {
          v315 = 3LL;
          if (v48 == v315) {
            goto LABEL_79;
          }
        }

        else if (v48 == 2)
        {
          goto LABEL_79;
        }
      }

      else if (v48 == 1)
      {
        goto LABEL_79;
      }

      goto LABEL_78;
    }

    if (bleRSSI <= 0xFFFFFFB9)
    {
      if (bleRSSI <= 0xFFFFFFAF)
      {
        v314 = (bleRSSI != -86) & __CFADD__(bleRSSI, 86);
        v48 = 3LL;
        if (!v314) {
          v48 = 4LL;
        }
        if (v46 <= -51) {
          goto LABEL_90;
        }
      }

      else
      {
        v48 = 2LL;
        if (v46 <= -51) {
          goto LABEL_90;
        }
      }
    }

    else
    {
      v48 = 1LL;
      if (v46 <= -51) {
        goto LABEL_90;
      }
    }

  -[CBDevice setProximityPairingPrimaryPlacement:](self, "setProximityPairingPrimaryPlacement:", HIDWORD(v44));
  v18 = 1;
  v42 = v44;
  if (v42 != -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement")) {
    goto LABEL_71;
  }
LABEL_66:
  self->_discoveryFlags |= 0x8000uLL;
  if (v18) {
LABEL_72:
  }
    self->_changeFlags |= 0x80000008000uLL;
}

LABEL_77:
  v94 = objc_msgSend(v4, "airplayTargetFlags", v358, v413);
  v467 = v86;
  if (v94 != self->_airplayTargetFlags)
  {
    CUPrintFlags32();
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v359 = v95;
    v414 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v96 = v10;

    self->_airplayTargetFlags = v94;
    v7 = 1;
    v10 = v96;
  }

  v471 = objc_msgSend(v4, "airplayTargetIPv4", v359, v414);
  if (v471 == self->_airplayTargetIPv4)
  {
    v97 = [v4 airplayTargetPort];
    airplayTargetPort = self->_airplayTargetPort;
    if (v97 == (_DWORD)airplayTargetPort) {
      goto LABEL_81;
    }
  }

  else
  {
    v7 = 1;
    CUPrintAddress();
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintAddress();
    v420 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v149 = v10;

    self->_airplayTargetIPv4 = v471;
    v10 = v149;
    v97 = objc_msgSend(v4, "airplayTargetPort", v148, v420);
    airplayTargetPort = self->_airplayTargetPort;
    if (v97 == (_DWORD)airplayTargetPort)
    {
LABEL_81:
      v99 = [v4 dsActionFlags];
      if (v99 == self->_dsActionFlags) {
        goto LABEL_82;
      }
      goto LABEL_109;
    }
  }

  v150 = v97;
  v365 = airplayTargetPort;
  v421 = v97;
  CUAppendF();
  v151 = v10;

  self->_airplayTargetPort = v150;
  v7 = 1;
  v10 = v151;
  v99 = objc_msgSend(v4, "dsActionFlags", v365, v421);
  if (v99 == self->_dsActionFlags)
  {
LABEL_82:
    v100 = [v4 dsActionMeasuredPower];
    dsActionMeasuredPower = self->_dsActionMeasuredPower;
    goto LABEL_110;
  }

    if (!v48)
    {
LABEL_79:
      self->_bleRSSI = v46;
      v12 |= 0x200000000uLL;
      goto LABEL_80;
    }

LABEL_109:
  CUPrintFlags32();
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintFlags32();
  v422 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v153 = v10;

  self->_dsActionFlags = v99;
  v7 = 1;
  v10 = v153;
  v100 = objc_msgSend(v4, "dsActionMeasuredPower", v152, v422);
  dsActionMeasuredPower = self->_dsActionMeasuredPower;
  if (v100 == self->_dsActionMeasuredPower)
  {
LABEL_83:
    v102 = [v4 dsActionTieBreaker];
    dsActionTieBreaker = self->_dsActionTieBreaker;
    if (v102 == (_DWORD)dsActionTieBreaker) {
      goto LABEL_84;
    }
    goto LABEL_111;
  }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "RemoteDisplay");
      if ((discoveryFlags & 0x200000000000LL) == 0)
      {
LABEL_40:
        if ((discoveryFlags & 0x200) == 0) {
          goto LABEL_41;
        }
        goto LABEL_111;
      }

LABEL_110:
  v154 = v100;
  v366 = dsActionMeasuredPower;
  v423 = v100;
  CUAppendF();
  v155 = v10;

  self->_dsActionMeasuredPower = v154;
  v7 = 1;
  v10 = v155;
  v102 = objc_msgSend(v4, "dsActionTieBreaker", v366, v423);
  dsActionTieBreaker = self->_dsActionTieBreaker;
  if (v102 == (_DWORD)dsActionTieBreaker)
  {
LABEL_84:
    v104 = [v4 dsInfoVehicleConfidence];
    dsInfoVehicleConfidence = self->_dsInfoVehicleConfidence;
    if (v104 == (_DWORD)dsInfoVehicleConfidence) {
      goto LABEL_85;
    }
    goto LABEL_112;
  }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ProxControl");
      if ((discoveryFlags & 0x200) == 0)
      {
LABEL_41:
        if ((discoveryFlags & 0x400) == 0) {
          goto LABEL_42;
        }
        goto LABEL_112;
      }

  v69 = [v4 clickHoldModeLeft];
  if ((_DWORD)v69)
  {
    v70 = v69;
    if ((_DWORD)v69 != -[CBDevice clickHoldModeLeft](self, "clickHoldModeLeft"))
    {
      -[CBDevice setClickHoldModeLeft:](self, "setClickHoldModeLeft:", v70);
      v12 |= 0x80000000000uLL;
    }
  }

  v71 = [v4 clickHoldModeRight];
  if ((_DWORD)v71)
  {
    v72 = v71;
    if ((_DWORD)v71 != -[CBDevice clickHoldModeRight](self, "clickHoldModeRight"))
    {
      -[CBDevice setClickHoldModeRight:](self, "setClickHoldModeRight:", v72);
      v12 |= 0x80000000000uLL;
    }
  }

  v73 = [v4 colorInfo];
  if (v73 && self->_colorInfo != v73)
  {
    self->_colorInfo = v73;
    v12 |= 0x80000000000uLL;
  }

  if (v19)
  {
    v74 = [v4 connectedServices];
    if (v74 != self->_connectedServices)
    {
      self->_connectedServices = v74;
      v12 |= 0x80000200000uLL;
    }
  }

  v75 = [v4 contactID];
  v329 = (id)v75;
  if (!v75)
  {
LABEL_126:
    v81 = [v4 controllerInfo];
    v328 = (id)v81;
    if (!v81) {
      goto LABEL_140;
    }
    goto LABEL_135;
  }

  v76 = (void *)v75;
  v77 = self->_contactID;
  v78 = v76;
  v79 = v78;
  if (v77 == v78)
  {

    v81 = [v4 controllerInfo];
    v328 = (id)v81;
    if (!v81) {
      goto LABEL_140;
    }
    goto LABEL_135;
  }

  if (v77)
  {
    v80 = -[NSString isEqual:](v77, "isEqual:", v78);

    if ((v80 & 1) != 0) {
      goto LABEL_126;
    }
  }

  else
  {
  }

  objc_storeStrong((id *)&self->_contactID, v329);
  v12 |= 0x80000000000uLL;
  v81 = [v4 controllerInfo];
  v328 = (id)v81;
  if (!v81) {
    goto LABEL_140;
  }
LABEL_135:
  v82 = (void *)v81;
  v83 = self->_controllerInfo;
  v84 = v82;
  v85 = v84;
  if (v83 != v84)
  {
    if (v83)
    {
      v86 = -[CBControllerInfo isEqual:](v83, "isEqual:", v84);

      if (v86) {
        goto LABEL_140;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_controllerInfo, v328);
    v12 |= 0x80000000000uLL;
    v87 = [v4 conversationDetectCapability];
    if (!v87) {
      goto LABEL_146;
    }
    goto LABEL_144;
  }

LABEL_140:
  v87 = [v4 conversationDetectCapability];
  if (!v87) {
    goto LABEL_146;
  }
LABEL_144:
  if (v87 != self->_conversationDetectCapability)
  {
    self->_conversationDetectCapability = v87;
    v12 |= 0x80000000000uLL;
  }

LABEL_111:
  v156 = v102;
  v367 = dsActionTieBreaker;
  v424 = v102;
  CUAppendF();
  v157 = v10;

  self->_dsActionTieBreaker = v156;
  v7 = 1;
  v10 = v157;
  v104 = objc_msgSend(v4, "dsInfoVehicleConfidence", v367, v424);
  dsInfoVehicleConfidence = self->_dsInfoVehicleConfidence;
  if (v104 == (_DWORD)dsInfoVehicleConfidence)
  {
LABEL_85:
    v106 = [v4 dsInfoVehicleState];
    LODWORD(v107) = self->_dsInfoVehicleState;
    if (v106 == (_DWORD)v107) {
      goto LABEL_86;
    }
    goto LABEL_113;
  }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ProxRepair");
      if ((discoveryFlags & 0x400) == 0)
      {
LABEL_42:
        if ((discoveryFlags & 0x4000000000000000LL) == 0) {
          goto LABEL_43;
        }
        goto LABEL_113;
      }

LABEL_112:
  v158 = v104;
  v368 = dsInfoVehicleConfidence;
  v425 = v104;
  CUAppendF();
  v159 = v10;

  self->_dsInfoVehicleConfidence = v158;
  v7 = 1;
  v10 = v159;
  v106 = objc_msgSend(v4, "dsInfoVehicleState", v368, v425);
  LODWORD(v107) = self->_dsInfoVehicleState;
  if (v106 == (_DWORD)v107)
  {
LABEL_86:
    v108 = [v4 enableEPAForLEAdvertisement];
    v109 = self->_enableEPAForLEAdvertisement;
    if (v109 == v108) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }

  objc_opt_class();
  CUXPCDecodeNSArrayOfClass();
  serviceUUIDs = self->_serviceUUIDs;
  v43 = (NSArray *)0LL;
  v44 = serviceUUIDs;
  if (v43 == v44)
  {

    goto LABEL_119;
  }

  v45 = v44;
  if ((v43 == 0LL) == (v44 != 0LL))
  {

    goto LABEL_118;
  }

  v46 = -[NSArray isEqual:](v43, "isEqual:", v44);

  if ((v46 & 1) == 0)
  {
LABEL_118:
    v47 = (NSArray *)[0 copy];
    v48 = self->_serviceUUIDs;
    self->_serviceUUIDs = v47;

    v7 |= 0x80000000000uLL;
  }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ShareAudio");
      if ((discoveryFlags & 0x4000000000000000LL) == 0)
      {
LABEL_43:
        if ((discoveryFlags & 0x800) == 0) {
          goto LABEL_44;
        }
        goto LABEL_114;
      }

LABEL_113:
  v160 = v106;
  v107 = (char)v107;
  if ((char)v107 > 2)
  {
    v161 = "?";
    if (v106 > 2) {
      goto LABEL_115;
    }
  }

  else
  {
    v161 = off_189FB2610[v107];
    if (v106 > 2)
    {
LABEL_115:
      v162 = "?";
      goto LABEL_251;
    }
  }

  v162 = off_189FB2610[(char)v106];
LABEL_251:
  v391 = v161;
  v449 = v162;
  CUAppendF();
  v325 = v10;

  self->_dsInfoVehicleState = v160;
  v7 = 1;
  v10 = v325;
  v108 = objc_msgSend(v4, "enableEPAForLEAdvertisement", v391, v449);
  v109 = self->_enableEPAForLEAdvertisement;
  if (v109 != v108)
  {
LABEL_87:
    v110 = v108;
    v360 = v109;
    v415 = v108;
    CUAppendF();
    v111 = v10;

    self->_enableEPAForLEAdvertisement = v110;
    v7 = 1;
    v10 = v111;
  }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "SIMTransfer");
      if ((discoveryFlags & 0x800) == 0)
      {
LABEL_44:
        if ((discoveryFlags & 0x20000000000000LL) == 0) {
          goto LABEL_45;
        }
        goto LABEL_115;
      }

LABEL_88:
  objc_msgSend(v4, "fidoPayloadData", v360, v415);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  fidoPayloadData = self->_fidoPayloadData;
  v114 = v112;
  v115 = fidoPayloadData;
  if (v114 == v115)
  {

    v164 = v114;
  }

  else
  {
    v116 = v115;
    if ((v114 == 0LL) != (v115 != 0LL))
    {
      v117 = -[NSData isEqual:](v114, "isEqual:", v115);

      if ((v117 & 1) != 0)
      {
        v118 = [v4 heySiriConfidence];
        heySiriConfidence = self->_heySiriConfidence;
        if (v118 == (_DWORD)heySiriConfidence) {
          goto LABEL_92;
        }
        goto LABEL_127;
      }
    }

    else
    {
    }

    v7 = 1;
    CUPrintNSDataHex();
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v361 = v170;
    v416 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v171 = v10;

    v172 = v114;
    v164 = self->_fidoPayloadData;
    self->_fidoPayloadData = v172;
    v10 = v171;
  }

  v118 = [v4 heySiriConfidence];
  heySiriConfidence = self->_heySiriConfidence;
  if (v118 == (_DWORD)heySiriConfidence)
  {
LABEL_92:
    v120 = objc_msgSend(v4, "heySiriDeviceClass", v361, v416);
    LODWORD(v121) = self->_heySiriDeviceClass;
    if (v120 == (_DWORD)v121) {
      goto LABEL_93;
    }
    goto LABEL_128;
  }

LABEL_127:
  v173 = v118;
  v369 = heySiriConfidence;
  v426 = v118;
  CUAppendF();
  v174 = v10;

  self->_heySiriConfidence = v173;
  v7 = 1;
  v10 = v174;
  v120 = objc_msgSend(v4, "heySiriDeviceClass", v369, v426);
  LODWORD(v121) = self->_heySiriDeviceClass;
  if (v120 == (_DWORD)v121)
  {
LABEL_93:
    v122 = [v4 heySiriPerceptualHash];
    heySiriPerceptualHash = self->_heySiriPerceptualHash;
    if (v122 == (_DWORD)heySiriPerceptualHash) {
      goto LABEL_94;
    }
    goto LABEL_256;
  }

LABEL_128:
  v175 = v120;
  v121 = (__int16)v121;
  if ((__int16)v121 > 0xA)
  {
    v176 = "?";
    if (v120 > 0xA) {
      goto LABEL_130;
    }
  }

  else
  {
    v176 = off_189FB2628[v121];
    if (v120 > 0xA)
    {
LABEL_130:
      v177 = "?";
      goto LABEL_255;
    }
  }

  v177 = off_189FB2628[(__int16)v120];
LABEL_255:
  v392 = v176;
  v450 = v177;
  CUAppendF();
  v326 = v10;

  self->_heySiriDeviceClass = v175;
  v7 = 1;
  v10 = v326;
  v122 = objc_msgSend(v4, "heySiriPerceptualHash", v392, v450);
  heySiriPerceptualHash = self->_heySiriPerceptualHash;
  if (v122 == (_DWORD)heySiriPerceptualHash)
  {
LABEL_94:
    v124 = [v4 heySiriProductType];
    LODWORD(v125) = self->_heySiriProductType;
    if (v124 == (_DWORD)v125) {
      goto LABEL_95;
    }
    goto LABEL_257;
  }

LABEL_256:
  v327 = v122;
  v393 = heySiriPerceptualHash;
  v451 = v122;
  CUAppendF();
  v328 = v10;

  self->_heySiriPerceptualHash = v327;
  v7 = 1;
  v10 = v328;
  v124 = objc_msgSend(v4, "heySiriProductType", v393, v451);
  LODWORD(v125) = self->_heySiriProductType;
  if (v124 == (_DWORD)v125)
  {
LABEL_95:
    v126 = [v4 heySiriRandom];
    heySiriRandom = self->_heySiriRandom;
    if (v126 == (_DWORD)heySiriRandom) {
      goto LABEL_96;
    }
    goto LABEL_269;
  }

LABEL_257:
  v329 = v124;
  v125 = (char)v125;
  if ((char)v125 > 4)
  {
    v330 = "?";
    if (v124 > 4) {
      goto LABEL_259;
    }
  }

  else
  {
    v330 = off_189FB2680[v125];
    if (v124 > 4)
    {
LABEL_259:
      v331 = "?";
      goto LABEL_268;
    }
  }

  v331 = off_189FB2680[(char)v124];
LABEL_268:
  v395 = v330;
  v453 = v331;
  CUAppendF();
  v336 = v10;

  self->_heySiriProductType = v329;
  v7 = 1;
  v10 = v336;
  v126 = objc_msgSend(v4, "heySiriRandom", v395, v453);
  heySiriRandom = self->_heySiriRandom;
  if (v126 == (_DWORD)heySiriRandom)
  {
LABEL_96:
    v128 = [v4 heySiriSNR];
    heySiriSNR = self->_heySiriSNR;
    if (v128 == (_DWORD)heySiriSNR) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }

  identifier = self->_identifier;
  v152 = v150;
  v153 = identifier;
  if (v152 != v153)
  {
    v154 = v153;
    if (v153)
    {
      v155 = -[NSString isEqual:](v152, "isEqual:", v153);

      if ((v155 & 1) != 0) {
        goto LABEL_260;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_identifier, v327);
    v12 |= 0x80000000000uLL;
    v156 = [v4 idsDeviceID];
    v326 = (id)v156;
    if (!v156) {
      goto LABEL_271;
    }
    goto LABEL_266;
  }

  v156 = [v4 idsDeviceID];
  v326 = (id)v156;
  if (!v156)
  {
LABEL_271:
    v162 = [v4 interval];
    if (!v162) {
      goto LABEL_277;
    }
    goto LABEL_275;
  }

LABEL_269:
  v337 = v126;
  v396 = heySiriRandom;
  v454 = v126;
  CUAppendF();
  v338 = v10;

  self->_heySiriRandom = v337;
  v7 = 1;
  v10 = v338;
  v128 = objc_msgSend(v4, "heySiriSNR", v396, v454);
  heySiriSNR = self->_heySiriSNR;
  if (v128 != (_DWORD)heySiriSNR)
  {
LABEL_97:
    v130 = v128;
    v362 = heySiriSNR;
    v417 = v128;
    CUAppendF();
    v131 = v10;

    self->_heySiriSNR = v130;
    v7 = 1;
    v10 = v131;
  }

LABEL_98:
  objc_msgSend(v4, "nearbyActionAuthTagData", v362, v417);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionAuthTagData = self->_nearbyActionAuthTagData;
  v134 = v132;
  v135 = nearbyActionAuthTagData;
  if (v134 == v135)
  {

    v165 = v134;
  }

  else
  {
    v136 = v135;
    if ((v134 == 0LL) != (v135 != 0LL))
    {
      v137 = -[NSData isEqual:](v134, "isEqual:", v135);

      if ((v137 & 1) != 0)
      {
        v138 = [v4 nearbyActionColorCode];
        nearbyActionColorCode = (void *)self->_nearbyActionColorCode;
        if (v138 == (_DWORD)nearbyActionColorCode) {
          goto LABEL_103;
        }
        goto LABEL_102;
      }
    }

    else
    {
    }

    v7 = 1;
    CUPrintNSDataHex();
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v418 = v363 = v178;
    CUAppendF();
    v179 = v10;

    v180 = v134;
    v165 = self->_nearbyActionAuthTagData;
    self->_nearbyActionAuthTagData = v180;
    v10 = v179;
  }

  v138 = [v4 nearbyActionColorCode];
  nearbyActionColorCode = (void *)self->_nearbyActionColorCode;
  if (v138 != (_DWORD)nearbyActionColorCode)
  {
LABEL_102:
    v140 = v138;
    v363 = nearbyActionColorCode;
    v418 = v138;
    CUAppendF();
    v141 = v10;

    self->_nearbyActionColorCode = v140;
    v7 = 1;
    v10 = v141;
  }

LABEL_103:
  objc_msgSend(v4, "nearbyActionExtraData", v363, v418);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionExtraData = self->_nearbyActionExtraData;
  v144 = v142;
  v145 = nearbyActionExtraData;
  if (v144 == v145)
  {

    v166 = v144;
LABEL_137:

    goto LABEL_138;
  }

  v146 = v145;
  if ((v144 == 0LL) == (v145 != 0LL))
  {

    goto LABEL_136;
  }

  v147 = -[NSData isEqual:](v144, "isEqual:", v145);

  if ((v147 & 1) == 0)
  {
LABEL_136:
    CUPrintNSDataHex();
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v364 = v181;
    v419 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v182 = v114;
    v183 = v51;
    v184 = v10;

    v185 = v144;
    v166 = self->_nearbyActionExtraData;
    self->_nearbyActionExtraData = v185;
    v10 = v184;
    v51 = v183;
    v114 = v182;
    v7 = 1;
    goto LABEL_137;
  }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "CompanionLink");
      if ((discoveryFlags & 0x10) == 0)
      {
LABEL_34:
        if ((discoveryFlags & 0x20) == 0) {
          goto LABEL_35;
        }
        goto LABEL_105;
      }

LABEL_138:
  v186 = objc_msgSend(v4, "nearbyActionFlags", v364, v419);
  v465 = v134;
  v466 = v114;
  v464 = v144;
  if (v186 != self->_nearbyActionFlags)
  {
    CUPrintFlags32();
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v370 = v187;
    v427 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v188 = v10;

    self->_nearbyActionFlags = v186;
    v7 = 1;
    v10 = v188;
  }

  v189 = objc_msgSend(v4, "nearbyActionType", v370, v427);
  nearbyActionType = self->_nearbyActionType;
  if (v189 != nearbyActionType)
  {
    v371 = CBNearbyActionTypeToString(nearbyActionType);
    v428 = CBNearbyActionTypeToString(v189);
    CUAppendF();
    v191 = v10;

    self->_nearbyActionType = v189;
    v7 = 1;
    v10 = v191;
  }

  objc_msgSend(v4, "nearbyActionTargetData", v371, v428);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionTargetData = self->_nearbyActionTargetData;
  v194 = v192;
  v195 = nearbyActionTargetData;
  if (v194 == v195)
  {

    v198 = v194;
LABEL_149:

    goto LABEL_150;
  }

  v196 = v195;
  if ((v194 == 0LL) == (v195 != 0LL))
  {

    goto LABEL_148;
  }

  v197 = -[NSData isEqual:](v194, "isEqual:", v195);

  if ((v197 & 1) == 0)
  {
LABEL_148:
    v7 = 1;
    CUPrintNSDataHex();
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v372 = v199;
    v429 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v200 = v10;

    v201 = v194;
    v198 = self->_nearbyActionTargetData;
    self->_nearbyActionTargetData = v201;
    v10 = v200;
    goto LABEL_149;
  }

LABEL_150:
  v202 = objc_msgSend(v4, "nearbyActionV2Flags", v372, v429);
  v463 = v194;
  if (v202 != self->_nearbyActionV2Flags)
  {
    CUPrintFlags32();
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v373 = v203;
    v430 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v204 = v10;

    self->_nearbyActionV2Flags = v202;
    v7 = 1;
    v10 = v204;
  }

  objc_msgSend(v4, "nearbyActionV2TargetData", v373, v430);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionV2TargetData = self->_nearbyActionV2TargetData;
  v207 = v205;
  v208 = nearbyActionV2TargetData;
  if (v207 == v208)
  {

    v238 = v207;
  }

  else
  {
    v209 = v208;
    if ((v207 == 0LL) != (v208 != 0LL))
    {
      v210 = -[NSData isEqual:](v207, "isEqual:", v208);

      if ((v210 & 1) != 0)
      {
        v211 = [v4 nearbyActionV2Type];
        nearbyActionV2Type = self->_nearbyActionV2Type;
        if (v211 == nearbyActionV2Type) {
          goto LABEL_157;
        }
        goto LABEL_156;
      }
    }

    else
    {
    }

    v7 = 1;
    CUPrintNSDataHex();
    v240 = (char *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v374 = v240;
    v431 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v241 = v10;

    v242 = v207;
    v238 = self->_nearbyActionV2TargetData;
    self->_nearbyActionV2TargetData = v242;
    v10 = v241;
  }

  v211 = [v4 nearbyActionV2Type];
  nearbyActionV2Type = self->_nearbyActionV2Type;
  if (v211 != nearbyActionV2Type)
  {
LABEL_156:
    v374 = CBNearbyActionTypeToString(nearbyActionV2Type);
    v431 = (void *)CBNearbyActionTypeToString(v211);
    CUAppendF();
    v213 = v10;

    self->_nearbyActionV2Type = v211;
    v7 = 1;
    v10 = v213;
  }

  *p_bleScanRate = 20;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "Low"))
  {
LABEL_51:
    if (strcmp(string, "MediumLow")) {
      goto LABEL_52;
    }
    goto LABEL_152;
  }

LABEL_157:
  v214 = objc_msgSend(v4, "nearbyInfoFlags", v374, v431);
  v462 = v207;
  if (v214 != self->_nearbyInfoFlags)
  {
    CUPrintFlags32();
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v375 = v215;
    v432 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v216 = v10;

    self->_nearbyInfoFlags = v214;
    v7 = 1;
    v10 = v216;
  }

  objc_msgSend(v4, "nearbyInfoStatusProgress", v375, v432);
  v218 = v217;
  nearbyInfoStatusProgress = self->_nearbyInfoStatusProgress;
  if (v218 != nearbyInfoStatusProgress)
  {
    v376 = nearbyInfoStatusProgress * 100.0;
    v433 = v218 * 100.0;
    CUAppendF();
    v220 = v10;

    self->_nearbyInfoStatusProgress = v218;
    v7 = 1;
    v10 = v220;
  }

  v221 = objc_msgSend(v4, "nearbyInfoStatusTime", *(void *)&v376, *(void *)&v433);
  LODWORD(v222) = self->_nearbyInfoStatusTime;
  if (v221 == (_DWORD)v222)
  {
    v223 = [v4 nearbyInfoStatusType];
    LODWORD(v224) = self->_nearbyInfoStatusType;
    if (v223 == (_DWORD)v224) {
      goto LABEL_163;
    }
    goto LABEL_263;
  }

  v235 = v221;
  v222 = (char)v222;
  if ((char)v222 > 0xE)
  {
    v236 = "?";
    if (v221 > 0xE) {
      goto LABEL_172;
    }
  }

  else
  {
    v236 = off_189FB26A8[v222];
    if (v221 > 0xE)
    {
LABEL_172:
      v237 = "?";
      goto LABEL_262;
    }
  }

  v237 = off_189FB26A8[(char)v221];
LABEL_262:
  v394 = v236;
  v452 = v237;
  CUAppendF();
  v332 = v10;

  self->_nearbyInfoStatusTime = v235;
  v7 = 1;
  v10 = v332;
  v223 = objc_msgSend(v4, "nearbyInfoStatusType", v394, v452);
  LODWORD(v224) = self->_nearbyInfoStatusType;
  if (v223 == (_DWORD)v224)
  {
LABEL_163:
    v225 = [v4 nearbyInfoV2DecryptedFlags];
    if (v225 == self->_nearbyInfoV2DecryptedFlags) {
      goto LABEL_164;
    }
    goto LABEL_274;
  }

LABEL_263:
  v333 = v223;
  v224 = (char)v224;
  if ((char)v224 > 0xD)
  {
    v334 = "?";
    if (v223 > 0xD) {
      goto LABEL_265;
    }
  }

  else
  {
    v334 = off_189FB2720[v224];
    if (v223 > 0xD)
    {
LABEL_265:
      v335 = "?";
      goto LABEL_273;
    }
  }

  v335 = off_189FB2720[(char)v223];
LABEL_273:
  v397 = v334;
  v455 = v335;
  CUAppendF();
  v339 = v10;

  self->_nearbyInfoStatusType = v333;
  v7 = 1;
  v10 = v339;
  v225 = objc_msgSend(v4, "nearbyInfoV2DecryptedFlags", v397, v455);
  if (v225 == self->_nearbyInfoV2DecryptedFlags)
  {
LABEL_164:
    v226 = [v4 nearbyInfoV2Flags];
    if (v226 == self->_nearbyInfoV2Flags) {
      goto LABEL_166;
    }
    goto LABEL_165;
  }

LABEL_274:
  CUPrintFlags32();
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintFlags32();
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v341 = v10;

  self->_nearbyInfoV2DecryptedFlags = v225;
  v7 = 1;
  v10 = v341;
  v226 = objc_msgSend(v4, "nearbyInfoV2Flags", v340, v456);
  if (v226 != self->_nearbyInfoV2Flags)
  {
LABEL_165:
    CUPrintFlags32();
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v377 = v227;
    v434 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v228 = v10;

    self->_nearbyInfoV2Flags = v226;
    v7 = 1;
    v10 = v228;
  }

LABEL_166:
  objc_msgSend(v4, "nearbyInfoV2AuthIntegrityTagData", v377, v434);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyInfoV2AuthIntegrityTagData = self->_nearbyInfoV2AuthIntegrityTagData;
  v231 = v229;
  v232 = nearbyInfoV2AuthIntegrityTagData;
  if (v231 == v232)
  {

    v239 = v231;
LABEL_181:

    goto LABEL_182;
  }

  v233 = v232;
  if ((v231 == 0LL) == (v232 != 0LL))
  {

    goto LABEL_180;
  }

  v234 = -[NSData isEqual:](v231, "isEqual:", v232);

  if ((v234 & 1) == 0)
  {
LABEL_180:
    v7 = 1;
    CUPrintNSDataHex();
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v378 = v243;
    v435 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v244 = v10;

    v245 = v231;
    v239 = self->_nearbyInfoV2AuthIntegrityTagData;
    self->_nearbyInfoV2AuthIntegrityTagData = v245;
    v10 = v244;
    goto LABEL_181;
  }

LABEL_182:
  objc_msgSend(v4, "nearbyInfoV2AuthTagData", v378, v435);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
  v248 = v246;
  v249 = nearbyInfoV2AuthTagData;
  if (v248 == v249)
  {

    v274 = v248;
  }

  else
  {
    v250 = v249;
    if ((v248 == 0LL) != (v249 != 0LL))
    {
      v251 = -[NSData isEqual:](v248, "isEqual:", v249);

      if ((v251 & 1) != 0)
      {
        v252 = [v4 nearbyInfoV2InvitationCounter];
        nearbyInfoV2InvitationCounter = self->_nearbyInfoV2InvitationCounter;
        if (v252 == (_DWORD)nearbyInfoV2InvitationCounter) {
          goto LABEL_186;
        }
        goto LABEL_211;
      }
    }

    else
    {
    }

    v7 = 1;
    CUPrintNSDataHex();
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v379 = v276;
    v436 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v277 = v10;

    v278 = v248;
    v274 = self->_nearbyInfoV2AuthTagData;
    self->_nearbyInfoV2AuthTagData = v278;
    v10 = v277;
  }

  v252 = [v4 nearbyInfoV2InvitationCounter];
  nearbyInfoV2InvitationCounter = self->_nearbyInfoV2InvitationCounter;
  if (v252 == (_DWORD)nearbyInfoV2InvitationCounter)
  {
LABEL_186:
    v254 = objc_msgSend(v4, "nearbyInfoV2InvitationTypes", v379, v436);
    nearbyInfoV2InvitationTypes = self->_nearbyInfoV2InvitationTypes;
    if (v254 == (_DWORD)nearbyInfoV2InvitationTypes) {
      goto LABEL_187;
    }
    goto LABEL_212;
  }

LABEL_211:
  v279 = v252;
  v383 = nearbyInfoV2InvitationCounter;
  v440 = v252;
  CUAppendF();
  v280 = v10;

  self->_nearbyInfoV2InvitationCounter = v279;
  v7 = 1;
  v10 = v280;
  v254 = objc_msgSend(v4, "nearbyInfoV2InvitationTypes", v383, v440);
  nearbyInfoV2InvitationTypes = self->_nearbyInfoV2InvitationTypes;
  if (v254 == (_DWORD)nearbyInfoV2InvitationTypes)
  {
LABEL_187:
    v256 = [v4 nearbyInfoV2InvitationRouteType];
    nearbyInfoV2InvitationRouteType = self->_nearbyInfoV2InvitationRouteType;
    if (v256 == (_DWORD)nearbyInfoV2InvitationRouteType) {
      goto LABEL_188;
    }
LABEL_213:
    v283 = v256;
    v385 = nearbyInfoV2InvitationRouteType;
    v442 = v256;
    CUAppendF();
    v284 = v10;

    self->_nearbyInfoV2InvitationRouteType = v283;
    v7 = 1;
    v10 = v284;
    v258 = objc_msgSend(v4, "nearbyActionNoWakeType", v385, v442);
    nearbyActionNoWakeType = self->_nearbyActionNoWakeType;
    if (v258 == nearbyActionNoWakeType) {
      goto LABEL_200;
    }
    goto LABEL_189;
  }

LABEL_212:
  v281 = v254;
  v384 = nearbyInfoV2InvitationTypes;
  v441 = v254;
  CUAppendF();
  v282 = v10;

  self->_nearbyInfoV2InvitationTypes = v281;
  v7 = 1;
  v10 = v282;
  v256 = objc_msgSend(v4, "nearbyInfoV2InvitationRouteType", v384, v441);
  nearbyInfoV2InvitationRouteType = self->_nearbyInfoV2InvitationRouteType;
  if (v256 != (_DWORD)nearbyInfoV2InvitationRouteType) {
    goto LABEL_213;
  }
LABEL_188:
  v258 = [v4 nearbyActionNoWakeType];
  nearbyActionNoWakeType = self->_nearbyActionNoWakeType;
  if (v258 == nearbyActionNoWakeType) {
    goto LABEL_200;
  }
LABEL_189:
  v260 = v258;
  v261 = "?";
  if (nearbyActionNoWakeType == 1) {
    v262 = "PrecisionFinding";
  }
  else {
    v262 = "?";
  }
  if (nearbyActionNoWakeType) {
    v263 = v262;
  }
  else {
    v263 = "Unspecified";
  }
  if (v258 == 1) {
    v261 = "PrecisionFinding";
  }
  if (!v258) {
    v261 = "Unspecified";
  }
  v380 = v263;
  v437 = v261;
  CUAppendF();
  v264 = v10;

  self->_nearbyActionNoWakeType = v260;
  v7 = 1;
  v10 = v264;
LABEL_200:
  v265 = objc_msgSend(v4, "nearbyActionNWPrecisionFindingStatus", v380, v437);
  v460 = v248;
  v461 = v231;
  if (v265 != self->_nearbyActionNWPrecisionFindingStatus)
  {
    CUPrintFlags32();
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v381 = v266;
    v438 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v267 = v10;

    self->_nearbyActionNWPrecisionFindingStatus = v265;
    v7 = 1;
    v10 = v267;
  }

  objc_msgSend(v4, "nearbyActionNoWakeAuthTagData", v381, v438);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
  v270 = v268;
  v271 = nearbyActionNoWakeAuthTagData;
  if (v270 == v271)
  {

    v275 = v270;
LABEL_217:

    goto LABEL_218;
  }

  v272 = v271;
  if ((v270 == 0LL) == (v271 != 0LL))
  {

    goto LABEL_216;
  }

  v273 = -[NSData isEqual:](v270, "isEqual:", v271);

  if ((v273 & 1) == 0)
  {
LABEL_216:
    v7 = 1;
    CUPrintNSDataHex();
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v382 = v285;
    v439 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v286 = v10;

    v287 = v270;
    v275 = self->_nearbyActionNoWakeAuthTagData;
    self->_nearbyActionNoWakeAuthTagData = v287;
    v10 = v286;
    goto LABEL_217;
  }

LABEL_218:
  objc_msgSend(v4, "nearbyActionNoWakeConfigData", v382, v439);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
  v290 = v288;
  v291 = nearbyActionNoWakeConfigData;
  if (v290 == v291)
  {

    v294 = v290;
LABEL_225:

    goto LABEL_226;
  }

  v292 = v291;
  if ((v290 == 0LL) == (v291 != 0LL))
  {

    goto LABEL_224;
  }

  v293 = -[NSData isEqual:](v290, "isEqual:", v291);

  if ((v293 & 1) == 0)
  {
LABEL_224:
    v7 = 1;
    CUPrintNSDataHex();
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v386 = v295;
    v443 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v296 = v10;

    v297 = v290;
    v294 = self->_nearbyActionNoWakeConfigData;
    self->_nearbyActionNoWakeConfigData = v297;
    v10 = v296;
    goto LABEL_225;
  }

LABEL_226:
  v458 = v290;
  v468 = v51;
  objc_msgSend(v4, "safetyAlertsAlertData", v386, v443);
  v298 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (v298 == self->_safetyAlertsAlertData)
  {
    v299 = v7;
  }

  else
  {
    v299 = 1;
    CUPrintNSDataHex();
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v387 = v300;
    v444 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v301 = v10;

    objc_storeStrong((id *)&self->_safetyAlertsAlertData, v298);
    v10 = v301;
  }

  v459 = v270;
  objc_msgSend(v4, "safetyAlertsAlertID", v387, v444);
  v302 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (v302 != self->_safetyAlertsAlertID)
  {
    v299 = 1;
    CUPrintNSDataHex();
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v388 = v303;
    v445 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v304 = v10;

    objc_storeStrong((id *)&self->_safetyAlertsAlertID, v302);
    v10 = v304;
  }

  v457 = v298;
  objc_msgSend(v4, "safetyAlertsSignature", v388, v445);
  v305 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (v305 != self->_safetyAlertsSignature)
  {
    v299 = 1;
    CUPrintNSDataHex();
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v389 = v306;
    v446 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v307 = v4;
    v308 = v10;

    objc_storeStrong((id *)&self->_safetyAlertsSignature, v305);
    v10 = v308;
    v4 = v307;
  }

  v309 = objc_msgSend(v4, "safetyAlertsVersion", v389, v446);
  if (v309 != self->_safetyAlertsVersion)
  {
    v310 = v309;
    safetyAlertsVersion = self->_safetyAlertsVersion;
    v447 = v309;
    CUAppendF();
    v311 = v10;

    self->_safetyAlertsVersion = v310;
    v299 = 1;
    v10 = v311;
  }

  objc_msgSend(v4, "watchSetupData", safetyAlertsVersion, v447);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  watchSetupData = self->_watchSetupData;
  v314 = v312;
  v315 = watchSetupData;
  if (v314 == v315)
  {

    v321 = v314;
    goto LABEL_245;
  }

  v316 = v315;
  if ((v314 == 0LL) == (v315 != 0LL))
  {

    goto LABEL_244;
  }

  v317 = -[NSData isEqual:](v314, "isEqual:", v315);

  if ((v317 & 1) == 0)
  {
LABEL_244:
    v299 = 1;
    CUPrintNSDataHex();
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v448 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v323 = v10;

    v324 = v314;
    v321 = self->_watchSetupData;
    self->_watchSetupData = v324;
    v10 = v323;
LABEL_245:

    v318 = v299;
    v319 = v459;
    var0 = self->_ucat->var0;
    if (v10) {
      goto LABEL_239;
    }
LABEL_246:
    goto LABEL_279;
  }

  v318 = v299;
  v319 = v459;
  var0 = self->_ucat->var0;
  if (!v10) {
    goto LABEL_246;
  }
LABEL_239:
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_248:
  }
    LogPrintF_safe();
LABEL_279:

  return v318;
}

void sub_186FBAE14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_186FBB550(_Unwind_Exception *a1)
{
}

void CBLogInit()
{
  os_log_t v0 = os_log_create("com.apple.bluetooth", "CoreBluetooth");
  v1 = (void *)CBLogComponent;
  CBLogComponent = (uint64_t)v0;
}

LABEL_29:
    v18 = 1;
    goto LABEL_30;
  }

  [MEMORY[0x189607968] numberWithUnsignedShort:v12];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [&unk_189FD6500 containsObject:v14];

  if (CBLogInitOnce == -1)
  {
    v16 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:
      uint64_t v17 = "APPROVED";
      v25 = 136447234;
      v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
      *(_DWORD *)v28 = v6;
      uint64_t v27 = 1024;
      if (v15) {
        uint64_t v17 = "REJECTED";
      }
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v12;
      v29 = 2112;
      v30 = &unk_189FD6500;
      v31 = 2082;
      v32 = v17;
      _os_log_impl( &dword_186F9B000,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}s - Apple device type=%d (HID) - checking PID 0x%04X against rejected list %@ ->%{public}s",  (uint8_t *)&v25,  0x2Cu);
    }
  }

  else
  {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    v16 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
  }

  v18 = v15 ^ 1;
LABEL_30:

  return v18;
}

  self->_objectSetupFlags = 0;
  objectSetupFontCode = self->_objectSetupFontCode;
  self->_objectSetupFontCode = 0LL;

  objectSetupMessage = self->_objectSetupMessage;
  self->_objectSetupMessage = 0LL;

  if ((discoveryFlags & 0x80000000) != 0)
  {
LABEL_14:
    if ((discoveryFlags & 0x40000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }

  v16 = 0LL;
  uint64_t v17 = (v6 & 0x10) == 0;
  v18 = !v10;
  if (v17) {
    v18 = 1;
  }
  if ((v18 & 1) == 0 && a4 - a3 >= 2) {
    v16 = bswap32(*(unsigned __int16 *)a3) >> 16;
  }
  if ((_DWORD)v16 != -[CBDevice airplayTargetPort](self, "airplayTargetPort", a3))
  {
    -[CBDevice setAirplayTargetPort:](self, "setAirplayTargetPort:", v16);
    v8 = 0x8000000000LL;
  }

  self->_discoveryFlags |= 0x8000000000uLL;
  self->_changeFlags |= v8;
}

  if (a4 - v5 <= 1) {
    v11 = 0;
  }
  if (!v11)
  {
    v18 = 0LL;
    if (!-[CBDevice heySiriDeviceClass](self, "heySiriDeviceClass")) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }

  uint64_t v17 = *(unsigned __int16 *)v5;
  v5 += 2;
  v18 = bswap32(v17) >> 16;
  if ((_DWORD)v18 != -[CBDevice heySiriDeviceClass](self, "heySiriDeviceClass"))
  {
LABEL_35:
    -[CBDevice setHeySiriDeviceClass:](self, "setHeySiriDeviceClass:", v18);
    uint64_t v9 = 0x400000000000000LL;
  }

LABEL_24:
  return v14;
}
}
}
          }

          v12 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }

        while (v12);
      }
    }

    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v39,  v45,  16LL);
  }

  while (v29);

  if ((v9 & 1) != 0) {
    goto LABEL_31;
  }
LABEL_32:
  if ((v21 & 1) == 0 && (*(_BYTE *)&v26->_delegateFlags & 0x20) != 0)
  {
    v20 = -[CBPeripheralManager delegate](v26, "delegate");
    [v20 peripheralManager:v26 central:v4 didUnsubscribeFromCharacteristic:v22];
  }

  objc_sync_exit(v23);
}

  -[CBDevice setMspAddressData:](self, "setMspAddressData:", 0LL);
  -[CBDevice setMspDeviceClass:](self, "setMspDeviceClass:", 0LL);
  -[CBDevice setMspDisplayName:](self, "setMspDisplayName:", 0LL);
  -[CBDevice setMspSubScenario:](self, "setMspSubScenario:", 0LL);
  if ((discoveryFlags & 0x5030800010083E37LL) != 0)
  {
LABEL_9:
    if ((discoveryFlags & 0x400020108LL) != 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }

LABEL_18:
  v12 = 0LL;
LABEL_19:

  return v12;
}

  if (-[NSData length](v7->_btAddressData, "length") == 7 && !(v7->_addressType | v7->_btAddressType)) {
    v7->_addressType = *(_BYTE *)-[NSData bytes](v7->_btAddressData, "bytes");
  }
  uint64_t v17 = v7;
LABEL_22:

  return v17;
}
}

  v11 = 0LL;
  if ((v8 & 8) == 0) {
    goto LABEL_25;
  }
LABEL_19:
  v12 = -[CBDevice airplaySourceUWBConfigData](self, "airplaySourceUWBConfigData");
  uint64_t v13 = v23;
  v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_25;
  }

  v15 = v14;
  if ((v13 == 0LL) != (v14 != 0LL))
  {
    v16 = [v13 isEqual:v14];

    if ((v16 & 1) == 0)
    {
      -[CBDevice setAirplaySourceUWBConfigData:](self, "setAirplaySourceUWBConfigData:", v13);
      uint64_t v9 = 0x4000000000LL;
      if ((v8 & 0x10) == 0) {
        goto LABEL_36;
      }
      goto LABEL_26;
    }

  if (v10 == self->_objectSetupBatteryState)
  {
    if (v12 == self->_objectSetupColorCode) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  self->_objectSetupBatteryState = v10;
  v16 = 0x10000LL;
  if (v12 != self->_objectSetupColorCode)
  {
LABEL_20:
    self->_objectSetupColorCode = v12;
    v16 = 0x10000LL;
  }

  if (v10 == self->_objectSetupBatteryState)
  {
    if (v12 == self->_objectSetupColorCode) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  self->_objectSetupBatteryState = v10;
  v16 = 0x10000LL;
  if (v12 != self->_objectSetupColorCode)
  {
LABEL_20:
    self->_objectSetupColorCode = v12;
    v16 = 0x10000LL;
  }

  v15 = 0LL;
  if (self->_proximityServiceProductID != v14)
  {
LABEL_25:
    self->_proximityServiceProductID = v14;
    v15 = 0x100000000LL;
  }

LABEL_4:
        v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v10);
    }

    v8 = v27;
  }

  else if ([v8 isEqualToString:@"properties"])
  {
    if ((-[CBCharacteristic properties](self, "properties") & 1) != 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 handleFailureInMethod:a2 object:self file:@"CBCharacteristic.m" lineNumber:206 description:@"CBCharacteristicPropertyBroadcast is not allowed"];

      if ((-[CBCharacteristic properties](self, "properties") & 0x80) == 0) {
        goto LABEL_24;
      }
    }

    else if ((-[CBCharacteristic properties](self, "properties") & 0x80) == 0)
    {
      goto LABEL_24;
    }

    [MEMORY[0x1896077D8] currentHandler];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 handleFailureInMethod:a2 object:self file:@"CBCharacteristic.m" lineNumber:207 description:@"CBCharacteristicPropertyExtendedProperties is not allowed"];
  }
}
}

  if (a4 - a3 < 1)
  {
    v7 = 0.0;
  }

  else
  {
    v6 = *(unsigned __int8 *)a3++;
    v7 = (float)v6;
  }

  v8 = (int)(float)(v7 / 100.0);
  if (self->_batteryInfoMain != v8)
  {
    self->_batteryInfoMain = v8;
    self->_changedTypesInternal.bitArray[1] |= 4u;
  }

  if (a4 - a3 <= 0)
  {
    self->_transmitPowerOne = 0;
    goto LABEL_17;
  }

  self->_transmitPowerOne = *a3;
  if ((uint64_t)&a4[~(unint64_t)a3] <= 0)
  {
LABEL_17:
    self->_transmitPowerTwo = 0;
    self->_transmitPowerThree = 0;
    self->_discoveryTypesInternal.bitArray[1] |= 4u;
    return;
  }

  self->_transmitPowerTwo = a3[1];
  if (a4 - (a3 + 2) < 1) {
    self->_transmitPowerThree = 0;
  }
  else {
    self->_transmitPowerThree = a3[2];
  }
  self->_discoveryTypesInternal.bitArray[1] |= 4u;
}

LABEL_44:
      goto LABEL_45;
    }

    v12 = 0;
  }

  if (a4 - v5 <= 0) {
    v11 = 0;
  }
  if (!v11)
  {
    v29 = 0;
    v31 = 0LL;
    if (!-[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount")) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }

  v30 = *v5++;
  v29 = v30;
  v31 = v30 & 7;
  if ((_DWORD)v31 != -[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount"))
  {
LABEL_50:
    -[CBDevice setAccessoryStatusLidOpenCount:](self, "setAccessoryStatusLidOpenCount:", v31);
    v18 = 1;
  }

    v25 = 512;
LABEL_45:
    v26 = v23 & 0x7F;
    if (v26 >= 100) {
      v26 = 100;
    }
    uint64_t v27 = v25 | v26;
    if (v27 != self->_batteryInfoRight) {
      goto LABEL_48;
    }
    goto LABEL_49;
  }

  LOWORD(v27) = 0;
  if (self->_batteryInfoRight)
  {
LABEL_48:
    self->_batteryInfoRight = v27;
    v9 |= 0x80000000080uLL;
  }

  if (a4 - v5 <= 0) {
    v11 = 0;
  }
  if (!v11)
  {
    v29 = 0;
    v31 = 0LL;
    if (!-[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount")) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }

  v30 = *v5++;
  v29 = v30;
  v31 = v30 & 7;
  if ((_DWORD)v31 != -[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount"))
  {
LABEL_50:
    -[CBDevice setAccessoryStatusLidOpenCount:](self, "setAccessoryStatusLidOpenCount:", v31);
    v18 = 1;
  }

  self->_discoveryFlags |= 0x100000000uLL;
  self->_changeFlags |= v15;
}

LABEL_47:
  return v12;
}

  v14[2](v14);
  _Block_object_dispose(&v55, 8);
}

  [v4 deviceFilter];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  deviceFilter = self->_deviceFilter;
  v29 = v27;
  v30 = deviceFilter;
  if (v29 == v30)
  {
  }

  else
  {
    v31 = v30;
    if ((v29 == 0LL) != (v30 != 0LL))
    {
      v32 = -[NSArray isEqual:](v29, "isEqual:", v30);

      if ((v32 & 1) != 0)
      {
        if ([v4 discoveryFlags] == self->_discoveryFlags) {
          goto LABEL_52;
        }
        goto LABEL_51;
      }
    }

    else
    {
    }

    CUPrintNSObjectOneLine();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 deviceFilter];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v47 = v9;

    objc_msgSend(v4, "deviceFilter", v45, v133);
    v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v29 = self->_deviceFilter;
    self->_deviceFilter = v48;
    v7 = 1;
    uint64_t v9 = v47;
  }

  if ([v4 discoveryFlags] != self->_discoveryFlags)
  {
LABEL_51:
    CUPrintFlags64();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 discoveryFlags];
    CUPrintFlags64();
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v34 = v9;

    self->_discoveryFlags = objc_msgSend(v4, "discoveryFlags", v33, v131);
    v7 = 1;
    uint64_t v9 = v34;
  }

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_186FC2A90(_Unwind_Exception *a1)
{
}

void sub_186FC2D10(_Unwind_Exception *a1)
{
}

void sub_186FC2FFC(_Unwind_Exception *a1)
{
}

void sub_186FC3C18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_186FC3F18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_186FC3F30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_42:
        v110[1] = v41;
        NSAppendPrintF_safe();
        v47 = v41;

        v41 = v47;
        goto LABEL_43;
      }
    }

    v111 = v41;
    v48 = &v111;
    goto LABEL_47;
  }

  if ((a3 & 0x8000000) != 0)
  {
    v15 = 0LL;
    v16 = self->_audioLinkQualityArray;
    if (!-[NSArray count](v16, "count")) {
      goto LABEL_11;
    }
  }

  else
  {
    v103 = 0LL;
    NSAppendPrintF_safe();
    v15 = 0LL;
    v16 = v3->_audioLinkQualityArray;
    if (!-[NSArray count](v16, "count"))
    {
LABEL_11:
      v95 = v15;
      goto LABEL_25;
    }
  }

  uint64_t v17 = v3;
  v102 = v15;
  NSAppendPrintF_safe();
  v18 = v15;

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v19 = v16;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v98,  v120,  16LL);
  if (v20)
  {
    v21 = v20;
    v22 = *(void *)v99;
    v23 = "";
    do
    {
      if (*(void *)v99 != v22) {
        objc_enumerationMutation(v19);
      }
      v24 = **((void **)&v98 + 1);
      v97 = v18;
      v81 = v23;
      v88 = v24;
      NSAppendPrintF_safe();
      v25 = v18;

      if (v21 < 2)
      {
        v18 = v25;
      }

      else
      {
        for (i = 1LL; i != v21; ++i)
        {
          if (*(void *)v99 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v27 = *(void *)(*((void *)&v98 + 1) + 8 * i);
          v97 = v25;
          v81 = ", ";
          v88 = v27;
          NSAppendPrintF_safe();
          v18 = v25;

          v25 = v18;
        }
      }

      v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v98,  v120,  16LL,  v81,  v88);
      v23 = ", ";
    }

    while (v21);
  }

  v96 = v18;
  NSAppendPrintF_safe();
  v15 = v18;

  uint64_t v3 = v17;
  v95 = v15;
LABEL_25:
  NSAppendPrintF_safe();
  v28 = v95;

  v94 = v28;
  v29 = v3->_discoverableState;
  v30 = "?";
  v82 = (char *)v30;
  NSAppendPrintF_safe();
  v31 = v94;

  v32 = v3->_chipsetID;
  if (v32)
  {
    v93 = v31;
    v82 = v32;
    NSAppendPrintF_safe();
    v33 = v31;

    v31 = v33;
  }

  cloudSyncStatus = v3->_cloudSyncStatus;
  if (v3->_cloudSyncStatus)
  {
    v92 = v31;
    if (cloudSyncStatus > 3) {
      v35 = "?";
    }
    else {
      v35 = off_189FB2D30[(char)(cloudSyncStatus - 1)];
    }
    v82 = (char *)v35;
    NSAppendPrintF_safe();
    v54 = v92;

    v31 = v54;
  }

  fastLEConnectionInfoVersion = (char *)v3->_fastLEConnectionInfoVersion;
  if (v3->_fastLEConnectionInfoVersion)
  {
    v91[1] = v31;
    v82 = fastLEConnectionInfoVersion;
    NSAppendPrintF_safe();
    v56 = v31;

    v31 = v56;
  }

  v57 = v3->_firmwareName;
  v58 = v3->_firmwareVersion;
  v45 = v57;
  v59 = v58;
  v60 = v59;
  if (v45 != v59)
  {
    if ((v45 == 0LL) != (v59 != 0LL))
    {
      v61 = -[NSArray isEqual:](v45, "isEqual:", v59, v82);

      if ((v61 & 1) != 0)
      {
        if (!v60) {
          goto LABEL_72;
        }
        goto LABEL_62;
      }
    }

    else
    {
    }

    if (v45)
    {
      v90[1] = v31;
      NSAppendPrintF_safe();
      v67 = v31;

      v31 = v67;
    }

    if (!v60) {
      goto LABEL_72;
    }
    v90[0] = v31;
    v62 = (id *)v90;
    goto LABEL_71;
  }

  if (v60)
  {
LABEL_62:
    v91[0] = v31;
    v62 = (id *)v91;
LABEL_71:
    NSAppendPrintF_safe();
    v68 = *v62;

    v31 = v68;
  }

  if (a4 - v5 <= 3) {
    v15 = 0;
  }
  if (!v15)
  {
    v25 = 0LL;
    homeKitV2AuthTagData = self->_homeKitV2AuthTagData;
    uint64_t v27 = (NSData *)0LL;
    v28 = homeKitV2AuthTagData;
    if (v27 != v28) {
      goto LABEL_46;
    }
LABEL_50:

    goto LABEL_53;
  }

  v25 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v5 length:4];
  uint64_t v26 = self->_homeKitV2AuthTagData;
  uint64_t v27 = v25;
  v28 = v26;
  if (v27 == v28) {
    goto LABEL_50;
  }
LABEL_46:
  v29 = v28;
  if ((v27 == 0LL) != (v28 != 0LL))
  {
    v30 = -[NSData isEqual:](v27, "isEqual:", v28);

    if ((v30 & 1) != 0) {
      goto LABEL_53;
    }
  }

  else
  {
  }

  objc_storeStrong((id *)&self->_homeKitV2AuthTagData, v25);
  v13 |= 0x1000000uLL;
LABEL_53:
  self->_discoveryFlags |= 0x1000000uLL;
  self->_changeFlags |= v13;
}

LABEL_72:
  v69 = v3->_hardwareAddressData;
  if (v69)
  {
    v70 = v69;
    CUPrintNSDataAddress();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v71 = v31;

    v31 = v71;
  }

  if (v3->_productID)
  {
    NSAppendPrintF_safe();
    v72 = v31;

    v31 = v72;
  }

  if (v3->_vendorID)
  {
    NSAppendPrintF_safe();
    v73 = v31;

    v31 = v73;
  }

  if (v3->_vendorIDSource)
  {
    NSAppendPrintF_safe();
    v74 = v31;

    v31 = v74;
  }

  if (v3->_hciTransportType)
  {
    NSAppendPrintF_safe();
    v75 = v31;

    v31 = v75;
  }

  NSAppendPrintF_safe();
  v76 = v31;

  NSAppendPrintF_safe();
  v77 = v76;

  CUPrintFlags32();
  v65 = (id)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v66 = (__CFString *)v77;

LABEL_83:
  if (v66) {
    v78 = v66;
  }
  else {
    v78 = &stru_189FB61A8;
  }
  v79 = v78;

  return v79;
}

LABEL_50:
                    v39 = 0;
                    goto LABEL_51;
                  }
                }
              }
            }
          }
        }
      }
    }

LABEL_49:
    v39 = 0;
LABEL_52:

    goto LABEL_53;
  }

  v39 = 0;
LABEL_53:

  return v39;
}

  if (v6) {
    uint64_t v26 = v6;
  }
  else {
    uint64_t v26 = @"?";
  }
  uint64_t v27 = v26;

  return v27;
}

  v28 = a4 - v5 > 2 && v12;
  if (v28)
  {
    v29 = *(unsigned __int16 *)v5 | (*((unsigned __int8 *)v5 + 2) << 16);
    v5 += 3;
  }

  else
  {
    v29 = 0;
  }

  v30 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%u.%u.%u",  HIWORD(v29),  BYTE1(v29),  v29);
  firmwareVersion = self->_firmwareVersion;
  v39 = v30;
  v32 = firmwareVersion;
  if (v39 == v32)
  {
  }

  else
  {
    if ((v39 == 0LL) == (v32 != 0LL))
    {

      goto LABEL_67;
    }

    v33 = -[NSString isEqual:](v39, "isEqual:", v32);

    if ((v33 & 1) == 0)
    {
LABEL_67:
      objc_storeStrong((id *)&self->_firmwareVersion, v30);
      v9 |= 0x80000000080uLL;
      if (a4 - v5 <= 0 || !v28) {
        goto LABEL_71;
      }
LABEL_64:
      v35 = *(unsigned __int8 *)v5;
      -[CBDevice accessoryStatusOBCTime](self, "accessoryStatusOBCTime");
      goto LABEL_72;
    }
  }

  if (a4 - v5 > 0 && v28) {
    goto LABEL_64;
  }
LABEL_71:
  v35 = 0;
  -[CBDevice accessoryStatusOBCTime](self, "accessoryStatusOBCTime");
  if (v38 != (double)0)
  {
LABEL_72:
    -[CBDevice setAccessoryStatusOBCTime:](self, "setAccessoryStatusOBCTime:", (double)(600 * v35));
    v9 |= 0x80000000080uLL;
  }

LABEL_14:
}
}

  if (!uuid_parse(v13, v8->_bytes))
  {
LABEL_18:

LABEL_19:
    v15 = v8;
    goto LABEL_20;
  }

  v6 = -[CBL2CAPChannel initWithPeer:info:](objc_alloc(&OBJC_CLASS___CBL2CAPChannel), "initWithPeer:info:", v9, v4);
  -[NSHashTable addObject:](self->_l2capChannels, "addObject:", v6);

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x40) != 0) {
    goto LABEL_15;
  }
LABEL_16:
}

LABEL_10:
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (!v11) {
          goto LABEL_29;
        }
        goto LABEL_8;
      }
    }
  }

  if ((*(_WORD *)&self->_delegateFlags & 0x10) != 0)
  {
LABEL_3:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained peripheral:self didDiscoverServices:v5];
  }

  if (self->_duplicateCount)
  {
    NSAppendPrintF_safe();
    uint64_t v9 = v7;

    v7 = v9;
  }

  return v7;
}

    v14 = 0LL;
    goto LABEL_5;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }

    goto LABEL_10;
  }

  v14 = v7;
LABEL_5:

  return v14;
}

  if (-[CBDevice nearbyActionV2Flags](self, "nearbyActionV2Flags") != (_DWORD)v5)
  {
    -[CBDevice setNearbyActionV2Flags:](self, "setNearbyActionV2Flags:", v5);
    uint64_t v9 = v8;
    if ((_DWORD)v6 == -[CBDevice nearbyActionV2Type](self, "nearbyActionV2Type")) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  uint64_t v9 = 0LL;
  if ((_DWORD)v6 != -[CBDevice nearbyActionV2Type](self, "nearbyActionV2Type"))
  {
LABEL_14:
    -[CBDevice setNearbyActionV2Type:](self, "setNearbyActionV2Type:", v6);
    uint64_t v9 = v8;
  }

    return;
  }
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

uint64_t CBProductIDFromNSString(void *a1)
{
  uint64_t result = [a1 UTF8String];
  if (result)
  {
    v2 = (const char *)result;
    if (!strcmp((const char *)result, "AirPods1,1"))
    {
      return 8194LL;
    }

    else if (!strcmp(v2, "AirPods1,3"))
    {
      return 8207LL;
    }

    else if (!strcmp(v2, "AirPodsPro1,1"))
    {
      return 8206LL;
    }

    else if (!strcmp(v2, "AppleTV5,3"))
    {
      return 28420LL;
    }

    else if (!strcmp(v2, "AppleTV6,2"))
    {
      return 28936LL;
    }

    else if (!strcmp(v2, "AppleTV11,2"))
    {
      return 29455LL;
    }

    else if (!strcmp(v2, "ATVRemote1,1"))
    {
      return 614LL;
    }

    else if (!strcmp(v2, "ATVRemote1,2"))
    {
      return 621LL;
    }

    else if (!strcmp(v2, "AudioAccessory1,1"))
    {
      return 28943LL;
    }

    else if (!strcmp(v2, "AudioAccessory1,2"))
    {
      return 28944LL;
    }

    else if (!strcmp(v2, "AudioAccessory5,1"))
    {
      return 29715LL;
    }

    else if (!strcmp(v2, "BeatsSolo3,1"))
    {
      return 8198LL;
    }

    else if (!strcmp(v2, "BeatsSoloPro1,1"))
    {
      return 8204LL;
    }

    else if (!strcmp(v2, "BeatsStudio3,2"))
    {
      return 8201LL;
    }

    else if (!strcmp(v2, "BeatsStudioPro1,1"))
    {
      return 8215LL;
    }

    else if (!strcmp(v2, "Device1,8230"))
    {
      return 8230LL;
    }

    else if (!strcmp(v2, "Device1,8229"))
    {
      return 8229LL;
    }

    else if (!strcmp(v2, "Device1,8218"))
    {
      return 8218LL;
    }

    else if (!strcmp(v2, "BeatsX1,1"))
    {
      return 8197LL;
    }

    else if (!strcmp(v2, "PowerBeats3,1"))
    {
      return 8195LL;
    }

    else if (!strcmp(v2, "Powerbeats4,1"))
    {
      return 8205LL;
    }

    else if (!strcmp(v2, "PowerbeatsPro1,1"))
    {
      return 8203LL;
    }

    else if (!strcmp(v2, "BeatsStudioBuds1,1"))
    {
      return 8209LL;
    }

    else if (!strcmp(v2, "BeatsStudioBuds1,2"))
    {
      return 8214LL;
    }

    else if (!strcmp(v2, "ApGn"))
    {
      return 65534LL;
    }

    else if (!strcmp(v2, "HeGn"))
    {
      return 65533LL;
    }

    else
    {
      unsigned int v10 = 0;
      if (sscanf(v2, "Device1,%u", &v10) != 1 || (v8 = v10) == 0 || (uint64_t v3 = CBProductIDToString(v10), !strcmp(v3, "?")))
      {
        int v9 = 0;
        BOOL v4 = sscanf(v2, "BTHeadphones%u,%u", &v9, &v10) == 2
          || sscanf(v2, "BTHeadset%u,%u", &v9, &v10) == 2
          || sscanf(v2, "BTSpeaker%u,%u", &v9, &v10) == 2;
        unsigned int v8 = 0;
        if (v4 && v9 == 76)
        {
          unsigned int v5 = v10;
          if (v10)
          {
            v6 = CBProductIDToString(v10);
            if (!strcmp(v6, "?")) {
              return 0;
            }
            else {
              return v5;
            }
          }
        }
      }

      return v8;
    }
  }

  return result;
}

const char *CBProductIDToString(int a1)
{
  if (a1 > 21759)
  {
    if (a1 <= 28943)
    {
      if (a1 > 28935)
      {
        if (a1 == 28936) {
          return "AppleTV6,2";
        }
        if (a1 == 28943) {
          return "AudioAccessory1,1";
        }
      }

      else
      {
        if (a1 == 21760) {
          return "Device1,21760";
        }
        if (a1 == 28420) {
          return "AppleTV5,3";
        }
      }
    }

    else if (a1 <= 29714)
    {
      if (a1 == 28944) {
        return "AudioAccessory1,2";
      }
      if (a1 == 29455) {
        return "AppleTV11,2";
      }
    }

    else
    {
      switch(a1)
      {
        case 29715:
          return "AudioAccessory5,1";
        case 65533:
          return "HeGn";
        case 65534:
          return "ApGn";
      }
    }

    return "?";
  }

  switch(a1)
  {
    case 8194:
      return "AirPods1,1";
    case 8195:
      return "PowerBeats3,1";
    case 8196:
    case 8199:
    case 8200:
    case 8225:
    case 8226:
    case 8227:
      return "?";
    case 8197:
      return "BeatsX1,1";
    case 8198:
      return "BeatsSolo3,1";
    case 8201:
      return "BeatsStudio3,2";
    case 8202:
      return "Device1,8202";
    case 8203:
      return "PowerbeatsPro1,1";
    case 8204:
      return "BeatsSoloPro1,1";
    case 8205:
      return "Powerbeats4,1";
    case 8206:
      return "AirPodsPro1,1";
    case 8207:
      return "AirPods1,3";
    case 8208:
      return "Device1,8208";
    case 8209:
      return "BeatsStudioBuds1,1";
    case 8210:
      return "Device1,8210";
    case 8211:
      return "Device1,8211";
    case 8212:
      return "Device1,8212";
    case 8213:
      return "Device1,8213";
    case 8214:
      return "BeatsStudioBuds1,2";
    case 8215:
      return "BeatsStudioPro1,1";
    case 8216:
      return "Device1,8216";
    case 8217:
      return "Device1,8217";
    case 8218:
      return "Device1,8218";
    case 8219:
      return "Device1,8219";
    case 8220:
      return "Device1,8220";
    case 8221:
      return "Device1,8221";
    case 8222:
      return "Device1,8222";
    case 8223:
      return "Device1,8223";
    case 8224:
      return "Device1,8224";
    case 8228:
      return "Device1,8228";
    case 8229:
      return "Device1,8229";
    case 8230:
      return "Device1,8230";
    default:
      if (a1 == 614)
      {
        uint64_t result = "ATVRemote1,1";
      }

      else
      {
        if (a1 != 621) {
          return "?";
        }
        uint64_t result = "ATVRemote1,2";
      }

      break;
  }

  return result;
}

LABEL_26:
    v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoInvalid);
    return v6;
  }

  switch(a3)
  {
    case 0x2002u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB188);
      break;
    case 0x2003u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB312);
      break;
    case 0x2004u:
    case 0x2007u:
    case 0x2008u:
    case 0x2015u:
    case 0x2018u:
    case 0x201Cu:
    case 0x2021u:
    case 0x2022u:
    case 0x2023u:
      goto LABEL_26;
    case 0x2005u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB282);
      break;
    case 0x2006u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB352);
      break;
    case 0x2009u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB443);
      break;
    case 0x200Au:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB515);
      break;
    case 0x200Bu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB444);
      break;
    case 0x200Cu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB419);
      break;
    case 0x200Du:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB364);
      break;
    case 0x200Eu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB298);
      break;
    case 0x200Fu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB288);
      break;
    case 0x2010u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB372);
      break;
    case 0x2011u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB507);
      break;
    case 0x2012u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB494);
      break;
    case 0x2013u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB688);
      break;
    case 0x2014u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB698);
      break;
    case 0x2016u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB607);
      break;
    case 0x2017u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB453);
      break;
    case 0x2019u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB768E);
      break;
    case 0x201Au:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB487);
      break;
    case 0x201Bu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB768M);
      break;
    case 0x201Du:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB498);
      break;
    case 0x201Eu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB768CHE);
      break;
    case 0x201Fu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB515C);
      break;
    case 0x2020u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB768CHM);
      break;
    case 0x2024u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB698C);
      break;
    case 0x2025u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB465);
      break;
    case 0x2026u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB463);
      break;
    default:
      unsigned int v5 = &CBProductInfoA111;
      switch(a3)
      {
        case 0x265u:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoD67);
          break;
        case 0x266u:
        case 0x268u:
        case 0x26Au:
        case 0x26Bu:
        case 0x26Du:
        case 0x26Eu:
        case 0x26Fu:
        case 0x270u:
        case 0x271u:
        case 0x272u:
        case 0x273u:
        case 0x274u:
        case 0x275u:
        case 0x276u:
        case 0x277u:
        case 0x278u:
        case 0x279u:
        case 0x27Au:
        case 0x27Bu:
        case 0x27Cu:
        case 0x27Du:
        case 0x27Eu:
        case 0x27Fu:
        case 0x280u:
        case 0x281u:
        case 0x282u:
        case 0x283u:
        case 0x284u:
        case 0x285u:
        case 0x286u:
        case 0x287u:
        case 0x288u:
        case 0x289u:
        case 0x28Au:
        case 0x28Bu:
        case 0x28Cu:
        case 0x28Du:
        case 0x28Eu:
        case 0x28Fu:
        case 0x290u:
        case 0x291u:
        case 0x292u:
        case 0x293u:
        case 0x294u:
        case 0x295u:
        case 0x296u:
        case 0x297u:
        case 0x298u:
        case 0x299u:
        case 0x29Bu:
        case 0x29Du:
        case 0x29Eu:
          goto LABEL_26;
        case 0x267u:
          goto LABEL_7;
        case 0x269u:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA125);
          break;
        case 0x26Cu:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA211);
          break;
        case 0x29Au:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA222);
          break;
        case 0x29Cu:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA222e);
          break;
        case 0x29Fu:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA223);
          break;
        default:
          switch(a3)
          {
            case 0x320u:
              v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA281);
              break;
            case 0x321u:
              v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA282);
              break;
            case 0x322u:
              v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA284);
              break;
            case 0x323u:
              v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA165);
              break;
            case 0x324u:
              v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA287);
              break;
            default:
              goto LABEL_26;
          }

          break;
      }

      break;
  }

  return v6;
}

  -[CBDevice setNearbyActionV2Flags:](self, "setNearbyActionV2Flags:", 0LL);
  -[CBDevice setNearbyActionV2Type:](self, "setNearbyActionV2Type:", 0LL);
  BOOL v4 = self->_nearbyActionAuthTag;
  if (v4)
  {
LABEL_11:
    objc_storeStrong((id *)&self->_nearbyAuthTag, v4);
    if ((discoveryFlags & 0x60000000000LL) != 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }

  if ((v9 & 0x40) == 0) {
    goto LABEL_39;
  }
LABEL_32:
  nearbyInfoAuthTag = self->_nearbyInfoAuthTag;
  v25 = (NSData *)obj;
  uint64_t v26 = nearbyInfoAuthTag;
  if (v25 == v26)
  {
  }

  else
  {
    uint64_t v27 = v26;
    if ((v25 == 0LL) != (v26 != 0LL))
    {
      v28 = -[NSData isEqual:](v25, "isEqual:", v26);

      if ((v28 & 1) != 0) {
        goto LABEL_39;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_nearbyInfoAuthTag, obj);
    v22 |= 0x40uLL;
  }

  if (v8 == self->_proximityServiceCategory)
  {
    if (v9 == self->_proximityServicePSM) {
      goto LABEL_28;
    }
  }

  else
  {
    self->_proximityServiceCategory = v8;
    v15 = 0x100000000LL;
    if (v9 == self->_proximityServicePSM)
    {
LABEL_28:
      goto LABEL_38;
    }
  }

  self->_proximityServicePSM = v9;
  v15 = 0x100000000LL;
  if (v10 == self->_proximityServiceMeasuredPower)
  {
LABEL_29:
    if (v11 == self->_proximityServiceVersion) {
      goto LABEL_30;
    }
    goto LABEL_39;
  }

    v18 = 0LL;
    goto LABEL_19;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (a4)
    {
      v20 = "XPC non-dict";
      goto LABEL_25;
    }

    goto LABEL_26;
  }

  v14 = CUXPCDecodeNSError();
  v15 = 0LL;
  if (!v14) {
    goto LABEL_20;
  }
  objc_storeStrong((id *)&v13->_error, 0LL);
  v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v13->_flags = 0;
  }

  else if (v16 == 5)
  {
    goto LABEL_20;
  }

  if (!CUXPCDecodeDouble()
    || !CUXPCDecodeDouble()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeDouble()
    || !CUXPCDecodeDouble())
  {
    goto LABEL_20;
  }

  uint64_t v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 != 6)
  {
    if (v17 != 5) {
      goto LABEL_17;
    }
LABEL_20:
    v18 = 0LL;
    goto LABEL_18;
  }

  v13->_timestampTicks = 0LL;
LABEL_17:
  v18 = v13;
LABEL_18:

LABEL_19:
  return v18;
}

const char *CBDeviceTypeToString(unsigned int a1)
{
  if (a1 > 0x33) {
    return "?";
  }
  else {
    return off_189FB3E78[(char)a1];
  }
}

id CBDeviceTypeToNSLocalizedString(int a1)
{
  switch(a1)
  {
    case 1:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_generic_computer";
      break;
    case 2:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_generic_phone";
      break;
    case 3:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_generic_audio_video";
      break;
    case 4:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_generic_peripheral";
      break;
    case 5:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_generic_imaging";
      break;
    case 6:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_generic_toy";
      break;
    case 7:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_desktop_computer";
      break;
    case 8:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_laptop_computer";
      break;
    case 9:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_wearable_computer";
      break;
    case 10:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_server";
      break;
    case 11:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_pda";
      break;
    case 12:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_mobile_phone";
      break;
    case 13:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_cordless_phone";
      break;
    case 14:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_modem";
      break;
    case 15:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_access_point";
      break;
    case 16:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_headset";
      break;
    case 17:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_handsfree";
      break;
    case 18:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_microphone";
      break;
    case 19:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_speaker";
      break;
    case 20:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_headphones";
      break;
    case 21:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_portable_audio";
      break;
    case 22:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_car_stereo";
      break;
    case 23:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_hifi_stereo";
      break;
    case 24:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_keyboard";
      break;
    case 25:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_mouse";
      break;
    case 26:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_gamepad";
      break;
    case 27:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_remote_control";
      break;
    case 28:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_sensor";
      break;
    case 29:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_tablet";
      break;
    case 30:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_card_reader";
      break;
    case 31:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_printer";
      break;
    case 32:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_scanner";
      break;
    case 33:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_camera";
      break;
    case 34:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_video_camera";
      break;
    case 35:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_display";
      break;
    case 36:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_video_display";
      break;
    case 37:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_video_conferencing";
      break;
    case 38:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_set_top_box";
      break;
    case 39:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_vcr";
      break;
    case 40:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_gaming_console";
      break;
    case 41:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_toy_controller";
      break;
    case 42:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_watch";
      break;
    case 43:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_pager";
      break;
    case 44:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_jacket";
      break;
    case 45:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_helmet";
      break;
    case 46:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_glasses";
      break;
    case 47:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_a2dp";
      break;
    case 48:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_le_peripheral";
      break;
    case 49:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_apple_trackpad";
      break;
    case 50:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_joystick";
      break;
    case 51:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_hearing_aid";
      break;
    default:
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      uint64_t v3 = @"bt_type_generic";
      break;
  }

  [v1 localizedStringForKey:v3 value:&stru_189FB61A8 table:@"CBLocalizable"];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t CBDeviceFlagsToString()
{
  return CUPrintFlags64();
}

uint64_t CBDiscoveryFlagsToString()
{
  return CUPrintFlags64();
}

uint64_t CBServiceFlagsToString()
{
  return CUPrintFlags64();
}

uint64_t CBDiscoveryTypeFromCString(const char *a1)
{
  if (!strcmp(a1, "AirDrop")) {
    return 1LL;
  }
  if (!strcmp(a1, "FieldDiagnostics")) {
    return 2LL;
  }
  if (!strcmp(a1, "iBeacon")) {
    return 3LL;
  }
  if (!strcmp(a1, "NearbyInfoV2")) {
    return 4LL;
  }
  if (!strcmp(a1, "AUAction")) {
    return 6LL;
  }
  if (!strcmp(a1, "MacSetup")) {
    return 8LL;
  }
  if (!strcmp(a1, "MacMigrate")) {
    return 9LL;
  }
  if (!strcmp(a1, "SIMTransfer2")) {
    return 5LL;
  }
  if (!strcmp(a1, "AcceptedInvitation")) {
    return 10LL;
  }
  if (!strcmp(a1, "ADPDBuffer")) {
    return 11LL;
  }
  if (!strcmp(a1, "DockKitAccessory")) {
    return 12LL;
  }
  if (!strcmp(a1, "AppleIDSignIn")) {
    return 13LL;
  }
  if (!strcmp(a1, "FindMyAccessory")) {
    return 14LL;
  }
  if (!strcmp(a1, "NearbyActionNoWake")) {
    return 15LL;
  }
  if (!strcmp(a1, "PrecisionFinding")) {
    return 16LL;
  }
  if (!strcmp(a1, "ADPD")) {
    return 18LL;
  }
  if (!strcmp(a1, "MiLo")) {
    return 19LL;
  }
  if (!strcmp(a1, "NearbyInfoV2Invitation")) {
    return 21LL;
  }
  if (!strcmp(a1, "OSUpdate")) {
    return 22LL;
  }
  if (!strcmp(a1, "WatchSetup")) {
    return 23LL;
  }
  if (!strcmp(a1, "OSRecoveryExtended")) {
    return 24LL;
  }
  if (!strcmp(a1, "AllBuffer")) {
    return 25LL;
  }
  if (!strcmp(a1, "SafetyAlerts")) {
    return 26LL;
  }
  if (!strcmp(a1, "GenericServiceUUIDs")) {
    return 27LL;
  }
  if (!strcmp(a1, "ProximityPairingBuffer")) {
    return 29LL;
  }
  if (!strcmp(a1, "AddUser")) {
    return 31LL;
  }
  if (!strcmp(a1, "PhotoSetup")) {
    return 32LL;
  }
  if (!strcmp(a1, "NoConsolidateScan")) {
    return 33LL;
  }
  return 0LL;
}

_BYTE *CBDiscoveryTypesAddChangedTypes(_BYTE *result, _BYTE *a2, _BYTE *a3)
{
  *result |= *a3 ^ *a2;
  result[1] |= a3[1] ^ a2[1];
  result[2] |= a3[2] ^ a2[2];
  result[3] |= a3[3] ^ a2[3];
  result[4] |= a3[4] ^ a2[4];
  return result;
}

_BYTE *CBDiscoveryTypesAddTypes(_BYTE *result, _BYTE *a2)
{
  *result |= *a2;
  result[1] |= a2[1];
  result[2] |= a2[2];
  result[3] |= a2[3];
  result[4] |= a2[4];
  return result;
}

uint64_t CBDiscoveryTypesAppendString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = 1;
  unsigned int v5 = &off_189FB3A20;
  do
  {
    int v8 = *((_DWORD *)v5 - 4);
    if ((v8 - 34) >= 0xFFFFFFDF
      && ((*(unsigned __int8 *)(a3 + ((unint64_t)(v8 - 1) >> 3)) >> (-(char)v8 & 7)) & 1) != 0)
    {
      uint64_t result = NSAppendPrintF_safe();
      char v4 = 0;
    }

    v7 = *v5;
    v5 += 3;
  }

  while (v7);
  if ((v4 & 1) == 0) {
    return NSAppendPrintF_safe();
  }
  return result;
}

void *CBDiscoveryTypesBLEScan()
{
  if (qword_18C4B7D20 != -1) {
    dispatch_once(&qword_18C4B7D20, &__block_literal_global_1);
  }
  return &unk_18C4B7CE8;
}

void __CBDiscoveryTypesBLEScan_block_invoke()
{
  os_log_t v0 = &byte_189FB3A14;
  v1 = &byte_189FB3A14;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 1) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
    }

    uint64_t v2 = *(void *)(v0 + 12);
    os_log_t v0 = v1;
  }

  while (v2);
}

void *CBDiscoveryTypesBuffer()
{
  if (qword_18C4B7D28 != -1) {
    dispatch_once(&qword_18C4B7D28, &__block_literal_global_198);
  }
  return &unk_18C4B7CED;
}

void __CBDiscoveryTypesBuffer_block_invoke()
{
  os_log_t v0 = &byte_189FB3A14;
  v1 = &byte_189FB3A14;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 0x40) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
    }

    uint64_t v2 = *(void *)(v0 + 12);
    os_log_t v0 = v1;
  }

  while (v2);
}

BOOL CBDiscoveryTypesContainTypes(_BYTE *a1, _BYTE *a2)
{
  if ((*a2 & *a1) != 0) {
    return 1LL;
  }
  if ((a2[1] & a1[1]) != 0) {
    return 1LL;
  }
  if ((a2[2] & a1[2]) != 0) {
    return 1LL;
  }
  if ((a2[3] & a1[3]) != 0) {
    return 1LL;
  }
  return (a2[4] & a1[4]) != 0;
}

void *CBDiscoveryTypesNearbyActionV1()
{
  if (qword_18C4B7D30 != -1) {
    dispatch_once(&qword_18C4B7D30, &__block_literal_global_199);
  }
  return &unk_18C4B7CF2;
}

void __CBDiscoveryTypesNearbyActionV1_block_invoke()
{
  os_log_t v0 = &byte_189FB3A14;
  v1 = &byte_189FB3A14;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 2) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
    }

    uint64_t v2 = *(void *)(v0 + 12);
    os_log_t v0 = v1;
  }

  while (v2);
}

void *CBDiscoveryTypesNearbyActionV2()
{
  if (qword_18C4B7D38 != -1) {
    dispatch_once(&qword_18C4B7D38, &__block_literal_global_200);
  }
  return &unk_18C4B7CF7;
}

void __CBDiscoveryTypesNearbyActionV2_block_invoke()
{
  os_log_t v0 = &byte_189FB3A14;
  v1 = &byte_189FB3A14;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 4) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
    }

    uint64_t v2 = *(void *)(v0 + 12);
    os_log_t v0 = v1;
  }

  while (v2);
}

void *CBDiscoveryTypesNearbyActionNoWake()
{
  if (qword_18C4B7D40 != -1) {
    dispatch_once(&qword_18C4B7D40, &__block_literal_global_201);
  }
  return &unk_18C4B7CFC;
}

void __CBDiscoveryTypesNearbyActionNoWake_block_invoke()
{
  os_log_t v0 = &byte_189FB3A14;
  v1 = &byte_189FB3A14;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if (v3 < 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
    }

    uint64_t v2 = *(void *)(v0 + 12);
    os_log_t v0 = v1;
  }

  while (v2);
}

void *CBDiscoveryTypesNeedsAdvertisingAddress()
{
  if (qword_18C4B7D48 != -1) {
    dispatch_once(&qword_18C4B7D48, &__block_literal_global_202);
  }
  return &unk_18C4B7D01;
}

void __CBDiscoveryTypesNeedsAdvertisingAddress_block_invoke()
{
  os_log_t v0 = &byte_189FB3A14;
  v1 = &byte_189FB3A14;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 8) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
    }

    uint64_t v2 = *(void *)(v0 + 12);
    os_log_t v0 = v1;
  }

  while (v2);
}

void *CBDiscoveryTypesNeedsIdentify()
{
  if (qword_18C4B7D50 != -1) {
    dispatch_once(&qword_18C4B7D50, &__block_literal_global_203);
  }
  return &unk_18C4B7D06;
}

void __CBDiscoveryTypesNeedsIdentify_block_invoke()
{
  os_log_t v0 = &byte_189FB3A14;
  v1 = &byte_189FB3A14;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 0x10) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
    }

    uint64_t v2 = *(void *)(v0 + 12);
    os_log_t v0 = v1;
  }

  while (v2);
}

void *CBDiscoveryTypesNearbyInfoV2()
{
  if (qword_18C4B7D58 != -1) {
    dispatch_once(&qword_18C4B7D58, &__block_literal_global_204);
  }
  return &unk_18C4B7D0B;
}

void __CBDiscoveryTypesNearbyInfoV2_block_invoke()
{
  os_log_t v0 = &byte_189FB3A14;
  v1 = &byte_189FB3A14;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 0x20) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
    }

    uint64_t v2 = *(void *)(v0 + 12);
    os_log_t v0 = v1;
  }

  while (v2);
}

void *CBDiscoveryTypesNeedsObjectLocator()
{
  if (qword_18C4B7D60 != -1) {
    dispatch_once(&qword_18C4B7D60, &__block_literal_global_205);
  }
  return &unk_18C4B7D10;
}

void __CBDiscoveryTypesNeedsObjectLocator_block_invoke()
{
  os_log_t v0 = &byte_189FB3A14;
  do
  {
    if ((v0[1] & 1) != 0)
    {
      int v2 = *((_DWORD *)v0 - 1);
    }

    uint64_t v1 = *(void *)(v0 + 12);
    v0 += 24;
  }

  while (v1);
}

void *CBDiscoveryTypesProximityService()
{
  if (qword_18C4B7D68 != -1) {
    dispatch_once(&qword_18C4B7D68, &__block_literal_global_206);
  }
  return &unk_18C4B7D15;
}

void __CBDiscoveryTypesProximityService_block_invoke()
{
  os_log_t v0 = &byte_189FB3A14;
  do
  {
    if ((v0[1] & 2) != 0)
    {
      int v2 = *((_DWORD *)v0 - 1);
    }

    uint64_t v1 = *(void *)(v0 + 12);
    v0 += 24;
  }

  while (v1);
}

_BYTE *CBDiscoveryTypesRemoveTypes(_BYTE *result, _BYTE *a2)
{
  *result &= ~*a2;
  result[1] &= ~a2[1];
  result[2] &= ~a2[2];
  result[3] &= ~a2[3];
  result[4] &= ~a2[4];
  return result;
}

char *CBDiscoveryTypesRemoveTypesAndReportChanges(char *result, char *a2, _BYTE *a3)
{
  char v3 = *a2;
  char v4 = *result;
  *result &= ~*a2;
  *a3 |= v4 & v3;
  char v5 = a2[1];
  char v6 = result[1];
  result[1] = v6 & ~v5;
  a3[1] |= v6 & v5;
  char v7 = a2[2];
  char v8 = result[2];
  result[2] = v8 & ~v7;
  a3[2] |= v8 & v7;
  char v9 = a2[3];
  char v10 = result[3];
  result[3] = v10 & ~v9;
  a3[3] |= v10 & v9;
  char v11 = a2[4];
  char v12 = result[4];
  result[4] = v12 & ~v11;
  a3[4] |= v12 & v11;
  return result;
}

__CFString *CBDiscoveryTypesToString(uint64_t a1)
{
  id v2 = 0LL;
  char v3 = &off_189FB3A20;
  do
  {
    int v5 = *((_DWORD *)v3 - 4);
    if ((v5 - 34) >= 0xFFFFFFDF
      && ((*(unsigned __int8 *)(a1 + ((unint64_t)(v5 - 1) >> 3)) >> (-(char)v5 & 7)) & 1) != 0)
    {
      CUAppendF();
      id v6 = v2;

      id v2 = v6;
    }

    char v4 = *v3;
    v3 += 3;
  }

  while (v4);
  CUAppendF();
  char v7 = (__CFString *)v2;

  char v8 = &stru_189FB61A8;
  if (v7) {
    char v8 = v7;
  }
  char v9 = v8;

  return v9;
}

__CFString *CBDiscoveryTypesEnumToString(uint64_t a1)
{
  id v2 = 0LL;
  char v3 = &off_189FB3A20;
  do
  {
    int v5 = *((_DWORD *)v3 - 4);
    if ((v5 - 34) >= 0xFFFFFFDF
      && ((*(unsigned __int8 *)(a1 + ((unint64_t)(v5 - 1) >> 3)) >> (-(char)v5 & 7)) & 1) != 0)
    {
      CUAppendF();
      id v6 = v2;

      id v2 = v6;
    }

    char v4 = *v3;
    v3 += 3;
  }

  while (v4);
  CUAppendF();
  char v7 = (__CFString *)v2;

  char v8 = &stru_189FB61A8;
  if (v7) {
    char v8 = v7;
  }
  char v9 = v8;

  return v9;
}

id CBErrorF( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v17[1] = *MEMORY[0x1895F89C0];
  [NSString stringWithUTF8String:a2];
  char v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = (void *)[objc_alloc(NSString) initWithFormat:v10 arguments:&a9];
  id v12 = objc_alloc(MEMORY[0x189607870]);
  v16 = @"cuErrorMsg";
  v17[0] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)[v12 initWithDomain:@"CBErrorDomain" code:a1 userInfo:v13];

  return v14;
}

uint64_t CBUseCaseFromString(const char *a1)
{
  if (!strcasecmp(a1, "HealthKit")) {
    return 1LL;
  }
  if (!strcasecmp(a1, "HomeKit")) {
    return 2LL;
  }
  if (!strcasecmp(a1, "FindMyObjectConnection")) {
    return 3LL;
  }
  if (!strcasecmp(a1, "FindMyObjectConnectionTransient")) {
    return 4LL;
  }
  if (!strcasecmp(a1, "MIDI")) {
    return 5LL;
  }
  if (!strcasecmp(a1, "Continuity")) {
    return 6LL;
  }
  if (!strcasecmp(a1, "InstantHotSpot")) {
    return 7LL;
  }
  if (!strcasecmp(a1, "NearBy")) {
    return 8LL;
  }
  if (!strcasecmp(a1, "Sharing")) {
    return 9LL;
  }
  if (!strcasecmp(a1, "HearingSupport")) {
    return 10LL;
  }
  if (!strcasecmp(a1, "Magnet")) {
    return 11LL;
  }
  if (!strcasecmp(a1, "HID")) {
    return 12LL;
  }
  if (!strcasecmp(a1, "LEA")) {
    return 13LL;
  }
  if (!strcasecmp(a1, "External")) {
    return 14LL;
  }
  if (!strcasecmp(a1, "ExternalMedical")) {
    return 15LL;
  }
  if (!strcasecmp(a1, "ExternalLock")) {
    return 16LL;
  }
  if (!strcasecmp(a1, "ExternalWatch")) {
    return 17LL;
  }
  if (!strcasecmp(a1, "SmartRouting")) {
    return 18LL;
  }
  if (!strcasecmp(a1, "DigitalID")) {
    return 19LL;
  }
  if (!strcasecmp(a1, "DigitalKey")) {
    return 20LL;
  }
  if (!strcasecmp(a1, "DigitalCarKey")) {
    return 21LL;
  }
  if (!strcasecmp(a1, "DigitalCarKeyThirdParty")) {
    return 0x40000LL;
  }
  if (!strcasecmp(a1, "HeySiri")) {
    return 22LL;
  }
  if (!strcasecmp(a1, "ThirdPartyApp")) {
    return 23LL;
  }
  if (!strcasecmp(a1, "CNJ")) {
    return 24LL;
  }
  if (!strcasecmp(a1, "DevicePresenceDetection")) {
    return 256LL;
  }
  if (!strcasecmp(a1, "AudioBox")) {
    return 257LL;
  }
  if (!strcasecmp(a1, "SIMTransfer") || !strcasecmp(a1, "SIMTransfer2")) {
    return 258LL;
  }
  if (!strcasecmp(a1, "ProximityScreenOnLeechScan")) {
    return 259LL;
  }
  if (!strcasecmp(a1, "MacMigrate")) {
    return 260LL;
  }
  if (!strcasecmp(a1, "HIDUARTService")) {
    return 263LL;
  }
  if (!strcasecmp(a1, "AccessibilitySwitchControlPairing")) {
    return 264LL;
  }
  if (!strcasecmp(a1, "BaseBandFastConnect")) {
    return 265LL;
  }
  if (!strcasecmp(a1, "SafetyAlerts")) {
    return 266LL;
  }
  if (!strcasecmp(a1, "LECarPlay")) {
    return 267LL;
  }
  if (!strcasecmp(a1, "TCCBluetooth")) {
    return 268LL;
  }
  if (!strcasecmp(a1, "AOPBufferLeech")) {
    return 269LL;
  }
  if (!strcasecmp(a1, "FindMyAction")) {
    return 0x10000LL;
  }
  if (!strcasecmp(a1, "FindMyBackground")) {
    return 65537LL;
  }
  if (!strcasecmp(a1, "FindMyActionHELE")) {
    return 65538LL;
  }
  if (!strcasecmp(a1, "FindMyBackgroundHELE")) {
    return 65539LL;
  }
  if (!strcasecmp(a1, "FindMyActionTransient")) {
    return 65540LL;
  }
  if (!strcasecmp(a1, "FindMyBackgroundTransient")) {
    return 65541LL;
  }
  if (!strcasecmp(a1, "FindMyActionHELETransient")) {
    return 65542LL;
  }
  if (!strcasecmp(a1, "FindMyBackgroundHELETransient")) {
    return 65543LL;
  }
  if (!strcasecmp(a1, "FindMyNotOptedIn")) {
    return 65544LL;
  }
  if (!strcasecmp(a1, "FindMyOptedIn")) {
    return 65545LL;
  }
  if (!strcasecmp(a1, "FindMySepAlertsEnabled")) {
    return 65546LL;
  }
  if (!strcasecmp(a1, "FindMyTemporaryAggressiveLegacy")) {
    return 65547LL;
  }
  if (!strcasecmp(a1, "FindMyTemporaryLongAggressive")) {
    return 65548LL;
  }
  if (!strcasecmp(a1, "FindMyBTFindingUserInitiated")) {
    return 65549LL;
  }
  if (!strcasecmp(a1, "FindMyHELE")) {
    return 65550LL;
  }
  if (!strcasecmp(a1, "FindMyBeaconOnDemand")) {
    return 65551LL;
  }
  if (!strcasecmp(a1, "FindMyWildTimedScan")) {
    return 65552LL;
  }
  if (!strcasecmp(a1, "FindMyBackgroundLeechScan")) {
    return 65553LL;
  }
  if (!strcasecmp(a1, "FindMySnifferMode")) {
    return 65554LL;
  }
  if (!strcasecmp(a1, "FindMyUnpair")) {
    return 65555LL;
  }
  if (!strcasecmp(a1, "FindMyUnpairHELE")) {
    return 65556LL;
  }
  if (!strcasecmp(a1, "FindMyPlaySound")) {
    return 65557LL;
  }
  if (!strcasecmp(a1, "FindMyPlaySoundHELE")) {
    return 65558LL;
  }
  if (!strcasecmp(a1, "FindMyNotOptedInBeepOnMoveWaking")) {
    return 65559LL;
  }
  if (!strcasecmp(a1, "FindMyUTTransient")) {
    return 65560LL;
  }
  if (!strcasecmp(a1, "FindMyUTHELETransient")) {
    return 65561LL;
  }
  if (!strcasecmp(a1, "SharingDefault")) {
    return 0x20000LL;
  }
  if (!strcasecmp(a1, "SharingPhoneAutoUnlock")) {
    return 131073LL;
  }
  if (!strcasecmp(a1, "SharingSiriWatchAuth")) {
    return 131074LL;
  }
  if (!strcasecmp(a1, "SharingMacAutoUnlock")) {
    return 131075LL;
  }
  if (!strcasecmp(a1, "SharingEDTScreenOn")) {
    return 131076LL;
  }
  if (!strcasecmp(a1, "SharingEDTWiFiDisabled")) {
    return 131077LL;
  }
  if (!strcasecmp(a1, "SharingEDTWombatEligibleAsDefaultCamera")) {
    return 131078LL;
  }
  if (!strcasecmp(a1, "SharingEDTWombatCameraPicker")) {
    return 131079LL;
  }
  if (!strcasecmp(a1, "SharingWombatBackground")) {
    return 131080LL;
  }
  if (!strcasecmp(a1, "SharingUniversalControl")) {
    return 131081LL;
  }
  if (!strcasecmp(a1, "SharingPeopleProximity")) {
    return 131082LL;
  }
  if (!strcasecmp(a1, "SharingEDTEnsembleOpenDisplayPrefs")) {
    return 131083LL;
  }
  if (!strcasecmp(a1, "SharingEDTNearbydMotionStopped")) {
    return 131084LL;
  }
  if (!strcasecmp(a1, "SharingDoubleBoostGenericScan")) {
    return 131085LL;
  }
  if (!strcasecmp(a1, "SharingEDTIncomingAdvertisement")) {
    return 131086LL;
  }
  if (!strcasecmp(a1, "SharingEDTWombatStreamStart")) {
    return 131087LL;
  }
  if (!strcasecmp(a1, "SharingOYAutoUnlock")) {
    return 131088LL;
  }
  if (!strcasecmp(a1, "SharingAirDrop")) {
    return 131090LL;
  }
  if (!strcasecmp(a1, "SharingNearbyInvitationHost")) {
    return 131091LL;
  }
  if (!strcasecmp(a1, "SharingNearbyInvitationParticipant")) {
    return 131092LL;
  }
  if (!strcasecmp(a1, "SharingAirDropAskToAirDrop")) {
    return 131093LL;
  }
  if (!strcasecmp(a1, "SharingAirDropTempIdentity")) {
    return 131094LL;
  }
  if (!strcasecmp(a1, "SharingAirDropNeedsCLink")) {
    return 131095LL;
  }
  if (!strcasecmp(a1, "SharingRemoteWidgetUpdate")) {
    return 131096LL;
  }
  if (!strcasecmp(a1, "SharingCountryCodeUpdate")) {
    return 131097LL;
  }
  if (!strcasecmp(a1, "SharingMacPhoneAutoUnlock")) {
    return 131098LL;
  }
  if (!strcasecmp(a1, "SharingVisionProDiscovery")) {
    return 131099LL;
  }
  if (!strcasecmp(a1, "SharingVisionProStateChange")) {
    return 131100LL;
  }
  if (!strcasecmp(a1, "SharingContinuityScreen")) {
    return 131101LL;
  }
  if (!strcasecmp(a1, "SharingEDTRemoteDisplay")) {
    return 131102LL;
  }
  if (!strcasecmp(a1, "DigitalIDTSA")) {
    return 196608LL;
  }
  if (!strcasecmp(a1, "RapportThirdParty")) {
    return 327680LL;
  }
  if (!strcasecmp(a1, "CaptiveNetworkJoin")) {
    return 393216LL;
  }
  if (!strcasecmp(a1, "UseCaseSIMTransfer")) {
    return 393217LL;
  }
  if (!strcasecmp(a1, "MacSetup")) {
    return 393218LL;
  }
  if (!strcasecmp(a1, "AppleIDSignIn")) {
    return 393219LL;
  }
  if (!strcasecmp(a1, "AppleIDSignInSettings")) {
    return 393220LL;
  }
  if (!strcasecmp(a1, "PrecisionFindingFinder")) {
    return 458752LL;
  }
  if (!strcasecmp(a1, "PrecisionFindingFindee")) {
    return 458753LL;
  }
  if (!strcasecmp(a1, "ADPD")) {
    return 0x80000LL;
  }
  if (!strcasecmp(a1, "ADPDBuffer")) {
    return 524289LL;
  }
  if (!strcasecmp(a1, "MicroLocation")) {
    return 524290LL;
  }
  if (!strcasecmp(a1, "MicroLocationLeech")) {
    return 524291LL;
  }
  if (!strcasecmp(a1, "FindNearbyRemote")) {
    return 589824LL;
  }
  if (!strcasecmp(a1, "FindNearbyPencil")) {
    return 589825LL;
  }
  if (!strcasecmp(a1, "AccessDigitalHomeKey")) {
    return 655360LL;
  }
  if (!strcasecmp(a1, "ProxControlDeviceClose")) {
    return 786432LL;
  }
  if (!strcasecmp(a1, "InternalTestNoLockScan")) {
    return 2147418112LL;
  }
  if (!strcasecmp(a1, "InternalTestNoScreenOffScan")) {
    return 2147418113LL;
  }
  if (!strcasecmp(a1, "InternalTestScanWithNoDups")) {
    return 2147418114LL;
  }
  if (!strcasecmp(a1, "InternalTestScanWithDups")) {
    return 2147418115LL;
  }
  if (!strcasecmp(a1, "InternalTestScanFor20Seconds")) {
    return 2147418116LL;
  }
  if (!strcasecmp(a1, "InternalTestActiveScan")) {
    return 2147418117LL;
  }
  if (!strcasecmp(a1, "InternalTestUUIDScan")) {
    return 2147418118LL;
  }
  if (!strcasecmp(a1, "InternalTestScanFor10ClockSeconds")) {
    return 2147418119LL;
  }
  if (!strcasecmp(a1, "InternalTestScanBoost")) {
    return 2147418120LL;
  }
  return 0LL;
}

unint64_t CBUTF8Truncate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 <= a3) {
    return a2;
  }
  if (a2 - a3 < 2)
  {
    char v3 = -80;
    if (!a3) {
      goto LABEL_11;
    }
  }

  else
  {
    char v3 = *(_BYTE *)(a3 + a1 + 1);
    if (!a3) {
      goto LABEL_11;
    }
  }

  int v4 = *(unsigned __int8 *)(a1 + a3);
  do
  {
    if ((v4 & 0xC0) != 0x80 && (v4 != 237 || (v3 & 0xF0) != 0xB0)) {
      break;
    }
    char v3 = v4;
    int v4 = *(unsigned __int8 *)(a1 - 1 + a3--);
  }

  while (a3);
LABEL_11:
  while (a3)
  {
    unint64_t v5 = a3 - 1;
    unsigned int v6 = *(unsigned __int8 *)(a1 - 1 + a3--);
    if (v6 >= 0x21) {
      return v5 + 1;
    }
  }

  return 0LL;
}

uint64_t CBXPCGetNextClientID()
{
  if (qword_18C4B7D70 != -1) {
    dispatch_once(&qword_18C4B7D70, &__block_literal_global_328);
  }
  do
  {
    unsigned int v0 = __ldaxr((unsigned int *)&_MergedGlobals_0);
    uint64_t result = v0 + 1;
  }

  while (__stlxr(result, (unsigned int *)&_MergedGlobals_0));
  return result;
}

uint64_t __CBXPCGetNextClientID_block_invoke()
{
  uint64_t result = RandomBytes();
  _MergedGlobals_0 = (unsigned __int16)word_18C4B7CE2 << 16;
  return result;
}

uint64_t CBXPCDecodeDiscoveryTypes(void *a1, const char *a2, void *a3)
{
  size_t length = 0LL;
  data = xpc_dictionary_get_data(a1, a2, &length);
  if (data)
  {
    if (length == 5)
    {
      size_t v5 = 5LL;
    }

    else
    {
      if (length >= 5) {
        size_t v5 = 5LL;
      }
      else {
        size_t v5 = length;
      }
      size_t length = v5;
    }

    memcpy(a3, data, v5);
  }

  return 1LL;
}

LABEL_19:
      uint64_t v13 = 0;
      goto LABEL_20;
    }
  }

  uint64_t v13 = 0;
LABEL_22:

  return v13;
}

  if (a4) {
    *a4 = v8;
  }
  return result;
}

            goto LABEL_20;
          }

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v5 length:6];
  v5 += 6;
LABEL_20:
  homeKitV1DeviceIDData = self->_homeKitV1DeviceIDData;
  v32 = v13;
  uint64_t v17 = homeKitV1DeviceIDData;
  if (v32 == v17)
  {

    v23 = v32;
  }

  else
  {
    if ((v32 == 0LL) != (v17 != 0LL))
    {
      v18 = -[NSData isEqual:](v32, "isEqual:", v17);

      if ((v18 & 1) != 0)
      {
        v19 = a4 - v5 > 1 && v12;
        if (v19) {
          goto LABEL_27;
        }
LABEL_36:
        v20 = 0;
        v22 = v32;
        if (!self->_homeKitV1Category) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }

    else
    {
    }

    v24 = v32;
    v23 = self->_homeKitV1DeviceIDData;
    self->_homeKitV1DeviceIDData = v24;
    char v10 = 0x400000LL;
  }

  v19 = a4 - v5 > 1 && v12;
  if (!v19) {
    goto LABEL_36;
  }
LABEL_27:
  v21 = *(unsigned __int16 *)v5;
  v5 += 2;
  v20 = v21;
  v22 = v32;
  if (v21 != self->_homeKitV1Category)
  {
LABEL_37:
    self->_homeKitV1Category = v20;
    char v10 = 0x400000LL;
  }

LABEL_20:
    v18 = 0LL;
    goto LABEL_14;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v27);
      v18 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }

    goto LABEL_20;
  }

  objc_opt_class();
  v14 = CUXPCDecodeNSError();
  v15 = 0LL;
  if (!v14) {
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v7->_error, 0LL);
  v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_flags = 0;
  }

  else if (v16 == 5)
  {
    goto LABEL_15;
  }

  uint64_t v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 != 6)
  {
    if (v17 != 5) {
      goto LABEL_12;
    }
LABEL_15:
    v18 = 0LL;
    goto LABEL_13;
  }

  v7->_pairingType = 0LL;
LABEL_12:
  v18 = v7;
LABEL_13:

LABEL_14:
  return v18;
}
}

  string = xpc_dictionary_get_string(v5, "bleScanRate");
  uint64_t v17 = xpc_dictionary_get_string(v5, "bleScanRateScreenOff");
  v18 = v17;
  p_bleScanRateScreenOff = &self->_bleScanRateScreenOff;
  if (!string)
  {
    if (!v17) {
      goto LABEL_81;
    }
    if (!strcmp(v17, "Default"))
    {
      *p_bleScanRateScreenOff = 0;
      char v7 = 0x80000000000LL;
      if (strcmp(v18, "Periodic"))
      {
LABEL_41:
        if (strcmp(v18, "Background")) {
          goto LABEL_42;
        }
        goto LABEL_73;
      }
    }

    else if (strcmp(v18, "Periodic"))
    {
      goto LABEL_41;
    }

    *p_bleScanRateScreenOff = 10;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Background"))
    {
LABEL_42:
      if (strcmp(v18, "Low")) {
        goto LABEL_43;
      }
      goto LABEL_74;
    }

  -[CBManager checkForTCCWithDeviceCount](self, "checkForTCCWithDeviceCount");
LABEL_27:
}

  -[CBDevice setFidoPayloadData:](self, "setFidoPayloadData:", 0LL);
  if ((discoveryFlags & 0x40000000000000LL) != 0)
  {
LABEL_5:
    if ((discoveryFlags & 0x400000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }

    v15 = 512;
LABEL_21:
    v16 = v13 & 0x7F;
    if (v16 >= 100) {
      v16 = 100;
    }
    uint64_t v17 = v16 | v15;
    if (v17 != self->_batteryInfoCase) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }

  LOWORD(v17) = 0;
  if (self->_batteryInfoCase)
  {
LABEL_24:
    self->_batteryInfoCase = v17;
    char v9 = 0x80000000080LL;
  }

uint64_t CBLTV8GetNext( unint64_t a1, unsigned __int8 *a2, _BYTE *a3, void *a4, void *a5, void *a6)
{
  unint64_t v6 = *(unsigned __int8 *)a1;
  if (!*(_BYTE *)a1) {
    return 4294960554LL;
  }
  char v7 = (unsigned __int8 *)(a1 + 2);
  *a3 = *(_BYTE *)(a1 + 1);
  *a4 = a1 + 2;
  uint64_t v8 = (v6 - 1);
  *a5 = v8;
  uint64_t result = 0LL;
  if (a6) {
    *a6 = &v7[v8];
  }
  return result;
}

uint64_t CBLTV8GetWithType( unint64_t a1, unsigned __int8 *a2, int a3, unsigned __int8 **a4, void *a5)
{
  do
  {
    unint64_t v5 = *(unsigned __int8 *)a1;
    if (!*(_BYTE *)a1) {
      return 4294960554LL;
    }
    unint64_t v6 = (unsigned __int8 *)(a1 + 2);
    int v7 = *(unsigned __int8 *)(a1 + 1);
    uint64_t v8 = (v5 - 1);
    a1 += 2 + v8;
  }

  while (v7 != a3);
  if (a4) {
    *a4 = v6;
  }
  uint64_t result = 0LL;
  if (a5) {
    *a5 = v8;
  }
  return result;
}

unint64_t CBLTV8GetSInt64(unint64_t a1, unsigned __int8 *a2, int a3, int *a4)
{
  if ((unsigned __int8 *)a1 == a2)
  {
    unint64_t result = 0LL;
    int v8 = -6765;
  }

  else
  {
    do
    {
      if ((unsigned __int8 *)a1 == a2)
      {
        unint64_t result = 0LL;
        int v8 = -6727;
        goto LABEL_19;
      }

      unint64_t v4 = a1;
      if ((uint64_t)&a2[-a1] < 1)
      {
        unint64_t result = 0LL;
        int v8 = -6705;
        goto LABEL_19;
      }

      unint64_t v5 = *(unsigned __int8 *)a1;
      if ((unint64_t)&a2[~a1] < v5)
      {
        unint64_t result = 0LL;
        int v8 = -6750;
        goto LABEL_19;
      }

      if (!*(_BYTE *)a1)
      {
        unint64_t result = 0LL;
        int v8 = -6742;
        goto LABEL_19;
      }

      unint64_t v6 = (char *)(a1 + 2);
      int v7 = *(unsigned __int8 *)(a1 + 1);
      a1 += 2LL + (v5 - 1);
    }

    while (v7 != a3);
    switch((int)v5)
    {
      case 2:
        int v8 = 0;
        unint64_t result = *v6;
        break;
      case 3:
        int v8 = 0;
        unint64_t result = (__int16)(*(unsigned __int8 *)(v4 + 3) << 8) | (unint64_t)*(unsigned __int8 *)(v4 + 2);
        break;
      case 4:
        int v8 = 0;
        unint64_t v10 = (uint64_t)*(char *)(v4 + 4) << 16;
        goto LABEL_18;
      case 5:
        int v8 = 0;
        unint64_t result = *(int *)v6;
        break;
      case 6:
        int v8 = 0;
        unint64_t v11 = (uint64_t)*(char *)(v4 + 6) << 32;
        goto LABEL_17;
      case 7:
        int v8 = 0;
        unint64_t v12 = (uint64_t)*(char *)(v4 + 7) << 40;
        goto LABEL_16;
      case 8:
        int v8 = 0;
        unint64_t v12 = ((uint64_t)*(char *)(v4 + 8) << 48) | ((unint64_t)*(unsigned __int8 *)(v4 + 7) << 40);
LABEL_16:
        unint64_t v11 = v12 | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32);
LABEL_17:
        unint64_t v10 = v11 | ((unint64_t)*(unsigned __int8 *)(v4 + 5) << 24) | ((unint64_t)*(unsigned __int8 *)(v4 + 4) << 16);
LABEL_18:
        unint64_t result = v10 | ((unint64_t)*(unsigned __int8 *)(v4 + 3) << 8) | *(unsigned __int8 *)(v4 + 2);
        break;
      case 9:
        int v8 = 0;
        unint64_t result = *(void *)v6;
        break;
      default:
        unint64_t result = 0LL;
        int v8 = -6743;
        break;
    }
  }

unint64_t CBLTV8GetUInt64(unint64_t a1, unsigned __int8 *a2, int a3, int *a4)
{
  if ((unsigned __int8 *)a1 == a2)
  {
    unint64_t result = 0LL;
    int v8 = -6765;
  }

  else
  {
    do
    {
      if ((unsigned __int8 *)a1 == a2)
      {
        unint64_t result = 0LL;
        int v8 = -6727;
        goto LABEL_17;
      }

      unint64_t v4 = a1;
      if ((uint64_t)&a2[-a1] < 1)
      {
        unint64_t result = 0LL;
        int v8 = -6705;
        goto LABEL_17;
      }

      unint64_t v5 = *(unsigned __int8 *)a1;
      if ((unint64_t)&a2[~a1] < v5)
      {
        unint64_t result = 0LL;
        int v8 = -6750;
        goto LABEL_17;
      }

      if (!*(_BYTE *)a1)
      {
        unint64_t result = 0LL;
        int v8 = -6742;
        goto LABEL_17;
      }

      unint64_t v6 = (unsigned __int8 *)(a1 + 2);
      int v7 = *(unsigned __int8 *)(a1 + 1);
      a1 += 2LL + (v5 - 1);
    }

    while (v7 != a3);
    switch((int)v5)
    {
      case 2:
        int v8 = 0;
        unint64_t result = *v6;
        break;
      case 3:
        int v8 = 0;
        unint64_t result = *(unsigned __int16 *)(v4 + 2);
        break;
      case 4:
        int v8 = 0;
        unint64_t result = *(unsigned __int16 *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 4) << 16);
        break;
      case 5:
        int v8 = 0;
        unint64_t result = *(unsigned int *)v6;
        break;
      case 6:
        int v8 = 0;
        unint64_t result = *(unsigned int *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32);
        break;
      case 7:
        int v8 = 0;
        unint64_t result = *(unsigned int *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32) | ((unint64_t)*(unsigned __int8 *)(v4 + 7) << 40);
        break;
      case 8:
        int v8 = 0;
        unint64_t result = *(unsigned int *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32) | ((unint64_t)*(unsigned __int8 *)(v4 + 7) << 40) | ((unint64_t)*(unsigned __int8 *)(v4 + 8) << 48);
        break;
      case 9:
        int v8 = 0;
        unint64_t result = *(void *)v6;
        break;
      default:
        unint64_t result = 0LL;
        int v8 = -6743;
        break;
    }
  }

void CBMockAddOrUpdateAdvertiser(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  os_unfair_lock_lock(&stru_18C4B7CE4);
  [(id)qword_18C4B7D98 objectForKeyedSubscript:v3];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1896078B8]) initWithOptions:517 capacity:0];
    unint64_t v6 = (void *)qword_18C4B7D98;
    if (!qword_18C4B7D98)
    {
      id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
      int v8 = (void *)qword_18C4B7D98;
      qword_18C4B7D98 = (uint64_t)v7;

      unint64_t v6 = (void *)qword_18C4B7D98;
    }

    [v6 setObject:v5 forKeyedSubscript:v3];
  }

  [v5 addObject:v4];
  [v4 mockDevice];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    objc_msgSend((id)qword_18C4B7DA0, "objectForKeyedSubscript:", v3, 0);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v14++) reportMockDeviceFound:v9];
        }

        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v12);
    }
  }

  os_unfair_lock_unlock(&stru_18C4B7CE4);
}

void CBMockRemoveAdvertiser(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  os_unfair_lock_lock(&stru_18C4B7CE4);
  [(id)qword_18C4B7D98 objectForKeyedSubscript:v3];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 containsObject:v4])
  {
    [v5 removeObject:v4];
    if (![v5 count]) {
      [(id)qword_18C4B7D98 setObject:0 forKeyedSubscript:v3];
    }
    [v4 mockDevice];
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      objc_msgSend((id)qword_18C4B7DA0, "objectForKeyedSubscript:", v3, 0);
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0LL;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * v11++) reportMockDeviceLost:v6];
          }

          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }

        while (v9);
      }
    }

    os_unfair_lock_unlock(&stru_18C4B7CE4);
  }

  else
  {
    os_unfair_lock_unlock(&stru_18C4B7CE4);
  }
}

void CBMockAddOrUpdateDiscovery(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  os_unfair_lock_lock(&stru_18C4B7CE4);
  [(id)qword_18C4B7DA0 objectForKeyedSubscript:v3];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1896078B8]) initWithOptions:517 capacity:0];
    unint64_t v6 = (void *)qword_18C4B7DA0;
    if (!qword_18C4B7DA0)
    {
      id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v8 = (void *)qword_18C4B7DA0;
      qword_18C4B7DA0 = (uint64_t)v7;

      unint64_t v6 = (void *)qword_18C4B7DA0;
    }

    [v6 setObject:v5 forKeyedSubscript:v3];
  }

  [v5 addObject:v4];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  objc_msgSend((id)qword_18C4B7D98, "objectForKeyedSubscript:", v3, 0);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v13) mockDevice];
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14) {
          [v4 reportMockDeviceFound:v14];
        }

        ++v13;
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }

  os_unfair_lock_unlock(&stru_18C4B7CE4);
}

void CBMockRemoveDiscovery(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  os_unfair_lock_lock(&stru_18C4B7CE4);
  [(id)qword_18C4B7DA0 objectForKeyedSubscript:v5];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 removeObject:v3];

  if (![v4 count]) {
    [(id)qword_18C4B7DA0 setObject:0 forKeyedSubscript:v5];
  }
  os_unfair_lock_unlock(&stru_18C4B7CE4);
}

id CBUserControllerXPCInterface()
{
  unsigned int v0 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = (void *)objc_msgSend( v14,  "initWithObjects:",  v13,  v12,  v1,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  objc_opt_class(),  0);
  [v0 setClasses:v10 forSelector:sel_appleAudioAccessoryLimitedLoggingWithCompletion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_setAppleAudioAccessoryLimitedLogging_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_getDistributedLoggingStatusWithCompletion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_setDistributedLoggingStatus_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_getCurrentUserGivenNameWithCompletion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_getControllerInfoForDevice_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_getCloudPairedDevicesWithCompletionHandler_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_getControllerInfoForDevice_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_storeControllerInfo_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_readPrefKeys_source_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_writePrefKey_value_source_completion_ argumentIndex:0 ofReply:1];

  return v0;
}

id CBGetHexString(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    uint64_t v5 = a2;
    do
    {
      unsigned int v6 = *a1++;
      objc_msgSend(v4, "appendFormat:", @"%02x", v6);
      --v5;
    }

    while (v5);
  }

  return v4;
}

id CBGenerateSHA256HashedString(void *a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v1 = (const char *)[a1 UTF8String];
  *(_OWORD *)md = 0u;
  __int128 v6 = 0u;
  CC_LONG v2 = strlen(v1);
  if (CC_SHA256(v1, v2, md))
  {
    [MEMORY[0x189607940] stringWithCapacity:64];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", @"%02x", md[0]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[1]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[2]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[3]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[4]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[5]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[6]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[7]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[8]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[9]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[10]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[11]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[12]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[13]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[14]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[15]);
    objc_msgSend(v3, "appendFormat:", @"%02x", v6);
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE1(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE2(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE3(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE4(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE5(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE6(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE7(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE8(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE9(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE10(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE11(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE12(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE13(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE14(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", HIBYTE(v6));
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

id CBGenerateObfuscatedSHA256HashedString(void *a1)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  uint64_t v1 = (const char *)[a1 UTF8String];
  *(_OWORD *)md = 0u;
  __int128 v51 = 0u;
  *(_OWORD *)v47 = 0u;
  __int128 v48 = 0u;
  CC_LONG v2 = strlen(v1);
  if (!CC_SHA256(v1, v2, md)) {
    return 0LL;
  }
  data[0] = bijectByteToBytePreSHA256[md[0]];
  data[1] = bijectByteToBytePreSHA256[md[1]];
  char v3 = bijectByteToBytePreSHA256[md[3]];
  data[2] = bijectByteToBytePreSHA256[md[2]];
  data[3] = v3;
  data[4] = bijectByteToBytePreSHA256[md[4]];
  char v4 = bijectByteToBytePreSHA256[md[6]];
  data[5] = bijectByteToBytePreSHA256[md[5]];
  data[6] = v4;
  data[7] = bijectByteToBytePreSHA256[md[7]];
  char v5 = bijectByteToBytePreSHA256[md[9]];
  data[8] = bijectByteToBytePreSHA256[md[8]];
  data[9] = v5;
  data[10] = bijectByteToBytePreSHA256[md[10]];
  char v6 = bijectByteToBytePreSHA256[md[12]];
  data[11] = bijectByteToBytePreSHA256[md[11]];
  data[12] = v6;
  data[13] = bijectByteToBytePreSHA256[md[13]];
  char v7 = bijectByteToBytePreSHA256[md[15]];
  data[14] = bijectByteToBytePreSHA256[md[14]];
  data[15] = v7;
  data[16] = bijectByteToBytePreSHA256[v51];
  char v8 = bijectByteToBytePreSHA256[BYTE2(v51)];
  data[17] = bijectByteToBytePreSHA256[BYTE1(v51)];
  data[18] = v8;
  data[19] = bijectByteToBytePreSHA256[BYTE3(v51)];
  char v9 = bijectByteToBytePreSHA256[BYTE5(v51)];
  data[20] = bijectByteToBytePreSHA256[BYTE4(v51)];
  data[21] = v9;
  data[22] = bijectByteToBytePreSHA256[BYTE6(v51)];
  char v10 = bijectByteToBytePreSHA256[BYTE8(v51)];
  data[23] = bijectByteToBytePreSHA256[BYTE7(v51)];
  data[24] = v10;
  data[25] = bijectByteToBytePreSHA256[BYTE9(v51)];
  char v11 = bijectByteToBytePreSHA256[BYTE11(v51)];
  data[26] = bijectByteToBytePreSHA256[BYTE10(v51)];
  data[27] = v11;
  data[28] = bijectByteToBytePreSHA256[BYTE12(v51)];
  char v12 = bijectByteToBytePreSHA256[BYTE14(v51)];
  data[29] = bijectByteToBytePreSHA256[BYTE13(v51)];
  data[30] = v12;
  data[31] = bijectByteToBytePreSHA256[HIBYTE(v51)];
  if (!CC_SHA256(data, 0x20u, v47)) {
    return 0LL;
  }
  uint64_t v13 = BYTE1(v48);
  uint64_t v14 = v47[0];
  uint64_t v15 = v47[11];
  uint64_t v16 = v47[2];
  uint64_t v17 = BYTE5(v48);
  uint64_t v18 = BYTE4(v48);
  uint64_t v19 = v47[15];
  uint64_t v20 = BYTE6(v48);
  uint64_t v21 = BYTE9(v48);
  uint64_t v24 = v47[8];
  uint64_t v25 = BYTE3(v48);
  uint64_t v26 = v47[10];
  uint64_t v27 = BYTE13(v48);
  uint64_t v28 = BYTE12(v48);
  uint64_t v29 = BYTE7(v48);
  uint64_t v30 = BYTE14(v48);
  uint64_t v31 = v47[1];
  uint64_t v32 = v48;
  uint64_t v33 = BYTE11(v48);
  uint64_t v34 = BYTE2(v48);
  uint64_t v35 = v47[5];
  uint64_t v36 = v47[4];
  uint64_t v37 = HIBYTE(v48);
  uint64_t v38 = v47[6];
  uint64_t v39 = v47[9];
  uint64_t v40 = BYTE8(v48);
  uint64_t v41 = v47[3];
  uint64_t v42 = BYTE10(v48);
  uint64_t v43 = v47[13];
  uint64_t v45 = v47[12];
  uint64_t v44 = v47[7];
  uint64_t v46 = v47[14];
  [MEMORY[0x189607940] stringWithCapacity:64];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendFormat:", @"%02x", v13);
  objc_msgSend(v22, "appendFormat:", @"%02x", v14);
  objc_msgSend(v22, "appendFormat:", @"%02x", v15);
  objc_msgSend(v22, "appendFormat:", @"%02x", v16);
  objc_msgSend(v22, "appendFormat:", @"%02x", v17);
  objc_msgSend(v22, "appendFormat:", @"%02x", v18);
  objc_msgSend(v22, "appendFormat:", @"%02x", v19);
  objc_msgSend(v22, "appendFormat:", @"%02x", v20);
  objc_msgSend(v22, "appendFormat:", @"%02x", v21);
  objc_msgSend(v22, "appendFormat:", @"%02x", v24);
  objc_msgSend(v22, "appendFormat:", @"%02x", v25);
  objc_msgSend(v22, "appendFormat:", @"%02x", v26);
  objc_msgSend(v22, "appendFormat:", @"%02x", v27);
  objc_msgSend(v22, "appendFormat:", @"%02x", v28);
  objc_msgSend(v22, "appendFormat:", @"%02x", v29);
  objc_msgSend(v22, "appendFormat:", @"%02x", v30);
  objc_msgSend(v22, "appendFormat:", @"%02x", v31);
  objc_msgSend(v22, "appendFormat:", @"%02x", v32);
  objc_msgSend(v22, "appendFormat:", @"%02x", v33);
  objc_msgSend(v22, "appendFormat:", @"%02x", v34);
  objc_msgSend(v22, "appendFormat:", @"%02x", v35);
  objc_msgSend(v22, "appendFormat:", @"%02x", v36);
  objc_msgSend(v22, "appendFormat:", @"%02x", v37);
  objc_msgSend(v22, "appendFormat:", @"%02x", v38);
  objc_msgSend(v22, "appendFormat:", @"%02x", v39);
  objc_msgSend(v22, "appendFormat:", @"%02x", v40);
  objc_msgSend(v22, "appendFormat:", @"%02x", v41);
  objc_msgSend(v22, "appendFormat:", @"%02x", v42);
  objc_msgSend(v22, "appendFormat:", @"%02x", v43);
  objc_msgSend(v22, "appendFormat:", @"%02x", v45);
  objc_msgSend(v22, "appendFormat:", @"%02x", v44);
  objc_msgSend(v22, "appendFormat:", @"%02x", v46);
  return v22;
}

LABEL_15:
  if (!a4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, v8, @"CBUUID.m", 330, @"String %@ does not represent a valid UUID", v7 object file lineNumber description];

    goto LABEL_18;
  }

  uint64_t v15 = 0LL;
LABEL_20:

  return v15;
}
}
}

  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  uint64_t v24 = 0LL;
  objc_msgSend((id)gCBDaemonServer, "deviceMap", v15);
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __35__CBDiscovery__activateDirectStart__block_invoke_147;
  v18[3] = &unk_189FB49F8;
  v18[4] = *(void *)(a1 + 32);
  v18[5] = &v19;
  [v9 enumerateKeysAndObjectsUsingBlock:v18];

  char v11 = *(id *)(a1 + 32);
  objc_sync_enter(v11);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32LL), (id)v20[5]);
  objc_sync_exit(v11);

  if (v2) {
    v2[2](v2, 0LL);
  }
  char v12 = (void *)MEMORY[0x18959F890](*(void *)(*(void *)(a1 + 32) + 136LL));
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 32);
    v17[0] = v10;
    v17[1] = 3221225472LL;
    void v17[2] = __35__CBDiscovery__activateDirectStart__block_invoke_2_150;
    v17[3] = &unk_189FB4A20;
    v17[4] = v13;
    v17[5] = v12;
    [v14 enumerateKeysAndObjectsUsingBlock:v17];
  }

  _Block_object_dispose(&v19, 8);
LABEL_20:
}

  self->_deviceFlags |= qword_18702DA18[v4];
  if (self->_idsDeviceID)
  {
LABEL_5:
    if (self->_model) {
      goto LABEL_6;
    }
LABEL_19:
    [v10 model];
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_storeStrong((id *)&self->_model, v9);
      self->_attributeInternalFlags |= 1u;
    }

    [v10 name];
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }

  if (!v7)
  {
    -[CBDevice nearbyActionV2TargetData](self, "nearbyActionV2TargetData");
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = v15;
    char v12 = v10;
    if (v11 == v12)
    {
    }

    else
    {
      uint64_t v13 = v12;
      if ((v11 == 0LL) == (v12 != 0LL))
      {
      }

      else
      {
        uint64_t v14 = [v11 isEqual:v12];

        if ((v14 & 1) != 0) {
          goto LABEL_23;
        }
      }

      -[CBDevice setNearbyActionV2TargetData:](self, "setNearbyActionV2TargetData:", v11);
      char v9 = v8;
    }
  }

    uint64_t v14 = 512;
LABEL_16:
    uint64_t v15 = v12 & 0x7F;
    if (v15 >= 100) {
      uint64_t v15 = 100;
    }
    uint64_t v16 = v15 | v14;
    batteryInfoCase = self->_batteryInfoCase;
    uint64_t v18 = v16 != batteryInfoCase;
    if (v16 != batteryInfoCase) {
      goto LABEL_19;
    }
    goto LABEL_20;
  }

  LOWORD(v16) = 0;
  uint64_t v18 = self->_batteryInfoCase != 0;
  if (self->_batteryInfoCase) {
LABEL_19:
  }
    self->_batteryInfoCase = v16;
LABEL_20:
  if (a4 - v5 <= 0) {
    char v11 = 0;
  }
  if (!v11)
  {
    uint64_t v19 = 0;
    goto LABEL_27;
  }

  uint64_t v20 = *v5++;
  uint64_t v19 = v20;
  if (v20 != -1)
  {
    if (v19 < 0)
    {
      uint64_t v21 = 256;
      goto LABEL_28;
    }

    uint64_t v14 = 512;
LABEL_16:
    uint64_t v15 = v12 & 0x7F;
    if (v15 >= 100) {
      uint64_t v15 = 100;
    }
    uint64_t v16 = v15 | v14;
    batteryInfoCase = self->_batteryInfoCase;
    uint64_t v18 = v16 != batteryInfoCase;
    if (v16 != batteryInfoCase) {
      goto LABEL_19;
    }
    goto LABEL_20;
  }

  LOWORD(v16) = 0;
  uint64_t v18 = self->_batteryInfoCase != 0;
  if (self->_batteryInfoCase) {
LABEL_19:
  }
    self->_batteryInfoCase = v16;
LABEL_20:
  if (a4 - v5 <= 0) {
    char v11 = 0;
  }
  if (!v11)
  {
    uint64_t v19 = 0;
    goto LABEL_27;
  }

  uint64_t v20 = *v5++;
  uint64_t v19 = v20;
  if (v20 != -1)
  {
    if (v19 < 0)
    {
      uint64_t v21 = 256;
      goto LABEL_28;
    }

  uint64_t v16 = 0;
LABEL_16:
  self->_discoveryTypesInternal.bitArray[0] |= 0x80u;
  if (v9 != -[CBDevice airdropFlags](self, "airdropFlags")) {
    self->_airdropFlags = v9;
  }
  -[CBDevice airdropTempAuthTagData](self, "airdropTempAuthTagData");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = v10;
  uint64_t v18 = v17;
  if (v26 == v18)
  {

    if (v11 != -[CBDevice airdropModel](self, "airdropModel")) {
      goto LABEL_34;
    }
LABEL_22:
    if (v12 == -[CBDevice airdropVersion](self, "airdropVersion")) {
      goto LABEL_23;
    }
    goto LABEL_35;
  }

  if ((v26 == 0LL) == (v18 != 0LL))
  {

LABEL_33:
    v22 = (NSData *)v26;
    airdropTempAuthTagData = self->_airdropTempAuthTagData;
    self->_airdropTempAuthTagData = v22;

    if (v11 != -[CBDevice airdropModel](self, "airdropModel")) {
      goto LABEL_34;
    }
    goto LABEL_22;
  }

  uint64_t v19 = [v26 isEqual:v18];

  if ((v19 & 1) == 0) {
    goto LABEL_33;
  }
  if (v11 == -[CBDevice airdropModel](self, "airdropModel")) {
    goto LABEL_22;
  }
LABEL_34:
  self->_airdropModel = v11;
  if (v12 == -[CBDevice airdropVersion](self, "airdropVersion"))
  {
LABEL_23:
    if (v13 == -[CBDevice airdropHash1](self, "airdropHash1")) {
      goto LABEL_24;
    }
    goto LABEL_36;
  }

void sub_186FDBABC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_186FDC9F4(_Unwind_Exception *a1)
{
}

void sub_186FDCB2C(_Unwind_Exception *a1)
{
}

void sub_186FDCB40(_Unwind_Exception *a1)
{
}

void sub_186FDCC68(_Unwind_Exception *a1)
{
}

void sub_186FDCC7C(_Unwind_Exception *a1)
{
}

void sub_186FDCD08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void OUTLINED_FUNCTION_1_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_7(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

LABEL_27:
  uint64_t v21 = v13;
LABEL_29:

  return v21;
}
}

  objc_storeStrong((id *)&self->_nearbyAuthTag, self->_nearbyInfoAuthTag);
  if ((discoveryFlags & 0x60000000000LL) != 0)
  {
LABEL_12:
    if ((discoveryFlags & 0x10000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }

      if ((_DWORD)v13 == -[CBDevice nearbyActionDeviceClass](self, "nearbyActionDeviceClass")) {
        goto LABEL_28;
      }
LABEL_66:
      -[CBDevice setNearbyActionDeviceClass:](self, "setNearbyActionDeviceClass:", v13);
      v15 |= v14;
      if ((_DWORD)v12 == -[CBDevice dsActionFlags](self, "dsActionFlags"))
      {
LABEL_29:
        uint64_t v27 = -[CBDevice dsActionMeasuredPower](self, "dsActionMeasuredPower");
        uint64_t v28 = v49[4];
        if (*(_DWORD *)&v49[4] == v27) {
          goto LABEL_30;
        }
        goto LABEL_68;
      }

    uint64_t v21 = 512;
LABEL_28:
    v22 = v19 & 0x7F;
    if (v22 >= 100) {
      v22 = 100;
    }
    v23 = v22 | v21;
    if (v23 != self->_batteryInfoLeft) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }

  LOWORD(v23) = 0;
  if (self->_batteryInfoLeft)
  {
LABEL_31:
    self->_batteryInfoLeft = v23;
    uint64_t v18 = 1;
  }

    uint64_t v21 = 512;
LABEL_28:
    v22 = v19 & 0x7F;
    if (v22 >= 100) {
      v22 = 100;
    }
    v23 = v21 | v22;
    if (v23 != self->_batteryInfoLeft) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }

  LOWORD(v23) = 0;
  if (self->_batteryInfoLeft)
  {
LABEL_31:
    self->_batteryInfoLeft = v23;
    uint64_t v18 = 1;
  }

    if (!self->_listeningMode) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }

  CUPrintFlags64();
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintFlags64();
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  uint64_t v21 = v3;

  char v3 = v21;
  doubleTapActionLeft = self->_doubleTapActionLeft;
  doubleTapActionRight = self->_doubleTapActionRight;
LABEL_26:
  if (!self->_endCallConfig) {
    goto LABEL_27;
  }
LABEL_56:
  NSAppendPrintF_safe();
  uint64_t v36 = v3;

  char v3 = v36;
  if (!self->_listeningMode)
  {
LABEL_28:
    if (!self->_listeningModeConfigs) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

const char *CBCentralManagerConnectionLatencyToString(uint64_t a1)
{
  uint64_t v1 = a1 + 99;
  unint64_t result = "Invalid";
  switch(v1)
  {
    case 0LL:
      return result;
    case 88LL:
      unint64_t result = "MagnetSubrating";
      break;
    case 89LL:
      unint64_t result = "VeryHigh";
      break;
    case 90LL:
      unint64_t result = "Mid-Fixed";
      break;
    case 91LL:
      unint64_t result = "Low-Fixed";
      break;
    case 92LL:
      unint64_t result = "VeryLow";
      break;
    case 93LL:
      unint64_t result = "PowerOptimize";
      break;
    case 94LL:
      unint64_t result = "HomeKit";
      break;
    case 95LL:
      unint64_t result = "Continuity";
      break;
    case 96LL:
      unint64_t result = "MagnetUpgraded";
      break;
    case 97LL:
      unint64_t result = "Magnet";
      break;
    case 98LL:
      unint64_t result = "Midi";
      break;
    case 99LL:
      unint64_t result = "Low";
      break;
    case 100LL:
      unint64_t result = "Medium";
      break;
    case 101LL:
      unint64_t result = "High";
      break;
    default:
      unint64_t result = "?";
      break;
  }

  return result;
}

void sub_186FE1920( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_186FE1E98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186FE2B40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_35:
          var0 = self->_ucat->var0;
          break;
        case 15:
          if (!self->_l2capChannel) {
            goto LABEL_34;
          }
          self->_state = 16;
          if (state == 16) {
            return;
          }
          goto LABEL_35;
        case 16:
          self->_state = 17;
          if (state == 17) {
            return;
          }
          goto LABEL_35;
        case 17:
          if (-[CBConnection _runSetupChannel](self, "_runSetupChannel")) {
            goto LABEL_27;
          }
          goto LABEL_34;
        case 18:
          uint64_t v7 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion, a2);
          activateCompletion = self->_activateCompletion;
          self->_activateCompletion = 0LL;

          if (v7) {
            v7[2](v7, 0LL);
          }
          if (self->_blePSM)
          {
            -[CBConnection _processReads:](self, "_processReads:", 0LL);
            -[CBConnection _processWrites](self, "_processWrites");
          }

          goto LABEL_34;
        default:
LABEL_34:
          if (self->_state != state) {
            goto LABEL_35;
          }
          return;
      }
    }
  }

      return;
    }

    if (!-[CBWriteRequest endOfData](v8, "endOfData")) {
      goto LABEL_2;
    }
    uint64_t v17 = self->_ucat->var0;
    if (v17 <= 9 && (v17 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = self->_socketFD;
      LogPrintF_safe();
    }

    if (shutdown(self->_socketFD, 1) && (!*__error() || *__error()))
    {
      NSErrorF_safe();
      char v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
LABEL_2:
      char v6 = 0LL;
    }

    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0LL;

LABEL_4:
    -[CBConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v8, v6, v19, v20, v21, v22);

    --v5;
  }

  while (v5);
  if (self->_writeSuspended)
  {
    self->_writeSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_writeSource);
  }

    v23 = v11;

    return (__CFString *)v23;
  }

  uint64_t v14 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v1)];
  uint64_t v15 = (void *)v14;
  uint64_t v16 = &stru_189FB61A8;
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  uint64_t v17 = v16;

  return v17;
}

  if (a4 - v5 <= 7) {
    uint64_t v15 = 0;
  }
  if (!v15)
  {
    v23 = 0LL;
    if (!self->_homeKitV2Value) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }

  uint64_t v24 = *(void *)v5;
  v5 += 8;
  v23 = v24;
  if (v24 != self->_homeKitV2Value)
  {
LABEL_41:
    self->_homeKitV2Value = v23;
    uint64_t v13 = 0x1000000LL;
  }

  self->_airdropVersion = v12;
  if (v13 == -[CBDevice airdropHash1](self, "airdropHash1"))
  {
LABEL_24:
    uint64_t v20 = -[CBDevice airdropHash2](self, "airdropHash2");
    uint64_t v21 = v25;
    if (v25 == v20) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }

void sub_186FE47D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_186FE4CB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_186FE5344( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_186FE5B70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_31:
      uint64_t v20 = 0LL;
      goto LABEL_18;
    }

        -[NSMutableDictionary allKeysForObject:](self->_characteristicIDs, "allKeysForObject:", v24);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = [v28 count] == 0;

        if (!v29)
        {
          [MEMORY[0x1896077D8] currentHandler];
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          [v49 handleFailureInMethod:a2 object:self file:@"CBPeripheralManager.m" lineNumber:543 description:@"Characteristics cannot be added more than once"];
        }

        uint64_t v30 = (void *)MEMORY[0x189607968];
        ++self->_attributeIDGenerator;
        objc_msgSend(v30, "numberWithUnsignedInteger:");
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 setID:v31];

        uint64_t v32 = objc_alloc(MEMORY[0x189603FC8]);
        [v24 ID];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 UUID];
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v24, "properties"));
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v24, "permissions"));
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 value];
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v38 = v37;
        if (!v37)
        {
          [MEMORY[0x189603FE8] null];
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v38 = v67;
        }

        v69 = (void *)objc_msgSend( v32,  "initWithObjectsAndKeys:",  v33,  @"kCBMsgArgAttributeID",  v34,  @"kCBMsgArgUUID",  v35,  @"kCBMsgArgCharacteristicProperties",  v36,  @"kCBMsgArgAttributePermissions",  v38,  @"kCBMsgArgData",  0);
        if (!v37) {

        }
        uint64_t v39 = objc_alloc_init(MEMORY[0x189603FA8]);
        [v69 setObject:v39 forKeyedSubscript:@"kCBMsgArgDescriptors"];
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        [v24 descriptors];
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v41 = [v40 countByEnumeratingWithState:&v76 objects:v89 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v77;
          do
          {
            for (k = 0LL; k != v41; ++k)
            {
              if (*(void *)v77 != v42) {
                objc_enumerationMutation(v40);
              }
              uint64_t v44 = *(void **)(*((void *)&v76 + 1) + 8 * k);
              uint64_t v45 = objc_alloc(MEMORY[0x189603FC8]);
              [v44 UUID];
              uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
              [v44 value];
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              __int128 v48 = (void *)objc_msgSend( v45,  "initWithObjectsAndKeys:",  v46,  @"kCBMsgArgUUID",  v47,  @"kCBMsgArgData",  0);

              [v39 addObject:v48];
            }

            uint64_t v41 = [v40 countByEnumeratingWithState:&v76 objects:v89 count:16];
          }

          while (v41);
        }

        [v65 addObject:v69];
      }

      v23 = obj;
      v66 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
    }

    while (v66);
  }

  if (-[CBManager sendMsg:args:](self, "sendMsg:args:", 36LL, v60))
  {
    -[NSMutableArray addObject:](self->_services, "addObject:", v61);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v50 = -[CBService characteristics](v61, "characteristics");
    __int128 v51 = [v50 countByEnumeratingWithState:&v72 objects:v88 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v73;
      do
      {
        for (m = 0LL; m != v51; ++m)
        {
          if (*(void *)v73 != v52) {
            objc_enumerationMutation(v50);
          }
          v54 = *(void **)(*((void *)&v72 + 1) + 8 * m);
          characteristicIDs = self->_characteristicIDs;
          [v54 ID];
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:]( characteristicIDs,  "setObject:forKeyedSubscript:",  v54,  v56);
        }

        __int128 v51 = [v50 countByEnumeratingWithState:&v72 objects:v88 count:16];
      }

      while (v51);
    }
  }

  objc_sync_exit(v59);
}

  self->_spatialInteractionConfigFlags = 0;
  self->_spatialInteractionFlags = 0;
  spatialInteractionIdentifiers = self->_spatialInteractionIdentifiers;
  self->_spatialInteractionIdentifiers = 0LL;

  self->_spatialInteractionPeerID = 0;
  spatialInteractionPresenceConfigData = self->_spatialInteractionPresenceConfigData;
  self->_spatialInteractionPresenceConfigData = 0LL;

  spatialInteractionTokenData = self->_spatialInteractionTokenData;
  self->_spatialInteractionTokenData = 0LL;

  spatialInteractionUserInfo = self->_spatialInteractionUserInfo;
  self->_spatialInteractionUserInfo = 0LL;

  spatialInteractionUWBConfigData = self->_spatialInteractionUWBConfigData;
  self->_spatialInteractionUWBConfigData = 0LL;

  char v5 = self->_discoveryTypesInternal.bitArray[3];
  if ((self->_discoveryTypesInternal.bitArray[1] & 0x10) != 0)
  {
LABEL_16:
    if ((v5 & 0x40) != 0) {
      return;
    }
    goto LABEL_17;
  }

  [v4 filter];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  filter = self->_filter;
  uint64_t v18 = v16;
  uint64_t v19 = filter;
  if (v18 == v19)
  {

LABEL_40:
    goto LABEL_41;
  }

  uint64_t v20 = v19;
  if ((v18 == 0LL) == (v19 != 0LL))
  {

    goto LABEL_39;
  }

  uint64_t v21 = -[CBSpatialInteractionFilter isEqual:](v18, "isEqual:", v19);

  if (!v21)
  {
LABEL_39:
    CUPrintNSObjectOneLine();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 filter];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    uint64_t v25 = v9;

    objc_msgSend(v4, "filter", v23, v63);
    uint64_t v26 = (CBSpatialInteractionFilter *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = self->_filter;
    self->_filter = v26;
    uint64_t v7 = 1;
    uint64_t v9 = v25;
    goto LABEL_40;
  }

LABEL_3:
  [v9 minLength];
  [v10 maxLength];
  LogPrintF_safe();
}

void sub_186FE7E0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_186FE7E5C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

LABEL_25:
}

  nearbyActionAuthTag = self->_nearbyActionAuthTag;
  self->_nearbyActionAuthTag = 0LL;

  -[CBDevice setNearbyActionDeviceClass:](self, "setNearbyActionDeviceClass:", 0LL);
  self->_nearbyActionFlags = 0;
  self->_nearbyActionType = 0;
  if ((discoveryFlags & 0x400020108LL) != 0)
  {
LABEL_10:
    char v4 = self->_nearbyActionAuthTag;
    if (v4) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }

    if ((v8 & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_26;
  }

  -[CBDevice setAirplaySourceUWBConfigData:](self, "setAirplaySourceUWBConfigData:", v13);
  uint64_t v9 = 0x4000000000LL;
  if ((v8 & 0x10) == 0) {
    goto LABEL_36;
  }
LABEL_26:
  -[CBDevice airplaySourceAuthTagData](self, "airplaySourceAuthTagData");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  airplaySourceAuthTagData = v11;
  uint64_t v19 = v17;
  if (airplaySourceAuthTagData == v19)
  {
  }

  else
  {
    uint64_t v20 = v19;
    if ((airplaySourceAuthTagData == 0LL) == (v19 != 0LL))
    {
    }

    else
    {
      uint64_t v21 = -[NSData isEqual:](airplaySourceAuthTagData, "isEqual:", v19);

      if ((v21 & 1) != 0) {
        goto LABEL_36;
      }
    }

    v22 = airplaySourceAuthTagData;
    airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
    self->_airplaySourceAuthTagData = v22;
    uint64_t v9 = 0x4000000000LL;
  }

LABEL_36:
  self->_discoveryFlags |= 0x4000000000uLL;
  self->_changeFlags |= v9;
}

  if (a4 - v5 <= 0) {
    char v12 = 0;
  }
  if (!v12)
  {
    uint64_t v18 = 0;
    goto LABEL_32;
  }

  uint64_t v19 = *v5++;
  uint64_t v18 = v19;
  if (v19 != -1)
  {
    if (v18 < 0)
    {
      uint64_t v20 = 256;
      goto LABEL_33;
    }

id CBXpcCreateNSDictionaryWithXpcDictionary(void *a1)
{
  v10[4] = *MEMORY[0x1895F89C0];
  id v1 = a1;
  size_t count = xpc_dictionary_get_count(v1);
  uint64_t v3 = 8 * count;
  MEMORY[0x1895F8858]();
  char v4 = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v4, 8 * count);
  MEMORY[0x1895F8858]();
  bzero(v4, 8 * count);
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x2020000000LL;
  v10[3] = 0LL;
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 3221225472LL;
  applier[2] = __CBXpcCreateNSDictionaryWithXpcDictionary_block_invoke;
  applier[3] = &unk_189FB4960;
  applier[4] = v10;
  applier[5] = v4;
  applier[6] = v4;
  xpc_dictionary_apply(v1, applier);
  char v5 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithObjects:v4 forKeys:v4 count:count];
  _Block_object_dispose(v10, 8);
  if (count)
  {
    uint64_t v6 = 8 * count;
    do
    {

      v6 -= 8LL;
    }

    while (v6);
    uint64_t v7 = v4 - 8;
    do
    {

      v3 -= 8LL;
    }

    while (v3);
  }

  return v5;
}

void sub_186FE9858(_Unwind_Exception *a1)
{
}

uint64_t convertToWhbMsgId(uint64_t a1)
{
  if (_MergedGlobals_2 != -1) {
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_4);
  }
  CC_LONG v2 = (void *)MEMORY[0x189607968];
  id v3 = (id)qword_18C4B7DC0;
  [v2 numberWithUnsignedShort:a1];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:v4];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    uint64_t v6 = [v5 unsignedShortValue];

    return v6;
  }

  else
  {

    return 0LL;
  }

id CBXpcCreateXPCDictionaryWithNSDictionary(void *a1)
{
  v9[4] = *MEMORY[0x1895F89C0];
  id v1 = a1;
  size_t v2 = [v1 count];
  uint64_t v3 = 8 * v2;
  MEMORY[0x1895F8858]();
  char v4 = (char *)v8 - ((8 * v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v4, 8 * v2);
  MEMORY[0x1895F8858]();
  char v5 = v4;
  bzero(v4, 8 * v2);
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2020000000LL;
  v9[3] = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __CBXpcCreateXPCDictionaryWithNSDictionary_block_invoke;
  v8[3] = &unk_189FB4918;
  v8[4] = v9;
  v8[5] = v4;
  v8[6] = v4;
  [v1 enumerateKeysAndObjectsUsingBlock:v8];
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v4, (xpc_object_t *)v4, v2);
  _Block_object_dispose(v9, 8);
  if (v2)
  {
    do
    {

      v3 -= 8LL;
    }

    while (v3);
  }

  return v6;
}

void sub_186FE9EFC(_Unwind_Exception *a1)
{
}

uint64_t convertToCBMsgId(__int16 a1)
{
  uint64_t v7 = 0LL;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  __int16 v10 = 0;
  if (_MergedGlobals_2 != -1) {
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_4);
  }
  id v2 = (id)qword_18C4B7DC0;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __convertToCBMsgId_block_invoke;
  v5[3] = &unk_189FB48F0;
  __int16 v6 = a1;
  v5[4] = &v7;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
  uint64_t v3 = *((unsigned __int16 *)v8 + 12);

  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_186FEA2A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __msgConversionMap_block_invoke()
{
  v3[35] = *MEMORY[0x1895F89C0];
  v2[0] = &unk_189FD5D28;
  v2[1] = &unk_189FD5D40;
  v3[0] = &unk_189FD5D28;
  v3[1] = &unk_189FD5D40;
  v2[2] = &unk_189FD5D58;
  v2[3] = &unk_189FD5D70;
  v3[2] = &unk_189FD5D58;
  v3[3] = &unk_189FD5D70;
  v2[4] = &unk_189FD5D88;
  v2[5] = &unk_189FD5DA0;
  v3[4] = &unk_189FD5D88;
  v3[5] = &unk_189FD5DA0;
  v2[6] = &unk_189FD5DB8;
  v2[7] = &unk_189FD5DE8;
  v3[6] = &unk_189FD5DD0;
  v3[7] = &unk_189FD5E00;
  v2[8] = &unk_189FD5E18;
  v2[9] = &unk_189FD5E48;
  v3[8] = &unk_189FD5E30;
  v3[9] = &unk_189FD5DE8;
  v2[10] = &unk_189FD5E60;
  v2[11] = &unk_189FD5E78;
  v3[10] = &unk_189FD5E18;
  v3[11] = &unk_189FD5E90;
  v2[12] = &unk_189FD5EA8;
  v2[13] = &unk_189FD5ED8;
  v3[12] = &unk_189FD5EC0;
  v3[13] = &unk_189FD5EF0;
  v2[14] = &unk_189FD5F08;
  v2[15] = &unk_189FD5F20;
  v3[14] = &unk_189FD5F08;
  v3[15] = &unk_189FD5F38;
  v2[16] = &unk_189FD5F50;
  v2[17] = &unk_189FD5F80;
  v3[16] = &unk_189FD5F68;
  v3[17] = &unk_189FD5F98;
  v2[18] = &unk_189FD5FB0;
  v2[19] = &unk_189FD5FE0;
  v3[18] = &unk_189FD5FC8;
  v3[19] = &unk_189FD5FF8;
  v2[20] = &unk_189FD6010;
  v2[21] = &unk_189FD6028;
  v3[20] = &unk_189FD5F08;
  v3[21] = &unk_189FD6040;
  v2[22] = &unk_189FD6058;
  v2[23] = &unk_189FD6088;
  v3[22] = &unk_189FD6070;
  v3[23] = &unk_189FD60A0;
  v2[24] = &unk_189FD60B8;
  v2[25] = &unk_189FD60E8;
  v3[24] = &unk_189FD60D0;
  v3[25] = &unk_189FD6100;
  v2[26] = &unk_189FD6118;
  v2[27] = &unk_189FD6148;
  v3[26] = &unk_189FD6130;
  v3[27] = &unk_189FD6160;
  v2[28] = &unk_189FD6178;
  v2[29] = &unk_189FD61A8;
  v3[28] = &unk_189FD6190;
  v3[29] = &unk_189FD5F20;
  v2[30] = &unk_189FD61C0;
  v2[31] = &unk_189FD61D8;
  v3[30] = &unk_189FD5F50;
  v3[31] = &unk_189FD61F0;
  v2[32] = &unk_189FD6208;
  v2[33] = &unk_189FD6238;
  v3[32] = &unk_189FD6220;
  v3[33] = &unk_189FD6250;
  v2[34] = &unk_189FD6268;
  v3[34] = &unk_189FD6280;
  uint64_t v0 = [MEMORY[0x189603F68] dictionaryWithObjects:v3 forKeys:v2 count:35];
  uint64_t v1 = (void *)qword_18C4B7DC0;
  qword_18C4B7DC0 = v0;
}

void __convertToCBMsgId_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  if ([a3 unsignedShortValue] == *(unsigned __int16 *)(a1 + 40))
  {
    *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 unsignedShortValue];
    *a4 = 1;
  }
}

void __CBXpcCreateXPCDictionaryWithNSDictionary_block_invoke(void *a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(void *)(a1[5] + 8 * *(void *)(*(void *)(a1[4] + 8) + 24)) = [v5 UTF8String];
  uint64_t v7 = CBXpcCreateXPCObjectWithNSObject(v6);

  uint64_t v8 = a1[6];
  uint64_t v9 = 8LL * *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  __int16 v10 = *(void **)(v8 + v9);
  *(void *)(v8 + v9) = v7;

  ++*(void *)(*(void *)(a1[4] + 8LL) + 24LL);
}

id CBXpcCreateXPCObjectWithNSObject(void *a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  if ([v1 isNSNumber])
  {
    if (CFNumberIsFloatType((CFNumberRef)v1))
    {
      [v1 doubleValue];
      uint64_t v3 = (uint64_t)xpc_double_create(v2);
    }

    else
    {
      uint64_t v3 = (uint64_t)xpc_int64_create([v1 longLongValue]);
    }
  }

  else if ([v1 isNSString])
  {
    uint64_t v3 = (uint64_t)xpc_string_create((const char *)[v1 UTF8String]);
  }

  else if ([v1 isNSData])
  {
    id v4 = v1;
    uint64_t v3 = (uint64_t)xpc_data_create((const void *)[v4 bytes], objc_msgSend(v4, "length"));
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(void *)uuid = 0LL;
      uint64_t v9 = 0LL;
      [v1 getUUIDBytes:uuid];
      uint64_t v3 = (uint64_t)xpc_uuid_create(uuid);
    }

    else if ([v1 isNSArray])
    {
      uint64_t v3 = CBXpcCreateXPCArrayWithNSArray(v1);
    }

    else if ([v1 isNSDictionary])
    {
      uint64_t v3 = CBXpcCreateXPCDictionaryWithNSDictionary(v1);
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [v1 data];
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        CBXpcCreateXPCObjectWithNSObject(v5);
        id v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:
        [MEMORY[0x189603F70] raise:@"Invalid Object", @"Object %@ is invalid", v1 format];
        id v6 = 0LL;
        goto LABEL_22;
      }

      uint64_t v3 = (uint64_t)xpc_null_create();
    }
  }

  id v6 = (void *)v3;
LABEL_20:
  if (!v6) {
    goto LABEL_21;
  }
LABEL_22:

  return v6;
}

id CBXpcCreateXPCArrayWithNSArray(void *a1)
{
  void v9[5] = *MEMORY[0x1895F89C0];
  id v1 = a1;
  size_t v2 = [v1 count];
  uint64_t v3 = v2;
  MEMORY[0x1895F8858]();
  id v5 = (xpc_object_t *)((char *)v9 - v4);
  bzero((char *)v9 - v4, 8 * v2);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __CBXpcCreateXPCArrayWithNSArray_block_invoke;
  v9[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v9[4] = v5;
  [v1 enumerateObjectsUsingBlock:v9];
  xpc_object_t v6 = xpc_array_create(v5, v2);
  if (v2)
  {
    uint64_t v7 = v5 - 1;
    do

    while (v3 * 8);
  }

  return v6;
}

void __CBXpcCreateXPCArrayWithNSArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = CBXpcCreateXPCObjectWithNSObject(a2);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 8 * a3);
  *(void *)(v6 + 8 * a3) = v5;
}

uint64_t __CBXpcCreateNSDictionaryWithXpcDictionary_block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)NSString;
  id v6 = a3;
  uint64_t v7 = [v5 stringWithUTF8String:a2];
  uint64_t v8 = a1[5];
  uint64_t v9 = 8LL * *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  uint64_t v10 = *(void **)(v8 + v9);
  *(void *)(v8 + v9) = v7;

  uint64_t v11 = CBXpcCreateNSObjectWithXpcObject(v6);

  uint64_t v12 = a1[6];
  uint64_t v13 = 8LL * *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  uint64_t v14 = *(void **)(v12 + v13);
  *(void *)(v12 + v13) = v11;

  ++*(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  return 1LL;
}

__CFString *CBXpcCreateNSObjectWithXpcObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = MEMORY[0x18959FCE0]();
  if (v2 == MEMORY[0x1895F9280])
  {
    [MEMORY[0x189607968] numberWithLongLong:xpc_int64_get_value(v1)];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }

  uint64_t v3 = v2;
  if (v2 == MEMORY[0x1895F92F0])
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:xpc_uint64_get_value(v1)];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }

  if (v2 == MEMORY[0x1895F9228])
  {
    BOOL value = xpc_BOOL_get_value(v1);
    uint64_t v13 = (void *)MEMORY[0x189604A80];
    if (value) {
      uint64_t v13 = (void *)MEMORY[0x189604A88];
    }
    id v11 = v13;
    goto LABEL_35;
  }

  if (v2 != MEMORY[0x1895F92E8])
  {
    if (v2 == MEMORY[0x1895F9240])
    {
      id v19 = objc_alloc(MEMORY[0x189603F48]);
      bytes_ptr = xpc_data_get_bytes_ptr(v1);
      id v11 = (id)[v19 initWithBytes:bytes_ptr length:xpc_data_get_length(v1)];
    }

    else if (v2 == MEMORY[0x1895F92F8])
    {
      id v11 = (id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:xpc_uuid_get_bytes(v1)];
    }

    else if (v2 == MEMORY[0x1895F9220])
    {
      CBXpcCreateNSArrayWithXpcArray(v1);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    else if (v2 == MEMORY[0x1895F9250])
    {
      CBXpcCreateNSDictionaryWithXpcDictionary(v1);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    else if (v2 == MEMORY[0x1895F9270])
    {
      uint64_t v21 = xpc_fd_dup(v1);
      if ((v21 & 0x80000000) != 0)
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        }
        v22 = (void *)CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
          CBXpcCreateNSObjectWithXpcObject_cold_1(v22);
        }
      }

      [MEMORY[0x189607968] numberWithInt:v21];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (v2 != MEMORY[0x1895F9258])
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        }
        uint64_t v4 = (os_log_s *)CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
          CBXpcCreateNSObjectWithXpcObject_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);
        }

        return (__CFString *)0LL;
      }

      [MEMORY[0x189607968] numberWithDouble:xpc_double_get_value(v1)];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

id CBXpcCreateNSArrayWithXpcArray(void *a1)
{
  applier[5] = *MEMORY[0x1895F89C0];
  id v1 = a1;
  size_t count = xpc_array_get_count(v1);
  size_t v3 = 8 * count;
  MEMORY[0x1895F8858]();
  bzero((char *)applier - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), v3);
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 3221225472LL;
  applier[2] = __CBXpcCreateNSArrayWithXpcArray_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0LL);
  xpc_array_apply(v1, applier);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:(char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0) count:count];
  if (count)
  {
    do
    {

      v3 -= 8LL;
    }

    while (v3);
  }

  return v4;
}

uint64_t __CBXpcCreateNSArrayWithXpcArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = CBXpcCreateNSObjectWithXpcObject(a3);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 8 * a2);
  *(void *)(v6 + 8 * a2) = v5;

  return 1LL;
}

void OUTLINED_FUNCTION_3_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

const char *CBUseCaseToString_0(int a1)
{
  if (a1 >= 0x20000)
  {
    if (a1 >= 327680)
    {
      if (a1 > 589824)
      {
        if (a1 <= 2147418111)
        {
          switch(a1)
          {
            case 589825:
              return "FindNearbyPencil";
            case 655360:
              return "AccessDigitalHomeKey";
            case 786432:
              return "ProxControlDeviceClose";
            default:
              return "?";
          }
        }

        else
        {
          switch(a1)
          {
            case 2147418112:
              unint64_t result = "InternalTestNoLockScan";
              break;
            case 2147418113:
              unint64_t result = "InternalTestNoScreenOffScan";
              break;
            case 2147418114:
              unint64_t result = "InternalTestScanWithNoDups";
              break;
            case 2147418115:
              unint64_t result = "InternalTestScanWithDups";
              break;
            case 2147418116:
              unint64_t result = "InternalTestScanFor20Seconds";
              break;
            case 2147418117:
              unint64_t result = "InternalTestActiveScan";
              break;
            case 2147418118:
              unint64_t result = "InternalTestUUIDScan";
              break;
            case 2147418119:
              unint64_t result = "InternalTestScanFor10ClockSeconds";
              break;
            case 2147418120:
              unint64_t result = "InternalTestScanBoost";
              break;
            default:
              return "?";
          }
        }
      }

      else if (a1 > 458752)
      {
        switch(a1)
        {
          case 524288:
            unint64_t result = "ADPD";
            break;
          case 524289:
            unint64_t result = "ADPDBuffer";
            break;
          case 524290:
            unint64_t result = "MicroLocation";
            break;
          case 524291:
            unint64_t result = "MicroLocationLeech";
            break;
          default:
            if (a1 == 458753)
            {
              unint64_t result = "PrecisionFindingFindee";
            }

            else
            {
              if (a1 != 589824) {
                return "?";
              }
              unint64_t result = "FindNearbyRemote";
            }

            break;
        }
      }

      else
      {
        switch(a1)
        {
          case 393216:
            unint64_t result = "CaptiveNetworkJoin";
            break;
          case 393217:
            unint64_t result = "UseCaseSIMTransfer";
            break;
          case 393218:
            unint64_t result = "MacSetup";
            break;
          case 393219:
            unint64_t result = "AppleIDSignIn";
            break;
          case 393220:
            unint64_t result = "AppleIDSignInSettings";
            break;
          default:
            if (a1 == 327680)
            {
              unint64_t result = "RapportThirdParty";
            }

            else
            {
              if (a1 != 458752) {
                return "?";
              }
              unint64_t result = "PrecisionFindingFinder";
            }

            break;
        }
      }
    }

    else
    {
      switch(a1)
      {
        case 131072:
          return "SharingDefault";
        case 131073:
          return "SharingPhoneAutoUnlock";
        case 131074:
          return "SharingSiriWatchAuth";
        case 131075:
          return "SharingMacAutoUnlock";
        case 131076:
          return "SharingEDTScreenOn";
        case 131077:
          return "SharingEDTWiFiDisabled";
        case 131078:
          return "SharingEDTWombatEligibleAsDefaultCamera";
        case 131079:
          return "SharingEDTWombatCameraPicker";
        case 131080:
          return "SharingWombatBackground";
        case 131081:
          return "SharingUniversalControl";
        case 131082:
          return "SharingPeopleProximity";
        case 131083:
          return "SharingEDTEnsembleOpenDisplayPrefs";
        case 131084:
          return "SharingEDTNearbydMotionStopped";
        case 131085:
          return "SharingDoubleBoostGenericScan";
        case 131086:
          return "SharingEDTIncomingAdvertisement ";
        case 131087:
          return "SharingEDTWombatStreamStart";
        case 131088:
          return "SharingOYAutoUnlock";
        case 131089:
          return "?";
        case 131090:
          return "SharingAirDrop";
        case 131091:
          return "SharingNearbyInvitationHost";
        case 131092:
          return "SharingNearbyInvitationParticipant";
        case 131093:
          return "SharingAirDropAskToAirDrop";
        case 131094:
          return "SharingAirDropTempIdentity";
        case 131095:
          return "SharingAirDropNeedsCLink";
        case 131096:
          return "SharingRemoteWidgetUpdate";
        case 131097:
          return "SharingCountryCodeUpdate";
        case 131098:
          return "SharingMacPhoneAutoUnlock";
        case 131099:
          return "SharingVisionProDiscovery";
        case 131100:
          return "SharingVisionProStateChange";
        case 131101:
          return "SharingContinuityScreen";
        case 131102:
          return "SharingEDTRemoteDisplay";
        default:
          if (a1 == 196608)
          {
            unint64_t result = "DigitalIDTSA";
          }

          else
          {
            if (a1 != 0x40000) {
              return "?";
            }
            unint64_t result = "DigitalCarKeyThirdParty";
          }

          break;
      }
    }
  }

  else
  {
    unint64_t result = "Unspecified";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        unint64_t result = "HealthKit";
        break;
      case 2:
        unint64_t result = "HomeKit";
        break;
      case 3:
        unint64_t result = "FindMyObjectConnection";
        break;
      case 4:
        unint64_t result = "FindMyObjectConnectionTransient";
        break;
      case 5:
        unint64_t result = "MIDI";
        break;
      case 6:
        unint64_t result = "Continuity";
        break;
      case 7:
        unint64_t result = "InstantHotSpot";
        break;
      case 8:
        unint64_t result = "NearBy";
        break;
      case 9:
        unint64_t result = "Sharing";
        break;
      case 10:
        unint64_t result = "HearingSupport";
        break;
      case 11:
        unint64_t result = "Magnet";
        break;
      case 12:
        unint64_t result = "HID";
        break;
      case 13:
        unint64_t result = "LEA";
        break;
      case 14:
        unint64_t result = "External";
        break;
      case 15:
        unint64_t result = "ExternalMedical";
        break;
      case 16:
        unint64_t result = "ExternalLock";
        break;
      case 17:
        unint64_t result = "ExternalWatch";
        break;
      case 18:
        unint64_t result = "SmartRouting";
        break;
      case 19:
        unint64_t result = "DigitalID";
        break;
      case 20:
        unint64_t result = "DigitalKey";
        break;
      case 21:
        unint64_t result = "DigitalCarKey";
        break;
      case 22:
        unint64_t result = "HeySiri";
        break;
      case 23:
        unint64_t result = "ThirdPartyApp";
        break;
      case 24:
        unint64_t result = "CNJ";
        break;
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
      case 261:
      case 262:
        return "?";
      case 256:
        unint64_t result = "DevicePresenceDetection";
        break;
      case 257:
        unint64_t result = "AudioBox";
        break;
      case 258:
        unint64_t result = "SIMTransfer";
        break;
      case 259:
        unint64_t result = "ProximityScreenOnLeechScan";
        break;
      case 260:
        unint64_t result = "MacMigrate";
        break;
      case 263:
        unint64_t result = "HIDUARTService";
        break;
      case 264:
        unint64_t result = "AccessibilitySwitchControlPairing";
        break;
      case 265:
        unint64_t result = "BaseBandFastConnect";
        break;
      case 266:
        unint64_t result = "SafetyAlerts";
        break;
      case 267:
        unint64_t result = "LECarPlay";
        break;
      case 268:
        unint64_t result = "TCCBluetooth";
        break;
      case 269:
        unint64_t result = "AOPBufferLeech";
        break;
      default:
        switch(a1)
        {
          case 65536:
            unint64_t result = "FindMyAction";
            break;
          case 65537:
            unint64_t result = "FindMyBackground";
            break;
          case 65538:
            unint64_t result = "FindMyActionHELE";
            break;
          case 65539:
            unint64_t result = "FindMyBackgroundHELE";
            break;
          case 65540:
            unint64_t result = "FindMyActionTransient";
            break;
          case 65541:
            unint64_t result = "FindMyBackgroundTransient";
            break;
          case 65542:
            unint64_t result = "FindMyActionHELETransient";
            break;
          case 65543:
            unint64_t result = "FindMyBackgroundHELETransient";
            break;
          case 65544:
            unint64_t result = "FindMyNotOptedIn";
            break;
          case 65545:
            unint64_t result = "FindMyOptedIn";
            break;
          case 65546:
            unint64_t result = "FindMySepAlertsEnabled";
            break;
          case 65547:
            unint64_t result = "FindMyTemporaryAggressiveLegacy";
            break;
          case 65548:
            unint64_t result = "FindMyTemporaryLongAggressive";
            break;
          case 65549:
            unint64_t result = "FindMyBTFindingUserInitiated";
            break;
          case 65550:
            unint64_t result = "FindMyHELE";
            break;
          case 65551:
            unint64_t result = "FindMyBeaconOnDemand";
            break;
          case 65552:
            unint64_t result = "FindMyWildTimedScan";
            break;
          case 65553:
            unint64_t result = "FindMyBackgroundLeechScan";
            break;
          case 65554:
            unint64_t result = "FindMySnifferMode";
            break;
          case 65555:
            unint64_t result = "FindMyUnpair";
            break;
          case 65556:
            unint64_t result = "FindMyUnpairHELE";
            break;
          case 65557:
            unint64_t result = "FindMyPlaySound";
            break;
          case 65558:
            unint64_t result = "FindMyPlaySoundHELE";
            break;
          case 65559:
            unint64_t result = "FindMyNotOptedInBeepOnMoveWaking";
            break;
          case 65560:
            unint64_t result = "FindMyUTTransient";
            break;
          case 65561:
            unint64_t result = "FindMyUTHELETransient";
            break;
          default:
            return "?";
        }

        break;
    }
  }

  return result;
}

LABEL_52:
  if (*(_DWORD *)(v4 + 41) != *(_DWORD *)self->_discoveryTypesInternal.bitArray
    || v4[45] != self->_discoveryTypesInternal.bitArray[4])
  {
    CBDiscoveryTypesToString((uint64_t)&self->_discoveryTypesInternal);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    CBDiscoveryTypesToString((uint64_t)(v4 + 41));
    v116 = v36;
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    uint64_t v37 = v9;

    uint64_t v38 = *(_DWORD *)(v4 + 41);
    self->_discoveryTypesInternal.bitArray[4] = v4[45];
    *(_DWORD *)self->_discoveryTypesInternal.bitArray = v38;
    uint64_t v7 = 1;
    uint64_t v9 = v37;
  }

  objc_msgSend(v4, "oobKeys", v116, v126);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  oobKeys = self->_oobKeys;
  uint64_t v41 = v39;
  uint64_t v42 = oobKeys;
  if (v41 == v42)
  {

LABEL_69:
    goto LABEL_70;
  }

  uint64_t v43 = v42;
  if ((v41 == 0LL) == (v42 != 0LL))
  {

    goto LABEL_68;
  }

  uint64_t v44 = -[NSArray isEqual:](v41, "isEqual:", v42);

  if ((v44 & 1) == 0)
  {
LABEL_68:
    CUPrintNSObjectOneLine();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oobKeys];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    __int128 v51 = v9;

    objc_msgSend(v4, "oobKeys", v49, v134);
    uint64_t v52 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = self->_oobKeys;
    self->_oobKeys = v52;
    uint64_t v7 = 1;
    uint64_t v9 = v51;
    goto LABEL_69;
  }

  if (a4 - v5 <= 0) {
    id v19 = 0;
  }
  if (!v19)
  {
    uint64_t v29 = 0;
    if (!self->_homeKitV1CompatibleVersion) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }

  uint64_t v30 = *(unsigned __int8 *)v5++;
  uint64_t v29 = v30;
  if (v30 != self->_homeKitV1CompatibleVersion)
  {
LABEL_58:
    self->_homeKitV1CompatibleVersion = v29;
    v10 |= 0x400000uLL;
  }

LABEL_75:
  objc_msgSend(v4, "useCaseClientIDs", v118, v132);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  useCaseClientIDs = self->_useCaseClientIDs;
  v64 = v62;
  v65 = useCaseClientIDs;
  if (v64 == v65)
  {

    v92 = v64;
  }

  else
  {
    v66 = v65;
    if ((v64 == 0LL) != (v65 != 0LL))
    {
      v67 = -[NSArray isEqual:](v64, "isEqual:", v65);

      if ((v67 & 1) != 0)
      {
        v68 = [v4 bleSensorRssiIncreaseScanThreshold];
        bleSensorRssiIncreaseScanThreshold = self->_bleSensorRssiIncreaseScanThreshold;
        if (v68 == self->_bleSensorRssiIncreaseScanThreshold) {
          goto LABEL_79;
        }
        goto LABEL_104;
      }
    }

    else
    {
    }

    CUPrintNSObjectOneLine();
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v119 = v97;
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v98 = v9;

    v99 = v64;
    v92 = self->_useCaseClientIDs;
    self->_useCaseClientIDs = v99;
    uint64_t v7 = 1;
    uint64_t v9 = v98;
  }

  v100 = [v4 bleSensorRssiIncreaseScanThreshold];
  bleSensorRssiIncreaseScanThreshold = self->_bleSensorRssiIncreaseScanThreshold;
  if (v100 == self->_bleSensorRssiIncreaseScanThreshold)
  {
LABEL_79:
    v70 = objc_msgSend(v4, "bleSensorEnableRssiIncreaseScan", v119, v135);
    bleSensorEnableRssiIncreaseScan = self->_bleSensorEnableRssiIncreaseScan;
    if (bleSensorEnableRssiIncreaseScan == v70) {
      goto LABEL_80;
    }
    goto LABEL_105;
  }

    *p_bleScanRateScreenOff = 35;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Medium"))
    {
LABEL_45:
      if (strcmp(v18, "High")) {
        goto LABEL_79;
      }
LABEL_77:
      *p_bleScanRateScreenOff = 50;
      goto LABEL_78;
    }

LABEL_104:
  v101 = objc_msgSend(v4, "bleSensorRssiIncreaseScanThreshold", v119, v135);
  v122 = bleSensorRssiIncreaseScanThreshold;
  v139 = v101;
  CUAppendF();
  v102 = v9;

  self->_bleSensorRssiIncreaseScanThreshold = objc_msgSend(v4, "bleSensorRssiIncreaseScanThreshold", v122, v139);
  uint64_t v7 = 1;
  uint64_t v9 = v102;
  v103 = [v4 bleSensorEnableRssiIncreaseScan];
  bleSensorEnableRssiIncreaseScan = self->_bleSensorEnableRssiIncreaseScan;
  if (bleSensorEnableRssiIncreaseScan == v103)
  {
LABEL_80:
    v72 = [v4 bleSensorIncreaseScanRate];
    bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
    if (v72 == (_DWORD)bleSensorIncreaseScanRate) {
      goto LABEL_81;
    }
    goto LABEL_106;
  }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "HomePodSetup");
      if ((discoveryFlags & 0x20) == 0)
      {
LABEL_35:
        if ((discoveryFlags & 0x80000) == 0) {
          goto LABEL_36;
        }
        goto LABEL_106;
      }

LABEL_105:
  v123 = bleSensorEnableRssiIncreaseScan;
  v140 = [v4 bleSensorEnableRssiIncreaseScan];
  CUAppendF();
  v104 = v9;

  self->_bleSensorEnableRssiIncreaseScan = objc_msgSend(v4, "bleSensorEnableRssiIncreaseScan", v123, v140);
  uint64_t v7 = 1;
  uint64_t v9 = v104;
  v105 = [v4 bleSensorIncreaseScanRate];
  bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
  if (v105 == (_DWORD)bleSensorIncreaseScanRate)
  {
LABEL_81:
    v74 = [v4 bleSensorIncreaseScanTimeout];
    bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
    if (v74 == (_DWORD)bleSensorIncreaseScanTimeout) {
      goto LABEL_82;
    }
    goto LABEL_107;
  }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "iOSSetup");
      if ((discoveryFlags & 0x80000) == 0)
      {
LABEL_36:
        if ((discoveryFlags & 0x40) == 0) {
          goto LABEL_37;
        }
        goto LABEL_107;
      }

LABEL_106:
  v124 = bleSensorIncreaseScanRate;
  v141 = [v4 bleSensorIncreaseScanRate];
  CUAppendF();
  v106 = v9;

  self->_bleSensorIncreaseScanRate = objc_msgSend(v4, "bleSensorIncreaseScanRate", v124, v141);
  uint64_t v7 = 1;
  uint64_t v9 = v106;
  v107 = [v4 bleSensorIncreaseScanTimeout];
  bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
  if (v107 == (_DWORD)bleSensorIncreaseScanTimeout)
  {
LABEL_82:
    v76 = [v4 bleSensorTimeoutBetweenIncreaseScan];
    bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
    if (v76 == (_DWORD)bleSensorTimeoutBetweenIncreaseScan) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "NearbyAction");
      if ((discoveryFlags & 0x40) == 0)
      {
LABEL_37:
        if ((discoveryFlags & 0x800000000000LL) == 0) {
          goto LABEL_38;
        }
        goto LABEL_108;
      }

LABEL_107:
  v125 = bleSensorIncreaseScanTimeout;
  v142 = [v4 bleSensorIncreaseScanTimeout];
  CUAppendF();
  v108 = v9;

  self->_bleSensorIncreaseScanTimeout = objc_msgSend(v4, "bleSensorIncreaseScanTimeout", v125, v142);
  uint64_t v7 = 1;
  uint64_t v9 = v108;
  v109 = [v4 bleSensorTimeoutBetweenIncreaseScan];
  bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
  if (v109 != (_DWORD)bleSensorTimeoutBetweenIncreaseScan)
  {
LABEL_83:
    v120 = bleSensorTimeoutBetweenIncreaseScan;
    v136 = [v4 bleSensorTimeoutBetweenIncreaseScan];
    CUAppendF();
    v78 = v9;

    self->_bleSensorTimeoutBetweenIncreaseScan = objc_msgSend(v4, "bleSensorTimeoutBetweenIncreaseScan", v120, v136);
    uint64_t v7 = 1;
    uint64_t v9 = v78;
  }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "NearbyInfo");
      if ((discoveryFlags & 0x800000000000LL) == 0)
      {
LABEL_38:
        if ((discoveryFlags & 0x100) == 0) {
          goto LABEL_39;
        }
        goto LABEL_109;
      }

LABEL_84:
  [v4 typeToRssiThresholds];
  v79 = (NSArray *)objc_claimAutoreleasedReturnValue();
  typeToRssiThresholds = self->_typeToRssiThresholds;

  if (v79 != typeToRssiThresholds)
  {
    v81 = self->_typeToRssiThresholds;
    [v4 typeToRssiThresholds];
    v121 = v81;
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v82 = v9;

    objc_msgSend(v4, "typeToRssiThresholds", v121, v137);
    v83 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v84 = self->_typeToRssiThresholds;
    self->_typeToRssiThresholds = v83;

    uint64_t v7 = 1;
    uint64_t v9 = v82;
  }

  [v4 spatialInteractionfilter];
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  spatialInteractionfilter = self->_spatialInteractionfilter;
  v87 = v85;
  v88 = spatialInteractionfilter;
  if (v87 == v88)
  {

    var0 = self->_ucat->var0;
    if (v9) {
      goto LABEL_90;
    }
LABEL_111:
    goto LABEL_117;
  }

  v89 = v88;
  if ((v87 == 0LL) == (v88 != 0LL))
  {

LABEL_110:
    CUPrintNSObjectOneLine();
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 spatialInteractionfilter];
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v112 = v9;

    objc_msgSend(v4, "spatialInteractionfilter", v110, v143);
    v113 = (CBSpatialInteractionFilter *)objc_claimAutoreleasedReturnValue();
    v114 = self->_spatialInteractionfilter;
    self->_spatialInteractionfilter = v113;
    uint64_t v7 = 1;
    uint64_t v9 = v112;

    var0 = self->_ucat->var0;
    if (v112) {
      goto LABEL_90;
    }
    goto LABEL_111;
  }

  v90 = -[CBSpatialInteractionFilter isEqual:](v87, "isEqual:", v88);

  if (!v90) {
    goto LABEL_110;
  }
  var0 = self->_ucat->var0;
  if (!v9) {
    goto LABEL_111;
  }
LABEL_90:
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_113:
  }
    LogPrintF_safe();
LABEL_117:

  return v7;
}

LABEL_73:
    *p_bleScanRateScreenOff = 20;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Low"))
    {
LABEL_43:
      if (strcmp(v18, "MediumLow")) {
        goto LABEL_44;
      }
      goto LABEL_75;
    }

  self->_discoveryFlags |= 0x80uLL;
  self->_changeFlags |= v9;
}

LABEL_74:
    *p_bleScanRateScreenOff = 30;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "MediumLow"))
    {
LABEL_44:
      if (strcmp(v18, "Medium")) {
        goto LABEL_45;
      }
      goto LABEL_76;
    }

LABEL_76:
    *p_bleScanRateScreenOff = 40;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "High")) {
      goto LABEL_79;
    }
    goto LABEL_77;
  }

  p_bleScanRate = &self->_bleScanRate;
  uint64_t v21 = strcmp(string, "Default");
  if (v18)
  {
    if (v21)
    {
      if (strcmp(v18, "Default")) {
        goto LABEL_24;
      }
    }

    else
    {
      *p_bleScanRate = 0;
      uint64_t v7 = 0x80000000000LL;
      if (strcmp(v18, "Default"))
      {
LABEL_24:
        if (strcmp(string, "Periodic")) {
          goto LABEL_25;
        }
        goto LABEL_58;
      }
    }

    *p_bleScanRateScreenOff = 0;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Periodic"))
    {
LABEL_25:
      if (strcmp(v18, "Periodic")) {
        goto LABEL_26;
      }
      goto LABEL_59;
    }

LABEL_58:
    *p_bleScanRate = 10;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Periodic"))
    {
LABEL_26:
      if (strcmp(string, "Background")) {
        goto LABEL_27;
      }
      goto LABEL_60;
    }

LABEL_59:
    *p_bleScanRateScreenOff = 10;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Background"))
    {
LABEL_27:
      if (strcmp(v18, "Background")) {
        goto LABEL_28;
      }
      goto LABEL_61;
    }

  if (a4 - v5 <= 3) {
    id v19 = 0;
  }
  if (v19)
  {
    uint64_t v31 = *(_DWORD *)v5;
    if (*(_DWORD *)v5 == self->_homeKitV1SetupHash) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }

  uint64_t v31 = 0;
  if (self->_homeKitV1SetupHash)
  {
LABEL_65:
    self->_homeKitV1SetupHash = v31;
    v10 |= 0x400000uLL;
  }

LABEL_66:
    *p_bleScanRate = 40;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Medium"))
    {
LABEL_34:
      if (strcmp(string, "High")) {
        goto LABEL_35;
      }
      goto LABEL_68;
    }

  self->_discoveryFlags |= 0x400000uLL;
  self->_changeFlags |= v10;
}

LABEL_67:
    *p_bleScanRateScreenOff = 40;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "High"))
    {
LABEL_35:
      if (strcmp(v18, "High")) {
        goto LABEL_36;
      }
      goto LABEL_69;
    }

      -[CBDevice setDsActionFlags:](self, "setDsActionFlags:", v12);
      v15 |= v14;
      uint64_t v41 = -[CBDevice dsActionMeasuredPower](self, "dsActionMeasuredPower");
      uint64_t v28 = v49[4];
      if (*(_DWORD *)&v49[4] == v41)
      {
LABEL_30:
        if (*(_DWORD *)&v49[8] == -[CBDevice dsActionTieBreaker](self, "dsActionTieBreaker")) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }

LABEL_68:
    *p_bleScanRate = 50;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "High"))
    {
LABEL_36:
      if (strcmp(string, "Max")) {
        goto LABEL_79;
      }
LABEL_70:
      *p_bleScanRate = 60;
LABEL_78:
      v7 |= 0x80000000000uLL;
LABEL_79:
      if (strcmp(v18, "Max")) {
        goto LABEL_81;
      }
      goto LABEL_80;
    }

      -[CBDevice setDsActionMeasuredPower:](self, "setDsActionMeasuredPower:", v28);
      v15 |= v14;
      if (*(_DWORD *)&v49[8] != -[CBDevice dsActionTieBreaker](self, "dsActionTieBreaker"))
      {
LABEL_31:
        -[CBDevice setDsActionTieBreaker:](self, "setDsActionTieBreaker:");
        v15 |= v14;
      }

LABEL_69:
    *p_bleScanRateScreenOff = 50;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Max")) {
      goto LABEL_79;
    }
    goto LABEL_70;
  }

  if (v21)
  {
    if (strcmp(string, "Periodic")) {
      goto LABEL_49;
    }
  }

  else
  {
    *p_bleScanRate = 0;
    uint64_t v7 = 0x80000000000LL;
    if (strcmp(string, "Periodic"))
    {
LABEL_49:
      if (strcmp(string, "Background")) {
        goto LABEL_50;
      }
      goto LABEL_150;
    }
  }

  *p_bleScanRate = 10;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "Background"))
  {
LABEL_50:
    if (strcmp(string, "Low")) {
      goto LABEL_51;
    }
    goto LABEL_151;
  }

LABEL_151:
  *p_bleScanRate = 30;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "MediumLow"))
  {
LABEL_52:
    if (strcmp(string, "Medium")) {
      goto LABEL_53;
    }
    goto LABEL_153;
  }

LABEL_152:
  *p_bleScanRate = 35;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "Medium"))
  {
LABEL_53:
    if (strcmp(string, "High")) {
      goto LABEL_54;
    }
    goto LABEL_154;
  }

LABEL_153:
  *p_bleScanRate = 40;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "High"))
  {
LABEL_54:
    p_bleScanRateScreenOff = &self->_bleScanRate;
    if (strcmp(string, "Max")) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }

LABEL_154:
  *p_bleScanRate = 50;
  v7 |= 0x80000000000uLL;
  p_bleScanRateScreenOff = &self->_bleScanRate;
  if (!strcmp(string, "Max"))
  {
LABEL_80:
    *p_bleScanRateScreenOff = 60;
    v7 |= 0x80000000000uLL;
  }

LABEL_81:
  discoveryFlags = self->_discoveryFlags;
  v75 = 0LL;
  v76 = &v75;
  v77 = 0x2020000000LL;
  v78 = 0LL;
  xpc_dictionary_get_array(v5, "discoveryFlags");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = v23;
  uint64_t v25 = MEMORY[0x1895F87A8];
  if (v23)
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 3221225472LL;
    applier[2] = __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke;
    applier[3] = &unk_189FB49D0;
    applier[4] = self;
    applier[5] = &v75;
    xpc_array_apply(v23, applier);
  }

  uint64_t v26 = v76[3];
  if (v26 != discoveryFlags)
  {
    self->_discoveryFlags = v26;
    v7 |= 0x800000000uLL;
  }

  v68 = 0LL;
  v69 = &v68;
  v70 = 0x2810000000LL;
  v71 = &unk_187045357;
  v72 = 0;
  v73 = 0;
  xpc_dictionary_get_array(v5, "discoveryTypes");
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = v27;
  if (v27)
  {
    v67[0] = v25;
    v67[1] = 3221225472LL;
    v67[2] = __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke_2;
    v67[3] = &unk_189FB4618;
    v67[4] = &v68;
    xpc_array_apply(v27, v67);
  }

  if (*((_DWORD *)v69 + 8) != *(_DWORD *)self->_discoveryTypesInternal.bitArray
    || *((unsigned __int8 *)v69 + 36) != self->_discoveryTypesInternal.bitArray[4])
  {
    uint64_t v30 = *((_DWORD *)v69 + 8);
    self->_discoveryTypesInternal.bitArray[4] = *((_BYTE *)v69 + 36);
    *(_DWORD *)self->_discoveryTypesInternal.bitArray = v30;
    v7 |= 0x800000000uLL;
  }

  uint64_t v31 = xpc_dictionary_get_BOOL(v5, "keepAlive");
  if (self->_keepAlive != v31)
  {
    self->_keepAlive = v31;
    v7 |= 0x80000000000uLL;
  }

  uint64_t v32 = xpc_dictionary_get_string(v5, "memoryPressure");
  if (v32) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = "";
  }
  if (!strcmp(v33, "warn"))
  {
    uint64_t v34 = 2;
    if (self->_memoryPressureFlags != 2)
    {
LABEL_102:
      self->_memoryPressureFlags = v34;
      v7 |= 0x80000000000uLL;
    }
  }

  else
  {
    if (!strcmp(v33, "critical")) {
      uint64_t v34 = 6;
    }
    else {
      uint64_t v34 = 0;
    }
    if (v34 != self->_memoryPressureFlags) {
      goto LABEL_102;
    }
  }

  objc_opt_class();
  CUXPCDecodeNSArrayOfClass();
  oobKeys = self->_oobKeys;
  uint64_t v36 = (NSArray *)0LL;
  uint64_t v37 = oobKeys;
  if (v36 == v37)
  {

    goto LABEL_112;
  }

  uint64_t v38 = v37;
  if ((v36 == 0LL) == (v37 != 0LL))
  {

    goto LABEL_111;
  }

  uint64_t v39 = -[NSArray isEqual:](v36, "isEqual:", v37);

  if ((v39 & 1) == 0)
  {
LABEL_111:
    uint64_t v40 = (NSArray *)[0 copy];
    uint64_t v41 = self->_oobKeys;
    self->_oobKeys = v40;

    v7 |= 0x80000000000uLL;
  }

LABEL_119:
  v49 = xpc_dictionary_get_int64(v5, "bleSensorRssiIncreaseScanThreshold");
  v50 = 127LL;
  if (v49 < 127) {
    v50 = v49;
  }
  if (v50 <= -128) {
    v50 = -128LL;
  }
  if (v50 != self->_bleSensorRssiIncreaseScanThreshold)
  {
    self->_bleSensorRssiIncreaseScanThreshold = v50;
    v7 |= 0x80000000000uLL;
  }

  __int128 v51 = xpc_dictionary_get_int64(v5, "bleSensorEnableRssiIncreaseScan");
  if (v51 != self->_bleSensorEnableRssiIncreaseScan)
  {
    self->_bleSensorEnableRssiIncreaseScan = v51 != 0LL;
    v7 |= 0x80000000000uLL;
  }

  uint64_t v52 = xpc_dictionary_get_int64(v5, "bleSensorIncreaseScanRate");
  if (v52 != self->_bleSensorIncreaseScanRate)
  {
    self->_bleSensorIncreaseScanRate = v52;
    v7 |= 0x80000000000uLL;
  }

  v53 = xpc_dictionary_get_int64(v5, "bleSensorIncreaseScanTimeout");
  if (v53 != self->_bleSensorIncreaseScanTimeout)
  {
    self->_bleSensorIncreaseScanTimeout = v53;
    v7 |= 0x80000000000uLL;
  }

  v54 = xpc_dictionary_get_int64(v5, "bleSensorTimeoutBetweenIncreaseScan");
  if (v54 != self->_bleSensorTimeoutBetweenIncreaseScan)
  {
    self->_bleSensorTimeoutBetweenIncreaseScan = v54;
    v7 |= 0x80000000000uLL;
  }

  v55 = xpc_dictionary_get_BOOL(v5, "denyLowPowerModeScans");
  if (self->_denyLowPowerModeScans != v55)
  {
    self->_denyLowPowerModeScans = v55;
    v7 |= 0x80000000000uLL;
  }

  v56 = xpc_dictionary_get_BOOL(v5, "denyScreenLockedScans");
  if (self->_denyScreenLockedScans != v56)
  {
    self->_denyScreenLockedScans = v56;
    v7 |= 0x80000000000uLL;
  }

  v57 = xpc_dictionary_get_uint64(v5, "deviceSetupState");
  if (v57 != self->_deviceSetupState)
  {
    self->_deviceSetupState = v57;
    v7 |= 0x80000000000uLL;
  }

  v66 = 0LL;
  objc_opt_class();
  CUXPCDecodeNSArrayOfClass();
  typeToRssiThresholds = self->_typeToRssiThresholds;
  v59 = (NSArray *)0LL;
  v60 = typeToRssiThresholds;
  if (v59 == v60)
  {
  }

  else
  {
    v61 = v60;
    if ((v59 == 0LL) != (v60 != 0LL))
    {
      v62 = -[NSArray isEqual:](v59, "isEqual:", v60);

      if ((v62 & 1) != 0) {
        goto LABEL_146;
      }
    }

    else
    {
    }

    v63 = (NSArray *)objc_msgSend(0, "copy", 0);
    v64 = self->_typeToRssiThresholds;
    self->_typeToRssiThresholds = v63;

    v7 |= 0x80000000000uLL;
  }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WxStatus");
      if ((discoveryFlags & 0x10000) == 0)
      {
LABEL_50:
        if ((discoveryFlags & 0x200000) == 0) {
          goto LABEL_51;
        }
        goto LABEL_121;
      }

LABEL_146:
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v75, 8);

LABEL_147:
  return v7;
}

  v88 = [v4 conversationDetectConfig];
  if ((_DWORD)v88)
  {
    v89 = v88;
    if ((_DWORD)v88 != -[CBDevice conversationDetectConfig](self, "conversationDetectConfig"))
    {
      -[CBDevice setConversationDetectConfig:](self, "setConversationDetectConfig:", v89);
      v12 |= 0x80000000000uLL;
    }
  }

  v90 = [v4 crownRotationDirection];
  if ((_DWORD)v90)
  {
    v91 = v90;
    if ((_DWORD)v90 != -[CBDevice crownRotationDirection](self, "crownRotationDirection"))
    {
      -[CBDevice setCrownRotationDirection:](self, "setCrownRotationDirection:", v91);
      v12 |= 0x80000000000uLL;
    }
  }

  if (v19)
  {
    deviceFlags = self->_deviceFlags;
    v93 = [v4 deviceFlags] & 0x780FFFFF07FLL | deviceFlags & 0xFFFFF87F00000F80;
    if (v93 != deviceFlags)
    {
      self->_deviceFlags = v93;
      v12 |= 0x80000000000uLL;
    }
  }

  if ((v5 & 2) == 0) {
    goto LABEL_162;
  }
  if (([v4 deviceFlags] & 0x40000000000) != 0)
  {
    self->_deviceFlags |= 0x40000000000uLL;
    if (([v4 deviceFlags] & 0x80) == 0)
    {
LABEL_161:
      v12 |= 0x80000000000uLL;
      goto LABEL_162;
    }

void sub_186FF030C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_99:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "AppSignIn");
      if ((discoveryFlags & 0x20000000) == 0)
      {
LABEL_30:
        if ((discoveryFlags & 0x10000000000000LL) == 0) {
          goto LABEL_31;
        }
        goto LABEL_101;
      }

  self->_discoveryFlags |= 0x80000000000000uLL;
  self->_changeFlags |= v9;
}

LABEL_100:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "BLEPresent");
      if ((discoveryFlags & 0x10000000000000LL) == 0)
      {
LABEL_31:
        if ((discoveryFlags & 0x10000000) == 0) {
          goto LABEL_32;
        }
        goto LABEL_102;
      }

LABEL_101:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "CNJ");
      if ((discoveryFlags & 0x10000000) == 0)
      {
LABEL_32:
        if ((discoveryFlags & 8) == 0) {
          goto LABEL_33;
        }
        goto LABEL_103;
      }

LABEL_102:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "CompanionAuthentication");
      if ((discoveryFlags & 8) == 0)
      {
LABEL_33:
        if ((discoveryFlags & 0x10) == 0) {
          goto LABEL_34;
        }
        goto LABEL_104;
      }

  [v4 caseVersion];
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v338 = v62;
  if ([v62 length])
  {
    caseVersion = self->_caseVersion;
    v64 = v62;
    v65 = caseVersion;
    if (v64 == v65)
    {
    }

    else
    {
      v66 = v65;
      if ((v64 == 0LL) == (v65 != 0LL))
      {

        goto LABEL_131;
      }

      v67 = -[NSString isEqual:](v64, "isEqual:", v65);

      if ((v67 & 1) == 0)
      {
LABEL_131:
        objc_storeStrong((id *)&self->_caseVersion, v338);
        v12 |= 0x80000000000uLL;
        v68 = [v4 classicRSSI];
        if (!v68) {
          goto LABEL_110;
        }
        goto LABEL_109;
      }
    }
  }

  v68 = [v4 classicRSSI];
  if (v68)
  {
LABEL_109:
    self->_classicRSSI = v68;
    v12 |= 0x200000000uLL;
  }

LABEL_108:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "OSR");
      if ((discoveryFlags & 0x100) == 0)
      {
LABEL_39:
        if ((discoveryFlags & 0x200000000000LL) == 0) {
          goto LABEL_40;
        }
        goto LABEL_110;
      }

LABEL_114:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "TVLatencySetup");
      if ((discoveryFlags & 0x20000000000000LL) == 0)
      {
LABEL_45:
        if ((discoveryFlags & 0x1000) == 0) {
          goto LABEL_46;
        }
        goto LABEL_116;
      }

LABEL_115:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WatchSetup");
      if ((discoveryFlags & 0x1000) == 0)
      {
LABEL_46:
        if ((discoveryFlags & 0x2000) == 0) {
          goto LABEL_47;
        }
        goto LABEL_117;
      }

LABEL_116:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WHASetup");
      if ((discoveryFlags & 0x2000) == 0)
      {
LABEL_47:
        if ((discoveryFlags & 0x4000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_118;
      }

LABEL_117:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WiFiPassword");
      if ((discoveryFlags & 0x4000) == 0)
      {
LABEL_48:
        if ((discoveryFlags & 0x8000) == 0) {
          goto LABEL_49;
        }
        goto LABEL_119;
      }

LABEL_118:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WxSetup");
      if ((discoveryFlags & 0x8000) == 0)
      {
LABEL_49:
        if ((discoveryFlags & 0x10000) == 0) {
          goto LABEL_50;
        }
        goto LABEL_120;
      }

LABEL_120:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ObjectSetup");
      if ((discoveryFlags & 0x200000) == 0)
      {
LABEL_51:
        if ((discoveryFlags & 0x800000) == 0) {
          goto LABEL_52;
        }
        goto LABEL_122;
      }

LABEL_121:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "Connections");
      if ((discoveryFlags & 0x800000) == 0)
      {
LABEL_52:
        if ((discoveryFlags & 0x2000000) == 0) {
          goto LABEL_54;
        }
        goto LABEL_53;
      }

LABEL_122:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "Pairing");
      if ((discoveryFlags & 0x2000000) != 0) {
LABEL_53:
      }
        xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ScreenOff");
LABEL_54:
      xpc_dictionary_set_value(v4, "discoveryFlags", v10);

LABEL_55:
      id v11 = "AirDrop";
      if ("AirDrop")
      {
        uint64_t v12 = 0LL;
        uint64_t v13 = &off_189FB3A20;
        do
        {
          uint64_t v15 = *((_DWORD *)v13 - 4);
          if ((v15 - 34) >= 0xFFFFFFDF
            && ((self->_discoveryTypesInternal.bitArray[(unint64_t)(v15 - 1) >> 3] >> (-(char)v15 & 7)) & 1) != 0)
          {
            if (!v12) {
              uint64_t v12 = xpc_array_create(0LL, 0LL);
            }
            xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, v11);
          }

          uint64_t v14 = *v13;
          v13 += 3;
          id v11 = v14;
        }

        while (v14);
        if (v12) {
          xpc_dictionary_set_value(v4, "discoveryTypes", v12);
        }
        if (self->_keepAlive) {
          goto LABEL_66;
        }
      }

      else
      {
        uint64_t v12 = 0LL;
        if (self->_keepAlive) {
LABEL_66:
        }
          xpc_dictionary_set_BOOL(v4, "keepAlive", 1);
      }

      memoryPressureFlags = self->_memoryPressureFlags;
      if ((memoryPressureFlags & 6) != 0)
      {
        if ((memoryPressureFlags & 4) != 0) {
          uint64_t v17 = "critical";
        }
        else {
          uint64_t v17 = "warn";
        }
        xpc_dictionary_set_string(v4, "memoryPressure", v17);
      }

      uint64_t v18 = self->_oobKeys;
      if (v18) {
        CUXPCEncodeNSArrayOfObjects();
      }

      id v19 = self->_serviceUUIDs;
      if (v19) {
        CUXPCEncodeNSArrayOfObjects();
      }

      if (self->_bleSensorRssiIncreaseScanThreshold) {
        xpc_dictionary_set_int64(v4, "bleSensorRssiIncreaseScanThreshold", self->_bleSensorRssiIncreaseScanThreshold);
      }
      if (self->_bleSensorEnableRssiIncreaseScan) {
        xpc_dictionary_set_int64(v4, "bleSensorEnableRssiIncreaseScan", 1LL);
      }
      bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
      if ((_DWORD)bleSensorIncreaseScanRate) {
        xpc_dictionary_set_int64(v4, "bleSensorIncreaseScanRate", bleSensorIncreaseScanRate);
      }
      bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
      if ((_DWORD)bleSensorIncreaseScanTimeout) {
        xpc_dictionary_set_int64(v4, "bleSensorIncreaseScanTimeout", bleSensorIncreaseScanTimeout);
      }
      bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
      if ((_DWORD)bleSensorTimeoutBetweenIncreaseScan) {
        xpc_dictionary_set_int64(v4, "bleSensorTimeoutBetweenIncreaseScan", bleSensorTimeoutBetweenIncreaseScan);
      }
      if (self->_denyLowPowerModeScans) {
        xpc_dictionary_set_BOOL(v4, "denyLowPowerModeScans", 1);
      }
      if (self->_denyScreenLockedScans) {
        xpc_dictionary_set_BOOL(v4, "denyScreenLockedScans", 1);
      }
      if (self->_deviceSetupState) {
        xpc_dictionary_set_uint64(v4, "deviceSetupState", self->_deviceSetupState);
      }
      v23 = self->_typeToRssiThresholds;
      if (v23) {
        CUXPCEncodeNSArrayOfObjects();
      }

      uint64_t v24 = v4;
      return (OS_xpc_object *)v24;
  }

void sub_186FF1944( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_186FF195C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_186FF1F24(_Unwind_Exception *a1)
{
}

void sub_186FF2310(_Unwind_Exception *a1)
{
}

void sub_186FF2420(_Unwind_Exception *a1)
{
}

void sub_186FF29C0(_Unwind_Exception *a1)
{
}

void sub_186FF2DC8(_Unwind_Exception *a1)
{
}

void sub_186FF2DDC(_Unwind_Exception *a1)
{
}

void sub_186FF30E8(_Unwind_Exception *a1)
{
}

void sub_186FF38E8(_Unwind_Exception *a1)
{
}

void sub_186FF3B24(_Unwind_Exception *a1)
{
}

void sub_186FF4234( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_186FF62B0(_Unwind_Exception *a1)
{
}

void sub_186FF62C4(_Unwind_Exception *a1)
{
}

void sub_186FF62D8(_Unwind_Exception *a1)
{
}

void sub_186FF62F0(_Unwind_Exception *a1)
{
}

LABEL_91:
  if (v20) {
    uint64_t v26 = v20;
  }
  else {
    uint64_t v26 = (void *)MEMORY[0x189604A60];
  }
  -[CBManager sendMsg:args:](v21, "sendMsg:args:", 32LL, v26);
LABEL_95:
}

void sub_186FF7698( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF76AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF76C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF76D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF76E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF76FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF7710( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF7724( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF7738( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF774C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF7760( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF7774( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF7788( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF779C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF77B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF77C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF77D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF77EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF7804( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_186FF7C54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_186FF7C68( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_186FF7C7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_186FF7C90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_186FF7CA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_186FF7CB8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_186FF7CCC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_186FF7CE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_186FF7CF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_186FF7D08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_186FF7D20( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_186FF7E08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_186FF91F8(_Unwind_Exception *a1)
{
}

void sub_186FF920C(_Unwind_Exception *a1)
{
}

void sub_186FF9220(_Unwind_Exception *a1)
{
}

void sub_186FF9234(_Unwind_Exception *a1)
{
}

void sub_186FF924C(_Unwind_Exception *a1)
{
}

void sub_186FF9444(_Unwind_Exception *a1)
{
}

void sub_186FF97CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_186FF97E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_186FF97F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_186FF9808( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_186FF981C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_186FF9830( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_186FF9844( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_186FF9858( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_186FF9870( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_186FF997C(_Unwind_Exception *a1)
{
}

void sub_186FF9CE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_186FF9CF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_186FF9D08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_186FF9D1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_186FF9D30( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_186FF9D44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_186FF9D58( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_186FF9D6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_186FF9D80( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_186FF9D94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_186FF9DAC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_186FF9DC0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void OUTLINED_FUNCTION_0_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_1_4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

_BYTE *OUTLINED_FUNCTION_2_1(_BYTE *result, _BYTE *a2)
{
  const char *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_6_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

LABEL_137:
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1896075E0]];
    [MEMORY[0x189607870] errorWithDomain:v5 code:v10 userInfo:v6];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v8 = @"One or more parameters were invalid.";
    uint64_t v10 = 1LL;
    switch(v7)
    {
      case 0LL:
        break;
      case 1LL:
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        }
        uint64_t v37 = (os_log_s *)CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
          +[NSError(CoreBluetooth) errorWithInfo:].cold.2(v37);
        }
        goto LABEL_136;
      case 3LL:
        goto LABEL_137;
      case 4LL:
        uint64_t v8 = @"There is not enough space to complete the operation.";
        uint64_t v10 = 4LL;
        goto LABEL_137;
      case 6LL:
        uint64_t v8 = @"The operation was cancelled.";
        uint64_t v10 = 5LL;
        goto LABEL_137;
      case 7LL:
        uint64_t v8 = @"The specified handle was not valid.";
        uint64_t v10 = 2LL;
        goto LABEL_137;
      case 8LL:
        uint64_t v8 = @"Device is invalid.";
        uint64_t v10 = 12LL;
        goto LABEL_137;
      case 11LL:
        uint64_t v8 = @"Operation is not supported.";
        uint64_t v10 = 13LL;
        goto LABEL_137;
      case 12LL:
        uint64_t v31 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Invalid state";
        goto LABEL_57;
      case 17LL:
      case 162LL:
        uint64_t v11 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Operation is not allowed";
        goto LABEL_37;
      case 20LL:
        uint64_t v38 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Client Initiated operation";
        uint64_t v10 = 35LL;
        uint64_t v5 = v38;
        goto LABEL_137;
      case 21LL:
        uint64_t v39 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Invalid IRK";
        uint64_t v10 = 40LL;
        uint64_t v5 = v39;
        goto LABEL_137;
      case 116LL:
        uint64_t v28 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Local address is being refreshed.";
        goto LABEL_61;
      case 117LL:
        uint64_t v29 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Peer device LE GATT Disabled.";
        goto LABEL_63;
      case 122LL:
        uint64_t v8 = @"Advertising has already started.";
        uint64_t v10 = 9LL;
        goto LABEL_137;
      case 123LL:
        uint64_t v10 = 0LL;
        uint64_t v8 = @"Advertising is not started.";
        goto LABEL_137;
      case 156LL:
        uint64_t v30 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Pairing failed as the Pincode was incorrect.";
        goto LABEL_68;
      case 158LL:
        uint64_t v30 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Pairing failed as the Pincode or Link Key was incorrect.";
        goto LABEL_68;
      case 161LL:
        uint64_t v36 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Pairing was cancelled.";
        goto LABEL_70;
      case 166LL:
        uint64_t v35 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Pairing Failed due to too many attempts";
        goto LABEL_72;
      case 167LL:
        uint64_t v40 = @"CBInternalErrorDomain";

        uint64_t v10 = 0LL;
        uint64_t v8 = @"Pairing failed as the passcode was incorrect.";
        uint64_t v5 = v40;
        goto LABEL_137;
      case 168LL:
        uint64_t v21 = @"CBInternalErrorDomain";

        [v3 objectForKeyedSubscript:@"kCBMsgArgDeviceOriginalUUID"];
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v41 forKeyedSubscript:@"CBOriginalPeerIdentifierErrorKey"];

        uint64_t v8 = @"Pairing failed as this device is already paired.";
        goto LABEL_75;
      case 170LL:
        v22 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Pairing failed as confirm value failed.";
        goto LABEL_77;
      case 171LL:
        v23 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Pairing failed as the security timeout elapsed";
        goto LABEL_79;
      case 172LL:
        uint64_t v24 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Pairing failed as there was no response from user to pairing request";
        goto LABEL_81;
      case 173LL:
        uint64_t v25 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Pairing failed as DHKEY Check failed";
        goto LABEL_83;
      case 174LL:
        uint64_t v26 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Pairing failed as numeric comparison failed failed";
        goto LABEL_85;
      case 176LL:
        uint64_t v27 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Pairing failed as numeric comparison failed failed";
        goto LABEL_87;
      case 179LL:
        uint64_t v8 = @"Peer removed pairing information";
        uint64_t v10 = 14LL;
        goto LABEL_137;
      case 180LL:
        uint64_t v8 = @"Too many LE devices are paired to this device";
        uint64_t v10 = 16LL;
        goto LABEL_137;
      case 182LL:
        uint64_t v42 = @"CBInternalErrorDomain";

        uint64_t v8 = @"MIC failure";
        uint64_t v10 = 31LL;
        uint64_t v5 = v42;
        goto LABEL_137;
      case 202LL:
        uint64_t v43 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Local device is powered off.";
        uint64_t v10 = 32LL;
        uint64_t v5 = v43;
        goto LABEL_137;
      case 305LL:
        uint64_t v8 = @"The connection has failed unexpectedly.";
        uint64_t v10 = 10LL;
        goto LABEL_137;
      case 307LL:
        uint64_t v8 = @"The connection has timed out unexpectedly.";
        uint64_t v10 = 6LL;
        goto LABEL_137;
      case 309LL:
        uint64_t v8 = @"The system has reached the maximum number of connections";
        uint64_t v10 = 11LL;
        goto LABEL_137;
      case 312LL:
        uint64_t v8 = @"The specified device is not connected.";
        uint64_t v10 = 3LL;
        goto LABEL_137;
      case 313LL:
        uint64_t v8 = @"The specified device has disconnected from us.";
        uint64_t v10 = 7LL;
        goto LABEL_137;
      case 315LL:
        uint64_t v8 = @"Failed to encrypt the connection, the connection has timed out unexpectedly.";
        uint64_t v10 = 15LL;
        goto LABEL_137;
      case 329LL:
        uint64_t v8 = @"Page timeout";
        uint64_t v10 = 10LL;
        goto LABEL_137;
      case 336LL:
        uint64_t v33 = @"CBInternalErrorDomain";

        [v3 objectForKeyedSubscript:@"kCBMsgArgNumberOfConnectedDevicesForUseCase"];
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v44 forKeyedSubscript:@"CBNumberOfConnectionsForUseCase"];

        [v3 objectForKeyedSubscript:@"kCBMsgArgUseCase"];
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v45 forKeyedSubscript:@"CBConnectionUseCase"];

        uint64_t v8 = @"The system has reached the maximum number of connections for this use case";
        goto LABEL_100;
      case 341LL:
        uint64_t v46 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Unknown or not an allowed internal client to use BLE";
        uint64_t v10 = 34LL;
        uint64_t v5 = v46;
        goto LABEL_137;
      case 342LL:
        v47 = @"CBInternalErrorDomain";

        uint64_t v8 = @"LE Scan timed out or total time achieved";
        uint64_t v10 = 36LL;
        uint64_t v5 = v47;
        goto LABEL_137;
      case 343LL:
        __int128 v48 = @"CBInternalErrorDomain";

        uint64_t v8 = @"LE Connection disallowed due to Deny or Allow List";
        uint64_t v10 = 39LL;
        uint64_t v5 = v48;
        goto LABEL_137;
      case 344LL:
        v49 = @"CBInternalErrorDomain";

        uint64_t v8 = @"LE Connection Scan timed out or total time achieved";
        uint64_t v10 = 42LL;
        uint64_t v5 = v49;
        goto LABEL_137;
      case 345LL:
        v50 = @"CBInternalErrorDomain";

        uint64_t v8 = @"The system has reached the maximum number of connections for this client";
        uint64_t v10 = 47LL;
        uint64_t v5 = v50;
        goto LABEL_137;
      case 346LL:
        __int128 v51 = @"CBInternalErrorDomain";

        uint64_t v8 = @"LE Connection Requested without Client BundleID when it is required";
        uint64_t v10 = 43LL;
        uint64_t v5 = v51;
        goto LABEL_137;
      case 347LL:
        uint64_t v52 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Reached maximum allowed for the number of both direct and indirect connections for a client bundleID";
        uint64_t v10 = 44LL;
        uint64_t v5 = v52;
        goto LABEL_137;
      case 348LL:
        v53 = @"CBInternalErrorDomain";

        uint64_t v8 = @"Use case is not provided when it is required";
        uint64_t v10 = 50LL;
        uint64_t v5 = v53;
        goto LABEL_137;
      default:
        goto LABEL_129;
    }
  }

  return v9;
}

LABEL_339:
    v123 = 0LL;
    goto LABEL_323;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v126 = "Bad DeviceInfo NS type";
      v127 = -6756;
      goto LABEL_338;
    }

    goto LABEL_339;
  }

  v47 = [v46 mutableCopy];
  deviceInfo = v7->_deviceInfo;
  v7->_deviceInfo = (NSMutableDictionary *)v47;

LABEL_65:
  v130 = 0LL;
  v49 = CUXPCDecodeUInt64RangedEx();
  if (v49 == 6)
  {
    v7->_deviceType = v130;
  }

  else if (v49 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v50 = CUXPCDecodeUInt64RangedEx();
  if (v50 == 6)
  {
    v7->_discoveryFlags = v130;
  }

  else if (v50 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  __int128 v51 = CUXPCDecodeSInt64RangedEx();
  if (v51 == 6)
  {
    v7->_doubleTapActionLeft = v130;
  }

  else if (v51 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  uint64_t v52 = CUXPCDecodeSInt64RangedEx();
  if (v52 == 6)
  {
    v7->_doubleTapActionRight = v130;
  }

  else if (v52 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v53 = CUXPCDecodeSInt64RangedEx();
  if (v53 == 6)
  {
    v7->_doubleTapCapability = v130;
  }

  else if (v53 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v54 = CUXPCDecodeUInt64RangedEx();
  if (v54 == 6)
  {
    v7->_endCallCapability = v130;
  }

  else if (v54 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v55 = CUXPCDecodeUInt64RangedEx();
  if (v55 == 6)
  {
    v7->_interval = v130;
  }

  else if (v55 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v56 = CUXPCDecodeSInt64RangedEx();
  if (v56 == 6)
  {
    v7->_microphoneMode = v130;
  }

  else if (v56 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v57 = CUXPCDecodeUInt64RangedEx();
  if (v57 == 6)
  {
    v7->_muteControlCapability = v130;
  }

  else if (v57 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v58 = CUXPCDecodeSInt64RangedEx();
  if (v58 == 6)
  {
    v7->_primaryPlacement = v130;
  }

  else if (v58 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v59 = CUXPCDecodeSInt64RangedEx();
  if (v59 == 6)
  {
    v7->_secondaryPlacement = v130;
  }

  else if (v59 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v60 = CUXPCDecodeSInt64RangedEx();
  if (v60 == 6)
  {
    v7->_placementMode = v130;
  }

  else if (v60 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v61 = CUXPCDecodeUInt64RangedEx();
  if (v61 == 6)
  {
    v7->_productID = v130;
  }

  else if (v61 == 5)
  {
    goto LABEL_333;
  }

  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString())
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v62 = CUXPCDecodeSInt64RangedEx();
  if (v62 == 6)
  {
    v7->_smartRoutingMode = v130;
  }

  else if (v62 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v63 = CUXPCDecodeUInt64RangedEx();
  if (v63 == 6)
  {
    v7->_supportedServices = v130;
  }

  else if (v63 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v64 = CUXPCDecodeUInt64RangedEx();
  if (v64 == 6)
  {
    v7->_vendorID = v130;
  }

  else if (v64 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v65 = CUXPCDecodeUInt64RangedEx();
  if (v65 == 6)
  {
    v7->_vendorIDSource = v130;
  }

  else if (v65 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v66 = CUXPCDecodeUInt64RangedEx();
  if (v66 == 6)
  {
    v7->_airdropFlags = v130;
  }

  else if (v66 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v67 = CUXPCDecodeUInt64RangedEx();
  if (v67 == 6)
  {
    v7->_airdropModel = v130;
  }

  else if (v67 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v68 = CUXPCDecodeUInt64RangedEx();
  if (v68 == 6)
  {
    v7->_airdropVersion = v130;
  }

  else if (v68 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v69 = CUXPCDecodeUInt64RangedEx();
  if (v69 == 6)
  {
    v7->_airdropHash1 = v130;
  }

  else if (v69 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v70 = CUXPCDecodeUInt64RangedEx();
  if (v70 == 6)
  {
    v7->_airdropHash2 = v130;
  }

  else if (v70 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v71 = CUXPCDecodeUInt64RangedEx();
  if (v71 == 6)
  {
    v7->_airdropHash3 = v130;
  }

  else if (v71 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v72 = CUXPCDecodeUInt64RangedEx();
  if (v72 == 6)
  {
    v7->_airdropHash4 = v130;
  }

  else if (v72 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v73 = CUXPCDecodeUInt64RangedEx();
  if (v73 == 6)
  {
    v7->_airdropConfigData = v130;
  }

  else if (v73 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v74 = CUXPCDecodeUInt64RangedEx();
  if (v74 == 6)
  {
    v7->_airplaySourceFlags = v130;
  }

  else if (v74 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v75 = CUXPCDecodeUInt64RangedEx();
  if (v75 == 6)
  {
    v7->_airplayTargetConfigSeed = v130;
  }

  else if (v75 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v76 = CUXPCDecodeUInt64RangedEx();
  if (v76 == 6)
  {
    v7->_airplayTargetFlags = v130;
  }

  else if (v76 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v77 = CUXPCDecodeUInt64RangedEx();
  if (v77 == 6)
  {
    v7->_airplayTargetIPuint64_t v4 = v130;
  }

  else if (v77 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v78 = CUXPCDecodeUInt64RangedEx();
  if (v78 == 6)
  {
    v7->_homeKitV1Category = v130;
  }

  else if (v78 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v79 = CUXPCDecodeUInt64RangedEx();
  if (v79 == 6)
  {
    v7->_homeKitV1CompatibleVersion = v130;
  }

  else if (v79 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v80 = CUXPCDecodeUInt64RangedEx();
  if (v80 == 6)
  {
    v7->_homeKitV1ConfigurationNumber = v130;
  }

  else if (v80 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v81 = CUXPCDecodeUInt64RangedEx();
  if (v81 == 6)
  {
    v7->_homeKitV1Flags = v130;
  }

  else if (v81 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v82 = CUXPCDecodeUInt64RangedEx();
  if (v82 == 6)
  {
    v7->_homeKitV1StateNumber = v130;
  }

  else if (v82 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v83 = CUXPCDecodeUInt64RangedEx();
  if (v83 == 6)
  {
    v7->_homeKitV1SetupHash = v130;
  }

  else if (v83 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v84 = CUXPCDecodeUInt64RangedEx();
  if (v84 == 6)
  {
    v7->_homeKitV2InstanceID = v130;
  }

  else if (v84 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v85 = CUXPCDecodeUInt64RangedEx();
  if (v85 == 6)
  {
    v7->_homeKitV2StateNumber = v130;
  }

  else if (v85 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v86 = CUXPCDecodeUInt64RangedEx();
  if (v86 == 6)
  {
    v7->_homeKitV2Value = v130;
  }

  else if (v86 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v87 = CUXPCDecodeUInt64RangedEx();
  if (v87 == 6)
  {
    v7->_nearbyActionFlags = v130;
  }

  else if (v87 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v88 = CUXPCDecodeUInt64RangedEx();
  if (v88 == 6)
  {
    v7->_nearbyActionType = v130;
  }

  else if (v88 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v89 = CUXPCDecodeUInt64RangedEx();
  if (v89 == 6)
  {
    v7->_nearbyInfoFlags = v130;
  }

  else if (v89 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v90 = CUXPCDecodeUInt64RangedEx();
  if (v90 == 6)
  {
    v7->_nearbyInfoV2DecryptedFlags = v130;
  }

  else if (v90 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v91 = CUXPCDecodeUInt64RangedEx();
  if (v91 == 6)
  {
    v7->_nearbyInfoV2Flags = v130;
  }

  else if (v91 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v92 = CUXPCDecodeUInt64RangedEx();
  if (v92 == 6)
  {
    v7->_nearbyInfoV2InvitationCounter = v130;
  }

  else if (v92 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v93 = CUXPCDecodeUInt64RangedEx();
  if (v93 == 6)
  {
    v7->_nearbyInfoV2InvitationTypes = v130;
  }

  else if (v93 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v94 = CUXPCDecodeUInt64RangedEx();
  if (v94 == 6)
  {
    v7->_nearbyInfoV2InvitationRouteType = v130;
  }

  else if (v94 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v95 = CUXPCDecodeUInt64RangedEx();
  if (v95 == 6)
  {
    v7->_objectDiscoveryBatteryState = v130;
  }

  else if (v95 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v96 = CUXPCDecodeUInt64RangedEx();
  if (v96 == 6)
  {
    v7->_objectDiscoveryMode = v130;
  }

  else if (v96 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v97 = CUXPCDecodeUInt64RangedEx();
  if (v97 == 6)
  {
    v7->_objectDiscoveryProductID = v130;
  }

  else if (v97 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v98 = CUXPCDecodeUInt64RangedEx();
  if (v98 == 6)
  {
    v7->_proximityPairingProductID = v130;
  }

  else if (v98 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v99 = CUXPCDecodeUInt64RangedEx();
  if (v99 == 6)
  {
    v7->_proximityPairingSubType = v130;
  }

  else if (v99 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v100 = CUXPCDecodeUInt64RangedEx();
  if (v100 == 6)
  {
    v7->_peerStatusFlag = v130;
  }

  else if (v100 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v101 = CUXPCDecodeUInt64RangedEx();
  if (v101 == 6)
  {
    v7->_transmitPowerOne = v130;
  }

  else if (v101 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v102 = CUXPCDecodeUInt64RangedEx();
  if (v102 == 6)
  {
    v7->_transmitPowerTwo = v130;
  }

  else if (v102 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v103 = CUXPCDecodeUInt64RangedEx();
  if (v103 == 6)
  {
    v7->_transmitPowerThree = v130;
  }

  else if (v103 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v104 = CUXPCDecodeUInt64RangedEx();
  if (v104 == 6)
  {
    v7->_proximityServiceCategory = v130;
  }

  else if (v104 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v105 = CUXPCDecodeUInt64RangedEx();
  if (v105 == 6)
  {
    v7->_proximityServiceFlags = v130;
  }

  else if (v105 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v106 = CUXPCDecodeSInt64RangedEx();
  if (v106 == 6)
  {
    v7->_proximityServiceMeasuredPower = v130;
  }

  else if (v106 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v107 = CUXPCDecodeUInt64RangedEx();
  if (v107 == 6)
  {
    v7->_proximityServiceProductID = v130;
  }

  else if (v107 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v108 = CUXPCDecodeUInt64RangedEx();
  if (v108 == 6)
  {
    v7->_proximityServicePSM = v130;
  }

  else if (v108 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v109 = CUXPCDecodeUInt64RangedEx();
  if (v109 == 6)
  {
    v7->_proximityServiceSubType = v130;
  }

  else if (v109 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v110 = CUXPCDecodeUInt64RangedEx();
  if (v110 == 6)
  {
    v7->_proximityServiceVendorID = v130;
  }

  else if (v110 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v111 = CUXPCDecodeUInt64RangedEx();
  if (v111 == 6)
  {
    v7->_proximityServiceVersion = v130;
  }

  else if (v111 == 5)
  {
    goto LABEL_333;
  }

  if (!CUXPCDecodeNSData()
    || !CUXPCDecodeNSDataOfLength()
    || !CUXPCDecodeNSDataOfLength())
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v112 = CUXPCDecodeUInt64RangedEx();
  if (v112 == 6)
  {
    v7->_safetyAlertsVersion = v130;
  }

  else if (v112 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v113 = CUXPCDecodeUInt64RangedEx();
  if (v113 == 6)
  {
    v7->_selectiveSpeechListeningCapability = v130;
  }

  else if (v113 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v114 = CUXPCDecodeSInt64RangedEx();
  if (v114 == 6)
  {
    v7->_hearingAidSupport = v130;
  }

  else if (v114 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v115 = CUXPCDecodeSInt64RangedEx();
  if (v115 == 6)
  {
    v7->_hearingTestSupport = v130;
  }

  else if (v115 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v116 = CUXPCDecodeUInt64RangedEx();
  if (v116 == 6)
  {
    v7->_spatialInteractionConfigFlags = v130;
  }

  else if (v116 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v117 = CUXPCDecodeUInt64RangedEx();
  if (v117 == 6)
  {
    v7->_spatialInteractionFlags = v130;
  }

  else if (v117 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v118 = CUXPCDecodeUInt64RangedEx();
  if (v118 == 6)
  {
    v7->_spatialInteractionPeerID = v130;
  }

  else if (v118 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v119 = CUXPCDecodeUInt64RangedEx();
  if (v119 == 6)
  {
    v7->_tipiConnectionStatus = v130;
  }

  else if (v119 == 5)
  {
    goto LABEL_333;
  }

  objc_opt_class();
  v130 = 0LL;
  v120 = CUXPCDecodeUInt64RangedEx();
  if (v120 == 6)
  {
    v7->_tipiState = v130;
  }

  else if (v120 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v121 = CUXPCDecodeUInt64RangedEx();
  if (v121 == 6)
  {
    v7->_nearbyActionNoWakeType = v130;
  }

  else if (v121 == 5)
  {
    goto LABEL_333;
  }

  v130 = 0LL;
  v122 = CUXPCDecodeUInt64RangedEx();
  if (v122 != 6)
  {
    if (v122 != 5) {
      goto LABEL_319;
    }
LABEL_333:
    v123 = 0LL;
    goto LABEL_323;
  }

  v7->_nearbyActionNWPrecisionFindingStatus = v130;
LABEL_319:
  if (!CUXPCDecodeNSDataOfLength()
    || !CUXPCDecodeNSDataOfLength()
    || !CUXPCDecodeBool())
  {
    goto LABEL_333;
  }

  v123 = v7;
LABEL_323:

LABEL_324:
  return v123;
}

LABEL_217:
    v165 = -[CBDevice modelUser](self, "modelUser", *(void *)&v441);
    v166 = (void *)v165;
    if (v165)
    {
      v167 = v682;
      v616 = v682[5];
      v442 = v165;
      NSAppendPrintF_safe();
      objc_storeStrong(v167 + 5, v616);
    }

    v168 = self->_serialNumber;
    v169 = v168;
    if (v168)
    {
      v170 = v682;
      v615 = v682[5];
      v442 = (uint64_t)v168;
      NSAppendPrintF_safe();
      objc_storeStrong(v170 + 5, v615);
    }

    v171 = self->_serialNumberLeft;
    v172 = v171;
    if (v171)
    {
      v173 = v682;
      v614 = v682[5];
      v442 = (uint64_t)v171;
      NSAppendPrintF_safe();
      objc_storeStrong(v173 + 5, v614);
    }

    v174 = self->_serialNumberRight;
    v175 = v174;
    if (v174)
    {
      v176 = v682;
      v613 = v682[5];
      v442 = (uint64_t)v174;
      NSAppendPrintF_safe();
      objc_storeStrong(v176 + 5, v613);
    }

    smartRoutingMode = self->_smartRoutingMode;
    if (self->_smartRoutingMode)
    {
      v178 = v682 + 5;
      v612 = v682[5];
      else {
        v179 = off_189FB5798[smartRoutingMode];
      }
      v442 = (uint64_t)v179;
      NSAppendPrintF_safe();
      objc_storeStrong(v178, v612);
    }

    v180 = -[CBDevice spatialAudioMode](self, "spatialAudioMode", v442);
    if (!v180)
    {
LABEL_242:
      v183 = CBDiscoveryTypesBuffer();
      if (CBDiscoveryTypesContainTypes(self->_discoveryTypesInternal.bitArray, v183)
        && IsAppleInternalBuild()
        && self->_bleAdvertisementTimestamp != 0.0)
      {
        v184 = v682;
        v610 = v682[5];
        v443 = -[CBDevice bleAdvertisementTimestampString](self, "bleAdvertisementTimestampString");
        NSAppendPrintF_safe();
        objc_storeStrong(v184 + 5, v610);
      }

      bleAdvertisementTimestampMachContinuous = self->_bleAdvertisementTimestampMachContinuous;
      if (bleAdvertisementTimestampMachContinuous)
      {
        v186 = v682;
        v609 = v682[5];
        v443 = (void *)bleAdvertisementTimestampMachContinuous;
        NSAppendPrintF_safe();
        objc_storeStrong(v186 + 5, v609);
      }

      v187 = self->_bleAppleManufacturerData;
      if (v187)
      {
        v188 = v682;
        v608 = v682[5];
        CUPrintNSDataHex();
        v443 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v188 + 5, v608);
      }

      if ((v94 & 0x800000) != 0)
      {
        v189 = -[CBDevice linkKeyData](self, "linkKeyData");
        if (v189)
        {
          v190 = v682;
          v607 = v682[5];
          CUPrintNSDataHex();
          v443 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF_safe();
          objc_storeStrong(v190 + 5, v607);
        }
        v191 = -[CBDevice irkData](self, "irkData");
        if (v191)
        {
          v192 = v682;
          v606 = v682[5];
          CUPrintNSDataHex();
          v443 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF_safe();
          objc_storeStrong(v192 + 5, v606);
        }
        v193 = -[CBDevice ltkData](self, "ltkData");
        if (v193)
        {
          v194 = v682;
          v605 = v682[5];
          CUPrintNSDataHex();
          v443 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF_safe();
          objc_storeStrong(v194 + 5, v605);
        }
      }

      discoveryFlags = self->_discoveryFlags;
      if ((discoveryFlags & 0x80) != 0)
      {
        v196 = v682;
        v604 = v682[5];
        -[CBDevice accessoryStatusFlags](self, "accessoryStatusFlags");
        CUPrintFlags32();
        v444 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v196 + 5, v604);

        v197 = v682;
        v603 = v682[5];
        v445 = -[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount", v444);
        NSAppendPrintF_safe();
        objc_storeStrong(v197 + 5, v603);
        v198 = v682;
        v602 = v682[5];
        -[CBDevice accessoryStatusOBCTime](self, "accessoryStatusOBCTime", v445);
        CUPrintDurationDouble();
        v443 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v198 + 5, v602);
      }

      if (self->_airdropFlags)
      {
        v199 = v682;
        v601 = v682[5];
        CUPrintFlags32();
        v443 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v199 + 5, v601);
      }
      v200 = -[CBDevice airdropTempAuthTagData](self, "airdropTempAuthTagData", v443);
      if (v200)
      {
        v201 = v682;
        v600 = v682[5];
        v446 = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v201 + 5, v600);
      }

      airdropModel = self->_airdropModel;
      if (self->_airdropModel)
      {
        v203 = v682;
        v599 = v682[5];
        v446 = airdropModel;
        NSAppendPrintF_safe();
        objc_storeStrong(v203 + 5, v599);
      }

      airdropVersion = self->_airdropVersion;
      if (self->_airdropVersion)
      {
        v205 = v682;
        v598 = v682[5];
        v446 = airdropVersion;
        NSAppendPrintF_safe();
        objc_storeStrong(v205 + 5, v598);
      }

      airdropHash1 = self->_airdropHash1;
      if (self->_airdropHash1)
      {
        v207 = v682;
        v597 = v682[5];
        v446 = airdropHash1;
        NSAppendPrintF_safe();
        objc_storeStrong(v207 + 5, v597);
      }

      airdropHash2 = self->_airdropHash2;
      if (self->_airdropHash2)
      {
        v209 = v682;
        v596 = v682[5];
        v446 = airdropHash2;
        NSAppendPrintF_safe();
        objc_storeStrong(v209 + 5, v596);
      }

      airdropHash3 = self->_airdropHash3;
      if (self->_airdropHash3)
      {
        v211 = v682;
        v595 = v682[5];
        v446 = airdropHash3;
        NSAppendPrintF_safe();
        objc_storeStrong(v211 + 5, v595);
      }

      airdropHash4 = self->_airdropHash4;
      if (self->_airdropHash4)
      {
        v213 = v682;
        v594 = v682[5];
        v446 = airdropHash4;
        NSAppendPrintF_safe();
        objc_storeStrong(v213 + 5, v594);
      }

      if (self->_airdropConfigData)
      {
        v214 = v682;
        v593 = v682[5];
        v446 = CUPrintFlags32();
        NSAppendPrintF_safe();
        objc_storeStrong(v214 + 5, v593);
      }

      if ((discoveryFlags & 0x4000000000LL) != 0)
      {
        v215 = self->_airplaySourceAuthTagData;
        if (v215)
        {
          v216 = v682;
          v592 = v682[5];
          CUPrintNSDataHex();
          v447 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF_safe();
          objc_storeStrong(v216 + 5, v592);
        }

        v217 = v682;
        v591 = v682[5];
        CUPrintFlags32();
        v448 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v217 + 5, v591);
        v218 = -[CBDevice airplaySourceUWBConfigData](self, "airplaySourceUWBConfigData", v448);
        if (v218)
        {
          v219 = v682;
          v590 = v682[5];
          v446 = CUPrintNSDataHex();
          NSAppendPrintF_safe();
          objc_storeStrong(v219 + 5, v590);
        }
      }

      if ((discoveryFlags & 0x8000000000LL) != 0)
      {
        v220 = v682;
        v589 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v220 + 5, v589);
        v221 = v682;
        v588 = v682[5];
        CUPrintFlags32();
        v222 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v221 + 5, v588);

        v223 = v682;
        v587 = v682[5];
        v446 = CUPrintAddress();
        NSAppendPrintF_safe();
        objc_storeStrong(v223 + 5, v587);

        if ((self->_airplayTargetFlags & 0x10) != 0)
        {
          v224 = v682;
          v586 = v682[5];
          v446 = -[CBDevice airplayTargetPort](self, "airplayTargetPort", v446);
          NSAppendPrintF_safe();
          objc_storeStrong(v224 + 5, v586);
        }
      }
      v225 = -[CBDevice dockKitAccessoryPayloadData](self, "dockKitAccessoryPayloadData", v446);
      if (v225)
      {
        v226 = v682;
        v585 = v682[5];
        v449 = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v226 + 5, v585);
      }

      if ((discoveryFlags & 0x1000000000000000LL) != 0)
      {
        v227 = v682;
        v584 = v682[5];
        -[CBDevice dsActionFlags](self, "dsActionFlags");
        CUPrintFlags32();
        v450 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v227 + 5, v584);

        v228 = v682;
        v583 = v682[5];
        v451 = -[CBDevice dsActionMeasuredPower](self, "dsActionMeasuredPower", v450);
        NSAppendPrintF_safe();
        objc_storeStrong(v228 + 5, v583);
        v229 = v682;
        v582 = v682[5];
        v449 = -[CBDevice dsActionTieBreaker](self, "dsActionTieBreaker", v451);
        NSAppendPrintF_safe();
        objc_storeStrong(v229 + 5, v582);
      }

      if ((discoveryFlags & 0x800000000000000LL) != 0)
      {
        v230 = v682;
        v581 = v682[5];
        v452 = -[CBDevice dsInfoVehicleConfidence](self, "dsInfoVehicleConfidence");
        NSAppendPrintF_safe();
        objc_storeStrong(v230 + 5, v581);
        v231 = v682 + 5;
        v580 = v682[5];
        v232 = -[CBDevice dsInfoVehicleState](self, "dsInfoVehicleState", v452);
        if (v232 > 2) {
          v233 = "?";
        }
        else {
          v233 = off_189FB57B0[(char)v232];
        }
        v449 = (uint64_t)v233;
        NSAppendPrintF_safe();
        objc_storeStrong(v231, v580);
      }
      v234 = -[CBDevice gfpPayloadData](self, "gfpPayloadData", v449);
      if (v234)
      {
        v235 = v682;
        v579 = v682[5];
        homeKitV1SetupHash = CUPrintNSDataHex();
        v475 = (const char *)-[CBDevice gfpModelID](self, "gfpModelID");
        NSAppendPrintF_safe();
        objc_storeStrong(v235 + 5, v579);
      }
      v236 = -[CBDevice fidoPayloadData](self, "fidoPayloadData");
      if (v236)
      {
        v237 = v682;
        v578 = v682[5];
        homeKitV1SetupHash = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v237 + 5, v578);
      }

      if ((discoveryFlags & 0x400000000000000LL) != 0)
      {
        v238 = v682;
        v577 = v682[5];
        v454 = -[CBDevice heySiriConfidence](self, "heySiriConfidence");
        NSAppendPrintF_safe();
        objc_storeStrong(v238 + 5, v577);
        v239 = v682 + 5;
        v576 = v682[5];
        v240 = -[CBDevice heySiriDeviceClass](self, "heySiriDeviceClass", v454);
        if (v240 > 0xA) {
          v241 = "?";
        }
        else {
          v241 = off_189FB57C8[(__int16)v240];
        }
        v455 = v241;
        NSAppendPrintF_safe();
        objc_storeStrong(v239, v576);
        v242 = v682;
        v575 = v682[5];
        v456 = -[CBDevice heySiriPerceptualHash](self, "heySiriPerceptualHash", v455);
        NSAppendPrintF_safe();
        objc_storeStrong(v242 + 5, v575);
        v243 = v682 + 5;
        v574 = v682[5];
        v244 = -[CBDevice heySiriProductType](self, "heySiriProductType", v456);
        if (v244 > 4) {
          v245 = "?";
        }
        else {
          v245 = off_189FB5820[(char)v244];
        }
        v457 = v245;
        NSAppendPrintF_safe();
        objc_storeStrong(v243, v574);
        v246 = v682;
        v573 = v682[5];
        v458 = -[CBDevice heySiriRandom](self, "heySiriRandom", v457);
        NSAppendPrintF_safe();
        objc_storeStrong(v246 + 5, v573);
        v247 = v682;
        v572 = v682[5];
        homeKitV1SetupHash = -[CBDevice heySiriSNR](self, "heySiriSNR", v458);
        NSAppendPrintF_safe();
        objc_storeStrong(v247 + 5, v572);
      }

      if ((discoveryFlags & 0x400000) != 0)
      {
        v248 = v682;
        v571 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v248 + 5, v571);
        v249 = v682;
        v570 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v249 + 5, v570);
        v250 = v682;
        v569 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v250 + 5, v569);
        v251 = v682;
        v568 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v251 + 5, v568);
        v252 = v682;
        v567 = v682[5];
        CUPrintFlags32();
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v252 + 5, v567);

        v254 = v682;
        v566 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v254 + 5, v566);
        v255 = v682;
        v565 = v682[5];
        homeKitV1SetupHash = self->_homeKitV1SetupHash;
        NSAppendPrintF_safe();
        objc_storeStrong(v255 + 5, v565);
      }

      if ((discoveryFlags & 0x1000000) != 0)
      {
        v256 = v682;
        v564 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v256 + 5, v564);
        v257 = v682;
        v563 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v257 + 5, v563);
        v258 = v682;
        v562 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v258 + 5, v562);
        v259 = v682;
        v561 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v259 + 5, v561);
        v260 = v682;
        v560 = v682[5];
        homeKitV1SetupHash = self->_homeKitV2Value;
        NSAppendPrintF_safe();
        objc_storeStrong(v260 + 5, v560);
      }

      if ((discoveryFlags & 0x80000000000000LL) != 0)
      {
        v261 = -[CBDevice mspAddressData](self, "mspAddressData");
        if (v261)
        {
          v262 = v682;
          v559 = v682[5];
          homeKitV1SetupHash = CUPrintNSDataAddress();
          NSAppendPrintF_safe();
          objc_storeStrong(v262 + 5, v559);
        }

        v263 = -[CBDevice mspDeviceClass](self, "mspDeviceClass");
        if ((_DWORD)v263)
        {
          v264 = v682;
          v558 = v682[5];
          homeKitV1SetupHash = v263;
          NSAppendPrintF_safe();
          objc_storeStrong(v264 + 5, v558);
        }
        v265 = -[CBDevice mspDisplayName](self, "mspDisplayName", homeKitV1SetupHash, v475);
        if (v265)
        {
          v266 = v682;
          v557 = v682[5];
          NSAppendPrintF_safe();
          objc_storeStrong(v266 + 5, v557);
        }

        v267 = v682 + 5;
        v556 = v682[5];
        v268 = -[CBDevice mspSubScenario](self, "mspSubScenario");
        if (v268 > 2) {
          v269 = "?";
        }
        else {
          v269 = off_189FB5848[(char)v268];
        }
        homeKitV1SetupHash = (unint64_t)v269;
        NSAppendPrintF_safe();
        objc_storeStrong(v267, v556);
      }

      v270 = -[CBDevice nearbyActionColorCode](self, "nearbyActionColorCode", homeKitV1SetupHash);
      if (v270)
      {
        v271 = v682;
        v555 = v682[5];
        v459 = v270;
        NSAppendPrintF_safe();
        objc_storeStrong(v271 + 5, v555);
      }
      v272 = -[CBDevice nearbyActionExtraData](self, "nearbyActionExtraData", v459);
      if (v272)
      {
        v273 = v682;
        v554 = v682[5];
        CUPrintNSDataHex();
        v460 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v273 + 5, v554);
      }

      if (self->_nearbyActionFlags)
      {
        v274 = v682;
        v553 = v682[5];
        CUPrintFlags32();
        v460 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v274 + 5, v553);
      }

      nearbyActionType = self->_nearbyActionType;
      if (self->_nearbyActionType)
      {
        v276 = v682 + 5;
        v552 = v682[5];
        if (nearbyActionType > 0x58) {
          v277 = "?";
        }
        else {
          v277 = off_189FB58A8[(char)(nearbyActionType - 1)];
        }
        v460 = (void *)v277;
        NSAppendPrintF_safe();
        objc_storeStrong(v276, v552);
      }

      v278 = self->_nearbyActionAuthTag;
      if (v278)
      {
        v279 = v682;
        v551 = v682[5];
        CUPrintNSDataHex();
        v460 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v279 + 5, v551);
      }

      v280 = self->_nearbyActionTargetAuthTag;
      if (v280)
      {
        v281 = v682;
        v550 = v682[5];
        CUPrintNSDataHex();
        v460 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v281 + 5, v550);
      }

      v282 = -[CBDevice nearbyActionDeviceClass](self, "nearbyActionDeviceClass");
      if (v282)
      {
        v283 = v682 + 5;
        v549 = v682[5];
        if (v282 > 9) {
          v284 = "?";
        }
        else {
          v284 = off_189FB5860[(char)(v282 - 1)];
        }
        v460 = (void *)v284;
        NSAppendPrintF_safe();
        objc_storeStrong(v283, v549);
      }

      if (-[CBDevice nearbyActionV2Flags](self, "nearbyActionV2Flags", v460))
      {
        v285 = v682;
        v548 = v682[5];
        CUPrintFlags32();
        v461 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v285 + 5, v548);
      }

      v286 = -[CBDevice nearbyActionV2Type](self, "nearbyActionV2Type", v461);
      if (v286)
      {
        v287 = v682 + 5;
        v547 = v682[5];
        if (v286 >= 0x59) {
          v288 = "?";
        }
        else {
          v288 = off_189FB58A8[(char)(v286 - 1)];
        }
        v462 = v288;
        NSAppendPrintF_safe();
        objc_storeStrong(v287, v547);
      }
      v289 = -[CBDevice nearbyActionV2TargetData](self, "nearbyActionV2TargetData", v462);
      if (v289)
      {
        v290 = v682;
        v546 = v682[5];
        CUPrintNSDataHex();
        v463 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v290 + 5, v546);
      }

      v291 = self->_nearbyInfoAuthTag;
      if (v291)
      {
        v292 = v682;
        v545 = v682[5];
        CUPrintNSDataHex();
        v463 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v292 + 5, v545);
      }

      if (self->_nearbyInfoFlags)
      {
        v293 = v682;
        v544 = v682[5];
        CUPrintFlags32();
        v463 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v293 + 5, v544);
      }

      -[CBDevice nearbyInfoStatusProgress](self, "nearbyInfoStatusProgress", v463);
      if (v294 != 0.0)
      {
        v295 = v682;
        v543 = v682[5];
        v464 = v294 * 100.0;
        NSAppendPrintF_safe();
        objc_storeStrong(v295 + 5, v543);
      }

      v296 = -[CBDevice nearbyInfoStatusTime](self, "nearbyInfoStatusTime", *(void *)&v464);
      if (v296)
      {
        v297 = v682 + 5;
        v542 = v682[5];
        if (v296 > 0xE) {
          v298 = "?";
        }
        else {
          v298 = off_189FB5B68[(char)(v296 - 1)];
        }
        v465 = v298;
        NSAppendPrintF_safe();
        objc_storeStrong(v297, v542);
      }

      v299 = -[CBDevice nearbyInfoStatusType](self, "nearbyInfoStatusType", v465);
      if (v299)
      {
        v300 = v682 + 5;
        v541 = v682[5];
        if (v299 > 0xD) {
          v301 = "?";
        }
        else {
          v301 = off_189FB5BD8[(char)(v299 - 1)];
        }
        objectDiscoveryPublicKeyData = (__CFString *)v301;
        NSAppendPrintF_safe();
        objc_storeStrong(v300, v541);
      }

      if (self->_nearbyInfoV2Flags)
      {
        v302 = v682;
        v540 = v682[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v302 + 5, v540);
      }

      if (self->_nearbyInfoV2DecryptedFlags)
      {
        v303 = v682;
        v539 = v682[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v303 + 5, v539);
      }

      v304 = self->_nearbyInfoV2AuthTagData;
      if (v304)
      {
        v305 = v682;
        v538 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v305 + 5, v538);
      }

      v306 = self->_nearbyInfoV2AuthIntegrityTagData;
      if (v306)
      {
        v307 = v682;
        v537 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v307 + 5, v537);
      }

      nearbyInfoV2InvitationCounter = (__CFString *)self->_nearbyInfoV2InvitationCounter;
      if (self->_nearbyInfoV2InvitationCounter)
      {
        v309 = v682;
        v536 = v682[5];
        objectDiscoveryPublicKeyData = nearbyInfoV2InvitationCounter;
        NSAppendPrintF_safe();
        objc_storeStrong(v309 + 5, v536);
      }

      if (self->_nearbyInfoV2InvitationTypes)
      {
        v310 = v682;
        v535 = v682[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v310 + 5, v535);
      }

      nearbyInfoV2InvitationRouteType = self->_nearbyInfoV2InvitationRouteType;
      if (self->_nearbyInfoV2InvitationRouteType)
      {
        v312 = v682 + 5;
        v534 = v682[5];
        if (nearbyInfoV2InvitationRouteType > 0xB) {
          v313 = "?";
        }
        else {
          v313 = off_189FB5C40[(char)(nearbyInfoV2InvitationRouteType - 1)];
        }
        objectDiscoveryPublicKeyData = (__CFString *)v313;
        NSAppendPrintF_safe();
        objc_storeStrong(v312, v534);
      }

      if (self->_nearbyActionNoWakeType)
      {
        if (self->_nearbyActionNoWakeType == 1) {
          v314 = "PrecisionFinding";
        }
        else {
          v314 = "?";
        }
        v315 = v682;
        v533 = v682[5];
        objectDiscoveryPublicKeyData = (__CFString *)v314;
        NSAppendPrintF_safe();
        objc_storeStrong(v315 + 5, v533);
      }

      if (self->_nearbyActionNWPrecisionFindingStatus)
      {
        v316 = v682;
        v532 = v682[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v316 + 5, v532);
      }

      v317 = self->_nearbyActionNoWakeAuthTagData;
      if (v317)
      {
        v318 = v682;
        v531 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v318 + 5, v531);
      }

      v319 = self->_nearbyActionNoWakeConfigData;
      if (v319)
      {
        v320 = v682;
        v530 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v320 + 5, v530);
      }

      if ((discoveryFlags & 0x60000000000LL) != 0)
      {
        v321 = v682 + 5;
        v529 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v321, v529);
        v322 = v682 + 5;
        v528 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v322, v528);
        v323 = v682;
        v527 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v323 + 5, v527);
        v324 = v682;
        v526 = v682[5];
        CBProductIDToString_0(self->_objectDiscoveryProductID);
        NSAppendPrintF_safe();
        objc_storeStrong(v324 + 5, v526);
        v325 = v682;
        v525 = v682[5];
        objectDiscoveryPublicKeyData = (__CFString *)self->_objectDiscoveryPublicKeyData;
        NSAppendPrintF_safe();
        objc_storeStrong(v325 + 5, v525);
      }

      v326 = self->_proximityServiceData;
      if (v326)
      {
        v327 = v682;
        v524 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v327 + 5, v524);
      }

      proximityServiceCategory = (__CFString *)self->_proximityServiceCategory;
      if (self->_proximityServiceCategory)
      {
        v329 = v682;
        v523 = v682[5];
        objectDiscoveryPublicKeyData = proximityServiceCategory;
        NSAppendPrintF_safe();
        objc_storeStrong(v329 + 5, v523);
      }

      v330 = self->_proximityServiceClassicAddress;
      if (v330)
      {
        v331 = v682;
        v522 = v682[5];
        CUPrintNSDataAddress();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v331 + 5, v522);
      }

      if (self->_proximityServiceFlags)
      {
        v332 = v682;
        v521 = v682[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v332 + 5, v521);
      }

      proximityServiceMeasuredPower = (__CFString *)self->_proximityServiceMeasuredPower;
      if (self->_proximityServiceMeasuredPower)
      {
        v334 = v682;
        v520 = v682[5];
        objectDiscoveryPublicKeyData = proximityServiceMeasuredPower;
        NSAppendPrintF_safe();
        objc_storeStrong(v334 + 5, v520);
      }

      proximityServiceProductID = (__CFString *)self->_proximityServiceProductID;
      if ((_DWORD)proximityServiceProductID)
      {
        v336 = CBProductIDToString_0(self->_proximityServiceProductID);
        v337 = v682;
        v519 = v682[5];
        objectDiscoveryPublicKeyData = proximityServiceProductID;
        v475 = v336;
        NSAppendPrintF_safe();
        objc_storeStrong(v337 + 5, v519);
      }

      proximityServicePSM = (__CFString *)self->_proximityServicePSM;
      if (self->_proximityServicePSM)
      {
        v339 = v682;
        v518 = v682[5];
        objectDiscoveryPublicKeyData = proximityServicePSM;
        NSAppendPrintF_safe();
        objc_storeStrong(v339 + 5, v518);
      }

      v340 = self->_proximityServiceSetupHash;
      if (v340)
      {
        v341 = v682;
        v517 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v341 + 5, v517);
      }

      proximityServiceSubType = self->_proximityServiceSubType;
      if (self->_proximityServiceSubType)
      {
        v343 = v682 + 5;
        v516 = v682[5];
        if (proximityServiceSubType > 6) {
          v344 = "?";
        }
        else {
          v344 = off_189FB5CD0[(char)(proximityServiceSubType - 1)];
        }
        objectDiscoveryPublicKeyData = (__CFString *)v344;
        NSAppendPrintF_safe();
        objc_storeStrong(v343, v516);
      }

      proximityServiceVendorID = (__CFString *)self->_proximityServiceVendorID;
      if (!self->_proximityServiceVendorID) {
        goto LABEL_432;
      }
      v346 = v682 + 5;
      v515 = v682[5];
      v347 = "Apple";
      if ((int)proximityServiceVendorID > 300)
      {
        if ((_DWORD)proximityServiceVendorID == 1452) {
          goto LABEL_431;
        }
        if ((_DWORD)proximityServiceVendorID == 1356 || (_DWORD)proximityServiceVendorID == 301)
        {
          v347 = "Sony";
          goto LABEL_431;
        }
      }

      else
      {
        switch((_DWORD)proximityServiceVendorID)
        {
          case 6:
            v347 = "MS";
            goto LABEL_431;
          case 0x4C:
LABEL_431:
            objectDiscoveryPublicKeyData = proximityServiceVendorID;
            v475 = v347;
            NSAppendPrintF_safe();
            objc_storeStrong(v346, v515);
LABEL_432:
            proximityServiceVersion = (__CFString *)self->_proximityServiceVersion;
            if (self->_proximityServiceVersion)
            {
              v349 = v682;
              v514 = v682[5];
              objectDiscoveryPublicKeyData = proximityServiceVersion;
              NSAppendPrintF_safe();
              objc_storeStrong(v349 + 5, v514);
            }

            if ((discoveryFlags & 0xC080) != 0)
            {
              proximityPairingProductID = (__CFString *)self->_proximityPairingProductID;
              if ((_DWORD)proximityPairingProductID)
              {
                v351 = CBProductIDToString_0(self->_proximityPairingProductID);
                v352 = v682;
                v513 = v682[5];
                objectDiscoveryPublicKeyData = proximityPairingProductID;
                v475 = v351;
                NSAppendPrintF_safe();
                objc_storeStrong(v352 + 5, v513);
              }

              proximityPairingSubType = (__CFString *)self->_proximityPairingSubType;
              if (self->_proximityPairingSubType)
              {
                v354 = v682 + 5;
                v512 = v682[5];
                else {
                  v355 = off_189FB5D00[(char)((_BYTE)proximityPairingSubType - 1)];
                }
                objectDiscoveryPublicKeyData = proximityPairingSubType;
                v475 = v355;
                NSAppendPrintF_safe();
                objc_storeStrong(v354, v512);
              }

              v356 = -[CBDevice proximityPairingPrimaryPlacement]( self,  "proximityPairingPrimaryPlacement",  objectDiscoveryPublicKeyData,  v475);
              if (v356)
              {
                v357 = v682 + 5;
                v511 = v682[5];
                if (v356 > 7) {
                  v358 = "?";
                }
                else {
                  v358 = off_189FB5D48[v356 - 1];
                }
                v467 = v358;
                NSAppendPrintF_safe();
                objc_storeStrong(v357, v511);
              }

              v359 = -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement", v467);
              if (v359)
              {
                v360 = v682 + 5;
                v510 = v682[5];
                if (v359 > 7) {
                  v361 = "?";
                }
                else {
                  v361 = off_189FB5D48[v359 - 1];
                }
                objectDiscoveryPublicKeyData = (__CFString *)v361;
                NSAppendPrintF_safe();
                objc_storeStrong(v360, v510);
              }
            }

            if (self->_selectiveSpeechListeningCapability)
            {
              if (self->_selectiveSpeechListeningCapability == 1) {
                v362 = @"Enabled";
              }
              else {
                v362 = @"?";
              }
              v363 = v682;
              v509 = v682[5];
              objectDiscoveryPublicKeyData = v362;
              NSAppendPrintF_safe();
              objc_storeStrong(v363 + 5, v509);
            }

            v364 = -[CBDevice selectiveSpeechListeningConfig]( self,  "selectiveSpeechListeningConfig",  objectDiscoveryPublicKeyData);
            if (v364)
            {
              v365 = v682 + 5;
              v508 = v682[5];
              if (v364 > 3) {
                v366 = @"?";
              }
              else {
                v366 = (const __CFString *)*((void *)&off_189FB5D80 + (char)(v364 - 1));
              }
              v468 = (void *)v366;
              NSAppendPrintF_safe();
              objc_storeStrong(v365, v508);
            }

            hearingAidSupport = self->_hearingAidSupport;
            if (self->_hearingAidSupport)
            {
              v368 = v682 + 5;
              v507 = v682[5];
              else {
                v369 = off_189FB5D98[hearingAidSupport];
              }
              v468 = (void *)v369;
              NSAppendPrintF_safe();
              objc_storeStrong(v368, v507);
            }

            hearingTestSupport = self->_hearingTestSupport;
            if (self->_hearingTestSupport)
            {
              v371 = v682 + 5;
              v506 = v682[5];
              else {
                v372 = off_189FB5D98[hearingTestSupport];
              }
              v468 = (void *)v372;
              NSAppendPrintF_safe();
              objc_storeStrong(v371, v506);
            }

            v373 = self->_safetyAlertsAlertData;
            if (v373)
            {
              v374 = v682;
              v505 = v682[5];
              CUPrintNSDataHex();
              v468 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v374 + 5, v505);
            }

            v375 = self->_safetyAlertsAlertID;
            if (v375)
            {
              v376 = v682;
              v504 = v682[5];
              CUPrintNSDataHex();
              v468 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v376 + 5, v504);
            }

            v377 = self->_safetyAlertsSignature;
            if (v377)
            {
              v378 = v682;
              v503 = v682[5];
              CUPrintNSDataHex();
              v468 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v378 + 5, v503);
            }

            if (self->_safetyAlertsVersion)
            {
              if (self->_safetyAlertsVersion == 1) {
                v379 = "1";
              }
              else {
                v379 = "?";
              }
              v380 = v682;
              v502 = v682[5];
              v468 = (void *)v379;
              NSAppendPrintF_safe();
              objc_storeStrong(v380 + 5, v502);
            }

            if ((self->_internalFlags & 0x4000) != 0)
            {
              v381 = self->_safetyAlertsSegmentAlertData;
              if (v381)
              {
                v382 = v682;
                v501 = v682[5];
                CUPrintNSDataHex();
                v468 = (void *)objc_claimAutoreleasedReturnValue();
                NSAppendPrintF_safe();
                objc_storeStrong(v382 + 5, v501);
              }

              safetyAlertsSegmentSegmentNumber = (void *)self->_safetyAlertsSegmentSegmentNumber;
              if (self->_safetyAlertsSegmentSegmentNumber)
              {
                v384 = v682;
                v500 = v682[5];
                v468 = safetyAlertsSegmentSegmentNumber;
                NSAppendPrintF_safe();
                objc_storeStrong(v384 + 5, v500);
              }

              safetyAlertsSegmentSegmentsTotal = (void *)self->_safetyAlertsSegmentSegmentsTotal;
              if (self->_safetyAlertsSegmentSegmentsTotal)
              {
                v386 = v682;
                v499 = v682[5];
                v468 = safetyAlertsSegmentSegmentsTotal;
                NSAppendPrintF_safe();
                objc_storeStrong(v386 + 5, v499);
              }

              v387 = self->_safetyAlertsSegmentServiceData;
              if (v387)
              {
                v388 = v682;
                v498 = v682[5];
                CUPrintNSDataHex();
                v468 = (void *)objc_claimAutoreleasedReturnValue();
                NSAppendPrintF_safe();
                objc_storeStrong(v388 + 5, v498);
              }

              v389 = self->_safetyAlertsSegmentSignature;
              if (v389)
              {
                v390 = v682;
                v497 = v682[5];
                CUPrintNSDataHex();
                v468 = (void *)objc_claimAutoreleasedReturnValue();
                NSAppendPrintF_safe();
                objc_storeStrong(v390 + 5, v497);
              }
            }

            v391 = self->_spatialInteractionIdentifiers;
            if (v391)
            {
              v392 = v682;
              v496 = v682[5];
              CUPrintNSObjectOneLine();
              v468 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v392 + 5, v496);
            }

            if (self->_spatialInteractionFlags)
            {
              v393 = v682;
              v495 = v682[5];
              CUPrintFlags32();
              v468 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v393 + 5, v495);
            }

            if (self->_spatialInteractionConfigFlags)
            {
              v394 = v682;
              v494 = v682[5];
              CUPrintFlags32();
              v468 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v394 + 5, v494);
            }

            v395 = self->_spatialInteractionTokenData;
            if (v395)
            {
              v396 = v682;
              v493 = v682[5];
              CUPrintNSObjectMasked();
              v468 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v396 + 5, v493);
            }

            v397 = self->_spatialInteractionUserInfo;
            if (v397)
            {
              v398 = v682;
              v492 = v682[5];
              CUPrintNSObjectOneLineEx();
              v468 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v398 + 5, v492);
            }

            v399 = self->_spatialInteractionUWBConfigData;
            v400 = v399;
            if (v399)
            {
              v401 = v682;
              v491 = v682[5];
              v468 = v399;
              NSAppendPrintF_safe();
              objc_storeStrong(v401 + 5, v491);
            }

            spatialInteractionUWBTokenFlags = (void *)self->_spatialInteractionUWBTokenFlags;
            if ((_DWORD)spatialInteractionUWBTokenFlags)
            {
              v403 = v682;
              v490 = v682[5];
              v468 = spatialInteractionUWBTokenFlags;
              NSAppendPrintF_safe();
              objc_storeStrong(v403 + 5, v490);
            }

            v404 = self->_spatialInteractionPresenceConfigData;
            v405 = v404;
            if (v404)
            {
              v406 = v682;
              v489 = v682[5];
              v468 = v404;
              NSAppendPrintF_safe();
              objc_storeStrong(v406 + 5, v489);
            }

            v407 = self->_tipiDevices;
            if (v407)
            {
              v408 = v682;
              v488 = v682[5];
              CUPrintNSObjectOneLine();
              v468 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v408 + 5, v488);
            }

            tipiConnectionStatus = self->_tipiConnectionStatus;
            if (self->_tipiConnectionStatus)
            {
              v410 = v682 + 5;
              v487 = v682[5];
              if (tipiConnectionStatus > 3) {
                v411 = "?";
              }
              else {
                v411 = off_189FB5DB0[(char)(tipiConnectionStatus - 1)];
              }
              v468 = (void *)v411;
              NSAppendPrintF_safe();
              objc_storeStrong(v410, v487);
            }

            if (self->_tipiState)
            {
              v412 = v682;
              v486 = v682[5];
              CUPrintFlags32();
              v468 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v412 + 5, v486);
            }
            v413 = -[CBDevice watchSetupData](self, "watchSetupData", v468);
            if (v413)
            {
              v414 = v682;
              v485 = v682[5];
              CUPrintNSDataHex();
              v469 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v414 + 5, v485);
            }

            if (v21 < 0x1F)
            {
              if (self->_internalFlags)
              {
                v415 = v682;
                v484 = v682[5];
                CUPrintFlags32();
                v470 = (void *)objc_claimAutoreleasedReturnValue();
                NSAppendPrintF_safe();
                objc_storeStrong(v415 + 5, v484);
              }

              if (self->_attributeInternalFlags)
              {
                v416 = v682;
                v483 = v682[5];
                CUPrintFlags32();
                v471 = (void *)objc_claimAutoreleasedReturnValue();
                NSAppendPrintF_safe();
                objc_storeStrong(v416 + 5, v483);
              }
            }

            if (self->_changeFlags != self->_discoveryFlags)
            {
              v417 = v682;
              v482 = v682[5];
              CUPrintFlags64();
              v472 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v417 + 5, v482);
            }

            if (*(_DWORD *)self->_changedTypesInternal.bitArray != *(_DWORD *)self->_discoveryTypesInternal.bitArray
              || self->_changedTypesInternal.bitArray[4] != self->_discoveryTypesInternal.bitArray[4])
            {
              v419 = v682;
              v481 = v682[5];
              CBDiscoveryTypesAppendString((uint64_t)&v481, (uint64_t)", ChTy", (uint64_t)&self->_changedTypesInternal);
              objc_storeStrong(v419 + 5, v481);
            }

            if (v21 <= 0x14)
            {
              v420 = v682;
              v480 = v682[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v420 + 5, v480);
            }

            v421 = self->_spatialInteractionDeviceTimestampArrayDictionary;
            if (v421)
            {
              v422 = v682;
              v479 = v682[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v422 + 5, v479);
              spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
              v477[0] = MEMORY[0x1895F87A8];
              v477[1] = 3221225472LL;
              v477[2] = __33__CBDevice_descriptionWithLevel___block_invoke;
              v477[3] = &unk_189FB5660;
              v477[4] = &v681;
              v478 = v94;
              -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( spatialInteractionDeviceTimestampArrayDictionary,  "enumerateKeysAndObjectsUsingBlock:",  v477);
              v424 = v682;
              v476 = v682[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v424 + 5, v476);
            }

            goto LABEL_539;
          case 0xC4:
            v347 = "LG";
            goto LABEL_431;
        }
      }

      v347 = "?";
      goto LABEL_431;
    }

    v181 = v682 + 5;
    v611 = v682[5];
    if (v180 > 2)
    {
      if (v180 == 3)
      {
        v182 = "NoStereoUpSample";
        goto LABEL_241;
      }

      if (v180 == 255)
      {
        v182 = "Unknown";
        goto LABEL_241;
      }
    }

    else
    {
      if (v180 == 1)
      {
        v182 = "ContentDriven";
        goto LABEL_241;
      }

      if (v180 == 2)
      {
        v182 = "Always";
LABEL_241:
        v443 = (void *)v182;
        NSAppendPrintF_safe();
        objc_storeStrong(v181, v611);
        goto LABEL_242;
      }
    }

    v182 = "?";
    goto LABEL_241;
  }

LABEL_539:
  v425 = v682[5];
  _Block_object_dispose(&v681, 8);

  return v425;
}

void sub_187006E5C(_Unwind_Exception *a1)
{
}

void sub_187006E74(_Unwind_Exception *a1)
{
}

void sub_187006E8C(_Unwind_Exception *a1)
{
}

void sub_187006EA4(_Unwind_Exception *a1)
{
}

void sub_187006EBC(_Unwind_Exception *a1)
{
}

void sub_187006ED4(_Unwind_Exception *a1)
{
}

void sub_187006EEC(_Unwind_Exception *a1)
{
}

void sub_187006F04(_Unwind_Exception *a1)
{
}

void sub_187006F1C(_Unwind_Exception *a1)
{
}

void sub_187006F34(_Unwind_Exception *a1)
{
}

void sub_187006F4C(_Unwind_Exception *a1)
{
}

void sub_187006F64(_Unwind_Exception *a1)
{
}

void sub_187006F7C(_Unwind_Exception *a1)
{
}

void sub_187006F94(_Unwind_Exception *a1)
{
}

void sub_187006FAC(_Unwind_Exception *a1)
{
}

void sub_187006FC4(_Unwind_Exception *a1)
{
}

void sub_187006FDC(_Unwind_Exception *a1)
{
}

void sub_187006FF4(_Unwind_Exception *a1)
{
}

void sub_18700700C(_Unwind_Exception *a1)
{
}

void sub_187007024(_Unwind_Exception *a1)
{
}

void sub_18700703C(_Unwind_Exception *a1)
{
}

void sub_187007054(_Unwind_Exception *a1)
{
}

void sub_18700706C(_Unwind_Exception *a1)
{
}

void sub_187007084(_Unwind_Exception *a1)
{
}

void sub_18700709C(_Unwind_Exception *a1)
{
}

void sub_1870070B4(_Unwind_Exception *a1)
{
}

void sub_1870070CC(_Unwind_Exception *a1)
{
}

void sub_1870070E4(_Unwind_Exception *a1)
{
}

void sub_1870070FC(_Unwind_Exception *a1)
{
}

void sub_187007114(_Unwind_Exception *a1)
{
}

void sub_18700712C(_Unwind_Exception *a1)
{
}

void sub_187007144(_Unwind_Exception *a1)
{
}

void sub_18700715C(_Unwind_Exception *a1)
{
}

void sub_187007174(_Unwind_Exception *a1)
{
}

void sub_18700718C(_Unwind_Exception *a1)
{
}

void sub_1870071A4(_Unwind_Exception *a1)
{
}

void sub_1870071BC(_Unwind_Exception *a1)
{
}

void sub_1870071D4(_Unwind_Exception *a1)
{
}

void sub_1870071EC(_Unwind_Exception *a1)
{
}

void sub_187007204(_Unwind_Exception *a1)
{
}

void sub_18700721C(_Unwind_Exception *a1)
{
}

void sub_187007234(_Unwind_Exception *a1)
{
}

void sub_18700724C(_Unwind_Exception *a1)
{
}

void sub_187007264(_Unwind_Exception *a1)
{
}

void sub_18700727C(_Unwind_Exception *a1)
{
}

void sub_187007294(_Unwind_Exception *a1)
{
}

void sub_1870072AC(_Unwind_Exception *a1)
{
}

void sub_1870072C4(_Unwind_Exception *a1)
{
}

void sub_1870072DC(_Unwind_Exception *a1)
{
}

void sub_1870072F4(_Unwind_Exception *a1)
{
}

void sub_18700730C(_Unwind_Exception *a1)
{
}

void sub_187007324(_Unwind_Exception *a1)
{
}

void sub_18700733C(_Unwind_Exception *a1)
{
}

void sub_187007354(_Unwind_Exception *a1)
{
}

void sub_18700736C(_Unwind_Exception *a1)
{
}

void sub_187007384(_Unwind_Exception *a1)
{
}

void sub_18700739C(_Unwind_Exception *a1)
{
}

void sub_1870073B4(_Unwind_Exception *a1)
{
}

void sub_1870073CC(_Unwind_Exception *a1)
{
}

void sub_1870073E4(_Unwind_Exception *a1)
{
}

void sub_1870073FC(_Unwind_Exception *a1)
{
}

void sub_187007414(_Unwind_Exception *a1)
{
}

void sub_18700742C(_Unwind_Exception *a1)
{
}

void sub_187007444(_Unwind_Exception *a1)
{
}

void sub_18700745C(_Unwind_Exception *a1)
{
}

void sub_187007474(_Unwind_Exception *a1)
{
}

void sub_18700748C(_Unwind_Exception *a1)
{
}

void sub_1870074A4(_Unwind_Exception *a1)
{
}

void sub_1870074BC(_Unwind_Exception *a1)
{
}

void sub_1870074D4(_Unwind_Exception *a1)
{
}

void sub_1870074EC(_Unwind_Exception *a1)
{
}

void sub_187007504(_Unwind_Exception *a1)
{
}

void sub_18700751C(_Unwind_Exception *a1)
{
}

void sub_187007534(_Unwind_Exception *a1)
{
}

void sub_18700754C(_Unwind_Exception *a1)
{
}

void sub_187007564(_Unwind_Exception *a1)
{
}

void sub_18700757C(_Unwind_Exception *a1)
{
}

void sub_187007594(_Unwind_Exception *a1)
{
}

void sub_1870075AC(_Unwind_Exception *a1)
{
}

void sub_1870075C4(_Unwind_Exception *a1)
{
}

void sub_1870075DC(_Unwind_Exception *a1)
{
}

void sub_1870075F4(_Unwind_Exception *a1)
{
}

void sub_18700760C(_Unwind_Exception *a1)
{
}

void sub_187007624(_Unwind_Exception *a1)
{
}

void sub_18700763C(_Unwind_Exception *a1)
{
}

void sub_187007654(_Unwind_Exception *a1)
{
}

void sub_18700766C(_Unwind_Exception *a1)
{
}

void sub_187007684(_Unwind_Exception *a1)
{
}

void sub_18700769C(_Unwind_Exception *a1)
{
}

void sub_1870076B4(_Unwind_Exception *a1)
{
}

void sub_1870076CC(_Unwind_Exception *a1)
{
}

void sub_1870076E4(_Unwind_Exception *a1)
{
}

void sub_1870076FC(_Unwind_Exception *a1)
{
}

void sub_187007714(_Unwind_Exception *a1)
{
}

void sub_18700772C(_Unwind_Exception *a1)
{
}

void sub_187007744(_Unwind_Exception *a1)
{
}

void sub_18700775C(_Unwind_Exception *a1)
{
}

void sub_187007774(_Unwind_Exception *a1)
{
}

void sub_18700778C(_Unwind_Exception *a1)
{
}

void sub_1870077A4(_Unwind_Exception *a1)
{
}

void sub_1870077BC(_Unwind_Exception *a1)
{
}

void sub_1870077D4(_Unwind_Exception *a1)
{
}

void sub_1870077EC(_Unwind_Exception *a1)
{
}

void sub_187007804(_Unwind_Exception *a1)
{
}

void sub_18700781C(_Unwind_Exception *a1)
{
}

void sub_187007834(_Unwind_Exception *a1)
{
}

void sub_18700784C(_Unwind_Exception *a1)
{
}

void sub_187007864(_Unwind_Exception *a1)
{
}

void sub_18700787C(_Unwind_Exception *a1)
{
}

void sub_187007894(_Unwind_Exception *a1)
{
}

void sub_1870078AC(_Unwind_Exception *a1)
{
}

void sub_1870078C4(_Unwind_Exception *a1)
{
}

void sub_1870078DC(_Unwind_Exception *a1)
{
}

void sub_1870078F4(_Unwind_Exception *a1)
{
}

void sub_18700790C(_Unwind_Exception *a1)
{
}

void sub_187007924(_Unwind_Exception *a1)
{
}

void sub_18700793C(_Unwind_Exception *a1)
{
}

void sub_187007954(_Unwind_Exception *a1)
{
}

void sub_18700796C(_Unwind_Exception *a1)
{
}

void sub_187007984(_Unwind_Exception *a1)
{
}

void sub_18700799C(_Unwind_Exception *a1)
{
}

void sub_1870079B4(_Unwind_Exception *a1)
{
}

void sub_1870079CC(_Unwind_Exception *a1)
{
}

void sub_1870079E4(_Unwind_Exception *a1)
{
}

void sub_1870079FC(_Unwind_Exception *a1)
{
}

void sub_187007A14(_Unwind_Exception *a1)
{
}

void sub_187007A2C(_Unwind_Exception *a1)
{
}

void sub_187007A44(_Unwind_Exception *a1)
{
}

void sub_187007A5C(_Unwind_Exception *a1)
{
}

void sub_187007A74(_Unwind_Exception *a1)
{
}

void sub_187007A8C(_Unwind_Exception *a1)
{
}

void sub_187007AA4(_Unwind_Exception *a1)
{
}

void sub_187007ABC(_Unwind_Exception *a1)
{
}

void sub_187007AD4(_Unwind_Exception *a1)
{
}

void sub_187007AEC(_Unwind_Exception *a1)
{
}

void sub_187007B04(_Unwind_Exception *a1)
{
}

void sub_187007B1C(_Unwind_Exception *a1)
{
}

void sub_187007B34(_Unwind_Exception *a1)
{
}

void sub_187007B4C(_Unwind_Exception *a1)
{
}

void sub_187007B64(_Unwind_Exception *a1)
{
}

void sub_187007B7C(_Unwind_Exception *a1)
{
}

void sub_187007B94(_Unwind_Exception *a1)
{
}

void sub_187007BAC(_Unwind_Exception *a1)
{
}

void sub_187007BC4(_Unwind_Exception *a1)
{
}

void sub_187007BDC(_Unwind_Exception *a1)
{
}

void sub_187007BF4(_Unwind_Exception *a1)
{
}

void sub_187007C0C(_Unwind_Exception *a1)
{
}

void sub_187007C24(_Unwind_Exception *a1)
{
}

void sub_187007C3C(_Unwind_Exception *a1)
{
}

void sub_187007C54(_Unwind_Exception *a1)
{
}

void sub_187007C6C(_Unwind_Exception *a1)
{
}

void sub_187007C84(_Unwind_Exception *a1)
{
}

void sub_187007C9C(_Unwind_Exception *a1)
{
}

void sub_187007CB4(_Unwind_Exception *a1)
{
}

void sub_187007CCC(_Unwind_Exception *a1)
{
}

void sub_187007CE4(_Unwind_Exception *a1)
{
}

void sub_187007CFC(_Unwind_Exception *a1)
{
}

void sub_187007D14(_Unwind_Exception *a1)
{
}

void sub_187007D2C(_Unwind_Exception *a1)
{
}

void sub_187007D44(_Unwind_Exception *a1)
{
}

void sub_187007D5C(_Unwind_Exception *a1)
{
}

void sub_187007D74(_Unwind_Exception *a1)
{
}

void sub_187007D8C(_Unwind_Exception *a1)
{
}

void sub_187007DA4(_Unwind_Exception *a1)
{
}

void sub_187007DBC(_Unwind_Exception *a1)
{
}

void sub_187007DD4(_Unwind_Exception *a1)
{
}

void sub_187007DEC(_Unwind_Exception *a1)
{
}

void sub_187007E04(_Unwind_Exception *a1)
{
}

void sub_187007E1C(_Unwind_Exception *a1)
{
}

void sub_187007E34(_Unwind_Exception *a1)
{
}

void sub_187007E4C(_Unwind_Exception *a1)
{
}

void sub_187007E64(_Unwind_Exception *a1)
{
}

void sub_187007E7C(_Unwind_Exception *a1)
{
}

void sub_187007E94(_Unwind_Exception *a1)
{
}

void sub_187007EAC(_Unwind_Exception *a1)
{
}

void sub_187007EC4(_Unwind_Exception *a1)
{
}

void sub_187007EDC(_Unwind_Exception *a1)
{
}

void sub_187007EF4(_Unwind_Exception *a1)
{
}

void sub_187007F0C(_Unwind_Exception *a1)
{
}

void sub_187007F24(_Unwind_Exception *a1)
{
}

void sub_187007F3C(_Unwind_Exception *a1)
{
}

void sub_187007F54(_Unwind_Exception *a1)
{
}

void sub_187007F6C(_Unwind_Exception *a1)
{
}

void sub_187007F84(_Unwind_Exception *a1)
{
}

void sub_187007F9C(_Unwind_Exception *a1)
{
}

void sub_187007FB4(_Unwind_Exception *a1)
{
}

void sub_187007FCC(_Unwind_Exception *a1)
{
}

void sub_187007FE4(_Unwind_Exception *a1)
{
}

void sub_187007FFC(_Unwind_Exception *a1)
{
}

void sub_187008014(_Unwind_Exception *a1)
{
}

void sub_18700802C(_Unwind_Exception *a1)
{
}

void sub_187008044(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

const char *CBProductIDToString_0(int a1)
{
  if (a1 > 21759)
  {
    if (a1 <= 28943)
    {
      if (a1 > 28935)
      {
        if (a1 == 28936) {
          return "AppleTV6,2";
        }
        if (a1 == 28943) {
          return "AudioAccessory1,1";
        }
      }

      else
      {
        if (a1 == 21760) {
          return "Device1,21760";
        }
        if (a1 == 28420) {
          return "AppleTV5,3";
        }
      }
    }

    else if (a1 <= 29714)
    {
      if (a1 == 28944) {
        return "AudioAccessory1,2";
      }
      if (a1 == 29455) {
        return "AppleTV11,2";
      }
    }

    else
    {
      switch(a1)
      {
        case 29715:
          return "AudioAccessory5,1";
        case 65533:
          return "HeGn";
        case 65534:
          return "ApGn";
      }
    }

    return "?";
  }

  if (a1 <= 8193)
  {
    switch(a1)
    {
      case 0:
        return "Invalid";
      case 614:
        return "ATVRemote1,1";
      case 621:
        return "ATVRemote1,2";
    }

    return "?";
  }

  switch(a1)
  {
    case 8194:
      unint64_t result = "AirPods1,1";
      break;
    case 8195:
      unint64_t result = "PowerBeats3,1";
      break;
    case 8197:
      unint64_t result = "BeatsX1,1";
      break;
    case 8198:
      unint64_t result = "BeatsSolo3,1";
      break;
    case 8201:
      unint64_t result = "BeatsStudio3,2";
      break;
    case 8202:
      unint64_t result = "Device1,8202";
      break;
    case 8203:
      unint64_t result = "PowerbeatsPro1,1";
      break;
    case 8204:
      unint64_t result = "BeatsSoloPro1,1";
      break;
    case 8205:
      unint64_t result = "Powerbeats4,1";
      break;
    case 8206:
      unint64_t result = "AirPodsPro1,1";
      break;
    case 8207:
      unint64_t result = "AirPods1,3";
      break;
    case 8208:
      unint64_t result = "Device1,8208";
      break;
    case 8209:
      unint64_t result = "BeatsStudioBuds1,1";
      break;
    case 8210:
      unint64_t result = "Device1,8210";
      break;
    case 8211:
      unint64_t result = "Device1,8211";
      break;
    case 8212:
      unint64_t result = "Device1,8212";
      break;
    case 8213:
      unint64_t result = "Device1,8213";
      break;
    case 8214:
      unint64_t result = "BeatsStudioBuds1,2";
      break;
    case 8215:
      unint64_t result = "BeatsStudioPro1,1";
      break;
    case 8216:
      unint64_t result = "Device1,8216";
      break;
    case 8217:
      unint64_t result = "Device1,8217";
      break;
    case 8218:
      unint64_t result = "Device1,8218";
      break;
    case 8219:
      unint64_t result = "Device1,8219";
      break;
    case 8220:
      unint64_t result = "Device1,8220";
      break;
    case 8221:
      unint64_t result = "Device1,8221";
      break;
    case 8222:
      unint64_t result = "Device1,8222";
      break;
    case 8223:
      unint64_t result = "Device1,8223";
      break;
    case 8224:
      unint64_t result = "Device1,8224";
      break;
    case 8228:
      unint64_t result = "Device1,8228";
      break;
    case 8229:
      unint64_t result = "Device1,8229";
      break;
    case 8230:
      unint64_t result = "Device1,8230";
      break;
    default:
      return "?";
  }

  return result;
}

id CBProductIDToNSLocalizedProductNameString(uint64_t a1)
{
  if ((int)a1 > 776)
  {
    if ((int)a1 <= 8212)
    {
      switch((int)a1)
      {
        case 777:
          [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v2 = v1;
          size_t v3 = @"apple_wireless_mouse";
          goto LABEL_20;
        case 780:
          [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v2 = v1;
          size_t v3 = @"apple_mighty_mouse";
          goto LABEL_20;
        case 781:
        case 803:
LABEL_6:
          [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v2 = v1;
          size_t v3 = @"apple_magic_mouse";
          goto LABEL_20;
        case 782:
        case 804:
LABEL_11:
          [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v2 = v1;
          size_t v3 = @"apple_magic_trackpad";
          goto LABEL_20;
        case 800:
LABEL_12:
          [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v2 = v1;
          size_t v3 = @"apple_magic_keyboard";
          goto LABEL_20;
        case 801:
LABEL_13:
          [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v2 = v1;
          size_t v3 = @"apple_magic_keyboard_touch";
          goto LABEL_20;
        case 802:
LABEL_14:
          [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v2 = v1;
          size_t v3 = @"apple_magic_keyboard_touch_keypad";
          goto LABEL_20;
        default:
          goto LABEL_21;
      }
    }

    if ((_DWORD)a1 == 8220 || (_DWORD)a1 == 8216 || (_DWORD)a1 == 8213)
    {
      [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v2 = v1;
      size_t v3 = @"apple_airpods_case";
LABEL_20:
      [v1 localizedStringForKey:v3 value:&stru_189FB61A8 table:@"CBLocalizable"];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }

    else
    {
LABEL_21:
      +[CBProductInfo productInfoWithProductID:](&OBJC_CLASS___CBProductInfo, "productInfoWithProductID:", a1);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 productName];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
  }

  else
  {
    switch((int)a1)
    {
      case 520:
      case 521:
      case 522:
      case 556:
      case 557:
      case 558:
      case 569:
      case 570:
      case 571:
      case 597:
      case 598:
      case 599:
        [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
        uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v2 = v1;
        size_t v3 = @"apple_wireless_keyboard";
        goto LABEL_20;
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:
      case 531:
      case 532:
      case 533:
      case 534:
      case 535:
      case 536:
      case 537:
      case 538:
      case 539:
      case 540:
      case 541:
      case 542:
      case 543:
      case 544:
      case 545:
      case 546:
      case 547:
      case 548:
      case 549:
      case 550:
      case 551:
      case 552:
      case 553:
      case 554:
      case 555:
      case 559:
      case 560:
      case 561:
      case 562:
      case 563:
      case 564:
      case 565:
      case 566:
      case 567:
      case 568:
      case 572:
      case 573:
      case 574:
      case 575:
      case 576:
      case 577:
      case 578:
      case 579:
      case 580:
      case 581:
      case 582:
      case 583:
      case 584:
      case 585:
      case 586:
      case 587:
      case 588:
      case 589:
      case 590:
      case 591:
      case 592:
      case 593:
      case 594:
      case 595:
      case 596:
      case 600:
      case 601:
      case 602:
      case 603:
      case 604:
      case 605:
      case 606:
      case 607:
      case 608:
      case 609:
      case 610:
      case 611:
      case 612:
      case 614:
      case 616:
      case 618:
      case 619:
      case 621:
      case 622:
      case 623:
      case 624:
      case 625:
      case 626:
      case 627:
      case 628:
      case 629:
      case 630:
      case 631:
      case 632:
      case 633:
      case 634:
      case 635:
      case 636:
      case 637:
      case 638:
      case 639:
      case 640:
      case 641:
      case 642:
      case 643:
      case 644:
      case 645:
      case 646:
      case 647:
      case 648:
      case 649:
      case 650:
      case 651:
      case 652:
      case 653:
      case 654:
      case 655:
      case 656:
      case 657:
      case 658:
      case 659:
      case 660:
      case 661:
      case 662:
      case 663:
      case 664:
      case 665:
      case 667:
      case 669:
      case 670:
        goto LABEL_21;
      case 613:
        goto LABEL_11;
      case 615:
      case 668:
        goto LABEL_12;
      case 617:
        goto LABEL_6;
      case 620:
        [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
        uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v2 = v1;
        size_t v3 = @"apple_magic_keyboard_keypad";
        goto LABEL_20;
      case 666:
        goto LABEL_13;
      case 671:
        goto LABEL_14;
      default:
        if ((_DWORD)a1) {
          goto LABEL_21;
        }
        id result = 0LL;
        break;
    }
  }

  return result;
}

LABEL_36:
        goto LABEL_37;
      }
    }

    else
    {
      self->_changedTypesInternal.bitArray[0] |= 0x10u;
      if ((v26 & 1) == 0) {
        goto LABEL_14;
      }
      self->_changedTypesInternal.bitArray[2] |= 8u;
    }

    self->_discoveryTypesInternal.bitArray[2] |= 8u;
    self->_nearbyInfoV2Flags |= 4u;
    goto LABEL_14;
  }

  if (a4 - v5 <= 0) {
    uint64_t v11 = 0;
  }
  if (!v11)
  {
    id v19 = 0LL;
    if (!-[CBDevice heySiriRandom](self, "heySiriRandom")) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }

  uint64_t v20 = *(unsigned __int8 *)v5++;
  id v19 = v20;
  if (v20 != -[CBDevice heySiriRandom](self, "heySiriRandom"))
  {
LABEL_42:
    -[CBDevice setHeySiriRandom:](self, "setHeySiriRandom:", v19);
    v9 |= 0x400000000000000uLL;
  }

  self->_airdropHash1 = v13;
  uint64_t v24 = -[CBDevice airdropHash2](self, "airdropHash2");
  uint64_t v21 = v25;
  if (v25 == v24)
  {
LABEL_25:
    if (v14 == -[CBDevice airdropHash3](self, "airdropHash3")) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }

  CUXPCDecodeNSDataOfLength();
  CUXPCDecodeNSDataOfLength();
  objc_opt_class();
  uint64_t v24 = v13;
LABEL_38:

  return v24;
}

LABEL_37:
  v6[2](v6);
  _Block_object_dispose(&v57, 8);
}

  if (a4 - v5 <= 0) {
    uint64_t v12 = 0;
  }
  if (!v12)
  {
    v23 = 0;
    goto LABEL_44;
  }

  uint64_t v24 = *v5++;
  v23 = v24;
  if (v24 != -1)
  {
    if (v23 < 0)
    {
      uint64_t v25 = 256;
      goto LABEL_45;
    }

  self->_airdropHash2 = v21;
  if (v14 == -[CBDevice airdropHash3](self, "airdropHash3"))
  {
LABEL_26:
    if (v15 == -[CBDevice airdropHash4](self, "airdropHash4")) {
      goto LABEL_27;
    }
LABEL_39:
    self->_airdropHash4 = v15;
    if (v16 == -[CBDevice airdropConfigData](self, "airdropConfigData")) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

void sub_18700A8E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_18700A944(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

LABEL_11:
  uint64_t v13 = [v4 adaptiveVolumeCapability];
  if (v13 && v13 != self->_adaptiveVolumeCapability)
  {
    self->_adaptiveVolumeCapability = v13;
    uint64_t v12 = 0x80000000000LL;
  }

  uint64_t v14 = [v4 adaptiveVolumeConfig];
  if ((_DWORD)v14)
  {
    uint64_t v15 = v14;
    if ((_DWORD)v14 != -[CBDevice adaptiveVolumeConfig](self, "adaptiveVolumeConfig"))
    {
      -[CBDevice setAdaptiveVolumeConfig:](self, "setAdaptiveVolumeConfig:", v15);
      uint64_t v12 = 0x80000000000LL;
    }
  }

  uint64_t v16 = [v4 appearanceValue];
  if ((_DWORD)v16)
  {
    uint64_t v17 = v16;
    if ((_DWORD)v16 != -[CBDevice appearanceValue](self, "appearanceValue"))
    {
      -[CBDevice setAppearanceValue:](self, "setAppearanceValue:", v17);
      uint64_t v12 = 0x80000000000LL;
    }
  }

  uint64_t v18 = [v4 audioStreamState];
  if (v18 && v18 != self->_audioStreamState)
  {
    self->_audioStreamState = v18;
    v12 |= 0x80000000000uLL;
  }

  id v19 = v5 & 0x84;
  uint64_t v20 = [v4 autoAncCapability];
  if (v20 && v20 != self->_autoAncCapability)
  {
    self->_autoAncCapability = v20;
    v12 |= 0x80000000000uLL;
  }

  if ((v5 & 0x84) == 0 && ([v4 discoveryFlags] & 0x80) == 0) {
    goto LABEL_33;
  }
  uint64_t v21 = [v4 batteryInfoMain];
  if (v21 == self->_batteryInfoMain)
  {
    v22 = [v4 batteryInfoLeft];
    if (v22 == self->_batteryInfoLeft) {
      goto LABEL_30;
    }
LABEL_39:
    self->_batteryInfoLeft = v22;
    v12 |= 0x80000000000uLL;
    v23 = [v4 batteryInfoRight];
    if (v23 == self->_batteryInfoRight)
    {
LABEL_31:
      uint64_t v24 = [v4 batteryInfoCase];
      if (v24 == self->_batteryInfoCase) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }

    goto LABEL_40;
  }

  self->_batteryInfoMain = v21;
  v12 |= 0x80000000000uLL;
  v22 = [v4 batteryInfoLeft];
  if (v22 != self->_batteryInfoLeft) {
    goto LABEL_39;
  }
LABEL_30:
  v23 = [v4 batteryInfoRight];
  if (v23 == self->_batteryInfoRight) {
    goto LABEL_31;
  }
LABEL_40:
  self->_batteryInfoRight = v23;
  v12 |= 0x80000000000uLL;
  uint64_t v24 = [v4 batteryInfoCase];
  if (v24 != self->_batteryInfoCase)
  {
LABEL_32:
    self->_batteryInfoCase = v24;
    v12 |= 0x80000000000uLL;
  }

  v23 = 0LL;
  if ((v8 & 0x10) == 0) {
    goto LABEL_18;
  }
LABEL_12:
  if (a4 - v5 > 2 && v7)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v5 length:3];
    if ((v8 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_19;
  }

LABEL_33:
  [v4 bleAddressData];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v25;
  if (!v25) {
    goto LABEL_46;
  }
  bleAddressData = self->_bleAddressData;
  uint64_t v27 = v25;
  uint64_t v28 = bleAddressData;
  if (v27 == v28)
  {

    goto LABEL_46;
  }

  uint64_t v29 = v28;
  if (v28)
  {
    uint64_t v30 = -[NSData isEqual:](v27, "isEqual:", v28);

    if ((v30 & 1) != 0) {
      goto LABEL_45;
    }
  }

  else
  {
  }

  objc_storeStrong((id *)&self->_bleAddressData, obj);
  v12 |= 0x80000000000uLL;
LABEL_45:
  LOBYTE(v5) = v349;
LABEL_46:
  [v4 bleAdvertisementData];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  v331 = v31;
  if (v31)
  {
    bleAdvertisementData = self->_bleAdvertisementData;
    uint64_t v33 = v31;
    uint64_t v34 = bleAdvertisementData;
    if (v33 != v34)
    {
      uint64_t v35 = v34;
      if (v34)
      {
        uint64_t v36 = -[NSData isEqual:](v33, "isEqual:", v34);

        if ((v36 & 1) != 0) {
          goto LABEL_54;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_bleAdvertisementData, v331);
      v12 |= 0x40000000uLL;
LABEL_54:
      LOBYTE(v5) = v349;
      goto LABEL_55;
    }
  }

LABEL_78:
    v12 |= 0x1000000000000uLL;
    goto LABEL_79;
  }

LABEL_80:
  [v4 btAddressData];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v330 = v49;
  if (v49)
  {
    btAddressData = self->_btAddressData;
    __int128 v51 = v49;
    uint64_t v52 = btAddressData;
    if (v51 == v52)
    {
    }

    else
    {
      v53 = v52;
      if (!v52)
      {

        goto LABEL_94;
      }

      v54 = -[NSData isEqual:](v51, "isEqual:", v52);

      if ((v54 & 1) == 0)
      {
LABEL_94:
        objc_storeStrong((id *)&self->_btAddressData, v330);
        v12 |= 0x80000000000uLL;
        v55 = [v4 btVersion];
        v323 = (void *)v55;
        if (!v55) {
          goto LABEL_102;
        }
        goto LABEL_95;
      }
    }
  }

  v55 = [v4 btVersion];
  v323 = (void *)v55;
  if (!v55) {
    goto LABEL_102;
  }
LABEL_95:
  v56 = (void *)v55;
  v57 = -[CBDevice btVersion](self, "btVersion");
  v58 = v56;
  v59 = v57;
  if (v58 == v59)
  {

    goto LABEL_102;
  }

  v60 = v59;
  if (!v59)
  {

    goto LABEL_101;
  }

  v61 = [v58 isEqual:v59];

  if ((v61 & 1) == 0)
  {
LABEL_101:
    -[CBDevice setBtVersion:](self, "setBtVersion:", v58);
    v12 |= 0x80000000000uLL;
  }

LABEL_160:
    self->_deviceFlags |= 0x80uLL;
    goto LABEL_161;
  }

  if (([v4 deviceFlags] & 0x80) != 0) {
    goto LABEL_160;
  }
LABEL_162:
  if (v19)
  {
    v94 = [v4 deviceType];
    if (v94 != self->_deviceType)
    {
      self->_deviceType = v94;
      v12 |= 0x80000000000uLL;
    }
  }

  [v4 dockKitAccessoryPayloadData];
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 2) == 0) {
    goto LABEL_171;
  }
  v95 = -[CBDevice dockKitAccessoryPayloadData](self, "dockKitAccessoryPayloadData");
  v96 = v345;
  v97 = v95;
  if (v96 == v97)
  {

    goto LABEL_171;
  }

  v98 = v97;
  if ((v96 == 0LL) == (v97 != 0LL))
  {

    goto LABEL_175;
  }

  v99 = [v96 isEqual:v97];

  if ((v99 & 1) != 0)
  {
LABEL_171:
    v100 = [v4 doubleTapActionLeft];
    if (!v100) {
      goto LABEL_176;
    }
    goto LABEL_172;
  }

LABEL_175:
  -[CBDevice setDockKitAccessoryPayloadData:](self, "setDockKitAccessoryPayloadData:", v96);
  self->_changedTypesInternal.bitArray[1] |= 0x10u;
  v100 = [v4 doubleTapActionLeft];
  if (!v100) {
    goto LABEL_176;
  }
LABEL_172:
  if (self->_doubleTapActionLeft != v100)
  {
    self->_doubleTapActionLeft = v100;
    v12 |= 0x80000000000uLL;
  }

LABEL_176:
  v101 = [v4 doubleTapActionRight];
  if (v101 && self->_doubleTapActionRight != v101)
  {
    self->_doubleTapActionRight = v101;
    v12 |= 0x80000000000uLL;
  }

  v102 = [v4 doubleTapCapability];
  if (v102 && self->_doubleTapCapability != v102)
  {
    self->_doubleTapCapability = v102;
    v12 |= 0x80000000000uLL;
  }

  v103 = discoveryFlags;
  if ((v5 & 0x80) != 0)
  {
    v103 = discoveryFlags & 0xFFFBFFFFFFFFFFFFLL | ((((unint64_t)[v4 discoveryFlags] >> 50) & 1) << 50);
    if ((v5 & 4) == 0)
    {
LABEL_184:
      if (v103 == discoveryFlags) {
        goto LABEL_185;
      }
LABEL_189:
      self->_discoveryFlags = v103;
      v12 |= 0x800000000uLL;
      if ((v5 & 2) == 0) {
        goto LABEL_196;
      }
LABEL_190:
      v104 = [v4 dsInfoVehicleConfidence];
      if ((_DWORD)v104)
      {
        v105 = v104;
        if ((_DWORD)v104 != -[CBDevice dsInfoVehicleConfidence](self, "dsInfoVehicleConfidence"))
        {
          -[CBDevice setDsInfoVehicleConfidence:](self, "setDsInfoVehicleConfidence:", v105);
          v12 |= 0x800000000000000uLL;
        }
      }

      v106 = [v4 dsInfoVehicleState];
      if ((_DWORD)v106)
      {
        v107 = v106;
        if ((_DWORD)v106 != -[CBDevice dsInfoVehicleState](self, "dsInfoVehicleState"))
        {
          -[CBDevice setDsInfoVehicleState:](self, "setDsInfoVehicleState:", v107);
          v12 |= 0x800000000000000uLL;
        }
      }

      goto LABEL_196;
    }
  }

  else if ((v5 & 4) == 0)
  {
    goto LABEL_184;
  }

  v103 = [v4 discoveryFlags] & 0xA00000 | v103 & 0xFFFFFFFFFF5FFFFFLL;
  if (v103 != discoveryFlags) {
    goto LABEL_189;
  }
LABEL_185:
  if ((v5 & 2) != 0) {
    goto LABEL_190;
  }
LABEL_196:
  v108 = [v4 endCallCapability];
  if (v108 && v108 != self->_endCallCapability)
  {
    self->_endCallCapability = v108;
    v12 |= 0x80000000000uLL;
  }

  v109 = [v4 endCallConfig];
  if ((_DWORD)v109)
  {
    v110 = v109;
    if ((_DWORD)v109 != -[CBDevice endCallConfig](self, "endCallConfig"))
    {
      -[CBDevice setEndCallConfig:](self, "setEndCallConfig:", v110);
      v12 |= 0x80000000000uLL;
    }
  }

  v111 = [v4 fidoPayloadData];
  v340 = (void *)v111;
  if ((v5 & 2) == 0) {
    goto LABEL_208;
  }
  v112 = (void *)v111;
  v113 = -[CBDevice fidoPayloadData](self, "fidoPayloadData");
  v114 = v112;
  v115 = v113;
  if (v114 == v115)
  {

    goto LABEL_208;
  }

  v116 = v115;
  if ((v114 == 0LL) == (v115 != 0LL))
  {

    goto LABEL_216;
  }

  v117 = [v114 isEqual:v115];

  if ((v117 & 1) != 0)
  {
LABEL_208:
    v118 = [v4 findMyCaseIdentifier];
    v322 = (void *)v118;
    if (!v118) {
      goto LABEL_217;
    }
    goto LABEL_209;
  }

LABEL_216:
  -[CBDevice setFidoPayloadData:](self, "setFidoPayloadData:", v114);
  v12 |= 0x8000000000000uLL;
  v118 = [v4 findMyCaseIdentifier];
  v322 = (void *)v118;
  if (!v118) {
    goto LABEL_217;
  }
LABEL_209:
  v119 = (void *)v118;
  v120 = -[CBDevice findMyCaseIdentifier](self, "findMyCaseIdentifier");
  v121 = v119;
  v122 = v120;
  if (v121 == v122)
  {

    v125 = [v4 findMyGroupIdentifier];
    v321 = (void *)v125;
    if (!v125) {
      goto LABEL_226;
    }
    goto LABEL_221;
  }

  v123 = v122;
  if (!v122)
  {

LABEL_220:
    -[CBDevice setFindMyCaseIdentifier:](self, "setFindMyCaseIdentifier:", v121);
    v12 |= 0x80000000000uLL;
    v125 = [v4 findMyGroupIdentifier];
    v321 = (void *)v125;
    if (!v125) {
      goto LABEL_226;
    }
    goto LABEL_221;
  }

  v124 = [v121 isEqual:v122];

  if ((v124 & 1) == 0) {
    goto LABEL_220;
  }
LABEL_217:
  v125 = [v4 findMyGroupIdentifier];
  v321 = (void *)v125;
  if (!v125)
  {
LABEL_226:
    v132 = [v4 frequencyBand];
    if (!(_DWORD)v132) {
      goto LABEL_232;
    }
    goto LABEL_230;
  }

LABEL_221:
  v126 = (void *)v125;
  v127 = -[CBDevice findMyGroupIdentifier](self, "findMyGroupIdentifier");
  v128 = v126;
  v129 = v127;
  if (v128 == v129)
  {

    goto LABEL_226;
  }

  v130 = v129;
  if (v129)
  {
    v131 = [v128 isEqual:v129];

    if ((v131 & 1) != 0) {
      goto LABEL_226;
    }
  }

  else
  {
  }

  -[CBDevice setFindMyGroupIdentifier:](self, "setFindMyGroupIdentifier:", v128);
  v12 |= 0x80000000000uLL;
  v132 = [v4 frequencyBand];
  if (!(_DWORD)v132) {
    goto LABEL_232;
  }
LABEL_230:
  v133 = v132;
  if ((_DWORD)v132 != -[CBDevice frequencyBand](self, "frequencyBand"))
  {
    -[CBDevice setFrequencyBand:](self, "setFrequencyBand:", v133);
    v12 |= 0x80000000000uLL;
  }

LABEL_232:
  v134 = [v4 gapaFlags];
  if ((_DWORD)v134 != -[CBDevice gapaFlags](self, "gapaFlags"))
  {
    -[CBDevice setGapaFlags:](self, "setGapaFlags:", v134);
    v12 |= 0x80000000000uLL;
  }

  v135 = [v4 gfpPayloadData];
  v339 = (void *)v135;
  if ((v5 & 2) != 0)
  {
    v136 = (void *)v135;
    v137 = -[CBDevice gfpPayloadData](self, "gfpPayloadData");
    v138 = v136;
    v139 = v137;
    if (v138 == v139)
    {
    }

    else
    {
      v140 = v139;
      if ((v138 == 0LL) != (v139 != 0LL))
      {
        v141 = [v138 isEqual:v139];

        if ((v141 & 1) != 0)
        {
LABEL_245:
          v143 = 0LL;
          if (!-[CBDevice gfpModelID](self, "gfpModelID")) {
            goto LABEL_247;
          }
          goto LABEL_246;
        }
      }

      else
      {
      }

      -[CBDevice setGfpPayloadData:](self, "setGfpPayloadData:", v138);
      v12 |= 0x40000000000000uLL;
    }

LABEL_239:
    v142 = (unsigned __int8 *)[v138 bytes];
    v143 = (*v142 << 16) | (v142[1] << 8) | v142[2];
    if ((_DWORD)v143 == -[CBDevice gfpModelID](self, "gfpModelID")) {
      goto LABEL_247;
    }
LABEL_246:
    -[CBDevice setGfpModelID:](self, "setGfpModelID:", v143);
    v12 |= 0x40000000000000uLL;
  }

LABEL_247:
  [v4 firmwareVersion];
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v337 = v144;
  if (![v144 length]) {
    goto LABEL_251;
  }
  firmwareVersion = self->_firmwareVersion;
  v146 = v144;
  v147 = firmwareVersion;
  if (v146 != v147)
  {
    v148 = v147;
    if ((v146 == 0LL) != (v147 != 0LL))
    {
      v149 = -[NSString isEqual:](v146, "isEqual:", v147);

      if ((v149 & 1) != 0)
      {
LABEL_251:
        [v4 identifier];
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v327 = v150;
        if (!v150) {
          goto LABEL_260;
        }
        goto LABEL_257;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_firmwareVersion, v337);
    v12 |= 0x80000000000uLL;
    [v4 identifier];
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v327 = v150;
    if (!v150) {
      goto LABEL_260;
    }
    goto LABEL_257;
  }

  [v4 identifier];
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v327 = v150;
  if (!v150)
  {
LABEL_260:
    v156 = [v4 idsDeviceID];
    v326 = (id)v156;
    if (!v156) {
      goto LABEL_271;
    }
    goto LABEL_266;
  }

LABEL_266:
  v157 = (void *)v156;
  v158 = self->_idsDeviceID;
  v159 = v157;
  v160 = v159;
  if (v158 == v159)
  {

    goto LABEL_271;
  }

  if (v158)
  {
    v161 = -[NSString isEqual:](v158, "isEqual:", v159);

    if ((v161 & 1) != 0) {
      goto LABEL_271;
    }
  }

  else
  {
  }

  objc_storeStrong((id *)&self->_idsDeviceID, v326);
  v12 |= 0x80000000000uLL;
  v162 = [v4 interval];
  if (!v162) {
    goto LABEL_277;
  }
LABEL_275:
  v163 = v162;
  if (v162 != -[CBDevice interval](self, "interval"))
  {
    self->_interval = v163;
    v12 |= 0x80000000000uLL;
  }

LABEL_277:
  v164 = [v4 lastSeenTicks];
  if (v164 > self->_lastSeenTicks) {
    self->_lastSeenTicks = v164;
  }
  v165 = [v4 listeningMode];
  if ((_DWORD)v165)
  {
    v166 = v165;
    if ((_DWORD)v165 != -[CBDevice listeningMode](self, "listeningMode"))
    {
      -[CBDevice setListeningMode:](self, "setListeningMode:", v166);
      v12 |= 0x80000000000uLL;
    }
  }

  v167 = [v4 listeningModeConfigs];
  if ((_DWORD)v167)
  {
    v168 = v167;
    if ((_DWORD)v167 != -[CBDevice listeningModeConfigs](self, "listeningModeConfigs"))
    {
      -[CBDevice setListeningModeConfigs:](self, "setListeningModeConfigs:", v168);
      v12 |= 0x80000000000uLL;
    }
  }

  v169 = [v4 microphoneMode];
  if (v169 && self->_microphoneMode != v169)
  {
    self->_microphoneMode = v169;
    v12 |= 0x80000000000uLL;
  }

  [v4 model];
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v336 = v170;
  if ([v170 length])
  {
    model = self->_model;
    v172 = v170;
    v173 = model;
    if (v172 == v173)
    {

      goto LABEL_296;
    }

    v174 = v173;
    if ((v172 == 0LL) != (v173 != 0LL))
    {
      v175 = -[NSString isEqual:](v172, "isEqual:", v173);

      if ((v175 & 1) != 0) {
        goto LABEL_296;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_model, v336);
    v12 |= 0x80000000000uLL;
  }

LABEL_296:
  [v4 modelUser];
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v320 = v176;
  if (![v176 length]) {
    goto LABEL_300;
  }
  v177 = -[CBDevice modelUser](self, "modelUser");
  v178 = v176;
  v179 = v177;
  if (v178 == v179)
  {

    v182 = [v4 muteControlCapability];
    muteControlCapability = self->_muteControlCapability;
    if (!v182) {
      goto LABEL_307;
    }
  }

  else
  {
    v180 = v179;
    if ((v178 == 0LL) == (v179 != 0LL))
    {
    }

    else
    {
      v181 = [v178 isEqual:v179];

      if ((v181 & 1) != 0)
      {
LABEL_300:
        v182 = [v4 muteControlCapability];
        muteControlCapability = self->_muteControlCapability;
        if (v182) {
          goto LABEL_301;
        }
LABEL_307:
        if (!muteControlCapability) {
          goto LABEL_310;
        }
        goto LABEL_308;
      }
    }

    -[CBDevice setModelUser:](self, "setModelUser:", v178);
    v12 |= 0x80000000000uLL;
    v182 = [v4 muteControlCapability];
    muteControlCapability = self->_muteControlCapability;
    if (!v182) {
      goto LABEL_307;
    }
  }

LABEL_301:
  if (v182 != muteControlCapability)
  {
    self->_muteControlCapability = v182;
    v12 |= 0x80000000000uLL;
  }

LABEL_308:
  if (self->_endCallCapability)
  {
    self->_endCallCapability = 0;
    v12 |= 0x80000000000uLL;
  }

LABEL_310:
  v184 = [v4 muteControlConfig];
  if ((_DWORD)v184)
  {
    v185 = v184;
    if ((_DWORD)v184 != -[CBDevice muteControlConfig](self, "muteControlConfig"))
    {
      -[CBDevice setMuteControlConfig:](self, "setMuteControlConfig:", v185);
      v12 |= 0x80000000000uLL;
    }
  }

  [v4 name];
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 leAdvName];
  v348 = (NSString *)objc_claimAutoreleasedReturnValue();
  v341 = v186;
  if ([v186 length])
  {
    name = self->_name;
    v188 = v186;
    v189 = name;
    if (v188 == v189)
    {
    }

    else
    {
      v190 = v189;
      if ((v188 == 0LL) == (v189 != 0LL))
      {
      }

      else
      {
        v191 = -[NSString isEqual:](v188, "isEqual:", v189);

        if ((v191 & 1) != 0) {
          goto LABEL_322;
        }
      }

      if ((v5 & 2) == 0)
      {
        p_name = &self->_name;
LABEL_325:
        v193 = v188;
        v194 = *p_name;
        *p_name = v193;

        v12 |= 0x80000000000uLL;
        goto LABEL_326;
      }
    }
  }

LABEL_322:
  if (!self->_name)
  {
    v188 = v348;
    if (-[NSString length](v348, "length"))
    {
      objc_storeStrong((id *)&self->_name, v348);
      p_name = &self->_leAdvName;
      goto LABEL_325;
    }
  }

LABEL_326:
  if (!v19) {
    goto LABEL_331;
  }
  v195 = [v4 primaryBudSide];
  if ((_DWORD)v195 == -[CBDevice primaryBudSide](self, "primaryBudSide"))
  {
    v196 = [v4 primaryPlacement];
    if (v196 == self->_primaryPlacement) {
      goto LABEL_329;
    }
LABEL_344:
    self->_primaryPlacement = v196;
    v12 |= 0x80000000000uLL;
    v197 = [v4 secondaryPlacement];
    if (v197 == self->_secondaryPlacement) {
      goto LABEL_331;
    }
    goto LABEL_330;
  }

  -[CBDevice setPrimaryBudSide:](self, "setPrimaryBudSide:", v195);
  v12 |= 0x80000000000uLL;
  v196 = [v4 primaryPlacement];
  if (v196 != self->_primaryPlacement) {
    goto LABEL_344;
  }
LABEL_329:
  v197 = [v4 secondaryPlacement];
  if (v197 != self->_secondaryPlacement)
  {
LABEL_330:
    self->_secondaryPlacement = v197;
    v12 |= 0x80000000000uLL;
  }

LABEL_331:
  v198 = [v4 placementMode];
  if (v198 && self->_placementMode != v198)
  {
    self->_placementMode = v198;
    v12 |= 0x80000000000uLL;
  }

  v199 = [v4 productID];
  if (v199 && v199 != self->_productID)
  {
    self->_productID = v199;
    v12 |= 0x80000000000uLL;
  }

  [v4 proximityServiceData];
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v317 = discoveryFlags;
  v325 = v200;
  if ((v5 & 2) == 0 && !v200) {
    goto LABEL_347;
  }
  proximityServiceData = self->_proximityServiceData;
  v202 = v200;
  v203 = proximityServiceData;
  if (v202 == v203)
  {

    goto LABEL_347;
  }

  v204 = v203;
  if ((v202 == 0LL) != (v203 != 0LL))
  {
    v205 = -[NSData isEqual:](v202, "isEqual:", v203);

    if ((v205 & 1) == 0) {
      goto LABEL_349;
    }
LABEL_347:
    v347 = 0;
    goto LABEL_352;
  }

LABEL_349:
  objc_storeStrong((id *)&self->_proximityServiceData, v325);
  v12 |= 0x80000000uLL;
  self->_discoveryFlags &= 0xFFFFFFFE7FFFFFFFLL;
  v206 = CBDiscoveryTypesProximityService();
  CBDiscoveryTypesRemoveTypes(self->_discoveryTypesInternal.bitArray, v206);
  if (v325) {
    -[CBDevice _parseProximityServiceData:](self, "_parseProximityServiceData:", v202);
  }
  v347 = 1;
LABEL_352:
  [v4 safetyAlertsAlertData];
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  safetyAlertsAlertData = self->_safetyAlertsAlertData;
  v209 = v207;
  v210 = safetyAlertsAlertData;
  v211 = v209 != v210;
  if (v209 == v210)
  {

    v214 = v209;
  }

  else
  {
    v212 = v210;
    if ((v209 == 0LL) != (v210 != 0LL))
    {
      v213 = -[NSData isEqual:](v209, "isEqual:", v210);

      if ((v213 & 1) != 0)
      {
        v211 = 0;
        goto LABEL_360;
      }
    }

    else
    {
    }

    v215 = v209;
    v214 = self->_safetyAlertsAlertData;
    self->_safetyAlertsAlertData = v215;
  }

LABEL_360:
  [v4 safetyAlertsAlertID];
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  safetyAlertsAlertID = self->_safetyAlertsAlertID;
  v218 = v216;
  v219 = safetyAlertsAlertID;
  v220 = v218;
  if (v218 == v219)
  {

    v223 = v218;
LABEL_367:

    goto LABEL_368;
  }

  v221 = v219;
  if ((v220 == 0LL) == (v219 != 0LL))
  {

    goto LABEL_366;
  }

  v222 = -[NSData isEqual:](v220, "isEqual:", v219);

  if ((v222 & 1) == 0)
  {
LABEL_366:
    v224 = v220;
    v223 = self->_safetyAlertsAlertID;
    self->_safetyAlertsAlertID = v224;
    v211 = 1;
    goto LABEL_367;
  }

LABEL_368:
  v346 = v220;
  v344 = v209;
  [v4 safetyAlertsSignature];
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  safetyAlertsSignature = self->_safetyAlertsSignature;
  v227 = v225;
  v228 = safetyAlertsSignature;
  v343 = v227;
  if (v227 == v228)
  {

    v232 = [v4 safetyAlertsVersion];
    p_safetyAlertsVersion = &self->_safetyAlertsVersion;
    if (v232 == self->_safetyAlertsVersion) {
      goto LABEL_374;
    }
    goto LABEL_379;
  }

  v229 = v228;
  if ((v227 == 0LL) != (v228 != 0LL))
  {
    v230 = v227;
    v231 = -[NSData isEqual:](v227, "isEqual:", v228);

    if (v231)
    {
      v232 = [v4 safetyAlertsVersion];
      p_safetyAlertsVersion = &self->_safetyAlertsVersion;
      if (v232 != self->_safetyAlertsVersion) {
        goto LABEL_379;
      }
LABEL_374:
      v234 = v349;
      v236 = v343;
      v235 = v344;
      if (!v211) {
        goto LABEL_381;
      }
      goto LABEL_380;
    }
  }

  else
  {
  }

  objc_storeStrong((id *)&self->_safetyAlertsSignature, v225);
  v232 = [v4 safetyAlertsVersion];
  p_safetyAlertsVersion = &self->_safetyAlertsVersion;
  if (v232 != self->_safetyAlertsVersion)
  {
LABEL_379:
    v234 = v349;
    v236 = v343;
    v235 = v344;
    *p_safetyAlertsVersion = v232;
    goto LABEL_380;
  }

  v234 = v349;
  v236 = v343;
  v235 = v344;
LABEL_380:
  self->_changedTypesInternal.bitArray[3] |= 0x40u;
  v347 = 1;
LABEL_381:
  if (v232) {
    v237 = v236 == 0LL;
  }
  else {
    v237 = 1;
  }
  if (v237 || v346 == 0LL || v235 == 0LL) {
    v240 = 0;
  }
  else {
    v240 = 64;
  }
  self->_discoveryTypesInternal.bitArray[3] = self->_discoveryTypesInternal.bitArray[3] & 0xBF | v240;
  [v4 safetyAlertsSegmentServiceData];
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v242 = v241;
  if ((v234 & 0x4000) == 0) {
    goto LABEL_399;
  }
  safetyAlertsSegmentServiceData = self->_safetyAlertsSegmentServiceData;
  v244 = v241;
  v245 = safetyAlertsSegmentServiceData;
  if (v244 == v245)
  {

    goto LABEL_399;
  }

  v246 = v245;
  if ((v244 == 0LL) == (v245 != 0LL))
  {

    goto LABEL_403;
  }

  v247 = -[NSData isEqual:](v244, "isEqual:", v245);

  if ((v247 & 1) != 0)
  {
LABEL_399:
    v248 = [v4 selectiveSpeechListeningCapability];
    if (!v248) {
      goto LABEL_406;
    }
    goto LABEL_400;
  }

LABEL_403:
  objc_storeStrong((id *)&self->_safetyAlertsSegmentServiceData, v242);
  self->_changedTypesInternal.bitArray[3] |= 0x40u;
  self->_discoveryTypesInternal.bitArray[3] &= ~0x40u;
  if (v244) {
    -[CBDevice _parseSafetyAlertsSegmentServiceData:](self, "_parseSafetyAlertsSegmentServiceData:", v244);
  }
  v347 = 1;
  v248 = [v4 selectiveSpeechListeningCapability];
  if (v248)
  {
LABEL_400:
    if (v248 != self->_selectiveSpeechListeningCapability)
    {
      self->_selectiveSpeechListeningCapability = v248;
      v12 |= 0x80000000000uLL;
    }
  }

LABEL_406:
  v249 = [v4 selectiveSpeechListeningConfig];
  if ((_DWORD)v249)
  {
    v250 = v249;
    if ((_DWORD)v249 != -[CBDevice selectiveSpeechListeningConfig](self, "selectiveSpeechListeningConfig"))
    {
      -[CBDevice setSelectiveSpeechListeningConfig:](self, "setSelectiveSpeechListeningConfig:", v250);
      v12 |= 0x80000000000uLL;
    }
  }

  v251 = [v4 hearingAidSupport];
  if (v251 && self->_hearingAidSupport != v251)
  {
    self->_hearingAidSupport = v251;
    v12 |= 0x80000000000uLL;
  }

  v252 = [v4 hearingTestSupport];
  if (v252 && self->_hearingTestSupport != v252)
  {
    self->_hearingTestSupport = v252;
    v12 |= 0x80000000000uLL;
  }

  [v4 serialNumber];
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v335 = v253;
  if ([v253 length])
  {
    serialNumber = self->_serialNumber;
    v255 = v253;
    v256 = serialNumber;
    if (v255 == v256)
    {

      goto LABEL_423;
    }

    v257 = v256;
    if ((v255 == 0LL) != (v256 != 0LL))
    {
      v258 = -[NSString isEqual:](v255, "isEqual:", v256);

      if ((v258 & 1) != 0) {
        goto LABEL_423;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_serialNumber, v335);
    v12 |= 0x80000000000uLL;
  }

LABEL_423:
  [v4 serialNumberLeft];
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v334 = v259;
  if (![v259 length]) {
    goto LABEL_431;
  }
  serialNumberLeft = self->_serialNumberLeft;
  v261 = v259;
  v262 = serialNumberLeft;
  if (v261 == v262)
  {

    goto LABEL_431;
  }

  v263 = v262;
  if ((v261 == 0LL) == (v262 != 0LL))
  {

    goto LABEL_430;
  }

  v264 = -[NSString isEqual:](v261, "isEqual:", v262);

  if ((v264 & 1) == 0)
  {
LABEL_430:
    objc_storeStrong((id *)&self->_serialNumberLeft, v334);
    v12 |= 0x80000000000uLL;
  }

LABEL_431:
  [v4 serialNumberRight];
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v333 = v265;
  if (![v265 length]) {
    goto LABEL_437;
  }
  serialNumberRight = self->_serialNumberRight;
  v267 = v265;
  v268 = serialNumberRight;
  if (v267 == v268)
  {

    goto LABEL_437;
  }

  v269 = v268;
  if ((v267 == 0LL) == (v268 != 0LL))
  {

    goto LABEL_440;
  }

  v270 = -[NSString isEqual:](v267, "isEqual:", v268);

  if ((v270 & 1) != 0)
  {
LABEL_437:
    v271 = [v4 smartRoutingMode];
    if (!v271) {
      goto LABEL_443;
    }
    goto LABEL_441;
  }

LABEL_440:
  objc_storeStrong((id *)&self->_serialNumberRight, v333);
  v12 |= 0x80000000000uLL;
  v271 = [v4 smartRoutingMode];
  if (!v271) {
    goto LABEL_443;
  }
LABEL_441:
  if (self->_smartRoutingMode != v271)
  {
    self->_smartRoutingMode = v271;
    v12 |= 0x80000000000uLL;
  }

LABEL_443:
  if (v19)
  {
    v272 = [v4 spatialAudioMode];
    if ((_DWORD)v272 != -[CBDevice spatialAudioMode](self, "spatialAudioMode"))
    {
      -[CBDevice setSpatialAudioMode:](self, "setSpatialAudioMode:", v272);
      v12 |= 0x80000000000uLL;
    }

    v273 = [v4 supportedServices];
    if (v273 != self->_supportedServices)
    {
      self->_supportedServices = v273;
      v12 |= 0x80000200000uLL;
    }
  }

  [v4 txAddressData];
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v275 = v274;
  if (!v274)
  {
    v281 = v349;
    v282 = [v4 vendorID];
    if (!v282) {
      goto LABEL_462;
    }
    goto LABEL_460;
  }

  txAddressData = self->_txAddressData;
  v277 = v274;
  v278 = txAddressData;
  if (v277 == v278)
  {

    v281 = v349;
    goto LABEL_456;
  }

  v279 = v278;
  if (!v278)
  {

    v281 = v349;
    goto LABEL_459;
  }

  v280 = -[NSData isEqual:](v277, "isEqual:", v278);

  v281 = v349;
  if ((v280 & 1) != 0)
  {
LABEL_456:
    v282 = [v4 vendorID];
    if (!v282) {
      goto LABEL_462;
    }
    goto LABEL_460;
  }

LABEL_459:
  objc_storeStrong((id *)&self->_txAddressData, v275);
  v12 |= 0x80000000000uLL;
  v282 = [v4 vendorID];
  if (!v282) {
    goto LABEL_462;
  }
LABEL_460:
  if (v282 != self->_vendorID)
  {
    self->_vendorID = v282;
    v12 |= 0x80000000000uLL;
  }

LABEL_462:
  v283 = [v4 vendorIDSource];
  vendorIDSource = self->_vendorIDSource;
  if (!v283)
  {
    v283 = self->_vendorIDSource;
    v318 = v275;
    v319 = v242;
    if (vendorIDSource != 1) {
      goto LABEL_466;
    }
LABEL_469:
    v285 = 76;
LABEL_470:
    v286 = self->_vendorID == v285;
    v287 = -[CBDevice productID](self, "productID");
    if ((_DWORD)v287) {
      goto LABEL_471;
    }
    goto LABEL_478;
  }

  if (v283 != vendorIDSource)
  {
    self->_vendorIDSource = v283;
    v12 |= 0x80000000000uLL;
  }

  v318 = v275;
  v319 = v242;
  if (v283 == 1) {
    goto LABEL_469;
  }
LABEL_466:
  if (v283 == 2)
  {
    v285 = 1452;
    goto LABEL_470;
  }

  v286 = 0;
  v287 = -[CBDevice productID](self, "productID");
  if ((_DWORD)v287)
  {
LABEL_471:
    if (v286) {
      goto LABEL_472;
    }
LABEL_482:
    CBDeviceTypeToNSLocalizedString(self->_deviceType);
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v286) {
      goto LABEL_502;
    }
    goto LABEL_496;
  }

LABEL_478:
  v287 = -[CBDevice proximityPairingProductID](self, "proximityPairingProductID");
  if ((_DWORD)v287) {
    v294 = v286;
  }
  else {
    v294 = 0;
  }
  if (!v294) {
    goto LABEL_482;
  }
LABEL_472:
  v288 = +[CBProductInfo productInfoWithProductID:](&OBJC_CLASS___CBProductInfo, "productInfoWithProductID:", v287);
  [v288 productName];
  v289 = (void *)objc_claimAutoreleasedReturnValue();

  if (v289)
  {
    v290 = v7;
    v291 = self->_productName;
    v292 = v289;
    v293 = v292;
    if (v291 != v292)
    {
      if (v291)
      {
        v316 = -[NSString isEqual:](v291, "isEqual:", v292);

        v281 = v349;
        if ((v316 & 1) != 0)
        {
LABEL_495:
          uint64_t v7 = v290;

          CBDeviceTypeToNSLocalizedString(self->_deviceType);
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v286) {
            goto LABEL_502;
          }
          goto LABEL_496;
        }
      }

      else
      {

        v281 = v349;
      }

      objc_storeStrong((id *)&self->_productName, v289);
      v12 |= 0x80000000000uLL;
      goto LABEL_495;
    }

    uint64_t v7 = v290;
  }

  v281 = v349;

  CBDeviceTypeToNSLocalizedString(self->_deviceType);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v286) {
    goto LABEL_502;
  }
LABEL_496:
  v296 = self->_name;
  if (!v296 || -[NSString isEqualToString:](v296, "isEqualToString:", v295))
  {
    CBProductIDToNSLocalizedProductNameString(v287);
    v297 = (void *)objc_claimAutoreleasedReturnValue();
    if (v297)
    {
      objc_storeStrong((id *)&self->_name, v297);
      v12 |= 0x80000000000uLL;
    }

    v298 = v317;
    v299 = v348;

    v281 = v349;
    v300 = &self->_name;
    if (!self->_name) {
      goto LABEL_503;
    }
    goto LABEL_504;
  }

LABEL_502:
  v298 = v317;
  v299 = v348;
  v300 = &self->_name;
  if (!self->_name)
  {
LABEL_503:
    objc_storeStrong((id *)v300, v295);
    v12 |= 0x80000000000uLL;
  }

LABEL_504:
  if (-[NSString length](v299, "length") && -[NSString isEqualToString:](*v300, "isEqualToString:", v295))
  {
    objc_storeStrong((id *)v300, v299);
    objc_storeStrong((id *)&self->_leAdvName, v299);
    v12 |= 0x80000000000uLL;
  }

  v301 = v347;
  if ((v12 & 0x40000000) != 0)
  {
    self->_discoveryFlags &= 0xA305793BCEB00040LL;
    v350 = *(_DWORD *)self->_discoveryTypesInternal.bitArray;
    v351 = self->_discoveryTypesInternal.bitArray[4];
    v311 = CBDiscoveryTypesBLEScan();
    CBDiscoveryTypesRemoveTypes(self->_discoveryTypesInternal.bitArray, v311);
    v312 = v342;
    v313 = [v312 bytes];
    if (v313) {
      -[CBDevice _parseManufacturerPtr:end:]( self,  "_parseManufacturerPtr:end:",  v313,  v313 + [v312 length]);
    }
    CBDiscoveryTypesAddChangedTypes(self->_changedTypesInternal.bitArray, &v350, self->_discoveryTypesInternal.bitArray);
    v301 = 1;
    v302 = self->_discoveryFlags;
    if ((v349 & 2) != 0)
    {
LABEL_509:
      self->_discoveryFlags = self->_discoveryFlags & 0xFFFDFFFFFFFFFFFFLL | ((((unint64_t)[v4 discoveryFlags] >> 49) & 1) << 49);
      self->_discoveryFlags = ((unint64_t)(v340 != 0) << 51) | ((unint64_t)(v339 != 0) << 54) | self->_discoveryFlags & 0xFFB7FFFFDFFFFFFFLL | [v4 discoveryFlags] & 0x20000000;
      self->_discoveryTypesInternal.bitArray[1] = self->_discoveryTypesInternal.bitArray[1] & 0xEF | (16 * (v345 != 0LL));
      if (!v301) {
        goto LABEL_510;
      }
      goto LABEL_526;
    }
  }

  else
  {
    v302 = self->_discoveryFlags;
    if ((v281 & 2) != 0) {
      goto LABEL_509;
    }
  }

  if (!v301)
  {
LABEL_510:
    v303 = v323;
    goto LABEL_511;
  }

LABEL_526:
  -[CBDevice _clearUnparsedProperties](self, "_clearUnparsedProperties");
  v303 = v323;
  if ((self->_internalFlags & 0x800) != 0) {
LABEL_511:
  }
    self->_discoveryTypesInternal.bitArray[3] |= 0x80u;
LABEL_512:
  v304 = 0x400000LL;
  if ((v302 & 0x400000) == 0) {
    v304 = 0x1000000LL;
  }
  if ((v302 & 0x1400000) == 0 || (v12 & 0x1000000000000LL) == 0) {
    v304 = 0LL;
  }
  v306 = v304 | v12;
  v307 = self->_discoveryFlags;
  if (v307 != v298) {
    v306 |= 0x800000000uLL;
  }
  v308 = self->_changeFlags;
  v309 = v308 ^ changeFlags | v307 ^ v298 | v306;
  self->_changeFlags = v309 | v308;

  return v309;
}

LABEL_21:
  -[CBDevice setGfpModelID:](self, "setGfpModelID:", 0LL);
  -[CBDevice setGfpPayloadData:](self, "setGfpPayloadData:", 0LL);
  if ((discoveryFlags & 0x400000) != 0)
  {
LABEL_6:
    if ((discoveryFlags & 0x1000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }

  objectSetupFontCode = self->_objectSetupFontCode;
  uint64_t v28 = v14;
  uint64_t v18 = objectSetupFontCode;
  if (v28 == v18)
  {

    objectSetupMessage = self->_objectSetupMessage;
    uint64_t v21 = v15;
    v22 = objectSetupMessage;
    if (v21 != v22) {
      goto LABEL_25;
    }
LABEL_34:

    goto LABEL_37;
  }

  if ((v28 == 0LL) == (v18 != 0LL))
  {

LABEL_33:
    objc_storeStrong((id *)&self->_objectSetupFontCode, v14);
    v16 |= 0x10000uLL;
    uint64_t v26 = self->_objectSetupMessage;
    uint64_t v21 = v15;
    v22 = v26;
    if (v21 != v22) {
      goto LABEL_25;
    }
    goto LABEL_34;
  }

  id v19 = -[NSString isEqual:](v28, "isEqual:", v18);

  if ((v19 & 1) == 0) {
    goto LABEL_33;
  }
  uint64_t v20 = self->_objectSetupMessage;
  uint64_t v21 = v15;
  v22 = v20;
  if (v21 == v22) {
    goto LABEL_34;
  }
LABEL_25:
  v23 = v22;
  if ((v21 == 0LL) != (v22 != 0LL))
  {
    uint64_t v24 = -[NSString isEqual:](v21, "isEqual:", v22);

    if ((v24 & 1) != 0) {
      goto LABEL_37;
    }
  }

  else
  {
  }

  objc_storeStrong((id *)&self->_objectSetupMessage, v15);
  v16 |= 0x10000uLL;
LABEL_37:
  self->_discoveryFlags |= 0x10000uLL;
  self->_changeFlags |= v16;
}

  objectSetupFontCode = self->_objectSetupFontCode;
  uint64_t v28 = v14;
  uint64_t v18 = objectSetupFontCode;
  if (v28 == v18)
  {

    objectSetupMessage = self->_objectSetupMessage;
    uint64_t v21 = v15;
    v22 = objectSetupMessage;
    if (v21 != v22) {
      goto LABEL_25;
    }
LABEL_34:

    goto LABEL_37;
  }

  if ((v28 == 0LL) == (v18 != 0LL))
  {

LABEL_33:
    objc_storeStrong((id *)&self->_objectSetupFontCode, v14);
    v16 |= 0x10000uLL;
    uint64_t v26 = self->_objectSetupMessage;
    uint64_t v21 = v15;
    v22 = v26;
    if (v21 != v22) {
      goto LABEL_25;
    }
    goto LABEL_34;
  }

  id v19 = -[NSString isEqual:](v28, "isEqual:", v18);

  if ((v19 & 1) == 0) {
    goto LABEL_33;
  }
  uint64_t v20 = self->_objectSetupMessage;
  uint64_t v21 = v15;
  v22 = v20;
  if (v21 == v22) {
    goto LABEL_34;
  }
LABEL_25:
  v23 = v22;
  if ((v21 == 0LL) != (v22 != 0LL))
  {
    uint64_t v24 = -[NSString isEqual:](v21, "isEqual:", v22);

    if ((v24 & 1) != 0) {
      goto LABEL_37;
    }
  }

  else
  {
  }

  objc_storeStrong((id *)&self->_objectSetupMessage, v15);
  v16 |= 0x10000uLL;
LABEL_37:
  self->_discoveryFlags |= 0x10000uLL;
  self->_changeFlags |= v16;
}

LABEL_28:
  self->_objectDiscoveryMode = 0;
  objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
  self->_objectDiscoveryNearOwnerID = 0LL;

  objectDiscoveryPublicKeyData = self->_objectDiscoveryPublicKeyData;
  self->_objectDiscoveryPublicKeyData = 0LL;

  if ((discoveryFlags & 0x10000) != 0)
  {
LABEL_13:
    if ((discoveryFlags & 0x80000000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }

  if (a4 - v5 <= 1) {
    uint64_t v15 = 0;
  }
  if (!v15)
  {
    uint64_t v21 = 0;
    if (!self->_homeKitV2InstanceID) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  v22 = *(unsigned __int16 *)v5;
  v5 += 2;
  uint64_t v21 = v22;
  if (v22 != self->_homeKitV2InstanceID)
  {
LABEL_34:
    self->_homeKitV2InstanceID = v21;
    uint64_t v13 = 0x1000000LL;
  }

LABEL_30:
  *(_WORD *)&self->_proximityServiceFlags = 0;
  self->_proximityServicePSM = 0;
  proximityServiceSetupHash = self->_proximityServiceSetupHash;
  self->_proximityServiceSetupHash = 0LL;

  *(_WORD *)&self->_proximityServiceSubType = 0;
  if ((discoveryFlags & 0x40000) != 0)
  {
LABEL_15:
    uint64_t v5 = self->_discoveryTypesInternal.bitArray[3];
    if ((self->_discoveryTypesInternal.bitArray[1] & 0x10) != 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }

  if (self->_microphoneMode)
  {
    NSAppendPrintF_safe();
    v23 = v3;

    size_t v3 = v23;
  }

  if (self->_muteControlConfig)
  {
    NSAppendPrintF_safe();
    uint64_t v24 = v3;

    size_t v3 = v24;
  }

  uint64_t v25 = self->_name;
  if (v25)
  {
    NSAppendPrintF_safe();
    uint64_t v26 = v3;

    size_t v3 = v26;
  }

  if (self->_placementMode)
  {
    NSAppendPrintF_safe();
    uint64_t v27 = v3;

    size_t v3 = v27;
  }

  if (self->_relinquishAudioRoute)
  {
    NSAppendPrintF_safe();
    uint64_t v28 = v3;

    size_t v3 = v28;
  }

  if (self->_selectiveSpeechListeningConfig)
  {
    NSAppendPrintF_safe();
    uint64_t v29 = v3;

    size_t v3 = v29;
  }

  if (self->_smartRoutingMode)
  {
    NSAppendPrintF_safe();
    uint64_t v30 = v3;

    size_t v3 = v30;
  }

  if (self->_spatialAudioAllowed)
  {
    NSAppendPrintF_safe();
    uint64_t v31 = v3;

    size_t v3 = v31;
  }

  if (self->_spatialAudioMode != 255)
  {
    NSAppendPrintF_safe();
    uint64_t v32 = v3;

    size_t v3 = v32;
  }

  uint64_t v33 = v3;

  return v33;
}

LABEL_32:
  -[CBDevice setDockKitAccessoryPayloadData:](self, "setDockKitAccessoryPayloadData:", 0LL);
  if ((v5 & 0x40) == 0)
  {
LABEL_17:
    safetyAlertsAlertData = self->_safetyAlertsAlertData;
    self->_safetyAlertsAlertData = 0LL;

    safetyAlertsAlertID = self->_safetyAlertsAlertID;
    self->_safetyAlertsAlertID = 0LL;

    safetyAlertsSignature = self->_safetyAlertsSignature;
    self->_safetyAlertsSignature = 0LL;

    self->_safetyAlertsVersion = 0;
    safetyAlertsSegmentAlertData = self->_safetyAlertsSegmentAlertData;
    self->_safetyAlertsSegmentAlertData = 0LL;

    *(_WORD *)&self->_safetyAlertsSegmentSegmentNumber = 0;
    safetyAlertsSegmentServiceData = self->_safetyAlertsSegmentServiceData;
    self->_safetyAlertsSegmentServiceData = 0LL;

    safetyAlertsSegmentSignature = self->_safetyAlertsSegmentSignature;
    self->_safetyAlertsSegmentSignature = 0LL;
  }

      -[CBDevice watchSetupData](self, "watchSetupData");
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = v50;
      uint64_t v31 = v29;
      if (v30 == v31)
      {
      }

      else
      {
        uint64_t v32 = v31;
        if ((v30 == 0LL) != (v31 != 0LL))
        {
          uint64_t v33 = [v30 isEqual:v31];

          if ((v33 & 1) != 0) {
            goto LABEL_39;
          }
        }

        else
        {
        }

        -[CBDevice setWatchSetupData:](self, "setWatchSetupData:", v30);
        v15 |= v14;
      }

  if (a4 - v5 <= 0) {
    uint64_t v11 = 0;
  }
  if (!v11)
  {
    uint64_t v24 = 0;
    goto LABEL_39;
  }

  uint64_t v25 = *v5++;
  uint64_t v24 = v25;
  if (v25 != -1)
  {
    if (v24 < 0)
    {
      uint64_t v26 = 256;
      goto LABEL_40;
    }

    uint64_t v20 = 512;
LABEL_33:
    uint64_t v21 = v18 & 0x7F;
    if (v21 >= 100) {
      uint64_t v21 = 100;
    }
    v22 = v20 | v21;
    if (v22 != self->_batteryInfoLeft) {
      goto LABEL_36;
    }
    goto LABEL_37;
  }

  LOWORD(v22) = 0;
  if (self->_batteryInfoLeft)
  {
LABEL_36:
    self->_batteryInfoLeft = v22;
    uint64_t v9 = 0x80000000080LL;
  }

  if (a4 - v5 <= 0) {
    uint64_t v11 = 0;
  }
  if (!v11)
  {
    uint64_t v24 = 0;
    goto LABEL_39;
  }

  uint64_t v25 = *v5++;
  uint64_t v24 = v25;
  if (v25 != -1)
  {
    if (v24 < 0)
    {
      uint64_t v26 = 256;
      goto LABEL_40;
    }

  proximityServiceSetupHash = self->_proximityServiceSetupHash;
  id v19 = v12;
  uint64_t v17 = proximityServiceSetupHash;
  if (v19 == v17)
  {
  }

  else
  {
    if ((v19 == 0LL) != (v17 != 0LL))
    {
      uint64_t v18 = -[NSData isEqual:](v19, "isEqual:", v17);

      if ((v18 & 1) != 0) {
        goto LABEL_44;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_proximityServiceSetupHash, v12);
    v15 |= 0x100000000uLL;
  }

LABEL_43:
  if (a4 - v5 > 0 && v11)
  {
    v22 = *(unsigned __int8 *)v5;
    if ((_DWORD)v22 == -[CBDevice heySiriProductType](self, "heySiriProductType")) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }

  v22 = 0LL;
  if (-[CBDevice heySiriProductType](self, "heySiriProductType"))
  {
LABEL_50:
    -[CBDevice setHeySiriProductType:](self, "setHeySiriProductType:", v22);
    v9 |= 0x400000000000000uLL;
  }

  if (a4 - (a3 + 4) < 1)
  {
    uint64_t v15 = 0;
    uint64_t v25 = 0;
    uint64_t v12 = 0;
    goto LABEL_12;
  }

  uint64_t v11 = *((unsigned __int8 *)a3 + 4);
  if (v5 - 8 < 1)
  {
LABEL_45:
    uint64_t v15 = 0;
    uint64_t v25 = 0;
    uint64_t v12 = 0;
    goto LABEL_13;
  }

LABEL_51:
  self->_discoveryFlags |= 0x400000000000000uLL;
  self->_changeFlags |= v9;
}

  deviceFlags = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | ((((unint64_t)(v29 & 8) >> 3) & 1) << 36);
  if (a4 - v5 >= 1)
  {
    uint64_t v33 = *(unsigned __int8 *)v5++;
    uint64_t v32 = v33;
    if (-[CBDevice colorInfo](self, "colorInfo") == v33) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }

  uint64_t v32 = 0LL;
  if (-[CBDevice colorInfo](self, "colorInfo"))
  {
LABEL_53:
    -[CBDevice setColorInfo:](self, "setColorInfo:", v32, deviceFlags);
    uint64_t v18 = 1;
  }

  deviceFlags = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | ((((unint64_t)(v29 & 8) >> 3) & 1) << 36);
  if (a4 - v5 >= 1)
  {
    uint64_t v32 = *(unsigned __int8 *)v5;
    if (-[CBDevice colorInfo](self, "colorInfo") == (_DWORD)v32) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }

  uint64_t v32 = 0LL;
  if (-[CBDevice colorInfo](self, "colorInfo"))
  {
LABEL_53:
    -[CBDevice setColorInfo:](self, "setColorInfo:", v32, deviceFlags);
    uint64_t v18 = 1;
  }

  uint64_t v39 = "Default";
  switch(scanRate)
  {
    case 0:
      break;
    case 10:
      uint64_t v39 = "Periodic";
      break;
    case 20:
      uint64_t v39 = "Background";
      break;
    case 30:
      uint64_t v39 = "Low";
      break;
    case 35:
      uint64_t v39 = "MediumLow";
      break;
    case 40:
      uint64_t v39 = "Medium";
      break;
    case 50:
      uint64_t v39 = "High";
      break;
    case 60:
      uint64_t v39 = "Max";
      break;
    default:
      uint64_t v39 = "?";
      break;
  }

  uint64_t v40 = [v4 scanRate];
  uint64_t v41 = "Default";
  switch(v40)
  {
    case 0:
      break;
    case 10:
      uint64_t v41 = "Periodic";
      break;
    case 20:
      uint64_t v41 = "Background";
      break;
    case 30:
      uint64_t v41 = "Low";
      break;
    case 35:
      uint64_t v41 = "MediumLow";
      break;
    case 40:
      uint64_t v41 = "Medium";
      break;
    case 50:
      uint64_t v41 = "High";
      break;
    case 60:
      uint64_t v41 = "Max";
      break;
    default:
      uint64_t v41 = "?";
      break;
  }

  v65 = v41;
  CUAppendF();
  uint64_t v42 = v9;

  self->_scanRate = objc_msgSend(v4, "scanRate", v39, v65);
  uint64_t v7 = 1;
  uint64_t v9 = v42;
  uint64_t v43 = [v4 scanRateScreenOff];
  scanRateScreenOff = self->_scanRateScreenOff;
  if (v43 != scanRateScreenOff)
  {
LABEL_70:
    uint64_t v44 = "Default";
    switch(scanRateScreenOff)
    {
      case 0:
        break;
      case 10:
        uint64_t v44 = "Periodic";
        break;
      case 20:
        uint64_t v44 = "Background";
        break;
      case 30:
        uint64_t v44 = "Low";
        break;
      case 35:
        uint64_t v44 = "MediumLow";
        break;
      case 40:
        uint64_t v44 = "Medium";
        break;
      case 50:
        uint64_t v44 = "High";
        break;
      case 60:
        uint64_t v44 = "Max";
        break;
      default:
        uint64_t v44 = "?";
        break;
    }

    uint64_t v45 = [v4 scanRateScreenOff];
    uint64_t v46 = "Default";
    switch(v45)
    {
      case 0:
        break;
      case 10:
        uint64_t v46 = "Periodic";
        break;
      case 20:
        uint64_t v46 = "Background";
        break;
      case 30:
        uint64_t v46 = "Low";
        break;
      case 35:
        uint64_t v46 = "MediumLow";
        break;
      case 40:
        uint64_t v46 = "Medium";
        break;
      case 50:
        uint64_t v46 = "High";
        break;
      case 60:
        uint64_t v46 = "Max";
        break;
      default:
        uint64_t v46 = "?";
        break;
    }

    v66 = v46;
    CUAppendF();
    v47 = v9;

    self->_scanRateScreenOff = objc_msgSend(v4, "scanRateScreenOff", v44, v66);
    uint64_t v7 = 1;
    uint64_t v9 = v47;
  }

LABEL_38:
  if (a4 - v5 <= 1) {
    id v19 = 0;
  }
  if (!v19)
  {
    uint64_t v25 = 0;
    if (!self->_homeKitV1StateNumber) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }

  uint64_t v26 = *(unsigned __int16 *)v5;
  v5 += 2;
  uint64_t v25 = v26;
  if (v26 != self->_homeKitV1StateNumber)
  {
LABEL_44:
    self->_homeKitV1StateNumber = v25;
    uint64_t v10 = 0x400000LL;
  }

  self->_proximityServiceMeasuredPower = v10;
  v15 |= 0x100000000uLL;
  if (v11 == self->_proximityServiceVersion)
  {
LABEL_30:
    if (v13 == self->_proximityServiceFlags) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }

  self->_airdropHash3 = v14;
  if (v15 != -[CBDevice airdropHash4](self, "airdropHash4")) {
    goto LABEL_39;
  }
LABEL_27:
  if (v16 != -[CBDevice airdropConfigData](self, "airdropConfigData")) {
LABEL_28:
  }
    self->_airdropConfigData = v16;
LABEL_29:
}

LABEL_39:
      self->_discoveryFlags |= v14;
      self->_changeFlags |= v15;

      return;
    default:
      uint64_t v12 = 0LL;
      *(_DWORD *)&v49[4] = 0;
      *(_DWORD *)&v49[8] = 0;
      v50 = 0LL;
      v49[0] = (v7 & 0x200) == 0;
      goto LABEL_84;
  }

  self->_discoveryFlags |= 0x40uLL;
  self->_changeFlags |= v22;
}

    uint64_t v26 = 512;
LABEL_40:
    uint64_t v27 = v24 & 0x7F;
    if (v27 >= 100) {
      uint64_t v27 = 100;
    }
    uint64_t v28 = v26 | v27;
    if (v28 != self->_batteryInfoRight) {
      goto LABEL_43;
    }
    goto LABEL_44;
  }

  LOWORD(v2_Block_object_dispose(va, 8) = 0;
  if (self->_batteryInfoRight)
  {
LABEL_43:
    self->_batteryInfoRight = v28;
    uint64_t v18 = 1;
  }

    uint64_t v26 = 512;
LABEL_40:
    uint64_t v27 = v24 & 0x7F;
    if (v27 >= 100) {
      uint64_t v27 = 100;
    }
    uint64_t v28 = v26 | v27;
    if (v28 != self->_batteryInfoRight) {
      goto LABEL_43;
    }
    goto LABEL_44;
  }

  LOWORD(v2_Block_object_dispose(va, 8) = 0;
  if (self->_batteryInfoRight)
  {
LABEL_43:
    self->_batteryInfoRight = v28;
    uint64_t v18 = 1;
  }

  self->_proximityServiceVersion = v11;
  v15 |= 0x100000000uLL;
  if (v13 != self->_proximityServiceFlags)
  {
LABEL_31:
    self->_proximityServiceFlags = v13;
    v15 |= 0x100000000uLL;
  }

LABEL_54:
  uint64_t v34 = a4 - v5;
  if (a4 - v5 < 1)
  {
    uint64_t v36 = 0LL;
  }

  else
  {
    uint64_t v35 = *v5++;
    uint64_t v36 = (unint64_t)(v35 & 1) << 43;
  }

  uint64_t v37 = 0;
  uint64_t v38 = deviceFlags & 0xFFFFF7FFFFFFFFFFLL | v36;
  deviceFlags = v38;
  if (v34 >= 1 && a4 - v5 - 12 >= 2) {
    uint64_t v37 = *((unsigned __int16 *)v5 + 6);
  }
  if (v37 == self->_proximityPairingOtherBudProductID)
  {
    if (v38 == self->_deviceFlags) {
      goto LABEL_64;
    }
  }

  else
  {
    self->_proximityPairingOtherBudProductID = v37;
    uint64_t v18 = 1;
    if (v38 == self->_deviceFlags)
    {
LABEL_64:
      uint64_t v39 = HIDWORD(v44);
      if (v39 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement", deviceFlags)) {
        goto LABEL_65;
      }
      goto LABEL_70;
    }
  }

  self->_deviceFlags = v38;
  uint64_t v18 = 1;
  uint64_t v41 = HIDWORD(v44);
  if (v41 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement", deviceFlags))
  {
LABEL_65:
    uint64_t v40 = v44;
    if (v40 == -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement")) {
      goto LABEL_66;
    }
LABEL_71:
    -[CBDevice setProximityPairingSecondaryPlacement:]( self,  "setProximityPairingSecondaryPlacement:",  v44);
    self->_discoveryFlags |= 0x8000uLL;
    goto LABEL_72;
  }

  if (deviceFlags == self->_deviceFlags)
  {
    uint64_t v33 = HIDWORD(v38);
    if (v33 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement")) {
      goto LABEL_56;
    }
  }

  else
  {
    self->_deviceFlags = deviceFlags;
    uint64_t v18 = 1;
    uint64_t v35 = HIDWORD(v38);
    if (v35 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement"))
    {
LABEL_56:
      uint64_t v34 = v38;
      if (v34 == -[CBDevice proximityPairingSecondaryPlacement]( self,  "proximityPairingSecondaryPlacement",  deviceFlags)) {
        goto LABEL_57;
      }
LABEL_61:
      -[CBDevice setProximityPairingSecondaryPlacement:]( self,  "setProximityPairingSecondaryPlacement:",  v38);
      self->_discoveryFlags |= 0x4000uLL;
      goto LABEL_62;
    }
  }

  -[CBDevice setProximityPairingPrimaryPlacement:]( self,  "setProximityPairingPrimaryPlacement:",  HIDWORD(v38),  deviceFlags);
  uint64_t v18 = 1;
  uint64_t v36 = v38;
  if (v36 != -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement")) {
    goto LABEL_61;
  }
LABEL_57:
  self->_discoveryFlags |= 0x4000uLL;
  if (v18) {
LABEL_62:
  }
    self->_changeFlags |= 0x80000004000uLL;
}

void sub_187015294( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1870152AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_187015AA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187015E2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

LABEL_57:
  NSAppendPrintF_safe();
  uint64_t v37 = v3;

  size_t v3 = v37;
  if (self->_listeningModeConfigs)
  {
LABEL_29:
    CUPrintFlags32();
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v19 = v3;

    size_t v3 = v19;
  }

LABEL_89:
  -[CBSpatialInteractionSession uwbConfigData](self, "uwbConfigData");
  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 uwbConfigData];
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v50 = v48;
  __int128 v51 = v50;
  if (v49 == v50)
  {

    var0 = self->_ucat->var0;
    if (v9) {
      goto LABEL_93;
    }
LABEL_100:
    goto LABEL_106;
  }

  if ((v50 != 0LL) == (v49 == 0LL))
  {

LABEL_99:
    [v4 uwbConfigData];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v54 = v9;

    objc_msgSend(v4, "uwbConfigData", v51, v67);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSpatialInteractionSession setUwbConfigData:](self, "setUwbConfigData:", v55);
    uint64_t v7 = 1;
    uint64_t v9 = v54;

    var0 = self->_ucat->var0;
    if (v54) {
      goto LABEL_93;
    }
    goto LABEL_100;
  }

  uint64_t v52 = [v49 isEqual:v50];

  if ((v52 & 1) == 0) {
    goto LABEL_99;
  }
  var0 = self->_ucat->var0;
  if (!v9) {
    goto LABEL_100;
  }
LABEL_93:
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_102:
  }
    LogPrintF_safe();
LABEL_106:

  return v7;
}

void sub_18701A764(_Unwind_Exception *a1)
{
}

void sub_18701B830(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_18701C684( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
}

void sub_18701D474(_Unwind_Exception *a1)
{
}

void sub_18701D488(_Unwind_Exception *a1)
{
}

void sub_18701D54C(_Unwind_Exception *a1)
{
}

void sub_18701E0F0(_Unwind_Exception *a1)
{
}

void sub_18701E390(_Unwind_Exception *a1)
{
}

void CBXpcCreateNSObjectWithXpcObject_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  uint64_t v1 = a1;
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_186F9B000, v1, OS_LOG_TYPE_ERROR, "xpc_fd_dup failed: errno %d", (uint8_t *)v3, 8u);

  OUTLINED_FUNCTION_1();
}

void CBXpcCreateNSObjectWithXpcObject_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82D0](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

uint64_t CFDictionaryGetCFDataOfLength()
{
  return MEMORY[0x18960E878]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x18960E888]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x18960E8A8]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x18960E8B8]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x18960E8C8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x189602F20](number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x189602F68](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFStreamCreatePairWithSocket( CFAllocatorRef alloc, CFSocketNativeHandle sock, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1896038B0](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CUAppendF()
{
  return MEMORY[0x18960E900]();
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x18960E918]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x18960E928]();
}

uint64_t CUFatalErrorF()
{
  return MEMORY[0x18960E940]();
}

uint64_t CUPrintAddress()
{
  return MEMORY[0x18960E970]();
}

uint64_t CUPrintDurationDouble()
{
  return MEMORY[0x18960E978]();
}

uint64_t CUPrintErrorCode()
{
  return MEMORY[0x18960E980]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x18960E990]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x18960E9A0]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x18960E9A8]();
}

uint64_t CUPrintNSDataHex()
{
  return MEMORY[0x18960E9B0]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x18960E9C8]();
}

uint64_t CUPrintNSObjectMasked()
{
  return MEMORY[0x18960E9D8]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x18960E9E0]();
}

uint64_t CUPrintNSObjectOneLineEx()
{
  return MEMORY[0x18960E9F0]();
}

uint64_t CUPrintText()
{
  return MEMORY[0x18960EA00]();
}

uint64_t CUPrintXPC()
{
  return MEMORY[0x18960EA08]();
}

uint64_t CUXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x18960EA10]();
}

uint64_t CUXPCDecodeBool()
{
  return MEMORY[0x18960EA18]();
}

uint64_t CUXPCDecodeDouble()
{
  return MEMORY[0x18960EA20]();
}

uint64_t CUXPCDecodeNSArrayOfClass()
{
  return MEMORY[0x18960EA28]();
}

uint64_t CUXPCDecodeNSArrayOfNSData()
{
  return MEMORY[0x18960EA30]();
}

uint64_t CUXPCDecodeNSArrayOfNSString()
{
  return MEMORY[0x18960EA38]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x18960EA40]();
}

uint64_t CUXPCDecodeNSDataOfLength()
{
  return MEMORY[0x18960EA48]();
}

uint64_t CUXPCDecodeNSError()
{
  return MEMORY[0x18960EA50]();
}

uint64_t CUXPCDecodeNSErrorIfNeeded()
{
  return MEMORY[0x18960EA58]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x18960EA60]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x18960EA68]();
}

uint64_t CUXPCDecodeObject()
{
  return MEMORY[0x18960EA70]();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return MEMORY[0x18960EA78]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x18960EA80]();
}

uint64_t CUXPCEncodeNSArrayOfNSData()
{
  return MEMORY[0x18960EA88]();
}

uint64_t CUXPCEncodeNSArrayOfNSString()
{
  return MEMORY[0x18960EA90]();
}

uint64_t CUXPCEncodeNSArrayOfObjects()
{
  return MEMORY[0x18960EA98]();
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x18960EAA0]();
}

uint64_t CUXPCEncodeObject()
{
  return MEMORY[0x18960EAA8]();
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x18960EAB0]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x18960EBA0]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x18960EBB0]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x18960EBD0]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x18960EBE0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x18960EBF8]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x18960EC00]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x189613710]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x18960EC48]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x18960EC50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

uint64_t NSDecodeNSDictionaryOfClassesIfPresent()
{
  return MEMORY[0x18960EC68]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x18960ECA0]();
}

uint64_t NSErrorF_safe()
{
  return MEMORY[0x18960ECB0]();
}

uint64_t NSErrorNestedF()
{
  return MEMORY[0x18960ECC0]();
}

uint64_t NSPrintF_safe()
{
  return MEMORY[0x18960ECF0]();
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x18960EDF0]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x18960EE50]();
}

uint64_t SocketReadDataEx()
{
  return MEMORY[0x18960EEC8]();
}

uint64_t SocketSetNonBlocking()
{
  return MEMORY[0x18960EED0]();
}

uint64_t SocketWriteData()
{
  return MEMORY[0x18960EEE0]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x189612AB0]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x189612AC0]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x189612AC8]();
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x18960EF20]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x18960EF78]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x1895F9748]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x1895F9788]();
}

uint64_t ccecb_context_size()
{
  return MEMORY[0x1895F9C78]();
}

uint64_t ccecb_init()
{
  return MEMORY[0x1895F9C80]();
}

uint64_t cclr_aes_init()
{
  return MEMORY[0x1895FA050]();
}

uint64_t cclr_decrypt_block()
{
  return MEMORY[0x1895FA058]();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1895FA578](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
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

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1895FAD98](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1895FADA0](queue, relative_priority_ptr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

uint64_t dispatch_workloop_copy_current()
{
  return MEMORY[0x1895FAEF8]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1895FB088]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

double log10(double a1)
{
  return result;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

uint64_t os_channel_attr_create()
{
  return MEMORY[0x1895FC2F8]();
}

uint64_t os_channel_attr_destroy()
{
  return MEMORY[0x1895FC300]();
}

uint64_t os_channel_attr_set()
{
  return MEMORY[0x1895FC310]();
}

uint64_t os_channel_create_extended()
{
  return MEMORY[0x1895FC330]();
}

uint64_t os_channel_destroy()
{
  return MEMORY[0x1895FC338]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1895FCCA8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1895FCEC8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x1895FCEF8](*(void *)&a1, *(void *)&a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FCFD0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1895FD8C0](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1895FD950](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDBD0](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1895FDBF8](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1895FDD50](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return result;
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1895FDE00](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1895FDEB0](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1895FDEC8](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1895FDF48]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1895FE0F8](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1895FE110](xuuid);
}

uint64_t objc_msgSend_centralManager_didDisconnectPeripheral_timestamp_isReconnecting_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_centralManager_didDisconnectPeripheral_timestamp_isReconnecting_error_);
}

uint64_t objc_msgSend_centralManager_didUpdateConnectionParameters_interval_latency_supervisionTimeout_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_centralManager_didUpdateConnectionParameters_interval_latency_supervisionTimeout_);
}

uint64_t objc_msgSend_centralManager_didUpdateControllerBTClockForPeripheral_eventType_seconds_microseconds_localClock_remoteClock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_centralManager_didUpdateControllerBTClockForPeripheral_eventType_seconds_microseconds_localClock_remoteClock_);
}

uint64_t objc_msgSend_centralManager_didUpdateRSSIStatisticsDetectionForPeripheral_results_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_centralManager_didUpdateRSSIStatisticsDetectionForPeripheral_results_error_);
}

uint64_t objc_msgSend_decryptNearbyInfoV2PayloadPtr_payloadLength_key_keyLength_decryptedPtr_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_decryptNearbyInfoV2PayloadPtr_payloadLength_key_keyLength_decryptedPtr_);
}

uint64_t objc_msgSend_handleAttributeEvent_args_attributeSelector_delegateSelector_delegateFlag_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_handleAttributeEvent_args_attributeSelector_delegateSelector_delegateFlag_);
}

uint64_t objc_msgSend_handleCharacteristicEvent_characteristicSelector_delegateSelector_delegateFlag_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_handleCharacteristicEvent_characteristicSelector_delegateSelector_delegateFlag_);
}

uint64_t objc_msgSend_handleDescriptorEvent_descriptorSelector_delegateSelector_delegateFlag_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_handleDescriptorEvent_descriptorSelector_delegateSelector_delegateFlag_);
}

uint64_t objc_msgSend_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler_);
}

uint64_t objc_msgSend_peripheral_didReceiveTimeSyncWithReferenceTime_localAbsolute_remoteAbsolute_receiveTime_GMTDelta_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_peripheral_didReceiveTimeSyncWithReferenceTime_localAbsolute_remoteAbsolute_receiveTime_GMTDelta_error_);
}

uint64_t objc_msgSend_peripheralManager_didUpdateConnectionParameters_interval_latency_supervisionTimeout_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_peripheralManager_didUpdateConnectionParameters_interval_latency_supervisionTimeout_);
}

uint64_t objc_msgSend_peripheralManager_didUpdateControllerBTClock_seconds_microseconds_localClock_remoteClock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_peripheralManager_didUpdateControllerBTClock_seconds_microseconds_localClock_remoteClock_);
}