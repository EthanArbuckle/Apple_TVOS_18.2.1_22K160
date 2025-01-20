@interface MRDMusicUserStateCenter
+ (MRDMusicUserStateCenter)sharedCenter;
- (BOOL)cachedStateLoaded;
- (BOOL)isMusicAppInstalled;
- (MRDMediaUserState)localActiveUserState;
- (MRDMusicUserStateCenter)init;
- (MRUserIdentity)localActiveIdentity;
- (NSArray)localUserIdentities;
- (NSArray)localUserStates;
- (NSMutableDictionary)dsidToPendingCompletionMap;
- (NSMutableSet)finishedWaitingForCloudStateDSIDs;
- (NSString)musicApplicationBundleIdentifier;
- (id)identityForHomeUserIdentifier:(id)a3;
- (id)identityForUserState:(id)a3;
- (id)privacyObserver;
- (id)stateCenter;
- (os_unfair_lock_s)lock;
- (void)checkPendingIdentityCompletions;
- (void)handleRegisteredApplicationsChangedNotification:(id)a3;
- (void)handleiTunesNotification:(id)a3;
- (void)postCloudStateChanged;
- (void)registerNotifications;
- (void)setDsidToPendingCompletionMap:(id)a3;
- (void)setFinishedWaitingForCloudStateDSIDs:(id)a3;
- (void)setPrivacyObserver:(id)a3;
- (void)updateIsMusicAppInstalled;
- (void)userIdentityForDSID:(id)a3 completion:(id)a4;
@end

@implementation MRDMusicUserStateCenter

+ (MRDMusicUserStateCenter)sharedCenter
{
  if (qword_1003FDC10 != -1) {
    dispatch_once(&qword_1003FDC10, &stru_10039A6B8);
  }
  return (MRDMusicUserStateCenter *)(id)qword_1003FDC18;
}

- (MRDMusicUserStateCenter)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MRDMusicUserStateCenter;
  v2 = -[MRDMusicUserStateCenter init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    finishedWaitingForCloudStateDSIDs = v3->_finishedWaitingForCloudStateDSIDs;
    v3->_finishedWaitingForCloudStateDSIDs = (NSMutableSet *)v4;

    uint64_t v6 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    musicApplicationBundleIdentifier = v3->_musicApplicationBundleIdentifier;
    v3->_musicApplicationBundleIdentifier = (NSString *)v6;

    uint64_t Queue = MRGroupSessionSubsystemGetQueue(-[MRDMusicUserStateCenter registerNotifications](v3, "registerNotifications"));
    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(Queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100026B88;
    block[3] = &unk_100399250;
    v12 = v3;
    dispatch_async(v9, block);
  }

  return v3;
}

- (void)registerNotifications
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"handleiTunesNotification:" name:ICMediaUserStateCenterUserStatesDidChangeNotification object:0];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"handleiTunesNotification:" name:ICMusicUserStateGroupSessionCapabilityChangedNotification object:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v5 addObserver:self selector:"handleRegisteredApplicationsChangedNotification:" name:@"com.apple.LaunchServices.applicationRegistered" object:0 suspensionBehavior:3];

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v6 addObserver:self selector:"handleRegisteredApplicationsChangedNotification:" name:@"com.apple.LaunchServices.applicationUnregistered" object:0 suspensionBehavior:3];
}

