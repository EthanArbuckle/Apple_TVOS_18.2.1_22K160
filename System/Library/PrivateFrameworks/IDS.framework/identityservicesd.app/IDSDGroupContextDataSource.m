@interface IDSDGroupContextDataSource
+ (id)sharedInstance;
- (IDSDGroupContextDataSource)init;
- (IDSGroupServer)groupServer;
- (id)_groupWithDeviceIdentity:(id)a3 parent:(id)a4 groupInfo:(id)a5 error:(id *)a6;
- (id)_sponsorAccount;
- (id)_sponsorAlias;
- (void)_groupFromServerResponse:(id)a3 context:(id)a4 groupID:(id)a5 error:(id)a6 resultCode:(int64_t)a7 resultDictionary:(id)a8 allEntries:(id)a9 completion:(id)a10;
- (void)groupContext:(id)a3 fetchGroupWithID:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 upsertGroupWithInfo:(id)a4 previousGroup:(id)a5 completion:(id)a6;
- (void)groupFromPublicDataRepresentation:(id)a3 inContext:(id)a4 completion:(id)a5;
- (void)participantsForCypher:(id)a3 completion:(id)a4;
- (void)publicDataRepresentationForGroup:(id)a3 inContext:(id)a4 completion:(id)a5;
- (void)setGroupServer:(id)a3;
- (void)validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5;
@end

@implementation IDSDGroupContextDataSource

+ (id)sharedInstance
{
  if (qword_1009BEA20 != -1) {
    dispatch_once(&qword_1009BEA20, &stru_1008FA358);
  }
  return (id)qword_1009BEA28;
}

- (IDSDGroupContextDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSDGroupContextDataSource;
  v2 = -[IDSDGroupContextDataSource init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___IDSGroupServer);
    groupServer = v2->_groupServer;
    v2->_groupServer = v3;
  }

  return v2;
}

- (void)groupContext:(id)a3 upsertGroupWithInfo:(id)a4 previousGroup:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 accountIdentity]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceKey]);

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___IDSDeviceIdentity, v16);
  if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
  {
    v53 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v10 accountIdentity]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 deviceKey]);

    v55 = (void *)objc_claimAutoreleasedReturnValue([v12 cypher]);
    id v71 = 0LL;
    v54 = (void *)objc_claimAutoreleasedReturnValue([v55 conversationGroup]);
    v56 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDGroupContextDataSource _groupWithDeviceIdentity:parent:groupInfo:error:]( self,  "_groupWithDeviceIdentity:parent:groupInfo:error:",  v19));
    id v21 = v71;
    v57 = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v19 accountIdentity]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 signingIdentity]);
    id v70 = v21;
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v20 publicDataRepresentationWithSponsor:v23 error:&v70]);
    id v25 = v70;

    v26 = (void *)v24;
    if (v24)
    {
      id v69 = v25;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v24));
      uint64_t v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "signData:error:"));
      id v52 = v25;

      v28 = v20;
      v29 = (void *)v27;
      if (v27)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue([v28 publicKeyData]);
        if (v12)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue([v28 forwardingTicket]);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v12 groupID]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v31 stableGroupID]);
          v50 = (void *)objc_claimAutoreleasedReturnValue([v32 dataRepresentation]);

          v33 = (void *)objc_claimAutoreleasedReturnValue([v12 groupID]);
          v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (int)[v33 generation]));
        }

        else
        {
          v49 = 0LL;
          v50 = 0LL;
          v30 = 0LL;
        }

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupContextDataSource groupServer](self, "groupServer"));
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472LL;
        v58[2] = sub_1000FE40C;
        v58[3] = &unk_1008FA3A8;
        v58[4] = self;
        id v59 = v10;
        id v60 = v52;
        id v68 = v13;
        id v61 = v28;
        id v62 = v57;
        id v63 = v56;
        id v64 = v48;
        id v65 = v26;
        id v40 = v29;
        v47 = v29;
        v41 = v28;
        v42 = v26;
        id v43 = v40;
        id v66 = v40;
        id v67 = v30;
        id v44 = v30;
        id v45 = v48;
        id v11 = v56;
        id v46 = v43;
        v26 = v42;
        v28 = v41;
        [v39 publishGroupForKey:v45 data:v65 signature:v46 forwardingSig:v44 ENID:v50 version:v49 completion:v58];

        id v38 = v52;
        v36 = v47;
        v15 = v53;
      }

      else
      {
        v36 = 0LL;
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
        id v11 = v56;
        id v38 = v52;
        v15 = v53;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138478595;
          v73 = v56;
          __int16 v74 = 2113;
          id v75 = v10;
          __int16 v76 = 2114;
          id v77 = v12;
          __int16 v78 = 2114;
          id v79 = v52;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_FAULT,  "Unable to create group signature {groupInfo: %{private}@, groupContext: %{private}@, previousGroup: %{public }@, error: %{public}@}",  buf,  0x2Au);
        }

        (*((void (**)(id, void, id))v13 + 2))(v13, 0LL, v52);
      }

      id v25 = v38;
    }

    else
    {
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
      id v11 = v56;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138478595;
        v73 = v56;
        __int16 v74 = 2113;
        id v75 = v10;
        __int16 v76 = 2114;
        id v77 = v12;
        __int16 v78 = 2114;
        id v79 = v25;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_FAULT,  "Unable to get group.publicRepresentation {groupInfo: %{private}@, groupContext: %{private}@, previousGroup: %{ public}@, error: %{public}@}",  buf,  0x2Au);
      }

      (*((void (**)(id, void, id))v13 + 2))(v13, 0LL, v25);
      v28 = v20;
      v15 = v53;
    }
  }

  else
  {
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      sub_10069B294();
    }

    (*((void (**)(id, void, void))v13 + 2))(v13, 0LL, 0LL);
  }
}

