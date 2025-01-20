@interface RPIdentityDaemon
+ (id)sharedIdentityDaemon;
- (BOOL)_removeSameAccountIdentityWithIDSIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_shouldLoadSharedTVUserDeviceIdentities;
- (BOOL)_stationaryDevice;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)removeIdentity:(id)a3 error:(id *)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (BOOL)saveIdentity:(id)a3 error:(id *)a4;
- (BOOL)saveIdentityWithIDSDeviceID:(id)a3 message:(id)a4 error:(id *)a5;
- (NSUUID)adHocPairingIdentifier;
- (NSUUID)sessionPairingIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (RPIdentity)homeKitIdentity;
- (RPIdentityDaemon)init;
- (id)_identitiesOfType:(int)a3 error:(id *)a4;
- (id)descriptionWithLevel:(int)a3;
- (id)identitiesOfType:(int)a3 error:(id *)a4;
- (id)identityOfSelfAndReturnError:(id *)a3;
- (id)identityOfTemporarySelfAndReturnError:(id *)a3;
- (id)loadFamilyDeviceIdentitiesWithError:(id *)a3;
- (id)loadFriendDeviceIdentitiesWithError:(id *)a3;
- (id)resolveIdentitiesForBonjourDevice:(id)a3 typeFlags:(unsigned int)a4;
- (id)resolveIdentityForBonjourDevice:(id)a3 typeFlags:(unsigned int)a4;
- (id)resolveIdentityForNearFieldMessagePayload:(id)a3;
- (id)resolveIdentityForSignature:(id)a3 data:(id)a4 typeFlags:(unsigned int)a5 error:(id *)a6;
- (id)resolveIdentityForTempAuthTagData:(id)a3 bluetoothAddressData:(id)a4;
- (unint64_t)featureFlagsForIdentityMatchingIDSDeviceIdentifier:(id)a3;
- (unint64_t)resolveIdentityforSignature:(id)a3 data:(id)a4 flags:(unsigned int)a5 accountaltDSID:(id)a6;
- (unsigned)_updateSelfIdentityPrivate:(id)a3 create:(BOOL)a4;
- (unsigned)_updateSelfIdentityPublic:(id)a3 privateIdentity:(id)a4;
- (unsigned)resolveIdentityTypesForSignature:(id)a3 data:(id)a4 typeFlags:(unsigned int)a5;
- (void)_activate;
- (void)_ensureStarted;
- (void)_ensureStopped;
- (void)_enumerateIdentitiesWithFlag:(unsigned int)a3 usingBlock:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_loadSelfIdentity:(BOOL)a3;
- (void)_loadSharedTVUserDeviceIdentities;
- (void)_loadTemporarySelfIdentity;
- (void)_postIdentitiesChangedNotification;
- (void)_removeSelfIdentityPublicWithPrivateIdentity:(id)a3;
- (void)_saveSelfIdentityPrivate:(id)a3;
- (void)_saveSelfIdentityPublicWithPrivateIdentity:(id)a3 force:(BOOL)a4;
- (void)_triggerKeychainRefetch;
- (void)_update;
- (void)_updatePairedDeviceIdentities;
- (void)_updateSameAccountIdentities;
- (void)activate;
- (void)addOrUpdateAdHocPairedIdentity:(id)a3;
- (void)addSelfIdentityInfoToMessage:(id)a3 flags:(unsigned int)a4;
- (void)addSessionPairedIdentity:(id)a3;
- (void)addSharedHomeIdentityWithRPMessage:(id)a3;
- (void)daemonInfoChanged:(unint64_t)a3;
- (void)getPairedIdentityWithCompletion:(id)a3;
- (void)getPairingIdentityFromHomeWithAccessory:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)isContactValidForIdentity:(id)a3 completionBlock:(id)a4;
- (void)prefsChanged;
- (void)regenerateSelfIdentity:(id)a3;
- (void)regenerateTemporarySelfIdentity;
- (void)removeSessionPairedIdentityWithIdentifier:(id)a3;
- (void)resolvableAccessoriesUpdated:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHomeKitIdentity:(id)a3;
- (void)updateSessionPairedIdentity:(id)a3;
- (void)updateSharedTVIdentities;
@end

@implementation RPIdentityDaemon

+ (id)sharedIdentityDaemon
{
  if (qword_100133418 != -1) {
    dispatch_once(&qword_100133418, &stru_1001130B8);
  }
  return (id)qword_100133410;
}