- (void)userIdentityForDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter stateCenter](self, "stateCenter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allUserStates]);
  v158[0] = _NSConcreteStackBlock;
  v158[1] = 3221225472LL;
  v158[2] = sub_100027D24;
  v158[3] = &unk_10039A6E0;
  id v11 = v6;
  id v159 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msv_firstWhere:", v158));

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 music]);
  v14 = v13;
  if (!v13)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMusicUserStateCenter finishedWaitingForCloudStateDSIDs]( self,  "finishedWaitingForCloudStateDSIDs"));
    unsigned __int8 v28 = [v27 containsObject:v11];

    if ((v28 & 1) == 0)
    {
      uint64_t v30 = _MRLogForCategory(12LL, v29);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[MRDMusicUserStateCenter] No music user state for dsid: %@. Will wait for user state update.",  buf,  0xCu);
      }
    }

    goto LABEL_117;
  }

  v154 = v12;
  locuint64_t k = &self->_lock;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 userProfile]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 socialProfile]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 socialProfileID]);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v14 userProfile]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 socialProfile]);
    v153 = self;
    id v20 = v11;
    v21 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v19 socialProfileID]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v14 userProfile]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 socialProfile]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 name]);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[MRUserIdentity resolvableIdentityWithIdentifier:displayName:]( &OBJC_CLASS___MRUserIdentity,  "resolvableIdentityWithIdentifier:displayName:",  v22,  v25));

    v7 = v21;
    id v11 = v20;
    self = v153;

    v12 = v154;
    goto LABEL_115;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v14 userProfile]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 name]);

  v12 = v154;
  p_locuint64_t k = &self->_lock;
  if (!v33) {
    goto LABEL_117;
  }
  v35 = v7;
  uint64_t v36 = _MRLogForCategory(12LL, v34);
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "[MRDMusicUserStateCenter] No social profile for dsid: %@. Will use basic identity.",  buf,  0xCu);
  }

  v153 = (MRDMusicUserStateCenter *)&OBJC_CLASS___MRUserIdentity;
  id v38 = v11;
  __int128 v172 = 0u;
  __int128 v171 = 0u;
  __int128 v170 = 0u;
  __int128 v169 = 0u;
  __int128 v168 = 0u;
  __int128 v167 = 0u;
  __int128 v166 = 0u;
  __int128 v165 = 0u;
  __int128 v164 = 0u;
  __int128 v163 = 0u;
  __int128 v162 = 0u;
  __int128 v161 = 0u;
  *(_OWORD *)&buf[8] = 0u;
  *(void *)buf = 4001LL;
  CC_SHA1_Init((CC_SHA1_CTX *)&buf[8]);
  id v39 = v38;
  v40 = [v39 UTF8String];
  size_t v41 = (size_t)[v39 length];
  if (*(uint64_t *)buf > 3999)
  {
    if (*(uint64_t *)buf > 4255)
    {
      if (*(void *)buf == 4256LL)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v40, v41);
      }

      else if (*(void *)buf == 4512LL)
      {
        CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v40, v41);
      }
    }

    else if (*(void *)buf == 4000LL)
    {
      CC_MD5_Update((CC_MD5_CTX *)&buf[8], v40, v41);
    }

    else if (*(void *)buf == 4001LL)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v40, v41);
    }
  }

  else if (*(uint64_t *)buf > 2999)
  {
    if (*(void *)buf == 3000LL)
    {
      sub_10002A9CC(&buf[8], v40, v41);
    }

    else if (*(void *)buf == 3001LL)
    {
      sub_10002AB74(&buf[8], v40, v41);
    }
  }

  else if (*(void *)buf)
  {
    if (*(void *)buf == 2000LL)
    {
      v42 = &buf[buf[19] + 16];
      switch((((_BYTE)v41 + buf[19]) & 3) - buf[19])
      {
        case 0:
          break;
        case 1:
          _BYTE *v42 = *v40;
          break;
        case 2:
          __int16 v46 = *(_WORD *)v40;
          goto LABEL_34;
        case 3:
          __int16 v46 = *(_WORD *)v40;
          buf[buf[19] + 18] = v40[2];
LABEL_34:
          *(_WORD *)v42 = v46;
          break;
        default:
          memcpy(v42, v40, (((v41 + buf[19]) & 3) - buf[19]));
          break;
      }

      *(_DWORD *)&buf[12] += v41;
    }
  }

  else
  {
    id v43 = v39;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)"));
    [v44 handleFailureInFunction:v45 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];

    id v39 = v43;
  }

  memset(&v173[8], 0, 64);
  *(void *)v173 = *(void *)buf;
  if (*(uint64_t *)buf > 3000)
  {
    v7 = v35;
    if (*(uint64_t *)buf <= 4000)
    {
      v12 = v154;
      if (*(void *)buf == 3001LL)
      {
        *(void *)&v173[8] = sub_10002ADD4(&buf[8]);
      }

      else if (*(void *)buf == 4000LL)
      {
        CC_MD5_Final(&v173[8], (CC_MD5_CTX *)&buf[8]);
      }
    }

    else
    {
      v12 = v154;
      switch(*(void *)buf)
      {
        case 0xFA1LL:
          CC_SHA1_Final(&v173[8], (CC_SHA1_CTX *)&buf[8]);
          break;
        case 0x10A0LL:
          CC_SHA256_Final(&v173[8], (CC_SHA256_CTX *)&buf[8]);
          break;
        case 0x11A0LL:
          CC_SHA512_Final(&v173[8], (CC_SHA512_CTX *)&buf[8]);
          break;
      }
    }

    goto LABEL_65;
  }

  v7 = v35;
  if (*(uint64_t *)buf <= 1999)
  {
    v12 = v154;
    if (*(void *)buf)
    {
      if (*(void *)buf == 1000LL)
      {
        uint64_t v47 = (*(void *)&buf[8] + *(void *)&buf[16]) ^ __ROR8__(*(void *)&buf[16], 51);
        uint64_t v48 = v161 + (*((void *)&v161 + 1) ^ v162);
        uint64_t v49 = __ROR8__(*((void *)&v161 + 1) ^ v162, 48);
        uint64_t v50 = (v48 ^ v49) + __ROR8__(*(void *)&buf[8] + *(void *)&buf[16], 32);
        uint64_t v51 = v50 ^ __ROR8__(v48 ^ v49, 43);
        uint64_t v52 = v48 + v47;
        uint64_t v53 = v52 ^ __ROR8__(v47, 47);
        uint64_t v54 = (v50 ^ v162) + v53;
        uint64_t v55 = v54 ^ __ROR8__(v53, 51);
        uint64_t v56 = (__ROR8__(v52, 32) ^ 0xFFLL) + v51;
        uint64_t v57 = __ROR8__(v51, 48);
        uint64_t v58 = __ROR8__(v54, 32) + (v56 ^ v57);
        uint64_t v59 = v58 ^ __ROR8__(v56 ^ v57, 43);
        uint64_t v60 = v55 + v56;
        uint64_t v61 = v60 ^ __ROR8__(v55, 47);
        uint64_t v62 = v61 + v58;
        uint64_t v63 = v62 ^ __ROR8__(v61, 51);
        uint64_t v64 = __ROR8__(v60, 32) + v59;
        uint64_t v65 = __ROR8__(v59, 48);
        uint64_t v66 = __ROR8__(v62, 32) + (v64 ^ v65);
        uint64_t v67 = v66 ^ __ROR8__(v64 ^ v65, 43);
        uint64_t v68 = v63 + v64;
        uint64_t v69 = v68 ^ __ROR8__(v63, 47);
        uint64_t v70 = v69 + v66;
        uint64_t v71 = v70 ^ __ROR8__(v69, 51);
        uint64_t v72 = __ROR8__(v68, 32) + v67;
        uint64_t v73 = __ROR8__(v67, 48);
        uint64_t v74 = __ROR8__(v70, 32) + (v72 ^ v73);
        uint64_t v75 = v74 ^ __ROR8__(v72 ^ v73, 43);
        uint64_t v76 = v71 + v72;
        *(void *)&buf[8] = v74;
        *(void *)&buf[16] = v76 ^ __ROR8__(v71, 47);
        *(void *)&__int128 v161 = __ROR8__(v76, 32);
        *((void *)&v161 + 1) = v75;
        *(void *)&v173[8] = *(void *)&buf[16] ^ v74 ^ v161 ^ v75;
      }
    }

    else
    {
      id v77 = v39;
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"));
      [v78 handleFailureInFunction:v79 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];

      id v39 = v77;
    }

    goto LABEL_65;
  }

  v12 = v154;
  if (*(void *)buf == 2000LL)
  {
    switch(buf[19])
    {
      case 1:
        int v80 = buf[16];
        break;
      case 2:
        int v80 = *(unsigned __int16 *)&buf[16];
        break;
      case 3:
        int v80 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
        break;
      default:
        unsigned int v81 = *(_DWORD *)&buf[8];
        goto LABEL_64;
    }

    unsigned int v81 = (461845907 * ((380141568 * v80) | ((-862048943 * v80) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_64:
    unsigned int v82 = -2048144789 * (v81 ^ *(_DWORD *)&buf[12] ^ ((v81 ^ *(_DWORD *)&buf[12]) >> 16));
    *(_DWORD *)&buf[8] = (-1028477387 * (v82 ^ (v82 >> 13))) ^ ((-1028477387 * (v82 ^ (v82 >> 13))) >> 16);
    *(_DWORD *)&v173[8] = *(_DWORD *)&buf[8];
    goto LABEL_65;
  }

  if (*(void *)buf == 3000LL) {
    *(_DWORD *)&v173[8] = sub_10002AD04((uint64_t)&buf[8]);
  }
LABEL_65:
  v174[0] = *(_OWORD *)v173;
  v174[1] = *(_OWORD *)&v173[16];
  v174[2] = *(_OWORD *)&v173[32];
  v174[3] = *(_OWORD *)&v173[48];
  uint64_t v175 = *(void *)&v173[64];
  if (*(uint64_t *)v173 > 3999)
  {
    id v83 = v39;
    if (*(uint64_t *)v173 > 4255)
    {
      if (*(void *)v173 == 4256LL)
      {
        v125 = (unsigned __int8 *)v174 + 8;
        v126 = (char *)calloc(0x40uLL, 1uLL);
        v127 = v126;
        for (uint64_t i = 0LL; i != 64; i += 2LL)
        {
          unsigned int v129 = *v125++;
          v130 = &v126[i];
          char *v130 = a0123456789abcd_0[(unint64_t)v129 >> 4];
          v130[1] = a0123456789abcd_0[v129 & 0xF];
        }

        v96 = objc_alloc(&OBJC_CLASS___NSString);
        v97 = v127;
        uint64_t v98 = 64LL;
      }

      else
      {
        if (*(void *)v173 != 4512LL) {
          goto LABEL_108;
        }
        v103 = (unsigned __int8 *)v174 + 8;
        v104 = (char *)calloc(0x80uLL, 1uLL);
        v105 = v104;
        for (uint64_t j = 0LL; j != 128; j += 2LL)
        {
          unsigned int v107 = *v103++;
          v108 = &v104[j];
          char *v108 = a0123456789abcd_0[(unint64_t)v107 >> 4];
          v108[1] = a0123456789abcd_0[v107 & 0xF];
        }

        v96 = objc_alloc(&OBJC_CLASS___NSString);
        v97 = v105;
        uint64_t v98 = 128LL;
      }
    }

    else if (*(void *)v173 == 4000LL)
    {
      v114 = (unsigned __int8 *)v174 + 8;
      v115 = (char *)calloc(0x20uLL, 1uLL);
      v116 = v115;
      for (uint64_t k = 0LL; k != 32; k += 2LL)
      {
        unsigned int v118 = *v114++;
        v119 = &v115[k];
        char *v119 = a0123456789abcd_0[(unint64_t)v118 >> 4];
        v119[1] = a0123456789abcd_0[v118 & 0xF];
      }

      v96 = objc_alloc(&OBJC_CLASS___NSString);
      v97 = v116;
      uint64_t v98 = 32LL;
    }

    else
    {
      if (*(void *)v173 != 4001LL) {
        goto LABEL_108;
      }
      v90 = (unsigned __int8 *)v174 + 8;
      v91 = (char *)calloc(0x28uLL, 1uLL);
      v92 = v91;
      for (uint64_t m = 0LL; m != 40; m += 2LL)
      {
        unsigned int v94 = *v90++;
        v95 = &v91[m];
        char *v95 = a0123456789abcd_0[(unint64_t)v94 >> 4];
        v95[1] = a0123456789abcd_0[v94 & 0xF];
      }

      v96 = objc_alloc(&OBJC_CLASS___NSString);
      v97 = v92;
      uint64_t v98 = 40LL;
    }

- (void)checkPendingIdentityCompletions
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v146 = self;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter dsidToPendingCompletionMap](self, "dsidToPendingCompletionMap"));
  id v5 = [v4 count];

  if (v5)
  {
    v140 = p_lock;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter stateCenter](v146, "stateCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allUserStates]);

    __int128 v152 = 0u;
    __int128 v153 = 0u;
    __int128 v150 = 0u;
    __int128 v151 = 0u;
    obuint64_t j = v7;
    id v8 = [obj countByEnumeratingWithState:&v150 objects:v154 count:16];
    if (!v8) {
      goto LABEL_132;
    }
    id v9 = v8;
    uint64_t v10 = *(void *)v151;
    uint64_t v142 = *(void *)v151;
    while (1)
    {
      id v11 = 0LL;
      id v141 = v9;
      do
      {
        if (*(void *)v151 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v150 + 1) + 8LL * (void)v11);
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dsid]);

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v12 dsid]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringValue]);

          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter dsidToPendingCompletionMap](v146, "dsidToPendingCompletionMap"));
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v15]);

          if (!v17) {
            goto LABEL_129;
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue([v12 music]);
          v19 = v18;
          if (!v18) {
            goto LABEL_128;
          }
          dispatch_time_t v145 = v15;
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 userProfile]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 socialProfile]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 socialProfileID]);

          if (v22)
          {
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 userProfile]);
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString socialProfile](v23, "socialProfile"));
            v25 = (void *)objc_claimAutoreleasedReturnValue([v24 socialProfileID]);
            v143 = v19;
            v26 = (void *)objc_claimAutoreleasedReturnValue([v19 userProfile]);
            v27 = (void *)objc_claimAutoreleasedReturnValue([v26 socialProfile]);
            unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 name]);
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[MRUserIdentity resolvableIdentityWithIdentifier:displayName:]( &OBJC_CLASS___MRUserIdentity,  "resolvableIdentityWithIdentifier:displayName:",  v25,  v28));

            uint64_t v30 = v23;
            id v9 = v141;
            v15 = v145;