- (void)_groupFromServerResponse:(id)a3 context:(id)a4 groupID:(id)a5 error:(id)a6 resultCode:(int64_t)a7 resultDictionary:(id)a8 allEntries:(id)a9 completion:(id)a10
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 accountIdentity]);
  uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 deviceKey]);

  uint64_t v24 = objc_opt_class(&OBJC_CLASS___IDSDeviceIdentity, v23);
  id v61 = (void *)v22;
  if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0)
  {
    v58 = v20;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 accountIdentity]);
    id v67 = (void *)objc_claimAutoreleasedReturnValue([v25 deviceKey]);

    id v60 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (v17 || ![v19 count])
    {
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        sub_10069B43C();
      }

      (*((void (**)(id, void, id))v20 + 2))(v20, 0LL, v17);
    }

    else
    {
      v56 = v15;
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v92 = v14;
        __int16 v93 = 2112;
        uint64_t v94 = 0LL;
        __int16 v95 = 2112;
        id v96 = v18;
        __int16 v97 = 2112;
        id v98 = v19;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Got groups {%@ %@ %@ %@}", buf, 0x2Au);
      }

      id v54 = v18;
      id v57 = v14;

      v29 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v19 count]);
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      id v53 = v19;
      id obj = v19;
      id v30 = [obj countByEnumeratingWithState:&v85 objects:v90 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v86;
        do
        {
          for (i = 0LL; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v86 != v32) {
              objc_enumerationMutation(obj);
            }
            uint64_t v34 = *(void *)(*((void *)&v85 + 1) + 8LL * (void)i);
            v35 = objc_alloc(&OBJC_CLASS___IDSMPConversationGroupEntry);
            v36 = (void *)objc_claimAutoreleasedReturnValue([v16 stableGroupID]);
            v37 = -[IDSMPConversationGroupEntry initWithStableGroupID:groupServerEntry:]( v35,  "initWithStableGroupID:groupServerEntry:",  v36,  v34);

            -[NSMutableArray addObject:](v29, "addObject:", v37);
          }

          id v31 = [obj countByEnumeratingWithState:&v85 objects:v90 count:16];
        }

        while (v31);
      }

      v55 = v16;

      id v64 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [obj count]);
      id v65 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      id v62 = v29;
      id v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v81,  v89,  16LL);
      if (v68)
      {
        uint64_t v66 = *(void *)v82;
        do
        {
          for (j = 0LL; j != v68; j = (char *)j + 1)
          {
            if (*(void *)v82 != v66) {
              objc_enumerationMutation(v62);
            }
            v39 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)j);
            id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 data]);
            v41 = (void *)objc_claimAutoreleasedReturnValue([v39 publicKeyData]);
            v42 = (void *)objc_claimAutoreleasedReturnValue([v39 signature]);
            id v43 = (void *)objc_claimAutoreleasedReturnValue([v39 groupID]);
            id v44 = (void *)objc_claimAutoreleasedReturnValue([v39 forwardingTicket]);
            id v45 = (void *)objc_claimAutoreleasedReturnValue([v67 modernIdentity]);
            id v80 = 0LL;
            id v46 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMPConversationGroup conversationSponsorPairFromPublicData:publicKey:signature:groupID:parent:parentPublicKey:forwardingTicket:fullDeviceIdentity:error:]( &OBJC_CLASS___IDSMPConversationGroup,  "conversationSponsorPairFromPublicData:publicKey:signature:groupID:parent:parentPublicKey:f orwardingTicket:fullDeviceIdentity:error:",  v40,  v41,  v42,  v43,  0LL,  0LL,  v44,  v45,  &v80));
            id v47 = v80;

            if (v46)
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue([v39 publicKeyData]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v64, "setObject:forKeyedSubscript:", v46, v48);

              v49 = (void *)objc_claimAutoreleasedReturnValue([v46 sponsorAlias]);
              -[NSMutableSet addObject:](v65, "addObject:", v49);
            }
          }

          id v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v81,  v89,  16LL);
        }

        while (v68);
      }

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v65, "allObjects"));
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472LL;
      v69[2] = sub_1000FF054;
      v69[3] = &unk_1008FA3F8;
      id v70 = v62;
      id v71 = v64;
      v72 = v60;
      id v73 = v67;
      id v74 = 0LL;
      id v16 = v55;
      id v75 = v55;
      __int16 v76 = self;
      id v15 = v56;
      id v77 = v56;
      id v79 = v58;
      id v78 = obj;
      v51 = v64;
      id v52 = v62;
      -[IDSDGroupContextDataSource _participantsForDestinations:completion:]( self,  "_participantsForDestinations:completion:",  v50,  v69);

      id v20 = v58;
      id v14 = v57;
      id v18 = v54;
      id v17 = 0LL;
      id v19 = v53;
    }
  }

  else
  {
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      sub_10069B294();
    }

    (*((void (**)(id, void, void))v20 + 2))(v20, 0LL, 0LL);
  }
}

