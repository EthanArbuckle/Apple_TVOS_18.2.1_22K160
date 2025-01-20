@interface IDSMultiplexerGroupSessionTransport
- (BOOL)_tryConsumeQUICShortHeaderPacketBuffer:(id *)a3;
- (BOOL)addListenerConnection:(id)a3;
- (BOOL)tryConsumePacketBuffer:(id *)a3;
- (IDSGroupEncryptionKeyManager)fanoutEncryptionManager;
- (IDSMultiplexerGroupSessionTransport)initWithIdentifier:(id)a3;
- (IDSMultiplexerTransportParticipantIDConverter)participantIDToAliasConverter;
- (NSString)description;
- (NSString)identifier;
- (id)routeClientConnections:(id)a3;
- (id)routedConnections;
- (int)packetizationHeadroom;
- (void)cancelClientConnection:(id)a3;
- (void)invalidate;
- (void)purgeQUICConnectionsForParticipants:(id)a3;
- (void)resetConnectionForPacketBuffer:(id *)a3;
- (void)setFanoutEncryptionManager:(id)a3;
- (void)setPacketBufferReadHandler:(id)a3;
- (void)setParticipantIDToAliasConverter:(id)a3;
@end

@implementation IDSMultiplexerGroupSessionTransport

- (IDSMultiplexerGroupSessionTransport)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___IDSMultiplexerGroupSessionTransport;
  v6 = -[IDSMultiplexerGroupSessionTransport init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    portSignatures = v7->_portSignatures;
    v7->_portSignatures = (NSMutableArray *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    participantIDs = v7->_participantIDs;
    v7->_participantIDs = (NSMutableArray *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    routedConnections = v7->_routedConnections;
    v7->_routedConnections = (NSMutableArray *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    listeners = v7->_listeners;
    v7->_listeners = (NSMutableArray *)v14;

    objc_storeStrong((id *)&v7->_identifier, a3);
    v16 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  1282LL,  20LL);
    fanoutEncryptionMKIToReceivingStateMap = v7->_fanoutEncryptionMKIToReceivingStateMap;
    v7->_fanoutEncryptionMKIToReceivingStateMap = v16;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%p MultiplexerLocalTransport %@",  self,  self->_identifier);
}

- (int)packetizationHeadroom
{
  return 88;
}

- (void)cancelClientConnection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteTCPSYN]);

    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v8 = _IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSSessionMultiplexer.m",  177LL);
    *(_DWORD *)(v8 + 536) |= 1u;
    *(void *)(v8 + 488) = [v5 context];
    v9 = *(_BYTE **)v8;
    **(_DWORD **)uint64_t v8 = 2009124602;
    unsigned int v10 = [v5 portsSignature];
    char v11 = HIBYTE(v10);
    unsigned int v12 = HIWORD(v10);
    unsigned __int16 v13 = (unsigned __int16)[v5 portsSignature];
    v9[4] = v11;
    v9[5] = v12;
    v9[6] = HIBYTE(v13);
    v9[7] = v13;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteTCPSYN]);
    unsigned int v15 = [v14 unsignedLongValue];

    v9[8] = HIBYTE(v15);
    v9[9] = BYTE2(v15);
    v9[10] = BYTE1(v15);
    v9[11] = v15;
    *(void *)(v8 + 16) = &v9[-*(void *)v8 + 12];
    *(_DWORD *)(v8 + 536) |= 0x4000u;
    kdebug_trace(722010320LL, 0LL, 0LL, 0LL, 0LL);
    LOBYTE(v15) = (*((uint64_t (**)(void))self->_readHandler + 2))();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if ((v15 & 1) != 0)
    {
      if (v17)
      {
        v18 = sub_1001FF4E0(*(void *)v8, *(void *)(v8 + 16));
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v18;
        objc_super v19 = "Mutliplexer Transport cancelClientConnection: sent control packet for connection %@\n%s";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
      }
    }

    else if (v17)
    {
      v21 = sub_1001FF4E0(*(void *)v8, *(void *)(v8 + 16));
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v21;
      objc_super v19 = "Mutliplexer Transport cancelClientConnection: failed to send control packet for connection %@\n%s";
      goto LABEL_12;
    }

