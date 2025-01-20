@interface MRDGroupSessionApprovalManager
+ (id)hashForIdentity:(id)a3;
+ (void)donateApprovedIdentity:(id)a3;
+ (void)donateRemovedIdentity:(id)a3;
+ (void)shouldAutoApproveIdentity:(id)a3 completion:(id)a4;
+ (void)shouldAutoApproveOOBKeys:(id)a3 withSession:(id)a4 completion:(id)a5;
+ (void)shouldAutoApproveRequest:(id)a3 withSession:(id)a4 completion:(id)a5;
@end

@implementation MRDGroupSessionApprovalManager

+ (id)hashForIdentity:(id)a3
{
  id v3 = a3;
  __int128 v66 = 0u;
  __int128 v65 = 0u;
  __int128 v64 = 0u;
  __int128 v63 = 0u;
  __int128 v62 = 0u;
  __int128 v61 = 0u;
  __int128 v60 = 0u;
  memset(&v59, 0, sizeof(v59));
  CC_SHA1_Init(&v59);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recentGroupSessionParticipantsPepper]);
  id v7 = objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:v6]);
  CC_SHA1_Update(&v59, [v7 UTF8String], (CC_LONG)objc_msgSend(v7, "length"));

  memset(&v67[8], 0, 64);
  *(void *)v67 = 4001LL;
  CC_SHA1_Final(&v67[8], &v59);
  v68[0] = *(_OWORD *)v67;
  v68[1] = *(_OWORD *)&v67[16];
  v68[2] = *(_OWORD *)&v67[32];
  v68[3] = *(_OWORD *)&v67[48];
  uint64_t v69 = *(void *)&v67[64];
  if (*(uint64_t *)v67 > 3999)
  {
    if (*(uint64_t *)v67 > 4255)
    {
      if (*(void *)v67 == 4256LL)
      {
        v48 = (unsigned __int8 *)v68 + 8;
        v49 = (char *)calloc(0x40uLL, 1uLL);
        v50 = v49;
        for (uint64_t i = 0LL; i != 64; i += 2LL)
        {
          unsigned int v52 = *v48++;
          v53 = &v49[i];
          char *v53 = a0123456789abcd[(unint64_t)v52 >> 4];
          v53[1] = a0123456789abcd[v52 & 0xF];
        }

        v20 = objc_alloc(&OBJC_CLASS___NSString);
        v21 = v50;
        uint64_t v22 = 64LL;
      }

      else
      {
        if (*(void *)v67 != 4512LL) {
          goto LABEL_44;
        }
        v27 = (unsigned __int8 *)v68 + 8;
        v28 = (char *)calloc(0x80uLL, 1uLL);
        v29 = v28;
        for (uint64_t j = 0LL; j != 128; j += 2LL)
        {
          unsigned int v31 = *v27++;
          v32 = &v28[j];
          char *v32 = a0123456789abcd[(unint64_t)v31 >> 4];
          v32[1] = a0123456789abcd[v31 & 0xF];
        }

        v20 = objc_alloc(&OBJC_CLASS___NSString);
        v21 = v29;
        uint64_t v22 = 128LL;
      }
    }

    else if (*(void *)v67 == 4000LL)
    {
      v38 = (unsigned __int8 *)v68 + 8;
      v39 = (char *)calloc(0x20uLL, 1uLL);
      v40 = v39;
      for (uint64_t k = 0LL; k != 32; k += 2LL)
      {
        unsigned int v42 = *v38++;
        v43 = &v39[k];
        char *v43 = a0123456789abcd[(unint64_t)v42 >> 4];
        v43[1] = a0123456789abcd[v42 & 0xF];
      }

      v20 = objc_alloc(&OBJC_CLASS___NSString);
      v21 = v40;
      uint64_t v22 = 32LL;
    }

    else
    {
      if (*(void *)v67 != 4001LL) {
        goto LABEL_44;
      }
      v14 = (unsigned __int8 *)v68 + 8;
      v15 = (char *)calloc(0x28uLL, 1uLL);
      v16 = v15;
      for (uint64_t m = 0LL; m != 40; m += 2LL)
      {
        unsigned int v18 = *v14++;
        v19 = &v15[m];
        char *v19 = a0123456789abcd[(unint64_t)v18 >> 4];
        v19[1] = a0123456789abcd[v18 & 0xF];
      }

      v20 = objc_alloc(&OBJC_CLASS___NSString);
      v21 = v16;
      uint64_t v22 = 40LL;
    }

+ (void)donateApprovedIdentity:(id)a3
{
  id v10 = a3;
  if ([v10 type])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MRDGroupSessionApprovalManager hashForIdentity:]( &OBJC_CLASS___MRDGroupSessionApprovalManager,  "hashForIdentity:",  v10));
    uint64_t v4 = BiomeLibrary();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 MediaRemote]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 GroupSessionRecentParticipant]);

    id v8 = [[BMMediaRemoteGroupSessionRecentParticipant alloc] initWithHashedUserIdentityIdentifier:v3];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 source]);
    [v9 sendEvent:v8];
  }
}

