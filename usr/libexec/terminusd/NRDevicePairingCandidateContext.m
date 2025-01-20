@interface NRDevicePairingCandidateContext
- (BOOL)sendPacketData:(id)a3;
- (NSString)description;
- (void)dealloc;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)setPacketReceiver:(id)a3;
@end

@implementation NRDevicePairingCandidateContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRDevicePairingCandidateContext;
  -[NRDevicePairingCandidateContext dealloc](&v3, "dealloc");
}

- (NSString)description
{
  if (self) {
    self = (NRDevicePairingCandidateContext *)self->_candidateInfo;
  }
  return -[NRDevicePairingCandidateContext description](self, "description");
}

- (BOOL)sendPacketData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v11 = sub_1000FBEC0();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v11, 17LL);

    if (IsLevelEnabled)
    {
      id v13 = sub_1000FBEC0();
      _NRLogWithArgs(v13, 17LL, "%s called with null data", "-[NRDevicePairingCandidateContext sendPacketData:]");
    }

    goto LABEL_11;
  }

  if (self)
  {
    pipeOutputRing = self->_pipeOutputRing;
    if (pipeOutputRing)
    {
      uint64_t next_slot = os_channel_get_next_slot(pipeOutputRing, 0LL, v31);
      if (next_slot)
      {
        uint64_t v7 = next_slot;
        unint64_t v8 = v32;
        if ((unint64_t)[v4 length] <= v8)
        {
          [v4 getBytes:v33 length:v32];
          unsigned __int16 v32 = (unsigned __int16)[v4 length];
          os_channel_set_slot_properties(self->_pipeOutputRing, v7, v31);
          int v9 = os_channel_advance_slot(self->_pipeOutputRing, v7);
          if (v9)
          {
            int v22 = v9;
            id v23 = sub_1000FBEC0();
            int v24 = _NRLogIsLevelEnabled(v23, 17LL);

            if (v24)
            {
              id v25 = sub_1000FBEC0();
              _NRLogWithArgs(v25, 17LL, "os_channel_advance_slot failed: %d", v22);
            }
          }

          uint64_t v10 = os_channel_sync(self->_pipeChannel, 0LL);
          if (!(_DWORD)v10) {
            goto LABEL_8;
          }
          v26 = (void *)v10;
          id v27 = sub_1000FBEC0();
          int v28 = _NRLogIsLevelEnabled(v27, 17LL);

          if (!v28) {
            goto LABEL_8;
          }
          id v21 = sub_1000FBEC0();
          id v17 = v21;
          id v29 = v26;
          v20 = "os_channel_advance_slot failed: %d";
          goto LABEL_21;
        }

        id v18 = sub_1000FBEC0();
        int v19 = _NRLogIsLevelEnabled(v18, 17LL);

        if (v19)
        {
          id v17 = sub_1000FBEC0();
          id v29 = [v4 length];
          uint64_t v30 = v32;
          v20 = "IKE message too large for slot (%zu > %u)";
          id v21 = v17;
LABEL_21:
          _NRLogWithArgs(v21, 17LL, v20, v29, v30);
          goto LABEL_22;
        }
      }

      else
      {
        id v15 = sub_1000FBEC0();
        int v16 = _NRLogIsLevelEnabled(v15, 0LL);

        if (v16)
        {
          id v17 = sub_1000FBEC0();
          [v4 length];
          _NRLogWithArgs(v17, 0LL, "%s%.30s:%-4d Dropping IKE message of length %zu due to no slots");
LABEL_22:
        }
      }

- (void)setPacketReceiver:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!v4)
  {
    id v7 = sub_1000FBEC0();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 17LL);

    id v4 = 0LL;
    if (!IsLevelEnabled) {
      goto LABEL_5;
    }
    ikePacketReceiver = sub_1000FBEC0();
    _NRLogWithArgs( ikePacketReceiver,  17LL,  "%s called with null receiver",  "-[NRDevicePairingCandidateContext setPacketReceiver:]");
    goto LABEL_4;
  }

  if (self)
  {
    v5 = (NEIKEv2PacketReceiver *)v4;
    ikePacketReceiver = self->_ikePacketReceiver;
    self->_ikePacketReceiver = v5;
LABEL_4:

    id v4 = v9;
  }

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v34 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v33 = a7;
  id v17 = a8;
  if (qword_1001DC978 != -1) {
    dispatch_once(&qword_1001DC978, &stru_1001AFA38);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC970, 0LL))
  {
    if (qword_1001DC978 != -1) {
      dispatch_once(&qword_1001DC978, &stru_1001AFA38);
    }
    _NRLogWithArgs( qword_1001DC970,  0LL,  "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@",  ",  "-[NRDevicePairingCandidateContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBl ock:responseBlock:]"",  1955LL,  self,  v34,  v14,  v15);
  }

  if (!v16)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 localIdentifier]);
    int v19 = v14;
    if (qword_1001DCAB8 != -1) {
      dispatch_once(&qword_1001DCAB8, &stru_1001AFDD0);
    }
    id v20 = (id)qword_1001DCAB0;
    unsigned int v21 = [v18 isEqual:v20];

    if (v21)
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue([v15 remoteIdentifier]);
      id v23 = [v22 identifierType];

      if (v23 == (id)13)
      {
        id v24 = [[NEIKEv2AuthenticationProtocol alloc] initWithMethod:13];
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 localIdentifier]);
        v26 = sub_10010C5AC(0, v25, v24);

        id v27 = v33;
        if ((*((unsigned int (**)(id, NEIKEv2SessionConfiguration *))v33 + 2))(v33, v26))
        {
          int v28 = v19;
          if (self)
          {
            sub_1000FC09C((uint64_t)&OBJC_CLASS___NRDevicePairingCandidateContext, (id *)&self->_ikeSessionControl);
            objc_storeStrong((id *)&self->_ikeSessionControl, a4);
            sub_1000FC1F4((uint64_t)self);
          }
        }

        else
        {
          int v28 = v26;
          v26 = 0LL;
        }

        id v14 = v19;
        id v16 = 0LL;
        goto LABEL_30;
      }

      if (qword_1001DC978 != -1) {
        dispatch_once(&qword_1001DC978, &stru_1001AFA38);
      }
      id v14 = v19;
      id v16 = 0LL;
      if (_NRLogIsLevelEnabled(qword_1001DC970, 16LL))
      {
        if (qword_1001DC978 != -1) {
          dispatch_once(&qword_1001DC978, &stru_1001AFA38);
        }
        id v30 = (id)qword_1001DC970;
        id v24 = (id)objc_claimAutoreleasedReturnValue([v15 remoteIdentifier]);
        _NRLogWithArgs( v30,  16LL,  "%s%.30s:%-4d Unrecognized remote identifier %@",  ",  "-[NRDevicePairingCandidateContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAu thBlock:responseBlock:]"",  1966LL,  v24);

        goto LABEL_27;
      }
    }

    else
    {
      id v14 = v19;
      if (qword_1001DC978 != -1) {
        dispatch_once(&qword_1001DC978, &stru_1001AFA38);
      }
      id v16 = 0LL;
      if (_NRLogIsLevelEnabled(qword_1001DC970, 16LL))
      {
        if (qword_1001DC978 != -1) {
          dispatch_once(&qword_1001DC978, &stru_1001AFA38);
        }
        id v29 = (id)qword_1001DC970;
        id v24 = (id)objc_claimAutoreleasedReturnValue([v15 localIdentifier]);
        _NRLogWithArgs( v29,  16LL,  "%s%.30s:%-4d Unrecognized local identifier %@",  ",  "-[NRDevicePairingCandidateContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAu thBlock:responseBlock:]"",  1980LL,  v24);

        goto LABEL_27;
      }
    }

- (void).cxx_destruct
{
}

@end