- (RPIdentityDaemon)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___RPIdentityDaemon;
  v2 = -[RPIdentityDaemon init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    *(void *)&v3->_homeViewChangeToken = -1LL;
    v3->_pairedDevicesNotifier = -1;
    v3->_userIdentitiesChanged = 1;
    id v4 = objc_alloc((Class)off_1001321A0[0]());
    dispatchQueue = v3->_dispatchQueue;
    uint64_t v6 = off_1001321A8[0]();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v18 = v7;
    v19 = &__kCFBooleanTrue;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    v9 = (CBPeripheralManager *)[v4 initWithDelegate:0 queue:dispatchQueue options:v8];
    peripheralManager = v3->_peripheralManager;
    v3->_peripheralManager = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    sessionPairingIdentifier = v3->_sessionPairingIdentifier;
    v3->_sessionPairingIdentifier = (NSUUID *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    adHocPairingIdentifier = v3->_adHocPairingIdentifier;
    v3->_adHocPairingIdentifier = (NSUUID *)v13;

    v15 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  id v218 = 0LL;
  NSAppendPrintF(&v218, "-- RPIdentityDaemon --\n");
  id v5 = v218;
  else {
    int v6 = 30;
  }
  uint64_t v7 = v6 | a3 & 0x800000u;
  id v217 = 0LL;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identityOfSelfAndReturnError:](self, "identityOfSelfAndReturnError:", &v217));
  id v9 = v217;
  v10 = v9;
  if (v8)
  {
    id v216 = v5;
    uint64_t v11 = CUDescriptionWithLevel(v8, v7);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    NSAppendPrintF(&v216, "%@\n", v12);
    id v13 = v216;

    id v5 = (id)v12;
  }

  else
  {
    id v215 = v5;
    NSAppendPrintF(&v215, "No SelfIdentity: %{error}\n", v9);
    id v13 = v215;
  }

  id v214 = v10;
  uint64_t v14 = objc_claimAutoreleasedReturnValue( -[RPIdentityDaemon identityOfTemporarySelfAndReturnError:]( self,  "identityOfTemporarySelfAndReturnError:",  &v214));
  id v15 = v214;

  v140 = (void *)v8;
  unsigned int v143 = v7;
  if (v14)
  {
    id v213 = v13;
    uint64_t v16 = CUDescriptionWithLevel(v14, v7);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    NSAppendPrintF(&v213, "%@\n", v17);
    id v18 = v213;

    id v13 = (id)v17;
  }

  else
  {
    id v212 = v13;
    NSAppendPrintF(&v212, "No TemporarySelfIdentity: %{error}\n", v15);
    id v18 = v212;
  }

  v138 = (void *)v14;

  __int128 v210 = 0u;
  __int128 v211 = 0u;
  __int128 v208 = 0u;
  __int128 v209 = 0u;
  v141 = self;
  v19 = self->_sameAccountDeviceIdentities;
  id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v208,  v228,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v209;
    do
    {
      v23 = 0LL;
      v24 = v18;
      do
      {
        if (*(void *)v209 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v208 + 1) + 8LL * (void)v23);
        id v207 = v24;
        uint64_t v26 = CUDescriptionWithLevel(v25, v143);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        NSAppendPrintF(&v207, "%@\n", v27);
        id v18 = v207;

        v23 = (char *)v23 + 1;
        v24 = v18;
      }

      while (v21 != v23);
      id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v208,  v228,  16LL);
    }

    while (v21);
  }

  id v206 = v15;
  v28 = v141;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v141, "identitiesOfType:error:", 3LL, &v206));
  id v30 = v206;

  v137 = v29;
  if (v29)
  {
    __int128 v204 = 0u;
    __int128 v205 = 0u;
    __int128 v202 = 0u;
    __int128 v203 = 0u;
    id v31 = v29;
    id v32 = [v31 countByEnumeratingWithState:&v202 objects:v227 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v203;
      do
      {
        v35 = 0LL;
        v36 = v18;
        do
        {
          if (*(void *)v203 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v37 = *(void *)(*((void *)&v202 + 1) + 8LL * (void)v35);
          id v201 = v36;
          uint64_t v38 = CUDescriptionWithLevel(v37, v143);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          NSAppendPrintF(&v201, "%@\n", v39);
          id v18 = v201;

          v35 = (char *)v35 + 1;
          v36 = v18;
        }

        while (v33 != v35);
        id v33 = [v31 countByEnumeratingWithState:&v202 objects:v227 count:16];
      }

      while (v33);
      v28 = v141;
    }
  }

  else
  {
    id v200 = v18;
    NSAppendPrintF(&v200, "No family account identities: %{error}\n", v30);
    id v31 = v18;
    id v18 = v200;
  }

  id v199 = v30;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 4LL, &v199));
  id v41 = v199;

  v136 = v40;
  if (v40)
  {
    __int128 v197 = 0u;
    __int128 v198 = 0u;
    __int128 v195 = 0u;
    __int128 v196 = 0u;
    id v42 = v40;
    id v43 = [v42 countByEnumeratingWithState:&v195 objects:v226 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v196;
      do
      {
        v46 = 0LL;
        v47 = v18;
        do
        {
          if (*(void *)v196 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v48 = *(void *)(*((void *)&v195 + 1) + 8LL * (void)v46);
          id v194 = v47;
          uint64_t v49 = CUDescriptionWithLevel(v48, v143);
          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
          NSAppendPrintF(&v194, "%@\n", v50);
          id v18 = v194;

          v46 = (char *)v46 + 1;
          v47 = v18;
        }

        while (v44 != v46);
        id v44 = [v42 countByEnumeratingWithState:&v195 objects:v226 count:16];
      }

      while (v44);
      v28 = v141;
    }
  }

  else
  {
    id v193 = v18;
    NSAppendPrintF(&v193, "No family device identities: %{error}\n", v41);
    id v42 = v18;
    id v18 = v193;
  }

  id v192 = v41;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 5LL, &v192));
  id v52 = v192;

  v135 = v51;
  if (v51)
  {
    __int128 v190 = 0u;
    __int128 v191 = 0u;
    __int128 v188 = 0u;
    __int128 v189 = 0u;
    id v53 = v51;
    id v54 = [v53 countByEnumeratingWithState:&v188 objects:v225 count:16];
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v189;
      do
      {
        v57 = 0LL;
        v58 = v18;
        do
        {
          if (*(void *)v189 != v56) {
            objc_enumerationMutation(v53);
          }
          uint64_t v59 = *(void *)(*((void *)&v188 + 1) + 8LL * (void)v57);
          id v187 = v58;
          uint64_t v60 = CUDescriptionWithLevel(v59, v143);
          v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
          NSAppendPrintF(&v187, "%@\n", v61);
          id v18 = v187;

          v57 = (char *)v57 + 1;
          v58 = v18;
        }

        while (v55 != v57);
        id v55 = [v53 countByEnumeratingWithState:&v188 objects:v225 count:16];
      }

      while (v55);
      v28 = v141;
    }
  }

  else
  {
    id v186 = v18;
    NSAppendPrintF(&v186, "No friend account identities: %{error}\n", v52);
    id v53 = v18;
    id v18 = v186;
  }

  id v185 = v52;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 6LL, &v185));
  id v63 = v185;

  v134 = v62;
  if (v62)
  {
    __int128 v183 = 0u;
    __int128 v184 = 0u;
    __int128 v181 = 0u;
    __int128 v182 = 0u;
    id v64 = v62;
    id v65 = [v64 countByEnumeratingWithState:&v181 objects:v224 count:16];
    if (v65)
    {
      id v66 = v65;
      uint64_t v67 = *(void *)v182;
      do
      {
        v68 = 0LL;
        v69 = v18;
        do
        {
          if (*(void *)v182 != v67) {
            objc_enumerationMutation(v64);
          }
          uint64_t v70 = *(void *)(*((void *)&v181 + 1) + 8LL * (void)v68);
          id v180 = v69;
          uint64_t v71 = CUDescriptionWithLevel(v70, v143);
          v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
          NSAppendPrintF(&v180, "%@\n", v72);
          id v18 = v180;

          v68 = (char *)v68 + 1;
          v69 = v18;
        }

        while (v66 != v68);
        id v66 = [v64 countByEnumeratingWithState:&v181 objects:v224 count:16];
      }

      while (v66);
      v28 = v141;
    }
  }

  else
  {
    id v179 = v18;
    NSAppendPrintF(&v179, "No friend device identities: %{error}\n", v63);
    id v64 = v18;
    id v18 = v179;
  }

  id v178 = v63;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 8LL, &v178));
  id v74 = v178;

  v139 = v73;
  if (v73)
  {
    __int128 v176 = 0u;
    __int128 v177 = 0u;
    __int128 v174 = 0u;
    __int128 v175 = 0u;
    id v75 = v73;
    id v76 = [v75 countByEnumeratingWithState:&v174 objects:v223 count:16];
    if (v76)
    {
      id v77 = v76;
      uint64_t v78 = *(void *)v175;
      do
      {
        v79 = 0LL;
        v80 = v18;
        do
        {
          if (*(void *)v175 != v78) {
            objc_enumerationMutation(v75);
          }
          uint64_t v81 = *(void *)(*((void *)&v174 + 1) + 8LL * (void)v79);
          id v173 = v80;
          uint64_t v82 = CUDescriptionWithLevel(v81, v143);
          v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
          NSAppendPrintF(&v173, "%@\n", v83);
          id v18 = v173;

          v79 = (char *)v79 + 1;
          v80 = v18;
        }

        while (v77 != v79);
        id v77 = [v75 countByEnumeratingWithState:&v174 objects:v223 count:16];
      }

      while (v77);
      v28 = v141;
    }
  }

  else
  {
    id v172 = v18;
    NSAppendPrintF(&v172, "No paired device identities: %{error}\n", v74);
    id v75 = v18;
    id v18 = v172;
  }

  id v171 = v74;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 9LL, &v171));
  id v85 = v171;

  v133 = v84;
  if (v84)
  {
    __int128 v169 = 0u;
    __int128 v170 = 0u;
    __int128 v167 = 0u;
    __int128 v168 = 0u;
    id v86 = v84;
    id v87 = [v86 countByEnumeratingWithState:&v167 objects:v222 count:16];
    if (v87)
    {
      id v88 = v87;
      uint64_t v89 = *(void *)v168;
      do
      {
        v90 = 0LL;
        v91 = v18;
        do
        {
          if (*(void *)v168 != v89) {
            objc_enumerationMutation(v86);
          }
          uint64_t v92 = *(void *)(*((void *)&v167 + 1) + 8LL * (void)v90);
          id v166 = v91;
          uint64_t v93 = CUDescriptionWithLevel(v92, v143);
          v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
          NSAppendPrintF(&v166, "%@\n", v94);
          id v18 = v166;

          v90 = (char *)v90 + 1;
          v91 = v18;
        }

        while (v88 != v90);
        id v88 = [v86 countByEnumeratingWithState:&v167 objects:v222 count:16];
      }

      while (v88);
      v28 = v141;
    }
  }

  else
  {
    id v165 = v18;
    NSAppendPrintF(&v165, "No SharedHome device identities: %{error}\n", v85);
    id v86 = v18;
    id v18 = v165;
  }

  id v164 = v85;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 12LL, &v164));
  id v96 = v164;

  v132 = v95;
  if (v95)
  {
    __int128 v162 = 0u;
    __int128 v163 = 0u;
    __int128 v160 = 0u;
    __int128 v161 = 0u;
    id v97 = v95;
    id v98 = [v97 countByEnumeratingWithState:&v160 objects:v221 count:16];
    if (v98)
    {
      id v99 = v98;
      uint64_t v100 = *(void *)v161;
      do
      {
        v101 = 0LL;
        v102 = v18;
        do
        {
          if (*(void *)v161 != v100) {
            objc_enumerationMutation(v97);
          }
          uint64_t v103 = *(void *)(*((void *)&v160 + 1) + 8LL * (void)v101);
          id v159 = v102;
          uint64_t v104 = CUDescriptionWithLevel(v103, v143);
          v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
          NSAppendPrintF(&v159, "%@\n", v105, v132, v133, v134, v135, v136, v137, v138);
          id v18 = v159;

          v101 = (char *)v101 + 1;
          v102 = v18;
        }

        while (v99 != v101);
        id v99 = [v97 countByEnumeratingWithState:&v160 objects:v221 count:16];
      }

      while (v99);
    }

    v28 = v141;
  }

  else
  {
    id v158 = v18;
    NSAppendPrintF( &v158,  "No Shared TV user device identities: %{error}\n",  v96,  0LL,  v133,  v134,  v135,  v136,  v137,  v138);
    id v97 = v18;
    id v18 = v158;
  }

  id v157 = v96;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 13LL, &v157));
  id v107 = v157;

  if (v106)
  {
    __int128 v155 = 0u;
    __int128 v156 = 0u;
    __int128 v153 = 0u;
    __int128 v154 = 0u;
    id v108 = v106;
    id v109 = [v108 countByEnumeratingWithState:&v153 objects:v220 count:16];
    if (v109)
    {
      id v110 = v109;
      uint64_t v111 = *(void *)v154;
      do
      {
        v112 = 0LL;
        v113 = v18;
        do
        {
          if (*(void *)v154 != v111) {
            objc_enumerationMutation(v108);
          }
          uint64_t v114 = *(void *)(*((void *)&v153 + 1) + 8LL * (void)v112);
          id v152 = v113;
          uint64_t v115 = CUDescriptionWithLevel(v114, v143);
          v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
          NSAppendPrintF(&v152, "%@\n", v116);
          id v18 = v152;

          v112 = (char *)v112 + 1;
          v113 = v18;
        }

        while (v110 != v112);
        id v110 = [v108 countByEnumeratingWithState:&v153 objects:v220 count:16];
      }

      while (v110);
      v28 = v141;
    }
  }

  else
  {
    id v151 = v18;
    NSAppendPrintF(&v151, "No session pairing identities: %{error}\n", v107);
    id v108 = v18;
    id v18 = v151;
  }

  id v150 = v107;
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 15LL, &v150));
  id v118 = v150;

  v120 = v139;
  v119 = v140;
  if (v117)
  {
    __int128 v148 = 0u;
    __int128 v149 = 0u;
    __int128 v146 = 0u;
    __int128 v147 = 0u;
    id v121 = v117;
    id v122 = [v121 countByEnumeratingWithState:&v146 objects:v219 count:16];
    if (v122)
    {
      id v123 = v122;
      v142 = v106;
      uint64_t v124 = *(void *)v147;
      do
      {
        v125 = 0LL;
        v126 = v18;
        do
        {
          if (*(void *)v147 != v124) {
            objc_enumerationMutation(v121);
          }
          uint64_t v127 = *(void *)(*((void *)&v146 + 1) + 8LL * (void)v125);
          id v145 = v126;
          uint64_t v128 = CUDescriptionWithLevel(v127, v143);
          v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
          NSAppendPrintF(&v145, "%@\n", v129);
          id v18 = v145;

          v125 = (char *)v125 + 1;
          v126 = v18;
        }

        while (v123 != v125);
        id v123 = [v121 countByEnumeratingWithState:&v146 objects:v219 count:16];
      }

      while (v123);
      v120 = v139;
      v119 = v140;
      v106 = v142;
    }
  }

  else
  {
    id v144 = v18;
    NSAppendPrintF(&v144, "No ad-hoc paired identities: %{error}\n", v118);
    id v121 = v18;
    id v18 = v144;
  }

  id v130 = v18;
  return v130;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005D8B0;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (!self->_systemMonitor)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10005D9D0;
    v7[3] = &unk_1001110A8;
    v7[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v7);
    id v5 = self->_systemMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10005D9D8;
    v6[3] = &unk_1001110A8;
    v6[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

  -[RPIdentityDaemon prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005DA38;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon _invalidate]", 30LL, "Invalidating\n");
    }

    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0LL;

    peripheralManager = self->_peripheralManager;
    self->_peripheralManager = 0LL;

    -[RPIdentityDaemon _ensureStopped](self, "_ensureStopped");
    -[RPIdentityDaemon _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon _invalidated]", 30LL, "Invalidated\n");
    }
  }

- (void)daemonInfoChanged:(unint64_t)a3
{
  int v3 = a3;
  if ((a3 & 0x10) != 0)
  {
    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon daemonInfoChanged:]", 30LL, "Removing identities on sign out\n");
    }

    -[RPIdentityDaemon _ensureStopped](self, "_ensureStopped");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
    [v5 postDaemonInfoChanges:8];

    notify_post("com.apple.rapport.identitiesChanged");
    -[RPIdentityDaemon _update](self, "_update");
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }

  selfIdentityCache = self->_selfIdentityCache;
  self->_selfIdentityCache = 0LL;

  -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 0LL);
  -[RPIdentityDaemon _updateSameAccountIdentities](self, "_updateSameAccountIdentities");
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x20000) == 0) {
      return;
    }
    goto LABEL_17;
  }

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v6 isEqual:@"KeychainRefetch"])
  {
    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon diagnosticCommand:params:]", 30LL, "Diag: KeychainRefetch\n");
    }

    -[RPIdentityDaemon _triggerKeychainRefetch](self, "_triggerKeychainRefetch");
    goto LABEL_37;
  }

  if ([v6 isEqual:@"SelfIdentityLoad"])
  {
    -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 0LL);
LABEL_37:
    LOBYTE(v8) = 1;
    goto LABEL_38;
  }

  if ([v6 isEqual:@"SelfIdentitySave"])
  {
    uint64_t v8 = self->_selfIdentityCache;
    if (v8)
    {
      if (dword_100132130 <= 30
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
      {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon diagnosticCommand:params:]",  30LL,  "Diag: force SelfIdentity save\n");
      }

      -[RPIdentityDaemon _saveSelfIdentityPrivate:](self, "_saveSelfIdentityPrivate:", v8);
      -[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]( self,  "_saveSelfIdentityPublicWithPrivateIdentity:force:",  v8,  1LL);
    }

    else if (dword_100132130 <= 30 {
           && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    }
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon diagnosticCommand:params:]",  30LL,  "### Diag: force SelfIdentity save without SelfIdentity\n");
    }

    goto LABEL_36;
  }

  if ([v6 isEqual:@"SelfIdentityRemove"])
  {
    uint64_t v8 = self->_selfIdentityCache;
    if (v8)
    {
      if (dword_100132130 <= 30
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
      {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon diagnosticCommand:params:]",  30LL,  "Diag: force SelfIdentity remove\n");
      }

      -[RPIdentityDaemon _removeSelfIdentityPublicWithPrivateIdentity:]( self,  "_removeSelfIdentityPublicWithPrivateIdentity:",  v8);
    }

    goto LABEL_36;
  }

  if ([v6 isEqual:@"SelfIdentityRotate"])
  {
    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon diagnosticCommand:params:]",  30LL,  "Diag: force SelfIdentity rotate\n");
    }

    LOBYTE(v8) = 1;
    -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 1LL);
    goto LABEL_38;
  }

  if (![v6 isEqual:@"SameAccountIdentityRemove"])
  {
LABEL_50:
    LOBYTE(v8) = 0;
    goto LABEL_38;
  }

  uint64_t v8 = (RPIdentity *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"idsIdentifier"]);
  if (dword_100132130 <= 30 && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL))) {
    LogPrintF( &dword_100132130,  "-[RPIdentityDaemon diagnosticCommand:params:]",  30LL,  "Diag: Remove SameAccountIdentity %@\n",  v8);
  }
  if (v8)
  {
    id v13 = 0LL;
    unsigned __int8 v10 = -[RPIdentityDaemon _removeSameAccountIdentityWithIDSIdentifier:error:]( self,  "_removeSameAccountIdentityWithIDSIdentifier:error:",  v8,  &v13);
    id v11 = v13;
    uint64_t v12 = v11;
    if ((v10 & 1) != 0)
    {

LABEL_36:
      goto LABEL_37;
    }

    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon diagnosticCommand:params:]",  30LL,  "Diag: Remove SameAccountIdentity failed: %@\n",  v8,  v12);
    }

    goto LABEL_50;
  }