- (void)groupContext:(id)a3 fetchGroupWithID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stableGroupID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataRepresentation]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupContextDataSource groupServer](self, "groupServer"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000FFC10;
  v17[3] = &unk_1008FA420;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [v13 queryGroupServerForENID:v12 withCompletion:v17];
}

- (void)publicDataRepresentationForGroup:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v57 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "group->groupPublicData -- Start {group: %{private}@}",  buf,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentity]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountKey]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___IDSAccountIdentity, v13);
  char isKindOfClass = objc_opt_isKindOfClass(v12, v14);

  if ((isKindOfClass & 1) == 0)
  {
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
      sub_10069B648(v8, (uint64_t)v7, v41);
    }

    uint64_t v42 = ENGroupContextErrorDomain;
    NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
    id v63 = @"Unepxcted account key class. Expected IDSAccountIdentity";
    id v43 = &v63;
    id v44 = &v62;
    goto LABEL_19;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 cypher]);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___IDSConversationGroupCypher, v17);
  char v19 = objc_opt_isKindOfClass(v16, v18);

  if ((v19 & 1) == 0)
  {
    id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
      sub_10069B5C0(v7, v45);
    }

    uint64_t v42 = ENGroupContextErrorDomain;
    NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
    id v61 = @"Unexpected cypher class. Expected IDSConversationGroupCypher";
    id v43 = &v61;
    id v44 = &v60;