LABEL_14:
    os_unfair_lock_lock(&self->_lock);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    uint64_t v47 = -1LL;
    routedConnections = self->_routedConnections;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1000EF270;
    v37[3] = &unk_1008FA118;
    v23 = v5;
    v38 = v23;
    v39 = buf;
    -[NSMutableArray enumerateObjectsUsingBlock:](routedConnections, "enumerateObjectsUsingBlock:", v37);
    if (*(void *)(*(void *)&buf[8] + 24LL) == -1LL)
    {
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = self->_routedConnections;
        *(_DWORD *)v40 = 138412546;
        v41 = v23;
        __int16 v42 = 2112;
        v43 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Mutliplexer Transport cancelClientConnection: did not find connection %@ in _routedConnections %@",  v40,  0x16u);
      }
    }

    else
    {
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(NSMutableArray **)(*(void *)&buf[8] + 24LL);
        v26 = self->_routedConnections;
        *(_DWORD *)v40 = 134218498;
        v41 = v25;
        __int16 v42 = 2112;
        v43 = v23;
        __int16 v44 = 2112;
        v45 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Mutliplexer Transport cancelClientConnection: removing (at index %lu) connection %@ from _routedConnections %@",  v40,  0x20u);
      }

      -[NSMutableArray removeObjectAtIndex:]( self->_portSignatures,  "removeObjectAtIndex:",  *(void *)(*(void *)&buf[8] + 24LL));
      -[NSMutableArray removeObjectAtIndex:]( self->_participantIDs,  "removeObjectAtIndex:",  *(void *)(*(void *)&buf[8] + 24LL));
      -[NSMutableArray removeObjectAtIndex:]( self->_routedConnections,  "removeObjectAtIndex:",  *(void *)(*(void *)&buf[8] + 24LL));
    }

    *(void *)(*(void *)&buf[8] + 24LL) = -1LL;
    listeners = self->_listeners;
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    v33 = sub_1000EF298;
    v34 = &unk_1008FA118;
    v30 = v23;
    v35 = v30;
    v36 = buf;
    -[NSMutableArray enumerateObjectsUsingBlock:](listeners, "enumerateObjectsUsingBlock:", &v31);
    if (*(void *)(*(void *)&buf[8] + 24LL) != -1LL) {
      -[NSMutableArray removeObjectAtIndex:](self->_listeners, "removeObjectAtIndex:", v31, v32, v33, v34);
    }
    -[NSMutableArray invalidate](v30, "invalidate", v31, v32, v33, v34);

    _Block_object_dispose(buf, 8);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_24;
  }

  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Mutliplexer Transport cancelClientConnection: failed because transport is invalidated",  buf,  2u);
  }

LABEL_24:
}

- (id)routeClientConnections:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_invalidated);
  unsigned __int8 v6 = &IMInsertBoolsToXPCDictionary_ptr;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Multiplexer Transport routeClientConnections: failed because transport is invalidated",  buf,  2u);
    }

    id v43 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }

  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v60 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "GroupSessionTransport routing %@", buf, 0xCu);
    }

    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v56 = 0u;
    __int128 v55 = 0u;
    id v45 = v4;
    id obj = v4;
    id v48 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v48)
    {
      os_unfair_lock_t lock = &self->_lock;
      uint64_t v47 = *(void *)v56;
      do
      {
        for (i = 0LL; i != v48; i = (char *)i + 1)
        {
          if (*(void *)v56 != v47) {
            objc_enumerationMutation(obj);
          }
          unsigned int v10 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
          char v11 = (void *)objc_claimAutoreleasedReturnValue([v10 multiplexerParams]);
          id v12 = [v11 participantID];

          if (v12)
          {
            unsigned __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 multiplexerParams]);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 salt]);

            if (v14)
            {
              participantIDToAliasConverter = self->_participantIDToAliasConverter;
              v16 = (void *)objc_claimAutoreleasedReturnValue([v10 multiplexerParams]);
              id v17 = [v16 participantID];
              v18 = (void *)objc_claimAutoreleasedReturnValue([v10 multiplexerParams]);
              objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v18 salt]);
              id v20 = -[IDSMultiplexerTransportParticipantIDConverter participantIDForAlias:salt:]( participantIDToAliasConverter,  "participantIDForAlias:salt:",  v17,  v19);

              v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
              LODWORD(v18) = [v21 isInternalInstall];

              if ((_DWORD)v18
                && IMGetDomainBoolForKeyWithDefaultValue( @"com.apple.ids",  @"MUXFailParticipantIDTranslation",  0LL))
              {
                v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6[219] Multiplexer]);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Internal: failParticipantIDTranslation triggers participant ID being set to 0 for aliases",  buf,  2u);
                }