- (void)prefsChanged
{
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.rapport", @"idFamilyResolve", &v28);
  if (v28) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = Int64 == 0;
  }
  BOOL v5 = !v4;
  if (self->_prefFamilyResolve != v5)
  {
    if (dword_100132130 <= 40
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 40LL)))
    {
      id v6 = "yes";
      if (v5) {
        id v7 = "no";
      }
      else {
        id v7 = "yes";
      }
      if (!v5) {
        id v6 = "no";
      }
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon prefsChanged]", 40LL, "Family resolve: %s -> %s\n", v7, v6);
    }

    self->_prefFamilyResolve = v5;
  }

  uint64_t v8 = CFPrefs_GetInt64(@"com.apple.rapport", @"idFriendResolve", &v28);
  if (v28) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  BOOL v10 = !v9;
  if (self->_prefFriendResolve != v10)
  {
    if (dword_100132130 <= 40
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 40LL)))
    {
      id v11 = "yes";
      if (v10) {
        uint64_t v12 = "no";
      }
      else {
        uint64_t v12 = "yes";
      }
      if (!v10) {
        id v11 = "no";
      }
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon prefsChanged]", 40LL, "Friend resolve: %s -> %s\n", v12, v11);
    }

    self->_prefFriendResolve = v10;
  }

  uint64_t v13 = CFPrefs_GetInt64(@"com.apple.rapport", @"idOwnerResolve", &v28);
  if (v28) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v13 == 0;
  }
  BOOL v15 = !v14;
  if (self->_prefOwnerResolve != v15)
  {
    if (dword_100132130 <= 40
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 40LL)))
    {
      uint64_t v16 = "yes";
      if (v15) {
        uint64_t v17 = "no";
      }
      else {
        uint64_t v17 = "yes";
      }
      if (!v15) {
        uint64_t v16 = "no";
      }
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon prefsChanged]", 40LL, "Owner resolve: %s -> %s\n", v17, v16);
    }

    self->_prefOwnerResolve = v15;
  }

  uint64_t v18 = CFPrefs_GetInt64(@"com.apple.rapport", @"idPairedResolve", &v28);
  if (v28) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v18 == 0;
  }
  BOOL v20 = !v19;
  if (self->_prefPairedResolve != v20)
  {
    if (dword_100132130 <= 40
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 40LL)))
    {
      id v21 = "yes";
      if (v20) {
        uint64_t v22 = "no";
      }
      else {
        uint64_t v22 = "yes";
      }
      if (!v20) {
        id v21 = "no";
      }
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon prefsChanged]", 40LL, "Paired resolve: %s -> %s\n", v22, v21);
    }

    self->_prefPairedResolve = v20;
  }

  uint64_t v23 = CFPrefs_GetInt64(@"com.apple.rapport", @"idSharedHomeResolve", &v28);
  if (v28) {
    BOOL v24 = 0;
  }
  else {
    BOOL v24 = v23 == 0;
  }
  BOOL v25 = !v24;
  if (self->_prefSharedHomeResolve != v25)
  {
    if (dword_100132130 <= 40
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 40LL)))
    {
      uint64_t v26 = "yes";
      if (v25) {
        v27 = "no";
      }
      else {
        v27 = "yes";
      }
      if (!v25) {
        uint64_t v26 = "no";
      }
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon prefsChanged]", 40LL, "SharedHome resolve: %s -> %s\n", v27, v26);
    }

    self->_prefSharedHomeResolve = v25;
  }

  -[RPIdentityDaemon _update](self, "_update");
}

- (void)regenerateSelfIdentity:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100132130 <= 30 && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL))) {
    LogPrintF( &dword_100132130,  "-[RPIdentityDaemon regenerateSelfIdentity:]",  30LL,  "Re-generate SelfIdentity: %@\n",  v4);
  }
  -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 1LL);
}

- (void)_update
{
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (void)setHomeKitIdentity:(id)a3
{
  id v4 = (RPIdentity *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  homeKitIdentity = self->_homeKitIdentity;
  self->_homeKitIdentity = v4;
}

- (void)resolvableAccessoriesUpdated:(id)a3
{
  id v4 = a3;
  id v41 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v57 objects:v63 count:16];
  id v42 = v6;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v58;
    v46 = v5;
    uint64_t v44 = *(void *)v58;
    do
    {
      BOOL v10 = 0LL;
      id v43 = v8;
      do
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v10);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);

        if (v13)
        {
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v11 device]);
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 rapportIRK]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 data]);

          if ([v16 length])
          {
            uint64_t v48 = v16;
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 home]);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 currentUser]);
            if (!v18
              || (BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v17 homeAccessControlForUser:v18]),
                  unsigned __int8 v20 = [v19 isOwner],
                  v19,
                  (v20 & 1) == 0))
            {
              v47 = v13;
              __int128 v55 = 0u;
              __int128 v56 = 0u;
              __int128 v53 = 0u;
              __int128 v54 = 0u;
              id v21 = (RPIdentity *)objc_claimAutoreleasedReturnValue([v17 users]);
              id v22 = -[RPIdentity countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v53,  v62,  16LL);
              if (v22)
              {
                uint64_t v45 = v18;
                uint64_t v23 = *(void *)v54;
LABEL_12:
                uint64_t v24 = 0LL;
                while (1)
                {
                  if (*(void *)v54 != v23) {
                    objc_enumerationMutation(v21);
                  }
                  BOOL v25 = *(void **)(*((void *)&v53 + 1) + 8 * v24);
                  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v17 homeAccessControlForUser:v25]);
                  unsigned __int8 v27 = [v26 isOwner];

                  if ((v27 & 1) != 0) {
                    break;
                  }
                  if (v22 == (id)++v24)
                  {
                    id v22 = -[RPIdentity countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v53,  v62,  16LL);
                    if (v22) {
                      goto LABEL_12;
                    }
                    int v28 = 0LL;
                    id v6 = v42;
                    id v8 = v43;
LABEL_29:
                    uint64_t v18 = v45;
                    goto LABEL_31;
                  }
                }

                int v28 = (void *)objc_claimAutoreleasedReturnValue([v25 userID]);
                id v22 = (id)objc_claimAutoreleasedReturnValue([v25 uniqueIdentifier]);

                if (!v28)
                {
                  id v6 = v42;
                  id v8 = v43;
                  uint64_t v18 = v45;
                  goto LABEL_32;
                }

                id v21 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
                -[RPIdentity setAccountID:](v21, "setAccountID:", v28);
                -[RPIdentity setDeviceIRKData:](v21, "setDeviceIRKData:", v48);
                -[RPIdentity setHomeKitUserIdentifier:](v21, "setHomeKitUserIdentifier:", v22);
                -[RPIdentity setIdentifier:](v21, "setIdentifier:", v47);
                -[RPIdentity setIdsDeviceID:](v21, "setIdsDeviceID:", v47);
                v29 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
                -[RPIdentity setName:](v21, "setName:", v29);

                -[RPIdentity setType:](v21, "setType:", 9LL);
                id v30 = [v11 homePodVariant];
                id v31 = @"AudioAccessory1,1";
                id v6 = v42;
                id v8 = v43;
                if (v30 == (id)1
                  || (id v32 = objc_msgSend(v11, "homePodVariant", @"AudioAccessory1,1"),
                      id v31 = @"AudioAccessory5,1",
                      v32 == (id)2)
                  || (id v33 = objc_msgSend(v11, "homePodVariant", @"AudioAccessory5,1"),
                      id v31 = @"AudioAccessory6,1",
                      v33 == (id)3))
                {
                  -[RPIdentity setModel:](v21, "setModel:", v31);
                }

                -[NSMutableArray addObject:](v46, "addObject:", v21);
                if (dword_100132130 > 30) {
                  goto LABEL_29;
                }
                uint64_t v18 = v45;
                if (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)) {
                  LogPrintF( &dword_100132130,  "-[RPIdentityDaemon resolvableAccessoriesUpdated:]",  30LL,  "SharedHome identity added: %@\n",  v21);
                }
              }

              else
              {
                int v28 = 0LL;
              }

- (id)resolveIdentitiesForBonjourDevice:(id)a3 typeFlags:(unsigned int)a4
{
  id v6 = a3;
  id v7 = 0LL;
  while (a4)
  {
    if ((a4 & -a4) == 0) {
      break;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]( self,  "resolveIdentityForBonjourDevice:typeFlags:",  v6,  a4 & -a4));
    if (v8)
    {
      if (!v7) {
        id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      }
      -[NSMutableArray addObject:](v7, "addObject:", v8);
    }

    a4 ^= a4 & -a4;
  }

  return v7;
}

- (id)resolveIdentityForBonjourDevice:(id)a3 typeFlags:(unsigned int)a4
{
  __int16 v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 txtDictionary]);
    CFDictionaryGetHardwareAddress(v7, @"rpBA", v98, 6LL, &v97);
    if (v97)
    {
      if (dword_100132130 > 10
        || dword_100132130 == -1 && !_LogCategory_Initialize(&dword_100132130, 10LL))
      {
        goto LABEL_119;
      }

      uint64_t v8 = CUDescriptionWithLevel(v6, 30LL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]",  10LL,  "Ignoring device with no BLE address: %@, %#m\n",  v9,  v97);
LABEL_112:

LABEL_119:
      id v48 = 0LL;
LABEL_120:

      goto LABEL_121;
    }

    uint64_t v95 = 0LL;
    CFDictionaryGetData(v7, @"rpAD", v96, 6LL, &v95, &v97);
    if (v95 != 6)
    {
      if (dword_100132130 > 20
        || dword_100132130 == -1 && !_LogCategory_Initialize(&dword_100132130, 20LL))
      {
        goto LABEL_119;
      }

      uint64_t v49 = CUDescriptionWithLevel(v6, 30LL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v49);
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]",  20LL,  "Ignoring device with no DeviceAuthTag: %@, %#m\n",  v9,  v97);
      goto LABEL_112;
    }

    uint64_t v10 = mach_absolute_time();
    if ((v4 & 2) != 0 && self->_prefOwnerResolve)
    {
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      id v11 = self->_sameAccountDeviceIdentities;
      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v91,  v106,  16LL);
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v92;
        while (2)
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v92 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)i);
            if ([v16 verifyAuthTagPtr:v96 authTagLen:v95 dataPtr:v98 dataLen:6 type:1 error:0])
            {
              if (dword_100132130 <= 20
                && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 20LL)))
              {
                uint64_t v50 = CUDescriptionWithLevel(v6, 30LL);
                __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
                LogPrintF( &dword_100132130,  "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]",  20LL,  "Resolved DeviceAuthTag: owner, %@ -> %@\n",  v51,  v16);
LABEL_140:
              }

              goto LABEL_141;
            }
          }

          id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v91,  v106,  16LL);
          if (v13) {
            continue;
          }
          break;
        }
      }
    }

    if ((v4 & 0x100) != 0 && self->_prefSharedHomeResolve)
    {
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      id v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 9LL, 0LL));
      id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v87,  v105,  16LL);
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v88;
LABEL_25:
        uint64_t v20 = 0LL;
        while (1)
        {
          if (*(void *)v88 != v19) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v87 + 1) + 8 * v20);
          if ([v16 verifyAuthTagPtr:v96 authTagLen:v95 dataPtr:v98 dataLen:6 type:1 error:0]) {
            break;
          }
          if (v18 == (id)++v20)
          {
            id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v87,  v105,  16LL);
            if (v18) {
              goto LABEL_25;
            }
            goto LABEL_31;
          }
        }

        if (dword_100132130 <= 20
          && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 20LL)))
        {
          uint64_t v53 = CUDescriptionWithLevel(v6, 30LL);
          __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(v53);
          LogPrintF( &dword_100132130,  "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]",  20LL,  "Resolved DeviceAuthTag: shared home, %@ -> %@\n",  v51,  v16);
          goto LABEL_140;
        }

        goto LABEL_141;
      }

