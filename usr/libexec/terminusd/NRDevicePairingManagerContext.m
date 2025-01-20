@interface NRDevicePairingManagerContext
- (NSString)description;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
@end

@implementation NRDevicePairingManagerContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRDevicePairingManagerContext;
  -[NRDevicePairingManagerContext dealloc](&v3, "dealloc");
}

- (NSString)description
{
  if (self) {
    self = (NRDevicePairingManagerContext *)self->_info;
  }
  return -[NRDevicePairingManagerContext description](self, "description");
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  if (self)
  {
    if (self->_centralManager)
    {
      id v13 = v4;
      BOOL v5 = [v4 state] == (id)5;
      id v4 = v13;
      if (v5)
      {
        if (qword_1001DC9B8 != -1)
        {
          dispatch_once(&qword_1001DC9B8, &stru_1001AFB18);
          id v4 = v13;
        }

        if (!byte_1001DC9B0)
        {
          v6 = sub_1000FDAD8((uint64_t)self);
          v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
          if ([v7 count])
          {
            v8 = self->_centralManager;
            v9 = self->_queue;
            if (qword_1001DCA30 != -1) {
              dispatch_once(&qword_1001DCA30, &stru_1001AFC68);
            }
            v10 = (dispatch_queue_s *)(id)qword_1001DCA38;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1000FDC74;
            block[3] = &unk_1001AF908;
            v15 = v8;
            id v16 = v7;
            v17 = v9;
            v18 = self;
            v11 = v9;
            v12 = v8;
            dispatch_async(v10, block);
          }

          id v4 = v13;
        }
      }
    }
  }
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  id v4 = (CBScalablePipeManager *)a3;
  BOOL v5 = v4;
  if (self)
  {
    if (self->_pipeManager != v4) {
      goto LABEL_3;
    }
  }

  else if (v4)
  {
    goto LABEL_3;
  }

  id v6 = -[CBScalablePipeManager state](v4, "state");
  if (v6)
  {
    if (v6 == (id)5)
    {
      if (self) {
        pipeManager = self->_pipeManager;
      }
      else {
        pipeManager = 0LL;
      }
      v11[0] = CBScalablePipeOptionTransport;
      v11[1] = CBScalablePipeOptionStayConnectedWhenIdle;
      v12[0] = &off_1001BC7C0;
      v12[1] = &__kCFBooleanTrue;
      v11[2] = CBScalablePipeOptionRequiresEncryption;
      v12[2] = &__kCFBooleanFalse;
      v8 = pipeManager;
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
      -[CBScalablePipeManager registerEndpoint:type:priority:options:]( v8,  "registerEndpoint:type:priority:options:",  @"com.apple.terminusPairing",  0LL,  2LL,  v9);
    }

    else
    {
      if (self) {
        v10 = self->_pipeManager;
      }
      else {
        v10 = 0LL;
      }
      -[CBScalablePipeManager unregisterEndpoint:](v10, "unregisterEndpoint:", @"com.apple.terminusPairing");
    }
  }

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v52 = a3;
  id v6 = a4;
  if (v52)
  {
    if (!v6)
    {
      id v33 = sub_1000FBEC0();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v33, 17LL);

      if (!IsLevelEnabled) {
        goto LABEL_40;
      }
      id v8 = sub_1000FBEC0();
      _NRLogWithArgs(v8, 17LL, "%s called with null pipe");
      goto LABEL_39;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 peer]);
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 identifier]);

    if (!v8)
    {
      id v35 = sub_1000FBEC0();
      int v36 = _NRLogIsLevelEnabled(v35, 17LL);

      if (!v36)
      {
        id v8 = 0LL;
        goto LABEL_39;
      }

      id v10 = sub_1000FBEC0();
      _NRLogWithArgs( v10,  17LL,  "%s called with null cbUUID",  "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidConnect:]");
      goto LABEL_38;
    }

    if (self) {
      cbUUIDCandidateMappings = self->_cbUUIDCandidateMappings;
    }
    else {
      cbUUIDCandidateMappings = 0LL;
    }
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cbUUIDCandidateMappings, "objectForKeyedSubscript:", v8));
    if (self) {
      pairingCandidates = self->_pairingCandidates;
    }
    else {
      pairingCandidates = 0LL;
    }
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pairingCandidates, "objectForKeyedSubscript:", v10));
    if (!v12)
    {
      if (qword_1001DC978 != -1) {
        dispatch_once(&qword_1001DC978, &stru_1001AFA38);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC970, 0LL))
      {
        if (qword_1001DC978 != -1) {
          dispatch_once(&qword_1001DC978, &stru_1001AFA38);
        }
        _NRLogWithArgs( qword_1001DC970,  0LL,  "%s%.30s:%-4d %@ BT pipe for unknown %@ connected",  ",  "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidConnect:]"",  815LL,  self,  v8);
      }

      id v30 = v6;
      goto LABEL_37;
    }

    if (qword_1001DC978 != -1) {
      dispatch_once(&qword_1001DC978, &stru_1001AFA38);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC970, 0LL))
    {
      if (qword_1001DC978 != -1) {
        dispatch_once(&qword_1001DC978, &stru_1001AFA38);
      }
      _NRLogWithArgs( qword_1001DC970,  0LL,  "%s%.30s:%-4d %@ BT pipe for %@ connected",  ",  "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidConnect:]"",  837LL,  self,  v8);
    }

    id v13 = v6;
    if (*(void *)(v12 + 72)) {
      sub_1000FD7F0(v12);
    }
    objc_storeStrong((id *)(v12 + 72), a4);
    id v14 = [v13 channel];
    *(void *)(v12 + 80) = v14;
    if (v14)
    {
      uint64_t v15 = os_channel_ring_id(v14, 2LL);
      uint64_t v16 = os_channel_rx_ring(*(void *)(v12 + 80), v15);
      *(void *)(v12 + 88) = v16;
      if (v16)
      {
        uint64_t v17 = os_channel_ring_id(*(void *)(v12 + 80), 0LL);
        uint64_t v18 = os_channel_tx_ring(*(void *)(v12 + 80), v17);
        *(void *)(v12 + 96) = v18;
        if (v18)
        {
          unsigned int fd = os_channel_get_fd(*(void *)(v12 + 80));
          int v20 = fd;
          if ((fd & 0x80000000) != 0)
          {
            id v44 = sub_1000FBEC0();
            int v45 = _NRLogIsLevelEnabled(v44, 17LL);

            if (v45)
            {
              id v46 = sub_1000FBEC0();
              _NRLogWithArgs(v46, 17LL, "os_channel_get_fd failed: %d", v20);
            }

            goto LABEL_37;
          }

          unsigned int v21 = fd;
          v22 = (dispatch_queue_s *)*(id *)(v12 + 24);
          dispatch_source_t v23 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v21, 0LL, v22);
          v24 = *(void **)(v12 + 104);
          *(void *)(v12 + 104) = v23;

          v25 = *(dispatch_source_s **)(v12 + 104);
          if (v25)
          {
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472LL;
            handler[2] = sub_1000FD8D8;
            handler[3] = &unk_1001B0A88;
            handler[4] = v12;
            dispatch_source_set_event_handler(v25, handler);
            v26 = *(dispatch_source_s **)(v12 + 104);
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472LL;
            v53[2] = nullsub_12;
            v53[3] = &unk_1001B0A88;
            id v54 = v13;
            dispatch_source_set_cancel_handler(v26, v53);
            dispatch_resume(*(dispatch_object_t *)(v12 + 104));
            id v27 = sub_10010C0B8();
            [v27 setRequestChildlessSA:1];
            [v27 setExtraSupportedSignatureHashes:0];
            v28 = -[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]( objc_alloc(&OBJC_CLASS___NEIKEv2Listener),  "initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:",  v27,  @"terminusIKE-Pairing-Listener",  v12,  *(void *)(v12 + 24),  v12,  *(void *)(v12 + 24));
            v29 = *(void **)(v12 + 112);
            *(void *)(v12 + 112) = v28;

            if (*(void *)(v12 + 112))
            {
              if (qword_1001DC978 != -1) {
                dispatch_once(&qword_1001DC978, &stru_1001AFA38);
              }
              if (_NRLogIsLevelEnabled(qword_1001DC970, 0LL))
              {
                if (qword_1001DC978 != -1) {
                  dispatch_once(&qword_1001DC978, &stru_1001AFA38);
                }
                _NRLogWithArgs( qword_1001DC970,  0LL,  "%s%.30s:%-4d %@ Created IKE listener",  ",  "-[NRDevicePairingCandidateContext handleConnectedPipe:]"",  1174LL,  v12);
              }
            }

            else
            {
              id v49 = sub_1000FBEC0();
              int v50 = _NRLogIsLevelEnabled(v49, 17LL);

              if (v50)
              {
                id v51 = sub_1000FBEC0();
                _NRLogWithArgs(v51, 17LL, "%@ Failed to create IKE listener", v12);
              }
            }

            goto LABEL_37;
          }

          id v47 = sub_1000FBEC0();
          int v48 = _NRLogIsLevelEnabled(v47, 17LL);

          if (v48)
          {
            id v39 = sub_1000FBEC0();
            _NRLogWithArgs(v39, 17LL, "Failed to created read input source for pipe %@", v13);
            goto LABEL_57;
          }

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v22)
  {
    if (!v8)
    {
      id v18 = sub_1000FBEC0();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v18, 17LL);

      if (!IsLevelEnabled) {
        goto LABEL_24;
      }
      id v11 = sub_1000FBEC0();
      _NRLogWithArgs(v11, 17LL, "%s called with null pipe");
      goto LABEL_23;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 peer]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([v10 identifier]);

    if (v11)
    {
      if (self) {
        cbUUIDCandidateMappings = self->_cbUUIDCandidateMappings;
      }
      else {
        cbUUIDCandidateMappings = 0LL;
      }
      id v13 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( cbUUIDCandidateMappings,  "objectForKeyedSubscript:",  v11));
      if (self) {
        pairingCandidates = self->_pairingCandidates;
      }
      else {
        pairingCandidates = 0LL;
      }
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pairingCandidates,  "objectForKeyedSubscript:",  v13));
      if (v15)
      {
        if (qword_1001DC978 != -1) {
          dispatch_once(&qword_1001DC978, &stru_1001AFA38);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC970, 0LL))
        {
          if (qword_1001DC978 != -1) {
            dispatch_once(&qword_1001DC978, &stru_1001AFA38);
          }
          _NRLogWithArgs( qword_1001DC970,  0LL,  "%s%.30s:%-4d %@ BT pipe for %@ disconnected error %@",  ",  "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidDisconnect:error:]"",  858LL,  self,  v11,  v9);
        }
      }

      else
      {
        if (qword_1001DC978 != -1) {
          dispatch_once(&qword_1001DC978, &stru_1001AFA38);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC970, 0LL))
        {
          if (qword_1001DC978 != -1) {
            dispatch_once(&qword_1001DC978, &stru_1001AFA38);
          }
          _NRLogWithArgs( qword_1001DC970,  0LL,  "%s%.30s:%-4d %@ BT pipe for unknown %@ disconnected error %@",  ",  "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidDisconnect:error:]"",  854LL,  self,  v11,  v9);
        }
      }
    }

    else
    {
      id v20 = sub_1000FBEC0();
      int v21 = _NRLogIsLevelEnabled(v20, 17LL);

      if (!v21)
      {
        id v11 = 0LL;
        goto LABEL_23;
      }

      id v13 = sub_1000FBEC0();
      _NRLogWithArgs( v13,  17LL,  "%s called with null cbUUID",  "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidDisconnect:error:]");
    }
  }

  else
  {
    id v16 = sub_1000FBEC0();
    int v17 = _NRLogIsLevelEnabled(v16, 17LL);

    if (!v17) {
      goto LABEL_24;
    }
    id v11 = sub_1000FBEC0();
    _NRLogWithArgs(v11, 17LL, "%s called with null pipeManager");
  }

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14 = (char *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (qword_1001DC978 != -1) {
    dispatch_once(&qword_1001DC978, &stru_1001AFA38);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC970, 0LL))
  {
    if (qword_1001DC978 != -1) {
      dispatch_once(&qword_1001DC978, &stru_1001AFA38);
    }
    _NRLogWithArgs( qword_1001DC970,  0LL,  "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@",  ",  "-[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBloc k:responseBlock:]"",  876LL,  self,  v14,  v15,  v16);
  }

  if (v17)
  {
    id v46 = sub_1000FBEC0();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v46, 16LL);

    if (IsLevelEnabled)
    {
      id v48 = sub_1000FBEC0();
      _NRLogWithArgs( v48,  16LL,  "%s%.30s:%-4d Unexpectedly received child config %@",  ",  "-[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBl ock:responseBlock:]"",  882LL,  v17);
    }

    goto LABEL_41;
  }

  v65 = self;
  v66 = 0LL;
  id v20 = v15;
  int v21 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
  id v22 = v14;
  if (qword_1001DCAB8 != -1) {
    dispatch_once(&qword_1001DCAB8, &stru_1001AFDD0);
  }
  id v23 = (id)qword_1001DCAB0;
  unsigned int v24 = [v21 isEqual:v23];

  if (!v24)
  {
    id v14 = v22;
    if (qword_1001DC978 != -1) {
      dispatch_once(&qword_1001DC978, &stru_1001AFA38);
    }
    id v15 = v20;
    id v17 = v66;
    if (_NRLogIsLevelEnabled(qword_1001DC970, 16LL))
    {
      if (qword_1001DC978 != -1) {
        dispatch_once(&qword_1001DC978, &stru_1001AFA38);
      }
      id v31 = v18;
      id v43 = (id)qword_1001DC970;
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
      _NRLogWithArgs( v43,  16LL,  "%s%.30s:%-4d Unrecognized local identifier %@",  ",  "-[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBl ock:responseBlock:]"",  930LL,  v44);

      id v30 = 0LL;
      goto LABEL_42;
    }

- (void).cxx_destruct
{
}

@end