LABEL_19:
    id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v44,  1LL));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v42,  -1000LL,  v26));
    v9[2](v9, 0LL, v21);
    goto LABEL_32;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentity]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountKey]);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 cypher]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 conversationGroup]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v21 signingIdentity]);
  id v55 = 0LL;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 publicDataRepresentationWithSponsor:v24 error:&v55]);
  id v26 = v55;

  if (v25)
  {
    id v54 = v26;
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v23 signData:v25 error:&v54]);
    v28 = v23;
    v29 = v25;
    id v30 = (void *)v27;
    id v51 = v54;

    id v52 = v29;
    if (v30)
    {
      v50 = v22;
      id v31 = objc_alloc_init(&OBJC_CLASS___IDSMPConversationGroupEntry);
      -[IDSMPConversationGroupEntry setData:](v31, "setData:", v29);
      v49 = v30;
      -[IDSMPConversationGroupEntry setSignature:](v31, "setSignature:", v30);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v28 publicKeyData]);
      -[IDSMPConversationGroupEntry setPublicKeyData:](v31, "setPublicKeyData:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue([v28 groupID]);
      -[IDSMPConversationGroupEntry setGroupID:](v31, "setGroupID:", v33);

      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v28 forwardingTicket]);
      -[IDSMPConversationGroupEntry setForwardingTicket:](v31, "setForwardingTicket:", v34);

      id v53 = v51;
      v35 = (void *)objc_claimAutoreleasedReturnValue( -[IDSMPConversationGroupEntry publicDataRepresentationWithError:]( v31,  "publicDataRepresentationWithError:",  &v53));
      id v48 = v53;

      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
      v37 = v36;
      uint64_t v23 = v28;
      if (v35)
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v35 length]));
          *(_DWORD *)buf = 138543362;
          id v57 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "group->groupPublicData -- Success {publicDataRepresentation.length: %{public}@}",  buf,  0xCu);
        }

        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          sub_10069B554();
        }

        ((void (**)(id, void *, void *))v9)[2](v9, v35, 0LL);
        id v40 = v48;
        id v30 = v49;
      }

      else
      {
        id v40 = v48;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543619;
          id v57 = v48;
          __int16 v58 = 2113;
          id v59 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Failed group->groupPublicData -- could not create data from entry {error: %{public}@, group: %{private}@}",  buf,  0x16u);
        }

        v9[2](v9, 0LL, v48);
        id v30 = v49;
      }

      uint64_t v22 = v50;
    }

    else
    {
      id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
      id v40 = v51;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        id v57 = v51;
        __int16 v58 = 2113;
        id v59 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Failed group->groupPublicData -- could not create signature {error: %{public}@, group: %{private}@}",  buf,  0x16u);
      }

      v9[2](v9, 0LL, v51);
      uint64_t v23 = v28;
    }

    id v26 = v40;
    id v25 = v52;
  }

  else
  {
    id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v57 = v26;
      __int16 v58 = 2113;
      id v59 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Failed group->groupPublicData -- could not create publicGroupData {error: %{public}@, group: %{private}@}",  buf,  0x16u);
    }

    v9[2](v9, 0LL, v26);
  }

LABEL_32:
}

