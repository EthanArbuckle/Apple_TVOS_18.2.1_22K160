@interface NRIKEv2Listener
- (NRIKEv2Listener)init;
- (NSString)description;
- (void)listener:(id)a3 receivedNewSession:(id)a4;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
@end

@implementation NRIKEv2Listener

- (NSString)description
{
  if (self) {
    self = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"NRIKEv2Listener[%@]",  @"62743");
  }
  return (NSString *)self;
}

- (NRIKEv2Listener)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NRIKEv2Listener;
  v2 = -[NRIKEv2Listener init](&v16, "init");
  if (!v2)
  {
    id v7 = sub_10000D3A0();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 16LL);

    if (IsLevelEnabled)
    {
      id v9 = sub_10000D3A0();
      _NRLogWithArgs(v9, 16LL, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRIKEv2Listener init]"", 129);
    }

    uint64_t v10 = _os_log_pack_size(12LL);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v12 = __error();
    uint64_t v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "-[NRIKEv2Listener init]";
    id v14 = sub_10000D3A0();
    _NRLogAbortWithPack(v14, v11);
  }

  v3 = v2;
  v4 = sub_100146AFC();
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v4;

  return v3;
}

- (void)listener:(id)a3 receivedNewSession:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (!v12)
  {
    id v7 = sub_10000D3A0();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_9;
    }
    id v9 = sub_10000D3A0();
    _NRLogWithArgs(v9, 17LL, "%s called with null listener");