- (id)resolveIdentityForSignature:(id)a3 data:(id)a4 typeFlags:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v17 = a4;
  if ((v7 & 2) != 0 && self->_prefOwnerResolve)
  {
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    id v18 = self->_sameAccountDeviceIdentities;
    id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v78,  v88,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v79;
      while (2)
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v79 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)i);
          if ([v23 verifySignature:v10 data:v17 error:0])
          {
            if (dword_100132130 <= 30
              && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
            {
              LogPrintF( &dword_100132130,  "-[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:]",  30LL,  "Resolved identity for signature: owner, %@\n",  v23);
            }

- (unsigned)resolveIdentityTypesForSignature:(id)a3 data:(id)a4 typeFlags:(unsigned int)a5
{
  __int16 v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((v5 & 2) == 0 || !self->_prefOwnerResolve)
  {
    uint64_t v11 = 0LL;
    if ((v5 & 8) == 0) {
      goto LABEL_28;
    }
    goto LABEL_16;
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v10 = self->_sameAccountDeviceIdentities;
  uint64_t v11 = (uint64_t)-[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v51,  v59,  16LL);
  if (v11)
  {
    uint64_t v12 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v51 + 1) + 8 * i) verifySignature:v8 data:v9 error:0])
        {
          uint64_t v11 = 2LL;
          goto LABEL_15;
        }
      }

      uint64_t v11 = (uint64_t)-[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v51,  v59,  16LL);
      if (v11) {
        continue;
      }
      break;
    }
  }

- (id)resolveIdentityForTempAuthTagData:(id)a3 bluetoothAddressData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 15LL, 0LL, 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v12 verifyAuthTag:v6 data:v7 type:2 error:0])
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (id)resolveIdentityForNearFieldMessagePayload:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_10006084C;
  uint64_t v27 = sub_10006085C;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_10006084C;
  id v21 = sub_10006085C;
  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100060864;
  v13[3] = &unk_1001130E0;
  id v5 = v4;
  id v14 = v5;
  __int128 v15 = &v23;
  __int128 v16 = &v17;
  -[RPIdentityDaemon _enumerateIdentitiesWithFlag:usingBlock:]( self,  "_enumerateIdentitiesWithFlag:usingBlock:",  19882LL,  v13);
  if (dword_100132130 <= 30 && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL))) {
    LogPrintF( &dword_100132130,  "-[RPIdentityDaemon resolveIdentityForNearFieldMessagePayload:]",  30,  "identity resolved:%@ - fallback identities:%ld",  v24[5],  [(id)v18[5] count]);
  }
  id v6 = v24;
  id v7 = (void *)v24[5];
  if (v7)
  {
    id v8 = v7;
    id v9 = (void *)v6[5];
    void v6[5] = (uint64_t)v8;
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([(id)v18[5] firstObject]);
    id v9 = (void *)v24[5];
    v24[5] = v10;
  }

  id v11 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

- (unint64_t)resolveIdentityforSignature:(id)a3 data:(id)a4 flags:(unsigned int)a5 accountaltDSID:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v30 = 0LL;
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  id v21 = sub_100060A74;
  id v22 = &unk_100113108;
  id v13 = v10;
  id v23 = v13;
  id v14 = v11;
  id v24 = v14;
  id v15 = v12;
  id v25 = v15;
  id v26 = &v27;
  __int128 v16 = objc_retainBlock(&v19);
  -[RPIdentityDaemon _enumerateIdentitiesWithFlag:usingBlock:]( self,  "_enumerateIdentitiesWithFlag:usingBlock:",  v7,  v16,  v19,  v20,  v21,  v22);
  unint64_t v17 = v28[3];

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (void)isContactValidForIdentity:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  if (v6
    && (id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 contactID])) != 0
    && (unsigned int v9 = [v6 type], v8, v9 == 6))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 contactID]);
    id v11 = objc_alloc_init((Class)off_1001321B0[0]());
    [v11 setContactIdentifier:v10];
    id v12 = objc_alloc_init((Class)off_1001321B8[0]());
    [v12 setDispatchQueue:self->_dispatchQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100060D3C;
    v15[3] = &unk_100113130;
    id v13 = v12;
    id v16 = v13;
    id v17 = v6;
    id v14 = v11;
    id v18 = v14;
    uint64_t v19 = self;
    id v21 = &v22;
    id v20 = v7;
    [v13 findContact:v14 completion:v15];
  }

  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, *((unsigned __int8 *)v23 + 24));
  }

  _Block_object_dispose(&v22, 8);
}

- (id)identitiesOfType:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int DeviceClass = GestaltGetDeviceClass(v7, v8);
  switch((_DWORD)v5)
  {
    case 9:
      sharedHomeDeviceIdentities = self->_sharedHomeDeviceIdentities;
      goto LABEL_11;
    case 8:
      sharedHomeDeviceIdentities = (NSMutableArray *)self->_pairedDeviceIdentities;
      goto LABEL_11;
    case 2:
      p_super = self->_sameAccountDeviceIdentities;
      if (!p_super)
      {
LABEL_5:
        id v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon _identitiesOfType:error:](self, "_identitiesOfType:error:", v5, a4));
LABEL_14:
        p_super = &v11->super;
        return p_super;
      }

      return p_super;
  }

  if ((_DWORD)v5 == 12 && DeviceClass == 4)
  {
    sharedHomeDeviceIdentities = (NSMutableArray *)self->_sharedTVUserDeviceIdentities;
    goto LABEL_11;
  }

  if ((int)v5 > 12)
  {
    if ((_DWORD)v5 == 15)
    {
      sharedHomeDeviceIdentities = self->_adHocPairedDeviceIdentities;
    }

    else
    {
      if ((_DWORD)v5 != 13) {
        goto LABEL_5;
      }
      sharedHomeDeviceIdentities = self->_sessionPairedDeviceIdentities;
    }

- (id)_identitiesOfType:(int)a3 error:(id *)a4
{
  int v9 = a3;
  int v10 = a3 - 1;
  if ((a3 - 1) >= 0xC || ((0x8FFu >> v10) & 1) == 0)
  {
    id v11 = RPErrorF( 4294960540LL,  (uint64_t)"Bad identity type (%d)",  *(uint64_t *)&a3,  (uint64_t)a4,  v4,  v5,  v6,  v7,  *(uint64_t *)&a3);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (dword_100132130 <= 90
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _identitiesOfType:error:]",  90LL,  "### Get identities failed: %{error}\n",  v12);
    }

    if (a4) {
      *a4 = v12;
    }

LABEL_14:
    id v23 = 0LL;
    return v23;
  }

  id v14 = off_1001132B0[v10];
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    if (v9 == 12 || v9 == 2)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
      __int128 v74 = (void *)objc_claimAutoreleasedReturnValue([v21 idsDeviceIDSelf]);

      uint64_t v22 = 3LL;
    }

    else
    {
      __int128 v74 = 0LL;
      uint64_t v22 = 1LL;
    }

    id v25 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
    [v25 setAccessGroup:@"com.apple.rapport"];
    [v25 setSyncType:v22];
    [v25 setType:v14];
    id v26 = objc_alloc_init(&OBJC_CLASS___CUKeychainManager);
    id v80 = 0LL;
    id v27 = [v26 copyItemsMatchingItem:v25 flags:1 error:&v80];
    id v28 = v80;
    id v29 = v28;
    __int128 v78 = v27;
    if (!v27 && [v28 code] != (id)-25300)
    {
      if (dword_100132130 <= 90
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
      {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _identitiesOfType:error:]",  90LL,  "### Get identity keychain items failed: %@, %{error}\n",  v14,  v29);
      }

      if (a4)
      {
        id v29 = v29;
        id v23 = 0LL;
        *a4 = v29;
      }

      else
      {
        id v23 = 0LL;
      }

- (id)identityOfSelfAndReturnError:(id *)a3
{
  uint64_t v5 = self->_selfIdentityCache;
  if (!v5)
  {
    if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
    {
      -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 0LL);
      id v12 = self->_selfIdentityCache;
      uint64_t v5 = v12;
      if (v12)
      {
        uint64_t v19 = v12;
      }

      else if (a3)
      {
        id v20 = RPErrorF(4294960534LL, (uint64_t)"SelfIdentity load failed", v13, v14, v15, v16, v17, v18, v23);
        *a3 = (id)objc_claimAutoreleasedReturnValue(v20);
      }
    }

    else
    {
      if (dword_100132130 <= 30
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
      {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon identityOfSelfAndReturnError:]",  30LL,  "Deferring SelfIdentity get until FirstUnlock\n");
      }

      if (a3)
      {
        id v21 = RPErrorF( 4294960593LL,  (uint64_t)"SelfIdentity not accessible before FirstUnlock",  v6,  v7,  v8,  v9,  v10,  v11,  v23);
        uint64_t v5 = 0LL;
        *a3 = (id)objc_claimAutoreleasedReturnValue(v21);
      }

      else
      {
        uint64_t v5 = 0LL;
      }
    }
  }

  return v5;
}

- (id)identityOfTemporarySelfAndReturnError:(id *)a3
{
  uint64_t v5 = self->_temporarySelfIdentityCache;
  id v12 = v5;
  if (v5)
  {
    uint64_t v13 = v5;
  }

  else if (a3)
  {
    id v14 = RPErrorF(4294960534LL, (uint64_t)"SelfTemporaryIdentity not found", v6, v7, v8, v9, v10, v11, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v14);
  }

  return v12;
}

- (unint64_t)featureFlagsForIdentityMatchingIDSDeviceIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 4LL, 0LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 6LL, 0LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 2LL, 0LL));
  uint64_t v8 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v5);
  -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v6);
  -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v7);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v9 = v8;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v10)
  {
    uint64_t v17 = v5;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDeviceID]);
        unsigned int v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          id v10 = [v13 featureFlags];
          goto LABEL_11;
        }
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      if (v10) {
        continue;
      }
      break;
    }

- (void)regenerateTemporarySelfIdentity
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061FDC;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)loadFamilyDeviceIdentitiesWithError:(id *)a3
{
  return -[RPIdentityDaemon _identitiesOfType:error:](self, "_identitiesOfType:error:", 4LL, a3);
}

- (id)loadFriendDeviceIdentitiesWithError:(id *)a3
{
  return -[RPIdentityDaemon _identitiesOfType:error:](self, "_identitiesOfType:error:", 6LL, a3);
}

- (void)getPairedIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___CUPairingManager);
  [v5 setDispatchQueue:self->_dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100062108;
  v7[3] = &unk_100113158;
  v7[4] = v5;
  id v8 = v4;
  id v6 = v4;
  [v5 getPairingIdentityWithOptions:134 completion:v7];
}

- (void)getPairingIdentityFromHomeWithAccessory:(id)a3 completion:(id)a4
{
  id v17 = a3;
  id v5 = (void (**)(id, void, void *))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[RPCompanionLinkDaemon sharedCompanionLinkDaemon]( &OBJC_CLASS___RPCompanionLinkDaemon,  "sharedCompanionLinkDaemon"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rpHomeKitManager]);

  if (v7)
  {
    [v7 getPairingIdentityFromHomeWithAccessory:v17 completionHandler:v5];
  }

  else
  {
    id v14 = RPErrorF(4294960578LL, (uint64_t)"HomeKit manager not initialized", v8, v9, v10, v11, v12, v13, v16);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v5[2](v5, 0LL, v15);
  }
}