LABEL_126:

            uint64_t v10 = v142;
            v19 = v143;
            if (v29)
            {
              v136 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter dsidToPendingCompletionMap](v146, "dsidToPendingCompletionMap"));
              [v136 setObject:0 forKeyedSubscript:v15];

              Notificationuint64_t Queue = MRGroupSessionSubsystemGetNotificationQueue();
              unsigned __int8 v138 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(NotificationQueue);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_100028FC0;
              block[3] = &unk_100398E60;
              id v148 = v17;
              id v149 = v29;
              id v139 = v29;
              dispatch_async(v138, block);
            }

- (NSArray)localUserStates
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter stateCenter](self, "stateCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allUserStates]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "msv_map:", &stru_10039A720));

  return (NSArray *)v4;
}

- (MRDMediaUserState)localActiveUserState
{
  v3 = objc_alloc(&OBJC_CLASS___MRDMediaUserState);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter stateCenter](self, "stateCenter"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeUserState]);
  id v6 = -[MRDMediaUserState initWithUserState:](v3, "initWithUserState:", v5);

  return v6;
}

- (MRUserIdentity)localActiveIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter localActiveUserState](self, "localActiveUserState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userIdentity]);

  return (MRUserIdentity *)v3;
}

- (id)identityForUserState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 music]);
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userProfile]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 socialProfile]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 socialProfileID]);

    if (v8)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue([v5 userProfile]);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 socialProfile]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString socialProfileID](v10, "socialProfileID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v5 userProfile]);
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 socialProfile]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[MRUserIdentity resolvableIdentityWithIdentifier:displayName:]( &OBJC_CLASS___MRUserIdentity,  "resolvableIdentityWithIdentifier:displayName:",  v11,  v14));