LABEL_14:

    goto LABEL_9;
  }

  if (!v6)
  {
    id v10 = sub_10000D3A0();
    int v11 = _NRLogIsLevelEnabled(v10, 17LL);

    if (!v11) {
      goto LABEL_9;
    }
    id v9 = sub_10000D3A0();
    _NRLogWithArgs(v9, 17LL, "%s called with null session");
    goto LABEL_14;
  }

  if (qword_1001DC650 != -1) {
    dispatch_once(&qword_1001DC650, &stru_1001ADF08);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC648, 0LL))
  {
    if (qword_1001DC650 != -1) {
      dispatch_once(&qword_1001DC650, &stru_1001ADF08);
    }
    _NRLogWithArgs( qword_1001DC648,  0LL,  "%s%.30s:%-4d %@: Received new session: %@",  ",  "-[NRIKEv2Listener listener:receivedNewSession:]"",  604LL,  self,  v6);
  }

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14 = (NEIKEv2Listener *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v19;
  if (!v14)
  {
    id v106 = v19;
    id v107 = sub_10000D3A0();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v107, 17LL);

    if (IsLevelEnabled)
    {
      id v109 = sub_10000D3A0();
      _NRLogWithArgs( v109,  17LL,  "%s called with null listener",  "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]");
    }

    v21 = v15;
    id v20 = v106;
    goto LABEL_12;
  }

  v21 = v15;
  if (!v15)
  {
    id v110 = v19;
    id v111 = sub_10000D3A0();
    int v112 = _NRLogIsLevelEnabled(v111, 17LL);

    if (v112)
    {
      id v113 = sub_10000D3A0();
      _NRLogWithArgs( v113,  17LL,  "%s called with null session",  "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]");
    }

    id v20 = v110;
    goto LABEL_12;
  }

  if (!v19)
  {
    id v114 = sub_10000D3A0();
    int v115 = _NRLogIsLevelEnabled(v114, 17LL);

    if (v115)
    {
      id v116 = sub_10000D3A0();
      _NRLogWithArgs( v116,  17LL,  "%s called with null responseBlock",  "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]");
    }

    id v20 = 0LL;
    goto LABEL_12;
  }

  if (self->_ikeListener != v14)
  {
    if (qword_1001DC650 != -1) {
      dispatch_once(&qword_1001DC650, &stru_1001ADF08);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC648, 0LL))
    {
      if (qword_1001DC650 != -1) {
        dispatch_once(&qword_1001DC650, &stru_1001ADF08);
      }
      _NRLogWithArgs( qword_1001DC648,  0LL,  "%s%.30s:%-4d %@: Ignoring received session for a stale listener %p != %p",  ",  "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  621LL,  self,  self->_ikeListener,  v14);
    }

    goto LABEL_11;
  }

  v134 = v19;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
  id v23 = [v22 identifierType];

  if (v23 != (id)11)
  {
    if (qword_1001DC650 != -1) {
      dispatch_once(&qword_1001DC650, &stru_1001ADF08);
    }
    id v20 = v134;
    if (qword_1001DC650 != -1) {
      dispatch_once(&qword_1001DC650, &stru_1001ADF08);
    }
    id v49 = (id)qword_1001DC648;
    v50 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
    _NRLogWithArgs( v49,  16,  "%s%.30s:%-4d %@: Local identifier has wrong type %zu",  ",  "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]",  626,  self,  [v50 identifierType]);
LABEL_46:

    id v20 = v134;
    goto LABEL_11;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteIdentifier]);
  id v25 = [v24 identifierType];

  if (v25 != (id)11)
  {
    if (qword_1001DC650 != -1) {
      dispatch_once(&qword_1001DC650, &stru_1001ADF08);
    }
    id v20 = v134;
    if (qword_1001DC650 != -1) {
      dispatch_once(&qword_1001DC650, &stru_1001ADF08);
    }
    id v49 = (id)qword_1001DC648;
    v50 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteIdentifier]);
    _NRLogWithArgs( v49,  16,  "%s%.30s:%-4d %@: Remote identifier has wrong type %zu",  ",  "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]",  629,  self,  [v50 identifierType]);
    goto LABEL_46;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
  v132 = v18;
  v133 = v17;
  v136 = self;
  if (qword_1001DCAA8 != -1) {
    dispatch_once(&qword_1001DCAA8, &stru_1001AFDB0);
  }
  id v27 = (id)qword_1001DCAA0;
  if (([v26 isEqual:v27] & 1) == 0)
  {

    goto LABEL_48;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteIdentifier]);
  if (qword_1001DCAA8 != -1) {
    dispatch_once(&qword_1001DCAA8, &stru_1001AFDB0);
  }
  id v29 = (id)qword_1001DCAA0;
  unsigned int v30 = [v28 isEqual:v29];

  if (!v30)
  {
LABEL_48:
    v51 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
    id v20 = v134;
    if (qword_1001DCAB8 != -1) {
      dispatch_once(&qword_1001DCAB8, &stru_1001AFDD0);
    }
    id v18 = v132;
    id v17 = v133;
    id v52 = (id)qword_1001DCAB0;
    unsigned int v53 = [v51 isEqual:v52];

    if (v53)
    {
      pairingManager = v136->_pairingManager;
      if (pairingManager)
      {
        -[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]( pairingManager,  "requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:",  v14,  v21,  v16,  v133,  v132,  v134);
        goto LABEL_12;
      }

      goto LABEL_11;
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteIdentifier]);
    unsigned __int8 v57 = [v55 isEqual:v56];

    unsigned __int8 v138 = v57;
    v131 = v16;
    if ((v57 & 1) != 0)
    {
      __int128 v142 = 0u;
      __int128 v143 = 0u;
      __int128 v144 = 0u;
      __int128 v145 = 0u;
      v58 = sub_1001314D4((uint64_t)&OBJC_CLASS___NRDLocalDevice);
      v59 = (NSUUID *)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v58,  "countByEnumeratingWithState:objects:count:",  &v142,  v150,  16LL);
      if (v59)
      {
        uint64_t v60 = *(void *)v143;
LABEL_62:
        uint64_t v76 = 0LL;
        while (1)
        {
          if (*(void *)v143 != v60) {
            objc_enumerationMutation(v58);
          }
          v77 = *(void **)(*((void *)&v142 + 1) + 8 * v76);
          v78 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v77);
          if ((!v78 || !_os_feature_enabled_impl("terminus", "EncryptedIdentity") || !v78[11])
            && sub_100107E48(v78) == 1)
          {
            break;
          }

          if (v59 == (NSUUID *)++v76)
          {
            v59 = (NSUUID *)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v58,  "countByEnumeratingWithState:objects:count:",  &v142,  v150,  16LL);
            if (!v59) {
              goto LABEL_78;
            }
            goto LABEL_62;
          }
        }

        v59 = v77;
        if (qword_1001DC650 != -1) {
          dispatch_once(&qword_1001DC650, &stru_1001ADF08);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC648, 1LL))
        {
          id v79 = sub_10000D3A0();
          _NRLogWithArgs( v79,  1LL,  "%s%.30s:%-4d %@: No encrypted identity included by initiator, trying %@",  ",  "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  698LL,  v136,  v59);
        }

