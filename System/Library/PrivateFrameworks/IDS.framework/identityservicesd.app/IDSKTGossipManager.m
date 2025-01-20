@interface IDSKTGossipManager
+ (id)sharedInstance;
- (BOOL)canGossipOnService:(id)a3;
- (IDSKTGossipManager)init;
- (IDSKTGossipManager)initWithGossipPolicy:(id)a3 transparencyVerifier:(id)a4 gossipEnabledServices:(id)a5;
- (IDSKTGossipPolicy)gossipPolicy;
- (IDSKeyTransparencyVerifier)transparencyVerifier;
- (NSSet)gossipEnabledServiceIdentifiers;
- (id)gossipSTHPayloadForDestinations:(id)a3 forServiceIdentifier:(id)a4 fromID:(id)a5;
- (id)transparencyVerifierSharedInstance;
- (unsigned)firstGossipChanceFromBag;
- (unsigned)maxRecipientMemoryFromBag;
- (unsigned)subsequentGossipChanceFromBag;
- (void)setGossipPolicy:(id)a3;
- (void)sthReceivedFromGossipReceipient:(id)a3;
@end

@implementation IDSKTGossipManager

+ (id)sharedInstance
{
  if (qword_1009BEA10 != -1) {
    dispatch_once(&qword_1009BEA10, &stru_1008FA318);
  }
  return (id)qword_1009BEA18;
}

- (id)transparencyVerifierSharedInstance
{
  return +[IDSKeyTransparencyVerifier sharedInstance](&OBJC_CLASS___IDSKeyTransparencyVerifier, "sharedInstance");
}

- (IDSKTGossipManager)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___IDSKTGossipPolicySpecification);
  -[IDSKTGossipPolicySpecification setFirstGossipChance:]( v3,  "setFirstGossipChance:",  (char)-[IDSKTGossipManager firstGossipChanceFromBag](self, "firstGossipChanceFromBag"));
  -[IDSKTGossipPolicySpecification setSubsequentGossipChance:]( v3,  "setSubsequentGossipChance:",  (char)-[IDSKTGossipManager subsequentGossipChanceFromBag](self, "subsequentGossipChanceFromBag"));
  -[IDSKTGossipPolicySpecification setMaxRecipientMemory:]( v3,  "setMaxRecipientMemory:",  (char)-[IDSKTGossipManager maxRecipientMemoryFromBag](self, "maxRecipientMemoryFromBag"));
  v4 = -[IDSKTGossipPolicy initWithGossipSpecification:]( objc_alloc(&OBJC_CLASS___IDSKTGossipPolicy),  "initWithGossipSpecification:",  v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTGossipManager transparencyVerifierSharedInstance](self, "transparencyVerifierSharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100948790));
  v7 = -[IDSKTGossipManager initWithGossipPolicy:transparencyVerifier:gossipEnabledServices:]( self,  "initWithGossipPolicy:transparencyVerifier:gossipEnabledServices:",  v4,  v5,  v6);

  return v7;
}

- (IDSKTGossipManager)initWithGossipPolicy:(id)a3 transparencyVerifier:(id)a4 gossipEnabledServices:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSKTGossipManager;
  v12 = -[IDSKTGossipManager init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_gossipPolicy, a3);
    objc_storeStrong((id *)&v13->_transparencyVerifier, a4);
    objc_storeStrong((id *)&v13->_gossipEnabledServiceIdentifiers, a5);
  }

  return v13;
}

- (BOOL)canGossipOnService:(id)a3
{
  return -[NSSet containsObject:](self->_gossipEnabledServiceIdentifiers, "containsObject:", a3);
}

- (id)gossipSTHPayloadForDestinations:(id)a3 forServiceIdentifier:(id)a4 fromID:(id)a5
{
  id v8 = a3;
  id v9 = (os_log_s *)a4;
  id v10 = a5;
  if (-[IDSKTGossipManager canGossipOnService:](self, "canGossipOnService:", v9))
  {
    id v11 = objc_alloc(&OBJC_CLASS___IDSURI);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 _stripPotentialTokenURIWithToken:0]);
    v13 = -[IDSURI initWithPrefixedURI:](v11, "initWithPrefixedURI:", v12);

    id v40 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 destinationURIs]);
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "__imSetByApplyingBlock:", &stru_1008FA338));

    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v47;
LABEL_4:
      uint64_t v20 = 0LL;
      while (1)
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(os_log_s **)(*((void *)&v46 + 1) + 8 * v20);
        if (!-[IDSKTGossipPolicy havePreviouslyGossipedToURI:]( self->_gossipPolicy,  "havePreviouslyGossipedToURI:",  v21)
          && v21 != v13)
        {
          break;
        }

        if (v18 == (id)++v20)
        {
          id v18 = [v16 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v18) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }

      v23 = v21;

      if (v23) {
        goto LABEL_17;
      }
    }

    else
    {
LABEL_11:
    }

    uint32_t v24 = [v16 count];
    v25 = (void *)objc_claimAutoreleasedReturnValue([v16 allObjects]);
    id v26 = [v25 objectAtIndexedSubscript:arc4random_uniform(v24)];
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);