+ (void)donateRemovedIdentity:(id)a3
{
  id v10 = a3;
  if ([v10 type])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MRDGroupSessionApprovalManager hashForIdentity:]( &OBJC_CLASS___MRDGroupSessionApprovalManager,  "hashForIdentity:",  v10));
    uint64_t v4 = BiomeLibrary();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 MediaRemote]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 GroupSessionRecentParticipant]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pruner]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10001F49C;
    v11[3] = &unk_10039A140;
    id v12 = v3;
    id v9 = v3;
    [v8 deleteEventsPassingTest:v11];
  }
}

+ (void)shouldAutoApproveRequest:(id)a3 withSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t, uint64_t))a5;
  if (variable initialization expression of MRDFastSyncGroupSession.hasEncounteredLowPowerError()
    || (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings")),
        unsigned __int8 v12 = [v11 supportGroupSessionAutoApproval],
        v11,
        (v12 & 1) == 0))
  {
    v10[2](v10, 0LL, -1LL, 1LL);
  }

  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10001F68C;
    v23[3] = &unk_10039A168;
    id v13 = v8;
    id v24 = v13;
    v25 = v10;
    v14 = objc_retainBlock(v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 identity]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 oobKeys]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001F7A8;
    v19[3] = &unk_10039A1B8;
    id v21 = v14;
    id v22 = a1;
    id v20 = v15;
    id v17 = v15;
    unsigned int v18 = v14;
    [a1 shouldAutoApproveOOBKeys:v16 withSession:v9 completion:v19];
  }
}

+ (void)shouldAutoApproveIdentity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MRDGroupSessionApprovalManager hashForIdentity:]( &OBJC_CLASS___MRDGroupSessionApprovalManager,  "hashForIdentity:",  v5));
  uint64_t v8 = BiomeLibrary();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 MediaRemote]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 GroupSessionRecentParticipant]);

  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 0;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  v25[3] = 0LL;
  id v12 = [[BMPublisherOptions alloc] initWithStartDate:0 endDate:0 maxEvents:0 lastN:0 reversed:1];
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 publisherWithOptions:v12]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001FA48;
  v21[3] = &unk_10039A1E0;
  id v14 = v6;
  id v22 = v14;
  v23 = v26;
  id v24 = v25;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001FA6C;
  v17[3] = &unk_10039A208;
  id v15 = v7;
  id v18 = v15;
  v19 = v25;
  id v20 = v26;
  id v16 = [v13 sinkWithCompletion:v21 shouldContinue:v17];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
}

+ (void)shouldAutoApproveOOBKeys:(id)a3 withSession:(id)a4 completion:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, uint64_t, uint64_t))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 joinToken]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sharedSecret]);

  if (v10 && [v7 containsObject:v10])
  {
    v8[2](v8, 1LL, 3LL);
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 groupSessionAutoApproveHomeParticipants];

    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRDGroupSessionHomeObserver shared](&OBJC_CLASS___MRDGroupSessionHomeObserver, "shared"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10001FC38;
      v14[3] = &unk_10039A230;
      id v15 = v7;
      id v16 = v8;
      [v13 currentHomeUserIdentifiersWithCompletionHandler:v14];
    }

    else
    {
      v8[2](v8, 0LL, -1LL);
    }
  }
}

@end