- (void)addSelfIdentityInfoToMessage:(id)a3 flags:(unsigned int)a4
{
  char v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v21 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identityOfSelfAndReturnError:](self, "identityOfSelfAndReturnError:", &v21));
  id v8 = v21;
  if (v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceIRKData]);
    if (v9) {
      [v6 setObject:v9 forKeyedSubscript:@"_dIRK"];
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 edPKData]);
    if (v10) {
      [v6 setObject:v10 forKeyedSubscript:@"_edPK"];
    }

    if ((v4 & 1) != 0)
    {
      unsigned __int8 v19 = [v7 featureFlags];
      if ((v19 & 8) != 0)
      {
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v19 & 8));
        [v6 setObject:v20 forKeyedSubscript:@"_ff"];
      }

      else
      {
        [v6 setObject:&off_10011AFD0 forKeyedSubscript:@"_ff"];
      }

      [v6 setObject:@"?" forKeyedSubscript:@"model"];
      [v6 setObject:@"?" forKeyedSubscript:@"model"];
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 btIRKData]);
      if (v11) {
        [v6 setObject:v11 forKeyedSubscript:@"_bIRK"];
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 btAddress]);
      if (v12) {
        [v6 setObject:v12 forKeyedSubscript:@"_bAdd"];
      }

      id v13 = [v7 featureFlags];
      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v13));
        [v6 setObject:v14 forKeyedSubscript:@"_ff"];
      }

      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"model"]);

      if (!v15)
      {
        uint64_t v16 = (void *)GestaltCopyAnswer(@"ProductType", 0LL, 0LL);
        if (v16) {
          [v6 setObject:v16 forKeyedSubscript:@"model"];
        }
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"name"]);

      if (!v17)
      {
        __int128 v18 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
        if (v18) {
          [v6 setObject:v18 forKeyedSubscript:@"name"];
        }
      }
    }
  }

  else if (dword_100132130 <= 90 {
         && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
  }
  {
    LogPrintF( &dword_100132130,  "-[RPIdentityDaemon addSelfIdentityInfoToMessage:flags:]",  90LL,  "### Add info failed with no SelfIdentity: %{error}\n",  v8);
  }
}

- (void)addSharedHomeIdentityWithRPMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v4, @"_idsID", TypeID, 0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v7)
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v8 = self->_sharedHomeExtraDeviceIdentities;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v43;
LABEL_4:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v42 + 1) + 8 * v12);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
        unsigned __int8 v15 = [v14 isEqual:v7];

        if ((v15 & 1) != 0) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      uint64_t v16 = v13;

      if (!v16) {
        goto LABEL_13;
      }
      -[RPIdentity updateWithRPMessage:error:](v16, "updateWithRPMessage:error:", v4, 0LL);
    }

    else
    {
LABEL_10:

LABEL_13:
      uint64_t v16 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
      -[RPIdentity setIdentifier:](v16, "setIdentifier:", v7);
      -[RPIdentity setType:](v16, "setType:", 9LL);
      -[RPIdentity updateWithRPMessage:error:](v16, "updateWithRPMessage:error:", v4, 0LL);
      sharedHomeExtraDeviceIdentities = self->_sharedHomeExtraDeviceIdentities;
      if (!sharedHomeExtraDeviceIdentities)
      {
        __int128 v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        unsigned __int8 v19 = self->_sharedHomeExtraDeviceIdentities;
        self->_sharedHomeExtraDeviceIdentities = v18;

        sharedHomeExtraDeviceIdentities = self->_sharedHomeExtraDeviceIdentities;
      }

      -[NSMutableArray addObject:](sharedHomeExtraDeviceIdentities, "addObject:", v16);
    }

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v37 = self;
    __int128 v20 = self->_sharedHomeDeviceIdentities;
    id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v38,  v46,  16LL);
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v39;
LABEL_18:
      id v24 = v4;
      uint64_t v25 = 0LL;
      while (1)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        id v26 = *(void **)(*((void *)&v38 + 1) + 8 * v25);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
        unsigned __int8 v28 = [v27 isEqual:v7];

        if ((v28 & 1) != 0) {
          break;
        }
        if (v22 == (id)++v25)
        {
          id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v38,  v46,  16LL);
          id v4 = v24;
          if (v22) {
            goto LABEL_18;
          }
          goto LABEL_24;
        }
      }

      id v29 = v26;

      id v4 = v24;
      if (!v29) {
        goto LABEL_30;
      }
      id v30 = [v29 updateWithRPMessage:v24 error:0];
      id v31 = v37;
      if ((_DWORD)v30)
      {
        if (dword_100132130 <= 30)
        {
          id v32 = v30;
          if (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)) {
            LogPrintF( &dword_100132130,  "-[RPIdentityDaemon addSharedHomeIdentityWithRPMessage:]",  30LL,  "Updated SharedHome identity extra: %@, %#{flags}\n",  v16,  v32,  &unk_10010A4CF);
          }
        }

        goto LABEL_37;
      }
    }

    else
    {
LABEL_24:

LABEL_30:
      id v31 = v37;
      sharedHomeDeviceIdentities = v37->_sharedHomeDeviceIdentities;
      if (!sharedHomeDeviceIdentities)
      {
        uint64_t v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v35 = v37->_sharedHomeDeviceIdentities;
        v37->_sharedHomeDeviceIdentities = v34;

        sharedHomeDeviceIdentities = v37->_sharedHomeDeviceIdentities;
      }

      -[NSMutableArray addObject:](sharedHomeDeviceIdentities, "addObject:", v16);
      if (dword_100132130 <= 30
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
      {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon addSharedHomeIdentityWithRPMessage:]",  30LL,  "Added SharedHome identity extra: %@\n",  v16);
      }

      id v29 = 0LL;
LABEL_37:
      unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
      [v36 postDaemonInfoChanges:512];

      -[RPIdentityDaemon _postIdentitiesChangedNotification](v31, "_postIdentitiesChangedNotification");
    }
  }
}

- (BOOL)removeIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 type];
  if (v7 > 0x10) {
    id v8 = "?";
  }
  else {
    id v8 = off_100113370[v7];
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    unsigned int v16 = [v6 type];
    if (v16 == 2) {
      uint64_t v17 = 0LL;
    }
    else {
      uint64_t v17 = 6LL;
    }
    if (v16 == 2) {
      uint64_t v18 = 3LL;
    }
    else {
      uint64_t v18 = 1LL;
    }
    id v19 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
    [v19 setAccessGroup:@"com.apple.rapport"];
    [v19 setAccessibleType:v17];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    [v19 setIdentifier:v20];

    [v19 setSyncType:v18];
    unsigned int v21 = [v6 type] - 1;
    if (v21 > 0xB) {
      id v22 = 0LL;
    }
    else {
      id v22 = off_100113310[v21];
    }
    [v19 setType:v22];
    id v23 = objc_alloc_init(&OBJC_CLASS___CUKeychainManager);
    id v29 = 0LL;
    unsigned __int8 v24 = [v23 removeItemMatchingItem:v19 error:&v29];
    id v25 = v29;
    if ((v24 & 1) != 0)
    {
      -[RPIdentityDaemon _postIdentitiesChangedNotification](self, "_postIdentitiesChangedNotification");
    }

    else
    {
      if (dword_100132130 <= 90
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
      {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon removeIdentity:error:]",  90LL,  "### RemoveIdentity keychain item failed: %@, %@, %{error}\n",  v6,  v19,  v25);
      }

      if (a4) {
        *a4 = v25;
      }
    }
  }

  else
  {
    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon removeIdentity:error:]",  30LL,  "Deferring RemoveIdentity until FirstUnlock (%@)\n",  v9);
    }

    if (a4)
    {
      id v26 = RPErrorF( 4294960593LL,  (uint64_t)"Account identity not removable before FirstUnlock",  v10,  v11,  v12,  v13,  v14,  v15,  v28);
      unsigned __int8 v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v26);
    }

    else
    {
      unsigned __int8 v24 = 0;
    }
  }

  return v24;
}

- (BOOL)saveIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 type];
  if (v7 > 0x10) {
    id v8 = "?";
  }
  else {
    id v8 = off_100113370[v7];
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    id v16 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
    [v16 setAccessGroup:@"com.apple.rapport"];
    [v16 setAccessibleType:6];
    [v16 setInvisible:1];
    [v16 setSyncType:1];
    id v24 = 0LL;
    unsigned __int8 v17 = [v16 updateWithRPIdentity:v6 revisionUpdate:1 error:&v24];
    id v18 = v24;
    if ((v17 & 1) != 0)
    {
      if (dword_100132130 <= 90
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
      {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon saveIdentity:error:]",  90LL,  "### Convert to keychain item failed: %@, %{error}\n",  v6,  v18);
      }

      LOBYTE(v20) = 0;
      if (a4) {
        *a4 = v18;
      }
    }

    else
    {
      id v19 = objc_alloc_init(&OBJC_CLASS___CUKeychainManager);
      unsigned int v20 = [v19 addOrUpdateOrReAddItem:v16 logCategory:&dword_100132130 logLabel:v9 error:a4];
      if (v20)
      {
        if ([v6 type] == 2)
        {
          if (dword_100132130 <= 30
            && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
          {
            LogPrintF( &dword_100132130,  "-[RPIdentityDaemon saveIdentity:error:]",  30LL,  "Reloading same account identities on save identity\n");
          }

          -[RPIdentityDaemon _updateSameAccountIdentities](self, "_updateSameAccountIdentities");
        }

        else
        {
          -[RPIdentityDaemon _postIdentitiesChangedNotification](self, "_postIdentitiesChangedNotification");
        }
      }
    }
  }

  else
  {
    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon saveIdentity:error:]",  30LL,  "Deferring SaveIdentity until FirstUnlock (%@)\n",  v9);
    }

    if (a4)
    {
      id v21 = RPErrorF( 4294960593LL,  (uint64_t)"Account identity not save-able before FirstUnlock",  v10,  v11,  v12,  v13,  v14,  v15,  v23);
      LOBYTE(v20) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v21);
    }

    else
    {
      LOBYTE(v20) = 0;
    }
  }

  return v20;
}

- (BOOL)saveIdentityWithIDSDeviceID:(id)a3 message:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 2LL, 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
LABEL_3:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
      unsigned __int8 v16 = [v15 isEqual:v7];

      if ((v16 & 1) != 0) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    unsigned __int8 v17 = v14;

    if (!v17) {
      goto LABEL_12;
    }
    int v18 = 0;
  }

  else
  {
LABEL_9:

LABEL_12:
    unsigned __int8 v17 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
    -[RPIdentity setIdentifier:](v17, "setIdentifier:", v7);
    -[RPIdentity setType:](v17, "setType:", 2LL);
    int v18 = 1;
  }

  else {
    int v19 = v18;
  }
  id v20 = (id)objc_claimAutoreleasedReturnValue(-[RPIdentity idsDeviceID](v17, "idsDeviceID"));
  id v21 = v7;
  id v22 = v21;
  if (v20 == v21)
  {

    if (!v19) {
      goto LABEL_22;
    }
LABEL_25:
    BOOL v24 = -[RPIdentityDaemon saveIdentity:error:](self, "saveIdentity:error:", v17, a5);
    goto LABEL_26;
  }

  if ((v21 != 0LL) == (v20 == 0LL))
  {

    goto LABEL_24;
  }

  unsigned __int8 v23 = [v20 isEqual:v21];

  if ((v23 & 1) == 0)
  {
LABEL_24:
    -[RPIdentity setIdsDeviceID:](v17, "setIdsDeviceID:", v22);
    goto LABEL_25;
  }

  if (v19) {
    goto LABEL_25;
  }