LABEL_32:
                __int16 v42 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupSessionMultiplexer sharedInstance]( &OBJC_CLASS___IDSGroupSessionMultiplexer,  "sharedInstance"));
                [v42 resetConnection:v10 errorCode:61];

                [v10 invalidate];
                continue;
              }

              if (!v20) {
                goto LABEL_32;
              }
              [v10 setContext:v20];
            }

            else
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue([v10 multiplexerParams]);
              objc_msgSend(v10, "setContext:", objc_msgSend(v31, "participantID"));
            }
          }

          else
          {
            v23 = v6;
            os_unfair_lock_lock(lock);
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            v24 = self->_listeners;
            id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v51,  v61,  16LL);
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v52;
              do
              {
                for (j = 0LL; j != v26; j = (char *)j + 1)
                {
                  if (*(void *)v52 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  v29 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)j);
                  unsigned int v30 = [v29 localPort];
                }

                id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v51,  v61,  16LL);
              }

              while (v26);
            }

            os_unfair_lock_unlock(lock);
            unsigned __int8 v6 = v23;
          }

          id v32 = [v10 context];
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6[219] Multiplexer]);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v34 = [v10 portsSignature];
            id v35 = [v10 context];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v60 = v34;
            *(_WORD *)&v60[4] = 2048;
            *(void *)&v60[6] = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[IDSSessionMultiplexer routeClientConnections] portsSignature:%08X participantID:%llu",  buf,  0x12u);
          }

          os_unfair_lock_lock(lock);
          portSignatures = self->_portSignatures;
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v10 portsSignature]));
          -[NSMutableArray addObject:](portSignatures, "addObject:", v37);

          participantIDs = self->_participantIDs;
          v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v32));
          -[NSMutableArray addObject:](participantIDs, "addObject:", v39);

          -[NSMutableArray addObject:](self->_routedConnections, "addObject:", v10);
          os_unfair_lock_unlock(lock);
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472LL;
          v50[2] = sub_1000EF898;
          v50[3] = &unk_1008FA168;
          v50[4] = self;
          v50[5] = v10;
          v50[6] = v32;
          v40 = objc_retainBlock(v50);
          [v10 setPacketBufferReadHandler:v40];
          v41 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupSessionMultiplexer sharedInstance]( &OBJC_CLASS___IDSGroupSessionMultiplexer,  "sharedInstance"));
          [v41 setupTransportForConnection:v10];

          [v10 startReadOnTransportThread];
        }

        id v48 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
      }

      while (v48);
    }

    id v43 = obj;
    id v4 = v45;
  }

  return v43;
}

- (void)setPacketBufferReadHandler:(id)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v3 & 1) != 0)
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer", a3));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Mutliplexer Transport setPacketBufferReadHandler: failed because transport is invalidated",  v8,  2u);
    }
  }

  else
  {
    id v5 = objc_retainBlock(a3);
    id readHandler = self->_readHandler;
    self->_id readHandler = v5;
  }

- (void)resetConnectionForPacketBuffer:(id *)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v3 & 1) != 0)
  {
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer", a3));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Mutliplexer Transport resetConnectionForPacketBuffer: failed because transport is invalidated",  (uint8_t *)&buf,  2u);
    }

    goto LABEL_5;
  }

  int64_t var2 = a3->var2;
  if (var2 <= 3)
  {
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = sub_1001FF4E0((uint64_t)a3->var0, a3->var2);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Control packet doesn't have enough bytes %s",  (uint8_t *)&buf,  0xCu);
    }