- (void)groupFromPublicDataRepresentation:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v56 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "groupPublicData->Group -- Start {data: %{private}@}",  buf,  0xCu);
  }

  id v51 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMPConversationGroupEntry entryFromPublicDataRepresentation:error:]( &OBJC_CLASS___IDSMPConversationGroupEntry,  "entryFromPublicDataRepresentation:error:",  v8,  &v51));
  id v13 = v51;
  if (v12)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 accountIdentity]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceKey]);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___IDSDeviceIdentity, v16);
    char isKindOfClass = objc_opt_isKindOfClass(v15, v17);

    if ((isKindOfClass & 1) != 0)
    {
      v37 = self;
      id v41 = v8;
      char v19 = (void *)objc_claimAutoreleasedReturnValue([v9 accountIdentity]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceKey]);

      id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 data]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v12 publicKeyData]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v12 signature]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v12 groupID]);
      v39 = v9;
      id v40 = v20;
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v12 forwardingTicket]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v20 modernIdentity]);
      id v50 = v13;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMPConversationGroup conversationSponsorPairFromPublicData:publicKey:signature:groupID:parent:parentPublicKey:forwardingTicket:fullDeviceIdentity:error:]( &OBJC_CLASS___IDSMPConversationGroup,  "conversationSponsorPairFromPublicData:publicKey:signature:groupID:parent:parentPublicKey:forward ingTicket:fullDeviceIdentity:error:",  v21,  v22,  v23,  v24,  0LL,  0LL,  v25,  v26,  &v50));
      id v38 = v50;

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 sponsorAlias]);
        id v52 = v28;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_1001007A8;
        v42[3] = &unk_1008FA448;
        id v43 = v27;
        id v49 = v10;
        id v44 = v12;
        id v45 = v38;
        id v46 = v37;
        id v47 = v40;
        id v9 = v39;
        id v48 = v39;
        -[IDSDGroupContextDataSource _participantsForDestinations:completion:]( v37,  "_participantsForDestinations:completion:",  v29,  v42);

        id v8 = v41;
        id v30 = v40;
        id v13 = v38;
      }

      else
      {
        id v9 = v39;
        id v30 = v40;
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
        id v13 = v38;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
          sub_10069B6D0((uint64_t)v38, (uint64_t)v12, v36);
        }

        (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v38);
        id v8 = v41;
      }
    }

    else
    {
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_10069B748(v9, (uint64_t)v8, v32);
      }

      uint64_t v33 = ENGroupContextErrorDomain;
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      id v54 = @"Unepxcted device key class. Expected IDSDeviceIdentity";
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v33,  -1000LL,  v34));
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v35);
    }
  }

  else
  {
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v56 = v13;
      __int16 v57 = 2113;
      id v58 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Failed groupPublicData->Group {error: %{public}@, data: %{private}@}",  buf,  0x16u);
    }

    (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v13);
  }
}

- (void)participantsForCypher:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___IDSConversationGroupCypher, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    id v10 = v6;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 conversationGroup]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupMembers]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100100F60;
    v15[3] = &unk_1008FA470;
    id v16 = v7;
    -[IDSDGroupContextDataSource _participantsForDestinations:completion:]( self,  "_participantsForDestinations:completion:",  v13,  v15);
  }

  else
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10069B838();
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, id, void))a5;
  id v8 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue([a3 cypher]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationGroup]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 cypher]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 conversationGroup]);
  v7[2](v7, [v9 isParentOfGroup:v11], 0);
}

- (id)_groupWithDeviceIdentity:(id)a3 parent:(id)a4 groupInfo:(id)a5 error:(id *)a6
{
  return 0LL;
}

- (id)_sponsorAlias
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupContextDataSource _sponsorAccount](self, "_sponsorAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 prefixedURIStringsFromRegistration]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

- (id)_sponsorAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serviceWithPushTopic:@"com.apple.madrid"]);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountsOnService:v3]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  return v6;
}

- (IDSGroupServer)groupServer
{
  return self->_groupServer;
}

- (void)setGroupServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end