LABEL_22:
  BOOL v24 = 1;
LABEL_26:

  return v24;
}

- (void)addSessionPairedIdentity:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000632E0;
    v7[3] = &unk_100111968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
}

- (void)removeSessionPairedIdentityWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100063570;
  v7[3] = &unk_100111968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)updateSessionPairedIdentity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  if (v5)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100063828;
    block[3] = &unk_100111968;
    block[4] = self;
    id v8 = v4;
    dispatch_async(dispatchQueue, block);
  }

  else if (dword_100132130 <= 90 {
         && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
  }
  {
    LogPrintF( &dword_100132130,  "-[RPIdentityDaemon updateSessionPairedIdentity:]",  90LL,  "### Failed to update session paired identity, no identifeir: %@\n",  v4);
  }
}

- (void)addOrUpdateAdHocPairedIdentity:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100063B2C;
    v7[3] = &unk_100111968;
    id v8 = v4;
    id v9 = self;
    dispatch_async(dispatchQueue, v7);
  }
}

- (void)_ensureStarted
{
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    if (self->_homeViewChangeToken == -1)
    {
      if (dword_100132130 <= 30
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
      {
        LogPrintF(&dword_100132130, "-[RPIdentityDaemon _ensureStarted]", 30LL, "Start\n");
      }

      int v3 = objc_alloc(&OBJC_CLASS___NSString);
      id v4 = -[NSString initWithFormat:]( v3, "initWithFormat:", @"com.apple.security.view-change.%@", kSecAttrViewHintHome);
      id v5 = -[NSString UTF8String](v4, "UTF8String");
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10006404C;
      handler[3] = &unk_1001115C8;
      handler[4] = self;
      notify_register_dispatch(v5, &self->_homeViewChangeToken, dispatchQueue, handler);
      -[RPIdentityDaemon _updateSameAccountIdentities](self, "_updateSameAccountIdentities");
    }

    if (self->_homeViewReadyToken == -1)
    {
      id v7 = objc_alloc(&OBJC_CLASS___NSString);
      id v8 = -[NSString initWithFormat:]( v7, "initWithFormat:", @"com.apple.security.view-ready.%@", kSecAttrViewHintHome);
      id v9 = -[NSString UTF8String](v8, "UTF8String");
      id v10 = (dispatch_queue_s *)self->_dispatchQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000640D8;
      v13[3] = &unk_1001115C8;
      void v13[4] = self;
      notify_register_dispatch(v9, &self->_homeViewReadyToken, v10, v13);
    }

    if (self->_pairedDevicesNotifier == -1)
    {
      id v11 = (dispatch_queue_s *)self->_dispatchQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100064170;
      v12[3] = &unk_1001115C8;
      v12[4] = self;
      notify_register_dispatch("com.apple.pairing.peerChanged", &self->_pairedDevicesNotifier, v11, v12);
      -[RPIdentityDaemon _updatePairedDeviceIdentities](self, "_updatePairedDeviceIdentities");
    }

    if (!self->_selfIdentityCache) {
      -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 0LL);
    }
    if (!self->_temporarySelfIdentityCache) {
      -[RPIdentityDaemon _loadTemporarySelfIdentity](self, "_loadTemporarySelfIdentity");
    }
    if (-[RPIdentityDaemon _shouldLoadSharedTVUserDeviceIdentities](self, "_shouldLoadSharedTVUserDeviceIdentities"))
    {
      -[RPIdentityDaemon _loadSharedTVUserDeviceIdentities](self, "_loadSharedTVUserDeviceIdentities");
      self->_userIdentitiesChanged = 0;
    }
  }

  else if (dword_100132130 <= 30 {
         && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
  }
  {
    LogPrintF(&dword_100132130, "-[RPIdentityDaemon _ensureStarted]", 30LL, "Deferring start until FirstUnlock\n");
  }

- (void)_ensureStopped
{
  int homeViewChangeToken = self->_homeViewChangeToken;
  if (homeViewChangeToken != -1)
  {
    if (dword_100132130 > 30) {
      goto LABEL_7;
    }
    int homeViewChangeToken = self->_homeViewChangeToken;
    if (homeViewChangeToken != -1)
    {
LABEL_7:
      notify_cancel(homeViewChangeToken);
      self->_int homeViewChangeToken = -1;
    }
  }

  int homeViewReadyToken = self->_homeViewReadyToken;
  if (homeViewReadyToken != -1)
  {
    if (dword_100132130 > 30) {
      goto LABEL_14;
    }
    int homeViewReadyToken = self->_homeViewReadyToken;
    if (homeViewReadyToken != -1)
    {
LABEL_14:
      notify_cancel(homeViewReadyToken);
      self->_int homeViewReadyToken = -1;
    }
  }

  -[CUCoalescer invalidate](self->_identitiesChangedCoalescer, "invalidate");
  identitiesChangedCoalescer = self->_identitiesChangedCoalescer;
  self->_identitiesChangedCoalescer = 0LL;

  pairedDeviceIdentities = self->_pairedDeviceIdentities;
  self->_pairedDeviceIdentities = 0LL;

  int pairedDevicesNotifier = self->_pairedDevicesNotifier;
  if (pairedDevicesNotifier != -1)
  {
    notify_cancel(pairedDevicesNotifier);
    self->_int pairedDevicesNotifier = -1;
  }

  sameAccountDeviceIdentities = self->_sameAccountDeviceIdentities;
  self->_sameAccountDeviceIdentities = 0LL;

  sharedHomeDeviceIdentities = self->_sharedHomeDeviceIdentities;
  self->_sharedHomeDeviceIdentities = 0LL;

  sharedHomeExtraDeviceIdentities = self->_sharedHomeExtraDeviceIdentities;
  self->_sharedHomeExtraDeviceIdentities = 0LL;

  sharedTVUserDeviceIdentities = self->_sharedTVUserDeviceIdentities;
  self->_sharedTVUserDeviceIdentities = 0LL;

  adHocPairedDeviceIdentities = self->_adHocPairedDeviceIdentities;
  self->_adHocPairedDeviceIdentities = 0LL;

  selfIdentityCache = self->_selfIdentityCache;
  self->_selfIdentityCache = 0LL;

  temporarySelfIdentityCache = self->_temporarySelfIdentityCache;
  self->_temporarySelfIdentityCache = 0LL;

  temporarySelfIdentityTimer = self->_temporarySelfIdentityTimer;
  if (temporarySelfIdentityTimer)
  {
    unsigned __int8 v17 = temporarySelfIdentityTimer;
    dispatch_source_cancel(v17);
    unsigned __int8 v16 = self->_temporarySelfIdentityTimer;
    self->_temporarySelfIdentityTimer = 0LL;
  }

- (void)_postIdentitiesChangedNotification
{
  identitiesChangedCoalescer = self->_identitiesChangedCoalescer;
  if (!identitiesChangedCoalescer)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___CUCoalescer);
    id v5 = self->_identitiesChangedCoalescer;
    self->_identitiesChangedCoalescer = v4;

    -[CUCoalescer setDispatchQueue:](self->_identitiesChangedCoalescer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUCoalescer setMinDelay:](self->_identitiesChangedCoalescer, "setMinDelay:", 0.3);
    -[CUCoalescer setMaxDelay:](self->_identitiesChangedCoalescer, "setMaxDelay:", 1.0);
    -[CUCoalescer setActionHandler:](self->_identitiesChangedCoalescer, "setActionHandler:", &stru_100113178);
    identitiesChangedCoalescer = self->_identitiesChangedCoalescer;
  }

  -[CUCoalescer trigger](identitiesChangedCoalescer, "trigger");
}

- (void)_triggerKeychainRefetch
{
  uint64_t v3 = mach_absolute_time();
  unint64_t v4 = UpTicksToSeconds(v3 - self->_keychainRefetchTicks);
  if (v4 >> 5 > 0x2A2)
  {
    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon _triggerKeychainRefetch]", 30LL, "Keychain refetch start\n");
    }

    self->_keychainRefetchTicks = v3;
    id v8 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](&OBJC_CLASS___CKKSControl, "controlObject:", &v8));
    id v7 = v8;
    if (v6)
    {
      [v6 rpcFetchAndProcessChanges:kSecAttrViewHintHome reply:&stru_100113198];
    }

    else if (dword_100132130 <= 90 {
           && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
    }
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _triggerKeychainRefetch]",  90LL,  "### CKKSControl failed: %{error}\n",  v7);
    }
  }

  else if (dword_100132130 <= 30)
  {
    unint64_t v5 = v4;
    if (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)) {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _triggerKeychainRefetch]",  30LL,  "Triggering Keychain refetch too soon: %ll{dur} to go\n",  21600 - v5);
    }
  }

- (void)_updatePairedDeviceIdentities
{
  id v3 = objc_alloc_init(&OBJC_CLASS___CUPairingManager);
  [v3 setDispatchQueue:self->_dispatchQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000647A8;
  v4[3] = &unk_1001131C0;
  v4[4] = v3;
  v4[5] = self;
  [v3 getPairedPeersWithOptions:134 completion:v4];
}

- (void)_updateSameAccountIdentities
{
  id v56 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon _identitiesOfType:error:](self, "_identitiesOfType:error:", 2LL, &v56));
  id v4 = v56;
  if (v4)
  {
    if (dword_100132130 <= 90
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _updateSameAccountIdentities]",  90LL,  "### Get same account device identities failed: %{error}\n",  v4);
    }

    goto LABEL_84;
  }

  id v33 = self;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  location = (id *)&self->_sameAccountDeviceIdentities;
  unint64_t v5 = self->_sameAccountDeviceIdentities;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v52,  v60,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v53;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v52 + 1) + 8 * (void)i) setPresent:0];
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v52,  v60,  16LL);
    }

    while (v7);
  }

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  uint64_t v34 = v3;
  id obj = v3;
  id v10 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v10)
  {
    id v11 = v10;
    int v36 = 0;
    int v37 = 0;
    uint64_t v38 = *(void *)v49;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)j);
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        id v14 = *location;
        id v15 = [v14 countByEnumeratingWithState:&v44 objects:v58 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v45;
          while (2)
          {
            for (k = 0LL; k != v16; k = (char *)k + 1)
            {
              if (*(void *)v45 != v17) {
                objc_enumerationMutation(v14);
              }
              int v19 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)k);
              unsigned int v20 = [v19 compareWithRPIdentity:v13];
              if ((v20 & 0x220) == 0)
              {
                unsigned int v21 = v20;
                [v19 setPresent:1];
                if (v21)
                {
                  ++v36;
                  if (dword_100132130 <= 30
                    && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
                  {
                    LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _updateSameAccountIdentities]",  30LL,  "Updated same account identity: %@\n",  v13);
                  }
                }

                goto LABEL_36;
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v44 objects:v58 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        ++v37;
        if (dword_100132130 <= 30
          && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
        {
          LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _updateSameAccountIdentities]",  30LL,  "Added same account identity: %@\n",  v13);
        }

- (BOOL)_removeSameAccountIdentityWithIDSIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v38 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon _identitiesOfType:error:](self, "_identitiesOfType:error:", 2LL, &v38));
  id v8 = v38;
  if (v8)
  {
    id v9 = v8;
    if (dword_100132130 <= 90
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _removeSameAccountIdentityWithIDSIdentifier:error:]",  90LL,  "### Get same account device identities failed: %{error}\n",  v9);
    }

    char v20 = 0;
    BOOL v27 = 0;
    if (a4)
    {
LABEL_27:
      id v9 = v9;
      *a4 = v9;
      BOOL v27 = v20;
    }
  }

  else
  {
    BOOL v31 = v7;
    id v32 = a4;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0LL;
      uint64_t v14 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v10);
          }
          id v16 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 idsDeviceID]);
          unsigned int v18 = [v17 isEqualToString:v6];

          if (v18)
          {
            id v33 = v13;
            unsigned __int8 v19 = -[RPIdentityDaemon removeIdentity:error:](self, "removeIdentity:error:", v16, &v33);
            id v9 = v33;

            if ((v19 & 1) != 0)
            {
              char v20 = 1;
              uint64_t v13 = v10;
              goto LABEL_31;
            }

            if (dword_100132130 <= 90
              && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
            {
              LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _removeSameAccountIdentityWithIDSIdentifier:error:]",  90LL,  "### Failed to remove matching same account device",  v9);
            }

            uint64_t v13 = v9;
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    if (dword_100132130 <= 90
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _removeSameAccountIdentityWithIDSIdentifier:error:]",  90LL,  "### Failed to find matching same account device");
    }

    id v29 = RPErrorF(4294960569LL, (uint64_t)"Identity not found", v21, v22, v23, v24, v25, v26, v30);
    id v9 = (id)objc_claimAutoreleasedReturnValue(v29);
    char v20 = 0;