- (void)purgeQUICConnectionsForParticipants:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v5 & 1) != 0)
  {
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Mutliplexer Transport purgeQUICConnectionsForParticipants: failed because transport is invalidated",  buf,  2u);
    }
  }

  else
  {
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    unsigned __int8 v6 = self->_routedConnections;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v29,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          unsigned int v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v12 = [v10 isQUIC];
            *(_DWORD *)__int128 buf = 138412802;
            unsigned __int16 v13 = @"NO";
            if (v12) {
              unsigned __int16 v13 = @"YES";
            }
            v24 = v10;
            __int16 v25 = 2112;
            uint64_t v26 = v13;
            __int16 v27 = 2112;
            id v28 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "purgeQUICConnectionsForParticipants: checking connection %@ isQUIC: %@ for participants %@",  buf,  0x20u);
          }

          if ([v10 isQUIC])
          {
            if (!v4
              || (uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 context])),  v15 = objc_msgSend(v4, "containsObject:", v14),  v14,  v15))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupSessionMultiplexer sharedInstance]( &OBJC_CLASS___IDSGroupSessionMultiplexer,  "sharedInstance"));
              [v16 resetConnection:v10];

              [v10 invalidate];
            }
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v29,  16LL);
      }

      while (v7);
    }

    os_unfair_lock_unlock(lock);
  }
}

- (BOOL)addListenerConnection:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v5 & 1) != 0)
  {
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Mutliplexer Transport addListenerConnection: failed because transport is invalidated",  buf,  2u);
    }
  }

  else
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableArray addObject:](self->_listeners, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      listeners = self->_listeners;
      *(_DWORD *)__int128 buf = 138412802;
      id v19 = v4;
      __int16 v20 = 2112;
      __int128 v21 = listeners;
      __int16 v22 = 2112;
      __int16 v23 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "added listener connection %@ to listeners %@\nLocalMUXTransport %@",  buf,  0x20u);
    }

    unsigned int v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = sub_1000F0840;
    unsigned int v15 = &unk_1008FA1B8;
    v16 = self;
    id v8 = v4;
    id v17 = v8;
    v9 = objc_retainBlock(&v12);
    objc_msgSend(v8, "setPacketBufferReadHandler:", v9, v12, v13, v14, v15, v16);
    [v8 startReadOnTransportThread];
  }

  return (v5 & 1) == 0;
}

- (BOOL)_tryConsumeQUICShortHeaderPacketBuffer:(id *)a3
{
  if (-[NSMutableArray count](self->_routedConnections, "count"))
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_routedConnections,  "objectAtIndexedSubscript:",  0LL));
    [v5 writePacketBuffer:a3];
  }

  else
  {
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_tryConsumeQUICShortHeaderPacketBuffer: no reliable unicast connection to consume packetBuffer.",  v8,  2u);
    }
  }

  return 1;
}