LABEL_17:
    if (v23 == v13)
    {
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v31 = "Trying to gossip to own device. Will not gossip.";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
      }
    }

    else
    {
      if (-[IDSKTGossipPolicy shouldGossipToURI:](self->_gossipPolicy, "shouldGossipToURI:", v23))
      {
        id v45 = 0LL;
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGossip retrieveCurrentVerifiedTLTSTH:]( &OBJC_CLASS___TransparencyGossip,  "retrieveCurrentVerifiedTLTSTH:",  &v45));
        v27 = (os_log_s *)v45;
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
        if (v27)
        {
          id v8 = v40;
          if (v29)
          {
            *(_DWORD *)buf = 138412290;
            v53 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Error retrieving STH from transparencyd: %@",  buf,  0xCu);
          }

          id v22 = 0LL;
          v30 = v39;
        }

        else
        {
          id v38 = v10;
          if (v29)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Successfully retrieved STH from transparencyd, will gossip.",  buf,  2u);
          }

          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          id v32 = v16;
          id v33 = [v32 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v33)
          {
            id v34 = v33;
            uint64_t v35 = *(void *)v42;
            do
            {
              for (i = 0LL; i != v34; i = (char *)i + 1)
              {
                if (*(void *)v42 != v35) {
                  objc_enumerationMutation(v32);
                }
                -[IDSKTGossipPolicy markGossipForURI:]( self->_gossipPolicy,  "markGossipForURI:",  *(void *)(*((void *)&v41 + 1) + 8LL * (void)i));
              }

              id v34 = [v32 countByEnumeratingWithState:&v41 objects:v50 count:16];
            }

            while (v34);
          }

          v30 = v39;
          id v22 = v39;
          id v8 = v40;
          id v10 = v38;
        }

        goto LABEL_40;
      }

      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v31 = "Didn't pass dice roll, will not gossip";
        goto LABEL_27;
      }
    }

    id v22 = 0LL;
    id v8 = v40;
LABEL_40:

    goto LABEL_41;
  }

  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Gossip is not enabled for service: %@",  buf,  0xCu);
  }

  id v22 = 0LL;
LABEL_41:

  return v22;
}

- (void)sthReceivedFromGossipReceipient:(id)a3
{
  id v3 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FD9F0;
  block[3] = &unk_1008F6010;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

- (unsigned)firstGossipChanceFromBag
{
  if (+[IMUserDefaults keyTransparencyFirstGossipChance]( &OBJC_CLASS___IMUserDefaults,  "keyTransparencyFirstGossipChance") >= 1 && CUTIsInternalInstall())
  {
    return +[IMUserDefaults keyTransparencyFirstGossipChance]( &OBJC_CLASS___IMUserDefaults,  "keyTransparencyFirstGossipChance");
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:&stru_100912B50]);

  if (v4 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0)) {
    unsigned __int8 v2 = [v4 unsignedIntValue];
  }
  else {
    unsigned __int8 v2 = 20;
  }

  return v2;
}

- (unsigned)subsequentGossipChanceFromBag
{
  if (+[IMUserDefaults keyTransparencySubsequentGossipChance]( &OBJC_CLASS___IMUserDefaults,  "keyTransparencySubsequentGossipChance") >= 1 && CUTIsInternalInstall())
  {
    return +[IMUserDefaults keyTransparencySubsequentGossipChance]( &OBJC_CLASS___IMUserDefaults,  "keyTransparencySubsequentGossipChance");
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:&stru_100912B50]);

  if (v4 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0)) {
    unsigned __int8 v2 = [v4 unsignedIntValue];
  }
  else {
    unsigned __int8 v2 = 2;
  }

  return v2;
}

- (unsigned)maxRecipientMemoryFromBag
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:&stru_100912B50]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 unsignedIntValue];
  }
  else {
    unsigned __int8 v6 = 100;
  }

  return v6;
}

- (IDSKTGossipPolicy)gossipPolicy
{
  return self->_gossipPolicy;
}

- (void)setGossipPolicy:(id)a3
{
}

- (IDSKeyTransparencyVerifier)transparencyVerifier
{
  return self->_transparencyVerifier;
}

- (NSSet)gossipEnabledServiceIdentifiers
{
  return self->_gossipEnabledServiceIdentifiers;
}

- (void).cxx_destruct
{
}

@end