LABEL_56:
      goto LABEL_57;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v5 userProfile]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v3 dsid]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);

      id v20 = v19;
      __int128 v78 = 0u;
      __int128 v77 = 0u;
      __int128 v76 = 0u;
      __int128 v75 = 0u;
      __int128 v74 = 0u;
      __int128 v73 = 0u;
      __int128 v72 = 0u;
      memset(&v71, 0, sizeof(v71));
      CC_SHA1_Init(&v71);
      id v9 = v20;
      CC_SHA1_Update(&v71, [v9 UTF8String], (CC_LONG)objc_msgSend(v9, "length"));

      memset(&v79[8], 0, 64);
      *(void *)unint64_t v79 = 4001LL;
      CC_SHA1_Final(&v79[8], &v71);
      v80[0] = *(_OWORD *)v79;
      v80[1] = *(_OWORD *)&v79[16];
      v80[2] = *(_OWORD *)&v79[32];
      v80[3] = *(_OWORD *)&v79[48];
      uint64_t v81 = *(void *)&v79[64];
      if (*(uint64_t *)v79 > 3999)
      {
        if (*(uint64_t *)v79 > 4255)
        {
          if (*(void *)v79 == 4256LL)
          {
            uint64_t v61 = (unsigned __int8 *)v80 + 8;
            uint64_t v62 = (char *)calloc(0x40uLL, 1uLL);
            uint64_t v63 = v62;
            for (uint64_t i = 0LL; i != 64; i += 2LL)
            {
              unsigned int v65 = *v61++;
              uint64_t v66 = &v62[i];
              *uint64_t v66 = a0123456789abcd_0[(unint64_t)v65 >> 4];
              v66[1] = a0123456789abcd_0[v65 & 0xF];
            }

            uint64_t v33 = objc_alloc(&OBJC_CLASS___NSString);
            uint64_t v34 = v63;
            uint64_t v35 = 64LL;
          }

          else
          {
            if (*(void *)v79 != 4512LL) {
              goto LABEL_50;
            }
            v40 = (unsigned __int8 *)v80 + 8;
            size_t v41 = (char *)calloc(0x80uLL, 1uLL);
            v42 = v41;
            for (uint64_t j = 0LL; j != 128; j += 2LL)
            {
              unsigned int v44 = *v40++;
              uint64_t v45 = &v41[j];
              char *v45 = a0123456789abcd_0[(unint64_t)v44 >> 4];
              v45[1] = a0123456789abcd_0[v44 & 0xF];
            }

            uint64_t v33 = objc_alloc(&OBJC_CLASS___NSString);
            uint64_t v34 = v42;
            uint64_t v35 = 128LL;
          }
        }

        else if (*(void *)v79 == 4000LL)
        {
          uint64_t v51 = (unsigned __int8 *)v80 + 8;
          uint64_t v52 = (char *)calloc(0x20uLL, 1uLL);
          uint64_t v53 = v52;
          for (uint64_t k = 0LL; k != 32; k += 2LL)
          {
            unsigned int v55 = *v51++;
            uint64_t v56 = &v52[k];
            *uint64_t v56 = a0123456789abcd_0[(unint64_t)v55 >> 4];
            v56[1] = a0123456789abcd_0[v55 & 0xF];
          }

          uint64_t v33 = objc_alloc(&OBJC_CLASS___NSString);
          uint64_t v34 = v53;
          uint64_t v35 = 32LL;
        }

        else
        {
          if (*(void *)v79 != 4001LL) {
            goto LABEL_50;
          }
          v27 = (unsigned __int8 *)v80 + 8;
          unsigned __int8 v28 = (char *)calloc(0x28uLL, 1uLL);
          uint64_t v29 = v28;
          for (uint64_t m = 0LL; m != 40; m += 2LL)
          {
            unsigned int v31 = *v27++;
            v32 = &v28[m];
            char *v32 = a0123456789abcd_0[(unint64_t)v31 >> 4];
            v32[1] = a0123456789abcd_0[v31 & 0xF];
          }

          uint64_t v33 = objc_alloc(&OBJC_CLASS___NSString);
          uint64_t v34 = v29;
          uint64_t v35 = 40LL;
        }
      }

      else
      {
        if (*(uint64_t *)v79 <= 2999)
        {
          if (*(void *)v79 == 1000LL)
          {
            uint64_t v46 = *((void *)&v80[0] + 1);
            uint64_t v47 = (UInt8 *)&v83;
            uint64_t quot = *((void *)&v80[0] + 1);
            do
            {
              lldiv_t v49 = lldiv(quot, 10LL);
              uint64_t quot = v49.quot;
              if (v49.rem >= 0) {
                LOBYTE(v50) = v49.rem;
              }
              else {
                uint64_t v50 = -v49.rem;
              }
              *v47-- = v50 + 48;
            }

            while (v49.quot);
            if (v46 < 0) {
              *uint64_t v47 = 45;
            }
            else {
              ++v47;
            }
            CFIndex v25 = (char *)&v84 - (char *)v47;
            v26 = v47;
            goto LABEL_53;
          }

          if (*(void *)v79 == 2000LL)
          {
            uint64_t v21 = 0LL;
            uint64_t v22 = DWORD2(v80[0]);
            do
            {
              ldiv_t v23 = ldiv(v22, 10LL);
              uint64_t v22 = v23.quot;
              if (v23.rem >= 0) {
                LOBYTE(v24) = v23.rem;
              }
              else {
                uint64_t v24 = -v23.rem;
              }
              *(&v83 + v21--) = v24 + 48;
            }

            while (v23.quot);
            CFIndex v25 = -v21;
            v26 = (const UInt8 *)&v84 + v21;
LABEL_53:
            CFStringRef v67 = CFStringCreateWithBytes(0LL, v26, v25, 0x8000100u, 0);
            goto LABEL_54;
          }

- (NSArray)localUserIdentities
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter stateCenter](self, "stateCenter"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allUserStates]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMusicUserStateCenter identityForUserState:]( self,  "identityForUserState:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10),  (void)v13));
        if (v11) {
          [v5 addObject:v11];
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return (NSArray *)v5;
}

- (id)identityForHomeUserIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter stateCenter](self, "stateCenter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allUserStates]);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homeUserIDs", (void)v17));
        unsigned __int8 v14 = [v13 containsObject:v4];

        if ((v14 & 1) != 0)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter identityForUserState:](self, "identityForUserState:", v12));
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  __int128 v15 = 0LL;
LABEL_11:

  return v15;
}