- (BOOL)tryConsumePacketBuffer:(id *)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v3 & 1) != 0)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer", a3));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Mutliplexer Transport tryConsumePacketBuffer: failed because transport is invalidated",  buf,  2u);
    }

    return 0;
  }

  if (a3->var2 <= 3)
  {
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int64_t var2 = a3->var2;
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)v67 = var2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "not enough header %ld to consume", buf, 0xCu);
    }

    return 0;
  }

  unsigned int v10 = bswap32(*(_DWORD *)a3->var0);
  if (v10 == -87113609)
  {
    IDSLinkPacketBufferAddBufferStart(a3, 4LL);
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)v67 = -87113609;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "header %08X is is control packet", buf, 8u);
    }

    -[IDSMultiplexerGroupSessionTransport resetConnectionForPacketBuffer:](self, "resetConnectionForPacketBuffer:", a3);
    return 1;
  }

  if (a3->var15) {
    return -[IDSMultiplexerGroupSessionTransport _tryConsumeQUICShortHeaderPacketBuffer:]( self,  "_tryConsumeQUICShortHeaderPacketBuffer:");
  }
  if (v10 == -87133353)
  {
    kdebug_trace(722010396LL, 0LL, 0LL, 0LL, 0LL);
    unint64_t var4 = a3->var24[0].var4;
    if (var4 || byte_1009C7518)
    {
      IDSLinkPacketBufferAddBufferStart(a3, 4LL);
      goto LABEL_22;
    }

    if (a3->var2 <= 33)
    {
      unsigned int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v31 = a3->var2;
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)v67 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "packet is fanout but doest not have enough bytes for encryption header %ld",  buf,  0xCu);
      }

      return 1;
    }

    unsigned int v33 = *((unsigned __int16 *)a3->var0 + 2);
    int v34 = *((unsigned __int8 *)a3->var0 + 6);
    int v35 = *((unsigned __int8 *)a3->var0 + 7);
    int v36 = *((unsigned __int8 *)a3->var0 + 8);
    int v37 = *((unsigned __int8 *)a3->var0 + 9);
    v38 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", a3->var0 + 10);
    value = (void *)0xAAAAAAAAAAAAAAAALL;
    if (NSMapMember(self->_fanoutEncryptionMKIToReceivingStateMap, v38, 0LL, &value))
    {
      v39 = value;
    }

    else
    {
      int v42 = (v34 << 24) | (v35 << 16) | (v36 << 8) | v37;
      v39 = malloc(0x11F0uLL);
      fanoutEncryptionManager = self->_fanoutEncryptionManager;
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472LL;
      v64[2] = sub_1000F1314;
      v64[3] = &unk_1008FA1D8;
      v64[4] = v39;
      int v65 = v42;
      if ((-[IDSGroupEncryptionKeyManager useDecryptingKeyForKeyIndex:handler:]( fanoutEncryptionManager,  "useDecryptingKeyForKeyIndex:handler:",  v38,  v64) & 1) == 0)
      {
        free(v39);
        id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)v67 = v38;
          v46 = "Fanout encryption - useDecryptingKeyForKeyIndex %@ failed - dropping incoming packet";
          uint64_t v47 = v45;
          uint32_t v48 = 12;
          goto LABEL_66;
        }

- (void)invalidate
{
  id readHandler = self->_readHandler;
  self->_id readHandler = 0LL;

  participantIDToAliasConverter = self->_participantIDToAliasConverter;
  self->_participantIDToAliasConverter = 0LL;

  fanoutEncryptionSendingEncryptionState = self->_fanoutEncryptionSendingEncryptionState;
  if (fanoutEncryptionSendingEncryptionState)
  {
    sub_1001FD114((uint64_t)fanoutEncryptionSendingEncryptionState);
    free(self->_fanoutEncryptionSendingEncryptionState);
    self->_fanoutEncryptionSendingEncryptionState = 0LL;
  }

  fanoutEncryptionSendingMKI = self->_fanoutEncryptionSendingMKI;
  self->_fanoutEncryptionSendingMKI = 0LL;

  memset(&enumerator, 170, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, self->_fanoutEncryptionMKIToReceivingStateMap);
  value = (void *)0xAAAAAAAAAAAAAAAALL;
  while (NSNextMapEnumeratorPair(&enumerator, 0LL, &value))
  {
    id v7 = value;
    sub_1001FD114((uint64_t)value);
    free(v7);
  }

  NSEndMapTableEnumeration(&enumerator);
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v9 = self->_routedConnections;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v21,  v28,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      unsigned int v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v12) invalidate];
        unsigned int v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v21,  v28,  16LL);
    }

    while (v10);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v13 = self->_listeners;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v17,  v27,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      unsigned int v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v16), "invalidate", (void)v17);
        unsigned int v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v17,  v27,  16LL);
    }

    while (v14);
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)routedConnections
{
  return self->_routedConnections;
}

- (IDSGroupEncryptionKeyManager)fanoutEncryptionManager
{
  return self->_fanoutEncryptionManager;
}

- (void)setFanoutEncryptionManager:(id)a3
{
}

- (IDSMultiplexerTransportParticipantIDConverter)participantIDToAliasConverter
{
  return self->_participantIDToAliasConverter;
}

- (void)setParticipantIDToAliasConverter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end