LABEL_31:
    id v7 = v31;
    a4 = v32;

    BOOL v27 = v20;
    if (v32) {
      goto LABEL_27;
    }
  }

  return v27;
}

- (void)_loadSelfIdentity:(BOOL)a3
{
  if (a3) {
    goto LABEL_31;
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
  [v4 setAccessGroup:@"com.apple.rapport"];
  [v4 setIdentifier:@"SelfIdentity"];
  [v4 setSyncType:1];
  [v4 setType:@"RPIdentity-Self"];
  id v5 = objc_alloc_init(&OBJC_CLASS___CUKeychainManager);
  id v16 = 0LL;
  id v6 = [v5 copyItemMatchingItem:v4 flags:1 error:&v16];
  id v7 = v16;
  id v8 = v7;
  if (v6)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
    id v15 = v8;
    -[RPIdentity updateWithKeychainItem:error:](v9, "updateWithKeychainItem:error:", v6, &v15);
    id v10 = v15;

    if (v10
      && dword_100132130 <= 60
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 60LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _loadSelfIdentity:]",  60LL,  "### Convert SelfIdentity from keychain failed: %{error}\n",  v10);
    }

    unsigned int v11 = -[RPIdentityDaemon _updateSelfIdentityPrivate:create:](self, "_updateSelfIdentityPrivate:create:", v9, 0LL);
    if ((v11 & 1) != 0)
    {

      id v9 = 0LL;
    }

    else if (!v11)
    {
      if (dword_100132130 <= 30
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
      {
        LogPrintF(&dword_100132130, "-[RPIdentityDaemon _loadSelfIdentity:]", 30LL, "SelfIdentity private unchanged\n");
      }

      int v12 = 0;
      goto LABEL_27;
    }

    int v12 = 1;
    goto LABEL_27;
  }

  if ([v7 code] != (id)-25300
    && dword_100132130 <= 90
    && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
  {
    LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _loadSelfIdentity:]",  90LL,  "### SelfIdentity find failed: %{error}\n",  v8);
  }

  id v9 = 0LL;
  int v12 = 0;
  id v10 = v8;
LABEL_27:

  if (!v9)
  {
LABEL_31:
    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon _loadSelfIdentity:]", 30LL, "SelfIdentity create\n");
    }

    id v9 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
    -[RPIdentity setIdentifier:](v9, "setIdentifier:", @"SelfIdentity");
    -[RPIdentity setType:](v9, "setType:", 1LL);
    -[RPIdentityDaemon _updateSelfIdentityPrivate:create:](self, "_updateSelfIdentityPrivate:create:", v9, 1LL);
    goto LABEL_36;
  }

  if (v12)
  {
LABEL_36:
    objc_storeStrong((id *)&self->_selfIdentityCache, v9);
    -[RPIdentityDaemon _saveSelfIdentityPrivate:](self, "_saveSelfIdentityPrivate:", v9);
    -[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]( self,  "_saveSelfIdentityPublicWithPrivateIdentity:force:",  v9,  0LL);
LABEL_37:
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
    [v14 postDaemonInfoChanges:4];

    -[RPIdentityDaemon _postIdentitiesChangedNotification](self, "_postIdentitiesChangedNotification");
    -[RPIdentityDaemon _update](self, "_update");
    goto LABEL_38;
  }

  selfIdentityCache = self->_selfIdentityCache;
  objc_storeStrong((id *)&self->_selfIdentityCache, v9);
  -[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]( self,  "_saveSelfIdentityPublicWithPrivateIdentity:force:",  v9,  0LL);
  if (!selfIdentityCache) {
    goto LABEL_37;
  }
LABEL_38:
}

- (void)_saveSelfIdentityPrivate:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
  [v4 setAccessGroup:@"com.apple.rapport"];
  [v4 setAccessibleType:6];
  [v4 setInvisible:1];
  [v4 setSyncType:1];
  id v10 = 0LL;
  unsigned __int8 v5 = [v4 updateWithRPIdentity:v3 revisionUpdate:1 error:&v10];
  id v6 = v10;
  if ((v5 & 1) != 0)
  {
    if (dword_100132130 <= 90
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _saveSelfIdentityPrivate:]",  90LL,  "### SelfIdentity private convert to keychain failed: %@, %{error}\n",  v3,  v6);
    }

    id v8 = v6;
  }

  else
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___CUKeychainManager);
    id v9 = v6;
    [v7 addOrUpdateOrReAddItem:v4 logCategory:&dword_100132130 logLabel:@"SelfIdentity private" error:&v9];
    id v8 = v9;

    if (v8)
    {
      if (dword_100132130 <= 90
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
      {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _saveSelfIdentityPrivate:]",  90LL,  "### SelfIdentity private save failed: %@, %{error}\n",  v4,  v8);
      }
    }

    else if (dword_100132130 <= 30 {
           && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    }
    {
      LogPrintF(&dword_100132130, "-[RPIdentityDaemon _saveSelfIdentityPrivate:]", 30LL, "SelfIdentity private saved\n");
    }
  }
}

- (void)_saveSelfIdentityPublicWithPrivateIdentity:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDeviceID]);
  if (v7)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
    [v8 setAccessGroup:@"com.apple.rapport"];
    [v8 setIdentifier:v7];
    [v8 setSyncType:2];
    [v8 setType:@"RPIdentity-SameAccountDevice"];
    uint64_t v9 = kSecAttrViewHintHome;
    [v8 setViewHint:kSecAttrViewHintHome];
    id v26 = 0LL;
    id v22 = objc_alloc_init(&OBJC_CLASS___CUKeychainManager);
    id v10 = [v22 copyItemMatchingItem:v8 flags:1 error:&v26];
    id v11 = v26;
    int v12 = v11;
    uint64_t v21 = v10;
    if (v10)
    {
      uint64_t v13 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
      id v25 = v12;
      -[RPIdentity updateWithKeychainItem:error:](v13, "updateWithKeychainItem:error:", v10, &v25);
      id v14 = v25;

      if (v14
        && dword_100132130 <= 60
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 60LL)))
      {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]",  60LL,  "### Convert SelfIdentity public from keychain failed: %{error}\n",  v14);
      }

      unsigned int v15 = -[RPIdentityDaemon _updateSelfIdentityPublic:privateIdentity:]( self,  "_updateSelfIdentityPublic:privateIdentity:",  v13,  v6);
      if ((v15 & 1) != 0)
      {

        int v12 = v14;
      }

      else
      {
        int v12 = v14;
        if (v13)
        {
LABEL_26:
          char v20 = self;
          if (v4) {
            uint64_t v16 = v15 | 0x1000;
          }
          else {
            uint64_t v16 = v15;
          }
          if ((_DWORD)v16)
          {
            id v17 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
            [v17 setAccessGroup:@"com.apple.rapport"];
            [v17 setAccessibleType:2];
            [v17 setInvisible:1];
            [v17 setSyncType:2];
            [v17 setViewHint:v9];
            id v24 = v14;
            unsigned __int8 v18 = [v17 updateWithRPIdentity:v13 revisionUpdate:1 error:&v24];
            id v19 = v24;

            if ((v18 & 1) != 0)
            {
              if (dword_100132130 <= 90
                && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
              {
                LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]",  90LL,  "### SelfIdentity public convert to keychain failed: %@, %{error}\n",  v13,  v19);
              }
            }

            else
            {

              id v23 = 0LL;
              [v22 addOrUpdateOrReAddItem:v17 logCategory:&dword_100132130 logLabel:@"SelfIdentity public" error:&v23];
              id v19 = v23;
              if (v19)
              {
                if (dword_100132130 <= 90
                  && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
                {
                  LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]",  90LL,  "### SelfIdentity public save failed: %@, %{error}\n",  v17,  v19);
                }
              }

              else if (dword_100132130 <= 30 {
                     && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
              }
              {
                LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]",  30LL,  "SelfIdentity public saved: %#{flags}\n",  v16,  &unk_10010A4CF);
              }

              -[RPIdentityDaemon _updateSameAccountIdentities](v20, "_updateSameAccountIdentities");
            }

            id v14 = v19;
          }

          else if (dword_100132130 <= 30 {
                 && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
          }
          {
            LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]",  30LL,  "SelfIdentity public unchanged\n");
          }

          goto LABEL_56;
        }
      }
    }

    else if ([v11 code] != (id)-25300)
    {
      if (dword_100132130 > 90)
      {
LABEL_25:
        uint64_t v13 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
        -[RPIdentity setIdentifier:](v13, "setIdentifier:", v7);
        -[RPIdentity setType:](v13, "setType:", 2LL);
        -[RPIdentityDaemon _updateSelfIdentityPublic:privateIdentity:]( self,  "_updateSelfIdentityPublic:privateIdentity:",  v13,  v6);
        unsigned int v15 = 2048;
        id v14 = v12;
        goto LABEL_26;
      }

      if (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)) {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]",  90LL,  "### SelfIdentity public find error: %{error}\n",  v12);
      }
    }

    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]",  30LL,  "SelfIdentity public create\n");
    }

    goto LABEL_25;
  }

  if (dword_100132130 <= 90 && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL))) {
    LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]",  90LL,  "### SelfIdentity save public failed without IDSDeviceID\n");
  }
LABEL_56:
}

- (void)_removeSelfIdentityPublicWithPrivateIdentity:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 idsDeviceID]);
  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
    [v5 setAccessGroup:@"com.apple.rapport"];
    [v5 setIdentifier:v4];
    [v5 setSyncType:2];
    [v5 setType:@"RPIdentity-SameAccountDevice"];
    [v5 setViewHint:kSecAttrViewHintHome];
    id v6 = objc_alloc_init(&OBJC_CLASS___CUKeychainManager);
    id v8 = 0LL;
    [v6 removeItemMatchingItem:v5 error:&v8];
    id v7 = v8;
    if ([v7 code] == (id)-25300)
    {
      if (dword_100132130 <= 30
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
      {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _removeSelfIdentityPublicWithPrivateIdentity:]",  30LL,  "SelfIdentity public removed: %s\n");
      }
    }

    else if (dword_100132130 <= 90 {
           && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
    }
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _removeSelfIdentityPublicWithPrivateIdentity:]",  90LL,  "### SelfIdentity public find error: %{error}\n",  v7);
    }

    -[RPIdentityDaemon _updateSameAccountIdentities](self, "_updateSameAccountIdentities");
  }

  else if (dword_100132130 <= 90 {
         && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
  }
  {
    LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _removeSelfIdentityPublicWithPrivateIdentity:]",  90LL,  "### SelfIdentity save public failed without IDSDeviceID\n");
  }
}

- (void)_loadTemporarySelfIdentity
{
}

- (BOOL)_stationaryDevice
{
  int DeviceClass = GestaltGetDeviceClass(self, a2);
  BOOL v3 = sub_10000AA10(DeviceClass);
  BOOL v4 = (void *)GestaltCopyAnswer(@"ProductType", 0LL, 0LL);
  else {
    LOBYTE(v5) = 0;
  }
  char v6 = v3 | v5;

  return v6;
}