- (BOOL)cachedStateLoaded
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_cachedStateLoaded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)stateCenter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002A1EC;
  block[3] = &unk_100399250;
  void block[4] = self;
  if (qword_1003FDC28 != -1) {
    dispatch_once(&qword_1003FDC28, block);
  }
  return (id)qword_1003FDC20;
}

- (void)updateIsMusicAppInstalled
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter musicApplicationBundleIdentifier](self, "musicApplicationBundleIdentifier"));
  unsigned int v5 = [v3 applicationIsInstalled:v4];

  os_unfair_lock_lock(&self->_lock);
  LODWORD(v4) = self->_isMusicAppInstalled;
  self->_isMusicAppInstalled = v5;
  os_unfair_lock_unlock(&self->_lock);
  if ((_DWORD)v4 != v5)
  {
    uint64_t v7 = _MRLogForCategory(12LL, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = @"not installed";
      if (v5) {
        id v9 = @"installed";
      }
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[MRDMusicUserStateCenter] Music application changed to: %@",  buf,  0xCu);
    }

    Notificationuint64_t Queue = MRGroupSessionSubsystemGetNotificationQueue();
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(NotificationQueue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002A638;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_async(v11, block);
  }

- (void)handleRegisteredApplicationsChangedNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"bundleIDs"]);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicUserStateCenter musicApplicationBundleIdentifier](self, "musicApplicationBundleIdentifier"));
  unsigned int v6 = [v7 containsObject:v5];

  if (v6) {
    -[MRDMusicUserStateCenter updateIsMusicAppInstalled](self, "updateIsMusicAppInstalled");
  }
}

- (void)handleiTunesNotification:(id)a3
{
}

- (void)postCloudStateChanged
{
  Notificationuint64_t Queue = MRGroupSessionSubsystemGetNotificationQueue(self, a2);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(NotificationQueue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002A7A0;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (BOOL)isMusicAppInstalled
{
  return self->_isMusicAppInstalled;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (id)privacyObserver
{
  return self->_privacyObserver;
}

- (void)setPrivacyObserver:(id)a3
{
}

- (NSString)musicApplicationBundleIdentifier
{
  return self->_musicApplicationBundleIdentifier;
}

- (NSMutableDictionary)dsidToPendingCompletionMap
{
  return self->_dsidToPendingCompletionMap;
}

- (void)setDsidToPendingCompletionMap:(id)a3
{
}

- (NSMutableSet)finishedWaitingForCloudStateDSIDs
{
  return self->_finishedWaitingForCloudStateDSIDs;
}

- (void)setFinishedWaitingForCloudStateDSIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end