LABEL_78:
        id v20 = v134;
      }

      goto LABEL_80;
    }

    v61 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteIdentifier]);
    v62 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
    v63 = sub_10012A74C((uint64_t)&OBJC_CLASS___NRDLocalDevice, v61, v62, v21);

    id v64 = sub_10000D3A0();
    v65 = v64;
    if (v63)
    {
      int v66 = _NRLogIsLevelEnabled(v64, 1LL);

      if (v66)
      {
        id v67 = sub_10000D3A0();
        v68 = v63->_identity;
        _NRLogWithArgs( v67,  1LL,  "%s%.30s:%-4d %@: Decrypted device identity %@",  ",  "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  681LL,  v136,  v68);
      }

      v69 = v63->_nrUUID;

      if (v69)
      {
        v59 = v63->_nrUUID;

LABEL_80:
        if (v59)
        {
          v80 = sub_100129C28((uint64_t)&OBJC_CLASS___NRDLocalDevice, v59, 0);
          v81 = v80;
          if (v80 && v80[9])
          {
            v82 = (void *)objc_claimAutoreleasedReturnValue([v21 ikeInterfaceName]);
            v83 = (void *)objc_claimAutoreleasedReturnValue([v21 localEndpoint]);
            v84 = sub_10000D498((uint64_t)v136, v82, v83, v59);

            id v85 = sub_10000D3A0();
            LODWORD(v83) = _NRLogIsLevelEnabled(v85, 1LL);

            if ((_DWORD)v83)
            {
              id v86 = sub_10000D3A0();
              v87 = v86;
              if (v136) {
                links = v136->_links;
              }
              else {
                links = 0LL;
              }
              _NRLogWithArgs( v86,  1LL,  "%s%.30s:%-4d %@: Got config request for %@ session %@ registered links %@ sessionConfig %@ childConfig %@ ",  ",  "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  719LL,  v136,  v84,  v21,  links,  v131,  v133);
            }

            if (v84)
            {
              if (v136) {
                v89 = v136->_links;
              }
              else {
                v89 = 0LL;
              }
              uint64_t v90 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v89, "objectForKeyedSubscript:", v84));
              v91 = (id *)v90;
              if (v90)
              {
                id v92 = *(id *)(v90 + 24);
                if (v92)
                {
                  v93 = v92;
                  unsigned int v94 = [v91[3] state];

                  if (v94 != 255)
                  {
                    id v95 = v91[3];
                    if (v95)
                    {
                      v96 = v95;
                      v97 = v91;
                      id v20 = v134;
LABEL_107:
                      if ((v138 & 1) == 0)
                      {
                        v139[0] = _NSConcreteStackBlock;
                        v139[1] = 3221225472LL;
                        v139[2] = sub_10000DB18;
                        v139[3] = &unk_1001ADEE8;
                        id v141 = v20;
                        v140 = v59;
                        id v20 = objc_retainBlock(v139);
                      }

                      [v96 requestConfigurationForListener:v14 session:v21 sessionConfig:v131 childConfig:v133 validateAuthBlock:v132 responseBlock:v20];

                      goto LABEL_111;
                    }
                  }
                }
              }

              if (v136) {
                pairingClients = v136->_pairingClients;
              }
              else {
                pairingClients = 0LL;
              }
              v97 = (id *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pairingClients,  "objectForKeyedSubscript:",  v84));

              id v20 = v134;
              if (v97)
              {
                id v102 = v97[4];
                if (v102)
                {
                  v103 = (unsigned __int8 *)v97[4];
                  if (v103)
                  {
                    int v104 = v103[8];

                    if (v104 == 6) {
                      goto LABEL_110;
                    }
                  }

                  else
                  {
                  }

                  id v105 = v97[4];
                  if (v105)
                  {
                    v96 = v105;
                    goto LABEL_107;
                  }
                }
              }

- (void).cxx_destruct
{
}

@end