- (unsigned)_updateSelfIdentityPrivate:(id)a3 create:(BOOL)a4
{
  id v5 = a3;
  char v6 = (void *)objc_claimAutoreleasedReturnValue( +[RPCompanionLinkDaemon sharedCompanionLinkDaemon]( &OBJC_CLASS___RPCompanionLinkDaemon,  "sharedCompanionLinkDaemon"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localDeviceInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountAltDSID]);

  if (v8 && (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accountAltDSID]), v9, !v9))
  {
    [v5 setAccountAltDSID:v8];
    uint64_t v10 = 0x2000000LL;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[RPCompanionLinkDaemon sharedCompanionLinkDaemon]( &OBJC_CLASS___RPCompanionLinkDaemon,  "sharedCompanionLinkDaemon"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localDeviceInfo]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accountID]);

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 accountID]);

    if (!v14)
    {
      [v5 setAccountID:v13];
      uint64_t v10 = v10 | 0x2000;
    }
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceID]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 idsDeviceIDSelf]);

  if (!v17)
  {
LABEL_15:
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceIRKData]);
    id v23 = [v22 length];

    if (v23 != (id)16)
    {
      uint64_t v24 = NSRandomData(16LL, 0LL);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      [v5 setDeviceIRKData:v25];

      uint64_t v10 = v10 | 4;
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 edPKData]);
    if ([v26 length] == (id)32)
    {
      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v5 edSKData]);
      id v28 = [v27 length];

      if (v28 == (id)32) {
        goto LABEL_22;
      }
    }

    else
    {
    }

    cced25519_make_key_pair_compat(v49, v48);
    id v29 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v49, 32LL);
    [v5 setEdPKData:v29];

    uint64_t v30 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v48, 32LL);
    [v5 setEdSKData:v30];

    uint64_t v10 = v10 | 0x18;
LABEL_22:
    id v31 = [v5 featureFlags];
    unsigned int DeviceClass = GestaltGetDeviceClass(v31, v32);
    unsigned int v34 = DeviceClass;
    unsigned int v35 = DeviceClass - 1;
    unint64_t v36 = DeviceClass - 1 < 3 || DeviceClass == 100;
    if (DeviceClass <= 6 && ((1 << DeviceClass) & 0x4E) != 0 || DeviceClass == 100) {
      v36 |= 2uLL;
    }
    int v37 = _os_feature_enabled_impl("Sharing", "AirDropPrivateContactDiscovery");
    if (v35 < 3 || v34 == 100 && v37)
    {
      int v38 = _os_feature_enabled_impl("Sharing", "AirDropFeatureFlags");
      uint64_t v39 = 8LL;
      if (v38) {
        uint64_t v39 = 24LL;
      }
      v36 |= v39;
    }

    if (v36 && (id)v36 != v31)
    {
      [v5 setFeatureFlags:v36];
      uint64_t v10 = v10 | 0x400;
    }

    if (-[RPIdentityDaemon _stationaryDevice](self, "_stationaryDevice"))
    {
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v5 btIRKData]);
      if ([v40 length] == (id)16)
      {
        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v5 btAddress]);
        id v42 = [v41 length];

        if (v42 == (id)7) {
          goto LABEL_41;
        }
      }

      else
      {
      }

      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( -[CBPeripheralManager getNonConnectableIdentity]( self->_peripheralManager,  "getNonConnectableIdentity"));
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"kCBMsgArgIdentityIRK"]);
      [v5 setBtIRKData:v44];

      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"kCBMsgArgIdentityAddress"]);
      [v5 setBtAddress:v45];

      uint64_t v10 = v10 | 0xC00000;
LABEL_45:
      if (dword_100132130 <= 30
        && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
      {
        LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _updateSelfIdentityPrivate:create:]",  30LL,  "SelfIdentity updated: %#{flags}\n",  v10,  &unk_10010A4CF);
      }

      goto LABEL_57;
    }

- (unsigned)_updateSelfIdentityPublic:(id)a3 privateIdentity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[RPCompanionLinkDaemon sharedCompanionLinkDaemon]( &OBJC_CLASS___RPCompanionLinkDaemon,  "sharedCompanionLinkDaemon"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localDeviceInfo]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountAltDSID]);
  if (v9
    && (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 accountAltDSID]), v10, !v10))
  {
    [v5 setAccountAltDSID:v9];
    unsigned int v11 = 0x2000000;
  }

  else
  {
    unsigned int v11 = 0;
  }

  __int128 v64 = (void *)objc_claimAutoreleasedReturnValue([v8 accountID]);
  if (v64)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 accountID]);

    if (!v12)
    {
      [v5 setAccountID:v64];
      v11 |= 0x2000u;
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIRKData]);
  if (v13)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue([v5 deviceIRKData]);
    id v15 = v13;
    uint64_t v16 = v15;
    if (v14 == v15)
    {

      goto LABEL_16;
    }

    if (v14)
    {
      unsigned __int8 v17 = [v14 isEqual:v15];

      if ((v17 & 1) != 0) {
        goto LABEL_16;
      }
    }

    else
    {
    }

    [v5 setDeviceIRKData:v16];
    v11 |= 4u;
  }

- (BOOL)_shouldLoadSharedTVUserDeviceIdentities
{
  return self->_userIdentitiesChanged && GestaltGetDeviceClass() == 4;
}

- (void)_loadSharedTVUserDeviceIdentities
{
  if (self->_initialUserPersonaContext)
  {
    if (dword_100132130 <= 30
      && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _loadSharedTVUserDeviceIdentities]",  30LL,  "Already adopting a persona, skip doing it again.\n");
    }
  }

  else if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    BOOL v3 = self->_selfIdentityCache;
    if (v3)
    {
      id v4 = [(Class)off_1001321C0[0]() currentPersona];
      id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      id v14 = 0LL;
      id v6 = (UMUserPersonaContext *)[v5 copyCurrentPersonaContextWithError:&v14];
      id v7 = v14;
      initialUserPersonaContext = self->_initialUserPersonaContext;
      self->_initialUserPersonaContext = v6;

      if (!self->_initialUserPersonaContext || v7)
      {
        if (dword_100132130 <= 90
          && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 90LL)))
        {
          LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _loadSharedTVUserDeviceIdentities]",  90LL,  "### Failed to save the state of current persona with error: %@\n",  v7);
        }
      }

      else
      {
        if (dword_100132130 <= 30
          && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
        {
          LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _loadSharedTVUserDeviceIdentities]",  30LL,  "Saved current persona, adopting other persona\n");
        }

        id v9 = [(Class)off_1001321C8[0]() sharedManager];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_100066FA4;
        v11[3] = &unk_100113210;
        v11[4] = self;
        id v12 = v5;
        uint64_t v13 = v3;
        [v10 fetchAllPersonasWithCompletionHandler:v11];
      }
    }

    else if (dword_100132130 <= 30 {
           && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
    }
    {
      LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _loadSharedTVUserDeviceIdentities]",  30LL,  "Deferring SharedTVUser identities get until self identity is available\n");
    }
  }

  else if (dword_100132130 <= 30 {
         && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL)))
  }
  {
    LogPrintF( &dword_100132130,  "-[RPIdentityDaemon _loadSharedTVUserDeviceIdentities]",  30LL,  "Deferring SharedTVUser identities get until FirstUnlock\n");
  }

- (void)updateSharedTVIdentities
{
  if (dword_100132130 <= 30 && (dword_100132130 != -1 || _LogCategory_Initialize(&dword_100132130, 30LL))) {
    LogPrintF( &dword_100132130,  "-[RPIdentityDaemon updateSharedTVIdentities]",  30LL,  "Shared TV user list updated, reloading identities\n");
  }
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100067AE8;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_enumerateIdentitiesWithFlag:(unsigned int)a3 usingBlock:(id)a4
{
  __int16 v4 = a3;
  id v6 = (void (**)(id, void, char *))a4;
  char v72 = 0;
  if ((v4 & 2) != 0)
  {
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    id v7 = self->_sameAccountDeviceIdentities;
    id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v68,  v80,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v69;
LABEL_4:
      uint64_t v11 = 0LL;
      while (1)
      {
        if (*(void *)v69 != v10) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v68 + 1) + 8 * v11), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v9 == (id)++v11)
        {
          id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v68,  v80,  16LL);
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }

  if ((v4 & 0x100) != 0)
  {
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 9LL, 0LL));
    id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v64,  v79,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v65;
LABEL_14:
      uint64_t v15 = 0LL;
      while (1)
      {
        if (*(void *)v65 != v14) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v64 + 1) + 8 * v15), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v13 == (id)++v15)
        {
          id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v64,  v79,  16LL);
          if (v13) {
            goto LABEL_14;
          }
          break;
        }
      }
    }
  }

  if ((v4 & 8) != 0)
  {
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 4LL, 0LL));
    id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v60,  v78,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v61;
LABEL_24:
      uint64_t v19 = 0LL;
      while (1)
      {
        if (*(void *)v61 != v18) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v60 + 1) + 8 * v19), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v17 == (id)++v19)
        {
          id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v60,  v78,  16LL);
          if (v17) {
            goto LABEL_24;
          }
          break;
        }
      }
    }
  }

  if ((v4 & 0x20) != 0)
  {
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 6LL, 0LL));
    id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v56,  v77,  16LL);
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v57;
LABEL_34:
      uint64_t v23 = 0LL;
      while (1)
      {
        if (*(void *)v57 != v22) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v56 + 1) + 8 * v23), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v21 == (id)++v23)
        {
          id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v56,  v77,  16LL);
          if (v21) {
            goto LABEL_34;
          }
          break;
        }
      }
    }
  }

  if ((v4 & 0x400) != 0)
  {
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 12LL, 0LL));
    id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v52,  v76,  16LL);
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v53;
LABEL_44:
      uint64_t v27 = 0LL;
      while (1)
      {
        if (*(void *)v53 != v26) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v52 + 1) + 8 * v27), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v25 == (id)++v27)
        {
          id v25 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v52,  v76,  16LL);
          if (v25) {
            goto LABEL_44;
          }
          break;
        }
      }
    }
  }

  if ((v4 & 0x80) != 0)
  {
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 8LL, 0LL));
    id v28 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v48,  v75,  16LL);
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v49;
LABEL_54:
      uint64_t v31 = 0LL;
      while (1)
      {
        if (*(void *)v49 != v30) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v48 + 1) + 8 * v31), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v29 == (id)++v31)
        {
          id v29 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v48,  v75,  16LL);
          if (v29) {
            goto LABEL_54;
          }
          break;
        }
      }
    }
  }

  if ((v4 & 0x800) != 0)
  {
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 13LL, 0LL));
    id v32 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v44,  v74,  16LL);
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v45;
LABEL_64:
      uint64_t v35 = 0LL;
      while (1)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v44 + 1) + 8 * v35), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v33 == (id)++v35)
        {
          id v33 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v44,  v74,  16LL);
          if (v33) {
            goto LABEL_64;
          }
          break;
        }
      }
    }
  }

  if ((v4 & 0x4000) != 0)
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 15LL, 0LL, 0LL));
    id v36 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v40,  v73,  16LL);
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v41;
LABEL_74:
      uint64_t v39 = 0LL;
      while (1)
      {
        if (*(void *)v41 != v38) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v40 + 1) + 8 * v39), &v72);
        if (v72) {
          break;
        }
        if (v37 == (id)++v39)
        {
          id v37 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v40,  v73,  16LL);
          if (v37) {
            goto LABEL_74;
          }
          break;
        }
      }
    }

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPIdentity)homeKitIdentity
{
  return self->_homeKitIdentity;
}

- (NSUUID)sessionPairingIdentifier
{
  return self->_sessionPairingIdentifier;
}

- (NSUUID)adHocPairingIdentifier
{
  return self->_adHocPairingIdentifier;
}

- (void).cxx_destruct
{
}

@end